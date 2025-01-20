@interface ACCSQLite
- (ACCSQLite)initWithPath:(id)a3 schema:(id)a4;
- (ACCSQLiteDelegate)delegate;
- (BOOL)corrupt;
- (BOOL)executeSQL:(id)a3;
- (BOOL)executeSQL:(id)a3 arguments:(char *)a4;
- (BOOL)hasMigrated;
- (BOOL)isOpen;
- (BOOL)openWithError:(id *)a3;
- (BOOL)shouldVacuum;
- (BOOL)traced;
- (NSDateFormatter)dateFormatter;
- (NSMutableDictionary)statementsBySQL;
- (NSString)objectClassPrefix;
- (NSString)path;
- (NSString)schema;
- (NSString)schemaVersion;
- (id)_createSchemaHash;
- (id)_synchronousModeString;
- (id)_tableNameForClass:(Class)a3;
- (id)allTableNames;
- (id)columnNamesForTable:(id)a3;
- (id)creationDate;
- (id)datePropertyForKey:(id)a3;
- (id)propertyForKey:(id)a3;
- (id)select:(id)a3 from:(id)a4;
- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6;
- (id)selectAllFrom:(id)a3 where:(id)a4 bindings:(id)a5;
- (id)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 limit:(id)a6;
- (id)statementForSQL:(id)a3;
- (int)changes;
- (int)dbUserVersion;
- (int)userVersion;
- (int64_t)insertOrReplaceInto:(id)a3 values:(id)a4;
- (int64_t)lastInsertRowID;
- (int64_t)synchronousMode;
- (sqlite3)db;
- (unint64_t)openCount;
- (unint64_t)selectCountFrom:(id)a3 where:(id)a4 bindings:(id)a5;
- (void)_periodicVacuum;
- (void)_synchronousModeString;
- (void)analyze;
- (void)begin;
- (void)close;
- (void)dealloc;
- (void)deleteFrom:(id)a3 matchingValues:(id)a4;
- (void)deleteFrom:(id)a3 where:(id)a4 bindings:(id)a5;
- (void)dropAllTables;
- (void)end;
- (void)open;
- (void)remove;
- (void)removeAllStatements;
- (void)removePropertyForKey:(id)a3;
- (void)rollback;
- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 block:(id)a9;
- (void)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 orderBy:(id)a6 limit:(id)a7 block:(id)a8;
- (void)setCorrupt:(BOOL)a3;
- (void)setDateFormatter:(id)a3;
- (void)setDateProperty:(id)a3 forKey:(id)a4;
- (void)setDb:(sqlite3 *)a3;
- (void)setDelegate:(id)a3;
- (void)setObjectClassPrefix:(id)a3;
- (void)setOpenCount:(unint64_t)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)setShouldVacuum:(BOOL)a3;
- (void)setSynchronousMode:(int64_t)a3;
- (void)setTraced:(BOOL)a3;
- (void)setUserVersion:(int)a3;
- (void)update:(id)a3 set:(id)a4 where:(id)a5 bindings:(id)a6 limit:(id)a7;
- (void)vacuum;
@end

@implementation ACCSQLite

- (ACCSQLite)initWithPath:(id)a3 schema:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ACCSQLite;
  v9 = [(ACCSQLite *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a3);
    objc_storeStrong((id *)&v10->_schema, a4);
    uint64_t v11 = [(ACCSQLite *)v10 _createSchemaHash];
    schemaVersion = v10->_schemaVersion;
    v10->_schemaVersion = (NSString *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    statementsBySQL = v10->_statementsBySQL;
    v10->_statementsBySQL = v13;

    objectClassPrefix = v10->_objectClassPrefix;
    v10->_objectClassPrefix = (NSString *)@"CK";

    v10->_synchronousMode = 1;
    *(_WORD *)&v10->_hasMigrated = 256;
  }

  return v10;
}

- (void)dealloc
{
  [(ACCSQLite *)self close];
  v4.receiver = self;
  v4.super_class = (Class)ACCSQLite;
  [(ACCSQLite *)&v4 dealloc];
}

- (int)userVersion
{
  v3 = [(ACCSQLite *)self delegate];

  if (!v3) {
    return self->_userVersion;
  }
  objc_super v4 = [(ACCSQLite *)self delegate];
  int v5 = [v4 userVersion];

  return v5;
}

