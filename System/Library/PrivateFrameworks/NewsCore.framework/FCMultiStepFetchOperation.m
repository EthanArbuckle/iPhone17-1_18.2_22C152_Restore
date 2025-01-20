@interface FCMultiStepFetchOperation
- (FCMultiStepFetchOperation)init;
- (NFMutexLock)accessLock;
- (NSMutableArray)stepResults;
- (NSMutableArray)steps;
- (id)completeFetchOperation;
- (void)_performNextStep;
- (void)addFetchStep:(SEL)a3;
- (void)addNonCriticalFetchStep:(SEL)a3;
- (void)customizeChildOperation:(id)a3 forFetchStep:(SEL)a4;
- (void)setAccessLock:(id)a3;
- (void)setStepResults:(id)a3;
- (void)setSteps:(id)a3;
@end

@implementation FCMultiStepFetchOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_stepResults, 0);
  objc_storeStrong((id *)&self->_steps, 0);
}

- (FCMultiStepFetchOperation)init
{
  v10.receiver = self;
  v10.super_class = (Class)FCMultiStepFetchOperation;
  v2 = [(FCFetchOperation *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    steps = v2->_steps;
    v2->_steps = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    stepResults = v2->_stepResults;
    v2->_stepResults = v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F81BE0]) initWithOptions:1];
    accessLock = v2->_accessLock;
    v2->_accessLock = (NFMutexLock *)v7;
  }
  return v2;
}

void __42__FCMultiStepFetchOperation_addFetchStep___block_invoke(uint64_t a1)
{
  v3 = objc_alloc_init(FCMultiStepFetchOperationStep);
  [(FCMultiStepFetchOperationStep *)v3 setFetchSelector:*(void *)(a1 + 40)];
  [(FCMultiStepFetchOperationStep *)v3 setIsCritical:1];
  v2 = [*(id *)(a1 + 32) steps];
  [v2 addObject:v3];
}

- (void)addFetchStep:(SEL)a3
{
  v5 = [(FCMultiStepFetchOperation *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__FCMultiStepFetchOperation_addFetchStep___block_invoke;
  v6[3] = &unk_1E5B51AE8;
  v6[4] = self;
  v6[5] = a3;
  [v5 performWithLockSync:v6];
}

- (void)_performNextStep
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [(FCMultiStepFetchOperation *)self accessLock];
  [v3 lock];

  if (![(FCOperation *)self isFinished])
  {
    v4 = [(FCMultiStepFetchOperation *)self steps];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      v6 = [(FCMultiStepFetchOperation *)self steps];
      uint64_t v7 = [v6 firstObject];

      v8 = [(FCMultiStepFetchOperation *)self steps];
      [v8 removeObjectAtIndex:0];

      v9 = (void (*)(FCMultiStepFetchOperation *, uint64_t, void *))-[FCMultiStepFetchOperation methodForSelector:](self, "methodForSelector:", [v7 fetchSelector]);
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __45__FCMultiStepFetchOperation__performNextStep__block_invoke_2;
      v21 = &unk_1E5B4BEC0;
      v22 = self;
      id v10 = v7;
      id v23 = v10;
      v11 = _Block_copy(&v18);
      v12 = v9(self, objc_msgSend(v10, "fetchSelector", v18, v19, v20, v21, v22), v11);
      if (v12)
      {
        [(FCOperation *)self associateChildOperation:v12];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          -[FCMultiStepFetchOperation customizeChildOperation:forFetchStep:](self, "customizeChildOperation:forFetchStep:", v12, [v10 fetchSelector]);
          [v12 setCanSendFetchCompletionSynchronously:1];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v12 isExecuting]
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v17 = (void *)[[NSString alloc] initWithFormat:@"child operation shouldn't be executing yet"];
            *(_DWORD *)buf = 136315906;
            v25 = "-[FCMultiStepFetchOperation _performNextStep]";
            __int16 v26 = 2080;
            v27 = "FCMultiStepFetchOperation.m";
            __int16 v28 = 1024;
            int v29 = 149;
            __int16 v30 = 2114;
            v31 = v17;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          [v12 start];
        }
      }
    }
    else
    {
      id v10 = [(FCMultiStepFetchOperation *)self completeFetchOperation];
      v13 = +[FCFetchOperationResult resultWithStatus:0 fetchedObject:v10 error:0];
      v14 = [(FCMultiStepFetchOperation *)self stepResults];
      v15 = objc_msgSend(v14, "fc_setByCollectingObjectsWithBlock:", &__block_literal_global_72);
      [v13 setMissingObjectDescriptions:v15];

      [(FCFetchOperation *)self finishExecutingWithResult:v13];
    }
  }
  v16 = [(FCMultiStepFetchOperation *)self accessLock];
  [v16 unlock];
}

- (NSMutableArray)steps
{
  return self->_steps;
}

- (NFMutexLock)accessLock
{
  return self->_accessLock;
}

void __45__FCMultiStepFetchOperation__performNextStep__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    v3 = [*(id *)(a1 + 32) stepResults];
    [v3 addObject:v4];

    if ([*(id *)(a1 + 40) isCritical] && objc_msgSend(v4, "status")) {
      [*(id *)(a1 + 32) finishExecutingWithResult:v4];
    }
  }
  else
  {
    [*(id *)(a1 + 40) isCritical];
  }
  [*(id *)(a1 + 32) _performNextStep];
}

- (NSMutableArray)stepResults
{
  return self->_stepResults;
}

- (void)customizeChildOperation:(id)a3 forFetchStep:(SEL)a4
{
}

uint64_t __45__FCMultiStepFetchOperation__performNextStep__block_invoke(uint64_t a1, void *a2)
{
  return [a2 missingObjectDescriptions];
}

- (void)addNonCriticalFetchStep:(SEL)a3
{
  uint64_t v5 = [(FCMultiStepFetchOperation *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__FCMultiStepFetchOperation_addNonCriticalFetchStep___block_invoke;
  v6[3] = &unk_1E5B51AE8;
  v6[4] = self;
  v6[5] = a3;
  [v5 performWithLockSync:v6];
}

void __53__FCMultiStepFetchOperation_addNonCriticalFetchStep___block_invoke(uint64_t a1)
{
  v3 = objc_alloc_init(FCMultiStepFetchOperationStep);
  [(FCMultiStepFetchOperationStep *)v3 setFetchSelector:*(void *)(a1 + 40)];
  [(FCMultiStepFetchOperationStep *)v3 setIsCritical:0];
  v2 = [*(id *)(a1 + 32) steps];
  [v2 addObject:v3];
}

- (id)completeFetchOperation
{
  return 0;
}

- (void)setSteps:(id)a3
{
}

- (void)setStepResults:(id)a3
{
}

- (void)setAccessLock:(id)a3
{
}

@end