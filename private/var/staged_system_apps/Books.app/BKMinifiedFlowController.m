@interface BKMinifiedFlowController
- (BKCurrentBookProvider)currentBookProvider;
- (BKLibraryAssetProvider)libraryAssetProvider;
- (BKMinifiedAssetPresenting)audioBookAssetPresenter;
- (BKMinifiedAssetPresenting)currentBookAssetPresenter;
- (BKMinifiedFlowController)init;
- (BKMinifiedFlowControllerDelegate)delegate;
- (BKSceneHosting)sceneHosting;
- (BOOL)_assetIsPresentedOnAuxiliaryCanvas:(id)a3;
- (BOOL)_legacyMinibarBehavior;
- (BOOL)_presenterIsAudiobookPreview:(id)a3;
- (BOOL)_shouldHandleCurrentBookNotification:(id)a3;
- (BOOL)_shouldHideMinibar;
- (BOOL)isRTL;
- (BOOL)minibarVisible;
- (BOOL)minifiedPresenterCanOpenPresenter:(id)a3 overCurrentPresenter:(id)a4;
- (BOOL)removingHostedVC;
- (BOOL)shouldAnimateAssetWithAssetIDFromMinibar:(id)a3;
- (BOOL)shouldIgnoreCurrentBookNotifications;
- (Class)_audiobookMinifiedAssetPresenterClass;
- (Class)_storeAssetPresenterClass;
- (NSNotification)ignoredCurrentBookNotification;
- (NSSet)minifiedAssetPresenters;
- (UIView)minibarContainerView;
- (id)_currentAssetPresenters;
- (id)minifiedBarAnimatorMinibarView;
- (id)minifiedBarAnimatorTabBarView;
- (id)minifiedPresenterAssetCurrentPresenterForAssetID:(id)a3;
- (id)minifiedPresenterAssetCurrentPresenters;
- (id)minifiedPresenterAssetCurrentPresentersForAssetIDs:(id)a3;
- (id)minifiedPresenterBarButtonItem;
- (void)_cleanLastKnownCurrentBookIfNecessary:(id)a3;
- (void)_closeMinifiedPresenter:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_hideToolbarAnimated:(BOOL)a3 completion:(id)a4;
- (void)_layoutPresenterMinibar:(id)a3;
- (void)_layoutPresenterMinibar:(id)a3 visible:(BOOL)a4 viewController:(id)a5;
- (void)_notifyToolbars;
- (void)_recentBooksProviderChanged:(id)a3;
- (void)_setMinibarVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)activeRootBarKindDidChange;
- (void)contentSizeCategoryDidChange;
- (void)dealloc;
- (void)minifiedBarAnimatePrepareTransitionToViewController:(id)a3;
- (void)minifiedBarAnimatorAnimateHideIfNeededFromViewController:(id)a3;
- (void)minifiedBarAnimatorAnimateShowIfNeededToViewController:(id)a3 force:(BOOL)a4;
- (void)minifiedBarAnimatorFinalizeHideIfNeededToViewController:(id)a3;
- (void)minifiedBarAnimatorPrepareShowIfNeededToViewController:(id)a3;
- (void)minifiedPresenter:(id)a3 openStorePageForStoreID:(id)a4 fromViewController:(id)a5;
- (void)minifiedPresenterAddPresenter:(id)a3;
- (void)minifiedPresenterAssetPresenterForAssetIdentifier:(id)a3 options:(id)a4 completion:(id)a5;
- (void)minifiedPresenterAssetPresenterForStoreAsset:(id)a3 options:(id)a4 completion:(id)a5;
- (void)minifiedPresenterClose:(id)a3;
- (void)minifiedPresenterClose:(id)a3 completion:(id)a4;
- (void)minifiedPresenterClose:(id)a3 error:(id)a4 isRetry:(BOOL)a5;
- (void)minifiedPresenterDidCloseAssetID:(id)a3 finishedConsuming:(BOOL)a4;
- (void)minifiedPresenterDidOpenAssetID:(id)a3;
- (void)minifiedPresenterDidReloadAssetViewController:(id)a3;
- (void)minifiedPresenterOpenMinified:(id)a3;
- (void)minifiedPresenterPause:(id)a3;
- (void)minifiedPresenterPrepareToOpen:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)minifiedPresenterUpdateCurrentBookWithCompletion:(id)a3;
- (void)setAudioBookAssetPresenter:(id)a3;
- (void)setCurrentBookAssetPresenter:(id)a3;
- (void)setCurrentBookProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIgnoredCurrentBookNotification:(id)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setMinibarContainerView:(id)a3;
- (void)setMinibarVisible:(BOOL)a3;
- (void)setRemovingHostedVC:(BOOL)a3;
- (void)setSceneHosting:(id)a3;
- (void)setShouldIgnoreCurrentBookNotifications:(BOOL)a3;
- (void)toggleMinibarVisibility:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)visibleViewControllersUpdatedPostTranstionAnimated:(BOOL)a3;
- (void)visibleViewControllersUpdatedPreTranstionAnimated:(BOOL)a3;
@end

@implementation BKMinifiedFlowController

- (void)visibleViewControllersUpdatedPreTranstionAnimated:(BOOL)a3
{
  if ([(BKMinifiedFlowController *)self _shouldHideMinibar])
  {
    v4 = [(BKMinifiedFlowController *)self minibarContainerView];
    unsigned __int8 v5 = [v4 isHidden];

    if ((v5 & 1) == 0)
    {
      id v6 = [(BKMinifiedFlowController *)self minibarContainerView];
      [v6 setHidden:1];
    }
  }
}

- (BOOL)shouldIgnoreCurrentBookNotifications
{
  return self->_shouldIgnoreCurrentBookNotifications;
}

- (void)setShouldIgnoreCurrentBookNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldIgnoreCurrentBookNotifications = a3;
  unsigned __int8 v5 = BCCurrentBookLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Begin ignoring current book update notifications.", buf, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "End ignoring current book update notifications.", v9, 2u);
    }

    v7 = [(BKMinifiedFlowController *)self ignoredCurrentBookNotification];

    if (v7)
    {
      v8 = [(BKMinifiedFlowController *)self ignoredCurrentBookNotification];
      [(BKMinifiedFlowController *)self _recentBooksProviderChanged:v8];

      [(BKMinifiedFlowController *)self setIgnoredCurrentBookNotification:0];
    }
  }
}

- (void)setSceneHosting:(id)a3
{
}

- (void)setIgnoredCurrentBookNotification:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (UIView)minibarContainerView
{
  return self->_minibarContainerView;
}

- (BKMinifiedFlowController)init
{
  v11.receiver = self;
  v11.super_class = (Class)BKMinifiedFlowController;
  v2 = [(BKMinifiedFlowController *)&v11 init];
  if (v2)
  {
    BOOL v3 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 100.0, 0.0];
    minibarContainerView = v2->_minibarContainerView;
    v2->_minibarContainerView = v3;

    [(UIView *)v2->_minibarContainerView setClipsToBounds:1];
    unsigned __int8 v5 = +[UIApplication sharedApplication];
    v2->_isRTL = [v5 userInterfaceLayoutDirection] == (id)1;

    BOOL v6 = objc_alloc_init(BKCurrentBookProvider);
    currentBookProvider = v2->_currentBookProvider;
    v2->_currentBookProvider = v6;

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_recentBooksProviderChanged:" name:@"BKRecentBooksProviderDidChangeNotification" object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];

    v2->_shouldIgnoreCurrentBookNotifications = 1;
  }
  return v2;
}

