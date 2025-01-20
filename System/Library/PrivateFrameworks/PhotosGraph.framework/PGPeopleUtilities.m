@interface PGPeopleUtilities
+ (BOOL)_hasMomentsForPersonLocalIdentifiers:(id)a3 inGraph:(id)a4 photoLibrary:(id)a5 usePersonMoments:(BOOL)a6;
+ (id)_validPersonLocalIdentifiersFromSocialGroups:(id)a3 withPhotoLibrary:(id)a4;
+ (id)validateKeyedSocialGroups:(id)a3 withPhotoLibrary:(id)a4 graph:(id)a5;
+ (id)validateSocialGroups:(id)a3 withPhotoLibrary:(id)a4 graph:(id)a5;
+ (id)validateSocialGroups:(id)a3 withPhotoLibrary:(id)a4 graph:(id)a5 usePersonMoments:(BOOL)a6;
@end

@implementation PGPeopleUtilities

+ (BOOL)_hasMomentsForPersonLocalIdentifiers:(id)a3 inGraph:(id)a4 photoLibrary:(id)a5 usePersonMoments:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  v11 = +[PGGraphPersonNodeCollection personNodesForArrayOfLocalIdentifiers:a3 inGraph:v9];
  if ([v11 count])
  {
    if (v6)
    {
      v12 = [v11 momentNodes];
      v13 = [v12 localIdentifiers];
    }
    else
    {
      v14 = [v11 asSocialGroupMemberNodeCollection];
      v12 = [v9 socialGroupNodeForMemberNodes:v14];

      v15 = [v12 momentNodes];
      v13 = [v15 localIdentifiers];
    }
  }
  else
  {
    v13 = 0;
  }
  if ([v13 count])
  {
    v16 = [v10 librarySpecificFetchOptions];
    [v16 setShouldPrefetchCount:1];
    [v16 setFetchLimit:1];
    v17 = (void *)MEMORY[0x1E4F38EE8];
    v18 = [v13 allObjects];
    v19 = [v17 fetchAssetCollectionsWithLocalIdentifiers:v18 options:v16];

    BOOL v20 = [v19 count] != 0;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

+ (id)validateSocialGroups:(id)a3 withPhotoLibrary:(id)a4 graph:(id)a5 usePersonMoments:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [a1 _validPersonLocalIdentifiersFromSocialGroups:v10 withPhotoLibrary:v11];
  if ([v13 count])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __82__PGPeopleUtilities_validateSocialGroups_withPhotoLibrary_graph_usePersonMoments___block_invoke;
    v17[3] = &unk_1E68E5170;
    id v18 = v13;
    id v21 = a1;
    id v19 = v12;
    id v20 = v11;
    BOOL v22 = a6;
    v14 = [v10 indexesOfObjectsPassingTest:v17];
    v15 = [v10 objectsAtIndexes:v14];
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

uint64_t __82__PGPeopleUtilities_validateSocialGroups_withPhotoLibrary_graph_usePersonMoments___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(void *)(*((void *)&v10 + 1) + 8 * v7), (void)v10))
        {

          uint64_t v8 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v8 = [*(id *)(a1 + 56) _hasMomentsForPersonLocalIdentifiers:v3 inGraph:*(void *)(a1 + 40) photoLibrary:*(void *)(a1 + 48) usePersonMoments:*(unsigned __int8 *)(a1 + 64)];
LABEL_11:

  return v8;
}

+ (id)validateSocialGroups:(id)a3 withPhotoLibrary:(id)a4 graph:(id)a5
{
  return (id)[a1 validateSocialGroups:a3 withPhotoLibrary:a4 graph:a5 usePersonMoments:0];
}

+ (id)validateKeyedSocialGroups:(id)a3 withPhotoLibrary:(id)a4 graph:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  long long v12 = [v11 objectEnumerator];
  long long v13 = [a1 _validPersonLocalIdentifiersFromSocialGroups:v12 withPhotoLibrary:v9];

  if ([v13 count])
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __70__PGPeopleUtilities_validateKeyedSocialGroups_withPhotoLibrary_graph___block_invoke;
    v20[3] = &unk_1E68E5148;
    id v21 = v13;
    id v25 = a1;
    id v22 = v10;
    id v23 = v9;
    id v15 = v14;
    id v24 = v15;
    [v11 enumerateKeysAndObjectsUsingBlock:v20];
    v16 = v11;
    if ([v15 count])
    {
      v16 = (void *)[v11 mutableCopy];
      [v16 removeObjectsForKeys:v15];
    }
    id v17 = v16;

    id v18 = v17;
  }
  else
  {
    id v18 = (void *)MEMORY[0x1E4F1CC08];
    id v17 = v11;
  }

  return v18;
}

void __70__PGPeopleUtilities_validateKeyedSocialGroups_withPhotoLibrary_graph___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1D25FED50]();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(void *)(*((void *)&v13 + 1) + 8 * v12), (void)v13))
        {

          goto LABEL_12;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (([*(id *)(a1 + 64) _hasMomentsForPersonLocalIdentifiers:v8 inGraph:*(void *)(a1 + 40) photoLibrary:*(void *)(a1 + 48) usePersonMoments:0] & 1) == 0)LABEL_12:objc_msgSend(*(id *)(a1 + 56), "addObject:", v5, (void)v13); {
}
  }

+ (id)_validPersonLocalIdentifiersFromSocialGroups:(id)a3 withPhotoLibrary:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 addObjectsFromArray:*(void *)(*((void *)&v30 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    long long v13 = [v6 librarySpecificFetchOptions];
    long long v14 = (void *)MEMORY[0x1E4F391F0];
    long long v15 = [v7 allObjects];
    long long v16 = [v14 fetchPersonsWithLocalIdentifiers:v15 options:v13];

    id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v16, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          if (objc_msgSend(v23, "type", (void)v26) != -1)
          {
            id v24 = [v23 localIdentifier];
            [v17 addObject:v24];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v20);
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v17;
}

@end