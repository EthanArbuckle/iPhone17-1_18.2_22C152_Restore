@interface BKLibraryBookshelfBooksDataSource
- (BCCloudAssetReviewManager)assetReviewManager;
- (BCMutableCloudSyncVersions)currentCloudSyncVersions;
- (BKLibraryBookshelfBooksDataSource)initWithSortModeProvider:(id)a3 isSeries:(BOOL)a4 providesReviewData:(BOOL)a5 providesProductInfoData:(BOOL)a6 productInfoFilter:(id)a7;
- (BKLibraryBookshelfBooksDataSourceDelegate)delegate;
- (BKLibraryBookshelfSortModeProviding)sortModeProvider;
- (BKLibraryManager)libraryManager;
- (BOOL)hasSeriesSequenceLabel;
- (BOOL)isSeries;
- (BOOL)providesProductInfoData;
- (BOOL)providesReviewData;
- (BOOL)suppressChangeNotification;
- (BUCoalescingCallBlock)coalescedReloadData;
- (NSFetchedResultsController)frc;
- (NSMutableArray)deletedItemIndexPaths;
- (NSMutableArray)insertedItemIndexPaths;
- (NSMutableArray)updatedItemIndexPaths;
- (NSMutableDictionary)assetReviewData;
- (NSMutableDictionary)productInfoData;
- (NSMutableDictionary)resourceCache;
- (NSMutableIndexSet)deletedSectionIndexes;
- (NSMutableIndexSet)insertedSectionIndexes;
- (NSMutableSet)checkedAssetIDs;
- (NSMutableSet)checkedProductProfileIDs;
- (NSMutableSet)checkedResourceIDs;
- (NSPredicate)productInfoFilter;
- (NSSet)propertiesOfInterest;
- (OS_dispatch_queue)extendedDataAccessQueue;
- (OS_dispatch_queue)workerQueue;
- (id)assetReviewForAssetID:(id)a3;
- (id)assetReviewForAssetID:(id)a3 completion:(id)a4;
- (id)cachedResourceForAssetID:(id)a3;
- (id)currentCollection;
- (id)fetchRequest;
- (id)indexPathForRepresentedObject:(id)a3;
- (id)productInfoForAssetID:(id)a3;
- (id)representedObjectForIndexPath:(id)a3;
- (id)representedObjectsInSection:(unint64_t)a3;
- (int64_t)numItemsBeforeChange;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)totalNumberOfItems;
- (void)_loadAndCacheResourcesForAssetIDs:(id)a3 audiobookAssetIDs:(id)a4 completionHandler:(id)a5;
- (void)_loadAssetData;
- (void)_loadAssetReviewData;
- (void)_loadProductInfoData;
- (void)_loadProductInfoData:(id)a3 completion:(id)a4;
- (void)_loadResourcesForAssetIDs:(NSArray *)a3 audiobookAssetIDs:(NSArray *)a4 completionHandler:(id)a5;
- (void)_mocWillSave:(id)a3;
- (void)_updateHasSeriesSequenceLabel;
- (void)clearChanges;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controller:(id)a3 didChangeSection:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)dealloc;
- (void)invalidateFRC;
- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4;
- (void)reloadData;
- (void)resourceForAssetID:(id)a3 type:(int64_t)a4 completion:(id)a5;
- (void)setAssetReviewData:(id)a3;
- (void)setAssetReviewManager:(id)a3;
- (void)setCheckedAssetIDs:(id)a3;
- (void)setCheckedProductProfileIDs:(id)a3;
- (void)setCheckedResourceIDs:(id)a3;
- (void)setCoalescedReloadData:(id)a3;
- (void)setCurrentCloudSyncVersions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeletedItemIndexPaths:(id)a3;
- (void)setDeletedSectionIndexes:(id)a3;
- (void)setExtendedDataAccessQueue:(id)a3;
- (void)setFrc:(id)a3;
- (void)setHasSeriesSequenceLabel:(BOOL)a3;
- (void)setInsertedItemIndexPaths:(id)a3;
- (void)setInsertedSectionIndexes:(id)a3;
- (void)setIsSeries:(BOOL)a3;
- (void)setLibraryManager:(id)a3;
- (void)setNumItemsBeforeChange:(int64_t)a3;
- (void)setProductInfoData:(id)a3;
- (void)setProductInfoFilter:(id)a3;
- (void)setPropertiesOfInterest:(id)a3;
- (void)setProvidesProductInfoData:(BOOL)a3;
- (void)setProvidesReviewData:(BOOL)a3;
- (void)setResourceCache:(id)a3;
- (void)setSortModeProvider:(id)a3;
- (void)setSuppressChangeNotification:(BOOL)a3;
- (void)setUpdatedItemIndexPaths:(id)a3;
- (void)setWorkerQueue:(id)a3;
@end

@implementation BKLibraryBookshelfBooksDataSource

