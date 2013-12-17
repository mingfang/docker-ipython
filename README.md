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

####Instructions
1. Build Docker image using the using ```build```.  This can take a long time, ~30mins.  Luckily this step only has to done once(or whenever you change the Dockerfile).
2. Create and shell into new Docker container using ```shell``
3. Start IPython Notebook using ```supervisord&```
4. Point your brower to ```http://<your host name>:49888```

####Version Detail
```
>pip freeze

Bottleneck==0.7.0
Cython==0.19.2
Jinja2==2.7.1
MarkupSafe==0.18
Pattern==2.6
PyYAML==3.10
argparse==1.2.1
beautifulsoup4==4.3.2
distribute==0.7.3
html5lib==1.0b3
ipython==1.1.0
lxml==2.3.2
matplotlib==1.3.1
medusa==0.5.4
meld3==0.6.5
nltk==2.0.4
nose==1.3.0
numexpr==2.2.2
numpy==1.8.0
pandas==0.12.0
patsy==0.2.1
pymc==2.3
pyparsing==2.0.1
python-dateutil==2.2
pytz==2013.8
pyzmq==14.0.1
scipy==0.13.2
six==1.4.1
statsmodels==0.5.0
supervisor==3.0a8
sympy==0.7.4.1
tornado==3.1.1
wsgiref==0.1.2
```

Also includes 0MQ 4.0.3 and LLVM 3.2
