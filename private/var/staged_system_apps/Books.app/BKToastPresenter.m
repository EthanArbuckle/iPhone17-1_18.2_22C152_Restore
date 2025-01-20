@interface BKToastPresenter
- (BCAugmentedExperiencePresentingDelegate)presentingDelegate;
- (BKEndOfBookCardViewController)cardViewController;
- (BKEndOfBookCompactViewController)toastViewController;
- (BKToastPresenter)init;
- (BOOL)endPresentation:(id)a3;
- (BOOL)suppressingNotifications;
- (NSDictionary)runningAction;
- (NSMutableArray)pendingActions;
- (NSString)description;
- (id)_presentationAnimator;
- (void)_currentActionComplete;
- (void)_dismissToast;
- (void)_expandCompactVCAction:(id)a3;
- (void)_performNextAction;
- (void)_performNextActionIfIdle;
- (void)_presentInVCAction:(id)a3;
- (void)_scheduleAction:(id)a3;
- (void)_setUpSellDataForCurrentAction;
- (void)bringExperienceViewToFront:(id)a3;
- (void)cancelPreloadPresentation;
- (void)dealloc;
- (void)endOfBookCompactViewControllerWantsToCloseAsset:(id)a3 completion:(id)a4;
- (void)endOfBookCompactViewControllerWantsToDismiss:(id)a3;
- (void)expandInVC:(id)a3;
- (void)preloadPresentationInVC:(id)a3 pageProgressionIsRTL:(BOOL)a4 completion:(id)a5;
- (void)presentInVC:(id)a3 autoExpanded:(BOOL)a4 details:(id)a5;
- (void)setCardViewController:(id)a3;
- (void)setPendingActions:(id)a3;
- (void)setPresentingDelegate:(id)a3;
- (void)setRunningAction:(id)a3;
- (void)setSuppressingNotifications:(BOOL)a3;
- (void)setToastViewController:(id)a3;
@end

@implementation BKToastPresenter

- (BKToastPresenter)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKToastPresenter;
  v2 = [(BKToastPresenter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    pendingActions = v2->_pendingActions;
    v2->_pendingActions = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)setToastViewController:(id)a3
{
  v4 = (BKEndOfBookCompactViewController *)a3;
  v5 = [(BKToastPresenter *)self toastViewController];
  objc_super v6 = [v5 parentViewController];

  if (v6)
  {
    v7 = [(BKToastPresenter *)self toastViewController];
    [v7 willMoveToParentViewController:0];

    v8 = [(BKToastPresenter *)self toastViewController];
    [v8 removeFromParentViewController];

    v9 = [(BKToastPresenter *)self toastViewController];
    v10 = [v9 view];
    [v10 removeFromSuperview];

    v11 = [(BKToastPresenter *)self toastViewController];
    [v11 didMoveToParentViewController:0];
  }
  toastViewController = self->_toastViewController;
  self->_toastViewController = v4;
}

- (void)dealloc
{
  if (self->_suppressingNotifications)
  {
    uint64_t v3 = BCAugmentedExperienceLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BKToastPresenter dealloc, cancelling push suppression.", buf, 2u);
    }
  }
  [(BKToastPresenter *)self setToastViewController:0];
  v4.receiver = self;
  v4.super_class = (Class)BKToastPresenter;
  [(BKToastPresenter *)&v4 dealloc];
}

- (void)setSuppressingNotifications:(BOOL)a3
{
  if (self->_suppressingNotifications != a3)
  {
    BOOL v3 = a3;
    self->_suppressingNotifications = a3;
    objc_super v4 = +[BKAppDelegate delegate];
    v5 = [v4 serviceCenter];
    objc_super v6 = [v5 readingActivityService];

    v7 = BCAugmentedExperienceLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BKToastPresenter start suppressing notifications", buf, 2u);
      }

      [v6 suppressNotifications];
    }
    else
    {
      if (v8)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BKToastPresenter end suppressing notifications", v9, 2u);
      }

      [v6 resumeNotifications];
    }
  }
}

- (void)presentInVC:(id)a3 autoExpanded:(BOOL)a4 details:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "BKToastPresenter presentInVC", v13, 2u);
  }

  v16[0] = @"action";
  v16[1] = @"viewController";
  v17[0] = &off_100A82DB0;
  v17[1] = v8;
  v16[2] = @"details";
  v17[2] = v9;
  v11 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
  [(BKToastPresenter *)self _scheduleAction:v11];

  if (v6)
  {
    v14[0] = @"action";
    v14[1] = @"viewController";
    v15[0] = &off_100A82DC8;
    v15[1] = v8;
    v14[2] = @"details";
    v15[2] = v9;
    v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
    [(BKToastPresenter *)self _scheduleAction:v12];
  }
}

