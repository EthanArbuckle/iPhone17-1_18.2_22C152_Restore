@interface SDSignalHandler
+ (void)addMemoryHandler;
+ (void)addSignalHandler;
+ (void)setDelegate:(id)a3 memoryStatusFlags:(unint64_t)a4;
+ (void)setupHandlers;
@end

@implementation SDSignalHandler

+ (void)setDelegate:(id)a3 memoryStatusFlags:(unint64_t)a4
{
  sMemoryStatusFlags = a4;
}

+ (void)setupHandlers
{
  +[SDSignalHandler addSignalHandler];
  +[SDSignalHandler addMemoryHandler];
}

+ (void)addSignalHandler
{
}

uint64_t __35__SDSignalHandler_addSignalHandler__block_invoke()
{
  return signalHandler(2);
}

uint64_t __35__SDSignalHandler_addSignalHandler__block_invoke_2()
{
  return signalHandler(15);
}

uint64_t __35__SDSignalHandler_addSignalHandler__block_invoke_3()
{
  return signalHandler(1);
}

uint64_t __35__SDSignalHandler_addSignalHandler__block_invoke_4()
{
  return signalHandler(30);
}

uint64_t __35__SDSignalHandler_addSignalHandler__block_invoke_5()
{
  return signalHandler(31);
}

+ (void)addMemoryHandler
{
  uintptr_t v2 = sMemoryStatusFlags;
  v3 = dispatch_get_global_queue(2, 2uLL);
  dispatch_source_t v4 = dispatch_source_create(MEMORY[0x263EF83D8], 0, v2, v3);
  v5 = (void *)_memoryStatusSource;
  _memoryStatusSource = (uint64_t)v4;

  if (_memoryStatusSource)
  {
    dispatch_source_set_event_handler((dispatch_source_t)_memoryStatusSource, &__block_literal_global_12);
    v6 = _memoryStatusSource;
    dispatch_activate(v6);
  }
  else
  {
    v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEFAULT, "Creating memory pressure handler failed", v8, 2u);
    }
  }
}

void __35__SDSignalHandler_addMemoryHandler__block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v0 = (id)_memoryStatusSource;
  objc_sync_enter(v0);
  uintptr_t data = dispatch_source_get_data((dispatch_source_t)_memoryStatusSource);
  double v2 = CFAbsoluteTimeGetCurrent() - *(double *)&_block_invoke_lastNotification;
  if (data != _block_invoke_lastStatus || v2 > 30.0)
  {
    dispatch_source_t v4 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      uintptr_t v6 = data;
      _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_DEFAULT, "Memory pressure (%ld)", (uint8_t *)&v5, 0xCu);
    }

    [(id)sSignalHandlerDelegate didReceiveMemoryPressureNotification:data];
  }
  _block_invoke_lastStatus = data;
  _block_invoke_lastNotification = CFAbsoluteTimeGetCurrent();
  objc_sync_exit(v0);
}

@end