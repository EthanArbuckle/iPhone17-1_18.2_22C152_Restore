@interface MTCoreSpotlightController
- (BOOL)hasBeenIndexed;
- (BOOL)hasDeferredIndexAll;
- (BOOL)hasIndexingOperationInProgress;
- (CSSearchableIndex)searchableIndex;
- (MTCoreSpotlightController)init;
- (MTCoreSpotlightController)initWithAnnotator:(id)a3;
- (MTCoreSpotlightEntityAnnotator)annotator;
- (MTCoreSpotlightIndexBatchGenerator)indexAllBatchGenerator;
- (NSMutableArray)updateIndexRequests;
- (OS_dispatch_queue)indexingQueue;
- (id)didCompleteFeedUpdateObservance;
- (id)didCompleteSyncObservance;
- (id)savedPartialUploadStateIndexPath;
- (void)_didCompleteBatchProcessingBatchGenerator:(id)a3 state:(int64_t)a4 error:(id)a5;
- (void)_onIndexingQueueHandleNextBatchOrUpdateRequest;
- (void)_onIndexingQueuePerformUpdateRequest:(id)a3;
- (void)_onQueueCancelCurrentReindexAll;
- (void)_onQueuePerformCompletionsForGenerator:(id)a3 error:(id)a4;
- (void)_onQueueStartProcessNextBatchInGenerator:(id)a3 searchableIndex:(id)a4;
- (void)_prepareToHandleNextBatchWithReadyBlock:(id)a3;
- (void)_startProcessNextBatchInGenerator:(id)a3 searchableIndex:(id)a4;
- (void)clearHasBeenIndexed;
- (void)clearPartialUploadState;
- (void)deleteSearchableItemsWithIdentifiers:(id)a3;
- (void)indexAllDataWithSearchableIndex:(id)a3 completionHandler:(id)a4;
- (void)libraryDidChange:(id)a3;
- (void)markHasBeenIndexed;
- (void)savePartialUploadStateIndexPath:(id)a3;
- (void)searchableIndex:(id)a3 indexSearchableItems:(id)a4 completionHandler:(id)a5;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
- (void)setDidCompleteFeedUpdateObservance:(id)a3;
- (void)setDidCompleteSyncObservance:(id)a3;
- (void)setHasDeferredIndexAll:(BOOL)a3;
- (void)setHasIndexingOperationInProgress:(BOOL)a3;
- (void)setIndexAllBatchGenerator:(id)a3;
- (void)setIndexingQueue:(id)a3;
- (void)setSearchableIndex:(id)a3;
- (void)setUpdateIndexRequests:(id)a3;
- (void)updateSearchableIndexWithReason:(id)a3 searchableIndex:(id)a4 entityLoadingBlock:(id)a5 completion:(id)a6;
- (void)updateStationsWithUUIDs:(id)a3;
@end

@implementation MTCoreSpotlightController

- (void)updateStationsWithUUIDs:(id)a3
{
  id v4 = a3;
  v5 = [v4 allObjects];
  v6 = [v5 componentsJoinedByString:@", "];
  v7 = +[NSString stringWithFormat:@"Update Stations (%@)", v6];

  v8 = [(MTCoreSpotlightController *)self searchableIndex];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000070C8;
  v10[3] = &unk_100014720;
  id v11 = v4;
  id v9 = v4;
  [(MTCoreSpotlightController *)self updateSearchableIndexWithReason:v7 searchableIndex:v8 entityLoadingBlock:v10 completion:0];
}

- (void)indexAllDataWithSearchableIndex:(id)a3 completionHandler:(id)a4
{
  v5 = (Block_layout *)a4;
  if (v5) {
    v6 = v5;
  }
  else {
    v6 = &stru_100014760;
  }
  v7 = [(MTCoreSpotlightController *)self indexingQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007268;
  v9[3] = &unk_100014788;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);
}

- (void)updateSearchableIndexWithReason:(id)a3 searchableIndex:(id)a4 entityLoadingBlock:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(MTCoreSpotlightController *)self indexingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000075EC;
  block[3] = &unk_1000147B0;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)_onQueueCancelCurrentReindexAll
{
  v3 = [(MTCoreSpotlightController *)self indexAllBatchGenerator];

  if (v3)
  {
    id v4 = _MTLogCategorySpotlight();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [(MTCoreSpotlightController *)self indexAllBatchGenerator];
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Indexing] *** canceling current indexAll [%@] ***", (uint8_t *)&v8, 0xCu);
    }
    v6 = [(MTCoreSpotlightController *)self indexAllBatchGenerator];
    [v6 cancel];

    v7 = [(MTCoreSpotlightController *)self indexAllBatchGenerator];
    [(MTCoreSpotlightController *)self _onQueuePerformCompletionsForGenerator:v7 error:0];

    [(MTCoreSpotlightController *)self setIndexAllBatchGenerator:0];
    [(MTCoreSpotlightController *)self setHasIndexingOperationInProgress:0];
  }
}

