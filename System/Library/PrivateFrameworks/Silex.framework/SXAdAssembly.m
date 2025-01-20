@interface SXAdAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXAdAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerProtocol:&unk_26D5F5310 factory:&__block_literal_global_67];

  v6 = [v3 publicContainer];
  id v7 = (id)[v6 registerProtocol:&unk_26D62D8B8 factory:&__block_literal_global_56];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerProtocol:&unk_26D5F5A48 factory:&__block_literal_global_62_0];

  v10 = [v3 callback];
  v11 = TFCallbackScopeAny();
  [v10 whenResolvingProtocol:&unk_26D5F0428 scope:v11 callbackBlock:&__block_literal_global_76_1];

  v12 = [v3 publicContainer];
  id v13 = (id)[v12 registerClass:objc_opt_class() factory:&__block_literal_global_80];

  id v16 = [v3 privateContainer];

  v14 = [v16 registerProtocol:&unk_26D60EE88 name:@"ad-insertion" factory:&__block_literal_global_96];
  id v15 = (id)[v14 withConfiguration:&__block_literal_global_100_0];
}

SXAdvertisingSettingsFactory *__31__SXAdAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXAdvertisingSettingsFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D5F1270];
  id v5 = [v2 resolveProtocol:&unk_26D62D8B8];

  v6 = [(SXAdvertisingSettingsFactory *)v3 initWithDocumentProvider:v4 debugSettingsProvider:v5];
  return v6;
}

SXDebugAdvertisementSettingsProvider *__31__SXAdAssembly_loadInRegistry___block_invoke_2()
{
  v0 = [[SXDebugAdvertisementSettingsProvider alloc] initWithDebugSettings:0];
  return v0;
}

SXAdIgnorableViewFactory *__31__SXAdAssembly_loadInRegistry___block_invoke_3()
{
  v0 = objc_alloc_init(SXAdIgnorableViewFactory);
  return v0;
}

void __31__SXAdAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addInserter:v6];
}

SXAdComponentInserter *__31__SXAdAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXAdComponentInserter alloc];
  id v4 = [v2 resolveProtocol:&unk_26D60EE88 name:@"ad-insertion"];
  id v5 = [v2 resolveProtocol:&unk_26D5F5310];

  id v6 = [(SXAdComponentInserter *)v3 initWithConditionEngine:v4 advertisingSettingsFactory:v5];
  return v6;
}

SXComponentInsertionConditionEngine *__31__SXAdAssembly_loadInRegistry___block_invoke_6()
{
  v0 = objc_alloc_init(SXComponentInsertionConditionEngine);
  return v0;
}

void __31__SXAdAssembly_loadInRegistry___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = objc_alloc_init(SXFirstViewportComponentInsertionCondition);
  [v3 addCondition:v4];

  id v5 = objc_alloc_init(SXPastBodyComponentInsertionCondition);
  [v3 addCondition:v5];
}

@end