@interface RTXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)connectedClients;
- (NSMutableArray)disconnectedClients;
- (NSString)machServiceName;
- (OS_dispatch_queue)queue;
- (RTXPCListener)initWithMachServiceName:(id)a3;
- (void)_setup;
- (void)checkInWithHandler:(id)a3;
- (void)logClients;
- (void)setup;
- (void)shutdownWithHandler:(id)a3;
@end

@implementation RTXPCListener

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (NSMutableArray)connectedClients
{
  return self->_connectedClients;
}

- (void)logClients
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v7 = [(RTXPCListener *)self connectedClients];
    uint64_t v8 = [v7 count];
    v9 = [(RTXPCListener *)self machServiceName];
    int v13 = 134218242;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "%lu clients connected to service, %@", (uint8_t *)&v13, 0x16u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v4 = [(RTXPCListener *)self connectedClients];
    [v4 enumerateObjectsUsingBlock:&__block_literal_global_6];
  }
  v5 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = [(RTXPCListener *)self disconnectedClients];
    uint64_t v11 = [v10 count];
    v12 = [(RTXPCListener *)self machServiceName];
    int v13 = 134218242;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%lu clients not connected to service, %@", (uint8_t *)&v13, 0x16u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v6 = [(RTXPCListener *)self disconnectedClients];
    [v6 enumerateObjectsUsingBlock:&__block_literal_global_6];
  }
}

- (NSMutableArray)disconnectedClients
{
  return self->_disconnectedClients;
}

- (RTXPCListener)initWithMachServiceName:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v21.receiver = self;
    v21.super_class = (Class)RTXPCListener;
    v5 = [(RTXPCListener *)&v21 initWithMachServiceName:v4];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      machServiceName = v5->_machServiceName;
      v5->_machServiceName = (NSString *)v6;

      uint64_t v8 = v5;
      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = (const char *)[(RTXPCListener *)v8 UTF8String];
      }
      else
      {
        id v13 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v8];
        v10 = (const char *)[v13 UTF8String];
      }
      dispatch_queue_t v14 = dispatch_queue_create(v10, v9);

      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v14;

      uint64_t v16 = objc_opt_new();
      connectedClients = v8->_connectedClients;
      v8->_connectedClients = (NSMutableArray *)v16;

      uint64_t v18 = objc_opt_new();
      disconnectedClients = v8->_disconnectedClients;
      v8->_disconnectedClients = (NSMutableArray *)v18;
    }
    self = v5;
    v12 = self;
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[RTXPCListener initWithMachServiceName:]";
      __int16 v24 = 1024;
      int v25 = 29;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: serviceName (in %s:%d)", buf, 0x12u);
    }

    v12 = 0;
  }

  return v12;
}

- (void)_setup
{
  [(RTXPCListener *)self logClients];
  v3 = [(RTXPCListener *)self queue];
  [(RTXPCListener *)self _setQueue:v3];

  [(RTXPCListener *)self setDelegate:self];
  [(RTXPCListener *)self resume];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v5 = [(RTXPCListener *)self machServiceName];
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v5, 0, 0, 1u);
}

- (void)setup
{
  v3 = [(RTXPCListener *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__RTXPCListener_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __22__RTXPCListener_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)shutdownWithHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__8;
  v20[4] = __Block_byref_object_dispose__8;
  uint64_t v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  v9 = NSStringFromSelector(a2);
  id v10 = [v6 stringWithFormat:@"%@-%@", v8, v9];
  [v10 UTF8String];
  id v21 = (id)os_transaction_create();

  uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    dispatch_queue_t v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v23 = v15;
    __int16 v24 = 2112;
    int v25 = v16;
    _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  v12 = [(RTXPCListener *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__RTXPCListener_shutdownWithHandler___block_invoke;
  block[3] = &unk_1E6B912E0;
  id v18 = v5;
  v19 = v20;
  block[4] = self;
  id v13 = v5;
  dispatch_async(v12, block);

  _Block_object_dispose(v20, 8);
}

uint64_t __37__RTXPCListener_shutdownWithHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

void __27__RTXPCListener_logClients__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%lu: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __27__RTXPCListener_logClients__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%lu: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return 0;
}

- (void)checkInWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTXPCListener *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__RTXPCListener_checkInWithHandler___block_invoke;
  block[3] = &unk_1E6B90868;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __36__RTXPCListener_checkInWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disconnectedClients, 0);
  objc_storeStrong((id *)&self->_connectedClients, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_machServiceName, 0);
}

@end