@interface NTKPigmentPreferenceManager
+ (BOOL)_shouldSaveAutoSelectedPigments:(id)a3 forCollectionName:(id)a4 userDefault:(id)a5;
- (BOOL)_threadunsafe_isOptionVisible:(id)a3;
- (BOOL)isOptionVisible:(id)a3;
- (NPSDomainAccessor)npsDomainAccessor;
- (NSSet)autoSelectedPigments;
- (NSSet)selectedPigments;
- (NSString)domain;
- (NSUserDefaults)userDefault;
- (NTKPigmentPreferenceManager)init;
- (NTKPigmentPreferenceManager)initWithDomain:(id)a3;
- (NTKPigmentPreferenceManagerDelegate)delegate;
- (OS_dispatch_queue)privateQueue;
- (void)_loadAutoSelectedPigments;
- (void)_loadVisibleOptions;
- (void)_threadunsafe_appendAutoSelectPigments:(id)a3;
- (void)_threadunsafe_removeAllAutoSelectPigments;
- (void)_threadunsafe_removeAutoSelectionWithOptionName:(id)a3;
- (void)_threadunsafe_setOptionName:(id)a3 visible:(BOOL)a4;
- (void)_threadunsafe_setOptionName:(id)a3 visible:(BOOL)a4 manual:(BOOL)a5;
- (void)_threadunsafe_syncAllContent;
- (void)_threadunsafe_syncAutoSelectedPigments:(id)a3;
- (void)_threadunsafe_syncVisibleOptionsByCollection:(id)a3;
- (void)dealloc;
- (void)handlePairedDeviceChanged;
- (void)resetContent;
- (void)setAutoSelectedPigments:(id)a3;
- (void)setAutoSelectedPigments:(id)a3 forCollectionName:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDomain:(id)a3;
- (void)setNpsDomainAccessor:(id)a3;
- (void)setOption:(id)a3 visible:(BOOL)a4;
- (void)setPrivateQueue:(id)a3;
- (void)setSelectedPigments:(id)a3;
- (void)setUserDefault:(id)a3;
@end

@implementation NTKPigmentPreferenceManager

- (NTKPigmentPreferenceManager)init
{
  return [(NTKPigmentPreferenceManager *)self initWithDomain:@"com.apple.NanoTimeKit"];
}

- (void)dealloc
{
  pthread_rwlock_destroy(&self->_rwlock);
  v3.receiver = self;
  v3.super_class = (Class)NTKPigmentPreferenceManager;
  [(NTKPigmentPreferenceManager *)&v3 dealloc];
}

- (NTKPigmentPreferenceManager)initWithDomain:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)NTKPigmentPreferenceManager;
  v6 = [(NTKPigmentPreferenceManager *)&v32 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_domain, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.nanotimekit.NTKPigmentPreferenceManager", 0);
    privateQueue = v7->_privateQueue;
    v7->_privateQueue = (OS_dispatch_queue *)v8;

    pthread_rwlock_init(&v7->_rwlock, 0);
    id v10 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v11 = [(NTKPigmentPreferenceManager *)v7 domain];
    uint64_t v12 = [v10 initWithSuiteName:v11];
    userDefault = v7->_userDefault;
    v7->_userDefault = (NSUserDefaults *)v12;

    id v14 = objc_alloc(MEMORY[0x1E4F79CD8]);
    v15 = [(NTKPigmentPreferenceManager *)v7 domain];
    uint64_t v16 = [v14 initWithDomain:v15];
    npsDomainAccessor = v7->_npsDomainAccessor;
    v7->_npsDomainAccessor = (NPSDomainAccessor *)v16;

    [(NTKPigmentPreferenceManager *)v7 _loadVisibleOptions];
    [(NTKPigmentPreferenceManager *)v7 _loadAutoSelectedPigments];
    v18 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      selectedPigments = v7->_selectedPigments;
      *(_DWORD *)buf = 138543362;
      v34 = selectedPigments;
      _os_log_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_INFO, "#pref-sync Initializing with visible options: %{public}@", buf, 0xCu);
    }

    v20 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      autoSelectedPigments = v7->_autoSelectedPigments;
      *(_DWORD *)buf = 138543362;
      v34 = autoSelectedPigments;
      _os_log_impl(&dword_1BC5A9000, v20, OS_LOG_TYPE_INFO, "#pref-sync Initializing with auto-selected pigments: %{public}@", buf, 0xCu);
    }

    if ((CLKIsClockFaceApp() & 1) != 0 || CLKIsBridge())
    {
      objc_initWeak((id *)buf, v7);
      v22 = +[NTKDarwinNotificationCenter defaultCenter];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke;
      v30[3] = &unk_1E62C0068;
      objc_copyWeak(&v31, (id *)buf);
      [v22 addObserver:v7 notificationName:@"com.apple.NanoTimeKit.NPS.NTKSelectedPigmentListDidChangeNotification" usingBlock:v30];

      v23 = +[NTKDarwinNotificationCenter defaultCenter];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke_27;
      v28[3] = &unk_1E62C0068;
      objc_copyWeak(&v29, (id *)buf);
      [v23 addObserver:v7 notificationName:@"com.apple.NanoTimeKit.NPS.NTKAutoSelectedPigmentListDidChangeNotification" usingBlock:v28];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
    }
    if (CLKIsClockFaceApp())
    {
      objc_initWeak((id *)buf, v7);
      v24 = +[NTKDarwinNotificationCenter defaultCenter];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke_29;
      v26[3] = &unk_1E62C0068;
      objc_copyWeak(&v27, (id *)buf);
      [v24 addObserver:v7 notificationName:*MEMORY[0x1E4F79CE8] usingBlock:v26];

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
  }

  return v7;
}

