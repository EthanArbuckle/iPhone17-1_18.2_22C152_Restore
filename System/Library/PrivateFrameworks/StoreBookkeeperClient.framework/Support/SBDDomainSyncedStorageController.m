@interface SBDDomainSyncedStorageController
+ (id)storageControllerForPlaybackPositionDomain:(id)a3;
- (BOOL)_databaseHasBookmarkableContents;
- (BOOL)_isEnabled;
- (BOOL)needsInitialSync;
- (BOOL)needsPoll;
- (BOOL)needsPull;
- (BOOL)needsPush;
- (NSNumber)lastSynchronizationFailureAccountIdentifier;
- (NSNumber)lastSynchronizedAccountIdentifier;
- (SBCPlaybackPositionDomain)playbackPositionDomain;
- (SBDDomainSyncedStorageController)initWithPlaybackPositionDomain:(id)a3;
- (id)accountIdentifier;
- (id)beginTransactionWithItemsToSyncEnumerationBlock:(id)a3;
- (id)readUbiquitousDatabaseMetadataValuesForIdentifiers:(id)a3 clientIdentity:(id)a4;
- (void)_onOperationQueue_scheduleSyncBeforeDate:(id)a3 isCheckpoint:(BOOL)a4;
- (void)addStorageObserver:(id)a3;
- (void)cancelUniversalPlaybackPositionTransaction:(id)a3;
- (void)commitUniversalPlaybackPositionTransaction:(id)a3 domainVersion:(id)a4 metadataEnumerationBlock:(id)a5;
- (void)deletePlaybackPositionEntity:(id)a3 clientIdentity:(id)a4;
- (void)persistPlaybackPositionEntity:(id)a3 clientIdentity:(id)a4 completionBlock:(id)a5;
- (void)removeStorageObserver:(id)a3;
- (void)synchronizeBeforeDate:(id)a3 isCheckpoint:(BOOL)a4;
- (void)synchronizeForChangedAccountByResetInvalidatingLocalChanges:(BOOL)a3 beforeDate:(id)a4;
- (void)synchronizeForUpdatedRemoteDomainVersion:(id)a3 beforeDate:(id)a4;
- (void)synchronizeImmediatelyWithCompletionHandler:(id)a3;
- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3 clientIdentity:(id)a4;
@end

@implementation SBDDomainSyncedStorageController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackPositionDomain, 0);
  objc_storeStrong((id *)&self->_targetSyncDate, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_musicLibrary, 0);
  objc_storeStrong((id *)&self->_ubiquitousDatabase, 0);
  objc_storeStrong((id *)&self->_uppStore, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (SBCPlaybackPositionDomain)playbackPositionDomain
{
  return self->_playbackPositionDomain;
}

- (void)commitUniversalPlaybackPositionTransaction:(id)a3 domainVersion:(id)a4 metadataEnumerationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(ML3MusicLibrary *)self->_musicLibrary SBKCommitUniversalPlaybackPositionTransaction:v8 domainVersion:v9 metadataEnumerationBlock:v10];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_10000774C;
  v25 = sub_10000775C;
  id v26 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007764;
  block[3] = &unk_100020FD8;
  block[4] = self;
  block[5] = &v21;
  dispatch_sync((dispatch_queue_t)queue, block);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = (id)v22[5];
  id v13 = [v12 countByEnumeratingWithState:&v16 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v15), "bookkeeperStorageControllerDidSync:", self, (void)v16);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v16 objects:v27 count:16];
    }
    while (v13);
  }

  _Block_object_dispose(&v21, 8);
}

- (void)cancelUniversalPlaybackPositionTransaction:(id)a3
{
}

