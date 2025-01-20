@interface PedestrianARSessionCarPlayConnectionMonitor
+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey;
+ (id)friendlyName;
- (PedestrianARSessionCarPlayConnectionMonitor)initWithObserver:(id)a3;
- (id)debugDescription;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)updateState;
@end

@implementation PedestrianARSessionCarPlayConnectionMonitor

- (void)updateState
{
  v3 = +[CarDisplayController sharedInstance];
  id v4 = [v3 state];

  v5 = sub_1000087EC();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4 == (id)2)
  {
    if (v6)
    {
      int v8 = 134349056;
      v9 = self;
      v7 = "[%{public}p] Detected that carplay is connected; updating state";
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    int v8 = 134349056;
    v9 = self;
    v7 = "[%{public}p] Detected that carplay is not connected; updating state";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v8, 0xCu);
  }

  [(PedestrianARSessionMonitor *)self setShouldShowPedestrianAR:v4 != (id)2];
}

- (PedestrianARSessionCarPlayConnectionMonitor)initWithObserver:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PedestrianARSessionCarPlayConnectionMonitor;
  v3 = [(PedestrianARSessionMonitor *)&v8 initWithObserver:a3];
  if (v3)
  {
    id v4 = sub_1000087EC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v5 = +[CarDisplayController sharedInstance];
    BOOL v6 = NSStringFromSelector("state");
    [v5 addObserver:v3 forKeyPath:v6 options:0 context:0];

    [(PedestrianARSessionCarPlayConnectionMonitor *)v3 updateState];
  }
  return v3;
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  uint64_t v2 = MapsConfig_PedestrianARSessionCarPlayConnectionMonitorEnabled;
  v3 = off_1015EFEC8;
  result.var0.var1 = v3;
  *(void *)&result.var0.var0 = v2;
  return result;
}

- (void)dealloc
{
  v3 = sub_1000087EC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    objc_super v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  id v4 = +[CarDisplayController sharedInstance];
  v5 = NSStringFromSelector("state");
  [v4 removeObserver:self forKeyPath:v5 context:0];

  v6.receiver = self;
  v6.super_class = (Class)PedestrianARSessionCarPlayConnectionMonitor;
  [(PedestrianARSessionMonitor *)&v6 dealloc];
}

- (id)debugDescription
{
  uint64_t v2 = [(id)objc_opt_class() friendlyName];
  v3 = +[CarDisplayController sharedInstance];
  unint64_t v4 = (unint64_t)[v3 state];
  if (v4 > 2) {
    CFStringRef v5 = @"?";
  }
  else {
    CFStringRef v5 = off_1012EB7B0[v4];
  }
  objc_super v6 = +[NSString stringWithFormat:@"%@\ncar display state: %@\n", v2, v5];

  return v6;
}

+ (id)friendlyName
{
  return @"CarPlay Connection Monitor";
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = NSStringFromSelector("state");
  if (([v10 isEqualToString:v13] & 1) == 0)
  {

    goto LABEL_7;
  }
  id v14 = +[CarDisplayController sharedInstance];

  if (v14 != v11)
  {
LABEL_7:
    v16.receiver = self;
    v16.super_class = (Class)PedestrianARSessionCarPlayConnectionMonitor;
    [(PedestrianARSessionCarPlayConnectionMonitor *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_8;
  }
  v15 = sub_1000087EC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Detected carplay connectivity state changed; updating state",
      buf,
      0xCu);
  }

  [(PedestrianARSessionCarPlayConnectionMonitor *)self updateState];
LABEL_8:
}

@end