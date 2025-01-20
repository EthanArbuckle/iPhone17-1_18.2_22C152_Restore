@interface SWCoreAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SWCoreAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerProtocol:&unk_26D834F88 factory:&__block_literal_global_6];

  id v7 = [v3 publicContainer];

  id v6 = (id)[v7 registerProtocol:&unk_26D834DA8 factory:&__block_literal_global_62_0];
}

SWLogger *__33__SWCoreAssembly_loadInRegistry___block_invoke()
{
  v0 = objc_alloc_init(SWLogger);
  return v0;
}

SWLocation *__33__SWCoreAssembly_loadInRegistry___block_invoke_2()
{
  v0 = [[SWLocation alloc] initWithContext:@"unknown" URL:0];
  return v0;
}

@end