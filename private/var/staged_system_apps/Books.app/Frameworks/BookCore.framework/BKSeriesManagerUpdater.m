@interface BKSeriesManagerUpdater
+ (void)_populateItem:(id)a3 position:(unint64_t)a4 withAssetResource:(id)a5 seriesResource:(id)a6;
+ (void)_populateItem:(id)a3 withSeriesResource:(id)a4 inMoc:(id)a5;
- (BCMBridgedCatalogService)catalogService;
- (BKSeriesDatabase)database;
- (BKSeriesDatabaseManagedObjectContext)managedObjectContext;
- (BKSeriesManager)manager;
- (BKSeriesManagerUpdater)initWithManager:(id)a3 database:(id)a4 catalogService:(id)a5 onFinished:(id)a6;
- (BOOL)isFinished;
- (NSMutableSet)checkedAdamIDs;
- (OS_dispatch_queue)queue;
- (id)_filteredAdamIDs:(id)a3 withIntervalInDays:(double)a4;
- (id)onFinished;
- (void)_intervalInDaysWithCompletion:(id)a3;
- (void)_seriesInfoRequestBatchSizeWithCompletion:(id)a3;
- (void)_updateAssetsFromCloudSyncWithAdamIDs:(id)a3 withAssetResources:(id)a4;
- (void)_updateSeriesChildrenWithAdamIDs:(id)a3 forSeries:(id)a4;
- (void)_updateSeriesContainersWithSeriesIDs:(id)a3 withResources:(id)a4;
- (void)_updateSeriesForAssetIDsWithTypes:(id)a3 forceCheck:(BOOL)a4;
- (void)_updateSeriesForSeriesAdamIDsWithFilteredTypes:(id)a3;
- (void)cancel;
- (void)finish;
- (void)recordAdamIDsAsChecked:(id)a3;
- (void)setCatalogService:(id)a3;
- (void)setCheckedAdamIDs:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setManager:(id)a3;
- (void)setOnFinished:(id)a3;
- (void)setQueue:(id)a3;
- (void)updateAssetsFromCloudSyncForAssetAdamIDsWithTypes:(id)a3;
- (void)updateExpiredSeriesForAssetAdamIDsWithTypes:(id)a3;
- (void)updateSeriesForAssetAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4;
- (void)updateSeriesForSeriesAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4;
@end

@implementation BKSeriesManagerUpdater

- (BKSeriesManagerUpdater)initWithManager:(id)a3 database:(id)a4 catalogService:(id)a5 onFinished:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)BKSeriesManagerUpdater;
  v14 = [(BKSeriesManagerUpdater *)&v23 init];
  if (v14)
  {
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.iBooks.BKSeriesManagerUpdater", 0);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v15;

    id v17 = objc_retainBlock(v13);
    id onFinished = v14->_onFinished;
    v14->_id onFinished = v17;

    objc_storeStrong((id *)&v14->_database, a4);
    objc_storeWeak((id *)&v14->_manager, v10);
    objc_storeStrong((id *)&v14->_catalogService, a5);
    v19 = v14->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_98410;
    block[3] = &unk_2C3C50;
    v22 = v14;
    dispatch_async(v19, block);
  }
  return v14;
}

