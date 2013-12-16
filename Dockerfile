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
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential python-dev python-pip liblapack-dev libatlas-dev gfortran libfreetype6-dev libpng-dev libjpeg8-dev python-lxml libyaml-dev libzmq-dev

#IPython
RUN pip install -U ipython
ENV IPYTHONDIR /ipython
RUN mkdir /ipython && \
    ipython profile create nbserver
#Pandas
RUN pip install -U pandas
#Pandas Optional
RUN pip install -U distribute
RUN pip install -U cython
RUN pip install -U jinja2 pyzmq tornado
RUN pip install -U numexpr bottleneck scipy matplotlib sympy pymc
RUN pip install -U patsy
RUN pip install -U statsmodels
RUN pip install -U beautifulsoup4 html5lib
#Pattern
RUN pip install -U pattern
#NLTK
RUN pip install -U pyyaml nltk


ADD supervisord-ssh.conf /etc/supervisor/conf.d/
ADD supervisord-ipython.conf /etc/supervisor/conf.d/

EXPOSE 22 8888
