@interface PXImportFilesAction
- (PHFetchResult)importedAssets;
- (PXImportFilesAction)initWithPhotoLibrary:(id)a3 fileURLs:(id)a4 assetCollection:(id)a5;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXImportFilesAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importedAssets, 0);
  objc_storeStrong((id *)&self->_importedAssetsIdentifiers, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_fileURLs, 0);
}

- (PHFetchResult)importedAssets
{
  if (!self->_importedAssets && [(NSArray *)self->_importedAssetsIdentifiers count])
  {
    v3 = (void *)MEMORY[0x1E4F38EB8];
    importedAssetsIdentifiers = self->_importedAssetsIdentifiers;
    v5 = [(PXPhotosAction *)self standardFetchOptions];
    v6 = [v3 fetchAssetsWithLocalIdentifiers:importedAssetsIdentifiers options:v5];
    importedAssets = self->_importedAssets;
    self->_importedAssets = v6;
  }
  v8 = self->_importedAssets;
  return v8;
}

- (void)performUndo:(id)a3
{
  id v14 = a3;
  v5 = [(PXImportFilesAction *)self importedAssets];
  v6 = [PXActionRecord alloc];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = -[PXActionRecord initWithSourceIdentifier:variant:assetCount:userConfirmation:](v6, "initWithSourceIdentifier:variant:assetCount:userConfirmation:", v8, @"undoing", [v5 count], 4);

  v10 = +[PXDestructiveAssetsAction actionWithAssets:v5 record:v9];
  if (!v10)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXImportFilesAction.m", 74, @"Invalid parameter not satisfying: %@", @"deleteAssetsAction != nil" object file lineNumber description];
  }
  [v10 executeWithUndoManager:0 completionHandler:v14];
  importedAssetsIdentifiers = self->_importedAssetsIdentifiers;
  self->_importedAssetsIdentifiers = 0;

  importedAssets = self->_importedAssets;
  self->_importedAssets = 0;
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  fileURLs = self->_fileURLs;
  v6 = [(PXPhotosAction *)self photoLibrary];
  assetCollection = self->_assetCollection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__PXImportFilesAction_performAction___block_invoke;
  v10[3] = &unk_1E5DB8FE8;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  id v9 = +[PXImportController importFilesAtURLs:fileURLs photoLibrary:v6 collection:assetCollection checkDuplicates:0 referenced:0 delegate:0 completionHandler:v10];
}

void __37__PXImportFilesAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([v10 result] == 1)
  {
    v3 = [v10 exceptions];
    if ([v3 count])
    {
      id v4 = [v3 firstObject];
      v5 = [v4 underlyingError];

      v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithUnderlyingError:debugDescription:", v5, @"Import failed");
    }
    else
    {
      v5 = [v10 importRecords];
      uint64_t v7 = [v5 valueForKey:@"assetIdentifier"];
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(void **)(v8 + 104);
      *(void *)(v8 + 104) = v7;

      v6 = 0;
    }
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Import did not complete");
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)actionNameLocalizationKey
{
  return @"PXImportFilesActionName";
}

- (id)actionIdentifier
{
  return @"ImportFiles";
}

- (PXImportFilesAction)initWithPhotoLibrary:(id)a3 fileURLs:(id)a4 assetCollection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXImportFilesAction.m", 24, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  if (![v10 count])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXImportFilesAction.m", 25, @"Invalid parameter not satisfying: %@", @"fileURLs.count" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)PXImportFilesAction;
  v12 = [(PXPhotosAction *)&v18 initWithPhotoLibrary:v9];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    fileURLs = v12->_fileURLs;
    v12->_fileURLs = (NSArray *)v13;

    objc_storeStrong((id *)&v12->_assetCollection, a5);
  }

  return v12;
}

@end