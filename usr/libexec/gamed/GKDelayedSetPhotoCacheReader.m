@interface GKDelayedSetPhotoCacheReader
+ (id)readerWithDatabaseConnection:(id)a3;
- (GKDatabaseConnection)connection;
- (GKDatabaseConnection)databaseConnection;
- (GKDelayedSetPhotoCacheReader)initWithDatabaseConnection:(id)a3;
- (id)setPhotoDescriptorForExecutedStatement:(sqlite3_stmt *)a3;
- (id)setPhotoDescriptorStatement;
- (void)bindParametersForStatement:(sqlite3_stmt *)a3 playerID:(id)a4;
- (void)readResources:(id)a3 handler:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation GKDelayedSetPhotoCacheReader

+ (id)readerWithDatabaseConnection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDatabaseConnection:v4];

  return v5;
}

- (GKDelayedSetPhotoCacheReader)initWithDatabaseConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKDelayedSetPhotoCacheReader;
  id v5 = [(GKDelayedSetPhotoCacheReader *)&v8 init];
  v6 = v5;
  if (v5) {
    [(GKDelayedSetPhotoCacheReader *)v5 setConnection:v4];
  }

  return v6;
}

- (GKDatabaseConnection)databaseConnection
{
  return self->_connection;
}

- (id)setPhotoDescriptorStatement
{
  v2 = sub_1000CCF08((uint64_t)off_1002D93D8);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"    SELECT %@     FROM requests     INNER JOIN photos USING (request_id)     WHERE player_gcid = %s     ORDER BY time_stamp DESC;",
    v2,
  v3 = ":player_gcid");

  return v3;
}

- (void)bindParametersForStatement:(sqlite3_stmt *)a3 playerID:(id)a4
{
}

- (id)setPhotoDescriptorForExecutedStatement:(sqlite3_stmt *)a3
{
  v10 = a3;
  id v4 = sub_1000CF878(&v10);
  id v5 = +[NSDate _gkDateFromScalarServerTimestamp:sqlite3_column_int64(a3, 1)];
  v6 = +[NSNumber numberWithDouble:sqlite3_column_double(a3, 3)];
  v12[0] = @"image/png";
  v11[0] = @"content-type";
  v11[1] = @"timestamp";
  v7 = [v5 _gkServerTimestamp];
  v12[1] = v7;
  v12[2] = v4;
  v11[2] = @"image-data";
  v11[3] = @"avatar-type";
  v12[3] = v6;
  objc_super v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v8;
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
  objc_super v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKDelayedSetPhotoCacheReader.mm", 91, "-[GKDelayedSetPhotoCacheReader readResources:handler:]");
  v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  v10 = +[NSMutableSet set];
  [v9 setResult:v10];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000CFBB4;
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
  v18[2] = sub_1000CFF20;
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