@interface BRCAccountMigrationChecker
- (void)perform;
@end

@implementation BRCAccountMigrationChecker

- (void)perform
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] No ACAccount found%@", v1, 0xCu);
}

void __37__BRCAccountMigrationChecker_perform__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(*(id *)(a1 + 32), "br_personaIdentifier");
  if ([v4 isEqualToString:@"__defaultPersonaID__"])
  {
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "br_personaIdentifier");
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      int v6 = 0;
      goto LABEL_8;
    }
  }
  if (WALRUS_LOCALIZATION_TABLE_block_invoke___personaOnceToken != -1) {
    dispatch_once(&WALRUS_LOCALIZATION_TABLE_block_invoke___personaOnceToken, &__block_literal_global_7);
  }
  id v5 = (id)WALRUS_LOCALIZATION_TABLE_block_invoke___personalPersona;
  int v6 = 1;
LABEL_8:
  v7 = [MEMORY[0x263F841B0] sharedManager];
  v8 = [v7 currentPersona];

  id v29 = 0;
  id v9 = [v8 userPersonaUniqueString];
  v10 = v9;
  if (v9 == v5 || ([v9 isEqualToString:v5] & 1) != 0)
  {
    v11 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v28 = 0;
    v16 = (void *)[v8 copyCurrentPersonaContextWithError:&v28];
    id v17 = v28;
    id v18 = v29;
    id v29 = v16;

    if (v17)
    {
      v19 = brc_bread_crumbs();
      v20 = brc_default_log();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
        -[_BRCOperation completedWithResult:error:]();
      }
    }
    v11 = [v8 generateAndRestorePersonaContextWithPersonaUniqueString:v5];

    if (v11)
    {
      v21 = brc_bread_crumbs();
      v22 = brc_default_log();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        v23 = objc_msgSend(*(id *)(a1 + 32), "br_personaIdentifier");
        *(_DWORD *)buf = 138412802;
        v31 = v23;
        __int16 v32 = 2112;
        v33 = v11;
        __int16 v34 = 2112;
        v35 = v21;
        _os_log_error_impl(&dword_23FA42000, v22, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_31:
    }
  }
  else
  {
    if (v6 && ([v8 isDataSeparatedPersona] & 1) == 0)
    {
      v21 = brc_bread_crumbs();
      v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        __br_notify_register_dispatch_block_invoke_cold_4();
      }
      v11 = 0;
      goto LABEL_31;
    }
    v24 = brc_bread_crumbs();
    v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      __br_notify_register_dispatch_block_invoke_cold_3();
    }

    v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
  }
LABEL_11:
  v12 = brc_bread_crumbs();
  v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __37__BRCAccountMigrationChecker_perform__block_invoke_cold_2(a2, (uint64_t)v12, v13);
  }

  v14 = +[BRCAccountsManager sharedManager];
  v15 = [v14 getOrCreateAccountHandlerForACAccount:*(void *)(a1 + 32)];

  if (!v15)
  {
    v26 = brc_bread_crumbs();
    v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      __29__BRCAccountMigrator_perform__block_invoke_cold_1();
    }
  }
  [v15 setMigrationStatus:a2 forDSID:*(void *)(*(void *)(a1 + 40) + 8) shouldUpdateAccount:1 completion:0];
  [*(id *)(a1 + 40) _close];

  _BRRestorePersona();
}

void __37__BRCAccountMigrationChecker_perform__block_invoke_2()
{
  id v2 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  v1 = (void *)WALRUS_LOCALIZATION_TABLE_block_invoke___personalPersona;
  WALRUS_LOCALIZATION_TABLE_block_invoke___personalPersona = v0;
}

void __37__BRCAccountMigrationChecker_perform__block_invoke_115(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCAccountMigrationChecker perform]_block_invoke", 247, v17);
  v10 = brc_bread_crumbs();
  v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v19 = v17[0];
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    v25 = v10;
    _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Request for CloudKit migration status done. response: %@, error: %@%@", buf, 0x2Au);
  }

  if (v8 && !v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = [v8 name];
    v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __37__BRCAccountMigrationChecker_perform__block_invoke_115_cold_1();
    }

    if (v12) {
      [v12 isEqualToString:*MEMORY[0x263F25630]];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v15 = +[BRCSystemResourcesManager manager];
    int v16 = [v15 isNetworkReachable];

    if (v16) {
      [*(id *)(*(void *)(a1 + 32) + 24) scheduleNextEvent];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  __brc_leave_section(v17);
}

void __37__BRCAccountMigrationChecker_perform__block_invoke_cold_2(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl(&dword_23FA42000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] migration status: %d%@", (uint8_t *)v3, 0x12u);
}

void __37__BRCAccountMigrationChecker_perform__block_invoke_115_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] migration state: %@%@");
}

@end