@interface VGMLFloatIOData
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (VGMLFloatIOData)initWithData:(id)a3;
- (VGMLFloatIOData)initWithSize:(unint64_t)a3 withData:(const float *)a4;
- (const)getData;
- (unint64_t)getSize;
@end

@implementation VGMLFloatIOData

- (VGMLFloatIOData)initWithData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VGMLFloatIOData;
  v6 = [(VGMLFloatIOData *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v8 = v7;
  }

  return v7;
}

- (VGMLFloatIOData)initWithSize:(unint64_t)a3 withData:(const float *)a4
{
  id v5 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:a4 length:4 * a3 freeWhenDone:0];
  v6 = [(VGMLFloatIOData *)self initWithData:v5];

  return v6;
}

- (unint64_t)getSize
{
  return [(NSData *)self->_data length] >> 2;
}

- (const)getData
{
  return (const float *)[(NSData *)self->_data bytes];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    data = self->_data;
    v6 = [v4 data];
    char v7 = [(NSData *)data isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end