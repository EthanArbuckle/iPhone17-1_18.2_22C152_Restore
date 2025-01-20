@interface TabSnapshotCache
+ (BOOL)supportsASTC;
+ (id)defaultSnapshotCache;
+ (void)initialize;
+ (void)removeSavedSnapshotsKeepingSnapshotsWithIdentifiers:(id)a3;
- (BOOL)hasValidSnapshotWithIdentifier:(id)a3;
- (BOOL)isFinishedUpdating;
- (BOOL)isIdentifier:(id)a3 memberOfSameGroupAsIdentifier:(id)a4;
- (NSString)debugDescription;
- (TabSnapshotCache)init;
- (TabSnapshotCache)initWithThumbnailCacheDirectoryURL:(id)a3;
- (TabSnapshotCacheDelegate)delegate;
- (id)_URLForSnapshotWithIdentifier:(id)a3 isKTX:(BOOL)a4 effectsVersion:(int64_t)a5;
- (id)_allIdentifiersToCache;
- (id)_contextForDelegate:(id)a3;
- (id)_entryForIdentifier:(id)a3;
- (id)_entryForIdentifier:(id)a3 createIfNeeded:(BOOL)a4;
- (id)_existingURLForSnapshotWithIdentifier:(id)a3 effectsVersion:(int64_t *)a4;
- (id)_preferredURLForSnapshotWithIdentifier:(id)a3;
- (id)_readSnapshotImageForIdentifier:(id)a3;
- (id)_writeSnapshotImage:(CGImage *)a3 withIdentifier:(id)a4;
- (id)groupIdentifierForSnapshotWithIdentifier:(id)a3;
- (id)identifiersToCacheForDelegate:(id)a3;
- (id)snapshotWithIdentifier:(id)a3;
- (void)_beginUpdatingStateForIdentifier:(id)a3;
- (void)_calculateFitsInCache;
- (void)_determineInitialStateForIdentifier:(id)a3;
- (void)_enumerateIdentifiersForEntry:(id)a3 respondingToSelector:(SEL)a4 withBlock:(id)a5;
- (void)_enumeratePossibleURLsForSnapshotWithIdentifier:(id)a3 withBlock:(id)a4;
- (void)_finishUpdatingToState:(int64_t)a3 cachedSnapshot:(id)a4 forEntry:(id)a5;
- (void)_finishUpdatingToState:(int64_t)a3 forEntry:(id)a4;
- (void)_requestNextSnapshotIfNecessaryForDelegate:(id)a3;
- (void)_requestSavedSnapshotForIdentifier:(id)a3;
- (void)_saveSnapshotForIdentifier:(id)a3;
- (void)_sendDidFinishUpdatingToDelegateIfNeeded;
- (void)addIdentifier:(id)a3 toGroupWithIdentifier:(id)a4;
- (void)addSnapshotCacheObserver:(id)a3;
- (void)invalidateSnapshotWithIdentifier:(id)a3;
- (void)performBatchUpdatesWithBlock:(id)a3;
- (void)removeIdentifier:(id)a3 fromGroupWithIdentifier:(id)a4;
- (void)removeSnapshotCacheObserver:(id)a3;
- (void)removeSnapshotWithIdentifier:(id)a3;
- (void)requestNextSnapshotIfNecessary;
- (void)setCapacity:(unint64_t)a3 forDelegate:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIdentifiersToCache:(id)a3 forDelegate:(id)a4;
- (void)setUpdating:(BOOL)a3 forDelegate:(id)a4;
- (void)tabSnapshotCacheEntryDidUpdateState:(id)a3;
@end

@implementation TabSnapshotCache

- (id)_entryForIdentifier:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  groupIdentifiers = self->_groupIdentifiers;
  id v7 = a3;
  uint64_t v8 = [(NSMutableDictionary *)groupIdentifiers objectForKeyedSubscript:v7];
  v9 = (void *)v8;
  if (v8) {
    v10 = (void *)v8;
  }
  else {
    v10 = v7;
  }
  id v11 = v10;

  v12 = [(NSMutableDictionary *)self->_snapshots objectForKeyedSubscript:v11];
  if (v12) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = !v4;
  }
  if (!v13)
  {
    v12 = [[TabSnapshotCacheEntry alloc] initWithIdentifier:v11 isGroup:v9 != 0];
    [(TabSnapshotCacheEntry *)v12 setStateObserver:self];
    [(TabSnapshotCache *)self tabSnapshotCacheEntryDidUpdateState:v12];
    [(NSMutableDictionary *)self->_snapshots setObject:v12 forKeyedSubscript:v11];
  }

  return v12;
}

- (BOOL)isFinishedUpdating
{
  return [(NSMutableSet *)self->_identifiersPendingUpdate count] == 0;
}

void __78__TabSnapshotCache__enumeratePossibleURLsForSnapshotWithIdentifier_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    unint64_t v4 = 2;
    do
    {
      v5 = [*(id *)(a1 + 32) _URLForSnapshotWithIdentifier:*(void *)(a1 + 40) isKTX:a2 effectsVersion:v4];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        BOOL v6 = 0;
      }
      else {
        BOOL v6 = v4 > 1;
      }
      --v4;
    }
    while (v6);
  }
}

void __73__TabSnapshotCache__existingURLForSnapshotWithIdentifier_effectsVersion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  int v8 = [v11 checkResourceIsReachableAndReturnError:0];
  v9 = v11;
  if (v8)
  {
    v10 = *(void **)(a1 + 40);
    if (v10) {
      void *v10 = a3;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
    v9 = v11;
  }
}

