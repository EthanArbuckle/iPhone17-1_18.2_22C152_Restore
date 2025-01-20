@interface SWMessageSecurityOrigin
- (NSString)host;
- (NSString)protocol;
- (NSURLRequest)request;
- (SWMessageSecurityOrigin)initWithProtocol:(id)a3 host:(id)a4 request:(id)a5;
@end

@implementation SWMessageSecurityOrigin

- (SWMessageSecurityOrigin)initWithProtocol:(id)a3 host:(id)a4 request:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SWMessageSecurityOrigin;
  v11 = [(SWMessageSecurityOrigin *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    protocol = v11->_protocol;
    v11->_protocol = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    host = v11->_host;
    v11->_host = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    request = v11->_request;
    v11->_request = (NSURLRequest *)v16;
  }
  return v11;
}

- (NSString)protocol
{
  return self->_protocol;
}

- (NSString)host
{
  return self->_host;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

@end