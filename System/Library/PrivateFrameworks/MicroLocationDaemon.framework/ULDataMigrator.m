@interface ULDataMigrator
- (BOOL)_checkKeybagUnlocked;
- (BOOL)_initializeMigrationStatusMetricsDict:(id)a3 forType:(int64_t)a4;
- (BOOL)_migrateMiloDataFromLocationd;
- (BOOL)_migrateMiloDataTransaction;
- (BOOL)migrateMiloData;
- (IDataProtectionDelegate)dataProtectionDelegate;
- (ULDataMigrator)initWithLocalDb:(ULDatabase *)a3 dataProtectionDelegate:(IDataProtectionDelegate *)a4 andEventLogger:(void *)a5;
- (ULDatabase)localDb;
- (id)_createLocationManagerWithMicroLocationBundle;
- (id)_exportMiloDataFromLocationd:(id)a3;
- (id)_getPreviouslyExportedFileIfExistsAtPath:(id)a3;
- (int64_t)_getCAMigrationErrorTypeForLastMigrationStateAfterMaxFailures:(int)a3;
- (void)_sendCoreAnalyticsEventForMigrationIfNecessary:(int64_t)a3;
- (void)eventLogger;
- (void)setDataProtectionDelegate:(IDataProtectionDelegate *)a3;
- (void)setEventLogger:(void *)a3;
- (void)setLocalDb:(ULDatabase *)a3;
@end

@implementation ULDataMigrator

- (ULDataMigrator)initWithLocalDb:(ULDatabase *)a3 dataProtectionDelegate:(IDataProtectionDelegate *)a4 andEventLogger:(void *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)ULDataMigrator;
  v8 = [(ULDataMigrator *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ULDataMigrator *)v8 setLocalDb:a3];
    [(ULDataMigrator *)v9 setDataProtectionDelegate:a4];
    [(ULDataMigrator *)v9 setEventLogger:a5];
  }
  return v9;
}

- (BOOL)migrateMiloData
{
  v23[39] = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
  }
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf.var0.var0 = 0;
    _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "Migrating milo data", buf.var0.var0, 2u);
  }
  id v4 = (id)[(ULDataMigrator *)self localDb][112];
  *(void *)&long long v19 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v17, 3, &v19);
  v5 = operator new(0x10uLL);
  *(void *)&buf.var0.var0[8] = v5 + 4;
  uint64_t v21 = (uint64_t)(v5 + 4);
  *(void *)v5 = v17;
  v5[2] = v18;
  *(void *)buf.var0.var0 = v5;
  [v4 insertEntries:&buf];
  if (*(void *)buf.var0.var0)
  {
    *(void *)&buf.var0.var0[8] = *(void *)buf.var0.var0;
    operator delete(*(void **)buf.var0.var0);
  }

  if (ULDatabase::isDatabaseConnected([(ULDataMigrator *)self localDb]))
  {
    v6 = [(ULDataMigrator *)self eventLogger];
    int v16 = 0;
    boost::uuids::detail::random_provider_base::random_provider_base((boost::uuids::detail::random_provider_base *)&v16);
    *(void *)&long long v19 = boost::uuids::random_generator_pure::operator()((uint64_t)&v16);
    *((void *)&v19 + 1) = v7;
    double v8 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationProto::DataMigration::DataMigration((CLMicroLocationProto::DataMigration *)&v17);
    CLMicroLocationProtobufHelper::createLoggedEvent<CLMicroLocationProto::DataMigration>(&v19, (int *)&v17, (uint64_t)&buf, v8);
    CLMicroLocationEventLogger::logEvent(v6, &buf);
    CLMicroLocationProto::ReceivedEvent::~ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)v23);
    CLMicroLocationProto::DataMigration::~DataMigration((CLMicroLocationProto::DataMigration *)&v17);
    boost::uuids::detail::random_provider_base::destroy((boost::uuids::detail::random_provider_base *)&v16);
    *(void *)buf.var0.var0 = 0;
    *(void *)&buf.var0.var0[8] = &buf;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v9 = +[ULTransactionManager shared];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __33__ULDataMigrator_migrateMiloData__block_invoke;
    v15[3] = &unk_2653F9670;
    v15[4] = self;
    v15[5] = &buf;
    [v9 performUnderTransaction:@"com.apple.milod.migrateData" block:v15];

    BOOL v10 = *(unsigned char *)(*(void *)&buf.var0.var0[8] + 24) != 0;
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v11 = (id)[(ULDataMigrator *)self localDb][112];
    *(void *)&long long v19 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v17, 6, &v19);
    v12 = operator new(0x10uLL);
    *(void *)&buf.var0.var0[8] = v12 + 4;
    uint64_t v21 = (uint64_t)(v12 + 4);
    *(void *)v12 = v17;
    v12[2] = v18;
    *(void *)buf.var0.var0 = v12;
    [v11 insertEntries:&buf];
    if (*(void *)buf.var0.var0)
    {
      *(void *)&buf.var0.var0[8] = *(void *)buf.var0.var0;
      operator delete(*(void **)buf.var0.var0);
    }

    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
    }
    v13 = logObject_MicroLocation_Default;
    BOOL v10 = 0;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf.var0.var0 = 0;
      _os_log_impl(&dword_25631F000, v13, OS_LOG_TYPE_DEFAULT, "local milo database is not connected", buf.var0.var0, 2u);
      return 0;
    }
  }
  return v10;
}

