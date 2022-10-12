#!/usr/bin/python3
"""db storage module"""

from sqlalchemy import create_engine
from os import getenv


class DBStorage:
    """ creates a db storage engine"""
    __engine = None
    __session = None

    def __init__(self):
        """ create engine"""
        user = getenv("HBNB_MYSQL_USER")
        pwd = getenv("HBNB_MYSQL_PWD")
        host = getenv("HBNB_MYSQL_HOST")
        db = getenv("HBNB_MYSQL_DB")
        env = getenv("HBNB_ENV")

        self.__engine = create_engine('mysql+mysqldb://{}:{}@{}/{}'
                                      .format(user, pwd, host, db),
                                      pool_pre_ping=True)
