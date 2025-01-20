@interface COSWatchDiscoveryCoordinator
- (BOOL)_foundNearbyAdvertisingWatches;
- (BOOL)_shouldAllowBailoutForDetectingNetworkRelayWatches;
- (BOOL)discoveredWatchNearby;
- (COSWatchDiscoveryCoordinatorDelegate)delegate;
- (NSTimer)unpairedWatchDiscoveryTimer;
- (id)_discoveredNetworkRelayWatch;
- (void)_checkForDiscoveredUnpairedWatches:(id)a3;
- (void)_refreshWatchDiscoveryTimer;
- (void)setDelegate:(id)a3;
- (void)setDiscoveredWatchNearby:(BOOL)a3;
- (void)setUnpairedWatchDiscoveryTimer:(id)a3;
- (void)startDiscoveringWatchNearby;
- (void)stopDiscoveringWatchNearby;
@end

@implementation COSWatchDiscoveryCoordinator

- (void)startDiscoveringWatchNearby
{
  v3 = +[NRDeviceDiscoveryController sharedInstance];
  [v3 begin];

  [(COSWatchDiscoveryCoordinator *)self _refreshWatchDiscoveryTimer];
}

- (void)stopDiscoveringWatchNearby
{
  [(NSTimer *)self->_unpairedWatchDiscoveryTimer invalidate];
  unpairedWatchDiscoveryTimer = self->_unpairedWatchDiscoveryTimer;
  self->_unpairedWatchDiscoveryTimer = 0;
}

- (void)_refreshWatchDiscoveryTimer
{
  [(NSTimer *)self->_unpairedWatchDiscoveryTimer invalidate];
  v3 = +[NSTimer timerWithTimeInterval:self target:"_checkForDiscoveredUnpairedWatches:" selector:0 userInfo:0 repeats:1.0];
  unpairedWatchDiscoveryTimer = self->_unpairedWatchDiscoveryTimer;
  self->_unpairedWatchDiscoveryTimer = v3;

  id v5 = +[NSRunLoop mainRunLoop];
  [v5 addTimer:self->_unpairedWatchDiscoveryTimer forMode:NSRunLoopCommonModes];
}

- (void)_checkForDiscoveredUnpairedWatches:(id)a3
{
  if ([(COSWatchDiscoveryCoordinator *)self _foundNearbyAdvertisingWatches])
  {
    self->_discoveredWatchNearby = 1;
    v4 = [(COSWatchDiscoveryCoordinator *)self delegate];
    [v4 discoveredWatchNearby:self];

    [(NSTimer *)self->_unpairedWatchDiscoveryTimer invalidate];
    unpairedWatchDiscoveryTimer = self->_unpairedWatchDiscoveryTimer;
    self->_unpairedWatchDiscoveryTimer = 0;
  }
  else
  {
    [(COSWatchDiscoveryCoordinator *)self _refreshWatchDiscoveryTimer];
  }
}

- (BOOL)_foundNearbyAdvertisingWatches
{
  v3 = +[NRDeviceDiscoveryController sharedInstance];
  v4 = [v3 devices];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    id v8 = v6;
    char v9 = 0;
    uint64_t v10 = *(void *)v19;
    uint64_t v11 = NRDevicePropertyAdvertisedName;
    *(void *)&long long v7 = 138412290;
    long long v17 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v5);
        }
        v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) valueForProperty:v11 v17];
        if (v13)
        {
          v14 = pbb_setupflow_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "foundDevice %@", buf, 0xCu);
          }

          char v9 = 1;
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  unsigned __int8 v15 = [(COSWatchDiscoveryCoordinator *)self _shouldAllowBailoutForDetectingNetworkRelayWatches];
  return (v9 | v15) & 1;
}

- (BOOL)_shouldAllowBailoutForDetectingNetworkRelayWatches
{
  if (!_os_feature_enabled_impl())
  {
    v3 = +[NSDate date];
    id v5 = [(COSWatchDiscoveryCoordinator *)self _discoveredNetworkRelayWatch];
    if (v5)
    {
      [v3 timeIntervalSinceDate:v5];
      double v7 = v6;
      id v8 = pbb_bridge_log();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7 <= 43200.0)
      {
        if (v9)
        {
          int v14 = 138412290;
          unsigned __int8 v15 = v5;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Allowing NetworkRelay bailout, last discovered NetworkRelay Watch: %@", (uint8_t *)&v14, 0xCu);
        }
        BOOL v4 = 1;
        goto LABEL_16;
      }
      if (v9)
      {
        int v14 = 138412290;
        unsigned __int8 v15 = v5;
        uint64_t v10 = "No need to bailout for NetworkRelay, discovered too long ago: %@.";
        uint64_t v11 = v8;
        uint32_t v12 = 12;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
      }
    }
    else
    {
      id v8 = pbb_bridge_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        uint64_t v10 = "No need to bailout for NetworkRelay, not discovered recently.";
        uint64_t v11 = v8;
        uint32_t v12 = 2;
        goto LABEL_11;
      }
    }
    BOOL v4 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NetworkRelay not enabled, no bailout needed", (uint8_t *)&v14, 2u);
  }
  BOOL v4 = 0;
LABEL_17:

  return v4;
}

- (id)_discoveredNetworkRelayWatch
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(VecchioWatchDetectedKey, VecchioWatchDetectedDomain, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)AppIntegerValue];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)discoveredWatchNearby
{
  return self->_discoveredWatchNearby;
}

- (void)setDiscoveredWatchNearby:(BOOL)a3
{
  self->_discoveredWatchNearby = a3;
}

- (COSWatchDiscoveryCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSWatchDiscoveryCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSTimer)unpairedWatchDiscoveryTimer
{
  return self->_unpairedWatchDiscoveryTimer;
}

- (void)setUnpairedWatchDiscoveryTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unpairedWatchDiscoveryTimer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end