uint64_t __33__ULDataMigrator_migrateMiloData__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _migrateMiloDataTransaction];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_migrateMiloDataTransaction
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [[ULBackupAndRestore alloc] initWithDatabase:[(ULDataMigrator *)self localDb] andEventLogger:[(ULDataMigrator *)self eventLogger]];
  if (([MEMORY[0x263F55810] isMac] & 1) == 0)
  {
    id v4 = [MEMORY[0x263F08850] defaultManager];
    v5 = [(ULBackupAndRestore *)v3 getBackupDatabasePath];
    int v6 = [v4 fileExistsAtPath:v5];

    if (v6)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
      }
      uint64_t v7 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)Entry buf = 0;
        _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "Migrating data from milod restored iCloud backup file", buf, 2u);
      }
      BOOL v8 = [(ULBackupAndRestore *)v3 importiCloudBackup];
      uint64_t v9 = 0;
      if (!v8) {
        goto LABEL_17;
      }
LABEL_14:
      id v11 = (id)[(ULDataMigrator *)self localDb][112];
      CFAbsoluteTime v16 = cl::chrono::CFAbsoluteTimeClock::now();
      CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v19, 2, &v16);
      v12 = operator new(0x10uLL);
      *(void *)int v18 = v12 + 4;
      *(void *)&v18[8] = v12 + 4;
      *(void *)v12 = v19;
      v12[2] = v20;
      *(void *)Entry buf = v12;
      [v11 insertEntries:buf];
      if (*(void *)buf)
      {
        *(void *)int v18 = *(void *)buf;
        operator delete(*(void **)buf);
      }

      goto LABEL_17;
    }
  }
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
  }
  BOOL v10 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)Entry buf = 0;
    _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_DEFAULT, "Migrating data from locationd", buf, 2u);
  }
  BOOL v8 = [(ULDataMigrator *)self _migrateMiloDataFromLocationd];
  uint64_t v9 = 1;
  if (v8) {
    goto LABEL_14;
  }
LABEL_17:
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
  }
  v13 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "fail";
    *(_DWORD *)Entry buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)int v18 = 2082;
    *(void *)&v18[2] = "";
    if (v8) {
      v14 = "success";
    }
    *(_WORD *)&v18[10] = 2082;
    *(void *)&v18[12] = v14;
    _os_log_impl(&dword_25631F000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"data migration iteration status.\", \"result\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  if (ULDatabase::getMigrationStatus([(ULDataMigrator *)self localDb], 1) - 3 <= 1) {
    [(ULDataMigrator *)self _sendCoreAnalyticsEventForMigrationIfNecessary:v9];
  }

  return v8;
}

