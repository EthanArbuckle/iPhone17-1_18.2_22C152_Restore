@interface MRDRemoteControlGroupSessionCoordinator
- (BOOL)isJoiningSession;
- (BOOL)isStartingSession;
- (BOOL)isThrottled;
- (MRDGroupSessionManager)sessionManager;
- (MRDRemoteControlGroupSessionCoordinator)initWithSessionManager:(id)a3 eligibilityMonitor:(id)a4;
- (MRDeviceInfo)remoteASEDeviceInfo;
- (MRGroupSessionEligibilityStatus)eligibilityStatus;
- (NSString)description;
- (NSString)hostedSessionIdentifier;
- (NSString)rotatingSessionIdentifier;
- (OS_dispatch_queue)queue;
- (id)diagnosticDescription;
- (unint64_t)clusterStatus;
- (void)clearHostedSessionState;
- (void)clusterController:(id)a3 clusterStatusDidChange:(unint64_t)a4;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)eligibilityMonitor:(id)a3 eligibilityStatusDidChange:(id)a4;
- (void)handleASEChangeNotification:(id)a3;
- (void)handleDeviceInfoChangeNotification:(id)a3;
- (void)handleDidRegisterOriginNotification:(id)a3;
- (void)initializeObserversAndState;
- (void)reevaluateAfterInterval:(double)a3 withReason:(id)a4;
- (void)reevaluateSystemStateWithReason:(id)a3;
- (void)refreshASEInfo;
- (void)session:(id)a3 didChangeState:(int64_t)a4;
- (void)sessionDidRemoveAllParticipants:(id)a3;
- (void)setClusterStatus:(unint64_t)a3;
- (void)setEligibilityStatus:(id)a3;
- (void)setHostedSessionIdentifier:(id)a3;
- (void)setJoiningSession:(BOOL)a3;
- (void)setRemoteASEDeviceInfo:(id)a3;
- (void)setRotatingSessionIdentifier:(id)a3;
- (void)setSessionManager:(id)a3;
- (void)setStartingSession:(BOOL)a3;
- (void)setThrottled:(BOOL)a3;
@end

@implementation MRDRemoteControlGroupSessionCoordinator

- (MRDRemoteControlGroupSessionCoordinator)initWithSessionManager:(id)a3 eligibilityMonitor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MRDRemoteControlGroupSessionCoordinator;
  v9 = [(MRDRemoteControlGroupSessionCoordinator *)&v20 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UNSPECIFIED, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.MRDRemoteControlGroupSessionCoordinator.queue", v11);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_sessionManager, a3);
    [v8 addObserver:v9];
    v14 = v9->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000710C8;
    block[3] = &unk_100415CC8;
    v19 = v9;
    dispatch_async(v14, block);
    v15 = _MRLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlGroupSessionCoordinator] Initialized", v17, 2u);
    }
  }
  return v9;
}

- (void)dealloc
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlGroupSessionCoordinator] Dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)MRDRemoteControlGroupSessionCoordinator;
  [(MRDRemoteControlGroupSessionCoordinator *)&v4 dealloc];
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(MRDRemoteControlGroupSessionCoordinator *)self hostedSessionIdentifier];
  v6 = [(MRDRemoteControlGroupSessionCoordinator *)self rotatingSessionIdentifier];
  id v7 = +[NSNumber numberWithBool:[(MRDRemoteControlGroupSessionCoordinator *)self isThrottled]];
  id v8 = [v7 stringValue];
  id v9 = [v3 initWithFormat:@"<%@: hostedSessionIdentifier=%@, rotatingSessionIdentifier=%@, throttled=%@>", v4, v5, v6, v8];

  return (NSString *)v9;
}

- (id)diagnosticDescription
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = [(MRDRemoteControlGroupSessionCoordinator *)self description];
  v5 = [(MRDRemoteControlGroupSessionCoordinator *)self eligibilityStatus];
  id v6 = [v3 initWithFormat:@"%@ state=%@>", v4, v5];

  return v6;
}

