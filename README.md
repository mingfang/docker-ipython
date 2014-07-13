docker-ipython
==============

Run [IPython](http://ipython.org) inside [Docker](http://www.docker.io)

####Includes:
* [Pattern](http://www.clips.ua.ac.be/pattern)
* [NLTK](http://nltk.org)
* [Pandas](http://pandas.pydata.org)
* [NumPy](http://www.numpy.org)
* [SciPy](http://scipy.org) 
* [SymPy](http://sympy.org)
* [Cython](http://cython.org)
* [Numba](http://numba.pydata.org)
* [Biopython](http://biopython.org)
* [Rmagic](http://ipython.org/ipython-doc/dev/config/extensions/rmagic.html)

####Instructions
1. Build Docker image using the using ```build```.  This can take a long time, ~30mins.  Luckily this step only has to done once(or whenever you change the Dockerfile).
2. Create and shell into new Docker container using ```shell``
3. Start IPython Notebook using ```runsvdir-start&```
4. Point your brower to ```http://<your host name>:49888```

####Version Detail
```
>pip freeze

Bottleneck==0.8.0
Cython==0.20.2
Jinja2==2.7.3
MarkupSafe==0.23
PyYAML==3.11
Pygments==1.6
argparse==1.2.1
backports.ssl-match-hostname==3.4.0.2
beautifulsoup4==4.3.2
biopython==1.64
chardet==2.0.1
colorama==0.2.5
decorator==3.4.0
html5lib==0.999
ipython==2.1.0
llvmmath==0.1.1
llvmpy==0.12.6
lxml==3.3.3
matplotlib==1.3.1
networkx==1.9
nltk==2.0.4
nose==1.3.3
numba==0.13.3
numexpr==2.4
numpy==1.7.1
pandas==0.14.1
patsy==0.2.1
pymc==2.3.3
pyparsing==2.0.2
python-dateutil==2.2
pytz==2014.4
pyzmq==14.3.1
requests==2.2.1
rpy2==2.4.2
scipy==0.14.0
six==1.5.2
ssh-import-id==3.21
statsmodels==0.5.0
sympy==0.7.5
tornado==3.2.2
urllib3==1.7.1
vincent==0.4.4
wsgiref==0.1.2

```

Also includes 0MQ 4.0.3 and LLVM 3.2
