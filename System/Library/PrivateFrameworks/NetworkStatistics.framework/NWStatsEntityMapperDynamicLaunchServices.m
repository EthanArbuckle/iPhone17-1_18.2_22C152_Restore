@interface NWStatsEntityMapperDynamicLaunchServices
- (NWStatsEntityMapperDynamicLaunchServices)init;
- (id)_attemptConvertingPluginNameToContainingAppName:(id)a3;
- (id)_identifierForUUID:(id)a3 fromSet:(id)a4;
- (id)extensionNameForUUID:(id)a3;
- (id)handleNewUUID:(id)a3;
- (id)identifierForUUID:(id)a3 derivation:(int *)a4;
- (id)stateDictionary;
- (void)dealloc;
@end

@implementation NWStatsEntityMapperDynamicLaunchServices

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id v6 = a3;
  v7 = v6;
  if (!v6
    || ([v6 UUIDString],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 length],
        v8,
        !v9))
  {
    int v14 = 0;
    v13 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v10 = (void *)MEMORY[0x21D4A8280]();
  v11 = self->_entityMap;
  objc_sync_enter(v11);
  id v12 = [(NWStatsEntityMapCache *)self->_entityMap entryForUUID:v7];
  if (!v12)
  {
    id v12 = [(NWStatsEntityMapperDynamicLaunchServices *)self handleNewUUID:v7];
    if (!v12) {
      goto LABEL_14;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [NSString stringWithString:v12];
    int v14 = 1;
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v12;
    v16 = NSString;
    v17 = [v12 objectAtIndexedSubscript:0];
    v13 = [v16 stringWithString:v17];

    int v14 = 2;
  }
  else
  {
LABEL_14:
    int v14 = 0;
    v13 = 0;
  }
LABEL_15:

  objc_sync_exit(v11);
  if (a4) {
LABEL_8:
  }
    *a4 = v14;
LABEL_9:

  return v13;
}

- (NWStatsEntityMapperDynamicLaunchServices)init
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)NWStatsEntityMapperDynamicLaunchServices;
  v2 = [(NWStatsEntityMapperDynamicLaunchServices *)&v13 init];
  if (v2)
  {
    v3 = objc_alloc_init(NWStatsEntityMapCache);
    entityMap = v2->_entityMap;
    v2->_entityMap = v3;

    v5 = dlopen((const char *)gCoreServicesFrameworkPath, 4);
    v2->_coreServicesDylibHandle = v5;
    if (!v5
      || (v2->_LSPlugInKitProxyClass Class = objc_getClass("LSPlugInKitProxy"),
          v2->_LSApplicationProxyClass Class = objc_getClass("LSApplicationProxy"),
          Class Class = objc_getClass("LSApplicationWorkspace"),
          v2->_LSApplicationWorkspaceClass Class = Class,
          !v2->_coreServicesDylibHandle)
      || !v2->_LSPlugInKitProxyClass
      || !v2->_LSApplicationProxyClass
      || !Class)
    {
      v7 = NStatGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        coreServicesDylibHandle = v2->_coreServicesDylibHandle;
        LSPlugInKitProxyClass Class = v2->_LSPlugInKitProxyClass;
        LSApplicationProxyClass Class = v2->_LSApplicationProxyClass;
        LSApplicationWorkspaceClass Class = v2->_LSApplicationWorkspaceClass;
        *(_DWORD *)buf = 134218752;
        v15 = coreServicesDylibHandle;
        __int16 v16 = 2048;
        Class v17 = LSPlugInKitProxyClass;
        __int16 v18 = 2048;
        Class v19 = LSApplicationProxyClass;
        __int16 v20 = 2048;
        Class v21 = LSApplicationWorkspaceClass;
        _os_log_impl(&dword_21C4BC000, v7, OS_LOG_TYPE_FAULT, "LS Mapping dylib failure handle %p plugin proxy class %p app proxy class %p app workspace class %p", buf, 0x2Au);
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  coreServicesDylibHandle = self->_coreServicesDylibHandle;
  if (coreServicesDylibHandle) {
    dlclose(coreServicesDylibHandle);
  }
  v4.receiver = self;
  v4.super_class = (Class)NWStatsEntityMapperDynamicLaunchServices;
  [(NWStatsEntityMapperDynamicLaunchServices *)&v4 dealloc];
}

- (id)_attemptConvertingPluginNameToContainingAppName:(id)a3
{
  v3 = [(objc_class *)self->_LSPlugInKitProxyClass pluginKitProxyForIdentifier:a3];
  objc_super v4 = v3;
  if (v3)
  {
    v5 = [v3 containingBundle];
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v6 = [v5 applicationIdentifier];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_identifierForUUID:(id)a3 fromSet:(id)a4
{
  v12[2] = *MEMORY[0x263EF8340];
  v5 = objc_msgSend(a4, "allObjects", a3);
  id v6 = [v5 objectAtIndex:0];

  uint64_t v7 = [(NWStatsEntityMapperDynamicLaunchServices *)self _attemptConvertingPluginNameToContainingAppName:v6];
  v8 = (void *)v7;
  if (v7)
  {
    v12[0] = v7;
    v12[1] = v6;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  }
  else
  {
    id v9 = v6;
  }
  v10 = v9;

  return v10;
}

- (id)handleNewUUID:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x21D4A8280]();
  id v6 = [(objc_class *)self->_LSApplicationWorkspaceClass defaultWorkspace];
  uint64_t v7 = [MEMORY[0x263EFFA08] setWithObject:v4];
  id v15 = 0;
  v8 = [v6 bundleIdentifiersForMachOUUIDs:v7 error:&v15];
  id v9 = v15;

  if (v9 || ![v8 count]) {
    goto LABEL_2;
  }
  objc_super v13 = [v8 objectForKeyedSubscript:v4];
  if (![v13 count])
  {

    goto LABEL_2;
  }
  int v14 = [(NWStatsEntityMapperDynamicLaunchServices *)self _identifierForUUID:v4 fromSet:v13];

  if (!v14)
  {
LABEL_2:
    id v10 = [MEMORY[0x263EFF9D0] null];
    v11 = 0;
    goto LABEL_3;
  }
  id v10 = v14;
  v11 = v10;
LABEL_3:
  [(NWStatsEntityMapCache *)self->_entityMap setEntry:v10 forUUID:v4];

  return v10;
}

- (id)extensionNameForUUID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && ([v4 UUIDString],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 length],
        v6,
        v7))
  {
    v8 = (void *)MEMORY[0x21D4A8280]();
    id v9 = self->_entityMap;
    objc_sync_enter(v9);
    id v10 = [(NWStatsEntityMapCache *)self->_entityMap entryForUUID:v5];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v11 = v10;
      id v12 = NSString;
      objc_super v13 = [v11 objectAtIndexedSubscript:1];
      int v14 = [v12 stringWithString:v13];
    }
    else
    {
      int v14 = 0;
    }

    objc_sync_exit(v9);
  }
  else
  {
    int v14 = 0;
  }

  return v14;
}

- (id)stateDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = self->_entityMap;
  objc_sync_enter(v4);
  v5 = [(NWStatsEntityMapCache *)self->_entityMap stateDictionary];
  [v3 setObject:v5 forKeyedSubscript:@"EntityMapper"];

  objc_sync_exit(v4);
  return v3;
}

- (void).cxx_destruct
{
}

@end