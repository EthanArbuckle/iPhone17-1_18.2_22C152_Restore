@interface BRCMigrationQueryOperation
+ (id)allMigrationKeysOrdered;
+ (id)documentSharesMigrationKey;
+ (id)folderShareAliasesMigrationKey;
+ (id)folderSharesMigrationKey;
- (BOOL)_saveFetchedRecords:(id)a3 cursor:(id)a4 error:(id *)a5;
- (BOOL)_updatedContinuationCursor:(id)a3 fetchedRecords:(id)a4 error:(id *)a5;
- (BOOL)shouldRetryForError:(id)a3;
- (BRCMigrationQueryOperation)initWithServerZone:(id)a3 migrationKey:(id)a4 continuationCursor:(id)a5 sessionContext:(id)a6;
- (void)_performAfterQueryingForShareAliasesWithCompletion:(id)a3;
- (void)_performAfterQueryingForShareIDsOfFolders:(BOOL)a3 completion:(id)a4;
- (void)_performQuery:(id)a3 recordFetchedBlock:(id)a4 cursorUpdatedBlock:(id)a5 desiredKeys:(id)a6 completion:(id)a7;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
@end

@implementation BRCMigrationQueryOperation

+ (id)documentSharesMigrationKey
{
  return @"document-shares";
}

+ (id)folderSharesMigrationKey
{
  return @"folder-shares";
}

+ (id)folderShareAliasesMigrationKey
{
  return @"folder-share-aliases";
}

+ (id)allMigrationKeysOrdered
{
  v8[3] = *MEMORY[0x263EF8340];
  v3 = [a1 documentSharesMigrationKey];
  v4 = objc_msgSend(a1, "folderSharesMigrationKey", v3);
  v8[1] = v4;
  v5 = [a1 folderShareAliasesMigrationKey];
  v8[2] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];

  return v6;
}

