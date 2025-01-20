@interface NIServerFindingRangingProvider
- (BOOL)_doesWantTriggeredDutyCycledAcquisition;
- (BOOL)canRangeWithPeer:(id)a3 technology:(int)a4;
- (NIServerFindingRangingProvider)initWithIdentifier:(const void *)a3 isFinder:(BOOL)a4 consumer:(id)a5 queue:(id)a6 pbLogger:(shared_ptr<rose::protobuf::Logger>)a7;
- (NSArray)rangingPeers;
- (float)_adjustDutyCycleForInterfaceDelays:(float)a3 schedulingInterval:(unsigned int)a4;
- (float)_getDutyCycleForTriggeredDutyCycledAcquisition;
- (id).cxx_construct;
- (id)_getDefaultNbammsRangingConfigParameters;
- (id)_triggerRanging:(RoseServiceRequest *)a3 peerDiscoveryToken:(id)a4 technology:(int)a5 sharedProtocol:(int)a6;
- (id)clientQueue;
- (id)printableState;
- (id)startRangingWithPeer:(id)a3 technology:(int)a4 peerAdvertisement:(id)a5 OOBRangingParameters:(const OOBRangingParameters *)a6;
- (id)stopRangingWithPeer:(id)a3;
- (int)rangingAcquisitionType;
- (int)rangingTriggerType;
- (optional<SecondarySchedulingParameters>)_getFindingSecondarySchedulingParameters;
- (optional<rose::RoseServiceRequest>)_prepareNbammsServiceRequestForDiscoveryToken:(SEL)a3 technology:(id)a4 useCase:(int)a5 nbMask:(int)a6 nbUwbAcquisitionBandChannel:(unsigned __int8)a7 mmsSlotSizeMsec:(unsigned __int16)a8;
- (optional<rose::RoseServiceRequest>)_prepareServiceRequestForDiscoveryToken:(SEL)a3 technology:(id)a4 useCase:(int)a5 nbMask:(int)a6 nbUwbAcquisitionBandChannel:(unsigned __int8)a7 mmsSlotSizeMsec:(unsigned __int16)a8;
- (optional<unsigned)_getDitherConst;
- (unint64_t)_macAddressForIRK:(id)a3;
- (unsigned)_getSchedulingIntervalForTriggeredDutyCycledAcquisition;
- (vector<rose::finding::Technology,)supportedTechnologies;
- (void)_assignDebugParametersIfAvailable:(id)a3;
- (void)_resetRangingStateForToken:(id)a3;
- (void)_sendHangup:(BOOL)a3 finderGone:(BOOL)a4 findeeGone:(BOOL)a5 token:(id)a6;
- (void)_setInitiator;
- (void)activate;
- (void)dealloc;
- (void)didFailCryptoWithToken:(id)a3;
- (void)didFailMutualAuthWithToken:(id)a3;
- (void)didInvalidateNbammsSessionWithReason:(int)a3 token:(id)a4;
- (void)didReceiveNbammsPeerAlgorithmAidingData:(const void *)a3 signallingData:(const void *)a4 token:(id)a5;
- (void)didReceiveNbammsSessionStatusUpdate:(const ServiceRequestStatusUpdate *)a3 token:(id)a4;
- (void)didReceiveNewNbammsSolution:(const void *)a3 token:(id)a4;
- (void)didReceiveUnsuccessfulNbammsSolution:(const void *)a3 token:(id)a4;
- (void)invalidate;
- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4;
- (void)setAlgorithmAidingData:(const void *)a3 forPeer:(id)a4;
- (void)setDebugParameters:(id)a3;
- (void)setSignallingData:(const void *)a3 forPeer:(id)a4;
@end

@implementation NIServerFindingRangingProvider

- (NIServerFindingRangingProvider)initWithIdentifier:(const void *)a3 isFinder:(BOOL)a4 consumer:(id)a5 queue:(id)a6 pbLogger:(shared_ptr<rose::protobuf::Logger>)a7
{
  ptr = a7.__ptr_;
  BOOL v9 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12) {
    __assert_rtn("-[NIServerFindingRangingProvider initWithIdentifier:isFinder:consumer:queue:pbLogger:]", "NIServerFindingRanging.mm", 3368, "consumer");
  }
  v14 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v36 = sub_1002E0FBC(v9);
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] init", buf, 0xCu);
  }

  v34.receiver = self;
  v34.super_class = (Class)NIServerFindingRangingProvider;
  v15 = [(NIServerFindingRangingProvider *)&v34 init];
  v16 = (id *)v15;
  v17 = v15;
  if (v15)
  {
    std::string::operator=((std::string *)(v15 + 8), (const std::string *)a3);
    v17[32] = v9;
    v17[33] = 0;
    objc_storeWeak(v16 + 5, v12);
    objc_storeStrong(v16 + 6, a6);
    uint64_t v19 = *(void *)ptr;
    uint64_t v18 = *((void *)ptr + 1);
    if (v18) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v18 + 8), 1uLL, memory_order_relaxed);
    }
    v20 = (std::__shared_weak_count *)*((void *)v17 + 8);
    *((void *)v17 + 7) = v19;
    *((void *)v17 + 8) = v18;
    if (v20) {
      sub_10001A970(v20);
    }
    v17[72] = 0;
    uint64_t v21 = objc_opt_new();
    v22 = (void *)*((void *)v17 + 12);
    *((void *)v17 + 12) = v21;

    v23 = +[NSUserDefaults standardUserDefaults];
    unsigned int v24 = [v23 BOOLForKey:@"UseTestNbammsMode"];

    v25 = qword_1008ABDE0;
    BOOL v26 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      if (v26)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#find-range,Using Test Nbamms MAC mode", buf, 2u);
      }
      char v27 = 1;
    }
    else
    {
      if (v26)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#find-range,Using POR Nbamms MAC mode", buf, 2u);
      }
      char v27 = 0;
    }
    v17[104] = v27;
    [v17 _setInitiator];
    v28 = sub_100007D00();
    if (sub_1003D2ECC((uint64_t)v28))
    {
      uint64_t v29 = [v17 _getDefaultNbammsRangingConfigParameters];
      v30 = (void *)*((void *)v17 + 12);
      *((void *)v17 + 12) = v29;
    }
    id v31 = objc_alloc_init((Class)NSMutableDictionary);
    v32 = (void *)*((void *)v17 + 14);
    *((void *)v17 + 14) = v31;
  }
  return (NIServerFindingRangingProvider *)v17;
}

- (void)activate
{
  uint64_t v18 = self;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!LOBYTE(self->_pbLogger.__ptr_))
  {
    v3 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] activate", buf, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      v6 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-range,Consumer is listening for ranging availability", buf, 2u);
      }
      sub_1002551DC(&v18, buf);
      long long v7 = *(_OWORD *)buf;
      memset(buf, 0, sizeof(buf));
      v8 = *(std::__shared_weak_count **)&v18->_activated;
      *(_OWORD *)&v18->_pbLogger.__cntrl_ = v7;
      if (v8)
      {
        sub_10001A970(v8);
        if (*(void *)&buf[8]) {
          sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
        }
      }
      BOOL v9 = sub_1002F6464();
      v10 = *(std::__shared_weak_count **)&v18->_activated;
      cntrl = v18->_pbLogger.__cntrl_;
      v17 = v10;
      if (v10) {
        atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      sub_1002FA4B8((uint64_t)v9, (unint64_t *)&cntrl);
      if (v17) {
        sub_10001A970(v17);
      }
      v11 = sub_1002F6464();
      id v12 = *(std::__shared_weak_count **)&v18->_activated;
      v14 = v18->_pbLogger.__cntrl_;
      v15 = v12;
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      }
      sub_1002F6B1C((uint64_t)v11, (uint64_t *)&v14);
      if (v15) {
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    else if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_100425A6C();
      }
    }
    else
    {
      id v13 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#find-range,Consumer is NOT listening for ranging availability", buf, 2u);
      }
    }
    LOBYTE(v18->_pbLogger.__ptr_) = 1;
  }
}

- (void)invalidate
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-range,invalidate", buf, 2u);
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  [(NSDictionary *)self->_debugParameters allKeys];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        -[NIServerFindingRangingProvider _sendHangup:finderGone:findeeGone:token:](self, "_sendHangup:finderGone:findeeGone:token:", 1);
        [(NIServerFindingRangingProvider *)self _resetRangingStateForToken:v8];
      }
      id v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v5);
  }

  if (self->_pbLogger.__cntrl_)
  {
    BOOL v9 = sub_1002F6464();
    v10 = *(std::__shared_weak_count **)&self->_activated;
    cntrl = self->_pbLogger.__cntrl_;
    id v13 = v10;
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    sub_1002FA594((uint64_t)v9, (unint64_t *)&cntrl);
    if (v13) {
      sub_10001A970(v13);
    }
    v11 = *(std::__shared_weak_count **)&self->_activated;
    self->_pbLogger.__cntrl_ = 0;
    *(void *)&self->_activated = 0;
    if (v11) {
      sub_10001A970(v11);
    }
  }
  LOBYTE(self->_pbLogger.__ptr_) = 0;
}

