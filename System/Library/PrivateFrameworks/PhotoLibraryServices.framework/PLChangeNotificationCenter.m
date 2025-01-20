@interface PLChangeNotificationCenter
+ (id)allManagedObjectKeysStrategyWithContext:(id)a3;
+ (id)defaultCenter;
+ (void)assertIsCompatibleWithObjectModel:(id)a3;
+ (void)forceFetchingAlbumReload;
+ (void)getInsertedAssetCount:(unint64_t *)a3 deletedAssetCount:(unint64_t *)a4 updatedAssets:(id)a5 fromContextDidChangeNotification:(id)a6;
- (BOOL)_isInterestedInUpdatesOfObject:(id)a3;
- (BOOL)_shouldForceFetchingAlbumsToReload;
- (NSNotificationCenter)backingCenter;
- (PLChangeNotificationCenter)init;
- (id)_attributesOfInterestForObject:(id)a3;
- (id)_keysOfInterestForObject:(id)a3;
- (id)_orderedRelationshipsOfInterestForObject:(id)a3;
- (id)_snapshotForObject:(id)a3;
- (id)_takeSnapshotFromCommittedValuesOfObject:(id)a3;
- (id)_takeSnapshotOfObject:(id)a3;
- (id)_takeSnapshotOfObject:(id)a3 useCommitedValues:(BOOL)a4;
- (id)_toOneRelationshipsOfInterestForObject:(id)a3;
- (id)addObserverForName:(id)a3 object:(id)a4 queue:(id)a5 usingBlock:(id)a6;
- (id)descriptionOfSplitChanges;
- (void)_cleanupState;
- (void)_enqueueAlbumListNotifications;
- (void)_enqueueAlbumNotifications;
- (void)_enqueueAssetChangeNotification;
- (void)_enqueueCloudCommentsNotifications;
- (void)_enqueueCloudFeedEntriesChangeNotifications;
- (void)_enqueueMomentChangeNotifications;
- (void)_enqueueNotification:(id)a3 object:(id)a4 userInfo:(id)a5;
- (void)_enqueueNotification:(id)a3 object:(id)a4 userInfoWithObjects:(const void *)a5 forKeys:(const void *)a6 count:(unint64_t)a7;
- (void)_enqueuePhotoLibraryNotifications;
- (void)_evaluateContainersWithUpdatedContent;
- (void)_evaluateUpdatedAssets;
- (void)_postEnqueuedNotifications;
- (void)_registerForCameraPreviewWellChanges;
- (void)_sendNotificationsForSplitChanges;
- (void)_splitContextDidChangeNotification:(id)a3;
- (void)_takeSnapshotsFromContext:(id)a3 forRemoteContextSaveNotification:(id)a4 usingObjectIDs:(BOOL)a5;
- (void)_unregisterForCameraPreviewWellChanges;
- (void)addAssetChangeObserver:(id)a3;
- (void)addAssetContainerChangeObserver:(id)a3 container:(id)a4;
- (void)addAssetContainerListChangeObserver:(id)a3 containerList:(id)a4;
- (void)addCameraPreviewWellImageChangeObserver:(id)a3;
- (void)addCloudCommentsChangeObserver:(id)a3 asset:(id)a4;
- (void)addCloudFeedEntriesObserver:(id)a3;
- (void)addInvitationRecordsObserver:(id)a3;
- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6;
- (void)addShouldReloadObserver:(id)a3;
- (void)dealloc;
- (void)enqueueNotification:(id)a3;
- (void)enumerateIndexMappingCachesForObject:(id)a3 withBlock:(id)a4;
- (void)managedObjectContext:(id)a3 didProcessRemoteContextSave:(id)a4 usingObjectIDs:(BOOL)a5;
- (void)managedObjectContext:(id)a3 willProcessRemoteContextSave:(id)a4 usingObjectIDs:(BOOL)a5 isCoalescedEvent:(BOOL)a6;
- (void)managedObjectContextWasOverloaded:(id)a3 withNotificationData:(id)a4 usingObjectIDs:(BOOL)a5;
- (void)managedObjectContextWillBeOverloaded:(id)a3 withNotificationData:(id)a4 usingObjectIDs:(BOOL)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)postShouldReloadNotificationWithPhotoLibrary:(id)a3;
- (void)processContextDidChangeNotification:(id)a3;
- (void)removeAssetChangeObserver:(id)a3;
- (void)removeAssetContainerChangeObserver:(id)a3 container:(id)a4;
- (void)removeAssetContainerListChangeObserver:(id)a3 containerList:(id)a4;
- (void)removeCameraPreviewWellImageChangeObserver:(id)a3;
- (void)removeCloudCommentsChangeObserver:(id)a3 asset:(id)a4;
- (void)removeCloudFeedEntriesObserver:(id)a3;
- (void)removeInvitationRecordsObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 name:(id)a4 object:(id)a5;
- (void)removeShouldReloadObserver:(id)a3;
@end

@implementation PLChangeNotificationCenter

- (void)addShouldReloadObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PLChangeNotificationCenter *)self backingCenter];
  [v5 addObserver:v4 selector:sel_shouldReload_ name:@"PLPhotoLibraryShouldReload" object:0];
}

- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(PLChangeNotificationCenter *)self backingCenter];
  [v13 addObserver:v12 selector:a4 name:v11 object:v10];
}

- (NSNotificationCenter)backingCenter
{
  return (NSNotificationCenter *)[MEMORY[0x1E4F28EB8] defaultCenter];
}

- (void)addCloudFeedEntriesObserver:(id)a3
{
}

- (void)addCloudCommentsChangeObserver:(id)a3 asset:(id)a4
{
}

- (void)addAssetChangeObserver:(id)a3
{
}

+ (id)defaultCenter
{
  pl_dispatch_once();
  v2 = (void *)defaultCenter_myCenter;
  return v2;
}

void __43__PLChangeNotificationCenter_defaultCenter__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultCenter_myCenter;
  defaultCenter_myCenter = (uint64_t)v1;
}

- (PLChangeNotificationCenter)init
{
  v26.receiver = self;
  v26.super_class = (Class)PLChangeNotificationCenter;
  v2 = [(PLChangeNotificationCenter *)&v26 init];
  if (v2)
  {
    v3 = objc_alloc_init(PLChangeList);
    changedAlbumLists = v2->_changedAlbumLists;
    v2->_changedAlbumLists = v3;

    id v5 = objc_alloc_init(PLContentChanges);
    albumListsContent = v2->_albumListsContent;
    v2->_albumListsContent = v5;

    v7 = objc_alloc_init(PLChangeList);
    changedAlbums = v2->_changedAlbums;
    v2->_changedAlbums = v7;

    v9 = objc_alloc_init(PLContentChanges);
    albumsContent = v2->_albumsContent;
    v2->_albumsContent = v9;

    id v11 = objc_alloc_init(PLChangeList);
    changedAssets = v2->_changedAssets;
    v2->_changedAssets = v11;

    id v13 = objc_alloc_init(PLContentChanges);
    momentsContent = v2->_momentsContent;
    v2->_momentsContent = v13;

    v15 = objc_alloc_init(PLChangeList);
    changedMoments = v2->_changedMoments;
    v2->_changedMoments = v15;

    v17 = objc_alloc_init(PLChangeList);
    changedCloudFeedEntries = v2->_changedCloudFeedEntries;
    v2->_changedCloudFeedEntries = v17;

    if (PLIsAssetsd())
    {
      v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_BACKGROUND, 0);

      dispatch_queue_t v21 = dispatch_queue_create("Camera preview well change handling queue", v20);
      notificationHandlingQueue = v2->_notificationHandlingQueue;
      v2->_notificationHandlingQueue = (OS_dispatch_queue *)v21;
    }
    else
    {
      v23 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v24 = MEMORY[0x1E4F14428];
      v20 = v2->_notificationHandlingQueue;
      v2->_notificationHandlingQueue = v23;
    }
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overloadedObjects, 0);
  objc_storeStrong((id *)&self->_remoteNotificationData, 0);
  objc_storeStrong((id *)&self->_enqueuedNotifications, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_changedCloudFeedEntries, 0);
  objc_storeStrong((id *)&self->_changedMoments, 0);
  objc_storeStrong((id *)&self->_momentsContent, 0);
  objc_storeStrong((id *)&self->_assetsWithCloudCommentChanges, 0);
  objc_storeStrong((id *)&self->_changedAssets, 0);
  objc_storeStrong((id *)&self->_albumsContent, 0);
  objc_storeStrong((id *)&self->_changedAlbums, 0);
  objc_storeStrong((id *)&self->_albumListsContent, 0);
  objc_storeStrong((id *)&self->_changedAlbumLists, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_notificationHandlingQueue, 0);
  objc_storeStrong((id *)&self->_cameraPreviewChangedToken, 0);
}

- (void)removeCameraPreviewWellImageChangeObserver:(id)a3
{
  id v4 = a3;
  [(PLChangeNotificationCenter *)self _unregisterForCameraPreviewWellChanges];
  [(PLChangeNotificationCenter *)self removeObserver:v4 name:@"PLCameraPreviewImageWellChanged" object:0];
}

