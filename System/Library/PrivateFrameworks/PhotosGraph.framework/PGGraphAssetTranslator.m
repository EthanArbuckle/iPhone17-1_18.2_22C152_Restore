@interface PGGraphAssetTranslator
+ (Class)entityClass;
- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5;
- (id)highlightUpdateTypeByAssetProperty;
- (id)momentUpdateTypeByAssetProperty;
@end

@implementation PGGraphAssetTranslator

+ (Class)entityClass
{
  return (Class)objc_opt_class();
}

- (id)highlightUpdateTypeByAssetProperty
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"favorite";
  v4[1] = @"adjustmentTimestamp";
  v5[0] = &unk_1F28D29E8;
  v5[1] = &unk_1F28D29E8;
  v4[2] = @"analysisStateModificationDate";
  v5[2] = &unk_1F28D29E8;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

- (id)momentUpdateTypeByAssetProperty
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"favorite";
  v4[1] = @"adjustmentTimestamp";
  v5[0] = &unk_1F28D29E8;
  v5[1] = &unk_1F28D29E8;
  v4[2] = @"analysisStateModificationDate";
  v5[2] = &unk_1F28D29E8;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v41 = a4;
  id v9 = a5;
  v10 = _Block_copy(v9);
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  uint64_t v59 = 0;
  v60 = (double *)&v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = 0;
  if (!v10
    || (double v11 = CFAbsoluteTimeGetCurrent(), v11 - v60[3] < 0.01)
    || (v60[3] = v11,
        char v58 = 0,
        (*((void (**)(void *, char *, double))v10 + 2))(v10, &v58, 0.0),
        char v12 = *((unsigned char *)v64 + 24) | v58,
        (*((unsigned char *)v64 + 24) = v12) == 0))
  {
    v42 = [MEMORY[0x1E4F1CA48] array];
    v14 = [(PGGraphAssetTranslator *)self momentUpdateTypeByAssetProperty];
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v16 = [(PGGraphAssetTranslator *)self highlightUpdateTypeByAssetProperty];
    v17 = [MEMORY[0x1E4F1CA60] dictionary];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke;
    v49[3] = &unk_1E68EDE28;
    v49[4] = self;
    id v18 = v14;
    id v50 = v18;
    id v19 = v15;
    id v51 = v19;
    id v20 = v16;
    id v52 = v20;
    id v21 = v17;
    id v53 = v21;
    id v22 = v10;
    id v54 = v22;
    v55 = &v59;
    v56 = &v63;
    uint64_t v57 = 0x3F847AE147AE147BLL;
    [v8 enumerateKeysAndObjectsUsingBlock:v49];
    if (*((unsigned char *)v64 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v68 = 197;
        __int16 v69 = 2080;
        v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGG"
              "raphEntityTranslator.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v13 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_41;
    }
    v23 = [(PGGraphEntityTranslator *)self photoLibrary];
    v40 = [v23 librarySpecificFetchOptions];

    if ([v19 count])
    {
      v24 = [v19 allKeys];
      v25 = [MEMORY[0x1E4F391A0] fetchMomentUUIDByAssetUUIDForAssetUUIDs:v24 options:v40];
      if (v10)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v60[3] >= 0.01)
        {
          v60[3] = Current;
          char v58 = 0;
          (*((void (**)(id, char *, double))v22 + 2))(v22, &v58, 0.5);
          char v27 = *((unsigned char *)v64 + 24) | v58;
          *((unsigned char *)v64 + 24) = v27;
          if (v27)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v68 = 206;
              __int16 v69 = 2080;
              v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Co"
                    "re/PGGraphEntityTranslator.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_38;
          }
        }
      }
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_306;
      v46[3] = &unk_1E68EDE50;
      id v28 = v25;
      id v47 = v28;
      id v48 = v42;
      [v19 enumerateKeysAndObjectsUsingBlock:v46];
    }
    if (v10
      && (double v29 = CFAbsoluteTimeGetCurrent(), v29 - v60[3] >= 0.01)
      && (v60[3] = v29,
          char v58 = 0,
          (*((void (**)(id, char *, double))v22 + 2))(v22, &v58, 0.5),
          char v30 = *((unsigned char *)v64 + 24) | v58,
          (*((unsigned char *)v64 + 24) = v30) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v68 = 220;
        __int16 v69 = 2080;
        v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGG"
              "raphEntityTranslator.m";
        v31 = MEMORY[0x1E4F14500];
LABEL_37:
        _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if ([v21 count])
      {
        v32 = [v21 allKeys];
        v33 = [MEMORY[0x1E4F39238] fetchPhotosHighlightUUIDByAssetUUIDForAssetUUIDs:v32 options:v40];
        if (v10)
        {
          double v34 = CFAbsoluteTimeGetCurrent();
          if (v34 - v60[3] >= 0.01)
          {
            v60[3] = v34;
            char v58 = 0;
            (*((void (**)(id, char *, double))v22 + 2))(v22, &v58, 0.5);
            char v35 = *((unsigned char *)v64 + 24) | v58;
            *((unsigned char *)v64 + 24) = v35;
            if (v35)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                int v68 = 227;
                __int16 v69 = 2080;
                v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Core/PGGraphEntityTranslator.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_38;
            }
          }
        }
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_311;
        v43[3] = &unk_1E68EDE50;
        id v36 = v33;
        id v44 = v36;
        id v45 = v42;
        [v21 enumerateKeysAndObjectsUsingBlock:v43];
      }
      if (!v10
        || (double v37 = CFAbsoluteTimeGetCurrent(), v37 - v60[3] < 0.01)
        || (v60[3] = v37,
            char v58 = 0,
            (*((void (**)(id, char *, double))v22 + 2))(v22, &v58, 1.0),
            char v38 = *((unsigned char *)v64 + 24) | v58,
            (*((unsigned char *)v64 + 24) = v38) == 0))
      {
        id v13 = v42;
        goto LABEL_40;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v68 = 241;
        __int16 v69 = 2080;
        v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGG"
              "raphEntityTranslator.m";
        v31 = MEMORY[0x1E4F14500];
        goto LABEL_37;
      }
    }
