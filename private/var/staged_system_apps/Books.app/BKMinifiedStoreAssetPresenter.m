@interface BKMinifiedStoreAssetPresenter
+ (void)minimizedPresenterWithAsset:(id)a3 options:(id)a4 presenter:(id)a5 completion:(id)a6;
- (AEAssetAudiobookStatus)minifiedAssetStatus;
- (AEAssetMinifiedController)minifiedAssetPresenterMinifiedController;
- (AEAssetMinifiedController)minifiedController;
- (AEHelper)minifiedAssetPresenterAssetHelper;
- (BCFutureValue)assetViewControllerFuture;
- (BCFutureValue)minifiedAssetPresenterAssetViewControllerFuture;
- (BFMAsset)asset;
- (BKLibraryAsset)libraryAsset;
- (BKMinifiedPresenting)minifiedPresenter;
- (BKMinifiedStoreAssetPresenter)initWithAsset:(id)a3 libraryAsset:(id)a4 options:(id)a5 presenter:(id)a6;
- (BOOL)minifiedAssetPresenterCanPresentAssetFromStoreTab;
- (BOOL)minifiedAssetPresenterCanStayOpenInBackground;
- (BOOL)minifiedAssetPresenterIsAudiobook;
- (BOOL)minifiedAssetPresenterIsSupplementalContent;
- (BOOL)minifiedAssetPresenterShouldAnimateFromMinibar;
- (BOOL)minifiedAssetPresenterShouldAnimateOpenClose;
- (Class)assetPresentingViewControllerClass;
- (NSDictionary)options;
- (NSString)minifiedAssetPresenterAssetID;
- (UIViewController)playerViewController;
- (double)minifiedAssetPresenterMinibarCornerRadius;
- (double)minifiedAssetPresenterMinibarFloatingHorizontalOffset;
- (double)minifiedAssetPresenterMinibarFloatingVerticalOffset;
- (double)minifiedAssetPresenterMinibarHeight;
- (double)minifiedAssetPresenterMinibarMaxWidth;
- (id)_futureViewControllerWithAssetID:(id)a3 options:(id)a4;
- (id)minifiedAssetPresenterLoadAssetBlock;
- (id)touchVC;
- (void)_unloadAssetViewController;
- (void)dealloc;
- (void)minifiedAssetPresenterDidOpenAssetMinified;
- (void)minifiedAssetPresenterPausePlayback;
- (void)minifiedAssetPresenterTogglePlayback;
- (void)minifiedAssetPresenterWillCloseAssetMinified;
- (void)minifiedControllerRequestClose:(id)a3 error:(id)a4;
- (void)setAsset:(id)a3;
- (void)setAssetViewControllerFuture:(id)a3;
- (void)setLibraryAsset:(id)a3;
- (void)setMinifiedController:(id)a3;
@end

@implementation BKMinifiedStoreAssetPresenter

- (id)touchVC
{
  objc_opt_class();

  return (id)BUDynamicCast();
}

- (BKMinifiedStoreAssetPresenter)initWithAsset:(id)a3 libraryAsset:(id)a4 options:(id)a5 presenter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)BKMinifiedStoreAssetPresenter;
  v15 = [(BKMinifiedStoreAssetPresenter *)&v24 init];
  if (v15)
  {
    v16 = [v11 id];
    v17 = (NSString *)[v16 copy];
    minifiedAssetPresenterAssetID = v15->_minifiedAssetPresenterAssetID;
    v15->_minifiedAssetPresenterAssetID = v17;

    v19 = (NSDictionary *)[v13 copy];
    options = v15->_options;
    v15->_options = v19;

    objc_storeStrong((id *)&v15->_asset, a3);
    objc_storeStrong((id *)&v15->_libraryAsset, a4);
    uint64_t v21 = +[BKAudiobookNowPlayingModuleFactory fetchOrCreateMiniPlayer];
    playerViewController = v15->_playerViewController;
    v15->_playerViewController = (UIViewController *)v21;

    objc_storeWeak((id *)&v15->_minifiedPresenter, v14);
  }

  return v15;
}

- (void)dealloc
{
  v3 = [(BKMinifiedStoreAssetPresenter *)self assetViewControllerFuture];
  [v3 cancel];

  [(BKMinifiedStoreAssetPresenter *)self _unloadAssetViewController];
  v4.receiver = self;
  v4.super_class = (Class)BKMinifiedStoreAssetPresenter;
  [(BKMinifiedStoreAssetPresenter *)&v4 dealloc];
}

+ (void)minimizedPresenterWithAsset:(id)a3 options:(id)a4 presenter:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = +[BKAppDelegate delegate];
  v15 = [v14 libraryAssetProvider];

  if (v15)
  {
    v16 = [v10 id];
    v17 = [v15 libraryAssetOnMainQueueWithAssetID:v16];
  }
  else
  {
    v17 = 0;
  }
  id v18 = [objc_alloc((Class)a1) initWithAsset:v10 libraryAsset:v17 options:v11 presenter:v13];

  v19 = [v10 id];
  v20 = v19;
  if (v18 && [v19 length])
  {
    uint64_t v21 = +[AEUserPublishing sharedInstance];
    v31 = v20;
    v22 = +[NSArray arrayWithObjects:&v31 count:1];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10017F758;
    v25[3] = &unk_100A48F80;
    id v26 = v20;
    id v27 = v10;
    id v28 = v18;
    id v30 = v12;
    id v29 = v11;
    [v21 lockupProfilesForStoreIDs:v22 completion:v25];
  }
  else
  {
    id v23 = objc_retainBlock(v12);
    objc_super v24 = v23;
    if (v23) {
      (*((void (**)(id, id))v23 + 2))(v23, v18);
    }
  }
}

