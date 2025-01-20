@interface BRCSideCarSyncDownOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCSideCarSyncDownOperation)initWithSession:(id)a3 changeToken:(id)a4;
- (id)createActivity;
- (void)_createSyncDownOperation;
- (void)_createZone;
- (void)_saveChangedRecords:(id)a3 deletedRecords:(id)a4 serverChangeToken:(id)a5 clientChangeToken:(id)a6;
- (void)main;
@end

@implementation BRCSideCarSyncDownOperation

- (BRCSideCarSyncDownOperation)initWithSession:(id)a3 changeToken:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 syncContextProvider];
  v10 = [v9 sideCarSyncContext];
  v13.receiver = self;
  v13.super_class = (Class)BRCSideCarSyncDownOperation;
  v11 = [(_BRCOperation *)&v13 initWithName:@"side-car-sync" syncContext:v10 sessionContext:v8];

  if (v11) {
    objc_storeStrong((id *)&v11->_serverChangeToken, a4);
  }

  return v11;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sync/side-car-fetch", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_createZone
{
  v3 = objc_msgSend(MEMORY[0x263EFD808], "brc_sideCarZoneID");
  objc_initWeak(&location, self);
  v4 = [BRCCreateZoneAndSubscribeOperation alloc];
  v5 = [(BRCSyncContext *)self->super._syncContext session];
  v6 = [(BRCCreateZoneAndSubscribeOperation *)v4 initWithSession:v5 zoneID:v3];

  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __42__BRCSideCarSyncDownOperation__createZone__block_invoke;
  v10 = &unk_26507EAC0;
  objc_copyWeak(&v11, &location);
  [(BRCCreateZoneAndSubscribeOperation *)v6 setCreateZoneAndSubscribeCompletionBlock:&v7];
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v6, v7, v8, v9, v10);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __42__BRCSideCarSyncDownOperation__createZone__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (v5) {
    [WeakRetained completedWithResult:0 error:v5];
  }
  else {
    [WeakRetained _createSyncDownOperation];
  }
}

- (void)_saveChangedRecords:(id)a3 deletedRecords:(id)a4 serverChangeToken:(id)a5 clientChangeToken:(id)a6
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0;
  v14 = [(BRCSyncContext *)self->super._syncContext session];
  v15 = objc_opt_new();
  if ([v13 length] == 8) {
    uint64_t v16 = *(void *)[v13 bytes];
  }
  else {
    uint64_t v16 = 0;
  }
  v17 = brc_bread_crumbs();
  v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    id v43 = v10;
    __int16 v44 = 2112;
    id v45 = v11;
    __int16 v46 = 2112;
    id v47 = v12;
    __int16 v48 = 2048;
    uint64_t v49 = v16;
    __int16 v50 = 2112;
    v51 = v17;
    _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Saving side car changed records %@\ndeleted record %@\nserver change token %@\nrequestID %llu%@", buf, 0x34u);
  }

  v19 = [v14 serverDB];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __102__BRCSideCarSyncDownOperation__saveChangedRecords_deletedRecords_serverChangeToken_clientChangeToken___block_invoke;
  v34[3] = &unk_26507EAE8;
  id v20 = v10;
  id v35 = v20;
  id v21 = v14;
  id v36 = v21;
  id v22 = v15;
  id v37 = v22;
  id v23 = v11;
  id v38 = v23;
  v39 = self;
  v40 = v41;
  [v19 performWithFlags:9 action:v34];

  v24 = [v21 clientDB];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __102__BRCSideCarSyncDownOperation__saveChangedRecords_deletedRecords_serverChangeToken_clientChangeToken___block_invoke_18;
  v28[3] = &unk_26507EB10;
  id v25 = v21;
  id v29 = v25;
  uint64_t v33 = v16;
  id v26 = v12;
  id v30 = v26;
  id v27 = v22;
  id v31 = v27;
  v32 = v41;
  [v24 performWithFlags:37 action:v28];

  _Block_object_dispose(v41, 8);
}

