@interface PommesSearchServiceLauncher
- (PommesSearchServiceLauncher)init;
- (PommesSearchXPCServer)pommesSearchService;
@end

@implementation PommesSearchServiceLauncher

- (PommesSearchServiceLauncher)init
{
  v6.receiver = self;
  v6.super_class = (Class)PommesSearchServiceLauncher;
  v2 = [(PommesSearchServiceLauncher *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(PommesSearchXPCServer);
    pommesSearchService = v2->_pommesSearchService;
    v2->_pommesSearchService = v3;
  }
  return v2;
}

- (PommesSearchXPCServer)pommesSearchService
{
  return self->_pommesSearchService;
}

- (void).cxx_destruct
{
}

@end