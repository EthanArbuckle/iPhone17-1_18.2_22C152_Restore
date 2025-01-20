@interface PLCloudPersistentHistoryChangeTracker
- (BOOL)connectWithContext:(id)a3;
- (BOOL)hasChangeTrackerToken;
- (BOOL)isConnected;
- (NSString)lastKnownTokenDescription;
- (NSString)name;
- (PLCloudPersistentHistoryChangeTracker)initWithPersistentStoreCoordinator:(id)a3 libraryBundle:(id)a4;
- (PLCloudPersistentHistoryChangeTrackerDelegate)delegate;
- (id)_eventsResultFromPersistentHistoryToken:(id)a3 inContext:(id)a4;
- (id)currentToken;
- (id)fetchAllEventsInContext:(id)a3;
- (id)lastKnownTokenFromDisk;
- (void)_registerForChangeHandlingNotifications;
- (void)_unregisterForChangeHandlingNotifications;
- (void)_updateLastKnownTokensToToken:(id)a3;
- (void)changeTrackerDidReceiveChangesWithTransaction:(id)a3;
- (void)clearToken;
- (void)disconnect;
- (void)forceTokenToCurrent;
- (void)saveLastKnownChangeTrackerTokenToDiskWithContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateLastKnownTokenToResult:(id)a3;
@end

@implementation PLCloudPersistentHistoryChangeTracker

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_lastKnownToken, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PLCloudPersistentHistoryChangeTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLCloudPersistentHistoryChangeTrackerDelegate *)WeakRetained;
}

- (void)_updateLastKnownTokensToToken:(id)a3
{
  v4 = (NSPersistentHistoryToken *)[a3 copy];
  lastKnownToken = self->_lastKnownToken;
  self->_lastKnownToken = v4;
}

- (void)updateLastKnownTokenToResult:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 resultType])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PLCloudPersistentHistoryChangeTracker.m", 167, @"Invalid parameter not satisfying: %@", @"result.resultType == PLCloudChangeEventsResultSuccess" object file lineNumber description];
  }
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (!v7) {
    goto LABEL_9;
  }
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable _PLAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nullable __strong)");
    [v10 handleFailureInFunction:v11, @"PLHelperExtension.h", 78, @"Expected class of %@ but was %@", v6, objc_opt_class() file lineNumber description];

LABEL_9:
    id v9 = 0;
  }

  v12 = [v9 lastProcessedCoreDataToken];
  if (!*MEMORY[0x1E4F59AC0])
  {
    v13 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "Updating last known tokens from result token: %@", buf, 0xCu);
    }
  }
  if (v12) {
    [(PLCloudPersistentHistoryChangeTracker *)self _updateLastKnownTokensToToken:v12];
  }
}

- (void)forceTokenToCurrent
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [(NSPersistentStoreCoordinator *)self->_coordinator currentPersistentHistoryTokenFromStores:0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    v4 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Forcing last known tokens to current: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  [(PLCloudPersistentHistoryChangeTracker *)self _updateLastKnownTokensToToken:v3];
}

- (id)currentToken
{
  return [(NSPersistentStoreCoordinator *)self->_coordinator currentPersistentHistoryTokenFromStores:0];
}

- (id)fetchAllEventsInContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!*MEMORY[0x1E4F59AC0])
  {
    int v5 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      lastKnownToken = self->_lastKnownToken;
      int v9 = 138412290;
      v10 = lastKnownToken;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Fetch all events since token: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = [(PLCloudPersistentHistoryChangeTracker *)self _eventsResultFromPersistentHistoryToken:self->_lastKnownToken inContext:v4];

  return v7;
}

- (id)_eventsResultFromPersistentHistoryToken:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5 && !*MEMORY[0x1E4F59AC0])
  {
    uint64_t v7 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Token is nil so fetching ALL transactions", v10, 2u);
    }
  }
  v8 = +[PLCloudPersistentHistoryTransactionsResult fetchTransactionsSinceToken:v5 inContext:v6];

  return v8;
}

- (void)_unregisterForChangeHandlingNotifications
{
}

- (void)_registerForChangeHandlingNotifications
{
  [(PLCloudPersistentHistoryChangeTracker *)self _unregisterForChangeHandlingNotifications];
  objc_initWeak(&location, self);
  notificationObserver = self->_notificationObserver;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__PLCloudPersistentHistoryChangeTracker__registerForChangeHandlingNotifications__block_invoke;
  v4[3] = &unk_1E5872AF8;
  objc_copyWeak(&v5, &location);
  [(PLChangeHandlingNotificationObserver *)notificationObserver startObservingRemoteNotificationsWithBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __80__PLCloudPersistentHistoryChangeTracker__registerForChangeHandlingNotifications__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained changeTrackerDidReceiveChangesWithTransaction:v4];
}

