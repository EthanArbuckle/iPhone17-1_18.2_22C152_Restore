@interface CLConditionLedger
- (BOOL)addRecordForMonitoring:(id)a3 identifier:(id)a4 persist:(BOOL)a5;
- (BOOL)directoryExists:(id)a3;
- (BOOL)persistentFileReadSucceeded;
- (BOOL)readConditionsFromFile;
- (BOOL)removeRecordFromMonitoringWithIdentifier:(id)a3;
- (BOOL)shouldMigrate;
- (BOOL)writeToFile;
- (CLConditionLedger)initWithStoreType:(int64_t)a3 domain:(int64_t)a4 monitorConfiguration:(id)a5;
- (NSArray)allMonitoringIdentifiers;
- (NSDictionary)allMonitoringRecordsByIdentifier;
- (NSFileManager)defaultFileManager;
- (NSNumber)ledgerVersionNumber;
- (NSString)ledgerName;
- (NSURL)ledgerFile;
- (id)monitoringRecordForIdentifier:(id)a3;
- (void)dealloc;
- (void)deleteLedgerFile;
- (void)performMigration;
- (void)setLedgerForType:(int64_t)a3 domain:(int64_t)a4 monitor:(id)a5 client:(id)a6 path:(id)a7;
- (void)setLedgerVersionNumber:(int)a3;
- (void)updateEvent:(id)a3 forIdentifier:(id)a4;
- (void)updateRecord:(id)a3 identifier:(id)a4;
@end

@implementation CLConditionLedger

- (CLConditionLedger)initWithStoreType:(int64_t)a3 domain:(int64_t)a4 monitorConfiguration:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)CLConditionLedger;
  v9 = [(CLConditionLedger *)&v15 init];
  if (v9)
  {
    id v10 = [a5 objectForKeyedSubscript:@"kCLMonitorLedgerPathKey"];
    id v11 = [a5 objectForKeyedSubscript:@"kCLMonitorLedgerNameKey"];
    id v12 = [a5 objectForKeyedSubscript:@"kCLMonitorLedgerAccessKey"];
    id v13 = [a5 objectForKeyedSubscript:@"kCLMonitorLedgerProcessNameKey"];
    if (v11)
    {
      if (v12)
      {
LABEL_4:
        [(CLConditionLedger *)v9 setLedgerForType:a3 domain:a4 monitor:v11 client:v13 path:v10];
        v9->_recordTable = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v9->_encryptionKey = (NSData *)[v12 copy];
        v9->_ledgerName = (NSString *)[v11 copy];
        v9->_readSucceeded = [(CLConditionLedger *)v9 readConditionsFromFile];
        [(CLConditionLedger *)v9 performMigration];
        return v9;
      }
    }
    else
    {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v9 file:@"CLConditionLedger.mm" lineNumber:94 description:@"Monitor name is nil"];
      if (v12) {
        goto LABEL_4;
      }
    }
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, v9, @"CLConditionLedger.mm", 95, @"Key is nil to read/store %@ monitor's contents", v11 object file lineNumber description];
    goto LABEL_4;
  }
  return v9;
}

- (void)dealloc
{
  if (![(NSDictionary *)[(CLConditionLedger *)self allMonitoringRecordsByIdentifier] count])[(CLConditionLedger *)self deleteLedgerFile]; {

  }
  self->_ledgerFile = 0;
  self->_encryptionKey = 0;

  self->_recordTable = 0;
  self->_ledgerName = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLConditionLedger;
  [(CLConditionLedger *)&v3 dealloc];
}

- (BOOL)persistentFileReadSucceeded
{
  return self->_readSucceeded;
}

- (BOOL)shouldMigrate
{
  return [(NSNumber *)[(CLConditionLedger *)self ledgerVersionNumber] intValue] < 1;
}

- (void)performMigration
{
  if ([(CLConditionLedger *)self shouldMigrate])
  {
    [(CLConditionLedger *)self setLedgerVersionNumber:1];
  }
}

- (void)setLedgerVersionNumber:(int)a3
{
  self->_ledgerVersionNumber = (NSNumber *)[objc_alloc((Class)NSNumber) initWithInt:*(void *)&a3];
}

