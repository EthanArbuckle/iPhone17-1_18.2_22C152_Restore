@interface STStorageDataInterface
+ (id)storageInfoDict_Remote;
- (STStorageAppsMonitor)appsMonitor;
- (STStorageDataInterface)init;
- (id)appSizesDict;
- (id)apps;
- (id)appsOrderedByName;
- (id)appsOrderedBySize;
- (id)categorySizesDict;
- (id)storageInfoDict;
- (void)setAppsMonitor:(id)a3;
@end

@implementation STStorageDataInterface

- (STStorageDataInterface)init
{
  v6.receiver = self;
  v6.super_class = (Class)STStorageDataInterface;
  v2 = [(STStorageDataInterface *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[STStorageAppsMonitor sharedMonitor];
    appsMonitor = v2->_appsMonitor;
    v2->_appsMonitor = (STStorageAppsMonitor *)v3;

    [(STStorageAppsMonitor *)v2->_appsMonitor sync];
  }
  return v2;
}

- (id)apps
{
  return [(STStorageAppsMonitor *)self->_appsMonitor filteredApps:0 sortedUsingBlock:&__block_literal_global_9];
}

uint64_t __30__STStorageDataInterface_apps__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  objc_super v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (id)appsOrderedBySize
{
  return [(STStorageAppsMonitor *)self->_appsMonitor filteredApps:0 sortedUsingBlock:&__block_literal_global_2];
}

uint64_t __43__STStorageDataInterface_appsOrderedBySize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_super v6 = [v4 appSize];
  uint64_t v7 = [v6 userTotal];
  v8 = [v5 appSize];
  uint64_t v9 = [v8 userTotal];

  if (v7 <= v9)
  {
    v11 = [v5 appSize];
    uint64_t v12 = [v11 userTotal];
    v13 = [v4 appSize];
    uint64_t v14 = [v13 userTotal];

    if (v12 <= v14)
    {
      v15 = [v4 name];
      v16 = [v5 name];
      uint64_t v10 = [v15 localizedCaseInsensitiveCompare:v16];
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

- (id)appsOrderedByName
{
  return [(STStorageAppsMonitor *)self->_appsMonitor filteredApps:0 sortedUsingBlock:&__block_literal_global_4_0];
}

uint64_t __43__STStorageDataInterface_appsOrderedByName__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  objc_super v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (id)storageInfoDict
{
  return [(STStorageAppsMonitor *)self->_appsMonitor storageInfoDict];
}

+ (id)storageInfoDict_Remote
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  v2 = STStorageLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218150000, v2, OS_LOG_TYPE_INFO, "Connecting to StorageDataService", buf, 2u);
  }

  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.storagedatad" options:0];
  id v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C932AC0];
  [v3 setRemoteObjectInterface:v4];

  [v3 resume];
  id v5 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_12];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__STStorageDataInterface_storageInfoDict_Remote__block_invoke_13;
  v8[3] = &unk_264305648;
  v8[4] = &v10;
  [v5 storageInfoDict:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __48__STStorageDataInterface_storageInfoDict_Remote__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = STStorageLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __65__STMTelemetryController_retrieveTelemetryWithCompletionHandler___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __48__STStorageDataInterface_storageInfoDict_Remote__block_invoke_13(uint64_t a1, void *a2)
{
}

- (id)appSizesDict
{
  return [(STStorageAppsMonitor *)self->_appsMonitor appSizesDict];
}

- (id)categorySizesDict
{
  return [(STStorageAppsMonitor *)self->_appsMonitor categorySizesDict];
}

- (STStorageAppsMonitor)appsMonitor
{
  return (STStorageAppsMonitor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAppsMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end