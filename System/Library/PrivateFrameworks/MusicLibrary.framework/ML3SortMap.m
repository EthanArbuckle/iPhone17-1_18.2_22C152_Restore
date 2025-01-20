@interface ML3SortMap
- (BOOL)_insertSortedNameEntriesIntoSortMap:(id)a3;
- (BOOL)attemptInsertStringsIntoSortMap:(id)a3;
- (BOOL)commitFailedInsertedStrings:(id)a3;
- (BOOL)commitUpdates;
- (BOOL)insertStringsIntoSortMap:(id)a3 didReSortMap:(BOOL *)a4;
- (BOOL)loadExistingSortedEntries;
- (ML3SortMap)initWithConnection:(id)a3 library:(id)a4 preloadNames:(BOOL)a5;
- (id)_maxSortKeyForEntry:(id)a3 iPhoneSortKeyBuilder:(iPhoneSortKeyBuilder *)a4;
- (id)_minSortKeyForEntry:(id)a3 iPhoneSortKeyBuilder:(iPhoneSortKeyBuilder *)a4;
- (id)_sortKeyString:(id)a3;
- (id)_sortedNameEntriesToInsertForNames:(id)a3;
- (id)nameOrders;
- (int64_t)_maxNameOrderForSortMapEntry:(id)a3 iPhoneSortKeyBuilder:(iPhoneSortKeyBuilder *)a4;
- (int64_t)_minNameOrderForSortMapEntry:(id)a3 iPhoneSortKeyBuilder:(iPhoneSortKeyBuilder *)a4;
- (int64_t)_sortKeyDistance:(id)a3 sortKey2:(id)a4 offset:(unint64_t)a5;
@end

@implementation ML3SortMap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxSortKey, 0);
  objc_storeStrong((id *)&self->_minSortKey, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_nameOrders, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)nameOrders
{
  return self->_nameOrders;
}

