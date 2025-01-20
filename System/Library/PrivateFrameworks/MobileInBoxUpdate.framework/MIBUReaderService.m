@interface MIBUReaderService
- (MIBUDeviceNFC)device;
- (MIBUReaderService)initWithDelegate:(id)a3;
- (MIBUReaderServiceDelegate)delegate;
- (NSOperationQueue)serviceQueue;
- (NSRunLoop)runLoop;
- (OS_dispatch_queue)deviceQueue;
- (void)run;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDeviceQueue:(id)a3;
- (void)setRunLoop:(id)a3;
- (void)setServiceQueue:(id)a3;
- (void)start;
- (void)terminate;
@end

@implementation MIBUReaderService

- (MIBUReaderService)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MIBUReaderService;
  v5 = [(MIBUReaderService *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(MIBUReaderService *)v5 setDelegate:v4];
    [(MIBUReaderService *)v6 setRunLoop:0];
    v7 = objc_alloc_init(MIBUDeviceNFC);
    [(MIBUReaderService *)v6 setDevice:v7];

    id v8 = objc_alloc_init(MEMORY[0x263F08A48]);
    [(MIBUReaderService *)v6 setServiceQueue:v8];

    v9 = [(MIBUReaderService *)v6 serviceQueue];
    [v9 setMaxConcurrentOperationCount:1];

    v10 = [(MIBUReaderService *)v6 serviceQueue];
    [v10 setName:@"com.apple.mobileinboxupdate.service_queue"];

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.mibu_device_queue", MEMORY[0x263EF83A8]);
    [(MIBUReaderService *)v6 setDeviceQueue:v11];
  }
  return v6;
}

- (void)start
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(MIBUReaderService *)v2 serviceQueue];
  uint64_t v4 = [v3 operationCount];

  if (v4)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_10);
    }
    v5 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_2309BC000, v5, OS_LOG_TYPE_DEFAULT, "MIBUService thread already running, ignoring start call...", v8, 2u);
    }
  }
  else
  {
    v6 = [(MIBUReaderService *)v2 serviceQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __26__MIBUReaderService_start__block_invoke;
    v9[3] = &unk_264B96B20;
    v9[4] = v2;
    v7 = [MEMORY[0x263F086D0] blockOperationWithBlock:v9];
    [v6 addOperation:v7];
  }
  objc_sync_exit(v2);
}

uint64_t __26__MIBUReaderService_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) run];
}

void __26__MIBUReaderService_start__block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)terminate
{
  BOOL v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(MIBUReaderService *)v2 serviceQueue];
  uint64_t v4 = [v3 operationCount];

  if (v4)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_20);
    }
    uint64_t v5 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2309BC000, v5, OS_LOG_TYPE_DEFAULT, "Terminating MobileInBoxUpdate service thread...", buf, 2u);
    }
    uint64_t v6 = [(MIBUReaderService *)v2 runLoop];
    CFRunLoopStop(v6);

    uint64_t v7 = [(MIBUReaderService *)v2 device];
    [v7 endSession];

    uint64_t v8 = [(MIBUReaderService *)v2 serviceQueue];
    [v8 waitUntilAllOperationsAreFinished];
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_23);
    }
    uint64_t v9 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2309BC000, v9, OS_LOG_TYPE_DEFAULT, "MIBUService thread not running, ignoring termination call...", v10, 2u);
    }
  }
  objc_sync_exit(v2);
}

void __30__MIBUReaderService_terminate__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __30__MIBUReaderService_terminate__block_invoke_21()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)run
{
  objc_initWeak(&location, self);
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_25_0);
  }
  uint64_t v3 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2309BC000, v3, OS_LOG_TYPE_DEFAULT, "MobileInBoxUpdate service thread started", buf, 2u);
  }
  uint64_t v4 = [(MIBUReaderService *)self deviceQueue];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __24__MIBUReaderService_run__block_invoke_26;
  dispatch_queue_t v11 = &unk_264B96B48;
  objc_copyWeak(&v13, &location);
  v12 = self;
  dispatch_async(v4, &v8);

  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_31_1);
  }
  uint64_t v5 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2309BC000, v5, OS_LOG_TYPE_DEFAULT, "Starting run loop", buf, 2u);
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF9F0], "currentRunLoop", v8, v9, v10, v11);
  [(MIBUReaderService *)self setRunLoop:v6];

  uint64_t v7 = [(MIBUReaderService *)self runLoop];
  [v7 run];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __24__MIBUReaderService_run__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __24__MIBUReaderService_run__block_invoke_26(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [*(id *)(a1 + 32) device];
  int v4 = [v3 startSession];

  if (v4)
  {
    uint64_t v5 = [WeakRetained delegate];
    uint64_t v6 = [*(id *)(a1 + 32) device];
    [v5 deviceDidConnect:v6];
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_28_1);
    }
    uint64_t v7 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      __24__MIBUReaderService_run__block_invoke_26_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    v15 = [WeakRetained delegate];
    [v15 deviceDidNotConnect];
  }
}

void __24__MIBUReaderService_run__block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __24__MIBUReaderService_run__block_invoke_29()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (MIBUReaderServiceDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (MIBUDeviceNFC)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSOperationQueue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
}

- (OS_dispatch_queue)deviceQueue
{
  return self->_deviceQueue;
}

- (void)setDeviceQueue:(id)a3
{
}

- (NSRunLoop)runLoop
{
  return self->_runLoop;
}

- (void)setRunLoop:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong((id *)&self->_deviceQueue, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

void __24__MIBUReaderService_run__block_invoke_26_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end