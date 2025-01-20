@interface BKLibraryProvider
+ (id)continueReadingAssetsProvider:(unint64_t)a3;
+ (id)endOfBookTopPicksProvider:(id)a3 :(unint64_t)a4;
+ (id)localStoreAssetsLibraryProvider:(unint64_t)a3;
+ (id)mySamplesLibraryProvider:(unint64_t)a3;
+ (id)previouslyReadAssetsProvider;
+ (id)recentAudiobookAssetProvider:(unint64_t)a3;
+ (id)recentAudiobookAssetProviderForCarplay;
+ (id)recentLibraryAssetsProvider:(unint64_t)a3;
+ (id)recentlyEngagedAssetsProvider:(unint64_t)a3;
+ (id)searchLibraryProvider:(id)a3 :(unint64_t)a4;
+ (id)storeAssetProvider:(unint64_t)a3;
+ (id)wantToReadLibraryProvider:(unint64_t)a3;
- (BKLibraryProvider)initWithFetchRequest:(id)a3 name:(id)a4;
- (BKLibraryProvider)initWithFetchRequest:(id)a3 name:(id)a4 moc:(id)a5;
- (BKLibraryProviderDelegate)delegate;
- (BOOL)isContentLoaded;
- (BSUIDynamicArray)dynamicArray;
- (NSFetchedResultsController)fetchedResultsController;
- (NSManagedObjectContext)moc;
- (NSMutableSet)objectsToRefresh;
- (NSString)name;
- (TUIIndexMapper)pendingUpdates;
- (id)_assetDictionariesForDynamicArrayWithFetchRequest:(id)a3 isInitialFetch:(BOOL)a4 matchedAssets:(id)a5;
- (id)assetsFromFetchRequestResults:(id)a3;
- (id)dictionariesFromAssets:(id)a3 limit:(unint64_t)a4;
- (id)fetchedContent;
- (void)_commonInitWithFetchRequest:(id)a3 name:(id)a4 moc:(id)a5;
- (void)_mocDidChangeNotification:(id)a3;
- (void)_mocDidMergeNotification:(id)a3;
- (void)_mocDidSaveNotification:(id)a3;
- (void)_refreshObjectsIfNeeded;
- (void)configureDynamicArray;
- (void)configureFetchedResultsControllerWithFetchRequest:(id)a3;
- (void)configureMOC:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDynamicArray:(id)a3;
- (void)setFetchedResultsController:(id)a3;
- (void)setMoc:(id)a3;
- (void)setObjectsToRefresh:(id)a3;
- (void)setPendingUpdates:(id)a3;
@end

@implementation BKLibraryProvider

+ (id)recentlyEngagedAssetsProvider:(unint64_t)a3
{
  v5 = +[BKLibraryManager fetchRequestForRecentlyEngaged];
  [v5 setReturnsObjectsAsFaults:0];
  if (a3 <= 1) {
    unint64_t v6 = 1;
  }
  else {
    unint64_t v6 = a3;
  }
  [v5 setFetchLimit:v6];
  id v7 = [objc_alloc((Class)a1) initWithFetchRequest:v5 name:@"recents"];

  return v7;
}

+ (id)storeAssetProvider:(unint64_t)a3
{
  id v5 = objc_alloc((Class)NSFetchRequest);
  unint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [v5 initWithEntityName:v7];

  [v8 setReturnsObjectsAsFaults:0];
  v9 = +[NSSortDescriptor sortDescriptorWithKey:@"lastOpenDate" ascending:0];
  v14 = v9;
  v10 = +[NSArray arrayWithObjects:&v14 count:1];
  [v8 setSortDescriptors:v10];

  v11 = +[BKLibraryManager predicateForPurchasedLibraryAssets];
  [v8 setPredicate:v11];

  if (a3) {
    [v8 setFetchLimit:a3];
  }
  id v12 = [objc_alloc((Class)a1) initWithFetchRequest:v8 name:@"store-assets"];

  return v12;
}

