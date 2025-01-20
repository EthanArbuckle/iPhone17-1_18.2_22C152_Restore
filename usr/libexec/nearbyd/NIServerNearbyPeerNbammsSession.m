@interface NIServerNearbyPeerNbammsSession
- (BOOL)_doesWantTriggeredDutyCycledAcquisition;
- (BOOL)shouldBypassBleDiscovery;
- (NIServerNearbyPeerNbammsSession)initWithDataSource:(id)a3 delegate:(id)a4 clientQueue:(id)a5;
- (float)_adjustDutyCycleForInterfaceDelays:(float)a3 schedulingInterval:(unsigned int)a4;
- (float)_getDutyCycleForTriggeredDutyCycledAcquisition;
- (id).cxx_construct;
- (id)_triggerRanging:(id)a3;
- (id)configure;
- (id)run;
- (int)_getRangingAcquisitionType;
- (int)_getRangingTriggerType;
- (optional<SecondarySchedulingParameters>)_getSecondarySchedulingParameters;
- (optional<rose::RoseServiceRequest>)_prepareServiceRequestForDiscoveryToken:(SEL)a3 nbUwbAcquisitionBandChannel:(id)a4;
- (optional<unsigned)_getDitherConst;
- (shared_ptr<rose::objects::NBAMMSSession>)_buildRoseSession:(const void *)a3;
- (unsigned)_getNbUwbAcquisitionBandChannel:(id)a3;
- (unsigned)_getRangingTimeoutWithKey:(id)a3 timeoutIfNoOverride:(unsigned __int16)a4;
- (unsigned)_getSchedulingIntervalForTriggeredDutyCycledAcquisition;
- (void)_nbammsSessionInvalidatedWithReason:(int)a3;
- (void)device:(id)a3 rediscovered:(id)a4;
- (void)deviceDiscovered:(id)a3;
- (void)didReceiveNewSolution:(const void *)a3;
- (void)didReceiveRemoteData:(const void *)a3;
- (void)didReceiveUnsuccessfulSolution:(const void *)a3;
- (void)invalidate;
- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3;
- (void)updatePeerData:(const void *)a3;
@end

@implementation NIServerNearbyPeerNbammsSession

- (NIServerNearbyPeerNbammsSession)initWithDataSource:(id)a3 delegate:(id)a4 clientQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NIServerNearbyPeerNbammsSession;
  v11 = [(NIServerNearbyPeerNbammsSession *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataSource, v8);
    objc_storeWeak((id *)&v12->_delegate, v9);
    objc_storeStrong((id *)&v12->_clientQueue, a5);
    v13 = [v8 getResourcesManager];
    v14 = v13;
    if (v13)
    {
      [v13 protobufLogger];
      shared_ptr<rose::protobuf::Logger> v15 = v19;
    }
    else
    {
      shared_ptr<rose::protobuf::Logger> v15 = (shared_ptr<rose::protobuf::Logger>)0;
    }
    cntrl = (std::__shared_weak_count *)v12->_pbLogger.__cntrl_;
    v12->_pbLogger = v15;
    if (cntrl) {
      sub_10001A970(cntrl);
    }

    *(_WORD *)&v12->_useTestNbammsMode = 0;
    v17 = v12;
  }

  return v12;
}

- (id)configure
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!self->_nbammsSession.__ptr_)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v5 = [WeakRetained getNIConfiguration];
    id v6 = [v5 copy];

    if (([v6 isExtendedDistanceMeasurementEnabled] & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100429738();
      }
      uint64_t v18 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
      goto LABEL_34;
    }
    v7 = [v6 debugParameters];
    id v8 = [v7 objectForKey:@"useTestNbammsMode"];

    if (v8)
    {
      id v9 = [v6 debugParameters];
      id v10 = [v9 objectForKey:@"useTestNbammsMode"];
      self->_useTestNbammsMode = [v10 BOOLValue];

      v11 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_useTestNbammsMode) {
          v12 = "Y";
        }
        else {
          v12 = "N";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#peer-nba,NBAMMS test mode used: %s", buf, 0xCu);
      }
    }
    v13 = sub_100007D00();
    BOOL v14 = sub_1003D2ECC((uint64_t)v13);
    shared_ptr<rose::protobuf::Logger> v15 = +[NSUserDefaults standardUserDefaults];
    unsigned int v16 = [v15 BOOLForKey:@"DisableNIPeerExtendedDistanceOverride"];

    if (v16)
    {
      v17 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#peer-nba,* disable extended distance measurement through default writes.", buf, 2u);
      }
      goto LABEL_31;
    }
    if (!v14)
    {
LABEL_31:
      v33 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#peer-nba,Invalidating NBAMMS session configuration - device does not support NBAMMS", buf, 2u);
      }
      uint64_t v18 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5889 userInfo:0];
      goto LABEL_34;
    }
    shared_ptr<rose::protobuf::Logger> v19 = [v6 peerDiscoveryToken];
    objc_super v20 = [v19 deviceCapabilities];
    unsigned int v21 = [v20 supportsExtendedDistanceMeasurement];

    v22 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      v23 = "N";
      if (v21) {
        v23 = "Y";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#peer-nba,Peer supports NBAMMS %s", buf, 0xCu);
    }
    if ((v21 & 1) != 0 || self->_useTestNbammsMode)
    {
      v24 = [v6 peerDiscoveryToken];
      BOOL v25 = v24 == 0;

      if (!v25)
      {
        v26 = [WeakRetained getResourcesManager];
        v27 = [v26 discoveryToken];

        if (!v27)
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
            sub_10042969C();
          }
          v3 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
          goto LABEL_69;
        }
        v28 = [v6 peerDiscoveryToken];
        id v47 = 0;
        unsigned __int8 v29 = [WeakRetained shouldInitiate:v27 peerDiscoveryToken:v28 error:&v47];
        id v30 = v47;
        self->_BOOL isInitiator = v29;

        if (v30)
        {
          v31 = (id)qword_1008ABDE0;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            id v45 = [v30 description];
            id v46 = [v45 UTF8String];
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v46;
            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "#peer-nba,Unable to determine initiator: %s", buf, 0xCu);
          }
          uint64_t v32 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
        }
        else
        {
          BOOL isInitiator = self->_isInitiator;
          v39 = v27;
          if (!self->_isInitiator)
          {
            v39 = [v6 peerDiscoveryToken];
          }
          uint64_t v40 = [(NIServerNearbyPeerNbammsSession *)self _getNbUwbAcquisitionBandChannel:v39];
          if (!isInitiator) {

          }
          v41 = [v6 peerDiscoveryToken];
          [(NIServerNearbyPeerNbammsSession *)self _prepareServiceRequestForDiscoveryToken:v41 nbUwbAcquisitionBandChannel:v40];
          memcpy(buf, __src, 0x1F9uLL);

          if (buf[504])
          {
            [(NIServerNearbyPeerNbammsSession *)self _buildRoseSession:buf];
            shared_ptr<rose::objects::NBAMMSSession> v42 = (shared_ptr<rose::objects::NBAMMSSession>)__src[0];
            __src[0] = 0uLL;
            cntrl = (std::__shared_weak_count *)self->_nbammsSession.__cntrl_;
            self->_nbammsSession = v42;
            if (cntrl)
            {
              sub_10001A970(cntrl);
              if (*((void *)&__src[0] + 1)) {
                sub_10001A970(*((std::__shared_weak_count **)&__src[0] + 1));
              }
              ptr = self->_nbammsSession.__ptr_;
            }
            else
            {
              ptr = v42.__ptr_;
            }
            if (ptr)
            {
              v3 = 0;
LABEL_68:

LABEL_69:
              goto LABEL_35;
            }
            if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
              sub_100429704();
            }
          }
          else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
          {
            sub_1004296D0();
          }
          uint64_t v32 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:0];
        }
        v3 = (void *)v32;
        goto LABEL_68;
      }
      uint64_t v35 = -5888;
    }
    else
    {
      v36 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_useTestNbammsMode) {
          v37 = "Y";
        }
        else {
          v37 = "N";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "#peer-nba,Invalidating NBAMMS session configuration - peer does not support NBAMMS; testNbammsMode = %s",
          buf,
          0xCu);
      }
      uint64_t v35 = -5881;
    }
    uint64_t v18 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:v35 userInfo:0];
