@interface BKAudiobookMinifiedController
- (AEAssetMinibarViewController)minifiedControllerMinibarViewController;
- (AEAssetMinifiedControllerDelegate)minifiedControllerDelegate;
- (AEAssetViewController)minifiedControllerLoadedAssetViewController;
- (AEAudioHelper)helper;
- (BKAudiobookMinifiedController)initWithHelper:(id)a3;
- (BKAudiobookNowPlayingTouchViewController)nowPlayingViewController;
- (BOOL)assetAudiobookStatusIsPlaying;
- (BOOL)audiobookNowPlayingViewControllerShouldPauseOnClose:(id)a3;
- (BOOL)minifiedControllerAnimateFromMinibarIfPossible;
- (BOOL)minifiedControllerShouldPreloadAssetViewController;
- (BOOL)minifiedControllerShouldUnloadAssetViewController;
- (double)assetAudiobookStatusTrackDuration;
- (double)assetAudiobookStatusTrackProgress;
- (double)assetAudiobookStatusTrackTimeRemaining;
- (id)minifiedControllerStateConforminigToProtocol:(id)a3;
- (void)_recordMetricsForBuyButtonWithAssetID:(id)a3 actionDetails:(id)a4 offerType:(id)a5;
- (void)assetAudiobookStatusTogglePlayPause;
- (void)assetViewControllerRequestToBuy:(id)a3 completion:(id)a4;
- (void)audiobookNowPlayingViewController:(id)a3 shouldStream:(BOOL)a4;
- (void)audiobookNowPlayingViewControllerRequestBuy:(id)a3 completion:(id)a4;
- (void)audiobookNowPlayingViewControllerRequestCloseMinified:(id)a3 error:(id)a4;
- (void)audiobookNowPlayingViewControllerRequestHide:(id)a3;
- (void)audiobookNowPlayingViewControllerWillDisappear:(id)a3;
- (void)minifiedAssetPresenterPausePlayback;
- (void)minifiedControllerDidLoadAsset;
- (void)minifiedControllerSaveState;
- (void)minifiedControllerWillUnloadAsset;
- (void)player:(id)a3 currentPositionDidChange:(double)a4 inChapter:(unint64_t)a5 absolutePosition:(double)a6;
- (void)player:(id)a3 failedWithError:(id)a4;
- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
- (void)requestCloseWithPresenter:(id)a3 animated:(BOOL)a4 error:(id)a5 completion:(id)a6;
- (void)setAssetAudiobookStatusPlaying:(BOOL)a3;
- (void)setAssetAudiobookStatusTrackDuration:(double)a3;
- (void)setAssetAudiobookStatusTrackProgress:(double)a3;
- (void)setAssetAudiobookStatusTrackTimeRemaining:(double)a3;
- (void)setHelper:(id)a3;
- (void)setMinifiedControllerDelegate:(id)a3;
- (void)setMinifiedControllerLoadedAssetViewController:(id)a3;
@end

@implementation BKAudiobookMinifiedController

- (BKAudiobookMinifiedController)initWithHelper:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKAudiobookMinifiedController;
  v6 = [(BKAudiobookMinifiedController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_helper, a3);
    v8 = +[BKAudiobookPlayer sharedInstance];
    [v8 addObserver:v7];
  }
  return v7;
}

- (void)minifiedControllerDidLoadAsset
{
  objc_opt_class();
  v3 = [(BKAudiobookMinifiedController *)self minifiedControllerLoadedAssetViewController];
  BUDynamicCast();
  v4 = (BKAudiobookNowPlayingTouchViewController *)objc_claimAutoreleasedReturnValue();
  nowPlayingViewController = self->_nowPlayingViewController;
  self->_nowPlayingViewController = v4;

  v6 = self->_nowPlayingViewController;

  [(BKAudiobookNowPlayingTouchViewController *)v6 setDelegate:self];
}

- (void)minifiedControllerWillUnloadAsset
{
  if (objc_opt_respondsToSelector()) {
    [(BKAudiobookNowPlayingTouchViewController *)self->_nowPlayingViewController assetViewControllerWillUnload];
  }
  [(BKAudiobookNowPlayingTouchViewController *)self->_nowPlayingViewController setDelegate:0];
  nowPlayingViewController = self->_nowPlayingViewController;
  self->_nowPlayingViewController = 0;
}

- (BOOL)minifiedControllerShouldPreloadAssetViewController
{
  return 1;
}

- (BOOL)minifiedControllerShouldUnloadAssetViewController
{
  return 0;
}

- (AEAssetMinibarViewController)minifiedControllerMinibarViewController
{
  return 0;
}

- (BOOL)minifiedControllerAnimateFromMinibarIfPossible
{
  return 0;
}

