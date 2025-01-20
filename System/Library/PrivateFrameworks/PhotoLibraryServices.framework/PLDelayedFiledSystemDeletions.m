@interface PLDelayedFiledSystemDeletions
+ (id)_filesystemDeletionQueue;
+ (id)deletionsFromChangeHubEvent:(id)a3;
+ (void)appendDescriptionForEvent:(id)a3 toComponents:(id)a4;
+ (void)waitForAllDelayedDeletionsToFinish;
- (PLDelayedFiledSystemDeletions)initWithFilesystemDeletionInfos:(id)a3;
- (id)debugDescription;
- (void)addFilesystemDeletionInfo:(id)a3;
- (void)appendToXPCMessage:(id)a3 managedObjectContext:(id)a4;
- (void)dealloc;
- (void)deleteAllRemainingFilesAndThumbnailsWithPhotoLibrary:(id)a3;
@end

@implementation PLDelayedFiledSystemDeletions

- (void).cxx_destruct
{
}

- (PLDelayedFiledSystemDeletions)initWithFilesystemDeletionInfos:(id)a3
{
  id v5 = a3;
  v6 = [(PLDelayedFiledSystemDeletions *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deletionInfos, a3);
  }

  return v7;
}

- (void)deleteAllRemainingFilesAndThumbnailsWithPhotoLibrary:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PLDelayedFiledSystemDeletions.m" lineNumber:356 description:@"deleteAllRemainingFilesAndThumbnails must only be called by assetsd"];
  }
  if ([(NSMutableArray *)self->_deletionInfos count])
  {
    v20 = [MEMORY[0x1E4F8BA48] transaction:"-[PLDelayedFiledSystemDeletions deleteAllRemainingFilesAndThumbnailsWithPhotoLibrary:]"];
    v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [(NSMutableArray *)self->_deletionInfos count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Processing %d asset file system deletions", buf, 8u);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v21 = self;
    v8 = self->_deletionInfos;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v14 = PLBackendGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = [v13 uuid];
            *(_DWORD *)buf = 138543362;
            v33 = v15;
            _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Deleting asset file resources and thumbs for %{public}@", buf, 0xCu);
          }
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v10);
    }

    if (!v5)
    {
      id v5 = +[PLPhotoLibrary systemPhotoLibrary];
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __86__PLDelayedFiledSystemDeletions_deleteAllRemainingFilesAndThumbnailsWithPhotoLibrary___block_invoke;
    v25[3] = &unk_1E5875E18;
    id v16 = v5;
    id v26 = v16;
    v27 = v21;
    [v16 performBlockAndWait:v25 completionHandler:0];
    v17 = +[PLDelayedFiledSystemDeletions _filesystemDeletionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__PLDelayedFiledSystemDeletions_deleteAllRemainingFilesAndThumbnailsWithPhotoLibrary___block_invoke_2;
    block[3] = &unk_1E5873A50;
    block[4] = v21;
    id v5 = v16;
    id v23 = v5;
    id v24 = v20;
    id v18 = v20;
    dispatch_sync(v17, block);
  }
}

void __86__PLDelayedFiledSystemDeletions_deleteAllRemainingFilesAndThumbnailsWithPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) thumbnailManager];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v13 = a1;
  id obj = *(id *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v9 = [v7 thumbnailIdentifier];
        uint64_t v10 = [v7 thumbnailIndex];
        if ((~v10 & 0x7FFFFFFFFFFFFFFFLL) != 0)
        {
          v12 = [v7 uuid];
          [v2 deleteThumbnailsWithIdentifier:v9 orIndex:v10 uuid:v12];

          uint64_t v11 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v10];
          +[PLThumbnailIndexes recycleThumbnailIndexes:inLibrary:timestamp:](PLThumbnailIndexes, "recycleThumbnailIndexes:inLibrary:timestamp:", v11, *(void *)(v13 + 32), [v7 timestamp]);
        }
        else
        {
          if (![v9 length]) {
            goto LABEL_11;
          }
          uint64_t v11 = [v7 uuid];
          [v2 deleteThumbnailsWithIdentifier:v9 orIndex:v10 uuid:v11];
        }

