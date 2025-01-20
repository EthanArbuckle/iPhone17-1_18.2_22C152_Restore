@interface _bmFMDatabase
+ (BOOL)isSQLiteThreadSafe;
+ (_bmFMDatabase)databaseWithPath:(id)a3;
+ (_bmFMDatabase)databaseWithURL:(id)a3;
+ (id)FMDBUserVersion;
+ (id)sqliteLibVersion;
+ (id)storeableDateFormat:(id)a3;
+ (int)FMDBVersion;
- (BOOL)BOOLForQuery:(id)a3;
- (BOOL)DELETE_FROM:(id)a3 WHERE:(id)a4;
- (BOOL)INSERT_INTO:(id)a3 VALUES:(id)a4;
- (BOOL)UPDATE:(id)a3 SET:(id)a4 WHERE:(id)a5;
- (BOOL)beginDeferredTransaction;
- (BOOL)beginExclusiveTransaction;
- (BOOL)beginImmediateTransaction;
- (BOOL)beginTransaction;
- (BOOL)bindStatement:(sqlite3_stmt *)a3 WithArgumentsInArray:(id)a4 orDictionary:(id)a5 orVAList:(char *)a6;
- (BOOL)checkedOut;
- (BOOL)checkpoint:(int)a3 error:(id *)a4;
- (BOOL)checkpoint:(int)a3 name:(id)a4 error:(id *)a5;
- (BOOL)checkpoint:(int)a3 name:(id)a4 logFrameCount:(int *)a5 checkpointCount:(int *)a6 error:(id *)a7;
- (BOOL)close;
- (BOOL)columnExists:(id)a3 columnName:(id)a4;
- (BOOL)columnExists:(id)a3 inTableWithName:(id)a4;
- (BOOL)commit;
- (BOOL)crashOnErrors;
- (BOOL)databaseExists;
- (BOOL)executeStatements:(id)a3;
- (BOOL)executeStatements:(id)a3 withResultBlock:(id)a4;
- (BOOL)executeUpdate:(id)a3;
- (BOOL)executeUpdate:(id)a3 error:(id *)a4 withArgumentsInArray:(id)a5 orDictionary:(id)a6 orVAList:(char *)a7;
- (BOOL)executeUpdate:(id)a3 values:(id)a4 error:(id *)a5;
- (BOOL)executeUpdate:(id)a3 withArgumentsInArray:(id)a4;
- (BOOL)executeUpdate:(id)a3 withErrorAndBindings:(id *)a4;
- (BOOL)executeUpdate:(id)a3 withParameterDictionary:(id)a4;
- (BOOL)executeUpdate:(id)a3 withVAList:(char *)a4;
- (BOOL)executeUpdateWithFormat:(id)a3;
- (BOOL)goodConnection;
- (BOOL)hadError;
- (BOOL)hasDateFormatter;
- (BOOL)hasOpenResultSets;
- (BOOL)inTransaction;
- (BOOL)interrupt;
- (BOOL)isInTransaction;
- (BOOL)isOpen;
- (BOOL)logsErrors;
- (BOOL)open;
- (BOOL)openWithFlags:(int)a3;
- (BOOL)openWithFlags:(int)a3 vfs:(id)a4;
- (BOOL)rekey:(id)a3;
- (BOOL)rekeyWithData:(id)a3;
- (BOOL)releaseSavePointWithName:(id)a3 error:(id *)a4;
- (BOOL)rollback;
- (BOOL)rollbackToSavePointWithName:(id)a3 error:(id *)a4;
- (BOOL)setKey:(id)a3;
- (BOOL)setKeyWithData:(id)a3;
- (BOOL)shouldCacheStatements;
- (BOOL)startSavePointWithName:(id)a3 error:(id *)a4;
- (BOOL)tableExists:(id)a3;
- (BOOL)traceExecution;
- (BOOL)update:(id)a3 withErrorAndBindings:(id *)a4;
- (BOOL)validateSQL:(id)a3 error:(id *)a4;
- (NSMutableDictionary)cachedStatements;
- (NSString)databasePath;
- (NSURL)databaseURL;
- (_bmFMDatabase)init;
- (_bmFMDatabase)initWithPath:(id)a3;
- (_bmFMDatabase)initWithURL:(id)a3;
- (const)sqlitePath;
- (double)doubleForQuery:(id)a3;
- (double)maxBusyRetryTimeInterval;
- (double)valueDouble:(void *)a3;
- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 JOIN:(id)a5 WHERE:(id)a6 GROUP_BY:(id)a7 HAVING:(id)a8 ORDER_BY:(id)a9 LIMIT:(id)a10;
- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 JOIN:(id)a5 WHERE:(id)a6 ORDER_BY:(id)a7 LIMIT:(id)a8;
- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 WHERE:(id)a5;
- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 WHERE:(id)a5 GROUP_BY:(id)a6;
- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 WHERE:(id)a5 ORDER_BY:(id)a6 LIMIT:(id)a7;
- (id)_SELECT_FROM:(id)a3 COLUMNS:(id)a4 JOIN:(id)a5 WHERE:(id)a6 GROUP_BY:(id)a7 ORDER_BY:(id)a8 LIMIT:(id)a9;
- (id)cachedStatementForQuery:(id)a3;
- (id)dataForQuery:(id)a3;
- (id)dateForQuery:(id)a3;
- (id)dateFromString:(id)a3;
- (id)errorWithMessage:(id)a3;
- (id)executeQuery:(id)a3;
- (id)executeQuery:(id)a3 values:(id)a4 error:(id *)a5;
- (id)executeQuery:(id)a3 withArgumentsInArray:(id)a4;
- (id)executeQuery:(id)a3 withArgumentsInArray:(id)a4 orDictionary:(id)a5 orVAList:(char *)a6 shouldBind:(BOOL)a7;
- (id)executeQuery:(id)a3 withParameterDictionary:(id)a4;
- (id)executeQuery:(id)a3 withVAList:(char *)a4;
- (id)executeQueryWithFormat:(id)a3;
- (id)getSchema;
- (id)getTableSchema:(id)a3;
- (id)inSavePoint:(id)a3;
- (id)lastError;
- (id)lastErrorMessage;
- (id)prepare:(id)a3;
- (id)stringForQuery:(id)a3;
- (id)stringFromDate:(id)a3;
- (id)valueData:(void *)a3;
- (id)valueString:(void *)a3;
- (int)bindObject:(id)a3 toColumn:(int)a4 inStatement:(sqlite3_stmt *)a5;
- (int)busyRetryTimeout;
- (int)changes;
- (int)intForQuery:(id)a3;
- (int)lastErrorCode;
- (int)lastExtendedErrorCode;
- (int)limitFor:(int)a3 value:(int)a4;
- (int)valueInt:(void *)a3;
- (int)valueType:(void *)a3;
- (int64_t)lastInsertRowId;
- (int64_t)longForQuery:(id)a3;
- (int64_t)valueLong:(void *)a3;
- (unsigned)applicationID;
- (unsigned)userVersion;
- (void)clearCachedStatements;
- (void)closeOpenResultSets;
- (void)dealloc;
- (void)extractSQL:(id)a3 argumentsList:(char *)a4 intoString:(id)a5 arguments:(id)a6;
- (void)makeFunctionNamed:(id)a3 arguments:(int)a4 block:(id)a5;
- (void)makeFunctionNamed:(id)a3 maximumArguments:(int)a4 withBlock:(id)a5;
- (void)resultData:(id)a3 context:(void *)a4;
- (void)resultDouble:(double)a3 context:(void *)a4;
- (void)resultError:(id)a3 context:(void *)a4;
- (void)resultErrorCode:(int)a3 context:(void *)a4;
- (void)resultErrorNoMemoryInContext:(void *)a3;
- (void)resultErrorTooBigInContext:(void *)a3;
- (void)resultInt:(int)a3 context:(void *)a4;
- (void)resultLong:(int64_t)a3 context:(void *)a4;
- (void)resultNullInContext:(void *)a3;
- (void)resultSetDidClose:(id)a3;
- (void)resultString:(id)a3 context:(void *)a4;
- (void)setApplicationID:(unsigned int)a3;
- (void)setBusyRetryTimeout:(int)a3;
- (void)setCachedStatement:(id)a3 forQuery:(id)a4;
- (void)setCachedStatements:(id)a3;
- (void)setCheckedOut:(BOOL)a3;
- (void)setCrashOnErrors:(BOOL)a3;
- (void)setDateFormat:(id)a3;
- (void)setIsOpen:(BOOL)a3;
- (void)setLogsErrors:(BOOL)a3;
- (void)setMaxBusyRetryTimeInterval:(double)a3;
- (void)setShouldCacheStatements:(BOOL)a3;
- (void)setShouldCacheStatementsWithoutClearingExistingStatements:(BOOL)a3;
- (void)setTraceExecution:(BOOL)a3;
- (void)setUserVersion:(unsigned int)a3;
- (void)sqliteHandle;
- (void)warnInUse;
@end

