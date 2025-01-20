@interface SWManagerAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SWManagerAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerProtocol:&unk_26D843248 factory:&__block_literal_global_1];

  v6 = [v3 privateContainer];
  id v7 = (id)[v6 registerProtocol:&unk_26D82ADA0 factory:&__block_literal_global_72];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerProtocol:&unk_26D82A228 factory:&__block_literal_global_81];

  v10 = [v3 publicContainer];
  id v11 = (id)[v10 registerProtocol:&unk_26D828C08 factory:&__block_literal_global_94];

  v12 = [v3 publicContainer];
  id v13 = (id)[v12 registerProtocol:&unk_26D828CA8 factory:&__block_literal_global_102];

  v14 = [v3 privateContainer];
  id v15 = (id)[v14 registerClass:objc_opt_class() factory:&__block_literal_global_105];

  v16 = [v3 publicContainer];
  id v17 = (id)[v16 registerProtocol:&unk_26D8342E0 factory:&__block_literal_global_120];

  v18 = [v3 publicContainer];
  id v19 = (id)[v18 registerProtocol:&unk_26D834350 factory:&__block_literal_global_127];

  v20 = [v3 privateContainer];
  id v21 = (id)[v20 registerClass:objc_opt_class() factory:&__block_literal_global_130];

  v22 = [v3 publicContainer];
  v23 = [v22 registerProtocol:&unk_26D843198 factory:&__block_literal_global_138];
  id v24 = (id)[v23 withConfiguration:&__block_literal_global_142];

  v25 = [v3 privateContainer];
  id v26 = (id)[v25 registerClass:objc_opt_class() factory:&__block_literal_global_146];

  v27 = [v3 publicContainer];
  id v28 = (id)[v27 registerProtocol:&unk_26D829EB0 factory:&__block_literal_global_167];

  v29 = [v3 publicContainer];
  id v30 = (id)[v29 registerProtocol:&unk_26D829090 factory:&__block_literal_global_193];

  v31 = [v3 publicContainer];
  id v32 = (id)[v31 registerProtocol:&unk_26D8434F8 factory:&__block_literal_global_197];

  v33 = [v3 publicContainer];
  id v34 = (id)[v33 registerProtocol:&unk_26D8289F8 factory:&__block_literal_global_205];

  v35 = [v3 privateContainer];
  id v36 = (id)[v35 registerProtocol:&unk_26D8298B0 factory:&__block_literal_global_213];

  v37 = [v3 publicContainer];
  id v38 = (id)[v37 registerProtocol:&unk_26D843960 factory:&__block_literal_global_217];

  v39 = [v3 publicContainer];
  id v40 = (id)[v39 registerProtocol:&unk_26D8430A8 factory:&__block_literal_global_225];

  v41 = [v3 publicContainer];
  v42 = [v41 registerProtocol:&unk_26D843B80 factory:&__block_literal_global_241];
  id v43 = (id)[v42 withConfiguration:&__block_literal_global_248];

  v44 = [v3 publicContainer];
  v45 = [v44 registerProtocol:&unk_26D834450 factory:&__block_literal_global_262];
  id v46 = (id)[v45 inScope:2];

  v47 = [v3 privateContainer];
  id v48 = (id)[v47 registerProtocol:&unk_26D82A5D8 factory:&__block_literal_global_265];

  v49 = [v3 publicContainer];
  id v50 = (id)[v49 registerProtocol:&unk_26D834450 name:@"local" factory:&__block_literal_global_268];

  v51 = [v3 publicContainer];
  id v52 = (id)[v51 registerProtocol:&unk_26D82AE78 factory:&__block_literal_global_274];

  v53 = [v3 publicContainer];
  id v54 = (id)[v53 registerProtocol:&unk_26D834648 factory:&__block_literal_global_280];

  v55 = [v3 callback];
  uint64_t v56 = objc_opt_class();
  v57 = TFCallbackScopeName();
  [v55 whenResolvingClass:v56 scope:v57 callbackBlock:&__block_literal_global_285];

  v58 = [v3 publicContainer];
  id v59 = (id)[v58 registerProtocol:&unk_26D829580 factory:&__block_literal_global_293];

  v60 = [v3 publicContainer];
  id v61 = (id)[v60 registerProtocol:&unk_26D829458 factory:&__block_literal_global_299];

  id v63 = [v3 publicContainer];

  id v62 = (id)[v63 registerProtocol:&unk_26D829A50 factory:&__block_literal_global_310];
}

