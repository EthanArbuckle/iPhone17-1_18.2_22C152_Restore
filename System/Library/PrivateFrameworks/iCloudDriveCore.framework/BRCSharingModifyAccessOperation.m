@interface BRCSharingModifyAccessOperation
- (BRCSharingModifyAccessOperation)initWithItem:(id)a3 allowAccess:(BOOL)a4 sessionContext:(id)a5;
- (id)createActivity;
- (void)main;
@end

@implementation BRCSharingModifyAccessOperation

- (BRCSharingModifyAccessOperation)initWithItem:(id)a3 allowAccess:(BOOL)a4 sessionContext:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [v9 itemID];
  v12 = [v11 debugItemIDString];
  v13 = [@"sharing/modifyAccess" stringByAppendingPathComponent:v12];

  v14 = [v9 serverZone];
  v15 = [v14 metadataSyncContext];
  v19.receiver = self;
  v19.super_class = (Class)BRCSharingModifyAccessOperation;
  v16 = [(_BRCOperation *)&v19 initWithName:v13 syncContext:v15 sessionContext:v10];

  if (v16)
  {
    [(_BRCOperation *)v16 setNonDiscretionary:1];
    objc_storeStrong((id *)&v16->_document, a3);
    v16->_allowAccess = a4;
    v17 = objc_msgSend(MEMORY[0x263EFD780], "br_sharingMisc");
    [(_BRCOperation *)v16 setGroup:v17];
  }
  return v16;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sharing/modifyAccess", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)main
{
  v23[1] = *MEMORY[0x263EF8340];
  v3 = [(BRCLocalItem *)self->_document itemID];
  v4 = [(BRCLocalItem *)self->_document serverZone];
  v5 = [v4 zoneID];
  v6 = [v3 contentsRecordIDInZoneID:v5];

  id v7 = objc_alloc(MEMORY[0x263EFD738]);
  BOOL allowAccess = self->_allowAccess;
  if (!self->_allowAccess)
  {
    id v9 = 0;
LABEL_5:
    v22 = v6;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    id v10 = (void *)[v7 initWithRecordIDsToGrantAccess:v9 recordIDsToRevokeAccess:v11];

    if (!allowAccess) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v23[0] = v6;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  if (!self->_allowAccess) {
    goto LABEL_5;
  }
  id v10 = (void *)[v7 initWithRecordIDsToGrantAccess:v9 recordIDsToRevokeAccess:0];
LABEL_6:

LABEL_7:
  if (self->_allowAccess)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __39__BRCSharingModifyAccessOperation_main__block_invoke;
    v21[3] = &unk_265085570;
    v21[4] = self;
    [v10 setRecordAccessGrantedBlock:v21];
  }
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __39__BRCSharingModifyAccessOperation_main__block_invoke_2;
  v18 = &unk_265085598;
  objc_super v19 = self;
  id v20 = v6;
  id v12 = v6;
  [v10 setRecordAccessCompletionBlock:&v15];
  v13 = objc_msgSend(v10, "callbackQueue", v15, v16, v17, v18, v19);
  v14 = [(_BRCOperation *)self callbackQueue];
  dispatch_set_target_queue(v13, v14);

  [(_BRCOperation *)self addSubOperation:v10];
}

void __39__BRCSharingModifyAccessOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 536);
  *(void *)(v8 + 536) = v6;
  id v12 = v6;

  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 544);
  *(void *)(v10 + 544) = v7;
}

void __39__BRCSharingModifyAccessOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v7 && !v8 && !v9)
  {
    v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __39__BRCSharingModifyAccessOperation_main__block_invoke_2_cold_2();
    }

    uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: no dict and no error");
  }
  if (v10)
  {
    v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
    {
      uint64_t v21 = *(void *)(a1 + 40);
      v22 = @"revoking";
      if (*(unsigned char *)(*(void *)(a1 + 32) + 528)) {
        v22 = @"granting";
      }
      int v23 = 138413058;
      v24 = v22;
      __int16 v25 = 2112;
      uint64_t v26 = v21;
      __int16 v27 = 2112;
      v28 = v10;
      __int16 v29 = 2112;
      v30 = v13;
      _os_log_error_impl(&dword_23FA42000, v14, (os_log_type_t)0x90u, "[ERROR] Failed %@ access to %@ - %@%@", (uint8_t *)&v23, 0x2Au);
    }

    [*(id *)(a1 + 32) completedWithResult:0 error:v10];
  }
  else
  {
    uint64_t v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __39__BRCSharingModifyAccessOperation_main__block_invoke_2_cold_1();
    }

    v17 = objc_opt_new();
    v18 = *(void **)(a1 + 32);
    uint64_t v19 = v18[67];
    if (v19)
    {
      [v17 setObject:v19 forKeyedSubscript:@"accessToken"];
      v18 = *(void **)(a1 + 32);
    }
    uint64_t v20 = v18[68];
    if (v20)
    {
      [v17 setObject:v20 forKeyedSubscript:@"referenceIdentifier"];
      v18 = *(void **)(a1 + 32);
    }
    [v18 completedWithResult:v17 error:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

void __39__BRCSharingModifyAccessOperation_main__block_invoke_2_cold_1()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_13_1();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_debug_impl(&dword_23FA42000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ access to %@%@", v4, 0x20u);
}

void __39__BRCSharingModifyAccessOperation_main__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no dict and no error%@", v2, v3, v4, v5, v6);
}

@end