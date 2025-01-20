@interface TVURLImageRequest
- (NSDictionary)headers;
- (NSString)identifier;
- (NSURL)url;
- (TVImageDecrypter)decrypter;
- (TVURLImageRequest)initWithURL:(id)a3 headers:(id)a4 decrypter:(id)a5;
- (TVURLImageRequest)initWithURL:(id)a3 headers:(id)a4 identifier:(id)a5 decrypter:(id)a6;
- (void)setDecrypter:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation TVURLImageRequest

- (TVURLImageRequest)initWithURL:(id)a3 headers:(id)a4 identifier:(id)a5 decrypter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TVURLImageRequest;
  v15 = [(TVURLImageRequest *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_url, a3);
    objc_storeStrong((id *)&v16->_headers, a4);
    objc_storeStrong((id *)&v16->_identifier, a5);
    objc_storeStrong((id *)&v16->_decrypter, a6);
  }

  return v16;
}

- (TVURLImageRequest)initWithURL:(id)a3 headers:(id)a4 decrypter:(id)a5
{
  return [(TVURLImageRequest *)self initWithURL:a3 headers:a4 identifier:0 decrypter:a5];
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (identifier)
  {
    v3 = identifier;
  }
  else
  {
    v3 = [(NSURL *)self->_url absoluteString];
  }
  return v3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (TVImageDecrypter)decrypter
{
  return self->_decrypter;
}

- (void)setDecrypter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decrypter, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end