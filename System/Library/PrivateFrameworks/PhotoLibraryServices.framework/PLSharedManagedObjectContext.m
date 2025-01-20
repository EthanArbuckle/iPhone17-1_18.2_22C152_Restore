@interface PLSharedManagedObjectContext
- (BOOL)_hasChangesForCloudShared:(id)a3;
- (BOOL)isUserInterfaceContext;
- (BOOL)shouldMergeFromRemoteContextWithChanges:(id)a3;
- (void)_mergeChangesFromDidSaveDictionary:(id)a3 usingObjectIDs:(BOOL)a4;
- (void)_pl_setupStalenessInterval;
- (void)setupLocalChangeNotifications;
- (void)tearDownLocalChangeNotifications;
@end

@implementation PLSharedManagedObjectContext

- (void).cxx_destruct
{
}

- (void)_mergeChangesFromDidSaveDictionary:(id)a3 usingObjectIDs:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x19F38D3B0]();
  if ([(PLSharedManagedObjectContext *)self isUserInterfaceContext])
  {
    v8 = +[PLManagedAsset entityName];
    v9 = PLSafeEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)self, 0);

    if (v9)
    {
      BOOL v26 = v4;
      v27 = self;
      v28 = v7;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      obuint64_t j = +[PLManagedObjectContext changeNotificationObjectIDMutationKeys];
      uint64_t v31 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      uint64_t v10 = 0;
      if (v31)
      {
        uint64_t v30 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v39 != v30) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * i);
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            id v13 = v6;
            v14 = [v6 objectForKey:v12];
            uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v35;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v35 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  v19 = [*(id *)(*((void *)&v34 + 1) + 8 * j) entity];
                  unsigned int v20 = [v19 isKindOfEntity:v9];

                  v10 += v20;
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
              }
              while (v16);
            }

            id v6 = v13;
          }
          uint64_t v31 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v31);
      }

      BOOL v21 = [(PLManagedObjectContext *)v27 _tooManyAssetChangesToHandle:v10];
      v22 = +[PLChangeNotificationCenter defaultCenter];
      v23 = v22;
      if (v21)
      {
        [v22 managedObjectContextWillBeOverloaded:v27 withNotificationData:v6 usingObjectIDs:v26];

        v33.receiver = v27;
        v33.super_class = (Class)PLSharedManagedObjectContext;
        [(PLManagedObjectContext *)&v33 _mergeChangesFromDidSaveDictionary:v6 usingObjectIDs:v26];
        v24 = +[PLChangeNotificationCenter defaultCenter];
        [v24 managedObjectContextWasOverloaded:v27 withNotificationData:v6 usingObjectIDs:v26];
      }
      else
      {
        objc_msgSend(v22, "managedObjectContext:willProcessRemoteContextSave:usingObjectIDs:isCoalescedEvent:", v27, v6, v26, -[PLChangeHandlingContainer isMergingCoalescedSaveNotification](v27->super._changeHandlingContainer, "isMergingCoalescedSaveNotification"));

        v32.receiver = v27;
        v32.super_class = (Class)PLSharedManagedObjectContext;
        [(PLManagedObjectContext *)&v32 _mergeChangesFromDidSaveDictionary:v6 usingObjectIDs:v26];
        v24 = +[PLChangeNotificationCenter defaultCenter];
        [v24 managedObjectContext:v27 didProcessRemoteContextSave:v6 usingObjectIDs:v26];
      }

      v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v25 postNotificationName:@"PLManagedObjectContextFinishedRemoteMergeNotification" object:v27];

      v7 = v28;
    }
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)PLSharedManagedObjectContext;
    [(PLManagedObjectContext *)&v32 _mergeChangesFromDidSaveDictionary:v6 usingObjectIDs:v4];
  }
}

