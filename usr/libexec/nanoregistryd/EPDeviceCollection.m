@interface EPDeviceCollection
- (EPDeviceCollection)initWithDelegate:(id)a3;
- (NSMutableDictionary)classicDevicesDictionary;
- (NSMutableDictionary)devicesDictionary;
- (NSMutableSet)displayableDevices;
- (NSMutableSet)proximateDevices;
- (id)initBase;
- (id)newDeviceWithPeer:(id)a3;
- (id)newDeviceWithPeripheral:(id)a3 withAdvertisementData:(id)a4 withRSSI:(id)a5;
- (void)_updateTimer;
- (void)clear;
- (void)dealloc;
- (void)deviceInfo:(id)a3 peerDidInvalidate:(id)a4;
- (void)deviceInfoDeviceDidDeallocate:(id)a3;
- (void)deviceInfoPairingFailure:(id)a3;
- (void)deviceInfoPairingSuccess:(id)a3;
- (void)update;
@end

@implementation EPDeviceCollection

- (id)initBase
{
  v3.receiver = self;
  v3.super_class = (Class)EPDeviceCollection;
  return [(EPDeviceCollection *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)EPDeviceCollection;
  [(EPDeviceCollection *)&v2 dealloc];
}

- (EPDeviceCollection)initWithDelegate:(id)a3
{
  id v5 = a3;
  v6 = [(EPDeviceCollection *)self initBase];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(v6 + 1, a3);
    uint64_t v8 = +[NSMutableDictionary dictionary];
    id v9 = v7[2];
    v7[2] = (id)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    id v11 = v7[3];
    v7[3] = (id)v10;

    uint64_t v12 = +[NSMutableSet set];
    id v13 = v7[9];
    v7[9] = (id)v12;

    uint64_t v14 = +[NSMutableSet set];
    id v15 = v7[10];
    v7[10] = (id)v14;

    uint64_t v16 = +[NSMutableDictionary dictionary];
    id v17 = v7[8];
    v7[8] = (id)v16;

    uint64_t v18 = +[NSMutableDictionary dictionary];
    id v19 = v7[11];
    v7[11] = (id)v18;

    v20 = +[NSDate date];
    [v20 timeIntervalSinceReferenceDate];
    v7[7] = v21;
  }
  return (EPDeviceCollection *)v7;
}

