@interface PRSWallpaperPublisher
- (PRSWallpaperPublisher)init;
- (PRSWallpaperPublisherDelegate)delegate;
- (id)_lock_buildActivePosterObserverUpdatesForClient:(id)a3 updatedRoles:(id)a4;
- (id)_lock_buildPosterCollectionUpdatesForClient:(id)a3 role:(id)a4 updatedPosterCollection:(id)a5;
- (id)_lock_descriptionIfInvalidPaths:(const void *)a3;
- (void)_initializeClient:(id)a3;
- (void)_initializeClient:(id)a3 withKnownIdentities:(id)a4 knownRoles:(id)a5 knownCollection:(id)a6;
- (void)_lock_activateClientsIfNeeded;
- (void)_lock_issuePosterCollectionUpdate:(id)a3;
- (void)_lock_issueUpdateForRoles:(id)a3;
- (void)_lock_noteChanged:(unint64_t)a3;
- (void)_lock_noteSnapshotUpdateForPath:(id)a3 snapshotType:(id)a4;
- (void)_lock_sendStateToClient:(id)a3;
- (void)initializePosterCollectionForRoles:(id)a3;
- (void)initializeRoles:(id)a3;
- (void)initializeWithPaths:(const void *)a3 recentlyChanged:(unint64_t)a4;
- (void)issuePosterCollectionUpdate:(id)a3;
- (void)issueUpdateForRoles:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)noteSnapshotUpdateForPath:(id)a3 snapshotType:(id)a4;
- (void)setDelegate:(id)a3;
- (void)updatePaths:(const void *)a3;
@end

@implementation PRSWallpaperPublisher

- (PRSWallpaperPublisher)init
{
  v18.receiver = self;
  v18.super_class = (Class)PRSWallpaperPublisher;
  v2 = [(PRSWallpaperPublisher *)&v18 init];
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E4F50BC8];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __29__PRSWallpaperPublisher_init__block_invoke;
    v16[3] = &unk_1E5D00A68;
    v5 = v2;
    v17 = v5;
    uint64_t v6 = [v4 listenerWithConfigurator:v16];
    listener = v5->_listener;
    v5->_listener = (BSServiceConnectionListener *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    lock_clients = v5->_lock_clients;
    v5->_lock_clients = (NSMutableSet *)v8;

    memset_pattern16(v5->_lock_changeVersionTimestamps, &unk_1A78F4230, 0x20uLL);
    int64x2_t v10 = vdupq_n_s64(1uLL);
    *(int64x2_t *)v5->_lock_changeVersions = v10;
    *(int64x2_t *)&v5->_lock_changeVersions[2] = v10;
    uint64_t v11 = objc_opt_new();
    lock_roleToPath = v5->_lock_roleToPath;
    v5->_lock_roleToPath = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    lock_roleToPosterCollections = v5->_lock_roleToPosterCollections;
    v5->_lock_roleToPosterCollections = (NSMutableDictionary *)v13;

    [(BSServiceConnectionListener *)v5->_listener activate];
  }
  return v3;
}

void __29__PRSWallpaperPublisher_init__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setDomain:@"com.apple.posterboardservices"];
  v3 = PRSWallpaperObserverInterface();
  v4 = [v3 identifier];
  [v5 setService:v4];

  [v5 setDelegate:*(void *)(a1 + 32)];
}

- (PRSWallpaperPublisherDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_delegate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDelegate:(id)a3
{
  v4 = (PRSWallpaperPublisherDelegate *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_delegate = self->_lock_delegate;
  self->_lock_delegate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)_lock_descriptionIfInvalidPaths:(const void *)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  unint64_t v6 = 0;
  BOOL v7 = 0;
  do
  {
    uint64_t v8 = (void *)a3[v6];
    if (!v8) {
      break;
    }
    v9 = [v8 identity];
    int64x2_t v10 = [v9 posterUUID];

    uint64_t v11 = [v5 objectForKey:v10];
    v12 = v11;
    uint64_t v13 = a3[v6];
    if (v11)
    {
      if (v11 != v13)
      {

        break;
      }
    }
    else
    {
      [v5 setObject:v13 forKey:v10];
    }

    BOOL v7 = v6++ > 2;
  }
  while (v6 != 4);
  uint64_t v14 = 0;
  lock_paths = self->_lock_paths;
  do
  {
    v16 = lock_paths[v14];
    if (v16)
    {
      v17 = [(PFServerPosterPath *)v16 identity];
      objc_super v18 = [v17 posterUUID];

      v19 = [v5 objectForKey:v18];
      v20 = v19;
      if (v19)
      {
        if (v19 != lock_paths[v14])
        {
          v21 = [(PFServerPosterPath *)v19 identity];
          [(PFServerPosterPath *)lock_paths[v14] identity];
          v23 = v22 = v5;
          int v24 = [v21 isNewerVersionOfIdentity:v23];

          id v5 = v22;
          if (!v24)
          {

            goto LABEL_18;
          }
        }
      }
    }
    ++v14;
  }
  while (v14 != 4);
  if (v7)
  {
    v25 = 0;
    goto LABEL_29;
  }
LABEL_18:
  v43 = v5;
  v25 = [MEMORY[0x1E4F28E78] stringWithString:@"received invalid paths: {"];
  for (uint64_t i = 0; i != 4; ++i)
  {
    v27 = a3[i];
    uint64_t v28 = PRSWallpaperObserverLocationsFromIndex(i);
    v29 = PRSWallpaperObserverLocationsDescription(v28);
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    if (v27) {
      v31 = {;
    }
      v32 = (void *)a3[i];
      v33 = [v32 identity];
      [v25 appendFormat:@"\n %i-%@: <%@:%p %@>", i, v29, v31, v32, v33];
    }
    else {
      v31 = {;
    }
      [v25 appendFormat:@"\n %i-%@: <%@:nil ->", i, v29, v31];
    }
  }
  [v25 appendString:@"\n}\ncompared to previous: {"];
  for (uint64_t j = 0; j != 4; ++j)
  {
    v35 = lock_paths[j];
    uint64_t v36 = PRSWallpaperObserverLocationsFromIndex(j);
    v37 = PRSWallpaperObserverLocationsDescription(v36);
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    if (v35) {
      v39 = {;
    }
      v40 = lock_paths[j];
      v41 = [(PFServerPosterPath *)v40 identity];
      [v25 appendFormat:@"\n %i-%@: <%@:%p %@>", j, v37, v39, v40, v41];
    }
    else {
      v39 = {;
    }
      [v25 appendFormat:@"\n %i-%@: <%@:nil ->", j, v37, v39];
    }
  }
  [v25 appendString:@"\n}"];
  id v5 = v43;
LABEL_29:

  return v25;
}

- (void)initializeWithPaths:(const void *)a3 recentlyChanged:(unint64_t)a4
{
  if (!a3)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", a4, @"paths"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperPublisher initializeWithPaths:recentlyChanged:]();
    }
LABEL_13:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78CB2ECLL);
  }
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = [(PRSWallpaperPublisher *)self _lock_descriptionIfInvalidPaths:a3];
  if (v7)
  {
    uint64_t v10 = v7;
    os_unfair_lock_unlock(&self->_lock);
    v9 = [NSString stringWithFormat:@"%@", v10];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperPublisher initializeWithPaths:recentlyChanged:]();
    }
    goto LABEL_13;
  }
  [(PRSWallpaperPublisher *)self _lock_activateClientsIfNeeded];
  for (uint64_t i = 0; i != 4; ++i)
    objc_storeStrong((id *)&self->_lock_paths[i], (id)a3[i]);
  [(PRSWallpaperPublisher *)self _lock_noteChanged:a4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)initializeRoles:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    os_unfair_lock_lock(&self->_lock);
    [(PRSWallpaperPublisher *)self _lock_activateClientsIfNeeded];
    [(NSMutableDictionary *)self->_lock_roleToPath removeAllObjects];
    [(PRSWallpaperPublisher *)self _lock_issueUpdateForRoles:v6];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roles"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperPublisher initializeRoles:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)updatePaths:(const void *)a3
{
  if (!a3)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"paths"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperPublisher updatePaths:]();
    }
