@interface BSUIFeedDataRequest
- (BSUIFeedDataRequest)init;
- (NSArray)operations;
- (NSMutableArray)operationsArray;
- (OS_dispatch_queue)accessQueue;
- (float)priority;
- (void)addOperation:(id)a3;
- (void)cancelRequest;
- (void)setAccessQueue:(id)a3;
- (void)setOperationsArray:(id)a3;
- (void)setPriority:(float)a3;
@end

@implementation BSUIFeedDataRequest

- (BSUIFeedDataRequest)init
{
  v9.receiver = self;
  v9.super_class = (Class)BSUIFeedDataRequest;
  v2 = [(BSUIFeedDataRequest *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    operationsArray = v2->_operationsArray;
    v2->_operationsArray = (NSMutableArray *)v3;

    LODWORD(v2->_priority) = TUIPriorityDefault;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("BSUIFeedDataRequest.accessQueue", v5);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(BSUIFeedDataRequest *)self priority];
    [v4 setPriority:];
    accessQueue = self->_accessQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_36C68;
    v6[3] = &unk_38E1F8;
    v6[4] = self;
    id v7 = v4;
    dispatch_barrier_sync(accessQueue, v6);
  }
}

- (NSArray)operations
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_36D90;
  v11 = sub_36DA0;
  id v12 = 0;
  uint64_t v3 = [(BSUIFeedDataRequest *)self accessQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_36DA8;
  v6[3] = &unk_38E428;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)cancelRequest
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(BSUIFeedDataRequest *)self operations];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      dispatch_queue_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) cancel];
        dispatch_queue_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BSUIFeedDataRequest *)self operations];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v11;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v4);
        }
        *(float *)&double v6 = a3;
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setPriority:v6];
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (float)priority
{
  return self->_priority;
}

- (NSMutableArray)operationsArray
{
  return self->_operationsArray;
}

- (void)setOperationsArray:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_operationsArray, 0);
}

@end