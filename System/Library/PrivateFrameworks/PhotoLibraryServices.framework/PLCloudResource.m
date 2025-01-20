@interface PLCloudResource
+ (BOOL)_countOfLocalCloudResourcesOfType:(unint64_t)a3 inManagedObjectContext:(id)a4 forMediumSized:(BOOL)a5 localCount:(unint64_t *)a6 unavailableCount:(unint64_t *)a7 error:(id *)a8;
+ (BOOL)countOfLocalCloudResourcesOfType:(unint64_t)a3 inManagedObjectContext:(id)a4 localCount:(unint64_t *)a5 unavailableCount:(unint64_t *)a6 error:(id *)a7;
+ (BOOL)countOfMediumOriginalLocalCloudResourcesInManagedObjectContext:(id)a3 localCount:(unint64_t *)a4 unavailableCount:(unint64_t *)a5 error:(id *)a6;
+ (BOOL)legacyCreateNewResourcesIn:(id)a3 inManagedObjectContext:(id)a4 forAsset:(id)a5;
+ (id)assetUUIDToCloudResourcesForCloudMaster:(id)a3;
+ (id)cloudResourceForResourceType:(unint64_t)a3 forAssetUuid:(id)a4 forCloudMaster:(id)a5;
+ (id)cloudResourcesForResourceType:(unint64_t)a3 forCloudMaster:(id)a4;
+ (id)duplicateCloudResource:(id)a3 forAsset:(id)a4 withFilePath:(id)a5 inManagedObjectContext:(id)a6;
+ (id)entityName;
+ (id)insertIntoPhotoLibrary:(id)a3 forAsset:(id)a4 withCPLResource:(id)a5 adjusted:(BOOL)a6 withCreationDate:(id)a7;
+ (id)legacyCloudResourceForResourceType:(unint64_t)a3 forAsset:(id)a4;
+ (id)nonLocalResourcesInManagedObjectContext:(id)a3 forAssetUUIDs:(id)a4 cplResourceTypes:(id)a5;
+ (id)validatedExternalResourceFromCloudResource:(id)a3 asset:(id)a4;
+ (id)validatedExternalResourcesUsingLegacyCloudResourcesFromAssetWithCloudMaster:(id)a3;
+ (unint64_t)bytesForAllResourcesInLibrary:(id)a3;
+ (void)_copyResourceFileFrom:(id)a3 to:(id)a4;
+ (void)resetPrefetchStateForResourcesWithResourceType:(int64_t)a3 itemIdentifiers:(id)a4 inLibrary:(id)a5;
- (CPLScopedIdentifier)scopedIdentifier;
- (id)cplResourceIncludeFile:(BOOL)a3;
- (id)description;
- (void)_duplicatePropertiesFromCloudResource:(id)a3 withFilePath:(id)a4 forAssetUuid:(id)a5;
- (void)applyPropertiesFromCloudResource:(id)a3;
- (void)prepareForDeletion;
- (void)repairCloudPlaceholderKindForVideoAsset:(id)a3;
- (void)setIsLocallyAvailable:(BOOL)a3;
- (void)setLastPrefetchDate:(id)a3;
- (void)setPrefetchCount:(signed __int16)a3;
- (void)setPrunedAt:(id)a3;
@end

@implementation PLCloudResource

