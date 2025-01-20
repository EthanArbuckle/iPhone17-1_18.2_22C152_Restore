@interface NSURL(PBFAdditions)
+ (id)pbf_URLsMatchingFileName:()PBFAdditions beneathURL:error:;
+ (id)pbf_archivedDataStoreBaseURL;
+ (id)pbf_dataStoreExtensionContainerURLForBaseURL:()PBFAdditions version:;
+ (id)pbf_dataStoreSQLiteDatabaseURLForBaseURL:()PBFAdditions version:;
+ (id)pbf_dataStoreSQLiteDatabaseURLForDataStoreURL:()PBFAdditions;
+ (id)pbf_dataStoreURLForBaseURL:()PBFAdditions version:;
+ (id)pbf_galleryCacheURLForBaseURL:()PBFAdditions version:;
+ (id)pbf_snapshotURLForPath:()PBFAdditions definition:configuredProperties:context:;
+ (id)pbf_switcherConfigurationOrderingURLForBaseURL:()PBFAdditions version:;
+ (id)pbf_switcherConfigurationOrderingURLForDataStoreURL:()PBFAdditions;
+ (id)pbf_switcherSelectedConfigurationURLForBaseURL:()PBFAdditions version:;
+ (id)pbf_switcherSelectedConfigurationURLForDataStoreURL:()PBFAdditions;
+ (uint64_t)pbf_dataStoreExtensionContainerURLForVersionDataStoreURL:()PBFAdditions;
+ (uint64_t)pbf_dataStoreVersionContainingURLForBaseURL:()PBFAdditions;
- (BOOL)pbf_URLIsReachableAndConformToResourceValues:()PBFAdditions error:;
- (BOOL)pbf_URLIsReachableAndConformsToAttributeValues:()PBFAdditions error:;
- (BOOL)pbf_isConfigurationSnapshotURL;
- (BOOL)pbf_isGallerySnapshotURL;
- (id)pbf_displayContextForPosterSnapshotURL;
- (id)pbf_snapshotDefinitionForPosterSnapshotURL;
- (uint64_t)pbf_URLConformsToExpectedResourceValues:()PBFAdditions error:;
- (uint64_t)pbf_isPosterSnapshot;
- (uint64_t)pbf_recursivelyUpdateFileAttributes:()PBFAdditions error:;
- (uint64_t)pbf_recursivelyUpdateResourceValues:()PBFAdditions error:;
- (uint64_t)pbf_recursivelyValidateContentsAreReachableAndConformToAttributeValues:()PBFAdditions URLsNotConformingToAttributes:error:;
- (uint64_t)pbf_recursivelyValidateContentsAreReachableAndConformToResourceValues:()PBFAdditions URLsNotConformingToAttributes:error:;
- (uint64_t)pbf_updateFileAttributes:()PBFAdditions error:;
@end

@implementation NSURL(PBFAdditions)

- (BOOL)pbf_isGallerySnapshotURL
{
  v2 = +[PBFPosterSnapshotDefinition defaultPreviewDefinitions];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__NSURL_PBFAdditions__pbf_isGallerySnapshotURL__block_invoke;
  v6[3] = &unk_1E6982B08;
  v6[4] = a1;
  v3 = objc_msgSend(v2, "bs_firstObjectPassingTest:", v6);
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)pbf_isConfigurationSnapshotURL
{
  v2 = +[PBFPosterSnapshotDefinition defaultConfigurationDefinitions];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__NSURL_PBFAdditions__pbf_isConfigurationSnapshotURL__block_invoke;
  v6[3] = &unk_1E6982B08;
  v6[4] = a1;
  v3 = objc_msgSend(v2, "bs_firstObjectPassingTest:", v6);
  BOOL v4 = v3 != 0;

  return v4;
}