LABEL_11:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

void __86__PLDelayedFiledSystemDeletions_deleteAllRemainingFilesAndThumbnailsWithPhotoLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v37 = a1;
  id obj = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v40 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v52;
    uint64_t v43 = *MEMORY[0x1E4F28A50];
    uint64_t v42 = *MEMORY[0x1E4F28798];
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v52 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v3;
        uint64_t v4 = *(void **)(*((void *)&v51 + 1) + 8 * v3);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        objc_msgSend(v4, "fileURLs", v37);
        id v44 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v5 = [v44 countByEnumeratingWithState:&v47 objects:v59 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v48;
          do
          {
            uint64_t v8 = 0;
            do
            {
              if (*(void *)v48 != v7) {
                objc_enumerationMutation(v44);
              }
              uint64_t v9 = *(void **)(*((void *)&v47 + 1) + 8 * v8);
              id v46 = 0;
              char v10 = [v2 removeItemAtURL:v9 error:&v46];
              uint64_t v11 = (char *)v46;
              v12 = v11;
              if (v10)
              {
                uint64_t v13 = PLBackendGetLog();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
                {
                  v14 = [v9 path];
                  *(_DWORD *)buf = 138412290;
                  v56 = v14;
                  _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "Deleted %@", buf, 0xCu);
                }
LABEL_24:
                v27 = v12;
                goto LABEL_25;
              }
              long long v15 = [v11 userInfo];
              uint64_t v13 = [v15 objectForKey:v43];

              if ([v13 code] == 2)
              {
                long long v16 = [v13 domain];
                char v17 = [v16 isEqualToString:v42];

                if (v17) {
                  goto LABEL_24;
                }
              }
              long long v18 = PLBackendGetLog();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                v19 = [v9 path];
                *(_DWORD *)buf = 138412546;
                v56 = v19;
                __int16 v57 = 2112;
                v58 = v12;
                _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Unable to unlink \"%@\": %@", buf, 0x16u);
              }
              uint64_t v20 = (void *)MEMORY[0x1E4F8B908];
              v21 = [v9 path];
              LODWORD(v20) = [v20 stripImmutableFlagIfNecessaryFromFileAtPath:v21];

              if (!v20) {
                goto LABEL_24;
              }
              v22 = PLBackendGetLog();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                id v23 = [v9 path];
                id v24 = __error();
                v25 = strerror(*v24);
                *(_DWORD *)buf = 138412546;
                v56 = v23;
                __int16 v57 = 2082;
                v58 = v25;
                _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Retrying after clearing IMMUTABLE flag from %@ after failing to unlink file (%{public}s).", buf, 0x16u);
              }
              v45 = v12;
              char v26 = [v2 removeItemAtURL:v9 error:&v45];
              v27 = v45;

              long long v28 = PLBackendGetLog();
              long long v29 = v28;
              if (v26)
              {
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  long long v30 = [v9 path];
                  *(_DWORD *)buf = 138412290;
                  v56 = v30;
                  long long v31 = v29;
                  os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
                  v33 = "Successfully unlinked \"%@\" after clearing IMMUTABLE flag";
                  uint32_t v34 = 12;
LABEL_29:
                  _os_log_impl(&dword_19B3C7000, v31, v32, v33, buf, v34);
                }
              }
              else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                long long v30 = [v9 path];
                *(_DWORD *)buf = 138412546;
                v56 = v30;
                __int16 v57 = 2112;
                v58 = v27;
                long long v31 = v29;
                os_log_type_t v32 = OS_LOG_TYPE_ERROR;
                v33 = "Unable to unlink \"%@\": after clearing IMMUTABLE flag (%@)";
                uint32_t v34 = 22;
                goto LABEL_29;
              }

LABEL_25:
              ++v8;
            }
            while (v6 != v8);
            uint64_t v35 = [v44 countByEnumeratingWithState:&v47 objects:v59 count:16];
            uint64_t v6 = v35;
          }
          while (v35);
        }

        uint64_t v3 = v41 + 1;
      }
      while (v41 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v40);
  }

  v36 = [*(id *)(v37 + 40) libraryBundle];
  [v36 touch];

  [*(id *)(v37 + 48) stillAlive];
}