- (void)addCameraPreviewWellImageChangeObserver:(id)a3
{
  [(PLChangeNotificationCenter *)self addObserver:a3 selector:sel_cameraPreviewWellImageDidChange_ name:@"PLCameraPreviewImageWellChanged" object:0];
  [(PLChangeNotificationCenter *)self _registerForCameraPreviewWellChanges];
}

- (void)_unregisterForCameraPreviewWellChanges
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_cameraPreviewChangeListenerCount == 1)
  {
    notify_cancel([(NSNumber *)v2->_cameraPreviewChangedToken intValue]);
    cameraPreviewChangedToken = v2->_cameraPreviewChangedToken;
    v2->_cameraPreviewChangedToken = 0;
  }
  if ([(NSNumber *)v2->_cameraPreviewChangedToken integerValue] < 1)
  {
    id v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "too many attempts to unregister from camera preview well changes, ignoring", v5, 2u);
    }
  }
  else
  {
    --v2->_cameraPreviewChangeListenerCount;
  }
  objc_sync_exit(v2);
}

- (void)_registerForCameraPreviewWellChanges
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  ++v2->_cameraPreviewChangeListenerCount;
  if (!v2->_cameraPreviewChangedToken)
  {
    uint64_t v6 = MEMORY[0x1E4F143A8];
    int v3 = pl_notify_register_dispatch();
    if (v3)
    {
      p_super = PLBackendGetLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v8 = v3;
        _os_log_impl(&dword_19B3C7000, p_super, OS_LOG_TYPE_ERROR, "failed to register for camera preview image well changed notification: %u", buf, 8u);
      }
    }
    else
    {
      uint64_t v5 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", 0, v6, 3221225472, __66__PLChangeNotificationCenter__registerForCameraPreviewWellChanges__block_invoke, &unk_1E5869078, v2);
      p_super = &v2->_cameraPreviewChangedToken->super.super;
      v2->_cameraPreviewChangedToken = (NSNumber *)v5;
    }
  }
  objc_sync_exit(v2);
}

void __66__PLChangeNotificationCenter__registerForCameraPreviewWellChanges__block_invoke(uint64_t a1)
{
  id v3 = +[PLCameraPreviewImageWellChangeNotification notification];
  v2 = [*(id *)(a1 + 32) backingCenter];
  [v2 postNotification:v3];
}

- (void)managedObjectContext:(id)a3 didProcessRemoteContextSave:(id)a4 usingObjectIDs:(BOOL)a5
{
  [a3 processPendingChanges];
  [(PLChangeNotificationCenter *)self _sendNotificationsForSplitChanges];
  self->_isProcessingRemoteDidSave = 0;
  remoteNotificationData = self->_remoteNotificationData;
  self->_remoteNotificationData = 0;
}

- (void)managedObjectContext:(id)a3 willProcessRemoteContextSave:(id)a4 usingObjectIDs:(BOOL)a5 isCoalescedEvent:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  self->_isProcessingRemoteDidSave = 1;
  id v10 = a4;
  id v15 = a3;
  id v11 = (NSDictionary *)[v10 mutableCopy];
  id v12 = [NSNumber numberWithBool:v7];
  [(NSDictionary *)v11 setObject:v12 forKey:@"usingObjectIDs"];

  id v13 = [NSNumber numberWithBool:v6];
  [(NSDictionary *)v11 setObject:v13 forKey:@"coalescedEvent"];

  remoteNotificationData = self->_remoteNotificationData;
  self->_remoteNotificationData = v11;

  [(PLChangeNotificationCenter *)self _takeSnapshotsFromContext:v15 forRemoteContextSaveNotification:v10 usingObjectIDs:v7];
}

- (void)managedObjectContextWasOverloaded:(id)a3 withNotificationData:(id)a4 usingObjectIDs:(BOOL)a5
{
  id v8 = a3;
  if (!self->_moc) {
    objc_storeStrong((id *)&self->_moc, a3);
  }
  [(PLChangeNotificationCenter *)self _sendNotificationsForSplitChanges];
  overloadedObjects = self->_overloadedObjects;
  self->_overloadedObjects = 0;

  self->_isOverloaded = 0;
  self->_isProcessingRemoteDidSave = 0;
}

- (void)managedObjectContextWillBeOverloaded:(id)a3 withNotificationData:(id)a4 usingObjectIDs:(BOOL)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v30 = a4;
  self->_isOverloaded = 1;
  self->_isProcessingRemoteDidSave = 1;
  uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  overloadedObjects = self->_overloadedObjects;
  self->_overloadedObjects = v9;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = +[PLManagedObjectContext changeNotificationObjectKeys];
  uint64_t v31 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v31)
  {
    uint64_t v29 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        id v13 = (void *)MEMORY[0x19F38D3B0]();
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        v14 = [v30 objectForKey:v12];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v37;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v37 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v36 + 1) + 8 * j);
              if (a5)
              {
                id v20 = [v8 objectRegisteredForID:v19];
              }
              else
              {
                id v20 = v19;
              }
              dispatch_queue_t v21 = v20;
              if (v20) {
                [(NSMutableSet *)self->_overloadedObjects addObject:v20];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
          }
          while (v16);
        }
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v31);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v22 = [v8 registeredObjects];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v32 + 1) + 8 * k);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v8, "refreshObject:mergeChanges:", v27, objc_msgSend(v27, "hasChanges"));
          [(NSMutableSet *)self->_overloadedObjects addObject:v27];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v24);
  }
}

- (BOOL)_shouldForceFetchingAlbumsToReload
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  pl_dispatch_once();
  uint32_t state = notify_get_state(forceFetchingAlbumReloadToken_token, &state64);
  if (state)
  {
    uint32_t v3 = state;
    id v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v9 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "notify_get_state() failed for fetching album reload. (%u)", buf, 8u);
    }

    LOBYTE(v5) = 0;
  }
  else
  {
    BOOL v5 = _shouldForceFetchingAlbumsToReload_oldState != state64;
    _shouldForceFetchingAlbumsToReload_oldState = state64;
  }
  return v5;
}

- (id)_takeSnapshotOfObject:(id)a3 useCommitedValues:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = v6;
  if (v6 && ([v6 isFault] & 1) == 0)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint32_t v9 = self->_snapshots;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v14, "managedObject", (void)v20);

          if (v15 == v7)
          {
            id v8 = v14;

            goto LABEL_17;
          }
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v8 = +[PLObjectSnapshot snapshotForManagedObject:v7 changeNotificationCenter:self useCommitedValues:v4];
    if (v8)
    {
      snapshots = self->_snapshots;
      if (!snapshots)
      {
        uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v18 = self->_snapshots;
        self->_snapshots = v17;

        snapshots = self->_snapshots;
      }
      -[NSMutableArray addObject:](snapshots, "addObject:", v8, (void)v20);
    }
  }
  else
  {
    id v8 = 0;
  }
LABEL_17:

  return v8;
}

- (id)_takeSnapshotFromCommittedValuesOfObject:(id)a3
{
  return [(PLChangeNotificationCenter *)self _takeSnapshotOfObject:a3 useCommitedValues:1];
}

- (id)_takeSnapshotOfObject:(id)a3
{
  return [(PLChangeNotificationCenter *)self _takeSnapshotOfObject:a3 useCommitedValues:0];
}

- (void)_takeSnapshotsFromContext:(id)a3 forRemoteContextSaveNotification:(id)a4 usingObjectIDs:(BOOL)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v23 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = +[PLManagedObjectContext changeNotificationObjectIDKeys];
  uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v24)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v12 = [v23 objectForKey:v10];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v26;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * v16);
              if (a5)
              {
                id v18 = [v8 objectRegisteredForID:v17];
              }
              else
              {
                id v18 = v17;
              }
              v19 = v18;
              id v20 = [(PLChangeNotificationCenter *)self _takeSnapshotOfObject:v18];

              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v14);
        }

        ++v9;
      }
      while (v9 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v24);
  }
}

- (id)_snapshotForObject:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = self->_snapshots;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "managedObject", (void)v12);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)descriptionOfSplitChanges
{
  uint32_t v3 = [MEMORY[0x1E4F28E78] string];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__PLChangeNotificationCenter_descriptionOfSplitChanges__block_invoke;
  v13[3] = &unk_1E5867D90;
  id v4 = v3;
  id v14 = v4;
  BOOL v5 = (void (**)(void, void, void))MEMORY[0x19F38D650](v13);
  ((void (**)(void, __CFString *, PLChangeList *))v5)[2](v5, @"album list(s)", self->_changedAlbumLists);
  ((void (**)(void, __CFString *, PLChangeList *))v5)[2](v5, @"album(s)", self->_changedAlbums);
  ((void (**)(void, __CFString *, PLChangeList *))v5)[2](v5, @"asset(s)", self->_changedAssets);
  id v6 = [(PLContentChanges *)self->_albumsContent container];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__PLChangeNotificationCenter_descriptionOfSplitChanges__block_invoke_3;
  v11[3] = &unk_1E5867DB8;
  v11[4] = self;
  id v7 = v4;
  id v12 = v7;
  [v6 enumerateObjectsUsingBlock:v11];

  id v8 = v12;
  id v9 = v7;

  return v9;
}