uint64_t __102__BRCSideCarSyncDownOperation__saveChangedRecords_deletedRecords_serverChangeToken_clientChangeToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
  id v45 = v3;
  uint64_t v49 = a1;
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v48 = *(void *)v63;
    do
    {
      uint64_t v6 = 0;
      uint64_t v46 = v5;
      do
      {
        if (*(void *)v63 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v62 + 1) + 8 * v6);
        uint64_t v8 = [v7 recordID];
        v9 = objc_msgSend((id)v8, "brc_itemIDWithSession:", *(void *)(a1 + 40));

        id v60 = 0;
        id v61 = 0;
        id v58 = 0;
        id v59 = 0;
        LOBYTE(v8) = [v7 deserializeSideCarInfo:&v61 error:&v58];
        id v10 = v58;
        if (v8)
        {
          if ([v61 favoriteRank])
          {
            id v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v61, "favoriteRank"));
          }
          else
          {
            id v11 = 0;
          }
          if ([v61 lastUsedTime])
          {
            id v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v61, "lastUsedTime"));
          }
          else
          {
            id v12 = 0;
          }
          id v13 = [v61 finderTags];
          if ([v7 locateSideCarServerZone:&v60 shareRecordName:&v59 withSession:*(void *)(a1 + 40)])
          {
            v14 = [v61 ckInfo];
            v15 = [v60 dbRowID];
            [v3 execute:@"UPDATE server_items SET item_favoriterank = %@, item_lastusedtime = %@, item_finder_tags = %@, item_side_car_ckinfo = %@, item_rank = NULL WHERE zone_rowid = %@ AND item_id = %@", v11, v12, v13, v14, v15, v9];

            if ([v3 changes])
            {
              a1 = v49;
              [*(id *)(v49 + 48) addObject:v60];
LABEL_24:

              uint64_t v5 = v46;
              goto LABEL_25;
            }
LABEL_19:
            uint64_t v16 = [v7 recordID];
            v17 = [v16 recordName];
            id v18 = v59;
            v19 = [v61 ckInfo];
            id v44 = v18;
            id v3 = v45;
            [v45 execute:@"INSERT OR REPLACE INTO side_car_lookahead (record_name, root_alias_record_name, item_favoriterank, item_lastusedtime, item_side_car_ckinfo, item_finder_tags) VALUES (%@, %@, %@, %@, %@, %@)", v17, v44, v11, v12, v19, v13];
          }
          else
          {
            if (v59) {
              goto LABEL_19;
            }
            id v20 = brc_bread_crumbs();
            id v21 = brc_default_log();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v69 = v7;
              __int16 v70 = 2112;
              v71 = v20;
              _os_log_fault_impl(&dword_23FA42000, v21, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't parse alias record name for %@%@", buf, 0x16u);
            }
          }
          a1 = v49;
          goto LABEL_24;
        }
        id v11 = brc_bread_crumbs();
        id v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v69 = v7;
          __int16 v70 = 2112;
          v71 = v11;
          _os_log_fault_impl(&dword_23FA42000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't deserialize side car info on %@%@", buf, 0x16u);
        }
LABEL_25:

        ++v6;
      }
      while (v5 != v6);
      uint64_t v5 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
    }
    while (v5);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v22 = *(id *)(a1 + 56);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v55 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v28 = [*(id *)(*(void *)(v49 + 64) + 248) session];
        id v29 = objc_msgSend(v27, "brc_itemIDWithSession:", v28);

        id v61 = 0;
        if ([v27 locateSideCarServerZone:&v61 withSession:*(void *)(v49 + 40)])
        {
          id v30 = [v61 dbRowID];
          [v3 execute:@"UPDATE server_items SET item_favoriterank = NULL, item_lastusedtime = NULL, item_finder_tags = NULL, item_side_car_ckinfo = NULL, item_rank = NULL WHERE zone_rowid = %@ AND item_id = %@", v30, v29];

          if ([v3 changes])
          {
            [*(id *)(v49 + 48) addObject:v61];
          }
          else
          {
            uint64_t v33 = [v27 recordName];
            [v3 execute:@"DELETE FROM side_car_lookahead WHERE record_name = %@", v33];
          }
        }
        else
        {
          id v31 = brc_bread_crumbs();
          v32 = brc_default_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v69 = v27;
            __int16 v70 = 2112;
            v71 = v31;
            _os_log_debug_impl(&dword_23FA42000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring deleted recordID where we couldn't locate the server zone %@%@", buf, 0x16u);
          }
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v24);
  }

  if ([*(id *)(v49 + 48) count])
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v34 = *(id *)(v49 + 48);
    uint64_t v35 = [v34 countByEnumeratingWithState:&v50 objects:v66 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v51;
      while (2)
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v51 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v50 + 1) + 8 * j);
          if (([v39 allocateRanksWhenCaughtUp:1] & 1) == 0)
          {
            v41 = brc_bread_crumbs();
            v42 = brc_default_log();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
              __102__BRCSideCarSyncDownOperation__saveChangedRecords_deletedRecords_serverChangeToken_clientChangeToken___block_invoke_cold_1();
            }

            uint64_t v40 = 0;
            goto LABEL_54;
          }
          [*(id *)(v49 + 40) saveServerZoneToDB:v39];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v50 objects:v66 count:16];
        if (v36) {
          continue;
        }
        break;
      }
    }

    id v34 = [*(id *)(v49 + 40) serverState];
    *(void *)(*(void *)(*(void *)(v49 + 72) + 8) + 24) = [v34 nextRank];
    uint64_t v40 = 1;