- (BRCMigrationQueryOperation)initWithServerZone:(id)a3 migrationKey:(id)a4 continuationCursor:(id)a5 sessionContext:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v11 metadataSyncContext];
  v21.receiver = self;
  v21.super_class = (Class)BRCMigrationQueryOperation;
  v16 = [(_BRCOperation *)&v21 initWithName:@"migration-query" syncContext:v15 sessionContext:v14];

  if (v16)
  {
    objc_storeStrong((id *)&v16->super._serverZone, a3);
    objc_storeStrong((id *)&v16->_migrationKey, a4);
    objc_storeStrong((id *)&v16->_continuationCursor, a5);
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    shareIDsToFetch = v16->_shareIDsToFetch;
    v16->_shareIDsToFetch = v17;

    v19 = objc_msgSend(MEMORY[0x263EFD780], "br_osUpgradeMigration");
    [(_BRCOperation *)v16 setGroup:v19];
  }
  return v16;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (BOOL)_saveFetchedRecords:(id)a3 cursor:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [(BRCServerZone *)self->super._serverZone session];
  id v11 = [v10 serverState];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  id v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", self->super._serverZone, 0);
  id v13 = [v10 serverDB];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __63__BRCMigrationQueryOperation__saveFetchedRecords_cursor_error___block_invoke;
  v30[3] = &unk_265083AB0;
  v30[4] = self;
  id v14 = v8;
  id v31 = v14;
  id v15 = v12;
  id v32 = v15;
  v37 = a5;
  id v16 = v11;
  id v33 = v16;
  id v17 = v9;
  id v34 = v17;
  v36 = &v38;
  id v18 = v10;
  id v35 = v18;
  [v13 performWithFlags:9 action:v30];

  uint64_t v19 = v39[3];
  if (v19)
  {
    v20 = [v18 clientDB];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __63__BRCMigrationQueryOperation__saveFetchedRecords_cursor_error___block_invoke_16;
    v26[3] = &unk_265082DC0;
    id v27 = v15;
    id v28 = v18;
    v29 = &v38;
    [v20 performWithFlags:37 action:v26];

    objc_super v21 = v27;
  }
  else
  {
    objc_super v21 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorSyncBlocked");
    if (v21)
    {
      v22 = brc_bread_crumbs();
      v23 = brc_default_log();
      if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
      {
        v25 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v43 = "-[BRCMigrationQueryOperation _saveFetchedRecords:cursor:error:]";
        __int16 v44 = 2080;
        if (!a5) {
          v25 = "(ignored by caller)";
        }
        v45 = v25;
        __int16 v46 = 2112;
        v47 = v21;
        __int16 v48 = 2112;
        v49 = v22;
        _os_log_error_impl(&dword_23FA42000, v23, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      objc_storeStrong(a5, v21);
    }
  }

  _Block_object_dispose(&v38, 8);
  return v19 != 0;
}

uint64_t __63__BRCMigrationQueryOperation__saveFetchedRecords_cursor_error___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 504);
  uint64_t v4 = *(void *)(a1 + 48);
  id v28 = 0;
  char v5 = [v3 saveQueryRecords:v2 zonesNeedingAllocRanks:v4 error:&v28];
  id v6 = v28;
  id v7 = v28;
  id v8 = v7;
  if (v5)
  {
    id v9 = *(void **)(a1 + 56);
    v10 = [*(id *)(*(void *)(a1 + 32) + 504) mangledID];
    [v9 migrationQueryForMangledID:v10 key:*(void *)(*(void *)(a1 + 32) + 512) didUpdateWithCursor:*(void *)(a1 + 64)];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v15), "allocateRanksWhenCaughtUp:", 1, (void)v24))
          {

            goto LABEL_18;
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [*(id *)(a1 + 56) nextRank];
    uint64_t v16 = [*(id *)(a1 + 72) saveServerZoneToDB:*(void *)(*(void *)(a1 + 32) + 504)];
  }
  else
  {
    id v17 = v7;
    if (v17)
    {
      id v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        v22 = "(passed to caller)";
        uint64_t v23 = *(void *)(a1 + 88);
        *(_DWORD *)buf = 136315906;
        id v31 = "-[BRCMigrationQueryOperation _saveFetchedRecords:cursor:error:]_block_invoke";
        if (!v23) {
          v22 = "(ignored by caller)";
        }
        __int16 v32 = 2080;
        id v33 = v22;
        __int16 v34 = 2112;
        id v35 = v17;
        __int16 v36 = 2112;
        v37 = v18;
        _os_log_error_impl(&dword_23FA42000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    v20 = *(id **)(a1 + 88);
    if (v20) {
      objc_storeStrong(v20, v6);
    }

LABEL_18:
    uint64_t v16 = 0;
  }

  return v16;
}

uint64_t __63__BRCMigrationQueryOperation__saveFetchedRecords_cursor_error___block_invoke_16(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "applyScheduler", (void)v10);
        [v8 generatedRanksForZone:v7 upToRank:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return 1;
}

- (BOOL)_updatedContinuationCursor:(id)a3 fetchedRecords:(id)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  long long v10 = [(BRCSyncContext *)self->super.super._syncContext session];
  long long v11 = self->super._serverZone;
  long long v12 = [v10 serverState];
  uint64_t v33 = 0;
  __int16 v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 1;
  long long v13 = brc_bread_crumbs();
  uint64_t v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    prettyPrintQueryCursor(self->_continuationCursor);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = prettyPrintQueryCursor(v8);
    *(_DWORD *)buf = 138412802;
    id v38 = v19;
    __int16 v39 = 2112;
    objc_super v21 = (void *)v20;
    uint64_t v40 = v20;
    __int16 v41 = 2112;
    v42 = v13;
    _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] share-query progressed from cursor:%@ to cursor:%@%@", buf, 0x20u);
  }
  if ([(NSMutableArray *)self->_shareIDsToFetch count])
  {
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263EFD6D8]) initWithRecordIDs:self->_shareIDsToFetch];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __78__BRCMigrationQueryOperation__updatedContinuationCursor_fetchedRecords_error___block_invoke_2;
    v22[3] = &unk_265083B00;
    long long v26 = &v33;
    long long v27 = a5;
    id v23 = v9;
    long long v24 = self;
    id v25 = v8;
    [v15 setFetchRecordsCompletionBlock:v22];
    [(_BRCOperation *)self addSubOperation:v15];
    [v15 waitUntilFinished];
    [(NSMutableArray *)self->_shareIDsToFetch removeAllObjects];
    BOOL v16 = *((unsigned char *)v34 + 24) != 0;
  }
  else
  {
    id v17 = [v10 serverDB];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __78__BRCMigrationQueryOperation__updatedContinuationCursor_fetchedRecords_error___block_invoke;
    v28[3] = &unk_265083AD8;
    id v29 = v12;
    v30 = v11;
    id v31 = self;
    id v32 = v8;
    [v17 performWithFlags:1 action:v28];

    BOOL v16 = 1;
    uint64_t v15 = v29;
  }

  _Block_object_dispose(&v33, 8);
  return v16;
}

