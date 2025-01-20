@interface SXComponentAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  v5 = [v4 registerProtocol:&unk_26D62F5A8 factory:&__block_literal_global_5];
  id v6 = (id)[v5 withConfiguration:&__block_literal_global_111];

  v7 = [v3 publicContainer];
  id v8 = (id)[v7 registerProtocol:&unk_26D5F3268 factory:&__block_literal_global_124];

  v9 = [v3 publicContainer];
  id v10 = (id)[v9 registerProtocol:&unk_26D5ED4C8 factory:&__block_literal_global_139];

  v11 = [v3 publicContainer];
  v12 = [v11 registerProtocol:&unk_26D5C7100 factory:&__block_literal_global_150];
  id v13 = (id)[v12 withConfiguration:&__block_literal_global_154];

  v14 = [v3 publicContainer];
  id v15 = (id)[v14 registerProtocol:&unk_26D606800 factory:&__block_literal_global_168];

  v16 = [v3 publicContainer];
  id v17 = (id)[v16 registerProtocol:&unk_26D6015E8 factory:&__block_literal_global_184];

  v18 = [v3 publicContainer];
  id v19 = (id)[v18 registerClass:objc_opt_class() factory:&__block_literal_global_188_0];

  v20 = [v3 publicContainer];
  id v21 = (id)[v20 registerProtocol:&unk_26D5E1468 factory:&__block_literal_global_199];

  v22 = [v3 publicContainer];
  id v23 = (id)[v22 registerProtocol:&unk_26D5C53F0 factory:&__block_literal_global_228];

  v24 = [v3 privateContainer];
  id v25 = (id)[v24 registerClass:objc_opt_class() factory:&__block_literal_global_232];

  id v27 = [v3 publicContainer];

  id v26 = (id)[v27 registerProtocol:&unk_26D61FDC0 factory:&__block_literal_global_250];
}

SXComponentController *__38__SXComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXComponentController alloc];
  v4 = [v2 resolveClass:objc_opt_class()];
  v5 = [v2 resolveProtocol:&unk_26D5C6E40];

  id v6 = [(SXComponentController *)v3 initWithViewport:v4 DOMObjectProvider:v5];
  return v6;
}

void __38__SXComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v5 resolveClass:objc_opt_class()];
  [v4 setHost:v6];

  id v7 = [v5 resolveProtocol:&unk_26D5ED4C8];

  [v4 setComponentViewEngine:v7];
}

SXComponentStyleRendererFactory *__38__SXComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXComponentStyleRendererFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5CE560];
  id v5 = [v2 resolveProtocol:&unk_26D5F3F68];
  id v6 = [v2 resolveProtocol:&unk_26D60ED08];
  id v7 = [v2 resolveProtocol:&unk_26D5EF250];
  id v8 = [v2 resolveClass:objc_opt_class()];

  v9 = [(SXComponentStyleRendererFactory *)v3 initWithImageFillViewFactory:v4 videoFillViewFactory:v5 gradientFactory:v6 repeatableImageFillViewFactory:v7 viewport:v8];
  return v9;
}

SXComponentViewEngine *__38__SXComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXComponentViewEngine alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5C7100];

  id v5 = [(SXComponentViewEngine *)v3 initWithPostProcessorManager:v4];
  return v5;
}

SXComponentViewPostProcessorManager *__38__SXComponentAssembly_loadInRegistry___block_invoke_5()
{
  v0 = objc_alloc_init(SXComponentViewPostProcessorManager);
  return v0;
}

void __38__SXComponentAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v5 resolveClass:objc_opt_class()];
  [v4 addProcessor:v6];

  id v7 = [v5 resolveClass:objc_opt_class()];

  [v4 addProcessor:v7];
}

SXComponentInteractionManager *__38__SXComponentAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXComponentInteractionManager alloc];
  id v4 = [v2 resolveProtocol:&unk_26D6015E8];
  id v5 = [v2 resolveClass:objc_opt_class()];

  id v6 = [(SXComponentInteractionManager *)v3 initWithInteractionHandlerManager:v4 viewport:v5];
  return v6;
}

SXComponentInteractionHandlerManager *__38__SXComponentAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXComponentInteractionHandlerManager alloc];
  id v4 = [v2 resolveClass:objc_opt_class()];

  id v5 = [(SXComponentInteractionHandlerManager *)v3 initWithViewport:v4];
  return v5;
}

SXActionComponentViewPostProcessor *__38__SXComponentAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXActionComponentViewPostProcessor alloc];
  id v4 = [v2 resolveProtocol:&unk_26D610D30];
  id v5 = [v2 resolveProtocol:&unk_26D5E1468];
  id v6 = [v2 resolveProtocol:&unk_26D6015E8];

  id v7 = [(SXActionComponentViewPostProcessor *)v3 initWithActionProvider:v4 interactionHandlerFactory:v5 interactionHandlerManager:v6];
  return v7;
}

SXActionComponentInteractionHandlerFactory *__38__SXComponentAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXActionComponentInteractionHandlerFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5B2B70];
  id v5 = [v2 resolveProtocol:&unk_26D5C3410];
  id v6 = [v2 resolveProtocol:&unk_26D605340];

  id v7 = [(SXActionComponentInteractionHandlerFactory *)v3 initWithActionManager:v4 actionSerializer:v5 analyticsReportingProvider:v6];
  return v7;
}

SXComponentActionHandler *__38__SXComponentAssembly_loadInRegistry___block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXComponentActionHandler alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5B2B70];
  id v5 = [v2 resolveProtocol:&unk_26D5C3410];
  id v6 = [v2 resolveProtocol:&unk_26D605340];

  id v7 = [(SXComponentActionHandler *)v3 initWithActionManager:v4 actionSerializer:v5 analyticsReportingProvider:v6];
  return v7;
}

SXExposureComponentViewPostProcessor *__38__SXComponentAssembly_loadInRegistry___block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXExposureComponentViewPostProcessor alloc];
  id v4 = [v2 resolveProtocol:&unk_26D61FDC0];
  id v5 = [v2 resolveProtocol:&unk_26D605340];

  id v6 = [(SXExposureComponentViewPostProcessor *)v3 initWithExposureMonitor:v4 analyticsReportingProvider:v5];
  return v6;
}

SXComponentExposureMonitor *__38__SXComponentAssembly_loadInRegistry___block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXComponentExposureMonitor alloc];
  id v4 = [v2 resolveClass:objc_opt_class()];
  id v5 = [v2 resolveProtocol:&unk_26D6410F8];
  id v6 = [v2 resolveProtocol:&unk_26D62F5A8];
  id v7 = [v2 resolveProtocol:&unk_26D5C9B00];

  id v8 = [(SXComponentExposureMonitor *)v3 initWithViewport:v4 appStateMonitor:v5 componentController:v6 host:v7];
  return v8;
}

@end