@implementation _bmFMDatabase

- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 WHERE:(id)a5
{
  return [(_bmFMDatabase *)self _SELECT_FROM:a3 COLUMNS:a4 JOIN:0 WHERE:a5 GROUP_BY:0 ORDER_BY:0 LIMIT:0];
}

- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 WHERE:(id)a5 ORDER_BY:(id)a6 LIMIT:(id)a7
{
  return [(_bmFMDatabase *)self _SELECT_FROM:a3 COLUMNS:a4 JOIN:0 WHERE:a5 GROUP_BY:0 ORDER_BY:a6 LIMIT:a7];
}

- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 JOIN:(id)a5 WHERE:(id)a6 ORDER_BY:(id)a7 LIMIT:(id)a8
{
  return [(_bmFMDatabase *)self _SELECT_FROM:a3 COLUMNS:a4 JOIN:a5 WHERE:a6 GROUP_BY:0 ORDER_BY:a7 LIMIT:a8];
}

- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 WHERE:(id)a5 GROUP_BY:(id)a6
{
  return [(_bmFMDatabase *)self _SELECT_FROM:a3 COLUMNS:a4 JOIN:0 WHERE:a5 GROUP_BY:a6 ORDER_BY:0 LIMIT:0];
}

- (id)_SELECT_FROM:(id)a3 COLUMNS:(id)a4 JOIN:(id)a5 WHERE:(id)a6 GROUP_BY:(id)a7 ORDER_BY:(id)a8 LIMIT:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v41 = a9;
  v20 = [a4 componentsJoinedByString:@", "];
  v21 = +[NSMutableString stringWithFormat:@"SELECT %@ FROM %@", v20, v15];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v22 = v16;
  id v23 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v43;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(v22);
        }
        [v21 appendString:*(void *)(*((void *)&v42 + 1) + 8 * i)];
      }
      id v24 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v24);
  }

  if (v17)
  {
    v40 = self;
    id v27 = v19;
    id v28 = v18;
    id v29 = v15;
    v30 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (unint64_t)[v17 count] >> 1);
    [v21 appendString:@" WHERE "];
    id v31 = [v17 count];
    if (v31)
    {
      unint64_t v32 = (unint64_t)v31;
      for (unint64_t j = 0; j < v32; j += 2)
      {
        v34 = [v17 objectAtIndexedSubscript:j];
        [v21 appendString:v34];

        v35 = [v17 objectAtIndexedSubscript:j + 1];
        [v30 addObject:v35];
      }
    }
    id v15 = v29;
    id v18 = v28;
    id v19 = v27;
    self = v40;
  }
  else
  {
    v30 = 0;
  }
  if ([v18 count])
  {
    v36 = [v18 componentsJoinedByString:@", "];
    [v21 appendFormat:@" GROUP BY %@", v36];
  }
  if ([v19 count])
  {
    v37 = [v19 componentsJoinedByString:@", "];
    [v21 appendFormat:@" ORDER BY %@", v37];
  }
  if ((uint64_t)[v41 integerValue] >= 1) {
    [v21 appendFormat:@" LIMIT %@", v41];
  }
  [v21 appendString:@";"];
  if (v30) {
    [(_bmFMDatabase *)self executeQuery:v21 withArgumentsInArray:v30];
  }
  else {
  v38 = [(_bmFMDatabase *)self executeQuery:v21];
  }

  return v38;
}

- (id)SELECT_FROM:(id)a3 COLUMNS:(id)a4 JOIN:(id)a5 WHERE:(id)a6 GROUP_BY:(id)a7 HAVING:(id)a8 ORDER_BY:(id)a9 LIMIT:(id)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v46 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v21 = [a4 componentsJoinedByString:@", "];
  long long v45 = v15;
  id v22 = +[NSMutableString stringWithFormat:@"SELECT %@ FROM %@", v21, v15];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v23 = v16;
  id v24 = [v23 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v48;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v48 != v26) {
          objc_enumerationMutation(v23);
        }
        [v22 appendString:*(void *)(*((void *)&v47 + 1) + 8 * i)];
      }
      id v25 = [v23 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v25);
  }

  if (v17)
  {
    id v28 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (unint64_t)[v17 count] >> 1);
    [v22 appendString:@" WHERE "];
    id v29 = [v17 count];
    if (v29)
    {
      unint64_t v30 = (unint64_t)v29;
      for (unint64_t j = 0; j < v30; j += 2)
      {
        unint64_t v32 = [v17 objectAtIndexedSubscript:j];
        [v22 appendString:v32];

        v33 = [v17 objectAtIndexedSubscript:j + 1];
        [v28 addObject:v33];
      }
    }
  }
  else
  {
    id v28 = 0;
  }
  v34 = v46;
  if ([v46 count])
  {
    v35 = [v46 componentsJoinedByString:@", "];
    [v22 appendFormat:@" GROUP BY %@", v35];
  }
  if (v18)
  {
    if (!v28)
    {
      id v28 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (unint64_t)[v17 count] >> 1);
    }
    [v22 appendString:@" HAVING "];
    id v36 = [v18 count];
    if (v36)
    {
      unint64_t v37 = (unint64_t)v36;
      for (unint64_t k = 0; k < v37; k += 2)
      {
        v39 = [v18 objectAtIndexedSubscript:k];
        [v22 appendString:v39];

        v40 = [v18 objectAtIndexedSubscript:k + 1];
        [v28 addObject:v40];
      }
      v34 = v46;
    }
  }
  if ([v19 count])
  {
    id v41 = [v19 componentsJoinedByString:@", "];
    [v22 appendFormat:@" ORDER BY %@", v41];
  }
  if ((uint64_t)[v20 integerValue] >= 1) {
    [v22 appendFormat:@" LIMIT %@", v20];
  }
  [v22 appendString:@";"];
  if (v28) {
    [(_bmFMDatabase *)self executeQuery:v22 withArgumentsInArray:v28];
  }
  else {
  long long v42 = [(_bmFMDatabase *)self executeQuery:v22];
  }

  return v42;
}

- (BOOL)UPDATE:(id)a3 SET:(id)a4 WHERE:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = +[NSMutableString stringWithFormat:@"UPDATE OR FAIL %@ SET ", a3];
  v10 = [NSMutableArray arrayWithCapacity:((char *)[v7 count] + ((unint64_t)objc_msgSend(v8, "count") >> 1));
  id v27 = v7;
  v11 = [v7 allKeys];
  v12 = (char *)[v11 count];
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    id v15 = v12 - 1;
    do
    {
      id v16 = [v11 objectAtIndexedSubscript:v14];
      [v9 appendString:v16];
      if (([v16 containsString:@"?"] & 1) == 0)
      {
        if (v14 >= v15) {
          CFStringRef v17 = @" = ?";
        }
        else {
          CFStringRef v17 = @" = ?, ";
        }
        [v9 appendString:v17];
      }
      id v18 = [v27 objectForKeyedSubscript:v16];
      [v10 addObject:v18];

      ++v14;
    }
    while (v13 != v14);
  }
  [v9 appendString:@" WHERE "];
  id v19 = [v8 count];
  if (v19)
  {
    unint64_t v20 = (unint64_t)v19;
    for (unint64_t i = 0; i < v20; i += 2)
    {
      id v22 = [v8 objectAtIndexedSubscript:i];
      [v9 appendString:v22];

      id v23 = [v8 objectAtIndexedSubscript:i + 1];
      [v10 addObject:v23];
    }
  }
  [v9 appendString:@";"];
  BOOL v24 = [(_bmFMDatabase *)self executeUpdate:v9 withArgumentsInArray:v10];

  return v24;
}