- (void)changeTrackerDidReceiveChangesWithTransaction:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained cloudChangeTrackerDidReceiveChangesWithTransaction:v4];
}

- (BOOL)isConnected
{
  return 1;
}

- (void)disconnect
{
  [(PLCloudPersistentHistoryChangeTracker *)self clearToken];
  [(PLCloudPersistentHistoryChangeTracker *)self _unregisterForChangeHandlingNotifications];
}

- (void)saveLastKnownChangeTrackerTokenToDiskWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v5 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      lastKnownToken = self->_lastKnownToken;
      int v8 = 138412290;
      int v9 = lastKnownToken;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Saving last known token to disk: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained saveCloudTrackerToken:self->_lastKnownToken withContext:v4];
}

- (id)lastKnownTokenFromDisk
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained readCloudTrackerToken];

  if (!*MEMORY[0x1E4F59AC0])
  {
    id v4 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 138412290;
      uint64_t v7 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Last known token from disk: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

- (BOOL)connectWithContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLCloudPersistentHistoryChangeTracker *)self clearToken];
  [(PLCloudPersistentHistoryChangeTracker *)self _registerForChangeHandlingNotifications];
  id v5 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    int v6 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Registered for change handling notification", (uint8_t *)&v13, 2u);
    }
  }
  uint64_t v7 = [(PLCloudPersistentHistoryChangeTracker *)self lastKnownTokenFromDisk];
  if (!v7)
  {
    uint64_t v7 = [(PLCloudPersistentHistoryChangeTracker *)self currentToken];
  }
  uint64_t v8 = (NSPersistentHistoryToken *)[v7 copy];
  lastKnownToken = self->_lastKnownToken;
  self->_lastKnownToken = v8;

  if (!*v5)
  {
    uint64_t v10 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = self->_lastKnownToken;
      int v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Set initial last known tokens to: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  [(PLCloudPersistentHistoryChangeTracker *)self saveLastKnownChangeTrackerTokenToDiskWithContext:v4];

  return 1;
}

- (void)clearToken
{
  if (!*MEMORY[0x1E4F59AC0])
  {
    v3 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Clearing last known tokens", v5, 2u);
    }
  }
  lastKnownToken = self->_lastKnownToken;
  self->_lastKnownToken = 0;
}

- (NSString)lastKnownTokenDescription
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F59AC0])
  {
    v3 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      lastKnownToken = self->_lastKnownToken;
      int v7 = 136315394;
      uint64_t v8 = "-[PLCloudPersistentHistoryChangeTracker lastKnownTokenDescription]";
      __int16 v9 = 2112;
      uint64_t v10 = lastKnownToken;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  id v5 = [(NSPersistentHistoryToken *)self->_lastKnownToken description];
  return (NSString *)v5;
}

- (BOOL)hasChangeTrackerToken
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F59AC0])
  {
    v3 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      lastKnownToken = self->_lastKnownToken;
      int v6 = 136315394;
      int v7 = "-[PLCloudPersistentHistoryChangeTracker hasChangeTrackerToken]";
      __int16 v8 = 2112;
      __int16 v9 = lastKnownToken;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  return self->_lastKnownToken != 0;
}

- (NSString)name
{
  return (NSString *)@"Core Data Persistent History";
}

- (PLCloudPersistentHistoryChangeTracker)initWithPersistentStoreCoordinator:(id)a3 libraryBundle:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PLCloudPersistentHistoryChangeTracker;
  uint64_t v10 = [(PLCloudPersistentHistoryChangeTracker *)&v17 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_coordinator, a3);
    if (!v9)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v11, @"PLCloudPersistentHistoryChangeTracker.m", 43, @"Invalid parameter not satisfying: %@", @"bundle" object file lineNumber description];
    }
    uint64_t v12 = [v9 makeChangeHandlingNotificationObserverWithLowPriorityThrottleInterval:0.0];
    notificationObserver = v11->_notificationObserver;
    v11->_notificationObserver = (PLChangeHandlingNotificationObserver *)v12;

    v14 = v11;
  }

  return v11;
}

@end