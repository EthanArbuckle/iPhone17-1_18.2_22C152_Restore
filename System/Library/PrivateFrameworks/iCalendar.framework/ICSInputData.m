@interface ICSInputData
- (BOOL)eos;
- (ICSInputData)initWithData:(id)a3;
- (char)read;
@end

@implementation ICSInputData

- (ICSInputData)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSInputData;
  v5 = [(ICSInputData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v5->_cursor = 0;
    v5->_rawData = (char *)[(NSData *)v5->_data bytes];
    v5->_length = [(NSData *)v5->_data length];
  }

  return v5;
}

- (char)read
{
  unint64_t cursor = self->_cursor;
  if (cursor >= self->_length) {
    return 0;
  }
  char v3 = self->_rawData[cursor];
  self->_unint64_t cursor = cursor + 1;
  return v3;
}

- (BOOL)eos
{
  return self->_cursor >= self->_length;
}

- (void).cxx_destruct
{
}

@end