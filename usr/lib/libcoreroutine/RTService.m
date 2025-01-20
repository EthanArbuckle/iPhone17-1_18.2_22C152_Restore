@interface RTService
- (BOOL)isShuttingDown;
- (id)name;
- (void)_shutdownWithHandler:(id)a3;
- (void)checkInWithHandler:(id)a3;
- (void)setIsShuttingDown:(BOOL)a3;
- (void)setup;
- (void)shutdownWithHandler:(id)a3;
@end

@implementation RTService

- (BOOL)isShuttingDown
{
  return self->_isShuttingDown;
}

- (void)shutdownWithHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__140;
  v20[4] = __Block_byref_object_dispose__140;
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = NSStringFromSelector(a2);
  id v10 = [v6 stringWithFormat:@"%@-%@", v8, v9];
  [v10 UTF8String];
  id v21 = (id)os_transaction_create();

  v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v23 = v15;
    __int16 v24 = 2112;
    v25 = v16;
    _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__RTService_shutdownWithHandler___block_invoke;
  block[3] = &unk_1E6B912E0;
  id v18 = v5;
  v19 = v20;
  block[4] = self;
  id v13 = v5;
  dispatch_async(v12, block);

  _Block_object_dispose(v20, 8);
}

void __33__RTService_shutdownWithHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsShuttingDown:1];
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__RTService_shutdownWithHandler___block_invoke_2;
  v5[3] = &unk_1E6B9B7C8;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 _shutdownWithHandler:v5];
}

void __33__RTService_shutdownWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

- (void)setup
{
  uint64_t v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __18__RTService_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __18__RTService_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)_shutdownWithHandler:(id)a3
{
}

- (void)checkInWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__RTService_checkInWithHandler___block_invoke;
  block[3] = &unk_1E6B90868;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __32__RTService_checkInWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)name
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)setIsShuttingDown:(BOOL)a3
{
  self->_isShuttingDown = a3;
}

@end