- (NSNotification)ignoredCurrentBookNotification
{
  return self->_ignoredCurrentBookNotification;
}

- (BKMinifiedFlowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKMinifiedFlowControllerDelegate *)WeakRetained;
}

- (BKCurrentBookProvider)currentBookProvider
{
  return self->_currentBookProvider;
}

- (BOOL)_shouldHideMinibar
{
  v2 = [(BKMinifiedFlowController *)self delegate];
  BOOL v3 = [v2 minifiedFlowControllerMinibarContainingViewController];
  v4 = [v3 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BKMinifiedBarVisibilityStyling];

  LOBYTE(v2) = [v4 minifiedBarVisibilityStyleIsHidden];
  return (char)v2;
}

- (BOOL)_shouldHandleCurrentBookNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(BKMinifiedFlowController *)self delegate];
  BOOL v6 = [v5 minifiedFlowControllerPresentedAssetID:self];

  if ([(BKMinifiedFlowController *)self shouldIgnoreCurrentBookNotifications])
  {
    v7 = BCCurrentBookLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      __int16 v16 = 0;
      v8 = "Ignoring recent books provider notification during book open.";
      v9 = (uint8_t *)&v16;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if ([v6 length] || !objc_msgSend(v4, "length"))
  {
    id v10 = [v4 length];
    v7 = BCCurrentBookLog();
    BOOL v11 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v11)
      {
        __int16 v14 = 0;
        v8 = "We currently have a presented asset, skipping current book logic.";
        v9 = (uint8_t *)&v14;
        goto LABEL_12;
      }
    }
    else if (v11)
    {
      *(_WORD *)buf = 0;
      v8 = "No asset provided so no current book set up.";
      v9 = buf;
      goto LABEL_12;
    }
LABEL_13:

    BOOL v12 = 0;
    goto LABEL_14;
  }
  BOOL v12 = 1;
LABEL_14:

  return v12;
}

- (void)_recentBooksProviderChanged:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  unsigned __int8 v5 = [v4 userInfo];
  BOOL v6 = [v5 objectForKeyedSubscript:@"BKRecentBooksProviderAssetsKey"];
  v7 = BUDynamicCast();

  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100019424;
  v10[3] = &unk_100A43FB8;
  objc_copyWeak(&v13, &location);
  id v11 = v7;
  id v12 = v4;
  id v8 = v4;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_cleanLastKnownCurrentBookIfNecessary:(id)a3
{
  id v3 = a3;
  id v4 = +[BKBasePresentingViewController lastKnownSuccessfullyOpenBookID];
  if ([v4 length])
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    char v16 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000B4320;
    v12[3] = &unk_100A44E10;
    id v5 = v4;
    id v13 = v5;
    __int16 v14 = v15;
    [v3 enumerateObjectsUsingBlock:v12];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000B4384;
    v9[3] = &unk_100A44170;
    id v10 = v5;
    id v11 = v15;
    BOOL v6 = objc_retainBlock(v9);
    if (v6)
    {
      if (+[NSThread isMainThread])
      {
        ((void (*)(void *))v6[2])(v6);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000B444C;
        block[3] = &unk_100A442B8;
        id v8 = v6;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }

    _Block_object_dispose(v15, 8);
  }
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"BKRecentBooksProviderDidChangeNotification" object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)BKMinifiedFlowController;
  [(BKMinifiedFlowController *)&v5 dealloc];
}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  v2 = +[BKAppDelegate delegate];
  id v3 = [v2 libraryAssetProvider];

  return (BKLibraryAssetProvider *)v3;
}

- (void)minifiedPresenterAssetPresenterForStoreAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  id v11 = [v10 minifiedAssetPresenterAssetID];
  id v12 = [v23 id];
  unsigned int v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    __int16 v14 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
    v15 = BUProtocolCast();

    if (v15) {
      goto LABEL_5;
    }
  }
  char v16 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
  v17 = [v16 minifiedAssetPresenterAssetID];
  v18 = [v23 id];
  unsigned int v19 = [v17 isEqualToString:v18];

  if (!v19) {
    goto LABEL_8;
  }
  v20 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
  v15 = BUProtocolCast();

  if (v15)
  {
LABEL_5:
    v21 = (void (**)(id, void *))objc_retainBlock(v9);
    if (v21)
    {
      v22 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
      v21[2](v21, v22);
    }
  }
  else
  {
LABEL_8:
    [(objc_class *)[(BKMinifiedFlowController *)self _storeAssetPresenterClass] minimizedPresenterWithAsset:v23 options:v8 presenter:self completion:v9];
  }
}

- (Class)_audiobookMinifiedAssetPresenterClass
{
  return (Class)objc_opt_class();
}

- (void)minifiedPresenterAssetPresenterForAssetIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = BCCurrentBookLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 138412290;
    id v33 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "minifiedPresenterAssetPresenterForAssetIdentifier assetID=%{masked.hash}@", (uint8_t *)&v32, 0xCu);
  }

  id v12 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  unsigned int v13 = [v12 minifiedAssetPresenterAssetID];
  __int16 v14 = [v8 permanentOrTemporaryAssetID];
  unsigned int v15 = [v13 isEqualToString:v14];

  if (v15)
  {
    char v16 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
    v17 = BUProtocolCast();

    if (v17) {
      goto LABEL_7;
    }
  }
  v18 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
  unsigned int v19 = [v18 minifiedAssetPresenterAssetID];
  v20 = [v8 permanentOrTemporaryAssetID];
  unsigned int v21 = [v19 isEqualToString:v20];

  if (!v21) {
    goto LABEL_10;
  }
  v22 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
  v17 = BUProtocolCast();

  if (v17)
  {
LABEL_7:
    id v23 = objc_retainBlock(v10);
    v24 = v23;
    if (v23) {
      (*((void (**)(id, void *))v23 + 2))(v23, v17);
    }
  }
  else
  {
LABEL_10:
    v25 = [(BKMinifiedFlowController *)self libraryAssetProvider];

    if (v25)
    {
      v26 = BCCurrentBookLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138412290;
        id v33 = v8;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "minifiedPresenterAssetPresenterForAssetIdentifier assetID=%{masked.hash}@ requesting for libraryAsset", (uint8_t *)&v32, 0xCu);
      }

      v27 = [(BKMinifiedFlowController *)self libraryAssetProvider];
      v17 = [v27 libraryAssetOnMainQueueWithAssetIdentifier:v8];

      if ([v17 isAudiobook]) {
        v28 = [(BKMinifiedFlowController *)self _audiobookMinifiedAssetPresenterClass];
      }
      else {
        v28 = (objc_class *)objc_opt_class();
      }
      v30 = v28;
      v31 = BCCurrentBookLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138412290;
        id v33 = v8;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "minifiedPresenterAssetPresenterForAssetIdentifier assetID=%{masked.hash}@ requesting minified asset presenter for libraryAsset", (uint8_t *)&v32, 0xCu);
      }

      [(objc_class *)v30 minimizedPresenterWithLibraryAsset:v17 options:v9 presenter:self completion:v10];
    }
    else
    {
      id v29 = objc_retainBlock(v10);
      v17 = v29;
      if (v29) {
        (*((void (**)(id, void))v29 + 2))(v29, 0);
      }
    }
  }
}

