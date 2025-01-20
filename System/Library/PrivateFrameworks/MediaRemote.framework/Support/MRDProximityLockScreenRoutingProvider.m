@interface MRDProximityLockScreenRoutingProvider
- (BOOL)invalidated;
- (MRDLockScreenRoutingProviderDelegate)delegate;
- (MRDProximityLockScreenRoutingProvider)initWithDispatchQueue:(id)a3;
- (NSArray)nearbyDeviceIdentifiers;
- (NSMutableSet)nearbyDevices;
- (OS_dispatch_queue)queue;
- (PCLockscreenControlsObserver)observer;
- (id)deviceForUID:(id)a3;
- (void)_configureObserver;
- (void)clearNearbyDevices;
- (void)didSwitchRouteTo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setNearbyDevices:(id)a3;
- (void)setObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)startObservationIfNeeded;
@end

@implementation MRDProximityLockScreenRoutingProvider

- (MRDProximityLockScreenRoutingProvider)initWithDispatchQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRDProximityLockScreenRoutingProvider;
  v6 = [(MRDProximityLockScreenRoutingProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_invalidated = 1;
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    nearbyDevices = v7->_nearbyDevices;
    v7->_nearbyDevices = v8;

    [(MRDProximityLockScreenRoutingProvider *)v7 startObservationIfNeeded];
  }

  return v7;
}

- (NSArray)nearbyDeviceIdentifiers
{
  v2 = [(MRDProximityLockScreenRoutingProvider *)self observer];
  v3 = [v2 knownDevices];
  v4 = [v3 sortedArrayUsingComparator:&stru_100416BD0];

  id v5 = objc_msgSend(v4, "msv_compactMap:", &stru_100416C10);

  return (NSArray *)v5;
}

- (id)deviceForUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDProximityLockScreenRoutingProvider *)self observer];
  v6 = [v5 knownDevices];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100032E24;
  v10[3] = &unk_100416C38;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "msv_firstWhere:", v10);

  return v8;
}

- (void)didSwitchRouteTo:(id)a3
{
  id v5 = [(MRDProximityLockScreenRoutingProvider *)self deviceForUID:a3];
  if (v5)
  {
    id v4 = [(MRDProximityLockScreenRoutingProvider *)self observer];
    [v4 didSwitchRouteToDevice:v5];
  }
}

- (void)startObservationIfNeeded
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] startObservationIfNeeded (%p)", buf, 0xCu);
  }

  id v4 = [(MRDProximityLockScreenRoutingProvider *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032FDC;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_configureObserver
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(off_100475710());
  [(MRDProximityLockScreenRoutingProvider *)self setObserver:v3];

  id v4 = [(MRDProximityLockScreenRoutingProvider *)self queue];
  id v5 = [(MRDProximityLockScreenRoutingProvider *)self observer];
  [v5 setDispatchQueue:v4];

  v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(MRDProximityLockScreenRoutingProvider *)self observer];
    *(_DWORD *)buf = 138412546;
    v22 = v7;
    __int16 v23 = 2048;
    v24 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] configuring observer: %@ (%p)", buf, 0x16u);
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000333A8;
  v18[3] = &unk_100416C60;
  objc_copyWeak(&v19, &location);
  v8 = [(MRDProximityLockScreenRoutingProvider *)self observer];
  [v8 setDeviceLost:v18];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100033504;
  v16[3] = &unk_100416C60;
  objc_copyWeak(&v17, &location);
  v9 = [(MRDProximityLockScreenRoutingProvider *)self observer];
  [v9 setDeviceUpdated:v16];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100033678;
  v14[3] = &unk_100416C88;
  objc_copyWeak(&v15, &location);
  v10 = [(MRDProximityLockScreenRoutingProvider *)self observer];
  [v10 setInvalidationHandler:v14];

  id v11 = [(MRDProximityLockScreenRoutingProvider *)self observer];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000336FC;
  v12[3] = &unk_100416C88;
  objc_copyWeak(&v13, &location);
  [v11 activateWithCompletion:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)clearNearbyDevices
{
  id v3 = [(MRDProximityLockScreenRoutingProvider *)self nearbyDevices];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = _MRLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[ProximityProvider] Removing all nearby devices.", v7, 2u);
    }

    v6 = [(MRDProximityLockScreenRoutingProvider *)self nearbyDevices];
    [v6 removeAllObjects];
  }
}

- (MRDLockScreenRoutingProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDLockScreenRoutingProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PCLockscreenControlsObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)nearbyDevices
{
  return self->_nearbyDevices;
}

- (void)setNearbyDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDevices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end