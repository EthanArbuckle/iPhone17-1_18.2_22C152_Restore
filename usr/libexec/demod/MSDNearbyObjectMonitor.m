@interface MSDNearbyObjectMonitor
- (MSDNearbyObjectMonitor)initWithObserver:(id)a3;
- (MSDNearbyObjectMonitorProtocol)observer;
- (NISession)niSession;
- (NSMutableDictionary)nearbyObjects;
- (OS_dispatch_queue)queue;
- (SFDeviceDiscovery)deviceScanner;
- (void)_feedNewRSSIReadingReceivedFromDevice:(id)a3;
- (void)_start;
- (void)_stop;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6;
- (void)sessionDidStartRunning:(id)a3;
- (void)sessionSuspensionEnded:(id)a3;
- (void)sessionWasSuspended:(id)a3;
- (void)setDeviceScanner:(id)a3;
- (void)setNearbyObjects:(id)a3;
- (void)setNiSession:(id)a3;
- (void)setObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MSDNearbyObjectMonitor

- (MSDNearbyObjectMonitor)initWithObserver:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDNearbyObjectMonitor;
  v5 = [(MSDNearbyObjectMonitor *)&v9 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MobileStoreDemo.NearbyObjectMonitor", 0);
    [(MSDNearbyObjectMonitor *)v5 setQueue:v6];

    [(MSDNearbyObjectMonitor *)v5 setObserver:v4];
    v7 = +[NSMutableDictionary dictionaryWithCapacity:0];
    [(MSDNearbyObjectMonitor *)v5 setNearbyObjects:v7];
  }
  return v5;
}

- (void)start
{
  objc_initWeak(&location, self);
  v3 = [(MSDNearbyObjectMonitor *)self queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A4B14;
  v4[3] = &unk_100151AC8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)stop
{
  objc_initWeak(&location, self);
  v3 = [(MSDNearbyObjectMonitor *)self queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A4C20;
  v4[3] = &unk_100151AC8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_start
{
  v3 = [(MSDNearbyObjectMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDNearbyObjectMonitor: Starting monitor!", (uint8_t *)&buf, 2u);
  }

  id v5 = [(MSDNearbyObjectMonitor *)self niSession];

  if (v5) {
    goto LABEL_9;
  }
  id v6 = [objc_alloc((Class)NIRegionPredicate) initWithName:@"Immediate" devicePresencePreset:1];
  id v7 = [objc_alloc((Class)NIRegionPredicate) initWithName:@"SensorMax" devicePresencePreset:5];
  id v8 = objc_alloc((Class)NIDevicePresenceConfiguration);
  id v33 = 0;
  id v9 = [v8 initWithInnerBoundary:v6 outerBoundary:v7 error:&v33];
  id v10 = v33;
  if (v9)
  {
    [v9 setAllowedDevices:4];
    id v11 = objc_alloc_init((Class)NISession);
    [(MSDNearbyObjectMonitor *)self setNiSession:v11];

    v12 = [(MSDNearbyObjectMonitor *)self niSession];
    [v12 setDelegate:self];

    v13 = [(MSDNearbyObjectMonitor *)self queue];
    v14 = [(MSDNearbyObjectMonitor *)self niSession];
    [v14 setDelegateQueue:v13];

    v15 = [(MSDNearbyObjectMonitor *)self niSession];
    [v15 runWithConfiguration:v9];
  }
  else
  {
    v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000DB5D4(v10);
    }
  }

  if (v9)
  {
LABEL_9:
    v16 = [(MSDNearbyObjectMonitor *)self deviceScanner];

    if (!v16)
    {
      objc_initWeak(&buf, self);
      id v17 = objc_alloc_init((Class)SFDeviceDiscovery);
      [(MSDNearbyObjectMonitor *)self setDeviceScanner:v17];

      v18 = [(MSDNearbyObjectMonitor *)self queue];
      v19 = [(MSDNearbyObjectMonitor *)self deviceScanner];
      [v19 setDispatchQueue:v18];

      v20 = [(MSDNearbyObjectMonitor *)self deviceScanner];
      [v20 setChangeFlags:13];

      v21 = [(MSDNearbyObjectMonitor *)self deviceScanner];
      [v21 setScanRate:20];

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000A50C8;
      v30[3] = &unk_100153BB8;
      objc_copyWeak(&v31, &buf);
      v22 = [(MSDNearbyObjectMonitor *)self deviceScanner];
      [v22 setDeviceFoundHandler:v30];

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000A5124;
      v28[3] = &unk_100153BB8;
      objc_copyWeak(&v29, &buf);
      v23 = [(MSDNearbyObjectMonitor *)self deviceScanner];
      [v23 setDeviceLostHandler:v28];

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000A5180;
      v26[3] = &unk_100153BE0;
      objc_copyWeak(&v27, &buf);
      v24 = [(MSDNearbyObjectMonitor *)self deviceScanner];
      [v24 setDeviceChangedHandler:v26];

      v25 = [(MSDNearbyObjectMonitor *)self deviceScanner];
      [v25 activateWithCompletion:&stru_100153C00];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&buf);
    }
  }
}

- (void)_stop
{
  v3 = [(MSDNearbyObjectMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDNearbyObjectMonitor: Stopping monitor!", v7, 2u);
  }

  id v5 = [(MSDNearbyObjectMonitor *)self niSession];

  if (v5)
  {
    id v6 = [(MSDNearbyObjectMonitor *)self niSession];
    [v6 invalidate];
  }
}

- (void)_feedNewRSSIReadingReceivedFromDevice:(id)a3
{
  id v17 = a3;
  id v4 = [v17 idsIdentifier];
  id v5 = [v17 model];
  id v6 = [v17 bleDevice];
  id v7 = [v6 advertisementFields];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"ch"];
  id v9 = (void *)v8;
  id v10 = &off_100162330;
  if (v8) {
    id v10 = (_UNKNOWN **)v8;
  }
  id v11 = v10;

  if (([v17 deviceFlags] & 0x400) != 0 && v4 && v5)
  {
    id v12 = objc_alloc((Class)NIBluetoothSample);
    v13 = [v17 bleDevice];
    id v14 = [v12 initWithRSSI:v4 identifier:v5 model:[v11 intValue] channel:(double)(uint64_t)objc_msgSend(v13, "rssi") machContinuousTimeSeconds:(double)mach_absolute_time()];

    v15 = [(MSDNearbyObjectMonitor *)self niSession];
    v16 = [v15 devicePresenceNotifier];
    [v16 notifyBluetoothSample:v14];
  }
}

- (void)sessionDidStartRunning:(id)a3
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MSDNearbyObjectMonitor: NISession is running!", v4, 2u);
  }
}

