@interface NIServerFindingNBAMMSSessionManager
+ (id)sharedInstance;
- (BOOL)_isReciprocalFindingPossibleRoleIsFinder:(BOOL)a3 rangingSession:(id)a4;
- (BOOL)shouldAttemptMerging;
- (BOOL)shouldInformMutualAuthFailure:(id)a3;
- (NIServerFindingNBAMMSSessionManager)init;
- (id).cxx_construct;
- (id)printableState;
- (id)registerNBAMMSSessionWithToken:(id)a3 isFinder:(BOOL)a4 client:(id)a5 serviceRequest:(const void *)a6 startRangingOptions:(const void *)a7 sharedProtocol:(int)a8;
- (pair<int,)_getAuthenticatedFinderFindeeClients;
- (void)_updateAnalyticsWithFailedRangingRequestToken:(id)a3 isFinder:(BOOL)a4;
- (void)_updateAnalyticsWithSuccessfulRangingRequest;
- (void)logUnservableRangingRequestWithToken:(id)a3 isFinder:(BOOL)a4;
- (void)mutualAuthUpdateForSession:(id)a3 token:(id)a4 isFinder:(BOOL)a5 result:(BOOL)a6;
- (void)refreshRangingForToken:(id)a3;
- (void)session:(id)a3 updateState:(int)a4;
- (void)unregisterNBAMMSSessionForToken:(id)a3;
- (void)updateAlgorithmAidingData:(const void *)a3 token:(id)a4;
- (void)updateSignallingData:(const void *)a3 token:(id)a4;
@end

@implementation NIServerFindingNBAMMSSessionManager

- (NIServerFindingNBAMMSSessionManager)init
{
  v30.receiver = self;
  v30.super_class = (Class)NIServerFindingNBAMMSSessionManager;
  v2 = [(NIServerFindingNBAMMSSessionManager *)&v30 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nearbyd.nbammssession", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    v6 = sub_1002F6464();
    v8 = (Logger *)v6[20];
    uint64_t v7 = v6[21];
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v2->_pbLogger.__cntrl_;
    v2->_pbLogger.__ptr_ = v8;
    v2->_pbLogger.__cntrl_ = (__shared_weak_count *)v7;
    if (cntrl) {
      sub_10001A970(cntrl);
    }
    v10 = objc_alloc_init(GroupFindingAnalytics);
    analytics = v2->_analytics;
    v2->_analytics = v10;

    objc_initWeak(&location, v2);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10024ACE4;
    v26[3] = &unk_10085B948;
    objc_copyWeak(&v28, &location);
    v12 = v2;
    v27 = v12;
    v13 = objc_retainBlock(v26);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10024ADC4;
    v23[3] = &unk_10085B998;
    objc_copyWeak(&v25, &location);
    v14 = v12;
    v24 = v14;
    v15 = objc_retainBlock(v23);
    v16 = [[NIServerNBAMMSSession alloc] initWithQueue:v2->_internalQueue identityString:@"nmiSession1" stateUpdateHandler:v13 mutualAuthHandler:v15];
    nmiSession1 = v14->_nmiSession1;
    v14->_nmiSession1 = v16;

    v18 = [[NIServerNBAMMSSession alloc] initWithQueue:v2->_internalQueue identityString:@"nmiSession2" stateUpdateHandler:v13 mutualAuthHandler:v15];
    nmiSession2 = v14->_nmiSession2;
    v14->_nmiSession2 = v18;

    *(void *)&v14->_sessionState1 = 0;
    uint64_t v20 = objc_opt_new();
    tokenToMutualAuthSessions = v14->_tokenToMutualAuthSessions;
    v14->_tokenToMutualAuthSessions = (NSMutableDictionary *)v20;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024AF7C;
  block[3] = &unk_1008466D8;
  block[4] = a1;
  if (qword_1008A5BC0 != -1) {
    dispatch_once(&qword_1008A5BC0, block);
  }
  v2 = (void *)qword_1008A5BB8;

  return v2;
}

- (id)registerNBAMMSSessionWithToken:(id)a3 isFinder:(BOOL)a4 client:(id)a5 serviceRequest:(const void *)a6 startRangingOptions:(const void *)a7 sharedProtocol:(int)a8
{
  id v14 = a3;
  id v15 = a5;
  v16 = v15;
  if (v14)
  {
    if (v15)
    {
      uint64_t v29 = 0;
      objc_super v30 = &v29;
      uint64_t v31 = 0x3032000000;
      v32 = sub_10024B268;
      v33 = sub_10024B278;
      id v34 = 0;
      internalQueue = self->_internalQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10024B280;
      block[3] = &unk_10085B9C0;
      block[4] = self;
      v24 = &v29;
      id v22 = v14;
      BOOL v28 = a4;
      id v23 = v16;
      id v25 = a6;
      v26 = a7;
      int v27 = a8;
      dispatch_sync((dispatch_queue_t)internalQueue, block);
      id v18 = (id)v30[5];

      _Block_object_dispose(&v29, 8);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100424DE8();
      }
      NSErrorUserInfoKey v35 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v36 = @"Client is nil";
      v19 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      id v18 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v19];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100424DB4();
    }
    id v18 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10012 userInfo:0];
  }

  return v18;
}

