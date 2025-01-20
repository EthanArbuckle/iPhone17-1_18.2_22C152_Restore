@interface ULBackupAndRestore
- (BOOL)_clearTempBackupDirectory:(id)a3;
- (BOOL)_createBackupDbPathWithAttributes:(id)a3;
- (BOOL)_createTempBackupDirectoryIfNotExists:(id)a3;
- (BOOL)_didReceiveCancel:(function<BOOL)(;
- (BOOL)_exportRecordingEventsForLoiGroupIds:()vector<boost:(std:(ULDatabase *)a4 :(function<BOOL)( allocator<boost::uuids::uuid>> *)a3 :uuids::uuid toDatabase:withCancelFunc:;
- (BOOL)_exportToDatabase:(ULDatabase *)a3 withCancelFunc:(function<BOOL)(;
- (BOOL)_exportiCloudBackupTransactionWithCancelFunc:(function<BOOL)(;
- (BOOL)_importFromDatabase:(ULDatabase *)a3;
- (BOOL)_importiCloudBackupTransaction;
- (BOOL)_setClassBAttributeToFile:(id)a3;
- (BOOL)_setExcludeFromBackupAttribute:(id)a3 withValue:(BOOL)a4;
- (BOOL)exportiCloudBackupWithCancelFunc:(function<BOOL)(;
- (BOOL)importiCloudBackup;
- (ULBackupAndRestore)initWithDatabase:(ULDatabase *)a3 andEventLogger:(void *)a4;
- (ULDatabase)db;
- (id)_getTempBackupDatabaseDirectoryClearCurrent:(BOOL)a3 createNew:(BOOL)a4;
- (id)getBackupDatabasePath;
- (uint64_t)_importFromDatabase:;
- (unint64_t)_getFileSize:(id)a3;
- (void)_deleteTempDb:(ULDatabase *)a3;
- (void)_importFromDatabase:;
- (void)deleteBackupFiles;
- (void)eventLogger;
- (void)setDb:(ULDatabase *)a3;
- (void)setEventLogger:(void *)a3;
@end

@implementation ULBackupAndRestore

- (ULBackupAndRestore)initWithDatabase:(ULDatabase *)a3 andEventLogger:(void *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ULBackupAndRestore;
  v6 = [(ULBackupAndRestore *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(ULBackupAndRestore *)v6 setDb:a3];
    [(ULBackupAndRestore *)v7 setEventLogger:a4];
  }
  return v7;
}

- (BOOL)exportiCloudBackupWithCancelFunc:(function<BOOL)(
{
  v23[39] = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F55810] isMac])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    v5 = logObject_MicroLocation_Default;
    BOOL v6 = 0;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf.var0.var0 = 0;
      v7 = "Export iCloud backup - activity disabled for macos";
LABEL_21:
      _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, v7, buf.var0.var0, 2u);
      return 0;
    }
  }
  else if (ULSettings::get<ULSettings::EnableCloudBackup>())
  {
    v8 = [(ULBackupAndRestore *)self db];
    if ((*((uint64_t (**)(ULDatabase *))v8->var0 + 2))(v8))
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
      }
      objc_super v9 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf.var0.var0 = 0;
        _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_DEFAULT, "Export iCloud backup", buf.var0.var0, 2u);
      }
      v10 = [(ULBackupAndRestore *)self eventLogger];
      int v16 = 0;
      boost::uuids::detail::random_provider_base::random_provider_base((boost::uuids::detail::random_provider_base *)&v16);
      *(void *)&long long v19 = boost::uuids::random_generator_pure::operator()((uint64_t)&v16);
      *((void *)&v19 + 1) = v11;
      double v12 = cl::chrono::CFAbsoluteTimeClock::now();
      CLMicroLocationProto::CloudBackupExport::CloudBackupExport((CLMicroLocationProto::CloudBackupExport *)v15);
      CLMicroLocationProtobufHelper::createLoggedEvent<CLMicroLocationProto::CloudBackupExport>(&v19, v15, (uint64_t)&buf, v12);
      CLMicroLocationEventLogger::logEvent(v10, &buf);
      CLMicroLocationProto::ReceivedEvent::~ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)v23);
      CLMicroLocationProto::CloudBackupExport::~CloudBackupExport((CLMicroLocationProto::CloudBackupExport *)v15);
      boost::uuids::detail::random_provider_base::destroy((boost::uuids::detail::random_provider_base *)&v16);
      *(void *)buf.var0.var0 = 0;
      *(void *)&buf.var0.var0[8] = &buf;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      v13 = +[ULTransactionManager shared];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3321888768;
      v17[2] = __55__ULBackupAndRestore_exportiCloudBackupWithCancelFunc___block_invoke;
      v17[3] = &unk_2704E1DE0;
      v17[4] = self;
      v17[5] = &buf;
      std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v18, (uint64_t)a3);
      [v13 performUnderTransaction:@"com.apple.milod.exportiCloudBackup" block:v17];

      BOOL v6 = *(unsigned char *)(*(void *)&buf.var0.var0[8] + 24) != 0;
      std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v18);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
      }
      v5 = logObject_MicroLocation_Default;
      BOOL v6 = 0;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf.var0.var0 = 0;
        v7 = "Export iCloud backup - aborted due to database not valid (possible migration pending)";
        goto LABEL_21;
      }
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    v5 = logObject_MicroLocation_Default;
    BOOL v6 = 0;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf.var0.var0 = 0;
      v7 = "#Warning Tried to export db for iCloud backup, but iCloud backup feature is disabled";
      goto LABEL_21;
    }
  }
  return v6;
}