- (id)beginTransactionWithItemsToSyncEnumerationBlock:(id)a3
{
  id v4 = a3;
  if ([(SBDDomainSyncedStorageController *)self _isEnabled])
  {
    v5 = [(ML3MusicLibrary *)self->_musicLibrary SBKBeginTransactionWithItemsToSyncEnumerationBlock:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isEnabled
{
  return self->_musicLibrary != 0;
}

- (BOOL)_databaseHasBookmarkableContents
{
  v3 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyRememberBookmarkTime equalToValue:&__kCFBooleanTrue];
  id v4 = +[ML3Track anyInLibrary:self->_musicLibrary predicate:v3];
  LOBYTE(self) = v4 != 0;

  return (char)self;
}

- (id)accountIdentifier
{
  v2 = [(ML3MusicLibrary *)self->_musicLibrary databasePath];
  v3 = SBKStoreAccountIdentifierFromDatabasePath();

  return v3;
}

- (void)_onOperationQueue_scheduleSyncBeforeDate:(id)a3 isCheckpoint:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [v6 timeIntervalSinceNow];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "received request to scheduleSyncBeforeDate: %@ (in %.2f sec)", buf, 0x16u);
  }

  id v9 = +[NSDate date];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v42 = sub_10000774C;
  v43 = sub_10000775C;
  id v44 = 0;
  ubiquitousDatabase = self->_ubiquitousDatabase;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100007CDC;
  v35[3] = &unk_1000209E0;
  v35[4] = self;
  id v11 = v6;
  id v36 = v11;
  v38 = buf;
  id v12 = v9;
  id v37 = v12;
  [(SBDML3UbiquitousDatabase *)ubiquitousDatabase updateUbiquitousDatabaseByPerformingWriteTransactionWithBlock:v35];
  uint64_t v31 = 0;
  v32 = (double *)&v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  queue = self->_queue;
  uint64_t v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_100007FD4;
  id v26 = &unk_100020A08;
  v29 = buf;
  id v14 = v12;
  v30 = &v31;
  id v27 = v14;
  v28 = self;
  dispatch_sync((dispatch_queue_t)queue, &v23);
  double v15 = v32[3];
  long long v16 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (v15 <= 0.0)
  {
    if (v17)
    {
      *(_WORD *)v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "scheduling sync NOW.", v39, 2u);
    }

    accountIdentifier = self->_accountIdentifier;
    v20 = +[SBKStoreURLBagContext UPPDomainIdentifier];
    uint64_t v21 = +[SBDJobScheduler jobSchedulerForAccount:accountIdentifier withDomain:v20];
    [v21 scheduleUpdateJobWithTimeInterval:1 replaceExisting:-1.0];
  }
  else
  {
    if (v17)
    {
      uint64_t v18 = *((void *)v32 + 3);
      *(_DWORD *)v39 = 134217984;
      uint64_t v40 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "scheduling sync (via BackgroundTaskJob) %f seconds from now...", v39, 0xCu);
    }

    long long v19 = self->_accountIdentifier;
    v20 = +[SBKStoreURLBagContext UPPDomainIdentifier];
    uint64_t v21 = +[SBDJobScheduler jobSchedulerForAccount:v19 withDomain:v20];
    [v21 scheduleUpdateJobWithTimeInterval:!v4 replaceExisting:v32[3]];
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(buf, 8);
}

- (void)removeStorageObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008114;
  v7[3] = &unk_100020FB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)addStorageObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000081B8;
  v7[3] = &unk_100020FB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (NSNumber)lastSynchronizationFailureAccountIdentifier
{
  return (NSNumber *)_SBKStoreAccountLastFailedSyncIdentifier(self, a2);
}

- (NSNumber)lastSynchronizedAccountIdentifier
{
  return (NSNumber *)_SBKStoreAccountLastSyncedIdentifier(self, a2);
}

- (id)readUbiquitousDatabaseMetadataValuesForIdentifiers:(id)a3 clientIdentity:(id)a4
{
  return [(SBDML3UbiquitousDatabase *)self->_ubiquitousDatabase readUbiquitousDatabaseMetadataValuesWithClientIdentity:a4 identifiers:a3];
}

- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3 clientIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  operationQueue = self->_operationQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000082A8;
  v11[3] = &unk_100020F60;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v11];
}

- (void)deletePlaybackPositionEntity:(id)a3 clientIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  operationQueue = self->_operationQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000083B8;
  v11[3] = &unk_100020F60;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v11];
}

- (void)persistPlaybackPositionEntity:(id)a3 clientIdentity:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  operationQueue = self->_operationQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000084E4;
  v15[3] = &unk_100021028;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v15];
}

- (void)synchronizeImmediatelyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "running synchronizeImmediatelyWithCompletionHandler: now", buf, 2u);
  }

  operationQueue = self->_operationQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008638;
  v8[3] = &unk_100021000;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v8];
}

- (void)synchronizeForChangedAccountByResetInvalidatingLocalChanges:(BOOL)a3 beforeDate:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = &stru_100021400;
    if (v4) {
      CFStringRef v8 = @" and clear last-sync revision number";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "received request handle account change (set sync anchor to 0%@)", buf, 0xCu);
  }

  operationQueue = self->_operationQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000087F0;
  v11[3] = &unk_100020968;
  BOOL v13 = v4;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v11];
}

- (void)synchronizeForUpdatedRemoteDomainVersion:(id)a3 beforeDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "received request update for domain version change to version: %@", buf, 0xCu);
  }

  operationQueue = self->_operationQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008B00;
  v12[3] = &unk_100020F60;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v12];
}

