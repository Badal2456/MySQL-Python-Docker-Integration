FROM python

WORKDIR /myapp

COPY demo_sql.py .

RUN pip install pymysql
RUN pip install cryptography

CMD ["python", "demo_sql.py"]