- (id)_URLForSnapshotWithIdentifier:(id)a3 isKTX:(BOOL)a4 effectsVersion:(int64_t)a5
{
  BOOL v6 = a4;
  int v8 = [a3 UUIDString];
  v9 = v8;
  if (a5 >= 2)
  {
    uint64_t v10 = objc_msgSend(v8, "stringByAppendingFormat:", @"-v%ld", a5);

    v9 = (void *)v10;
  }
  id v11 = @"png";
  if (v6) {
    id v11 = @"ktx";
  }
  thumbnailCacheDirectoryURL = self->_thumbnailCacheDirectoryURL;
  BOOL v13 = v11;
  v14 = [(NSURL *)thumbnailCacheDirectoryURL URLByAppendingPathComponent:v9 isDirectory:0];
  v15 = [v14 URLByAppendingPathExtension:v13];

  return v15;
}

- (void)_finishUpdatingToState:(int64_t)a3 forEntry:(id)a4
{
}

- (void)_beginUpdatingStateForIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(TabSnapshotCache *)self _entryForIdentifier:a3];
  unint64_t v4 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    BOOL v6 = [v3 debugDescription];
    int v7 = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_INFO, "Begin updating entry: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [v3 setUpdatingState:1];
  [v3 setStateUpdateCancelled:0];
}

- (void)_finishUpdatingToState:(int64_t)a3 cachedSnapshot:(id)a4 forEntry:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    uint64_t v12 = [v9 debugDescription];
    BOOL v13 = (void *)v12;
    if ((unint64_t)a3 > 3) {
      v14 = @"Empty";
    }
    else {
      v14 = off_1E6D7F2D0[a3];
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    v19 = v14;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_1E102C000, v11, OS_LOG_TYPE_INFO, "Finish updating entry: %{public}@ (toState = %@; snapshot = %@)",
      buf,
      0x20u);
  }
  if ([v9 isUpdatingState])
  {
    [v9 setUpdatingState:0];
    if (([v9 stateUpdateCancelled] & 1) == 0)
    {
      [v9 setState:a3];
      if (v8)
      {
        [v9 setSnapshot:v8];
        if (!deviceSupportsASTC || [v9 state] == 3)
        {
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __67__TabSnapshotCache__finishUpdatingToState_cachedSnapshot_forEntry___block_invoke;
          v15[3] = &unk_1E6D7F288;
          v15[4] = self;
          [(TabSnapshotCache *)self _enumerateIdentifiersForEntry:v9 respondingToSelector:sel_tabSnapshotCache_didCacheSnapshotWithIdentifier_ withBlock:v15];
        }
      }
      [(TabSnapshotCache *)self _sendDidFinishUpdatingToDelegateIfNeeded];
    }
    [(TabSnapshotCache *)self requestNextSnapshotIfNecessary];
  }
}

- (void)tabSnapshotCacheEntryDidUpdateState:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isPendingUpdate];
  identifiersPendingUpdate = self->_identifiersPendingUpdate;
  id v7 = [v4 identifier];

  if (v5) {
    [(NSMutableSet *)identifiersPendingUpdate addObject:v7];
  }
  else {
    [(NSMutableSet *)identifiersPendingUpdate removeObject:v7];
  }
}

- (void)_sendDidFinishUpdatingToDelegateIfNeeded
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(TabSnapshotCache *)self isFinishedUpdating])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v3 = self->_delegateToContextMap;
    uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v20;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector()) {
            [v8 tabSnapshotCacheDidFinishUpdating:self];
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v5);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = [(NSHashTable *)self->_snapshotCacheObservers allObjects];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
          if (objc_opt_respondsToSelector()) {
            [v14 tabSnapshotCacheDidFinishUpdating:self];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v11);
    }
  }
}

- (void)_determineInitialStateForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TabSnapshotCache *)self _entryForIdentifier:v4];
  uint64_t v6 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[TabSnapshotCache _determineInitialStateForIdentifier:](v6, v5);
  }
  [(TabSnapshotCache *)self _beginUpdatingStateForIdentifier:v4];

  fileSystemAccessQueue = self->_fileSystemAccessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__TabSnapshotCache__determineInitialStateForIdentifier___block_invoke;
  v9[3] = &unk_1E6D77D90;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(fileSystemAccessQueue, v9);
}

- (id)snapshotWithIdentifier:(id)a3
{
  if (a3)
  {
    v3 = -[TabSnapshotCache _entryForIdentifier:](self, "_entryForIdentifier:");
    id v4 = [v3 snapshot];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_entryForIdentifier:(id)a3
{
  return [(TabSnapshotCache *)self _entryForIdentifier:a3 createIfNeeded:0];
}

- (void)_calculateFitsInCache
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obj = self->_delegateToContextMap;
  uint64_t v3 = [(NSMapTable *)obj countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v47;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v47 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = [(TabSnapshotCache *)self _contextForDelegate:*(void *)(*((void *)&v46 + 1) + 8 * v6)];
        id v8 = [v7 identifiersToCache];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v43;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v43 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = [(TabSnapshotCache *)self _entryForIdentifier:*(void *)(*((void *)&v42 + 1) + 8 * v12) createIfNeeded:1];
              [v13 setFitsInCache:0];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v52 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [(NSMapTable *)obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v4);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v28 = self->_delegateToContextMap;
  uint64_t v30 = [(NSMapTable *)v28 countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v39;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(v28);
        }
        obja = v14;
        long long v15 = [(TabSnapshotCache *)self _contextForDelegate:*(void *)(*((void *)&v38 + 1) + 8 * (void)v14)];
        long long v16 = [v15 identifiersToCache];
        v31 = v15;
        uint64_t v17 = [v15 capacity];
        long long v18 = [MEMORY[0x1E4F1CA80] set];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v19 = v16;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v50 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v35;
LABEL_22:
          uint64_t v23 = 0;
          while (1)
          {
            if (*(void *)v35 != v22) {
              objc_enumerationMutation(v19);
            }
            if (!v17) {
              goto LABEL_32;
            }
            v24 = [(TabSnapshotCache *)self _entryForIdentifier:*(void *)(*((void *)&v34 + 1) + 8 * v23) createIfNeeded:1];
            if (![v24 isGroup]) {
              goto LABEL_29;
            }
            uint64_t v25 = [v24 identifier];
            char v26 = [v18 containsObject:v25];

            if ((v26 & 1) == 0) {
              break;
            }
LABEL_30:

            if (v21 == ++v23)
            {
              uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v50 count:16];
              if (v21) {
                goto LABEL_22;
              }
              goto LABEL_32;
            }
          }
          v27 = [v24 identifier];
          [v18 addObject:v27];

LABEL_29:
          [v24 fitsInCache];
          [v24 setFitsInCache:1];
          --v17;
          goto LABEL_30;
        }
LABEL_32:

        v14 = obja + 1;
      }
      while (obja + 1 != (char *)v30);
      uint64_t v30 = [(NSMapTable *)v28 countByEnumeratingWithState:&v38 objects:v51 count:16];
    }
    while (v30);
  }
}

