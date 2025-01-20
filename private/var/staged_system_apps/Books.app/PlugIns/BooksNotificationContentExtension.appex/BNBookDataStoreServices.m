@interface BNBookDataStoreServices
+ (BOOL)_isOwned:(id)a3;
+ (id)_contentDataForContentID:(id)a3 tracker:(id)a4;
+ (void)addStoreIDToWantToRead:(id)a3 tracker:(id)a4 completion:(id)a5;
@end

@implementation BNBookDataStoreServices

+ (void)addStoreIDToWantToRead:(id)a3 tracker:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = kBKCollectionDefaultIDWantToRead;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000024F4;
  v15[3] = &unk_100008468;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v19 = a1;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  +[BDSServiceCenter addStoreID:v14 toCollectionID:v11 completion:v15];
}

+ (id)_contentDataForContentID:(id)a3 tracker:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 contentPrivateIDForContentID:v7];
  id v9 = [v6 contentUserIDForContentID:v7];

  id v10 = [objc_alloc((Class)BAContentData) initWithContentID:v7 contentType:0 contentPrivateID:v8 contentUserID:v9 contentAcquisitionType:0 contentSubType:0 contentLength:0 supplementalContentCount:0 seriesType:0 productionType:0 isUnified:0 contentKind:0];

  return v10;
}

+ (BOOL)_isOwned:(id)a3
{
  id v3 = a3;
  v4 = BSUIGetLibraryItemStateProvider();
  v5 = [v4 itemStateWithIdentifier:v3];

  BOOL v6 = [v5 library] == (id)1
    || [v5 library] == (id)3
    || [v5 library] == (id)4
    || [v5 library] == (id)5;

  return v6;
}

@end