@interface PGPNGraphHelper
+ (id)_createSocialGraphWithPersonClusterManager:(id)a3 persons:(id)a4 moments:(id)a5 inferredMePersonLocalIdentifier:(id *)a6 updateBlock:(id)a7;
+ (id)_socialGroupsLocalIdentifiersInGraph:(id)a3 includeMeNode:(BOOL)a4 includeCouples:(BOOL)a5 includeInvalid:(BOOL)a6;
+ (id)densityClusteringForObjects:(id)a3 maximumDistance:(double)a4 minimumNumberOfObjects:(unint64_t)a5 withDistanceBlock:(id)a6;
+ (id)multiLevelSocialGroupsWithPersonClusterManager:(id)a3 forPersons:(id)a4 updateBlock:(id)a5;
+ (id)socialGroupsOverTheYearsWithPersonClusterManager:(id)a3 forPersons:(id)a4 updateBlock:(id)a5;
+ (id)suggestedMeIdentifierWithPersonClusterManager:(id)a3 forPersons:(id)a4 updateBlock:(id)a5;
+ (id)verifiedPeopleSocialGroupsWithPhotoLibrary:(id)a3 updateBlock:(id)a4;
@end

@implementation PGPNGraphHelper

+ (id)densityClusteringForObjects:(id)a3 maximumDistance:(double)a4 minimumNumberOfObjects:(unint64_t)a5 withDistanceBlock:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F8A780]) initWithDistanceBlock:v10];
  [v11 setMaximumDistance:a4];
  [v11 setMinimumNumberOfObjects:a5];
  v12 = [v11 performWithDataset:v9 progressBlock:0];
  v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "objects", (void)v21);
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  return v13;
}

+ (id)socialGroupsOverTheYearsWithPersonClusterManager:(id)a3 forPersons:(id)a4 updateBlock:(id)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v49 = a4;
  id v48 = a5;
  v47 = objc_opt_new();
  context = (void *)MEMORY[0x1D25FED50]();
  v50 = v7;
  v8 = objc_msgSend(v7, "pn_fetchMoments");
  id v9 = [v8 fetchedObjects];
  id v10 = objc_opt_new();
  v51 = v9;
  v11 = [v9 firstObject];
  v12 = [v11 startDate];

  v13 = objc_opt_new();
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v56 objects:v71 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v57 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        [v13 addObject:v19];
        v20 = [v19 startDate];
        [v20 timeIntervalSinceDate:v12];
        if (v21 > 31556926.0
          || ([v51 lastObject],
              long long v22 = objc_claimAutoreleasedReturnValue(),
              v22,
              v19 == v22))
        {
          long long v23 = (void *)[v13 copy];
          [v10 addObject:v23];

          id v24 = v20;
          [v13 removeAllObjects];
          v12 = v24;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v56 objects:v71 count:16];
    }
    while (v16);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v10;
  uint64_t v25 = [obj countByEnumeratingWithState:&v52 objects:v70 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v46 = *(void *)v53;
    v27 = off_1E68E2000;
    while (2)
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v53 != v46) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v52 + 1) + 8 * j);
        v30 = (void *)MEMORY[0x1D25FED50]();
        uint64_t v31 = [(__objc2_class *)v27[364] _createSocialGraphWithPersonClusterManager:v50 persons:v49 moments:v29 inferredMePersonLocalIdentifier:0 updateBlock:v48];
        if (!v31)
        {

          v38 = (void *)MEMORY[0x1E4F1CBF0];
          v37 = v47;
          goto LABEL_23;
        }
        v32 = (void *)v31;
        v33 = v27;
        v34 = [(__objc2_class *)v27[364] _socialGroupsLocalIdentifiersInGraph:v31 includeMeNode:1 includeCouples:1 includeInvalid:1];
        [v47 addObjectsFromArray:v34];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v41 = [v29 count];
          v43 = [v29 firstObject];
          v44 = [v43 startDate];
          v42 = [v29 lastObject];
          v35 = [v42 endDate];
          uint64_t v36 = [v34 count];
          *(_DWORD *)buf = 134219010;
          uint64_t v61 = v41;
          __int16 v62 = 2112;
          v63 = v44;
          __int16 v64 = 2112;
          v65 = v35;
          __int16 v66 = 2048;
          uint64_t v67 = v36;
          __int16 v68 = 2112;
          v69 = v34;
          _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Created graph from %lu moments: %@ - %@.\nFound %lu social groups: %@", buf, 0x34u);
        }
        v27 = v33;
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v52 objects:v70 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }

  v37 = v47;
  v38 = [v47 allObjects];
