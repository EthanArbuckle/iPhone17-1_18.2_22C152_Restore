@interface NUExtensionAssembly
- (NUExtensionAssembly)initWithExtensionContextProvider:(id)a3;
- (NUExtensionContextProvider)extensionContextProvider;
- (void)loadInRegistry:(id)a3;
@end

@implementation NUExtensionAssembly

- (NUExtensionAssembly)initWithExtensionContextProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NUExtensionAssembly;
  v5 = [(NUExtensionAssembly *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_extensionContextProvider, v4);
  }

  return v6;
}

- (void)loadInRegistry:(id)a3
{
  id v4 = a3;
  v5 = [v4 publicContainer];
  id v6 = (id)[v5 registerProtocol:&unk_26D4CB6B0 factory:&__block_literal_global_3];

  v7 = [v4 publicContainer];
  id v8 = (id)[v7 registerProtocol:&unk_26D4C39E8 factory:&__block_literal_global_53];

  v9 = [v4 publicContainer];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __38__NUExtensionAssembly_loadInRegistry___block_invoke_3;
  v31[3] = &unk_2645FE5F0;
  v31[4] = self;
  id v10 = (id)[v9 registerProtocol:&unk_26D4E2648 factory:v31];

  v11 = [v4 publicContainer];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __38__NUExtensionAssembly_loadInRegistry___block_invoke_4;
  v30[3] = &unk_2645FE618;
  v30[4] = self;
  id v12 = (id)[v11 registerProtocol:&unk_26D4A9AE0 factory:v30];

  v13 = [v4 publicContainer];
  id v14 = (id)[v13 registerProtocol:&unk_26D4BBAF0 factory:&__block_literal_global_82];

  v15 = [v4 publicContainer];
  id v16 = (id)[v15 registerProtocol:&unk_26D4BBCF0 factory:&__block_literal_global_94];

  v17 = [v4 publicContainer];
  id v18 = (id)[v17 registerProtocol:&unk_26D4C6E90 factory:&__block_literal_global_101];

  v19 = [v4 publicContainer];
  id v20 = (id)[v19 registerProtocol:&unk_26D4CCF90 factory:&__block_literal_global_109];

  v21 = [v4 publicContainer];
  id v22 = (id)[v21 registerProtocol:&unk_26D4BC3A0 factory:&__block_literal_global_117];

  v23 = [v4 privateContainer];
  v24 = [v23 registerClass:objc_opt_class() factory:&__block_literal_global_121];
  id v25 = (id)[v24 inScope:2];

  v26 = [v4 privateContainer];

  uint64_t v27 = objc_opt_class();
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __38__NUExtensionAssembly_loadInRegistry___block_invoke_11;
  v29[3] = &unk_2645FE700;
  v29[4] = self;
  id v28 = (id)[v26 registerClass:v27 factory:v29];
}

id __38__NUExtensionAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

id __38__NUExtensionAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

id __38__NUExtensionAssembly_loadInRegistry___block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F6C608]);
  v3 = [*(id *)(a1 + 32) extensionContextProvider];
  id v4 = [v3 extensionContext];
  v5 = (void *)[v2 initWithExtensionContext:v4];

  return v5;
}

NUExtensionDevice *__38__NUExtensionAssembly_loadInRegistry___block_invoke_4(uint64_t a1)
{
  id v2 = [NUExtensionDevice alloc];
  v3 = [MEMORY[0x263F1C920] mainScreen];
  id v4 = [*(id *)(a1 + 32) extensionContextProvider];
  v5 = [v4 hostViewController];
  id v6 = [(NUExtensionDevice *)v2 initWithScreen:v3 hostViewController:v5];

  return v6;
}

id __38__NUExtensionAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

id __38__NUExtensionAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

NUMailPresenter *__38__NUExtensionAssembly_loadInRegistry___block_invoke_7()
{
  v0 = objc_alloc_init(NUMailPresenter);

  return v0;
}

NUMessagePresenter *__38__NUExtensionAssembly_loadInRegistry___block_invoke_8()
{
  v0 = objc_alloc_init(NUMessagePresenter);

  return v0;
}

NUIdleWebViewControllerFactory *__38__NUExtensionAssembly_loadInRegistry___block_invoke_9()
{
  v0 = objc_alloc_init(NUIdleWebViewControllerFactory);

  return v0;
}

NUExtensionAppActivityMonitor *__38__NUExtensionAssembly_loadInRegistry___block_invoke_10()
{
  v0 = [NUExtensionAppActivityMonitor alloc];
  v1 = [MEMORY[0x263F08A00] defaultCenter];
  id v2 = [(NUExtensionAppActivityMonitor *)v0 initWithNotificationCenter:v1];

  return v2;
}

NUExtensionURLHandler *__38__NUExtensionAssembly_loadInRegistry___block_invoke_11(uint64_t a1)
{
  id v2 = [NUExtensionURLHandler alloc];
  v3 = [*(id *)(a1 + 32) extensionContextProvider];
  id v4 = [v3 extensionContext];
  v5 = [(NUExtensionURLHandler *)v2 initWithExtensionContext:v4];

  return v5;
}

- (NUExtensionContextProvider)extensionContextProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionContextProvider);

  return (NUExtensionContextProvider *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end