- (id)_synchronousModeString
{
  unint64_t v2 = [(ACCSQLite *)self synchronousMode];
  if (v2 >= 3) {
    -[ACCSQLite _synchronousModeString]();
  }
  return *(&off_50AA0 + v2);
}

- (id)_createSchemaHash
{
  memset(v8, 0, sizeof(v8));
  v3 = +[NSData dataWithBytesNoCopy:v8 length:32 freeWhenDone:0];
  objc_super v4 = [(ACCSQLite *)self schema];
  int v5 = [v4 dataUsingEncoding:4];

  CC_SHA256([v5 bytes], (CC_LONG)objc_msgSend(v5, "length"), (unsigned __int8 *)v8);
  v6 = [v3 CKUppercaseHexStringWithoutSpaces];

  return v6;
}

- (BOOL)isOpen
{
  return self->_db != 0;
}

- (void)_periodicVacuum
{
  v3 = [(ACCSQLite *)self propertyForKey:@"LastVacuum"];
  [v3 floatValue];
  id v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v4];

  [v9 timeIntervalSinceNow];
  if (v5 < -604800.0)
  {
    [(ACCSQLite *)self executeSQL:@"VACUUM"];
    v6 = +[NSDate date];
    [v6 timeIntervalSinceReferenceDate];
    id v8 = +[NSString stringWithFormat:@"%f", v7];

    [(ACCSQLite *)self setProperty:v8 forKey:@"LastVacuum"];
  }
}

