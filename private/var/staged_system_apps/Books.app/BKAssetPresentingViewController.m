@interface BKAssetPresentingViewController
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (void)_trackProgressForLibraryAsset:(id)a3;
- (void)assetViewControllerRequestToBuy:(id)a3 completion:(id)a4;
- (void)performClose:(id)a3;
@end

@implementation BKAssetPresentingViewController

- (void)assetViewControllerRequestToBuy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BKBasePresentingViewController *)self storeID];
  if (v8
    || ([(BKBasePresentingViewController *)self assetIdentifier],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v9 permanentAssetID],
        v8 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8))
  {
    v10 = [(BKAssetPresentingViewController *)self ba_effectiveAnalyticsTracker];
    objc_initWeak(&location, self);
    v11 = [(BKBasePresentingViewController *)self sampleProfileFuture];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000AED38;
    v16[3] = &unk_100A44C10;
    objc_copyWeak(&v21, &location);
    id v12 = v10;
    id v17 = v12;
    id v13 = v8;
    id v18 = v13;
    id v19 = v6;
    id v20 = v7;
    [v11 get:v16];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    id v14 = objc_retainBlock(v7);
    v15 = v14;
    if (v14) {
      (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
    }
  }
}

- (void)_trackProgressForLibraryAsset:(id)a3
{
  id v4 = a3;
  if (([v4 isSample] & 1) == 0 && (objc_msgSend(v4, "isAudiobook") & 1) == 0)
  {
    v5 = [(BKBasePresentingViewController *)self assetViewController];
    if (objc_opt_respondsToSelector())
    {
      id v6 = [(BKBasePresentingViewController *)self assetViewController];
      uint64_t v7 = (uint64_t)[v6 pageCountIncludingUpsell];
    }
    else
    {
      uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }

    v8 = [(BKBasePresentingViewController *)self assetViewController];
    v9 = BUProtocolCast();

    v10 = BCProgressKitLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1007E8014(v4, v10);
    }

    v11 = [v4 title];
    if ([v11 length]) {
      [v4 title];
    }
    else {
    id v12 = [v4 sortTitle];
    }

    if (![v12 length])
    {
      id v13 = +[NSBundle mainBundle];
      uint64_t v14 = [v13 localizedStringForKey:@"Untitled" value:&stru_100A70340 table:0];

      v15 = BCProgressKitLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_1007E7FE0();
      }

      id v12 = (void *)v14;
    }
    v16 = [(BKBasePresentingViewController *)self assetIdentifier];
    id v17 = [v16 permanentAssetID];

    objc_initWeak(&location, self);
    BOOL v18 = ([v4 isSample] & 1) == 0
       && ([v4 isAudiobook] & 1) == 0
       && [v4 contentType] != 3;
    id v19 = [v4 versionNumberHumanReadable];
    id v20 = [v4 storeID];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000AF868;
    v26[3] = &unk_100A44CB0;
    id v21 = v17;
    id v27 = v21;
    id v22 = v19;
    id v28 = v22;
    id v23 = v12;
    id v29 = v23;
    v32[1] = (id)v7;
    id v24 = v20;
    id v30 = v24;
    objc_copyWeak(v32, &location);
    BOOL v33 = v18;
    id v25 = v9;
    id v31 = v25;
    +[BKLibraryManager fetchImageForAsset:size:includeSpine:includeShadow:coverEffectsEnvironment:completion:](BKLibraryManager, "fetchImageForAsset:size:includeSpine:includeShadow:coverEffectsEnvironment:completion:", v4, 0, 0, 0, v26, 240.0, 240.0);

    objc_destroyWeak(v32);
    objc_destroyWeak(&location);
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return sel_isEqual(a3, "performClose:");
}

- (void)performClose:(id)a3
{
}

@end