- (void)bringExperienceViewToFront:(id)a3
{
  id v9 = a3;
  objc_super v4 = [(BKToastPresenter *)self toastViewController];
  v5 = [v4 viewIfLoaded];

  BOOL v6 = [v5 superview];
  v7 = [v9 view];

  if (v6 == v7)
  {
    id v8 = [v9 view];
    [v8 bringSubviewToFront:v5];
  }
}

- (void)expandInVC:(id)a3
{
  v6[0] = @"action";
  v6[1] = @"viewController";
  v7[0] = &off_100A82DC8;
  v7[1] = a3;
  id v4 = a3;
  v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  [(BKToastPresenter *)self _scheduleAction:v5];
}

- (void)_expandCompactVCAction:(id)a3
{
  id v4 = [(BKToastPresenter *)self toastViewController];
  unsigned int v5 = [v4 isPresentingCard];

  if (v5)
  {
    [(BKToastPresenter *)self _currentActionComplete];
  }
  else
  {
    BOOL v6 = BCAugmentedExperienceLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "BKToastPresenter _expandCompactVCAction", buf, 2u);
    }

    v7 = [(BKToastPresenter *)self toastViewController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10015E560;
    v8[3] = &unk_100A43D60;
    v8[4] = self;
    [v7 presentCardWithCompletion:v8];
  }
}

- (id)_presentationAnimator
{
  id v2 = [objc_alloc((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:120.0 damping:15.0 initialVelocity:0.0];
  id v3 = objc_alloc((Class)UIViewPropertyAnimator);
  [v2 settlingDuration];
  id v4 = [v3 initWithDuration:v2];

  return v4;
}

- (void)_presentInVCAction:(id)a3
{
  id v4 = a3;
  unsigned int v5 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BKToastPresenter _presentInVCAction", buf, 2u);
  }

  uint64_t v6 = [(BKToastPresenter *)self toastViewController];
  if (!v6) {
    goto LABEL_5;
  }
  v7 = (void *)v6;
  id v8 = [(BKToastPresenter *)self toastViewController];
  id v9 = [v8 parentViewController];

  if (!v9)
  {
    [(BKToastPresenter *)self setSuppressingNotifications:1];
    v10 = [v4 objectForKeyedSubscript:@"viewController"];
    v11 = [(BKToastPresenter *)self toastViewController];
    [v11 toastPresenter:self willPresentToastInViewController:v10];

    v12 = [(BKToastPresenter *)self toastViewController];
    [v12 preferredFrameInViewController:v10 isPresented:0];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    v21 = [(BKToastPresenter *)self toastViewController];
    [v21 preferredFrameInViewController:v10 isPresented:1];
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    uint64_t v29 = v28;

    v30 = [(BKToastPresenter *)self toastViewController];
    [v10 addChildViewController:v30];

    v31 = [(BKToastPresenter *)self toastViewController];
    v32 = [v31 view];
    [v32 setFrame:v14, v16, v18, v20];

    v33 = [v10 view];
    v34 = [(BKToastPresenter *)self toastViewController];
    v35 = [v34 view];
    [v33 addSubview:v35];

    v36 = [(BKToastPresenter *)self toastViewController];
    [v36 didMoveToParentViewController:v10];

    v37 = [(BKToastPresenter *)self toastViewController];
    v38 = [v37 view];
    [v38 layoutIfNeeded];

    v39 = [(BKToastPresenter *)self _presentationAnimator];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10015E94C;
    v43[3] = &unk_100A44D58;
    v43[4] = self;
    v43[5] = v23;
    v43[6] = v25;
    v43[7] = v27;
    v43[8] = v29;
    [v39 addAnimations:v43];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10015E9D0;
    v41[3] = &unk_100A488F0;
    v41[4] = self;
    id v42 = v10;
    id v40 = v10;
    [v39 addCompletion:v41];
    [v39 startAnimation];
    [(BKToastPresenter *)self _setUpSellDataForCurrentAction];
  }
  else
  {
LABEL_5:
    [(BKToastPresenter *)self _currentActionComplete];
  }
}

- (BOOL)endPresentation:(id)a3
{
  id v4 = a3;
  unsigned int v5 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BKToastPresenter endPresentation", v13, 2u);
  }

  [(BKToastPresenter *)self setSuppressingNotifications:0];
  uint64_t v6 = [(BKToastPresenter *)self toastViewController];
  v7 = [v6 viewIfLoaded];

  id v8 = [v7 superview];

  if (v8)
  {
    CFStringRef v14 = @"action";
    double v15 = &off_100A82DE0;
    id v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    [(BKToastPresenter *)self _scheduleAction:v9];

    id v10 = objc_retainBlock(v4);
    v11 = v10;
    if (v10) {
      (*((void (**)(id))v10 + 2))(v10);
    }
  }
  return 1;
}

