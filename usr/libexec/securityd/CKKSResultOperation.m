@interface CKKSResultOperation
+ (CKKSResultOperation)operationWithBlock:(id)a3;
+ (id)named:(id)a3 withBlock:(id)a4;
+ (id)named:(id)a3 withBlockTakingSelf:(id)a4;
- (BOOL)allDependentsSuccessful;
- (BOOL)allSuccessful:(id)a3;
- (BOOL)timeoutCanOccur;
- (CKKSCondition)completionHandlerDidRunCondition;
- (CKKSResultOperation)init;
- (NSDate)finishDate;
- (NSError)descriptionUnderlyingError;
- (NSError)error;
- (NSMutableArray)successDependencies;
- (OS_dispatch_queue)timeoutQueue;
- (id)_onqueueTimeoutError;
- (id)dependenciesDescriptionError;
- (id)description;
- (id)descriptionError;
- (id)finishingBlock;
- (id)operationStateString;
- (id)timeout:(unint64_t)a3;
- (int64_t)descriptionErrorCode;
- (void)addNullableSuccessDependency:(id)a3;
- (void)invalidateTimeout;
- (void)setCompletionBlock:(id)a3;
- (void)setCompletionHandlerDidRunCondition:(id)a3;
- (void)setDescriptionErrorCode:(int64_t)a3;
- (void)setDescriptionUnderlyingError:(id)a3;
- (void)setError:(id)a3;
- (void)setFinishDate:(id)a3;
- (void)setFinishingBlock:(id)a3;
- (void)setSuccessDependencies:(id)a3;
- (void)setTimeoutCanOccur:(BOOL)a3;
- (void)setTimeoutQueue:(id)a3;
- (void)start;
@end

