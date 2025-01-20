@interface AdvertisingIdentifierManager
+ (id)HMACWithKey:(id)a3 data:(id)a4;
+ (id)HMACWithSeed:(id)a3 timeSlice:(unint64_t)a4;
+ (unint64_t)computeCurrentTimeSlice;
- (AbstractTimer)rollingTimer;
- (AdvertisingIdentifierManager)initWithDelegate:(id)a3 seed:(id)a4;
- (AdvertisingIdentifierManagerDelegate)delegate;
- (BOOL)invalidated;
- (NSData)advertisingIdentifier;
- (NSUUID)seed;
- (int)significantTimeChangeNotifyToken;
- (unint64_t)currentTimeSlice;
- (void)dealloc;
- (void)invalidate;
- (void)rollingTimerFired;
- (void)scheduleRollingTimer;
- (void)setAdvertisingIdentifier:(id)a3;
- (void)setCurrentTimeSlice:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setRollingTimer:(id)a3;
- (void)setSeed:(id)a3;
- (void)setSignificantTimeChangeNotifyToken:(int)a3;
- (void)significantTimeChangeHandler;
- (void)updateAdvertisingIdentifier;
@end

@implementation AdvertisingIdentifierManager

- (AdvertisingIdentifierManager)initWithDelegate:(id)a3 seed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AdvertisingIdentifierManager;
  v8 = [(AdvertisingIdentifierManager *)&v13 init];
  if (v8)
  {
    v9 = (void *)qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = [v7 UUIDString];
      *(_DWORD *)buf = 134218242;
      v15 = v8;
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "AdvertisingIdentifierManager --- Initializing (%p); Seed: (%@)",
        buf,
        0x16u);
    }
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_seed, a4);
    v8->_significantTimeChangeNotifyToken = -1;
  }

  return v8;
}

- (void)dealloc
{
  if (!self->_invalidated) {
    [(AdvertisingIdentifierManager *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)AdvertisingIdentifierManager;
  [(AdvertisingIdentifierManager *)&v3 dealloc];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    objc_super v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AdvertisingIdentifierManager --- Invalidating (%p)", (uint8_t *)&v11, 0xCu);
    }
    self->_invalidated = 1;
    advertisingIdentifier = self->_advertisingIdentifier;
    self->_advertisingIdentifier = 0;

    self->_currentTimeSlice = 0;
    rollingTimer = self->_rollingTimer;
    if (rollingTimer)
    {
      [(AbstractTimer *)rollingTimer invalidate];
      id v6 = self->_rollingTimer;
      self->_rollingTimer = 0;
    }
    int significantTimeChangeNotifyToken = self->_significantTimeChangeNotifyToken;
    if (significantTimeChangeNotifyToken != -1)
    {
      uint32_t v8 = notify_cancel(significantTimeChangeNotifyToken);
      if (v8)
      {
        uint32_t v9 = v8;
        v10 = qword_100021A50;
        if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 67109120;
          LODWORD(v12) = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "AdvertisingIdentifierManager --- Failed to unregister observer for significiant time change notification with status: (%u)", (uint8_t *)&v11, 8u);
        }
      }
      self->_int significantTimeChangeNotifyToken = -1;
    }
  }
}

- (NSData)advertisingIdentifier
{
  if (self->_invalidated)
  {
    objc_super v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidated", v6, 2u);
    }
  }
  advertisingIdentifier = self->_advertisingIdentifier;
  if (!advertisingIdentifier)
  {
    [(AdvertisingIdentifierManager *)self updateAdvertisingIdentifier];
    advertisingIdentifier = self->_advertisingIdentifier;
  }

  return advertisingIdentifier;
}

+ (unint64_t)computeCurrentTimeSlice
{
  +[NSDate timeIntervalSinceReferenceDate];
  return (unint64_t)(v2 / 900.0);
}