void *__55__ULBackupAndRestore_exportiCloudBackupWithCancelFunc___block_invoke(uint64_t a1)
{
  v4[4] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v4, a1 + 48);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 _exportiCloudBackupTransactionWithCancelFunc:v4];
  return std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v4);
}

- (BOOL)importiCloudBackup
{
  v19[39] = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F55810] isMac])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    v3 = logObject_MicroLocation_Default;
    if (!os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    *(_WORD *)buf.var0.var0 = 0;
    v4 = "Import iCloud backup - activity disabled for macos";
LABEL_16:
    _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, v4, buf.var0.var0, 2u);
    return 1;
  }
  if ((ULSettings::get<ULSettings::EnableCloudBackup>() & 1) == 0)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    v3 = logObject_MicroLocation_Default;
    if (!os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    *(_WORD *)buf.var0.var0 = 0;
    v4 = "#Warning Tried to import db from iCloud restored backup, but iCloud backup feature is disabled";
    goto LABEL_16;
  }
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
  }
  v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf.var0.var0 = 0;
    _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "Import iCloud backup", buf.var0.var0, 2u);
  }
  BOOL v6 = [(ULBackupAndRestore *)self eventLogger];
  int v14 = 0;
  boost::uuids::detail::random_provider_base::random_provider_base((boost::uuids::detail::random_provider_base *)&v14);
  *(void *)&long long v15 = boost::uuids::random_generator_pure::operator()((uint64_t)&v14);
  *((void *)&v15 + 1) = v7;
  double v8 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMicroLocationProto::CloudBackupImport::CloudBackupImport((CLMicroLocationProto::CloudBackupImport *)v13);
  CLMicroLocationProtobufHelper::createLoggedEvent<CLMicroLocationProto::CloudBackupImport>(&v15, v13, (uint64_t)&buf, v8);
  CLMicroLocationEventLogger::logEvent(v6, &buf);
  CLMicroLocationProto::ReceivedEvent::~ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)v19);
  CLMicroLocationProto::CloudBackupImport::~CloudBackupImport((CLMicroLocationProto::CloudBackupImport *)v13);
  boost::uuids::detail::random_provider_base::destroy((boost::uuids::detail::random_provider_base *)&v14);
  *(void *)buf.var0.var0 = 0;
  *(void *)&buf.var0.var0[8] = &buf;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  objc_super v9 = +[ULTransactionManager shared];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__ULBackupAndRestore_importiCloudBackup__block_invoke;
  v12[3] = &unk_2653F9670;
  v12[4] = self;
  v12[5] = &buf;
  [v9 performUnderTransaction:@"com.apple.milod.importiCloudBackup" block:v12];

  BOOL v10 = *(unsigned char *)(*(void *)&buf.var0.var0[8] + 24) != 0;
  _Block_object_dispose(&buf, 8);
  return v10;
}

uint64_t __40__ULBackupAndRestore_importiCloudBackup__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _importiCloudBackupTransaction];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)deleteBackupFiles
{
  id v5 = [MEMORY[0x263F08850] defaultManager];
  v3 = [(ULBackupAndRestore *)self getBackupDatabasePath];
  [v5 removeItemAtPath:v3 error:0];
  id v4 = [(ULBackupAndRestore *)self _getTempBackupDatabaseDirectoryClearCurrent:1 createNew:0];
}

- (id)getBackupDatabasePath
{
  v2 = objc_msgSend((id)-[ULBackupAndRestore db](self, "db")[8], "storesDirectory");
  v3 = [v2 URLByAppendingPathComponent:@"miloBackup.db"];
  id v4 = [v3 path];

  return v4;
}

