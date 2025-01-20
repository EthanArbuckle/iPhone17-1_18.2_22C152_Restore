@interface PowerModesManager
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ChargeDurationPredictor)chargingPredictor;
- (DeviceContext)deviceContext;
- (NSMutableDictionary)powerModes;
- (NSString)overridePresent;
- (NSUserDefaults)defaults;
- (PowerModesManager)init;
- (PowerModesService)powerModesService;
- (ResourceManager)resourceManager;
- (id)getModeFromName:(id)a3;
- (id)getSavedExitDate:(id)a3;
- (void)clearState;
- (void)disablePowerMode:(id)a3 withReply:(id)a4;
- (void)enablePowerMode:(id)a3 withReply:(id)a4;
- (void)enterMode:(id)a3;
- (void)evaluatePowerModes;
- (void)evaluatePowerModes:(id)a3 withContext:(id)a4;
- (void)exitMode:(id)a3;
- (void)initializeAllModes;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)restoreState;
- (void)saveState;
- (void)setChargingPredictor:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDeviceContext:(id)a3;
- (void)setOverridePresent:(id)a3;
- (void)setPowerModes:(id)a3;
- (void)setPowerModesService:(id)a3;
- (void)setResourceManager:(id)a3;
- (void)start;
- (void)updateAllowOnCharger:(id)a3 withState:(BOOL)a4 andReply:(id)a5;
- (void)updateEntryDelay:(id)a3 withDelay:(double)a4 andReply:(id)a5;
- (void)updateMaxEngagementDuration:(id)a3 withDuration:(double)a4 andReply:(id)a5;
- (void)updatePowerMode:(id)a3 withState:(BOOL)a4 andReply:(id)a5;
@end

@implementation PowerModesManager

- (void)evaluatePowerModes
{
  v3 = sub_100003E44();
  dispatch_assert_queue_V2(v3);

  v4 = [(PowerModesManager *)self deviceContext];
  id v7 = [v4 currentContext];

  v5 = [(PowerModesManager *)self resourceManager];
  v6 = [v5 resourceHints];

  [(PowerModesManager *)self evaluatePowerModes:v6 withContext:v7];
}

- (void)evaluatePowerModes:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v35 = a4;
  id v7 = [(PowerModesManager *)self overridePresent];

  if (!v7)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v9 = [(PowerModesManager *)self powerModes];
    id v11 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (!v11) {
      goto LABEL_26;
    }
    id v12 = v11;
    uint64_t v13 = *(void *)v43;
    v32 = v37;
    id v33 = v6;
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v42 + 1) + 8 * (void)v14);
        v16 = [(PowerModesManager *)self powerModes];
        v17 = [v16 objectForKeyedSubscript:v15];

        if (([v17 isEnabled] & 1) == 0)
        {
          v24 = (void *)qword_10001BF08;
          if (!os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_INFO)) {
            goto LABEL_22;
          }
          v21 = v24;
          v25 = (objc_class *)objc_opt_class();
          v26 = NSStringFromClass(v25);
          *(_DWORD *)buf = 138412290;
          v48 = v26;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%@ is disabled. Skipping evaluation", buf, 0xCu);

          goto LABEL_18;
        }
        if ([v17 isSupportedPlatform])
        {
          if ([v17 evaluatePowerModeWithResourceHints:v6 andContext:v35])
          {
            if ([v17 getState]) {
              goto LABEL_22;
            }
            [v17 getEntryDelay];
            double v19 = v18;
            v20 = v17;
            v21 = v20;
            if (v19 <= 0.0)
            {
              [(PowerModesManager *)self enterMode:v20];
            }
            else if (([v20 pendingDelayedEntryTimer] & 1) == 0)
            {
              dispatch_time_t when = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(v19 * 1000000000.0));
              v22 = sub_100003E44();
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              v37[0] = sub_10000B004;
              v37[1] = &unk_1000147C0;
              v38 = v21;
              v39 = self;
              v23 = v38;
              v40 = v23;
              double v41 = v19;
              dispatch_after(when, v22, block);

              id v6 = v33;
              [v23 setPendingDelayedEntryTimer:1];
            }
LABEL_18:

            goto LABEL_22;
          }
          [(PowerModesManager *)self exitMode:v17];
        }
        else
        {
          v27 = (void *)qword_10001BF08;
          if (os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_INFO))
          {
            v28 = v27;
            v29 = (objc_class *)objc_opt_class();
            v30 = NSStringFromClass(v29);
            *(_DWORD *)buf = 138412290;
            v48 = v30;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%@ is not supported on this platform. Skipping evaluation", buf, 0xCu);
          }
        }
