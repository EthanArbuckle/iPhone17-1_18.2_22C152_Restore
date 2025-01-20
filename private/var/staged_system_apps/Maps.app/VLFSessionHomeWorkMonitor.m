@interface VLFSessionHomeWorkMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)shouldProcessHomeItems;
- (BOOL)shouldProcessWorkItems;
- (CLLocation)lastLocation;
- (MKLocationManager)locationManager;
- (NSArray)homeMapItems;
- (NSArray)workMapItems;
- (NSString)debugDescription;
- (NSString)uniqueName;
- (OS_dispatch_queue)queue;
- (VLFSessionHomeWorkMonitor)initWithObserver:(id)a3 locationManager:(id)a4;
- (double)distanceThreshold;
- (id)mapItemsAndDistances;
- (void)_updateHomeWorkEntries:(id)a3;
- (void)_updateMeCard;
- (void)_updateStateWithLocation:(id)a3;
- (void)dealloc;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4;
- (void)setHomeMapItems:(id)a3;
- (void)setLastLocation:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setWorkMapItems:(id)a3;
@end

@implementation VLFSessionHomeWorkMonitor

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionHomeWorkMonitorAffectsBannerVisibilityKey"];

  return v3;
}

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionHomeWorkMonitorAffectsPuckVisibilityKey"];

  return v3;
}

- (void)_updateMeCard
{
  unsigned __int8 v3 = sub_100013854();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Updating me card", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v4 = sub_100018584();
  v5 = [v4 oneFavorites];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100032698;
  v6[3] = &unk_1012E9280;
  objc_copyWeak(&v7, (id *)buf);
  [v5 readMeCardWithHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (VLFSessionHomeWorkMonitor)initWithObserver:(id)a3 locationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v15 = sub_1005762E4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "-[VLFSessionHomeWorkMonitor initWithObserver:locationManager:]";
      __int16 v26 = 2080;
      v27 = "VLFSessionHomeWorkMonitor.m";
      __int16 v28 = 1024;
      int v29 = 49;
      __int16 v30 = 2080;
      v31 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v7)
  {
    v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "-[VLFSessionHomeWorkMonitor initWithObserver:locationManager:]";
      __int16 v26 = 2080;
      v27 = "VLFSessionHomeWorkMonitor.m";
      __int16 v28 = 1024;
      int v29 = 50;
      __int16 v30 = 2080;
      v31 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v25 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)VLFSessionHomeWorkMonitor;
  v8 = [(VLFSessionMonitor *)&v23 initWithObserver:v6];
  if (v8)
  {
    v9 = sub_100013854();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v25 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v8->_locationManager, a4);
    [(MKLocationManager *)v8->_locationManager listenForLocationUpdates:v8];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.Maps.VLFSessionHomeWorkMonitor", v10);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    v13 = v8->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003FD544;
    block[3] = &unk_1012E5D08;
    v22 = v8;
    dispatch_async(v13, block);
  }
  return v8;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void)dealloc
{
  unsigned __int8 v3 = sub_100013854();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  [(MKLocationManager *)self->_locationManager stopListeningForLocationUpdates:self];
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v13 = sub_1003FD75C;
  v14 = &unk_1012E5D08;
  v15 = self;
  v5 = queue;
  id v6 = v12;
  label = dispatch_queue_get_label(v5);
  v8 = dispatch_queue_get_label(0);
  if (label == v8 || (label ? (BOOL v9 = v8 == 0) : (BOOL v9 = 1), !v9 && !strcmp(label, v8)))
  {
    v13((uint64_t)v6);
  }
  else
  {
    dispatch_sync(v5, v6);
  }

  v11.receiver = self;
  v11.super_class = (Class)VLFSessionHomeWorkMonitor;
  [(VLFSessionHomeWorkMonitor *)&v11 dealloc];
}

- (double)distanceThreshold
{
  GEOConfigGetDouble();
  return result;
}

- (BOOL)shouldProcessHomeItems
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldProcessWorkItems
{
  return GEOConfigGetBOOL();
}