- (BOOL)_exportiCloudBackupTransactionWithCancelFunc:(function<BOOL)(
{
  id v4 = [MEMORY[0x263EFF910] date];
  [(ULBackupAndRestore *)self _getTempBackupDatabaseDirectoryClearCurrent:1 createNew:1];
  if (objc_claimAutoreleasedReturnValue()) {
    operator new();
  }

  return 0;
}

- (BOOL)_importiCloudBackupTransaction
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF910] date];
  id v4 = [(ULBackupAndRestore *)self getBackupDatabasePath];
  id v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    [(ULBackupAndRestore *)self _getTempBackupDatabaseDirectoryClearCurrent:1 createNew:1];
    if (objc_claimAutoreleasedReturnValue()) {
      operator new();
    }
    id v9 = (id)[(ULBackupAndRestore *)self db][112];
    CFAbsoluteTime v12 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v15, 10, &v12);
    BOOL v10 = operator new(0x10uLL);
    *(void *)int v14 = v10 + 4;
    *(void *)&v14[8] = v10 + 4;
    *(void *)BOOL v10 = v15;
    v10[2] = v16;
    *(void *)Entry buf = v10;
    [v9 insertEntries:buf];
    if (*(void *)buf)
    {
      *(void *)int v14 = *(void *)buf;
      operator delete(*(void **)buf);
    }

    BOOL v8 = 0;
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    uint64_t v7 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)Entry buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)int v14 = 2082;
      *(void *)&v14[2] = "";
      *(_WORD *)&v14[10] = 2113;
      *(void *)&v14[12] = v4;
      _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Skipping Microlocation iCloud restore. Restored backup file does not exist\", \"filePath\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    BOOL v8 = 1;
  }

  return v8;
}

- (void)_deleteTempDb:(ULDatabase *)a3
{
  ULDatabase::destroyStore(a3);
  id v6 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [a3->var1 getLocalStoreURL];
  id v5 = [v4 path];
  [v6 removeItemAtPath:v5 error:0];
}

- (unint64_t)_getFileSize:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v10 = 0;
  id v5 = [v4 attributesOfItemAtPath:v3 error:&v10];
  id v6 = v10;
  unint64_t v7 = [v5 fileSize];

  if (v6)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    BOOL v8 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)Entry buf = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      int v14 = "";
      __int16 v15 = 2113;
      id v16 = v3;
      __int16 v17 = 2113;
      id v18 = v6;
      _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Failed to get file size\", \"filePath\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
    }
  }

  return v7;
}

- (BOOL)_clearTempBackupDirectory:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = +[ULPersistenceManager defaultLocalStoreFilename];
  id v6 = [v3 stringByAppendingPathComponent:v5];

  if (![v4 fileExistsAtPath:v6])
  {
    id v8 = 0;
    goto LABEL_13;
  }
  id v13 = 0;
  char v7 = [v4 removeItemAtPath:v6 error:&v13];
  id v8 = v13;
  if (v7)
  {
LABEL_13:
    BOOL v11 = 1;
    goto LABEL_14;
  }
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
  }
  id v9 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)Entry buf = 68289539;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2113;
    uint64_t v19 = v6;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to remove existing temp database\", \"filePath\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
  }
  id v10 = logObject_MicroLocation_Default;
  if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
  {
    *(_DWORD *)Entry buf = 68289539;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2113;
    uint64_t v19 = v6;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_signpost_emit_with_name_impl(&dword_25631F000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to remove existing temp database", "{\"msg%{public}.0s\":\"Failed to remove existing temp database\", \"filePath\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  BOOL v11 = 0;
LABEL_14:

  return v11;
}

- (BOOL)_createTempBackupDirectoryIfNotExists:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [NSNumber numberWithUnsignedShort:511];
    uint64_t v21 = *MEMORY[0x263F08078];
    v22[0] = v6;
    char v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v12 = 0;
    char v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:v7 error:&v12];
    id v8 = v12;

    if ((v5 & 1) == 0)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
      }
      id v9 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)Entry buf = 68289539;
        int v14 = 0;
        __int16 v15 = 2082;
        __int16 v16 = "";
        __int16 v17 = 2113;
        id v18 = v3;
        __int16 v19 = 2114;
        id v20 = v8;
        _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to create temp backup directory\", \"directory\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
      }
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
      }
      id v10 = logObject_MicroLocation_Default;
      if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
      {
        *(_DWORD *)Entry buf = 68289539;
        int v14 = 0;
        __int16 v15 = 2082;
        __int16 v16 = "";
        __int16 v17 = 2113;
        id v18 = v3;
        __int16 v19 = 2114;
        id v20 = v8;
        _os_signpost_emit_with_name_impl(&dword_25631F000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to create temp backup directory", "{\"msg%{public}.0s\":\"Failed to create temp backup directory\", \"directory\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
      }
    }
  }
  return v5;
}