- (void)unregisterNBAMMSSessionForToken:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10024B960;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)internalQueue, v7);
}

- (void)refreshRangingForToken:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10024BC40;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)internalQueue, v7);
}

- (void)updateAlgorithmAidingData:(const void *)a3 token:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024BD2C;
  block[3] = &unk_10085B6E0;
  id v10 = v6;
  v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
}

- (void)updateSignallingData:(const void *)a3 token:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024BE20;
  block[3] = &unk_10085B6E0;
  id v10 = v6;
  v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
}

- (void)logUnservableRangingRequestWithToken:(id)a3 isFinder:(BOOL)a4
{
  id v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024BF14;
  block[3] = &unk_100856158;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
}

- (id)printableState
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_10024B268;
  v13 = sub_10024B278;
  id v14 = (id)objc_opt_new();
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_10024B268;
  v7[4] = sub_10024B278;
  id v8 = (id)objc_opt_new();
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024C0AC;
  block[3] = &unk_10085B9E8;
  block[4] = self;
  void block[5] = &v9;
  block[6] = v7;
  dispatch_sync((dispatch_queue_t)internalQueue, block);
  id v4 = (id)v10[5];
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(&v9, 8);

  return v4;
}

- (void)session:(id)a3 updateState:(int)a4
{
  id v6 = (NIServerNBAMMSSession *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_nmiSession1 == v6)
  {
    id v8 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = "IDLE";
      if (a4 == 1) {
        uint64_t v9 = "ACQ";
      }
      if (a4 == 2) {
        uint64_t v9 = "RNG";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-range,Received session state %s from nmiSession1", buf, 0xCu);
    }
    p_int sessionState1 = &self->_sessionState1;
    int sessionState1 = self->_sessionState1;
  }
  else
  {
    uint64_t v7 = qword_1008ABDE0;
    if (self->_nmiSession2 != v6)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100425A38();
      }
      goto LABEL_37;
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      v12 = "IDLE";
      if (a4 == 1) {
        v12 = "ACQ";
      }
      if (a4 == 2) {
        v12 = "RNG";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-range,Received session state %s from nmiSession2", buf, 0xCu);
    }
    p_int sessionState1 = &self->_sessionState2;
    int sessionState1 = self->_sessionState2;
  }
  if (sessionState1 == a4) {
    goto LABEL_37;
  }
  int *p_sessionState1 = a4;
  if (![(NIServerFindingNBAMMSSessionManager *)self shouldAttemptMerging]) {
    goto LABEL_37;
  }
  v13 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#find-range,Merging started", buf, 2u);
  }
  unsigned int v14 = [(NIServerNBAMMSSession *)self->_nmiSession1 sessionState];
  uint64_t v15 = 16;
  if (v14 == 1) {
    uint64_t v15 = 8;
  }
  id v16 = *(id *)((char *)&self->super.isa + v15);
  unsigned int v17 = [(NIServerNBAMMSSession *)self->_nmiSession1 sessionState];
  p_nmiSession2 = &self->_nmiSession2;
  if (v17 == 2) {
    p_nmiSession2 = &self->_nmiSession1;
  }
  v19 = *p_nmiSession2;
  if (v16)
  {
    [v16 attachedRoles];
    uint64_t v20 = __p;
    uint64_t v21 = v28;
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    __p = 0;
  }
  if (v21 - (void)v20 != 4) {
    __assert_rtn("-[NIServerFindingNBAMMSSessionManager session:updateState:]", "NIServerFindingRanging.mm", 3034, "acqSessionRoles.size() == 1");
  }
  int v22 = *v20;
  id v23 = [v16 sessionClientForFinder:*v20 == 0];
  v24 = [v16 sessionTokenForFinder:v22 == 0];
  if (!v16)
  {
    memset(buf, 0, 512);
LABEL_41:
    __assert_rtn("-[NIServerFindingNBAMMSSessionManager session:updateState:]", "NIServerFindingRanging.mm", 3047, "optServiceRequest.has_value()");
  }
  [v16 sessionServiceRequestForFinder:v22 == 0];
  if (!buf[504]) {
    goto LABEL_41;
  }
  memcpy(__dst, buf, sizeof(__dst));
  [v16 sessionStartRangingOptionsForFinder:v22 == 0];
  if (!v30) {
    __assert_rtn("-[NIServerFindingNBAMMSSessionManager session:updateState:]", "NIServerFindingRanging.mm", 3052, "optStartRangingOptions.has_value()");
  }
  v29[4] = v29[11];
  v29[5] = v29[12];
  v29[6] = v29[13];
  v29[0] = v29[7];
  v29[1] = v29[8];
  v29[2] = v29[9];
  v29[3] = v29[10];
  id v25 = [(NIServerNBAMMSSession *)v19 registerNBAMMSSessionWithToken:v24 isFinder:v22 == 0 client:v23 serviceRequest:__dst startRangingOptions:v29 sharedProtocol:[(NIServerNBAMMSSession *)v19 sharedProtocol]];
  v26 = objc_opt_new();
  [v26 addObject:v19];
  [(NSMutableDictionary *)self->_tokenToMutualAuthSessions setObject:v26 forKey:v24];

  if (__p) {
    operator delete(__p);
  }