- (void)updateAdvertisingIdentifier
{
  id v3 = [(id)objc_opt_class() computeCurrentTimeSlice];
  unint64_t v4 = (unint64_t)v3;
  if (!self->_advertisingIdentifier || self->_currentTimeSlice != v3)
  {
    v5 = [(id)objc_opt_class() HMACWithSeed:self->_seed timeSlice:v3];
    advertisingIdentifier = self->_advertisingIdentifier;
    self->_advertisingIdentifier = v5;

    self->_currentTimeSlice = v4;
    id v7 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v8 = self->_advertisingIdentifier;
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      __int16 v19 = 2048;
      unint64_t v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AdvertisingIdentifierManager --- Computed new identifier: (%@) for time slice: (%llu)", buf, 0x16u);
    }
  }
  if (!self->_rollingTimer) {
    [(AdvertisingIdentifierManager *)self scheduleRollingTimer];
  }
  if (self->_significantTimeChangeNotifyToken == -1)
  {
    objc_initWeak((id *)buf, self);
    uint32_t v9 = +[MagicSwitchEnabler sharedInstance];
    v10 = [v9 workQueue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000E940;
    handler[3] = &unk_100018720;
    objc_copyWeak(&v14, (id *)buf);
    uint32_t v11 = notify_register_dispatch("SignificantTimeChangeNotification", &self->_significantTimeChangeNotifyToken, v10, handler);

    if (v11)
    {
      v12 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 67109120;
        uint32_t v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AdvertisingIdentifierManager --- Failed to register observer for significiant time change notification with status: (%u)", v15, 8u);
      }
    }
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

- (void)significantTimeChangeHandler
{
  if (self->_invalidated)
  {
    id v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidated", buf, 2u);
    }
  }
  if (self->_currentTimeSlice
    && [(id)objc_opt_class() computeCurrentTimeSlice] != self->_currentTimeSlice)
  {
    unint64_t v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint32_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AdvertisingIdentifierManager --- Invalidating current advertising identifier due to significant time change", v9, 2u);
    }
    advertisingIdentifier = self->_advertisingIdentifier;
    self->_advertisingIdentifier = 0;

    rollingTimer = self->_rollingTimer;
    if (rollingTimer)
    {
      [(AbstractTimer *)rollingTimer invalidate];
      id v7 = self->_rollingTimer;
      self->_rollingTimer = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained shouldRollAdvertisingIdentifier];
  }
}

- (void)scheduleRollingTimer
{
  if (self->_invalidated)
  {
    id v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidated", (uint8_t *)buf, 2u);
    }
  }
  if (self->_rollingTimer)
  {
    unint64_t v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Timer already scheduled", (uint8_t *)buf, 2u);
    }
  }
  objc_initWeak(buf, self);
  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  unint64_t currentTimeSlice = self->_currentTimeSlice;
  uint32_t v8 = +[NSString stringWithUTF8String:"com.apple.magicswitchd.advIdRolling"];
  uint64_t v9 = 900 * currentTimeSlice + 900;
  if ((double)(unint64_t)v9 - v6 >= 0.0) {
    double v10 = (double)(unint64_t)v9 - v6;
  }
  else {
    double v10 = 0.0;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000EC78;
  v13[3] = &unk_1000184D0;
  objc_copyWeak(&v14, buf);
  uint32_t v11 = +[TimerFactory timerWithIdentifier:v8 delay:1 gracePeriod:v13 waking:v10 handlerBlock:0.0];
  rollingTimer = self->_rollingTimer;
  self->_rollingTimer = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
}

- (void)rollingTimerFired
{
  if (!self->_rollingTimer)
  {
    id v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Timer not scheduled", buf, 2u);
    }
  }
  unint64_t v4 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AdvertisingIdentifierManager --- Rolling timer fired!", v8, 2u);
  }
  rollingTimer = self->_rollingTimer;
  self->_rollingTimer = 0;

  advertisingIdentifier = self->_advertisingIdentifier;
  self->_advertisingIdentifier = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shouldRollAdvertisingIdentifier];
}

+ (id)HMACWithSeed:(id)a3 timeSlice:(unint64_t)a4
{
  unint64_t v10 = a4;
  v11[0] = 0;
  v11[1] = 0;
  [a3 getUUIDBytes:v11];
  double v5 = +[NSData dataWithBytes:v11 length:16];
  double v6 = +[NSData dataWithBytes:&v10 length:8];
  id v7 = 0;
  if (v5) {
    BOOL v8 = v10 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    id v7 = [a1 HMACWithKey:v5 data:v6];
  }

  return v7;
}

+ (id)HMACWithKey:(id)a3 data:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = [v7 bytes];
  id v9 = [v7 length];

  id v10 = v6;
  id v11 = [v10 bytes];
  id v12 = [v10 length];

  CCHmac(2u, v8, (size_t)v9, v11, (size_t)v12, macOut);
  objc_super v13 = +[NSData dataWithBytes:macOut length:32];

  return v13;
}

- (NSUUID)seed
{
  return self->_seed;
}

- (void)setSeed:(id)a3
{
}

- (void)setAdvertisingIdentifier:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (AdvertisingIdentifierManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AdvertisingIdentifierManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AbstractTimer)rollingTimer
{
  return self->_rollingTimer;
}

- (void)setRollingTimer:(id)a3
{
}

- (unint64_t)currentTimeSlice
{
  return self->_currentTimeSlice;
}

- (void)setCurrentTimeSlice:(unint64_t)a3
{
  self->_unint64_t currentTimeSlice = a3;
}

- (int)significantTimeChangeNotifyToken
{
  return self->_significantTimeChangeNotifyToken;
}

- (void)setSignificantTimeChangeNotifyToken:(int)a3
{
  self->_int significantTimeChangeNotifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rollingTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_advertisingIdentifier, 0);

  objc_storeStrong((id *)&self->_seed, 0);
}

@end