@interface PDUbiquityManager
+ (void)removeLastEventIdentifier;
- (BOOL)_queue_startNotYetUbiquitousWithDestinationURL:(id)a3;
- (BOOL)passWillBeDeleted:(id)a3;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (NSURL)ubiquitousURL;
- (PDUbiquityManager)initWithDelegate:(id)a3;
- (PDUbiquityManagerDelegate)delegate;
- (id)_queue_passUniqueIDs;
- (id)_urlForCardWithUniqueID:(id)a3 relativeToDirectoryURL:(id)a4;
- (id)_urlForCatalogRelativeToDirectoryURL:(id)a3;
- (id)lastPresentedItemEventIdentifier;
- (void)_attemptCoordinatedReadWithoutChangesAtURL:(id)a3 withAccessor:(id)a4;
- (void)_handleUbiquityIdentityChanged:(id)a3;
- (void)_queue_addToFilePresenter;
- (void)_queue_addedToFilePresenter;
- (void)_queue_compareCatalogsAndTakeNewerVersion;
- (void)_queue_comparePassesAndTakeNewerVersion:(id)a3;
- (void)_queue_copyCatalogToLocalStore:(id)a3;
- (void)_queue_copyCatalogToUbiquity:(id)a3;
- (void)_queue_copyPassesFromLocalStoreToUbiquity:(id)a3;
- (void)_queue_copyPassesFromUbiquityToLocalStore:(id)a3;
- (void)_queue_handleCatalogUpdate;
- (void)_queue_handlePassUpdate:(id)a3;
- (void)_queue_mergeUbiquityWithLocalStore;
- (void)_queue_removeFromFilePresenter;
- (void)_queue_resolveURLIfNecessary:(id)a3;
- (void)_queue_resolveURLIfNecessary:(id)a3 fileCoordinator:(id)a4;
- (void)_queue_startAlreadyUbiquitous;
- (void)_queue_startWithTokenFinishedWithFinalState:(int)a3;
- (void)_startWithToken:(unsigned int)a3;
- (void)accommodatePresentedSubitemDeletionAtURL:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)prepareToRemoveUbiquitousPassWithUniqueID:(id)a3;
- (void)presentedItemDidGainVersion:(id)a3;
- (void)presentedItemDidMoveToURL:(id)a3;
- (void)presentedSubitemDidAppearAtURL:(id)a3;
- (void)presentedSubitemDidChangeAtURL:(id)a3;
- (void)removeUbiquitousPassWithUniqueID:(id)a3 completed:(BOOL)a4;
- (void)restart;
- (void)setDelegate:(id)a3;
- (void)setLastPresentedItemEventIdentifier:(unint64_t)a3;
- (void)setUbiquitousURL:(id)a3;
- (void)start;
- (void)updateUbiquitousCatalog:(id)a3;
- (void)updateUbiquitousPass:(id)a3;
@end

@implementation PDUbiquityManager

- (PDUbiquityManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PDUbiquityManager;
  v5 = [(PDUbiquityManager *)&v23 init];
  v6 = v5;
  if (v5)
  {
    [(PDUbiquityManager *)v5 setDelegate:v4];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, -1);

    dispatch_queue_t v9 = dispatch_queue_create("ubiquityManager", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("ubiquityManager.access", v8);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v11;

    v13 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    filesModified = v6->_filesModified;
    v6->_filesModified = v13;

    v15 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    filesToWrite = v6->_filesToWrite;
    v6->_filesToWrite = v15;

    v17 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    filesToDelete = v6->_filesToDelete;
    v6->_filesToDelete = v17;

    v19 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = v19;

    [(NSOperationQueue *)v6->_operationQueue setMaxConcurrentOperationCount:1];
    v21 = +[NSNotificationCenter defaultCenter];
    [v21 addObserver:v6 selector:"_handleUbiquityIdentityChanged:" name:NSUbiquityIdentityDidChangeNotification object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSUbiquityIdentityDidChangeNotification object:0];

  +[NSFileCoordinator removeFilePresenter:self];
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  v4.receiver = self;
  v4.super_class = (Class)PDUbiquityManager;
  [(PDUbiquityManager *)&v4 dealloc];
}

+ (void)removeLastEventIdentifier
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Removing cached FSEventIdentifier", v3, 2u);
  }

  PKSharedCacheRemoveObjectForKey();
}