- (void)repairCloudPlaceholderKindForVideoAsset:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 master];
  v5 = [v3 uuid];
  v6 = [v3 uuid];
  v7 = +[PLCloudResource cloudResourceForResourceType:1 forAssetUuid:v6 forCloudMaster:v4];
  int v8 = [v7 isLocallyAvailable];

  if (v8) {
    [v3 setCloudPlaceholderKind:5];
  }
  if ([v3 cloudPlaceholderKind] != 5)
  {
    if ([v3 hasAdjustments])
    {
      v9 = +[PLCloudResource legacyCloudResourceForResourceType:5 forAsset:v3];
      int v10 = [v9 isLocallyAvailable];

      if (v10) {
        [v3 setCloudPlaceholderKind:3];
      }
      v11 = +[PLCloudResource legacyCloudResourceForResourceType:4 forAsset:v3];
      char v12 = [v11 isLocallyAvailable];

      if ((v12 & 1) == 0)
      {
        v13 = +[PLCloudResource legacyCloudResourceForResourceType:3 forAsset:v3];
        char v14 = [v13 isLocallyAvailable];

        if ((v14 & 1) == 0)
        {
          v15 = +[PLCloudResource legacyCloudResourceForResourceType:2 forAsset:v3];
          char v16 = [v15 isLocallyAvailable];

          if ((v16 & 1) == 0)
          {
            v17 = +[PLCloudResource legacyCloudResourceForResourceType:15 forAsset:v3];
            char v18 = [v17 isLocallyAvailable];

            if ((v18 & 1) == 0)
            {
              v19 = +[PLCloudResource legacyCloudResourceForResourceType:7 forAsset:v3];
              char v20 = [v19 isLocallyAvailable];

              if ((v20 & 1) == 0)
              {
                v21 = +[PLCloudResource legacyCloudResourceForResourceType:6 forAsset:v3];
                char v22 = [v21 isLocallyAvailable];

                if ((v22 & 1) == 0)
                {
                  v23 = +[PLCloudResource legacyCloudResourceForResourceType:16 forAsset:v3];
                  char v24 = [v23 isLocallyAvailable];

                  if ((v24 & 1) == 0) {
                    goto LABEL_24;
                  }
                }
              }
            }
          }
        }
      }
LABEL_23:
      [v3 setCloudPlaceholderKind:4];
      goto LABEL_24;
    }
    v25 = +[PLCloudResource cloudResourceForResourceType:5 forAssetUuid:v5 forCloudMaster:v4];
    int v26 = [v25 isLocallyAvailable];

    if (v26) {
      [v3 setCloudPlaceholderKind:3];
    }
    v27 = +[PLCloudResource cloudResourceForResourceType:4 forAssetUuid:v5 forCloudMaster:v4];
    char v28 = [v27 isLocallyAvailable];

    if (v28) {
      goto LABEL_23;
    }
    v29 = +[PLCloudResource cloudResourceForResourceType:3 forAssetUuid:v5 forCloudMaster:v4];
    char v30 = [v29 isLocallyAvailable];

    if (v30) {
      goto LABEL_23;
    }
    v31 = +[PLCloudResource cloudResourceForResourceType:2 forAssetUuid:v5 forCloudMaster:v4];
    char v32 = [v31 isLocallyAvailable];

    if (v32) {
      goto LABEL_23;
    }
    v33 = +[PLCloudResource cloudResourceForResourceType:7 forAssetUuid:v5 forCloudMaster:v4];
    char v34 = [v33 isLocallyAvailable];

    if (v34) {
      goto LABEL_23;
    }
    v35 = +[PLCloudResource cloudResourceForResourceType:6 forAssetUuid:v5 forCloudMaster:v4];
    char v36 = [v35 isLocallyAvailable];

    if (v36) {
      goto LABEL_23;
    }
    v37 = +[PLCloudResource cloudResourceForResourceType:16 forAssetUuid:v5 forCloudMaster:v4];
    int v38 = [v37 isLocallyAvailable];

    if (v38) {
      goto LABEL_23;
    }
  }
LABEL_24:
  v39 = PLMigrationGetLog();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    v40 = [v3 uuid];
    int v41 = 138412546;
    v42 = v40;
    __int16 v43 = 1024;
    int v44 = [v3 cloudPlaceholderKind];
    _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEBUG, "_fixVideoJPGPath: asset %@ cloudPlaceholderKind is now: %d", (uint8_t *)&v41, 0x12u);
  }
}

+ (id)validatedExternalResourcesUsingLegacyCloudResourcesFromAssetWithCloudMaster:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [v4 master];
  v7 = +[PLCloudResource assetUUIDToCloudResourcesForCloudMaster:v6];
  int v8 = [v4 uuid];
  v9 = [v7 objectForKeyedSubscript:v8];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [a1 validatedExternalResourceFromCloudResource:*(void *)(*((void *)&v33 + 1) + 8 * i) asset:v4];
        if (v15) {
          [v5 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  char v16 = [v4 resources];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [a1 validatedExternalResourceFromCloudResource:*(void *)(*((void *)&v29 + 1) + 8 * j) asset:v4];
        if (v21) {
          [v5 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v18);
  }

  if ([v4 hasUnrenderedAsyncAdjustments])
  {
    char v22 = +[PLResourceRecipe recipeFromID:65941];
    v23 = [v4 pathForAsyncAdjustedRenderPreviewImageFile];
    uint64_t v24 = [v4 width];
    uint64_t v25 = [v4 height];
    LOWORD(v28) = [v4 kind];
    int v26 = +[PLResourceInstaller generateValidatedExternalImageResourceOfType:0 forFilePath:v23 requireFileToBePresent:1 version:2 basedOnFullSizeWidth:v24 andHeight:v25 recipe:v22 assetKind:v28 error:0];

    if (v26) {
      [v5 addObject:v26];
    }
  }
  return v5;
}

+ (id)validatedExternalResourceFromCloudResource:(id)a3 asset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"PLCloudResource+Migration.m", 220, @"Invalid parameter not satisfying: %@", @"cloudResource" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, a1, @"PLCloudResource+Migration.m", 221, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

LABEL_3:
  if (+[PLResourceInstaller isValidCPLResourceTypeForPersistence:](PLResourceInstaller, "isValidCPLResourceTypeForPersistence:", (int)[v7 type]))
  {
    id v10 = [[PLValidatedExternalCloudResource alloc] initWithCloudResource:v7];
    uint64_t v11 = [v7 asset];

    uint64_t v12 = [v7 filePath];
    long long v33 = v10;
    if (v12)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F1CB10];
      char v14 = [v7 filePath];
      uint64_t v28 = [v13 fileURLWithPath:v14 isDirectory:0];
    }
    else
    {
      uint64_t v28 = 0;
    }
    BOOL v32 = v11 != 0;

    uint64_t v31 = (int)[v7 type];
    unsigned int v30 = [v9 kind];
    char v16 = [v7 uniformTypeIdentifier];
    uint64_t v29 = [v7 width];
    uint64_t v17 = [v7 height];
    uint64_t v18 = [v7 fingerprint];
    uint64_t v19 = [v7 fileSize];
    char v20 = [v7 isAvailable];
    v21 = [v9 master];
    char v22 = [v9 managedObjectContext];
    LOBYTE(v27) = 1;
    BYTE1(v26) = v32;
    LOBYTE(v26) = v20;
    v15 = +[PLResourceInstaller validatedExternalResourceFromExternalResourceCloudAttributes:cplType:assetType:uti:resourceWidth:resourceHeight:resourceFingerprint:resourceStableHash:resourceSize:isAvailable:fromAdjustedSet:resourceURL:cloudMaster:isForMigration:context:](PLResourceInstaller, "validatedExternalResourceFromExternalResourceCloudAttributes:cplType:assetType:uti:resourceWidth:resourceHeight:resourceFingerprint:resourceStableHash:resourceSize:isAvailable:fromAdjustedSet:resourceURL:cloudMaster:isForMigration:context:", v33, v31, v30, v16, v29, v17, v18, 0, v19, v26, v28, v21, v27, v22);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)cloudResourcesForResourceType:(unint64_t)a3 forCloudMaster:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = objc_msgSend(v5, "resources", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((int)[v12 type] == a3) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)assetUUIDToCloudResourcesForCloudMaster:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v15 = v3;
  id v5 = [v3 resources];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = (unsigned char *)MEMORY[0x1E4F59AC0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [v11 assetUuid];
        if (v12)
        {
          uint64_t v13 = [v4 objectForKey:v12];
          if (!v13)
          {
            uint64_t v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v4 setObject:v13 forKey:v12];
          }
          [v13 addObject:v11];
        }
        else
        {
          if (*v9) {
            goto LABEL_14;
          }
          uint64_t v13 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v11;
            _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Found nil assetUUID for master resource %@", buf, 0xCu);
          }
        }

