@interface SXBookmarkAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXBookmarkAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  v5 = [v4 registerProtocol:&unk_26D5DEC78 factory:&__block_literal_global_19];
  id v6 = (id)[v5 withConfiguration:&__block_literal_global_4];

  id v8 = [v3 publicContainer];

  id v7 = (id)[v8 registerClass:objc_opt_class() factory:&__block_literal_global_9];
}

SXBookmarkManager *__37__SXBookmarkAssembly_loadInRegistry___block_invoke()
{
  v0 = objc_alloc_init(SXBookmarkManager);
  return v0;
}

void __37__SXBookmarkAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v5 resolveClass:objc_opt_class()];

  [v4 registerApplicator:v6 bookmarkType:objc_opt_class()];
}

SXComponentBookmarkApplicator *__37__SXBookmarkAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXComponentBookmarkApplicator alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5AF438];

  id v5 = [(SXComponentBookmarkApplicator *)v3 initWithScrollPositionRestoring:v4];
  return v5;
}

@end