LABEL_37:
}

- (BOOL)shouldAttemptMerging
{
  int sessionState1 = self->_sessionState1;
  if (sessionState1 == 1)
  {
    if (self->_sessionState2 != 2) {
      return 0;
    }
  }
  else if (sessionState1 != 2 || self->_sessionState2 != 1)
  {
    return 0;
  }
  nmiSession1 = self->_nmiSession1;
  if (nmiSession1)
  {
    [(NIServerNBAMMSSession *)nmiSession1 attachedRoles];
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  nmiSession2 = self->_nmiSession2;
  if (nmiSession2)
  {
    [(NIServerNBAMMSSession *)nmiSession2 attachedRoles];
  }
  else
  {
    __p = 0;
    uint64_t v10 = 0;
  }
  if (v12 - (void)v11 != 4) {
    goto LABEL_17;
  }
  uint64_t v7 = __p;
  if (v10 - (void)__p == 4)
  {
    if (*v11 != *__p && [(NIServerNBAMMSSession *)self->_nmiSession1 sharedProtocol])
    {
      BOOL v4 = [(NIServerNBAMMSSession *)self->_nmiSession2 sharedProtocol] != 0;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v4 = 0;
LABEL_18:
    uint64_t v7 = __p;
    if (!__p) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  BOOL v4 = 0;
  if (__p) {
LABEL_19:
  }
    operator delete(v7);
LABEL_20:
  if (v11) {
    operator delete(v11);
  }
  return v4;
}

- (BOOL)shouldInformMutualAuthFailure:(id)a3
{
  id v4 = a3;
  v5 = [(NIServerNBAMMSSession *)self->_nmiSession1 sessionTokenForFinder:1];
  unsigned int v6 = [v5 isEqual:v4];
  uint64_t v7 = [(NIServerNBAMMSSession *)self->_nmiSession1 sessionTokenForFinder:0];
  unsigned int v8 = [v7 isEqual:v4];
  uint64_t v9 = [(NIServerNBAMMSSession *)self->_nmiSession2 sessionTokenForFinder:1];
  unsigned int v10 = [v9 isEqual:v4];
  uint64_t v11 = [(NIServerNBAMMSSession *)self->_nmiSession2 sessionTokenForFinder:0];
  unsigned int v12 = [v11 isEqual:v4];
  if (v6) {
    int v13 = 2;
  }
  else {
    int v13 = 1;
  }
  if (!v8) {
    int v13 = v6;
  }
  BOOL v14 = v13 + v10 + v12 == 1;

  return v14;
}

- (void)mutualAuthUpdateForSession:(id)a3 token:(id)a4 isFinder:(BOOL)a5 result:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  unsigned int v10 = (NIServerNBAMMSSession *)a3;
  id v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  unsigned int v12 = [(NSMutableDictionary *)self->_tokenToMutualAuthSessions objectForKey:v11];

  if (v12)
  {
    if (v6)
    {
      int v13 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#find-range,Attachment is successful", buf, 2u);
      }
      [(NSMutableDictionary *)self->_tokenToMutualAuthSessions removeObjectForKey:v11];
      nmiSession1 = self->_nmiSession1;
      if (nmiSession1 != v10 || (nmiSession1 = self->_nmiSession2, nmiSession1 != v10)) {
        [(NIServerNBAMMSSession *)nmiSession1 unregisterNBAMMSSessionForToken:v11];
      }
      [(NIServerFindingNBAMMSSessionManager *)self _updateAnalyticsWithSuccessfulRangingRequest];
    }
    else
    {
      uint64_t v15 = [(NSMutableDictionary *)self->_tokenToMutualAuthSessions objectForKey:v11];
      if ([v15 containsObject:v10])
      {
        if ((unint64_t)[v15 count] < 2)
        {
          unsigned int v17 = [(NIServerFindingNBAMMSSessionManager *)self shouldInformMutualAuthFailure:v11];
          id v18 = qword_1008ABDE0;
          BOOL v19 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
          if (v17)
          {
            if (v19)
            {
              *(_WORD *)uint64_t v21 = 0;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#find-range,Inform mutual auth failure to client", v21, 2u);
            }
            [(NIServerNBAMMSSession *)v10 informMutualAuthFailuresToClients];
            [(NIServerFindingNBAMMSSessionManager *)self _updateAnalyticsWithFailedRangingRequestToken:v11 isFinder:v7];
          }
          else
          {
            if (v19)
            {
              *(_WORD *)uint64_t v20 = 0;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#find-range,Do not inform mutual auth failure to client, clean attached token silently", v20, 2u);
            }
            [(NIServerNBAMMSSession *)v10 unregisterNBAMMSSessionForToken:v11];
            [(NIServerFindingNBAMMSSessionManager *)self _updateAnalyticsWithSuccessfulRangingRequest];
          }
        }
        else
        {
          [(NIServerNBAMMSSession *)v10 unregisterNBAMMSSessionForToken:v11];
          id v16 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)int v22 = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#find-range,One attaching attempt failed, more to come", v22, 2u);
          }
        }
        [v15 removeObject:v10];
        if (![v15 count]) {
          [(NSMutableDictionary *)self->_tokenToMutualAuthSessions removeObjectForKey:v11];
        }
      }
    }
  }
}

