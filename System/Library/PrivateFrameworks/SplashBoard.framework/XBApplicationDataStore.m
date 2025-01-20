@interface XBApplicationDataStore
+ (id)sharedInstance;
- (BOOL)_bundleIdentifierHasDeniedLaunchInterface:(id)a3;
- (XBApplicationDataStore)init;
- (id)_init;
- (id)_loadCompatibilityInfoForBundleIdentifier:(id)a3;
- (id)_storeForBundleIdentifier:(id)a3;
- (id)loadManifestDataForBundleIdentifier:(id)a3;
- (int64_t)_bundleIdentifierDeniedLaunchInterfaceCount:(id)a3;
- (void)_addBundleIdentifierToLaunchInterfaceDenyList:(id)a3;
- (void)_clearCompatibilityInfoForBundleIdentifier:(id)a3;
- (void)_persistCompatibilityInfo:(id)a3 forBundleIdentifier:(id)a4;
- (void)_removeBundleIdentifierFromLaunchInterfaceDenyList:(id)a3;
- (void)beginAccessBlockForBundleIdentifier:(id)a3;
- (void)clearManifestDataForBundleIdentifier:(id)a3;
- (void)endAccessBlockForBundleIdentifier:(id)a3;
- (void)persistManifestData:(id)a3 forBundleIdentifier:(id)a4;
- (void)synchronizeForBundleIdentifier:(id)a3 withCompletion:(id)a4;
@end

@implementation XBApplicationDataStore

- (void)endAccessBlockForBundleIdentifier:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__XBApplicationDataStore_endAccessBlockForBundleIdentifier___block_invoke;
  block[3] = &unk_2646A5C10;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_sync(queue, block);
}

- (void)beginAccessBlockForBundleIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__XBApplicationDataStore_beginAccessBlockForBundleIdentifier___block_invoke;
  v7[3] = &unk_2646A5BC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (id)_loadCompatibilityInfoForBundleIdentifier:(id)a3
{
  v3 = [(XBApplicationDataStore *)self _storeForBundleIdentifier:a3];
  id v4 = [v3 safeArchivedObjectForKey:XBApplicationLaunchCompatibilityInfoPersistenceKey ofType:objc_opt_class()];

  return v4;
}

- (id)_storeForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__XBApplicationDataStore__storeForBundleIdentifier___block_invoke;
  block[3] = &unk_2646A5BE8;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

void __60__XBApplicationDataStore_endAccessBlockForBundleIdentifier___block_invoke(void *a1)
{
  if (([*(id *)(a1[4] + 16) containsObject:a1[5]] & 1) == 0)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], "-[XBApplicationDataStore endAccessBlockForBundleIdentifier:]_block_invoke", a1[5], *(void *)(a1[4] + 16));
  }
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  if (([*(id *)(a1[4] + 16) containsObject:a1[5]] & 1) == 0)
  {
    if (![*(id *)(a1[4] + 16) count])
    {
      uint64_t v2 = a1[4];
      v3 = *(void **)(v2 + 16);
      *(void *)(v2 + 16) = 0;
    }
    id v4 = *(void **)(a1[4] + 24);
    if (v4)
    {
      [v4 removeObjectForKey:a1[5]];
      if (![*(id *)(a1[4] + 24) count])
      {
        uint64_t v5 = a1[4];
        id v6 = *(void **)(v5 + 24);
        *(void *)(v5 + 24) = 0;
      }
    }
  }
}

- (void)persistManifestData:(id)a3 forBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v11 = v7;
  if (v11 && (NSClassFromString(&cfstr_Nsdata.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDataClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[XBApplicationDataStore persistManifestData:forBundleIdentifier:](a2, (uint64_t)self, (uint64_t)v10);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v9 = [(XBApplicationDataStore *)self _storeForBundleIdentifier:v8];
    [v9 setObject:v11 forKey:@"XBApplicationSnapshotManifest"];
  }
}

uint64_t __62__XBApplicationDataStore_beginAccessBlockForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 addObject:v3];
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 16) = [objc_alloc(MEMORY[0x263F08760]) initWithObjects:a1 + 40 count:1];
    return MEMORY[0x270F9A758]();
  }
}

