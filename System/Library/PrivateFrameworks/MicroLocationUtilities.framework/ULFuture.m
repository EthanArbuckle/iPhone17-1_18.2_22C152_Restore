@interface ULFuture
+ (id)_join:(id)a3 ignoreFailures:(BOOL)a4;
+ (id)_recover:(id)a3 withBlock:(id)a4 scheduler:(id)a5;
+ (id)_then:(id)a3 withBlock:(id)a4 scheduler:(id)a5;
+ (id)chain:(id)a3;
+ (id)combine:(id)a3;
+ (id)futureWithBlock:(id)a3;
+ (id)futureWithError:(id)a3;
+ (id)futureWithResult:(id)a3;
+ (id)join:(id)a3;
+ (id)nullFuture;
+ (id)onScheduler:(id)a3 futureWithBlock:(id)a4;
+ (id)sequence:(id)a3;
+ (void)_always:(id)a3 withBlock:(id)a4 scheduler:(id)a5;
- (BOOL)_nts_isFinished;
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithResult:(id)a3;
- (BOOL)finishWithResult:(id)a3 error:(id)a4;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)tryCancel;
- (ULFuture)init;
- (id)BOOLErrorCompletionHandlerAdapter;
- (id)completionHandlerAdapter;
- (id)errorOnlyCompletionHandlerAdapter;
- (id)map:(id)a3;
- (id)onScheduler:(id)a3 map:(id)a4;
- (id)onScheduler:(id)a3 recover:(id)a4;
- (id)onScheduler:(id)a3 then:(id)a4;
- (id)recover:(id)a3;
- (id)result;
- (id)result:(id *)a3;
- (id)resultBeforeDate:(id)a3 error:(id *)a4;
- (id)resultIfAvailable;
- (id)resultIfAvailable:(id *)a3;
- (id)resultWithTimeout:(double)a3 error:(id *)a4;
- (id)then:(id)a3;
- (void)_addCompletionBlock:(id)a3;
- (void)_finishWithFuture:(id)a3;
- (void)_flushCompletionBlocks;
- (void)addFailureBlock:(id)a3;
- (void)addSuccessBlock:(id)a3;
- (void)always:(id)a3;
- (void)onScheduler:(id)a3 addFailureBlock:(id)a4;
- (void)onScheduler:(id)a3 addSuccessBlock:(id)a4;
- (void)onScheduler:(id)a3 always:(id)a4;
@end

@implementation ULFuture

+ (id)nullFuture
{
  v3 = [MEMORY[0x263EFF9D0] null];
  v4 = [a1 futureWithResult:v3];

  return v4;
}

+ (id)futureWithResult:(id)a3
{
  id v3 = a3;
  v4 = +[ULPromise promise];
  [v4 finishWithResult:v3];

  v5 = [v4 future];

  return v5;
}

+ (id)futureWithError:(id)a3
{
  id v3 = a3;
  v4 = +[ULPromise promise];
  [v4 finishWithError:v3];

  v5 = [v4 future];

  return v5;
}

+ (id)futureWithBlock:(id)a3
{
  id v4 = a3;
  v5 = +[ULScheduler globalAsyncScheduler];
  v6 = [a1 onScheduler:v5 futureWithBlock:v4];

  return v6;
}

+ (id)onScheduler:(id)a3 futureWithBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[ULPromise promise];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __40__ULFuture_onScheduler_futureWithBlock___block_invoke;
  v15 = &unk_2653FDC20;
  id v16 = v7;
  id v17 = v5;
  id v8 = v7;
  id v9 = v5;
  [v6 performAsyncBlock:&v12];

  v10 = objc_msgSend(v8, "future", v12, v13, v14, v15);

  return v10;
}

void __40__ULFuture_onScheduler_futureWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = 0;
  id v3 = (*(void (**)(void))(v2 + 16))();
  id v4 = v5;
  [*(id *)(a1 + 32) finishWithResult:v3 error:v4];
}

