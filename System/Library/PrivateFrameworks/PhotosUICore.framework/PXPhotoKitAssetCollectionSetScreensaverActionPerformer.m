@interface PXPhotoKitAssetCollectionSetScreensaverActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
@end

@implementation PXPhotoKitAssetCollectionSetScreensaverActionPerformer

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(@"PXPhotoKitAssetCollectionManagerStandardActionTitle_SetScreensaver", @"PhotosUICore");
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return 0;
}

@end