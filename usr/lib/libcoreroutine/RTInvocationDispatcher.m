@interface RTInvocationDispatcher
- (BOOL)dispatchPendingInvocations;
- (BOOL)invocationsPending;
- (BOOL)valid;
- (NSMutableArray)pendingInvocations;
- (OS_dispatch_queue)queue;
- (RTInvocationDispatcher)init;
- (RTInvocationDispatcher)initWithQueue:(id)a3;
- (unint64_t)countOfPendingInvocations;
- (void)_enqueueBlock:(id)a3 failureBlock:(id)a4 description:(id)a5;
- (void)enqueueBlock:(id)a3 description:(id)a4;
- (void)enqueueBlock:(id)a3 failureBlock:(id)a4 description:(id)a5;
- (void)removeAllPendingInvocations;
- (void)setPendingInvocations:(id)a3;
- (void)setQueue:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)shutdown;
@end

@implementation RTInvocationDispatcher

- (RTInvocationDispatcher)initWithQueue:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTInvocationDispatcher initWithQueue:]";
      __int16 v15 = 1024;
      int v16 = 89;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)RTInvocationDispatcher;
  v7 = [(RTInvocationDispatcher *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_queue, a3);
    v8->_valid = 1;
    uint64_t v9 = objc_opt_new();
    pendingInvocations = v8->_pendingInvocations;
    v8->_pendingInvocations = (NSMutableArray *)v9;
  }
  return v8;
}

- (unint64_t)countOfPendingInvocations
{
  v2 = [(RTInvocationDispatcher *)self pendingInvocations];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSMutableArray)pendingInvocations
{
  return self->_pendingInvocations;
}

- (RTInvocationDispatcher)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_);
}

- (void)shutdown
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__4;
  v15[4] = __Block_byref_object_dispose__4;
  v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  id v8 = [v4 stringWithFormat:@"%@-%@", v6, v7];
  [v8 UTF8String];
  id v16 = (id)os_transaction_create();

  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v18 = v12;
    __int16 v19 = 2112;
    v20 = v13;
    _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  v10 = [(RTInvocationDispatcher *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__RTInvocationDispatcher_shutdown__block_invoke;
  block[3] = &unk_1E6B90E98;
  block[4] = self;
  block[5] = v15;
  dispatch_async(v10, block);

  _Block_object_dispose(v15, 8);
}

void __34__RTInvocationDispatcher_shutdown__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setValid:0];
  [*(id *)(a1 + 32) dispatchPendingInvocations];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)enqueueBlock:(id)a3 description:(id)a4
{
  v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[[v6 alloc] initWithFormat:v7 arguments:&v10];

  [(RTInvocationDispatcher *)self _enqueueBlock:v8 failureBlock:0 description:v9];
}

- (void)enqueueBlock:(id)a3 failureBlock:(id)a4 description:(id)a5
{
  id v8 = (objc_class *)NSString;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)[[v8 alloc] initWithFormat:v9 arguments:&v13];

  [(RTInvocationDispatcher *)self _enqueueBlock:v11 failureBlock:v10 description:v12];
}

- (void)_enqueueBlock:(id)a3 failureBlock:(id)a4 description:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = (RTInvocationRecord *)a4;
  BOOL v11 = [(RTInvocationDispatcher *)self valid];
  id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (!v10 || v11)
  {
    if (v13)
    {
      int v16 = 138412290;
      id v17 = v9;
      _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "Enqueuing invocation, description, %@", (uint8_t *)&v16, 0xCu);
    }

    v14 = [[RTInvocationRecord alloc] initWithBlock:v8 failureBlock:v10 description:v9];
    __int16 v15 = [(RTInvocationDispatcher *)self pendingInvocations];
    [v15 addObject:v14];

    id v10 = v14;
  }
  else
  {
    if (v13)
    {
      int v16 = 138412290;
      id v17 = v9;
      _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "Dispatcher invalid, invoking failure block, description, %@", (uint8_t *)&v16, 0xCu);
    }

    ((void (*)(RTInvocationRecord *))v10->_failureBlock)(v10);
  }
}

- (BOOL)dispatchPendingInvocations
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(RTInvocationDispatcher *)self pendingInvocations];
  v4 = (void *)[v3 copy];

  id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v25 = [v4 count];
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "Dispatching %lu pending invocations.", buf, 0xCu);
  }

  [(RTInvocationDispatcher *)self removeAllPendingInvocations];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v19 = 0;
    uint64_t v9 = *(void *)v21;
    char v10 = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        BOOL v13 = [(RTInvocationDispatcher *)self valid];
        v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
        if (v13)
        {
          if (v15)
          {
            int v16 = [v12 invocationDescription];
            *(_DWORD *)buf = 134218242;
            uint64_t v25 = v19 + i + 1;
            __int16 v26 = 2112;
            v27 = v16;
            _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "Invocation %lu, action, invoke, description, %@", buf, 0x16u);
          }
          [v12 invoke];
        }
        else
        {
          if (v15)
          {
            id v17 = [v12 invocationDescription];
            *(_DWORD *)buf = 134218242;
            uint64_t v25 = v19 + i + 1;
            __int16 v26 = 2112;
            v27 = v17;
            _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "Invocation %lu, action, failure, description, %@", buf, 0x16u);
          }
          [v12 invokeFailure];
          char v10 = 0;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
      v19 += i;
    }
    while (v8);
  }
  else
  {
    char v10 = 1;
  }

  return v10 & 1;
}

- (void)removeAllPendingInvocations
{
  id v2 = [(RTInvocationDispatcher *)self pendingInvocations];
  [v2 removeAllObjects];
}

- (BOOL)invocationsPending
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(RTInvocationDispatcher *)self pendingInvocations];
    int v7 = 134217984;
    uint64_t v8 = [v6 count];
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "Pending invocation count, %lu", (uint8_t *)&v7, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v4 = [(RTInvocationDispatcher *)self pendingInvocations];
    [v4 enumerateObjectsUsingBlock:&__block_literal_global_3];
  }
  return [(RTInvocationDispatcher *)self countOfPendingInvocations] != 0;
}

void __44__RTInvocationDispatcher_invocationsPending__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = a3 + 1;
    int v7 = [v4 invocationDescription];
    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    BOOL v11 = v7;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "Invocation %lu, %@", (uint8_t *)&v8, 0x16u);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setPendingInvocations:(id)a3
{
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingInvocations, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end