- (void)_sendCoreAnalyticsEventForMigrationIfNecessary:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v5 = +[ULDefaultsSingleton shared];
  int v6 = [v5 defaultsDictionary];

  uint64_t v7 = [NSString stringWithUTF8String:"ULAnalyticsSendEventEnabled"];
  BOOL v8 = [v6 objectForKey:v7];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v9 = [v8 BOOLValue];
  }
  else {
    int v9 = [MEMORY[0x263EFFA88] BOOLValue];
  }
  int v10 = v9;

  if (v10)
  {
    id v11 = [MEMORY[0x263EFF9A0] dictionary];
    if ([(ULDataMigrator *)self _initializeMigrationStatusMetricsDict:v11 forType:a3])
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
      }
      v12 = (id)logObject_MicroLocation_Default;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14[0] = 68289538;
        v14[1] = 0;
        __int16 v15 = 2082;
        CFAbsoluteTime v16 = "";
        __int16 v17 = 2082;
        uint64_t v18 = [@"com.apple.MicroLocation.DataMigration" UTF8String];
        __int16 v19 = 2114;
        int v20 = v11;
        _os_log_impl(&dword_25631F000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Sending Migration CoreAnalytics\", \"Event name\":%{public, location:escape_only}s, \"metricsDict\":%{public, location:escape_only}@}", (uint8_t *)v14, 0x26u);
      }

      AnalyticsSendEvent();
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
    }
    v13 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_25631F000, v13, OS_LOG_TYPE_DEFAULT, "#Data Migrator, CoreAnalytics Disabled", (uint8_t *)v14, 2u);
    }
  }
}

- (id)_getPreviouslyExportedFileIfExistsAtPath:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x263F55810] isMac] & 1) != 0
    || ([MEMORY[0x263F08850] defaultManager],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 fileExistsAtPath:v4],
        v5,
        !v6))
  {
    int v10 = 0;
    goto LABEL_6;
  }
  uint64_t v7 = operator new(8uLL);
  __p = v7;
  *uint64_t v7 = 4;
  CFAbsoluteTime v16 = v7 + 1;
  __int16 v17 = v7 + 1;
  id v8 = (id)[(ULDataMigrator *)self localDb][112];
  int v9 = v8;
  if (v8)
  {
    [v8 fetchMigrationEntriesWithStates:&__p limit:1];
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }

  v12 = v13;
  if (v14 != v13)
  {
    if (v13[2] == 4)
    {
      int v10 = [NSURL fileURLWithPath:v4];
      v12 = v13;
      if (!v13) {
        goto LABEL_18;
      }
    }
    else
    {
      int v10 = 0;
    }
LABEL_17:
    operator delete(v12);
    goto LABEL_18;
  }
  int v10 = 0;
  v12 = v14;
  if (v14) {
    goto LABEL_17;
  }
LABEL_18:
  if (__p)
  {
    CFAbsoluteTime v16 = __p;
    operator delete(__p);
  }
LABEL_6:

  return v10;
}

- (BOOL)_checkKeybagUnlocked
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(ULDataMigrator *)self dataProtectionDelegate];
  char v4 = (*((uint64_t (**)(IDataProtectionDelegate *))v3->var0 + 2))(v3);
  if ((v4 & 1) == 0)
  {
    id v5 = (id)[(ULDataMigrator *)self localDb][112];
    CFAbsoluteTime v9 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v13, 7, &v9);
    int v6 = operator new(0x10uLL);
    id v11 = v6 + 4;
    v12 = (char *)(v6 + 4);
    *(void *)int v6 = v13;
    v6[2] = v14;
    __p = v6;
    [v5 insertEntries:&__p];
    if (__p)
    {
      id v11 = __p;
      operator delete(__p);
    }

    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
    }
    uint64_t v7 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "data migration aborted. keybag is locked", (uint8_t *)&__p, 2u);
    }
  }
  return v4;
}

