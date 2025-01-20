@interface VCSParserInputStream
- (BOOL)isContinued;
- (VCSParserInputStream)initWithData:(id)a3;
- (id)errorStr:(unint64_t)a3;
- (int)lineNum;
- (unint64_t)getLine:(char *)a3 withSize:(unint64_t *)a4;
- (unint64_t)loadLineBuffer;
@end

@implementation VCSParserInputStream

- (VCSParserInputStream)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VCSParserInputStream;
  v6 = [(VCSParserInputStream *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataStream, a3);
  }

  return v7;
}

- (unint64_t)getLine:(char *)a3 withSize:(unint64_t *)a4
{
  if (!self->_dataStream) {
    return 1;
  }
  if (!a3) {
    return 2;
  }
  if (self->_discardBuffer)
  {
    unint64_t v7 = [(VCSParserInputStream *)self loadLineBuffer];
    if (v7 == 4) {
      return v7;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  NSUInteger length = self->_buffer.length;
  if (*a4 <= length)
  {
    *a4 = length + 1;
    return 3;
  }
  else
  {
    [(NSData *)self->_dataStream getBytes:a3 range:self->_buffer.location];
    a3[self->_buffer.length] = 0;
    self->_discardBuffer = 1;
    if (!v7) {
      ++self->_currentLineNum;
    }
  }
  return v7;
}

- (unint64_t)loadLineBuffer
{
  v3 = [(NSData *)self->_dataStream bytes];
  unint64_t v4 = [(NSData *)self->_dataStream length];
  NSUInteger seek = self->_seek;
  if (v4 <= seek)
  {
    unint64_t result = 4;
    NSUInteger v11 = self->_seek;
  }
  else
  {
    NSUInteger v6 = seek + 1;
    uint64_t v7 = self->_seek;
    while (1)
    {
      int v8 = v3[v7];
      self->_NSUInteger seek = v6;
      if (v8 == 10)
      {
        unint64_t result = 0;
        goto LABEL_13;
      }
      if (v8 == 13) {
        break;
      }
      uint64_t v7 = v6;
      NSUInteger v9 = v6 + 1;
      if (v4 <= v6++)
      {
        NSUInteger v11 = v9 - 1;
        unint64_t result = 4;
        goto LABEL_14;
      }
    }
    unint64_t result = 0;
    if (v3[v6] == 10) {
      unsigned int v13 = v6 + 1;
    }
    else {
      unsigned int v13 = v6;
    }
    self->_NSUInteger seek = v13;
LABEL_13:
    NSUInteger v11 = v6 - 1;
  }
LABEL_14:
  self->_buffer.location = seek;
  self->_buffer.NSUInteger length = v11 - seek;
  return result;
}

- (BOOL)isContinued
{
  if ([(VCSParserInputStream *)self loadLineBuffer] == 4)
  {
    BOOL result = 0;
    self->_discardBuffer = 1;
    return result;
  }
  self->_discardBuffer = 0;
  if (!self->_buffer.length) {
    return 0;
  }
  char v9 = 0;
  NSUInteger location = self->_buffer.location;
  if (location >= 6)
  {
    char v8 = 0;
    __int16 v7 = 0;
    -[NSData getBytes:range:](self->_dataStream, "getBytes:range:", &v8, location - 3, 1);
    -[NSData getBytes:range:](self->_dataStream, "getBytes:range:", (char *)&v7 + 1, self->_buffer.location - 2, 1);
    -[NSData getBytes:range:](self->_dataStream, "getBytes:range:", &v7, self->_buffer.location - 1, 1);
    BOOL v5 = v7 == 13 || v7 == 10;
    if (v5 && HIBYTE(v7) == 61 || v7 == 10 && HIBYTE(v7) == 13 && v8 == 61) {
      return 1;
    }
    NSUInteger location = self->_buffer.location;
  }
  -[NSData getBytes:range:](self->_dataStream, "getBytes:range:", &v9, location, 1);
  return v9 == 32 || v9 == 9;
}

- (int)lineNum
{
  return self->_currentLineNum;
}

- (id)errorStr:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"Unknown error.";
  }
  else {
    return off_1E6C25B78[a3 - 1];
  }
}

- (void).cxx_destruct
{
}

@end