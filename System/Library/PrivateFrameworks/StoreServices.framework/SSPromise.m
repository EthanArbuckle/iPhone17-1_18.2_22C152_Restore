@interface SSPromise
+ (BOOL)_errorIsCanceledError:(id)a3;
+ (SSPromise)promiseWithAll:(id)a3;
+ (SSPromise)promiseWithAny:(id)a3;
+ (SSPromise)promiseWithError:(id)a3;
+ (SSPromise)promiseWithResult:(id)a3;
+ (id)_globalPromiseStorage;
+ (id)_globalPromiseStorageAccessQueue;
+ (void)_configureAllPromise:(id)a3 withResults:(id)a4 promises:(id)a5 currentPromiseIndex:(unint64_t)a6;
+ (void)_configureAnyPromise:(id)a3 withPomises:(id)a4 currentPromiseIndex:(unint64_t)a5;
+ (void)_finishPromise:(id)a3 withPromise:(id)a4;
- (BOOL)_isFinished;
- (BOOL)cancel;
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithResult:(id)a3;
- (BOOL)finishWithResult:(id)a3 error:(id)a4;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (NSConditionLock)stateLock;
- (SSPromise)init;
- (SSPromiseCompletionBlocks)completionBlocks;
- (SSPromiseResult)promiseResult;
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

@implementation SSPromise

- (id)thenWithBlock:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __27__SSPromise_thenWithBlock___block_invoke;
  v11[3] = &unk_1E5BAD240;
  objc_copyWeak(&v14, &location);
  id v6 = v4;
  id v13 = v6;
  v7 = v5;
  v12 = v7;
  [(SSPromise *)self addFinishBlock:v11];
  v8 = v12;
  v9 = v7;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

- (SSPromise)init
{
  v11.receiver = self;
  v11.super_class = (Class)SSPromise;
  v2 = [(SSPromise *)&v11 init];
  if (v2)
  {
    v3 = objc_alloc_init(SSPromiseCompletionBlocks);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    stateLock = v2->_stateLock;
    v2->_stateLock = (NSConditionLock *)v5;

    v7 = +[SSPromise _globalPromiseStorageAccessQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __17__SSPromise_init__block_invoke;
    block[3] = &unk_1E5BA7040;
    v10 = v2;
    dispatch_sync(v7, block);
  }
  return v2;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  v8 = (void *)v7;
  if (!v6 || !v7)
  {
    if (v6 | v7) {
      goto LABEL_26;
    }
    v9 = SSPromiseLogConfig();
    if (!v9)
    {
      v9 = +[SSLogConfig sharedConfig];
    }
    int v22 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      v23 &= 2u;
    }
    if (v23)
    {
      *(_DWORD *)id location = 138543362;
      *(void *)&location[4] = objc_opt_class();
      id v24 = *(id *)&location[4];
      LODWORD(v47) = 12;
      v46 = location;
      id v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14) {
        goto LABEL_25;
      }
      goto LABEL_12;
    }
LABEL_24:

    goto LABEL_25;
  }
  v9 = SSPromiseLogConfig();
  if (!v9)
  {
    v9 = +[SSLogConfig sharedConfig];
  }
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    v11 &= 2u;
  }
  if (!v11) {
    goto LABEL_24;
  }
  *(_DWORD *)id location = 138543874;
  *(void *)&location[4] = objc_opt_class();
  __int16 v51 = 2114;
  unint64_t v52 = v6;
  __int16 v53 = 2114;
  v54 = v8;
  id v13 = *(id *)&location[4];
  LODWORD(v47) = 32;
  v46 = location;
  id v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
LABEL_12:
    v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, location, v47);
    free(v14);
    SSFileLog(v9, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
  }
LABEL_25:

