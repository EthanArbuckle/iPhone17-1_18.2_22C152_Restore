@interface PFStoryRecipe
@end

@implementation PFStoryRecipe

void __88__PFStoryRecipe_PXStoryExtension_requestAudioAssetFromRecipeAsset_recipe_resultHandler___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (a3)
  {
    PLAudioPlaybackGetLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, *(const void **)(a1 + 40));
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_END, v11, "PFStoryRecipe_PXStoryExtension - requestAudioAssetFromRecipeAsset", " enableTelemetry=YES ", v12, 2u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__PFStoryRecipe_PXStoryExtension_requestAudioAssetFromRecipeAsset_recipe_resultHandler___block_invoke_208(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, uint64_t, id))(v4 + 16))(v4, v6, 1, v5);
}

void __88__PFStoryRecipe_PXStoryExtension_requestAudioAssetFromRecipeAsset_recipe_resultHandler___block_invoke_2(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PXFlexMusicLibrary sharedLibrary];
  v13[0] = *(void *)(a1 + 32);
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v4 = [v2 fetchAssetsWithIdentifiers:v3];
  id v5 = [v4 firstObject];

  if (*(void *)(a1 + 40))
  {
    v12 = 0;
  }
  else
  {
    v12 = PXStoryErrorCreateWithCodeDebugFormat(1, @"unable to fetch Flex Song for song: %@", v6, v7, v8, v9, v10, v11, *(void *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "totalUnitCount"));
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __88__PFStoryRecipe_PXStoryExtension_requestAudioAssetFromRecipeAsset_recipe_resultHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 setIdentifier:v5];

  uint64_t v6 = [*(id *)(a1 + 32) colorGradeCategory];
  [v4 setColorGradeCategory:v6];

  uint64_t v7 = [*(id *)(a1 + 32) title];
  [v4 setTitle:v7];

  id v8 = [*(id *)(a1 + 32) subtitle];
  [v4 setSubtitle:v8];
}

void __48__PFStoryRecipe_PXStoryExtension_flexFetchQueue__block_invoke()
{
}

void __75__PFStoryRecipe_PXStoryExtension_displayAssetsInRecipe_withCategory_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 scheme];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = 1;
}

uint64_t __64__PFStoryRecipe_PXStoryExtension_recipeContainsAnyDisplayAsset___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

void __88__PFStoryRecipe_PXStoryExtension_PhotoKit__enumerateDisplayAssetsFromRecipe_usingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v8 = 0;
  char v6 = [v5 didEnumerateRecipeDisplayAsset:a2 error:&v8];
  id v7 = v8;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

void __80__PFStoryRecipe_PXStoryExtension_PhotoKit__PHAssetsInRecipe_withCategory_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  char v6 = [v5 scheme];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    if ([v5 category] == *(void *)(a1 + 56))
    {
      id v8 = objc_alloc(MEMORY[0x1E4F38FD0]);
      uint64_t v9 = [v5 cloudIdentifier];
      uint64_t v10 = (void *)[v8 initWithStringValue:v9];

      [*(id *)(a1 + 40) addObject:v10];
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28228];
    v17[0] = @"Recipe asset doesn't refer to a PhotoKit Asset";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v13 = [v11 errorWithDomain:@"PXStoryErrorDomain" code:1 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    *a3 = 1;
  }
}

void __80__PFStoryRecipe_PXStoryExtension_PhotoKit__PHAssetsInRecipe_withCategory_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  int v7 = [v6 localIdentifier];

  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    id v12 = [v6 localIdentifier];

    [v8 addObject:v12];
  }
  else
  {
    uint64_t v9 = [v6 error];

    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

void __84__PFStoryRecipe_PXStoryExtension_PhotoKit__addPHAssets_toRecipe_withCategory_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v16 = a3;
  id v6 = [v16 cloudIdentifier];
  int v7 = v6;
  if (v6)
  {
    id v8 = (void *)MEMORY[0x1E4F8CDC0];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = [v6 stringValue];
    id v12 = [v8 createAssetWithCategory:v9 scheme:v10 cloudIdentifier:v11];

    [*(id *)(a1 + 40) addAsset:v12];
  }
  else
  {
    uint64_t v13 = [v16 error];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    *a4 = 1;
  }
}

void __88__PFStoryRecipe_PXStoryExtension_Synthetic__syntheticAssetsInRecipe_withCategory_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 scheme];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    if ([v5 category] == *(void *)(a1 + 56))
    {
      id v8 = [v5 cloudIdentifier];
      uint64_t v9 = [off_1E5DA94B0 syntheticAssetWithSerializableDescription:v8];

      [*(id *)(a1 + 40) addObject:v9];
    }
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28228];
    v16[0] = @"Recipe asset doesn't refer to a synthetic asset";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v12 = [v10 errorWithDomain:@"PXStoryErrorDomain" code:1 userInfo:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a3 = 1;
  }
}

@end