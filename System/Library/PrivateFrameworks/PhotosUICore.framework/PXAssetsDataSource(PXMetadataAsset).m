@interface PXAssetsDataSource(PXMetadataAsset)
- (id)metadataAssetAtItemIndexPath:()PXMetadataAsset;
@end

@implementation PXAssetsDataSource(PXMetadataAsset)

- (id)metadataAssetAtItemIndexPath:()PXMetadataAsset
{
  long long v3 = a3[1];
  v6[0] = *a3;
  v6[1] = v3;
  v4 = [a1 objectAtIndexPath:v6];
  return v4;
}

@end