@interface PLDuplicateDetectorPostProcessing
+ (id)_postProcessSortOIDs:(id)a3 oidMetadataMap:(id)a4 sortKey:(id)a5 secondarySortKey:(id)a6;
+ (id)sharedLibraryLivePhotoPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:(id)a3;
+ (id)sharedLibraryRawPlusJPEGPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:(id)a3;
+ (void)postProcessDuplicateSubGroupWithResult:(id)a3 metadataMap:(id)a4 metadataKey:(id)a5 secondarySortKey:(id)a6 subGroupSplitDecisionBlock:(id)a7;
@end

@implementation PLDuplicateDetectorPostProcessing

+ (id)sharedLibraryRawPlusJPEGPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:(id)a3
{
  id v3 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __123__PLDuplicateDetectorPostProcessing_sharedLibraryRawPlusJPEGPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap___block_invoke;
  v8[3] = &unk_1E586C4E8;
  id v9 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x19F38D650](v8);
  v6 = (void *)MEMORY[0x19F38D650]();

  return v6;
}

uint64_t __123__PLDuplicateDetectorPostProcessing_sharedLibraryRawPlusJPEGPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  v8 = [v7 objectForKeyedSubscript:@"activeLibraryScopeParticipationState"];
  int v9 = [v8 shortValue];

  v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  v11 = [v10 objectForKeyedSubscript:@"activeLibraryScopeParticipationState"];
  int v12 = [v11 shortValue];

  if (v9 == 1 || v12 == 1)
  {
    v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    v15 = [v14 objectForKeyedSubscript:@"kind"];
    int v16 = [v15 shortValue];

    v17 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    v18 = [v17 objectForKeyedSubscript:@"kind"];
    LODWORD(v15) = v16 | [v18 shortValue];

    BOOL v19 = v15 != 0;
    v20 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    v21 = [v20 objectForKeyedSubscript:@"rjPacked"];
    unsigned int v22 = ([v21 unsignedIntValue] >> 1) & 3;

    v23 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    v24 = [v23 objectForKeyedSubscript:@"rjPacked"];
    unsigned int v25 = [v24 unsignedIntValue];

    if (v22 - 1 >= 2)
    {
      if (v22) {
        BOOL v26 = 1;
      }
      else {
        BOOL v26 = ((v25 >> 1) & 3) - 3 < 0xFFFFFFFE;
      }
    }
    else
    {
      BOOL v26 = 0;
    }
    v28 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    uint64_t v29 = [v28 objectForKeyedSubscript:@"additionalAttributes.originalStableHash"];

    v30 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    uint64_t v31 = [v30 objectForKeyedSubscript:@"additionalAttributes.originalStableHash"];

    BOOL v32 = ([(id)v29 isEqualToString:v31] & 1) != 0 || (v31 | v29) == 0;
    if (v19 || v26)
    {
      uint64_t v27 = 0;
    }
    else
    {
      if (v9 != 1) {
        BOOL v32 = 1;
      }
      uint64_t v27 = v12 != 1 || v32;
    }
  }
  else
  {
    uint64_t v27 = 0;
  }

  return v27;
}

+ (id)sharedLibraryLivePhotoPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:(id)a3
{
  id v5 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __121__PLDuplicateDetectorPostProcessing_sharedLibraryLivePhotoPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap___block_invoke;
  v10[3] = &unk_1E5863400;
  SEL v12 = a2;
  id v13 = a1;
  id v11 = v5;
  id v6 = v5;
  v7 = (void *)MEMORY[0x19F38D650](v10);
  v8 = (void *)MEMORY[0x19F38D650]();

  return v8;
}

