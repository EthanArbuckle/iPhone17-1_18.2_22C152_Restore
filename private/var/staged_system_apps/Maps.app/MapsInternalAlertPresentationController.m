@interface MapsInternalAlertPresentationController
+ (id)sharedInstance;
- (MapsInternalAlertPresentationController)init;
- (id)_windowForScene:(id)a3;
- (void)_dismissalTransitionDidEndNotification:(id)a3;
- (void)presentAlertController:(id)a3 fromWindowScene:(id)a4;
@end

@implementation MapsInternalAlertPresentationController

+ (id)sharedInstance
{
  if (qword_10160F338 != -1) {
    dispatch_once(&qword_10160F338, &stru_1012F2B18);
  }
  v2 = (void *)qword_10160F330;

  return v2;
}

- (MapsInternalAlertPresentationController)init
{
  v6.receiver = self;
  v6.super_class = (Class)MapsInternalAlertPresentationController;
  v2 = [(MapsInternalAlertPresentationController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable weakToStrongObjectsMapTable];
    windowMap = v2->_windowMap;
    v2->_windowMap = (NSMapTable *)v3;
  }
  return v2;
}

- (void)presentAlertController:(id)a3 fromWindowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136316418;
        v19 = "-[MapsInternalAlertPresentationController presentAlertController:fromWindowScene:]";
        __int16 v20 = 2080;
        v21 = "MapsInternalAlertPresentationController.m";
        __int16 v22 = 1024;
        int v23 = 52;
        __int16 v24 = 2080;
        v25 = "dispatch_get_main_queue()";
        __int16 v26 = 2080;
        v27 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v28 = 2080;
        v29 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v18,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v15 = sub_1005762E4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = +[NSThread callStackSymbols];
          int v18 = 138412290;
          v19 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
        }
      }
    }
  }
  if (v7)
  {
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:self selector:"_dismissalTransitionDidEndNotification:" name:UIPresentationControllerDismissalTransitionDidEndNotification object:v6];

    v12 = [(MapsInternalAlertPresentationController *)self _windowForScene:v7];
    v13 = [v12 rootViewController];
    [v13 _maps_topMostPresentViewController:v6 animated:1 completion:0];
    goto LABEL_9;
  }
  v17 = sub_1005762E4();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136315906;
    v19 = "-[MapsInternalAlertPresentationController presentAlertController:fromWindowScene:]";
    __int16 v20 = 2080;
    v21 = "MapsInternalAlertPresentationController.m";
    __int16 v22 = 1024;
    int v23 = 53;
    __int16 v24 = 2080;
    v25 = "windowScene != nil";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v18, 0x26u);
  }

  if (sub_100BB36BC())
  {
    v12 = sub_1005762E4();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    v13 = +[NSThread callStackSymbols];
    int v18 = 138412290;
    v19 = (const char *)v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
LABEL_9:

LABEL_10:
  }
}

- (id)_windowForScene:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136316418;
        int v18 = "-[MapsInternalAlertPresentationController _windowForScene:]";
        __int16 v19 = 2080;
        __int16 v20 = "MapsInternalAlertPresentationController.m";
        __int16 v21 = 1024;
        int v22 = 69;
        __int16 v23 = 2080;
        __int16 v24 = "dispatch_get_main_queue()";
        __int16 v25 = 2080;
        __int16 v26 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v27 = 2080;
        __int16 v28 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v17,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v12 = sub_1005762E4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = +[NSThread callStackSymbols];
          int v17 = 138412290;
          int v18 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);
        }
      }
    }
  }
  if (!v4)
  {
    v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315906;
      int v18 = "-[MapsInternalAlertPresentationController _windowForScene:]";
      __int16 v19 = 2080;
      __int16 v20 = "MapsInternalAlertPresentationController.m";
      __int16 v21 = 1024;
      int v22 = 70;
      __int16 v23 = 2080;
      __int16 v24 = "windowScene != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v17, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = +[NSThread callStackSymbols];
        int v17 = 138412290;
        int v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  v8 = [(NSMapTable *)self->_windowMap objectForKey:v4];
  if (!v8)
  {
    v8 = [[PassThroughWindow alloc] initWithWindowScene:v4];
    [(PassThroughWindow *)v8 setWindowLevel:UIWindowLevelAlert];
    id v9 = objc_alloc_init((Class)UIApplicationRotationFollowingController);
    [v9 setSizesWindowToScene:1];
    [(PassThroughWindow *)v8 setRootViewController:v9];
    [(PassThroughWindow *)v8 setHidden:0];
    [(NSMapTable *)self->_windowMap setObject:v8 forKey:v4];
  }

  return v8;
}

- (void)_dismissalTransitionDidEndNotification:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v24 = "-[MapsInternalAlertPresentationController _dismissalTransitionDidEndNotification:]";
        __int16 v25 = 2080;
        __int16 v26 = "MapsInternalAlertPresentationController.m";
        __int16 v27 = 1024;
        int v28 = 88;
        __int16 v29 = 2080;
        v30 = "dispatch_get_main_queue()";
        __int16 v31 = 2080;
        v32 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v33 = 2080;
        v34 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        int v17 = sub_1005762E4();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v18 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          __int16 v24 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  v8 = [v4 object];
  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 removeObserver:self name:UIPresentationControllerDismissalTransitionDidEndNotification object:v8];

  BOOL v10 = [v8 view];
  v11 = [v10 window];
  v12 = [v11 windowScene];

  if (v12)
  {
    [(NSMapTable *)self->_windowMap objectForKey:v12];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10063ED00;
    block[3] = &unk_1012E66E0;
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v21 = self;
    id v22 = v12;
    v13 = v20;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_9:
    goto LABEL_10;
  }
  v14 = sub_1005762E4();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v24 = "-[MapsInternalAlertPresentationController _dismissalTransitionDidEndNotification:]";
    __int16 v25 = 2080;
    __int16 v26 = "MapsInternalAlertPresentationController.m";
    __int16 v27 = 1024;
    int v28 = 93;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412290;
      __int16 v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    goto LABEL_9;
  }
LABEL_10:
}

- (void).cxx_destruct
{
}

@end