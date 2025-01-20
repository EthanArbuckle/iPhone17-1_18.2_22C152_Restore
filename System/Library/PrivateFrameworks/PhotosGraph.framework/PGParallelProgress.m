@interface PGParallelProgress
- (PGParallelProgress)initWithParallelOperationCount:(unint64_t)a3 progressBlock:(id)a4;
- (id)progressBlockForParallelOperationWithIndex:(unint64_t)a3;
@end

@implementation PGParallelProgress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressValues, 0);
  objc_storeStrong(&self->_progressBlock, 0);
}

- (id)progressBlockForParallelOperationWithIndex:(unint64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PGParallelProgress_progressBlockForParallelOperationWithIndex___block_invoke;
  v5[3] = &unk_1E68ED270;
  v5[4] = self;
  v5[5] = a3;
  v3 = _Block_copy(v5);
  return v3;
}

void __65__PGParallelProgress_progressBlockForParallelOperationWithIndex___block_invoke(uint64_t a1, double a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) count];
  if (*(void *)(a1 + 40) >= v4)
  {
    unint64_t v7 = v4;
    v8 = +[PGLogging sharedLogging];
    v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 134218240;
      uint64_t v12 = v10;
      __int16 v13 = 2048;
      unint64_t v14 = v7;
      _os_log_fault_impl(&dword_1D1805000, v9, OS_LOG_TYPE_FAULT, "Parallel progress index(%lu) out of bounds(%lu)", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    *(float *)&double v5 = a2;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setFloat:atIndex:", v5);
    [*(id *)(*(void *)(a1 + 32) + 24) mean];
    a2 = v6;
  }
  (*(void (**)(double))(*(void *)(*(void *)(a1 + 32) + 16) + 16))(a2);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
}

- (PGParallelProgress)initWithParallelOperationCount:(unint64_t)a3 progressBlock:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGParallelProgress;
  unint64_t v7 = [(PGParallelProgress *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    v9 = _Block_copy(v6);
    id progressBlock = v8->_progressBlock;
    v8->_id progressBlock = v9;

    uint64_t v11 = [MEMORY[0x1E4F71EF8] zerosOfCount:a3];
    progressValues = v8->_progressValues;
    v8->_progressValues = (MAMutableFloatVector *)v11;
  }
  return v8;
}

@end