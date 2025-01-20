@interface NIServerBluetoothSampleInternalObserver
+ (BOOL)_advertisementCacheEnabled;
+ (id)sharedObserver;
+ (unint64_t)_cachePreloadValue;
- (NIBluetoothDeviceCapabilities)deviceCapabilities;
- (id)_initPrivate;
- (id)activateCBDiscovery;
- (void)configureBTMaxRateScanningForPrototypeHomeSession;
- (void)configureCBDiscovery;
- (void)configureCBDiscoveryAirPodsLeech;
- (void)configureCBDiscoveryScreenOff;
- (void)didDiscoverDevice:(id)a3;
- (void)didDiscoverSample:(id)a3;
- (void)handleCBDiscoveryInterrupted;
- (void)handleCBDiscoveryStateChanged;
- (void)handleCBDiscoverySystemOverride;
- (void)registerForInternalBluetoothSamples:(id)a3;
- (void)registerForInternalBluetoothSamples:(id)a3 reportCache:(BOOL)a4;
- (void)startBTScanningWithMaxRateForPrototypeHomeSession:(id)a3;
- (void)startHighPriorityScanningForToken:(id)a3 forConsumer:(id)a4;
- (void)startLeechingForConsumer:(id)a3;
- (void)stopBTScanningWithMaxRateForPrototypeHomeSession;
- (void)stopHighPriorityScanning;
- (void)stopLeechingForConsumer:(id)a3;
- (void)unregisterForInternalBluetoothSamples:(id)a3;
@end

@implementation NIServerBluetoothSampleInternalObserver

- (id)_initPrivate
{
  v34.receiver = self;
  v34.super_class = (Class)NIServerBluetoothSampleInternalObserver;
  v2 = [(NIServerBluetoothSampleInternalObserver *)&v34 init];
  val = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    consumers = v2->_consumers;
    v2->_consumers = (NSHashTable *)v3;

    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    activeConsumers = v2->_activeConsumers;
    v2->_activeConsumers = (NSHashTable *)v5;

    uint64_t v7 = +[NSHashTable weakObjectsHashTable];
    currentHighPriorityConsumer = v2->_currentHighPriorityConsumer;
    v2->_currentHighPriorityConsumer = (NSHashTable *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.nearbyd.devicepresence.cbdiscovery", 0);
    cbDiscoveryQueue = v2->_cbDiscoveryQueue;
    v2->_cbDiscoveryQueue = (OS_dispatch_queue *)v9;

    atomic_store(0, (unsigned __int8 *)&v2->_activated);
    atomic_store(0, (unsigned __int8 *)&v2->_homeSessionAggressiveScanningActivated);
    if ([(id)objc_opt_class() _advertisementCacheEnabled])
    {
      v11 = objc_alloc_init(NIBluetoothAdvertisementCache);
      advertisementCache = v2->_advertisementCache;
      v2->_advertisementCache = v11;

      uint64_t v13 = mach_continuous_time();
      double v14 = sub_100006A9C(v13);
      int v15 = [(id)objc_opt_class() _cachePreloadValue];
      if (v15 >= 1)
      {
        LODWORD(v16) = v15;
        int v17 = 8 * v15 - 1;
        do
        {
          int v18 = v16;
          uint64_t v16 = (v16 - 1);
          for (int i = 6; i != -2; --i)
          {
            v20 = [NIBluetoothSample alloc];
            v21 = +[NSString stringWithFormat:@"%08i", v16];
            v22 = [(NIBluetoothSample *)v20 initWithRSSI:v21 identifier:@"a" model:((v18 + i) % 3 + 37) channel:(double)((v18 + i) % 70 - 80) machContinuousTimeSeconds:v14 - (double)(v17 + i - 6) * 0.125];

            [(NIBluetoothAdvertisementCache *)v2->_advertisementCache addSample:v22];
          }
          v17 -= 8;
        }
        while (v18 >= 2);
      }
      v23 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [(NIBluetoothAdvertisementCache *)v2->_advertisementCache allSamples];
        id v25 = [v24 count];
        uint64_t v26 = mach_continuous_time();
        double v27 = sub_100006A9C(v26);
        *(_DWORD *)buf = 134218240;
        id v36 = v25;
        __int16 v37 = 2048;
        double v38 = v27 - v14;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#btsampledistributor AdvertisementCache preloaded with %lu samples in %f seconds", buf, 0x16u);
      }
    }
    [(NIServerBluetoothSampleInternalObserver *)val configureCBDiscovery];
    if (_os_feature_enabled_impl())
    {
      if (+[AONSenseSampleProvider AONSENSE_FRAMEWORK_AVAILABLE])
      {
        objc_initWeak((id *)buf, val);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100197574;
        v32[3] = &unk_100855D18;
        objc_copyWeak(&v33, (id *)buf);
        v28 = objc_retainBlock(v32);
        v29 = +[AONSenseSampleProvider shared];
        [v29 registerWithQueue:val->_cbDiscoveryQueue callback:v28];

        objc_destroyWeak(&v33);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        [(NIServerBluetoothSampleInternalObserver *)val configureCBDiscoveryAirPodsLeech];
        if (_os_feature_enabled_impl()) {
          [(NIServerBluetoothSampleInternalObserver *)val configureCBDiscoveryScreenOff];
        }
      }
    }
  }
  return val;
}

