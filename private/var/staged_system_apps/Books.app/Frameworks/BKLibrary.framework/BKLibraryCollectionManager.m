@interface BKLibraryCollectionManager
- (BCCloudCollectionsManager)cloudCollectionsManager;
- (BKCollection)defaultAllBooksCollection;
- (BKCollection)defaultAudioBooksCollection;
- (BKCollection)defaultBooksCollection;
- (BKCollection)defaultDownloadedCollection;
- (BKCollection)defaultFinishedCollection;
- (BKCollection)defaultPDFsCollection;
- (BKCollection)defaultSamplesCollection;
- (BKCollection)defaultWantToReadCollection;
- (BKLibraryCollectionManager)initWithLibraryManager:(id)a3;
- (BKLibraryManager)libraryManager;
- (BOOL)allowsAutoDownloadOfSamplesToWantToRead;
- (BOOL)deleteCollectionOnMainQueue:(id)a3;
- (BOOL)deleteCollectionWithCollectionID:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5;
- (BOOL)enableCloudMerge;
- (BOOL)isAllBooksCollection:(id)a3;
- (BOOL)p_shouldDeleteAsset:(id)a3 removingFromCollectionIDs:(id)a4;
- (BOOL)processingCollectionDetailChanges;
- (BOOL)processingCollectionMemberChanges;
- (BOOL)receivedCollectionDetailChangesNotification;
- (BOOL)receivedCollectionMemberChangesNotification;
- (BOOL)supportsAudioBooks;
- (BUCoalescingCallBlock)coalescedResetAllCollections;
- (BUCoalescingCallBlock)coalescedResetChangedCollections;
- (NSMutableDictionary)upgradeAssetSortKeys;
- (NSSet)resetCollectionsChangeSet;
- (OS_dispatch_queue)enableCloudMergeQueue;
- (OS_dispatch_queue)getChangesQueue;
- (id)_defaultCollectionsIncludeAllBooks:(BOOL)a3;
- (id)_defaultManagerAssetsForDefaultCollectionWithID:(id)a3 inManagedObjectContext:(id)a4;
- (id)_setupDefaultBooksCollection:(id)a3 moc:(id)a4;
- (id)collectionOnMainQueueWithCollectionID:(id)a3 error:(id *)a4;
- (id)collectionWithCollectionID:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5;
- (id)collectionsWithCollectionIDs:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5;
- (id)defaultCollections;
- (id)defaultCollectionsInManagedObjectContext:(id)a3 withError:(id *)a4;
- (id)fetchDefaultBooksCollectionInUIMoc:(id)a3;
- (id)fetchWTRMembersInContext:(id)a3;
- (id)gatherChangedAssetsCollectionsWithLibraryMoc:(id)a3;
- (id)insertNewCollectionSyncOnMainQueueWithCollectionID:(id)a3 newCollectionBlock:(id)a4;
- (id)mutableCollectionWithCollectionID:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5;
- (id)mutableCollectionsWithCollectionIDs:(id)a3 includeDeleted:(BOOL)a4 inManagedObjectContext:(id)a5 error:(id *)a6;
- (id)p_allOrderedCollections;
- (id)p_assetsRequiringDeletion:(id)a3 removingFromCollectionIDs:(id)a4;
- (id)p_fetchOrCreatePlaceholderCollectionForCollectionID:(id)a3 moc:(id)a4;
- (id)selectableDefaultCollections;
- (id)uiManagerProviderForAddingToWantToRead;
- (id)userCollectionsInManagedObjectContext:(id)a3 withError:(id *)a4;
- (id)userCollectionsOnMainQueueWithError:(id *)a3;
- (void)_BCCloudCollectionDetailManagerChanged:(id)a3;
- (void)_BCCloudCollectionMemberManagerChanged:(id)a3;
- (void)_addMemberWithAsset:(id)a3 toCollection:(id)a4 moc:(id)a5;
- (void)_checkForChangesFromCloudCollectionDetailManagerInMOC:(id)a3 reason:(id)a4;
- (void)_checkForChangesFromCloudCollectionMemberManagerInMOC:(id)a3 reason:(id)a4;
- (void)_performResetCollectionsInMoc:(id)a3 changeSet:(id)a4 completion:(id)a5;
- (void)addBooks:(id)a3 toCollection:(id)a4 forceToTop:(BOOL)a5 completion:(id)a6;
- (void)addStoreID:(id)a3 toCollectionID:(id)a4 forceToTop:(BOOL)a5 completion:(id)a6;
- (void)cleanupDefaultCollections;
- (void)clearSortKeysFromAssetsInMOCForUpgrade:(id)a3;
- (void)dealloc;
- (void)fixCollectionMemberAssetLinks;
- (void)fixPDFCollectionIfNeeded;
- (void)markAsFinishedStoreID:(id)a3 completion:(id)a4;
- (void)markAssetsAsFinished:(id)a3 completion:(id)a4;
- (void)mergeCurrentCollectionDetailsToCloudInMoc:(id)a3;
- (void)mergeCurrentCollectionMembersToCloudInMoc:(id)a3;
- (void)mocDidSave:(id)a3;
- (void)p_downloadSampleBook:(id)a3;
- (void)p_syncCollectionMembers:(id)a3 deletedCollectionMembers:(id)a4 inContext:(id)a5;
- (void)p_syncCollections:(id)a3 deletedCollections:(id)a4 inContext:(id)a5;
- (void)p_updateAsset:(id)a3 inCollectionMember:(id)a4 withMOC:(id)a5;
- (void)p_updateAssetInMembers:(id)a3 moc:(id)a4;
- (void)performAddRequest:(id)a3 completion:(id)a4;
- (void)performRemoveRequest:(id)a3 completion:(id)a4;
- (void)processGatheredChangedAssetsCollections:(id)a3;
- (void)promoteSampleFromWantToReadForAssetID:(id)a3;
- (void)removeAssetID:(id)a3 fromCollectionID:(id)a4 completion:(id)a5;
- (void)removeBook:(id)a3 fromCollections:(id)a4 completion:(id)a5;
- (void)removeBooks:(id)a3 fromCollection:(id)a4 completion:(id)a5;
- (void)resetAllAssetsCollectionsWithLibraryManagedObjectContext:(id)a3 completion:(id)a4;
- (void)resetCollections;
- (void)resetCollectionsForAssetIDs:(id)a3 completion:(id)a4;
- (void)setCloudCollectionsManager:(id)a3;
- (void)setCoalescedResetAllCollections:(id)a3;
- (void)setCoalescedResetChangedCollections:(id)a3;
- (void)setDefaultAllBooksCollection:(id)a3;
- (void)setDefaultAudioBooksCollection:(id)a3;
- (void)setDefaultBooksCollection:(id)a3;
- (void)setDefaultDownloadedCollection:(id)a3;
- (void)setDefaultFinishedCollection:(id)a3;
- (void)setDefaultPDFsCollection:(id)a3;
- (void)setDefaultSamplesCollection:(id)a3;
- (void)setDefaultWantToReadCollection:(id)a3;
- (void)setEnableCloudMerge:(BOOL)a3;
- (void)setEnableCloudMergeQueue:(id)a3;
- (void)setGetChangesQueue:(id)a3;
- (void)setLibraryManager:(id)a3;
- (void)setProcessingCollectionDetailChanges:(BOOL)a3;
- (void)setProcessingCollectionMemberChanges:(BOOL)a3;
- (void)setReceivedCollectionDetailChangesNotification:(BOOL)a3;
- (void)setReceivedCollectionMemberChangesNotification:(BOOL)a3;
- (void)setResetCollectionsChangeSet:(id)a3;
- (void)setUiManagerProviderForAddingToWantToRead:(id)a3;
- (void)setUpgradeAssetSortKeys:(id)a3;
- (void)setupDefaultCollectionsInManagedObjectContext:(id)a3;
- (void)updateCollectionMemberAssetLinksForAssetIDs:(id)a3 temporaryAssetIDs:(id)a4 moc:(id)a5;
- (void)updateCollectionMemberAssetLinksInMOCForUpgrade:(id)a3;
- (void)updateiTunesUCollectionMembersForAssetIDs:(id)a3 temporaryAssetIDs:(id)a4 moc:(id)a5;
@end

@implementation BKLibraryCollectionManager

- (BKLibraryCollectionManager)initWithLibraryManager:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BKLibraryCollectionManager;
  v5 = [(BKLibraryCollectionManager *)&v36 init];
  v6 = v5;
  if (v5)
  {
    v5->_accessLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_libraryManager, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.iBooks.BKLibraryCollectionManager", v7);
    enableCloudMergeQueue = v6->_enableCloudMergeQueue;
    v6->_enableCloudMergeQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.iBooks.BKLibraryCollectionManager.getChanges", v10);
    getChangesQueue = v6->_getChangesQueue;
    v6->_getChangesQueue = (OS_dispatch_queue *)v11;

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v6 selector:"mocDidSave:" name:NSManagedObjectContextDidSaveNotification object:0];

    if (BDSXPCNotificationsEnabled())
    {
      v14 = +[NSNotificationCenter defaultCenter];
      [v14 addObserver:v6 selector:"_BCCloudCollectionDetailManagerChanged:" name:BCCloudCollectionDetailManagerChanged object:0];

      v15 = +[NSNotificationCenter defaultCenter];
      [v15 addObserver:v6 selector:"_BCCloudCollectionMemberManagerChanged:" name:BCCloudCollectionMemberManagerChanged object:0];

      v16 = +[BDSServiceNotificationCenter sharedInstance];
      [v16 startMonitoring];
    }
    else
    {
      v17 = +[NSDistributedNotificationCenter defaultCenter];
      [v17 addObserver:v6 selector:"_BCCloudCollectionDetailManagerChanged:" name:BCCloudCollectionDetailManagerChanged object:0];

      v16 = +[NSDistributedNotificationCenter defaultCenter];
      [v16 addObserver:v6 selector:"_BCCloudCollectionMemberManagerChanged:" name:BCCloudCollectionMemberManagerChanged object:0];
    }

    uint64_t v18 = +[BCCloudCollectionsManager sharedManager];
    cloudCollectionsManager = v6->_cloudCollectionsManager;
    v6->_cloudCollectionsManager = (BCCloudCollectionsManager *)v18;

    id v20 = objc_alloc((Class)BUCoalescingCallBlock);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_6172C;
    v34[3] = &unk_D2990;
    v21 = v6;
    v35 = v21;
    id v22 = [v20 initWithNotifyBlock:v34 blockDescription:@"BKLibraryCollectionManager resetAll"];
    id v23 = v21[17];
    v21[17] = v22;

    [v21[17] setCoalescingDelay:0.1];
    id v24 = objc_alloc((Class)BUCoalescingCallBlock);
    v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    v31 = sub_61804;
    v32 = &unk_D2990;
    v25 = v21;
    v33 = v25;
    id v26 = [v24 initWithNotifyBlock:&v29 blockDescription:@"BKLibraryCollectionManager resetChanged"];
    id v27 = v25[18];
    v25[18] = v26;

    [v25[18] setCoalescingDelay:0.1 v29, v30, v31, v32];
  }

  return v6;
}

- (void)dealloc
{
  v3 = (id *)NSNotificationCenter_ptr;
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:NSManagedObjectContextDidSaveNotification object:0];

  if (!BDSXPCNotificationsEnabled()) {
    v3 = (id *)NSDistributedNotificationCenter_ptr;
  }
  v5 = [*v3 defaultCenter];
  [v5 removeObserver:self name:BCCloudCollectionDetailManagerChanged object:0];

  v6 = [*v3 defaultCenter];
  [v6 removeObserver:self name:BCCloudCollectionMemberManagerChanged object:0];

  objc_storeWeak((id *)&self->_libraryManager, 0);
  v7.receiver = self;
  v7.super_class = (Class)BKLibraryCollectionManager;
  [(BKLibraryCollectionManager *)&v7 dealloc];
}

- (void)setEnableCloudMerge:(BOOL)a3
{
  v5 = [(BKLibraryCollectionManager *)self enableCloudMergeQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_61C58;
  v6[3] = &unk_D21D8;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (id)p_allOrderedCollections
{
  v3 = [(BKLibraryCollectionManager *)self defaultCollections];
  id v4 = +[NSMutableArray arrayWithArray:v3];

  v5 = [(BKLibraryCollectionManager *)self userCollectionsOnMainQueueWithError:0];
  v6 = +[NSMutableArray arrayWithArray:v5];

  if ([v6 count]) {
    [v4 addObjectsFromArray:v6];
  }

  return v4;
}

- (id)defaultCollections
{
  return [(BKLibraryCollectionManager *)self _defaultCollectionsIncludeAllBooks:1];
}

- (id)selectableDefaultCollections
{
  return [(BKLibraryCollectionManager *)self _defaultCollectionsIncludeAllBooks:0];
}

- (id)_defaultCollectionsIncludeAllBooks:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSMutableArray array];
  if (v3)
  {
    v6 = [(BKLibraryCollectionManager *)self defaultAllBooksCollection];
    [v5 addObject:v6];
  }
  BOOL v7 = [(BKLibraryCollectionManager *)self defaultWantToReadCollection];
  [v5 addObject:v7];

  dispatch_queue_t v8 = [(BKLibraryCollectionManager *)self defaultFinishedCollection];
  [v5 addObject:v8];

  v9 = [(BKLibraryCollectionManager *)self defaultBooksCollection];
  [v5 addObject:v9];

  v10 = [(BKLibraryCollectionManager *)self defaultAudioBooksCollection];
  [v5 addObject:v10];

  dispatch_queue_t v11 = [(BKLibraryCollectionManager *)self defaultPDFsCollection];
  [v5 addObject:v11];

  v12 = [(BKLibraryCollectionManager *)self defaultSamplesCollection];
  [v5 addObject:v12];

  v13 = [(BKLibraryCollectionManager *)self defaultDownloadedCollection];
  [v5 addObject:v13];

  v14 = +[NSArray arrayWithArray:v5];

  return v14;
}

