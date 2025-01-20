@interface BKMinifiedAssetPresenter
+ (void)minimizedPresenterWithLibraryAsset:(id)a3 options:(id)a4 presenter:(id)a5 completion:(id)a6;
- (AEAssetAudiobookStatus)minifiedAssetStatus;
- (AEAssetMinibarViewController)minibarViewController;
- (AEAssetMinifiedController)minifiedController;
- (AEHelper)helper;
- (BCFutureValue)assetViewControllerFuture;
- (BCFutureValue)minifiedAssetPresenterAssetViewControllerFuture;
- (BKMinifiedAssetPresenter)initWithAssetID:(id)a3 helper:(id)a4 minifiedController:(id)a5 options:(id)a6 presenter:(id)a7;
- (BKMinifiedPresenting)minifiedPresenter;
- (BOOL)minifiedAssetPresenterCanPresentAssetFromStoreTab;
- (BOOL)minifiedAssetPresenterCanStayOpenInBackground;
- (BOOL)minifiedAssetPresenterIsAudiobook;
- (BOOL)minifiedAssetPresenterIsSupplementalContent;
- (BOOL)minifiedAssetPresenterShouldAnimateFromMinibar;
- (BOOL)minifiedAssetPresenterShouldAnimateOpenClose;
- (BOOL)minifiedAssetPresenterWorkaround36067646;
- (NSDictionary)options;
- (NSString)minifiedAssetPresenterAssetID;
- (double)minifiedAssetPresenterMinibarCornerRadius;
- (double)minifiedAssetPresenterMinibarFloatingHorizontalOffset;
- (double)minifiedAssetPresenterMinibarFloatingVerticalOffset;
- (double)minifiedAssetPresenterMinibarHeight;
- (double)minifiedAssetPresenterMinibarMaxWidth;
- (id)_futureViewControllerWithAssetID:(id)a3 options:(id)a4;
- (id)_futureViewControllerWithAssetViewController:(id)a3;
- (id)minifiedAssetPresenterLoadAssetBlock;
- (void)_unloadAssetViewController;
- (void)dealloc;
- (void)minifiedAssetPresenterDidCloseAssetFully;
- (void)minifiedAssetPresenterDidCloseAssetMinified;
- (void)minifiedAssetPresenterDidOpenAssetFully;
- (void)minifiedAssetPresenterDidReloadAssetViewController:(id)a3;
- (void)minifiedAssetPresenterPausePlayback;
- (void)minifiedAssetPresenterSaveStateClosing:(BOOL)a3;
- (void)minifiedAssetPresenterWillOpenAssetMinified;
- (void)minifiedController:(id)a3 updatedHelper:(id)a4;
- (void)minifiedControllerRequestClose:(id)a3 error:(id)a4;
- (void)setAssetViewControllerFuture:(id)a3;
- (void)setMinifiedAssetPresenterCanStayOpenInBackground:(BOOL)a3;
- (void)setMinifiedAssetPresenterIsAudiobook:(BOOL)a3;
- (void)setMinifiedAssetPresenterIsSupplementalContent:(BOOL)a3;
- (void)setMinifiedAssetPresenterWorkaround36067646:(BOOL)a3;
@end

@implementation BKMinifiedAssetPresenter

- (id)_futureViewControllerWithAssetID:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001893AC;
  v16[3] = &unk_100A490B8;
  objc_copyWeak(&v18, &location);
  id v9 = v8;
  id v17 = v9;
  +[BKAssetLookup assetLookupWithID:v6 options:v7 completion:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100189470;
  v14[3] = &unk_100A449A0;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v10;
  [v9 get:v14];
  v11 = v15;
  id v12 = v9;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v12;
}

- (id)_futureViewControllerWithAssetViewController:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)BCMutableFutureValue) initWithValue:v4];
  id v6 = [(BKMinifiedAssetPresenter *)self minifiedController];
  [v6 setMinifiedControllerLoadedAssetViewController:v4];

  return v5;
}