- (void)preloadPresentationInVC:(id)a3 pageProgressionIsRTL:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(BKToastPresenter *)self presentingDelegate];
  v11 = [v10 storeIDForPresenter:self];

  v12 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v42 = self;
    __int16 v43 = 2112;
    CFStringRef v44 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@: preloadPresentation (storeID: %@)", buf, 0x16u);
  }

  if ([(__CFString *)v11 length])
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10015F028;
    v35[3] = &unk_100A48968;
    BOOL v40 = a4;
    v36 = v11;
    v37 = self;
    id v38 = v8;
    id v39 = v9;
    double v13 = objc_retainBlock(v35);
    CFStringRef v14 = +[BUAccountsProvider sharedProvider];
    unsigned int v15 = [v14 isUserSignedInToiTunes];

    double v16 = +[BUAccountsProvider sharedProvider];
    unsigned int v17 = [v16 isUserSignedInToiCloud];

    unsigned int v18 = +[BCSyncUserDefaults isCloudKitSyncOptedIn];
    unsigned int v19 = v18;
    if (v15 && v17 && v18)
    {
      objc_opt_class();
      double v20 = +[BCRCDataContainer defaultContainer];
      v21 = [v20 configs];
      uint64_t v22 = [v21 valueForKeyPath:BRCBooksDefaultsKeyEndOfBookExperienceSendAdditionalSeedLimit];
      uint64_t v23 = BUDynamicCast();

      uint64_t v24 = +[BKLibraryManager defaultManager];
      if (v23) {
        uint64_t v25 = (int)[v23 intValue];
      }
      else {
        uint64_t v25 = 100;
      }
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10015F914;
      v33[3] = &unk_100A46800;
      v33[4] = self;
      v34 = v13;
      [v24 storeAssetIDsOfWantToReadWithLimit:v25 completion:v33];
    }
    else
    {
      uint64_t v29 = BCAugmentedExperienceLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        CFStringRef v30 = @"NO";
        if (v15) {
          CFStringRef v31 = @"YES";
        }
        else {
          CFStringRef v31 = @"NO";
        }
        *(_DWORD *)buf = 138413058;
        id v42 = self;
        if (v17) {
          CFStringRef v32 = @"YES";
        }
        else {
          CFStringRef v32 = @"NO";
        }
        __int16 v43 = 2112;
        CFStringRef v44 = v31;
        __int16 v45 = 2112;
        if (v19) {
          CFStringRef v30 = @"YES";
        }
        CFStringRef v46 = v32;
        __int16 v47 = 2112;
        CFStringRef v48 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%@: skipping additional seeds: store=%@ iCloud=%@ CloudKit=%@", buf, 0x2Au);
      }

      ((void (*)(void *, void))v13[2])(v13, 0);
    }

    uint64_t v28 = v36;
  }
  else
  {
    uint64_t v26 = BCAugmentedExperienceLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1007ED5D4((uint64_t)self, v26);
    }

    uint64_t v27 = (__CFString *)objc_retainBlock(v9);
    uint64_t v28 = v27;
    if (v27) {
      ((void (*)(__CFString *, uint64_t))v27->data)(v27, 1);
    }
  }
}

- (void)cancelPreloadPresentation
{
  id v3 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "BKToastPresenter cancelPreloadPresentation", v4, 2u);
  }

  [(BKToastPresenter *)self setCardViewController:0];
  [(BKToastPresenter *)self setToastViewController:0];
}

- (void)_dismissToast
{
  id v3 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "BKToastPresenter _dismissToast", buf, 2u);
  }

  id v4 = [(BKToastPresenter *)self toastViewController];
  unsigned int v5 = [v4 viewIfLoaded];

  uint64_t v6 = [v5 superview];

  if (v6)
  {
    v7 = [(BKToastPresenter *)self toastViewController];
    [v7 toastPresenterWillDismissToast:self];

    id v8 = [(BKToastPresenter *)self toastViewController];
    id v9 = [v8 parentViewController];

    id v10 = [(BKToastPresenter *)self toastViewController];
    [v10 preferredFrameInViewController:v9 isPresented:0];
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;

    unsigned int v19 = [(BKToastPresenter *)self _presentationAnimator];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10015FD34;
    v21[3] = &unk_100A44D58;
    v21[4] = self;
    v21[5] = v12;
    v21[6] = v14;
    v21[7] = v16;
    v21[8] = v18;
    [v19 addAnimations:v21];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10015FDB8;
    v20[3] = &unk_100A46370;
    v20[4] = self;
    [v19 addCompletion:v20];
    [v19 startAnimation];
  }
  else
  {
    [(BKToastPresenter *)self _currentActionComplete];
  }
}

