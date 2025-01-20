@interface RMAudioAccessoryManagerSharedInternal
+ (id)sharedInternal;
- (BOOL)isDeviceMotionActive;
- (BOOL)isTempestActive;
- (BOOL)motionActivityActive;
- (BOOL)requested50HzHeadphoneMotion;
- (BOOL)shouldActivateActivityUpdates;
- (BOOL)shouldActivateDeviceMotionUpdates;
- (BOOL)shouldActivateStatusUpdates;
- (BOOL)statusUpdatesActive;
- (CMAudioAccessoryManager)audioAccessoryManager;
- (NSHashTable)managers;
- (NSString)activeAudioRouteDeviceID;
- (NSUserDefaults)cmDefaults;
- (RMAudioAccessoryManagerSharedInternal)init;
- (double)lastActivityPrintTime;
- (double)lastActivitySampleTime;
- (double)lastDMPrintTime;
- (double)lastDMSampleTime;
- (int64_t)lastDeviceStatus;
- (unint64_t)activitySampleRate;
- (unint64_t)activitySamplesPerSecond;
- (unint64_t)dmSampleRate;
- (unint64_t)dmSamplesPerSecond;
- (void)onActiveAudioRouteChanged:(id)a3;
- (void)postAudioRouteChangeCompleted;
- (void)setActiveAudioRouteDeviceID:(id)a3;
- (void)setActivitySampleRate:(unint64_t)a3;
- (void)setActivitySamplesPerSecond:(unint64_t)a3;
- (void)setAudioAccessoryManager:(id)a3;
- (void)setCmDefaults:(id)a3;
- (void)setDeviceMotionActive:(BOOL)a3;
- (void)setDmSampleRate:(unint64_t)a3;
- (void)setDmSamplesPerSecond:(unint64_t)a3;
- (void)setLastActivityPrintTime:(double)a3;
- (void)setLastActivitySampleTime:(double)a3;
- (void)setLastDMPrintTime:(double)a3;
- (void)setLastDMSampleTime:(double)a3;
- (void)setLastDeviceStatus:(int64_t)a3;
- (void)setManagers:(id)a3;
- (void)setMotionActivityActive:(BOOL)a3;
- (void)setRequested50HzHeadphoneMotion:(BOOL)a3;
- (void)setStatusUpdatesActive:(BOOL)a3;
- (void)setTempestActive:(BOOL)a3;
- (void)startActivityUpdates;
- (void)startDeviceMotionUpdates;
- (void)startMonitoringActiveAudioRoute;
- (void)startOrStopActivityUpdates;
- (void)startOrStopDeviceMotionUpdates;
- (void)startOrStopStatusUpdates;
- (void)startStatusUpdates;
- (void)stopActivityUpdates;
- (void)stopDeviceMotionUpdates;
- (void)stopStatusUpdates;
- (void)updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:(BOOL)a3;
@end

@implementation RMAudioAccessoryManagerSharedInternal

+ (id)sharedInternal
{
  if (qword_10002C990 != -1) {
    dispatch_once(&qword_10002C990, &stru_100024C58);
  }
  v2 = (void *)qword_10002C988;

  return v2;
}

- (RMAudioAccessoryManagerSharedInternal)init
{
  v7.receiver = self;
  v7.super_class = (Class)RMAudioAccessoryManagerSharedInternal;
  v2 = [(RMAudioAccessoryManagerSharedInternal *)&v7 init];
  if (v2)
  {
    v3 = +[NSHashTable weakObjectsHashTable];
    [(RMAudioAccessoryManagerSharedInternal *)v2 setManagers:v3];

    v4 = objc_opt_new();
    [(RMAudioAccessoryManagerSharedInternal *)v2 setAudioAccessoryManager:v4];

    [(RMAudioAccessoryManagerSharedInternal *)v2 setDeviceMotionActive:0];
    [(RMAudioAccessoryManagerSharedInternal *)v2 setLastDeviceStatus:1];
    [(RMAudioAccessoryManagerSharedInternal *)v2 setStatusUpdatesActive:0];
    [(RMAudioAccessoryManagerSharedInternal *)v2 setMotionActivityActive:0];
    [(RMAudioAccessoryManagerSharedInternal *)v2 setTempestActive:0];
    [(RMAudioAccessoryManagerSharedInternal *)v2 setActiveAudioRouteDeviceID:0];
    [(RMAudioAccessoryManagerSharedInternal *)v2 startMonitoringActiveAudioRoute];
    id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.CoreMotion"];
    [(RMAudioAccessoryManagerSharedInternal *)v2 setCmDefaults:v5];
  }
  return v2;
}

