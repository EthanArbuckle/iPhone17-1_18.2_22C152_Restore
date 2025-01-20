@interface _NIServerTestWiFiOnlySession
- (_NIServerTestWiFiOnlySession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (_NIWiFiRangingTestConfiguration)configuration;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)_addPeers:(id)a3;
- (id)_disableWiFiAndReturnError;
- (id)_removePeers:(id)a3;
- (id)addObject:(id)a3;
- (id)configure;
- (id)disableAllServices;
- (id)lastConfiguration;
- (id)pauseWithSource:(int64_t)a3;
- (id)removeObject:(id)a3;
- (id)run;
- (unint64_t)requiresSpatialInteractionBluetoothResource;
- (void)_handleFailedToAddPeer;
- (void)_handleFailedToRemovePeer;
- (void)_stopWiFiRanging:(id)a3;
- (void)_triggerWiFiRanging:(id)a3;
- (void)bluetoothAdvertisingAddressChanged:(unint64_t)a3;
- (void)device:(id)a3 rediscovered:(id)a4;
- (void)deviceDiscovered:(id)a3;
- (void)deviceLost:(id)a3;
- (void)invalidate;
- (void)peerInactivityPeriodExceeded:(id)a3;
- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4;
- (void)wifiRangingRangeError:(const int *)a3;
- (void)wifiRangingRangeResults:(const void *)a3;
- (void)wifiRangingReadiness:(const int *)a3;
@end

@implementation _NIServerTestWiFiOnlySession

- (_NIServerTestWiFiOnlySession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_opt_class();
  if (v11 != objc_opt_class())
  {
    v29 = +[NSAssertionHandler currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"_NIServerTestWiFiOnlySession.mm" lineNumber:43 description:@"_NIWiFiRangingTestConfiguration given invalid configuration."];

    if (a5) {
      goto LABEL_3;
    }
LABEL_21:
    v30 = +[NSAssertionHandler currentHandler];
    [v30 handleFailureInMethod:a2, self, @"_NIServerTestWiFiOnlySession.mm", 44, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a5) {
    goto LABEL_21;
  }
LABEL_3:
  v34.receiver = self;
  v34.super_class = (Class)_NIServerTestWiFiOnlySession;
  id v12 = [(NIServerBaseSession *)&v34 initWithResourcesManager:v9 configuration:v10 error:a5];
  if (!v12) {
    goto LABEL_18;
  }
  uint64_t v13 = [v9 clientConnectionQueue];
  v14 = (void *)*((void *)v12 + 9);
  *((void *)v12 + 9) = v13;

  id v15 = [v10 copy];
  v16 = (void *)*((void *)v12 + 14);
  *((void *)v12 + 14) = v15;

  v17 = [NINearbyUpdatesEngine alloc];
  uint64_t v18 = *((void *)v12 + 14);
  uint64_t v19 = *((void *)v12 + 9);
  v20 = [v9 analytics];
  if (v9)
  {
    [v9 protobufLogger];
  }
  else
  {
    uint64_t v32 = 0;
    v33 = 0;
  }
  v21 = [(NINearbyUpdatesEngine *)v17 initWithConfiguration:v18 queue:v19 delegate:v12 dataSource:v12 analyticsManager:v20 protobufLogger:&v32 error:a5];
  v22 = (void *)*((void *)v12 + 6);
  *((void *)v12 + 6) = v21;

  if (v33) {
    sub_10001A970(v33);
  }

  if (v9)
  {
    [v9 protobufLogger];
    long long v23 = v31;
  }
  else
  {
    long long v23 = 0uLL;
  }
  v24 = (std::__shared_weak_count *)*((void *)v12 + 11);
  *((_OWORD *)v12 + 5) = v23;
  if (v24) {
    sub_10001A970(v24);
  }
  v25 = operator new(0x88uLL);
  v25[1] = 0;
  v25[2] = 0;
  void *v25 = off_1008561C8;
  sub_1002D7118((unsigned char *)v25 + 24);
  v26 = (std::__shared_weak_count *)*((void *)v12 + 13);
  *((void *)v12 + 12) = v25 + 3;
  *((void *)v12 + 13) = v25;
  if (v26) {
    sub_10001A970(v26);
  }
  if (*((void *)v12 + 6)) {
    v27 = (_NIServerTestWiFiOnlySession *)v12;
  }
  else {
LABEL_18:
  }
    v27 = 0;

  return v27;
}

- (void)invalidate
{
  if (self->_wifiRangingSession.__ptr_.__value_)
  {
    v2 = [(_NIServerTestWiFiOnlySession *)self _disableWiFiAndReturnError];
    v3 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,Invalidate. Error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (id)disableAllServices
{
  p_wifiRangingSession = (uint64_t *)&self->_wifiRangingSession;
  value = self->_wifiRangingSession.__ptr_.__value_;
  if (value)
  {
    sub_10002E098((const std::string *)value);
    sub_1001A0B70(p_wifiRangingSession, 0);
    sub_1001A0B70(p_wifiRangingSession, 0);
  }
  return 0;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)2000;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (id)configure
{
  configuration = self->_configuration;
  if (!configuration) {
    sub_10042E824();
  }
  int v4 = [(_NIWiFiRangingTestConfiguration *)configuration peerDiscoveryToken];

  if (v4)
  {
    v5 = [(_NIWiFiRangingTestConfiguration *)self->_configuration parameters];

    if (v5)
    {
      v21.receiver = self;
      v21.super_class = (Class)_NIServerTestWiFiOnlySession;
      v6 = [(NIServerBaseSession *)&v21 resourcesManager];
      v7 = self;
      v8 = [v6 btResource];
      [v8 startAdvertising];

      id v9 = [v6 btResource];
      [v9 startScanning];

      id v10 = [v6 btResource];
      if (v11)
      {
        id v26 = v10;
        id v12 = [objc_alloc((Class)NSData) initWithBytes:&v26 length:6];
        uint64_t v13 = sub_10001D404();
        sub_10001D4A4((uint64_t)v13, v12);
      }
      v14 = [v6 serverSessionIdentifier];
      id v15 = [v14 UUIDString];

      sub_100004950(&__p, (char *)[v15 UTF8String]);
      operator new();
    }
    NSErrorUserInfoKey v22 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v23 = @"Missing WiFi ranging parameters.";
    v16 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    uint64_t v17 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v16];
  }
  else
  {
    NSErrorUserInfoKey v24 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v25 = @"Peer discovery token nil or invalid.";
    v16 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v17 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v16];
  }
  uint64_t v18 = (void *)v17;

  return v18;
}

- (id)run
{
  self->_shouldDeliverUpdates = 1;
  v10.receiver = self;
  v10.super_class = (Class)_NIServerTestWiFiOnlySession;
  v3 = [(NIServerBaseSession *)&v10 resourcesManager];
  int v4 = [v3 lifecycleSupervisor];
  [v4 runWithConfigurationCalled];

  v5 = [(_NIWiFiRangingTestConfiguration *)self->_configuration peerDiscoveryToken];
  char v11 = v5;
  v6 = +[NSArray arrayWithObjects:&v11 count:1];

  v7 = [(_NIServerTestWiFiOnlySession *)self _addPeers:v6];
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042E850();
    }
    [(_NIServerTestWiFiOnlySession *)self _handleFailedToAddPeer];
  }
  else
  {
    v8 = [v3 lifecycleSupervisor];
    [v8 startedDiscoveringPeersWithTokens:v6];
  }

  return v7;
}

