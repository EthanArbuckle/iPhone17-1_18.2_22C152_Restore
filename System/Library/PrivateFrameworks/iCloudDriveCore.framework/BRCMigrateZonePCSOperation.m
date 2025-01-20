@interface BRCMigrateZonePCSOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCMigrateZonePCSOperation)initWithSession:(id)a3;
- (void)_createCloudDocsZone:(id)a3;
- (void)_fetchZonesNeedingMigration:(id)a3;
- (void)main;
@end

@implementation BRCMigrateZonePCSOperation

- (BRCMigrateZonePCSOperation)initWithSession:(id)a3
{
  id v4 = a3;
  v5 = [v4 syncContextProvider];
  v6 = [v5 defaultSyncContext];
  v11.receiver = self;
  v11.super_class = (Class)BRCMigrateZonePCSOperation;
  v7 = [(_BRCOperation *)&v11 initWithName:@"migrate-pcs" syncContext:v6 sessionContext:v4];

  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    interestingZoneIDs = v7->_interestingZoneIDs;
    v7->_interestingZoneIDs = (NSMutableArray *)v8;
  }
  return v7;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isCloudKitErrorZoneMigrated") ^ 1;
}

- (void)_createCloudDocsZone:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFD808]);
  v6 = (void *)[v5 initWithZoneName:*MEMORY[0x263F324E8] ownerName:*MEMORY[0x263EFD488]];
  v7 = [BRCCreateZoneAndSubscribeOperation alloc];
  uint64_t v8 = [(BRCSyncContext *)self->super._syncContext session];
  v9 = [(BRCCreateZoneAndSubscribeOperation *)v7 initWithSession:v8 zoneID:v6];

  [(BRCCreateZoneAndSubscribeOperation *)v9 setSubscriptionOnly:0];
  [(BRCCreateZoneAndSubscribeOperation *)v9 setOptimisticSubscribe:1];
  objc_initWeak(&location, v9);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__BRCMigrateZonePCSOperation__createCloudDocsZone___block_invoke;
  v12[3] = &unk_2650849A0;
  objc_copyWeak(&v16, &location);
  id v10 = v6;
  id v13 = v10;
  id v11 = v4;
  v14 = self;
  id v15 = v11;
  [(BRCCreateZoneAndSubscribeOperation *)v9 setCreateZoneAndSubscribeCompletionBlock:v12];
  [(_BRCOperation *)self addSubOperation:v9];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __51__BRCMigrateZonePCSOperation__createCloudDocsZone___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained createdZone];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)[objc_alloc(MEMORY[0x263EFD7F8]) initWithZoneID:*(void *)(a1 + 32)];
  }
  uint64_t v8 = v7;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_fetchZonesNeedingMigration:(id)a3
{
  id v4 = a3;
  id v5 = +[BRCUserDefaults defaultsForMangledID:0];
  v6 = [v5 blacklistPCSPrep];

  id v7 = objc_alloc(MEMORY[0x263EFD808]);
  uint64_t v8 = (void *)[v7 initWithZoneName:*MEMORY[0x263F324E8] ownerName:*MEMORY[0x263EFD488]];
  v9 = [MEMORY[0x263EFD6D0] fetchAllRecordZonesOperation];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __58__BRCMigrateZonePCSOperation__fetchZonesNeedingMigration___block_invoke;
  id v16 = &unk_2650849F0;
  id v17 = v8;
  id v18 = v6;
  v19 = self;
  id v20 = v4;
  id v10 = v4;
  id v11 = v6;
  id v12 = v8;
  [v9 setFetchRecordZonesCompletionBlock:&v13];
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v9, v13, v14, v15, v16);
}

void __58__BRCMigrateZonePCSOperation__fetchZonesNeedingMigration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  unint64_t v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__39;
  v23 = __Block_byref_object_dispose__39;
  id v24 = 0;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __58__BRCMigrateZonePCSOperation__fetchZonesNeedingMigration___block_invoke_15;
  uint64_t v14 = &unk_2650849C8;
  id v15 = *(id *)(a1 + 32);
  id v18 = &v19;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v16 = v7;
  uint64_t v17 = v8;
  [v5 enumerateKeysAndObjectsUsingBlock:&v11];
  uint64_t v10 = v20[5];
  if (v6 | v10) {
    (*(void (**)(void, void, uint64_t, unint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(*(void *)(a1 + 48) + 504), v10, v6, v9);
  }
  else {
    objc_msgSend(*(id *)(a1 + 48), "_createCloudDocsZone:", *(void *)(a1 + 56), v11, v12, v13, v14, v15);
  }

  _Block_object_dispose(&v19, 8);
}

void __58__BRCMigrateZonePCSOperation__fetchZonesNeedingMigration___block_invoke_15(void *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v10 isEqual:a1[4]])
  {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
  }
  else
  {
    unint64_t v6 = (void *)a1[5];
    id v7 = [v10 zoneName];
    if ([v6 containsObject:v7])
    {
    }
    else
    {
      uint64_t v8 = [v10 ownerName];
      int v9 = [v8 isEqualToString:*MEMORY[0x263EFD488]];

      if (v9) {
        [*(id *)(a1[6] + 504) addObject:v10];
      }
    }
  }
}

