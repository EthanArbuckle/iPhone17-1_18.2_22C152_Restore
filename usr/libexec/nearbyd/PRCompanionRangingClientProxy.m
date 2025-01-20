@interface PRCompanionRangingClientProxy
- (BOOL)startRangingMangagerAndCompanion:(id *)a3;
- (BOOL)stopRangingMangagerAndCompanion:(id *)a3;
- (NSDictionary)clientInfo;
- (PRCompanionRangingClientProxy)initWithConnection:(id)a3 queue:(id)a4;
- (PRRemoteDevice)companion;
- (id).cxx_construct;
- (optional<rose::RoseDeviceDescriptor>)peerDescriptor;
- (void)activate;
- (void)cleanupRangingManagerAndCompanionAfterError:(id)a3;
- (void)combineAndReportLocalAndCompanionRangingRequestStatus;
- (void)configureCompanionForRanging;
- (void)configureForCompanionRanging:(id)a3 options:(id)a4 reply:(id)a5;
- (void)connectWithClientInfo:(id)a3;
- (void)dealloc;
- (void)deinitCompanion;
- (void)didFailWithError:(id)a3;
- (void)didReceiveNewSolutions:(id)a3;
- (void)didReceiveSessionStartNotification:(id)a3;
- (void)findMyAccessoryManager:(id)a3 didCompleteRangingOnDevice:(id)a4 withStatus:(unsigned int)a5 endReason:(unsigned __int8)a6 error:(id)a7;
- (void)findMyAccessoryManager:(id)a3 didConfigureRangingOnDevice:(id)a4 withStatus:(unsigned int)a5 error:(id)a6;
- (void)findMyAccessoryManager:(id)a3 didConnectDevice:(id)a4 error:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didDeinitRangingOnDevice:(id)a4 withStatus:(unsigned int)a5 error:(id)a6;
- (void)findMyAccessoryManager:(id)a3 didDisconnectDevice:(id)a4;
- (void)findMyAccessoryManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didHaveRangingMovementOnDevice:(id)a4;
- (void)findMyAccessoryManager:(id)a3 didInitRangingOnDevice:(id)a4 withStatus:(unsigned int)a5 error:(id)a6;
- (void)findMyAccessoryManager:(id)a3 didPrepareRangingOnDevice:(id)a4 error:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didReceiveRangingErrorFromDevice:(id)a4 withStatus:(unsigned int)a5;
- (void)findMyAccessoryManager:(id)a3 didReceiveRangingTimestampFromDevice:(id)a4 status:(unsigned __int16)a5 rtt:(unint64_t)a6 tat:(unint64_t)a7 cycleIndex:(unsigned __int16)a8;
- (void)findMyAccessoryManager:(id)a3 didStartRangingOnDevice:(id)a4 error:(id)a5;
- (void)handleError:(id)a3;
- (void)initCompanion:(id)a3;
- (void)rangingRequestDidUpdateStatus:(unint64_t)a3;
- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4;
- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4;
- (void)reportRangingRequestStatusUpdate:(unint64_t)a3;
- (void)setCompanion:(id)a3;
- (void)setPeerDescriptor:(optional<rose::RoseDeviceDescriptor> *)a3;
- (void)startCompanionRanging:(id)a3 options:(id)a4 reply:(id)a5;
- (void)startRangingMangager;
- (void)stopCompanionRanging:(id)a3 reply:(id)a4;
- (void)terminate;
@end

@implementation PRCompanionRangingClientProxy

- (PRCompanionRangingClientProxy)initWithConnection:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PRCompanionRangingClientProxy.mm", 110, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v25 = +[NSAssertionHandler currentHandler];
  [v25 handleFailureInMethod:a2, self, @"PRCompanionRangingClientProxy.mm", 111, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

LABEL_3:
  v28.receiver = self;
  v28.super_class = (Class)PRCompanionRangingClientProxy;
  v10 = [(PRCompanionRangingClientProxy *)&v28 init];
  v11 = v10;
  if (v10)
  {
    *(void *)&v10->_localRangingState = 0;
    *(void *)&v10->_companionRoseState = 0;
    v10->_clientRequestState = 0;
    startOptions = v10->_startOptions;
    v10->_startOptions = 0;

    v13 = [[PRNSXPCConnection alloc] initWithConnection:v7];
    connWrapper = v11->_connWrapper;
    v11->_connWrapper = (PRRangingClientProtocol *)v13;

    objc_storeStrong((id *)&v11->_queue, a4);
    objc_initWeak(&location, v11);
    sub_10001A9E4(&location, buf);
    shared_ptr<PRRangingManagerClient> v15 = *(shared_ptr<PRRangingManagerClient> *)buf;
    memset(buf, 0, sizeof(buf));
    cntrl = (std::__shared_weak_count *)v11->_rangingManagerClient.__cntrl_;
    v11->_rangingManagerClient = v15;
    if (cntrl)
    {
      sub_10001A970(cntrl);
      if (*(void *)&buf[8]) {
        sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
      }
    }
    companion = v11->_companion;
    v11->_companion = 0;

    if (v11->_peerDescriptor.__engaged_) {
      v11->_peerDescriptor.__engaged_ = 0;
    }
    value = v11->_rangingRequest.__ptr_.__value_;
    v11->_rangingRequest.__ptr_.__value_ = 0;
    if (value) {
      operator delete();
    }
    v11->_p2pServiceId = 0;
    *(_WORD *)&v11->_cleaningUponDidFail = 0;
    v19 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "_companionRangingManager initWithDelegate #companion-retry", buf, 2u);
    }
    v20 = (CLFindMyAccessoryManager *)[objc_alloc((Class)CLFindMyAccessoryManager) initWithDelegate:v11 delegateQueue:v11->_queue];
    companionRangingManager = v11->_companionRangingManager;
    v11->_companionRangingManager = v20;

    objc_destroyWeak(&location);
  }
  v22 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "PRCompanionRangingClientProxy init", buf, 2u);
  }

  return v11;
}

- (void)connectWithClientInfo:(id)a3
{
  id v5 = a3;
  v6 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 objectForKey:PRProcessNameKey];
    id v8 = [v5 objectForKey:PRProcessIdentifierKey];
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 1024;
    unsigned int v12 = [v8 intValue];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PRCompanionRanging: XPC connection created. Process name: %@, pid: %d", (uint8_t *)&v9, 0x12u);
  }
  objc_storeStrong((id *)&self->_clientInfo, a3);
  [(PRCompanionRangingClientProxy *)self activate];
}

- (void)dealloc
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRCompanionRangingClientProxy dealloc", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)PRCompanionRangingClientProxy;
  [(PRCompanionRangingClientProxy *)&v4 dealloc];
}

- (void)activate
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRRangingManager connect probe #companion-retry", buf, 2u);
  }
  objc_super v4 = sub_1002F6464();
  sub_10001A8A4(buf, (void *)self->_rangingManagerClient.__ptr_ + 1);
  long long v9 = *(_OWORD *)buf;
  memset(buf, 0, sizeof(buf));
  sub_1002FA4B8((uint64_t)v4, (unint64_t *)&v9);
  if (*((void *)&v9 + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&v9 + 1));
  }
  if (*(void *)&buf[8]) {
    sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
  }
  id v5 = sub_1002F6464();
  sub_10001A8A4(buf, (void *)self->_rangingManagerClient.__ptr_ + 1);
  uint64_t v6 = *(void *)buf;
  id v7 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8]) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 16), 1uLL, memory_order_relaxed);
  }
  sub_1002F6B1C((uint64_t)v5, &v6);
  if (v7) {
    std::__shared_weak_count::__release_weak(v7);
  }
  if (*(void *)&buf[8]) {
    sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
  }
}

