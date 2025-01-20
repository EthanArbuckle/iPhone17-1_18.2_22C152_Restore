@interface PRRangingServiceProxy
- (NSDictionary)clientInfo;
- (PRRangingServiceProxy)initWithConnection:(id)a3 queue:(id)a4;
- (id).cxx_construct;
- (void)activate;
- (void)configureForP2PRanging:(id)a3 options:(id)a4 reply:(id)a5;
- (void)connectWithClientInfo:(id)a3;
- (void)dealloc;
- (void)didFailWithError:(id)a3;
- (void)didReceiveNewSolutions:(id)a3;
- (void)rangingRequestDidUpdateStatus:(unint64_t)a3;
- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4;
- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4;
- (void)startP2PRanging:(id)a3 reply:(id)a4;
- (void)stopP2PRanging:(id)a3 reply:(id)a4;
- (void)terminate;
@end

@implementation PRRangingServiceProxy

- (PRRangingServiceProxy)initWithConnection:(id)a3 queue:(id)a4
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
    v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PRRangingServiceProxy.mm", 38, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v19 = +[NSAssertionHandler currentHandler];
  [v19 handleFailureInMethod:a2, self, @"PRRangingServiceProxy.mm", 39, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)PRRangingServiceProxy;
  v10 = [(PRRangingServiceProxy *)&v22 init];
  v11 = v10;
  if (v10)
  {
    v10->_terminated = 0;
    v12 = [[PRNSXPCConnection alloc] initWithConnection:v7];
    connWrapper = v11->_connWrapper;
    v11->_connWrapper = (PRRangingClientProtocol *)v12;

    objc_initWeak(&location, v11);
    sub_100046DE0(&location, buf);
    shared_ptr<PRRangingManagerClient> v14 = *(shared_ptr<PRRangingManagerClient> *)buf;
    memset(buf, 0, sizeof(buf));
    cntrl = (std::__shared_weak_count *)v11->_rangingManagerClient.__cntrl_;
    v11->_rangingManagerClient = v14;
    if (cntrl)
    {
      sub_10001A970(cntrl);
      if (*(void *)&buf[8]) {
        sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
      }
    }
    v11->_p2pServiceId = 0;
    objc_destroyWeak(&location);
  }
  v16 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PRRangingServiceProxy init", buf, 2u);
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PRGenericRanging: XPC connection created. Process name: %@, pid: %d", (uint8_t *)&v9, 0x12u);
  }
  objc_storeStrong((id *)&self->_clientInfo, a3);
  [(PRRangingServiceProxy *)self activate];
}

- (void)dealloc
{
  if (!self->_terminated) {
    [(PRRangingServiceProxy *)self terminate];
  }
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRRangingServiceProxy dealloc", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)PRRangingServiceProxy;
  [(PRRangingServiceProxy *)&v4 dealloc];
}

- (void)activate
{
  v3 = sub_1002F6464();
  sub_10001A8A4(&v6, (void *)self->_rangingManagerClient.__ptr_ + 1);
  long long v7 = v6;
  long long v6 = 0uLL;
  sub_1002FA4B8((uint64_t)v3, (unint64_t *)&v7);
  if (*((void *)&v7 + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&v7 + 1));
  }
  if (*((void *)&v6 + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&v6 + 1));
  }
  objc_super v4 = sub_1002F6464();
  sub_10001A8A4(&v6, (void *)self->_rangingManagerClient.__ptr_ + 1);
  long long v5 = v6;
  if (*((void *)&v6 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v6 + 1) + 16), 1uLL, memory_order_relaxed);
  }
  sub_1002F6B1C((uint64_t)v4, (uint64_t *)&v5);
  if (*((void *)&v5 + 1)) {
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v5 + 1));
  }
  if (*((void *)&v6 + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&v6 + 1));
  }
}

