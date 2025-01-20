@interface TRICancelableCKOperation
- (BOOL)isCanceled;
- (TRICancelableCKOperation)initWithOperation:(id)a3;
- (void)addOperation:(id)a3;
- (void)cancel;
@end

@implementation TRICancelableCKOperation

- (TRICancelableCKOperation)initWithOperation:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TRICancelableCKOperation;
  v5 = [(TRICancelableCKOperation *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = objc_opt_new();
    v8 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = v7;

    *(unsigned char *)(v6 + 16) = 0;
    if (v4) {
      [*(id *)(v6 + 8) addObject:v4];
    }
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v6];
    lock = v5->_lock;
    v5->_lock = (_PASLock *)v9;
  }
  return v5;
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__TRICancelableCKOperation_addOperation___block_invoke;
  v7[3] = &unk_1E6BBA280;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __41__TRICancelableCKOperation_addOperation___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 16)) {
    return [*(id *)(a1 + 32) cancel];
  }
  else {
    return [*(id *)(a2 + 8) addObject:*(void *)(a1 + 32)];
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
  v5[2] = __38__TRICancelableCKOperation_isCanceled__block_invoke;
  v5[3] = &unk_1E6BBA2A8;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__TRICancelableCKOperation_isCanceled__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 16);
  return result;
}

- (void)cancel
{
}

void __34__TRICancelableCKOperation_cancel__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v2[1];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "cancel", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [v2[1] removeAllObjects];
  *((unsigned char *)v2 + 16) = 1;
}

- (void).cxx_destruct
{
}

@end