@interface MTCoreSpotlightIndexBatchGenerator
- (BOOL)canceled;
- (BOOL)collectNextBatch:(id)a3;
- (BOOL)finished;
- (MTCoreSpotlightIndexBatchGenerator)init;
- (MTCoreSpotlightIndexBatchGenerator)initWithStartingIndexPath:(id)a3;
- (NSFetchRequest)currentFetchRequest;
- (NSManagedObjectContext)context;
- (NSMutableArray)indexAllCompletions;
- (NSMutableSet)externallyProcessedMOIDs;
- (id)_entitiesByRemovingAlreadyProcessedFrom:(id)a3;
- (id)description;
- (id)nextBatchWithTransformationBlock:(id)a3;
- (id)nextIndexPath;
- (int64_t)debugID;
- (void)cancel;
- (void)markUpdateUnnecessaryForObjectIDs:(id)a3;
- (void)reset;
- (void)setCanceled:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setCurrentFetchRequest:(id)a3;
- (void)setDebugID:(int64_t)a3;
- (void)setExternallyProcessedMOIDs:(id)a3;
- (void)setFinished:(BOOL)a3;
@end

@implementation MTCoreSpotlightIndexBatchGenerator

- (MTCoreSpotlightIndexBatchGenerator)initWithStartingIndexPath:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MTCoreSpotlightIndexBatchGenerator;
  v5 = [(MTCoreSpotlightIndexBatchGenerator *)&v15 init];
  if (v5)
  {
    if (qword_10001A3A0 != -1) {
      dispatch_once(&qword_10001A3A0, &stru_1000145C8);
    }
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004894;
    block[3] = &unk_1000145F0;
    block[4] = &v17;
    dispatch_sync((dispatch_queue_t)qword_10001A3A8, block);
    int64_t v6 = v18[3];
    _Block_object_dispose(&v17, 8);
    v5->_debugID = v6;
    uint64_t v7 = +[NSMutableArray array];
    indexAllCompletions = v5->_indexAllCompletions;
    v5->_indexAllCompletions = (NSMutableArray *)v7;

    [(MTCoreSpotlightIndexBatchGenerator *)v5 reset];
    if (v4)
    {
      v5->_nextIndexPath.object = [v4 section];
      v5->_nextIndexPath.batch = (int64_t)[v4 row];
    }
    uint64_t v9 = +[NSMutableSet set];
    externallyProcessedMOIDs = v5->_externallyProcessedMOIDs;
    v5->_externallyProcessedMOIDs = (NSMutableSet *)v9;

    v11 = +[MTDB sharedInstance];
    uint64_t v12 = [v11 privateQueueContext];
    context = v5->_context;
    v5->_context = (NSManagedObjectContext *)v12;
  }
  return v5;
}

- (MTCoreSpotlightIndexBatchGenerator)init
{
  return [(MTCoreSpotlightIndexBatchGenerator *)self initWithStartingIndexPath:0];
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)MTCoreSpotlightIndexBatchGenerator;
  v3 = [(MTCoreSpotlightIndexBatchGenerator *)&v10 description];
  uint64_t v4 = +[NSNumber numberWithInteger:self->_debugID];
  v5 = (void *)v4;
  CFStringRef v6 = @"YES";
  if (self->_finished) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  if (!self->_canceled) {
    CFStringRef v6 = @"NO";
  }
  v8 = +[NSString stringWithFormat:@"%@, debugID=%@, finished=%@, canceled=%@", v3, v4, v7, v6];

  return v8;
}

- (id)nextBatchWithTransformationBlock:(id)a3
{
  id v4 = a3;
  if ([(MTCoreSpotlightIndexBatchGenerator *)self canceled]
    || [(MTCoreSpotlightIndexBatchGenerator *)self finished]
    || self->_nextIndexPath.object >= 3u)
  {
    [(MTCoreSpotlightIndexBatchGenerator *)self setFinished:1];
    v5 = 0;
  }
  else
  {
    [(NSFetchRequest *)self->_currentFetchRequest setFetchOffset:self->_nextIndexPath.batch];
    CFStringRef v7 = 0;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = sub_100004088;
    v33 = sub_100004098;
    id v34 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = sub_100004088;
    v27 = sub_100004098;
    id v28 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    while (![v7 count] && !*((unsigned char *)v20 + 24))
    {
      v8 = [(MTCoreSpotlightIndexBatchGenerator *)self context];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000040A0;
      v14[3] = &unk_1000144F8;
      v14[4] = self;
      v16 = &v29;
      uint64_t v17 = &v19;
      v18 = &v23;
      id v15 = v4;
      [v8 performBlockAndWait:v14];

      if (![(id)v24[5] count] && !*((unsigned char *)v20 + 24))
      {
        int64_t v9 = self->_nextIndexPath.batch + 1;
        self->_nextIndexPath.batch = v9;
        [(NSFetchRequest *)self->_currentFetchRequest setFetchOffset:v9];
      }

      CFStringRef v7 = (void *)v24[5];
    }
    objc_super v10 = (void *)v24[5];
    if (!v10)
    {
      [(id)v30[5] logAndThrow:1];
      objc_super v10 = (void *)v24[5];
    }
    if ([v10 count])
    {
      ++self->_nextIndexPath.batch;
      id v11 = (id)v24[5];
    }
    else
    {
      ++self->_nextIndexPath.object;
      self->_nextIndexPath.batch = 0;
      +[MTCoreSpotlightUtil fetchRequestForIndexType:](MTCoreSpotlightUtil, "fetchRequestForIndexType:");
      uint64_t v12 = (NSFetchRequest *)objc_claimAutoreleasedReturnValue();
      currentFetchRequest = self->_currentFetchRequest;
      self->_currentFetchRequest = v12;

      id v11 = [(MTCoreSpotlightIndexBatchGenerator *)self nextBatchWithTransformationBlock:v4];
    }
    v5 = v11;
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v29, 8);
  }

  return v5;
}