- (void)_updateHomeWorkEntries:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315906;
      v22 = (VLFSessionHomeWorkMonitor *)"-[VLFSessionHomeWorkMonitor _updateHomeWorkEntries:]";
      __int16 v23 = 2080;
      v24 = "VLFSessionHomeWorkMonitor.m";
      __int16 v25 = 1024;
      int v26 = 126;
      __int16 v27 = 2080;
      __int16 v28 = "meCard != nil";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v21, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = +[NSThread callStackSymbols];
        int v21 = 138412290;
        v22 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);
      }
    }
  }
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v15 = dispatch_queue_get_label(0);
        int v21 = 136316418;
        v22 = (VLFSessionHomeWorkMonitor *)"-[VLFSessionHomeWorkMonitor _updateHomeWorkEntries:]";
        __int16 v23 = 2080;
        v24 = "VLFSessionHomeWorkMonitor.m";
        __int16 v25 = 1024;
        int v26 = 129;
        __int16 v27 = 2080;
        __int16 v28 = "dispatch_get_main_queue()";
        __int16 v29 = 2080;
        __int16 v30 = v14;
        __int16 v31 = 2080;
        v32 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v21,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v16 = sub_1005762E4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = +[NSThread callStackSymbols];
          int v21 = 138412290;
          v22 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);
        }
      }
    }
  }
  v8 = sub_100013854();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v21 = 134349056;
    v22 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Updating home and work entries", (uint8_t *)&v21, 0xCu);
  }

  if ([(VLFSessionHomeWorkMonitor *)self shouldProcessHomeItems])
  {
    BOOL v9 = [v4 mapItemsForHome];
    [(VLFSessionHomeWorkMonitor *)self setHomeMapItems:v9];
  }
  else
  {
    [(VLFSessionHomeWorkMonitor *)self setHomeMapItems:0];
  }
  if ([(VLFSessionHomeWorkMonitor *)self shouldProcessWorkItems])
  {
    v10 = [v4 mapItemsForWork];
    [(VLFSessionHomeWorkMonitor *)self setWorkMapItems:v10];
  }
  else
  {
    [(VLFSessionHomeWorkMonitor *)self setWorkMapItems:0];
  }
  objc_super v11 = [(VLFSessionHomeWorkMonitor *)self locationManager];
  v12 = [v11 lastLocation];
  [(VLFSessionHomeWorkMonitor *)self _updateStateWithLocation:v12];
}

- (void)_updateStateWithLocation:(id)a3
{
  id v4 = (char *)a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v44 = sub_1005762E4();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v53 = (VLFSessionHomeWorkMonitor *)"-[VLFSessionHomeWorkMonitor _updateStateWithLocation:]";
        __int16 v54 = 2080;
        v55 = "VLFSessionHomeWorkMonitor.m";
        __int16 v56 = 1024;
        *(_DWORD *)v57 = 141;
        *(_WORD *)&v57[4] = 2080;
        *(void *)&v57[6] = "dispatch_get_main_queue()";
        __int16 v58 = 2080;
        v59 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v60 = 2080;
        v61 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v45 = sub_1005762E4();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v46 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v53 = v46;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  v8 = sub_100013854();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    BOOL v9 = [(VLFSessionHomeWorkMonitor *)self lastLocation];
    *(_DWORD *)buf = 134349571;
    v53 = self;
    __int16 v54 = 2113;
    v55 = v4;
    __int16 v56 = 2113;
    *(void *)v57 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Got a new location: %{private}@, lastLocation: %{private}@", buf, 0x20u);
  }
  if (!v4)
  {
    v17 = sub_100013854();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      goto LABEL_60;
    }
    *(_DWORD *)buf = 134349056;
    v53 = self;
    v19 = "[%{public}p] Location is nil; ignoring";
    v20 = v17;
    os_log_type_t v21 = OS_LOG_TYPE_INFO;
    uint32_t v22 = 12;
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, v22);
    goto LABEL_60;
  }
  v10 = [(VLFSessionHomeWorkMonitor *)self lastLocation];

  if (v10)
  {
    GEOConfigGetDouble();
    double v12 = v11;
    v13 = [(VLFSessionHomeWorkMonitor *)self lastLocation];
    [v13 coordinate];
    v14 = [(VLFSessionHomeWorkMonitor *)self lastLocation];
    [v14 coordinate];
    [v4 coordinate];
    [v4 coordinate];
    CLClientGetDistanceCoordinates();
    double v16 = v15;

    if (v16 < v12)
    {
      v17 = sub_100013854();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_60;
      }
      *(_DWORD *)buf = 134349568;
      v53 = self;
      __int16 v54 = 2048;
      v55 = *(const char **)&v16;
      __int16 v56 = 2048;
      *(double *)v57 = v12;
      v19 = "[%{public}p] New location is too close to the last location (%f < %f); ignoring";
      v20 = v17;
      os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
      uint32_t v22 = 32;
      goto LABEL_18;
    }
  }
  [(VLFSessionHomeWorkMonitor *)self setLastLocation:v4];
  v17 = +[NSMutableArray array];
  v18 = [(VLFSessionHomeWorkMonitor *)self homeMapItems];
  if (v18)
  {
  }
  else if ([(VLFSessionHomeWorkMonitor *)self shouldProcessHomeItems])
  {
    __int16 v23 = sub_100013854();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v53 = self;
      v24 = "[%{public}p] Home map items are not available yet; ignoring";
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, v24, buf, 0xCu);
    }