void __55__PLChangeNotificationCenter_descriptionOfSplitChanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __55__PLChangeNotificationCenter_descriptionOfSplitChanges__block_invoke_2;
  long long v15 = &unk_1E5867D68;
  id v16 = *(id *)(a1 + 32);
  id v17 = v5;
  id v6 = v5;
  id v7 = a3;
  id v8 = (void (**)(void, void, void))MEMORY[0x19F38D650](&v12);
  id v9 = objc_msgSend(v7, "inserted", v12, v13, v14, v15);
  ((void (**)(void, __CFString *, void *))v8)[2](v8, @"inserted", v9);

  id v10 = [v7 updated];
  ((void (**)(void, __CFString *, void *))v8)[2](v8, @"updated", v10);

  uint64_t v11 = [v7 deleted];

  ((void (**)(void, __CFString *, void *))v8)[2](v8, @"deleted", v11);
}

void __55__PLChangeNotificationCenter_descriptionOfSplitChanges__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 64) updatedContent];
  id v7 = [v6 objectAtIndex:a3];

  if ([v7 count])
  {
    id v20 = v5;
    id v8 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v21 + 1) + 8 * v13) objectID];
          long long v15 = [v14 URIRepresentation];
          id v16 = [v15 description];
          [v8 addObject:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    id v17 = *(void **)(a1 + 40);
    id v5 = v20;
    id v18 = [v20 objectID];
    v19 = [v8 componentsJoinedByString:@", "];
    [v17 appendFormat:@"album %@ has updated assets: { %@ }\n", v18, v19];
  }
}

void __55__PLChangeNotificationCenter_descriptionOfSplitChanges__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v19 = a1;
    id v7 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v20 + 1) + 8 * v12) objectID];
          id v14 = [v13 URIRepresentation];
          long long v15 = [v14 description];
          [v7 addObject:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    id v16 = *(void **)(v19 + 32);
    uint64_t v17 = *(void *)(v19 + 40);
    id v18 = [v7 componentsJoinedByString:@", "];
    [v16 appendFormat:@"%@ %@: { %@ }\n", v5, v17, v18];
  }
}

- (id)_keysOfInterestForObject:(id)a3
{
  int v3 = entityKindOfObject(a3);
  return _keysOfInterestForEntityKind(v3);
}

- (BOOL)_isInterestedInUpdatesOfObject:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 changedValuesForCurrentEvent];
  id v7 = [v6 allKeys];

  int v8 = indexOfObjectEntity(v5);
  uint64_t v9 = (PLInterest *)_isInterestedInUpdatesOfObject__myInterests[v8];
  if (!v9)
  {
    uint64_t v9 = objc_alloc_init(PLInterest);
    id v10 = _isInterestedInUpdatesOfObject__myInterests[v8];
    _isInterestedInUpdatesOfObject__myInterests[v8] = v9;
  }
  uint64_t v11 = [(PLInterest *)v9 allKeysMappingStrategy];

  if (!v11)
  {
    context = (void *)MEMORY[0x19F38D3B0]();
    uint64_t v12 = [(PLChangeNotificationCenter *)self _keysOfInterestForObject:v5];
    uint64_t v13 = [v12 allObjects];

    if ((unint64_t)[v13 count] >= 0x40)
    {
      long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2 object:self file:@"PLChangeNotificationCenter.m" lineNumber:1218 description:@"Not enough bits in bit mask."];
    }
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C100]) initForKeys:v13];
    [(PLInterest *)v9 setAllKeysMappingStrategy:v14];
    [(PLInterest *)v9 setIndexesOfInterest:0];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [v14 indexForKey:*(void *)(*((void *)&v34 + 1) + 8 * i)];
          if (v20 != 0x7FFFFFFFFFFFFFFFLL) {
            [(PLInterest *)v9 setIndexesOfInterest:[(PLInterest *)v9 indexesOfInterest] | (1 << v20)];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v17);
    }
  }
  long long v21 = [(PLInterest *)v9 allKeysMappingStrategy];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v22 = v7;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v31;
    while (2)
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = [v21 indexForKey:*(void *)(*((void *)&v30 + 1) + 8 * j)];
        if (v26 != 0x7FFFFFFFFFFFFFFFLL && (([(PLInterest *)v9 indexesOfInterest] >> v26) & 1) != 0)
        {
          LOBYTE(v23) = 1;
          goto LABEL_27;
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }
LABEL_27:

  return v23;
}

- (void)_postEnqueuedNotifications
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  for (uint64_t i = self->_enqueuedNotifications; [(NSMutableArray *)i count]; uint64_t i = self->_enqueuedNotifications)
  {
    id v4 = (void *)MEMORY[0x19F38D3B0]();
    id v5 = (void *)[(NSMutableArray *)self->_enqueuedNotifications copy];
    enqueuedNotifications = self->_enqueuedNotifications;
    self->_enqueuedNotifications = 0;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
          uint64_t v13 = (void *)MEMORY[0x19F38D3B0]();
          id v14 = [(PLChangeNotificationCenter *)self backingCenter];
          [v14 postNotification:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  id v15 = [(PLChangeNotificationCenter *)self backingCenter];
  [v15 postNotificationName:@"PLChangeNotificationCenterDidFinishPostingNotifications" object:self];
}

- (void)_enqueueNotification:(id)a3 object:(id)a4 userInfoWithObjects:(const void *)a5 forKeys:(const void *)a6 count:(unint64_t)a7
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (a7)
  {
    v19[0] = v19;
    unint64_t v14 = 8 * a7;
    id v15 = (char *)v19 - ((8 * a7 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v15, 8 * a7);
    bzero(v15, 8 * a7);
    uint64_t v16 = 0;
    do
    {
      if (*a5 && *a6)
      {
        objc_storeStrong((id *)&v15[8 * v16], (id)*a5);
        objc_storeStrong((id *)&v15[8 * v16++], (id)*a6);
      }
      ++a6;
      ++a5;
      --a7;
    }
    while (a7);
    if (v16)
    {
      a7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v15 count:v16];
    }
    else
    {
      a7 = 0;
    }
    unint64_t v17 = v14;
    do
    {

      v17 -= 8;
    }
    while (v17);
    long long v18 = v15 - 8;
    do
    {

      v14 -= 8;
    }
    while (v14);
  }
  [(PLChangeNotificationCenter *)self _enqueueNotification:v12 object:v13 userInfo:a7];
}

- (void)_enqueueNotification:(id)a3 object:(id)a4 userInfo:(id)a5
{
  id v6 = [MEMORY[0x1E4F28EA0] notificationWithName:a3 object:a4 userInfo:a5];
  [(PLChangeNotificationCenter *)self enqueueNotification:v6];
}

- (void)_evaluateUpdatedAssets
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v3 = [(PLChangeList *)self->_changedAssets updated];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"cloudComments", @"likeComments", @"cloudHasUnseenComments", @"cloudHasCommentsByMe", 0);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = [(PLChangeList *)self->_changedAssets updated];
    uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          if (self->_isProcessingRemoteDidSave)
          {
            if ([*(id *)(*((void *)&v26 + 1) + 8 * i) isCloudSharedAsset])
            {
LABEL_20:
              assetsWithCloudCommentChanges = self->_assetsWithCloudCommentChanges;
              if (!assetsWithCloudCommentChanges)
              {
                long long v19 = (NSMutableSet *)objc_opt_new();
                uint64_t v20 = self->_assetsWithCloudCommentChanges;
                self->_assetsWithCloudCommentChanges = v19;

                assetsWithCloudCommentChanges = self->_assetsWithCloudCommentChanges;
              }
              [(NSMutableSet *)assetsWithCloudCommentChanges addObject:v10];
            }
          }
          else
          {
            uint64_t v11 = [*(id *)(*((void *)&v26 + 1) + 8 * i) changedValuesForCurrentEvent];
            id v12 = [v11 allKeys];

            long long v24 = 0u;
            long long v25 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            id v13 = v12;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v23;
              while (2)
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v23 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  if ([v5 containsObject:*(void *)(*((void *)&v22 + 1) + 8 * j)])
                  {

                    goto LABEL_20;
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
                if (v15) {
                  continue;
                }
                break;
              }
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
    }
  }
}

