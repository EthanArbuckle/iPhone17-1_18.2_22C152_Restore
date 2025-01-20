@interface PUAssetExplorerReviewScreenSimpleActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4;
@end

@implementation PUAssetExplorerReviewScreenSimpleActionPerformer

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 1;
}

@end