- (void)appendToXPCMessage:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  xpc_object_t xdict = v6;
  if (!v6)
  {
    v69 = [MEMORY[0x1E4F28B00] currentHandler];
    [v69 handleFailureInMethod:a2, self, @"PLDelayedFiledSystemDeletions.m", 209, @"Invalid parameter not satisfying: %@", @"message != NULL" object file lineNumber description];
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v78 = self;
  uint64_t v9 = self->_deletionInfos;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v109 objects:v119 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v110;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v110 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        long long v15 = [v14 directory];
        long long v16 = [v14 filename];
        if ([v15 length] && objc_msgSend(v16, "length"))
        {
          char v17 = [v8 objectForKey:v15];
          if (!v17)
          {
            char v17 = [MEMORY[0x1E4F1CA80] set];
            [v8 setObject:v17 forKey:v15];
          }
          [v17 addObject:v16];
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v109 objects:v119 count:16];
    }
    while (v11);
  }

  long long v18 = [MEMORY[0x1E4F1CA48] array];
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __73__PLDelayedFiledSystemDeletions_appendToXPCMessage_managedObjectContext___block_invoke;
  v106[3] = &unk_1E586B4A0;
  id v75 = v7;
  id v107 = v75;
  id v19 = v18;
  id v108 = v19;
  [v8 enumerateKeysAndObjectsUsingBlock:v106];
  v77 = v19;
  v76 = v8;
  if ([v19 count])
  {
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v19, "count"));
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v21 = v19;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v102 objects:v118 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v103;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v103 != v24) {
            objc_enumerationMutation(v21);
          }
          char v26 = *(void **)(*((void *)&v102 + 1) + 8 * j);
          v27 = [v26 directory];
          long long v28 = [v26 filename];
          if ([v27 length] && objc_msgSend(v28, "length"))
          {
            long long v29 = [v27 stringByAppendingPathComponent:v28];
            [v20 addObject:v29];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v102 objects:v118 count:16];
      }
      while (v23);
    }

    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v30 = v78->_deletionInfos;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v98 objects:v117 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v99;
      v88 = v30;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v99 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void **)(*((void *)&v98 + 1) + 8 * k);
          v36 = [v35 directory];
          uint64_t v37 = [v35 filename];
          if ([v36 length] && objc_msgSend(v37, "length"))
          {
            v38 = [v36 stringByAppendingPathComponent:v37];
            if ([v20 containsObject:v38])
            {
              uint64_t v39 = v20;
              uint64_t v40 = PLBackendGetLog();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                uint64_t v41 = [v35 fileURLs];
                *(_DWORD *)buf = 138412290;
                v115 = v41;
                _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_ERROR, "Denying attempt to delete file paths %@ since we found duplicates", buf, 0xCu);

                long long v30 = v88;
              }

              [v35 setFileURLs:0];
              [v35 setThumbnailIdentifier:0];
              uint64_t v20 = v39;
            }
          }
        }
        uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v98 objects:v117 count:16];
      }
      while (v32);
    }
  }
  xpc_object_t v42 = xpc_array_create(0, 0);
  xpc_dictionary_set_value(xdict, "fsDeletionURIs", v42);
  xpc_object_t xarray = xpc_array_create(0, 0);
  xpc_dictionary_set_value(xdict, "fsDeletionPaths", xarray);
  xpc_object_t v85 = xpc_array_create(0, 0);
  xpc_dictionary_set_value(xdict, "thumbnailIdentifiers", v85);
  xpc_object_t v84 = xpc_array_create(0, 0);
  xpc_dictionary_set_value(xdict, "thumbnailIndexes", v84);
  xpc_object_t v43 = xpc_array_create(0, 0);
  xpc_dictionary_set_value(xdict, "thumbnailUUIDs", v43);
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id obj = v78->_deletionInfos;
  uint64_t v87 = [(NSMutableArray *)obj countByEnumeratingWithState:&v94 objects:v116 count:16];
  if (v87)
  {
    uint64_t v80 = 0;
    uint64_t v82 = *(void *)v95;
    xpc_object_t v83 = v43;
    do
    {
      for (uint64_t m = 0; m != v87; ++m)
      {
        if (*(void *)v95 != v82) {
          objc_enumerationMutation(obj);
        }
        v45 = *(void **)(*((void *)&v94 + 1) + 8 * m);
        uint64_t v89 = MEMORY[0x19F38D3B0]();
        CFURLRef v46 = [v45 objectIDURI];
        size_t v47 = CFURLGetBytes(v46, buf, 1024);
        if (!v47)
        {
          v64 = [MEMORY[0x1E4F28B00] currentHandler];
          [v64 handleFailureInMethod:a2 object:v78 file:@"PLDelayedFiledSystemDeletions.m" lineNumber:296 description:@"Unable to encode object URI."];
        }
        xpc_object_t v48 = v42;
        xpc_array_set_data(v42, 0xFFFFFFFFFFFFFFFFLL, buf, v47);
        long long v49 = [v45 fileURLs];
        xpc_object_t v50 = xpc_array_create(0, 0);
        xpc_array_set_value(xarray, 0xFFFFFFFFFFFFFFFFLL, v50);
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        id v51 = v49;
        uint64_t v52 = [v51 countByEnumeratingWithState:&v90 objects:v113 count:16];
        if (v52)
        {
          uint64_t v53 = v52;
          uint64_t v54 = *(void *)v91;
          do
          {
            for (uint64_t n = 0; n != v53; ++n)
            {
              if (*(void *)v91 != v54) {
                objc_enumerationMutation(v51);
              }
              id v56 = [*(id *)(*((void *)&v90 + 1) + 8 * n) path];
              xpc_array_set_string(v50, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v56 fileSystemRepresentation]);
            }
            uint64_t v53 = [v51 countByEnumeratingWithState:&v90 objects:v113 count:16];
          }
          while (v53);
        }

        xpc_array_set_uint64(v84, 0xFFFFFFFFFFFFFFFFLL, [v45 thumbnailIndex]);
        id v57 = [v45 thumbnailIdentifier];
        uint64_t v58 = [v57 UTF8String];

        if (v58) {
          v59 = (const char *)v58;
        }
        else {
          v59 = "";
        }
        xpc_array_set_string(v85, 0xFFFFFFFFFFFFFFFFLL, v59);
        id v60 = [v45 uuid];
        uint64_t v61 = [v60 UTF8String];

        if (v61) {
          v62 = (const char *)v61;
        }
        else {
          v62 = "";
        }
        xpc_object_t v43 = v83;
        xpc_array_set_string(v83, 0xFFFFFFFFFFFFFFFFLL, v62);
        if ([v45 thumbnailIndex] == -1)
        {
          xpc_object_t v42 = v48;
          v63 = (void *)v89;
        }
        else
        {
          v63 = (void *)v89;
          if ([v45 thumbnailIndex] == 0x7FFFFFFFFFFFFFFFLL)
          {
            xpc_object_t v42 = v48;
          }
          else
          {
            xpc_object_t v42 = v48;
            if ([v45 timestamp] > v80) {
              uint64_t v80 = [v45 timestamp];
            }
          }
        }
      }
      uint64_t v87 = [(NSMutableArray *)obj countByEnumeratingWithState:&v94 objects:v116 count:16];
    }
    while (v87);
  }
  else
  {
    uint64_t v80 = 0;
  }

  xpc_dictionary_set_uint64(xdict, "deletionTimestamp", v80);
  size_t count = xpc_array_get_count(v42);
  if (count != xpc_array_get_count(xarray))
  {
    v70 = [MEMORY[0x1E4F28B00] currentHandler];
    [v70 handleFailureInMethod:a2 object:v78 file:@"PLDelayedFiledSystemDeletions.m" lineNumber:331 description:@"len(assetURIs) != len(fileURLsList) ?"];
  }
  size_t v66 = xpc_array_get_count(v42);
  if (v66 != xpc_array_get_count(v84))
  {
    v71 = [MEMORY[0x1E4F28B00] currentHandler];
    [v71 handleFailureInMethod:a2 object:v78 file:@"PLDelayedFiledSystemDeletions.m" lineNumber:333 description:@"len(assetURIs) != len(thumbnailIndexes) ?"];
  }
  size_t v67 = xpc_array_get_count(v42);
  if (v67 != xpc_array_get_count(v85))
  {
    v72 = [MEMORY[0x1E4F28B00] currentHandler];
    [v72 handleFailureInMethod:a2 object:v78 file:@"PLDelayedFiledSystemDeletions.m" lineNumber:335 description:@"len(assetURIs) != len(thumbnailIdentifiers) ?"];
  }
  size_t v68 = xpc_array_get_count(v42);
  if (v68 != xpc_array_get_count(v43))
  {
    v73 = [MEMORY[0x1E4F28B00] currentHandler];
    [v73 handleFailureInMethod:a2 object:v78 file:@"PLDelayedFiledSystemDeletions.m" lineNumber:337 description:@"len(assetURIs) != len(thumbnailUUIDs) ?"];
  }
}

