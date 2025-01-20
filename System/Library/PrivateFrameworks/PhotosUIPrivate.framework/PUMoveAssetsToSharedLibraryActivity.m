@interface PUMoveAssetsToSharedLibraryActivity
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation PUMoveAssetsToSharedLibraryActivity

- (void).cxx_destruct
{
}

- (void)performActivity
{
  v4 = [(PXActivity *)self itemSourceController];
  v5 = [v4 assets];

  if (!v5 || ![v5 count])
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = NSStringFromSelector(a2);
    [v19 handleFailureInMethod:a2, self, @"PUMoveAssetsToSharedLibraryActivity.m", 71, @"Expecting non-empty, non-zero assets in %@", v20 object file lineNumber description];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke;
  aBlock[3] = &unk_1E5F2E3B8;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke_3;
  v26[3] = &unk_1E5F2BE88;
  v26[4] = self;
  id v7 = v5;
  id v27 = v7;
  SEL v29 = a2;
  id v8 = v6;
  id v28 = v8;
  v9 = (void (**)(void))_Block_copy(v26);
  if (PXSharedLibraryShouldDisplayMoveToSharedLibraryConfirmation())
  {
    v10 = [v7 array];
    uint64_t v25 = 0;
    PXSharedLibraryGetMoveToSharedLibraryConfirmationTitleAndMessage();
    id v11 = 0;

    v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v11 preferredStyle:0];
    v13 = (void *)MEMORY[0x1E4FB1410];
    v14 = [(PUMoveAssetsToSharedLibraryActivity *)self activityTitle];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke_220;
    v23[3] = &unk_1E5F2E898;
    v24 = v9;
    v15 = [v13 actionWithTitle:v14 style:0 handler:v23];
    [v12 addAction:v15];

    v16 = (void *)MEMORY[0x1E4FB1410];
    v17 = PXLocalizedString();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke_2_224;
    v21[3] = &unk_1E5F2E898;
    id v22 = v8;
    v18 = [v16 actionWithTitle:v17 style:1 handler:v21];
    [v12 addAction:v18];

    [(UIViewController *)self->_presenterViewController px_presentOverTopmostPresentedViewController:v12 animated:1 completion:0];
  }
  else
  {
    v9[2](v9);
  }
}

void __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    [v3 activityDidFinish:1];
  }
  else
  {
    v4 = PXLocalizedSharedLibraryString();
    v5 = PXLocalizedSharedLibraryString();
    v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:v5 preferredStyle:1];
    id v7 = (void *)MEMORY[0x1E4FB1410];
    id v8 = PXLocalizedString();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke_2;
    v10[3] = &unk_1E5F2BF98;
    v10[4] = *(void *)(a1 + 32);
    v9 = [v7 actionWithTitle:v8 style:0 handler:v10];
    [v6 addAction:v9];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "px_presentOverTopmostPresentedViewController:animated:completion:", v6, 1, 0);
  }
}

uint64_t __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) itemSourceController];
  v3 = [v2 assets];
  uint64_t v4 = [v3 count];
  uint64_t v5 = [*(id *)(a1 + 40) count];

  if (v4 != v5)
  {
    v6 = PXAssertGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v10 = 138412290;
      id v11 = v9;
      _os_log_error_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Number of original assets changed in %@!", (uint8_t *)&v10, 0xCu);
    }
  }
  id v7 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to move assets to shared library. Calling PXSharedLibraryMoveAssetsToSharedLibrary()", (uint8_t *)&v10, 2u);
  }

  return PXSharedLibraryMoveAssetsToSharedLibrary();
}

uint64_t __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke_220(uint64_t a1)
{
  PXSharedLibrarySetDidConfirmMoveToSharedLibrary();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

uint64_t __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke_2_224(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __54__PUMoveAssetsToSharedLibraryActivity_performActivity__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityDidFinish:0];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v4 = [(PXActivity *)self itemSourceController];
  int v5 = [v4 isPreparingIndividualItems];

  if (!v5) {
    return 0;
  }
  v6 = [(PXActivity *)self itemSourceController];
  id v7 = [v6 assets];

  LOBYTE(v6) = PXSharedLibraryCanMoveAssetsToSharedLibrary();
  return (char)v6;
}

- (id)_systemImageName
{
  return @"person.2";
}

- (id)activityTitle
{
  v2 = [(PXActivity *)self itemSourceController];
  v3 = [v2 assets];
  uint64_t v4 = [v3 firstObject];

  int v5 = (void *)MEMORY[0x1E4F90690];
  v6 = [v4 photoLibrary];
  id v7 = [v5 sharedLibraryStatusProviderWithPhotoLibrary:v6];

  [v7 hasPreview];
  id v8 = PXLocalizedSharedLibraryString();

  return v8;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90A70];
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  objc_storeStrong((id *)&self->_presenterViewController, a3);
  id v9 = a3;
  id v10 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PUMoveAssetsToSharedLibraryActivity;
  LOBYTE(v6) = [(PXActivity *)&v12 _presentActivityOnViewController:v9 animated:v6 completion:v10];

  return v6;
}

@end