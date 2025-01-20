@interface SXNewsletterAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXNewsletterAssembly

- (void)loadInRegistry:(id)a3
{
  id v4 = [a3 publicContainer];
  id v3 = (id)[v4 registerProtocol:&unk_26D600690 factory:&__block_literal_global_44];
}

SXNewsletterSubscriptionStatusProvider *__39__SXNewsletterAssembly_loadInRegistry___block_invoke()
{
  v0 = objc_alloc_init(SXNewsletterSubscriptionStatusProvider);
  return v0;
}

@end