uint64_t __78__BRCMigrationQueryOperation__updatedContinuationCursor_fetchedRecords_error___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) mangledID];
  [v2 migrationQueryForMangledID:v3 key:*(void *)(*(void *)(a1 + 48) + 512) didUpdateWithCursor:*(void *)(a1 + 56)];

  return 1;
}

void __78__BRCMigrationQueryOperation__updatedContinuationCursor_fetchedRecords_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
    id v9 = brc_bread_crumbs();
    long long v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      uint64_t v19 = *(void *)(a1 + 64);
      *(_DWORD *)obj = 136315906;
      if (v19) {
        uint64_t v20 = "(passed to caller)";
      }
      else {
        uint64_t v20 = "(ignored by caller)";
      }
      *(void *)&obj[4] = "-[BRCMigrationQueryOperation _updatedContinuationCursor:fetchedRecords:error:]_block_invoke_2";
      __int16 v22 = 2080;
      id v23 = v20;
      __int16 v24 = 2112;
      id v25 = v8;
      __int16 v26 = 2112;
      long long v27 = v9;
      _os_log_error_impl(&dword_23FA42000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", obj, 0x2Au);
    }

    long long v11 = *(id **)(a1 + 64);
    if (v11) {
      objc_storeStrong(v11, a3);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    *(void *)obj = 0;
    if (*(void *)(a1 + 32)) {
      long long v12 = *(void **)(a1 + 32);
    }
    else {
      long long v12 = (void *)MEMORY[0x263EFFA68];
    }
    long long v13 = objc_msgSend(a2, "allValues", *(void *)obj);
    uint64_t v14 = [v12 arrayByAddingObjectsFromArray:v13];

    char v15 = [*(id *)(a1 + 40) _saveFetchedRecords:v14 cursor:*(void *)(a1 + 48) error:obj];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(v16 + 24)) {
      char v17 = v15;
    }
    else {
      char v17 = 0;
    }
    *(unsigned char *)(v16 + 24) = v17;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      id v18 = *(id **)(a1 + 64);
      if (v18) {
        objc_storeStrong(v18, *(id *)obj);
      }
    }
  }
}

