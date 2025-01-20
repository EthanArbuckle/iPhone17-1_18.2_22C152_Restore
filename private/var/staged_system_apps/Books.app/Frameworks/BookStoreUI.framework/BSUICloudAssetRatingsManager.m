@interface BSUICloudAssetRatingsManager
+ (void)_callOnJSBridge:(id)a3 options:(id)a4 completionHandler:(id)a5;
+ (void)_deleteRatingsDataForItem:(id)a3 shouldSuppressMetrics:(BOOL)a4 shouldSuppressResponseDialogs:(BOOL)a5 completionHandler:(id)a6;
+ (void)_fetchRatingsDataForItem:(id)a3 shouldSuppressMetrics:(BOOL)a4 shouldSuppressResponseDialogs:(BOOL)a5 completionHandler:(id)a6;
+ (void)_updateRatingsDataForItem:(id)a3 shouldSuppressMetrics:(BOOL)a4 shouldSuppressResponseDialogs:(BOOL)a5 updatingData:(id)a6 completionHandler:(id)a7;
+ (void)deleteRatingForItem:(id)a3 :(id)a4;
+ (void)deleteRatingForItem:(id)a3 shouldSuppressMetrics:(BOOL)a4 completion:(id)a5;
+ (void)getRatingForItem:(id)a3 :(id)a4 :(id)a5;
+ (void)getRatingForItem:(id)a3 forceFetch:(BOOL)a4 shouldSuppressMetrics:(BOOL)a5 completion:(id)a6;
+ (void)updateRating:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7;
+ (void)updateRating:(id)a3 title:(id)a4 body:(id)a5 itemId:(id)a6 shouldSuppressMetrics:(BOOL)a7 completion:(id)a8;
+ (void)updateRatingValue:(double)a3 title:(id)a4 body:(id)a5 itemId:(id)a6 shouldSuppressMetrics:(BOOL)a7 completion:(id)a8;
@end

@implementation BSUICloudAssetRatingsManager

+ (void)getRatingForItem:(id)a3 forceFetch:(BOOL)a4 shouldSuppressMetrics:(BOOL)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v11 = +[BUAccountsProvider sharedProvider];
  v12 = [v11 activeStoreAccount];

  if (v12)
  {
    v13 = +[BCCloudAssetManager sharedManager];
    v14 = [v13 assetReviewManager];

    v15 = [v12 ams_DSID];
    v16 = [v15 stringValue];
    v17 = +[BCAssetReview assetReviewIDWithUserID:v16 assetID:v9];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_2C890;
    v22[3] = &unk_38F020;
    BOOL v27 = a4;
    id v26 = v10;
    BOOL v28 = a5;
    id v23 = v9;
    id v24 = v17;
    id v25 = v14;
    id v18 = v14;
    id v19 = v17;
    [v18 assetReviewForAssetReviewID:v19 completion:v22];
  }
  else
  {
    id v20 = objc_retainBlock(v10);
    if (v20)
    {
      v21 = +[NSError errorWithDomain:@"BSUICloudAssetRatingsManager" code:403 userInfo:0];
      (*((void (**)(id, void, void *, void, void, void))v20 + 2))(v20, 0, v21, 0, 0, 0);
    }
  }
}

+ (void)getRatingForItem:(id)a3 :(id)a4 :(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v7 isString] & 1) == 0)
  {
    id v10 = BSUICloudAssetRatingsManagerLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_2DD54C();
    }
  }
  if (([v8 isBoolean] & 1) == 0)
  {
    v11 = BSUICloudAssetRatingsManagerLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_2DD518();
    }
  }
  v12 = [v7 toString];
  id v13 = [v8 toBool];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_2CE30;
  v15[3] = &unk_38F048;
  id v16 = v9;
  id v14 = v9;
  +[BSUICloudAssetRatingsManager getRatingForItem:v12 forceFetch:v13 shouldSuppressMetrics:0 completion:v15];
}

+ (void)updateRatingValue:(double)a3 title:(id)a4 body:(id)a5 itemId:(id)a6 shouldSuppressMetrics:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  id v13 = a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = +[NSNumber numberWithDouble:a3];
  +[BSUICloudAssetRatingsManager updateRating:v17 title:v16 body:v15 itemId:v14 shouldSuppressMetrics:v8 completion:v13];
}

+ (void)updateRating:(id)a3 title:(id)a4 body:(id)a5 itemId:(id)a6 shouldSuppressMetrics:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = +[BUAccountsProvider sharedProvider];
  id v20 = [v19 activeStoreAccount];

  if (v20)
  {
    id v21 = objc_alloc_init((Class)NSMutableDictionary);
    [v21 setObject:v14 forKeyedSubscript:@"rating"];
    if (v15)
    {
      [v21 setObject:v15 forKeyedSubscript:@"title"];
      if (v16) {
        [v21 setObject:v16 forKeyedSubscript:@"body"];
      }
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_2D2D0;
    v24[3] = &unk_38F098;
    id v25 = v17;
    id v26 = v14;
    id v31 = a1;
    id v27 = v20;
    id v28 = v15;
    id v29 = v16;
    id v30 = v18;
    +[BSUICloudAssetRatingsManager _updateRatingsDataForItem:v25 shouldSuppressMetrics:v9 shouldSuppressResponseDialogs:0 updatingData:v21 completionHandler:v24];
  }
  else
  {
    v22 = (void (**)(id, void, void *))objc_retainBlock(v18);
    if (v22)
    {
      id v23 = +[NSError errorWithDomain:@"BSUICloudAssetRatingsManager" code:403 userInfo:0];
      v22[2](v22, 0, v23);
    }
  }
}

