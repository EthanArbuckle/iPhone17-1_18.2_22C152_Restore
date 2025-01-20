@interface TRIAggregateFetchRecordsProgress
- (TRIAggregateFetchRecordsProgress)initWithProgressBlock:(id)a3;
- (TRIAggregateFetchRecordsProgress)initWithProgressBlockForTesting:(id)a3 guardedData:(id)a4 lock:(id)a5 dispatchQueue:(id)a6;
- (double)_fractionCompletedWithGuardedData:(id)a3;
- (double)fractionCompleted;
- (void)_issueCurrentProgressWithGuardedData:(id)a3;
- (void)registerMAAsset:(id)a3 withExpectedSize:(unint64_t)a4;
- (void)registerRecordId:(id)a3 withExpectedSize:(unint64_t)a4;
- (void)setComplete;
- (void)setFractionCompleted:(double)a3 forMAAsset:(id)a4;
- (void)setFractionCompleted:(double)a3 forRecordId:(id)a4;
- (void)unregisterMAAsset:(id)a3;
- (void)unregisterRecordId:(id)a3;
@end

@implementation TRIAggregateFetchRecordsProgress

- (TRIAggregateFetchRecordsProgress)initWithProgressBlock:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(TRIAggregateFetchRecordsProgressGuardedData);
  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  perCKRecordProgress = v5->perCKRecordProgress;
  v5->perCKRecordProgress = v6;

  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  perMARecordProgress = v5->perMARecordProgress;
  v5->perMARecordProgress = v8;

  v5->expectedTotalBytes = 0;
  v5->actualBytesTransferred = 0;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v5];
  v11 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.trial.aggregate-progress" qosClass:17];
  v12 = [(TRIAggregateFetchRecordsProgress *)self initWithProgressBlockForTesting:v4 guardedData:v5 lock:v10 dispatchQueue:v11];

  return v12;
}

- (TRIAggregateFetchRecordsProgress)initWithProgressBlockForTesting:(id)a3 guardedData:(id)a4 lock:(id)a5 dispatchQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TRIAggregateFetchRecordsProgress;
  v14 = [(TRIAggregateFetchRecordsProgress *)&v18 init];
  if (v14)
  {
    uint64_t v15 = MEMORY[0x1E016EA80](v10);
    id progress = v14->_progress;
    v14->_id progress = (id)v15;

    objc_storeStrong((id *)&v14->_lock, a5);
    objc_storeStrong((id *)&v14->_queue, a6);
    [(TRIAggregateFetchRecordsProgress *)v14 _issueCurrentProgressWithGuardedData:v11];
  }

  return v14;
}

- (double)_fractionCompletedWithGuardedData:(id)a3
{
  unint64_t v3 = *((void *)a3 + 3);
  if (v3) {
    double v4 = (double)*((unint64_t *)a3 + 4) / (double)v3;
  }
  else {
    double v4 = 0.0;
  }
  return fmin(v4, 1.0);
}

- (void)_issueCurrentProgressWithGuardedData:(id)a3
{
  [(TRIAggregateFetchRecordsProgress *)self _fractionCompletedWithGuardedData:a3];
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__TRIAggregateFetchRecordsProgress__issueCurrentProgressWithGuardedData___block_invoke;
  v6[3] = &unk_1E6BB8450;
  v6[4] = self;
  v6[5] = v5;
  dispatch_async(queue, v6);
}

uint64_t __73__TRIAggregateFetchRecordsProgress__issueCurrentProgressWithGuardedData___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, double))(*(void *)(*(void *)(a1 + 32) + 8) + 16))(*(void *)(*(void *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (void)registerRecordId:(id)a3 withExpectedSize:(unint64_t)a4
{
  id v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__TRIAggregateFetchRecordsProgress_registerRecordId_withExpectedSize___block_invoke;
  v9[3] = &unk_1E6BBA170;
  id v11 = self;
  unint64_t v12 = a4;
  id v10 = v6;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v9];
}

void __70__TRIAggregateFetchRecordsProgress_registerRecordId_withExpectedSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a2;
  double v4 = [v3[1] objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v4)
  {
    uint64_t v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "Registering duplicate progress for CKRecordID %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    id v6 = [[TRICKRecordProgress alloc] initWithSize:*(void *)(a1 + 48) transferred:0];
    [v3[1] setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];

    v3[3] = (char *)v3[3] + *(void *)(a1 + 48);
    [*(id *)(a1 + 40) _issueCurrentProgressWithGuardedData:v3];
  }
}

- (void)unregisterRecordId:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__TRIAggregateFetchRecordsProgress_unregisterRecordId___block_invoke;
  v7[3] = &unk_1E6BBA198;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __55__TRIAggregateFetchRecordsProgress_unregisterRecordId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v5 = a2;
  unint64_t v3 = [v5[1] objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v4 = v3;
  if (v3)
  {
    v5[3] = (char *)v5[3] - [v3 size];
    v5[4] = (char *)v5[4] - [v4 transferred];
    [v5[1] setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) _issueCurrentProgressWithGuardedData:v5];
  }
}

