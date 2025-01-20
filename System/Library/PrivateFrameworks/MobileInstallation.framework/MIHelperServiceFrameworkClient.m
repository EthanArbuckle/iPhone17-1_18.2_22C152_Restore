@interface MIHelperServiceFrameworkClient
+ (id)sharedInstance;
- (BOOL)createWrappedAppForInstalledBundleIdentifier:(id)a3 atTargetURL:(id)a4 installationInfo:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7;
- (BOOL)createWrappedAppForInstalledBundleIdentifier:(id)a3 atTargetURL:(id)a4 installationRecords:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7;
- (BOOL)purgeInstallCoordinationPromiseStagingDirectoryForUUID:(id)a3 keepStagingDirectory:(BOOL)a4 error:(id *)a5;
- (BOOL)removeDeveloperAppAtURL:(id)a3 error:(id *)a4;
- (BOOL)removeWrappedAppWithBundleID:(id)a3 atURL:(id)a4 error:(id *)a5;
- (NSXPCConnection)xpcConnection;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_sharedConnection;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)createWrappedAppForInstalledBundleIdentifier:(id)a3 inTargetDirectory:(id)a4 installationInfo:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7;
- (id)createWrappedAppForInstalledBundleIdentifier:(id)a3 inTargetDirectory:(id)a4 installationRecords:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7;
- (id)installMacDeveloperAppAtURL:(id)a3 toURL:(id)a4 targetURLType:(unint64_t)a5 error:(id *)a6;
- (id)updateWrappedAppAt:(id)a3 forInstalledBundleIdentifier:(id)a4 installationInfo:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7;
- (id)updateWrappedAppAt:(id)a3 forInstalledBundleIdentifier:(id)a4 installationRecords:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7;
- (void)_invalidateObject;
- (void)dealloc;
- (void)setXpcConnection:(id)a3;
@end

@implementation MIHelperServiceFrameworkClient

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MIHelperServiceFrameworkClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __48__MIHelperServiceFrameworkClient_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (void)_invalidateObject
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(MIHelperServiceFrameworkClient *)obj xpcConnection];
  [v2 invalidate];

  [(MIHelperServiceFrameworkClient *)obj setXpcConnection:0];
  objc_sync_exit(obj);
}

- (void)dealloc
{
  [(MIHelperServiceFrameworkClient *)self _invalidateObject];
  v3.receiver = self;
  v3.super_class = (Class)MIHelperServiceFrameworkClient;
  [(MIHelperServiceFrameworkClient *)&v3 dealloc];
}

- (id)_sharedConnection
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = [(MIHelperServiceFrameworkClient *)v2 xpcConnection];

  if (!v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.MobileInstallationHelperService"];
    [(MIHelperServiceFrameworkClient *)v2 setXpcConnection:v4];

    v5 = [(MIHelperServiceFrameworkClient *)v2 xpcConnection];

    if (!v5) {
      goto LABEL_5;
    }
    v6 = MobileInstallationHelperServiceProtocolInterface();
    v7 = [(MIHelperServiceFrameworkClient *)v2 xpcConnection];
    [v7 setRemoteObjectInterface:v6];

    objc_initWeak(&location, v2);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__MIHelperServiceFrameworkClient__sharedConnection__block_invoke;
    v14[3] = &unk_1E60C4D40;
    objc_copyWeak(&v15, &location);
    v8 = [(MIHelperServiceFrameworkClient *)v2 xpcConnection];
    [v8 setInterruptionHandler:v14];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__MIHelperServiceFrameworkClient__sharedConnection__block_invoke_2;
    v12[3] = &unk_1E60C4D40;
    objc_copyWeak(&v13, &location);
    v9 = [(MIHelperServiceFrameworkClient *)v2 xpcConnection];
    [v9 setInvalidationHandler:v12];

    v10 = [(MIHelperServiceFrameworkClient *)v2 xpcConnection];
    [v10 resume];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  v5 = [(MIHelperServiceFrameworkClient *)v2 xpcConnection];
LABEL_5:
  objc_sync_exit(v2);

  return v5;
}