LABEL_14:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)cloudResourceForResourceType:(unint64_t)a3 forAssetUuid:(id)a4 forCloudMaster:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = objc_msgSend(a5, "resources", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((int)[v13 type] == a3)
        {
          long long v14 = [v13 assetUuid];
          int v15 = [v14 isEqualToString:v7];

          if (v15)
          {
            id v16 = v13;
            goto LABEL_12;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_12:

  return v16;
}

+ (BOOL)legacyCreateNewResourcesIn:(id)a3 inManagedObjectContext:(id)a4 forAsset:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v55 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 resources];
  v53 = [v8 uuid];
  if (!v9)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      int v15 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v66 = v7;
        __int16 v67 = 2112;
        id v68 = a1;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "No resources for cloudMaster %@, unable to create master resources for asset %@", buf, 0x16u);
      }
    }
    BOOL v16 = 0;
    goto LABEL_40;
  }
  uint64_t v10 = [v9 anyObject];
  uint64_t v11 = [v10 assetUuid];

  if (!v11)
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    obuint64_t j = v9;
    uint64_t v17 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (!v17) {
      goto LABEL_38;
    }
    uint64_t v18 = v17;
    v48 = v10;
    v50 = v9;
    uint64_t v19 = *(void *)v61;
    char v20 = 1;
    long long v21 = (unsigned char *)MEMORY[0x1E4F59AC0];
    char v22 = obj;
LABEL_14:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v61 != v19) {
        objc_enumerationMutation(v22);
      }
      uint64_t v24 = *(void **)(*((void *)&v60 + 1) + 8 * v23);
      uint64_t v25 = [v24 assetUuid];

      if (v25)
      {
        if (*v21)
        {
          char v20 = 0;
          goto LABEL_24;
        }
        uint64_t v26 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v66 = v24;
          __int16 v67 = 2112;
          id v68 = v22;
          _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Found cloudResource %@ with unexpected non-nil assetUuid. masterResources: %@", buf, 0x16u);
        }
        char v20 = 0;
      }
      else
      {
        [v24 setAssetUuid:v53];
        uint64_t v27 = (int)[v24 type];
        uint64_t v28 = [v24 uniformTypeIdentifier];
        uint64_t v26 = [v8 localResourcePathForMasterResourceWithCPLType:v27 andUTI:v28];

        char v22 = obj;
        [v24 setFilePath:v26];
      }

LABEL_24:
      if (v18 == ++v23)
      {
        uint64_t v29 = [v22 countByEnumeratingWithState:&v60 objects:v69 count:16];
        uint64_t v18 = v29;
        if (!v29)
        {
          uint64_t v10 = v48;
          uint64_t v9 = v50;
          goto LABEL_39;
        }
        goto LABEL_14;
      }
    }
  }
  uint64_t v12 = [a1 assetUUIDToCloudResourcesForCloudMaster:v7];
  uint64_t v13 = [v12 objectForKey:v53];

  obuint64_t j = v12;
  if (v13)
  {
    if (*MEMORY[0x1E4F59AC0]) {
      goto LABEL_38;
    }
    long long v14 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v66 = a1;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Already have master resources for asset %@", buf, 0xCu);
    }
  }
  else
  {
    v49 = v10;
    v51 = v9;
    unsigned int v30 = [v12 allKeys];
    uint64_t v31 = [v30 firstObject];

    v47 = v31;
    BOOL v32 = [v12 objectForKey:v31];
    long long v33 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v32, "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v34 = v32;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v57 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          uint64_t v40 = (int)[v39 type];
          int v41 = [v39 uniformTypeIdentifier];
          v42 = [v8 localResourcePathForMasterResourceWithCPLType:v40 andUTI:v41];

          __int16 v43 = +[PLCloudResource duplicateCloudResource:v39 forAsset:v8 withFilePath:v42 inManagedObjectContext:v55];
          [a1 _copyResourceFileFrom:v39 to:v43];
          [v33 addObject:v43];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v56 objects:v64 count:16];
      }
      while (v36);
    }

    int v44 = [v7 resources];
    uint64_t v45 = (void *)[v44 mutableCopy];

    [v45 addObjectsFromArray:v33];
    [v7 setResources:v45];

    uint64_t v10 = v49;
    uint64_t v9 = v51;
    long long v14 = v47;
  }