+ (BOOL)_advertisementCacheEnabled
{
  v2 = +[NSUserDefaults standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"AdvertisementCacheEnabled"];
  v4 = qword_1008ABDE0;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      dispatch_queue_t v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#btsampledistributor AdvertisementCache Enabled default override: %@", (uint8_t *)&v8, 0xCu);
    }
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#btsampledistributor AdvertisementCache Enabled: YES", (uint8_t *)&v8, 2u);
    }
    unsigned __int8 v6 = 1;
  }

  return v6;
}

+ (unint64_t)_cachePreloadValue
{
  v2 = +[NSUserDefaults standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"AdvertisementCachePreloadValue"];
  v4 = qword_1008ABDE0;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      dispatch_queue_t v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#btsampledistributor AdvertisementCache PreloadValue default override: %@", (uint8_t *)&v8, 0xCu);
    }
    id v6 = [v3 unsignedLongLongValue];
  }
  else
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#btsampledistributor AdvertisementCache PreloadValue: 0", (uint8_t *)&v8, 2u);
    }
    id v6 = 0;
  }

  return (unint64_t)v6;
}

+ (id)sharedObserver
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100197910;
  block[3] = &unk_1008466D8;
  block[4] = a1;
  if (qword_1008A34F0 != -1) {
    dispatch_once(&qword_1008A34F0, block);
  }
  v2 = (void *)qword_1008A34E8;

  return v2;
}

- (void)registerForInternalBluetoothSamples:(id)a3
{
  id v4 = a3;
  -[NIServerBluetoothSampleInternalObserver registerForInternalBluetoothSamples:reportCache:](self, "registerForInternalBluetoothSamples:reportCache:", v4, [(id)objc_opt_class() _advertisementCacheEnabled]);
}

- (void)registerForInternalBluetoothSamples:(id)a3 reportCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (([v6 supportsDevicePresence] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_100415DE0();
    }
    v11 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/DevicePresence/NIServerBlu"
            "etoothSampleDistributor.mm";
      __int16 v17 = 1024;
      int v18 = 210;
      __int16 v19 = 2080;
      v20 = "-[NIServerBluetoothSampleInternalObserver registerForInternalBluetoothSamples:reportCache:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "#btsampledistributor %s:%d: assertion failure in %s", buf, 0x1Cu);
    }
    abort();
  }
  [(NSHashTable *)self->_consumers addObject:v6];
  if (v4)
  {
    int v8 = [(NIBluetoothAdvertisementCache *)self->_advertisementCache allSamples];
    dispatch_queue_t v9 = [v6 getQueueForInputingData];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100197BD8;
    v12[3] = &unk_100846588;
    id v13 = v8;
    id v14 = v6;
    id v10 = v8;
    dispatch_async(v9, v12);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)unregisterForInternalBluetoothSamples:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_consumers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (NIBluetoothDeviceCapabilities)deviceCapabilities
{
  return (NIBluetoothDeviceCapabilities)1;
}