- (void)synchronizeBeforeDate:(id)a3 isCheckpoint:(BOOL)a4
{
  id v6 = a3;
  operationQueue = self->_operationQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008D7C;
  v9[3] = &unk_100020968;
  v9[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v9];
}

- (BOOL)needsInitialSync
{
  return ![(SBDML3UbiquitousDatabase *)self->_ubiquitousDatabase hasSyncedAtleastOnce];
}

- (BOOL)needsPush
{
  return [(SBDML3UbiquitousDatabase *)self->_ubiquitousDatabase hasLocalChangesToPush];
}

- (BOOL)needsPull
{
  return [(SBDML3UbiquitousDatabase *)self->_ubiquitousDatabase hasRemoteChangesToPull];
}

- (BOOL)needsPoll
{
  uint64_t v25 = 0;
  id v26 = (double *)&v25;
  uint64_t v27 = 0x2020000000;
  unint64_t v28 = 0xBFF0000000000000;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uppStore = self->_uppStore;
  long long v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  uint64_t v21 = sub_100009084;
  v22 = &unk_100020940;
  uint64_t v24 = &v25;
  v5 = v3;
  uint64_t v23 = v5;
  [(SBKUniversalPlaybackPositionStore *)uppStore loadBagContextWithCompletionBlock:&v19];
  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v5, v6);
  if (v26[3] >= -1.0)
  {
    id v9 = [(SBDML3UbiquitousDatabase *)self->_ubiquitousDatabase dateLastSynced];
    id v7 = v9;
    if (v9)
    {
      [v9 timeIntervalSinceReferenceDate];
      double v11 = v10;
      double v12 = v26[3];
      id v13 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        id v14 = +[NSNumber numberWithDouble:v26[3]];
        CFStringRef v15 = +[NSNumber numberWithDouble:v11];
        *(_DWORD *)buf = 138412802;
        v30 = v14;
        __int16 v31 = 2112;
        v32 = v7;
        __int16 v33 = 2112;
        uint64_t v34 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "checking needsPoll, pollIntervalInSeconds = %@, lastSynced = %@ (%@)", buf, 0x20u);
      }
      id v16 = +[NSDate date];
      [v16 timeIntervalSinceReferenceDate];
      BOOL v8 = v11 + v12 < v17;
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    id v7 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "unable to load bag and determine polling interval", buf, 2u);
    }
    BOOL v8 = 0;
  }

  _Block_object_dispose(&v25, 8);
  return v8;
}

- (SBDDomainSyncedStorageController)initWithPlaybackPositionDomain:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SBDDomainSyncedStorageController;
  v5 = [(SBDDomainSyncedStorageController *)&v26 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create(0, 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    id v8 = objc_alloc((Class)ML3MusicLibrary);
    id v9 = [v4 foreignDatabasePath];
    double v10 = (ML3MusicLibrary *)[v8 initWithPath:v9];
    musicLibrary = v5->_musicLibrary;
    v5->_musicLibrary = v10;

    uint64_t v12 = [(ML3MusicLibrary *)v5->_musicLibrary uppDatabase];
    ubiquitousDatabase = v5->_ubiquitousDatabase;
    v5->_ubiquitousDatabase = (SBDML3UbiquitousDatabase *)v12;

    id v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    observers = v5->_observers;
    v5->_observers = v14;

    id v16 = [v4 foreignDatabasePath];
    uint64_t v17 = SBKStoreAccountIdentifierFromDatabasePath();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSNumber *)v17;

    id v19 = objc_alloc((Class)SBKUniversalPlaybackPositionStore);
    uint64_t v20 = +[SBKStoreURLBagContext UPPDomainIdentifier];
    uint64_t v21 = (SBKUniversalPlaybackPositionStore *)[v19 initWithDomain:v20 dataSource:v5 automaticSynchronizeOptions:0 accountIdentifier:v5->_accountIdentifier isActive:0];
    uppStore = v5->_uppStore;
    v5->_uppStore = v21;

    uint64_t v23 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v23;

    [(NSOperationQueue *)v5->_operationQueue setMaxConcurrentOperationCount:1];
  }

  return v5;
}

+ (id)storageControllerForPlaybackPositionDomain:(id)a3
{
  id v3 = a3;
  if (qword_100027878 != -1) {
    dispatch_once(&qword_100027878, &stru_100020918);
  }
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_10000774C;
  CFStringRef v15 = sub_10000775C;
  id v16 = 0;
  id v4 = qword_100027880;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100009388;
  v8[3] = &unk_100020FD8;
  id v9 = v3;
  double v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end