- (void)_setUpSellDataForCurrentAction
{
  id v3 = [(BKToastPresenter *)self runningAction];
  id v14 = [v3 objectForKeyedSubscript:@"details"];

  if (v14)
  {
    objc_opt_class();
    id v4 = [v14 valueForKey:BCAugmentedExperienceLocationKey];
    unsigned int v5 = BUDynamicCast();
    id v6 = [v5 integerValue];

    objc_opt_class();
    v7 = [v14 valueForKey:BCAugmentedExperienceLocationVariantKey];
    id v8 = BUDynamicCast();
    id v9 = [v8 integerValue];

    objc_opt_class();
    id v10 = [v14 valueForKey:BCAugmentedExperienceVariantVersionKey];
    uint64_t v11 = BUDynamicCast();

    id v12 = [objc_alloc((Class)BAUpSellData) initWithLocation:v6 variant:v9 variantVersion:v11];
    uint64_t v13 = [(BKToastPresenter *)self cardViewController];
    [v13 setUpSellData:v12];
  }
}

- (void)_scheduleAction:(id)a3
{
  id v4 = a3;
  unsigned int v5 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BKToastPresenter _scheduleAction: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(BKToastPresenter *)self pendingActions];
  [v6 addObject:v4];

  [(BKToastPresenter *)self _performNextActionIfIdle];
}

- (void)_performNextActionIfIdle
{
  id v3 = [(BKToastPresenter *)self runningAction];

  if (!v3)
  {
    [(BKToastPresenter *)self _performNextAction];
  }
}

- (void)_performNextAction
{
  id v3 = BCAugmentedExperienceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "BKToastPresenter _performNextAction checking", (uint8_t *)&v15, 2u);
  }

  [(BKToastPresenter *)self setRunningAction:0];
  id v4 = [(BKToastPresenter *)self pendingActions];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = [(BKToastPresenter *)self pendingActions];
    int v7 = [v6 objectAtIndexedSubscript:0];
    [(BKToastPresenter *)self setRunningAction:v7];

    id v8 = [(BKToastPresenter *)self pendingActions];
    [v8 removeObjectAtIndex:0];

    id v9 = BCAugmentedExperienceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(BKToastPresenter *)self runningAction];
      int v15 = 138543362;
      uint64_t v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BKToastPresenter _performNextAction: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v11 = [(BKToastPresenter *)self runningAction];
    id v12 = [v11 objectForKeyedSubscript:@"action"];
    id v13 = [v12 integerValue];

    if (v13 == (id)2)
    {
      [(BKToastPresenter *)self _dismissToast];
    }
    else
    {
      if (v13 == (id)1)
      {
        id v14 = [(BKToastPresenter *)self runningAction];
        [(BKToastPresenter *)self _expandCompactVCAction:v14];
      }
      else
      {
        if (v13) {
          return;
        }
        id v14 = [(BKToastPresenter *)self runningAction];
        [(BKToastPresenter *)self _presentInVCAction:v14];
      }
    }
  }
}

- (void)_currentActionComplete
{
  [(BKToastPresenter *)self setRunningAction:0];

  [(BKToastPresenter *)self _performNextAction];
}

- (NSString)description
{
  id v3 = [(BKToastPresenter *)self cardViewController];
  id v4 = [(BKToastPresenter *)self toastViewController];
  id v5 = +[NSString stringWithFormat:@"BKToastPresenter(cardVC:%@ toastVC:%@)", v3, v4];

  return (NSString *)v5;
}

- (void)endOfBookCompactViewControllerWantsToDismiss:(id)a3
{
  id v4 = [(BKToastPresenter *)self presentingDelegate];
  [v4 presenterWantsToDismiss:self];
}

- (void)endOfBookCompactViewControllerWantsToCloseAsset:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(BKToastPresenter *)self presentingDelegate];
  [v6 presenterWantsToCloseAsset:self completion:v5];
}

- (BCAugmentedExperiencePresentingDelegate)presentingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);

  return (BCAugmentedExperiencePresentingDelegate *)WeakRetained;
}

- (void)setPresentingDelegate:(id)a3
{
}

- (BKEndOfBookCompactViewController)toastViewController
{
  return self->_toastViewController;
}

- (BKEndOfBookCardViewController)cardViewController
{
  return self->_cardViewController;
}

- (void)setCardViewController:(id)a3
{
}

- (BOOL)suppressingNotifications
{
  return self->_suppressingNotifications;
}

- (NSMutableArray)pendingActions
{
  return self->_pendingActions;
}

- (void)setPendingActions:(id)a3
{
}

- (NSDictionary)runningAction
{
  return self->_runningAction;
}

- (void)setRunningAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningAction, 0);
  objc_storeStrong((id *)&self->_pendingActions, 0);
  objc_storeStrong((id *)&self->_cardViewController, 0);
  objc_storeStrong((id *)&self->_toastViewController, 0);

  objc_destroyWeak((id *)&self->_presentingDelegate);
}

@end