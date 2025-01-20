@interface NDTSQFile
- (NDTSQFile)initWithPath:(id)a3;
- (NDTSQFile)initWithPath:(id)a3 queue:(id)a4;
- (NDTSQFile)initWithURL:(id)a3;
- (NDTSQFileDelegate)delegate;
- (NSString)path;
- (NSString)pathTemplate;
- (id)_loadCache:(id)a3 sqlErr:(int *)a4;
- (id)_makeSqlErrorReasonString:(id)a3;
- (int64_t)_instanceVersion:(id)a3;
- (int64_t)changes;
- (sqlite3)db;
- (void)_addSchema:(id)a3;
- (void)_bootstrap;
- (void)_createParentDirectory;
- (void)_databaseChangedExternally;
- (void)_executeSql:(id)a3;
- (void)_newPath;
- (void)_openDatabase;
- (void)_parseSql:(id)a3 andRun:(id)a4;
- (void)_prepDatabase;
- (void)_recreatePath;
- (void)_setInstance:(id)a3 version:(int64_t)a4;
- (void)_watchWalFile;
- (void)addSchema:(id)a3;
- (void)begin;
- (void)commit;
- (void)executeSql:(id)a3;
- (void)parseSql:(id)a3 andRun:(id)a4;
- (void)rollback;
- (void)setDb:(sqlite3 *)a3;
- (void)setDelegate:(id)a3;
- (void)setPath:(id)a3;
- (void)setPathTemplate:(id)a3;
@end

@implementation NDTSQFile

- (NDTSQFile)initWithURL:(id)a3
{
  v4 = [a3 path];
  v5 = [(NDTSQFile *)self initWithPath:v4];

  return v5;
}

- (NDTSQFile)initWithPath:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:@"NDTSQFile.%@", v4];
  v6 = (const char *)[v5 UTF8String];
  v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v8 = dispatch_queue_create(v6, v7);

  v9 = [(NDTSQFile *)self initWithPath:v4 queue:v8];
  return v9;
}

- (NDTSQFile)initWithPath:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NDTSQFile;
  v9 = [(NDTSQFile *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pathTemplate, a3);
    v11 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:5 capacity:4];
    memberSchemas = v10->_memberSchemas;
    v10->_memberSchemas = v11;

    v10->_memberSchemasLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->_q, a4);
    [(NDTSQFile *)v10 _bootstrap];
  }

  return v10;
}

- (void)_newPath
{
  id v8 = +[NSDate date];
  id v3 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  id v4 = [v3 components:252 fromDate:v8];
  id v5 = [NSString stringWithFormat:@"%04d%02d%02d-%02d%02d%02d", [v4 year], objc_msgSend(v4, "month"), objc_msgSend(v4, "day"), objc_msgSend(v4, "hour"), objc_msgSend(v4, "minute"), objc_msgSend(v4, "second")];
  v6 = [(NSString *)self->_pathTemplate stringByReplacingOccurrencesOfString:@"%t" withString:v5];
  path = self->_path;
  self->_path = v6;
}

- (void)_bootstrap
{
  id v3 = (NSMutableOrderedSet *)[objc_alloc((Class)NSMutableOrderedSet) initWithCapacity:50];
  statementCache = self->_statementCache;
  self->_statementCache = v3;

  [(NDTSQFile *)self _recreatePath];
  [(NDTSQFile *)self _createParentDirectory];
  [(NDTSQFile *)self _openDatabase];
  [(NDTSQFile *)self _prepDatabase];

  [(NDTSQFile *)self _watchWalFile];
}

- (void)_recreatePath
{
  id v4 = [(NDTSQFile *)self delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = [v4 newFileName:self];
    if (v3) {
      objc_storeStrong((id *)&self->_pathTemplate, v3);
    }
  }
  [(NDTSQFile *)self _newPath];
}

- (void)_createParentDirectory
{
  id v3 = [(NDTSQFile *)self path];
  unsigned __int8 v4 = [v3 isEqual:@":memory:"];

  if ((v4 & 1) == 0)
  {
    id v5 = +[NSFileManager defaultManager];
    v6 = [(NDTSQFile *)self path];
    id v7 = [v6 stringByDeletingLastPathComponent];

    if (v7 && [v7 length])
    {
      v15[0] = NSFileOwnerAccountName;
      v15[1] = NSFileGroupOwnerAccountName;
      v16[0] = @"mobile";
      v16[1] = @"mobile";
      v15[2] = NSFilePosixPermissions;
      v16[2] = &off_100059080;
      id v8 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
      v9 = 0;
      do
      {

        id v14 = 0;
        unsigned __int8 v10 = [v5 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:v8 error:&v14];
        id v11 = v14;
        v9 = v11;
        if (v10) {
          break;
        }
        v12 = [v11 domain];
        if (![v12 isEqualToString:NSCocoaErrorDomain])
        {

          break;
        }
        id v13 = [v9 code];
      }
      while (v13 == (id)516);
    }
  }
}

