@interface PXPhotoKitSelectLongExposureVariationAssetActionPerformer
+ (id)editOperationType;
@end

@implementation PXPhotoKitSelectLongExposureVariationAssetActionPerformer

+ (id)editOperationType
{
  return PXAssetEditOperationTypeForVariationType(3);
}

@end