- (void)terminate
{
  if (self->_companion)
  {
    v3 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      companion = self->_companion;
      *(_DWORD *)buf = 138412290;
      unsigned int v12 = companion;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tearing down companion ranging session. Companion: %@", buf, 0xCu);
    }
    [(PRCompanionRangingClientProxy *)self deinitCompanion];
  }
  id v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PRRangingManager disconnect #companion-retry", buf, 2u);
  }
  uint64_t v6 = sub_1002F6464();
  cntrl = self->_rangingManagerClient.__cntrl_;
  ptr = self->_rangingManagerClient.__ptr_;
  id v10 = (std::__shared_weak_count *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  sub_1002FA594((uint64_t)v6, (unint64_t *)&ptr);
  if (v10) {
    sub_10001A970(v10);
  }
  [(PRRangingClientProtocol *)self->_connWrapper invalidate];
  voucher = self->_clientVoucher.voucher;
  self->_clientVoucher.voucher = 0;
}

- (void)handleError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  if ([v5 isEqualToString:kCLErrorDomainPrivate])
  {
    id v6 = [v4 code];

    if (v6 == (id)12) {
      [(PRCompanionRangingClientProxy *)self remoteDevice:self->_companion didChangeState:3];
    }
  }
  else
  {
  }
  [(PRCompanionRangingClientProxy *)self cleanupRangingManagerAndCompanionAfterError:v4];
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100014738;
  v9[3] = &unk_100846378;
  id v8 = v4;
  id v10 = v8;
  [(PRRangingClientProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v9];
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  id v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#companion-retry didFailWithError: %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014914;
  v8[3] = &unk_1008463A0;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)queue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)didReceiveNewSolutions:(id)a3
{
  id v4 = a3;
  voucher = self->_clientVoucher.voucher;
  v11[0] = &self->_clientVoucher;
  id v6 = voucher;
  v11[1] = voucher_adopt();
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100014A58;
  v9[3] = &unk_100846378;
  id v10 = v4;
  id v8 = v4;
  [(PRRangingClientProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v9];

  sub_10001A934((uint64_t)v11);
}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  connWrapper = self->_connWrapper;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014B58;
  v5[3] = &unk_1008463C0;
  v5[4] = a3;
  v5[5] = a4;
  [(PRRangingClientProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v5];
}

- (void)reportRangingRequestStatusUpdate:(unint64_t)a3
{
  p_clientVoucher = &self->_clientVoucher;
  voucher = self->_clientVoucher.voucher;
  v9[0] = &self->_clientVoucher;
  id v6 = voucher;
  v9[1] = voucher_adopt();
  id v7 = p_clientVoucher[-11].voucher;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014C98;
  v8[3] = &unk_1008463E0;
  void v8[4] = a3;
  [(OS_voucher *)v7 actOnRemoteObjectAndScheduleBarrierBlock:v8];
  sub_10001A934((uint64_t)v9);
}

- (void)combineAndReportLocalAndCompanionRangingRequestStatus
{
  int localRangingState = self->_localRangingState;
  if (localRangingState != 4)
  {
    if (localRangingState != 1 || self->_companionRangingState != 1) {
      return;
    }
    int clientRequestState = self->_clientRequestState;
    if (clientRequestState == 4)
    {
      id v16 = 0;
      unsigned __int8 v7 = [(PRCompanionRangingClientProxy *)self startRangingMangagerAndCompanion:&v16];
      id v8 = v16;
      id v9 = v8;
      if (v7)
      {
      }
      else
      {
        [(PRCompanionRangingClientProxy *)self handleError:v8];
      }
      return;
    }
    if (clientRequestState != 5)
    {
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      CFStringRef v20 = @"Unexpected new status PRRangingRequestStatusStopped";
      id v10 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      __int16 v11 = PRErrorWithCodeAndUserInfo(999, v10);

      [(PRCompanionRangingClientProxy *)self handleError:v11];
      return;
    }
    self->_int clientRequestState = 6;
    uint64_t v5 = 2;
    goto LABEL_11;
  }
  if (self->_companionRangingState != 5) {
    return;
  }
  int v6 = self->_clientRequestState;
  if (v6 != 4)
  {
    if (v6 != 3)
    {
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      CFStringRef v18 = @"Unexpected new status PRRangingRequestStatusDidStart";
      v13 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      v14 = PRErrorWithCodeAndUserInfo(999, v13);

      [(PRCompanionRangingClientProxy *)self handleError:v14];
      return;
    }
    self->_int clientRequestState = 4;
    uint64_t v5 = 1;
LABEL_11:
    [(PRCompanionRangingClientProxy *)self reportRangingRequestStatusUpdate:v5];
    return;
  }
  id v12 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)shared_ptr<PRRangingManagerClient> v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PRCompanionRangingClientProxy absorbing PRRangingRequestStatusDidStart from a retry.  ", v15, 2u);
  }
}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001508C;
  v6[3] = &unk_100846408;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  v6[4] = self;
  dispatch_async((dispatch_queue_t)queue, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_100015620;
  v9[3] = &unk_100846430;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  [(PRRangingClientProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v9];
}

- (void)didReceiveSessionStartNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015780;
  block[3] = &unk_1008463A0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)configureForCompanionRanging:(id)a3 options:(id)a4 reply:(id)a5
{
  id v60 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  int64_t v11 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(NSDictionary *)self->_clientInfo objectForKey:PRProcessNameKey];
    v13 = [(NSDictionary *)self->_clientInfo objectForKey:PRProcessIdentifierKey];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [v13 intValue];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PRCompanionRanging: XPC command - configureForCompanionRanging. Process name: %@, pid: %d", buf, 0x12u);
  }
  v14 = +[NSUserDefaults standardUserDefaults];
  v59 = [v14 dictionaryRepresentation];

  shared_ptr<PRRangingManagerClient> v15 = [v59 objectForKey:@"R1Preamble"];
  id v16 = v15;
  if (v15)
  {
    id v17 = [v15 integerValue];
    CFStringRef v18 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Setting special R1 preamble %lli", buf, 0xCu);
    }
    v86[0] = PRP2PArgsRxPreamble;
    NSErrorUserInfoKey v19 = +[NSNumber numberWithInteger:v17];
    v87[0] = v19;
    v86[1] = PRP2PArgsTxPreamble;
    CFStringRef v20 = +[NSNumber numberWithInteger:v17];
    v87[1] = v20;
    v21 = +[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:2];

    id v22 = objc_alloc_init((Class)NSMutableDictionary);
    [v22 addEntriesFromDictionary:v21];
    if (v9) {
      [v22 addEntriesFromDictionary:v9];
    }

    id v9 = v22;
  }
  else
  {
    v23 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Using normal R1 preamble", buf, 2u);
    }
  }
  if (self->_p2pServiceId)
  {
    v24 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "PRRangingManager unregisterForService #companion-retry", buf, 2u);
    }
    self->_int localRangingState = 0;
    v25 = sub_1002F6464();
    sub_10001A8A4(buf, (void *)self->_rangingManagerClient.__ptr_ + 1);
    uint64_t v70 = *(void *)buf;
    v71 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 16), 1uLL, memory_order_relaxed);
    }
    BOOL v26 = sub_1002F7308((uint64_t)v25, &v70, self->_p2pServiceId);
    if (v71) {
      std::__shared_weak_count::__release_weak(v71);
    }
    if (*(void *)&buf[8]) {
      sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
    }
    if (!v26)
    {
      NSErrorUserInfoKey v84 = NSLocalizedDescriptionKey;
      CFStringRef v85 = @"Failed to override P2P job.";
      v50 = +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
      v51 = PRErrorWithCodeAndUserInfo(999, v50);

      v10[2](v10, 0, v51);
      goto LABEL_64;
    }
  }
  if ([v60 deviceType] != (id)3
    || ([v60 UUID],
        v27 = objc_claimAutoreleasedReturnValue(),
        BOOL v28 = v27 == 0,
        v27,
        v28))
  {
    NSErrorUserInfoKey v82 = NSLocalizedDescriptionKey;
    CFStringRef v83 = @"Remote device must be PRDeviceTypeCompanion and have a valid UUID.";
    v48 = +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    v49 = PRErrorWithCodeAndUserInfo(100, v48);

    v10[2](v10, 0, v49);
    goto LABEL_64;
  }
  objc_storeStrong((id *)&self->_companion, a3);
  $C1B61179E9818A625A385C7F24D0BBAA v81 = 0;
  v29 = [(PRRemoteDevice *)self->_companion roseMACAddress];
  [v29 getBytes:&v81 range:0];

  v30 = [(PRRemoteDevice *)self->_companion UUID];
  [v30 getUUIDBytes:&v80];

  $C1B61179E9818A625A385C7F24D0BBAA v31 = v81;
  self->_peerDescriptor.var0.__val_.type = 3;
  BOOL engaged = self->_peerDescriptor.__engaged_;
  self->_peerDescriptor.var0.__val_.uuid.var0 = v80;
  self->_peerDescriptor.var0.__val_.uuid.__engaged_ = 1;
  self->_peerDescriptor.var0.__val_.rose_mac_address.var0 = v31;
  *(_WORD *)&self->_peerDescriptor.var0.__val_.rose_mac_address.__engaged_ = 1;
  self->_peerDescriptor.var0.__val_.bt_adv_address.__engaged_ = 0;
  if (!engaged) {
    self->_peerDescriptor.__engaged_ = 1;
  }
  *(_WORD *)v67 = 0;
  p_peerDescriptor = &self->_peerDescriptor;
  v33 = +[NSUserDefaults standardUserDefaults];
  __int16 v69 = 1;
  if ([v33 BOOLForKey:@"CompanionFeature1Disable"]) {
    LOBYTE(v69) = 0;
  }
  HIBYTE(v69) = 0;
  v34 = [v9 objectForKey:@"GattRanging"];
  v35 = v34;
  if (v34)
  {
    HIBYTE(v69) = [v34 BOOLValue];
    v36 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      if (HIBYTE(v69)) {
        v37 = "YES";
      }
      else {
        v37 = "NO";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Setting gatt ranging interval use to %s", buf, 0xCu);
    }
  }
  v38 = sub_1002F6464();
  uint64_t v39 = v38[406];
  v40 = (std::__shared_weak_count *)v38[407];
  if (v40) {
    atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v58 = v40;
  if (v39)
  {
    v57 = v35;
    v41 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "PRRangingManager prepareRangingServiceRequest #companion-retry", buf, 2u);
    }
    v35 = v57;
    if (sub_1002CE2DC(v39, &v66, v67, 0))
    {
      sub_10017EE48(&v66, (uint64_t)buf);
      if (v9)
      {
        id v65 = 0;
        char v42 = sub_1000105DC(v9, v75, &v65);
        id v43 = v65;
        v44 = v43;
        if ((v42 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
            sub_10040CA34();
          }
          v10[2](v10, 0, v44);
          goto LABEL_60;
        }
      }
      v45 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v61 = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "PRRangingManager registerForService #companion-retry", v61, 2u);
      }
      v46 = sub_1002F6464();
      sub_10001A8A4(v61, (void *)self->_rangingManagerClient.__ptr_ + 1);
      uint64_t v63 = *(void *)v61;
      v64 = v62;
      if (v62) {
        atomic_fetch_add_explicit(&v62->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      }
      int v47 = sub_1002F6CB4((uint64_t)v46, &v63);
      if (v64) {
        std::__shared_weak_count::__release_weak(v64);
      }
      if (v62) {
        sub_10001A970(v62);
      }
      if ((v47 & 0xFF0000) != 0)
      {
        self->_int localRangingState = 1;
        [(PRCompanionRangingClientProxy *)self combineAndReportLocalAndCompanionRangingRequestStatus];
        objc_sync_enter(self);
        self->_p2pServiceId = v47;
        operator new();
      }
      NSErrorUserInfoKey v72 = NSLocalizedDescriptionKey;
      CFStringRef v73 = @"Register for service failed";
      v56 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      v44 = PRErrorWithCodeAndUserInfo(999, v56);

      v10[2](v10, 0, v44);
LABEL_60:

      goto LABEL_61;
    }
    NSErrorUserInfoKey v76 = NSLocalizedDescriptionKey;
    CFStringRef v77 = @"Failed to prepare service request.";
    v54 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
    v55 = PRErrorWithCodeAndUserInfo(999, v54);

    v10[2](v10, 0, v55);
  }
  else
  {
    NSErrorUserInfoKey v78 = NSLocalizedDescriptionKey;
    CFStringRef v79 = @"Configuration Manager Error.";
    v52 = +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
    v53 = PRErrorWithCodeAndUserInfo(999, v52);

    v10[2](v10, 0, v53);
  }
