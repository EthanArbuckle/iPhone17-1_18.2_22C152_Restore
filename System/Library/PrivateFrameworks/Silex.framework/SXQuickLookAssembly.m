@interface SXQuickLookAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXQuickLookAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerProtocol:&unk_26D61E288 factory:&__block_literal_global_29];

  v6 = [v3 publicContainer];
  id v7 = (id)[v6 registerProtocol:&unk_26D62F240 factory:&__block_literal_global_50];

  v8 = [v3 privateContainer];
  id v9 = (id)[v8 registerClass:objc_opt_class() factory:&__block_literal_global_55_5];

  v10 = [v3 privateContainer];
  id v11 = (id)[v10 registerProtocol:&unk_26D5B0C80 factory:&__block_literal_global_72];

  v12 = [v3 privateContainer];
  v13 = [v12 registerClass:objc_opt_class() factory:&__block_literal_global_76_0];
  id v14 = (id)[v13 withConfiguration:&__block_literal_global_88];

  v15 = [v3 privateContainer];
  v16 = [v15 registerProtocol:&unk_26D62F2C0 factory:&__block_literal_global_91];
  id v17 = (id)[v16 withConfiguration:&__block_literal_global_100];

  v18 = [v3 privateContainer];
  id v19 = (id)[v18 registerProtocol:&unk_26D5CE620 factory:&__block_literal_global_103];

  v20 = [v3 privateContainer];
  id v21 = (id)[v20 registerProtocol:&unk_26D619B78 factory:&__block_literal_global_107];

  v22 = [v3 privateContainer];
  id v23 = (id)[v22 registerProtocol:&unk_26D6323C8 factory:&__block_literal_global_111_0];

  id v25 = [v3 privateContainer];

  id v24 = (id)[v25 registerProtocol:&unk_26D5C90C8 factory:&__block_literal_global_118_0];
}

SXQuickLookModule *__38__SXQuickLookAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SXQuickLookModule alloc] initWithResolver:v2];

  return v3;
}

SXQuickLookPreviewViewControllerFactory *__38__SXQuickLookAssembly_loadInRegistry___block_invoke_2()
{
  v0 = objc_alloc_init(SXQuickLookPreviewViewControllerFactory);
  return v0;
}

SXQuickLookViewController *__38__SXQuickLookAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXQuickLookViewController alloc];
  v4 = [v2 resolveProtocol:&unk_26D5B0C80];
  id v5 = [v2 resolveProtocol:&unk_26D6323C8];

  v6 = [(SXQuickLookViewController *)v3 initWithEventHandler:v4 renderer:v5];
  return v6;
}

id __38__SXQuickLookAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

SXQuickLookEventHandler *__38__SXQuickLookAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXQuickLookEventHandler alloc];
  v4 = [v2 resolveProtocol:&unk_26D62F2C0];
  id v5 = [v2 resolveProtocol:&unk_26D5CE620];

  v6 = [(SXQuickLookEventHandler *)v3 initWithInteractor:v4 router:v5];
  return v6;
}

void __38__SXQuickLookAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v5 resolveClass:objc_opt_class()];

  [v4 setDelegate:v6];
}

SXQuickLookInteractor *__38__SXQuickLookAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXQuickLookInteractor alloc];
  id v4 = [v2 resolveClass:objc_opt_class()];
  id v5 = [v2 resolveProtocol:&unk_26D619B78];

  id v6 = [(SXQuickLookInteractor *)v3 initWithFile:v4 service:v5];
  return v6;
}

void __38__SXQuickLookAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 resolveProtocol:&unk_26D5B0C80];
  [v4 setDelegate:v5];
}

SXQuickLookRouter *__38__SXQuickLookAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SXQuickLookRouter alloc] initWithResolver:v2];

  return v3;
}

SXQuickLookService *__38__SXQuickLookAssembly_loadInRegistry___block_invoke_10()
{
  v0 = objc_alloc_init(SXQuickLookService);
  return v0;
}

SXQuickLookRenderer *__38__SXQuickLookAssembly_loadInRegistry___block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXQuickLookRenderer alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5C90C8];

  id v5 = [(SXQuickLookRenderer *)v3 initWithStyler:v4];
  return v5;
}

SXQuickLookStyler *__38__SXQuickLookAssembly_loadInRegistry___block_invoke_12()
{
  v0 = objc_alloc_init(SXQuickLookStyler);
  return v0;
}

@end