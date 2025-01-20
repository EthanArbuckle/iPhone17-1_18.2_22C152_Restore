@interface PGGraphHighlightTranslator
+ (BOOL)includesRelationshipChanges;
+ (Class)entityClass;
- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5;
- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4;
- (id)graphChangesForInsertedLocalIdentifiers:(id)a3 progressBlock:(id)a4;
- (id)highlightUpdateAssetCountProperties;
- (id)highlightUpdateDateProperties;
- (id)highlightUpdateSearchProperties;
- (id)highlightUpdateTypeProperties;
- (id)momentUpdateTypeByHighlightProperty;
@end

@implementation PGGraphHighlightTranslator

+ (BOOL)includesRelationshipChanges
{
  return 1;
}

+ (Class)entityClass
{
  return (Class)objc_opt_class();
}

- (id)momentUpdateTypeByHighlightProperty
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"extendedCount";
  v5[0] = &unk_1F28D29E8;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (id)highlightUpdateSearchProperties
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"verboseSmartDescription";
  v6[1] = @"subtitle";
  v6[2] = @"title";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)highlightUpdateAssetCountProperties
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"estimatedAssetCount";
  v6[1] = @"dayGroupAssetsCount";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)highlightUpdateTypeProperties
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"type";
  v6[1] = @"category";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)highlightUpdateDateProperties
{
  void v6[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"startDate";
  v6[1] = @"endDate";
  v6[2] = @"startTimeZoneOffset";
  void v6[3] = @"endTimeZoneOffset";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v39 = a4;
  id v8 = a5;
  v9 = _Block_copy(v8);
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 0;
  uint64_t v57 = 0;
  v58 = (double *)&v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  if (!v9
    || (double v10 = CFAbsoluteTimeGetCurrent(), v10 - v58[3] < 0.01)
    || (v58[3] = v10,
        char v56 = 0,
        (*((void (**)(void *, char *, double))v9 + 2))(v9, &v56, 0.0),
        char v11 = *((unsigned char *)v62 + 24) | v56,
        (*((unsigned char *)v62 + 24) = v11) == 0))
  {
    v13 = [(PGGraphHighlightTranslator *)self highlightUpdateDateProperties];
    v14 = [(PGGraphHighlightTranslator *)self highlightUpdateTypeProperties];
    v15 = [(PGGraphHighlightTranslator *)self highlightUpdateAssetCountProperties];
    v16 = [(PGGraphHighlightTranslator *)self highlightUpdateSearchProperties];
    v17 = [(PGGraphHighlightTranslator *)self momentUpdateTypeByHighlightProperty];
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v19 = [MEMORY[0x1E4F1CA48] array];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __104__PGGraphHighlightTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke;
    v43[3] = &unk_1E68EDE78;
    id v34 = v13;
    id v44 = v34;
    id v35 = v14;
    id v45 = v35;
    id v46 = v39;
    id v37 = v16;
    id v47 = v37;
    id v36 = v15;
    id v48 = v36;
    id v20 = v19;
    id v49 = v20;
    id v21 = v17;
    id v50 = v21;
    id v22 = v18;
    id v51 = v22;
    id v23 = v9;
    id v52 = v23;
    v53 = &v57;
    v54 = &v61;
    uint64_t v55 = 0x3F847AE147AE147BLL;
    [v38 enumerateKeysAndObjectsUsingBlock:v43];
    if ([v22 count])
    {
      v24 = [(PGGraphEntityTranslator *)self photoLibrary];
      v25 = [v24 librarySpecificFetchOptions];

      v26 = [v22 allKeys];
      v27 = [MEMORY[0x1E4F391A0] fetchMomentUUIDsByPhotosHighlightUUIDForPhotosHighlightUUIDs:v26 options:v25];
      if (v9)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v58[3] >= 0.01)
        {
          v58[3] = Current;
          char v56 = 0;
          (*((void (**)(id, char *, double))v23 + 2))(v23, &v56, 0.5);
          char v29 = *((unsigned char *)v62 + 24) | v56;
          *((unsigned char *)v62 + 24) = v29;
          if (v29)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v66 = 487;
              __int16 v67 = 2080;
              v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Co"
                    "re/PGGraphEntityTranslator.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_20;
          }
        }
      }
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __104__PGGraphHighlightTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_363;
      v40[3] = &unk_1E68EDE50;
      id v30 = v27;
      id v41 = v30;
      id v42 = v20;
      [v22 enumerateKeysAndObjectsUsingBlock:v40];
    }
    if (!v9
      || (double v31 = CFAbsoluteTimeGetCurrent(), v31 - v58[3] < 0.01)
      || (v58[3] = v31,
          char v56 = 0,
          (*((void (**)(id, char *, double))v23 + 2))(v23, &v56, 1.0),
          char v32 = *((unsigned char *)v62 + 24) | v56,
          (*((unsigned char *)v62 + 24) = v32) == 0))
    {
      id v12 = v20;
      goto LABEL_22;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v66 = 499;
      __int16 v67 = 2080;
      v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGGra"
            "phEntityTranslator.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_20:
    id v12 = (id)MEMORY[0x1E4F1CBF0];
LABEL_22:

    goto LABEL_23;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v66 = 418;
    __int16 v67 = 2080;
    v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGGraph"
          "EntityTranslator.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v12 = (id)MEMORY[0x1E4F1CBF0];
LABEL_23:
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  return v12;
}

