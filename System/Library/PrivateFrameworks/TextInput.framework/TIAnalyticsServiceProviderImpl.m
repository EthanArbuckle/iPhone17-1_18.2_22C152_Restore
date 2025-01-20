@interface TIAnalyticsServiceProviderImpl
- (TIAnalyticsServiceProviderImpl)init;
- (void)dispatchEventWithName:(id)a3 payload:(id)a4;
@end

@implementation TIAnalyticsServiceProviderImpl

- (void).cxx_destruct
{
}

- (void)dispatchEventWithName:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (InputAnalyticsLibraryCore() && (dispatcher = self->_dispatcher) != 0)
  {
    [(IAEventDispatcher *)dispatcher dispatchEvent:v6 payload:v7];
  }
  else
  {
    id v9 = v7;
    AnalyticsSendEventLazy();
  }
}

id __64__TIAnalyticsServiceProviderImpl_dispatchEventWithName_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (TIAnalyticsServiceProviderImpl)init
{
  v9.receiver = self;
  v9.super_class = (Class)TIAnalyticsServiceProviderImpl;
  v2 = [(TIAnalyticsServiceProviderImpl *)&v9 init];
  if (v2 && InputAnalyticsLibraryCore())
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v3 = (void *)getIAEventDispatcherClass_softClass;
    uint64_t v18 = getIAEventDispatcherClass_softClass;
    if (!getIAEventDispatcherClass_softClass)
    {
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      v12 = __getIAEventDispatcherClass_block_invoke;
      v13 = &unk_1E555A528;
      v14 = &v15;
      InputAnalyticsLibraryCore();
      Class Class = objc_getClass("IAEventDispatcher");
      *(void *)(v14[1] + 24) = Class;
      getIAEventDispatcherClass_softClass Class = *(void *)(v14[1] + 24);
      v3 = (void *)v16[3];
    }
    v5 = v3;
    _Block_object_dispose(&v15, 8);
    id v6 = (IAEventDispatcher *)objc_alloc_init(v5);
    dispatcher = v2->_dispatcher;
    v2->_dispatcher = v6;
  }
  return v2;
}

@end