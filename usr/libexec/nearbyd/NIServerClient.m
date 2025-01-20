@interface NIServerClient
+ (id)delegateProxyWithConnection:(id)a3;
- (NIServerClient)initWithConnection:(id)a3;
- (NSXPCConnection)connection;
- (void)dealloc;
- (void)didDiscoverNearbyObject:(id)a3;
- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4;
- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4;
- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4;
- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4;
- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4;
- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4;
- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4;
- (void)didStartAcwgRanging:(int64_t)a3;
- (void)didSuspendAcwgRanging:(int64_t)a3;
- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4;
- (void)didUpdateHealthStatus:(int64_t)a3;
- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3;
- (void)didUpdateLocalDiscoveryToken:(id)a3;
- (void)didUpdateMotionState:(int64_t)a3;
- (void)didUpdateNearbyObjects:(id)a3;
- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5;
- (void)relayDCKMessage:(id)a3;
- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4;
- (void)setConnection:(id)a3;
- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4;
- (void)systemDidUpdateState:(id)a3;
- (void)uwbSessionDidFailWithError:(id)a3;
- (void)uwbSessionDidInvalidateWithError:(id)a3;
- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4;
- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4;
@end

@implementation NIServerClient

+ (id)delegateProxyWithConnection:(id)a3
{
  id v3 = a3;
  v4 = [[NIServerClient alloc] initWithConnection:v3];

  return v4;
}

- (NIServerClient)initWithConnection:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"NIServerClient.mm", 23, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)NIServerClient;
  v7 = [(NIServerClient *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_connection, a3);
    v9 = [[PRNSXPCConnection alloc] initWithConnection:v8->_connection];
    connWrapper = v8->_connWrapper;
    v8->_connWrapper = (UWBSessionDelegateProxyProtocol *)v9;
  }
  return v8;
}

- (void)dealloc
{
  [(UWBSessionDelegateProxyProtocol *)self->_connWrapper invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NIServerClient;
  [(NIServerClient *)&v3 dealloc];
}

- (void)setConnection:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_connection, a3);
  v5 = [[PRNSXPCConnection alloc] initWithConnection:self->_connection];
  connWrapper = self->_connWrapper;
  self->_connWrapper = (UWBSessionDelegateProxyProtocol *)v5;
}

- (void)uwbSessionDidFailWithError:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030974;
  v7[3] = &unk_100846C60;
  id v8 = v4;
  id v6 = v4;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v7];
}

- (void)uwbSessionDidInvalidateWithError:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030A9C;
  v7[3] = &unk_100846C60;
  id v8 = v4;
  id v6 = v4;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v7];
}

- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4
{
  id v6 = a3;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100030BC8;
  v9[3] = &unk_100846C88;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v9];
}

- (void)didUpdateNearbyObjects:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030CF0;
  v7[3] = &unk_100846C60;
  id v8 = v4;
  id v6 = v4;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v7];
}

- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4
{
  connWrapper = self->_connWrapper;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100030DDC;
  v5[3] = &unk_100846CA8;
  v5[4] = a3;
  *(double *)&v5[5] = a4;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v5];
}

- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4
{
  connWrapper = self->_connWrapper;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100030ECC;
  v5[3] = &unk_100846CA8;
  v5[4] = a3;
  *(double *)&v5[5] = a4;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v5];
}

- (void)didDiscoverNearbyObject:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030FF8;
  v7[3] = &unk_100846C60;
  id v8 = v4;
  id v6 = v4;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v7];
}

- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  connWrapper = self->_connWrapper;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003118C;
  v15[3] = &unk_100846CD0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v15];
}

- (void)didUpdateMotionState:(int64_t)a3
{
  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100031278;
  v4[3] = &unk_100846CF0;
  v4[4] = a3;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v4];
}

- (void)didUpdateHealthStatus:(int64_t)a3
{
  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100031360;
  v4[3] = &unk_100846CF0;
  v4[4] = a3;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v4];
}

- (void)relayDCKMessage:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031488;
  v7[3] = &unk_100846C60;
  id v8 = v4;
  id v6 = v4;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v7];
}

- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connWrapper = self->_connWrapper;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000315E4;
  v11[3] = &unk_100846D18;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v11];
}

- (void)didUpdateLocalDiscoveryToken:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003170C;
  v7[3] = &unk_100846C60;
  id v8 = v4;
  id v6 = v4;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v7];
}

- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4
{
  id v6 = a4;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003183C;
  v9[3] = &unk_100846D40;
  BOOL v11 = a3;
  id v10 = v6;
  id v8 = v6;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v9];
}

- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connWrapper = self->_connWrapper;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003199C;
  v11[3] = &unk_100846D18;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v11];
}

- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3
{
  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100031A84;
  v4[3] = &unk_100846D60;
  BOOL v5 = a3;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v4];
}

- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connWrapper = self->_connWrapper;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100031BE0;
  v11[3] = &unk_100846D18;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v11];
}

- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connWrapper = self->_connWrapper;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100031D3C;
  v11[3] = &unk_100846D18;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v11];
}

- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connWrapper = self->_connWrapper;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100031E98;
  v11[3] = &unk_100846D18;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v11];
}

- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  connWrapper = self->_connWrapper;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100031F84;
  v5[3] = &unk_100846D80;
  unsigned int v6 = a3;
  v5[4] = a4;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v5];
}

- (void)didStartAcwgRanging:(int64_t)a3
{
  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100032070;
  v4[3] = &unk_100846CF0;
  void v4[4] = a3;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v4];
}

- (void)didSuspendAcwgRanging:(int64_t)a3
{
  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100032158;
  v4[3] = &unk_100846CF0;
  void v4[4] = a3;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v4];
}

- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4
{
  id v6 = a4;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100032288;
  v9[3] = &unk_100846DA8;
  unsigned int v11 = a3;
  id v10 = v6;
  id v8 = v6;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v9];
}

- (void)systemDidUpdateState:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000323B4;
  v7[3] = &unk_100846C60;
  id v8 = v4;
  id v6 = v4;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v7];
}

- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4
{
  id v6 = a4;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000324E4;
  v9[3] = &unk_100846D40;
  BOOL v11 = a3;
  id v10 = v6;
  id v8 = v6;
  [(UWBSessionDelegateProxyProtocol *)connWrapper actOnRemoteObjectAndScheduleBarrierBlock:v9];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_connWrapper, 0);
}

@end