LABEL_34:
    v3 = (void *)v18;
LABEL_35:

    goto LABEL_36;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10042976C();
  }
  v3 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5880 userInfo:0];
LABEL_36:

  return v3;
}

- (id)run
{
  if (!self->_nbammsSession.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_1004297A0();
    }
    uint64_t v6 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
    goto LABEL_9;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  BOOL useTestNbammsMode = self->_useTestNbammsMode;
  v4 = qword_1008ABDE0;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
  if (useTestNbammsMode)
  {
    if (v5)
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#peer-nba,Test Nbamms mode not gated by BT, start ranging immediately", (uint8_t *)__p, 2u);
    }
    uint64_t v6 = [(NIServerNearbyPeerNbammsSession *)self _triggerRanging:0];
LABEL_9:
    v7 = (void *)v6;
    goto LABEL_10;
  }
  if (v5)
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#peer-nba,POR MAC mode", (uint8_t *)__p, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v10 = [WeakRetained getResourcesManager];
  unsigned int v11 = [(NIServerNearbyPeerNbammsSession *)self _getRangingTriggerType];
  v12 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v11 ? "TriggerRequired" : "NoTriggerRequired";
    sub_100004950(__p, v13);
    BOOL v14 = v20 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#peer-nba,ranging trigger type %s", buf, 0xCu);
    if (v20 < 0) {
      operator delete(__p[0]);
    }
  }

  if (v11
    || ([(NIServerNearbyPeerNbammsSession *)self _triggerRanging:0],
        (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    shared_ptr<rose::protobuf::Logger> v15 = [v10 btResource];
    [v15 setBleRSSIThresholdHint:4294967176];

    unsigned int v16 = [v10 btResource];
    [v16 startAdvertising];

    if ([v10 isBackgroundOperationAllowed])
    {
      v17 = [v10 btResource];
      [v17 allowScreenOffOperation:1];
    }
    uint64_t v18 = [v10 btResource];
    [v18 startScanning];

    v7 = 0;
  }
  else
  {
  }
LABEL_10:

  return v7;
}

- (BOOL)shouldBypassBleDiscovery
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"FindingUseDiscovery"];

  return v3 ^ 1;
}

- (void)deviceDiscovered:(id)a3
{
  id v4 = a3;
  BOOL v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#peer-nba,Device discovered", (uint8_t *)__p, 2u);
  }
  if (self->_pbLogger.__ptr_)
  {
    double v6 = sub_100006C38();
    v7 = +[NINearbyObject objectFromBluetoothDevice:v4];
    if (v7)
    {
      ptr = self->_pbLogger.__ptr_;
      id v9 = [v4 u64Identifier];
      sub_100290760(v7, (uint64_t)__p);
      sub_10029C56C((uint64_t)ptr, (uint64_t)v9, (uint64_t)__p, v6);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
  }
  if ([(NIServerNearbyPeerNbammsSession *)self _getRangingTriggerType]) {
    id v10 = [(NIServerNearbyPeerNbammsSession *)self _triggerRanging:v4];
  }
}

- (void)device:(id)a3 rediscovered:(id)a4
{
  id v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#peer-nba,Device rediscovered", v5, 2u);
  }
}

- (void)updatePeerData:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_1004297D4();
  }
  ptr = self->_nbammsSession.__ptr_;
  if (ptr)
  {
    if (!self->_useTestNbammsMode) {
      sub_1002DBB0C((uint64_t)ptr, (uint64_t *)a3);
    }
  }
}

- (void)didReceiveNewSolution:(const void *)a3
{
  unsigned __int8 v3 = (int *)((char *)a3 + 32);
  if (((*((_DWORD *)a3 + 8) - 1) & 0xFFFFFFFD) != 0)
  {
    id v4 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_100429808(v3, v4);
    }
  }
  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didReceiveNewSolution:a3];
  }
}

- (void)didReceiveUnsuccessfulSolution:(const void *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didReceiveUnsuccessfulSolution:a3];
}

- (void)didReceiveRemoteData:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_100429884();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didReceiveRemoteData:a3];
}

- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3
{
  unsigned int var2 = a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didServiceRequestUpdateStatus:v4 var2];
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  ptr = self->_nbammsSession.__ptr_;
  if (ptr)
  {
    sub_1002D8288((uint64_t)ptr);
    cntrl = (std::__shared_weak_count *)self->_nbammsSession.__cntrl_;
    self->_nbammsSession.__ptr_ = 0;
    self->_nbammsSession.__cntrl_ = 0;
    if (cntrl)
    {
      sub_10001A970(cntrl);
    }
  }
}

