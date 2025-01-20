@interface PUPXPhotoKitAlbumStreamActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (void)activity:(id)a3 didFinishWithSuccess:(BOOL)a4 error:(id)a5;
- (void)performUserInteractionTask;
@end

@implementation PUPXPhotoKitAlbumStreamActionPerformer

- (void).cxx_destruct
{
}

- (void)activity:(id)a3 didFinishWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v10 = a5;
  v7 = [(PUAlbumStreamActivity *)self->_albumStreamActivity activityViewController];
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
  v3 = objc_alloc_init(PUAlbumStreamActivity);
  albumStreamActivity = self->_albumStreamActivity;
  self->_albumStreamActivity = v3;

  [(PUAlbumStreamActivity *)self->_albumStreamActivity setPresentedFromActivityViewController:0];
  [(PXActivity *)self->_albumStreamActivity setActionDelegate:self];
  BOOL v5 = self->_albumStreamActivity;
  v6 = (void *)MEMORY[0x1E4F1CAA0];
  v7 = [(PXPhotoKitAssetActionPerformer *)self assets];
  uint64_t v8 = [v6 orderedSetWithArray:v7];
  [(PUAlbumStreamActivity *)v5 prepareWithAssets:v8];

  BOOL v9 = [(PUAlbumStreamActivity *)self->_albumStreamActivity activityViewController];
  LOBYTE(v8) = [(PXActionPerformer *)self presentViewController:v9];

  if ((v8 & 1) == 0)
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"rectangle.stack.badge.person.crop";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PULocalizedString(@"PUBLISH_ALBUM_STREAMING_SERVICE");
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v7 = a3;
  if (objc_msgSend(a4, "px_isRecentlyDeletedSmartAlbum"))
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v9 = objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithObjects:", v7, 0);
    BOOL v8 = +[PUAlbumStreamActivity canPerformWithAssets:v9];
  }
  return v8;
}

@end