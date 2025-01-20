@interface PGGraphPersonTranslator
+ (Class)entityClass;
- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5;
- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4;
- (id)personNodePropertyKeysFromPHPersonPropertyKeys:(id)a3;
- (id)personTypeProperties;
- (id)stateUpdateProperties;
- (id)verifiedTypeProperties;
@end

@implementation PGGraphPersonTranslator

+ (Class)entityClass
{
  return (Class)objc_opt_class();
}

- (id)personNodePropertyKeysFromPHPersonPropertyKeys:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToString:", @"name", (void)v12) & 1) != 0
          || [v10 isEqualToString:@"displayName"])
        {
          [v4 addObject:@"name"];
        }
        if ([v10 isEqualToString:@"type"]) {
          [v4 addObject:@"fav"];
        }
        if ([v10 isEqualToString:@"personUri"]) {
          [v4 addObject:@"cnid"];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)personTypeProperties
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"type";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)verifiedTypeProperties
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"verifiedType";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)stateUpdateProperties
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"name";
  v6[1] = @"displayName";
  void v6[2] = @"personUri";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5
{
  v106[1] = *MEMORY[0x1E4F143B8];
  id v66 = a3;
  id v61 = a4;
  id v62 = a5;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  char v99 = 0;
  uint64_t v92 = 0;
  v93 = (double *)&v92;
  uint64_t v94 = 0x2020000000;
  uint64_t v95 = 0;
  v67 = _Block_copy(v62);
  if (!v67
    || (double v8 = CFAbsoluteTimeGetCurrent(), v8 - v93[3] < 0.01)
    || (v93[3] = v8,
        LOBYTE(v106[0]) = 0,
        (*((void (**)(void *, void *, double))v67 + 2))(v67, v106, 0.0),
        char v9 = *((unsigned char *)v97 + 24) | LOBYTE(v106[0]),
        (*((unsigned char *)v97 + 24) = v9) == 0))
  {
    v11 = [(PGGraphPersonTranslator *)self verifiedTypeProperties];
    long long v12 = [(PGGraphPersonTranslator *)self stateUpdateProperties];
    long long v13 = [(PGGraphPersonTranslator *)self personTypeProperties];
    v64 = self;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __101__PGGraphPersonTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke;
    v80[3] = &unk_1E68EDEA0;
    id v58 = v11;
    id v81 = v58;
    id v63 = v14;
    id v82 = v63;
    id v60 = v13;
    id v83 = v60;
    v84 = self;
    id v65 = v16;
    id v85 = v65;
    id v59 = v12;
    id v86 = v59;
    id v18 = v17;
    id v87 = v18;
    id v56 = v67;
    id v88 = v56;
    v89 = &v92;
    v90 = &v96;
    uint64_t v91 = 0x3F847AE147AE147BLL;
    [v66 enumerateKeysAndObjectsUsingBlock:v80];
    if (*((unsigned char *)v97 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 623;
        LOWORD(v103) = 2080;
        *(void *)((char *)&v103 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Core/PGGraphEntityTranslator.m";
        v19 = MEMORY[0x1E4F14500];
LABEL_10:
        _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      uint64_t v20 = [v65 count];
      v21 = (void *)MEMORY[0x1E4F397D8];
      if (v20)
      {
        v22 = (void *)MEMORY[0x1E4F1CA80];
        v23 = [v65 allKeys];
        v24 = [v22 setWithArray:v23];

        v25 = [(PGGraphEntityTranslator *)self photoLibrary];
        id v26 = v24;
        v27 = [v25 librarySpecificFetchOptions];
        v28 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"localIdentifier", v26];

        [v27 setPredicate:v28];
        [v27 setIncludedDetectionTypes:&unk_1F28D48C0];
        uint64_t v29 = *MEMORY[0x1E4F397D0];
        *(void *)buf = *v21;
        *(void *)&long long v103 = v29;
        v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:2];
        [v27 setFetchPropertySets:v30];

        v31 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v27];

        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __101__PGGraphPersonTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_399;
        v76[3] = &unk_1E68EDEC8;
        id v77 = v18;
        id v78 = v15;
        id v79 = v65;
        [v31 enumerateObjectsUsingBlock:v76];
      }
      if ([v63 count])
      {
        v32 = [(PGGraphEntityTranslator *)self photoLibrary];
        id v57 = v63;
        v33 = [v32 librarySpecificFetchOptions];
        v34 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"localIdentifier IN %@ AND verifiedType = %d", v57, -2];

        [v33 setPredicate:v34];
        [v33 setIncludedDetectionTypes:&unk_1F28D48D8];
        v106[0] = *v21;
        v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:1];
        [v33 setFetchPropertySets:v35];

        v36 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v33];
        v37 = [MEMORY[0x1E4F1CA80] set];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&long long v103 = 3221225472;
        *((void *)&v103 + 1) = __tombstonedLocalIdentifiersFrom_block_invoke;
        v104 = &unk_1E68EDF38;
        id v38 = v37;
        id v105 = v38;
        [v36 enumerateObjectsUsingBlock:buf];

        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v39 = v38;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v72 objects:v101 count:16];
        if (v40)
        {
          uint64_t v41 = *(void *)v73;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v73 != v41) {
                objc_enumerationMutation(v39);
              }
              uint64_t v43 = *(void *)(*((void *)&v72 + 1) + 8 * i);
              v44 = [PGGraphPersonsDeletion alloc];
              v45 = [MEMORY[0x1E4F1CAD0] setWithObject:v43];
              v46 = [(PGGraphPersonsDeletion *)v44 initWithPersonLocalIdentifiers:v45];

              [v18 addObject:v46];
            }
            uint64_t v40 = [v39 countByEnumeratingWithState:&v72 objects:v101 count:16];
          }
          while (v40);
        }

        [v57 minusSet:v39];
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v47 = v57;
        uint64_t v48 = [v47 countByEnumeratingWithState:&v68 objects:v100 count:16];
        if (v48)
        {
          uint64_t v49 = *(void *)v69;
          do
          {
            for (uint64_t j = 0; j != v48; ++j)
            {
              if (*(void *)v69 != v49) {
                objc_enumerationMutation(v47);
              }
              [v15 addObject:*(void *)(*((void *)&v68 + 1) + 8 * j)];
            }
            uint64_t v48 = [v47 countByEnumeratingWithState:&v68 objects:v100 count:16];
          }
          while (v48);
        }
      }
      if ([v15 count])
      {
        v51 = [(PGGraphEntityTranslator *)v64 photoLibrary];
        v52 = momentChangesForLocalIdentifiers(v15, v51, &__block_literal_global_61551);

        [v18 addObjectsFromArray:v52];
      }
      if (!v67
        || (double Current = CFAbsoluteTimeGetCurrent(), Current - v93[3] < 0.01)
        || (v93[3] = Current,
            LOBYTE(v106[0]) = 0,
            (*((void (**)(id, void *, double))v56 + 2))(v56, v106, 1.0),
            char v54 = *((unsigned char *)v97 + 24) | LOBYTE(v106[0]),
            (*((unsigned char *)v97 + 24) = v54) == 0))
      {
        id v10 = v18;
        goto LABEL_38;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 693;
        LOWORD(v103) = 2080;
        *(void *)((char *)&v103 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Core/PGGraphEntityTranslator.m";
        v19 = MEMORY[0x1E4F14500];
        goto LABEL_10;
      }
    }
    id v10 = (id)MEMORY[0x1E4F1CBF0];