- (id)minifiedPresenterAssetCurrentPresenterForAssetID:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  BOOL v6 = [v5 minifiedAssetPresenterAssetID];
  unsigned int v7 = [v6 isEqualToString:v4];

  if (v7)
  {
    uint64_t v8 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
LABEL_5:
    id v12 = (void *)v8;
    goto LABEL_7;
  }
  id v9 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
  id v10 = [v9 minifiedAssetPresenterAssetID];
  unsigned int v11 = [v10 isEqualToString:v4];

  if (v11)
  {
    uint64_t v8 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
    goto LABEL_5;
  }
  id v12 = 0;
LABEL_7:

  return v12;
}

- (id)minifiedPresenterAssetCurrentPresentersForAssetIDs:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSMutableSet set];
  uint64_t v6 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  if (v6)
  {
    unsigned int v7 = (void *)v6;
    uint64_t v8 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
    id v9 = [v8 minifiedAssetPresenterAssetID];
    unsigned int v10 = [v4 containsObject:v9];

    if (v10)
    {
      unsigned int v11 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
      [v5 addObject:v11];
    }
  }
  uint64_t v12 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
  if (v12)
  {
    unsigned int v13 = (void *)v12;
    __int16 v14 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
    unsigned int v15 = [v14 minifiedAssetPresenterAssetID];
    unsigned int v16 = [v4 containsObject:v15];

    if (v16)
    {
      v17 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
      [v5 addObject:v17];
    }
  }
  id v18 = [v5 copy];

  return v18;
}

- (id)minifiedPresenterAssetCurrentPresenters
{
  id v3 = +[NSMutableSet set];
  id v4 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];

  if (v4)
  {
    objc_super v5 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
    [v3 addObject:v5];
  }
  uint64_t v6 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];

  if (v6)
  {
    unsigned int v7 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
    [v3 addObject:v7];
  }
  id v8 = [v3 copy];

  return v8;
}

- (void)minifiedPresenterPrepareToOpen:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  unsigned int v10 = [(BKMinifiedFlowController *)self minifiedAssetPresenters];
  id v11 = [v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v46;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v10);
        }
        __int16 v14 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (([v14 minifiedAssetPresenterIsAudiobook] & 1) == 0)
        {
          id v11 = v14;
          goto LABEL_11;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if ([(BKMinifiedFlowController *)self _presenterIsAudiobookPreview:v8])
  {
    uint64_t v15 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
    if (v15)
    {
      unsigned int v16 = (void *)v15;
      unsigned int v17 = [v8 minifiedAssetPresenterIsAudiobook];

      if (v17)
      {
        id v18 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
        unsigned int v19 = [v18 minifiedAssetPresenterAssetID];
        v20 = [v8 minifiedAssetPresenterAssetID];
        unsigned int v21 = [v19 isEqual:v20];

        if (v21)
        {
          v22 = +[BKAppDelegate sceneManager];
          id v23 = [v22 primarySceneController];
          v24 = [v23 rootBarCoordinator];

          [v24 presentFullPlayerWithCompletion:0];
        }
        else
        {
          id v38 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];

          if (v38 == v8) {
            goto LABEL_19;
          }
          v24 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
          [v24 minifiedAssetPresenterPausePlayback];
        }

LABEL_19:
        id v27 = objc_retainBlock(v9);
        v28 = v27;
        if (v27) {
          (*((void (**)(id))v27 + 2))(v27);
        }
        goto LABEL_21;
      }
    }
  }
  v25 = [v11 minifiedAssetPresenterAssetID];
  v26 = [v8 minifiedAssetPresenterAssetID];
  if (![v25 isEqualToString:v26]
    || ([v11 minifiedAssetPresenterCanStayOpenInBackground] & 1) != 0)
  {

    goto LABEL_19;
  }
  unsigned __int8 v29 = [v8 minifiedAssetPresenterIsAudiobook];

  if (v29) {
    goto LABEL_19;
  }
  BOOL v39 = v6;
  id v40 = v9;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v30 = [(BKMinifiedFlowController *)self minifiedAssetPresenters];
  id v31 = [v30 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v42;
    while (2)
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = [*(id *)(*((void *)&v41 + 1) + 8 * (void)j) minifiedAssetPresenterAssetID];
        v36 = [v8 minifiedAssetPresenterAssetID];
        unsigned __int8 v37 = [v35 isEqualToString:v36];

        if (v37)
        {

          id v9 = v40;
          goto LABEL_19;
        }
      }
      id v32 = [v30 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v32) {
        continue;
      }
      break;
    }
  }

  v28 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
  id v9 = v40;
  [(BKMinifiedFlowController *)self _closeMinifiedPresenter:v28 animated:v39 completion:v40];
LABEL_21:
}

- (Class)_storeAssetPresenterClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_presenterIsAudiobookPreview:(id)a3
{
  id v4 = a3;
  [(BKMinifiedFlowController *)self _storeAssetPresenterClass];
  LOBYTE(self) = objc_opt_isKindOfClass();

  return self & 1;
}

- (void)minifiedPresenterOpenMinified:(id)a3
{
  id v4 = a3;
  -[BKMinifiedFlowController setMinibarVisible:](self, "setMinibarVisible:", [v4 minifiedAssetPresenterShouldAnimateOpenClose] ^ 1);
  [(BKMinifiedFlowController *)self minifiedPresenterOpen:v4];
}

