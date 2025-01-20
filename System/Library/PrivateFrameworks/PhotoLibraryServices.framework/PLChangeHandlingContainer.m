@interface PLChangeHandlingContainer
- (BOOL)isMergingCoalescedSaveNotification;
- (NSDictionary)allDidSaveObjectIDsUserInfo;
- (NSURL)libraryURL;
- (PLChangeHandlingContainer)initWithLibraryBundle:(id)a3 changePublisher:(id)a4 libraryServicesManager:(id)a5 persistentStoreCoordinator:(id)a6;
- (void)beginObservingChanges;
- (void)connectManagedObjectContext:(id)a3;
- (void)dealloc;
- (void)disconnectManagedObjectContext:(id)a3;
- (void)distributeChangesSinceLastCheckpoint;
- (void)endObservingChanges;
- (void)handleUnknownMergeEvent;
- (void)pauseLaunchEventNotifications;
- (void)publishRemoteChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 reply:(id)a5;
- (void)registerToReceiveCoreDataChanges:(id)a3;
- (void)start;
- (void)stop;
- (void)unpauseLaunchEventNotifications;
@end

@implementation PLChangeHandlingContainer

- (void)connectManagedObjectContext:(id)a3
{
}

- (void)beginObservingChanges
{
}

- (void)pauseLaunchEventNotifications
{
}

- (void)disconnectManagedObjectContext:(id)a3
{
}

- (void)start
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412546;
    uint64_t v5 = objc_opt_class();
    __int16 v6 = 2048;
    v7 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p start", (uint8_t *)&v4, 0x16u);
  }

  [(PLPersistentHistoryChangeDistributor *)self->_persistentHistoryChangeDistributor startObservingRemoteNotifications];
}

- (PLChangeHandlingContainer)initWithLibraryBundle:(id)a3 changePublisher:(id)a4 libraryServicesManager:(id)a5 persistentStoreCoordinator:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)PLChangeHandlingContainer;
  v14 = [(PLChangeHandlingContainer *)&v31 init];
  if (v14)
  {
    v15 = [v10 libraryURL];
    uint64_t v16 = [v15 copy];
    libraryURL = v14->_libraryURL;
    v14->_libraryURL = (NSURL *)v16;

    v18 = PLChangeHandlingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v14->_libraryURL;
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = (uint64_t)v19;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Creating PLChangeHandlingContainer for library URL: %@", buf, 0xCu);
    }

    v20 = objc_alloc_init(PLCoreDataChangeMerger);
    changeMerger = v14->_changeMerger;
    v14->_changeMerger = v20;

    objc_storeStrong((id *)&v14->_changePublisher, a4);
    v22 = [[PLChangeNode alloc] initWithLibraryURL:v14->_libraryURL changeMerger:v14->_changeMerger changePublisher:v14->_changePublisher libraryServicesManager:v12];
    changeNode = v14->_changeNode;
    v14->_changeNode = v22;

    v24 = [[PLPersistentHistoryChangeDistributor alloc] initWithPersistentStoreCoordinator:v13 bundle:v10 changeMerger:v14->_changeMerger];
    persistentHistoryChangeDistributor = v14->_persistentHistoryChangeDistributor;
    v14->_persistentHistoryChangeDistributor = v24;

    v26 = PLPhotosObjectLifecycleGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = objc_opt_class();
      v28 = v14->_libraryURL;
      *(_DWORD *)buf = 138412802;
      uint64_t v33 = v27;
      __int16 v34 = 2048;
      v35 = v14;
      __int16 v36 = 2112;
      v37 = v28;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEBUG, "%@ %p initWithLibraryURL:%@", buf, 0x20u);
    }

    v29 = v14;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_persistentHistoryChangeDistributor, 0);
  objc_storeStrong((id *)&self->_changePublisher, 0);
  objc_storeStrong((id *)&self->_changeMerger, 0);
  objc_storeStrong((id *)&self->_changeNode, 0);
}

- (NSURL)libraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)distributeChangesSinceLastCheckpoint
{
}

- (NSDictionary)allDidSaveObjectIDsUserInfo
{
  return [(PLCoreDataChangeMerger *)self->_changeMerger allDidSaveObjectIDsUserInfo];
}

- (BOOL)isMergingCoalescedSaveNotification
{
  return [(PLCoreDataChangeMerger *)self->_changeMerger isMergingCoalescedSaveNotification];
}

- (void)handleUnknownMergeEvent
{
}

- (void)publishRemoteChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 reply:(id)a5
{
}

- (void)registerToReceiveCoreDataChanges:(id)a3
{
}

- (void)unpauseLaunchEventNotifications
{
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2048;
    uint64_t v8 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PLChangeHandlingContainer;
  [(PLChangeHandlingContainer *)&v4 dealloc];
}

- (void)endObservingChanges
{
}

- (void)stop
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412546;
    uint64_t v5 = objc_opt_class();
    __int16 v6 = 2048;
    __int16 v7 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p stop", (uint8_t *)&v4, 0x16u);
  }

  [(PLPersistentHistoryChangeDistributor *)self->_persistentHistoryChangeDistributor stopObservingRemoteNotifications];
  [(PLPersistentHistoryChangeDistributor *)self->_persistentHistoryChangeDistributor invalidate];
  [(PLChangeNode *)self->_changeNode invalidate];
  [(PLCoreDataChangeMerger *)self->_changeMerger invalidate];
}

@end