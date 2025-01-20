@interface PXEditMemoryAction
- (NSData)redoPhotosGraphData;
- (NSData)undoPhotosGraphData;
- (NSFastEnumeration)redoUserCuratedAssets;
- (NSFastEnumeration)undoUserCuratedAssets;
- (PHAsset)redoKeyAsset;
- (PHAsset)undoKeyAsset;
- (PHMemory)memory;
- (PXEditMemoryAction)initWithMemory:(id)a3 photosGraphData:(id)a4 storyColorGradeKind:(int64_t)a5 keyAsset:(id)a6 userCuratedAssets:(id)a7 customUserAssetsEdit:(id)a8;
- (PXMemoryCustomUserAssetsEdit)redoCustomUserAssetsEdit;
- (PXMemoryCustomUserAssetsEdit)undoCustomUserAssetsEdit;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (int64_t)redoStoryColorGradeKind;
- (int64_t)undoStoryColorGradeKind;
- (void)_changePhotosGraphData:(id)a3 storyColorGradeKind:(int64_t)a4 keyAsset:(id)a5 userCuratedAssets:(id)a6 customUserAssetsEdit:(id)a7 completionHandler:(id)a8;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXEditMemoryAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redoCustomUserAssetsEdit, 0);
  objc_storeStrong((id *)&self->_undoCustomUserAssetsEdit, 0);
  objc_storeStrong((id *)&self->_redoUserCuratedAssets, 0);
  objc_storeStrong((id *)&self->_undoUserCuratedAssets, 0);
  objc_storeStrong((id *)&self->_redoKeyAsset, 0);
  objc_storeStrong((id *)&self->_undoKeyAsset, 0);
  objc_storeStrong((id *)&self->_undoPhotosGraphData, 0);
  objc_storeStrong((id *)&self->_redoPhotosGraphData, 0);
  objc_storeStrong((id *)&self->_memory, 0);
}

- (PXMemoryCustomUserAssetsEdit)redoCustomUserAssetsEdit
{
  return self->_redoCustomUserAssetsEdit;
}

- (PXMemoryCustomUserAssetsEdit)undoCustomUserAssetsEdit
{
  return self->_undoCustomUserAssetsEdit;
}

- (NSFastEnumeration)redoUserCuratedAssets
{
  return self->_redoUserCuratedAssets;
}

- (NSFastEnumeration)undoUserCuratedAssets
{
  return self->_undoUserCuratedAssets;
}

- (PHAsset)redoKeyAsset
{
  return self->_redoKeyAsset;
}

- (PHAsset)undoKeyAsset
{
  return self->_undoKeyAsset;
}

- (int64_t)redoStoryColorGradeKind
{
  return self->_redoStoryColorGradeKind;
}

- (int64_t)undoStoryColorGradeKind
{
  return self->_undoStoryColorGradeKind;
}

- (NSData)undoPhotosGraphData
{
  return self->_undoPhotosGraphData;
}

- (NSData)redoPhotosGraphData
{
  return self->_redoPhotosGraphData;
}

- (PHMemory)memory
{
  return self->_memory;
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  id v9 = [(PXEditMemoryAction *)self undoPhotosGraphData];
  int64_t v5 = [(PXEditMemoryAction *)self undoStoryColorGradeKind];
  v6 = [(PXEditMemoryAction *)self undoKeyAsset];
  v7 = [(PXEditMemoryAction *)self undoUserCuratedAssets];
  v8 = [(PXEditMemoryAction *)self undoCustomUserAssetsEdit];
  [(PXEditMemoryAction *)self _changePhotosGraphData:v9 storyColorGradeKind:v5 keyAsset:v6 userCuratedAssets:v7 customUserAssetsEdit:v8 completionHandler:v4];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  id v9 = [(PXEditMemoryAction *)self redoPhotosGraphData];
  int64_t v5 = [(PXEditMemoryAction *)self redoStoryColorGradeKind];
  v6 = [(PXEditMemoryAction *)self redoKeyAsset];
  v7 = [(PXEditMemoryAction *)self redoUserCuratedAssets];
  v8 = [(PXEditMemoryAction *)self redoCustomUserAssetsEdit];
  [(PXEditMemoryAction *)self _changePhotosGraphData:v9 storyColorGradeKind:v5 keyAsset:v6 userCuratedAssets:v7 customUserAssetsEdit:v8 completionHandler:v4];
}

- (id)actionNameLocalizationKey
{
  return @"PXEditMemoryActionName";
}

- (id)actionIdentifier
{
  return @"EditMemory";
}