- (BOOL)openWithError:(id *)a3
{
  double v5 = self->_path;
  unint64_t openCount = self->_openCount;
  if (openCount)
  {
    uint64_t v7 = 0;
    id v8 = 0;
    id v9 = 0;
    self->_unint64_t openCount = openCount + 1;
LABEL_3:
    BOOL v10 = 1;
    goto LABEL_31;
  }
  id v8 = [(NSString *)self->_path stringByDeletingLastPathComponent];
  uint64_t v11 = +[NSFileManager defaultManager];
  id v49 = 0;
  unsigned __int8 v12 = [v11 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v49];
  id v13 = v49;
  v14 = v13;
  if (v12) {
    goto LABEL_7;
  }
  v15 = [v13 domain];
  if (![v15 isEqualToString:NSCocoaErrorDomain])
  {

    goto LABEL_11;
  }
  v16 = (char *)[v14 code];

  if (v16 != &stru_1F8.sectname[12])
  {
LABEL_11:
    id v22 = v14;
    int v23 = 0;
    id v18 = v22;
    goto LABEL_12;
  }
LABEL_7:
  id v48 = v14;
  objc_super v17 = [v11 attributesOfItemAtPath:v8 error:&v48];
  id v18 = v48;

  v19 = [v17 objectForKeyedSubscript:NSFileProtectionKey];
  unsigned __int8 v20 = [v19 isEqualToString:NSFileProtectionCompleteUntilFirstUserAuthentication];

  if ((v20 & 1) == 0)
  {
    NSFileAttributeKey v54 = NSFileProtectionKey;
    NSFileProtectionType v55 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    v21 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    [v11 setAttributes:v21 ofItemAtPath:v8 error:0];
  }
  id v22 = 0;
  int v23 = 1;
LABEL_12:

  id v9 = v22;
  if (!v23) {
    goto LABEL_26;
  }
  p_db = &self->_db;
  uint64_t v25 = sqlite3_open_v2([(NSString *)v5 fileSystemRepresentation], &self->_db, 3145734, 0);
  if (v25)
  {
    NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
    v26 = +[NSString stringWithFormat:@"Error opening db at %@, rc=%d(0x%x)", self->_path, v25, v25];
    v53 = v26;
    v27 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    uint64_t v28 = +[NSError errorWithDomain:NSCocoaErrorDomain code:0 userInfo:v27];

    id v9 = (id)v28;
    goto LABEL_26;
  }
  sqlite3_extended_result_codes(*p_db, 1);
  if (!sqlite3_busy_timeout(*p_db, 300000))
  {
    if ([(ACCSQLite *)self executeSQL:@"pragma journal_mode = WAL"])
    {
      v29 = [(ACCSQLite *)self _synchronousModeString];
      unsigned int v30 = [(ACCSQLite *)self executeSQL:@"pragma synchronous = %@", v29];

      if (v30)
      {
        if ([(ACCSQLite *)self executeSQL:@"pragma auto_vacuum = FULL"])
        {
          [(ACCSQLite *)self begin];
          v31 = [(ACCSQLite *)self select:&off_5A720 from:@"sqlite_master" where:@"type = ? AND name = ?" bindings:&off_5A738];
          if (![v31 count]) {
            [(ACCSQLite *)self executeSQL:@"create table if not exists Properties (\n    key    text primary key,\n    value  text\n);\n"];
          }
          uint64_t v7 = [(ACCSQLite *)self propertyForKey:@"SchemaVersion"];
          uint64_t v32 = [(ACCSQLite *)self dbUserVersion];
          if (v7)
          {
            uint64_t v33 = v32;
            v34 = [(ACCSQLite *)self schemaVersion];
            if ([v7 isEqualToString:v34])
            {
              if (![(ACCSQLite *)self userVersion])
              {
                char v43 = 0;
                goto LABEL_40;
              }
              unsigned int v35 = [(ACCSQLite *)self userVersion];

              if (v33 == v35)
              {
LABEL_37:
                char v43 = 0;
LABEL_41:
                [(ACCSQLite *)self end];
                if ([(ACCSQLite *)self shouldVacuum]) {
                  [(ACCSQLite *)self _periodicVacuum];
                }
                if ((v43 & 1) != 0 || self->_hasMigrated)
                {
                  v47 = [(ACCSQLite *)self schemaVersion];
                  [(ACCSQLite *)self setProperty:v47 forKey:@"SchemaVersion"];

                  if ([(ACCSQLite *)self userVersion]) {
                    [(ACCSQLite *)self executeSQL:@"pragma user_version = %ld", [(ACCSQLite *)self userVersion]];
                  }
                }
                ++self->_openCount;

                goto LABEL_3;
              }
            }
            else
            {
            }
            uint64_t v39 = [(ACCSQLite *)self delegate];
            if (v39)
            {
              v40 = (void *)v39;
              v41 = [(ACCSQLite *)self delegate];
              unsigned int v42 = [v41 migrateDatabase:self fromVersion:v33];

              if (v42) {
                self->_hasMigrated = 1;
              }
            }
            if (self->_hasMigrated) {
              goto LABEL_37;
            }
            [(ACCSQLite *)self removeAllStatements];
            [(ACCSQLite *)self dropAllTables];
            self->_hasMigrated = 1;
          }
          [(ACCSQLite *)self executeSQL:@"create table if not exists Properties (\n    key    text primary key,\n    value  text\n);\n"];
          v44 = [(ACCSQLite *)self schema];
          [(ACCSQLite *)self executeSQL:@"%@", v44];

          v45 = +[NSDate date];
          [v45 timeIntervalSinceReferenceDate];
          v34 = +[NSString stringWithFormat:@"%f", v46];

          [(ACCSQLite *)self setProperty:v34 forKey:@"Created"];
          char v43 = 1;
LABEL_40:

          goto LABEL_41;
        }
      }
    }
  }
LABEL_26:
  sqlite3_close_v2(self->_db);
  self->_db = 0;
  if (a3)
  {
    if (!v9)
    {
      NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
      v36 = +[NSString stringWithFormat:@"Error opening db at %@, ", self->_path];
      v51 = v36;
      v37 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      id v9 = +[NSError errorWithDomain:NSCocoaErrorDomain code:0 userInfo:v37];
    }
    id v9 = v9;
    uint64_t v7 = 0;
    BOOL v10 = 0;
    *a3 = v9;
  }
  else
  {
    uint64_t v7 = 0;
    BOOL v10 = 0;
  }
LABEL_31:

  return v10;
}

- (void)open
{
  id v6 = 0;
  unsigned __int8 v3 = [(ACCSQLite *)self openWithError:&v6];
  id v4 = v6;
  if ((v3 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [(ACCSQLite *)self path];
    *(_DWORD *)buf = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Error opening db at %@: %@", buf, 0x16u);
  }
}

- (void)close
{
  unint64_t openCount = self->_openCount;
  if (openCount)
  {
    if (openCount == 1)
    {
      [(ACCSQLite *)self removeAllStatements];
      if (sqlite3_close(self->_db))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v4 = 0;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Error closing database", v4, 2u);
        }
        return;
      }
      self->_db = 0;
      unint64_t openCount = self->_openCount;
    }
    self->_unint64_t openCount = openCount - 1;
  }
}

