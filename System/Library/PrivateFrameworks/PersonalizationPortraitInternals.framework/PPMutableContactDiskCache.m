@interface PPMutableContactDiskCache
- (BOOL)_writeCache:(id)a3 path:(id)a4 error:(id *)a5;
- (BOOL)addNameRecords:(id)a3 error:(id *)a4;
- (BOOL)deleteCacheIfTooOld;
- (BOOL)deleteNameRecordCache;
- (BOOL)updateNameRecordCacheWithHistoryRecords:(id)a3 error:(id *)a4;
- (id)_createNewCacheObjectWithCreatedAt:(int64_t)a3;
- (id)_recordSetBucketsForNameRecords:(id)a3;
- (int64_t)lastCreatedAt;
- (void)setLastCreatedAt:(int64_t)a3;
@end

@implementation PPMutableContactDiskCache

- (id)_recordSetBucketsForNameRecords:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__PPMutableContactDiskCache__recordSetBucketsForNameRecords___block_invoke;
  v7[3] = &unk_1E65D5EE8;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __61__PPMutableContactDiskCache__recordSetBucketsForNameRecords___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 sourceIdentifier];
  id v5 = [v4 substringToIndex:1];

  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

  if (!v6)
  {
    v7 = [PPContactDiskCacheHistoryRecordSet alloc];
    id v8 = v5;
    if (v7)
    {
      v19.receiver = v7;
      v19.super_class = (Class)PPContactDiskCacheHistoryRecordSet;
      v9 = (PPContactDiskCacheHistoryRecordSet *)objc_msgSendSuper2(&v19, sel_init);
      v7 = v9;
      if (v9)
      {
        objc_storeStrong((id *)&v9->_filename, v5);
        uint64_t v10 = objc_opt_new();
        adds = v7->_adds;
        v7->_adds = (NSMutableArray *)v10;

        uint64_t v12 = objc_opt_new();
        updates = v7->_updates;
        v7->_updates = (NSMutableArray *)v12;

        uint64_t v14 = objc_opt_new();
        deletes = v7->_deletes;
        v7->_deletes = (NSMutableArray *)v14;
      }
    }

    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
  switch([v3 changeType])
  {
    case 0u:
      v16 = pp_default_log_handle();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        goto LABEL_14;
      }
      v17 = [v3 sourceIdentifier];
      LODWORD(v19.receiver) = 138412290;
      *(id *)((char *)&v19.receiver + 4) = v17;
      _os_log_fault_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_FAULT, "PPContactNameRecordChangeTypeNone found when trying to update disk cache for identifier %@", (uint8_t *)&v19, 0xCu);
      goto LABEL_13;
    case 1u:
      v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
      v18 = [v16 adds];
      goto LABEL_12;
    case 2u:
      v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
      v18 = [v16 updates];
      goto LABEL_12;
    case 3u:
      v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
      v18 = [v16 deletes];
LABEL_12:
      v17 = v18;
      [v18 addObject:v3];
LABEL_13:

LABEL_14:
      break;
    default:
      break;
  }
}

- (BOOL)deleteCacheIfTooOld
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-1209600.0];
  int64_t lastCreatedAt = self->super._lastCreatedAt;
  [v3 timeIntervalSinceReferenceDate];
  if (lastCreatedAt >= (uint64_t)v5) {
    goto LABEL_6;
  }
  v6 = pp_contacts_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "PPContactDiskCache: deleting cache since it is too old.", v9, 2u);
  }

  if ([(PPMutableContactDiskCache *)self deleteNameRecordCache])
  {
    self->super._int64_t lastCreatedAt = 0;
    BOOL v7 = 1;
  }
  else
  {
LABEL_6:
    BOOL v7 = 0;
  }

  return v7;
}

- (void)setLastCreatedAt:(int64_t)a3
{
  self->super._int64_t lastCreatedAt = a3;
}

