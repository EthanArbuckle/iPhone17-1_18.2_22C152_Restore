@interface _SBSynchronizeOperation
- (NSString)humanReadableDescription;
- (_SBSynchronizeOperation)init;
- (void)addTask:(id)a3;
- (void)main;
- (void)setHumanReadableDescription:(id)a3;
@end

@implementation _SBSynchronizeOperation

- (_SBSynchronizeOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)_SBSynchronizeOperation;
  v2 = [(_SBSynchronizeOperation *)&v8 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    operationGroup = v2->_operationGroup;
    v2->_operationGroup = (OS_dispatch_group *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    tasks = v2->_tasks;
    v2->_tasks = v5;
  }
  return v2;
}

- (void)addTask:(id)a3
{
  id v8 = a3;
  if (([(_SBSynchronizeOperation *)self isFinished] & 1) != 0
    || [(_SBSynchronizeOperation *)self isExecuting])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_SBSynchronizeOperation.m" lineNumber:34 description:@"Cannot add a task to a synchronize operation that has already completed or is currently executing."];
  }
  tasks = self->_tasks;
  v6 = (void *)MEMORY[0x1D948C7A0](v8);
  [(NSMutableArray *)tasks addObject:v6];
}

- (void)main
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  dispatch_group_t v3 = dispatch_group_create();
  BSContinuousMachTimeNow();
  double v5 = v4;
  v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(_SBSynchronizeOperation *)self name];
    *(_DWORD *)buf = 138543362;
    v22 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "SynchronizeCloudCriticalData - operation started: %{public}@", buf, 0xCu);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = self->_tasks;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v10);
  }

  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  BSContinuousMachTimeNow();
  double v14 = v13;
  v15 = SBLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(_SBSynchronizeOperation *)self name];
    *(_DWORD *)buf = 138543618;
    v22 = v16;
    __int16 v23 = 2048;
    double v24 = v14 - v5;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "SynchronizeCloudCriticalData - operation ended: %{public}@ (duration: %fs)", buf, 0x16u);
  }
}

- (NSString)humanReadableDescription
{
  return self->_humanReadableDescription;
}

- (void)setHumanReadableDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_humanReadableDescription, 0);
}

@end