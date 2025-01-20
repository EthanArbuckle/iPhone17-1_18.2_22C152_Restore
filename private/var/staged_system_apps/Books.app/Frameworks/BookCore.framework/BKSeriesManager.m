@interface BKSeriesManager
+ (id)itemFetchProperties;
+ (id)sharedManager;
- (BCMBridgedCatalogService)catalogService;
- (BKSeriesDatabase)database;
- (BKSeriesManager)init;
- (BKSeriesManager)initWithDatabase:(id)a3 catalogService:(id)a4;
- (BOOL)isFetchingSeries;
- (NSArray)pendingAdamIds;
- (OS_dispatch_queue)queue;
- (double)timeOut;
- (id)allSeriesContainerIds;
- (id)allSeriesContainerIdsInManagedObjectContext:(id)a3;
- (id)allSeriesItemAdamIds;
- (id)allSeriesItemAdamIdsInManagedObjectContext:(id)a3;
- (id)allSeriesItemsForAdamIDs:(id)a3;
- (id)allSeriesItemsForAdamIDs:(id)a3 inManagedObjectContext:(id)a4;
- (id)allSeriesItemsInSeries:(id)a3;
- (id)allSeriesItemsInSeries:(id)a3 inManagedObjectContext:(id)a4;
- (id)seriesContainerIdsMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4;
- (id)seriesContainerWithSeriesId:(id)a3;
- (id)seriesContainerWithSeriesId:(id)a3 inManagedObjectContext:(id)a4;
- (id)seriesIDsReferencedByAdamIds:(id)a3 inManagedObjectContext:(id)a4;
- (id)seriesItemAdamIdsMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4;
- (id)seriesItemWithAdamId:(id)a3;
- (id)seriesItemWithAdamId:(id)a3 inManagedObjectContext:(id)a4;
- (id)seriesItemsWithAdamIds:(id)a3;
- (void)_updateSeriesForAssetAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4 completion:(id)a5;
- (void)_updateSeriesForSeriesAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4 completion:(id)a5;
- (void)fetchBuyParametersForSeriesWithAdamID:(id)a3 isAudiobook:(BOOL)a4 completionHandler:(id)a5;
- (void)setCatalogService:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setIsFetchingSeries:(BOOL)a3;
- (void)setPendingAdamIds:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimeOut:(double)a3;
- (void)updateAssetsFromCloudSyncForAssetAdamIDsWithTypes:(id)a3 completion:(id)a4;
- (void)updateExpiredSeriesForAssetAdamIDsWithTypes:(id)a3;
- (void)updateSeriesForAssetAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4;
- (void)updateSeriesForSeriesAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4;
@end

@implementation BKSeriesManager

+ (id)sharedManager
{
  if (qword_349670[0] != -1) {
    dispatch_once(qword_349670, &stru_2CAF08);
  }
  v2 = (void *)qword_349668;

  return v2;
}

+ (id)itemFetchProperties
{
  v4[0] = @"adamId";
  v4[1] = @"author";
  v4[2] = @"authorCount";
  v4[3] = @"authorNames";
  v4[4] = @"coverAspectRatio";
  v4[5] = @"genre";
  v4[6] = @"genres";
  v4[7] = @"hasTooManyAuthors";
  v4[8] = @"hasTooManyNarrators";
  v4[9] = @"isAudiobook";
  v4[10] = @"isContainer";
  v4[11] = @"isExplicit";
  v4[12] = @"mappedItemId";
  v4[13] = @"mappedItemTypeRaw";
  v4[14] = @"narratorCount";
  v4[15] = @"narratorNames";
  v4[16] = @"objectID";
  v4[17] = @"position";
  v4[18] = @"popularity";
  v4[19] = @"releaseDate";
  v4[20] = @"sequenceDisplayName";
  v4[21] = @"sequenceNumber";
  v4[22] = @"seriesAdamId";
  v4[23] = @"seriesIsOrdered";
  v4[24] = @"seriesTitle";
  v4[25] = @"sortTitle";
  v4[26] = @"sortAuthor";
  v4[27] = @"title";
  v4[28] = @"url";
  v2 = +[NSArray arrayWithObjects:v4 count:29];

  return v2;
}

- (BKSeriesManager)initWithDatabase:(id)a3 catalogService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKSeriesManager;
  v9 = [(BKSeriesManager *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    v10->_timeOut = 300.0;
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.BKSeriesManager", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v10->_catalogService, a4);
  }

  return v10;
}

- (BKSeriesManager)init
{
  v3 = objc_alloc_init(BKSeriesDatabase);
  v4 = +[BCMBridgedCatalogService sharedInstance];
  v5 = [(BKSeriesManager *)self initWithDatabase:v3 catalogService:v4];

  return v5;
}