- (void)startLeechingForConsumer:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_activeConsumers addObject:v4];
  if (![(CBDiscovery *)self->_cbDiscovery discoveryFlags]) {
    [(CBDiscovery *)self->_cbDiscovery setDiscoveryFlags:0x101202000040];
  }
  if (_os_feature_enabled_impl()
    && !+[AONSenseSampleProvider AONSENSE_FRAMEWORK_AVAILABLE])
  {
    if (![(CBDiscovery *)self->_cbDiscoveryAirPodsLeech discoveryFlags]) {
      [(CBDiscovery *)self->_cbDiscoveryAirPodsLeech setDiscoveryFlags:0x10120001C080];
    }
    if (_os_feature_enabled_impl()
      && ![(CBDiscovery *)self->_cbDiscoveryScreenOffBuffer discoveryFlags])
    {
      [(CBDiscovery *)self->_cbDiscoveryScreenOffBuffer setDiscoveryFlags:0x2000000];
    }
  }
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_activated);
  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(NIServerBluetoothSampleInternalObserver *)self activateCBDiscovery];
    if (v7 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100415E20();
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)startBTScanningWithMaxRateForPrototypeHomeSession:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  homeSessionAggressiveScanner = self->_homeSessionAggressiveScanner;
  if (!homeSessionAggressiveScanner)
  {
    [(NIServerBluetoothSampleInternalObserver *)self configureBTMaxRateScanningForPrototypeHomeSession];
    homeSessionAggressiveScanner = self->_homeSessionAggressiveScanner;
  }
  [(CBDiscovery *)homeSessionAggressiveScanner setDiscoveryFlags:0x1200000040];
  [(CBDiscovery *)self->_homeSessionAggressiveScanner setBleScanRate:60];
  [(CBDiscovery *)self->_homeSessionAggressiveScanner setUseCase:131093];
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_homeSessionAggressiveScanningActivated);
  if ((v6 & 1) == 0)
  {
    if ([(CBDiscovery *)self->_homeSessionAggressiveScanner bluetoothState] == (id)4)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100415E88();
      }
    }
    else
    {
      objc_initWeak(&location, self);
      double v7 = sub_100006C38();
      int v8 = self->_homeSessionAggressiveScanner;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1001980F8;
      v9[3] = &unk_100855D40;
      v10[1] = *(id *)&v7;
      objc_copyWeak(v10, &location);
      [(CBDiscovery *)v8 activateWithCompletion:v9];
      objc_destroyWeak(v10);
      objc_destroyWeak(&location);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)stopBTScanningWithMaxRateForPrototypeHomeSession
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_homeSessionAggressiveScanningActivated);
  if (v4)
  {
    [(CBDiscovery *)self->_homeSessionAggressiveScanner setDiscoveryFlags:0];
    [(CBDiscovery *)self->_homeSessionAggressiveScanner setBleScanRate:0];
    [(CBDiscovery *)self->_homeSessionAggressiveScanner setUseCase:0];
    [(CBDiscovery *)self->_homeSessionAggressiveScanner removeAllDiscoveryTypes];
    atomic_store(0, (unsigned __int8 *)&self->_homeSessionAggressiveScanningActivated);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)stopLeechingForConsumer:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_activeConsumers removeObject:v4];
  if ([(NSHashTable *)self->_currentHighPriorityConsumer containsObject:v4])
  {
    [(NSHashTable *)self->_currentHighPriorityConsumer removeObject:v4];
    [(NIServerBluetoothSampleInternalObserver *)self stopHighPriorityScanning];
  }
  if (![(NSHashTable *)self->_activeConsumers count])
  {
    NSUInteger v5 = [(NSHashTable *)self->_currentHighPriorityConsumer count];
    unsigned __int8 v6 = qword_1008ABDE0;
    BOOL v7 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)int v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#btsampledistributor No active leech consumers but we have a high priority consumer so not changing discovery flags", v8, 2u);
      }
    }
    else
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#btsampledistributor No active leech consumers and no active high priority consumers so unsetting discovery flags", buf, 2u);
      }
      [(CBDiscovery *)self->_cbDiscovery setDiscoveryFlags:0];
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)startHighPriorityScanningForToken:(id)a3 forConsumer:(id)a4
{
  id v6 = a3;
  id v25 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v7 = objc_alloc_init((Class)CBOOBKeyInfo);
  int v8 = [v6 objectInRawTokenOPACKDictForKey:&off_100878670];
  [v7 setIrkData:v8];

  dispatch_queue_t v9 = [v6 objectInRawTokenOPACKDictForKey:&off_100878688];
  if (v9)
  {
    [v7 setBtAddressData:v9];
    +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 3 * (void)[v9 length]);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v9;
    v12 = (unsigned __int8 *)[v11 bytes];
    for (unint64_t i = 0; i < (unint64_t)[v11 length]; ++i)
      [v10 appendFormat:@"%02x:", v12[i]];
    if (![v10 length])
    {
      __int16 v19 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100415F58(buf, (uint64_t)[v10 length], v19);
      }
      goto LABEL_25;
    }
    id v14 = [v10 substringToIndex:([v10 length] - 1)];
    id v15 = [v14 mutableCopy];

    uint64_t v16 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = [v15 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#btsampledistributor #nibtfinding starting token finding for btaddress: %s", buf, 0xCu);
    }

    id v17 = [v11 length];
    if (v17 == (id)6)
    {
      id v10 = v15;
    }
    else
    {
      if (v17 != (id)7)
      {
        __int16 v19 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v10 = v15;
          sub_100415FA0((uint64_t)[v10 UTF8String], buf, v19);
        }
        else
        {
          id v10 = v15;
        }
        goto LABEL_25;
      }
      int v18 = [v15 substringFromIndex:3];
      id v10 = [v18 mutableCopy];
    }
    v20 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v10 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#btsampledistributor #nibtfinding setting device filter: %s", buf, 0xCu);
    }

    id v27 = v7;
    v22 = +[NSArray arrayWithObjects:&v27 count:1];
    [(CBDiscovery *)self->_cbDiscovery setOobKeys:v22];

    id v26 = v10;
    v23 = +[NSArray arrayWithObjects:&v26 count:1];
    [(CBDiscovery *)self->_cbDiscovery setDeviceFilter:v23];

    [(CBDiscovery *)self->_cbDiscovery setDiscoveryFlags:0x200000000];
    [(CBDiscovery *)self->_cbDiscovery setBleScanRate:60];
    [(CBDiscovery *)self->_cbDiscovery setUseCase:589824];
    [(CBDiscovery *)self->_cbDiscovery addDiscoveryType:14];
    [(NSHashTable *)self->_currentHighPriorityConsumer addObject:v25];
    unsigned __int8 v24 = atomic_load((unsigned __int8 *)&self->_activated);
    if (v24) {
      goto LABEL_26;
    }
    __int16 v19 = [(NIServerBluetoothSampleInternalObserver *)self activateCBDiscovery];
    if (v19 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100415E20();
    }
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_100415F24();
  }