- (void)setDelegate:(id)a3
{
}

+ (id)wantToReadLibraryProvider:(unint64_t)a3
{
  id v5 = objc_alloc((Class)NSFetchRequest);
  unint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [v5 initWithEntityName:v7];

  [v8 setReturnsObjectsAsFaults:0];
  id v9 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortKey" ascending:0];
  v19[0] = v9;
  v10 = +[NSSortDescriptor sortDescriptorWithKey:@"assetID" ascending:0];
  v19[1] = v10;
  v11 = +[NSArray arrayWithObjects:v19 count:2];
  [v8 setSortDescriptors:v11];

  id v12 = +[BKLibraryManager predicateForCollectionMembersInCollectionID:kBKCollectionDefaultIDWantToRead hideUnownedItems:0];
  v18[0] = v12;
  v13 = +[BKLibraryManager predicateForExcludingCollectionMembersWithContainerLibraryAssets];
  v18[1] = v13;
  v14 = +[NSArray arrayWithObjects:v18 count:2];
  v15 = +[NSCompoundPredicate andPredicateWithSubpredicates:v14];
  [v8 setPredicate:v15];

  if (a3) {
    [v8 setFetchLimit:a3];
  }
  id v16 = [objc_alloc((Class)a1) initWithFetchRequest:v8 name:@"want-to-read"];

  return v16;
}

+ (id)mySamplesLibraryProvider:(unint64_t)a3
{
  id v5 = objc_alloc((Class)NSFetchRequest);
  unint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [v5 initWithEntityName:v7];

  [v8 setReturnsObjectsAsFaults:0];
  id v9 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortKey" ascending:0];
  v19[0] = v9;
  v10 = +[NSSortDescriptor sortDescriptorWithKey:@"assetID" ascending:0];
  v19[1] = v10;
  v11 = +[NSArray arrayWithObjects:v19 count:2];
  [v8 setSortDescriptors:v11];

  id v12 = +[BKLibraryManager predicateForCollectionMembersInCollectionID:kBKCollectionDefaultIDSamples hideUnownedItems:0];
  v18[0] = v12;
  v13 = +[BKLibraryManager predicateForExcludingCollectionMembersWithContainerLibraryAssets];
  v18[1] = v13;
  v14 = +[NSArray arrayWithObjects:v18 count:2];
  v15 = +[NSCompoundPredicate andPredicateWithSubpredicates:v14];
  [v8 setPredicate:v15];

  if (a3) {
    [v8 setFetchLimit:a3];
  }
  id v16 = [objc_alloc((Class)a1) initWithFetchRequest:v8 name:@"my-samples"];

  return v16;
}

- (BSUIDynamicArray)dynamicArray
{
  v2 = self->_dynamicArray;
  v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 BOOLForKey:@"BCRecentBooksForceEmpty"];

  if (v4)
  {
    id v5 = objc_alloc((Class)BSUIDynamicArray);
    v9[0] = @"uniqueId";
    v9[1] = @"updateType";
    v10[0] = BSUIAssetKeyAssetID;
    v10[1] = @"move";
    v9[2] = @"debugName";
    v10[2] = @"BKLibraryProvider.recentBooks.fake";
    unint64_t v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
    id v7 = (BSUIDynamicArray *)[v5 initWithArray:&__NSArray0__struct options:v6];

    v2 = v7;
  }

  return v2;
}

- (NSFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (BKLibraryProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (BKLibraryProviderDelegate *)WeakRetained;
}

- (void)setFetchedResultsController:(id)a3
{
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (id)assetsFromFetchRequestResults:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = [v9 asset];
          v11 = BUDynamicCast();
        }
        else
        {
          v11 = BUDynamicCast();
        }
        id v12 = [objc_alloc((Class)BSUIAsset) initWithLibraryAsset:v11];
        [v4 addObject:v12];
      }
      id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)_assetDictionariesForDynamicArrayWithFetchRequest:(id)a3 isInitialFetch:(BOOL)a4 matchedAssets:(id)a5
{
  id v7 = a5;
  id v8 = -[BKLibraryProvider dictionariesFromAssets:limit:](self, "dictionariesFromAssets:limit:", v7, [a3 fetchLimit]);

  return v8;
}

