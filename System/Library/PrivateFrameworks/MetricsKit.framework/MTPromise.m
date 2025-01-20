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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_promiseResult, 0);

  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

void __27__MTPromise_thenWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v8) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
  v7 = +[MTPromise promiseWithError:v5];
  }
  [(id)objc_opt_class() _finishPromise:*(void *)(a1 + 32) withPromise:v7];
}

+ (void)_finishPromise:(id)a3 withPromise:(id)a4
{
  id v5 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__MTPromise__finishPromise_withPromise___block_invoke;
  v11[3] = &unk_264311090;
  id v6 = v5;
  id v12 = v6;
  id v7 = a4;
  [v7 addSuccessBlock:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__MTPromise__finishPromise_withPromise___block_invoke_2;
  v9[3] = &unk_2643102E0;
  id v10 = v6;
  id v8 = v6;
  [v7 addErrorBlock:v9];
}

+ (void)_configureAllPromise:(id)a3 withResults:(id)a4 promises:(id)a5 currentPromiseIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v12 objectAtIndexedSubscript:a6];
  objc_initWeak(&location, a1);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __75__MTPromise__configureAllPromise_withResults_promises_currentPromiseIndex___block_invoke;
  v23[3] = &unk_264310FF0;
  objc_copyWeak(v27, &location);
  id v14 = v11;
  id v24 = v14;
  v27[1] = (id)a6;
  id v15 = v12;
  id v25 = v15;
  id v16 = v10;
  id v26 = v16;
  [v13 addSuccessBlock:v23];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75__MTPromise__configureAllPromise_withResults_promises_currentPromiseIndex___block_invoke_2;
  v19[3] = &unk_264311018;
  unint64_t v22 = a6;
  id v17 = v15;
  id v20 = v17;
  id v18 = v16;
  id v21 = v18;
  [v13 addErrorBlock:v19];

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
}

- (void)addSuccessBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPromise *)self completionBlocks];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __29__MTPromise_addSuccessBlock___block_invoke;
  v11[3] = &unk_264310F00;
  id v12 = v5;
  id v13 = v4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__MTPromise_addSuccessBlock___block_invoke_2;
  v8[3] = &unk_264310F28;
  id v9 = v12;
  id v10 = v13;
  id v6 = v13;
  id v7 = v12;
  [(MTPromise *)self _addBlock:v11 orCallWithResult:v8];
}

- (void)addErrorBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPromise *)self completionBlocks];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __27__MTPromise_addErrorBlock___block_invoke;
  v11[3] = &unk_264310F00;
  id v12 = v5;
  id v13 = v4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __27__MTPromise_addErrorBlock___block_invoke_2;
  v8[3] = &unk_264310F28;
  id v9 = v12;
  id v10 = v13;
  id v6 = v13;
  id v7 = v12;
  [(MTPromise *)self _addBlock:v11 orCallWithResult:v8];
}

- (void)addFinishBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPromise *)self completionBlocks];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __28__MTPromise_addFinishBlock___block_invoke;
  v11[3] = &unk_264310F00;
  id v12 = v5;
  id v13 = v4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28__MTPromise_addFinishBlock___block_invoke_2;
  v8[3] = &unk_264310F28;
  id v9 = v12;
  id v10 = v13;
  id v6 = v13;
  id v7 = v12;
  [(MTPromise *)self _addBlock:v11 orCallWithResult:v8];
}