- (void)_updateTimer
{
  id v3 = [(NSMutableDictionary *)self->_devicesDictionary count];
  purgeTimer = self->_purgeTimer;
  if (!v3)
  {
    if (purgeTimer)
    {
      dispatch_source_cancel(purgeTimer);
      id v11 = self->_purgeTimer;
      self->_purgeTimer = 0;
    }
    uint64_t v12 = +[NSDate date];
    [v12 timeIntervalSinceReferenceDate];
    double v14 = v13 - self->_startTime;

    int64_t maxDevicesSeen = self->_maxDevicesSeen;
    uint64_t v16 = nr_daemon_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (maxDevicesSeen)
    {
      if (v17)
      {
        uint64_t v18 = nr_daemon_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v19 = self->_maxDevicesSeen;
          *(_DWORD *)buf = 134218240;
          double v26 = *(double *)&v19;
          __int16 v27 = 2048;
          double v28 = v14;
          v20 = "During the last discovery %ld unique devices were seen in about %1.2f seconds";
          v21 = v18;
          uint32_t v22 = 22;
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else if (v17)
    {
      uint64_t v18 = nr_daemon_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v26 = v14;
        v20 = "During the last discovery NO DEVICES were seen in about %1.2f seconds";
        v21 = v18;
        uint32_t v22 = 12;
        goto LABEL_13;
      }
LABEL_14:
    }
    me = self->me;
    self->me = 0;

    return;
  }
  if (!purgeTimer)
  {
    objc_storeStrong((id *)&self->me, self);
    id v5 = +[EPFactory queue];
    v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
    v7 = self->_purgeTimer;
    self->_purgeTimer = v6;

    uint64_t v8 = self->_purgeTimer;
    dispatch_time_t v9 = dispatch_walltime(0, 1000000000);
    dispatch_source_set_timer(v8, v9, 0x3B9ACA00uLL, 0x1DCD6500uLL);
    uint64_t v10 = self->_purgeTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10008A6A8;
    handler[3] = &unk_1001655F8;
    handler[4] = self;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume((dispatch_object_t)self->_purgeTimer);
  }
}

- (void)clear
{
  id v3 = sub_1000A3BC0();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = sub_1000A3BC0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EPDeviceCollection: Clearing all devices", buf, 2u);
    }
  }
  v6 = self->_proximateDevices;
  v7 = self->_displayableDevices;
  uint64_t v8 = self->_devicesDictionary;
  dispatch_time_t v9 = +[NSMutableSet set];
  proximateDevices = self->_proximateDevices;
  self->_proximateDevices = v9;

  id v11 = +[NSMutableSet set];
  displayableDevices = self->_displayableDevices;
  self->_displayableDevices = v11;

  double v13 = +[NSMutableDictionary dictionary];
  devicesDictionary = self->_devicesDictionary;
  self->_devicesDictionary = v13;

  id v15 = +[EPFactory queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A928;
  block[3] = &unk_100165530;
  double v28 = v6;
  v29 = self;
  uint64_t v16 = v6;
  dispatch_async(v15, block);

  BOOL v17 = +[EPFactory queue];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10008AB34;
  v24[3] = &unk_100165530;
  v25 = v7;
  double v26 = self;
  uint64_t v18 = v7;
  dispatch_async(v17, v24);

  int64_t v19 = +[EPFactory queue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10008AD40;
  v21[3] = &unk_100165530;
  uint32_t v22 = v8;
  v23 = self;
  v20 = v8;
  dispatch_async(v19, v21);
}

- (void)update
{
  objc_super v2 = self;
  if ((unint64_t)[(NSMutableDictionary *)self->_devicesDictionary count] > self->_maxDevicesSeen) {
    v2->_int64_t maxDevicesSeen = (int64_t)[(NSMutableDictionary *)v2->_devicesDictionary count];
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v3 = [(NSMutableDictionary *)v2->_devicesDictionary allKeys];
  id v4 = [v3 copy];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v84 objects:v98 count:16];
  if (v5)
  {
    id v7 = v5;
    char v67 = 0;
    uint64_t v8 = *(void *)v85;
    p_cache = (void **)(NRPBPairingModeRequest + 16);
    *(void *)&long long v6 = 138412802;
    long long v66 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v85 != v8) {
          objc_enumerationMutation(obj);
        }
        v69 = *(void **)(*((void *)&v84 + 1) + 8 * v10);
        uint64_t v70 = v10;
        id v11 = [(NSMutableDictionary *)v2->_devicesDictionary objectForKeyedSubscript:v66];
        unsigned int v71 = [v11 isExpired];
        unsigned int v72 = [v11 isDisplayabilityExpired];
        unsigned int v12 = [v11 isProximateExpired];
        double v13 = nr_daemon_log();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

        unsigned int v73 = v12;
        if (v14)
        {
          id v15 = nr_daemon_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = [v69 UUIDString];
            BOOL v17 = [v11 name];
            uint64_t v18 = +[NSNumber numberWithBool:v71];
            int64_t v19 = +[NSNumber numberWithBool:v72];
            +[NSNumber numberWithBool:v73];
            uint64_t v20 = v8;
            uint32_t v22 = v21 = v2;
            *(_DWORD *)buf = 138413314;
            v89 = v16;
            __int16 v90 = 2112;
            uint64_t v91 = (uint64_t)v17;
            __int16 v92 = 2112;
            v93 = v18;
            __int16 v94 = 2112;
            v95 = v19;
            __int16 v96 = 2112;
            v97 = v22;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "EPDeviceCollection: Device %@ %@ isExpired (%@); isDisplayabilityExpired (%@); isProximateExpired (%@)",
              buf,
              0x34u);

            objc_super v2 = v21;
            uint64_t v8 = v20;

            unsigned int v12 = v73;
          }

          p_cache = NRPBPairingModeRequest.cache;
        }
        LODWORD(v23) = v72;
        if (v12 && [(NSMutableSet *)v2->_proximateDevices containsObject:v11])
        {
          [(NSMutableSet *)v2->_proximateDevices removeObject:v11];
          v24 = sub_1000A3BC0();
          BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

          if (v25)
          {
            double v26 = sub_1000A3BC0();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v27 = [v69 UUIDString];
              uint64_t v23 = [v11 name];
              *(_DWORD *)buf = 138412546;
              v89 = v27;
              __int16 v90 = 2112;
              uint64_t v91 = v23;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "EPDeviceCollection: Device %@ %@ has become unproximate", buf, 0x16u);

              LODWORD(v23) = v72;
            }
          }
          double v28 = [p_cache + 498 queue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10008BA70;
          block[3] = &unk_100165530;
          void block[4] = v2;
          id v83 = v11;
          dispatch_async(v28, block);
        }
        if (v23
          && [(NSMutableSet *)v2->_displayableDevices containsObject:v11])
        {
          [(NSMutableSet *)v2->_displayableDevices removeObject:v11];
          v29 = sub_1000A3BC0();
          BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

          if (v30)
          {
            v31 = sub_1000A3BC0();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              v32 = [v69 UUIDString];
              uint64_t v23 = [v11 name];
              *(_DWORD *)buf = 138412546;
              v89 = v32;
              __int16 v90 = 2112;
              uint64_t v91 = v23;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "EPDeviceCollection: Device %@ %@ has become undisplayable.", buf, 0x16u);

              LOBYTE(v23) = v72;
            }
          }
          v33 = [p_cache + 498 queue];
          v80[0] = _NSConcreteStackBlock;
          v80[1] = 3221225472;
          v80[2] = sub_10008BACC;
          v80[3] = &unk_100165530;
          v80[4] = v2;
          id v81 = v11;
          dispatch_async(v33, v80);
        }
        if (v71)
        {
          devicesDictionary = v2->_devicesDictionary;
          v35 = [v11 uuid];
          [(NSMutableDictionary *)devicesDictionary removeObjectForKey:v35];

          v36 = sub_1000A3BC0();
          LODWORD(v35) = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);

          if (v35)
          {
            v37 = sub_1000A3BC0();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v38 = [v69 UUIDString];
              uint64_t v23 = [v11 name];
              *(_DWORD *)buf = 138412546;
              v89 = v38;
              __int16 v90 = 2112;
              uint64_t v91 = v23;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "EPDeviceCollection: Device %@ %@ has expired.", buf, 0x16u);

              LOBYTE(v23) = v72;
            }
          }
          v39 = [p_cache + 498 queue];
          v78[0] = _NSConcreteStackBlock;
          v78[1] = 3221225472;
          v78[2] = sub_10008BB28;
          v78[3] = &unk_100165530;
          v78[4] = v2;
          id v79 = v11;
          dispatch_async(v39, v78);

          char v67 = 1;
        }
        if ((v23 & 1) == 0)
        {
          if ([(NSMutableSet *)v2->_displayableDevices containsObject:v11])
          {
            v40 = sub_1000A3BC0();
            BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);

            if (v41)
            {
              v42 = sub_1000A3BC0();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                v43 = [v69 UUIDString];
                v44 = [v11 name];
                v45 = [v11 RSSI];
                *(_DWORD *)buf = v66;
                v89 = v43;
                __int16 v90 = 2112;
                uint64_t v91 = (uint64_t)v44;
                __int16 v92 = 2112;
                v93 = v45;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "EPDeviceCollection: Device %@ %@ is already displayable with RSSI %@.", buf, 0x20u);

                p_cache = (void **)(NRPBPairingModeRequest + 16);
              }
            }
          }
          else
          {
            [(NSMutableSet *)v2->_displayableDevices addObject:v11];
            v46 = sub_1000A3BC0();
            BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);

            if (v47)
            {
              v48 = sub_1000A3BC0();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                v49 = [v69 UUIDString];
                v50 = [v11 name];
                v51 = [v11 RSSI];
                *(_DWORD *)buf = v66;
                v89 = v49;
                __int16 v90 = 2112;
                uint64_t v91 = (uint64_t)v50;
                __int16 v92 = 2112;
                v93 = v51;
                _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "EPDeviceCollection: Device %@ %@ has become displayable with RSSI %@.", buf, 0x20u);

                p_cache = NRPBPairingModeRequest.cache;
              }
            }
            v52 = [p_cache + 498 queue];
            v76[0] = _NSConcreteStackBlock;
            v76[1] = 3221225472;
            v76[2] = sub_10008BB84;
            v76[3] = &unk_100165530;
            v76[4] = v2;
            id v77 = v11;
            dispatch_async(v52, v76);
          }
        }
        if ((v73 & 1) == 0)
        {
          if ([(NSMutableSet *)v2->_proximateDevices containsObject:v11])
          {
            v53 = sub_1000A3BC0();
            BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);

            if (v54)
            {
              v55 = sub_1000A3BC0();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                v56 = [v69 UUIDString];
                v57 = [v11 name];
                v58 = [v11 RSSI];
                *(_DWORD *)buf = v66;
                v89 = v56;
                __int16 v90 = 2112;
                uint64_t v91 = (uint64_t)v57;
                __int16 v92 = 2112;
                v93 = v58;
                _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "EPDeviceCollection: Device %@ %@ is already proximate with RSSI %@.", buf, 0x20u);

                p_cache = (void **)(NRPBPairingModeRequest + 16);
              }
            }
          }
          else
          {
            [(NSMutableSet *)v2->_proximateDevices addObject:v11];
            v59 = sub_1000A3BC0();
            BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);

            if (v60)
            {
              v61 = sub_1000A3BC0();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                v62 = [v69 UUIDString];
                v63 = [v11 name];
                v64 = [v11 RSSI];
                *(_DWORD *)buf = v66;
                v89 = v62;
                __int16 v90 = 2112;
                uint64_t v91 = (uint64_t)v63;
                __int16 v92 = 2112;
                v93 = v64;
                _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "EPDeviceCollection: Device %@ %@ has become proximate with RSSI %@.", buf, 0x20u);

                p_cache = NRPBPairingModeRequest.cache;
              }
            }
            v65 = [p_cache + 498 queue];
            v74[0] = _NSConcreteStackBlock;
            v74[1] = 3221225472;
            v74[2] = sub_10008BBE0;
            v74[3] = &unk_100165530;
            v74[4] = v2;
            id v75 = v11;
            dispatch_async(v65, v74);
          }
        }

        uint64_t v10 = v70 + 1;
      }
      while (v7 != (id)(v70 + 1));
      id v7 = [obj countByEnumeratingWithState:&v84 objects:v98 count:16];
    }
    while (v7);

    if (v67) {
      [(EPDeviceCollection *)v2 _updateTimer];
    }
  }
  else
  {
  }
}

