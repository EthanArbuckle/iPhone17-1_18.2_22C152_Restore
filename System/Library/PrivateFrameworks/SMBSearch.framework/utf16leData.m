@interface utf16leData
- (NSData)datab;
- (unsigned)byteCount;
- (unsigned)charCount;
- (utf16leData)initWithStr:(id)a3;
- (void)setByteCount:(unsigned int)a3;
- (void)setCharCount:(unsigned int)a3;
- (void)setDatab:(id)a3;
@end

@implementation utf16leData

- (utf16leData)initWithStr:(id)a3
{
  id v4 = a3;
  unsigned int v9 = 0;
  v8.receiver = self;
  v8.super_class = (Class)utf16leData;
  v5 = [(utf16leData *)&v8 init];
  if (v5)
  {
    v6 = utf8_to_utf16le_data(v4, &v9, 1);
    if (v6)
    {
      objc_storeStrong((id *)&v5->_datab, v6);
      v5->_charCount = v9;
      v5->_byteCount = [v6 length];
    }
    else
    {

      v5 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v5;
}

- (NSData)datab
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDatab:(id)a3
{
}

- (unsigned)charCount
{
  return self->_charCount;
}

- (void)setCharCount:(unsigned int)a3
{
  self->_charCount = a3;
}

- (unsigned)byteCount
{
  return self->_byteCount;
}

- (void)setByteCount:(unsigned int)a3
{
  self->_byteCount = a3;
}

- (void).cxx_destruct
{
}

@end