- (BOOL)INSERT_INTO:(id)a3 VALUES:(id)a4
{
  id v5 = a4;
  v6 = +[NSMutableString stringWithFormat:@"INSERT INTO %@", a3];
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  [v6 appendString:@"("];
  id v8 = (char *)[v5 count];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v5;
  v10 = (char *)[v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    uint64_t v13 = *(void *)v25;
    do
    {
      v14 = 0;
      id v23 = v12;
      id v15 = v12 + 1;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v14);
        CFStringRef v17 = [v9 objectForKeyedSubscript:v16];
        [v7 addObject:v17];

        [v6 appendString:v16];
        if (&v14[(void)v15] < v8) {
          [v6 appendString:@","];
        }
        ++v14;
      }
      while (v11 != v14);
      v12 = &v11[(void)v23];
      v11 = (char *)[v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  [v6 appendString:@") VALUES ("];
  if (v8)
  {
    for (unint64_t i = 0; (char *)i != v8; ++i)
    {
      if (i >= (unint64_t)(v8 - 1)) {
        CFStringRef v19 = @"?";
      }
      else {
        CFStringRef v19 = @"?,";
      }
      [v6 appendString:v19];
    }
  }
  [v6 appendString:@";"]);
  BOOL v20 = [(_bmFMDatabase *)self executeUpdate:v6 withArgumentsInArray:v7];

  return v20;
}

- (BOOL)DELETE_FROM:(id)a3 WHERE:(id)a4
{
  id v6 = a4;
  id v7 = +[NSMutableString stringWithFormat:@"DELETE FROM %@", a3];
  id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (unint64_t)[v6 count] >> 1);
  [v7 appendString:@" WHERE "];
  id v9 = [v6 count];
  if (v9)
  {
    unint64_t v10 = (unint64_t)v9;
    for (unint64_t i = 0; i < v10; i += 2)
    {
      v12 = [v6 objectAtIndexedSubscript:i];
      [v7 appendString:v12];

      uint64_t v13 = [v6 objectAtIndexedSubscript:i + 1];
      [v8 addObject:v13];
    }
  }
  [v7 appendString:@";"];
  BOOL v14 = [(_bmFMDatabase *)self executeUpdate:v7 withArgumentsInArray:v8];

  return v14;
}

- (void)setShouldCacheStatementsWithoutClearingExistingStatements:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_bmFMDatabase *)self cachedStatements];
  [(_bmFMDatabase *)self setShouldCacheStatements:v3];
  if (!v3) {
    [(_bmFMDatabase *)self setCachedStatements:v5];
  }
}

+ (_bmFMDatabase)databaseWithPath:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithPath:v4];

  return (_bmFMDatabase *)v5;
}

+ (_bmFMDatabase)databaseWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithURL:v4];

  return (_bmFMDatabase *)v5;
}

- (_bmFMDatabase)init
{
  return [(_bmFMDatabase *)self initWithPath:0];
}

- (_bmFMDatabase)initWithURL:(id)a3
{
  id v4 = [a3 path];
  id v5 = [(_bmFMDatabase *)self initWithPath:v4];

  return v5;
}

- (_bmFMDatabase)initWithPath:(id)a3
{
  id v4 = a3;
  if (!sqlite3_threadsafe()) {
    sub_100040270();
  }
  v11.receiver = self;
  v11.super_class = (Class)_bmFMDatabase;
  id v5 = [(_bmFMDatabase *)&v11 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id v7 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v6;

    id v8 = objc_alloc_init((Class)NSMutableSet);
    id v9 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v8;

    *((void *)v5 + 1) = 0;
    *(_WORD *)(v5 + 59) = 256;
    *((void *)v5 + 8) = 0x4000000000000000;
    v5[61] = 0;
  }

  return (_bmFMDatabase *)v5;
}

- (void)dealloc
{
  [(_bmFMDatabase *)self close];
  v3.receiver = self;
  v3.super_class = (Class)_bmFMDatabase;
  [(_bmFMDatabase *)&v3 dealloc];
}

- (NSURL)databaseURL
{
  if (self->_databasePath)
  {
    v2 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:");
  }
  else
  {
    v2 = 0;
  }

  return (NSURL *)v2;
}

+ (id)FMDBUserVersion
{
  return @"2.7.7";
}

+ (int)FMDBVersion
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CF70;
  block[3] = &unk_10006D9A8;
  block[4] = a1;
  if (qword_100080358 != -1) {
    dispatch_once(&qword_100080358, block);
  }
  return dword_100080360;
}

+ (id)sqliteLibVersion
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sqlite3_libversion()];

  return v2;
}

+ (BOOL)isSQLiteThreadSafe
{
  return sqlite3_threadsafe() != 0;
}

- (void)sqliteHandle
{
  return self->_db;
}

- (const)sqlitePath
{
  databasePath = self->_databasePath;
  if (!databasePath) {
    return ":memory:";
  }
  if (![(NSString *)databasePath length]) {
    return "";
  }
  id v4 = self->_databasePath;

  return [(NSString *)v4 fileSystemRepresentation];
}

- (int)limitFor:(int)a3 value:(int)a4
{
  return sqlite3_limit((sqlite3 *)self->_db, a3, a4);
}

- (BOOL)open
{
  if (self->_isOpen) {
    return 1;
  }
  p_db = &self->_db;
  if (self->_db) {
    [(_bmFMDatabase *)self close];
  }
  uint64_t v5 = sqlite3_open([(_bmFMDatabase *)self sqlitePath], (sqlite3 **)p_db);
  if (v5)
  {
    NSLog(@"error opening!: %d", v5);
    return 0;
  }
  else
  {
    if (self->_maxBusyRetryTimeInterval > 0.0) {
      -[_bmFMDatabase setMaxBusyRetryTimeInterval:](self, "setMaxBusyRetryTimeInterval:");
    }
    BOOL result = 1;
    self->_isOpen = 1;
  }
  return result;
}

- (BOOL)openWithFlags:(int)a3
{
  return [(_bmFMDatabase *)self openWithFlags:*(void *)&a3 vfs:0];
}

- (BOOL)openWithFlags:(int)a3 vfs:(id)a4
{
  id v6 = a4;
  if (self->_isOpen)
  {
    BOOL v7 = 1;
  }
  else
  {
    if (self->_db) {
      [(_bmFMDatabase *)self close];
    }
    uint64_t v8 = sqlite3_open_v2(-[_bmFMDatabase sqlitePath](self, "sqlitePath"), (sqlite3 **)&self->_db, a3, (const char *)[v6 UTF8String]);
    if (v8)
    {
      NSLog(@"error opening!: %d", v8);
      BOOL v7 = 0;
    }
    else
    {
      if (self->_maxBusyRetryTimeInterval > 0.0) {
        -[_bmFMDatabase setMaxBusyRetryTimeInterval:](self, "setMaxBusyRetryTimeInterval:");
      }
      BOOL v7 = 1;
      self->_isOpen = 1;
    }
  }

  return v7;
}

- (BOOL)close
{
  [(_bmFMDatabase *)self clearCachedStatements];
  [(_bmFMDatabase *)self closeOpenResultSets];
  db = (sqlite3 *)self->_db;
  if (db)
  {
    uint64_t v4 = sqlite3_close(db);
    if ((v4 - 5) > 1) {
      goto LABEL_7;
    }
    stmt = sqlite3_next_stmt((sqlite3 *)self->_db, 0);
    if (stmt)
    {
      id v6 = stmt;
      do
      {
        NSLog(@"Closing leaked statement");
        sqlite3_finalize(v6);
        id v6 = sqlite3_next_stmt((sqlite3 *)self->_db, 0);
      }
      while (v6);
      uint64_t v4 = sqlite3_close((sqlite3 *)self->_db);
      if ((v4 - 5) > 1)
      {
LABEL_7:
        if (v4) {
          NSLog(@"error closing!: %d", v4);
        }
      }
    }
    self->_db = 0;
    self->_isOpen = 0;
  }
  return 1;
}

- (void)setMaxBusyRetryTimeInterval:(double)a3
{
  objc_super v3 = self;
  self->_maxBusyRetryTimeInterval = a3;
  db = (sqlite3 *)self->_db;
  if (db)
  {
    if (a3 <= 0.0)
    {
      uint64_t v5 = 0;
      objc_super v3 = 0;
    }
    else
    {
      uint64_t v5 = (int (__cdecl *)(void *, int))sub_10003D434;
    }
    sqlite3_busy_handler(db, v5, v3);
  }
}

- (double)maxBusyRetryTimeInterval
{
  return self->_maxBusyRetryTimeInterval;
}

- (int)busyRetryTimeout
{
  return -1;
}

- (void)setBusyRetryTimeout:(int)a3
{
}

- (BOOL)hasOpenResultSets
{
  return [(NSMutableSet *)self->_openResultSets count] != 0;
}