- (void)recordAdamIDsAsChecked:(id)a3
{
  id v4 = [a3 copy];
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_98520;
  v7[3] = &unk_2C3AF8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)cancel
{
  v3 = [(BKSeriesManagerUpdater *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_98600;
  block[3] = &unk_2C3C50;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)finish
{
  v3 = [(BKSeriesManagerUpdater *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_986CC;
  block[3] = &unk_2C3C50;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)updateExpiredSeriesForAssetAdamIDsWithTypes:(id)a3
{
  id v4 = BKSeriesManagerAssetTypeAudiobooks[0];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:v4];
  v7 = [v5 objectForKeyedSubscript:BKSeriesManagerAssetTypeBooks[0]];

  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_98D24;
    v8[3] = &unk_2C4D58;
    v8[4] = self;
    id v9 = v7;
    id v10 = v6;
    [(BKSeriesManagerUpdater *)self _intervalInDaysWithCompletion:v8];
  }
}

- (void)updateSeriesForAssetAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4
{
}

- (void)updateSeriesForSeriesAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_99384;
  v25 = sub_99394;
  id v26 = [v6 objectForKeyedSubscript:BKSeriesManagerSeriesTypeBookSeries[0]];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_99384;
  v19 = sub_99394;
  id v20 = [v6 objectForKeyedSubscript:BKSeriesManagerSeriesTypeAudiobookSeries];
  if ([(id)v16[5] count] || objc_msgSend((id)v22[5], "count"))
  {
    v7 = BCSeriesManagerUpdaterLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if (v4) {
        CFStringRef v8 = @"Force";
      }
      else {
        CFStringRef v8 = &stru_2CE418;
      }
      id v9 = [v22[5] bu_prettyDescription];
      id v10 = [v16[5] bu_prettyDescription];
      *(_DWORD *)buf = 134218754;
      v30 = self;
      __int16 v31 = 2112;
      CFStringRef v32 = v8;
      __int16 v33 = 2112;
      v34 = v9;
      __int16 v35 = 2112;
      v36 = v10;
      _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_INFO, "<BKSeriesManagerUpdater: %p> %@ Updating series with adamIDs: books=%@, audiobooks=%@", buf, 0x2Au);
    }
    if (v4)
    {
      id v11 = (void *)v22[5];
      if (!v11) {
        id v11 = &__NSArray0__struct;
      }
      v27[0] = BKSeriesManagerSeriesTypeBookSeries[0];
      v27[1] = BKSeriesManagerSeriesTypeAudiobookSeries;
      id v12 = (void *)v16[5];
      if (!v12) {
        id v12 = &__NSArray0__struct;
      }
      v28[0] = v11;
      v28[1] = v12;
      id v13 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
      [(BKSeriesManagerUpdater *)self _updateSeriesForSeriesAdamIDsWithFilteredTypes:v13];
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_9939C;
      v14[3] = &unk_2C7C80;
      v14[4] = self;
      v14[5] = &v21;
      v14[6] = &v15;
      [(BKSeriesManagerUpdater *)self _intervalInDaysWithCompletion:v14];
    }
  }
  else
  {
    [(BKSeriesManagerUpdater *)self finish];
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

- (void)_seriesInfoRequestBatchSizeWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[BUBag defaultBag];
  id v5 = [v4 seriesInfoRequestBatchSize];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_996DC;
  v7[3] = &unk_2C7CA8;
  id v8 = v3;
  id v6 = v3;
  [v5 valueWithCompletion:v7];
}

- (void)_updateSeriesForSeriesAdamIDsWithFilteredTypes:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_99384;
  v19 = sub_99394;
  id v20 = [v4 objectForKeyedSubscript:BKSeriesManagerSeriesTypeBookSeries[0]];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_99384;
  id v13 = sub_99394;
  id v14 = [v4 objectForKeyedSubscript:BKSeriesManagerSeriesTypeAudiobookSeries];
  if ([(id)v16[5] count] || objc_msgSend((id)v10[5], "count"))
  {
    id v5 = BCSeriesManagerUpdaterLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = v16[5];
      uint64_t v7 = v10[5];
      *(_DWORD *)buf = 134218498;
      v22 = self;
      __int16 v23 = 2112;
      uint64_t v24 = v6;
      __int16 v25 = 2112;
      uint64_t v26 = v7;
      _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "<BKSeriesManagerUpdater: %p> Fetching series with bookSeriesAdamIds: %@, audiobookSeriesAdamIDs: %@", buf, 0x20u);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_999F4;
    v8[3] = &unk_2C7D48;
    v8[4] = self;
    void v8[5] = &v15;
    v8[6] = &v9;
    [(BKSeriesManagerUpdater *)self _seriesInfoRequestBatchSizeWithCompletion:v8];
  }
  else
  {
    [(BKSeriesManagerUpdater *)self finish];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
}

- (void)_updateSeriesContainersWithSeriesIDs:(id)a3 withResources:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(BKSeriesManagerUpdater *)self recordAdamIDsAsChecked:v6];
  id v8 = [(BKSeriesManagerUpdater *)self managedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_9A074;
  v11[3] = &unk_2C48E0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlockAndWait:v11];
}

