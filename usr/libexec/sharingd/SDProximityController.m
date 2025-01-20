@interface SDProximityController
+ (SDProximityController)sharedController;
- (NSMutableDictionary)deviceIdToCurrentPreset;
- (SDProximityController)init;
- (int64_t)_deviceToPreset:(id)a3;
- (unint64_t)checkDeviceRegion:(id)a3;
- (void)_newDeviceOrRegion:(id)a3 region:(id)a4;
- (void)_notifyRegionLost:(id)a3;
- (void)_removeDevice:(id)a3;
- (void)_runSession;
- (void)_triggerDeviceProximity:(id)a3;
- (void)clearDeviceList;
- (void)notifyDeviceLost:(id)a3;
- (void)restart;
- (void)sender:(id)a3 _notifyBluetoothSample:(id)a4 withId:(id)a5 forType:(unint64_t)a6;
- (void)sender:(id)a3 notifyBluetoothSample:(id)a4;
- (void)sender:(id)a3 notifyBluetoothSample:(id)a4 forType:(unint64_t)a5;
- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4;
- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6;
- (void)sessionBegan;
- (void)sessionDidStartRunning:(id)a3;
- (void)sessionSuspensionEnded:(id)a3;
- (void)sessionWasSuspended:(id)a3;
@end

@implementation SDProximityController

+ (SDProximityController)sharedController
{
  if (qword_10097FCE0 != -1) {
    dispatch_once(&qword_10097FCE0, &stru_1008CBA98);
  }
  v2 = (void *)qword_10097FCE8;

  return (SDProximityController *)v2;
}

- (SDProximityController)init
{
  v11.receiver = self;
  v11.super_class = (Class)SDProximityController;
  v2 = [(SDProximityController *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deviceIdToDelegate = v3->_deviceIdToDelegate;
    v3->_deviceIdToDelegate = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deviceIdToPairingAgentDeviceID = v3->_deviceIdToPairingAgentDeviceID;
    v3->_deviceIdToPairingAgentDeviceID = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deviceIdToCurrentPreset = v3->_deviceIdToCurrentPreset;
    v3->_deviceIdToCurrentPreset = v8;

    *(int64x2_t *)&v3->_currentRestartDelay = vdupq_n_s64(3uLL);
    v3->_currentRestartCount = 0;
    [(SDProximityController *)v3 _runSession];
  }
  return v3;
}

- (void)sender:(id)a3 notifyBluetoothSample:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = 2 * ([v6 deviceActionType] == 36);
  id v9 = [v6 deviceIdentifier];
  [(SDProximityController *)self sender:v7 _notifyBluetoothSample:v6 withId:v9 forType:v8];
}

- (void)sender:(id)a3 notifyBluetoothSample:(id)a4 forType:(unint64_t)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = v8;
  if ((a5 | 2) == 3)
  {
    v10 = [v8 deviceIdentifier];
    [(SDProximityController *)self sender:v11 _notifyBluetoothSample:v9 withId:v10 forType:a5];
  }
}

- (void)notifyDeviceLost:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = sub_100086400();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NSMutableDictionary *)self->_deviceIdToDelegate allKeys];
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "removing device: %@ from list: %@", (uint8_t *)&v8, 0x16u);
  }
  os_unfair_lock_unlock(&self->_lock);
  id v7 = [v4 deviceIdentifier];
  [(SDProximityController *)self _removeDevice:v7];
}