@implementation CKKSResultOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishingBlock, 0);
  objc_storeStrong((id *)&self->_timeoutQueue, 0);
  objc_storeStrong((id *)&self->_successDependencies, 0);
  objc_storeStrong((id *)&self->_descriptionUnderlyingError, 0);
  objc_storeStrong((id *)&self->_completionHandlerDidRunCondition, 0);
  objc_storeStrong((id *)&self->_finishDate, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setFinishingBlock:(id)a3
{
}

- (id)finishingBlock
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setTimeoutQueue:(id)a3
{
}

- (OS_dispatch_queue)timeoutQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTimeoutCanOccur:(BOOL)a3
{
  self->_timeoutCanOccur = a3;
}

- (BOOL)timeoutCanOccur
{
  return self->_timeoutCanOccur;
}

- (void)setSuccessDependencies:(id)a3
{
}

- (NSMutableArray)successDependencies
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDescriptionUnderlyingError:(id)a3
{
}

- (NSError)descriptionUnderlyingError
{
  return (NSError *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDescriptionErrorCode:(int64_t)a3
{
  self->_descriptionErrorCode = a3;
}

- (int64_t)descriptionErrorCode
{
  return self->_descriptionErrorCode;
}

- (void)setCompletionHandlerDidRunCondition:(id)a3
{
}

- (CKKSCondition)completionHandlerDidRunCondition
{
  return (CKKSCondition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFinishDate:(id)a3
{
}

- (NSDate)finishDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)allSuccessful:(id)a3
{
  id v4 = a3;
  v30 = self;
  objc_sync_enter(v30);
  v28 = +[NSMutableArray array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
  BOOL v27 = v6 == 0;
  id obj = v5;
  if (!v6) {
    goto LABEL_22;
  }
  char v7 = 0;
  char v8 = 0;
  uint64_t v31 = *(void *)v36;
  char v9 = 1;
  do
  {
    id v32 = v6;
    for (i = 0; i != v32; i = (char *)i + 1)
    {
      if (*(void *)v36 != v31) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      unsigned __int8 v34 = [v11 isFinished];
      unsigned __int8 v33 = [v11 isCancelled];
      v12 = [v11 error];
      BOOL v13 = v12 != 0;

      if ([v11 isCancelled]) {
        [v28 addObject:v11];
      }
      v14 = [v11 error];
      BOOL v15 = v14 == 0;

      if (!v15)
      {
        v16 = [v11 error];
        v17 = [v16 domain];
        if ([v17 isEqual:@"CKKSResultOperationError"])
        {
          v18 = [v11 error];
          BOOL v19 = [v18 code] == (id)1;

          if (v19)
          {
            v20 = [v11 error];
            [(CKKSResultOperation *)v30 setError:v20];
LABEL_14:

            goto LABEL_15;
          }
        }
        else
        {
        }
        v20 = [v11 error];
        v21 = +[NSError errorWithDomain:@"CKKSResultOperationError" code:1 description:@"Success-dependent operation failed" underlying:v20];
        [(CKKSResultOperation *)v30 setError:v21];

        goto LABEL_14;
      }
LABEL_15:
      v9 &= v34;
      v7 |= v33;
      v8 |= v13;
    }
    id v6 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  }
  while (v6);

  if (!(v7 & 1 | ((v9 & 1) == 0) | v8 & 1))
  {
    BOOL v27 = 1;
    goto LABEL_23;
  }
  v22 = [(CKKSResultOperation *)v30 error];
  BOOL v23 = v22 == 0;

  if (v23)
  {
    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    id v5 = +[NSString stringWithFormat:@"Operation (%@) cancelled", v28];
    id v40 = v5;
    v24 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    v25 = +[NSError errorWithDomain:@"CKKSResultOperationError" code:2 userInfo:v24];
    [(CKKSResultOperation *)v30 setError:v25];

LABEL_22:
    goto LABEL_23;
  }
  BOOL v27 = 0;
LABEL_23:

  objc_sync_exit(v30);
  return v27;
}

- (BOOL)allDependentsSuccessful
{
  v2 = self;
  v3 = [(CKKSResultOperation *)self successDependencies];
  LOBYTE(v2) = [(CKKSResultOperation *)v2 allSuccessful:v3];

  return (char)v2;
}

- (void)addNullableSuccessDependency:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = self;
    objc_sync_enter(v4);
    id v5 = [(CKKSResultOperation *)v4 successDependencies];
    [v5 addObject:v6];

    [(CKKSResultOperation *)v4 addDependency:v6];
    objc_sync_exit(v4);
  }
}

- (id)timeout:(unint64_t)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0, a3);
  id v6 = [(CKKSResultOperation *)self timeoutQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10012A810;
  v8[3] = &unk_1003077A0;
  objc_copyWeak(&v9, &location);
  dispatch_after(v5, v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return self;
}

- (id)_onqueueTimeoutError
{
  v3 = [(CKKSResultOperation *)self timeoutQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CKKSResultOperation *)self descriptionError];
  dispatch_time_t v5 = [(CKKSResultOperation *)self selfname];
  id v6 = [(CKKSResultOperation *)self pendingDependenciesString:&stru_10030AA90];
  char v7 = +[NSString stringWithFormat:@"Operation(%@) timed out waiting to start for [%@]", v5, v6];
  char v8 = +[NSError errorWithDomain:@"CKKSResultOperationError" code:3 description:v7 underlying:v4];

  return v8;
}

- (id)descriptionError
{
  off_10035CA48();
  id v4 = v3;
  ++*v3;
  if ([(CKKSResultOperation *)self descriptionErrorCode])
  {
    dispatch_time_t v5 = [(CKKSResultOperation *)self descriptionUnderlyingError];

    if (v5)
    {
      dispatch_time_t v5 = +[NSMutableDictionary dictionary];
      id v6 = [(CKKSResultOperation *)self descriptionUnderlyingError];
      [v5 setObject:v6 forKeyedSubscript:NSUnderlyingErrorKey];
    }
    char v7 = +[NSError errorWithDomain:@"CKKSResultOperationDescriptionError" code:[(CKKSResultOperation *)self descriptionErrorCode] userInfo:v5];
  }
  else
  {
    if (*v4 < 0xBu) {
      [(CKKSResultOperation *)self dependenciesDescriptionError];
    }
    else {
    char v7 = +[NSError errorWithDomain:@"CKKSResultOperationDescriptionError" code:-1 description:@"Excess recursion"];
    }
  }
  --*v4;

  return v7;
}

- (id)dependenciesDescriptionError
{
  v2 = [(CKKSResultOperation *)self dependencies];
  id v3 = [v2 copy];

  id v4 = [v3 indexesOfObjectsPassingTest:&stru_1002FB010];
  dispatch_time_t v5 = [v3 objectsAtIndexes:v4];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          uint64_t v14 = [v13 descriptionError:v19];
          BOOL v15 = (void *)v14;
          if (v14) {
            v16 = (void *)v14;
          }
          else {
            v16 = v9;
          }
          id v17 = v16;

          id v9 = v17;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)invalidateTimeout
{
  id v3 = [(CKKSResultOperation *)self timeoutQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012AD2C;
  block[3] = &unk_100308558;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)start
{
  if ([(CKKSResultOperation *)self allDependentsSuccessful]) {
    [(CKKSResultOperation *)self invalidateTimeout];
  }
  else {
    [(CKKSResultOperation *)self cancel];
  }
  v3.receiver = self;
  v3.super_class = (Class)CKKSResultOperation;
  [(CKKSResultOperation *)&v3 start];
}

- (void)setCompletionBlock:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10012AEE0;
  v7[3] = &unk_100306A38;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)CKKSResultOperation;
  [(CKKSResultOperation *)&v6 setCompletionBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)description
{
  objc_super v3 = [(CKKSResultOperation *)self operationStateString];
  off_10035CA30();
  id v5 = v4;
  unsigned int v6 = *v4 + 1;
  *id v4 = v6;
  if (v6 < 0xB)
  {
    id v9 = [(CKKSResultOperation *)self error];

    id v7 = [(CKKSResultOperation *)self selfname];
    if (v9)
    {
      uint64_t v10 = [(CKKSResultOperation *)self error];
      +[NSString stringWithFormat:@"<%@: %@ error:%@>", v7, v3, v10];
    }
    else
    {
      uint64_t v10 = [(CKKSResultOperation *)self pendingDependenciesString:@" dep:"];
      +[NSString stringWithFormat:@"<%@: %@%@>", v7, v3, v10];
    id v8 = };
  }
  else
  {
    id v7 = [(CKKSResultOperation *)self selfname];
    id v8 = +[NSString stringWithFormat:@"<%@: %@ recursion>", v7, v3];
  }

  --*v5;

  return v8;
}

- (id)operationStateString
{
  if ([(CKKSResultOperation *)self isFinished])
  {
    objc_super v3 = [(CKKSResultOperation *)self finishDate];
    id v4 = +[NSString stringWithFormat:@"finished %@", v3];
  }
  else
  {
    if ([(CKKSResultOperation *)self isCancelled])
    {
      id v5 = @"cancelled";
    }
    else if ([(CKKSResultOperation *)self isExecuting])
    {
      id v5 = @"executing";
    }
    else
    {
      unsigned int v6 = [(CKKSResultOperation *)self isReady];
      id v5 = @"pending";
      if (v6) {
        id v5 = @"ready";
      }
    }
    id v4 = v5;
  }

  return v4;
}

- (CKKSResultOperation)init
{
  v20.receiver = self;
  v20.super_class = (Class)CKKSResultOperation;
  v2 = [(CKKSResultOperation *)&v20 init];
  if (v2)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    error = v2->_error;
    v2->_error = 0;

    id v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    successDependencies = v2->_successDependencies;
    v2->_successDependencies = v4;

    v2->_timeoutCanOccur = 1;
    unsigned int v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("result-operation-timeout", v6);
    timeoutQueue = v2->_timeoutQueue;
    v2->_timeoutQueue = (OS_dispatch_queue *)v7;

    id v9 = objc_alloc_init(CKKSCondition);
    completionHandlerDidRunCondition = v2->_completionHandlerDidRunCondition;
    v2->_completionHandlerDidRunCondition = v9;

    uint64_t v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_10012B48C;
    id v17 = &unk_1003077A0;
    objc_copyWeak(&v18, &location);
    v11 = objc_retainBlock(&v14);
    id finishingBlock = v2->_finishingBlock;
    v2->_id finishingBlock = v11;

    -[CKKSResultOperation setCompletionBlock:](v2, "setCompletionBlock:", &stru_1002FAFF0, v14, v15, v16, v17);
    objc_destroyWeak(&v18);
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
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012B62C;
  v11[3] = &unk_100306A38;
  objc_copyWeak(&v13, &location);
  id v9 = v7;
  id v12 = v9;
  [v8 addExecutionBlock:v11];
  [v8 setName:v6];

  objc_destroyWeak(&v13);
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

+ (CKKSResultOperation)operationWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 addExecutionBlock:v4];

  return (CKKSResultOperation *)v5;
}

@end