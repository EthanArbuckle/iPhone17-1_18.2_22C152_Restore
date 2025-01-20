@interface VLFSessionTileAvailabilityMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (NSString)debugDescription;
- (VLFSessionTileAvailabilityMonitor)initWithObserver:(id)a3 tileObserver:(id)a4;
- (VLFTileObserver)tileObserver;
- (void)dealloc;
- (void)setTileObserver:(id)a3;
- (void)updateState;
@end

@implementation VLFSessionTileAvailabilityMonitor

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionTileAvailabilityMonitorAffectsBannerVisibilityKey"];

  return v3;
}

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionTileAvailabilityMonitorAffectsPuckVisibilityKey"];

  return v3;
}

- (void)updateState
{
  unsigned __int8 v3 = [(VLFSessionTileAvailabilityMonitor *)self tileObserver];
  unsigned int v4 = [v3 areTilesAvailable];

  v5 = sub_1000115D0();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      int v8 = 134349056;
      v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Tiles are available", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v7 = 2;
  }
  else
  {
    if (v6)
    {
      int v8 = 134349056;
      v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Tiles are not available", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v7 = 0;
  }

  [(VLFSessionMonitor *)self setState:v7];
}

- (VLFSessionTileAvailabilityMonitor)initWithObserver:(id)a3 tileObserver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v16 = "-[VLFSessionTileAvailabilityMonitor initWithObserver:tileObserver:]";
      __int16 v17 = 2080;
      v18 = "VLFSessionTileAvailabilityMonitor.m";
      __int16 v19 = 1024;
      int v20 = 32;
      __int16 v21 = 2080;
      v22 = "tileObserver != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v16 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)VLFSessionTileAvailabilityMonitor;
  int v8 = [(VLFSessionMonitor *)&v14 initWithObserver:v6];
  if (v8)
  {
    v9 = sub_1000115D0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v16 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v8->_tileObserver, a4);
    [(VLFTileObserver *)v8->_tileObserver addAvailabilityObserver:v8];
    [(VLFSessionTileAvailabilityMonitor *)v8 updateState];
  }

  return v8;
}

- (VLFTileObserver)tileObserver
{
  return self->_tileObserver;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void)dealloc
{
  unsigned __int8 v3 = sub_1000115D0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  [(VLFTileObserver *)self->_tileObserver removeAvailabilityObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)VLFSessionTileAvailabilityMonitor;
  [(VLFSessionTileAvailabilityMonitor *)&v4 dealloc];
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class();
  if ([(id)objc_opt_class() isEnabled]) {
    objc_super v4 = @"YES";
  }
  else {
    objc_super v4 = @"NO";
  }
  v5 = v4;
  if ([(id)objc_opt_class() affectsPuckVisibility]) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  id v7 = v6;
  if ([(id)objc_opt_class() affectsBannerVisibility]) {
    int v8 = @"YES";
  }
  else {
    int v8 = @"NO";
  }
  v9 = v8;
  int64_t v10 = [(VLFSessionMonitor *)self state];
  CFStringRef v11 = @"Hide";
  if (v10 == 1) {
    CFStringRef v11 = @"EnablePuck";
  }
  if (v10 == 2) {
    CFStringRef v12 = @"EnablePuckAndBanner";
  }
  else {
    CFStringRef v12 = v11;
  }
  v13 = [(VLFSessionTileAvailabilityMonitor *)self tileObserver];
  [v13 distanceThreshold];
  uint64_t v15 = v14;
  v16 = [(VLFSessionTileAvailabilityMonitor *)self tileObserver];
  [v16 errorTimeoutThreshold];
  uint64_t v18 = v17;
  __int16 v19 = [(VLFSessionTileAvailabilityMonitor *)self tileObserver];
  if ([v19 isNavigatingInUnsupportedTransportType]) {
    CFStringRef v20 = @"YES";
  }
  else {
    CFStringRef v20 = @"NO";
  }
  __int16 v21 = +[NSString stringWithFormat:@"<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@, distanceThreshold: %.2f, errorTimeoutThreshold: %.2f, isNavigatingInUnsupportedTransportType: %@>", v3, v5, v7, v9, v12, v15, v18, v20];

  return (NSString *)v21;
}

- (void)setTileObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end