- (id)_contextForDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_delegateToContextMap objectForKey:v4];
  if (!v5)
  {
    uint64_t v5 = objc_alloc_init(TabSnapshotCacheContext);
    -[TabSnapshotCacheContext setCapacity:](v5, "setCapacity:", [v4 capacityForTabSnapshotCache:self]);
    [(NSMapTable *)self->_delegateToContextMap setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)setCapacity:(unint64_t)a3 forDelegate:(id)a4
{
  id v6 = [(TabSnapshotCache *)self _contextForDelegate:a4];
  if ([v6 capacity] != a3)
  {
    [v6 setCapacity:a3];
    [(TabSnapshotCache *)self requestNextSnapshotIfNecessary];
  }
}

- (void)_requestNextSnapshotIfNecessaryForDelegate:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v4 = -[TabSnapshotCache _contextForDelegate:](self, "_contextForDelegate:");
  uint64_t v5 = [v4 identifiersToCache];
  v27 = v4;
  int v29 = [v4 updating];
  id v6 = [MEMORY[0x1E4F1CA80] set];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v36;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * v11);
        uint64_t v13 = [(TabSnapshotCache *)self _entryForIdentifier:v12 createIfNeeded:1];
        if ([v13 isGroup])
        {
          v14 = [v13 identifier];
          char v15 = [v6 containsObject:v14];

          if (v15) {
            goto LABEL_10;
          }
          long long v16 = [v13 identifier];
          [v6 addObject:v16];
        }
        int v17 = [v13 fitsInCache];
        if (([v13 isUpdatingState] & 1) == 0)
        {
          switch([v13 state])
          {
            case 0:
              [(TabSnapshotCache *)self _determineInitialStateForIdentifier:v12];
              break;
            case 1:
              if (v29)
              {
                unint64_t currentlyRequestedSnapshotCount = self->_currentlyRequestedSnapshotCount;
                int v19 = currentlyRequestedSnapshotCount < 8 ? v17 : 0;
                if (v19 == 1)
                {
                  self->_unint64_t currentlyRequestedSnapshotCount = currentlyRequestedSnapshotCount + 1;
                  [(TabSnapshotCache *)self _beginUpdatingStateForIdentifier:v12];
                  uint64_t v20 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v21 = v20;
                    uint64_t v22 = [v13 debugDescription];
                    *(_DWORD *)buf = 138543362;
                    long long v40 = v22;
                    _os_log_impl(&dword_1E102C000, v21, OS_LOG_TYPE_INFO, "Request snapshot for entry: %{public}@", buf, 0xCu);
                  }
                  v31[0] = MEMORY[0x1E4F143A8];
                  v31[1] = 3221225472;
                  v31[2] = __63__TabSnapshotCache__requestNextSnapshotIfNecessaryForDelegate___block_invoke;
                  v31[3] = &unk_1E6D7F2B0;
                  v31[4] = self;
                  id v32 = v13;
                  id v33 = v7;
                  uint64_t v34 = v12;
                  [v28 tabSnapshotCache:self requestSnapshotWithIdentifier:v12 completion:v31];
                }
              }
              break;
            case 2:
              if (v29) {
                [(TabSnapshotCache *)self _saveSnapshotForIdentifier:v12];
              }
              break;
            case 3:
              if ((v17 & 1) == 0)
              {
                uint64_t v23 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  v24 = v23;
                  uint64_t v25 = [v13 debugDescription];
                  *(_DWORD *)buf = 138543362;
                  long long v40 = v25;
                  _os_log_impl(&dword_1E102C000, v24, OS_LOG_TYPE_INFO, "Reached capacity; will evict snapshot for entry: %{public}@",
                    buf,
                    0xCu);
                }
                [v13 setSnapshot:0];
                [v13 setState:4];
                v30[0] = MEMORY[0x1E4F143A8];
                v30[1] = 3221225472;
                v30[2] = __63__TabSnapshotCache__requestNextSnapshotIfNecessaryForDelegate___block_invoke_158;
                v30[3] = &unk_1E6D7F288;
                v30[4] = self;
                [(TabSnapshotCache *)self _enumerateIdentifiersForEntry:v13 respondingToSelector:sel_tabSnapshotCache_didEvictSnapshotWithIdentifier_ withBlock:v30];
              }
              break;
            case 4:
              if (v17) {
                [(TabSnapshotCache *)self _requestSavedSnapshotForIdentifier:v12];
              }
              break;
            default:
              break;
          }
        }
LABEL_10:

        ++v11;
      }
      while (v9 != v11);
      uint64_t v26 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
      uint64_t v9 = v26;
    }
    while (v26);
  }
}

- (void)setUpdating:(BOOL)a3 forDelegate:(id)a4
{
  BOOL v4 = a3;
  id v6 = [(TabSnapshotCache *)self _contextForDelegate:a4];
  if ([v6 updating] != v4)
  {
    [v6 setUpdating:v4];
    if (v4) {
      [(TabSnapshotCache *)self requestNextSnapshotIfNecessary];
    }
  }
}