LABEL_22:

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v31 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
      id v12 = v31;
      if (!v31)
      {
LABEL_26:

        goto LABEL_27;
      }
    }
  }
  v8 = (void *)qword_10001BF08;
  if (os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = [(PowerModesManager *)self overridePresent];
    *(_DWORD *)buf = 138412290;
    v48 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Override present. Skipping evaluation. Please exit %@ mode using powerexperienceutil", buf, 0xCu);

    goto LABEL_26;
  }
LABEL_27:
}

- (NSMutableDictionary)powerModes
{
  return self->_powerModes;
}

- (void)exitMode:(id)a3
{
  id v7 = a3;
  if ([v7 getState])
  {
    [v7 exitPowerMode];
    if (([v7 getState] & 1) == 0)
    {
      v4 = [(PowerModesManager *)self powerModesService];
      v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      [v4 updateClientsforMode:v6 withState:0];
    }
    [(PowerModesManager *)self saveState];
  }

  _objc_release_x1();
}

- (ResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (NSString)overridePresent
{
  return self->_overridePresent;
}

- (DeviceContext)deviceContext
{
  return self->_deviceContext;
}

+ (id)sharedInstance
{
  if (qword_10001BF18 != -1) {
    dispatch_once(&qword_10001BF18, &stru_100014798);
  }
  v2 = (void *)qword_10001BF10;

  return v2;
}

- (void)initializeAllModes
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10000A868;
  block[3] = &unk_1000145C0;
  block[4] = self;
  if (qword_10001BF00 != -1) {
    dispatch_once(&qword_10001BF00, block);
  }
}

- (PowerModesManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)PowerModesManager;
  v2 = [(PowerModesManager *)&v17 initWithMachServiceName:@"com.apple.powerexperienced.powermodes"];
  if (v2)
  {
    uint64_t v3 = +[DeviceContext sharedInstance];
    deviceContext = v2->_deviceContext;
    v2->_deviceContext = (DeviceContext *)v3;

    uint64_t v5 = +[ResourceManager sharedInstance];
    resourceManager = v2->_resourceManager;
    v2->_resourceManager = (ResourceManager *)v5;

    uint64_t v7 = +[PowerModesService sharedInstance];
    powerModesService = v2->_powerModesService;
    v2->_powerModesService = (PowerModesService *)v7;

    v9 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.powerexperienced.powermodes"];
    defaults = v2->_defaults;
    v2->_defaults = v9;

    [(PowerModesManager *)v2 initializeAllModes];
    id v11 = qword_10001BF08;
    if (os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "starting service", buf, 2u);
    }
    [(PowerModesManager *)v2 setDelegate:v2];
    id v12 = sub_100003E44();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10000AC0C;
    block[3] = &unk_1000145C0;
    uint64_t v15 = v2;
    dispatch_async(v12, block);
  }
  return v2;
}

