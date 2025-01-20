@interface APMescalSignSetupRequester
- (Class)responseClass;
- (NSData)data;
- (id)headers;
- (id)protoBuffer;
- (void)setData:(id)a3;
@end

@implementation APMescalSignSetupRequester

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)protoBuffer
{
  v3 = objc_alloc_init(APPBMescalSignSAPSetupRequest);
  v4 = [(APMescalSignSetupRequester *)self data];
  [(APPBMescalSignSAPSetupRequest *)v3 setBuffer:v4];

  return v3;
}

- (id)headers
{
  v6.receiver = self;
  v6.super_class = (Class)APMescalSignSetupRequester;
  v2 = [(APServerRequester *)&v6 headers];
  id v3 = [v2 mutableCopy];

  [v3 setObject:@"application/octet-stream" forKey:@"Content-Type"];
  id v4 = [v3 copy];

  return v4;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end