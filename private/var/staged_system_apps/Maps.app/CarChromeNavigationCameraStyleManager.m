@interface CarChromeNavigationCameraStyleManager
+ (CarChromeNavigationCameraStyleManager)sharedInstance;
- (BOOL)hasHadDualDisplayConnected;
- (CarChromeNavigationCameraStyleManager)init;
- (CarChromeNavigationCameraStyleManagerObserver)observers;
- (int64_t)_oppositeCameraStyle:(int64_t)a3;
- (int64_t)centerConsoleCameraStyle;
- (int64_t)centerConsoleDualDisplayCameraStyle;
- (int64_t)instrumentClusterCameraStyle;
- (unint64_t)centerConsoleSceneCount;
- (unint64_t)instrumentClusterSceneCount;
- (void)_initialize;
- (void)_teardown;
- (void)_toggleCameraStyle;
- (void)_updateCameraStyles;
- (void)_updateSceneCounts;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)setCenterConsoleCameraStyle:(int64_t)a3;
- (void)setCenterConsoleDualDisplayCameraStyle:(int64_t)a3;
- (void)setCenterConsoleSceneCount:(unint64_t)a3;
- (void)setHasHadDualDisplayConnected:(BOOL)a3;
- (void)setInstrumentClusterCameraStyle:(int64_t)a3;
- (void)setInstrumentClusterSceneCount:(unint64_t)a3;
- (void)setObservers:(id)a3;
- (void)toggleCameraStyle;
- (void)unregisterObserver:(id)a3;
@end

@implementation CarChromeNavigationCameraStyleManager

+ (CarChromeNavigationCameraStyleManager)sharedInstance
{
  if (qword_1016109B0 != -1) {
    dispatch_once(&qword_1016109B0, &stru_10131A630);
  }
  v2 = (void *)qword_1016109A8;

  return (CarChromeNavigationCameraStyleManager *)v2;
}

- (CarChromeNavigationCameraStyleManager)init
{
  v28.receiver = self;
  v28.super_class = (Class)CarChromeNavigationCameraStyleManager;
  v2 = [(CarChromeNavigationCameraStyleManager *)&v28 init];
  if (v2)
  {
    v3 = sub_100BAE5E0();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(CarChromeNavigationCameraStyleManager *)v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Initializing", buf, 0xCu);

LABEL_9:
    v10 = (CarChromeNavigationCameraStyleManagerObserver *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___CarChromeNavigationCameraStyleManagerObserver queue:&_dispatch_main_q];
    observers = v2->_observers;
    v2->_observers = v10;

    id v12 = +[NSNumber numberWithInteger:1];
    v13 = +[NSUserDefaults standardUserDefaults];
    v14 = [v13 objectForKey:@"CarNavigationCameraStyle"];

    if (v14) {
      v15 = v14;
    }
    else {
      v15 = v12;
    }
    id v16 = v15;

    id v17 = [v16 integerValue];
    [(CarChromeNavigationCameraStyleManager *)v2 setCenterConsoleCameraStyle:v17];
    v18 = sub_100BAE5E0();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      goto LABEL_22;
    }
    v19 = v2;
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    if (objc_opt_respondsToSelector())
    {
      v22 = [(CarChromeNavigationCameraStyleManager *)v19 performSelector:"accessibilityIdentifier"];
      v23 = v22;
      if (v22 && ![v22 isEqualToString:v21])
      {
        v24 = +[NSString stringWithFormat:@"%@<%p, %@>", v21, v19, v23];

        goto LABEL_18;
      }
    }
    v24 = +[NSString stringWithFormat:@"%@<%p>", v21, v19];
LABEL_18:

    unint64_t centerConsoleCameraStyle = v19->_centerConsoleCameraStyle;
    if (centerConsoleCameraStyle > 4) {
      CFStringRef v26 = @".Unknown";
    }
    else {
      CFStringRef v26 = *(&off_10131A670 + centerConsoleCameraStyle);
    }
    *(_DWORD *)buf = 138543618;
    v30 = v24;
    __int16 v31 = 2112;
    CFStringRef v32 = v26;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}@] Initializing with camera style: %@", buf, 0x16u);

LABEL_22:
  }
  return v2;
}

