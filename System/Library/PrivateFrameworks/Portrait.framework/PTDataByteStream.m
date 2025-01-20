@interface PTDataByteStream
- (NSData)data;
- (NSError)error;
- (PTDataByteStream)initWithData:(id)a3;
- (id)_errorForSize:(unint64_t)a3 offset:(unint64_t)a4;
- (unint64_t)readBytes:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5;
- (unint64_t)size;
- (void)setData:(id)a3;
- (void)setError:(id)a3;
@end

@implementation PTDataByteStream

- (PTDataByteStream)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTDataByteStream;
  v6 = [(PTDataByteStream *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (unint64_t)size
{
  return [(NSData *)self->_data length];
}

- (unint64_t)readBytes:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  [(PTDataByteStream *)self setError:0];
  if (a4 && [(NSData *)self->_data length] > a5)
  {
    if ([(NSData *)self->_data length] < a5 + a4)
    {
      NSUInteger v9 = [(NSData *)self->_data length];
      a4 = v9 - a5;
      v10 = [(PTDataByteStream *)self _errorForSize:v9 - a5 offset:a5];
      [(PTDataByteStream *)self setError:v10];
    }
    -[NSData getBytes:range:](self->_data, "getBytes:range:", a3, a5, a4);
  }
  else
  {
    v11 = [(PTDataByteStream *)self _errorForSize:a4 offset:a5];
    [(PTDataByteStream *)self setError:v11];

    return 0;
  }
  return a4;
}

- (id)_errorForSize:(unint64_t)a3 offset:(unint64_t)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28760];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"attempt to read bytes at offset %lu size %lu from data of length %lu", a4, a3, -[NSData length](self->_data, "length"));
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [v4 errorWithDomain:v5 code:-19 userInfo:v7];

  return v8;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end