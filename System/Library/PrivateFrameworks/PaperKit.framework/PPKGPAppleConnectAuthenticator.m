@interface PPKGPAppleConnectAuthenticator
- (PPKGPAppleConnectAuthenticator)initWithTokenProvider:(id)a3;
- (PPKMagicGenerativePlaygroundTokenProvider)tokenProvider;
- (void)authenticateIfNeededWithCompletion:(id)a3;
- (void)setTokenProvider:(id)a3;
@end

@implementation PPKGPAppleConnectAuthenticator

- (PPKGPAppleConnectAuthenticator)initWithTokenProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PPKGPAppleConnectAuthenticator;
  v5 = [(PPKGPAppleConnectAuthenticator *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PPKGPAppleConnectAuthenticator *)v5 setTokenProvider:v4];
  }

  return v6;
}

- (void)authenticateIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(PPKGPAppleConnectAuthenticator *)self tokenProvider];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__PPKGPAppleConnectAuthenticator_authenticateIfNeededWithCompletion___block_invoke;
  v7[3] = &unk_2640D3EB0;
  id v8 = v4;
  id v6 = v4;
  [v5 authenticateWithCompletion:v7];
}

uint64_t __69__PPKGPAppleConnectAuthenticator_authenticateIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PPKMagicGenerativePlaygroundTokenProvider)tokenProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tokenProvider);
  return (PPKMagicGenerativePlaygroundTokenProvider *)WeakRetained;
}

- (void)setTokenProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end