- (void)terminate
{
  [(PRRangingClientProtocol *)self->_connWrapper invalidate];
  v3 = sub_1002F6464();
  cntrl = self->_rangingManagerClient.__cntrl_;
  ptr = self->_rangingManagerClient.__ptr_;
  long long v6 = (std::__shared_weak_count *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  sub_1002FA594((uint64_t)v3, (unint64_t *)&ptr);
  if (v6) {
    sub_10001A970(v6);
  }
  self->_terminated = 1;
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100045484;
  v7[3] = &unk_100846378;
  id v8 = v4;
  id v6 = v4;
  [(PRRangingClientProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v7];
}

- (void)didReceiveNewSolutions:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000455C4;
  v7[3] = &unk_100846378;
  id v8 = v4;
  id v6 = v4;
  [(PRRangingClientProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v7];
}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  connWrapper = self->_connWrapper;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000456C4;
  v5[3] = &unk_1008463C0;
  v5[4] = a3;
  v5[5] = a4;
  [(PRRangingClientProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v5];
}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000457C4;
  v4[3] = &unk_1008463E0;
  v4[4] = a3;
  [(PRRangingClientProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v4];
}

- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100045908;
  v9[3] = &unk_100846430;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  [(PRRangingClientProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v9];
}

- (void)configureForP2PRanging:(id)a3 options:(id)a4 reply:(id)a5
{
  id v9 = a3;
  id v64 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  int64_t v11 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(NSDictionary *)self->_clientInfo objectForKey:PRProcessNameKey];
    v13 = [(NSDictionary *)self->_clientInfo objectForKey:PRProcessIdentifierKey];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [v13 intValue];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PRGenericRanging: XPC command - configureForP2PRanging. Process name: %@, pid: %d", buf, 0x12u);
  }
  if (!v9)
  {
    v61 = +[NSAssertionHandler currentHandler];
    [v61 handleFailureInMethod:a2, self, @"PRRangingServiceProxy.mm", 150, @"Invalid parameter not satisfying: %@", @"remoteDevice" object file lineNumber description];
  }
  shared_ptr<PRRangingManagerClient> v14 = (void **)sub_1002F6464();
  uint64_t v15 = (*(uint64_t (**)(void *))(*v14[808] + 72))(v14[808]);
  int v16 = v15;
  sub_100004950(buf, (&off_1008472E8)[v15 >> 32]);
  if (v78 >= 0) {
    v17 = buf;
  }
  else {
    v17 = *(unsigned char **)buf;
  }
  v18 = +[NSString stringWithFormat:@"Ranging service is not ready. Reason: %s", v17];
  if (v78 < 0) {
    operator delete(*(void **)buf);
  }
  if ((v16 - 3) <= 0xFFFFFFFD)
  {
    NSErrorUserInfoKey v98 = NSLocalizedDescriptionKey;
    v99 = v18;
    v19 = +[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
    v20 = PRErrorWithCodeAndUserInfo(101, v19);

    v10[2](v10, 0, v20);
    goto LABEL_78;
  }
  if (self->_p2pServiceId)
  {
    v21 = sub_1002F6464();
    sub_10001A8A4(buf, (void *)self->_rangingManagerClient.__ptr_ + 1);
    uint64_t v71 = *(void *)buf;
    v72 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 16), 1uLL, memory_order_relaxed);
    }
    BOOL v22 = sub_1002F7308((uint64_t)v21, &v71, self->_p2pServiceId);
    if (v72) {
      std::__shared_weak_count::__release_weak(v72);
    }
    if (*(void *)&buf[8]) {
      sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
    }
    if (!v22)
    {
      NSErrorUserInfoKey v96 = NSLocalizedDescriptionKey;
      CFStringRef v97 = @"Failed to override P2P job.";
      v38 = +[NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
      v20 = PRErrorWithCodeAndUserInfo(105, v38);

      v10[2](v10, 0, v20);
      goto LABEL_78;
    }
  }
  v20 = [v64 objectForKey:PRP2PArgsRangingRole];
  if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    NSErrorUserInfoKey v94 = NSLocalizedDescriptionKey;
    CFStringRef v95 = @"No session role provided.";
    v36 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
    v37 = PRErrorWithCodeAndUserInfo(100, v36);

    v10[2](v10, 0, v37);
    goto LABEL_78;
  }
  if ([v20 intValue] && objc_msgSend(v20, "intValue") != 1)
  {
    NSErrorUserInfoKey v92 = NSLocalizedDescriptionKey;
    CFStringRef v93 = @"Invalid session role provided.";
    v39 = +[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
    v40 = PRErrorWithCodeAndUserInfo(100, v39);

    v10[2](v10, 0, v40);
    goto LABEL_78;
  }
  v23 = sub_1002F6464();
  uint64_t v24 = v23[406];
  v25 = (std::__shared_weak_count *)v23[407];
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v62 = v25;
  if (!v24)
  {
    NSErrorUserInfoKey v90 = NSLocalizedDescriptionKey;
    CFStringRef v91 = @"Configuration Manager Error.";
    v42 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
    v63 = PRErrorWithCodeAndUserInfo(999, v42);

    v10[2](v10, 0, v63);
    goto LABEL_76;
  }
  v63 = [v64 objectForKey:PRDebugConfigArgUWBChannel];
  if (v63 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned __int8 v26 = [v63 intValue];
    unsigned __int8 v34 = sub_1003A8DFC(v26, v27, v28, v29, v30, v31, v32, v33);
    __int16 v35 = 256;
  }
  else
  {
    unsigned __int8 v34 = 0;
    __int16 v35 = 0;
  }
  v41 = [v9 roseMACAddress];
  [v41 getBytes:&v89 length:8];

  int v83 = 1;
  char v84 = 0;
  char v85 = 0;
  uint64_t v86 = v89;
  __int16 v87 = 1;
  char v88 = 0;
  __int16 v69 = 0;
  v70 = &v83;
  if (!sub_1002CE2DC(v24, &v68, (unsigned __int8 *)&v69, v35 | v34))
  {
    NSErrorUserInfoKey v81 = NSLocalizedDescriptionKey;
    CFStringRef v82 = @"Failed to find usable UWB channel for service request.";
    v43 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    v44 = PRErrorWithCodeAndUserInfo(999, v43);

    v10[2](v10, 0, v44);
    goto LABEL_76;
  }
  if ([v20 intValue]) {
    sub_10017F650(&v68, (uint64_t)buf);
  }
  else {
    sub_10017F37C(&v68, (uint64_t)buf);
  }
  v45 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    if (!v80[57]) {
      sub_10000AE44();
    }
    *(_DWORD *)v75 = 67109120;
    *(_DWORD *)&v75[4] = v80[56];
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "[P2PDEBUG] post prep req uwbChannel %hhu", v75, 8u);
  }

  v46 = v64;
  if (v64)
  {
    id v67 = 0;
    char v47 = sub_1000105DC(v64, v80, &v67);
    id v48 = v67;
    v49 = v48;
    if ((v47 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040EC64();
      }
      v10[2](v10, 0, v49);
      goto LABEL_75;
    }

    v46 = v64;
  }
  v49 = [v46 objectForKey:PRDebugConfigArgSolutionVariant];
  if (v49)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v50 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v75 = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "P2P Ranging: PRDebugConfigArgSolutionVariant passed as an option.", v75, 2u);
      }
      unsigned int v51 = [v49 intValue];
      switch(v51)
      {
        case 0u:
          v55 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v75 = 0;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "   PRRoseSolutionNotSensorFused", v75, 2u);
          }
          int v53 = 1;
          goto LABEL_65;
        case 2u:
          v54 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v75 = 0;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "   PRRoseSolutionRawRangeSensorFusionAngle", v75, 2u);
          }
          int v53 = 5;
          goto LABEL_65;
        case 1u:
          v52 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v75 = 0;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "   PRRoseSolutionSensorFused", v75, 2u);
          }
          int v53 = 3;