- (void)remove
{
  unsigned __int8 v3 = +[NSFileManager defaultManager];
  [v3 removeItemAtPath:self->_path error:0];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [&off_5A708 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(&off_5A708);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        __int16 v9 = +[NSFileManager defaultManager];
        id v10 = [(NSString *)self->_path stringByAppendingString:v8];
        [v9 removeItemAtPath:v10 error:0];

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [&off_5A708 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)begin
{
}

- (void)end
{
}

- (void)rollback
{
}

- (void)analyze
{
}

- (void)vacuum
{
}

- (int64_t)lastInsertRowID
{
  db = self->_db;
  if (db)
  {
    return sqlite3_last_insert_rowid(db);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Database is closed", v4, 2u);
    }
    return -1;
  }
}

- (int)changes
{
  db = self->_db;
  if (db)
  {
    return sqlite3_changes(db);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Database is closed", v4, 2u);
    }
    return -1;
  }
}

- (BOOL)executeSQL:(id)a3
{
  return [(ACCSQLite *)self executeSQL:a3 arguments:&v4];
}

- (BOOL)executeSQL:(id)a3 arguments:(char *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSString) initWithFormat:v6 arguments:a4];

  db = self->_db;
  if (db)
  {
    int v9 = sqlite3_exec(db, (const char *)[v7 UTF8String], 0, 0, 0);
    if (!v9)
    {
      BOOL v11 = 1;
      goto LABEL_9;
    }
    int v10 = v9;
    BOOL v11 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v7;
      __int16 v17 = 1024;
      int v18 = v10;
      long long v12 = "[#ACCEventLogger] accsqlite: Error executing SQL: \"%@\" (%d)";
      uint32_t v13 = 18;
LABEL_7:
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, v13);
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      long long v12 = "[#ACCEventLogger] accsqlite: Database is closed";
      uint32_t v13 = 2;
      goto LABEL_7;
    }
  }
LABEL_9:

  return v11;
}

- (id)statementForSQL:(id)a3
{
  id v4 = a3;
  if (!self->_db)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: Database is closed", buf, 2u);
    }
    goto LABEL_9;
  }
  id v5 = [(NSMutableDictionary *)self->_statementsBySQL objectForKeyedSubscript:v4];
  if (v5) {
    goto LABEL_10;
  }
  ppStmt = 0;
  id v6 = v4;
  if (sqlite3_prepare_v2(self->_db, (const char *)[v6 UTF8String], -1, &ppStmt, 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] Error preparing statement: %@", buf, 0xCu);
    }

LABEL_9:
    id v5 = 0;
    goto LABEL_10;
  }
  uint64_t v8 = [ACCSQLiteStatement alloc];
  id v5 = [(ACCSQLiteStatement *)v8 initWithSQLite:self SQL:v6 handle:ppStmt];
  [(NSMutableDictionary *)self->_statementsBySQL setObject:v5 forKeyedSubscript:v6];

LABEL_10:

  return v5;
}

- (void)removeAllStatements
{
  unsigned __int8 v3 = [(NSMutableDictionary *)self->_statementsBySQL allValues];
  [v3 makeObjectsPerformSelector:"finalizeStatement"];

  statementsBySQL = self->_statementsBySQL;

  [(NSMutableDictionary *)statementsBySQL removeAllObjects];
}

- (id)allTableNames
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(ACCSQLite *)self statementForSQL:@"select name from sqlite_master where type = 'table'"];
  if ([v4 step])
  {
    do
    {
      id v5 = [v4 textAtIndex:0];
      [v3 addObject:v5];
    }
    while (([v4 step] & 1) != 0);
  }
  [v4 reset];

  return v3;
}

- (void)dropAllTables
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(ACCSQLite *)self allTableNames];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(ACCSQLite *)self executeSQL:@"drop table %@", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)propertyForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(ACCSQLite *)self statementForSQL:@"select value from Properties where key = ?"];
  [v5 bindText:v4 atIndex:0];

  uint64_t v6 = 0;
  if ([v5 step])
  {
    uint64_t v6 = [v5 textAtIndex:0];
  }
  [v5 reset];

  return v6;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    id v7 = [(ACCSQLite *)self statementForSQL:@"insert or replace into Properties (key, value) values (?,?)"];
    [v7 bindText:v6 atIndex:0];

    [v7 bindText:v8 atIndex:1];
    [v7 step];
    [v7 reset];
    id v6 = v7;
  }
  else
  {
    [(ACCSQLite *)self removePropertyForKey:v6];
  }
}

