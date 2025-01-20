@interface VUIJSBlob
- (NSData)data;
- (VUIJSBlob)initWithData:(id)a3;
@end

@implementation VUIJSBlob

- (VUIJSBlob)initWithData:(id)a3
{
  id v5 = a3;
  v6 = +[VUIAppContext currentAppContext];
  v9.receiver = self;
  v9.super_class = (Class)VUIJSBlob;
  v7 = [(VUIJSObject *)&v9 initWithAppContext:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_data, a3);
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