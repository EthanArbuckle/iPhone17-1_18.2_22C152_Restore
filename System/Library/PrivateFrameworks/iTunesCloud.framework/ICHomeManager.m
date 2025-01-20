@interface ICHomeManager
+ (ICHomeManager)sharedManager;
- (NSString)description;
- (NSString)homeOwnerAltDSID;
- (NSString)preferredMediaUserAltDSID;
- (id)_currentHomeOwnerAltDSID;
- (id)_currentPreferredMediaUserAltDSID;
- (id)_init;
- (void)_loadPropertiesFromCache;
- (void)_savePropertiesToCache;
- (void)_updateProperties;
- (void)accessory:(id)a3 didUpdateSettings:(id)a4;
- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)homeManagerDidRemoveCurrentAccessory:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
@end

@implementation ICHomeManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedProperties, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentAccessoryIdentifier, 0);

  objc_storeStrong((id *)&self->_homeManager, 0);
}

- (id)_currentHomeOwnerAltDSID
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(HMHomeManager *)self->_homeManager currentHome];
  v4 = [v3 owner];
  if (v4)
  {
    v5 = +[ICMonitoredAccountStore sharedAccountStore];
    id v12 = 0;
    v6 = [v5 primaryAppleAccountWithError:&v12];
    id v7 = v12;

    if (v7)
    {
      v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_msgSend(v7, "msv_description");
        *(_DWORD *)buf = 138543618;
        v14 = self;
        __int16 v15 = 2114;
        v16 = v9;
        _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find primary apple account error=%{public}@", buf, 0x16u);
      }
    }
    v10 = objc_msgSend(v6, "ic_altDSID");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_currentPreferredMediaUserAltDSID
{
  v2 = [(HMHomeManager *)self->_homeManager currentAccessory];
  v3 = [v2 preferredMediaUser];
  v4 = [v3 iCloudAltDSID];

  return v4;
}

- (void)_updateProperties
{
  id v4 = [(ICHomeManager *)self _currentPreferredMediaUserAltDSID];
  v3 = [(ICHomeManager *)self _currentHomeOwnerAltDSID];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_cachedProperties setObject:v4 forKeyedSubscript:@"preferredMediaUserAltDSID"];
  [(NSMutableDictionary *)self->_cachedProperties setObject:v3 forKeyedSubscript:@"homeOwnerAltDSID"];
  os_unfair_lock_unlock(&self->_lock);
  [(ICHomeManager *)self _savePropertiesToCache];
}

- (void)_savePropertiesToCache
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ICHomeManager__savePropertiesToCache__block_invoke;
  block[3] = &unk_1E5ACD750;
  block[4] = self;
  dispatch_async(queue, block);
}

void __39__ICHomeManager__savePropertiesToCache__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 28));
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 28));
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v4;
    __int16 v8 = 2114;
    v9 = v2;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Caching updated properties %{public}@", (uint8_t *)&v6, 0x16u);
  }

  v5 = +[ICDefaults standardDefaults];
  [v5 setCachedHomeProperties:v2];
}

- (void)_loadPropertiesFromCache
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = +[ICDefaults standardDefaults];
  uint64_t v4 = [v3 cachedHomeProperties];
  v5 = (NSMutableDictionary *)[v4 mutableCopy];
  cachedProperties = self->_cachedProperties;
  self->_cachedProperties = v5;

  if (!self->_cachedProperties)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v8 = self->_cachedProperties;
    self->_cachedProperties = v7;
  }
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = self->_cachedProperties;
    int v11 = 138543618;
    id v12 = self;
    __int16 v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ loaded cached properties %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

- (void)accessory:(id)a3 didUpdateSettings:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = self;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ current accessory updated settings - updating properties", (uint8_t *)&v6, 0xCu);
  }

  [(ICHomeManager *)self _updateProperties];
}