LABEL_38:
  char v20 = 1;
LABEL_39:

  BOOL v16 = v20 & 1;
LABEL_40:

  return v16;
}

+ (void)_copyResourceFileFrom:(id)a3 to:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = a4;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v6 filePath];
  uint64_t v9 = [v5 filePath];
  if (v9)
  {
    BOOL v10 = ![v7 fileExistsAtPath:v9] || v8 == 0;
    if (!v10 && ([v7 fileExistsAtPath:v8] & 1) == 0)
    {
      uint64_t v13 = [v8 stringByDeletingLastPathComponent];
      id v21 = 0;
      int v14 = [v7 createDirectoryIfNeededAtPath:v13 error:&v21];
      int v15 = v21;
      uint64_t v12 = v15;
      if (v14)
      {
        char v20 = v15;
        int v16 = [v7 copyItemAtPath:v9 toPath:v8 error:&v20];
        uint64_t v17 = v20;

        if (v16)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            uint64_t v18 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v23 = v5;
              __int16 v24 = 2112;
              uint64_t v25 = v6;
              _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Copied duplicated resource file from %@ to %@", buf, 0x16u);
            }
          }
          [v6 setIsLocallyAvailable:1];
          if ([v6 type] != 1) {
            goto LABEL_31;
          }
          uint64_t v19 = [v6 asset];
          [v19 persistMetadataToFilesystem];
        }
        else
        {
          if (*MEMORY[0x1E4F59AC0])
          {
LABEL_31:
            uint64_t v12 = v17;
            goto LABEL_32;
          }
          uint64_t v19 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            id v23 = v9;
            __int16 v24 = 2112;
            uint64_t v25 = v8;
            __int16 v26 = 2112;
            uint64_t v27 = v17;
            _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Failed to copy master resource file from %@ to duplicated asset %@. Error: %@", buf, 0x20u);
          }
        }
      }
      else
      {
        if (*MEMORY[0x1E4F59AC0])
        {
LABEL_32:

LABEL_33:
          goto LABEL_34;
        }
        uint64_t v19 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v23 = v13;
          __int16 v24 = 2112;
          uint64_t v25 = v12;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Failed to create directory for resource file at %@. Error: %@", buf, 0x16u);
        }
        uint64_t v17 = v12;
      }

      goto LABEL_31;
    }
  }
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 && !*MEMORY[0x1E4F59AC0])
  {
    uint64_t v12 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v5;
      __int16 v24 = 2112;
      uint64_t v25 = v6;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Missing file path for duplicated resources, skip copying from %@ to %@", buf, 0x16u);
    }
    goto LABEL_33;
  }
LABEL_34:
}