- (void)setLedgerForType:(int64_t)a3 domain:(int64_t)a4 monitor:(id)a5 client:(id)a6 path:(id)a7
{
  if ([(CLConditionLedger *)self ledgerFile]) {
    return;
  }
  int v14 = _sandbox_in_a_container();
  v28 = +[NSString stringWithFormat:@"%@.monitor", a5];
  if (a3 == 1 && a4 == 1)
  {
    if (!a7) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CLConditionLedger.mm", 169, @"#monitor Invalid path for custom store for %@ monitor", a5 object file lineNumber description];
    }
    objc_super v15 = +[NSURL fileURLWithPath:a7 isDirectory:1 relativeToURL:0];
    v16 = +[NSMutableString stringWithString:&stru_10234F018];
  }
  else
  {
    v16 = +[NSMutableString stringWithString:@"CoreLocation/"];
    if (a3)
    {
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_1022E8CE8);
      }
      v17 = qword_102419528;
      if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v30 = 0;
        __int16 v31 = 2082;
        v32 = "";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Custom store type cannot use on NSSearchPathDirectory\"}", buf, 0x12u);
        if (qword_102419520 != -1) {
          dispatch_once(&qword_102419520, &stru_1022E8CE8);
        }
      }
      v18 = qword_102419528;
      if (os_signpost_enabled((os_log_t)qword_102419528))
      {
        *(_DWORD *)buf = 68289026;
        int v30 = 0;
        __int16 v31 = 2082;
        v32 = "";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Custom store type cannot use on NSSearchPathDirectory", "{\"msg%{public}.0s\":\"Custom store type cannot use on NSSearchPathDirectory\"}", buf, 0x12u);
      }
      uint64_t v19 = 5;
    }
    else if (v14)
    {
      uint64_t v19 = 9;
    }
    else
    {
      uint64_t v19 = 5;
    }
    if (a4) {
      uint64_t v20 = 8;
    }
    else {
      uint64_t v20 = 1;
    }
    objc_super v15 = [(NSArray *)[(NSFileManager *)[(CLConditionLedger *)self defaultFileManager] URLsForDirectory:v19 inDomains:v20] firstObject];
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_1022E8CE8);
    }
    v21 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v30 = 0;
      __int16 v31 = 2082;
      v32 = "";
      __int16 v33 = 2114;
      id v34 = a6;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor App is not sanboxed\", \"client\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    if (![(CLConditionLedger *)self directoryExists:[(NSURL *)v15 URLByAppendingPathComponent:v16]])sub_101A7FC6C(); {
    if ((v14 & 1) == 0)
    }
    {
      v22 = CKSyncEngine_ptr;
      [(NSMutableString *)v16 appendString:+[NSString stringWithFormat:@"%@/", a6]];
      v23 = [(NSURL *)v15 URLByAppendingPathComponent:v16];
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_1022E8CE8);
      }
      v24 = qword_102419528;
      if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        int v30 = 0;
        __int16 v31 = 2082;
        v32 = "";
        __int16 v33 = 2114;
        id v34 = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor process is not containerized\", \"path\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
      if (![(CLConditionLedger *)self directoryExists:v23]) {
        sub_101A7FAE4();
      }
      goto LABEL_34;
    }
  }
  v22 = CKSyncEngine_ptr;
LABEL_34:
  if (!v15) {
    sub_101A7F914();
  }
  -[NSMutableString appendString:](v16, "appendString:", [v22[358] stringWithFormat:@"%@", v28]);
  v25 = [(NSURL *)v15 URLByAppendingPathComponent:v16];
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_1022E8CE8);
  }
  v26 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    v27 = [(NSString *)[(NSURL *)v25 path] UTF8String];
    *(_DWORD *)buf = 68289282;
    int v30 = 0;
    __int16 v31 = 2082;
    v32 = "";
    __int16 v33 = 2082;
    id v34 = (id)v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#monitor Conditions store\", \"path\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  self->_ledgerFile = +[NSURL fileURLWithPath:[(NSURL *)v25 path] isDirectory:0];
}

