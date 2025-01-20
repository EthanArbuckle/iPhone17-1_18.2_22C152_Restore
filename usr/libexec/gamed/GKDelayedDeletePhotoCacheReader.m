@interface GKDelayedDeletePhotoCacheReader
+ (id)readerWithDatabaseConnection:(id)a3;
- (GKDatabaseConnection)connection;
- (GKDatabaseConnection)databaseConnection;
- (GKDelayedDeletePhotoCacheReader)initWithDatabaseConnection:(id)a3;
- (id)deletePhotoDescriptorForExecutedStatement:(sqlite3_stmt *)a3;
- (id)deletePhotoDescriptorStatement;
- (void)bindParametersForStatement:(sqlite3_stmt *)a3 playerID:(id)a4;
- (void)readResources:(id)a3 handler:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation GKDelayedDeletePhotoCacheReader

+ (id)readerWithDatabaseConnection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDatabaseConnection:v4];

  return v5;
}

- (GKDelayedDeletePhotoCacheReader)initWithDatabaseConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKDelayedDeletePhotoCacheReader;
  id v5 = [(GKDelayedDeletePhotoCacheReader *)&v8 init];
  v6 = v5;
  if (v5) {
    [(GKDelayedDeletePhotoCacheReader *)v5 setConnection:v4];
  }

  return v6;
}

- (GKDatabaseConnection)databaseConnection
{
  return self->_connection;
}

- (id)deletePhotoDescriptorStatement
{
  v2 = sub_1000CDE5C(off_1002D9378);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"    SELECT %@     FROM requests     INNER JOIN delete_photos USING (request_id)     WHERE player_gcid = %s     ORDER BY time_stamp DESC;",
    v2,
  v3 = ":player_gcid");

  return v3;
}

- (void)bindParametersForStatement:(sqlite3_stmt *)a3 playerID:(id)a4
{
}

- (id)deletePhotoDescriptorForExecutedStatement:(sqlite3_stmt *)a3
{
  id v3 = +[NSDate _gkDateFromScalarServerTimestamp:sqlite3_column_int64(a3, 1)];
  v7[0] = @"delete-approved";
  v7[1] = @"delete-pending";
  v8[0] = &__kCFBooleanTrue;
  v8[1] = &__kCFBooleanTrue;
  v7[2] = @"timestamp";
  id v4 = [v3 _gkServerTimestamp];
  v8[2] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (void)readResources:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 count] >= 2)
  {
    v16 = +[NSString stringWithFormat:@"%@ is being asked to read photos for multiple players. This is not currently supported.", objc_opt_class()];
    id v17 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v16 userInfo:0];

    objc_exception_throw(v17);
  }
  objc_super v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKDelayedDeletePhotoCacheReader.mm", 84, "-[GKDelayedDeletePhotoCacheReader readResources:handler:]");
  v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  v10 = +[NSMutableSet set];
  [v9 setResult:v10];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000CE330;
  v21[3] = &unk_1002D9330;
  v21[4] = self;
  id v11 = v6;
  id v22 = v11;
  id v12 = v9;
  id v23 = v12;
  [v12 perform:v21];
  v13 = dispatch_get_global_queue(0, 0);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000CE69C;
  v18[3] = &unk_1002D9358;
  id v14 = v7;
  id v20 = v14;
  id v15 = v12;
  id v19 = v15;
  [v15 notifyOnQueue:v13 block:v18];
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