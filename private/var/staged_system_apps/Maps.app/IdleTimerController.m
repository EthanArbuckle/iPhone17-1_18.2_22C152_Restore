@interface IdleTimerController
- (BOOL)_idleTimerReasonPermittedInBackground:(unint64_t)a3;
- (BOOL)_shouldIgnoreScene:(id)a3;
- (IdleTimerController)init;
- (NSString)description;
- (id)_assertionReasonString;
- (id)_reasonString;
- (id)_summaryString;
- (void)_asyncUpdateForApplicationState:(BOOL)a3;
- (void)_releaseIdleTimerAssertion;
- (void)_setDesiredIdleTimerState:(unint64_t)a3 forReason:(unint64_t)a4;
- (void)_setIdleTimerDisabled:(BOOL)a3;
- (void)_setMonitoringBattery:(BOOL)a3;
- (void)_startObservingApplicationState;
- (void)_syncUpdateForApplicationState:(BOOL)a3;
- (void)_takeIdleTimerAssertion;
- (void)_updateApplicableStates;
- (void)_updateBatteryMonitoring;
- (void)_updateForApplicationState:(BOOL)a3;
- (void)_updateIdleTimer;
- (void)batteryMonitorTokenWitnessedChangeInBatteryState:(id)a3;
- (void)dealloc;
- (void)setDesiredIdleTimerState:(unint64_t)a3 forReason:(unint64_t)a4;
@end

@implementation IdleTimerController

- (IdleTimerController)init
{
  v15.receiver = self;
  v15.super_class = (Class)IdleTimerController;
  v2 = [(IdleTimerController *)&v15 init];
  if (v2)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 1;
    if (+[NSThread isMainThread])
    {
      unsigned __int8 v3 = +[UIApplication _maps_isAnySceneForegroundForRole:UIWindowSceneSessionRoleApplication];
      *((unsigned char *)v12 + 24) = v3;
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10063C820;
      block[3] = &unk_1012E9390;
      block[4] = &v11;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
      unsigned __int8 v3 = *((unsigned char *)v12 + 24);
    }
    v2->_isForeground = v3;
    uint64_t v4 = +[NSMutableDictionary dictionary];
    states = v2->_states;
    v2->_states = (NSMutableDictionary *)v4;

    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.Maps.IdleTimer", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    [(IdleTimerController *)v2 _startObservingApplicationState];
    _Block_object_dispose(&v11, 8);
  }
  return v2;
}

- (void)dealloc
{
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self->_backgroundingObserverToken];

  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self->_foregroundingObserverToken];

  v5.receiver = self;
  v5.super_class = (Class)IdleTimerController;
  [(IdleTimerController *)&v5 dealloc];
}

- (void)setDesiredIdleTimerState:(unint64_t)a3 forReason:(unint64_t)a4
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10063C9B0;
  v8[3] = &unk_1012E8268;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  v9[2] = (id)a4;
  dispatch_async(queue, v8);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)_setDesiredIdleTimerState:(unint64_t)a3 forReason:(unint64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  states = self->_states;
  uint64_t v8 = +[NSNumber numberWithUnsignedInteger:a4];
  id v13 = [(NSMutableDictionary *)states objectForKeyedSubscript:v8];

  v9 = +[NSNumber numberWithUnsignedInteger:a3];
  LOBYTE(v8) = [v13 isEqual:v9];

  if ((v8 & 1) == 0)
  {
    v10 = +[NSNumber numberWithUnsignedInteger:a3];
    uint64_t v11 = self->_states;
    v12 = +[NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];

    [(IdleTimerController *)self _updateApplicableStates];
    [(IdleTimerController *)self _updateBatteryMonitoring];
    [(IdleTimerController *)self _updateIdleTimer];
  }
}

- (NSString)description
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_100103E2C;
  id v13 = sub_1001047A0;
  id v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10063CC68;
  block[3] = &unk_1012E73F0;
  block[4] = self;
  void block[5] = &v9;
  dispatch_sync(queue, block);
  uint64_t v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = +[NSString stringWithFormat:@"<%@:%p %@>", v5, self, v10[5]];

  _Block_object_dispose(&v9, 8);

  return (NSString *)v6;
}