- (void)start
{
}

- (void)_startWithToken:(unsigned int)a3
{
  v5 = (void *)PDOSTransactionCreate("PDUbiquityManager");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FE600;
  block[3] = &unk_100738A28;
  id v9 = v5;
  v10 = self;
  unsigned int v11 = a3;
  id v7 = v5;
  dispatch_async(queue, block);
}

- (void)restart
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_canStart);
  if (v2)
  {
    objc_super v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting ubiquity manager", v6, 2u);
    }

    unsigned int add = atomic_fetch_add((atomic_uint *volatile)&self->_ubiquityStartToken, 1u);
    atomic_store(0, (unsigned int *)&self->_ubiquityState);
    [(PDUbiquityManager *)self _startWithToken:add + 1];
  }
}

- (void)updateUbiquitousPass:(id)a3
{
  id v4 = a3;
  if ((PKCloudKitPassSyncEnabled() & 1) == 0)
  {
    v5 = [v4 uniqueID];
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001FEE30;
    block[3] = &unk_10072E198;
    void block[4] = self;
    id v7 = v5;
    id v18 = v7;
    dispatch_sync(accessQueue, block);
    v8 = (void *)PDOSTransactionCreate("PDUbiquityManager");
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001FEE3C;
    v12[3] = &unk_100730198;
    id v13 = v8;
    v14 = self;
    id v15 = v7;
    id v16 = v4;
    id v10 = v7;
    id v11 = v8;
    dispatch_async(queue, v12);
  }
}

- (BOOL)passWillBeDeleted:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FF6CC;
  block[3] = &unk_100731208;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)accessQueue;
}

- (void)prepareToRemoveUbiquitousPassWithUniqueID:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001FF7A4;
  v7[3] = &unk_10072E198;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

- (void)removeUbiquitousPassWithUniqueID:(id)a3 completed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)PDOSTransactionCreate("PDUbiquityManager");
  id v8 = v7;
  if (v4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001FF8E0;
    block[3] = &unk_10072E238;
    id v17 = v7;
    id v18 = self;
    id v19 = v6;
    id v10 = v6;
    dispatch_async(queue, block);

    uint64_t v11 = v17;
  }
  else
  {
    accessQueue = self->_accessQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001FFC44;
    v14[3] = &unk_10072E198;
    v14[4] = self;
    id v15 = v6;
    id v13 = v6;
    dispatch_sync(accessQueue, v14);
    uint64_t v11 = v15;
  }
}

- (void)updateUbiquitousCatalog:(id)a3
{
  id v4 = a3;
  v5 = (void *)PDOSTransactionCreate("PDUbiquityManager");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FFD1C;
  block[3] = &unk_10072E238;
  id v10 = v5;
  uint64_t v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(queue, block);
}

- (void)_handleUbiquityIdentityChanged:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ubiquity Identity changed.", v5, 2u);
  }

  [(PDUbiquityManager *)self restart];
}

