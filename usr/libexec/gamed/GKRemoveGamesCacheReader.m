@interface GKRemoveGamesCacheReader
+ (id)readerWithDatabaseConnection:(id)a3 bundleID:(id)a4;
- (GKDatabaseConnection)connection;
- (GKDatabaseConnection)databaseConnection;
- (GKRemoveGamesCacheReader)initWithDatabaseConnection:(id)a3 bundleID:(id)a4;
- (NSString)bundleID;
- (id)getAllRemoveGamesRequestIDsStatement;
- (id)getRemoveGamesDescriptorsStatement;
- (id)removeGamesForExecutedStatement:(sqlite3_stmt *)a3;
- (void)bindParametersForStatement:(sqlite3_stmt *)a3 playerID:(id)a4 bundleID:(id)a5;
- (void)readResources:(id)a3 handler:(id)a4;
- (void)setBundleID:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation GKRemoveGamesCacheReader

+ (id)readerWithDatabaseConnection:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[GKRemoveGamesCacheReader alloc] initWithDatabaseConnection:v5 bundleID:v6];

  return v7;
}

- (GKRemoveGamesCacheReader)initWithDatabaseConnection:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKRemoveGamesCacheReader;
  v8 = [(GKRemoveGamesCacheReader *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(GKRemoveGamesCacheReader *)v8 setConnection:v6];
    [(GKRemoveGamesCacheReader *)v9 setBundleID:v7];
  }

  return v9;
}

- (GKDatabaseConnection)databaseConnection
{
  return self->_connection;
}

- (id)getRemoveGamesDescriptorsStatement
{
  v2 = sub_1000CCF08((uint64_t)off_1002D92D8);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT %@     FROM requests     INNER JOIN remove_games USING (request_id)     WHERE player_gcid = %s;",
    v2,
  v3 = ":player_gcid");

  return v3;
}

- (id)getAllRemoveGamesRequestIDsStatement
{
  v2 = sub_1000CD07C(&off_1002D92F8);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT %@     FROM requests INNER JOIN remove_games USING (request_id)     WHERE player_gcid = %s;",
    v2,
  v3 = ":player_gcid");

  return v3;
}

- (void)bindParametersForStatement:(sqlite3_stmt *)a3 playerID:(id)a4 bundleID:(id)a5
{
  v8 = (NSString *)a4;
  id v7 = (NSString *)a5;
  GKBindParam(a3, ":player_gcid", v8);
  GKBindParam(a3, ":bundle_id", v7);
}

- (id)removeGamesForExecutedStatement:(sqlite3_stmt *)a3
{
  v10 = a3;
  id v4 = sub_1000CD2C0(&v10);
  sqlite3_int64 v5 = sqlite3_column_int64(a3, 1);
  id v6 = +[NSDictionary dictionaryWithObjectsAndKeys:v4, @"bundle-id", 0];
  id v7 = +[NSNumber numberWithLongLong:v5];
  v8 = +[NSDictionary dictionaryWithObjectsAndKeys:v6, @"game", v7, @"timestamp", 0];

  return v8;
}

- (void)readResources:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKRemoveGamesCacheReader.mm", 101, "-[GKRemoveGamesCacheReader readResources:handler:]");
  v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  v10 = +[NSMutableSet set];
  [v9 setResult:v10];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000CD558;
  v19[3] = &unk_1002D9330;
  v19[4] = self;
  id v11 = v6;
  id v20 = v11;
  id v12 = v9;
  id v21 = v12;
  [v12 perform:v19];
  v13 = dispatch_get_global_queue(0, 0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000CDBD4;
  v16[3] = &unk_1002D9358;
  id v14 = v7;
  id v18 = v14;
  id v15 = v12;
  id v17 = v15;
  [v15 notifyOnQueue:v13 block:v16];
}

- (GKDatabaseConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end