- (void)dealloc
{
  v3 = sub_100BAE5E0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = self;
    if (!v4)
    {
      v9 = @"<nil>";
      goto LABEL_10;
    }
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(CarChromeNavigationCameraStyleManager *)v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Deallocating", buf, 0xCu);
  }
  v10.receiver = self;
  v10.super_class = (Class)CarChromeNavigationCameraStyleManager;
  [(CarChromeNavigationCameraStyleManager *)&v10 dealloc];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  v5 = sub_100BAE5E0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self;
    if (!v6)
    {
      v11 = @"<nil>";
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(CarChromeNavigationCameraStyleManager *)v6 performSelector:"accessibilityIdentifier"];
      objc_super v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v24 = v11;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Registering observer: %@", buf, 0x16u);
  }
  id v12 = [(CarChromeNavigationCameraStyleManager *)self observers];
  [v12 registerObserver:v4];

  v13 = [(CarChromeNavigationCameraStyleManager *)self observers];
  v14 = [v13 allObservers];
  id v15 = [v14 count];

  if (v15 == (id)1)
  {
    id v16 = sub_100BAE5E0();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
LABEL_22:

      [(CarChromeNavigationCameraStyleManager *)self _initialize];
      goto LABEL_23;
    }
    id v17 = self;
    if (!v17)
    {
      v22 = @"<nil>";
      goto LABEL_21;
    }
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    if (objc_opt_respondsToSelector())
    {
      v20 = [(CarChromeNavigationCameraStyleManager *)v17 performSelector:"accessibilityIdentifier"];
      v21 = v20;
      if (v20 && ![v20 isEqualToString:v19])
      {
        v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

        goto LABEL_19;
      }
    }
    v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_19:

LABEL_21:
    *(_DWORD *)buf = 138543362;
    v24 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] Got 1st observer; will initialize now",
      buf,
      0xCu);

    goto LABEL_22;
  }
LABEL_23:
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  v5 = sub_100BAE5E0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self;
    if (!v6)
    {
      v11 = @"<nil>";
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(CarChromeNavigationCameraStyleManager *)v6 performSelector:"accessibilityIdentifier"];
      objc_super v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v24 = v11;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Unregistering observer: %@", buf, 0x16u);
  }
  id v12 = [(CarChromeNavigationCameraStyleManager *)self observers];
  [v12 unregisterObserver:v4];

  v13 = [(CarChromeNavigationCameraStyleManager *)self observers];
  v14 = [v13 allObservers];
  id v15 = [v14 count];

  if (!v15)
  {
    id v16 = sub_100BAE5E0();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
LABEL_22:

      [(CarChromeNavigationCameraStyleManager *)self _teardown];
      goto LABEL_23;
    }
    id v17 = self;
    if (!v17)
    {
      v22 = @"<nil>";
      goto LABEL_21;
    }
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    if (objc_opt_respondsToSelector())
    {
      v20 = [(CarChromeNavigationCameraStyleManager *)v17 performSelector:"accessibilityIdentifier"];
      v21 = v20;
      if (v20 && ![v20 isEqualToString:v19])
      {
        v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

        goto LABEL_19;
      }
    }
    v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_19:

LABEL_21:
    *(_DWORD *)buf = 138543362;
    v24 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] Lost last observer; will tear down now",
      buf,
      0xCu);

    goto LABEL_22;
  }
LABEL_23:
}

- (void)toggleCameraStyle
{
  [(CarChromeNavigationCameraStyleManager *)self _toggleCameraStyle];
  if (!self->_instrumentClusterSceneCount)
  {
    id v6 = +[NSNumber numberWithInteger:self->_centerConsoleCameraStyle];
    v3 = +[NSUserDefaults standardUserDefaults];
    if (v6)
    {
      CFStringRef v4 = @"CarNavigationCameraStyle";
      goto LABEL_7;
    }
    CFStringRef v5 = @"CarNavigationCameraStyle";
LABEL_11:
    [v3 removeObjectForKey:v5];
    id v6 = 0;
    goto LABEL_12;
  }
  if (!self->_centerConsoleSceneCount) {
    return;
  }
  id v6 = +[NSNumber numberWithInteger:self->_centerConsoleCameraStyle];
  v3 = +[NSUserDefaults standardUserDefaults];
  if (!v6)
  {
    CFStringRef v5 = @"CarNavigationDualDisplayCameraStyle";
    goto LABEL_11;
  }
  CFStringRef v4 = @"CarNavigationDualDisplayCameraStyle";
LABEL_7:
  [v3 setObject:v6 forKey:v4];
LABEL_12:
}

