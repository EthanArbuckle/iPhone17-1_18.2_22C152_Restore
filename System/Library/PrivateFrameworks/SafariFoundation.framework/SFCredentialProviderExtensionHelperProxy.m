@interface SFCredentialProviderExtensionHelperProxy
- (SFCredentialProviderExtensionHelperProxy)init;
- (id)_proxyObject;
- (void)dealloc;
- (void)fetchAllCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4;
- (void)fetchAllCredentialIdentitiesMatchingDomains:(id)a3 forExtension:(id)a4 completion:(id)a5;
- (void)fetchAllPaskeyCredentialIdentitiesWithCompletion:(id)a3;
- (void)fetchCredentialIdentitiesForService:(id)a3 serviceIdentifierType:(int64_t)a4 credentialIdentityTypes:(int64_t)a5 completion:(id)a6;
- (void)fetchOneTimeCodeCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4;
- (void)fetchOneTimeCodeCredentialIdentitiesMatchingDomains:(id)a3 forExtension:(id)a4 completion:(id)a5;
- (void)fetchPasskeyCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4;
- (void)fetchPasswordCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4;
- (void)fetchPasswordCredentialIdentitiesMatchingDomains:(id)a3 forExtension:(id)a4 completion:(id)a5;
- (void)getCredentialProviderExtensionStateWithCompletion:(id)a3;
- (void)invalidate;
- (void)removeAllCredentialIdentitiesWithCompletion:(id)a3;
- (void)removeCredentialIdentities:(id)a3 completion:(id)a4;
- (void)removeCredentialIdentityStoreForApplication:(id)a3 completion:(id)a4;
- (void)replaceCredentialIdentitiesWithIdentities:(id)a3 completion:(id)a4;
- (void)saveCredentialIdentities:(id)a3 completion:(id)a4;
@end

@implementation SFCredentialProviderExtensionHelperProxy

- (SFCredentialProviderExtensionHelperProxy)init
{
  v42[3] = *MEMORY[0x263EF8340];
  v39.receiver = self;
  v39.super_class = (Class)SFCredentialProviderExtensionHelperProxy;
  v2 = [(SFCredentialProviderExtensionHelperProxy *)&v39 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.SafariFoundation.CredentialProviderExtensionHelper"];
    connection = v3->_connection;
    v3->_connection = (NSXPCConnection *)v4;

    v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CA81748];
    v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    [v6 setClasses:v9 forSelector:sel_fetchPasswordCredentialIdentitiesMatchingDomains_forExtension_completion_ argumentIndex:0 ofReply:1];

    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    [v6 setClasses:v12 forSelector:sel_fetchPasswordCredentialIdentitiesMatchingDomains_completion_ argumentIndex:0 ofReply:1];

    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    [v6 setClasses:v16 forSelector:sel_fetchPasskeyCredentialIdentitiesMatchingDomains_completion_ argumentIndex:0 ofReply:1];

    v17 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
    [v6 setClasses:v20 forSelector:sel_fetchAllPaskeyCredentialIdentitiesWithCompletion_ argumentIndex:0 ofReply:1];

    v21 = (void *)MEMORY[0x263EFFA08];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    v42[2] = objc_opt_class();
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:3];
    v23 = [v21 setWithArray:v22];
    [v6 setClasses:v23 forSelector:sel_fetchAllCredentialIdentitiesMatchingDomains_forExtension_completion_ argumentIndex:0 ofReply:1];

    v24 = (void *)MEMORY[0x263EFFA08];
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    v41[2] = objc_opt_class();
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:3];
    v26 = [v24 setWithArray:v25];
    [v6 setClasses:v26 forSelector:sel_fetchAllCredentialIdentitiesMatchingDomains_completion_ argumentIndex:0 ofReply:1];

    v27 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    [v6 setClasses:v27 forSelector:sel_fetchOneTimeCodeCredentialIdentitiesMatchingDomains_completion_ argumentIndex:0 ofReply:1];

    v28 = (void *)MEMORY[0x263EFFA08];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
    v30 = [v28 setWithArray:v29];
    [v6 setClasses:v30 forSelector:sel_fetchOneTimeCodeCredentialIdentitiesMatchingDomains_completion_ argumentIndex:0 ofReply:1];

    v31 = (void *)MEMORY[0x263EFFA08];
    uint64_t v32 = objc_opt_class();
    v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    [v6 setClasses:v33 forSelector:sel_fetchCredentialIdentitiesForService_serviceIdentifierType_credentialIdentityTypes_completion_ argumentIndex:0 ofReply:1];

    [(NSXPCConnection *)v3->_connection setRemoteObjectInterface:v6];
    objc_initWeak(&location, v3);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __48__SFCredentialProviderExtensionHelperProxy_init__block_invoke;
    v36[3] = &unk_264390B78;
    objc_copyWeak(&v37, &location);
    [(NSXPCConnection *)v3->_connection setInvalidationHandler:v36];
    [(NSXPCConnection *)v3->_connection resume];
    v34 = v3;
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __48__SFCredentialProviderExtensionHelperProxy_init__block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 4;
    uint64_t v4 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 4);
    v3 = *(void **)&v4[2]._os_unfair_lock_opaque;
    *(void *)&v4[2]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v2);
    WeakRetained = v4;
  }
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_connection;
  os_unfair_lock_unlock(p_lock);
  [(NSXPCConnection *)v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)SFCredentialProviderExtensionHelperProxy;
  [(SFCredentialProviderExtensionHelperProxy *)&v5 dealloc];
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_connection;
  os_unfair_lock_unlock(p_lock);
  [(NSXPCConnection *)v4 invalidate];
}

