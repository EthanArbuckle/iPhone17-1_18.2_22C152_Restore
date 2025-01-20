@interface IIMetricsDispatcher
+ (id)sharedInstance;
+ (void)registerXPCActivity;
- (IIMetricsDispatcher)init;
- (void)logMessage:(id)a3 messageName:(id)a4;
- (void)registerEnrichmentProvider:(id)a3;
- (void)registerMessagesListener:(id)a3;
@end

@implementation IIMetricsDispatcher

- (void).cxx_destruct
{
}

- (void)logMessage:(id)a3 messageName:(id)a4
{
  id v4 = [(IISMetricStore *)self->_store saveMessage:a3 backend:0 messageIdentifier:a4];
}

- (void)registerMessagesListener:(id)a3
{
}

- (void)registerEnrichmentProvider:(id)a3
{
}

- (IIMetricsDispatcher)init
{
  v6.receiver = self;
  v6.super_class = (Class)IIMetricsDispatcher;
  v2 = [(IIMetricsDispatcher *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[IISMetricStore sharedInstance];
    store = v2->_store;
    v2->_store = (IISMetricStore *)v3;
  }
  return v2;
}

+ (void)registerXPCActivity
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14138], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14320], 1);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F141C0], "com.apple.proactive.PersonalIntelligence");
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x1E4F141B8], 1uLL);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __42__IIMetricsDispatcher_registerXPCActivity__block_invoke;
  handler[3] = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = a2;
  handler[5] = a1;
  xpc_activity_register("com.apple.proactive.PersonalIntelligence.PersonalIntelligenceMetrics", v4, handler);
  v5 = ii_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl(&dword_1CABE8000, v5, OS_LOG_TYPE_INFO, "IIMetricsDispatcher: registered task PersonalIntelligenceCoreMetrics", v6, 2u);
  }
}

void __42__IIMetricsDispatcher_registerXPCActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__IIMetricsDispatcher_registerXPCActivity__block_invoke_2;
  aBlock[3] = &unk_1E65E96B8;
  v17 = &v18;
  id v4 = v3;
  id v16 = v4;
  v5 = _Block_copy(aBlock);
  objc_super v6 = +[IISMetricStore sharedInstance];
  char v7 = [v6 shouldSendMessages];

  if ((v7 & 1) == 0)
  {
    v11 = ii_default_log_handle();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      goto LABEL_15;
    }
    *(_WORD *)v14 = 0;
    v12 = "IIMetricsDispatcher: not sending messages as today is not scheduled to send.";
LABEL_13:
    _os_log_impl(&dword_1CABE8000, v11, OS_LOG_TYPE_DEFAULT, v12, v14, 2u);
    goto LABEL_14;
  }
  v8 = +[IISMetricStore sharedInstance];
  char v9 = [v8 sendMessagesWithShouldContinue:v5];

  if ((v9 & 1) == 0)
  {
    v10 = ii_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1CABE8000, v10, OS_LOG_TYPE_DEFAULT, "IIMetricsDispatcher: was unable to complete sending of logs.", v14, 2u);
    }
  }
  if (*((unsigned char *)v19 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"IIMetricsDispatcher.m" lineNumber:96 description:@"Unexpected failure of deferral"];
    }
    v11 = ii_default_log_handle();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)v14 = 0;
    v12 = "IIMetricsDispatcher: deferring sending of logs";
    goto LABEL_13;
  }
LABEL_15:

  _Block_object_dispose(&v18, 8);
}

uint64_t __42__IIMetricsDispatcher_registerXPCActivity__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;
  return v2;
}

void __37__IIMetricsDispatcher_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79E3D0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

@end