@interface SWViewControllerAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SWViewControllerAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerClass:objc_opt_class() factory:&__block_literal_global_2];

  v6 = [v3 publicContainer];
  id v7 = (id)[v6 registerClass:objc_opt_class() factory:&__block_literal_global_11];

  id v9 = [v3 publicContainer];

  id v8 = (id)[v9 registerClass:objc_opt_class() name:@"web-content" factory:&__block_literal_global_79_0];
}

SWContainerViewController *__43__SWViewControllerAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v14 = [SWContainerViewController alloc];
  id v3 = [v2 resolveClass:objc_opt_class()];
  v4 = [v2 resolveProtocol:&unk_26D828808];
  id v5 = [v2 resolveProtocol:&unk_26D843848];
  v6 = [v2 resolveProtocol:&unk_26D8342E0];
  id v7 = [v2 resolveProtocol:&unk_26D843248];
  id v8 = [v2 resolveProtocol:&unk_26D829090];
  id v9 = [v2 resolveProtocol:&unk_26D829580];
  v10 = [v2 resolveProtocol:&unk_26D829458];
  v11 = [v2 resolveProtocol:&unk_26D829A50];

  v12 = [(SWContainerViewController *)v14 initWithWebContentViewController:v3 actionProvider:v4 interactionProvider:v5 errorProvider:v6 configurationManager:v7 presentationManager:v8 scaleManager:v9 snapshotManager:v10 preferredSizeManager:v11];
  return v12;
}

SWViewController *__43__SWViewControllerAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v15 = [SWViewController alloc];
  v21 = [v2 resolveClass:objc_opt_class() name:@"web-content"];
  v12 = [v2 resolveProtocol:&unk_26D82AE78];
  v18 = [v2 resolveProtocol:&unk_26D8434F8];
  v17 = [v2 resolveProtocol:&unk_26D843198];
  v14 = [v2 resolveProtocol:&unk_26D829EB0];
  v13 = [v2 resolveProtocol:&unk_26D834350];
  v20 = [v2 resolveProtocol:&unk_26D828CA8];
  v19 = [v2 resolveProtocol:&unk_26D843960];
  v11 = [v2 resolveProtocol:&unk_26D8289F8];
  v10 = [v2 resolveProtocol:&unk_26D82A228];
  id v9 = [v2 resolveProtocol:&unk_26D845198];
  id v3 = [v2 resolveProtocol:&unk_26D834F88];
  v4 = [v2 resolveProtocol:&unk_26D8430A8];
  id v5 = [v2 resolveProtocol:&unk_26D843B80];
  v6 = [v2 resolveProtocol:&unk_26D834450 name:@"local"];
  id v7 = [v2 resolveProtocol:&unk_26D834648];

  v16 = -[SWViewController initWithWebView:setupManager:scriptsManager:messageHandlerManager:navigationManager:errorReporter:documentStateReporter:timeoutManager:terminationManager:contentRuleManager:reachabilityProvider:logger:sessionManager:datastoreSynchronizationManager:localDatastoreManager:URLSchemeHandlerManager:](v15, "initWithWebView:setupManager:scriptsManager:messageHandlerManager:navigationManager:errorReporter:documentStateReporter:timeoutManager:terminationManager:contentRuleManager:reachabilityProvider:logger:sessionManager:datastoreSynchronizationManager:localDatastoreManager:URLSchemeHandlerManager:", v21, v12, v18, v17, v14, v13, v20, v19, v11, v10, v9, v3, v4, v5, v6,
          v7);

  return v16;
}

id __43__SWViewControllerAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class() name:@"web-content"];
  v4 = [v2 resolveClass:objc_opt_class()];
  id v5 = [v2 resolveProtocol:&unk_26D82A0F0 name:@"web-content"];

  v6 = [v5 createWebViewWithWebViewConfiguration:v3 scrollSettings:v4];

  return v6;
}

@end