- (id)_proxyObject
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_connection;
  os_unfair_lock_unlock(p_lock);
  objc_super v5 = [(NSXPCConnection *)v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_3];

  return v5;
}

void __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v3);
  }
}

- (void)getCredentialProviderExtensionStateWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    uint64_t v8 = v4;
    objc_super v5 = [(SFCredentialProviderExtensionHelperProxy *)self _proxyObject];
    v6 = v5;
    if (v5)
    {
      [v5 getCredentialProviderExtensionStateWithCompletion:v8];
    }
    else
    {
      v7 = +[SFCredentialProviderExtensionState credentialProviderExtensionWithDisabledState];
      v8[2](v8, v7);
    }
    uint64_t v4 = v8;
  }
}

- (void)saveCredentialIdentities:(id)a3 completion:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, void, void *))a4;
  v7 = [(SFCredentialProviderExtensionHelperProxy *)self _proxyObject];
  uint64_t v8 = v7;
  if (!v6 || v7)
  {
    [v7 saveCredentialIdentities:v10 completion:v6];
  }
  else
  {
    v9 = [MEMORY[0x263F087E8] errorWithDomain:@"SFExternalCredentialIdentityStoreErrorDomain" code:0 userInfo:0];
    v6[2](v6, 0, v9);
  }
}

- (void)removeCredentialIdentities:(id)a3 completion:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, void, void *))a4;
  v7 = [(SFCredentialProviderExtensionHelperProxy *)self _proxyObject];
  uint64_t v8 = v7;
  if (!v6 || v7)
  {
    [v7 removeCredentialIdentities:v10 completion:v6];
  }
  else
  {
    v9 = [MEMORY[0x263F087E8] errorWithDomain:@"SFExternalCredentialIdentityStoreErrorDomain" code:0 userInfo:0];
    v6[2](v6, 0, v9);
  }
}

- (void)removeAllCredentialIdentitiesWithCompletion:(id)a3
{
  v7 = (void (**)(id, void, void *))a3;
  uint64_t v4 = [(SFCredentialProviderExtensionHelperProxy *)self _proxyObject];
  objc_super v5 = v4;
  if (!v7 || v4)
  {
    [v4 removeAllCredentialIdentitiesWithCompletion:v7];
  }
  else
  {
    v6 = [MEMORY[0x263F087E8] errorWithDomain:@"SFExternalCredentialIdentityStoreErrorDomain" code:0 userInfo:0];
    v7[2](v7, 0, v6);
  }
}

- (void)replaceCredentialIdentitiesWithIdentities:(id)a3 completion:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, void, void *))a4;
  v7 = [(SFCredentialProviderExtensionHelperProxy *)self _proxyObject];
  uint64_t v8 = v7;
  if (!v6 || v7)
  {
    [v7 replaceCredentialIdentitiesWithIdentities:v10 completion:v6];
  }
  else
  {
    v9 = [MEMORY[0x263F087E8] errorWithDomain:@"SFExternalCredentialIdentityStoreErrorDomain" code:0 userInfo:0];
    v6[2](v6, 0, v9);
  }
}