- (void)homeManagerDidRemoveCurrentAccessory:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = self;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ current accessory removed - updating properties", (uint8_t *)&v6, 0xCu);
  }

  currentAccessoryIdentifier = self->_currentAccessoryIdentifier;
  self->_currentAccessoryIdentifier = 0;

  [(ICHomeManager *)self _updateProperties];
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v8 = (void (*)(unint64_t))getHMHomeManagerStatusToStringSymbolLoc_ptr;
    v24 = getHMHomeManagerStatusToStringSymbolLoc_ptr;
    if (!getHMHomeManagerStatusToStringSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getHMHomeManagerStatusToStringSymbolLoc_block_invoke;
      v26 = &unk_1E5ACD4F0;
      v27 = &v21;
      v9 = HomeKitLibrary();
      uint64_t v10 = dlsym(v9, "HMHomeManagerStatusToString");
      *(void *)(v27[1] + 24) = v10;
      getHMHomeManagerStatusToStringSymbolLoc_ptr = *(_UNKNOWN **)(v27[1] + 24);
      uint64_t v8 = (void (*)(unint64_t))v22[3];
    }
    _Block_object_dispose(&v21, 8);
    if (!v8)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = [NSString stringWithUTF8String:"NSString *soft_HMHomeManagerStatusToString(HMHomeManagerStatus)"];
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"ICHomeManager.m", 24, @"%s", dlerror());

      __break(1u);
    }
    int v11 = v8(a4);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ received updated status: %{public}@", buf, 0x16u);
  }
  id v12 = [(HMHomeManager *)self->_homeManager currentAccessory];
  __int16 v13 = [v12 uniqueIdentifier];
  v14 = self->_currentAccessoryIdentifier;
  if (v13 == v14)
  {
  }
  else
  {
    uint64_t v15 = v14;
    char v16 = [(NSUUID *)v13 isEqual:v14];

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = [v12 uniqueIdentifier];
      currentAccessoryIdentifier = self->_currentAccessoryIdentifier;
      self->_currentAccessoryIdentifier = v17;

      [v12 setDelegate:self];
    }
  }
  [(ICHomeManager *)self _updateProperties];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    __int16 v13 = self;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ updated homes - setting as ready", (uint8_t *)&v12, 0xCu);
  }

  self->_homeManagerIsReady = 1;
  v5 = [(HMHomeManager *)self->_homeManager currentAccessory];
  id v6 = [v5 uniqueIdentifier];
  uint64_t v7 = self->_currentAccessoryIdentifier;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    char v9 = [(NSUUID *)v6 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [v5 uniqueIdentifier];
      currentAccessoryIdentifier = self->_currentAccessoryIdentifier;
      self->_currentAccessoryIdentifier = v10;

      [v5 setDelegate:self];
    }
  }
  [(ICHomeManager *)self _updateProperties];
}

- (NSString)homeOwnerAltDSID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSMutableDictionary *)self->_cachedProperties objectForKeyedSubscript:@"homeOwnerAltDSID"];
  os_unfair_lock_unlock(p_lock);
  id v5 = v4;
  id v6 = v5;
  if (self->_homeManagerIsReady)
  {
    uint64_t v7 = [(ICHomeManager *)self _currentHomeOwnerAltDSID];

    id v8 = v7;
    if (v8 == v5)
    {

      id v6 = v5;
    }
    else
    {
      id v6 = v8;
      char v9 = [v8 isEqual:v5];

      if ((v9 & 1) == 0)
      {
        os_unfair_lock_lock(p_lock);
        [(NSMutableDictionary *)self->_cachedProperties setObject:v6 forKeyedSubscript:@"homeOwnerAltDSID"];
        os_unfair_lock_unlock(p_lock);
        [(ICHomeManager *)self _savePropertiesToCache];
      }
    }
  }

  return (NSString *)v6;
}

- (NSString)preferredMediaUserAltDSID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSMutableDictionary *)self->_cachedProperties objectForKeyedSubscript:@"preferredMediaUserAltDSID"];
  os_unfair_lock_unlock(p_lock);
  id v5 = v4;
  id v6 = v5;
  if (self->_homeManagerIsReady)
  {
    uint64_t v7 = [(ICHomeManager *)self _currentPreferredMediaUserAltDSID];

    id v8 = v7;
    if (v8 == v5)
    {

      id v6 = v5;
    }
    else
    {
      id v6 = v8;
      char v9 = [v8 isEqual:v5];

      if ((v9 & 1) == 0)
      {
        os_unfair_lock_lock(p_lock);
        [(NSMutableDictionary *)self->_cachedProperties setObject:v6 forKeyedSubscript:@"preferredMediaUserAltDSID"];
        os_unfair_lock_unlock(p_lock);
        [(ICHomeManager *)self _savePropertiesToCache];
      }
    }
  }

  return (NSString *)v6;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p: [%@]>", objc_opt_class(), self, self->_homeManager];
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)ICHomeManager;
  v2 = [(ICHomeManager *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.iTunesCloud.ICHomeManager.serialQueue", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    [(ICHomeManager *)v3 _loadPropertiesFromCache];
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2050000000;
    id v6 = (void *)getHMHomeManagerClass_softClass;
    uint64_t v16 = getHMHomeManagerClass_softClass;
    if (!getHMHomeManagerClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getHMHomeManagerClass_block_invoke;
      v12[3] = &unk_1E5ACD4F0;
      v12[4] = &v13;
      __getHMHomeManagerClass_block_invoke((uint64_t)v12);
      id v6 = (void *)v14[3];
    }
    uint64_t v7 = v6;
    _Block_object_dispose(&v13, 8);
    uint64_t v8 = [[v7 alloc] initWithOptions:24];
    homeManager = v3->_homeManager;
    v3->_homeManager = (HMHomeManager *)v8;

    [(HMHomeManager *)v3->_homeManager setDelegate:v3];
  }
  return v3;
}

+ (ICHomeManager)sharedManager
{
  if (sharedManager_sOnceToken_2831 != -1) {
    dispatch_once(&sharedManager_sOnceToken_2831, &__block_literal_global_2832);
  }
  v2 = (void *)sharedManager_sSharedManager_2833;

  return (ICHomeManager *)v2;
}

uint64_t __30__ICHomeManager_sharedManager__block_invoke()
{
  id v0 = [[ICHomeManager alloc] _init];
  uint64_t v1 = sharedManager_sSharedManager_2833;
  sharedManager_sSharedManager_2833 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end