- (id)_urlForCardWithUniqueID:(id)a3 relativeToDirectoryURL:(id)a4
{
  if (a3)
  {
    id v4 = [a4 URLByAppendingPathComponent:a3 isDirectory:0];
    v5 = [v4 URLByAppendingPathExtension:PKRawPassExtension];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_urlForCatalogRelativeToDirectoryURL:(id)a3
{
  return [a3 URLByAppendingPathComponent:@"CatalogOfRecord.plist" isDirectory:0];
}

- (void)_attemptCoordinatedReadWithoutChangesAtURL:(id)a3 withAccessor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting coordinated read at URL %@", buf, 0xCu);
  }

  id v9 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:self];
  id v18 = 0;
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_100200200;
  id v16 = &unk_10073FDE8;
  id v10 = v7;
  id v17 = v10;
  [v9 coordinateReadingItemAtURL:v6 options:1 error:&v18 byAccessor:&v13];
  id v11 = v18;
  if (v11)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = objc_msgSend(v11, "localizedDescription", v13, v14, v15, v16);
      *(_DWORD *)buf = 138412290;
      id v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Coordinated read failed with error: %@", buf, 0xCu);
    }
  }
}

- (void)_queue_startAlreadyUbiquitous
{
  uint64_t v3 = PKSharedCacheGetNumberForKey();

  uint64_t v4 = PKSharedCacheGetStringForKey();
  v5 = self->_ubiquitousURL;
  id v6 = v5;
  memset(&dev, 0, sizeof(dev));
  if (v5
    && ([(NSURL *)v5 path],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = stat((const char *)[v7 cStringUsingEncoding:4], &dev),
        v7,
        !v8)
    && (CFUUIDRef v18 = FSEventsCopyUUIDForDevice(dev.st_dev)) != 0)
  {
    CFUUIDRef v19 = v18;
    id v9 = (__CFString *)CFUUIDCreateString(0, v18);
    CFRelease(v19);
  }
  else
  {
    id v9 = 0;
  }

  FSEventStreamEventId CurrentEventId = FSEventsGetCurrentEventId();
  if (v4 | v3)
  {
    if (v4)
    {
      id v11 = (__CFString *)(id)v4;
      id v12 = v9;
      if (v11 == v12)
      {

LABEL_17:
        if ((unint64_t)-[PDUbiquityManager lastPresentedItemEventIdentifier]_0() <= CurrentEventId)
        {
          int v15 = 0;
          goto LABEL_29;
        }
        id v16 = PKLogFacilityTypeGetObject();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_13;
        }
        LOWORD(dev.st_dev) = 0;
        id v17 = "We need to do a ubiquity merge because the last FSEventStreamEventId we were told about is inconsistent wi"
              "th the current event ID...";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&dev, 2u);
LABEL_13:
        int v15 = 1;
        goto LABEL_25;
      }
      id v13 = v12;
      if (v12)
      {
        unsigned __int8 v14 = [(__CFString *)v11 isEqualToString:v12];

        if ((v14 & 1) == 0) {
          goto LABEL_22;
        }
        goto LABEL_17;
      }
    }
LABEL_22:
    id v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(dev.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Detected FSEventDeviceUUID change, forcing event ID update", (uint8_t *)&dev, 2u);
    }
    int v15 = 0;
    goto LABEL_25;
  }
  int v15 = 1;
  id v16 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(dev.st_dev) = 0;
    id v17 = "We need to merge because there is no cached FSEvent Identifier...";
    goto LABEL_12;
  }
LABEL_25:

  if (v9) {
    PKSharedCacheSetObjectForKey();
  }
  else {
    PKSharedCacheRemoveObjectForKey();
  }
  sub_100200698(CurrentEventId);
LABEL_29:
  if (PKSharedCacheGetBoolForKey())
  {
    PKSharedCacheSetBoolForKey();
    id v20 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(dev.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "We need to merge because Passbook sync was off but is now on...", (uint8_t *)&dev, 2u);
    }

    [(PDUbiquityManager *)self _queue_addToFilePresenter];
    goto LABEL_34;
  }
  [(PDUbiquityManager *)self _queue_addToFilePresenter];
  if (v15) {
LABEL_34:
  }
    [(PDUbiquityManager *)self _queue_mergeUbiquityWithLocalStore];
}

- (id)lastPresentedItemEventIdentifier
{
  v0 = PKSharedCacheGetNumberForKey();
  id v1 = [v0 unsignedLongLongValue];

  unsigned __int8 v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    id v5 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "returning last event identifier: %llu", (uint8_t *)&v4, 0xCu);
  }

  return v1;
}