- (void)_openDatabase
{
  id v3 = [(NDTSQFile *)self path];
  int v4 = sqlite3_open_v2((const char *)[v3 UTF8String], &self->_db, 4194310, 0);

  if (v4)
  {
    [(NDTSQFile *)self _makeSqlErrorReasonString:@"_openDatabase(1)"];
    id v5 = +[NDTSQException exceptionWithName:@"NDTSQError" reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v5);
  }
}

- (void)_prepDatabase
{
  [(NDTSQFile *)self _executeSql:@"pragma journal_mode=wal"];
  id v3 = [[NDTSQKeyValueStore alloc] initWithName:@"_SQ_Versions"];
  instanceVersions = self->_instanceVersions;
  self->_instanceVersions = v3;

  id v5 = self->_instanceVersions;

  [(NDTSQFile *)self addSchema:v5];
}

- (void)_watchWalFile
{
  objc_initWeak(&location, self);
  id v3 = [(NDTSQFile *)self path];
  id v4 = +[NSString stringWithFormat:@"%@-wal", v3];
  int v5 = open((const char *)[v4 UTF8String], 0x8000);

  if (v5 != -1)
  {
    v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v5, 2uLL, (dispatch_queue_t)self->_q);
    readSource = self->_readSource;
    self->_readSource = v6;

    id v8 = self->_readSource;
    if (v8)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100012414;
      handler[3] = &unk_100054E20;
      objc_copyWeak(&v13, &location);
      dispatch_source_set_event_handler(v8, handler);
      v9 = self->_readSource;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100012504;
      v10[3] = &unk_100054F80;
      int v11 = v5;
      dispatch_source_set_cancel_handler(v9, v10);
      dispatch_resume((dispatch_object_t)self->_readSource);
      objc_destroyWeak(&v13);
    }
    else
    {
      close(v5);
    }
  }
  objc_destroyWeak(&location);
}

- (void)_databaseChangedExternally
{
  p_memberSchemasLock = &self->_memberSchemasLock;
  os_unfair_lock_lock(&self->_memberSchemasLock);
  id v4 = [(NSHashTable *)self->_memberSchemas copy];
  os_unfair_lock_unlock(p_memberSchemasLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v9);
        q = self->_q;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100012684;
        block[3] = &unk_100054DD0;
        block[4] = v10;
        dispatch_async(q, block);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)_addSchema:(id)a3
{
  id v8 = a3;
  [v8 setDb:self];
  [v8 createTables];
  id v4 = [v8 instanceName];
  id v5 = [v8 currentVersion];
  int64_t v6 = [(NDTSQFile *)self _instanceVersion:v4];
  if ((id)v6 != v5)
  {
    [v8 migrateFrom:v6];
    [(NDTSQFile *)self _setInstance:v4 version:v5];
  }
  id v7 = [(NSHashTable *)self->_memberSchemas member:v8];

  if (!v7) {
    [(NSHashTable *)self->_memberSchemas addObject:v8];
  }
}

- (void)addSchema:(id)a3
{
  p_memberSchemasLock = &self->_memberSchemasLock;
  id v5 = a3;
  os_unfair_lock_lock(p_memberSchemasLock);
  [(NDTSQFile *)self _addSchema:v5];

  os_unfair_lock_unlock(p_memberSchemasLock);
}

- (id)_makeSqlErrorReasonString:(id)a3
{
  db = self->_db;
  id v4 = a3;
  int v5 = sqlite3_errcode(db);
  int64_t v6 = +[NSString stringWithFormat:@"%@: %s", v4, sqlite3_errstr(v5)];

  return v6;
}

- (void)executeSql:(id)a3
{
  id v4 = a3;
  q = self->_q;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000128D0;
  v7[3] = &unk_100054FA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(q, v7);
}