LABEL_21:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78CB574);
  }
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [(PRSWallpaperPublisher *)self _lock_descriptionIfInvalidPaths:a3];
  if (v5)
  {
    uint64_t v10 = v5;
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v11 = [NSString stringWithFormat:@"%@", v10];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperPublisher updatePaths:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78CB5DCLL);
  }
  if (!self->_lock_activated)
  {
    os_unfair_lock_unlock(&self->_lock);
    v12 = NSString;
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    v9 = [v12 stringWithFormat:@"<%@:%p> received multi-update before activation", v14, self];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperPublisher updatePaths:]();
    }
    goto LABEL_21;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  lock_paths = self->_lock_paths;
  do
  {
    if (*lock_paths != a3[v6])
    {
      v7 |= PRSWallpaperObserverLocationsFromIndex(v6);
      objc_storeStrong((id *)lock_paths, (id)a3[v6]);
    }
    ++v6;
    ++lock_paths;
  }
  while (v6 != 4);
  if (v7) {
    [(PRSWallpaperPublisher *)self _lock_noteChanged:v7];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)issueUpdateForRoles:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(PRSWallpaperPublisher *)self _lock_activateClientsIfNeeded];
  [(PRSWallpaperPublisher *)self _lock_issueUpdateForRoles:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)noteSnapshotUpdateForPath:(id)a3 snapshotType:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    os_unfair_lock_lock(&self->_lock);
    [(PRSWallpaperPublisher *)self _lock_activateClientsIfNeeded];
    [(PRSWallpaperPublisher *)self _lock_noteSnapshotUpdateForPath:v8 snapshotType:v6];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"snapshotUpdatedForPath"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperPublisher noteSnapshotUpdateForPath:snapshotType:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)initializePosterCollectionForRoles:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    os_unfair_lock_lock(&self->_lock);
    [(PRSWallpaperPublisher *)self _lock_activateClientsIfNeeded];
    [(NSMutableDictionary *)self->_lock_roleToPosterCollections removeAllObjects];
    [(PRSWallpaperPublisher *)self _lock_issuePosterCollectionUpdate:v6];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"posterCollectionToRole"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperPublisher initializePosterCollectionForRoles:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)issuePosterCollectionUpdate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(PRSWallpaperPublisher *)self _lock_activateClientsIfNeeded];
  [(PRSWallpaperPublisher *)self _lock_issuePosterCollectionUpdate:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v8 = a4;
  id v9 = a5;
  v40 = [v8 remoteProcess];
  if ([v40 hasEntitlement:@"com.apple.posterboardservices.data-store.accessSwitcherConfiguration"])
  {
    objc_initWeak(&location, self);
    uint64_t v10 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v10);
    uint64_t v11 = objc_opt_new();
    objc_storeWeak((id *)(v11 + 8), self);
    objc_storeStrong((id *)(v11 + 16), a4);
    *(unsigned char *)(v11 + 113) = [v9 decodeBoolForKey:@"needsSandboxExtensions"];
    *(void *)(v11 + 104) = [v9 decodeUInt64ForKey:@"observedLocations"] & 0xF;
    *(unsigned char *)(v11 + 114) = [v9 decodeBoolForKey:@"snapshotObservation"];
    *(unsigned char *)(v11 + 115) = *(void *)(v11 + 104) != 0;
    int v12 = [v9 decodeBoolForKey:@"collectionObserving"];
    *(unsigned char *)(v11 + 153) = v12;
    if (v12)
    {
      *(unsigned char *)(v11 + 152) = [v9 decodeBoolForKey:@"collectionObservingNeedsSandboxExtensions"];
      uint64_t v13 = self;
      uint64_t v14 = [v9 decodeObjectOfClass:v13 forKey:@"collectionObservingRole"];
      v15 = *(void **)(v11 + 144);
      *(void *)(v11 + 144) = v14;
    }
    int v16 = [v9 decodeBoolForKey:@"roleObservation"];
    *(unsigned char *)(v11 + 129) = v16;
    if (v16)
    {
      *(unsigned char *)(v11 + 128) = [v9 decodeBoolForKey:@"observedRolesNeedSandboxExtensions"];
      v17 = self;
      objc_super v18 = self;
      uint64_t v19 = [v9 decodeCollectionOfClass:v17 containingClass:v18 forKey:@"observedRoles"];
      v20 = *(void **)(v11 + 120);
      *(void *)(v11 + 120) = v19;
    }
    v21 = [v9 decodeStringForKey:@"explanation"];
    v22 = __clientDescription(v40, v21, v8, *(void *)(v11 + 104));
    v23 = *(void **)(v11 + 32);
    *(void *)(v11 + 32) = v22;

    id v24 = v22;
    if (*(unsigned char *)(v11 + 115) || *(unsigned char *)(v11 + 114) || *(unsigned char *)(v11 + 129) || *(unsigned char *)(v11 + 153))
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __67__PRSWallpaperPublisher_listener_didReceiveConnection_withContext___block_invoke;
      v41[3] = &unk_1E5D00E30;
      v25 = (id)v11;
      id v42 = v25;
      objc_copyWeak(&v46, &location);
      id v26 = v38;
      id v43 = v26;
      v44 = self;
      id v27 = v24;
      id v28 = v24;
      id v45 = v28;
      [v8 configureConnection:v41];
      v29 = PRSLogObserver();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v49 = v26;
        __int16 v50 = 2048;
        v51 = self;
        __int16 v52 = 2114;
        id v53 = v28;
        _os_log_impl(&dword_1A78AC000, v29, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> client %{public}@ connected", buf, 0x20u);
      }

      id v24 = v27;
      os_unfair_lock_lock(&self->_lock);
      [(NSMutableSet *)self->_lock_clients addObject:v25];
      if (self->_lock_activated)
      {
        [v8 activate];
        uint64_t v30 = [v8 remoteTarget];
        v31 = (void *)v25[3];
        v25[3] = v30;
      }
      v32 = self->_lock_delegate;
      os_unfair_lock_unlock(&self->_lock);
      [(PRSWallpaperPublisherDelegate *)v32 wallpaperPublisherDidReceiveObserverConnection];

      objc_destroyWeak(&v46);
    }
    else
    {
      v37 = PRSLogObserver();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v49 = v38;
        __int16 v50 = 2048;
        v51 = self;
        __int16 v52 = 2114;
        id v53 = v24;
        _os_log_impl(&dword_1A78AC000, v37, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> rejecting client %{public}@ that doesn't want to observe anything", buf, 0x20u);
      }

      [v8 invalidate];
    }

    objc_destroyWeak(&location);
  }
  else
  {
    v33 = PRSLogObserver();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      uint64_t v36 = __clientDescription(v40, @"?", v8, 0);
      *(_DWORD *)buf = 138543874;
      id v49 = v35;
      __int16 v50 = 2048;
      v51 = self;
      __int16 v52 = 2114;
      id v53 = v36;
      _os_log_impl(&dword_1A78AC000, v33, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> rejecting client %{public}@ that isn't entitled", buf, 0x20u);
    }
    [v8 invalidate];
  }
}