- (id)thenWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MTPromise);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __27__MTPromise_thenWithBlock___block_invoke;
  v11[3] = &unk_264310F50;
  objc_copyWeak(&v14, &location);
  id v6 = v4;
  id v13 = v6;
  id v7 = v5;
  id v12 = v7;
  [(MTPromise *)self addFinishBlock:v11];
  id v8 = v12;
  id v9 = v7;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

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

    uint64_t v5 = [objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
    stateLock = v2->_stateLock;
    v2->_stateLock = (NSConditionLock *)v5;

    id v7 = +[MTPromise _globalPromiseStorageAccessQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __17__MTPromise_init__block_invoke;
    block[3] = &unk_26430FB90;
    id v10 = v2;
    dispatch_sync(v7, block);
  }
  return v2;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  id v8 = (void *)v7;
  if (v6 && v7)
  {
    id v9 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      unint64_t v28 = v6;
      __int16 v29 = 2112;
      v30 = v8;
      id v10 = "MetricsKit: Someone is finishing a promise with both a result and an error. This will result in both the suc"
            "cess and error blocks being called. result = %@ error = %@";
      objc_super v11 = v9;
      uint32_t v12 = 22;
LABEL_8:
      _os_log_impl(&dword_218211000, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);
    }
  }
  else
  {
    if (v6 | v7) {
      goto LABEL_10;
    }
    id v9 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      id v10 = "MetricsKit: Someone is finishing a promise with neither a result nor an error. This will result in neither t"
            "he success nor the error blocks being called.";
      objc_super v11 = v9;
      uint32_t v12 = 2;
      goto LABEL_8;
    }
  }

LABEL_10:
  id v13 = [(MTPromise *)self stateLock];
  [v13 lock];

  id v14 = [(MTPromise *)self stateLock];
  uint64_t v15 = [v14 condition];

  if (v15 == 1)
  {
    id v20 = objc_opt_class();
    id v21 = [(MTPromise *)self promiseResult];
    unint64_t v22 = [v21 error];
    if ([v20 _errorIsCanceledError:v22])
    {
    }
    else
    {
      char v23 = [(id)objc_opt_class() _errorIsCanceledError:v8];

      if (v23) {
        goto LABEL_16;
      }
      id v21 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218211000, v21, OS_LOG_TYPE_DEBUG, "MetricsKit: Someone is attempting to finish a finished MTPromise.", buf, 2u);
      }
    }

LABEL_16:
    id v16 = [(MTPromise *)self stateLock];
    [(MTPromiseResult *)v16 unlock];
    goto LABEL_17;
  }
  id v16 = [[MTPromiseResult alloc] initWithResult:v6 error:v8];
  [(MTPromise *)self setPromiseResult:v16];
  id v17 = [(MTPromise *)self stateLock];
  [v17 unlockWithCondition:1];

  id v18 = [(MTPromise *)self completionBlocks];
  [v18 flushCompletionBlocksWithPromiseResult:v16];

  objc_initWeak((id *)buf, self);
  v19 = +[MTPromise _globalPromiseStorageAccessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__MTPromise_finishWithResult_error___block_invoke;
  block[3] = &unk_26430F848;
  objc_copyWeak(&v26, (id *)buf);
  dispatch_async(v19, block);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
LABEL_17:

  return v15 != 1;
}

- (MTPromiseCompletionBlocks)completionBlocks
{
  return self->_completionBlocks;
}

+ (id)_globalPromiseStorageAccessQueue
{
  if (_globalPromiseStorageAccessQueue_onceToken != -1) {
    dispatch_once(&_globalPromiseStorageAccessQueue_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)_globalPromiseStorageAccessQueue_sGlobalPromiseStorageQueue;

  return v2;
}

- (void)_addBlock:(id)a3 orCallWithResult:(id)a4
{
  objc_super v11 = (void (**)(void))a3;
  unint64_t v6 = (void (**)(id, void *))a4;
  unint64_t v7 = [(MTPromise *)self stateLock];
  [v7 lock];

  id v8 = [(MTPromise *)self promiseResult];
  if (v8)
  {
    id v9 = [(MTPromise *)self stateLock];
    [v9 unlock];

    v6[2](v6, v8);
  }
  else
  {
    v11[2]();
    id v10 = [(MTPromise *)self stateLock];
    [v10 unlock];
  }
}

- (NSConditionLock)stateLock
{
  return self->_stateLock;
}

- (MTPromiseResult)promiseResult
{
  return self->_promiseResult;
}

- (void)setPromiseResult:(id)a3
{
}

uint64_t __28__MTPromise_addFinishBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addCompletionBlock:*(void *)(a1 + 40)];
}

