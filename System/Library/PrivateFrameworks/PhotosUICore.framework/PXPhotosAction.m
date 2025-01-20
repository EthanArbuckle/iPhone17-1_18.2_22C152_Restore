@interface PXPhotosAction
- (PHFetchOptions)standardFetchOptions;
- (PHPhotoLibrary)photoLibrary;
- (PXFastEnumeration)assets;
- (PXFastEnumeration)collections;
- (PXPhotosAction)init;
- (PXPhotosAction)initWithPhotoLibrary:(id)a3;
- (int64_t)assetCount;
- (void)performChanges:(id)a3 completionHandler:(id)a4;
@end

@implementation PXPhotosAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardFetchOptions, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (PHFetchOptions)standardFetchOptions
{
  return self->_standardFetchOptions;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)performChanges:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = PLUIActionsGetLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v12 = [(PXAction *)self actionIdentifier];
    *(_DWORD *)buf = 138543362;
    v21 = v12;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PhotosAction", "Identifier=%{public}@", buf, 0xCu);
  }
  v13 = [(PXPhotosAction *)self photoLibrary];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__PXPhotosAction_performChanges_completionHandler___block_invoke;
  v16[3] = &unk_1E5DB9C38;
  id v18 = v6;
  os_signpost_id_t v19 = v9;
  v17 = v11;
  id v14 = v6;
  v15 = v11;
  [v13 performChanges:v7 completionHandler:v16];
}

void __51__PXPhotosAction_performChanges_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = *(id *)(a1 + 32);
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PhotosAction", "", v8, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (PXFastEnumeration)collections
{
  return (PXFastEnumeration *)MEMORY[0x1E4F1CBF0];
}

- (int64_t)assetCount
{
  v2 = [(PXPhotosAction *)self assets];
  int64_t v3 = [v2 count];

  return v3;
}

- (PXFastEnumeration)assets
{
  return (PXFastEnumeration *)MEMORY[0x1E4F1CBF0];
}

- (PXPhotosAction)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosAction.m", 28, @"%s is not available as initializer", "-[PXPhotosAction init]");

  abort();
}

- (PXPhotosAction)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosAction;
  id v6 = [(PXPhotosAction *)&v11 init];
  os_signpost_id_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    uint64_t v8 = [v5 librarySpecificFetchOptions];
    standardFetchOptions = v7->_standardFetchOptions;
    v7->_standardFetchOptions = (PHFetchOptions *)v8;
  }
  return v7;
}

@end