- (void)_performQuery:(id)a3 recordFetchedBlock:(id)a4 cursorUpdatedBlock:(id)a5 desiredKeys:(id)a6 completion:(id)a7
{
  v49[2] = *MEMORY[0x263EF8340];
  id v34 = a3;
  id v12 = a4;
  id v32 = a5;
  id v13 = a6;
  id v33 = a7;
  uint64_t v14 = [(BRCServerZone *)self->super._serverZone mangledID];
  char v15 = +[BRCUserDefaults defaultsForMangledID:v14];

  unsigned int v16 = [v15 maxRecordCountInQuerySharedRecordsOperation];
  memset(v43, 0, sizeof(v43));
  __brc_create_section(0, (uint64_t)"-[BRCMigrationQueryOperation _performQuery:recordFetchedBlock:cursorUpdatedBlock:desiredKeys:completion:]", 178, v43);
  char v17 = brc_bread_crumbs();
  id v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = v43[0];
    uint64_t v28 = [(BRCServerZone *)self->super._serverZone zoneName];
    *(_DWORD *)buf = 134218754;
    uint64_t v45 = v27;
    __int16 v46 = 2112;
    uint64_t v47 = (uint64_t)v28;
    __int16 v48 = 1024;
    LODWORD(v49[0]) = v16;
    WORD2(v49[0]) = 2112;
    *(void *)((char *)v49 + 6) = v17;
    _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx query for %@ starting with batchSize:%u%@", buf, 0x26u);
  }
  if (self->_continuationCursor)
  {
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263EFD7C0]) initWithCursor:self->_continuationCursor];
    uint64_t v20 = brc_bread_crumbs();
    objc_super v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v31 = [v19 operationID];
      uint64_t v22 = prettyPrintQueryCursor(self->_continuationCursor);
      *(_DWORD *)buf = 138412802;
      uint64_t v45 = (uint64_t)v31;
      __int16 v46 = 2112;
      v30 = (void *)v22;
      uint64_t v47 = v22;
      __int16 v48 = 2112;
      v49[0] = v20;
      _os_log_debug_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] created query %@ from cursor:%@%@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263EFD7C0]) initWithQuery:v34];
    uint64_t v20 = brc_bread_crumbs();
    objc_super v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v29 = [v19 operationID];
      *(_DWORD *)buf = 138412802;
      uint64_t v45 = (uint64_t)v29;
      __int16 v46 = 2112;
      uint64_t v47 = (uint64_t)v34;
      __int16 v48 = 2112;
      v49[0] = v20;
      _os_log_debug_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] created query %@ from query:%@%@", buf, 0x20u);
    }
  }

  [v19 setDesiredKeys:v13];
  [v19 setResultsLimit:v16];
  id v23 = [(BRCServerZone *)self->super._serverZone zoneID];
  [v19 setZoneID:v23];

  [v19 setShouldFetchAssetContent:0];
  [v19 setFetchAllResults:1];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __105__BRCMigrationQueryOperation__performQuery_recordFetchedBlock_cursorUpdatedBlock_desiredKeys_completion___block_invoke;
  v40[3] = &unk_265083B28;
  id v24 = v12;
  id v41 = v24;
  v42 = v19;
  [v19 setRecordFetchedBlock:v40];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __105__BRCMigrationQueryOperation__performQuery_recordFetchedBlock_cursorUpdatedBlock_desiredKeys_completion___block_invoke_2;
  v37[3] = &unk_265083B50;
  __int16 v39 = v19;
  v37[4] = self;
  id v25 = v33;
  id v38 = v25;
  [v19 setQueryCompletionBlock:v37];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __105__BRCMigrationQueryOperation__performQuery_recordFetchedBlock_cursorUpdatedBlock_desiredKeys_completion___block_invoke_28;
  v35[3] = &unk_265083B78;
  v35[4] = self;
  id v26 = v32;
  id v36 = v26;
  [v19 setQueryCursorFetchedBlock:v35];
  [(_BRCOperation *)self addSubOperation:v19];

  __brc_leave_section(v43);
}

uint64_t __105__BRCMigrationQueryOperation__performQuery_recordFetchedBlock_cursorUpdatedBlock_desiredKeys_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

void __105__BRCMigrationQueryOperation__performQuery_recordFetchedBlock_cursorUpdatedBlock_desiredKeys_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v7 = a3;
  memset(v12, 0, sizeof(v12));
  __brc_create_section(0, (uint64_t)"-[BRCMigrationQueryOperation _performQuery:recordFetchedBlock:cursorUpdatedBlock:desiredKeys:completion:]_block_invoke_2", 201, v12);
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[6];
    long long v11 = @"success";
    if (v7) {
      long long v11 = v7;
    }
    *(_DWORD *)buf = 134218754;
    uint64_t v14 = v12[0];
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx handling result of %@: %@%@", buf, 0x2Au);
  }

  objc_storeStrong((id *)(a1[4] + 520), a2);
  (*(void (**)(void))(a1[5] + 16))();
  __brc_leave_section(v12);
}

