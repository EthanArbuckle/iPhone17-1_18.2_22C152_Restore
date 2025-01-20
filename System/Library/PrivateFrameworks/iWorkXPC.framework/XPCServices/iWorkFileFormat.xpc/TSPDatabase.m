@interface TSPDatabase
- (BOOL)closeWithError:(id *)a3;
- (BOOL)documentVersion:(id *)a3 closedCleanlyToken:(int64_t *)a4 error:(id *)a5;
- (BOOL)documentVersion:(unint64_t *)a3 error:(id *)a4;
- (BOOL)insertDataStateWithSize:(int)a3 identifier:(int64_t *)a4 error:(id *)a5;
- (BOOL)insertObjectWithIdentifier:(int64_t)a3 stateIdentifier:(const ObjectStateIdentifier *)a4 classType:(int)a5 error:(id *)a6;
- (BOOL)insertRelationshipWithSourceIdentifier:(int64_t)a3 targetIdentifier:(int64_t)a4 error:(id *)a5;
- (BOOL)lastObjectIdentifier:(int64_t *)a3 error:(id *)a4;
- (BOOL)needsUpgradeFromSchemaVersion:(int)a3;
- (BOOL)numberOfDatabaseObjects:(unint64_t *)a3 error:(id *)a4;
- (BOOL)setClosedCleanlyToken:(int64_t)a3 error:(id *)a4;
- (BOOL)setDocumentVersion:(id)a3 error:(id *)a4;
- (BOOL)updateDataStateWithIdentifier:(int64_t)a3 size:(int)a4 error:(id *)a5;
- (BOOL)upgradeFromSchemaVersion:(int)a3 error:(id *)a4;
- (TSPDatabase)init;
- (TSPDatabase)initWithPath:(id)a3 error:(id *)a4;
- (id)initReadonlyWithPath:(id)a3 error:(id *)a4;
- (id)objectFromStatement:(sqlite3_stmt *)a3;
- (id)queryFirstObjectWithStatement:(sqlite3_stmt *)a3 error:(id *)a4;
- (id)queryObjectWithIdentifier:(int64_t)a3 error:(id *)a4;
- (id)queryObjectsWithMessageTypes:(const int *)a3 messageTypesCount:(int)a4 error:(id *)a5;
- (sqlite3_blob)openBlobForObject:(id)a3 error:(id *)a4;
- (sqlite3_blob)openDataStateBlobWithIdentifier:(int64_t)a3 error:(id *)a4;
- (sqlite3_blob)openDataStateBlobWithIdentifier:(int64_t)a3 willWrite:(BOOL)a4 error:(id *)a5;
- (void)filterIdentifiers:(const void *)a3 error:(id *)a4;
- (void)newRelationshipTargetsForSourceIdentifier:(int64_t)a3 error:(id *)a4;
@end

@implementation TSPDatabase

- (TSPDatabase)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C6B18);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSPDatabase init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabase.mm";
    __int16 v14 = 1024;
    int v15 = 57;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDatabase init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabase.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:57 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPDatabase init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPDatabase)initWithPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 stringByAppendingPathComponent:@"index.db"];
  v12.receiver = self;
  v12.super_class = (Class)TSPDatabase;
  v8 = [(TSUDatabase *)&v12 initWithPath:v7 error:a4];

  if (v8)
  {
    unsigned int v9 = (NSURL *)[objc_alloc((Class)NSURL) initFileURLWithPath:v6];
    packageURL = v8->_packageURL;
    v8->_packageURL = v9;

    v8->_incrementalVacuum = 1;
  }
  else
  {
    sub_100024964(a4);
  }

  return v8;
}

- (id)initReadonlyWithPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 stringByAppendingPathComponent:@"index.db"];
  v12.receiver = self;
  v12.super_class = (Class)TSPDatabase;
  v8 = [(TSUDatabase *)&v12 initReadonlyWithPath:v7 error:a4];

  if (v8)
  {
    id v9 = [objc_alloc((Class)NSURL) initFileURLWithPath:v6];
    __int16 v10 = (void *)v8[6];
    v8[6] = v9;

    *((unsigned char *)v8 + 56) = 1;
  }
  else
  {
    sub_100024964(a4);
  }

  return v8;
}

- (BOOL)closeWithError:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSPDatabase;
  BOOL v4 = -[TSUDatabase closeWithError:](&v6, "closeWithError:");
  if (!v4) {
    sub_100024964(a3);
  }
  return v4;
}

