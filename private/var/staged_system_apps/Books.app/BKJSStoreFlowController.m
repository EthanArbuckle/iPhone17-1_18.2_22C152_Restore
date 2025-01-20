@interface BKJSStoreFlowController
- (BOOL)storeHandleURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 isLaunch:(BOOL)a6 transaction:(id)a7;
- (id)_optionsForTransaction:(id)a3;
- (id)_presentingDelegateForAlertAction:(id)a3;
- (id)_presentingDelegateForShowProductCardAction:(id)a3;
- (id)_presentingDelegateForStoreURLAction:(id)a3;
- (id)_sceneControllerForTransaction:(id)a3;
- (id)_sceneManager;
- (void)_showStoreWithURL:(id)a3 tabBarIdentifier:(id)a4 transaction:(id)a5 presentingDelegate:(id)a6;
- (void)_storeCheckConnectionAndShowStoreURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 transaction:(id)a6;
- (void)displayBookUnavailableInStorefrontErrorWithTransaction:(id)a3;
- (void)displayInternetReachabilityErrorAlert:(BOOL)a3 transaction:(id)a4;
- (void)displayOffineCannotDownloadErrorForContentType:(signed __int16)a3 transaction:(id)a4;
- (void)displayStoreConnectionErrorAlert:(BOOL)a3 transaction:(id)a4;
- (void)productViewControllerDidFinish:(id)a3;
- (void)showAudiobookStoreWithTransaction:(id)a3;
- (void)showMangaStoreWithTransaction:(id)a3;
- (void)showReadingNowWithTransaction:(id)a3;
- (void)showStore:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 transaction:(id)a6;
- (void)showStoreSearchWithTransaction:(id)a3;
- (void)showStoreWithTransaction:(id)a3;
- (void)showStoreWithURL:(id)a3 transaction:(id)a4;
- (void)showTabWithIdentifier:(id)a3 transaction:(id)a4;
- (void)storeShowBookWithStoreID:(id)a3 resourceType:(int64_t)a4 transaction:(id)a5;
- (void)storeShowBooksWithStoreIDs:(id)a3 resourceTypes:(id)a4 focusedIndex:(unint64_t)a5 transaction:(id)a6 needsAnalyticsLinkData:(BOOL)a7;
@end

@implementation BKJSStoreFlowController

- (id)_sceneControllerForTransaction:(id)a3
{
  id v4 = a3;
  v5 = [(BKJSStoreFlowController *)self _sceneManager];
  v6 = [v5 defaultSceneControllerForTransaction:v4];

  return v6;
}

- (id)_presentingDelegateForAlertAction:(id)a3
{
  v3 = [(BKJSStoreFlowController *)self _sceneControllerForTransaction:a3];
  id v4 = [v3 genericPresenting];

  return v4;
}

- (id)_presentingDelegateForStoreURLAction:(id)a3
{
  v3 = [(BKJSStoreFlowController *)self _sceneControllerForTransaction:a3];
  id v4 = [v3 genericPresenting];

  return v4;
}

- (id)_presentingDelegateForShowProductCardAction:(id)a3
{
  v3 = [(BKJSStoreFlowController *)self _sceneControllerForTransaction:a3];
  id v4 = [v3 storeFlowProductPagePresenting];

  return v4;
}

- (id)_optionsForTransaction:(id)a3
{
  if (a3)
  {
    uint64_t v6 = BCTransactionOptionsTransactionKey;
    id v7 = a3;
    id v3 = a3;
    id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  }
  else
  {
    id v4 = &__NSDictionary0__struct;
  }

  return v4;
}

- (void)showStore:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 transaction:(id)a6
{
  id v10 = a6;
  id v11 = +[BSUIURL URLWithURL:a3 sourceApplication:a4 annotation:a5];
  [(BKJSStoreFlowController *)self showStoreWithURL:v11 transaction:v10];
}

- (void)showStoreWithURL:(id)a3 transaction:(id)a4
{
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001BD1DC;
  v12[3] = &unk_100A443C8;
  v12[4] = self;
  id v7 = a4;
  id v13 = v7;
  id v8 = v6;
  id v14 = v8;
  v9 = objc_retainBlock(v12);
  if (v9)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v9[2])(v9);
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1001BD320;
      v10[3] = &unk_100A442B8;
      id v11 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    }
  }
}

