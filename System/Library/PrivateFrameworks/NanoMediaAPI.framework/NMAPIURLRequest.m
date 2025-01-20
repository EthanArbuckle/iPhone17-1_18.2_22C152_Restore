@interface NMAPIURLRequest
- (NMAPIURLRequest)initWithURL:(id)a3;
- (NSURL)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4;
- (void)setURL:(id)a3;
@end

@implementation NMAPIURLRequest

- (NMAPIURLRequest)initWithURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NMAPIURLRequest;
  v5 = [(MPStoreModelRequest *)&v8 init];
  if (v5)
  {
    v6 = [NSString stringWithFormat:@"URL : %@", v4];
    [(NMAPIURLRequest *)v5 setLabel:v6];

    [(NMAPIURLRequest *)v5 setURL:v4];
  }

  return v5;
}

- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4
{
  URL = self->_URL;
  if (URL)
  {
    v5 = [MEMORY[0x263F08BA0] componentsWithURL:URL resolvingAgainstBaseURL:0];
  }
  else
  {
    v7 = NMLogForCategory(9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NMAPIURLRequest urlComponentsWithStoreURLBag:error:](v7);
    }

    if (a4)
    {
      id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7101 userInfo:0];
      v5 = 0;
      *a4 = v8;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NMAPIURLRequest;
  id v4 = [(NMAPIRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 16, self->_URL);
  }
  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)urlComponentsWithStoreURLBag:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2269EF000, log, OS_LOG_TYPE_ERROR, "[NMAPIRequest] Missing URL parameter.", v1, 2u);
}

@end