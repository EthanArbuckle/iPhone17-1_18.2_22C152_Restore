@interface PXPhotoKitSelectMirrorVariationAssetActionPerformer
+ (id)editOperationType;
@end

@implementation PXPhotoKitSelectMirrorVariationAssetActionPerformer

+ (id)editOperationType
{
  return PXAssetEditOperationTypeForVariationType(2);
}

@end