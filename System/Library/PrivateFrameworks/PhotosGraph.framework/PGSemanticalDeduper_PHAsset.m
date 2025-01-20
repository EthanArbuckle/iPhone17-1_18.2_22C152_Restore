@interface PGSemanticalDeduper_PHAsset
- (id)sceneprintByItemIdentifierWithItems:(id)a3;
@end

@implementation PGSemanticalDeduper_PHAsset

- (id)sceneprintByItemIdentifierWithItems:(id)a3
{
  v53[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    v4 = [v3 firstObject];
    v5 = [v4 photoLibrary];

    v35 = v5;
    v6 = [v5 librarySpecificFetchOptions];
    uint64_t v7 = *MEMORY[0x1E4F39550];
    v53[0] = *MEMORY[0x1E4F394A8];
    v53[1] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
    [v6 setFetchPropertySets:v8];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v36 = v3;
    id v10 = v3;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      LOBYTE(v13) = 0;
      uint64_t v14 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v44 != v14) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v17 = [v16 localIdentifier];
          [v9 addObject:v17];

          if (v13) {
            uint64_t v13 = 1;
          }
          else {
            uint64_t v13 = [v16 isGuestAsset];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v12);
    }
    else
    {
      uint64_t v13 = 0;
    }

    [v6 setIncludeGuestAssets:v13];
    v34 = v6;
    v18 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v9 options:v6];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v40;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v39 + 1) + 8 * v22);
          v24 = [v23 sceneprintProperties];
          v25 = [v24 sceneprint];

          if (v25)
          {
            v26 = (void *)MEMORY[0x1E4F28DC0];
            uint64_t v27 = objc_opt_class();
            id v38 = 0;
            v28 = [v26 unarchivedObjectOfClass:v27 fromData:v25 error:&v38];
            id v29 = v38;
            if (v28)
            {
              v30 = [v23 clsIdentifier];
              [v37 setObject:v28 forKeyedSubscript:v30];
              goto LABEL_23;
            }
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              v30 = [v23 uuid];
              *(_DWORD *)buf = 138412546;
              v48 = v30;
              __int16 v49 = 2112;
              id v50 = v29;
              _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error unarchiving sceneprint for asset %@: %@", buf, 0x16u);
LABEL_23:
            }
            goto LABEL_28;
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
          {
            v31 = [v23 uuid];
            *(_DWORD *)buf = 138412290;
            v48 = v31;
            _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Sceneprint unavailable for asset %@", buf, 0xCu);
          }
LABEL_28:

          ++v22;
        }
        while (v20 != v22);
        uint64_t v32 = [v18 countByEnumeratingWithState:&v39 objects:v51 count:16];
        uint64_t v20 = v32;
      }
      while (v32);
    }

    id v3 = v36;
  }
  else
  {
    id v37 = (id)MEMORY[0x1E4F1CC08];
  }

  return v37;
}

@end