- (BKMinifiedAssetPresenter)initWithAssetID:(id)a3 helper:(id)a4 minifiedController:(id)a5 options:(id)a6 presenter:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)BKMinifiedAssetPresenter;
  id v17 = [(BKMinifiedAssetPresenter *)&v30 init];
  if (v17)
  {
    id v18 = [v14 minifiedControllerMinibarViewController];
    objc_storeStrong((id *)&v17->_helper, a4);
    v19 = (NSString *)[v12 copy];
    minifiedAssetPresenterAssetID = v17->_minifiedAssetPresenterAssetID;
    v17->_minifiedAssetPresenterAssetID = v19;

    v21 = (NSDictionary *)[v15 copy];
    options = v17->_options;
    v17->_options = v21;

    objc_storeStrong((id *)&v17->_minifiedController, a5);
    [(AEAssetMinifiedController *)v17->_minifiedController setMinifiedControllerDelegate:v17];
    objc_storeStrong((id *)&v17->_minibarViewController, v18);
    objc_storeWeak((id *)&v17->_minifiedPresenter, v16);
    v23 = [(BKMinifiedAssetPresenter *)v17 minibarViewController];
    [v23 setMinibarViewControllerDelegate:v17];

    v24 = [(BKMinifiedAssetPresenter *)v17 minifiedController];
    unsigned int v25 = [v24 minifiedControllerShouldPreloadAssetViewController];

    if (v25)
    {
      v26 = [(BKMinifiedAssetPresenter *)v17 _futureViewControllerWithAssetID:v12 options:v15];
      [(BKMinifiedAssetPresenter *)v17 setAssetViewControllerFuture:v26];
    }
    v27 = BCSceneLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = v17->_minifiedAssetPresenterAssetID;
      *(_DWORD *)buf = 136446722;
      v32 = "-[BKMinifiedAssetPresenter initWithAssetID:helper:minifiedController:options:presenter:]";
      __int16 v33 = 2112;
      v34 = v17;
      __int16 v35 = 2112;
      v36 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%{public}s:[%@] assetID=%@", buf, 0x20u);
    }
  }
  return v17;
}

- (void)dealloc
{
  v3 = BCSceneLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(BKMinifiedAssetPresenter *)self minifiedAssetPresenterAssetID];
    *(_DWORD *)buf = 136446722;
    id v7 = "-[BKMinifiedAssetPresenter dealloc]";
    __int16 v8 = 2112;
    id v9 = self;
    __int16 v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}s:[%@] assetID=%@", buf, 0x20u);
  }
  [(BKMinifiedAssetPresenter *)self _unloadAssetViewController];
  v5.receiver = self;
  v5.super_class = (Class)BKMinifiedAssetPresenter;
  [(BKMinifiedAssetPresenter *)&v5 dealloc];
}

+ (void)minimizedPresenterWithLibraryAsset:(id)a3 options:(id)a4 presenter:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 assetID];
  id v15 = [v10 assetLogID];
  id v16 = [v10 dataSourceIdentifier];
  if ([v16 isEqual:@"com.apple.ibooks.datasource.ubiquity"]) {
    BOOL v17 = [v10 state] == 3;
  }
  else {
    BOOL v17 = 0;
  }

  id v18 = +[BKAppDelegate delegate];
  v19 = [v18 libraryAssetProvider];

  if (v19)
  {
    BOOL v31 = v17;
    id v32 = a1;
    __int16 v33 = v12;
    v20 = v14;
    v34 = v13;
    v21 = v11;
    unsigned __int8 v22 = [v10 isAudiobook];
    unsigned __int8 v23 = [v10 streamable];
    unsigned __int8 v24 = [v10 isSupplementalContent];
    unsigned int v25 = [v10 supplementalContentAssets];
    id v26 = [v25 count];

    v27 = sub_100189164();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v48 = v15;
      __int16 v49 = 2048;
      id v50 = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "minimizedPresenterWithLibraryAsset logID:%{public}@ supplemental content count=%lu", buf, 0x16u);
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100189C00;
    v35[3] = &unk_100A49108;
    id v36 = v15;
    unsigned __int8 v43 = v23;
    id v11 = v21;
    id v37 = v21;
    id v14 = v20;
    id v38 = v20;
    id v42 = v32;
    id v39 = v10;
    id v12 = v33;
    id v40 = v33;
    unsigned __int8 v44 = v22;
    unsigned __int8 v45 = v24;
    BOOL v46 = v31;
    id v13 = v34;
    id v41 = v34;
    [v19 assetForLibraryAsset:v39 completion:v35];

    v28 = v36;
  }
  else
  {
    v29 = _AEBookPluginsLifeCycleLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v48 = v15;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "minimizedPresenterWithLibraryAsset no libraryAssetProvider for logID:%{public}@", buf, 0xCu);
    }

    id v30 = objc_retainBlock(v13);
    v28 = v30;
    if (v30) {
      (*((void (**)(id, void))v30 + 2))(v30, 0);
    }
  }
}

