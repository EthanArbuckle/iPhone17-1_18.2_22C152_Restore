@interface BKBookPurchaseAction
+ (void)_executePurchaseOfBookWithParameters:(id)a3 storeID:(id)a4 isAudiobook:(BOOL)a5 suppressNetworkEvaluatorDialogs:(BOOL)a6 shouldSuppressError:(BOOL)a7 analyticsInfo:(id)a8 completion:(id)a9;
+ (void)tryToPurchaseBook:(id)a3 libraryAssetProvider:(id)a4 buyParameters:(id)a5 allowPurchaseFromNonSampleBuyButton:(BOOL)a6 suppressNetworkEvaluatorDialogs:(BOOL)a7 analyticsInfo:(id)a8 completion:(id)a9;
+ (void)tryToUpdateBook:(id)a3 libraryAssetProvider:(id)a4 analyticsInfo:(id)a5;
@end

@implementation BKBookPurchaseAction

+ (void)tryToPurchaseBook:(id)a3 libraryAssetProvider:(id)a4 buyParameters:(id)a5 allowPurchaseFromNonSampleBuyButton:(BOOL)a6 suppressNetworkEvaluatorDialogs:(BOOL)a7 analyticsInfo:(id)a8 completion:(id)a9
{
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  v20 = [v15 storeID];
  if ([v15 isCloud])
  {
    objc_initWeak(location, a1);
    v21 = +[BLJaliscoDAAPClient sharedClient];
    v22 = +[NSSet setWithObject:v20];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1001A3EE4;
    v37[3] = &unk_100A49BD0;
    objc_copyWeak(&v42, location);
    id v38 = v20;
    id v39 = v15;
    BOOL v43 = v10;
    id v40 = v18;
    id v41 = v19;
    [v21 fetchItemsForStoreIDs:v22 completion:v37];

    objc_destroyWeak(&v42);
    objc_destroyWeak(location);
  }
  else if ([v15 isSeriesItem])
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1001A4064;
    v30[3] = &unk_100A49BF8;
    id v35 = a1;
    id v23 = v20;
    id v31 = v23;
    id v24 = v15;
    id v32 = v24;
    BOOL v36 = v10;
    id v33 = v18;
    id v34 = v19;
    v25 = objc_retainBlock(v30);
    v26 = +[BKSeriesManager sharedManager];
    [v26 fetchBuyParametersForSeriesWithAdamID:v23 isAudiobook:[v24 isAudiobook] completionHandler:v25];
  }
  else if ([v17 length] {
         && [v20 length]
  }
         && (a6 || [v15 isSample]))
  {
    [a1 _executePurchaseOfBookWithParameters:v17 storeID:v20 isAudiobook:[v15 isAudiobook] suppressNetworkEvaluatorDialogs:v10 shouldSuppressError:1 analyticsInfo:v18 completion:v19];
  }
  else
  {
    v27 = BKLibraryLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1007EE5E8((uint64_t)v20, v27);
    }

    id v28 = objc_retainBlock(v19);
    v29 = v28;
    if (v28) {
      (*((void (**)(id, void, void))v28 + 2))(v28, 0, 0);
    }
  }
}

+ (void)tryToUpdateBook:(id)a3 libraryAssetProvider:(id)a4 analyticsInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, a1);
  v11 = [v8 storeID];
  unsigned __int8 v12 = [v8 isAudiobook];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001A4290;
  v15[3] = &unk_100A49C20;
  objc_copyWeak(&v18, &location);
  id v13 = v11;
  id v16 = v13;
  unsigned __int8 v19 = v12;
  id v14 = v10;
  id v17 = v14;
  +[BKUpdatesParameterProvider fetchUpdateParametersForLibraryAsset:v8 completion:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

+ (void)_executePurchaseOfBookWithParameters:(id)a3 storeID:(id)a4 isAudiobook:(BOOL)a5 suppressNetworkEvaluatorDialogs:(BOOL)a6 shouldSuppressError:(BOOL)a7 analyticsInfo:(id)a8 completion:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a9;
  id v16 = a8;
  id v17 = a3;
  id v18 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a4 longLongValue]);
  unsigned __int8 v19 = +[BLPurchaseRequest requestWithBuyParameters:v17 storeIdentifier:v18];

  [v19 setAudiobook:v12];
  [v19 setSuppressNetworkEvaluatorDialogs:v11];
  [v19 setAnalyticsInfo:v16];

  v20 = +[JSABridge sharedInstance];
  v21 = [v20 windowManager];

  v22 = +[BLDownloadQueue sharedInstance];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001A45C0;
  v24[3] = &unk_100A49C48;
  BOOL v26 = a7;
  id v25 = v15;
  id v23 = v15;
  [v22 purchaseWithRequest:v19 uiManager:v21 completion:v24];
}

@end