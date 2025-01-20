@interface InProgressAssetQuery
+ (void)currentInProgressAssetIDs:(id *)a3 restoringAssetIDs:(id *)a4;
- (BOOL)_fetchResults;
- (InProgressAssetQuery)init;
- (id)_inProgressAssetIDs;
- (id)_restoringAssetIDs;
- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4;
- (void)dealloc;
@end

@implementation InProgressAssetQuery

+ (void)currentInProgressAssetIDs:(id *)a3 restoringAssetIDs:(id *)a4
{
  *a3 = 0;
  *a4 = 0;
  v7 = objc_alloc_init(InProgressAssetQuery);
  id v6 = +[LSApplicationWorkspace defaultWorkspace];
  [v6 addObserver:v7];
  if ([(InProgressAssetQuery *)v7 _fetchResults])
  {
    *a3 = [(InProgressAssetQuery *)v7 _inProgressAssetIDs];
    *a4 = [(InProgressAssetQuery *)v7 _restoringAssetIDs];
  }
  [v6 removeObserver:v7];
}

- (InProgressAssetQuery)init
{
  v4.receiver = self;
  v4.super_class = (Class)InProgressAssetQuery;
  v2 = [(InProgressAssetQuery *)&v4 init];
  if (v2) {
    v2->_waitForInitialObservationData = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_waitForInitialObservationData);
  v3.receiver = self;
  v3.super_class = (Class)InProgressAssetQuery;
  [(InProgressAssetQuery *)&v3 dealloc];
}

- (id)_inProgressAssetIDs
{
  v2 = self->_inProgressAssetIDs;

  return v2;
}

- (id)_restoringAssetIDs
{
  v2 = self->_restoringAssetIDs;

  return v2;
}

- (BOOL)_fetchResults
{
  objc_super v3 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Waiting for -applicationInstallsArePrioritized:arePaused: to complete...", buf, 2u);
  }
  intptr_t v4 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_waitForInitialObservationData, 0xFFFFFFFFFFFFFFFFLL);
  v5 = _ATLogCategorySyncBundle();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = 0;
      v7 = "Query for in progress assets timed out";
      v8 = (uint8_t *)&v13;
      v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl(&dword_0, v9, v10, v7, v8, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = 0;
    v7 = "Wait completed";
    v8 = (uint8_t *)&v12;
    v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_8;
  }
  return v4 == 0;
}

- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4
{
  v7 = _ATLogCategorySyncBundle_Oversize();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v42 = a3;
    __int16 v43 = 2114;
    id v44 = a4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "prioritized proxies %{public}@ paused proxies %{public}@", buf, 0x16u);
  }
  if (!self->_inProgressAssetIDs)
  {
    self->_inProgressAssetIDs = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    self->_restoringAssetIDs = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    if ([a3 count])
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v8 = [a3 countByEnumeratingWithState:&v37 objects:v49 count:16];
      if (!v8) {
        goto LABEL_54;
      }
      id v9 = v8;
      uint64_t v10 = *(void *)v38;
      v35 = self;
      while (1)
      {
        v11 = 0;
        id v36 = v9;
        do
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(a3);
          }
          __int16 v12 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v11);
          id v13 = [v12 applicationIdentifier];
          if (![v12 isPlaceholder])
          {
            v23 = _ATLogCategorySyncBundle();
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            *(_DWORD *)buf = 138543362;
            id v42 = v13;
            v24 = v23;
            v25 = "No placeholder for asset identifier %{public}@";
LABEL_20:
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
            goto LABEL_49;
          }
          id v14 = [v12 installProgressSync];
          if (!v14)
          {
            v26 = _ATLogCategorySyncBundle();
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            *(_DWORD *)buf = 138543362;
            id v42 = v13;
            v24 = v26;
            v25 = "No install progress found for asset identifier %{public}@";
            goto LABEL_20;
          }
          v15 = v14;
          uint64_t v16 = v10;
          id v17 = a3;
          unint64_t v18 = (unint64_t)[v12 installType];
          v19 = (char *)[v15 installState];
          v20 = (char *)[v15 installPhase];
          v21 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            if (v18 < 0xA && ((0x2FFu >> v18) & 1) != 0) {
              v22 = (NSString *)*(&off_18678 + v18);
            }
            else {
              v22 = +[NSString stringWithFormat:@"Unknown Install Type: %lu", v18];
            }
            if ((unint64_t)v19 >= 6) {
              v27 = +[NSString stringWithFormat:@"Unknown Install State: %lu", v19];
            }
            else {
              v27 = (NSString *)*(&off_186C8 + (void)v19);
            }
            if ((unint64_t)v20 >= 4) {
              v28 = +[NSString stringWithFormat:@"Unknown Install Phase: %lu", v20];
            }
            else {
              v28 = (NSString *)*(&off_186F8 + (void)v20);
            }
            *(_DWORD *)buf = 138544130;
            id v42 = v22;
            __int16 v43 = 2114;
            id v44 = v27;
            __int16 v45 = 2114;
            v46 = v28;
            __int16 v47 = 2114;
            id v48 = v13;
            _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Got install type=%{public}@ state=%{public}@ phase=%{public}@ for %{public}@", buf, 0x2Au);
            self = v35;
          }
          BOOL v30 = v19 != (unsigned char *)&dword_0 + 1 || v20 != (unsigned char *)&dword_0 + 1 || v18 == 2;
          if (!v30
            || (v19 == (unsigned char *)&dword_0 + 1 ? (BOOL v31 = v20 == 0) : (BOOL v31 = 0), v31 ? (v32 = v18 == 1) : (v32 = 0), v32))
          {
            [(NSMutableArray *)self->_inProgressAssetIDs addObject:v13];
            a3 = v17;
            uint64_t v10 = v16;
            id v9 = v36;
          }
          else
          {
            a3 = v17;
            uint64_t v10 = v16;
            id v9 = v36;
            if (v18 == 2 && v19 == (unsigned char *)&dword_0 + 1 && (unint64_t)v20 <= 1) {
              [(NSMutableArray *)self->_restoringAssetIDs addObject:v13];
            }
          }
LABEL_49:
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [a3 countByEnumeratingWithState:&v37 objects:v49 count:16];
        if (!v9) {
          goto LABEL_54;
        }
      }
    }
    v33 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "No assets currently in progress.", buf, 2u);
    }
LABEL_54:
    v34 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "signaling semaphore", buf, 2u);
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_waitForInitialObservationData);
  }
}

@end