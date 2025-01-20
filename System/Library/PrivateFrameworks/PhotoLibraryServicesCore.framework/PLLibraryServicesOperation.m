@interface PLLibraryServicesOperation
+ (BOOL)shouldSuppressLogging;
+ (id)operationWithName:(id)a3 requiredState:(int64_t)a4 parentProgress:(id)a5 execution:(id)a6;
+ (void)setShouldSuppressLogging:(BOOL)a3;
- (NSProgress)progress;
- (NSString)logPrefix;
- (NSString)statusDescription;
- (PLLibraryServicesOperation)init;
- (id)cancellationBlock;
- (id)debugDescription;
- (int64_t)progressPercentOfTotal;
- (int64_t)requiredState;
- (void)_runOperationBlock:(id)a3;
- (void)_safeRemoveCancellationObserver;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCancellationBlock:(id)a3;
- (void)setExecutionBlockFromOperationBlock:(id)a3;
- (void)setLogPrefix:(id)a3;
- (void)setProgress:(id)a3;
- (void)setProgressPercentOfTotal:(int64_t)a3;
- (void)setRequiredState:(int64_t)a3;
@end

@implementation PLLibraryServicesOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_cancellationBlock, 0);
}

- (void)setLogPrefix:(id)a3
{
}

- (NSString)logPrefix
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (id)cancellationBlock
{
  return self->_cancellationBlock;
}

- (void)setProgressPercentOfTotal:(int64_t)a3
{
  self->_progressPercentOfTotal = a3;
}

- (int64_t)progressPercentOfTotal
{
  return self->_progressPercentOfTotal;
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setRequiredState:(int64_t)a3
{
  self->_requiredState = a3;
}

- (int64_t)requiredState
{
  return self->_requiredState;
}

- (void)_safeRemoveCancellationObserver
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == @"cancel changed context" && self->_cancellationBlock)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__PLLibraryServicesOperation_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v14[3] = &unk_1E58A1508;
    id v15 = v10;
    id v16 = v12;
    v17 = self;
    PLSafeRunWithUnfairLock(&self->_cancellationLock, v14);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PLLibraryServicesOperation;
    [(PLLibraryServicesOperation *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

void __77__PLLibraryServicesOperation_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"cancelled"])
  {
    v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
    int v3 = [v2 BOOLValue];

    v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    int v5 = [v4 BOOLValue];

    if (!v3 && v5 != 0)
    {
      uint64_t v7 = *(void *)(a1 + 48);
      if (!*(unsigned char *)(v7 + 276))
      {
        *(unsigned char *)(v7 + 276) = 1;
        v8 = *(void (**)(void))(*(void *)(*(void *)(a1 + 48) + 264) + 16);
        v8();
      }
    }
  }
}

- (void)setCancellationBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PLLibraryServicesOperation_setCancellationBlock___block_invoke;
  v7[3] = &unk_1E58A1F88;
  p_cancellationLock = &self->_cancellationLock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  PLSafeRunWithUnfairLock(p_cancellationLock, v7);
}

void __51__PLLibraryServicesOperation_setCancellationBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 264);
  uint64_t v3 = MEMORY[0x19F38F770](*(void *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(v4 + 264);
  *(void *)(v4 + 264) = v3;

  if (*(void *)(a1 + 40))
  {
    if (!v2)
    {
      id v6 = *(void **)(a1 + 32);
      [v6 addObserver:v6 forKeyPath:@"cancelled" options:3 context:@"cancel changed context"];
    }
  }
  else if (v2)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    [v7 _safeRemoveCancellationObserver];
  }
}

- (NSString)statusDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(PLLibraryServicesOperation *)self name];
  int v5 = [(PLLibraryServicesOperation *)self progress];
  [v5 fractionCompleted];
  uint64_t v7 = v6;
  int64_t v8 = [(PLLibraryServicesOperation *)self progressPercentOfTotal];
  v9 = PLStringFromLibraryServicesState([(PLLibraryServicesOperation *)self requiredState]);
  uint64_t v10 = [(PLLibraryServicesOperation *)self qualityOfService];
  if (v10 <= 16)
  {
    if (v10 == -1)
    {
      id v11 = @"NSQualityOfServiceDefault";
      goto LABEL_13;
    }
    if (v10 == 9)
    {
      id v11 = @"NSQualityOfServiceBackground";
      goto LABEL_13;
    }
  }
  else
  {
    switch(v10)
    {
      case 17:
        id v11 = @"NSQualityOfServiceUtility";
        goto LABEL_13;
      case 33:
        id v11 = @"NSQualityOfServiceUserInteractive";
        goto LABEL_13;
      case 25:
        id v11 = @"NSQualityOfServiceUserInitiated";
        goto LABEL_13;
    }
  }
  id v11 = @"Unknown";