LABEL_61:
  if (v58) {
    sub_10001A970(v58);
  }

LABEL_64:
}

- (void)startCompanionRanging:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, BOOL, void))a5;
  int64_t v11 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(NSDictionary *)self->_clientInfo objectForKey:PRProcessNameKey];
    v13 = [(NSDictionary *)self->_clientInfo objectForKey:PRProcessIdentifierKey];
    *(_DWORD *)buf = 138412546;
    id v39 = v12;
    __int16 v40 = 1024;
    unsigned int v41 = [v13 intValue];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PRCompanionRanging: XPC command - startCompanionRanging. Process name: %@, pid: %d", buf, 0x12u);
  }
  if ([v8 deviceType] == (id)3
    && ([v8 UUID], (v14 = objc_claimAutoreleasedReturnValue()) != 0)
    && (BOOL v15 = !self->_peerDescriptor.__engaged_, v14, !v15))
  {
    id v16 = [v8 UUID];
    id v17 = [(PRRemoteDevice *)self->_companion UUID];
    unsigned __int8 v18 = [v16 isEqual:v17];

    if (v18)
    {
      if (self->_p2pServiceId)
      {
        if (self->_localRangingState == 1)
        {
          if (self->_companionRangingState == 1)
          {
            objc_storeStrong((id *)&self->_startOptions, a4);
            id v27 = 0;
            BOOL v19 = [(PRCompanionRangingClientProxy *)self startRangingMangagerAndCompanion:&v27];
            id v20 = v27;
            id v21 = v20;
            if (v19)
            {
              id v21 = 0;
              self->_int clientRequestState = 3;
            }
            ((void (**)(id, BOOL, id))v10)[2](v10, v19, v21);
          }
          else
          {
            NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
            CFStringRef v29 = @"Companion ranging is not stopped, cannot start.  ";
            BOOL v26 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
            PRErrorWithCodeAndUserInfo(102, v26);
            id v20 = (id)objc_claimAutoreleasedReturnValue();

            ((void (**)(id, BOOL, id))v10)[2](v10, 0, v20);
          }
        }
        else
        {
          NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
          CFStringRef v31 = @"Local ranging is not stopped, cannot start.  ";
          v25 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
          PRErrorWithCodeAndUserInfo(102, v25);
          id v20 = (id)objc_claimAutoreleasedReturnValue();

          ((void (**)(id, BOOL, id))v10)[2](v10, 0, v20);
        }
      }
      else
      {
        NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
        CFStringRef v33 = @"Asked to start ranging with invalid ticket id. Was ranging configured first?";
        v24 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        PRErrorWithCodeAndUserInfo(102, v24);
        id v20 = (id)objc_claimAutoreleasedReturnValue();

        ((void (**)(id, BOOL, id))v10)[2](v10, 0, v20);
      }
    }
    else
    {
      NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
      CFStringRef v35 = @"Asked to start ranging with a companion with a different UUID than the one configured for ranging.";
      v23 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      PRErrorWithCodeAndUserInfo(100, v23);
      id v20 = (id)objc_claimAutoreleasedReturnValue();

      ((void (**)(id, BOOL, id))v10)[2](v10, 0, v20);
    }
  }
  else
  {
    NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
    CFStringRef v37 = @"Remote device must be PRDeviceTypeCompanion and have a valid UUID.";
    id v22 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    PRErrorWithCodeAndUserInfo(100, v22);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, BOOL, id))v10)[2](v10, 0, v20);
  }
}