LABEL_23:

  return v38;
}

+ (id)multiLevelSocialGroupsWithPersonClusterManager:(id)a3 forPersons:(id)a4 updateBlock:(id)a5
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"highlyInteresting == YES"];
  v11 = [v8 filteredSetUsingPredicate:v10];

  if ((unint64_t)[v11 count] <= 3)
  {
    id v12 = v8;

    v11 = v12;
  }
  v13 = objc_opt_new();
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v73 objects:v82 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v74 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v73 + 1) + 8 * i) backingMomentIdentifiers];
        [v13 unionSet:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v73 objects:v82 count:16];
    }
    while (v16);
  }

  v20 = [v13 allObjects];
  double v21 = objc_msgSend(v7, "pn_fetchMomentsWithLocalIdentifiers:", v20);

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v49 = [v14 count];
    uint64_t v50 = [v21 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v79 = v49;
    __int16 v80 = 2048;
    uint64_t v81 = v50;
    _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Generating graph with %lu persons, %lu moments", buf, 0x16u);
  }
  long long v22 = v9;
  long long v23 = +[PGPNGraphHelper _createSocialGraphWithPersonClusterManager:v7 persons:v14 moments:v21 inferredMePersonLocalIdentifier:0 updateBlock:v9];
  id v24 = v23;
  if (!v23)
  {
    id v48 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_44;
  }
  v63 = v8;
  uint64_t v25 = [v23 meNode];
  id v26 = [v25 localIdentifier];

  v27 = +[PGPNGraphHelper _socialGroupsLocalIdentifiersInGraph:v24 includeMeNode:1 includeCouples:1 includeInvalid:0];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v28 = [v27 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v79 = v28;
    __int16 v80 = 2112;
    uint64_t v81 = (uint64_t)v27;
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Found %lu social groups, %@", buf, 0x16u);
  }
  if ([v27 count])
  {
    v29 = (void *)MEMORY[0x1E4F28F60];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __89__PGPNGraphHelper_multiLevelSocialGroupsWithPersonClusterManager_forPersons_updateBlock___block_invoke;
    v70[3] = &unk_1E68EA368;
    id v62 = v27;
    id v71 = v62;
    id v26 = v26;
    id v72 = v26;
    v30 = [v29 predicateWithBlock:v70];
    uint64_t v31 = [v63 filteredSetUsingPredicate:v30];

    if ((unint64_t)[v31 count] < 3)
    {
      BOOL v44 = 1;
    }
    else
    {
      long long v57 = v24;
      long long v58 = v21;
      long long v59 = v22;
      v60 = v7;
      __int16 v64 = objc_opt_new();
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      uint64_t v61 = v31;
      id v32 = v31;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v66 objects:v77 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v67;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v67 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = *(void **)(*((void *)&v66 + 1) + 8 * j);
            v38 = [v37 localIdentifier];
            char v39 = [v38 isEqualToString:v26];

            if ((v39 & 1) == 0)
            {
              v40 = [v37 backingMomentIdentifiers];
              [v64 unionSet:v40];
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v66 objects:v77 count:16];
        }
        while (v34);
      }

      uint64_t v41 = [v64 allObjects];
      id v7 = v60;
      v42 = objc_msgSend(v60, "pn_fetchMomentsWithLocalIdentifiers:", v41);

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v53 = [v32 count];
        uint64_t v54 = [v42 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v79 = v53;
        __int16 v80 = 2048;
        uint64_t v81 = v54;
        _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Generating extra graph with %lu persons, %lu moments", buf, 0x16u);
      }
      id v65 = v26;
      long long v56 = v42;
      long long v22 = v59;
      v43 = +[PGPNGraphHelper _createSocialGraphWithPersonClusterManager:v60 persons:v32 moments:v42 inferredMePersonLocalIdentifier:&v65 updateBlock:v59];
      id v55 = v65;

      BOOL v44 = v43 != 0;
      uint64_t v31 = v61;
      if (v43)
      {
        v45 = +[PGPNGraphHelper _socialGroupsLocalIdentifiersInGraph:v43 includeMeNode:1 includeCouples:0 includeInvalid:0];
        if ([v45 count])
        {
          uint64_t v46 = [v62 arrayByAddingObjectsFromArray:v45];

          id v24 = v57;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            uint64_t v47 = [v45 count];
            *(_DWORD *)buf = 134218242;
            uint64_t v79 = v47;
            __int16 v80 = 2112;
            uint64_t v81 = (uint64_t)v45;
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Adding %lu extra social groups, %@", buf, 0x16u);
          }
          uint64_t v31 = v61;
        }
        else
        {
          uint64_t v46 = (uint64_t)v62;
          id v24 = v57;
        }

        id v62 = (id)v46;
      }
      else
      {
        id v24 = v57;
      }

      id v26 = v55;
      double v21 = v58;
    }

    if (!v44)
    {
      id v48 = (void *)MEMORY[0x1E4F1CBF0];
      id v51 = v62;
      goto LABEL_43;
    }
    v27 = v62;
  }
  id v51 = v27;
  id v48 = v51;