uint64_t __56__TabSnapshotCache__determineInitialStateForIdentifier___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v1 = 4;
  }
  else {
    uint64_t v1 = 1;
  }
  return [*(id *)(a1 + 32) _finishUpdatingToState:v1 forEntry:*(void *)(a1 + 40)];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (WeakRetained) {
      [(TabSnapshotCache *)self removeSnapshotCacheObserver:WeakRetained];
    }
    if (obj) {
      -[TabSnapshotCache addSnapshotCacheObserver:](self, "addSnapshotCacheObserver:");
    }
  }
}

- (void)addSnapshotCacheObserver:(id)a3
{
}

void __50__TabSnapshotCache_requestNextSnapshotIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = 0;
  [*(id *)(a1 + 32) _calculateFitsInCache];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "_requestNextSnapshotIfNecessaryForDelegate:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __56__TabSnapshotCache__determineInitialStateForIdentifier___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  CFURLRef v4 = [v2 _existingURLForSnapshotWithIdentifier:v3 effectsVersion:0];

  if (v4 && (CGImageSourceRef v5 = CGImageSourceCreateWithURL(v4, 0)) != 0)
  {
    CFRelease(v5);
    char v6 = 1;
  }
  else
  {
    char v6 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__TabSnapshotCache__determineInitialStateForIdentifier___block_invoke_2;
  block[3] = &unk_1E6D780C8;
  char v10 = v6;
  long long v7 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (id)_existingURLForSnapshotWithIdentifier:(id)a3 effectsVersion:(int64_t *)a4
{
  id v6 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__17;
  v14 = __Block_byref_object_dispose__17;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__TabSnapshotCache__existingURLForSnapshotWithIdentifier_effectsVersion___block_invoke;
  v9[3] = &unk_1E6D7F1F0;
  v9[4] = &v10;
  void v9[5] = a4;
  [(TabSnapshotCache *)self _enumeratePossibleURLsForSnapshotWithIdentifier:v6 withBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)_enumeratePossibleURLsForSnapshotWithIdentifier:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  uint64_t v11 = __78__TabSnapshotCache__enumeratePossibleURLsForSnapshotWithIdentifier_withBlock___block_invoke;
  uint64_t v12 = &unk_1E6D7F218;
  long long v16 = &v17;
  uint64_t v13 = self;
  id v8 = v6;
  id v14 = v8;
  id v9 = v7;
  id v15 = v9;
  if (deviceSupportsASTC) {
    v11((uint64_t)v10, 1);
  }
  if (!*((unsigned char *)v18 + 24)) {
    v11((uint64_t)v10, 0);
  }

  _Block_object_dispose(&v17, 8);
}

+ (void)initialize
{
  deviceSupportsASTC = MGGetBoolAnswer();
}

- (void)setIdentifiersToCache:(id)a3 forDelegate:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TabSnapshotCache *)self identifiersToCacheForDelegate:v7];
  if (([v8 isEqualToOrderedSet:v6] & 1) == 0)
  {
    long long v47 = v8;
    id v9 = (void *)[v8 mutableCopy];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v10 = self->_delegateToContextMap;
    uint64_t v11 = [(NSMapTable *)v10 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v59 != v13) {
            objc_enumerationMutation(v10);
          }
          if (*(id *)(*((void *)&v58 + 1) + 8 * i) == v7)
          {
            id v15 = v6;
          }
          else
          {
            -[TabSnapshotCache identifiersToCacheForDelegate:](self, "identifiersToCacheForDelegate:");
            id v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          long long v16 = v15;
          uint64_t v17 = [v15 set];
          [v9 minusSet:v17];
        }
        uint64_t v12 = [(NSMapTable *)v10 countByEnumeratingWithState:&v58 objects:v66 count:16];
      }
      while (v12);
    }
    long long v46 = v6;

    long long v45 = v7;
    long long v49 = [v7 snapshotsToPersistOnDiskForTabSnapshotCache:self];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v9;
    uint64_t v18 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v55 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v54 + 1) + 8 * j);
          uint64_t v23 = [(NSMutableDictionary *)self->_snapshots objectForKey:v22];
          [v23 setUpdatingState:0];
          [(NSMutableDictionary *)self->_snapshots removeObjectForKey:v22];
          [(NSMutableSet *)self->_identifiersPendingUpdate removeObject:v22];
          v24 = [(NSMutableDictionary *)self->_groupIdentifiers objectForKeyedSubscript:v22];
          if (v24)
          {
            uint64_t v25 = [(TabSnapshotCache *)self _entryForIdentifier:v22];
            uint64_t v26 = [v25 groupMembers];
            [v26 removeObject:v22];

            v27 = [(TabSnapshotCache *)self _entryForIdentifier:v24];
            id v28 = [v27 groupMembers];
            uint64_t v29 = [v28 count];

            if (!v29) {
              [(NSMutableSet *)self->_identifiersPendingUpdate removeObject:v24];
            }
            [(NSMutableDictionary *)self->_groupIdentifiers removeObjectForKey:v22];
          }
          if (([v49 containsObject:v22] & 1) == 0)
          {
            uint64_t v30 = [(TabSnapshotCache *)self _preferredURLForSnapshotWithIdentifier:v22];
            v31 = [v30 path];

            id v32 = [MEMORY[0x1E4F28CB8] defaultManager];
            int v33 = objc_msgSend(v32, "_web_removeFileOnlyAtPath:", v31);

            if (v33)
            {
              uint64_t v34 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v64 = v31;
                _os_log_impl(&dword_1E102C000, v34, OS_LOG_TYPE_DEFAULT, "Identifiers to cache changed; removed snapshot at path %{public}@",
                  buf,
                  0xCu);
              }
            }
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
      }
      while (v19);
    }

    id v6 = v46;
    long long v35 = (void *)[v46 mutableCopy];
    [v35 minusOrderedSet:v47];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v36 = v35;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v50 objects:v62 count:16];
    id v7 = v45;
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v51;
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v51 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void *)(*((void *)&v50 + 1) + 8 * k);
          uint64_t v42 = [(TabSnapshotCache *)self _entryForIdentifier:v41 createIfNeeded:0];

          if (!v42) {
            [(NSMutableSet *)self->_identifiersPendingUpdate addObject:v41];
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v50 objects:v62 count:16];
      }
      while (v38);
    }

    long long v43 = (void *)[v46 copy];
    long long v44 = [(TabSnapshotCache *)self _contextForDelegate:v45];
    [v44 setIdentifiersToCache:v43];

    if (([v45 tabSnapshotCacheShouldDeferNextSnapshotRequest:self] & 1) == 0) {
      [(TabSnapshotCache *)self requestNextSnapshotIfNecessary];
    }

    id v8 = v47;
  }
}