- (id)dictionariesFromAssets:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v6 count]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10013249C;
  v12[3] = &unk_100A47B00;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  id v14 = v8;
  long long v15 = self;
  unint64_t v16 = a4;
  id v9 = v13;
  [v6 enumerateObjectsUsingBlock:v12];

  id v10 = v8;
  return v10;
}

- (BKLibraryProvider)initWithFetchRequest:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKLibraryProvider;
  id v8 = [(BKLibraryProvider *)&v12 init];
  if (v8)
  {
    id v9 = +[_BKLibraryProviderContext sharedInstance];
    id v10 = [v9 moc];
    [(BKLibraryProvider *)v8 _commonInitWithFetchRequest:v6 name:v7 moc:v10];
  }
  return v8;
}

- (void)_commonInitWithFetchRequest:(id)a3 name:(id)a4 moc:(id)a5
{
  id v8 = a5;
  id v13 = a3;
  id v9 = (NSString *)[a4 copy];
  name = self->_name;
  self->_name = v9;

  v11 = (NSMutableSet *)objc_opt_new();
  objectsToRefresh = self->_objectsToRefresh;
  self->_objectsToRefresh = v11;

  [(BKLibraryProvider *)self configureMOC:v8];
  [(BKLibraryProvider *)self configureDynamicArray];
  [(BKLibraryProvider *)self configureFetchedResultsControllerWithFetchRequest:v13];
}

- (void)configureMOC:(id)a3
{
  objc_storeStrong((id *)&self->_moc, a3);
  id v5 = a3;
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_mocDidSaveNotification:" name:NSManagedObjectContextDidSaveNotification object:self->_moc];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_mocDidChangeNotification:" name:NSManagedObjectContextObjectsDidChangeNotification object:self->_moc];

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"_mocDidMergeNotification:" name:NSManagedObjectContextDidMergeChangesObjectIDsNotification object:self->_moc];
}

- (void)configureFetchedResultsControllerWithFetchRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_100062F14();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1007EBFBC((uint64_t)self, v5);
    }

    moc = self->_moc;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100062BC8;
    void v9[3] = &unk_100A43DD8;
    v9[4] = self;
    id v10 = v4;
    [(NSManagedObjectContext *)moc performBlock:v9];
  }
  else
  {
    id v7 = self->_moc;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100132120;
    v8[3] = &unk_100A43D60;
    v8[4] = self;
    [(NSManagedObjectContext *)v7 performBlock:v8];
  }
}

- (void)configureDynamicArray
{
  id v3 = objc_alloc((Class)BSUIDynamicArray);
  v9[0] = @"uniqueId";
  v9[1] = @"updateType";
  v10[0] = BSUIAssetKeyAssetID;
  v10[1] = @"move";
  v9[2] = @"debugName";
  if (self->_name) {
    CFStringRef name = (const __CFString *)self->_name;
  }
  else {
    CFStringRef name = @"unknown";
  }
  id v5 = [@"BKLibraryProvider." stringByAppendingString:name];
  v10[2] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  id v7 = (BSUIDynamicArray *)[v3 initWithArray:&__NSArray0__struct options:v6];
  dynamicArray = self->_dynamicArray;
  self->_dynamicArray = v7;
}

+ (id)localStoreAssetsLibraryProvider:(unint64_t)a3
{
  id v5 = objc_alloc((Class)NSFetchRequest);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [v5 initWithEntityName:v7];

  [v8 setReturnsObjectsAsFaults:0];
  id v9 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"storeID" ascending:0];
  id v14 = v9;
  id v10 = +[NSArray arrayWithObjects:&v14 count:1];
  [v8 setSortDescriptors:v10];

  v11 = +[BKLibraryManager predicateForLocalOrDownloadingStoreAssets];
  [v8 setPredicate:v11];

  if (a3) {
    [v8 setFetchLimit:a3];
  }
  id v12 = [objc_alloc((Class)a1) initWithFetchRequest:v8 name:@"local-store-assets"];

  return v12;
}