LABEL_43:

  id v8 = v63;
LABEL_44:

  return v48;
}

uint64_t __89__PGPNGraphHelper_multiLevelSocialGroupsWithPersonClusterManager_forPersons_updateBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [a2 localIdentifier];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "containsObject:", v3, (void)v11)
          && ![v3 isEqualToString:*(void *)(a1 + 40)])
        {
          uint64_t v9 = 0;
          goto LABEL_12;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 1;
LABEL_12:

  return v9;
}

+ (id)verifiedPeopleSocialGroupsWithPhotoLibrary:(id)a3 updateBlock:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F8E830]);
  uint64_t v8 = (void *)[v7 initWithPhotoLibrary:v5 rawClusters:MEMORY[0x1E4F1CC08] includesPets:1];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F8E808]) initWithPhotoLibrary:v8];
  id v10 = objc_msgSend(v9, "pn_fetchPersonsWithType:", 1);
  long long v11 = (void *)MEMORY[0x1E4F1CA80];
  v38 = v10;
  long long v12 = [v10 fetchedObjects];
  long long v13 = [v11 setWithArray:v12];

  long long v14 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v39 + 1) + 8 * i) backingMomentIdentifiers];
        [v14 unionSet:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v17);
  }

  double v21 = [v14 allObjects];
  long long v22 = objc_msgSend(v9, "pn_fetchMomentsWithLocalIdentifiers:", v21);

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v34 = [v15 count];
    uint64_t v35 = [v22 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v44 = v34;
    __int16 v45 = 2048;
    uint64_t v46 = v35;
    _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Generating graph with %lu persons, %lu moments", buf, 0x16u);
  }
  long long v23 = +[PGPNGraphHelper _createSocialGraphWithPersonClusterManager:v9 persons:v15 moments:v22 inferredMePersonLocalIdentifier:0 updateBlock:v6];
  if (v23)
  {
    v37 = v9;
    id v24 = [[PGManager alloc] initWithGraph:v23 photoLibrary:v5];
    uint64_t v36 = v22;
    uint64_t v25 = [[PGGraphBuilder alloc] initWithGraph:v23 manager:v24];
    id v26 = [[PGGraphIngestSocialGroupsProcessor alloc] initWithGraphBuilder:v25];
    v27 = [[PGGraphUpdate alloc] initWithPhotoLibrary:v5 updateType:3];
    uint64_t v28 = v8;
    id v29 = v5;
    id v30 = v6;
    uint64_t v31 = v27;
    [(PGGraphIngestSocialGroupsProcessor *)v26 runWithGraphUpdate:v27 progressBlock:&__block_literal_global_42829];
    id v32 = v23;

    id v6 = v30;
    id v5 = v29;
    uint64_t v8 = v28;

    long long v22 = v36;
    uint64_t v9 = v37;
  }

  return v23;
}

+ (id)suggestedMeIdentifierWithPersonClusterManager:(id)a3 forPersons:(id)a4 updateBlock:(id)a5
{
  return 0;
}

+ (id)_socialGroupsLocalIdentifiersInGraph:(id)a3 includeMeNode:(BOOL)a4 includeCouples:(BOOL)a5 includeInvalid:(BOOL)a6
{
  id v9 = a3;
  id v10 = objc_opt_new();
  long long v11 = [v9 meNode];
  long long v12 = [v11 localIdentifier];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__PGPNGraphHelper__socialGroupsLocalIdentifiersInGraph_includeMeNode_includeCouples_includeInvalid___block_invoke;
  aBlock[3] = &unk_1E68EA340;
  BOOL v28 = a5;
  BOOL v29 = a4;
  id v26 = v12;
  id v13 = v10;
  id v27 = v13;
  id v14 = v12;
  id v15 = _Block_copy(aBlock);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __100__PGPNGraphHelper__socialGroupsLocalIdentifiersInGraph_includeMeNode_includeCouples_includeInvalid___block_invoke_2;
  v23[3] = &unk_1E68EC4E0;
  id v24 = v15;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __100__PGPNGraphHelper__socialGroupsLocalIdentifiersInGraph_includeMeNode_includeCouples_includeInvalid___block_invoke_3;
  v20[3] = &unk_1E68EC508;
  BOOL v22 = a6;
  id v21 = v24;
  id v16 = v24;
  [v9 enumerateSocialGroupsIncludingMeNode:0 validGroupsBlock:v23 invalidGroupsBlock:v20 averageWeight:0];

  uint64_t v17 = v21;
  id v18 = v13;

  return v18;
}