LABEL_13:
  id v12 = v11;
  objc_super v13 = [v3 stringWithFormat:@"'%@' (progress=%1.1f units=%ld req=%@ qos=%@)", v4, v7, v8, v9, v12];

  return (NSString *)v13;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)PLLibraryServicesOperation;
  uint64_t v4 = [(PLLibraryServicesOperation *)&v12 description];
  int64_t v5 = [(PLLibraryServicesOperation *)self progressPercentOfTotal];
  uint64_t v6 = PLStringFromLibraryServicesState([(PLLibraryServicesOperation *)self requiredState]);
  uint64_t v7 = [(PLLibraryServicesOperation *)self qualityOfService];
  if (v7 <= 16)
  {
    if (v7 == -1)
    {
      int64_t v8 = @"NSQualityOfServiceDefault";
      goto LABEL_13;
    }
    if (v7 == 9)
    {
      int64_t v8 = @"NSQualityOfServiceBackground";
      goto LABEL_13;
    }
  }
  else
  {
    switch(v7)
    {
      case 17:
        int64_t v8 = @"NSQualityOfServiceUtility";
        goto LABEL_13;
      case 33:
        int64_t v8 = @"NSQualityOfServiceUserInteractive";
        goto LABEL_13;
      case 25:
        int64_t v8 = @"NSQualityOfServiceUserInitiated";
        goto LABEL_13;
    }
  }
  int64_t v8 = @"Unknown";
LABEL_13:
  v9 = v8;
  uint64_t v10 = [v3 stringWithFormat:@"%@ progressUnits=%ld req=%@ qos=%@", v4, v5, v6, v9];

  return v10;
}

- (void)_runOperationBlock:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void))a3;
  char v5 = [(id)objc_opt_class() shouldSuppressLogging];
  uint64_t v6 = [(PLLibraryServicesOperation *)self progress];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v8 = v7;
  if ((v5 & 1) == 0)
  {
    v9 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(PLLibraryServicesOperation *)self logPrefix];
      qos_class_t v11 = qos_class_self();
      PLStringFromQoSClass(v11);
      double v12 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      int v23 = 138543874;
      v24 = v10;
      __int16 v25 = 2114;
      v26 = self;
      __int16 v27 = 2114;
      double v28 = v12;
      _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting operation %{public}@ with QoS %{public}@", (uint8_t *)&v23, 0x20u);
    }
  }
  [(PLLibraryServicesOperation *)v6 becomeCurrentWithPendingUnitCount:[(PLLibraryServicesOperation *)v6 totalUnitCount]];
  objc_super v13 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = [(PLLibraryServicesOperation *)self logPrefix];
    int v23 = 138543618;
    v24 = v14;
    __int16 v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_19BCFB000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: progress becoming current: %@", (uint8_t *)&v23, 0x16u);
  }
  v4[2](v4);

  [(PLLibraryServicesOperation *)v6 resignCurrent];
  id v15 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = [(PLLibraryServicesOperation *)self logPrefix];
    int v23 = 138543618;
    v24 = v16;
    __int16 v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_19BCFB000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: progress resigned current: %@", (uint8_t *)&v23, 0x16u);
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  if ((v5 & 1) == 0)
  {
    double v18 = v17;
    v19 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [(PLLibraryServicesOperation *)self logPrefix];
      qos_class_t v21 = qos_class_self();
      v22 = PLStringFromQoSClass(v21);
      int v23 = 138544130;
      v24 = v20;
      __int16 v25 = 2114;
      v26 = self;
      __int16 v27 = 2048;
      double v28 = v18 - v8;
      __int16 v29 = 2114;
      v30 = v22;
      _os_log_impl(&dword_19BCFB000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Completed operation %{public}@ in %f seconds with QoS %{public}@", (uint8_t *)&v23, 0x2Au);
    }
  }
}

- (void)setExecutionBlockFromOperationBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PLLibraryServicesOperation_setExecutionBlockFromOperationBlock___block_invoke;
  v6[3] = &unk_1E58A14E0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(NSBlockOperation *)self addExecutionBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __66__PLLibraryServicesOperation_setExecutionBlockFromOperationBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _runOperationBlock:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  if (self->_cancellationBlock) {
    [(PLLibraryServicesOperation *)self _safeRemoveCancellationObserver];
  }
  v3.receiver = self;
  v3.super_class = (Class)PLLibraryServicesOperation;
  [(NSBlockOperation *)&v3 dealloc];
}

- (PLLibraryServicesOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLLibraryServicesOperation;
  result = [(NSBlockOperation *)&v3 init];
  if (result) {
    result->_cancellationLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (id)operationWithName:(id)a3 requiredState:(int64_t)a4 parentProgress:(id)a5 execution:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  double v12 = objc_alloc_init(PLLibraryServicesOperation);
  [(PLLibraryServicesOperation *)v12 setName:v9];
  [(PLLibraryServicesOperation *)v12 setRequiredState:a4];
  uint64_t v13 = (int)PLProgressPercentForOperationName(v9);
  [(PLLibraryServicesOperation *)v12 setProgressPercentOfTotal:v13];
  v14 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
  [(PLLibraryServicesOperation *)v12 setProgress:v14];

  id v15 = [(PLLibraryServicesOperation *)v12 progress];
  [v11 addChild:v15 withPendingUnitCount:v13];

  id v16 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    double v17 = [(PLLibraryServicesOperation *)v12 progress];
    int v19 = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    v22 = v17;
    _os_log_impl(&dword_19BCFB000, v16, OS_LOG_TYPE_DEBUG, "operation %@ progress: %@", (uint8_t *)&v19, 0x16u);
  }
  [(PLLibraryServicesOperation *)v12 setExecutionBlockFromOperationBlock:v10];

  return v12;
}

+ (BOOL)shouldSuppressLogging
{
  return _shouldSuppressLogging;
}

+ (void)setShouldSuppressLogging:(BOOL)a3
{
  _shouldSuppressLogging = a3;
}

@end