LABEL_65:
          int v79 = v53;
          break;
      }
    }
  }
  v56 = sub_1002F6464();
  sub_10001A8A4(v75, (void *)self->_rangingManagerClient.__ptr_ + 1);
  uint64_t v65 = *(void *)v75;
  v66 = v76;
  if (v76) {
    atomic_fetch_add_explicit(&v76->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  int v57 = sub_1002F6CB4((uint64_t)v56, &v65);
  if (v66) {
    std::__shared_weak_count::__release_weak(v66);
  }
  if (v76) {
    sub_10001A970(v76);
  }
  if ((v57 & 0xFF0000) != 0)
  {
    v58 = self;
    objc_sync_enter(v58);
    self->_p2pServiceId = v57;
    objc_sync_exit(v58);

    v10[2](v10, 1, 0);
    [(PRRangingServiceProxy *)v58 remoteDevice:v9 didChangeState:1];
  }
  else
  {
    NSErrorUserInfoKey v73 = NSLocalizedDescriptionKey;
    CFStringRef v74 = @"Register for service failed";
    v59 = +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    v60 = PRErrorWithCodeAndUserInfo(101, v59);

    v10[2](v10, 0, v60);
  }
LABEL_75:

LABEL_76:
  if (v62) {
    sub_10001A970(v62);
  }
LABEL_78:
}

- (void)startP2PRanging:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  if (!v7)
  {
    v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PRRangingServiceProxy.mm", 270, @"Invalid parameter not satisfying: %@", @"remoteDevice" object file lineNumber description];
  }
  id v9 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(NSDictionary *)self->_clientInfo objectForKey:PRProcessNameKey];
    int64_t v11 = [(NSDictionary *)self->_clientInfo objectForKey:PRProcessIdentifierKey];
    *(_DWORD *)buf = 138412546;
    id v28 = v10;
    __int16 v29 = 1024;
    unsigned int v30 = [v11 intValue];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PRGenericRanging: XPC command - startP2PRanging. Process name: %@, pid: %d", buf, 0x12u);
  }
  id v12 = [v7 roseMACAddress];
  [v12 getBytes:&v42 length:8];

  *(_DWORD *)buf = 1;
  LOBYTE(v28) = 0;
  char v31 = 0;
  uint64_t v32 = v42;
  __int16 v33 = 1;
  char v34 = 0;
  char v35 = 1;
  uint64_t v36 = 50000;
  char v37 = 1;
  int v38 = 10000000;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  if (!self->_p2pServiceId)
  {
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    CFStringRef v26 = @"Must configure for ranging before calling start ranging.";
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    int v16 = PRErrorWithCodeAndUserInfo(102, v15);

    v8[2](v8, 0, v16);
LABEL_16:

    goto LABEL_17;
  }
  v13 = sub_1002F6464();
  sub_10001A8A4(&v19, (void *)self->_rangingManagerClient.__ptr_ + 1);
  uint64_t v21 = v19;
  BOOL v22 = v20;
  if (v20) {
    atomic_fetch_add_explicit(&v20->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  BOOL v14 = sub_1002F7A30((uint64_t)v13, &v21, self->_p2pServiceId);
  if (v22) {
    std::__shared_weak_count::__release_weak(v22);
  }
  if (v20) {
    sub_10001A970(v20);
  }
  if (!v14)
  {
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    CFStringRef v24 = @"Initate user triggered ranging failed";
    v17 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    int v16 = PRErrorWithCodeAndUserInfo(102, v17);

    v8[2](v8, 0, v16);
    goto LABEL_16;
  }
  v8[2](v8, 1, 0);
LABEL_17:
}

- (void)stopP2PRanging:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  if (!v7)
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PRRangingServiceProxy.mm", 312, @"Invalid parameter not satisfying: %@", @"remoteDevice" object file lineNumber description];
  }
  id v9 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(NSDictionary *)self->_clientInfo objectForKey:PRProcessNameKey];
    int64_t v11 = [(NSDictionary *)self->_clientInfo objectForKey:PRProcessIdentifierKey];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [v11 intValue];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PRGenericRanging: XPC command - stopP2PRanging. Process name: %@, pid: %d", buf, 0x12u);
  }
  if (!self->_p2pServiceId)
  {
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    CFStringRef v23 = @"This remote device is unknown";
    BOOL v14 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    uint64_t v15 = PRErrorWithCodeAndUserInfo(103, v14);

    v8[2](v8, 0, v15);
LABEL_16:

    goto LABEL_17;
  }
  id v12 = sub_1002F6464();
  sub_10001A8A4(buf, (void *)self->_rangingManagerClient.__ptr_ + 1);
  uint64_t v18 = *(void *)buf;
  uint64_t v19 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8]) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 16), 1uLL, memory_order_relaxed);
  }
  BOOL v13 = sub_1002F8634((uint64_t)v12, &v18, self->_p2pServiceId);
  if (v19) {
    std::__shared_weak_count::__release_weak(v19);
  }
  if (*(void *)&buf[8]) {
    sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
  }
  if (!v13)
  {
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    CFStringRef v21 = @"Stop ranging failed";
    int v16 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v15 = PRErrorWithCodeAndUserInfo(103, v16);

    v8[2](v8, 0, v15);
    goto LABEL_16;
  }
  v8[2](v8, 1, 0);
LABEL_17:
}

- (NSDictionary)clientInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInfo, 0);
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
  return self;
}

@end