- (void)minifiedPresenterAddPresenter:(id)a3
{
  id v4 = a3;
  id v5 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  BOOL v6 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
  if (v5 != v4 && [v4 minifiedAssetPresenterIsAudiobook])
  {
    [(BKMinifiedFlowController *)self willChangeValueForKey:@"minifiedAssetPresenters"];
    id v7 = [(NSSet *)self->_minifiedAssetPresenters mutableCopy];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = +[NSMutableSet set];
    }
    unsigned int v10 = v9;

    unsigned int v16 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
    unsigned int v17 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];

    if (v16 == v17) {
      [(BKMinifiedFlowController *)self setCurrentBookAssetPresenter:0];
    }
    [(BKMinifiedFlowController *)self setAudioBookAssetPresenter:v4];
    if (v5)
    {
      [v10 removeObject:v5];
      id v18 = BCCurrentBookLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v67 = 136446466;
        *(void *)&v67[4] = "-[BKMinifiedFlowController minifiedPresenterAddPresenter:]";
        *(_WORD *)&v67[12] = 2112;
        *(void *)&v67[14] = v5;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s: Removing minified asset presenter %@", v67, 0x16u);
      }

      [v5 minifiedAssetPresenterWillCloseAssetMinified];
      if ([(BKMinifiedFlowController *)self _legacyMinibarBehavior])
      {
        unsigned int v19 = [v5 minifiedAssetPresenterMinibar];
        [v19 willMoveToParentViewController:0];

        v20 = [v5 minifiedAssetPresenterMinibar];
        unsigned int v21 = [v20 view];
        [v21 removeFromSuperview];

        v22 = [v5 minifiedAssetPresenterMinibar];
        [v22 removeFromParentViewController];
      }
      [v5 minifiedAssetPresenterDidCloseAssetMinified];
    }
    uint64_t v23 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
    if (v23)
    {
      v24 = (void *)v23;
      v25 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
      unsigned __int8 v26 = [v25 minifiedAssetPresenterCanStayOpenInBackground];

      if ((v26 & 1) == 0)
      {
        id v27 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
        [v10 removeObject:v27];

        v28 = BCCurrentBookLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v29 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
          *(_DWORD *)v67 = 136446466;
          *(void *)&v67[4] = "-[BKMinifiedFlowController minifiedPresenterAddPresenter:]";
          *(_WORD *)&v67[12] = 2112;
          *(void *)&v67[14] = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}s: Removing minified asset presenter %@", v67, 0x16u);
        }
        v30 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
        [v30 minifiedAssetPresenterWillCloseAssetMinified];

        id v31 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
        id v32 = [v31 minifiedAssetPresenterMinibar];
        [v32 willMoveToParentViewController:0];

        uint64_t v33 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
        v34 = [v33 minifiedAssetPresenterMinibar];
        v35 = [v34 view];
        [v35 removeFromSuperview];

        v36 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
        unsigned __int8 v37 = [v36 minifiedAssetPresenterMinibar];
        [v37 removeFromParentViewController];

        id v38 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
        [v38 minifiedAssetPresenterDidCloseAssetMinified];
      }
    }
    [(BKMinifiedFlowController *)self setCurrentBookAssetPresenter:v4];
    BOOL v39 = [(BKMinifiedFlowController *)self minibarContainerView];
    [v39 setHidden:0];

    if (!v4) {
      goto LABEL_55;
    }
    [v10 addObject:v4];
    id v40 = BCCurrentBookLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v67 = 136446466;
      *(void *)&v67[4] = "-[BKMinifiedFlowController minifiedPresenterAddPresenter:]";
      *(_WORD *)&v67[12] = 2112;
      *(void *)&v67[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}s: Adding minified asset presenter %@", v67, 0x16u);
    }

    [v4 minifiedAssetPresenterWillOpenAssetMinified];
    long long v41 = [v4 minifiedAssetPresenterMinibar];
    if (v41)
    {
      long long v42 = +[BKAppDelegate sceneManager];
      long long v43 = [v42 primarySceneController];
      long long v44 = [v43 rootBarCoordinator];

      objc_opt_class();
      uint64_t v45 = BUDynamicCast();
      long long v46 = (void *)v45;
      if (v44)
      {
        if (v45)
        {
          long long v47 = [v44 miniPlayerViewController];

          if (!v47) {
            [v44 dockMiniPlayer:v46];
          }
        }
      }
    }
    unsigned int v48 = [v4 minifiedAssetPresenterShouldAnimateOpenClose];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v49 = [v4 minifiedAssetPresenterToolbar];
      if (v49)
      {
        v50 = (void *)v49;
        v51 = [(BKMinifiedFlowController *)self delegate];
        [v51 minifiedFlowControllerDock:v50];

LABEL_54:
        [v4 minifiedAssetPresenterDidOpenAssetMinified];

        goto LABEL_55;
      }
    }
    v52 = self;
    if (v48)
    {
      [(BKMinifiedFlowController *)self _setMinibarVisible:1 animated:1 completion:0];
      goto LABEL_54;
    }
LABEL_53:
    [(BKMinifiedFlowController *)v52 _layoutPresenterMinibar:v4];
    goto LABEL_54;
  }
  unsigned int v10 = [v4 minifiedAssetPresenterAssetID];
  id v11 = [v6 minifiedAssetPresenterAssetID];
  if ([v10 isEqualToString:v11])
  {
LABEL_58:

    goto LABEL_59;
  }
  unsigned __int8 v12 = [v4 minifiedAssetPresenterIsAudiobook];

  if ((v12 & 1) == 0)
  {
    [(BKMinifiedFlowController *)self willChangeValueForKey:@"minifiedAssetPresenters"];
    id v13 = [(NSSet *)self->_minifiedAssetPresenters mutableCopy];
    __int16 v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = +[NSMutableSet set];
    }
    unsigned int v10 = v15;

    if (!v6 || ([v6 minifiedAssetPresenterCanStayOpenInBackground] & 1) != 0) {
      goto LABEL_47;
    }
    v53 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];

    if (v6 == v53)
    {
      v54 = BCCurrentBookLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v67 = 136446466;
        *(void *)&v67[4] = "-[BKMinifiedFlowController minifiedPresenterAddPresenter:]";
        *(_WORD *)&v67[12] = 2112;
        *(void *)&v67[14] = v6;
        v55 = "%{public}s: Keeping minified audio book asset presenter %@";
        goto LABEL_45;
      }
    }
    else
    {
      [v10 removeObject:v6];
      v54 = BCCurrentBookLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v67 = 136446466;
        *(void *)&v67[4] = "-[BKMinifiedFlowController minifiedPresenterAddPresenter:]";
        *(_WORD *)&v67[12] = 2112;
        *(void *)&v67[14] = v6;
        v55 = "%{public}s: Removing minified asset presenter %@";
LABEL_45:
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, v55, v67, 0x16u);
      }
    }

    [v6 minifiedAssetPresenterWillCloseAssetMinified];
    v56 = [v6 minifiedAssetPresenterMinibar];
    [v56 removeFromParentViewController];

    v57 = [v6 minifiedAssetPresenterMinibar];
    v58 = [v57 view];
    [v58 removeFromSuperview];

    [v6 minifiedAssetPresenterDidCloseAssetMinified];