- (void)_evaluateContainersWithUpdatedContent
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  int v3 = [(PLChangeList *)self->_changedAssets updated];
  unint64_t v4 = [v3 count];

  if (v4 >= 2)
  {
    id v5 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v6 = +[PLManagedAsset entityName];
    uint64_t v7 = [v5 fetchRequestWithEntityName:v6];

    uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v9 = [(PLChangeList *)self->_changedAssets updated];
    uint64_t v10 = [v8 predicateWithFormat:@"self IN %@", v9];
    [v7 setPredicate:v10];

    [v7 setRelationshipKeyPathsForPrefetching:&unk_1EEBF1BE0];
    id v11 = [(PLManagedObjectContext *)self->_moc executeFetchRequest:v7 error:0];
  }
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  obuint64_t j = [(PLChangeList *)self->_changedAssets updated];
  uint64_t v91 = [obj countByEnumeratingWithState:&v117 objects:v126 count:16];
  if (v91)
  {
    uint64_t v89 = *(void *)v118;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v118 != v89) {
          objc_enumerationMutation(obj);
        }
        uint64_t v94 = v12;
        id v13 = *(void **)(*((void *)&v117 + 1) + 8 * v12);
        long long v113 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        uint64_t v14 = [v13 albums];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v113 objects:v125 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v114;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v114 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v19 = *(void **)(*((void *)&v113 + 1) + 8 * i);
              if ([v19 isFault])
              {
                uint64_t v20 = [(PLChangeList *)self->_changedAlbums updated];
                if ([v20 containsObject:v19])
                {
                }
                else
                {
                  int v21 = [v19 hasDerivedIndexMappers];

                  if (!v21) {
                    continue;
                  }
                }
              }
              if (([v19 isFault] & 1) == 0) {
                id v22 = [(PLChangeNotificationCenter *)self _takeSnapshotOfObject:v19];
              }
              long long v23 = [(PLContentChanges *)self->_albumsContent container];

              if (!v23)
              {
                id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                [(PLContentChanges *)self->_albumsContent setContainer:v24];

                id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                [(PLContentChanges *)self->_albumsContent setUpdatedContent:v25];
              }
              long long v26 = [(PLContentChanges *)self->_albumsContent container];
              uint64_t v27 = [v26 indexOfObjectIdenticalTo:v19];

              if (v27 == 0x7FFFFFFFFFFFFFFFLL)
              {
                long long v28 = [(PLContentChanges *)self->_albumsContent container];
                uint64_t v27 = [v28 count];

                long long v29 = [(PLContentChanges *)self->_albumsContent container];
                [v29 addObject:v19];

                long long v30 = [(PLContentChanges *)self->_albumsContent updatedContent];
                long long v31 = [MEMORY[0x1E4F1CA48] array];
                [v30 addObject:v31];
              }
              uint64_t v32 = [(PLContentChanges *)self->_albumsContent updatedContent];
              long long v33 = [v32 objectAtIndex:v27];

              [v33 addObject:v13];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v113 objects:v125 count:16];
          }
          while (v16);
        }

        uint64_t v12 = v94 + 1;
      }
      while (v94 + 1 != v91);
      uint64_t v91 = [obj countByEnumeratingWithState:&v117 objects:v126 count:16];
    }
    while (v91);
  }

  [(PLChangeList *)self->_changedAlbums updated];
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id obja = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v92 = [obja countByEnumeratingWithState:&v109 objects:v124 count:16];
  if (v92)
  {
    uint64_t v90 = *(void *)v110;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v110 != v90) {
          objc_enumerationMutation(obja);
        }
        uint64_t v95 = v34;
        long long v35 = *(void **)(*((void *)&v109 + 1) + 8 * v34);
        long long v105 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v36 = [v35 albumLists];
        uint64_t v37 = [v36 countByEnumeratingWithState:&v105 objects:v123 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v106;
          do
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v106 != v39) {
                objc_enumerationMutation(v36);
              }
              long long v41 = *(void **)(*((void *)&v105 + 1) + 8 * j);
              if (![v41 isFault]
                || [v41 hasDerivedIndexMappers])
              {
                id v42 = [(PLChangeNotificationCenter *)self _takeSnapshotOfObject:v41];
                long long v43 = [(PLContentChanges *)self->_albumListsContent container];

                if (!v43)
                {
                  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  [(PLContentChanges *)self->_albumListsContent setContainer:v44];

                  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  [(PLContentChanges *)self->_albumListsContent setUpdatedContent:v45];
                }
                v46 = [(PLContentChanges *)self->_albumListsContent container];
                uint64_t v47 = [v46 indexOfObjectIdenticalTo:v41];

                if (v47 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v48 = [(PLContentChanges *)self->_albumListsContent container];
                  uint64_t v47 = [v48 count];

                  v49 = [(PLContentChanges *)self->_albumListsContent container];
                  [v49 addObject:v41];

                  v50 = [(PLContentChanges *)self->_albumListsContent updatedContent];
                  v51 = [MEMORY[0x1E4F1CA48] array];
                  [v50 addObject:v51];
                }
                v52 = [(PLContentChanges *)self->_albumListsContent updatedContent];
                v53 = [v52 objectAtIndex:v47];

                [v53 addObject:v35];
              }
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v105 objects:v123 count:16];
          }
          while (v38);
        }

        uint64_t v34 = v95 + 1;
      }
      while (v95 + 1 != v92);
      uint64_t v92 = [obja countByEnumeratingWithState:&v109 objects:v124 count:16];
    }
    while (v92);
  }

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  v54 = [(PLChangeList *)self->_changedAssets updated];
  uint64_t v55 = [v54 countByEnumeratingWithState:&v101 objects:v122 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v102;
    do
    {
      for (uint64_t k = 0; k != v56; ++k)
      {
        if (*(void *)v102 != v57) {
          objc_enumerationMutation(v54);
        }
        v59 = *(void **)(*((void *)&v101 + 1) + 8 * k);
        v60 = [v59 moment];
        v61 = v60;
        if (v60)
        {
          if (![v60 isFault]
            || ([(PLChangeList *)self->_changedMoments updated],
                v62 = objc_claimAutoreleasedReturnValue(),
                int v63 = [v62 containsObject:v61],
                v62,
                v63))
          {
            if (([v61 isFault] & 1) == 0) {
              id v64 = [(PLChangeNotificationCenter *)self _takeSnapshotOfObject:v61];
            }
            v65 = [(PLContentChanges *)self->_momentsContent container];

            if (!v65)
            {
              id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [(PLContentChanges *)self->_momentsContent setContainer:v66];

              id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [(PLContentChanges *)self->_momentsContent setUpdatedContent:v67];
            }
            v68 = [(PLContentChanges *)self->_momentsContent container];
            uint64_t v69 = [v68 indexOfObjectIdenticalTo:v61];

            if (v69 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v70 = [(PLContentChanges *)self->_momentsContent container];
              uint64_t v69 = [v70 count];

              v71 = [(PLContentChanges *)self->_momentsContent container];
              [v71 addObject:v61];

              v72 = [(PLContentChanges *)self->_momentsContent updatedContent];
              v73 = [MEMORY[0x1E4F1CA48] array];
              [v72 addObject:v73];
            }
            v74 = [(PLContentChanges *)self->_momentsContent updatedContent];
            v75 = [v74 objectAtIndex:v69];

            [v75 addObject:v59];
          }
        }
      }
      uint64_t v56 = [v54 countByEnumeratingWithState:&v101 objects:v122 count:16];
    }
    while (v56);
  }

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  v76 = [(PLContentChanges *)self->_momentsContent container];
  uint64_t v77 = [v76 countByEnumeratingWithState:&v97 objects:v121 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v98;
    v93 = 0;
    uint64_t v96 = *(void *)v98;
    do
    {
      for (uint64_t m = 0; m != v78; ++m)
      {
        if (*(void *)v98 != v79) {
          objc_enumerationMutation(v76);
        }
        v81 = *(void **)(*((void *)&v97 + 1) + 8 * m);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v82 = [(PLChangeList *)self->_changedMoments updated];
          if ([v82 containsObject:v81])
          {
          }
          else
          {
            v83 = v76;
            v84 = [(PLChangeList *)self->_changedAssets updated];
            v85 = [v81 bestAsset];
            int v86 = [v84 containsObject:v85];

            if (v86)
            {
              if (v93)
              {
                [v93 addObject:v81];
              }
              else
              {
                v93 = [MEMORY[0x1E4F1CA48] arrayWithObject:v81];
              }
            }
            v76 = v83;
            uint64_t v79 = v96;
          }
        }
      }
      uint64_t v78 = [v76 countByEnumeratingWithState:&v97 objects:v121 count:16];
    }
    while (v78);
  }
  else
  {
    v93 = 0;
  }
}