- (id)_summaryString
{
  if ([(NSMutableDictionary *)self->_states count])
  {
    id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableDictionary count](self->_states, "count")];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v4 = [(NSMutableDictionary *)self->_states allKeys];
    objc_super v5 = [v4 sortedArrayUsingSelector:"compare:"];

    id obj = v5;
    id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v11 = [(NSMutableDictionary *)self->_states objectForKeyedSubscript:v10];
          id v12 = [v10 unsignedIntegerValue];
          CFStringRef v13 = @"Unknown";
          if ((unint64_t)v12 <= 4) {
            CFStringRef v13 = *(&off_1012F2AD8 + (void)v12);
          }
          id v14 = [v11 unsignedIntegerValue];
          CFStringRef v15 = @"Unknown";
          if ((unint64_t)v14 <= 2) {
            CFStringRef v15 = *(&off_1012F2B00 + (void)v14);
          }
          v16 = +[NSString stringWithFormat:@"%@:%@", v13, v15];
          v17 = [(NSMutableDictionary *)self->_applicableStates objectForKey:v10];

          if (!v17)
          {
            uint64_t v18 = [v16 stringByAppendingString:@"(Ignored)"];

            v16 = (void *)v18;
          }
          [v3 addObject:v16];
        }
        id v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v7);
    }

    v19 = [v3 componentsJoinedByString:@","];
  }
  else
  {
    v19 = @"-";
  }

  return v19;
}

- (void)_updateApplicableStates
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  states = self->_states;
  if (self->_isForeground)
  {
    uint64_t v4 = (NSMutableDictionary *)[(NSMutableDictionary *)states copy];
    applicableStates = self->_applicableStates;
    self->_applicableStates = v4;
  }
  else
  {
    id v6 = [(NSMutableDictionary *)states mutableCopy];
    id v7 = self->_states;
    CFStringRef v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    CFStringRef v15 = sub_10063D084;
    v16 = &unk_1012F2A40;
    v17 = self;
    id v18 = v6;
    id v8 = v6;
    [(NSMutableDictionary *)v7 enumerateKeysAndObjectsUsingBlock:&v13];
    uint64_t v9 = (NSMutableDictionary *)[v8 copy:v13, v14, v15, v16, v17];
    v10 = self->_applicableStates;
    self->_applicableStates = v9;
  }
  uint64_t v11 = sub_100578094();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [(IdleTimerController *)self _summaryString];
    *(_DWORD *)buf = 138412290;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Updated applicable states: %@", buf, 0xCu);
  }
}

- (void)_setMonitoringBattery:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_monitoringBattery != v3)
  {
    self->_monitoringBattery = v3;
    batteryToken = self->_batteryToken;
    if (v3)
    {
      if (!batteryToken)
      {
        id v6 = sub_100578094();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Start monitoring battery", buf, 2u);
        }

        id v7 = +[BatteryMonitorController sharedInstance];
        id v8 = [v7 beginMonitoringBattery];
        uint64_t v9 = self->_batteryToken;
        self->_batteryToken = v8;

        [(BatteryMonitorToken *)self->_batteryToken setDelegate:self];
      }
    }
    else if (batteryToken)
    {
      v10 = sub_100578094();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Stop monitoring battery", v12, 2u);
      }

      uint64_t v11 = self->_batteryToken;
      self->_batteryToken = 0;
    }
  }
}

- (void)_updateBatteryMonitoring
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  applicableStates = self->_applicableStates;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10063D2DC;
  v4[3] = &unk_1012F2A68;
  v4[4] = &v5;
  [(NSMutableDictionary *)applicableStates enumerateKeysAndObjectsUsingBlock:v4];
  [(IdleTimerController *)self _setMonitoringBattery:*((unsigned __int8 *)v6 + 24)];
  _Block_object_dispose(&v5, 8);
}

- (void)_updateIdleTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  applicableStates = self->_applicableStates;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10063D448;
  v5[3] = &unk_1012F2A90;
  v5[4] = &v10;
  v5[5] = &v6;
  [(NSMutableDictionary *)applicableStates enumerateKeysAndObjectsUsingBlock:v5];
  if (*((unsigned char *)v11 + 24))
  {
    uint64_t v4 = 1;
  }
  else if (*((unsigned char *)v7 + 24))
  {
    uint64_t v4 = (uint64_t)[(BatteryMonitorToken *)self->_batteryToken batteryIsChargingOrFull];
  }
  else
  {
    uint64_t v4 = 0;
  }
  [(IdleTimerController *)self _setIdleTimerDisabled:v4];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

- (void)_setIdleTimerDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v3)
  {
    [(IdleTimerController *)self _takeIdleTimerAssertion];
  }
  else
  {
    [(IdleTimerController *)self _releaseIdleTimerAssertion];
  }
}

- (void)_takeIdleTimerAssertion
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_idleTimerAssertion)
  {
    BOOL v3 = sub_100578094();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Taking assertion to disable idle timer", buf, 2u);
    }

    uint64_t v4 = +[ITIdleTimerState sharedInstance];
    uint64_t v5 = [(IdleTimerController *)self _assertionReasonString];
    id v10 = 0;
    uint64_t v6 = (BSInvalidatable *)[v4 newAssertionToDisableIdleTimerForReason:v5 error:&v10];
    id v7 = v10;
    idleTimerAssertion = self->_idleTimerAssertion;
    self->_idleTimerAssertion = v6;

    if (!self->_idleTimerAssertion)
    {
      char v9 = sub_100578094();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error acquiring idle timer assertion: %@", buf, 0xCu);
      }
    }
  }
}