- (BOOL)shouldActivateStatusUpdates
{
  if (+[CMAudioAccessoryManager _isAvailable])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = [(RMAudioAccessoryManagerSharedInternal *)self managers];
    id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          objc_super v7 = [*(id *)(*((void *)&v9 + 1) + 8 * i) deviceMotionStatusHandler];

          if (v7)
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }
        id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)startOrStopStatusUpdates
{
  if ([(RMAudioAccessoryManagerSharedInternal *)self shouldActivateStatusUpdates])
  {
    [(RMAudioAccessoryManagerSharedInternal *)self startStatusUpdates];
  }
  else
  {
    [(RMAudioAccessoryManagerSharedInternal *)self stopStatusUpdates];
  }
}

- (void)startStatusUpdates
{
  objc_initWeak(&location, self);
  if (![(RMAudioAccessoryManagerSharedInternal *)self statusUpdatesActive])
  {
    v3 = [(RMAudioAccessoryManagerSharedInternal *)self audioAccessoryManager];
    id v4 = +[NSOperationQueue mainQueue];
    uint64_t v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    objc_super v7 = sub_100009304;
    v8 = &unk_100024C80;
    objc_copyWeak(&v9, &location);
    [v3 _startAudioAccessoryDeviceMotionStatusUpdatesToQueue:v4 withHandler:&v5];

    -[RMAudioAccessoryManagerSharedInternal setStatusUpdatesActive:](self, "setStatusUpdatesActive:", 1, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
  }
  objc_destroyWeak(&location);
}

- (void)stopStatusUpdates
{
  v3 = [(RMAudioAccessoryManagerSharedInternal *)self audioAccessoryManager];
  [v3 _stopAudioAccessoryDeviceMotionStatusUpdates];

  [(RMAudioAccessoryManagerSharedInternal *)self setLastDeviceStatus:1];

  [(RMAudioAccessoryManagerSharedInternal *)self setStatusUpdatesActive:0];
}

- (BOOL)shouldActivateDeviceMotionUpdates
{
  if (+[CMAudioAccessoryManager _isAvailable])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = [(RMAudioAccessoryManagerSharedInternal *)self managers];
    id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          objc_super v7 = [*(id *)(*((void *)&v9 + 1) + 8 * i) deviceMotionHandler];

          if (v7)
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }
        id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)startOrStopDeviceMotionUpdates
{
  if ([(RMAudioAccessoryManagerSharedInternal *)self shouldActivateDeviceMotionUpdates])
  {
    [(RMAudioAccessoryManagerSharedInternal *)self startDeviceMotionUpdates];
  }
  else
  {
    [(RMAudioAccessoryManagerSharedInternal *)self stopDeviceMotionUpdates];
  }
}

