@interface NIServerNearbyPeerGrSession
- (BOOL)shouldBypassBleDiscovery;
- (NIServerNearbyPeerGrSession)initWithDataSource:(id)a3 delegate:(id)a4 clientQueue:(id)a5;
- (id).cxx_construct;
- (id)_triggerRanging:(id)a3;
- (id)configure;
- (id)run;
- (optional<rose::RoseServiceRequest>)_prepareServiceRequest;
- (shared_ptr<rose::objects::GRSession>)_buildRoseSession:(const void *)a3;
- (unint64_t)sipHashForIRK:(id)a3;
- (void)_grSessionInvalidatedWithReason:(int)a3;
- (void)device:(id)a3 rediscovered:(id)a4;
- (void)deviceDiscovered:(id)a3;
- (void)didReceiveNewSolution:(const void *)a3;
- (void)didReceiveRemoteData:(const void *)a3;
- (void)invalidate;
- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3;
- (void)updatePeerData:(const void *)a3;
@end

@implementation NIServerNearbyPeerGrSession

- (NIServerNearbyPeerGrSession)initWithDataSource:(id)a3 delegate:(id)a4 clientQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NIServerNearbyPeerGrSession;
  v11 = [(NIServerNearbyPeerGrSession *)&v20 init];
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

    v17 = v12;
  }

  return v12;
}

- (id)configure
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_grSession.__ptr_) {
    goto LABEL_8;
  }
  [(NIServerNearbyPeerGrSession *)self _prepareServiceRequest];
  if (v9[504])
  {
    [(NIServerNearbyPeerGrSession *)self _buildRoseSession:v9];
    shared_ptr<rose::objects::GRSession> v3 = v8;
    shared_ptr<rose::objects::GRSession> v8 = (shared_ptr<rose::objects::GRSession>)0;
    cntrl = (std::__shared_weak_count *)self->_grSession.__cntrl_;
    self->_grSession = v3;
    if (cntrl) {
      sub_10001A970(cntrl);
    }
  }
  else
  {
    v5 = (std::__shared_weak_count *)self->_grSession.__cntrl_;
    self->_grSession.__ptr_ = 0;
    self->_grSession.__cntrl_ = 0;
    if (!v5) {
      goto LABEL_12;
    }
    sub_10001A970(v5);
  }
  if (self->_grSession.__ptr_)
  {
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
LABEL_12:
  v6 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction", -5887, 0, v8.__ptr_ code userInfo];
LABEL_9:

  return v6;
}

- (id)run
{
  if (self->_grSession.__ptr_)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
    v4 = [WeakRetained getResourcesManager];
    v5 = [v4 btResource];
    [v5 startAdvertising];

    if ([v4 isBackgroundOperationAllowed])
    {
      v6 = [v4 btResource];
      [v6 allowScreenOffOperation:1];
    }
    v7 = [v4 btResource];
    [v7 startScanning];

    shared_ptr<rose::objects::GRSession> v8 = [v4 lifecycleSupervisor];
    [v8 runWithConfigurationCalled];

    id v9 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041BDE4();
    }
    id v9 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:0];
  }

  return v9;
}

- (BOOL)shouldBypassBleDiscovery
{
  return 0;
}

