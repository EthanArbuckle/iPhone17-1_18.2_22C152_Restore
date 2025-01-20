@interface NTKECreateWatchFaceViewController
- (BOOL)assetsLoaded;
- (NSArray)assets;
- (NTKCNavigationController)ntkNavController;
- (NTKECreateWatchFaceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_deviceDidBecomeActive;
- (void)_displayChooser;
- (void)_faceAdded:(id)a3;
- (void)_finishedLoadingAssets;
- (void)_loadImages;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)setAssets:(id)a3;
- (void)setAssetsLoaded:(BOOL)a3;
- (void)setNtkNavController:(id)a3;
- (void)viewDidLoad;
@end

@implementation NTKECreateWatchFaceViewController

- (NTKECreateWatchFaceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = sub_1000063D0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
  }
  v30.receiver = self;
  v30.super_class = (Class)NTKECreateWatchFaceViewController;
  v11 = [(NTKECreateWatchFaceViewController *)&v30 initWithNibName:0 bundle:0];
  if (v11)
  {
    v12 = +[NSNotificationCenter defaultCenter];
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    v13 = (void *)qword_100011608;
    v34 = (void *)qword_100011608;
    if (!qword_100011608)
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v36 = sub_100007D30;
      v37 = &unk_10000C348;
      v38 = &v31;
      v14 = (void *)sub_100007BBC();
      v15 = dlsym(v14, "NTKCFaceDetailViewControllerDidAddFace");
      *(void *)(v38[1] + 24) = v15;
      qword_100011608 = *(void *)(v38[1] + 24);
      v13 = (void *)v32[3];
    }
    _Block_object_dispose(&v31, 8);
    if (v13)
    {
      [v12 addObserver:v11 selector:"_faceAdded:" name:*v13 object:0];

      v16 = +[NSNotificationCenter defaultCenter];
      [v16 addObserver:v11 selector:"_deviceDidBecomeActive" name:CLKActiveDeviceChangedNotification object:0];

      dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x2050000000;
      v18 = (void *)qword_100011610;
      v34 = (void *)qword_100011610;
      if (!qword_100011610)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v36 = sub_100007D80;
        v37 = &unk_10000C348;
        v38 = &v31;
        sub_100007D80((uint64_t)&buf);
        v18 = (void *)v32[3];
      }
      id v19 = v18;
      _Block_object_dispose(&v31, 8);
      v20 = [v19 sharedAppLibrary];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000064E8;
      v28[3] = &unk_10000C3A8;
      v21 = v17;
      v29 = v21;
      [v20 prewarmCompanionDaemonWithCompletion:v28];

      dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x2020000000;
      v22 = (void (*)(void))off_100011618;
      v34 = off_100011618;
      if (!off_100011618)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v36 = sub_100007DD8;
        v37 = &unk_10000C348;
        v38 = &v31;
        v23 = (void *)sub_100007BBC();
        v24 = dlsym(v23, "NTKSharedRemoteComplicationProvider");
        *(void *)(v38[1] + 24) = v24;
        off_100011618 = *(_UNKNOWN **)(v38[1] + 24);
        v22 = (void (*)(void))v32[3];
      }
      _Block_object_dispose(&v31, 8);
      if (v22)
      {
        v22();

        uint64_t v31 = 0;
        v32 = &v31;
        uint64_t v33 = 0x2050000000;
        v25 = (void *)qword_100011620;
        v34 = (void *)qword_100011620;
        if (!qword_100011620)
        {
          *(void *)&long long buf = _NSConcreteStackBlock;
          *((void *)&buf + 1) = 3221225472;
          v36 = sub_100007E28;
          v37 = &unk_10000C348;
          v38 = &v31;
          sub_100007E28((uint64_t)&buf);
          v25 = (void *)v32[3];
        }
        id v26 = v25;
        _Block_object_dispose(&v31, 8);
        [v26 flushCommitHandlers];

        goto LABEL_15;
      }
      sub_1000080B4();
    }
    else
    {
      sub_1000080B4();
    }
    __break(1u);
  }
LABEL_15:

  return v11;
}