void __105__BRCMigrationQueryOperation__performQuery_recordFetchedBlock_cursorUpdatedBlock_desiredKeys_completion___block_invoke_28(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 520), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_performAfterQueryingForShareAliasesWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"brPrefix", @"shareAlias/"];
  id v6 = (void *)[objc_alloc(MEMORY[0x263EFD7B0]) initWithRecordType:@"RecordPrefixList" predicate:v5];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__30;
  v24[4] = __Block_byref_object_dispose__30;
  id v25 = 0;
  uint64_t v7 = objc_opt_new();
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __81__BRCMigrationQueryOperation__performAfterQueryingForShareAliasesWithCompletion___block_invoke;
  v22[3] = &unk_265083BA0;
  id v8 = v7;
  id v23 = v8;
  id v9 = (void *)MEMORY[0x2455D9A50](v22);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __81__BRCMigrationQueryOperation__performAfterQueryingForShareAliasesWithCompletion___block_invoke_45;
  v19[3] = &unk_265083BC8;
  v19[4] = self;
  id v10 = v8;
  id v20 = v10;
  uint64_t v21 = v24;
  long long v11 = (void *)MEMORY[0x2455D9A50](v19);
  id v12 = [MEMORY[0x263EFD7C8] desiredKeysWithMask:185];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __81__BRCMigrationQueryOperation__performAfterQueryingForShareAliasesWithCompletion___block_invoke_2;
  v15[3] = &unk_265083BF0;
  v15[4] = self;
  id v13 = v10;
  id v16 = v13;
  id v18 = v24;
  id v14 = v4;
  id v17 = v14;
  [(BRCMigrationQueryOperation *)self _performQuery:v6 recordFetchedBlock:v9 cursorUpdatedBlock:v11 desiredKeys:v12 completion:v15];

  _Block_object_dispose(v24, 8);
}

void __81__BRCMigrationQueryOperation__performAfterQueryingForShareAliasesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [v6 recordID];
    id v10 = [v6 etag];
    long long v11 = [v5 operationID];
    int v12 = 138413058;
    id v13 = v9;
    __int16 v14 = 2112;
    __int16 v15 = v10;
    __int16 v16 = 2112;
    id v17 = v11;
    __int16 v18 = 2112;
    __int16 v19 = v7;
    _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] fetched share alias record %@ with etag:%@ in query %@%@", (uint8_t *)&v12, 0x2Au);
  }
  [*(id *)(a1 + 32) addObject:v6];
}

uint64_t __81__BRCMigrationQueryOperation__performAfterQueryingForShareAliasesWithCompletion___block_invoke_45(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _saveFetchedRecords:*(void *)(a1 + 40) cursor:a2 error:*(void *)(*(void *)(a1 + 48) + 8) + 40];
  uint64_t v3 = *(void **)(a1 + 40);
  return [v3 removeAllObjects];
}

void __81__BRCMigrationQueryOperation__performAfterQueryingForShareAliasesWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    [*(id *)(a1 + 32) _saveFetchedRecords:*(void *)(a1 + 40) cursor:*(void *)(*(void *)(a1 + 32) + 520) error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
    [*(id *)(a1 + 40) removeAllObjects];
    id v4 = 0;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    id v4 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  (*(void (**)(void, void, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), v4);
}

- (void)_performAfterQueryingForShareIDsOfFolders:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != NULL", *MEMORY[0x263EFD508]);
  id v8 = objc_alloc(MEMORY[0x263EFD7B0]);
  id v9 = kBRRecordTypeStructure;
  if (!v4) {
    id v9 = kBRRecordTypeContent;
  }
  id v10 = (void *)[v8 initWithRecordType:*v9 predicate:v7];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__30;
  v27[4] = __Block_byref_object_dispose__30;
  id v28 = 0;
  long long v11 = objc_opt_new();
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __83__BRCMigrationQueryOperation__performAfterQueryingForShareIDsOfFolders_completion___block_invoke;
  v25[3] = &unk_265083C18;
  v25[4] = self;
  id v12 = v11;
  id v26 = v12;
  id v13 = (void *)MEMORY[0x2455D9A50](v25);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __83__BRCMigrationQueryOperation__performAfterQueryingForShareIDsOfFolders_completion___block_invoke_52;
  v22[3] = &unk_265083BC8;
  void v22[4] = self;
  id v14 = v12;
  id v23 = v14;
  id v24 = v27;
  __int16 v15 = (void *)MEMORY[0x2455D9A50](v22);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __83__BRCMigrationQueryOperation__performAfterQueryingForShareIDsOfFolders_completion___block_invoke_2;
  v18[3] = &unk_265083C40;
  uint64_t v21 = v27;
  v18[4] = self;
  id v16 = v14;
  id v19 = v16;
  id v17 = v6;
  id v20 = v17;
  [(BRCMigrationQueryOperation *)self _performQuery:v10 recordFetchedBlock:v13 cursorUpdatedBlock:v15 desiredKeys:MEMORY[0x263EFFA68] completion:v18];

  _Block_object_dispose(v27, 8);
}

