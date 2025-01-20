@interface SKTaskLineParser
+ (NSData)lineData;
- (NSMutableData)buffer;
- (SKTaskLineParser)initWithCallback:(id)a3;
- (id)callback;
- (void)parseData:(id)a3;
- (void)setBuffer:(id)a3;
- (void)setCallback:(id)a3;
@end

@implementation SKTaskLineParser

+ (NSData)lineData
{
  if (qword_10000DBF8 != -1) {
    dispatch_once(&qword_10000DBF8, &stru_100008340);
  }
  v2 = (void *)qword_10000DBF0;

  return (NSData *)v2;
}

- (SKTaskLineParser)initWithCallback:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKTaskLineParser;
  v5 = [(SKTaskLineParser *)&v8 init];
  if (v5)
  {
    v6 = +[NSMutableData data];
    [(SKTaskLineParser *)v5 setBuffer:v6];

    [(SKTaskLineParser *)v5 setCallback:v4];
  }

  return v5;
}

- (void)parseData:(id)a3
{
  id v21 = a3;
  id v4 = [(SKTaskLineParser *)self buffer];
  [v4 appendData:v21];

  v5 = [(SKTaskLineParser *)self buffer];
  id v6 = [v5 length];

  if (v6)
  {
    do
    {
      v7 = [(SKTaskLineParser *)self buffer];
      objc_super v8 = [(id)objc_opt_class() lineData];
      v9 = [(SKTaskLineParser *)self buffer];
      v10 = (char *)objc_msgSend(v7, "rangeOfData:options:range:", v8, 0, 0, objc_msgSend(v9, "length"));

      if (v10 == (char *)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      v11 = [(SKTaskLineParser *)self buffer];
      v12 = objc_msgSend(v11, "subdataWithRange:", 0, v10);

      v13 = [(SKTaskLineParser *)self buffer];
      v14 = [(SKTaskLineParser *)self buffer];
      v15 = [(SKTaskLineParser *)self buffer];
      v16 = objc_msgSend(v14, "subdataWithRange:", v10 + 1, (char *)objc_msgSend(v15, "length") + ~(unint64_t)objc_msgSend(v12, "length"));
      [v13 setData:v16];

      v17 = [(SKTaskLineParser *)self callback];
      id v18 = [objc_alloc((Class)NSString) initWithData:v12 encoding:4];
      ((void (**)(void, id))v17)[2](v17, v18);

      v19 = [(SKTaskLineParser *)self buffer];
      id v20 = [v19 length];
    }
    while (v20);
  }
}

- (NSMutableData)buffer
{
  return (NSMutableData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBuffer:(id)a3
{
}

- (id)callback
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);

  objc_storeStrong((id *)&self->_buffer, 0);
}

@end