- (void)fetchPasswordCredentialIdentitiesMatchingDomains:(id)a3 forExtension:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    os_unfair_lock_lock(&self->_lock);
    uint64_t v11 = self->_connection;
    os_unfair_lock_unlock(&self->_lock);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __117__SFCredentialProviderExtensionHelperProxy_fetchPasswordCredentialIdentitiesMatchingDomains_forExtension_completion___block_invoke;
    v14[3] = &unk_264390BA0;
    id v12 = v10;
    id v15 = v12;
    v13 = [(NSXPCConnection *)v11 remoteObjectProxyWithErrorHandler:v14];

    if (v13) {
      [v13 fetchPasswordCredentialIdentitiesMatchingDomains:v8 forExtension:v9 completion:v12];
    }
    else {
      (*((void (**)(id, void))v12 + 2))(v12, MEMORY[0x263EFFA68]);
    }
  }
}

void __117__SFCredentialProviderExtensionHelperProxy_fetchPasswordCredentialIdentitiesMatchingDomains_forExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPasswordCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    os_unfair_lock_lock(&self->_lock);
    id v8 = self->_connection;
    os_unfair_lock_unlock(&self->_lock);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __104__SFCredentialProviderExtensionHelperProxy_fetchPasswordCredentialIdentitiesMatchingDomains_completion___block_invoke;
    v11[3] = &unk_264390BA0;
    id v9 = v7;
    id v12 = v9;
    id v10 = [(NSXPCConnection *)v8 remoteObjectProxyWithErrorHandler:v11];

    if (v10) {
      [v10 fetchPasswordCredentialIdentitiesMatchingDomains:v6 completion:v9];
    }
    else {
      (*((void (**)(id, void))v9 + 2))(v9, MEMORY[0x263EFFA68]);
    }
  }
}

void __104__SFCredentialProviderExtensionHelperProxy_fetchPasswordCredentialIdentitiesMatchingDomains_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPasskeyCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    os_unfair_lock_lock(&self->_lock);
    id v8 = self->_connection;
    os_unfair_lock_unlock(&self->_lock);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __103__SFCredentialProviderExtensionHelperProxy_fetchPasskeyCredentialIdentitiesMatchingDomains_completion___block_invoke;
    v11[3] = &unk_264390BA0;
    id v9 = v7;
    id v12 = v9;
    id v10 = [(NSXPCConnection *)v8 synchronousRemoteObjectProxyWithErrorHandler:v11];

    if (v10) {
      [v10 fetchPasskeyCredentialIdentitiesMatchingDomains:v6 completion:v9];
    }
    else {
      (*((void (**)(id, void))v9 + 2))(v9, MEMORY[0x263EFFA68]);
    }
  }
}

void __103__SFCredentialProviderExtensionHelperProxy_fetchPasskeyCredentialIdentitiesMatchingDomains_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllPaskeyCredentialIdentitiesWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_super v5 = self->_connection;
    os_unfair_lock_unlock(&self->_lock);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __93__SFCredentialProviderExtensionHelperProxy_fetchAllPaskeyCredentialIdentitiesWithCompletion___block_invoke;
    v8[3] = &unk_264390BA0;
    id v6 = v4;
    id v9 = v6;
    id v7 = [(NSXPCConnection *)v5 synchronousRemoteObjectProxyWithErrorHandler:v8];

    if (v7) {
      [v7 fetchAllPaskeyCredentialIdentitiesWithCompletion:v6];
    }
    else {
      (*((void (**)(id, void))v6 + 2))(v6, MEMORY[0x263EFFA68]);
    }
  }
}

void __93__SFCredentialProviderExtensionHelperProxy_fetchAllPaskeyCredentialIdentitiesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllCredentialIdentitiesMatchingDomains:(id)a3 forExtension:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    os_unfair_lock_lock(&self->_lock);
    uint64_t v11 = self->_connection;
    os_unfair_lock_unlock(&self->_lock);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __112__SFCredentialProviderExtensionHelperProxy_fetchAllCredentialIdentitiesMatchingDomains_forExtension_completion___block_invoke;
    v14[3] = &unk_264390BA0;
    id v12 = v10;
    id v15 = v12;
    v13 = [(NSXPCConnection *)v11 synchronousRemoteObjectProxyWithErrorHandler:v14];

    if (v13) {
      [v13 fetchAllCredentialIdentitiesMatchingDomains:v8 forExtension:v9 completion:v12];
    }
    else {
      (*((void (**)(id, void))v12 + 2))(v12, MEMORY[0x263EFFA68]);
    }
  }
}