- (BKLibraryBookshelfBooksDataSource)initWithSortModeProvider:(id)a3 isSeries:(BOOL)a4 providesReviewData:(BOOL)a5 providesProductInfoData:(BOOL)a6 productInfoFilter:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a7;
  kdebug_trace();
  v43.receiver = self;
  v43.super_class = (Class)BKLibraryBookshelfBooksDataSource;
  v14 = [(BKLibraryBookshelfBooksDataSource *)&v43 init];
  if (v14)
  {
    v15 = +[BKLibraryManager defaultManager];
    [(BKLibraryBookshelfBooksDataSource *)v14 setLibraryManager:v15];

    v16 = +[NSDistributedNotificationCenter defaultCenter];
    [v16 addObserver:v14 selector:"_BCCloudAssetReviewManagerChanged:" name:BCCloudAssetReviewManagerChanged object:0];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v14 selector:"_mocWillSave:" name:NSManagedObjectContextWillSaveNotification object:0];

    objc_storeWeak((id *)&v14->_sortModeProvider, v12);
    v14->_isSeries = a4;
    v14->_providesReviewData = v9;
    v14->_providesProductInfoData = v8;
    objc_storeStrong((id *)&v14->_productInfoFilter, a7);
    if (v9 || v8)
    {
      v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v19 = dispatch_queue_create("BKLibraryBookshelfBooksDataSource.extendedDataAccessQueue.queue", v18);
      extendedDataAccessQueue = v14->_extendedDataAccessQueue;
      v14->_extendedDataAccessQueue = (OS_dispatch_queue *)v19;

      v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v22 = dispatch_queue_create("BKLibraryBookshelfBooksDataSource.workerQueue.queue", v21);
      workerQueue = v14->_workerQueue;
      v14->_workerQueue = (OS_dispatch_queue *)v22;
    }
    if (v9)
    {
      uint64_t v24 = +[NSMutableDictionary dictionary];
      assetReviewData = v14->_assetReviewData;
      v14->_assetReviewData = (NSMutableDictionary *)v24;

      uint64_t v26 = +[NSMutableSet set];
      checkedAssetIDs = v14->_checkedAssetIDs;
      v14->_checkedAssetIDs = (NSMutableSet *)v26;

      uint64_t v28 = +[NSMutableSet set];
      checkedProductProfileIDs = v14->_checkedProductProfileIDs;
      v14->_checkedProductProfileIDs = (NSMutableSet *)v28;

      uint64_t v30 = +[NSMutableSet set];
      checkedResourceIDs = v14->_checkedResourceIDs;
      v14->_checkedResourceIDs = (NSMutableSet *)v30;
    }
    if (v8)
    {
      v32 = [(BKLibraryBookshelfBooksDataSource *)v14 extendedDataAccessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10018F2EC;
      block[3] = &unk_100A43D60;
      v42 = v14;
      dispatch_sync(v32, block);
    }
    v33 = +[NSSet setWithObjects:@"expectedDate", @"isSample", @"state", @"purchasedAndLocalParent", @"seriesContainer", @"sequenceDisplayName", 0];
    [(BKLibraryBookshelfBooksDataSource *)v14 setPropertiesOfInterest:v33];

    objc_initWeak(&location, v14);
    id v34 = objc_alloc((Class)BUCoalescingCallBlock);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10018F354;
    v38[3] = &unk_100A451B8;
    objc_copyWeak(&v39, &location);
    v35 = (BUCoalescingCallBlock *)[v34 initWithNotifyBlock:v38 blockDescription:@"BKLibraryBookshelfBooksDataSource"];
    coalescedReloadData = v14->_coalescedReloadData;
    v14->_coalescedReloadData = v35;

    [(BUCoalescingCallBlock *)v14->_coalescedReloadData setCoalescingDelay:0.4];
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }
  kdebug_trace();

  return v14;
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self name:BCCloudAssetReviewManagerChanged object:0];

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfBooksDataSource;
  [(BKLibraryBookshelfBooksDataSource *)&v4 dealloc];
}

- (void)_mocWillSave:(id)a3
{
  id v4 = a3;
  v27 = self;
  v5 = [(BKLibraryBookshelfBooksDataSource *)self frc];
  v6 = [v5 fetchRequest];
  v7 = [v6 entityName];
  unsigned int v8 = [v7 isEqualToString:@"BKCollectionMember"];

  if (v8)
  {
    BOOL v9 = [v4 object];
    [v9 updatedObjects];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    id v12 = v10;
    if (v11)
    {
      id v13 = v11;
      v25 = v9;
      id v26 = v4;
      uint64_t v14 = *(void *)v29;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v17 = [v16 entity];
          v18 = [v17 name];
          unsigned int v19 = [v18 isEqualToString:@"BKLibraryAsset"];

          if (v19)
          {
            v20 = [v16 changedValues];
            v21 = [v20 allKeys];
            dispatch_queue_t v22 = +[NSSet setWithArray:v21];
            v23 = [(BKLibraryBookshelfBooksDataSource *)v27 propertiesOfInterest];
            unsigned int v24 = [v22 intersectsSet:v23];

            if (v24)
            {

              id v12 = [(BKLibraryBookshelfBooksDataSource *)v27 coalescedReloadData];
              [v12 signalWithCompletion:&stru_100A49240];
              goto LABEL_13;
            }
          }
        }
        id v13 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      id v12 = v10;
LABEL_13:
      BOOL v9 = v25;
      id v4 = v26;
    }
  }
}