void __104__PGGraphHighlightTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F39238] uuidFromLocalIdentifier:v6];
  if ([v7 intersectsSet:*(void *)(a1 + 32)]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  if (objc_msgSend(v7, "intersectsSet:", *(void *)(a1 + 40), a4)) {
    v9 |= 4uLL;
  }
  if (([*(id *)(a1 + 48) momentRelationshipChangedForHighlightWithLocalIdentifier:v6] & 1) != 0
    || [*(id *)(a1 + 48) highlightGroupRelationshipChangedForHighlightWithLocalIdentifier:v6])
  {
    v9 |= 8uLL;
  }
  uint64_t v10 = v9 | [*(id *)(a1 + 48) assetsOrDayGroupAssetsRelationshipChangedForHighlightWithLocalIdentifier:v6];
  if (([v7 intersectsSet:*(void *)(a1 + 56)] & 1) != 0
    || ([*(id *)(a1 + 48) keyAssetPrivateOrDayGroupKeyAssetPrivateChangedForHighlightWithLocalIdentifier:v6] & 1) != 0|| objc_msgSend(*(id *)(a1 + 48), "keyAssetSharedOrDayGroupKeyAssetSharedChangedForHighlightWithLocalIdentifier:", v6))
  {
    v10 |= 0x40uLL;
  }
  v26 = v6;
  if ([v7 intersectsSet:*(void *)(a1 + 64)]) {
    v10 |= 0x10uLL;
  }
  if (v10)
  {
    char v11 = [[PGGraphHighlightChange alloc] initWithHighlightUUID:v8 updateTypes:v10];
    [*(id *)(a1 + 72) addObject:v11];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v18 = [*(id *)(a1 + 80) objectForKeyedSubscript:v17];
        if (v18)
        {
          v19 = [*(id *)(a1 + 88) objectForKeyedSubscript:v8];
          if (!v19)
          {
            v19 = [MEMORY[0x1E4F28E60] indexSet];
            [*(id *)(a1 + 88) setObject:v19 forKeyedSubscript:v8];
          }
          uint64_t v20 = [v18 unsignedIntegerValue];
          [v19 addIndex:v20];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
          {
            id v21 = PGGraphChangeStringFromMomentUpdateType(v20);
            *(_DWORD *)buf = 138412802;
            char v32 = v8;
            __int16 v33 = 2112;
            uint64_t v34 = v17;
            __int16 v35 = 2112;
            id v36 = v21;
            _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Highlight %@ updated %@, Need to update moment for updateType %@", buf, 0x20u);
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v14);
  }

  if (*(void *)(a1 + 96))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v23 = *(void *)(*(void *)(a1 + 104) + 8);
    if (Current - *(double *)(v23 + 24) >= *(double *)(a1 + 120))
    {
      *(double *)(v23 + 24) = Current;
      buf[0] = 0;
      (*(void (**)(double))(*(void *)(a1 + 96) + 16))(0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) |= buf[0];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24)) {
        unsigned char *v25 = 1;
      }
    }
  }
}

void __104__PGGraphHighlightTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_363(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __104__PGGraphHighlightTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2;
        v12[3] = &unk_1E68EFDD8;
        v12[4] = v11;
        id v13 = *(id *)(a1 + 40);
        [v5 enumerateIndexesUsingBlock:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

void __104__PGGraphHighlightTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = [[PGGraphMomentChange alloc] initWithMomentUUID:*(void *)(a1 + 32) updateTypes:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = [v4 count];
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Batch Updates - Delete %ld highlights", buf, 0xCu);
  }
  id v5 = [(id)objc_opt_class() uuidsFromLocalIdentifiers:v4];
  id v6 = [[PGGraphHighlightsDeletion alloc] initWithHighlightUUIDs:v5];
  uint64_t v9 = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];

  return v7;
}

- (id)graphChangesForInsertedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = [v4 count];
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Batch Updates - Insert %ld new highlights", buf, 0xCu);
  }
  id v5 = [(id)objc_opt_class() uuidsFromLocalIdentifiers:v4];
  id v6 = [[PGGraphHighlightsInsertion alloc] initWithHighlightUUIDs:v5];
  uint64_t v9 = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];

  return v7;
}

@end