void __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = @"com.apple.NanoTimeKit.NPS.NTKSelectedPigmentListDidChangeNotification";
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "#pref-sync received darwin notification %{public}@", buf, 0xCu);
  }

  if (WeakRetained)
  {
    objc_super v3 = [WeakRetained privateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke_25;
    block[3] = &unk_1E62BFF20;
    id v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

void __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke_25(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _loadVisibleOptions];
  v2 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = [*(id *)(a1 + 32) selectedPigments];
    int v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "#pref-sync Visible options after handling darwin notification: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  v4 = [*(id *)(a1 + 32) delegate];
  [v4 pigmentPreferenceManagerDidUpdateSelectedColors:*(void *)(a1 + 32)];
}

void __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke_27(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = @"com.apple.NanoTimeKit.NPS.NTKAutoSelectedPigmentListDidChangeNotification";
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "#pref-sync received darwin notification %{public}@", buf, 0xCu);
  }

  if (WeakRetained)
  {
    objc_super v3 = [WeakRetained privateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke_28;
    block[3] = &unk_1E62BFF20;
    id v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

void __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke_28(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _loadAutoSelectedPigments];
  v2 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = [*(id *)(a1 + 32) autoSelectedPigments];
    int v4 = 138543362;
    id v5 = v3;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "#pref-sync Auto-selected pigments after handling darwin notification: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __46__NTKPigmentPreferenceManager_initWithDomain___block_invoke_29(uint64_t a1)
{
  v2 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 0;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "#pref-sync Received darwin notification initial sync completed. Forcing sync.", (uint8_t *)v5, 2u);
  }

  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    pthread_rwlock_rdlock((pthread_rwlock_t *)(WeakRetained + 8));
    objc_msgSend(v4, "_threadunsafe_syncAllContent");
    pthread_rwlock_unlock((pthread_rwlock_t *)(v4 + 8));
  }
}

- (NSSet)selectedPigments
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  int v4 = (void *)[(NSSet *)self->_selectedPigments copy];
  pthread_rwlock_unlock(p_rwlock);
  return (NSSet *)v4;
}

- (void)setSelectedPigments:(id)a3
{
  p_rwlock = &self->_rwlock;
  id v5 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  uint64_t v6 = (NSSet *)[v5 copy];

  selectedPigments = self->_selectedPigments;
  self->_selectedPigments = v6;

  pthread_rwlock_unlock(p_rwlock);
}

- (NSSet)autoSelectedPigments
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  int v4 = (void *)[(NSSet *)self->_autoSelectedPigments copy];
  pthread_rwlock_unlock(p_rwlock);
  return (NSSet *)v4;
}

- (void)setAutoSelectedPigments:(id)a3
{
  p_rwlock = &self->_rwlock;
  id v5 = a3;
  pthread_rwlock_wrlock(p_rwlock);
  uint64_t v6 = (NSSet *)[v5 copy];

  autoSelectedPigments = self->_autoSelectedPigments;
  self->_autoSelectedPigments = v6;

  pthread_rwlock_unlock(p_rwlock);
}

- (BOOL)isOptionVisible:(id)a3
{
  id v4 = a3;
  if ([v4 isAddable])
  {
    p_rwlock = &self->_rwlock;
    pthread_rwlock_rdlock(&self->_rwlock);
    BOOL v6 = [(NTKPigmentPreferenceManager *)self _threadunsafe_isOptionVisible:v4];
    pthread_rwlock_unlock(p_rwlock);
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)setOption:(id)a3 visible:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  pthread_rwlock_wrlock(&self->_rwlock);
  BOOL v6 = [v7 fullname];
  [(NTKPigmentPreferenceManager *)self _threadunsafe_setOptionName:v6 visible:v4];

  [(NTKPigmentPreferenceManager *)self _threadunsafe_syncAllContent];
  pthread_rwlock_unlock(&self->_rwlock);
}