- (void)_initialize
{
  if (GEOConfigGetBOOL())
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"carDisplayConfigDidChangeNotification:" name:@"CarDisplayConfigDidChangeNotification" object:0];

    [(CarChromeNavigationCameraStyleManager *)self _updateSceneCounts];
    CFStringRef v4 = sub_100BAE5E0();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      return;
    }
    CFStringRef v5 = self;
    if (!v5)
    {
      objc_super v10 = @"<nil>";
      goto LABEL_11;
    }
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(CarChromeNavigationCameraStyleManager *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        objc_super v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_9;
      }
    }
    objc_super v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_9:

LABEL_11:
    unint64_t instrumentClusterSceneCount = v5->_instrumentClusterSceneCount;
    unint64_t centerConsoleSceneCount = v5->_centerConsoleSceneCount;
    *(_DWORD *)buf = 138543874;
    v14 = v10;
    __int16 v15 = 2048;
    unint64_t v16 = instrumentClusterSceneCount;
    __int16 v17 = 2048;
    unint64_t v18 = centerConsoleSceneCount;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Initializing with %lu IC screens & %lu CC screens", buf, 0x20u);

    goto LABEL_12;
  }
}

- (void)_teardown
{
  v3 = sub_100BAE5E0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    CFStringRef v4 = self;
    if (!v4)
    {
      v9 = @"<nil>";
      goto LABEL_10;
    }
    CFStringRef v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(CarChromeNavigationCameraStyleManager *)v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Tearing down", buf, 0xCu);
  }
  self->_hasHadDualDisplayConnected = 0;
  self->_unint64_t instrumentClusterSceneCount = 0;
  self->_unint64_t centerConsoleSceneCount = 0;
  self->_centerConsoleDualDisplayCameraStyle = self->_centerConsoleCameraStyle;
  objc_super v10 = +[NSNotificationCenter defaultCenter];
  [v10 removeObserver:self];
}

- (void)_toggleCameraStyle
{
  v3 = sub_100BAE5E0();
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
    goto LABEL_14;
  }
  CFStringRef v4 = self;
  if (!v4)
  {
    v9 = @"<nil>";
    goto LABEL_10;
  }
  CFStringRef v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  if (objc_opt_respondsToSelector())
  {
    v7 = [(CarChromeNavigationCameraStyleManager *)v4 performSelector:"accessibilityIdentifier"];
    v8 = v7;
    if (v7 && ![v7 isEqualToString:v6])
    {
      v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

      goto LABEL_8;
    }
  }
  v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
  unint64_t v10 = [(CarChromeNavigationCameraStyleManager *)v4 centerConsoleCameraStyle];
  if (v10 > 4) {
    CFStringRef v11 = @".Unknown";
  }
  else {
    CFStringRef v11 = *(&off_10131A670 + v10);
  }
  *(_DWORD *)buf = 138543618;
  v13 = v9;
  __int16 v14 = 2112;
  CFStringRef v15 = v11;
  _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Toggling camera style from existing style: %@", buf, 0x16u);

LABEL_14:
  [(CarChromeNavigationCameraStyleManager *)self setCenterConsoleCameraStyle:[(CarChromeNavigationCameraStyleManager *)self _oppositeCameraStyle:[(CarChromeNavigationCameraStyleManager *)self centerConsoleCameraStyle]]];
}