- (void)closeOpenResultSets
{
  id v3 = [(NSMutableSet *)self->_openResultSets copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        unint64_t v10 = [v9 pointerValue:v11];
        [v10 setParentDB:0];
        [v10 close];
        [(NSMutableSet *)self->_openResultSets removeObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)resultSetDidClose:(id)a3
{
  id v4 = +[NSValue valueWithNonretainedObject:a3];
  [(NSMutableSet *)self->_openResultSets removeObject:v4];
}

- (void)clearCachedStatements
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = [(NSMutableDictionary *)self->_cachedStatements objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v7);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v9 = [v8 allObjects];
        id v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v15;
          do
          {
            long long v13 = 0;
            do
            {
              if (*(void *)v15 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) close];
              long long v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            id v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v11);
        }

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_cachedStatements removeAllObjects];
}

- (id)cachedStatementForQuery:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_cachedStatements objectForKey:a3];
  id v4 = [v3 objectsPassingTest:&stru_10006D9E8];
  id v5 = [v4 anyObject];

  return v5;
}

- (void)setCachedStatement:(id)a3 forQuery:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = [v7 copy];

    [v12 setQuery:v9];
    id v10 = [(NSMutableDictionary *)self->_cachedStatements objectForKey:v9];
    if (!v10)
    {
      id v10 = +[NSMutableSet set];
    }
    [v10 addObject:v12];
    [(NSMutableDictionary *)self->_cachedStatements setObject:v10 forKey:v9];
  }
  else
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"FMDatabase.m", 411, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    NSLog(@"API misuse, -[_bmFMDatabase setCachedStatement:forQuery:] query must not be nil");
  }
}

- (BOOL)rekey:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UTF8String];
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];

  uint64_t v8 = +[NSData dataWithBytes:v5 length:strlen(v7)];
  LOBYTE(self) = [(_bmFMDatabase *)self rekeyWithData:v8];

  return (char)self;
}

- (BOOL)rekeyWithData:(id)a3
{
  return 0;
}

- (BOOL)setKey:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UTF8String];
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];

  uint64_t v8 = +[NSData dataWithBytes:v5 length:strlen(v7)];
  LOBYTE(self) = [(_bmFMDatabase *)self setKeyWithData:v8];

  return (char)self;
}

- (BOOL)setKeyWithData:(id)a3
{
  return 0;
}

+ (id)storeableDateFormat:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSDateFormatter);
  [v4 setDateFormat:v3];

  id v5 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v5];

  id v6 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US"];
  [v4 setLocale:v6];

  return v4;
}

- (BOOL)hasDateFormatter
{
  return self->_dateFormat != 0;
}

- (void)setDateFormat:(id)a3
{
}

- (id)dateFromString:(id)a3
{
  return [(NSDateFormatter *)self->_dateFormat dateFromString:a3];
}

- (id)stringFromDate:(id)a3
{
  return [(NSDateFormatter *)self->_dateFormat stringFromDate:a3];
}

- (BOOL)goodConnection
{
  if (!self->_isOpen) {
    return 0;
  }
  id v2 = [(_bmFMDatabase *)self executeQuery:@"select name from sqlite_master where type='table'"];
  id v3 = v2;
  BOOL v4 = v2 != 0;
  if (v2) {
    [v2 close];
  }

  return v4;
}

- (void)warnInUse
{
  if (self->_crashOnErrors) {
    sub_10004029C((uint64_t)a2, (uint64_t)self);
  }
}

- (BOOL)databaseExists
{
  BOOL isOpen = self->_isOpen;
  if (!self->_isOpen)
  {
    NSLog(@"The _bmFMDatabase %@ is not open.", self);
    if (self->_crashOnErrors) {
      sub_1000402FC((uint64_t)a2, (uint64_t)self);
    }
  }
  return isOpen;
}

- (id)lastErrorMessage
{
  id v2 = sqlite3_errmsg((sqlite3 *)self->_db);

  return +[NSString stringWithUTF8String:v2];
}

- (BOOL)hadError
{
  return [(_bmFMDatabase *)self lastErrorCode] - 1 < 0x63;
}

- (int)lastErrorCode
{
  return sqlite3_errcode((sqlite3 *)self->_db);
}

- (int)lastExtendedErrorCode
{
  return sqlite3_extended_errcode((sqlite3 *)self->_db);
}

- (id)errorWithMessage:(id)a3
{
  BOOL v4 = +[NSDictionary dictionaryWithObject:a3 forKey:NSLocalizedDescriptionKey];
  id v5 = +[NSError errorWithDomain:@"_bmFMDatabase" code:sqlite3_errcode((sqlite3 *)self->_db) userInfo:v4];

  return v5;
}

- (id)lastError
{
  id v3 = [(_bmFMDatabase *)self lastErrorMessage];
  BOOL v4 = [(_bmFMDatabase *)self errorWithMessage:v3];

  return v4;
}

- (int64_t)lastInsertRowId
{
  if (self->_isExecutingStatement)
  {
    [(_bmFMDatabase *)self warnInUse];
    return 0;
  }
  else
  {
    self->_isExecutingStatement = 1;
    int64_t result = sqlite3_last_insert_rowid((sqlite3 *)self->_db);
    self->_isExecutingStatement = 0;
  }
  return result;
}

- (int)changes
{
  if (self->_isExecutingStatement)
  {
    [(_bmFMDatabase *)self warnInUse];
    return 0;
  }
  else
  {
    self->_isExecutingStatement = 1;
    int result = sqlite3_changes((sqlite3 *)self->_db);
    self->_isExecutingStatement = 0;
  }
  return result;
}