- (id)_triggerRanging:(id)a3
{
  id v4 = a3;
  if (self->_nbammsSession.__ptr_)
  {
    unsigned int v5 = [(NIServerNearbyPeerNbammsSession *)self _getRangingAcquisitionType];
    double v6 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v5 ? "BTAidedAcquisition" : "DirectAcquisition";
      sub_100004950(&__p, v7);
      id v8 = v67[13] >= 0 ? &__p : (void **)__p;
      *(_DWORD *)buf = 136315138;
      v50 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#peer-nba,ranging acquisition type = %s", buf, 0xCu);
      if ((v67[13] & 0x80000000) != 0) {
        operator delete(__p);
      }
    }

    if (v4 || v5 != 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      unsigned int v11 = [WeakRetained getNIConfiguration];
      id v12 = [v11 copy];

      id v45 = v12;
      dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
      v13 = [v12 debugParameters];
      BOOL v14 = v13 == 0;

      unsigned int v47 = 10000000;
      if (!v14)
      {
        shared_ptr<rose::protobuf::Logger> v15 = [v12 debugParameters];
        unsigned int v16 = [v15 objectForKey:@"startTimeUncertainty"];

        if (v16) {
          unsigned int v47 = [v16 intValue];
        }
      }
      uint64_t v17 = [(NIServerNearbyPeerNbammsSession *)self _getSchedulingIntervalForTriggeredDutyCycledAcquisition];
      [(NIServerNearbyPeerNbammsSession *)self _getDutyCycleForTriggeredDutyCycledAcquisition];
      float v19 = v18;
      id v44 = [(NIServerNearbyPeerNbammsSession *)self _getSecondarySchedulingParameters];
      float v22 = v21;
      float v23 = v21;
      int v25 = v24;
      if (v17)
      {
        if (v19 <= 1.0)
        {
          *(float *)&double v20 = v19;
          [(NIServerNearbyPeerNbammsSession *)self _adjustDutyCycleForInterfaceDelays:v17 schedulingInterval:v20];
          float v19 = v26;
          if (v25)
          {
            v27 = qword_1008ABDE0;
            if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(__p) = 0;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#peer-nba,Requested backoff acquisition policy, processing secondary scheduling parameters", (uint8_t *)&__p, 2u);
            }
            if (v19 >= v23)
            {
              int v25 = 1;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
                sub_100429944();
              }
              int v25 = 0;
            }
          }
        }
      }
      if (self->_isInitiator)
      {
        unsigned __int16 v28 = (unsigned __int16)[(NIServerNearbyPeerNbammsSession *)self _getDitherConst];
        int v29 = HIBYTE(v28);
      }
      else
      {
        LOBYTE(v28) = 0;
        int v29 = 0;
      }
      id v30 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(__p) = 67109632;
        if (v29) {
          unsigned __int8 v31 = v28;
        }
        else {
          unsigned __int8 v31 = 0;
        }
        HIDWORD(__p) = v17;
        __int16 v66 = 2048;
        *(double *)v67 = v19;
        *(_WORD *)&v67[8] = 1024;
        *(_DWORD *)&v67[10] = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#peer-nba,Primary scheduling params: Interval(us)=%d, Duty Cycle=%f, Dither const=%d", (uint8_t *)&__p, 0x18u);
      }
      if (v25)
      {
        uint64_t v32 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(__p) = 67109632;
          HIDWORD(__p) = v44;
          __int16 v66 = 1024;
          *(_DWORD *)v67 = HIDWORD(v44);
          *(_WORD *)&v67[4] = 2048;
          *(double *)&v67[6] = v23;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#peer-nba,Secondary scheduling params: Delay(us)=%d, Interval(us)=%d, Duty Cycle=%f", (uint8_t *)&__p, 0x18u);
        }
      }
      LOBYTE(__p) = 0;
      char v68 = 0;
      uint64_t v69 = 17000;
      char v70 = 1;
      unsigned int v71 = v47;
      int v72 = v17;
      float v73 = v19;
      uint64_t v74 = 0;
      __int16 v75 = v28 | (unsigned __int16)((_WORD)v29 << 8);
      uint64_t v76 = 0;
      memset(v78, 0, sizeof(v78));
      uint64_t v77 = 0;
      __int16 v54 = 0;
      int v53 = 0;
      *(_DWORD *)buf = 2;
      LOBYTE(v50) = 0;
      __int16 v51 = 0;
      char v52 = 0;
      char v55 = 1;
      char v56 = 1;
      uint64_t v57 = 17000;
      char v58 = 1;
      unsigned int v59 = v47;
      int v60 = v17;
      float v61 = v19;
      uint64_t v62 = 0;
      __int16 v63 = v75;
      memset(v64, 0, sizeof(v64));
      if (v5 == 1)
      {
        id v34 = [v4 btAdvertisingAddress];
        *(_DWORD *)buf = 2;
        LOBYTE(v50) = 0;
        __int16 v51 = 0;
        char v52 = 0;
        int v53 = (int)v34;
        __int16 v54 = WORD2(v34);
        char v55 = 1;
        char v56 = 1;
        uint64_t v57 = 17000;
        char v58 = 1;
        unsigned int v59 = v47;
        int v60 = v17;
        float v61 = v19;
        uint64_t v62 = 0;
        __int16 v63 = v28 | (unsigned __int16)((_WORD)v29 << 8);
        memset(v64, 0, sizeof(v64));
      }
      else if (!v5 && v25)
      {
        v33 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v48 = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#peer-nba,Resetting NBAMMSStartOptions", v48, 2u);
        }
        __int16 v54 = 0;
        int v53 = 0;
        *(_DWORD *)buf = 2;
        LOBYTE(v50) = 0;
        __int16 v51 = 0;
        char v52 = 0;
        char v55 = 1;
        char v56 = 1;
        uint64_t v57 = 17000;
        char v58 = 1;
        unsigned int v59 = v47;
        int v60 = v17;
        float v61 = v19;
        uint64_t v62 = 0;
        __int16 v63 = v28 | (unsigned __int16)((_WORD)v29 << 8);
        *(_DWORD *)v64 = 0;
        *(_WORD *)&v64[4] = 0;
        *(void *)&v64[6] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | v44;
        *(void *)&v64[14] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | HIDWORD(v44);
        *(float *)&v64[22] = v22;
        v64[26] = 1;
      }
      BOOL useTestNbammsMode = self->_useTestNbammsMode;
      v36 = qword_1008ABDE0;
      BOOL v37 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
      if (useTestNbammsMode)
      {
        if (v37)
        {
          if (v29) {
            unsigned __int8 v38 = v28;
          }
          else {
            unsigned __int8 v38 = 0;
          }
          *(_DWORD *)v48 = 67109120;
          *(_DWORD *)&v48[4] = v38;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "#peer-nba,startRanging dither = %d", v48, 8u);
        }
        p_p = (long long *)&__p;
      }
      else
      {
        if (v37)
        {
          if (HIBYTE(v63)) {
            unsigned __int8 v40 = v63;
          }
          else {
            unsigned __int8 v40 = 0;
          }
          *(_DWORD *)v48 = 67109120;
          *(_DWORD *)&v48[4] = v40;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "#peer-nba,startRanging dither = %d", v48, 8u);
        }
        p_p = (long long *)buf;
      }
      id v9 = WeakRetained;
      int v41 = sub_1002DB434((uint64_t)self->_nbammsSession.__ptr_, p_p);
      if (v41)
      {
        shared_ptr<rose::objects::NBAMMSSession> v42 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          sub_1002DE064(v41, v48);
          sub_1004298EC();
        }

        id v10 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:0];
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      NSErrorUserInfoKey v79 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v80 = @"Didnt receive BT discovered device info";
      id v9 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
      id v10 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v9];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_1004298B8();
    }
    id v10 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:0];
  }

  return v10;
}