- (NSDateFormatter)dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_opt_new();
    [(NSDateFormatter *)v4 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    id v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    dateFormatter = self->_dateFormatter;
  }

  return dateFormatter;
}

- (id)datePropertyForKey:(id)a3
{
  id v4 = [(ACCSQLite *)self propertyForKey:a3];
  if ([v4 length])
  {
    id v5 = [(ACCSQLite *)self dateFormatter];
    id v6 = [v5 dateFromString:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setDateProperty:(id)a3 forKey:(id)a4
{
  id v8 = a4;
  if (a3)
  {
    id v6 = a3;
    id v7 = [(ACCSQLite *)self dateFormatter];
    a3 = [v7 stringFromDate:v6];
  }
  [(ACCSQLite *)self setProperty:a3 forKey:v8];
}

- (void)removePropertyForKey:(id)a3
{
  id v4 = a3;
  [(ACCSQLite *)self statementForSQL:@"delete from Properties where key = ?"];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 bindText:v4 atIndex:0];

  [v5 step];
  [v5 reset];
}

- (id)creationDate
{
  unint64_t v2 = [(ACCSQLite *)self propertyForKey:@"Created"];
  [v2 floatValue];
  id v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v3];

  return v4;
}

- (id)columnNamesForTable:(id)a3
{
  id v4 = +[NSString stringWithFormat:@"pragma table_info(%@)", a3];
  id v5 = [(ACCSQLite *)self statementForSQL:v4];

  id v6 = objc_alloc_init((Class)NSMutableSet);
  if ([v5 step])
  {
    do
    {
      id v7 = [v5 textAtIndex:1];
      [v6 addObject:v7];
    }
    while (([v5 step] & 1) != 0);
  }
  [v5 reset];

  return v6;
}

- (id)select:(id)a3 from:(id)a4
{
  return [(ACCSQLite *)self select:a3 from:a4 where:0 bindings:0];
}

- (id)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init((Class)NSMutableArray);
  int v15 = [v10 componentsJoinedByString:@", "];
  id v16 = +[NSMutableString stringWithFormat:@"select %@ from %@", v15, v11];

  if (v12) {
    [v16 appendFormat:@" where %@", v12];
  }
  __int16 v17 = [(ACCSQLite *)self statementForSQL:v16];
  [v17 bindValues:v13];
  if ([v17 step])
  {
    do
    {
      int v18 = [v17 allObjectsByColumnName];
      [v14 addObject:v18];
    }
    while (([v17 step] & 1) != 0);
  }
  [v17 reset];

  return v14;
}

- (void)select:(id)a3 from:(id)a4 where:(id)a5 bindings:(id)a6 orderBy:(id)a7 limit:(id)a8 block:(id)a9
{
  id v15 = a3;
  id v30 = a4;
  id v16 = a5;
  id v29 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = (void (**)(id, void *, unsigned char *))a9;
  id v21 = objc_alloc_init((Class)NSMutableString);
  uint64_t v28 = v15;
  if ([v15 count])
  {
    id v22 = [v15 componentsJoinedByString:@", "];
  }
  else
  {
    id v22 = @"*";
  }
  [v21 appendFormat:@"select %@ from %@", v22, v30];
  if ([v16 length]) {
    [v21 appendFormat:@" where %@", v16];
  }
  if (v17)
  {
    int v23 = [v17 componentsJoinedByString:@", "];
    [v21 appendFormat:@" order by %@", v23];
  }
  if (v18) {
    objc_msgSend(v21, "appendFormat:", @" limit %ld", objc_msgSend(v18, "integerValue"));
  }
  v24 = [(ACCSQLite *)self statementForSQL:v21];
  [v24 bindValues:v29];
  v26 = v17;
  if ([v24 step])
  {
    while (1)
    {
      v27 = [v24 allObjectsByColumnName];
      if (v19)
      {
        char v31 = 0;
        v19[2](v19, v27, &v31);
        if (v31) {
          break;
        }
      }

      if (([v24 step] & 1) == 0) {
        goto LABEL_16;
      }
    }
  }
LABEL_16:
  [v24 reset];
}