- (BOOL)_queue_startNotYetUbiquitousWithDestinationURL:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  id v5 = sub_100200938();
  id v6 = +[NSFileManager defaultManager];
  [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:0];
  id v7 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:self];
  id v23 = 0;
  unsigned __int8 v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_1002009B4;
  id v17 = &unk_10073FE10;
  id v8 = v5;
  id v18 = v8;
  id v9 = v4;
  id v19 = v9;
  id v10 = v6;
  v21 = self;
  v22 = &v24;
  id v20 = v10;
  [v7 coordinateWritingItemAtURL:v8 options:2 writingItemAtURL:v9 options:8 error:&v23 byAccessor:&v14];
  id v11 = v23;
  if (*((unsigned char *)v25 + 24))
  {
    [(PDUbiquityManager *)self _queue_addToFilePresenter];
    BOOL v12 = *((unsigned char *)v25 + 24) != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  _Block_object_dispose(&v24, 8);
  return v12;
}

- (void)_queue_startWithTokenFinishedWithFinalState:(int)a3
{
  if (a3 != 2)
  {
    uint64_t v13 = v3;
    uint64_t v14 = v4;
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Ubiquity failed to start or was stopped - performing clean up", buf, 2u);
    }

    [(PDUbiquityManager *)self _queue_removeFromFilePresenter];
    PKSharedCacheRemoveObjectForKey();
    int v8 = 1;
    PKSharedCacheSetBoolForKey();
    id v9 = [(PDUbiquityManager *)self ubiquitousURL];
    if (v9)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Evicting ubiquity container", v11, 2u);
      }

      id v10 = +[NSFileManager defaultManager];
      [v10 evictUbiquitousItemAtURL:v9 error:0];

      [(PDUbiquityManager *)self setUbiquitousURL:0];
    }
    atomic_compare_exchange_strong(&self->_ubiquityState, (unsigned int *)&v8, a3);
  }
}

- (void)_queue_mergeUbiquityWithLocalStore
{
  uint64_t v3 = (void *)PDOSTransactionCreate("PDUbiquityManager");
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "merging ubiquitous store and local store", (uint8_t *)&v11, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained existingCardUniqueIDs];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    BOOL v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "local uniqueIDs: %@", (uint8_t *)&v11, 0xCu);
  }

  id v7 = [(PDUbiquityManager *)self _queue_passUniqueIDs];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    BOOL v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ubiquitous uniqueIDs: %@", (uint8_t *)&v11, 0xCu);
  }

  id v8 = [v7 mutableCopy];
  [v8 removeObjectsInArray:v6];
  id v9 = [v6 mutableCopy];
  [v9 removeObjectsInArray:v7];
  id v10 = [v7 mutableCopy];
  [v10 removeObjectsInArray:v8];
  [v10 removeObjectsInArray:v9];
  [(PDUbiquityManager *)self _queue_copyPassesFromUbiquityToLocalStore:v8];
  if ((PKCloudKitPassSyncEnabled() & 1) == 0) {
    [(PDUbiquityManager *)self _queue_copyPassesFromLocalStoreToUbiquity:v9];
  }
  [(PDUbiquityManager *)self _queue_comparePassesAndTakeNewerVersion:v10];
  [(PDUbiquityManager *)self _queue_compareCatalogsAndTakeNewerVersion];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Done merging", (uint8_t *)&v11, 2u);
  }
}