void __67__PRSWallpaperPublisher_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PRSDefaultServiceQuality();
  [v3 setServiceQuality:v4];

  id v5 = PRSWallpaperObserverInterface();
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__PRSWallpaperPublisher_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E5D00E08;
  objc_copyWeak(&v14, (id *)(a1 + 64));
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = *(void **)(a1 + 56);
  id v10 = v6;
  uint64_t v11 = v7;
  id v12 = v8;
  id v13 = *(id *)(a1 + 32);
  [v3 setInvalidationHandler:v9];

  objc_destroyWeak(&v14);
}

void __67__PRSWallpaperPublisher_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = PRSLogObserver();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = 138543874;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1A78AC000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> client %{public}@ invalidated remotely", (uint8_t *)&v7, 0x20u);
  }

  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 36);
    [*((id *)WeakRetained + 14) removeObject:*(void *)(a1 + 56)];
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 36);
  }
}

- (void)_initializeClient:(id)a3 withKnownIdentities:(id)a4 knownRoles:(id)a5 knownCollection:(id)a6
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (char *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (![(NSMutableSet *)self->_lock_clients containsObject:v10]) {
    goto LABEL_72;
  }
  v79 = &self->_lock;
  id v80 = v13;
  v85 = self;
  id v77 = v12;
  id v78 = v11;
  if (v10[115])
  {
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    obuint64_t j = v11;
    uint64_t v15 = [obj countByEnumeratingWithState:&v96 objects:v109 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v97;
      do
      {
        uint64_t v18 = 0;
        uint64_t v81 = v16;
        do
        {
          if (*(void *)v97 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v96 + 1) + 8 * v18);
          v20 = [v19 identity];
          if (v20)
          {
            uint64_t v21 = *((void *)v10 + 13) & [v19 locations];
            if (v21)
            {
              v90[0] = MEMORY[0x1E4F143A8];
              v90[1] = 3221225472;
              v91 = (void (*)(void *))__90__PRSWallpaperPublisher__initializeClient_withKnownIdentities_knownRoles_knownCollection___block_invoke;
              v92 = &unk_1E5D00E58;
              id v93 = v20;
              v94 = self;
              v22 = v10;
              v95 = v10;
              v23 = v90;
              buf[0] = 0;
              uint8x8_t v24 = (uint8x8_t)vcnt_s8((int8x8_t)v21);
              v24.i16[0] = vaddlv_u8(v24);
              int v25 = v24.i32[0];
              if (v24.i32[0])
              {
                unint64_t v26 = 0;
                do
                {
                  if (((1 << v26) & v21) != 0)
                  {
                    v91(v23);
                    if (buf[0]) {
                      break;
                    }
                    --v25;
                  }
                  if (v26 > 0x3E) {
                    break;
                  }
                  ++v26;
                }
                while (v25 > 0);
              }

              uint64_t v10 = v22;
              uint64_t v16 = v81;
            }
          }

          ++v18;
        }
        while (v18 != v16);
        uint64_t v16 = [obj countByEnumeratingWithState:&v96 objects:v109 count:16];
      }
      while (v16);
    }

    BSAbsoluteMachTimeNow();
    uint64_t v28 = 0;
    id v11 = v78;
    p_lock = &self->_lock;
    id v13 = v80;
    do
    {
      *(void *)&v10[v28 * 8 + 72] = self->_lock_changeVersions[v28]
                                    - (v27 <= self->_lock_changeVersionTimestamps[v28] + 1.0);
      ++v28;
    }
    while (v28 != 4);
  }
  if (v10[129])
  {
    if ([v12 count])
    {
      v82 = v10;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v29 = v12;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v86 objects:v108 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        id obja = 0;
        uint64_t v32 = *(void *)v87;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v87 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v86 + 1) + 8 * i);
            v35 = [v34 role];
            uint64_t v36 = [v34 activePath];
            v37 = [(NSMutableDictionary *)self->_lock_roleToPath objectForKey:v35];
            v38 = [v36 identity];
            id v39 = [v37 identity];
            char v40 = [v38 isEqual:v39];

            if (v40)
            {
              self = v85;
            }
            else
            {
              v41 = obja;
              if (!obja) {
                v41 = objc_opt_new();
              }
              self = v85;
              id v42 = [(NSMutableDictionary *)v85->_lock_roleToPath objectForKey:v35];
              id obja = v41;
              [v41 setObject:v42 forKeyedSubscript:v35];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v86 objects:v108 count:16];
        }
        while (v31);
      }
      else
      {
        id obja = 0;
      }

      id v13 = v80;
      uint64_t v10 = v82;
      id v12 = v77;
      id v11 = v78;
      p_lock = v79;
    }
    else
    {
      id obja = (id)[(NSMutableDictionary *)self->_lock_roleToPath mutableCopy];
    }
  }
  else
  {
    id obja = 0;
  }
  if (v10[153])
  {
    if (v13)
    {
      id v43 = [v13 posterCollection];
      uint64_t v44 = [v43 count];
      uint64_t v45 = [*((id *)v10 + 17) count];

      if (v44 != v45)
      {
        if (![*((id *)v10 + 17) count])
        {
LABEL_51:
          id v46 = 0;
          goto LABEL_52;
        }
        uint64_t v47 = 0;
        while (1)
        {
          v48 = [*((id *)v10 + 17) objectAtIndexedSubscript:v47];
          id v49 = [v13 posterCollection];
          __int16 v50 = [v49 objectAtIndex:v47];

          v51 = [v48 serverIdentity];
          __int16 v52 = [v50 serverIdentity];
          char v53 = [v51 isEqual:v52];

          self = v85;
          if ((v53 & 1) == 0) {
            break;
          }
          if (++v47 >= (unint64_t)[*((id *)v10 + 17) count]) {
            goto LABEL_51;
          }
        }
      }
      id v46 = *((id *)v10 + 17);
LABEL_52:
      p_lock = v79;
      goto LABEL_53;
    }
    id v46 = [(NSMutableDictionary *)self->_lock_roleToPosterCollections objectForKeyedSubscript:*((void *)v10 + 18)];
  }
  else
  {
    id v46 = 0;
  }
