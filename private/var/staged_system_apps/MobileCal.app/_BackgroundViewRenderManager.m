@interface _BackgroundViewRenderManager
+ (id)sharedManager;
- (_BackgroundViewRenderManager)init;
- (void)addViewToQueue:(id)a3;
- (void)cancelAllRendering;
- (void)removeViewFromQueue:(id)a3;
@end

@implementation _BackgroundViewRenderManager

+ (id)sharedManager
{
  if (qword_100216650 != -1) {
    dispatch_once(&qword_100216650, &stru_1001D3280);
  }
  v2 = (void *)qword_100216648;

  return v2;
}

- (_BackgroundViewRenderManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)_BackgroundViewRenderManager;
  v2 = [(_BackgroundViewRenderManager *)&v8 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    queue = v2->_queue;
    v2->_queue = v3;

    [(NSOperationQueue *)v2->_queue setMaxConcurrentOperationCount:1];
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    viewsInQueue = v2->_viewsInQueue;
    v2->_viewsInQueue = v5;
  }
  return v2;
}

- (void)addViewToQueue:(id)a3
{
  id v4 = a3;
  v5 = self->_viewsInQueue;
  objc_sync_enter(v5);
  if (([(NSMutableSet *)self->_viewsInQueue containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_viewsInQueue addObject:v4];
    v6 = [_BackgroundViewRenderOperation alloc];
    viewsInQueue = self->_viewsInQueue;
    [v4 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = [v4 traitCollection];
    v17 = -[_BackgroundViewRenderOperation initWithView:views:bounds:traitCollection:](v6, "initWithView:views:bounds:traitCollection:", v4, viewsInQueue, v16, v9, v11, v13, v15);

    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_100064470;
    v21 = &unk_1001D28A8;
    v22 = self;
    id v23 = v4;
    [(_BackgroundViewRenderOperation *)v17 setCompletionBlock:&v18];
    -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v17, v18, v19, v20, v21, v22);
  }
  objc_sync_exit(v5);
}

- (void)removeViewFromQueue:(id)a3
{
  id v4 = a3;
  v5 = self->_viewsInQueue;
  objc_sync_enter(v5);
  if ([(NSMutableSet *)self->_viewsInQueue containsObject:v4])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = [(NSOperationQueue *)self->_queue operations];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [v10 view];
          BOOL v12 = v11 == v4;

          if (v12)
          {
            id v13 = v10;

            if (v13)
            {
              [v13 cancel];
              [(NSMutableSet *)self->_viewsInQueue removeObject:v4];
            }
            goto LABEL_13;
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v13 = 0;
LABEL_13:
  }
  objc_sync_exit(v5);
}

- (void)cancelAllRendering
{
  [(NSOperationQueue *)self->_queue cancelAllOperations];
  obj = self->_viewsInQueue;
  objc_sync_enter(obj);
  [(NSMutableSet *)self->_viewsInQueue removeAllObjects];
  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsInQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end