LABEL_26:
  v25 = [(SSPromise *)self stateLock];
  [v25 lock];

  v26 = [(SSPromise *)self stateLock];
  uint64_t v27 = [v26 condition];

  if (v27 == 1)
  {
    v32 = SSPromiseLogConfig();
    if (!v32)
    {
      v32 = +[SSLogConfig sharedConfig];
    }
    int v33 = [v32 shouldLog];
    if ([v32 shouldLogToDisk]) {
      int v34 = v33 | 2;
    }
    else {
      int v34 = v33;
    }
    v35 = [v32 OSLogObject];
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      v34 &= 2u;
    }
    if (v34)
    {
      v36 = objc_opt_class();
      *(_DWORD *)id location = 138543362;
      *(void *)&location[4] = v36;
      id v37 = v36;
      LODWORD(v47) = 12;
      v38 = (void *)_os_log_send_and_compose_impl();

      if (!v38)
      {
LABEL_39:

        v28 = [(SSPromise *)self stateLock];
        [(SSPromiseResult *)v28 unlock];
        goto LABEL_40;
      }
      v35 = objc_msgSend(NSString, "stringWithCString:encoding:", v38, 4, location, v47);
      free(v38);
      SSFileLog(v32, @"%@", v39, v40, v41, v42, v43, v44, (uint64_t)v35);
    }

    goto LABEL_39;
  }
  v28 = [[SSPromiseResult alloc] initWithResult:v6 error:v8];
  [(SSPromise *)self setPromiseResult:v28];
  v29 = [(SSPromise *)self stateLock];
  [v29 unlockWithCondition:1];

  v30 = [(SSPromise *)self completionBlocks];
  [v30 flushCompletionBlocksWithPromiseResult:v28];

  objc_initWeak((id *)location, self);
  v31 = +[SSPromise _globalPromiseStorageAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SSPromise_finishWithResult_error___block_invoke;
  block[3] = &unk_1E5BA8810;
  objc_copyWeak(&v49, (id *)location);
  dispatch_async(v31, block);

  objc_destroyWeak(&v49);
  objc_destroyWeak((id *)location);
LABEL_40:

  return v27 != 1;
}

- (NSConditionLock)stateLock
{
  return self->_stateLock;
}

- (SSPromiseCompletionBlocks)completionBlocks
{
  return self->_completionBlocks;
}

+ (id)_globalPromiseStorageAccessQueue
{
  if (_globalPromiseStorageAccessQueue_onceToken_0 != -1) {
    dispatch_once(&_globalPromiseStorageAccessQueue_onceToken_0, &__block_literal_global_25);
  }
  v2 = (void *)_globalPromiseStorageAccessQueue_sGlobalPromiseStorageQueue_0;
  return v2;
}

- (void)_addBlock:(id)a3 orCallWithResult:(id)a4
{
  int v11 = (void (**)(void))a3;
  unint64_t v6 = (void (**)(id, void *))a4;
  unint64_t v7 = [(SSPromise *)self stateLock];
  [v7 lock];

  v8 = [(SSPromise *)self promiseResult];
  if (v8)
  {
    v9 = [(SSPromise *)self stateLock];
    [v9 unlock];

    v6[2](v6, v8);
  }
  else
  {
    v11[2]();
    int v10 = [(SSPromise *)self stateLock];
    [v10 unlock];
  }
}

- (SSPromiseResult)promiseResult
{
  return self->_promiseResult;
}

- (void)setPromiseResult:(id)a3
{
}

- (void)addFinishBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SSPromise *)self completionBlocks];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __28__SSPromise_addFinishBlock___block_invoke;
  v11[3] = &unk_1E5BA7350;
  id v12 = v5;
  id v13 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__SSPromise_addFinishBlock___block_invoke_2;
  v8[3] = &unk_1E5BAD218;
  id v9 = v12;
  id v10 = v13;
  id v6 = v13;
  id v7 = v12;
  [(SSPromise *)self _addBlock:v11 orCallWithResult:v8];
}

+ (void)_finishPromise:(id)a3 withPromise:(id)a4
{
  id v5 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__SSPromise__finishPromise_withPromise___block_invoke;
  v11[3] = &unk_1E5BAD308;
  id v6 = v5;
  id v12 = v6;
  id v7 = a4;
  [v7 addSuccessBlock:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__SSPromise__finishPromise_withPromise___block_invoke_2;
  v9[3] = &unk_1E5BA8720;
  id v10 = v6;
  id v8 = v6;
  [v7 addErrorBlock:v9];
}

- (void)addSuccessBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SSPromise *)self completionBlocks];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __29__SSPromise_addSuccessBlock___block_invoke;
  v11[3] = &unk_1E5BA7350;
  id v12 = v5;
  id v13 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__SSPromise_addSuccessBlock___block_invoke_2;
  v8[3] = &unk_1E5BAD218;
  id v9 = v12;
  id v10 = v13;
  id v6 = v13;
  id v7 = v12;
  [(SSPromise *)self _addBlock:v11 orCallWithResult:v8];
}

