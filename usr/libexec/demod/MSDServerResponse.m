@interface MSDServerResponse
- (MSDServerResponse)initWithError:(id)a3;
- (NSData)data;
- (NSError)error;
- (NSString)getName;
- (void)setData:(id)a3;
- (void)setError:(id)a3;
@end

@implementation MSDServerResponse

- (MSDServerResponse)initWithError:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDServerResponse;
  v5 = [(MSDServerResponse *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(MSDServerResponse *)v5 setError:v4];
    [(MSDServerResponse *)v6 setData:0];
    v7 = v6;
  }

  return v6;
}

- (NSString)getName
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 8, 1);
}

- (void)setError:(id)a3
{
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end