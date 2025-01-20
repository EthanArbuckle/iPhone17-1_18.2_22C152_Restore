@interface _PXPhotoKitAssetCollectionFavoriteActionPerformer
+ (BOOL)_targetFavoriteStateForAssetCollectionReference:(id)a3;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
@end

@implementation _PXPhotoKitAssetCollectionFavoriteActionPerformer

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([a1 _targetFavoriteStateForAssetCollectionReference:0] & 1) == 0) {
    PXAssertGetLog();
  }
  v11 = +[PXActivity activityWithActionTitle:v8 actionType:v9 activityType:@"PXActivityTypeAddToFavoriteMemories" systemImageName:v10];

  return v11;
}

+ (BOOL)_targetFavoriteStateForAssetCollectionReference:(id)a3
{
  return 1;
}

@end