- (int)bindObject:(id)a3 toColumn:(int)a4 inStatement:(sqlite3_stmt *)a5
{
  id v8 = a3;
  if (v8)
  {
    id v9 = +[NSNull null];

    if (v9 != v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v8;
        id v11 = (const char *)[v10 bytes];
        if (v11) {
          id v12 = v11;
        }
        else {
          id v12 = "";
        }
        int v13 = sqlite3_bind_blob(a5, a4, v12, (int)[v10 length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        goto LABEL_9;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([(_bmFMDatabase *)self hasDateFormatter])
        {
          long long v16 = [(_bmFMDatabase *)self stringFromDate:v8];
LABEL_33:
          id v32 = v16;
          int v14 = sqlite3_bind_text(a5, a4, (const char *)[v32 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

          goto LABEL_10;
        }
        [v8 timeIntervalSince1970];
        goto LABEL_30;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        unint64_t v30 = v8;
        goto LABEL_32;
      }
      id v17 = v8;
      if (strcmp((const char *)[v17 objCType], "c"))
      {
        id v18 = v17;
        if (!strcmp((const char *)[v18 objCType], "C"))
        {
          int v33 = [v18 unsignedCharValue];
          goto LABEL_39;
        }
        id v19 = v18;
        if (!strcmp((const char *)[v19 objCType], "s"))
        {
          int v33 = [v19 shortValue];
          goto LABEL_39;
        }
        id v20 = v19;
        if (!strcmp((const char *)[v20 objCType], "S"))
        {
          int v33 = [v20 unsignedShortValue];
          goto LABEL_39;
        }
        id v21 = v20;
        if (!strcmp((const char *)[v21 objCType], "i"))
        {
          int v33 = [v21 intValue];
          goto LABEL_39;
        }
        id v22 = v21;
        if (!strcmp((const char *)[v22 objCType], "I"))
        {
          sqlite3_int64 v34 = [v22 unsignedIntValue];
        }
        else
        {
          id v23 = v22;
          if (!strcmp((const char *)[v23 objCType], "q"))
          {
            id v35 = [v23 longValue];
          }
          else
          {
            id v24 = v23;
            if (!strcmp((const char *)[v24 objCType], "Q"))
            {
              id v35 = [v24 unsignedLongValue];
            }
            else
            {
              id v25 = v24;
              if (!strcmp((const char *)[v25 objCType], "q"))
              {
                id v35 = [v25 longLongValue];
              }
              else
              {
                id v26 = v25;
                if (strcmp((const char *)[v26 objCType], "Q"))
                {
                  id v27 = v26;
                  if (!strcmp((const char *)[v27 objCType], "f"))
                  {
                    [v27 floatValue];
                    double v31 = v36;
                  }
                  else
                  {
                    id v28 = v27;
                    if (strcmp((const char *)[v28 objCType], "d"))
                    {
                      id v29 = v28;
                      if (strcmp((const char *)[v29 objCType], "B"))
                      {
                        unint64_t v30 = v29;
LABEL_32:
                        long long v16 = [v30 description];
                        goto LABEL_33;
                      }
                      int v33 = [v29 BOOLValue];
LABEL_39:
                      int v13 = sqlite3_bind_int(a5, a4, v33);
                      goto LABEL_9;
                    }
                    [v28 doubleValue];
                  }
LABEL_30:
                  int v13 = sqlite3_bind_double(a5, a4, v31);
                  goto LABEL_9;
                }
                id v35 = [v26 unsignedLongLongValue];
              }
            }
          }
          sqlite3_int64 v34 = (sqlite3_int64)v35;
        }
        int v13 = sqlite3_bind_int64(a5, a4, v34);
        goto LABEL_9;
      }
      int v33 = [v17 charValue];
      goto LABEL_39;
    }
  }
  int v13 = sqlite3_bind_null(a5, a4);
LABEL_9:
  int v14 = v13;
LABEL_10:

  return v14;
}

- (void)extractSQL:(id)a3 argumentsList:(char *)a4 intoString:(id)a5 arguments:(id)a6
{
  id v9 = a3;
  long long v44 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [v9 length];
  if (v12)
  {
    unint64_t v13 = (unint64_t)v12;
    LODWORD(v14) = 0;
    unint64_t v15 = 0;
    while (1)
    {
      int v16 = v14;
      id v17 = [v9 characterAtIndex:v15];
      uint64_t v14 = (uint64_t)v17;
      if (v16 == 37) {
        break;
      }
      if (v17 == 37) {
        goto LABEL_48;
      }
LABEL_45:
      uint64_t v35 = v14;
      if (v14)
      {
LABEL_46:
        uint64_t v43 = v35;
        v40 = v10;
        CFStringRef v41 = @"%C";
        goto LABEL_47;
      }
LABEL_48:
      if (++v15 >= v13) {
        goto LABEL_53;
      }
    }
    if ((int)v17 > 98)
    {
      switch((int)v17)
      {
        case 'c':
          id v18 = objc_alloc((Class)NSString);
          id v19 = (unsigned int *)v44;
          v44 += 8;
          id v20 = [v18 initWithFormat:@"%c", *v19];
          goto LABEL_31;
        case 'd':
        case 'i':
          goto LABEL_13;
        case 'f':
          id v23 = (double *)v44;
          v44 += 8;
          id v20 = +[NSNumber numberWithDouble:*v23];
          goto LABEL_31;
        case 'g':
          id v24 = v44;
          v44 += 8;
          double v25 = *(double *)v24;
          *(float *)&double v25 = *(double *)v24;
          id v20 = +[NSNumber numberWithFloat:v25];
          goto LABEL_31;
        case 'h':
          unint64_t v26 = v15 + 1;
          if (v15 + 1 >= v13) {
            goto LABEL_36;
          }
          if ([v9 characterAtIndex:v15 + 1] == 105)
          {
            id v27 = v44;
            v44 += 8;
            uint64_t v28 = +[NSNumber numberWithShort:*(__int16 *)v27];
            goto LABEL_42;
          }
          if ([v9 characterAtIndex:v15 + 1] == 117)
          {
            float v36 = (unsigned __int16 *)v44;
            v44 += 8;
            uint64_t v28 = +[NSNumber numberWithUnsignedShort:*v36];
            goto LABEL_42;
          }
LABEL_36:
          uint64_t v35 = 104;
          goto LABEL_46;
        case 'l':
          unint64_t v26 = v15 + 1;
          if (v15 + 1 >= v13) {
            goto LABEL_33;
          }
          unsigned int v29 = [v9 characterAtIndex:v15 + 1];
          if (v29 == 100)
          {
            v38 = v44;
            v44 += 8;
            uint64_t v28 = +[NSNumber numberWithLong:*(void *)v38];
            goto LABEL_42;
          }
          if (v29 == 117)
          {
            v39 = v44;
            v44 += 8;
            uint64_t v28 = +[NSNumber numberWithUnsignedLong:*(void *)v39];
            goto LABEL_42;
          }
          if (v29 != 108)
          {
LABEL_33:
            uint64_t v35 = 108;
            goto LABEL_46;
          }
          v15 += 2;
          if (v15 < v13)
          {
            if ([v9 characterAtIndex:v15] == 100)
            {
              unint64_t v30 = v44;
              v44 += 8;
              id v20 = +[NSNumber numberWithLongLong:*(void *)v30];
              goto LABEL_31;
            }
            if ([v9 characterAtIndex:v15] == 117)
            {
              long long v42 = v44;
              v44 += 8;
              id v20 = +[NSNumber numberWithUnsignedLongLong:*(void *)v42];
              goto LABEL_31;
            }
          }
          uint64_t v35 = 108;
          unint64_t v15 = v26;
          goto LABEL_46;
        case 'q':
          unint64_t v26 = v15 + 1;
          if (v15 + 1 >= v13) {
            goto LABEL_39;
          }
          if ([v9 characterAtIndex:v15 + 1] == 105)
          {
            double v31 = v44;
            v44 += 8;
            uint64_t v28 = +[NSNumber numberWithLongLong:*(void *)v31];
          }
          else
          {
            if ([v9 characterAtIndex:v15 + 1] != 117)
            {
LABEL_39:
              uint64_t v35 = 113;
              goto LABEL_46;
            }
            unint64_t v37 = v44;
            v44 += 8;
            uint64_t v28 = +[NSNumber numberWithUnsignedLongLong:*(void *)v37];
          }
LABEL_42:
          sqlite3_int64 v34 = (void *)v28;
          unint64_t v15 = v26;
          if (!v28) {
            goto LABEL_43;
          }
          goto LABEL_32;
        case 's':
          id v32 = v44;
          v44 += 8;
          id v20 = +[NSString stringWithUTF8String:*(void *)v32];
          goto LABEL_31;
        case 'u':
          goto LABEL_12;
        default:
          goto LABEL_43;
      }
    }
    switch(v17)
    {
      case '@':
        int v33 = (id *)v44;
        v44 += 8;
        id v20 = *v33;
        break;
      case 'D':
LABEL_13:
        id v22 = (unsigned int *)v44;
        v44 += 8;
        id v20 = +[NSNumber numberWithInt:*v22];
        break;
      case 'U':
LABEL_12:
        id v21 = (unsigned int *)v44;
        v44 += 8;
        id v20 = +[NSNumber numberWithUnsignedInt:*v21];
        break;
      default:
LABEL_43:
        if (v14 == 64)
        {
          v40 = v10;
          CFStringRef v41 = @"NULL";
LABEL_47:
          [v40 appendFormat:v41, v43];
          goto LABEL_48;
        }
        goto LABEL_45;
    }
LABEL_31:
    sqlite3_int64 v34 = v20;
    if (v20)
    {
LABEL_32:
      [v10 appendString:@"?"];
      [v11 addObject:v34];

      goto LABEL_48;
    }
    goto LABEL_43;
  }
LABEL_53:
}

- (id)executeQuery:(id)a3 withParameterDictionary:(id)a4
{
  return [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:a4 orVAList:0 shouldBind:1];
}

- (id)executeQuery:(id)a3 withArgumentsInArray:(id)a4 orDictionary:(id)a5 orVAList:(char *)a6 shouldBind:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (![(_bmFMDatabase *)self databaseExists]) {
    goto LABEL_4;
  }
  if (self->_isExecutingStatement)
  {
    [(_bmFMDatabase *)self warnInUse];
LABEL_4:
    id v16 = 0;
    goto LABEL_5;
  }
  self->_isExecutingStatement = 1;
  ppStmt = 0;
  if (v13 && self->_traceExecution) {
    NSLog(@"%@ executeQuery: %@", self, v13);
  }
  if (self->_shouldCacheStatements)
  {
    id v18 = [(_bmFMDatabase *)self cachedStatementForQuery:v13];
    id v19 = v18;
    if (v18)
    {
      ppStmt = [(_bmFMStatement *)v18 statement];
      [(_bmFMStatement *)v19 reset];
      if (ppStmt)
      {
LABEL_22:
        if (v7
          && ![(_bmFMDatabase *)self bindStatement:ppStmt WithArgumentsInArray:v14 orDictionary:v15 orVAList:a6])
        {
          id v16 = 0;
        }
        else
        {
          if (!v19)
          {
            id v19 = objc_alloc_init(_bmFMStatement);
            [(_bmFMStatement *)v19 setStatement:ppStmt];
            if (v13)
            {
              if (self->_shouldCacheStatements) {
                [(_bmFMDatabase *)self setCachedStatement:v19 forQuery:v13];
              }
            }
          }
          id v24 = +[_bmFMResultSet resultSetWithStatement:v19 usingParentDatabase:self shouldAutoClose:v7];
          [v24 setQuery:v13];
          double v25 = +[NSValue valueWithNonretainedObject:v24];
          [(NSMutableSet *)self->_openResultSets addObject:v25];
          [(_bmFMStatement *)v19 setUseCount:(char *)[(_bmFMStatement *)v19 useCount] + 1];
          self->_isExecutingStatement = 0;
          id v16 = v24;
        }
        goto LABEL_30;
      }
    }
    else
    {
      ppStmt = 0;
      [0 reset];
    }
  }
  else
  {
    id v19 = 0;
  }
  db = (sqlite3 *)self->_db;
  id v21 = v13;
  if (!sqlite3_prepare_v2(db, (const char *)[v21 UTF8String], -1, &ppStmt, 0)) {
    goto LABEL_22;
  }
  if (self->_logsErrors)
  {
    uint64_t v22 = [(_bmFMDatabase *)self lastErrorCode];
    id v23 = [(_bmFMDatabase *)self lastErrorMessage];
    NSLog(@"DB Error: %d \"%@\"", v22, v23);

    NSLog(@"DB Query: %@", v21);
    NSLog(@"DB Path: %@", self->_databasePath);
  }
  if (self->_crashOnErrors) {
    sub_10004035C(self, (uint64_t)a2);
  }
  sqlite3_finalize(ppStmt);
  id v16 = 0;
  ppStmt = 0;
  self->_isExecutingStatement = 0;
LABEL_30:

LABEL_5:

  return v16;
}

- (BOOL)bindStatement:(sqlite3_stmt *)a3 WithArgumentsInArray:(id)a4 orDictionary:(id)a5 orVAList:(char *)a6
{
  id v37 = a4;
  id v10 = a5;
  long long v44 = a6;
  int v11 = sqlite3_bind_parameter_count(a3);
  int v36 = v11;
  if (v10)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obunint64_t j = [v10 allKeys];
    id v12 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v12)
    {
      id v13 = v12;
      LODWORD(v39) = 0;
      uint64_t v14 = *(void *)v41;
      while (2)
      {
        for (unint64_t i = 0; i != v13; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          id v17 = [objc_alloc((Class)NSString) initWithFormat:@":%@", v16];
          if (self->_traceExecution)
          {
            id v18 = [v10 objectForKey:v16];
            NSLog(@"%@ = %@", v17, v18);
          }
          id v19 = v17;
          uint64_t v20 = sqlite3_bind_parameter_index(a3, (const char *)[v19 UTF8String]);
          if ((int)v20 < 1)
          {
            NSLog(@"Could not find index for %@", v16);
          }
          else
          {
            uint64_t v21 = v20;
            id v22 = v10;
            id v23 = [v10 objectForKey:v16];
            uint64_t v24 = [(_bmFMDatabase *)self bindObject:v23 toColumn:v21 inStatement:a3];

            if (v24)
            {
              sqlite3_int64 v34 = sqlite3_errmsg((sqlite3 *)self->_db);
              NSLog(@"Error: unable to bind (%d, %s"), v24, v34;
              sqlite3_finalize(a3);
              self->_isExecutingStatement = 0;

              unint64_t v26 = 0;
              BOOL v33 = 0;
              id v10 = v22;
              goto LABEL_37;
            }
            LODWORD(v39) = v39 + 1;
            id v10 = v22;
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    else
    {
      LODWORD(v39) = 0;
    }

    id v27 = 0;
  }
  else
  {
    uint64_t v25 = 0;
    unint64_t v26 = 0;
    uint64_t v39 = v11 & ~(v11 >> 31);
    while (1)
    {
      id v27 = v26;
      if (v39 == v25) {
        break;
      }
      if (v37 && v25 < (int)[v37 count])
      {
        id v28 = [v37 objectAtIndex:v25];
      }
      else
      {
        if (!v44)
        {
          LODWORD(v39) = v25;
          break;
        }
        unsigned int v29 = (id *)v44;
        v44 += 8;
        id v28 = *v29;
      }
      unint64_t v26 = v28;

      if (self->_traceExecution)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          NSLog(@"data: %ld bytes", [v26 length]);
        }
        else {
          NSLog(@"obj: %@", v26);
        }
      }
      uint64_t v30 = [(_bmFMDatabase *)self bindObject:v26 toColumn:++v25 inStatement:a3];
      if (v30)
      {
        uint64_t v31 = v30;
        id v32 = sqlite3_errmsg((sqlite3 *)self->_db);
        NSLog(@"Error: unable to bind (%d, %s"), v31, v32;
        sqlite3_finalize(a3);
        BOOL v33 = 0;
        self->_isExecutingStatement = 0;
        goto LABEL_37;
      }
    }
  }
  if (v39 == v36)
  {
    BOOL v33 = 1;
  }
  else
  {
    NSLog(@"Error: the bind count is not correct for the # of variables (executeQuery)");
    sqlite3_finalize(a3);
    BOOL v33 = 0;
    self->_isExecutingStatement = 0;
  }
  unint64_t v26 = v27;
LABEL_37:

  return v33;
}

- (id)executeQuery:(id)a3
{
  id v3 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:&v6 shouldBind:1];

  return v3;
}

- (id)executeQueryWithFormat:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", [v4 length]);
  uint64_t v6 = +[NSMutableArray array];
  [(_bmFMDatabase *)self extractSQL:v4 argumentsList:&v10 intoString:v5 arguments:v6];

  BOOL v7 = [(_bmFMDatabase *)self executeQuery:v5 withArgumentsInArray:v6];

  return v7;
}