- (id)_queue_passUniqueIDs
{
  uint64_t v3 = [(PDUbiquityManager *)self ubiquitousURL];
  if (!v3 || (char BoolForKey = PKSharedCacheGetBoolForKey(), v3, (BoolForKey & 1) != 0))
  {
    id v17 = 0;
    goto LABEL_19;
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  char v27 = sub_1000209DC;
  v28 = sub_100020FE0;
  id v29 = 0;
  id v5 = [(PDUbiquityManager *)self ubiquitousURL];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100201234;
  v23[3] = &unk_1007393B0;
  v23[4] = &v24;
  [(PDUbiquityManager *)self _attemptCoordinatedReadWithoutChangesAtURL:v5 withAccessor:v23];

  id v17 = objc_alloc_init((Class)NSMutableArray);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = (id)v25[5];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (!v7) {
    goto LABEL_18;
  }
  uint64_t v8 = *(void *)v20;
  uint64_t v9 = PKRawPassExtension;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v6);
      }
      int v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      id v18 = 0;
      [v11 getResourceValue:&v18 forKey:NSURLUbiquitousItemDownloadingStatusKey error:0];
      id v12 = v18;
      uint64_t v13 = [v11 pathExtension];
      if (![v13 isEqualToString:v9]) {
        goto LABEL_15;
      }
      if (!v12)
      {

LABEL_14:
        uint64_t v13 = [v11 lastPathComponent];
        uint64_t v15 = [v13 stringByDeletingPathExtension];
        [v17 addObject:v15];

LABEL_15:
        goto LABEL_16;
      }
      unsigned __int8 v14 = [v12 isEqualToString:NSURLUbiquitousItemDownloadingStatusCurrent];

      if (v14) {
        goto LABEL_14;
      }
LABEL_16:
    }
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v30 count:16];
  }
  while (v7);
LABEL_18:

  _Block_object_dispose(&v24, 8);
LABEL_19:
  return v17;
}

- (void)_queue_copyPassesFromUbiquityToLocalStore:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Copying ubiquitous cards to local store:", buf, 2u);
  }
  oslog = v5;

  *(void *)buf = 0;
  uint64_t v24 = buf;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
LABEL_5:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * v8);
      id v10 = [(PDUbiquityManager *)self ubiquitousURL];
      uint64_t v11 = [(PDUbiquityManager *)self _urlForCardWithUniqueID:v9 relativeToDirectoryURL:v10];

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100201670;
      v16[3] = &unk_1007394C8;
      id v18 = buf;
      v16[4] = self;
      v16[5] = v9;
      id v12 = (id)v11;
      id v17 = v12;
      [(PDUbiquityManager *)self _attemptCoordinatedReadWithoutChangesAtURL:v12 withAccessor:v16];
      LOBYTE(v11) = v24[24] == 0;

      if ((v11 & 1) == 0) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v6) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  if (v24[24])
  {
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "\tTerminating copy of ubiquitous cards to local store.", v15, 2u);
    }
  }
  _Block_object_dispose(buf, 8);
}

- (void)_queue_copyPassesFromLocalStoreToUbiquity:(id)a3
{
  id v4 = a3;
  id v5 = [(PDUbiquityManager *)self ubiquitousURL];
  if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Copying local cards to ubiquity:", buf, 2u);
    }

    id v7 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:self];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100201994;
    v8[3] = &unk_100739388;
    id v9 = v4;
    id v10 = self;
    [v7 coordinateWritingItemAtURL:v5 options:8 error:0 byAccessor:v8];
  }
}

