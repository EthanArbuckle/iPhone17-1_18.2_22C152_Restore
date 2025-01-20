@interface AnalyticsCSVWriter
- (AnalyticsCSVWriter)initWithOutputStream:(id)a3;
- (void)dealloc;
- (void)finishLine;
- (void)writeComma;
- (void)writeField:(id)a3;
- (void)writeFields:(id)a3;
@end

@implementation AnalyticsCSVWriter

- (AnalyticsCSVWriter)initWithOutputStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AnalyticsCSVWriter;
  v6 = [(AnalyticsCSVWriter *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputStream, a3);
    [(NSOutputStream *)v7->_outputStream open];
  }

  return v7;
}

- (void)dealloc
{
  [(NSOutputStream *)self->_outputStream close];
  v3.receiver = self;
  v3.super_class = (Class)AnalyticsCSVWriter;
  [(AnalyticsCSVWriter *)&v3 dealloc];
}

- (void)writeField:(id)a3
{
  id v10 = [a3 stringByReplacingOccurrencesOfString:@"," withString:@"\",\""];
  v4 = [v10 stringByReplacingOccurrencesOfString:@"\" withString:@"\"\"];
  id v5 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  v6 = [NSString stringWithFormat:@"\"%@\"", v5];
  v7 = [v6 dataUsingEncoding:4];
  outputStream = self->_outputStream;
  id v9 = v7;
  -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", [v9 bytes], objc_msgSend(v9, "length"));
}

- (void)writeFields:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        [(AnalyticsCSVWriter *)self writeField:v9];
        id v10 = [v4 lastObject];
        LOBYTE(v9) = [v10 isEqual:v9];

        if ((v9 & 1) == 0) {
          [(AnalyticsCSVWriter *)self writeComma];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)finishLine
{
  objc_super v3 = [@"\n" dataUsingEncoding:4];
  outputStream = self->_outputStream;
  id v5 = v3;
  -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", [v5 bytes], objc_msgSend(v5, "length"));
}

- (void)writeComma
{
  objc_super v3 = [@"," dataUsingEncoding:4];
  outputStream = self->_outputStream;
  id v5 = v3;
  -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", [v5 bytes], objc_msgSend(v5, "length"));
}

- (void).cxx_destruct
{
}

@end