void __73__PLDelayedFiledSystemDeletions_appendToXPCMessage_managedObjectContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = +[PLManagedAsset entityName];
  id v11 = [v5 fetchRequestWithEntityName:v8];

  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"directory = %@ AND filename IN %@", v7, v6];

  [v11 setPredicate:v9];
  uint64_t v10 = [*(id *)(a1 + 32) executeFetchRequest:v11 error:0];
  if ([v10 count]) {
    [*(id *)(a1 + 40) addObjectsFromArray:v10];
  }
}

- (void)addFilesystemDeletionInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  id v8 = v4;
  if (self->_deletionInfos)
  {
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  deletionInfos = self->_deletionInfos;
  self->_deletionInfos = v6;

  uint64_t v5 = v8;
  if (v8)
  {
LABEL_3:
    [(NSMutableArray *)self->_deletionInfos addObject:v8];
    uint64_t v5 = v8;
  }
LABEL_4:
}

- (void)dealloc
{
  deletionInfos = self->_deletionInfos;
  self->_deletionInfos = 0;

  v4.receiver = self;
  v4.super_class = (Class)PLDelayedFiledSystemDeletions;
  [(PLDelayedFiledSystemDeletions *)&v4 dealloc];
}

- (id)debugDescription
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"<%p %@> {", self, objc_opt_class()];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = self->_deletionInfos;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v9 = [v8 objectIDURI];
        uint64_t v10 = [v8 fileURLs];
        id v11 = [v10 componentsJoinedByString:@", "];
        uint64_t v12 = [v8 thumbnailIndex];
        uint64_t v13 = [v8 thumbnailIdentifier];
        v14 = [v8 uuid];
        [v3 appendFormat:@"\n%@: { %@ }, [%lu, %@]: %@", v9, v11, v12, v13, v14];
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  [v3 appendString:@"\n}"];
  return v3;
}

