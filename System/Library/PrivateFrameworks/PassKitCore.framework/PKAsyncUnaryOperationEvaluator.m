@interface PKAsyncUnaryOperationEvaluator
- (BOOL)_performOperation;
- (BOOL)isCanceled;
- (PKAsyncUnaryOperationEvaluator)init;
- (id)_initWithOperations:(id)a3 input:(id)a4;
- (id)evaluateWithCompletion:(id)a3;
- (void)cancel;
- (void)dealloc;
@end

@implementation PKAsyncUnaryOperationEvaluator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningOperationState, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_operations, 0);
}

- (id)_initWithOperations:(id)a3 input:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PKAsyncUnaryOperationEvaluator;
  v8 = [(PKAsyncUnaryOperationEvaluator *)&v25 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [v6 count];
    if (v10)
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
      operations = v9->_operations;
      v9->_operations = (NSMutableArray *)v11;

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v13 = objc_msgSend(v6, "reverseObjectEnumerator", 0);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v22;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = v9->_operations;
            v19 = _Block_copy(*(const void **)(*((void *)&v21 + 1) + 8 * v17));
            [(NSMutableArray *)v18 addObject:v19];

            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v15);
      }
    }
    objc_storeStrong(&v9->_value, a4);
  }

  return v9;
}

void __51__PKAsyncUnaryOperationEvaluator__performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __51__PKAsyncUnaryOperationEvaluator__performOperation__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  char v7 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (unsigned __int8 *)&v7, 1u);
  id v15 = v6;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"PKAsyncUnaryOperationEvaluator (%p): operation completion must only be called once.", *(void *)(a1 + 32));
    goto LABEL_20;
  }
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"PKAsyncUnaryOperationComposer: operation must maintain non-nil input."];
  }
  uint64_t v8 = *(void *)_performOperation_WaitingListHead();
  v9 = *(os_unfair_lock_s **)(a1 + 32);
  if (v8)
  {
    while (*(os_unfair_lock_s **)v8 != v9)
    {
      uint64_t v8 = *(void *)(v8 + 8);
      if (!v8) {
        goto LABEL_7;
      }
    }
    int v10 = 0;
    *(unsigned char *)(v8 + 16) = 1;
    v9 = *(os_unfair_lock_s **)(a1 + 32);
  }
  else
  {
LABEL_7:
    int v10 = 1;
  }
  os_unfair_lock_lock(v9 + 2);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
  id v11 = *(id *)(*(void *)(a1 + 32) + 56);
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 56);
  *(void *)(v12 + 56) = 0;

  if (v10) {
    *(unsigned char *)(*(void *)(a1 + 32) + 49) = 1;
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (a3)
  {
    *(unsigned char *)(v14 + 50) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    if (v11)
    {
      [v11 _cancel];
LABEL_16:
      [v11 _invalidate];
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v14 + 8));
    if (v11) {
      goto LABEL_16;
    }
  }
  if (v10) {
    [*(id *)(a1 + 32) _performOperation];
  }

LABEL_20:
}

- (id)evaluateWithCompletion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_started) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"PKAsyncUnaryOperationEvaluator (%p): operations may only be started once.", self);
  }
  self->_started = 1;
  v5 = _Block_copy(v4);
  id completion = self->_completion;
  self->_id completion = v5;

  os_unfair_lock_unlock(&self->_lock);
  char v7 = self;
  if ([(PKAsyncUnaryOperationEvaluator *)v7 _performOperation]) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }
  v9 = v8;

  return v9;
}

