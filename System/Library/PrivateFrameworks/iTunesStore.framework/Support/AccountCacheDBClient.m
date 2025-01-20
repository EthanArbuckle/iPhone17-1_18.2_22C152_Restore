@interface AccountCacheDBClient
- (AccountCacheDBClient)init;
- (id)_databasePath;
- (id)dSIDForAppleID:(id)a3;
@end

@implementation AccountCacheDBClient

- (AccountCacheDBClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)AccountCacheDBClient;
  v2 = [(AccountCacheDBClient *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(AccountCacheDBClient *)v2 _databasePath];
    v5 = (SSSQLiteDatabase *)[objc_alloc((Class)SSSQLiteDatabase) initWithDatabaseURL:v4 readOnly:1 protectionType:NSFileProtectionCompleteUntilFirstUserAuthentication];
    database = v3->_database;
    v3->_database = v5;
  }
  return v3;
}

- (id)dSIDForAppleID:(id)a3
{
  v4 = +[NSString stringWithFormat:@"SELECT dsid FROM account WHERE apple_id = '%@'", a3];
  v5 = objc_opt_new();
  database = self->_database;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002CBC4;
  v10[3] = &unk_1003A38B8;
  v10[4] = self;
  id v7 = v5;
  id v11 = v7;
  [(SSSQLiteDatabase *)database prepareStatementForSQL:v4 cache:0 usingBlock:v10];
  if ([v7 count])
  {
    objc_super v8 = [v7 firstObject];
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (id)_databasePath
{
  id v2 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CPSharedResourcesDirectory(), @"Library", @"MusicLibrary", @"AccountCache.sqlitedb", 0);
  v3 = +[NSString pathWithComponents:v2];
  v4 = +[NSURL fileURLWithPath:v3 isDirectory:0];

  return v4;
}

- (void).cxx_destruct
{
}

@end