- (void)setAutoSelectedPigments:(id)a3 forCollectionName:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v6 = a4;
  pthread_rwlock_wrlock(&self->_rwlock);
  id v7 = objc_opt_class();
  uint64_t v8 = [(NTKPigmentPreferenceManager *)self userDefault];
  LODWORD(v7) = [v7 _shouldSaveAutoSelectedPigments:v31 forCollectionName:v6 userDefault:v8];

  if (v7)
  {
    v9 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v40 = v6;
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "#pref-sync Starting auto-selection for domain: %{public}@", buf, 0xCu);
    }

    id v10 = [(NTKPigmentPreferenceManager *)self userDefault];
    v30 = [v10 objectForKey:@"DefaultSelectedPigmentsByDomain"];

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = [v30 objectForKeyedSubscript:v6];
    v28 = [v11 setWithArray:v12];

    if ([v28 count])
    {
      v13 = (void *)[(NSSet *)self->_autoSelectedPigments copy];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __73__NTKPigmentPreferenceManager_setAutoSelectedPigments_forCollectionName___block_invoke;
      v36[3] = &unk_1E62C18C8;
      id v37 = v28;
      v38 = self;
      [v13 enumerateObjectsUsingBlock:v36];
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v16 = v31;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v43 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v16);
          }
          v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v21 = objc_msgSend(v20, "fullname", v28);
          [v15 addObject:v21];

          if (!-[NTKPigmentPreferenceManager _threadunsafe_isOptionVisible:](self, "_threadunsafe_isOptionVisible:", v20))[v14 addObject:v20]; {
          v22 = [v20 fullname];
          }
          [(NTKPigmentPreferenceManager *)self _threadunsafe_setOptionName:v22 visible:1 manual:0];
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v43 count:16];
      }
      while (v17);
    }

    v23 = (void *)[v30 mutableCopy];
    if (!v23)
    {
      v23 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v15, v6, v28);
    v24 = [(NTKPigmentPreferenceManager *)self userDefault];
    [v24 setObject:v23 forKey:@"DefaultSelectedPigmentsByDomain"];

    v25 = [(NTKPigmentPreferenceManager *)self userDefault];
    [v25 synchronize];

    [(NTKPigmentPreferenceManager *)self _threadunsafe_appendAutoSelectPigments:v14];
    [(NTKPigmentPreferenceManager *)self _threadunsafe_syncAllContent];
    v26 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      selectedPigments = self->_selectedPigments;
      *(_DWORD *)buf = 138543618;
      id v40 = v6;
      __int16 v41 = 2114;
      v42 = selectedPigments;
      _os_log_impl(&dword_1BC5A9000, v26, OS_LOG_TYPE_DEFAULT, "#pref-sync Finished auto-selection for domain: %{public}@ - selections: %{public}@", buf, 0x16u);
    }
  }
  pthread_rwlock_unlock(&self->_rwlock);
}

void __73__NTKPigmentPreferenceManager_setAutoSelectedPigments_forCollectionName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:")) {
    objc_msgSend(*(id *)(a1 + 40), "_threadunsafe_setOptionName:visible:manual:", v3, 0, 1);
  }
}

- (void)_threadunsafe_syncAllContent
{
  if ((NPSHasCompletedInitialSync() & 1) == 0)
  {
    id v3 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "#pref-sync Trying to sync preferences, but NPS has not completed initial sync yet", v6, 2u);
    }
  }
  BOOL v4 = (void *)[(NSSet *)self->_autoSelectedPigments copy];
  [(NTKPigmentPreferenceManager *)self _threadunsafe_syncAutoSelectedPigments:v4];

  id v5 = (void *)[(NSSet *)self->_selectedPigments copy];
  [(NTKPigmentPreferenceManager *)self _threadunsafe_syncVisibleOptionsByCollection:v5];
}

- (void)resetContent
{
  id obj = [MEMORY[0x1E4F1CAD0] set];
  pthread_rwlock_wrlock(&self->_rwlock);
  [(NTKPigmentPreferenceManager *)self _threadunsafe_removeAllAutoSelectPigments];
  objc_storeStrong((id *)&self->_selectedPigments, obj);
  pthread_rwlock_unlock(&self->_rwlock);
  [(NTKPigmentPreferenceManager *)self _threadunsafe_syncVisibleOptionsByCollection:obj];
}