- (BOOL)startRangingMangagerAndCompanion:(id *)a3
{
  int companionRangingState = self->_companionRangingState;
  if (companionRangingState == 1)
  {
    uint64_t v5 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_companionRangingManager prepareRangingOnDevice #companion-retry", v11, 2u);
    }
    companionRangingManager = self->_companionRangingManager;
    unsigned __int8 v7 = [(PRRemoteDevice *)self->_companion UUID];
    [(CLFindMyAccessoryManager *)companionRangingManager prepareRangingOnDevice:v7];

    self->_int companionRangingState = 2;
  }
  else
  {
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFStringRef v13 = @"startRangingMangagerAndCompanion failed, not in stopped state";
    id v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v9 = PRErrorWithCodeAndUserInfo(102, v8);

    [(PRCompanionRangingClientProxy *)self handleError:v9];
  }
  return companionRangingState == 1;
}

- (void)startRangingMangager
{
  if (self->_lastStartScheduledTooSoon)
  {
    v3 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRCompanionRanging: using conservative start time offset", buf, 2u);
    }
    self->_lastStartScheduledTooSoon = 0;
    unint64_t v4 = 1500000;
  }
  else
  {
    unint64_t v4 = 510000;
  }
  uint64_t v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 objectForKey:@"TimeSyncPathListeningWindowMSec"];
  unsigned __int8 v7 = v6;
  if (v6)
  {
    unsigned int v8 = 1000 * [v6 intValue];
    id v9 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PRCompanionRanging: listeningWindowSizeUsec overridden by user to %u", buf, 8u);
    }
  }
  else
  {
    unsigned int v8 = 3000;
  }
  startOptions = self->_startOptions;
  if (startOptions)
  {
    int64_t v11 = [(NSDictionary *)startOptions objectForKey:PRP2PArgsStartTimeOffsetUsec];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v4 = (int)[v11 intValue];
        NSErrorUserInfoKey v12 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v4;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PRCompanionRanging: startCompanionRanging override startTimeOffsetUsec: %llu", buf, 0xCu);
        }
      }
    }
    CFStringRef v13 = [(NSDictionary *)self->_startOptions objectForKey:PRP2PArgsListeningWindowSizeUsec];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v8 = [v13 intValue];
        v14 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v8;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PRCompanionRanging: startCompanionRanging override listeningWindowSizeUsec: %u", buf, 8u);
        }
      }
    }
  }
  if (!self->_peerDescriptor.__engaged_) {
    sub_10000AE44();
  }
  long long v15 = *(long long *)((char *)&self->_peerDescriptor.var0.__val_.uuid.var0 + 12);
  *(_OWORD *)buf = *(_OWORD *)&self->_peerDescriptor.var0.__null_state_;
  long long v31 = v15;
  uint64_t v32 = *(void *)&self->_peerDescriptor.var0.__val_.bt_adv_address.var0.__val_.__elems_[2];
  char v33 = 1;
  uint64_t v34 = 30000 * vcvtad_u64_f64((double)v4 / 30000.0);
  char v35 = 2;
  unsigned int v36 = v8;
  uint64_t v37 = 0;
  uint64_t v38 = 0x10000001ELL;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_companionRangingManager startEventCounterForDevice #companion-retry", (uint8_t *)&v24, 2u);
  }
  companionRangingManager = self->_companionRangingManager;
  unsigned __int8 v18 = [(PRRemoteDevice *)self->_companion UUID];
  [(CLFindMyAccessoryManager *)companionRangingManager startEventCounterForDevice:v18];

  BOOL v19 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "PRRangingManager startUserTriggeredRanging #companion-retry", (uint8_t *)&v24, 2u);
  }
  id v20 = sub_1002F6464();
  sub_10001A8A4(&v24, (void *)self->_rangingManagerClient.__ptr_ + 1);
  uint64_t v26 = v24;
  id v27 = v25;
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  BOOL v21 = sub_1002F7A30((uint64_t)v20, &v26, self->_p2pServiceId);
  if (v27) {
    std::__shared_weak_count::__release_weak(v27);
  }
  if (v25) {
    sub_10001A970(v25);
  }
  if (!v21)
  {
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    CFStringRef v29 = @"Initate user triggered ranging failed";
    id v22 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v23 = PRErrorWithCodeAndUserInfo(102, v22);

    [(PRCompanionRangingClientProxy *)self handleError:v23];
  }
  self->_int localRangingState = 2;
}

- (void)stopCompanionRanging:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, BOOL, void))a4;
  unsigned int v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(NSDictionary *)self->_clientInfo objectForKey:PRProcessNameKey];
    id v10 = [(NSDictionary *)self->_clientInfo objectForKey:PRProcessIdentifierKey];
    *(_DWORD *)buf = 138412546;
    id v21 = v9;
    __int16 v22 = 1024;
    unsigned int v23 = [v10 intValue];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PRCompanionRanging: XPC command - stopCompanionRanging. Process name: %@, pid: %d", buf, 0x12u);
  }
  if ([v6 deviceType] == (id)3
    && ([v6 UUID], (int64_t v11 = objc_claimAutoreleasedReturnValue()) != 0)
    && (BOOL v12 = !self->_peerDescriptor.__engaged_, v11, !v12))
  {
    id v17 = 0;
    BOOL v13 = [(PRCompanionRangingClientProxy *)self stopRangingMangagerAndCompanion:&v17];
    id v14 = v17;
    id v15 = v14;
    if (v13)
    {
      id v15 = 0;
      self->_int clientRequestState = 5;
    }
    ((void (**)(id, BOOL, id))v7)[2](v7, v13, v15);
  }
  else
  {
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    CFStringRef v19 = @"Remote device must be PRDeviceTypeCompanion and have a valid UUID.";
    id v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    PRErrorWithCodeAndUserInfo(100, v16);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, BOOL, id))v7)[2](v7, 0, v14);
  }
}