+ (void)_always:(id)a3 withBlock:(id)a4 scheduler:(id)a5
{
  id v7 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __40__ULFuture__always_withBlock_scheduler___block_invoke;
  v14[3] = &unk_2653FDC48;
  id v8 = v7;
  id v15 = v8;
  id v9 = a5;
  id v10 = a3;
  [v10 onScheduler:v9 addSuccessBlock:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__ULFuture__always_withBlock_scheduler___block_invoke_2;
  v12[3] = &unk_2653FDC70;
  id v13 = v8;
  id v11 = v8;
  [v10 onScheduler:v9 addFailureBlock:v12];
}

uint64_t __40__ULFuture__always_withBlock_scheduler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __40__ULFuture__always_withBlock_scheduler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_then:(id)a3 withBlock:(id)a4 scheduler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = +[ULPromise promise];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __38__ULFuture__then_withBlock_scheduler___block_invoke;
  v18[3] = &unk_2653FDC98;
  id v20 = v7;
  id v11 = v10;
  id v19 = v11;
  id v12 = v7;
  [v9 onScheduler:v8 addSuccessBlock:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __38__ULFuture__then_withBlock_scheduler___block_invoke_2;
  v16[3] = &unk_2653FDCC0;
  id v17 = v11;
  id v13 = v11;
  [v9 onScheduler:v8 addFailureBlock:v16];

  v14 = [v13 future];

  return v14;
}

void __38__ULFuture__then_withBlock_scheduler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _finishWithFuture:v2];
}

uint64_t __38__ULFuture__then_withBlock_scheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

+ (id)_recover:(id)a3 withBlock:(id)a4 scheduler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = +[ULPromise promise];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __41__ULFuture__recover_withBlock_scheduler___block_invoke;
  v19[3] = &unk_2653FDCE8;
  id v11 = v10;
  id v20 = v11;
  [v9 onScheduler:v8 addSuccessBlock:v19];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __41__ULFuture__recover_withBlock_scheduler___block_invoke_2;
  v16[3] = &unk_2653FDD10;
  id v17 = v11;
  id v18 = v7;
  id v12 = v11;
  id v13 = v7;
  [v9 onScheduler:v8 addFailureBlock:v16];

  v14 = [v12 future];

  return v14;
}

uint64_t __41__ULFuture__recover_withBlock_scheduler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

void __41__ULFuture__recover_withBlock_scheduler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _finishWithFuture:v2];
}

+ (id)chain:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  if ([v4 count] == 1)
  {
    id v6 = v5;
  }
  else
  {
    if ((unint64_t)[v4 count] < 2)
    {
      id v7 = (void *)MEMORY[0x263EFFA68];
    }
    else
    {
      id v7 = objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __18__ULFuture_chain___block_invoke;
    v16[3] = &unk_2653FDD38;
    id v18 = a1;
    id v8 = v7;
    id v17 = v8;
    id v9 = [v5 then:v16];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __18__ULFuture_chain___block_invoke_2;
    v13[3] = &unk_2653FDD60;
    id v14 = v8;
    id v15 = a1;
    id v10 = v8;
    id v11 = [v9 recover:v13];

    id v6 = v11;
  }

  return v6;
}

id __18__ULFuture_chain___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF9D0] null];

  id v5 = *(void **)(a1 + 40);
  if (v4 == v3) {
    [v5 chain:*(void *)(a1 + 32)];
  }
  else {
  id v6 = [v5 futureWithResult:v3];
  }

  return v6;
}

uint64_t __18__ULFuture_chain___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) chain:*(void *)(a1 + 32)];
}

+ (id)join:(id)a3
{
  return (id)[a1 _join:a3 ignoreFailures:0];
}

+ (id)combine:(id)a3
{
  return (id)[a1 _join:a3 ignoreFailures:1];
}

+ (id)_join:(id)a3 ignoreFailures:(BOOL)a4
{
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = +[ULPromise promise];
    uint64_t v7 = [v5 count];
    id v8 = [MEMORY[0x263EFF980] arrayWithCapacity:v7];
    if (v7)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        id v10 = [MEMORY[0x263EFF9D0] null];
        [v8 setObject:v10 atIndexedSubscript:i];
      }
    }
    id v11 = objc_alloc_init(MEMORY[0x263F08958]);
    dispatch_group_t v12 = dispatch_group_create();
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __33__ULFuture__join_ignoreFailures___block_invoke;
    v30[3] = &unk_2653FDDD8;
    dispatch_group_t v31 = v12;
    id v13 = v11;
    id v32 = v13;
    id v14 = v8;
    id v33 = v14;
    BOOL v35 = a4;
    id v15 = v6;
    id v34 = v15;
    id v16 = v12;
    [v5 enumerateObjectsUsingBlock:v30];
    id v17 = dispatch_get_global_queue(21, 0);
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __33__ULFuture__join_ignoreFailures___block_invoke_4;
    v26 = &unk_2653FDE00;
    id v27 = v13;
    id v28 = v15;
    id v29 = v14;
    id v18 = v14;
    id v19 = v15;
    id v20 = v13;
    dispatch_group_notify(v16, v17, &v23);

    v21 = objc_msgSend(v19, "future", v23, v24, v25, v26);
  }
  else
  {
    v21 = +[ULFuture futureWithResult:MEMORY[0x263EFFA68]];
  }

  return v21;
}

