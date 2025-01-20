@interface CSDOrientationMonitor
- (BKSAccelerometer)accelerometer;
- (CSDCallCenterObserver)callCenterObserver;
- (CSDOrientationMonitor)init;
- (CSDOrientationMonitor)initWithCallCenterObserver:(id)a3;
- (int64_t)currentOrientation;
- (void)_updateCurrentOrientationValue;
- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4;
- (void)callCenterObserver:(id)a3 callChanged:(id)a4;
- (void)dealloc;
- (void)setCallCenterObserver:(id)a3;
- (void)setCurrentOrientation:(int64_t)a3;
- (void)setOrientationEventsEnabled:(BOOL)a3;
@end

@implementation CSDOrientationMonitor

- (CSDOrientationMonitor)init
{
  v3 = objc_alloc_init(CSDCallCenterObserver);
  v4 = [(CSDOrientationMonitor *)self initWithCallCenterObserver:v3];

  return v4;
}

- (CSDOrientationMonitor)initWithCallCenterObserver:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSDOrientationMonitor;
  v6 = [(CSDOrientationMonitor *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callCenterObserver, a3);
    [(CSDCallCenterObserver *)v7->_callCenterObserver setTriggers:1];
    [(CSDCallCenterObserver *)v7->_callCenterObserver setDelegate:v7];
    v8 = (BKSAccelerometer *)objc_alloc_init((Class)BKSAccelerometer);
    accelerometer = v7->_accelerometer;
    v7->_accelerometer = v8;

    [(BKSAccelerometer *)v7->_accelerometer setDelegate:v7];
    [(CSDOrientationMonitor *)v7 _updateCurrentOrientationValue];
  }

  return v7;
}

- (void)dealloc
{
  [(BKSAccelerometer *)self->_accelerometer setOrientationEventsEnabled:0];
  [(BKSAccelerometer *)self->_accelerometer setPassiveOrientationEvents:1];
  [(BKSAccelerometer *)self->_accelerometer setDelegate:0];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSDOrientationMonitor;
  [(CSDOrientationMonitor *)&v4 dealloc];
}

- (void)_updateCurrentOrientationValue
{
  id v3 = [(CSDOrientationMonitor *)self accelerometer];
  -[CSDOrientationMonitor setCurrentOrientation:](self, "setCurrentOrientation:", [v3 currentDeviceOrientation]);
}

- (void)setOrientationEventsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSDOrientationMonitor *)self accelerometer];
  [v5 setOrientationEventsEnabled:v3];

  v6 = [(CSDOrientationMonitor *)self accelerometer];
  [v6 setPassiveOrientationEvents:v3 ^ 1];

  v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "enabled: %d", (uint8_t *)v8, 8u);
  }
}

- (void)callCenterObserver:(id)a3 callChanged:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [v6 provider];
    if (([v7 isSystemProvider] & 1) == 0 && objc_msgSend(v6, "isVideo")) {
      [v6 callStatus];
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = [(CSDOrientationMonitor *)self callCenterObserver];
  v9 = [v8 callContainer];
  v10 = [v9 currentVideoCalls];

  uint64_t v11 = (uint64_t)[v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v15 = [v14 provider];
        if ([v15 isSystemProvider])
        {
        }
        else
        {
          unsigned int v16 = [v14 callStatus];

          if (v16 == 1)
          {
            uint64_t v11 = 1;
            goto LABEL_18;
          }
        }
      }
      uint64_t v11 = (uint64_t)[v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  [(CSDOrientationMonitor *)self setOrientationEventsEnabled:v11];
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  [(CSDOrientationMonitor *)self _updateCurrentOrientationValue];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(CSDOrientationMonitor *)self callCenterObserver];
  v7 = [v6 callContainer];
  v8 = [v7 currentVideoCalls];

  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v19;
    *(void *)&long long v10 = 134217984;
    long long v17 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "provider", v17);
        if ([v15 isSystemProvider]) {
          goto LABEL_7;
        }
        unsigned int v16 = [v14 callStatus];

        if (v16 == 1)
        {
          v15 = sub_100008DCC();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            int64_t v23 = a4;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "accelerometer orientation changed to %ld", buf, 0xCu);
          }
LABEL_7:

          continue;
        }
      }
      id v11 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v11);
  }
}

- (BKSAccelerometer)accelerometer
{
  return self->_accelerometer;
}

- (CSDCallCenterObserver)callCenterObserver
{
  return self->_callCenterObserver;
}

- (void)setCallCenterObserver:(id)a3
{
}

- (int64_t)currentOrientation
{
  return self->_currentOrientation;
}

- (void)setCurrentOrientation:(int64_t)a3
{
  self->_currentOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callCenterObserver, 0);

  objc_storeStrong((id *)&self->_accelerometer, 0);
}

@end