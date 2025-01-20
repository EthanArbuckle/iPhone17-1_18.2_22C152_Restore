@interface SXRenderingConfigurationAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXRenderingConfigurationAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerProtocol:&unk_26D61F8A8 factory:&__block_literal_global_20];

  id v7 = [v3 privateContainer];

  id v6 = (id)[v7 registerClass:objc_opt_class() factory:&__block_literal_global_46];
}

id __51__SXRenderingConfigurationAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

SXRenderingConfigurationOptionsManager *__51__SXRenderingConfigurationAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXRenderingConfigurationOptionsManager alloc];
  v4 = [v2 resolveProtocol:&unk_26D5F1270];
  id v5 = [v2 resolveProtocol:&unk_26D6412E0];

  id v6 = [(SXRenderingConfigurationOptionsManager *)v3 initWithDocumentProvider:v4 configurationProvider:v5];
  return v6;
}

@end