LABEL_53:
  v10[112] = 1;
  if (v10[115]) {
    [(PRSWallpaperPublisher *)self _lock_sendStateToClient:v10];
  }
  if (v10[129])
  {
    uint64_t v54 = [obja count];
    v55 = PRSLogObserver();
    BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
    if (v54)
    {
      if (v56)
      {
        v57 = (objc_class *)objc_opt_class();
        v58 = NSStringFromClass(v57);
        uint64_t v59 = *((void *)v10 + 4);
        [obja allKeys];
        v61 = v60 = p_lock;
        *(_DWORD *)buf = 138544130;
        v101 = v58;
        __int16 v102 = 2048;
        v103 = v85;
        __int16 v104 = 2114;
        uint64_t v105 = v59;
        __int16 v106 = 2114;
        v107 = v61;
        _os_log_impl(&dword_1A78AC000, v55, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> issuing initial update to client %{public}@; data was stale for roles %{public}@",
          buf,
          0x2Au);

        p_lock = v60;
        self = v85;
      }
      v62 = (void *)*((void *)v10 + 3);
      v55 = [(PRSWallpaperPublisher *)self _lock_buildActivePosterObserverUpdatesForClient:v10 updatedRoles:obja];
      [v62 notifyRoleActivePosterUpdates:v55];
    }
    else if (v56)
    {
      v63 = (objc_class *)objc_opt_class();
      v64 = NSStringFromClass(v63);
      uint64_t v65 = *((void *)v10 + 4);
      *(_DWORD *)buf = 138543874;
      v101 = v64;
      __int16 v102 = 2048;
      v103 = self;
      __int16 v104 = 2114;
      uint64_t v105 = v65;
      _os_log_impl(&dword_1A78AC000, v55, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> bailing on initial update to client %{public}@; data was up-to-date",
        buf,
        0x20u);
    }
  }
  if (v10[153])
  {
    uint64_t v66 = [v46 count];
    v67 = PRSLogObserver();
    BOOL v68 = os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT);
    if (v66)
    {
      if (v68)
      {
        v69 = (objc_class *)objc_opt_class();
        v70 = NSStringFromClass(v69);
        uint64_t v71 = *((void *)v10 + 4);
        v72 = (void *)*((void *)v10 + 18);
        *(_DWORD *)buf = 138544130;
        v101 = v70;
        __int16 v102 = 2048;
        v103 = self;
        __int16 v104 = 2114;
        uint64_t v105 = v71;
        __int16 v106 = 2114;
        v107 = v72;
        _os_log_impl(&dword_1A78AC000, v67, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> issuing initial update to client %{public}@; data was stale for poster collection role %{public}@",
          buf,
          0x2Au);
      }
      v73 = (void *)*((void *)v10 + 3);
      v67 = [(PRSWallpaperPublisher *)self _lock_buildPosterCollectionUpdatesForClient:v10 role:*((void *)v10 + 18) updatedPosterCollection:v46];
      [v73 notifyRolePosterCollectionUpdates:v67];
    }
    else if (v68)
    {
      v74 = (objc_class *)objc_opt_class();
      v75 = NSStringFromClass(v74);
      uint64_t v76 = *((void *)v10 + 4);
      *(_DWORD *)buf = 138543874;
      v101 = v75;
      __int16 v102 = 2048;
      v103 = self;
      __int16 v104 = 2114;
      uint64_t v105 = v76;
      _os_log_impl(&dword_1A78AC000, v67, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> bailing on initial update to client %{public}@ for known poster collection; data was up-to-date",
        buf,
        0x20u);
    }
  }
  [*((id *)v10 + 3) notifyInitialUpdatesComplete];

  id v13 = v80;