- (void)viewDidLoad
{
  v3 = sub_1000063D0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL assetsLoaded = self->_assetsLoaded;
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&buf[4] = assetsLoaded;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "viewDidLoad (assetsLoaded? %d)", buf, 8u);
  }

  v24.receiver = self;
  v24.super_class = (Class)NTKECreateWatchFaceViewController;
  [(NTKECreateWatchFaceViewController *)&v24 viewDidLoad];
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2050000000;
  v5 = (void *)qword_100011628;
  uint64_t v28 = qword_100011628;
  if (!qword_100011628)
  {
    *(void *)long long buf = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    uint64_t v31 = sub_100007E80;
    v32 = &unk_10000C348;
    uint64_t v33 = &v25;
    sub_100007E80((uint64_t)buf);
    v5 = (void *)v26[3];
  }
  v6 = v5;
  _Block_object_dispose(&v25, 8);
  id v7 = [v6 alloc];
  id v8 = objc_opt_new();
  id v9 = [v7 initWithRootViewController:v8];

  v10 = [(NTKECreateWatchFaceViewController *)self view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v19 = [v9 view];
  objc_msgSend(v19, "setBounds:", v12, v14, v16, v18);

  [(NTKECreateWatchFaceViewController *)self addChildViewController:v9];
  v20 = [(NTKECreateWatchFaceViewController *)self view];
  v21 = [v9 view];
  [v20 addSubview:v21];

  [v9 didMoveToParentViewController:self];
  v22 = +[UIColor systemBackgroundColor];
  v23 = [v9 view];
  [v23 setBackgroundColor:v22];

  [(NTKECreateWatchFaceViewController *)self setNtkNavController:v9];
  if (self->_assetsLoaded) {
    [(NTKECreateWatchFaceViewController *)self _displayChooser];
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKECreateWatchFaceViewController;
  [(NTKECreateWatchFaceViewController *)&v4 beginRequestWithExtensionContext:a3];
  [(NTKECreateWatchFaceViewController *)self _loadImages];
}

- (void)_faceAdded:(id)a3
{
  id v6 = [(NTKECreateWatchFaceViewController *)self extensionContext];
  objc_super v4 = [(NTKECreateWatchFaceViewController *)self extensionContext];
  v5 = [v4 inputItems];
  [v6 completeRequestReturningItems:v5 completionHandler:0];
}

- (void)_loadImages
{
  v3 = sub_1000063D0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_loadImages", buf, 2u);
  }

  objc_super v4 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006960;
  block[3] = &unk_10000C3A8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_finishedLoadingAssets
{
  if ([(NTKECreateWatchFaceViewController *)self isViewLoaded])
  {
    [(NTKECreateWatchFaceViewController *)self _displayChooser];
  }
  else
  {
    v3 = sub_1000063D0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "waiting for viewDidLoad", v4, 2u);
    }

    [(NTKECreateWatchFaceViewController *)self setAssetsLoaded:1];
  }
}

- (void)_displayChooser
{
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100007988;
  v24[3] = &unk_10000C3A8;
  v24[4] = self;
  v3 = objc_retainBlock(v24);
  objc_super v4 = [(NTKECreateWatchFaceViewController *)self ntkNavController];
  v5 = [v4 viewControllers];
  id v6 = [v5 objectAtIndexedSubscript:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1000115E0);
    id WeakRetained = objc_loadWeakRetained(&qword_1000115E8);
    if (WeakRetained)
    {
      id v9 = WeakRetained;
      v10 = +[CLKRenderingContext sharedRenderingContext];
      id v11 = [v10 device];
      id v12 = objc_loadWeakRetained(&qword_1000115E8);
      if (v11 == v12)
      {
        double v13 = +[CLKRenderingContext sharedRenderingContext];
        double v14 = [v13 device];
        id v15 = [v14 version];
        uint64_t v16 = qword_1000115F0;

        if (v15 == (id)v16)
        {
LABEL_8:
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000115E0);
          goto LABEL_9;
        }
      }
      else
      {
      }
    }
    double v17 = +[CLKRenderingContext sharedRenderingContext];
    double v18 = [v17 device];
    objc_storeWeak(&qword_1000115E8, v18);

    id v19 = objc_loadWeakRetained(&qword_1000115E8);
    qword_1000115F0 = (uint64_t)[v19 version];

    v22[2] = sub_100007A58;
    v22[3] = &unk_10000C488;
    v23 = v3;
    v20 = +[CLKRenderingContext sharedRenderingContext];
    v21 = [v20 device];
    ((void (*)(void *, void *))sub_100007A58)(v22, v21);

    goto LABEL_8;
  }
  ((void (*)(void *))v3[2])(v3);
LABEL_9:
}

- (void)_deviceDidBecomeActive
{
  if ([(NTKECreateWatchFaceViewController *)self isViewLoaded])
  {
    [(NTKECreateWatchFaceViewController *)self _displayChooser];
  }
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (BOOL)assetsLoaded
{
  return self->_assetsLoaded;
}

- (void)setAssetsLoaded:(BOOL)a3
{
  self->_BOOL assetsLoaded = a3;
}

- (NTKCNavigationController)ntkNavController
{
  return self->_ntkNavController;
}

- (void)setNtkNavController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ntkNavController, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

@end