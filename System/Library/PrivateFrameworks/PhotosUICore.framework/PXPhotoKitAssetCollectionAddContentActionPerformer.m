@interface PXPhotoKitAssetCollectionAddContentActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (BOOL)_isAddingToSharedAlbum;
- (PXPhotoKitAssetCollectionAddContentActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 parameters:(id)a5;
- (void)_performAddAssets:(id)a3;
- (void)_performMergeAssetCollections:(id)a3;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionAddContentActionPerformer

- (void).cxx_destruct
{
}

- (void)_performMergeAssetCollections:(id)a3
{
  id v4 = a3;
  v5 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  v6 = [[PXMergeAssetCollectionsAction alloc] initWithSourceAssetCollections:self->_content targetAssetCollection:v5];
  v7 = [(PXActionPerformer *)self undoManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__PXPhotoKitAssetCollectionAddContentActionPerformer__performMergeAssetCollections___block_invoke;
  v10[3] = &unk_1E5DD1B00;
  v10[4] = self;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  [(PXAction *)v6 executeWithUndoManager:v7 completionHandler:v10];
}

void __84__PXPhotoKitAssetCollectionAddContentActionPerformer__performMergeAssetCollections___block_invoke(void *a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[5];
      uint64_t v8 = *(void *)(a1[4] + 168);
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "failed merging asset collections to album: %@ %@ %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_performAddAssets:(id)a3
{
  id v5 = a3;
  v6 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  if (v6 && [(PXFastEnumeration *)self->_content count])
  {
    if (([v6 canPerformEditOperation:3] & 1) == 0)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionAddContentActionPerformer.m", 126, @"Attempting to add assets to a non-editable collection: %@", v6 object file lineNumber description];
    }
    uint64_t v7 = [[PXAddAssetsToAssetCollectionAction alloc] initWithAssets:self->_content assetCollection:v6];
    uint64_t v8 = [(PXActionPerformer *)self undoManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__PXPhotoKitAssetCollectionAddContentActionPerformer__performAddAssets___block_invoke;
    v11[3] = &unk_1E5DD1B00;
    v11[4] = self;
    id v12 = v6;
    id v13 = v5;
    [(PXAction *)v7 executeWithUndoManager:v8 completionHandler:v11];
  }
  else
  {
    int v9 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"PXPhotoKitAssetCollectionAddContentActionPerformer did not complete successfully");
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v9);
  }
}

void __72__PXPhotoKitAssetCollectionAddContentActionPerformer__performAddAssets___block_invoke(void *a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[5];
      uint64_t v8 = *(void *)(a1[4] + 168);
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "failed adding assets to album: %@ %@ %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)performBackgroundTask
{
  if ([(PXPhotoKitAssetCollectionAddContentActionPerformer *)self _isAddingToSharedAlbum])
  {
    [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:1 error:0];
  }
  else
  {
    v3 = [(PXFastEnumeration *)self->_content firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __75__PXPhotoKitAssetCollectionAddContentActionPerformer_performBackgroundTask__block_invoke;
      v5[3] = &unk_1E5DD3158;
      v5[4] = self;
      [(PXPhotoKitAssetCollectionAddContentActionPerformer *)self _performAddAssets:v5];
    }
  }
}

uint64_t __75__PXPhotoKitAssetCollectionAddContentActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:a3];
}

