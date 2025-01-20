@interface BRCUploadSyncUpRequestsManager
+ (id)_fetchManagersDictionary;
+ (id)defaultManagerWithPersonaIdentifier:(id)a3;
- (BOOL)cancelRequestForIdentifier:(id)a3 error:(id *)a4;
- (BOOL)finishRequestForIdentifer:(id)a3 finishError:(id)a4 error:(id *)a5;
- (BOOL)registerRequestForIdentifier:(id)a3 requestType:(signed __int16)a4 requestSource:(id)a5 progress:(id)a6 finishBlock:(id)a7 error:(id *)a8;
- (id)_initWithPersonaIdentifier:(id)a3;
- (id)getProgressForIdentifier:(id)a3;
- (void)_callFinishBlockOnDataRequest:(id)a3 finishError:(id)a4;
- (void)_invalidateRequestsTableWithNewSource:(id)a3;
- (void)dumpToContext:(id)a3;
- (void)finishRequestForItemsInZoneRowID:(id)a3 finishError:(id)a4;
- (void)invalidateRequestsOfClient:(id)a3;
@end

@implementation BRCUploadSyncUpRequestsManager

+ (id)_fetchManagersDictionary
{
  if (_fetchManagersDictionary_onceToken != -1) {
    dispatch_once(&_fetchManagersDictionary_onceToken, &__block_literal_global_59);
  }
  v2 = (void *)_fetchManagersDictionary_managersByPersona;
  return v2;
}

void __58__BRCUploadSyncUpRequestsManager__fetchManagersDictionary__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_fetchManagersDictionary_managersByPersona;
  _fetchManagersDictionary_managersByPersona = v0;
}

- (id)_initWithPersonaIdentifier:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCUploadSyncUpRequestsManager;
  v6 = [(BRCUploadSyncUpRequestsManager *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_personaIdentifer, a3);
    uint64_t v8 = objc_opt_new();
    requestsByItemGlobalID = v7->_requestsByItemGlobalID;
    v7->_requestsByItemGlobalID = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    zoneIDToItemIDs = v7->_zoneIDToItemIDs;
    v7->_zoneIDToItemIDs = (NSMutableDictionary *)v10;

    latestSourceIdentifier = v7->_latestSourceIdentifier;
    v7->_latestSourceIdentifier = (NSNumber *)&unk_26F3DD4F0;
  }
  return v7;
}

+ (id)defaultManagerWithPersonaIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _fetchManagersDictionary];
  objc_sync_enter(v4);
  id v5 = [v4 objectForKeyedSubscript:v3];
  if (!v5)
  {
    id v5 = [[BRCUploadSyncUpRequestsManager alloc] _initWithPersonaIdentifier:v3];
    [v4 setObject:v5 forKeyedSubscript:v3];
  }
  objc_sync_exit(v4);

  return v5;
}