LABEL_47:
    -[BKMinifiedFlowController setCurrentBookAssetPresenter:](self, "setCurrentBookAssetPresenter:", v4, *(_OWORD *)v67, *(void *)&v67[16]);
    if (!v4)
    {
LABEL_55:
      v65 = (NSSet *)[v10 count];
      if (v65) {
        v65 = (NSSet *)[v10 copy];
      }
      minifiedAssetPresenters = self->_minifiedAssetPresenters;
      self->_minifiedAssetPresenters = v65;

      [(BKMinifiedFlowController *)self didChangeValueForKey:@"minifiedAssetPresenters"];
      id v11 = +[NSNotificationCenter defaultCenter];
      [v11 postNotificationName:@"BKMnifiedPresentersUpdatedNotification" object:self];
      goto LABEL_58;
    }
    [v10 addObject:v4];
    v59 = BCCurrentBookLog();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v67 = 136446466;
      *(void *)&v67[4] = "-[BKMinifiedFlowController minifiedPresenterAddPresenter:]";
      *(_WORD *)&v67[12] = 2112;
      *(void *)&v67[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%{public}s: Adding minified asset presenter %@", v67, 0x16u);
    }

    [v4 minifiedAssetPresenterWillOpenAssetMinified];
    long long v41 = [v4 minifiedAssetPresenterMinibar];
    if (v41)
    {
      v60 = [(BKMinifiedFlowController *)self delegate];
      v61 = [v60 minifiedFlowControllerMinibarContainingViewController];
      [v61 addChildViewController:v41];

      v62 = [v41 view];
      [v62 setAutoresizingMask:0];

      v63 = [(BKMinifiedFlowController *)self minibarContainerView];
      v64 = [v41 view];
      [v63 addSubview:v64];
    }
    v52 = self;
    goto LABEL_53;
  }
LABEL_59:
}

- (void)minifiedPresenter:(id)a3 openStorePageForStoreID:(id)a4 fromViewController:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(BKMinifiedFlowController *)self delegate];
  [v9 minifiedFlowControllerRequestShowStoreForStoreID:v8 fromViewController:v7];
}

- (void)minifiedPresenterClose:(id)a3 error:(id)a4 isRetry:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = [v8 minifiedAssetPresenterAssetID];
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B20E4;
  v13[3] = &unk_100A44CE0;
  objc_copyWeak(&v16, &location);
  id v11 = v9;
  id v14 = v11;
  id v12 = v10;
  id v15 = v12;
  BOOL v17 = a5;
  [(BKMinifiedFlowController *)self _closeMinifiedPresenter:v8 animated:1 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)minifiedPresenterClose:(id)a3
{
}

- (void)minifiedPresenterClose:(id)a3 completion:(id)a4
{
}

- (void)minifiedPresenterPause:(id)a3
{
  id v3 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  [v3 minifiedAssetPresenterPausePlayback];
}

- (void)_closeMinifiedPresenter:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [v7 minifiedAssetPresenterMinibar];
  objc_initWeak(&location, self);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000B2784;
  v50[3] = &unk_100A44D08;
  id v10 = v7;
  id v51 = v10;
  v52 = self;
  id v11 = v9;
  id v53 = v11;
  objc_copyWeak(&v54, &location);
  id v12 = objc_retainBlock(v50);
  id v13 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  id v14 = [v13 minifiedAssetPresenterAssetID];
  id v15 = [v10 minifiedAssetPresenterAssetID];
  unsigned int v16 = [v14 isEqualToString:v15];

  id v17 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];

  unsigned int v18 = [(BKMinifiedFlowController *)self _presenterIsAudiobookPreview:v10];
  if (v17 == v10) {
    int v19 = 1;
  }
  else {
    int v19 = v18;
  }
  if ((v16 & v19) == 1)
  {
    if (objc_opt_respondsToSelector())
    {
      [(BKMinifiedFlowController *)self _hideToolbarAnimated:0 completion:v8];
    }
    else
    {
      unsigned __int8 v29 = +[BKAppDelegate sceneManager];
      v30 = [v29 primarySceneController];
      id v31 = [v30 rootBarCoordinator];
      [v31 undockMiniPlayer];

      id v32 = objc_retainBlock(v8);
      uint64_t v33 = v32;
      if (v32) {
        (*((void (**)(id))v32 + 2))(v32);
      }
    }
    [(BKMinifiedFlowController *)self setAudioBookAssetPresenter:0];
    id v34 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
    BOOL v35 = v34 == v10;

    if (v35) {
      [(BKMinifiedFlowController *)self setCurrentBookAssetPresenter:0];
    }
    [(BKMinifiedFlowController *)self willChangeValueForKey:@"minifiedAssetPresenters"];
    id v36 = [(NSSet *)self->_minifiedAssetPresenters mutableCopy];
    unsigned __int8 v37 = v36;
    if (v36)
    {
      id v38 = v36;
    }
    else
    {
      id v38 = +[NSMutableSet set];
    }
    id v40 = v38;

    [v40 removeObject:v10];
    long long v41 = BCCurrentBookLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v57 = "-[BKMinifiedFlowController _closeMinifiedPresenter:animated:completion:]";
      __int16 v58 = 2112;
      id v59 = v10;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}s: Removing minified asset presenter %@", buf, 0x16u);
    }

    long long v42 = (NSSet *)[v40 count];
    if (v42) {
      long long v42 = (NSSet *)[v40 copy];
    }
    minifiedAssetPresenters = self->_minifiedAssetPresenters;
    self->_minifiedAssetPresenters = v42;

    [(BKMinifiedFlowController *)self didChangeValueForKey:@"minifiedAssetPresenters"];
    long long v44 = +[NSNotificationCenter defaultCenter];
    [v44 postNotificationName:@"BKMnifiedPresentersUpdatedNotification" object:self];

    goto LABEL_34;
  }
  v20 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
  unsigned int v21 = [v20 minifiedAssetPresenterAssetID];
  v22 = [v10 minifiedAssetPresenterAssetID];
  unsigned int v23 = [v21 isEqualToString:v22];

  if (!v23)
  {
    [(BKMinifiedFlowController *)self _notifyToolbars];
    ((void (*)(void *))v12[2])(v12);
    id v39 = objc_retainBlock(v8);
    id v40 = v39;
    if (!v39) {
      goto LABEL_34;
    }
LABEL_33:
    (*((void (**)(id))v39 + 2))(v39);
    goto LABEL_34;
  }
  [(BKMinifiedFlowController *)self setCurrentBookAssetPresenter:0];
  id v24 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  BOOL v25 = v24 == v10;

  if (!v25)
  {
    [(BKMinifiedFlowController *)self willChangeValueForKey:@"minifiedAssetPresenters"];
    id v26 = [(NSSet *)self->_minifiedAssetPresenters mutableCopy];
    id v27 = v26;
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      id v28 = +[NSMutableSet set];
    }
    uint64_t v45 = v28;

    [v45 removeObject:v10];
    long long v46 = BCCurrentBookLog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v57 = "-[BKMinifiedFlowController _closeMinifiedPresenter:animated:completion:]";
      __int16 v58 = 2112;
      id v59 = v10;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}s: Removing minified asset presenter %@", buf, 0x16u);
    }

    long long v47 = (NSSet *)[v45 count];
    if (v47) {
      long long v47 = (NSSet *)[v45 copy];
    }
    unsigned int v48 = self->_minifiedAssetPresenters;
    self->_minifiedAssetPresenters = v47;

    [(BKMinifiedFlowController *)self didChangeValueForKey:@"minifiedAssetPresenters"];
  }
  ((void (*)(void *))v12[2])(v12);
  uint64_t v49 = +[NSNotificationCenter defaultCenter];
  [v49 postNotificationName:@"BKMnifiedPresentersUpdatedNotification" object:self];

  id v39 = objc_retainBlock(v8);
  id v40 = v39;
  if (v39) {
    goto LABEL_33;
  }
