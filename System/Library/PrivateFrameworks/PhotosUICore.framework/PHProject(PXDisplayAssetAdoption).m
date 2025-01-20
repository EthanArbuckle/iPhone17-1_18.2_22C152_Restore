@interface PHProject(PXDisplayAssetAdoption)
- (uint64_t)px_isProject;
@end

@implementation PHProject(PXDisplayAssetAdoption)

- (uint64_t)px_isProject
{
  return 1;
}

@end