- (id)collectionsWithCollectionIDs:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  return [(BKLibraryCollectionManager *)self mutableCollectionsWithCollectionIDs:a3 includeDeleted:0 inManagedObjectContext:a4 error:a5];
}

- (id)collectionOnMainQueueWithCollectionID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  BOOL v7 = [(BKLibraryCollectionManager *)self libraryManager];
  dispatch_queue_t v8 = [v7 uiChildContext];
  v9 = [(BKLibraryCollectionManager *)self collectionWithCollectionID:v6 inManagedObjectContext:v8 error:a4];

  return v9;
}

- (id)collectionWithCollectionID:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (+[BKCollection isSeriesCollectionID:v8])
  {
    v10 = +[BKCollection seriesIDFromSeriesCollectionID:v8];
    dispatch_queue_t v11 = [(BKLibraryCollectionManager *)self libraryManager];
    v12 = [v11 libraryAssetOnMainQueueWithAssetID:v10];

    v13 = [v12 title];
    v14 = +[BKUnsyncedSeriesCollection seriesCollectionWithSeriesID:v10 name:v13];
  }
  else
  {
    if ([(BKLibraryCollectionManager *)self isAllBooksCollection:v8]) {
      [(BKLibraryCollectionManager *)self defaultAllBooksCollection];
    }
    else {
    v14 = [(BKLibraryCollectionManager *)self mutableCollectionWithCollectionID:v8 inManagedObjectContext:v9 error:a5];
    }
  }

  return v14;
}

- (id)userCollectionsOnMainQueueWithError:(id *)a3
{
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  v5 = [(BKLibraryCollectionManager *)self libraryManager];
  id v6 = [v5 uiChildContext];
  BOOL v7 = [(BKLibraryCollectionManager *)self userCollectionsInManagedObjectContext:v6 withError:a3];

  return v7;
}

- (id)userCollectionsInManagedObjectContext:(id)a3 withError:(id *)a4
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKCollection"];
    BOOL v7 = +[BKCollection predicateForNonDeletedUserCollections];
    [v6 setPredicate:v7];

    id v8 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortKey" ascending:1];
    id v12 = v8;
    id v9 = +[NSArray arrayWithObjects:&v12 count:1];
    [v6 setSortDescriptors:v9];

    [v6 setReturnsObjectsAsFaults:0];
    v10 = [v5 executeFetchRequest:v6 error:a4];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)defaultCollectionsInManagedObjectContext:(id)a3 withError:(id *)a4
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKCollection"];
    BOOL v7 = +[BKCollection predicateForAllDefaultCollections];
    [v6 setPredicate:v7];

    [v6 setReturnsObjectsAsFaults:0];
    id v8 = [v5 executeFetchRequest:v6 error:a4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)fetchDefaultBooksCollectionInUIMoc:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_61A04;
  v17 = sub_61A14;
  id v18 = 0;
  id v5 = [(BKLibraryCollectionManager *)self libraryManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_62BE0;
  v9[3] = &unk_D3400;
  objc_copyWeak(&v12, &location);
  dispatch_queue_t v11 = &v13;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [v5 performBlockInUIContext:v9];

  id v7 = (id)v14[5];
  objc_destroyWeak(&v12);
  _Block_object_dispose(&v13, 8);

  objc_destroyWeak(&location);

  return v7;
}

- (id)_setupDefaultBooksCollection:(id)a3 moc:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v8 = [(BKLibraryCollectionManager *)self mutableCollectionWithCollectionID:v6 inManagedObjectContext:v7 error:&v17];
  if (v8
    || (+[BKCollection insertNewCollectionWithCollectionID:v6 inManagedObjectContext:v7], (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = [v8 title];

    if (!v9)
    {
      id v10 = +[BCCollection titleForDefaultCollectionID:v6];
      [v8 setTitle:v10];
    }
    dispatch_queue_t v11 = [v8 sortKey];
    id v12 = [v11 integerValue];

    if (!v12 && (id)kBKCollectionDefaultAll != v6)
    {
      uint64_t v13 = +[BCCollection sortKeyForDefaultCollectionID:v6];
      [v8 setSortKey:v13];
    }
    v14 = [v8 deletedFlag];
    id v15 = [v14 integerValue];

    if (v15) {
      [v8 setDeletedFlag:&off_DA028];
    }
  }

  return v8;
}

- (BKCollection)defaultAllBooksCollection
{
  defaultAllBooksCollection = self->_defaultAllBooksCollection;
  if (!defaultAllBooksCollection
    || ([(BKCollection *)defaultAllBooksCollection collectionID],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    id v5 = [(BKLibraryCollectionManager *)self fetchDefaultBooksCollectionInUIMoc:kBKCollectionDefaultAll];
    [(BKLibraryCollectionManager *)self setDefaultAllBooksCollection:v5];
  }
  id v6 = self->_defaultAllBooksCollection;

  return v6;
}

- (BKCollection)defaultBooksCollection
{
  defaultBooksCollection = self->_defaultBooksCollection;
  if (!defaultBooksCollection
    || ([(BKCollection *)defaultBooksCollection collectionID],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    id v5 = [(BKLibraryCollectionManager *)self fetchDefaultBooksCollectionInUIMoc:kBKCollectionDefaultIDBooks];
    [(BKLibraryCollectionManager *)self setDefaultBooksCollection:v5];
  }
  id v6 = self->_defaultBooksCollection;

  return v6;
}

- (BKCollection)defaultAudioBooksCollection
{
  defaultAudioBooksCollection = self->_defaultAudioBooksCollection;
  if (!defaultAudioBooksCollection
    || ([(BKCollection *)defaultAudioBooksCollection collectionID],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    id v5 = [(BKLibraryCollectionManager *)self fetchDefaultBooksCollectionInUIMoc:kBKCollectionDefaultIDAudiobooks];
    [(BKLibraryCollectionManager *)self setDefaultAudioBooksCollection:v5];
  }
  id v6 = self->_defaultAudioBooksCollection;

  return v6;
}

- (BKCollection)defaultPDFsCollection
{
  defaultPDFsCollection = self->_defaultPDFsCollection;
  if (!defaultPDFsCollection
    || ([(BKCollection *)defaultPDFsCollection collectionID],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    id v5 = [(BKLibraryCollectionManager *)self fetchDefaultBooksCollectionInUIMoc:kBKCollectionDefaultIDPDFs];
    id v6 = self->_defaultPDFsCollection;
    self->_defaultPDFsCollection = v5;
  }
  id v7 = self->_defaultPDFsCollection;

  return v7;
}

- (BKCollection)defaultDownloadedCollection
{
  defaultDownloadedCollection = self->_defaultDownloadedCollection;
  if (!defaultDownloadedCollection
    || ([(BKCollection *)defaultDownloadedCollection collectionID],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    id v5 = [(BKLibraryCollectionManager *)self fetchDefaultBooksCollectionInUIMoc:kBKCollectionDefaultIDDownloaded];
    [(BKLibraryCollectionManager *)self setDefaultDownloadedCollection:v5];
  }
  id v6 = self->_defaultDownloadedCollection;

  return v6;
}

- (BKCollection)defaultFinishedCollection
{
  defaultFinishedCollection = self->_defaultFinishedCollection;
  if (!defaultFinishedCollection
    || ([(BKCollection *)defaultFinishedCollection collectionID],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    id v5 = [(BKLibraryCollectionManager *)self fetchDefaultBooksCollectionInUIMoc:kBKCollectionDefaultIDFinished];
    [(BKLibraryCollectionManager *)self setDefaultFinishedCollection:v5];
  }
  id v6 = self->_defaultFinishedCollection;

  return v6;
}

- (BKCollection)defaultWantToReadCollection
{
  defaultWantToReadCollection = self->_defaultWantToReadCollection;
  if (!defaultWantToReadCollection
    || ([(BKCollection *)defaultWantToReadCollection collectionID],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    id v5 = [(BKLibraryCollectionManager *)self fetchDefaultBooksCollectionInUIMoc:kBKCollectionDefaultIDWantToRead];
    [(BKLibraryCollectionManager *)self setDefaultWantToReadCollection:v5];
  }
  id v6 = self->_defaultWantToReadCollection;

  return v6;
}

- (BKCollection)defaultSamplesCollection
{
  defaultSamplesCollection = self->_defaultSamplesCollection;
  if (!defaultSamplesCollection
    || ([(BKCollection *)defaultSamplesCollection collectionID],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    id v5 = [(BKLibraryCollectionManager *)self fetchDefaultBooksCollectionInUIMoc:kBKCollectionDefaultIDSamples];
    [(BKLibraryCollectionManager *)self setDefaultSamplesCollection:v5];
  }
  id v6 = self->_defaultSamplesCollection;

  return v6;
}

- (BOOL)isAllBooksCollection:(id)a3
{
  return [a3 isEqualToString:kBKCollectionDefaultAll];
}

- (void)setupDefaultCollectionsInManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = +[BKCollection availableDefaultCollectionIDsForOS];
  id v49 = 0;
  v37 = v4;
  id v6 = [(BKLibraryCollectionManager *)self mutableCollectionsWithCollectionIDs:v5 includeDeleted:1 inManagedObjectContext:v4 error:&v49];
  id v7 = v49;
  if (v7)
  {
    id v8 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_93030();
    }
  }
  v35 = v7;
  id v9 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v46;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v16 = [v15 collectionID];
        [v9 setObject:v15 forKeyedSubscript:v16];
      }
      id v12 = [v10 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v12);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v5;
  id v40 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v42;
    do
    {
      for (j = 0; j != v40; j = (char *)j + 1)
      {
        if (*(void *)v42 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * (void)j);
        v19 = [v9 objectForKeyedSubscript:v18];
        if (!v19)
        {
          v19 = +[BKCollection insertNewCollectionWithCollectionID:v18 inManagedObjectContext:v37];
        }
        uint64_t v20 = [v19 deletedFlag];
        if (!v20
          || (v21 = (void *)v20,
              [v19 deletedFlag],
              id v22 = objc_claimAutoreleasedReturnValue(),
              unsigned int v23 = [v22 BOOLValue],
              v22,
              v21,
              v23))
        {
          [v19 setDeletedFlag:&__kCFBooleanFalse];
        }
        id v24 = +[BCCollection sortKeyForDefaultCollectionID:v18];
        uint64_t v25 = [v19 sortKey];
        if (!v25
          || (id v26 = (void *)v25,
              unsigned int v27 = [v24 intValue],
              [v19 sortKey],
              v28 = objc_claimAutoreleasedReturnValue(),
              unsigned int v29 = [v28 intValue],
              v28,
              v26,
              v27 != v29))
        {
          [v19 setSortKey:v24];
        }
        uint64_t v30 = +[BCCollection titleForDefaultCollectionID:v18];
        uint64_t v31 = [v19 title];
        if (!v31
          || (v32 = (void *)v31,
              [v19 title],
              v33 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v34 = [v30 isEqualToString:v33],
              v33,
              v32,
              (v34 & 1) == 0))
        {
          [v19 setTitle:v30];
        }
      }
      id v40 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v40);
  }
}

- (void)mergeCurrentCollectionDetailsToCloudInMoc:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKCollection"];
  [v5 setReturnsObjectsAsFaults:0];
  uint64_t v8 = 0;
  id v6 = [v4 executeFetchRequest:v5 error:&v8];
  id v7 = +[NSSet setWithArray:v6];
  [(BKLibraryCollectionManager *)self p_syncCollections:v7 deletedCollections:0 inContext:v4];
}

- (void)mergeCurrentCollectionMembersToCloudInMoc:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKCollectionMember"];
  [v5 setReturnsObjectsAsFaults:0];
  uint64_t v8 = 0;
  id v6 = [v4 executeFetchRequest:v5 error:&v8];
  id v7 = +[NSSet setWithArray:v6];
  [(BKLibraryCollectionManager *)self p_syncCollectionMembers:v7 deletedCollectionMembers:0 inContext:v4];
}

- (id)insertNewCollectionSyncOnMainQueueWithCollectionID:(id)a3 newCollectionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_61A04;
  v21 = sub_61A14;
  id v22 = 0;
  uint64_t v8 = [(BKLibraryCollectionManager *)self libraryManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_63974;
  v13[3] = &unk_D3450;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  v16 = &v17;
  [v8 performBlockInUIContext:v13];

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)mutableCollectionWithCollectionID:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  id v5 = 0;
  if (a3 && a4)
  {
    id v8 = a4;
    id v9 = a3;
    id v10 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKCollection"];
    [v10 setFetchLimit:1];
    id v11 = +[NSPredicate predicateWithFormat:@"%K == %@", @"collectionID", v9];

    [v10 setPredicate:v11];
    [v10 setReturnsObjectsAsFaults:0];
    id v12 = [v8 executeFetchRequest:v10 error:a5];

    id v5 = [v12 lastObject];
  }

  return v5;
}

- (id)mutableCollectionsWithCollectionIDs:(id)a3 includeDeleted:(BOOL)a4 inManagedObjectContext:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  id v12 = 0;
  if (v9 && v10)
  {
    if (v8) {
      +[BKCollection predicateForCollectionWithCollectionIDInList:v9];
    }
    else {
    uint64_t v13 = +[NSPredicate predicateWithFormat:@"%K in %@", @"collectionID", v9];
    }
    id v14 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKCollection"];
    [v14 setPredicate:v13];
    [v14 setReturnsObjectsAsFaults:0];
    id v12 = [v11 executeFetchRequest:v14 error:a6];
  }

  return v12;
}

- (BOOL)deleteCollectionWithCollectionID:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = v8;
  BOOL v10 = 0;
  if (a3 && v8)
  {
    id v11 = [(BKLibraryCollectionManager *)self mutableCollectionWithCollectionID:a3 inManagedObjectContext:v8 error:a5];
    BOOL v10 = v11 != 0;
    if (v11) {
      [v9 deleteObject:v11];
    }
  }
  return v10;
}