- (uint64_t)pbf_isPosterSnapshot
{
  v2 = [a1 lastPathComponent];
  int v3 = [v2 hasPrefix:@"RuntimeSnapshot"];
  if (([v2 hasPrefix:@"SNAPSHOT"] & 1) != 0 || v3)
  {
    v5 = [v2 pathExtension];
    v6 = [MEMORY[0x1E4F927E0] defaultFormat];
    v7 = [v6 filenameExtension];
    uint64_t v8 = [v5 caseInsensitiveCompare:v7];

    if (v8)
    {
      uint64_t v4 = 0;
    }
    else if ((v3 & 1) != 0 {
           || (objc_msgSend(a1, "pbf_snapshotDefinitionForPosterSnapshotURL"),
    }
               uint64_t v4 = objc_claimAutoreleasedReturnValue(),
               (id)v4,
               v4))
    {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)pbf_snapshotDefinitionForPosterSnapshotURL
{
  v1 = [a1 lastPathComponent];
  v2 = [v1 componentsSeparatedByString:@"-"];
  int v3 = [v2 firstObject];

  uint64_t v4 = PBFSnapshotDefinitionForIdentifier(v3);

  return v4;
}

- (id)pbf_displayContextForPosterSnapshotURL
{
  if ((objc_msgSend(a1, "pbf_isGallerySnapshotURL") & 1) != 0
    || objc_msgSend(a1, "pbf_isConfigurationSnapshotURL"))
  {
    v2 = [a1 lastPathComponent];
    int v3 = [v2 stringByDeletingPathExtension];

    uint64_t v4 = [v3 componentsSeparatedByString:@"-"];
    v5 = [v4 objectAtIndex:1];
    v6 = [v5 substringFromIndex:2];

    v7 = objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);

    if ((unint64_t)[v7 length] < 2)
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = +[PBFGenericDisplayContext displayContextForPersistenceIdentifier:v7];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

+ (id)pbf_snapshotURLForPath:()PBFAdditions definition:configuredProperties:context:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, a1, @"NSURL_PBFAdditions.m", 83, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];

    if (v12)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
LABEL_12:
      v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:a2, a1, @"NSURL_PBFAdditions.m", 85, @"Invalid parameter not satisfying: %@", @"displayContext" object file lineNumber description];

      if (v13) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, a1, @"NSURL_PBFAdditions.m", 84, @"Invalid parameter not satisfying: %@", @"definition" object file lineNumber description];

  if (!v14) {
    goto LABEL_12;
  }
LABEL_4:
  if (v13) {
    goto LABEL_5;
  }
LABEL_13:
  v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, a1, @"NSURL_PBFAdditions.m", 86, @"Invalid parameter not satisfying: %@", @"configuredProperties" object file lineNumber description];

LABEL_5:
  v15 = [v11 instanceURL];
  v36 = v11;
  if ([v12 shouldBePersistedOnlyTemporarily])
  {
    v16 = [v11 identityPathComponent];
    v17 = (void *)MEMORY[0x1E4F1CB10];
    v18 = PFTemporaryDirectory();
    v19 = [v17 fileURLWithPath:v18 isDirectory:1];

    v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16 isDirectory:1 relativeToURL:v19];
    uint64_t v21 = [v20 absoluteURL];

    v15 = (void *)v21;
  }
  v22 = [v12 uniqueIdentifier];
  v23 = objc_msgSend(v14, "pbf_displayContextPersistenceIdentifier");
  v24 = objc_msgSend(v13, "persistenceIdentifierWithComplications:", objc_msgSend(v12, "includesComplications"));
  v25 = [NSString stringWithFormat:@"%@-dC(%@)-cP(%@)", v22, v23, v24];
  [MEMORY[0x1E4F927E0] defaultFormat];
  v26 = v35 = v13;
  v27 = [v26 filenameExtension];

  v28 = [v15 URLByAppendingPathComponent:v25];
  v29 = [v28 URLByAppendingPathExtension:v27];

  return v29;
}