void __51__MIHelperServiceFrameworkClient__sharedConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateObject];
}

void __51__MIHelperServiceFrameworkClient__sharedConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateObject];
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(MIHelperServiceFrameworkClient *)self _sharedConnection];
  v7 = v5;
  if (v5)
  {
    v8 = [v5 remoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    v9 = _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient _remoteObjectProxyWithErrorHandler:]", 82, (void *)*MEMORY[0x1E4F6F548], 4, 0, 0, @"Failed to get XPC connection", v6, v11);
    v4[2](v4, v9);

    v8 = 0;
  }

  return v8;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(MIHelperServiceFrameworkClient *)self _sharedConnection];
  v7 = v5;
  if (v5)
  {
    v8 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    v9 = _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient _synchronousRemoteObjectProxyWithErrorHandler:]", 93, (void *)*MEMORY[0x1E4F6F548], 4, 0, 0, @"Failed to get XPC connection", v6, v11);
    v4[2](v4, v9);

    v8 = 0;
  }

  return v8;
}

- (BOOL)purgeInstallCoordinationPromiseStagingDirectoryForUUID:(id)a3 keepStagingDirectory:(BOOL)a4 error:(id *)a5
{
  v7 = _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient purgeInstallCoordinationPromiseStagingDirectoryForUUID:keepStagingDirectory:error:]", 121, (void *)*MEMORY[0x1E4F6F548], 4, 0, 0, @"%s is not available on this platform!", v5, (uint64_t)"-[MIHelperServiceFrameworkClient purgeInstallCoordinationPromiseStagingDirectoryForUUID:keepStagingDirectory:error:]");
  v8 = v7;
  if (a5) {
    *a5 = v7;
  }

  return 0;
}

- (id)createWrappedAppForInstalledBundleIdentifier:(id)a3 inTargetDirectory:(id)a4 installationInfo:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  v12 = (void *)MEMORY[0x1E4F6F578];
  uint64_t v13 = *MEMORY[0x1E4F6F5E0];
  id v14 = a4;
  id v15 = a3;
  v16 = [a5 objectForKey:v13];
  v17 = [v12 infoDictionaryArrayToBundleRecordArray:v16];

  long long v18 = *(_OWORD *)&a6->var0[4];
  v21[0] = *(_OWORD *)a6->var0;
  v21[1] = v18;
  v19 = [(MIHelperServiceFrameworkClient *)self createWrappedAppForInstalledBundleIdentifier:v15 inTargetDirectory:v14 installationRecords:v17 onBehalfOf:v21 error:a7];

  return v19;
}

- (id)createWrappedAppForInstalledBundleIdentifier:(id)a3 inTargetDirectory:(id)a4 installationRecords:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  v9 = _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient createWrappedAppForInstalledBundleIdentifier:inTargetDirectory:installationRecords:onBehalfOf:error:]", 156, (void *)*MEMORY[0x1E4F6F548], 4, 0, 0, @"%s is not available on this platform!", v7, (uint64_t)"-[MIHelperServiceFrameworkClient createWrappedAppForInstalledBundleIdentifier:inTargetDirectory:installationRecords:onBehalfOf:error:]");
  v10 = v9;
  if (a7) {
    *a7 = v9;
  }

  return 0;
}

- (BOOL)createWrappedAppForInstalledBundleIdentifier:(id)a3 atTargetURL:(id)a4 installationInfo:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  v12 = (void *)MEMORY[0x1E4F6F578];
  uint64_t v13 = *MEMORY[0x1E4F6F5E0];
  id v14 = a4;
  id v15 = a3;
  v16 = [a5 objectForKey:v13];
  v17 = [v12 infoDictionaryArrayToBundleRecordArray:v16];

  long long v18 = *(_OWORD *)&a6->var0[4];
  v20[0] = *(_OWORD *)a6->var0;
  v20[1] = v18;
  LOBYTE(a7) = [(MIHelperServiceFrameworkClient *)self createWrappedAppForInstalledBundleIdentifier:v15 atTargetURL:v14 installationRecords:v17 onBehalfOf:v20 error:a7];

  return (char)a7;
}