- (void)dealloc
{
  if (self->_pbLogger.__cntrl_)
  {
    v3 = sub_1002F6464();
    id v4 = *(std::__shared_weak_count **)&self->_activated;
    cntrl = self->_pbLogger.__cntrl_;
    id v8 = v4;
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    sub_1002FA594((uint64_t)v3, (unint64_t *)&cntrl);
    if (v8) {
      sub_10001A970(v8);
    }
    id v5 = *(std::__shared_weak_count **)&self->_activated;
    self->_pbLogger.__cntrl_ = 0;
    *(void *)&self->_activated = 0;
    if (v5) {
      sub_10001A970(v5);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)NIServerFindingRangingProvider;
  [(NIServerFindingRangingProvider *)&v6 dealloc];
}

- (BOOL)canRangeWithPeer:(id)a3 technology:(int)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v6) {
    __assert_rtn("-[NIServerFindingRangingProvider canRangeWithPeer:technology:]", "NIServerFindingRanging.mm", 3468, "token");
  }
  if (!LOBYTE(self->_pbLogger.__ptr_)) {
    goto LABEL_16;
  }
  if (a4 != 1)
  {
    id v13 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
      int v21 = 136315138;
      v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] Do not support UWB only based finding", (uint8_t *)&v21, 0xCu);
    }

    goto LABEL_16;
  }
  long long v7 = sub_100007D00();
  BOOL v8 = sub_1003D2ECC((uint64_t)v7);
  BOOL v9 = (void **)sub_1002F6464();
  uint64_t v10 = (*(unsigned int (**)(void *))(*v9[808] + 72))(v9[808]);
  if (v10 != 1 || !v8)
  {
    long long v15 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
      int v21 = 136315650;
      v22 = v16;
      __int16 v23 = 1024;
      BOOL v24 = v8;
      __int16 v25 = 1024;
      BOOL v26 = v10 == 1;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] Can't range yet, UWB system not ready. Supports NMI: %d, state: %d", (uint8_t *)&v21, 0x18u);
    }

LABEL_16:
    BOOL v12 = 0;
    goto LABEL_17;
  }
  if ([(NSDictionary *)self->_debugParameters count] >= 2)
  {
    if (!LOBYTE(self->_identifier.__r_.var0))
    {
      uint64_t v18 = [(NSDictionary *)self->_debugParameters objectForKey:v6];

      if (!v18)
      {
        uint64_t v19 = +[NIServerFindingNBAMMSSessionManager sharedInstance];
        [v19 logUnservableRangingRequestWithToken:v6 isFinder:LOBYTE(self->_identifier.__r_.var0)];
      }
    }
    v20 = [(NSDictionary *)self->_debugParameters objectForKey:v6];
    BOOL v12 = v20 != 0;
  }
  else
  {
    BOOL v12 = 1;
  }
LABEL_17:

  return v12;
}

- (id)startRangingWithPeer:(id)a3 technology:(int)a4 peerAdvertisement:(id)a5 OOBRangingParameters:(const OOBRangingParameters *)a6
{
  id v10 = a3;
  id v11 = a5;
  BOOL v12 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
    *(_DWORD *)buf = 136315651;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = sub_1002E1ABC(a4);
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] startRangingWithPeer: %{private}@. Technology: %s", buf, 0x20u);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v10) {
    __assert_rtn("-[NIServerFindingRangingProvider startRangingWithPeer:technology:peerAdvertisement:OOBRangingParameters:]", "NIServerFindingRanging.mm", 3507, "token");
  }
  if (!LOBYTE(self->_pbLogger.__ptr_))
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100425AAC();
    }
    NSErrorUserInfoKey v49 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v50 = @"Ranging not activated";
    BOOL v26 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    uint64_t v27 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v26];
    goto LABEL_14;
  }
  if (a4 != 1)
  {
    NSErrorUserInfoKey v47 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v48 = @"Specified technology not supported";
    BOOL v26 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    uint64_t v27 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v26];
LABEL_14:
    v28 = (void *)v27;
LABEL_15:

    goto LABEL_16;
  }
  long long v14 = [(NSDictionary *)self->_debugParameters objectForKey:v10];
  BOOL v15 = v14 == 0;

  if (v15)
  {
    BOOL v26 = [[NIServerFindingRangingProviderPeerInfo alloc] initWithAdvertisement:v11];
    [(NSDictionary *)self->_debugParameters setObject:v26 forKey:v10];
    if (LOBYTE(self->_uwbSystemListener.__cntrl_))
    {
      uint64_t var1 = 0;
      int var0 = 5;
    }
    else if (sub_1002E1C10())
    {
      uint64_t var1 = 1;
      int var0 = 2;
    }
    else
    {
      int var0 = a6->var0;
      uint64_t var1 = a6->var1;
    }
    if (LOBYTE(self->_uwbSystemListener.__cntrl_)) {
      uint8_t v33 = 1;
    }
    else {
      uint8_t v33 = 6;
    }
    buf[0] = v33;
    *(_WORD *)&buf[1] = 0;
    *(_WORD *)&uint8_t buf[4] = var0;
    buf[6] = 1;
    unsigned int v42 = sub_1003A8F90(buf);
    unsigned int v34 = [v11 protocolVersion];
    v35 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v41 = var1;
      int var0_low = LOBYTE(self->_identifier.__r_.var0);
      unsigned int v37 = [v11 protocolVersion];
      *(_DWORD *)buf = 67110400;
      *(_DWORD *)&uint8_t buf[4] = var0_low;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = var0;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&uint8_t buf[16] = v42;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = 1;
      *(_WORD *)&buf[26] = 1024;
      *(_DWORD *)&buf[28] = v37;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v34 != 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "#find-range,startRangingWithPeer: isFinder = %d, NapChIdx = %d, NapBch = %d, selfProtoVer: %d, peerProtoVer: %d, sharedProtoVer: %d", buf, 0x26u);
      uint64_t var1 = v41;
    }

    id v38 = [v11 useCase];
    if (v34) {
      uint64_t v39 = 30;
    }
    else {
      uint64_t v39 = 49;
    }
    [(NIServerFindingRangingProvider *)self _prepareServiceRequestForDiscoveryToken:v10 technology:1 useCase:v38 nbMask:var1 nbUwbAcquisitionBandChannel:v42 mmsSlotSizeMsec:v39];
    if (!buf[504])
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100425AE0();
      }
      NSErrorUserInfoKey v44 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v45 = @"Could not build ranging service request";
      v40 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      v28 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v40];

      goto LABEL_15;
    }
    memcpy(__dst, buf, sizeof(__dst));
    uint64_t v27 = [(NIServerFindingRangingProvider *)self _triggerRanging:__dst peerDiscoveryToken:v10 technology:1 sharedProtocol:v34 != 0];
    goto LABEL_14;
  }
  long long v16 = [(NSDictionary *)self->_debugParameters objectForKey:v10];
  long long v17 = [v16 advertisement];
  unsigned __int8 v18 = [v17 isEqual:v11];

  if ((v18 & 1) == 0)
  {
    uint64_t v19 = [v11 uniqueIdentifier];
    if (v19)
    {
      v20 = [v11 uniqueIdentifier];
      int v21 = [(NSDictionary *)self->_debugParameters objectForKey:v10];
      v22 = [v21 advertisement];
      __int16 v23 = [v22 uniqueIdentifier];
      unsigned int v24 = [v20 isEqualToData:v23];

      int v25 = v24 ^ 1;
    }
    else
    {
      int v25 = 0;
    }

    v32 = [(NSDictionary *)self->_debugParameters objectForKey:v10];
    [v32 setAdvertisement:v11];

    if (v25)
    {
      BOOL v26 = +[NIServerFindingNBAMMSSessionManager sharedInstance];
      [(NIServerFindingRangingProviderPeerInfo *)v26 refreshRangingForToken:v10];
      v28 = 0;
      goto LABEL_15;
    }
  }
  v28 = 0;
LABEL_16:

  return v28;
}

- (id)stopRangingWithPeer:(id)a3
{
  id v4 = a3;
  id v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
    *(_DWORD *)buf = 136315395;
    long long v17 = v6;
    __int16 v18 = 2113;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] stopRangingWithPeer: %{private}@.", buf, 0x16u);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v4) {
    __assert_rtn("-[NIServerFindingRangingProvider stopRangingWithPeer:]", "NIServerFindingRanging.mm", 3604, "token");
  }
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    long long v7 = [(NSDictionary *)self->_debugParameters objectForKey:v4];
    BOOL v8 = v7 == 0;

    if (!v8)
    {
      BOOL v9 = [(NSDictionary *)self->_debugParameters objectForKey:v4];
      BOOL v10 = v9 == 0;

      if (!v10)
      {
        -[NIServerFindingRangingProvider _sendHangup:finderGone:findeeGone:token:](self, "_sendHangup:finderGone:findeeGone:token:", 1);
        [(NIServerFindingRangingProvider *)self _resetRangingStateForToken:v4];
      }
    }
    id v11 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100425B14();
    }
    NSErrorUserInfoKey v14 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v15 = @"Ranging not activated";
    BOOL v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v11 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v12];
  }

  return v11;
}

- (void)setAlgorithmAidingData:(const void *)a3 forPeer:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    long long v7 = [(NSDictionary *)self->_debugParameters objectForKey:v6];

    if (v7)
    {
      BOOL v8 = [(NSDictionary *)self->_debugParameters objectForKey:v6];
      [v8 setAlgorithmAidingData:a3];

      BOOL v9 = +[NIServerFindingNBAMMSSessionManager sharedInstance];
      [v9 updateAlgorithmAidingData:a3 token:v6];
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_100425B7C();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100425B48();
  }
}

- (void)setSignallingData:(const void *)a3 forPeer:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    long long v7 = [(NSDictionary *)self->_debugParameters objectForKey:v6];

    if (v7)
    {
      BOOL v8 = [(NSDictionary *)self->_debugParameters objectForKey:v6];
      [v8 setSignallingData:a3];

      BOOL v9 = +[NIServerFindingNBAMMSSessionManager sharedInstance];
      [v9 updateSignallingData:a3 token:v6];
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_100425BE4();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100425BB0();
  }
}

- (void)_resetRangingStateForToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 descriptionInternal];
      int v8 = 138412290;
      BOOL v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-range,Reset ranging state for token %@", (uint8_t *)&v8, 0xCu);
    }
    long long v7 = +[NIServerFindingNBAMMSSessionManager sharedInstance];
    [v7 unregisterNBAMMSSessionForToken:v4];

    [(NSDictionary *)self->_debugParameters removeObjectForKey:v4];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100425C18();
  }
}