- (BOOL)pbf_URLIsReachableAndConformsToAttributeValues:()PBFAdditions error:
{
  id v6 = a3;
  if ([a1 checkResourceIsReachableAndReturnError:a4])
  {
    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v8 = [a1 path];
    id v20 = 0;
    v9 = [v7 attributesOfItemAtPath:v8 error:&v20];
    id v10 = v20;

    if (v10)
    {
      BOOL v11 = 0;
      if (a4) {
        *a4 = v10;
      }
    }
    else
    {
      uint64_t v16 = 0;
      v17 = &v16;
      uint64_t v18 = 0x2020000000;
      char v19 = 0;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __76__NSURL_PBFAdditions__pbf_URLIsReachableAndConformsToAttributeValues_error___block_invoke;
      v13[3] = &unk_1E6982D78;
      id v14 = v9;
      v15 = &v16;
      [v6 enumerateKeysAndObjectsUsingBlock:v13];
      BOOL v11 = *((unsigned char *)v17 + 24) == 0;

      _Block_object_dispose(&v16, 8);
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (uint64_t)pbf_URLConformsToExpectedResourceValues:()PBFAdditions error:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v7 = [v6 allKeys];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v20 = a4;
      uint64_t v10 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          id v13 = [v6 objectForKeyedSubscript:v12];
          id v21 = 0;
          id v22 = 0;
          int v14 = [a1 getResourceValue:&v22 forKey:v12 error:&v21];
          id v15 = v22;
          id v16 = v21;
          v17 = v16;
          if (v14)
          {
            if (([v13 isEqual:v15] & 1) == 0) {
              goto LABEL_17;
            }
          }
          else if (v16)
          {
            if (v20) {
              void *v20 = v16;
            }
LABEL_17:

            uint64_t v18 = 0;
            goto LABEL_18;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    uint64_t v18 = 1;
LABEL_18:
  }
  else
  {
    uint64_t v18 = 1;
  }

  return v18;
}

- (uint64_t)pbf_recursivelyValidateContentsAreReachableAndConformToAttributeValues:()PBFAdditions URLsNotConformingToAttributes:error:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__5;
  v46 = __Block_byref_object_dispose__5;
  if (a4)
  {
    id v47 = (id)objc_opt_new();
    *a4 = (id) v43[5];
    char v10 = 1;
  }
  else
  {
    char v10 = 0;
    id v47 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __130__NSURL_PBFAdditions__pbf_recursivelyValidateContentsAreReachableAndConformToAttributeValues_URLsNotConformingToAttributes_error___block_invoke;
  aBlock[3] = &unk_1E6982DA0;
  char v41 = v10;
  aBlock[4] = &v42;
  BOOL v11 = (void (**)(void *, void))_Block_copy(aBlock);
  if (([a1 checkResourceIsReachableAndReturnError:a5] & 1) != 0
    && (objc_msgSend(a1, "pbf_URLIsReachableAndConformsToAttributeValues:error:", v8, a5) & 1) != 0)
  {
    id v39 = 0;
    uint64_t v12 = *MEMORY[0x1E4F1C628];
    char v13 = [a1 getResourceValue:&v39 forKey:*MEMORY[0x1E4F1C628] error:a5];
    id v14 = v39;
    id v15 = v14;
    if (v13)
    {
      if ([v14 BOOLValue])
      {
        uint64_t v33 = 0;
        v34 = &v33;
        uint64_t v35 = 0x3032000000;
        v36 = __Block_byref_object_copy__5;
        v37 = __Block_byref_object_dispose__5;
        id v38 = 0;
        v27 = [MEMORY[0x1E4F1CA80] setWithObject:v12];
        id v16 = [v8 allKeys];
        [v27 addObjectsFromArray:v16];

        v17 = [v27 allObjects];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __130__NSURL_PBFAdditions__pbf_recursivelyValidateContentsAreReachableAndConformToAttributeValues_URLsNotConformingToAttributes_error___block_invoke_2;
        v32[3] = &unk_1E69824E0;
        v32[4] = &v33;
        uint64_t v18 = [v9 enumeratorAtURL:a1 includingPropertiesForKeys:v17 options:0 errorHandler:v32];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v48 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v29;
          while (2)
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v29 != v21) {
                objc_enumerationMutation(v19);
              }
              uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              long long v24 = (void *)v34[5];
              if (v24)
              {
                if (a5) {
                  *a5 = v24;
                }
LABEL_24:
                v11[2](v11, v23);
                uint64_t v25 = 0;
                goto LABEL_25;
              }
              if (!objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "pbf_URLIsReachableAndConformsToAttributeValues:error:", v8, a5))goto LABEL_24; {
            }
              }
            uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v48 count:16];
            uint64_t v25 = 1;
            if (v20) {
              continue;
            }
            break;
          }
        }
        else
        {
          uint64_t v25 = 1;
        }