- (BOOL)stopRangingMangagerAndCompanion:(id *)a3
{
  int localRangingState = self->_localRangingState;
  if ((localRangingState - 2) < 2)
  {
    if (a3)
    {
      NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
      CFStringRef v34 = @"Received stopCompanionRanging while Local ranging is starting.  ";
      id v6 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      unsigned __int8 v7 = PRErrorWithCodeAndUserInfo(103, v6);
      goto LABEL_8;
    }
  }
  else if (localRangingState == 4)
  {
    if (self->_p2pServiceId)
    {
      id v9 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PRRangingManager stopUserTriggeredRanging #companion-retry", (uint8_t *)&v21, 2u);
      }
      self->_int localRangingState = 5;
      id v10 = sub_1002F6464();
      sub_10001A8A4(&v21, (void *)self->_rangingManagerClient.__ptr_ + 1);
      uint64_t v23 = v21;
      uint64_t v24 = v22;
      if (v22) {
        atomic_fetch_add_explicit(&v22->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      }
      BOOL v8 = sub_1002F8634((uint64_t)v10, &v23, self->_p2pServiceId);
      if (v24) {
        std::__shared_weak_count::__release_weak(v24);
      }
      if (v22) {
        sub_10001A970(v22);
      }
      if (a3) {
        char v11 = v8;
      }
      else {
        char v11 = 1;
      }
      if ((v11 & 1) == 0)
      {
        v29[0] = NSLocalizedDescriptionKey;
        v29[1] = NSLocalizedFailureReasonErrorKey;
        v30[0] = @"Failed to stop ranging";
        v30[1] = @"Stop ranging failed.";
        BOOL v12 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
        PRErrorWithCodeAndUserInfo(103, v12);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      BOOL v13 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "_companionRangingManager stopEventCounterForDevice #companion-retry", (uint8_t *)&v21, 2u);
      }
      companionRangingManager = self->_companionRangingManager;
      id v6 = [(PRRemoteDevice *)self->_companion UUID];
      [(CLFindMyAccessoryManager *)companionRangingManager stopEventCounterForDevice:v6];
      goto LABEL_26;
    }
    if (a3)
    {
      v31[0] = NSLocalizedDescriptionKey;
      v31[1] = NSLocalizedFailureReasonErrorKey;
      v32[0] = @"Failed to stop ranging";
      v32[1] = @"No service request.";
      id v6 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
      unsigned __int8 v7 = PRErrorWithCodeAndUserInfo(103, v6);
      goto LABEL_8;
    }
  }
  else
  {
    if (localRangingState)
    {
      BOOL v8 = 1;
      goto LABEL_31;
    }
    if (a3)
    {
      NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
      CFStringRef v36 = @"Local ranging state is not valid, cannot stop.  ";
      id v6 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      unsigned __int8 v7 = PRErrorWithCodeAndUserInfo(103, v6);
LABEL_8:
      BOOL v8 = 0;
      *a3 = v7;
LABEL_26:

      goto LABEL_31;
    }
  }
  BOOL v8 = 0;
LABEL_31:
  int companionRangingState = self->_companionRangingState;
  if ((companionRangingState - 2) < 3)
  {
    if (a3)
    {
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      CFStringRef v26 = @"Received stopCompanionRanging while Companion ranging is starting.  ";
      id v16 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      id v17 = PRErrorWithCodeAndUserInfo(103, v16);
LABEL_38:
      BOOL v8 = 0;
      *a3 = v17;
LABEL_43:

      return v8;
    }
    return 0;
  }
  if (companionRangingState == 5)
  {
    NSErrorUserInfoKey v18 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "_companionRangingManager stopRangingOnDevice #companion-retry", (uint8_t *)&v21, 2u);
    }
    self->_int companionRangingState = 6;
    CFStringRef v19 = self->_companionRangingManager;
    id v16 = [(PRRemoteDevice *)self->_companion UUID];
    [(CLFindMyAccessoryManager *)v19 stopRangingOnDevice:v16];
    goto LABEL_43;
  }
  if (!companionRangingState)
  {
    if (a3)
    {
      NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
      CFStringRef v28 = @"Companion ranging state is not valid, cannot stop.  ";
      id v16 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      id v17 = PRErrorWithCodeAndUserInfo(103, v16);
      goto LABEL_38;
    }
    return 0;
  }
  return v8;
}

- (void)cleanupRangingManagerAndCompanionAfterError:(id)a3
{
  id v4 = a3;
  BOOL cleaningUponDidFail = self->_cleaningUponDidFail;
  id v6 = qword_1008ABDE0;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
  if (cleaningUponDidFail)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received an error while cleaning up: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cleanup companionRangingManager and Companion After Error #companion-retry", buf, 2u);
    }
    self->_BOOL cleaningUponDidFail = 1;
    id v15 = 0;
    [(PRCompanionRangingClientProxy *)self stopRangingMangagerAndCompanion:&v15];
    id v8 = v15;
    if (self->_p2pServiceId)
    {
      id v9 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PRRangingManager unregisterForService #companion-retry", buf, 2u);
      }
      self->_int localRangingState = 0;
      id v10 = sub_1002F6464();
      sub_10001A8A4(buf, (void *)self->_rangingManagerClient.__ptr_ + 1);
      long long v14 = *(_OWORD *)buf;
      if (*(void *)&buf[8]) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 16), 1uLL, memory_order_relaxed);
      }
      sub_1002F7308((uint64_t)v10, (uint64_t *)&v14, self->_p2pServiceId);
      if (*((void *)&v14 + 1)) {
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v14 + 1));
      }
      if (*(void *)&buf[8]) {
        sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
      }
      self->_p2pServiceId = 0;
    }
    [(PRCompanionRangingClientProxy *)self deinitCompanion];
    char v11 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "_companionRangingManager initWithDelegate #companion-retry", buf, 2u);
    }
    BOOL v12 = (CLFindMyAccessoryManager *)[objc_alloc((Class)CLFindMyAccessoryManager) initWithDelegate:self delegateQueue:self->_queue];
    companionRangingManager = self->_companionRangingManager;
    self->_companionRangingManager = v12;

    self->_BOOL cleaningUponDidFail = 0;
  }
}

- (void)initCompanion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 UUID];
    int v11 = 138412290;
    BOOL v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Init companion. UUID: %@", (uint8_t *)&v11, 0xCu);
  }
  BOOL v7 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_companionRangingManager initRoseWithParameters #companion-retry", (uint8_t *)&v11, 2u);
  }
  self->_companionRoseState = 1;
  companionRangingManager = self->_companionRangingManager;
  id v9 = [v4 UUID];
  id v10 = [v4 roseMACAddress];
  [(CLFindMyAccessoryManager *)companionRangingManager initRangingOnDevice:v9 macAddress:v10];
}

- (void)deinitCompanion
{
  if (self->_companionRoseState)
  {
    v3 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(PRRemoteDevice *)self->_companion UUID];
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deinit companion. UUID: %@", (uint8_t *)&v8, 0xCu);
    }
    *(void *)&self->_int companionRangingState = 0x400000000;
    uint64_t v5 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_companionRangingManager deinitRangingOnDevice #companion-retry", (uint8_t *)&v8, 2u);
    }
    companionRangingManager = self->_companionRangingManager;
    BOOL v7 = [(PRRemoteDevice *)self->_companion UUID];
    [(CLFindMyAccessoryManager *)companionRangingManager deinitRangingOnDevice:v7];
  }
}

