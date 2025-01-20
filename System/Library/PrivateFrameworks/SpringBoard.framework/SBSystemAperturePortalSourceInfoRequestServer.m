@interface SBSystemAperturePortalSourceInfoRequestServer
- (SBSystemAperturePortalSourceInfoRequestServer)initWithPortalSource:(id)a3;
- (void)dealloc;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)rootWindowPortalSourceWithCompletion:(id)a3;
- (void)startListener;
@end

@implementation SBSystemAperturePortalSourceInfoRequestServer

- (SBSystemAperturePortalSourceInfoRequestServer)initWithPortalSource:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSystemAperturePortalSourceInfoRequestServer;
  v5 = [(SBSystemAperturePortalSourceInfoRequestServer *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    rootSystemApertureWindowPortalSource = v5->_rootSystemApertureWindowPortalSource;
    v5->_rootSystemApertureWindowPortalSource = (SBSPortalSource *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.springboard.system-aperture-portaling"];
    serviceClientAuthenticator = v5->_serviceClientAuthenticator;
    v5->_serviceClientAuthenticator = (FBServiceClientAuthenticator *)v8;

    v10 = (void *)MEMORY[0x1E4F628A0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__SBSystemAperturePortalSourceInfoRequestServer_initWithPortalSource___block_invoke;
    v15[3] = &unk_1E6AF58F0;
    v11 = v5;
    v16 = v11;
    uint64_t v12 = [v10 listenerWithConfigurator:v15];
    connectionListener = v11->_connectionListener;
    v11->_connectionListener = (BSServiceConnectionListener *)v12;
  }
  return v5;
}

void __70__SBSystemAperturePortalSourceInfoRequestServer_initWithPortalSource___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  v3 = [MEMORY[0x1E4FA6C30] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)startListener
{
}

- (void)dealloc
{
  [(BSServiceConnectionListener *)self->_connectionListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSystemAperturePortalSourceInfoRequestServer;
  [(SBSystemAperturePortalSourceInfoRequestServer *)&v3 dealloc];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "SBSSystemAperturePortalSourceInfoRequestServer received connection %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__57;
  objc_super v17 = __Block_byref_object_dispose__57;
  id v12 = v9;
  id v18 = v12;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__SBSystemAperturePortalSourceInfoRequestServer_listener_didReceiveConnection_withContext___block_invoke;
  v13[3] = &unk_1E6B02AF8;
  v13[4] = self;
  v13[5] = &buf;
  [v12 configureConnection:v13];
  [v12 activate];
  _Block_object_dispose(&buf, 8);
}

void __91__SBSystemAperturePortalSourceInfoRequestServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (void *)MEMORY[0x1E4FA6C30];
  id v4 = a2;
  v5 = [v3 serviceQuality];
  [v4 setServiceQuality:v5];

  uint64_t v6 = [MEMORY[0x1E4FA6C30] interface];
  [v4 setInterface:v6];

  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__SBSystemAperturePortalSourceInfoRequestServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_1E6B02AD0;
  v7[4] = *(void *)(a1 + 40);
  [v4 setInvalidationHandler:v7];
}

void __91__SBSystemAperturePortalSourceInfoRequestServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "SBSSystemAperturePortalSourceInfoRequestServer invalidated connection %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (void)rootWindowPortalSourceWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, SBSPortalSource *, void))a3;
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  int v6 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v7 = [v6 remoteProcess];
  uint64_t v8 = [v7 auditToken];
  id v11 = 0;
  int v9 = [(FBServiceClientAuthenticator *)serviceClientAuthenticator authenticateAuditToken:v8 error:&v11];
  id v10 = v11;

  if (v9)
  {
    if (v4) {
      v4[2](v4, self->_rootSystemApertureWindowPortalSource, 0);
    }
  }
  else if (v4)
  {
    ((void (**)(id, SBSPortalSource *, id))v4)[2](v4, 0, v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClientAuthenticator, 0);
  objc_storeStrong((id *)&self->_rootSystemApertureWindowPortalSource, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

@end