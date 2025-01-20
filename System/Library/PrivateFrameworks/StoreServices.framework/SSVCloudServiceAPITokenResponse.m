@interface SSVCloudServiceAPITokenResponse
- (NSError)error;
- (NSString)apiToken;
- (SSVCloudServiceAPITokenResponse)initWithToken:(id)a3 error:(id)a4;
- (SSVCloudServiceAPITokenResponse)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)setApiToken:(id)a3;
- (void)setError:(id)a3;
@end

@implementation SSVCloudServiceAPITokenResponse

- (SSVCloudServiceAPITokenResponse)initWithToken:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SSVCloudServiceAPITokenResponse;
  v8 = [(SSVCloudServiceAPITokenResponse *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    apiToken = v8->_apiToken;
    v8->_apiToken = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    error = v8->_error;
    v8->_error = (NSError *)v11;
  }
  return v8;
}

- (SSVCloudServiceAPITokenResponse)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v14.receiver = self;
    v14.super_class = (Class)SSVCloudServiceAPITokenResponse;
    id v6 = [(SSVCloudServiceAPITokenResponse *)&v14 init];
    if (v6)
    {
      objc_opt_class();
      CFArrayRef v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "0");
      apiToken = v6->_apiToken;
      v6->_apiToken = (NSString *)v8;

      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v11 = xpc_dictionary_get_value(v5, "1");
      uint64_t v12 = [v10 initWithXPCEncoding:v11];
      error = v6->_error;
      v6->_error = (NSError *)v12;
    }
  }
  else
  {

    id v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_apiToken);
  SSXPCDictionarySetObject(v3, "1", self->_error);
  return v3;
}

- (NSString)apiToken
{
  return self->_apiToken;
}

- (void)setApiToken:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_apiToken, 0);
}

@end