LABEL_34:

    goto LABEL_60;
  }
  unsigned __int8 v25 = [(VLFSessionHomeWorkMonitor *)self shouldProcessHomeItems];
  int v26 = sub_100013854();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
  if (v25)
  {
    if (v27)
    {
      *(_DWORD *)buf = 134349056;
      v53 = self;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "[%{public}p] Processing home map items", buf, 0xCu);
    }

    int v26 = [(VLFSessionHomeWorkMonitor *)self homeMapItems];
    [v17 addObjectsFromArray:v26];
  }
  else if (v27)
  {
    *(_DWORD *)buf = 134349056;
    v53 = self;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "[%{public}p] Home map items are not enabled; will not process",
      buf,
      0xCu);
  }

  __int16 v28 = [(VLFSessionHomeWorkMonitor *)self workMapItems];
  if (!v28)
  {
    if (![(VLFSessionHomeWorkMonitor *)self shouldProcessWorkItems]) {
      goto LABEL_35;
    }
    __int16 v23 = sub_100013854();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v53 = self;
      v24 = "[%{public}p] Work map items are not available yet; ignoring";
      goto LABEL_33;
    }
    goto LABEL_34;
  }

LABEL_35:
  unsigned __int8 v29 = [(VLFSessionHomeWorkMonitor *)self shouldProcessWorkItems];
  __int16 v30 = sub_100013854();
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
  if (v29)
  {
    if (v31)
    {
      *(_DWORD *)buf = 134349056;
      v53 = self;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "[%{public}p] Processing work map items", buf, 0xCu);
    }

    __int16 v30 = [(VLFSessionHomeWorkMonitor *)self workMapItems];
    [v17 addObjectsFromArray:v30];
  }
  else if (v31)
  {
    *(_DWORD *)buf = 134349056;
    v53 = self;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "[%{public}p] Work map items are not enabled; will not process",
      buf,
      0xCu);
  }

  v32 = sub_100013854();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    [(VLFSessionHomeWorkMonitor *)self distanceThreshold];
    *(_DWORD *)buf = 134349313;
    v53 = self;
    __int16 v54 = 2049;
    v55 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "[%{public}p] Computing distances to map items with threshold: %{private}f", buf, 0x16u);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v17 = v17;
  v34 = (char *)[v17 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v34)
  {
    v35 = v34;
    uint64_t v36 = *(void *)v48;
    while (2)
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(v17);
        }
        v38 = MapsSuggestionsLocationForMapItem();
        [v4 distanceFromLocation:v38, v47];
        double v40 = v39;
        [(VLFSessionHomeWorkMonitor *)self distanceThreshold];
        if (v40 <= v41)
        {
          if ([(VLFSessionMonitor *)self state])
          {
            v43 = sub_100013854();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134349056;
              v53 = self;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "[%{public}p] User is too close to one of the map items; updating state",
                buf,
                0xCu);
            }

            [(VLFSessionMonitor *)self setState:0];
          }

          goto LABEL_60;
        }
      }
      v35 = (char *)[v17 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v35) {
        continue;
      }
      break;
    }
  }

  if ((id)[(VLFSessionMonitor *)self state] != (id)2)
  {
    v42 = sub_100013854();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v53 = self;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "[%{public}p] User is not sufficiently close to any map item; updating state",
        buf,
        0xCu);
    }

    [(VLFSessionMonitor *)self setState:2];
  }
LABEL_60:
}