- (id)_getTempBackupDatabaseDirectoryClearCurrent:(BOOL)a3 createNew:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v30[1] = *MEMORY[0x263EF8340];
  char v7 = [MEMORY[0x263F08850] defaultManager];
  id v8 = NSTemporaryDirectory();
  id v9 = [NSNumber numberWithUnsignedShort:493];
  uint64_t v29 = *MEMORY[0x263F08078];
  v30[0] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v20 = 0;
  char v11 = [v7 setAttributes:v10 ofItemAtPath:v8 error:&v20];
  id v12 = v20;

  if (v11)
  {
    id v13 = [v8 stringByAppendingPathComponent:@"com.apple.milod"];
    int v14 = [v13 stringByAppendingPathComponent:@"miloTempBackup"];

    if ((!v5 || [(ULBackupAndRestore *)self _clearTempBackupDirectory:v14])
      && (!v4
       || [(ULBackupAndRestore *)self _createTempBackupDirectoryIfNotExists:v14]))
    {
      int v14 = v14;
      __int16 v15 = v14;
      goto LABEL_16;
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    __int16 v16 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [v8 UTF8String];
      *(_DWORD *)Entry buf = 68289539;
      int v22 = 0;
      __int16 v23 = 2082;
      v24 = "";
      __int16 v25 = 2081;
      uint64_t v26 = v17;
      __int16 v27 = 2114;
      id v28 = v12;
      _os_log_impl(&dword_25631F000, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to set attributes for directory\", \"directory\":%{private, location:escape_only}s, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
    }

    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    int v14 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v14))
    {
      uint64_t v18 = [v8 UTF8String];
      *(_DWORD *)Entry buf = 68289539;
      int v22 = 0;
      __int16 v23 = 2082;
      v24 = "";
      __int16 v25 = 2081;
      uint64_t v26 = v18;
      __int16 v27 = 2114;
      id v28 = v12;
      _os_signpost_emit_with_name_impl(&dword_25631F000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to set attributes for directory", "{\"msg%{public}.0s\":\"Failed to set attributes for directory\", \"directory\":%{private, location:escape_only}s, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
    }
  }
  __int16 v15 = 0;
LABEL_16:

  return v15;
}

- (BOOL)_createBackupDbPathWithAttributes:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v16 = *MEMORY[0x263F080A8];
  v17[0] = *MEMORY[0x263F08088];
  id v6 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  char v7 = [v5 createFileAtPath:v4 contents:0 attributes:v6];

  if (v7)
  {
    BOOL v8 = [(ULBackupAndRestore *)self _setExcludeFromBackupAttribute:v4 withValue:1];
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    id v9 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_INFO))
    {
      v11[0] = 68289283;
      v11[1] = 0;
      __int16 v12 = 2082;
      id v13 = "";
      __int16 v14 = 2113;
      id v15 = v4;
      _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Failed to create file at path\", \"filename\":%{private, location:escape_only}@}", (uint8_t *)v11, 0x1Cu);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_setClassBAttributeToFile:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v20 = *MEMORY[0x263F080A8];
  v21[0] = *MEMORY[0x263F08088];
  BOOL v5 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  id v11 = 0;
  char v6 = [v4 setAttributes:v5 ofItemAtPath:v3 error:&v11];
  id v7 = v11;

  if ((v6 & 1) == 0)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    BOOL v8 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)Entry buf = 68289539;
      int v13 = 0;
      __int16 v14 = 2082;
      id v15 = "";
      __int16 v16 = 2113;
      id v17 = v3;
      __int16 v18 = 2113;
      id v19 = v7;
      _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to set attribute for path\", \"path\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    id v9 = logObject_MicroLocation_Default;
    if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
    {
      *(_DWORD *)Entry buf = 68289539;
      int v13 = 0;
      __int16 v14 = 2082;
      id v15 = "";
      __int16 v16 = 2113;
      id v17 = v3;
      __int16 v18 = 2113;
      id v19 = v7;
      _os_signpost_emit_with_name_impl(&dword_25631F000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to set attribute for path", "{\"msg%{public}.0s\":\"Failed to set attribute for path\", \"path\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
    }
  }

  return v6;
}

