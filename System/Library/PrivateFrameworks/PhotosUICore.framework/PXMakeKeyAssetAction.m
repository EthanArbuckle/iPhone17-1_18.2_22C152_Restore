@interface PXMakeKeyAssetAction
- (PHAsset)redoKeyAsset;
- (PHAsset)undoKeyAsset;
- (PHAssetCollection)assetCollection;
- (PHObjectPlaceholder)adaptiveHighlightPlaceholder;
- (PXMakeKeyAssetAction)initWithAssetCollection:(id)a3 keyAsset:(id)a4;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
- (void)setAdaptiveHighlightPlaceholder:(id)a3;
@end

@implementation PXMakeKeyAssetAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptiveHighlightPlaceholder, 0);
  objc_storeStrong((id *)&self->_undoKeyAsset, 0);
  objc_storeStrong((id *)&self->_redoKeyAsset, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

- (void)setAdaptiveHighlightPlaceholder:(id)a3
{
}

- (PHObjectPlaceholder)adaptiveHighlightPlaceholder
{
  return self->_adaptiveHighlightPlaceholder;
}

- (PHAsset)undoKeyAsset
{
  return self->_undoKeyAsset;
}

- (PHAsset)redoKeyAsset
{
  return self->_redoKeyAsset;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)performUndo:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__PXMakeKeyAssetAction_performUndo___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

void __36__PXMakeKeyAssetAction_performUndo___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) assetCollection];
  v2 = [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:v4];
  v3 = [*(id *)(a1 + 32) undoKeyAsset];
  [v2 setCustomKeyAsset:v3];
}

- (void)performAction:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__PXMakeKeyAssetAction_performAction___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

void __38__PXMakeKeyAssetAction_performAction___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) assetCollection];
  v2 = [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:v4];
  v3 = [*(id *)(a1 + 32) redoKeyAsset];
  [v2 setCustomKeyAsset:v3];
}

- (id)actionNameLocalizationKey
{
  return @"PXPhotoKitAssetActionManagerActionTitle_AlbumMakeKeyPhoto";
}

- (id)actionIdentifier
{
  return @"MakeKeyAsset";
}

- (PXMakeKeyAssetAction)initWithAssetCollection:(id)a3 keyAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 photoLibrary];
  v15.receiver = self;
  v15.super_class = (Class)PXMakeKeyAssetAction;
  v10 = [(PXPhotosAction *)&v15 initWithPhotoLibrary:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_assetCollection, a3);
    objc_storeStrong((id *)&v10->_redoKeyAsset, a4);
    v11 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v7 options:0];
    uint64_t v12 = [v11 firstObject];
    undoKeyAsset = v10->_undoKeyAsset;
    v10->_undoKeyAsset = (PHAsset *)v12;
  }
  return v10;
}

@end