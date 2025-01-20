@interface ISSoftwareMap
+ (BOOL)currentMapIsValid;
+ (BOOL)haveApplicationsOfType:(id)a3;
+ (id)_newSoftwareUpdateDictionaryForApplication:(id)a3;
+ (id)applicationForBundleIdentifier:(id)a3;
+ (id)applicationForBundleIdentifier:(id)a3 applicationType:(id)a4;
+ (id)applicationForPluginBundleIdentifier:(id)a3;
+ (id)applicationForPluginBundleIdentifier:(id)a3 extensionType:(id)a4;
+ (id)containerPathForApp:(id)a3 homeDirectory:(id)a4 systemMetadataDirectory:(id)a5;
+ (id)copySoftwareUpdatesPropertyListWithApplications:(id)a3 updatesContext:(id)a4;
+ (id)currentMap;
+ (id)loadedMap;
+ (void)_startWatchingInstallationNotifications;
+ (void)enumerateApplicationsForProxies:(id)a3 usingBlock:(id)a4;
+ (void)enumerateApplicationsOfType:(unint64_t)a3 usingBlock:(id)a4;
+ (void)invalidateCurrentMap;
+ (void)removableSystemApplicationsWithCompletionBlock:(id)a3;
+ (void)setCurrentMap:(id)a3;
+ (void)startObservingNotifications;
- (ISSoftwareMap)init;
- (NSArray)applications;
- (id)applicationForBundleIdentifier:(id)a3;
- (id)applicationForItemIdentifier:(id)a3;
- (id)copySoftwareUpdatesPropertyList;
- (id)copySoftwareUpdatesPropertyListWithUpdatesContext:(id)a3;
- (void)_loadFromMobileInstallation;
- (void)dealloc;
@end

@implementation ISSoftwareMap

- (ISSoftwareMap)init
{
  __ISRecordSPIClassUsage(self);
  [(id)objc_opt_class() startObservingNotifications];
  v5.receiver = self;
  v5.super_class = (Class)ISSoftwareMap;
  v3 = [(ISSoftwareMap *)&v5 init];
  if (v3)
  {
    v3->_applications = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    [(ISSoftwareMap *)v3 _loadFromMobileInstallation];
  }
  return v3;
}

- (void)dealloc
{
  self->_applications = 0;
  v3.receiver = self;
  v3.super_class = (Class)ISSoftwareMap;
  [(ISSoftwareMap *)&v3 dealloc];
}

+ (BOOL)haveApplicationsOfType:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  if (SSIsDaemon())
  {
    if ([a3 isEqualToString:*MEMORY[0x263F01838]])
    {
      uint64_t v4 = 1;
    }
    else if ([a3 isEqualToString:*MEMORY[0x263F01818]])
    {
      uint64_t v4 = 2;
    }
    else
    {
      uint64_t v4 = 0;
    }
    v14 = (void *)[MEMORY[0x263F01880] defaultWorkspace];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __40__ISSoftwareMap_haveApplicationsOfType___block_invoke;
    v19[3] = &unk_2642614E8;
    v19[4] = &v20;
    [v14 enumerateApplicationsOfType:v4 block:v19];
  }
  else
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      objc_super v5 = (void *)[MEMORY[0x263F7B1F8] sharedStoreServicesConfig];
      if (!v5) {
        objc_super v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v6 = [v5 shouldLog];
      int v7 = [v5 shouldLogToDisk];
      v8 = [v5 OSLogObject];
      if (v7) {
        v6 |= 2u;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        int v9 = v6;
      }
      else {
        int v9 = v6 & 2;
      }
      if (v9)
      {
        int v24 = 136446210;
        v25 = "+[ISSoftwareMap haveApplicationsOfType:]";
        LODWORD(v17) = 12;
        uint64_t v10 = _os_log_send_and_compose_impl();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v24, v17);
          free(v11);
          SSFileLog();
        }
      }
    }
    v12 = (void *)SSXPCCreateMessageDictionary();
    SSXPCDictionarySetCFObject();
    v13 = dispatch_semaphore_create(0);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __40__ISSoftwareMap_haveApplicationsOfType___block_invoke_21;
    v18[3] = &unk_264261510;
    v18[4] = v13;
    v18[5] = &v20;
    __ISSoftwareMapXPC((uint64_t)v12, (uint64_t)v18);
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v13);
    xpc_release(v12);
  }
  char v15 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  return v15;
}

uint64_t __40__ISSoftwareMap_haveApplicationsOfType___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

