@interface BKLibraryDataSourcePlistUntetheredBooks
- (BKLibraryDataSourcePlistUntetheredBooks)initWithPlistKind:(int64_t)a3 identifier:(id)a4 assetMetadataProvider:(id)a5 coverImageHelper:(id)a6 assetMetadataCache:(id)a7;
- (BOOL)isEligibleLocalBookToBeMadeUbiquitous:(id)a3;
- (BOOL)wantsPlistEntry:(id)a3;
- (OS_dispatch_queue)moveUbiquitousBooksToLocalSerialQueue;
- (void)fetchAllLocalBooksEligibleToBeMadeUbiquitousWithCompletion:(id)a3;
- (void)fetchLocalAssetWithID:(id)a3 completion:(id)a4;
- (void)makeBooksLocal:(id)a3 completion:(id)a4;
- (void)q_updateUniqueIDIfNeededInMutableEntry:(id)a3 withOriginalBookEntry:(id)a4;
- (void)setMoveUbiquitousBooksToLocalSerialQueue:(id)a3;
@end

@implementation BKLibraryDataSourcePlistUntetheredBooks

- (BKLibraryDataSourcePlistUntetheredBooks)initWithPlistKind:(int64_t)a3 identifier:(id)a4 assetMetadataProvider:(id)a5 coverImageHelper:(id)a6 assetMetadataCache:(id)a7
{
  v11.receiver = self;
  v11.super_class = (Class)BKLibraryDataSourcePlistUntetheredBooks;
  v7 = [(BKLibraryDataSourcePlist *)&v11 initWithPlistKind:a3 identifier:a4 assetMetadataProvider:a5 coverImageHelper:a6 assetMetadataCache:a7];
  if (v7)
  {
    dispatch_queue_t v8 = dispatch_queue_create("BKLibraryDataSourcePlist.moveUbiquitousBooksToLocalSerialQueue", 0);
    moveUbiquitousBooksToLocalSerialQueue = v7->_moveUbiquitousBooksToLocalSerialQueue;
    v7->_moveUbiquitousBooksToLocalSerialQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (BOOL)isEligibleLocalBookToBeMadeUbiquitous:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = BUDynamicCast();

  if (v5
    && ([(BKLibraryDataSourcePlist *)self identifier],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v5 dataSourceIdentifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v6 isEqualToString:v7],
        v7,
        v6,
        v8))
  {
    if ([v5 isSupplementalContent]) {
      unsigned int v9 = [v5 contentType] == 3;
    }
    else {
      unsigned int v9 = 0;
    }
    v10 = [v5 storeID];
    if (!v10 || v9)
    {
      objc_super v11 = [v5 permlink];
      if (v11) {
        LOBYTE(v9) = 0;
      }
      else {
        unsigned int v9 = [v5 isRestoring] ^ 1;
      }
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)fetchAllLocalBooksEligibleToBeMadeUbiquitousWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10015CA10;
  v4[3] = &unk_100A46800;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(BKLibraryDataSourcePlist *)v5 fetchAssetIDsWithCompletion:v4];
}

- (void)fetchLocalAssetWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = v7;
  if (v6)
  {
    id v14 = v6;
    unsigned int v9 = +[NSArray arrayWithObjects:&v14 count:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10015CE08;
    v12[3] = &unk_100A46C98;
    id v13 = v8;
    [(BKLibraryDataSourcePlist *)self fetchAssetsWithIDs:v9 completion:v12];
  }
  else
  {
    v10 = (void (**)(id, void, void *))objc_retainBlock(v7);
    if (v10)
    {
      objc_super v11 = +[NSError errorWithDomain:kBKLibraryDataSourceDomain code:kBKLibraryDataSourceErrorInvalidAssetError userInfo:0];
      v10[2](v10, 0, v11);
    }
  }
}

- (void)makeBooksLocal:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    unsigned int v8 = objc_opt_new();
    unsigned int v9 = [(BKLibraryDataSourcePlistUntetheredBooks *)self moveUbiquitousBooksToLocalSerialQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10015D004;
    v12[3] = &unk_100A45980;
    id v13 = v6;
    id v14 = self;
    id v15 = v8;
    id v16 = v7;
    id v10 = v8;
    dispatch_async(v9, v12);
  }
  else
  {
    id v11 = objc_retainBlock(v7);
    id v10 = v11;
    if (v11) {
      (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
    }
  }
}

- (BOOL)wantsPlistEntry:(id)a3
{
  id v3 = +[IMLibraryPlist isSampleFromPlistEntry:a3];
  char v4 = [v3 BOOLValue] ^ 1;

  return v4;
}

- (void)q_updateUniqueIDIfNeededInMutableEntry:(id)a3 withOriginalBookEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(BKLibraryDataSourcePlist *)self _isSupplementalPDFFromPlistEntry:v7]
    || (+[IMLibraryPlist storeIdFromPlistEntry:v7],
        (unsigned int v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    unsigned int v8 = +[IMLibraryPlist uniqueIdFromPlistEntry:v7];
  }
  unsigned int v9 = +[IMLibraryPlist permlinkFromPlistEntry:v7];
  id v10 = [v7 valueForKey:@"Inserted-By-iBooks"];
  unsigned __int8 v11 = [v10 BOOLValue];

  if (!v8)
  {
    if (v9) {
      char v12 = 1;
    }
    else {
      char v12 = v11;
    }
    if (v12)
    {
      unsigned int v8 = 0;
      goto LABEL_19;
    }
    id v13 = [v6 objectForKey:@"BKLibraryDataSourcePlist-FullPath"];
    if (v13)
    {
      id v14 = [(BKLibraryDataSourcePlist *)self fullPathToAssetID];
      unsigned int v8 = [v14 objectForKey:v13];

      if (v8)
      {
LABEL_17:
        v17 = +[IMLibraryPlist keyNameForUniqueId];
        [v6 setValue:v8 forKey:v17];

        goto LABEL_18;
      }
      id v18 = 0;
      unsigned int v8 = +[BLLibraryUtility identifierFromBookPath:v13 error:&v18];
      id v15 = v18;
      if (v8 && !v15)
      {
        id v16 = [(BKLibraryDataSourcePlist *)self fullPathToAssetID];
        [v16 setObject:v8 forKey:v13];

        goto LABEL_17;
      }

      if (v8) {
        goto LABEL_17;
      }
    }
    else
    {
      unsigned int v8 = 0;
    }
LABEL_18:
  }
LABEL_19:
}

- (OS_dispatch_queue)moveUbiquitousBooksToLocalSerialQueue
{
  return self->_moveUbiquitousBooksToLocalSerialQueue;
}

- (void)setMoveUbiquitousBooksToLocalSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end