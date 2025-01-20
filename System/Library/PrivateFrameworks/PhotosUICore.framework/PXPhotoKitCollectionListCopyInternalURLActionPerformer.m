@interface PXPhotoKitCollectionListCopyInternalURLActionPerformer
+ (BOOL)canPerformOnCollectionList:(id)a3;
+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4;
+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitCollectionListCopyInternalURLActionPerformer

+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4
{
  return @"link";
}

+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4
{
  return @"Copy URL";
}

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  v3 = +[PXRootSettings sharedInstance];
  char v4 = [v3 canShowInternalUI];

  return v4;
}

- (void)performUserInteractionTask
{
  v3 = [(PXPhotoKitCollectionListActionPerformer *)self collectionList];
  objc_msgSend(v3, "px_navigationURL");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  char v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v4 setURL:v5];

  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
}

@end