- (void)startDeviceMotionUpdates
{
  if (![(RMAudioAccessoryManagerSharedInternal *)self isDeviceMotionActive])
  {
    [(RMAudioAccessoryManagerSharedInternal *)self updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:[(RMAudioAccessoryManagerSharedInternal *)self isTempestActive]];
    [(RMAudioAccessoryManagerSharedInternal *)self setLastDMSampleTime:0.0];
    [(RMAudioAccessoryManagerSharedInternal *)self setLastDMPrintTime:0.0];
    [(RMAudioAccessoryManagerSharedInternal *)self setDmSamplesPerSecond:0];
    v3 = [(RMAudioAccessoryManagerSharedInternal *)self cmDefaults];
    -[RMAudioAccessoryManagerSharedInternal setRequested50HzHeadphoneMotion:](self, "setRequested50HzHeadphoneMotion:", [v3 BOOLForKey:@"CMHeadphoneMotionManagerEnable50HzUpdateInterval"]);

    if ([(RMAudioAccessoryManagerSharedInternal *)self requested50HzHeadphoneMotion])
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_100024CF0);
      }
      id v4 = qword_10002C540;
      double v5 = 0.02;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[RMAudioAccessoryManager] Headphone Motion API set to 50Hz for user study.", (uint8_t *)buf, 2u);
      }
    }
    else
    {
      double v5 = 0.04;
    }
    uint64_t v6 = [(RMAudioAccessoryManagerSharedInternal *)self audioAccessoryManager];
    [v6 _setAudioAccessoryDeviceMotionUpdateInterval:v5];

    objc_initWeak(buf, self);
    objc_super v7 = [(RMAudioAccessoryManagerSharedInternal *)self audioAccessoryManager];
    v8 = +[NSOperationQueue mainQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000098AC;
    v9[3] = &unk_100024CA8;
    objc_copyWeak(&v10, buf);
    [v7 _startAudioAccessoryDeviceMotionUpdatesToQueue:v8 lowLatencyMode:1 withHandler:v9];

    [(RMAudioAccessoryManagerSharedInternal *)self setDeviceMotionActive:1];
    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

- (void)stopDeviceMotionUpdates
{
  if ([(RMAudioAccessoryManagerSharedInternal *)self isDeviceMotionActive])
  {
    v3 = [(RMAudioAccessoryManagerSharedInternal *)self audioAccessoryManager];
    [v3 _stopAudioAccessoryDeviceMotionUpdates];

    [(RMAudioAccessoryManagerSharedInternal *)self setDeviceMotionActive:0];
    [(RMAudioAccessoryManagerSharedInternal *)self setLastDMSampleTime:0.0];
    [(RMAudioAccessoryManagerSharedInternal *)self setLastDMPrintTime:0.0];
    [(RMAudioAccessoryManagerSharedInternal *)self setDmSamplesPerSecond:0];
    [(RMAudioAccessoryManagerSharedInternal *)self setRequested50HzHeadphoneMotion:0];
    [(RMAudioAccessoryManagerSharedInternal *)self startOrStopStatusUpdates];
  }
}

- (BOOL)shouldActivateActivityUpdates
{
  if (+[CMAudioAccessoryManager _isAvailable])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = [(RMAudioAccessoryManagerSharedInternal *)self managers];
    id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          objc_super v7 = [*(id *)(*((void *)&v9 + 1) + 8 * i) activityHandler];

          if (v7)
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }
        id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)startOrStopActivityUpdates
{
  if ([(RMAudioAccessoryManagerSharedInternal *)self shouldActivateActivityUpdates])
  {
    [(RMAudioAccessoryManagerSharedInternal *)self startActivityUpdates];
  }
  else
  {
    [(RMAudioAccessoryManagerSharedInternal *)self stopActivityUpdates];
  }
}

- (void)startActivityUpdates
{
  if (![(RMAudioAccessoryManagerSharedInternal *)self motionActivityActive])
  {
    [(RMAudioAccessoryManagerSharedInternal *)self updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:[(RMAudioAccessoryManagerSharedInternal *)self isTempestActive]];
    v3 = [(RMAudioAccessoryManagerSharedInternal *)self audioAccessoryManager];
    [v3 _setAudioAccessoryActivityUpdateInterval:0.2];

    [(RMAudioAccessoryManagerSharedInternal *)self setLastActivitySampleTime:0.0];
    [(RMAudioAccessoryManagerSharedInternal *)self setLastActivityPrintTime:0.0];
    [(RMAudioAccessoryManagerSharedInternal *)self setActivitySamplesPerSecond:0];
    id v4 = +[RMHeadphoneActivityManager sharedInstance];
    unsigned int v5 = [v4 mslLoggingEnabled];

    if (v5)
    {
      uint64_t v6 = +[RMHeadphoneActivityManager sharedInstance];
      [v6 startMslLogging];
    }
    objc_initWeak(&location, self);
    objc_super v7 = [(RMAudioAccessoryManagerSharedInternal *)self audioAccessoryManager];
    v8 = +[NSOperationQueue mainQueue];
    long long v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    long long v11 = sub_100009FA0;
    long long v12 = &unk_100024CD0;
    objc_copyWeak(&v13, &location);
    [v7 _startAudioAccessoryActivityUpdatesToQueue:v8 withHandler:&v9];

    -[RMAudioAccessoryManagerSharedInternal setMotionActivityActive:](self, "setMotionActivityActive:", 1, v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)stopActivityUpdates
{
  if ([(RMAudioAccessoryManagerSharedInternal *)self motionActivityActive])
  {
    v3 = [(RMAudioAccessoryManagerSharedInternal *)self audioAccessoryManager];
    [v3 _stopAudioAccessoryActivityUpdates];

    id v4 = +[RMHeadphoneActivityManager sharedInstance];
    [v4 stopMslLogging];

    [(RMAudioAccessoryManagerSharedInternal *)self setMotionActivityActive:0];
    [(RMAudioAccessoryManagerSharedInternal *)self setLastActivitySampleTime:0.0];
    [(RMAudioAccessoryManagerSharedInternal *)self setLastActivityPrintTime:0.0];
    [(RMAudioAccessoryManagerSharedInternal *)self setActivitySamplesPerSecond:0];
  }
}

- (void)setTempestActive:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_tempestActive = a3;
  if ([(RMAudioAccessoryManagerSharedInternal *)obj isTempestActive]) {
    [(RMAudioAccessoryManagerSharedInternal *)obj updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:1];
  }
  objc_sync_exit(obj);
}

- (void)startMonitoringActiveAudioRoute
{
  uint64_t v3 = +[AVOutputContext sharedSystemAudioContext];
  id v4 = (void *)qword_10002C998;
  qword_10002C998 = v3;

  unsigned int v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"onActiveAudioRouteChanged:" name:AVOutputContextOutputDeviceDidChangeNotification object:0];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"onActiveAudioRouteChanged:" name:AVOutputContextOutputDevicesDidChangeNotification object:0];
}

