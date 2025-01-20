@interface NTKJetsamMonitor
+ (id)sharedJetsamMonitor;
- (NTKJetsamMonitor)init;
- (void)decrementTransactionCount;
- (void)incrementTransactionCount;
@end

@implementation NTKJetsamMonitor

+ (id)sharedJetsamMonitor
{
  if (sharedJetsamMonitor_onceToken != -1) {
    dispatch_once(&sharedJetsamMonitor_onceToken, &__block_literal_global_65_0);
  }
  v2 = (void *)sharedJetsamMonitor_monitor;
  return v2;
}

- (void)decrementTransactionCount
{
  monitorQ = self->_monitorQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NTKJetsamMonitor_decrementTransactionCount__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(monitorQ, block);
}

void __45__NTKJetsamMonitor_decrementTransactionCount__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(v1 + 24);
  if (v2 <= 0)
  {
    v10 = _NTKLoggingObjectForDomain(31, (uint64_t)"NTKLoggingDomainJetsam");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __45__NTKJetsamMonitor_decrementTransactionCount__block_invoke_cold_1(v10);
    }
  }
  else
  {
    int v3 = v2 - 1;
    *(_DWORD *)(v1 + 24) = v3;
    if (!v3)
    {
      v11[0] = 0;
      v11[1] = 0;
      uint64_t v12 = 0;
      [*(id *)(*(void *)(a1 + 32) + 32) getInfo:v11];
      v5 = _NTKLoggingObjectForDomain(31, (uint64_t)"NTKLoggingDomainJetsam");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        double v14 = (float)((float)v11[0] * 0.00097656);
        __int16 v15 = 2048;
        double v16 = (float)((float)v12 * 0.00097656);
        _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "NTKJetsamMonitor: stop logging, footprint = %.3f, max: %.3f", buf, 0x16u);
      }

      uint64_t v6 = *(void *)(a1 + 32);
      v7 = *(void **)(v6 + 16);
      *(void *)(v6 + 16) = 0;

      uint64_t v8 = *(void *)(a1 + 32);
      v9 = *(void **)(v8 + 32);
      *(void *)(v8 + 32) = 0;
    }
  }
}

uint64_t __45__NTKJetsamMonitor_incrementTransactionCount__block_invoke_69(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  v5[1] = 0;
  uint64_t v6 = 0;
  [*(id *)(*(void *)(a1 + 32) + 32) getInfo:v5];
  int v2 = _NTKLoggingObjectForDomain(31, (uint64_t)"NTKLoggingDomainJetsam");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(int *)(*(void *)(a1 + 32) + 24);
    *(_DWORD *)buf = 134218496;
    uint64_t v8 = v3;
    __int16 v9 = 2048;
    double v10 = (float)((float)v5[0] * 0.00097656);
    __int16 v11 = 2048;
    double v12 = (float)((float)v6 * 0.00097656);
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "NTKJetsamMonitor: %ld transactions, footprint = %.3f, max: %.3f", buf, 0x20u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 32) resetInterval];
}

void __39__NTKJetsamMonitor_sharedJetsamMonitor__block_invoke()
{
  if (!sharedJetsamMonitor_monitor)
  {
    uint64_t v0 = objc_opt_new();
    uint64_t v1 = (void *)sharedJetsamMonitor_monitor;
    sharedJetsamMonitor_monitor = v0;
  }
}

- (NTKJetsamMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKJetsamMonitor;
  int v2 = [(NTKJetsamMonitor *)&v7 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v4 = dispatch_queue_create("NTKJetsamMonitorQ", v3);
    monitorQ = v2->_monitorQ;
    v2->_monitorQ = (OS_dispatch_queue *)v4;

    v2->_transactionCount = 0;
  }
  return v2;
}

- (void)incrementTransactionCount
{
  monitorQ = self->_monitorQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NTKJetsamMonitor_incrementTransactionCount__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(monitorQ, block);
}

void __45__NTKJetsamMonitor_incrementTransactionCount__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(v1 + 24);
  *(_DWORD *)(v1 + 24) = v2 + 1;
  if (!v2)
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;

    memset(v16, 0, sizeof(v16));
    [*(id *)(*(void *)(a1 + 32) + 32) getInfo:v16];
    objc_super v7 = _NTKLoggingObjectForDomain(31, (uint64_t)"NTKLoggingDomainJetsam");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v18 = (float)((float)v16[0] * 0.00097656);
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "NTKJetsamMonitor: start logging, footprint = %.3f", buf, 0xCu);
    }

    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
    uint64_t v9 = *(void *)(a1 + 32);
    double v10 = *(void **)(v9 + 16);
    *(void *)(v9 + 16) = v8;

    __int16 v11 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    dispatch_time_t v12 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v11, v12, 0x3B9ACA00uLL, 0x1DCD6500uLL);
    uint64_t v13 = *(void *)(a1 + 32);
    double v14 = *(NSObject **)(v13 + 16);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__NTKJetsamMonitor_incrementTransactionCount__block_invoke_69;
    v15[3] = &unk_1E62BFF20;
    v15[4] = v13;
    dispatch_source_set_event_handler(v14, v15);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetcher, 0);
  objc_storeStrong((id *)&self->_monitorTimer, 0);
  objc_storeStrong((id *)&self->_monitorQ, 0);
}

void __45__NTKJetsamMonitor_decrementTransactionCount__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "NTKJetsamMonitor: trying to decrement beyond zero!", v1, 2u);
}

@end