from django import VERSION as django_version

from cdf.utils import get_major_dot_minor_version


DJANGO_VERSIONS = [
    '5.2',
    '6.0',
]


VERSION = get_major_dot_minor_version(django_version)
BASE_URL = '/'
