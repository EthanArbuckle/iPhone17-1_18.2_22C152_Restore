@interface TransparencyResponse
- (NSData)data;
- (NSDictionary)metadata;
- (TransparencyNetworkRequest)request;
- (TransparencyResponse)initWithRequest:(id)a3 responseData:(id)a4 metadata:(id)a5;
- (id)serverHint;
- (void)setData:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation TransparencyResponse

- (TransparencyResponse)initWithRequest:(id)a3 responseData:(id)a4 metadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TransparencyResponse;
  v11 = [(TransparencyResponse *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(TransparencyResponse *)v11 setRequest:v8];
    [(TransparencyResponse *)v12 setData:v9];
    [(TransparencyResponse *)v12 setMetadata:v10];
  }

  return v12;
}

- (id)serverHint
{
  v3 = [(TransparencyResponse *)self metadata];

  if (v3)
  {
    v4 = [(TransparencyResponse *)self metadata];
    v5 = [v4 objectForKey:kTransparencyResponseMetadataKeyServerHint];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetadata:(id)a3
{
}

- (TransparencyNetworkRequest)request
{
  return (TransparencyNetworkRequest *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end