- (int64_t)lastCreatedAt
{
  return self->super._lastCreatedAt;
}

- (id)_createNewCacheObjectWithCreatedAt:(int64_t)a3
{
  v4 = objc_opt_new();
  [v4 setCreatedAt:a3];
  double v5 = objc_opt_new();
  [v4 setRecords:v5];

  return v4;
}

- (BOOL)_writeCache:(id)a3 path:(id)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [a3 data];
  id v13 = 0;
  char v9 = [v8 writeToFile:v7 options:1073741825 error:&v13];
  id v10 = v13;

  if ((v9 & 1) == 0)
  {
    v11 = pp_contacts_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_error_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_ERROR, "failed to write name record cache at: %@ error: %@", buf, 0x16u);
    }

    if (a5) {
      *a5 = v10;
    }
  }

  return v9;
}

- (BOOL)deleteNameRecordCache
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F28000uLL;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:self->super._path];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v7 = [v6 enumeratorAtPath:self->super._path];

    if (v7)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v32;
        v29 = v8;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v32 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            uint64_t v14 = objc_msgSend(v13, "pathExtension", v29);
            int v15 = [v14 isEqualToString:@"pb"];

            if (v15)
            {
              __int16 v16 = (void *)MEMORY[0x1CB79D060]();
              id v17 = self;
              uint64_t v18 = [(NSString *)self->super._path stringByAppendingPathComponent:v13];
              unint64_t v19 = v3;
              uint64_t v20 = [*(id *)(v3 + 3256) defaultManager];
              id v30 = 0;
              char v21 = [v20 removeItemAtPath:v18 error:&v30];
              id v22 = v30;

              if ((v21 & 1) == 0)
              {
                v26 = pp_contacts_log_handle();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v36 = v18;
                  __int16 v37 = 2112;
                  id v38 = v22;
                  _os_log_error_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_ERROR, "failed to delete name record cache file at: %@ error: %@", buf, 0x16u);
                }

                id v8 = v29;
                goto LABEL_24;
              }

              unint64_t v3 = v19;
              self = v17;
              id v8 = v29;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      v23 = pp_contacts_log_handle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_DEFAULT, "contact name record cache deleted.", buf, 2u);
      }

      BOOL v24 = 1;
    }
    else
    {
      v25 = pp_contacts_log_handle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        path = self->super._path;
        *(_DWORD *)buf = 138412290;
        v36 = path;
        _os_log_error_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_ERROR, "PPContactDiskCache: failed to create enumerator for %@", buf, 0xCu);
      }

      id v8 = 0;
LABEL_24:
      BOOL v24 = 0;
    }
  }
  else
  {
    id v8 = pp_contacts_log_handle();
    BOOL v24 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_INFO, "went to delete name record cache but file was missing", buf, 2u);
    }
  }

  return v24;
}