- (id)minifiedControllerStateConforminigToProtocol:(id)a3
{
  return (id)BUProtocolCast();
}

- (void)minifiedControllerSaveState
{
  id v2 = [(BKAudiobookMinifiedController *)self minifiedControllerLoadedAssetViewController];
  [v2 saveStateClosing:0];
}

- (void)minifiedAssetPresenterPausePlayback
{
  id v2 = +[BKAudiobookPlayer sharedInstance];
  [v2 pause];
}

- (void)player:(id)a3 currentPositionDidChange:(double)a4 inChapter:(unint64_t)a5 absolutePosition:(double)a6
{
  v8 = [a3 currentChapter:a4, a6];
  [v8 duration];
  double v10 = v9;

  double v11 = a4 / v10;
  if (a4 <= 0.0) {
    double v11 = 1.0;
  }
  [(BKAudiobookMinifiedController *)self setAssetAudiobookStatusTrackProgress:v11];
  double v12 = v10 - a4;
  if (v10 - a4 < 0.0) {
    double v12 = 0.0;
  }

  [(BKAudiobookMinifiedController *)self setAssetAudiobookStatusTrackTimeRemaining:v12];
}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v6 = [a3 isPlaying];

  [(BKAudiobookMinifiedController *)self setAssetAudiobookStatusPlaying:v6];
}

- (void)player:(id)a3 failedWithError:(id)a4
{
  -[BKAudiobookMinifiedController setAssetAudiobookStatusPlaying:](self, "setAssetAudiobookStatusPlaying:", 0, a4);
  [(BKAudiobookMinifiedController *)self setAssetAudiobookStatusTrackProgress:1.0];

  [(BKAudiobookMinifiedController *)self setAssetAudiobookStatusTrackTimeRemaining:0.0];
}

- (void)assetViewControllerRequestToBuy:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_opt_new();
  (*((void (**)(id, uint64_t, id))a4 + 2))(v5, 1, v6);
}

- (void)requestCloseWithPresenter:(id)a3 animated:(BOOL)a4 error:(id)a5 completion:(id)a6
{
}

- (BOOL)audiobookNowPlayingViewControllerShouldPauseOnClose:(id)a3
{
  return 0;
}

- (void)audiobookNowPlayingViewControllerRequestHide:(id)a3
{
}

- (void)audiobookNowPlayingViewControllerRequestCloseMinified:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = [(BKAudiobookMinifiedController *)self minifiedControllerDelegate];
  [v6 minifiedControllerRequestClose:self error:v5];
}

- (void)audiobookNowPlayingViewControllerWillDisappear:(id)a3
{
  id v4 = [(BKAudiobookMinifiedController *)self nowPlayingViewController];
  -[BKAudiobookMinifiedController setAssetAudiobookStatusPlaying:](self, "setAssetAudiobookStatusPlaying:", [v4 isPlaying]);
}

- (void)audiobookNowPlayingViewController:(id)a3 shouldStream:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [(AEAudioHelper *)self->_helper isStreaming];
  if (v7 != v4)
  {
    unsigned int v8 = v7;
    double v9 = _AEBookPluginsAudiobookLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v19[0] = 67109376;
      v19[1] = v8;
      __int16 v20 = 1024;
      BOOL v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Minified controller switching from streaming=%d to streaming=%d", (uint8_t *)v19, 0xEu);
    }

    objc_opt_class();
    double v10 = BUDynamicCast();
    double v11 = [BKMLAudiobookHelper alloc];
    double v12 = [v10 albumTitle];
    v13 = +[MPMediaItem bk_audioBookAssetURLWithAlbumTitle:v12 isCloudItem:v4];
    v14 = [v10 options];
    v15 = [(BKMLAudiobookHelper *)v11 initWithAssetUrl:v13 options:v14];

    helper = self->_helper;
    self->_helper = v15;
    v17 = v15;

    v18 = [(BKAudiobookMinifiedController *)self minifiedControllerDelegate];
    [v18 minifiedController:self updatedHelper:v17];

    [v6 setHelper:v17 completion:&stru_100A489E8];
  }
}

