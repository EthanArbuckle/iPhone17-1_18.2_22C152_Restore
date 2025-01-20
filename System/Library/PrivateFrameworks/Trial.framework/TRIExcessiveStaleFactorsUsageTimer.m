@interface TRIExcessiveStaleFactorsUsageTimer
- (TRIExcessiveStaleFactorsUsageTimer)initWithNamespaceName:(id)a3 delayTimeInSeconds:(double)a4 block:(id)a5;
- (void)invalidate;
@end

@implementation TRIExcessiveStaleFactorsUsageTimer

- (TRIExcessiveStaleFactorsUsageTimer)initWithNamespaceName:(id)a3 delayTimeInSeconds:(double)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)TRIExcessiveStaleFactorsUsageTimer;
  v10 = [(TRIExcessiveStaleFactorsUsageTimer *)&v27 init];
  if (v10)
  {
    v11 = objc_opt_new();
    v12 = dispatch_get_global_queue(9, 0);
    v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v12);

    dispatch_time_t v14 = [MEMORY[0x1E4F93B18] dispatchTimeWithSecondsFromNow:a4];
    dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * (v14 / 0x5A0));
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __85__TRIExcessiveStaleFactorsUsageTimer_initWithNamespaceName_delayTimeInSeconds_block___block_invoke;
    v24 = &unk_1E596A820;
    id v26 = v9;
    id v25 = v8;
    dispatch_source_set_event_handler(v13, &v21);
    v15 = (void *)v11[1];
    v11[1] = v13;
    v16 = v13;

    dispatch_resume(v16);
    id v17 = objc_alloc(MEMORY[0x1E4F93B70]);
    uint64_t v18 = objc_msgSend(v17, "initWithGuardedData:", v11, v21, v22, v23, v24);

    lock = v10->_lock;
    v10->_lock = (_PASLock *)v18;
  }
  return v10;
}

uint64_t __85__TRIExcessiveStaleFactorsUsageTimer_initWithNamespaceName_delayTimeInSeconds_block___block_invoke(uint64_t a1)
{
  v2 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D909000, v2, OS_LOG_TYPE_DEFAULT, "Stale factor timer fired", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)invalidate
{
}

void __48__TRIExcessiveStaleFactorsUsageTimer_invalidate__block_invoke(uint64_t a1, void *a2)
{
  v2 = a2[1];
  if (v2)
  {
    v4 = a2;
    dispatch_source_cancel(v2);
    id v5 = (id)a2[1];
    a2[1] = 0;
  }
}

- (void).cxx_destruct
{
}

@end