- (BOOL)registerRequestForIdentifier:(id)a3 requestType:(signed __int16)a4 requestSource:(id)a5 progress:(id)a6 finishBlock:(id)a7 error:(id *)a8
{
  uint64_t v12 = a4;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v31 = [[BRCRequestData alloc] initWithProgress:v16 requestType:v12 finishBlock:v17];
  v18 = self;
  objc_sync_enter(v18);
  if ((objc_msgSend(v15, "br_isEqualToNumber:", v18->_latestSourceIdentifier) & 1) == 0) {
    [(BRCUploadSyncUpRequestsManager *)v18 _invalidateRequestsTableWithNewSource:v15];
  }
  v19 = [(NSMutableDictionary *)v18->_requestsByItemGlobalID objectForKey:v14];

  if (v19)
  {
    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1006, @"Request is already registered for %@", v14);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = brc_bread_crumbs();
      v22 = brc_default_log();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        v30 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v33 = "-[BRCUploadSyncUpRequestsManager registerRequestForIdentifier:requestType:requestSource:progress:finishBlock:error:]";
        __int16 v34 = 2080;
        if (!a8) {
          v30 = "(ignored by caller)";
        }
        v35 = v30;
        __int16 v36 = 2112;
        id v37 = v20;
        __int16 v38 = 2112;
        v39 = v21;
        _os_log_error_impl(&dword_23FA42000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a8)
    {
      id v20 = v20;
      *a8 = v20;
    }
    v23 = v20;
  }
  else
  {
    [(NSMutableDictionary *)v18->_requestsByItemGlobalID setObject:v31 forKey:v14];
    zoneIDToItemIDs = v18->_zoneIDToItemIDs;
    v25 = [v14 zoneRowID];
    v23 = [(NSMutableDictionary *)zoneIDToItemIDs objectForKey:v25];

    if (!v23)
    {
      v23 = objc_opt_new();
      v26 = v18->_zoneIDToItemIDs;
      v27 = [v14 zoneRowID];
      [(NSMutableDictionary *)v26 setObject:v23 forKey:v27];
    }
    [v23 addObject:v14];
    brc_bread_crumbs();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v33 = (const char *)v31;
      __int16 v34 = 2112;
      v35 = (const char *)v14;
      __int16 v36 = 2112;
      id v37 = v20;
      _os_log_debug_impl(&dword_23FA42000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] Registered request %@ for identifier %@%@", buf, 0x20u);
    }
  }
  objc_sync_exit(v18);

  return v19 == 0;
}

- (void)_callFinishBlockOnDataRequest:(id)a3 finishError:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    v6 = [a3 finishBlock];
    v6[2](v6, v5);
  }
}

- (BOOL)finishRequestForIdentifer:(id)a3 finishError:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (char *)a4;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  v11 = [(NSMutableDictionary *)v10->_requestsByItemGlobalID objectForKey:v8];
  uint64_t v12 = (void *)[v11 copy];

  [(NSMutableDictionary *)v10->_requestsByItemGlobalID removeObjectForKey:v8];
  zoneIDToItemIDs = v10->_zoneIDToItemIDs;
  id v14 = [v8 zoneRowID];
  id v15 = [(NSMutableDictionary *)zoneIDToItemIDs objectForKey:v14];

  if (v15)
  {
    [v15 removeObject:v8];
    if (![v15 count])
    {
      id v16 = v10->_zoneIDToItemIDs;
      id v17 = [v8 zoneRowID];
      [(NSMutableDictionary *)v16 removeObjectForKey:v17];
    }
  }

  objc_sync_exit(v10);
  if (v12)
  {
    v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v26 = (const char *)v8;
      __int16 v27 = 2112;
      v28 = v9;
      __int16 v29 = 2112;
      id v30 = v18;
      _os_log_debug_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] Calling finish block for %@ with %@%@", buf, 0x20u);
    }

    [(BRCUploadSyncUpRequestsManager *)v10 _callFinishBlockOnDataRequest:v12 finishError:v9];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 1007, @"there is no request for %@", v8);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = brc_bread_crumbs();
      v22 = brc_default_log();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        v24 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v26 = "-[BRCUploadSyncUpRequestsManager finishRequestForIdentifer:finishError:error:]";
        __int16 v27 = 2080;
        if (!a5) {
          v24 = "(ignored by caller)";
        }
        v28 = v24;
        __int16 v29 = 2112;
        id v30 = v20;
        __int16 v31 = 2112;
        v32 = v21;
        _os_log_error_impl(&dword_23FA42000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      *a5 = v20;
    }
  }
  return v12 != 0;
}

- (BOOL)cancelRequestForIdentifier:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x263F087E8];
  id v7 = a3;
  id v8 = objc_msgSend(v6, "brc_errorOperationCancelled");
  LOBYTE(a4) = [(BRCUploadSyncUpRequestsManager *)self finishRequestForIdentifer:v7 finishError:v8 error:a4];

  return (char)a4;
}