- (void)clearDeviceList
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = sub_100086400();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    deviceIdToCurrentPreset = self->_deviceIdToCurrentPreset;
    int v6 = 138412290;
    id v7 = deviceIdToCurrentPreset;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "clearing deviceIdToCurrentPreset: %@", (uint8_t *)&v6, 0xCu);
  }

  [(NSMutableDictionary *)self->_deviceIdToCurrentPreset removeAllObjects];
  [(NSMutableDictionary *)self->_deviceIdToDelegate removeAllObjects];
  [(NSMutableDictionary *)self->_deviceIdToPairingAgentDeviceID removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (void)sender:(id)a3 _notifyBluetoothSample:(id)a4 withId:(id)a5 forType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned int v13 = [v11 rssi];
  if ((v13 & 0x80000000) == 0) {
    goto LABEL_11;
  }
  int v14 = v13;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  deviceIdToDelegate = self->_deviceIdToDelegate;
  v17 = [v11 deviceIdentifier];
  [(NSMutableDictionary *)deviceIdToDelegate setObject:v10 forKeyedSubscript:v17];

  v18 = [v11 pairingAgentDeviceIdentifier];
  deviceIdToPairingAgentDeviceID = self->_deviceIdToPairingAgentDeviceID;
  v20 = [v11 deviceIdentifier];
  [(NSMutableDictionary *)deviceIdToPairingAgentDeviceID setObject:v18 forKeyedSubscript:v20];

  os_unfair_lock_unlock(&self->_lock);
  id v21 = [v11 channel];
  switch(a6)
  {
    case 3uLL:
      id v29 = objc_alloc((Class)NIBluetoothSample);
      double v30 = (double)v14;
      v31 = [v12 UUIDString];
      v32 = [v11 model];
      id v26 = [v29 initWithRSSI:v31 identifier:v32 model:v21 channel:v30 machContinuousTimeSeconds:(double)mach_continuous_time()];

      os_unfair_lock_lock(&self->_lock);
      niSessions = self->_niSessions;
      v28 = &off_1009027F0;
      goto LABEL_8;
    case 2uLL:
      id v33 = objc_alloc((Class)NIBluetoothSample);
      double v34 = (double)v14;
      v35 = [v12 UUIDString];
      id v26 = [v33 initWithRSSI:v35 identifier:@"DovePeace" model:v21 channel:v34 machContinuousTimeSeconds:(double)mach_continuous_time()];

      os_unfair_lock_lock(&self->_lock);
      niSessions = self->_niSessions;
      v28 = &off_1009027D8;
      goto LABEL_8;
    case 1uLL:
      id v22 = objc_alloc((Class)NIBluetoothSample);
      double v23 = (double)v14;
      v24 = [v12 UUIDString];
      v25 = [v11 model];
      id v26 = [v22 initWithRSSI:v24 identifier:v25 model:v21 channel:v23 machContinuousTimeSeconds:(double)mach_continuous_time()];

      os_unfair_lock_lock(&self->_lock);
      niSessions = self->_niSessions;
      v28 = &off_1009027C0;
LABEL_8:
      v36 = [(NSDictionary *)niSessions objectForKeyedSubscript:v28];
      os_unfair_lock_unlock(p_lock);
      goto LABEL_9;
  }
  id v38 = [v11 model];
  if (([v38 isEqual:@"AirPods1,1"] & 1) != 0
    || ([v38 isEqual:@"AirPods1,3"] & 1) != 0
    || [v38 isEqual:@"AirPodsPro1,1"])
  {
  }
  else
  {
    id v41 = [objc_alloc((Class)SFHeadphoneProduct) initWithBluetoothModel:v38];
    unsigned int v42 = [v41 isAirPods];

    if (!v42)
    {

      goto LABEL_22;
    }
  }
  int v39 = _os_feature_enabled_impl();

  if (!v39)
  {
LABEL_22:
    id v43 = objc_alloc((Class)NIBluetoothSample);
    double v44 = (double)v14;
    v45 = [v12 UUIDString];
    v46 = [v11 model];
    id v26 = [v43 initWithRSSI:v45 identifier:v46 model:v21 channel:v44 machContinuousTimeSeconds:(double)mach_continuous_time()];

    int64_t v47 = [(SDProximityController *)self _deviceToPreset:v11];
    if (!v47)
    {
      v36 = sub_100086400();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v52 = [v11 deviceActionType];
        v53 = [v11 description];
        int v54 = 67109378;
        LODWORD(v55[0]) = v52;
        WORD2(v55[0]) = 2112;
        *(void *)((char *)v55 + 6) = v53;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "unexpected action type: %d for device: %@", (uint8_t *)&v54, 0x12u);
      }
      goto LABEL_10;
    }
    int64_t v48 = v47;
    os_unfair_lock_lock(&self->_lock);
    v49 = self->_niSessions;
    v50 = +[NSNumber numberWithInteger:v48];
    v36 = [(NSDictionary *)v49 objectForKeyedSubscript:v50];

    os_unfair_lock_unlock(p_lock);
    v51 = sub_100086400();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      int v54 = 138412290;
      v55[0] = v12;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Notify Bluetooth Sample with ID: %@, SDProximityController forwarding sample to NI", (uint8_t *)&v54, 0xCu);
    }

