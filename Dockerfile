FROM justb4/jmeter:5.6.3

WORKDIR /tests

COPY jmeter /tests

CMD ["jmeter"