LABEL_72:
  os_unfair_lock_unlock(p_lock);
}

void __90__PRSWallpaperPublisher__initializeClient_withKnownIdentities_knownRoles_knownCollection___block_invoke(void *a1, uint64_t a2)
{
  int v3 = PRSWallpaperObserverLocationsToIndex(a2);
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = [*(id *)(a1[5] + 8 * v3 + 40) identity];
  LODWORD(v4) = [v4 isEqual:v5];

  if (v4)
  {
    uint64_t v6 = *(void **)(a1[5] + 8 * v3 + 40);
    int v7 = (id *)(a1[6] + 8 * v3 + 40);
    objc_storeStrong(v7, v6);
  }
}

- (void)_initializeClient:(id)a3
{
  uint64_t v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableSet *)self->_lock_clients containsObject:v4]) {
    v4[112] = 1;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_lock_sendStateToClient:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (char *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!v4[115])
  {
    id v42 = [NSString stringWithFormat:@"Client is not observing changes for this; abort"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperPublisher _lock_sendStateToClient:]();
    }
    [v42 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78CD1B0);
  }
  uint64_t v5 = 0;
  uint64_t v50 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 4;
  do
  {
    uint64_t v8 = PRSWallpaperObserverLocationsFromIndex(v5);
    if ((v8 & ~*((void *)v4 + 13)) != 0) {
      goto LABEL_8;
    }
    __int16 v9 = &self->super.isa + v5;
    Class v10 = v9[9];
    id v11 = (Class *)&v4[8 * v5];
    if (v10 == v11[9])
    {
      if (v11[5] == v9[5]) {
        goto LABEL_8;
      }
      if (!v6)
      {
LABEL_11:
        uint64_t v6 = [MEMORY[0x1E4F1CA80] setWithCapacity:v7];
      }
    }
    else
    {
      v11[9] = v10;
      v50 |= v8;
      if (!v6) {
        goto LABEL_11;
      }
    }
    [v6 addObject:self->_lock_paths[v5]];
LABEL_8:
    ++v5;
    --v7;
  }
  while (v5 != 4);
  if ([v6 count])
  {
    uint64_t v12 = 0;
    unsigned int v48 = 0;
    memset(v69, 0, 32);
    do
    {
      id v13 = *(void **)&v4[v12 + 40];
      if (v13) {
        objc_storeStrong(&v69[v48++], v13);
      }
      v12 += 8;
    }
    while (v12 != 32);
    id v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v43 = v6;
    obuint64_t j = v6;
    int v15 = v48;
    uint64_t v52 = [obj countByEnumeratingWithState:&v54 objects:v68 count:16];
    if (v52)
    {
      uint64_t v51 = *(void *)v55;
      uint64_t v47 = v14;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v55 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = 0;
          uint64_t v18 = 0;
          uint64_t v19 = *(PFServerPosterPath **)(*((void *)&v54 + 1) + 8 * v16);
          v20 = (id *)(v4 + 40);
          do
          {
            uint64_t v21 = PRSWallpaperObserverLocationsFromIndex(v17);
            if ((v21 & ~*((void *)v4 + 13)) == 0 && self->_lock_paths[v17] == v19)
            {
              v18 |= v21;
              objc_storeStrong(v20, v19);
            }
            ++v17;
            ++v20;
          }
          while (v17 != 4);
          if (v15 < 1)
          {
LABEL_31:
            uint8x8_t v24 = objc_opt_new();
            if (v4[113])
            {
              int v25 = [*((id *)v4 + 2) remoteProcess];
              unint64_t v26 = [v25 auditToken];
              double v27 = v26;
              if (v26 && ([v26 isInvalid] & 1) == 0)
              {
                id v53 = 0;
                uint64_t v29 = [(PFServerPosterPath *)v19 extendContentsReadAccessToAuditToken:v27 error:&v53];
                id v46 = v53;
                if (v29)
                {
                  uint64_t v30 = (void *)v29;
                  [v24 setPath:v29];
                }
                else
                {
                  uint64_t v31 = PRSLogObserver();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                  {
                    v35 = (objc_class *)objc_opt_class();
                    uint64_t v45 = NSStringFromClass(v35);
                    uint64_t v44 = [(PFServerPosterPath *)v19 identity];
                    uint64_t v36 = (void *)*((void *)v4 + 4);
                    *(_DWORD *)buf = 138544386;
                    uint64_t v59 = v45;
                    __int16 v60 = 2048;
                    v61 = self;
                    __int16 v62 = 2114;
                    v63 = v44;
                    __int16 v64 = 2114;
                    uint64_t v65 = v36;
                    __int16 v66 = 2114;
                    v67 = v27;
                    _os_log_error_impl(&dword_1A78AC000, v31, OS_LOG_TYPE_ERROR, "<%{public}@:%p> failed to prepare update of %{public}@ for client %{public}@ due to bad auditToken %{public}@", buf, 0x34u);
                  }
                  uint64_t v32 = v31;
                  uint64_t v30 = 0;
                }
                v33 = [v24 path];

                if (!v33) {
                  [v24 setPath:v19];
                }
              }
              else
              {
                [v24 setPath:v19];
              }

              id v14 = v47;
              int v15 = v48;
            }
            [v24 setChanged:v18 & v50];
            v34 = [v24 path];

            if (!v34) {
              [v24 setPath:v19];
            }
          }
          else
          {
            v22 = v69;
            uint64_t v23 = v48;
            while (v19 != *v22)
            {
              ++v22;
              if (!--v23) {
                goto LABEL_31;
              }
            }
            uint8x8_t v24 = objc_opt_new();
            uint64_t v28 = [(PFServerPosterPath *)v19 identity];
            [v24 setIdentity:v28];
          }
          [v24 setLocations:v18];
          [v14 addObject:v24];

          ++v16;
        }
        while (v16 != v52);
        uint64_t v52 = [obj countByEnumeratingWithState:&v54 objects:v68 count:16];
      }
      while (v52);
    }

    v37 = PRSLogObserver();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (objc_class *)objc_opt_class();
      id v39 = NSStringFromClass(v38);
      char v40 = (void *)*((void *)v4 + 4);
      *(_DWORD *)buf = 138544130;
      uint64_t v59 = v39;
      __int16 v60 = 2048;
      v61 = self;
      __int16 v62 = 2114;
      v63 = v40;
      __int16 v64 = 2114;
      uint64_t v65 = v14;
      _os_log_impl(&dword_1A78AC000, v37, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> notifying client %{public}@ of updates=%{public}@", buf, 0x2Au);
    }
    [*((id *)v4 + 3) notifyWallpaperUpdates:v14];

    uint64_t v41 = 3;
    uint64_t v6 = v43;
    do

    while (v41 != -1);
  }
}

