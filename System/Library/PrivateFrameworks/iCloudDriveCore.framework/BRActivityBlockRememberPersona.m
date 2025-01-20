@interface BRActivityBlockRememberPersona
@end

@implementation BRActivityBlockRememberPersona

void ___BRActivityBlockRememberPersona_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = a2;
  v4 = (void *)MEMORY[0x2455D97F0]();
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v5 = *(id *)(a1 + 32)) == 0)
  {
    if (_block_invoke_2___personaOnceToken != -1) {
      dispatch_once(&_block_invoke_2___personaOnceToken, &__block_literal_global_196);
    }
    id v6 = (id)_block_invoke_2___personalPersona;
    int v7 = 1;
  }
  else
  {
    id v6 = v5;
    int v7 = 0;
  }
  v8 = [MEMORY[0x263F841B0] sharedManager];
  v9 = [v8 currentPersona];

  id v30 = 0;
  id v10 = [v9 userPersonaUniqueString];
  v11 = v10;
  if (v10 == v6 || ([v10 isEqualToString:v6] & 1) != 0) {
    goto LABEL_9;
  }
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v7 && ([v9 isDataSeparatedPersona] & 1) == 0)
    {
      v26 = brc_bread_crumbs();
      v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        __br_notify_register_dispatch_block_invoke_cold_4();
      }
    }
    else
    {
      v20 = brc_bread_crumbs();
      v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        __br_notify_register_dispatch_block_invoke_cold_3();
      }

      v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
      if (v12) {
        goto LABEL_25;
      }
    }
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v12 = 0;
    goto LABEL_10;
  }
  id v29 = 0;
  v13 = (void *)[v9 copyCurrentPersonaContextWithError:&v29];
  id v14 = v29;
  id v15 = v30;
  id v30 = v13;

  if (v14)
  {
    v16 = brc_bread_crumbs();
    v17 = brc_default_log();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
      -[BRCContainerScheduler syncContextDidBecomeForeground:]((uint64_t)v14);
    }
  }
  v12 = [v9 generateAndRestorePersonaContextWithPersonaUniqueString:v6];

  if (!v12) {
    goto LABEL_9;
  }
  v18 = brc_bread_crumbs();
  v19 = brc_default_log();
  if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
  {
    uint64_t v28 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v32 = v28;
    __int16 v33 = 2112;
    v34 = v12;
    __int16 v35 = 2112;
    v36 = v18;
    _os_log_error_impl(&dword_23FA42000, v19, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  v22 = brc_bread_crumbs();
  v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
    ___BRActivityBlockRememberPersona_block_invoke_cold_2();
  }

  if (!xpc_activity_set_state(v3, 3))
  {
    v24 = brc_bread_crumbs();
    v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      ___BRActivityBlockRememberPersona_block_invoke_cold_1();
    }
  }
LABEL_10:

  _BRRestorePersona();
}

void ___BRActivityBlockRememberPersona_block_invoke_2()
{
  id v2 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  v1 = (void *)_block_invoke_2___personalPersona;
  _block_invoke_2___personalPersona = v0;
}

void ___BRActivityBlockRememberPersona_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Failed to defer the activity after persona failure.%@", v2, v3, v4, v5, v6);
}

void ___BRActivityBlockRememberPersona_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Can't adopt persona for xpc activity, deferring the activity%@", v2, v3, v4, v5, v6);
}

@end