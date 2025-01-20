@interface SWSetupAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SWSetupAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 callback];
  v5 = TFCallbackScopeAny();
  [v4 whenResolvingProtocol:&unk_26D82AE78 scope:v5 callbackBlock:&__block_literal_global_4];

  v6 = [v3 privateContainer];
  id v7 = (id)[v6 registerClass:objc_opt_class() factory:&__block_literal_global_50];

  v8 = [v3 privateContainer];
  id v9 = (id)[v8 registerClass:objc_opt_class() factory:&__block_literal_global_62];

  id v11 = [v3 privateContainer];

  id v10 = (id)[v11 registerClass:objc_opt_class() factory:&__block_literal_global_65];
}

void __34__SWSetupAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v8 = a2;
  v5 = [v4 resolveClass:objc_opt_class()];
  [v8 addTask:v5];

  v6 = [v4 resolveClass:objc_opt_class()];
  [v8 addTask:v6];

  id v7 = [v4 resolveClass:objc_opt_class()];

  [v8 addTask:v7];
  [v8 performTasks];
}

SWScriptsSetupTask *__34__SWSetupAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWScriptsSetupTask alloc];
  id v4 = [v2 resolveProtocol:&unk_26D8434F8];

  v5 = [(SWScriptsSetupTask *)v3 initWithScriptsManager:v4];
  return v5;
}

SWDatastoreSetupTask *__34__SWSetupAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWDatastoreSetupTask alloc];
  id v4 = [v2 resolveProtocol:&unk_26D834450];
  v5 = [v2 resolveProtocol:&unk_26D8434F8];

  v6 = [(SWDatastoreSetupTask *)v3 initWithDatastoreManager:v4 scriptsManager:v5];
  return v6;
}

SWLocalDatastoreSetupTask *__34__SWSetupAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWLocalDatastoreSetupTask alloc];
  id v4 = [v2 resolveProtocol:&unk_26D834450 name:@"local"];
  v5 = [v2 resolveProtocol:&unk_26D8434F8];

  v6 = [(SWLocalDatastoreSetupTask *)v3 initWithDatastoreManager:v4 scriptsManager:v5];
  return v6;
}

@end