+ (id)legacyCloudResourceForResourceType:(unint64_t)a3 forAsset:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(a4, "resources", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((int)[v10 type] == a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (void)prepareForDeletion
{
  v2.receiver = self;
  v2.super_class = (Class)PLCloudResource;
  [(PLManagedObject *)&v2 prepareForDeletion];
}

- (void)setPrunedAt:(id)a3
{
  id v4 = a3;
  [(PLCloudResource *)self willChangeValueForKey:@"prunedAt"];
  [(PLCloudResource *)self setPrimitiveValue:v4 forKey:@"prunedAt"];

  [(PLCloudResource *)self didChangeValueForKey:@"prunedAt"];
}

- (void)setPrefetchCount:(signed __int16)a3
{
  uint64_t v3 = a3;
  [(PLCloudResource *)self willChangeValueForKey:@"prefetchCount"];
  id v5 = [NSNumber numberWithShort:v3];
  [(PLCloudResource *)self setPrimitiveValue:v5 forKey:@"prefetchCount"];

  [(PLCloudResource *)self didChangeValueForKey:@"prefetchCount"];
}

- (void)setLastPrefetchDate:(id)a3
{
  id v4 = a3;
  [(PLCloudResource *)self willChangeValueForKey:@"lastPrefetchDate"];
  [(PLCloudResource *)self setPrimitiveValue:v4 forKey:@"lastPrefetchDate"];

  [(PLCloudResource *)self didChangeValueForKey:@"lastPrefetchDate"];
}

- (void)setIsLocallyAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  [(PLCloudResource *)self willAccessValueForKey:@"isLocallyAvailable"];
  id v5 = [(PLCloudResource *)self primitiveValueForKey:@"isLocallyAvailable"];
  int v6 = [v5 BOOLValue];

  [(PLCloudResource *)self didAccessValueForKey:@"isLocallyAvailable"];
  if (v6 != v3)
  {
    [(PLCloudResource *)self willChangeValueForKey:@"isLocallyAvailable"];
    uint64_t v7 = [NSNumber numberWithBool:v3];
    [(PLCloudResource *)self setPrimitiveValue:v7 forKey:@"isLocallyAvailable"];

    [(PLCloudResource *)self didChangeValueForKey:@"isLocallyAvailable"];
  }
}

- (id)cplResourceIncludeFile:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PLCloudResource *)self filePath];
  int v6 = (void *)v5;
  uint64_t v7 = 0;
  if (v3)
  {
    if (v5)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
      uint64_t v7 = v8;
      if (v8)
      {
        uint64_t v9 = [v8 URLByDeletingLastPathComponent];
        BOOL v10 = [v9 path];

        id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v22 = 0;
        char v12 = [v11 createDirectoryIfNeededAtPath:v10 error:&v22];
        id v13 = v22;

        if ((v12 & 1) == 0 && !*MEMORY[0x1E4F59AC0])
        {
          long long v14 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v24 = self;
            __int16 v25 = 2112;
            id v26 = v13;
            _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Unable to create directory for cloudResource %@: %@.", buf, 0x16u);
          }
        }
      }
    }
  }
  long long v15 = [(PLCloudResource *)self fingerprint];

  if (v15)
  {
    long long v16 = [objc_alloc(MEMORY[0x1E4F59948]) initWithFileURL:v7];
    [v16 setFileSize:[(PLCloudResource *)self fileSize]];
    -[NSObject setImageDimensions:](v16, "setImageDimensions:", (double)[(PLCloudResource *)self width], (double)[(PLCloudResource *)self height]);
    [v16 setAvailable:[(PLCloudResource *)self isAvailable]];
    uint64_t v17 = [(PLCloudResource *)self uniformTypeIdentifier];
    [v16 setFileUTI:v17];

    uint64_t v18 = [(PLCloudResource *)self fingerprint];
    [v16 setFingerPrint:v18];

    uint64_t v19 = [(PLCloudResource *)self scopedIdentifier];
    char v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F59940]), "initWithResourceIdentity:itemScopedIdentifier:resourceType:", v16, v19, (int)-[PLCloudResource type](self, "type"));

LABEL_16:
    goto LABEL_17;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    long long v16 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v24 = self;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Resource %@ has no finger print", buf, 0xCu);
    }
    char v20 = 0;
    goto LABEL_16;
  }
  char v20 = 0;
LABEL_17:

  return v20;
}

- (CPLScopedIdentifier)scopedIdentifier
{
  BOOL v3 = [(PLCloudResource *)self cloudMaster];
  id v4 = [(PLCloudResource *)self asset];
  uint64_t v5 = v3;
  if (v3 || (uint64_t v5 = v4) != 0)
  {
    int v6 = [v5 scopedIdentifier];
  }
  else
  {
    int v6 = 0;
  }

  return (CPLScopedIdentifier *)v6;
}

- (void)_duplicatePropertiesFromCloudResource:(id)a3 withFilePath:(id)a4 forAssetUuid:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  [(PLCloudResource *)self setAssetUuid:a5];
  [(PLCloudResource *)self setFilePath:v8];
  -[PLCloudResource setFileSize:](self, "setFileSize:", [v22 fileSize]);
  uint64_t v9 = [v22 fingerprint];
  [(PLCloudResource *)self setFingerprint:v9];

  -[PLCloudResource setHeight:](self, "setHeight:", [v22 height]);
  -[PLCloudResource setIsAvailable:](self, "setIsAvailable:", [v22 isAvailable]);
  -[PLCloudResource setType:](self, "setType:", [v22 type]);
  BOOL v10 = [v22 uniformTypeIdentifier];
  [(PLCloudResource *)self setUniformTypeIdentifier:v10];

  -[PLCloudResource setWidth:](self, "setWidth:", [v22 width]);
  id v11 = [v22 prunedAt];
  [(PLCloudResource *)self setPrunedAt:v11];

  char v12 = [v22 lastOnDemandDownloadDate];
  [(PLCloudResource *)self setLastOnDemandDownloadDate:v12];

  id v13 = [v22 itemIdentifier];
  [(PLCloudResource *)self setItemIdentifier:v13];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    id v17 = v22;
    if ([v17 isCPLAssetResource])
    {
      uint64_t v18 = [v17 asset];
      [(PLCloudResource *)self setAsset:v18];
    }
    else
    {
      if (![v17 isCPLMasterResource])
      {
LABEL_9:
        char v20 = [v17 cloudMasterDateCreated];
        [(PLCloudResource *)self setDateCreated:v20];

        goto LABEL_10;
      }
      uint64_t v18 = [v17 asset];
      uint64_t v19 = [v18 master];
      [(PLCloudResource *)self setCloudMaster:v19];
    }
    goto LABEL_9;
  }
  id v14 = v22;
  long long v15 = [v14 asset];
  [(PLCloudResource *)self setAsset:v15];

  long long v16 = [v14 cloudMaster];
  [(PLCloudResource *)self setCloudMaster:v16];

  id v17 = [v14 dateCreated];

  [(PLCloudResource *)self setDateCreated:v17];
LABEL_10:

LABEL_11:
  id v21 = [MEMORY[0x1E4F28CB8] defaultManager];
  -[PLCloudResource setIsLocallyAvailable:](self, "setIsLocallyAvailable:", [v21 fileExistsAtPath:v8]);
}

- (void)applyPropertiesFromCloudResource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 resourceType];
  id v13 = [v4 identity];
  -[PLCloudResource setFileSize:](self, "setFileSize:", [v13 fileSize]);
  [v13 imageDimensions];
  double v7 = v6;
  [(PLCloudResource *)self setWidth:(uint64_t)v8];
  [(PLCloudResource *)self setHeight:(uint64_t)v7];
  [(PLCloudResource *)self setType:v5];
  -[PLCloudResource setIsAvailable:](self, "setIsAvailable:", [v13 isAvailable]);
  uint64_t v9 = [v13 fileUTI];
  [(PLCloudResource *)self setUniformTypeIdentifier:v9];

  BOOL v10 = [v13 fingerPrint];
  [(PLCloudResource *)self setFingerprint:v10];

  id v11 = [v4 itemScopedIdentifier];

  char v12 = [v11 identifier];
  [(PLCloudResource *)self setItemIdentifier:v12];
}

- (id)description
{
  int v41 = NSString;
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F59940], "descriptionForResourceType:", (int)-[PLCloudResource type](self, "type"));
  id v4 = [(PLCloudResource *)self filePath];
  uint64_t v40 = [(PLCloudResource *)self fileSize];
  uint64_t v5 = [(PLCloudResource *)self height];
  uint64_t v6 = [(PLCloudResource *)self width];
  double v7 = [(PLCloudResource *)self fingerprint];
  double v8 = [(PLCloudResource *)self assetUuid];
  uint64_t v9 = @"NO";
  if ([(PLCloudResource *)self isAvailable]) {
    BOOL v10 = @"YES";
  }
  else {
    BOOL v10 = @"NO";
  }
  if ([(PLCloudResource *)self isLocallyAvailable]) {
    uint64_t v9 = @"YES";
  }
  id v11 = [v41 stringWithFormat:@"%@\n\t%@, size: %llu, height: %lld, width: %lld, fingerprint: %@, assetUUID: %@, isAvailable: %@, isLocallyAvailable: %@ cloudLocalState: %d", v3, v4, v40, v5, v6, v7, v8, v10, v9, (int)-[PLCloudResource cloudLocalState](self, "cloudLocalState")];

  char v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = [(PLCloudResource *)self filePath];
  int v14 = [v12 fileExistsAtPath:v13];

  if (v14 != [(PLCloudResource *)self isLocallyAvailable])
  {
    long long v15 = @"NO";
    if (v14) {
      long long v15 = @"YES";
    }
    uint64_t v16 = [v11 stringByAppendingFormat:@", isReallyLocallyAvailable %@", v15];

    id v11 = (void *)v16;
  }
  id v17 = [(PLCloudResource *)self uniformTypeIdentifier];
  uint64_t v18 = [v11 stringByAppendingFormat:@", UTI: \"%@\"", v17];

  uint64_t v19 = [(PLCloudResource *)self assetUuid];
  char v20 = [(PLCloudResource *)self managedObjectContext];
  id v21 = +[PLManagedAsset assetWithUUID:v19 inManagedObjectContext:v20];

  if ([v21 isVideo])
  {
    id v22 = (void *)MEMORY[0x1E4F1CB10];
    id v23 = [(PLCloudResource *)self filePath];
    __int16 v24 = [v22 fileURLWithPath:v23 isDirectory:0];

    __int16 v25 = [MEMORY[0x1E4F16330] assetWithURL:v24];
    id v26 = v25;
    if (v25)
    {
      uint64_t v27 = [v25 plVideoCodecName];
      uint64_t v28 = (void *)v27;
      if (v27)
      {
        uint64_t v29 = [v18 stringByAppendingFormat:@", Codec: \"%@\"", v27];

        uint64_t v18 = (void *)v29;
      }
    }
  }
  unsigned int v30 = [(PLCloudResource *)self lastOnDemandDownloadDate];

  if (v30)
  {
    uint64_t v31 = [(PLCloudResource *)self lastOnDemandDownloadDate];
    uint64_t v32 = [v18 stringByAppendingFormat:@", OnDemand DL date: %@", v31];

    uint64_t v18 = (void *)v32;
  }
  long long v33 = [(PLCloudResource *)self prunedAt];

  if (v33)
  {
    id v34 = [(PLCloudResource *)self prunedAt];
    uint64_t v35 = [v18 stringByAppendingFormat:@", Prune date: %@", v34];

    uint64_t v18 = (void *)v35;
  }
  uint64_t v36 = [(PLCloudResource *)self lastPrefetchDate];

  if (v36)
  {
    uint64_t v37 = [(PLCloudResource *)self lastPrefetchDate];
    uint64_t v38 = [v18 stringByAppendingFormat:@", Prefetch date: %@ (%d)", v37, (int)-[PLCloudResource prefetchCount](self, "prefetchCount")];

    uint64_t v18 = (void *)v38;
  }

  return v18;
}

+ (id)entityName
{
  return @"CloudResource";
}