LABEL_9:
    v37 = [v36 devicePresenceNotifier];
    [v37 notifyBluetoothSample:v26];

LABEL_10:
    goto LABEL_11;
  }
  v40 = sub_100086400();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    int v54 = 138412290;
    v55[0] = v12;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Notify Bluetooth Sample with ID: %@, SDProximityController not sending to NI", (uint8_t *)&v54, 0xCu);
  }

LABEL_11:
}

- (unint64_t)checkDeviceRegion:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v6 = [v4 deviceIdentifier];

  if (v6)
  {
    deviceIdToCurrentPreset = self->_deviceIdToCurrentPreset;
    int v8 = [v4 deviceIdentifier];
    id v9 = [(NSMutableDictionary *)deviceIdToCurrentPreset objectForKeyedSubscript:v8];
    unsigned __int8 v10 = [v9 isEqual:&off_1009027C0];

    if (v10)
    {
      unint64_t v11 = 1;
    }
    else
    {
      id v12 = self->_deviceIdToCurrentPreset;
      unsigned int v13 = [v4 deviceIdentifier];
      int v14 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v13];
      unsigned __int8 v15 = [v14 isEqual:&off_1009027D8];

      if (v15)
      {
        unint64_t v11 = 2;
      }
      else
      {
        v16 = self->_deviceIdToCurrentPreset;
        v17 = [v4 deviceIdentifier];
        v18 = [(NSMutableDictionary *)v16 objectForKeyedSubscript:v17];
        unsigned __int8 v19 = [v18 isEqual:&off_100902808];

        if (v19)
        {
          unint64_t v11 = 3;
        }
        else
        {
          v20 = self->_deviceIdToCurrentPreset;
          id v21 = [v4 deviceIdentifier];
          id v22 = [(NSMutableDictionary *)v20 objectForKeyedSubscript:v21];
          unsigned int v23 = [v22 isEqual:&off_1009027F0];

          if (v23) {
            unint64_t v11 = 4;
          }
          else {
            unint64_t v11 = 0;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (void)_notifyRegionLost:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSUUID);
  int v6 = [v4 deviceIdentifier];

  id v7 = [v5 initWithUUIDString:v6];
  [(SDProximityController *)self _removeDevice:v7];
}

- (void)_removeDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_deviceIdToDelegate removeObjectForKey:v4];
  [(NSMutableDictionary *)self->_deviceIdToPairingAgentDeviceID removeObjectForKey:v4];
  id v5 = sub_100086400();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    deviceIdToCurrentPreset = self->_deviceIdToCurrentPreset;
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = deviceIdToCurrentPreset;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "removing devicepresetid: %@ from presetidlist: %@", (uint8_t *)&v9, 0x16u);
  }

  id v7 = sub_100086400();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = +[NSNumber numberWithUnsignedInteger:[(NSMutableDictionary *)self->_deviceIdToDelegate count]];
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "removing devicepresetid: %@ from delegatelist size: %@", (uint8_t *)&v9, 0x16u);
  }
  [(NSMutableDictionary *)self->_deviceIdToCurrentPreset removeObjectForKey:v4];
  [(NSMutableDictionary *)self->_deviceIdToDelegate removeObjectForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_triggerDeviceProximity:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v6 = [(NSMutableDictionary *)self->_deviceIdToDelegate objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    id v7 = [(NSMutableDictionary *)self->_deviceIdToPairingAgentDeviceID objectForKeyedSubscript:v4];
    os_unfair_lock_unlock(p_lock);
    [v6 proximityDeviceDidTrigger:v7];
  }
  else
  {
    id v7 = sub_100086400();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Don't have a delegate to call for device with identifier: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_newDeviceOrRegion:(id)a3 region:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  id v9 = objc_alloc((Class)NSUUID);
  id v10 = [v8 deviceIdentifier];

  id v13 = [v9 initWithUUIDString:v10];
  id v11 = [v7 devicePresencePreset];

  id v12 = +[NSNumber numberWithInteger:v11];
  [(NSMutableDictionary *)self->_deviceIdToCurrentPreset setObject:v12 forKeyedSubscript:v13];

  os_unfair_lock_unlock(p_lock);
  [(SDProximityController *)self _triggerDeviceProximity:v13];
}

- (void)_runSession
{
  v53[0] = &off_1009027C0;
  id v3 = objc_alloc_init((Class)NISession);
  v54[0] = v3;
  v53[1] = &off_1009027D8;
  id v4 = objc_alloc_init((Class)NISession);
  v54[1] = v4;
  v53[2] = &off_100902808;
  id v5 = objc_alloc_init((Class)NISession);
  v54[2] = v5;
  v53[3] = &off_1009027F0;
  id v6 = objc_alloc_init((Class)NISession);
  v54[3] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:4];

  id v8 = self;
  os_unfair_lock_lock(&self->_lock);
  id v9 = (NSDictionary *)[v7 copy];
  niSessions = self->_niSessions;
  self->_niSessions = v9;

  id v11 = (NISession *)objc_alloc_init((Class)NISession);
  niAirPodsSession = self->_niAirPodsSession;
  self->_niAirPodsSession = v11;

  os_unfair_lock_unlock(&self->_lock);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v13 = v7;
  id v14 = [v13 countByEnumeratingWithState:&v44 objects:v52 count:16];
  id v40 = v13;
  if (v14)
  {
    id v16 = v14;
    uint64_t v41 = *(void *)v45;
    *(void *)&long long v15 = 138412546;
    long long v39 = v15;
    do
    {
      v17 = 0;
      do
      {
        if (*(void *)v45 != v41) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v17);
        id v19 = [objc_alloc((Class)NIRegionPredicate) initWithName:@"sensorMax" devicePresencePreset:5];
        v20 = [v13 objectForKeyedSubscript:v18];
        id v21 = 0;
        switch([v18 intValue])
        {
          case 1u:
            id v22 = objc_alloc((Class)NIRegionPredicate);
            CFStringRef v23 = @"immediate";
            uint64_t v24 = 1;
            goto LABEL_11;
          case 2u:
            id v22 = objc_alloc((Class)NIRegionPredicate);
            CFStringRef v23 = @"near";
            uint64_t v24 = 2;
            goto LABEL_11;
          case 3u:
            id v22 = objc_alloc((Class)NIRegionPredicate);
            CFStringRef v23 = @"desk";
            uint64_t v24 = 3;
            goto LABEL_11;
          case 6u:
            id v22 = objc_alloc((Class)NIRegionPredicate);
            CFStringRef v23 = @"superImmediate";
            uint64_t v24 = 6;
LABEL_11:
            id v21 = [v22 initWithName:v23 devicePresencePreset:v24];
            break;
          default:
            break;
        }
        id v25 = objc_alloc((Class)NIDevicePresenceConfiguration);
        id v43 = 0;
        id v26 = [v25 initWithInnerBoundary:v21 outerBoundary:v19 error:&v43];
        id v27 = v43;
        [v26 setAllowedDevices:0];
        [(NISession *)v20 setDelegate:v8];
        v28 = sub_100086400();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          [v26 description];
          v30 = id v29 = v8;
          *(_DWORD *)buf = v39;
          v49 = v20;
          __int16 v50 = 2112;
          v51 = v30;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "starting nisession:%@, with configuration:%@", buf, 0x16u);

          id v8 = v29;
          id v13 = v40;
        }

        [(NISession *)v20 runWithConfiguration:v26];
        v17 = (char *)v17 + 1;
      }
      while (v16 != v17);
      id v16 = [v13 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v16);
  }

  if (_os_feature_enabled_impl())
  {
    id v31 = [objc_alloc((Class)NIRegionPredicate) initWithName:@"immediate" devicePresencePreset:1];
    v32 = v8;
    id v33 = [objc_alloc((Class)NIRegionPredicate) initWithName:@"sensorMax" devicePresencePreset:5];
    id v42 = 0;
    id v34 = [objc_alloc((Class)NIDevicePresenceConfiguration) initWithInnerBoundary:v31 outerBoundary:v33 error:&v42];
    id v35 = v42;
    [v34 setAllowedDevices:8];
    [(NISession *)v32->_niAirPodsSession setDelegate:v32];
    v36 = sub_100086400();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = v32->_niAirPodsSession;
      id v38 = [v34 description];
      *(_DWORD *)buf = 138412546;
      v49 = v37;
      id v13 = v40;
      __int16 v50 = 2112;
      v51 = v38;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "starting nisession:%@, with configuration:%@", buf, 0x16u);
    }
    [(NISession *)v32->_niAirPodsSession runWithConfiguration:v34];
  }
}