- (BOOL)_migrateMiloDataFromLocationd
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if ([(ULDataMigrator *)self _checkKeybagUnlocked])
  {
    v29 = [(ULDataMigrator *)self _createLocationManagerWithMicroLocationBundle];
    v3 = [(ULDataMigrator *)self _getPreviouslyExportedFileIfExistsAtPath:@"/var/tmp/com.apple.locationd/microLocationDB/ExportedMiloDB.db"];
    if (!v3)
    {
      id v11 = (id)[(ULDataMigrator *)self localDb][112];
      CFAbsoluteTime v30 = cl::chrono::CFAbsoluteTimeClock::now();
      CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v35, 0, &v30);
      v12 = operator new(0x10uLL);
      *(void *)&long long v32 = v12 + 4;
      *((void *)&v32 + 1) = v12 + 4;
      *(void *)v12 = v35;
      v12[2] = v36;
      __p = v12;
      [v11 insertEntries:&__p];
      if (__p)
      {
        *(void *)&long long v32 = __p;
        operator delete(__p);
      }

      uint64_t v13 = +[ULDefaultsSingleton shared];
      int v14 = [v13 defaultsDictionary];

      uint64_t v15 = [NSString stringWithUTF8String:"ULLocationdMigrationExportMaxAttempts"];
      CFAbsoluteTime v16 = [v14 objectForKey:v15];
      if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        unsigned int v17 = [v16 unsignedIntValue];
      }
      else {
        unsigned int v17 = [&unk_2704F1668 unsignedIntValue];
      }
      unsigned int v18 = v17;

      if (!v18)
      {
LABEL_24:
        if (onceToken_MicroLocation_Default != -1) {
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
        }
        char v22 = logObject_MicroLocation_Default;
        if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(__p) = 0;
          _os_log_impl(&dword_25631F000, v22, OS_LOG_TYPE_DEFAULT, "Failed to export milo data from locationd", (uint8_t *)&__p, 2u);
        }
        char v4 = (ULCLDatabaseMigrator *)(id)[(ULDataMigrator *)self localDb][112];
        CFAbsoluteTime v30 = cl::chrono::CFAbsoluteTimeClock::now();
        CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v35, 5, &v30);
        v23 = operator new(0x10uLL);
        *(void *)&long long v32 = v23 + 4;
        *((void *)&v32 + 1) = v23 + 4;
        *(void *)v23 = v35;
        v23[2] = v36;
        __p = v23;
        [(ULCLDatabaseMigrator *)v4 insertEntries:&__p];
        if (__p)
        {
          *(void *)&long long v32 = __p;
          operator delete(__p);
        }
        v3 = 0;
        LOBYTE(v5) = 0;
        goto LABEL_34;
      }
      int v20 = 1;
      *(void *)&long long v19 = 68289538;
      long long v28 = v19;
      while (1)
      {
        if (![(ULDataMigrator *)self _checkKeybagUnlocked])
        {
          v3 = 0;
          goto LABEL_36;
        }
        v3 = [(ULDataMigrator *)self _exportMiloDataFromLocationd:v29];
        if (v3) {
          break;
        }
        if (onceToken_MicroLocation_Default != -1) {
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
        }
        uint64_t v21 = logObject_MicroLocation_Default;
        if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
        {
          __p = (void *)v28;
          LOWORD(v32) = 2082;
          *(void *)((char *)&v32 + 2) = "";
          WORD5(v32) = 1026;
          HIDWORD(v32) = v20;
          __int16 v33 = 1026;
          unsigned int v34 = v18;
          _os_log_impl(&dword_25631F000, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Attempt to export data from locationd failed\", \"attempt\":%{public}u, \"maxAttempts\":%{public}u}", (uint8_t *)&__p, 0x1Eu);
        }
        if (++v20 > v18) {
          goto LABEL_24;
        }
      }
      id v26 = (id)[(ULDataMigrator *)self localDb][112];
      CFAbsoluteTime v30 = cl::chrono::CFAbsoluteTimeClock::now();
      CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v35, 4, &v30);
      v27 = operator new(0x10uLL);
      *(void *)&long long v32 = v27 + 4;
      *((void *)&v32 + 1) = v27 + 4;
      *(void *)v27 = v35;
      v27[2] = v36;
      __p = v27;
      [v26 insertEntries:&__p];
      if (__p)
      {
        *(void *)&long long v32 = __p;
        operator delete(__p);
      }
    }
    if (![(ULDataMigrator *)self _checkKeybagUnlocked])
    {
LABEL_36:
      LOBYTE(v5) = 0;
      goto LABEL_37;
    }
    char v4 = [[ULCLDatabaseMigrator alloc] initWithLocalDb:[(ULDataMigrator *)self localDb]];
    BOOL v5 = [(ULCLDatabaseMigrator *)v4 migrateCLDatabaseFromPath:v3];
    if ((([MEMORY[0x263F55810] isMac] | !v5) & 1) == 0)
    {
      int v6 = +[ULDefaultsSingleton shared];
      uint64_t v7 = [v6 defaultsDictionary];

      id v8 = [NSString stringWithUTF8String:"ULDataMigrationPurgeLocationd"];
      CFAbsoluteTime v9 = [v7 objectForKey:v8];
      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        int v10 = [v9 BOOLValue];
      }
      else {
        int v10 = [MEMORY[0x263EFFA88] BOOLValue];
      }
      int v24 = v10;

      if (v24) {
        [v29 purgeMicroLocationData];
      }
    }
