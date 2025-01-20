@interface ULTapToRadar
@end

@implementation ULTapToRadar

void __60__ULTapToRadar_ULExtensions__createRadarForMigrationFailure__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_435);
  }
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "[ULTapToRadar:createRadarForMigrationFailure]: status: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __65__ULTapToRadar_ULExtensions__createRadarForDatabaseAccessFailure__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_435);
  }
  int v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "[ULTapToRadar:createRadarForDatabaseAccessError]: status: %@", (uint8_t *)&v7, 0xCu);
  }
  if (([MEMORY[0x263F55810] isRunningInXCTestEnvironment] & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [MEMORY[0x263EFF910] now];
    [v5 setObject:v6 forKey:@"ULTTROnDatabaseAccessErrorLastTriggerDate"];
  }
}

@end