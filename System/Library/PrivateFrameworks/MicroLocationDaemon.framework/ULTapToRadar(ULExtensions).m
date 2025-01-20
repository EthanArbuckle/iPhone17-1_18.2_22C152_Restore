@interface ULTapToRadar(ULExtensions)
+ (uint64_t)createMicroLocationTapToRadarWithTitle:()ULExtensions description:extensionIDs:displayReason:completionHandler:;
+ (void)createRadarForDatabaseAccessFailure;
+ (void)createRadarForMigrationFailure;
@end

@implementation ULTapToRadar(ULExtensions)

+ (uint64_t)createMicroLocationTapToRadarWithTitle:()ULExtensions description:extensionIDs:displayReason:completionHandler:
{
  LOBYTE(v8) = 0;
  return [MEMORY[0x263F55818] createRadarWithComponentName:@"Location Rooms" componentVersion:@"All" componentID:&unk_2704F13B0 classification:6 reproducibility:6 title:a3 description:a4 extensionIDs:a5 processName:@"MicroLocation" displayReason:a6 isUserInitiated:v8 completionHandler:a7];
}

+ (void)createRadarForMigrationFailure
{
  v0 = +[ULDefaultsSingleton shared];
  v1 = [v0 defaultsDictionary];

  v2 = [NSString stringWithUTF8String:"ULTTROnMigrationErrorEnabled"];
  v3 = [v1 objectForKey:v2];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = [MEMORY[0x263EFFA88] BOOLValue];
  }
  char v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x263F55818];
    [v6 createMicroLocationTapToRadarWithTitle:@"MicroLocation - Migration Completed with Error" description:@"Migration error with status: ULMigrationStatusCompletedWithError" extensionIDs:&unk_2704F2478 displayReason:@"migration completed with error" completionHandler:&__block_literal_global_9];
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_435);
    }
    v7 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "[ULTapToRadar:createRadarForMigrationFailure]: aborted. disabled in settings", v8, 2u);
    }
  }
}

+ (void)createRadarForDatabaseAccessFailure
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v0 = +[ULDefaultsSingleton shared];
  v1 = [v0 defaultsDictionary];

  v2 = [NSString stringWithUTF8String:"ULTTROnDatabaseAccessErrorEnabled"];
  v3 = [v1 objectForKey:v2];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = [MEMORY[0x263EFFA88] BOOLValue];
  }
  char v5 = v4;

  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.milod"];
    v7 = [v6 objectForKey:@"ULTTROnDatabaseAccessErrorLastTriggerDate"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (id v8 = v7) != 0)
    {
      v9 = v8;
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_435);
      }
      v10 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v9;
        _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_DEFAULT, "[ULTapToRadar:createRadarForDatabaseAccessError]: aborted. already triggered at %@", buf, 0xCu);
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x263F55818];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __65__ULTapToRadar_ULExtensions__createRadarForDatabaseAccessFailure__block_invoke;
      v13[3] = &unk_2653F9358;
      id v14 = v6;
      [v12 createMicroLocationTapToRadarWithTitle:@"MicroLocation - Database access Error" description:@"Got Error on access to database while database is connected" extensionIDs:&unk_2704F2490 displayReason:@"access to database error" completionHandler:v13];

      v9 = 0;
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_435);
    }
    v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v11, OS_LOG_TYPE_DEFAULT, "[ULTapToRadar:createRadarForDatabaseAccessError]: aborted. disabled in settings", buf, 2u);
    }
  }
}

@end