- (void)_splitContextDidChangeNotification:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  context = (void *)MEMORY[0x19F38D3B0]();
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  obuint64_t j = +[PLManagedObjectContext changeNotificationObjectKeys];
  v65 = self;
  uint64_t v57 = [obj countByEnumeratingWithState:&v77 objects:v83 count:16];
  if (v57)
  {
    uint64_t v55 = *(void *)v78;
    unint64_t v4 = (void *)*MEMORY[0x1E4F1BFA8];
    v54 = (void *)*MEMORY[0x1E4F1BF30];
    v53 = (void *)*MEMORY[0x1E4F1BE10];
    p_changedCloudFeedEntries = &self->_changedCloudFeedEntries;
    p_changedMoments = &self->_changedMoments;
    p_changedAlbums = &self->_changedAlbums;
    p_changedAssets = &self->_changedAssets;
    p_changedAlbumLists = &self->_changedAlbumLists;
    uint64_t v64 = *MEMORY[0x1E4F1BDF8];
    uint64_t v59 = *MEMORY[0x1E4F1BDC0];
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v78 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v58 = v5;
        uint64_t v6 = *(void **)(*((void *)&v77 + 1) + 8 * v5);
        BOOL v9 = v6 == v4 || v6 == v54 || v6 == v53;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        uint64_t v10 = [v56 userInfo];
        id v11 = [v10 objectForKey:v6];

        id v66 = v11;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v73 objects:v82 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v74;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v74 != v14) {
                objc_enumerationMutation(v66);
              }
              id v16 = *(id *)(*((void *)&v73 + 1) + 8 * i);
              if (v6 != v4
                || [(PLChangeNotificationCenter *)self _isInterestedInUpdatesOfObject:v16])
              {
                if (v9 && self->_isProcessingRemoteDidSave) {
                  id v17 = [(PLChangeNotificationCenter *)self _takeSnapshotFromCommittedValuesOfObject:v16];
                }
                id v18 = v6;
                int v19 = entityKindOfObject(v16) - 2;
                uint64_t v20 = (id *)p_changedAlbumLists;
                switch(v19)
                {
                  case 0:
                    goto LABEL_30;
                  case 1:
                    uint64_t v20 = (id *)p_changedAlbums;
                    goto LABEL_30;
                  case 2:
                    uint64_t v20 = (id *)p_changedAssets;
                    goto LABEL_30;
                  case 3:
                  case 4:
                    uint64_t v20 = (id *)p_changedMoments;
                    goto LABEL_30;
                  case 5:
                    uint64_t v20 = (id *)p_changedCloudFeedEntries;
LABEL_30:
                    id v21 = *v20;
                    if (!v21) {
                      goto LABEL_44;
                    }
                    id v22 = v21;
                    if ([v18 isEqualToString:v64])
                    {
                      id v23 = [v22 inserted];
                      if (v23) {
                        goto LABEL_42;
                      }
                      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                      [v22 setInserted:v23];
                      if (v23) {
                        goto LABEL_42;
                      }
                    }
                    else if (v9)
                    {
                      id v23 = [v22 updated];
                      if (v23) {
                        goto LABEL_42;
                      }
                      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                      [v22 setUpdated:v23];
                      if (v23) {
                        goto LABEL_42;
                      }
                    }
                    else if ([v18 isEqualToString:v59])
                    {
                      id v23 = [v22 deleted];
                      if (v23
                        || (id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]), [v22 setDeleted:v23], v23))
                      {
LABEL_42:
                        [v23 addObject:v16];
                      }
                    }

                    self = v65;
LABEL_44:

                    break;
                  default:
                    goto LABEL_44;
                }
              }
            }
            uint64_t v13 = [v66 countByEnumeratingWithState:&v73 objects:v82 count:16];
          }
          while (v13);
        }

        uint64_t v5 = v58 + 1;
      }
      while (v58 + 1 != v57);
      uint64_t v57 = [obj countByEnumeratingWithState:&v77 objects:v83 count:16];
    }
    while (v57);
  }

  id v24 = self;
  if (![(PLChangeNotificationCenter *)self _shouldForceFetchingAlbumsToReload])
  {
    id v25 = [(PLChangeList *)self->_changedAssets inserted];
    if (![v25 count])
    {
      long long v26 = [(PLChangeList *)self->_changedAssets updated];
      if (![v26 count])
      {
        v49 = [(PLChangeList *)self->_changedAssets deleted];
        uint64_t v50 = [v49 count];

        if (!v50) {
          goto LABEL_74;
        }
        goto LABEL_54;
      }
    }
  }
LABEL_54:
  +[PLGenericAlbum allAlbumsRegisteredWithManagedObjectContext:v24->_moc];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v68 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = [v68 countByEnumeratingWithState:&v69 objects:v81 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v70;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v70 != v29) {
          objc_enumerationMutation(v68);
        }
        long long v31 = *(void **)(*((void *)&v69 + 1) + 8 * j);
        if ([v31 hasAssetsCache])
        {
          uint64_t v32 = [v31 fetchRequest];
          long long v33 = [v32 predicate];
          uint64_t v34 = [(PLChangeList *)v65->_changedAssets inserted];
          long long v35 = [v34 filteredSetUsingPredicate:v33];
          uint64_t v36 = [v35 count];

          if (v36) {
            goto LABEL_64;
          }
          uint64_t v37 = [(PLChangeList *)v65->_changedAssets deleted];
          char v38 = [v31 mayHaveAssetsInCommon:v37];

          if (v38) {
            goto LABEL_64;
          }
          uint64_t v39 = [(PLChangeList *)v65->_changedAssets updated];
          char v40 = [v31 mayHaveAssetsInCommon:v39];

          if ((v40 & 1) != 0
            || ([(PLChangeList *)v65->_changedAssets updated],
                long long v41 = objc_claimAutoreleasedReturnValue(),
                [v41 filteredSetUsingPredicate:v33],
                id v42 = objc_claimAutoreleasedReturnValue(),
                uint64_t v43 = [v42 count],
                v42,
                v41,
                v43))
          {
LABEL_64:
            id v44 = [(PLChangeList *)v65->_changedAlbums updated];

            if (!v44)
            {
              id v45 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              [(PLChangeList *)v65->_changedAlbums setUpdated:v45];
            }
            v46 = [(PLChangeList *)v65->_changedAlbums updated];
            [v46 addObject:v31];

            uint64_t v47 = [(PLChangeNotificationCenter *)v65 _takeSnapshotOfObject:v31];
            if ([v47 hasSnapshotValueForProperty:@"assets"]) {
              v48 = 0;
            }
            else {
              v48 = v47;
            }
            [v31 updateSnapshotAndClearCaches:v48];
          }
        }
      }
      uint64_t v28 = [v68 countByEnumeratingWithState:&v69 objects:v81 count:16];
    }
    while (v28);
  }

  id v24 = v65;
LABEL_74:
  [(PLChangeNotificationCenter *)v24 _evaluateContainersWithUpdatedContent];
  [(PLChangeNotificationCenter *)v24 _evaluateUpdatedAssets];
}

- (void)_cleanupState
{
  [(PLChangeList *)self->_changedAlbumLists cleanupState];
  [(PLChangeList *)self->_changedAlbums cleanupState];
  [(PLChangeList *)self->_changedAssets cleanupState];
  assetsWithCloudCommentChanges = self->_assetsWithCloudCommentChanges;
  self->_assetsWithCloudCommentChanges = 0;

  [(PLChangeList *)self->_changedMoments cleanupState];
  [(PLContentChanges *)self->_albumsContent cleanupState];
  [(PLContentChanges *)self->_albumListsContent cleanupState];
  [(PLContentChanges *)self->_momentsContent cleanupState];
  [(PLChangeList *)self->_changedCloudFeedEntries cleanupState];
  snapshots = self->_snapshots;
  self->_snapshots = 0;
}

- (void)_enqueueAssetChangeNotification
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v3 = [(PLChangeList *)self->_changedAssets updated];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(PLChangeList *)self->_changedAssets updated];
    id v14 = +[PLAssetChangeNotification notificationWithChangedAssets:v5];

    [(PLChangeNotificationCenter *)self enqueueNotification:v14];
  }
  else if (self->_isOverloaded)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = self->_overloadedObjects;
    uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    if ([v6 count])
    {
      uint64_t v13 = +[PLAssetChangeNotification notificationWithChangedAssets:v6];
      [(PLChangeNotificationCenter *)self enqueueNotification:v13];
    }
  }
}

- (void)_enqueueMomentChangeNotifications
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int v3 = [(PLChangeList *)self->_changedMoments updated];
  if ([v3 count])
  {

LABEL_4:
    uint64_t v6 = [(PLChangeList *)self->_changedMoments updated];
    uint64_t v7 = [(PLContentChanges *)self->_momentsContent container];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      if (v6)
      {
        uint64_t v9 = [(PLContentChanges *)self->_momentsContent container];
        uint64_t v10 = [v6 setByAddingObjectsFromArray:v9];

        uint64_t v6 = (void *)v10;
      }
      else
      {
        id v11 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v9 = [(PLContentChanges *)self->_momentsContent container];
        uint64_t v6 = [v11 setWithArray:v9];
      }
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v12 = v6;
    uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          long long v18 = [(PLContentChanges *)self->_momentsContent container];
          if (v18)
          {
            int v19 = [(PLContentChanges *)self->_momentsContent container];
            uint64_t v20 = [v19 indexOfObjectIdenticalTo:v17];

            if (v20 == 0x7FFFFFFFFFFFFFFFLL)
            {
              long long v18 = 0;
            }
            else
            {
              id v21 = [(PLContentChanges *)self->_momentsContent updatedContent];
              long long v18 = [v21 objectAtIndex:v20];
            }
          }
          id v22 = [(PLChangeNotificationCenter *)self _snapshotForObject:v17];
          id v23 = +[PLAssetContainerChangeNotification notificationWithContainer:v17 snapshot:v22 changedAssets:v18];
          [(PLChangeNotificationCenter *)self _enqueueAssetContainerChangeNotification:v23];
        }
        uint64_t v14 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v14);
    }