+ (id)searchLibraryProvider:(id)a3 :(unint64_t)a4
{
  id v5 = a3;
  id v6 = [[BKLibrarySearchProvider alloc] initWithFetchRequest:0 name:@"search" searchTerm:v5 limit:a4];

  return v6;
}

+ (id)recentLibraryAssetsProvider:(unint64_t)a3
{
  id v5 = objc_alloc((Class)NSFetchRequest);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [v5 initWithEntityName:v7];

  [v8 setReturnsObjectsAsFaults:0];
  id v9 = +[NSSortDescriptor sortDescriptorWithKey:@"lastOpenDate" ascending:0];
  long long v15 = v9;
  id v10 = +[NSArray arrayWithObjects:&v15 count:1];
  [v8 setSortDescriptors:v10];

  v11 = +[BKLibraryManager predicateForAllOwnedBooks];
  [v8 setPredicate:v11];

  if (a3 <= 1) {
    unint64_t v12 = 1;
  }
  else {
    unint64_t v12 = a3;
  }
  [v8 setFetchLimit:v12];
  id v13 = [objc_alloc((Class)a1) initWithFetchRequest:v8 name:@"recents"];

  return v13;
}

+ (id)recentAudiobookAssetProvider:(unint64_t)a3
{
  id v5 = objc_alloc((Class)NSFetchRequest);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [v5 initWithEntityName:v7];

  [v8 setReturnsObjectsAsFaults:0];
  id v9 = +[NSSortDescriptor sortDescriptorWithKey:@"lastOpenDate" ascending:0];
  id v14 = v9;
  id v10 = +[NSArray arrayWithObjects:&v14 count:1];
  [v8 setSortDescriptors:v10];

  v11 = +[BKLibraryManager predicateForAllOwnedAudiobooks];
  [v8 setPredicate:v11];

  if (a3) {
    [v8 setFetchLimit:a3];
  }
  id v12 = [objc_alloc((Class)a1) initWithFetchRequest:v8 name:@"recent-audiobooks"];

  return v12;
}

+ (id)recentAudiobookAssetProviderForCarplay
{
  id v3 = objc_alloc((Class)NSFetchRequest);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithEntityName:v5];

  [v6 setReturnsObjectsAsFaults:0];
  id v7 = +[NSSortDescriptor sortDescriptorWithKey:@"lastOpenDate" ascending:0];
  id v12 = v7;
  id v8 = +[NSArray arrayWithObjects:&v12 count:1];
  [v6 setSortDescriptors:v8];

  id v9 = +[BKLibraryManager predicateForAllOwnedAudiobooks];
  [v6 setPredicate:v9];

  id v10 = [objc_alloc((Class)a1) initWithFetchRequest:v6 name:@"recent-audiobooks-carplay"];

  return v10;
}

+ (id)continueReadingAssetsProvider:(unint64_t)a3
{
  id v5 = +[BKLibraryManager fetchRequestForContinueReading];
  [v5 setReturnsObjectsAsFaults:0];
  if (a3) {
    [v5 setFetchLimit:a3];
  }
  id v6 = [objc_alloc((Class)a1) initWithFetchRequest:v5 name:@"continueReading"];
  [v6 setDynamicArray:0];

  return v6;
}

+ (id)previouslyReadAssetsProvider
{
  id v3 = +[BKLibraryManager fetchRequestForPreviouslyRead];
  [v3 setReturnsObjectsAsFaults:0];
  id v4 = [objc_alloc((Class)a1) initWithFetchRequest:v3 name:@"previouslyRead"];

  return v4;
}