- (void)_nbammsSessionInvalidatedWithReason:(int)a3
{
  unsigned int v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1002DE0A8(a3, v7);
    sub_100429978();
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didInvalidateUWBSession];
}

- (shared_ptr<rose::objects::NBAMMSSession>)_buildRoseSession:(const void *)a3
{
  unsigned int v5 = v3;
  double v6 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_dataSource);
  dispatch_assert_queue_V2((dispatch_queue_t)v6->_clientQueue);
  id v8 = [WeakRetained getContainerUniqueIdentifier];
  sub_100004950(__p, (char *)[v8 UTF8String]);

  id v9 = operator new(0x5D8uLL);
  v9[1] = 0;
  v9[2] = 0;
  *id v9 = off_10085BA60;
  uint64_t v10 = (uint64_t)(v9 + 3);
  unsigned int v11 = v6;
  *(void *)buf = off_10085D540;
  v36 = v11;
  BOOL v37 = buf;
  id v12 = v11;
  v34[0] = off_10085D5C0;
  v34[1] = v12;
  v34[3] = v34;
  v13 = v12;
  v33[0] = off_10085D640;
  v33[1] = v13;
  v33[3] = v33;
  BOOL v14 = v13;
  v32[0] = off_10085D6C0;
  v32[1] = v14;
  v32[3] = v32;
  shared_ptr<rose::protobuf::Logger> v15 = v14;
  v31[0] = off_10085D740;
  v31[1] = v15;
  v31[3] = v31;
  v30[3] = 0;
  v29[3] = 0;
  v28[3] = 0;
  v27[3] = 0;
  cntrl = (std::__shared_weak_count *)v15->_pbLogger.__cntrl_;
  ptr = v6->_pbLogger.__ptr_;
  float v26 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit(&cntrl->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1002D7C48(v10, (long long *)__p, (void *)a3, (uint64_t)buf, (uint64_t)v34, (uint64_t)v33, (uint64_t)v32, (uint64_t)v31, (uint64_t)v30, (uint64_t)v29, (uint64_t)v28, (uint64_t)v27, &ptr);
  v9[3] = &off_10085BD30;
  v9[4] = off_10085BDF8;
  if (v26) {
    sub_10001A970(v26);
  }
  sub_1001E1150(v27);
  sub_1001D2B78(v28);
  sub_1001D2BFC(v29);
  sub_1001E11D4(v30);
  sub_1001E1258(v31);
  sub_1001D2C80(v32);
  sub_1001E12DC(v33);
  sub_1001E1258(v34);
  sub_1001D2D04(buf);
  *(void *)&long long v22 = v9 + 3;
  *((void *)&v22 + 1) = v9;
  sub_10001ABCC((uint64_t)&v22, v9 + 5, v10);
  uint64_t v17 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#peer-nba,Registering for UWB service.", buf, 2u);
  }
  int v18 = sub_1002D85F4(v22);
  if (v18)
  {
    float v19 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      sub_1002DE064(v18, buf);
      sub_1004299D0();
    }

    void *v5 = 0;
    v5[1] = 0;
    if (*((void *)&v22 + 1)) {
      sub_10001A970(*((std::__shared_weak_count **)&v22 + 1));
    }
  }
  else
  {
    *(_OWORD *)unsigned int v5 = v22;
  }
  if (v24 < 0) {
    operator delete(__p[0]);
  }

  result.__cntrl_ = v21;
  result.__ptr_ = v20;
  return result;
}

