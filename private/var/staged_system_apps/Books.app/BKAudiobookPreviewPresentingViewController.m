@interface BKAudiobookPreviewPresentingViewController
- (void)_recordMetricsForBuyButtonTap:(BOOL)a3 actionDetails:(id)a4 offerType:(id)a5;
- (void)assetViewControllerRequestToBuy:(id)a3 completion:(id)a4;
@end

@implementation BKAudiobookPreviewPresentingViewController

- (void)assetViewControllerRequestToBuy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(BKBasePresentingViewController *)self sampleProfileFuture];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000EABD8;
  v12[3] = &unk_100A46A10;
  v12[4] = self;
  objc_copyWeak(&v15, &location);
  id v9 = v6;
  id v13 = v9;
  id v10 = v7;
  id v14 = v10;
  [v8 get:v12];

  id v11 = [(BKBasePresentingViewController *)self _fetchSampleProfileFuture];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_recordMetricsForBuyButtonTap:(BOOL)a3 actionDetails:(id)a4 offerType:(id)a5
{
  BOOL v6 = a3;
  id v13 = a4;
  id v8 = a5;
  id v9 = objc_opt_new();
  [v9 setObject:JSARecordEventTypeClick forKeyedSubscript:JSARecordKeyEventType];
  [v9 setObject:@"AudiobookPreview" forKeyedSubscript:JSARecordKeyActionContext];
  if (v6) {
    CFStringRef v10 = @"buy";
  }
  else {
    CFStringRef v10 = @"buyInitiate";
  }
  [v9 setObject:v10 forKeyedSubscript:JSARecordKeyActionType];
  if (v13) {
    [v9 setObject:v13 forKeyedSubscript:JSARecordKeyActionDetails];
  }
  if (v8)
  {
    id v11 = [v8 description];
    [v9 setObject:v11 forKeyedSubscript:JSARecordKeyOfferType];
  }
  v12 = [(BKBasePresentingViewController *)self assetPresenterAssetID];
  [v9 setObject:v12 forKeyedSubscript:JSARecordKeyTargetId];

  [v9 setObject:JSARecordTargetTypeButton forKeyedSubscript:JSARecordKeyTargetType];
  +[JSAApplication recordNativeEvent:v9];
}

@end