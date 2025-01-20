@interface GKDelayedRequestWriter
+ (id)writerWithCacheWriter:(id)a3 cacheReader:(id)a4 networkWriter:(id)a5 batchSubmissionInterval:(double)a6;
- (BOOL)shouldWaitForNetworkError;
- (GKDataWriter)networkWriter;
- (GKDatabaseReader)cacheReader;
- (GKDatabaseWriter)cacheWriter;
- (GKDelayedRequestWriter)initWithCacheWriter:(id)a3 cacheReader:(id)a4 networkWriter:(id)a5 batchSubmissionInterval:(double)a6;
- (NSSet)resourcesPending;
- (OS_dispatch_queue)operationQueue;
- (double)intervalInSeconds;
- (void)batchAndPerformInGroup:(id)a3 block:(id)a4;
- (void)deleteSubmittedRequestsWithIDs:(id)a3 onConnection:(id)a4;
- (void)readAndSubmitDelayedRequestsOfResources:(id)a3 handler:(id)a4;
- (void)setCacheReader:(id)a3;
- (void)setCacheWriter:(id)a3;
- (void)setIntervalInSeconds:(double)a3;
- (void)setNetworkWriter:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setResourcesPending:(id)a3;
- (void)setShouldWaitForNetworkError:(BOOL)a3;
- (void)submitDelayedRequestsForPlayer:(id)a3 handler:(id)a4;
- (void)writeResources:(id)a3 handler:(id)a4;
- (void)writeResourcesToCacheOnly:(id)a3 handler:(id)a4;
@end

@implementation GKDelayedRequestWriter

+ (id)writerWithCacheWriter:(id)a3 cacheReader:(id)a4 networkWriter:(id)a5 batchSubmissionInterval:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 databaseConnection];
  v13 = [v9 databaseConnection];
  unsigned __int8 v14 = [v12 isEqual:v13];

  if ((v14 & 1) == 0)
  {
    v17 = [v10 databaseConnection];
    v18 = [v9 databaseConnection];
    uint64_t v19 = +[NSString stringWithFormat:@"cacheReader.databaseConnection (%@) is not shared by the cacheWriter.databaseConnection (%@) Exiting to reset", v17, v18];

    id v20 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v19 userInfo:0];
    objc_exception_throw(v20);
  }
  id v15 = [objc_alloc((Class)objc_opt_class()) initWithCacheWriter:v9 cacheReader:v10 networkWriter:v11 batchSubmissionInterval:a6];

  return v15;
}

- (GKDelayedRequestWriter)initWithCacheWriter:(id)a3 cacheReader:(id)a4 networkWriter:(id)a5 batchSubmissionInterval:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)GKDelayedRequestWriter;
  v13 = [(GKDelayedRequestWriter *)&v20 init];
  unsigned __int8 v14 = v13;
  if (v13)
  {
    [(GKDelayedRequestWriter *)v13 setCacheWriter:v10];
    [(GKDelayedRequestWriter *)v14 setCacheReader:v11];
    [(GKDelayedRequestWriter *)v14 setNetworkWriter:v12];
    id v15 = (NSSet *)objc_alloc_init((Class)NSSet);
    resourcesPending = v14->_resourcesPending;
    v14->_resourcesPending = v15;

    v14->_shouldWaitForNetworkError = 1;
    v14->_intervalInSeconds = a6;
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.gamed.delayedRequests.batchQueue", 0);
    operationQueue = v14->_operationQueue;
    v14->_operationQueue = (OS_dispatch_queue *)v17;
  }
  return v14;
}

- (void)batchAndPerformInGroup:(id)a3 block:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = v7;
  if (self->_intervalInSeconds <= 0.0)
  {
    v7[2](v7);
  }
  else
  {
    ++qword_100329728;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000D5540;
    v9[3] = &unk_1002D94F8;
    v9[4] = self;
    uint64_t v11 = qword_100329728;
    id v10 = v7;
    [v6 perform:v9];
  }
}

- (void)submitDelayedRequestsForPlayer:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = v6;
  v8 = +[NSArray arrayWithObjects:&v10 count:1];
  id v9 = +[NSSet _gkSetOfResourcesWithIDs:v8];
  [(GKDelayedRequestWriter *)self readAndSubmitDelayedRequestsOfResources:v9 handler:v7];
}

- (void)deleteSubmittedRequestsWithIDs:(id)a3 onConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"DELETE FROM requests WHERE request_id = %s;",
    ":request_id");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000D58C0;
  v9[3] = &unk_1002D9290;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v5;
  id v11 = v7;
  id v8 = v10;
  [v6 performAsyncTransaction:v9 handler:&stru_1002D9518];
}

- (void)readAndSubmitDelayedRequestsOfResources:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKDelayedRequestWriter.mm", 129, "-[GKDelayedRequestWriter readAndSubmitDelayedRequestsOfResources:handler:]");
  id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000D5D68;
  v19[3] = &unk_1002D95B8;
  v19[4] = self;
  id v10 = v6;
  id v20 = v10;
  id v11 = v9;
  id v21 = v11;
  v22 = v23;
  [v11 perform:v19];
  id v12 = dispatch_get_global_queue(0, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000D650C;
  v15[3] = &unk_1002D95E0;
  id v13 = v7;
  id v17 = v13;
  id v14 = v11;
  id v16 = v14;
  v18 = v23;
  [v14 notifyOnQueue:v12 block:v15];

  _Block_object_dispose(v23, 8);
}

- (void)writeResources:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(GKDelayedRequestWriter *)self shouldWaitForNetworkError];
  operationQueue = self->_operationQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D6674;
  v12[3] = &unk_1002D9748;
  v12[4] = self;
  id v13 = v6;
  unsigned __int8 v15 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(operationQueue, v12);
}

- (void)writeResourcesToCacheOnly:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  operationQueue = self->_operationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D7228;
  block[3] = &unk_1002D9658;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(operationQueue, block);
}

- (BOOL)shouldWaitForNetworkError
{
  return self->_shouldWaitForNetworkError;
}

- (void)setShouldWaitForNetworkError:(BOOL)a3
{
  self->_shouldWaitForNetworkError = a3;
}

- (double)intervalInSeconds
{
  return self->_intervalInSeconds;
}

- (void)setIntervalInSeconds:(double)a3
{
  self->_intervalInSeconds = a3;
}

- (OS_dispatch_queue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSSet)resourcesPending
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResourcesPending:(id)a3
{
}

- (GKDatabaseWriter)cacheWriter
{
  return self->_cacheWriter;
}

- (void)setCacheWriter:(id)a3
{
}

- (GKDatabaseReader)cacheReader
{
  return self->_cacheReader;
}

- (void)setCacheReader:(id)a3
{
}

- (GKDataWriter)networkWriter
{
  return self->_networkWriter;
}

- (void)setNetworkWriter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkWriter, 0);
  objc_storeStrong((id *)&self->_cacheReader, 0);
  objc_storeStrong((id *)&self->_cacheWriter, 0);
  objc_storeStrong((id *)&self->_resourcesPending, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end