- (void)_sendHangup:(BOOL)a3 finderGone:(BOOL)a4 findeeGone:(BOOL)a5 token:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  id v11 = +[NSUserDefaults standardUserDefaults];
  unsigned int v12 = [v11 BOOLForKey:@"FindingDisableHangup"];

  if (!v12)
  {
    if (!v8 && !v7 && !v6) {
      goto LABEL_25;
    }
    NSErrorUserInfoKey v14 = [(NSDictionary *)self->_debugParameters objectForKey:v10];

    if (!v14)
    {
LABEL_24:
      *(void *)buf = 250000000;
      std::this_thread::sleep_for ((const std::chrono::nanoseconds *)buf);
      goto LABEL_25;
    }
    CFStringRef v15 = [(NSDictionary *)self->_debugParameters objectForKey:v10];
    *(void *)buf = [v15 getSignallingData];
    __int16 v25 = v16;
    char v26 = v17;
    if ((v16 & 0xFF00) == 0)
    {
      __int16 v18 = sub_100007D00();
      BOOL v19 = sub_100005424(v18[144]);
      *(void *)buf = 0;
      LOBYTE(v25) = v19;
      HIBYTE(v25) = 1;
    }
    if (v8)
    {
      v20 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#find-range,Setting hangup bit", v23, 2u);
      }
      *(_WORD *)buf = 257;
      if (!v7)
      {
LABEL_12:
        if (!v6)
        {
LABEL_23:
          [(NIServerFindingRangingProvider *)self setSignallingData:buf forPeer:v10];

          goto LABEL_24;
        }
LABEL_20:
        v22 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int16 v23 = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#find-range,Setting findee_gone bit", v23, 2u);
        }
        *(_WORD *)&uint8_t buf[4] = 257;
        goto LABEL_23;
      }
    }
    else if (!v7)
    {
      goto LABEL_12;
    }
    int v21 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#find-range,Setting finder_gone bit", v23, 2u);
    }
    *(_WORD *)&buf[2] = 257;
    if (!v6) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }
  id v13 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#find-range,Would set hangup bit, but it's disabled in defaults writes", buf, 2u);
  }
LABEL_25:
}

- (vector<rose::finding::Technology,)supportedTechnologies
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    BOOL v6 = sub_100007D00();
    result = (vector<rose::finding::Technology, std::allocator<rose::finding::Technology>> *)sub_1003D2ECC((uint64_t)v6);
    if (result)
    {
      BOOL v7 = (int *)sub_10003B54C((uint64_t)&retstr->__end_cap_, 1uLL);
      result = (vector<rose::finding::Technology, std::allocator<rose::finding::Technology>> *)retstr->__begin_;
      end = retstr->__end_;
      id v10 = &v7[v9];
      *BOOL v7 = 1;
      id v11 = v7 + 1;
      while (end != (int *)result)
      {
        int v12 = *--end;
        *--BOOL v7 = v12;
      }
      retstr->__begin_ = v7;
      retstr->__end_ = v11;
      retstr->__end_cap_.__value_ = v10;
      if (result) {
        operator delete(result);
      }
      retstr->__end_ = v11;
    }
  }
  return result;
}

- (NSArray)rangingPeers
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    v3 = [(NSDictionary *)self->_debugParameters allKeys];
  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (void)setDebugParameters:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = [v4 objectForKey:@"useTestNbammsMode"];

    if (v6)
    {
      BOOL v7 = [v5 objectForKey:@"useTestNbammsMode"];
      LOBYTE(self->_uwbSystemListener.__cntrl_) = [v7 BOOLValue];

      BOOL v8 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        if (LOBYTE(self->_uwbSystemListener.__cntrl_)) {
          uint64_t v9 = "Y";
        }
        else {
          uint64_t v9 = "N";
        }
        int v11 = 136315138;
        int v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-range,Overriding value in _useTestNbammsMode with value provided by client = %s", (uint8_t *)&v11, 0xCu);
      }
      [(NIServerFindingRangingProvider *)self _setInitiator];
    }
    [(NIServerFindingRangingProvider *)self _assignDebugParametersIfAvailable:v5];
    id v10 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-range,Set debug config params", (uint8_t *)&v11, 2u);
    }
  }
}

- (int)rangingTriggerType
{
  return sub_1002E1C10() ^ 1;
}

- (int)rangingAcquisitionType
{
  if (sub_1002E1C10()) {
    return 0;
  }
  else {
    return ![(NIServerFindingRangingProvider *)self _doesWantTriggeredDutyCycledAcquisition];
  }
}

- (id)printableState
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x3032000000;
  v82 = sub_10024B268;
  v83 = sub_10024B278;
  id v84 = (id)objc_opt_new();
  v2 = (void *)v80[5];
  v3 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
  uint64_t ptr_low = LOBYTE(self->_pbLogger.__ptr_);
  uint64_t v5 = BYTE1(self->_identifier.__r_.var0);
  uint64_t cntrl_low = LOBYTE(self->_uwbSystemListener.__cntrl_);
  BOOL v7 = +[NSUserDefaults standardUserDefaults];
  BOOL v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Ranging provider (%s). Activated: %d. Initiator: %d. Test-NBAMMS: %d. FC3: %d", v3, ptr_low, v5, cntrl_low, [v7 BOOLForKey:@"FindingUseFC3"]);
  [v2 addObject:v8];

  uint64_t v9 = (void *)v80[5];
  uint64_t v10 = [(NIServerFindingRangingProvider *)self rangingTriggerType];
  uint64_t v11 = [(NIServerFindingRangingProvider *)self rangingAcquisitionType];
  BOOL v12 = [(NIServerFindingRangingProvider *)self _doesWantTriggeredDutyCycledAcquisition];
  uint64_t v13 = [(NIServerFindingRangingProvider *)self _getSchedulingIntervalForTriggeredDutyCycledAcquisition];
  [(NIServerFindingRangingProvider *)self _getDutyCycleForTriggeredDutyCycledAcquisition];
  float v15 = v14;
  if ((unsigned __int16)[(NIServerFindingRangingProvider *)self _getDitherConst] >= 0x100u)
  {
    unsigned __int16 v17 = (unsigned __int16)[(NIServerFindingRangingProvider *)self _getDitherConst];
    if (v17 <= 0xFFu) {
      sub_10000AE44();
    }
    uint64_t v16 = v17;
  }
  else
  {
    uint64_t v16 = 0;
  }
  __int16 v18 = +[NSString stringWithFormat:@"    Trigger type: %d. Acquisition type: %d. Duty cycle: wants %d, interval %d us, listening %0.1f%%, ditherConst: %d", v10, v11, v12, v13, v15, v16];
  [v9 addObject:v18];

  BOOL v19 = (void *)v80[5];
  LODWORD(v18) = sub_1002E0E98(@"FindingUWBTotalTimeoutSecondsOverride", 0x708u);
  v20 = +[NSString stringWithFormat:@"    Ranging watchdogs: total %d s, event %d ms", v18, sub_1002E0E98(@"FindingUWBEventWatchdogTimeoutMillisecondsOverride", 0x7D0u)];
  [v19 addObject:v20];

  int v21 = (void *)v80[5];
  BOOL v22 = self->_pbLogger.__cntrl_ != 0;
  __int16 v23 = (void **)sub_1002F6464();
  int v24 = (*(uint64_t (**)(void *))(*v23[808] + 72))(v23[808]);
  __int16 v25 = v62;
  sub_100004950(v62, off_10085C0C8[v24]);
  if (SBYTE7(v63) < 0) {
    __int16 v25 = (void **)v62[0];
  }
  char v26 = (void **)sub_1002F6464();
  uint64_t v27 = (*(uint64_t (**)(void *))(*v26[808] + 72))(v26[808]);
  sub_100004950(&__p, off_10085C0F0[v27 >> 32]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  uint64_t v29 = +[NSString stringWithFormat:@"    System listener: %d. State: %s. Cause: %s", v22, v25, p_p];
  [v21 addObject:v29];

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SBYTE7(v63) < 0) {
    operator delete(v62[0]);
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obj = self->_debugParameters;
  id v57 = [(NSDictionary *)obj countByEnumeratingWithState:&v74 objects:v85 count:16];
  if (v57)
  {
    uint64_t v55 = *(void *)v75;
    do
    {
      for (i = 0; i != v57; i = (char *)i + 1)
      {
        if (*(void *)v75 != v55) {
          objc_enumerationMutation(obj);
        }
        id v31 = *(id *)(*((void *)&v74 + 1) + 8 * i);
        v32 = [(NSDictionary *)self->_debugParameters objectForKeyedSubscript:v31];
        uint8_t v33 = v32;
        if (v32)
        {
          [v32 getAlgorithmAidingData];
        }
        else
        {
          uint64_t v73 = 0;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          *(_OWORD *)v62 = 0u;
        }
        id v59 = [v33 getSignallingData];
        __int16 v60 = v34;
        char v61 = v35;
        v36 = [v33 advertisement];
        id v37 = [v33 getRangingActive];
        id v38 = (void *)v80[5];
        uint64_t v39 = [v31 descriptionInternal];
        uint64_t v40 = v73;
        int v41 = HIBYTE(v60);
        if (HIBYTE(v60))
        {
          sub_1002452B0(&v59, &__p);
          unsigned int v42 = &__p;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            unsigned int v42 = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
        }
        else
        {
          unsigned int v42 = (std::string *)"0";
        }
        v43 = +[NSString stringWithFormat:@"    Peer: %@. NBAMMS active: %d. Aiding: %d. Signalling: %s", v39, v37, v40, v42];
        [v38 addObject:v43];

        if (v41 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }

        NSErrorUserInfoKey v44 = (void *)v80[5];
        CFStringRef v45 = +[NSString stringWithFormat:@"    Adv: %@", v36];
        [v44 addObject:v45];
      }
      id v57 = [(NSDictionary *)obj countByEnumeratingWithState:&v74 objects:v85 count:16];
    }
    while (v57);
  }

  if (+[NIPlatformInfo isInternalBuild])
  {
    v46 = (void *)v80[5];
    NSErrorUserInfoKey v47 = +[NSString stringWithFormat:@"    Debug params (%d)", [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ count]];
    [v46 addObject:v47];

    ptr = self->_uwbSystemListener.__ptr_;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_10024F9D8;
    v58[3] = &unk_10085BA10;
    v58[4] = &v79;
    [(PRRangingManagerClient *)ptr enumerateKeysAndObjectsUsingBlock:v58];
  }
  NSErrorUserInfoKey v49 = (void *)v80[5];
  CFStringRef v50 = +[NIServerFindingNBAMMSSessionManager sharedInstance];
  v51 = [v50 printableState];
  [v49 addObjectsFromArray:v51];

  id v52 = (id)v80[5];
  _Block_object_dispose(&v79, 8);

  return v52;
}