- (int64_t)_oppositeCameraStyle:(int64_t)a3
{
  if (a3 == 2) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)setCenterConsoleCameraStyle:(int64_t)a3
{
  if (self->_centerConsoleSceneCount && self->_instrumentClusterSceneCount)
  {
    CFStringRef v5 = sub_100BAE5E0();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_13:

      self->_centerConsoleDualDisplayCameraStyle = a3;
      goto LABEL_14;
    }
    id v6 = self;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(CarChromeNavigationCameraStyleManager *)v6 performSelector:"accessibilityIdentifier"];
      unint64_t v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        CFStringRef v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_9;
      }
    }
    CFStringRef v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_9:

    if ((unint64_t)a3 > 4) {
      CFStringRef v12 = @".Unknown";
    }
    else {
      CFStringRef v12 = *(&off_10131A670 + a3);
    }
    *(_DWORD *)buf = 138543618;
    v23 = v11;
    __int16 v24 = 2112;
    CFStringRef v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Updating dual display camera style: %@", buf, 0x16u);

    goto LABEL_13;
  }
LABEL_14:
  if (self->_centerConsoleCameraStyle == a3) {
    return;
  }
  v13 = sub_100BAE5E0();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = self;
    CFStringRef v15 = (objc_class *)objc_opt_class();
    unint64_t v16 = NSStringFromClass(v15);
    if (objc_opt_respondsToSelector())
    {
      __int16 v17 = [(CarChromeNavigationCameraStyleManager *)v14 performSelector:"accessibilityIdentifier"];
      unint64_t v18 = v17;
      if (v17 && ![v17 isEqualToString:v16])
      {
        v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

        goto LABEL_21;
      }
    }
    v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_21:

    if ((unint64_t)a3 > 4) {
      CFStringRef v20 = @".Unknown";
    }
    else {
      CFStringRef v20 = *(&off_10131A670 + a3);
    }
    *(_DWORD *)buf = 138543618;
    v23 = v19;
    __int16 v24 = 2112;
    CFStringRef v25 = v20;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}@] Got new CS camera style style: %@", buf, 0x16u);
  }
  self->_unint64_t centerConsoleCameraStyle = a3;
  [(CarChromeNavigationCameraStyleManager *)self setInstrumentClusterCameraStyle:[(CarChromeNavigationCameraStyleManager *)self _oppositeCameraStyle:a3]];
  v21 = [(CarChromeNavigationCameraStyleManager *)self observers];
  [v21 carChromeNavigationCameraStyleManager:self didChangeCenterConsoleCameraStyle:self->_centerConsoleCameraStyle];
}

- (void)setInstrumentClusterCameraStyle:(int64_t)a3
{
  if (self->_instrumentClusterCameraStyle != a3)
  {
    CFStringRef v5 = sub_100BAE5E0();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      self->_instrumentClusterCameraStyle = a3;
      v13 = [(CarChromeNavigationCameraStyleManager *)self observers];
      [v13 carChromeNavigationCameraStyleManager:self didChangeInstrumentClusterCameraStyle:self->_instrumentClusterCameraStyle];

      return;
    }
    id v6 = self;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(CarChromeNavigationCameraStyleManager *)v6 performSelector:"accessibilityIdentifier"];
      unint64_t v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        CFStringRef v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    CFStringRef v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    if ((unint64_t)a3 > 4) {
      CFStringRef v12 = @".Unknown";
    }
    else {
      CFStringRef v12 = *(&off_10131A670 + a3);
    }
    *(_DWORD *)buf = 138543618;
    CFStringRef v15 = v11;
    __int16 v16 = 2112;
    CFStringRef v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Got new IC camera style style: %@", buf, 0x16u);

    goto LABEL_12;
  }
}

- (void)_updateSceneCounts
{
  [(CarChromeNavigationCameraStyleManager *)self setInstrumentClusterSceneCount:+[CarDisplayConfigAuxiliaryTask instrumentClusterSceneCount]];
  [(CarChromeNavigationCameraStyleManager *)self setCenterConsoleSceneCount:+[CarDisplayConfigAuxiliaryTask centerConsoleSceneCount]];

  [(CarChromeNavigationCameraStyleManager *)self _updateCameraStyles];
}

