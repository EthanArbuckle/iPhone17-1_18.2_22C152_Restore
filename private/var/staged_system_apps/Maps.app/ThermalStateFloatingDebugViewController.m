@interface ThermalStateFloatingDebugViewController
+ (BOOL)shouldAttachOnLaunch;
+ (ThermalStateFloatingDebugViewController)sharedInstance;
- (BOOL)_canShowWhileLocked;
- (GCDTimer)debugInfoRefreshTimer;
- (ThermalStateFloatingDebugViewController)init;
- (UILabel)debugLabel;
- (id)additionalLongPressActions;
- (id)debugText;
- (id)iconText;
- (id)tintColor;
- (void)attach;
- (void)composeTTR;
- (void)dealloc;
- (void)detach;
- (void)didUpdateThermalPressureLevel:(int)a3;
- (void)setDebugInfoRefreshTimer:(id)a3;
- (void)setDebugLabel:(id)a3;
- (void)startDebugInfoRefreshTimer;
- (void)updateDebugText;
- (void)updateViewForCurrentState;
- (void)viewDidLoad;
@end

@implementation ThermalStateFloatingDebugViewController

+ (ThermalStateFloatingDebugViewController)sharedInstance
{
  if (qword_10160FCE8 != -1) {
    dispatch_once(&qword_10160FCE8, &stru_1012FEDC0);
  }
  v2 = (void *)qword_10160FCE0;

  return (ThermalStateFloatingDebugViewController *)v2;
}

- (ThermalStateFloatingDebugViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)ThermalStateFloatingDebugViewController;
  v2 = [(MapsFloatingDebugViewController *)&v8 init];
  if (v2)
  {
    v3 = sub_10089E2A0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = +[MapsThermalPressureController sharedController];
      unsigned int v5 = [v4 currentThermalPressureLevel];
      *(_DWORD *)buf = 134349312;
      v10 = v2;
      __int16 v11 = 1024;
      unsigned int v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Initializing with thermal level: %d", buf, 0x12u);
    }
    v6 = +[MapsThermalPressureController sharedController];
    [v6 addThermalPressureObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = sub_10089E2A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4 = +[MapsThermalPressureController sharedController];
  [v4 removeThermalPressureObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)ThermalStateFloatingDebugViewController;
  [(ThermalStateFloatingDebugViewController *)&v5 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)ThermalStateFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v29 viewDidLoad];
  v3 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:3 scale:35.0];
  v4 = +[UIImage systemImageNamed:@"flame" withConfiguration:v3];
  objc_super v5 = [v4 imageWithRenderingMode:2];
  v6 = [(MapsFloatingDebugViewController *)self thumbnailImageView];
  [v6 setImage:v5];

  v28 = +[NSMutableArray array];
  v7 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  objc_super v8 = +[UIFont monospacedSystemFontOfSize:9.0 weight:UIFontWeightRegular];
  [(UILabel *)v7 setFont:v8];

  [(UILabel *)v7 setNumberOfLines:0];
  [(UILabel *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  debugLabel = self->_debugLabel;
  self->_debugLabel = v7;

  v10 = [(MapsFloatingDebugViewController *)self contentView];
  [v10 addSubview:self->_debugLabel];

  v26 = [(UILabel *)self->_debugLabel topAnchor];
  v27 = [(MapsFloatingDebugViewController *)self contentView];
  v25 = [v27 topAnchor];
  v24 = [v26 constraintEqualToAnchor:v25 constant:5.0];
  v30[0] = v24;
  v22 = [(UILabel *)self->_debugLabel bottomAnchor];
  v23 = [(MapsFloatingDebugViewController *)self contentView];
  v21 = [v23 bottomAnchor];
  v20 = [v22 constraintEqualToAnchor:v21 constant:-5.0];
  v30[1] = v20;
  __int16 v11 = [(UILabel *)self->_debugLabel leadingAnchor];
  unsigned int v12 = [(MapsFloatingDebugViewController *)self contentView];
  v13 = [v12 leadingAnchor];
  v14 = [v11 constraintEqualToAnchor:v13 constant:5.0];
  v30[2] = v14;
  v15 = [(UILabel *)self->_debugLabel trailingAnchor];
  v16 = [(MapsFloatingDebugViewController *)self contentView];
  v17 = [v16 trailingAnchor];
  v18 = [v15 constraintEqualToAnchor:v17 constant:-5.0];
  v30[3] = v18;
  v19 = +[NSArray arrayWithObjects:v30 count:4];
  [v28 addObjectsFromArray:v19];

  +[NSLayoutConstraint activateConstraints:v28];
}

+ (BOOL)shouldAttachOnLaunch
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"kThermalStateFloatingDebugViewControllerAttachedKey"];

  return v3;
}

