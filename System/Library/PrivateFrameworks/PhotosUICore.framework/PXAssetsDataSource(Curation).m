@interface PXAssetsDataSource(Curation)
- (uint64_t)isAssetAtIndexPathPartOfCuratedSet:()Curation;
@end

@implementation PXAssetsDataSource(Curation)

- (uint64_t)isAssetAtIndexPathPartOfCuratedSet:()Curation
{
  return 1;
}

@end