- (void)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 orderBy:(id)a6 limit:(id)a7 block:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = (void (**)(id, void *, unsigned char *))a8;
  id v20 = objc_alloc_init((Class)NSMutableString);
  [v20 appendFormat:@"select * from %@", v14];
  if ([v15 length]) {
    [v20 appendFormat:@" where %@", v15, context];
  }
  if (v17)
  {
    id v21 = [v17 componentsJoinedByString:@", "];
    [v20 appendFormat:@" order by %@", v21];
  }
  if (v18) {
    objc_msgSend(v20, "appendFormat:", @" limit %ld", objc_msgSend(v18, "integerValue"));
  }
  id v22 = [(ACCSQLite *)self statementForSQL:v20];
  [v22 bindValues:v16];
  if ([v22 step])
  {
    while (1)
    {
      v24 = [v22 allObjectsByColumnName];
      if (v19)
      {
        char v26 = 0;
        v19[2](v19, v24, &v26);
        if (v26) {
          break;
        }
      }

      if (([v22 step] & 1) == 0) {
        goto LABEL_13;
      }
    }
  }
LABEL_13:
  [v22 reset];
}

- (id)selectFrom:(id)a3 where:(id)a4 bindings:(id)a5 limit:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init((Class)NSMutableString);
  [v14 appendFormat:@"select * from %@", v10];
  if ([v11 length]) {
    [v14 appendFormat:@" where %@", v11];
  }
  if (v13) {
    objc_msgSend(v14, "appendFormat:", @" limit %ld", objc_msgSend(v13, "integerValue"));
  }
  id v15 = objc_alloc_init((Class)NSMutableArray);
  id v16 = [(ACCSQLite *)self statementForSQL:v14];
  [v16 bindValues:v12];
  if ([v16 step])
  {
    do
    {
      id v17 = [v16 allObjectsByColumnName];
      [v15 addObject:v17];
    }
    while (([v16 step] & 1) != 0);
  }
  [v16 reset];

  return v15;
}

- (void)update:(id)a3 set:(id)a4 where:(id)a5 bindings:(id)a6 limit:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init((Class)NSMutableString);
  [v16 appendFormat:@"update %@", v18];
  [v16 appendFormat:@" set %@", v12];
  if ([v13 length]) {
    [v16 appendFormat:@" where %@", v13];
  }
  if (v15) {
    objc_msgSend(v16, "appendFormat:", @" limit %ld", objc_msgSend(v15, "integerValue"));
  }
  id v17 = [(ACCSQLite *)self statementForSQL:v16];
  [v17 bindValues:v14];
  while (([v17 step] & 1) != 0)
    ;
  [v17 reset];
}

- (id)selectAllFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  return [(ACCSQLite *)self selectFrom:a3 where:a4 bindings:a5 limit:0];
}

- (unint64_t)selectCountFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  id v5 = [(ACCSQLite *)self select:&off_5A750 from:a3 where:a4 bindings:a5];
  id v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [v6 objectForKeyedSubscript:@"n"];
  id v8 = [v7 unsignedIntegerValue];

  return (unint64_t)v8;
}

- (int64_t)insertOrReplaceInto:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 allKeys];
  long long v9 = [v8 sortedArrayUsingSelector:"compare:"];

  id v10 = objc_alloc_init((Class)NSMutableArray);
  if ([v9 count])
  {
    unint64_t v11 = 0;
    do
    {
      id v12 = [v9 objectAtIndexedSubscript:v11];
      id v13 = [v7 objectForKeyedSubscript:v12];
      [v10 setObject:v13 atIndexedSubscript:v11];

      ++v11;
    }
    while (v11 < (unint64_t)[v9 count]);
  }
  id v14 = [objc_alloc((Class)NSMutableString) initWithString:@"insert or replace into "];
  [v14 appendString:v6];
  objc_msgSend(v14, "appendString:", @" (");
  if ([v9 count])
  {
    id v15 = 0;
    do
    {
      id v16 = [v9 objectAtIndexedSubscript:v15];
      [v14 appendString:v16];

      if (v15 != (char *)[v9 count] - 1) {
        [v14 appendString:@","];
      }
      ++v15;
    }
    while (v15 < [v9 count]);
  }
  [v14 appendString:@") values ("];
  if ([v9 count])
  {
    id v17 = 0;
    do
    {
      if (v17 == (char *)[v9 count] - 1) {
        id v18 = @"?";
      }
      else {
        id v18 = @"?,";
      }
      [v14 appendString:v18];
      ++v17;
    }
    while (v17 < [v9 count]);
  }
  [v14 appendString:@""]);
  v19 = [(ACCSQLite *)self statementForSQL:v14];
  [v19 bindValues:v10];
  [v19 step];
  [v19 reset];
  int64_t v20 = [(ACCSQLite *)self lastInsertRowID];

  return v20;
}