- (int64_t)_deviceToPreset:(id)a3
{
  id v3 = a3;
  if ([v3 deviceActionType] == 24
    || [v3 deviceActionType] == 5)
  {
    goto LABEL_3;
  }
  unsigned int v6 = [v3 deviceActionType];
  int64_t v4 = 1;
  if (v6 != 11 && v6 != 33)
  {
    if ([v3 deviceActionType] == 36
      || ([v3 needsSetup] & 1) != 0)
    {
      goto LABEL_3;
    }
    id v7 = [v3 model];
    if (([v7 isEqual:@"AirPods1,1"] & 1) != 0
      || ([v7 isEqual:@"AirPods1,3"] & 1) != 0
      || ([v7 isEqual:@"AirPodsPro1,1"] & 1) != 0
      || ([v7 isEqual:@"PowerbeatsPro1,1"] & 1) != 0
      || [v7 isEqual:@"Device1,8202"])
    {

LABEL_3:
      int64_t v4 = 1;
      goto LABEL_4;
    }
    id v8 = [objc_alloc((Class)SFHeadphoneProduct) initWithBluetoothModel:v7];
    unsigned __int8 v9 = [v8 showsStatus];

    if (v9) {
      goto LABEL_3;
    }
    id v10 = [v3 model];
    unsigned __int8 v11 = [v10 isEqual:@"Device1,21760"];

    if (v11) {
      goto LABEL_3;
    }
    id v12 = [v3 model];
    unsigned __int8 v13 = [&off_100906DB8 containsObject:v12];

    if (v13) {
      int64_t v4 = 2;
    }
    else {
      int64_t v4 = ([v3 deviceFlags] >> 11) & 1;
    }
  }
LABEL_4:

  return v4;
}