+ (id)endOfBookTopPicksProvider:(id)a3 :(unint64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = +[BCRCDataContainer defaultContainer];
  id v8 = [v7 configs];
  id v9 = [v8 objectForKeyedSubscript:@"readingNow"];
  id v10 = BUDynamicCast();

  if (v10)
  {
    objc_opt_class();
    v11 = [v10 objectForKeyedSubscript:@"endOfBookFinishedPercentage"];
    id v12 = BUDynamicCast();

    uint64_t v13 = (uint64_t)[v12 integerValue];
    if (v13 >= 100) {
      uint64_t v14 = 100;
    }
    else {
      uint64_t v14 = v13;
    }
    double v15 = 0.6;
    if (v12) {
      BOOL v16 = v13 < 1;
    }
    else {
      BOOL v16 = 1;
    }
    if (!v16)
    {
      if (v14 < 0)
      {
        long long v17 = sub_100062F14();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v35 = v12;
          __int16 v36 = 2048;
          uint64_t v37 = v14;
          __int16 v38 = 2048;
          double v39 = (double)v14;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Remote value for finished percentage was invalid when converted to float: num:%@ / int:%ld / float:%f", buf, 0x20u);
        }
      }
      else if ((unint64_t)v14 < 2)
      {
        double v15 = (double)v14;
      }
      else
      {
        double v15 = (double)v14;
        do
          double v15 = v15 / 10.0;
        while (v15 > 1.0);
      }
    }
  }
  else
  {
    double v15 = 0.6;
  }

  id v18 = objc_alloc((Class)NSFetchRequest);
  v19 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v19);
  id v21 = [v18 initWithEntityName:v20];

  [v21 setReturnsObjectsAsFaults:0];
  v22 = +[NSSortDescriptor sortDescriptorWithKey:@"bookHighWaterMarkProgress" ascending:0];
  v33 = v22;
  v23 = +[NSArray arrayWithObjects:&v33 count:1];
  [v21 setSortDescriptors:v23];

  v24 = +[BKLibraryManager predicateForPurchasedLibraryAssets];
  v32[0] = v24;
  v25 = +[BKLibraryManager predicateForContentWithHighWaterMarkOrReadingProgressValue:v15];
  v32[1] = v25;
  v26 = +[NSArray arrayWithObjects:v32 count:2];
  id v27 = [v26 mutableCopy];

  v28 = +[BKLibraryManager predicateForLastOpenedDateAfter:v6];
  if (v28) {
    [v27 addObject:v28];
  }
  v29 = +[NSCompoundPredicate andPredicateWithSubpredicates:v27];
  [v21 setPredicate:v29];

  if (a4) {
    [v21 setFetchLimit:a4];
  }
  id v30 = [objc_alloc((Class)a1) initWithFetchRequest:v21 name:@"eob-top-picks"];

  return v30;
}

- (BKLibraryProvider)initWithFetchRequest:(id)a3 name:(id)a4 moc:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryProvider;
  v11 = [(BKLibraryProvider *)&v14 init];
  id v12 = v11;
  if (v11) {
    [(BKLibraryProvider *)v11 _commonInitWithFetchRequest:v8 name:v9 moc:v10];
  }

  return v12;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSManagedObjectContextObjectsDidChangeNotification object:self->_moc];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:NSManagedObjectContextDidMergeChangesObjectIDsNotification object:self->_moc];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:NSManagedObjectContextDidSaveNotification object:0];

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryProvider;
  [(BKLibraryProvider *)&v6 dealloc];
}

