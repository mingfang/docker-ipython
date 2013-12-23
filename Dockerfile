FROM ubuntu
 
RUN echo 'deb http://archive.ubuntu.com/ubuntu precise main universe' > /etc/apt/sources.list && \
    echo 'deb http://archive.ubuntu.com/ubuntu precise-updates universe' >> /etc/apt/sources.list && \
    apt-get update

#Prevent daemon start during install
RUN dpkg-divert --local --rename --add /sbin/initctl && ln -s /bin/true /sbin/initctl

#Supervisord
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y supervisor && mkdir -p /var/log/supervisor
CMD ["/usr/bin/supervisord", "-n"]

#SSHD
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server &&	mkdir /var/run/sshd && \
	echo 'root:root' |chpasswd

#Utilities
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim less net-tools inetutils-ping curl git telnet nmap socat dnsutils netcat

#Required by Python packages
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential python-dev python-pip liblapack-dev libatlas-dev gfortran libfreetype6 libfreetype6-dev libpng12-dev python-lxml libyaml-dev g++ libffi-dev

#0MQ
RUN cd /tmp && \
    wget http://download.zeromq.org/zeromq-4.0.3.tar.gz && \
    tar xvfz zeromq-4.0.3.tar.gz && \
    cd zeromq-4.0.3 && \
    ./configure && \
    make install && \
    ldconfig

#Upgrade pip
RUN pip install -U pip
#matplotlib needs latest distribute
RUN pip install -U distribute
#IPython
RUN pip install ipython
ENV IPYTHONDIR /ipython
RUN mkdir /ipython && \
    ipython profile create nbserver
#NumPy v1.7.1 is required for Numba
RUN pip install numpy==1.7.1
#Pandas
RUN pip install pandas
#Optional
RUN pip install cython
RUN pip install jinja2 pyzmq tornado
RUN pip install numexpr bottleneck scipy pygments matplotlib sympy pymc
RUN pip install patsy
RUN pip install statsmodels
RUN pip install beautifulsoup4 html5lib
#Pattern
RUN pip install pattern
#NLTK
RUN pip install pyyaml nltk
#Networkx
RUN pip install networkx
#LLVM and Numba
RUN cd /tmp && \
    wget http://llvm.org/releases/3.2/llvm-3.2.src.tar.gz && \
    tar zxvf llvm-3.2.src.tar.gz && \
    cd llvm-3.2.src && \
    ./configure --enable-optimized && \
    REQUIRES_RTTI=1 make install && \
    pip install llvmpy && \
    pip install llvmmath && \
    pip install numba
#Biopython
RUN pip install biopython
#Bokeh
#RUN pip install requests bokeh

#Install R 3+
RUN echo 'deb http://cran.rstudio.com/bin/linux/ubuntu precise/' > /etc/apt/sources.list.d/r.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
RUN apt-get update
RUN apt-get install -y r-base
#Rmagic
RUN pip install rpy2

ADD supervisord-ssh.conf /etc/supervisor/conf.d/
ADD supervisord-ipython.conf /etc/supervisor/conf.d/

EXPOSE 22 8888
