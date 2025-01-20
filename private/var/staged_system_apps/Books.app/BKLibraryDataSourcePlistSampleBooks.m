@interface BKLibraryDataSourcePlistSampleBooks
- (BOOL)replacesSampleBooks;
- (BOOL)wantsPlistEntry:(id)a3;
- (void)fetchAssetIDsWithCompletion:(id)a3;
- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4;
@end

@implementation BKLibraryDataSourcePlistSampleBooks

- (BOOL)wantsPlistEntry:(id)a3
{
  v3 = +[IMLibraryPlist isSampleFromPlistEntry:a3];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000E6AC4;
  v5[3] = &unk_100A46800;
  v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)BKLibraryDataSourcePlistSampleBooks;
  id v3 = v7;
  [(BKLibraryDataSourcePlist *)&v4 fetchAssetIDsWithCompletion:v5];
}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  v6 = +[NSMutableArray array];
  id v7 = (char *)[v12 count];
  if (v7)
  {
    v8 = v7;
    do
    {
      v9 = +[NSNull null];
      [v6 addObject:v9];

      --v8;
    }
    while (v8);
  }
  id v10 = objc_retainBlock(v5);
  v11 = v10;
  if (v10) {
    (*((void (**)(id, void *, void))v10 + 2))(v10, v6, 0);
  }
}

- (BOOL)replacesSampleBooks
{
  return 0;
}

@end