- (id)pauseWithSource:(int64_t)a3
{
  self->_shouldDeliverUpdates = 0;
  int v4 = [(_NIServerTestWiFiOnlySession *)self disableAllServices];
  v8.receiver = self;
  v8.super_class = (Class)_NIServerTestWiFiOnlySession;
  v5 = [(NIServerBaseSession *)&v8 resourcesManager];
  v6 = [v5 lifecycleSupervisor];
  [v6 pauseCalled];

  return v4;
}

- (unint64_t)requiresSpatialInteractionBluetoothResource
{
  return 2;
}

- (void)bluetoothAdvertisingAddressChanged:(unint64_t)a3
{
  unint64_t v5 = a3;
  id v3 = [objc_alloc((Class)NSData) initWithBytes:&v5 length:6];
  int v4 = sub_10001D404();
  sub_10001D4A4((uint64_t)v4, v3);
}

- (void)deviceDiscovered:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[NINearbyObject objectFromBluetoothDevice:v4];
  if (v5)
  {
    if (self->_pbLogger.__ptr_)
    {
      double v6 = sub_100006C38();
      ptr = self->_pbLogger.__ptr_;
      id v8 = [v4 u64Identifier];
      sub_100290760(v5, (uint64_t)__p);
      sub_10029C56C((uint64_t)ptr, (uint64_t)v8, (uint64_t)__p, v6);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    [(_NIServerTestWiFiOnlySession *)self _triggerWiFiRanging:v4];
  }
  else
  {
    id v9 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10042E8B8(v9);
    }
  }
}