- (BOOL)collectNextBatch:(id)a3
{
  id v4 = a3;
  v5 = [(MTCoreSpotlightIndexBatchGenerator *)self nextBatchWithTransformationBlock:&stru_100014538];
  if ([v5 count])
  {
    CFStringRef v6 = [(MTCoreSpotlightIndexBatchGenerator *)self context];
    uint64_t v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_100004374;
    id v15 = &unk_100014560;
    id v19 = v4;
    v16 = self;
    id v7 = v5;
    id v17 = v7;
    id v18 = v6;
    id v8 = v6;
    [v8 performBlockAndWait:&v12];
    BOOL v9 = [v7 count:v12, v13, v14, v15, v16] != 0;
  }
  else
  {
    objc_super v10 = _MTLogCategorySpotlight();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Indexing] *** batch processing - no more entities for processing [%@]", buf, 0xCu);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    BOOL v9 = 0;
  }

  return v9;
}

- (void)cancel
{
  [(MTCoreSpotlightIndexBatchGenerator *)self setCanceled:1];

  [(MTCoreSpotlightIndexBatchGenerator *)self setFinished:1];
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
  if (a3) {
    [(MTCoreSpotlightIndexBatchGenerator *)self setFinished:1];
  }
}

- (void)reset
{
  self->_nextIndexPath.batch = 0;
  self->_nextIndexPath.object = 0;
  v3 = +[MTCoreSpotlightUtil fetchRequestForIndexType:0];
  currentFetchRequest = self->_currentFetchRequest;
  self->_currentFetchRequest = v3;

  v5 = +[NSMutableSet set];
  externallyProcessedMOIDs = self->_externallyProcessedMOIDs;
  self->_externallyProcessedMOIDs = v5;

  [(MTCoreSpotlightIndexBatchGenerator *)self setCanceled:0];

  [(MTCoreSpotlightIndexBatchGenerator *)self setFinished:0];
}

- (id)nextIndexPath
{
  return +[NSIndexPath indexPathForRow:self->_nextIndexPath.batch inSection:self->_nextIndexPath.object];
}

- (void)markUpdateUnnecessaryForObjectIDs:(id)a3
{
  if (a3) {
    -[NSMutableSet addObjectsFromArray:](self->_externallyProcessedMOIDs, "addObjectsFromArray:");
  }
}

- (id)_entitiesByRemovingAlreadyProcessedFrom:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004720;
  v9[3] = &unk_100014588;
  v9[4] = self;
  id v3 = a3;
  id v4 = [v3 mt_filter:v9];
  v5 = [v3 count];

  uint64_t v6 = v5 - (unsigned char *)[v4 count];
  if (v6 >= 1)
  {
    id v7 = _MTLogCategorySpotlight();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[BatchGenerator] filtering out %d already encountered items", buf, 8u);
    }
  }

  return v4;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSMutableArray)indexAllCompletions
{
  return self->_indexAllCompletions;
}

- (int64_t)debugID
{
  return self->_debugID;
}

- (void)setDebugID:(int64_t)a3
{
  self->_debugID = a3;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSFetchRequest)currentFetchRequest
{
  return self->_currentFetchRequest;
}

- (void)setCurrentFetchRequest:(id)a3
{
}

- (NSMutableSet)externallyProcessedMOIDs
{
  return self->_externallyProcessedMOIDs;
}

- (void)setExternallyProcessedMOIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externallyProcessedMOIDs, 0);
  objc_storeStrong((id *)&self->_currentFetchRequest, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_indexAllCompletions, 0);
}

@end