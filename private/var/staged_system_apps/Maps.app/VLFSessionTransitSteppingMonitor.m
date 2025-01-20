@interface VLFSessionTransitSteppingMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (BOOL)isInTransitNav;
- (MNNavigationService)navigationService;
- (NSString)debugDescription;
- (VLFSessionTransitSteppingMonitor)initWithObserver:(id)a3 navigationService:(id)a4;
- (void)dealloc;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)setNavigationService:(id)a3;
@end

@implementation VLFSessionTransitSteppingMonitor

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionTransitSteppingMonitorAffectsPuckVisibilityKey"];

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionTransitSteppingMonitorAffectsBannerVisibilityKey"];

  return v3;
}

- (VLFSessionTransitSteppingMonitor)initWithObserver:(id)a3 navigationService:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VLFSessionTransitSteppingMonitor;
  v8 = [(VLFSessionMonitor *)&v11 initWithObserver:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_navigationService, a4);
    [(MNNavigationService *)v9->_navigationService registerObserver:v9];
    [(VLFSessionMonitor *)v9 setState:2];
  }

  return v9;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void)dealloc
{
  [(MNNavigationService *)self->_navigationService unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)VLFSessionTransitSteppingMonitor;
  [(VLFSessionTransitSteppingMonitor *)&v3 dealloc];
}

- (BOOL)isInTransitNav
{
  v2 = [(VLFSessionTransitSteppingMonitor *)self navigationService];
  BOOL v3 = [v2 navigationTransportType] == 1;

  return v3;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class();
  if ([(id)objc_opt_class() isEnabled]) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  v5 = v4;
  if ([(id)objc_opt_class() affectsPuckVisibility]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  id v7 = v6;
  if ([(id)objc_opt_class() affectsBannerVisibility]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = v8;
  int64_t v10 = [(VLFSessionMonitor *)self state];
  CFStringRef v11 = @"Hide";
  if (v10 == 1) {
    CFStringRef v11 = @"EnablePuck";
  }
  if (v10 == 2) {
    CFStringRef v11 = @"EnablePuckAndBanner";
  }
  v12 = +[NSString stringWithFormat:@"<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@>", v3, v5, v7, v9, v11];

  return (NSString *)v12;
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  v6 = sub_100C6D504();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = MNNavigationServiceStateAsString();
    unsigned int v8 = [(VLFSessionTransitSteppingMonitor *)self isInTransitNav];
    v9 = @"NO";
    if (v8) {
      v9 = @"YES";
    }
    int64_t v10 = v9;
    int v12 = 138412546;
    v13 = v7;
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Updated nav state: %@, isInTransitNav: %@", (uint8_t *)&v12, 0x16u);
  }
  if ((MNNavigationServiceStateIsNavigating() & 1) == 0)
  {
    CFStringRef v11 = sub_100C6D504();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Not in transit nav; updating state",
        (uint8_t *)&v12,
        2u);
    }

    [(VLFSessionMonitor *)self setState:2];
  }
}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  unsigned int v8 = sub_100C6D504();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v9 = [(VLFSessionTransitSteppingMonitor *)self isInTransitNav];
    int64_t v10 = @"NO";
    if (v9) {
      int64_t v10 = @"YES";
    }
    CFStringRef v11 = v10;
    *(_DWORD *)buf = 134218498;
    v45 = (const char *)a4;
    __int16 v46 = 2048;
    v47 = (const char *)a5;
    __int16 v48 = 2112;
    v49[0] = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Updated step index: %lu segment index: %lu, isInTransitNav: %@", buf, 0x20u);
  }
  if (![(VLFSessionTransitSteppingMonitor *)self isInTransitNav])
  {
    v23 = sub_100C6D504();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Not in transit nav; ignoring", buf, 2u);
    }

    return;
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v32 = sub_1005762E4();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v45 = "-[VLFSessionTransitSteppingMonitor navigationService:didUpdateStepIndex:segmentIndex:]";
      __int16 v46 = 2080;
      v47 = "VLFSessionTransitSteppingMonitor.m";
      __int16 v48 = 1024;
      LODWORD(v49[0]) = 115;
      WORD2(v49[0]) = 2080;
      *(void *)((char *)v49 + 6) = "stepIndex != NSNotFound";
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v33 = sub_1005762E4();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v45 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    v35 = sub_1005762E4();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v45 = "-[VLFSessionTransitSteppingMonitor navigationService:didUpdateStepIndex:segmentIndex:]";
      __int16 v46 = 2080;
      v47 = "VLFSessionTransitSteppingMonitor.m";
      __int16 v48 = 1024;
      LODWORD(v49[0]) = 117;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      v36 = sub_1005762E4();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v45 = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    v38 = sub_100C6D504();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Invalid step index; resetting state", buf, 2u);
    }

    goto LABEL_38;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  int v12 = [(VLFSessionTransitSteppingMonitor *)self navigationService];
  v13 = [v12 route];
  __int16 v14 = [v13 steppingSigns];

  id v15 = [v14 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v15) {
    goto LABEL_19;
  }
  id v16 = v15;
  uint64_t v17 = *(void *)v40;
  while (2)
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v40 != v17) {
        objc_enumerationMutation(v14);
      }
      v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      id v20 = [v19 stepIndexRange];
      if (a4 >= (unint64_t)v20 && a4 - (unint64_t)v20 < v21)
      {
        v24 = v19;

        if (!v24) {
          goto LABEL_29;
        }
        v25 = sub_100C6D504();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v24;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Detected current transit stepping mode sign: %@", buf, 0xCu);
        }

        if ([v24 isWalking])
        {
          [(VLFSessionMonitor *)self setState:2];
          v26 = sub_100C6D504();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v27 = "Detected the current sign is walking; updating state";
LABEL_41:
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, v27, buf, 2u);
          }
        }
        else
        {
          [(VLFSessionMonitor *)self setState:0];
          v26 = sub_100C6D504();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v27 = "Detected the current sign is not walking; updating state";
            goto LABEL_41;
          }
        }

        return;
      }
    }
    id v16 = [v14 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_19:

LABEL_29:
  v28 = sub_1005762E4();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v45 = "-[VLFSessionTransitSteppingMonitor navigationService:didUpdateStepIndex:segmentIndex:]";
    __int16 v46 = 2080;
    v47 = "VLFSessionTransitSteppingMonitor.m";
    __int16 v48 = 1024;
    LODWORD(v49[0]) = 132;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    v29 = sub_1005762E4();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412290;
      v45 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  v31 = sub_100C6D504();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v45 = (const char *)a4;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Could not find current stepping sign for the current step index %lu", buf, 0xCu);
  }

LABEL_38:
  [(VLFSessionMonitor *)self setState:2];
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end