- (id)clientQueue
{
  return *(id *)&self->_isFinder;
}

- (void)didReceiveNewNbammsSolution:(const void *)a3 token:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    [WeakRetained didRangeWithPeer:v6 newSolution:a3];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100425C4C();
  }
}

- (void)didReceiveUnsuccessfulNbammsSolution:(const void *)a3 token:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    [WeakRetained didAttemptRangingWithPeer:v6 unsuccessfulSolution:a3];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100425C80();
  }
}

- (void)didReceiveNbammsSessionStatusUpdate:(const ServiceRequestStatusUpdate *)a3 token:(id)a4
{
  id v6 = a4;
  BOOL v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
    sub_100004950(v16, off_10085BFB0[a3->var1]);
    int v9 = v17;
    uint64_t v10 = (void **)v16[0];
    sub_100004950(__p, off_10085C028[a3->var2]);
    uint64_t v11 = v16;
    if (v9 < 0) {
      uint64_t v11 = v10;
    }
    if (v15 >= 0) {
      BOOL v12 = __p;
    }
    else {
      BOOL v12 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315650;
    BOOL v19 = v8;
    __int16 v20 = 2080;
    int v21 = v11;
    __int16 v22 = 2080;
    __int16 v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] serviceRequestDidUpdateStatus. Type: %s. Reason: %s", buf, 0x20u);
    if (v15 < 0) {
      operator delete(__p[0]);
    }
    if (v17 < 0) {
      operator delete(v16[0]);
    }
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    if (a3->var2 == 8)
    {
      [(NIServerFindingRangingProvider *)self _resetRangingStateForToken:v6];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
      [WeakRetained didStopRangingWithPeer:v6];
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100425CB4();
  }
}

- (void)didReceiveNbammsPeerAlgorithmAidingData:(const void *)a3 signallingData:(const void *)a4 token:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
  uint64_t v10 = WeakRetained;
  if (WeakRetained)
  {
    if (LOBYTE(self->_pbLogger.__ptr_))
    {
      [WeakRetained didReceiveRangingDataForPeer:v8 algorithmAidingData:a3 signallingData:a4];
      if (!LOBYTE(self->_identifier.__r_.var0)) {
        goto LABEL_21;
      }
      if (*((unsigned char *)a4 + 5) && *((unsigned char *)a4 + 4))
      {
        uint64_t v11 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v12 = [v8 descriptionInternal];
          int v15 = 138412290;
          uint64_t v16 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#find-range,Received findee_gone signal for token %@", (uint8_t *)&v15, 0xCu);
        }
        [(NIServerFindingRangingProvider *)self _resetRangingStateForToken:v8];
        [v10 didStopRangingWithPeer:v8];
        if (!LOBYTE(self->_identifier.__r_.var0))
        {
LABEL_21:
          if (*((unsigned char *)a4 + 3) && *((unsigned char *)a4 + 2))
          {
            uint64_t v13 = (id)qword_1008ABDE0;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              float v14 = [v8 descriptionInternal];
              int v15 = 138412290;
              uint64_t v16 = v14;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#find-range,Received finder_gone signal for token %@", (uint8_t *)&v15, 0xCu);
            }
            [(NIServerFindingRangingProvider *)self _resetRangingStateForToken:v8];
            [v10 didStopRangingWithPeer:v8];
          }
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      sub_100425D1C();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100425CE8();
  }
}

- (void)didInvalidateNbammsSessionWithReason:(int)a3 token:(id)a4
{
  id v6 = a4;
  BOOL v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
    sub_1002DE0A8(a3, v9);
    sub_100425D84();
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    [(NIServerFindingRangingProvider *)self _resetRangingStateForToken:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    [WeakRetained didStopRangingWithPeer:v6];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100425D50();
  }
}

- (void)didFailCryptoWithToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
    sub_100425E08((uint64_t)v6, (uint64_t)&v8, v5);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    [(NIServerFindingRangingProvider *)self _resetRangingStateForToken:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    [WeakRetained didRangingAuthorizationFailForPeer:v4];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100425DD4();
  }
}

- (void)didFailMutualAuthWithToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
    sub_100425E7C((uint64_t)v6, (uint64_t)&v8, v5);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    [(NIServerFindingRangingProvider *)self _resetRangingStateForToken:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    [WeakRetained didRangingAuthorizationFailForPeer:v4];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100425E48();
  }
}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  BOOL v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = sub_1002E0FBC(LOBYTE(self->_identifier.__r_.var0));
    sub_100004950(v22, off_10085C0C8[a3]);
    int v9 = v23;
    uint64_t v10 = (void **)v22[0];
    sub_100004950(__p, off_10085C0F0[a4]);
    uint64_t v11 = v22;
    if (v9 < 0) {
      uint64_t v11 = v10;
    }
    if (v21 >= 0) {
      BOOL v12 = __p;
    }
    else {
      BOOL v12 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315650;
    __int16 v25 = v8;
    __int16 v26 = 2080;
    uint64_t v27 = v11;
    __int16 v28 = 2080;
    uint64_t v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] Ranging service updated state: %s. Cause: %s", buf, 0x20u);
    if (v21 < 0) {
      operator delete(__p[0]);
    }
    if (v23 < 0) {
      operator delete(v22[0]);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector())
    {
      if (objc_opt_respondsToSelector())
      {
        float v14 = *(NSObject **)&self->_isFinder;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100250674;
        block[3] = &unk_10085B8F8;
        block[4] = self;
        int v19 = a3;
        id v18 = WeakRetained;
        dispatch_async(v14, block);

        goto LABEL_17;
      }
      int v15 = "[sConsumer respondsToSelector:@selector(rangingBecameUnavailable)]";
      int v16 = 4015;
    }
    else
    {
      int v15 = "[sConsumer respondsToSelector:@selector(rangingBecameAvailable)]";
      int v16 = 4014;
    }
    __assert_rtn("-[NIServerFindingRangingProvider rangingServiceDidUpdateState:cause:]", "NIServerFindingRanging.mm", v16, v15);
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_100425CE8();
  }
LABEL_17:
}

- (optional<rose::RoseServiceRequest>)_prepareServiceRequestForDiscoveryToken:(SEL)a3 technology:(id)a4 useCase:(int)a5 nbMask:(int)a6 nbUwbAcquisitionBandChannel:(unsigned __int8)a7 mmsSlotSizeMsec:(unsigned __int16)a8
{
  uint64_t v9 = *(void *)&a9;
  uint64_t v10 = a8;
  uint64_t v11 = a7;
  uint64_t v12 = *(void *)&a6;
  id v19 = a4;
  if (!v19) {
    __assert_rtn("-[NIServerFindingRangingProvider _prepareServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:]", "NIServerFindingRanging.mm", 4061, "token");
  }
  int v16 = sub_100007D00();
  BOOL v17 = !sub_1003D2ECC((uint64_t)v16);
  if (a5 != 1) {
    LOBYTE(v17) = 1;
  }
  if (v17)
  {
    retstr->var0.__null_state_ = 0;
    retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
  }
  else
  {
    [(NIServerFindingRangingProvider *)self _prepareNbammsServiceRequestForDiscoveryToken:v19 technology:1 useCase:v12 nbMask:v11 nbUwbAcquisitionBandChannel:v10 mmsSlotSizeMsec:v9];
  }

  return result;
}