- (BOOL)addNameRecords:(id)a3 error:(id *)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  -[PPMutableContactDiskCache _recordSetBucketsForNameRecords:](self, "_recordSetBucketsForNameRecords:");
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v47 = [obj countByEnumeratingWithState:&v60 objects:v73 count:16];
  if (v47)
  {
    SEL v41 = a2;
    v43 = a4;
    uint64_t v46 = *(void *)v61;
    char v44 = 1;
    v45 = self;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v61 != v46) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v60 + 1) + 8 * v7);
        uint64_t v9 = (void *)MEMORY[0x1CB79D060]();
        uint64_t v10 = [v8 stringByAppendingPathExtension:@"pb"];
        if ([v10 length] != 4)
        {
          id v38 = [MEMORY[0x1E4F28B00] currentHandler];
          [v38 handleFailureInMethod:v41, self, @"PPContactDiskCache.m", 266, @"Unexpected filename: %@", v10 object file lineNumber description];
        }
        uint64_t v11 = (void *)MEMORY[0x1CB79D060]();
        uint64_t v12 = [(NSString *)self->super._path stringByAppendingPathComponent:v10];
        id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v14 = [v13 fileExistsAtPath:v12];

        if (v14)
        {
          id v59 = 0;
          int v15 = [(PPContactDiskCache *)self _cacheObjectFromFilePath:v12 error:&v59];
          id v16 = v59;
          id v17 = v16;
          if (!v15)
          {
            v39 = pp_contacts_log_handle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v65 = v12;
              __int16 v66 = 2112;
              v67 = v17;
              _os_log_error_impl(&dword_1CA9A8000, v39, OS_LOG_TYPE_ERROR, "failed to load cache object at %@: %@", buf, 0x16u);
            }

            if (v43) {
              id *v43 = v17;
            }

            char v44 = 0;
            goto LABEL_37;
          }
          v52 = v16;
        }
        else
        {
          uint64_t v18 = objc_opt_new();
          [v18 timeIntervalSinceReferenceDate];
          int v15 = [(PPMutableContactDiskCache *)self _createNewCacheObjectWithCreatedAt:(uint64_t)v19];

          v52 = 0;
        }
        int64_t lastCreatedAt = self->super._lastCreatedAt;
        uint64_t v21 = [v15 createdAt];
        uint64_t v50 = v7;
        v51 = v10;
        v53 = v12;
        if (lastCreatedAt && v21 >= self->super._lastCreatedAt) {
          uint64_t v21 = self->super._lastCreatedAt;
        }
        self->super._int64_t lastCreatedAt = v21;
        id v22 = [obj objectForKeyedSubscript:v8];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        v49 = v22;
        v23 = [v22 adds];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v55 objects:v72 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v56;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v56 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = *(void **)(*((void *)&v55 + 1) + 8 * i);
              v29 = pp_contacts_log_handle();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                long long v32 = [v28 sourceIdentifier];
                long long v33 = [v28 firstName];
                long long v34 = [v28 lastName];
                *(_DWORD *)buf = 138740739;
                v65 = v32;
                __int16 v66 = 2117;
                v67 = v33;
                __int16 v68 = 2117;
                v69 = v34;
                __int16 v70 = 2112;
                v71 = v53;
                _os_log_debug_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_DEBUG, "addNameRecord: %{sensitive}@ %{sensitive}@ %{sensitive}@ path: %@", buf, 0x2Au);
              }
              id v30 = [v15 records];
              long long v31 = [v28 pbRecord];
              [v30 addObject:v31];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v55 objects:v72 count:16];
          }
          while (v25);
        }

        id v54 = 0;
        self = v45;
        BOOL v35 = [(PPMutableContactDiskCache *)v45 _writeCache:v15 path:v53 error:&v54];
        id v36 = v54;
        __int16 v37 = v36;
        if (!v35)
        {
          if (v43) {
            id *v43 = v36;
          }
          [(PPMutableContactDiskCache *)v45 deleteNameRecordCache];
          char v44 = 0;
        }

        uint64_t v7 = v50 + 1;
      }
      while (v50 + 1 != v47);
      uint64_t v47 = [obj countByEnumeratingWithState:&v60 objects:v73 count:16];
      if (v47) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v44 = 1;
  }
LABEL_37:

  return v44 & 1;
}