- (void)deviceDiscovered:(id)a3
{
  id v4 = a3;
  if (self->_pbLogger.__ptr_)
  {
    double v5 = sub_100006C38();
    v6 = +[NINearbyObject objectFromBluetoothDevice:v4];
    if (v6)
    {
      ptr = self->_pbLogger.__ptr_;
      id v8 = [v4 u64Identifier];
      sub_100290760(v6, (uint64_t)__p);
      sub_10029C56C((uint64_t)ptr, (uint64_t)v8, (uint64_t)__p, v5);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
  }
  id v9 = [(NIServerNearbyPeerGrSession *)self _triggerRanging:v4];
}

- (void)device:(id)a3 rediscovered:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id v9 = [v7 u64Identifier];
  id v10 = [v6 u64Identifier];
  v11 = [WeakRetained getResourcesManager];
  v12 = [v11 lifecycleSupervisor];
  unsigned int v13 = [v12 doesClientWantSessionToRun];

  ptr = self->_grSession.__ptr_;
  if (ptr) {
    BOOL v15 = *((unsigned char *)ptr + 33) != 0;
  }
  else {
    BOOL v15 = 0;
  }
  unsigned int v16 = [WeakRetained isLongRangeEnabled];
  if (ptr) {
    char v17 = v13;
  }
  else {
    char v17 = 0;
  }
  if (v17)
  {
    unsigned int v18 = v16;
    if (v16) {
      BOOL v19 = v9 != v10;
    }
    else {
      BOOL v19 = v15;
    }
    objc_super v20 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v21 = @"NO";
      int v29 = 138413570;
      if (v19) {
        CFStringRef v22 = @"YES";
      }
      else {
        CFStringRef v22 = @"NO";
      }
      CFStringRef v30 = v22;
      __int16 v31 = 2112;
      if (v9 == v10) {
        CFStringRef v23 = @"NO";
      }
      else {
        CFStringRef v23 = @"YES";
      }
      CFStringRef v32 = v23;
      __int16 v33 = 2112;
      if (v15) {
        CFStringRef v24 = @"YES";
      }
      else {
        CFStringRef v24 = @"NO";
      }
      CFStringRef v34 = @"YES";
      if (!v18) {
        CFStringRef v21 = @"YES";
      }
      __int16 v35 = 2112;
      CFStringRef v36 = @"YES";
      __int16 v37 = 2112;
      CFStringRef v38 = v24;
      __int16 v39 = 2112;
      CFStringRef v40 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#peer-gr,#restart ranging restart decision: %@. adr:%@,run:%@,has:%@,rsp:%@,uap:%@", (uint8_t *)&v29, 0x3Eu);
    }
    if (v19) {
      id v25 = [(NIServerNearbyPeerGrSession *)self _triggerRanging:v7];
    }
  }
  else
  {
    v26 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v27 = @"NO";
      if (v13) {
        CFStringRef v28 = @"YES";
      }
      else {
        CFStringRef v28 = @"NO";
      }
      if (ptr) {
        CFStringRef v27 = @"YES";
      }
      int v29 = 138412546;
      CFStringRef v30 = v28;
      __int16 v31 = 2112;
      CFStringRef v32 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#peer-gr,#restart early return. run: %@, has: %@", (uint8_t *)&v29, 0x16u);
    }
  }
}

- (void)updatePeerData:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10041BE24();
  }
  if (self->_grSession.__ptr_)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    unsigned __int8 v6 = [WeakRetained isLongRangeEnabled];

    if ((v6 & 1) == 0) {
      sub_1002DBB0C((uint64_t)self->_grSession.__ptr_, (uint64_t *)a3);
    }
  }
}

- (void)didReceiveNewSolution:(const void *)a3
{
  shared_ptr<rose::objects::GRSession> v3 = (int *)((char *)a3 + 32);
  if ((*((_DWORD *)a3 + 8) - 1) >= 3)
  {
    unsigned __int8 v6 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041BE64(v3, v6);
    }
  }
  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didReceiveNewSolution:a3];
  }
}

- (void)didReceiveRemoteData:(const void *)a3
{
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
  ptr = self->_grSession.__ptr_;
  if (ptr)
  {
    sub_1002D8288((uint64_t)ptr);
    cntrl = (std::__shared_weak_count *)self->_grSession.__cntrl_;
    self->_grSession.__ptr_ = 0;
    self->_grSession.__cntrl_ = 0;
    if (cntrl)
    {
      sub_10001A970(cntrl);
    }
  }
}

- (void)_grSessionInvalidatedWithReason:(int)a3
{
  double v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1002DE0A8(a3, v7);
    sub_10041BEE0();
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didInvalidateUWBSession];
}

