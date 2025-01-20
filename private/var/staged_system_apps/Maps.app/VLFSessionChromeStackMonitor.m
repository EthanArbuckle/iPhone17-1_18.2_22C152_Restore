@interface VLFSessionChromeStackMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (NSSet)allowedModeClasses;
- (NSString)debugDescription;
- (PlatformController)platformController;
- (VLFSessionChromeStackMonitor)initWithObserver:(id)a3 platformController:(id)a4;
- (void)_updateStateForTopMode:(id)a3;
- (void)chromeViewController:(id)a3 didMoveFromContextStack:(id)a4 toContextStack:(id)a5;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAllowedModeClasses:(id)a3;
- (void)setPlatformController:(id)a3;
@end

@implementation VLFSessionChromeStackMonitor

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionChromeStackMonitorAffectsPuckVisibilityKey"];

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionChromeStackMonitorAffectsBannerVisibilityKey"];

  return v3;
}

- (void)_updateStateForTopMode:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(VLFSessionChromeStackMonitor *)self allowedModeClasses];
    unsigned __int8 v6 = [v5 containsObject:objc_opt_class()];

    v7 = sub_100012F30();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v8)
      {
        v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        v11 = [(VLFSessionChromeStackMonitor *)self allowedModeClasses];
        int v16 = 138412546;
        v17 = v10;
        __int16 v18 = 2112;
        v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Top mode (%@) is in the allowed set (%@); updating state",
          (uint8_t *)&v16,
          0x16u);
      }
      uint64_t v12 = 2;
    }
    else
    {
      if (v8)
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        v15 = [(VLFSessionChromeStackMonitor *)self allowedModeClasses];
        int v16 = 138412546;
        v17 = v14;
        __int16 v18 = 2112;
        v19 = v15;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Top mode (%@) is NOT in the allowed set (%@); updating state",
          (uint8_t *)&v16,
          0x16u);
      }
      uint64_t v12 = 0;
    }

    [(VLFSessionMonitor *)self setState:v12];
  }
}

- (NSSet)allowedModeClasses
{
  allowedModeClasses = self->_allowedModeClasses;
  if (!allowedModeClasses)
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, objc_opt_class(), 0);
    unsigned __int8 v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_allowedModeClasses;
    self->_allowedModeClasses = v6;

    allowedModeClasses = self->_allowedModeClasses;
  }

  return allowedModeClasses;
}

- (VLFSessionChromeStackMonitor)initWithObserver:(id)a3 platformController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v21 = sub_1005762E4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v29 = "-[VLFSessionChromeStackMonitor initWithObserver:platformController:]";
      __int16 v30 = 2080;
      v31 = "VLFSessionChromeStackMonitor.m";
      __int16 v32 = 1024;
      int v33 = 38;
      __int16 v34 = 2080;
      v35 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v22 = sub_1005762E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v29 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v7)
  {
    v24 = sub_1005762E4();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v29 = "-[VLFSessionChromeStackMonitor initWithObserver:platformController:]";
      __int16 v30 = 2080;
      v31 = "VLFSessionChromeStackMonitor.m";
      __int16 v32 = 1024;
      int v33 = 39;
      __int16 v34 = 2080;
      v35 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v25 = sub_1005762E4();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v29 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)VLFSessionChromeStackMonitor;
  BOOL v8 = [(VLFSessionMonitor *)&v27 initWithObserver:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_platformController, v7);
    v10 = sub_100012F30();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v9->_platformController);
      uint64_t v12 = [WeakRetained chromeViewController];
      *(_DWORD *)buf = 138412290;
      v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Registering for chrome VC stack changes: %@", buf, 0xCu);
    }
    id v13 = objc_loadWeakRetained((id *)&v9->_platformController);
    v14 = [v13 chromeViewController];
    [v14 addContextStackObserver:v9];

    id v15 = objc_loadWeakRetained((id *)&v9->_platformController);
    int v16 = NSStringFromSelector("chromeViewController");
    [v15 addObserver:v9 forKeyPath:v16 options:3 context:0];

    id v17 = objc_loadWeakRetained((id *)&v9->_platformController);
    __int16 v18 = [v17 chromeViewController];
    v19 = [v18 topContext];
    [(VLFSessionChromeStackMonitor *)v9 _updateStateForTopMode:v19];
  }
  return v9;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void)dealloc
{
  p_platformController = &self->_platformController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
  uint64_t v5 = NSStringFromSelector("chromeViewController");
  [WeakRetained removeObserver:self forKeyPath:v5];

  id v6 = objc_loadWeakRetained((id *)p_platformController);
  id v7 = [v6 chromeViewController];
  [v7 removeContextStackObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)VLFSessionChromeStackMonitor;
  [(VLFSessionChromeStackMonitor *)&v8 dealloc];
}