- (BOOL)_performOperation
{
  v3 = (PKAsyncUnaryOperationEvaluator ***)_performOperation_WaitingListHead();
  int v4 = 0;
  v5 = (uint64_t *)MEMORY[0x1E4F1C3B8];
  v49 = *v3;
  uint64_t v50 = 0;
  v48 = self;
  v35 = v49;
  v36 = v3;
  void *v3 = &v48;
  uint64_t v6 = *v5;
  char v7 = 1;
  uint64_t v37 = *v5;
  do
  {
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    char v47 = 0;
    uint64_t v8 = (void *)MEMORY[0x192FDC630]();
    os_unfair_lock_lock(&self->_lock);
    if (self->_runningOperationState) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v6, @"PKAsyncUnaryOperationEvaluator (%p): implementation error - attempting to perform operations simultaneously.", self);
    }
    id v9 = self->_value;
    if (self->_canceled) {
      goto LABEL_5;
    }
    if (![(NSMutableArray *)self->_operations count]) {
      goto LABEL_5;
    }
    uint64_t v14 = [(NSMutableArray *)self->_operations lastObject];
    if (!v14) {
      goto LABEL_5;
    }
    [(NSMutableArray *)self->_operations removeLastObject];
    id v15 = [[PKAsyncOperationState alloc] _init];
    runningOperationState = self->_runningOperationState;
    self->_runningOperationState = v15;

    uint64_t v17 = v15;
    if (!v17)
    {
      self->_canceled = 1;

      uint64_t v6 = v37;
LABEL_5:
      os_unfair_lock_unlock(&self->_lock);
      int v10 = 5;
      int v11 = 1;
      int v4 = 1;
      goto LABEL_6;
    }
    v18 = v17;
    int v38 = v4;
    os_unfair_lock_unlock(&self->_lock);
    LOBYTE(v50) = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PKAsyncUnaryOperationEvaluator__performOperation__block_invoke;
    aBlock[3] = &unk_1E56F6E68;
    aBlock[4] = self;
    aBlock[5] = v46;
    v19 = _Block_copy(aBlock);
    v20 = [PKDeallocationGuard alloc];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __51__PKAsyncUnaryOperationEvaluator__performOperation__block_invoke_2;
    v42[3] = &unk_1E56D83D8;
    id v21 = v19;
    id v44 = v21;
    id v22 = v9;
    id v43 = v22;
    long long v23 = [(PKDeallocationGuard *)v20 initWithBlock:v42];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __51__PKAsyncUnaryOperationEvaluator__performOperation__block_invoke_3;
    v39[3] = &unk_1E56DF278;
    long long v24 = v23;
    v40 = v24;
    id v25 = v21;
    id v41 = v25;
    ((void (**)(void, PKAsyncOperationState *, id, void *))v14)[2](v14, v18, v22, v39);

    int v11 = 0;
    int v10 = 0;
    int v4 = v38;
    uint64_t v6 = v37;
LABEL_6:

    if ((_BYTE)v50) {
      int v12 = 4;
    }
    else {
      int v12 = 5;
    }
    if ((_BYTE)v50) {
      char v13 = 1;
    }
    else {
      char v13 = v11;
    }
    if (!v11) {
      int v10 = v12;
    }
    v7 &= v13;
    _Block_object_dispose(v46, 8);
  }
  while (v10 != 5);
  *v36 = v35;
  if (v4)
  {
    v26 = (void *)MEMORY[0x192FDC630]();
    os_unfair_lock_lock(&self->_lock);
    id v27 = self->_value;
    v28 = (void (**)(void *, BOOL, id, PKAsyncUnaryOperationEvaluator *))_Block_copy(self->_completion);
    BOOL escaped = self->_escaped;
    id value = self->_value;
    self->_id value = 0;

    id completion = self->_completion;
    self->_id completion = 0;

    operations = self->_operations;
    self->_operations = 0;

    os_unfair_lock_unlock(&self->_lock);
    if (v28)
    {
      v33 = self;
      v28[2](v28, escaped, v27, v33);
    }
    else
    {
      v33 = 0;
    }
  }
  else
  {
    v33 = 0;
  }

  return v7;
}

- (void)dealloc
{
  if (self->_completion)
  {
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_crashed);
    if ((v3 & 1) == 0) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"PKAsyncUnaryOperationEvaluator (%p): implementation error - deallocated before pipeline completed.", self);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)PKAsyncUnaryOperationEvaluator;
  [(PKAsyncUnaryOperationEvaluator *)&v4 dealloc];
}

- (BOOL)isCanceled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_canceled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (PKAsyncUnaryOperationEvaluator)init
{
  return 0;
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_canceled || (self->_canceled = 1, (runningOperationState = self->_runningOperationState) == 0)) {
    v5 = 0;
  }
  else {
    v5 = runningOperationState;
  }
  os_unfair_lock_unlock(p_lock);
  [(PKAsyncOperationState *)v5 _cancel];
}

uint64_t __51__PKAsyncUnaryOperationEvaluator__performOperation__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 1);
}

@end