- (void)_queue_comparePassesAndTakeNewerVersion:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Comparing ubiquitous cards to local cards:", buf, 2u);
  }
  oslog = v5;

  id v18 = +[NSMutableArray array];
  long long v19 = +[NSMutableArray array];
  *(void *)buf = 0;
  v31 = buf;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v27;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        uint64_t v11 = [WeakRetained existingCardWithUniqueID:v9];

        if (v11)
        {
          id v12 = [(PDUbiquityManager *)self ubiquitousURL];
          uint64_t v13 = [(PDUbiquityManager *)self _urlForCardWithUniqueID:v9 relativeToDirectoryURL:v12];

          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_100201F70;
          v20[3] = &unk_10073FE38;
          uint64_t v25 = buf;
          v20[4] = self;
          id v21 = v11;
          uint64_t v22 = v9;
          id v23 = v18;
          id v24 = v19;
          [(PDUbiquityManager *)self _attemptCoordinatedReadWithoutChangesAtURL:v13 withAccessor:v20];
        }
        else
        {
          [v19 addObject:v9];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v6);
  }

  int v14 = v31[24];
  BOOL v15 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v15)
    {
      *(_WORD *)v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "\tTerminating ubiquity to local comparison.", v34, 2u);
    }
  }
  else
  {
    if (v15)
    {
      *(_DWORD *)v34 = 138412290;
      v35 = v19;
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Local cards to update from ubiquity: %@", v34, 0xCu);
    }

    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 138412290;
      v35 = v18;
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Ubiquity cards to update from local: %@", v34, 0xCu);
    }

    [(PDUbiquityManager *)self _queue_copyPassesFromUbiquityToLocalStore:v19];
    if ((PKCloudKitPassSyncEnabled() & 1) == 0) {
      [(PDUbiquityManager *)self _queue_copyPassesFromLocalStoreToUbiquity:v18];
    }
  }
  _Block_object_dispose(buf, 8);
}

- (void)_queue_compareCatalogsAndTakeNewerVersion
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_1000209DC;
  id v24 = sub_100020FE0;
  id v25 = 0;
  uint64_t v3 = [(PDUbiquityManager *)self ubiquitousURL];
  id v4 = [(PDUbiquityManager *)self _urlForCatalogRelativeToDirectoryURL:v3];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100202474;
  v19[3] = &unk_10073FE60;
  v19[4] = self;
  v19[5] = &v20;
  [(PDUbiquityManager *)self _attemptCoordinatedReadWithoutChangesAtURL:v4 withAccessor:v19];
  if (atomic_load((unsigned int *)&self->_ubiquityState))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v7 = [WeakRetained existingCatalog];

    uint64_t v8 = (void *)v21[5];
    if (v7)
    {
      uint64_t v9 = PKLogFacilityTypeGetObject();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (!v8)
      {
        if (v10)
        {
          *(_DWORD *)buf = 138412290;
          long long v27 = v7;
          uint64_t v13 = "Taking local catalog because there is no ubiquitous catalog: %@";
          int v14 = v9;
          uint32_t v15 = 12;
          goto LABEL_14;
        }
LABEL_15:

        [(PDUbiquityManager *)self _queue_copyCatalogToUbiquity:v7];
        goto LABEL_20;
      }
      if (v10)
      {
        *(_DWORD *)buf = 138412546;
        long long v27 = v7;
        __int16 v28 = 2112;
        long long v29 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Comparing local and ubiquitous catalogs\nLocal: %@\nUbiquitous: %@", buf, 0x16u);
      }

      unsigned int v11 = [v7 isNewerThanCatalog:v21[5]];
      BOOL v12 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v12)
        {
          *(_WORD *)buf = 0;
          uint64_t v13 = "Taking local catalog.";
          int v14 = v9;
          uint32_t v15 = 2;
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
      if (v12)
      {
        *(_WORD *)buf = 0;
        id v16 = "Taking ubiquitous catalog.";
        id v17 = v9;
        uint32_t v18 = 2;
        goto LABEL_18;
      }
    }
    else
    {
      if (!v8)
      {
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v27 = v8;
        id v16 = "Taking ubiquitous catalog because there is no local catalog: %@";
        id v17 = v9;
        uint32_t v18 = 12;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }

    [(PDUbiquityManager *)self _queue_copyCatalogToLocalStore:v21[5]];
    goto LABEL_20;
  }
LABEL_21:

  _Block_object_dispose(&v20, 8);
}

- (void)_queue_handlePassUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(PDUbiquityManager *)self ubiquitousURL];
  id v6 = [(PDUbiquityManager *)self _urlForCardWithUniqueID:v4 relativeToDirectoryURL:v5];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100202604;
  v9[3] = &unk_10073FD80;
  v9[4] = self;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  [(PDUbiquityManager *)self _attemptCoordinatedReadWithoutChangesAtURL:v8 withAccessor:v9];
}

