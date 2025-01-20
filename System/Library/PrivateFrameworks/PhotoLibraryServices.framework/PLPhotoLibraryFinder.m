@interface PLPhotoLibraryFinder
+ (id)_findPhotoLibraryIdentifiersInContainerRootURL:(id)a3 matchingUUID:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)_isApplicationDomainContainerURL:(id)a3;
- (PLPhotoLibraryFinder)initWithSearchCriteria:(id)a3;
- (PLPhotoLibrarySearchCriteria)searchCriteria;
- (id)_containerRootURLsForDomain:(int64_t)a3;
- (id)_findPhotoLibraryIdentifiersInDomain:(int64_t)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)_rootURLForPhotoLibraryDomain:(int64_t)a3;
- (id)findMatchingPhotoLibraryIdentifiersAndReturnError:(id *)a3;
- (id)findMatchingPhotoLibraryIdentifiersWithOptions:(unint64_t)a3 error:(id *)a4;
@end

@implementation PLPhotoLibraryFinder

- (void).cxx_destruct
{
}

- (PLPhotoLibrarySearchCriteria)searchCriteria
{
  return self->_searchCriteria;
}

- (id)findMatchingPhotoLibraryIdentifiersWithOptions:(unint64_t)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v7 = [(PLPhotoLibraryFinder *)self searchCriteria];
  uint64_t v8 = [v7 domain];

  if (v8)
  {
    v9 = [NSNumber numberWithInteger:v8];
    v30[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  }
  else
  {
    v10 = &unk_1EEBF1F40;
  }
  v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a4);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = 0;
    uint64_t v16 = *(void *)v26;
    while (2)
    {
      uint64_t v17 = 0;
      v18 = v15;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = [*(id *)(*((void *)&v25 + 1) + 8 * v17) integerValue];
        id v24 = v18;
        v20 = [(PLPhotoLibraryFinder *)self _findPhotoLibraryIdentifiersInDomain:v19 options:a3 error:&v24];
        id v15 = v24;

        if (!v20)
        {

          id v21 = v15;
          goto LABEL_14;
        }
        [v11 addObjectsFromArray:v20];

        ++v17;
        v18 = v15;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v15 = 0;
  }

  id v21 = v15;
  if (!v11)
  {
LABEL_14:
    if (v23)
    {
      id v21 = v21;
      v11 = 0;
      void *v23 = v21;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)findMatchingPhotoLibraryIdentifiersAndReturnError:(id *)a3
{
  return [(PLPhotoLibraryFinder *)self findMatchingPhotoLibraryIdentifiersWithOptions:0 error:a3];
}

- (id)_findPhotoLibraryIdentifiersInDomain:(int64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    v10 = [(PLPhotoLibraryFinder *)self _containerRootURLsForDomain:a3];
    v11 = [(PLPhotoLibraryFinder *)self searchCriteria];
    id v12 = [v11 uuid];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend((id)objc_opt_class(), "_findPhotoLibraryIdentifiersInContainerRootURL:matchingUUID:options:error:", *(void *)(*((void *)&v24 + 1) + 8 * i), v12, a4, a5, (void)v24);
          if (!v18)
          {

            v9 = 0;
            goto LABEL_12;
          }
          uint64_t v19 = (void *)v18;
          [v9 addObjectsFromArray:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F8C500];
    uint64_t v29 = *MEMORY[0x1E4F28228];
    v30[0] = @"Unsupported search criteria";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v22 = [v20 errorWithDomain:v21 code:46309 userInfo:v13];
    id v12 = v22;
    if (a5)
    {
      id v12 = v22;
      v9 = 0;
      *a5 = v12;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)_containerRootURLsForDomain:(int64_t)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [(PLPhotoLibraryFinder *)self _rootURLForPhotoLibraryDomain:a3];
  v7 = v6;
  if (a3 == 3)
  {
    v9 = [(PLPhotoLibraryFinder *)self searchCriteria];
    uint64_t v8 = [v9 containerIdentifier];

    if (v8)
    {
      v10 = [v7 URLByAppendingPathComponent:v8];
      [v5 addObject:v10];
    }
    else
    {
      v11 = [MEMORY[0x1E4F8B908] fileManager];
      uint64_t v12 = *MEMORY[0x1E4F1C628];
      v33[0] = *MEMORY[0x1E4F1C628];
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
      long long v25 = v11;
      long long v26 = v7;
      uint64_t v14 = [v11 enumeratorAtURL:v7 includingPropertiesForKeys:v13 options:1 errorHandler:&__block_literal_global_60044];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            id v27 = 0;
            int v21 = [v20 getResourceValue:&v27 forKey:v12 error:0];
            id v22 = v27;
            v23 = v22;
            if ((!v21 || [v22 BOOLValue])
              && [(PLPhotoLibraryFinder *)self _isApplicationDomainContainerURL:v20])
            {
              [v5 addObject:v20];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v17);
      }

      uint64_t v8 = 0;
      v7 = v26;
    }
  }
  else
  {
    if (a3 != 2) {
      goto LABEL_19;
    }
    uint64_t v8 = [v6 URLByAppendingPathComponent:@"com.apple.photos"];
    [v5 addObject:v8];
  }

LABEL_19:
  return v5;
}