- (BOOL)commitUpdates
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 1;
  v3 = [MEMORY[0x1E4F28E60] indexSet];
  v4 = v3;
  entries = self->_entries;
  if (self->_preloadNames)
  {
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __27__ML3SortMap_commitUpdates__block_invoke;
    v66[3] = &unk_1E5FB43B0;
    id v67 = v3;
    [(NSMutableArray *)entries enumerateObjectsUsingBlock:v66];
    v6 = &v67;
  }
  else
  {
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __27__ML3SortMap_commitUpdates__block_invoke_2;
    v64[3] = &unk_1E5FB7858;
    id v65 = v3;
    v7 = v64;
    v8 = v7;
    if (entries)
    {
      Class isa = entries[2].super.super.isa;
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v73 = __64__ML3SortMapFaultingEntryArray_enumerateDirtyObjectsUsingBlock___block_invoke;
      v74 = &unk_1E5FB4518;
      v75 = v7;
      [(objc_class *)isa enumerateKeysAndObjectsUsingBlock:&buf];
    }
    v6 = &v65;
  }

  if ([v4 count])
  {
    unint64_t v10 = [v4 count];
    if (v10 < 0x1F4) {
      goto LABEL_64;
    }
    v11 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v4 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "dropping sort_map indexes for %lu additions", (uint8_t *)&buf, 0xCu);
    }

    BOOL v13 = +[ML3MusicLibrary dropIndexesUsingConnection:self->_connection tableNames:"'sort_map'"];
    *((unsigned char *)v69 + 24) = v13;
    if (v13)
    {
LABEL_64:
      BOOL v14 = [(ML3DatabaseConnection *)self->_connection executeUpdate:@"CREATE TABLE IF NOT EXISTS sort_map_no_uniques (name TEXT, name_order INTEGER, name_section INTEGER, sort_key BLOB)"];
      *((unsigned char *)v69 + 24) = v14;
      if (v14)
      {
        BOOL v15 = [(ML3DatabaseConnection *)self->_connection executeUpdate:@"DELETE FROM sort_map_no_uniques;"];
        *((unsigned char *)v69 + 24) = v15;
        if (v15)
        {
          v16 = os_log_create("com.apple.amp.medialibrary", "SortMap");
          os_signpost_id_t v17 = os_signpost_id_generate(v16);

          v18 = os_log_create("com.apple.amp.medialibrary", "SortMap");
          v19 = v18;
          unint64_t v20 = v17 - 1;
          if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
          {
            LOWORD(buf) = 0;
            _os_signpost_emit_with_name_impl(&dword_1B022D000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "insert:nameOrder", (const char *)&unk_1B0561856, (uint8_t *)&buf, 2u);
          }

          connection = self->_connection;
          v61[0] = MEMORY[0x1E4F143A8];
          v61[1] = 3221225472;
          v61[2] = __27__ML3SortMap_commitUpdates__block_invoke_363;
          v61[3] = &unk_1E5FB4400;
          v61[4] = self;
          id v53 = v4;
          id v62 = v53;
          v63 = &v68;
          [(ML3DatabaseConnection *)connection performTransactionWithBlock:v61];
          v22 = os_log_create("com.apple.amp.medialibrary", "SortMap");
          v23 = v22;
          if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
          {
            LOWORD(buf) = 0;
            _os_signpost_emit_with_name_impl(&dword_1B022D000, v23, OS_SIGNPOST_INTERVAL_END, v17, "insert:nameOrder", (const char *)&unk_1B0561856, (uint8_t *)&buf, 2u);
          }

          if (!*((unsigned char *)v69 + 24))
          {
            BOOL v39 = 0;
LABEL_60:

            goto LABEL_61;
          }
          v24 = os_log_create("com.apple.amp.medialibrary", "SortMap");
          v25 = v24;
          if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
          {
            LOWORD(buf) = 0;
            _os_signpost_emit_with_name_impl(&dword_1B022D000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v17, "move", (const char *)&unk_1B0561856, (uint8_t *)&buf, 2u);
          }

          char v54 = __exceptionsEnabled;
          __exceptionsEnabled = 0;
          BOOL v26 = [(ML3DatabaseConnection *)self->_connection executeUpdate:@"INSERT INTO sort_map (name, name_order, name_section, sort_key) SELECT name, name_order, name_section, sort_key FROM sort_map_no_uniques"];
          *((unsigned char *)v69 + 24) = v26;
          if (v26)
          {
LABEL_40:
            __exceptionsEnabled = v54;
            if (![(ML3DatabaseConnection *)self->_connection executeUpdate:@"DELETE FROM sort_map_no_uniques;"])
            {
              v40 = os_log_create("com.apple.amp.medialibrary", "Default");
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                LOWORD(buf) = 0;
                _os_log_impl(&dword_1B022D000, v40, OS_LOG_TYPE_ERROR, "failed to delete sort_map_no_uniques", (uint8_t *)&buf, 2u);
              }
            }
            v41 = os_log_create("com.apple.amp.medialibrary", "SortMap");
            v42 = v41;
            if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
            {
              LOWORD(buf) = 0;
              _os_signpost_emit_with_name_impl(&dword_1B022D000, v42, OS_SIGNPOST_INTERVAL_END, v17, "move", (const char *)&unk_1B0561856, (uint8_t *)&buf, 2u);
            }
            BOOL v43 = v10 < 0x1F4;

            v44 = self->_entries;
            self->_entries = 0;

            int v45 = *((unsigned __int8 *)v69 + 24);
            if (*((unsigned char *)v69 + 24)) {
              char v46 = v43;
            }
            else {
              char v46 = 1;
            }
            if ((v46 & 1) == 0)
            {
              v47 = os_log_create("com.apple.amp.medialibrary", "SortMap");
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v48 = [v53 count];
                LODWORD(buf) = 134217984;
                *(void *)((char *)&buf + 4) = v48;
                _os_log_impl(&dword_1B022D000, v47, OS_LOG_TYPE_DEFAULT, "recreating sort_map indexes for %lu additions", (uint8_t *)&buf, 0xCu);
              }

              BOOL v49 = [(ML3DatabaseConnection *)self->_connection executeUpdate:@"CREATE INDEX IF NOT EXISTS SortMapSortKeys ON sort_map (sort_key ASC)"];
              *((unsigned char *)v69 + 24) = v49;
              if (v49
                && (BOOL v50 = [(ML3DatabaseConnection *)self->_connection executeUpdate:@"ANALYZE;"],
                    (*((unsigned char *)v69 + 24) = v50) != 0))
              {
                int v45 = 1;
              }
              else
              {
                v51 = os_log_create("com.apple.amp.medialibrary", "SortMap");
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                {
                  LOWORD(buf) = 0;
                  _os_log_impl(&dword_1B022D000, v51, OS_LOG_TYPE_ERROR, "failed to rebuild sort_map indexes", (uint8_t *)&buf, 2u);
                }

                int v45 = *((unsigned __int8 *)v69 + 24);
              }
            }
            BOOL v39 = v45 != 0;
            goto LABEL_60;
          }
          v27 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1B022D000, v27, OS_LOG_TYPE_ERROR, "Failed to merge into sort_map - attempting to repair and try again", (uint8_t *)&buf, 2u);
          }

          v28 = [MEMORY[0x1E4F1CA60] dictionary];
          v29 = [(ML3DatabaseConnection *)self->_connection executeQuery:@"SELECT ROWID, name, name_order, name_section, sort_key FROM sort_map_no_uniques WHERE name IN (SELECT name FROM sort_map_no_uniques GROUP BY name HAVING COUNT() > 1)"];
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __27__ML3SortMap_commitUpdates__block_invoke_378;
          v59[3] = &unk_1E5FB83F8;
          id v30 = v28;
          id v60 = v30;
          [v29 enumerateRowsWithBlock:v59];
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __27__ML3SortMap_commitUpdates__block_invoke_379;
          v58[3] = &unk_1E5FB4428;
          v58[4] = self;
          [v30 enumerateKeysAndObjectsUsingBlock:v58];
          v31 = [MEMORY[0x1E4F1CA48] array];
          v32 = [(ML3DatabaseConnection *)self->_connection executeQuery:@"SELECT sort_map_no_uniques.name, sort_map_no_uniques.name_order, sort_map_no_uniques.name_section, sort_map_no_uniques.sort_key, sort_map.name, sort_map.name_order, sort_map.name_section, sort_map.sort_key FROM sort_map_no_uniques JOIN sort_map USING (name) WHERE sort_map_no_uniques.name IN (SELECT name FROM sort_map)"];

          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __27__ML3SortMap_commitUpdates__block_invoke_2_387;
          v56[3] = &unk_1E5FB83F8;
          id v33 = v31;
          id v57 = v33;
          [v32 enumerateRowsWithBlock:v56];
          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __27__ML3SortMap_commitUpdates__block_invoke_388;
          v55[3] = &unk_1E5FB4450;
          v55[4] = self;
          [v33 enumerateObjectsUsingBlock:v55];
          BOOL v34 = [(ML3DatabaseConnection *)self->_connection executeUpdate:@"INSERT INTO sort_map (name, name_order, name_section, sort_key) SELECT name, name_order, name_section, sort_key FROM sort_map_no_uniques"];
          *((unsigned char *)v69 + 24) = v34;
          v35 = _ML3LogCategoryDefault();
          v36 = v35;
          if (v34)
          {
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf) = 0;
              _os_log_impl(&dword_1B022D000, v36, OS_LOG_TYPE_DEFAULT, "Successfully merged into sort_map after removing invalid entries - rebuilding to repair tables", (uint8_t *)&buf, 2u);
            }

            BOOL v37 = [(ML3MusicLibrary *)self->_library inTransactionUpdateSortMapOnConnection:self->_connection forceRebuild:1 forceUpdateOriginals:1];
            *((unsigned char *)v69 + 24) = v37;
            if (v37) {
              goto LABEL_39;
            }
            v36 = _ML3LogCategoryDefault();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf) = 0;
              v38 = "Failed to rebuild the sort map after merge - failing commit!";
