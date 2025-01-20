@interface PUPXPhotoKitCompositeVideoActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (void)activity:(id)a3 didFinishWithSuccess:(BOOL)a4 error:(id)a5;
- (void)performUserInteractionTask;
@end

@implementation PUPXPhotoKitCompositeVideoActionPerformer

- (void).cxx_destruct
{
}

- (void)activity:(id)a3 didFinishWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v10 = a5;
  v7 = [(PUCompositeVideoActivity *)self->_compositeVideoActivity activityViewController];
  [(PXActionPerformer *)self dismissViewController:v7 completionHandler:0];

  v8 = [v10 domain];
  if ([v8 isEqualToString:*MEMORY[0x1E4F281F8]]) {
    BOOL v9 = [v10 code] == 3072;
  }
  else {
    BOOL v9 = 0;
  }

  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:v5 | v9 error:v10];
}

- (void)performUserInteractionTask
{
  v3 = objc_alloc_init(PUCompositeVideoActivity);
  compositeVideoActivity = self->_compositeVideoActivity;
  self->_compositeVideoActivity = v3;

  [(PXActivity *)self->_compositeVideoActivity setActionDelegate:self];
  BOOL v5 = self->_compositeVideoActivity;
  uint64_t v6 = [(PXActionPerformer *)self hostViewController];
  v7 = [(PXPhotoKitAssetActionPerformer *)self assets];
  [(PUCompositeVideoActivity *)v5 prepareWithViewController:v6 assets:v7];

  v8 = [(PUCompositeVideoActivity *)self->_compositeVideoActivity activityViewController];
  LOBYTE(v6) = [(PXActionPerformer *)self presentViewController:v8];

  if ((v6 & 1) == 0)
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"video";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PULocalizedString(@"SHARING_SAVE_LIVE_PHOTO_VIDEO_ACTIVITY_TITLE");
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithObjects:", a3, 0);
  if (+[PUCompositeVideoActivity canPerformWithAssets:v8])
  {
    int v9 = [v7 isTrashBin] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

@end