- (void)requestNextSnapshotIfNecessary
{
  if (!self->_needsRequestNextSnapshot)
  {
    self->_needsRequestNextSnapshot = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__TabSnapshotCache_requestNextSnapshotIfNecessary__block_invoke;
    block[3] = &unk_1E6D77E20;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (id)groupIdentifierForSnapshotWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_groupIdentifiers objectForKeyedSubscript:a3];
}

- (void)addIdentifier:(id)a3 toGroupWithIdentifier:(id)a4
{
  identifiersPendingUpdate = self->_identifiersPendingUpdate;
  id v7 = a4;
  id v8 = a3;
  [(NSMutableSet *)identifiersPendingUpdate removeObject:v8];
  [(NSMutableDictionary *)self->_groupIdentifiers setObject:v7 forKeyedSubscript:v8];

  id v9 = [(TabSnapshotCache *)self _entryForIdentifier:v8 createIfNeeded:1];
  uint64_t v10 = [v9 groupMembers];
  [v10 addObject:v8];

  [(TabSnapshotCache *)self requestNextSnapshotIfNecessary];
}

- (void)performBatchUpdatesWithBlock:(id)a3
{
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  [(TabSnapshotCache *)self requestNextSnapshotIfNecessary];
}

- (id)identifiersToCacheForDelegate:(id)a3
{
  uint64_t v3 = [(TabSnapshotCache *)self _contextForDelegate:a3];
  CFURLRef v4 = [v3 identifiersToCache];

  return v4;
}

+ (id)defaultSnapshotCache
{
  id v2 = (void *)defaultSnapshotCache_defaultTabSnapshotCacheInstance;
  if (!defaultSnapshotCache_defaultTabSnapshotCacheInstance)
  {
    id v3 = objc_alloc_init((Class)a1);
    CFURLRef v4 = (void *)defaultSnapshotCache_defaultTabSnapshotCacheInstance;
    defaultSnapshotCache_defaultTabSnapshotCacheInstance = (uint64_t)v3;

    id v2 = (void *)defaultSnapshotCache_defaultTabSnapshotCacheInstance;
  }
  id v5 = v2;
  return v5;
}

- (TabSnapshotCache)init
{
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  CFURLRef v4 = SafariThumbnailCacheDirectoryPath();
  id v5 = [v3 fileURLWithPath:v4 isDirectory:1];
  id v6 = [(TabSnapshotCache *)self initWithThumbnailCacheDirectoryURL:v5];

  return v6;
}

- (TabSnapshotCache)initWithThumbnailCacheDirectoryURL:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TabSnapshotCache;
  id v6 = [(TabSnapshotCache *)&v27 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_thumbnailCacheDirectoryURL, a3);
    id v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mobilesafari.TabSnapshotCache.FileSystem", v8);
    fileSystemAccessQueue = v7->_fileSystemAccessQueue;
    v7->_fileSystemAccessQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    snapshots = v7->_snapshots;
    v7->_snapshots = v11;

    uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    groupIdentifiers = v7->_groupIdentifiers;
    v7->_groupIdentifiers = v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    delegateToContextMap = v7->_delegateToContextMap;
    v7->_delegateToContextMap = (NSMapTable *)v15;

    uint64_t v17 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    snapshotCacheObservers = v7->_snapshotCacheObservers;
    v7->_snapshotCacheObservers = (NSHashTable *)v17;

    uint64_t v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    identifiersPendingUpdate = v7->_identifiersPendingUpdate;
    v7->_identifiersPendingUpdate = v19;

    uint64_t v21 = v7->_fileSystemAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__TabSnapshotCache_initWithThumbnailCacheDirectoryURL___block_invoke;
    block[3] = &unk_1E6D77E20;
    uint64_t v22 = v7;
    uint64_t v26 = v22;
    dispatch_async(v21, block);
    uint64_t v23 = v22;
  }
  return v7;
}

+ (void)removeSavedSnapshotsKeepingSnapshotsWithIdentifiers:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = SafariThumbnailCacheDirectoryPath();
  [MEMORY[0x1E4F28CB8] defaultManager];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v18 = v24 = 0u;
  uint64_t v19 = (void *)v4;
  id obj = [v18 contentsOfDirectoryAtPath:v4 error:0];
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v22;
    *(void *)&long long v6 = 138543362;
    long long v17 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "stringByDeletingPathExtension", v17);
        uint64_t v12 = [v11 rangeOfString:@"-v"];
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v13 = [v11 substringToIndex:v12];

          uint64_t v11 = (void *)v13;
        }
        id v14 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v11];
        if (([v3 containsObject:v14] & 1) == 0)
        {
          uint64_t v15 = [v19 stringByAppendingPathComponent:v10];
          if (objc_msgSend(v18, "_web_removeFileOnlyAtPath:", v15))
          {
            long long v16 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              uint64_t v26 = v15;
              _os_log_impl(&dword_1E102C000, v16, OS_LOG_TYPE_DEFAULT, "Cleaning cache directory; removed snapshot at path %{public}@",
                buf,
                0xCu);
            }
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v7);
  }
}

void __55__TabSnapshotCache_initWithThumbnailCacheDirectoryURL___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = *MEMORY[0x1E4F1C630];
  id v7 = 0;
  char v4 = [v2 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v3 error:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    long long v6 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __55__TabSnapshotCache_initWithThumbnailCacheDirectoryURL___block_invoke_cold_1(v1, v6, v5);
    }
  }
}

