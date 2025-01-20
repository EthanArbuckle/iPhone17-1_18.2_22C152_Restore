@interface PUPhotoKitSuggestLessPersonActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (BOOL)suggestLessPeopleHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)suggestLessPeopleHelper:(id)a3 presentViewController:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PUPhotoKitSuggestLessPersonActionPerformer

- (void).cxx_destruct
{
}

- (BOOL)suggestLessPeopleHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return [(PUAssetActionPerformer *)self dismissViewController:a4 completionHandler:a5];
}

- (BOOL)suggestLessPeopleHelper:(id)a3 presentViewController:(id)a4
{
  return [(PUAssetActionPerformer *)self presentViewController:a4];
}

- (void)performUserInteractionTask
{
  id v3 = objc_alloc(MEMORY[0x1E4F907B8]);
  v4 = [(PUAssetActionPerformer *)self undoManager];
  v5 = (PXSuggestLessPeopleHelper *)[v3 initWithUndoManager:v4];
  suggestLessPeopleHelper = self->_suggestLessPeopleHelper;
  self->_suggestLessPeopleHelper = v5;

  [(PXSuggestLessPeopleHelper *)self->_suggestLessPeopleHelper setDelegate:self];
  v7 = self->_suggestLessPeopleHelper;
  v8 = [(PUAssetActionPerformer *)self assets];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__PUPhotoKitSuggestLessPersonActionPerformer_performUserInteractionTask__block_invoke;
  v9[3] = &unk_1E5F2E3B8;
  v9[4] = self;
  [(PXSuggestLessPeopleHelper *)v7 suggestLessPeopleFromAssets:v8 completionHandler:v9];
}

void __72__PUPhotoKitSuggestLessPersonActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Could not suggest this person less: %@", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PUPhotoKitSuggestLessPersonActionPerformer_performUserInteractionTask__block_invoke_595;
  block[3] = &unk_1E5F2DCD0;
  uint64_t v7 = *(void *)(a1 + 32);
  char v11 = a2;
  block[4] = v7;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __72__PUPhotoKitSuggestLessPersonActionPerformer_performUserInteractionTask__block_invoke_595(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 1;
}

@end