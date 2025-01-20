@interface RKNLEventToken
- (NSString)string;
- (RKNLEventToken)initWithString:(id)a3 location:(int64_t)a4 length:(int64_t)a5;
- (int64_t)length;
- (int64_t)location;
- (unsigned)tokenID;
- (void)setLength:(int64_t)a3;
- (void)setLocation:(int64_t)a3;
- (void)setString:(id)a3;
- (void)setTokenID:(unsigned int)a3;
@end

@implementation RKNLEventToken

- (RKNLEventToken)initWithString:(id)a3 location:(int64_t)a4 length:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RKNLEventToken;
  v10 = [(RKNLEventToken *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_string, a3);
    v11->_location = a4;
    v11->_length = a5;
  }

  return v11;
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setString:(id)a3
{
}

- (unsigned)tokenID
{
  return self->_tokenID;
}

- (void)setTokenID:(unsigned int)a3
{
  self->_tokenID = a3;
}

- (int64_t)location
{
  return self->_location;
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
}

- (int64_t)length
{
  return self->_length;
}

- (void)setLength:(int64_t)a3
{
  self->_length = a3;
}

- (void).cxx_destruct
{
}

@end