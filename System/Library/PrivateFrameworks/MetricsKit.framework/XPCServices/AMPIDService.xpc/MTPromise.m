@interface MTPromise
+ (BOOL)_errorIsCanceledError:(id)a3;
+ (MTPromise)promiseWithAll:(id)a3;
+ (MTPromise)promiseWithAny:(id)a3;
+ (MTPromise)promiseWithComposition:(id)a3;
+ (MTPromise)promiseWithError:(id)a3;
+ (MTPromise)promiseWithResult:(id)a3;
+ (id)_findUnfinishedPromise:(id)a3;
+ (id)_globalPromiseStorage;
+ (id)_globalPromiseStorageAccessQueue;
+ (id)_resultOfComposition:(id)a3 errors:(id)a4;
+ (void)_configureAllPromise:(id)a3 withResults:(id)a4 promises:(id)a5 currentPromiseIndex:(unint64_t)a6;
+ (void)_configureAnyPromise:(id)a3 withPromises:(id)a4 currentPromiseIndex:(unint64_t)a5;
+ (void)_finishPromise:(id)a3 withPromise:(id)a4;
+ (void)_setupCompositePromise:(id)a3 composition:(id)a4;
+ (void)cancelPromisesInComposition:(id)a3;
- (BOOL)_isFinished;
- (BOOL)cancel;
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithResult:(id)a3;
- (BOOL)finishWithResult:(id)a3 error:(id)a4;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (MTPromise)init;
- (MTPromiseCompletionBlocks)completionBlocks;
- (MTPromiseResult)promiseResult;
- (NSConditionLock)stateLock;
- (id)BOOLCompletionHandlerAdapter;
- (id)catchWithBlock:(id)a3;
- (id)completionHandlerAdapter;
- (id)errorOnlyCompletionHandlerAdapter;
- (id)nilValueCompletionHandlerAdapter;
- (id)resultBeforeDate:(id)a3 error:(id *)a4;
- (id)resultWithError:(id *)a3;
- (id)resultWithTimeout:(double)a3 error:(id *)a4;
- (id)thenWithBlock:(id)a3;
- (void)_addBlock:(id)a3 orCallWithResult:(id)a4;
- (void)addErrorBlock:(id)a3;
- (void)addFinishBlock:(id)a3;
- (void)addSuccessBlock:(id)a3;
- (void)setCompletionBlocks:(id)a3;
- (void)setPromiseResult:(id)a3;
- (void)setStateLock:(id)a3;
- (void)waitUntilFinished;
- (void)waitUntilFinishedWithTimeout:(double)a3;
@end

@implementation MTPromise

- (MTPromise)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTPromise;
  v2 = [(MTPromise *)&v11 init];
  if (v2)
  {
    v3 = objc_alloc_init(MTPromiseCompletionBlocks);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v3;

    v5 = (NSConditionLock *)[objc_alloc((Class)NSConditionLock) initWithCondition:0];
    stateLock = v2->_stateLock;
    v2->_stateLock = v5;

    v7 = +[MTPromise _globalPromiseStorageAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005F08;
    block[3] = &unk_100020560;
    v10 = v2;
    dispatch_sync(v7, block);
  }
  return v2;
}

+ (MTPromise)promiseWithError:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 finishWithError:v3];

  return (MTPromise *)v4;
}

+ (MTPromise)promiseWithResult:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 finishWithResult:v3];

  return (MTPromise *)v4;
}

+ (MTPromise)promiseWithAll:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = objc_alloc_init((Class)NSMutableArray);
  [(id)objc_opt_class() _configureAllPromise:v4 withResults:v5 promises:v3 currentPromiseIndex:0];

  return (MTPromise *)v4;
}

+ (MTPromise)promiseWithAny:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(id)objc_opt_class() _configureAnyPromise:v4 withPromises:v3 currentPromiseIndex:0];

  return (MTPromise *)v4;
}

