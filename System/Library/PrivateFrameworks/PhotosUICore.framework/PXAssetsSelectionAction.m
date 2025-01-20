@interface PXAssetsSelectionAction
- (PXAssetsSelectionAction)initWithSelectionSnapshot:(id)a3;
- (PXFastEnumeration)selectedAssets;
- (PXPhotosDataSource)photosDataSource;
- (PXSelectionSnapshot)selectionSnapshot;
- (void)enumerateSelectedAssetIndexSetsUsingBlock:(id)a3;
@end

@implementation PXAssetsSelectionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (PXFastEnumeration)selectedAssets
{
  v2 = [(PXAssetsSelectionAction *)self selectionSnapshot];
  v3 = [v2 allItemsEnumerator];

  return (PXFastEnumeration *)v3;
}

- (void)enumerateSelectedAssetIndexSetsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(PXAssetsSelectionAction *)self photosDataSource];
  v6 = [(PXAssetsSelectionAction *)self selectionSnapshot];
  v7 = [v6 selectedIndexPaths];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__PXAssetsSelectionAction_enumerateSelectedAssetIndexSetsUsingBlock___block_invoke;
  v10[3] = &unk_1E5DB1628;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  [v7 enumerateItemIndexSetsUsingBlock:v10];
}

void __69__PXAssetsSelectionAction_enumerateSelectedAssetIndexSetsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v9 = [v6 assetCollectionForSection:a3];
  id v8 = [*(id *)(a1 + 32) assetsInSection:a3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (PXAssetsSelectionAction)initWithSelectionSnapshot:(id)a3
{
  id v6 = a3;
  id v7 = [v6 dataSource];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    v16 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, self, @"PXAssetsSelectionAction.m", 23, @"%@ should be an instance inheriting from %@, but it is %@", @"selectionSnapshot.dataSource", v14, v16 object file lineNumber description];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"PXAssetsSelectionAction.m", 23, @"%@ should be an instance inheriting from %@, but it is nil", @"selectionSnapshot.dataSource", v14 object file lineNumber description];
  }

LABEL_3:
  id v8 = [v7 photosDataSource];
  id v9 = [v8 photoLibrary];
  v17.receiver = self;
  v17.super_class = (Class)PXAssetsSelectionAction;
  v10 = [(PXPhotosAction *)&v17 initWithPhotoLibrary:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_selectionSnapshot, a3);
    objc_storeStrong((id *)&v10->_photosDataSource, v8);
  }

  return v10;
}

@end