- (void)configureCompanionForRanging
{
  v3 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PRRemoteDevice *)self->_companion UUID];
    *(_DWORD *)buf = 138412290;
    long long v40 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Configure companion for ranging. UUID: %@", buf, 0xCu);
  }
  id v10 = sub_1002F6464();
  uint64_t v11 = *((void *)v10 + 406);
  BOOL v12 = (std::__shared_weak_count *)*((void *)v10 + 407);
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v11)
  {
    value = self->_rangingRequest.__ptr_.__value_;
    if (value)
    {
      int v32 = 0;
      if (sub_1002CE924(v11, (uint64_t)value, (uint64_t)&v32, v5, v6, v7, v8, v9))
      {
        long long v14 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "+++++++++++++++++++++++++++++++++++++++++", buf, 2u);
        }
        id v15 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sent command to remote device:", buf, 2u);
        }
        id v16 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v40) = v32;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "   countryCode: 0x%x", buf, 8u);
        }
        id v17 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v40) = BYTE1(v32) & 3;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "   channel: 0x%x", buf, 8u);
        }
        NSErrorUserInfoKey v18 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v40) = (BYTE1(v32) >> 2) & 3;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "   txPreamble: 0x%x", buf, 8u);
        }
        CFStringRef v19 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v40) = (BYTE1(v32) >> 4) & 3;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "   rxPreamble: 0x%x", buf, 8u);
        }
        id v20 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v40) = HIWORD(v32);
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "   intervalMs: %d", buf, 8u);
        }
        uint64_t v21 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "+++++++++++++++++++++++++++++++++++++++++", buf, 2u);
        }
        __int16 v22 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "_companionRangingManager setRoseRangingParameters #companion-retry", buf, 2u);
        }
        self->_companionRoseState = 2;
        companionRangingManager = self->_companionRangingManager;
        uint64_t v24 = [(PRRemoteDevice *)self->_companion UUID];
        NSErrorUserInfoKey v25 = [(PRRemoteDevice *)self->_companion roseMACAddress];
        LOWORD(v31) = HIWORD(v32);
        [(CLFindMyAccessoryManager *)companionRangingManager configureRangingOnDevice:v24 macAddress:v25 countryCode:v32 uwbChannel:BYTE1(v32) & 3 acqPreamble:(BYTE1(v32) >> 2) & 3 trackingPreamble:(BYTE1(v32) >> 4) & 3 interval:v31];
      }
      else
      {
        NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
        CFStringRef v34 = @"Failed to construct companion range config command.";
        NSErrorUserInfoKey v30 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        uint64_t v24 = PRErrorWithCodeAndUserInfo(101, v30);

        [(PRCompanionRangingClientProxy *)self handleError:v24];
      }
    }
    else
    {
      NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
      CFStringRef v36 = @"No cached ranging request.";
      CFStringRef v28 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      CFStringRef v29 = PRErrorWithCodeAndUserInfo(999, v28);

      [(PRCompanionRangingClientProxy *)self handleError:v29];
    }
  }
  else
  {
    NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
    CFStringRef v38 = @"Configuration Manager Error.";
    CFStringRef v26 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    NSErrorUserInfoKey v27 = PRErrorWithCodeAndUserInfo(999, v26);

    [(PRCompanionRangingClientProxy *)self handleError:v27];
  }
  if (v12) {
    sub_10001A970(v12);
  }
}

- (void)findMyAccessoryManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5
{
  uint64_t v8 = (CLFindMyAccessoryManager *)a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10
    || self->_companionRangingManager == v8
    && ([(PRRemoteDevice *)self->_companion UUID],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v10 isEqual:v11],
        v11,
        (v12 & 1) != 0))
  {
    BOOL v13 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didFailWithError #companion-retry error:%@", buf, 0xCu);
    }
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    CFStringRef v17 = @"Generic companion ranging error.";
    long long v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v15 = PRErrorWithCodeAndUserInfo(301, v14);

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040CA9C();
    }
    [(PRCompanionRangingClientProxy *)self handleError:v15];
  }
}

- (void)findMyAccessoryManager:(id)a3 didConnectDevice:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (self->_companionRangingManager == a3)
  {
    id v10 = [(PRRemoteDevice *)self->_companion UUID];
    unsigned __int8 v11 = [v8 isEqual:v10];

    if (v11)
    {
      unsigned __int8 v12 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didConnectDevice #companion-retry error:%@", buf, 0xCu);
      }
      if (v9)
      {
        self->_int companionConnectionState = 0;
        NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
        CFStringRef v18 = @"Error connecting to peer.";
        BOOL v13 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        long long v14 = PRErrorWithCodeAndUserInfo(301, v13);

        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040CB04();
        }
        [(PRCompanionRangingClientProxy *)self handleError:v14];
      }
      else
      {
        id v15 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v8;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "------ new connection: %@", buf, 0xCu);
        }
        int companionConnectionState = self->_companionConnectionState;
        self->_int companionConnectionState = 3;
        if (companionConnectionState == 2) {
          [(PRCompanionRangingClientProxy *)self initCompanion:self->_companion];
        }
      }
    }
  }
}

- (void)findMyAccessoryManager:(id)a3 didDisconnectDevice:(id)a4
{
  id v6 = a4;
  if (self->_companionRangingManager == a3)
  {
    uint64_t v7 = [(PRRemoteDevice *)self->_companion UUID];
    unsigned __int8 v8 = [v6 isEqual:v7];

    if (v8)
    {
      id v9 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didDisconnectDevice #companion-retry", buf, 2u);
      }
      id v10 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        companion = self->_companion;
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = companion;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "------ disconnection: %@", buf, 0xCu);
      }
      int companionConnectionState = self->_companionConnectionState;
      if (companionConnectionState == 4)
      {
        BOOL v13 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "_companionRangingManager disconnect complete #companion-retry", buf, 2u);
        }
      }
      else if (self->_companionRoseState)
      {
        NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
        CFStringRef v21 = @"Disconnected while rose activity incomplete";
        long long v14 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        id v15 = PRErrorWithCodeAndUserInfo(302, v14);

        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040CBA0();
        }
        [(PRCompanionRangingClientProxy *)self handleError:v15];
      }
      else if (companionConnectionState == 2)
      {
        NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
        CFStringRef v19 = @"Disconnected while connecting";
        NSErrorUserInfoKey v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        NSErrorUserInfoKey v17 = PRErrorWithCodeAndUserInfo(302, v16);

        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040CB6C();
        }
        [(PRCompanionRangingClientProxy *)self didFailWithError:v17];
      }
      [(PRCompanionRangingClientProxy *)self remoteDevice:self->_companion didChangeState:0];
      self->_int companionConnectionState = 1;
    }
  }
}

- (void)findMyAccessoryManager:(id)a3 didConfigureRangingOnDevice:(id)a4 withStatus:(unsigned int)a5 error:(id)a6
{
  id v10 = a4;
  unsigned __int8 v11 = (PRRemoteDevice *)a6;
  if (self->_companionRangingManager == a3)
  {
    unsigned __int8 v12 = [(PRRemoteDevice *)self->_companion UUID];
    unsigned __int8 v13 = [v10 isEqual:v12];

    if (v13)
    {
      long long v14 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        NSErrorUserInfoKey v25 = v11;
        __int16 v26 = 1024;
        unsigned int v27 = a5;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didConfigureRangingOnDevice #companion-retry error:%@, status:%d", buf, 0x12u);
      }
      if (self->_companionRoseState != 2)
      {
        NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
        CFStringRef v23 = @"Unexpected didConfigureRangingOnDevice";
        NSErrorUserInfoKey v17 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        NSErrorUserInfoKey v16 = PRErrorWithCodeAndUserInfo(301, v17);

        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040CC3C();
        }
        [(PRCompanionRangingClientProxy *)self handleError:v16];
        goto LABEL_13;
      }
      if (v11)
      {
        NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
        CFStringRef v21 = @"Error configuring ranging parameters on peer.";
        id v15 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        NSErrorUserInfoKey v16 = PRErrorWithCodeAndUserInfo(302, v15);

        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040CBD4();
        }
        [(PRCompanionRangingClientProxy *)self handleError:v16];
LABEL_13:

        goto LABEL_14;
      }
      NSErrorUserInfoKey v18 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        companion = self->_companion;
        *(_DWORD *)buf = 138412290;
        NSErrorUserInfoKey v25 = companion;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "------ ConfigureRangingOnDevice: %@", buf, 0xCu);
      }
      *(void *)&self->_int companionRangingState = 0x300000001;
      self->_int clientRequestState = 2;
      [(PRCompanionRangingClientProxy *)self remoteDevice:self->_companion didChangeState:1];
    }
  }
LABEL_14:
}