LABEL_25:

        _Block_object_dispose(&v33, 8);
      }
      else
      {
        uint64_t v25 = 1;
      }
    }
    else
    {
      ((void (**)(void *, void *))v11)[2](v11, a1);
      uint64_t v25 = 0;
    }
  }
  else
  {
    ((void (**)(void *, void *))v11)[2](v11, a1);
    uint64_t v25 = 0;
  }

  _Block_object_dispose(&v42, 8);
  return v25;
}

- (uint64_t)pbf_recursivelyUpdateFileAttributes:()PBFAdditions error:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__5;
  v21[4] = __Block_byref_object_dispose__5;
  id v22 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65__NSURL_PBFAdditions__pbf_recursivelyUpdateFileAttributes_error___block_invoke;
  v20[3] = &unk_1E69824E0;
  v20[4] = v21;
  [v7 enumeratorAtURL:a1 includingPropertiesForKeys:0 options:1 errorHandler:v20];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "path", (void)v16);
        char v13 = [v7 setAttributes:v6 ofItemAtPath:v12 error:a4];

        if ((v13 & 1) == 0)
        {
          uint64_t v14 = 0;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_11:

  _Block_object_dispose(v21, 8);
  return v14;
}

- (uint64_t)pbf_updateFileAttributes:()PBFAdditions error:
{
  id v6 = (void *)MEMORY[0x1E4F28CB8];
  id v7 = a3;
  id v8 = [v6 defaultManager];
  uint64_t v9 = [a1 path];
  uint64_t v10 = [v8 setAttributes:v7 ofItemAtPath:v9 error:a4];

  return v10;
}

- (BOOL)pbf_URLIsReachableAndConformToResourceValues:()PBFAdditions error:
{
  id v6 = a3;
  if ([a1 checkResourceIsReachableAndReturnError:a4])
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = __Block_byref_object_copy__5;
    long long v19 = __Block_byref_object_dispose__5;
    id v20 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__NSURL_PBFAdditions__pbf_URLIsReachableAndConformToResourceValues_error___block_invoke;
    v10[3] = &unk_1E6982DC8;
    v10[4] = a1;
    v10[5] = &v15;
    v10[6] = &v11;
    [v6 enumerateKeysAndObjectsUsingBlock:v10];
    BOOL v7 = *((unsigned char *)v12 + 24) == 0;
    if (*((unsigned char *)v12 + 24))
    {
      if (a4)
      {
        id v8 = (void *)v16[5];
        if (v8) {
          *a4 = v8;
        }
      }
    }
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (uint64_t)pbf_recursivelyValidateContentsAreReachableAndConformToResourceValues:()PBFAdditions URLsNotConformingToAttributes:error:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__5;
  v46 = __Block_byref_object_dispose__5;
  if (a4)
  {
    id v47 = (id)objc_opt_new();
    *a4 = (id) v43[5];
    char v10 = 1;
  }
  else
  {
    char v10 = 0;
    id v47 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __129__NSURL_PBFAdditions__pbf_recursivelyValidateContentsAreReachableAndConformToResourceValues_URLsNotConformingToAttributes_error___block_invoke;
  aBlock[3] = &unk_1E6982DA0;
  char v41 = v10;
  aBlock[4] = &v42;
  uint64_t v11 = (void (**)(void *, void))_Block_copy(aBlock);
  if (([a1 checkResourceIsReachableAndReturnError:a5] & 1) != 0
    && (objc_msgSend(a1, "pbf_URLIsReachableAndConformToResourceValues:error:", v8, a5) & 1) != 0)
  {
    id v39 = 0;
    uint64_t v12 = *MEMORY[0x1E4F1C628];
    char v13 = [a1 getResourceValue:&v39 forKey:*MEMORY[0x1E4F1C628] error:a5];
    id v14 = v39;
    uint64_t v15 = v14;
    if (v13)
    {
      if ([v14 BOOLValue])
      {
        uint64_t v33 = 0;
        v34 = &v33;
        uint64_t v35 = 0x3032000000;
        v36 = __Block_byref_object_copy__5;
        v37 = __Block_byref_object_dispose__5;
        id v38 = 0;
        v27 = [MEMORY[0x1E4F1CA80] setWithObject:v12];
        long long v16 = [v8 allKeys];
        [v27 addObjectsFromArray:v16];

        uint64_t v17 = [v27 allObjects];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __129__NSURL_PBFAdditions__pbf_recursivelyValidateContentsAreReachableAndConformToResourceValues_URLsNotConformingToAttributes_error___block_invoke_2;
        v32[3] = &unk_1E69824E0;
        v32[4] = &v33;
        long long v18 = [v9 enumeratorAtURL:a1 includingPropertiesForKeys:v17 options:0 errorHandler:v32];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v48 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v29;
          while (2)
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v29 != v21) {
                objc_enumerationMutation(v19);
              }
              uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v24 = (void *)v34[5];
              if (v24)
              {
                if (a5) {
                  *a5 = v24;
                }
LABEL_24:
                v11[2](v11, v23);
                uint64_t v25 = 0;
                goto LABEL_25;
              }
              if (!objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "pbf_URLIsReachableAndConformToResourceValues:error:", v8, a5))goto LABEL_24; {
            }
              }
            uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v48 count:16];
            uint64_t v25 = 1;
            if (v20) {
              continue;
            }
            break;
          }
        }
        else
        {
          uint64_t v25 = 1;
        }
