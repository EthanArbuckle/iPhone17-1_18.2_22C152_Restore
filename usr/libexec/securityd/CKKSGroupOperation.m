@interface CKKSGroupOperation
+ (id)named:(id)a3 withBlock:(id)a4;
+ (id)named:(id)a3 withBlockTakingSelf:(id)a4;
+ (id)operationWithBlock:(id)a3;
- (BOOL)fillInError;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isPending;
- (CKKSGroupOperation)init;
- (NSBlockOperation)finishOperation;
- (NSBlockOperation)startOperation;
- (NSMutableArray)internalSuccesses;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)queue;
- (id)description;
- (void)addDependency:(id)a3;
- (void)cancel;
- (void)completeOperation;
- (void)dealloc;
- (void)dependOnBeforeGroupFinished:(id)a3;
- (void)runBeforeGroupFinished:(id)a3;
- (void)setFillInError:(BOOL)a3;
- (void)setFinishOperation:(id)a3;
- (void)setInternalSuccesses:(id)a3;
- (void)setName:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStartOperation:(id)a3;
- (void)start;
@end

@implementation CKKSGroupOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalSuccesses, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_finishOperation, 0);
  objc_storeStrong((id *)&self->_startOperation, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)setInternalSuccesses:(id)a3
{
}

- (NSMutableArray)internalSuccesses
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFinishOperation:(id)a3
{
}

- (NSBlockOperation)finishOperation
{
  return (NSBlockOperation *)objc_getProperty(self, a2, 104, 1);
}

- (void)setStartOperation:(id)a3
{
}

- (NSBlockOperation)startOperation
{
  return (NSBlockOperation *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFillInError:(BOOL)a3
{
  self->_fillInError = a3;
}

- (BOOL)fillInError
{
  return self->_fillInError;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 88, 1);
}

- (void)dependOnBeforeGroupFinished:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(CKKSGroupOperation *)self isCancelled])
    {
      sub_1000CD884(@"ckksgroup", 0);
      v5 = (CKKSGroupOperation *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v5->super.super.super.super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, &v5->super.super.super.super, OS_LOG_TYPE_DEFAULT, "Can't add operation dependency to cancelled group", buf, 2u);
      }
      goto LABEL_8;
    }
    v6 = [(CKKSGroupOperation *)self finishOperation];
    [v6 addDependency:v4];

    v7 = [(CKKSGroupOperation *)self finishOperation];
    unsigned int v8 = [v7 isFinished];

    if (v8)
    {
      v11 = +[NSString stringWithFormat:@"Attempt to add operation(%@) to completed group(%@)", v4, self];
      id v12 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v11 userInfo:0];

      objc_exception_throw(v12);
    }
    v9 = [(CKKSGroupOperation *)self startOperation];
    [v4 addDependency:v9];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = self;
      objc_sync_enter(v5);
      v10 = [(CKKSGroupOperation *)v5 internalSuccesses];
      [v10 addObject:v4];

      objc_sync_exit(v5);
LABEL_8:
    }
  }
}

- (void)runBeforeGroupFinished:(id)a3
{
  id v4 = a3;
  v5 = [(CKKSGroupOperation *)self startOperation];
  [v4 addDependency:v5];

  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v4];
  id v6 = [(CKKSGroupOperation *)self operationQueue];
  [v6 addOperation:v4];
}

- (void)addDependency:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKKSGroupOperation;
  id v4 = a3;
  [(CKKSGroupOperation *)&v6 addDependency:v4];
  v5 = [(CKKSGroupOperation *)self startOperation];
  [v5 addDependency:v4];
}

- (void)completeOperation
{
  [(CKKSGroupOperation *)self willChangeValueForKey:@"isFinished"];
  [(CKKSGroupOperation *)self willChangeValueForKey:@"isExecuting"];
  v3 = [(CKKSGroupOperation *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100065738;
  block[3] = &unk_100308558;
  block[4] = self;
  dispatch_sync(v3, block);

  [(CKKSGroupOperation *)self didChangeValueForKey:@"isExecuting"];
  [(CKKSGroupOperation *)self didChangeValueForKey:@"isFinished"];
}

- (void)cancel
{
  v3 = +[NSBlockOperation blockOperationWithBlock:&stru_1002F8650];
  id v4 = [(CKKSGroupOperation *)self startOperation];
  [v4 addDependency:v3];

  v39.receiver = self;
  v39.super_class = (Class)CKKSGroupOperation;
  [(CKKSGroupOperation *)&v39 cancel];
  v5 = [(CKKSGroupOperation *)self operationQueue];
  objc_super v6 = [v5 operations];
  id v7 = [v6 copy];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v14 = [(CKKSGroupOperation *)self finishOperation];
        unsigned __int8 v15 = [v13 isEqual:v14];

        if ((v15 & 1) == 0) {
          [v13 cancel];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v10);
  }

  v16 = [(CKKSGroupOperation *)self finishOperation];
  v17 = [v16 dependencies];
  id v18 = [v17 copy];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v19 = v18;
  id v20 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v32;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
        if ((objc_msgSend(v8, "containsObject:", v24, (void)v31) & 1) == 0)
        {
          v25 = [(CKKSGroupOperation *)self startOperation];
          unsigned __int8 v26 = [v24 isEqual:v25];

          if ((v26 & 1) == 0)
          {
            v27 = [(CKKSGroupOperation *)self finishOperation];
            [v27 removeDependency:v24];
          }
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v21);
  }

  v28 = [(CKKSGroupOperation *)self startOperation];
  unsigned int v29 = [v28 isPending];

  if (v29) {
    [(CKKSGroupOperation *)self setFillInError:0];
  }
  v30 = [(CKKSGroupOperation *)self operationQueue];
  [v30 addOperation:v3];
}

