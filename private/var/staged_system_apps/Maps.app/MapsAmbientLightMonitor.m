@interface MapsAmbientLightMonitor
- (BOOL)isBeforeSolarTransit;
- (GCDTimer)darkUpdateTimer;
- (GCDTimer)lightUpdateTimer;
- (MapsAmbientLightMonitor)init;
- (MapsRingBuffer)lightLevels;
- (__IOHIDEventSystemClient)client;
- (double)_calculateAverageSample;
- (int64_t)_computedLightLevel;
- (int64_t)ambientLightLevel;
- (void)_addSample:(double)a3;
- (void)_handleIOHIDEvent:(__IOHIDEvent *)a3;
- (void)_scheduleLightLevelUpdate;
- (void)_setMonitoring:(BOOL)a3;
- (void)initializeWithLightLevel:(int64_t)a3;
- (void)setAmbientLightLevel:(int64_t)a3;
- (void)setClient:(__IOHIDEventSystemClient *)a3;
- (void)setDarkUpdateTimer:(id)a3;
- (void)setIsBeforeSolarTransit:(BOOL)a3;
- (void)setLightLevels:(id)a3;
- (void)setLightUpdateTimer:(id)a3;
@end

@implementation MapsAmbientLightMonitor

- (MapsAmbientLightMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)MapsAmbientLightMonitor;
  v2 = [(MapsBaseLightMonitor *)&v7 init];
  if (v2)
  {
    if (MGGetBoolAnswer()) {
      uint64_t v3 = 5;
    }
    else {
      uint64_t v3 = 1;
    }
    v4 = [[MapsRingBuffer alloc] initWithLength:v3];
    v5 = *(void **)(v2 + 57);
    *(void *)(v2 + 57) = v4;
  }
  return (MapsAmbientLightMonitor *)v2;
}

- (void)setIsBeforeSolarTransit:(BOOL)a3
{
  *(&self->super._monitoring + 1) = a3;
}

- (void)_setMonitoring:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(MapsBaseLightMonitor *)self _isMonitoring];
  v6.receiver = self;
  v6.super_class = (Class)MapsAmbientLightMonitor;
  [(MapsBaseLightMonitor *)&v6 _setMonitoring:v3];
  if (v5 != v3)
  {
    [(MapsAmbientLightMonitor *)self client];
    CFRunLoopGetMain();
    if (v3)
    {
      IOHIDEventSystemClientScheduleWithRunLoop();
      [(MapsAmbientLightMonitor *)self client];
      IOHIDEventSystemClientRegisterEventCallback();
    }
    else
    {
      IOHIDEventSystemClientUnscheduleWithRunLoop();
      [(MapsAmbientLightMonitor *)self client];
      IOHIDEventSystemClientUnregisterEventCallback();
      [(MapsAmbientLightMonitor *)self setAmbientLightLevel:0];
      [(MapsAmbientLightMonitor *)self setClient:0];
      [(MapsAmbientLightMonitor *)self setLightUpdateTimer:0];
      [(MapsAmbientLightMonitor *)self setDarkUpdateTimer:0];
    }
  }
}

- (int64_t)ambientLightLevel
{
  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [v3 objectForKey:@"MapsDebugAmbientLightLevelKey"];

  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 integerValue];
    objc_super v6 = sub_10008FEAC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)v5 >= 3)
      {
        objc_super v7 = +[NSString stringWithFormat:@"<Unknown: %ld>", v5];
      }
      else
      {
        objc_super v7 = *(&off_1012E7658 + (void)v5);
      }
      *(_DWORD *)buf = 138412290;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Using override ambient light level: %@", buf, 0xCu);
    }
  }
  else
  {
    id v5 = *(id *)(&self->_isBeforeSolarTransit + 1);
  }

  return (int64_t)v5;
}

- (void)setAmbientLightLevel:(int64_t)a3
{
  if (*(void *)(&self->_isBeforeSolarTransit + 1) != a3)
  {
    id v5 = sub_10008FEAC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = *(void *)(&self->_isBeforeSolarTransit + 1);
      if (v6 >= 3)
      {
        objc_super v7 = +[NSString stringWithFormat:@"<Unknown: %ld>", *(void *)(&self->_isBeforeSolarTransit + 1)];
      }
      else
      {
        objc_super v7 = *(&off_1012E7658 + v6);
      }
      id v8 = v7;
      if ((unint64_t)a3 >= 3)
      {
        v9 = +[NSString stringWithFormat:@"<Unknown: %ld>", a3];
      }
      else
      {
        v9 = *(&off_1012E7658 + a3);
      }
      [(MapsAmbientLightMonitor *)self _calculateAverageSample];
      *(_DWORD *)buf = 138412802;
      id v12 = v8;
      __int16 v13 = 2112;
      v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Changing ambient light level from %@ to %@ (average: %f)", buf, 0x20u);
    }
    *(void *)(&self->_isBeforeSolarTransit + 1) = a3;
    [(MapsBaseLightMonitor *)self _notifyDidChange];
  }
}

- (__IOHIDEventSystemClient)client
{
  result = *(__IOHIDEventSystemClient **)((char *)&self->_ambientLightLevel + 1);
  if (!result)
  {
    uint64_t v4 = IOHIDEventSystemClientCreateWithType();
    *(int64_t *)((char *)&self->_ambientLightLevel + 1) = v4;
    if (v4)
    {
      v7[0] = @"PrimaryUsagePage";
      v7[1] = @"PrimaryUsage";
      v8[0] = &off_1013A6D78;
      v8[1] = &off_1013A6D90;
      +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
      IOHIDEventSystemClientSetMatching();
      return *(__IOHIDEventSystemClient **)((char *)&self->_ambientLightLevel + 1);
    }
    else
    {
      id v5 = sub_10008FEAC();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)unint64_t v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Couldn't allocate client to monitor", v6, 2u);
      }

      return 0;
    }
  }
  return result;
}

