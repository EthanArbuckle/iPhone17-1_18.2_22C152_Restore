@interface ICDServerOperationsManager
- (BOOL)cancelOperationsByClass:(Class)a3;
- (BOOL)hasOperationsOfClass:(Class)a3;
- (BOOL)isNetworkActivityIndicatorVisible;
- (ICDServerOperationsManager)init;
- (NSOperationQueue)backgroundOperationQueue;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)serialQueue;
- (id)listCloudServerOperations;
- (void)_setupInternalQueues;
- (void)_setupKVO;
- (void)_tearDownKVO;
- (void)addBackgroundOperation:(id)a3 priority:(int)a4;
- (void)addOperation:(id)a3 priority:(int)a4;
- (void)dealloc;
- (void)enumerateBackgroundOperationsUsingBlock:(id)a3;
- (void)enumerateOperationsUsingBlock:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setNetworkActivityIndicatorVisible:(BOOL)a3;
@end

@implementation ICDServerOperationsManager

- (void)addOperation:(id)a3 priority:(int)a4
{
  BOOL v6 = a4 == 2;
  id v7 = a3;
  v8 = v7;
  if (a4) {
    uint64_t v9 = 4 * v6;
  }
  else {
    uint64_t v9 = -4;
  }
  [v7 setQueuePriority:v9];
  [v8 setQualityOfService:17];
  v10 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v8 name];
    int v12 = 138544130;
    v13 = self;
    __int16 v14 = 2048;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    __int16 v18 = 1024;
    int v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding operation %p (name=%{public}@) with priority %d", (uint8_t *)&v12, 0x26u);
  }
  [(NSOperationQueue *)self->_operationQueue addOperation:v8];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001F2BA8 != a6)
  {
    v12.receiver = self;
    v12.super_class = (Class)ICDServerOperationsManager;
    -[ICDServerOperationsManager observeValueForKeyPath:ofObject:change:context:](&v12, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
    return;
  }
  NSUInteger v7 = [(NSOperationQueue *)self->_operationQueue operationCount];
  NSUInteger v8 = [(NSOperationQueue *)self->_backgroundOperationQueue operationCount];
  unsigned int v9 = [(ICDServerOperationsManager *)self isNetworkActivityIndicatorVisible];
  if (v7 + v8)
  {
    if (v9) {
      return;
    }
    sub_1000095D8(1);
    v10 = self;
    uint64_t v11 = 1;
  }
  else
  {
    if (!v9) {
      return;
    }
    sub_1000095D8(0);
    v10 = self;
    uint64_t v11 = 0;
  }

  [(ICDServerOperationsManager *)v10 setNetworkActivityIndicatorVisible:v11];
}

