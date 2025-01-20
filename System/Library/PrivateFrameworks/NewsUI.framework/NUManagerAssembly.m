@interface NUManagerAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation NUManagerAssembly

- (void)loadInRegistry:(id)a3
{
  id v4 = [a3 publicContainer];
  id v3 = (id)[v4 registerProtocol:&unk_26D4CCE00 factory:&__block_literal_global_2];
}

NUArticleContentSizeManager *__36__NUManagerAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  id v4 = [NUArticleContentSizeManager alloc];
  v5 = [v3 tagSettings];
  v6 = [(NUArticleContentSizeManager *)v4 initWithTagSettings:v5];

  return v6;
}

@end