- (shared_ptr<rose::objects::GRSession>)_buildRoseSession:(const void *)a3
{
  unsigned __int8 v6 = v3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id v8 = self;
  id v9 = [WeakRetained getContainerUniqueIdentifier];
  sub_100004950(__p, (char *)[v9 UTF8String]);

  id v10 = [WeakRetained getResourcesManager];
  v11 = v10;
  if (v10) {
    [v10 protobufLogger];
  }
  else {
    long long v23 = 0uLL;
  }
  v12 = operator new(0x5D8uLL);
  v12[1] = 0;
  v12[2] = 0;
  void *v12 = off_1008587B0;
  unsigned int v13 = v8;
  *(void *)buf = off_100858800;
  __int16 v37 = v13;
  CFStringRef v38 = buf;
  v14 = v13;
  v35[0] = off_100858880;
  v35[1] = v14;
  v35[3] = v35;
  BOOL v15 = v14;
  v34[0] = off_100858948;
  v34[1] = v15;
  v34[3] = v34;
  unsigned int v16 = v15;
  v33[0] = off_100858A10;
  v33[1] = v16;
  v33[3] = v33;
  v32[3] = 0;
  char v17 = v16;
  v31[0] = off_100858A90;
  v31[1] = v17;
  v31[3] = v31;
  v30[3] = 0;
  v29[3] = 0;
  v28[3] = 0;
  long long v27 = v23;
  sub_1002D7C48((uint64_t)(v12 + 3), (long long *)__p, (void *)a3, (uint64_t)buf, (uint64_t)v35, (uint64_t)v34, (uint64_t)v33, (uint64_t)v32, (uint64_t)v31, (uint64_t)v30, (uint64_t)v29, (uint64_t)v28, &v27);
  v12[3] = off_100858B20;
  v12[4] = off_100858BE8;
  if (*((void *)&v27 + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&v27 + 1));
  }
  sub_1001E1150(v28);
  sub_1001D2B78(v29);
  sub_1001D2BFC(v30);
  sub_1001E11D4(v31);
  sub_1001E1258(v32);
  sub_1001D2C80(v33);
  sub_1001E12DC(v34);
  sub_1001E1258(v35);
  sub_1001D2D04(buf);
  *(void *)&long long v24 = v12 + 3;
  *((void *)&v24 + 1) = v12;
  sub_10001ABCC((uint64_t)&v24, v12 + 5, (uint64_t)(v12 + 3));

  unsigned int v18 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#peer-gr,Registering for UWB service.", buf, 2u);
  }
  int v19 = sub_1002D85F4(v24);
  if (v19)
  {
    objc_super v20 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      sub_1002DE064(v19, buf);
      sub_10041BF38();
    }

    void *v6 = 0;
    v6[1] = 0;
    if (*((void *)&v24 + 1)) {
      sub_10001A970(*((std::__shared_weak_count **)&v24 + 1));
    }
  }
  else
  {
    *(_OWORD *)unsigned __int8 v6 = v24;
  }
  if (v26 < 0) {
    operator delete(__p[0]);
  }

  result.__cntrl_ = v22;
  result.__ptr_ = v21;
  return result;
}

- (unint64_t)sipHashForIRK:(id)a3
{
  id v3 = a3;
  [v3 bytes];
  unint64_t v4 = SipHash();

  return v4;
}

- (optional<rose::RoseServiceRequest>)_prepareServiceRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  unsigned __int8 v6 = [WeakRetained getNIConfiguration];
  id v7 = [v6 copy];

  id v8 = [v7 debugParameters];
  if (v8
    && ([v7 debugParameters],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v9 objectForKey:@"enableAdditionalUWBSignalFeatures"],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v8,
        v10))
  {
    v11 = [v7 debugParameters];
    v12 = [v11 objectForKey:@"enableAdditionalUWBSignalFeatures"];

    if (v12)
    {
      if ([v12 BOOLValue]) {
        int v13 = 2;
      }
      else {
        int v13 = 4;
      }
    }
    else
    {
      int v13 = 4;
    }
  }
  else
  {
    int v13 = 4;
  }
  v14 = (char *)[v7 backgroundMode] - 3;
  BOOL v15 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [WeakRetained getContainerUniqueIdentifier];
    char v17 = (void *)v16;
    CFStringRef v18 = @"yes";
    if ((unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL) {
      CFStringRef v18 = @"no";
    }
    buf[0] = 138412546;
    *(void *)&buf[1] = v18;
    LOWORD(buf[3]) = 2112;
    *(void *)((char *)&buf[3] + 2) = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#peer-gr,Prepare service request. avoidDedicatedAntennas = [%@], Container ID: %@. ", (uint8_t *)buf, 0x16u);
  }
  __int16 v47 = 0;
  char v48 = 0;
  int v49 = 68354305;
  char v50 = 0;
  char v51 = 0;
  char v52 = 0;
  char v53 = 0;
  int v54 = 3;
  int v55 = v13;
  int v56 = 3;
  uint64_t v58 = 0;
  uint64_t v57 = 0;
  __int16 v59 = 0;
  int v60 = 1;
  char v61 = 1;
  BOOL v62 = (unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL;
  int v63 = 0;
  char v64 = 0;
  int v65 = 6;
  int v19 = sub_1002F6464();
  uint64_t v20 = *((void *)v19 + 406);
  CFStringRef v21 = (std::__shared_weak_count *)*((void *)v19 + 407);
  if (v21) {
    atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!v20)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041BF90();
    }
    goto LABEL_38;
  }
  if (!sub_1002CE2DC(v20, (char *)&v47, (unsigned __int8 *)&v47 + 1, 0))
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041C010();
    }