+ (id)deletionsFromChangeHubEvent:(id)a3
{
  id v5 = a3;
  uint64_t v6 = xpc_dictionary_get_value(v5, "fsDeletionURIs");
  id v7 = xpc_dictionary_get_value(v5, "fsDeletionPaths");
  id v8 = xpc_dictionary_get_value(v5, "thumbnailIndexes");
  uint64_t v9 = xpc_dictionary_get_value(v5, "thumbnailIdentifiers");
  uint64_t v10 = xpc_dictionary_get_value(v5, "thumbnailUUIDs");
  uint64_t uint64 = xpc_dictionary_get_uint64(v5, "deletionTimestamp");
  if (v6)
  {
    uint64_t v12 = uint64;
    if (!v7)
    {
      char v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2 object:a1 file:@"PLDelayedFiledSystemDeletions.m" lineNumber:474 description:@"fileURLsList is out of sync?"];
    }
    size_t count = xpc_array_get_count(v6);
    if (count != xpc_array_get_count(v7))
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2 object:a1 file:@"PLDelayedFiledSystemDeletions.m" lineNumber:476 description:@"len(xpcAssetURIs) != len(xpcFileURLsList) ?"];
    }
    size_t v14 = xpc_array_get_count(v6);
    if (v14 != xpc_array_get_count(v8))
    {
      long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2 object:a1 file:@"PLDelayedFiledSystemDeletions.m" lineNumber:478 description:@"len(xpcAssetURIs) != len(xpcThumbnailIndexes) ?"];
    }
    size_t v15 = xpc_array_get_count(v6);
    if (v15 != xpc_array_get_count(v8))
    {
      long long v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2 object:a1 file:@"PLDelayedFiledSystemDeletions.m" lineNumber:480 description:@"len(xpcAssetURIs) != len(xpcThumbnailIndexes) ?"];
    }
    size_t v16 = xpc_array_get_count(v6);
    if (v16 != xpc_array_get_count(v9))
    {
      long long v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:a2 object:a1 file:@"PLDelayedFiledSystemDeletions.m" lineNumber:482 description:@"len(xpcAssetURIs) != len(xpcThumbnailIdentifiers) ?"];
    }
    size_t v17 = xpc_array_get_count(v6);
    if (v17 != xpc_array_get_count(v10))
    {
      uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2 object:a1 file:@"PLDelayedFiledSystemDeletions.m" lineNumber:484 description:@"len(xpcAssetURIs) != len(xpcThumbnailUUIDs) ?"];
    }
    long long v18 = (void *)MEMORY[0x19F38D3B0]();
    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    SEL v20 = a2;
    id v21 = (void *)v19;
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    uint32_t v34 = __61__PLDelayedFiledSystemDeletions_deletionsFromChangeHubEvent___block_invoke;
    uint64_t v35 = &unk_1E586B4F0;
    SEL v41 = v20;
    id v42 = a1;
    id v36 = v7;
    id v37 = v8;
    id v38 = v9;
    uint64_t v43 = v12;
    id v39 = v10;
    id v40 = v21;
    id v22 = v21;
    xpc_array_apply(v6, &v32);
    id v23 = objc_alloc((Class)a1);
    uint64_t v24 = objc_msgSend(v23, "initWithFilesystemDeletionInfos:", v22, v32, v33, v34, v35);
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

