@interface SBSSysdiagnoseInterface
- (NSXPCConnection)sbConnection;
- (SBSImplementer)sbProxy;
- (SBSSysdiagnoseInterface)init;
- (SBSSysdiagnoseInterface)initWithTarget:(id)a3;
- (void)airDropSysdiagnose:(id)a3 airDropID:(id)a4 completionHandler:(id)a5;
- (void)cancelSysdiagnose:(id)a3;
- (void)createSysdiagnose:(id)a3;
- (void)dealloc;
- (void)sysdiagnoseHasStarted:(BOOL)a3;
@end

@implementation SBSSysdiagnoseInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

- (SBSImplementer)sbProxy
{
  return self->_sbProxy;
}

- (NSXPCConnection)sbConnection
{
  return self->_sbConnection;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_sbConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSSysdiagnoseInterface;
  [(SBSSysdiagnoseInterface *)&v3 dealloc];
}

- (void)airDropSysdiagnose:(id)a3 airDropID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  sbProxy = self->_sbProxy;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__SBSSysdiagnoseInterface_airDropSysdiagnose_airDropID_completionHandler___block_invoke;
  v11[3] = &unk_264BA43F8;
  id v12 = v8;
  id v10 = v8;
  [(SBSImplementer *)sbProxy airDropSysdiagnose:a3 airDropID:a4 completionHandler:v11];
}

uint64_t __74__SBSSysdiagnoseInterface_airDropSysdiagnose_airDropID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelSysdiagnose:(id)a3
{
  id v4 = a3;
  sbProxy = self->_sbProxy;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SBSSysdiagnoseInterface_cancelSysdiagnose___block_invoke;
  v7[3] = &unk_264BA4708;
  id v8 = v4;
  id v6 = v4;
  [(SBSImplementer *)sbProxy cancelCurrentSysdiagnose:v7];
}

uint64_t __45__SBSSysdiagnoseInterface_cancelSysdiagnose___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createSysdiagnose:(id)a3
{
  id v4 = a3;
  sbProxy = self->_sbProxy;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SBSSysdiagnoseInterface_createSysdiagnose___block_invoke;
  v7[3] = &unk_264BA43D0;
  id v8 = v4;
  id v6 = v4;
  [(SBSImplementer *)sbProxy createSysdiagnose:v7];
}

uint64_t __45__SBSSysdiagnoseInterface_createSysdiagnose___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sysdiagnoseHasStarted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBSSysdiagnoseInterface *)self sbConnection];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__SBSSysdiagnoseInterface_sysdiagnoseHasStarted___block_invoke;
  v6[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
  BOOL v7 = v3;
  v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v6];
  [v5 sysdiagnoseHasStarted:v3];
}

void __49__SBSSysdiagnoseInterface_sysdiagnoseHasStarted___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _SBSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = *(unsigned __int8 *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = v5;
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_230B2C000, v4, OS_LOG_TYPE_ERROR, "Failed to set sysdiagnose started to %d, %@", (uint8_t *)v6, 0x12u);
  }
}

- (SBSSysdiagnoseInterface)initWithTarget:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSSysdiagnoseInterface;
  int v5 = [(SBSSysdiagnoseInterface *)&v13 init];
  if (v5)
  {
    if ([v4 isEqualToString:@"localhost"])
    {
      uint64_t v6 = +[SBSUtils connectionWithExportedObject:0];
      sbConnection = v5->_sbConnection;
      v5->_sbConnection = (NSXPCConnection *)v6;

      id v8 = [(SBSSysdiagnoseInterface *)v5 sbConnection];
      uint64_t v9 = [v8 remoteObjectProxy];
      sbProxy = v5->_sbProxy;
      v5->_sbProxy = (SBSImplementer *)v9;
    }
    else
    {
      uint64_t v11 = +[SBSUtils createProxyConnectionForRapportTarget:v4];
      id v8 = v5->_sbProxy;
      v5->_sbProxy = (SBSImplementer *)v11;
    }
  }
  return v5;
}

- (SBSSysdiagnoseInterface)init
{
  return [(SBSSysdiagnoseInterface *)self initWithTarget:@"localhost"];
}

@end