- (optional<rose::RoseServiceRequest>)_prepareServiceRequestForDiscoveryToken:(SEL)a3 nbUwbAcquisitionBandChannel:(id)a4
{
  id v186 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v7 = [WeakRetained getNIConfiguration];
  id v8 = [v7 copy];

  id v9 = [WeakRetained getResourcesManager];
  uint64_t v10 = [v9 discoveryToken];

  v185 = (void *)v10;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042969C();
    }
    goto LABEL_118;
  }
  char v194 = 0;
  char v198 = 0;
  LOBYTE(v199) = 0;
  char v200 = 0;
  char v202 = 0;
  int v192 = 0;
  LOBYTE(v193) = 0;
  LODWORD(v197) = 0;
  *(_DWORD *)((char *)&v197 + 3) = 0;
  LODWORD(v201) = 0;
  *(_DWORD *)((char *)&v201 + 3) = 0;
  memset(v203, 0, sizeof(v203));
  LOBYTE(v207) = 0;
  char v208 = 0;
  unsigned __int8 v206 = 0;
  int v205 = 0;
  __int16 v210 = 0;
  int v209 = 0;
  BOOL v211 = 1;
  char v212 = 0;
  char v213 = 0;
  LOBYTE(v214) = 0;
  char v215 = 0;
  LOBYTE(v216) = 0;
  char v217 = 0;
  long long v218 = 0uLL;
  unsigned __int16 v195 = a5;
  char v196 = 1;
  unsigned int v11 = sub_100007D00();
  unsigned __int8 v204 = sub_1003D2F34((uint64_t)v11);
  id v12 = [v8 debugParameters];
  if (v12)
  {
    v13 = [v8 debugParameters];
    BOOL v14 = [v13 objectForKey:@"nbTxAntenna"];

    if (v14)
    {
      shared_ptr<rose::protobuf::Logger> v15 = [v8 debugParameters];
      unsigned int v16 = [v15 objectForKey:@"nbTxAntenna"];
      LOWORD(v192) = [v16 intValue] | 0x100;
    }
  }
  uint64_t v17 = [v8 debugParameters];
  if (v17)
  {
    int v18 = [v8 debugParameters];
    float v19 = [v18 objectForKey:@"nbRxAntenna"];

    if (v19)
    {
      double v20 = [v8 debugParameters];
      float v21 = [v20 objectForKey:@"nbRxAntenna"];
      HIWORD(v192) = [v21 intValue] | 0x100;
    }
  }
  long long v22 = [v8 debugParameters];
  if (v22)
  {
    float v23 = [v8 debugParameters];
    char v24 = [v23 objectForKey:@"nbPacketType"];

    if (v24)
    {
      int v25 = [v8 debugParameters];
      float v26 = [v25 objectForKey:@"nbPacketType"];
      unsigned __int16 v193 = (unsigned __int16)[v26 intValue];
      char v194 = 1;
    }
  }
  v27 = [v8 debugParameters];
  if (v27)
  {
    unsigned __int16 v28 = [v8 debugParameters];
    int v29 = [v28 objectForKey:@"nbBandChannel"];

    if (v29)
    {
      id v30 = [v8 debugParameters];
      unsigned __int8 v31 = [v30 objectForKey:@"nbBandChannel"];
      unsigned __int16 v195 = (unsigned __int16)[v31 intValue];
      char v196 = 1;
    }
  }
  uint64_t v32 = [v8 debugParameters];
  if (v32)
  {
    v33 = [v8 debugParameters];
    id v34 = [v33 objectForKey:@"mmsTxAntenna"];

    if (v34)
    {
      uint64_t v35 = [v8 debugParameters];
      v36 = [v35 objectForKey:@"mmsTxAntenna"];
      LOWORD(v197) = [v36 intValue] | 0x100;
    }
  }
  BOOL v37 = [v8 debugParameters];
  if (v37)
  {
    unsigned __int8 v38 = [v8 debugParameters];
    v39 = [v38 objectForKey:@"mmsRxAntenna"];

    if (v39)
    {
      unsigned __int8 v40 = [v8 debugParameters];
      int v41 = [v40 objectForKey:@"mmsRxAntenna"];
      WORD1(v197) = [v41 intValue] | 0x100;
    }
  }
  shared_ptr<rose::objects::NBAMMSSession> v42 = [v8 debugParameters];
  if (v42)
  {
    v43 = [v8 debugParameters];
    id v44 = [v43 objectForKey:@"mmsRxSyncAntenna"];

    if (v44)
    {
      id v45 = [v8 debugParameters];
      id v46 = [v45 objectForKey:@"mmsRxSyncAntenna"];
      WORD2(v197) = [v46 intValue] | 0x100;
    }
  }
  unsigned int v47 = [v8 debugParameters];
  if (v47)
  {
    v48 = [v8 debugParameters];
    v49 = [v48 objectForKey:@"mmsPacketType"];

    if (v49)
    {
      v50 = [v8 debugParameters];
      __int16 v51 = [v50 objectForKey:@"mmsPacketType"];
      HIWORD(v197) = (unsigned __int16)[v51 intValue];
      char v198 = 1;
    }
  }
  char v52 = [v8 debugParameters];
  if (v52)
  {
    int v53 = [v8 debugParameters];
    __int16 v54 = [v53 objectForKey:@"mmsPSR"];

    if (v54)
    {
      char v55 = [v8 debugParameters];
      char v56 = [v55 objectForKey:@"mmsPSR"];
      *(_WORD *)v203 = [v56 intValue] | 0x100;
    }
  }
  uint64_t v57 = [v8 debugParameters];
  if (v57)
  {
    char v58 = [v8 debugParameters];
    unsigned int v59 = [v58 objectForKey:@"mmsGap"];

    if (v59)
    {
      int v60 = [v8 debugParameters];
      float v61 = [v60 objectForKey:@"mmsGap"];
      *(_WORD *)&v203[2] = [v61 intValue] | 0x100;
    }
  }
  uint64_t v62 = [v8 debugParameters];
  if (v62)
  {
    __int16 v63 = [v8 debugParameters];
    v64 = [v63 objectForKey:@"mmsSeqIdx"];

    if (v64)
    {
      v65 = [v8 debugParameters];
      __int16 v66 = [v65 objectForKey:@"mmsSeqIdx"];
      *(_WORD *)&v203[4] = [v66 intValue] | 0x100;
    }
  }
  v67 = [v8 debugParameters];
  if (v67)
  {
    char v68 = [v8 debugParameters];
    uint64_t v69 = [v68 objectForKey:@"mmsBandChannel"];

    if (v69)
    {
      char v70 = [v8 debugParameters];
      unsigned int v71 = [v70 objectForKey:@"mmsBandChannel"];
      unsigned __int16 v199 = (unsigned __int16)[v71 intValue];
      char v200 = 1;
    }
  }
  int v72 = [v8 debugParameters];
  if (v72)
  {
    float v73 = [v8 debugParameters];
    uint64_t v74 = [v73 objectForKey:@"nbSlotSize"];

    if (v74)
    {
      __int16 v75 = [v8 debugParameters];
      uint64_t v76 = [v75 objectForKey:@"nbSlotSize"];
      WORD1(v201) = [v76 intValue] | 0x100;
    }
  }
  uint64_t v77 = [v8 debugParameters];
  if (v77)
  {
    v78 = [v8 debugParameters];
    NSErrorUserInfoKey v79 = [v78 objectForKey:@"mmsSlotSize"];

    if (v79)
    {
      CFStringRef v80 = [v8 debugParameters];
      v81 = [v80 objectForKey:@"mmsSlotSize"];
      WORD2(v201) = [v81 intValue] | 0x100;
    }
  }
  v82 = [v8 debugParameters];
  if (v82)
  {
    v83 = [v8 debugParameters];
    v84 = [v83 objectForKey:@"mmsNumFragments"];

    if (v84)
    {
      v85 = [v8 debugParameters];
      v86 = [v85 objectForKey:@"mmsNumFragments"];
      LOWORD(v201) = [v86 intValue] | 0x100;
    }
  }
  v87 = [v8 debugParameters];
  if (v87)
  {
    v88 = [v8 debugParameters];
    v89 = [v88 objectForKey:@"interval"];

    if (v89)
    {
      v90 = [v8 debugParameters];
      v91 = [v90 objectForKey:@"interval"];
      HIWORD(v201) = (unsigned __int16)[v91 intValue];
      char v202 = 1;
    }
  }
  v92 = [v8 debugParameters];
  if (v92)
  {
    v93 = [v8 debugParameters];
    v94 = [v93 objectForKey:@"enableNonInterlacedMMS"];

    if (v94)
    {
      v95 = [v8 debugParameters];
      v96 = [v95 objectForKey:@"enableNonInterlacedMMS"];
      v203[6] = [v96 BOOLValue];
    }
  }
  v97 = [v8 debugParameters];
  if (v97)
  {
    v98 = [v8 debugParameters];
    v99 = [v98 objectForKey:@"enableAntennaDiversity"];

    if (v99)
    {
      v100 = [v8 debugParameters];
      v101 = [v100 objectForKey:@"enableAntennaDiversity"];
      unsigned __int8 v204 = [v101 BOOLValue];
    }
  }
  v102 = [v8 debugParameters];
  if (v102)
  {
    v103 = [v8 debugParameters];
    v104 = [v103 objectForKey:@"useDedicatedAntennas"];

    if (v104)
    {
      v105 = [v8 debugParameters];
      v106 = [v105 objectForKey:@"useDedicatedAntennas"];
      BYTE1(v205) = [v106 BOOLValue];
    }
  }
  v107 = [v8 debugParameters];
  if (v107)
  {
    v108 = [v8 debugParameters];
    v109 = [v108 objectForKey:@"overrideDefaultAntenna"];

    if (v109)
    {
      v110 = [v8 debugParameters];
      v111 = [v110 objectForKey:@"overrideDefaultAntenna"];
      BYTE2(v205) = [v111 BOOLValue];
    }
  }
  v112 = [v8 debugParameters];
  if (v112)
  {
    v113 = [v8 debugParameters];
    v114 = [v113 objectForKey:@"useTestNbammsMode"];

    if (v114)
    {
      v115 = [v8 debugParameters];
      v116 = [v115 objectForKey:@"useTestNbammsMode"];
      unsigned __int8 v206 = [v116 BOOLValue];
    }
  }
  v117 = [v8 debugParameters];
  if (v117)
  {
    v118 = [v8 debugParameters];
    v119 = [v118 objectForKey:@"antennaDiversityMask"];

    if (v119)
    {
      v120 = [v8 debugParameters];
      v121 = [v120 objectForKey:@"antennaDiversityMask"];
      HIBYTE(v205) = [v121 intValue];
    }
  }
  v122 = sub_100007D00();
  LOBYTE(v205) = sub_1003D2F34((uint64_t)v122);
  v123 = +[NSUserDefaults standardUserDefaults];
  unsigned int v124 = [v123 BOOLForKey:@"DisableDualRxChain"];

  if (v124) {
    LOBYTE(v205) = 0;
  }
  BOOL useTestNbammsMode = self->_useTestNbammsMode;
  v126 = (id)qword_1008ABDE0;
  BOOL v127 = os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT);
  if (useTestNbammsMode)
  {
    if (v127)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "#peer-nba,Test NBAMMS mode enabled", buf, 2u);
    }

    unsigned __int8 v206 = 1;
    uint64_t v216 = 0x1010101010101010;
    char v217 = 1;
    v128 = [v8 debugParameters];
    if (v128)
    {
      v129 = [v8 debugParameters];
      v130 = [v129 objectForKey:@"baseMacAddress"];
      BOOL v131 = v130 == 0;

      if (!v131)
      {
        v132 = [v8 debugParameters];
        v133 = [v132 objectForKey:@"baseMacAddress"];

        if (v133)
        {
          uint64_t v216 = (uint64_t)[v133 longLongValue];
          char v217 = 1;
        }
      }
    }
    if (!v215) {
      char v215 = 1;
    }
    __int16 v214 = 4864;