- (BOOL)_setExcludeFromBackupAttribute:(id)a3 withValue:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = [NSURL fileURLWithPath:v5];
  id v7 = [NSNumber numberWithBool:v4];
  uint64_t v8 = *MEMORY[0x263EFF6B0];
  id v14 = 0;
  char v9 = [v6 setResourceValue:v7 forKey:v8 error:&v14];
  id v10 = v14;

  if ((v9 & 1) == 0)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    id v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)Entry buf = 68289539;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2113;
      id v20 = v5;
      __int16 v21 = 2113;
      id v22 = v10;
      _os_log_impl(&dword_25631F000, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to set attribute for path\", \"path\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    __int16 v12 = logObject_MicroLocation_Default;
    if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
    {
      *(_DWORD *)Entry buf = 68289539;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2113;
      id v20 = v5;
      __int16 v21 = 2113;
      id v22 = v10;
      _os_signpost_emit_with_name_impl(&dword_25631F000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to set attribute for path", "{\"msg%{public}.0s\":\"Failed to set attribute for path\", \"path\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
    }
  }

  return v9;
}

- (BOOL)_didReceiveCancel:(function<BOOL)(
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  var1 = a3->var0.var1;
  if (!var1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  int v4 = (*(uint64_t (**)(void *, SEL))(*(void *)var1 + 48))(var1, a2);
  if (v4)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    id v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      __int16 v8 = 2082;
      char v9 = "";
      _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Export backup - activity cancelled\"}", (uint8_t *)v7, 0x12u);
    }
  }
  return v4;
}

