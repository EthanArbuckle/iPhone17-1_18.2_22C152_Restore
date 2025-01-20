@interface BKRootViewController
- (BKRootViewController)init;
- (BOOL)_behaviorIsAllowed:(id)a3;
- (BOOL)canHandleDropSession:(id)a3 behavior:(id)a4;
- (BOOL)shouldAutorotate;
- (TUISyncLayoutController)syncLayoutController;
- (UIViewController)fakeAudiobookVC;
- (UIViewController)modalSheetVC;
- (UIViewController)rootViewController;
- (id)_defaultCollectionIDForBehavior:(id)a3;
- (id)analyticsSessionHost;
- (id)bc_ancestorOverrideCardPresentingViewController;
- (id)flowControllers;
- (int64_t)_computedUserInterfaceStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_userInterfaceStyleDidChange:(id)a3;
- (void)bc_dismissCardViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)bc_presentCardViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)performDropWithSession:(id)a3 behavior:(id)a4;
- (void)setFakeAudiobookVC:(id)a3;
- (void)setModalSheetVC:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)syncLayoutControllerNeedsFlushing:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation BKRootViewController

- (id)flowControllers
{
  v2 = [(BKRootViewController *)self rootViewController];
  v3 = BUProtocolCast();
  v4 = [v3 flowControllers];

  return v4;
}

- (unint64_t)supportedInterfaceOrientations
{
  v3 = [(BKRootViewController *)self rootViewController];

  if (v3)
  {
    v4 = [(BKRootViewController *)self rootViewController];
    id v5 = [v4 supportedInterfaceOrientations];

    return (unint64_t)v5;
  }
  else if (isPad())
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  p_rootViewController = &self->_rootViewController;
  rootViewController = self->_rootViewController;
  v22 = v5;
  if (rootViewController != v5)
  {
    [(UIViewController *)rootViewController willMoveToParentViewController:0];
    v8 = [(UIViewController *)*p_rootViewController view];
    [v8 removeFromSuperview];

    [(UIViewController *)*p_rootViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_rootViewController, a3);
    [(BKRootViewController *)self addChildViewController:v22];
    v9 = [(BKRootViewController *)self view];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = [(UIViewController *)v22 view];
    [v18 setFrame:v11, v13, v15, v17];

    v19 = [(UIViewController *)v22 view];
    [v19 setAutoresizingMask:18];

    v20 = [(BKRootViewController *)self view];
    v21 = [(UIViewController *)v22 view];
    [v20 addSubview:v21];

    [(UIViewController *)v22 didMoveToParentViewController:self];
    [(UIViewController *)*p_rootViewController setOverrideUserInterfaceStyle:[(BKRootViewController *)self _computedUserInterfaceStyle]];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BKRootViewController;
  [(BKRootViewController *)&v3 viewDidLayoutSubviews];
  [(TUISyncLayoutController *)self->_syncLayoutController flush];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)BKRootViewController;
  [(BKRootViewController *)&v5 viewDidLoad];
  objc_super v3 = +[UIColor systemBackgroundColor];
  v4 = [(BKRootViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (BKRootViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)BKRootViewController;
  v2 = [(BKRootViewController *)&v8 init];
  objc_super v3 = v2;
  if (v2)
  {
    [(BKRootViewController *)v2 setDefinesPresentationContext:1];
    v4 = (TUISyncLayoutController *)[objc_alloc((Class)TUISyncLayoutController) initWithDelegate:v3];
    syncLayoutController = v3->_syncLayoutController;
    v3->_syncLayoutController = v4;

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v3 selector:"_userInterfaceStyleDidChange:" name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];
  }
  return v3;
}

- (int64_t)_computedUserInterfaceStyle
{
  if (UIAccessibilityIsInvertColorsEnabled()) {
    return 2;
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)BKRootViewController;
  [(BKRootViewController *)&v4 dealloc];
}

- (void)syncLayoutControllerNeedsFlushing:(id)a3
{
  id v3 = [(BKRootViewController *)self view];
  [v3 setNeedsLayout];
}

- (id)bc_ancestorOverrideCardPresentingViewController
{
  id v3 = [(BKRootViewController *)self presentedViewController];
  if (v3
    && ((BUProtocolCast(), v4 = objc_claimAutoreleasedReturnValue(), v4, objc_super v5 = v3, v4)
     || (v6 = [(BKRootViewController *)v3 modalPresentationStyle], objc_super v5 = self, v6 == (id)2)))
  {
    v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)bc_presentCardViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  double v10 = [(BKRootViewController *)self presentedViewController];
  modalSheetVC = self->_modalSheetVC;
  self->_modalSheetVC = 0;

  if (v10 && [v10 modalPresentationStyle] == (id)2)
  {
    objc_storeStrong((id *)&self->_modalSheetVC, v10);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100092FD4;
    v13[3] = &unk_100A43E00;
    id v14 = v8;
    BOOL v17 = v6;
    double v15 = self;
    id v16 = v9;
    [v10 dismissViewControllerAnimated:v6 completion:v13];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)BKRootViewController;
    [(BKRootViewController *)&v12 bc_presentCardViewController:v8 animated:v6 completion:v9];
  }
}