uint64_t __121__PLDuplicateDetectorPostProcessing_sharedLibraryLivePhotoPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap___block_invoke(uint64_t a1, void *a2, void *a3, void **a4)
{
  id v7 = a2;
  id v8 = a3;
  if (!a4)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 48), @"PLDuplicateDetectorPostProcessing.m", 205, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  if (!*a4)
  {
    *a4 = objc_alloc_init(PLDuplicateDetectorLivePhotoContext);
    int v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
    v10 = [v9 objectForKeyedSubscript:@"kind"];
    int v11 = [v10 shortValue];

    if (!v11)
    {
      SEL v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
      id v13 = [v12 objectForKeyedSubscript:@"kindSubtype"];
      uint64_t v14 = [v13 shortValue];

      v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
      int v16 = [v15 objectForKeyedSubscript:@"additionalAttributes.originalStableHash"];

      v17 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
      v18 = [v17 objectForKeyedSubscript:@"activeLibraryScopeParticipationState"];
      BOOL v19 = [v18 shortValue] == 1;

      v20 = *a4;
      v21 = +[PLDuplicateDetectorLivePhotoContextData dataWithSubtype:v14 isSharedLibrary:v19];
      [v20 addFingerprint:v16 contextData:v21];
    }
  }
  unsigned int v22 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  v23 = [v22 objectForKeyedSubscript:@"kindSubtype"];
  uint64_t v24 = [v23 shortValue];

  unsigned int v25 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  BOOL v26 = [v25 objectForKeyedSubscript:@"additionalAttributes.originalStableHash"];

  uint64_t v27 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  v28 = [v27 objectForKeyedSubscript:@"activeLibraryScopeParticipationState"];
  int v29 = [v28 shortValue];

  if (v24 == 2
    && (v30 = *a4,
        +[PLDuplicateDetectorLivePhotoContextData dataWithSubtype:isSharedLibrary:](PLDuplicateDetectorLivePhotoContextData, "dataWithSubtype:isSharedLibrary:", 0, v29 != 1), uint64_t v31 = objc_claimAutoreleasedReturnValue(), LOBYTE(v30) = [v30 hasFingerprint:v26 contextData:v31], v31, (v30 & 1) != 0))
  {
    uint64_t v32 = 1;
  }
  else
  {
    v33 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
    v34 = [v33 objectForKeyedSubscript:@"kind"];
    int v35 = [v34 shortValue];

    if (!v35)
    {
      v36 = *a4;
      v37 = +[PLDuplicateDetectorLivePhotoContextData dataWithSubtype:v24 isSharedLibrary:v29 == 1];
      [v36 addFingerprint:v26 contextData:v37];
    }
    uint64_t v32 = 0;
  }

  return v32;
}

+ (id)_postProcessSortOIDs:(id)a3 oidMetadataMap:(id)a4 sortKey:(id)a5 secondarySortKey:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v20 = [v10 objectForKeyedSubscript:v19];
        v21 = (void *)v20;
        if (v19) {
          BOOL v22 = v20 == 0;
        }
        else {
          BOOL v22 = 1;
        }
        if (!v22) {
          [v13 setObject:v20 forKey:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v16);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __98__PLDuplicateDetectorPostProcessing__postProcessSortOIDs_oidMetadataMap_sortKey_secondarySortKey___block_invoke;
  v27[3] = &unk_1E58633D8;
  id v28 = v11;
  id v29 = v12;
  id v23 = v12;
  id v24 = v11;
  unsigned int v25 = [v13 keysSortedByValueUsingComparator:v27];

  return v25;
}

uint64_t __98__PLDuplicateDetectorPostProcessing__postProcessSortOIDs_oidMetadataMap_sortKey_secondarySortKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) reverse]) {
    id v7 = v6;
  }
  else {
    id v7 = v5;
  }
  id v8 = [*(id *)(a1 + 32) key];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if ([*(id *)(a1 + 32) reverse]) {
    id v10 = v5;
  }
  else {
    id v10 = v6;
  }
  id v11 = [*(id *)(a1 + 32) key];
  id v12 = [v10 objectForKeyedSubscript:v11];

  unint64_t v13 = v9;
  unint64_t v14 = v12;
  uint64_t v15 = (void *)v14;
  if (v13) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    if (v13 | v14)
    {
      if (v13) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = -1;
      }
LABEL_31:

      goto LABEL_32;
    }
LABEL_17:
    if ([*(id *)(a1 + 40) reverse]) {
      v18 = v6;
    }
    else {
      v18 = v5;
    }
    uint64_t v19 = [*(id *)(a1 + 40) key];
    uint64_t v20 = [v18 objectForKeyedSubscript:v19];

    if ([*(id *)(a1 + 40) reverse]) {
      v21 = v5;
    }
    else {
      v21 = v6;
    }
    BOOL v22 = [*(id *)(a1 + 40) key];
    id v23 = [v21 objectForKeyedSubscript:v22];

    unint64_t v13 = v20;
    unint64_t v24 = v23;
    uint64_t v15 = (void *)v24;
    if (v13 && v24)
    {
      uint64_t v17 = [(id)v13 compare:v24];
    }
    else
    {
      uint64_t v25 = -1;
      if (v13) {
        uint64_t v25 = 1;
      }
      if (v13 | v24)
      {
        uint64_t v17 = v25;
      }
      else
      {
        uint64_t v15 = 0;
        unint64_t v13 = 0;
        uint64_t v17 = 0;
      }
    }
    goto LABEL_31;
  }
  uint64_t v17 = [(id)v13 compare:v14];

  if (!v17) {
    goto LABEL_17;
  }