- (void)_queue_handleCatalogUpdate
{
  uint64_t v3 = [(PDUbiquityManager *)self ubiquitousURL];
  id v4 = [(PDUbiquityManager *)self _urlForCatalogRelativeToDirectoryURL:v3];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100202DF0;
  v5[3] = &unk_1007394A0;
  v5[4] = self;
  [(PDUbiquityManager *)self _attemptCoordinatedReadWithoutChangesAtURL:v4 withAccessor:v5];
}

- (void)_queue_copyCatalogToLocalStore:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Copying ubiquitous catalog to local store: %@", buf, 0xCu);
  }

  id v6 = PDDefaultQueue();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100202FFC;
  v8[3] = &unk_10072E198;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)_queue_copyCatalogToUbiquity:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Copying local catalog to ubiquity: %@", buf, 0xCu);
  }

  id v6 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:self];
  id v7 = [(PDUbiquityManager *)self ubiquitousURL];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002031AC;
  v9[3] = &unk_100739388;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v6 coordinateWritingItemAtURL:v7 options:8 error:0 byAccessor:v9];
}

- (void)_queue_addToFilePresenter
{
  if (!self->_addedToFilePresenter)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering as file presenter", v4, 2u);
    }

    self->_addedToFilePresenter = 1;
    +[NSFileCoordinator addFilePresenter:self];
    [(PDUbiquityManager *)self _queue_addedToFilePresenter];
  }
}

- (void)_queue_removeFromFilePresenter
{
  if (self->_addedToFilePresenter)
  {
    +[NSFileCoordinator removeFilePresenter:self];
    self->_addedToFilePresenter = 0;
  }
}

- (void)_queue_addedToFilePresenter
{
  uint64_t v3 = [(PDUbiquityManager *)self ubiquitousURL];
  if (v3 && (PKSharedCacheGetBoolForKey() & 1) == 0)
  {
    id v4 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:self];
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    long long v19 = sub_1000209DC;
    uint64_t v20 = sub_100020FE0;
    id v21 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100203550;
    v15[3] = &unk_1007393B0;
    v15[4] = &v16;
    [(PDUbiquityManager *)self _attemptCoordinatedReadWithoutChangesAtURL:v3 withAccessor:v15];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = (id)v17[5];
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v8);
          -[PDUbiquityManager _queue_resolveURLIfNecessary:fileCoordinator:](self, "_queue_resolveURLIfNecessary:fileCoordinator:", v9, v4, (void)v11);
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v5 countByEnumeratingWithState:&v11 objects:v22 count:16];
      }
      while (v6);
    }

    _Block_object_dispose(&v16, 8);
  }
}

- (void)_queue_resolveURLIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:self];
  [(PDUbiquityManager *)self _queue_resolveURLIfNecessary:v4 fileCoordinator:v5];
}

