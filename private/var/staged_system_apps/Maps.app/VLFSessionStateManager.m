@interface VLFSessionStateManager
- (BOOL)didBuildMonitors;
- (GEOObserverHashTable)observers;
- (NSMutableSet)highThresholdMonitors;
- (NSMutableSet)lowThresholdMonitors;
- (PlatformController)platformController;
- (VLFSessionStateManager)initWithPlatformController:(id)a3;
- (id)allMonitors;
- (int64_t)currentState;
- (void)addObserver:(id)a3;
- (void)buildMonitors;
- (void)calculateCurrentState;
- (void)monitor:(id)a3 didChangeState:(int64_t)a4;
- (void)removeObserver:(id)a3;
- (void)setCurrentState:(int64_t)a3;
- (void)setDidBuildMonitors:(BOOL)a3;
- (void)setHighThresholdMonitors:(id)a3;
- (void)setLowThresholdMonitors:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPlatformController:(id)a3;
@end

@implementation VLFSessionStateManager

- (void)addObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(VLFSessionStateManager *)self observers];
    [v5 registerObserver:v4];
  }
}

- (VLFSessionStateManager)initWithPlatformController:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[VLFSessionStateManager initWithPlatformController:]";
      __int16 v20 = 2080;
      v21 = "VLFSessionStateManager.m";
      __int16 v22 = 1024;
      int v23 = 68;
      __int16 v24 = 2080;
      v25 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)VLFSessionStateManager;
  id v5 = [(VLFSessionStateManager *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_platformController, v4);
    v7 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___VLFSessionStateManagerDelegate queue:0];
    observers = v6->_observers;
    v6->_observers = v7;

    uint64_t v9 = +[NSMutableSet set];
    highThresholdMonitors = v6->_highThresholdMonitors;
    v6->_highThresholdMonitors = (NSMutableSet *)v9;

    uint64_t v11 = +[NSMutableSet set];
    lowThresholdMonitors = v6->_lowThresholdMonitors;
    v6->_lowThresholdMonitors = (NSMutableSet *)v11;

    [(VLFSessionStateManager *)v6 buildMonitors];
    [(VLFSessionStateManager *)v6 calculateCurrentState];
  }

  return v6;
}

- (void)calculateCurrentState
{
  v3 = sub_1000B26E8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Re-calculating the current state", buf, 2u);
  }

  id v4 = [(VLFSessionStateManager *)self lowThresholdMonitors];
  BOOL v5 = [v4 count] != 0;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v6 = [(VLFSessionStateManager *)self lowThresholdMonitors];
  id v7 = [v6 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v40;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        if (![*(id *)(*((void *)&v39 + 1) + 8 * i) state])
        {
          uint64_t v11 = sub_1000B26E8();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v12 = (objc_class *)objc_opt_class();
            v13 = NSStringFromClass(v12);
            *(_DWORD *)buf = 138412290;
            id v44 = v13;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@ did not satisfy the low threshold requirement", buf, 0xCu);
          }
          BOOL v5 = 0;
          goto LABEL_15;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  v14 = [(VLFSessionStateManager *)self highThresholdMonitors];
  id v15 = [v14 count];
  BOOL v16 = v15 != 0;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  objc_super v17 = [(VLFSessionStateManager *)self highThresholdMonitors];
  id v18 = [v17 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v36;
LABEL_17:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v36 != v20) {
        objc_enumerationMutation(v17);
      }
      if ([*(id *)(*((void *)&v35 + 1) + 8 * v21) state] != (id)2) {
        break;
      }
      if (v19 == (id)++v21)
      {
        id v19 = [v17 countByEnumeratingWithState:&v35 objects:v47 count:16];
        if (v19) {
          goto LABEL_17;
        }
        goto LABEL_23;
      }
    }
    __int16 v22 = sub_1000B26E8();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      int v23 = (objc_class *)objc_opt_class();
      __int16 v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138412290;
      id v44 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%@ did not satisfy the high threshold requirement", buf, 0xCu);
    }
    if (!v5)
    {
      BOOL v16 = 0;
      goto LABEL_32;
    }
    goto LABEL_29;
  }
LABEL_23:

  if (v5)
  {
    if (!v15)
    {
LABEL_29:
      v25 = sub_1000B26E8();
      uint64_t v26 = 1;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v27 = [(VLFSessionStateManager *)self lowThresholdMonitors];
        id v28 = [v27 count];
        *(_DWORD *)buf = 134217984;
        id v44 = v28;
        uint64_t v26 = 1;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "All %lu low threshold monitors are satisfied; updating state",
          buf,
          0xCu);
      }
      goto LABEL_40;
    }
    goto LABEL_34;
  }
LABEL_32:
  v29 = [(VLFSessionStateManager *)self lowThresholdMonitors];
  id v30 = [v29 count];

  if (!v30 && v16)
  {
LABEL_34:
    v25 = sub_1000B26E8();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v31 = [(VLFSessionStateManager *)self lowThresholdMonitors];
      id v32 = [v31 count];
      v33 = [(VLFSessionStateManager *)self highThresholdMonitors];
      id v34 = [v33 count];
      *(_DWORD *)buf = 134218240;
      id v44 = v32;
      __int16 v45 = 2048;
      id v46 = v34;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "All %lu low threshold and %lu high threshold monitors are satisfied; updating state",
        buf,
        0x16u);
    }
    uint64_t v26 = 2;
    goto LABEL_40;
  }
  v25 = sub_1000B26E8();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Neither the low nor the high threshold monitors were satisfied; updating state",
      buf,
      2u);
  }
  uint64_t v26 = 0;