- (id)seriesContainerIdsMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[BKSeriesItem fetchRequest];
  [v7 setPredicate:v6];

  [v7 setResultType:2];
  v15[0] = @"objectID";
  v15[1] = @"seriesAdamId";
  id v8 = +[NSArray arrayWithObjects:v15 count:2];
  [v7 setPropertiesToFetch:v8];

  [v7 setReturnsObjectsAsFaults:0];
  [v7 setReturnsDistinctResults:1];
  [v7 setFetchBatchSize:128];
  id v14 = 0;
  v9 = [v5 executeFetchRequest:v7 error:&v14];

  id v10 = v14;
  if (v9)
  {
    dispatch_queue_t v11 = [v9 valueForKey:@"seriesAdamId"];
  }
  else
  {
    v12 = BCSeriesManagerLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1F0E80((uint64_t)v10, v12);
    }

    dispatch_queue_t v11 = 0;
  }

  return v11;
}

- (id)seriesItemAdamIdsMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[BKSeriesItem fetchRequest];
  [v7 setPredicate:v6];

  [v7 setResultType:2];
  v15[0] = @"objectID";
  v15[1] = @"adamId";
  id v8 = +[NSArray arrayWithObjects:v15 count:2];
  [v7 setPropertiesToFetch:v8];

  [v7 setReturnsObjectsAsFaults:0];
  [v7 setReturnsDistinctResults:1];
  [v7 setFetchBatchSize:128];
  id v14 = 0;
  v9 = [v5 executeFetchRequest:v7 error:&v14];

  id v10 = v14;
  if (v9)
  {
    dispatch_queue_t v11 = [v9 valueForKey:@"adamId"];
  }
  else
  {
    v12 = BCSeriesManagerLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1F0E80((uint64_t)v10, v12);
    }

    dispatch_queue_t v11 = 0;
  }

  return v11;
}

- (id)allSeriesContainerIds
{
  v3 = [(BKSeriesManager *)self database];
  id v4 = [v3 newManagedObjectContext];

  id v5 = [(BKSeriesManager *)self allSeriesContainerIdsInManagedObjectContext:v4];

  return v5;
}

- (id)allSeriesItemAdamIds
{
  v3 = [(BKSeriesManager *)self database];
  id v4 = [v3 newManagedObjectContext];

  id v5 = [(BKSeriesManager *)self allSeriesItemAdamIdsInManagedObjectContext:v4];

  return v5;
}

- (id)allSeriesItemsForAdamIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(BKSeriesManager *)self database];
  id v6 = [v5 newManagedObjectContext];

  id v7 = [(BKSeriesManager *)self allSeriesItemsForAdamIDs:v4 inManagedObjectContext:v6];

  return v7;
}

- (id)allSeriesItemsInSeries:(id)a3
{
  id v4 = a3;
  id v5 = [(BKSeriesManager *)self database];
  id v6 = [v5 newManagedObjectContext];

  id v7 = [(BKSeriesManager *)self allSeriesItemsInSeries:v4 inManagedObjectContext:v6];

  return v7;
}

- (id)seriesContainerWithSeriesId:(id)a3
{
  id v4 = a3;
  id v5 = [(BKSeriesManager *)self database];
  id v6 = [v5 newManagedObjectContext];

  id v7 = [(BKSeriesManager *)self seriesContainerWithSeriesId:v4 inManagedObjectContext:v6];

  return v7;
}

- (id)seriesItemWithAdamId:(id)a3
{
  id v4 = a3;
  id v5 = [(BKSeriesManager *)self database];
  id v6 = [v5 newManagedObjectContext];

  id v7 = [(BKSeriesManager *)self seriesItemWithAdamId:v4 inManagedObjectContext:v6];

  return v7;
}

- (id)allSeriesContainerIdsInManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = +[BKSeriesItem predicateForAllSeriesContainerItems];
  id v6 = [(BKSeriesManager *)self seriesContainerIdsMatchingPredicate:v5 inManagedObjectContext:v4];

  return v6;
}

- (id)allSeriesItemAdamIdsInManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = +[BKSeriesItem predicateForAllBookItems];
  id v6 = [(BKSeriesManager *)self seriesItemAdamIdsMatchingPredicate:v5 inManagedObjectContext:v4];

  return v6;
}

- (id)allSeriesItemsForAdamIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = [(BKSeriesManager *)self seriesIDsReferencedByAdamIds:a3 inManagedObjectContext:v6];
  if ([v7 count])
  {
    id v8 = +[NSSet setWithArray:v7];
    v9 = [v8 allObjects];
    id v10 = +[BKSeriesItem predicateForAllItemsAndContainersInSeries:v9];

    dispatch_queue_t v11 = [(BKSeriesManager *)self seriesItemAdamIdsMatchingPredicate:v10 inManagedObjectContext:v6];
  }
  else
  {
    dispatch_queue_t v11 = 0;
  }

  return v11;
}

- (id)seriesIDsReferencedByAdamIds:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[BKSeriesItem fetchRequest];
  id v8 = +[NSPredicate predicateWithFormat:@"adamId IN %@ AND seriesAdamId != NULL", v6];

  [v7 setPredicate:v8];
  CFStringRef v14 = @"seriesAdamId";
  v9 = +[NSArray arrayWithObjects:&v14 count:1];
  [v7 setPropertiesToFetch:v9];

  uint64_t v13 = 0;
  id v10 = [v5 executeFetchRequest:v7 error:&v13];

  dispatch_queue_t v11 = [v10 valueForKey:@"seriesAdamId"];

  return v11;
}

- (id)allSeriesItemsInSeries:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = +[NSArray arrayWithObject:a3];
  id v8 = +[BKSeriesItem predicateForAllItemsAndContainersInSeries:v7];

  v9 = [(BKSeriesManager *)self seriesItemAdamIdsMatchingPredicate:v8 inManagedObjectContext:v6];

  return v9;
}

- (id)seriesContainerWithSeriesId:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[BKSeriesItem predicateForContainerWithSeriesId:v5];
  id v8 = +[BKSeriesItem fetchRequest];
  [v8 setPredicate:v7];
  [v8 setResultType:2];
  v9 = [(id)objc_opt_class() itemFetchProperties];
  [v8 setPropertiesToFetch:v9];

  [v8 setReturnsObjectsAsFaults:0];
  [v8 setReturnsDistinctResults:1];
  [v8 setFetchLimit:1];
  id v17 = 0;
  id v10 = [v6 executeFetchRequest:v8 error:&v17];

  id v11 = v17;
  if (v10)
  {
    id v12 = [v10 count];
    if (v12)
    {
      id v12 = [v10 lastObject];
      uint64_t v13 = v12;
      if (v12)
      {
        id v12 = +[BKSeriesInfo seriesInfoWithDictionary:v12];
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    CFStringRef v14 = BCSeriesManagerLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1F0EF8();
    }

    uint64_t v13 = 0;
    id v12 = 0;
  }
  id v15 = v12;

  return v15;
}

- (id)seriesItemsWithAdamIds:(id)a3
{
  id v4 = a3;
  id v5 = +[BKSeriesItem fetchRequest];
  id v6 = +[BKSeriesItem predicateForAllItemsAndContainerWithAdamIdInList:v4];

  [v5 setPredicate:v6];
  [v5 setResultType:2];
  id v7 = [(id)objc_opt_class() itemFetchProperties];
  [v5 setPropertiesToFetch:v7];

  [v5 setReturnsObjectsAsFaults:0];
  [v5 setReturnsDistinctResults:1];
  [v5 setFetchBatchSize:32];
  id v8 = [(BKSeriesManager *)self database];
  id v9 = [v8 newManagedObjectContext];
  uint64_t v12 = 0;
  id v10 = [v9 executeFetchRequest:v5 error:&v12];

  return v10;
}

- (id)seriesItemWithAdamId:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[BKSeriesItem predicateForItemWithAdamId:v5];
  id v8 = +[BKSeriesItem fetchRequest];
  [v8 setPredicate:v7];
  [v8 setResultType:2];
  id v9 = [(id)objc_opt_class() itemFetchProperties];
  [v8 setPropertiesToFetch:v9];

  [v8 setReturnsObjectsAsFaults:0];
  [v8 setReturnsDistinctResults:1];
  [v8 setFetchLimit:1];
  id v17 = 0;
  id v10 = [v6 executeFetchRequest:v8 error:&v17];

  id v11 = v17;
  if (v10)
  {
    id v12 = [v10 count];
    if (v12)
    {
      id v12 = [v10 lastObject];
      uint64_t v13 = v12;
      if (v12)
      {
        id v12 = +[BKSeriesInfo seriesInfoWithDictionary:v12];
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    CFStringRef v14 = BCSeriesManagerLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1F0EF8();
    }

    uint64_t v13 = 0;
    id v12 = 0;
  }
  id v15 = v12;

  return v15;
}