- (void)start
{
  [(CKKSResultOperation *)self invalidateTimeout];
  if ([(CKKSGroupOperation *)self isCancelled])
  {
    CFStringRef v3 = @"isFinished";
    [(CKKSGroupOperation *)self willChangeValueForKey:@"isFinished"];
    id v4 = [(CKKSGroupOperation *)self queue];
    v5 = v4;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100065C24;
    v10[3] = &unk_100308558;
    v10[4] = self;
    objc_super v6 = v10;
  }
  else
  {
    id v7 = [(CKKSGroupOperation *)self operationQueue];
    id v8 = [(CKKSGroupOperation *)self startOperation];
    [v7 addOperation:v8];

    CFStringRef v3 = @"isExecuting";
    [(CKKSGroupOperation *)self willChangeValueForKey:@"isExecuting"];
    id v4 = [(CKKSGroupOperation *)self queue];
    v5 = v4;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100065C3C;
    v9[3] = &unk_100308558;
    v9[4] = self;
    objc_super v6 = v9;
  }
  dispatch_sync(v4, v6);

  [(CKKSGroupOperation *)self didChangeValueForKey:v3];
}

- (BOOL)isFinished
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  CFStringRef v3 = [(CKKSGroupOperation *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100065D2C;
  v5[3] = &unk_100307348;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isExecuting
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  CFStringRef v3 = [(CKKSGroupOperation *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100065E20;
  v5[3] = &unk_100307348;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (id)description
{
  CFStringRef v3 = [(CKKSResultOperation *)self operationStateString];
  off_10035C9E8();
  v5 = v4;
  unsigned int v6 = *v4 + 1;
  *id v4 = v6;
  if (v6 < 0xB)
  {
    if ([(CKKSGroupOperation *)self isFinished])
    {
      char v9 = [(CKKSResultOperation *)self error];

      id v10 = [(CKKSGroupOperation *)self selfname];
      uint64_t v11 = [(CKKSResultOperation *)self finishDate];
      id v12 = (void *)v11;
      if (v9)
      {
        v13 = [(CKKSResultOperation *)self error];
        uint64_t v8 = +[NSString stringWithFormat:@"<%@: %@ %@ - %@>", v10, v3, v12, v13];
      }
      else
      {
        uint64_t v8 = +[NSString stringWithFormat:@"<%@: %@ %@>", v10, v3, v11];
      }

      goto LABEL_30;
    }
    v14 = [(CKKSGroupOperation *)self operationQueue];
    unsigned __int8 v15 = (char *)[v14 operationCount];
    v16 = [(CKKSGroupOperation *)self finishOperation];
    v17 = [v16 dependencies];
    id v18 = &v15[(void)[v17 count]];

    if ((unint64_t)v18 <= 0x14)
    {
      long long v37 = v3;
      id v19 = [(CKKSGroupOperation *)self operationQueue];
      id v20 = [v19 operations];
      id v21 = [v20 mutableCopy];

      uint64_t v22 = [(CKKSGroupOperation *)self finishOperation];
      [v21 removeObject:v22];

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v23 = [(CKKSGroupOperation *)self finishOperation];
      v24 = [v23 dependencies];

      id v25 = [v24 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v39;
        while (2)
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v39 != v27) {
              objc_enumerationMutation(v24);
            }
            unsigned int v29 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if ((unint64_t)[v21 count] > 0x14)
            {

              id v7 = @"Potentially more than 20 operations";
              goto LABEL_24;
            }
            uint64_t v30 = [(CKKSGroupOperation *)self startOperation];
            if (v29 == (void *)v30)
            {
            }
            else
            {
              long long v31 = (void *)v30;
              id v32 = [v21 indexOfObject:v29];

              if (v32 == (id)0x7FFFFFFFFFFFFFFFLL) {
                [v21 addObject:v29];
              }
            }
          }
          id v26 = [v24 countByEnumeratingWithState:&v38 objects:v42 count:16];
          if (v26) {
            continue;
          }
          break;
        }
      }

      id v7 = [v21 componentsJoinedByString:@", "];
LABEL_24:

      CFStringRef v3 = v37;
    }
    else
    {
      id v7 = @"Potentially more than 20 operations";
    }
    long long v33 = [(CKKSResultOperation *)self error];

    long long v34 = [(CKKSGroupOperation *)self selfname];
    if (v33)
    {
      long long v35 = [(CKKSResultOperation *)self error];
      +[NSString stringWithFormat:@"<%@: %@ [%@] error:%@>", v34, v3, v7, v35];
    }
    else
    {
      long long v35 = [(CKKSGroupOperation *)self pendingDependenciesString:@" dep:"];
      +[NSString stringWithFormat:@"<%@: %@ [%@]%@>", v34, v3, v7, v35];
    uint64_t v8 = };
  }
  else
  {
    id v7 = [(CKKSGroupOperation *)self selfname];
    uint64_t v8 = +[NSString stringWithFormat:@"<%@: %@ recursion>", v7, v3];
  }

LABEL_30:
  --*v5;

  return v8;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  v5 = +[NSString stringWithFormat:@"group-queue:%@", v4];
  unsigned int v6 = [(CKKSGroupOperation *)self operationQueue];
  [v6 setName:v5];

  id v7 = +[NSString stringWithFormat:@"group-start:%@", v4];
  uint64_t v8 = [(CKKSGroupOperation *)self startOperation];
  [v8 setName:v7];

  char v9 = +[NSString stringWithFormat:@"group-finish:%@", v4];
  id v10 = [(CKKSGroupOperation *)self finishOperation];
  [v10 setName:v9];

  v11.receiver = self;
  v11.super_class = (Class)CKKSGroupOperation;
  [(CKKSGroupOperation *)&v11 setName:v4];
}

- (BOOL)isPending
{
  CFStringRef v3 = [(CKKSGroupOperation *)self startOperation];
  if ([v3 isPending]) {
    unsigned int v4 = [(CKKSGroupOperation *)self isCancelled] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)dealloc
{
  if ([(CKKSGroupOperation *)self isPending])
  {
    CFStringRef v3 = [(CKKSGroupOperation *)self operationQueue];
    [v3 cancelAllOperations];

    unsigned int v4 = [(CKKSGroupOperation *)self startOperation];
    [v4 cancel];

    v6.receiver = self;
    v6.super_class = (Class)CKKSGroupOperation;
    [(CKKSGroupOperation *)&v6 cancel];
  }
  v5.receiver = self;
  v5.super_class = (Class)CKKSGroupOperation;
  [(CKKSGroupOperation *)&v5 dealloc];
}

- (CKKSGroupOperation)init
{
  v28.receiver = self;
  v28.super_class = (Class)CKKSGroupOperation;
  v2 = [(CKKSResultOperation *)&v28 init];
  if (v2)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v2->_fillInError = 1;
    CFStringRef v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    objc_super v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    internalSuccesses = v2->_internalSuccesses;
    v2->_internalSuccesses = v5;

    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("CKKSGroupOperationDispatchQueue", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000667AC;
    v25[3] = &unk_1003077A0;
    objc_copyWeak(&v26, &location);
    uint64_t v10 = +[NSBlockOperation blockOperationWithBlock:v25];
    startOperation = v2->_startOperation;
    v2->_startOperation = (NSBlockOperation *)v10;

    id v12 = [(CKKSGroupOperation *)v2 startOperation];
    [v12 removeDependenciesUponCompletion];

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100066900;
    v23[3] = &unk_1003077A0;
    objc_copyWeak(&v24, &location);
    uint64_t v13 = +[NSBlockOperation blockOperationWithBlock:v23];
    finishOperation = v2->_finishOperation;
    v2->_finishOperation = (NSBlockOperation *)v13;

    unsigned __int8 v15 = [(CKKSGroupOperation *)v2 finishOperation];
    [v15 removeDependenciesUponCompletion];

    v16 = [(CKKSGroupOperation *)v2 finishOperation];
    v17 = [(CKKSGroupOperation *)v2 startOperation];
    [v16 addDependency:v17];

    id v18 = [(CKKSGroupOperation *)v2 operationQueue];
    id v19 = [(CKKSGroupOperation *)v2 finishOperation];
    [v18 addOperation:v19];

    id v20 = [(CKKSGroupOperation *)v2 startOperation];
    [v20 setName:@"group-start"];

    id v21 = [(CKKSGroupOperation *)v2 finishOperation];
    [v21 setName:@"group-finish"];

    v2->executing = 0;
    v2->finished = 0;
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (id)named:(id)a3 withBlockTakingSelf:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100066AEC;
  v12[3] = &unk_100306A38;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v13 = v9;
  uint64_t v10 = +[NSBlockOperation blockOperationWithBlock:v12];
  [v8 runBeforeGroupFinished:v10];

  [v8 setName:v6];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

+ (id)named:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = [a1 operationWithBlock:a4];
  [v7 setName:v6];

  return v7;
}

+ (id)operationWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  id v6 = +[NSBlockOperation blockOperationWithBlock:v4];

  [v5 runBeforeGroupFinished:v6];

  return v5;
}

@end