- (BOOL)createWrappedAppForInstalledBundleIdentifier:(id)a3 atTargetURL:(id)a4 installationRecords:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  v9 = _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient createWrappedAppForInstalledBundleIdentifier:atTargetURL:installationRecords:onBehalfOf:error:]", 191, (void *)*MEMORY[0x1E4F6F548], 4, 0, 0, @"%s is not available on this platform!", v7, (uint64_t)"-[MIHelperServiceFrameworkClient createWrappedAppForInstalledBundleIdentifier:atTargetURL:installationRecords:onBehalfOf:error:]");
  v10 = v9;
  if (a7) {
    *a7 = v9;
  }

  return 0;
}

- (id)updateWrappedAppAt:(id)a3 forInstalledBundleIdentifier:(id)a4 installationInfo:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  v12 = (void *)MEMORY[0x1E4F6F578];
  uint64_t v13 = *MEMORY[0x1E4F6F5E0];
  id v14 = a4;
  id v15 = a3;
  v16 = [a5 objectForKey:v13];
  v17 = [v12 infoDictionaryArrayToBundleRecordArray:v16];

  long long v18 = *(_OWORD *)&a6->var0[4];
  v21[0] = *(_OWORD *)a6->var0;
  v21[1] = v18;
  v19 = [(MIHelperServiceFrameworkClient *)self updateWrappedAppAt:v15 forInstalledBundleIdentifier:v14 installationRecords:v17 onBehalfOf:v21 error:a7];

  return v19;
}

- (id)updateWrappedAppAt:(id)a3 forInstalledBundleIdentifier:(id)a4 installationRecords:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  v9 = _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient updateWrappedAppAt:forInstalledBundleIdentifier:installationRecords:onBehalfOf:error:]", 226, (void *)*MEMORY[0x1E4F6F548], 4, 0, 0, @"%s is not available on this platform!", v7, (uint64_t)"-[MIHelperServiceFrameworkClient updateWrappedAppAt:forInstalledBundleIdentifier:installationRecords:onBehalfOf:error:]");
  v10 = v9;
  if (a7) {
    *a7 = v9;
  }

  return 0;
}

- (BOOL)removeWrappedAppWithBundleID:(id)a3 atURL:(id)a4 error:(id *)a5
{
  uint64_t v7 = _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient removeWrappedAppWithBundleID:atURL:error:]", 250, (void *)*MEMORY[0x1E4F6F548], 4, 0, 0, @"%s is not available on this platform!", v5, (uint64_t)"-[MIHelperServiceFrameworkClient removeWrappedAppWithBundleID:atURL:error:]");
  v8 = v7;
  if (a5 && v7) {
    *a5 = v7;
  }

  return 0;
}

- (id)installMacDeveloperAppAtURL:(id)a3 toURL:(id)a4 targetURLType:(unint64_t)a5 error:(id *)a6
{
  v8 = _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient installMacDeveloperAppAtURL:toURL:targetURLType:error:]", 274, (void *)*MEMORY[0x1E4F6F548], 4, 0, 0, @"%s is not available on this platform!", v6, (uint64_t)"-[MIHelperServiceFrameworkClient installMacDeveloperAppAtURL:toURL:targetURLType:error:]");
  v9 = v8;
  if (a6) {
    *a6 = v8;
  }

  return 0;
}

- (BOOL)removeDeveloperAppAtURL:(id)a3 error:(id *)a4
{
  uint64_t v6 = _CreateAndLogError((uint64_t)"-[MIHelperServiceFrameworkClient removeDeveloperAppAtURL:error:]", 298, (void *)*MEMORY[0x1E4F6F548], 4, 0, 0, @"%s is not available on this platform!", v4, (uint64_t)"-[MIHelperServiceFrameworkClient removeDeveloperAppAtURL:error:]");
  uint64_t v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return 0;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end