LABEL_32:

  return v17;
}

+ (void)postProcessDuplicateSubGroupWithResult:(id)a3 metadataMap:(id)a4 metadataKey:(id)a5 secondarySortKey:(id)a6 subGroupSplitDecisionBlock:(id)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v50 = a6;
  v53 = (uint64_t (**)(id, void *, void *, id *))a7;
  context = (void *)MEMORY[0x19F38D3B0]();
  unint64_t v14 = objc_alloc_init(PLDuplicateGroup);
  v46 = v11;
  if ([v11 hasSubGroups])
  {
    uint64_t v15 = [v11 subGroups];
  }
  else
  {
    BOOL v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = [v11 group];
    uint64_t v15 = [v16 setWithObject:v17];
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v15;
  uint64_t v18 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v61;
    id v55 = v12;
    v57 = v14;
    uint64_t v47 = *(void *)v61;
    do
    {
      uint64_t v21 = 0;
      uint64_t v48 = v19;
      do
      {
        if (*(void *)v61 != v20) {
          objc_enumerationMutation(obj);
        }
        BOOL v22 = *(void **)(*((void *)&v60 + 1) + 8 * v21);
        if ((unint64_t)[v22 count] > 1)
        {
          id v23 = [a1 _postProcessSortOIDs:v22 oidMetadataMap:v12 sortKey:v13 secondarySortKey:v50];
          uint64_t v24 = [v23 count];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v52 = v21;
            uint64_t v26 = 0;
            uint64_t v27 = 0;
            v58 = 0;
            uint64_t v56 = v24;
            v54 = v23;
            do
            {
              id v28 = [v23 objectAtIndexedSubscript:v26];
              if (v26)
              {
                id v29 = [v12 objectForKeyedSubscript:v28];
                long long v30 = [v13 key];
                long long v31 = [v29 objectForKeyedSubscript:v30];

                if (v31)
                {
                  long long v32 = [v23 objectAtIndexedSubscript:v26 - 1];
                  long long v33 = [v12 objectForKeyedSubscript:v32];
                  id v34 = v13;
                  uint64_t v35 = [v13 key];
                  v36 = [v33 objectForKeyedSubscript:v35];

                  if (v36)
                  {
                    id v59 = v58;
                    int v37 = v53[2](v53, v28, v32, &v59);
                    id v38 = v59;

                    if (v37)
                    {

                      id v39 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                      [(PLDuplicateGroup *)v57 addSubGroup:v39];
                      v40 = PLDuplicateDetectionGetLog();
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                      {
                        v41 = [v28 URIRepresentation];
                        v42 = [v41 relativePath];
                        *(_DWORD *)buf = 138412546;
                        v65 = v42;
                        __int16 v66 = 2112;
                        id v67 = v34;
                        _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEBUG, "Duplicate Processing Detector: Split group [%@] on property: %@", buf, 0x16u);
                      }
                      v58 = 0;
                      uint64_t v27 = v39;
                    }
                    else
                    {
                      v58 = v38;
                    }
                    id v23 = v54;
                  }
                  [v27 addObject:v28];

                  id v13 = v34;
                  id v12 = v55;
                  uint64_t v25 = v56;
                }
                else
                {
                  [v27 addObject:v28];
                }
              }
              else
              {
                id v43 = objc_alloc_init(MEMORY[0x1E4F1CA80]);

                [(PLDuplicateGroup *)v57 addSubGroup:v43];
                [v43 addObject:v28];
                uint64_t v27 = v43;
              }

              ++v26;
            }
            while (v25 != v26);

            unint64_t v14 = v57;
            uint64_t v20 = v47;
            uint64_t v19 = v48;
            uint64_t v21 = v52;
          }
        }
        else
        {
          [(PLDuplicateGroup *)v14 addSubGroup:v22];
        }
        ++v21;
      }
      while (v21 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
    }
    while (v19);
  }

  if ([(PLDuplicateGroup *)v14 hasSubGroups])
  {
    v44 = [(PLDuplicateGroup *)v14 subGroups];
    [v46 replaceSubGroups:v44];
  }
}

@end