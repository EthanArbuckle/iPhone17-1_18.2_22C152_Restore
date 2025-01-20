@interface SXWebContentComponentAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXWebContentComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 callback];
  v5 = TFCallbackScopeAny();
  [v4 whenResolvingProtocol:&unk_26D5ED4C8 scope:v5 callbackBlock:&__block_literal_global_64];

  v6 = [v3 callback];
  v7 = TFCallbackScopeAny();
  [v6 whenResolvingProtocol:&unk_26D61EA90 scope:v7 callbackBlock:&__block_literal_global_55_13];

  v8 = [v3 callback];
  v9 = TFCallbackScopeAny();
  [v8 whenResolvingProtocol:&unk_26D641340 scope:v9 callbackBlock:&__block_literal_global_78];

  v10 = [v3 publicContainer];
  id v11 = (id)[v10 registerClass:objc_opt_class() factory:&__block_literal_global_84];

  v12 = [v3 publicContainer];
  id v13 = (id)[v12 registerClass:objc_opt_class() factory:&__block_literal_global_203];

  v14 = [v3 publicContainer];
  id v15 = (id)[v14 registerClass:objc_opt_class() factory:&__block_literal_global_207];

  v16 = [v3 publicContainer];
  id v17 = (id)[v16 registerProtocol:&unk_26D5EFB48 factory:&__block_literal_global_210_0];

  v18 = [v3 publicContainer];
  id v19 = (id)[v18 registerProtocol:&unk_26D61E3C8 factory:&__block_literal_global_240];

  v20 = [v3 publicContainer];
  id v21 = (id)[v20 registerProtocol:&unk_26D620D70 factory:&__block_literal_global_273];

  v22 = [v3 privateContainer];
  id v23 = (id)[v22 registerProtocol:&unk_26D61DF38 factory:&__block_literal_global_277];

  v24 = [v3 publicContainer];
  id v25 = (id)[v24 registerProtocol:&unk_26D5C32D0 factory:&__block_literal_global_281];

  v26 = [v3 publicContainer];
  id v27 = (id)[v26 registerProtocol:&unk_26D5B9140 factory:&__block_literal_global_285];

  v28 = [v3 publicContainer];
  id v29 = (id)[v28 registerClass:objc_opt_class() factory:&__block_literal_global_289_0];

  id v31 = [v3 publicContainer];

  id v30 = (id)[v31 registerClass:objc_opt_class() factory:&__block_literal_global_309];
}

void __48__SXWebContentComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

void __48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

void __48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];
  [v5 registerHandler:v6 scheme:@"action"];

  id v7 = [v4 resolveClass:objc_opt_class()];

  [v5 registerHandler:v7];
}

SXWebContentComponentViewFactory *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v16 = [SXWebContentComponentViewFactory alloc];
  v22 = [v2 resolveProtocol:&unk_26D5C6E40];
  v18 = [v2 resolveClass:objc_opt_class()];
  id v15 = [v2 resolveProtocol:&unk_26D620000];
  v14 = [v2 resolveProtocol:&unk_26D5F3268];
  id v13 = [v2 resolveClass:objc_opt_class()];
  id v21 = [v2 resolveProtocol:&unk_26D5EFB48];
  v20 = [v2 resolveProtocol:&unk_26D641340];
  id v19 = [v2 resolveProtocol:&unk_26D605340];
  v12 = [v2 resolveProtocol:&unk_26D61FDC0];
  id v11 = [v2 resolveProtocol:&unk_26D61E3C8];
  v10 = [v2 resolveProtocol:&unk_26D6411D8];
  v9 = [v2 resolveProtocol:&unk_26D601790];
  id v3 = [v2 resolveProtocol:&unk_26D6413E8];
  id v4 = [v2 resolveProtocol:&unk_26D61DF38];
  id v5 = [v2 resolveProtocol:&unk_26D620770];
  id v6 = [v2 resolveProtocol:&unk_26D5C32D0];
  id v7 = [v2 resolveProtocol:&unk_26D5B9140];
  id v17 = -[SXWebContentComponentViewFactory initWithResolver:DOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:containerViewController:configurationProvider:navigationManager:analyticsReportingProvider:componentExposureMonitor:interactionManagerFactory:reachabilityProvider:resourceDataSourceProvider:loadingPolicyProvider:dataSourceProvider:layoutInvalidator:contentRuleProvider:developerSettingsProvider:](v16, "initWithResolver:DOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:containerViewController:configurationProvider:navigationManager:analyticsReportingProvider:componentExposureMonitor:interactionManagerFactory:reachabilityProvider:resourceDataSourceProvider:loadingPolicyProvider:dataSourceProvider:layoutInvalidator:contentRuleProvider:developerSettingsProvider:", v2, v22, v18, v15, v14, v13, v21, v20, v19, v12, v11, v10, v9, v3,
          v4,
          v5,
          v6,
          v7);

  return v17;
}