- (void)_showStoreWithURL:(id)a3 tabBarIdentifier:(id)a4 transaction:(id)a5 presentingDelegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001BD440;
  v17[3] = &unk_100A44358;
  id v18 = a6;
  id v19 = v12;
  id v20 = v10;
  v21 = self;
  id v22 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v12;
  id v16 = v18;
  [v15 commit:v17];
}

- (id)_sceneManager
{
  return +[BKAppDelegate sceneManager];
}

- (void)showStoreWithTransaction:(id)a3
{
}

- (void)showStoreSearchWithTransaction:(id)a3
{
  id v3 = [(BKJSStoreFlowController *)self _sceneManager];
  [v3 requestPrimaryScene:&stru_100A4A230];
}

- (void)showReadingNowWithTransaction:(id)a3
{
  id v7 = a3;
  id v4 = +[BURestrictionsProvider sharedInstance];
  unsigned int v5 = [v4 isBookStoreAllowed];

  if (v5)
  {
    id v6 = +[BKRootBarItemsProvider HomeIdentifier];
    [(BKJSStoreFlowController *)self showTabWithIdentifier:v6 transaction:v7];
  }
}

- (void)showAudiobookStoreWithTransaction:(id)a3
{
  id v7 = a3;
  id v4 = +[BURestrictionsProvider sharedInstance];
  unsigned int v5 = [v4 isBookStoreAllowed];

  if (v5)
  {
    id v6 = +[BKRootBarItemsProvider AudiobooksIdentifier];
    [(BKJSStoreFlowController *)self showTabWithIdentifier:v6 transaction:v7];
  }
}

- (void)showMangaStoreWithTransaction:(id)a3
{
  id v7 = a3;
  id v4 = +[BURestrictionsProvider sharedInstance];
  unsigned int v5 = [v4 isBookStoreAllowed];

  if (v5)
  {
    id v6 = +[BKRootBarItemsProvider MangaIdentifier];
    [(BKJSStoreFlowController *)self showTabWithIdentifier:v6 transaction:v7];
  }
}

- (void)showTabWithIdentifier:(id)a3 transaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    [(BKJSStoreFlowController *)self _sceneManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001BDC08;
    v9[3] = &unk_100A44610;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = self;
    id v12 = v6;
    id v13 = v7;
    id v8 = v10;
    [v8 forceTransaction:v13 ontoPrimarySceneWithContinuation:v9];
  }
}

- (void)_storeCheckConnectionAndShowStoreURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 transaction:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = +[BSUIURL URLWithURL:v10 sourceApplication:a4 annotation:a5];
  id v13 = +[BKAppDelegate delegate];
  id v14 = [v13 appLaunchCoordinator];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001BDDB4;
  v18[3] = &unk_100A45B10;
  id v19 = v10;
  id v20 = self;
  id v21 = v12;
  id v22 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v10;
  [v14 appLaunchCoordinatorOnConditionMask:32 blockID:@"showStoreURL" performBlock:v18];
}

- (BOOL)storeHandleURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 isLaunch:(BOOL)a6 transaction:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v11)
  {
    id v15 = [(BKJSStoreFlowController *)self _presentingDelegateForShowProductCardAction:v14];
    id v16 = +[BKAppDelegate delegate];
    id v17 = [v16 appLaunchCoordinator];

    id v18 = [v17 appLaunchCoordinatorHoldAtLaunchingAssertion];
    id v19 = v18;
    if (v18)
    {
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1001BE400;
      v38[3] = &unk_100A44268;
      id v20 = v18;
      id v39 = v20;
      [v17 appLaunchCoordinatorOnConditionMask:1024 blockID:@"invalidate holdAtLaunchScreen" performBlock:v38];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1001BE408;
      v36[3] = &unk_100A43D60;
      id v37 = v20;
      [v14 whenCancelled:v36];
    }
    if ([v15 presenterCanShowStoreProductOnCurrentContent])
    {
      v26 = [v11 httpURL];
      id v21 = [v17 appLaunchCoordinatorHoldAtLaunchingAssertion];
      id v22 = +[BSUIStoreServices sharedInstance];
      v23 = +[BSUIURL URLWithURL:v26];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1001BE410;
      v27[3] = &unk_100A4A2D0;
      id v28 = v14;
      id v29 = v17;
      id v30 = v11;
      id v31 = v12;
      id v32 = v13;
      v33 = self;
      id v34 = v15;
      id v35 = v21;
      id v24 = v21;
      [v22 canHandleURLAsProductPage:v23 completion:v27];
    }
    else
    {
      [(BKJSStoreFlowController *)self _storeCheckConnectionAndShowStoreURL:v11 sourceApplication:v12 annotation:v13 transaction:v14];
    }
  }
  return v11 != 0;
}