- (void)_queue_resolveURLIfNecessary:(id)a3 fileCoordinator:(id)a4
{
  id v5 = a3;
  id v25 = a4;
  id v45 = 0;
  [v5 getResourceValue:&v45 forKey:NSURLUbiquitousItemHasUnresolvedConflictsKey error:0];
  id v24 = v45;
  if (![v24 BOOLValue]) {
    goto LABEL_28;
  }
  id v44 = 0;
  [v5 getResourceValue:&v44 forKey:NSURLContentModificationDateKey error:0];
  id v6 = v44;
  +[NSFileVersion unresolvedConflictVersionsOfItemAtURL:v5];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = 0;
  id v9 = [v7 countByEnumeratingWithState:&v40 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v41;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v13 = [v12 modificationDate];
        long long v14 = (void *)v13;
        if (!v6 || v13 && [v6 compare:v13] == (id)-1)
        {
          id v15 = v12;

          uint64_t v16 = [v15 modificationDate];

          id v8 = v15;
          id v6 = (id)v16;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v40 objects:v51 count:16];
    }
    while (v9);
  }

  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_1000209DC;
  v38 = sub_100020FE0;
  id v39 = 0;
  if (!v8) {
    goto LABEL_17;
  }
  id obj = 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100203B84;
  v30[3] = &unk_1007393D8;
  id v31 = v8;
  uint64_t v32 = &v34;
  [v25 coordinateWritingItemAtURL:v5 options:8 error:&obj byAccessor:v30];
  objc_storeStrong(&v39, obj);

  id v17 = (void *)v35[5];
  if (v17)
  {
    uint64_t v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v48 = v5;
      __int16 v49 = 2112;
      id v50 = v17;
      long long v19 = "Failed to write winning version for %@: %@";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);
    }
  }
  else
  {
LABEL_17:
    uint64_t v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v48 = v5;
      __int16 v49 = 2112;
      id v50 = v6;
      long long v19 = "Wrote winning version for %@: %@";
      goto LABEL_19;
    }
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v20 = v7;
  id v21 = [v20 countByEnumeratingWithState:&v26 objects:v46 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v27;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) setResolved:1];
      }
      id v21 = [v20 countByEnumeratingWithState:&v26 objects:v46 count:16];
    }
    while (v21);
  }

  _Block_object_dispose(&v34, 8);
LABEL_28:
}

- (NSURL)presentedItemURL
{
  unsigned __int8 v2 = [(PDUbiquityManager *)self ubiquitousURL];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    sub_100200938();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;

  return (NSURL *)v5;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return self->_operationQueue;
}

- (void)presentedItemDidGainVersion:(id)a3
{
  id v3 = a3;
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 URL];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "presentedItemDidGainVersion: %@", (uint8_t *)&v6, 0xCu);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Marking new version as resolved.", (uint8_t *)&v6, 2u);
  }

  [v3 setResolved:1];
}

- (void)presentedItemDidMoveToURL:(id)a3
{
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cards were moved to %@.\n\tStopping ubiquity.", (uint8_t *)&v6, 0xCu);
  }

  [(PDUbiquityManager *)self setUbiquitousURL:0];
  atomic_store(0, (unsigned int *)&self->_ubiquityState);
}

- (void)presentedSubitemDidChangeAtURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)PDOSTransactionCreate("PDUbiquityManager");
  int v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "presentedSubitemDidChangeAtURL: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100204050;
  block[3] = &unk_100731208;
  p_long long buf = &buf;
  void block[4] = self;
  id v8 = v4;
  id v15 = v8;
  dispatch_sync(accessQueue, block);
  if (*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v17 = 138412290;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Change at %@ is already enqueued", v17, 0xCu);
    }
  }
  else
  {
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1002040C4;
    v10[3] = &unk_10072E238;
    long long v11 = v5;
    id v12 = v8;
    uint64_t v13 = self;
    dispatch_async(queue, v10);

    int v6 = v11;
  }

  _Block_object_dispose(&buf, 8);
}

- (void)presentedSubitemDidAppearAtURL:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "presentedSubitemDidAppearAtURL: %@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100204524;
  v8[3] = &unk_10072E198;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)accommodatePresentedSubitemDeletionAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "accomodatePresentedSubitemDeletionAtURL: %@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100204754;
  block[3] = &unk_10072F788;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)setLastPresentedItemEventIdentifier:(unint64_t)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002047D8;
  block[3] = &unk_10073FE80;
  void block[4] = a3;
  dispatch_async(queue, block);
}

- (PDUbiquityManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDUbiquityManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)ubiquitousURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUbiquitousURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ubiquitousURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_filesToDelete, 0);
  objc_storeStrong((id *)&self->_filesToWrite, 0);
  objc_storeStrong((id *)&self->_filesModified, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end