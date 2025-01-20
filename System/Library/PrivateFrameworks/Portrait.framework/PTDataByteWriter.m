@interface PTDataByteWriter
- (BOOL)appendBytes:(const void *)a3 size:(unint64_t)a4;
- (BOOL)writeBytes:(const void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5;
- (NSError)error;
- (NSMutableData)data;
- (PTDataByteWriter)initWithMutableData:(id)a3;
- (id)_errorForSize:(unint64_t)a3 offset:(unint64_t)a4;
- (void)setData:(id)a3;
- (void)setError:(id)a3;
@end

@implementation PTDataByteWriter

- (PTDataByteWriter)initWithMutableData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTDataByteWriter;
  v6 = [(PTDataByteWriter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (BOOL)appendBytes:(const void *)a3 size:(unint64_t)a4
{
  v7 = [(PTDataByteWriter *)self error];

  if (v7) {
    return 0;
  }
  NSUInteger v9 = [(NSMutableData *)self->_data length];
  [(NSMutableData *)self->_data appendBytes:a3 length:a4];
  if ([(NSMutableData *)self->_data length] != v9 + a4)
  {
    v10 = [(PTDataByteWriter *)self _errorForSize:a4 offset:v9];
    [(PTDataByteWriter *)self setError:v10];
  }
  v11 = [(PTDataByteWriter *)self error];
  BOOL v8 = v11 == 0;

  return v8;
}

- (BOOL)writeBytes:(const void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  NSUInteger v9 = [(PTDataByteWriter *)self error];

  if (v9) {
    return 0;
  }
  unint64_t v11 = [(NSMutableData *)self->_data length];
  -[NSMutableData replaceBytesInRange:withBytes:length:](self->_data, "replaceBytesInRange:withBytes:length:", a5, a4, a3, a4);
  if (a5 + a4 <= v11) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = a5 + a4;
  }
  if ([(NSMutableData *)self->_data length] != v12)
  {
    v13 = [(PTDataByteWriter *)self _errorForSize:a4 offset:a5];
    [(PTDataByteWriter *)self setError:v13];
  }
  v14 = [(PTDataByteWriter *)self error];
  BOOL v10 = v14 == 0;

  return v10;
}

- (id)_errorForSize:(unint64_t)a3 offset:(unint64_t)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28760];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"attempt to write bytes at offset %lu size %lu to data of length %lu", a4, a3, -[NSMutableData length](self->_data, "length"));
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  BOOL v8 = [v4 errorWithDomain:v5 code:-20 userInfo:v7];

  return v8;
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 8, 1);
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