intptr_t __40__ISSoftwareMap_haveApplicationsOfType___block_invoke_21(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x2166C7F80](a2) == MEMORY[0x263EF8708]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_BOOL(a2, "0");
  }
  uint64_t v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

+ (id)currentMap
{
  pthread_mutex_lock(&__CurrentMapLock);
  id v2 = (id)__CurrentMap;
  pthread_mutex_unlock(&__CurrentMapLock);
  return v2;
}

+ (BOOL)currentMapIsValid
{
  pthread_mutex_lock(&__CurrentMapLock);
  char v2 = __CurrentMapIsValid;
  pthread_mutex_unlock(&__CurrentMapLock);
  return v2;
}

+ (void)invalidateCurrentMap
{
  pthread_mutex_lock(&__CurrentMapLock);
  __CurrentMapIsValid = 0;
  pthread_mutex_unlock(&__CurrentMapLock);
  char v2 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v2 postNotificationName:@"ISSoftwareMapInvalidatedNotification" object:0];
}

+ (id)loadedMap
{
  pthread_mutex_lock(&__CurrentMapLock);
  char v2 = (ISSoftwareMap *)__CurrentMap;
  if (__CurrentMap) {
    BOOL v3 = __CurrentMapIsValid == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {

    char v2 = objc_alloc_init(ISSoftwareMap);
    __CurrentMap = (uint64_t)v2;
    __CurrentMapIsValid = 1;
  }
  uint64_t v4 = v2;
  pthread_mutex_unlock(&__CurrentMapLock);
  return v4;
}

+ (void)setCurrentMap:(id)a3
{
  pthread_mutex_lock(&__CurrentMapLock);
  if ((id)__CurrentMap != a3)
  {

    a3 = a3;
    __CurrentMap = (uint64_t)a3;
  }
  __CurrentMapIsValid = a3 != 0;

  pthread_mutex_unlock(&__CurrentMapLock);
}

+ (id)applicationForBundleIdentifier:(id)a3
{
  return (id)[a1 applicationForBundleIdentifier:a3 applicationType:*MEMORY[0x263F01848]];
}

+ (id)applicationForBundleIdentifier:(id)a3 applicationType:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x3052000000;
  uint64_t v26 = __Block_byref_object_copy__9;
  v27 = __Block_byref_object_dispose__9;
  uint64_t v28 = 0;
  [(id)objc_opt_class() startObservingNotifications];
  int v7 = (void *)[a1 currentMap];
  if (v7
    && [a1 currentMapIsValid]
    && [a4 isEqualToString:*MEMORY[0x263F01848]])
  {
    v8 = (ISSoftwareApplication *)(id)[v7 applicationForBundleIdentifier:a3];
LABEL_8:
    v24[5] = (uint64_t)v8;
    goto LABEL_22;
  }
  if (SSIsDaemon())
  {
    int v9 = (void *)[MEMORY[0x263F01868] applicationProxyForIdentifier:a3];
    if (objc_msgSend((id)objc_msgSend(v9, "bundleType"), "isEqualToString:", a4))
    {
      v8 = [[ISSoftwareApplication alloc] initWithLaunchServicesApplication:v9];
      goto LABEL_8;
    }
  }
  else
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      uint64_t v10 = (void *)[MEMORY[0x263F7B1F8] sharedStoreServicesConfig];
      if (!v10) {
        uint64_t v10 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v11 = [v10 shouldLog];
      int v12 = [v10 shouldLogToDisk];
      v13 = [v10 OSLogObject];
      if (v12) {
        v11 |= 2u;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        int v14 = v11;
      }
      else {
        int v14 = v11 & 2;
      }
      if (v14)
      {
        int v29 = 136446210;
        v30 = "+[ISSoftwareMap applicationForBundleIdentifier:applicationType:]";
        LODWORD(v21) = 12;
        uint64_t v15 = _os_log_send_and_compose_impl();
        if (v15)
        {
          v16 = (void *)v15;
          objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v29, v21);
          free(v16);
          SSFileLog();
        }
      }
    }
    uint64_t v17 = (void *)SSXPCCreateMessageDictionary();
    SSXPCDictionarySetCFObject();
    SSXPCDictionarySetCFObject();
    v18 = dispatch_semaphore_create(0);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __64__ISSoftwareMap_applicationForBundleIdentifier_applicationType___block_invoke;
    v22[3] = &unk_264261510;
    v22[4] = v18;
    v22[5] = &v23;
    __ISSoftwareMapXPC((uint64_t)v17, (uint64_t)v22);
    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v18);
    xpc_release(v17);
  }