- (BOOL)_exportToDatabase:(ULDatabase *)a3 withCancelFunc:(function<BOOL)(
{
  v68[4] = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
  }
  id v7 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)Entry buf = 0;
    _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "Exporting milo data", buf, 2u);
  }
  id v8 = (id)[(ULBackupAndRestore *)self db][56];
  char v9 = +[ULDefaultsSingleton shared];
  uint64_t v10 = [v9 defaultsDictionary];

  id v11 = [NSString stringWithUTF8String:"ULCloudBackupMaxLoiGroupIdsToExport"];
  __int16 v12 = [v10 objectForKey:v11];
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v13 = [v12 unsignedIntValue];
  }
  else {
    uint64_t v13 = [&unk_2704F22E0 unsignedIntValue];
  }
  uint64_t v14 = v13;

  if (v8)
  {
    [v8 getDistinctHomeLoiGroupIdsWithLimit:v14];
  }
  else
  {
    v50 = 0;
    v51 = 0;
    uint64_t v52 = 0;
  }

  if (v51 == v50)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    id v22 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)Entry buf = 0;
      _os_log_impl(&dword_25631F000, v22, OS_LOG_TYPE_DEFAULT, "No Home LoiGroupIds found in LOI table. Will backup an empty db", buf, 2u);
    }
    goto LABEL_27;
  }
  std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v68, (uint64_t)a4);
  BOOL v15 = [(ULBackupAndRestore *)self _didReceiveCancel:v68];
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v68);
  if (!v15)
  {
    int v16 = (char *)v50;
    if (v50 == v51)
    {
      int v20 = 1;
    }
    else
    {
      do
      {
        id v17 = (id)[(ULBackupAndRestore *)self db][32];
        uint64_t v18 = ULSettings::get<ULSettings::CloudBackupDefaultTableLimit>();
        if (v17)
        {
          [v17 fetchLatestConfigurationPerTypeAtLoi:v16 withLimit:v18];
        }
        else
        {
          *(void *)Entry buf = 0;
          long long v55 = 0uLL;
        }

        id v19 = a3->var4;
        int v20 = [v19 insertEntries:buf];

        v53 = buf;
        std::vector<CLMicroLocationConfigurationTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v53);
        v16 += 16;
        if (v16 == v51) {
          char v21 = 0;
        }
        else {
          char v21 = v20;
        }
      }
      while ((v21 & 1) != 0);
    }
    std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v67, (uint64_t)a4);
    BOOL v24 = [(ULBackupAndRestore *)self _didReceiveCancel:v67];
    std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v67);
    if (!v24)
    {
      if (v20)
      {
        id v25 = (id)[(ULBackupAndRestore *)self db][56];
        uint64_t v26 = ULSettings::get<ULSettings::CloudBackupDefaultTableLimit>();
        if (v25)
        {
          [v25 fetchLoiIdEntriesforLoiGroupIds:&v50 withLimit:v26];
        }
        else
        {
          *(void *)Entry buf = 0;
          long long v55 = 0uLL;
        }

        int v27 = [a3->var7 insertEntries:buf];
        v53 = buf;
        std::vector<CLMiLoLoiTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v53);
      }
      else
      {
        int v27 = 0;
      }
      std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v66, (uint64_t)a4);
      BOOL v28 = [(ULBackupAndRestore *)self _didReceiveCancel:v66];
      std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v66);
      if (!v28)
      {
        if (v27)
        {
          __p = 0;
          v48 = 0;
          uint64_t v49 = 0;
          std::vector<boost::uuids::uuid>::__init_with_size[abi:ne180100]<boost::uuids::uuid*,boost::uuids::uuid*>(&__p, v50, (uint64_t)v51, (v51 - (unsigned char *)v50) >> 4);
          std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v65, (uint64_t)a4);
          int v27 = [(ULBackupAndRestore *)self _exportRecordingEventsForLoiGroupIds:&__p toDatabase:a3 withCancelFunc:v65];
          std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v65);
          if (__p)
          {
            v48 = __p;
            operator delete(__p);
          }
        }
        std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v64, (uint64_t)a4);
        BOOL v29 = [(ULBackupAndRestore *)self _didReceiveCancel:v64];
        std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v64);
        if (!v29)
        {
          if (v27)
          {
            v30 = [[ULStore alloc] initWithDb:a3];
            id v31 = (id)[(ULBackupAndRestore *)self db][64];
            unsigned int v32 = ULSettings::get<ULSettings::CloudBackupPageSize>();
            unsigned int v33 = ULSettings::get<ULSettings::CloudBackupMeasurementsLimit>();
            std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v63, (uint64_t)a4);
            char v34 = [v31 batchTransferRecordsUsingBatchSize:v32 andLimit:v33 usingDistinctRecords:1 intoTargetStore:v30 withCancelFunc:v63];
            std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v63);
          }
          else
          {
            char v34 = 0;
          }
          std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v62, (uint64_t)a4);
          BOOL v35 = [(ULBackupAndRestore *)self _didReceiveCancel:v62];
          std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v62);
          if (!v35)
          {
            v36 = _CLLogObjectForCategory_MicroLocation_Default();
            v37 = v36;
            if (v34)
            {
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                id v38 = a3->var11;
                int v39 = [v38 count];
                id v40 = a3->var8;
                int v41 = [v40 count];
                id v42 = a3->var4;
                int v43 = [v42 count];
                int v44 = [a3->var7 count];
                *(_DWORD *)Entry buf = 68290051;
                *(_DWORD *)&uint8_t buf[4] = 0;
                LOWORD(v55) = 2082;
                *(void *)((char *)&v55 + 2) = "";
                WORD5(v55) = 1025;
                HIDWORD(v55) = v39;
                __int16 v56 = 1025;
                int v57 = v41;
                __int16 v58 = 1025;
                int v59 = v43;
                __int16 v60 = 1025;
                int v61 = v44;
                _os_log_impl(&dword_25631F000, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Successfully exported milo data\", \"RecordingEvent\":%{private}u, \"Measurement\":%{private}u, \"Configuration\":%{private}u, \"LOI\":%{private}u}", buf, 0x2Au);
              }
LABEL_27:
              BOOL v23 = 1;
              goto LABEL_55;
            }
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)Entry buf = 68289026;
              *(_DWORD *)&uint8_t buf[4] = 0;
              LOWORD(v55) = 2082;
              *(void *)((char *)&v55 + 2) = "";
              _os_log_impl(&dword_25631F000, v37, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to export milo data\"}", buf, 0x12u);
            }

            v45 = _CLLogObjectForCategory_MicroLocation_Default();
            if (os_signpost_enabled(v45))
            {
              *(_DWORD *)Entry buf = 68289026;
              *(_DWORD *)&uint8_t buf[4] = 0;
              LOWORD(v55) = 2082;
              *(void *)((char *)&v55 + 2) = "";
              _os_signpost_emit_with_name_impl(&dword_25631F000, v45, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to export milo data", "{\"msg%{public}.0s\":\"Failed to export milo data\"}", buf, 0x12u);
            }
          }
        }
      }
    }
  }
  BOOL v23 = 0;
LABEL_55:
  if (v50)
  {
    v51 = v50;
    operator delete(v50);
  }
  return v23;
}