- (BOOL)deleteCollectionOnMainQueue:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v5 = [(BKLibraryCollectionManager *)self libraryManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_63EC0;
  v9[3] = &unk_D2040;
  id v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [v5 performBlockInUIContext:v9];

  char v7 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)promoteSampleFromWantToReadForAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kBKCollectionDefaultIDWantToRead;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_63FF8;
  v7[3] = &unk_D3478;
  id v8 = v4;
  id v6 = v4;
  [(BKLibraryCollectionManager *)self removeAssetID:v6 fromCollectionID:v5 completion:v7];
}

- (void)markAssetsAsFinished:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(BKLibraryCollectionManager *)self libraryManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_641C8;
  v11[3] = &unk_D1B28;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v8 = v7;
  id v9 = v13;
  id v10 = v6;
  [v9 performBlockOnCollectionsWorkerQueue:v11];
}

- (void)addBooks:(id)a3 toCollection:(id)a4 forceToTop:(BOOL)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [a4 collectionID];
  id v13 = [v11 valueForKey:@"assetID"];
  id v14 = [v13 allObjects];

  char v15 = [v11 valueForKey:@"temporaryAssetID"];

  v16 = [v15 allObjects];

  if (![v16 count])
  {

    v16 = 0;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_64540;
  v21[3] = &unk_D34C8;
  v21[4] = self;
  id v22 = v12;
  id v24 = v16;
  id v25 = v10;
  id v23 = v14;
  BOOL v26 = a5;
  id v17 = v16;
  id v18 = v10;
  id v19 = v14;
  id v20 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v21);
}

- (void)removeAssetID:(id)a3 fromCollectionID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[BKCollectionControllerMemberManagingRemoveRequest alloc] initWithStoreID:v10 collectionID:v9];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_64C74;
  v13[3] = &unk_D34F0;
  id v14 = v8;
  id v12 = v8;
  [(BKLibraryCollectionManager *)self performRemoveRequest:v11 completion:v13];
}

- (void)performRemoveRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 storeID];
  id v9 = [v7 collectionID];

  id v10 = [(BKLibraryCollectionManager *)self libraryManager];
  id v11 = v10;
  if (v10)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_64EC4;
    v15[3] = &unk_D3518;
    v15[4] = v9;
    v15[5] = v8;
    v15[6] = self;
    id v16 = v10;
    id v17 = v6;
    [v16 performBlockOnCollectionsWorkerQueue:v15];
  }
  else
  {
    id v12 = (void (**)(id, void, void *))objc_retainBlock(v6);
    if (v12)
    {
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      CFStringRef v19 = @"No library found.";
      id v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v14 = +[NSError errorWithDomain:@"BKLibraryCollectionManager" code:0 userInfo:v13];
      v12[2](v12, 0, v14);
    }
  }
}

- (void)markAsFinishedStoreID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)BCMutableStoreItem) initWithStoreID:v6];
  id v9 = +[BCCloudAssetManager sharedManager];
  id v10 = [v9 storeAssetManager];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_65434;
  v18[3] = &unk_D3540;
  id v11 = v6;
  id v19 = v11;
  id v20 = v7;
  id v12 = v7;
  [v10 addStoreItem:v8 completion:v18];
  [(BKLibraryCollectionManager *)self libraryManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_654E0;
  v15[3] = &unk_D1418;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v11;
  id v13 = v11;
  id v14 = v16;
  [v14 waitForAssetID:v13 completion:v15];
}

- (void)addStoreID:(id)a3 toCollectionID:(id)a4 forceToTop:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[BKCollectionControllerMemberManagingAddRequest alloc] initWithStoreID:v12 collectionID:v11 forceToTop:v6];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_656D0;
  v15[3] = &unk_D34F0;
  id v16 = v10;
  id v14 = v10;
  [(BKLibraryCollectionManager *)self performAddRequest:v13 completion:v15];
}

- (void)performAddRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 storeID];
  id v9 = [v7 collectionID];
  unsigned __int8 v10 = [v7 forceToTop];

  unsigned int v11 = [v9 isEqualToString:kBKCollectionDefaultIDWantToRead];
  char v12 = v11;
  if (v11)
  {
    id v13 = +[NSNotificationCenter defaultCenter];
    [v13 postNotificationName:@"BKLibraryAssetAddToWTRCollectionNotification" object:self userInfo:0];
  }
  if ([v9 isEqualToString:kBKCollectionDefaultIDFinished])
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_65A1C;
    v25[3] = &unk_D3568;
    id v26 = v6;
    [(BKLibraryCollectionManager *)self markAsFinishedStoreID:v8 completion:v25];
    id v14 = v26;
LABEL_9:

    goto LABEL_10;
  }
  char v15 = [(BKLibraryCollectionManager *)self libraryManager];

  if (v15)
  {
    id v16 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v8;
      __int16 v29 = 2112;
      uint64_t v30 = v9;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Adding storeIDs: %@ to collection %@", buf, 0x16u);
    }

    id v17 = [(BKLibraryCollectionManager *)self libraryManager];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_65AE8;
    v21[3] = &unk_D35E0;
    v21[4] = self;
    void v21[5] = v9;
    v21[6] = v8;
    unsigned __int8 v23 = v10;
    char v24 = v12;
    id v22 = v6;
    [v17 performBlockOnCollectionsWorkerQueue:v21];

    id v14 = v22;
    goto LABEL_9;
  }
  NSErrorUserInfoKey v18 = +[NSError errorWithDomain:@"BKLibraryErrorDomain" code:2 userInfo:0];
  id v19 = objc_retainBlock(v6);
  id v20 = v19;
  if (v19) {
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v18);
  }

LABEL_10:
}

- (BOOL)allowsAutoDownloadOfSamplesToWantToRead
{
  objc_opt_class();
  v2 = +[BCRCDataContainer defaultContainer];
  BOOL v3 = [v2 configs];
  id v4 = [v3 valueForKeyPath:BRCBooksDefaultsKeyReadingNowWtrSimpleModeEnabled];
  uint64_t v5 = BUDynamicCast();

  LOBYTE(v2) = [v5 BOOLValue] ^ 1;
  return (char)v2;
}

- (void)p_downloadSampleBook:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[AEUserPublishing sharedInstance];
  id v10 = v4;
  id v6 = +[NSArray arrayWithObjects:&v10 count:1];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_66224;
  v8[3] = &unk_D3630;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 lockupProfilesForStoreIDs:v6 completion:v8];
}

- (void)removeBook:(id)a3 fromCollections:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(BKLibraryCollectionManager *)self libraryManager];
  char v12 = (void *)v11;
  if (v8 && v11 && [v9 count])
  {
    id v13 = [v8 assetID];
    objc_opt_class();
    id v14 = [v9 valueForKey:@"collectionID"];
    char v15 = BUDynamicCast();

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_6683C;
    v20[3] = &unk_D3680;
    v20[4] = self;
    id v21 = v8;
    id v22 = v15;
    id v23 = v13;
    id v24 = v12;
    id v25 = v10;
    id v16 = v13;
    id v17 = v15;
    [v24 performBlockOnCollectionsWorkerQueue:v20];
  }
  else
  {
    id v18 = objc_retainBlock(v10);
    id v19 = v18;
    if (v18) {
      (*((void (**)(id, void, void))v18 + 2))(v18, 0, 0);
    }
  }
}

- (void)removeBooks:(id)a3 fromCollection:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(BKLibraryCollectionManager *)self libraryManager];
  if (v11 && [v9 deleteRemovesFromCollection])
  {
    char v12 = [v9 collectionID];
    id v13 = [v8 valueForKey:@"assetID"];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_66CD4;
    v18[3] = &unk_D3680;
    void v18[4] = self;
    id v19 = v8;
    id v20 = v12;
    id v21 = v13;
    id v22 = v11;
    id v23 = v10;
    id v14 = v13;
    id v15 = v12;
    [v22 performBlockOnCollectionsWorkerQueue:v18];
  }
  else
  {
    id v16 = objc_retainBlock(v10);
    id v17 = v16;
    if (v16) {
      (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
    }
  }
}

- (void)cleanupDefaultCollections
{
  id v2 = [(BKLibraryCollectionManager *)self libraryManager];
  [v2 performBlockOnCollectionsWorkerQueueAndWait:&stru_D36C0];
}

- (BOOL)p_shouldDeleteAsset:(id)a3 removingFromCollectionIDs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 collectionMembers];
  id v8 = [v7 count];
  id v9 = [v6 count];

  if ([v5 isSample]
    && [v5 isLocal]
    && ((int64_t v10 = v8 - v9, ((v8 - v9) & 0xFFFFFFFFFFFFFFFELL) == 2)
     || [v6 containsObject:kBKCollectionDefaultIDSamples]))
  {
    uint64_t v11 = [v5 collectionMembers];
    char v12 = [v11 valueForKeyPath:@"collectionID"];

    BOOL v13 = [v6 isSubsetOfSet:v12]
       && [v12 containsObject:kBKCollectionDefaultAll]
       && (([v12 containsObject:kBKCollectionDefaultIDBooks] & 1) != 0
        || [v12 containsObject:kBKCollectionDefaultIDAudiobooks])
       && (v10 == 2 || [v12 containsObject:kBKCollectionDefaultIDDownloaded]);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)p_assetsRequiringDeletion:(id)a3 removingFromCollectionIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (-[BKLibraryCollectionManager p_shouldDeleteAsset:removingFromCollectionIDs:](self, "p_shouldDeleteAsset:removingFromCollectionIDs:", v14, v7, (void)v16))
        {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)fetchWTRMembersInContext:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKCollectionMember"];
  id v5 = +[BKLibraryManager predicateForCollectionMembersInCollectionID:kBKCollectionDefaultIDWantToRead hideUnownedItems:0];
  v14[0] = v5;
  id v6 = +[BKLibraryManager predicateForExcludingCollectionMembersWithSideloadedAssets];
  v14[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v14 count:2];
  id v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
  [v4 setPredicate:v8];

  id v9 = [v3 executeFetchRequest:v4 error:0];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v10 = +[NSArray array];
  }
  id v11 = v10;

  uint64_t v12 = +[NSSet setWithArray:v11];

  return v12;
}