void __33__ULFuture__join_ignoreFailures___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(NSObject **)(a1 + 32);
  id v6 = a2;
  dispatch_group_enter(v5);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __33__ULFuture__join_ignoreFailures___block_invoke_2;
  v11[3] = &unk_2653FDD88;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  uint64_t v15 = a3;
  id v14 = *(id *)(a1 + 32);
  [v6 addSuccessBlock:v11];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__ULFuture__join_ignoreFailures___block_invoke_3;
  v7[3] = &unk_2653FDDB0;
  char v10 = *(unsigned char *)(a1 + 64);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 32);
  [v6 addFailureBlock:v7];
}

void __33__ULFuture__join_ignoreFailures___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 lock];
  [*(id *)(a1 + 40) setObject:v4 atIndexedSubscript:*(void *)(a1 + 56)];

  [*(id *)(a1 + 32) unlock];
  id v5 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v5);
}

void __33__ULFuture__join_ignoreFailures___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) finishWithError:a2];
  }
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

uint64_t __33__ULFuture__join_ignoreFailures___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) lock];
  [*(id *)(a1 + 40) finishWithResult:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);

  return [v2 unlock];
}

+ (id)sequence:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [MEMORY[0x263EFF980] array];
    if ((unint64_t)[v3 count] < 2)
    {
      id v5 = (void *)MEMORY[0x263EFFA68];
    }
    else
    {
      id v5 = objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    }
    uint64_t v7 = objc_msgSend(v3, "firstObject", v3);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        uint64_t v12 = 0;
        id v13 = v7;
        do
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v12);
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          v20[2] = __21__ULFuture_sequence___block_invoke;
          v20[3] = &unk_2653FDE28;
          id v21 = v4;
          uint64_t v22 = v14;
          uint64_t v7 = [v13 then:v20];

          ++v12;
          id v13 = v7;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __21__ULFuture_sequence___block_invoke_2;
    v18[3] = &unk_2653FDE50;
    id v19 = v4;
    id v15 = v4;
    id v6 = [v7 then:v18];

    id v3 = v17;
  }
  else
  {
    id v6 = +[ULFuture futureWithResult:MEMORY[0x263EFFA68]];
  }

  return v6;
}

id __21__ULFuture_sequence___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObject:a2];
  id v3 = *(void **)(a1 + 40);

  return v3;
}

ULFuture *__21__ULFuture_sequence___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObject:a2];
  uint64_t v3 = *(void *)(a1 + 32);

  return +[ULFuture futureWithResult:v3];
}

- (ULFuture)init
{
  v8.receiver = self;
  v8.super_class = (Class)ULFuture;
  id v2 = [(ULFuture *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
    stateLock = v2->_stateLock;
    v2->_stateLock = (NSConditionLock *)v3;

    [(NSConditionLock *)v2->_stateLock setName:@"ULFuture state lock"];
    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v5;
  }
  return v2;
}

- (id)result
{
  return [(ULFuture *)self result:0];
}

- (id)resultIfAvailable
{
  return [(ULFuture *)self resultIfAvailable:0];
}

- (id)result:(id *)a3
{
  id v5 = [MEMORY[0x263EFF910] distantFuture];
  id v6 = [(ULFuture *)self resultBeforeDate:v5 error:a3];

  return v6;
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a3];
  uint64_t v7 = [(ULFuture *)self resultBeforeDate:v6 error:a4];

  return v7;
}

