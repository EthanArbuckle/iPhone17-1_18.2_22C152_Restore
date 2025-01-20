@interface PXStoryAssetPickerHelper
- (BOOL)preselectedAssetsHaveDefaultSortOrder;
- (NSOrderedSet)preselectedOIDs;
- (PHPhotoLibrary)photoLibrary;
- (PXDisplayAssetCollection)containerCollection;
- (PXLoadingStatusManager)loadingStatusManager;
- (PXStoryAssetPickerHelper)initWithContainerAssetCollection:(id)a3 preselectedAssets:(id)a4;
- (PXStoryAssetPickerHelperDelegate)delegate;
- (UIViewController)pickerViewController;
- (void)_handlePickedAssets:(id)a3;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation PXStoryAssetPickerHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_preselectedOIDs, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pickerViewController, 0);
  objc_storeStrong((id *)&self->_containerCollection, 0);
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (BOOL)preselectedAssetsHaveDefaultSortOrder
{
  return self->_preselectedAssetsHaveDefaultSortOrder;
}

- (NSOrderedSet)preselectedOIDs
{
  return self->_preselectedOIDs;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setDelegate:(id)a3
{
}

- (PXStoryAssetPickerHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXStoryAssetPickerHelperDelegate *)WeakRetained;
}

- (UIViewController)pickerViewController
{
  return self->_pickerViewController;
}

- (PXDisplayAssetCollection)containerCollection
{
  return self->_containerCollection;
}

- (void)_handlePickedAssets:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PXStoryAssetPickerHelper__handlePickedAssets___block_invoke;
  aBlock[3] = &unk_1E5DC2AA8;
  aBlock[4] = self;
  id v4 = a3;
  v5 = (void (**)(void *, id, void))_Block_copy(aBlock);
  v6 = v5[2](v5, v4, 0);
  v7 = [(PXStoryAssetPickerHelper *)self preselectedOIDs];
  v8 = ((void (**)(void *, id, void *))v5)[2](v5, v4, v7);

  v9 = [(PXStoryAssetPickerHelper *)self preselectedOIDs];
  v10 = ((void (**)(void *, id, id))v5)[2](v5, v9, v4);

  v11 = [(PXStoryAssetPickerHelper *)self delegate];
  [v11 storyPickerHelper:self didFinishPicking:v6 promotedAssets:v8 demotedAssets:v10];
}

id __48__PXStoryAssetPickerHelper__handlePickedAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = (void *)[a2 mutableCopy];
  v7 = v6;
  if (v5)
  {
    [v6 minusOrderedSet:v5];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    [v7 minusOrderedSet:v8];
  }
  if ([v7 count])
  {
    id v9 = objc_alloc(MEMORY[0x1E4F39150]);
    v10 = [v7 array];
    v11 = [*(id *)(a1 + 32) photoLibrary];
    v12 = [MEMORY[0x1E4F38EB8] fetchType];
    v13 = (void *)[v9 initWithOids:v10 photoLibrary:v11 fetchType:v12 fetchPropertySets:0 identifier:0 registerIfNeeded:0];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [(PXStoryAssetPickerHelper *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7) {
    PXMap();
  }
}

uint64_t __52__PXStoryAssetPickerHelper_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assetIdentifier];
}

- (PXStoryAssetPickerHelper)initWithContainerAssetCollection:(id)a3 preselectedAssets:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v11 = v10;

    if (v11)
    {
      v12 = [v11 photoLibrary];
      goto LABEL_11;
    }
  }
  else
  {
  }
  v13 = [v9 firstObject];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  v12 = [v14 photoLibrary];

  id v11 = 0;
LABEL_11:

  if (!v12)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"PXStoryAssetPickerHelper.m", 35, @"Photo library couldn't be determined for %@ / %@", v10, v9 object file lineNumber description];
  }
  id v15 = v10;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  uint64_t v17 = [v16 localIdentifier];
  if (v17)
  {
    v18 = (void *)v17;
LABEL_19:

    goto LABEL_21;
  }
  v18 = [v15 uuid];

  if (!v18)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXStoryAssetPickerHelper.m", 37, @"Collection identifier couldn't be determined for %@", v15 object file lineNumber description];
    goto LABEL_19;
  }
LABEL_21:
  v52.receiver = self;
  v52.super_class = (Class)PXStoryAssetPickerHelper;
  v19 = [(PXStoryAssetPickerHelper *)&v52 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_containerCollection, a3);
    objc_storeStrong((id *)&v20->_photoLibrary, v12);
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F39930]) initWithPhotoLibraryAndOnlyReturnsIdentifiers:v12];
    [v21 _setUsesMemoriesLayout:1];
    [v21 setMinimumSelectionLimit:0];
    [v21 setSelectionLimit:*MEMORY[0x1E4F398C8]];
    [v21 _setDisabledPrivateCapabilities:7];
    v22 = +[PXStorySettings sharedInstance];
    int v23 = [v22 allowCustomUserAssets];

    if (v23)
    {
      v24 = [MEMORY[0x1E4F399C0] assetCollectionSuggestionGroup:v18 extendedCuratedAssetsOnly:1 shouldReverseSortOrder:1];
      objc_msgSend(v21, "set_suggestionGroup:", v24);

      [v21 setDisabledCapabilities:16];
    }
    else
    {
      [v21 setDisabledCapabilities:21];
      objc_msgSend(v21, "set_containerIdentifier:", v18);
    }
    if ([v9 count] >= 1)
    {
      v48 = v21;
      v49 = v18;
      id v50 = v15;
      v51 = v12;
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
      BOOL v27 = 1;
      if ([v9 count])
      {
        uint64_t v28 = -1;
        do
        {
          v29 = [v9 objectAtIndexedSubscript:v28 + 1];
          if (v27 && (unint64_t)(v28 + 1) >= 2)
          {
            v30 = [v9 objectAtIndexedSubscript:v28];
            uint64_t v31 = [v30 creationDate];
            if (v31
              && (v32 = (void *)v31,
                  [v29 creationDate],
                  v33 = objc_claimAutoreleasedReturnValue(),
                  v33,
                  v32,
                  v33))
            {
              v34 = [v30 creationDate];
              v35 = [v29 creationDate];
              BOOL v27 = [v34 compare:v35] != 1;
            }
            else
            {
              BOOL v27 = 0;
            }
          }
          v36 = [v29 localIdentifier];
          [v25 addObject:v36];

          v37 = [v29 objectID];
          [v26 addObject:v37];

          unint64_t v38 = [v9 count];
          unint64_t v39 = v28 + 2;
          ++v28;
        }
        while (v39 < v38);
      }
      v40 = (void *)[v25 copy];
      [v48 setPreselectedAssetIdentifiers:v40];

      uint64_t v41 = [v26 copy];
      preselectedOIDs = v20->_preselectedOIDs;
      v20->_preselectedOIDs = (NSOrderedSet *)v41;

      BOOL v43 = v27;
      v21 = v48;
      v20->_preselectedAssetsHaveDefaultSortOrder = v43;

      id v15 = v50;
      v12 = v51;
      v18 = v49;
    }
    v44 = (UIViewController *)[objc_alloc(MEMORY[0x1E4F39948]) initWithConfiguration:v21];
    [(UIViewController *)v44 setDelegate:v20];
    pickerViewController = v20->_pickerViewController;
    v20->_pickerViewController = v44;
  }
  return v20;
}

@end