- (BOOL)_exportRecordingEventsForLoiGroupIds:()vector<boost:(std:(ULDatabase *)a4 :(function<BOOL)( allocator<boost::uuids::uuid>> *)a3 :uuids::uuid toDatabase:withCancelFunc:
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  char v9 = +[ULDefaultsSingleton shared];
  uint64_t v10 = [v9 defaultsDictionary];

  id v11 = [NSString stringWithUTF8String:"ULCloudBackupRecordingEventsTableLimit"];
  __int16 v12 = [v10 objectForKey:v11];
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v13 = [v12 unsignedIntValue];
  }
  else {
    uint64_t v13 = [&unk_2704F2328 unsignedIntValue];
  }
  uint64_t v14 = v13;

  ULSettings::getRecordingEventsForModelType((char **)&v50);
  v48 = 0;
  unint64_t v49 = 0;
  __p = 0;
  std::vector<CLMicroLocationProto::EventType>::__init_with_size[abi:ne180100]<std::__wrap_iter<CLMicroLocationProto::EventType*>,std::__wrap_iter<CLMicroLocationProto::EventType*>>(&__p, v50, (uint64_t)v51, (v51 - (unsigned char *)v50) >> 2);
  BOOL v15 = v48;
  if ((unint64_t)v48 >= v49)
  {
    id v17 = (char *)__p;
    uint64_t v18 = (v48 - (unsigned char *)__p) >> 2;
    unint64_t v19 = v18 + 1;
    if ((unint64_t)(v18 + 1) >> 62) {
      std::vector<CLMicroLocationProto::ConfidenceReason>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v20 = v49 - (void)__p;
    if ((uint64_t)(v49 - (void)__p) >> 1 > v19) {
      unint64_t v19 = v20 >> 1;
    }
    if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v21 = v19;
    }
    if (v21)
    {
      id v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CLMicroLocationProto::ConfidenceReason>>((uint64_t)&v49, v21);
      id v17 = (char *)__p;
      BOOL v15 = v48;
    }
    else
    {
      id v22 = 0;
    }
    BOOL v23 = &v22[4 * v18];
    BOOL v24 = &v22[4 * v21];
    *(_DWORD *)BOOL v23 = 1;
    int v16 = v23 + 4;
    while (v15 != v17)
    {
      int v25 = *((_DWORD *)v15 - 1);
      v15 -= 4;
      *((_DWORD *)v23 - 1) = v25;
      v23 -= 4;
    }
    __p = v23;
    v48 = v16;
    unint64_t v49 = (unint64_t)v24;
    if (v17) {
      operator delete(v17);
    }
  }
  else
  {
    *(_DWORD *)v48 = 1;
    int v16 = v15 + 4;
  }
  v48 = v16;
  var0 = a3->var0;
  if (a3->var0 != a3->var1)
  {
    while (1)
    {
      var1 = a5->var0.var1;
      if (!var1) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
      char v28 = (*(uint64_t (**)(void *))(*(void *)var1 + 48))(var1);
      char v29 = v14 ? v28 : 1;
      if (v29) {
        break;
      }
      id v30 = (id)[(ULBackupAndRestore *)self db][88];
      id v31 = v30;
      *(uuid *)v54 = *var0;
      LOBYTE(v55) = 1;
      if (v30)
      {
        [v30 fetchRecordingEventTriggersForLearningMeasurements:&v50 atLoiGroupId:v54];
      }
      else
      {
        int v44 = 0;
        v45 = 0;
        uint64_t v46 = 0;
      }

      v54[0] = 0;
      v54[1] = 0;
      uint64_t v55 = 0;
      std::vector<boost::uuids::uuid>::reserve(v54, 0xEF7BDEF7BDEF7BDFLL * ((v45 - v44) >> 3));
      unsigned int v32 = (long long *)v44;
      unsigned int v33 = v45;
      uint64_t v52 = v54;
      while (v32 != (long long *)v33)
      {
        long long v56 = *v32;
        std::back_insert_iterator<std::vector<boost::uuids::uuid>>::operator=[abi:ne180100](&v52, &v56);
        unsigned int v32 = (long long *)((char *)v32 + 248);
      }
      char v34 = [[ULStore alloc] initWithDb:a4];
      id v35 = (id)[(ULBackupAndRestore *)self db][88];
      unsigned int v36 = ULSettings::get<ULSettings::CloudBackupPageSize>();
      std::__function::__value_func<BOOL ()(void)>::__value_func[abi:ne180100]((uint64_t)v53, (uint64_t)a5);
      char v37 = [v35 batchTransferRecordingEventsForRecordingUUIDs:v54 withEventTypes:&__p batchSize:v36 andLimit:v14 intoTargetStore:v34 withCancelFunc:v53];
      std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v53);

      id v38 = a4->var11;
      int v39 = [v38 count];

      if (v54[0])
      {
        v54[1] = v54[0];
        operator delete(v54[0]);
      }
      uint64_t v14 = (v14 - v39);
      v54[0] = &v44;
      std::vector<CLMicroLocationRecordingEventsTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)v54);
      if (++var0 == a3->var1) {
        char v40 = 0;
      }
      else {
        char v40 = v37;
      }
      if ((v40 & 1) == 0)
      {
        if (v37) {
          break;
        }
        LOBYTE(v42) = 0;
        goto LABEL_42;
      }
    }
  }
  int v41 = a5->var0.var1;
  if (!v41) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  int v42 = (*(uint64_t (**)(void *))(*(void *)v41 + 48))(v41) ^ 1;
