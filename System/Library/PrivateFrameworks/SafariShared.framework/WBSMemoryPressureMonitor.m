@interface WBSMemoryPressureMonitor
- (BOOL)pressured;
- (WBSMemoryPressureMonitor)init;
- (void)dealloc;
- (void)setPressured:(BOOL)a3;
@end

@implementation WBSMemoryPressureMonitor

- (void).cxx_destruct
{
}

- (BOOL)pressured
{
  return self->_pressured;
}

- (WBSMemoryPressureMonitor)init
{
  v13.receiver = self;
  v13.super_class = (Class)WBSMemoryPressureMonitor;
  id v2 = [(WBSMemoryPressureMonitor *)&v13 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    id v3 = [NSString stringWithFormat:@"com.apple.SafariShared.%@.%p.queue", objc_opt_class(), v2];
    v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);

    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 0x37uLL, v4);
    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    v7 = *((void *)v2 + 1);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __32__WBSMemoryPressureMonitor_init__block_invoke;
    handler[3] = &unk_1E5C8E0B0;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 1));
    id v8 = v2;
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }

  return (WBSMemoryPressureMonitor *)v2;
}

- (void)dealloc
{
  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource) {
    dispatch_source_cancel(memoryPressureSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)WBSMemoryPressureMonitor;
  [(WBSMemoryPressureMonitor *)&v4 dealloc];
}

void __32__WBSMemoryPressureMonitor_init__block_invoke(uint64_t a1)
{
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    int64_t data = dispatch_source_get_data(WeakRetained[1]);
    uint64_t v4 = data;
    if (data <= 3)
    {
      if (data == 1)
      {
        v32 = WBS_LOG_CHANNEL_PREFIXMemory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6B5F000, v32, OS_LOG_TYPE_INFO, "The system memory pressure condition has returned to normal", buf, 2u);
        }
        v30 = v2;
        uint64_t v31 = 0;
        goto LABEL_20;
      }
      if (data == 2)
      {
        objc_super v13 = WBS_LOG_CHANNEL_PREFIXMemory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v34[0] = 0;
          _os_log_impl(&dword_1A6B5F000, v13, OS_LOG_TYPE_DEFAULT, "The system memory pressure condition has changed to warning", (uint8_t *)v34, 2u);
        }
        goto LABEL_16;
      }
    }
    else
    {
      switch(data)
      {
        case 4:
          v14 = WBS_LOG_CHANNEL_PREFIXMemory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            __32__WBSMemoryPressureMonitor_init__block_invoke_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
          }
          goto LABEL_16;
        case 16:
          v22 = WBS_LOG_CHANNEL_PREFIXMemory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            __32__WBSMemoryPressureMonitor_init__block_invoke_cold_3(v22, v23, v24, v25, v26, v27, v28, v29);
          }
          goto LABEL_16;
        case 32:
          dispatch_source_t v5 = WBS_LOG_CHANNEL_PREFIXMemory();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
            __32__WBSMemoryPressureMonitor_init__block_invoke_cold_4(v5, v6, v7, v8, v9, v10, v11, v12);
          }
LABEL_16:
          v30 = v2;
          uint64_t v31 = 1;
LABEL_20:
          [(dispatch_source_t *)v30 setPressured:v31];
          goto LABEL_21;
      }
    }
    v33 = WBS_LOG_CHANNEL_PREFIXMemory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      __32__WBSMemoryPressureMonitor_init__block_invoke_cold_1(v4, v33);
    }
  }
LABEL_21:
}

- (void)setPressured:(BOOL)a3
{
  self->_pressured = a3;
}

void __32__WBSMemoryPressureMonitor_init__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "The system memory pressure condition is undefined (%lu)", (uint8_t *)&v2, 0xCu);
}

void __32__WBSMemoryPressureMonitor_init__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __32__WBSMemoryPressureMonitor_init__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __32__WBSMemoryPressureMonitor_init__block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end