void __100__PGPNGraphHelper__socialGroupsLocalIdentifiersInGraph_includeMeNode_includeCouples_includeInvalid___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "localIdentifier", (void)v11);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)(a1 + 48) || (unint64_t)[v4 count] >= 2)
  {
    if (*(unsigned char *)(a1 + 49) && [*(id *)(a1 + 32) length]) {
      [v4 addObject:*(void *)(a1 + 32)];
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4, (void)v11);
  }
}

uint64_t __100__PGPNGraphHelper__socialGroupsLocalIdentifiersInGraph_includeMeNode_includeCouples_includeInvalid___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __100__PGPNGraphHelper__socialGroupsLocalIdentifiersInGraph_includeMeNode_includeCouples_includeInvalid___block_invoke_3(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

+ (id)_createSocialGraphWithPersonClusterManager:(id)a3 persons:(id)a4 moments:(id)a5 inferredMePersonLocalIdentifier:(id *)a6 updateBlock:(id)a7
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  id v73 = a4;
  id v11 = a5;
  long long v74 = (void (**)(id, unsigned char *, float))a7;
  if (!v11)
  {
    objc_msgSend(v69, "pn_fetchMoments");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  long long v12 = objc_alloc_init(PGMutableGraph);
  if (a6) {
    id v78 = *a6;
  }
  else {
    id v78 = 0;
  }
  char v96 = 0;
  unint64_t v13 = objc_msgSend(v11, "count", a6);
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v14 = v11;
  uint64_t v72 = [v14 countByEnumeratingWithState:&v92 objects:v107 count:16];
  if (v72)
  {
    uint64_t v71 = *(void *)v93;
    float v15 = 0.0 / (float)v13;
    uint64_t v79 = v12;
    v70 = v14;
    while (2)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v93 != v71) {
          objc_enumerationMutation(v14);
        }
        uint64_t v17 = *(void **)(*((void *)&v92 + 1) + 8 * v16);
        id v18 = (void *)MEMORY[0x1D25FED50]();
        v74[2](v74, &v96, v15);
        if (v96)
        {

          long long v56 = 0;
          goto LABEL_43;
        }
        context = v18;
        uint64_t v77 = v16;
        v105[0] = @"utcs";
        v19 = NSNumber;
        id obja = [v17 startDate];
        [obja timeIntervalSince1970];
        uint64_t v81 = objc_msgSend(v19, "numberWithDouble:");
        v106[0] = v81;
        v105[1] = @"utce";
        v20 = NSNumber;
        id v21 = [v17 endDate];
        [v21 timeIntervalSince1970];
        BOOL v22 = objc_msgSend(v20, "numberWithDouble:");
        v106[1] = v22;
        v105[2] = @"tzs";
        long long v23 = NSNumber;
        id v24 = [v17 startDate];
        [v24 timeIntervalSince1970];
        uint64_t v25 = objc_msgSend(v23, "numberWithDouble:");
        v106[2] = v25;
        v105[3] = @"tze";
        id v26 = NSNumber;
        id v27 = [v17 endDate];
        [v27 timeIntervalSince1970];
        BOOL v28 = objc_msgSend(v26, "numberWithDouble:");
        v106[3] = v28;
        v105[4] = @"cnt";
        BOOL v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "estimatedAssetCount"));
        v106[4] = v29;
        v105[5] = @"lclid";
        id v30 = [v17 localIdentifier];
        v106[5] = v30;
        uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:6];

        long long v12 = v79;
        long long v75 = (void *)v31;
        __int16 v80 = [(PGMutableGraph *)v79 addUniqueNodeWithLabel:@"Moment" domain:100 properties:v31 didCreate:0];
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        obuint64_t j = v73;
        uint64_t v32 = [obj countByEnumeratingWithState:&v88 objects:v104 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v89;
          do
          {
            uint64_t v35 = 0;
            uint64_t v82 = v33;
            do
            {
              if (*(void *)v89 != v34) {
                objc_enumerationMutation(obj);
              }
              uint64_t v36 = *(void **)(*((void *)&v88 + 1) + 8 * v35);
              v37 = (void *)MEMORY[0x1D25FED50]();
              v38 = [v36 backingMomentIdentifiers];
              long long v39 = [v17 localIdentifier];
              int v40 = [v38 containsObject:v39];

              if (v40)
              {
                long long v41 = v17;
                uint64_t v42 = [v36 anonymizedName];
                v43 = (void *)v42;
                uint64_t v44 = &stru_1F283BC78;
                if (v42) {
                  uint64_t v44 = (__CFString *)v42;
                }
                __int16 v45 = v44;

                uint64_t v46 = [v36 localIdentifier];
                v102[0] = @"name";
                v102[1] = @"id";
                v103[0] = v45;
                v103[1] = v46;
                v102[2] = @"usercreated";
                uint64_t v47 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v36, "isVerified"));
                v103[2] = v47;
                v102[3] = @"fav";
                uint64_t v48 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v36, "favorite"));
                v103[3] = v48;
                uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:4];

                if (v78)
                {
                  uint64_t v50 = [v36 localIdentifier];
                  int v51 = [v78 isEqualToString:v50];

                  if (v51) {
                    long long v52 = @"Me";
                  }
                  else {
                    long long v52 = @"People";
                  }
                }
                else
                {
                  long long v52 = @"People";
                }
                long long v12 = v79;
                uint64_t v53 = [(PGMutableGraph *)v79 addUniqueNodeWithLabel:v52 domain:300 properties:v49 didCreate:0];
                [(PGMutableGraph *)v79 addUniqueEdgeWithLabel:@"PRESENT" sourceNode:v53 targetNode:v80 domain:300 properties:0];

                uint64_t v17 = v41;
                uint64_t v33 = v82;
              }
              ++v35;
            }
            while (v33 != v35);
            uint64_t v33 = [obj countByEnumeratingWithState:&v88 objects:v104 count:16];
          }
          while (v33);
        }

        uint64_t v16 = v77 + 1;
        id v14 = v70;
      }
      while (v77 + 1 != v72);
      uint64_t v72 = [v70 countByEnumeratingWithState:&v92 objects:v107 count:16];
      if (v72) {
        continue;
      }
      break;
    }
  }

  if (!v78)
  {
    uint64_t v54 = [(PGGraph *)v12 inferMeNodeFromSocialGroups];
    if (v54)
    {
      id v55 = (void *)v54;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v98 = v55;
        _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "inferredMeNode found %@", buf, 0xCu);
      }
      if (v68)
      {
        *long long v68 = [v55 localIdentifier];
      }
    }
    else
    {
      if (![v73 count]) {
        goto LABEL_42;
      }
      long long v57 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"faceCount" ascending:0];
      v101 = v57;
      long long v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
      long long v59 = [v73 sortedArrayUsingDescriptors:v58];

      v60 = [v59 firstObject];
      uint64_t v61 = [v60 localIdentifier];
      id v55 = [(PGGraph *)v12 personNodeForPersonLocalIdentifier:v61];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v98 = v55;
        __int16 v99 = 2112;
        v100 = v60;
        _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "inferredMeNode fallback found %@ - backing person: %@", buf, 0x16u);
      }

      if (!v55) {
        goto LABEL_42;
      }
    }
    id v62 = [v55 propertyDictionary];
    v63 = [(PGMutableGraph *)v12 addUniqueNodeWithLabel:@"Me" domain:300 properties:v62 didCreate:0];

    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __122__PGPNGraphHelper__createSocialGraphWithPersonClusterManager_persons_moments_inferredMePersonLocalIdentifier_updateBlock___block_invoke;
    v85[3] = &unk_1E68F1AA0;
    __int16 v64 = v12;
    v86 = v64;
    id v87 = v63;
    id v65 = v63;
    [v55 enumerateEdgesWithLabel:@"PRESENT" domain:300 usingBlock:v85];
    id v66 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    [v66 removeNode:v55];
    [(MAGraph *)v64 executeGraphChangeRequest:v66];
  }
LABEL_42:
  long long v56 = v12;
LABEL_43:

  return v56;
}

void __122__PGPNGraphHelper__createSocialGraphWithPersonClusterManager_persons_moments_inferredMePersonLocalIdentifier_updateBlock___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [a2 targetNode];
  id v5 = [v2 addUniqueEdgeWithLabel:@"PRESENT" sourceNode:v3 targetNode:v4 domain:300 properties:0];
}

@end