uint64_t __29__MTPromise_addSuccessBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addSuccessBlock:*(void *)(a1 + 40)];
}

uint64_t __27__MTPromise_addErrorBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addErrorBlock:*(void *)(a1 + 40)];
}

void __75__MTPromise__configureAllPromise_withResults_promises_currentPromiseIndex___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 56);
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

+ (MTPromise)promiseWithResult:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 finishWithResult:v3];

  return (MTPromise *)v4;
}

- (BOOL)finishWithResult:(id)a3
{
  return [(MTPromise *)self finishWithResult:a3 error:0];
}

uint64_t __29__MTPromise_addSuccessBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callSuccessBlock:*(void *)(a1 + 40) withPromiseResult:a2];
}

uint64_t __27__MTPromise_addErrorBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callErrorBlock:*(void *)(a1 + 40) withPromiseResult:a2];
}

uint64_t __40__MTPromise__finishPromise_withPromise___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

+ (MTPromise)promiseWithAll:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(id)objc_opt_class() _configureAllPromise:v4 withResults:v5 promises:v3 currentPromiseIndex:0];

  return (MTPromise *)v4;
}

uint64_t __28__MTPromise_addFinishBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callCompletionBlock:*(void *)(a1 + 40) withPromiseResult:a2];
}

void __17__MTPromise_init__block_invoke(uint64_t a1)
{
  id v2 = +[MTPromise _globalPromiseStorage];
  [v2 addObject:*(void *)(a1 + 32)];
}

+ (id)_globalPromiseStorage
{
  if (_globalPromiseStorage_onceToken != -1) {
    dispatch_once(&_globalPromiseStorage_onceToken, &__block_literal_global_23);
  }
  id v2 = (void *)_globalPromiseStorage_sGlobalPromiseStorage;

  return v2;
}

void __36__MTPromise_finishWithResult_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[MTPromise _globalPromiseStorage];
  [v1 removeObject:WeakRetained];
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

- (BOOL)_isFinished
{
  id v2 = [(MTPromise *)self stateLock];
  BOOL v3 = [v2 condition] == 1;

  return v3;
}

+ (MTPromise)promiseWithComposition:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)objc_opt_class());
  [a1 _setupCompositePromise:v5 composition:v4];

  return (MTPromise *)v5;
}

+ (void)_setupCompositePromise:(id)a3 composition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _findUnfinishedPromise:v7];
  if (v8)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__MTPromise_Composition___setupCompositePromise_composition___block_invoke;
    v10[3] = &unk_264310168;
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

+ (id)_resultOfComposition:(id)a3 errors:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
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
      id v13 = [MEMORY[0x263EFF9D0] null];
    }
    id v21 = v13;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v15 = v6;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v38 != v18) {
              objc_enumerationMutation(v15);
            }
            id v20 = [a1 _resultOfComposition:*(void *)(*((void *)&v37 + 1) + 8 * i) errors:v7];
            [v14 addObject:v20];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v17);
      }

      id v21 = (id)[v14 copy];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v22 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v32 = v6;
        id v23 = v6;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v34;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v34 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void *)(*((void *)&v33 + 1) + 8 * j);
              __int16 v29 = [v23 objectForKeyedSubscript:v28];
              v30 = [a1 _resultOfComposition:v29 errors:v7];
              [v22 setObject:v30 forKeyedSubscript:v28];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v25);
        }

        id v21 = (id)[v22 copy];
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
  uint64_t v29 = *MEMORY[0x263EF8340];
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
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
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
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
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
    uint64_t v13 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      while (2)
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v7);
          }
          uint64_t v17 = objc_msgSend(v7, "objectForKeyedSubscript:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
          id v6 = [a1 _findUnfinishedPromise:v17];

          if (v6)
          {
LABEL_28:

            goto LABEL_29;
          }
        }
        uint64_t v14 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
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

