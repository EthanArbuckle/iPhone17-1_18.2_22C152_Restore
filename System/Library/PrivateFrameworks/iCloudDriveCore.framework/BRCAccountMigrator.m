@interface BRCAccountMigrator
- (void)perform;
@end

@implementation BRCAccountMigrator

- (void)perform
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  memset(v19, 0, sizeof(v19));
  __brc_create_section(0, (uint64_t)"-[BRCAccountMigrator perform]", 180, v19);
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    dsid = self->super._dsid;
    *(_DWORD *)buf = 134218498;
    uint64_t v21 = v19[0];
    __int16 v22 = 2112;
    v23 = dsid;
    __int16 v24 = 2112;
    v25 = v3;
    _os_log_debug_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx performing migration for %@%@", buf, 0x20u);
  }

  v5 = [MEMORY[0x263EFB210] defaultStore];
  v6 = objc_msgSend(v5, "br_appleAccountWithPersonID:", self->super._dsid);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __29__BRCAccountMigrator_perform__block_invoke;
  v16[3] = &unk_26507ED98;
  id v7 = v6;
  id v17 = v7;
  v18 = self;
  v8 = (void *)MEMORY[0x2455D9A50](v16);
  if (v7)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F257C8]) initWithAccount:v7];
    BRSetupAARequest(v9);
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __29__BRCAccountMigrator_perform__block_invoke_100;
    v13[3] = &unk_26507F568;
    id v15 = v8;
    v13[4] = self;
    v11 = v10;
    v14 = v11;
    [v9 performRequestWithHandler:v13];
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
  __brc_leave_section(v19);
}

void __29__BRCAccountMigrator_perform__block_invoke(uint64_t a1)
{
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __29__BRCAccountMigrator_perform__block_invoke_cold_2();
  }

  v4 = +[BRCAccountsManager sharedManager];
  v5 = [*(id *)(a1 + 32) identifier];
  v6 = [v4 accountHandlerForACAccountID:v5];

  if (!v6)
  {
    id v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __29__BRCAccountMigrator_perform__block_invoke_cold_1();
    }
  }
  [v6 setMigrationStatus:3 forDSID:*(void *)(*(void *)(a1 + 40) + 8) shouldUpdateAccount:1 completion:0];
  [*(id *)(a1 + 40) _close];
}

void __29__BRCAccountMigrator_perform__block_invoke_100(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v9 = [v8 error];
  }
  memset(v19, 0, sizeof(v19));
  __brc_create_section(0, (uint64_t)"-[BRCAccountMigrator perform]_block_invoke", 200, v19);
  dispatch_semaphore_t v10 = brc_bread_crumbs();
  v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v21 = v19[0];
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    v27 = v10;
    _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Setting migration state. response: %@, error: %@%@", buf, 0x2Au);
  }

  if (!v8
    || v9
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([v8 status],
        v12 = objc_claimAutoreleasedReturnValue(),
        BOOL v13 = [v12 integerValue] == -1,
        v12,
        v13))
  {
    id v17 = +[BRCSystemResourcesManager manager];
    int v18 = [v17 isNetworkReachable];

    if (v18) {
      [*(id *)(*(void *)(a1 + 32) + 24) scheduleNextEvent];
    }
  }
  else
  {
    v14 = [v8 status];
    id v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __29__BRCAccountMigrator_perform__block_invoke_100_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  __brc_leave_section(v19);
}

void __29__BRCAccountMigrator_perform__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: handler%@", v2, v3, v4, v5, v6);
}

void __29__BRCAccountMigrator_perform__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] migration completed%@", v2, v3, v4, v5, v6);
}

void __29__BRCAccountMigrator_perform__block_invoke_100_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] status: %@%@");
}

@end