- (id)resultIfAvailable:(id *)a3
{
  id v5 = [MEMORY[0x263EFF910] distantPast];
  id v6 = [(ULFuture *)self resultBeforeDate:v5 error:a3];

  return v6;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  if ([(NSConditionLock *)self->_stateLock lockWhenCondition:1 beforeDate:a3])
  {
    id v6 = self->_result;
    stateLock = self->_stateLock;
    objc_super v8 = self->_error;
    [(NSConditionLock *)stateLock unlock];
    if (a4) {
      *a4 = v8;
    }
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"ULErrorDomain" code:-1 userInfo:0];
    id v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isFinished
{
  [(NSConditionLock *)self->_stateLock lock];
  BOOL v3 = [(ULFuture *)self _nts_isFinished];
  [(NSConditionLock *)self->_stateLock unlock];
  return v3;
}

- (BOOL)isCancelled
{
  [(NSConditionLock *)self->_stateLock lock];
  if ([(ULFuture *)self _nts_isFinished])
  {
    BOOL v3 = [(NSError *)self->_error domain];
    if ([v3 isEqual:*MEMORY[0x263F07F70]]) {
      BOOL v4 = [(NSError *)self->_error code] == 3072;
    }
    else {
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  [(NSConditionLock *)self->_stateLock unlock];
  return v4;
}

- (BOOL)tryCancel
{
  BOOL v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
  BOOL v4 = [(ULFuture *)self finishWithResult:0 error:v3];

  if (v4) {
    [(ULFuture *)self didCancel];
  }
  return v4;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(NSConditionLock *)self->_stateLock lock];
  BOOL v9 = [(ULFuture *)self _nts_isFinished];
  if (v9)
  {
    [(NSConditionLock *)self->_stateLock unlock];
  }
  else
  {
    objc_storeStrong(&self->_result, a3);
    uint64_t v10 = (NSError *)[v8 copy];
    error = self->_error;
    self->_error = v10;

    [(NSConditionLock *)self->_stateLock unlockWithCondition:1];
    [(ULFuture *)self _flushCompletionBlocks];
  }

  return !v9;
}

- (void)_finishWithFuture:(id)a3
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__ULFuture__finishWithFuture___block_invoke;
  v6[3] = &unk_2653FDCE8;
  v6[4] = self;
  id v4 = a3;
  [v4 addSuccessBlock:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__ULFuture__finishWithFuture___block_invoke_2;
  v5[3] = &unk_2653FDCC0;
  v5[4] = self;
  [v4 addFailureBlock:v5];
}

uint64_t __30__ULFuture__finishWithFuture___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

uint64_t __30__ULFuture__finishWithFuture___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (BOOL)finishWithResult:(id)a3
{
  return [(ULFuture *)self finishWithResult:a3 error:0];
}

- (BOOL)finishWithError:(id)a3
{
  return [(ULFuture *)self finishWithResult:0 error:a3];
}

- (id)completionHandlerAdapter
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__ULFuture_completionHandlerAdapter__block_invoke;
  v5[3] = &unk_2653FDE78;
  v5[4] = self;
  id v2 = (void *)MEMORY[0x25A2A74F0](v5, a2);
  BOOL v3 = (void *)MEMORY[0x25A2A74F0]();

  return v3;
}

uint64_t __36__ULFuture_completionHandlerAdapter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

- (id)BOOLErrorCompletionHandlerAdapter
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__ULFuture_BOOLErrorCompletionHandlerAdapter__block_invoke;
  v5[3] = &unk_2653FDEA0;
  v5[4] = self;
  id v2 = (void *)MEMORY[0x25A2A74F0](v5, a2);
  BOOL v3 = (void *)MEMORY[0x25A2A74F0]();

  return v3;
}

void __45__ULFuture_BOOLErrorCompletionHandlerAdapter__block_invoke(uint64_t a1, int a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
    [v2 finishWithResult:v4];
  }
  else
  {
    BOOL v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "finishWithError:");
  }
}

- (id)errorOnlyCompletionHandlerAdapter
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__ULFuture_errorOnlyCompletionHandlerAdapter__block_invoke;
  v5[3] = &unk_2653FDCC0;
  v5[4] = self;
  id v2 = (void *)MEMORY[0x25A2A74F0](v5, a2);
  BOOL v3 = (void *)MEMORY[0x25A2A74F0]();

  return v3;
}

void __45__ULFuture_errorOnlyCompletionHandlerAdapter__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    BOOL v3 = *(void **)(a1 + 32);
    [v3 finishWithError:a2];
  }
  else
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
    [v2 finishWithResult:v4];
  }
}

- (BOOL)_nts_isFinished
{
  return [(NSConditionLock *)self->_stateLock condition] == 1;
}

