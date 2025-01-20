@interface NPDSyncServiceLibraryDataSource
+ (id)nonPaymentPassesFilter;
+ (id)paymentPassesFilter;
- (NPDSyncServiceLibraryDataSource)init;
- (NPDSyncServiceLibraryDataSource)initWithPassLibrary:(id)a3;
- (NPDSyncServiceLibraryDataSource)initWithPassLibrary:(id)a3 passesFilter:(id)a4;
- (PKCatalog)passesCatalog;
- (id)passLibrarySyncStateForDevice:(id)a3;
- (id)passWithUniqueID:(id)a3;
- (void)addPasses:(id)a3 withCompletionHandler:(id)a4;
- (void)removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4;
@end

@implementation NPDSyncServiceLibraryDataSource

- (NPDSyncServiceLibraryDataSource)init
{
  v3 = +[PKPassLibrary sharedInstance];
  v4 = [(NPDSyncServiceLibraryDataSource *)self initWithPassLibrary:v3];

  return v4;
}

- (NPDSyncServiceLibraryDataSource)initWithPassLibrary:(id)a3
{
  return [(NPDSyncServiceLibraryDataSource *)self initWithPassLibrary:a3 passesFilter:&stru_10006E7B8];
}

- (NPDSyncServiceLibraryDataSource)initWithPassLibrary:(id)a3 passesFilter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NPDSyncServiceLibraryDataSource;
  v9 = [(NPDSyncServiceLibraryDataSource *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_passLibrary, a3);
    id v11 = objc_retainBlock(v8);
    id passFilter = v10->_passFilter;
    v10->_id passFilter = v11;
  }
  return v10;
}

+ (id)nonPaymentPassesFilter
{
  return &stru_10006E7D8;
}

+ (id)paymentPassesFilter
{
  return &stru_10006E7F8;
}

- (id)passLibrarySyncStateForDevice:(id)a3
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003D018;
  v13[3] = &unk_10006E820;
  v13[4] = self;
  id v4 = a3;
  v5 = objc_retainBlock(v13);
  v6 = [(PKPassLibrary *)self->_passLibrary passes];
  id v7 = +[NSPredicate predicateWithBlock:v5];
  id v8 = [v6 filteredArrayUsingPredicate:v7];

  id v9 = objc_alloc((Class)NPKPassLibrarySyncState);
  v10 = +[NSSet setWithArray:v8];
  id v11 = [v9 initWithPasses:v10 device:v4];

  return v11;
}

- (PKCatalog)passesCatalog
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10003D13C;
  v10 = sub_10003D14C;
  id v11 = 0;
  passLibrary = self->_passLibrary;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003D154;
  v5[3] = &unk_10006E848;
  v5[4] = self;
  v5[5] = &v6;
  [(PKPassLibrary *)passLibrary getPassesAndCatalog:0 synchronously:1 withHandler:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PKCatalog *)v3;
}

- (id)passWithUniqueID:(id)a3
{
  id v4 = [(PKPassLibrary *)self->_passLibrary passWithUniqueID:a3];
  if ((*((unsigned int (**)(void))self->_passFilter + 2))()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)addPasses:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003D3B4;
  v8[3] = &unk_10006E870;
  v8[4] = self;
  v8[5] = &v9;
  [v6 enumerateObjectsUsingBlock:v8];
  if (!*((unsigned char *)v10 + 24)) {
    v7[2](v7, 2);
  }
  [(PKPassLibrary *)self->_passLibrary addPasses:v6 withCompletionHandler:v7];
  _Block_object_dispose(&v9, 8);
}

- (void)removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_passFilter, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
}

@end