- (NSString)debugDescription
{
  uint64_t v23 = objc_opt_class();
  if ([(id)objc_opt_class() isEnabled]) {
    unsigned __int8 v3 = @"YES";
  }
  else {
    unsigned __int8 v3 = @"NO";
  }
  v22 = v3;
  if ([(id)objc_opt_class() affectsPuckVisibility]) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  uint64_t v5 = v4;
  if ([(id)objc_opt_class() affectsBannerVisibility]) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  id v7 = v6;
  int64_t v8 = [(VLFSessionMonitor *)self state];
  CFStringRef v9 = @"Hide";
  if (v8 == 1) {
    CFStringRef v9 = @"EnablePuck";
  }
  if (v8 == 2) {
    CFStringRef v10 = @"EnablePuckAndBanner";
  }
  else {
    CFStringRef v10 = v9;
  }
  v21 = [(VLFSessionChromeStackMonitor *)self platformController];
  v11 = [v21 chromeViewController];
  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  v14 = [(VLFSessionChromeStackMonitor *)self platformController];
  id v15 = [v14 chromeViewController];
  int v16 = [v15 topContext];
  id v17 = (objc_class *)objc_opt_class();
  __int16 v18 = NSStringFromClass(v17);
  v19 = +[NSString stringWithFormat:@"<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@, currentChromeVC: %@, currentMode: %@", v23, v22, v5, v7, v10, v13, v18];

  return (NSString *)v19;
}

- (void)chromeViewController:(id)a3 didMoveFromContextStack:(id)a4 toContextStack:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  CFStringRef v9 = sub_100012F30();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v10 = [v7 lastObject];
    v11 = [v8 lastObject];
    int v13 = 138412546;
    v14 = v10;
    __int16 v15 = 2112;
    int v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Top mode changed from %@ to %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v12 = [v8 lastObject];
  [(VLFSessionChromeStackMonitor *)self _updateStateForTopMode:v12];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
  if (WeakRetained != v11)
  {

LABEL_15:
    v25.receiver = self;
    v25.super_class = (Class)VLFSessionChromeStackMonitor;
    [(VLFSessionChromeStackMonitor *)&v25 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_16;
  }
  v14 = NSStringFromSelector("chromeViewController");
  unsigned int v15 = [v10 isEqualToString:v14];

  if (!v15) {
    goto LABEL_15;
  }
  int v16 = [v12 objectForKeyedSubscript:NSKeyValueChangeOldKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;

  v19 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  v22 = sub_100012F30();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v18;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "De-registering from old chrome VC stack changes: %@", buf, 0xCu);
  }

  [v18 removeContextStackObserver:self];
  uint64_t v23 = sub_100012F30();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v21;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Registering for new chrome VC stack changes: %@", buf, 0xCu);
  }

  [v21 addContextStackObserver:self];
  v24 = [v21 topContext];
  [(VLFSessionChromeStackMonitor *)self _updateStateForTopMode:v24];

LABEL_16:
}

- (void)setAllowedModeClasses:(id)a3
{
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platformController);

  objc_storeStrong((id *)&self->_allowedModeClasses, 0);
}

@end