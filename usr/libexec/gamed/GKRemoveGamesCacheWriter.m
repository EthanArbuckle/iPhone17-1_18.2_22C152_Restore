@interface GKRemoveGamesCacheWriter
+ (id)writerWithDatabaseConnection:(id)a3 gameDescriptor:(id)a4;
- (GKDatabaseConnection)connection;
- (GKDatabaseConnection)databaseConnection;
- (GKRemoveGamesCacheWriter)initWithDatabaseConnection:(id)a3 gameDescriptor:(id)a4;
- (NSDictionary)gameDescriptor;
- (id)removeGamesInsertSQL;
- (id)requestsInsertSQL;
- (void)bindParametersForRemoveGamesStatement:(sqlite3_stmt *)a3 forRemovedBundleID:(id)a4 requestsRowID:(int64_t)a5;
- (void)bindParametersForRequestsStatement:(sqlite3_stmt *)a3 playerID:(id)a4 digest:(id)a5;
- (void)setConnection:(id)a3;
- (void)setGameDescriptor:(id)a3;
- (void)writeResources:(id)a3 handler:(id)a4;
- (void)writeToDatabase:(sqlite3 *)a3 statementStore:(id)a4 withInsertSQL:(id)a5 updateSQL:(id)a6 bindOperation:(id)a7;
@end

@implementation GKRemoveGamesCacheWriter

+ (id)writerWithDatabaseConnection:(id)a3 gameDescriptor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseConnection:v5 gameDescriptor:v6];

  return v7;
}

- (GKRemoveGamesCacheWriter)initWithDatabaseConnection:(id)a3 gameDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKRemoveGamesCacheWriter;
  v8 = [(GKRemoveGamesCacheWriter *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(GKRemoveGamesCacheWriter *)v8 setConnection:v6];
    [(GKRemoveGamesCacheWriter *)v9 setGameDescriptor:v7];
  }

  return v9;
}

- (GKDatabaseConnection)databaseConnection
{
  return self->_connection;
}

- (id)requestsInsertSQL
{
  return +[NSString stringWithFormat:@"                           INSERT INTO requests(                          adam_id,                            bundle_id,                            bundle_version,                            external_version,                            player_gcid,                            time_stamp)                            VALUES (%s, %s, %s, %s, %s, %s)", ":adam_id", ":bundle_id", ":bundle_version", ":external_version", ":player_gcid", ":time_stamp"];
}

- (void)bindParametersForRequestsStatement:(sqlite3_stmt *)a3 playerID:(id)a4 digest:(id)a5
{
  objc_super v11 = (NSString *)a4;
  GKBindParam(a3, ":player_gcid", v11);
  id v7 = [(NSDictionary *)self->_gameDescriptor objectForKeyedSubscript:@"adam-id"];
  GKBindParam(a3, ":adam_id", v7);

  v8 = [(NSDictionary *)self->_gameDescriptor objectForKeyedSubscript:@"bundle-id"];
  GKBindParam(a3, ":bundle_id", v8);

  v9 = [(NSDictionary *)self->_gameDescriptor objectForKeyedSubscript:@"bundle-version"];
  GKBindParam(a3, ":bundle_version", v9);

  v10 = [(NSDictionary *)self->_gameDescriptor objectForKeyedSubscript:@"external-version"];
  GKBindParam(a3, ":external_version", v10);
}

- (id)removeGamesInsertSQL
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"                           INSERT INTO remove_games(                          request_id,                            removed_bundle_id)                            VALUES (%s,%s);",
           ":request_id",
           ":removed_bundle_id");
}

- (void)bindParametersForRemoveGamesStatement:(sqlite3_stmt *)a3 forRemovedBundleID:(id)a4 requestsRowID:(int64_t)a5
{
  id v7 = (NSString *)a4;
  GKBindParam(a3, ":request_id", a5);
  GKBindParam(a3, ":removed_bundle_id", v7);
}

- (void)writeToDatabase:(sqlite3 *)a3 statementStore:(id)a4 withInsertSQL:(id)a5 updateSQL:(id)a6 bindOperation:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000CC664;
  v25[3] = &unk_1002D9218;
  id v15 = v11;
  id v26 = v15;
  id v16 = v14;
  id v27 = v16;
  v17 = objc_retainBlock(v25);
  id v18 = v12;
  int v19 = ((uint64_t (*)(void *, id))v17[2])(v17, v18);
  id v20 = v18;
  if (v13 && v19 == 101)
  {
    id v20 = v13;

    int v19 = ((uint64_t (*)(void *, id))v17[2])(v17, v20);
  }
  if (v19 != 101)
  {
    uint64_t v22 = +[NSString stringWithUTF8String:sqlite3_errmsg(a3)];
    CFStringRef v30 = @"SQL";
    id v31 = v20;
    +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v23 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v22 userInfo:objc_claimAutoreleasedReturnValue()];
    objc_exception_throw(v23);
  }
  int v21 = sqlite3_changes(a3);
  if (v13 && !v21)
  {
    CFStringRef v28 = @"SQL";
    id v29 = v20;
    +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v24 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"UPDATE statement didn't affect any rows, meaning record unsuccessfully inserted" userInfo:objc_claimAutoreleasedReturnValue()];
    objc_exception_throw(v24);
  }
}

- (void)writeResources:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connection = self->_connection;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000CC818;
  v13[3] = &unk_1002D9290;
  id v14 = v6;
  id v15 = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000CCC8C;
  v11[3] = &unk_1002D92B8;
  id v12 = v7;
  id v9 = v7;
  id v10 = v6;
  [(GKDatabaseConnection *)connection performAsyncTransaction:v13 handler:v11];
}

- (GKDatabaseConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSDictionary)gameDescriptor
{
  return self->_gameDescriptor;
}

- (void)setGameDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gameDescriptor, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end