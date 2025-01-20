@interface PXCreateSharedAlbumActionPerformer
- (PHPhotoLibrary)photoLibrary;
- (PXCreateSharedAlbumActionPerformer)initWithPhotoLibrary:(id)a3 presentationEnvironment:(id)a4;
- (void)performLemonadeUserInteractionTask;
- (void)performUserInteractionTask;
- (void)photoStreamComposeService:(id)a3 didPostComment:(id)a4;
- (void)photoStreamComposeServiceDidCancel:(id)a3;
- (void)setPhotoLibrary:(id)a3;
@end

@implementation PXCreateSharedAlbumActionPerformer

- (void)performLemonadeUserInteractionTask
{
  v2 = self;
  PXCreateSharedAlbumActionPerformer.performLemonadeUserInteractionTask()();
}

- (void).cxx_destruct
{
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)photoStreamComposeServiceDidCancel:(id)a3
{
  id v7 = a3;
  v5 = [(PXActionPerformer *)self presentationEnvironment];
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXCreateSharedAlbumActionPerformer.m", 78, @"Invalid parameter not satisfying: %@", @"presentationEnvironment" object file lineNumber description];
  }
  [v5 dismissViewController:v7 animated:1 completionHandler:0];
}

- (void)photoStreamComposeService:(id)a3 didPostComment:(id)a4
{
  id v8 = a3;
  v6 = [(PXActionPerformer *)self presentationEnvironment];
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXCreateSharedAlbumActionPerformer.m", 72, @"Invalid parameter not satisfying: %@", @"presentationEnvironment" object file lineNumber description];
  }
  [v6 dismissViewController:v8 animated:1 completionHandler:0];
}

- (void)performUserInteractionTask
{
  v4 = [(PXCreateSharedAlbumActionPerformer *)self photoLibrary];
  v5 = [(PXActionPerformer *)self presentationEnvironment];
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXCreateSharedAlbumActionPerformer.m", 49, @"Invalid parameter not satisfying: %@", @"presentationEnvironment" object file lineNumber description];
  }
  v6 = (void *)MEMORY[0x1E4F8AAB0];
  id v7 = [v4 photoLibrary];
  id v19 = 0;
  int v8 = [v6 canCreateStreamInPhotoLibrary:v7 error:&v19];
  id v9 = v19;

  if (v8)
  {
    [(PXCreateSharedAlbumActionPerformer *)self performLemonadeUserInteractionTask];
  }
  else
  {
    v10 = [v9 localizedDescription];
    v11 = [v9 localizedFailureReason];
    v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v10 message:v11 preferredStyle:1];
    v13 = (void *)MEMORY[0x1E4FB1410];
    v14 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __64__PXCreateSharedAlbumActionPerformer_performUserInteractionTask__block_invoke;
    v17[3] = &unk_1E5DD1068;
    v17[4] = self;
    id v18 = v9;
    v15 = [v13 actionWithTitle:v14 style:1 handler:v17];

    [v12 addAction:v15];
    [v5 presentViewController:v12 animated:1 completionHandler:0];
  }
}

uint64_t __64__PXCreateSharedAlbumActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:*(void *)(a1 + 40)];
}

- (PXCreateSharedAlbumActionPerformer)initWithPhotoLibrary:(id)a3 presentationEnvironment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXCreateSharedAlbumActionPerformer.m", 35, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"PXCreateSharedAlbumActionPerformer.m", 36, @"Invalid parameter not satisfying: %@", @"presentationEnvironment" object file lineNumber description];

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)PXCreateSharedAlbumActionPerformer;
  v10 = [(PXActionPerformer *)&v15 initWithActionType:@"PXActionCreateEmptySharedAlbum"];
  v11 = v10;
  if (v10)
  {
    [(PXCreateSharedAlbumActionPerformer *)v10 setPhotoLibrary:v7];
    [(PXActionPerformer *)v11 setPresentationEnvironment:v9];
  }

  return v11;
}

@end