LABEL_37:
              _os_log_impl(&dword_1B022D000, v36, OS_LOG_TYPE_ERROR, v38, (uint8_t *)&buf, 2u);
            }
          }
          else if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            v38 = "Failed to merge into sort_map after removing invalid entries - failing commit";
            goto LABEL_37;
          }

LABEL_39:
          goto LABEL_40;
        }
      }
    }
    BOOL v39 = 0;
  }
  else
  {
    BOOL v39 = 1;
  }
LABEL_61:

  _Block_object_dispose(&v68, 8);
  return v39;
}

uint64_t __27__ML3SortMap_commitUpdates__block_invoke(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 36)) {
    return objc_msgSend(*(id *)(result + 32), "addIndex:");
  }
  return result;
}

uint64_t __27__ML3SortMap_commitUpdates__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:");
}

BOOL __27__ML3SortMap_commitUpdates__block_invoke_363(void *a1)
{
  v2 = (void *)MEMORY[0x1B3E93C70]();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(id *)(a1[4] + 8);
    v4 = [[ML3StatementAccumulator alloc] initWithConnection:*(void *)(a1[4] + 8)];
    v5 = [v3 currentTransactionID];
    [(ML3StatementAccumulator *)v4 setExistingTransactionIdentifier:v5];

    [(ML3StatementAccumulator *)v4 setPriorityLevel:0];
    [(ML3StatementAccumulator *)v4 setStatementThreshold:200];
  }
  else
  {
    v4 = 0;
  }
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  BOOL v14 = __27__ML3SortMap_commitUpdates__block_invoke_2_369;
  BOOL v15 = &unk_1E5FB43D8;
  v6 = (void *)a1[5];
  uint64_t v16 = a1[4];
  v7 = v4;
  os_signpost_id_t v17 = v7;
  v18 = @"INSERT INTO sort_map_no_uniques (name, name_order, name_section, sort_key) VALUES (?, ?, ?, ?)";
  uint64_t v19 = a1[6];
  [v6 enumerateIndexesUsingBlock:&v12];
  int v8 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = -[ML3StatementAccumulator flushAndWait:](v7, "flushAndWait:", 1, v12, v13, v14, v15, v16);
    int v8 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
  }
  BOOL v10 = v8 != 0;

  return v10;
}

void __27__ML3SortMap_commitUpdates__block_invoke_378(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 int64ForColumnIndex:0];
  v5 = [v3 stringForColumnIndex:1];
  uint64_t v6 = [v3 int64ForColumnIndex:2];
  int v7 = [v3 intForColumnIndex:3];
  int v8 = [v3 dataForColumnIndex:4];

  BOOL v9 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    int v12 = 138544130;
    uint64_t v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 1024;
    int v17 = v7;
    __int16 v18 = 2114;
    uint64_t v19 = v8;
    _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_FAULT, "Found duplicate sort_map_no_uniques entry with common name. name='%{public}@', name_order=%lld, name_section=%d, sort_key=%{public}@", (uint8_t *)&v12, 0x26u);
  }

  BOOL v10 = *(void **)(a1 + 32);
  v11 = [NSNumber numberWithLongLong:v4];
  [v10 setObject:v11 forKey:v5];
}

void __27__ML3SortMap_commitUpdates__block_invoke_379(uint64_t a1, void *a2, void *a3)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v9[0] = a2;
  v9[1] = a3;
  v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  id v7 = a2;
  int v8 = [v5 arrayWithObjects:v9 count:2];
  [v4 executeUpdate:@"DELETE FROM sort_map_no_uniques WHERE name = ? AND ROWID != ?" withParameters:v8 error:0];
}