- (void)_lock_noteChanged:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  if (a3)
  {
    BSAbsoluteMachTimeNow();
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != 4; ++i)
    {
      if ((PRSWallpaperObserverLocationsFromIndex(i) & ~a3) == 0)
      {
        uint64_t v8 = &self->super.isa + i;
        v8[9] = (Class)((char *)v8[9] + 1);
        v8[1] = v6;
      }
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  __int16 v9 = self->_lock_clients;
  uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * j);
        if (*(unsigned char *)(v14 + 112) && *(unsigned char *)(v14 + 115)) {
          [(PRSWallpaperPublisher *)self _lock_sendStateToClient:(void)v15];
        }
      }
      uint64_t v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)_lock_noteSnapshotUpdateForPath:(id)a3 snapshotType:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v19 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = self->_lock_clients;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v21 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    __int16 v9 = 0;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (*(unsigned char *)(v12 + 112) && *(unsigned char *)(v12 + 114))
        {
          if (!v9) {
            __int16 v9 = [[PRSWallpaperObserverSnapshotUpdate alloc] initWithPath:v20 snapshotType:v19];
          }
          id v13 = PRSLogObserver();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v14 = (objc_class *)objc_opt_class();
            long long v15 = NSStringFromClass(v14);
            uint64_t v16 = *(void *)(v12 + 32);
            *(_DWORD *)buf = 138544130;
            double v27 = v15;
            __int16 v28 = 2048;
            uint64_t v29 = self;
            __int16 v30 = 2114;
            uint64_t v31 = v16;
            __int16 v32 = 2114;
            v33 = v9;
            _os_log_impl(&dword_1A78AC000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> notifying client %{public}@ of snapshot updates=%{public}@", buf, 0x2Au);
          }
          long long v17 = *(void **)(v12 + 24);
          int v25 = v9;
          long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
          [v17 notifySnapshotUpdates:v18];
        }
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v21 objects:v34 count:16];
    }
    while (v8);
  }
  else
  {
    __int16 v9 = 0;
  }
}

- (void)_lock_issueUpdateForRoles:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v34 = self;
  if (!self->_lock_activated)
  {
    double v27 = NSString;
    __int16 v28 = (objc_class *)objc_opt_class();
    uint64_t v29 = NSStringFromClass(v28);
    __int16 v30 = [v27 stringWithFormat:@"<%@:%p> received multi-update before role activation", v29, self];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperPublisher _lock_issueUpdateForRoles:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78CD8F0);
  }
  v33 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = [v4 keyEnumerator];
  uint64_t v5 = [obj countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        id v10 = v4;
        uint64_t v11 = [v4 objectForKeyedSubscript:v9];
        uint64_t v12 = [(NSMutableDictionary *)v34->_lock_roleToPath objectForKeyedSubscript:v9];
        id v13 = [v12 serverIdentity];
        uint64_t v14 = [v11 serverIdentity];
        char v15 = [v13 isEqual:v14];

        if ((v15 & 1) == 0)
        {
          [(NSMutableDictionary *)v34->_lock_roleToPath setObject:v11 forKeyedSubscript:v9];
          [v33 setObject:v11 forKey:v9];
        }

        id v4 = v10;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v6);
  }

  if ([v33 count])
  {
    id v31 = v4;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v16 = v34->_lock_clients;
    uint64_t v17 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v35 objects:v51 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v35 + 1) + 8 * j);
          long long v22 = [(PRSWallpaperPublisher *)v34 _lock_buildActivePosterObserverUpdatesForClient:v21 updatedRoles:v33];
          if ([v22 count])
          {
            long long v23 = PRSLogObserver();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              long long v24 = (objc_class *)objc_opt_class();
              int v25 = NSStringFromClass(v24);
              uint64_t v26 = *(void *)(v21 + 32);
              *(_DWORD *)buf = 138544130;
              uint64_t v44 = v25;
              __int16 v45 = 2048;
              id v46 = v34;
              __int16 v47 = 2114;
              uint64_t v48 = v26;
              __int16 v49 = 2114;
              uint64_t v50 = v22;
              _os_log_impl(&dword_1A78AC000, v23, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> notifying client %{public}@ of role observer updates=%{public}@", buf, 0x2Au);
            }
            [*(id *)(v21 + 24) notifyRoleActivePosterUpdates:v22];
          }
        }
        uint64_t v18 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v35 objects:v51 count:16];
      }
      while (v18);
    }

    id v4 = v31;
  }
}