+ (BOOL)supportsASTC
{
  return deviceSupportsASTC;
}

- (id)_preferredURLForSnapshotWithIdentifier:(id)a3
{
  return [(TabSnapshotCache *)self _URLForSnapshotWithIdentifier:a3 isKTX:deviceSupportsASTC effectsVersion:2];
}

- (id)_allIdentifiersToCache
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v4 = self->_delegateToContextMap;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        dispatch_queue_t v9 = -[TabSnapshotCache identifiersToCacheForDelegate:](self, "identifiersToCacheForDelegate:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        [v3 unionOrderedSet:v9];
      }
      uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)hasValidSnapshotWithIdentifier:(id)a3
{
  uint64_t v3 = [(TabSnapshotCache *)self _entryForIdentifier:a3];
  char v4 = [v3 snapshot];

  if (v4) {
    LOBYTE(v4) = ([v3 state] & 0xFFFFFFFFFFFFFFFELL) == 2;
  }

  return (char)v4;
}

- (void)removeSnapshotCacheObserver:(id)a3
{
}

- (void)removeSnapshotWithIdentifier:(id)a3
{
  id v4 = a3;
  [(NSMutableDictionary *)self->_snapshots setObject:0 forKeyedSubscript:v4];
  [(NSMutableDictionary *)self->_groupIdentifiers setObject:0 forKeyedSubscript:v4];
  fileSystemAccessQueue = self->_fileSystemAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__TabSnapshotCache_removeSnapshotWithIdentifier___block_invoke;
  v7[3] = &unk_1E6D77D90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(fileSystemAccessQueue, v7);
}

uint64_t __49__TabSnapshotCache_removeSnapshotWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumeratePossibleURLsForSnapshotWithIdentifier:*(void *)(a1 + 40) withBlock:&__block_literal_global_76];
}

void __49__TabSnapshotCache_removeSnapshotWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [v2 path];
  int v5 = objc_msgSend(v3, "_web_removeFileOnlyAtPath:", v4);

  if (v5)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138543362;
      id v8 = v2;
      _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_INFO, "Removed snapshot at path %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)invalidateSnapshotWithIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [(TabSnapshotCache *)self _entryForIdentifier:a3];
  int v5 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    int v7 = [v4 debugDescription];
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_INFO, "Invalidate entry: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  [v4 setState:1];
  [v4 setStateUpdateCancelled:1];
  [(TabSnapshotCache *)self requestNextSnapshotIfNecessary];
}

- (void)_requestSavedSnapshotForIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(TabSnapshotCache *)self _entryForIdentifier:v4];
  id v6 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[TabSnapshotCache _requestSavedSnapshotForIdentifier:](v6, v5);
  }
  [(TabSnapshotCache *)self _beginUpdatingStateForIdentifier:v4];

  fileSystemAccessQueue = self->_fileSystemAccessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__TabSnapshotCache__requestSavedSnapshotForIdentifier___block_invoke;
  v9[3] = &unk_1E6D77D90;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(fileSystemAccessQueue, v9);
}

void __55__TabSnapshotCache__requestSavedSnapshotForIdentifier___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  id v4 = [v2 _readSnapshotImageForIdentifier:v3];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__TabSnapshotCache__requestSavedSnapshotForIdentifier___block_invoke_2;
  block[3] = &unk_1E6D78980;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v4;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __55__TabSnapshotCache__requestSavedSnapshotForIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v2 == 4)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    return [v3 _finishUpdatingToState:3 cachedSnapshot:v4 forEntry:v5];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return [v3 _finishUpdatingToState:4 forEntry:v7];
  }
}

- (id)_readSnapshotImageForIdentifier:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v18 = 0;
  CFURLRef v5 = [(TabSnapshotCache *)self _existingURLForSnapshotWithIdentifier:v4 effectsVersion:&v18];
  CFURLRef v6 = v5;
  if (v5)
  {
    CGImageSourceRef v7 = CGImageSourceCreateWithURL(v5, 0);
    if (v7)
    {
      id v8 = v7;
      uint64_t v19 = *MEMORY[0x1E4F2FF18];
      v20[0] = MEMORY[0x1E4F1CC38];
      CFDictionaryRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, v9);
      CFRelease(v8);
      id v11 = objc_alloc(MEMORY[0x1E4FB1818]);
      long long v12 = objc_msgSend(v11, "sf_initWithCGImage:tabSnapshotEffectsVersion:", ImageAtIndex, v18);
      CGImageRelease(ImageAtIndex);
      if (deviceSupportsASTC)
      {
        id v13 = v12;
      }
      else
      {
        -[UIImage safari_decodedImageIfPossible](v12);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v16 = v13;

      goto LABEL_12;
    }
    uint64_t v15 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[TabSnapshotCache _readSnapshotImageForIdentifier:]();
    }
  }
  else
  {
    long long v14 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[TabSnapshotCache _readSnapshotImageForIdentifier:]();
    }
  }
  uint64_t v16 = 0;
LABEL_12:

  return v16;
}

- (void)_saveSnapshotForIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFURLRef v5 = [(TabSnapshotCache *)self _entryForIdentifier:v4];
  CFURLRef v6 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    CGImageSourceRef v7 = v6;
    id v8 = [v5 debugDescription];
    *(_DWORD *)buf = 138543362;
    id v13 = v8;
    _os_log_impl(&dword_1E102C000, v7, OS_LOG_TYPE_INFO, "Save snapshot for entry: %{public}@", buf, 0xCu);
  }
  if (v5)
  {
    [(TabSnapshotCache *)self _beginUpdatingStateForIdentifier:v4];
    fileSystemAccessQueue = self->_fileSystemAccessQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __47__TabSnapshotCache__saveSnapshotForIdentifier___block_invoke;
    v10[3] = &unk_1E6D77D90;
    v10[4] = self;
    id v11 = v5;
    dispatch_async(fileSystemAccessQueue, v10);
  }
}

