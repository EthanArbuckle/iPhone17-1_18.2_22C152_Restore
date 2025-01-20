@interface PGGraphMomentTranslator
+ (Class)entityClass;
- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5;
- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4;
- (id)graphChangesForInsertedLocalIdentifiers:(id)a3 progressBlock:(id)a4;
- (id)highlightUpdateTypeByMomentProperty;
- (id)momentUpdateTypeByMomentProperty;
@end

@implementation PGGraphMomentTranslator

+ (Class)entityClass
{
  return (Class)objc_opt_class();
}

- (id)highlightUpdateTypeByMomentProperty
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"approximateLatitude";
  v4[1] = @"approximateLongitude";
  v5[0] = &unk_1F28D2A48;
  v5[1] = &unk_1F28D2A48;
  v4[2] = @"estimatedAssetCount";
  v5[2] = &unk_1F28D2A60;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

- (id)momentUpdateTypeByMomentProperty
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"startDate";
  v4[1] = @"endDate";
  v5[0] = &unk_1F28D2A00;
  v5[1] = &unk_1F28D2A00;
  v4[2] = @"approximateLatitude";
  void v4[3] = @"approximateLongitude";
  v5[2] = &unk_1F28D2A18;
  v5[3] = &unk_1F28D2A18;
  v4[4] = @"estimatedAssetCount";
  void v5[4] = &unk_1F28D2A30;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v34 = a4;
  id v9 = a5;
  v10 = _Block_copy(v9);
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  uint64_t v48 = 0;
  v49 = (double *)&v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v51 = 0;
  if (!v10
    || (double v11 = CFAbsoluteTimeGetCurrent(), v11 - v49[3] < 0.01)
    || (v49[3] = v11,
        char v47 = 0,
        (*((void (**)(void *, char *, double))v10 + 2))(v10, &v47, 0.0),
        char v12 = *((unsigned char *)v53 + 24) | v47,
        (*((unsigned char *)v53 + 24) = v12) == 0))
  {
    v14 = [(PGGraphMomentTranslator *)self momentUpdateTypeByMomentProperty];
    v15 = [(PGGraphMomentTranslator *)self highlightUpdateTypeByMomentProperty];
    v16 = [MEMORY[0x1E4F1CA60] dictionary];
    v17 = [MEMORY[0x1E4F1CA48] array];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __101__PGGraphMomentTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke;
    v38[3] = &unk_1E68EDE28;
    v38[4] = self;
    id v18 = v14;
    id v39 = v18;
    id v19 = v17;
    id v40 = v19;
    id v20 = v15;
    id v41 = v20;
    id v21 = v16;
    id v42 = v21;
    id v22 = v10;
    id v43 = v22;
    v44 = &v48;
    v45 = &v52;
    uint64_t v46 = 0x3F847AE147AE147BLL;
    [v8 enumerateKeysAndObjectsUsingBlock:v38];
    if (*((unsigned char *)v53 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v57 = 341;
        __int16 v58 = 2080;
        v59 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGG"
              "raphEntityTranslator.m";
        v23 = MEMORY[0x1E4F14500];
LABEL_10:
        _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if ([v21 count])
      {
        v24 = [(PGGraphEntityTranslator *)self photoLibrary];
        v33 = [v24 librarySpecificFetchOptions];

        v25 = [v21 allKeys];
        v26 = [MEMORY[0x1E4F39238] fetchPhotosHighlightUUIDByMomentUUIDForMomentUUIDs:v25 options:v33];
        if (v10)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          if (Current - v49[3] >= 0.01)
          {
            v49[3] = Current;
            char v47 = 0;
            (*((void (**)(id, char *, double))v22 + 2))(v22, &v47, 0.5);
            char v28 = *((unsigned char *)v53 + 24) | v47;
            *((unsigned char *)v53 + 24) = v28;
            if (v28)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                int v57 = 350;
                __int16 v58 = 2080;
                v59 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Core/PGGraphEntityTranslator.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_11;
            }
          }
        }
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __101__PGGraphMomentTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_334;
        v35[3] = &unk_1E68EDE50;
        id v29 = v26;
        id v36 = v29;
        id v37 = v19;
        [v21 enumerateKeysAndObjectsUsingBlock:v35];
      }
      if (!v10
        || (double v30 = CFAbsoluteTimeGetCurrent(), v30 - v49[3] < 0.01)
        || (v49[3] = v30,
            char v47 = 0,
            (*((void (**)(id, char *, double))v22 + 2))(v22, &v47, 1.0),
            char v31 = *((unsigned char *)v53 + 24) | v47,
            (*((unsigned char *)v53 + 24) = v31) == 0))
      {
        id v13 = v19;
        goto LABEL_26;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v57 = 364;
        __int16 v58 = 2080;
        v59 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGG"
              "raphEntityTranslator.m";
        v23 = MEMORY[0x1E4F14500];
        goto LABEL_10;
      }
    }
