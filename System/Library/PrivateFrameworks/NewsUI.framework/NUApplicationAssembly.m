@interface NUApplicationAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation NUApplicationAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerProtocol:&unk_26D4CB6B0 factory:&__block_literal_global_17];

  v6 = [v3 publicContainer];
  id v7 = (id)[v6 registerProtocol:&unk_26D4E2648 factory:&__block_literal_global_56];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerProtocol:&unk_26D4A9AE0 factory:&__block_literal_global_65];

  v10 = [v3 publicContainer];
  id v11 = (id)[v10 registerProtocol:&unk_26D4BBAF0 factory:&__block_literal_global_79];

  v12 = [v3 publicContainer];
  id v13 = (id)[v12 registerProtocol:&unk_26D4BBCF0 factory:&__block_literal_global_91];

  v14 = [v3 publicContainer];
  id v15 = (id)[v14 registerProtocol:&unk_26D4C6E90 factory:&__block_literal_global_98];

  v16 = [v3 publicContainer];
  id v17 = (id)[v16 registerProtocol:&unk_26D4CCF90 factory:&__block_literal_global_106];

  v18 = [v3 publicContainer];
  id v19 = (id)[v18 registerProtocol:&unk_26D4BBFA8 factory:&__block_literal_global_121_0];

  id v22 = [v3 privateContainer];

  v20 = [v22 registerProtocol:&unk_26D4BBD50 factory:&__block_literal_global_124];
  id v21 = (id)[v20 inScope:2];
}

uint64_t __40__NUApplicationAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 resolveProtocol:&unk_26D4BBD50];
}

uint64_t __40__NUApplicationAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 resolveProtocol:&unk_26D4BBD50];
}

NUApplicationURLHandler *__40__NUApplicationAssembly_loadInRegistry___block_invoke()
{
  v0 = objc_alloc_init(NUApplicationURLHandler);

  return v0;
}

id __40__NUApplicationAssembly_loadInRegistry___block_invoke_2()
{
  id v0 = objc_alloc(MEMORY[0x263F6C600]);
  v1 = [MEMORY[0x263F1C408] sharedApplication];
  v2 = (void *)[v0 initWithApplication:v1];

  return v2;
}

NUApplicationAppActivityMonitorIOS *__40__NUApplicationAssembly_loadInRegistry___block_invoke_9()
{
  id v0 = objc_alloc_init(NUApplicationAppActivityMonitorIOS);

  return v0;
}

NUApplicationDevice *__40__NUApplicationAssembly_loadInRegistry___block_invoke_3()
{
  id v0 = [NUApplicationDevice alloc];
  v1 = [MEMORY[0x263F1C408] sharedApplication];
  v2 = [MEMORY[0x263F1C920] mainScreen];
  id v3 = [(NUApplicationDevice *)v0 initWithApplication:v1 screen:v2];

  return v3;
}

uint64_t __40__NUApplicationAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 resolveProtocol:&unk_26D4BBD50];
}

NUMailPresenter *__40__NUApplicationAssembly_loadInRegistry___block_invoke_6()
{
  id v0 = objc_alloc_init(NUMailPresenter);

  return v0;
}

NUMessagePresenter *__40__NUApplicationAssembly_loadInRegistry___block_invoke_7()
{
  id v0 = objc_alloc_init(NUMessagePresenter);

  return v0;
}

@end