- (void)_updateCameraStyles
{
  unint64_t instrumentClusterSceneCount = self->_instrumentClusterSceneCount;
  if (!self->_centerConsoleSceneCount)
  {
    if (!instrumentClusterSceneCount) {
      return;
    }
    v21 = sub_100BAE5E0();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
    v22 = self;
    v23 = (objc_class *)objc_opt_class();
    __int16 v24 = NSStringFromClass(v23);
    if (objc_opt_respondsToSelector())
    {
      CFStringRef v25 = [(CarChromeNavigationCameraStyleManager *)v22 performSelector:"accessibilityIdentifier"];
      id v26 = v25;
      if (v25 && ![v25 isEqualToString:v24])
      {
        v27 = +[NSString stringWithFormat:@"%@<%p, %@>", v24, v22, v26];

        goto LABEL_26;
      }
    }
    v27 = +[NSString stringWithFormat:@"%@<%p>", v24, v22];
LABEL_26:

    *(_DWORD *)buf = 138543362;
    v60 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}@] Updating camera style with only IC", buf, 0xCu);

LABEL_27:
    BOOL v28 = GEOConfigGetInteger() == 1;
    goto LABEL_56;
  }
  CFStringRef v4 = sub_100BAE5E0();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (!instrumentClusterSceneCount)
  {
    if (!v5)
    {
LABEL_35:

      v35 = +[NSNumber numberWithInteger:1];
      v36 = +[NSUserDefaults standardUserDefaults];
      v37 = [v36 objectForKey:@"CarNavigationCameraStyle"];

      if (v37) {
        v38 = v37;
      }
      else {
        v38 = v35;
      }
      v39 = v38;

      unint64_t v40 = (unint64_t)[v39 integerValue];
      goto LABEL_65;
    }
    v29 = self;
    v30 = (objc_class *)objc_opt_class();
    __int16 v31 = NSStringFromClass(v30);
    if (objc_opt_respondsToSelector())
    {
      CFStringRef v32 = [(CarChromeNavigationCameraStyleManager *)v29 performSelector:"accessibilityIdentifier"];
      v33 = v32;
      if (v32 && ![v32 isEqualToString:v31])
      {
        v34 = +[NSString stringWithFormat:@"%@<%p, %@>", v31, v29, v33];

        goto LABEL_34;
      }
    }
    v34 = +[NSString stringWithFormat:@"%@<%p>", v31, v29];
LABEL_34:

    *(_DWORD *)buf = 138543362;
    v60 = v34;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Updating camera style with only CS", buf, 0xCu);

    goto LABEL_35;
  }
  if (!v5) {
    goto LABEL_10;
  }
  id v6 = self;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  if (objc_opt_respondsToSelector())
  {
    v9 = [(CarChromeNavigationCameraStyleManager *)v6 performSelector:"accessibilityIdentifier"];
    unint64_t v10 = v9;
    if (v9 && ![v9 isEqualToString:v8])
    {
      CFStringRef v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

      goto LABEL_9;
    }
  }
  CFStringRef v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_9:

  *(_DWORD *)buf = 138543362;
  v60 = v11;
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Updating camera style with dual displays", buf, 0xCu);

LABEL_10:
  if (![(CarChromeNavigationCameraStyleManager *)self hasHadDualDisplayConnected])
  {
    [(CarChromeNavigationCameraStyleManager *)self setHasHadDualDisplayConnected:1];
    v41 = +[NSUserDefaults standardUserDefaults];
    v42 = [v41 objectForKey:@"CarNavigationDualDisplayCameraStyle"];

    if (v42)
    {
      v43 = +[NSUserDefaults standardUserDefaults];
      unint64_t v40 = (unint64_t)[v43 integerForKey:@"CarNavigationDualDisplayCameraStyle"];

      v35 = sub_100BAE5E0();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
LABEL_65:

        goto LABEL_66;
      }
      v44 = self;
      v45 = (objc_class *)objc_opt_class();
      v46 = NSStringFromClass(v45);
      if (objc_opt_respondsToSelector())
      {
        v47 = [(CarChromeNavigationCameraStyleManager *)v44 performSelector:"accessibilityIdentifier"];
        v48 = v47;
        if (v47 && ![v47 isEqualToString:v46])
        {
          v49 = +[NSString stringWithFormat:@"%@<%p, %@>", v46, v44, v48];

          goto LABEL_46;
        }
      }
      v49 = +[NSString stringWithFormat:@"%@<%p>", v46, v44];
LABEL_46:

      if (v40 > 4) {
        CFStringRef v50 = @".Unknown";
      }
      else {
        CFStringRef v50 = *(&off_10131A670 + v40);
      }
      *(_DWORD *)buf = 138543618;
      v60 = v49;
      __int16 v61 = 2112;
      uint64_t v62 = (uint64_t)v50;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "[%{public}@] This is the first time dual displays have been connected; using saved camera style default: %@",
        buf,
        0x16u);

      goto LABEL_65;
    }
    uint64_t Integer = GEOConfigGetInteger();
    v52 = sub_100BAE5E0();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_INFO)) {
      goto LABEL_55;
    }
    v53 = self;
    v54 = (objc_class *)objc_opt_class();
    v55 = NSStringFromClass(v54);
    if (objc_opt_respondsToSelector())
    {
      v56 = [(CarChromeNavigationCameraStyleManager *)v53 performSelector:"accessibilityIdentifier"];
      v57 = v56;
      if (v56 && ![v56 isEqualToString:v55])
      {
        v58 = +[NSString stringWithFormat:@"%@<%p, %@>", v55, v53, v57];

        goto LABEL_54;
      }
    }
    v58 = +[NSString stringWithFormat:@"%@<%p>", v55, v53];