- (BOOL)updateNameRecordCacheWithHistoryRecords:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v18 = 0;
  double v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__5731;
  id v16 = __Block_byref_object_dispose__5732;
  id v17 = 0;
  id v8 = [(PPMutableContactDiskCache *)self _recordSetBucketsForNameRecords:v7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__PPMutableContactDiskCache_updateNameRecordCacheWithHistoryRecords_error___block_invoke;
  v11[3] = &unk_1E65D5EC0;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = &v18;
  v11[7] = a2;
  [v8 enumerateKeysAndObjectsUsingBlock:v11];
  if (*((unsigned char *)v19 + 24))
  {
    BOOL v9 = 1;
  }
  else
  {
    if (a4) {
      *a4 = (id) v13[5];
    }
    [(PPMutableContactDiskCache *)self deleteNameRecordCache];
    BOOL v9 = *((unsigned char *)v19 + 24) != 0;
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v9;
}

void __75__PPMutableContactDiskCache_updateNameRecordCacheWithHistoryRecords_error___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1CB79D060]();
  v81 = v5;
  id v8 = [v5 stringByAppendingPathExtension:@"pb"];
  if ([v8 length] != 4)
  {
    v79 = [MEMORY[0x1E4F28B00] currentHandler];
    [v79 handleFailureInMethod:a1[7], a1[4], @"PPContactDiskCache.m", 203, @"Unexpected filename: %@", v8 object file lineNumber description];
  }
  BOOL v9 = (void *)MEMORY[0x1CB79D060]();
  v80 = v8;
  uint64_t v10 = [*(id *)(a1[4] + 16) stringByAppendingPathComponent:v8];
  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v12 = [v11 fileExistsAtPath:v10];

  v82 = a1;
  v83 = v6;
  v85 = v10;
  if (v12)
  {
    uint64_t v13 = *(void *)(a1[5] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;

    int v15 = (void *)a1[4];
    uint64_t v16 = *(void *)(a1[5] + 8);
    id obj = *(id *)(v16 + 40);
    id v17 = [v15 _cacheObjectFromFilePath:v10 error:&obj];
    objc_storeStrong((id *)(v16 + 40), obj);
    if (!v17) {
      goto LABEL_45;
    }
    id v18 = objc_alloc(MEMORY[0x1E4F1CA80]);
    double v19 = [v6 updates];
    uint64_t v20 = [v19 count];
    char v21 = [v6 deletes];
    id v22 = objc_msgSend(v18, "initWithCapacity:", objc_msgSend(v21, "count") + v20);

    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    v23 = [v6 updates];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v101 objects:v117 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v102;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v102 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v101 + 1) + 8 * i) sourceIdentifier];
          [v22 addObject:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v101 objects:v117 count:16];
      }
      while (v25);
    }

    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    v29 = [v6 deletes];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v97 objects:v116 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v98;
      v84 = v29;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v98 != v32) {
            objc_enumerationMutation(v29);
          }
          long long v34 = *(void **)(*((void *)&v97 + 1) + 8 * v33);
          BOOL v35 = pp_contacts_log_handle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            __int16 v37 = [v34 sourceIdentifier];
            id v38 = [v34 firstName];
            v39 = [v34 lastName];
            *(_DWORD *)buf = 138740739;
            v109 = v37;
            __int16 v110 = 2117;
            v111 = v38;
            __int16 v112 = 2117;
            v113 = v39;
            __int16 v114 = 2112;
            v115 = v85;
            _os_log_debug_impl(&dword_1CA9A8000, v35, OS_LOG_TYPE_DEBUG, "updateNameRecordCacheWithHistoryRecords: delete: %{sensitive}@ %{sensitive}@ %{sensitive}@ path: %@", buf, 0x2Au);

            v29 = v84;
          }

          id v36 = [v34 sourceIdentifier];
          [v22 addObject:v36];

          ++v33;
        }
        while (v31 != v33);
        uint64_t v31 = [v29 countByEnumeratingWithState:&v97 objects:v116 count:16];
      }
      while (v31);
    }

    uint64_t v40 = [v17 records];
    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __75__PPMutableContactDiskCache_updateNameRecordCacheWithHistoryRecords_error___block_invoke_66;
    v95[3] = &unk_1E65D5E98;
    id v96 = v22;
    id v41 = v22;
    id v42 = objc_msgSend(v40, "_pas_filteredArrayWithTest:", v95);
    v43 = (void *)[v42 mutableCopy];
    [v17 setRecords:v43];

    a1 = v82;
    id v6 = v83;
  }
  else
  {
    char v44 = (void *)a1[4];
    v45 = objc_opt_new();
    [v45 timeIntervalSinceReferenceDate];
    id v17 = [v44 _createNewCacheObjectWithCreatedAt:(uint64_t)v46];
  }
  uint64_t v47 = *(void *)(a1[4] + 8);
  uint64_t v48 = [v17 createdAt];
  uint64_t v49 = a1[4];
  if (v47 && v48 >= *(void *)(v49 + 8)) {
    uint64_t v48 = *(void *)(v49 + 8);
  }
  *(void *)(v49 + 8) = v48;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v50 = [v6 adds];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v91 objects:v107 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v92;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v92 != v53) {
          objc_enumerationMutation(v50);
        }
        long long v55 = *(void **)(*((void *)&v91 + 1) + 8 * v54);
        long long v56 = pp_contacts_log_handle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          id v59 = [v55 sourceIdentifier];
          long long v60 = [v55 firstName];
          long long v61 = [v55 lastName];
          *(_DWORD *)buf = 138740739;
          v109 = v59;
          __int16 v110 = 2117;
          v111 = v60;
          __int16 v112 = 2117;
          v113 = v61;
          __int16 v114 = 2112;
          v115 = v85;
          _os_log_debug_impl(&dword_1CA9A8000, v56, OS_LOG_TYPE_DEBUG, "updateNameRecordCacheWithHistoryRecords: add: %{sensitive}@ %{sensitive}@ %{sensitive}@ path: %@", buf, 0x2Au);
        }
        long long v57 = [v17 records];
        long long v58 = [v55 pbRecord];
        [v57 addObject:v58];

        ++v54;
      }
      while (v52 != v54);
      uint64_t v52 = [v50 countByEnumeratingWithState:&v91 objects:v107 count:16];
    }
    while (v52);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v62 = [v83 updates];
  uint64_t v63 = [v62 countByEnumeratingWithState:&v87 objects:v106 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v88;
    do
    {
      uint64_t v66 = 0;
      do
      {
        if (*(void *)v88 != v65) {
          objc_enumerationMutation(v62);
        }
        v67 = *(void **)(*((void *)&v87 + 1) + 8 * v66);
        __int16 v68 = pp_contacts_log_handle();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          v71 = [v67 sourceIdentifier];
          v72 = [v67 firstName];
          v73 = [v67 lastName];
          *(_DWORD *)buf = 138740739;
          v109 = v71;
          __int16 v110 = 2117;
          v111 = v72;
          __int16 v112 = 2117;
          v113 = v73;
          __int16 v114 = 2112;
          v115 = v85;
          _os_log_debug_impl(&dword_1CA9A8000, v68, OS_LOG_TYPE_DEBUG, "updateNameRecordCacheWithHistoryRecords: update: %{sensitive}@ %{sensitive}@ %{sensitive}@ path: %@", buf, 0x2Au);
        }
        v69 = [v17 records];
        __int16 v70 = [v67 pbRecord];
        [v69 addObject:v70];

        ++v66;
      }
      while (v64 != v66);
      uint64_t v64 = [v62 countByEnumeratingWithState:&v87 objects:v106 count:16];
    }
    while (v64);
  }

  uint64_t v74 = *(void *)(v82[5] + 8);
  v75 = *(void **)(v74 + 40);
  *(void *)(v74 + 40) = 0;

  v76 = (void *)v82[4];
  uint64_t v77 = *(void *)(v82[5] + 8);
  id v86 = *(id *)(v77 + 40);
  uint64_t v10 = v85;
  char v78 = [v76 _writeCache:v17 path:v85 error:&v86];
  objc_storeStrong((id *)(v77 + 40), v86);
  *(unsigned char *)(*(void *)(v82[6] + 8) + 24) = v78;

  id v6 = v83;
LABEL_45:
}

uint64_t __75__PPMutableContactDiskCache_updateNameRecordCacheWithHistoryRecords_error___block_invoke_66(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = [a2 sourceIdentifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

@end