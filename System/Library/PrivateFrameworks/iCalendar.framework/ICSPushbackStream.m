@interface ICSPushbackStream
- (BOOL)eos;
- (BOOL)pushBack:(char)a3;
- (ICSPushbackStream)initWithInputStream:(id)a3;
- (char)peek;
- (char)read;
- (void)dealloc;
@end

@implementation ICSPushbackStream

- (ICSPushbackStream)initWithInputStream:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICSPushbackStream;
  v6 = [(ICSPushbackStream *)&v10 init];
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_underStream, a3);
    v7->_pbData = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x2EA13019uLL);
    v7->_pbCursor = -1;
    v7->_readPastEOS = 0;
  }
  v8 = v7;
LABEL_6:

  return v8;
}

- (void)dealloc
{
  free(self->_pbData);
  v3.receiver = self;
  v3.super_class = (Class)ICSPushbackStream;
  [(ICSPushbackStream *)&v3 dealloc];
}

- (char)peek
{
  uint64_t pbCursor = self->_pbCursor;
  if ((pbCursor & 0x80000000) == 0) {
    return self->_pbData[pbCursor];
  }
  int v6 = [(ICSInputByteStream *)self->_underStream read];
  char v4 = v6;
  if (v6 || ![(ICSInputByteStream *)self->_underStream eos])
  {
    int v7 = self->_pbCursor;
    int v8 = v7 + 1;
    self->_uint64_t pbCursor = v7 + 1;
    if (v7 >= 15)
    {
      objc_super v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"ICSPushbackStream.m" lineNumber:56 description:@"Cannot push back that much data."];

      int v8 = self->_pbCursor;
    }
    self->_pbData[v8] = v4;
  }
  else
  {
    char v4 = 0;
    self->_readPastEOS = 1;
  }
  return v4;
}

- (BOOL)pushBack:(char)a3
{
  if (self->_readPastEOS)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"ICSPushbackStream.m" lineNumber:64 description:@"Cannot push back after reading past EOS"];
  }
  int pbCursor = self->_pbCursor;
  int v7 = pbCursor + 1;
  self->_int pbCursor = pbCursor + 1;
  if (pbCursor >= 15)
  {
    objc_super v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"ICSPushbackStream.m" lineNumber:66 description:@"Cannot push back that much data."];

    int v7 = self->_pbCursor;
  }
  self->_pbData[v7] = a3;
  return 1;
}

- (char)read
{
  uint64_t pbCursor = self->_pbCursor;
  if ((pbCursor & 0x80000000) != 0)
  {
    if ([(ICSInputByteStream *)self->_underStream eos]) {
      self->_readPastEOS = 1;
    }
    underStream = self->_underStream;
    return [(ICSInputByteStream *)underStream read];
  }
  else
  {
    char result = self->_pbData[pbCursor];
    self->_uint64_t pbCursor = pbCursor - 1;
  }
  return result;
}

- (BOOL)eos
{
  if (self->_pbCursor == -1) {
    return [(ICSInputByteStream *)self->_underStream eos];
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end