- (BOOL)directoryExists:(id)a3
{
  id v8 = 0;
  v4 = [(CLConditionLedger *)self defaultFileManager];
  if (qword_102480438 != -1) {
    dispatch_once(&qword_102480438, &stru_1022E8D08);
  }
  if (-[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", a3, 0, qword_102480430, &v8)|| [v8 code] == (id)516)
  {
    return 1;
  }
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_1022E8CE8);
  }
  v6 = qword_102419528;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v7)
  {
    *(_DWORD *)buf = 68289538;
    int v10 = 0;
    __int16 v11 = 2082;
    id v12 = "";
    __int16 v13 = 2114;
    id v14 = v8;
    __int16 v15 = 2114;
    id v16 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #warning unable to check for directory\", \"error\":%{public, location:escape_only}@, \"pathURL\":%{public, location:escape_only}@}", buf, 0x26u);
    return 0;
  }
  return result;
}

- (NSFileManager)defaultFileManager
{
  return +[NSFileManager defaultManager];
}

- (BOOL)readConditionsFromFile
{
  objc_super v3 = [(CLConditionLedger *)self ledgerFile];
  if (!v3)
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_1022E8CE8);
    }
    id v14 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor path is nil for ledger file\"}", buf, 0x12u);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_1022E8CE8);
      }
    }
    uint64_t v15 = qword_102419528;
    BOOL v12 = os_signpost_enabled((os_log_t)qword_102419528);
    if (!v12) {
      return v12;
    }
    *(_DWORD *)buf = 68289026;
    int v52 = 0;
    __int16 v53 = 2082;
    v54 = "";
    id v16 = "#monitor path is nil for ledger file";
    v17 = "{\"msg%{public}.0s\":\"#monitor path is nil for ledger file\"}";
    v18 = v15;
    uint32_t v19 = 18;
LABEL_45:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v16, v17, buf, v19);
    goto LABEL_46;
  }
  v4 = v3;
  id v50 = 0;
  v5 = +[NSData dataWithContentsOfURL:v3 options:1 error:&v50];
  if (v50 && [v50 code] != (id)260)
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_1022E8CE8);
    }
    uint64_t v20 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      v21 = [(NSString *)[(NSURL *)v4 path] UTF8String];
      *(_DWORD *)buf = 68289538;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2082;
      *(void *)v56 = v21;
      *(_WORD *)&v56[8] = 2114;
      *(void *)&v56[10] = v50;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor #Warning Unable to read the contents of file\", \"file\":%{public, location:escape_only}s, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_1022E8CE8);
      }
    }
    uint64_t v22 = qword_102419528;
    BOOL v12 = os_signpost_enabled((os_log_t)qword_102419528);
    if (!v12) {
      return v12;
    }
    v23 = [(NSString *)[(NSURL *)v4 path] UTF8String];
    *(_DWORD *)buf = 68289538;
    int v52 = 0;
    __int16 v53 = 2082;
    v54 = "";
    __int16 v55 = 2082;
    *(void *)v56 = v23;
    *(_WORD *)&v56[8] = 2114;
    *(void *)&v56[10] = v50;
    id v16 = "#monitor #Warning Unable to read the contents of file";
    v17 = "{\"msg%{public}.0s\":\"#monitor #Warning Unable to read the contents of file\", \"file\":%{public, location:es"
          "cape_only}s, \"error\":%{public, location:escape_only}@}";
