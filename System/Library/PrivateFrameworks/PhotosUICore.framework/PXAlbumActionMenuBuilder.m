@interface PXAlbumActionMenuBuilder
+ (NSArray)internalActionTypes;
+ (NSArray)primaryActionTypes;
+ (NSArray)secondaryActionTypes;
+ (id)_createMenuWithActionManager:(id)a3 actionTypes:(id)a4 overrideActions:(id)a5;
+ (id)contextMenuWithActionManager:(id)a3 overrideActions:(id)a4;
@end

@implementation PXAlbumActionMenuBuilder

+ (id)_createMenuWithActionManager:(id)a3 actionTypes:(id)a4 overrideActions:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v17 = objc_msgSend(v9, "objectForKeyedSubscript:", v16, (void)v21);
        if (v17)
        {
          [v10 addObject:v17];
        }
        else
        {
          v18 = [v7 standardActionForActionType:v16];
          if (v18) {
            [v10 addObject:v18];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  if ([v10 count])
  {
    v19 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F00B0030 image:0 identifier:0 options:1 children:v10];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)contextMenuWithActionManager:(id)a3 overrideActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __73__PXAlbumActionMenuBuilder_contextMenuWithActionManager_overrideActions___block_invoke;
    v19 = &unk_1E5DD1DC0;
    id v23 = a1;
    id v20 = v6;
    id v21 = v7;
    id v9 = v8;
    id v22 = v9;
    v10 = (void (**)(void *, void *))_Block_copy(&v16);
    id v11 = objc_msgSend(a1, "primaryActionTypes", v16, v17, v18, v19);
    v10[2](v10, v11);

    uint64_t v12 = [a1 secondaryActionTypes];
    v10[2](v10, v12);

    uint64_t v13 = [a1 internalActionTypes];
    v10[2](v10, v13);

    if ([v9 count])
    {
      uint64_t v14 = [MEMORY[0x1E4FB1970] menuWithChildren:v9];
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void __73__PXAlbumActionMenuBuilder_contextMenuWithActionManager_overrideActions___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 56) _createMenuWithActionManager:*(void *)(a1 + 32) actionTypes:a2 overrideActions:*(void *)(a1 + 40)];
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 48) addObject:v3];
    v3 = v4;
  }
}

+ (NSArray)internalActionTypes
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PXAssetCollectionActionTypeFileRadar";
  v4[1] = @"PXAssetCollectionActionTypeCopyInternalURL";
  v4[2] = @"PXAssetCollectionActionTypeDebugCuration";
  v4[3] = @"PXAssetCollectionActionTypeStoryDemo";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  return (NSArray *)v2;
}

+ (NSArray)secondaryActionTypes
{
  v4[8] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PXAssetCollectionActionTypeCustomize";
  v4[1] = @"PXAssetCollectionActionTypeMoveOut";
  v4[2] = @"PXAssetCollectionActionTypeToggleFavorite";
  v4[3] = @"PXAssetCollectionActionTypeRemoveSharingSuggestion";
  v4[4] = @"PXAssetCollectionActionTypeBlockMemory";
  void v4[5] = @"PXAssetCollectionActionTypeDelete";
  v4[6] = @"PXAssetCollectionActionTypeDeleteMemory";
  v4[7] = @"PXAssetCollectionActionTypeTrashMomentShare";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:8];
  return (NSArray *)v2;
}

+ (NSArray)primaryActionTypes
{
  void v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PXAssetCollectionActionTypeShare";
  v4[1] = @"PXAssetCollectionActionTypeMoveToSharedLibrary";
  v4[2] = @"PXAssetCollectionActionTypeAddFrom";
  v4[3] = @"PXAssetCollectionActionTypeShowMap";
  v4[4] = @"PXAssetCollectionActionTypeCopyLink";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  return (NSArray *)v2;
}

@end