SWConfigurationManager *__36__SWManagerAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWConfigurationManager alloc];
  v4 = [v2 resolveProtocol:&unk_26D8434F8];
  id v5 = [v2 resolveProtocol:&unk_26D834F88];
  v6 = [v2 resolveProtocol:&unk_26D82ADA0];

  id v7 = [(SWConfigurationManager *)v3 initWithWebContentScriptsManager:v4 logger:v5 serializer:v6];
  return v7;
}

SWConfigurationSerializer *__36__SWManagerAssembly_loadInRegistry___block_invoke_2()
{
  v0 = objc_alloc_init(SWConfigurationSerializer);
  return v0;
}

SWContentRuleManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWContentRuleManager alloc];
  v4 = [v2 resolveClass:objc_opt_class() name:@"web-content"];

  id v5 = [(SWContentRuleManager *)v3 initWithUserContentController:v4];
  return v5;
}

id __36__SWManagerAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

id __36__SWManagerAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

SWDocumentStateManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWDocumentStateManager alloc];
  v4 = [v2 resolveClass:objc_opt_class() name:@"web-content"];

  id v5 = [(SWDocumentStateManager *)v3 initWithUserContentController:v4];
  return v5;
}

id __36__SWManagerAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

id __36__SWManagerAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

SWErrorManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWErrorManager alloc];
  v4 = [v2 resolveProtocol:&unk_26D843198];
  id v5 = [v2 resolveProtocol:&unk_26D843960];
  v6 = [v2 resolveProtocol:&unk_26D834F88];

  id v7 = [(SWErrorManager *)v3 initWithMessageHandlerManager:v4 timeoutManager:v5 logger:v6];
  return v7;
}

SWMessageHandlerManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWMessageHandlerManager alloc];
  v4 = [v2 resolveClass:objc_opt_class() name:@"web-content"];
  id v5 = [v2 resolveProtocol:&unk_26D834F88];

  v6 = [(SWMessageHandlerManager *)v3 initWithUserContentController:v4 logger:v5];
  return v6;
}

void __36__SWManagerAssembly_loadInRegistry___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v5 resolveClass:objc_opt_class()];

  [v4 addMessageHandler:v6 name:@"log"];
}

SWLogMessageHandler *__36__SWManagerAssembly_loadInRegistry___block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWLogMessageHandler alloc];
  id v4 = [v2 resolveProtocol:&unk_26D834F88];

  id v5 = [(SWLogMessageHandler *)v3 initWithLogger:v4];
  return v5;
}

SWNavigationManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_13()
{
  v0 = objc_alloc_init(SWNavigationManager);
  return v0;
}

SWPresentationManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWPresentationManager alloc];
  id v4 = [v2 resolveProtocol:&unk_26D8434F8];
  id v5 = [v2 resolveProtocol:&unk_26D843198];
  id v6 = [v2 resolveProtocol:&unk_26D828C08];
  id v7 = [v2 resolveProtocol:&unk_26D834F88];

  v8 = [(SWPresentationManager *)v3 initWithWebContentScriptsManager:v4 messageHandlerManager:v5 documentStateProvider:v6 logger:v7];
  return v8;
}

SWScriptsManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWScriptsManager alloc];
  id v4 = [v2 resolveClass:objc_opt_class() name:@"web-content"];
  id v5 = [v2 resolveProtocol:&unk_26D828C08];
  id v6 = [v2 resolveProtocol:&unk_26D834F88];

  id v7 = [(SWScriptsManager *)v3 initWithWebView:v4 documentStateProvider:v5 logger:v6];
  return v7;
}

SWProcessTerminationManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWProcessTerminationManager alloc];
  id v4 = [v2 resolveProtocol:&unk_26D8298B0];
  id v5 = [v2 resolveProtocol:&unk_26D834350];

  id v6 = [(SWProcessTerminationManager *)v3 initWithTerminationThrottler:v4 errorReporter:v5];
  return v6;
}

SWCrashRetryThrottler *__36__SWManagerAssembly_loadInRegistry___block_invoke_17()
{
  v0 = objc_alloc_init(SWCrashRetryThrottler);
  return v0;
}

SWTimeoutManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_18(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWTimeoutManager alloc];
  id v4 = [v2 resolveProtocol:&unk_26D843198];
  id v5 = [v2 resolveProtocol:&unk_26D828C08];

  id v6 = [(SWTimeoutManager *)v3 initWithTimeout:v4 messageHandlerManager:v5 documentStateProvider:60.0];
  return v6;
}

SWSessionManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_19(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWSessionManager alloc];
  id v4 = [v2 resolveProtocol:&unk_26D8434F8];
  id v5 = [v2 resolveProtocol:&unk_26D834F88];

  id v6 = [(SWSessionManager *)v3 initWithScriptsManager:v4 logger:v5];
  return v6;
}

SWDatastoreSynchronizationManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWDatastoreSynchronizationManager alloc];
  id v4 = [v2 resolveProtocol:&unk_26D82A5D8];
  id v5 = [v2 resolveProtocol:&unk_26D8434F8];
  id v6 = [v2 resolveProtocol:&unk_26D843198];
  id v7 = [v2 resolveProtocol:&unk_26D8430A8];
  v8 = [v2 resolveProtocol:&unk_26D834F88];

  id v9 = [(SWDatastoreSynchronizationManager *)v3 initWithSettingsFactory:v4 scriptsManager:v5 messageHandlerManager:v6 sessionManager:v7 logger:v8];
  return v9;
}

void __36__SWManagerAssembly_loadInRegistry___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v5 resolveProtocol:&unk_26D834450];
  [v4 setDatastoreManager:v6];

  id v7 = [v5 resolveProtocol:&unk_26D834450 name:@"local"];

  [v4 setLocalDatastoreManager:v7];
}

SWDatastoreManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_22(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWDatastoreManager alloc];
  id v4 = [v2 resolveProtocol:&unk_26D834F88];
  id v5 = [v2 resolveProtocol:&unk_26D828C08];
  id v6 = [v2 resolveProtocol:&unk_26D843B80];

  id v7 = [(SWDatastoreManager *)v3 initWithLogger:v4 documentStateProvider:v5 datastoreSynchronizationManager:v6];
  return v7;
}

SWDatastoreFactory *__36__SWManagerAssembly_loadInRegistry___block_invoke_23(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWDatastoreFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D834F88];

  id v5 = [(SWDatastoreFactory *)v3 initWithLogger:v4];
  return v5;
}

SWDatastoreManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWDatastoreManager alloc];
  id v4 = [v2 resolveProtocol:&unk_26D834F88];
  id v5 = [v2 resolveProtocol:&unk_26D828C08];
  id v6 = [v2 resolveProtocol:&unk_26D843B80];

  id v7 = [(SWDatastoreManager *)v3 initWithLogger:v4 documentStateProvider:v5 datastoreSynchronizationManager:v6];
  return v7;
}

SWSetupManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_25(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWSetupManager alloc];
  id v4 = [v2 resolveProtocol:&unk_26D834F88];

  id v5 = [(SWSetupManager *)v3 initWithLogger:v4];
  return v5;
}

SWURLSchemeHandlerManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_26(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWURLSchemeHandlerManager alloc];
  id v4 = [v2 resolveClass:objc_opt_class() name:@"web-content"];
  id v5 = [v2 resolveProtocol:&unk_26D834F88];

  id v6 = [(SWURLSchemeHandlerManager *)v3 initWithConfiguration:v4 logger:v5];
  return v6;
}

id __36__SWManagerAssembly_loadInRegistry___block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  return (id)[a3 resolveProtocol:&unk_26D834648];
}

SWScaleManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_28(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWScaleManager alloc];
  id v4 = [v2 resolveClass:objc_opt_class() name:@"web-content"];

  id v5 = [(SWScaleManager *)v3 initWithWebView:v4 scale:1.0];
  return v5;
}

SWSnapshotManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_29(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWSnapshotManager alloc];
  id v4 = [v2 resolveClass:objc_opt_class() name:@"web-content"];
  id v5 = [v2 resolveProtocol:&unk_26D843248];

  id v6 = [(SWSnapshotManager *)v3 initWithWebView:v4 configurationManager:v5];
  return v6;
}

SWPreferredSizeManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_30(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWPreferredSizeManager alloc];
  id v4 = [v2 resolveProtocol:&unk_26D843198];
  id v5 = [v2 resolveProtocol:&unk_26D834F88];

  id v6 = [(SWPreferredSizeManager *)v3 initWithMessageHandlerManager:v4 logger:v5];
  return v6;
}

@end