- (void)addSuccessBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__ULFuture_addSuccessBlock___block_invoke;
  v7[3] = &unk_2653FDEC8;
  id v8 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x25A2A74F0](v7);
  [(ULFuture *)self _addCompletionBlock:v6];
}

uint64_t __28__ULFuture_addSuccessBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)onScheduler:(id)a3 addSuccessBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__ULFuture_onScheduler_addSuccessBlock___block_invoke;
  v10[3] = &unk_2653FDEF0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ULFuture *)self addSuccessBlock:v10];
}

void __40__ULFuture_onScheduler_addSuccessBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__ULFuture_onScheduler_addSuccessBlock___block_invoke_2;
  v7[3] = &unk_2653FDC20;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performAsyncBlock:v7];
}

uint64_t __40__ULFuture_onScheduler_addSuccessBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addFailureBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__ULFuture_addFailureBlock___block_invoke;
  v7[3] = &unk_2653FDEC8;
  id v8 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x25A2A74F0](v7);
  [(ULFuture *)self _addCompletionBlock:v6];
}

uint64_t __28__ULFuture_addFailureBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)onScheduler:(id)a3 addFailureBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__ULFuture_onScheduler_addFailureBlock___block_invoke;
  v10[3] = &unk_2653FDF18;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ULFuture *)self addFailureBlock:v10];
}

void __40__ULFuture_onScheduler_addFailureBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__ULFuture_onScheduler_addFailureBlock___block_invoke_2;
  v7[3] = &unk_2653FDC20;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performAsyncBlock:v7];
}

uint64_t __40__ULFuture_onScheduler_addFailureBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_addCompletionBlock:(id)a3
{
  id v6 = (void (**)(id, id, NSError *))a3;
  [(NSConditionLock *)self->_stateLock lock];
  if ([(ULFuture *)self _nts_isFinished])
  {
    [(NSConditionLock *)self->_stateLock unlock];
    v6[2](v6, self->_result, self->_error);
  }
  else
  {
    completionBlocks = self->_completionBlocks;
    id v5 = (void *)MEMORY[0x25A2A74F0](v6);
    [(NSMutableArray *)completionBlocks addObject:v5];

    [(NSConditionLock *)self->_stateLock unlock];
  }
}

- (void)_flushCompletionBlocks
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(NSConditionLock *)self->_stateLock lock];
  id v3 = (void *)[(NSMutableArray *)self->_completionBlocks copy];
  [(NSMutableArray *)self->_completionBlocks removeAllObjects];
  [(NSConditionLock *)self->_stateLock unlock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)always:(id)a3
{
  id v4 = a3;
  id v5 = +[ULScheduler immediateScheduler];
  [(ULFuture *)self onScheduler:v5 always:v4];
}

- (void)onScheduler:(id)a3 always:(id)a4
{
}

- (id)then:(id)a3
{
  id v4 = a3;
  id v5 = +[ULScheduler immediateScheduler];
  uint64_t v6 = [(ULFuture *)self onScheduler:v5 then:v4];

  return v6;
}

- (id)onScheduler:(id)a3 then:(id)a4
{
  return +[ULFuture _then:self withBlock:a4 scheduler:a3];
}

- (id)recover:(id)a3
{
  id v4 = a3;
  id v5 = +[ULScheduler immediateScheduler];
  uint64_t v6 = [(ULFuture *)self onScheduler:v5 recover:v4];

  return v6;
}

- (id)onScheduler:(id)a3 recover:(id)a4
{
  return +[ULFuture _recover:self withBlock:a4 scheduler:a3];
}

- (id)map:(id)a3
{
  id v4 = a3;
  id v5 = +[ULScheduler immediateScheduler];
  uint64_t v6 = [(ULFuture *)self onScheduler:v5 map:v4];

  return v6;
}

- (id)onScheduler:(id)a3 map:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __28__ULFuture_onScheduler_map___block_invoke;
  v10[3] = &unk_2653FDF40;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = [(ULFuture *)self onScheduler:a3 then:v10];

  return v8;
}

id __28__ULFuture_onScheduler_map___block_invoke(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v1)
  {
    id v2 = +[ULFuture futureWithResult:v1];
  }
  else
  {
    id v3 = [MEMORY[0x263EFF9D0] null];
    id v2 = +[ULFuture futureWithResult:v3];
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_result, 0);

  objc_storeStrong((id *)&self->_stateLock, 0);
}

@end