LABEL_38:

    goto LABEL_39;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 574;
    LOWORD(v103) = 2080;
    *(void *)((char *)&v103 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Core/PGGraphEntityTranslator.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v10 = (id)MEMORY[0x1E4F1CBF0];
LABEL_39:
  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v96, 8);

  return v10;
}

void __101__PGGraphPersonTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  if ([v8 intersectsSet:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v7];
  }
  if ([v8 intersectsSet:*(void *)(a1 + 48)])
  {
    char v9 = [*(id *)(a1 + 56) personNodePropertyKeysFromPHPersonPropertyKeys:v8];
    [*(id *)(a1 + 64) setObject:v9 forKeyedSubscript:v7];
LABEL_7:

    goto LABEL_8;
  }
  if ([v8 intersectsSet:*(void *)(a1 + 72)])
  {
    char v9 = [*(id *)(a1 + 56) personNodePropertyKeysFromPHPersonPropertyKeys:v8];
    id v10 = [[PGGraphPersonChange alloc] initWithPersonLocalIdentifier:v7 propertyNames:v9];
    [*(id *)(a1 + 80) addObject:v10];

    goto LABEL_7;
  }
LABEL_8:
  if (*(void *)(a1 + 88))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v12 = *(void *)(*(void *)(a1 + 96) + 8);
    if (Current - *(double *)(v12 + 24) >= *(double *)(a1 + 112))
    {
      *(double *)(v12 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 88) + 16))(0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8)
                                                                             + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)) {
        *a4 = 1;
      }
    }
  }
}

void __101__PGGraphPersonTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_399(id *a1, void *a2)
{
  id v3 = a2;
  id v9 = [v3 localIdentifier];
  unint64_t v4 = [v3 type];

  if (v4 >= 2)
  {
    if (v4 != -1) {
      goto LABEL_6;
    }
    id v7 = [PGGraphPersonsDeletion alloc];
    id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    id v5 = [(PGGraphPersonsDeletion *)v7 initWithPersonLocalIdentifiers:v8];

    [a1[4] addObject:v5];
  }
  else
  {
    [a1[5] addObject:v9];
    id v5 = [a1[6] objectForKeyedSubscript:v9];
    uint64_t v6 = [[PGGraphPersonChange alloc] initWithPersonLocalIdentifier:v9 propertyNames:v5];
    [a1[4] addObject:v6];
  }
LABEL_6:
}

id __101__PGGraphPersonTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v4 = (void *)MEMORY[0x1E4F391A0];
  id v5 = a3;
  uint64_t v6 = [a2 allObjects];
  id v7 = [v4 fetchMomentsForPersonsWithLocalIdentifiers:v6 options:v5];

  return v7;
}

- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = [v4 count];
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Delete %ld persons", buf, 0xCu);
  }
  id v5 = [[PGGraphPersonsDeletion alloc] initWithPersonLocalIdentifiers:v4];
  id v8 = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];

  return v6;
}

@end