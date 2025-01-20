@interface VLFSessionUsageMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (GCDTimer)interactionThresholdTimeoutTimer;
- (VLFSessionUsageMonitor)initWithObserver:(id)a3;
- (id)debugDescription;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setInteractionThresholdTimeoutTimer:(id)a3;
- (void)updateState;
- (void)updateTimer;
@end

@implementation VLFSessionUsageMonitor

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionUsageMonitorAffectsBannerVisibilityKey"];

  return v3;
}

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionUsageMonitorAffectsPuckVisibilityKey"];

  return v3;
}

- (VLFSessionUsageMonitor)initWithObserver:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VLFSessionUsageMonitor;
  unsigned __int8 v3 = [(VLFSessionMonitor *)&v11 initWithObserver:a3];
  if (v3)
  {
    v4 = +[VLFSessionUsageTracker sharedInstance];
    v5 = NSStringFromSelector("hasUserEnteredVLF");
    [v4 addObserver:v3 forKeyPath:v5 options:1 context:0];

    v6 = +[VLFSessionUsageTracker sharedInstance];
    v7 = NSStringFromSelector("hasVLFEverLocalized");
    [v6 addObserver:v3 forKeyPath:v7 options:1 context:0];

    v8 = +[VLFSessionUsageTracker sharedInstance];
    v9 = NSStringFromSelector("numberOfCalloutInteractions");
    [v8 addObserver:v3 forKeyPath:v9 options:1 context:0];

    [(VLFSessionUsageMonitor *)v3 updateState];
    [(VLFSessionUsageMonitor *)v3 updateTimer];
  }
  return v3;
}

- (void)updateTimer
{
  unsigned __int8 v3 = +[VLFSessionUsageTracker sharedInstance];
  id v4 = [v3 numberOfCalloutInteractions];

  if (v4 == (id)1)
  {
    GEOConfigGetDouble();
    double v6 = v5;
    v7 = +[VLFSessionUsageTracker sharedInstance];
    [v7 timeSinceLastVLFInteraction];
    double v9 = v6 - v8;

    if (v9 > 0.0)
    {
      objc_initWeak(&location, self);
      id v10 = &_dispatch_main_q;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100470B18;
      v23[3] = &unk_1012E7638;
      objc_super v11 = &v24;
      objc_copyWeak(&v24, &location);
      v12 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v23 block:v9];
      [(VLFSessionUsageMonitor *)self setInteractionThresholdTimeoutTimer:v12];
LABEL_7:

      objc_destroyWeak(v11);
      objc_destroyWeak(&location);
      return;
    }
  }
  else
  {
    v13 = +[VLFSessionUsageTracker sharedInstance];
    id v14 = [v13 numberOfCalloutInteractions];

    if ((unint64_t)v14 >= 2)
    {
      GEOConfigGetDouble();
      double v16 = v15;
      v17 = +[VLFSessionUsageTracker sharedInstance];
      [v17 timeSinceLastVLFInteraction];
      double v19 = v16 - v18;

      if (v19 > 0.0)
      {
        objc_initWeak(&location, self);
        id v20 = &_dispatch_main_q;
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100470B58;
        v21[3] = &unk_1012E7638;
        objc_super v11 = &v22;
        objc_copyWeak(&v22, &location);
        v12 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v21 block:v19];
        [(VLFSessionUsageMonitor *)self setInteractionThresholdTimeoutTimer:v12];
        goto LABEL_7;
      }
    }
  }

  [(VLFSessionUsageMonitor *)self setInteractionThresholdTimeoutTimer:0];
}

- (void)updateState
{
  unsigned __int8 v3 = +[VLFSessionUsageTracker sharedInstance];
  unsigned int v4 = [v3 hasVLFEverLocalized];

  if (v4)
  {
    double v5 = sub_100470AC4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      double v6 = "Detected that VLF has localized before; updating state";
      v7 = v5;
      uint32_t v8 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v26, v8);
    }
LABEL_13:

    [(VLFSessionMonitor *)self setState:0];
    return;
  }
  double v9 = +[VLFSessionUsageTracker sharedInstance];
  id v10 = [v9 numberOfCalloutDismissals];
  unint64_t UInteger = GEOConfigGetUInteger();

  if ((unint64_t)v10 >= UInteger)
  {
    double v5 = sub_100470AC4();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    int v26 = 134217984;
    uint64_t v27 = GEOConfigGetUInteger();
    double v6 = "Detected that user dismissed VLF callout more than %lu times; updating state";
    goto LABEL_11;
  }
  v12 = +[VLFSessionUsageTracker sharedInstance];
  if ([v12 numberOfCalloutInteractions] == (id)1)
  {
    v13 = +[VLFSessionUsageTracker sharedInstance];
    [v13 timeSinceLastVLFInteraction];
    double v15 = v14;
    GEOConfigGetDouble();
    double v17 = v16;

    if (v15 < v17)
    {
      double v5 = sub_100470AC4();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      GEOConfigGetDouble();
      int v26 = 134217984;
      uint64_t v27 = v18;
      double v6 = "Detected that user interacted with VLF once less than %f seconds ago; updating state";
LABEL_11:
      v7 = v5;
      uint32_t v8 = 12;
      goto LABEL_12;
    }
  }
  else
  {
  }
  double v19 = +[VLFSessionUsageTracker sharedInstance];
  if ((unint64_t)[v19 numberOfCalloutInteractions] <= 1)
  {
  }
  else
  {
    id v20 = +[VLFSessionUsageTracker sharedInstance];
    [v20 timeSinceLastVLFInteraction];
    double v22 = v21;
    GEOConfigGetDouble();
    double v24 = v23;

    if (v22 < v24)
    {
      double v5 = sub_100470AC4();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      GEOConfigGetDouble();
      int v26 = 134217984;
      uint64_t v27 = v25;
      double v6 = "Detected that user interacted with VLF after the first time time less than %f seconds ago; updating state";
      goto LABEL_11;
    }
  }

  [(VLFSessionMonitor *)self setState:2];
}