LABEL_54:
  }
  else
  {
    uint64_t v40 = 1;
  }

  return v40;
}

uint64_t __102__BRCSideCarSyncDownOperation__saveChangedRecords_deletedRecords_serverChangeToken_clientChangeToken___block_invoke_18(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  os_activity_t v2 = [*(id *)(a1 + 32) containerScheduler];
  id v3 = [v2 sideCarSyncPersistedState];

  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = [v3 requestID];
  if (v4 == v5)
  {
    uint64_t v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __102__BRCSideCarSyncDownOperation__saveChangedRecords_deletedRecords_serverChangeToken_clientChangeToken___block_invoke_18_cold_1((void *)(a1 + 64), (uint64_t)v6, v7);
    }
  }
  else
  {
    uint64_t v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 134218498;
      uint64_t v34 = v8;
      __int16 v35 = 2048;
      uint64_t v36 = [v3 requestID];
      __int16 v37 = 2112;
      id v38 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking sync request in side care zone as failed because requestIDs differ %lld vs %lld%@", buf, 0x20u);
    }
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v9 = [*(id *)(a1 + 32) itemsWithSideCarInFlightDiffsEnumerator];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (v4 == v5) {
          [v14 markLatestSyncRequestAcknowledgedInZone:&unk_26F3DD070];
        }
        else {
          [v14 markLatestSyncRequestFailedInZone:&unk_26F3DD070];
        }
        [v14 saveToDBForServerEdit:1 keepAliases:1];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  [v3 updateWithServerChangeToken:*(void *)(a1 + 40) requestID:*(void *)(a1 + 64)];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = *(id *)(a1 + 48);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * j);
        id v21 = objc_msgSend(*(id *)(a1 + 32), "applyScheduler", (void)v23);
        [v21 generatedRanksForZone:v20 upToRank:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  return 1;
}

- (void)_createSyncDownOperation
{
  v36[1] = *MEMORY[0x263EF8340];
  id v3 = +[BRCUserDefaults defaultsForSideCar];
  uint64_t v4 = objc_opt_new();
  [v4 setPreviousServerChangeToken:self->_serverChangeToken];
  objc_msgSend(v4, "setResultsLimit:", objc_msgSend(v3, "maxRecordCountInFetchRecordsOperation"));
  uint64_t v5 = [MEMORY[0x263EFD7C8] desiredKeysWithMask:185];
  [v4 setDesiredKeys:v5];

  uint64_t v6 = objc_msgSend(MEMORY[0x263EFD808], "brc_sideCarZoneID");
  id v7 = objc_alloc(MEMORY[0x263EFD6B8]);
  v36[0] = v6;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:1];
  uint64_t v34 = v6;
  __int16 v35 = v4;
  v9 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  uint64_t v10 = (void *)[v7 initWithRecordZoneIDs:v8 configurationsByRecordZoneID:v9];

  [v10 setShouldFetchAssetContents:0];
  objc_msgSend(v10, "setFetchAllChanges:", objc_msgSend(v3, "shouldFetchAllChanges"));
  uint64_t v11 = objc_opt_new();
  uint64_t v12 = objc_opt_new();
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke;
  v31[3] = &unk_26507EB38;
  id v13 = v12;
  id v32 = v13;
  id v14 = v11;
  id v33 = v14;
  [v10 setRecordChangedBlock:v31];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_28;
  v28[3] = &unk_26507EB60;
  id v15 = v13;
  id v29 = v15;
  id v16 = v14;
  id v30 = v16;
  [v10 setRecordWithIDWasDeletedBlock:v28];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_30;
  v25[3] = &unk_26507EB88;
  v25[4] = self;
  id v17 = v16;
  id v26 = v17;
  id v18 = v15;
  id v27 = v18;
  [v10 setRecordZoneChangeTokensUpdatedBlock:v25];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_2;
  v22[3] = &unk_26507EBB0;
  v22[4] = self;
  id v23 = v17;
  id v24 = v18;
  id v19 = v18;
  id v20 = v17;
  [v10 setRecordZoneFetchCompletionBlock:v22];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_3;
  v21[3] = &unk_26507EBD8;
  v21[4] = self;
  [v10 setFetchRecordZoneChangesCompletionBlock:v21];
  [(_BRCOperation *)self addSubOperation:v10];
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordType];
  char v5 = [v4 isEqualToString:@"perParticipantMetadata"];

  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = [v3 recordID];
    LODWORD(v6) = [v6 containsObject:v7];

    if (v6)
    {
      id v16 = brc_bread_crumbs();
      id v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_cold_2();
      }
    }
    uint64_t v8 = *(void **)(a1 + 40);
    v9 = [v3 recordID];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];

    if (v10)
    {
      id v18 = brc_bread_crumbs();
      id v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_cold_1();
      }
    }
    uint64_t v11 = *(void **)(a1 + 40);
    uint64_t v12 = [v3 recordID];
    [v11 setObject:v3 forKeyedSubscript:v12];

    id v13 = *(void **)(a1 + 32);
    id v14 = [v3 recordID];
    [v13 removeObject:v14];
  }
  else
  {
    id v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_cold_3(v3, (uint64_t)v14, v15);
    }
  }
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 isEqualToString:@"perParticipantMetadata"])
  {
    if ([*(id *)(a1 + 32) containsObject:v5])
    {
      uint64_t v10 = brc_bread_crumbs();
      uint64_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_28_cold_2();
      }
    }
    id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];

    if (v7)
    {
      uint64_t v12 = brc_bread_crumbs();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_28_cold_1();
      }
    }
    [*(id *)(a1 + 40) setObject:0 forKeyedSubscript:v5];
    [*(id *)(a1 + 32) addObject:v5];
  }
  else
  {
    uint64_t v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_28_cold_3();
    }
  }
}

