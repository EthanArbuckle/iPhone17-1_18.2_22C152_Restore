@interface STCommunicationClientAuthenticationSource
- (STAuthenticationSession)authenticationSession;
- (STCommunicationClientAuthenticationSource)initWithAuthenticationSession:(id)a3;
- (void)authenticateWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5;
- (void)setAuthenticationSession:(id)a3;
@end

@implementation STCommunicationClientAuthenticationSource

- (STCommunicationClientAuthenticationSource)initWithAuthenticationSession:(id)a3
{
  v4 = (STAuthenticationSession *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STCommunicationClientAuthenticationSource;
  v5 = [(STCommunicationClientAuthenticationSource *)&v8 init];
  authenticationSession = v5->_authenticationSession;
  v5->_authenticationSession = v4;

  return v5;
}

- (void)authenticateWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5
{
  id v7 = a3;
  objc_super v8 = (void (**)(id, uint64_t))a5;
  v9 = objc_opt_new();
  v10 = [(STCommunicationClientAuthenticationSource *)self authenticationSession];
  int v11 = [v10 hasAlreadyEnteredPINForSession];

  if (v11)
  {
    v8[2](v8, 1);
  }
  else
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __97__STCommunicationClientAuthenticationSource_authenticateWithIdentifier_forced_completionHandler___block_invoke;
    v12[3] = &unk_1E6BC7588;
    objc_copyWeak(&v14, &location);
    v13 = v8;
    [v9 authenticateForCommunicationConfigurationOverrideWithCompletionHandler:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

uint64_t __97__STCommunicationClientAuthenticationSource_authenticateWithIdentifier_forced_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 authenticated];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = [WeakRetained authenticationSession];
    [v5 setHasAlreadyEnteredPINForSession:v3];
  }
  v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v6();
}

- (STAuthenticationSession)authenticationSession
{
  return self->_authenticationSession;
}

- (void)setAuthenticationSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end