- (BOOL)isCancelled
{
  id v3 = [(MTPromise *)self stateLock];
  [v3 lock];

  if ([(MTPromise *)self _isFinished])
  {
    id v4 = objc_opt_class();
    id v5 = [(MTPromise *)self promiseResult];
    v6 = [v5 error];
    unsigned __int8 v7 = [v4 _errorIsCanceledError:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  v8 = [(MTPromise *)self stateLock];
  [v8 unlock];

  return v7;
}

- (BOOL)isFinished
{
  id v3 = [(MTPromise *)self stateLock];
  [v3 lock];

  LOBYTE(v3) = [(MTPromise *)self _isFinished];
  id v4 = [(MTPromise *)self stateLock];
  [v4 unlock];

  return (char)v3;
}

- (void)addErrorBlock:(id)a3
{
  id v4 = a3;
  [(MTPromise *)self completionBlocks];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000633C;
  v10[3] = &unk_1000205E0;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006348;
  v7[3] = &unk_100020608;
  id v8 = v11;
  id v9 = v12;
  id v5 = v12;
  id v6 = v11;
  [(MTPromise *)self _addBlock:v10 orCallWithResult:v7];
}

- (void)addFinishBlock:(id)a3
{
  id v4 = a3;
  [(MTPromise *)self completionBlocks];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006484;
  v10[3] = &unk_1000205E0;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006490;
  v7[3] = &unk_100020608;
  id v8 = v11;
  id v9 = v12;
  id v5 = v12;
  id v6 = v11;
  [(MTPromise *)self _addBlock:v10 orCallWithResult:v7];
}

- (void)addSuccessBlock:(id)a3
{
  id v4 = a3;
  [(MTPromise *)self completionBlocks];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000065CC;
  v10[3] = &unk_1000205E0;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000065D8;
  v7[3] = &unk_100020608;
  id v8 = v11;
  id v9 = v12;
  id v5 = v12;
  id v6 = v11;
  [(MTPromise *)self _addBlock:v10 orCallWithResult:v7];
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(MTPromise *)self stateLock];
  unsigned __int8 v8 = [v7 lockWhenCondition:1 beforeDate:v6];

  if (v8)
  {
    v15 = [(MTPromise *)self promiseResult];
    v16 = [(MTPromise *)self stateLock];
    [v16 unlock];

    v17 = [v15 result];

    if (a4 && !v17)
    {
      *a4 = [v15 error];
    }
    v18 = [v15 result];
  }
  else if (a4)
  {
    MTError(400, 0, v9, v10, v11, v12, v13, v14, 0);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)resultWithError:(id *)a3
{
  id v5 = +[NSDate distantFuture];
  id v6 = [(MTPromise *)self resultBeforeDate:v5 error:a3];

  return v6;
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:a3];
  unsigned __int8 v7 = [(MTPromise *)self resultBeforeDate:v6 error:a4];

  return v7;
}

- (void)waitUntilFinished
{
  id v2 = [(MTPromise *)self resultWithError:0];
}

- (void)waitUntilFinishedWithTimeout:(double)a3
{
  id v3 = [(MTPromise *)self resultWithTimeout:0 error:a3];
}

- (id)catchWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MTPromise);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000695C;
  v11[3] = &unk_100020630;
  objc_copyWeak(&v14, &location);
  id v6 = v4;
  id v13 = v6;
  unsigned __int8 v7 = v5;
  uint64_t v12 = v7;
  [(MTPromise *)self addFinishBlock:v11];
  unsigned __int8 v8 = v12;
  uint64_t v9 = v7;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

- (id)thenWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MTPromise);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006B44;
  v11[3] = &unk_100020630;
  objc_copyWeak(&v14, &location);
  id v6 = v4;
  id v13 = v6;
  unsigned __int8 v7 = v5;
  uint64_t v12 = v7;
  [(MTPromise *)self addFinishBlock:v11];
  unsigned __int8 v8 = v12;
  uint64_t v9 = v7;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

- (BOOL)cancel
{
  id v3 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:0];
  LOBYTE(self) = [(MTPromise *)self finishWithResult:0 error:v3];

  return (char)self;
}

- (BOOL)finishWithError:(id)a3
{
  return [(MTPromise *)self finishWithResult:0 error:a3];
}

- (BOOL)finishWithResult:(id)a3
{
  return [(MTPromise *)self finishWithResult:a3 error:0];
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  unsigned __int8 v8 = (void *)v7;
  if (v6 && v7)
  {
    uint64_t v9 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      unint64_t v28 = v6;
      __int16 v29 = 2112;
      v30 = v8;
      uint64_t v10 = "MetricsKit: Someone is finishing a promise with both a result and an error. This will result in both the suc"
            "cess and error blocks being called. result = %@ error = %@";
      uint64_t v11 = v9;
      uint32_t v12 = 22;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);
    }
  }
  else
  {
    if (v6 | v7) {
      goto LABEL_10;
    }
    uint64_t v9 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = "MetricsKit: Someone is finishing a promise with neither a result nor an error. This will result in neither t"
            "he success nor the error blocks being called.";
      uint64_t v11 = v9;
      uint32_t v12 = 2;
      goto LABEL_8;
    }
  }

LABEL_10:
  id v13 = [(MTPromise *)self stateLock];
  [v13 lock];

  id v14 = [(MTPromise *)self stateLock];
  id v15 = [v14 condition];

  if (v15 == (id)1)
  {
    v20 = objc_opt_class();
    v21 = [(MTPromise *)self promiseResult];
    v22 = [v21 error];
    if ([v20 _errorIsCanceledError:v22])
    {
    }
    else
    {
      unsigned __int8 v23 = [(id)objc_opt_class() _errorIsCanceledError:v8];

      if (v23) {
        goto LABEL_16;
      }
      v21 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "MetricsKit: Someone is attempting to finish a finished MTPromise.", buf, 2u);
      }
    }

