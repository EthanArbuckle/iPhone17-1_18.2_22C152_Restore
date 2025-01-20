@interface WFMetricsManager
+ (id)sharedManager;
- (NSMutableDictionary)ssidHashes;
- (NSString)processName;
- (WFMetricsManager)init;
- (void)_submitCAEvent:(id)a3;
- (void)processEvent:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setSsidHashes:(id)a3;
@end

@implementation WFMetricsManager

- (WFMetricsManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)WFMetricsManager;
  v2 = [(WFMetricsManager *)&v13 init];
  if (v2)
  {
    v3 = (__CFString *)WFCopyProcessIdentifier();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
      processName = v2->_processName;
      v2->_processName = &v5->isa;
    }
    else
    {
      v10 = v2->_processName;
      v2->_processName = (NSString *)@"unknown";

      processName = WFLogForCategory(0);
      os_log_type_t v11 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && processName && os_log_type_enabled(processName, v11))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_226071000, processName, v11, "Unable to get process name", v12, 2u);
      }
    }

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    ssidHashes = v2->_ssidHashes;
    v2->_ssidHashes = (NSMutableDictionary *)v7;

    if (v4) {
      CFRelease(v4);
    }
  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_sharedManager;
  return v2;
}

uint64_t __33__WFMetricsManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WFMetricsManager);
  uint64_t v1 = _sharedManager;
  _sharedManager = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)processEvent:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 conformsToProtocol:&unk_26D9FC400])
    {
      [(WFMetricsManager *)self _submitCAEvent:v5];
    }
    else
    {
      v6 = WFLogForCategory(0);
      os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
      {
        int v8 = 138412290;
        v9 = v5;
        _os_log_impl(&dword_226071000, v6, v7, "%@ does not conform to event protocol", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

- (void)_submitCAEvent:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 eventName];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  id v20 = [v3 eventDictionary];
  if (!v4)
  {
    int v8 = WFLogForCategory(0);
    os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v8 || !os_log_type_enabled(v8, v9)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315138;
    v22 = "-[WFMetricsManager _submitCAEvent:]";
    uint64_t v10 = "%s: event name is nil";
    os_log_type_t v11 = v8;
    os_log_type_t v12 = v9;
    uint32_t v13 = 12;
    goto LABEL_17;
  }
  if (!v16[5])
  {
    int v8 = WFLogForCategory(0);
    os_log_type_t v14 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v8 || !os_log_type_enabled(v8, v14)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315394;
    v22 = "-[WFMetricsManager _submitCAEvent:]";
    __int16 v23 = 2112;
    v24 = v4;
    uint64_t v10 = "%s: event is nil for event %@";
    os_log_type_t v11 = v8;
    os_log_type_t v12 = v14;
    uint32_t v13 = 22;
LABEL_17:
    _os_log_impl(&dword_226071000, v11, v12, v10, buf, v13);
LABEL_18:

    goto LABEL_8;
  }
  v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v5 && os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = v16[5];
    *(_DWORD *)buf = 136315650;
    v22 = "-[WFMetricsManager _submitCAEvent:]";
    __int16 v23 = 2112;
    v24 = v4;
    __int16 v25 = 2112;
    uint64_t v26 = v7;
    _os_log_impl(&dword_226071000, v5, v6, "%s: submitting %@ with dictionary %@", buf, 0x20u);
  }

  AnalyticsSendEventLazy();
LABEL_8:
  _Block_object_dispose(&v15, 8);
}

id __35__WFMetricsManager__submitCAEvent___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (NSMutableDictionary)ssidHashes
{
  return self->_ssidHashes;
}

- (void)setSsidHashes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssidHashes, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end