uint64_t __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_30(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v7 allValues];
  [v6 _saveChangedRecords:v10 deletedRecords:*(void *)(a1 + 48) serverChangeToken:v9 clientChangeToken:v8];

  [*(id *)(a1 + 40) removeAllObjects];
  uint64_t v11 = *(void **)(a1 + 48);
  return [v11 removeAllObjects];
}

uint64_t __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_2(uint64_t result, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  if (!a6)
  {
    uint64_t v8 = result;
    id v9 = *(void **)(result + 32);
    uint64_t v10 = *(void **)(result + 40);
    id v11 = a4;
    id v12 = a3;
    id v13 = [v10 allValues];
    [v9 _saveChangedRecords:v13 deletedRecords:*(void *)(v8 + 48) serverChangeToken:v12 clientChangeToken:v11];

    [*(id *)(v8 + 40) removeAllObjects];
    id v14 = *(void **)(v8 + 48);
    return [v14 removeAllObjects];
  }
  return result;
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_3_cold_1();
  }

  [*(id *)(a1 + 32) completedWithResult:0 error:v3];
}

- (void)main
{
  if (self->_serverChangeToken) {
    [(BRCSideCarSyncDownOperation *)self _createSyncDownOperation];
  }
  else {
    [(BRCSideCarSyncDownOperation *)self _createZone];
  }
}

- (void).cxx_destruct
{
}

void __102__BRCSideCarSyncDownOperation__saveChangedRecords_deletedRecords_serverChangeToken_clientChangeToken___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: failed to alloc ranks when syncing down side cars for %@%@", v1, 0x16u);
}

void __102__BRCSideCarSyncDownOperation__saveChangedRecords_deletedRecords_serverChangeToken_clientChangeToken___block_invoke_18_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 134218242;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_23FA42000, a2, a3, "[DEBUG] Succeeded in syncing up the side car zone with requestID %lld%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: sideCarRecordsByRecordID[record.recordID] == nil%@", v2, v3, v4, v5, v6);
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: ![deletedRecordIDs containsObject:record.recordID]%@", v2, v3, v4, v5, v6);
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 recordType];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring record of unknown type %@%@", (uint8_t *)&v6, 0x16u);
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: sideCarRecordsByRecordID[recordID] == nil%@", v2, v3, v4, v5, v6);
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_28_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: ![deletedRecordIDs containsObject:recordID]%@", v2, v3, v4, v5, v6);
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_28_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Ignoring record of unknown type %@%@");
}

void __55__BRCSideCarSyncDownOperation__createSyncDownOperation__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Finished syncing down side cars - %@%@");
}

@end