- (id)_lock_buildActivePosterObserverUpdatesForClient:(id)a3 updatedRoles:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v32 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!*((unsigned char *)v6 + 112) || !*((unsigned char *)v6 + 129))
  {
    id v10 = 0;
    goto LABEL_31;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = [v32 keyEnumerator];
  uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v51 count:16];
  if (!v7)
  {
    id v10 = 0;
    goto LABEL_30;
  }
  uint64_t v9 = v7;
  __int16 v30 = self;
  id v10 = 0;
  uint64_t v11 = *(void *)v36;
  *(void *)&long long v8 = 138544642;
  long long v27 = v8;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v36 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8 * v12);
      if (objc_msgSend(*((id *)v6 + 15), "containsObject:", v13, v27))
      {
        uint64_t v14 = [v32 objectForKeyedSubscript:v13];
        if (!*((unsigned char *)v6 + 128)) {
          goto LABEL_13;
        }
        char v15 = [*((id *)v6 + 2) remoteProcess];
        uint64_t v16 = [v15 auditToken];
        uint64_t v17 = v16;
        if (!v16 || ([v16 isInvalid] & 1) != 0)
        {

          goto LABEL_13;
        }
        id v34 = 0;
        uint64_t v19 = [v14 extendContentsReadAccessToAuditToken:v17 error:&v34];
        id v31 = v34;
        if (v19)
        {
          id v20 = [[PRSRoleActivePosterObserverUpdate alloc] initWithRole:v13 activePath:v19];
          uint64_t v21 = (void *)v19;
          uint64_t v18 = v20;
        }
        else
        {
          long long v22 = PRSLogObserver();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            long long v23 = (objc_class *)objc_opt_class();
            uint64_t v29 = NSStringFromClass(v23);
            __int16 v28 = [v14 identity];
            uint64_t v24 = *((void *)v6 + 4);
            *(_DWORD *)buf = v27;
            long long v40 = v29;
            __int16 v41 = 2048;
            long long v42 = v30;
            __int16 v43 = 2114;
            uint64_t v44 = v28;
            __int16 v45 = 2114;
            uint64_t v46 = v13;
            __int16 v47 = 2114;
            uint64_t v48 = v24;
            __int16 v49 = 2114;
            uint64_t v50 = v17;
            _os_log_error_impl(&dword_1A78AC000, v22, OS_LOG_TYPE_ERROR, "<%{public}@:%p> failed to prepare role update of %{public}@/%{public}@ for client %{public}@ due to bad auditToken %{public}@", buf, 0x3Eu);
          }
          uint64_t v18 = 0;
          uint64_t v21 = 0;
        }

        if (!v18) {
LABEL_13:
        }
          uint64_t v18 = [[PRSRoleActivePosterObserverUpdate alloc] initWithRole:v13 activePath:v14];
        if (!v10) {
          id v10 = objc_opt_new();
        }
        [v10 addObject:v18];
      }
      ++v12;
    }
    while (v9 != v12);
    uint64_t v25 = [obj countByEnumeratingWithState:&v35 objects:v51 count:16];
    uint64_t v9 = v25;
  }
  while (v25);
LABEL_30:

LABEL_31:
  return v10;
}

- (void)_lock_issuePosterCollectionUpdate:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v42 = self;
  if (!self->_lock_activated)
  {
    v33 = NSString;
    id v34 = (objc_class *)objc_opt_class();
    long long v35 = NSStringFromClass(v34);
    long long v36 = [v33 stringWithFormat:@"<%@:%p> received multi-update before role activation", v35, self];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperPublisher _lock_issuePosterCollectionUpdate:]();
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78CE128);
  }
  long long v38 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = [v4 keyEnumerator];
  id v40 = v4;
  uint64_t v41 = [obj countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v49 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v7 = [(NSMutableDictionary *)v42->_lock_roleToPosterCollections objectForKeyedSubscript:v6];
        long long v8 = [v4 objectForKeyedSubscript:v6];
        uint64_t v9 = [v7 count];
        if (v9 == [v8 count])
        {
          if (![v7 count]) {
            goto LABEL_14;
          }
          uint64_t v10 = 0;
          while (1)
          {
            uint64_t v11 = [v7 objectAtIndexedSubscript:v10];
            uint64_t v12 = [v8 objectAtIndexedSubscript:v10];
            uint64_t v13 = [v11 serverIdentity];
            uint64_t v14 = [v12 serverIdentity];
            char v15 = [v13 isEqual:v14];

            if ((v15 & 1) == 0) {
              break;
            }
            if (++v10 >= (unint64_t)[v7 count]) {
              goto LABEL_14;
            }
          }
        }
        uint64_t v16 = (void *)[v8 copy];
        [v38 setObject:v16 forKeyedSubscript:v6];

LABEL_14:
        id v4 = v40;
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v41);
  }

  uint64_t v17 = v38;
  if ([v38 count])
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __59__PRSWallpaperPublisher__lock_issuePosterCollectionUpdate___block_invoke;
    v47[3] = &unk_1E5D00E80;
    v47[4] = v42;
    [v38 enumerateKeysAndObjectsUsingBlock:v47];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v18 = v42->_lock_clients;
    uint64_t v19 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v43 objects:v60 count:16];
    id v20 = v38;
    if (v19)
    {
      uint64_t v21 = v19;
      uint64_t v22 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v44 != v22) {
            objc_enumerationMutation(v18);
          }
          uint64_t v24 = *(void *)(*((void *)&v43 + 1) + 8 * j);
          id v25 = *(id *)(v24 + 144);
          uint64_t v26 = [v20 objectForKeyedSubscript:v25];

          if (v26)
          {
            long long v27 = [v20 objectForKeyedSubscript:v25];
            __int16 v28 = [(PRSWallpaperPublisher *)v42 _lock_buildPosterCollectionUpdatesForClient:v24 role:v25 updatedPosterCollection:v27];

            if ([v28 count])
            {
              uint64_t v29 = PRSLogObserver();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v30 = (objc_class *)objc_opt_class();
                id v31 = NSStringFromClass(v30);
                uint64_t v32 = *(void *)(v24 + 32);
                *(_DWORD *)buf = 138544130;
                uint64_t v53 = v31;
                __int16 v54 = 2048;
                long long v55 = v42;
                id v20 = v38;
                __int16 v56 = 2114;
                uint64_t v57 = v32;
                __int16 v58 = 2114;
                uint64_t v59 = v28;
                _os_log_impl(&dword_1A78AC000, v29, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> notifying client %{public}@ of poster collection role observer updates=%{public}@", buf, 0x2Au);
              }
              [*(id *)(v24 + 24) notifyRolePosterCollectionUpdates:v28];
            }
          }
        }
        uint64_t v21 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v43 objects:v60 count:16];
      }
      while (v21);
    }

    uint64_t v17 = v20;
    id v4 = v40;
  }
}