uint64_t __61__MTPromise_Composition___setupCompositePromise_composition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 48) _setupCompositePromise:*(void *)(a1 + 32) composition:*(void *)(a1 + 40)];
}

+ (void)cancelPromisesInComposition:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
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
      uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v19 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * i)];
            +[MTPromise cancelPromisesInComposition:v9];
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
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
      uint64_t v10 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v15;
        do
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v4);
            }
            +[MTPromise cancelPromisesInComposition:](MTPromise, "cancelPromisesInComposition:", *(void *)(*((void *)&v14 + 1) + 8 * j), (void)v14);
          }
          uint64_t v11 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
        }
        while (v11);
      }
    }

    goto LABEL_21;
  }
  [v3 cancel];
LABEL_21:
}

+ (MTPromise)promiseWithError:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 finishWithError:v3];

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
    uint64_t v5 = [(MTPromise *)self promiseResult];
    uint64_t v6 = [v5 error];
    char v7 = [v4 _errorIsCanceledError:v6];
  }
  else
  {
    char v7 = 0;
  }
  uint64_t v8 = [(MTPromise *)self stateLock];
  [v8 unlock];

  return v7;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = [(MTPromise *)self stateLock];
  char v8 = [v7 lockWhenCondition:1 beforeDate:v6];

  if (v8)
  {
    long long v15 = [(MTPromise *)self promiseResult];
    long long v16 = [(MTPromise *)self stateLock];
    [v16 unlock];

    long long v17 = [v15 result];

    if (a4 && !v17)
    {
      *a4 = [v15 error];
    }
    long long v18 = [v15 result];
  }
  else if (a4)
  {
    MTError(400, 0, v9, v10, v11, v12, v13, v14, 0);
    long long v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

- (id)resultWithError:(id *)a3
{
  uint64_t v5 = [MEMORY[0x263EFF910] distantFuture];
  id v6 = [(MTPromise *)self resultBeforeDate:v5 error:a3];

  return v6;
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a3];
  char v7 = [(MTPromise *)self resultBeforeDate:v6 error:a4];

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
  uint64_t v5 = objc_alloc_init(MTPromise);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __28__MTPromise_catchWithBlock___block_invoke;
  v11[3] = &unk_264310F50;
  objc_copyWeak(&v14, &location);
  id v6 = v4;
  id v13 = v6;
  char v7 = v5;
  uint64_t v12 = v7;
  [(MTPromise *)self addFinishBlock:v11];
  char v8 = v12;
  uint64_t v9 = v7;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __28__MTPromise_catchWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
  char v7 = +[MTPromise promiseWithResult:v8];
  }
  [(id)objc_opt_class() _finishPromise:*(void *)(a1 + 32) withPromise:v7];
}

- (BOOL)cancel
{
  id v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
  LOBYTE(self) = [(MTPromise *)self finishWithResult:0 error:v3];

  return (char)self;
}

- (BOOL)finishWithError:(id)a3
{
  return [(MTPromise *)self finishWithResult:0 error:a3];
}

- (id)BOOLCompletionHandlerAdapter
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  char v7 = __41__MTPromise_BOOLCompletionHandlerAdapter__block_invoke;
  id v8 = &unk_264310F78;
  objc_copyWeak(&v9, &location);
  id v2 = (void *)MEMORY[0x21D465290](&v5);
  id v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

void __41__MTPromise_BOOLCompletionHandlerAdapter__block_invoke(uint64_t a1, char a2, void *a3)
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

- (id)completionHandlerAdapter
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  char v7 = __37__MTPromise_completionHandlerAdapter__block_invoke;
  id v8 = &unk_264310FA0;
  objc_copyWeak(&v9, &location);
  id v2 = (void *)MEMORY[0x21D465290](&v5);
  id v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