- (optional<rose::RoseServiceRequest>)_prepareNbammsServiceRequestForDiscoveryToken:(SEL)a3 technology:(id)a4 useCase:(int)a5 nbMask:(int)a6 nbUwbAcquisitionBandChannel:(unsigned __int8)a7 mmsSlotSizeMsec:(unsigned __int16)a8
{
  char v9 = a9;
  __int16 v11 = a7;
  __dst = retstr;
  id v88 = a4;
  if (!v88) {
    __assert_rtn("-[NIServerFindingRangingProvider _prepareNbammsServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:]", "NIServerFindingRanging.mm", 4084, "token");
  }
  char v95 = 0;
  LOBYTE(v100) = 0;
  char v101 = 0;
  char v103 = 0;
  int v93 = 0;
  LOBYTE(v94) = 0;
  LODWORD(v98) = 0;
  *(_DWORD *)((char *)&v98 + 3) = 0;
  LODWORD(v102) = 0;
  *(_DWORD *)((char *)&v102 + 3) = 0x10000;
  memset(v104, 0, sizeof(v104));
  unsigned __int8 v105 = 1;
  LOBYTE(v108) = 0;
  char v109 = 0;
  int v106 = 0;
  char v107 = 0;
  int v110 = 0;
  unsigned __int8 v112 = 1;
  LOBYTE(v113) = 0;
  char v114 = 0;
  LOBYTE(v115) = 0;
  char v116 = 0;
  LOBYTE(v117) = 0;
  char v118 = 0;
  long long v119 = 0uLL;
  __int16 v111 = v11 | 0x100;
  HIWORD(v98) = 1796;
  char v99 = 1;
  unsigned __int16 v96 = a8;
  char v97 = 1;
  BYTE4(v102) = 4 * v9;
  ptr = self->_uwbSystemListener.__ptr_;
  if (ptr)
  {
    int v15 = [(PRRangingManagerClient *)ptr objectForKey:@"nbTxAntenna"];

    if (v15)
    {
      int v16 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"nbTxAntenna"];
      LOWORD(v93) = [v16 intValue] | 0x100;
    }
    BOOL v17 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"nbRxAntenna", __dst];

    if (v17)
    {
      id v18 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"nbRxAntenna"];
      HIWORD(v93) = [v18 intValue] | 0x100;
    }
    id v19 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"nbPacketType"];

    if (v19)
    {
      __int16 v20 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"nbPacketType"];
      unsigned __int16 v94 = (unsigned __int16)[v20 intValue];
      char v95 = 1;
    }
    char v21 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"nbBandChannel"];

    if (v21)
    {
      __int16 v22 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"nbBandChannel"];
      unsigned __int16 v96 = (unsigned __int16)[v22 intValue];
      char v97 = 1;
    }
    char v23 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsTxAntenna"];

    if (v23)
    {
      int v24 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsTxAntenna"];
      LOWORD(v98) = [v24 intValue] | 0x100;
    }
    __int16 v25 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsRxAntenna"];

    if (v25)
    {
      __int16 v26 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsRxAntenna"];
      WORD1(v98) = [v26 intValue] | 0x100;
    }
    uint64_t v27 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsRxSyncAntenna"];

    if (v27)
    {
      __int16 v28 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsRxSyncAntenna"];
      WORD2(v98) = [v28 intValue] | 0x100;
    }
    uint64_t v29 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsPacketType"];

    if (v29)
    {
      v30 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsPacketType"];
      HIWORD(v98) = (unsigned __int16)[v30 intValue];
      char v99 = 1;
    }
    id v31 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsBandChannel"];

    if (v31)
    {
      v32 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsBandChannel"];
      unsigned __int16 v100 = (unsigned __int16)[v32 intValue];
      char v101 = 1;
    }
    uint8_t v33 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"nbSlotSize"];

    if (v33)
    {
      __int16 v34 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"nbSlotSize"];
      WORD1(v102) = [v34 intValue] | 0x100;
    }
    char v35 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsSlotSize"];

    if (v35)
    {
      v36 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsSlotSize"];
      WORD2(v102) = [v36 intValue] | 0x100;
    }
    id v37 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsNumFragments"];

    if (v37)
    {
      id v38 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsNumFragments"];
      LOWORD(v102) = [v38 intValue] | 0x100;
    }
    uint64_t v39 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"interval"];

    if (v39)
    {
      uint64_t v40 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"interval"];
      HIWORD(v102) = (unsigned __int16)[v40 intValue];
      char v103 = 1;
    }
    int v41 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"enableNonInterlacedMMS"];

    if (v41)
    {
      unsigned int v42 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"enableNonInterlacedMMS"];
      v104[6] = [v42 BOOLValue];
    }
    v43 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"enableAntennaDiversity"];

    if (v43)
    {
      NSErrorUserInfoKey v44 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"enableAntennaDiversity"];
      unsigned __int8 v105 = [v44 BOOLValue];
    }
    CFStringRef v45 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"useDedicatedAntennas"];

    if (v45)
    {
      v46 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"useDedicatedAntennas"];
      BYTE1(v106) = [v46 BOOLValue];
    }
    NSErrorUserInfoKey v47 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"overrideDefaultAntenna"];

    if (v47)
    {
      CFStringRef v48 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"overrideDefaultAntenna"];
      BYTE2(v106) = [v48 BOOLValue];
    }
    NSErrorUserInfoKey v49 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"nbChannelSelectionMask"];

    if (v49)
    {
      CFStringRef v50 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"nbChannelSelectionMask"];
      char v109 = 1;
      unsigned __int16 v108 = (unsigned __int16)[v50 intValue];
    }
    v51 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"napSlotSize"];

    if (v51)
    {
      id v52 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"napSlotSize"];
      BYTE1(v110) = 1;
      LOBYTE(v110) = [v52 intValue];
    }
    v53 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"dataSlotSize"];

    if (v53)
    {
      v54 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"dataSlotSize"];
      HIBYTE(v110) = 1;
      BYTE2(v110) = [v54 intValue];
    }
    uint64_t v55 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"useType2Addr"];

    if (v55)
    {
      v56 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"useType2Addr"];
      unsigned __int8 v112 = [v56 BOOLValue];
    }
    id v57 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"antennaDiversityMask"];

    if (v57)
    {
      v58 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"antennaDiversityMask"];
      HIBYTE(v106) = [v58 intValue];
    }
    id v59 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsPSR"];

    if (v59)
    {
      __int16 v60 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsPSR"];
      *(_WORD *)v104 = [v60 intValue] | 0x100;
    }
    char v61 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsGap"];

    if (v61)
    {
      v62 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsGap"];
      *(_WORD *)&v104[2] = [v62 intValue] | 0x100;
    }
    long long v63 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsSeqIdx"];

    if (v63)
    {
      long long v64 = [(PRRangingManagerClient *)self->_uwbSystemListener.__ptr_ objectForKey:@"mmsSeqIdx"];
      *(_WORD *)&v104[4] = [v64 intValue] | 0x100;
    }
  }
  long long v65 = sub_100007D00();
  LOBYTE(v106) = sub_1003D2F34((uint64_t)v65);
  long long v66 = +[NSUserDefaults standardUserDefaults];
  unsigned int v67 = [v66 BOOLForKey:@"DisableDualRxChain"];

  if (v67) {
    LOBYTE(v106) = 0;
  }
  long long v68 = [v88 getIRK:__dst];
  long long v69 = v68;
  if (v68)
  {
    if ([v68 length] != (id)16) {
      __assert_rtn("-[NIServerFindingRangingProvider _prepareNbammsServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:]", "NIServerFindingRanging.mm", 4215, "[IRK length] == kNbammsIRKLengthBytes");
    }
    id v70 = v69;
    long long v119 = *(_OWORD *)[v70 bytes];
    unint64_t v117 = [(NIServerFindingRangingProvider *)self _macAddressForIRK:v70];
    char v118 = 1;
    int cntrl_low = LOBYTE(self->_uwbSystemListener.__cntrl_);
    long long v72 = (id)qword_1008ABDE0;
    BOOL v73 = os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);
    if (cntrl_low)
    {
      if (v73)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "#find-range,UseTestNbammsMode enabled", buf, 2u);
      }

      char v107 = 1;
      if (!v116) {
        char v116 = 1;
      }
      __int16 v115 = 4864;
      goto LABEL_89;
    }
    if (v73)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "#find-range,UseTestNbammsMode NOT enabled", buf, 2u);
    }

    char v107 = 0;
    unsigned int v75 = [(NIServerFindingRangingProvider *)self rangingAcquisitionType];
    long long v76 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      long long v77 = v75 ? "BTAidedAcquisition" : "DirectAcquisition";
      sub_100004950(buf, v77);
      v78 = v90 >= 0 ? buf : *(uint8_t **)buf;
      *(_DWORD *)v91 = 136315138;
      v92 = v78;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "#find-range,ranging acquisition type = %s", v91, 0xCu);
      if (v90 < 0) {
        operator delete(*(void **)buf);
      }
    }

    if (v75 == 1)
    {
      int v79 = sub_1002E0C44(0);
      if (v79 == 19)
      {
        __int16 v80 = 4865;
        if (v116) {
          goto LABEL_84;
        }
        goto LABEL_83;
      }
      if (v79 != 26)
      {
LABEL_85:
        uint64_t v81 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          if (!v116) {
            sub_10000AE44();
          }
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v115;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "#find-range,Host config usesBLEAdvToTriggerRanging %d", buf, 8u);
        }

LABEL_89:
        v82 = +[NSUserDefaults standardUserDefaults];
        v83 = [v82 objectForKey:@"FindingMMSPacketTypeConfigIndex"];

        if (v83)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned int v113 = [v83 intValue];
            char v114 = 1;
          }
        }
        if (a6) {
          int v84 = 10;
        }
        else {
          int v84 = 9;
        }
        int v120 = v84;
        sub_100180DEC((char *)&v93, BYTE1(self->_identifier.__r_.var0) ^ 1, (uint64_t)buf);
        operator new();
      }
    }
    else if (v75)
    {
      goto LABEL_85;
    }
    __int16 v80 = 4864;
    if (v116)
    {
LABEL_84:
      __int16 v115 = v80;
      goto LABEL_85;
    }
LABEL_83:
    char v116 = 1;
    goto LABEL_84;
  }
  long long v74 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "#find-range,Discovery token doesn't contain valid IRK", buf, 2u);
  }
  unsigned char *__dsta = 0;
  __dsta[504] = 0;

  return result;
}