- (void)_executeSql:(id)a3
{
  id v4 = a3;
  ppStmt = 0;
  int v5 = [(NDTSQFile *)self db];
  id v6 = v4;
  if (sqlite3_prepare_v2(v5, (const char *)[v6 UTF8String], -1, &ppStmt, 0)
    || ((v7 = sqlite3_step(ppStmt), (v7 - 100) >= 2) ? (BOOL v8 = v7 == 0) : (BOOL v8 = 1), !v8))
  {
    [(NDTSQFile *)self _makeSqlErrorReasonString:@"_executeSql(1)"];
    id v9 = +[NDTSQException exceptionWithName:@"NDTSQError" reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v9);
  }
  sqlite3_finalize(ppStmt);
}

- (void)parseSql:(id)a3 andRun:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012A74;
  block[3] = &unk_100054FD0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(q, block);
}

- (id)_loadCache:(id)a3 sqlErr:(int *)a4
{
  id v6 = a3;
  *a4 = 0;
  id v7 = [[NDTSQStatement alloc] initWithQueue:self->_q text:v6];
  id v8 = [(NSMutableOrderedSet *)self->_statementCache indexOfObject:v7];
  statementCache = self->_statementCache;
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if ((unint64_t)[(NSMutableOrderedSet *)statementCache count] >= 0x32)
    {
      do
      {
        id v10 = self->_statementCache;
        int v11 = [(NSMutableOrderedSet *)v10 lastObject];
        [(NSMutableOrderedSet *)v10 removeObject:v11];
      }
      while ((unint64_t)[(NSMutableOrderedSet *)self->_statementCache count] > 0x31);
    }
    ppStmt = 0;
    int v12 = sqlite3_prepare_v2(-[NDTSQFile db](self, "db"), (const char *)[v6 UTF8String], -1, &ppStmt, 0);
    if (v12)
    {
      id v13 = 0;
      *a4 = v12;
      goto LABEL_9;
    }
    [(NDTSQStatement *)v7 setParsed:ppStmt];
    [(NDTSQStatement *)v7 setRawDb:[(NDTSQFile *)self db]];
  }
  else
  {
    uint64_t v14 = [(NSMutableOrderedSet *)statementCache objectAtIndex:v8];

    [(NSMutableOrderedSet *)self->_statementCache removeObjectAtIndex:v8];
    id v7 = (NDTSQStatement *)v14;
  }
  [(NSMutableOrderedSet *)self->_statementCache insertObject:v7 atIndex:0];
  [(NDTSQStatement *)v7 resetBindCursor];
  id v13 = v7;
  id v7 = v13;
LABEL_9:

  return v13;
}

- (void)_parseSql:(id)a3 andRun:(id)a4
{
  id v6 = a3;
  id v7 = (uint64_t (**)(id, uint64_t))a4;
  int v15 = 0;
  uint64_t v8 = [(NDTSQFile *)self _loadCache:v6 sqlErr:&v15];
  if (v15) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  if (v9)
  {
    CFStringRef v13 = @"_parseSql:(1)";
LABEL_12:
    [(NDTSQFile *)self _makeSqlErrorReasonString:v13];
    id v14 = +[NDTSQException exceptionWithName:@"NDTSQError" reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v14);
  }
  id v10 = (void *)v8;
  int v11 = v7[2](v7, v8);
  int v15 = v11;
  if ((v11 - 100) >= 2 && v11 != 0)
  {
    CFStringRef v13 = @"_parseSql:(2)";
    goto LABEL_12;
  }
  sqlite3_reset((sqlite3_stmt *)[v10 parsed]);
  sqlite3_clear_bindings((sqlite3_stmt *)[v10 parsed]);
}

- (int64_t)_instanceVersion:(id)a3
{
  return [(NDTSQKeyValueStore *)self->_instanceVersions getIntegerForKey:a3 default:1];
}

- (void)_setInstance:(id)a3 version:(int64_t)a4
{
}

- (void)begin
{
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012DAC;
  block[3] = &unk_100054DD0;
  block[4] = self;
  dispatch_sync(q, block);
}

- (void)commit
{
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012EA0;
  block[3] = &unk_100054DD0;
  block[4] = self;
  dispatch_sync(q, block);
}

- (void)rollback
{
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012F94;
  block[3] = &unk_100054DD0;
  block[4] = self;
  dispatch_sync(q, block);
}

- (int64_t)changes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  q = self->_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000130C0;
  v5[3] = &unk_100054FF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(q, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NDTSQFileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NDTSQFileDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)pathTemplate
{
  return self->_pathTemplate;
}

- (void)setPathTemplate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathTemplate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_memberSchemas, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_instanceVersions, 0);
  objc_storeStrong((id *)&self->_statementCache, 0);

  objc_storeStrong((id *)&self->_q, 0);
}

@end