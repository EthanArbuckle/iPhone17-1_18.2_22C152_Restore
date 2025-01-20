@interface BKLibraryDataSourceJaliscoPreorders
- (BKLibraryDataSourceJaliscoPreorders)init;
- (BOOL)canRedownloadAssets;
- (void)fetchAssetIDsWithCompletion:(id)a3;
- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation BKLibraryDataSourceJaliscoPreorders

- (BKLibraryDataSourceJaliscoPreorders)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryDataSourceJaliscoPreorders;
  return [(BKLibraryDataSourceJalisco *)&v3 initWithIdentifier:@"com.apple.ibooks.datasource.jalisco.preorders"];
}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  v5 = +[BLJaliscoDAAPClient sharedClient];

  if (v5)
  {
    +[BLJaliscoDAAPClient sharedClient];
    v6 = v23 = self;
    v7 = [v6 predicateForItems:0];

    v8 = +[NSNull null];
    v9 = +[NSPredicate predicateWithFormat:@"expectedDate != %@", v8];

    id v10 = objc_alloc((Class)NSCompoundPredicate);
    v31[0] = v7;
    v31[1] = v9;
    v11 = +[NSArray arrayWithObjects:v31 count:2];
    id v12 = [v10 initWithType:1 subpredicates:v11];

    v13 = +[BLJaliscoDAAPClient sharedClient];
    v14 = [v13 predicateForBookletItems:0];

    v15 = +[NSNull null];
    v16 = +[NSPredicate predicateWithFormat:@"parentItem.expectedDate != %@", v15];

    id v17 = objc_alloc((Class)NSCompoundPredicate);
    v30[0] = v14;
    v30[1] = v16;
    v18 = +[NSArray arrayWithObjects:v30 count:2];
    id v19 = [v17 initWithType:1 subpredicates:v18];

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10020F6A4;
    v25[3] = &unk_100A46800;
    id v26 = v12;
    id v27 = v4;
    v24.receiver = v23;
    v24.super_class = (Class)BKLibraryDataSourceJaliscoPreorders;
    id v20 = v12;
    [(BKLibraryDataSourceJalisco *)&v24 fetchAssetIDsWithPredicate:v20 bookletPredicate:v19 completion:v25];
  }
  else
  {
    kdebug_trace();
    v7 = +[NSError bu_errorWithDomain:BLJaliscoDAAPClientErrorDomain code:3 description:@"Preorder assets failed - jalisco client is nil" underlyingError:0];
    v21 = BKLibraryDataSourceJaliscoLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "BKLibraryDataSourceJaliscoPreorders fetchAssets NO CLIENT error%@", buf, 0xCu);
    }

    id v22 = objc_retainBlock(v4);
    v9 = v22;
    if (v22) {
      (*((void (**)(id, void *, void *))v22 + 2))(v22, &__NSArray0__struct, v7);
    }
  }
}

- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, void, void, void))v5 + 2))(v5, 0, 0, 0);
    id v5 = v6;
  }
}

- (BOOL)canRedownloadAssets
{
  return 0;
}

@end