- (void)p_syncCollections:(id)a3 deletedCollections:(id)a4 inContext:(id)a5
{
  id v7 = a3;
  id v53 = a4;
  id v54 = a5;
  id v8 = +[NSMutableSet set];
  v56 = +[NSMutableDictionary dictionary];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v72;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v72 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        BOOL v13 = [v12 deletedFlag];
        unsigned int v14 = [v13 BOOLValue];

        if (v14)
        {
          id v15 = +[BULogUtilities shared];
          unsigned int v16 = [v15 verboseLoggingEnabled];

          if (v16)
          {
            long long v17 = BKLibraryCollectionDevelopmentLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v12;
              _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "\"\\\"collection marked deleted: %@\\\"\"", (uint8_t *)&buf, 0xCu);
            }
          }
          long long v18 = [v12 collectionID];
          if (v18)
          {
            [v8 addObject:v18];
          }
          else
          {
            id v24 = +[BULogUtilities shared];
            unsigned int v25 = [v24 verboseLoggingEnabled];

            if (v25)
            {
              id v26 = BKLibraryAssetDetailsDevelopmentLog();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v12;
                _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "\"\\\"collection marked as deleted but has no collectionID: %@\\\"\"", (uint8_t *)&buf, 0xCu);
              }
            }
          }
        }
        else
        {
          long long v19 = [v12 placeholder];
          int v20 = [v19 BOOLValue];

          if (v20)
          {
            id v21 = +[BULogUtilities shared];
            unsigned int v22 = [v21 verboseLoggingEnabled];

            if (!v22) {
              continue;
            }
            long long v18 = BKLibraryCollectionDevelopmentLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v12;
              _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "\"\\\"collection marked placeholder: %@\\\"\"", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            long long v18 = [v12 collectionDetailRepresentation];
            id v23 = [v18 collectionID];
            if (v23)
            {
              [v56 setObject:v18 forKey:v23];
            }
            else
            {
              unsigned int v27 = +[BULogUtilities shared];
              unsigned int v28 = [v27 verboseLoggingEnabled];

              if (v28)
              {
                __int16 v29 = BKLibraryAssetDetailsDevelopmentLog();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(buf) = 138412290;
                  *(void *)((char *)&buf + 4) = v12;
                  _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "\"\\\"Collection detail representation has no collectionID: %@\\\"\"", (uint8_t *)&buf, 0xCu);
                }
              }
            }
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
    }
    while (v9);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v30 = v53;
  id v31 = [v30 countByEnumeratingWithState:&v67 objects:v78 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v68;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v68 != v32) {
          objc_enumerationMutation(v30);
        }
        unsigned __int8 v34 = [*(id *)(*((void *)&v67 + 1) + 8 * (void)j) collectionID];
        if (v34) {
          [v8 addObject:v34];
        }
      }
      id v31 = [v30 countByEnumeratingWithState:&v67 objects:v78 count:16];
    }
    while (v31);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v76 = 0x2020000000;
  uint64_t v77 = 0;
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_67CC4;
  v66[3] = &unk_D36E8;
  v66[4] = self;
  v66[5] = &buf;
  v35 = objc_retainBlock(v66);
  objc_super v36 = v35;
  if (v54)
  {
    ((void (*)(void *))v35[2])(v35);
  }
  else
  {
    v37 = [(BKLibraryCollectionManager *)self libraryManager];
    [v37 performBlockOnCollectionsWorkerQueue:v36];
  }
  v38 = dispatch_group_create();
  if ([v56 count])
  {
    uint64_t v39 = +[BULogUtilities shared];
    unsigned int v40 = [v39 verboseLoggingEnabled];

    if (v40)
    {
      long long v41 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v65 = 0;
        _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "\"\\\"Collections Inserted or Updated\\\"\"", v65, 2u);
      }
    }
    long long v42 = [v56 allKeys];
    dispatch_group_enter(v38);
    long long v43 = [(BKLibraryCollectionManager *)self cloudCollectionsManager];
    long long v44 = [v43 collectionDetailManager];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_67D6C;
    v62[3] = &unk_D3710;
    id v45 = v42;
    id v63 = v45;
    v64 = v38;
    [v44 setCollectionDetails:v56 completion:v62];
  }
  if (objc_msgSend(v8, "count", v53))
  {
    long long v46 = +[BULogUtilities shared];
    unsigned int v47 = [v46 verboseLoggingEnabled];

    if (v47)
    {
      long long v48 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v65 = 0;
        _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, "\"\\\"Collections Deleted\\\"\"", v65, 2u);
      }
    }
    dispatch_group_enter(v38);
    id v49 = [(BKLibraryCollectionManager *)self cloudCollectionsManager];
    v50 = [v49 collectionDetailManager];
    v51 = [v8 allObjects];
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_67EDC;
    v59[3] = &unk_D2A98;
    id v60 = v8;
    v61 = v38;
    [v50 deleteCollectionDetailForCollectionIDs:v51 completion:v59];
  }
  v52 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_67FF0;
  block[3] = &unk_D2430;
  block[4] = self;
  block[5] = &buf;
  dispatch_group_notify(v38, v52, block);

  _Block_object_dispose(&buf, 8);
}

- (void)p_syncCollectionMembers:(id)a3 deletedCollectionMembers:(id)a4 inContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v8;
  id v48 = v9;
  v51 = +[NSMutableDictionary dictionary];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v7;
  id v11 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v68;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v68 != v12) {
          objc_enumerationMutation(obj);
        }
        unsigned int v14 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        id v15 = [v14 collection];
        unsigned int v16 = [v15 collectionID];
        if (v16)
        {
          long long v17 = [v14 assetID];
          if (v17)
          {
            long long v18 = [v14 collection];
            unsigned int v19 = [v18 shouldSyncCollectionMembers];

            if (!v19) {
              continue;
            }
            id v15 = [v14 collectionMemberRepresentation];
            unsigned int v16 = [v15 collectionMemberID];
            [v51 setObject:v15 forKey:v16];
          }
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
    }
    while (v11);
  }

  v50 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v20 = v10;
  id v21 = [v20 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (!v21) {
    goto LABEL_26;
  }
  uint64_t v22 = *(void *)v64;
  do
  {
    for (j = 0; j != v21; j = (char *)j + 1)
    {
      if (*(void *)v64 != v22) {
        objc_enumerationMutation(v20);
      }
      id v24 = *(void **)(*((void *)&v63 + 1) + 8 * (void)j);
      unsigned int v25 = [v24 collectionID];
      if (v25)
      {
        id v26 = [v24 assetID];
        if (v26)
        {
          unsigned int v27 = [v24 collectionID];
          unsigned int v28 = +[BKCollection shouldSyncCollectionID:v27];

          if (!v28) {
            continue;
          }
          __int16 v29 = [v24 collectionID];
          id v30 = [v24 assetID];
          unsigned int v25 = +[BCCollectionMember collectionMemberIDWithCollectionID:v29 assetID:v30];

          [v50 addObject:v25];
        }
      }
    }
    id v21 = [v20 countByEnumeratingWithState:&v63 objects:v71 count:16];
  }
  while (v21);
LABEL_26:

  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  v62[3] = 0;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_68804;
  v61[3] = &unk_D36E8;
  v61[4] = self;
  v61[5] = v62;
  id v31 = objc_retainBlock(v61);
  uint64_t v32 = v31;
  if (v48)
  {
    ((void (*)(void *))v31[2])(v31);
  }
  else
  {
    v33 = [(BKLibraryCollectionManager *)self libraryManager];
    [v33 performBlockOnCollectionsWorkerQueue:v32];
  }
  unsigned __int8 v34 = dispatch_group_create();
  if ([v51 count])
  {
    v35 = +[BULogUtilities shared];
    unsigned int v36 = [v35 verboseLoggingEnabled];

    if (v36)
    {
      v37 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "\"\\\"Collection Members Inserted or Updated\\\"\"", buf, 2u);
      }
    }
    v38 = [v51 allKeys];
    dispatch_group_enter(v34);
    uint64_t v39 = [(BKLibraryCollectionManager *)self cloudCollectionsManager];
    unsigned int v40 = [v39 collectionMemberManager];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_688AC;
    v57[3] = &unk_D3710;
    v58 = v34;
    id v41 = v38;
    id v59 = v41;
    [v40 setCollectionMembers:v51 completion:v57];
  }
  if ([v50 count])
  {
    long long v42 = +[BULogUtilities shared];
    unsigned int v43 = [v42 verboseLoggingEnabled];

    if (v43)
    {
      long long v44 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v44, OS_LOG_TYPE_DEFAULT, "\"\\\"Collection Members Deleted\\\"\"", buf, 2u);
      }
    }
    dispatch_group_enter(v34);
    id v45 = [(BKLibraryCollectionManager *)self cloudCollectionsManager];
    long long v46 = [v45 collectionMemberManager];
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_68A1C;
    v54[3] = &unk_D2A98;
    id v55 = v50;
    v56 = v34;
    [v46 deleteCollectionMemberForCollectionMemberIDs:v55 completion:v54];
  }
  unsigned int v47 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_68B0C;
  block[3] = &unk_D2430;
  block[4] = self;
  block[5] = v62;
  dispatch_group_notify(v34, v47, block);

  _Block_object_dispose(v62, 8);
}

- (void)mocDidSave:(id)a3
{
  id v4 = a3;
  id v5 = BKLibraryCollectionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_93398(v4);
  }

  uint64_t v41 = 0;
  long long v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  id v6 = [(BKLibraryCollectionManager *)self enableCloudMergeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_692E8;
  block[3] = &unk_D3310;
  block[4] = self;
  block[5] = &v41;
  dispatch_sync(v6, block);

  objc_opt_class();
  id v7 = [v4 object];
  id v8 = BUDynamicCast();

  BOOL v9 = [v8 sessionContextType] == 5 && [v8 saveContext] == 1;
  uint64_t v10 = [v4 userInfo];
  id v11 = [v10 objectForKey:NSUpdatedObjectsKey];

  if (v8)
  {
    uint64_t v12 = +[NSPredicate predicateWithFormat:@"self isKindOfClass:%@ AND self.collectionID == %@", objc_opt_class(), kBKCollectionDefaultIDWantToRead];
    BOOL v13 = [v11 filteredSetUsingPredicate:v12];
    if ([v13 count])
    {
      unsigned int v14 = [(BKLibraryCollectionManager *)self libraryManager];
      [v14 collectionManagerDidModifyWantToReadCollection:self];
    }
    if (!v9
      && [v8 sessionContextType] != 2
      && [v8 sessionContextType] != 3
      && [v8 sessionContextType] != 1)
    {
      id v15 = [v8 persistentStoreCoordinator];
      unsigned int v16 = [(BKLibraryCollectionManager *)self libraryManager];
      long long v17 = [v16 persistentStoreCoordinator];
      unsigned int v18 = [v15 hasStoreInCommonWith:v17];

      if (v18)
      {
        unsigned int v19 = [v4 userInfo];
        uint64_t v39 = [v19 objectForKey:NSInsertedObjectsKey];

        id v20 = [v4 userInfo];
        v38 = [v20 objectForKey:NSDeletedObjectsKey];

        if (*((unsigned char *)v42 + 24)
          && ([v39 count] || objc_msgSend(v11, "count") || objc_msgSend(v38, "count")))
        {
          id v21 = +[NSPredicate predicateWithFormat:@"self isKindOfClass: %@", objc_opt_class()];
          uint64_t v22 = +[NSMutableSet set];
          unsigned int v36 = [v39 filteredSetUsingPredicate:v21];
          v35 = [v11 filteredSetUsingPredicate:v21];
          if ([v36 count]) {
            [v22 unionSet:v36];
          }
          if ([v35 count]) {
            [v22 unionSet:v35];
          }
          id v23 = [v38 filteredSetUsingPredicate:v21];
          id v24 = [v23 mutableCopy];

          if ([v22 count] || objc_msgSend(v24, "count"))
          {
            unsigned int v25 = BKLibraryCollectionLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              id v26 = [v22 count];
              id v27 = [v24 count];
              *(_DWORD *)long long buf = 134218498;
              id v46 = v26;
              __int16 v47 = 2048;
              id v48 = v27;
              __int16 v49 = 2114;
              v50 = v8;
              _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "Saving collections: %lu inserts/updates, %lu deletes (due to moc save: %{public}@)", buf, 0x20u);
            }

            [(BKLibraryCollectionManager *)self p_syncCollections:v22 deletedCollections:v24 inContext:0];
          }

          unsigned int v28 = +[NSPredicate predicateWithFormat:@"self isKindOfClass: %@", objc_opt_class()];
          __int16 v29 = +[NSMutableSet set];
          v37 = [v39 filteredSetUsingPredicate:v28];
          id v30 = [v11 filteredSetUsingPredicate:v28];
          if ([v37 count]) {
            [v29 unionSet:v37];
          }
          if ([v30 count]) {
            [v29 unionSet:v30];
          }
          id v31 = [v38 filteredSetUsingPredicate:v28];
          if ([v29 count] || objc_msgSend(v31, "count"))
          {
            uint64_t v32 = BKLibraryCollectionLog();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              id v33 = [v29 count];
              id v34 = [v31 count];
              *(_DWORD *)long long buf = 134218498;
              id v46 = v33;
              __int16 v47 = 2048;
              id v48 = v34;
              __int16 v49 = 2114;
              v50 = v8;
              _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "Saving collection members: %lu inserts/updates, %lu deletes (due to moc save: %{public}@)", buf, 0x20u);
            }

            [(BKLibraryCollectionManager *)self p_syncCollectionMembers:v29 deletedCollectionMembers:v31 inContext:0];
          }
        }
      }
    }
  }

  _Block_object_dispose(&v41, 8);
}

- (void)_BCCloudCollectionDetailManagerChanged:(id)a3
{
  id v4 = [(BKLibraryCollectionManager *)self getChangesQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_693A4;
  block[3] = &unk_D1520;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_checkForChangesFromCloudCollectionDetailManagerInMOC:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKLibraryCollectionManager *)self libraryManager];
  BOOL v9 = [v8 cloudSyncVersionsForDataType:@"BCCollectionDetail" inContext:v7];

  id v10 = [v9 mutableCopy];
  id v11 = BKLibraryCollectionLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v16 = v10;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "_checkForChangesFromCloudCollectionDetailManagerInMOC cloudSyncVersions:%{public}@, reason:%{public}@", buf, 0x16u);
  }

  uint64_t v12 = [(BKLibraryCollectionManager *)self cloudCollectionsManager];
  BOOL v13 = [v12 collectionDetailManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_696DC;
  v14[3] = &unk_D3738;
  v14[4] = self;
  [v13 getCollectionDetailChangesSince:v10 completion:v14];
}

