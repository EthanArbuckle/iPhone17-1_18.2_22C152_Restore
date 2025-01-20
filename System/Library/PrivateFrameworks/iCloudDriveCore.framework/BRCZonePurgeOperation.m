@interface BRCZonePurgeOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCZonePurgeOperation)initWithServerZone:(id)a3 sessionContext:(id)a4;
- (id)createActivity;
- (void)main;
@end

@implementation BRCZonePurgeOperation

- (BRCZonePurgeOperation)initWithServerZone:(id)a3 sessionContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 session];
  v10 = [v9 syncContextProvider];
  v11 = [v10 defaultSyncContext];
  v14.receiver = self;
  v14.super_class = (Class)BRCZonePurgeOperation;
  v12 = [(_BRCOperation *)&v14 initWithName:@"sync/zone-purge" syncContext:v11 sessionContext:v8];

  if (v12)
  {
    objc_storeStrong((id *)&v12->_serverZone, a3);
    [(_BRCOperation *)v12 setNonDiscretionary:1];
  }

  return v12;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sync/zone-purge", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)main
{
  v38[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = self->_serverZone;
  v5 = [(BRCServerZone *)self->_serverZone session];
  dispatch_group_t v6 = dispatch_group_create();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __29__BRCZonePurgeOperation_main__block_invoke;
  v33[3] = &unk_265083DA0;
  id v7 = v4;
  v34 = v7;
  id v8 = v3;
  id v35 = v8;
  [v5 enumerateServerZones:v33];
  id v9 = objc_alloc(MEMORY[0x263EFD740]);
  v10 = [(BRCServerZone *)v7 zoneID];
  v38[0] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
  v12 = (void *)[v9 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v11];

  [v12 setMarkZonesAsUserPurged:1];
  v13 = [v12 callbackQueue];
  objc_super v14 = [(_BRCOperation *)self callbackQueue];
  dispatch_set_target_queue(v13, v14);

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __29__BRCZonePurgeOperation_main__block_invoke_2;
  v29[3] = &unk_265083DC8;
  v32 = v36;
  v29[4] = self;
  v15 = v7;
  v30 = v15;
  v16 = v6;
  v31 = v16;
  [v12 setModifyRecordZonesCompletionBlock:v29];
  dispatch_group_enter(v16);
  [(_BRCOperation *)self addSubOperation:v12];
  if ([v8 count])
  {
    v17 = (void *)[objc_alloc(MEMORY[0x263EFD740]) initWithRecordZonesToSave:0 recordZoneIDsToDelete:v8];

    v18 = [v17 callbackQueue];
    v19 = [(_BRCOperation *)self callbackQueue];
    dispatch_set_target_queue(v18, v19);

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __29__BRCZonePurgeOperation_main__block_invoke_5;
    v25[3] = &unk_265083DC8;
    v28 = v36;
    v25[4] = self;
    v26 = v15;
    v20 = v16;
    v27 = v20;
    [v17 setModifyRecordZonesCompletionBlock:v25];
    dispatch_group_enter(v20);
    v21 = [v5 syncContextProvider];
    v22 = [v21 sharedMetadataSyncContext];
    [(_BRCOperation *)self addSubOperation:v17 overrideContext:v22 allowsCellularAccess:0];
  }
  else
  {
    v17 = v12;
  }
  v23 = [(_BRCOperation *)self callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__BRCZonePurgeOperation_main__block_invoke_6;
  block[3] = &unk_265081558;
  block[4] = self;
  block[5] = v36;
  dispatch_group_notify(v16, v23, block);

  _Block_object_dispose(v36, 8);
}

uint64_t __29__BRCZonePurgeOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSharedZone])
  {
    v4 = [v3 zoneName];
    v5 = [*(id *)(a1 + 32) zoneName];
    int v6 = [v4 isEqualToString:v5];

    if (v6)
    {
      id v7 = *(void **)(a1 + 40);
      id v8 = [v3 zoneID];
      [v7 addObject:v8];
    }
  }

  return 1;
}

void __29__BRCZonePurgeOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    if (!*(unsigned char *)(v10 + 24))
    {
      *(unsigned char *)(v10 + 24) = 1;
      [*(id *)(a1 + 32) completedWithResult:0 error:v9];
    }
  }
  else
  {
    v11 = brc_bread_crumbs();
    v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __29__BRCZonePurgeOperation_main__block_invoke_2_cold_1();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __29__BRCZonePurgeOperation_main__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    if (!*(unsigned char *)(v10 + 24))
    {
      *(unsigned char *)(v10 + 24) = 1;
      [*(id *)(a1 + 32) completedWithResult:0 error:v9];
    }
  }
  else
  {
    v11 = brc_bread_crumbs();
    v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __29__BRCZonePurgeOperation_main__block_invoke_5_cold_1();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __29__BRCZonePurgeOperation_main__block_invoke_6(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return [*(id *)(result + 32) completedWithResult:0 error:0];
  }
  return result;
}

- (void).cxx_destruct
{
}

void __29__BRCZonePurgeOperation_main__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] deleted %@ on server%@");
}

void __29__BRCZonePurgeOperation_main__block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] deleted shared zones associated to %@ on server%@");
}

@end