- (id)executeQuery:(id)a3 withArgumentsInArray:(id)a4
{
  return [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:a4 orDictionary:0 orVAList:0 shouldBind:1];
}

- (id)executeQuery:(id)a3 values:(id)a4 error:(id *)a5
{
  uint64_t v7 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:a4 orDictionary:0 orVAList:0 shouldBind:1];
  id v8 = (void *)v7;
  if (a5 && !v7)
  {
    *a5 = [(_bmFMDatabase *)self lastError];
  }

  return v8;
}

- (id)executeQuery:(id)a3 withVAList:(char *)a4
{
  return [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:a4 shouldBind:1];
}

- (BOOL)executeUpdate:(id)a3 error:(id *)a4 withArgumentsInArray:(id)a5 orDictionary:(id)a6 orVAList:(char *)a7
{
  id v9 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:a5 orDictionary:a6 orVAList:a7 shouldBind:1];
  uint64_t v10 = v9;
  if (v9)
  {
    BOOL v11 = [v9 internalStepWithError:a4] == 101;
  }
  else if (a4)
  {
    [(_bmFMDatabase *)self lastError];
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)executeUpdate:(id)a3
{
  return [(_bmFMDatabase *)self executeUpdate:a3 error:0 withArgumentsInArray:0 orDictionary:0 orVAList:&v4];
}

- (BOOL)executeUpdate:(id)a3 withArgumentsInArray:(id)a4
{
  return [(_bmFMDatabase *)self executeUpdate:a3 error:0 withArgumentsInArray:a4 orDictionary:0 orVAList:0];
}

- (BOOL)executeUpdate:(id)a3 values:(id)a4 error:(id *)a5
{
  return [(_bmFMDatabase *)self executeUpdate:a3 error:a5 withArgumentsInArray:a4 orDictionary:0 orVAList:0];
}

- (BOOL)executeUpdate:(id)a3 withParameterDictionary:(id)a4
{
  return [(_bmFMDatabase *)self executeUpdate:a3 error:0 withArgumentsInArray:0 orDictionary:a4 orVAList:0];
}

- (BOOL)executeUpdate:(id)a3 withVAList:(char *)a4
{
  return [(_bmFMDatabase *)self executeUpdate:a3 error:0 withArgumentsInArray:0 orDictionary:0 orVAList:a4];
}

- (BOOL)executeUpdateWithFormat:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", [v4 length]);
  uint64_t v6 = +[NSMutableArray array];
  [(_bmFMDatabase *)self extractSQL:v4 argumentsList:&v8 intoString:v5 arguments:v6];

  LOBYTE(self) = [(_bmFMDatabase *)self executeUpdate:v5 withArgumentsInArray:v6];
  return (char)self;
}

- (BOOL)executeStatements:(id)a3
{
  return [(_bmFMDatabase *)self executeStatements:a3 withResultBlock:0];
}