void __112__SFCredentialProviderExtensionHelperProxy_fetchAllCredentialIdentitiesMatchingDomains_forExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    os_unfair_lock_lock(&self->_lock);
    id v8 = self->_connection;
    os_unfair_lock_unlock(&self->_lock);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __99__SFCredentialProviderExtensionHelperProxy_fetchAllCredentialIdentitiesMatchingDomains_completion___block_invoke;
    v11[3] = &unk_264390BA0;
    id v9 = v7;
    id v12 = v9;
    id v10 = [(NSXPCConnection *)v8 synchronousRemoteObjectProxyWithErrorHandler:v11];

    if (v10) {
      [v10 fetchAllCredentialIdentitiesMatchingDomains:v6 completion:v9];
    }
    else {
      (*((void (**)(id, void))v9 + 2))(v9, MEMORY[0x263EFFA68]);
    }
  }
}

void __99__SFCredentialProviderExtensionHelperProxy_fetchAllCredentialIdentitiesMatchingDomains_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchOneTimeCodeCredentialIdentitiesMatchingDomains:(id)a3 forExtension:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    os_unfair_lock_lock(&self->_lock);
    uint64_t v11 = self->_connection;
    os_unfair_lock_unlock(&self->_lock);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __120__SFCredentialProviderExtensionHelperProxy_fetchOneTimeCodeCredentialIdentitiesMatchingDomains_forExtension_completion___block_invoke;
    v14[3] = &unk_264390BA0;
    id v12 = v10;
    id v15 = v12;
    v13 = [(NSXPCConnection *)v11 synchronousRemoteObjectProxyWithErrorHandler:v14];

    if (v13) {
      [v13 fetchOneTimeCodeCredentialIdentitiesMatchingDomains:v8 forExtension:v9 completion:v12];
    }
    else {
      (*((void (**)(id, void))v12 + 2))(v12, MEMORY[0x263EFFA68]);
    }
  }
}

void __120__SFCredentialProviderExtensionHelperProxy_fetchOneTimeCodeCredentialIdentitiesMatchingDomains_forExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchOneTimeCodeCredentialIdentitiesMatchingDomains:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    os_unfair_lock_lock(&self->_lock);
    id v8 = self->_connection;
    os_unfair_lock_unlock(&self->_lock);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __107__SFCredentialProviderExtensionHelperProxy_fetchOneTimeCodeCredentialIdentitiesMatchingDomains_completion___block_invoke;
    v11[3] = &unk_264390BA0;
    id v9 = v7;
    id v12 = v9;
    id v10 = [(NSXPCConnection *)v8 synchronousRemoteObjectProxyWithErrorHandler:v11];

    if (v10) {
      [v10 fetchOneTimeCodeCredentialIdentitiesMatchingDomains:v6 completion:v9];
    }
    else {
      (*((void (**)(id, void))v9 + 2))(v9, MEMORY[0x263EFFA68]);
    }
  }
}

void __107__SFCredentialProviderExtensionHelperProxy_fetchOneTimeCodeCredentialIdentitiesMatchingDomains_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeCredentialIdentityStoreForApplication:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [(SFCredentialProviderExtensionHelperProxy *)self _proxyObject];
  id v8 = v7;
  if (!v6 || v7)
  {
    [v7 removeCredentialIdentityStoreForApplication:v10 completion:v6];
  }
  else
  {
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"SFExternalCredentialIdentityStoreErrorDomain" code:0 userInfo:0];
    v6[2](v6, 0, v9);
  }
}

- (void)fetchCredentialIdentitiesForService:(id)a3 serviceIdentifierType:(int64_t)a4 credentialIdentityTypes:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  os_unfair_lock_lock(&self->_lock);
  id v12 = self->_connection;
  os_unfair_lock_unlock(&self->_lock);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __137__SFCredentialProviderExtensionHelperProxy_fetchCredentialIdentitiesForService_serviceIdentifierType_credentialIdentityTypes_completion___block_invoke;
  v15[3] = &unk_264390BA0;
  id v13 = v11;
  id v16 = v13;
  uint64_t v14 = [(NSXPCConnection *)v12 synchronousRemoteObjectProxyWithErrorHandler:v15];

  if (v14) {
    [v14 fetchCredentialIdentitiesForService:v10 serviceIdentifierType:a4 credentialIdentityTypes:a5 completion:v13];
  }
  else {
    (*((void (**)(id, void))v13 + 2))(v13, MEMORY[0x263EFFA68]);
  }
}

void __137__SFCredentialProviderExtensionHelperProxy_fetchCredentialIdentitiesForService_serviceIdentifierType_credentialIdentityTypes_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCredentials();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

void __56__SFCredentialProviderExtensionHelperProxy__proxyObject__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218FBF000, v4, v5, "Failed to get a remote proxy object with error: %{public}@", v6, v7, v8, v9, v10);
}

@end