- (void)_BCCloudCollectionMemberManagerChanged:(id)a3
{
  id v4 = [(BKLibraryCollectionManager *)self getChangesQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6A23C;
  block[3] = &unk_D1520;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_checkForChangesFromCloudCollectionMemberManagerInMOC:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKLibraryCollectionManager *)self libraryManager];
  BOOL v9 = [v8 cloudSyncVersionsForDataType:@"BCCollectionMember" inContext:v7];

  id v10 = [v9 mutableCopy];
  id v11 = BKLibraryCollectionLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v16 = v10;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "_checkForChangesFromCloudCollectionMemberManagerInMOC cloudSyncVersions:%{public}@, reason:%{public}@", buf, 0x16u);
  }

  uint64_t v12 = [(BKLibraryCollectionManager *)self cloudCollectionsManager];
  BOOL v13 = [v12 collectionMemberManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_6A574;
  v14[3] = &unk_D3738;
  v14[4] = self;
  [v13 getCollectionMemberChangesSince:v10 completion:v14];
}

- (id)p_fetchOrCreatePlaceholderCollectionForCollectionID:(id)a3 moc:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v14 = 0;
  id v8 = [(BKLibraryCollectionManager *)self mutableCollectionWithCollectionID:v6 inManagedObjectContext:v7 error:&v14];
  id v9 = v14;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      id v16 = v6;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Creating a new placeholder collection for member insertion collectionID:%{public}@", buf, 0xCu);
    }

    uint64_t v12 = +[BKCollection insertNewCollectionWithCollectionID:v6 inManagedObjectContext:v7];

    [v12 setTitle:@"Sync Placeholder"];
    [v12 setLocalModDate:0];
    [v12 setPlaceholder:&__kCFBooleanTrue];
    id v8 = v12;
  }

  return v8;
}

- (void)p_updateAssetInMembers:(id)a3 moc:(id)a4
{
  id v5 = a3;
  id v72 = a4;
  id v6 = BKLibraryCollectionLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_934F0(v5);
  }

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v7 = +[BKCollection availableDefaultCollectionIDsForOS];
  id v8 = [v7 countByEnumeratingWithState:&v91 objects:v103 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v92;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v92 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        BOOL v13 = +[NSPredicate predicateWithFormat:@"collectionID == %@", v12];
        id v14 = [v5 filteredArrayUsingPredicate:v13];
        id v15 = [v14 count];

        if (v15)
        {
          id v16 = BKLibraryCollectionLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 134218242;
            id v100 = v15;
            __int16 v101 = 2112;
            v102 = v12;
            _os_log_debug_impl(&dword_0, v16, OS_LOG_TYPE_DEBUG, "├─ %lu %@ BKCollectionMembers don't have asset link", buf, 0x16u);
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v91 objects:v103 count:16];
    }
    while (v9);
  }

  __int16 v17 = +[NSMutableArray array];
  id v18 = +[NSMutableArray array];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v19 = v5;
  id v20 = [v19 countByEnumeratingWithState:&v87 objects:v98 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v88;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v88 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(void **)(*((void *)&v87 + 1) + 8 * (void)j);
        unsigned int v25 = [v24 assetID];
        if (v25) {
          [v17 addObject:v25];
        }
        id v26 = [v24 temporaryAssetID];
        if (v26) {
          [v18 addObject:v26];
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v87 objects:v98 count:16];
    }
    while (v21);
  }

  id v27 = +[NSMutableDictionary dictionary];
  long long v66 = v17;
  long long v67 = v18;
  id v68 = v19;
  if ([v17 count])
  {
    unsigned int v28 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
    __int16 v29 = +[NSPredicate predicateWithFormat:@"assetID IN %@", v66];
    [v28 setPredicate:v29];
    id v86 = 0;
    id v30 = [v72 executeFetchRequest:v28 error:&v86];
    id v31 = v86;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v32 = v30;
    id v33 = [v32 countByEnumeratingWithState:&v82 objects:v97 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v83;
      do
      {
        for (k = 0; k != v34; k = (char *)k + 1)
        {
          if (*(void *)v83 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v82 + 1) + 8 * (void)k);
          v38 = [v37 assetID];
          [v27 setObject:v37 forKey:v38];
        }
        id v34 = [v32 countByEnumeratingWithState:&v82 objects:v97 count:16];
      }
      while (v34);
    }

    id v18 = v67;
    id v19 = v68;
  }
  uint64_t v39 = +[NSMutableDictionary dictionary];
  if ([v18 count])
  {
    unsigned int v40 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
    uint64_t v41 = +[NSPredicate predicateWithFormat:@"temporaryAssetID IN %@", v18];
    [v40 setPredicate:v41];
    id v81 = 0;
    long long v42 = [v72 executeFetchRequest:v40 error:&v81];
    id v69 = v81;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v43 = v42;
    id v44 = [v43 countByEnumeratingWithState:&v77 objects:v96 count:16];
    if (v44)
    {
      id v45 = v44;
      uint64_t v46 = *(void *)v78;
      do
      {
        for (m = 0; m != v45; m = (char *)m + 1)
        {
          if (*(void *)v78 != v46) {
            objc_enumerationMutation(v43);
          }
          id v48 = *(void **)(*((void *)&v77 + 1) + 8 * (void)m);
          __int16 v49 = [v48 temporaryAssetID];
          [v39 setObject:v48 forKey:v49];
        }
        id v45 = [v43 countByEnumeratingWithState:&v77 objects:v96 count:16];
      }
      while (v45);
    }

    id v18 = v67;
    id v19 = v68;
  }
  long long v70 = v39;
  if ([v27 count] || objc_msgSend(v39, "count"))
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v50 = v19;
    id v51 = [v50 countByEnumeratingWithState:&v73 objects:v95 count:16];
    if (!v51) {
      goto LABEL_64;
    }
    id v52 = v51;
    uint64_t v53 = *(void *)v74;
    while (1)
    {
      for (n = 0; n != v52; n = (char *)n + 1)
      {
        if (*(void *)v74 != v53) {
          objc_enumerationMutation(v50);
        }
        id v55 = *(void **)(*((void *)&v73 + 1) + 8 * (void)n);
        v56 = [v55 assetID];
        if (v56)
        {
          v57 = [v27 objectForKey:v56];
          if (v57) {
            goto LABEL_52;
          }
        }
        else
        {
          v58 = [v55 temporaryAssetID];
          if (v58)
          {
            v57 = [v70 objectForKey:v58];
          }
          else
          {
            v57 = 0;
          }

          if (v57)
          {
LABEL_52:
            [(BKLibraryCollectionManager *)self p_updateAsset:v57 inCollectionMember:v55 withMOC:v72];
            goto LABEL_61;
          }
        }
        id v59 = +[BULogUtilities shared];
        unsigned int v60 = [v59 verboseLoggingEnabled];

        if (v60)
        {
          v61 = BKLibraryCollectionDevelopmentLog();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            v62 = [v55 collection];
            long long v63 = [v62 title];
            *(_DWORD *)long long buf = 138412546;
            id v100 = v56;
            __int16 v101 = 2112;
            v102 = v63;
            _os_log_impl(&dword_0, v61, OS_LOG_TYPE_DEFAULT, "\"\\\"Did not find asset assetID %@ in Collection: %@ \\\"\"", buf, 0x16u);
          }
        }
LABEL_61:
      }
      id v52 = [v50 countByEnumeratingWithState:&v73 objects:v95 count:16];
      if (!v52)
      {
        id v18 = v67;
        id v19 = v68;
        goto LABEL_64;
      }
    }
  }
  long long v64 = +[BULogUtilities shared];
  unsigned int v65 = [v64 verboseLoggingEnabled];

  if (v65)
  {
    v50 = BKLibraryCollectionDevelopmentLog();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v100 = v66;
      __int16 v101 = 2112;
      v102 = v18;
      _os_log_impl(&dword_0, v50, OS_LOG_TYPE_DEFAULT, "\"\\\"Did not find any assets for assetIDs: %@, temporaryAssetID: %@\\\"\"", buf, 0x16u);
    }
LABEL_64:

    uint64_t v39 = v70;
  }
}

- (void)p_updateAsset:(id)a3 inCollectionMember:(id)a4 withMOC:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  [v7 setAsset:v8];
  id v9 = +[BULogUtilities shared];
  unsigned int v10 = [v9 verboseLoggingEnabled];

  if (v10)
  {
    id v11 = BKLibraryCollectionDevelopmentLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v7 collection];
      BOOL v13 = [v12 title];
      id v14 = [v7 asset];
      id v15 = [v14 title];
      int v56 = 138412546;
      v57 = v13;
      __int16 v58 = 2112;
      id v59 = v15;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "\"\\\"Initializing asset link for Collection: %@ Asset: %@\\\"\"", (uint8_t *)&v56, 0x16u);
    }
  }
  id v16 = [(BKLibraryCollectionManager *)self upgradeAssetSortKeys];
  __int16 v17 = [v8 permanentOrTemporaryAssetID];

  id v18 = [v16 objectForKey:v17];

  uint64_t v19 = [v7 sortKey];
  if (!v19)
  {
LABEL_17:
    [v7 setSortKey:v18];
    uint64_t v36 = [v7 sortKey];
    if (!v36
      || (v37 = (void *)v36,
          [v7 sortKey],
          v38 = objc_claimAutoreleasedReturnValue(),
          id v39 = [v38 integerValue],
          v38,
          v37,
          !v39))
    {
      long long v42 = [v7 collection];
      id v43 = +[BKUserSortOrderManager nextSortKeyForCollection:v42];
      [v7 setSortKey:v43];

      id v44 = +[BULogUtilities shared];
      LODWORD(v42) = [v44 verboseLoggingEnabled];

      if (v42)
      {
        id v45 = BKLibraryCollectionDevelopmentLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v46 = [v7 collection];
          __int16 v47 = [v46 title];
          id v48 = [v7 asset];
          __int16 v49 = [v48 title];
          int v56 = 138412546;
          v57 = v47;
          __int16 v58 = 2112;
          id v59 = v49;
          _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, "\"\\\"#sortKey Did not find sort key in collection member or asset, assigned next sort key - Collection: %@ Asset: %@\\\"\"", (uint8_t *)&v56, 0x16u);
        }
      }
      id v30 = [v7 collection];
      [v30 updateMaxSortKeyWithMember:v7];
      goto LABEL_32;
    }
    unsigned int v40 = +[BULogUtilities shared];
    unsigned int v41 = [v40 verboseLoggingEnabled];

    if (v41)
    {
      id v30 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = [v7 collection];
        id v32 = [v31 title];
        id v33 = [v7 asset];
        id v34 = [v33 title];
        int v56 = 138412546;
        v57 = v32;
        __int16 v58 = 2112;
        id v59 = v34;
        uint64_t v35 = "\"\\\"#sortKey Adopted sort key from asset - Collection: %@ Asset: %@\\\"\"";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  id v20 = (void *)v19;
  id v21 = [v7 sortKey];
  if (![v21 integerValue])
  {

    goto LABEL_17;
  }
  if (v18 && [v18 integerValue])
  {
    uint64_t v22 = [v7 sortKey];
    unsigned __int8 v23 = [v22 isEqual:v18];

    if ((v23 & 1) == 0) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  id v24 = [v7 sortKey];
  unsigned int v25 = [v7 asset];
  id v26 = [v25 sortKey];
  unsigned int v27 = [v24 isEqual:v26];

  if (v27)
  {
    unsigned int v28 = +[BULogUtilities shared];
    unsigned int v29 = [v28 verboseLoggingEnabled];

    if (v29)
    {
      id v30 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = [v7 collection];
        id v32 = [v31 title];
        id v33 = [v7 asset];
        id v34 = [v33 title];
        int v56 = 138412546;
        v57 = v32;
        __int16 v58 = 2112;
        id v59 = v34;
        uint64_t v35 = "\"\\\"#sortKey Identical asset and member sort key - Collection: %@ Asset: %@\\\"\"";
LABEL_31:
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, v35, (uint8_t *)&v56, 0x16u);
      }
LABEL_32:
    }
  }
  else
  {
    v50 = [v7 sortKey];
    id v51 = [v7 asset];
    id v52 = [v51 sortKey];
    int v53 = [v50 isEqual:v52];

    if ((v53 & 1) == 0)
    {
      id v54 = +[BULogUtilities shared];
      unsigned int v55 = [v54 verboseLoggingEnabled];

      if (v55)
      {
        id v30 = BKLibraryCollectionDevelopmentLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          id v31 = [v7 collection];
          id v32 = [v31 title];
          id v33 = [v7 asset];
          id v34 = [v33 title];
          int v56 = 138412546;
          v57 = v32;
          __int16 v58 = 2112;
          id v59 = v34;
          uint64_t v35 = "\"\\\"#sortKey SortKey mismatch! - Collection: %@ Asset: %@\\\"\"";
          goto LABEL_31;
        }
        goto LABEL_32;
      }
    }
  }
LABEL_33:
}

