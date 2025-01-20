@interface UGCReviewedPlaceCache
+ (id)baseFilePath:(id *)a3;
+ (id)oldFilePath:(id *)a3;
- (UGCReviewedPlaceCache)init;
- (UGCReviewedPlaceCache)initWithURL:(id)a3;
- (id)locallyCachedReviewedPlaceForMUID:(unint64_t)a3;
- (void)_commonInitWithURL:(id)a3;
- (void)addOrEditReviewedPlace:(id)a3 completion:(id)a4;
- (void)clearAllUserData;
- (void)fetchReviewedPlaceForMUID:(unint64_t)a3 completion:(id)a4;
- (void)fetchWithMUID:(unint64_t)a3 andReplaceIfNeededWithNewMUID:(unint64_t)a4 completion:(id)a5;
- (void)moveCacheIfNeeded;
- (void)removeReviewedPlaceWithMUID:(unint64_t)a3 completion:(id)a4;
@end

@implementation UGCReviewedPlaceCache

- (UGCReviewedPlaceCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)UGCReviewedPlaceCache;
  v2 = [(UGCReviewedPlaceCache *)&v5 init];
  if (v2)
  {
    v3 = [(id)objc_opt_class() baseFilePath:0];
    [(UGCReviewedPlaceCache *)v2 _commonInitWithURL:v3];
  }
  return v2;
}

- (UGCReviewedPlaceCache)initWithURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UGCReviewedPlaceCache;
  objc_super v5 = [(UGCReviewedPlaceCache *)&v8 init];
  v6 = v5;
  if (v5) {
    [(UGCReviewedPlaceCache *)v5 _commonInitWithURL:v4];
  }

  return v6;
}

- (void)_commonInitWithURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)GEOSQLiteDB);
  v6 = sub_100577844();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004D93A0;
  v9[3] = &unk_1012ECCB8;
  v9[4] = self;
  v7 = (GEOSQLiteDB *)[v5 initWithQueueName:"com.apple.maps.cachedreviewedplace.db" log:v6 databaseFileURL:v4 sqliteFlags:0x100000 pragmas:0 setupBlock:v9];

  db = self->_db;
  self->_db = v7;
}

- (void)moveCacheIfNeeded
{
  v2 = [(id)objc_opt_class() oldFilePath:0];
  v3 = +[NSFileManager defaultManager];
  id v4 = [v2 path];
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    v6 = [(id)objc_opt_class() baseFilePath:0];
    v7 = sub_100577844();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_super v8 = [v2 path];
      v9 = [v6 path];
      int v12 = 138412546;
      v13 = v8;
      __int16 v14 = 2112;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Migrate DB files from: %@ to %@", (uint8_t *)&v12, 0x16u);
    }
    v10 = [v2 path];
    v11 = [v6 path];
    +[GEOSQLiteDB migrateAllDBFilesFrom:v10 to:v11];
  }
  else
  {
    v6 = sub_100577844();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Cache files not exists, we don't need to migrate them", (uint8_t *)&v12, 2u);
    }
  }
}

+ (id)oldFilePath:(id *)a3
{
  id v4 = +[NSFileManager defaultManager];
  id v10 = 0;
  unsigned __int8 v5 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:0 error:&v10];
  id v6 = v10;

  if (!a3 || v5)
  {
    if (v5)
    {
      objc_super v8 = [v5 URLByAppendingPathComponent:@"com.apple.Maps" isDirectory:1];
      v7 = [v8 URLByAppendingPathComponent:@"ReviewedPlaceCache" isDirectory:0];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
    *a3 = v6;
  }

  return v7;
}

+ (id)baseFilePath:(id *)a3
{
  id v4 = objc_opt_class();

  return [v4 oldFilePath:a3];
}

- (void)fetchWithMUID:(unint64_t)a3 andReplaceIfNeededWithNewMUID:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1004D9A4C;
  v10[3] = &unk_1012ECD30;
  id v9 = v8;
  id v11 = v9;
  v12[1] = (id)a3;
  v12[2] = (id)a4;
  objc_copyWeak(v12, &location);
  [(UGCReviewedPlaceCache *)self fetchReviewedPlaceForMUID:a3 completion:v10];
  objc_destroyWeak(v12);

  objc_destroyWeak(&location);
}

- (void)fetchReviewedPlaceForMUID:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  db = self->_db;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004D9D84;
  v9[3] = &unk_1012EB5B8;
  id v10 = v6;
  unint64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [(GEOSQLiteDB *)db executeAsync:v9];
}

- (id)locallyCachedReviewedPlaceForMUID:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100103C5C;
  unint64_t v11 = sub_1001046B8;
  id v12 = 0;
  db = self->_db;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1004DA304;
  v6[3] = &unk_1012ECD80;
  v6[5] = &v7;
  v6[6] = a3;
  v6[4] = self;
  [(GEOSQLiteDB *)db executeSync:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)removeReviewedPlaceWithMUID:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  db = self->_db;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004DA634;
  v9[3] = &unk_1012EB5B8;
  id v10 = v6;
  unint64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [(GEOSQLiteDB *)db executeAsync:v9];
}

- (void)addOrEditReviewedPlace:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  db = self->_db;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1004DA928;
  v11[3] = &unk_1012E80F0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(GEOSQLiteDB *)db executeAsync:v11];
}

- (void)clearAllUserData
{
  db = self->_db;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1004DAC24;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  [(GEOSQLiteDB *)db executeSync:v3];
}

- (void).cxx_destruct
{
}

@end