LABEL_22:
  id v19 = (id)v24[5];
  _Block_object_dispose(&v23, 8);
  return v19;
}

intptr_t __64__ISSoftwareMap_applicationForBundleIdentifier_applicationType___block_invoke(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x2166C7F80](a2) == MEMORY[0x263EF8708]) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [[ISSoftwareApplication alloc] initWithXPCEncoding:xpc_dictionary_get_value(a2, "0")];
  }
  uint64_t v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

+ (id)applicationForPluginBundleIdentifier:(id)a3
{
  return (id)[a1 applicationForPluginBundleIdentifier:a3 extensionType:0];
}

+ (id)applicationForPluginBundleIdentifier:(id)a3 extensionType:(id)a4
{
  if (SSIsDaemon()
    && ((int v6 = (void *)[MEMORY[0x263F018C0] pluginKitProxyForIdentifier:a3], v7 = v6, !a4)
     || objc_msgSend((id)objc_msgSend(v6, "protocol"), "isEqualToString:", a4))
    && ([v7 containingBundle], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v8 = objc_msgSend((id)objc_msgSend(v7, "containingBundle"), "bundleType"),
        [v8 isEqualToString:*MEMORY[0x263F01848]]))
  {
    int v9 = -[ISSoftwareApplication initWithLaunchServicesApplication:]([ISSoftwareApplication alloc], "initWithLaunchServicesApplication:", [v7 containingBundle]);
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (id)applicationForBundleIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  applications = self->_applications;
  id result = (id)[(NSArray *)applications countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(applications);
        }
        int v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (objc_msgSend((id)objc_msgSend(v9, "bundleIdentifier"), "isEqualToString:", a3)) {
          return v9;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = (id)[(NSArray *)applications countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)applicationForItemIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  applications = self->_applications;
  id result = (id)[(NSArray *)applications countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(applications);
        }
        int v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (objc_msgSend((id)objc_msgSend(v9, "itemIdentifier"), "isEqual:", a3)) {
          return v9;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = (id)[(NSArray *)applications countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (NSArray)applications
{
  char v2 = self->_applications;

  return v2;
}

- (id)copySoftwareUpdatesPropertyList
{
  return [(ISSoftwareMap *)self copySoftwareUpdatesPropertyListWithUpdatesContext:0];
}

- (id)copySoftwareUpdatesPropertyListWithUpdatesContext:(id)a3
{
  objc_super v5 = objc_opt_class();
  applications = self->_applications;

  return (id)[v5 copySoftwareUpdatesPropertyListWithApplications:applications updatesContext:a3];
}

+ (id)containerPathForApp:(id)a3 homeDirectory:(id)a4 systemMetadataDirectory:(id)a5
{
  v8 = (void *)[a3 bundleContainerURL];
  if (v8 && (int v9 = v8, ![v8 isEqual:a4]))
  {
    return (id)[v9 path];
  }
  else
  {
    uint64_t v10 = [a3 bundleIdentifier];
    return (id)[a5 stringByAppendingPathComponent:v10];
  }
}

+ (id)copySoftwareUpdatesPropertyListWithApplications:(id)a3 updatesContext:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (![a3 count]) {
    return 0;
  }
  uint64_t v7 = (void *)[a3 mutableCopy];
  v8 = (void *)[a4 softwareTypes];
  int v9 = v8;
  if (v8)
  {
    char v10 = [v8 containsObject:*MEMORY[0x263F7BCB0]] ^ 1;
    int v11 = [v9 containsObject:*MEMORY[0x263F7BCB8]] ^ 1;
    if (v10)
    {
LABEL_8:
      uint64_t v13 = [v7 count];
      if (v13 - 1 >= 0)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *MEMORY[0x263F7B740];
        while (1)
        {
          v16 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", --v14), "softwareType");
          if (![v16 isEqualToString:v15]) {
            break;
          }
          if (v10) {
            goto LABEL_12;
          }
LABEL_13:
          if (v14 <= 0) {
            goto LABEL_20;
          }
        }
        if (v16)
        {
          if ([v9 containsObject:v16]) {
            goto LABEL_13;
          }
        }
        else if ((v11 & 1) == 0)
        {
          goto LABEL_13;
        }
LABEL_12:
        [v7 removeObjectAtIndex:v14];
        goto LABEL_13;
      }
      goto LABEL_20;
    }
  }
  else
  {
    char v10 = 0;
    int v11 = 0;
  }
  if (v11) {
    goto LABEL_8;
  }
LABEL_20:
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v18 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v7);
        }
        uint64_t v22 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (([v22 isPlaceholder] & 1) == 0)
        {
          uint64_t v23 = (void *)[a1 _newSoftwareUpdateDictionaryForApplication:v22];
          if ([v23 count]) {
            [v17 addObject:v23];
          }
        }
      }
      uint64_t v19 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v19);
  }
  if ([v17 count])
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v12 setObject:v17 forKey:@"local-software"];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (void)enumerateApplicationsForProxies:(id)a3 usingBlock:(id)a4
{
  v23[4] = *MEMORY[0x263EF8340];
  uint64_t v5 = CPSharedResourcesDirectory();
  if (v5)
  {
    uint64_t v6 = [NSURL fileURLWithPath:v5];
    v23[0] = v5;
    v23[1] = @"Library";
    v23[2] = @"com.apple.itunesstored";
    v23[3] = @"iTunesMetadata";
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
    uint64_t v5 = [NSString pathWithComponents:v7];
  }
  else
  {
    uint64_t v6 = 0;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16, a3);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obja);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = (void *)MEMORY[0x2166C7A20]();
        uint64_t v14 = -[ISSoftwareApplication initWithLaunchServicesApplication:containerPath:]([ISSoftwareApplication alloc], "initWithLaunchServicesApplication:containerPath:", v12, [a1 containerPathForApp:v12 homeDirectory:v6 systemMetadataDirectory:v5]);
        if ([(ISSoftwareApplication *)v14 bundleIdentifier]) {
          (*((void (**)(id, ISSoftwareApplication *))a4 + 2))(a4, v14);
        }
      }
      uint64_t v9 = [obja countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

+ (void)enumerateApplicationsOfType:(unint64_t)a3 usingBlock:(id)a4
{
  v12[4] = *MEMORY[0x263EF8340];
  uint64_t v7 = CPSharedResourcesDirectory();
  if (v7)
  {
    uint64_t v8 = [NSURL fileURLWithPath:v7];
    v12[0] = v7;
    v12[1] = @"Library";
    v12[2] = @"com.apple.itunesstored";
    v12[3] = @"iTunesMetadata";
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];
    uint64_t v7 = [NSString pathWithComponents:v9];
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v10 = (void *)[MEMORY[0x263F01880] defaultWorkspace];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__ISSoftwareMap_enumerateApplicationsOfType_usingBlock___block_invoke;
  v11[3] = &unk_264261538;
  v11[4] = a1;
  v11[5] = v8;
  v11[6] = v7;
  v11[7] = a4;
  [v10 enumerateApplicationsOfType:a3 block:v11];
}

void __56__ISSoftwareMap_enumerateApplicationsOfType_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (void *)MEMORY[0x2166C7A20]();
    uint64_t v5 = -[ISSoftwareApplication initWithLaunchServicesApplication:containerPath:]([ISSoftwareApplication alloc], "initWithLaunchServicesApplication:containerPath:", a2, [*(id *)(a1 + 32) containerPathForApp:a2 homeDirectory:*(void *)(a1 + 40) systemMetadataDirectory:*(void *)(a1 + 48)]);
    if ([(ISSoftwareApplication *)v5 bundleIdentifier]) {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

+ (void)removableSystemApplicationsWithCompletionBlock:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v5 = objc_alloc_init(RemovableSoftwareLookupTable);
  if (SSIsDaemon())
  {
    uint64_t v6 = (void *)[MEMORY[0x263F01880] defaultWorkspace];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __64__ISSoftwareMap_removableSystemApplicationsWithCompletionBlock___block_invoke;
    v7[3] = &unk_264261560;
    v7[4] = v5;
    v7[5] = v4;
    [v6 enumerateApplicationsOfType:1 block:v7];
  }

  if (a3) {
    (*((void (**)(id, id))a3 + 2))(a3, (id)[v4 copy]);
  }
}

void __64__ISSoftwareMap_removableSystemApplicationsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (void *)MEMORY[0x2166C7A20]();
    if (objc_msgSend((id)objc_msgSend(a2, "applicationType"), "isEqualToString:", @"System")
      && [a2 isDeletable])
    {
      uint64_t v5 = [[ISSoftwareApplication alloc] initWithLaunchServicesApplication:a2];
      if (![(ISSoftwareApplication *)v5 itemIdentifier])
      {
        uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "itemIdentifierForBundleIdentifer:", -[ISSoftwareApplication bundleIdentifier](v5, "bundleIdentifier"));
        if (v6) {
          [(ISSoftwareApplication *)v5 setItemIdentifier:v6];
        }
      }
      if ([(ISSoftwareApplication *)v5 bundleIdentifier]) {
        [*(id *)(a1 + 40) addObject:v5];
      }
    }
  }
}

