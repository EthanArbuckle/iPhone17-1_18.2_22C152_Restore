@interface ICSZStringWriter
- (ICSZStringWriter)init;
- (NSString)description;
- (id)zResult;
- (void)_appendBytes:(const void *)a3 length:(unint64_t)a4 andFlush:(BOOL)a5;
- (void)appendFormat:(id)a3;
- (void)appendString:(id)a3;
@end

@implementation ICSZStringWriter

- (ICSZStringWriter)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICSZStringWriter;
  v2 = [(ICSZStringWriter *)&v8 init];
  v3 = v2;
  if (!v2) {
    goto LABEL_4;
  }
  v2->_strm.zalloc = 0;
  v2->_strm.zfree = 0;
  v2->_strm.opaque = 0;
  v4 = 0;
  if (!deflateInit_(&v2->_strm, -1, "1.2.12", 112))
  {
    v5 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    v6 = v3->_result;
    v3->_result = v5;

LABEL_4:
    v4 = v3;
  }

  return v4;
}

- (void)appendString:(id)a3
{
  v4 = (const char *)[a3 cStringUsingEncoding:4];
  if (v4)
  {
    v5 = v4;
    if (*v4)
    {
      size_t v6 = strlen(v4);
      [(ICSZStringWriter *)self _appendBytes:v5 length:v6 andFlush:0];
    }
  }
}

- (void)appendFormat:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  size_t v6 = (void *)[[v4 alloc] initWithFormat:v5 locale:0 arguments:&v7];

  [(ICSZStringWriter *)self appendString:v6];
}

- (id)zResult
{
  char v5 = 0;
  [(ICSZStringWriter *)self _appendBytes:&v5 length:1 andFlush:1];
  v3 = self->_result;
  return v3;
}

- (void)_appendBytes:(const void *)a3 length:(unint64_t)a4 andFlush:(BOOL)a5
{
  v10[2048] = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    self->_strm.next_in = (Bytef *)a3;
    p_strm = &self->_strm;
    self->_strm.avail_in = a4;
    if (a5) {
      int v8 = 4;
    }
    else {
      int v8 = 0;
    }
    do
    {
      self->_strm.avail_out = 0x4000;
      self->_strm.next_out = (Bytef *)v10;
      if (deflate(p_strm, v8) == -2)
      {
        v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2 object:self file:@"ICSStringWriter.m" lineNumber:120 description:@"Error in string compression"];
      }
      [(NSMutableData *)self->_result appendBytes:v10 length:0x4000 - self->_strm.avail_out];
    }
    while (!self->_strm.avail_out);
  }
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  size_t v6 = [v3 stringWithFormat:@"<%@:%p %d bytes>", v5, self, -[NSMutableData length](self->_result, "length")];

  return (NSString *)v6;
}

- (void).cxx_destruct
{
}

@end