- (void)_onQueuePerformCompletionsForGenerator:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 indexAllCompletions];
  id v8 = [v7 copy];

  id v9 = [v6 indexAllCompletions];

  [v9 removeAllObjects];
  id v10 = dispatch_get_global_queue(0, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100007970;
  v13[3] = &unk_100014800;
  id v14 = v8;
  id v15 = v5;
  id v11 = v5;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)_onIndexingQueueHandleNextBatchOrUpdateRequest
{
  if (![(MTCoreSpotlightController *)self hasIndexingOperationInProgress])
  {
    id v6 = [(NSMutableArray *)self->_updateIndexRequests firstObject];
    if (v6)
    {
      [(NSMutableArray *)self->_updateIndexRequests removeObjectAtIndex:0];
      [(MTCoreSpotlightController *)self _onIndexingQueuePerformUpdateRequest:v6];
    }
    else
    {
      v3 = [(MTCoreSpotlightController *)self indexAllBatchGenerator];

      if (v3)
      {
        [(MTCoreSpotlightController *)self setHasIndexingOperationInProgress:1];
        id v4 = [(MTCoreSpotlightController *)self indexAllBatchGenerator];
        id v5 = [(MTCoreSpotlightController *)self searchableIndex];
        [(MTCoreSpotlightController *)self _onQueueStartProcessNextBatchInGenerator:v4 searchableIndex:v5];
      }
    }
  }
}

- (void)_onIndexingQueuePerformUpdateRequest:(id)a3
{
  id v4 = a3;
  [(MTCoreSpotlightController *)self setHasIndexingOperationInProgress:1];
  id v5 = [v4 searchableIndex];
  id v6 = +[MTDB sharedInstance];
  v7 = [v6 privateQueueContext];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007C18;
  v11[3] = &unk_1000148E0;
  id v12 = v4;
  id v13 = v7;
  id v14 = self;
  id v15 = v5;
  id v8 = v5;
  id v9 = v7;
  id v10 = v4;
  [v9 performBlock:v11];
}

- (void)_prepareToHandleNextBatchWithReadyBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)_onQueueStartProcessNextBatchInGenerator:(id)a3 searchableIndex:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008114;
  v7[3] = &unk_100014908;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(MTCoreSpotlightController *)v8 _prepareToHandleNextBatchWithReadyBlock:v7];
}

- (void)_startProcessNextBatchInGenerator:(id)a3 searchableIndex:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000081E0;
  v7[3] = &unk_100014958;
  void v7[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  [v6 collectNextBatch:v7];
}

- (void)_didCompleteBatchProcessingBatchGenerator:(id)a3 state:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (a4 == 4 && !v9)
  {
    [(MTCoreSpotlightController *)self markHasBeenIndexed];
    [(MTCoreSpotlightController *)self clearPartialUploadState];
  }
  id v11 = [(MTCoreSpotlightController *)self indexingQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000085EC;
  v14[3] = &unk_100014980;
  id v15 = v8;
  id v16 = self;
  id v17 = v10;
  int64_t v18 = a4;
  id v12 = v10;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (MTCoreSpotlightController)init
{
  v3 = objc_opt_new();
  id v4 = [(MTCoreSpotlightController *)self initWithAnnotator:v3];

  return v4;
}

- (MTCoreSpotlightController)initWithAnnotator:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MTCoreSpotlightController;
  id v6 = [(MTCoreSpotlightController *)&v16 init];
  if (v6)
  {
    v7 = +[MTDB sharedInstance];
    [v7 addChangeNotifier:v6];

    objc_storeStrong((id *)&v6->_annotator, a3);
    uint64_t v8 = +[NSMutableArray array];
    updateIndexRequests = v6->_updateIndexRequests;
    v6->_updateIndexRequests = (NSMutableArray *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.podcasts.CoreSpotlightIndexingQueue", 0);
    indexingQueue = v6->_indexingQueue;
    v6->_indexingQueue = (OS_dispatch_queue *)v10;

    id v12 = objc_alloc((Class)CSSearchableIndex);
    id v13 = (CSSearchableIndex *)[v12 initWithName:@"Podcasts" bundleIdentifier:kMTApplicationBundleIdentifier];
    searchableIndex = v6->_searchableIndex;
    v6->_searchableIndex = v13;

    [(CSSearchableIndex *)v6->_searchableIndex setIndexDelegate:v6];
  }

  return v6;
}

- (void)searchableIndex:(id)a3 indexSearchableItems:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (Block_layout *)a5;
  if (v9) {
    dispatch_queue_t v10 = v9;
  }
  else {
    dispatch_queue_t v10 = &stru_1000149A0;
  }
  if ([v8 count])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000089AC;
    v11[3] = &unk_1000149F0;
    id v12 = v7;
    id v13 = v8;
    id v14 = v10;
    [v12 indexSearchableItems:v13 completionHandler:v11];
  }
  else
  {
    v10->invoke(v10, 0);
  }
}