- (void)main
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __34__BRCMigrateZonePCSOperation_main__block_invoke;
  v2[3] = &unk_265084A40;
  v2[4] = self;
  [(BRCMigrateZonePCSOperation *)self _fetchZonesNeedingMigration:v2];
}

void __34__BRCMigrateZonePCSOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      uint64_t v19 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v23 = v19;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      v27 = v10;
      _os_log_error_impl(&dword_23FA42000, v11, (os_log_type_t)0x90u, "[ERROR] Failed fetching zones to prep PCS for %@ - %@%@", buf, 0x20u);
    }

    [*(id *)(a1 + 32) completedWithResult:0 error:v9];
  }
  else
  {
    if ([v7 count])
    {
      uint64_t v12 = brc_bread_crumbs();
      uint64_t v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v23 = v7;
        __int16 v24 = 2112;
        id v25 = v8;
        __int16 v26 = 2112;
        v27 = v12;
        _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Prepping PCS for %@ -> %@%@", buf, 0x20u);
      }

      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263EFD5D0]) initWithSourceZoneIDs:v7 targetZone:v8];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __34__BRCMigrateZonePCSOperation_main__block_invoke_22;
      v20[3] = &unk_265084A18;
      v20[4] = *(void *)(a1 + 32);
      [v14 setAggregateZonePCSCompletionBlock:v20];
      [*(id *)(a1 + 32) addSubOperation:v14];
    }
    else
    {
      id v15 = brc_bread_crumbs();
      id v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __34__BRCMigrateZonePCSOperation_main__block_invoke_cold_1((uint64_t)v15, v16);
      }

      uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 248) session];
      uint64_t v17 = [v14 clientDB];
      id v18 = [v17 serialQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __34__BRCMigrateZonePCSOperation_main__block_invoke_18;
      block[3] = &unk_26507ED70;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(v18, block);
    }
  }
}

uint64_t __34__BRCMigrateZonePCSOperation_main__block_invoke_18(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 248) session];
  [v2 setNeedsPCSMigration:0];

  v3 = *(void **)(a1 + 32);
  uint64_t v4 = MEMORY[0x263EFFA88];
  return [v3 completedWithResult:v4 error:0];
}

void __34__BRCMigrateZonePCSOperation_main__block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6 && !objc_msgSend(v6, "brc_isCloudKitErrorZoneMigrated"))
  {
    uint64_t v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
    {
      uint64_t v19 = *(__CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v22 = v19;
      __int16 v23 = 2112;
      __int16 v24 = v7;
      __int16 v25 = 2112;
      __int16 v26 = v13;
      _os_log_error_impl(&dword_23FA42000, v14, (os_log_type_t)0x90u, "[ERROR] Failed migrating PCS for %@ - %@%@", buf, 0x20u);
    }
  }
  else
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = @"not needed";
      id v18 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      if (!v7) {
        uint64_t v17 = @"complete";
      }
      v22 = v17;
      __int16 v23 = 2112;
      __int16 v24 = v18;
      __int16 v25 = 2112;
      __int16 v26 = v8;
      _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] PCS migration %@ for %@%@", buf, 0x20u);
    }

    id v10 = [*(id *)(*(void *)(a1 + 32) + 248) session];
    uint64_t v11 = [v10 clientDB];
    uint64_t v12 = [v11 serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__BRCMigrateZonePCSOperation_main__block_invoke_29;
    block[3] = &unk_26507ED70;
    block[4] = *(void *)(a1 + 32);
    dispatch_sync(v12, block);

    id v7 = 0;
  }
  id v15 = *(void **)(a1 + 32);
  id v16 = [NSNumber numberWithInt:v7 == 0];
  [v15 completedWithResult:v16 error:v7];
}

void __34__BRCMigrateZonePCSOperation_main__block_invoke_29(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 248) session];
  [v1 setNeedsPCSMigration:0];
}

- (void).cxx_destruct
{
}

void __34__BRCMigrateZonePCSOperation_main__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23FA42000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] No zones need PCS prep currently%@", (uint8_t *)&v2, 0xCu);
}

@end