- (BCFutureValue)minifiedAssetPresenterAssetViewControllerFuture
{
  v3 = objc_opt_new();
  id v4 = [(BKMinifiedAssetPresenter *)self assetViewControllerFuture];

  if (!v4)
  {
    objc_super v5 = [(BKMinifiedAssetPresenter *)self minifiedAssetPresenterAssetID];
    id v6 = [(BKMinifiedAssetPresenter *)self options];
    id v7 = [(BKMinifiedAssetPresenter *)self _futureViewControllerWithAssetID:v5 options:v6];
    [(BKMinifiedAssetPresenter *)self setAssetViewControllerFuture:v7];
  }
  __int16 v8 = [(BKMinifiedAssetPresenter *)self assetViewControllerFuture];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10018A314;
  v11[3] = &unk_100A48FE8;
  id v9 = v3;
  id v12 = v9;
  [v8 get:v11];

  return (BCFutureValue *)v9;
}

- (void)minifiedAssetPresenterDidReloadAssetViewController:(id)a3
{
  id v11 = a3;
  id v4 = [(BKMinifiedAssetPresenter *)self minifiedAssetPresenterAssetID];
  objc_super v5 = [v11 asset];
  id v6 = [v5 assetID];
  unsigned __int8 v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0) {
    BCReportAssertionFailureWithMessage();
  }
  __int16 v8 = [(BKMinifiedAssetPresenter *)self assetViewControllerFuture];

  id v9 = v11;
  if (v8)
  {
    id v10 = [(BKMinifiedAssetPresenter *)self _futureViewControllerWithAssetViewController:v11];
    [(BKMinifiedAssetPresenter *)self setAssetViewControllerFuture:v10];

    id v9 = v11;
  }
}

- (id)minifiedAssetPresenterLoadAssetBlock
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10018A500;
  v4[3] = &unk_100A49038;
  objc_copyWeak(&v5, &location);
  id v2 = [v4 copy];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (double)minifiedAssetPresenterMinibarHeight
{
  id v2 = [(BKMinifiedAssetPresenter *)self minibarViewController];
  [v2 minifiedViewControllerMinibarHeight];
  double v4 = v3;

  return v4;
}

- (double)minifiedAssetPresenterMinibarMaxWidth
{
  id v2 = [(BKMinifiedAssetPresenter *)self minibarViewController];
  [v2 minifiedViewControllerMinibarMaxWidth];
  double v4 = v3;

  return v4;
}

- (double)minifiedAssetPresenterMinibarFloatingHorizontalOffset
{
  id v2 = [(BKMinifiedAssetPresenter *)self minibarViewController];
  [v2 minifiedViewControllerMinibarFloatingHorizontalOffset];
  double v4 = v3;

  return v4;
}

- (double)minifiedAssetPresenterMinibarFloatingVerticalOffset
{
  id v2 = [(BKMinifiedAssetPresenter *)self minibarViewController];
  [v2 minifiedViewControllerMinibarFloatingVerticalOffset];
  double v4 = v3;

  return v4;
}

- (double)minifiedAssetPresenterMinibarCornerRadius
{
  id v2 = [(BKMinifiedAssetPresenter *)self minibarViewController];
  [v2 minifiedViewControllerMinibarCornerRadius];
  double v4 = v3;

  return v4;
}

- (BOOL)minifiedAssetPresenterCanPresentAssetFromStoreTab
{
  return 1;
}

- (BOOL)minifiedAssetPresenterShouldAnimateOpenClose
{
  return 0;
}

- (AEAssetAudiobookStatus)minifiedAssetStatus
{
  id v2 = [(BKMinifiedAssetPresenter *)self minifiedAssetPresenterMinifiedController];
  double v3 = [v2 minifiedControllerStateConforminigToProtocol:&OBJC_PROTOCOL___AEAssetAudiobookStatus];

  return (AEAssetAudiobookStatus *)v3;
}

- (void)minifiedAssetPresenterWillOpenAssetMinified
{
  id v2 = [(BKMinifiedAssetPresenter *)self minifiedController];
  [v2 minifiedControllerWillOpenAsset];
}

- (void)minifiedAssetPresenterDidCloseAssetMinified
{
  id v2 = [(BKMinifiedAssetPresenter *)self minifiedController];
  [v2 minifiedControllerDidCloseAsset];
}

- (void)minifiedAssetPresenterDidOpenAssetFully
{
  id v2 = [(BKMinifiedAssetPresenter *)self minifiedController];
  [v2 minifiedControllerDidOpenAssetFully];
}

- (BOOL)minifiedAssetPresenterShouldAnimateFromMinibar
{
  id v2 = [(BKMinifiedAssetPresenter *)self minifiedController];
  unsigned __int8 v3 = [v2 minifiedControllerAnimateFromMinibarIfPossible];

  return v3;
}