- (BOOL)documentVersion:(unint64_t *)a3 error:(id *)a4
{
  if (!a3)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6B38);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162168();
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDatabase documentVersion:error:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabase.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 90, 0, "invalid nil value for '%{public}s'", "version");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  v11 = 0;
  if ([(TSUDatabase *)self prepareStatement:&v11 sql:"select version from document" error:a4])
  {
    if ([(TSUDatabase *)self startSingleResultQuery:v11 error:a4])
    {
      *a3 = sqlite3_column_int64(v11, 0);
      BOOL v9 = 1;
      if ([(TSUDatabase *)self endSingleResultQuery:v11 shouldFinalize:1 error:a4])
      {
        return v9;
      }
    }
    else if (a4)
    {
      *a4 = +[NSError tsp_errorWithCode:6];
    }
  }
  sub_100024964(a4);
  return 0;
}

- (BOOL)lastObjectIdentifier:(int64_t *)a3 error:(id *)a4
{
  if (!a3)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6B58);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001621FC();
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDatabase lastObjectIdentifier:error:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabase.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 111, 0, "invalid nil value for '%{public}s'", "identifier");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  objc_super v12 = 0;
  if ([(TSUDatabase *)self prepareStatement:&v12 sql:"select max(identifier) from objects" error:a4]&& [(TSUDatabase *)self startSingleResultQuery:v12 error:a4])
  {
    sqlite3_int64 v9 = sqlite3_column_int64(v12, 0);
    unsigned int v10 = [(TSUDatabase *)self endSingleResultQuery:v12 shouldFinalize:1 error:a4];
    if (a3 && v10)
    {
      *a3 = v9;
      return 1;
    }
    if (v10) {
      return 1;
    }
  }
  sub_100024964(a4);
  return 0;
}

- (BOOL)numberOfDatabaseObjects:(unint64_t *)a3 error:(id *)a4
{
  if (!a3)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6B78);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162290();
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDatabase numberOfDatabaseObjects:error:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabase.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 132, 0, "invalid nil value for '%{public}s'", "numberOfObjects");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  objc_super v12 = 0;
  if ([(TSUDatabase *)self prepareStatement:&v12 sql:"select count(*) from objects" error:a4]&& [(TSUDatabase *)self startSingleResultQuery:v12 error:a4])
  {
    int v9 = sqlite3_column_int(v12, 0);
    unsigned int v10 = [(TSUDatabase *)self endSingleResultQuery:v12 shouldFinalize:1 error:a4];
    if (a3 && v10)
    {
      *a3 = v9;
      return 1;
    }
    if (v10) {
      return 1;
    }
  }
  sub_100024964(a4);
  return 0;
}

- (void)filterIdentifiers:(const void *)a3 error:(id *)a4
{
  BOOL v4 = (char *)a3 + 8;
  if (*(const void **)a3 == (char *)a3 + 8) {
    operator new();
  }
  id v9 = objc_alloc_init((Class)NSMutableString);
  unsigned int v10 = *(char **)a3;
  if (*(char **)a3 != v4)
  {
    do
    {
      objc_msgSend(v9, "appendFormat:", @"%llu,", *((void *)v10 + 4));
      v11 = (char *)*((void *)v10 + 1);
      if (v11)
      {
        do
        {
          objc_super v12 = v11;
          v11 = *(char **)v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          objc_super v12 = (char *)*((void *)v10 + 2);
          BOOL v13 = *(void *)v12 == (void)v10;
          unsigned int v10 = v12;
        }
        while (!v13);
      }
      unsigned int v10 = v12;
    }
    while (v12 != v4);
  }
  if ([v9 length]) {
    objc_msgSend(v9, "deleteCharactersInRange:", (char *)objc_msgSend(v9, "length") - 1, 1);
  }
  pStmt = 0;
  id v14 = [objc_alloc((Class)NSString) initWithFormat:@"select identifier from objects where identifier in (%@)"];
  if (-[TSUDatabase prepareStatement:sql:error:](self, "prepareStatement:sql:error:", &pStmt, [v14 cStringUsingEncoding:4], a4))
  {
    operator new();
  }
  uint64_t v15 = sqlite3_finalize(pStmt);
  TSUHandleSqlite(v15, a4, 1, self, (uint64_t)a2, 181, 0, v16, (uint64_t)v9);
  sub_100024964(a4);

  return 0;
}

