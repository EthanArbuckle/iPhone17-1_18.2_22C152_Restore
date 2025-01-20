@interface PXPhotoKitAssetCollectionShowInAlbumActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (BOOL)showsMenuForAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)_assetInAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)menuElementsForAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (void)_populateActions:(id)a3 withNode:(id)a4 asset:(id)a5 level:(unint64_t)a6;
@end

@implementation PXPhotoKitAssetCollectionShowInAlbumActionPerformer

+ (id)menuElementsForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v6 = a4;
  v7 = [a1 _assetInAssetCollectionReference:a3 withInputs:v6];
  if (objc_opt_respondsToSelector())
  {
    v8 = [v6 containingAlbum];
  }
  else
  {
    v8 = 0;
  }
  v9 = [MEMORY[0x1E4F1CA48] array];
  v10 = +[PXPhotoKitCollectionMenuNode rootNodeForAssetCollectionsContainingAsset:v7 excludedAssetCollection:v8];
  [a1 _populateActions:v9 withNode:v10 asset:v7 level:0];

  return v9;
}

+ (void)_populateActions:(id)a3 withNode:(id)a4 asset:(id)a5 level:(unint64_t)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v30 = a5;
  [v9 sortChildNodes];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v25 = v9;
  id obj = [v9 childNodes];
  uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v27 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v14 = [MEMORY[0x1E4FB1438] sharedApplication];
        v15 = [v13 localizedTitle];
        v16 = objc_msgSend(@" ", "px_stringByRepeating:", a6);
        if ([v14 userInterfaceLayoutDirection] == 1)
        {
          v17 = [v16 stringByAppendingString:@"\u200F"];
          v18 = [v17 stringByAppendingString:v15];

          v15 = v17;
        }
        else
        {
          v18 = [v16 stringByAppendingString:v15];
        }

        v19 = (void *)MEMORY[0x1E4FB1818];
        v20 = [v13 symbolName];
        v21 = [v19 systemImageNamed:v20];

        v22 = (void *)MEMORY[0x1E4FB13F0];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __93__PXPhotoKitAssetCollectionShowInAlbumActionPerformer__populateActions_withNode_asset_level___block_invoke;
        v31[3] = &unk_1E5DCC0B8;
        v31[4] = v13;
        id v23 = v30;
        id v32 = v23;
        v24 = [v22 actionWithTitle:v18 image:v21 identifier:0 handler:v31];
        [v8 addObject:v24];
        [a1 _populateActions:v8 withNode:v13 asset:v23 level:a6 + 1];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v11);
  }
}

void __93__PXPhotoKitAssetCollectionShowInAlbumActionPerformer__populateActions_withNode_asset_level___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  v2 = [*(id *)(a1 + 32) collection];
  objc_msgSend(v3, "px_navigateToCollection:selectedObject:completionHandler:", v2, *(void *)(a1 + 40), 0);
}

+ (BOOL)showsMenuForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(@"PXPhotoKitAssetCollectionManagerStandardActionTitle_ShowInAlbum", @"PhotosUICore");
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v6 = a4;
  v7 = [a1 _assetInAssetCollectionReference:a3 withInputs:v6];
  id v8 = v7;
  if (!v7 || ([v7 isHidden] & 1) != 0 || (objc_msgSend(v8, "isTrashed") & 1) != 0)
  {
    BOOL v9 = 0;
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v11 = [v6 containingAlbum];
    }
    else
    {
      uint64_t v11 = 0;
    }
    v12 = objc_msgSend(MEMORY[0x1E4F38EE8], "px_fetchContainingCollectionsForAsset:excludedAssetCollection:", v8, v11);
    BOOL v9 = (unint64_t)[v12 count] > 1;
  }
  return v9;
}

+ (id)_assetInAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v7 = a4;
  id v8 = [a3 assetCollection];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v16);
    v17 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v13 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionShowInAlbumActionPerformer.m", 23, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v15, v17 object file lineNumber description];
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionShowInAlbumActionPerformer.m", 23, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v15 object file lineNumber description];
  }

LABEL_3:
  if (objc_opt_respondsToSelector())
  {
    BOOL v9 = [v7 people];
  }
  else
  {
    BOOL v9 = 0;
  }
  if ([v8 estimatedAssetCount] == 1 && !objc_msgSend(v9, "count"))
  {
    v12 = [v7 assetsFetchResult];
    uint64_t v10 = [v12 firstObject];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

@end