- (void)attach
{
  v5.receiver = self;
  v5.super_class = (Class)ThermalStateFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v5 attach];
  unsigned __int8 v3 = sub_10089E2A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Attaching", buf, 0xCu);
  }

  v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:1 forKey:@"kThermalStateFloatingDebugViewControllerAttachedKey"];
}

- (void)detach
{
  v5.receiver = self;
  v5.super_class = (Class)ThermalStateFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v5 detach];
  unsigned __int8 v3 = sub_10089E2A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Detaching", buf, 0xCu);
  }

  v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:0 forKey:@"kThermalStateFloatingDebugViewControllerAttachedKey"];
}

- (id)tintColor
{
  v2 = +[MapsThermalPressureController sharedController];
  unsigned int v3 = [v2 currentThermalPressureLevel];

  if (v3 < 0x1E)
  {
    objc_super v5 = +[MapsThermalPressureController sharedController];
    unsigned int v6 = [v5 currentThermalPressureLevel];

    if (v6 < 0x14)
    {
      v7 = +[MapsThermalPressureController sharedController];
      unsigned int v8 = [v7 currentThermalPressureLevel];

      if (v8 < 0xA) {
        +[UIColor greenColor];
      }
      else {
      v4 = +[UIColor yellowColor];
      }
    }
    else
    {
      v4 = +[UIColor orangeColor];
    }
  }
  else
  {
    v4 = +[UIColor redColor];
  }
  v9 = v4;
  v10 = [v4 colorWithAlphaComponent:0.699999988];

  return v10;
}

- (id)iconText
{
  v2 = +[MapsThermalPressureController sharedController];
  unsigned int v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Thermal: %d", [v2 currentThermalPressureLevel]);

  return v3;
}

- (id)debugText
{
  if (qword_10160FCF0 != -1) {
    dispatch_once(&qword_10160FCF0, &stru_1012FEDE0);
  }
  v56[0] = NSForegroundColorAttributeName;
  v2 = +[UIColor whiteColor];
  v57[0] = v2;
  v56[1] = NSFontAttributeName;
  unsigned int v3 = +[UIFont systemFontOfSize:17.0];
  v57[1] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];

  id v5 = [objc_alloc((Class)NSMutableAttributedString) initWithString:&stru_101324E70 attributes:v4];
  unsigned int v6 = +[NSDate date];
  id v7 = objc_alloc((Class)NSAttributedString);
  unsigned int v8 = [(id)qword_10160FCF8 stringFromDate:v6];
  v43 = (void *)v4;
  id v9 = [v7 initWithString:v8 attributes:v4];
  [v5 appendAttributedString:v9];

  v54[0] = NSForegroundColorAttributeName;
  v10 = +[UIColor whiteColor];
  v54[1] = NSFontAttributeName;
  v55[0] = v10;
  __int16 v11 = +[UIFont systemFontOfSize:15.0];
  v55[1] = v11;
  unsigned int v12 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];

  id v13 = objc_alloc((Class)NSAttributedString);
  v14 = +[MapsThermalPressureController sharedController];
  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"\nThermal state: %d", [v14 currentThermalPressureLevel]);
  id v16 = [v13 initWithString:v15 attributes:v12];
  id v46 = v5;
  [v5 appendAttributedString:v16];

  v52[0] = NSForegroundColorAttributeName;
  v17 = +[UIColor whiteColor];
  v52[1] = NSFontAttributeName;
  v53[0] = v17;
  v18 = +[UIFont systemFontOfSize:15.0];
  v53[1] = v18;
  v45 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];

  v19 = +[UIApplication sharedApplication];
  v20 = [v19 connectedScenes];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v21 = v20;
  id v22 = [v21 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v48;
    id v44 = v21;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v48 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v27 = v26;
          v28 = [v27 delegate];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          v30 = [v27 delegate];
          v31 = v30;
          if (isKindOfClass)
          {
            v32 = [v30 chromeViewController];
            v33 = [v32 mapView];

            if (v33)
            {
              v34 = [v33 _mapLayer];
              id v35 = objc_alloc((Class)NSAttributedString);
              v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"\n\n📱VKMapView[%p]\nNavigation display rate: %ld\nRegular display rate: %ld", v34, [v34 navigationDisplayRate], objc_msgSend(v34, "displayRate"));
              v37 = v35;
              goto LABEL_15;
            }
            goto LABEL_16;
          }
          objc_opt_class();
          char v38 = objc_opt_isKindOfClass();

          if (v38)
          {
            v31 = [v27 delegate];
            v39 = [v31 carChromeViewController];
            v33 = [v39 mapView];

            if (v33)
            {
              v34 = [v33 _mapLayer];
              id v40 = objc_alloc((Class)NSAttributedString);
              v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"\n\n🚗VKMapView[%p]\nNavigation display rate: %ld\nRegular display rate: %ld", v34, [v34 navigationDisplayRate], objc_msgSend(v34, "displayRate"));
              v37 = v40;
LABEL_15:
              id v41 = [v37 initWithString:v36 attributes:v45];
              [v46 appendAttributedString:v41];

              id v21 = v44;
            }