LABEL_38:
    id v13 = (id)MEMORY[0x1E4F1CBF0];
LABEL_40:

LABEL_41:
    goto LABEL_42;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v68 = 150;
    __int16 v69 = 2080;
    v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGGraph"
          "EntityTranslator.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v13 = (id)MEMORY[0x1E4F1CBF0];
LABEL_42:
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  return v13;
}

void __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v22 = v6;
  id v8 = [(id)objc_opt_class() uuidFromLocalIdentifier:v6];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:v14];
        if (v15)
        {
          v16 = [*(id *)(a1 + 48) objectForKeyedSubscript:v8];
          if (!v16)
          {
            v16 = [MEMORY[0x1E4F28E60] indexSet];
            [*(id *)(a1 + 48) setObject:v16 forKeyedSubscript:v8];
          }
          objc_msgSend(v16, "addIndex:", objc_msgSend(v15, "unsignedIntegerValue"));
        }
        v17 = [*(id *)(a1 + 56) objectForKeyedSubscript:v14];
        if (v17)
        {
          id v18 = [*(id *)(a1 + 64) objectForKeyedSubscript:v8];
          if (!v18)
          {
            id v18 = [MEMORY[0x1E4F28E60] indexSet];
            [*(id *)(a1 + 64) setObject:v18 forKeyedSubscript:v8];
          }
          objc_msgSend(v18, "addIndex:", objc_msgSend(v17, "unsignedIntegerValue"));
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  if (*(void *)(a1 + 72))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v20 = *(void *)(*(void *)(a1 + 80) + 8);
    if (Current - *(double *)(v20 + 24) >= *(double *)(a1 + 96))
    {
      *(double *)(v20 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 72) + 16))(0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
        *a4 = 1;
      }
    }
  }
}

void __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_306(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2;
    v8[3] = &unk_1E68EFDD8;
    id v9 = v6;
    id v10 = *(id *)(a1 + 40);
    [v5 enumerateIndexesUsingBlock:v8];
  }
}

void __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_311(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2_312;
    v8[3] = &unk_1E68EFDD8;
    id v9 = v6;
    id v10 = *(id *)(a1 + 40);
    [v5 enumerateIndexesUsingBlock:v8];
  }
}

void __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2_312(uint64_t a1, uint64_t a2)
{
  v3 = [[PGGraphHighlightChange alloc] initWithHighlightUUID:*(void *)(a1 + 32) updateTypes:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

void __100__PGGraphAssetTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = [[PGGraphMomentChange alloc] initWithMomentUUID:*(void *)(a1 + 32) updateTypes:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

@end