- (BOOL)isContentLoaded
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(BKLibraryProvider *)self moc];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10013228C;
  v5[3] = &unk_100A44058;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)fetchedContent
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100006FE4;
  v11 = sub_1000071DC;
  id v12 = 0;
  id v3 = [(BKLibraryProvider *)self moc];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100132414;
  v6[3] = &unk_100A44170;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockAndWait:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryProvider *)self fetchedResultsController];

  if (v5 == v4)
  {
    id v6 = objc_alloc((Class)TUIIndexMapper);
    uint64_t v7 = [v4 fetchedObjects];
    id v8 = [v6 initWithCount:[v7 count]];
    [(BKLibraryProvider *)self setPendingUpdates:v8];

    uint64_t v9 = sub_100062F14();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1007EC234(self, v4);
    }
  }
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v11 = a5;
  id v12 = a7;
  id v13 = a3;
  id v14 = [(BKLibraryProvider *)self fetchedResultsController];

  if (v14 == v13)
  {
    switch(a6)
    {
      case 1uLL:
        double v15 = [(BKLibraryProvider *)self pendingUpdates];
        [v15 insertAtIndex:[v12 row]];
        goto LABEL_10;
      case 2uLL:
        double v15 = [(BKLibraryProvider *)self pendingUpdates];
        [v15 deleteAtIndex:[v11 row]];
        goto LABEL_10;
      case 3uLL:
        double v15 = [(BKLibraryProvider *)self pendingUpdates];
        [v15 moveFromIndex:[v11 row] toIndex:[v12 row]];
        goto LABEL_10;
      case 4uLL:
        double v15 = [(BKLibraryProvider *)self pendingUpdates];
        [v15 updateAtIndex:[v11 row]];
LABEL_10:

        break;
      default:
        BOOL v16 = sub_100062F14();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          sub_1007EC314(self);
        }

        break;
    }
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryProvider *)self fetchedResultsController];

  if (v5 == v4)
  {
    id v6 = [(BKLibraryProvider *)self pendingUpdates];
    [(BKLibraryProvider *)self setPendingUpdates:0];
    uint64_t v7 = [(BKLibraryProvider *)self moc];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001328F0;
    void v9[3] = &unk_100A443C8;
    v9[4] = self;
    id v10 = v4;
    id v11 = v6;
    id v8 = v6;
    [v7 performBlockAndWait:v9];
  }
}

- (void)_mocDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryProvider *)self fetchedResultsController];
  id v6 = [v5 fetchRequest];
  uint64_t v7 = [v6 entity];

  id v8 = [v7 name];
  uint64_t v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  unsigned int v11 = [v8 isEqualToString:v10];

  if (v11)
  {
    id v12 = [(BKLibraryProvider *)self moc];
    id v13 = +[NSEntityDescription entityForName:@"BKLibraryAsset" inManagedObjectContext:v12];

    id v14 = [v4 userInfo];
    double v15 = [v14 objectForKeyedSubscript:NSRefreshedObjectsKey];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10013316C;
    v17[3] = &unk_100A47BA0;
    id v18 = v13;
    v19 = self;
    id v16 = v13;
    [v15 enumerateObjectsUsingBlock:v17];
  }
}

- (void)_refreshObjectsIfNeeded
{
  if ([(NSMutableSet *)self->_objectsToRefresh count])
  {
    id v3 = [(BKLibraryProvider *)self fetchedResultsController];
    id v4 = [v3 fetchedObjects];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1001332BC;
    v5[3] = &unk_100A47BC8;
    v5[4] = self;
    [v4 enumerateObjectsUsingBlock:v5];

    [(NSMutableSet *)self->_objectsToRefresh removeAllObjects];
  }
}

- (void)_mocDidMergeNotification:(id)a3
{
}

- (void)_mocDidSaveNotification:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (TUIIndexMapper)pendingUpdates
{
  return self->_pendingUpdates;
}

- (void)setPendingUpdates:(id)a3
{
}

- (void)setDynamicArray:(id)a3
{
}

- (void)setMoc:(id)a3
{
}

- (NSMutableSet)objectsToRefresh
{
  return self->_objectsToRefresh;
}

- (void)setObjectsToRefresh:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsToRefresh, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_dynamicArray, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_destroyWeak((id *)&self->delegate);

  objc_storeStrong((id *)&self->_name, 0);
}

@end