- (void)onActiveAudioRouteChanged:(id)a3
{
  id v4 = a3;
  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100024CF0);
  }
  unsigned int v5 = qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[RMAudioAccessoryManager] Active audio route changed", v6, 2u);
  }
  [(RMAudioAccessoryManagerSharedInternal *)self updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:0];
}

- (void)updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (+[CMAudioAccessoryManager _isAvailable])
  {
    [(RMAudioAccessoryManagerSharedInternal *)obj setActiveAudioRouteDeviceID:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v4 = +[AVOutputContext sharedSystemAudioContext];
    unsigned int v5 = [v4 outputDevices];

    id v6 = [v5 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v29;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v8);
          uint64_t v10 = [v9 deviceID];
          unsigned __int8 v11 = [v10 containsString:@"Speaker"];

          if ((v11 & 1) == 0)
          {
            long long v12 = [v9 deviceID];
            id v13 = [v9 modelID];
            unsigned __int8 v14 = +[CMAudioAccessoryManager _selectActiveAudioRouteForDeviceMotionWithBTAddress:v12 modelID:v13];

            if (v14)
            {
              if (qword_10002C538 != -1) {
                dispatch_once(&qword_10002C538, &stru_100024CF0);
              }
              v22 = (id)qword_10002C540;
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                v23 = [v9 name];
                v24 = [v9 deviceID];
                v25 = [v9 modelID];
                *(_DWORD *)buf = 138543875;
                v33 = v23;
                __int16 v34 = 2113;
                v35 = v24;
                __int16 v36 = 2113;
                v37 = v25;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[RMAudioAccessoryManager] relatived sucessfully selected active audio route for device %{public}@ ID %{private}@ model %{private}@", buf, 0x20u);
              }
              v26 = [v9 deviceID];
              [(RMAudioAccessoryManagerSharedInternal *)obj setActiveAudioRouteDeviceID:v26];

              [(RMAudioAccessoryManagerSharedInternal *)obj postAudioRouteChangeCompleted];
              goto LABEL_27;
            }
            if (+[RMPlatformInfo isInternalBuild] && v3)
            {
              if (qword_10002C538 != -1) {
                dispatch_once(&qword_10002C538, &stru_100024CF0);
              }
              v15 = (id)qword_10002C540;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
              {
                v16 = [v9 name];
                v17 = [v9 deviceID];
                v18 = [v9 modelID];
                *(_DWORD *)buf = 138543875;
                v33 = v16;
                __int16 v34 = 2113;
                v35 = v17;
                __int16 v36 = 2113;
                v37 = v18;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "[RMAudioAccessoryManager] relatived failed to select active audio route for device %{public}@ ID %{private}@ model %{private}@", buf, 0x20u);
              }
            }
            else
            {
              if (qword_10002C538 != -1) {
                dispatch_once(&qword_10002C538, &stru_100024CF0);
              }
              v15 = (id)qword_10002C540;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                v19 = [v9 name];
                v20 = [v9 deviceID];
                v21 = [v9 modelID];
                *(_DWORD *)buf = 138543875;
                v33 = v19;
                __int16 v34 = 2113;
                v35 = v20;
                __int16 v36 = 2113;
                v37 = v21;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[RMAudioAccessoryManager] relatived failed to select active audio route for device %{public}@ ID %{private}@ model %{private}@", buf, 0x20u);
              }
            }
          }
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v5 countByEnumeratingWithState:&v28 objects:v38 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    +[CMAudioAccessoryManager _selectActiveAudioRouteForDeviceMotionWithBTAddress:0 modelID:0];
    [(RMAudioAccessoryManagerSharedInternal *)obj postAudioRouteChangeCompleted];
  }