- (void)finishRequestForItemsInZoneRowID:(id)a3 finishError:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[BRCUploadSyncUpRequestsManager finishRequestForItemsInZoneRowID:finishError:]();
  }

  v11 = [(NSMutableDictionary *)v8->_zoneIDToItemIDs objectForKey:v6];
  uint64_t v12 = v11;
  if (v11)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = -[NSMutableDictionary objectForKey:](v8->_requestsByItemGlobalID, "objectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * v16), (void)v18);
          [(BRCUploadSyncUpRequestsManager *)v8 _callFinishBlockOnDataRequest:v17 finishError:v7];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }

    [(NSMutableDictionary *)v8->_requestsByItemGlobalID removeObjectsForKeys:v13];
  }

  objc_sync_exit(v8);
}

- (id)getProgressForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_requestsByItemGlobalID objectForKey:v4];
  id v7 = [v6 progress];

  objc_sync_exit(v5);
  return v7;
}

- (void)_invalidateRequestsTableWithNewSource:(id)a3
{
  id v4 = (NSNumber *)a3;
  id v5 = (NSMutableDictionary *)objc_opt_new();
  requestsByItemGlobalID = self->_requestsByItemGlobalID;
  self->_requestsByItemGlobalID = v5;

  id v7 = (NSMutableDictionary *)objc_opt_new();
  zoneIDToItemIDs = self->_zoneIDToItemIDs;
  self->_zoneIDToItemIDs = v7;

  latestSourceIdentifier = self->_latestSourceIdentifier;
  self->_latestSourceIdentifier = v4;
}

- (void)invalidateRequestsOfClient:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (objc_msgSend(v4, "br_isEqualToNumber:", v5->_latestSourceIdentifier))
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BRCUploadSyncUpRequestsManager invalidateRequestsOfClient:]();
    }

    [(BRCUploadSyncUpRequestsManager *)v5 _invalidateRequestsTableWithNewSource:0];
  }
  objc_sync_exit(v5);
}

- (void)dumpToContext:(id)a3
{
  id v4 = a3;
  [v4 writeLineWithFormat:@"fpfs modifications tracked requests"];
  [v4 writeLineWithFormat:@"-----------------------------------------------------"];
  id v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "writeLineWithFormat:", @"tracked requests of client (%lu) : (%lu):", -[NSNumber unsignedLongValue](v5->_latestSourceIdentifier, "unsignedLongValue"), -[NSMutableDictionary count](v5->_requestsByItemGlobalID, "count"));
  if ([(NSMutableDictionary *)v5->_requestsByItemGlobalID count])
  {
    [v4 writeLineWithFormat:@"{"];
    [v4 pushIndentation];
  }
  requestsByItemGlobalID = v5->_requestsByItemGlobalID;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__BRCUploadSyncUpRequestsManager_dumpToContext___block_invoke;
  v8[3] = &unk_265086480;
  id v7 = v4;
  id v9 = v7;
  [(NSMutableDictionary *)requestsByItemGlobalID enumerateKeysAndObjectsUsingBlock:v8];
  if ([(NSMutableDictionary *)v5->_requestsByItemGlobalID count])
  {
    [v7 popIndentation];
    [v7 writeLineWithFormat:@"}"];
  }
  [v7 writeEmptyLine];

  objc_sync_exit(v5);
}

uint64_t __48__BRCUploadSyncUpRequestsManager_dumpToContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) writeLineWithFormat:@"itemGlobalID = %@, requestData = %@", a2, a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIDToItemIDs, 0);
  objc_storeStrong((id *)&self->_requestsByItemGlobalID, 0);
  objc_storeStrong((id *)&self->_latestSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_personaIdentifer, 0);
}

- (void)finishRequestForItemsInZoneRowID:finishError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Finishing all requests under zone %@%@");
}

- (void)invalidateRequestsOfClient:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Invalidating state of client = %@%@");
}

@end