LABEL_25:

        _Block_object_dispose(&v33, 8);
      }
      else
      {
        uint64_t v25 = 1;
      }
    }
    else
    {
      ((void (**)(void *, void *))v11)[2](v11, a1);
      uint64_t v25 = 0;
    }
  }
  else
  {
    ((void (**)(void *, void *))v11)[2](v11, a1);
    uint64_t v25 = 0;
  }

  _Block_object_dispose(&v42, 8);
  return v25;
}

- (uint64_t)pbf_recursivelyUpdateResourceValues:()PBFAdditions error:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__5;
  v24[4] = __Block_byref_object_dispose__5;
  id v25 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __65__NSURL_PBFAdditions__pbf_recursivelyUpdateResourceValues_error___block_invoke;
  v23[3] = &unk_1E69824E0;
  v23[4] = v24;
  [v7 enumeratorAtURL:a1 includingPropertiesForKeys:0 options:0 errorHandler:v23];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
        id v18 = 0;
        char v13 = [v12 setResourceValues:v6 error:&v18];
        id v14 = v18;
        uint64_t v15 = v14;
        if ((v13 & 1) == 0)
        {
          if (a4) {
            *a4 = v14;
          }

          uint64_t v16 = 0;
          goto LABEL_13;
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v16 = 1;
LABEL_13:

  _Block_object_dispose(v24, 8);
  return v16;
}

+ (id)pbf_dataStoreURLForBaseURL:()PBFAdditions version:
{
  if (a4 > 2)
  {
    id v10 = a3;
    BOOL v7 = objc_msgSend(a1, "pbf_dataStoreVersionContainingURLForBaseURL:", v10);

    id v6 = [NSNumber numberWithUnsignedInteger:a4];
    uint64_t v11 = [v6 stringValue];
    id v8 = [v7 URLByAppendingPathComponent:v11 isDirectory:1];
  }
  else
  {
    v5 = NSString;
    id v6 = a3;
    BOOL v7 = objc_msgSend(v5, "stringWithFormat:", @"PRDataStore_%lu", a4);
    id v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:1];
  }

  return v8;
}

+ (uint64_t)pbf_dataStoreVersionContainingURLForBaseURL:()PBFAdditions
{
  return [a3 URLByAppendingPathComponent:@"PRBPosterExtensionDataStore" isDirectory:1];
}

+ (id)pbf_dataStoreExtensionContainerURLForBaseURL:()PBFAdditions version:
{
  v2 = objc_msgSend(a1, "pbf_dataStoreURLForBaseURL:version:");
  int v3 = objc_msgSend(a1, "pbf_dataStoreExtensionContainerURLForVersionDataStoreURL:", v2);

  return v3;
}