- (void)findMyAccessoryManager:(id)a3 didInitRangingOnDevice:(id)a4 withStatus:(unsigned int)a5 error:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if (self->_companionRangingManager != a3) {
    goto LABEL_30;
  }
  unsigned __int8 v12 = [(PRRemoteDevice *)self->_companion UUID];
  unsigned __int8 v13 = [v10 isEqual:v12];

  if ((v13 & 1) == 0) {
    goto LABEL_30;
  }
  long long v14 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v11;
    __int16 v32 = 1024;
    unsigned int v33 = a5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didInitRoseOnDevice #companion-retry error:%@, status:%d", buf, 0x12u);
  }
  if (self->_companionRoseState != 1)
  {
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    CFStringRef v29 = @"Unexpected didInitRoseOnDevice";
    NSErrorUserInfoKey v16 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    NSErrorUserInfoKey v17 = PRErrorWithCodeAndUserInfo(301, v16);

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040CD40();
    }
    [(PRCompanionRangingClientProxy *)self handleError:v17];
    goto LABEL_29;
  }
  id v15 = qword_1008ABDE0;
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[[[******** Remote Device Ready ********]]]", buf, 2u);
    }
    NSErrorUserInfoKey v18 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v31) = a5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Expected Ready ROSE_STATUS: 0x%x", buf, 8u);
    }
    NSErrorUserInfoKey v17 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v19 = [v17 BOOLForKey:@"B389_SimulateLowPower"];
    if (a5 == 1) {
      char v20 = 1;
    }
    else {
      char v20 = v19;
    }
    if (v20)
    {
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      CFStringRef v27 = @"Failed to initialize ranging on accessory";
      CFStringRef v21 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      NSErrorUserInfoKey v22 = PRErrorWithCodeAndUserInfo(300, v21);

      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040CC70();
      }
      [(PRCompanionRangingClientProxy *)self handleError:v22];
    }
    else
    {
      if (!a5)
      {
        [(PRCompanionRangingClientProxy *)self configureCompanionForRanging];
        goto LABEL_29;
      }
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      CFStringRef v25 = @"Error from R1 while initializing";
      CFStringRef v23 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      NSErrorUserInfoKey v22 = PRErrorWithCodeAndUserInfo(301, v23);

      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040CC70();
      }
      [(PRCompanionRangingClientProxy *)self handleError:v22];
    }

LABEL_29:
    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10040CCD8();
  }
  [(PRCompanionRangingClientProxy *)self handleError:v11];
LABEL_30:
}

- (void)findMyAccessoryManager:(id)a3 didDeinitRangingOnDevice:(id)a4 withStatus:(unsigned int)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if (self->_companionRangingManager == a3)
  {
    id v11 = [(PRRemoteDevice *)self->_companion UUID];
    unsigned __int8 v12 = [v9 isEqual:v11];

    if (v12)
    {
      unsigned __int8 v13 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didDeinitRangingOnDevice #companion-retry error:%@", buf, 0xCu);
      }
      if (self->_companionRoseState != 4)
      {
        NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
        CFStringRef v26 = @"Unexpected didDeinitRangingOnDevice";
        NSErrorUserInfoKey v16 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        id v15 = PRErrorWithCodeAndUserInfo(301, v16);

        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040CDDC();
        }
        [(PRCompanionRangingClientProxy *)self handleError:v15];
        goto LABEL_20;
      }
      if (v10)
      {
        NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
        CFStringRef v22 = @"Error deiniting R1 on companion";
        long long v14 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        id v15 = PRErrorWithCodeAndUserInfo(301, v14);

        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040CD74();
        }
        [(PRCompanionRangingClientProxy *)self handleError:v15];
        goto LABEL_20;
      }
      self->_companionRoseState = 0;
      unsigned int companionConnectionState = self->_companionConnectionState;
      if (companionConnectionState < 3) {
        goto LABEL_16;
      }
      if (companionConnectionState == 3)
      {
        self->_unsigned int companionConnectionState = 4;
        unsigned __int8 v19 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "_companionRangingManager disconnectFromDevice #companion-retry", buf, 2u);
        }
        companionRangingManager = self->_companionRangingManager;
        id v15 = [(PRRemoteDevice *)self->_companion UUID];
        [(CLFindMyAccessoryManager *)companionRangingManager disconnectDevice:v15];
        goto LABEL_20;
      }
      if (companionConnectionState == 4)
      {
LABEL_16:
        NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
        CFStringRef v24 = @"Unexpected BT connection state";
        NSErrorUserInfoKey v18 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        id v15 = PRErrorWithCodeAndUserInfo(301, v18);

        [(PRCompanionRangingClientProxy *)self handleError:v15];
LABEL_20:
      }
    }
  }
}

- (void)findMyAccessoryManager:(id)a3 didStartRangingOnDevice:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (self->_companionRangingManager == a3)
  {
    id v10 = [(PRRemoteDevice *)self->_companion UUID];
    unsigned __int8 v11 = [v8 isEqual:v10];

    if (v11)
    {
      unsigned __int8 v12 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didStartRangingOnDevice #companion-retry error:%@", buf, 0xCu);
      }
      if (self->_companionRangingState != 4)
      {
        NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
        CFStringRef v20 = @"Unexpected didStartRangingOnDevice";
        id v15 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        long long v14 = PRErrorWithCodeAndUserInfo(301, v15);

        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040CE10();
        }
        [(PRCompanionRangingClientProxy *)self handleError:v14];
        goto LABEL_13;
      }
      if (v9)
      {
        NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
        CFStringRef v18 = @"Error starting ranging on companion";
        unsigned __int8 v13 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        long long v14 = PRErrorWithCodeAndUserInfo(301, v13);

        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040CD74();
        }
        [(PRCompanionRangingClientProxy *)self handleError:v14];
LABEL_13:

        goto LABEL_14;
      }
      NSErrorUserInfoKey v16 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "started ranging on companion", buf, 2u);
      }
      self->_int companionRangingState = 5;
      [(PRCompanionRangingClientProxy *)self combineAndReportLocalAndCompanionRangingRequestStatus];
    }
  }
LABEL_14:
}

- (void)findMyAccessoryManager:(id)a3 didCompleteRangingOnDevice:(id)a4 withStatus:(unsigned int)a5 endReason:(unsigned __int8)a6 error:(id)a7
{
  int v8 = a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a4;
  id v13 = a7;
  if (self->_companionRangingManager == a3)
  {
    long long v14 = [(PRRemoteDevice *)self->_companion UUID];
    unsigned __int8 v15 = [v12 isEqual:v14];

    if (v15)
    {
      NSErrorUserInfoKey v16 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        id v40 = v12;
        __int16 v41 = 2112;
        id v42 = v13;
        __int16 v43 = 1024;
        int v44 = v8;
        __int16 v45 = 1024;
        int v46 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "_companionRangingManager didCompleteRoseRangingOnDevice #companion-retry on device: %@, error: %@, endReason: %d, status: %d", buf, 0x22u);
      }
      if ((self->_companionRangingState - 5) >= 2)
      {
        NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
        CFStringRef v38 = @"Unexpected didCompleteRoseRangingOnDevice";
        CFStringRef v20 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        PRErrorWithCodeAndUserInfo(301, v20);
        id v18 = (id)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040CEB0();
        }
        [(PRCompanionRangingClientProxy *)self handleError:v18];
        goto LABEL_13;
      }
      if (v13)
      {
        NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
        CFStringRef v36 = @"Error reported upon ranging complete";
        NSErrorUserInfoKey v17 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        PRErrorWithCodeAndUserInfo(301, v17);
        id v18 = (id)objc_claimAutoreleasedReturnValue();

        NSErrorUserInfoKey v19 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          id v40 = v12;
          __int16 v41 = 2112;
          id v42 = v13;
          __int16 v43 = 1024;
          int v44 = v8;
          __int16 v45 = 1024;
          int v46 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "CLFindMyAccessoryManager failed to complete Rose ranging on device: %@, error: %@, endReason: %d, status: %d", buf, 0x22u);
        }
        [(PRCompanionRangingClientProxy *)self handleError:v18];
      }
      else
      {
        NSErrorUserInfoKey v21 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[[[******** Remote Device Range Complete ********]]]", buf, 2u);
        }
        self->_int companionRangingState = 1;
        id v22 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v40) = v9;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Range Complete Event ROSE_STATUS: 0x%x #companion-retry", buf, 8u);
        }
        if (v9 == 7)
        {
          self->_lastStartScheduledTooSoon = 1;
        }
        else
        {
          self->_lastStartScheduledTooSoon = 0;
          if (v9 == 14 || !v9)
          {
            self->_int companionRangingState = 1;
            id v32 = 0;
            unsigned __int8 v23 = [(PRCompanionRangingClientProxy *)self stopRangingMangagerAndCompanion:&v32];
            id v18 = v32;
            if ((v23 & 1) == 0) {
              [(PRCompanionRangingClientProxy *)self handleError:v18];
            }
            [(PRCompanionRangingClientProxy *)self combineAndReportLocalAndCompanionRangingRequestStatus];
            goto LABEL_13;
          }
        }
        NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
        CFStringRef v34 = @"Error reported in ranging complete";
        CFStringRef v24 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        PRErrorWithCodeAndUserInfo(301, v24);
        id v18 = (id)objc_claimAutoreleasedReturnValue();

        NSErrorUserInfoKey v25 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040CE44(v9, v25, v26, v27, v28, v29, v30, v31);
        }
        [(PRCompanionRangingClientProxy *)self handleError:v18];
      }