- (void)sessionWasSuspended:(id)a3
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MSDNearbyObjectMonitor: NISession suspended!", v4, 2u);
  }
}

- (void)sessionSuspensionEnded:(id)a3
{
  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDNearbyObjectMonitor: NISession suspension ended!", v8, 2u);
  }

  id v5 = [(MSDNearbyObjectMonitor *)self niSession];
  id v6 = [(MSDNearbyObjectMonitor *)self niSession];
  id v7 = [v6 configuration];
  [v5 runWithConfiguration:v7];
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1000DB6E0(v5);
  }

  id v7 = [(MSDNearbyObjectMonitor *)self deviceScanner];

  if (v7)
  {
    uint64_t v8 = [(MSDNearbyObjectMonitor *)self deviceScanner];
    [v8 invalidate];

    [(MSDNearbyObjectMonitor *)self setDeviceScanner:0];
  }
  id v9 = [(MSDNearbyObjectMonitor *)self niSession];

  if (v9) {
    [(MSDNearbyObjectMonitor *)self setNiSession:0];
  }
}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000DB764();
  }

  id v11 = [v8 deviceIdentifier];
  if (v11)
  {
    id v12 = [(MSDNearbyObjectMonitor *)self nearbyObjects];
    v13 = [v12 objectForKey:v11];

    if (v9)
    {
      BOOL v14 = [v9 devicePresencePreset] == (id)1;
      if (v13)
      {
LABEL_6:
        if (v14 == [(MSDNearbyObject *)v13 isInBubble])
        {
LABEL_12:

          goto LABEL_13;
        }
        [(MSDNearbyObject *)v13 updateIsInBubble:v14];
LABEL_10:
        v16 = [(MSDNearbyObjectMonitor *)self observer];

        if (v16)
        {
          id v17 = [(MSDNearbyObjectMonitor *)self observer];
          [v17 monitorDidUpdateRegionOfNearbyObject:v13];
        }
        goto LABEL_12;
      }
    }
    else
    {
      BOOL v14 = 0;
      if (v13) {
        goto LABEL_6;
      }
    }
    v13 = [[MSDNearbyObject alloc] initWithIdentifier:v11 andIsInBubble:v14];
    v15 = [(MSDNearbyObjectMonitor *)self nearbyObjects];
    [v15 setObject:v13 forKey:v11];

    goto LABEL_10;
  }
LABEL_13:
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MSDNearbyObjectMonitorProtocol)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (MSDNearbyObjectMonitorProtocol *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (NISession)niSession
{
  return self->_niSession;
}

- (void)setNiSession:(id)a3
{
}

- (SFDeviceDiscovery)deviceScanner
{
  return self->_deviceScanner;
}

- (void)setDeviceScanner:(id)a3
{
}

- (NSMutableDictionary)nearbyObjects
{
  return self->_nearbyObjects;
}

- (void)setNearbyObjects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyObjects, 0);
  objc_storeStrong((id *)&self->_deviceScanner, 0);
  objc_storeStrong((id *)&self->_niSession, 0);
  objc_destroyWeak((id *)&self->_observer);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end