- (NSMutableDictionary)deviceIdToCurrentPreset
{
  return self->_deviceIdToCurrentPreset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdToCurrentPreset, 0);
  objc_storeStrong((id *)&self->_deviceIdToPairingAgentDeviceID, 0);
  objc_storeStrong((id *)&self->_deviceIdToDelegate, 0);
  objc_storeStrong((id *)&self->_niAirPodsSession, 0);

  objc_storeStrong((id *)&self->_niSessions, 0);
}

- (void)sessionBegan
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = sub_100086400();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t currentRestartDelay = self->_currentRestartDelay;
    int v6 = 134217984;
    unint64_t v7 = currentRestartDelay;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "session started, resetting previous delay: %llu", (uint8_t *)&v6, 0xCu);
  }

  self->_unint64_t currentRestartDelay = self->_defaultRestartDelay;
  os_unfair_lock_unlock(p_lock);
}

- (void)restart
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = self->_currentRestartCount + 1;
  self->_unint64_t currentRestartCount = v4;
  if (v4 >= [(NSDictionary *)self->_niSessions count])
  {
    niSessions = self->_niSessions;
    self->_niSessions = 0;

    niAirPodsSession = self->_niAirPodsSession;
    self->_niAirPodsSession = 0;

    self->_unint64_t currentRestartCount = 0;
    unint64_t currentRestartDelay = self->_currentRestartDelay;
    self->_unint64_t currentRestartDelay = 2 * currentRestartDelay;
    os_unfair_lock_unlock(p_lock);
    unsigned __int8 v11 = sub_100086400();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v16 = currentRestartDelay;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "restarting session with delay: %llu (s)", buf, 0xCu);
    }

    dispatch_time_t v12 = dispatch_time(0, 1000000000 * currentRestartDelay);
    unsigned __int8 v13 = SFMainQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100087A50;
    block[3] = &unk_1008CA4B8;
    block[4] = self;
    dispatch_after(v12, v13, block);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    id v5 = sub_100086400();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t currentRestartCount = self->_currentRestartCount;
      NSUInteger v7 = [(NSDictionary *)self->_niSessions count];
      *(_DWORD *)buf = 134218240;
      unint64_t v16 = currentRestartCount;
      __int16 v17 = 2048;
      NSUInteger v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "restart count is: %llu out of %lu", buf, 0x16u);
    }
  }
}