- (void)minifiedAssetPresenterDidCloseAssetFully
{
  unsigned __int8 v3 = [(BKMinifiedAssetPresenter *)self minifiedController];
  [v3 minifiedControllerDidCloseAssetFully];

  double v4 = [(BKMinifiedAssetPresenter *)self minifiedController];
  unsigned int v5 = [v4 minifiedControllerShouldUnloadAssetViewController];

  if (v5)
  {
    [(BKMinifiedAssetPresenter *)self _unloadAssetViewController];
  }
}

- (void)_unloadAssetViewController
{
  unsigned __int8 v3 = [(BKMinifiedAssetPresenter *)self assetViewControllerFuture];
  [v3 cancel];

  [(BKMinifiedAssetPresenter *)self setAssetViewControllerFuture:0];
  id v5 = [(BKMinifiedAssetPresenter *)self minifiedController];
  double v4 = [v5 minifiedControllerLoadedAssetViewController];

  if (v4)
  {
    [v5 minifiedControllerWillUnloadAsset];
    [v5 setMinifiedControllerLoadedAssetViewController:0];
  }
}

- (void)minifiedAssetPresenterSaveStateClosing:(BOOL)a3
{
  id v3 = [(BKMinifiedAssetPresenter *)self minifiedController];
  [v3 minifiedControllerSaveState];
}

- (void)minifiedAssetPresenterPausePlayback
{
  id v2 = [(BKMinifiedAssetPresenter *)self minifiedController];
  [v2 minifiedAssetPresenterPausePlayback];
}

- (void)minifiedControllerRequestClose:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v9 = [(BKMinifiedAssetPresenter *)self minifiedPresenter];
  objc_opt_class();
  id v6 = [(BKMinifiedAssetPresenter *)self options];
  unsigned __int8 v7 = [v6 objectForKeyedSubscript:@"BKAudiobookOptionsIsRetryKey"];
  __int16 v8 = BUDynamicCast();
  [v9 minifiedPresenterClose:self error:v5 isRetry:[v8 BOOLValue]];
}

- (void)minifiedController:(id)a3 updatedHelper:(id)a4
{
}

- (BKMinifiedPresenting)minifiedPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_minifiedPresenter);

  return (BKMinifiedPresenting *)WeakRetained;
}

- (BOOL)minifiedAssetPresenterIsAudiobook
{
  return self->_minifiedAssetPresenterIsAudiobook;
}

- (void)setMinifiedAssetPresenterIsAudiobook:(BOOL)a3
{
  self->_minifiedAssetPresenterIsAudiobook = a3;
}

- (BOOL)minifiedAssetPresenterIsSupplementalContent
{
  return self->_minifiedAssetPresenterIsSupplementalContent;
}

- (void)setMinifiedAssetPresenterIsSupplementalContent:(BOOL)a3
{
  self->_minifiedAssetPresenterIsSupplementalContent = a3;
}

- (BOOL)minifiedAssetPresenterCanStayOpenInBackground
{
  return self->_minifiedAssetPresenterCanStayOpenInBackground;
}

- (void)setMinifiedAssetPresenterCanStayOpenInBackground:(BOOL)a3
{
  self->_minifiedAssetPresenterCanStayOpenInBackground = a3;
}

- (NSString)minifiedAssetPresenterAssetID
{
  return self->_minifiedAssetPresenterAssetID;
}

- (BCFutureValue)assetViewControllerFuture
{
  return self->_assetViewControllerFuture;
}

- (void)setAssetViewControllerFuture:(id)a3
{
}

- (AEAssetMinibarViewController)minibarViewController
{
  return self->_minibarViewController;
}

- (AEHelper)helper
{
  return self->_helper;
}

- (NSDictionary)options
{
  return self->_options;
}

- (AEAssetMinifiedController)minifiedController
{
  return self->_minifiedController;
}

- (BOOL)minifiedAssetPresenterWorkaround36067646
{
  return self->_minifiedAssetPresenterWorkaround36067646;
}

- (void)setMinifiedAssetPresenterWorkaround36067646:(BOOL)a3
{
  self->_minifiedAssetPresenterWorkaround36067646 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minifiedController, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_minibarViewController, 0);
  objc_storeStrong((id *)&self->_assetViewControllerFuture, 0);
  objc_storeStrong((id *)&self->_minifiedAssetPresenterAssetID, 0);

  objc_destroyWeak((id *)&self->_minifiedPresenter);
}

@end