uint64_t __52__PLPhotoLibraryFinder__containerRootURLsForDomain___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  char v6 = MEMORY[0x19F38BF40]();
  v7 = PLBackendGetLog();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v4];
      int v14 = 138412546;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v5;
      v10 = "[_containerRootURLsForDomain:] App-domain library container root doesn't exist %@: %@";
      v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v11, v12, v10, (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v4];
    int v14 = 138412546;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v5;
    v10 = "[_containerRootURLsForDomain:] Error enumerating library entry at path %@: %@";
    v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  return 1;
}

- (id)_rootURLForPhotoLibraryDomain:(int64_t)a3
{
  id v4 = [(PLPhotoLibraryFinder *)self searchCriteria];
  id v5 = [v4 internalTestOptions];

  if (v5
    && (uint64_t v6 = *MEMORY[0x1E4F8C4C0],
        [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8C4C0]],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:v6];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F8B980] rootURLForPhotoLibraryDomain:a3];
  }
  v9 = (void *)v8;

  return v9;
}

- (BOOL)_isApplicationDomainContainerURL:(id)a3
{
  v3 = [a3 lastPathComponent];
  char v4 = [v3 isEqualToString:@"com.apple.photos"] ^ 1;

  return v4;
}

- (PLPhotoLibraryFinder)initWithSearchCriteria:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoLibraryFinder;
  uint64_t v6 = [(PLPhotoLibraryFinder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_searchCriteria, a3);
  }

  return v7;
}

+ (id)_findPhotoLibraryIdentifiersInContainerRootURL:(id)a3 matchingUUID:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  char v34 = a5;
  v47[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v35 = a4;
  id v33 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [MEMORY[0x1E4F8B908] fileManager];
  uint64_t v9 = *MEMORY[0x1E4F1C628];
  v47[0] = *MEMORY[0x1E4F1C628];
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  long long v31 = v8;
  v32 = v7;
  v11 = [v8 enumeratorAtURL:v7 includingPropertiesForKeys:v10 options:1 errorHandler:&__block_literal_global_6];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v37 = 0;
        int v18 = [v17 getResourceValue:&v37 forKey:v9 error:0];
        id v19 = v37;
        v20 = v19;
        if (!v18 || [v19 BOOLValue])
        {
          int v21 = [v17 pathExtension];
          id v22 = [MEMORY[0x1E4F8B980] photosLibraryExtension];
          int v23 = [v21 isEqualToString:v22];

          if (v23)
          {
            id v36 = 0;
            long long v24 = +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:v17 createIfMissing:(v34 & 1) == 0 error:&v36];
            id v25 = v36;
            if (v24)
            {
              if (!v35
                || ([v24 uuid],
                    long long v26 = objc_claimAutoreleasedReturnValue(),
                    int v27 = [v35 isEqualToString:v26],
                    v26,
                    v27))
              {
                [v33 addObject:v24];
              }
            }
            else
            {
              long long v28 = PLBackendGetLog();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                long long v29 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v17];
                *(_DWORD *)buf = 138412546;
                v43 = v29;
                __int16 v44 = 2112;
                id v45 = v25;
                _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Photo library identifier missing from library URL %@: %@", buf, 0x16u);
              }
            }
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v14);
  }

  return v33;
}

uint64_t __98__PLPhotoLibraryFinder__findPhotoLibraryIdentifiersInContainerRootURL_matchingUUID_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  char v6 = MEMORY[0x19F38BF40]();
  id v7 = PLBackendGetLog();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v4];
      int v14 = 138412546;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v5;
      v10 = "[findPhotoLibraryIdentifiersInDomain:] App-domain library container root doesn't exist %@: %@";
      v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v11, v12, v10, (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v4];
    int v14 = 138412546;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v5;
    v10 = "[findPhotoLibraryIdentifiersInDomain:] Error enumerating library entry at path %@: %@";
    v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  return 1;
}

@end