LABEL_34:

  objc_destroyWeak(&v54);
  objc_destroyWeak(&location);
}

- (void)minifiedPresenterDidOpenAssetID:(id)a3
{
  id v12 = a3;
  id v4 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  id v5 = [v4 minifiedAssetPresenterAssetID];
  unsigned int v6 = [v5 isEqualToString:v12];

  if (v6)
  {
    id v7 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
    [v7 minifiedAssetPresenterDidOpenAssetFully];

    [(BKMinifiedFlowController *)self _setMinibarVisible:0 animated:1 completion:0];
  }
  else
  {
    id v8 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
    id v9 = [v8 minifiedAssetPresenterAssetID];
    unsigned int v10 = [v9 isEqualToString:v12];

    if (v10)
    {
      id v11 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
      [v11 minifiedAssetPresenterDidOpenAssetFully];
    }
  }
}

- (void)minifiedPresenterDidReloadAssetViewController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 asset];
  unsigned int v6 = [v5 assetID];

  id v7 = [(BKMinifiedFlowController *)self minifiedAssetPresenters];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000B2A20;
  v10[3] = &unk_100A44D30;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  [v7 enumerateObjectsUsingBlock:v10];
}

- (BOOL)_assetIsPresentedOnAuxiliaryCanvas:(id)a3
{
  id v4 = a3;
  id v5 = [(BKMinifiedFlowController *)self sceneHosting];
  unsigned int v6 = [v5 sceneInfoPresentingAssetID:v4];

  objc_opt_class();
  id v7 = [v6 sceneController];
  id v8 = BUDynamicCast();

  if (v8 && [v8 sceneType] != (id)1)
  {
    unsigned int v10 = [v8 rootBarCoordinator];
    BOOL v9 = v10 == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)minifiedPresenterUpdateCurrentBookWithCompletion:(id)a3
{
  id v4 = a3;
  [(BKMinifiedFlowController *)self setCurrentBookAssetPresenter:0];
  id v6 = objc_retainBlock(v4);

  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    id v5 = v6;
  }
}

- (void)minifiedPresenterDidCloseAssetID:(id)a3 finishedConsuming:(BOOL)a4
{
  id v6 = a3;
  if (!self->_removingHostedVC)
  {
    id v7 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
    id v8 = [v7 minifiedAssetPresenterAssetID];
    unsigned int v9 = [v8 isEqualToString:v6];

    if (v9)
    {
      unsigned int v10 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
      [v10 minifiedAssetPresenterDidCloseAssetFully];

      if (!a4) {
        [(BKMinifiedFlowController *)self _setMinibarVisible:1 animated:1 completion:0];
      }
    }
    id v11 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
    id v12 = [v11 minifiedAssetPresenterAssetID];
    unsigned int v13 = [v12 isEqualToString:v6];

    if (v13)
    {
      id v14 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
      id v15 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];

      if (v14 == v15)
      {
        unsigned int v16 = +[BKBasePresentingViewController lastKnownSuccessfullyOpenBookID];
      }
      else
      {
        unsigned int v16 = +[BKBasePresentingViewController lastKnownSuccessfullyOpenedCurrentBookID];
        if (!v16)
        {
          unsigned int v16 = +[BKBasePresentingViewController lastKnownOpenedCurrentBookID];
          id v17 = BCCurrentBookLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v52) = v16 != 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Last opened current books was not successful, Has it been opened recently?: %d", buf, 8u);
          }
        }
      }
      if ([v6 isEqualToString:v16]
        && !+[BKSceneUtilities hasMultiWindowEnabled])
      {
        long long v44 = BCCurrentBookLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Closing current books presented VC. Keeping minified.", buf, 2u);
        }

        id v34 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
        [v34 minifiedAssetPresenterDidCloseAssetFully];
      }
      else
      {
        id v38 = BCCurrentBookLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v16;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Closing non-current book presented VC. Show previous current book %@.", buf, 0xCu);
        }

        id v34 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
        [(BKMinifiedFlowController *)self setCurrentBookAssetPresenter:0];
        id v39 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];

        if (v34 != v39)
        {
          [(BKMinifiedFlowController *)self willChangeValueForKey:@"minifiedAssetPresenters"];
          id v40 = [(NSSet *)self->_minifiedAssetPresenters mutableCopy];
          [v40 removeObject:v34];
          long long v41 = BCCurrentBookLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v52 = "-[BKMinifiedFlowController minifiedPresenterDidCloseAssetID:finishedConsuming:]";
            __int16 v53 = 2112;
            id v54 = v34;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}s: Removing minified asset presenter %@", buf, 0x16u);
          }

          long long v42 = (NSSet *)[v40 count];
          if (v42) {
            long long v42 = (NSSet *)[v40 copy];
          }
          minifiedAssetPresenters = self->_minifiedAssetPresenters;
          self->_minifiedAssetPresenters = v42;

          [(BKMinifiedFlowController *)self didChangeValueForKey:@"minifiedAssetPresenters"];
        }
      }
LABEL_50:

      goto LABEL_51;
    }
    uint64_t v18 = [(BKMinifiedFlowController *)self currentBookAssetPresenter];
    if (!v18
      || (int v19 = (void *)v18,
          unsigned int v20 = +[BKSceneUtilities hasMultiWindowEnabled],
          v19,
          v20))
    {
      unsigned int v21 = BCCurrentBookLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v52 = (const char *)v6;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Closing book but we have no current presenter. Removing presenter with matching assetID (%@).", buf, 0xCu);
      }

      [(BKMinifiedFlowController *)self willChangeValueForKey:@"minifiedAssetPresenters"];
      id v22 = [(NSSet *)self->_minifiedAssetPresenters mutableCopy];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      unsigned int v16 = (char *)v22;
      id v23 = [v16 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v47;
        id v45 = v6;
LABEL_17:
        id v26 = 0;
        while (1)
        {
          if (*(void *)v47 != v25) {
            objc_enumerationMutation(v16);
          }
          id v27 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v26);
          id v28 = [v27 minifiedAssetPresenterAssetID];
          if ([v28 isEqualToString:v6])
          {
            [(BKMinifiedFlowController *)self audioBookAssetPresenter];
            unsigned __int8 v29 = self;
            id v31 = v30 = v16;
            id v32 = [v31 minifiedAssetPresenterAssetID];
            unsigned int v33 = [v32 isEqualToString:v6];

            unsigned int v16 = v30;
            self = v29;

            if (!v33)
            {
              id v34 = v27;

              id v6 = v45;
              if (!v34) {
                goto LABEL_30;
              }
              [v16 removeObject:v34];
              BOOL v35 = BCCurrentBookLog();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446466;
                v52 = "-[BKMinifiedFlowController minifiedPresenterDidCloseAssetID:finishedConsuming:]";
                __int16 v53 = 2112;
                id v54 = v34;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}s: Removing minified asset presenter %@", buf, 0x16u);
              }
              goto LABEL_33;
            }
          }
          else
          {
          }
          id v26 = (char *)v26 + 1;
          id v6 = v45;
          if (v24 == v26)
          {
            id v24 = [v16 countByEnumeratingWithState:&v46 objects:v50 count:16];
            if (v24) {
              goto LABEL_17;
            }
            break;
          }
        }
      }

