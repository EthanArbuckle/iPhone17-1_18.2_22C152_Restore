@interface GKDelayedSetPhotoCacheWriter
+ (id)writerWithDatabaseConnection:(id)a3;
- (GKDatabaseConnection)connection;
- (GKDatabaseConnection)databaseConnection;
- (GKDelayedSetPhotoCacheWriter)initWithDatabaseConnection:(id)a3;
- (id)deleteOldPhotosSQL;
- (id)getOldPhotosSQL;
- (id)photosInsertSQL;
- (id)requestsInsertSQL;
- (void)bindParametersForDeleteOldPhotosStatement:(sqlite3_stmt *)a3 requestsRowID:(int64_t)a4;
- (void)bindParametersForGetOldPhotosStatement:(sqlite3_stmt *)a3 playerID:(id)a4;
- (void)bindParametersForPhotoStatement:(sqlite3_stmt *)a3 photo:(id)a4 avatarType:(id)a5 requestsRowID:(int64_t)a6;
- (void)bindParametersForRequestsStatement:(sqlite3_stmt *)a3 playerID:(id)a4;
- (void)setConnection:(id)a3;
- (void)writeResources:(id)a3 handler:(id)a4;
- (void)writeToDatabase:(sqlite3 *)a3 statementStore:(id)a4 withInsertSQL:(id)a5 updateSQL:(id)a6 bindOperation:(id)a7;
@end

@implementation GKDelayedSetPhotoCacheWriter

+ (id)writerWithDatabaseConnection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDatabaseConnection:v4];

  return v5;
}

- (GKDelayedSetPhotoCacheWriter)initWithDatabaseConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKDelayedSetPhotoCacheWriter;
  id v5 = [(GKDelayedSetPhotoCacheWriter *)&v8 init];
  v6 = v5;
  if (v5) {
    [(GKDelayedSetPhotoCacheWriter *)v5 setConnection:v4];
  }

  return v6;
}

- (GKDatabaseConnection)databaseConnection
{
  return self->_connection;
}

- (id)requestsInsertSQL
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"INSERT INTO requests(           player_gcid,             time_stamp)             VALUES (%s, %s);",
           ":player_gcid",
           ":time_stamp");
}

- (void)bindParametersForRequestsStatement:(sqlite3_stmt *)a3 playerID:(id)a4
{
  v6 = (NSString *)a4;
  GKBindParam(a3, ":player_gcid", v6);
  id v5 = +[NSDate date];
  GKBindParam(a3, ":time_stamp", v5);
}

- (id)photosInsertSQL
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"INSERT INTO photos(           request_id,             photo_data,             avatar_type)             VALUES (%s, %s, %s);",
           ":request_id",
           ":photo_data",
           ":avatar_type");
}

- (void)bindParametersForPhotoStatement:(sqlite3_stmt *)a3 photo:(id)a4 avatarType:(id)a5 requestsRowID:(int64_t)a6
{
  v10 = (NSData *)a4;
  v9 = (NSNumber *)a5;
  GKBindParam(a3, ":request_id", a6);
  GKBindParam(a3, ":photo_data", v10);
  GKBindParam(a3, ":avatar_type", v9);
}

- (id)deleteOldPhotosSQL
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"DELETE FROM requests WHERE request_id = %s;",
           ":request_id");
}

- (void)bindParametersForDeleteOldPhotosStatement:(sqlite3_stmt *)a3 requestsRowID:(int64_t)a4
{
}

- (id)getOldPhotosSQL
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"            SELECT request_id             FROM requests             INNER JOIN photos USING (request_id)             WHERE player_gcid = %s;",
           ":player_gcid");
}

- (void)bindParametersForGetOldPhotosStatement:(sqlite3_stmt *)a3 playerID:(id)a4
{
}

- (void)writeToDatabase:(sqlite3 *)a3 statementStore:(id)a4 withInsertSQL:(id)a5 updateSQL:(id)a6 bindOperation:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000D09F0;
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
  if ((unint64_t)[v6 count] >= 2)
  {
    id v11 = +[NSString stringWithFormat:@"%@ is being asked to write photos for multiple players. This is not currently supported.", objc_opt_class()];
    id v12 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v11 userInfo:0];

    objc_exception_throw(v12);
  }
  connection = self->_connection;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000D0C48;
  v15[3] = &unk_1002D9290;
  id v9 = v6;
  id v16 = v9;
  v17 = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000D12FC;
  v13[3] = &unk_1002D92B8;
  id v10 = v7;
  id v14 = v10;
  [(GKDatabaseConnection *)connection performAsyncTransaction:v15 handler:v13];
}

- (GKDatabaseConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end