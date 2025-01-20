@interface VKNotificationObserver
- (VKNotificationObserver)initWithTarget:(id)a3 taskContext:(const void *)a4;
- (void)_receivedFlushTileCachesNotification;
- (void)_receivedLocalChangedNotification;
- (void)_receivedMemoryNotification;
- (void)_receivedPowerStateDidChangeNotification;
- (void)_receivedThermalStateDidChangeNotification;
- (void)dealloc;
@end

@implementation VKNotificationObserver

- (VKNotificationObserver)initWithTarget:(id)a3 taskContext:(const void *)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)VKNotificationObserver;
  v7 = [(VKNotificationObserver *)&v27 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_target, v6);
    v9 = *(id *)a4;
    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 6uLL, v9);
    memoryNotificationEventSource = v8->_memoryNotificationEventSource;
    v8->_memoryNotificationEventSource = (OS_dispatch_source *)v10;

    objc_initWeak(&location, v8);
    v12 = v8->_memoryNotificationEventSource;
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __53__VKNotificationObserver_initWithTarget_taskContext___block_invoke;
    v24 = &unk_1E5A914C8;
    objc_copyWeak(&v25, &location);
    dispatch_source_set_event_handler(v12, &v21);
    dispatch_resume((dispatch_object_t)v8->_memoryNotificationEventSource);
    v13 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v21, v22, v23, v24);
    [v13 addObserver:v8 selector:sel__receivedMemoryNotification name:@"VKDidReceiveMemoryWarningNotification" object:0];

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v8 selector:sel__receivedFlushTileCachesNotification name:@"VKShouldFlushTileCachesNotification" object:0];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v8 selector:sel__receivedLocalChangedNotification name:*MEMORY[0x1E4F1C370] object:0];

    v16 = [MEMORY[0x1E4F28F80] processInfo];
    [v16 thermalState];

    v17 = [MEMORY[0x1E4F28F80] processInfo];
    [v17 isLowPowerModeEnabled];

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v8 selector:sel__receivedThermalStateDidChangeNotification name:*MEMORY[0x1E4F287F0] object:0];

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v8 selector:sel__receivedPowerStateDidChangeNotification name:*MEMORY[0x1E4F287E8] object:0];

    [(VKNotificationObserver *)v8 _receivedThermalStateDidChangeNotification];
    [(VKNotificationObserver *)v8 _receivedPowerStateDidChangeNotification];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)_receivedThermalStateDidChangeNotification
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained didReceiveThermalStateChanged];
  }
}

- (void)_receivedPowerStateDidChangeNotification
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained didReceivePowerStateChanged];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryNotificationEventSource, 0);
  objc_destroyWeak((id *)&self->_target);
}

- (void)_receivedLocalChangedNotification
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  v3 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
    int v6 = 134217984;
    id v7 = WeakRetained;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "Received system locale changed notification: %p", (uint8_t *)&v6, 0xCu);
  }
  id v5 = objc_loadWeakRetained((id *)&self->_target);
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 didReceiveLocalChanged];
  }
}

- (void)_receivedFlushTileCachesNotification
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  v3 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
    int v6 = 134217984;
    id v7 = WeakRetained;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "Received flush cache notification: %p", (uint8_t *)&v6, 0xCu);
  }
  id v5 = objc_loadWeakRetained((id *)&self->_target);
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 didReceiveFlushTileCaches];
  }
}

- (void)_receivedMemoryNotification
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  v3 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
    int v6 = 134217984;
    id v7 = WeakRetained;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_INFO, "Received memory notification: %p", (uint8_t *)&v6, 0xCu);
  }
  id v5 = objc_loadWeakRetained((id *)&self->_target);
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 didReceiveMemoryWarning];
  }
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_target, 0);
  dispatch_source_set_event_handler((dispatch_source_t)self->_memoryNotificationEventSource, &__block_literal_global_12239);
  memoryNotificationEventSource = self->_memoryNotificationEventSource;
  self->_memoryNotificationEventSource = 0;

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"VKDidReceiveMemoryWarningNotification" object:0];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"VKShouldFlushTileCachesNotification" object:0];

  int v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x1E4F287E8] object:0];

  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self name:*MEMORY[0x1E4F287F0] object:0];

  v9.receiver = self;
  v9.super_class = (Class)VKNotificationObserver;
  [(VKNotificationObserver *)&v9 dealloc];
}

void __53__VKNotificationObserver_initWithTarget_taskContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained _receivedMemoryNotification];
  }
}

@end