- (id)_triggerRanging:(RoseServiceRequest *)a3 peerDiscoveryToken:(id)a4 technology:(int)a5 sharedProtocol:(int)a6
{
  id v10 = a4;
  if (!v10) {
    __assert_rtn("-[NIServerFindingRangingProvider _triggerRanging:peerDiscoveryToken:technology:sharedProtocol:]", "NIServerFindingRanging.mm", 4310, "token");
  }
  if (a5 != 1)
  {
    NSErrorUserInfoKey v100 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v101 = @"Specified technology not supported";
    __int16 v25 = +[NSDictionary dictionaryWithObjects:&v101 forKeys:&v100 count:1];
    __int16 v26 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v25];

    goto LABEL_57;
  }
  __int16 v11 = sub_100007D00();
  if (!sub_1003D2ECC((uint64_t)v11))
  {
    NSErrorUserInfoKey v98 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v99 = @"Device does not support specified technology";
    uint64_t v27 = +[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
    __int16 v26 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v27];

    goto LABEL_57;
  }
  unsigned int v58 = 10000000;
  ptr = self->_uwbSystemListener.__ptr_;
  if (ptr)
  {
    uint64_t v13 = [(PRRangingManagerClient *)ptr objectForKey:@"startTimeUncertainty"];
    float v14 = v13;
    if (v13) {
      unsigned int v58 = [v13 intValue];
    }
  }
  uint64_t v15 = [(NIServerFindingRangingProvider *)self _getSchedulingIntervalForTriggeredDutyCycledAcquisition];
  [(NIServerFindingRangingProvider *)self _getDutyCycleForTriggeredDutyCycledAcquisition];
  float v17 = v16;
  id v55 = [(NIServerFindingRangingProvider *)self _getFindingSecondarySchedulingParameters];
  float v57 = v19;
  float v20 = v19;
  int v22 = v21;
  if (v15)
  {
    if (v17 <= 1.0)
    {
      *(float *)&double v18 = v17;
      [(NIServerFindingRangingProvider *)self _adjustDutyCycleForInterfaceDelays:v15 schedulingInterval:v18];
      float v17 = v23;
      if (v22)
      {
        int v24 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#find-range,Requested backoff acquisition policy, processing secondary scheduling parameters", buf, 2u);
        }
        if (v17 >= v20)
        {
          int v22 = 1;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
            sub_100425F1C();
          }
          int v22 = 0;
        }
      }
    }
  }
  if (BYTE1(self->_identifier.__r_.var0))
  {
    unsigned __int16 v28 = (unsigned __int16)[(NIServerFindingRangingProvider *)self _getDitherConst];
    int v29 = HIBYTE(v28);
  }
  else
  {
    LOBYTE(v28) = 0;
    int v29 = 0;
  }
  v30 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    if (v29) {
      unsigned __int8 v31 = v28;
    }
    else {
      unsigned __int8 v31 = 0;
    }
    int v84 = v15;
    __int16 v85 = 2048;
    *(double *)v86 = v17;
    *(_WORD *)&v86[8] = 1024;
    *(_DWORD *)&v86[10] = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#find-range,Primary scheduling params: Interval(us)=%d, Duty Cycle=%f, Dither const=%d", buf, 0x18u);
  }
  if (v22)
  {
    v32 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      int v84 = (int)v55;
      __int16 v85 = 1024;
      *(_DWORD *)v86 = HIDWORD(v55);
      *(_WORD *)&v86[4] = 2048;
      *(double *)&v86[6] = v20;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#find-range,Secondary scheduling params: Delay(us)=%d, Interval(us)=%d, Duty Cycle=%f", buf, 0x18u);
    }
  }
  buf[0] = 0;
  char v87 = 0;
  __int16 v33 = v28 | (unsigned __int16)((_WORD)v29 << 8);
  uint64_t v88 = 17000;
  char v89 = 1;
  unsigned int v90 = v58;
  int v91 = v15;
  float v92 = v17;
  uint64_t v93 = 0;
  __int16 v94 = v33;
  uint64_t v95 = 0;
  memset(v97, 0, sizeof(v97));
  uint64_t v96 = 0;
  if (!BYTE2(a3->range_enable_params.fira.local_addr.var0.__val_)) {
    __assert_rtn("-[NIServerFindingRangingProvider _triggerRanging:peerDiscoveryToken:technology:sharedProtocol:]", "NIServerFindingRanging.mm", 4375, "serviceRequest.range_enable_params.nbamms.nb_bch.has_value()");
  }
  int v34 = LOWORD(a3->range_enable_params.fira.local_addr.var0.__val_) | 0x10000;
  __int16 v70 = 0;
  int v69 = 0;
  int v65 = 2;
  char v66 = 0;
  __int16 v67 = 0;
  char v68 = 0;
  char v71 = 1;
  char v72 = 1;
  uint64_t v73 = 17000;
  char v74 = 1;
  unsigned int v75 = v58;
  int v76 = v15;
  float v77 = v17;
  uint64_t v78 = 0;
  __int16 v79 = v33;
  int v54 = v34;
  int v80 = v34;
  memset(v81, 0, sizeof(v81));
  __int16 v82 = 0;
  unsigned int v35 = [(NIServerFindingRangingProvider *)self rangingAcquisitionType];
  unsigned int v56 = a6;
  v36 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    id v37 = v35 ? "BTAidedAcquisition" : "DirectAcquisition";
    sub_100004950(__p, v37);
    id v38 = v60 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)long long v63 = 136315138;
    long long v64 = v38;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "#find-range,ranging acquisition type = %s", v63, 0xCu);
    if (v60 < 0) {
      operator delete(__p[0]);
    }
  }

  if (v35 == 1)
  {
    uint64_t v40 = [(NSDictionary *)self->_debugParameters objectForKey:v10];
    int v41 = v40;
    if (!v40)
    {
      NSErrorUserInfoKey v61 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v62 = @"Advertisement is missing for specified token";
      v53 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
      __int16 v26 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v53];

      goto LABEL_57;
    }
    unsigned int v42 = [v40 advertisement];
    id v43 = [v42 address];
    int v65 = 2;
    char v66 = 0;
    __int16 v67 = 0;
    char v68 = 0;
    int v69 = (int)v43;
    __int16 v70 = WORD2(v43);
    char v71 = 1;
    char v72 = 1;
    uint64_t v73 = 17000;
    char v74 = 1;
    unsigned int v75 = v58;
    int v76 = v15;
    float v77 = v17;
    uint64_t v78 = 0;
    __int16 v79 = v33;
    int v80 = v54;
    memset(v81, 0, sizeof(v81));
    __int16 v82 = 0;
  }
  else if (!v35 && v22)
  {
    uint64_t v39 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#find-range,Resetting NBAMMSStartOptions", (uint8_t *)__p, 2u);
    }
    __int16 v70 = 0;
    int v69 = 0;
    int v65 = 2;
    char v66 = 0;
    __int16 v67 = 0;
    char v68 = 0;
    char v71 = 1;
    char v72 = 1;
    uint64_t v73 = 17000;
    char v74 = 1;
    unsigned int v75 = v58;
    int v76 = v15;
    float v77 = v17;
    uint64_t v78 = 0;
    __int16 v79 = v33;
    int v80 = v54;
    v81[0] = 0;
    *(void *)&v81[1] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | v55;
    *(void *)&v81[5] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | HIDWORD(v55);
    *(float *)&v81[9] = v57;
    LOBYTE(v81[11]) = 1;
  }
  objc_initWeak(__p, self);
  NSErrorUserInfoKey v44 = +[NIServerFindingNBAMMSSessionManager sharedInstance];
  BOOL v45 = LOBYTE(self->_identifier.__r_.var0) != 0;
  id WeakRetained = objc_loadWeakRetained(__p);
  if (LOBYTE(self->_uwbSystemListener.__cntrl_)) {
    NSErrorUserInfoKey v47 = buf;
  }
  else {
    NSErrorUserInfoKey v47 = (uint8_t *)&v65;
  }
  __int16 v26 = [v44 registerNBAMMSSessionWithToken:v10 isFinder:v45 client:WeakRetained serviceRequest:a3 startRangingOptions:v47 sharedProtocol:v56];

  debugParameters = self->_debugParameters;
  if (v26)
  {
    [(NSDictionary *)debugParameters removeObjectForKey:v10];
    id v49 = v26;
  }
  else
  {
    CFStringRef v50 = [(NSDictionary *)debugParameters objectForKey:v10];
    if (!v50) {
      __assert_rtn("-[NIServerFindingRangingProvider _triggerRanging:peerDiscoveryToken:technology:sharedProtocol:]", "NIServerFindingRanging.mm", 4423, "[_trackingPeers objectForKey:token] != nil");
    }

    v51 = [(NSDictionary *)self->_debugParameters objectForKey:v10];
    [v51 setRangingActive:1];
  }
  objc_destroyWeak(__p);
LABEL_57:

  return v26;
}

- (BOOL)_doesWantTriggeredDutyCycledAcquisition
{
  unsigned int v3 = [(NIServerFindingRangingProvider *)self _getSchedulingIntervalForTriggeredDutyCycledAcquisition];
  [(NIServerFindingRangingProvider *)self _getDutyCycleForTriggeredDutyCycledAcquisition];
  return v4 <= 1.0 && v3 != 0;
}

- (unsigned)_getSchedulingIntervalForTriggeredDutyCycledAcquisition
{
  int v3 = BYTE1(self->_identifier.__r_.var0);
  float v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"FindingDisableDutyCycledAcquisition"];
  if (v3) {
    int v6 = 30000;
  }
  else {
    int v6 = 29000;
  }

  if (v5) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = v6;
  }
  uint64_t v8 = +[NSUserDefaults standardUserDefaults];
  char v9 = [v8 objectForKey:@"FindingSchedulingInterval"];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v7 = [v9 intValue];
    }
  }
  ptr = self->_uwbSystemListener.__ptr_;
  if (ptr)
  {
    __int16 v11 = [(PRRangingManagerClient *)ptr objectForKey:@"schedulingInterval"];
    uint64_t v12 = v11;
    if (v11) {
      unsigned int v7 = [v11 intValue];
    }
  }
  return v7;
}

- (float)_getDutyCycleForTriggeredDutyCycledAcquisition
{
  int v3 = BYTE1(self->_identifier.__r_.var0);
  float v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"FindingDisableDutyCycledAcquisition"];
  float v6 = 0.0;
  if (v3) {
    float v7 = 0.0;
  }
  else {
    float v7 = 0.1034;
  }

  if (!v5) {
    float v6 = v7;
  }
  uint64_t v8 = +[NSUserDefaults standardUserDefaults];
  char v9 = [v8 objectForKey:@"FindingDutyCycle"];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      float v6 = v10;
    }
  }
  ptr = self->_uwbSystemListener.__ptr_;
  if (ptr)
  {
    uint64_t v12 = [(PRRangingManagerClient *)ptr objectForKey:@"dutyCycle"];
    uint64_t v13 = v12;
    if (v12)
    {
      [v12 floatValue];
      float v6 = v14;
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
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-range,Provided duty cycle leads to scan window > scheduling interval - (start time offset + interface delays), using entire available scan window", v8, 2u);
    }
  }
  return a3;
}