- (void)initializeObserversAndState
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleDeviceInfoChangeNotification:" name:kMRDeviceInfoDidChangeNotification object:0];

  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"handleASEChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"handleDidRegisterOriginNotification:" name:kMRMediaRemoteOriginDidRegisterNotification object:0];
}

- (void)handleDidRegisterOriginNotification:(id)a3
{
}

- (void)handleASEChangeNotification:(id)a3
{
}

- (void)handleDeviceInfoChangeNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v5 = MRGetDeviceInfoFromUserInfo();

  id v6 = [(MRDRemoteControlGroupSessionCoordinator *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000714C4;
  v8[3] = &unk_1004158D8;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)refreshASEInfo
{
  id v3 = +[MRNowPlayingOriginClientManager sharedManager];
  uint64_t v4 = [(MRDRemoteControlGroupSessionCoordinator *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100071634;
  v5[3] = &unk_100418870;
  v5[4] = self;
  [v3 resolveActiveSystemEndpointWithType:0 timeout:v4 queue:v5 completion:10.0];
}

- (void)reevaluateSystemStateWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDRemoteControlGroupSessionCoordinator *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v85 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlGroupSessionCoordinator] Re-evaluating because: %{public}@", buf, 0xCu);
  }

  id v7 = [(MRDRemoteControlGroupSessionCoordinator *)self rotatingSessionIdentifier];

  if (![(MRDRemoteControlGroupSessionCoordinator *)self isStartingSession]
    && ![(MRDRemoteControlGroupSessionCoordinator *)self isJoiningSession]
    && ![(MRDRemoteControlGroupSessionCoordinator *)self isThrottled]
    && !v7)
  {
    id v8 = [(MRDRemoteControlGroupSessionCoordinator *)self sessionManager];
    id v9 = [v8 session];

    unsigned int v10 = [v9 isHosted];
    v11 = [(MRDRemoteControlGroupSessionCoordinator *)self eligibilityStatus];
    id v12 = [v11 idsAccountIsValid];
    id v13 = [v11 isManateeEnabled];
    id v14 = v13;
    if ((v12 & 1) == 0 && (v10 & 1) == 0)
    {
      v15 = _MRLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "[MRDRemoteControlGroupSessionCoordinator] Returning. Rationale: validIDSAccount=NO, existing=NO.";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
        goto LABEL_56;
      }
      goto LABEL_56;
    }
    if (((v13 | v10) & 1) == 0)
    {
      v15 = _MRLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "[MRDRemoteControlGroupSessionCoordinator] Returning. Rationale: validManatee=NO, existing=NO.";
        goto LABEL_18;
      }
LABEL_56:

      goto LABEL_57;
    }
    unsigned int v68 = [v11 routeType];
    id v21 = [v11 routeIsValidForHosting];
    unsigned int v77 = v10;
    unsigned int v75 = v21 & v12 & v14;
    +[NSNumber numberWithBool:v21];
    v22 = v76 = v11;
    v23 = +[NSNumber numberWithBool:v12];
    v24 = +[NSNumber numberWithBool:v14];
    v25 = +[NSMutableString stringWithFormat:@"validRoute=%@,validIDS=%@,validManatee=%@", v22, v23, v24];

    v26 = v25;
    v27 = +[NSNumber numberWithBool:v10];
    [v25 appendFormat:@",existingHostedSession=%@", v27];

    if ((v75 ^ 1 | v10))
    {
      BOOL v70 = 0;
      v28 = v76;
    }
    else
    {
      v28 = v76;
      BOOL v70 = [v76 mediaAccountHostingState] == (id)6;
      v29 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");
      [v26 appendFormat:@",mediaStateValid=%@", v29];
    }
    v30 = [(MRDeviceInfo *)self->_remoteASEDeviceInfo groupSessionToken];
    if (v9) {
      unsigned int v72 = [v9 isHosted] ^ 1;
    }
    else {
      unsigned int v72 = 0;
    }
    v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v28 mediaAccountJoiningState]);
    unsigned int v32 = [&off_1004385C0 containsObject:v31];

    if (v32 && [v28 isManateeEnabled]) {
      uint64_t v33 = [v28 idsAccountIsValid] ^ 1;
    }
    else {
      uint64_t v33 = 1;
    }
    v34 = [v9 joinToken];
    v67 = [v34 sharedSecret];

    v35 = +[MRSharedSettings currentSettings];
    BOOL v36 = 0;
    v71 = v26;
    if ([v35 supportGroupSessionHome] && (v33 & 1) == 0)
    {
      v37 = [v30 sharedSecret];
      BOOL v36 = v37 != 0;
    }
    v38 = [(MRDRemoteControlGroupSessionCoordinator *)self sessionManager];
    v39 = [v38 session];
    v40 = [v39 identifier];
    v73 = v30;
    v41 = [v30 sessionIdentifier];
    unsigned int v74 = [v40 isEqual:v41];

    v42 = +[NSNumber numberWithBool:v72];
    v43 = +[NSNumber numberWithBool:v33];
    v44 = +[NSNumber numberWithBool:v36];
    v45 = +[NSNumber numberWithBool:v74];
    uint64_t v69 = +[NSMutableString stringWithFormat:@"hasRemoteSession=%@,isDisallowedJoiningGroupSession=%@,shouldJoinRemoteSession=%@,hasJoinedTargetRemoteSession=%@", v42, v43, v44, v45];

    v46 = +[NSNumber numberWithBool:v72];
    v15 = v71;
    [v71 appendFormat:@",existingRemoteSession=%@", v46];

    if ((v70 & (v72 ^ 1)) == 1)
    {
      v47 = _MRLogForCategory();
      v11 = v76;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlGroupSessionCoordinator] Starting group session.", buf, 2u);
      }

      [(MRDRemoteControlGroupSessionCoordinator *)self setStartingSession:1];
      v48 = [(MRDRemoteControlGroupSessionCoordinator *)self sessionManager];
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 3221225472;
      v83[2] = sub_100072600;
      v83[3] = &unk_100418898;
      v83[4] = self;
      [v48 startRemoteControlGroupSessionWithRouteType:v68 completion:v83];
    }
    else
    {
      if (((v75 | v77 ^ 1) & 1) == 0)
      {
        v53 = _MRLogForCategory();
        v11 = v76;
        v49 = (void *)v69;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlGroupSessionCoordinator] Ending group session.", buf, 2u);
        }

        [(MRDRemoteControlGroupSessionCoordinator *)self clearHostedSessionState];
        [(MRDRemoteControlGroupSessionCoordinator *)self reevaluateAfterInterval:@"Ended group session" withReason:5.0];
        v54 = [(MRDRemoteControlGroupSessionCoordinator *)self sessionManager];
        [v54 finishRemoteControlGroupSession:v9];

        goto LABEL_55;
      }
      v11 = v76;
      if (!(!v36 | v74))
      {
        v55 = _MRLogForCategory();
        BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
        v49 = (void *)v69;
        if (v72)
        {
          if (v56)
          {
            v57 = [v73 sessionIdentifier];
            *(_DWORD *)buf = 138543618;
            *(void *)v85 = v9;
            *(_WORD *)&v85[8] = 2114;
            v86 = v57;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlGroupSessionCoordinator] Leaving remote session: %{public}@ because auto-joining target session: %{public}@", buf, 0x16u);
          }
          [v9 removeObserver:self];
          v58 = [(MRDRemoteControlGroupSessionCoordinator *)self sessionManager];
          [v58 leaveRemoteControlGroupSession:v9];

          [(MRDRemoteControlGroupSessionCoordinator *)self reevaluateAfterInterval:@"Left session to allow auto-joining a new one" withReason:1.0];
        }
        else
        {
          if (v56)
          {
            v61 = [(MRDeviceInfo *)self->_remoteASEDeviceInfo WHAIdentifier];
            *(_DWORD *)buf = 138543618;
            *(void *)v85 = v73;
            *(_WORD *)&v85[8] = 2114;
            v86 = v61;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlGroupSessionCoordinator] Attempting to auto-join target remote session: %{public}@ from ASE %{public}@", buf, 0x16u);
          }
          [(MRDRemoteControlGroupSessionCoordinator *)self setJoiningSession:1];
          id v62 = objc_alloc((Class)MRBlockGuard);
          v81[0] = _NSConcreteStackBlock;
          v81[1] = 3221225472;
          v81[2] = sub_100072874;
          v81[3] = &unk_100418848;
          v81[4] = self;
          id v63 = v73;
          id v82 = v63;
          id v64 = [v62 initWithTimeout:@"Session auto-join" reason:v81 handler:30.0];
          v65 = [(MRDRemoteControlGroupSessionCoordinator *)self sessionManager];
          v78[0] = _NSConcreteStackBlock;
          v78[1] = 3221225472;
          v78[2] = sub_100072988;
          v78[3] = &unk_1004188C0;
          v78[4] = self;
          id v79 = v64;
          id v80 = v63;
          id v66 = v64;
          [v65 joinGroupSessionWithToken:v80 completion:v78];
        }
        goto LABEL_55;
      }
      v50 = _MRLogForCategory();
      BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
      if (v36 | v72 ^ 1u || !v67)
      {
        v49 = (void *)v69;
        if (v51)
        {
          v59 = MRGroupSessionRouteTypeDescription();
          v60 = [v73 sessionIdentifier];
          *(_DWORD *)buf = 138544642;
          *(void *)v85 = v59;
          *(_WORD *)&v85[8] = 2114;
          v86 = v60;
          *(_WORD *)v87 = 1024;
          *(_DWORD *)&v87[2] = v74;
          __int16 v88 = 2114;
          uint64_t v89 = v69;
          __int16 v90 = 1024;
          int v91 = 0;
          __int16 v92 = 2114;
          v93 = v71;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlGroupSessionCoordinator] No action. Rationale: route=%{public}@, targetSession=%{public}@, joinedTargetSession=%{BOOL}u (reason=%{public}@), canStart=%{BOOL}u (reason=%{public}@)", buf, 0x36u);
        }
        goto LABEL_55;
      }
      if (v51)
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v85 = v9;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlGroupSessionCoordinator] Leaving remote session: %{public}@", buf, 0xCu);
      }

      [v9 removeObserver:self];
      v52 = [(MRDRemoteControlGroupSessionCoordinator *)self sessionManager];
      [v52 leaveRemoteControlGroupSession:v9];

      [(MRDRemoteControlGroupSessionCoordinator *)self reevaluateAfterInterval:@"Left auto-joined group session" withReason:5.0];
    }
    v49 = (void *)v69;