LABEL_40:

  [(VLFSessionStateManager *)self setCurrentState:v26];
}

- (NSMutableSet)lowThresholdMonitors
{
  return self->_lowThresholdMonitors;
}

- (NSMutableSet)highThresholdMonitors
{
  return self->_highThresholdMonitors;
}

- (void)monitor:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  BOOL didBuildMonitors = self->_didBuildMonitors;
  id v8 = sub_1000B26E8();
  uint64_t v9 = v8;
  if (didBuildMonitors)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      v12 = (void *)v11;
      CFStringRef v13 = @"Hide";
      if (a4 == 1) {
        CFStringRef v13 = @"EnablePuck";
      }
      if (a4 == 2) {
        CFStringRef v13 = @"EnablePuckAndBanner";
      }
      int v18 = 138412546;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      CFStringRef v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ changed its state to %@; re-calculating VLF state",
        (uint8_t *)&v18,
        0x16u);
    }
    [(VLFSessionStateManager *)self calculateCurrentState];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      BOOL v16 = (void *)v15;
      CFStringRef v17 = @"Hide";
      if (a4 == 1) {
        CFStringRef v17 = @"EnablePuck";
      }
      if (a4 == 2) {
        CFStringRef v17 = @"EnablePuckAndBanner";
      }
      int v18 = 138412546;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      CFStringRef v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ changed its state to %@, but we haven't finished building the monitors yet; ignoring",
        (uint8_t *)&v18,
        0x16u);
    }
  }
}