LABEL_81:
    int v219 = 6;
    sub_100180DEC((char *)&v192, !self->_isInitiator, (uint64_t)buf);
    operator new();
  }
  if (v127)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "#peer-nba,POR NBAMMS mode enabled", buf, 2u);
  }

  unsigned __int8 v206 = 0;
  v134 = [v8 debugParameters];
  if (v134)
  {
    v135 = [v8 debugParameters];
    v136 = [v135 objectForKey:@"nbChannelSelectionMask"];
    BOOL v137 = v136 == 0;

    if (!v137)
    {
      v138 = [v8 debugParameters];
      v139 = [v138 objectForKey:@"nbChannelSelectionMask"];
      unsigned __int16 v140 = (unsigned __int16)[v139 intValue];
      if (!v208) {
        char v208 = 1;
      }
      unsigned __int16 v207 = v140;
    }
  }
  v141 = [v8 debugParameters];
  if (v141)
  {
    v142 = [v8 debugParameters];
    v143 = [v142 objectForKey:@"napSlotSize"];
    BOOL v144 = v143 == 0;

    if (!v144)
    {
      v145 = [v8 debugParameters];
      v146 = [v145 objectForKey:@"napSlotSize"];
      unsigned __int8 v147 = [v146 intValue];
      if (!BYTE1(v209)) {
        BYTE1(v209) = 1;
      }
      LOBYTE(v209) = v147;
    }
  }
  v148 = [v8 debugParameters];
  if (v148)
  {
    v149 = [v8 debugParameters];
    v150 = [v149 objectForKey:@"dataSlotSize"];
    BOOL v151 = v150 == 0;

    if (!v151)
    {
      v152 = [v8 debugParameters];
      v153 = [v152 objectForKey:@"dataSlotSize"];
      unsigned __int8 v154 = [v153 intValue];
      if (!HIBYTE(v209)) {
        HIBYTE(v209) = 1;
      }
      BYTE2(v209) = v154;
    }
  }
  v155 = [v8 debugParameters];
  if (v155)
  {
    v156 = [v8 debugParameters];
    v157 = [v156 objectForKey:@"useType2Addr"];
    BOOL v158 = v157 == 0;

    if (!v158)
    {
      v159 = [v8 debugParameters];
      v160 = [v159 objectForKey:@"useType2Addr"];
      BOOL v211 = [v160 intValue] != 0;
    }
  }
  if (!v186) {
    __assert_rtn("-[NIServerNearbyPeerNbammsSession _prepareServiceRequestForDiscoveryToken:nbUwbAcquisitionBandChannel:]", "NIServerNearbyPeerNbammsSession.mm", 683, "token != nil");
  }
  v161 = [v186 getIRK];
  v162 = v161;
  if (!v161)
  {
    v171 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR)) {
      sub_100429A28();
    }

LABEL_118:
    retstr->var0.__null_state_ = 0;
    retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
    goto LABEL_119;
  }
  if ([v161 length] != (id)16) {
    __assert_rtn("-[NIServerNearbyPeerNbammsSession _prepareServiceRequestForDiscoveryToken:nbUwbAcquisitionBandChannel:]", "NIServerNearbyPeerNbammsSession.mm", 691, "[peerIRK length] == kNbammsIRKLengthBytes");
  }
  v163 = [v185 getIRK];
  v164 = v163;
  if (v163)
  {
    if ([v163 length] != (id)16) {
      __assert_rtn("-[NIServerNearbyPeerNbammsSession _prepareServiceRequestForDiscoveryToken:nbUwbAcquisitionBandChannel:]", "NIServerNearbyPeerNbammsSession.mm", 698, "[selfIRK length] == kNbammsIRKLengthBytes");
    }
    id v165 = v164;
    id v166 = v162;
    id v183 = v165;
    if ([v165 length] == (id)16 && objc_msgSend(v166, "length") == (id)16)
    {
      v167 = [v165 bytes];
      v168 = [v166 bytes];
      id v169 = objc_alloc_init((Class)NSMutableData);
      for (uint64_t i = 0; i != 16; ++i)
      {
        buf[0] = v168[i] ^ v167[i];
        [v169 appendBytes:buf length:1];
      }
      if ([v169 length] != (id)16) {
        __assert_rtn("generateCombinedIRK", "NIServerNearbyPeerNbammsSession.mm", 1112, "[xorIRK length] == kNbammsIRKLengthBytes");
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100429A90();
      }
      id v169 = 0;
    }

    if (v169)
    {
      id v173 = v169;
      long long v218 = *(_OWORD *)[v173 bytes];
      id v174 = v173;
      [v174 bytes];
      uint64_t v175 = SipHash();

      uint64_t v216 = v175;
      char v217 = 1;
      unsigned int v176 = [(NIServerNearbyPeerNbammsSession *)self _getRangingAcquisitionType];
      v177 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
      {
        v178 = v176 ? "BTAidedAcquisition" : "DirectAcquisition";
        sub_100004950(buf, v178);
        v179 = v189 >= 0 ? buf : *(uint8_t **)buf;
        *(_DWORD *)v190 = 136315138;
        v191 = v179;
        _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_DEFAULT, "#peer-nba,ranging acquisition type = %s", v190, 0xCu);
        if (v189 < 0) {
          operator delete(*(void **)buf);
        }
      }

      if (v176 == 1)
      {
        __int16 v180 = 4865;
        if (v215) {
          goto LABEL_137;
        }
      }
      else
      {
        if (v176)
        {
LABEL_138:

          goto LABEL_81;
        }
        __int16 v180 = 4864;
        if (v215)
        {
LABEL_137:
          __int16 v214 = v180;
          goto LABEL_138;
        }
      }
      char v215 = 1;
      goto LABEL_137;
    }
    v182 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR)) {
      sub_100429A5C();
    }

    retstr->var0.__null_state_ = 0;
    retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
  }
  else
  {
    v181 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR)) {
      sub_100429A28();
    }

    retstr->var0.__null_state_ = 0;
    retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
  }
