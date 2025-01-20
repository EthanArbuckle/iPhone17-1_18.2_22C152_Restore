@interface TRICancelableMAOperation
- (BOOL)isCanceled;
- (TRICancelableMAOperation)init;
- (void)addSemaphore:(id)a3;
- (void)cancel;
- (void)setCurrentAsset:(id)a3;
@end

@implementation TRICancelableMAOperation

- (TRICancelableMAOperation)init
{
  v10.receiver = self;
  v10.super_class = (Class)TRICancelableMAOperation;
  v2 = [(TRICancelableMAOperation *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    *(_WORD *)(v3 + 8) = 0;
    uint64_t v4 = objc_opt_new();
    v5 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v4;

    *(unsigned char *)(v3 + 24) = 0;
    v6 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v3];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v7;
  }
  return v2;
}

- (void)addSemaphore:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__TRICancelableMAOperation_addSemaphore___block_invoke;
  v7[3] = &unk_1E6BBB700;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

intptr_t __41__TRICancelableMAOperation_addSemaphore___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 24)) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else {
    return [*(id *)(a2 + 16) addObject:*(void *)(a1 + 32)];
  }
}

- (BOOL)isCanceled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__TRICancelableMAOperation_isCanceled__block_invoke;
  v5[3] = &unk_1E6BBB728;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__TRICancelableMAOperation_isCanceled__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 24);
  return result;
}

- (void)cancel
{
}

void __34__TRICancelableMAOperation_cancel__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  id v3 = v2;
  if (!v2[24])
  {
    v2[24] = 1;
    id v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*((unsigned char *)v3 + 8)) {
        v5 = @"due to deferral";
      }
      else {
        v5 = &stru_1F3455898;
      }
      *(_DWORD *)buf = 138543362;
      v21 = v5;
      _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "MA asset download activity was cancelled %{public}@", buf, 0xCu);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = *((id *)v3 + 2);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((void *)&v15 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    [*((id *)v3 + 2) removeAllObjects];
    v11 = objc_opt_new();
    v12 = [*((id *)v3 + 4) assetSelector];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __34__TRICancelableMAOperation_cancel__block_invoke_459;
    v13[3] = &unk_1E6BB9900;
    id v14 = v3;
    [v11 cancelActivityForSelector:v12 completion:v13];
  }
}

void __34__TRICancelableMAOperation_cancel__block_invoke_459(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = TRILogCategory_Server();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 32) assetSelector];
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Upon fetch operation being cancelled, failed to cancel activity for MAAutoAsset %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 32) assetSelector];
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "Upon fetch operation being cancelled, cancelled activity for MAAutoAsset: %{public}@", (uint8_t *)&v8, 0xCu);
    goto LABEL_6;
  }
}

- (void)setCurrentAsset:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__TRICancelableMAOperation_setCurrentAsset___block_invoke;
  v7[3] = &unk_1E6BBB700;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __44__TRICancelableMAOperation_setCurrentAsset___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void).cxx_destruct
{
}

@end