- (optional<unsigned)_getDitherConst
{
  if (BYTE1(self->_identifier.__r_.var0))
  {
    int v3 = +[NSUserDefaults standardUserDefaults];
    unsigned int v4 = [v3 BOOLForKey:@"FindingDisableDitheredAcq"];

    if (v4)
    {
      float v5 = qword_1008ABDE0;
      BOOL v6 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
      __int16 v7 = 0;
      unsigned __int8 v8 = 0;
      if (v6)
      {
        __int16 v18 = 0;
        char v9 = "#find-range,Dithered duty cycled acquisition is disabled using defaults write";
        float v10 = (uint8_t *)&v18;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
        __int16 v7 = 0;
        unsigned __int8 v8 = 0;
      }
    }
    else
    {
      uint64_t v12 = +[NSUserDefaults standardUserDefaults];
      uint64_t v13 = [v12 objectForKey:@"FindingDitherConst"];

      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        unsigned __int8 v8 = [v13 intValue];
      }
      else {
        unsigned __int8 v8 = 10;
      }
      ptr = self->_uwbSystemListener.__ptr_;
      if (ptr)
      {
        uint64_t v15 = [(PRRangingManagerClient *)ptr objectForKey:@"ditherConst"];
        float v16 = v15;
        if (v15) {
          unsigned __int8 v8 = [v15 intValue];
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
      char v9 = "#find-range,Dithered duty cycled acquisition not valid for responder";
      float v10 = buf;
      goto LABEL_7;
    }
  }
  return (optional<unsigned char>)(v8 | (unsigned __int16)(v7 << 8));
}

- (optional<SecondarySchedulingParameters>)_getFindingSecondarySchedulingParameters
{
  if (BYTE1(self->_identifier.__r_.var0))
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
      sub_100425F50();
    }
    goto LABEL_5;
  }
  int v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:@"FindingDisableDutyCycledAcquisition"];

  if (v4)
  {
LABEL_5:
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    __int16 v7 = 0;
    int v8 = 0;
    unsigned int v9 = 0;
    goto LABEL_6;
  }
  uint64_t v12 = +[NSUserDefaults standardUserDefaults];
  uint64_t v13 = [v12 objectForKey:@"FindingSecondarySchedulingDelay"];

  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v14 = [v13 intValue];
    int v15 = 1;
  }
  else
  {
    unsigned int v14 = 0;
    int v15 = 0;
  }
  ptr = self->_uwbSystemListener.__ptr_;
  if (ptr)
  {
    float v17 = [(PRRangingManagerClient *)ptr objectForKey:@"secondarySchedulingDelay"];
    __int16 v18 = v17;
    if (v17)
    {
      unsigned int v14 = [v17 intValue];
      int v15 = 1;
    }
  }
  if (v14) {
    BOOL v19 = v15 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19) {
    int v20 = 30000000;
  }
  else {
    int v20 = v14;
  }
  unsigned __int8 v21 = +[NSUserDefaults standardUserDefaults];
  int v22 = [v21 objectForKey:@"FindingSecondarySchedulingInterval"];

  if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v23 = [v22 intValue];
    int v24 = 1;
  }
  else
  {
    unsigned int v23 = 0;
    int v24 = 0;
  }
  __int16 v25 = self->_uwbSystemListener.__ptr_;
  if (v25)
  {
    __int16 v26 = [(PRRangingManagerClient *)v25 objectForKey:@"secondarySchedulingInterval"];
    uint64_t v27 = v26;
    if (v26)
    {
      unsigned int v23 = [v26 intValue];
      int v24 = 1;
    }
  }
  if (v23) {
    BOOL v28 = v24 == 0;
  }
  else {
    BOOL v28 = 1;
  }
  if (v28) {
    uint64_t v29 = 59000;
  }
  else {
    uint64_t v29 = v23;
  }
  v30 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v31 = [v30 objectForKey:@"FindingSecondaryDutyCycle"];

  float v32 = 0.0;
  if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v31 floatValue];
    float v32 = v33;
    int v34 = 1;
  }
  else
  {
    int v34 = 0;
  }
  unsigned int v35 = self->_uwbSystemListener.__ptr_;
  if (v35)
  {
    v36 = [(PRRangingManagerClient *)v35 objectForKey:@"secondaryDutyCycle"];
    id v37 = v36;
    if (v36)
    {
      [v36 floatValue];
      float v32 = v38;
      int v34 = 1;
    }
  }
  HIDWORD(v39) = 0;
  BOOL v41 = v32 > 1.0 || v32 <= 0.0 || v34 == 0;
  LODWORD(v39) = 1028658089;
  if (!v41) {
    *(float *)&double v39 = v32;
  }
  [(NIServerFindingRangingProvider *)self _adjustDutyCycleForInterfaceDelays:v29 schedulingInterval:v39];
  unsigned int v43 = v42;
  unsigned int v9 = v20 & 0xFFFFFF00;

  int v8 = v20;
  uint64_t v5 = v29 << 32;
  uint64_t v6 = v43;
  __int16 v7 = &_mh_execute_header;
LABEL_6:
  uint64_t v10 = v5 | v9 | v8;
  unint64_t v11 = (unint64_t)v7 | v6;
  *(void *)&result.var0.var1.var2 = v11;
  *(void *)&result.var0.int var0 = v10;
  return result;
}

- (unint64_t)_macAddressForIRK:(id)a3
{
  id v3 = a3;
  [v3 bytes];
  unint64_t v4 = SipHash();

  return v4;
}

- (id)_getDefaultNbammsRangingConfigParameters
{
  int cntrl_low = LOBYTE(self->_uwbSystemListener.__cntrl_);
  unint64_t v4 = qword_1008ABDE0;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
  if (cntrl_low)
  {
    if (!v5) {
      goto LABEL_7;
    }
    __int16 v34 = 0;
    uint64_t v6 = "#find-range,Setting default ranging params for Test Nbamms MAC Mode";
    __int16 v7 = (uint8_t *)&v34;
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    LOWORD(v33) = 0;
    uint64_t v6 = "#find-range,Setting default ranging params for POR Nbamms MAC Mode";
    __int16 v7 = (uint8_t *)&v33;
  }
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
LABEL_7:
  int v8 = objc_opt_new();
  unsigned int v9 = sub_100007D00();
  if (sub_1003D2ECC((uint64_t)v9))
  {
    uint64_t v10 = +[NSNumber numberWithInt:4];
    [v8 setObject:v10 forKeyedSubscript:@"nbTxAntenna"];

    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1008A5BD0, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1008A5BD0))
    {
      unsigned __int8 v31 = sub_100007D00();
      if (sub_1003D2EE4((uint64_t)v31)) {
        int v32 = 5;
      }
      else {
        int v32 = 4;
      }
      dword_1008A5BC8 = v32;
      __cxa_guard_release(&qword_1008A5BD0);
    }
    unint64_t v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", dword_1008A5BC8, v33);
    [v8 setObject:v11 forKeyedSubscript:@"nbRxAntenna"];

    uint64_t v12 = +[NSNumber numberWithInt:4097];
    [v8 setObject:v12 forKeyedSubscript:@"nbPacketType"];

    uint64_t v13 = +[NSNumber numberWithInt:9];
    [v8 setObject:v13 forKeyedSubscript:@"mmsBandChannel"];

    unsigned int v14 = +[NSNumber numberWithInt:4];
    [v8 setObject:v14 forKeyedSubscript:@"nbSlotSize"];

    if (LOBYTE(self->_uwbSystemListener.__cntrl_))
    {
      int v15 = +[NSNumber numberWithInt:72];
      [v8 setObject:v15 forKeyedSubscript:@"mmsSlotSize"];
    }
    float v16 = +[NSNumber numberWithInt:16];
    [v8 setObject:v16 forKeyedSubscript:@"mmsNumFragments"];

    float v17 = +[NSNumber numberWithInt:10000000];
    [v8 setObject:v17 forKeyedSubscript:@"startTimeUncertainty"];

    __int16 v18 = +[NSNumber numberWithInt:99];
    [v8 setObject:v18 forKeyedSubscript:@"interval"];

    BOOL v19 = +[NSNumber numberWithBool:0];
    [v8 setObject:v19 forKeyedSubscript:@"enableNonInterlacedMMS"];

    int v20 = sub_100007D00();
    unsigned __int8 v21 = +[NSNumber numberWithBool:sub_1003D2F34((uint64_t)v20)];
    [v8 setObject:v21 forKeyedSubscript:@"enableAntennaDiversity"];

    int v22 = +[NSNumber numberWithBool:0];
    [v8 setObject:v22 forKeyedSubscript:@"overrideDefaultAntenna"];

    unsigned int v23 = +[NSNumber numberWithBool:0];
    [v8 setObject:v23 forKeyedSubscript:@"useDedicatedAntennas"];

    int v24 = +[NSNumber numberWithInt:6];
    [v8 setObject:v24 forKeyedSubscript:@"napSlotSize"];

    __int16 v25 = +[NSNumber numberWithInt:10];
    [v8 setObject:v25 forKeyedSubscript:@"dataSlotSize"];

    __int16 v26 = +[NSNumber numberWithBool:1];
    [v8 setObject:v26 forKeyedSubscript:@"useType2Addr"];

    uint64_t v27 = +[NSUserDefaults standardUserDefaults];
    BOOL v28 = [v27 objectForKey:@"enforceNBBandChannel"];

    if (v28)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v29 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (unsigned __int16)[v28 intValue]);
        [v8 setObject:v29 forKeyedSubscript:@"nbBandChannel"];
      }
    }
  }

  return v8;
}

- (void)_setInitiator
{
  id v3 = sub_100007D00();
  if (!sub_1003D2ECC((uint64_t)v3))
  {
    char var0 = self->_identifier.__r_.var0;
LABEL_5:
    var0 ^= 1u;
    goto LABEL_6;
  }
  char var0 = self->_identifier.__r_.var0;
  if (!LOBYTE(self->_uwbSystemListener.__cntrl_)) {
    goto LABEL_5;
  }
LABEL_6:
  BYTE1(self->_identifier.__r_.var0) = var0;
}

