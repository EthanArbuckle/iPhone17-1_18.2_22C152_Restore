@interface SXProxyAuthenticationKeyProvider
- (NSString)identifier;
- (NSString)secret;
- (SXProxyAuthenticationKeyProvider)initWithIdentifier:(id)a3 secret:(id)a4;
- (void)requestAuthenticationKeyWithCompletion:(id)a3;
@end

@implementation SXProxyAuthenticationKeyProvider

- (SXProxyAuthenticationKeyProvider)initWithIdentifier:(id)a3 secret:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SXProxyAuthenticationKeyProvider;
  v8 = [(SXProxyAuthenticationKeyProvider *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    secret = v8->_secret;
    v8->_secret = (NSString *)v11;
  }
  return v8;
}

- (void)requestAuthenticationKeyWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __75__SXProxyAuthenticationKeyProvider_requestAuthenticationKeyWithCompletion___block_invoke;
  v6[3] = &unk_264652F90;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __75__SXProxyAuthenticationKeyProvider_requestAuthenticationKeyWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8), *(void *)(*(void *)(a1 + 32) + 16));
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)secret
{
  return self->_secret;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secret, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end