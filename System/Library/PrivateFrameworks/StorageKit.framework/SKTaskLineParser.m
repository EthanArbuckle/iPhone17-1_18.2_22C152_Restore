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
  if (onceToken != -1) {
    dispatch_once(&onceToken, &__block_literal_global);
  }
  v2 = (void *)_lineData;

  return (NSData *)v2;
}

uint64_t __28__SKTaskLineParser_lineData__block_invoke()
{
  _lineData = [@"\n" dataUsingEncoding:4];

  return MEMORY[0x270F9A758]();
}

- (SKTaskLineParser)initWithCallback:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKTaskLineParser;
  v5 = [(SKTaskLineParser *)&v8 init];
  if (v5)
  {
    v6 = [MEMORY[0x263EFF990] data];
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
  uint64_t v6 = [v5 length];

  if (v6)
  {
    do
    {
      v7 = [(SKTaskLineParser *)self buffer];
      objc_super v8 = [(id)objc_opt_class() lineData];
      v9 = [(SKTaskLineParser *)self buffer];
      uint64_t v10 = objc_msgSend(v7, "rangeOfData:options:range:", v8, 0, 0, objc_msgSend(v9, "length"));

      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      v11 = [(SKTaskLineParser *)self buffer];
      v12 = objc_msgSend(v11, "subdataWithRange:", 0, v10);

      v13 = [(SKTaskLineParser *)self buffer];
      v14 = [(SKTaskLineParser *)self buffer];
      v15 = [(SKTaskLineParser *)self buffer];
      v16 = objc_msgSend(v14, "subdataWithRange:", v10 + 1, objc_msgSend(v15, "length") + ~objc_msgSend(v12, "length"));
      [v13 setData:v16];

      v17 = [(SKTaskLineParser *)self callback];
      v18 = (void *)[[NSString alloc] initWithData:v12 encoding:4];
      ((void (**)(void, void *))v17)[2](v17, v18);

      v19 = [(SKTaskLineParser *)self buffer];
      uint64_t v20 = [v19 length];
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