- (BOOL)isNetworkActivityIndicatorVisible
{
  v2 = self;
  uint64_t v6 = 0;
  NSUInteger v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(ICDServerOperationsManager *)self serialQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100010C60;
  v5[3] = &unk_1001BE648;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setNetworkActivityIndicatorVisible:(BOOL)a3
{
  v5 = [(ICDServerOperationsManager *)self serialQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100010C50;
  v6[3] = &unk_1001BDD48;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_backgroundOperationQueue, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (NSOperationQueue)backgroundOperationQueue
{
  return self->_backgroundOperationQueue;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)_tearDownKVO
{
  [(NSOperationQueue *)self->_operationQueue removeObserver:self forKeyPath:@"operationCount" context:off_1001F2BA8];
  backgroundOperationQueue = self->_backgroundOperationQueue;
  v4 = off_1001F2BA8;

  [(NSOperationQueue *)backgroundOperationQueue removeObserver:self forKeyPath:@"operationCount" context:v4];
}

- (void)_setupKVO
{
  [(NSOperationQueue *)self->_operationQueue addObserver:self forKeyPath:@"operationCount" options:0 context:off_1001F2BA8];
  backgroundOperationQueue = self->_backgroundOperationQueue;
  v4 = off_1001F2BA8;

  [(NSOperationQueue *)backgroundOperationQueue addObserver:self forKeyPath:@"operationCount" options:0 context:v4];
}

- (void)_setupInternalQueues
{
  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunescloudd.ICDServerOperationsManager.serial.queue", 0);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v3;

  v5 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  operationQueue = self->_operationQueue;
  self->_operationQueue = v5;

  [(NSOperationQueue *)self->_operationQueue setName:@"com.apple.itunescloudd.ICDServerOperationsManager.operationQueue"];
  [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:1];
  BOOL v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  backgroundOperationQueue = self->_backgroundOperationQueue;
  self->_backgroundOperationQueue = v7;

  [(NSOperationQueue *)self->_backgroundOperationQueue setName:@"com.apple.itunescloudd.ICDServerOperationsManager.backgroundOperationQueue"];
  char v9 = self->_backgroundOperationQueue;

  [(NSOperationQueue *)v9 setMaxConcurrentOperationCount:1];
}

- (id)listCloudServerOperations
{
  v3 = [(NSOperationQueue *)self->_operationQueue operations];
  id v4 = [v3 copy];

  v5 = [(NSOperationQueue *)self->_backgroundOperationQueue operations];
  id v6 = [v5 copy];

  BOOL v7 = +[NSMutableDictionary dictionary];
  uint64_t v8 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v50 = [v4 count];
    *(_WORD *)&v50[4] = 1024;
    *(_DWORD *)&v50[6] = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "operations count=%d, backgroundOperations count=%d", buf, 0xEu);
  }

  v38 = v7;
  id v37 = v6;
  if ([v4 count])
  {
    char v9 = +[NSMutableArray array];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v10 = v4;
    id v11 = [v10 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v44;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v44 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          __int16 v16 = [v15 name];
          v17 = v16;
          if (v16)
          {
            id v18 = v16;
          }
          else
          {
            int v19 = (objc_class *)objc_opt_class();
            NSStringFromClass(v19);
            id v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          v20 = v18;

          v21 = +[NSString stringWithFormat:@"name=%@, object=%p", v20, v15];
          [v9 addObject:v21];
        }
        id v12 = [v10 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v12);
    }

    BOOL v7 = v38;
    [v38 setObject:v9 forKey:@"ICDServerOperationsManagerOperationNamesKey"];

    id v6 = v37;
  }
  if ([v6 count])
  {
    v22 = +[NSMutableArray array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v23 = v6;
    id v24 = [v23 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v40;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
          v29 = [v28 name];
          v30 = v29;
          if (v29)
          {
            id v31 = v29;
          }
          else
          {
            v32 = (objc_class *)objc_opt_class();
            NSStringFromClass(v32);
            id v31 = (id)objc_claimAutoreleasedReturnValue();
          }
          v33 = v31;

          v34 = +[NSString stringWithFormat:@"name=%@, object=%p", v33, v28];
          [v22 addObject:v34];
        }
        id v25 = [v23 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v25);
    }

    BOOL v7 = v38;
    [v38 setObject:v22 forKey:@"ICDServerOperationsManagerBackgroundOperationNamesKey"];

    id v6 = v37;
  }
  v35 = os_log_create("com.apple.amp.itunescloudd", "Default_Oversize");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v50 = v7;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "cloudServerOperations=%{public}@", buf, 0xCu);
  }

  return v7;
}

- (BOOL)cancelOperationsByClass:(Class)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(NSOperationQueue *)self->_operationQueue operations];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        char v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          [v9 cancel];
          char v6 = 1;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (BOOL)hasOperationsOfClass:(Class)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(NSOperationQueue *)self->_operationQueue operations];
  id v4 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_opt_isKindOfClass())
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      id v5 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (void)enumerateBackgroundOperationsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, uint64_t, char *))a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(NSOperationQueue *)self->_backgroundOperationQueue operations];
    id v6 = [v5 copy];

    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        char v12 = 0;
        v4[2](v4, v11, &v12);
        if (v12) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)enumerateOperationsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, uint64_t, char *))a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(NSOperationQueue *)self->_operationQueue operations];
    id v6 = [v5 copy];

    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        char v12 = 0;
        v4[2](v4, v11, &v12);
        if (v12) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)addBackgroundOperation:(id)a3 priority:(int)a4
{
  BOOL v6 = a4 == 2;
  id v7 = a3;
  id v8 = v7;
  if (a4) {
    uint64_t v9 = 4 * v6;
  }
  else {
    uint64_t v9 = -4;
  }
  [v7 setQueuePriority:v9];
  [v8 setQualityOfService:9];
  uint64_t v10 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v8 name];
    int v12 = 138544130;
    long long v13 = self;
    __int16 v14 = 2048;
    long long v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    __int16 v18 = 1024;
    int v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding background operation %p (name=%{public}@) with priority %d", (uint8_t *)&v12, 0x26u);
  }
  [(NSOperationQueue *)self->_backgroundOperationQueue addOperation:v8];
}

- (void)dealloc
{
  [(ICDServerOperationsManager *)self _tearDownKVO];
  v3.receiver = self;
  v3.super_class = (Class)ICDServerOperationsManager;
  [(ICDServerOperationsManager *)&v3 dealloc];
}

- (ICDServerOperationsManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICDServerOperationsManager;
  v2 = [(ICDServerOperationsManager *)&v5 init];
  objc_super v3 = v2;
  if (v2)
  {
    [(ICDServerOperationsManager *)v2 _setupInternalQueues];
    [(ICDServerOperationsManager *)v3 _setupKVO];
  }
  return v3;
}

@end