- (void)addErrorBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SSPromise *)self completionBlocks];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __27__SSPromise_addErrorBlock___block_invoke;
  v11[3] = &unk_1E5BA7350;
  id v12 = v5;
  id v13 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __27__SSPromise_addErrorBlock___block_invoke_2;
  v8[3] = &unk_1E5BAD218;
  id v9 = v12;
  id v10 = v13;
  id v6 = v13;
  id v7 = v12;
  [(SSPromise *)self _addBlock:v11 orCallWithResult:v8];
}

- (BOOL)finishWithResult:(id)a3
{
  return [(SSPromise *)self finishWithResult:a3 error:0];
}

void __27__SSPromise_thenWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v8) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
  id v7 = +[SSPromise promiseWithError:v5];
  }
  [(id)objc_opt_class() _finishPromise:*(void *)(a1 + 32) withPromise:v7];
}

uint64_t __29__SSPromise_addSuccessBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addSuccessBlock:*(void *)(a1 + 40)];
}

uint64_t __28__SSPromise_addFinishBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addCompletionBlock:*(void *)(a1 + 40)];
}

uint64_t __40__SSPromise__finishPromise_withPromise___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

+ (SSPromise)promiseWithResult:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 finishWithResult:v3];

  return (SSPromise *)v4;
}

uint64_t __29__SSPromise_addSuccessBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callSuccessBlock:*(void *)(a1 + 40) withPromiseResult:a2];
}

uint64_t __27__SSPromise_addErrorBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callErrorBlock:*(void *)(a1 + 40) withPromiseResult:a2];
}

uint64_t __27__SSPromise_addErrorBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addErrorBlock:*(void *)(a1 + 40)];
}

uint64_t __28__SSPromise_addFinishBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callCompletionBlock:*(void *)(a1 + 40) withPromiseResult:a2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_promiseResult, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

- (id)resultWithError:(id *)a3
{
  id v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v6 = [(SSPromise *)self resultBeforeDate:v5 error:a3];

  return v6;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SSPromise *)self stateLock];
  char v8 = [v7 lockWhenCondition:1 beforeDate:v6];

  if (v8)
  {
    id v9 = [(SSPromise *)self promiseResult];
    id v10 = [(SSPromise *)self stateLock];
    [v10 unlock];

    int v11 = [v9 result];

    if (a4 && !v11)
    {
      *a4 = [v9 error];
    }
    id v12 = [v9 result];
  }
  else if (a4)
  {
    SSError(@"SSErrorDomain", 149, 0, 0);
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

- (id)completionHandlerAdapter
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __37__SSPromise_completionHandlerAdapter__block_invoke;
  char v8 = &unk_1E5BA8838;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x1A6268200](&v5);
  id v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __17__SSPromise_init__block_invoke(uint64_t a1)
{
  id v2 = +[SSPromise _globalPromiseStorage];
  [v2 addObject:*(void *)(a1 + 32)];
}

void __36__SSPromise_finishWithResult_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[SSPromise _globalPromiseStorage];
  [v1 removeObject:WeakRetained];
}

+ (id)_globalPromiseStorage
{
  if (_globalPromiseStorage_onceToken_0 != -1) {
    dispatch_once(&_globalPromiseStorage_onceToken_0, &__block_literal_global_22_0);
  }
  id v2 = (void *)_globalPromiseStorage_sGlobalPromiseStorage_0;
  return v2;
}

void __34__SSPromise__globalPromiseStorage__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)_globalPromiseStorage_sGlobalPromiseStorage_0;
  _globalPromiseStorage_sGlobalPromiseStorage_0 = (uint64_t)v0;
}

void __45__SSPromise__globalPromiseStorageAccessQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.StoreServices.SSPromise.globalPromiseStorageAccessQueue", 0);
  v1 = (void *)_globalPromiseStorageAccessQueue_sGlobalPromiseStorageQueue_0;
  _globalPromiseStorageAccessQueue_sGlobalPromiseStorageQueue_0 = (uint64_t)v0;
}