void __27__ML3SortMap_commitUpdates__block_invoke_2_387(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 stringForColumnIndex:0];
  uint64_t v5 = [v3 int64ForColumnIndex:1];
  int v6 = [v3 intForColumnIndex:2];
  id v7 = [v3 dataForColumnIndex:3];
  int v8 = [v3 stringForColumnIndex:4];
  uint64_t v9 = [v3 int64ForColumnIndex:5];
  int v10 = [v3 intForColumnIndex:6];
  v11 = [v3 dataForColumnIndex:7];

  int v12 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    int v13 = 138545154;
    __int16 v14 = v4;
    __int16 v15 = 2048;
    uint64_t v16 = v5;
    __int16 v17 = 1024;
    int v18 = v6;
    __int16 v19 = 2114;
    uint64_t v20 = v7;
    __int16 v21 = 2114;
    v22 = v8;
    __int16 v23 = 2048;
    uint64_t v24 = v9;
    __int16 v25 = 1024;
    int v26 = v10;
    __int16 v27 = 2114;
    v28 = v11;
    _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_FAULT, "Found matching entries in both sort_map_no_uniques and sort_map. NEW: name='%{public}@', name_order=%lld, name_section=%d, sort_key=%{public}@. EXISTING: name='%{public}@', name_order=%lld, name_section=%d, sort_key=%{public}@", (uint8_t *)&v13, 0x4Au);
  }

  [*(id *)(a1 + 32) addObject:v4];
}

void __27__ML3SortMap_commitUpdates__block_invoke_388(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  int v6 = a2;
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  uint64_t v5 = [v3 arrayWithObjects:&v6 count:1];
  objc_msgSend(v2, "executeUpdate:withParameters:error:", @"DELETE FROM sort_map_no_uniques WHERE name = ?", v5, 0, v6, v7);
}

void __27__ML3SortMap_commitUpdates__block_invoke_2_369(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  v20[4] = *MEMORY[0x1E4F143B8];
  int v6 = (void *)MEMORY[0x1B3E93C70]();
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 32) objectAtIndex:a2];
  uint64_t v8 = *(int *)(v7 + 32);
  uint64_t v9 = *(void *)(v7 + 8);
  id v10 = *(id *)(v7 + 16);
  v20[0] = v10;
  v11 = [NSNumber numberWithLongLong:v9];
  v20[1] = v11;
  int v12 = [NSNumber numberWithInteger:v8];
  v20[2] = v12;
  int v13 = *(void **)(v7 + 24);
  __int16 v14 = v13;
  if (!v13)
  {
    __int16 v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v20[3] = v14;
  __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  if (!v13) {

  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v16 = +[ML3DatabaseNaturalStatement naturalStatementWithSQL:*(void *)(a1 + 48) parameters:v15];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) enqueueStatement:v16];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) executeUpdate:*(void *)(a1 + 48) withParameters:v15 error:0];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    *(unsigned char *)(v7 + 36) = 0;
  }
  else
  {
    __int16 v17 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543362;
      id v19 = v10;
      _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_ERROR, "sort map insertion failed for '%{public}@'", (uint8_t *)&v18, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (id)_sortKeyString:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v3, "length"));
  id v5 = v3;
  uint64_t v6 = [v5 bytes];
  if ([v5 length])
  {
    unint64_t v7 = 0;
    do
      objc_msgSend(v4, "appendFormat:", @"%02x", *(unsigned __int8 *)(v6 + v7++));
    while ([v5 length] > v7);
  }

  return v4;
}

- (int64_t)_sortKeyDistance:(id)a3 sortKey2:(id)a4 offset:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [v7 length];
  unint64_t v10 = [v8 length];
  id v11 = v7;
  uint64_t v12 = [v11 bytes];
  id v13 = v8;
  uint64_t v14 = [v13 bytes];
  if (a5 > 0xFFFFFFFFFFFFFFF8)
  {
    int64_t v15 = 0;
  }
  else
  {
    int64_t v15 = 0;
    unint64_t v16 = a5 + 7;
    do
    {
      if (a5 >= v9) {
        uint64_t v17 = 0;
      }
      else {
        uint64_t v17 = *(unsigned __int8 *)(v12 + a5);
      }
      if (a5 >= v10) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = *(unsigned __int8 *)(v14 + a5);
      }
      int64_t v15 = (v15 << 8) - v17 + v18;
      ++a5;
    }
    while (a5 < v16);
  }

  return v15;
}

- (int64_t)_maxNameOrderForSortMapEntry:(id)a3 iPhoneSortKeyBuilder:(iPhoneSortKeyBuilder *)a4
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)_minNameOrderForSortMapEntry:(id)a3 iPhoneSortKeyBuilder:(iPhoneSortKeyBuilder *)a4
{
  return 0;
}

- (id)_maxSortKeyForEntry:(id)a3 iPhoneSortKeyBuilder:(iPhoneSortKeyBuilder *)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  maxSortKey = self->_maxSortKey;
  if (!maxSortKey)
  {
    char v9 = *((unsigned char *)a4 + 32) + 48;
    uint64_t v6 = [MEMORY[0x1E4F1CA58] dataWithBytes:&v9 length:1];
    v10[0] = -1;
    [(NSData *)v6 appendBytes:v10 length:8];
    id v7 = self->_maxSortKey;
    self->_maxSortKey = v6;

    maxSortKey = self->_maxSortKey;
  }

  return maxSortKey;
}

- (id)_minSortKeyForEntry:(id)a3 iPhoneSortKeyBuilder:(iPhoneSortKeyBuilder *)a4
{
  minSortKey = self->_minSortKey;
  if (!minSortKey)
  {
    uint64_t v6 = (NSData *)iPhoneSortKeyBuilderCopySectionSortKey((uint64_t)a4, 0, 0);
    id v7 = self->_minSortKey;
    self->_minSortKey = v6;

    minSortKey = self->_minSortKey;
  }

  return minSortKey;
}