- (void)setInteractionThresholdTimeoutTimer:(id)a3
{
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void)dealloc
{
  unsigned __int8 v3 = +[VLFSessionUsageTracker sharedInstance];
  unsigned int v4 = NSStringFromSelector("hasUserEnteredVLF");
  [v3 removeObserver:self forKeyPath:v4];

  double v5 = +[VLFSessionUsageTracker sharedInstance];
  double v6 = NSStringFromSelector("hasVLFEverLocalized");
  [v5 removeObserver:self forKeyPath:v6];

  v7 = +[VLFSessionUsageTracker sharedInstance];
  uint32_t v8 = NSStringFromSelector("numberOfCalloutInteractions");
  [v7 removeObserver:self forKeyPath:v8];

  v9.receiver = self;
  v9.super_class = (Class)VLFSessionUsageMonitor;
  [(VLFSessionUsageMonitor *)&v9 dealloc];
}

- (id)debugDescription
{
  uint64_t v28 = objc_opt_class();
  if ([(id)objc_opt_class() isEnabled]) {
    unsigned __int8 v3 = @"YES";
  }
  else {
    unsigned __int8 v3 = @"NO";
  }
  uint64_t v27 = v3;
  if ([(id)objc_opt_class() affectsPuckVisibility]) {
    unsigned int v4 = @"YES";
  }
  else {
    unsigned int v4 = @"NO";
  }
  int v26 = v4;
  if ([(id)objc_opt_class() affectsBannerVisibility]) {
    double v5 = @"YES";
  }
  else {
    double v5 = @"NO";
  }
  double v6 = v5;
  int64_t v7 = [(VLFSessionMonitor *)self state];
  CFStringRef v8 = @"Hide";
  if (v7 == 1) {
    CFStringRef v8 = @"EnablePuck";
  }
  if (v7 == 2) {
    CFStringRef v8 = @"EnablePuckAndBanner";
  }
  CFStringRef v25 = v8;
  objc_super v9 = +[VLFSessionUsageTracker sharedInstance];
  if ([v9 hasVLFEverLocalized]) {
    id v10 = @"YES";
  }
  else {
    id v10 = @"NO";
  }
  objc_super v11 = v10;
  uint64_t UInteger = GEOConfigGetUInteger();
  v13 = +[VLFSessionUsageTracker sharedInstance];
  id v14 = [v13 numberOfCalloutDismissals];
  double v15 = +[VLFSessionUsageTracker sharedInstance];
  id v16 = [v15 numberOfCalloutTaps];
  double v17 = +[VLFSessionUsageTracker sharedInstance];
  [v17 timeSinceLastVLFInteraction];
  uint64_t v19 = v18;
  id v20 = +[VLFSessionUsageTracker sharedInstance];
  unsigned int v21 = [v20 hasUserSeenVLFCallout];
  CFStringRef v22 = @"NO";
  if (v21) {
    CFStringRef v22 = @"YES";
  }
  double v23 = +[NSString stringWithFormat:@"<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@, hasVLFEverLocalized: %@, maxCalloutDismissals: %lu, numberOfCalloutDismissals: %lu, numberOfCalloutTaps: %lu, timeSinceLastVLFInteraction: %f, hasUserSeenVLFCallout: %@>", v28, v27, v26, v6, v25, v11, UInteger, v14, v16, v19, v22];

  return v23;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = +[VLFSessionUsageTracker sharedInstance];
  if (v13 != v11)
  {

LABEL_3:
    v19.receiver = self;
    v19.super_class = (Class)VLFSessionUsageMonitor;
    [(VLFSessionUsageMonitor *)&v19 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_11;
  }
  id v14 = NSStringFromSelector("hasVLFEverLocalized");
  if ([v10 isEqualToString:v14]) {
    goto LABEL_7;
  }
  double v15 = NSStringFromSelector("numberOfCalloutInteractions");
  if ([v10 isEqualToString:v15])
  {

LABEL_7:
    goto LABEL_8;
  }
  double v17 = NSStringFromSelector("hasUserEnteredVLF");
  unsigned __int8 v18 = [v10 isEqualToString:v17];

  if ((v18 & 1) == 0) {
    goto LABEL_3;
  }
LABEL_8:
  id v16 = sub_100470AC4();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Detected keypath changed (%@); updating state",
      buf,
      0xCu);
  }

  [(VLFSessionUsageMonitor *)self updateState];
  [(VLFSessionUsageMonitor *)self updateTimer];
LABEL_11:
}

- (GCDTimer)interactionThresholdTimeoutTimer
{
  return self->_interactionThresholdTimeoutTimer;
}

- (void).cxx_destruct
{
}

@end