LABEL_119:

  return result;
}

- (unsigned)_getRangingTimeoutWithKey:(id)a3 timeoutIfNoOverride:(unsigned __int16)a4
{
  int v4 = a4;
  id v5 = a3;
  double v6 = +[NSUserDefaults standardUserDefaults];
  v7 = [v6 objectForKey:v5];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v8 = [v7 intValue];
    id v9 = qword_1008ABDE0;
    BOOL v10 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
    if (v8 < 0x10000)
    {
      if (v10)
      {
        int v16 = 138412546;
        id v17 = v5;
        __int16 v18 = 1024;
        int v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#peer-nba,Timeout override found for key %@. Returning %d", (uint8_t *)&v16, 0x12u);
      }
      LOWORD(v4) = v8;
    }
    else
    {
      LOWORD(v4) = -1;
      if (v10)
      {
        int v16 = 138412802;
        id v17 = v5;
        __int16 v18 = 1024;
        int v19 = v8;
        __int16 v20 = 1024;
        int v21 = 0xFFFF;
        unsigned int v11 = "#peer-nba,Timeout override found for key %@. Override value %d exceeds max value %d. Returning max value.";
        id v12 = v9;
        uint32_t v13 = 24;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
      }
    }
  }
  else
  {
    uint64_t v14 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 1024;
      int v19 = v4;
      unsigned int v11 = "#peer-nba,No timeout override found for key %@. Returning timeout %d";
      id v12 = v14;
      uint32_t v13 = 18;
      goto LABEL_8;
    }
  }

  return v4;
}

- (int)_getRangingTriggerType
{
  if ([(NIServerNearbyPeerNbammsSession *)self shouldBypassBleDiscovery]) {
    return 0;
  }
  if (self->_useTestNbammsMode) {
    sub_100429AC4();
  }
  return 1;
}

- (int)_getRangingAcquisitionType
{
  if ([(NIServerNearbyPeerNbammsSession *)self shouldBypassBleDiscovery]) {
    return 0;
  }
  if (self->_useTestNbammsMode) {
    sub_100429AF0();
  }
  return ![(NIServerNearbyPeerNbammsSession *)self _doesWantTriggeredDutyCycledAcquisition];
}

- (BOOL)_doesWantTriggeredDutyCycledAcquisition
{
  unsigned int v3 = [(NIServerNearbyPeerNbammsSession *)self _getSchedulingIntervalForTriggeredDutyCycledAcquisition];
  [(NIServerNearbyPeerNbammsSession *)self _getDutyCycleForTriggeredDutyCycledAcquisition];
  return v4 <= 1.0 && v3 != 0;
}

- (unsigned)_getSchedulingIntervalForTriggeredDutyCycledAcquisition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  float v4 = [WeakRetained getNIConfiguration];
  id v5 = [v4 copy];

  if (self->_isInitiator) {
    int v6 = 30000;
  }
  else {
    int v6 = 29000;
  }
  v7 = +[NSUserDefaults standardUserDefaults];
  unsigned int v8 = [v7 BOOLForKey:@"FindingDisableDutyCycledAcquisition"];

  if (v8) {
    unsigned int v9 = 0;
  }
  else {
    unsigned int v9 = v6;
  }
  BOOL v10 = +[NSUserDefaults standardUserDefaults];
  unsigned int v11 = [v10 objectForKey:@"FindingSchedulingInterval"];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v9 = [v11 intValue];
    }
  }
  id v12 = [v5 debugParameters];

  if (v12)
  {
    uint32_t v13 = [v5 debugParameters];
    uint64_t v14 = [v13 objectForKey:@"schedulingInterval"];

    if (v14) {
      unsigned int v9 = [v14 intValue];
    }
  }
  return v9;
}

- (float)_getDutyCycleForTriggeredDutyCycledAcquisition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  float v4 = [WeakRetained getNIConfiguration];
  id v5 = [v4 copy];

  if (self->_isInitiator) {
    float v6 = 0.0;
  }
  else {
    float v6 = 0.1034;
  }
  v7 = +[NSUserDefaults standardUserDefaults];
  unsigned int v8 = [v7 BOOLForKey:@"FindingDisableDutyCycledAcquisition"];

  if (v8) {
    float v6 = 0.0;
  }
  unsigned int v9 = +[NSUserDefaults standardUserDefaults];
  BOOL v10 = [v9 objectForKey:@"FindingDutyCycle"];

  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      float v6 = v11;
    }
  }
  id v12 = [v5 debugParameters];

  if (v12)
  {
    uint32_t v13 = [v5 debugParameters];
    uint64_t v14 = [v13 objectForKey:@"dutyCycle"];

    if (v14)
    {
      [v14 floatValue];
      float v6 = v15;
    }
  }
  return v6;
}

- (float)_adjustDutyCycleForInterfaceDelays:(float)a3 schedulingInterval:(unsigned int)a4
{
  float v5 = (float)((unint64_t)(a4 - 17000) - 2000);
  if ((float)((float)a4 * a3) > v5)
  {
    float v6 = qword_1008ABDE0;
    a3 = v5 / (float)a4;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#peer-nba,Provided duty cycle leads to scan window > scheduling interval - (start time offset + interface delays), using entire available scan window", v8, 2u);
    }
  }
  return a3;
}