uint64_t __59__PRSWallpaperPublisher__lock_issuePosterCollectionUpdate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) setObject:a3 forKeyedSubscript:a2];
}

- (id)_lock_buildPosterCollectionUpdatesForClient:(id)a3 role:(id)a4 updatedPosterCollection:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  long long v8 = (id *)a3;
  id v9 = a4;
  id v10 = a5;
  id v34 = self;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v11 = [v8[2] remoteProcess];
  uint64_t v12 = [v11 auditToken];
  if (*((unsigned char *)v8 + 112) && *((unsigned char *)v8 + 153))
  {
    __int16 v30 = v11;
    id v32 = v9;
    uint64_t v13 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v31 = v10;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v54 count:16];
    if (!v15) {
      goto LABEL_21;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v38;
    while (1)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * v18);
        if (*((unsigned char *)v8 + 152)) {
          BOOL v20 = v12 == 0;
        }
        else {
          BOOL v20 = 1;
        }
        if (!v20 && ([v12 isInvalid] & 1) == 0)
        {
          id v36 = 0;
          id v21 = [v19 extendContentsReadAccessToAuditToken:v12 error:&v36];
          id v22 = v36;
          long long v23 = v22;
          if (v21)
          {

            goto LABEL_19;
          }
          uint64_t v24 = PRSLogObserver();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            id v25 = (objc_class *)objc_opt_class();
            long long v35 = NSStringFromClass(v25);
            v33 = [v19 identity];
            id v26 = v8[4];
            *(_DWORD *)buf = 138544642;
            long long v43 = v35;
            __int16 v44 = 2048;
            long long v45 = v34;
            __int16 v46 = 2114;
            __int16 v47 = v33;
            __int16 v48 = 2114;
            id v49 = v32;
            __int16 v50 = 2114;
            id v51 = v26;
            __int16 v52 = 2114;
            uint64_t v53 = v12;
            _os_log_error_impl(&dword_1A78AC000, v24, OS_LOG_TYPE_ERROR, "<%{public}@:%p> failed to prepare role update of %{public}@/%{public}@ for client %{public}@ due to bad auditToken %{public}@", buf, 0x3Eu);
          }
        }
        id v21 = v19;
LABEL_19:
        objc_msgSend(v13, "addObject:", v21, v30);

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v54 count:16];
      if (!v16)
      {
LABEL_21:

        id v9 = v32;
        long long v27 = [[PRSPosterRoleCollectionObserverUpdate alloc] initWithRole:v32 posterCollection:v13];
        uint64_t v41 = v27;
        __int16 v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];

        uint64_t v11 = v30;
        id v10 = v31;
        goto LABEL_23;
      }
    }
  }
  __int16 v28 = 0;
LABEL_23:

  return v28;
}

- (void)_lock_activateClientsIfNeeded
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_lock_activated)
  {
    int v3 = PRSLogObserver();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      uint64_t v6 = [(NSMutableSet *)self->_lock_clients count];
      *(_DWORD *)buf = 138543874;
      id v25 = v5;
      __int16 v26 = 2048;
      long long v27 = self;
      __int16 v28 = 2048;
      uint64_t v29 = v6;
      _os_log_impl(&dword_1A78AC000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Activating %lu clients", buf, 0x20u);
    }
    self->_lock_activated = 1;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_lock_clients;
    uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          if (!*(void *)(v12 + 24))
          {
            uint64_t v13 = PRSLogObserver();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              id v14 = (objc_class *)objc_opt_class();
              uint64_t v15 = NSStringFromClass(v14);
              uint64_t v16 = *(void *)(v12 + 32);
              *(_DWORD *)buf = 138543874;
              id v25 = v15;
              __int16 v26 = 2048;
              long long v27 = self;
              __int16 v28 = 2112;
              uint64_t v29 = v16;
              _os_log_impl(&dword_1A78AC000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Activating client that connected earlier: %@", buf, 0x20u);
            }
            [*(id *)(v12 + 16) activate];
            uint64_t v17 = [*(id *)(v12 + 16) remoteTarget];
            uint64_t v18 = *(void **)(v12 + 24);
            *(void *)(v12 + 24) = v17;
          }
        }
        uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_roleToPosterCollections, 0);
  objc_storeStrong((id *)&self->_lock_roleToPath, 0);
  objc_storeStrong((id *)&self->_lock_delegate, 0);
  objc_storeStrong((id *)&self->_lock_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  for (uint64_t i = 64; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
}

- (void)initializeWithPaths:recentlyChanged:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initializeWithPaths:recentlyChanged:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initializeRoles:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updatePaths:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updatePaths:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updatePaths:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)noteSnapshotUpdateForPath:snapshotType:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initializePosterCollectionForRoles:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_lock_sendStateToClient:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_lock_issueUpdateForRoles:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_lock_issuePosterCollectionUpdate:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end