- (id)newDeviceWithPeripheral:(id)a3 withAdvertisementData:(id)a4 withRSSI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[EPDevice isInRangeWithRSSI:v10])
  {
    id v11 = [[EPDeviceInfo alloc] initWithPeer:v8];
    id v12 = [(EPDeviceInfo *)v11 newPeripheralDeviceWithAdvertisementData:v9 withRSSI:v10];
    if (v12)
    {
      double v13 = [v8 identifier];
      [(NSMutableDictionary *)self->_devicesDictionary setObject:v12 forKeyedSubscript:v13];
      [(EPDeviceCollection *)self _updateTimer];
      [(NSMutableDictionary *)self->_deviceInfos setObject:v11 forKeyedSubscript:v13];
      [(EPDeviceInfo *)v11 setDelegate:self];
      BOOL v14 = +[EPFactory queue];
      uint64_t v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      uint64_t v18 = sub_10008BDC4;
      int64_t v19 = &unk_100165530;
      uint64_t v20 = self;
      id v21 = v12;
      dispatch_async(v14, &v16);

      [(EPDeviceCollection *)self update];
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)newDeviceWithPeer:(id)a3
{
  id v4 = a3;
  id v5 = [[EPDeviceInfo alloc] initWithPeer:v4];
  id v6 = [(EPDeviceInfo *)v5 newCentralDevice];
  if (v6)
  {
    id v7 = [v4 identifier];
    [(NSMutableDictionary *)self->_devicesDictionary setObject:v6 forKeyedSubscript:v7];
    [(EPDeviceCollection *)self _updateTimer];
    [(NSMutableDictionary *)self->_deviceInfos setObject:v5 forKeyedSubscript:v7];
    [(EPDeviceInfo *)v5 setDelegate:self];
    id v8 = +[EPFactory queue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008BF54;
    v10[3] = &unk_100165530;
    v10[4] = self;
    id v11 = v6;
    dispatch_async(v8, v10);
  }
  return v6;
}

- (void)deviceInfo:(id)a3 peerDidInvalidate:(id)a4
{
  uint64_t v6 = [a4 identifier:a3];
  uint64_t v7 = v6;
  if (a4)
  {
    uint64_t v9 = v6;
    uint64_t v6 = [(NSMutableDictionary *)self->_devicesDictionary objectForKeyedSubscript:v6];
    uint64_t v7 = v9;
    if (v6)
    {
      id v8 = (void *)v6;
      [(EPDeviceCollection *)self update];

      uint64_t v7 = v9;
    }
  }

  _objc_release_x1(v6, v7);
}

- (void)deviceInfoDeviceDidDeallocate:(id)a3
{
  id v5 = a3;
  id v4 = [v5 uuid];
  [(NSMutableDictionary *)self->_deviceInfos removeObjectForKey:v4];
  if (objc_opt_respondsToSelector()) {
    [(EPDeviceCollectionDelegate *)self->_delegate collection:self deviceInfoDidDealloc:v5];
  }
}

- (void)deviceInfoPairingFailure:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(EPDeviceCollectionDelegate *)delegate collectionPairingFailure:self];
  }
}

- (void)deviceInfoPairingSuccess:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(EPDeviceCollectionDelegate *)delegate collectionPairingSuccess:self];
  }
}

- (NSMutableDictionary)devicesDictionary
{
  return self->_devicesDictionary;
}

- (NSMutableSet)displayableDevices
{
  return self->_displayableDevices;
}

- (NSMutableSet)proximateDevices
{
  return self->_proximateDevices;
}

- (NSMutableDictionary)classicDevicesDictionary
{
  return self->_classicDevicesDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classicDevicesDictionary, 0);
  objc_storeStrong((id *)&self->_proximateDevices, 0);
  objc_storeStrong((id *)&self->_displayableDevices, 0);
  objc_storeStrong((id *)&self->_devicesDictionary, 0);
  objc_storeStrong((id *)&self->me, 0);
  objc_storeStrong((id *)&self->_purgeTimer, 0);
  objc_storeStrong((id *)&self->_classicDeviceInfos, 0);
  objc_storeStrong((id *)&self->_deviceInfos, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end