LABEL_34:

LABEL_37:
    return v5;
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (id)_createLocationManagerWithMicroLocationBundle
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.milod.exportMiloDataFromLocationd", 0);
  char v4 = (void *)[objc_alloc(MEMORY[0x263F00A60]) initWithEffectiveBundlePath:@"/System/Library/LocationBundles/Milod.bundle" delegate:self onQueue:v3];
  if (!v4)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
    }
    BOOL v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_FAULT, "Failed to create location manager using MicroLocation bundle", v7, 2u);
    }
  }

  return v4;
}

- (id)_exportMiloDataFromLocationd:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  id v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__5;
  v21[4] = __Block_byref_object_dispose__5;
  id v22 = 0;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
  }
  BOOL v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289026;
    __int16 v30 = 2082;
    v31 = "";
    _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#dataMigrator, requesting export of milo database from locationd\"}", (uint8_t *)&buf, 0x12u);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __47__ULDataMigrator__exportMiloDataFromLocationd___block_invoke;
  v17[3] = &unk_2653F9698;
  long long v19 = &v23;
  int v20 = v21;
  int v6 = v4;
  unsigned int v18 = v6;
  [v3 exportMicroLocationDataForMigrationWithCompletion:v17];
  uint64_t v7 = +[ULDefaultsSingleton shared];
  id v8 = [v7 defaultsDictionary];

  CFAbsoluteTime v9 = [NSString stringWithUTF8String:"ULLocationdMigrationExportTimeout"];
  int v10 = [v8 objectForKey:v9];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v11 = [v10 unsignedIntValue];
  }
  else {
    unsigned int v11 = [&unk_2704F1650 unsignedIntValue];
  }
  unsigned int v12 = v11;

  dispatch_time_t v13 = dispatch_time(0, 1000000000 * v12);
  if (dispatch_semaphore_wait(v6, v13))
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
    }
    int v14 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_25631F000, v14, OS_LOG_TYPE_DEFAULT, "#dataMigrator, timed out waiting for locationd db export to complete", (uint8_t *)&buf, 2u);
    }
  }
  id v15 = (id)v24[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v15;
}

