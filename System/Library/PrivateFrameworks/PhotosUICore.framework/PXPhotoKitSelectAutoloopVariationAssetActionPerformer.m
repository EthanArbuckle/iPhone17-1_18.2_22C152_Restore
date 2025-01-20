@interface PXPhotoKitSelectAutoloopVariationAssetActionPerformer
+ (id)editOperationType;
@end

@implementation PXPhotoKitSelectAutoloopVariationAssetActionPerformer

+ (id)editOperationType
{
  return PXAssetEditOperationTypeForVariationType(1);
}

@end