- (void)_releaseIdleTimerAssertion
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_idleTimerAssertion)
  {
    BOOL v3 = sub_100578094();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Releasing idle timer assertion", v5, 2u);
    }

    [(BSInvalidatable *)self->_idleTimerAssertion invalidate];
    idleTimerAssertion = self->_idleTimerAssertion;
    self->_idleTimerAssertion = 0;
  }
}

- (BOOL)_idleTimerReasonPermittedInBackground:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_startObservingApplicationState
{
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10063D918;
  v15[3] = &unk_1012F2AB8;
  v15[4] = self;
  objc_copyWeak(&v16, &location);
  BOOL v3 = objc_retainBlock(v15);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10063D9B0;
  v13[3] = &unk_1012F2AB8;
  v13[4] = self;
  objc_copyWeak(&v14, &location);
  uint64_t v4 = objc_retainBlock(v13);
  uint64_t v5 = +[NSNotificationCenter defaultCenter];
  uint64_t v6 = +[NSOperationQueue mainQueue];
  id v7 = [v5 addObserverForName:UISceneDidEnterBackgroundNotification object:0 queue:v6 usingBlock:v4];
  id backgroundingObserverToken = self->_backgroundingObserverToken;
  self->_id backgroundingObserverToken = v7;

  char v9 = +[NSNotificationCenter defaultCenter];
  id v10 = +[NSOperationQueue mainQueue];
  uint64_t v11 = [v9 addObserverForName:UISceneWillEnterForegroundNotification object:0 queue:v10 usingBlock:v3];
  id foregroundingObserverToken = self->_foregroundingObserverToken;
  self->_id foregroundingObserverToken = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldIgnoreScene:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 session];
  uint64_t v5 = [v4 role];
  if ([v5 isEqualToString:UIWindowSceneSessionRoleApplication]) {
    BOOL v6 = +[UIApplication _maps_shouldIgnoreActivationStateForScene:v3];
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)_syncUpdateForApplicationState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sub_100578094();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = "background";
    if (v3) {
      BOOL v6 = "foreground";
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Update timer (sync), main scenes are now %s", buf, 0xCu);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10063DC10;
  v8[3] = &unk_1012E6300;
  void v8[4] = self;
  BOOL v9 = v3;
  dispatch_sync(queue, v8);
}

- (void)_asyncUpdateForApplicationState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sub_100578094();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = "background";
    if (v3) {
      BOOL v6 = "foreground";
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Update timer (async), main scenes are now %s", buf, 0xCu);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10063DD48;
  v8[3] = &unk_1012E6300;
  void v8[4] = self;
  BOOL v9 = v3;
  dispatch_async(queue, v8);
}

- (void)_updateForApplicationState:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_isForeground = a3;
  [(IdleTimerController *)self _updateApplicableStates];
  [(IdleTimerController *)self _updateBatteryMonitoring];

  [(IdleTimerController *)self _updateIdleTimer];
}

- (id)_assertionReasonString
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = [(IdleTimerController *)self _reasonString];
  uint64_t v4 = +[NSString stringWithFormat:@"Maps {%@}", v3];

  return v4;
}

- (id)_reasonString
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableDictionary *)self->_applicableStates count])
  {
    id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableDictionary count](self->_states, "count")];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v4 = [(NSMutableDictionary *)self->_applicableStates allKeys];
    uint64_t v5 = [v4 sortedArrayUsingSelector:"compare:"];

    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v11 = [(NSMutableDictionary *)self->_applicableStates objectForKeyedSubscript:v10];
          id v12 = [v10 unsignedIntegerValue];
          CFStringRef v13 = @"Unknown";
          if ((unint64_t)v12 <= 4) {
            CFStringRef v13 = *(&off_1012F2AD8 + (void)v12);
          }
          id v14 = [v11 unsignedIntegerValue];
          CFStringRef v15 = @"Unknown";
          if ((unint64_t)v14 <= 2) {
            CFStringRef v15 = *(&off_1012F2B00 + (void)v14);
          }
          id v16 = +[NSString stringWithFormat:@"%@:%@", v13, v15];
          [v3 addObject:v16];
        }
        id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    v17 = [v3 componentsJoinedByString:@","];
  }
  else
  {
    v17 = @"-";
  }

  return v17;
}

- (void)batteryMonitorTokenWitnessedChangeInBatteryState:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10063E0D0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backgroundingObserverToken, 0);
  objc_storeStrong(&self->_foregroundingObserverToken, 0);
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_batteryToken, 0);
  objc_storeStrong((id *)&self->_applicableStates, 0);

  objc_storeStrong((id *)&self->_states, 0);
}

@end