- (BCCloudAssetReviewManager)assetReviewManager
{
  assetReviewManager = self->_assetReviewManager;
  if (!assetReviewManager)
  {
    id v4 = +[BCCloudAssetManager sharedManager];
    self->_assetReviewManager = (BCCloudAssetReviewManager *)[v4 assetReviewManager];

    assetReviewManager = self->_assetReviewManager;
  }

  return assetReviewManager;
}

- (void)_updateHasSeriesSequenceLabel
{
  v3 = [(BKLibraryBookshelfBooksDataSource *)self frc];
  id v4 = [v3 fetchedObjects];

  v5 = [(BKLibraryBookshelfBooksDataSource *)self frc];
  v6 = [v5 fetchRequest];
  v7 = [v6 entityName];
  unsigned int v8 = [v7 isEqualToString:@"BKCollectionMember"];

  if (v8)
  {
    uint64_t v9 = [v4 valueForKeyPath:@"asset"];

    id v4 = (void *)v9;
  }
  self->_hasSeriesSequenceLabel = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [*(id *)(*((void *)&v16 + 1) + 8 * i) sequenceDisplayName:v16];

        if (v15)
        {
          self->_hasSeriesSequenceLabel = 1;
          goto LABEL_13;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)_loadProductInfoData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    objc_initWeak(&location, self);
    unsigned int v8 = [(BKLibraryBookshelfBooksDataSource *)self workerQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10018FBFC;
    v9[3] = &unk_100A492B8;
    id v10 = v6;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    dispatch_async(v8, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_loadProductInfoData
{
  v3 = [(BKLibraryBookshelfBooksDataSource *)self frc];
  id v14 = [v3 fetchedObjects];

  id v4 = [(BKLibraryBookshelfBooksDataSource *)self productInfoFilter];

  if (v4)
  {
    v5 = [(BKLibraryBookshelfBooksDataSource *)self frc];
    id v6 = [v5 fetchRequest];
    id v7 = [v6 entityName];
    unsigned int v8 = [v7 isEqualToString:@"BKCollectionMember"];

    if (v8)
    {
      uint64_t v9 = [v14 valueForKeyPath:@"asset"];

      id v14 = (id)v9;
    }
    id v10 = [(BKLibraryBookshelfBooksDataSource *)self productInfoFilter];
    uint64_t v11 = [v14 filteredArrayUsingPredicate:v10];

    id v12 = (void *)v11;
  }
  else
  {
    id v12 = v14;
  }
  id v15 = v12;
  uint64_t v13 = [v12 valueForKeyPath:@"assetID"];
  [(BKLibraryBookshelfBooksDataSource *)self _loadProductInfoData:v13 completion:0];
}

- (void)_loadAndCacheResourcesForAssetIDs:(id)a3 audiobookAssetIDs:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10019029C;
  v12[3] = &unk_100A492E0;
  objc_copyWeak(&v14, &location);
  id v11 = v10;
  id v13 = v11;
  [(BKLibraryBookshelfBooksDataSource *)self _loadResourcesForAssetIDs:v8 audiobookAssetIDs:v9 completionHandler:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_loadAssetData
{
  v3 = [(BKLibraryBookshelfBooksDataSource *)self frc];
  id v4 = [v3 fetchedObjects];

  v5 = [(BKLibraryBookshelfBooksDataSource *)self productInfoFilter];

  if (v5)
  {
    id v6 = [(BKLibraryBookshelfBooksDataSource *)self frc];
    id v7 = [v6 fetchRequest];
    id v8 = [v7 entityName];
    unsigned int v9 = [v8 isEqualToString:@"BKCollectionMember"];

    if (v9)
    {
      uint64_t v10 = [v4 valueForKeyPath:@"asset"];

      id v4 = (void *)v10;
    }
    id v11 = [(BKLibraryBookshelfBooksDataSource *)self productInfoFilter];
    uint64_t v12 = [v4 filteredArrayUsingPredicate:v11];

    id v4 = (void *)v12;
  }
  id v13 = +[NSMutableArray array];
  id v14 = +[NSMutableArray array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = v4;
  id v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v28;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v15);
        }
        long long v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v20 = [v19 assetID];
        v21 = [v19 isStoreAudiobook];
        unsigned int v22 = [v21 BOOLValue];

        if (v22) {
          v23 = v13;
        }
        else {
          v23 = v14;
        }
        [v23 addObject:v20];
      }
      id v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);
  }

  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001907E8;
  v24[3] = &unk_100A49308;
  objc_copyWeak(&v25, &location);
  [(BKLibraryBookshelfBooksDataSource *)self _loadAndCacheResourcesForAssetIDs:v14 audiobookAssetIDs:v13 completionHandler:v24];
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)_loadAssetReviewData
{
  v3 = +[BUAccountsProvider sharedProvider];
  id v4 = [v3 activeStoreAccount];
  v5 = [v4 ams_DSID];
  id v6 = [v5 stringValue];

  if (v6)
  {
    id v7 = [(BKLibraryBookshelfBooksDataSource *)self frc];
    id v8 = [v7 fetchedObjects];
    unsigned int v9 = [v8 valueForKeyPath:@"assetID"];

    if ([v9 count])
    {
      uint64_t v10 = +[NSMutableArray array];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = v9;
      id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v22;
        do
        {
          id v14 = 0;
          do
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v11);
            }
            id v15 = +[BCAssetReview assetReviewIDWithUserID:v6 assetID:*(void *)(*((void *)&v21 + 1) + 8 * (void)v14)];
            [v10 addObject:v15];

            id v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v12);
      }

      objc_initWeak(&location, self);
      id v16 = [(BKLibraryBookshelfBooksDataSource *)self assetReviewManager];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100190B1C;
      v17[3] = &unk_100A49330;
      objc_copyWeak(&v19, &location);
      id v18 = v11;
      [v16 assetReviewsForAssetReviewIDs:v10 completion:v17];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
}

