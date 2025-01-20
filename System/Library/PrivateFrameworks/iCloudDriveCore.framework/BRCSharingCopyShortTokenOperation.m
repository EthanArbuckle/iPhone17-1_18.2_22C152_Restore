@interface BRCSharingCopyShortTokenOperation
- (BRCSharingCopyShortTokenOperation)initWithItem:(id)a3 sessionContext:(id)a4;
- (id)createActivity;
- (void)main;
@end

@implementation BRCSharingCopyShortTokenOperation

- (BRCSharingCopyShortTokenOperation)initWithItem:(id)a3 sessionContext:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263EFD7E8];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initShareIDWithShareableItem:v8];
  v10 = [v8 baseRecord];
  v11 = (void *)[objc_alloc(MEMORY[0x263EFD840]) initWithRootRecord:v10 shareID:v9];
  v12 = [v8 st];
  v13 = [v12 logicalName];
  objc_msgSend(v11, "brc_updateWithLogicalName:isFolder:", v13, 0);

  v14 = objc_msgSend(MEMORY[0x263EFD780], "br_sharingMisc");
  [(_BRCOperation *)self setGroup:v14];

  v15 = [v9 recordName];
  v16 = [@"sharing/copy-shortToken" stringByAppendingPathComponent:v15];

  v17 = [v8 serverZone];

  v20.receiver = self;
  v20.super_class = (Class)BRCSharingCopyShortTokenOperation;
  v18 = [(BRCSharingModifyShareOperation *)&v20 initWithName:v16 zone:v17 share:v11 sessionContext:v7];

  return v18;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sharing/copy-shortToken", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)main
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __41__BRCSharingCopyShortTokenOperation_main__block_invoke;
  v2[3] = &unk_26507F540;
  v2[4] = self;
  [(BRCSharingModifyShareOperation *)self _performAfterPreparingSharingIdentityIfNecessaryWhenWantRoutingKey:1 completion:v2];
}

void __41__BRCSharingCopyShortTokenOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = *(id **)(a1 + 32);
  if (v4)
  {
    [v5 completedWithResult:0 error:v4];
  }
  else
  {
    v6 = [v5[66] shortToken];
    if (v6)
    {
      id v4 = 0;
    }
    else
    {
      id v7 = brc_bread_crumbs();
      id v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        __41__BRCSharingCopyShortTokenOperation_main__block_invoke_cold_1();
      }

      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: No short token found on record");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    [*(id *)(a1 + 32) completedWithResult:v6 error:v4];
  }
}

void __41__BRCSharingCopyShortTokenOperation_main__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: No short token found on record%@", v2, v3, v4, v5, v6);
}

@end