void __37__MTPromise_completionHandlerAdapter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained finishWithResult:v6 error:v5];
}

- (id)errorOnlyCompletionHandlerAdapter
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  char v7 = __46__MTPromise_errorOnlyCompletionHandlerAdapter__block_invoke;
  id v8 = &unk_264310FC8;
  objc_copyWeak(&v9, &location);
  id v2 = (void *)MEMORY[0x21D465290](&v5);
  id v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

void __46__MTPromise_errorOnlyCompletionHandlerAdapter__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (v5) {
    [WeakRetained finishWithError:v5];
  }
  else {
    [WeakRetained finishWithResult:MEMORY[0x263EFFA88]];
  }
}

- (id)nilValueCompletionHandlerAdapter
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  char v7 = __45__MTPromise_nilValueCompletionHandlerAdapter__block_invoke;
  id v8 = &unk_264310FA0;
  objc_copyWeak(&v9, &location);
  id v2 = (void *)MEMORY[0x21D465290](&v5);
  id v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

void __45__MTPromise_nilValueCompletionHandlerAdapter__block_invoke(uint64_t a1, void *a2, void *a3)
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
    id v8 = [MEMORY[0x263EFF9D0] null];
    [v7 finishWithResult:v8];
  }
}

void __75__MTPromise__configureAllPromise_withResults_promises_currentPromiseIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  for (unint64_t i = *(void *)(a1 + 48) + 1; i < [*(id *)(a1 + 32) count]; ++i)
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
    [v4 cancel];
  }
  [*(id *)(a1 + 40) finishWithError:v5];
}

+ (void)_configureAnyPromise:(id)a3 withPromises:(id)a4 currentPromiseIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 objectAtIndexedSubscript:a5];
  objc_initWeak(&location, a1);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __67__MTPromise__configureAnyPromise_withPromises_currentPromiseIndex___block_invoke;
  v19[3] = &unk_264311040;
  unint64_t v22 = a5;
  id v11 = v9;
  id v20 = v11;
  id v12 = v8;
  id v21 = v12;
  [v10 addSuccessBlock:v19];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__MTPromise__configureAnyPromise_withPromises_currentPromiseIndex___block_invoke_2;
  v15[3] = &unk_264311068;
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

void __67__MTPromise__configureAnyPromise_withPromises_currentPromiseIndex___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  for (unint64_t i = *(void *)(a1 + 48) + 1; i < [*(id *)(a1 + 32) count]; ++i)
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
    [v4 cancel];
  }
  [*(id *)(a1 + 40) finishWithResult:v5];
}

void __67__MTPromise__configureAnyPromise_withPromises_currentPromiseIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4 == [*(id *)(a1 + 32) count] - 1) {
    [*(id *)(a1 + 40) finishWithError:v5];
  }
  else {
    [WeakRetained _configureAnyPromise:*(void *)(a1 + 40) withPromises:*(void *)(a1 + 32) currentPromiseIndex:*(void *)(a1 + 56) + 1];
  }
}

+ (BOOL)_errorIsCanceledError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x263F07F70]]) {
    BOOL v5 = [v3 code] == 3072;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __40__MTPromise__finishPromise_withPromise___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

uint64_t __34__MTPromise__globalPromiseStorage__block_invoke()
{
  _globalPromiseStorage_sGlobalPromiseStorage = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9C0]);

  return MEMORY[0x270F9A758]();
}

uint64_t __45__MTPromise__globalPromiseStorageAccessQueue__block_invoke()
{
  _globalPromiseStorageAccessQueue_sGlobalPromiseStorageQueue = (uint64_t)dispatch_queue_create("com.apple.MetricsKit.globalPromiseStorageAccessQueue", 0);

  return MEMORY[0x270F9A758]();
}

- (void)setCompletionBlocks:(id)a3
{
}

- (void)setStateLock:(id)a3
{
}

@end