- (sqlite3_blob)openDataStateBlobWithIdentifier:(int64_t)a3 error:(id *)a4
{
  ppBlob = 0;
  uint64_t v7 = sqlite3_blob_open(self->super._db, "main", "dataStates", "state", a3, 0, &ppBlob);
  BOOL v9 = TSUHandleSqlite(v7, a4, 1, self, (uint64_t)a2, 198, @"Opening database blob", v8, v11);
  if (!v9) {
    sub_100024964(a4);
  }
  if (v9) {
    return ppBlob;
  }
  else {
    return 0;
  }
}

- (sqlite3_blob)openBlobForObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 hasDataState])
  {
    uint64_t v7 = -[TSPDatabase openDataStateBlobWithIdentifier:error:](self, "openDataStateBlobWithIdentifier:error:", [v6 dataState], a4);
  }
  else
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001C6B98);
    }
    uint64_t v8 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162324(v8);
    }
    if (*a4)
    {
      uint64_t v7 = 0;
    }
    else
    {
      +[NSError tsu_errorWithCode:1 userInfo:0];
      uint64_t v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (id)queryObjectWithIdentifier:(int64_t)a3 error:(id *)a4
{
  pStmt = 0;
  if (-[TSUDatabase prepareStatement:sql:error:](self, "prepareStatement:sql:error:", &pStmt, "select identifier, class, stateType, state from objects where identifier = ?", a4)&& (uint64_t v8 = sqlite3_bind_int64(pStmt, 1, a3), TSUHandleSqlite(v8, a4, 1, self, (uint64_t)a2, 227, 0, v9, v18)))
  {
    uint64_t v10 = [(TSPDatabase *)self queryFirstObjectWithStatement:pStmt error:a4];
    BOOL v11 = v10 != 0;
    objc_super v12 = (void *)v10;
  }
  else
  {
    BOOL v11 = 0;
    objc_super v12 = 0;
  }
  uint64_t v13 = sqlite3_finalize(pStmt);
  if (TSUHandleSqlite(v13, a4, 1, self, (uint64_t)a2, 234, @"Finalizing statement", v14, v18) && v11) {
    uint64_t v15 = v12;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  return v16;
}

- (id)queryObjectsWithMessageTypes:(const int *)a3 messageTypesCount:(int)a4 error:(id *)a5
{
  uint64_t v10 = +[NSMutableArray array];
  pStmt = 0;
  BOOL v11 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"(");
  if (a4 >= 1)
  {
    int v12 = 0;
    do
    {
      if (v12) {
        [v11 appendString:@", "];
      }
      [v11 appendString:@"?"];
      ++v12;
    }
    while (a4 != v12);
  }
  [v11 appendString:@""]);
  uint64_t v29 = (uint64_t)v11;
  id v13 = +[NSString stringWithFormat:@"select identifier, class, stateType, state from objects where class in %@"];
  id v14 = [v13 UTF8String];

  BOOL v15 = [(TSUDatabase *)self prepareStatement:&pStmt sql:v14 error:a5];
  if (a4 >= 1)
  {
    uint64_t v16 = 0;
    uint64_t v17 = a4;
    do
    {
      if (v15)
      {
        uint64_t v18 = v16 + 1;
        uint64_t v19 = sqlite3_bind_int64(pStmt, v16 + 1, a3[v16]);
        BOOL v15 = TSUHandleSqlite(v19, a5, 1, self, (uint64_t)a2, 260, 0, v20, v29);
        uint64_t v16 = v18;
      }
      else
      {
        BOOL v15 = 0;
        ++v16;
      }
    }
    while (v16 != v17);
  }
  uint64_t v21 = sqlite3_step(pStmt);
  while (v21 == 100)
  {
    v22 = [(TSPDatabase *)self objectFromStatement:pStmt];
    [v10 addObject:v22];
    uint64_t v21 = sqlite3_step(pStmt);
  }
  if (v21 != 101)
  {
    v23 = sqlite3_sql(pStmt);
    TSUHandleSqlite(v21, a5, 1, self, (uint64_t)a2, 273, @"Executing query \"%s\"", v24, (uint64_t)v23);
    BOOL v15 = 0;
  }
  uint64_t v25 = sqlite3_finalize(pStmt);
  if (TSUHandleSqlite(v25, a5, 1, self, (uint64_t)a2, 277, @"Finalizing statement", v26, v29) && v15) {
    id v27 = [v10 copy];
  }
  else {
    id v27 = 0;
  }

  return v27;
}