LABEL_21:
    return;
  }
  uint64_t v4 = [(PLContentChanges *)self->_momentsContent container];
  uint64_t v5 = [v4 count];

  if (v5) {
    goto LABEL_4;
  }
  if (self->_isOverloaded)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v12 = self->_overloadedObjects;
    uint64_t v24 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v12);
          }
          uint64_t v28 = *(void *)(*((void *)&v30 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v29 = +[PLAssetContainerChangeNotification notificationWithContainer:snapshot:changedAssets:](PLAssetContainerChangeNotification, "notificationWithContainer:snapshot:changedAssets:", v28, 0, 0, (void)v30);
            [(PLChangeNotificationCenter *)self _enqueueAssetContainerChangeNotification:v29];
          }
        }
        uint64_t v25 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v25);
    }
    goto LABEL_21;
  }
}

- (void)_enqueueCloudFeedEntriesChangeNotifications
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    long long v32 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  uint64_t v6 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [(PLChangeList *)self->_changedCloudFeedEntries inserted];
    *(_DWORD *)buf = 138412290;
    long long v32 = v7;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "inserted=%@", buf, 0xCu);
  }
  uint64_t v8 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [(PLChangeList *)self->_changedCloudFeedEntries updated];
    *(_DWORD *)buf = 138412290;
    long long v32 = v9;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "updated=%@", buf, 0xCu);
  }
  uint64_t v10 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = [(PLChangeList *)self->_changedCloudFeedEntries deleted];
    *(_DWORD *)buf = 138412290;
    long long v32 = v11;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "deleted=%@", buf, 0xCu);
  }
  uint64_t v12 = PLCloudFeedGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    BOOL isOverloaded = self->_isOverloaded;
    *(_DWORD *)buf = 67109120;
    LODWORD(v32) = isOverloaded;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "_isOverloaded=%i", buf, 8u);
  }

  uint64_t v14 = [(PLChangeList *)self->_changedCloudFeedEntries inserted];
  if ([v14 count]) {
    goto LABEL_14;
  }
  uint64_t v15 = [(PLChangeList *)self->_changedCloudFeedEntries updated];
  if ([v15 count])
  {

LABEL_14:
LABEL_15:
    long long v16 = [(PLChangeList *)self->_changedCloudFeedEntries inserted];
    uint64_t v17 = [(PLChangeList *)self->_changedCloudFeedEntries updated];
    long long v18 = [(PLChangeList *)self->_changedCloudFeedEntries deleted];
    int v19 = +[PLCloudFeedEntriesChangeNotification notificationWithInsertedEntries:v16 updatedEntries:v17 deletedEntries:v18];

LABEL_16:
    if (v19)
    {
      [(PLChangeNotificationCenter *)self enqueueNotification:v19];
LABEL_18:

      return;
    }
    return;
  }
  uint64_t v20 = [(PLChangeList *)self->_changedCloudFeedEntries deleted];
  uint64_t v21 = [v20 count];

  if (v21) {
    goto LABEL_15;
  }
  if (self->_isOverloaded)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v16 = self->_overloadedObjects;
    uint64_t v22 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v27;
      while (2)
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(v16);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v19 = +[PLCloudFeedEntriesChangeNotification notificationWithFullReload];
            goto LABEL_16;
          }
          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
    int v19 = v16;
    goto LABEL_18;
  }
}

- (void)_enqueueCloudCommentsNotifications
{
  v2 = self;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_assetsWithCloudCommentChanges count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obuint64_t j = v2->_assetsWithCloudCommentChanges;
    uint64_t v3 = [(NSMutableSet *)obj countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v3)
    {
      uint64_t v5 = v3;
      uint64_t v6 = *(void *)v25;
      uint64_t v7 = off_1E585E000;
      *(void *)&long long v4 = 138544130;
      long long v20 = v4;
      uint64_t v21 = v2;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v25 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v10 = -[PLChangeNotificationCenter _snapshotForObject:](v2, "_snapshotForObject:", v9, v20);
          id v11 = [(__objc2_class *)v7[118] notificationWithAsset:v9 snapshot:v10];
          uint64_t v12 = PLChangeHandlingGetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromSelector(a2);
            uint64_t v13 = v5;
            uint64_t v14 = v6;
            v16 = uint64_t v15 = v7;
            uint64_t v17 = [v9 uuid];
            long long v18 = [v9 orderedLikeComments];
            uint64_t v19 = [v18 count];
            *(_DWORD *)buf = v20;
            long long v29 = v16;
            __int16 v30 = 2114;
            long long v31 = v17;
            __int16 v32 = 2048;
            uint64_t v33 = v19;
            __int16 v34 = 2112;
            long long v35 = v11;
            _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: PLManagedAsset = %{public}@, like count = %tu, PLCloudCommentsChangeNotification = %@", buf, 0x2Au);

            uint64_t v7 = v15;
            uint64_t v6 = v14;
            uint64_t v5 = v13;
            v2 = v21;
          }

          [(PLChangeNotificationCenter *)v2 enqueueNotification:v11];
        }
        uint64_t v5 = [(NSMutableSet *)obj countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v5);
    }
  }
}

- (void)_enqueueAlbumNotifications
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLChangeList *)self->_changedAlbums updated];
  if ([v3 count])
  {

LABEL_4:
    uint64_t v6 = [(PLChangeList *)self->_changedAlbums updated];
    uint64_t v7 = [(PLContentChanges *)self->_albumsContent container];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      if (v6)
      {
        uint64_t v9 = [(PLContentChanges *)self->_albumsContent container];
        uint64_t v10 = [v6 setByAddingObjectsFromArray:v9];

        uint64_t v6 = (void *)v10;
      }
      else
      {
        id v11 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v9 = [(PLContentChanges *)self->_albumsContent container];
        uint64_t v6 = [v11 setWithArray:v9];
      }
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v12 = v6;
    uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v18 = [(PLChangeList *)self->_changedAssets updated];
            uint64_t v19 = [v18 allObjects];
          }
          else
          {
            long long v20 = [(PLContentChanges *)self->_albumsContent container];
            if (!v20) {
              goto LABEL_21;
            }
            uint64_t v21 = [(PLContentChanges *)self->_albumsContent container];
            uint64_t v22 = [v21 indexOfObjectIdenticalTo:v17];

            if (v22 == 0x7FFFFFFFFFFFFFFFLL)
            {
              long long v20 = 0;
              goto LABEL_21;
            }
            long long v18 = [(PLContentChanges *)self->_albumsContent updatedContent];
            uint64_t v19 = [v18 objectAtIndex:v22];
          }
          long long v20 = (void *)v19;

LABEL_21:
          uint64_t v23 = [(PLChangeNotificationCenter *)self _snapshotForObject:v17];
          long long v24 = +[PLAssetContainerChangeNotification notificationWithContainer:v17 snapshot:v23 changedAssets:v20];
          long long v25 = +[PLInvitationRecordsChangeNotification notificationWithAlbum:v17 snapshot:v23];
          [(PLChangeNotificationCenter *)self _enqueueAlbumChangeNotification:v24];
          [(PLChangeNotificationCenter *)self _enqueueInvitationRecordsChangeNotification:v25];
        }
        uint64_t v14 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v14);
    }

    goto LABEL_24;
  }
  long long v4 = [(PLContentChanges *)self->_albumsContent container];
  uint64_t v5 = [v4 count];

  if (v5) {
    goto LABEL_4;
  }
  if (self->_isOverloaded)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v12 = self->_overloadedObjects;
    uint64_t v26 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(v12);
          }
          uint64_t v30 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v31 = +[PLAssetContainerChangeNotification notificationWithContainer:snapshot:changedAssets:](PLAssetContainerChangeNotification, "notificationWithContainer:snapshot:changedAssets:", v30, 0, 0, (void)v33);
            __int16 v32 = +[PLInvitationRecordsChangeNotification notificationWithAlbum:v30 snapshot:0];
            [(PLChangeNotificationCenter *)self _enqueueAlbumChangeNotification:v31];
            [(PLChangeNotificationCenter *)self _enqueueInvitationRecordsChangeNotification:v32];
          }
        }
        uint64_t v27 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v27);
    }
LABEL_24:
  }
}

- (void)_enqueueAlbumListNotifications
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLChangeList *)self->_changedAlbumLists updated];
  if ([v3 count])
  {

LABEL_4:
    uint64_t v6 = [(PLChangeList *)self->_changedAlbumLists updated];
    uint64_t v7 = [(PLContentChanges *)self->_albumListsContent container];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      if (v6)
      {
        uint64_t v9 = [(PLContentChanges *)self->_albumListsContent container];
        uint64_t v10 = [v6 setByAddingObjectsFromArray:v9];

        uint64_t v6 = (void *)v10;
      }
      else
      {
        id v11 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v9 = [(PLContentChanges *)self->_albumListsContent container];
        uint64_t v6 = [v11 setWithArray:v9];
      }
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v12 = v6;
    uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          long long v18 = [(PLContentChanges *)self->_albumListsContent container];
          if (v18)
          {
            uint64_t v19 = [(PLContentChanges *)self->_albumListsContent container];
            uint64_t v20 = [v19 indexOfObjectIdenticalTo:v17];

            if (v20 == 0x7FFFFFFFFFFFFFFFLL)
            {
              long long v18 = 0;
            }
            else
            {
              uint64_t v21 = [(PLContentChanges *)self->_albumListsContent updatedContent];
              long long v18 = [v21 objectAtIndex:v20];
            }
          }
          uint64_t v22 = [(PLChangeNotificationCenter *)self _snapshotForObject:v17];
          uint64_t v23 = +[PLAssetContainerListChangeNotification notificationWithContainerList:v17 snapshot:v22 changedContainers:v18];
          [(PLChangeNotificationCenter *)self _enqueueAssetContainerListChangeNotification:v23];
        }
        uint64_t v14 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v14);
    }