LABEL_38:
    retstr->var0.__null_state_ = 0;
    retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
    goto LABEL_50;
  }
  CFStringRef v22 = [v7 debugParameters];
  if (v22)
  {
    long long v23 = [v7 debugParameters];
    long long v24 = [v23 objectForKey:@"forceAntennaDiversity"];
    BOOL v25 = v24 == 0;

    if (!v25)
    {
      char v26 = [v7 debugParameters];
      long long v27 = [v26 objectForKey:@"forceAntennaDiversity"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        int v29 = [v7 debugParameters];
        CFStringRef v30 = [v29 objectForKey:@"forceAntennaDiversity"];
        unsigned int v31 = [v30 BOOLValue];

        if (v31)
        {
          CFStringRef v32 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#peer-gr,* Antenna diversity turned ON from default writes.", (uint8_t *)buf, 2u);
          }
          LOWORD(v63) = 257;
        }
      }
    }
  }
  if ([WeakRetained isLongRangeEnabled])
  {
    __int16 v33 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#peer-gr,Long range enabled.", (uint8_t *)buf, 2u);
    }
    HIBYTE(v49) = 5;
    BYTE1(v49) = 0;
    BYTE2(v63) = 1;
    int v60 = 1;
  }
  CFStringRef v34 = [WeakRetained getResourcesManager];
  __int16 v35 = [v34 discoveryToken];

  if (v35)
  {
    CFStringRef v36 = [v7 peerDiscoveryToken];
    id v45 = 0;
    unsigned int v37 = [WeakRetained shouldInitiate:v35 peerDiscoveryToken:v36 error:&v45];
    id v38 = v45;

    __int16 v39 = qword_1008ABDE0;
    if (!v38)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v41 = @"No";
        if (v37) {
          CFStringRef v41 = @"Yes";
        }
        buf[0] = 138412290;
        *(void *)&buf[1] = v41;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#peer-gr,Should initiate: %@.", (uint8_t *)buf, 0xCu);
      }
      if (v37)
      {
        sub_10017F920((char *)&v47, (uint64_t)buf);
        operator new();
      }
      sub_10017FE3C((char *)&v47, (uint64_t)buf);
      operator new();
    }
    CFStringRef v40 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      id v43 = [v38 description];
      id v44 = [v43 UTF8String];
      buf[0] = 136315138;
      *(void *)&buf[1] = v44;
      _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "#peer-gr,unable to determine initiator: %s", (uint8_t *)buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041BFD0();
    }
    id v38 = 0;
  }
  retstr->var0.__null_state_ = 0;
  retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;

LABEL_50:
  if (v21) {
    sub_10001A970(v21);
  }

  return result;
}

- (id)_triggerRanging:(id)a3
{
  id v4 = a3;
  ptr = self->_grSession.__ptr_;
  if (!ptr)
  {
    uint64_t v8 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:0];
LABEL_13:
    v12 = (void *)v8;
    goto LABEL_15;
  }
  if (sub_1002D8978((uint64_t)ptr))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
    if ([WeakRetained isLongRangeEnabled])
    {
      id v7 = [v4 btAdvertisingAddress];
      int v17 = (int)v7;
      __int16 v18 = WORD2(v7);
      LODWORD(v14) = 2;
      BYTE4(v14) = 0;
      __int16 v15 = 0;
      char v16 = 0;
      char v19 = 1;
      char v20 = 1;
    }
    else
    {
      LOBYTE(v14) = 0;
      char v20 = 0;
    }
    uint64_t v21 = 0;
    char v22 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    int v26 = 0;
    int v10 = sub_1002DB434((uint64_t)self->_grSession.__ptr_, &v14);
  }
  else
  {
    id v9 = [v4 btAdvertisingAddress];
    int v17 = (int)v9;
    __int16 v18 = WORD2(v9);
    LODWORD(v14) = 2;
    BYTE4(v14) = 0;
    __int16 v15 = 0;
    char v16 = 0;
    char v19 = 1;
    char v20 = 1;
    uint64_t v21 = 0;
    char v22 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    int v26 = 0;
    int v10 = sub_1002DB434((uint64_t)self->_grSession.__ptr_, &v14);
  }
  if (v10)
  {
    v11 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_1002DE064(v10, &v14);
      sub_10041C050();
    }

    uint64_t v8 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:0];
    goto LABEL_13;
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  cntrl = (std::__shared_weak_count *)self->_grSession.__cntrl_;
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