- (void)_updateSeriesChildrenWithAdamIDs:(id)a3 forSeries:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKSeriesManagerUpdater *)self managedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_9A524;
  v11[3] = &unk_2C48E0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlockAndWait:v11];
}

- (void)_updateSeriesForAssetIDsWithTypes:(id)a3 forceCheck:(BOOL)a4
{
  id v6 = BKSeriesManagerAssetTypeAudiobooks[0];
  id v7 = a3;
  id v8 = [v7 objectForKeyedSubscript:v6];
  id v9 = [v7 objectForKeyedSubscript:BKSeriesManagerAssetTypeBooks[0]];

  if ([v9 count] || objc_msgSend(v8, "count"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_9ADF8;
    v10[3] = &unk_2C7E60;
    v10[4] = self;
    BOOL v13 = a4;
    id v11 = v9;
    id v12 = v8;
    [(BKSeriesManagerUpdater *)self _seriesInfoRequestBatchSizeWithCompletion:v10];
  }
  else
  {
    [(BKSeriesManagerUpdater *)self finish];
  }
}

- (void)updateAssetsFromCloudSyncForAssetAdamIDsWithTypes:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:BKSeriesManagerAssetTypeUnknown[0]];
  id v5 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v10);
        id v12 = objc_opt_new();
        BOOL v13 = [v12 numberFromString:v11];

        if (!v13) {
          [v5 addObject:v11];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    id v14 = BCSeriesManagerUpdaterLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_1EC674(v5, v14);
    }
  }
  uint64_t v15 = [(BKSeriesManagerUpdater *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9BD48;
  block[3] = &unk_2C3AF8;
  id v19 = v3;
  id v20 = self;
  id v16 = v3;
  dispatch_async(v15, block);
}

- (void)_updateAssetsFromCloudSyncWithAdamIDs:(id)a3 withAssetResources:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKSeriesManagerUpdater *)self managedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_9C550;
  v11[3] = &unk_2C48E0;
  id v12 = v6;
  BOOL v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlockAndWait:v11];
}

- (void)_intervalInDaysWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[BUBag defaultBag];
  id v5 = [v4 seriesInfoUpdateIntervalInDays];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_9CCB0;
  v7[3] = &unk_2C7CA8;
  id v8 = v3;
  id v6 = v3;
  [v5 valueWithCompletion:v7];
}

- (id)_filteredAdamIDs:(id)a3 withIntervalInDays:(double)a4
{
  id v6 = a3;
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v14 = [(BKSeriesManagerUpdater *)self managedObjectContext];
        unsigned int v15 = +[BKSeriesCheck shouldRecheckAdamID:v13 withIntervalInDays:v14 inManagedObjectContext:a4];

        if (v15) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (void)_populateItem:(id)a3 withSeriesResource:(id)a4 inMoc:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  [v9 setDifferentValue:&__kCFBooleanTrue forKey:@"isContainer" klass:objc_opt_class()];
  id v10 = [v8 name];
  [v9 setDifferentValue:v10 forKey:@"sortTitle" klass:objc_opt_class()];

  uint64_t v11 = [v8 name];
  [v9 setDifferentValue:v11 forKey:@"seriesTitle" klass:objc_opt_class()];

  id v12 = [v8 name];
  [v9 setDifferentValue:v12 forKey:@"title" klass:objc_opt_class()];

  uint64_t v13 = [v8 id];
  [v9 setDifferentValue:v13 forKey:@"seriesAdamId" klass:objc_opt_class()];

  id v14 = [v8 url];
  [v9 setDifferentValue:v14 forKey:@"url" klass:objc_opt_class()];

  unsigned int v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isExplicit]);
  [v9 setDifferentValue:v15 forKey:@"isExplicit" klass:objc_opt_class()];

  id v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isOrdered]);
  [v9 setDifferentValue:v16 forKey:@"seriesIsOrdered" klass:objc_opt_class()];

  long long v17 = [v8 genres];
  id v21 = [v17 valueForKey:@"name"];

  [v9 setDifferentValue:v21 forKey:@"genres" klass:objc_opt_class()];
  long long v18 = [v8 authorCount];
  [v9 setDifferentValue:v18 forKey:@"authorCount" klass:objc_opt_class()];

  long long v19 = [v8 authorNames];
  [v9 setDifferentValue:v19 forKey:@"authorNames" klass:objc_opt_class()];

  long long v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 hasUniqueAuthors]);
  [v9 setDifferentValue:v20 forKey:@"hasTooManyAuthors" klass:objc_opt_class()];

  +[BKSeriesManagerUpdaterHelper updateSeries:v9 withResource:v8 inMoc:v7];
}