LABEL_44:
    v18 = v22;
    uint32_t v19 = 38;
    goto LABEL_45;
  }
  if (!v5)
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_1022E8CE8);
    }
    v24 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [(NSString *)[(NSURL *)v4 path] UTF8String];
      *(_DWORD *)buf = 68289282;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2082;
      *(void *)v56 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor no conditions were saved\", \"file\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    goto LABEL_53;
  }
  v6 = (char *)[(NSData *)v5 length] - 32;
  id v7 = [objc_alloc((Class)NSMutableData) initWithLength:v6];
  id v8 = [(NSData *)v5 bytes];
  [(NSData *)self->_encryptionKey bytes];
  [(NSData *)self->_encryptionKey length];
  v45 = &v6[(void)v8 + 16];
  uint64_t v46 = 16;
  v43 = v6;
  id v44 = [v7 mutableBytes];
  int v9 = CCCryptorGCMOneshotDecrypt();
  if (!v9)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_102480428, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_102480428))
    {
      uint64_t v49 = objc_opt_class();
      uint64_t v48 = objc_opt_class();
      uint64_t v47 = objc_opt_class();
      uint64_t v36 = objc_opt_class();
      uint64_t v37 = objc_opt_class();
      uint64_t v38 = objc_opt_class();
      uint64_t v39 = objc_opt_class();
      uint64_t v40 = objc_opt_class();
      uint64_t v41 = objc_opt_class();
      qword_102480420 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v49, v48, v47, v36, v37, v38, v39, v40, v41, objc_opt_class(), 0);
      __cxa_guard_release(&qword_102480428);
    }
    id v26 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", qword_102480420, v7, &v50, v43, v44, v45, v46);
    if (!v50)
    {
      v27 = v26;
      if (v26)
      {
        id v28 = +[NSMutableDictionary dictionary];
        [v28 addEntriesFromDictionary:v27];
        if ([v27 objectForKeyedSubscript:@"kCLLedgerVersionNumber"])
        {
          self->_ledgerVersionNumber = (NSNumber *)[v27 objectForKeyedSubscript:@"kCLLedgerVersionNumber"];
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022E8D28);
          }
          v29 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
          {
            int v30 = [(CLConditionLedger *)self ledgerVersionNumber];
            *(_DWORD *)buf = 68289282;
            int v52 = 0;
            __int16 v53 = 2082;
            v54 = "";
            __int16 v55 = 2114;
            *(void *)v56 = v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor Found ledger version number\", \"ledgerVersion\":%{public, location:escape_only}@}", buf, 0x1Cu);
          }
          [v28 removeObjectForKey:@"kCLLedgerVersionNumber"];
        }
        else
        {
          self->_ledgerVersionNumber = (NSNumber *)&off_1023930B0;
        }
        if (qword_102419520 != -1) {
          dispatch_once(&qword_102419520, &stru_1022E8CE8);
        }
        id v34 = qword_102419528;
        if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
        {
          id v35 = [v28 count];
          *(_DWORD *)buf = 68289282;
          int v52 = 0;
          __int16 v53 = 2082;
          v54 = "";
          __int16 v55 = 2050;
          *(void *)v56 = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor file has conditions saved\", \"count\":%{public}ld}", buf, 0x1Cu);
        }
        [(NSMutableDictionary *)self->_recordTable addEntriesFromDictionary:v28];
