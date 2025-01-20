@interface ICSUnfoldingStream
- (BOOL)eos;
- (ICSUnfoldingStream)initWithInputStream:(id)a3;
- (char)read;
- (void)_readTwo;
- (void)_shiftRead;
@end

@implementation ICSUnfoldingStream

- (ICSUnfoldingStream)initWithInputStream:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICSUnfoldingStream;
  v6 = [(ICSUnfoldingStream *)&v10 init];
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_underStream, a3);
    [(ICSUnfoldingStream *)v7 _readTwo];
  }
  v8 = v7;
LABEL_6:

  return v8;
}

- (char)read
{
  while (1)
  {
    while (1)
    {
      int char1 = self->_char1;
      if (char1 == 10) {
        break;
      }
      if (char1 != 13 || self->_char2 != 10) {
        goto LABEL_16;
      }
      int v4 = [(ICSInputByteStream *)self->_underStream read];
      int v5 = v4;
      if (v4 == 32 || v4 == 9)
      {
        [(ICSUnfoldingStream *)self _readTwo];
      }
      else
      {
        self->_int char1 = 10;
        self->_int char2 = v4;
      }
      if (v5 != 9 && v5 != 32) {
        return char1;
      }
    }
    int char2 = self->_char2;
    if (char2 != 9 && char2 != 32) {
      break;
    }
    [(ICSUnfoldingStream *)self _readTwo];
  }
LABEL_16:
  [(ICSUnfoldingStream *)self _shiftRead];
  return char1;
}

- (void)_readTwo
{
  self->_int char1 = [(ICSInputByteStream *)self->_underStream read];
  self->_int char2 = [(ICSInputByteStream *)self->_underStream read];
}

- (void)_shiftRead
{
  self->_int char1 = self->_char2;
  self->_int char2 = [(ICSInputByteStream *)self->_underStream read];
}

- (BOOL)eos
{
  if (self->_char1 || self->_char2) {
    return 0;
  }
  else {
    return [(ICSInputByteStream *)self->_underStream eos];
  }
}

- (void).cxx_destruct
{
}

@end