void __47__TabSnapshotCache__saveSnapshotForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) snapshot];
  uint64_t v4 = [v3 CGImage];
  CFURLRef v5 = [*(id *)(a1 + 40) identifier];
  CFURLRef v6 = [v2 _writeSnapshotImage:v4 withIdentifier:v5];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__TabSnapshotCache__saveSnapshotForIdentifier___block_invoke_2;
  block[3] = &unk_1E6D78980;
  CGImageSourceRef v7 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v10 = v7;
  id v11 = v6;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __47__TabSnapshotCache__saveSnapshotForIdentifier___block_invoke_2(uint64_t a1)
{
  if (deviceSupportsASTC)
  {
    if (*(void *)(a1 + 48))
    {
      uint64_t v2 = *(void **)(a1 + 32);
      return objc_msgSend(v2, "_finishUpdatingToState:cachedSnapshot:forEntry:", 3);
    }
    [*(id *)(a1 + 40) setSnapshot:0];
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = 4;
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = 3;
  }
  return [v4 _finishUpdatingToState:v6 forEntry:v5];
}

- (id)_writeSnapshotImage:(CGImage *)a3 withIdentifier:(id)a4
{
  v29[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  CFURLRef v7 = [(TabSnapshotCache *)self _preferredURLForSnapshotWithIdentifier:v6];
  if (deviceSupportsASTC)
  {
    uint64_t v8 = *MEMORY[0x1E4F2F4E0];
    v28[0] = *MEMORY[0x1E4F2F6C8];
    v28[1] = v8;
    v29[0] = *MEMORY[0x1E4F2F4F0];
    v29[1] = &unk_1F3C73C20;
    v28[2] = *MEMORY[0x1E4F2F508];
    v29[2] = MEMORY[0x1E4F1CC38];
    CFDictionaryRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
    CFStringRef v10 = @"org.khronos.ktx";
  }
  else
  {
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F22678];
    uint64_t v26 = *MEMORY[0x1E4F2FCD8];
    uint64_t v24 = *MEMORY[0x1E4F2FCB8];
    uint64_t v25 = &unk_1F3C73C38;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    objc_super v27 = v11;
    CFDictionaryRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  }
  long long v12 = CGImageDestinationCreateWithURL(v7, v10, 1uLL, 0);
  if (v12)
  {
    id v13 = v12;
    CGImageDestinationAddImage(v12, a3, v9);
    BOOL v14 = CGImageDestinationFinalize(v13);
    CFRelease(v13);
    if (v14)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      long long v21 = __55__TabSnapshotCache__writeSnapshotImage_withIdentifier___block_invoke;
      long long v22 = &unk_1E6D7F260;
      CFURLRef v23 = v7;
      [(TabSnapshotCache *)self _enumeratePossibleURLsForSnapshotWithIdentifier:v6 withBlock:&v19];
      if (deviceSupportsASTC)
      {
        uint64_t v15 = -[TabSnapshotCache _readSnapshotImageForIdentifier:](self, "_readSnapshotImageForIdentifier:", v6, v19, v20, v21, v22);
      }
      else
      {
        uint64_t v15 = 0;
      }

      goto LABEL_15;
    }
    long long v17 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[TabSnapshotCache _writeSnapshotImage:withIdentifier:]();
    }
  }
  else
  {
    uint64_t v16 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[TabSnapshotCache _writeSnapshotImage:withIdentifier:]();
    }
  }
  uint64_t v15 = 0;
LABEL_15:

  return v15;
}

void __55__TabSnapshotCache__writeSnapshotImage_withIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = [v3 path];
    int v6 = objc_msgSend(v4, "_web_removeFileOnlyAtPath:", v5);

    if (v6)
    {
      CFURLRef v7 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138543362;
        id v9 = v3;
        _os_log_impl(&dword_1E102C000, v7, OS_LOG_TYPE_DEFAULT, "Removed legacy snapshot at path %{public}@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

uint64_t __67__TabSnapshotCache__finishUpdatingToState_cachedSnapshot_forEntry___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 tabSnapshotCache:*(void *)(a1 + 32) didCacheSnapshotWithIdentifier:a3];
}

- (void)_enumerateIdentifiersForEntry:(id)a3 respondingToSelector:(SEL)a4 withBlock:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CFURLRef v7 = (void (**)(id, uint64_t, uint64_t))a5;
  if ([v6 isGroup])
  {
    int v8 = [v6 groupMembers];
    uint64_t v9 = [v8 copy];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    int v8 = [v6 identifier];
    uint64_t v9 = [v10 setWithObject:v8];
  }
  uint64_t v39 = (void *)v9;
  int v33 = v6;

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = self->_delegateToContextMap;
  uint64_t v11 = [(NSMapTable *)obj countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v53;
    uint64_t v34 = *(void *)v53;
    do
    {
      uint64_t v14 = 0;
      uint64_t v36 = v12;
      do
      {
        if (*(void *)v53 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v52 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v16 = [(TabSnapshotCache *)self identifiersToCacheForDelegate:v15];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v17 = v39;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v58 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v49;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v49 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v48 + 1) + 8 * i);
                if ([v16 containsObject:v22]) {
                  v7[2](v7, v15, v22);
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v48 objects:v58 count:16];
            }
            while (v19);
          }

          uint64_t v13 = v34;
          uint64_t v12 = v36;
        }
        ++v14;
      }
      while (v14 != v12);
      uint64_t v12 = [(NSMapTable *)obj countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v12);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obja = self->_snapshotCacheObservers;
  uint64_t v23 = [(NSHashTable *)obja countByEnumeratingWithState:&v44 objects:v57 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v45 != v25) {
          objc_enumerationMutation(obja);
        }
        uint64_t v27 = *(void *)(*((void *)&v44 + 1) + 8 * j);
        if (objc_opt_respondsToSelector())
        {
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v28 = v39;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v40 objects:v56 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v41;
            do
            {
              for (uint64_t k = 0; k != v30; ++k)
              {
                if (*(void *)v41 != v31) {
                  objc_enumerationMutation(v28);
                }
                v7[2](v7, v27, *(void *)(*((void *)&v40 + 1) + 8 * k));
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v40 objects:v56 count:16];
            }
            while (v30);
          }
        }
      }
      uint64_t v24 = [(NSHashTable *)obja countByEnumeratingWithState:&v44 objects:v57 count:16];
    }
    while (v24);
  }
}