- (id)_futureViewControllerWithAssetID:(id)a3 options:(id)a4
{
  objc_super v4 = objc_opt_new();
  v5 = +[NSError errorWithDomain:@"com.apple.iBooks" code:0 userInfo:&off_100A834C8];
  [v4 set:0 error:v5];
  [v4 get:&stru_100A48FC0];

  return v4;
}

- (BCFutureValue)minifiedAssetPresenterAssetViewControllerFuture
{
  v3 = objc_opt_new();
  objc_super v4 = [(BKMinifiedStoreAssetPresenter *)self assetViewControllerFuture];

  if (!v4)
  {
    v5 = [(BKMinifiedStoreAssetPresenter *)self minifiedAssetPresenterAssetID];
    v6 = [(BKMinifiedStoreAssetPresenter *)self options];
    v7 = [(BKMinifiedStoreAssetPresenter *)self _futureViewControllerWithAssetID:v5 options:v6];
    [(BKMinifiedStoreAssetPresenter *)self setAssetViewControllerFuture:v7];
  }
  v8 = [(BKMinifiedStoreAssetPresenter *)self assetViewControllerFuture];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10017FDAC;
  v11[3] = &unk_100A48FE8;
  id v9 = v3;
  id v12 = v9;
  [v8 get:v11];

  return (BCFutureValue *)v9;
}

- (id)minifiedAssetPresenterLoadAssetBlock
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10017FE8C;
  v4[3] = &unk_100A49038;
  objc_copyWeak(&v5, &location);
  id v2 = [v4 copy];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (BOOL)minifiedAssetPresenterIsAudiobook
{
  return 1;
}

- (BOOL)minifiedAssetPresenterIsSupplementalContent
{
  return 0;
}

- (BOOL)minifiedAssetPresenterCanStayOpenInBackground
{
  return 1;
}

- (double)minifiedAssetPresenterMinibarHeight
{
  return 0.0;
}

- (double)minifiedAssetPresenterMinibarMaxWidth
{
  return 0.0;
}

- (double)minifiedAssetPresenterMinibarFloatingHorizontalOffset
{
  return 0.0;
}

- (double)minifiedAssetPresenterMinibarFloatingVerticalOffset
{
  return 0.0;
}

- (double)minifiedAssetPresenterMinibarCornerRadius
{
  return 0.0;
}

- (BOOL)minifiedAssetPresenterCanPresentAssetFromStoreTab
{
  return 1;
}

- (BOOL)minifiedAssetPresenterShouldAnimateOpenClose
{
  return 1;
}

- (AEAssetAudiobookStatus)minifiedAssetStatus
{
  id v2 = [(BKMinifiedStoreAssetPresenter *)self minifiedAssetPresenterMinifiedController];
  v3 = [v2 minifiedControllerStateConforminigToProtocol:&OBJC_PROTOCOL___AEAssetAudiobookStatus];

  return (AEAssetAudiobookStatus *)v3;
}

- (void)minifiedAssetPresenterDidOpenAssetMinified
{
  id v2 = [(BKMinifiedStoreAssetPresenter *)self touchVC];
  [v2 play];
}

- (void)minifiedAssetPresenterWillCloseAssetMinified
{
  id v4 = [(BKMinifiedStoreAssetPresenter *)self touchVC];
  v3 = [(BKMinifiedStoreAssetPresenter *)self minifiedAssetPresenterAssetID];
  [v4 ensureAudiobookNotPlayingWithAssetID:v3];
}

- (AEHelper)minifiedAssetPresenterAssetHelper
{
  return 0;
}

- (AEAssetMinifiedController)minifiedAssetPresenterMinifiedController
{
  return 0;
}

- (BOOL)minifiedAssetPresenterShouldAnimateFromMinibar
{
  return 0;
}

- (void)minifiedAssetPresenterPausePlayback
{
  id v2 = [(BKMinifiedStoreAssetPresenter *)self touchVC];
  [v2 pause];
}

- (void)minifiedAssetPresenterTogglePlayback
{
  id v2 = [(BKMinifiedStoreAssetPresenter *)self touchVC];
  [v2 togglePlayPause];
}

- (Class)assetPresentingViewControllerClass
{
  return (Class)objc_opt_class();
}

- (void)_unloadAssetViewController
{
  v3 = [(BKMinifiedStoreAssetPresenter *)self assetViewControllerFuture];
  [v3 cancel];

  [(BKMinifiedStoreAssetPresenter *)self setAssetViewControllerFuture:0];
}

- (void)minifiedControllerRequestClose:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = [(BKMinifiedStoreAssetPresenter *)self minifiedPresenter];
  [v6 minifiedPresenterClose:self error:v5 isRetry:0];
}

- (BKMinifiedPresenting)minifiedPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_minifiedPresenter);

  return (BKMinifiedPresenting *)WeakRetained;
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

- (NSDictionary)options
{
  return self->_options;
}

- (UIViewController)playerViewController
{
  return self->_playerViewController;
}

- (BFMAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (BKLibraryAsset)libraryAsset
{
  return self->_libraryAsset;
}

- (void)setLibraryAsset:(id)a3
{
}

- (AEAssetMinifiedController)minifiedController
{
  return self->_minifiedController;
}

- (void)setMinifiedController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minifiedController, 0);
  objc_storeStrong((id *)&self->_libraryAsset, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_assetViewControllerFuture, 0);
  objc_storeStrong((id *)&self->_minifiedAssetPresenterAssetID, 0);

  objc_destroyWeak((id *)&self->_minifiedPresenter);
}

@end