LABEL_13:
    }
  }
}

- (void)findMyAccessoryManager:(id)a3 didReceiveRangingErrorFromDevice:(id)a4 withStatus:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  if (self->_companionRangingManager == a3)
  {
    uint64_t v9 = [(PRRemoteDevice *)self->_companion UUID];
    unsigned __int8 v10 = [v8 isEqual:v9];

    if (v10)
    {
      self->_companionRoseState = 0;
      unsigned __int8 v11 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v19) = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didReceiveRoseError #companion-retry, status: %d", buf, 8u);
      }
      id v12 = +[NSString stringWithFormat:@"Error event ROSE_STATUS: %d", v5];
      id v13 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        NSErrorUserInfoKey v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
      v16[0] = NSLocalizedDescriptionKey;
      v16[1] = NSLocalizedFailureReasonErrorKey;
      v17[0] = @"Remote Device Reported Error";
      v17[1] = v12;
      long long v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      unsigned __int8 v15 = PRErrorWithCodeAndUserInfo(301, v14);

      [(PRCompanionRangingClientProxy *)self handleError:v15];
    }
  }
}

- (void)findMyAccessoryManager:(id)a3 didReceiveRangingTimestampFromDevice:(id)a4 status:(unsigned __int16)a5 rtt:(unint64_t)a6 tat:(unint64_t)a7 cycleIndex:(unsigned __int16)a8
{
  int v8 = a8;
  uint64_t v11 = a5;
  long long v14 = (CLFindMyAccessoryManager *)a3;
  id v15 = a4;
  if (self->_companionRangingManager == v14)
  {
    NSErrorUserInfoKey v16 = [(PRRemoteDevice *)self->_companion UUID];
    unsigned __int8 v17 = [v15 isEqual:v16];

    if (v17)
    {
      id v18 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        int v35 = v11;
        __int16 v36 = 2048;
        unint64_t v37 = a6;
        __int16 v38 = 2048;
        unint64_t v39 = a7;
        __int16 v40 = 1024;
        int v41 = v8;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didReceiveRangingTimestampsFromDevice #companion-retry, status: %d, rtt: %llu, tat: %llu, cycleIndex: %d", buf, 0x22u);
      }
      if ((self->_companionRangingState - 5) >= 2)
      {
        NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
        CFStringRef v43 = @"Unexpected didReceiveRangingTimestampsFromDevice";
        uint64_t v28 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        uint64_t v29 = PRErrorWithCodeAndUserInfo(301, v28);

        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040CEE4();
        }
        [(PRCompanionRangingClientProxy *)self handleError:v29];
      }
      else
      {
        v31[0] = sub_1003A82F0(v11, v19, v20, v21, v22, v23, v24, v25);
        v31[1] = v8;
        unint64_t v32 = a6;
        unint64_t v33 = a7;
        sub_100176E08((uint64_t)buf, 1, 0, 0, self->_p2pServiceId, (uint64_t)v31);
        uint64_t v26 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v30 = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "PRRangingManager ingestOutOfBandTimestampEvent #companion-retry", v30, 2u);
        }
        uint64_t v27 = sub_1002F6464();
        (*(void (**)(void *, uint8_t *))(*(void *)v27 + 120))(v27, buf);
      }
    }
  }
}

- (void)findMyAccessoryManager:(id)a3 didHaveRangingMovementOnDevice:(id)a4
{
  id v6 = a4;
  if (self->_companionRangingManager == a3)
  {
    uint64_t v7 = [(PRRemoteDevice *)self->_companion UUID];
    unsigned __int8 v8 = [v6 isEqual:v7];

    if (v8)
    {
      uint64_t v9 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned __int8 v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didHaveRangingMovementOnDevice #companion-retry", v10, 2u);
      }
      [(PRCompanionRangingClientProxy *)self remoteDevice:self->_companion didChangeState:2];
    }
  }
}

- (void)findMyAccessoryManager:(id)a3 didPrepareRangingOnDevice:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (self->_companionRangingManager == a3)
  {
    unsigned __int8 v10 = [(PRRemoteDevice *)self->_companion UUID];
    unsigned __int8 v11 = [v8 isEqual:v10];

    if (v11)
    {
      id v12 = qword_1008ABDE0;
      if (v9)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10040CF4C();
        }
        [(PRCompanionRangingClientProxy *)self handleError:v9];
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_companionRangingManager didPrepareForStartRangingOnDevice #companion-retry", v15, 2u);
        }
        if (self->_companionRangingState != 2)
        {
          NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
          CFStringRef v17 = @"Unexpected didPrepareForStartRangingOnDevice";
          id v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
          long long v14 = PRErrorWithCodeAndUserInfo(301, v13);

          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
            sub_10040CF18();
          }
          [(PRCompanionRangingClientProxy *)self handleError:v14];
        }
        self->_int companionRangingState = 3;
        [(PRCompanionRangingClientProxy *)self startRangingMangager];
      }
    }
  }
}

- (NSDictionary)clientInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (PRRemoteDevice)companion
{
  return (PRRemoteDevice *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCompanion:(id)a3
{
}

- (optional<rose::RoseDeviceDescriptor>)peerDescriptor
{
  objc_copyStruct(retstr, &self->_peerDescriptor, 44, 1, 0);
  return result;
}

- (void)setPeerDescriptor:(optional<rose::RoseDeviceDescriptor> *)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companion, 0);
  objc_storeStrong((id *)&self->_companionRangingManager, 0);

  objc_storeStrong((id *)&self->_startOptions, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  value = self->_rangingRequest.__ptr_.__value_;
  self->_rangingRequest.__ptr_.__value_ = 0;
  if (value) {
    operator delete();
  }
  cntrl = (std::__shared_weak_count *)self->_rangingManagerClient.__cntrl_;
  if (cntrl) {
    sub_10001A970(cntrl);
  }

  objc_storeStrong((id *)&self->_connWrapper, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 12) = 0;
  *((unsigned char *)self + 120) = 0;
  *((unsigned char *)self + 160) = 0;
  return self;
}

@end