- (id)queryFirstObjectWithStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  uint64_t v8 = sqlite3_step(a3);
  if (v8 != 101)
  {
    uint64_t v9 = v8;
    if (v8 == 100)
    {
      uint64_t v10 = [(TSPDatabase *)self objectFromStatement:a3];
      goto LABEL_6;
    }
    BOOL v11 = sqlite3_sql(a3);
    TSUHandleSqlite(v9, a4, 1, self, (uint64_t)a2, 287, @"Executing query \"%s\"", v12, (uint64_t)v11);
  }
  uint64_t v10 = 0;
LABEL_6:
  return v10;
}

- (id)objectFromStatement:(sqlite3_stmt *)a3
{
  sqlite3_int64 v5 = sqlite3_column_int64(a3, 0);
  uint64_t v6 = sqlite3_column_int(a3, 1);
  if (sqlite3_column_int(a3, 2))
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", sqlite3_column_text(a3, 3), 4);
    uint64_t v8 = +[TSPDatabaseObject databaseObjectWithIdentifier:v5 classType:v6 fileState:v7 packageURL:self->_packageURL];
  }
  else
  {
    uint64_t v8 = +[TSPDatabaseObject databaseObjectWithIdentifier:v5 classType:v6 dataState:sqlite3_column_int64(a3, 3)];
  }
  return v8;
}

- (BOOL)needsUpgradeFromSchemaVersion:(int)a3
{
  return a3 < 5;
}

- (BOOL)upgradeFromSchemaVersion:(int)a3 error:(id *)a4
{
  if (self->_incrementalVacuum)
  {
    uint64_t v29 = 0;
    if ([(TSUDatabase *)self prepareStatement:&v29 sql:"pragma auto_vacuum" error:a4]
      && [(TSUDatabase *)self startSingleResultQuery:v29 error:a4]
      && [(TSUDatabase *)self executeUpdateWithSql:"pragma auto_vacuum = 2" error:a4])
    {
      unsigned int v8 = [(TSUDatabase *)self executeUpdateWithSql:"vacuum" error:a4];
    }
    else
    {
      unsigned int v8 = 0;
    }
  }
  else
  {
    unsigned int v8 = 1;
  }
  if (a3 >= 6)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6BB8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162368();
    }
    uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDatabase upgradeFromSchemaVersion:error:]");
    BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabase.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:337 isFatal:0 description:"Invalid schema version"];

    +[TSUAssertionHandler logBacktraceThrottled];
    if (v8)
    {
LABEL_11:
      unsigned int v9 = [(TSUDatabase *)self beginTransactionWithError:a4];
      goto LABEL_18;
    }
  }
  else
  {
    if (a3 == 5) {
      return 1;
    }
    if (v8) {
      goto LABEL_11;
    }
  }
  unsigned int v9 = 0;