LABEL_16:
    v16 = [(MTPromise *)self stateLock];
    [(MTPromiseResult *)v16 unlock];
    goto LABEL_17;
  }
  v16 = [[MTPromiseResult alloc] initWithResult:v6 error:v8];
  [(MTPromise *)self setPromiseResult:v16];
  v17 = [(MTPromise *)self stateLock];
  [v17 unlockWithCondition:1];

  v18 = [(MTPromise *)self completionBlocks];
  [v18 flushCompletionBlocksWithPromiseResult:v16];

  objc_initWeak((id *)buf, self);
  v19 = +[MTPromise _globalPromiseStorageAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006FCC;
  block[3] = &unk_100020658;
  objc_copyWeak(&v26, (id *)buf);
  dispatch_async(v19, block);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
LABEL_17:

  return v15 != (id)1;
}

- (id)BOOLCompletionHandlerAdapter
{
  objc_initWeak(&location, self);
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  unint64_t v7 = sub_100007114;
  unsigned __int8 v8 = &unk_100020680;
  objc_copyWeak(&v9, &location);
  id v2 = objc_retainBlock(&v5);
  id v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

- (id)completionHandlerAdapter
{
  objc_initWeak(&location, self);
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  unint64_t v7 = sub_100007294;
  unsigned __int8 v8 = &unk_1000206A8;
  objc_copyWeak(&v9, &location);
  id v2 = objc_retainBlock(&v5);
  id v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

- (id)errorOnlyCompletionHandlerAdapter
{
  objc_initWeak(&location, self);
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  unint64_t v7 = sub_1000073F0;
  unsigned __int8 v8 = &unk_1000206D0;
  objc_copyWeak(&v9, &location);
  id v2 = objc_retainBlock(&v5);
  id v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

- (id)nilValueCompletionHandlerAdapter
{
  objc_initWeak(&location, self);
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  unint64_t v7 = sub_100007550;
  unsigned __int8 v8 = &unk_1000206A8;
  objc_copyWeak(&v9, &location);
  id v2 = objc_retainBlock(&v5);
  id v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

- (void)_addBlock:(id)a3 orCallWithResult:(id)a4
{
  uint64_t v11 = (void (**)(void))a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  unint64_t v7 = [(MTPromise *)self stateLock];
  [v7 lock];

  unsigned __int8 v8 = [(MTPromise *)self promiseResult];
  if (v8)
  {
    id v9 = [(MTPromise *)self stateLock];
    [v9 unlock];

    v6[2](v6, v8);
  }
  else
  {
    v11[2]();
    uint64_t v10 = [(MTPromise *)self stateLock];
    [v10 unlock];
  }
}

+ (void)_configureAllPromise:(id)a3 withResults:(id)a4 promises:(id)a5 currentPromiseIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 objectAtIndexedSubscript:a6];
  objc_initWeak(&location, a1);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000078C8;
  v23[3] = &unk_1000206F8;
  objc_copyWeak(v27, &location);
  id v14 = v11;
  id v24 = v14;
  v27[1] = (id)a6;
  id v15 = v12;
  id v25 = v15;
  id v16 = v10;
  id v26 = v16;
  [v13 addSuccessBlock:v23];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100007978;
  v19[3] = &unk_100020720;
  unint64_t v22 = a6;
  id v17 = v15;
  id v20 = v17;
  id v18 = v16;
  id v21 = v18;
  [v13 addErrorBlock:v19];

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
}

+ (void)_configureAnyPromise:(id)a3 withPromises:(id)a4 currentPromiseIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 objectAtIndexedSubscript:a5];
  objc_initWeak(&location, a1);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100007BC0;
  v19[3] = &unk_100020748;
  unint64_t v22 = a5;
  id v11 = v9;
  id v20 = v11;
  id v12 = v8;
  id v21 = v12;
  [v10 addSuccessBlock:v19];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007C54;
  v15[3] = &unk_100020770;
  objc_copyWeak(v18, &location);
  v18[1] = (id)a5;
  id v13 = v11;
  id v16 = v13;
  id v14 = v12;
  id v17 = v14;
  [v10 addErrorBlock:v15];

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

+ (BOOL)_errorIsCanceledError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:NSCocoaErrorDomain]) {
    BOOL v5 = [v3 code] == (id)3072;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (void)_finishPromise:(id)a3 withPromise:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007E60;
  v10[3] = &unk_100020798;
  id v5 = a3;
  id v11 = v5;
  id v6 = a4;
  [v6 addSuccessBlock:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007E6C;
  v8[3] = &unk_1000207C0;
  id v9 = v5;
  id v7 = v5;
  [v6 addErrorBlock:v8];
}

+ (id)_globalPromiseStorage
{
  if (qword_1000284D0 != -1) {
    dispatch_once(&qword_1000284D0, &stru_1000207E0);
  }
  id v2 = (void *)qword_1000284C8;

  return v2;
}

+ (id)_globalPromiseStorageAccessQueue
{
  if (qword_1000284E0 != -1) {
    dispatch_once(&qword_1000284E0, &stru_100020800);
  }
  id v2 = (void *)qword_1000284D8;

  return v2;
}

- (BOOL)_isFinished
{
  id v2 = [(MTPromise *)self stateLock];
  BOOL v3 = [v2 condition] == (id)1;

  return v3;
}

- (MTPromiseCompletionBlocks)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
{
}

- (MTPromiseResult)promiseResult
{
  return self->_promiseResult;
}

- (void)setPromiseResult:(id)a3
{
}

- (NSConditionLock)stateLock
{
  return self->_stateLock;
}

- (void)setStateLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_promiseResult, 0);

  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

