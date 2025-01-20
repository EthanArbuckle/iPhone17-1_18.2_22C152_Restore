@interface SWFactoryAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SWFactoryAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  v5 = [v4 registerProtocol:&unk_26D82A0F0 name:@"web-content" factory:&__block_literal_global_0];
  id v6 = (id)[v5 inScope:2];

  v7 = [v3 publicContainer];
  id v8 = (id)[v7 registerProtocol:&unk_26D843C90 factory:&__block_literal_global_51];

  v9 = [v3 privateContainer];
  v10 = [v9 registerClass:objc_opt_class() name:@"web-content" factory:&__block_literal_global_56];
  id v11 = (id)[v10 inScope:2];

  v12 = [v3 privateContainer];
  v13 = [v12 registerClass:objc_opt_class() name:@"web-content" factory:&__block_literal_global_60];
  v14 = [v13 inScope:2];
  id v15 = (id)[v14 withConfiguration:&__block_literal_global_63];

  v16 = [v3 privateContainer];
  v17 = [v16 registerClass:objc_opt_class() name:@"web-content" factory:&__block_literal_global_66];
  id v18 = (id)[v17 withConfiguration:&__block_literal_global_69];

  v19 = [v3 publicContainer];
  id v20 = (id)[v19 registerClass:objc_opt_class() name:@"web-content" factory:&__block_literal_global_73];

  v21 = [v3 privateContainer];
  v22 = [v21 registerProtocol:&unk_26D834E78 name:@"web-content" factory:&__block_literal_global_79];
  id v23 = (id)[v22 inScope:2];

  v24 = [v3 publicContainer];
  id v25 = (id)[v24 registerClass:objc_opt_class() name:@"web-content" factory:&__block_literal_global_83];

  v26 = [v3 publicContainer];
  id v27 = (id)[v26 registerClass:objc_opt_class() factory:&__block_literal_global_86];

  id v29 = [v3 publicContainer];

  id v28 = (id)[v29 registerClass:objc_opt_class() factory:&__block_literal_global_89];
}

SWWebViewFactory *__36__SWFactoryAssembly_loadInRegistry___block_invoke()
{
  v0 = objc_alloc_init(SWWebViewFactory);
  return v0;
}

SWProcessConfiguration *__36__SWFactoryAssembly_loadInRegistry___block_invoke_2()
{
  v0 = [[SWProcessConfiguration alloc] initWithBackgroundPriority:1];
  return v0;
}

id __36__SWFactoryAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F1FA28];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 resolveClass:objc_opt_class() name:@"web-content"];

  id v6 = (void *)[v4 _initWithConfiguration:v5];
  return v6;
}

uint64_t __36__SWFactoryAssembly_loadInRegistry___block_invoke_4()
{
  return [MEMORY[0x263F1FA68] defaultDataStore];
}

uint64_t __36__SWFactoryAssembly_loadInRegistry___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _setResourceLoadStatisticsEnabled:1];
}

id __36__SWFactoryAssembly_loadInRegistry___block_invoke_6()
{
  id v0 = objc_alloc_init(MEMORY[0x263F1FAB0]);
  return v0;
}

void __36__SWFactoryAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 resolveProtocol:&unk_26D843C90];
  objc_msgSend(v4, "setAlwaysRunsAtBackgroundPriority:", objc_msgSend(v5, "shouldRunAtBackgroundPriority"));
}

id __36__SWFactoryAssembly_loadInRegistry___block_invoke_8()
{
  id v0 = objc_alloc_init(MEMORY[0x263F1FA38]);
  return v0;
}

SWWebViewConfigurationFactory *__36__SWFactoryAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWWebViewConfigurationFactory alloc];
  id v4 = [v2 resolveClass:objc_opt_class() name:@"web-content"];
  id v5 = [v2 resolveClass:objc_opt_class() name:@"web-content"];

  id v6 = [(SWWebViewConfigurationFactory *)v3 initWithProcessPool:v4 websiteDataStore:v5];
  return v6;
}

id __36__SWFactoryAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class() name:@"web-content"];
  id v4 = [v2 resolveClass:objc_opt_class()];
  id v5 = [v2 resolveProtocol:&unk_26D834E78 name:@"web-content"];

  id v6 = [v5 createWebViewConfigurationWithUserContentController:v3 mediaSettings:v4];

  return v6;
}

SWMediaSettings *__36__SWFactoryAssembly_loadInRegistry___block_invoke_11()
{
  id v0 = [[SWMediaSettings alloc] initWithMediaTypesRequiringUserActionForPlayback:1 fullScreenEnabled:0];
  return v0;
}

SWScrollSettings *__36__SWFactoryAssembly_loadInRegistry___block_invoke_12()
{
  id v0 = [[SWScrollSettings alloc] initWithScrollEnabled:0 scrollsToTop:0 showsVerticalScrollIndicator:0];
  return v0;
}

@end