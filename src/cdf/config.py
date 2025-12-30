from django import VERSION as django_version
from os import getenv
from cdf.utils import get_major_dot_minor_version


DJANGO_VERSIONS = [
    '5.2',
    '6.0',
]


VERSION = get_major_dot_minor_version(django_version)
if getenv('IS_LOCAL') in ('1', 1):
    BASE_URL = '/'
    print("Building for local server...")
else:
    # For GitHub Pages
    BASE_URL = '/classy-django-forms/'