void __83__BRCMigrationQueryOperation__performAfterQueryingForShareIDsOfFolders_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 recordID];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 248) session];
  id v9 = objc_msgSend(v7, "brc_itemIDWithSession:", v8);

  [*(id *)(a1 + 40) addObject:v6];
  if (v9)
  {
    id v10 = brc_bread_crumbs();
    long long v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v16 = [v6 recordID];
      id v17 = [v6 etag];
      __int16 v18 = [v5 operationID];
      int v20 = 138413058;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      id v23 = v17;
      __int16 v24 = 2112;
      id v25 = v18;
      __int16 v26 = 2112;
      uint64_t v27 = v10;
      _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] fetched shared record %@ with etag:%@ in query %@%@", (uint8_t *)&v20, 0x2Au);
    }
    id v12 = objc_alloc(MEMORY[0x263EFD7E8]);
    id v13 = [*(id *)(*(void *)(a1 + 32) + 504) zoneID];
    id v14 = (void *)[v12 initShareIDWithItemID:v9 zoneID:v13];

    [*(id *)(*(void *)(a1 + 32) + 528) addObject:v14];
  }
  else
  {
    id v14 = brc_bread_crumbs();
    __int16 v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      id v19 = [v5 operationID];
      int v20 = 138412802;
      uint64_t v21 = v7;
      __int16 v22 = 2112;
      id v23 = v19;
      __int16 v24 = 2112;
      id v25 = v14;
      _os_log_fault_impl(&dword_23FA42000, v15, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unable to parse itemID from %@ in query %@%@", (uint8_t *)&v20, 0x20u);
    }
  }
}

uint64_t __83__BRCMigrationQueryOperation__performAfterQueryingForShareIDsOfFolders_completion___block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  BOOL v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = (void *)[v4 copy];
  [v3 _updatedContinuationCursor:v5 fetchedRecords:v6 error:*(void *)(*(void *)(a1 + 48) + 8) + 40];

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    [*(id *)(a1 + 32) cancel];
  }
  uint64_t v7 = *(void **)(a1 + 40);
  return [v7 removeAllObjects];
}

void __83__BRCMigrationQueryOperation__performAfterQueryingForShareIDsOfFolders_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (!v5 && !*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)[*(id *)(a1 + 40) copy];
    [v6 _updatedContinuationCursor:0 fetchedRecords:v7 error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    id v8 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  else {
    id v8 = v5;
  }
  (*(void (**)(void, void, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), v8);
}

- (void)main
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_23FA42000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unknown migration %s%@", buf, 0x16u);
}

uint64_t __34__BRCMigrationQueryOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completedWithResult:*(void *)(*(void *)(a1 + 32) + 520) error:a3];
}

uint64_t __34__BRCMigrationQueryOperation_main__block_invoke_55(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completedWithResult:*(void *)(*(void *)(a1 + 32) + 520) error:a3];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCMigrationQueryOperation finishWithResult:error:]", 320, v18);
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = v18[0];
    migrationKey = self->_migrationKey;
    __int16 v15 = [(_BRCOperation *)self operationID];
    *(_DWORD *)buf = 134218754;
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    __int16 v22 = migrationKey;
    __int16 v23 = 2112;
    __int16 v24 = v15;
    __int16 v25 = 2112;
    __int16 v26 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx migration-query '%@' %@ completed%@", buf, 0x2Au);
  }
  if (v7)
  {

    id v6 = 0;
  }
  else
  {
    id v10 = [(BRCSyncContext *)self->super.super._syncContext session];
    long long v11 = [v10 clientDB];
    id v12 = [v11 serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__BRCMigrationQueryOperation_finishWithResult_error___block_invoke;
    block[3] = &unk_26507ED70;
    block[4] = self;
    dispatch_sync(v12, block);
  }
  v16.receiver = self;
  v16.super_class = (Class)BRCMigrationQueryOperation;
  [(BRCSyncDownOperation *)&v16 finishWithResult:v6 error:v7];
  __brc_leave_section(v18);
}

void __53__BRCMigrationQueryOperation_finishWithResult_error___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 504) clientZone];
  [v1 scheduleSyncDown];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareIDsToFetch, 0);
  objc_storeStrong((id *)&self->_continuationCursor, 0);
  objc_storeStrong((id *)&self->_migrationKey, 0);
}

@end