- (void)reloadData
{
  v3 = [(BKLibraryBookshelfBooksDataSource *)self frc];

  if (!v3)
  {
    id v4 = objc_alloc((Class)NSFetchedResultsController);
    v5 = [(BKLibraryBookshelfBooksDataSource *)self fetchRequest];
    id v6 = [(BKLibraryBookshelfBooksDataSource *)self libraryManager];
    id v7 = [v6 uiChildContext];
    id v8 = [(BKLibraryBookshelfBooksDataSource *)self sortModeProvider];
    unsigned int v9 = [v8 currentSortMode];
    uint64_t v10 = [v9 sectionKeyPath];
    id v11 = [v4 initWithFetchRequest:v5 managedObjectContext:v7 sectionNameKeyPath:v10 cacheName:0];
    [(BKLibraryBookshelfBooksDataSource *)self setFrc:v11];

    id v12 = [(BKLibraryBookshelfBooksDataSource *)self frc];
    [v12 setDelegate:self];

    uint64_t v13 = [(BKLibraryBookshelfBooksDataSource *)self frc];
    [v13 performFetch:0];

    if ([(BKLibraryBookshelfBooksDataSource *)self isSeries]) {
      [(BKLibraryBookshelfBooksDataSource *)self _updateHasSeriesSequenceLabel];
    }
    if ([(BKLibraryBookshelfBooksDataSource *)self providesReviewData]) {
      [(BKLibraryBookshelfBooksDataSource *)self _loadAssetReviewData];
    }
    if ([(BKLibraryBookshelfBooksDataSource *)self providesProductInfoData])
    {
      [(BKLibraryBookshelfBooksDataSource *)self _loadProductInfoData];
      [(BKLibraryBookshelfBooksDataSource *)self _loadAssetData];
    }
  }
}

- (id)productInfoForAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1000070C0;
  id v16 = sub_10000723C;
  id v17 = 0;
  v5 = [(BKLibraryBookshelfBooksDataSource *)self extendedDataAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019115C;
  block[3] = &unk_100A452E8;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)cachedResourceForAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1000070C0;
  id v16 = sub_10000723C;
  id v17 = 0;
  v5 = [(BKLibraryBookshelfBooksDataSource *)self extendedDataAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019133C;
  block[3] = &unk_100A452E8;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)resourceForAssetID:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 length])
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    id v34 = sub_1000070C0;
    v35 = sub_10000723C;
    id v36 = 0;
    uint64_t v27 = 0;
    long long v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    id v10 = [(BKLibraryBookshelfBooksDataSource *)self extendedDataAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100191754;
    block[3] = &unk_100A47800;
    id v25 = &v31;
    void block[4] = self;
    id v11 = v8;
    id v24 = v11;
    id v26 = &v27;
    dispatch_sync(v10, block);

    if (v32[5] || *((unsigned char *)v28 + 24))
    {
      id v12 = objc_retainBlock(v9);
      uint64_t v13 = v12;
      if (v12) {
        (*((void (**)(id, id, uint64_t, void))v12 + 2))(v12, v11, v32[5], 0);
      }
    }
    else
    {
      objc_initWeak(&location, self);
      if (a4 == 1)
      {
        id v37 = v11;
        id v17 = +[NSArray arrayWithObjects:&v37 count:1];
        id v16 = &__NSArray0__struct;
      }
      else if (a4)
      {
        id v17 = &__NSArray0__struct;
        id v16 = &__NSArray0__struct;
      }
      else
      {
        id v38 = v11;
        id v16 = +[NSArray arrayWithObjects:&v38 count:1];
        id v17 = &__NSArray0__struct;
      }
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100191810;
      v18[3] = &unk_100A49358;
      objc_copyWeak(&v21, &location);
      id v20 = v9;
      id v19 = v11;
      [(BKLibraryBookshelfBooksDataSource *)self _loadAndCacheResourcesForAssetIDs:v16 audiobookAssetIDs:v17 completionHandler:v18];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    id v14 = objc_retainBlock(v9);
    id v15 = v14;
    if (v14) {
      (*((void (**)(id, id, void, void))v14 + 2))(v14, v8, 0, 0);
    }
  }
}