LABEL_18:
  if (a3 == 1)
  {
    if (v9)
    {
      if ([(TSUDatabase *)self executeUpdateWithSql:"alter table objects rename to temp_migration_objects" error:a4])
      {
        if ([(TSUDatabase *)self executeUpdateWithSql:"create table objects (identifier integer primary key, class integer, stateType integer, state)" error:a4])
        {
          if (-[TSUDatabase executeUpdateWithSql:error:](self, "executeUpdateWithSql:error:", "insert into objects (identifier, class, stateType, state) select identifier, class, stateType, state from temp_migration_objects", a4))
          {
            if ([(TSUDatabase *)self executeUpdateWithSql:"drop table temp_migration_objects" error:a4])
            {
              if ([(TSUDatabase *)self executeUpdateWithSql:"alter table relationships rename to temp_migration_relationships" error:a4])
              {
                unsigned int v13 = [(TSUDatabase *)self executeUpdateWithSql:"create table relationships (sourceObject integer, targetObject integer, primary key(sourceObject, targetObject))" error:a4];
                uint64_t v29 = 0;
                if (v13)
                {
                  if (-[TSUDatabase prepareStatement:sql:error:](self, "prepareStatement:sql:error:", &v29, "insert into relationships (sourceObject, targetObject) select sourceObject, targetObject from temp_migration_relationships where updateType != ?", a4))
                  {
                    uint64_t v14 = sqlite3_bind_int(v29, 1, 0);
                    BOOL v16 = TSUHandleSqlite(v14, a4, 1, self, (uint64_t)a2, 388, 0, v15, v27);
                    unsigned int v9 = 0;
                    if (!v16)
                    {
LABEL_38:
                      a3 = 2;
                      goto LABEL_39;
                    }
                    unsigned int v17 = [(TSUDatabase *)self executeUpdate:v29 shouldFinalize:1 error:a4];
                    uint64_t v29 = 0;
                    if (v17)
                    {
                      unsigned int v9 = [(TSUDatabase *)self executeUpdateWithSql:"drop table temp_migration_relationships" error:a4];
                      goto LABEL_38;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    unsigned int v9 = 0;
    goto LABEL_38;
  }
  if (!a3)
  {
    if (!v9
      || ![(TSUDatabase *)self executeUpdateWithSql:"create table document (version integer, compatibleVersion integer, closedCleanly integer)" error:a4]|| ![(TSUDatabase *)self executeUpdateWithSql:"create table objects (identifier integer primary key, class integer, stateType integer, state)" error:a4]|| ![(TSUDatabase *)self executeUpdateWithSql:"create table relationships (sourceObject integer, targetObject integer, primary key(sourceObject, targetObject))" error:a4]|| ![(TSUDatabase *)self executeUpdateWithSql:"create table dataStates (identifier integer primary key, state blob)" error:a4])
    {
      goto LABEL_69;
    }
    uint64_t v12 = "create table cullingState (identifier integer primary key, change integer)";
LABEL_57:
    if ([(TSUDatabase *)self executeUpdateWithSql:v12 error:a4])
    {
      uint64_t v23 = 5;
      goto LABEL_66;
    }
LABEL_69:
    [(TSUDatabase *)self commitTransactionWithError:a4];
    goto LABEL_70;
  }
LABEL_39:
  if (a3 == 2) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = v9;
  }
  if (a3 == 2 && v9)
  {
    if ([(TSUDatabase *)self executeUpdateWithSql:"create table cullingState (identifier integer primary key, change integer)" error:a4])
    {
      goto LABEL_45;
    }
    goto LABEL_52;
  }
  if ((a3 - 4) >= 0xFFFFFFFE)
  {
    if (v18)
    {
LABEL_45:
      BOOL v18 = [(TSUDatabase *)self executeUpdateWithSql:"create table document (version integer, compatibleVersion integer, closedCleanly integer)" error:a4];
      uint64_t v29 = 0;
      if (v18)
      {
        if ([(TSUDatabase *)self prepareStatement:&v29 sql:"insert into document (version, compatibleVersion) values (?, ?)" error:a4])
        {
          uint64_t v19 = sqlite3_bind_int64(v29, 1, 0x2CBCC7AB8);
          BOOL v18 = TSUHandleSqlite(v19, a4, 1, self, (uint64_t)a2, 413, 0, v20, v27);
          if (v18)
          {
            uint64_t v21 = sqlite3_bind_int64(v29, 2, 0x2CBCC7AB8);
            BOOL v18 = TSUHandleSqlite(v21, a4, 1, self, (uint64_t)a2, 414, 0, v22, v28);
            if (v18) {
              BOOL v18 = [(TSUDatabase *)self executeUpdate:v29 shouldFinalize:1 error:a4];
            }
          }
        }
        else
        {
          BOOL v18 = 0;
        }
      }
      goto LABEL_53;
    }
LABEL_52:
    BOOL v18 = 0;
    uint64_t v29 = 0;
LABEL_53:
    a3 = 4;
  }
  if (a3 == 4 && v18)
  {
    uint64_t v12 = "alter table document add column closedCleanly integer";
    goto LABEL_57;
  }
  BOOL v24 = a3 != 4 && v18;
  if (a3 == 4) {
    uint64_t v23 = 5;
  }
  else {
    uint64_t v23 = a3;
  }
  if (!v24) {
    goto LABEL_69;
  }
LABEL_66:
  unsigned __int8 v25 = [(TSUDatabase *)self setSchemaVersion:v23 error:a4];
  if ([(TSUDatabase *)self commitTransactionWithError:a4] && (v25 & 1) != 0) {
    return 1;
  }
LABEL_70:
  sub_100024964(a4);
  return 0;
}

- (BOOL)setDocumentVersion:(id)a3 error:(id *)a4
{
  sqlite3_int64 var1 = a3.var1;
  sqlite3_int64 var0 = a3.var0;
  unsigned __int8 v25 = 0;
  if ([(TSUDatabase *)self prepareStatement:&v25 sql:"update document set version=? error:compatibleVersion=? where 1=1"]&& (uint64_t v9 = sqlite3_bind_int64(v25, 1, var0), TSUHandleSqlite(v9, a4, 1, self, (uint64_t)a2, 440, 0, v10, v23))&& (v11 = sqlite3_bind_int64(v25, 2, var1), TSUHandleSqlite(v11, a4, 1, self, (uint64_t)a2, 441, 0, v12, v23)))
  {
    unsigned int v13 = [(TSUDatabase *)self executeUpdate:v25 shouldFinalize:1 error:a4];
  }
  else
  {
    unsigned int v13 = 0;
  }
  int v14 = sqlite3_changes(self->super._db);
  if (v14)
  {
    if (v14 >= 2)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001C6BD8);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_1001623F0();
      }
      uint64_t v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDatabase setDocumentVersion:error:]");
      BOOL v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabase.mm"];
      +[TSUAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:453 isFatal:0 description:"Updated more than one row when setting the document version. Expecting this table to contain a maximum of one row"];

      +[TSUAssertionHandler logBacktraceThrottled];
      if ((v13 & 1) == 0) {
        goto LABEL_22;
      }
      return 1;
    }
    if (v13) {
      return 1;
    }
LABEL_22:
    sub_100024964(a4);
    return 0;
  }
  unsigned __int8 v25 = 0;
  if (!v13) {
    goto LABEL_22;
  }
  if (![(TSUDatabase *)self prepareStatement:&v25 sql:"insert into document (version, compatibleVersion) values (?, ?)" error:a4])goto LABEL_22; {
  uint64_t v17 = sqlite3_bind_int64(v25, 1, var0);
  }
  if (!TSUHandleSqlite(v17, a4, 1, self, (uint64_t)a2, 449, 0, v18, v23)) {
    goto LABEL_22;
  }
  uint64_t v19 = sqlite3_bind_int64(v25, 2, var1);
  if (!TSUHandleSqlite(v19, a4, 1, self, (uint64_t)a2, 450, 0, v20, v24)) {
    goto LABEL_22;
  }
  BOOL v21 = 1;
  if (![(TSUDatabase *)self executeUpdate:v25 shouldFinalize:1 error:a4]) {
    goto LABEL_22;
  }
  return v21;
}

- (BOOL)setClosedCleanlyToken:(int64_t)a3 error:(id *)a4
{
  uint64_t v19 = 0;
  if ([(TSUDatabase *)self prepareStatement:&v19 sql:"update document set closedCleanly=? where 1=1" error:a4]&& (uint64_t v8 = sqlite3_bind_int64(v19, 1, a3), TSUHandleSqlite(v8, a4, 1, self, (uint64_t)a2, 462, 0, v9, v18)))
  {
    unsigned int v10 = [(TSUDatabase *)self executeUpdate:v19 shouldFinalize:1 error:a4];
  }
  else
  {
    unsigned int v10 = 0;
  }
  int v11 = sqlite3_changes(self->super._db);
  if (v11)
  {
    if (v11 >= 2)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001C6BF8);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100162478();
      }
      uint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDatabase setClosedCleanlyToken:error:]");
      unsigned int v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabase.mm"];
      +[TSUAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:472 isFatal:0 description:"Updated more than one row when setting the document version. Expecting this table to contain a maximum of one row"];

      +[TSUAssertionHandler logBacktraceThrottled];
      if ((v10 & 1) == 0) {
        goto LABEL_20;
      }
      return 1;
    }
    if (v10) {
      return 1;
    }
LABEL_20:
    sub_100024964(a4);
    return 0;
  }
  uint64_t v19 = 0;
  if (!v10) {
    goto LABEL_20;
  }
  if (![(TSUDatabase *)self prepareStatement:&v19 sql:"insert into document (closedCleanly) values (?)" error:a4])goto LABEL_20; {
  uint64_t v14 = sqlite3_bind_int64(v19, 1, a3);
  }
  if (!TSUHandleSqlite(v14, a4, 1, self, (uint64_t)a2, 469, 0, v15, v18)) {
    goto LABEL_20;
  }
  BOOL v16 = 1;
  if (![(TSUDatabase *)self executeUpdate:v19 shouldFinalize:1 error:a4]) {
    goto LABEL_20;
  }
  return v16;
}