- (void)bc_dismissCardViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000930E0;
  v9[3] = &unk_100A43E28;
  BOOL v12 = a4;
  double v10 = self;
  id v11 = a5;
  v8.receiver = v10;
  v8.super_class = (Class)BKRootViewController;
  id v7 = v11;
  [(BKRootViewController *)&v8 bc_dismissCardViewController:a3 animated:v5 completion:v9];
}

- (BOOL)shouldAutorotate
{
  v2 = [(BKRootViewController *)self rootViewController];
  unsigned __int8 v3 = [v2 shouldAutorotate];

  return v3;
}

- (void)_userInterfaceStyleDidChange:(id)a3
{
  id v7 = a3;
  if (+[NSThread isMainThread])
  {
    int64_t v5 = [(BKRootViewController *)self _computedUserInterfaceStyle];
    BOOL v6 = [(BKRootViewController *)self rootViewController];
    [v6 setOverrideUserInterfaceStyle:v5];
  }
  else
  {
    [(BKRootViewController *)self performSelectorOnMainThread:a2 withObject:v7 waitUntilDone:0];
  }
}

- (id)analyticsSessionHost
{
  unsigned __int8 v3 = +[BKAppDelegate sceneManager];
  objc_super v4 = [v3 sceneControllerForViewController:self];

  objc_opt_class();
  int64_t v5 = BUDynamicCast();
  BOOL v6 = [v5 analyticsSessionHost];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[BKAppDelegate delegate];
  }
  id v9 = v8;

  return v9;
}

- (id)_defaultCollectionIDForBehavior:(id)a3
{
  uint64_t v3 = qword_100B4A1D8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_100B4A1D8, &stru_100A43E68);
  }
  int64_t v5 = [(id)qword_100B4A1D0 objectForKeyedSubscript:v4];

  return v5;
}