+ (uint64_t)pbf_dataStoreExtensionContainerURLForVersionDataStoreURL:()PBFAdditions
{
  return [a3 URLByAppendingPathComponent:@"Extensions" isDirectory:1];
}

+ (id)pbf_galleryCacheURLForBaseURL:()PBFAdditions version:
{
  v1 = objc_msgSend(a1, "pbf_dataStoreURLForBaseURL:version:");
  v2 = [v1 URLByAppendingPathComponent:@"GalleryCache" isDirectory:1];

  return v2;
}

+ (id)pbf_archivedDataStoreBaseURL
{
  if (pbf_archivedDataStoreBaseURL_onceToken != -1) {
    dispatch_once(&pbf_archivedDataStoreBaseURL_onceToken, &__block_literal_global_14);
  }
  v0 = (void *)pbf_archivedDataStoreBaseURL_archivedDataStoreBaseURL;
  return v0;
}

+ (id)pbf_dataStoreSQLiteDatabaseURLForBaseURL:()PBFAdditions version:
{
  if (a4 >= 0x3C)
  {
    id v6 = objc_msgSend(a1, "pbf_dataStoreURLForBaseURL:version:");
    uint64_t v4 = objc_msgSend(a1, "pbf_dataStoreSQLiteDatabaseURLForDataStoreURL:", v6);
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

+ (id)pbf_dataStoreSQLiteDatabaseURLForDataStoreURL:()PBFAdditions
{
  int v3 = [a3 URLByAppendingPathComponent:@"PBFPosterExtensionDataStoreSQLiteDatabase"];
  uint64_t v4 = [v3 URLByAppendingPathExtension:@"sqlite3"];

  return v4;
}

+ (id)pbf_switcherConfigurationOrderingURLForBaseURL:()PBFAdditions version:
{
  v2 = objc_msgSend(a1, "pbf_dataStoreURLForBaseURL:version:");
  int v3 = objc_msgSend(a1, "pbf_switcherConfigurationOrderingURLForDataStoreURL:", v2);

  return v3;
}

+ (id)pbf_switcherConfigurationOrderingURLForDataStoreURL:()PBFAdditions
{
  int v3 = [a3 URLByAppendingPathComponent:@"SwitcherConfigurationOrdering" isDirectory:0];
  uint64_t v4 = [v3 URLByAppendingPathExtension:@"plist"];

  return v4;
}

+ (id)pbf_switcherSelectedConfigurationURLForBaseURL:()PBFAdditions version:
{
  v2 = objc_msgSend(a1, "pbf_dataStoreURLForBaseURL:version:");
  int v3 = objc_msgSend(a1, "pbf_switcherSelectedConfigurationURLForDataStoreURL:", v2);

  return v3;
}

+ (id)pbf_switcherSelectedConfigurationURLForDataStoreURL:()PBFAdditions
{
  int v3 = [a3 URLByAppendingPathComponent:@"SelectedConfigurationIdentifier" isDirectory:0];
  uint64_t v4 = [v3 URLByAppendingPathExtension:@"plist"];

  return v4;
}

+ (id)pbf_URLsMatchingFileName:()PBFAdditions beneathURL:error:
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v24 = objc_opt_new();
  BOOL v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v23 = v6;
  id v8 = [v6 URLByStandardizingPath];
  uint64_t v9 = *MEMORY[0x1E4F1C628];
  v31[0] = *MEMORY[0x1E4F1C628];
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  uint64_t v11 = [v7 enumeratorAtURL:v8 includingPropertiesForKeys:v10 options:16 errorHandler:0];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v25 = 0;
        [v17 getResourceValue:&v25 forKey:v9 error:0];
        id v18 = v25;
        if (([v18 BOOLValue] & 1) == 0)
        {
          long long v19 = [v17 lastPathComponent];
          int v20 = [v19 isEqualToString:v5];

          if (v20) {
            [v24 addObject:v17];
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  if ([v24 count])
  {
    long long v21 = [v24 array];
  }
  else
  {
    long long v21 = 0;
  }

  return v21;
}

@end