- (void)sessionDidStartRunning:(id)a3
{
}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  unint64_t v4 = sub_100086400();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "didUpdateNearbyObjects", v5, 2u);
  }
}

- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4
{
  id v4 = a4;
  id v5 = sub_100086400();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 deviceIdentifier];
    int v7 = 136315138;
    id v8 = [v6 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "didDiscoverNearbyObject object: %s", (uint8_t *)&v7, 0xCu);
  }
}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_100086400();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v8 deviceIdentifier];
    id v12 = [v11 UTF8String];
    id v13 = [v9 description];
    int v14 = 136315394;
    id v15 = v12;
    __int16 v16 = 2080;
    id v17 = [v13 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "didUpdateRegion object: %s newRegion: %s", (uint8_t *)&v14, 0x16u);
  }
  if (v9 && [v9 devicePresencePreset] != (id)5) {
    [(SDProximityController *)self _newDeviceOrRegion:v8 region:v9];
  }
  else {
    [(SDProximityController *)self _notifyRegionLost:v8];
  }
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = sub_100086400();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "didFailWithError error: %@", (uint8_t *)&v7, 0xCu);
  }

  [(SDProximityController *)self restart];
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  id v6 = sub_100086400();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "didInvalidateWithError  error: %@", (uint8_t *)&v7, 0xCu);
  }

  [(SDProximityController *)self restart];
}

- (void)sessionWasSuspended:(id)a3
{
  id v3 = sub_100086400();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "sessionWasSuspended waiting for ended suspension to resume. This should happen when bt is toggled back on", v4, 2u);
  }
}

- (void)sessionSuspensionEnded:(id)a3
{
  id v4 = sub_100086400();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "sessionSuspensionEnded attempting to resume", v5, 2u);
  }

  [(SDProximityController *)self restart];
}

@end