LABEL_27:
  objc_sync_exit(obj);
}

- (void)postAudioRouteChangeCompleted
{
  BOOL v3 = [(RMAudioAccessoryManagerSharedInternal *)self activeAudioRouteDeviceID];

  if (v3)
  {
    CFStringRef v7 = @"RMAudioDeviceChangeCompletedRouteIDKey";
    id v4 = [(RMAudioAccessoryManagerSharedInternal *)self activeAudioRouteDeviceID];
    v8 = v4;
    unsigned int v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  }
  else
  {
    unsigned int v5 = &__NSDictionary0__struct;
  }
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"RMAudioDeviceChangeCompletedNotification" object:0 userInfo:v5];
}

- (NSHashTable)managers
{
  return self->_managers;
}

- (void)setManagers:(id)a3
{
}

- (CMAudioAccessoryManager)audioAccessoryManager
{
  return self->_audioAccessoryManager;
}

- (void)setAudioAccessoryManager:(id)a3
{
}

- (BOOL)isDeviceMotionActive
{
  return self->_deviceMotionActive;
}

- (void)setDeviceMotionActive:(BOOL)a3
{
  self->_deviceMotionActive = a3;
}

- (BOOL)statusUpdatesActive
{
  return self->_statusUpdatesActive;
}

- (void)setStatusUpdatesActive:(BOOL)a3
{
  self->_statusUpdatesActive = a3;
}

- (int64_t)lastDeviceStatus
{
  return self->_lastDeviceStatus;
}

- (void)setLastDeviceStatus:(int64_t)a3
{
  self->_lastDeviceStatus = a3;
}

- (BOOL)motionActivityActive
{
  return self->_motionActivityActive;
}

- (void)setMotionActivityActive:(BOOL)a3
{
  self->_motionActivityActive = a3;
}

- (BOOL)isTempestActive
{
  return self->_tempestActive;
}

- (NSString)activeAudioRouteDeviceID
{
  return self->_activeAudioRouteDeviceID;
}

- (void)setActiveAudioRouteDeviceID:(id)a3
{
}

- (unint64_t)dmSamplesPerSecond
{
  return self->_dmSamplesPerSecond;
}

- (void)setDmSamplesPerSecond:(unint64_t)a3
{
  self->_dmSamplesPerSecond = a3;
}

- (unint64_t)dmSampleRate
{
  return self->_dmSampleRate;
}

- (void)setDmSampleRate:(unint64_t)a3
{
  self->_dmSampleRate = a3;
}

- (double)lastDMSampleTime
{
  return self->_lastDMSampleTime;
}

- (void)setLastDMSampleTime:(double)a3
{
  self->_lastDMSampleTime = a3;
}

- (double)lastDMPrintTime
{
  return self->_lastDMPrintTime;
}

- (void)setLastDMPrintTime:(double)a3
{
  self->_lastDMPrintTime = a3;
}

- (unint64_t)activitySamplesPerSecond
{
  return self->_activitySamplesPerSecond;
}

- (void)setActivitySamplesPerSecond:(unint64_t)a3
{
  self->_activitySamplesPerSecond = a3;
}

- (unint64_t)activitySampleRate
{
  return self->_activitySampleRate;
}

- (void)setActivitySampleRate:(unint64_t)a3
{
  self->_activitySampleRate = a3;
}

- (double)lastActivitySampleTime
{
  return self->_lastActivitySampleTime;
}

- (void)setLastActivitySampleTime:(double)a3
{
  self->_lastActivitySampleTime = a3;
}

- (double)lastActivityPrintTime
{
  return self->_lastActivityPrintTime;
}

- (void)setLastActivityPrintTime:(double)a3
{
  self->_lastActivityPrintTime = a3;
}

- (BOOL)requested50HzHeadphoneMotion
{
  return self->_requested50HzHeadphoneMotion;
}

- (void)setRequested50HzHeadphoneMotion:(BOOL)a3
{
  self->_requested50HzHeadphoneMotion = a3;
}

- (NSUserDefaults)cmDefaults
{
  return self->_cmDefaults;
}

- (void)setCmDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmDefaults, 0);
  objc_storeStrong((id *)&self->_activeAudioRouteDeviceID, 0);
  objc_storeStrong((id *)&self->_audioAccessoryManager, 0);

  objc_storeStrong((id *)&self->_managers, 0);
}

@end