LABEL_21:
    return;
  }
  long long v4 = [(PLContentChanges *)self->_albumListsContent container];
  uint64_t v5 = [v4 count];

  if (v5) {
    goto LABEL_4;
  }
  if (self->_isOverloaded)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v12 = self->_overloadedObjects;
    uint64_t v24 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v12);
          }
          uint64_t v28 = *(void *)(*((void *)&v30 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v29 = +[PLAssetContainerListChangeNotification notificationWithContainerList:snapshot:changedContainers:](PLAssetContainerListChangeNotification, "notificationWithContainerList:snapshot:changedContainers:", v28, 0, 0, (void)v30);
            [(PLChangeNotificationCenter *)self _enqueueAssetContainerListChangeNotification:v29];
          }
        }
        uint64_t v25 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v25);
    }
    goto LABEL_21;
  }
}

- (void)_enqueuePhotoLibraryNotifications
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLChangeList *)self->_changedAlbums inserted];
  if ([v3 count])
  {

LABEL_4:
    uint64_t v6 = [(PLManagedObjectContext *)self->_moc photoLibrary];
    uint64_t v7 = [(PLChangeList *)self->_changedAlbums inserted];
    uint64_t v8 = [v7 allObjects];
    v13[0] = v8;
    uint64_t v9 = [(PLChangeList *)self->_changedAlbums deleted];
    uint64_t v10 = [v9 allObjects];
    v13[1] = v10;
    v12[0] = @"AddedItemsKey";
    v12[1] = @"DeletedItemsKey";
    [(PLChangeNotificationCenter *)self _enqueueNotification:@"PLPhotoLibraryDidChangeNotification" object:v6 userInfoWithObjects:v13 forKeys:v12 count:2];

    goto LABEL_5;
  }
  long long v4 = [(PLChangeList *)self->_changedAlbums deleted];
  uint64_t v5 = [v4 count];

  if (v5) {
    goto LABEL_4;
  }
  if (!self->_isOverloaded) {
    goto LABEL_6;
  }
  uint64_t v6 = [(PLManagedObjectContext *)self->_moc photoLibrary];
  [(PLChangeNotificationCenter *)self _enqueueNotification:@"PLPhotoLibraryDidChangeNotification" object:v6 userInfoWithObjects:0 forKeys:0 count:0];
LABEL_5:

LABEL_6:
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"PLPhotoLibraryDidChangeNotification", 0, 0, 1u);
}

- (void)_sendNotificationsForSplitChanges
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    long long v4 = [(PLChangeNotificationCenter *)self descriptionOfSplitChanges];
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Change split into:\n%@", (uint8_t *)&v6, 0xCu);
  }
  [(PLChangeNotificationCenter *)self _enqueuePhotoLibraryNotifications];
  [(PLChangeNotificationCenter *)self _enqueueAlbumNotifications];
  [(PLChangeNotificationCenter *)self _enqueueMomentChangeNotifications];
  [(PLChangeNotificationCenter *)self _enqueueAlbumListNotifications];
  [(PLChangeNotificationCenter *)self _enqueueCloudCommentsNotifications];
  [(PLChangeNotificationCenter *)self _enqueueCloudFeedEntriesChangeNotifications];
  [(PLChangeNotificationCenter *)self _enqueueAssetChangeNotification];
  [(PLChangeNotificationCenter *)self _cleanupState];
  moc = self->_moc;
  self->_moc = 0;

  [(PLChangeNotificationCenter *)self _postEnqueuedNotifications];
}

- (void)postShouldReloadNotificationWithPhotoLibrary:(id)a3
{
  id v7 = a3;
  long long v4 = (void *)MEMORY[0x19F38D3B0]();
  id v5 = [[PLPhotoLibraryShouldReloadNotification alloc] initNotificationWithPhotoLibrary:v7];
  int v6 = [(PLChangeNotificationCenter *)self backingCenter];
  [v6 postNotification:v5];
}

- (void)enumerateIndexMappingCachesForObject:(id)a3 withBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  pl_dispatch_once();
  if (enumerateIndexMappingCachesForObject_withBlock__isIndexMappersDataOrigin[(int)indexOfObjectEntity(v7)]) {
    [v7 enumerateDerivedIndexMappers:v6];
  }
}

uint64_t __77__PLChangeNotificationCenter_enumerateIndexMappingCachesForObject_withBlock___block_invoke(uint64_t a1)
{
  for (uint64_t i = 0; ; ++i)
  {
    uint64_t result = objectEntitiesCount(*(void **)(a1 + 32));
    if (i >= (int)result) {
      break;
    }
    long long v4 = entityAtIndex(i, *(void **)(a1 + 32));
    id v5 = [v4 managedObjectClassName];
    id v6 = [NSClassFromString(v5) instanceMethodSignatureForSelector:sel_enumerateDerivedIndexMappers_];

    if (v6) {
      enumerateIndexMappingCachesForObject_withBlock__isIndexMappersDataOrigin[i] = 1;
    }
  }
  return result;
}

- (id)_toOneRelationshipsOfInterestForObject:(id)a3
{
  id v6 = a3;
  id v3 = v6;
  pl_dispatch_once();
  id v4 = (id)_toOneRelationshipsOfInterestForObject__myKeys[(int)indexOfObjectEntity(v3)];

  return v4;
}

void __69__PLChangeNotificationCenter__toOneRelationshipsOfInterestForObject___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  for (uint64_t i = 0; i < (int)objectEntitiesCount(*(void **)(a1 + 32)); ++i)
  {
    [v2 removeAllObjects];
    int v4 = entityKindAtEntityIndex(i, *(void **)(a1 + 32));
    id v5 = _keysOfInterestForEntityKind(v4);
    id v6 = entityAtIndex(i, *(void **)(a1 + 32));
    id v7 = [v6 relationshipsByName];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __69__PLChangeNotificationCenter__toOneRelationshipsOfInterestForObject___block_invoke_2;
    v12[3] = &unk_1E586B4A0;
    id v8 = v5;
    id v13 = v8;
    id v9 = v2;
    id v14 = v9;
    [v7 enumerateKeysAndObjectsUsingBlock:v12];
    if ([v9 count])
    {
      uint64_t v10 = [v9 copy];
      id v11 = (void *)_toOneRelationshipsOfInterestForObject__myKeys[i];
      _toOneRelationshipsOfInterestForObject__myKeys[i] = v10;
    }
  }
}

void __69__PLChangeNotificationCenter__toOneRelationshipsOfInterestForObject___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v6] && objc_msgSend(v5, "maxCount") == 1) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (id)_attributesOfInterestForObject:(id)a3
{
  id v6 = a3;
  id v3 = v6;
  pl_dispatch_once();
  id v4 = (id)_attributesOfInterestForObject__myKeys[(int)indexOfObjectEntity(v3)];

  return v4;
}

void __61__PLChangeNotificationCenter__attributesOfInterestForObject___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  for (uint64_t i = 0; i < (int)objectEntitiesCount(*(void **)(a1 + 32)); ++i)
  {
    [v2 removeAllObjects];
    int v4 = entityKindAtEntityIndex(i, *(void **)(a1 + 32));
    id v5 = _keysOfInterestForEntityKind(v4);
    id v6 = entityAtIndex(i, *(void **)(a1 + 32));
    id v7 = [v6 attributesByName];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __61__PLChangeNotificationCenter__attributesOfInterestForObject___block_invoke_2;
    v12[3] = &unk_1E586B4A0;
    id v8 = v5;
    id v13 = v8;
    id v9 = v2;
    id v14 = v9;
    [v7 enumerateKeysAndObjectsUsingBlock:v12];
    if ([v9 count])
    {
      uint64_t v10 = [v9 copy];
      id v11 = (void *)_attributesOfInterestForObject__myKeys[i];
      _attributesOfInterestForObject__myKeys[i] = v10;
    }
  }
}

void __61__PLChangeNotificationCenter__attributesOfInterestForObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:")) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (id)_orderedRelationshipsOfInterestForObject:(id)a3
{
  id v3 = a3;
  pl_dispatch_once();
  int v4 = indexOfObjectEntity(v3);
  if (v4 >= 70)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [NSString stringWithUTF8String:"-[PLChangeNotificationCenter _orderedRelationshipsOfInterestForObject:]"];
    [v7 handleFailureInFunction:v8 file:@"PLChangeNotificationCenter.m" lineNumber:445 description:@"Out of bounds."];
  }
  id v5 = (id)_orderedRelationshipsOfInterestForObject__myKeys[v4];

  return v5;
}