- (BOOL)_behaviorIsAllowed:(id)a3
{
  uint64_t v3 = [(BKRootViewController *)self _defaultCollectionIDForBehavior:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)performDropWithSession:(id)a3 behavior:(id)a4
{
  id v6 = a3;
  v39 = [(BKRootViewController *)self _defaultCollectionIDForBehavior:a4];
  if (v39)
  {
    id v7 = [v6 localDragSession];

    if (v7)
    {
      id v8 = +[BKLibraryManager defaultManager];
      v38 = [v8 collectionController];

      id v9 = objc_opt_new();
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v37 = v6;
      double v10 = [v6 items];
      id v11 = [v10 reverseObjectEnumerator];

      id obj = v11;
      id v12 = [v11 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v47;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v47 != v14) {
              objc_enumerationMutation(obj);
            }
            id v16 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            objc_opt_class();
            BOOL v17 = [v16 localObject];
            v18 = BUDynamicCast();

            objc_opt_class();
            v19 = [v16 localObject];
            v20 = BUDynamicCast();

            objc_opt_class();
            v21 = [v16 localObject];
            v22 = BUDynamicCast();

            v23 = [v22 assetID];
            id v24 = [v23 length];

            if (v24)
            {
              v25 = +[BKLibraryManager defaultManager];
              v26 = [v22 assetID];
              uint64_t v27 = [v25 libraryAssetOnMainQueueWithAssetID:v26];

              v18 = (void *)v27;
            }
            if (v18)
            {
              [v9 addObject:v18];
            }
            else if (v20)
            {
              v28 = [v20 storeID];
              v43[0] = _NSConcreteStackBlock;
              v43[1] = 3221225472;
              v43[2] = sub_100093928;
              v43[3] = &unk_100A43E90;
              id v44 = v20;
              id v45 = v39;
              [v38 addStoreID:v28 toCollectionID:v45 forceToTop:1 completion:v43];
            }
          }
          id v13 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
        }
        while (v13);
      }

      if ([v9 count])
      {
        v29 = +[BKLibraryManager defaultManager];
        v30 = [v29 collectionProvider];

        v31 = [v30 collectionOnMainQueueWithCollectionID:v39 error:0];
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_10009397C;
        v41[3] = &unk_100A43EB8;
        id v42 = v39;
        [v38 addBooks:v9 toCollection:v31 forceToTop:1 completion:v41];
      }
      id v6 = v37;
    }
    else
    {
      v32 = sub_100152BC0();
      int v33 = sub_100153F70(v6, v32);

      if (v33)
      {
        v34 = +[BKAppDelegate sceneManager];
        v35 = [v34 sceneControllerForViewController:self];

        id v36 = [v35 newShowURLTransaction];
        sub_100152F68(v6, v39, v36);
        if (sub_100153DC0(v6)) {
          sub_100152E44(v6);
        }
      }
    }
  }
}

- (BOOL)canHandleDropSession:(id)a3 behavior:(id)a4
{
  id v6 = a3;
  if ([(BKRootViewController *)self _behaviorIsAllowed:a4])
  {
    id v7 = [v6 localDragSession];

    if (v7)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v27 = v6;
      uint64_t v8 = [v6 items];
      id v9 = [(id)v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v29;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v29 != v11) {
              objc_enumerationMutation((id)v8);
            }
            id v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            objc_opt_class();
            uint64_t v14 = [v13 localObject];
            uint64_t v15 = BUDynamicCast();

            objc_opt_class();
            id v16 = [v13 localObject];
            uint64_t v17 = BUDynamicCast();

            objc_opt_class();
            v18 = [v13 localObject];
            v19 = BUDynamicCast();

            v20 = [v19 assetID];
            id v21 = [v20 length];

            if (v21)
            {
              v22 = +[BKLibraryManager defaultManager];
              v23 = [v19 assetID];
              uint64_t v24 = [v22 libraryAssetOnMainQueueWithAssetID:v23];

              uint64_t v15 = v24;
            }

            if (v15 | v17)
            {

              LOBYTE(v8) = 1;
              goto LABEL_16;
            }
          }
          id v10 = [(id)v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      LOBYTE(v8) = 0;
LABEL_16:
      id v6 = v27;
    }
    else
    {
      v25 = sub_100152A40();
      uint64_t v8 = [v6 hasItemsConformingToTypeIdentifiers:v25];
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (TUISyncLayoutController)syncLayoutController
{
  return self->_syncLayoutController;
}

- (UIViewController)modalSheetVC
{
  return self->_modalSheetVC;
}

- (void)setModalSheetVC:(id)a3
{
}

- (UIViewController)fakeAudiobookVC
{
  return self->_fakeAudiobookVC;
}

- (void)setFakeAudiobookVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeAudiobookVC, 0);
  objc_storeStrong((id *)&self->_modalSheetVC, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);

  objc_storeStrong((id *)&self->_syncLayoutController, 0);
}

@end