LABEL_55:

    goto LABEL_56;
  }
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v17 = v7 != 0;
    unsigned int v18 = [(MRDRemoteControlGroupSessionCoordinator *)self isStartingSession];
    unsigned int v19 = [(MRDRemoteControlGroupSessionCoordinator *)self isJoiningSession];
    unsigned int v20 = [(MRDRemoteControlGroupSessionCoordinator *)self isThrottled];
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v85 = v18;
    *(_WORD *)&v85[4] = 1024;
    *(_DWORD *)&v85[6] = v19;
    LOWORD(v86) = 1024;
    *(_DWORD *)((char *)&v86 + 2) = v20;
    HIWORD(v86) = 1024;
    *(_DWORD *)v87 = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlGroupSessionCoordinator] Returning. Rationale: starting=%{BOOL}u, joining=%{BOOL}u, throttled=%{BOOL}u, isRotating=%{BOOL}u.", buf, 0x1Au);
  }
LABEL_57:
}

- (void)reevaluateAfterInterval:(double)a3 withReason:(id)a4
{
  id v6 = a4;
  id v7 = [(MRDRemoteControlGroupSessionCoordinator *)self queue];
  dispatch_assert_queue_V2(v7);

  if (![(MRDRemoteControlGroupSessionCoordinator *)self isThrottled])
  {
    id v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlGroupSessionCoordinator] Applying throttle: %.2f s.", buf, 0xCu);
    }

    [(MRDRemoteControlGroupSessionCoordinator *)self setThrottled:1];
    objc_initWeak((id *)buf, self);
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    unsigned int v10 = [(MRDRemoteControlGroupSessionCoordinator *)self queue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100072E24;
    v11[3] = &unk_1004182A8;
    objc_copyWeak(&v13, (id *)buf);
    id v12 = v6;
    dispatch_after(v9, v10, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

- (void)clearHostedSessionState
{
  id v3 = [(MRDRemoteControlGroupSessionCoordinator *)self queue];
  dispatch_assert_queue_V2(v3);

  [(MRDRemoteControlGroupSessionCoordinator *)self setHostedSessionIdentifier:0];

  [(MRDRemoteControlGroupSessionCoordinator *)self setRotatingSessionIdentifier:0];
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDRemoteControlGroupSessionCoordinator *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100072FB4;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  dispatch_time_t v9 = self;
  id v6 = v4;
  dispatch_async_and_wait(v5, v7);
}

- (void)session:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(MRDRemoteControlGroupSessionCoordinator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000730C8;
  block[3] = &unk_100415AA8;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)sessionDidRemoveAllParticipants:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDRemoteControlGroupSessionCoordinator *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100073334;
  v7[3] = &unk_1004158D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)eligibilityMonitor:(id)a3 eligibilityStatusDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(MRDRemoteControlGroupSessionCoordinator *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100073500;
  v8[3] = &unk_1004158D8;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)clusterController:(id)a3 clusterStatusDidChange:(unint64_t)a4
{
  id v6 = [(MRDRemoteControlGroupSessionCoordinator *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000735D8;
  v7[3] = &unk_1004165E8;
  void v7[4] = self;
  void v7[5] = a4;
  dispatch_async(v6, v7);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)clusterStatus
{
  return self->_clusterStatus;
}

- (void)setClusterStatus:(unint64_t)a3
{
  self->_clusterStatus = a3;
}

- (MRGroupSessionEligibilityStatus)eligibilityStatus
{
  return self->_eligibilityStatus;
}

- (void)setEligibilityStatus:(id)a3
{
}

- (MRDeviceInfo)remoteASEDeviceInfo
{
  return self->_remoteASEDeviceInfo;
}

- (void)setRemoteASEDeviceInfo:(id)a3
{
}

- (BOOL)isThrottled
{
  return self->_throttled;
}

- (void)setThrottled:(BOOL)a3
{
  self->_throttled = a3;
}

- (BOOL)isStartingSession
{
  return self->_startingSession;
}

- (void)setStartingSession:(BOOL)a3
{
  self->_startingSession = a3;
}

- (BOOL)isJoiningSession
{
  return self->_joiningSession;
}

- (void)setJoiningSession:(BOOL)a3
{
  self->_joiningSession = a3;
}

- (NSString)hostedSessionIdentifier
{
  return self->_hostedSessionIdentifier;
}

- (void)setHostedSessionIdentifier:(id)a3
{
}

- (NSString)rotatingSessionIdentifier
{
  return self->_rotatingSessionIdentifier;
}

- (void)setRotatingSessionIdentifier:(id)a3
{
}

- (MRDGroupSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (void)setSessionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_rotatingSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_hostedSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteASEDeviceInfo, 0);
  objc_storeStrong((id *)&self->_eligibilityStatus, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end