LABEL_30:
      BOOL v35 = BCCurrentBookLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_1007E80D4((uint64_t)v6, v35);
      }
      id v34 = 0;
LABEL_33:

      id v36 = (NSSet *)[v16 count];
      if (v36) {
        id v36 = (NSSet *)[v16 copy];
      }
      unsigned __int8 v37 = self->_minifiedAssetPresenters;
      self->_minifiedAssetPresenters = v36;

      [(BKMinifiedFlowController *)self didChangeValueForKey:@"minifiedAssetPresenters"];
      goto LABEL_50;
    }
  }
LABEL_51:
}

- (BOOL)minifiedPresenterCanOpenPresenter:(id)a3 overCurrentPresenter:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = 0;
  if (v6 && a4)
  {
    id v8 = a4;
    unsigned int v9 = [(BKMinifiedFlowController *)self libraryAssetProvider];
    unsigned int v10 = [v8 assetPresenterAssetID];

    id v11 = [v9 libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:v10];

    if ((![v6 minifiedAssetPresenterIsAudiobook]
       || [v11 isAudiobook])
      && [v6 minifiedAssetPresenterIsSupplementalContent])
    {
      unsigned __int8 v7 = [v11 isAudiobook];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  return v7;
}

- (id)minifiedPresenterBarButtonItem
{
  return 0;
}

- (BOOL)_legacyMinibarBehavior
{
  v2 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)_setMinibarVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if ([(BKMinifiedFlowController *)self minibarVisible] != v6)
  {
    if (v5)
    {
      if ([(BKMinifiedFlowController *)self _legacyMinibarBehavior])
      {
        if (v6)
        {
          [(BKMinifiedFlowController *)self setMinibarVisible:1];
          unsigned int v9 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
          [(BKMinifiedFlowController *)self _layoutPresenterMinibar:v9];
        }
        unsigned int v10 = [(BKMinifiedFlowController *)self minibarContainerView];
        [v10 frame];
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;

        int v19 = [(BKMinifiedFlowController *)self delegate];
        [v19 minifiedFlowControllerMinibarBottomGuideWithViewController:0];
        double v21 = v20;

        double v22 = v14 + v21 - v14;
        if (v6)
        {
          id v23 = [(BKMinifiedFlowController *)self minibarContainerView];
          [v23 setFrame:v12, v22, v16, v18];

          double v22 = v14;
        }
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1000B356C;
        v30[3] = &unk_100A44D58;
        v30[4] = self;
        *(double *)&v30[5] = v12;
        *(double *)&v30[6] = v22;
        *(double *)&v30[7] = v16;
        *(double *)&v30[8] = v18;
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1000B35D8;
        v27[3] = &unk_100A44D80;
        v27[4] = self;
        BOOL v29 = v6;
        id v28 = v8;
        +[UIView animateWithDuration:v30 animations:v27 completion:0.2];
      }
      goto LABEL_13;
    }
    [(BKMinifiedFlowController *)self setMinibarVisible:v6];
    id v24 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
    [(BKMinifiedFlowController *)self _layoutPresenterMinibar:v24];
  }
  [(BKMinifiedFlowController *)self _notifyToolbars];
  id v25 = objc_retainBlock(v8);
  id v26 = v25;
  if (v25) {
    (*((void (**)(id))v25 + 2))(v25);
  }

LABEL_13:
}

- (void)_hideToolbarAnimated:(BOOL)a3 completion:(id)a4
{
  id v11 = a4;
  BOOL v5 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
    uint64_t v7 = [v6 minifiedAssetPresenterToolbar];

    if (!v7) {
      goto LABEL_5;
    }
    id v8 = [(BKMinifiedFlowController *)self delegate];
    [v8 minifiedFlowControllerUndock:v7];

    BOOL v5 = (void *)v7;
  }

LABEL_5:
  id v9 = objc_retainBlock(v11);
  unsigned int v10 = v9;
  if (v9) {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_layoutPresenterMinibar:(id)a3
{
  id v4 = a3;
  [(BKMinifiedFlowController *)self _layoutPresenterMinibar:v4 visible:[(BKMinifiedFlowController *)self minibarVisible] viewController:0];
}

- (void)_layoutPresenterMinibar:(id)a3 visible:(BOOL)a4 viewController:(id)a5
{
  BOOL v6 = a4;
  id v50 = a3;
  id v8 = a5;
  if ([(BKMinifiedFlowController *)self _legacyMinibarBehavior])
  {
    [v50 minifiedAssetPresenterWillLayoutAssetMinified];
    id v9 = [(BKMinifiedFlowController *)self delegate];
    unsigned int v10 = [v9 minifiedFlowControllerMinibarContainingViewController];

    id v11 = [v10 traitCollection];
    id v12 = [v11 horizontalSizeClass];

    double v13 = [(BKMinifiedFlowController *)self delegate];
    [v13 minifiedFlowControllerMinibarBottomGuideWithViewController:v8];
    double v15 = v14;

    double v16 = [(BKMinifiedFlowController *)self minibarContainerView];
    double v17 = [v16 superview];
    [v17 bounds];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;

    [v50 minifiedAssetPresenterMinibarHeight];
    double v27 = v26;
    [v50 minifiedAssetPresenterMinibarMaxWidth];
    double v29 = v28;
    [v50 minifiedAssetPresenterMinibarFloatingHorizontalOffset];
    double v31 = v30;
    [v50 minifiedAssetPresenterMinibarFloatingVerticalOffset];
    double v48 = v32;
    [v50 minifiedAssetPresenterMinibarCornerRadius];
    double v49 = v33;
    if (v12 == (id)1)
    {
      v52.origin.x = v19;
      v52.origin.y = v21;
      v52.size.width = v23;
      v52.size.height = v25;
      double v34 = CGRectGetWidth(v52) + v31 * -2.0;
      if (v34 >= v29) {
        double v35 = v29;
      }
      else {
        double v35 = v34;
      }
      if (v29 == 0.0) {
        double v36 = v34;
      }
      else {
        double v36 = v35;
      }
      v53.origin.x = v19;
      v53.origin.y = v21;
      v53.size.width = v23;
      v53.size.height = v25;
      double v31 = floor((CGRectGetWidth(v53) - v36) * 0.5);
    }
    else
    {
      double v47 = v15;
      unsigned __int8 v37 = [v10 view];
      [v37 bounds];
      double v38 = CGRectGetWidth(v54) + v31 * -2.0;

      if (v38 >= v29) {
        double v39 = v29;
      }
      else {
        double v39 = v38;
      }
      if (v29 == 0.0) {
        double v36 = v38;
      }
      else {
        double v36 = v39;
      }
      if (![(BKMinifiedFlowController *)self isRTL])
      {
        v55.origin.x = v19;
        v55.origin.y = v21;
        v55.size.width = v23;
        v55.size.height = v25;
        double Width = CGRectGetWidth(v55);
        v56.origin.x = 0.0;
        v56.origin.y = 0.0;
        v56.size.width = v36;
        v56.size.height = v27;
        double v31 = Width - CGRectGetWidth(v56) - v31;
      }
      double v15 = v47;
    }
    double v41 = v15 - v27 - v48;
    long long v42 = [(BKMinifiedFlowController *)self minibarContainerView];
    long long v43 = [v42 layer];
    [v43 setCornerRadius:v49];

    long long v44 = [v50 minifiedAssetPresenterMinibar];
    id v45 = [v44 view];
    [v45 setFrame:0.0, 0.0, v36, v27];

    if (!v6) {
      double v27 = 0.0;
    }
    long long v46 = [(BKMinifiedFlowController *)self minibarContainerView];
    [v46 setFrame:v31, v41, v36, v27];

    [v50 minifiedAssetPresenterDidLayoutAssetMinified];
  }
}

- (void)visibleViewControllersUpdatedPostTranstionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(BKMinifiedFlowController *)self _shouldHideMinibar])
  {
    BOOL v5 = [(BKMinifiedFlowController *)self minibarContainerView];
    unsigned int v6 = [v5 isHidden];

    if (v6)
    {
      BOOL v7 = [(BKMinifiedFlowController *)self minibarVisible];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000B3BD0;
      v11[3] = &unk_100A43D60;
      v11[4] = self;
      +[UIView performWithoutAnimation:v11];
      id v8 = [(BKMinifiedFlowController *)self minibarContainerView];
      [v8 setHidden:0];

      [(BKMinifiedFlowController *)self _setMinibarVisible:v7 animated:v3 completion:0];
    }
  }
  id v9 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];

  if (v9)
  {
    unsigned int v10 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
    [(BKMinifiedFlowController *)self _layoutPresenterMinibar:v10];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B3C60;
  v4[3] = &unk_100A44DA8;
  v4[4] = self;
  [a4 animateAlongsideTransition:v4 completion:&stru_100A44DE8];
}