- (void)_changePhotosGraphData:(id)a3 storyColorGradeKind:(int64_t)a4 keyAsset:(id)a5 userCuratedAssets:(id)a6 customUserAssetsEdit:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = [(PXEditMemoryAction *)self memory];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __131__PXEditMemoryAction__changePhotosGraphData_storyColorGradeKind_keyAsset_userCuratedAssets_customUserAssetsEdit_completionHandler___block_invoke;
  v25[3] = &unk_1E5DB29B8;
  id v26 = v19;
  id v27 = v14;
  id v28 = v15;
  id v29 = v16;
  id v30 = v17;
  int64_t v31 = a4;
  id v20 = v17;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  id v24 = v19;
  [(PXPhotosAction *)self performChanges:v25 completionHandler:v18];
}

void __131__PXEditMemoryAction__changePhotosGraphData_storyColorGradeKind_keyAsset_userCuratedAssets_customUserAssetsEdit_completionHandler___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F39170] changeRequestForMemory:*(void *)(a1 + 32)];
  [v3 setPhotosGraphData:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 72)) {
    objc_msgSend(v3, "setStoryColorGradeKind:");
  }
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v3, "setKeyAsset:");
  }
  if (*(void *)(a1 + 56)) {
    objc_msgSend(v3, "setUserCuratedAssets:");
  }
  v2 = *(void **)(a1 + 64);
  if (v2)
  {
    [v2 assets];
    if (objc_claimAutoreleasedReturnValue())
    {
      [*(id *)(a1 + 64) assets];
      objc_claimAutoreleasedReturnValue();
      PXDisplayAssetFetchResultFastEnumeration();
    }

    [v3 setCustomUserAssets:0];
  }
}

- (PXEditMemoryAction)initWithMemory:(id)a3 photosGraphData:(id)a4 storyColorGradeKind:(int64_t)a5 keyAsset:(id)a6 userCuratedAssets:(id)a7 customUserAssetsEdit:(id)a8
{
  id v15 = a3;
  id v38 = a4;
  id v16 = a6;
  id v17 = a7;
  id obj = a8;
  id v18 = a8;
  v19 = [v15 photoLibrary];
  v39.receiver = self;
  v39.super_class = (Class)PXEditMemoryAction;
  id v20 = [(PXPhotosAction *)&v39 initWithPhotoLibrary:v19];

  if (!v20) {
    goto LABEL_20;
  }
  objc_storeStrong((id *)&v20->_memory, a3);
  objc_storeStrong((id *)&v20->_redoPhotosGraphData, a4);
  id v21 = (void *)MEMORY[0x1E4F39160];
  id v22 = [v15 photosGraphProperties];
  uint64_t v23 = objc_msgSend(v21, "px_photosGraphDataFromProperties:error:", v22, 0);
  undoPhotosGraphData = v20->_undoPhotosGraphData;
  v20->_undoPhotosGraphData = (NSData *)v23;

  v20->_redoStoryColorGradeKind = a5;
  if (a5) {
    uint64_t v25 = objc_msgSend(v15, "storyColorGradeKind", obj, v38);
  }
  else {
    uint64_t v25 = 0;
  }
  v20->_undoStoryColorGradeKind = v25;
  objc_storeStrong((id *)&v20->_redoKeyAsset, a6);
  if (v16)
  {
    id v21 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v15 options:0];
    id v26 = [v21 firstObject];
  }
  else
  {
    id v26 = 0;
  }
  objc_storeStrong((id *)&v20->_undoKeyAsset, v26);
  if (v16)
  {
  }
  if (v17) {
    PXDisplayAssetFetchResultFastEnumeration();
  }
  objc_storeStrong((id *)&v20->_redoUserCuratedAssets, 0);
  objc_storeStrong((id *)&v20->_undoUserCuratedAssets, 0);
  id v27 = +[PXStorySettings sharedInstance];
  int v28 = [v27 allowCustomUserAssets];

  if (!v28)
  {
    v32 = 0;
    if (v18) {
      goto LABEL_14;
    }
LABEL_16:
    [v32 count];
    redoCustomUserAssetsEdit = v20->_redoCustomUserAssetsEdit;
    v20->_redoCustomUserAssetsEdit = 0;

    v33 = 0;
    goto LABEL_17;
  }
  id v29 = (void *)MEMORY[0x1E4F38EB8];
  id v30 = [v15 photoLibrary];
  int64_t v31 = [v30 librarySpecificFetchOptions];
  v32 = [v29 fetchCustomUserAssetsInMemory:v15 options:v31];

  if (!v18) {
    goto LABEL_16;
  }
LABEL_14:
  objc_storeStrong((id *)&v20->_redoCustomUserAssetsEdit, obja);
  v33 = [[PXMemoryCustomUserAssetsEdit alloc] initWithAssets:v32];
LABEL_17:
  objc_storeStrong((id *)&v20->_undoCustomUserAssetsEdit, v33);
  if (v18) {

  }
LABEL_20:
  return v20;
}

@end