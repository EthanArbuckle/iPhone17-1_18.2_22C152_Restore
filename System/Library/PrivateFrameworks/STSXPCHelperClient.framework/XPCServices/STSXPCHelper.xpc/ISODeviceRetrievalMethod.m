@interface ISODeviceRetrievalMethod
- (ISODeviceRetrievalMethod)initWithType:(int64_t)a3 version:(int64_t)a4;
- (id)encode;
- (id)encodeOptions;
@end

@implementation ISODeviceRetrievalMethod

- (ISODeviceRetrievalMethod)initWithType:(int64_t)a3 version:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ISODeviceRetrievalMethod;
  result = [(ISODeviceRetrievalMethod *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_version = a4;
  }
  return result;
}

- (id)encode
{
  v3 = [(ISODeviceRetrievalMethod *)self encodeOptions];

  uint64_t v4 = +[CBOR cborWithUnsignedInteger:self->_type];
  v5 = (void *)v4;
  if (v3)
  {
    v12[0] = v4;
    v6 = +[CBOR cborWithUnsignedInteger:self->_version];
    v12[1] = v6;
    objc_super v7 = [(ISODeviceRetrievalMethod *)self encodeOptions];
    v12[2] = v7;
    v8 = +[NSArray arrayWithObjects:v12 count:3];
    v9 = +[CBOR cborWithArray:v8];
  }
  else
  {
    v6 = +[CBOR cborWithUnsignedInteger:](CBOR, "cborWithUnsignedInteger:", self->_version, v4);
    v11[1] = v6;
    objc_super v7 = +[NSArray arrayWithObjects:v11 count:2];
    v9 = +[CBOR cborWithArray:v7];
  }

  return v9;
}

- (id)encodeOptions
{
  return 0;
}

@end