- (void)performUserInteractionTask
{
  if ([(PXPhotoKitAssetCollectionAddContentActionPerformer *)self _isAddingToSharedAlbum])
  {
    v28 = self->_content;
    if (v28)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        v26 = [(PXFastEnumeration *)v28 px_descriptionForAssertionMessage];
        [v23 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionAddContentActionPerformer.m", 55, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"_content", v25, v26 object file lineNumber description];
      }
      id v4 = [(PXFastEnumeration *)v28 fetchedObjects];
      id v5 = [(PXAssetCollectionActionPerformer *)self assetCollection];
      [(PXPhotoKitAssetCollectionActionPerformer *)self addAssets:v4 toSharedAlbum:v5];

      return;
    }
    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Invalid contents. PXPhotoKitAssetCollectionAddContentActionPerformer did not complete successfully.");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v6];
  }
  uint64_t v7 = [(PXFastEnumeration *)self->_content firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v9 = PXLocalizedStringFromTable(@"PXPhotoKitAssetCollectionAddContentActionPerformer_MergeAlbumsTitle", @"PhotosUICore");
    id v10 = NSString;
    unint64_t v11 = [(PXFastEnumeration *)self->_content count];
    uint64_t v12 = "One";
    if (v11 > 1) {
      uint64_t v12 = "Many";
    }
    __int16 v13 = objc_msgSend(v10, "stringWithFormat:", @"PXPhotoKitAssetCollectionAddContentActionPerformer_MergeAlbumsMessageFormat_%s", v12);
    uint64_t v14 = PXLocalizedStringFromTable(v13, @"PhotosUICore");

    uint64_t v15 = [(PXAssetCollectionActionPerformer *)self assetCollection];
    v27 = [v15 localizedTitle];
    v16 = PXLocalizedStringWithValidatedFormat(v14, @"%@");

    v17 = PXLocalizedStringFromTable(@"PXPhotoKitAssetCollectionAddContentActionPerformer_MergeAlbumsActionTitle", @"PhotosUICore");
    v18 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v9, v16, 1, v27);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __80__PXPhotoKitAssetCollectionAddContentActionPerformer_performUserInteractionTask__block_invoke;
    v30[3] = &unk_1E5DD0030;
    v30[4] = self;
    v19 = [MEMORY[0x1E4FB1410] actionWithTitle:v17 style:0 handler:v30];
    [v18 addAction:v19];
    v20 = (void *)MEMORY[0x1E4FB1410];
    v21 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __80__PXPhotoKitAssetCollectionAddContentActionPerformer_performUserInteractionTask__block_invoke_3;
    v29[3] = &unk_1E5DD0030;
    v29[4] = self;
    v22 = [v20 actionWithTitle:v21 style:1 handler:v29];

    [v18 addAction:v22];
    [(PXActionPerformer *)self presentViewController:v18];
  }
  else
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
}

uint64_t __80__PXPhotoKitAssetCollectionAddContentActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__PXPhotoKitAssetCollectionAddContentActionPerformer_performUserInteractionTask__block_invoke_2;
  v3[3] = &unk_1E5DD3158;
  v3[4] = v1;
  return [v1 _performMergeAssetCollections:v3];
}

uint64_t __80__PXPhotoKitAssetCollectionAddContentActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
}

uint64_t __80__PXPhotoKitAssetCollectionAddContentActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:a3];
}

- (BOOL)_isAddingToSharedAlbum
{
  v3 = [(PXFastEnumeration *)self->_content firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(PXAssetCollectionActionPerformer *)self assetCollection];
    char v5 = objc_msgSend(v4, "px_isSharedAlbum");
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (PXPhotoKitAssetCollectionAddContentActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 parameters:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [PXDisplayTitleInfo alloc];
  __int16 v13 = [v10 assetCollection];
  uint64_t v14 = [(PXDisplayTitleInfo *)v12 initWithAssetCollection:v13 useVerboseSmartDescription:0];

  v22.receiver = self;
  v22.super_class = (Class)PXPhotoKitAssetCollectionAddContentActionPerformer;
  uint64_t v15 = [(PXAssetCollectionActionPerformer *)&v22 initWithActionType:v11 assetCollectionReference:v10 displayTitleInfo:v14];

  if (v15)
  {
    v16 = [v9 objectForKeyedSubscript:*(void *)off_1E5DAAE78];
    v17 = v16;
    if (v16)
    {
      if ([(PXFastEnumeration *)v16 conformsToProtocol:&unk_1F034EA90])
      {
LABEL_4:
        content = v15->_content;
        v15->_content = v17;

        goto LABEL_5;
      }
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      v21 = [(PXFastEnumeration *)v17 px_descriptionForAssertionMessage];
      [v20 handleFailureInMethod:a2, v15, @"PXPhotoKitAssetCollectionAddContentActionPerformer.m", 41, @"%@ should conform to protocol %@, but %@ doesn't", @"parameters[PXActionParameterKeyContent]", @"PXFastEnumeration", v21 object file lineNumber description];
    }
    else
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, v15, @"PXPhotoKitAssetCollectionAddContentActionPerformer.m", 41, @"%@ should conform to protocol %@, but it is nil", @"parameters[PXActionParameterKeyContent]", @"PXFastEnumeration" object file lineNumber description];
    }

    goto LABEL_4;
  }
LABEL_5:

  return v15;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v6 = [a3 assetCollection];
  if (!v6)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionAddContentActionPerformer.m", 30, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v11 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v12);
    __int16 v13 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionAddContentActionPerformer.m", 30, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v11, v13 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  char v7 = [v6 canPerformEditOperation:3];

  return v7;
}

@end