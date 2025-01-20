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
  if (plistStartTag_onceTokenStart != -1) {
    dispatch_once(&plistStartTag_onceTokenStart, &__block_literal_global_76);
  }
  v2 = (void *)plistStartTag__plistStartTag;

  return (NSData *)v2;
}

uint64_t __34__SKTaskPlistParser_plistStartTag__block_invoke()
{
  plistStartTag__plistStartTag = [@"<plist" dataUsingEncoding:4];

  return MEMORY[0x270F9A758]();
}

+ (NSData)plistEndTag
{
  if (plistEndTag_onceTokenEnd != -1) {
    dispatch_once(&plistEndTag_onceTokenEnd, &__block_literal_global_81);
  }
  v2 = (void *)plistEndTag__plistEndTag;

  return (NSData *)v2;
}

uint64_t __32__SKTaskPlistParser_plistEndTag__block_invoke()
{
  plistEndTag__plistEndTag = [@"</plist>" dataUsingEncoding:4];

  return MEMORY[0x270F9A758]();
}

- (SKTaskPlistParser)initWithCallback:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKTaskPlistParser;
  v5 = [(SKTaskPlistParser *)&v8 init];
  if (v5)
  {
    v6 = [MEMORY[0x263EFF990] data];
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
  uint64_t v6 = [v5 length];

  if (v6)
  {
    do
    {
      if ([(SKTaskPlistParser *)self startRange] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = [(SKTaskPlistParser *)self buffer];
        objc_super v8 = [(id)objc_opt_class() plistStartTag];
        v9 = [(SKTaskPlistParser *)self buffer];
        uint64_t v10 = objc_msgSend(v7, "rangeOfData:options:range:", v8, 0, 0, objc_msgSend(v9, "length"));
        -[SKTaskPlistParser setStartRange:](self, "setStartRange:", v10, v11);

        if ([(SKTaskPlistParser *)self startRange] == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
      }
      v12 = [(SKTaskPlistParser *)self buffer];
      v13 = [(id)objc_opt_class() plistEndTag];
      v14 = [(SKTaskPlistParser *)self buffer];
      uint64_t v15 = objc_msgSend(v12, "rangeOfData:options:range:", v13, 0, 0, objc_msgSend(v14, "length"));
      uint64_t v17 = v16;

      if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      v18 = [(SKTaskPlistParser *)self buffer];
      uint64_t v19 = v15 + v17;
      v20 = objc_msgSend(v18, "subdataWithRange:", -[SKTaskPlistParser startRange](self, "startRange"), v15 + v17 - -[SKTaskPlistParser startRange](self, "startRange"));

      v21 = [MEMORY[0x263F08AC0] propertyListWithData:v20 options:0 format:0 error:0];
      if (v21)
      {
        v22 = [(SKTaskPlistParser *)self buffer];
        v23 = [(SKTaskPlistParser *)self buffer];
        v24 = [(SKTaskPlistParser *)self buffer];
        v25 = objc_msgSend(v23, "subdataWithRange:", v19 + 1, objc_msgSend(v24, "length") + ~v19);
        [v22 setData:v25];

        -[SKTaskPlistParser setStartRange:](self, "setStartRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
        v26 = [(SKTaskPlistParser *)self callback];
        ((void (**)(void, void *))v26)[2](v26, v21);
      }
      v27 = [(SKTaskPlistParser *)self buffer];
      uint64_t v28 = [v27 length];
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