uint64_t __61__PLDelayedFiledSystemDeletions_deletionsFromChangeHubEvent___block_invoke(uint64_t a1, size_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x19F38D3B0]();
  bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(v5);
  size_t length = xpc_data_get_length(v5);
  CFURLRef v9 = CFURLCreateWithBytes(0, bytes_ptr, length, 0x8000100u, 0);
  if (!v9)
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 80) file:@"PLDelayedFiledSystemDeletions.m" lineNumber:492 description:@"Invalid asset URI."];
  }
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = xpc_array_get_value(*(xpc_object_t *)(a1 + 32), a2);
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __61__PLDelayedFiledSystemDeletions_deletionsFromChangeHubEvent___block_invoke_2;
  applier[3] = &unk_1E586B930;
  id v12 = v10;
  id v20 = v12;
  xpc_array_apply(v11, applier);
  uint64_t uint64 = xpc_array_get_uint64(*(xpc_object_t *)(a1 + 40), a2);
  size_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_array_get_string(*(xpc_object_t *)(a1 + 48), a2));
  size_t v15 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_array_get_string(*(xpc_object_t *)(a1 + 56), a2));
  size_t v16 = [[PLFilesystemDeletionInfo alloc] initWithObjectIDURI:v9 directory:0 filename:0 fileURLs:v12 thumbnailIndex:uint64 thumbnailIdentifier:v14 uuid:v15 timestamp:*(void *)(a1 + 88)];
  if (v16) {
    [*(id *)(a1 + 64) addObject:v16];
  }
  CFRelease(v9);

  return 1;
}

uint64_t __61__PLDelayedFiledSystemDeletions_deletionsFromChangeHubEvent___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  string_ptr = xpc_string_get_string_ptr(v4);
  size_t length = xpc_string_get_length(v4);

  CFURLRef v7 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)string_ptr, length, 0);
  [*(id *)(a1 + 32) addObject:v7];
  CFRelease(v7);
  return 1;
}