LABEL_53:
        LOBYTE(v12) = 1;
        return v12;
      }
    }
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_1022E8CE8);
    }
    __int16 v31 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      v32 = [(NSString *)[(NSURL *)v4 path] UTF8String];
      *(_DWORD *)buf = 68289539;
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2081;
      *(void *)v56 = v32;
      *(_WORD *)&v56[8] = 2114;
      *(void *)&v56[10] = v50;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor #Warning unable to read conditions from file\", \"file\":%{private, location:escape_only}s, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_1022E8CE8);
      }
    }
    uint64_t v22 = qword_102419528;
    BOOL v12 = os_signpost_enabled((os_log_t)qword_102419528);
    if (!v12) {
      return v12;
    }
    __int16 v33 = [(NSString *)[(NSURL *)v4 path] UTF8String];
    *(_DWORD *)buf = 68289539;
    int v52 = 0;
    __int16 v53 = 2082;
    v54 = "";
    __int16 v55 = 2081;
    *(void *)v56 = v33;
    *(_WORD *)&v56[8] = 2114;
    *(void *)&v56[10] = v50;
    id v16 = "#monitor #Warning unable to read conditions from file";
    v17 = "{\"msg%{public}.0s\":\"#monitor #Warning unable to read conditions from file\", \"file\":%{private, location:e"
          "scape_only}s, \"error\":%{public, location:escape_only}@}";
    goto LABEL_44;
  }
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_1022E8CE8);
  }
  int v10 = qword_102419528;
  BOOL v11 = os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT);
  LOBYTE(v12) = 0;
  if (v11)
  {
    __int16 v13 = [(CLConditionLedger *)self ledgerFile];
    *(_DWORD *)buf = 68289538;
    int v52 = 0;
    __int16 v53 = 2082;
    v54 = "";
    __int16 v55 = 1026;
    *(_DWORD *)v56 = v9;
    *(_WORD *)&v56[4] = 2114;
    *(void *)&v56[6] = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #Warning unable to decrypt the conditions\", \"error\":%{public}d, \"ledger\":%{public, location:escape_only}@}", buf, 0x22u);
LABEL_46:
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (BOOL)writeToFile
{
  objc_super v3 = [(CLConditionLedger *)self ledgerFile];
  if (!v3) {
    return (char)v3;
  }
  if (![(NSDictionary *)[(CLConditionLedger *)self allMonitoringRecordsByIdentifier] count])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022E8D28);
    }
    uint64_t v22 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      int v35 = 0;
      __int16 v36 = 2082;
      uint64_t v37 = "";
      __int16 v38 = 2114;
      uint64_t v39 = [(NSURL *)[(CLConditionLedger *)self ledgerFile] path];
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#monitor nothing to write; Removing existing file\", \"file\":%{public, location:escape_only}@}",
        buf,
        0x1Cu);
    }
    [(CLConditionLedger *)self deleteLedgerFile];
    goto LABEL_26;
  }
  id v4 = +[NSMutableDictionary dictionary];
  [v4 addEntriesFromDictionary:-[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier")];
  [v4 setObject:-[CLConditionLedger ledgerVersionNumber](self, "ledgerVersionNumber") forKey:@"kCLLedgerVersionNumber"];
  uint64_t v33 = 0;
  v5 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", +[NSDictionary dictionaryWithDictionary:v4], 1, &v33);
  if (v33 || (v6 = v5) == 0)
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_1022E8CE8);
    }
    v23 = qword_102419528;
    BOOL v24 = os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v3) = 0;
    if (v24)
    {
      v25 = [(NSURL *)[(CLConditionLedger *)self ledgerFile] path];
      *(_DWORD *)buf = 68289538;
      int v35 = 0;
      __int16 v36 = 2082;
      uint64_t v37 = "";
      __int16 v38 = 2114;
      uint64_t v39 = v25;
      __int16 v40 = 2114;
      uint64_t v41 = v33;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor Unable to store conditions\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
LABEL_41:
      LOBYTE(v3) = 0;
      return (char)v3;
    }
    return (char)v3;
  }
  id v7 = [objc_alloc((Class)NSMutableData) initWithLength:([v5 length] + 32)];
  id v8 = (char *)[v7 mutableBytes];
  int v9 = (char *)[(NSData *)v6 length] + (void)(v8 + 16);
  int v10 = SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, v8);
  if (v10)
  {
    int v11 = v10;
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_1022E8CE8);
    }
    BOOL v12 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v35 = 0;
      __int16 v36 = 2082;
      uint64_t v37 = "";
      __int16 v38 = 1026;
      LODWORD(v39) = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unable to init random vector\", \"error\":%{public}d}", buf, 0x18u);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_1022E8CE8);
      }
    }
    __int16 v13 = qword_102419528;
    if (os_signpost_enabled((os_log_t)qword_102419528))
    {
      *(_DWORD *)buf = 68289282;
      int v35 = 0;
      __int16 v36 = 2082;
      uint64_t v37 = "";
      __int16 v38 = 1026;
      LODWORD(v39) = v11;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor unable to init random vector", "{\"msg%{public}.0s\":\"#monitor unable to init random vector\", \"error\":%{public}d}", buf, 0x18u);
    }
  }
  [(NSData *)self->_encryptionKey bytes];
  [(NSData *)self->_encryptionKey length];
  [(NSData *)v6 bytes];
  id v32 = [(NSData *)v6 length];
  int v14 = CCCryptorGCMOneshotEncrypt();
  if (v14)
  {
    int v15 = v14;
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_1022E8CE8);
    }
    id v16 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v35 = 0;
      __int16 v36 = 2082;
      uint64_t v37 = "";
      __int16 v38 = 1026;
      LODWORD(v39) = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unable to encrypt the conditions\", \"error\":%{public}d}", buf, 0x18u);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_1022E8CE8);
      }
    }
    uint64_t v17 = qword_102419528;
    LODWORD(v3) = os_signpost_enabled((os_log_t)qword_102419528);
    if (v3)
    {
      *(_DWORD *)buf = 68289282;
      int v35 = 0;
      __int16 v36 = 2082;
      uint64_t v37 = "";
      __int16 v38 = 1026;
      LODWORD(v39) = v15;
      v18 = "#monitor unable to encrypt the conditions";
      uint32_t v19 = "{\"msg%{public}.0s\":\"#monitor unable to encrypt the conditions\", \"error\":%{public}d}";
      uint64_t v20 = v17;
      uint32_t v21 = 24;
LABEL_40:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v18, v19, buf, v21);
      goto LABEL_41;
    }
    return (char)v3;
  }
  unsigned __int8 v26 = [v7 writeToURL:-[CLConditionLedger ledgerFile](self, "ledgerFile", v32, v8 + 16, v9, 16) options:1073741825 error:&v33];
  if (!v33 && (v26 & 1) != 0)
  {
LABEL_26:
    LOBYTE(v3) = 1;
    return (char)v3;
  }
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_1022E8CE8);
  }
  v27 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_ERROR))
  {
    id v28 = [(NSURL *)[(CLConditionLedger *)self ledgerFile] path];
    *(_DWORD *)buf = 68289538;
    int v35 = 0;
    __int16 v36 = 2082;
    uint64_t v37 = "";
    __int16 v38 = 2114;
    uint64_t v39 = v28;
    __int16 v40 = 2114;
    uint64_t v41 = v33;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#monitor #Warning unable to write to file\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_1022E8CE8);
    }
  }
  uint64_t v29 = qword_102419528;
  LODWORD(v3) = os_signpost_enabled((os_log_t)qword_102419528);
  if (v3)
  {
    int v30 = [(NSURL *)[(CLConditionLedger *)self ledgerFile] path];
    *(_DWORD *)buf = 68289538;
    int v35 = 0;
    __int16 v36 = 2082;
    uint64_t v37 = "";
    __int16 v38 = 2114;
    uint64_t v39 = v30;
    __int16 v40 = 2114;
    uint64_t v41 = v33;
    v18 = "#monitor #Warning unable to write to file";
    uint32_t v19 = "{\"msg%{public}.0s\":\"#monitor #Warning unable to write to file\", \"file\":%{public, location:escape_only}@,"
          " \"error\":%{public, location:escape_only}@}";
    uint64_t v20 = v29;
    uint32_t v21 = 38;
    goto LABEL_40;
  }
  return (char)v3;
}

