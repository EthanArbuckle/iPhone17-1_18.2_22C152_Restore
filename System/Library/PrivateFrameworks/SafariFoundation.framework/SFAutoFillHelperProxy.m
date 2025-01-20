@interface SFAutoFillHelperProxy
- (SFAutoFillHelperProxy)init;
- (void)_getAutomaticStrongPasswordForAppWithPasswordRules:(id)a3 confirmPasswordRules:(id)a4 overrideApplicationIdentifier:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)getAutomaticStrongPasswordForAppWithPasswordRules:(id)a3 confirmPasswordRules:(id)a4 completion:(id)a5;
- (void)getRemoteAutoFillAvailabilityWithCompletionHandler:(id)a3;
- (void)invalidate;
@end

@implementation SFAutoFillHelperProxy

- (SFAutoFillHelperProxy)init
{
  v14.receiver = self;
  v14.super_class = (Class)SFAutoFillHelperProxy;
  v2 = [(SFAutoFillHelperProxy *)&v14 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.SafariFoundation.AutoFillHelper"];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CA80710];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __29__SFAutoFillHelperProxy_init__block_invoke;
    v11 = &unk_264390B78;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:&v8];
    [(NSXPCConnection *)v2->_connection resume];
    v6 = v2;
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }

  return v2;
}

void __29__SFAutoFillHelperProxy_init__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    uint64_t v3 = WeakRetained;

    WeakRetained = v3;
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SFAutoFillHelperProxy;
  [(SFAutoFillHelperProxy *)&v3 dealloc];
}

- (void)invalidate
{
}

- (void)getAutomaticStrongPasswordForAppWithPasswordRules:(id)a3 confirmPasswordRules:(id)a4 completion:(id)a5
{
}

- (void)_getAutomaticStrongPasswordForAppWithPasswordRules:(id)a3 confirmPasswordRules:(id)a4 overrideApplicationIdentifier:(id)a5 completion:(id)a6
{
  if (a6) {
    (*((void (**)(id, void, void))a6 + 2))(a6, 0, 0);
  }
}

- (void)getRemoteAutoFillAvailabilityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__SFAutoFillHelperProxy_getRemoteAutoFillAvailabilityWithCompletionHandler___block_invoke;
  v9[3] = &unk_264390BA0;
  id v6 = v4;
  id v10 = v6;
  v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];
  uint64_t v8 = v7;
  if (v7) {
    [v7 getRemoteAutoFillAvailabilityWithCompletionHandler:v6];
  }
}

void __76__SFAutoFillHelperProxy_getRemoteAutoFillAvailabilityWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SFAutoFillHelperProxy_getRemoteAutoFillAvailabilityWithCompletionHandler___block_invoke_cold_1(v4, v3);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

void __76__SFAutoFillHelperProxy_getRemoteAutoFillAvailabilityWithCompletionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_218FBF000, v3, OS_LOG_TYPE_ERROR, "Failed to get a remote proxy object with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end