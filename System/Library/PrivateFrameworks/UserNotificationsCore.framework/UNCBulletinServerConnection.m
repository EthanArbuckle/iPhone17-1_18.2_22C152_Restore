@interface UNCBulletinServerConnection
+ (id)clientInterface;
+ (id)serverInterface;
- (UNCBulletinServerConnection)init;
- (UNCBulletinServerConnection)initWithQueue:(id)a3;
- (id)_ensureBBServerSettingsConnection;
- (id)activeSectionIDs;
- (id)asyncServerProxyObject;
- (id)serverProxyObject;
- (void)_resetBBServerSettingsConnection;
- (void)dealloc;
- (void)refreshAnnounceSettings;
- (void)refreshGlobalSettings;
- (void)refreshSectionInfo;
- (void)refreshSectionInfoForID:(id)a3;
@end

@implementation UNCBulletinServerConnection

+ (id)clientInterface
{
  if (clientInterface_onceToken_0 != -1) {
    dispatch_once(&clientInterface_onceToken_0, &__block_literal_global_23);
  }
  v2 = (void *)clientInterface___interface_0;

  return v2;
}

uint64_t __46__UNCBulletinServerConnection_clientInterface__block_invoke()
{
  clientInterface___interface_0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270CFF880];

  return MEMORY[0x270F9A758]();
}

+ (id)serverInterface
{
  if (serverInterface_onceToken_0 != -1) {
    dispatch_once(&serverInterface_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)serverInterface___interface_0;

  return v2;
}

void __46__UNCBulletinServerConnection_serverInterface__block_invoke()
{
  v6[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270CFF8E0];
  v1 = (void *)serverInterface___interface_0;
  serverInterface___interface_0 = v0;

  v2 = (void *)serverInterface___interface_0;
  v3 = (void *)MEMORY[0x263EFFA08];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_getActiveSectionIDsWithHandler_ argumentIndex:0 ofReply:1];
}

- (UNCBulletinServerConnection)init
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.usernotificationscore.bulletinserverconnection", 0);
  v4 = [(UNCBulletinServerConnection *)self initWithQueue:v3];

  return v4;
}

- (UNCBulletinServerConnection)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNCBulletinServerConnection;
  v6 = [(UNCBulletinServerConnection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_bbServerConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UNCBulletinServerConnection;
  [(UNCBulletinServerConnection *)&v3 dealloc];
}

- (id)_ensureBBServerSettingsConnection
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  bbServerConnection = self->_bbServerConnection;
  if (!bbServerConnection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.bulletinboard.settingsconnection" options:0];
    id v5 = self->_bbServerConnection;
    self->_bbServerConnection = v4;

    v6 = self->_bbServerConnection;
    v7 = [(id)objc_opt_class() serverInterface];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    v8 = self->_bbServerConnection;
    objc_super v9 = [(id)objc_opt_class() clientInterface];
    [(NSXPCConnection *)v8 setExportedInterface:v9];

    [(NSXPCConnection *)self->_bbServerConnection setExportedObject:self];
    [(NSXPCConnection *)self->_bbServerConnection setInterruptionHandler:&__block_literal_global_23_0];
    objc_initWeak(&location, self);
    v10 = self->_bbServerConnection;
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __64__UNCBulletinServerConnection__ensureBBServerSettingsConnection__block_invoke_24;
    v17 = &unk_265568678;
    objc_copyWeak(&v18, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:&v14];
    [(NSXPCConnection *)self->_bbServerConnection resume];
    v11 = *MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_bbServerConnection;
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      _os_log_impl(&dword_2608DB000, v11, OS_LOG_TYPE_DEFAULT, "UNCBulletinServerConnection: Connected to BBServer: %@", buf, 0xCu);
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    bbServerConnection = self->_bbServerConnection;
  }

  return bbServerConnection;
}

void __64__UNCBulletinServerConnection__ensureBBServerSettingsConnection__block_invoke()
{
  uint64_t v0 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2608DB000, v0, OS_LOG_TYPE_DEFAULT, "Connection to BBServer interrupted", v1, 2u);
  }
}

void __64__UNCBulletinServerConnection__ensureBBServerSettingsConnection__block_invoke_24(uint64_t a1)
{
  v2 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2608DB000, v2, OS_LOG_TYPE_DEFAULT, "Connection to BBServer invalidated", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetBBServerSettingsConnection];
}

- (void)_resetBBServerSettingsConnection
{
  [(NSXPCConnection *)self->_bbServerConnection invalidate];
  [(NSXPCConnection *)self->_bbServerConnection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_bbServerConnection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_bbServerConnection setExportedObject:0];
  bbServerConnection = self->_bbServerConnection;
  self->_bbServerConnection = 0;
}

- (id)serverProxyObject
{
  v2 = [(UNCBulletinServerConnection *)self _ensureBBServerSettingsConnection];
  objc_super v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_27];

  return v3;
}

void __48__UNCBulletinServerConnection_serverProxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
    __48__UNCBulletinServerConnection_serverProxyObject__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (id)asyncServerProxyObject
{
  id v2 = [(UNCBulletinServerConnection *)self _ensureBBServerSettingsConnection];
  objc_super v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_29_0];

  return v3;
}

void __53__UNCBulletinServerConnection_asyncServerProxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
    __53__UNCBulletinServerConnection_asyncServerProxyObject__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (id)activeSectionIDs
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__15;
  id v11 = 0;
  id v2 = [(UNCBulletinServerConnection *)self serverProxyObject];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__UNCBulletinServerConnection_activeSectionIDs__block_invoke;
  v5[3] = &unk_2655686C0;
  v5[4] = &v6;
  [v2 getActiveSectionIDsWithHandler:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__UNCBulletinServerConnection_activeSectionIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v8 = *MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      __47__UNCBulletinServerConnection_activeSectionIDs__block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)refreshAnnounceSettings
{
  id v2 = [(UNCBulletinServerConnection *)self asyncServerProxyObject];
  [v2 refreshAnnounceSettings];
}

- (void)refreshGlobalSettings
{
  id v2 = [(UNCBulletinServerConnection *)self asyncServerProxyObject];
  [v2 refreshGlobalSettings];
}

- (void)refreshSectionInfo
{
  id v2 = [(UNCBulletinServerConnection *)self asyncServerProxyObject];
  [v2 refreshSectionInfo];
}

- (void)refreshSectionInfoForID:(id)a3
{
  id v4 = a3;
  id v5 = [(UNCBulletinServerConnection *)self asyncServerProxyObject];
  [v5 refreshSectionInfoForID:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_bbServerConnection, 0);
}

void __48__UNCBulletinServerConnection_serverProxyObject__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __53__UNCBulletinServerConnection_asyncServerProxyObject__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __47__UNCBulletinServerConnection_activeSectionIDs__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end