- (void)handlePairedDeviceChanged
{
  id v3 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "#pref-sync Recreating domain accessor because paired device changed", v8, 2u);
  }

  pthread_rwlock_wrlock(&self->_rwlock);
  id v4 = objc_alloc(MEMORY[0x1E4F79CD8]);
  id v5 = [(NTKPigmentPreferenceManager *)self domain];
  id v6 = (NPSDomainAccessor *)[v4 initWithDomain:v5];
  npsDomainAccessor = self->_npsDomainAccessor;
  self->_npsDomainAccessor = v6;

  pthread_rwlock_unlock(&self->_rwlock);
}

- (BOOL)_threadunsafe_isOptionVisible:(id)a3
{
  id v4 = a3;
  if ([v4 isAddable])
  {
    selectedPigments = self->_selectedPigments;
    id v6 = [v4 fullname];
    char v7 = [(NSSet *)selectedPigments containsObject:v6];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)_threadunsafe_setOptionName:(id)a3 visible:(BOOL)a4
{
}

- (void)_threadunsafe_setOptionName:(id)a3 visible:(BOOL)a4 manual:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v11 = a3;
  uint64_t v8 = (void *)[(NSSet *)self->_selectedPigments mutableCopy];
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  }
  if (v6) {
    [v8 addObject:v11];
  }
  else {
    [v8 removeObject:v11];
  }
  v9 = (NSSet *)[v8 copy];
  selectedPigments = self->_selectedPigments;
  self->_selectedPigments = v9;

  if (v5) {
    [(NTKPigmentPreferenceManager *)self _threadunsafe_removeAutoSelectionWithOptionName:v11];
  }
}

+ (BOOL)_shouldSaveAutoSelectedPigments:(id)a3 forCollectionName:(id)a4 userDefault:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  BOOL v11 = 0;
  if (v8 && v9)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "identifier", (void)v26);
          [v12 appendString:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }

    v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
    v20 = [v10 objectForKey:@"AutoSelectionIdentifiersByDomain"];
    v21 = v20;
    if (v20
      && ([v20 objectForKeyedSubscript:v8],
          v22 = objc_claimAutoreleasedReturnValue(),
          char v23 = [v22 isEqualToNumber:v19],
          v22,
          (v23 & 1) != 0))
    {
      BOOL v11 = 0;
    }
    else
    {
      v24 = objc_msgSend(v21, "mutableCopy", (void)v26);
      if (!v24)
      {
        v24 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      [v24 setObject:v19 forKeyedSubscript:v8];
      [v10 setObject:v24 forKey:@"AutoSelectionIdentifiersByDomain"];

      BOOL v11 = 1;
    }
  }
  return v11;
}

- (void)_threadunsafe_removeAutoSelectionWithOptionName:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSSet *)self->_autoSelectedPigments containsObject:v4])
  {
    BOOL v5 = (void *)[(NSSet *)self->_autoSelectedPigments mutableCopy];
    [v5 removeObject:v4];
    BOOL v6 = (NSSet *)[v5 copy];
    autoSelectedPigments = self->_autoSelectedPigments;
    self->_autoSelectedPigments = v6;

    id v8 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "#pref-sync Auto-selected pigment removed: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_threadunsafe_appendAutoSelectPigments:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    BOOL v5 = (void *)[(NSSet *)self->_autoSelectedPigments mutableCopy];
    if (!v5)
    {
      BOOL v5 = [MEMORY[0x1E4F1CA80] set];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "fullname", (void)v15);
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v8);
    }

    id v12 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v6;
      _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "#pref-sync Auto-selected pigments added: %{public}@ Synchronizing.", buf, 0xCu);
    }

    id v13 = (NSSet *)[v5 copy];
    autoSelectedPigments = self->_autoSelectedPigments;
    self->_autoSelectedPigments = v13;
  }
}

- (void)_threadunsafe_removeAllAutoSelectPigments
{
  id v3 = [MEMORY[0x1E4F1CAD0] set];
  autoSelectedPigments = self->_autoSelectedPigments;
  self->_autoSelectedPigments = v3;
  BOOL v5 = v3;

  id v6 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "#pref-sync Removed all auto-selected pigments.", v7, 2u);
  }

  [(NTKPigmentPreferenceManager *)self _threadunsafe_syncAutoSelectedPigments:v5];
}