+ (id)_resultOfComposition:(id)a3 errors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v6 promiseResult];
    uint64_t v9 = [v8 error];
    id v10 = (void *)v9;
    if (v7 && v9) {
      [v7 addObject:v9];
    }
    id v11 = [v8 result];
    id v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = +[NSNull null];
    }
    id v21 = v13;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v15 = v6;
      id v16 = [v15 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v38;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v38 != v18) {
              objc_enumerationMutation(v15);
            }
            id v20 = [a1 _resultOfComposition:*(void *)(*((void *)&v37 + 1) + 8 * i) errors:v7];
            [v14 addObject:v20];
          }
          id v17 = [v15 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v17);
      }

      id v21 = [v14 copy];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v22 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v32 = v6;
        id v23 = v6;
        id v24 = [v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v34;
          do
          {
            for (j = 0; j != v25; j = (char *)j + 1)
            {
              if (*(void *)v34 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void *)(*((void *)&v33 + 1) + 8 * (void)j);
              __int16 v29 = [v23 objectForKeyedSubscript:v28];
              v30 = [a1 _resultOfComposition:v29 errors:v7];
              [v22 setObject:v30 forKeyedSubscript:v28];
            }
            id v25 = [v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v25);
        }

        id v21 = [v22 copy];
        id v6 = v32;
      }
      else
      {
        id v21 = v6;
      }
    }
  }

  return v21;
}

+ (id)_findUnfinishedPromise:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isFinished]) {
      id v5 = 0;
    }
    else {
      id v5 = v4;
    }
    id v6 = v5;
    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [a1 _findUnfinishedPromise:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          if (v12)
          {
            id v6 = (id)v12;
            goto LABEL_28;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v4;
    id v13 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      while (2)
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v7);
          }
          id v17 = objc_msgSend(v7, "objectForKeyedSubscript:", *(void *)(*((void *)&v19 + 1) + 8 * (void)j), (void)v19);
          id v6 = [a1 _findUnfinishedPromise:v17];

          if (v6)
          {
LABEL_28:

            goto LABEL_29;
          }
        }
        id v14 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    goto LABEL_25;
  }
LABEL_26:
  id v6 = 0;
LABEL_29:

  return v6;
}

+ (void)_setupCompositePromise:(id)a3 composition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _findUnfinishedPromise:v7];
  if (v8)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000BA04;
    v10[3] = &unk_100020A50;
    id v13 = a1;
    id v11 = v6;
    id v12 = v7;
    [v8 addFinishBlock:v10];
  }
  else
  {
    id v9 = [a1 _resultOfComposition:v7 errors:0];
    [v6 finishWithResult:v9];
  }
}

+ (MTPromise)promiseWithComposition:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)objc_opt_class());
  [a1 _setupCompositePromise:v5 composition:v4];

  return (MTPromise *)v5;
}

+ (void)cancelPromisesInComposition:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v4 = v3;
      id v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v19;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v19 != v7) {
              objc_enumerationMutation(v4);
            }
            id v9 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * i)];
            +[MTPromise cancelPromisesInComposition:v9];
          }
          id v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v6);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_21;
      }
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v4 = v3;
      id v10 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v15;
        do
        {
          for (j = 0; j != v11; j = (char *)j + 1)
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v4);
            }
            +[MTPromise cancelPromisesInComposition:](MTPromise, "cancelPromisesInComposition:", *(void *)(*((void *)&v14 + 1) + 8 * (void)j), (void)v14);
          }
          id v11 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
        }
        while (v11);
      }
    }

    goto LABEL_21;
  }
  [v3 cancel];
LABEL_21:
}

@end