+ (void)_populateItem:(id)a3 position:(unint64_t)a4 withAssetResource:(id)a5 seriesResource:(id)a6
{
  id v32 = a3;
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [v9 id];
  [v32 setDifferentValue:v11 forKey:@"adamId" klass:objc_opt_class()];

  id v12 = [v9 artistName];
  [v32 setDifferentValue:v12 forKey:@"author" klass:objc_opt_class()];

  uint64_t v13 = [v9 width];
  if (![v13 longValue])
  {
    long long v18 = 0;
    goto LABEL_5;
  }
  id v14 = [v9 height];
  id v15 = [v14 longValue];

  if (v15)
  {
    uint64_t v13 = [v9 width];
    double v16 = (double)(uint64_t)[v13 longValue];
    long long v17 = [v9 height];
    long long v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16 / (double)(uint64_t)[v17 longValue]);

LABEL_5:
    goto LABEL_7;
  }
  long long v18 = 0;
LABEL_7:
  [v32 setDifferentValue:v18 forKey:@"coverAspectRatio" klass:objc_opt_class()];
  long long v19 = [v9 genreName];
  [v32 setDifferentValue:v19 forKey:@"genre" klass:objc_opt_class()];

  long long v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isSG]);
  [v32 setDifferentValue:v20 forKey:@"hasRACSupport" klass:objc_opt_class()];

  id v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isAudiobook]);
  [v32 setDifferentValue:v21 forKey:@"isAudiobook" klass:objc_opt_class()];

  long long v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isExplicit]);
  [v32 setDifferentValue:v22 forKey:@"isExplicit" klass:objc_opt_class()];

  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v23 = +[NSNumber numberWithUnsignedInteger:a4];
    [v32 setDifferentValue:v23 forKey:@"position" klass:objc_opt_class()];
  }
  long long v24 = [v9 releaseDate];
  [v32 setDifferentValue:v24 forKey:@"releaseDate" klass:objc_opt_class()];

  __int16 v25 = [v10 name];

  [v32 setDifferentValue:v25 forKey:@"seriesTitle" klass:objc_opt_class()];
  uint64_t v26 = [v9 sequenceDisplayLabel];
  [v32 setDifferentValue:v26 forKey:@"sequenceDisplayName" klass:objc_opt_class()];

  v27 = [v9 sequenceNumber];
  [v32 setDifferentValue:v27 forKey:@"sequenceNumber" klass:objc_opt_class()];

  v28 = [v9 artistName];
  [v32 setDifferentValue:v28 forKey:@"sortAuthor" klass:objc_opt_class()];

  v29 = [v9 name];
  [v32 setDifferentValue:v29 forKey:@"sortTitle" klass:objc_opt_class()];

  v30 = [v9 name];
  [v32 setDifferentValue:v30 forKey:@"title" klass:objc_opt_class()];

  __int16 v31 = [v9 url];
  [v32 setDifferentValue:v31 forKey:@"url" klass:objc_opt_class()];
}

- (BKSeriesDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (BKSeriesManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (BKSeriesManager *)WeakRetained;
}

- (void)setManager:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BKSeriesDatabaseManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (id)onFinished
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setOnFinished:(id)a3
{
}

- (NSMutableSet)checkedAdamIDs
{
  return self->_checkedAdamIDs;
}

- (void)setCheckedAdamIDs:(id)a3
{
}

- (BCMBridgedCatalogService)catalogService
{
  return self->_catalogService;
}

- (void)setCatalogService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalogService, 0);
  objc_storeStrong((id *)&self->_checkedAdamIDs, 0);
  objc_storeStrong(&self->_onFinished, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_manager);

  objc_storeStrong((id *)&self->_database, 0);
}

@end