LABEL_27:

  os_unfair_lock_unlock(&self->_lock);
}

- (void)stopHighPriorityScanning
{
  [(CBDiscovery *)self->_cbDiscovery setOobKeys:0];
  [(CBDiscovery *)self->_cbDiscovery setDiscoveryFlags:0x101202000040];
  [(CBDiscovery *)self->_cbDiscovery setDeviceFilter:0];
  [(CBDiscovery *)self->_cbDiscovery setBleScanRate:0];
  [(CBDiscovery *)self->_cbDiscovery setUseCase:0];
  [(CBDiscovery *)self->_cbDiscovery removeAllDiscoveryTypes];
  currentHighPriorityConsumer = self->_currentHighPriorityConsumer;

  [(NSHashTable *)currentHighPriorityConsumer removeAllObjects];
}

- (id)activateCBDiscovery
{
  if (!self->_cbDiscovery
    || _os_feature_enabled_impl()
    && !+[AONSenseSampleProvider AONSENSE_FRAMEWORK_AVAILABLE](_TtC19ProximityDaemonCore22AONSenseSampleProvider, "AONSENSE_FRAMEWORK_AVAILABLE")&& (_os_feature_enabled_impl() && !self->_cbDiscoveryScreenOffBuffer || !self->_cbDiscoveryAirPodsLeech)|| [(CBDiscovery *)self->_cbDiscovery bluetoothState] == (id)4|| _os_feature_enabled_impl()&& !+[AONSenseSampleProvider AONSENSE_FRAMEWORK_AVAILABLE]&& (_os_feature_enabled_impl()&& [(CBDiscovery *)self->_cbDiscoveryScreenOffBuffer bluetoothState] == (id)4|| [(CBDiscovery *)self->_cbDiscoveryAirPodsLeech bluetoothState] == (id)4))
  {
    uint64_t v3 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10017 userInfo:0];
  }
  else
  {
    objc_initWeak(&location, self);
    double v4 = sub_100006C38();
    cbDiscovery = self->_cbDiscovery;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100198CC8;
    v15[3] = &unk_100855D40;
    v16[1] = *(id *)&v4;
    objc_copyWeak(v16, &location);
    [(CBDiscovery *)cbDiscovery activateWithCompletion:v15];
    if (_os_feature_enabled_impl()
      && !+[AONSenseSampleProvider AONSENSE_FRAMEWORK_AVAILABLE])
    {
      if (_os_feature_enabled_impl())
      {
        [(CBDiscovery *)self->_cbDiscoveryScreenOffBuffer removeAllDiscoveryTypes];
        [(CBDiscovery *)self->_cbDiscoveryScreenOffBuffer addDiscoveryType:25];
        double v6 = sub_100006C38();
        cbDiscoveryScreenOffBuffer = self->_cbDiscoveryScreenOffBuffer;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100198DF4;
        v13[3] = &unk_100855D40;
        v14[1] = *(id *)&v6;
        objc_copyWeak(v14, &location);
        [(CBDiscovery *)cbDiscoveryScreenOffBuffer activateWithCompletion:v13];
        objc_destroyWeak(v14);
      }
      double v8 = sub_100006C38();
      cbDiscoveryAirPodsLeech = self->_cbDiscoveryAirPodsLeech;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100198F14;
      v11[3] = &unk_100855D40;
      v12[1] = *(id *)&v8;
      objc_copyWeak(v12, &location);
      [(CBDiscovery *)cbDiscoveryAirPodsLeech activateWithCompletion:v11];
      objc_destroyWeak(v12);
    }
    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)configureCBDiscoveryAirPodsLeech
{
  if (_os_feature_enabled_impl()
    && !+[AONSenseSampleProvider AONSENSE_FRAMEWORK_AVAILABLE])
  {
    uint64_t v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    cbDiscoveryAirPodsLeech = self->_cbDiscoveryAirPodsLeech;
    self->_cbDiscoveryAirPodsLeech = v3;

    [(CBDiscovery *)self->_cbDiscoveryAirPodsLeech setDispatchQueue:self->_cbDiscoveryQueue];
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    id v12[2] = sub_100199270;
    v12[3] = &unk_1008460C0;
    objc_copyWeak(&v13, &location);
    [(CBDiscovery *)self->_cbDiscoveryAirPodsLeech setDeviceFoundHandler:v12];
    if (_os_feature_enabled_impl())
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      id v10[2] = sub_1001992E4;
      v10[3] = &unk_100855D68;
      objc_copyWeak(&v11, &location);
      [(CBDiscovery *)self->_cbDiscoveryAirPodsLeech setDevicesBufferedHandler:v10];
      objc_destroyWeak(&v11);
    }
    [(CBDiscovery *)self->_cbDiscoveryAirPodsLeech setInvalidationHandler:&stru_100855D88];
    NSUInteger v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    id v7 = sub_1001994E4;
    double v8 = &unk_1008460E8;
    objc_copyWeak(&v9, &location);
    [(CBDiscovery *)self->_cbDiscoveryAirPodsLeech setInterruptionHandler:&v5];
    -[CBDiscovery setErrorHandler:](self->_cbDiscoveryAirPodsLeech, "setErrorHandler:", &stru_100855DC8, v5, v6, v7, v8);
    [(CBDiscovery *)self->_cbDiscoveryAirPodsLeech setDiscoveryFlags:0];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)configureCBDiscoveryScreenOff
{
  if (_os_feature_enabled_impl()
    && _os_feature_enabled_impl()
    && !+[AONSenseSampleProvider AONSENSE_FRAMEWORK_AVAILABLE])
  {
    uint64_t v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
    cbDiscoveryScreenOffBuffer = self->_cbDiscoveryScreenOffBuffer;
    self->_cbDiscoveryScreenOffBuffer = v3;

    [(CBDiscovery *)self->_cbDiscoveryScreenOffBuffer setDispatchQueue:self->_cbDiscoveryQueue];
    objc_initWeak(&location, self);
    [(CBDiscovery *)self->_cbDiscoveryScreenOffBuffer setInvalidationHandler:&stru_100855DE8];
    NSUInteger v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    id v7 = sub_100199744;
    double v8 = &unk_1008460E8;
    objc_copyWeak(&v9, &location);
    [(CBDiscovery *)self->_cbDiscoveryScreenOffBuffer setInterruptionHandler:&v5];
    -[CBDiscovery setErrorHandler:](self->_cbDiscoveryScreenOffBuffer, "setErrorHandler:", &stru_100855E08, v5, v6, v7, v8);
    [(CBDiscovery *)self->_cbDiscoveryScreenOffBuffer setDiscoveryFlags:0];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)configureCBDiscovery
{
  uint64_t v3 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
  cbDiscovery = self->_cbDiscovery;
  self->_cbDiscovery = v3;

  [(CBDiscovery *)self->_cbDiscovery setDispatchQueue:self->_cbDiscoveryQueue];
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100199A74;
  v11[3] = &unk_1008460C0;
  objc_copyWeak(&v12, &location);
  [(CBDiscovery *)self->_cbDiscovery setDeviceFoundHandler:v11];
  [(CBDiscovery *)self->_cbDiscovery setInvalidationHandler:&stru_100855E28];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100199B2C;
  v9[3] = &unk_1008460E8;
  objc_copyWeak(&v10, &location);
  [(CBDiscovery *)self->_cbDiscovery setInterruptionHandler:v9];
  [(CBDiscovery *)self->_cbDiscovery setErrorHandler:&stru_100855E48];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100199BEC;
  v7[3] = &unk_1008460E8;
  objc_copyWeak(&v8, &location);
  [(CBDiscovery *)self->_cbDiscovery setBluetoothStateChangedHandler:v7];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100199C48;
  v5[3] = &unk_1008460E8;
  objc_copyWeak(&v6, &location);
  [(CBDiscovery *)self->_cbDiscovery setSystemOverrideHandler:v5];
  [(CBDiscovery *)self->_cbDiscovery setDiscoveryFlags:0];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)didDiscoverSample:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    [v4 rssi];
    if (v6 >= 0.0)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100416390();
      }
    }
    else if ([(NIBluetoothAdvertisementCache *)self->_advertisementCache isSampleInCache:v4])
    {
      id v7 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#btsampledistributor Dropping sample that is already in the cache %@", buf, 0xCu);
      }
    }
    else
    {
      id v8 = [v4 identifier];

      if (v8) {
        [(NIBluetoothAdvertisementCache *)self->_advertisementCache addSample:v4];
      }
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = self->_consumers;
      id v15 = p_lock;
      id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v19;
        do
        {
          for (unint64_t i = 0; i != v10; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v9);
            }
            id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            id v14 = [v13 getQueueForInputingData];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100199F68;
            block[3] = &unk_100846588;
            block[4] = v13;
            id v17 = v4;
            dispatch_async(v14, block);
          }
          id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v10);
      }

      p_lock = v15;
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)configureBTMaxRateScanningForPrototypeHomeSession
{
  uint64_t v3 = (CBDiscovery *)objc_opt_new();
  homeSessionAggressiveScanner = self->_homeSessionAggressiveScanner;
  self->_homeSessionAggressiveScanner = v3;

  [(CBDiscovery *)self->_homeSessionAggressiveScanner setDispatchQueue:self->_cbDiscoveryQueue];
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10019A21C;
  v11[3] = &unk_1008460C0;
  objc_copyWeak(&v12, &location);
  [(CBDiscovery *)self->_homeSessionAggressiveScanner setDeviceFoundHandler:v11];
  [(CBDiscovery *)self->_homeSessionAggressiveScanner setInvalidationHandler:&stru_100855E68];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10019A2DC;
  v9[3] = &unk_1008460E8;
  objc_copyWeak(&v10, &location);
  [(CBDiscovery *)self->_homeSessionAggressiveScanner setInterruptionHandler:v9];
  [(CBDiscovery *)self->_homeSessionAggressiveScanner setErrorHandler:&stru_100855E88];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10019A3A4;
  v7[3] = &unk_1008460E8;
  objc_copyWeak(&v8, &location);
  [(CBDiscovery *)self->_homeSessionAggressiveScanner setBluetoothStateChangedHandler:v7];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10019A408;
  v5[3] = &unk_1008460E8;
  objc_copyWeak(&v6, &location);
  [(CBDiscovery *)self->_homeSessionAggressiveScanner setSystemOverrideHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)didDiscoverDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = v4;
  double v38 = v5;
  id v6 = [v5 model];
  if (!v6)
  {
    unsigned int v46 = [v5 proximityPairingProductID];
    sub_1002590EC(&v46, __p);
    if (v48 < 0)
    {
      if (!__p[1])
      {
        id v6 = 0;
LABEL_43:
        operator delete(__p[0]);
        goto LABEL_2;
      }
      id v12 = (void **)__p[0];
    }
    else
    {
      if (!v48)
      {
        id v6 = 0;
        goto LABEL_2;
      }
      id v12 = __p;
    }
    id v6 = +[NSString stringWithUTF8String:v12];
    if ((v48 & 0x80000000) == 0) {
      goto LABEL_2;
    }
    goto LABEL_43;
  }
LABEL_2:
  double v7 = (double)(int)[v5 rssi];
  if (!v6) {
    goto LABEL_16;
  }
  unsigned int v8 = [v5 bleChannel];
  switch(v8)
  {
    case '%':
      unsigned int v9 = [v5 transmitPowerOne];
      unsigned int v46 = 37;
      sub_100004950(__p, (char *)[v6 UTF8String]);
      id v10 = sub_100259208(&v46, (const void **)__p);
      break;
    case '&':
      unsigned int v9 = [v5 transmitPowerTwo];
      unsigned int v46 = 38;
      sub_100004950(__p, (char *)[v6 UTF8String]);
      id v10 = sub_100259208(&v46, (const void **)__p);
      break;
    case '\'':
      unsigned int v9 = [v5 transmitPowerThree];
      unsigned int v46 = 39;
      sub_100004950(__p, (char *)[v6 UTF8String]);
      id v10 = sub_100259208(&v46, (const void **)__p);
      break;
    default:
      goto LABEL_16;
  }
  id v13 = v10;
  char v14 = v11;
  if (v48 < 0) {
    operator delete(__p[0]);
  }
  if (v14) {
    double v7 = v7 - (COERCE_DOUBLE((unint64_t)v13 ^ 0x8000000000000000) + (double)v9 * 0.1);
  }
LABEL_16:
  id v15 = [v5 identifier];
  uint64_t v16 = [v5 idsDeviceID];
  BOOL v17 = v16 == 0;

  if (!v17)
  {
    uint64_t v18 = [v38 idsDeviceID];

    id v15 = (void *)v18;
  }
  if ([v38 productID] == 8212)
  {
    if (((unint64_t)[v38 deviceFlags] & 0x400000000) != 0) {
      [v38 serialNumberLeft];
    }
    else {
    long long v19 = [v38 serialNumberRight];
    }
  }
  else
  {
    long long v19 = &stru_100869B68;
  }
  long long v20 = [NIBluetoothSample alloc];
  id v21 = [v38 bleChannel];
  id v22 = [v38 bleAdvertisementTimestampMachContinuous];
  v23 = [v38 name];
  id v24 = [(NIBluetoothSample *)v20 initWithRSSI:v15 identifier:v6 model:v21 channel:v19 machContinuousTimeSeconds:v23 partIdentifier:0 name:v7 presenceConfigData:(double)(unint64_t)v22 / 1000000.0];

  id v25 = [v38 name];
  if (v25)
  {
    id v26 = [v38 name];
    unsigned __int8 v27 = [v26 isEqualToString:@"Bluetooth Device"];

    if ((v27 & 1) == 0)
    {
      v28 = [v38 name];
      [(NIBluetoothSample *)v24 setName:v28];
    }
  }

  id v29 = [v38 idsDeviceID];
  BOOL v30 = v29 == 0;

  if (!v30) {
    [(NIBluetoothAdvertisementCache *)self->_advertisementCache addSample:v24];
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v31 = self->_consumers;
  id v32 = [(NSHashTable *)v31 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v43;
    do
    {
      for (unint64_t i = 0; i != v32; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v43 != v33) {
          objc_enumerationMutation(v31);
        }
        v35 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v36 = [v35 getQueueForInputingData];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10019AAF4;
        block[3] = &unk_100855EB0;
        block[4] = v35;
        id v40 = v38;
        v41 = v24;
        dispatch_async(v36, block);
      }
      id v32 = [(NSHashTable *)v31 countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v32);
  }

  os_unfair_lock_unlock(lock);
}

- (void)handleCBDiscoveryInterrupted
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_consumers;
  id v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (unint64_t i = 0; i != v5; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        unsigned int v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        unsigned int v9 = [v8 getQueueForInputingData];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10019ACEC;
        block[3] = &unk_1008473B0;
        block[4] = v8;
        dispatch_async(v9, block);
      }
      id v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)handleCBDiscoveryStateChanged
{
  unint64_t v3 = (unint64_t)[(CBDiscovery *)self->_cbDiscovery bluetoothState];
  id v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    if (v3 > 0xA) {
      id v5 = "?";
    }
    else {
      id v5 = off_100855FD8[v3];
    }
    *(_DWORD *)buf = 136315138;
    long long v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#btsampledistributor CBDiscovery Bluetooth state changed: %s", buf, 0xCu);
  }
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = self->_consumers;
  id v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = [v10 getQueueForInputingData];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10019AF14;
        block[3] = &unk_100855ED8;
        block[4] = v10;
        void block[5] = v3;
        dispatch_async(v11, block);
      }
      id v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(lock);
}