- (void)audiobookNowPlayingViewControllerRequestBuy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  unsigned int v8 = BUDynamicCast();
  double v9 = v8;
  if (v8)
  {
    double v10 = [v8 mAsset];
    v33 = [v10 buyParams];
    double v11 = [v10 offer];
    v32 = [v11 objectForKeyedSubscript:@"type"];

    objc_opt_class();
    double v12 = [(BKAudiobookMinifiedController *)self helper];
    v13 = [v12 helperMetadataForKey:AEHelperStringMetadataAssetIDKey needsCoordination:0];
    v14 = BUDynamicCast();

    v15 = [v6 ba_effectiveAnalyticsTracker];
    v16 = objc_opt_new();
    v34 = v15;
    v17 = [v15 chainWithName:@"AudiobookMiniPlayer"];
    [v16 setObject:v17 forKeyedSubscript:@"BATracker"];

    if (_os_feature_enabled_impl())
    {
      id v30 = v7;
      id v31 = v6;
      v29 = +[BAAppAnalyticsAdditionalData supportsUnifiedProductPageKey];
      v43[0] = v29;
      v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 supportsUnifiedProductPage]);
      v44[0] = v18;
      v19 = +[BAAppAnalyticsAdditionalData editionKindKey];
      v43[1] = v19;
      __int16 v20 = [v10 editionKind];
      if (v20) {
        [v10 editionKind];
      }
      else {
      v23 = +[NSNull null];
      }
      v44[1] = v23;
      v24 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
      [v16 setObject:v24 forKeyedSubscript:BAAppAnalyticsAdditionalDataKey];

      id v7 = v30;
      id v6 = v31;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016A1AC;
    block[3] = &unk_100A48A10;
    block[4] = self;
    id v36 = v14;
    id v37 = v33;
    id v38 = v32;
    id v39 = v16;
    id v40 = v6;
    id v41 = v9;
    id v42 = v7;
    id v25 = v16;
    id v26 = v32;
    id v27 = v33;
    id v28 = v14;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    id v21 = objc_retainBlock(v7);
    v22 = v21;
    if (v21) {
      (*((void (**)(id, void, void))v21 + 2))(v21, 0, 0);
    }
  }
}

- (void)_recordMetricsForBuyButtonWithAssetID:(id)a3 actionDetails:(id)a4 offerType:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = a5;
  double v9 = objc_opt_new();
  [v9 setObject:JSARecordEventTypeClick forKeyedSubscript:JSARecordKeyEventType];
  [v9 setObject:@"AudiobookPreview" forKeyedSubscript:JSARecordKeyActionContext];
  [v9 setObject:@"buy" forKeyedSubscript:JSARecordKeyActionType];
  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:JSARecordKeyActionDetails];
  }
  if (v8)
  {
    double v10 = [v8 description];
    [v9 setObject:v10 forKeyedSubscript:JSARecordKeyOfferType];
  }
  [v9 setObject:v11 forKeyedSubscript:JSARecordKeyTargetId];
  [v9 setObject:JSARecordTargetTypeButton forKeyedSubscript:JSARecordKeyTargetType];
  +[JSAApplication recordNativeEvent:v9];
}

- (void)assetAudiobookStatusTogglePlayPause
{
  id v2 = +[BKAudiobookPlayer sharedInstance];
  [v2 togglePlayPause];
}

- (AEAssetViewController)minifiedControllerLoadedAssetViewController
{
  return self->_minifiedControllerLoadedAssetViewController;
}

- (void)setMinifiedControllerLoadedAssetViewController:(id)a3
{
}

- (AEAssetMinifiedControllerDelegate)minifiedControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_minifiedControllerDelegate);

  return (AEAssetMinifiedControllerDelegate *)WeakRetained;
}

- (void)setMinifiedControllerDelegate:(id)a3
{
}

- (AEAudioHelper)helper
{
  return self->_helper;
}

- (void)setHelper:(id)a3
{
}

- (BKAudiobookNowPlayingTouchViewController)nowPlayingViewController
{
  return self->_nowPlayingViewController;
}

- (BOOL)assetAudiobookStatusIsPlaying
{
  return self->_assetAudiobookStatusPlaying;
}

- (void)setAssetAudiobookStatusPlaying:(BOOL)a3
{
  self->_assetAudiobookStatusPlaying = a3;
}

- (double)assetAudiobookStatusTrackProgress
{
  return self->_assetAudiobookStatusTrackProgress;
}

- (void)setAssetAudiobookStatusTrackProgress:(double)a3
{
  self->_assetAudiobookStatusTrackProgress = a3;
}

- (double)assetAudiobookStatusTrackDuration
{
  return self->_assetAudiobookStatusTrackDuration;
}

- (void)setAssetAudiobookStatusTrackDuration:(double)a3
{
  self->_assetAudiobookStatusTrackDuration = a3;
}

- (double)assetAudiobookStatusTrackTimeRemaining
{
  return self->_assetAudiobookStatusTrackTimeRemaining;
}

- (void)setAssetAudiobookStatusTrackTimeRemaining:(double)a3
{
  self->_assetAudiobookStatusTrackTimeRemaining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingViewController, 0);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_destroyWeak((id *)&self->_minifiedControllerDelegate);

  objc_storeStrong((id *)&self->_minifiedControllerLoadedAssetViewController, 0);
}

@end