void __71__PLChangeNotificationCenter__orderedRelationshipsOfInterestForObject___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  for (uint64_t i = 0; i < (int)objectEntitiesCount(*(void **)(a1 + 32)); ++i)
  {
    [v2 removeAllObjects];
    int v4 = entityKindAtEntityIndex(i, *(void **)(a1 + 32));
    id v5 = _keysOfInterestForEntityKind(v4);
    id v6 = entityAtIndex(i, *(void **)(a1 + 32));
    id v7 = [v6 relationshipsByName];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __71__PLChangeNotificationCenter__orderedRelationshipsOfInterestForObject___block_invoke_2;
    v12[3] = &unk_1E586B4A0;
    id v8 = v5;
    id v13 = v8;
    id v9 = v2;
    id v14 = v9;
    [v7 enumerateKeysAndObjectsUsingBlock:v12];
    if ([v9 count])
    {
      uint64_t v10 = [v9 copy];
      id v11 = (void *)_orderedRelationshipsOfInterestForObject__myKeys[i];
      _orderedRelationshipsOfInterestForObject__myKeys[i] = v10;
    }
  }
}

void __71__PLChangeNotificationCenter__orderedRelationshipsOfInterestForObject___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v7])
  {
    id v6 = v5;
    if (![v6 maxCount] || objc_msgSend(v6, "isToMany")) {
      [*(id *)(a1 + 40) addObject:v7];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == &PLChangeNotificationCenterKVOContext)
  {
    if (!self->_isProcessingRemoteDidSave)
    {
      id v13 = v11;
      if (![v13 faultingState] && (objc_msgSend(v13, "isDeleted") & 1) == 0)
      {
        id v14 = [v13 managedObjectContext];

        if (v14)
        {
          uint64_t v15 = [v12 objectForKey:*MEMORY[0x1E4F284D8]];
          int v16 = [v15 BOOLValue];

          if (v16) {
            id v17 = [(PLChangeNotificationCenter *)self _takeSnapshotOfObject:v13];
          }
        }
      }
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PLChangeNotificationCenter;
    [(PLChangeNotificationCenter *)&v18 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)processContextDidChangeNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F38D3B0]();
  id v6 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [v4 name];
    id v8 = [v4 userInfo];
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Transforming local %@ with %@", buf, 0x16u);
  }
  if (v4)
  {
    id v9 = [v4 object];
    moc = self->_moc;
    self->_moc = v9;

    id v11 = self->_moc;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __66__PLChangeNotificationCenter_processContextDidChangeNotification___block_invoke;
    v12[3] = &unk_1E5875E18;
    void v12[4] = self;
    id v13 = v4;
    [(NSManagedObjectContext *)v11 pl_performBlockAndWait:v12];
  }
}

uint64_t __66__PLChangeNotificationCenter_processContextDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _splitContextDidChangeNotification:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3 name:(id)a4 object:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PLChangeNotificationCenter *)self backingCenter];
  [v11 removeObserver:v10 name:v9 object:v8];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PLChangeNotificationCenter *)self backingCenter];
  [v5 removeObserver:v4];
}

- (id)addObserverForName:(id)a3 object:(id)a4 queue:(id)a5 usingBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(PLChangeNotificationCenter *)self backingCenter];
  uint64_t v15 = [v14 addObserverForName:v13 object:v12 queue:v11 usingBlock:v10];

  return v15;
}

- (void)removeShouldReloadObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PLChangeNotificationCenter *)self backingCenter];
  [v5 removeObserver:v4 name:@"PLPhotoLibraryShouldReload" object:0];
}

- (void)removeAssetChangeObserver:(id)a3
{
}

- (void)removeCloudFeedEntriesObserver:(id)a3
{
}

- (void)removeInvitationRecordsObserver:(id)a3
{
}

- (void)addInvitationRecordsObserver:(id)a3
{
}

- (void)removeCloudCommentsChangeObserver:(id)a3 asset:(id)a4
{
}

- (void)removeAssetContainerListChangeObserver:(id)a3 containerList:(id)a4
{
}

- (void)addAssetContainerListChangeObserver:(id)a3 containerList:(id)a4
{
}

- (void)removeAssetContainerChangeObserver:(id)a3 container:(id)a4
{
}

- (void)addAssetContainerChangeObserver:(id)a3 container:(id)a4
{
}

- (void)enqueueNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    enqueuedNotifications = self->_enqueuedNotifications;
    id v8 = v4;
    if (!enqueuedNotifications)
    {
      id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v7 = self->_enqueuedNotifications;
      self->_enqueuedNotifications = v6;

      enqueuedNotifications = self->_enqueuedNotifications;
    }
    [(NSMutableArray *)enqueuedNotifications addObject:v8];
    id v4 = v8;
  }
}

- (void)dealloc
{
  cameraPreviewChangedToken = self->_cameraPreviewChangedToken;
  if (cameraPreviewChangedToken) {
    notify_cancel([(NSNumber *)cameraPreviewChangedToken intValue]);
  }
  v4.receiver = self;
  v4.super_class = (Class)PLChangeNotificationCenter;
  [(PLChangeNotificationCenter *)&v4 dealloc];
}

+ (void)assertIsCompatibleWithObjectModel:(id)a3
{
  id v5 = [a3 entitiesByName];
  id v6 = [v5 allKeys];
  unint64_t v7 = [v6 count];

  if (v7 >= 0x46)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PLChangeNotificationCenter.m", 1427, @"Need to increase maxEntityCount (%tu < %d)", v7, 70);
  }
}

+ (void)forceFetchingAlbumReload
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  pl_dispatch_once();
  uint32_t state = notify_get_state(forceFetchingAlbumReloadToken_token, &state64);
  if (state)
  {
    uint32_t v3 = state;
    objc_super v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v10 = v3;
      id v5 = "notify_get_state() failed for fetching album reload. (%u)";
LABEL_7:
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, v5, buf, 8u);
    }
  }
  else
  {
    ++state64;
    pl_dispatch_once();
    uint32_t v6 = notify_set_state(forceFetchingAlbumReloadToken_token, state64);
    if (!v6) {
      return;
    }
    uint32_t v7 = v6;
    objc_super v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v10 = v7;
      id v5 = "notify_set_state() failed for fetching album reload. (%u)";
      goto LABEL_7;
    }
  }
}

+ (void)getInsertedAssetCount:(unint64_t *)a3 deletedAssetCount:(unint64_t *)a4 updatedAssets:(id)a5 fromContextDidChangeNotification:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v31 = a5;
  id v28 = a6;
  *a3 = 0;
  long long v32 = a4;
  *a4 = 0;
  context = (void *)MEMORY[0x19F38D3B0]();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v9 = *MEMORY[0x1E4F1BDF8];
  uint64_t v10 = *MEMORY[0x1E4F1BDC0];
  v42[0] = *MEMORY[0x1E4F1BDF8];
  v42[1] = v10;
  uint64_t v25 = *MEMORY[0x1E4F1BF30];
  uint64_t v11 = *MEMORY[0x1E4F1BF30];
  uint64_t v26 = *MEMORY[0x1E4F1BFA8];
  v42[2] = *MEMORY[0x1E4F1BFA8];
  v42[3] = v11;
  obuint64_t j = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  uint64_t v29 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v29)
  {
    uint64_t v27 = *(void *)v38;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v12;
        uint64_t v13 = *(void *)(*((void *)&v37 + 1) + 8 * v12);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v14 = [v28 userInfo];
        uint64_t v15 = [v14 objectForKey:v13];

        uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v34;
          BOOL v20 = v13 == v26 || v13 == v25;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v34 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              if (entityKindOfObject(v22) == 4)
              {
                if (v13 == v9)
                {
                  ++*a3;
                }
                else if (v13 == v10)
                {
                  ++*v32;
                }
                else if (v20)
                {
                  [v31 addObject:v22];
                }
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v17);
        }

        uint64_t v12 = v30 + 1;
      }
      while (v30 + 1 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v29);
  }
}

+ (id)allManagedObjectKeysStrategyWithContext:(id)a3
{
  id v6 = a3;
  id v3 = v6;
  pl_dispatch_once();
  id v4 = (id)allManagedObjectKeysStrategyWithContext__myStrategy;

  return v4;
}

void __70__PLChangeNotificationCenter_allManagedObjectKeysStrategyWithContext___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v1 = *(id *)(a1 + 32);
  v2 = [MEMORY[0x1E4F1CA80] set];
  id v3 = [v1 persistentStoreCoordinator];
  id v4 = [v3 managedObjectModel];

  if (!v4)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"+[PLChangeNotificationCenter allManagedObjectKeysStrategyWithContext:]_block_invoke"];
    [v16 handleFailureInFunction:v17 file:@"PLChangeNotificationCenter.m" lineNumber:544 description:@"NSManagedObjectModel is nil."];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = objc_msgSend(v4, "entities", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v18 + 1) + 8 * v9) propertiesByName];
        uint64_t v11 = [v10 allKeys];

        if (v11) {
          [v2 addObjectsFromArray:v11];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  id v12 = objc_alloc(MEMORY[0x1E4F1C100]);
  uint64_t v13 = [v2 allObjects];
  uint64_t v14 = [v12 initForKeys:v13];
  uint64_t v15 = (void *)allManagedObjectKeysStrategyWithContext__myStrategy;
  allManagedObjectKeysStrategyWithContext__myStrategy = v14;
}

@end