- (BOOL)executeStatements:(id)a3 withResultBlock:(id)a4
{
  errmsg = 0;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(_bmFMDatabase *)self sqliteHandle];
  id v9 = v7;
  uint64_t v10 = (const char *)[v9 UTF8String];

  if (v6) {
    BOOL v11 = (int (__cdecl *)(void *, int, char **, char **))sub_10003F25C;
  }
  else {
    BOOL v11 = 0;
  }
  int v12 = sqlite3_exec(v8, v10, v11, v6, &errmsg);

  if (errmsg)
  {
    if ([(_bmFMDatabase *)self logsErrors]) {
      NSLog(@"Error inserting batch: %s", errmsg);
    }
    if (errmsg) {
      sqlite3_free(errmsg);
    }
  }
  return v12 == 0;
}

- (BOOL)executeUpdate:(id)a3 withErrorAndBindings:(id *)a4
{
  return [(_bmFMDatabase *)self executeUpdate:a3 error:a4 withArgumentsInArray:0 orDictionary:0 orVAList:&v5];
}

- (BOOL)update:(id)a3 withErrorAndBindings:(id *)a4
{
  return [(_bmFMDatabase *)self executeUpdate:a3 error:a4 withArgumentsInArray:0 orDictionary:0 orVAList:&v5];
}

- (id)prepare:(id)a3
{
  return [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:0 shouldBind:0];
}

- (BOOL)rollback
{
  BOOL v3 = [(_bmFMDatabase *)self executeUpdate:@"rollback transaction"];
  if (v3) {
    self->_isInTransaction = 0;
  }
  return v3;
}

- (BOOL)commit
{
  BOOL v3 = [(_bmFMDatabase *)self executeUpdate:@"commit transaction"];
  if (v3) {
    self->_isInTransaction = 0;
  }
  return v3;
}

- (BOOL)beginTransaction
{
  BOOL v3 = [(_bmFMDatabase *)self executeUpdate:@"begin exclusive transaction"];
  if (v3) {
    self->_isInTransaction = 1;
  }
  return v3;
}

- (BOOL)beginDeferredTransaction
{
  BOOL v3 = [(_bmFMDatabase *)self executeUpdate:@"begin deferred transaction"];
  if (v3) {
    self->_isInTransaction = 1;
  }
  return v3;
}

- (BOOL)beginImmediateTransaction
{
  BOOL v3 = [(_bmFMDatabase *)self executeUpdate:@"begin immediate transaction"];
  if (v3) {
    self->_isInTransaction = 1;
  }
  return v3;
}

- (BOOL)beginExclusiveTransaction
{
  BOOL v3 = [(_bmFMDatabase *)self executeUpdate:@"begin exclusive transaction"];
  if (v3) {
    self->_isInTransaction = 1;
  }
  return v3;
}

- (BOOL)inTransaction
{
  return self->_isInTransaction;
}

- (BOOL)interrupt
{
  db = self->_db;
  if (db) {
    sqlite3_interrupt((sqlite3 *)[(_bmFMDatabase *)self sqliteHandle]);
  }
  return db != 0;
}

- (BOOL)startSavePointWithName:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"FMDatabase.m", 1256, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  id v8 = objc_alloc((Class)NSString);
  id v9 = [v7 stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
  id v10 = [v8 initWithFormat:@"savepoint '%@';", v9];

  BOOL v11 = [(_bmFMDatabase *)self executeUpdate:v10 error:a4 withArgumentsInArray:0 orDictionary:0 orVAList:0];
  return v11;
}

- (BOOL)releaseSavePointWithName:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"FMDatabase.m", 1270, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  id v8 = objc_alloc((Class)NSString);
  id v9 = [v7 stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
  id v10 = [v8 initWithFormat:@"release savepoint '%@';", v9];

  BOOL v11 = [(_bmFMDatabase *)self executeUpdate:v10 error:a4 withArgumentsInArray:0 orDictionary:0 orVAList:0];
  return v11;
}

- (BOOL)rollbackToSavePointWithName:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"FMDatabase.m", 1284, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  id v8 = objc_alloc((Class)NSString);
  id v9 = [v7 stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
  id v10 = [v8 initWithFormat:@"rollback transaction to savepoint '%@';", v9];

  BOOL v11 = [(_bmFMDatabase *)self executeUpdate:v10 error:a4 withArgumentsInArray:0 orDictionary:0 orVAList:0];
  return v11;
}

- (id)inSavePoint:(id)a3
{
  id v4 = (void (**)(id, unsigned char *))a3;
  id v5 = objc_alloc((Class)NSString);
  uint64_t v6 = qword_100080368++;
  id v7 = [v5 initWithFormat:v6];
  char v17 = 0;
  id v16 = 0;
  unsigned int v8 = [(_bmFMDatabase *)self startSavePointWithName:v7 error:&v16];
  id v9 = v16;
  if (v8)
  {
    if (v4)
    {
      v4[2](v4, &v17);
      if (v17)
      {
        id v15 = v9;
        [(_bmFMDatabase *)self rollbackToSavePointWithName:v7 error:&v15];
        id v10 = v15;

        id v9 = v10;
      }
    }
    id v14 = v9;
    [(_bmFMDatabase *)self releaseSavePointWithName:v7 error:&v14];
    id v11 = v14;

    id v9 = v11;
  }
  id v12 = v9;

  return v12;
}

- (BOOL)checkpoint:(int)a3 error:(id *)a4
{
  return [(_bmFMDatabase *)self checkpoint:*(void *)&a3 name:0 logFrameCount:0 checkpointCount:0 error:a4];
}

- (BOOL)checkpoint:(int)a3 name:(id)a4 error:(id *)a5
{
  return [(_bmFMDatabase *)self checkpoint:*(void *)&a3 name:a4 logFrameCount:0 checkpointCount:0 error:a5];
}

- (BOOL)checkpoint:(int)a3 name:(id)a4 logFrameCount:(int *)a5 checkpointCount:(int *)a6 error:(id *)a7
{
  id v13 = a4;
  int v14 = sqlite3_wal_checkpoint_v2((sqlite3 *)self->_db, (const char *)[v13 UTF8String], a3, a5, a6);
  if (v14)
  {
    if (a7)
    {
      *a7 = [(_bmFMDatabase *)self lastError];
    }
    if ([(_bmFMDatabase *)self logsErrors])
    {
      id v15 = [(_bmFMDatabase *)self lastErrorMessage];
      NSLog(@"%@", v15);
    }
    if ([(_bmFMDatabase *)self crashOnErrors]) {
      sub_1000403E4(self, (uint64_t)a2);
    }
  }

  return v14 == 0;
}

- (BOOL)shouldCacheStatements
{
  return self->_shouldCacheStatements;
}

- (void)setShouldCacheStatements:(BOOL)a3
{
  self->_shouldCacheStatements = a3;
  if (!a3
    || !self->_cachedStatements
    && (+[NSMutableDictionary dictionary],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [(_bmFMDatabase *)self setCachedStatements:v4],
        v4,
        !self->_shouldCacheStatements))
  {
    [(_bmFMDatabase *)self setCachedStatements:0];
  }
}

- (void)makeFunctionNamed:(id)a3 maximumArguments:(int)a4 withBlock:(id)a5
{
}

- (void)makeFunctionNamed:(id)a3 arguments:(int)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!self->_openFunctions)
  {
    id v10 = (NSMutableSet *)objc_opt_new();
    openFunctions = self->_openFunctions;
    self->_openFunctions = v10;
  }
  id v12 = [v9 copy];
  [(NSMutableSet *)self->_openFunctions addObject:v12];
  id v13 = [(_bmFMDatabase *)self sqliteHandle];
  id v14 = v8;
  sqlite3_create_function(v13, (const char *)[v14 UTF8String], a4, 1, v12, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_10003FC5C, 0, 0);
}

- (int)valueType:(void *)a3
{
  return sqlite3_value_type((sqlite3_value *)a3);
}

- (int)valueInt:(void *)a3
{
  return sqlite3_value_int((sqlite3_value *)a3);
}

- (int64_t)valueLong:(void *)a3
{
  return sqlite3_value_int64((sqlite3_value *)a3);
}

- (double)valueDouble:(void *)a3
{
  return sqlite3_value_double((sqlite3_value *)a3);
}