- (void)tearDownLocalChangeNotifications
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  BOOL v4 = v3;
  id changeNotificationObserver = self->_changeNotificationObserver;
  if (changeNotificationObserver)
  {
    [v3 removeObserver:changeNotificationObserver name:*MEMORY[0x1E4F1BE30] object:self];
    id v6 = self->_changeNotificationObserver;
    self->_id changeNotificationObserver = 0;

    v7.receiver = self;
    v7.super_class = (Class)PLSharedManagedObjectContext;
    [(PLManagedObjectContext *)&v7 tearDownLocalChangeNotifications];
  }
}

- (void)setupLocalChangeNotifications
{
  v6.receiver = self;
  v6.super_class = (Class)PLSharedManagedObjectContext;
  [(PLManagedObjectContext *)&v6 setupLocalChangeNotifications];
  if ([(PLSharedManagedObjectContext *)self isUserInterfaceContext])
  {
    if (!self->_changeNotificationObserver)
    {
      v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
      BOOL v4 = [v3 addObserverForName:*MEMORY[0x1E4F1BE30] object:self queue:0 usingBlock:&__block_literal_global_528];
      id changeNotificationObserver = self->_changeNotificationObserver;
      self->_id changeNotificationObserver = v4;
    }
  }
}

void __61__PLSharedManagedObjectContext_setupLocalChangeNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[PLChangeNotificationCenter defaultCenter];
  [v3 processContextDidChangeNotification:v2];
}

- (BOOL)shouldMergeFromRemoteContextWithChanges:(id)a3
{
  id v4 = a3;
  if ([(PLSharedManagedObjectContext *)self isUserInterfaceContext]) {
    BOOL v5 = [(PLSharedManagedObjectContext *)self _hasChangesForCloudShared:v4];
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)isUserInterfaceContext
{
  return PLIsAssetsd() ^ 1;
}

- (BOOL)_hasChangesForCloudShared:(id)a3
{
  id v3 = a3;
  pl_dispatch_once();
  id v4 = (id)_hasChangesForCloudShared__pl_once_object_44;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__PLSharedManagedObjectContext__hasChangesForCloudShared___block_invoke_2;
  v14[3] = &unk_1E5865C80;
  id v15 = v4;
  id v5 = v4;
  objc_super v6 = (uint64_t (**)(void, void))MEMORY[0x19F38D650](v14);
  objc_super v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1BDF0]];
  char v8 = ((uint64_t (**)(void, void *))v6)[2](v6, v7);

  if ((v8 & 1) != 0
    || ([v3 objectForKeyedSubscript:*MEMORY[0x1E4F1BFA0]],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = ((uint64_t (**)(void, void *))v6)[2](v6, v9),
        v9,
        (v10 & 1) != 0))
  {
    char v11 = 1;
  }
  else
  {
    uint64_t v12 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1BDB8]];
    char v11 = ((uint64_t (**)(void, void *))v6)[2](v6, v12);
  }
  return v11;
}

uint64_t __58__PLSharedManagedObjectContext__hasChangesForCloudShared___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(a1 + 32);
        v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v7), "entity", (void)v13);
        char v10 = [v9 name];
        LOBYTE(v8) = [v8 containsObject:v10];

        if (v8)
        {
          uint64_t v11 = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

void __58__PLSharedManagedObjectContext__hasChangesForCloudShared___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v8 = +[PLCloudSharedAlbum entityName];
  v1 = +[PLCloudFeedEntry entityName];
  id v2 = +[PLCloudFeedAssetsEntry entityName];
  id v3 = +[PLCloudFeedCommentsEntry entityName];
  uint64_t v4 = +[PLCloudSharedComment entityName];
  uint64_t v5 = +[PLCloudSharedAlbumInvitationRecord entityName];
  uint64_t v6 = objc_msgSend(v0, "initWithObjects:", v8, v1, v2, v3, v4, v5, 0);
  uint64_t v7 = (void *)_hasChangesForCloudShared__pl_once_object_44;
  _hasChangesForCloudShared__pl_once_object_44 = v6;
}

- (void)_pl_setupStalenessInterval
{
}

@end