- (id)assetReviewForAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_1000070C0;
  id v19 = sub_10000723C;
  id v20 = 0;
  v5 = +[BUAccountsProvider sharedProvider];
  id v6 = [v5 activeStoreAccount];
  id v7 = [v6 ams_DSID];
  id v8 = [v7 stringValue];

  if (v8)
  {
    id v9 = [(BKLibraryBookshelfBooksDataSource *)self extendedDataAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100191A7C;
    block[3] = &unk_100A452E8;
    id v14 = &v15;
    void block[4] = self;
    id v13 = v4;
    dispatch_sync(v9, block);
  }
  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (id)assetReviewForAssetID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = sub_1000070C0;
  id v37 = sub_10000723C;
  id v38 = 0;
  uint64_t v29 = 0;
  char v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  id v8 = +[BUAccountsProvider sharedProvider];
  id v9 = [v8 activeStoreAccount];
  id v10 = [v9 ams_DSID];
  id v11 = [v10 stringValue];

  if (v11)
  {
    id v12 = [(BKLibraryBookshelfBooksDataSource *)self extendedDataAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100191DF4;
    block[3] = &unk_100A47800;
    uint64_t v27 = &v33;
    void block[4] = self;
    id v13 = v6;
    id v26 = v13;
    long long v28 = &v29;
    dispatch_sync(v12, block);

    if (!v34[5] && !*((unsigned char *)v30 + 24))
    {
      objc_initWeak(&location, self);
      id v14 = [(BKLibraryBookshelfBooksDataSource *)self extendedDataAccessQueue];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100191E88;
      v19[3] = &unk_100A47938;
      objc_copyWeak(&v23, &location);
      id v20 = v11;
      id v21 = v13;
      id v22 = v7;
      dispatch_async(v14, v19);

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v15 = objc_retainBlock(v7);
    id v16 = v15;
    if (v15) {
      (*((void (**)(id, void, void))v15 + 2))(v15, 0, 0);
    }
  }
  id v17 = (id)v34[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

- (id)currentCollection
{
  v2 = [(BKLibraryBookshelfBooksDataSource *)self frc];
  v3 = [v2 fetchedObjects];
  id v4 = [v3 lastObject];

  v5 = [v4 collection];

  return v5;
}

- (void)invalidateFRC
{
}

- (int64_t)numberOfSections
{
  v2 = [(BKLibraryBookshelfBooksDataSource *)self frc];
  v3 = [v2 sections];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  id v4 = [(BKLibraryBookshelfBooksDataSource *)self frc];
  v5 = [v4 sections];
  id v6 = [v5 objectAtIndexedSubscript:a3];
  id v7 = [v6 numberOfObjects];

  return (int64_t)v7;
}

- (int64_t)totalNumberOfItems
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(BKLibraryBookshelfBooksDataSource *)self frc];
  v3 = [v2 sections];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += (int64_t)[*(id *)(*((void *)&v10 + 1) + 8 * i) numberOfObjects];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)representedObjectForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryBookshelfBooksDataSource *)self frc];
  int64_t v6 = [v5 sections];

  id v7 = [v4 section];
  if (v7 >= [v6 count])
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v6 objectAtIndexedSubscript:[v4 section]];
  }
  id v9 = [v8 objects];
  id v10 = [v4 item];
  if (v10 >= [v9 count])
  {
    long long v11 = 0;
  }
  else
  {
    long long v11 = [v9 objectAtIndexedSubscript:[v4 item]];
  }
  long long v12 = [(BKLibraryBookshelfBooksDataSource *)self sortModeProvider];
  long long v13 = [v12 currentSortMode];
  id v14 = [v13 entityName];
  unsigned int v15 = [v14 isEqualToString:@"BKLibraryAsset"];

  if (v15)
  {
    id v16 = v11;
  }
  else
  {
    objc_opt_class();
    id v17 = BUDynamicCast();
    id v16 = [v17 asset];
  }

  return v16;
}

- (id)indexPathForRepresentedObject:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryBookshelfBooksDataSource *)self sortModeProvider];
  int64_t v6 = [v5 currentSortMode];
  id v7 = [v6 entityName];
  unsigned int v8 = [v7 isEqualToString:@"BKLibraryAsset"];

  if (v8)
  {
    id v9 = [(BKLibraryBookshelfBooksDataSource *)self frc];
    id v10 = [v9 indexPathForObject:v4];
  }
  else
  {
    long long v11 = [(BKLibraryBookshelfBooksDataSource *)self currentCollection];
    id v9 = +[NSPredicate predicateWithFormat:@"collection == %@", v11];

    long long v12 = [v4 collectionMembers];

    long long v13 = [v12 filteredSetUsingPredicate:v9];
    id v4 = [v13 anyObject];

    id v14 = [(BKLibraryBookshelfBooksDataSource *)self frc];
    id v10 = [v14 indexPathForObject:v4];
  }

  return v10;
}