- (void)deleteLedgerFile
{
  uint64_t v5 = 0;
  [(NSFileManager *)[(CLConditionLedger *)self defaultFileManager] removeItemAtURL:[(CLConditionLedger *)self ledgerFile] error:&v5];
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_1022E8CE8);
  }
  objc_super v3 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CLConditionLedger *)self ledgerFile];
    *(_DWORD *)buf = 68289538;
    int v7 = 0;
    __int16 v8 = 2082;
    int v9 = "";
    __int16 v10 = 2114;
    int v11 = v4;
    __int16 v12 = 2114;
    uint64_t v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor deleting\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
  }
}

- (BOOL)addRecordForMonitoring:(id)a3 identifier:(id)a4 persist:(BOOL)a5
{
  BOOL v5 = a5;
  [(NSMutableDictionary *)self->_recordTable setObject:a3 forKeyedSubscript:a4];
  if (!v5) {
    return 1;
  }

  return [(CLConditionLedger *)self writeToFile];
}

- (void)updateRecord:(id)a3 identifier:(id)a4
{
}

- (BOOL)removeRecordFromMonitoringWithIdentifier:(id)a3
{
  [(NSMutableDictionary *)self->_recordTable removeObjectForKey:a3];

  return [(CLConditionLedger *)self writeToFile];
}

- (void)updateEvent:(id)a3 forIdentifier:(id)a4
{
  [[self->_recordTable objectForKeyedSubscript:a4] updateEvent:a3];

  [(CLConditionLedger *)self writeToFile];
}

- (id)monitoringRecordForIdentifier:(id)a3
{
  return [(NSMutableDictionary *)self->_recordTable objectForKeyedSubscript:a3];
}

- (NSDictionary)allMonitoringRecordsByIdentifier
{
  return &self->_recordTable->super;
}

- (NSArray)allMonitoringIdentifiers
{
  return (NSArray *)[(NSMutableDictionary *)self->_recordTable allKeys];
}

- (NSString)ledgerName
{
  return self->_ledgerName;
}

- (NSNumber)ledgerVersionNumber
{
  return self->_ledgerVersionNumber;
}

- (NSURL)ledgerFile
{
  return self->_ledgerFile;
}

@end