+ (void)updateRating:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (([v11 isNumber] & 1) == 0)
  {
    id v16 = BSUICloudAssetRatingsManagerLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_2DD5E8();
    }
  }
  if (([v12 isString] & 1) == 0)
  {
    id v17 = BSUICloudAssetRatingsManagerLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_2DD5B4();
    }
  }
  if (([v13 isString] & 1) == 0)
  {
    id v18 = BSUICloudAssetRatingsManagerLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_2DD580();
    }
  }
  if (([v14 isString] & 1) == 0)
  {
    id v19 = BSUICloudAssetRatingsManagerLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_2DD54C();
    }
  }
  id v29 = v11;
  id v20 = [v11 toNumber];
  unsigned __int8 v21 = [v12 isUndefined];
  if (v21)
  {
    v22 = 0;
  }
  else
  {
    v22 = [v12 toString];
  }
  unsigned __int8 v23 = [v13 isUndefined];
  id v28 = v12;
  if (v23)
  {
    id v24 = 0;
  }
  else
  {
    id v24 = [v13 toString];
  }
  id v25 = v14;
  id v26 = [v14 toString];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_2DAC4;
  v30[3] = &unk_38F0C0;
  id v31 = v15;
  id v27 = v15;
  +[BSUICloudAssetRatingsManager updateRating:v20 title:v22 body:v24 itemId:v26 shouldSuppressMetrics:0 completion:v30];

  if ((v23 & 1) == 0) {
  if ((v21 & 1) == 0)
  }
}

+ (void)deleteRatingForItem:(id)a3 shouldSuppressMetrics:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = +[BUAccountsProvider sharedProvider];
  id v11 = [v10 activeStoreAccount];

  if (v11)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_2DD5C;
    v14[3] = &unk_38F110;
    id v15 = v8;
    id v18 = a1;
    id v16 = v11;
    id v17 = v9;
    +[BSUICloudAssetRatingsManager _deleteRatingsDataForItem:v15 shouldSuppressMetrics:v6 shouldSuppressResponseDialogs:0 completionHandler:v14];
  }
  else
  {
    id v12 = (void (**)(id, void, void *))objc_retainBlock(v9);
    if (v12)
    {
      id v13 = +[NSError errorWithDomain:@"BSUICloudAssetRatingsManager" code:403 userInfo:0];
      v12[2](v12, 0, v13);
    }
  }
}

+ (void)deleteRatingForItem:(id)a3 :(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isString] & 1) == 0)
  {
    id v7 = BSUICloudAssetRatingsManagerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_2DD54C();
    }
  }
  id v8 = [v5 toString];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_2E110;
  v10[3] = &unk_38F0C0;
  id v11 = v6;
  id v9 = v6;
  +[BSUICloudAssetRatingsManager deleteRatingForItem:v8 shouldSuppressMetrics:0 completion:v10];
}

+ (void)_fetchRatingsDataForItem:(id)a3 shouldSuppressMetrics:(BOOL)a4 shouldSuppressResponseDialogs:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  v15[0] = a3;
  v14[0] = @"itemId";
  v14[1] = @"shouldSuppressMetrics";
  id v9 = a6;
  id v10 = a3;
  id v11 = +[NSNumber numberWithBool:v7];
  v15[1] = v11;
  v14[2] = @"shouldSuppressResponseDialogs";
  id v12 = +[NSNumber numberWithBool:v6];
  v15[2] = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  +[BSUICloudAssetRatingsManager _callOnJSBridge:@"getRatingFromServer" options:v13 completionHandler:v9];
}

+ (void)_updateRatingsDataForItem:(id)a3 shouldSuppressMetrics:(BOOL)a4 shouldSuppressResponseDialogs:(BOOL)a5 updatingData:(id)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  v18[0] = a3;
  v17[0] = @"itemId";
  v17[1] = @"shouldSuppressMetrics";
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  id v14 = +[NSNumber numberWithBool:v9];
  v18[1] = v14;
  v17[2] = @"shouldSuppressResponseDialogs";
  id v15 = +[NSNumber numberWithBool:v8];
  v17[3] = @"updatingData";
  v18[2] = v15;
  v18[3] = v12;
  id v16 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];

  +[BSUICloudAssetRatingsManager _callOnJSBridge:@"updateRatingOnServer" options:v16 completionHandler:v11];
}

+ (void)_deleteRatingsDataForItem:(id)a3 shouldSuppressMetrics:(BOOL)a4 shouldSuppressResponseDialogs:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  v15[0] = a3;
  v14[0] = @"itemId";
  v14[1] = @"shouldSuppressMetrics";
  id v9 = a6;
  id v10 = a3;
  id v11 = +[NSNumber numberWithBool:v7];
  v15[1] = v11;
  v14[2] = @"shouldSuppressResponseDialogs";
  id v12 = +[NSNumber numberWithBool:v6];
  v15[2] = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  +[BSUICloudAssetRatingsManager _callOnJSBridge:@"deleteRatingFromServer" options:v13 completionHandler:v9];
}

+ (void)_callOnJSBridge:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[JSABridge sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_2E6C8;
  void v14[3] = &unk_38F138;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  [v10 enqueueBlock:v14 file:@"BSUICloudAssetRatingsManager.m" line:375];
}

@end