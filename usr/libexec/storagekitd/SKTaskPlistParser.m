@interface SKTaskPlistParser
+ (NSData)plistEndTag;
+ (NSData)plistStartTag;
- (NSMutableData)buffer;
- (SKTaskPlistParser)initWithCallback:(id)a3;
- (_NSRange)startRange;
- (id)callback;
- (void)parseData:(id)a3;
- (void)setBuffer:(id)a3;
- (void)setCallback:(id)a3;
- (void)setStartRange:(_NSRange)a3;
@end

@implementation SKTaskPlistParser

+ (NSData)plistStartTag
{
  if (qword_100055AA0 != -1) {
    dispatch_once(&qword_100055AA0, &stru_100048CF8);
  }
  v2 = (void *)qword_100055A98;

  return (NSData *)v2;
}

+ (NSData)plistEndTag
{
  if (qword_100055AB0 != -1) {
    dispatch_once(&qword_100055AB0, &stru_100048D18);
  }
  v2 = (void *)qword_100055AA8;

  return (NSData *)v2;
}

- (SKTaskPlistParser)initWithCallback:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKTaskPlistParser;
  v5 = [(SKTaskPlistParser *)&v8 init];
  if (v5)
  {
    v6 = +[NSMutableData data];
    [(SKTaskPlistParser *)v5 setBuffer:v6];

    [(SKTaskPlistParser *)v5 setCallback:v4];
    -[SKTaskPlistParser setStartRange:](v5, "setStartRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  }

  return v5;
}

- (void)parseData:(id)a3
{
  id v29 = a3;
  id v4 = [(SKTaskPlistParser *)self buffer];
  [v4 appendData:v29];

  v5 = [(SKTaskPlistParser *)self buffer];
  id v6 = [v5 length];

  if (v6)
  {
    do
    {
      if ([(SKTaskPlistParser *)self startRange] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = [(SKTaskPlistParser *)self buffer];
        objc_super v8 = [(id)objc_opt_class() plistStartTag];
        v9 = [(SKTaskPlistParser *)self buffer];
        id v10 = [v7 rangeOfData:v8 options:0 range:[v9 length]];
        -[SKTaskPlistParser setStartRange:](self, "setStartRange:", v10, v11);

        if ([(SKTaskPlistParser *)self startRange] == (id)0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
      }
      v12 = [(SKTaskPlistParser *)self buffer];
      v13 = [(id)objc_opt_class() plistEndTag];
      v14 = [(SKTaskPlistParser *)self buffer];
      v15 = [v12 rangeOfData:v13 options:0 range:[v14 length]];
      uint64_t v17 = v16;

      if (v15 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      v18 = [(SKTaskPlistParser *)self buffer];
      unint64_t v19 = (unint64_t)&v15[v17];
      v20 = [v18 subdataWithRange:-[SKTaskPlistParser startRange](self, "startRange") &v15[v17] - (unsigned char *)-[SKTaskPlistParser startRange](self, "startRange")];

      v21 = +[NSPropertyListSerialization propertyListWithData:v20 options:0 format:0 error:0];
      if (v21)
      {
        v22 = [(SKTaskPlistParser *)self buffer];
        v23 = [(SKTaskPlistParser *)self buffer];
        v24 = [(SKTaskPlistParser *)self buffer];
        v25 = [v23 subdataWithRange:v19 + 1, (char *)[v24 length] + ~v19];
        [v22 setData:v25];

        -[SKTaskPlistParser setStartRange:](self, "setStartRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
        v26 = [(SKTaskPlistParser *)self callback];
        ((void (**)(void, void *))v26)[2](v26, v21);
      }
      v27 = [(SKTaskPlistParser *)self buffer];
      id v28 = [v27 length];
    }
    while (v28);
  }
}

- (NSMutableData)buffer
{
  return (NSMutableData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBuffer:(id)a3
{
}

- (_NSRange)startRange
{
  objc_copyStruct(v4, &self->_startRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setStartRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_startRange, &v3, 16, 1, 0);
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