- (NSString)debugDescription
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] string];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [(TabSnapshotCache *)self _allIdentifiersToCache];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(TabSnapshotCache *)self _entryForIdentifier:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        if ([v9 state])
        {
          uint64_t v10 = [v9 state];
          uint64_t v11 = @"*";
          if (v10 != 1)
          {
            uint64_t v12 = objc_msgSend(v9, "state", @"*");
            uint64_t v11 = @"e";
            if (v12 != 4)
            {
              uint64_t v13 = objc_msgSend(v9, "state", @"e");
              uint64_t v11 = @"█";
              if (v13 != 3)
              {
                if (objc_msgSend(v9, "state", @"█") == 2) {
                  uint64_t v11 = @"S";
                }
                else {
                  uint64_t v11 = @"X";
                }
              }
            }
          }
        }
        else
        {
          uint64_t v11 = @".";
        }
        [v3 appendString:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  uint64_t v14 = NSString;
  uint64_t v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v15);
  objc_msgSend(v14, "stringWithFormat:", @"<%@: %p; delegateToContextMap = %@, snapshotCacheStates = %@;>",
    v16,
    self,
    self->_delegateToContextMap,
  id v17 = v3);

  return (NSString *)v17;
}

void __63__TabSnapshotCache__requestNextSnapshotIfNecessaryForDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  --*(void *)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = v4;
    uint64_t v7 = [v5 debugDescription];
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_INFO, "Did request snapshot for entry: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  if (v3 && [*(id *)(a1 + 48) containsObject:*(void *)(a1 + 56)]) {
    [*(id *)(a1 + 32) _finishUpdatingToState:2 cachedSnapshot:v3 forEntry:*(void *)(a1 + 40)];
  }
  else {
    [*(id *)(a1 + 32) _finishUpdatingToState:4 forEntry:*(void *)(a1 + 40)];
  }
}

uint64_t __63__TabSnapshotCache__requestNextSnapshotIfNecessaryForDelegate___block_invoke_158(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 tabSnapshotCache:*(void *)(a1 + 32) didEvictSnapshotWithIdentifier:a3];
}

- (void)removeIdentifier:(id)a3 fromGroupWithIdentifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(NSMutableDictionary *)self->_groupIdentifiers objectForKeyedSubscript:v6];
  int v9 = [v8 isEqual:v7];

  if (v9)
  {
    uint64_t v10 = [(TabSnapshotCache *)self _entryForIdentifier:v6];
    uint64_t v11 = [v10 groupMembers];
    [v11 removeObject:v6];

    uint64_t v12 = [(TabSnapshotCache *)self _entryForIdentifier:v7];
    uint64_t v13 = [v12 groupMembers];
    uint64_t v14 = [v13 count];

    if (!v14) {
      [(NSMutableSet *)self->_identifiersPendingUpdate removeObject:v7];
    }
    [(NSMutableDictionary *)self->_groupIdentifiers removeObjectForKey:v6];
    [(TabSnapshotCache *)self requestNextSnapshotIfNecessary];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v15 = [(NSMapTable *)self->_delegateToContextMap objectEnumerator];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = [*(id *)(*((void *)&v22 + 1) + 8 * i) identifiersToCache];
          char v21 = [v20 containsObject:v6];

          if (v21)
          {

            uint64_t v15 = [(TabSnapshotCache *)self _entryForIdentifier:v6];
            if (v15) {
              [(TabSnapshotCache *)self tabSnapshotCacheEntryDidUpdateState:v15];
            }
            else {
              [(NSMutableSet *)self->_identifiersPendingUpdate addObject:v6];
            }
            goto LABEL_16;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
}

- (BOOL)isIdentifier:(id)a3 memberOfSameGroupAsIdentifier:(id)a4
{
  groupIdentifiers = self->_groupIdentifiers;
  id v7 = a4;
  int v8 = [(NSMutableDictionary *)groupIdentifiers objectForKeyedSubscript:a3];
  int v9 = [(NSMutableDictionary *)self->_groupIdentifiers objectForKeyedSubscript:v7];

  LOBYTE(groupIdentifiers) = [v8 isEqual:v9];
  return (char)groupIdentifiers;
}

- (TabSnapshotCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TabSnapshotCacheDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fileSystemAccessQueue, 0);
  objc_storeStrong((id *)&self->_identifiersPendingUpdate, 0);
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);
  objc_storeStrong((id *)&self->_thumbnailCacheDirectoryURL, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_snapshotCacheObservers, 0);
  objc_storeStrong((id *)&self->_delegateToContextMap, 0);
}

void __55__TabSnapshotCache_initWithThumbnailCacheDirectoryURL___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(*(void *)a1 + 48);
  uint64_t v5 = a2;
  id v6 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  int v7 = 138412546;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1E102C000, v5, OS_LOG_TYPE_ERROR, "Failed to exclude tab snapshots directory from backup %@. Error: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)_determineInitialStateForIdentifier:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 debugDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3(&dword_1E102C000, v5, v6, "Determine initial state for entry: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_requestSavedSnapshotForIdentifier:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 debugDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3(&dword_1E102C000, v5, v6, "Request saved snapshot for entry: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_readSnapshotImageForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1E102C000, v0, v1, "Image does not exist for identifier: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_readSnapshotImageForIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1E102C000, v0, v1, "Failed to create image source with URL: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_writeSnapshotImage:withIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1E102C000, v0, v1, "Failed to create image destination with URL: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_writeSnapshotImage:withIdentifier:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1E102C000, v1, OS_LOG_TYPE_ERROR, "Failed to finalize image destination with URL: %{public}@, image properties: %{public}@", v2, 0x16u);
}

@end