- (pair<int,)_getAuthenticatedFinderFindeeClients
{
  unint64_t v3 = (unint64_t)[(NIServerNBAMMSSession *)self->_nmiSession1 sessionClientsStatus];
  uint64_t v5 = v4;
  uint64_t v7 = ((unint64_t)[(NIServerNBAMMSSession *)self->_nmiSession2 sessionClientsStatus] & 0xFFFFFFFF00000001) == 1;
  if ((v3 & 0xFFFFFFFF00000001) == 1) {
    ++v7;
  }
  if ((v6 & 0xFFFFFFFF00000001) == 1) {
    uint64_t v8 = ((v5 & 0xFFFFFFFF00000001) == 1) + 1;
  }
  else {
    uint64_t v8 = (v5 & 0xFFFFFFFF00000001) == 1;
  }
  return (pair<int, int>)(v7 | (v8 << 32));
}

- (BOOL)_isReciprocalFindingPossibleRoleIsFinder:(BOOL)a3 rangingSession:(id)a4
{
  uint64_t v5 = a4;
  uint64_t v6 = v5;
  if (v5 && ([v5 attachedRoles], uint64_t v5 = v10, v11 - (void)v10 == 8))
  {
    BOOL v7 = 0;
    BOOL v8 = 0;
    if (!v10) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v7 = (*v5 == 0) ^ a3;
  }
  operator delete(v5);
  BOOL v8 = v7;
LABEL_7:

  return v8;
}