- (void)setClient:(__IOHIDEventSystemClient *)a3
{
  uint64_t v4 = *(__IOHIDEventSystemClient **)((char *)&self->_ambientLightLevel + 1);
  if (v4 != a3)
  {
    if (v4) {
      CFRelease(v4);
    }
    *(int64_t *)((char *)&self->_ambientLightLevel + 1) = (int64_t)a3;
  }
}

- (void)initializeWithLightLevel:(int64_t)a3
{
  id v5 = sub_10008FEAC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 >= 3)
    {
      unint64_t v6 = +[NSString stringWithFormat:@"<Unknown: %ld>", a3];
    }
    else
    {
      unint64_t v6 = *(&off_1012E7658 + a3);
    }
    id v7 = v6;
    unint64_t v8 = *(void *)(&self->_isBeforeSolarTransit + 1);
    if (v8 >= 3)
    {
      v9 = +[NSString stringWithFormat:@"<Unknown: %ld>", *(void *)(&self->_isBeforeSolarTransit + 1)];
    }
    else
    {
      v9 = *(&off_1012E7658 + v8);
    }
    *(_DWORD *)buf = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Pre-populating light level to %@ from %@", buf, 0x16u);
  }
  *(void *)(&self->_isBeforeSolarTransit + 1) = a3;
}

- (void)_addSample:(double)a3
{
  id v5 = [(MapsAmbientLightMonitor *)self lightLevels];
  uint64_t v4 = +[NSNumber numberWithDouble:a3];
  [v5 push:v4];
}

- (double)_calculateAverageSample
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v3 = [(MapsAmbientLightMonitor *)self lightLevels];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    double v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) doubleValue];
        double v7 = v7 + v9;
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  uint64_t v10 = [(MapsAmbientLightMonitor *)self lightLevels];
  double v11 = 1.0;
  if ((unint64_t)[v10 count] >= 2)
  {
    __int16 v12 = [(MapsAmbientLightMonitor *)self lightLevels];
    double v11 = (double)(unint64_t)[v12 count];
  }
  return v7 / v11;
}

- (int64_t)_computedLightLevel
{
  [(MapsAmbientLightMonitor *)self _calculateAverageSample];
  if (v2 >= 25.0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)_handleIOHIDEvent:(__IOHIDEvent *)a3
{
  IOHIDEventGetFloatValue();
  -[MapsAmbientLightMonitor _addSample:](self, "_addSample:");

  [(MapsAmbientLightMonitor *)self _scheduleLightLevelUpdate];
}

- (void)_scheduleLightLevelUpdate
{
  int64_t v3 = [(MapsAmbientLightMonitor *)self ambientLightLevel];
  int64_t v4 = [(MapsAmbientLightMonitor *)self _computedLightLevel];
  if (v3 == v4)
  {
    [(MapsAmbientLightMonitor *)self setLightUpdateTimer:0];
    [(MapsAmbientLightMonitor *)self setDarkUpdateTimer:0];
  }
  else if (v4 == 1)
  {
    [(MapsAmbientLightMonitor *)self setDarkUpdateTimer:0];
    double v11 = [(MapsAmbientLightMonitor *)self lightUpdateTimer];

    if (!v11)
    {
      [(MapsAmbientLightMonitor *)self isBeforeSolarTransit];
      GEOConfigGetDouble();
      double v13 = v12;
      long long v14 = sub_10008FEAC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Scheduling regular light level update in %f", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      id v15 = &_dispatch_main_q;
      long long v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      v19 = sub_1003AD800;
      v20 = &unk_1012E7638;
      objc_copyWeak(&v21, (id *)buf);
      long long v16 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:&v17 block:v13];
      -[MapsAmbientLightMonitor setLightUpdateTimer:](self, "setLightUpdateTimer:", v16, v17, v18, v19, v20);

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }
  }
  else if (v4 == 2)
  {
    [(MapsAmbientLightMonitor *)self setLightUpdateTimer:0];
    id v5 = [(MapsAmbientLightMonitor *)self darkUpdateTimer];

    if (!v5)
    {
      [(MapsAmbientLightMonitor *)self isBeforeSolarTransit];
      GEOConfigGetDouble();
      double v7 = v6;
      unint64_t v8 = sub_10008FEAC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v25 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Scheduling low light level update in %f", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      id v9 = &_dispatch_main_q;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1003AD768;
      v22[3] = &unk_1012E7638;
      objc_copyWeak(&v23, (id *)buf);
      uint64_t v10 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v22 block:v7];
      [(MapsAmbientLightMonitor *)self setDarkUpdateTimer:v10];

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (BOOL)isBeforeSolarTransit
{
  return *(&self->super._monitoring + 1);
}

- (GCDTimer)darkUpdateTimer
{
  return *(GCDTimer **)((char *)&self->_client + 1);
}

- (void)setDarkUpdateTimer:(id)a3
{
}

- (GCDTimer)lightUpdateTimer
{
  return *(GCDTimer **)((char *)&self->_darkUpdateTimer + 1);
}

- (void)setLightUpdateTimer:(id)a3
{
}

- (MapsRingBuffer)lightLevels
{
  return *(MapsRingBuffer **)((char *)&self->_lightUpdateTimer + 1);
}

- (void)setLightLevels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_lightUpdateTimer + 1), 0);
  objc_storeStrong((id *)((char *)&self->_darkUpdateTimer + 1), 0);

  objc_storeStrong((id *)((char *)&self->_client + 1), 0);
}

@end