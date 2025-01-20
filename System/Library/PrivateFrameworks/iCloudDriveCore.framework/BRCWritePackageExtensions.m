@interface BRCWritePackageExtensions
@end

@implementation BRCWritePackageExtensions

uint64_t ___BRCWritePackageExtensions_block_invoke()
{
  v0 = +[BRCUserDefaults defaultsForMangledID:0];
  [v0 packageExtensionPlistWriteInterval];
  v1 = dispatch_get_global_queue(9, 0);
  uint64_t v2 = br_pacer_create();
  v3 = (void *)_BRCWritePackageExtensions_pacer;
  _BRCWritePackageExtensions_pacer = v2;

  br_pacer_set_event_handler();
  return br_pacer_resume();
}

void ___BRCWritePackageExtensions_block_invoke_2()
{
  pthread_rwlock_rdlock(&_forcedPackageExtensionsMutex);
  [(id)_loadedPersonaIDs enumerateKeysAndObjectsUsingBlock:&__block_literal_global_20];
  v0 = [(id)_unifiedForcedPackageExtensions allObjects];
  v1 = brc_bread_crumbs();
  uint64_t v2 = brc_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    ___BRCWritePackageExtensions_block_invoke_2_cold_1();
  }

  v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.fileproviderd"];
  [v3 setObject:v0 forKey:@"iCDPackageExtensions"];
  pthread_rwlock_unlock(&_forcedPackageExtensionsMutex);
}

void ___BRCWritePackageExtensions_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v4 = v7;
  id v5 = v6;
  BRPerformWithPersonaAndError();
}

void ___BRCWritePackageExtensions_block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = brc_bread_crumbs();
    v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      ___BRCWritePackageExtensions_block_invoke_4_cold_1((uint64_t)v2, v3);
    }
  }
  else
  {
    id v9 = [(id)_unifiedForcedPackageExtensions allObjects];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) BOOLValue];
    id v7 = objc_msgSend(NSString, "br_supportDirForPersona:dataSeparated:", v5, v6);
    v8 = [v7 stringByAppendingPathComponent:@"pkg_extensions.plist"];

    [v9 writeToFile:v8 atomically:1];
  }
}

void ___BRCWritePackageExtensions_block_invoke_2_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_23FA42000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] Persisting %@ for FileProvider%@", v2, 0x16u);
}

void ___BRCWritePackageExtensions_block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't change personas while saving package extensions list%@", (uint8_t *)&v2, 0xCu);
}

@end