- (void)_assignDebugParametersIfAvailable:(id)a3
{
  id v69 = a3;
  if (!v69) {
    __assert_rtn("-[NIServerFindingRangingProvider _assignDebugParametersIfAvailable:]", "NIServerFindingRanging.mm", 4751, "debugParameters != nil");
  }
  unint64_t v4 = [(NIServerFindingRangingProvider *)self _getDefaultNbammsRangingConfigParameters];
  BOOL v5 = (PRRangingManagerClient *)[v4 mutableCopy];

  uint64_t v6 = [v69 objectForKey:@"nbTxAntenna"];

  if (v6)
  {
    __int16 v7 = [v69 objectForKey:@"nbTxAntenna"];
    [(PRRangingManagerClient *)v5 setObject:v7 forKeyedSubscript:@"nbTxAntenna"];
  }
  int v8 = [v69 objectForKey:@"nbRxAntenna"];

  if (v8)
  {
    unsigned int v9 = [v69 objectForKey:@"nbRxAntenna"];
    [(PRRangingManagerClient *)v5 setObject:v9 forKeyedSubscript:@"nbRxAntenna"];
  }
  uint64_t v10 = [v69 objectForKey:@"nbPacketType"];

  if (v10)
  {
    unint64_t v11 = [v69 objectForKey:@"nbPacketType"];
    [(PRRangingManagerClient *)v5 setObject:v11 forKeyedSubscript:@"nbPacketType"];
  }
  uint64_t v12 = [v69 objectForKey:@"nbBandChannel"];

  if (v12)
  {
    uint64_t v13 = [v69 objectForKey:@"nbBandChannel"];
    [(PRRangingManagerClient *)v5 setObject:v13 forKeyedSubscript:@"nbBandChannel"];
  }
  unsigned int v14 = [v69 objectForKey:@"mmsTxAntenna"];

  if (v14)
  {
    int v15 = [v69 objectForKey:@"mmsTxAntenna"];
    [(PRRangingManagerClient *)v5 setObject:v15 forKeyedSubscript:@"mmsTxAntenna"];
  }
  float v16 = [v69 objectForKey:@"mmsRxAntenna"];

  if (v16)
  {
    float v17 = [v69 objectForKey:@"mmsRxAntenna"];
    [(PRRangingManagerClient *)v5 setObject:v17 forKeyedSubscript:@"mmsRxAntenna"];
  }
  __int16 v18 = [v69 objectForKey:@"mmsRxSyncAntenna"];

  if (v18)
  {
    BOOL v19 = [v69 objectForKey:@"mmsRxSyncAntenna"];
    [(PRRangingManagerClient *)v5 setObject:v19 forKeyedSubscript:@"mmsRxSyncAntenna"];
  }
  int v20 = [v69 objectForKey:@"mmsPacketType"];

  if (v20)
  {
    unsigned __int8 v21 = [v69 objectForKey:@"mmsPacketType"];
    [(PRRangingManagerClient *)v5 setObject:v21 forKeyedSubscript:@"mmsPacketType"];
  }
  int v22 = [v69 objectForKey:@"mmsPSR"];

  if (v22)
  {
    unsigned int v23 = [v69 objectForKey:@"mmsPSR"];
    [(PRRangingManagerClient *)v5 setObject:v23 forKeyedSubscript:@"mmsPSR"];
  }
  int v24 = [v69 objectForKey:@"mmsGap"];

  if (v24)
  {
    __int16 v25 = [v69 objectForKey:@"mmsGap"];
    [(PRRangingManagerClient *)v5 setObject:v25 forKeyedSubscript:@"mmsGap"];
  }
  __int16 v26 = [v69 objectForKey:@"mmsSeqIdx"];

  if (v26)
  {
    uint64_t v27 = [v69 objectForKey:@"mmsSeqIdx"];
    [(PRRangingManagerClient *)v5 setObject:v27 forKeyedSubscript:@"mmsSeqIdx"];
  }
  BOOL v28 = [v69 objectForKey:@"mmsBandChannel"];

  if (v28)
  {
    uint64_t v29 = [v69 objectForKey:@"mmsBandChannel"];
    [(PRRangingManagerClient *)v5 setObject:v29 forKeyedSubscript:@"mmsBandChannel"];
  }
  v30 = [v69 objectForKey:@"nbSlotSize"];

  if (v30)
  {
    unsigned __int8 v31 = [v69 objectForKey:@"nbSlotSize"];
    [(PRRangingManagerClient *)v5 setObject:v31 forKeyedSubscript:@"nbSlotSize"];
  }
  int v32 = [v69 objectForKey:@"mmsSlotSize"];

  if (v32)
  {
    uint64_t v33 = [v69 objectForKey:@"mmsSlotSize"];
    [(PRRangingManagerClient *)v5 setObject:v33 forKeyedSubscript:@"mmsSlotSize"];
  }
  __int16 v34 = [v69 objectForKey:@"mmsNumFragments"];

  if (v34)
  {
    unsigned int v35 = [v69 objectForKey:@"mmsNumFragments"];
    [(PRRangingManagerClient *)v5 setObject:v35 forKeyedSubscript:@"mmsNumFragments"];
  }
  v36 = [v69 objectForKey:@"interval"];

  if (v36)
  {
    id v37 = [v69 objectForKey:@"interval"];
    [(PRRangingManagerClient *)v5 setObject:v37 forKeyedSubscript:@"interval"];
  }
  float v38 = [v69 objectForKey:@"enableNonInterlacedMMS"];

  if (v38)
  {
    double v39 = [v69 objectForKey:@"enableNonInterlacedMMS"];
    [(PRRangingManagerClient *)v5 setObject:v39 forKeyedSubscript:@"enableNonInterlacedMMS"];
  }
  uint64_t v40 = [v69 objectForKey:@"enableAntennaDiversity"];

  if (v40)
  {
    BOOL v41 = [v69 objectForKey:@"enableAntennaDiversity"];
    [(PRRangingManagerClient *)v5 setObject:v41 forKeyedSubscript:@"enableAntennaDiversity"];
  }
  unsigned int v42 = [v69 objectForKey:@"useDedicatedAntennas"];

  if (v42)
  {
    unsigned int v43 = [v69 objectForKey:@"useDedicatedAntennas"];
    [(PRRangingManagerClient *)v5 setObject:v43 forKeyedSubscript:@"useDedicatedAntennas"];
  }
  NSErrorUserInfoKey v44 = [v69 objectForKey:@"overrideDefaultAntenna"];

  if (v44)
  {
    BOOL v45 = [v69 objectForKey:@"overrideDefaultAntenna"];
    [(PRRangingManagerClient *)v5 setObject:v45 forKeyedSubscript:@"overrideDefaultAntenna"];
  }
  v46 = [v69 objectForKey:@"nbChannelSelectionMask"];

  if (v46)
  {
    NSErrorUserInfoKey v47 = [v69 objectForKey:@"nbChannelSelectionMask"];
    [(PRRangingManagerClient *)v5 setObject:v47 forKeyedSubscript:@"nbChannelSelectionMask"];
  }
  CFStringRef v48 = [v69 objectForKey:@"napSlotSize"];

  if (v48)
  {
    id v49 = [v69 objectForKey:@"napSlotSize"];
    [(PRRangingManagerClient *)v5 setObject:v49 forKeyedSubscript:@"napSlotSize"];
  }
  CFStringRef v50 = [v69 objectForKey:@"dataSlotSize"];

  if (v50)
  {
    v51 = [v69 objectForKey:@"dataSlotSize"];
    [(PRRangingManagerClient *)v5 setObject:v51 forKeyedSubscript:@"dataSlotSize"];
  }
  id v52 = [v69 objectForKey:@"useType2Addr"];

  if (v52)
  {
    v53 = [v69 objectForKey:@"useType2Addr"];
    [(PRRangingManagerClient *)v5 setObject:v53 forKeyedSubscript:@"useType2Addr"];
  }
  int v54 = [v69 objectForKey:@"schedulingInterval"];

  if (v54)
  {
    id v55 = [v69 objectForKey:@"schedulingInterval"];
    [(PRRangingManagerClient *)v5 setObject:v55 forKeyedSubscript:@"schedulingInterval"];
  }
  unsigned int v56 = [v69 objectForKey:@"dutyCycle"];

  if (v56)
  {
    float v57 = [v69 objectForKey:@"dutyCycle"];
    [(PRRangingManagerClient *)v5 setObject:v57 forKeyedSubscript:@"dutyCycle"];
  }
  unsigned int v58 = [v69 objectForKey:@"antennaDiversityMask"];

  if (v58)
  {
    id v59 = [v69 objectForKey:@"antennaDiversityMask"];
    [(PRRangingManagerClient *)v5 setObject:v59 forKeyedSubscript:@"antennaDiversityMask"];
  }
  char v60 = [v69 objectForKey:@"ditherConst"];

  if (v60)
  {
    NSErrorUserInfoKey v61 = [v69 objectForKey:@"ditherConst"];
    [(PRRangingManagerClient *)v5 setObject:v61 forKeyedSubscript:@"ditherConst"];
  }
  CFStringRef v62 = [v69 objectForKey:@"secondarySchedulingDelay"];

  if (v62)
  {
    long long v63 = [v69 objectForKey:@"secondarySchedulingDelay"];
    [(PRRangingManagerClient *)v5 setObject:v63 forKeyedSubscript:@"secondarySchedulingDelay"];
  }
  long long v64 = [v69 objectForKey:@"secondarySchedulingInterval"];

  if (v64)
  {
    int v65 = [v69 objectForKey:@"secondarySchedulingInterval"];
    [(PRRangingManagerClient *)v5 setObject:v65 forKeyedSubscript:@"secondarySchedulingInterval"];
  }
  char v66 = [v69 objectForKey:@"secondaryDutyCycle"];

  if (v66)
  {
    __int16 v67 = [v69 objectForKey:@"secondaryDutyCycle"];
    [(PRRangingManagerClient *)v5 setObject:v67 forKeyedSubscript:@"secondaryDutyCycle"];
  }
  ptr = self->_uwbSystemListener.__ptr_;
  self->_uwbSystemListener.__ptr_ = v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugParameters, 0);
  objc_storeStrong((id *)&self->_uwbSystemListener.__ptr_, 0);
  id v3 = *(std::__shared_weak_count **)&self->_activated;
  if (v3) {
    sub_10001A970(v3);
  }
  consumerQueue = (std::__shared_weak_count *)self->_consumerQueue;
  if (consumerQueue) {
    sub_10001A970(consumerQueue);
  }
  objc_storeStrong((id *)&self->_isFinder, 0);
  objc_destroyWeak((id *)&self->_identifier.var0);
  if (*((char *)&self->_identifier.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = self->_identifier.__r_.__value_.var0.var1.__data_;
    operator delete(data);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0uLL;
  *((void *)self + 3) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  return self;
}

@end