void __47__ULDataMigrator__exportMiloDataFromLocationd___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v40[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
  }
  uint64_t v7 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 68289026;
    int v31 = 0;
    __int16 v32 = 2082;
    __int16 v33 = "";
    _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#dataMigrator, export milo database handler called\"}", (uint8_t *)&v30, 0x12u);
  }
  if (v5 || !v6)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
    }
    uint64_t v25 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = [v5 localizedDescription];
      uint64_t v27 = [v26 UTF8String];
      int v30 = 68289282;
      int v31 = 0;
      __int16 v32 = 2082;
      __int16 v33 = "";
      __int16 v34 = 2082;
      uint64_t v35 = v27;
      _os_log_impl(&dword_25631F000, v25, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#dataMigrator, locationd export of milo database failed!\", \"error: \":%{public, location:escape_only}s}", (uint8_t *)&v30, 0x1Cu);
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
    }
    CFAbsoluteTime v9 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v9))
    {
      id v28 = [v5 localizedDescription];
      uint64_t v29 = [v28 UTF8String];
      int v30 = 68289282;
      int v31 = 0;
      __int16 v32 = 2082;
      __int16 v33 = "";
      __int16 v34 = 2082;
      uint64_t v35 = v29;
      _os_signpost_emit_with_name_impl(&dword_25631F000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#dataMigrator, locationd export of milo database failed!", "{\"msg%{public}.0s\":\"#dataMigrator, locationd export of milo database failed!\", \"error: \":%{public, location:escape_only}s}", (uint8_t *)&v30, 0x1Cu);
    }
  }
  else
  {
    id v8 = [v6 objectForKey:@"ExportDir"];
    CFAbsoluteTime v9 = [v8 copy];

    int v10 = [v6 objectForKey:@"FileName"];
    unsigned int v11 = (void *)[v10 copy];

    unsigned int v12 = NSURL;
    v40[0] = v9;
    v40[1] = v11;
    dispatch_time_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
    uint64_t v14 = [v12 fileURLWithPathComponents:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    CFAbsoluteTime v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    unsigned int v17 = [v6 objectForKey:@"SandboxExt"];
    uint64_t v18 = [v17 copy];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    int v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
    }
    uint64_t v21 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [v9 UTF8String];
      uint64_t v23 = [v11 UTF8String];
      uint64_t v24 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) UTF8String];
      int v30 = 68289795;
      int v31 = 0;
      __int16 v32 = 2082;
      __int16 v33 = "";
      __int16 v34 = 2081;
      uint64_t v35 = v22;
      __int16 v36 = 2081;
      uint64_t v37 = v23;
      __int16 v38 = 2081;
      uint64_t v39 = v24;
      _os_log_impl(&dword_25631F000, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#dataMigrator, locationd export of milo database completed successfully.\", \"exportedDatabaseDirectory: \":%{private, location:escape_only}s, \"microLocationExportedDatabaseFileName: \":%{private, location:escape_only}s, \"sandbox token: \":%{private, location:escape_only}s}", (uint8_t *)&v30, 0x30u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int64_t)_getCAMigrationErrorTypeForLastMigrationStateAfterMaxFailures:(int)a3
{
  if ((a3 - 1) > 0xA) {
    return 3;
  }
  else {
    return qword_2565162F0[a3 - 1];
  }
}

- (BOOL)_initializeMigrationStatusMetricsDict:(id)a3 forType:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = (id)[(ULDataMigrator *)self localDb][112];
    id v8 = v7;
    if (v7)
    {
      [v7 fetchAllRecordsWithLimit:0];
    }
    else
    {
      __p = 0;
      __int16 v33 = 0;
      uint64_t v34 = 0;
    }

    int v10 = (double *)__p;
    unsigned int v11 = (double *)v33;
    if (__p == v33)
    {
      unint64_t v12 = 0;
      int64_t v16 = -1;
      unsigned int v11 = (double *)__p;
      goto LABEL_29;
    }
    unint64_t v12 = 0;
    dispatch_time_t v13 = (char *)__p;
    do
    {
      if (*((_DWORD *)v13 + 2) == 3) {
        ++v12;
      }
      v13 += 16;
    }
    while (v13 != v33);
    uint64_t v14 = (char *)__p;
    while (*((_DWORD *)v14 + 2) != 2)
    {
      v14 += 16;
      if (v14 == v33)
      {
        uint64_t v15 = (char *)__p;
        goto LABEL_18;
      }
    }
    uint64_t v15 = (char *)__p;
    if (v14 != v33)
    {
      int64_t v16 = -1;
      goto LABEL_29;
    }
LABEL_18:
    while (*((_DWORD *)v15 + 2) != 1)
    {
      v15 += 16;
      if (v15 == v33) {
        goto LABEL_23;
      }
    }
    if (v15 != v33)
    {
      unint64_t v12 = 0;
      int64_t v16 = 4;
      goto LABEL_29;
    }
LABEL_23:
    unsigned int v17 = +[ULDefaultsSingleton shared];
    uint64_t v18 = [v17 defaultsDictionary];

    uint64_t v19 = [NSString stringWithUTF8String:"ULDataMigrationMaxAttempts"];
    int v20 = [v18 objectForKey:v19];
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      unsigned int v21 = [v20 unsignedIntValue];
    }
    else {
      unsigned int v21 = [&unk_2704F1638 unsignedIntValue];
    }
    unsigned int v22 = v21;

    if (v12 >= v22)
    {
      int64_t v16 = [(ULDataMigrator *)self _getCAMigrationErrorTypeForLastMigrationStateAfterMaxFailures:*((unsigned int *)__p + 2)];
      unint64_t v12 = 0;
      int v10 = (double *)__p;
      unsigned int v11 = (double *)v33;
LABEL_29:
      while (v11 != v10)
      {
        uint64_t v23 = v11;
        int v24 = *((_DWORD *)v11 - 2);
        v11 -= 2;
        if (v24 == 3)
        {
          uint64_t v25 = [NSNumber numberWithInteger:a4];
          [v6 setObject:v25 forKeyedSubscript:@"MigrationType"];

          id v26 = [NSNumber numberWithInteger:v12];
          [v6 setObject:v26 forKeyedSubscript:@"MigrationAttampts"];

          if (!v12)
          {
            uint64_t v27 = [NSNumber numberWithInteger:v16];
            [v6 setObject:v27 forKeyedSubscript:@"MigrationErrorType"];
          }
          id v28 = [NSNumber numberWithDouble:*(double *)__p - *(v23 - 2)];
          [v6 setObject:v28 forKeyedSubscript:@"MigrationDuration"];

          BOOL v9 = 1;
          goto LABEL_39;
        }
      }
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_28);
      }
      uint64_t v29 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        __int16 v31 = 0;
        _os_log_impl(&dword_25631F000, v29, OS_LOG_TYPE_ERROR, "unexpected Error, MigrationInit entry not found", (uint8_t *)&v31, 2u);
      }
    }
    BOOL v9 = 0;
LABEL_39:
    if (__p)
    {
      __int16 v33 = (char *)__p;
      operator delete(__p);
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (ULDatabase)localDb
{
  return self->_localDb;
}

- (void)setLocalDb:(ULDatabase *)a3
{
  self->_localDb = a3;
}

- (IDataProtectionDelegate)dataProtectionDelegate
{
  return self->_dataProtectionDelegate;
}

- (void)setDataProtectionDelegate:(IDataProtectionDelegate *)a3
{
  self->_dataProtectionDelegate = a3;
}

- (void)eventLogger
{
  return self->_eventLogger;
}

- (void)setEventLogger:(void *)a3
{
  self->_eventLogger = a3;
}

@end