- (void)updateCollectionMemberAssetLinksInMOCForUpgrade:(id)a3
{
  id v4 = a3;
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  [v5 setPropertiesToFetch:&off_DA190];
  id v6 = +[NSPredicate predicateWithFormat:@"sortKey != NULL"];
  [v5 setPredicate:v6];

  id v7 = [v4 executeFetchRequest:v5 error:0];
  if ([v7 count])
  {
    id v23 = v4;
    id v8 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v7 count]);
    [(BKLibraryCollectionManager *)self setUpgradeAssetSortKeys:v8];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v15 = [v14 sortKey];
          id v16 = [v15 integerValue];

          if (v16)
          {
            __int16 v17 = [v14 permanentOrTemporaryAssetID];
            if (v17)
            {
              id v18 = [(BKLibraryCollectionManager *)self upgradeAssetSortKeys];
              uint64_t v19 = [v14 sortKey];
              [v18 setObject:v19 forKey:v17];
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    id v4 = v23;
  }
  id v20 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollectionMember"];
  id v21 = +[NSPredicate predicateWithFormat:@"asset == NULL"];
  [v20 setPredicate:v21];

  [v20 setFetchBatchSize:32];
  uint64_t v22 = [v4 executeFetchRequest:v20 error:0];
  if ([v22 count]) {
    [(BKLibraryCollectionManager *)self p_updateAssetInMembers:v22 moc:v4];
  }
}

- (void)clearSortKeysFromAssetsInMOCForUpgrade:(id)a3
{
  id v4 = a3;
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  [v5 setPropertiesToFetch:&off_DA1A8];
  id v6 = +[NSPredicate predicateWithFormat:@"sortKey != NULL"];
  [v5 setPredicate:v6];

  id v7 = [v4 executeFetchRequest:v5 error:0];
  if ([v7 count])
  {
    id v8 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v7 count]);
    [(BKLibraryCollectionManager *)self setUpgradeAssetSortKeys:v8];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        BOOL v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) setSortKey:0 v14];
          BOOL v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
  -[BKLibraryCollectionManager setUpgradeAssetSortKeys:](self, "setUpgradeAssetSortKeys:", 0, (void)v14);
}

- (void)updateCollectionMemberAssetLinksForAssetIDs:(id)a3 temporaryAssetIDs:(id)a4 moc:(id)a5
{
  id v13 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollectionMember"];
  id v11 = +[NSPredicate predicateWithFormat:@"asset == NULL AND (assetID IN %@ OR temporaryAssetID IN %@)", v9, v8];

  [v10 setPredicate:v11];
  [v10 setFetchBatchSize:32];
  uint64_t v12 = [v13 executeFetchRequest:v10 error:0];
  if ([v12 count]) {
    [(BKLibraryCollectionManager *)self p_updateAssetInMembers:v12 moc:v13];
  }
}

- (void)updateiTunesUCollectionMembersForAssetIDs:(id)a3 temporaryAssetIDs:(id)a4 moc:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollectionMember"];
  id v11 = +[NSPredicate predicateWithFormat:@"asset.permlink != NULL AND (assetID IN %@ OR temporaryAssetID IN %@)", v7, v8];
  [v10 setPredicate:v11];

  [v10 setFetchBatchSize:32];
  long long v63 = v9;
  uint64_t v12 = [v9 executeFetchRequest:v10 error:0];
  if ([v12 count])
  {
    __int16 v58 = v10;
    id v59 = v8;
    id v60 = v7;
    id v13 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v81 = (uint64_t)[v12 count];
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "updateiTunesUCollectionMembers: processing %ld iTunesU collection members.", buf, 0xCu);
    }

    long long v14 = +[NSMutableDictionary dictionary];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v57 = v12;
    id v15 = v12;
    id v16 = [v15 countByEnumeratingWithState:&v75 objects:v93 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v76;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v76 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          id v21 = [v20 collectionID];
          if (v21)
          {
            uint64_t v22 = [v14 objectForKeyedSubscript:v21];

            if (!v22)
            {
              id v23 = +[NSMutableArray array];
              [v14 setObject:v23 forKeyedSubscript:v21];
            }
            long long v24 = [v14 objectForKeyedSubscript:v21];
            [v24 addObject:v20];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v75 objects:v93 count:16];
      }
      while (v17);
    }

    long long v25 = +[NSMutableArray array];
    +[NSMutableArray array];
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_6CEA4;
    v72[3] = &unk_D3760;
    id v61 = (id)objc_claimAutoreleasedReturnValue();
    id v73 = v61;
    id v26 = v25;
    id v74 = v26;
    int v56 = v14;
    [v14 enumerateKeysAndObjectsUsingBlock:v72];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v27 = v26;
    id v28 = [v27 countByEnumeratingWithState:&v68 objects:v92 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v69;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v69 != v30) {
            objc_enumerationMutation(v27);
          }
          id v32 = *(void **)(*((void *)&v68 + 1) + 8 * (void)j);
          id v33 = [v32 asset];
          id v34 = [v33 assetID];

          if (v34)
          {
            uint64_t v35 = [v32 assetID];
            unsigned __int8 v36 = [v34 isEqualToString:v35];

            if ((v36 & 1) == 0)
            {
              v37 = BKLibraryCollectionLog();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                v38 = [v32 temporaryAssetID];
                id v39 = [v32 collectionID];
                *(_DWORD *)long long buf = 141559298;
                uint64_t v81 = 1752392040;
                __int16 v82 = 2112;
                long long v83 = v34;
                __int16 v84 = 2160;
                uint64_t v85 = 1752392040;
                __int16 v86 = 2112;
                long long v87 = v38;
                __int16 v88 = 2160;
                uint64_t v89 = 1752392040;
                __int16 v90 = 2112;
                long long v91 = v39;
                _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "updateiTunesUCollectionMembers: Updated collection member. new asestID: %{mask.hash}@ tempopraryAsestID: %{mask.hash}@ collectionID: %{mask.hash}@", buf, 0x3Eu);
              }
              [v32 setAssetID:v34];
            }
          }
          unsigned int v40 = [v32 asset];
          unsigned int v41 = [v40 temporaryAssetID];

          if (v41)
          {
            long long v42 = [v32 temporaryAssetID];
            unsigned __int8 v43 = [v41 isEqualToString:v42];

            if ((v43 & 1) == 0)
            {
              id v44 = BKLibraryCollectionLog();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                id v45 = [v32 temporaryAssetID];
                uint64_t v46 = [v32 collectionID];
                *(_DWORD *)long long buf = 141559298;
                uint64_t v81 = 1752392040;
                __int16 v82 = 2112;
                long long v83 = v34;
                __int16 v84 = 2160;
                uint64_t v85 = 1752392040;
                __int16 v86 = 2112;
                long long v87 = v45;
                __int16 v88 = 2160;
                uint64_t v89 = 1752392040;
                __int16 v90 = 2112;
                long long v91 = v46;
                _os_log_impl(&dword_0, v44, OS_LOG_TYPE_DEFAULT, "updateiTunesUCollectionMembers: Updated collection member. asestID: %{mask.hash}@ new tempopraryAsestID: %{mask.hash}@ collectionID: %{mask.hash}@", buf, 0x3Eu);
              }
              [v32 setTemporaryAssetID:v41];
            }
          }
        }
        id v29 = [v27 countByEnumeratingWithState:&v68 objects:v92 count:16];
      }
      while (v29);
    }

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id obj = v61;
    id v47 = [obj countByEnumeratingWithState:&v64 objects:v79 count:16];
    if (v47)
    {
      id v48 = v47;
      uint64_t v49 = *(void *)v65;
      do
      {
        for (k = 0; k != v48; k = (char *)k + 1)
        {
          if (*(void *)v65 != v49) {
            objc_enumerationMutation(obj);
          }
          id v51 = *(void **)(*((void *)&v64 + 1) + 8 * (void)k);
          id v52 = BKLibraryCollectionLog();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            int v53 = [v51 assetID];
            id v54 = [v51 temporaryAssetID];
            unsigned int v55 = [v51 collectionID];
            *(_DWORD *)long long buf = 141559298;
            uint64_t v81 = 1752392040;
            __int16 v82 = 2112;
            long long v83 = v53;
            __int16 v84 = 2160;
            uint64_t v85 = 1752392040;
            __int16 v86 = 2112;
            long long v87 = v54;
            __int16 v88 = 2160;
            uint64_t v89 = 1752392040;
            __int16 v90 = 2112;
            long long v91 = v55;
            _os_log_impl(&dword_0, v52, OS_LOG_TYPE_DEFAULT, "updateiTunesUCollectionMembers: Deleted collection member. asestID: %{mask.hash}@ tempopraryAsestID: %{mask.hash}@ collectionID: %{mask.hash}@", buf, 0x3Eu);
          }
          [v63 deleteObject:v51];
        }
        id v48 = [obj countByEnumeratingWithState:&v64 objects:v79 count:16];
      }
      while (v48);
    }

    id v8 = v59;
    id v7 = v60;
    uint64_t v12 = v57;
    id v10 = v58;
  }
}

- (void)fixCollectionMemberAssetLinks
{
  id v3 = [(BKLibraryCollectionManager *)self libraryManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_6D388;
  v4[3] = &unk_D16B0;
  v4[4] = self;
  [v3 performBlockOnCollectionsWorkerQueueAndWait:v4];
}

- (void)fixPDFCollectionIfNeeded
{
  id v3 = [(BKLibraryCollectionManager *)self libraryManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_6D658;
  v4[3] = &unk_D16B0;
  v4[4] = self;
  [v3 performBlockOnCollectionsWorkerQueue:v4];
}

- (void)_addMemberWithAsset:(id)a3 toCollection:(id)a4 moc:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 sortKey];
  if (![v11 integerValue])
  {

    id v11 = 0;
  }
  uint64_t v12 = [(BKLibraryCollectionManager *)self upgradeAssetSortKeys];

  if (v12)
  {
    unsigned int v13 = [v8 isContainer];
    if (!v11)
    {
      if (v13)
      {
        id v28 = v10;
        id v29 = v9;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v14 = [v8 purchasedAndLocalSeriesItems];
        id v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v15)
        {
          id v16 = v15;
          id v11 = 0;
          uint64_t v17 = *(void *)v31;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v31 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              id v20 = [(BKLibraryCollectionManager *)self upgradeAssetSortKeys];
              id v21 = [v19 assetID];
              uint64_t v22 = [v20 objectForKey:v21];

              id v23 = [v22 integerValue];
              if ((uint64_t)v23 > (uint64_t)[v11 integerValue])
              {
                id v24 = v22;

                id v11 = v24;
              }
            }
            id v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
          }
          while (v16);
        }
        else
        {
          id v11 = 0;
        }

        id v10 = v28;
        id v9 = v29;
      }
    }
  }
  long long v25 = [v8 assetID];
  id v26 = [v8 temporaryAssetID];
  id v27 = [v9 addCollectionMemberAvoidingDupesWithAsset:v8 assetID:v25 temporaryAssetID:v26 sortKey:v11 forceToTop:0];
}

- (void)resetCollections
{
  id v2 = [(BKLibraryCollectionManager *)self coalescedResetAllCollections];
  [v2 signalWithCompletion:&stru_D3780];
}

- (void)resetAllAssetsCollectionsWithLibraryManagedObjectContext:(id)a3 completion:(id)a4
{
}

- (void)resetCollectionsForAssetIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKLibraryCollectionManager *)self libraryManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_6DEB0;
  v11[3] = &unk_D1B28;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlockOnCollectionsWorkerQueue:v11];
}

- (void)processGatheredChangedAssetsCollections:(id)a3
{
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_6DF98;
  id v9 = &unk_D1418;
  id v10 = self;
  id v11 = a3;
  id v4 = v11;
  os_unfair_lock_lock_with_options();
  sub_6DF98((uint64_t)&v6);
  os_unfair_lock_unlock(&self->_accessLock);
  id v5 = [(BKLibraryCollectionManager *)self coalescedResetChangedCollections];
  [v5 signalWithCompletion:&stru_D37A0];
}

- (id)gatherChangedAssetsCollectionsWithLibraryMoc:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSPredicate predicateWithFormat:@"self isKindOfClass: %@ AND (assetID != NULL OR temporaryAssetID != NULL)", objc_opt_class()];
  id v5 = +[NSSet setWithObjects:@"contentType", @"state", @"isSample", @"localOnlySeriesItemsParent", @"purchasedAndLocalParent", @"purchasedAndLocalSeriesItems", @"path", 0];
  id v6 = [v3 updatedObjects];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_6E314;
  v23[3] = &unk_D37C8;
  id v7 = v5;
  id v24 = v7;
  id v8 = [v6 objectsPassingTest:v23];

  id v9 = +[NSMutableSet set];
  id v10 = [v3 insertedObjects];

  [v9 unionSet:v10];
  [v9 unionSet:v8];
  uint64_t v22 = (void *)v4;
  id v11 = [v9 filteredSetUsingPredicate:v4];
  id v12 = [v11 allObjects];
  id v13 = [v12 valueForKey:@"assetID"];
  long long v14 = [v13 bu_arrayByRemovingNSNulls];
  id v15 = +[NSSet setWithArray:v14];

  id v16 = [v12 valueForKey:@"temporaryAssetID"];
  uint64_t v17 = [v16 bu_arrayByRemovingNSNulls];
  uint64_t v18 = +[NSSet setWithArray:v17];

  uint64_t v19 = [v15 setByAddingObjectsFromSet:v18];
  id v20 = BKLibraryLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_93654(v19);
  }

  return v19;
}