- (void)buildMonitors
{
  if (!self->_didBuildMonitors) {
    goto LABEL_2;
  }
  v263 = sub_1005762E4();
  if (os_log_type_enabled(v263, OS_LOG_TYPE_ERROR))
  {
    int v267 = 136315906;
    v268 = "-[VLFSessionStateManager buildMonitors]";
    __int16 v269 = 2080;
    v270 = "VLFSessionStateManager.m";
    __int16 v271 = 1024;
    int v272 = 124;
    __int16 v273 = 2080;
    v274 = "!_didBuildMonitors";
    _os_log_impl((void *)&_mh_execute_header, v263, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v267, 0x26u);
  }

  if (sub_100BB36BC())
  {
    v264 = sub_1005762E4();
    if (os_log_type_enabled(v264, OS_LOG_TYPE_ERROR))
    {
      v265 = +[NSThread callStackSymbols];
      int v267 = 138412290;
      v268 = v265;
      _os_log_impl((void *)&_mh_execute_header, v264, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v267, 0xCu);
    }
  }
  if (!self->_didBuildMonitors)
  {
LABEL_2:
    unsigned int v3 = +[VLFSessionAppLaunchDelayMonitor isEnabled];
    sub_1000B26E8();
    id v4 = (VLFSessionAppLaunchDelayMonitor *)objc_claimAutoreleasedReturnValue();
    BOOL v5 = os_log_type_enabled(&v4->super.super, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v5)
      {
        id v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        id v7 = (char *)(id)objc_claimAutoreleasedReturnValue();
        int v267 = 138412290;
        v268 = v7;
        _os_log_impl((void *)&_mh_execute_header, &v4->super.super, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
      }
      id v4 = [[VLFSessionAppLaunchDelayMonitor alloc] initWithObserver:self];
      if (+[VLFSessionAppLaunchDelayMonitor affectsPuckVisibility])
      {
        id v8 = sub_1000B26E8();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          uint64_t v9 = (objc_class *)objc_opt_class();
          NSStringFromClass(v9);
          v10 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v10;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_lowThresholdMonitors addObject:v4];
      }
      if (+[VLFSessionAppLaunchDelayMonitor affectsBannerVisibility])
      {
        uint64_t v11 = sub_1000B26E8();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          CFStringRef v13 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_highThresholdMonitors addObject:v4];
      }
    }
    else if (v5)
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      uint64_t v15 = (char *)(id)objc_claimAutoreleasedReturnValue();
      int v267 = 138412290;
      v268 = v15;
      _os_log_impl((void *)&_mh_execute_header, &v4->super.super, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v267, 0xCu);
    }
    unsigned int v16 = +[VLFSessionCarPlayConnectionMonitor isEnabled];
    sub_1000B26E8();
    CFStringRef v17 = (VLFSessionCarPlayConnectionMonitor *)objc_claimAutoreleasedReturnValue();
    BOOL v18 = os_log_type_enabled(&v17->super.super, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v18)
      {
        uint64_t v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        __int16 v20 = (char *)(id)objc_claimAutoreleasedReturnValue();
        int v267 = 138412290;
        v268 = v20;
        _os_log_impl((void *)&_mh_execute_header, &v17->super.super, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
      }
      CFStringRef v17 = [[VLFSessionCarPlayConnectionMonitor alloc] initWithObserver:self];
      if (+[VLFSessionCarPlayConnectionMonitor affectsPuckVisibility])
      {
        CFStringRef v21 = sub_1000B26E8();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          __int16 v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          int v23 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v23;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_lowThresholdMonitors addObject:v17];
      }
      if (+[VLFSessionCarPlayConnectionMonitor affectsBannerVisibility])
      {
        __int16 v24 = sub_1000B26E8();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          uint64_t v26 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v26;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_highThresholdMonitors addObject:v17];
      }
    }
    else if (v18)
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      id v28 = (char *)(id)objc_claimAutoreleasedReturnValue();
      int v267 = 138412290;
      v268 = v28;
      _os_log_impl((void *)&_mh_execute_header, &v17->super.super, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v267, 0xCu);
    }
    unsigned int v29 = +[VLFSessionChromeStackMonitor isEnabled];
    id v30 = sub_1000B26E8();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
    if (v29)
    {
      if (v31)
      {
        id v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (char *)(id)objc_claimAutoreleasedReturnValue();
        int v267 = 138412290;
        v268 = v33;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
      }
      id v34 = [VLFSessionChromeStackMonitor alloc];
      long long v35 = [(VLFSessionStateManager *)self platformController];
      id v30 = [(VLFSessionChromeStackMonitor *)v34 initWithObserver:self platformController:v35];

      if (+[VLFSessionChromeStackMonitor affectsPuckVisibility])
      {
        long long v36 = sub_1000B26E8();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          long long v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          long long v38 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v38;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_lowThresholdMonitors addObject:v30];
      }
      if (+[VLFSessionChromeStackMonitor affectsBannerVisibility])
      {
        long long v39 = sub_1000B26E8();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          long long v40 = (objc_class *)objc_opt_class();
          NSStringFromClass(v40);
          long long v41 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v41;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_highThresholdMonitors addObject:v30];
      }
    }
    else if (v31)
    {
      long long v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (char *)(id)objc_claimAutoreleasedReturnValue();
      int v267 = 138412290;
      v268 = v43;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v267, 0xCu);
    }
    unsigned int v44 = +[VLFSessionCoarseLocationMonitor isEnabled];
    __int16 v45 = sub_1000B26E8();
    BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_INFO);
    if (v44)
    {
      if (v46)
      {
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v48 = (char *)(id)objc_claimAutoreleasedReturnValue();
        int v267 = 138412290;
        v268 = v48;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
      }
      v49 = [VLFSessionCoarseLocationMonitor alloc];
      id v50 = objc_alloc_init((Class)MKLocationManager);
      __int16 v45 = [(VLFSessionCoarseLocationMonitor *)v49 initWithObserver:self locationManager:v50];

      if (+[VLFSessionCoarseLocationMonitor affectsPuckVisibility])
      {
        v51 = sub_1000B26E8();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          v52 = (objc_class *)objc_opt_class();
          NSStringFromClass(v52);
          v53 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v53;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_lowThresholdMonitors addObject:v45];
      }
      if (+[VLFSessionCoarseLocationMonitor affectsBannerVisibility])
      {
        v54 = sub_1000B26E8();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          v55 = (objc_class *)objc_opt_class();
          NSStringFromClass(v55);
          v56 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v56;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_highThresholdMonitors addObject:v45];
      }
    }
    else if (v46)
    {
      v57 = (objc_class *)objc_opt_class();
      NSStringFromClass(v57);
      v58 = (char *)(id)objc_claimAutoreleasedReturnValue();
      int v267 = 138412290;
      v268 = v58;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v267, 0xCu);
    }
    unsigned int v59 = +[VLFSessionHistoricalLocationAccuracyMonitor isEnabled];
    v60 = sub_1000B26E8();
    BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_INFO);
    if (v59)
    {
      if (v61)
      {
        v62 = (objc_class *)objc_opt_class();
        NSStringFromClass(v62);
        v63 = (char *)(id)objc_claimAutoreleasedReturnValue();
        int v267 = 138412290;
        v268 = v63;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
      }
      v64 = [VLFSessionHistoricalLocationAccuracyMonitor alloc];
      v65 = +[MKLocationManager sharedLocationManager];
      v60 = [(VLFSessionHistoricalLocationAccuracyMonitor *)v64 initWithObserver:self locationManager:v65];

      if (+[VLFSessionHistoricalLocationAccuracyMonitor affectsPuckVisibility])
      {
        v66 = sub_1000B26E8();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          v67 = (objc_class *)objc_opt_class();
          NSStringFromClass(v67);
          v68 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v68;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_lowThresholdMonitors addObject:v60];
      }
      if (+[VLFSessionHistoricalLocationAccuracyMonitor affectsBannerVisibility])
      {
        v69 = sub_1000B26E8();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          v70 = (objc_class *)objc_opt_class();
          NSStringFromClass(v70);
          v71 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v71;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_highThresholdMonitors addObject:v60];
      }
    }
    else if (v61)
    {
      v72 = (objc_class *)objc_opt_class();
      NSStringFromClass(v72);
      v73 = (char *)(id)objc_claimAutoreleasedReturnValue();
      int v267 = 138412290;
      v268 = v73;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v267, 0xCu);
    }
    if (+[VLFSessionHomeWorkMonitor isEnabled])
    {
      v74 = sub_1000B26E8();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        v75 = (objc_class *)objc_opt_class();
        NSStringFromClass(v75);
        v76 = (char *)(id)objc_claimAutoreleasedReturnValue();
        int v267 = 138412290;
        v268 = v76;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
      }
      v77 = [VLFSessionHomeWorkMonitor alloc];
      v78 = +[MKLocationManager sharedLocationManager];
      v79 = [(VLFSessionHomeWorkMonitor *)v77 initWithObserver:self locationManager:v78];

      if (+[VLFSessionHomeWorkMonitor affectsPuckVisibility])
      {
        v80 = sub_1000B26E8();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          v81 = (objc_class *)objc_opt_class();
          NSStringFromClass(v81);
          v82 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v82;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_lowThresholdMonitors addObject:v79];
      }
      if (+[VLFSessionHomeWorkMonitor affectsBannerVisibility])
      {
        v83 = sub_1000B26E8();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
        {
          v84 = (objc_class *)objc_opt_class();
          NSStringFromClass(v84);
          v85 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v85;
          _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_highThresholdMonitors addObject:v79];
      }
    }
    if (+[VLFSessionLocationHorizontalAccuracyMonitor isEnabled])
    {
      v86 = sub_1000B26E8();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
      {
        v87 = (objc_class *)objc_opt_class();
        NSStringFromClass(v87);
        v88 = (char *)(id)objc_claimAutoreleasedReturnValue();
        int v267 = 138412290;
        v268 = v88;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
      }
      v89 = [VLFSessionLocationHorizontalAccuracyMonitor alloc];
      v90 = +[MKLocationManager sharedLocationManager];
      v91 = [(VLFSessionLocationHorizontalAccuracyMonitor *)v89 initWithObserver:self locationManager:v90];

      if (+[VLFSessionLocationHorizontalAccuracyMonitor affectsPuckVisibility])
      {
        v92 = sub_1000B26E8();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
        {
          v93 = (objc_class *)objc_opt_class();
          NSStringFromClass(v93);
          v94 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v94;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_lowThresholdMonitors addObject:v91];
      }
      if (+[VLFSessionLocationHorizontalAccuracyMonitor affectsBannerVisibility])
      {
        v95 = sub_1000B26E8();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
        {
          v96 = (objc_class *)objc_opt_class();
          NSStringFromClass(v96);
          v97 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v97;
          _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_highThresholdMonitors addObject:v91];
      }
    }
    if (+[VLFSessionLocationOutdoorMonitor isEnabled])
    {
      v98 = sub_1000B26E8();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
      {
        v99 = (objc_class *)objc_opt_class();
        NSStringFromClass(v99);
        v100 = (char *)(id)objc_claimAutoreleasedReturnValue();
        int v267 = 138412290;
        v268 = v100;
        _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
      }
      v101 = [VLFSessionLocationOutdoorMonitor alloc];
      v102 = +[VLFLocationManager sharedLocationManager];
      v103 = [(VLFSessionLocationOutdoorMonitor *)v101 initWithObserver:self locationManager:v102];

      if (+[VLFSessionLocationOutdoorMonitor affectsPuckVisibility])
      {
        v104 = sub_1000B26E8();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
        {
          v105 = (objc_class *)objc_opt_class();
          NSStringFromClass(v105);
          v106 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v106;
          _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_lowThresholdMonitors addObject:v103];
      }
      if (+[VLFSessionLocationOutdoorMonitor affectsBannerVisibility])
      {
        v107 = sub_1000B26E8();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
        {
          v108 = (objc_class *)objc_opt_class();
          NSStringFromClass(v108);
          v109 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v109;
          _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_highThresholdMonitors addObject:v103];
      }
    }
    if (+[VLFSessionLocationSignalEnvironmentMonitor isEnabled])
    {
      v110 = sub_1000B26E8();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
      {
        v111 = (objc_class *)objc_opt_class();
        NSStringFromClass(v111);
        v112 = (char *)(id)objc_claimAutoreleasedReturnValue();
        int v267 = 138412290;
        v268 = v112;
        _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
      }
      v113 = [VLFSessionLocationSignalEnvironmentMonitor alloc];
      v114 = +[VLFLocationManager sharedLocationManager];
      v115 = [(VLFSessionLocationSignalEnvironmentMonitor *)v113 initWithObserver:self locationManager:v114];

      if (+[VLFSessionLocationSignalEnvironmentMonitor affectsPuckVisibility])
      {
        v116 = sub_1000B26E8();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
        {
          v117 = (objc_class *)objc_opt_class();
          NSStringFromClass(v117);
          v118 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v118;
          _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_lowThresholdMonitors addObject:v115];
      }
      if (+[VLFSessionLocationSignalEnvironmentMonitor affectsBannerVisibility])
      {
        v119 = sub_1000B26E8();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
        {
          v120 = (objc_class *)objc_opt_class();
          NSStringFromClass(v120);
          v121 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v121;
          _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_highThresholdMonitors addObject:v115];
      }
    }
    if (+[VLFSessionLocationTypeMonitor isEnabled])
    {
      v122 = sub_1000B26E8();
      if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
      {
        v123 = (objc_class *)objc_opt_class();
        NSStringFromClass(v123);
        v124 = (char *)(id)objc_claimAutoreleasedReturnValue();
        int v267 = 138412290;
        v268 = v124;
        _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
      }
      v125 = [VLFSessionLocationTypeMonitor alloc];
      v126 = +[VLFLocationManager sharedLocationManager];
      v127 = [(VLFSessionLocationTypeMonitor *)v125 initWithObserver:self locationManager:v126];

      if (+[VLFSessionLocationTypeMonitor affectsPuckVisibility])
      {
        v128 = sub_1000B26E8();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
        {
          v129 = (objc_class *)objc_opt_class();
          NSStringFromClass(v129);
          v130 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v130;
          _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_lowThresholdMonitors addObject:v127];
      }
      if (+[VLFSessionLocationTypeMonitor affectsBannerVisibility])
      {
        v131 = sub_1000B26E8();
        if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
        {
          v132 = (objc_class *)objc_opt_class();
          NSStringFromClass(v132);
          v133 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v133;
          _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_highThresholdMonitors addObject:v127];
      }
    }
    unsigned int v134 = +[VLFSessionMapsHomeMonitor isEnabled];
    v135 = sub_1000B26E8();
    BOOL v136 = os_log_type_enabled(v135, OS_LOG_TYPE_INFO);
    if (v134)
    {
      if (v136)
      {
        v137 = (objc_class *)objc_opt_class();
        NSStringFromClass(v137);
        v138 = (char *)(id)objc_claimAutoreleasedReturnValue();
        int v267 = 138412290;
        v268 = v138;
        _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
      }
      v139 = [VLFSessionMapsHomeMonitor alloc];
      v140 = [(VLFSessionStateManager *)self platformController];
      v135 = [(VLFSessionMapsHomeMonitor *)v139 initWithObserver:self platformController:v140];

      if (+[VLFSessionMapsHomeMonitor affectsPuckVisibility])
      {
        v141 = sub_1000B26E8();
        if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
        {
          v142 = (objc_class *)objc_opt_class();
          NSStringFromClass(v142);
          v143 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v143;
          _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_lowThresholdMonitors addObject:v135];
      }
      if (+[VLFSessionMapsHomeMonitor affectsBannerVisibility])
      {
        v144 = sub_1000B26E8();
        if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
        {
          v145 = (objc_class *)objc_opt_class();
          NSStringFromClass(v145);
          v146 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v146;
          _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_highThresholdMonitors addObject:v135];
      }
    }
    else if (v136)
    {
      v147 = (objc_class *)objc_opt_class();
      NSStringFromClass(v147);
      v148 = (char *)(id)objc_claimAutoreleasedReturnValue();
      int v267 = 138412290;
      v268 = v148;
      _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v267, 0xCu);
    }
    unsigned int v149 = +[VLFSessionNetworkReachabilityMonitor isEnabled];
    sub_1000B26E8();
    v150 = (VLFSessionNetworkReachabilityMonitor *)objc_claimAutoreleasedReturnValue();
    BOOL v151 = os_log_type_enabled(&v150->super.super, OS_LOG_TYPE_INFO);
    if (v149)
    {
      if (v151)
      {
        v152 = (objc_class *)objc_opt_class();
        NSStringFromClass(v152);
        v153 = (char *)(id)objc_claimAutoreleasedReturnValue();
        int v267 = 138412290;
        v268 = v153;
        _os_log_impl((void *)&_mh_execute_header, &v150->super.super, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
      }
      v150 = [[VLFSessionNetworkReachabilityMonitor alloc] initWithObserver:self];
      if (+[VLFSessionNetworkReachabilityMonitor affectsPuckVisibility])
      {
        v154 = sub_1000B26E8();
        if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
        {
          v155 = (objc_class *)objc_opt_class();
          NSStringFromClass(v155);
          v156 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v156;
          _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_lowThresholdMonitors addObject:v150];
      }
      if (+[VLFSessionNetworkReachabilityMonitor affectsBannerVisibility])
      {
        v157 = sub_1000B26E8();
        if (os_log_type_enabled(v157, OS_LOG_TYPE_INFO))
        {
          v158 = (objc_class *)objc_opt_class();
          NSStringFromClass(v158);
          v159 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v159;
          _os_log_impl((void *)&_mh_execute_header, v157, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_highThresholdMonitors addObject:v150];
      }
    }
    else if (v151)
    {
      v160 = (objc_class *)objc_opt_class();
      NSStringFromClass(v160);
      v161 = (char *)(id)objc_claimAutoreleasedReturnValue();
      int v267 = 138412290;
      v268 = v161;
      _os_log_impl((void *)&_mh_execute_header, &v150->super.super, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v267, 0xCu);
    }
    unsigned int v162 = +[VLFSessionOfflineMonitor isEnabled];
    sub_1000B26E8();
    v163 = (VLFSessionOfflineMonitor *)objc_claimAutoreleasedReturnValue();
    BOOL v164 = os_log_type_enabled(&v163->super.super, OS_LOG_TYPE_INFO);
    if (v162)
    {
      if (v164)
      {
        v165 = (objc_class *)objc_opt_class();
        NSStringFromClass(v165);
        v166 = (char *)(id)objc_claimAutoreleasedReturnValue();
        int v267 = 138412290;
        v268 = v166;
        _os_log_impl((void *)&_mh_execute_header, &v163->super.super, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
      }
      v163 = [[VLFSessionOfflineMonitor alloc] initWithObserver:self];
      if (+[VLFSessionOfflineMonitor affectsPuckVisibility])
      {
        v167 = sub_1000B26E8();
        if (os_log_type_enabled(v167, OS_LOG_TYPE_INFO))
        {
          v168 = (objc_class *)objc_opt_class();
          NSStringFromClass(v168);
          v169 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v169;
          _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_lowThresholdMonitors addObject:v163];
      }
      if (+[VLFSessionOfflineMonitor affectsBannerVisibility])
      {
        v170 = sub_1000B26E8();
        if (os_log_type_enabled(v170, OS_LOG_TYPE_INFO))
        {
          v171 = (objc_class *)objc_opt_class();
          NSStringFromClass(v171);
          v172 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v172;
          _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_highThresholdMonitors addObject:v163];
      }
    }
    else if (v164)
    {
      v173 = (objc_class *)objc_opt_class();
      NSStringFromClass(v173);
      v174 = (char *)(id)objc_claimAutoreleasedReturnValue();
      int v267 = 138412290;
      v268 = v174;
      _os_log_impl((void *)&_mh_execute_header, &v163->super.super, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v267, 0xCu);
    }
    unsigned int v175 = +[VLFSessionThermalStateMonitor isEnabled];
    sub_1000B26E8();
    v176 = (VLFSessionThermalStateMonitor *)objc_claimAutoreleasedReturnValue();
    BOOL v177 = os_log_type_enabled(&v176->super.super, OS_LOG_TYPE_INFO);
    if (v175)
    {
      if (v177)
      {
        v178 = (objc_class *)objc_opt_class();
        NSStringFromClass(v178);
        v179 = (char *)(id)objc_claimAutoreleasedReturnValue();
        int v267 = 138412290;
        v268 = v179;
        _os_log_impl((void *)&_mh_execute_header, &v176->super.super, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
      }
      v176 = [[VLFSessionThermalStateMonitor alloc] initWithObserver:self];
      if (+[VLFSessionThermalStateMonitor affectsPuckVisibility])
      {
        v180 = sub_1000B26E8();
        if (os_log_type_enabled(v180, OS_LOG_TYPE_INFO))
        {
          v181 = (objc_class *)objc_opt_class();
          NSStringFromClass(v181);
          v182 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v182;
          _os_log_impl((void *)&_mh_execute_header, v180, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_lowThresholdMonitors addObject:v176];
      }
      if (+[VLFSessionThermalStateMonitor affectsBannerVisibility])
      {
        v183 = sub_1000B26E8();
        if (os_log_type_enabled(v183, OS_LOG_TYPE_INFO))
        {
          v184 = (objc_class *)objc_opt_class();
          NSStringFromClass(v184);
          v185 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v185;
          _os_log_impl((void *)&_mh_execute_header, v183, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_highThresholdMonitors addObject:v176];
      }
    }
    else if (v177)
    {
      v186 = (objc_class *)objc_opt_class();
      NSStringFromClass(v186);
      v187 = (char *)(id)objc_claimAutoreleasedReturnValue();
      int v267 = 138412290;
      v268 = v187;
      _os_log_impl((void *)&_mh_execute_header, &v176->super.super, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v267, 0xCu);
    }
    unsigned int v188 = +[VLFSessionTileAvailabilityMonitor isEnabled];
    v189 = sub_1000B26E8();
    BOOL v190 = os_log_type_enabled(v189, OS_LOG_TYPE_INFO);
    if (v188)
    {
      if (v190)
      {
        v191 = (objc_class *)objc_opt_class();
        NSStringFromClass(v191);
        v192 = (char *)(id)objc_claimAutoreleasedReturnValue();
        int v267 = 138412290;
        v268 = v192;
        _os_log_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
      }
      v193 = [VLFTileObserver alloc];
      v194 = +[MKLocationManager sharedLocationManager];
      v195 = +[MNNavigationService sharedService];
      v189 = [(VLFTileObserver *)v193 initWithLocationManager:v194 navigationService:v195 purpose:1];

      v196 = [[VLFSessionTileAvailabilityMonitor alloc] initWithObserver:self tileObserver:v189];
      if (+[VLFSessionTileAvailabilityMonitor affectsPuckVisibility])
      {
        v197 = sub_1000B26E8();
        if (os_log_type_enabled(v197, OS_LOG_TYPE_INFO))
        {
          v198 = (objc_class *)objc_opt_class();
          NSStringFromClass(v198);
          v199 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v199;
          _os_log_impl((void *)&_mh_execute_header, v197, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_lowThresholdMonitors addObject:v196];
      }
      if (+[VLFSessionTileAvailabilityMonitor affectsBannerVisibility])
      {
        v200 = sub_1000B26E8();
        if (os_log_type_enabled(v200, OS_LOG_TYPE_INFO))
        {
          v201 = (objc_class *)objc_opt_class();
          NSStringFromClass(v201);
          v202 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v202;
          _os_log_impl((void *)&_mh_execute_header, v200, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
        }
        [(NSMutableSet *)self->_highThresholdMonitors addObject:v196];
      }
    }
    else
    {
      if (!v190)
      {
LABEL_193:

        unsigned int v204 = +[VLFSessionTransitSteppingMonitor isEnabled];
        v205 = sub_1000B26E8();
        BOOL v206 = os_log_type_enabled(v205, OS_LOG_TYPE_INFO);
        if (v204)
        {
          if (v206)
          {
            v207 = (objc_class *)objc_opt_class();
            NSStringFromClass(v207);
            v208 = (char *)(id)objc_claimAutoreleasedReturnValue();
            int v267 = 138412290;
            v268 = v208;
            _os_log_impl((void *)&_mh_execute_header, v205, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
          }
          v209 = [VLFSessionTransitSteppingMonitor alloc];
          v210 = +[MNNavigationService sharedService];
          v205 = [(VLFSessionTransitSteppingMonitor *)v209 initWithObserver:self navigationService:v210];

          if (+[VLFSessionTransitSteppingMonitor affectsPuckVisibility])
          {
            v211 = sub_1000B26E8();
            if (os_log_type_enabled(v211, OS_LOG_TYPE_INFO))
            {
              v212 = (objc_class *)objc_opt_class();
              NSStringFromClass(v212);
              v213 = (char *)(id)objc_claimAutoreleasedReturnValue();
              int v267 = 138412290;
              v268 = v213;
              _os_log_impl((void *)&_mh_execute_header, v211, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
            }
            [(NSMutableSet *)self->_lowThresholdMonitors addObject:v205];
          }
          if (+[VLFSessionTransitSteppingMonitor affectsBannerVisibility])
          {
            v214 = sub_1000B26E8();
            if (os_log_type_enabled(v214, OS_LOG_TYPE_INFO))
            {
              v215 = (objc_class *)objc_opt_class();
              NSStringFromClass(v215);
              v216 = (char *)(id)objc_claimAutoreleasedReturnValue();
              int v267 = 138412290;
              v268 = v216;
              _os_log_impl((void *)&_mh_execute_header, v214, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
            }
            [(NSMutableSet *)self->_highThresholdMonitors addObject:v205];
          }
        }
        else if (v206)
        {
          v217 = (objc_class *)objc_opt_class();
          NSStringFromClass(v217);
          v218 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v218;
          _os_log_impl((void *)&_mh_execute_header, v205, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v267, 0xCu);
        }
        unsigned int v219 = +[VLFSessionUsageMonitor isEnabled];
        sub_1000B26E8();
        v220 = (VLFSessionUsageMonitor *)objc_claimAutoreleasedReturnValue();
        BOOL v221 = os_log_type_enabled(&v220->super.super, OS_LOG_TYPE_INFO);
        if (v219)
        {
          if (v221)
          {
            v222 = (objc_class *)objc_opt_class();
            NSStringFromClass(v222);
            v223 = (char *)(id)objc_claimAutoreleasedReturnValue();
            int v267 = 138412290;
            v268 = v223;
            _os_log_impl((void *)&_mh_execute_header, &v220->super.super, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
          }
          v220 = [[VLFSessionUsageMonitor alloc] initWithObserver:self];
          if (+[VLFSessionUsageMonitor affectsPuckVisibility])
          {
            v224 = sub_1000B26E8();
            if (os_log_type_enabled(v224, OS_LOG_TYPE_INFO))
            {
              v225 = (objc_class *)objc_opt_class();
              NSStringFromClass(v225);
              v226 = (char *)(id)objc_claimAutoreleasedReturnValue();
              int v267 = 138412290;
              v268 = v226;
              _os_log_impl((void *)&_mh_execute_header, v224, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
            }
            [(NSMutableSet *)self->_lowThresholdMonitors addObject:v220];
          }
          if (+[VLFSessionUsageMonitor affectsBannerVisibility])
          {
            v227 = sub_1000B26E8();
            if (os_log_type_enabled(v227, OS_LOG_TYPE_INFO))
            {
              v228 = (objc_class *)objc_opt_class();
              NSStringFromClass(v228);
              v229 = (char *)(id)objc_claimAutoreleasedReturnValue();
              int v267 = 138412290;
              v268 = v229;
              _os_log_impl((void *)&_mh_execute_header, v227, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
            }
            [(NSMutableSet *)self->_highThresholdMonitors addObject:v220];
          }
        }
        else if (v221)
        {
          v230 = (objc_class *)objc_opt_class();
          NSStringFromClass(v230);
          v231 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v231;
          _os_log_impl((void *)&_mh_execute_header, &v220->super.super, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v267, 0xCu);
        }
        if (+[VLFSessionDebugPuckVisibilityMonitor isEnabled])
        {
          v232 = sub_1000B26E8();
          if (os_log_type_enabled(v232, OS_LOG_TYPE_INFO))
          {
            v233 = (objc_class *)objc_opt_class();
            NSStringFromClass(v233);
            v234 = (char *)(id)objc_claimAutoreleasedReturnValue();
            int v267 = 138412290;
            v268 = v234;
            _os_log_impl((void *)&_mh_execute_header, v232, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
          }
          v235 = [[VLFSessionDebugPuckVisibilityMonitor alloc] initWithObserver:self];
          v236 = sub_1000B26E8();
          if (os_log_type_enabled(v236, OS_LOG_TYPE_INFO))
          {
            v237 = (objc_class *)objc_opt_class();
            NSStringFromClass(v237);
            v238 = (char *)(id)objc_claimAutoreleasedReturnValue();
            int v267 = 138412290;
            v268 = v238;
            _os_log_impl((void *)&_mh_execute_header, v236, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
          }
          [(NSMutableSet *)self->_lowThresholdMonitors addObject:v235];
        }
        if (+[VLFSessionDebugBannerVisibilityMonitor isEnabled])
        {
          v239 = sub_1000B26E8();
          if (os_log_type_enabled(v239, OS_LOG_TYPE_INFO))
          {
            v240 = (objc_class *)objc_opt_class();
            NSStringFromClass(v240);
            v241 = (char *)(id)objc_claimAutoreleasedReturnValue();
            int v267 = 138412290;
            v268 = v241;
            _os_log_impl((void *)&_mh_execute_header, v239, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
          }
          v242 = [[VLFSessionDebugBannerVisibilityMonitor alloc] initWithObserver:self];
          v243 = sub_1000B26E8();
          if (os_log_type_enabled(v243, OS_LOG_TYPE_INFO))
          {
            v244 = (objc_class *)objc_opt_class();
            NSStringFromClass(v244);
            v245 = (char *)(id)objc_claimAutoreleasedReturnValue();
            int v267 = 138412290;
            v268 = v245;
            _os_log_impl((void *)&_mh_execute_header, v243, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
          }
          [(NSMutableSet *)self->_highThresholdMonitors addObject:v242];
        }
        unsigned int v246 = +[VLFSessionSunsetSunriseMonitor isEnabled];
        v247 = sub_1000B26E8();
        BOOL v248 = os_log_type_enabled(v247, OS_LOG_TYPE_INFO);
        if (v246)
        {
          if (v248)
          {
            v249 = (objc_class *)objc_opt_class();
            NSStringFromClass(v249);
            v250 = (char *)(id)objc_claimAutoreleasedReturnValue();
            int v267 = 138412290;
            v268 = v250;
            _os_log_impl((void *)&_mh_execute_header, v247, OS_LOG_TYPE_INFO, "Enabling %@", (uint8_t *)&v267, 0xCu);
          }
          v251 = [VLFSessionSunsetSunriseMonitor alloc];
          v252 = +[MKLocationManager sharedLocationManager];
          v253 = +[SunsetSunriseCalculator sharedCalculator];
          v254 = [(VLFSessionStateManager *)self platformController];
          v247 = [(VLFSessionSunsetSunriseMonitor *)v251 initWithObserver:self locationManager:v252 sunsetSunriseCalculator:v253 platformController:v254 transportTypeSupportProvider:objc_opt_class()];

          if (+[VLFSessionSunsetSunriseMonitor affectsPuckVisibility])
          {
            v255 = sub_1000B26E8();
            if (os_log_type_enabled(v255, OS_LOG_TYPE_INFO))
            {
              v256 = (objc_class *)objc_opt_class();
              NSStringFromClass(v256);
              v257 = (char *)(id)objc_claimAutoreleasedReturnValue();
              int v267 = 138412290;
              v268 = v257;
              _os_log_impl((void *)&_mh_execute_header, v255, OS_LOG_TYPE_INFO, "%@ has passive state", (uint8_t *)&v267, 0xCu);
            }
            [(NSMutableSet *)self->_lowThresholdMonitors addObject:v247];
          }
          if (+[VLFSessionSunsetSunriseMonitor affectsBannerVisibility])
          {
            v258 = sub_1000B26E8();
            if (os_log_type_enabled(v258, OS_LOG_TYPE_INFO))
            {
              v259 = (objc_class *)objc_opt_class();
              NSStringFromClass(v259);
              v260 = (char *)(id)objc_claimAutoreleasedReturnValue();
              int v267 = 138412290;
              v268 = v260;
              _os_log_impl((void *)&_mh_execute_header, v258, OS_LOG_TYPE_INFO, "%@ has active state", (uint8_t *)&v267, 0xCu);
            }
            [(NSMutableSet *)self->_highThresholdMonitors addObject:v247];
          }
        }
        else if (v248)
        {
          v261 = (objc_class *)objc_opt_class();
          NSStringFromClass(v261);
          v262 = (char *)(id)objc_claimAutoreleasedReturnValue();
          int v267 = 138412290;
          v268 = v262;
          _os_log_impl((void *)&_mh_execute_header, v247, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v267, 0xCu);
        }
        self->_BOOL didBuildMonitors = 1;
        return;
      }
      v203 = (objc_class *)objc_opt_class();
      NSStringFromClass(v203);
      v196 = (VLFSessionTileAvailabilityMonitor *)(id)objc_claimAutoreleasedReturnValue();
      int v267 = 138412290;
      v268 = (const char *)v196;
      _os_log_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_INFO, "Not enabling %@", (uint8_t *)&v267, 0xCu);
    }
    goto LABEL_193;
  }
  v266 = sub_1000B26E8();
  if (os_log_type_enabled(v266, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v267) = 0;
    _os_log_impl((void *)&_mh_execute_header, v266, OS_LOG_TYPE_ERROR, "Can't build the monitors more than once; ignoring",
      (uint8_t *)&v267,
      2u);
  }
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setCurrentState:(int64_t)a3
{
  if (self->_currentState != a3)
  {
    self->_int64_t currentState = a3;
    id v4 = sub_1000B26E8();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int64_t currentState = self->_currentState;
      CFStringRef v6 = @"Off";
      if (currentState == 1) {
        CFStringRef v6 = @"Puck";
      }
      if (currentState == 2) {
        CFStringRef v7 = @"PuckAndBanner";
      }
      else {
        CFStringRef v7 = v6;
      }
      int v9 = 138412290;
      CFStringRef v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "State changed to %@", (uint8_t *)&v9, 0xCu);
    }

    id v8 = [(VLFSessionStateManager *)self observers];
    [v8 stateManager:self didChangeState:self->_currentState];
  }
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(VLFSessionStateManager *)self observers];
    [v5 unregisterObserver:v4];
  }
}

- (id)allMonitors
{
  unsigned int v3 = [(VLFSessionStateManager *)self lowThresholdMonitors];
  id v4 = [(VLFSessionStateManager *)self highThresholdMonitors];
  id v5 = [v3 setByAddingObjectsFromSet:v4];

  return v5;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setPlatformController:(id)a3
{
}

- (void)setObservers:(id)a3
{
}

- (void)setHighThresholdMonitors:(id)a3
{
}

- (void)setLowThresholdMonitors:(id)a3
{
}

- (BOOL)didBuildMonitors
{
  return self->_didBuildMonitors;
}

- (void)setDidBuildMonitors:(BOOL)a3
{
  self->_BOOL didBuildMonitors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowThresholdMonitors, 0);
  objc_storeStrong((id *)&self->_highThresholdMonitors, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_destroyWeak((id *)&self->_platformController);
}

@end