@interface PXPhotoKitSelectLiveVariationAssetActionPerformer
+ (id)editOperationType;
@end

@implementation PXPhotoKitSelectLiveVariationAssetActionPerformer

+ (id)editOperationType
{
  return PXAssetEditOperationTypeForVariationType(0);
}

@end