+ (BOOL)_countOfLocalCloudResourcesOfType:(unint64_t)a3 inManagedObjectContext:(id)a4 forMediumSized:(BOOL)a5 localCount:(unint64_t *)a6 unavailableCount:(unint64_t *)a7 error:(id *)a8
{
  v64[4] = *MEMORY[0x1E4F143B8];
  id v53 = a4;
  v52 = +[PLCloudResource entityName];
  id v11 = objc_msgSend(MEMORY[0x1E4F1C0D0], "fetchRequestWithEntityName:");
  [MEMORY[0x1E4F59940] derivativeGenerationThreshold];
  unint64_t v13 = (unint64_t)(float)(v12
                                * (float)(unint64_t)[MEMORY[0x1E4F59940] maxPixelSizeForResourceType:4]);
  int v14 = (void *)MEMORY[0x1E4F28F60];
  long long v15 = [(id)*MEMORY[0x1E4F44410] identifier];
  v64[0] = v15;
  v64[1] = @"public.heic";
  v64[2] = @"public.heif";
  v64[3] = @"public.avci";
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:4];
  uint64_t v17 = [v14 predicateWithFormat:@"width * height <= %d AND uniformTypeIdentifier IN %@", v13, v16];

  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"isAvailable == YES AND type = %d", a3);
  uint64_t v19 = (void *)v18;
  v51 = (void *)v17;
  if (a5)
  {
    char v20 = (void *)MEMORY[0x1E4F28BA0];
    v63[0] = v18;
    v63[1] = v17;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
    id v22 = [v20 andPredicateWithSubpredicates:v21];
    [v11 setPredicate:v22];
  }
  else
  {
    [v11 setPredicate:v18];
  }
  id v23 = v11;
  [v11 setResultType:2];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v24 setName:@"count"];
  __int16 v25 = (void *)MEMORY[0x1E4F28C68];
  id v26 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  long long v62 = v26;
  uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
  uint64_t v28 = [v25 expressionForFunction:@"count:" arguments:v27];

  [v24 setExpression:v28];
  [v24 setExpressionResultType:200];
  v61[0] = @"isLocallyAvailable";
  v61[1] = v24;
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  [v23 setPropertiesToFetch:v29];

  [v23 setPropertiesToGroupBy:&unk_1EEBF1C28];
  id v59 = 0;
  unsigned int v30 = v53;
  uint64_t v31 = [v53 executeFetchRequest:v23 error:&v59];
  id v32 = v59;
  long long v33 = v32;
  if (v31)
  {
    if (a6) {
      *a6 = 0;
    }
    id v45 = v32;
    v47 = v28;
    id v48 = v24;
    v50 = v23;
    if (a7) {
      *a7 = 0;
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v46 = v31;
    id v34 = v31;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v56 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          uint64_t v40 = [v39 objectForKeyedSubscript:@"count"];
          uint64_t v41 = [v40 unsignedIntegerValue];

          v42 = [v39 objectForKeyedSubscript:@"isLocallyAvailable"];
          LODWORD(v40) = [v42 BOOLValue];

          __int16 v43 = a7;
          if (v40) {
            __int16 v43 = a6;
          }
          if (v43) {
            *__int16 v43 = v41;
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v55 objects:v60 count:16];
      }
      while (v36);
    }

    unsigned int v30 = v53;
    id v23 = v50;
    uint64_t v28 = v47;
    id v24 = v48;
    long long v33 = v45;
    uint64_t v31 = v46;
  }
  else if (a8)
  {
    *a8 = v32;
  }

  return v31 != 0;
}

+ (BOOL)countOfLocalCloudResourcesOfType:(unint64_t)a3 inManagedObjectContext:(id)a4 localCount:(unint64_t *)a5 unavailableCount:(unint64_t *)a6 error:(id *)a7
{
  return +[PLCloudResource _countOfLocalCloudResourcesOfType:a3 inManagedObjectContext:a4 forMediumSized:0 localCount:a5 unavailableCount:a6 error:a7];
}

+ (BOOL)countOfMediumOriginalLocalCloudResourcesInManagedObjectContext:(id)a3 localCount:(unint64_t *)a4 unavailableCount:(unint64_t *)a5 error:(id *)a6
{
  return +[PLCloudResource _countOfLocalCloudResourcesOfType:1 inManagedObjectContext:a3 forMediumSized:1 localCount:a4 unavailableCount:a5 error:a6];
}

+ (unint64_t)bytesForAllResourcesInLibrary:(id)a3
{
  id v5 = a3;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__PLCloudResource_bytesForAllResourcesInLibrary___block_invoke;
  v9[3] = &unk_1E5873C08;
  id v12 = a1;
  id v6 = v5;
  id v10 = v6;
  id v11 = &v14;
  SEL v13 = a2;
  [v6 performTransactionAndWait:v9];
  unint64_t v7 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v7;
}