LABEL_16:
          }
          continue;
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v23);
  }

  return v46;
}

- (void)updateViewForCurrentState
{
  v6.receiver = self;
  v6.super_class = (Class)ThermalStateFloatingDebugViewController;
  [(MapsFloatingDebugViewController *)&v6 updateViewForCurrentState];
  unsigned int v3 = sub_10089E2A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int64_t v4 = [(MapsFloatingDebugViewController *)self viewState];
    *(_DWORD *)buf = 134349312;
    unsigned int v8 = self;
    __int16 v9 = 2048;
    int64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Updating view for state: %ld", buf, 0x16u);
  }

  int64_t v5 = [(MapsFloatingDebugViewController *)self viewState];
  if (v5 == 1)
  {
    [(ThermalStateFloatingDebugViewController *)self updateDebugText];
    [(ThermalStateFloatingDebugViewController *)self startDebugInfoRefreshTimer];
  }
  else if (!v5)
  {
    [(ThermalStateFloatingDebugViewController *)self setDebugInfoRefreshTimer:0];
  }
}

- (void)updateDebugText
{
  unsigned int v3 = [(ThermalStateFloatingDebugViewController *)self view];
  [v3 setHidden:0];

  id v5 = [(ThermalStateFloatingDebugViewController *)self debugText];
  int64_t v4 = [(ThermalStateFloatingDebugViewController *)self debugLabel];
  [v4 setAttributedText:v5];
}

- (void)startDebugInfoRefreshTimer
{
  unsigned int v3 = sub_10089E2A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    __int16 v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Starting periodic refresh timer", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v4 = &_dispatch_main_q;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10089F424;
  v6[3] = &unk_1012E7638;
  objc_copyWeak(&v7, (id *)buf);
  id v5 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v6 block:0.5];
  [(ThermalStateFloatingDebugViewController *)self setDebugInfoRefreshTimer:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (id)additionalLongPressActions
{
  objc_initWeak(&location, self);
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  id v7 = sub_10089F5D0;
  unsigned int v8 = &unk_1012E8EB8;
  objc_copyWeak(&v9, &location);
  v2 = +[UIAlertAction actionWithTitle:@"File a radar" style:0 handler:&v5];
  __int16 v11 = v2;
  unsigned int v3 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

- (void)composeTTR
{
  unsigned int v3 = sub_10089E2A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Launching TTR", buf, 0xCu);
  }

  id v4 = objc_alloc_init((Class)NSDateFormatter);
  [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSSSSZZZ"];
  id v5 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:v5];

  uint64_t v6 = +[NSDate date];
  id v7 = [v4 stringFromDate:v6];
  unsigned int v8 = +[NSString stringWithFormat:@"Timestamp: %@\n\nSummary:\n\nSteps to Reproduce:\n\nResults:\n", v7];

  id v9 = objc_opt_new();
  [v9 setTitle:@"[Thermal]: "];
  [v9 setDescriptionText:v8];
  [v9 setClassification:4];
  int64_t v10 = +[MapsRadarComponent mapsClientComponent];
  [v9 setComponent:v10];

  __int16 v11 = +[MapsRadarController sharedInstance];
  [v11 launchTTRWithRadar:v9];
}

- (void)didUpdateThermalPressureLevel:(int)a3
{
  id v5 = sub_10089E2A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    id v9 = self;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Thermal state changed: %llu", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10089F91C;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (void)setDebugLabel:(id)a3
{
}

- (GCDTimer)debugInfoRefreshTimer
{
  return self->_debugInfoRefreshTimer;
}

- (void)setDebugInfoRefreshTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfoRefreshTimer, 0);

  objc_storeStrong((id *)&self->_debugLabel, 0);
}

@end