void __37__SSPromise_completionHandlerAdapter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained finishWithResult:v6 error:v5];
}

+ (SSPromise)promiseWithError:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 finishWithError:v3];

  return (SSPromise *)v4;
}

+ (SSPromise)promiseWithAll:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(id)objc_opt_class() _configureAllPromise:v4 withResults:v5 promises:v3 currentPromiseIndex:0];

  return (SSPromise *)v4;
}

+ (SSPromise)promiseWithAny:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(id)objc_opt_class() _configureAnyPromise:v4 withPomises:v3 currentPromiseIndex:0];

  return (SSPromise *)v4;
}

- (BOOL)isCancelled
{
  id v3 = [(SSPromise *)self stateLock];
  [v3 lock];

  if ([(SSPromise *)self _isFinished])
  {
    id v4 = objc_opt_class();
    id v5 = [(SSPromise *)self promiseResult];
    id v6 = [v5 error];
    char v7 = [v4 _errorIsCanceledError:v6];
  }
  else
  {
    char v7 = 0;
  }
  char v8 = [(SSPromise *)self stateLock];
  [v8 unlock];

  return v7;
}

- (BOOL)isFinished
{
  id v3 = [(SSPromise *)self stateLock];
  [v3 lock];

  LOBYTE(v3) = [(SSPromise *)self _isFinished];
  id v4 = [(SSPromise *)self stateLock];
  [v4 unlock];

  return (char)v3;
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
  char v7 = [(SSPromise *)self resultBeforeDate:v6 error:a4];

  return v7;
}

- (void)waitUntilFinished
{
  id v2 = [(SSPromise *)self resultWithError:0];
}

- (void)waitUntilFinishedWithTimeout:(double)a3
{
  id v3 = [(SSPromise *)self resultWithTimeout:0 error:a3];
}

- (id)catchWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(SSPromise);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __28__SSPromise_catchWithBlock___block_invoke;
  v11[3] = &unk_1E5BAD240;
  objc_copyWeak(&v14, &location);
  id v6 = v4;
  id v13 = v6;
  char v7 = v5;
  id v12 = v7;
  [(SSPromise *)self addFinishBlock:v11];
  char v8 = v12;
  id v9 = v7;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __28__SSPromise_catchWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
  char v7 = +[SSPromise promiseWithResult:v8];
  }
  [(id)objc_opt_class() _finishPromise:*(void *)(a1 + 32) withPromise:v7];
}

- (BOOL)cancel
{
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
  LOBYTE(self) = [(SSPromise *)self finishWithResult:0 error:v3];

  return (char)self;
}

- (BOOL)finishWithError:(id)a3
{
  return [(SSPromise *)self finishWithResult:0 error:a3];
}

- (id)BOOLCompletionHandlerAdapter
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  char v7 = __41__SSPromise_BOOLCompletionHandlerAdapter__block_invoke;
  id v8 = &unk_1E5BA9FB8;
  objc_copyWeak(&v9, &location);
  id v2 = (void *)MEMORY[0x1A6268200](&v5);
  id v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __41__SSPromise_BOOLCompletionHandlerAdapter__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (a2)
  {
    char v7 = [NSNumber numberWithBool:1];
    [v6 finishWithResult:v7 error:v8];
  }
  else
  {
    [WeakRetained finishWithResult:0 error:v8];
  }
}

- (id)errorOnlyCompletionHandlerAdapter
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  char v7 = __46__SSPromise_errorOnlyCompletionHandlerAdapter__block_invoke;
  id v8 = &unk_1E5BA93F0;
  objc_copyWeak(&v9, &location);
  id v2 = (void *)MEMORY[0x1A6268200](&v5);
  id v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __46__SSPromise_errorOnlyCompletionHandlerAdapter__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (v5) {
    [WeakRetained finishWithError:v5];
  }
  else {
    [WeakRetained finishWithResult:MEMORY[0x1E4F1CC38]];
  }
}