- (NSString)debugDescription
{
  unsigned __int8 v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  if ([(id)objc_opt_class() isEnabled]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  id v6 = v5;
  if ([(id)objc_opt_class() affectsPuckVisibility]) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  v8 = v7;
  if ([(id)objc_opt_class() affectsBannerVisibility]) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  v10 = v9;
  int64_t v11 = [(VLFSessionMonitor *)self state];
  CFStringRef v12 = @"Hide";
  if (v11 == 1) {
    CFStringRef v12 = @"EnablePuck";
  }
  if (v11 == 2) {
    CFStringRef v13 = @"EnablePuckAndBanner";
  }
  else {
    CFStringRef v13 = v12;
  }
  [(VLFSessionHomeWorkMonitor *)self distanceThreshold];
  uint64_t v15 = v14;
  if ([(VLFSessionHomeWorkMonitor *)self shouldProcessHomeItems]) {
    double v16 = @"YES";
  }
  else {
    double v16 = @"NO";
  }
  v17 = v16;
  if ([(VLFSessionHomeWorkMonitor *)self shouldProcessWorkItems]) {
    v18 = @"YES";
  }
  else {
    v18 = @"NO";
  }
  v19 = v18;
  v20 = [(VLFSessionHomeWorkMonitor *)self mapItemsAndDistances];
  os_log_type_t v21 = +[NSString stringWithFormat:@"<%@\nisEnabled: %@,\naffectsPuckVisibility: %@,\naffectsBannerVisibility: %@,\ncurrentState: %@,\nthreshold: %f,\nhome: %@,\nwork: %@,\nmapItems: %@>", v4, v6, v8, v10, v13, v15, v17, v19, v20];

  return (NSString *)v21;
}

- (id)mapItemsAndDistances
{
  unsigned __int8 v3 = [(VLFSessionHomeWorkMonitor *)self locationManager];
  id v4 = [v3 lastLocation];

  if (!v4) {
    goto LABEL_17;
  }
  v5 = [(VLFSessionHomeWorkMonitor *)self homeMapItems];
  if (!v5)
  {
    id v6 = [(VLFSessionHomeWorkMonitor *)self workMapItems];

    if (v6) {
      goto LABEL_5;
    }
LABEL_17:
    id v22 = 0;
    goto LABEL_18;
  }

LABEL_5:
  BOOL v7 = +[NSMutableArray array];
  v8 = [(VLFSessionHomeWorkMonitor *)self homeMapItems];

  if (v8)
  {
    BOOL v9 = [(VLFSessionHomeWorkMonitor *)self homeMapItems];
    [v7 addObjectsFromArray:v9];
  }
  v10 = [(VLFSessionHomeWorkMonitor *)self workMapItems];

  if (v10)
  {
    int64_t v11 = [(VLFSessionHomeWorkMonitor *)self workMapItems];
    [v7 addObjectsFromArray:v11];
  }
  id v12 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v7;
  id v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v19 = MapsSuggestionsLocationForMapItem();
        [v4 distanceFromLocation:v19];
        v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        os_log_type_t v21 = [v18 name];
        [v12 setObject:v20 forKey:v21];
      }
      id v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }

  id v22 = [v12 copy];
LABEL_18:

  return v22;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      BOOL v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316418;
        id v13 = "-[VLFSessionHomeWorkMonitor locationManagerUpdatedLocation:]";
        __int16 v14 = 2080;
        id v15 = "VLFSessionHomeWorkMonitor.m";
        __int16 v16 = 1024;
        int v17 = 265;
        __int16 v18 = 2080;
        v19 = "dispatch_get_main_queue()";
        __int16 v20 = 2080;
        os_log_type_t v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v22 = 2080;
        __int16 v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v12,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int64_t v11 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          id v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
  v8 = [v4 lastLocation];
  [(VLFSessionHomeWorkMonitor *)self _updateStateWithLocation:v8];
}

- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4
{
  id v5 = a4;
  id v6 = sub_100013854();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    int v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Got a new me card", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003FECC0;
  v8[3] = &unk_1012E6690;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
}

- (NSArray)homeMapItems
{
  return self->_homeMapItems;
}

- (void)setHomeMapItems:(id)a3
{
}

- (NSArray)workMapItems
{
  return self->_workMapItems;
}

- (void)setWorkMapItems:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workMapItems, 0);
  objc_storeStrong((id *)&self->_homeMapItems, 0);

  objc_storeStrong((id *)&self->_lastLocation, 0);
}

@end