- (void)deleteFrom:(id)a3 matchingValues:(id)a4
{
  id v18 = self;
  id v19 = a3;
  id v5 = a4;
  id v6 = [v5 allKeys];
  id v7 = [v6 sortedArrayUsingSelector:"compare:"];

  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = objc_alloc_init((Class)NSMutableString);
  if ([v7 count])
  {
    id v10 = 0;
    int v11 = 0;
    do
    {
      id v12 = objc_msgSend(v7, "objectAtIndexedSubscript:", v10, v18);
      id v13 = [v5 objectForKeyedSubscript:v12];

      id v14 = [v7 objectAtIndexedSubscript:v10];
      [v9 appendString:v14];

      if (v13
        && (+[NSNull null],
            id v15 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v16 = [v15 isEqual:v13],
            v15,
            (v16 & 1) == 0))
      {
        [v8 setObject:v13 atIndexedSubscript:v11];
        id v17 = @"=?";
        ++v11;
      }
      else
      {
        id v17 = @" is NULL";
      }
      [v9 appendString:v17];
      if (v10 != (char *)[v7 count] - 1) {
        [v9 appendString:@" AND "];
      }

      ++v10;
    }
    while (v10 < [v7 count]);
  }
  -[ACCSQLite deleteFrom:where:bindings:](v18, "deleteFrom:where:bindings:", v19, v9, v8, v18);
}

- (void)deleteFrom:(id)a3 where:(id)a4 bindings:(id)a5
{
  id v8 = a5;
  id v10 = +[NSString stringWithFormat:@"delete from %@ where %@", a3, a4];
  id v9 = [(ACCSQLite *)self statementForSQL:v10];
  [v9 bindValues:v8];

  [v9 step];
  [v9 reset];
}

- (id)_tableNameForClass:(Class)a3
{
  id v4 = [(objc_class *)a3 ACCSQLiteClassName];
  if ([v4 hasPrefix:self->_objectClassPrefix])
  {
    id v5 = objc_msgSend(v4, "substringFromIndex:", -[NSString length](self->_objectClassPrefix, "length"));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = +[NSString stringWithFormat:@"Object class \"%@\" does not have prefix \"%@\"", v4, self->_objectClassPrefix];
      *(_DWORD *)buf = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#ACCEventLogger] accsqlite: %@", buf, 0xCu);
    }
    id v5 = 0;
  }

  return v5;
}

- (int)dbUserVersion
{
  unint64_t v2 = [(ACCSQLite *)self statementForSQL:@"pragma user_version"];
  if ([v2 step])
  {
    do
      int v3 = [v2 intAtIndex:0];
    while (([v2 step] & 1) != 0);
  }
  else
  {
    int v3 = 0;
  }
  [v2 reset];

  return v3;
}

- (ACCSQLiteDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (NSString)schema
{
  return self->_schema;
}

- (NSString)schemaVersion
{
  return self->_schemaVersion;
}

- (NSString)objectClassPrefix
{
  return self->_objectClassPrefix;
}

- (void)setObjectClassPrefix:(id)a3
{
}

- (void)setUserVersion:(int)a3
{
  self->_userVersion = a3;
}

- (int64_t)synchronousMode
{
  return self->_synchronousMode;
}

- (void)setSynchronousMode:(int64_t)a3
{
  self->_synchronousMode = a3;
}

- (BOOL)hasMigrated
{
  return self->_hasMigrated;
}

- (BOOL)shouldVacuum
{
  return self->_shouldVacuum;
}

- (void)setShouldVacuum:(BOOL)a3
{
  self->_shouldVacuum = a3;
}

- (BOOL)traced
{
  return self->_traced;
}

- (void)setTraced:(BOOL)a3
{
  self->_traced = a3;
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (unint64_t)openCount
{
  return self->_openCount;
}

- (void)setOpenCount:(unint64_t)a3
{
  self->_unint64_t openCount = a3;
}

- (BOOL)corrupt
{
  return self->_corrupt;
}

- (void)setCorrupt:(BOOL)a3
{
  self->_corrupt = a3;
}

- (NSMutableDictionary)statementsBySQL
{
  return self->_statementsBySQL;
}

- (void)setDateFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_objectClassPrefix, 0);
  objc_storeStrong((id *)&self->_statementsBySQL, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)_synchronousModeString
{
}

@end