LABEL_42:
  if (__p)
  {
    v48 = (char *)__p;
    operator delete(__p);
  }
  if (v50)
  {
    v51 = v50;
    operator delete(v50);
  }
  return v42;
}

- (BOOL)_importFromDatabase:(ULDatabase *)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
  }
  id v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)Entry buf = 0;
    _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "Importing milo data", buf, 2u);
  }
  id v6 = (id)[(ULBackupAndRestore *)self db][112];
  CFAbsoluteTime v34 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v47, 1, &v34);
  id v7 = operator new(0x10uLL);
  *(void *)&long long v36 = v7 + 4;
  *((void *)&v36 + 1) = v7 + 4;
  *(void *)id v7 = v47;
  _DWORD v7[2] = v48;
  *(void *)Entry buf = v7;
  [v6 insertEntries:buf];
  if (*(void *)buf)
  {
    *(void *)&long long v36 = *(void *)buf;
    operator delete(*(void **)buf);
  }

  id v8 = [[ULStore alloc] initWithDb:[(ULBackupAndRestore *)self db]];
  id v9 = a3->var4;
  unsigned int v10 = ULSettings::get<ULSettings::CloudBackupPageSize>();
  v46[0] = &unk_2704E1E40;
  v46[3] = v46;
  char v11 = [v9 batchTransferRecordsUsingBatchSize:v10 andLimit:0 intoTargetStore:v8 withCancelFunc:v46];
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v46);

  id v12 = a3->var7;
  unsigned int v13 = ULSettings::get<ULSettings::CloudBackupPageSize>();
  v45[0] = &unk_2704E1E40;
  v45[3] = v45;
  char v14 = [v12 batchTransferRecordsUsingBatchSize:v13 andLimit:0 intoTargetStore:v8 withCancelFunc:v45];
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v45);

  id v15 = a3->var11;
  unsigned int v16 = ULSettings::get<ULSettings::CloudBackupPageSize>();
  v44[0] = &unk_2704E1E40;
  v44[3] = v44;
  char v17 = [v15 batchTransferRecordsUsingBatchSize:v16 andLimit:0 intoTargetStore:v8 withCancelFunc:v44];
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v44);

  id v18 = a3->var8;
  unsigned int v19 = ULSettings::get<ULSettings::CloudBackupPageSize>();
  v43[0] = &unk_2704E1E40;
  v43[3] = v43;
  char v20 = [v18 batchTransferRecordsUsingBatchSize:v19 andLimit:0 usingDistinctRecords:0 intoTargetStore:v8 withCancelFunc:v43];
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v43);

  char v21 = v11 & v14 & v17 & v20;
  if (v21)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    id v22 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = a3->var11;
      int v24 = [v23 count];
      id v25 = a3->var8;
      int v26 = [v25 count];
      id v27 = a3->var4;
      int v28 = [v27 count];
      id v29 = a3->var7;
      int v30 = [v29 count];
      *(_DWORD *)Entry buf = 68290051;
      *(_DWORD *)&uint8_t buf[4] = 0;
      LOWORD(v36) = 2082;
      *(void *)((char *)&v36 + 2) = "";
      WORD5(v36) = 1025;
      HIDWORD(v36) = v24;
      __int16 v37 = 1025;
      int v38 = v26;
      __int16 v39 = 1025;
      int v40 = v28;
      __int16 v41 = 1025;
      int v42 = v30;
      _os_log_impl(&dword_25631F000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Successfully imported milo data\", \"RecordingEvent\":%{private}u, \"Measurement\":%{private}u, \"Configuration\":%{private}u, \"LOI\":%{private}u}", buf, 0x2Au);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    id v31 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)Entry buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      LOWORD(v36) = 2082;
      *(void *)((char *)&v36 + 2) = "";
      _os_log_impl(&dword_25631F000, v31, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to import milo data\"}", buf, 0x12u);
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_112);
    }
    unsigned int v32 = logObject_MicroLocation_Default;
    if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
    {
      *(_DWORD *)Entry buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      LOWORD(v36) = 2082;
      *(void *)((char *)&v36 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_25631F000, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to import milo data", "{\"msg%{public}.0s\":\"Failed to import milo data\"}", buf, 0x12u);
    }
  }

  return v21;
}

- (ULDatabase)db
{
  return self->_db;
}

- (void)setDb:(ULDatabase *)a3
{
  self->_db = a3;
}

- (void)eventLogger
{
  return self->_eventLogger;
}

- (void)setEventLogger:(void *)a3
{
  self->_eventLogger = a3;
}

- (void)_importFromDatabase:
{
}

- (uint64_t)_importFromDatabase:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end