- (id)representedObjectsInSection:(unint64_t)a3
{
  id v5 = [(BKLibraryBookshelfBooksDataSource *)self frc];
  int64_t v6 = [v5 sections];

  if ((unint64_t)[v6 count] <= a3)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v6 objectAtIndexedSubscript:a3];
  }
  unsigned int v8 = [v7 objects];
  if (!v8) {
    goto LABEL_6;
  }
  id v9 = [(BKLibraryBookshelfBooksDataSource *)self sortModeProvider];
  id v10 = [v9 currentSortMode];
  long long v11 = [v10 entityName];
  unsigned int v12 = [v11 isEqualToString:@"BKLibraryAsset"];

  if (!v12)
  {
    id v13 = [v8 mutableCopy];
    if ([v13 count])
    {
      unint64_t v14 = 0;
      do
      {
        objc_opt_class();
        unsigned int v15 = [v13 objectAtIndexedSubscript:v14];
        id v16 = BUDynamicCast();

        id v17 = [v16 asset];
        [v13 setObject:v17 atIndexedSubscript:v14];

        ++v14;
      }
      while (v14 < (unint64_t)[v13 count]);
    }
  }
  else
  {
LABEL_6:
    id v13 = v8;
  }

  return v13;
}

- (id)fetchRequest
{
  id v3 = objc_alloc((Class)NSFetchRequest);
  id v4 = [(BKLibraryBookshelfBooksDataSource *)self sortModeProvider];
  id v5 = [v4 currentSortMode];
  int64_t v6 = [v5 entityName];
  id v7 = [v3 initWithEntityName:v6];

  unsigned int v8 = [(BKLibraryBookshelfBooksDataSource *)self sortModeProvider];
  id v9 = [v8 currentSortMode];
  id v10 = [v9 predicate];
  [v7 setPredicate:v10];

  long long v11 = [(BKLibraryBookshelfBooksDataSource *)self sortModeProvider];
  unsigned int v12 = [v11 currentSortMode];
  id v13 = [v12 sortDescriptors];
  [v7 setSortDescriptors:v13];

  [v7 setFetchBatchSize:32];

  return v7;
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableIndexSet indexSet];
  [(BKLibraryBookshelfBooksDataSource *)self setInsertedSectionIndexes:v5];

  int64_t v6 = +[NSMutableIndexSet indexSet];
  [(BKLibraryBookshelfBooksDataSource *)self setDeletedSectionIndexes:v6];

  id v7 = +[NSMutableArray array];
  [(BKLibraryBookshelfBooksDataSource *)self setDeletedItemIndexPaths:v7];

  unsigned int v8 = +[NSMutableArray array];
  [(BKLibraryBookshelfBooksDataSource *)self setInsertedItemIndexPaths:v8];

  id v9 = +[NSMutableArray array];
  [(BKLibraryBookshelfBooksDataSource *)self setUpdatedItemIndexPaths:v9];

  id v10 = [v4 fetchedObjects];

  -[BKLibraryBookshelfBooksDataSource setNumItemsBeforeChange:](self, "setNumItemsBeforeChange:", [v10 count]);
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v28 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  switch(a6)
  {
    case 1uLL:
      unsigned int v15 = [(BKLibraryBookshelfBooksDataSource *)self insertedSectionIndexes];
      unsigned __int8 v16 = [v15 containsIndex:[v14 section]];

      if ((v16 & 1) == 0)
      {
        id v17 = [(BKLibraryBookshelfBooksDataSource *)self insertedItemIndexPaths];
        id v18 = v17;
        id v19 = v14;
        goto LABEL_9;
      }
      goto LABEL_14;
    case 2uLL:
      goto LABEL_6;
    case 3uLL:
      id v20 = [(BKLibraryBookshelfBooksDataSource *)self insertedSectionIndexes];
      unsigned __int8 v21 = [v20 containsIndex:[v14 section]];

      if ((v21 & 1) == 0)
      {
        id v22 = [(BKLibraryBookshelfBooksDataSource *)self insertedItemIndexPaths];
        [v22 addObject:v14];
      }
LABEL_6:
      id v23 = [(BKLibraryBookshelfBooksDataSource *)self deletedSectionIndexes];
      unsigned __int8 v24 = [v23 containsIndex:[v13 section]];

      if (v24) {
        goto LABEL_14;
      }
      id v17 = [(BKLibraryBookshelfBooksDataSource *)self deletedItemIndexPaths];
      goto LABEL_8;
    case 4uLL:
      id v18 = [(BKLibraryBookshelfBooksDataSource *)self deletedSectionIndexes];
      if (objc_msgSend(v18, "containsIndex:", objc_msgSend(v13, "section"))) {
        goto LABEL_13;
      }
      id v25 = [(BKLibraryBookshelfBooksDataSource *)self deletedItemIndexPaths];
      if ([v25 containsObject:v13])
      {

LABEL_13:
        goto LABEL_14;
      }
      id v26 = [(BKLibraryBookshelfBooksDataSource *)self updatedItemIndexPaths];
      unsigned __int8 v27 = [v26 containsObject:v13];

      if ((v27 & 1) == 0)
      {
        id v17 = [(BKLibraryBookshelfBooksDataSource *)self updatedItemIndexPaths];
LABEL_8:
        id v18 = v17;
        id v19 = v13;
LABEL_9:
        [v17 addObject:v19];
        goto LABEL_13;
      }
LABEL_14:

      return;
    default:
      goto LABEL_14;
  }
}