void __52__XBApplicationDataStore__storeForBundleIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = a1 + 5;
  uint64_t v3 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v3);
  }
  else
  {
    id v4 = [MEMORY[0x263F3F6B8] storeForApplication:*v2];
    id v10 = v4;
    if (v4)
    {
      id v5 = v4;
      if ([*(id *)(a1[4] + 16) containsObject:a1[5]])
      {
        id v6 = *(void **)(a1[4] + 24);
        if (v6)
        {
          [v6 setObject:v5 forKey:*v2];
        }
        else
        {
          uint64_t v7 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithObjects:&v10 forKeys:v2 count:1];
          uint64_t v8 = a1[4];
          id v9 = *(void **)(v8 + 24);
          *(void *)(v8 + 24) = v7;

          id v5 = v10;
        }
      }
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v5);
    }
  }
}

uint64_t __40__XBApplicationDataStore_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = [[XBApplicationDataStore alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (XBApplicationDataStore)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"XBApplicationDataStore.m" lineNumber:39 description:@"init is not allowed"];

  return (XBApplicationDataStore *)[(XBApplicationDataStore *)self _init];
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)XBApplicationDataStore;
  uint64_t v2 = [(XBApplicationDataStore *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.splashboard.application-data-store", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)_persistCompatibilityInfo:(id)a3 forBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v11 = v7;
  if (v11 && (NSClassFromString(&cfstr_Xbapplicationl_0.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:XBApplicationLaunchCompatibilityInfoClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[XBApplicationDataStore _persistCompatibilityInfo:forBundleIdentifier:](a2, (uint64_t)self, (uint64_t)v10);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v9 = [(XBApplicationDataStore *)self _storeForBundleIdentifier:v8];
    [v9 setArchivedObject:v11 forKey:XBApplicationLaunchCompatibilityInfoPersistenceKey];
  }
}

- (void)_clearCompatibilityInfoForBundleIdentifier:(id)a3
{
  id v3 = [(XBApplicationDataStore *)self _storeForBundleIdentifier:a3];
  [v3 removeObjectForKey:XBApplicationLaunchCompatibilityInfoPersistenceKey];
}

- (BOOL)_bundleIdentifierHasDeniedLaunchInterface:(id)a3
{
  id v3 = [(XBApplicationDataStore *)self _loadCompatibilityInfoForBundleIdentifier:a3];
  char v4 = [v3 hasKnownBadLaunchImage];

  return v4;
}

- (int64_t)_bundleIdentifierDeniedLaunchInterfaceCount:(id)a3
{
  id v3 = [(XBApplicationDataStore *)self _loadCompatibilityInfoForBundleIdentifier:a3];
  int64_t v4 = [v3 badLaunchImageCandidateCount];

  return v4;
}

- (void)_addBundleIdentifierToLaunchInterfaceDenyList:(id)a3
{
  id v4 = a3;
  id v5 = [(XBApplicationDataStore *)self _loadCompatibilityInfoForBundleIdentifier:v4];
  [v5 setHasKnownBadLaunchImage:1];
  [(XBApplicationDataStore *)self _persistCompatibilityInfo:v5 forBundleIdentifier:v4];
}

- (void)_removeBundleIdentifierFromLaunchInterfaceDenyList:(id)a3
{
  id v5 = a3;
  id v4 = -[XBApplicationDataStore _loadCompatibilityInfoForBundleIdentifier:](self, "_loadCompatibilityInfoForBundleIdentifier:");
  if ([v4 hasKnownBadLaunchImage])
  {
    [v4 setHasKnownBadLaunchImage:0];
    [v4 setBadLaunchImageCandidateCount:0];
    [(XBApplicationDataStore *)self _persistCompatibilityInfo:v4 forBundleIdentifier:v5];
  }
}

- (void)clearManifestDataForBundleIdentifier:(id)a3
{
  id v3 = [(XBApplicationDataStore *)self _storeForBundleIdentifier:a3];
  [v3 removeObjectForKey:@"XBApplicationSnapshotManifest"];
}

- (id)loadManifestDataForBundleIdentifier:(id)a3
{
  id v3 = [(XBApplicationDataStore *)self _storeForBundleIdentifier:a3];
  id v4 = [v3 safeObjectForKey:@"XBApplicationSnapshotManifest" ofType:objc_opt_class()];

  return v4;
}

- (void)synchronizeForBundleIdentifier:(id)a3 withCompletion:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStoresByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_cacheableBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_persistCompatibilityInfo:(uint64_t)a3 forBundleIdentifier:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"XBApplicationDataStore.m";
  __int16 v10 = 1024;
  int v11 = 54;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_2232AB000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)persistManifestData:(uint64_t)a3 forBundleIdentifier:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"XBApplicationDataStore.m";
  __int16 v10 = 1024;
  int v11 = 122;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_2232AB000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end