- (void)start
{
  [(PowerModesManager *)self activate];
  uint64_t v3 = [(PowerModesManager *)self deviceContext];
  [v3 addObserver:self forKeyPath:@"currentContext" options:3 context:0];

  v4 = +[ChargeDurationPredictor sharedInstance];
  chargingPredictor = self->_chargingPredictor;
  self->_chargingPredictor = v4;

  id v6 = [(PowerModesManager *)self chargingPredictor];
  [v6 addObserver:self forKeyPath:@"predictorOutput" options:3 context:0];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____PowerModesManagerProtocol];
  [v5 setExportedInterface:v6];

  uint64_t v7 = [v5 valueForEntitlement:@"com.apple.powerexperience.powermode.update"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v7 BOOLValue])
  {
    v8 = (void *)qword_10001BF08;
    if (os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      v13[0] = 67109120;
      v13[1] = [v5 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "PowerModesManager: listener: accepted new connection from pid %d", (uint8_t *)v13, 8u);
    }
    [v5 setExportedObject:self];
    [v5 resume];
    BOOL v10 = 1;
  }
  else
  {
    id v11 = (void *)qword_10001BF08;
    if (os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_ERROR)) {
      sub_10000D1D4(v11, v5);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a5;
  v8 = sub_100003E44();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000AF58;
  v10[3] = &unk_100014520;
  id v11 = v7;
  id v12 = self;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (void)enterMode:(id)a3
{
  id v4 = a3;
  if (([v4 getState] & 1) == 0)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v5 = [(PowerModesManager *)self powerModes];
    id v6 = [v5 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v48;
      id v9 = &selRef_powerModes;
      long long v42 = self;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v48 != v8) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          id v12 = (objc_class *)objc_opt_class();
          uint64_t v13 = NSStringFromClass(v12);
          unsigned __int8 v14 = [v11 isEqualToString:v13];

          if ((v14 & 1) == 0)
          {
            uint64_t v15 = [(PowerModesManager *)self powerModes];
            v16 = [v15 objectForKeyedSubscript:v11];

            if ([v16 getState]
              && [v16 isEnabled]
              && [v16 isSupportedPlatform])
            {
              objc_super v17 = v9[481];
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                double v18 = v17;
                double v19 = (objc_class *)objc_opt_class();
                v20 = NSStringFromClass(v19);
                v21 = (objc_class *)objc_opt_class();
                NSStringFromClass(v21);
                v23 = v22 = v9;
                *(_DWORD *)buf = 138412546;
                v52 = v20;
                __int16 v53 = 2112;
                double v54 = *(double *)&v23;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "exiting mode %@ before entering %@", buf, 0x16u);

                id v9 = v22;
                self = v42;
              }
              [(PowerModesManager *)self exitMode:v16];
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v7);
    }

    [v4 enterPowerMode];
    if ([v4 getState])
    {
      v24 = [(PowerModesManager *)self powerModesService];
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      [v24 updateClientsforMode:v26 withState:1];

      [v4 getMaxEngagementDuration];
      if (v27 != 0.0)
      {
        double v28 = v27;
        v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        id v31 = [(PowerModesManager *)self getSavedExitDate:v30];

        if (v31)
        {
          v32 = +[NSDate distantFuture];
          unsigned __int8 v33 = [v31 isEqualToDate:v32];

          if ((v33 & 1) == 0)
          {
            v34 = qword_10001BF08;
            if (os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v52 = v31;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Saved exit date %@", buf, 0xCu);
            }
            [v31 timeIntervalSinceNow];
            double v28 = v35;
          }
        }
        v36 = (void *)qword_10001BF08;
        if (os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_DEFAULT))
        {
          v37 = v36;
          v38 = (objc_class *)objc_opt_class();
          v39 = NSStringFromClass(v38);
          *(_DWORD *)buf = 138412546;
          v52 = v39;
          __int16 v53 = 2048;
          double v54 = v28;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Setting a timer to exit %@ after %f seconds", buf, 0x16u);
        }
        dispatch_time_t v40 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(v28 * 1000000000.0));
        double v41 = sub_100003E44();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        void block[2] = sub_10000B608;
        block[3] = &unk_1000143B8;
        double v46 = v28;
        id v44 = v4;
        long long v45 = self;
        dispatch_after(v40, v41, block);
      }
    }
    [(PowerModesManager *)self saveState];
  }
}

