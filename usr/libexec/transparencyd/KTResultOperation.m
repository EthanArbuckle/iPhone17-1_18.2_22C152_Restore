@interface KTResultOperation
+ (id)named:(id)a3 withBlock:(id)a4;
+ (id)named:(id)a3 withBlockTakingSelf:(id)a4;
+ (id)operationWithBlock:(id)a3;
- (BOOL)allDependentsSuccessful;
- (BOOL)allSuccessful:(id)a3;
- (BOOL)timeoutCanOccur;
- (KTCondition)completionHandlerDidRunCondition;
- (KTResultOperation)init;
- (NSDate)finishDate;
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
- (void)addSuccessDependency:(id)a3;
- (void)invalidateTimeout;
- (void)setCompletionBlock:(id)a3;
- (void)setCompletionHandlerDidRunCondition:(id)a3;
- (void)setDescriptionErrorCode:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setFinishDate:(id)a3;
- (void)setFinishingBlock:(id)a3;
- (void)setSuccessDependencies:(id)a3;
- (void)setTimeoutCanOccur:(BOOL)a3;
- (void)setTimeoutQueue:(id)a3;
- (void)start;
@end

@implementation KTResultOperation

- (KTResultOperation)init
{
  v20.receiver = self;
  v20.super_class = (Class)KTResultOperation;
  v2 = [(KTResultOperation *)&v20 init];
  if (v2)
  {
    id location = 0;
    objc_initWeak(&location, v2);
    error = v2->_error;
    v2->_error = 0;

    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    successDependencies = v2->_successDependencies;
    v2->_successDependencies = v4;

    v2->_timeoutCanOccur = 1;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("result-operation-timeout", v6);
    timeoutQueue = v2->_timeoutQueue;
    v2->_timeoutQueue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(KTCondition);
    completionHandlerDidRunCondition = v2->_completionHandlerDidRunCondition;
    v2->_completionHandlerDidRunCondition = v9;

    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_100207D04;
    v17 = &unk_1002B72D8;
    objc_copyWeak(&v18, &location);
    v11 = objc_retainBlock(&v14);
    id finishingBlock = v2->_finishingBlock;
    v2->_id finishingBlock = v11;

    -[KTResultOperation setCompletionBlock:](v2, "setCompletionBlock:", &stru_1002C9DF8, v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (id)operationStateString
{
  if ([(KTResultOperation *)self isFinished])
  {
    v3 = [(KTResultOperation *)self finishDate];
    v4 = +[NSString stringWithFormat:@"finished %@", v3];
  }
  else
  {
    if ([(KTResultOperation *)self isCancelled])
    {
      v5 = @"cancelled";
    }
    else if ([(KTResultOperation *)self isExecuting])
    {
      v5 = @"executing";
    }
    else
    {
      unsigned int v6 = [(KTResultOperation *)self isReady];
      v5 = @"pending";
      if (v6) {
        v5 = @"ready";
      }
    }
    v4 = v5;
  }

  return v4;
}

- (id)description
{
  v3 = [(KTResultOperation *)self operationStateString];
  off_1003265F0();
  v5 = v4;
  unsigned int v6 = *v4 + 1;
  unsigned int *v4 = v6;
  if (v6 < 0xB)
  {
    v9 = [(KTResultOperation *)self error];

    dispatch_queue_t v7 = [(KTResultOperation *)self selfname];
    if (v9)
    {
      v10 = [(KTResultOperation *)self error];
      +[NSString stringWithFormat:@"<%@: %@ error:%@>", v7, v3, v10];
    }
    else
    {
      v10 = [(KTResultOperation *)self pendingDependenciesString:@" dep:"];
      +[NSString stringWithFormat:@"<%@: %@%@>", v7, v3, v10];
    v8 = };
  }
  else
  {
    dispatch_queue_t v7 = [(KTResultOperation *)self selfname];
    v8 = +[NSString stringWithFormat:@"<%@: %@ recursion>", v7, v3];
  }

  --*v5;

  return v8;
}

- (void)setCompletionBlock:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002080B4;
  v7[3] = &unk_1002BB0D8;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)KTResultOperation;
  [(KTResultOperation *)&v6 setCompletionBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)start
{
  if ([(KTResultOperation *)self allDependentsSuccessful])
  {
    [(KTResultOperation *)self invalidateTimeout];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v3 = [(KTResultOperation *)self error];
      *(_DWORD *)buf = 138412290;
      objc_super v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not running due to some failed dependent: %@", buf, 0xCu);
    }
    [(KTResultOperation *)self cancel];
  }
  v4.receiver = self;
  v4.super_class = (Class)KTResultOperation;
  [(KTResultOperation *)&v4 start];
}

- (void)invalidateTimeout
{
  v3 = [(KTResultOperation *)self timeoutQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002083D0;
  block[3] = &unk_1002B6CF8;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (id)dependenciesDescriptionError
{
  v2 = [(KTResultOperation *)self dependencies];
  id v3 = [v2 copy];

  objc_super v4 = [v3 indexesOfObjectsPassingTest:&stru_1002C9E38];
  id v5 = [v3 objectsAtIndexes:v4];

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
          uint64_t v15 = (void *)v14;
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

- (id)descriptionError
{
  off_100326608();
  objc_super v4 = v3;
  ++*v3;
  if ([(KTResultOperation *)self descriptionErrorCode])
  {
    id v5 = +[NSError errorWithDomain:@"KTResultOperationDescriptionError" code:[(KTResultOperation *)self descriptionErrorCode] userInfo:0];
  }
  else
  {
    if (*v4 < 0xBu) {
      [(KTResultOperation *)self dependenciesDescriptionError];
    }
    else {
    id v5 = +[NSError errorWithDomain:@"KTResultOperationDescriptionError" code:-1 description:@"Excess recursion"];
    }
  }
  --*v4;

  return v5;
}

- (id)_onqueueTimeoutError
{
  id v3 = [(KTResultOperation *)self timeoutQueue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = [(KTResultOperation *)self descriptionError];
  id v5 = [(KTResultOperation *)self selfname];
  id v6 = [(KTResultOperation *)self pendingDependenciesString:&stru_1002CE4C0];
  id v7 = +[NSString stringWithFormat:@"Operation(%@) timed out waiting to start for [%@]", v5, v6];
  id v8 = +[NSError errorWithDomain:@"KTResultOperationError" code:3 description:v7 underlying:v4];

  return v8;
}

- (id)timeout:(unint64_t)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0, a3);
  id v6 = [(KTResultOperation *)self timeoutQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002088C0;
  v8[3] = &unk_1002B72D8;
  objc_copyWeak(&v9, &location);
  dispatch_after(v5, v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return self;
}

- (void)addSuccessDependency:(id)a3
{
}

- (void)addNullableSuccessDependency:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    objc_super v4 = self;
    objc_sync_enter(v4);
    dispatch_time_t v5 = [(KTResultOperation *)v4 successDependencies];
    [v5 addObject:v6];

    [(KTResultOperation *)v4 addDependency:v6];
    objc_sync_exit(v4);
  }
}

- (BOOL)allDependentsSuccessful
{
  v2 = self;
  id v3 = [(KTResultOperation *)self successDependencies];
  LOBYTE(v2) = [(KTResultOperation *)v2 allSuccessful:v3];

  return (char)v2;
}

- (BOOL)allSuccessful:(id)a3
{
  id v4 = a3;
  v32 = self;
  objc_sync_enter(v32);
  v30 = +[NSMutableArray array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
  BOOL v29 = v6 == 0;
  id obj = v5;
  if (!v6) {
    goto LABEL_22;
  }
  char v7 = 0;
  char v8 = 0;
  char v9 = 1;
  uint64_t v33 = *(void *)v38;
  do
  {
    id v34 = v6;
    for (i = 0; i != v34; i = (char *)i + 1)
    {
      if (*(void *)v38 != v33) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      unsigned __int8 v36 = [v11 isFinished];
      unsigned __int8 v35 = [v11 isCancelled];
      v12 = [v11 error];
      BOOL v13 = v12 != 0;

      if ([v11 isCancelled]) {
        [v30 addObject:v11];
      }
      uint64_t v14 = [v11 error];
      BOOL v15 = v14 == 0;

      if (!v15)
      {
        v16 = [v11 error];
        id v17 = [v16 domain];
        if ([v17 isEqual:@"KTResultOperationError"])
        {
          id v18 = [v11 error];
          BOOL v19 = [v18 code] == (id)1;

          if (v19)
          {
            long long v20 = [v11 error];
            [(KTResultOperation *)v32 setError:v20];
LABEL_14:

            goto LABEL_15;
          }
        }
        else
        {
        }
        long long v20 = +[NSMutableDictionary dictionary];
        long long v21 = [v11 name];
        [v20 setObject:v21 forKeyedSubscript:@"op"];

        long long v22 = [v11 error];
        v23 = +[NSError errorWithDomain:@"KTResultOperationError" code:1 userInfo:v20 description:@"Success-dependent operation failed" underlying:v22];
        [(KTResultOperation *)v32 setError:v23];

        goto LABEL_14;
      }
LABEL_15:
      v9 &= v36;
      v7 |= v35;
      v8 |= v13;
    }
    id v6 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  }
  while (v6);

  if (!(v7 & 1 | ((v9 & 1) == 0) | v8 & 1))
  {
    BOOL v29 = 1;
    goto LABEL_23;
  }
  v24 = [(KTResultOperation *)v32 error];
  BOOL v25 = v24 == 0;

  if (v25)
  {
    NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
    id v5 = +[NSString stringWithFormat:@"Operation (%@) cancelled", v30];
    id v42 = v5;
    v26 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    v27 = +[NSError errorWithDomain:@"KTResultOperationError" code:2 userInfo:v26];
    [(KTResultOperation *)v32 setError:v27];

LABEL_22:
    goto LABEL_23;
  }
  BOOL v29 = 0;
LABEL_23:

  objc_sync_exit(v32);
  return v29;
}

+ (id)operationWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 addExecutionBlock:v4];

  return v5;
}

+ (id)named:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  char v7 = [a1 operationWithBlock:a4];
  [v7 setName:v6];

  return v7;
}

+ (id)named:(id)a3 withBlockTakingSelf:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  id location = 0;
  objc_initWeak(&location, v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100209008;
  v11[3] = &unk_1002BB0D8;
  objc_copyWeak(&v13, &location);
  id v9 = v7;
  id v12 = v9;
  [v8 addExecutionBlock:v11];
  [v8 setName:v6];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
}

- (NSDate)finishDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFinishDate:(id)a3
{
}

- (KTCondition)completionHandlerDidRunCondition
{
  return (KTCondition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCompletionHandlerDidRunCondition:(id)a3
{
}

- (int64_t)descriptionErrorCode
{
  return self->_descriptionErrorCode;
}

- (void)setDescriptionErrorCode:(int64_t)a3
{
  self->_descriptionErrorCode = a3;
}

- (NSMutableArray)successDependencies
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSuccessDependencies:(id)a3
{
}

- (BOOL)timeoutCanOccur
{
  return self->_timeoutCanOccur;
}

- (void)setTimeoutCanOccur:(BOOL)a3
{
  self->_timeoutCanOccur = a3;
}

- (OS_dispatch_queue)timeoutQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimeoutQueue:(id)a3
{
}

- (id)finishingBlock
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setFinishingBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishingBlock, 0);
  objc_storeStrong((id *)&self->_timeoutQueue, 0);
  objc_storeStrong((id *)&self->_successDependencies, 0);
  objc_storeStrong((id *)&self->_completionHandlerDidRunCondition, 0);
  objc_storeStrong((id *)&self->_finishDate, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end