- (void)displayInternetReachabilityErrorAlert:(BOOL)a3 transaction:(id)a4
{
  [(BKJSStoreFlowController *)self _presentingDelegateForAlertAction:a4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001BEA0C;
  v9[3] = &unk_100A44E60;
  BOOL v11 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v5;
  id v6 = objc_retainBlock(v9);
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
      block[2] = sub_1001BEBD0;
      block[3] = &unk_100A442B8;
      id v8 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)displayOffineCannotDownloadErrorForContentType:(signed __int16)a3 transaction:(id)a4
{
  [(BKJSStoreFlowController *)self _presentingDelegateForAlertAction:a4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001BED10;
  v9[3] = &unk_100A449C8;
  signed __int16 v11 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v5;
  id v6 = objc_retainBlock(v9);
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
      block[2] = sub_1001BEEC4;
      block[3] = &unk_100A442B8;
      id v8 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)displayStoreConnectionErrorAlert:(BOOL)a3 transaction:(id)a4
{
  [(BKJSStoreFlowController *)self _presentingDelegateForAlertAction:a4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001BF004;
  v9[3] = &unk_100A44E60;
  BOOL v11 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v5;
  id v6 = objc_retainBlock(v9);
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
      block[2] = sub_1001BF170;
      block[3] = &unk_100A442B8;
      id v8 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)storeShowBookWithStoreID:(id)a3 resourceType:(int64_t)a4 transaction:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  if (v12)
  {
    v9 = +[BKAppDelegate delegate];
    unsigned int v10 = [v9 isConnectedToInternet];

    if (v10)
    {
      BOOL v11 = +[BSUIStoreServices sharedInstance];
      [v11 showProductPageForStoreID:v12 resourceType:a4 transaction:v8 needsAnalyticsLinkData:0];
    }
    else
    {
      [(BKJSStoreFlowController *)self displayInternetReachabilityErrorAlert:1 transaction:v8];
    }
  }
}

- (void)storeShowBooksWithStoreIDs:(id)a3 resourceTypes:(id)a4 focusedIndex:(unint64_t)a5 transaction:(id)a6 needsAnalyticsLinkData:(BOOL)a7
{
  BOOL v7 = a7;
  id v17 = a3;
  id v12 = a4;
  id v13 = a6;
  if ([v17 count])
  {
    id v14 = +[BKAppDelegate delegate];
    unsigned int v15 = [v14 isConnectedToInternet];

    if (v15)
    {
      id v16 = +[BSUIStoreServices sharedInstance];
      [v16 showProductPagesForStoreIDs:v17 resourceTypes:v12 focusedIndex:a5 transaction:v13 needsAnalyticsLinkData:v7];
    }
    else
    {
      [(BKJSStoreFlowController *)self displayInternetReachabilityErrorAlert:1 transaction:v13];
    }
  }
}

- (void)displayBookUnavailableInStorefrontErrorWithTransaction:(id)a3
{
  [(BKJSStoreFlowController *)self _presentingDelegateForAlertAction:a3];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001BF470;
  v7[3] = &unk_100A43D60;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v3;
  id v4 = objc_retainBlock(v7);
  if (v4)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v4[2])(v4);
    }
    else
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1001BF594;
      v5[3] = &unk_100A442B8;
      id v6 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
    }
  }
}

- (void)productViewControllerDidFinish:(id)a3
{
}

@end