@interface PedestrianARSessionMapsSkyMonitor
+ (BOOL)isEnabled;
+ (id)friendlyName;
- (NSString)debugDescription;
- (PedestrianARSessionMapsSkyMonitor)initWithObserver:(id)a3;
- (void)dealloc;
- (void)updateState;
- (void)valueChangedForMapsFeature:(id)a3 enabled:(BOOL)a4;
@end

@implementation PedestrianARSessionMapsSkyMonitor

- (PedestrianARSessionMapsSkyMonitor)initWithObserver:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PedestrianARSessionMapsSkyMonitor;
  v3 = [(PedestrianARSessionMonitor *)&v6 initWithObserver:a3];
  if (v3)
  {
    v4 = sub_10000FF9C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    MapsFeature_AddDelegateListener();
    [(PedestrianARSessionMapsSkyMonitor *)v3 updateState];
  }
  return v3;
}

- (void)updateState
{
  int IsAvailable_PedestrianAR = MapsFeature_IsAvailable_PedestrianAR();
  unsigned int IsEnabled_PedestrianAR = MapsFeature_IsEnabled_PedestrianAR();
  v5 = sub_10000FF9C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (IsAvailable_PedestrianAR) {
      objc_super v6 = @"YES";
    }
    else {
      objc_super v6 = @"NO";
    }
    v7 = v6;
    if (IsEnabled_PedestrianAR) {
      v8 = @"YES";
    }
    else {
      v8 = @"NO";
    }
    v9 = v8;
    int v10 = 134349570;
    v11 = self;
    __int16 v12 = 2114;
    v13 = v7;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Updating state with MapsSky authorized: %{public}@, Pedestrian AR Enabled: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [(PedestrianARSessionMonitor *)self setShouldShowPedestrianAR:IsAvailable_PedestrianAR & IsEnabled_PedestrianAR];
}

+ (BOOL)isEnabled
{
  return 1;
}

- (void)dealloc
{
  v3 = sub_10000FF9C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    objc_super v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  MapsFeature_RemoveDelegateListenerForAllKeys();
  v4.receiver = self;
  v4.super_class = (Class)PedestrianARSessionMapsSkyMonitor;
  [(PedestrianARSessionMonitor *)&v4 dealloc];
}

- (NSString)debugDescription
{
  v2 = [(id)objc_opt_class() friendlyName];
  if (MapsFeature_IsAvailable_PedestrianAR()) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  objc_super v4 = v3;
  if (MapsFeature_IsEnabled_PedestrianAR()) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  objc_super v6 = +[NSString stringWithFormat:@"%@\nMapsSky authorized: %@\nPedestrian AR enabled: %@\n", v2, v4, v5];

  return (NSString *)v6;
}

+ (id)friendlyName
{
  return @"MapsSky Monitor";
}

- (void)valueChangedForMapsFeature:(id)a3 enabled:(BOOL)a4
{
  CFStringRef v5 = sub_10000FF9C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] One of the Pedestrian AR flags changed; updating state",
      (uint8_t *)&v6,
      0xCu);
  }

  [(PedestrianARSessionMapsSkyMonitor *)self updateState];
}

@end