- (void)handleCBDiscoverySystemOverride
{
  if ([(CBDiscovery *)self->_cbDiscovery systemOverrideFlags])
  {
    unint64_t v3 = (id)qword_1008ABDE0;
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
LABEL_24:

      return;
    }
    int v4 = [(CBDiscovery *)self->_cbDiscovery bleScanRate];
    if (v4 > 34)
    {
      if (v4 > 49)
      {
        if (v4 == 50)
        {
          id v5 = "High";
          goto LABEL_23;
        }
        if (v4 == 60)
        {
          id v5 = "Max";
          goto LABEL_23;
        }
      }
      else
      {
        if (v4 == 35)
        {
          id v5 = "MediumLow";
          goto LABEL_23;
        }
        if (v4 == 40)
        {
          id v5 = "Medium";
          goto LABEL_23;
        }
      }
    }
    else if (v4 > 19)
    {
      if (v4 == 20)
      {
        id v5 = "Background";
        goto LABEL_23;
      }
      if (v4 == 30)
      {
        id v5 = "Low";
        goto LABEL_23;
      }
    }
    else
    {
      if (!v4)
      {
        id v5 = "Default";
        goto LABEL_23;
      }
      if (v4 == 10)
      {
        id v5 = "Periodic";
LABEL_23:
        int v6 = 136315138;
        id v7 = v5;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#btsampledistributor CBDiscovery #nicoex Bluetooth scanning reduced (%s) due to WiFi critical.", (uint8_t *)&v6, 0xCu);
        goto LABEL_24;
      }
    }
    id v5 = "?";
    goto LABEL_23;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeSessionAggressiveScanner, 0);
  objc_storeStrong((id *)&self->_advertisementCache, 0);
  objc_storeStrong((id *)&self->_cbDiscoveryScreenOffBuffer, 0);
  objc_storeStrong((id *)&self->_cbDiscoveryAirPodsLeech, 0);
  objc_storeStrong((id *)&self->_cbDiscovery, 0);
  objc_storeStrong((id *)&self->_cbDiscoveryQueue, 0);
  objc_storeStrong((id *)&self->_currentHighPriorityConsumer, 0);
  objc_storeStrong((id *)&self->_activeConsumers, 0);

  objc_storeStrong((id *)&self->_consumers, 0);
}

@end