- (BOOL)_insertSortedNameEntriesIntoSortMap:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28E60] indexSet];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 1;
  BOOL v7 = [(ML3SortMap *)self loadExistingSortedEntries];
  *((unsigned char *)v38 + 24) = v7;
  if (v7)
  {
    id v8 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    os_signpost_id_t v9 = os_signpost_id_generate(v8);

    unint64_t v10 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    id v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B022D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "insert", (const char *)&unk_1B0561856, buf, 2u);
    }

    unint64_t v23 = v9 - 1;
    os_signpost_id_t v24 = v9;
    SEL v25 = a2;
    id v26 = v5;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v13)
    {
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v14 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_entries, "indexOfObject:inSortedRange:options:usingComparator:", v17, v14, [(NSMutableArray *)self->_entries count] - v14, 1536, &__block_literal_global_6207);
          [(NSMutableArray *)self->_entries insertObject:v17 atIndex:v14];
          [v6 addIndex:v14];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v13);
    }

    id v5 = v26;
    uint64_t v18 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    id v19 = v18;
    if (v23 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v18))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B022D000, v19, OS_SIGNPOST_INTERVAL_END, v24, "insert", (const char *)&unk_1B0561856, buf, 2u);
    }

    library = self->_library;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __50__ML3SortMap__insertSortedNameEntriesIntoSortMap___block_invoke;
    v27[3] = &unk_1E5FB4388;
    id v28 = v6;
    uint64_t v29 = self;
    id v30 = &v37;
    SEL v31 = v25;
    [(ML3MusicLibrary *)library accessSortKeyBuilder:v27];

    BOOL v21 = *((unsigned char *)v38 + 24) != 0;
  }
  else
  {
    BOOL v21 = 0;
  }
  _Block_object_dispose(&v37, 8);

  return v21;
}