- (id)nilValueCompletionHandlerAdapter
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  char v7 = __45__SSPromise_nilValueCompletionHandlerAdapter__block_invoke;
  id v8 = &unk_1E5BA8838;
  objc_copyWeak(&v9, &location);
  id v2 = (void *)MEMORY[0x1A6268200](&v5);
  id v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __45__SSPromise_nilValueCompletionHandlerAdapter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v9 = a2;
  unint64_t v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v7 = WeakRetained;
  if (v9 | v5)
  {
    if (v9) {
      objc_msgSend(WeakRetained, "finishWithResult:");
    }
    else {
      [WeakRetained finishWithError:v5];
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
    [v7 finishWithResult:v8];
  }
}

+ (void)_configureAllPromise:(id)a3 withResults:(id)a4 promises:(id)a5 currentPromiseIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 objectAtIndexedSubscript:a6];
  objc_initWeak(&location, a1);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__SSPromise__configureAllPromise_withResults_promises_currentPromiseIndex___block_invoke;
  v23[3] = &unk_1E5BAD268;
  objc_copyWeak(v27, &location);
  id v14 = v11;
  id v24 = v14;
  v27[1] = (id)a6;
  id v15 = v12;
  id v25 = v15;
  id v16 = v10;
  id v26 = v16;
  [v13 addSuccessBlock:v23];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__SSPromise__configureAllPromise_withResults_promises_currentPromiseIndex___block_invoke_2;
  v19[3] = &unk_1E5BAD290;
  unint64_t v22 = a6;
  id v17 = v15;
  id v20 = v17;
  id v18 = v16;
  id v21 = v18;
  [v13 addErrorBlock:v19];

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
}

void __75__SSPromise__configureAllPromise_withResults_promises_currentPromiseIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [*(id *)(a1 + 32) addObject:v4];

  uint64_t v5 = *(void *)(a1 + 64);
  if (v5 == [*(id *)(a1 + 40) count] - 1) {
    [*(id *)(a1 + 48) finishWithResult:*(void *)(a1 + 32)];
  }
  else {
    [WeakRetained _configureAllPromise:*(void *)(a1 + 48) withResults:*(void *)(a1 + 32) promises:*(void *)(a1 + 40) currentPromiseIndex:*(void *)(a1 + 64) + 1];
  }
}

void __75__SSPromise__configureAllPromise_withResults_promises_currentPromiseIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  for (unint64_t i = *(void *)(a1 + 48) + 1; i < [*(id *)(a1 + 32) count]; ++i)
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
    [v4 cancel];
  }
  [*(id *)(a1 + 40) finishWithError:v5];
}

+ (void)_configureAnyPromise:(id)a3 withPomises:(id)a4 currentPromiseIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 objectAtIndexedSubscript:a5];
  objc_initWeak(&location, a1);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__SSPromise__configureAnyPromise_withPomises_currentPromiseIndex___block_invoke;
  v19[3] = &unk_1E5BAD2B8;
  unint64_t v22 = a5;
  id v11 = v9;
  id v20 = v11;
  id v12 = v8;
  id v21 = v12;
  [v10 addSuccessBlock:v19];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__SSPromise__configureAnyPromise_withPomises_currentPromiseIndex___block_invoke_2;
  v15[3] = &unk_1E5BAD2E0;
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

void __66__SSPromise__configureAnyPromise_withPomises_currentPromiseIndex___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  for (unint64_t i = *(void *)(a1 + 48) + 1; i < [*(id *)(a1 + 32) count]; ++i)
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
    [v4 cancel];
  }
  [*(id *)(a1 + 40) finishWithResult:v5];
}

void __66__SSPromise__configureAnyPromise_withPomises_currentPromiseIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4 == [*(id *)(a1 + 32) count] - 1) {
    [*(id *)(a1 + 40) finishWithError:v5];
  }
  else {
    [WeakRetained _configureAnyPromise:*(void *)(a1 + 40) withPomises:*(void *)(a1 + 32) currentPromiseIndex:*(void *)(a1 + 56) + 1];
  }
}

+ (BOOL)_errorIsCanceledError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]]) {
    BOOL v5 = [v3 code] == 3072;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __40__SSPromise__finishPromise_withPromise___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (BOOL)_isFinished
{
  id v2 = [(SSPromise *)self stateLock];
  BOOL v3 = [v2 condition] == 1;

  return v3;
}

- (void)setCompletionBlocks:(id)a3
{
}

- (void)setStateLock:(id)a3
{
}

@end