LABEL_11:
    id v13 = (id)MEMORY[0x1E4F1CBF0];
LABEL_26:

    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v57 = 292;
    __int16 v58 = 2080;
    v59 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGGraph"
          "EntityTranslator.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v13 = (id)MEMORY[0x1E4F1CBF0];
LABEL_27:
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

  return v13;
}

void __101__PGGraphMomentTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [(id)objc_opt_class() uuidFromLocalIdentifier:v7];
  v10 = v9;
  if (v9 && [v9 length])
  {
    id v29 = a4;
    id v30 = v8;
    id v31 = v7;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v8;
    uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v16 = [*(id *)(a1 + 40) objectForKeyedSubscript:v15];
          v17 = v16;
          if (v16)
          {
            uint64_t v18 = [v16 unsignedIntegerValue];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
            {
              v23 = PGGraphChangeStringFromMomentUpdateType(v18);
              *(_DWORD *)buf = 138412802;
              id v39 = v10;
              __int16 v40 = 2112;
              id v41 = v15;
              __int16 v42 = 2112;
              uint64_t v43 = (uint64_t)v23;
              _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Moment Updated %@, Property changed %@, Need to trigger an %@", buf, 0x20u);
            }
            id v19 = [[PGGraphMomentChange alloc] initWithMomentUUID:v10 updateTypes:v18];
            [*(id *)(a1 + 48) addObject:v19];
          }
          id v20 = [*(id *)(a1 + 56) objectForKeyedSubscript:v15];
          if (v20)
          {
            id v21 = [*(id *)(a1 + 64) objectForKeyedSubscript:v10];
            if (!v21)
            {
              id v21 = [MEMORY[0x1E4F28E60] indexSet];
              [*(id *)(a1 + 64) setObject:v21 forKeyedSubscript:v10];
            }
            uint64_t v22 = [v20 unsignedIntegerValue];
            [v21 addIndex:v22];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
            {
              v24 = PGGraphChangeStringFromHighlightUpdateType(v22);
              *(_DWORD *)buf = 138412802;
              id v39 = v10;
              __int16 v40 = 2112;
              id v41 = v15;
              __int16 v42 = 2112;
              uint64_t v43 = (uint64_t)v24;
              _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Moment %@ updated %@, Need to update highlight for updateType %@", buf, 0x20u);
            }
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v12);
    }

    id v8 = v30;
    id v7 = v31;
    if (*(void *)(a1 + 72))
    {
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v26 = *(void *)(*(void *)(a1 + 80) + 8);
      if (Current - *(double *)(v26 + 24) >= *(double *)(a1 + 96))
      {
        *(double *)(v26 + 24) = Current;
        buf[0] = 0;
        (*(void (**)(double))(*(void *)(a1 + 72) + 16))(0.5);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) |= buf[0];
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
          *id v29 = 1;
        }
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v27 = objc_opt_class();
    char v28 = [(id)objc_opt_class() entityClassName];
    *(_DWORD *)buf = 138413314;
    id v39 = v10;
    __int16 v40 = 2112;
    id v41 = v7;
    __int16 v42 = 2112;
    uint64_t v43 = v27;
    __int16 v44 = 2112;
    v45 = v28;
    __int16 v46 = 2112;
    id v47 = v8;
    _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Moment updated but momentUUID is invalid (%@) for local identifier: %@, class: %@, entityClassName: %@, changedPropertyNames: %@", buf, 0x34u);
  }
}

void __101__PGGraphMomentTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_334(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __101__PGGraphMomentTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2;
    v8[3] = &unk_1E68EFDD8;
    id v9 = v6;
    id v10 = *(id *)(a1 + 40);
    [v5 enumerateIndexesUsingBlock:v8];
  }
}

void __101__PGGraphMomentTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = [[PGGraphHighlightChange alloc] initWithHighlightUUID:*(void *)(a1 + 32) updateTypes:a2];
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
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Batch Updates - Delete %ld moments", buf, 0xCu);
  }
  id v5 = [(id)objc_opt_class() uuidsFromLocalIdentifiers:v4];
  v6 = [[PGGraphMomentsDeletion alloc] initWithMomentUUIDs:v5];
  id v9 = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];

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
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Batch Updates - Insert %ld new moments", buf, 0xCu);
  }
  id v5 = [(id)objc_opt_class() uuidsFromLocalIdentifiers:v4];
  v6 = [[PGGraphMomentsInsertion alloc] initWithMomentUUIDs:v5];
  id v9 = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];

  return v7;
}

@end