void __50__ML3SortMap__insertSortedNameEntriesIntoSortMap___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) firstIndex];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return;
  }
  unint64_t v4 = v3;
  unint64_t i = 0;
  uint64_t v6 = 0;
  uint64_t v53 = v2;
  while (1)
  {
    BOOL v7 = [*(id *)(*(void *)(v2 + 40) + 32) objectAtIndex:v4];
    if (v4)
    {
      uint64_t v8 = [*(id *)(*(void *)(v2 + 40) + 32) objectAtIndex:v4 - 1];
    }
    else
    {
      uint64_t v8 = 0;
    }
    if (i <= v4)
    {
      for (unint64_t i = v4 + 1; i < [*(id *)(*(void *)(v2 + 40) + 32) count]; ++i)
      {
        os_signpost_id_t v9 = (void *)v6;
        uint64_t v6 = [*(id *)(*(void *)(v2 + 40) + 32) objectAtIndex:i];

        if (!v6 || *(uint64_t *)(v6 + 8) >= 1) {
          goto LABEL_13;
        }
      }

      uint64_t v6 = 0;
    }
LABEL_13:
    if (v8)
    {
      uint64_t v10 = *(void *)(v8 + 8);
      if (v6) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = [*(id *)(v2 + 40) _minNameOrderForSortMapEntry:v7 iPhoneSortKeyBuilder:a2];
      if (v6)
      {
LABEL_15:
        uint64_t v11 = *(void *)(v6 + 8);
        goto LABEL_18;
      }
    }
    uint64_t v11 = [*(id *)(v2 + 40) _maxNameOrderForSortMapEntry:v7 iPhoneSortKeyBuilder:a2];
LABEL_18:
    uint64_t v12 = v11 - v10;
    if (v11 <= v10)
    {
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v39 = v38;
      if (v8) {
        uint64_t v40 = *(void *)(v8 + 16);
      }
      else {
        uint64_t v40 = 0;
      }
      if (v6) {
        uint64_t v50 = *(void *)(v6 + 16);
      }
      else {
        uint64_t v50 = 0;
      }
      [v38 handleFailureInMethod:*(void *)(v53 + 56), *(void *)(v53 + 40), @"ML3SortMap.m", 816, @"corrupted name ordering detected. prevNameOrder=%lld, nextNameOrder=%lld, prevEntry=%@, nextEntry=%@", v10, v11, v40, v50 object file lineNumber description];

      uint64_t v2 = v53;
    }
    if (v12 == 1) {
      break;
    }
    if (v8)
    {
      id v13 = *(id *)(v8 + 24);
    }
    else
    {
      id v13 = [*(id *)(v2 + 40) _minSortKeyForEntry:v7 iPhoneSortKeyBuilder:a2];
    }
    uint64_t v14 = v13;
    unint64_t v58 = v4;
    v59 = v7;
    uint64_t v56 = v10;
    id v57 = (void *)v8;
    uint64_t v55 = v12;
    if (v6)
    {
      id v15 = *(id *)(v6 + 24);
      unint64_t v16 = (id *)v7;
    }
    else
    {
      unint64_t v16 = (id *)v7;
      id v15 = [*(id *)(v53 + 40) _maxSortKeyForEntry:v7 iPhoneSortKeyBuilder:a2];
    }
    id v17 = v14;
    uint64_t v18 = [v17 bytes];
    id v19 = v15;
    uint64_t v20 = [v19 bytes];
    uint64_t v21 = [v16[3] bytes];
    v22 = v17;
    unint64_t v23 = [v17 length];
    id v60 = v19;
    unint64_t v24 = [v19 length];
    unint64_t v25 = [v16[3] length];
    if (v23 >= v24) {
      unint64_t v26 = v24;
    }
    else {
      unint64_t v26 = v23;
    }
    unint64_t v27 = 0;
    if (v26 >= v25) {
      unint64_t v26 = v25;
    }
    if (v26)
    {
      uint64_t v28 = v55;
      uint64_t v29 = v59;
      uint64_t v2 = v53;
      while (1)
      {
        int v30 = *(unsigned __int8 *)(v18 + v27);
        if (v30 != *(unsigned __int8 *)(v20 + v27) || v30 != *(unsigned __int8 *)(v21 + v27)) {
          break;
        }
        if (v26 == ++v27)
        {
          unint64_t v27 = v26;
          break;
        }
      }
    }
    else
    {
      uint64_t v28 = v55;
      uint64_t v29 = v59;
      uint64_t v2 = v53;
    }
    uint64_t v31 = [*(id *)(v2 + 40) _sortKeyDistance:v22 sortKey2:v60 offset:v27];
    uint64_t v32 = [*(id *)(v2 + 40) _sortKeyDistance:v22 sortKey2:*((void *)v29 + 3) offset:v27];
    uint64_t v33 = v32;
    if (v31 >= 2 && v32 <= v31)
    {
      if (!v57) {
        goto LABEL_47;
      }
    }
    else
    {
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v42 = v41;
      if (v57) {
        uint64_t v43 = v57[2];
      }
      else {
        uint64_t v43 = 0;
      }
      if (v6) {
        uint64_t v51 = *(void *)(v6 + 16);
      }
      else {
        uint64_t v51 = 0;
      }
      [v41 handleFailureInMethod:*(void *)(v2 + 56), *(void *)(v2 + 40), @"ML3SortMap.m", 841, @"incorrect sort key distance calculated. sortKeyGap=%lld, sortEntryDelta=%lld. prevEntry=%@, nextEntry=%@", v31, v33, v43, v51 object file lineNumber description];

      if (!v57) {
        goto LABEL_47;
      }
    }
    if (v33 <= 0 && compareSortKeys(v22, *((void **)v29 + 3)) >= 1)
    {
      v44 = [MEMORY[0x1E4F28B00] currentHandler];
      [v44 handleFailureInMethod:*(void *)(v2 + 56), *(void *)(v2 + 40), @"ML3SortMap.m", 842, @"entryDistance = 0, but sort keys are descending" object file lineNumber description];
    }
LABEL_47:
    if (v33 >= v31 && compareSortKeys(v60, *((void **)v29 + 3)) < 0)
    {
      int v45 = [MEMORY[0x1E4F28B00] currentHandler];
      [v45 handleFailureInMethod:*(void *)(v2 + 56), *(void *)(v2 + 40), @"ML3SortMap.m", 843, @"entryDistance = gapDistance, but sort keys are ascending" object file lineNumber description];

      if (v33) {
        goto LABEL_50;
      }
    }
    else if (v33)
    {
      goto LABEL_50;
    }
    if (compareSortKeys(v22, *((void **)v29 + 3))) {
      goto LABEL_61;
    }
LABEL_50:
    if (v33 == v31 && compareSortKeys(v60, *((void **)v29 + 3)))
    {
LABEL_61:
      if (v31 >= 0) {
        uint64_t v46 = v31;
      }
      else {
        uint64_t v46 = v31 + 1;
      }
      uint64_t v35 = v46 >> 1;
      int64_t v36 = 9 * (v31 / 0xAuLL);
      if (v33 != v31) {
        int64_t v36 = v31 / 0xAuLL;
      }
      BOOL v37 = v31 < 10;
      goto LABEL_67;
    }
    uint64_t v35 = v31 / 10;
    int64_t v36 = 9 * (v31 / 10);
    if (v33 < v36) {
      int64_t v36 = v33;
    }
    BOOL v37 = v33 < v35;
LABEL_67:
    if (!v37) {
      uint64_t v35 = v36;
    }
    uint64_t v47 = (uint64_t)((double)v28 / (double)v31 * (double)v35);
    if (v47 <= 1) {
      uint64_t v47 = 1;
    }
    *((void *)v29 + 1) = v47 + v56;
    *((unsigned char *)v29 + 36) = 1;
    uint64_t v48 = *(void **)(*(void *)(v2 + 40) + 24);
    BOOL v49 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithML3NameOrder:");
    [v48 setObject:v49 forKey:*((void *)v29 + 2)];

    unint64_t v4 = [*(id *)(v2 + 32) indexGreaterThanIndex:v58];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_87;
    }
  }
  v52 = os_log_create("com.apple.amp.medialibrary", "SortMap");
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 134218240;
    uint64_t v62 = v10;
    __int16 v63 = 2048;
    uint64_t v64 = v11;
    _os_log_impl(&dword_1B022D000, v52, OS_LOG_TYPE_ERROR, "nameOrderSpacing <= 0 between %lld and %lld", buf, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(v2 + 48) + 8) + 24) = 0;
LABEL_87:
}