- (void)_threadunsafe_syncAutoSelectedPigments:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NTKPigmentPreferenceManager *)self privateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__NTKPigmentPreferenceManager__threadunsafe_syncAutoSelectedPigments___block_invoke;
  v7[3] = &unk_1E62C09C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __70__NTKPigmentPreferenceManager__threadunsafe_syncAutoSelectedPigments___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) npsDomainAccessor];
  id v3 = [*(id *)(a1 + 40) allObjects];
  id v4 = (void *)[v3 copy];
  [v2 setObject:v4 forKey:@"AutoSelectedPigmentList"];

  BOOL v5 = [*(id *)(a1 + 32) npsDomainAccessor];
  id v6 = (id)[v5 synchronize];

  uint64_t v7 = objc_opt_new();
  id v8 = [*(id *)(a1 + 32) npsDomainAccessor];
  uint64_t v9 = [v8 domain];
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = @"AutoSelectedPigmentList";
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v12 = [v10 setWithArray:v11];
  [v7 synchronizeNanoDomain:v9 keys:v12 cloudEnabled:1];

  id v13 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138543362;
    uint64_t v16 = v14;
    _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_INFO, "#pref-sync Synchronizing auto-selected pigments: %{public}@", (uint8_t *)&v15, 0xCu);
  }
}

- (void)_threadunsafe_syncVisibleOptionsByCollection:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NTKPigmentPreferenceManager *)self privateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__NTKPigmentPreferenceManager__threadunsafe_syncVisibleOptionsByCollection___block_invoke;
  v7[3] = &unk_1E62C09C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __76__NTKPigmentPreferenceManager__threadunsafe_syncVisibleOptionsByCollection___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) npsDomainAccessor];
  id v3 = [*(id *)(a1 + 40) allObjects];
  id v4 = (void *)[v3 copy];
  [v2 setObject:v4 forKey:@"SelectedPigmentList"];

  BOOL v5 = [*(id *)(a1 + 32) npsDomainAccessor];
  id v6 = (id)[v5 synchronize];

  uint64_t v7 = objc_opt_new();
  id v8 = [*(id *)(a1 + 32) npsDomainAccessor];
  uint64_t v9 = [v8 domain];
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  v18[0] = @"SelectedPigmentList";
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v12 = [v10 setWithArray:v11];
  [v7 synchronizeNanoDomain:v9 keys:v12 cloudEnabled:1];

  id v13 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "#pref-sync Pigment preferences changed. Synchronizing.", (uint8_t *)&v16, 2u);
  }

  uint64_t v14 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = *(void *)(a1 + 40);
    int v16 = 138543362;
    uint64_t v17 = v15;
    _os_log_impl(&dword_1BC5A9000, v14, OS_LOG_TYPE_INFO, "#pref-sync Visible options: %{public}@", (uint8_t *)&v16, 0xCu);
  }
}

- (void)_loadVisibleOptions
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  id v4 = (id)[(NPSDomainAccessor *)self->_npsDomainAccessor synchronize];
  id v8 = [(NPSDomainAccessor *)self->_npsDomainAccessor objectForKey:@"SelectedPigmentList"];
  pthread_rwlock_unlock(p_rwlock);
  BOOL v5 = v8;
  if (!v8 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), BOOL v5 = v8, (isKindOfClass & 1) == 0))
  {

    BOOL v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v9 = v5;
  uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  [(NTKPigmentPreferenceManager *)self setSelectedPigments:v7];
}

- (void)_loadAutoSelectedPigments
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  id v4 = (id)[(NPSDomainAccessor *)self->_npsDomainAccessor synchronize];
  id v8 = [(NPSDomainAccessor *)self->_npsDomainAccessor objectForKey:@"AutoSelectedPigmentList"];
  pthread_rwlock_unlock(p_rwlock);
  BOOL v5 = v8;
  if (!v8 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), BOOL v5 = v8, (isKindOfClass & 1) == 0))
  {

    BOOL v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v9 = v5;
  uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  [(NTKPigmentPreferenceManager *)self setAutoSelectedPigments:v7];
}

- (NTKPigmentPreferenceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKPigmentPreferenceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSUserDefaults)userDefault
{
  return self->_userDefault;
}

- (void)setUserDefault:(id)a3
{
}

- (NPSDomainAccessor)npsDomainAccessor
{
  return self->_npsDomainAccessor;
}

- (void)setNpsDomainAccessor:(id)a3
{
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_npsDomainAccessor, 0);
  objc_storeStrong((id *)&self->_userDefault, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedPigments, 0);
  objc_storeStrong((id *)&self->_autoSelectedPigments, 0);
}

- (void)setAutoSelectedPigments:(uint64_t)a1 forCollectionName:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "#pref-sync setAutoSelectedPigments triggered exception: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end