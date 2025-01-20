@interface OspreyConnectionConfiguration
- (BOOL)isEqual:(id)a3;
- (NSURL)connectionUrl;
- (NSURLSessionConfiguration)urlSessionConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setConnectionUrl:(id)a3;
- (void)setUrlSessionConfiguration:(id)a3;
@end

@implementation OspreyConnectionConfiguration

- (BOOL)isEqual:(id)a3
{
  v4 = (OspreyConnectionConfiguration *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      connectionUrl = self->_connectionUrl;
      v7 = [(OspreyConnectionConfiguration *)v5 connectionUrl];

      if (connectionUrl == v7)
      {
        urlSessionConfiguration = self->_urlSessionConfiguration;
        v10 = [(OspreyConnectionConfiguration *)v5 urlSessionConfiguration];
        BOOL v8 = urlSessionConfiguration == v10;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_connectionUrl hash];
  return [(NSURLSessionConfiguration *)self->_urlSessionConfiguration hash] ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(OspreyConnectionConfiguration);
  [(OspreyConnectionConfiguration *)v4 setConnectionUrl:self->_connectionUrl];
  [(OspreyConnectionConfiguration *)v4 setUrlSessionConfiguration:self->_urlSessionConfiguration];
  return v4;
}

- (NSURL)connectionUrl
{
  return self->_connectionUrl;
}

- (void)setConnectionUrl:(id)a3
{
}

- (NSURLSessionConfiguration)urlSessionConfiguration
{
  return self->_urlSessionConfiguration;
}

- (void)setUrlSessionConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSessionConfiguration, 0);

  objc_storeStrong((id *)&self->_connectionUrl, 0);
}

@end