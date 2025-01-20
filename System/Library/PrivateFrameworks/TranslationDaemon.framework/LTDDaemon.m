@interface LTDDaemon
@end

@implementation LTDDaemon

void __41___LTDDaemon__setupMemoryWarningListener__block_invoke(uint64_t a1)
{
  dispatch_source_t v2 = dispatch_source_create(MEMORY[0x263EF83D8], 0, 7uLL, MEMORY[0x263EF83A0]);
  v3 = (void *)_setupMemoryWarningListener_memoryNotificationSource;
  _setupMemoryWarningListener_memoryNotificationSource = (uint64_t)v2;

  v4 = _setupMemoryWarningListener_memoryNotificationSource;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __41___LTDDaemon__setupMemoryWarningListener__block_invoke_2;
  handler[3] = &unk_265545E20;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_source_set_event_handler(v4, handler);
  dispatch_resume((dispatch_object_t)_setupMemoryWarningListener_memoryNotificationSource);
  objc_destroyWeak(&v6);
}

void __41___LTDDaemon__setupMemoryWarningListener__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uintptr_t data = dispatch_source_get_data((dispatch_source_t)_setupMemoryWarningListener_memoryNotificationSource);
    v3 = _LTOSLogXPC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      uintptr_t v6 = data;
      _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_DEFAULT, "Memory pressure warning level %lu", (uint8_t *)&v5, 0xCu);
    }
    if (data == 4 || data == 2) {
      [WeakRetained[5] notifyOfMemoryPressure];
    }
  }
}

void __37___LTDDaemon_clientConnectionClosed___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[4] removeObject:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

@end