- (BOOL)documentVersion:(id *)a3 closedCleanlyToken:(int64_t *)a4 error:(id *)a5
{
  if (a3)
  {
    if (a4) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C6C18);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_100162594();
  }
  uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDatabase documentVersion:closedCleanlyToken:error:]");
  unsigned int v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabase.mm"];
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 479, 0, "invalid nil value for '%{public}s'", "version");

  +[TSUAssertionHandler logBacktraceThrottled];
  if (!a4)
  {
LABEL_9:
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6C38);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162500();
    }
    int v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDatabase documentVersion:closedCleanlyToken:error:]");
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabase.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 480, 0, "invalid nil value for '%{public}s'", "closedCleanlyToken");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
LABEL_14:
  uint64_t v15 = 0;
  if (-[TSUDatabase prepareStatement:sql:error:](self, "prepareStatement:sql:error:", &v15, "select version, compatibleVersion, closedCleanly from document", a5))
  {
    if ([(TSUDatabase *)self startSingleResultQuery:v15 error:a5])
    {
      a3->sqlite3_int64 var0 = sqlite3_column_int64(v15, 0);
      BOOL v13 = 1;
      a3->sqlite3_int64 var1 = sqlite3_column_int64(v15, 1);
      *a4 = sqlite3_column_int64(v15, 2);
      if ([(TSUDatabase *)self endSingleResultQuery:v15 shouldFinalize:1 error:a5])
      {
        return v13;
      }
    }
    else if (a5)
    {
      *a5 = +[NSError tsp_errorWithCode:6];
    }
  }
  sub_100024964(a5);
  return 0;
}