- (id)_sortedNameEntriesToInsertForNames:(id)a3
{
  id v5 = a3;
  [(ML3SortMap *)self loadExistingSortedEntries];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  library = self->_library;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __49__ML3SortMap__sortedNameEntriesToInsertForNames___block_invoke;
  unint64_t v16 = &unk_1E5FB4360;
  SEL v20 = a2;
  id v17 = v5;
  uint64_t v18 = self;
  id v8 = v6;
  id v19 = v8;
  id v9 = v5;
  [(ML3MusicLibrary *)library accessSortKeyBuilder:&v13];
  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_6207, v13, v14, v15, v16);
  uint64_t v10 = v19;
  id v11 = v8;

  return v11;
}

void __49__ML3SortMap__sortedNameEntriesToInsertForNames___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = a2;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v21 = *(id *)(a1 + 32);
  uint64_t v3 = [v21 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    CFAllocatorRef v19 = (CFAllocatorRef)*MEMORY[0x1E4F1CFB0];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v21);
        }
        BOOL v7 = *(void **)(*((void *)&v23 + 1) + 8 * v6);
        id v8 = (void *)MEMORY[0x1B3E93C70]();
        if (![v7 length])
        {
          uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 40) file:@"ML3SortMap.m" lineNumber:749 description:@"blank string cannot be inserted into sort map"];
        }
        id v9 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "objectForKey:", v7, v19);

        if (!v9)
        {
          uint64_t v10 = [v7 length];
          MEMORY[0x1F4188790](v10);
          uint64_t v12 = (const UniChar *)((char *)&v19 - v11);
          objc_msgSend(v7, "getCharacters:range:", (char *)&v19 - v11, 0, v10);
          int v22 = 0;
          uint64_t v13 = v20;
          uint64_t v14 = iPhoneSortKeyBuilderCreateFromUTF16String(v20, v12, v10, &v22);
          LODWORD(v10) = v22;
          uint64_t SectionFromiPhoneSortKey = iPhoneSortKeyBuilderGetSectionFromiPhoneSortKey(v13, v14, v22);
          CFDataRef v16 = CFDataCreateWithBytesNoCopy(v19, v14, (int)v10, v19);
          id v17 = [[ML3MusicLibrary_SortMapEntry alloc] initWithName:v7 nameSection:SectionFromiPhoneSortKey sortKey:v16];
          CFRelease(v16);
          [*(id *)(a1 + 48) addObject:v17];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v21 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v4);
  }
}

- (BOOL)commitFailedInsertedStrings:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(ML3SortMap *)self loadExistingSortedEntries];
  if ([(ML3SortMap *)self commitUpdates])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v11 = -[NSMutableDictionary objectForKey:](self->_nameOrders, "objectForKey:", v10, (void)v19);

          if (!v11)
          {
            connection = self->_connection;
            uint64_t v23 = v10;
            uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
            [(ML3DatabaseConnection *)connection executeUpdate:@"INSERT INTO sort_map (name, sort_key) VALUES (?, '')" withParameters:v13 error:0];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v7);
    }

    nameOrders = self->_nameOrders;
    self->_nameOrders = 0;

    entries = self->_entries;
    self->_entries = 0;

    BOOL v16 = 0;
    if ([(ML3MusicLibrary *)self->_library updateSortMapOnConnection:self->_connection forceUpdateOriginals:0])
    {
      id v17 = [(ML3SortMap *)self _sortedNameEntriesToInsertForNames:v5];
      BOOL v16 = [(ML3SortMap *)self _insertSortedNameEntriesIntoSortMap:v17];
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)attemptInsertStringsIntoSortMap:(id)a3
{
  id v4 = [(ML3SortMap *)self _sortedNameEntriesToInsertForNames:a3];
  BOOL v5 = [(ML3SortMap *)self _insertSortedNameEntriesIntoSortMap:v4];
  if (!v5)
  {
    uint64_t v6 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_ERROR, "initial sort map insert failed - commit what we have and force a rebuild", v8, 2u);
    }
  }
  return v5;
}

