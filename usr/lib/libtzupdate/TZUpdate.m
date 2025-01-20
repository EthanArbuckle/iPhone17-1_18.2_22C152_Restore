@interface TZUpdate
+ (id)sharedInstance;
- (BOOL)alertForAllZones;
- (BOOL)isUpdateWaiting;
- (NSXPCConnection)connectionToService;
- (TZFileSystemInterface)fileSystemInterface;
- (TZUpdate)init;
- (id)affectedZones;
- (id)createNewXPCConnection;
- (id)currentTZDataVersion;
- (id)updateTZDataVersion;
- (void)isUpdateWaitingWithCompletion:(id)a3;
- (void)purgeAllAssetsWithCompletion:(id)a3;
- (void)setConnectionToService:(id)a3;
- (void)setFileSystemInterface:(id)a3;
@end

@implementation TZUpdate

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1) {
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_tzUpdateShared;

  return v2;
}

uint64_t __26__TZUpdate_sharedInstance__block_invoke()
{
  if (+[TZDLogging canLogMessageAtLevel:2]) {
    NSLog(&cfstr_SInitializingT_0.isa, "+[TZUpdate sharedInstance]_block_invoke");
  }
  sharedInstance_tzUpdateShared = objc_alloc_init(TZUpdate);

  return MEMORY[0x270F9A758]();
}

- (TZUpdate)init
{
  v6.receiver = self;
  v6.super_class = (Class)TZUpdate;
  v2 = [(TZUpdate *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[TZFileSystemInterface sharedInstance];
    fileSystemInterface = v2->_fileSystemInterface;
    v2->_fileSystemInterface = (TZFileSystemInterface *)v3;
  }
  return v2;
}

- (id)createNewXPCConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.timezoneupdates.tzd.server" options:4096];
  uint64_t v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BE16410];
  [v2 setRemoteObjectInterface:v3];
  [v2 resume];

  return v2;
}

- (void)isUpdateWaitingWithCompletion:(id)a3
{
  id v5 = a3;
  objc_super v6 = [(TZUpdate *)self createNewXPCConnection];
  if (+[TZDLogging canLogMessageAtLevel:2])
  {
    v7 = NSStringFromSelector(a2);
    NSLog(&cfstr_SCallingViaXpc.isa, "-[TZUpdate isUpdateWaitingWithCompletion:]", v7);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __42__TZUpdate_isUpdateWaitingWithCompletion___block_invoke;
  v17[3] = &unk_263FD0850;
  SEL v20 = a2;
  id v8 = v6;
  id v18 = v8;
  id v9 = v5;
  id v19 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v17];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __42__TZUpdate_isUpdateWaitingWithCompletion___block_invoke_2;
  v13[3] = &unk_263FD0878;
  id v15 = v9;
  SEL v16 = a2;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  [v10 isUpdateWaitingWithReply:v13];
}

void __42__TZUpdate_isUpdateWaitingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (+[TZDLogging canLogMessageAtLevel:0])
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    NSLog(&cfstr_SEncounteredEr_0.isa, "-[TZUpdate isUpdateWaitingWithCompletion:]_block_invoke", v3, v4);
  }
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __42__TZUpdate_isUpdateWaitingWithCompletion___block_invoke_2(uint64_t a1, unsigned int a2)
{
  if (+[TZDLogging canLogMessageAtLevel:2])
  {
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    NSLog(&cfstr_SReceievedRepl.isa, "-[TZUpdate isUpdateWaitingWithCompletion:]_block_invoke_2", v4, a2);
  }
  [*(id *)(a1 + 32) invalidate];
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v5();
}

- (void)purgeAllAssetsWithCompletion:(id)a3
{
  id v5 = a3;
  objc_super v6 = [(TZUpdate *)self createNewXPCConnection];
  if (+[TZDLogging canLogMessageAtLevel:2])
  {
    v7 = NSStringFromSelector(a2);
    NSLog(&cfstr_SCallingViaXpc.isa, "-[TZUpdate purgeAllAssetsWithCompletion:]", v7);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __41__TZUpdate_purgeAllAssetsWithCompletion___block_invoke;
  v17[3] = &unk_263FD0850;
  SEL v20 = a2;
  id v8 = v6;
  id v18 = v8;
  id v9 = v5;
  id v19 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v17];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __41__TZUpdate_purgeAllAssetsWithCompletion___block_invoke_2;
  v13[3] = &unk_263FD08A0;
  id v15 = v9;
  SEL v16 = a2;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  [v10 purgeAllAssetsWithReply:v13];
}

void __41__TZUpdate_purgeAllAssetsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (+[TZDLogging canLogMessageAtLevel:0])
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    NSLog(&cfstr_SEncounteredEr_0.isa, "-[TZUpdate purgeAllAssetsWithCompletion:]_block_invoke", v3, v4);
  }
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __41__TZUpdate_purgeAllAssetsWithCompletion___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v6 = a3;
  if (+[TZDLogging canLogMessageAtLevel:2])
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    NSLog(&cfstr_SReceievedRepl_0.isa, "-[TZUpdate purgeAllAssetsWithCompletion:]_block_invoke_2", v5, a2, v6);
  }
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)affectedZones
{
  if ([(TZUpdate *)self isUpdateWaiting])
  {
    uint64_t v3 = (void *)MEMORY[0x263EFF9C0];
    id v4 = [(TZUpdate *)self fileSystemInterface];
    id v5 = [v4 latestVersionInfo];
    id v6 = [v5 changedFiles];
    v7 = [v3 setWithArray:v6];

    id v8 = (void *)MEMORY[0x263EFFA08];
    id v9 = [MEMORY[0x263EFFA18] knownTimeZoneNames];
    v10 = [v8 setWithArray:v9];
    [v7 intersectSet:v10];

    id v11 = [v7 allObjects];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)currentTZDataVersion
{
  v2 = [(TZUpdate *)self fileSystemInterface];
  uint64_t v3 = [v2 currentVersionInfo];
  id v4 = [v3 versionString];

  return v4;
}

- (BOOL)alertForAllZones
{
  BOOL v3 = [(TZUpdate *)self isUpdateWaiting];
  if (v3)
  {
    id v4 = [(TZUpdate *)self fileSystemInterface];
    id v5 = [v4 latestVersionInfo];
    id v6 = [v5 shouldAlertAll];
    char v7 = [v6 BOOLValue];

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (id)updateTZDataVersion
{
  if ([(TZUpdate *)self isUpdateWaiting])
  {
    BOOL v3 = [(TZUpdate *)self fileSystemInterface];
    id v4 = [v3 latestVersionInfo];
    id v5 = [v4 versionString];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isUpdateWaiting
{
  BOOL v3 = [(TZUpdate *)self fileSystemInterface];
  id v4 = [v3 latestVersionInfo];
  id v5 = [v4 versionString];
  if (v5)
  {
    id v6 = [(TZUpdate *)self fileSystemInterface];
    char v7 = [v6 latestVersionInfo];
    id v8 = [v7 versionString];
    id v9 = [(TZUpdate *)self fileSystemInterface];
    v10 = [v9 currentVersionInfo];
    id v11 = [v10 versionString];
    int v12 = [v8 isEqualToString:v11] ^ 1;
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (TZFileSystemInterface)fileSystemInterface
{
  return (TZFileSystemInterface *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFileSystemInterface:(id)a3
{
}

- (NSXPCConnection)connectionToService
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnectionToService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToService, 0);

  objc_storeStrong((id *)&self->_fileSystemInterface, 0);
}

@end