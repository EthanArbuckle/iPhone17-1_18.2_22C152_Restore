@interface SCPreferences
- (BOOL)bypassAlgorithms;
- (BOOL)signalQualityMetricsDisabled;
- (NSUserDefaults)scandiumDefaults;
- (OS_dispatch_queue)queue;
- (SCPreferences)initWithQueue:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBypassAlgorithms:(BOOL)a3;
- (void)setSignalQualityMetricsDisabled:(BOOL)a3;
@end

@implementation SCPreferences

- (SCPreferences)initWithQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SCPreferences;
  v6 = [(SCPreferences *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.scandium"];
    scandiumDefaults = v7->_scandiumDefaults;
    v7->_scandiumDefaults = (NSUserDefaults *)v8;

    [(NSUserDefaults *)v7->_scandiumDefaults addObserver:v7 forKeyPath:@"SignalQualityMetricsDisabled" options:5 context:&v7->_signalQualityMetricsDisabled];
    [(NSUserDefaults *)v7->_scandiumDefaults addObserver:v7 forKeyPath:@"BypassAlgorithms" options:5 context:&v7->_bypassAlgorithms];
    v10 = v7;
  }

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v10 = [a4 valueForKeyPath:v9];
  v11 = sc_get_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v9;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_25BA34000, v11, OS_LOG_TYPE_DEFAULT, "SCPreferences: %{public}@=%{public}@", buf, 0x16u);
  }

  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v13 = sc_get_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SCPreferences observeValueForKeyPath:ofObject:change:context:]((uint64_t)v10, v13);
    }
  }
  else
  {
    objc_super v12 = [(SCPreferences *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__SCPreferences_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_2654A0640;
    v16 = a6;
    block[4] = self;
    id v15 = v10;
    dispatch_async(v12, block);
  }
}

uint64_t __64__SCPreferences_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 48);
  uint64_t v3 = *(void *)(result + 32);
  if (v2 == v3 + 8)
  {
    result = objc_msgSend(*(id *)(result + 32), "setSignalQualityMetricsDisabled:", objc_msgSend(*(id *)(result + 40), "BOOLValue"));
    uint64_t v2 = *(void *)(v1 + 48);
    uint64_t v3 = *(void *)(v1 + 32);
  }
  if (v2 == v3 + 9)
  {
    uint64_t v4 = [*(id *)(v1 + 40) BOOLValue];
    id v5 = *(void **)(v1 + 32);
    return [v5 setBypassAlgorithms:v4];
  }
  return result;
}

- (BOOL)signalQualityMetricsDisabled
{
  return self->_signalQualityMetricsDisabled;
}

- (void)setSignalQualityMetricsDisabled:(BOOL)a3
{
  self->_signalQualityMetricsDisabled = a3;
}

- (BOOL)bypassAlgorithms
{
  return self->_bypassAlgorithms;
}

- (void)setBypassAlgorithms:(BOOL)a3
{
  self->_bypassAlgorithms = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSUserDefaults)scandiumDefaults
{
  return self->_scandiumDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scandiumDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)observeValueForKeyPath:(uint64_t)a1 ofObject:(NSObject *)a2 change:context:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t v4 = objc_opt_class();
  _os_log_error_impl(&dword_25BA34000, a2, OS_LOG_TYPE_ERROR, "SCPreferences: ignoring value of class %@ (only NSNumber is currently supported)", (uint8_t *)&v3, 0xCu);
}

@end