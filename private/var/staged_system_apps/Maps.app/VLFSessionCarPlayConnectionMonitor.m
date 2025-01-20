@interface VLFSessionCarPlayConnectionMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (VLFSessionCarPlayConnectionMonitor)initWithObserver:(id)a3;
- (id)debugDescription;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)updateState;
@end

@implementation VLFSessionCarPlayConnectionMonitor

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionCarPlayConnectionMonitorAffectsPuckVisibilityKey"];

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionCarPlayConnectionMonitorAffectsBannerVisibilityKey"];

  return v3;
}

- (VLFSessionCarPlayConnectionMonitor)initWithObserver:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VLFSessionCarPlayConnectionMonitor;
  unsigned __int8 v3 = [(VLFSessionMonitor *)&v7 initWithObserver:a3];
  if (v3)
  {
    v4 = +[CarDisplayController sharedInstance];
    v5 = NSStringFromSelector("state");
    [v4 addObserver:v3 forKeyPath:v5 options:0 context:0];

    [(VLFSessionCarPlayConnectionMonitor *)v3 updateState];
  }
  return v3;
}

- (void)updateState
{
  unsigned __int8 v3 = +[CarDisplayController sharedInstance];
  id v4 = [v3 state];

  v5 = sub_100109C04();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4 == (id)2)
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Detected that carplay is connected; updating state",
        v8,
        2u);
    }
    uint64_t v7 = 0;
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    uint64_t v7 = 2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Detected that carplay is not connected; updating state",
      buf,
      2u);
  }
  else
  {
    uint64_t v7 = 2;
  }

  [(VLFSessionMonitor *)self setState:v7];
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void)dealloc
{
  unsigned __int8 v3 = +[CarDisplayController sharedInstance];
  id v4 = NSStringFromSelector("state");
  [v3 removeObserver:self forKeyPath:v4 context:0];

  v5.receiver = self;
  v5.super_class = (Class)VLFSessionCarPlayConnectionMonitor;
  [(VLFSessionCarPlayConnectionMonitor *)&v5 dealloc];
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  if ([(id)objc_opt_class() isEnabled]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  objc_super v5 = v4;
  if ([(id)objc_opt_class() affectsPuckVisibility]) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  uint64_t v7 = v6;
  if ([(id)objc_opt_class() affectsBannerVisibility]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = v8;
  v10 = +[CarDisplayController sharedInstance];
  id v11 = [v10 state];
  int64_t v12 = [(VLFSessionMonitor *)self state];
  CFStringRef v13 = @"Hide";
  if (v12 == 1) {
    CFStringRef v13 = @"EnablePuck";
  }
  if (v12 == 2) {
    CFStringRef v13 = @"EnablePuckAndBanner";
  }
  v14 = +[NSString stringWithFormat:@"<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentValue: %lu, currentState: %@>", v3, v5, v7, v9, v11, v13];

  return v14;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  CFStringRef v13 = NSStringFromSelector("state");
  if (([v10 isEqualToString:v13] & 1) == 0)
  {

    goto LABEL_7;
  }
  id v14 = +[CarDisplayController sharedInstance];

  if (v14 != v11)
  {
LABEL_7:
    v16.receiver = self;
    v16.super_class = (Class)VLFSessionCarPlayConnectionMonitor;
    [(VLFSessionCarPlayConnectionMonitor *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_8;
  }
  v15 = sub_100109C04();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Detected carplay connectivity state changed; updating state",
      buf,
      2u);
  }

  [(VLFSessionCarPlayConnectionMonitor *)self updateState];
LABEL_8:
}

@end