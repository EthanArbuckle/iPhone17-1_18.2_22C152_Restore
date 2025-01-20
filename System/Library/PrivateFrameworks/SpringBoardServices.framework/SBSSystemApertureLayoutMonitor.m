@interface SBSSystemApertureLayoutMonitor
- (SBSSystemApertureLayoutMonitor)init;
- (void)addObserver:(id)a3;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)systemApertureLayoutDidChange:(id)a3;
@end

@implementation SBSSystemApertureLayoutMonitor

- (SBSSystemApertureLayoutMonitor)init
{
  v23.receiver = self;
  v23.super_class = (Class)SBSSystemApertureLayoutMonitor;
  v3 = [(SBSSystemApertureLayoutMonitor *)&v23 init];
  if (v3)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    v4 = [MEMORY[0x1E4F28B50] mainBundle];
    v5 = [v4 bundleIdentifier];
    int v6 = [v5 isEqualToString:@"com.apple.springboard"];

    if (v6)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, v3, @"SBSSystemApertureLayoutMonitor.m", 42, @"Within SpringBoard, use SBSystemApertureLayoutDidChangeNotification." object file lineNumber description];
    }
    v3->_isValid = 1;
    uint64_t v7 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    observers = v3->_observers;
    v3->_observers = (NSPointerArray *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v10 = BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v10;

    v12 = (void *)MEMORY[0x1E4F50BB8];
    v13 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    v14 = +[SBSSystemApertureLayoutMonitorServiceSpecification identifier];
    v15 = [v12 endpointForMachName:v13 service:v14 instance:0];

    uint64_t v16 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v15];
    connection = v3->_connection;
    v3->_connection = (BSServiceConnection *)v16;

    v18 = v3->_connection;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __38__SBSSystemApertureLayoutMonitor_init__block_invoke;
    v21[3] = &unk_1E566B118;
    v22 = v3;
    [(BSServiceConnection *)v18 configureConnection:v21];
    [(BSServiceConnection *)v3->_connection activate];
  }
  return v3;
}

void __38__SBSSystemApertureLayoutMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = +[SBSSystemApertureLayoutMonitorServiceSpecification interface];
  [v5 setInterface:v3];

  [v5 setInterfaceTarget:*(void *)(a1 + 32)];
  v4 = +[SBSSystemApertureLayoutMonitorServiceSpecification serviceQuality];
  [v5 setServiceQuality:v4];

  [v5 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  [v5 setInvalidationHandler:&__block_literal_global_47];
  [v5 setInterruptionHandler:&__block_literal_global_16];
}

void __38__SBSSystemApertureLayoutMonitor_init__block_invoke_2()
{
  v0 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __38__SBSSystemApertureLayoutMonitor_init__block_invoke_2_cold_1(v0);
  }
}

void __38__SBSSystemApertureLayoutMonitor_init__block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __38__SBSSystemApertureLayoutMonitor_init__block_invoke_14_cold_1(v3);
  }

  [v2 activate];
}

- (void)invalidate
{
  [(BSServiceConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  [(NSPointerArray *)self->_observers compact];
  while ([(NSPointerArray *)self->_observers count])
    [(NSPointerArray *)self->_observers removePointerAtIndex:[(NSPointerArray *)self->_observers count] - 1];
  self->_isValid = 0;
}

- (void)addObserver:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(NSPointerArray *)self->_observers compact];
  NSUInteger v4 = [(NSPointerArray *)self->_observers count];
  if (v4)
  {
    NSUInteger v5 = v4;
    uint64_t v6 = 0;
    while ([(NSPointerArray *)self->_observers pointerAtIndex:v6] != v7)
    {
      if (v5 == ++v6) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    [(NSPointerArray *)self->_observers addPointer:v7];
    if ([(NSArray *)self->_frames count]) {
      [v7 systemApertureLayoutDidChange:self->_frames];
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(NSPointerArray *)self->_observers compact];
  NSUInteger v4 = [(NSPointerArray *)self->_observers count];
  if (v4)
  {
    NSUInteger v5 = v4;
    uint64_t v6 = 0;
    while ([(NSPointerArray *)self->_observers pointerAtIndex:v6] != v7)
    {
      if (v5 == ++v6) {
        goto LABEL_7;
      }
    }
    [(NSPointerArray *)self->_observers removePointerAtIndex:v6];
  }
LABEL_7:
}

- (void)systemApertureLayoutDidChange:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__SBSSystemApertureLayoutMonitor_systemApertureLayoutDidChange___block_invoke;
  v6[3] = &unk_1E566BB08;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __64__SBSSystemApertureLayoutMonitor_systemApertureLayoutDidChange___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 32) isEqualToArray:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 40) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v2;

    [*(id *)(*(void *)(a1 + 32) + 24) compact];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 systemApertureLayoutDidChange:*(void *)(*(void *)(a1 + 32) + 32)];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __38__SBSSystemApertureLayoutMonitor_init__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "SBSSystemApertureLayoutMonitor connection invalidated remotely; Layout monitoring terminated. (Do you have the requi"
    "red entitlement?)",
    v1,
    2u);
}

void __38__SBSSystemApertureLayoutMonitor_init__block_invoke_14_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "SBSSystemApertureLayoutMonitor connection interrupted. Reactivating connection.", v1, 2u);
}

@end