- (BOOL)insertObjectWithIdentifier:(int64_t)a3 stateIdentifier:(const ObjectStateIdentifier *)a4 classType:(int)a5 error:(id *)a6
{
  int hasDataState = TSP::ObjectStateIdentifier::hasDataState((TSP::ObjectStateIdentifier *)a4);
  p_insertObjectStatement = &self->_insertObjectStatement;
  BOOL v14 = [(TSUDatabase *)self prepareStatement:&self->_insertObjectStatement sql:"insert into objects (identifier, class, stateType, state) values (?, ?, ?, ?)" error:a6];
  if (v14)
  {
    uint64_t v15 = sqlite3_bind_int64(*p_insertObjectStatement, 1, a3);
    BOOL v14 = TSUHandleSqlite(v15, a6, 1, self, (uint64_t)a2, 509, 0, v16, v32);
    if (v14)
    {
      uint64_t v17 = sqlite3_bind_int(*p_insertObjectStatement, 2, a5);
      BOOL v14 = TSUHandleSqlite(v17, a6, 1, self, (uint64_t)a2, 510, 0, v18, v32);
      if (v14)
      {
        uint64_t v19 = sqlite3_bind_int(*p_insertObjectStatement, 3, hasDataState ^ 1);
        BOOL v14 = TSUHandleSqlite(v19, a6, 1, self, (uint64_t)a2, 511, 0, v20, v32);
      }
    }
  }
  if (hasDataState)
  {
    if (!v14) {
      goto LABEL_13;
    }
    BOOL v21 = *p_insertObjectStatement;
    sqlite3_int64 v22 = TSP::ObjectStateIdentifier::dataState((TSP::ObjectStateIdentifier *)a4);
    uint64_t v23 = sqlite3_bind_int64(v21, 4, v22);
    if (!TSUHandleSqlite(v23, a6, 1, self, (uint64_t)a2, 515, 0, v24, v32)) {
      goto LABEL_13;
    }
  }
  else
  {
    if (!v14) {
      goto LABEL_13;
    }
    unsigned __int8 v25 = TSP::ObjectStateIdentifier::fileState((TSP::ObjectStateIdentifier *)a4);
    id v26 = [v25 maximumLengthOfBytesUsingEncoding:4];
    uint64_t v27 = (const char *)malloc_type_malloc((size_t)v26, 0xC1DB4E20uLL);
    [v25 getCString:v27 maxLength:v26 encoding:4];
    uint64_t v28 = sqlite3_bind_text(*p_insertObjectStatement, 4, v27, -1, (void (__cdecl *)(void *))&_free);
    BOOL v30 = TSUHandleSqlite(v28, a6, 1, self, (uint64_t)a2, 525, 0, v29, v32);

    if (!v30) {
      goto LABEL_13;
    }
  }
  if ([(TSUDatabase *)self executeUpdate:*p_insertObjectStatement shouldFinalize:0 error:a6])
  {
    return 1;
  }
LABEL_13:
  sub_100024964(a6);
  return 0;
}