- (void)deleteSearchableItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(MTCoreSpotlightController *)self searchableIndex];
    id v6 = [v4 allObjects];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100008B50;
    v7[3] = &unk_100014930;
    void v7[4] = self;
    id v8 = v4;
    [v5 deleteSearchableItemsWithIdentifiers:v6 completionHandler:v7];
  }
}

- (void)libraryDidChange:(id)a3
{
  id v4 = a3;
  if ([(MTCoreSpotlightController *)self hasDeferredIndexAll])
  {
    id v5 = _MTLogCategorySpotlight();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dropping index update request (context:didInsertObjects:) since we haven't yet received the initial indexAllData", buf, 2u);
    }
  }
  else
  {
    v20[0] = kMTPodcastEntityName;
    v20[1] = kMTEpisodeEntityName;
    v20[2] = kMTPlaylistEntityName;
    id v6 = +[NSArray arrayWithObjects:v20 count:3];
    unsigned int v7 = [v4 hasInsertsForEntityNames:v6];

    if (v7)
    {
      *(void *)buf = 0;
      id v15 = buf;
      uint64_t v16 = 0x3032000000;
      id v17 = sub_100008DF0;
      int64_t v18 = sub_100008E00;
      id v8 = +[MTDB sharedInstance];
      id v19 = [v8 importContext];

      id v9 = (void *)*((void *)v15 + 5);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100008E08;
      v10[3] = &unk_1000146A8;
      id v12 = self;
      id v13 = buf;
      id v11 = v4;
      [v9 performBlock:v10];

      _Block_object_dispose(buf, 8);
    }
  }
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTCoreSpotlightController *)self indexingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000091E8;
  block[3] = &unk_100014A40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(-32768, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000093F4;
  v15[3] = &unk_100014AB8;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (BOOL)hasBeenIndexed
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"MTCoreSpotlightDataHasBeenIndexed_v3"];

  return v3;
}

- (void)markHasBeenIndexed
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 setBool:1 forKey:@"MTCoreSpotlightDataHasBeenIndexed_v3"];
}

- (void)clearHasBeenIndexed
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 removeObjectForKey:@"MTCoreSpotlightDataHasBeenIndexed_v3"];
}

- (void)clearPartialUploadState
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 removeObjectForKey:@"MTCoreSpotlightPartialIndexObjectNumber"];

  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObjectForKey:@"MTCoreSpotlightPartialIndexBatchNumber"];
}

- (id)savedPartialUploadStateIndexPath
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"MTCoreSpotlightPartialIndexBatchNumber"];

  id v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 objectForKey:@"MTCoreSpotlightPartialIndexObjectNumber"];

  if (v3) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [NSIndexPath indexPathForRow:[v3 integerValue] inSection:[v5 integerValue]];
  }

  return v7;
}

- (void)savePartialUploadStateIndexPath:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 section]);
  [v4 setObject:v5 forKey:@"MTCoreSpotlightPartialIndexObjectNumber"];

  id v8 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v3 row];

  id v7 = +[NSNumber numberWithInteger:v6];
  [v8 setObject:v7 forKey:@"MTCoreSpotlightPartialIndexBatchNumber"];
}

- (MTCoreSpotlightEntityAnnotator)annotator
{
  return (MTCoreSpotlightEntityAnnotator *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)indexingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIndexingQueue:(id)a3
{
}

- (CSSearchableIndex)searchableIndex
{
  return (CSSearchableIndex *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSearchableIndex:(id)a3
{
}

- (BOOL)hasIndexingOperationInProgress
{
  return self->_hasIndexingOperationInProgress;
}

- (void)setHasIndexingOperationInProgress:(BOOL)a3
{
  self->_hasIndexingOperationInProgress = a3;
}

- (id)didCompleteSyncObservance
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setDidCompleteSyncObservance:(id)a3
{
}

- (id)didCompleteFeedUpdateObservance
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setDidCompleteFeedUpdateObservance:(id)a3
{
}

- (MTCoreSpotlightIndexBatchGenerator)indexAllBatchGenerator
{
  return (MTCoreSpotlightIndexBatchGenerator *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIndexAllBatchGenerator:(id)a3
{
}

- (BOOL)hasDeferredIndexAll
{
  return self->_hasDeferredIndexAll;
}

- (void)setHasDeferredIndexAll:(BOOL)a3
{
  self->_hasDeferredIndexAll = a3;
}

- (NSMutableArray)updateIndexRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUpdateIndexRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateIndexRequests, 0);
  objc_storeStrong((id *)&self->_indexAllBatchGenerator, 0);
  objc_storeStrong(&self->_didCompleteFeedUpdateObservance, 0);
  objc_storeStrong(&self->_didCompleteSyncObservance, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
  objc_storeStrong((id *)&self->_indexingQueue, 0);

  objc_storeStrong((id *)&self->_annotator, 0);
}

@end