SXWebContentComponentSizerFactory *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXWebContentComponentSizerFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v5 = [v2 resolveProtocol:&unk_26D6413E8];

  id v6 = [(SXWebContentComponentSizerFactory *)v3 initWithDOMObjectProvider:v4 loadingPolicyProvider:v5];
  return v6;
}

SXFallbackLiveActivityAttributesProvider *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_6()
{
  v0 = objc_alloc_init(SXFallbackLiveActivityAttributesProvider);
  return v0;
}

SXWebContentConfigurationProvider *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveOptionalProtocol:&unk_26D630010];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 resolveClass:objc_opt_class()];
  }
  id v6 = v5;

  id v7 = [SXWebContentConfigurationProvider alloc];
  v8 = [v2 resolveProtocol:&unk_26D5EB460];
  v9 = [v2 resolveProtocol:&unk_26D6414D8];
  v10 = [MEMORY[0x263EFF960] currentLocale];
  id v11 = [v2 resolveProtocol:&unk_26D6415F8];
  v12 = [(SXWebContentConfigurationProvider *)v7 initWithPresentationAttributesProvider:v8 storeFrontProvider:v9 liveActivityAttributesProvider:v6 locale:v10 location:v11];

  return v12;
}

SXWebContentComponentInteractionManagerFactory *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXWebContentComponentInteractionManagerFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D641778];
  id v5 = [v2 resolveProtocol:&unk_26D6015E8];
  id v6 = [v2 resolveProtocol:&unk_26D620D70];

  id v7 = [(SXWebContentComponentInteractionManagerFactory *)v3 initWithInteractionProvider:v4 interactionHandlerManager:v5 componentInteractionHandlerFactory:v6];
  return v7;
}

SXWebContentComponentInteractionHandlerFactory *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_9()
{
  v0 = objc_alloc_init(SXWebContentComponentInteractionHandlerFactory);
  return v0;
}

SXWebContentDataSourceProvider *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXWebContentDataSourceProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v5 = [v2 resolveProtocol:&unk_26D601790];

  id v6 = [(SXWebContentDataSourceProvider *)v3 initWithDOMObjectProvider:v4 resourceDataSourceProvider:v5];
  return v6;
}

SXWebContentComponentContentRuleProvider *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_11()
{
  v0 = objc_alloc_init(SXWebContentComponentContentRuleProvider);
  return v0;
}

SXWebContentComponentDeveloperSettingsProvider *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_12()
{
  v0 = objc_alloc_init(SXWebContentComponentDeveloperSettingsProvider);
  return v0;
}

SXWebContentGenericNavigationHandler *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXWebContentGenericNavigationHandler alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5B2B70];
  id v5 = [v2 resolveProtocol:&unk_26D5EF308];

  id v6 = [(SXWebContentGenericNavigationHandler *)v3 initWithActionManager:v4 URLActionFactory:v5];
  return v6;
}

SXWebContentActionNavigationHandler *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXWebContentActionNavigationHandler alloc];
  id v4 = [v2 resolveProtocol:&unk_26D610D30];
  id v5 = [v2 resolveProtocol:&unk_26D5B2B70];

  id v6 = [(SXWebContentActionNavigationHandler *)v3 initWithActionProvider:v4 actionManager:v5];
  return v6;
}

@end