- (id)valueData:(void *)a3
{
  id v4 = sqlite3_value_blob((sqlite3_value *)a3);
  int v5 = sqlite3_value_bytes((sqlite3_value *)a3);
  if (v4)
  {
    uint64_t v6 = +[NSData dataWithBytes:v4 length:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)valueString:(void *)a3
{
  BOOL v3 = (void *)sqlite3_value_text((sqlite3_value *)a3);
  if (v3)
  {
    BOOL v3 = +[NSString stringWithUTF8String:v3];
  }

  return v3;
}

- (void)resultNullInContext:(void *)a3
{
}

- (void)resultInt:(int)a3 context:(void *)a4
{
}

- (void)resultLong:(int64_t)a3 context:(void *)a4
{
}

- (void)resultDouble:(double)a3 context:(void *)a4
{
}

- (void)resultData:(id)a3 context:(void *)a4
{
  id v5 = a3;
  id v6 = [v5 bytes];
  int v7 = [v5 length];

  sqlite3_result_blob((sqlite3_context *)a4, v6, v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)resultString:(id)a3 context:(void *)a4
{
  id v5 = (const char *)[a3 UTF8String];

  sqlite3_result_text((sqlite3_context *)a4, v5, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)resultError:(id)a3 context:(void *)a4
{
  id v5 = (const char *)[a3 UTF8String];

  sqlite3_result_error((sqlite3_context *)a4, v5, -1);
}

- (void)resultErrorCode:(int)a3 context:(void *)a4
{
}

- (void)resultErrorNoMemoryInContext:(void *)a3
{
}

- (void)resultErrorTooBigInContext:(void *)a3
{
}

- (BOOL)traceExecution
{
  return self->_traceExecution;
}

- (void)setTraceExecution:(BOOL)a3
{
  self->_traceExecution = a3;
}

- (BOOL)checkedOut
{
  return self->_checkedOut;
}

- (void)setCheckedOut:(BOOL)a3
{
  self->_checkedOut = a3;
}

- (BOOL)crashOnErrors
{
  return self->_crashOnErrors;
}

- (void)setCrashOnErrors:(BOOL)a3
{
  self->_crashOnErrors = a3;
}

- (BOOL)logsErrors
{
  return self->_logsErrors;
}

- (void)setLogsErrors:(BOOL)a3
{
  self->_logsErrors = a3;
}

- (NSMutableDictionary)cachedStatements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCachedStatements:(id)a3
{
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (void)setIsOpen:(BOOL)a3
{
  self->_BOOL isOpen = a3;
}

- (BOOL)isInTransaction
{
  return self->_isInTransaction;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_cachedStatements, 0);
  objc_storeStrong((id *)&self->_dateFormat, 0);
  objc_storeStrong((id *)&self->_openFunctions, 0);

  objc_storeStrong((id *)&self->_openResultSets, 0);
}

- (id)stringForQuery:(id)a3
{
  BOOL v3 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:&v7 shouldBind:1];
  id v4 = 0;
  if ([v3 next])
  {
    id v4 = [v3 stringForColumnIndex:0];
    [v3 close];
    [v3 setParentDB:0];
  }

  return v4;
}

- (int)intForQuery:(id)a3
{
  BOOL v3 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:&v6 shouldBind:1];
  if ([v3 next])
  {
    int v4 = [v3 intForColumnIndex:0];
    [v3 close];
    [v3 setParentDB:0];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int64_t)longForQuery:(id)a3
{
  BOOL v3 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:&v6 shouldBind:1];
  id v4 = 0;
  if ([v3 next])
  {
    id v4 = [v3 longForColumnIndex:0];
    [v3 close];
    [v3 setParentDB:0];
  }

  return (int64_t)v4;
}

- (BOOL)BOOLForQuery:(id)a3
{
  BOOL v3 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:&v6 shouldBind:1];
  if ([v3 next])
  {
    unsigned __int8 v4 = [v3 BOOLForColumnIndex:0];
    [v3 close];
    [v3 setParentDB:0];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (double)doubleForQuery:(id)a3
{
  BOOL v3 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:&v7 shouldBind:1];
  double v4 = 0.0;
  if ([v3 next])
  {
    [v3 doubleForColumnIndex:0];
    double v4 = v5;
    [v3 close];
    [v3 setParentDB:0];
  }

  return v4;
}

- (id)dataForQuery:(id)a3
{
  BOOL v3 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:&v7 shouldBind:1];
  double v4 = 0;
  if ([v3 next])
  {
    double v4 = [v3 dataForColumnIndex:0];
    [v3 close];
    [v3 setParentDB:0];
  }

  return v4;
}

- (id)dateForQuery:(id)a3
{
  BOOL v3 = [(_bmFMDatabase *)self executeQuery:a3 withArgumentsInArray:0 orDictionary:0 orVAList:&v7 shouldBind:1];
  double v4 = 0;
  if ([v3 next])
  {
    double v4 = [v3 dateForColumnIndex:0];
    [v3 close];
    [v3 setParentDB:0];
  }

  return v4;
}

- (BOOL)tableExists:(id)a3
{
  double v4 = [a3 lowercaseString];
  double v5 = [(_bmFMDatabase *)self executeQuery:@"select [sql] from sqlite_master where [type] = 'table' and lower(name) = ?", v4];
  unsigned __int8 v6 = [v5 next];
  [v5 close];

  return v6;
}

- (id)getSchema
{
  return [(_bmFMDatabase *)self executeQuery:@"SELECT type, name, tbl_name, rootpage, sql FROM (SELECT * FROM sqlite_master UNION ALL SELECT * FROM sqlite_temp_master) WHERE type != 'meta' AND name NOT LIKE 'sqlite_%' ORDER BY tbl_name, type DESC, name"];
}

- (id)getTableSchema:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSString) initWithFormat:@"pragma table_info('%@')", v4];

  unsigned __int8 v6 = [(_bmFMDatabase *)self executeQuery:v5];

  return v6;
}

- (BOOL)columnExists:(id)a3 inTableWithName:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 lowercaseString];
  id v8 = [v6 lowercaseString];

  id v9 = [(_bmFMDatabase *)self getTableSchema:v7];
  do
  {
    unsigned int v10 = [v9 next];
    if (!v10) {
      break;
    }
    id v11 = [v9 stringForColumn:@"name"];
    id v12 = [v11 lowercaseString];
    unsigned int v13 = [v12 isEqualToString:v8];
  }
  while (!v13);
  [v9 close];

  return v10;
}

- (unsigned)applicationID
{
  id v2 = [(_bmFMDatabase *)self executeQuery:@"pragma application_id"];
  if ([v2 next]) {
    unsigned int v3 = [v2 longLongIntForColumnIndex:0];
  }
  else {
    unsigned int v3 = 0;
  }
  [v2 close];

  return v3;
}

- (void)setApplicationID:(unsigned int)a3
{
  id v5 = [objc_alloc((Class)NSString) initWithFormat:@"pragma application_id=%d", *(void *)&a3];
  id v4 = [(_bmFMDatabase *)self executeQuery:v5];
  [v4 next];
  [v4 close];
}

- (unsigned)userVersion
{
  id v2 = [(_bmFMDatabase *)self executeQuery:@"pragma user_version"];
  if ([v2 next]) {
    unsigned int v3 = [v2 longLongIntForColumnIndex:0];
  }
  else {
    unsigned int v3 = 0;
  }
  [v2 close];

  return v3;
}

- (void)setUserVersion:(unsigned int)a3
{
  id v5 = [objc_alloc((Class)NSString) initWithFormat:@"pragma user_version = %d", *(void *)&a3];
  id v4 = [(_bmFMDatabase *)self executeQuery:v5];
  [v4 next];
  [v4 close];
}

- (BOOL)columnExists:(id)a3 columnName:(id)a4
{
  return [(_bmFMDatabase *)self columnExists:a4 inTableWithName:a3];
}

- (BOOL)validateSQL:(id)a3 error:(id *)a4
{
  ppStmt = 0;
  id v6 = a3;
  uint64_t v7 = [(_bmFMDatabase *)self sqliteHandle];
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];

  int v10 = sqlite3_prepare_v2(v7, v9, -1, &ppStmt, 0);
  int v11 = v10;
  if (a4 && v10)
  {
    uint64_t v12 = [(_bmFMDatabase *)self lastErrorCode];
    unsigned int v13 = [(_bmFMDatabase *)self lastErrorMessage];
    id v14 = +[NSDictionary dictionaryWithObject:v13 forKey:NSLocalizedDescriptionKey];
    *a4 = +[NSError errorWithDomain:NSCocoaErrorDomain code:v12 userInfo:v14];
  }
  sqlite3_finalize(ppStmt);
  return v11 == 0;
}

@end