+ (void)appendDescriptionForEvent:(id)a3 toComponents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  CFURLRef v9 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v10 = xpc_dictionary_get_value(v7, "fsDeletionURIs");
  id v11 = xpc_dictionary_get_value(v7, "fsDeletionPaths");
  if (v10)
  {
    size_t count = xpc_array_get_count(v10);
    if (count != xpc_array_get_count(v11))
    {
      uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
      id v20 = [NSString stringWithUTF8String:"+[PLDelayedFiledSystemDeletions appendDescriptionForEvent:toComponents:]"];
      [v19 handleFailureInFunction:v20 file:@"PLDelayedFiledSystemDeletions.m" lineNumber:430 description:@"len(xpcAssetURIs) != len(xpcFileURLsList) ?"];
    }
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    uint64_t applier = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __72__PLDelayedFiledSystemDeletions_appendDescriptionForEvent_toComponents___block_invoke;
    uint64_t v24 = &unk_1E586B4C8;
    SEL v27 = a2;
    id v28 = a1;
    id v25 = v11;
    id v26 = v13;
    id v14 = v13;
    xpc_array_apply(v10, &applier);
    size_t v15 = NSString;
    size_t v16 = xpc_array_get_count(v10);
    size_t v17 = [v14 componentsJoinedByString:@", "];
    long long v18 = [v15 stringWithFormat:@"%zu delayed deletes: {%@}", v16, v17, applier, v22, v23, v24];
    [v8 addObject:v18];
  }
}

uint64_t __72__PLDelayedFiledSystemDeletions_appendDescriptionForEvent_toComponents___block_invoke(uint64_t a1, size_t a2, void *a3)
{
  id v5 = a3;
  bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(v5);
  size_t length = xpc_data_get_length(v5);

  CFURLRef v8 = CFURLCreateWithBytes(0, bytes_ptr, length, 0x8000100u, 0);
  if (!v8)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 56) file:@"PLDelayedFiledSystemDeletions.m" lineNumber:435 description:@"Invalid asset URI."];
  }
  CFURLRef v9 = [(__CFURL *)v8 pathComponents];
  if ((unint64_t)[v9 count] >= 3)
  {
    uint64_t v10 = objc_msgSend(v9, "subarrayWithRange:", objc_msgSend(v9, "count") - 2, 2);

    CFURLRef v9 = (void *)v10;
  }
  id v11 = [NSString pathWithComponents:v9];
  CFRelease(v8);
  id v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v13 = xpc_array_get_value(*(xpc_object_t *)(a1 + 32), a2);
  uint64_t applier = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __72__PLDelayedFiledSystemDeletions_appendDescriptionForEvent_toComponents___block_invoke_2;
  uint64_t v24 = &unk_1E586B930;
  id v25 = v12;
  id v14 = v12;
  xpc_array_apply(v13, &applier);

  size_t v15 = *(void **)(a1 + 40);
  size_t v16 = NSString;
  size_t v17 = [v14 componentsJoinedByString:@", "];
  long long v18 = [v16 stringWithFormat:@"%@ (%zu): [%@]", v11, a2, v17, applier, v22, v23, v24];
  [v15 addObject:v18];

  return 1;
}

uint64_t __72__PLDelayedFiledSystemDeletions_appendDescriptionForEvent_toComponents___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F1C9B8];
  id v5 = a3;
  string_ptr = xpc_string_get_string_ptr(v5);
  size_t length = xpc_string_get_length(v5);

  CFURLRef v8 = [v4 dataWithBytes:string_ptr length:length];
  CFURLRef v9 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
  [*(id *)(a1 + 32) addObject:v9];

  return 1;
}

+ (void)waitForAllDelayedDeletionsToFinish
{
  v2 = [a1 _filesystemDeletionQueue];
  dispatch_sync(v2, &__block_literal_global_148);
}

+ (id)_filesystemDeletionQueue
{
  pl_dispatch_once();
  v2 = (void *)_filesystemDeletionQueue_filesystemDeletionQueue;
  return v2;
}

void __57__PLDelayedFiledSystemDeletions__filesystemDeletionQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("PLDelayedFileSystemDeletions", v2);
  v1 = (void *)_filesystemDeletionQueue_filesystemDeletionQueue;
  _filesystemDeletionQueue_filesystemDeletionQueue = (uint64_t)v0;
}

@end