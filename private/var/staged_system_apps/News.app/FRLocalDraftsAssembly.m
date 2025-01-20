@interface FRLocalDraftsAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation FRLocalDraftsAssembly

- (void)loadInRegistry:(id)a3
{
  id v5 = [a3 publicContainer];
  v3 = [v5 registerProtocol:&OBJC_PROTOCOL___TSLocalDraftsDeviceManagerType factory:&stru_1000C9EB8];
  id v4 = [v3 inScope:2];
}

@end