- (void)saveState
{
  uint64_t v3 = sub_100003E44();
  dispatch_assert_queue_V2(v3);

  v21 = +[NSMutableDictionary dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(PowerModesManager *)self powerModes];
  id v4 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v7);
        id v9 = [(PowerModesManager *)self powerModes];
        BOOL v10 = [v9 objectForKeyedSubscript:v8];

        if (v10)
        {
          id v11 = +[NSDate distantFuture];
          if ([v10 getState])
          {
            [v10 getMaxEngagementDuration];
            if (v12 != 0.0)
            {
              [v10 getMaxEngagementDuration];
              uint64_t v13 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");

              id v11 = (void *)v13;
            }
          }
          v26[0] = @"state";
          unsigned __int8 v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 getState]);
          v27[0] = v14;
          v26[1] = @"enabled";
          uint64_t v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 isEnabled]);
          v26[2] = @"exitDate";
          v27[1] = v15;
          v27[2] = v11;
          v16 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];

          objc_super v17 = (objc_class *)objc_opt_class();
          double v18 = NSStringFromClass(v17);
          [v21 setObject:v16 forKeyedSubscript:v18];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v5);
  }

  double v19 = [(PowerModesManager *)self defaults];
  [v19 setValue:v21 forKey:@"modes"];
}

- (void)restoreState
{
  uint64_t v3 = sub_100003E44();
  dispatch_assert_queue_V2(v3);

  id v4 = [(PowerModesManager *)self defaults];
  id v5 = [v4 valueForKey:@"modes"];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      BOOL v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v12 = [(PowerModesManager *)self getModeFromName:v11];
          if (v12)
          {
            uint64_t v13 = [v5 objectForKeyedSubscript:v11];
            [v12 restoreState:v13];

            if ([v12 getState]) {
              [(PowerModesManager *)self enterMode:v12];
            }
            else {
              [(PowerModesManager *)self exitMode:v12];
            }
          }
        }
        BOOL v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)clearState
{
  uint64_t v3 = qword_10001BF08;
  if (os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing state after a reboot", v6, 2u);
  }
  id v4 = sub_100003E44();
  dispatch_assert_queue_V2(v4);

  id v5 = [(PowerModesManager *)self defaults];
  [v5 removeObjectForKey:@"modes"];
}

- (id)getSavedExitDate:(id)a3
{
  id v4 = a3;
  id v5 = [(PowerModesManager *)self defaults];
  uint64_t v6 = [v5 valueForKey:@"modes"];

  id v7 = [v6 objectForKeyedSubscript:v4];

  id v8 = [v7 objectForKeyedSubscript:@"exitDate"];

  return v8;
}

- (id)getModeFromName:(id)a3
{
  id v4 = a3;
  id v5 = [(PowerModesManager *)self powerModes];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)disablePowerMode:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100003E44();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10000BDF0;
  block[3] = &unk_1000147E8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)enablePowerMode:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100003E44();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10000BF70;
  block[3] = &unk_1000147E8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)updatePowerMode:(id)a3 withState:(BOOL)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_100003E44();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  _DWORD v13[2] = sub_10000C0F4;
  v13[3] = &unk_100014810;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)updateAllowOnCharger:(id)a3 withState:(BOOL)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_100003E44();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  _DWORD v13[2] = sub_10000C36C;
  v13[3] = &unk_100014810;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)updateEntryDelay:(id)a3 withDelay:(double)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_100003E44();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  _DWORD v13[2] = sub_10000C4DC;
  v13[3] = &unk_100014838;
  v13[4] = self;
  id v14 = v8;
  double v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)updateMaxEngagementDuration:(id)a3 withDuration:(double)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_100003E44();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  _DWORD v13[2] = sub_10000C644;
  v13[3] = &unk_100014838;
  v13[4] = self;
  id v14 = v8;
  double v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)setPowerModes:(id)a3
{
}

- (void)setDeviceContext:(id)a3
{
}

- (void)setResourceManager:(id)a3
{
}

- (PowerModesService)powerModesService
{
  return self->_powerModesService;
}

- (void)setPowerModesService:(id)a3
{
}

- (ChargeDurationPredictor)chargingPredictor
{
  return self->_chargingPredictor;
}

- (void)setChargingPredictor:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (void)setOverridePresent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridePresent, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_chargingPredictor, 0);
  objc_storeStrong((id *)&self->_powerModesService, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);

  objc_storeStrong((id *)&self->_powerModes, 0);
}

@end