- (void)device:(id)a3 rediscovered:(id)a4
{
}

- (void)deviceLost:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id v6 = [v4 u64Identifier];
    }
    else {
      id v6 = 0;
    }
    int v9 = 134217984;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,device 0x%llx lost. stopping wifi ranging", (uint8_t *)&v9, 0xCu);
  }

  value = self->_wifiRangingSession.__ptr_.__value_;
  if (value)
  {
    sub_10002E19C((uint64_t)value);
  }
  else
  {
    id v8 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,no wifi ranging session to stop", (uint8_t *)&v9, 2u);
    }
  }
}

- (id)addObject:(id)a3
{
  id v3 = a3;
  id v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,addObject noop: %@", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (id)removeObject:(id)a3
{
  id v3 = a3;
  id v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,remove noop: %@", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (void)_triggerWiFiRanging:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 u64Identifier];
    id v7 = qword_1008ABDE0;
    if (self->_wifiRangingSession.__ptr_.__value_)
    {
      uint64_t v8 = (uint64_t)v6;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        configuration = self->_configuration;
        *(_DWORD *)buf = 134218242;
        uint64_t v28 = v8;
        __int16 v29 = 2112;
        v30 = configuration;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,_triggerWiFiRanging. Identifier: 0x%llx, WiFi ranging config: %@", buf, 0x16u);
      }
      id v10 = [(_NIWiFiRangingTestConfiguration *)self->_configuration parameters];
      char v11 = [v10 objectForKeyedSubscript:@"RangingRole"];

      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (([v11 isEqualToString:@"Initiator"] & 1) == 0)
        {
          if ([v11 isEqualToString:@"Responder"])
          {
            int v12 = 2;
            goto LABEL_15;
          }
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
            sub_10042EA34();
          }
        }
      }
      else
      {
        v14 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
          sub_10042E9B8((uint64_t *)&self->_configuration, v14);
        }
      }
      int v12 = 1;
LABEL_15:
      sub_10002DC88((uint64_t)buf, v8, v12);
      sub_10002E458((uint64_t)self->_wifiRangingSession.__ptr_.__value_, (uint64_t)buf);
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042E940(v7, v15, v16, v17, v18, v19, v20, v21);
    }
    v26.receiver = self;
    v26.super_class = (Class)_NIServerTestWiFiOnlySession;
    NSErrorUserInfoKey v22 = [(NIServerBaseSession *)&v26 resourcesManager];
    CFStringRef v23 = [v22 remote];
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    CFStringRef v32 = @"Failed to start WiFi service. session is nil";
    NSErrorUserInfoKey v24 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    CFStringRef v25 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v24];
    [v23 uwbSessionDidFailWithError:v25];
  }
  else
  {
    uint64_t v13 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042E8FC(v13);
    }
  }
}

- (void)_stopWiFiRanging:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 u64Identifier];
    id v7 = qword_1008ABDE0;
    if (self->_wifiRangingSession.__ptr_.__value_)
    {
      id v8 = v6;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        configuration = self->_configuration;
        *(_DWORD *)buf = 134218242;
        id v24 = v8;
        __int16 v25 = 2112;
        objc_super v26 = configuration;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,_stopWiFiRanging. Identifier: 0x%llx, WiFi ranging config: %@", buf, 0x16u);
      }
      sub_10002E19C((uint64_t)self->_wifiRangingSession.__ptr_.__value_);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10042EAEC(v7, v11, v12, v13, v14, v15, v16, v17);
      }
      v22.receiver = self;
      v22.super_class = (Class)_NIServerTestWiFiOnlySession;
      uint64_t v18 = [(NIServerBaseSession *)&v22 resourcesManager];
      uint64_t v19 = [v18 remote];
      NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
      CFStringRef v28 = @"Failed to stop WiFi service. session is nil";
      uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      uint64_t v21 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v20];
      [v19 uwbSessionDidFailWithError:v21];
    }
  }
  else
  {
    id v10 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042EAA8(v10);
    }
  }
}