- (void)fetchBuyParametersForSeriesWithAdamID:(id)a3 isAudiobook:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4)
  {
    id v21 = v8;
    id v10 = +[NSArray arrayWithObjects:&v21 count:1];
    id v11 = &__NSArray0__struct;
  }
  else
  {
    id v22 = v8;
    id v11 = +[NSArray arrayWithObjects:&v22 count:1];
    id v10 = &__NSArray0__struct;
  }
  id v12 = [(BKSeriesManager *)self catalogService];
  id v13 = objc_alloc((Class)BFMRequestMetadata);
  CFStringRef v14 = +[NSString stringWithFormat:@"%s", "BKSeriesManager.m"];
  id v15 = [v13 initWithFileID:v14 line:392];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_190320;
  v18[3] = &unk_2CAF30;
  id v19 = v8;
  id v20 = v9;
  id v16 = v9;
  id v17 = v8;
  [v12 fetchMixedAssetsWithBookIds:v11 audiobookIds:v10 relationships:0 views:0 additionalParameters:0 batchSize:150 metadata:v15 completionHandler:v18];
}

- (void)updateSeriesForSeriesAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4
{
}

- (void)_updateSeriesForSeriesAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = BCSeriesManagerLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1F0F60((uint64_t)v8, v10);
  }

  if ([v8 hasSeriesTypes])
  {
    id v11 = BCSeriesManagerLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_7D91C, v11, OS_LOG_TYPE_INFO, "Begin Updating Series Adam IDs", buf, 2u);
    }

    id v12 = [(BKSeriesManager *)self queue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    void v15[2] = sub_19057C;
    v15[3] = &unk_2C85E0;
    v15[4] = self;
    id v16 = v8;
    BOOL v18 = a4;
    id v17 = v9;
    dispatch_async(v12, v15);
  }
  else
  {
    id v13 = objc_retainBlock(v9);
    CFStringRef v14 = v13;
    if (v13) {
      (*((void (**)(id))v13 + 2))(v13);
    }
  }
}

- (void)updateSeriesForAssetAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4
{
}

- (void)_updateSeriesForAssetAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = BCSeriesManagerLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v19 = [v8 hasAssetTypes];
    _os_log_impl(&def_7D91C, v10, OS_LOG_TYPE_INFO, "updateSeriesForAssetAdamIDsWithTypes: hasAsset=%{BOOL}d", buf, 8u);
  }

  if ([v8 hasAssetTypes])
  {
    id v11 = [(BKSeriesManager *)self queue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1908B8;
    v14[3] = &unk_2C85E0;
    v14[4] = self;
    id v15 = v8;
    BOOL v17 = a4;
    id v16 = v9;
    dispatch_async(v11, v14);
  }
  else
  {
    id v12 = objc_retainBlock(v9);
    id v13 = v12;
    if (v12) {
      (*((void (**)(id))v12 + 2))(v12);
    }
  }
}

- (void)updateExpiredSeriesForAssetAdamIDsWithTypes:(id)a3
{
  id v4 = a3;
  if ([v4 hasAssetTypes])
  {
    id v5 = [(BKSeriesManager *)self queue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_190B0C;
    v6[3] = &unk_2C3AF8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)updateAssetsFromCloudSyncForAssetAdamIDsWithTypes:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v19 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v11 = BCSeriesManagerLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [v5 objectForKeyedSubscript:v10];
          id v13 = [v12 count];
          CFStringRef v14 = [v5 objectForKeyedSubscript:v10];
          id v15 = [v14 bu_prettyDescription];
          *(_DWORD *)buf = 138543874;
          uint64_t v28 = v10;
          __int16 v29 = 2048;
          id v30 = v13;
          __int16 v31 = 2112;
          v32 = v15;
          _os_log_impl(&def_7D91C, v11, OS_LOG_TYPE_DEFAULT, "Begin updating store cloud assets type=%{public}@, %lu adamIds=%@", buf, 0x20u);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v7);
  }
  if (objc_msgSend(v5, "count", self))
  {
    id v16 = [v18 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_190E1C;
    block[3] = &unk_2C3A40;
    block[4] = v18;
    id v21 = v5;
    id v22 = v19;
    dispatch_async(v16, block);
  }
}

- (BOOL)isFetchingSeries
{
  return self->_isFetchingSeries;
}

- (void)setIsFetchingSeries:(BOOL)a3
{
  self->_isFetchingSeries = a3;
}

- (NSArray)pendingAdamIds
{
  return self->_pendingAdamIds;
}

- (void)setPendingAdamIds:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BCMBridgedCatalogService)catalogService
{
  return self->_catalogService;
}

- (void)setCatalogService:(id)a3
{
}

- (BKSeriesDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (double)timeOut
{
  return self->_timeOut;
}

- (void)setTimeOut:(double)a3
{
  self->_timeOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_catalogService, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_pendingAdamIds, 0);
}

@end