- (void)_performResetCollectionsInMoc:(id)a3 changeSet:(id)a4 completion:(id)a5
{
  id v185 = a3;
  id v146 = a4;
  id v145 = a5;
  kdebug_trace();
  id v7 = BKLibraryLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v146 count]);
    *(_DWORD *)long long buf = 138412290;
    id v221 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "#resetCollections: start for changeSet of size %@", buf, 0xCu);
  }
  uint64_t v9 = +[BKCollection predicateForAllDefaultCollections];
  id v10 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKCollection"];
  v144 = (void *)v9;
  [v10 setPredicate:v9];
  v143 = v10;
  [v185 executeFetchRequest:v10 error:0];
  long long v216 = 0u;
  long long v217 = 0u;
  long long v218 = 0u;
  long long v219 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [obj countByEnumeratingWithState:&v216 objects:v240 count:16];
  if (!v11)
  {
    v163 = 0;
    v164 = 0;
    v169 = 0;
    v151 = 0;
    v152 = 0;
    v162 = 0;
    goto LABEL_26;
  }
  id v12 = v11;
  v163 = 0;
  v164 = 0;
  v169 = 0;
  v151 = 0;
  v152 = 0;
  v162 = 0;
  uint64_t v13 = *(void *)v217;
  uint64_t v14 = kBKCollectionDefaultAll;
  uint64_t v15 = kBKCollectionDefaultIDBooks;
  uint64_t v16 = kBKCollectionDefaultIDPDFs;
  uint64_t v179 = kBKCollectionDefaultIDAudiobooks;
  uint64_t v176 = kBKCollectionDefaultIDDownloaded;
  uint64_t v173 = kBKCollectionDefaultIDSamples;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v217 != v13) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(id *)(*((void *)&v216 + 1) + 8 * i);
      if (([v18 isDeleted] & 1) == 0)
      {
        uint64_t v19 = [v18 collectionID];
        if ([v19 isEqualToString:v14])
        {
          id v21 = v163;
          id v20 = v164;
          v163 = v18;
          goto LABEL_20;
        }
        if ([v19 isEqualToString:v15])
        {
          id v21 = v162;
          id v20 = v164;
          v162 = v18;
          goto LABEL_20;
        }
        if ([v19 isEqualToString:v16])
        {
          id v21 = v152;
          id v20 = v164;
          v152 = v18;
          goto LABEL_20;
        }
        if ([v19 isEqualToString:v179])
        {
          id v21 = v151;
          id v20 = v164;
          v151 = v18;
          goto LABEL_20;
        }
        if ([v19 isEqualToString:v176])
        {
          id v21 = v169;
          id v20 = v164;
          v169 = v18;
          goto LABEL_20;
        }
        id v21 = v164;
        id v20 = v18;
        if ([v19 isEqualToString:v173])
        {
LABEL_20:
          id v22 = v18;

          v164 = v20;
        }
      }
    }
    id v12 = [obj countByEnumeratingWithState:&v216 objects:v240 count:16];
  }
  while (v12);
LABEL_26:

  id v23 = v146;
  if ([v146 count])
  {
    id v24 = [(BKLibraryCollectionManager *)self libraryManager];
    long long v25 = [v24 libraryAssetsWithAssetIDsContainedInList:v146 tempAssetIDs:v146 inManagedObjectContext:v185];

    v147 = v25;
    uint64_t v26 = (uint64_t)[v25 count];
  }
  else
  {
    id v27 = +[NSPredicate predicateWithFormat:@"assetID != NULL OR temporaryAssetID != NULL"];
    id v28 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
    [v28 setPredicate:v27];
    uint64_t v26 = 32;
    [v28 setFetchBatchSize:32];
    v147 = [v185 executeFetchRequest:v28 error:0];

    id v23 = v146;
  }
  id v29 = BKLibraryLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = [v23 count];
    id v31 = [v147 count];
    *(_DWORD *)long long buf = 134218240;
    id v221 = v30;
    __int16 v222 = 2048;
    id v223 = v31;
    _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "#resetCollections: _performResetCollectionsInMoc changed: %lu toCheck: %lu", buf, 0x16u);
  }

  if ([v147 count])
  {
    long long v32 = +[NSMutableArray array];
    long long v33 = +[NSMutableArray array];
    long long v212 = 0u;
    long long v213 = 0u;
    long long v214 = 0u;
    long long v215 = 0u;
    id v160 = v147;
    id v180 = [v160 countByEnumeratingWithState:&v212 objects:v239 count:16];
    if (v180)
    {
      uint64_t v177 = 0;
      uint64_t v170 = *(void *)v213;
      v174 = v32;
      v172 = v33;
      do
      {
        for (j = 0; j != v180; j = (char *)j + 1)
        {
          if (*(void *)v213 != v170) {
            objc_enumerationMutation(v160);
          }
          uint64_t v35 = *(void **)(*((void *)&v212 + 1) + 8 * (void)j);
          if (!(((uint64_t)j + v177) % v26) && ([v32 count] || objc_msgSend(v33, "count")))
          {
            [(BKLibraryCollectionManager *)self updateCollectionMemberAssetLinksForAssetIDs:v32 temporaryAssetIDs:v33 moc:v185];
            [v32 removeAllObjects];
            [v33 removeAllObjects];
          }
          unsigned __int8 v36 = [v35 assetID];

          if (v36)
          {
            v37 = [v35 assetID];
            [v32 addObject:v37];
          }
          v38 = [v35 temporaryAssetID];

          if (v38)
          {
            id v39 = [v35 temporaryAssetID];
            [v33 addObject:v39];
          }
          id v40 = [v35 contentType];
          unsigned int v41 = [v35 state];
          long long v42 = [v35 collectionMembers];
          unsigned __int8 v43 = [v42 allObjects];
          id v44 = [v43 valueForKey:@"collection"];

          id v45 = [v35 localOnlySeriesItemsParent];
          if (v45)
          {
            char v46 = 0;
            BOOL v47 = 0;
            if (v40 == 5) {
              goto LABEL_63;
            }
            goto LABEL_56;
          }
          v167 = [v35 purchasedAndLocalParent];
          if (v167 || v41 == 5)
          {
            char v46 = 0;
            BOOL v47 = 0;
            if (v40 == 5) {
              goto LABEL_62;
            }
LABEL_56:
            id v48 = [v35 seriesContainer];
            uint64_t v49 = [v48 seriesBooks];
            BOOL v47 = [v49 count] != (char *)&dword_0 + 1;

            if ((v46 & 1) == 0) {
              goto LABEL_58;
            }
            goto LABEL_57;
          }
          v165 = [v35 seriesID];
          if (!v165) {
            goto LABEL_61;
          }
          v158 = [v35 seriesContainer];
          if (!v158)
          {
            v158 = 0;
LABEL_61:

            BOOL v47 = 0;
            v167 = 0;
LABEL_62:

            goto LABEL_63;
          }
          v156 = [v35 seriesContainer];
          v154 = [v156 purchasedAndLocalSeriesItems];
          BOOL v47 = 0;
          v167 = 0;
          if ([v154 count] && v40 != 5)
          {
            char v46 = 1;
            goto LABEL_56;
          }
LABEL_57:

LABEL_58:
          if (!v45) {
            goto LABEL_62;
          }
LABEL_63:

          if (v163
            && ([v44 containsObject:v163] & 1) == 0
            && (v40 == 5 || !v47 && ([v35 isStoreItem] & 1) == 0))
          {
            [(BKLibraryCollectionManager *)self _addMemberWithAsset:v35 toCollection:v163 moc:v185];
          }
          if (v169
            && [v35 shouldBeInDownloadedCollection]
            && ([v44 containsObject:v169] & 1) == 0)
          {
            [(BKLibraryCollectionManager *)self _addMemberWithAsset:v35 toCollection:v169 moc:v185];
          }
          if (v164
            && [v35 shouldBeInMySamplesCollection]
            && ([v44 containsObject:v164] & 1) == 0)
          {
            [(BKLibraryCollectionManager *)self _addMemberWithAsset:v35 toCollection:v164 moc:v185];
            v50 = +[BULogUtilities shared];
            unsigned int v51 = [v50 verboseLoggingEnabled];

            if (v51)
            {
              id v52 = BKLibraryLog();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                id v221 = v35;
                _os_log_impl(&dword_0, v52, OS_LOG_TYPE_DEFAULT, "\"\\\"Adding Asset to sample collection:%@\\\"\"", buf, 0xCu);
              }
            }
            int v53 = [v35 storeID];

            if (v53)
            {
              id v54 = objc_alloc((Class)BCMutableStoreItem);
              unsigned int v55 = [v35 storeID];
              id v56 = [v54 initWithStoreID:v55];

              v57 = +[BCCloudAssetManager sharedManager];
              __int16 v58 = [v57 storeAssetManager];

              v211[0] = _NSConcreteStackBlock;
              v211[1] = 3221225472;
              v211[2] = sub_6F940;
              v211[3] = &unk_D37F0;
              v211[4] = v35;
              [v58 addStoreItem:v56 completion:v211];
            }
          }
          if ([v35 state] == 2) {
            unsigned __int8 v59 = +[BKAssetUtilities isAudiobookTrackContentType:v40];
          }
          else {
            unsigned __int8 v59 = 0;
          }
          objc_opt_class();
          id v60 = [v35 seriesBooks];
          id v61 = [v60 anyObject];
          v62 = BUDynamicCast();

          long long v63 = [v62 isStoreAudiobook];
          unsigned __int8 v64 = [v63 BOOLValue];

          if (v162)
          {
            if (v40 <= 4 && ((1 << (char)v40) & 0x16) != 0
              || (v40 != 5 ? (char v66 = 1) : (char v66 = v64), (v66 & 1) == 0))
            {
              if ((([v44 containsObject:v162] | v47) & 1) == 0)
              {
                long long v65 = v162;
                if (![v35 isStoreItem]) {
                  goto LABEL_107;
                }
              }
            }
          }
          if (v152)
          {
            if (v40 == 3)
            {
              long long v65 = v152;
              if (![v44 containsObject:v152]) {
                goto LABEL_107;
              }
            }
          }
          if (v151)
          {
            char v67 = v64 ^ 1;
            if (v40 != 5) {
              char v67 = 1;
            }
            if (((v59 & 1) != 0 || v40 == 6 || (v67 & 1) == 0)
              && (([v44 containsObject:v151] | v47) & 1) == 0
              && ([v35 isStoreItem] & 1) == 0)
            {
              long long v65 = v151;
              if (([v35 isSample] & 1) == 0) {
LABEL_107:
              }
                [(BKLibraryCollectionManager *)self _addMemberWithAsset:v35 toCollection:v65 moc:v185];
            }
          }

          long long v32 = v174;
          long long v33 = v172;
        }
        v177 += (uint64_t)v180;
        id v180 = [v160 countByEnumeratingWithState:&v212 objects:v239 count:16];
      }
      while (v180);
    }

    if ([v32 count] || objc_msgSend(v33, "count"))
    {
      [(BKLibraryCollectionManager *)self updateCollectionMemberAssetLinksForAssetIDs:v32 temporaryAssetIDs:v33 moc:v185];
      [(BKLibraryCollectionManager *)self updateiTunesUCollectionMembersForAssetIDs:v32 temporaryAssetIDs:v33 moc:v185];
    }
  }
  if (v169)
  {
    long long v209 = 0u;
    long long v210 = 0u;
    long long v207 = 0u;
    long long v208 = 0u;
    id v68 = v147;
    id v69 = [v68 countByEnumeratingWithState:&v207 objects:v238 count:16];
    if (v69)
    {
      id v70 = v69;
      uint64_t v71 = *(void *)v208;
      uint64_t v181 = *(void *)v208;
      do
      {
        for (k = 0; k != v70; k = (char *)k + 1)
        {
          if (*(void *)v208 != v71) {
            objc_enumerationMutation(v68);
          }
          id v73 = *(void **)(*((void *)&v207 + 1) + 8 * (void)k);
          id v74 = [v73 collectionMembers];
          long long v75 = [v74 allObjects];
          long long v76 = [v75 valueForKey:@"collection"];

          if ([v73 shouldBeInDownloadedCollection]
            && ([v76 containsObject:v169] & 1) == 0)
          {
            [(BKLibraryCollectionManager *)self _addMemberWithAsset:v73 toCollection:v169 moc:v185];
          }
          if (([v73 shouldBeInDownloadedCollection] & 1) == 0
            && [v76 containsObject:v169])
          {
            long long v205 = 0u;
            long long v206 = 0u;
            long long v203 = 0u;
            long long v204 = 0u;
            long long v77 = [v73 collectionMembers];
            id v78 = [v77 countByEnumeratingWithState:&v203 objects:v237 count:16];
            if (v78)
            {
              id v79 = v78;
              uint64_t v80 = *(void *)v204;
              while (2)
              {
                for (m = 0; m != v79; m = (char *)m + 1)
                {
                  if (*(void *)v204 != v80) {
                    objc_enumerationMutation(v77);
                  }
                  __int16 v82 = *(void **)(*((void *)&v203 + 1) + 8 * (void)m);
                  long long v83 = [v82 collection];

                  if (v83 == v169)
                  {
                    [v185 deleteObject:v82];
                    goto LABEL_135;
                  }
                }
                id v79 = [v77 countByEnumeratingWithState:&v203 objects:v237 count:16];
                if (v79) {
                  continue;
                }
                break;
              }
            }
LABEL_135:

            uint64_t v71 = v181;
          }
        }
        id v70 = [v68 countByEnumeratingWithState:&v207 objects:v238 count:16];
      }
      while (v70);
    }
  }
  __int16 v84 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollectionMember"];
  uint64_t v85 = +[NSPredicate predicateWithFormat:@"collection == NULL"];
  [v84 setPredicate:v85];

  [v84 setFetchBatchSize:32];
  v142 = v84;
  __int16 v86 = [v185 executeFetchRequest:v84 error:0];
  if ([v86 count])
  {
    long long v201 = 0u;
    long long v202 = 0u;
    long long v199 = 0u;
    long long v200 = 0u;
    id v87 = v86;
    id v88 = [v87 countByEnumeratingWithState:&v199 objects:v236 count:16];
    if (v88)
    {
      id v89 = v88;
      uint64_t v90 = *(void *)v200;
      do
      {
        for (n = 0; n != v89; n = (char *)n + 1)
        {
          if (*(void *)v200 != v90) {
            objc_enumerationMutation(v87);
          }
          [v185 deleteObject:*(void *)(*((void *)&v199 + 1) + 8 * (void)n)];
        }
        id v89 = [v87 countByEnumeratingWithState:&v199 objects:v236 count:16];
      }
      while (v89);
    }
  }
  v141 = v86;
  uint64_t v157 = kBKCollectionDefaultIDAudiobooks;
  uint64_t v159 = kBKCollectionDefaultIDBooks;
  uint64_t v92 = +[NSPredicate predicateWithFormat:@"(collection.collectionID == %@ OR collection.collectionID == %@ OR collection.collectionID == %@) AND asset.seriesID != NULL AND asset.contentType != %@ AND (asset.state == %@ OR asset.purchasedAndLocalParent != nil)", kBKCollectionDefaultAll, kBKCollectionDefaultIDBooks, kBKCollectionDefaultIDAudiobooks, &off_DA058, &off_DA058];
  long long v93 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollectionMember"];
  v140 = (void *)v92;
  [v93 setPredicate:v92];
  v139 = v93;
  long long v94 = [v185 executeFetchRequest:v93 error:0];
  long long v195 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  id v95 = v94;
  id v96 = [v95 countByEnumeratingWithState:&v195 objects:v235 count:16];
  v148 = v95;
  if (v96)
  {
    id v97 = v96;
    uint64_t v98 = *(void *)v196;
    do
    {
      v99 = 0;
      do
      {
        if (*(void *)v196 != v98) {
          objc_enumerationMutation(v95);
        }
        id v100 = *(void **)(*((void *)&v195 + 1) + 8 * (void)v99);
        __int16 v101 = [v100 asset];
        v102 = [v101 seriesContainer];
        v103 = [v102 seriesBooks];
        v104 = (char *)[v103 count];

        if (v104 != (unsigned char *)&dword_0 + 1)
        {
          v105 = [v101 localOnlySeriesItemsParent];
          if (v105
            || ([v101 purchasedAndLocalParent],
                (v105 = objc_claimAutoreleasedReturnValue()) != 0))
          {

LABEL_157:
            [v185 deleteObject:v100];
            goto LABEL_158;
          }
          uint64_t v106 = [v101 seriesID];
          if (v106)
          {
            v107 = (void *)v106;
            v108 = [v101 seriesContainer];
            if (v108)
            {
              v109 = [v101 seriesContainer];
              v110 = [v109 purchasedAndLocalSeriesItems];
              id v111 = [v110 count];

              id v95 = v148;
              if (v111) {
                goto LABEL_157;
              }
            }
            else
            {
            }
          }
        }
LABEL_158:

        v99 = (char *)v99 + 1;
      }
      while (v97 != v99);
      id v112 = [v95 countByEnumeratingWithState:&v195 objects:v235 count:16];
      id v97 = v112;
    }
    while (v112);
  }

  long long v193 = 0u;
  long long v194 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  v233[0] = v159;
  v233[1] = v157;
  uint64_t v155 = kBKCollectionDefaultIDPDFs;
  v233[2] = kBKCollectionDefaultIDPDFs;
  v149 = +[NSArray arrayWithObjects:v233 count:3];
  id v161 = [v149 countByEnumeratingWithState:&v191 objects:v234 count:16];
  if (!v161) {
    goto LABEL_193;
  }
  uint64_t v153 = *(void *)v192;
  while (2)
  {
    uint64_t v113 = 0;
    while (2)
    {
      if (*(void *)v192 != v153) {
        objc_enumerationMutation(v149);
      }
      uint64_t v168 = v113;
      v114 = *(void **)(*((void *)&v191 + 1) + 8 * v113);
      unsigned int v115 = [v114 isEqualToString:v159];
      unsigned int v184 = [v114 isEqualToString:v157];
      unsigned int v171 = [v114 isEqualToString:v155];
      v116 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollectionMember"];
      v182 = v114;
      v117 = +[NSPredicate predicateWithFormat:@"collection.collectionID == %@", v114];
      [v116 setPredicate:v117];

      v166 = v116;
      v118 = [v185 executeFetchRequest:v116 error:0];
      long long v187 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      long long v190 = 0u;
      id v119 = v118;
      id v120 = [v119 countByEnumeratingWithState:&v187 objects:v232 count:16];
      if (v120)
      {
        id v121 = v120;
        uint64_t v122 = *(void *)v188;
        unsigned int v178 = v115;
        uint64_t v175 = *(void *)v188;
        do
        {
          for (ii = 0; ii != v121; ii = (char *)ii + 1)
          {
            if (*(void *)v188 != v122) {
              objc_enumerationMutation(v119);
            }
            v124 = *(void **)(*((void *)&v187 + 1) + 8 * (void)ii);
            v125 = [v124 asset];
            v126 = v125;
            if (v125)
            {
              if (v115)
              {
                if (([v125 isAudiobook] & 1) == 0
                  && [v126 contentType] != 3)
                {
                  goto LABEL_189;
                }
              }
              else if (v184)
              {
                if (([v125 isBook] & 1) == 0) {
                  goto LABEL_189;
                }
              }
              else if (!v171 || [v125 contentType] == 3)
              {
                goto LABEL_189;
              }
              v127 = BKLibraryCollectionLog();
              if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
              {
                v128 = [v126 title];
                v129 = [v126 assetID];
                unsigned int v130 = [v126 isBook];
                unsigned int v131 = [v126 isAudiobook];
                unsigned int v132 = [v126 contentType];
                *(_DWORD *)long long buf = 138413570;
                id v221 = v128;
                __int16 v222 = 2112;
                id v223 = v182;
                __int16 v224 = 2112;
                v225 = v129;
                __int16 v226 = 1024;
                unsigned int v227 = v130;
                __int16 v228 = 1024;
                unsigned int v229 = v131;
                __int16 v230 = 1024;
                unsigned int v231 = v132;
                _os_log_impl(&dword_0, v127, OS_LOG_TYPE_DEFAULT, "Removing '%@' from %@: id %@, isBook %d, isAudiobook %d, contentType %d ", buf, 0x32u);

                unsigned int v115 = v178;
                uint64_t v122 = v175;
              }

              [v185 deleteObject:v124];
            }
LABEL_189:
          }
          id v121 = [v119 countByEnumeratingWithState:&v187 objects:v232 count:16];
        }
        while (v121);
      }

      uint64_t v113 = v168 + 1;
      if ((id)(v168 + 1) != v161) {
        continue;
      }
      break;
    }
    id v161 = [v149 countByEnumeratingWithState:&v191 objects:v234 count:16];
    if (v161) {
      continue;
    }
    break;
  }
