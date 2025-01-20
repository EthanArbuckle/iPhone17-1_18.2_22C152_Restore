@interface PedestrianARContext
- (BOOL)provideAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4;
- (BOOL)shouldResetStateAfterResigning;
- (BOOL)showsMapView;
- (BOOL)supportsLockscreen;
- (BOOL)usesDefaultTransitions;
- (ChromeViewController)chromeViewController;
- (PedestrianARContext)initWithRoute:(id)a3 platformController:(id)a4 guidanceObserver:(id)a5 navigationService:(id)a6;
- (PedestrianARViewController)pedestrianARViewController;
- (id)fullscreenViewControllerDismissalTransition;
- (id)fullscreenViewControllerPresentationTransition;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)dealloc;
- (void)pedestrianARViewControllerDidStop:(id)a3;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
- (void)setPedestrianARViewController:(id)a3;
- (void)willBeginDisplayingInSecureLockScreen;
@end

@implementation PedestrianARContext

- (PedestrianARContext)initWithRoute:(id)a3 platformController:(id)a4 guidanceObserver:(id)a5 navigationService:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    v19 = sub_1005762E4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "-[PedestrianARContext initWithRoute:platformController:guidanceObserver:navigationService:]";
      __int16 v34 = 2080;
      v35 = "PedestrianARContext.m";
      __int16 v36 = 1024;
      int v37 = 44;
      __int16 v38 = 2080;
      v39 = "route != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v33 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v11)
  {
    v22 = sub_1005762E4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "-[PedestrianARContext initWithRoute:platformController:guidanceObserver:navigationService:]";
      __int16 v34 = 2080;
      v35 = "PedestrianARContext.m";
      __int16 v36 = 1024;
      int v37 = 45;
      __int16 v38 = 2080;
      v39 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v23 = sub_1005762E4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v33 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v12)
  {
    v25 = sub_1005762E4();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "-[PedestrianARContext initWithRoute:platformController:guidanceObserver:navigationService:]";
      __int16 v34 = 2080;
      v35 = "PedestrianARContext.m";
      __int16 v36 = 1024;
      int v37 = 46;
      __int16 v38 = 2080;
      v39 = "guidanceObserver != nil";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v26 = sub_1005762E4();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v33 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v13)
  {
    v28 = sub_1005762E4();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "-[PedestrianARContext initWithRoute:platformController:guidanceObserver:navigationService:]";
      __int16 v34 = 2080;
      v35 = "PedestrianARContext.m";
      __int16 v36 = 1024;
      int v37 = 47;
      __int16 v38 = 2080;
      v39 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v29 = sub_1005762E4();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v33 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)PedestrianARContext;
  v14 = [(PedestrianARContext *)&v31 init];
  if (v14)
  {
    v15 = sub_1008E9034();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v33 = (const char *)v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v16 = [[PedestrianARViewController alloc] initWithRoute:v10 platformController:v11 guidanceObserver:v12 navigationService:v13];
    pedestrianARViewController = v14->_pedestrianARViewController;
    v14->_pedestrianARViewController = v16;

    [(PedestrianARViewController *)v14->_pedestrianARViewController setArDelegate:v14];
    [(ContainerViewController *)v14->_pedestrianARViewController setChromeContext:v14];
  }

  return v14;
}

- (void)dealloc
{
  v3 = sub_1008E9034();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)PedestrianARContext;
  [(PedestrianARContext *)&v4 dealloc];
}

- (BOOL)usesDefaultTransitions
{
  return 0;
}

- (id)fullscreenViewControllerPresentationTransition
{
  v2 = objc_opt_new();

  return v2;
}

- (id)fullscreenViewControllerDismissalTransition
{
  v2 = objc_opt_new();

  return v2;
}

- (ChromeViewController)chromeViewController
{
  v2 = [(PedestrianARContext *)self pedestrianARViewController];
  v3 = [v2 chromeViewController];

  return (ChromeViewController *)v3;
}

- (void)setChromeViewController:(id)a3
{
  objc_super v4 = (char *)a3;
  if (!v4) {
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315906;
      id v10 = (PedestrianARContext *)"-[PedestrianARContext setChromeViewController:]";
      __int16 v11 = 2080;
      id v12 = "PedestrianARContext.m";
      __int16 v13 = 1024;
      int v14 = 91;
      __int16 v15 = 2080;
      v16 = "chromeViewController == nil || [chromeViewController isKindOfClass:IOSBasedChromeViewController.class]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v9, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = +[NSThread callStackSymbols];
        int v9 = 138412290;
        id v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = sub_1008E9034();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134349314;
      id v10 = self;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[%{public}p] Chrome VC must be an iOS one: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
LABEL_4:
    v5 = [(PedestrianARContext *)self pedestrianARViewController];
    [v5 setChromeViewController:v4];
  }
}

- (BOOL)showsMapView
{
  return 0;
}

- (BOOL)shouldResetStateAfterResigning
{
  return 0;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_1008E9034();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    __int16 v13 = self;
    __int16 v14 = 2080;
    __int16 v15 = "-[PedestrianARContext becomeTopContextInChromeViewController:withAnimation:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] %s", buf, 0x16u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008E956C;
  v10[3] = &unk_1012E5D08;
  id v11 = v6;
  id v9 = v6;
  [v7 addPreparation:v10];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v5 = sub_1008E9034();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 134349314;
    v8 = self;
    __int16 v9 = 2080;
    id v10 = "-[PedestrianARContext resignTopContextInChromeViewController:withAnimation:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] %s", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(PedestrianARContext *)self pedestrianARViewController];
  [v6 stop];
}

- (BOOL)supportsLockscreen
{
  return 1;
}

- (void)willBeginDisplayingInSecureLockScreen
{
  id v2 = [(PedestrianARContext *)self pedestrianARViewController];
  [v2 willBeginDisplayingInSecureLockScreen];
}

- (void)pedestrianARViewControllerDidStop:(id)a3
{
  objc_super v4 = [(PedestrianARContext *)self chromeViewController];
  v5 = [v4 previousTopContext];

  if (v5 == self)
  {
    int v7 = sub_1008E9034();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] VC stopped but we're currently in the process of being dismissed; ignoring",
        buf,
        0xCu);
    }
  }
  else
  {
    id v8 = [(PedestrianARContext *)self iosBasedChromeViewController];
    id v6 = [v8 appCoordinator];
    [v6 exitPedestrianAR];
  }
}

- (BOOL)provideAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008E99E0;
  block[3] = &unk_1012E80F0;
  block[4] = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  return 1;
}

- (PedestrianARViewController)pedestrianARViewController
{
  return self->_pedestrianARViewController;
}

- (void)setPedestrianARViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end