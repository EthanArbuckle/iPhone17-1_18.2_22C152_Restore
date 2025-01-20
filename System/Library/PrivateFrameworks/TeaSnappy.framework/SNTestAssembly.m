@interface SNTestAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SNTestAssembly

SNTestRunner *__33__SNTestAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [SNTestRunner alloc];
  v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  v5 = [v2 resolveProtocol:&unk_1F39F9010];
  v6 = [v2 resolveClass:objc_opt_class()];

  v7 = [(SNTestRunner *)v3 initWithApplication:v4 testCoordinator:v5 testStore:v6];
  return v7;
}

SNTestCoordinator *__33__SNTestAssembly_loadInRegistry___block_invoke_4()
{
  v0 = [SNTestCoordinator alloc];
  v1 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v2 = [(SNTestCoordinator *)v0 initWithApplication:v1];

  return v2;
}

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerProtocol:&unk_1F39F8C88 factory:&__block_literal_global];

  v6 = [v3 publicContainer];
  id v7 = (id)[v6 registerClass:objc_opt_class() factory:&__block_literal_global_49];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerClass:objc_opt_class() factory:&__block_literal_global_79];

  id v11 = [v3 privateContainer];

  id v10 = (id)[v11 registerProtocol:&unk_1F39F9010 factory:&__block_literal_global_81];
}

SNTestStore *__33__SNTestAssembly_loadInRegistry___block_invoke_3()
{
  v0 = objc_alloc_init(SNTestStore);
  return v0;
}

id __33__SNTestAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

@end