- (id)_addPeers:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_NIServerTestWiFiOnlySession;
  unint64_t v5 = [(NIServerBaseSession *)&v19 resourcesManager];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v6);
      }
      id v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      uint64_t v11 = [v5 btResource:v15];
      uint64_t v12 = [v10 rawToken];
      uint64_t v13 = [v11 addPeerDiscoveryToken:v12];

      if (v13) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)_removePeers:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)_NIServerTestWiFiOnlySession;
  id v16 = a3;
  id v3 = [(NIServerBaseSession *)&v21 resourcesManager];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v16;
  unint64_t v5 = 0;
  id v6 = [v4 countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v8);
        id v10 = [v3 btResource];
        uint64_t v11 = [v9 rawToken];
        uint64_t v12 = [v10 removePeerDiscoveryToken:v11];

        if (v12)
        {
          id v13 = v12;

          uint64_t v14 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v23 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#ses-wifi-test,#warning, failed to remove peer with error: %@", buf, 0xCu);
          }
          unint64_t v5 = v13;
        }

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v24 count:16];
    }
    while (v6);
  }

  return v5;
}

- (void)_handleFailedToAddPeer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v5.receiver = self;
  v5.super_class = (Class)_NIServerTestWiFiOnlySession;
  id v3 = [(NIServerBaseSession *)&v5 resourcesManager];
  id v4 = [v3 lifecycleSupervisor];
  [v4 failedToAddPeer];

  [(_NIServerTestWiFiOnlySession *)self invalidate];
}

- (void)_handleFailedToRemovePeer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v5.receiver = self;
  v5.super_class = (Class)_NIServerTestWiFiOnlySession;
  id v3 = [(NIServerBaseSession *)&v5 resourcesManager];
  id v4 = [v3 lifecycleSupervisor];
  [v4 failedToRemovePeer];

  [(_NIServerTestWiFiOnlySession *)self invalidate];
}

- (id)_disableWiFiAndReturnError
{
  p_wifiRangingSession = (uint64_t *)&self->_wifiRangingSession;
  value = self->_wifiRangingSession.__ptr_.__value_;
  if (value) {
    sub_10002E098((const std::string *)value);
  }
  sub_1001A0B70(p_wifiRangingSession, 0);
  sub_1001A0B70(p_wifiRangingSession, 0);
  return 0;
}

- (void)wifiRangingRangeResults:(const void *)a3
{
}

- (void)wifiRangingRangeError:(const int *)a3
{
  sub_10002EC8C(*a3, __p);
  if (v14 >= 0) {
    id v4 = __p;
  }
  else {
    id v4 = (void **)__p[0];
  }
  objc_super v5 = +[NSString stringWithUTF8String:v4];
  id v6 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10042EB64(&v14, __p, v6);
  }
  NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
  id v16 = v5;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  uint64_t v8 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v7];

  clientQueue = self->_clientQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10030065C;
  v11[3] = &unk_100846588;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)clientQueue, v11);

  if (v14 < 0) {
    operator delete(__p[0]);
  }
}

- (void)wifiRangingReadiness:(const int *)a3
{
  id v4 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sub_10002ECD0(*a3, __p);
    if (v7 >= 0) {
      objc_super v5 = __p;
    }
    else {
      objc_super v5 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,Readiness update: %s", buf, 0xCu);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }
}

- (void)peerInactivityPeriodExceeded:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v11.receiver = self;
  v11.super_class = (Class)_NIServerTestWiFiOnlySession;
  objc_super v5 = [(NIServerBaseSession *)&v11 resourcesManager];
  id v6 = [v5 btResource];
  char v7 = [v6 deviceCache];
  uint64_t v8 = [v4 rawToken];
  unsigned __int8 v9 = [v7 uncacheDeviceByTokenData:v8];

  if ((v9 & 1) == 0 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10042EC58();
  }
  if (self->_wifiRangingSession.__ptr_.__value_)
  {
    id v10 = [(_NIServerTestWiFiOnlySession *)self pauseWithSource:2];
    if (v10 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042EBF0();
    }
  }
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  id v5 = a4;
  id v6 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#ses-wifi-test,didUpdateNearbyObjects enter", buf, 2u);
  }
  clientQueue = self->_clientQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100300A64;
  v9[3] = &unk_100846588;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)clientQueue, v9);
}

- (_NIWiFiRangingTestConfiguration)configuration
{
  return (_NIWiFiRangingTestConfiguration *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  cntrl = (std::__shared_weak_count *)self->_caManager.__cntrl_;
  if (cntrl) {
    sub_10001A970(cntrl);
  }
  id v4 = (std::__shared_weak_count *)self->_pbLogger.__cntrl_;
  if (v4) {
    sub_10001A970(v4);
  }
  objc_storeStrong((id *)&self->_clientQueue, 0);
  sub_1001A0B70((uint64_t *)&self->_wifiRangingSession, 0);

  objc_storeStrong((id *)&self->_updatesEngine, 0);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  return self;
}

@end