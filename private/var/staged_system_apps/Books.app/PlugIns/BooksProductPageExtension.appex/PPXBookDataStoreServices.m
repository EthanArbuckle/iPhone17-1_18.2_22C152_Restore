@interface PPXBookDataStoreServices
+ (BOOL)_isOwned:(id)a3;
+ (id)_contentDataForContentID:(id)a3 tracker:(id)a4;
+ (void)_analyticsSubmitRemoveFromWantListEventWithTracker:(id)a3 contentID:(id)a4;
+ (void)addStoreIDToWantToRead:(id)a3 tracker:(id)a4;
+ (void)fetchIsAssetID:(id)a3 inFinishedCollectionWithCompletion:(id)a4;
+ (void)fetchIsAssetID:(id)a3 inWantToReadCollectionWithCompletion:(id)a4;
+ (void)removeAssetFromWantToRead:(id)a3 tracker:(id)a4;
+ (void)removeAssetID:(id)a3 fromCollectionID:(id)a4 completion:(id)a5;
+ (void)setFinishedState:(BOOL)a3 storeID:(id)a4 tracker:(id)a5;
@end

@implementation PPXBookDataStoreServices

+ (void)removeAssetID:(id)a3 fromCollectionID:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v10 = +[BCCollectionMember collectionMemberIDWithCollectionID:a4 assetID:a3];
  v8 = +[BCCloudCollectionsManager sharedManager];
  v9 = [v8 collectionMemberManager];

  [v9 deleteCollectionMemberForCollectionMemberID:v10 completion:v7];
}

+ (void)removeAssetFromWantToRead:(id)a3 tracker:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = kBKCollectionDefaultIDWantToRead;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004A20;
  v10[3] = &unk_100031558;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  +[PPXBookDataStoreServices removeAssetID:v8 fromCollectionID:v7 completion:v10];
}

+ (void)addStoreIDToWantToRead:(id)a3 tracker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = kBKCollectionDefaultIDWantToRead;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100004C28;
  v11[3] = &unk_1000315A8;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  +[BDSServiceCenter addStoreID:v10 toCollectionID:v8 completion:v11];
}

+ (void)fetchIsAssetID:(id)a3 inWantToReadCollectionWithCompletion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = kBKCollectionDefaultIDWantToRead;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004E3C;
  v8[3] = &unk_1000315D0;
  id v9 = v5;
  id v7 = v5;
  +[BDSServiceCenter fetchIsAssetID:a3 inCollectionID:v6 completion:v8];
}

+ (void)setFinishedState:(BOOL)a3 storeID:(id)a4 tracker:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v18 = v8;
  id v10 = +[NSArray arrayWithObjects:&v18 count:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004FCC;
  v13[3] = &unk_1000315F8;
  BOOL v17 = v6;
  id v15 = v9;
  id v16 = a1;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  +[BDSServiceCenter setFinishedState:v6 assetIDs:v10 completion:v13];
}

+ (void)fetchIsAssetID:(id)a3 inFinishedCollectionWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[BCCloudAssetManager sharedManager];
  id v8 = [v7 assetDetailManager];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000051DC;
  v10[3] = &unk_100031620;
  id v11 = v5;
  id v9 = v5;
  [v8 assetDetailForAssetID:v6 completion:v10];
}

+ (void)_analyticsSubmitRemoveFromWantListEventWithTracker:(id)a3 contentID:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (v7 && [v5 length])
  {
    id v6 = +[BAEventReporter sharedReporter];
    [v6 emitRemoveFromWantListEventWithTracker:v7 contentID:v5 contentType:0];
  }
}

+ (id)_contentDataForContentID:(id)a3 tracker:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)BAContentData);
  id v9 = [v6 contentPrivateIDForContentID:v7];
  id v10 = [v6 contentUserIDForContentID:v7];

  uint64_t v11 = [a1 _isOwned:v7];
  id v12 = +[BAEventReporter sharedReporter];
  id v13 = [v8 initWithContentID:v7 contentType:0 contentPrivateID:v9 contentUserID:v10 contentAcquisitionType:0 contentSubType:0 contentLength:0 supplementalContentCount:0 seriesType:[v12 seriesTypeForContentID:v7] productionType:0 isUnified:0 contentKind:0];

  return v13;
}

+ (BOOL)_isOwned:(id)a3
{
  id v3 = a3;
  v4 = BSUIGetLibraryItemStateProvider();
  id v5 = [v4 itemStateWithIdentifier:v3];

  BOOL v6 = [v5 library] == (id)1
    || [v5 library] == (id)3
    || [v5 library] == (id)4
    || [v5 library] == (id)5;

  return v6;
}

@end