- (void)controller:(id)a3 didChangeSection:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a6 == 2)
  {
    id v13 = [(BKLibraryBookshelfBooksDataSource *)self deletedSectionIndexes];
    [v13 addIndex:a5];

    id v14 = +[NSMutableArray array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    unsigned int v15 = [(BKLibraryBookshelfBooksDataSource *)self deletedItemIndexPaths];
    id v16 = [v15 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ([v20 section] == (id)a5) {
            [v14 addObject:v20];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v17);
    }

    unsigned __int8 v21 = [(BKLibraryBookshelfBooksDataSource *)self deletedItemIndexPaths];
    [v21 removeObjectsInArray:v14];

    [v14 removeAllObjects];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v22 = [(BKLibraryBookshelfBooksDataSource *)self updatedItemIndexPaths];
    id v23 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v30;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(v22);
          }
          unsigned __int8 v27 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
          if ([v27 section] == (id)a5) {
            [v14 addObject:v27];
          }
        }
        id v24 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v24);
    }

    id v28 = [(BKLibraryBookshelfBooksDataSource *)self updatedItemIndexPaths];
    [v28 removeObjectsInArray:v14];
  }
  else if (a6 == 1)
  {
    id v12 = [(BKLibraryBookshelfBooksDataSource *)self insertedSectionIndexes];
    [v12 addIndex:a5];
  }
}

- (void)clearChanges
{
  [(BKLibraryBookshelfBooksDataSource *)self setInsertedSectionIndexes:0];
  [(BKLibraryBookshelfBooksDataSource *)self setDeletedSectionIndexes:0];
  [(BKLibraryBookshelfBooksDataSource *)self setDeletedItemIndexPaths:0];
  [(BKLibraryBookshelfBooksDataSource *)self setInsertedItemIndexPaths:0];

  [(BKLibraryBookshelfBooksDataSource *)self setUpdatedItemIndexPaths:0];
}

- (void)controllerDidChangeContent:(id)a3
{
  id v15 = a3;
  if (![(BKLibraryBookshelfBooksDataSource *)self suppressChangeNotification])
  {
    if ([(BKLibraryBookshelfBooksDataSource *)self numItemsBeforeChange])
    {
      id v4 = [v15 fetchedObjects];
      BOOL v5 = [v4 count] == 0;
    }
    else
    {
      BOOL v5 = 1;
    }
    int64_t v6 = [(BKLibraryBookshelfBooksDataSource *)self delegate];
    id v7 = [(BKLibraryBookshelfBooksDataSource *)self insertedSectionIndexes];
    unsigned int v8 = [(BKLibraryBookshelfBooksDataSource *)self deletedSectionIndexes];
    id v9 = [(BKLibraryBookshelfBooksDataSource *)self insertedItemIndexPaths];
    id v10 = [(BKLibraryBookshelfBooksDataSource *)self deletedItemIndexPaths];
    id v11 = [(BKLibraryBookshelfBooksDataSource *)self updatedItemIndexPaths];
    LOBYTE(v14) = v5;
    [v6 booksDataSource:self insertedSections:v7 deletedSections:v8 insertedItems:v9 deletedItems:v10 updatedItems:v11 mayHaveZeroObjects:v14];

    id v12 = [(BKLibraryBookshelfBooksDataSource *)self insertedItemIndexPaths];
    id v13 = [v12 count];

    if (v13) {
      [(BKLibraryBookshelfBooksDataSource *)self _loadProductInfoData];
    }
  }
  [(BKLibraryBookshelfBooksDataSource *)self clearChanges];
}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [(BKLibraryBookshelfBooksDataSource *)self frc];
  id v9 = [v8 fetchedObjects];
  id v18 = [v9 mutableCopy];

  id v10 = [v18 objectAtIndex:[v7 row]];
  id v11 = [v7 row];

  [v18 removeObjectAtIndex:v11];
  id v12 = [v6 row];

  [v18 insertObject:v10 atIndex:v12];
  if (+[BKUserSortOrderManager resortDescendingSortKeyedObjects:v18])
  {
    id v13 = +[BKLibraryManager defaultManager];
    uint64_t v14 = [v13 uiChildContext];
    unsigned int v15 = [v14 hasChanges];

    if (v15)
    {
      [(BKLibraryBookshelfBooksDataSource *)self setSuppressChangeNotification:1];
      id v16 = [v13 uiChildContext];
      [v16 setSaveContext:2];

      id v17 = [v13 uiChildContext];
      [v17 save:0];

      [(BKLibraryBookshelfBooksDataSource *)self setSuppressChangeNotification:0];
    }
  }
}

- (BKLibraryBookshelfBooksDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKLibraryBookshelfBooksDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)extendedDataAccessQueue
{
  return self->_extendedDataAccessQueue;
}

- (void)setExtendedDataAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (NSMutableDictionary)assetReviewData
{
  return self->_assetReviewData;
}

- (void)setAssetReviewData:(id)a3
{
}

- (NSMutableDictionary)productInfoData
{
  return self->_productInfoData;
}

- (void)setProductInfoData:(id)a3
{
}

- (NSMutableDictionary)resourceCache
{
  return self->_resourceCache;
}

- (void)setResourceCache:(id)a3
{
}

- (NSMutableSet)checkedAssetIDs
{
  return self->_checkedAssetIDs;
}