+ (void)startObservingNotifications
{
}

+ (id)_newSoftwareUpdateDictionaryForApplication:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v5 = [a3 itemIdentifier];
  if (v5) {
    [v4 setObject:v5 forKey:@"adam-id"];
  }
  uint64_t v6 = [a3 versionIdentifier];
  if (v6) {
    [v4 setObject:v6 forKey:@"installed-version-identifier"];
  }
  return v4;
}

+ (void)_startWatchingInstallationNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)__SoftwareMappingChangedNotification, @"com.apple.itunesstored.invalidatedSoftwareMap", 0, CFNotificationSuspensionBehaviorCoalesce);
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterAddObserver(DistributedCenter, a1, (CFNotificationCallback)__SoftwareMappingChangedNotification, @"com.apple.LaunchServices.applicationRegistered", 0, CFNotificationSuspensionBehaviorCoalesce);

  CFNotificationCenterAddObserver(DistributedCenter, a1, (CFNotificationCallback)__SoftwareMappingChangedNotification, @"com.apple.LaunchServices.applicationUnregistered", 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)_loadFromMobileInstallation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (SSIsDaemon())
  {
    BOOL v3 = objc_alloc_init(RemovableSoftwareLookupTable);
    id v4 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v5 = objc_opt_class();
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __44__ISSoftwareMap__loadFromMobileInstallation__block_invoke;
    v18[3] = &unk_264261588;
    v18[4] = v4;
    [v5 enumerateApplicationsOfType:0 usingBlock:v18];
    uint64_t v6 = objc_opt_class();
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __44__ISSoftwareMap__loadFromMobileInstallation__block_invoke_2;
    v17[3] = &unk_2642615B0;
    v17[4] = v3;
    v17[5] = v4;
    [v6 enumerateApplicationsOfType:1 usingBlock:v17];

    self->_applications = v4;
  }
  else
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      uint64_t v7 = (void *)[MEMORY[0x263F7B1F8] sharedStoreServicesConfig];
      if (!v7) {
        uint64_t v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v8 = [v7 shouldLog];
      if ([v7 shouldLogToDisk]) {
        int v9 = v8 | 2;
      }
      else {
        int v9 = v8;
      }
      if (os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_FAULT)) {
        int v10 = v9;
      }
      else {
        int v10 = v9 & 2;
      }
      if (v10)
      {
        int v19 = 136446210;
        long long v20 = "-[ISSoftwareMap _loadFromMobileInstallation]";
        LODWORD(v15) = 12;
        uint64_t v11 = _os_log_send_and_compose_impl();
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v19, v15);
          free(v12);
          SSFileLog();
        }
      }
    }
    uint64_t v13 = (void *)SSXPCCreateMessageDictionary();
    uint64_t v14 = dispatch_semaphore_create(0);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __44__ISSoftwareMap__loadFromMobileInstallation__block_invoke_61;
    v16[3] = &unk_2642615D8;
    v16[4] = self;
    v16[5] = v14;
    __ISSoftwareMapXPC((uint64_t)v13, (uint64_t)v16);
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v14);
    xpc_release(v13);
  }
}

uint64_t __44__ISSoftwareMap__loadFromMobileInstallation__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __44__ISSoftwareMap__loadFromMobileInstallation__block_invoke_2(uint64_t a1, void *a2)
{
  if (![a2 itemIdentifier])
  {
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "itemIdentifierForBundleIdentifer:", objc_msgSend(a2, "bundleIdentifier"));
    if (v4) {
      [a2 setItemIdentifier:v4];
    }
  }
  char v5 = [a2 removableStatus];
  uint64_t result = [a2 itemIdentifier];
  if (result && (v5 & 4) == 0)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    return [v7 addObject:a2];
  }
  return result;
}

intptr_t __44__ISSoftwareMap__loadFromMobileInstallation__block_invoke_61(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x2166C7F80](a2) == MEMORY[0x263EF8708])
  {
    xpc_dictionary_get_value(a2, "0");
    objc_opt_class();
    *(void *)(*(void *)(a1 + 32) + 8) = SSXPCCreateNSArrayFromXPCEncodedArray();
  }
  uint64_t v4 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v4);
}

@end