- (BOOL)insertStringsIntoSortMap:(id)a3 didReSortMap:(BOOL *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  uint64_t v7 = [(ML3SortMap *)self _sortedNameEntriesToInsertForNames:v6];
  if ([(ML3SortMap *)self _insertSortedNameEntriesIntoSortMap:v7])
  {
    BOOL v8 = 1;
  }
  else
  {
    if (a4) {
      *a4 = 1;
    }
    id v9 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_ERROR, "initial sort map insert failed - commit what we have and force a rebuild", buf, 2u);
    }

    if ([(ML3SortMap *)self commitUpdates])
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v23 = v6;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            BOOL v16 = [(NSMutableDictionary *)self->_nameOrders objectForKey:v15];

            if (!v16)
            {
              connection = self->_connection;
              uint64_t v29 = v15;
              uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
              [(ML3DatabaseConnection *)connection executeUpdate:@"INSERT INTO sort_map (name, sort_key) VALUES (?, '')" withParameters:v18 error:0];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
        }
        while (v12);
      }

      nameOrders = self->_nameOrders;
      self->_nameOrders = 0;

      entries = self->_entries;
      self->_entries = 0;

      if ([(ML3MusicLibrary *)self->_library updateSortMapOnConnection:self->_connection forceUpdateOriginals:0])
      {
        uint64_t v21 = [(ML3SortMap *)self _sortedNameEntriesToInsertForNames:v10];

        BOOL v8 = [(ML3SortMap *)self _insertSortedNameEntriesIntoSortMap:v21];
        uint64_t v7 = (void *)v21;
      }
      else
      {
        BOOL v8 = 0;
      }
      id v6 = v23;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)loadExistingSortedEntries
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!self->_entries || !self->_nameOrders)
  {
    if (self->_preloadNames)
    {
      id v4 = os_log_create("com.apple.amp.medialibrary", "SortMap");
      os_signpost_id_t v5 = os_signpost_id_generate(v4);

      id v6 = os_log_create("com.apple.amp.medialibrary", "SortMap");
      uint64_t v7 = v6;
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        LOWORD(buf.receiver) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B022D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "db:fetch", (const char *)&unk_1B0561856, (uint8_t *)&buf, 2u);
      }

      BOOL v8 = (void *)MEMORY[0x1B3E93C70]();
      id v9 = [(ML3DatabaseConnection *)self->_connection executeQuery:@"SELECT COUNT(*) FROM sort_map"];
      uint64_t v10 = [v9 int64ValueForFirstRowAndColumn];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v10];
        entries = self->_entries;
        self->_entries = v12;

        uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v11];
        nameOrders = self->_nameOrders;
        self->_nameOrders = v14;

        BOOL v16 = [(ML3DatabaseConnection *)self->_connection executeQuery:@"SELECT name, name_order, name_section, sort_key FROM sort_map ORDER BY name_order"];

        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __39__ML3SortMap_loadExistingSortedEntries__block_invoke;
        v40[3] = &unk_1E5FB4338;
        v40[4] = self;
        v40[5] = a2;
        [v16 enumerateRowsWithBlock:v40];
        id v9 = v16;
      }
      else
      {
        uint64_t v31 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v32 = self->_nameOrders;
        self->_nameOrders = v31;

        uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
        long long v34 = self->_entries;
        self->_entries = v33;
      }
      uint64_t v35 = os_log_create("com.apple.amp.medialibrary", "SortMap");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v36 = (void *)[(NSMutableArray *)self->_entries count];
        LODWORD(buf.receiver) = 134217984;
        *(id *)((char *)&buf.receiver + 4) = v36;
        _os_log_impl(&dword_1B022D000, v35, OS_LOG_TYPE_DEFAULT, "loaded %lu existing entries", (uint8_t *)&buf, 0xCu);
      }

      BOOL v37 = os_log_create("com.apple.amp.medialibrary", "SortMap");
      v38 = v37;
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        LOWORD(buf.receiver) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B022D000, v38, OS_SIGNPOST_INTERVAL_END, v5, "db:fetch", (const char *)&unk_1B0561856, (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      id v17 = [ML3SortMapFaultingNameOrderDictionary alloc];
      connection = self->_connection;
      long long v19 = connection;
      if (v17)
      {
        buf.receiver = v17;
        buf.super_class = (Class)ML3SortMapFaultingNameOrderDictionary;
        long long v20 = [(ML3SortMap *)&buf init];
        id v17 = (ML3SortMapFaultingNameOrderDictionary *)v20;
        if (v20)
        {
          objc_storeStrong((id *)&v20->_connection, connection);
          uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
          dirtyInserts = v17->_dirtyInserts;
          v17->_dirtyInserts = (NSMutableDictionary *)v21;
        }
      }

      id v23 = self->_nameOrders;
      self->_nameOrders = &v17->super;

      long long v24 = [ML3SortMapFaultingEntryArray alloc];
      long long v25 = self->_connection;
      long long v26 = v25;
      if (v24)
      {
        buf.receiver = v24;
        buf.super_class = (Class)ML3SortMapFaultingEntryArray;
        long long v27 = [(ML3SortMap *)&buf init];
        long long v24 = (ML3SortMapFaultingEntryArray *)v27;
        if (v27)
        {
          objc_storeStrong((id *)&v27->_connection, v25);
          uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v29 = v24->_dirtyInserts;
          v24->_dirtyInserts = (NSMutableDictionary *)v28;
        }
      }

      int v30 = self->_entries;
      self->_entries = &v24->super;
    }
  }
  return 1;
}

void __39__ML3SortMap_loadExistingSortedEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = [v3 stringForColumnIndex:0];
  uint64_t v4 = [v3 int64ForColumnIndex:1];
  uint64_t v5 = [v3 intForColumnIndex:2];
  id v6 = [v3 dataForColumnIndex:3];

  uint64_t v7 = [[ML3MusicLibrary_SortMapEntry alloc] initWithName:v11 nameSection:v5 sortKey:v6 nameOrder:v4 dirtyFlag:0];
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:v7];
  BOOL v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithML3NameOrder:", v4, (int)v5);
  if (v11)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"ML3SortMap.m" lineNumber:652 description:@"got nil name from the sort map!"];

    if (v8) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"ML3SortMap.m" lineNumber:653 description:@"valueWithML3NameOrder returned nil!"];

LABEL_3:
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v8 forKey:v11];
}

- (ML3SortMap)initWithConnection:(id)a3 library:(id)a4 preloadNames:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ML3SortMap;
  id v11 = [(ML3SortMap *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_connection, a3);
    objc_storeStrong((id *)&v12->_library, a4);
    v12->_smallestNameDelta = 0x7FFFFFFFFFFFFFFFLL;
    v12->_preloadNames = a5;
  }

  return v12;
}

@end