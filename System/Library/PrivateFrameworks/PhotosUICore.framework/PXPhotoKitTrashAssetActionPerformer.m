@interface PXPhotoKitTrashAssetActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformOnSubsetOfSelection;
+ (BOOL)isActionDestructive;
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (id)actionType;
- (int64_t)destructivePhotosAction;
@end

@implementation PXPhotoKitTrashAssetActionPerformer

+ (BOOL)isActionDestructive
{
  return 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  v4 = NSString;
  if (a3 > 2) {
    v5 = 0;
  }
  else {
    v5 = off_1E5DB8B58[a3];
  }
  v6 = v5;
  v7 = [v4 stringWithFormat:@"PXPhotoKitAssetActionManager%@Title_Trash_Library", v6];

  v8 = PXLocalizedStringFromTable(v7, @"PhotosUICore");

  return v8;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"trash";
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  v6 = (objc_class *)MEMORY[0x1E4FB14A8];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithBarButtonSystemItem:16 target:v7 action:a4];

  return v8;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v7 = a3;
  id v8 = a4;
  if (([v8 isTrashBin] & 1) != 0
    || (objc_msgSend(v8, "px_isRecoveredSmartAlbum") & 1) != 0
    || ![v8 canPerformEditOperation:1])
  {
    char v9 = 0;
  }
  else
  {
    char v9 = [v7 canPerformEditOperation:1];
  }

  return v9;
}

- (id)actionType
{
  v2 = @"PXAssetActionTypeTrash";
  return @"PXAssetActionTypeTrash";
}

- (int64_t)destructivePhotosAction
{
  return 0;
}

@end