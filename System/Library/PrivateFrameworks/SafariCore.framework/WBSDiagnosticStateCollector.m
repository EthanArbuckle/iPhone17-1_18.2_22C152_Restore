@interface WBSDiagnosticStateCollector
+ (id)registeredStateCollectorWithLogLabel:(id)a3 payloadProvider:(id)a4;
- (BOOL)isRegisteredWithSysdiagnose;
- (NSString)logLabel;
- (WBSDiagnosticStateCollector)initWithLogLabel:(id)a3 payloadProvider:(id)a4;
- (WBSDiagnosticStateCollector)initWithLogLabel:(id)a3 queue:(id)a4 payloadProvider:(id)a5;
- (os_state_data_s)_createOSStateDataWithHints:(os_state_hints_s *)a3;
- (void)dealloc;
- (void)registerWithSysdiagnose;
- (void)setLogLabel:(id)a3;
- (void)unregister;
@end

@implementation WBSDiagnosticStateCollector

+ (id)registeredStateCollectorWithLogLabel:(id)a3 payloadProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithLogLabel:v7 payloadProvider:v6];

  [v8 registerWithSysdiagnose];
  return v8;
}

- (void)registerWithSysdiagnose
{
  self->_stateHandler = os_state_add_handler();
}

- (WBSDiagnosticStateCollector)initWithLogLabel:(id)a3 queue:(id)a4 payloadProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WBSDiagnosticStateCollector;
  v11 = [(WBSDiagnosticStateCollector *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    logLabel = v11->_logLabel;
    v11->_logLabel = (NSString *)v12;

    objc_storeStrong((id *)&v11->_queue, a4);
    uint64_t v14 = [v10 copy];
    id payloadProvider = v11->_payloadProvider;
    v11->_id payloadProvider = (id)v14;

    v16 = v11;
  }

  return v11;
}

- (WBSDiagnosticStateCollector)initWithLogLabel:(id)a3 payloadProvider:(id)a4
{
  return [(WBSDiagnosticStateCollector *)self initWithLogLabel:a3 queue:MEMORY[0x1E4F14428] payloadProvider:a4];
}

- (void)dealloc
{
  [(WBSDiagnosticStateCollector *)self unregister];
  v3.receiver = self;
  v3.super_class = (Class)WBSDiagnosticStateCollector;
  [(WBSDiagnosticStateCollector *)&v3 dealloc];
}

uint64_t __54__WBSDiagnosticStateCollector_registerWithSysdiagnose__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _createOSStateDataWithHints:a2];
}

- (void)unregister
{
  if (self->_stateHandler)
  {
    os_state_remove_handler();
    self->_stateHandler = 0;
  }
}

- (BOOL)isRegisteredWithSysdiagnose
{
  return self->_stateHandler != 0;
}

- (os_state_data_s)_createOSStateDataWithHints:(os_state_hints_s *)a3
{
  if (a3->var2 - 1 < 2) {
    return 0;
  }
  v5 = (*((void (**)(void))self->_payloadProvider + 2))();
  if (v5)
  {
    id v14 = 0;
    id v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:&v14];
    id v7 = v14;
    id v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      size_t v11 = [v6 length];
      uint64_t v12 = (os_state_data_s *)malloc_type_malloc(v11 + 200, 0x9DAC7E8DuLL);
      objc_super v3 = v12;
      if (v12)
      {
        bzero(v12, v11 + 200);
        v3->var0 = 1;
        [(NSString *)self->_logLabel UTF8String];
        __strlcpy_chk();
        v3->var1.var1 = v11;
        memmove(v3->var4, (const void *)[v6 bytes], v11);
      }
    }
    else
    {
      id v10 = WBS_LOG_CHANNEL_PREFIXOther();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(WBSDiagnosticStateCollector *)(uint64_t)self _createOSStateDataWithHints:v8];
      }
      objc_super v3 = 0;
    }
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (NSString)logLabel
{
  return self->_logLabel;
}

- (void)setLogLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logLabel, 0);
  objc_storeStrong(&self->_payloadProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_createOSStateDataWithHints:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = a2;
  id v6 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  int v7 = 138543618;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_error_impl(&dword_1B728F000, v5, OS_LOG_TYPE_ERROR, "Failed to serialize diagnostic state for '%{public}@': %{public}@", (uint8_t *)&v7, 0x16u);
}

@end