void __49__PLCloudResource_bytesForAllResourcesInLibrary___block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  objc_super v2 = (void *)MEMORY[0x1E4F1C0D0];
  BOOL v3 = [*(id *)(a1 + 48) entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v5 setName:@"totalResourceSize"];
  id v6 = [MEMORY[0x1E4F28C68] expressionWithFormat:@"@sum.fileSize"];
  [v5 setExpression:v6];

  [v5 setExpressionResultType:300];
  v30[0] = v5;
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  [v4 setPropertiesToFetch:v7];

  [v4 setResultType:2];
  double v8 = [*(id *)(a1 + 32) managedObjectContext];
  id v24 = 0;
  uint64_t v9 = [v8 executeFetchRequest:v4 error:&v24];
  id v10 = v24;
  if (v9)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v18 = v10;
      uint64_t v19 = v8;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "objectForKeyedSubscript:", @"totalResourceSize", v18, v19, (void)v20);
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v16 longLongValue];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
      }
      while (v13);
      id v10 = v18;
      double v8 = v19;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v11 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      id v26 = v17;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "%@ failed to calculate totalResourceSize %@", buf, 0x16u);
    }
    goto LABEL_13;
  }
LABEL_14:
}

+ (void)resetPrefetchStateForResourcesWithResourceType:(int64_t)a3 itemIdentifiers:(id)a4 inLibrary:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__PLCloudResource_resetPrefetchStateForResourcesWithResourceType_itemIdentifiers_inLibrary___block_invoke;
  v12[3] = &unk_1E5873AA0;
  id v15 = a1;
  int64_t v16 = a3;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [v10 performTransactionAndWait:v12];
}

void __92__PLCloudResource_resetPrefetchStateForResourcesWithResourceType_itemIdentifiers_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  objc_super v2 = (void *)MEMORY[0x1E4F1C0D0];
  BOOL v3 = [*(id *)(a1 + 48) entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"itemIdentifier IN %@ AND type = %d", *(void *)(a1 + 32), *(void *)(a1 + 56)];
  [v4 setPredicate:v5];
  [v4 setFetchBatchSize:100];
  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  id v25 = 0;
  unint64_t v7 = [v6 executeFetchRequest:v4 error:&v25];
  id v8 = v25;
  if (v7)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v19 = v8;
      long long v20 = v6;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v15 = (void *)MEMORY[0x19F38D3B0]();
          [v14 setPrefetchCount:0];
          int64_t v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
          [v14 setLastPrefetchDate:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v11);
      id v6 = v20;
      id v8 = v19;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v9 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412802;
      uint64_t v28 = v17;
      __int16 v29 = 2048;
      uint64_t v30 = v18;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Error fetching Cloud Resources for %@/%ld: %@", buf, 0x20u);
    }
    goto LABEL_13;
  }
LABEL_14:
}

+ (id)nonLocalResourcesInManagedObjectContext:(id)a3 forAssetUUIDs:(id)a4 cplResourceTypes:(id)a5
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4F1C0D0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [a1 entityName];
  id v13 = [v8 fetchRequestWithEntityName:v12];

  id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"assetUuid in %@", v10];

  id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex(isLocallyAvailable) == NO"];
  int64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex(type) in %@", v9];

  uint64_t v17 = (void *)MEMORY[0x1E4F28BA0];
  v22[0] = v14;
  v22[1] = v15;
  v22[2] = v16;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  id v19 = [v17 andPredicateWithSubpredicates:v18];
  [v13 setPredicate:v19];

  long long v20 = [v11 executeFetchRequest:v13 error:0];

  return v20;
}

+ (id)duplicateCloudResource:(id)a3 forAsset:(id)a4 withFilePath:(id)a5 inManagedObjectContext:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v14)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PLCloudResource.m", 73, @"Invalid parameter not satisfying: %@", @"moc" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, a1, @"PLCloudResource.m", 74, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];

LABEL_3:
  id v15 = [a1 entityName];
  int64_t v16 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v15, (uint64_t)v14, 0);

  uint64_t v17 = [v12 uuid];
  [v16 _duplicatePropertiesFromCloudResource:v11 withFilePath:v13 forAssetUuid:v17];

  uint64_t v18 = [v12 master];
  id v19 = [v18 creationDate];
  [v16 setDateCreated:v19];

  return v16;
}

+ (id)insertIntoPhotoLibrary:(id)a3 forAsset:(id)a4 withCPLResource:(id)a5 adjusted:(BOOL)a6 withCreationDate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v13)
  {
    __int16 v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"PLCloudResource.m", 55, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
LABEL_13:
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"PLCloudResource.m", 56, @"Invalid parameter not satisfying: %@", @"cplResource" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v15) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v17 = [v13 managedObjectContext];
  uint64_t v18 = [a1 entityName];
  id v19 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v18, (uint64_t)v17, 0);

  [v19 applyPropertiesFromCloudResource:v15];
  long long v20 = [v14 uuid];
  [v19 setAssetUuid:v20];

  [v19 setDateCreated:v16];
  if (v14 && v19)
  {
    if (a6)
    {
      long long v21 = objc_msgSend(v14, "pathForCPLResourceType:adjusted:", objc_msgSend(v15, "resourceType"), 1);
    }
    else
    {
      uint64_t v22 = (int)[v19 type];
      long long v23 = [v19 uniformTypeIdentifier];
      long long v21 = [v14 localResourcePathForMasterResourceWithCPLType:v22 andUTI:v23];
    }
    [v19 setFilePath:v21];
    long long v24 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v25 = [v24 fileExistsAtPath:v21 isDirectory:0];

    [v19 setIsLocallyAvailable:v25];
  }

  return v19;
}

@end