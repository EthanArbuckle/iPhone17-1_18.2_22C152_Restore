@interface SHSheetActivityItemUtilities
+ (BOOL)shouldShowHeaderSpecializationForMetadata:(id)a3;
+ (id)itemProvidersFromActivityItems:(id)a3;
+ (id)urlForActivityItem:(id)a3;
+ (void)_loadMetadataFromRemainingGroupActivityItemProviders:(id)a3 loadedMetadata:(id)a4 loadedError:(id)a5 completion:(id)a6;
+ (void)loadMetadataFromGroupActivityItemProviders:(id)a3 completion:(id)a4;
@end

@implementation SHSheetActivityItemUtilities

+ (id)urlForActivityItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = 0;
      goto LABEL_11;
    }
    v6 = (void *)MEMORY[0x1E4F1CB10];
    v7 = [v3 string];
    v5 = [v6 URLWithString:v7];
  }
  id v4 = [v5 scheme];

  if (v4) {
    id v4 = v5;
  }

LABEL_11:
  return v4;
}

+ (id)itemProvidersFromActivityItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v5, "addObject:", v11, (void)v13);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)loadMetadataFromGroupActivityItemProviders:(id)a3 completion:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    uint64_t v8 = (void *)[v6 mutableCopy];
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __86__SHSheetActivityItemUtilities_loadMetadataFromGroupActivityItemProviders_completion___block_invoke;
    v13[3] = &unk_1E5A238D8;
    id v14 = v7;
    [a1 _loadMetadataFromRemainingGroupActivityItemProviders:v8 loadedMetadata:v9 loadedError:0 completion:v13];

    v10 = v14;
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = @"No item providers were provided.";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    v10 = [v11 errorWithDomain:@"com.apple.sharesheet.loadgroupactivitymetadata" code:-1 userInfo:v12];

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

void __86__SHSheetActivityItemUtilities_loadMetadataFromGroupActivityItemProviders_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F28568];
      v11[0] = @"None of the given item providers could load a GroupActivity.";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      id v7 = [v8 errorWithDomain:@"com.apple.sharesheet.loadgroupactivitymetadata" code:-1 userInfo:v9];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (void)_loadMetadataFromRemainingGroupActivityItemProviders:(id)a3 loadedMetadata:(id)a4 loadedError:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 lastObject];
  if (v14)
  {
    [v10 removeLastObject];
    id location = 0;
    objc_initWeak(&location, a1);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __123__SHSheetActivityItemUtilities__loadMetadataFromRemainingGroupActivityItemProviders_loadedMetadata_loadedError_completion___block_invoke;
    v15[3] = &unk_1E5A23900;
    id v16 = v11;
    id v17 = v12;
    objc_copyWeak(&v20, &location);
    id v18 = v10;
    id v19 = v13;
    [v14 loadGroupActivityMetadataWithCompletion:v15];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, id, id))v13 + 2))(v13, v11, v12);
  }
}

void __123__SHSheetActivityItemUtilities__loadMetadataFromRemainingGroupActivityItemProviders_loadedMetadata_loadedError_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9) {
    [*(id *)(a1 + 32) addObject:v9];
  }
  id v6 = v5;
  if (!v5) {
    id v6 = *(void **)(a1 + 40);
  }
  id v7 = v6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _loadMetadataFromRemainingGroupActivityItemProviders:*(void *)(a1 + 48) loadedMetadata:*(void *)(a1 + 32) loadedError:v7 completion:*(void *)(a1 + 56)];
}

+ (BOOL)shouldShowHeaderSpecializationForMetadata:(id)a3
{
  id v3 = a3;
  id v4 = [v3 specialization];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v5 = (void *)getLPiTunesMediaPlaylistMetadataClass_softClass;
  uint64_t v16 = getLPiTunesMediaPlaylistMetadataClass_softClass;
  if (!getLPiTunesMediaPlaylistMetadataClass_softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getLPiTunesMediaPlaylistMetadataClass_block_invoke;
    v12[3] = &unk_1E5A216E8;
    v12[4] = &v13;
    __getLPiTunesMediaPlaylistMetadataClass_block_invoke((uint64_t)v12);
    id v5 = (void *)v14[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v13, 8);
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v3 URL];
    uint64_t v8 = [v7 valueForQueryKey:@"a"];
    id v9 = [v8 lowercaseString];
    char v10 = [v9 isEqualToString:@"join"];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

@end