- (optional<unsigned)_getDitherConst
{
  if (self->_isInitiator)
  {
    unsigned int v3 = +[NSUserDefaults standardUserDefaults];
    unsigned int v4 = [v3 BOOLForKey:@"FindingDisableDitheredAcq"];

    if (v4)
    {
      float v5 = qword_1008ABDE0;
      BOOL v6 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
      __int16 v7 = 0;
      unsigned __int8 v8 = 0;
      if (v6)
      {
        __int16 v21 = 0;
        unsigned int v9 = "#peer-nba,Dithered duty cycled acquisition is disabled using defaults write";
        BOOL v10 = (uint8_t *)&v21;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
        __int16 v7 = 0;
        unsigned __int8 v8 = 0;
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      uint32_t v13 = [WeakRetained getNIConfiguration];
      id v14 = [v13 copy];

      float v15 = +[NSUserDefaults standardUserDefaults];
      int v16 = [v15 objectForKey:@"FindingDitherConst"];

      if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        unsigned __int8 v8 = [v16 intValue];
      }
      else {
        unsigned __int8 v8 = 10;
      }
      id v17 = [v14 debugParameters];

      if (v17)
      {
        __int16 v18 = [v14 debugParameters];
        int v19 = [v18 objectForKey:@"ditherConst"];

        if (v19) {
          unsigned __int8 v8 = [v19 intValue];
        }
      }
      __int16 v7 = 1;
    }
  }
  else
  {
    float v5 = qword_1008ABDE0;
    BOOL v11 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
    __int16 v7 = 0;
    unsigned __int8 v8 = 0;
    if (v11)
    {
      *(_WORD *)buf = 0;
      unsigned int v9 = "#peer-nba,Dithered duty cycled acquisition not valid for responder";
      BOOL v10 = buf;
      goto LABEL_7;
    }
  }
  return (optional<unsigned char>)(v8 | (unsigned __int16)(v7 << 8));
}

- (optional<SecondarySchedulingParameters>)_getSecondarySchedulingParameters
{
  if (self->_isInitiator)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
      sub_100429B1C();
    }
    unsigned int v4 = 0;
    LOBYTE(v5) = 0;
    unsigned int v6 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    unsigned int v9 = [WeakRetained getNIConfiguration];
    id v10 = [v9 copy];

    BOOL v11 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v12 = [v11 BOOLForKey:@"FindingDisableDutyCycledAcquisition"];

    if (v12)
    {
      unsigned int v4 = 0;
      LOBYTE(v5) = 0;
      unsigned int v6 = 0;
    }
    else
    {
      uint32_t v13 = +[NSUserDefaults standardUserDefaults];
      id v14 = [v13 objectForKey:@"FindingSecondarySchedulingDelay"];

      v43 = v14;
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        unsigned int v15 = [v14 intValue];
        int v16 = 1;
      }
      else
      {
        unsigned int v15 = 0;
        int v16 = 0;
      }
      id v17 = [v10 debugParameters:v43];

      if (v17)
      {
        __int16 v18 = [v10 debugParameters];
        int v19 = [v18 objectForKey:@"secondarySchedulingDelay"];

        if (v19)
        {
          unsigned int v15 = [v19 intValue];
          int v16 = 1;
        }
      }
      if (v15) {
        BOOL v20 = v16 == 0;
      }
      else {
        BOOL v20 = 1;
      }
      if (v20) {
        int v5 = 30000000;
      }
      else {
        int v5 = v15;
      }
      __int16 v21 = +[NSUserDefaults standardUserDefaults];
      long long v22 = [v21 objectForKey:@"FindingSecondarySchedulingInterval"];

      if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        LODWORD(v2) = [v22 intValue];
        int v23 = 1;
      }
      else
      {
        LODWORD(v2) = 0;
        int v23 = 0;
      }
      char v24 = [v10 debugParameters];

      if (v24)
      {
        int v25 = [v10 debugParameters];
        float v26 = [v25 objectForKey:@"secondarySchedulingInterval"];

        if (v26)
        {
          LODWORD(v2) = [v26 intValue];
          int v23 = 1;
        }
      }
      if (v2) {
        BOOL v27 = v23 == 0;
      }
      else {
        BOOL v27 = 1;
      }
      if (v27) {
        uint64_t v2 = 59000;
      }
      else {
        uint64_t v2 = v2;
      }
      unsigned __int16 v28 = +[NSUserDefaults standardUserDefaults];
      int v29 = [v28 objectForKey:@"FindingSecondaryDutyCycle"];

      float v30 = 0.0;
      if (v29)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v29 floatValue];
          float v30 = v31;
          int v32 = 1;
        }
        else
        {
          int v32 = 0;
        }
      }
      else
      {
        int v32 = 0;
      }
      v33 = [v10 debugParameters];

      if (v33)
      {
        id v34 = [v10 debugParameters];
        uint64_t v35 = [v34 objectForKey:@"secondaryDutyCycle"];

        if (v35)
        {
          [v35 floatValue];
          float v30 = v36;
          int v32 = 1;
        }
      }
      HIDWORD(v37) = 0;
      BOOL v39 = v30 > 1.0 || v30 <= 0.0 || v32 == 0;
      LODWORD(v37) = 1028658089;
      if (!v39) {
        *(float *)&double v37 = v30;
      }
      [(NIServerNearbyPeerNbammsSession *)self _adjustDutyCycleForInterfaceDelays:v2 schedulingInterval:v37];
      unsigned int v3 = v40;
      unsigned int v6 = v5 & 0xFFFFFF00;

      unsigned int v4 = &_mh_execute_header;
    }
  }
  unint64_t v41 = v6 & 0xFFFFFF00 | v5 | (unint64_t)(v2 << 32);
  unint64_t v42 = (unint64_t)v4 & (unint64_t)&_mh_execute_header | v3;
  *(void *)&result.var0.var1.unsigned int var2 = v42;
  *(void *)&result.var0.var0 = v41;
  return result;
}

- (unsigned)_getNbUwbAcquisitionBandChannel:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (self->_useTestNbammsMode)
  {
    unsigned __int8 v6 = 5;
  }
  else
  {
    __int16 v7 = [v4 objectInRawTokenOPACKDictForKey:&off_100878910];

    if (v7)
    {
      unsigned __int8 v8 = [v5 objectInRawTokenOPACKDictForKey:&off_100878910];
      unsigned __int8 v6 = [v8 integerValue];
    }
    else
    {
      unsigned int v9 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100429B50(v9);
      }
      unsigned __int8 v6 = 2;
    }
  }
  if (self->_useTestNbammsMode) {
    char v10 = 1;
  }
  else {
    char v10 = 6;
  }
  LOBYTE(v16) = v10;
  *(_WORD *)((char *)&v16 + 1) = 0;
  LOWORD(v17) = v6;
  BYTE2(v17) = 1;
  int v11 = sub_1003A8F90((unsigned __int8 *)&v16);
  unsigned __int8 v12 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL useTestNbammsMode = self->_useTestNbammsMode;
    BOOL isInitiator = self->_isInitiator;
    int v16 = 67109888;
    int v17 = useTestNbammsMode;
    __int16 v18 = 1024;
    BOOL v19 = isInitiator;
    __int16 v20 = 1024;
    int v21 = v6;
    __int16 v22 = 1024;
    int v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#peer-nba,startRangingWithPeer: testMode: %d, isInitiator: %d, NapChIdx: %d, NapBch: %d", (uint8_t *)&v16, 0x1Au);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  cntrl = (std::__shared_weak_count *)self->_nbammsSession.__cntrl_;
  if (cntrl) {
    sub_10001A970(cntrl);
  }
  id v4 = (std::__shared_weak_count *)self->_pbLogger.__cntrl_;
  if (v4)
  {
    sub_10001A970(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end