- (void)_updateAnalyticsWithSuccessfulRangingRequest
{
  unint64_t v3 = (unint64_t)[(NIServerNBAMMSSession *)self->_nmiSession1 sessionClientsStatus];
  uint64_t v5 = v4;
  int v6 = v3;
  unint64_t v7 = (unint64_t)[(NIServerNBAMMSSession *)self->_nmiSession2 sessionClientsStatus];
  if ((_BYTE)v3) {
    BOOL v9 = (v3 & 0xFFFFFFFF00000000) == 0x200000000;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9
    || ((_BYTE)v5 ? (BOOL v10 = (v5 & 0xFFFFFFFF00000000) == 0x200000000) : (BOOL v10 = 0),
        v10
     || ((int v11 = v7, (_BYTE)v7) ? (v12 = (v7 & 0xFFFFFFFF00000000) == 0x200000000) : (v12 = 0),
         v12 || (unsigned __int8 v13 = v8) != 0 && (v8 & 0xFFFFFFFF00000000) == 0x200000000)))
  {
    BOOL v14 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-range,Mutual-auth still ongoing, not ready for analytics update", v19, 2u);
    }
  }
  else
  {
    pair<int, int> v15 = [(NIServerFindingNBAMMSSessionManager *)self _getAuthenticatedFinderFindeeClients];
    switch((unint64_t)v15)
    {
      case 0x200000000uLL:
        analytics = self->_analytics;
        [(GroupFindingAnalytics *)analytics updateTo0Finder2Findee];
        break;
      case 0x100000001uLL:
        unsigned int v17 = self->_analytics;
        if (v6 == v5 || v11 == v13)
        {
          [(GroupFindingAnalytics *)v17 updateToReciprocalFinding];
        }
        else
        {
          [(GroupFindingAnalytics *)v17 updateTo1Finder1Findee];
        }
        break;
      case 0x200000001uLL:
        id v18 = self->_analytics;
        [(GroupFindingAnalytics *)v18 updateTo1Finder2Findee];
        break;
    }
  }
}

- (void)_updateAnalyticsWithFailedRangingRequestToken:(id)a3 isFinder:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  pair<int, int> v6 = [(NIServerFindingNBAMMSSessionManager *)self _getAuthenticatedFinderFindeeClients];
  if (v6 == 0x200000000)
  {
    analytics = self->_analytics;
    if (v4) {
      [(GroupFindingAnalytics *)analytics updateWithFinderRequestAt0Finder2Findee:v8];
    }
    else {
      [(GroupFindingAnalytics *)analytics updateWithFindeeRequestAt0Finder2Findee:v8];
    }
  }
  else if (v6 != 0x100000001 || v4)
  {
    if (v6 == 0x200000001 && !v4) {
      [(GroupFindingAnalytics *)self->_analytics updateWithFindeeRequestAt1Finder2Findee:v8];
    }
  }
  else
  {
    [(GroupFindingAnalytics *)self->_analytics updateWithFindeeRequestAt1Finder1Findee:v8];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analytics, 0);
  cntrl = (std::__shared_weak_count *)self->_pbLogger.__cntrl_;
  if (cntrl) {
    sub_10001A970(cntrl);
  }
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_tokenToMutualAuthSessions, 0);
  objc_storeStrong((id *)&self->_nmiSession2, 0);

  objc_storeStrong((id *)&self->_nmiSession1, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end