LABEL_54:

    *(_DWORD *)buf = 138543618;
    v60 = v58;
    __int16 v61 = 2048;
    uint64_t v62 = Integer;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "[%{public}@] This is the first time dual displays have been connected; use behavior %ld",
      buf,
      0x16u);

LABEL_55:
    BOOL v28 = Integer == 1;
LABEL_56:
    if (v28) {
      unint64_t v40 = 1;
    }
    else {
      unint64_t v40 = 2;
    }
    goto LABEL_66;
  }
  CFStringRef v12 = sub_100BAE5E0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = self;
    __int16 v14 = (objc_class *)objc_opt_class();
    CFStringRef v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      __int16 v16 = [(CarChromeNavigationCameraStyleManager *)v13 performSelector:"accessibilityIdentifier"];
      CFStringRef v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        unint64_t v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_17;
      }
    }
    unint64_t v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_17:

    unint64_t v19 = [(CarChromeNavigationCameraStyleManager *)v13 centerConsoleDualDisplayCameraStyle];
    if (v19 > 4) {
      CFStringRef v20 = @".Unknown";
    }
    else {
      CFStringRef v20 = *(&off_10131A670 + v19);
    }
    *(_DWORD *)buf = 138543618;
    v60 = v18;
    __int16 v61 = 2112;
    uint64_t v62 = (uint64_t)v20;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] Dual displays have been connected more than once; use the last saved camera style: %@",
      buf,
      0x16u);
  }
  unint64_t v40 = [(CarChromeNavigationCameraStyleManager *)self centerConsoleDualDisplayCameraStyle];
LABEL_66:
  [(CarChromeNavigationCameraStyleManager *)self setCenterConsoleCameraStyle:v40];
}

- (int64_t)centerConsoleCameraStyle
{
  return self->_centerConsoleCameraStyle;
}

- (int64_t)instrumentClusterCameraStyle
{
  return self->_instrumentClusterCameraStyle;
}

- (CarChromeNavigationCameraStyleManagerObserver)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (int64_t)centerConsoleDualDisplayCameraStyle
{
  return self->_centerConsoleDualDisplayCameraStyle;
}

- (void)setCenterConsoleDualDisplayCameraStyle:(int64_t)a3
{
  self->_centerConsoleDualDisplayCameraStyle = a3;
}

- (unint64_t)instrumentClusterSceneCount
{
  return self->_instrumentClusterSceneCount;
}

- (void)setInstrumentClusterSceneCount:(unint64_t)a3
{
  self->_unint64_t instrumentClusterSceneCount = a3;
}

- (unint64_t)centerConsoleSceneCount
{
  return self->_centerConsoleSceneCount;
}

- (void)setCenterConsoleSceneCount:(unint64_t)a3
{
  self->_unint64_t centerConsoleSceneCount = a3;
}

- (BOOL)hasHadDualDisplayConnected
{
  return self->_hasHadDualDisplayConnected;
}

- (void)setHasHadDualDisplayConnected:(BOOL)a3
{
  self->_hasHadDualDisplayConnected = a3;
}

- (void).cxx_destruct
{
}

@end