LABEL_193:

  if ([v185 hasChanges])
  {
    id v186 = 0;
    [v185 save:&v186];
    id v133 = v186;
    if (v133)
    {
      v134 = BKLibraryLog();
      if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR)) {
        sub_936CC();
      }
    }
  }
  v135 = BKLibraryLog();
  if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
  {
    v136 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v146 count]);
    *(_DWORD *)long long buf = 138412290;
    id v221 = v136;
    _os_log_impl(&dword_0, v135, OS_LOG_TYPE_DEFAULT, "#resetCollections: done for changeSet of size %@", buf, 0xCu);
  }
  id v137 = objc_retainBlock(v145);
  v138 = v137;
  if (v137) {
    (*((void (**)(id))v137 + 2))(v137);
  }

  kdebug_trace();
}

- (id)_defaultManagerAssetsForDefaultCollectionWithID:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = +[BKCollection contentTypesForDefaultCollectionWithID:a3];
  if (v6)
  {
    id v7 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
    [v7 setReturnsObjectsAsFaults:0];
    [v7 setFetchBatchSize:32];
    id v8 = +[BKLibraryManager predicateForContentTypes:v6];
    [v7 setPredicate:v8];

    id v13 = 0;
    uint64_t v9 = [v5 executeFetchRequest:v7 error:&v13];
    id v10 = v13;
    if (!v9)
    {
      id v11 = BKLibraryCollectionLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_937BC();
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)enableCloudMerge
{
  return self->_enableCloudMerge;
}

- (id)uiManagerProviderForAddingToWantToRead
{
  return self->_uiManagerProviderForAddingToWantToRead;
}

- (void)setUiManagerProviderForAddingToWantToRead:(id)a3
{
}

- (BKLibraryManager)libraryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);

  return (BKLibraryManager *)WeakRetained;
}

- (void)setLibraryManager:(id)a3
{
}

- (BOOL)supportsAudioBooks
{
  return self->_supportsAudioBooks;
}

- (void)setDefaultAllBooksCollection:(id)a3
{
}

- (void)setDefaultBooksCollection:(id)a3
{
}

- (void)setDefaultAudioBooksCollection:(id)a3
{
}

- (void)setDefaultPDFsCollection:(id)a3
{
}

- (void)setDefaultDownloadedCollection:(id)a3
{
}

- (void)setDefaultFinishedCollection:(id)a3
{
}

- (void)setDefaultWantToReadCollection:(id)a3
{
}

- (void)setDefaultSamplesCollection:(id)a3
{
}

- (BCCloudCollectionsManager)cloudCollectionsManager
{
  return self->_cloudCollectionsManager;
}

- (void)setCloudCollectionsManager:(id)a3
{
}

- (OS_dispatch_queue)enableCloudMergeQueue
{
  return self->_enableCloudMergeQueue;
}

- (void)setEnableCloudMergeQueue:(id)a3
{
}

- (OS_dispatch_queue)getChangesQueue
{
  return self->_getChangesQueue;
}

- (void)setGetChangesQueue:(id)a3
{
}

- (BOOL)processingCollectionDetailChanges
{
  return self->_processingCollectionDetailChanges;
}

- (void)setProcessingCollectionDetailChanges:(BOOL)a3
{
  self->_processingCollectionDetailChanges = a3;
}

- (BOOL)receivedCollectionDetailChangesNotification
{
  return self->_receivedCollectionDetailChangesNotification;
}

- (void)setReceivedCollectionDetailChangesNotification:(BOOL)a3
{
  self->_receivedCollectionDetailChangesNotification = a3;
}

- (BOOL)processingCollectionMemberChanges
{
  return self->_processingCollectionMemberChanges;
}

- (void)setProcessingCollectionMemberChanges:(BOOL)a3
{
  self->_processingCollectionMemberChanges = a3;
}

- (BOOL)receivedCollectionMemberChangesNotification
{
  return self->_receivedCollectionMemberChangesNotification;
}

- (void)setReceivedCollectionMemberChangesNotification:(BOOL)a3
{
  self->_receivedCollectionMemberChangesNotification = a3;
}

- (NSMutableDictionary)upgradeAssetSortKeys
{
  return self->_upgradeAssetSortKeys;
}

- (void)setUpgradeAssetSortKeys:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedResetAllCollections
{
  return self->_coalescedResetAllCollections;
}

- (void)setCoalescedResetAllCollections:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedResetChangedCollections
{
  return self->_coalescedResetChangedCollections;
}

- (void)setCoalescedResetChangedCollections:(id)a3
{
}

- (NSSet)resetCollectionsChangeSet
{
  return self->_resetCollectionsChangeSet;
}

- (void)setResetCollectionsChangeSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetCollectionsChangeSet, 0);
  objc_storeStrong((id *)&self->_coalescedResetChangedCollections, 0);
  objc_storeStrong((id *)&self->_coalescedResetAllCollections, 0);
  objc_storeStrong((id *)&self->_upgradeAssetSortKeys, 0);
  objc_storeStrong((id *)&self->_getChangesQueue, 0);
  objc_storeStrong((id *)&self->_enableCloudMergeQueue, 0);
  objc_storeStrong((id *)&self->_cloudCollectionsManager, 0);
  objc_storeStrong((id *)&self->_defaultSamplesCollection, 0);
  objc_storeStrong((id *)&self->_defaultWantToReadCollection, 0);
  objc_storeStrong((id *)&self->_defaultFinishedCollection, 0);
  objc_storeStrong((id *)&self->_defaultDownloadedCollection, 0);
  objc_storeStrong((id *)&self->_defaultPDFsCollection, 0);
  objc_storeStrong((id *)&self->_defaultAudioBooksCollection, 0);
  objc_storeStrong((id *)&self->_defaultBooksCollection, 0);
  objc_storeStrong((id *)&self->_defaultAllBooksCollection, 0);
  objc_destroyWeak((id *)&self->_libraryManager);

  objc_storeStrong(&self->_uiManagerProviderForAddingToWantToRead, 0);
}

@end