- (void)setFractionCompleted:(double)a3 forRecordId:(id)a4
{
  id v6 = a4;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__TRIAggregateFetchRecordsProgress_setFractionCompleted_forRecordId___block_invoke;
  v9[3] = &unk_1E6BBA170;
  double v12 = a3;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v9];
}

void __69__TRIAggregateFetchRecordsProgress_setFractionCompleted_forRecordId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a2;
  id v4 = [v3[1] objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(v4, "copyWithReplacementTransferred:", (unint64_t)(*(double *)(a1 + 48) * (double)(unint64_t)objc_msgSend(v4, "size")));
    [v3[1] setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];
    v3[4] = (char *)v3[4] - [v5 transferred];
    v3[4] = (char *)v3[4] + [v6 transferred];
    [*(id *)(a1 + 40) _issueCurrentProgressWithGuardedData:v3];
  }
  else
  {
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Unable to set progress for unexpected CKRecordID %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)registerMAAsset:(id)a3 withExpectedSize:(unint64_t)a4
{
  id v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__TRIAggregateFetchRecordsProgress_registerMAAsset_withExpectedSize___block_invoke;
  v9[3] = &unk_1E6BBA170;
  id v11 = self;
  unint64_t v12 = a4;
  id v10 = v6;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v9];
}

void __69__TRIAggregateFetchRecordsProgress_registerMAAsset_withExpectedSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a2;
  id v4 = [v3[2] objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v4)
  {
    uint64_t v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "Registering duplicate progress for MA asset ID %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    id v6 = [[TRICKRecordProgress alloc] initWithSize:*(void *)(a1 + 48) transferred:0];
    [v3[2] setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];

    v3[3] = (char *)v3[3] + *(void *)(a1 + 48);
    [*(id *)(a1 + 40) _issueCurrentProgressWithGuardedData:v3];
  }
}

- (void)unregisterMAAsset:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__TRIAggregateFetchRecordsProgress_unregisterMAAsset___block_invoke;
  v7[3] = &unk_1E6BBA198;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __54__TRIAggregateFetchRecordsProgress_unregisterMAAsset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v5 = a2;
  unint64_t v3 = [v5[2] objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v4 = v3;
  if (v3)
  {
    v5[3] = (char *)v5[3] - [v3 size];
    v5[4] = (char *)v5[4] - [v4 transferred];
    [v5[2] setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) _issueCurrentProgressWithGuardedData:v5];
  }
}

- (void)setFractionCompleted:(double)a3 forMAAsset:(id)a4
{
  id v6 = a4;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__TRIAggregateFetchRecordsProgress_setFractionCompleted_forMAAsset___block_invoke;
  v9[3] = &unk_1E6BBA170;
  double v12 = a3;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v9];
}

void __68__TRIAggregateFetchRecordsProgress_setFractionCompleted_forMAAsset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a2;
  id v4 = [v3[2] objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(v4, "copyWithReplacementTransferred:", (unint64_t)(*(double *)(a1 + 48) * (double)(unint64_t)objc_msgSend(v4, "size")));
    [v3[2] setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];
    v3[4] = (char *)v3[4] - [v5 transferred];
    v3[4] = (char *)v3[4] + [v6 transferred];
    [*(id *)(a1 + 40) _issueCurrentProgressWithGuardedData:v3];
  }
  else
  {
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Unable to set progress for unexpected MA asset ID %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)setComplete
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__TRIAggregateFetchRecordsProgress_setComplete__block_invoke;
  block[3] = &unk_1E6BB82F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __47__TRIAggregateFetchRecordsProgress_setComplete__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(*(void *)(a1 + 32) + 8) + 16))(1.0);
}

- (double)fractionCompleted
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__TRIAggregateFetchRecordsProgress_fractionCompleted__block_invoke;
  v5[3] = &unk_1E6BBA1C0;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__TRIAggregateFetchRecordsProgress_fractionCompleted__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _fractionCompletedWithGuardedData:a2];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_progress, 0);
}

@end