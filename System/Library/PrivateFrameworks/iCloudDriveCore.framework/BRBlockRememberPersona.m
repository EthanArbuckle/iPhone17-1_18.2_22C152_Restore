@interface BRBlockRememberPersona
@end

@implementation BRBlockRememberPersona

void ___BRBlockRememberPersona_block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (_block_invoke___personaOnceToken_2 != -1) {
      dispatch_once(&_block_invoke___personaOnceToken_2, &__block_literal_global_194);
    }
    id v3 = (id)_block_invoke___personalPersona_2;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  v5 = [MEMORY[0x263F841B0] sharedManager];
  v6 = [v5 currentPersona];

  id v25 = 0;
  id v7 = [v6 userPersonaUniqueString];
  v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0) {
    goto LABEL_9;
  }
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      v21 = brc_bread_crumbs();
      v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        __br_notify_register_dispatch_block_invoke_cold_4();
      }
    }
    else
    {
      v17 = brc_bread_crumbs();
      v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __br_notify_register_dispatch_block_invoke_cold_3();
      }

      v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
      if (v14) {
        goto LABEL_25;
      }
    }
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  id v24 = 0;
  v9 = (void *)[v6 copyCurrentPersonaContextWithError:&v24];
  id v10 = v24;
  id v11 = v25;
  id v25 = v9;

  if (v10)
  {
    v12 = brc_bread_crumbs();
    v13 = brc_default_log();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
      -[BRCContainerScheduler syncContextDidBecomeForeground:]((uint64_t)v10);
    }
  }
  v14 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

  if (!v14) {
    goto LABEL_9;
  }
  v15 = brc_bread_crumbs();
  v16 = brc_default_log();
  if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v23;
    __int16 v28 = 2112;
    v29 = v14;
    __int16 v30 = 2112;
    v31 = v15;
    _os_log_error_impl(&dword_23FA42000, v16, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  v19 = brc_bread_crumbs();
  v20 = brc_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    ___BRBlockRememberPersona_block_invoke_cold_1();
  }

LABEL_10:
  _BRRestorePersona();
}

void ___BRBlockRememberPersona_block_invoke_2()
{
  id v2 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  v1 = (void *)_block_invoke___personalPersona_2;
  _block_invoke___personalPersona_2 = v0;
}

void ___BRBlockRememberPersona_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Failed to adopt persona for block adoption%@", v2, v3, v4, v5, v6);
}

@end