- (void)setCheckedAssetIDs:(id)a3
{
}

- (NSMutableSet)checkedProductProfileIDs
{
  return self->_checkedProductProfileIDs;
}

- (void)setCheckedProductProfileIDs:(id)a3
{
}

- (NSMutableSet)checkedResourceIDs
{
  return self->_checkedResourceIDs;
}

- (void)setCheckedResourceIDs:(id)a3
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

- (NSFetchedResultsController)frc
{
  return self->_frc;
}

- (void)setFrc:(id)a3
{
}

- (BKLibraryBookshelfSortModeProviding)sortModeProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sortModeProvider);

  return (BKLibraryBookshelfSortModeProviding *)WeakRetained;
}

- (void)setSortModeProvider:(id)a3
{
}

- (NSMutableIndexSet)insertedSectionIndexes
{
  return self->_insertedSectionIndexes;
}

- (void)setInsertedSectionIndexes:(id)a3
{
}

- (NSMutableIndexSet)deletedSectionIndexes
{
  return self->_deletedSectionIndexes;
}

- (void)setDeletedSectionIndexes:(id)a3
{
}

- (NSMutableArray)deletedItemIndexPaths
{
  return self->_deletedItemIndexPaths;
}

- (void)setDeletedItemIndexPaths:(id)a3
{
}

- (NSMutableArray)insertedItemIndexPaths
{
  return self->_insertedItemIndexPaths;
}

- (void)setInsertedItemIndexPaths:(id)a3
{
}

- (NSMutableArray)updatedItemIndexPaths
{
  return self->_updatedItemIndexPaths;
}

- (void)setUpdatedItemIndexPaths:(id)a3
{
}

- (BOOL)isSeries
{
  return self->_isSeries;
}

- (void)setIsSeries:(BOOL)a3
{
  self->_isSeries = a3;
}

- (BOOL)hasSeriesSequenceLabel
{
  return self->_hasSeriesSequenceLabel;
}

- (void)setHasSeriesSequenceLabel:(BOOL)a3
{
  self->_hasSeriesSequenceLabel = a3;
}

- (BOOL)providesReviewData
{
  return self->_providesReviewData;
}

- (void)setProvidesReviewData:(BOOL)a3
{
  self->_providesReviewData = a3;
}

- (BOOL)providesProductInfoData
{
  return self->_providesProductInfoData;
}

- (void)setProvidesProductInfoData:(BOOL)a3
{
  self->_providesProductInfoData = a3;
}

- (BOOL)suppressChangeNotification
{
  return self->_suppressChangeNotification;
}

- (void)setSuppressChangeNotification:(BOOL)a3
{
  self->_suppressChangeNotification = a3;
}

- (NSPredicate)productInfoFilter
{
  return self->_productInfoFilter;
}

- (void)setProductInfoFilter:(id)a3
{
}

- (void)setAssetReviewManager:(id)a3
{
  self->_assetReviewManager = (BCCloudAssetReviewManager *)a3;
}

- (int64_t)numItemsBeforeChange
{
  return self->_numItemsBeforeChange;
}

- (void)setNumItemsBeforeChange:(int64_t)a3
{
  self->_numItemsBeforeChange = a3;
}

- (BCMutableCloudSyncVersions)currentCloudSyncVersions
{
  return self->_currentCloudSyncVersions;
}

- (void)setCurrentCloudSyncVersions:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedReloadData
{
  return self->_coalescedReloadData;
}

- (void)setCoalescedReloadData:(id)a3
{
}

- (NSSet)propertiesOfInterest
{
  return self->_propertiesOfInterest;
}

- (void)setPropertiesOfInterest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesOfInterest, 0);
  objc_storeStrong((id *)&self->_coalescedReloadData, 0);
  objc_storeStrong((id *)&self->_currentCloudSyncVersions, 0);
  objc_storeStrong((id *)&self->_productInfoFilter, 0);
  objc_storeStrong((id *)&self->_updatedItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_insertedItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_deletedItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_deletedSectionIndexes, 0);
  objc_storeStrong((id *)&self->_insertedSectionIndexes, 0);
  objc_destroyWeak((id *)&self->_sortModeProvider);
  objc_storeStrong((id *)&self->_frc, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
  objc_storeStrong((id *)&self->_checkedResourceIDs, 0);
  objc_storeStrong((id *)&self->_checkedProductProfileIDs, 0);
  objc_storeStrong((id *)&self->_checkedAssetIDs, 0);
  objc_storeStrong((id *)&self->_resourceCache, 0);
  objc_storeStrong((id *)&self->_productInfoData, 0);
  objc_storeStrong((id *)&self->_assetReviewData, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_extendedDataAccessQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_loadResourcesForAssetIDs:(NSArray *)a3 audiobookAssetIDs:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  id v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  unsigned int v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100B3A740;
  v15[5] = v13;
  id v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100B2C0F0;
  v16[5] = v15;
  id v17 = a3;
  id v18 = a4;
  id v19 = self;
  sub_1006EB59C((uint64_t)v11, (uint64_t)&unk_100B33060, (uint64_t)v16);
  swift_release();
}

@end