- (BOOL)insertDataStateWithSize:(int)a3 identifier:(int64_t *)a4 error:(id *)a5
{
  if (!a4)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6C58);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100162628();
    }
    unsigned int v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDatabase insertDataStateWithSize:identifier:error:]");
    int v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDatabase.mm"];
    uint64_t v16 = "identifier != NULL";
    +[TSUAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:539 isFatal:0 description:"Invalid parameter not satisfying: %{public}s"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  p_insertDataStateStatement = &self->_insertDataStateStatement;
  if ([(TSUDatabase *)self prepareStatement:&self->_insertDataStateStatement sql:"insert into dataStates (state) values (?)" error:a5]&& (uint64_t v13 = sqlite3_bind_zeroblob(*p_insertDataStateStatement, 1, a3), TSUHandleSqlite(v13, a5, 1, self, (uint64_t)a2, 543, 0, v14, (uint64_t)v16))&& [(TSUDatabase *)self executeUpdate:*p_insertDataStateStatement shouldFinalize:0 error:a5])
  {
    *a4 = sqlite3_last_insert_rowid(self->super._db);
    return 1;
  }
  else
  {
    sub_100024964(a5);
    return 0;
  }
}

- (BOOL)updateDataStateWithIdentifier:(int64_t)a3 size:(int)a4 error:(id *)a5
{
  p_updateDataStateStatement = &self->_updateDataStateStatement;
  if (-[TSUDatabase prepareStatement:sql:error:](self, "prepareStatement:sql:error:", &self->_updateDataStateStatement, "update dataStates set state = ? where identifier = ?"))
  {
    uint64_t v11 = sqlite3_bind_zeroblob(*p_updateDataStateStatement, 1, a4);
    if (TSUHandleSqlite(v11, a5, 1, self, (uint64_t)a2, 557, 0, v12, v16))
    {
      uint64_t v13 = sqlite3_bind_int64(*p_updateDataStateStatement, 2, a3);
      if (TSUHandleSqlite(v13, a5, 1, self, (uint64_t)a2, 558, 0, v14, v17)
        && [(TSUDatabase *)self executeUpdate:*p_updateDataStateStatement shouldFinalize:0 error:a5])
      {
        return 1;
      }
    }
  }
  sub_100024964(a5);
  return 0;
}

- (sqlite3_blob)openDataStateBlobWithIdentifier:(int64_t)a3 willWrite:(BOOL)a4 error:(id *)a5
{
  ppBlob = 0;
  uint64_t v8 = sqlite3_blob_open(self->super._db, "main", "dataStates", "state", a3, a4, &ppBlob);
  BOOL v10 = TSUHandleSqlite(v8, a5, 1, self, (uint64_t)a2, 568, @"Opening database blob", v9, v12);
  if (!v10) {
    sub_100024964(a5);
  }
  if (v10) {
    return ppBlob;
  }
  else {
    return 0;
  }
}

- (BOOL)insertRelationshipWithSourceIdentifier:(int64_t)a3 targetIdentifier:(int64_t)a4 error:(id *)a5
{
  p_insertRelationshipStatement = &self->_insertRelationshipStatement;
  if (-[TSUDatabase prepareStatement:sql:error:](self, "prepareStatement:sql:error:", &self->_insertRelationshipStatement, "insert into relationships (sourceObject, targetObject) values (?, ?)"))
  {
    uint64_t v11 = sqlite3_bind_int64(*p_insertRelationshipStatement, 1, a3);
    if (TSUHandleSqlite(v11, a5, 1, self, (uint64_t)a2, 580, 0, v12, v16))
    {
      uint64_t v13 = sqlite3_bind_int64(*p_insertRelationshipStatement, 2, a4);
      if (TSUHandleSqlite(v13, a5, 1, self, (uint64_t)a2, 581, 0, v14, v17)
        && [(TSUDatabase *)self executeUpdate:*p_insertRelationshipStatement shouldFinalize:0 error:a5])
      {
        return 1;
      }
    }
  }
  sub_100024964(a5);
  return 0;
}

- (void)newRelationshipTargetsForSourceIdentifier:(int64_t)a3 error:(id *)a4
{
}

- (void).cxx_destruct
{
}

@end