- (void)activeRootBarKindDidChange
{
  id v3 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  [(BKMinifiedFlowController *)self _layoutPresenterMinibar:v3];
}

- (void)contentSizeCategoryDidChange
{
  id v3 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  [(BKMinifiedFlowController *)self _layoutPresenterMinibar:v3];
}

- (id)minifiedBarAnimatorMinibarView
{
  v2 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  id v3 = [v2 minifiedAssetPresenterMinibar];
  id v4 = [v3 view];

  return v4;
}

- (id)minifiedBarAnimatorTabBarView
{
  v2 = [(BKMinifiedFlowController *)self delegate];
  id v3 = [v2 minifiedFlowControllerTabBarView];

  return v3;
}

- (void)minifiedBarAnimatePrepareTransitionToViewController:(id)a3
{
  [a3 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BKAssetPresenting];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(BKMinifiedFlowController *)self setMinibarVisible:v4 == 0];
}

- (void)minifiedBarAnimatorAnimateHideIfNeededFromViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BKMinifiedFlowController *)self minibarContainerView];
  [v5 setAlpha:0.0];

  id v6 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  [(BKMinifiedFlowController *)self _layoutPresenterMinibar:v6 visible:0 viewController:v4];
}

- (void)minifiedBarAnimatorFinalizeHideIfNeededToViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  [(BKMinifiedFlowController *)self _layoutPresenterMinibar:v5 visible:0 viewController:v4];
}

- (void)minifiedBarAnimatorPrepareShowIfNeededToViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(BKMinifiedFlowController *)self minibarContainerView];
  [v5 setAlpha:1.0];

  id v6 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  [(BKMinifiedFlowController *)self _layoutPresenterMinibar:v6 visible:0 viewController:v4];
}

- (void)minifiedBarAnimatorAnimateShowIfNeededToViewController:(id)a3 force:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  [v6 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BKAssetPresenting];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  unsigned int v7 = [(BKMinifiedFlowController *)self minibarVisible];
  if ((v4 & 1) == 0 && v7)
  {
    id v8 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
    id v9 = [v8 minifiedAssetPresenterAssetID];
    unsigned int v10 = [v13 assetPresenterAssetID];
    unsigned int v11 = [v9 isEqualToString:v10];

    uint64_t v4 = v11 ^ 1;
  }
  id v12 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  [(BKMinifiedFlowController *)self _layoutPresenterMinibar:v12 visible:v4 viewController:v6];
}

- (void)toggleMinibarVisibility:(id)a3
{
  uint64_t v4 = [(BKMinifiedFlowController *)self minibarVisible] ^ 1;

  [(BKMinifiedFlowController *)self _setMinibarVisible:v4 animated:1 completion:0];
}

- (id)_currentAssetPresenters
{
  v2 = [(BKMinifiedFlowController *)self sceneHosting];
  id v3 = [v2 sceneHostingAllViewControllersConformingToProtocol:&OBJC_PROTOCOL___BKAssetPresenting];

  return v3;
}

- (void)_notifyToolbars
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(BKMinifiedFlowController *)self _currentAssetPresenters];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) assetPresenterUpdateToolbars];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)shouldAnimateAssetWithAssetIDFromMinibar:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
  id v6 = [v5 minifiedAssetPresenterAssetID];
  unsigned int v7 = [v6 isEqualToString:v4];

  if (v7)
  {
    long long v8 = [(BKMinifiedFlowController *)self audioBookAssetPresenter];
    unsigned __int8 v9 = [v8 minifiedAssetPresenterShouldAnimateFromMinibar];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (NSSet)minifiedAssetPresenters
{
  return self->_minifiedAssetPresenters;
}

- (BKSceneHosting)sceneHosting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHosting);

  return (BKSceneHosting *)WeakRetained;
}

- (void)setMinibarContainerView:(id)a3
{
}

- (void)setCurrentBookProvider:(id)a3
{
}

- (BKMinifiedAssetPresenting)audioBookAssetPresenter
{
  return self->_audioBookAssetPresenter;
}

- (void)setAudioBookAssetPresenter:(id)a3
{
}

- (BKMinifiedAssetPresenting)currentBookAssetPresenter
{
  return self->_currentBookAssetPresenter;
}

- (void)setCurrentBookAssetPresenter:(id)a3
{
}

- (BOOL)minibarVisible
{
  return self->_minibarVisible;
}

- (void)setMinibarVisible:(BOOL)a3
{
  self->_minibarVisible = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (BOOL)removingHostedVC
{
  return self->_removingHostedVC;
}

- (void)setRemovingHostedVC:(BOOL)a3
{
  self->_removingHostedVC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredCurrentBookNotification, 0);
  objc_storeStrong((id *)&self->_currentBookAssetPresenter, 0);
  objc_storeStrong((id *)&self->_audioBookAssetPresenter, 0);
  objc_storeStrong((id *)&self->_currentBookProvider, 0);
  objc_storeStrong((id *)&self->_minibarContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sceneHosting);

  objc_storeStrong((id *)&self->_minifiedAssetPresenters, 0);
}

@end