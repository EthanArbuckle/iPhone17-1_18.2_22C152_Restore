@interface NIServerObservationSession
- (BOOL)validateClientPermissions;
- (NIServerObservationSession)initWithClientInfo:(const NIServerClientInfo *)a3 connection:(id)a4;
- (NSString)sessionIdentifier;
- (id).cxx_construct;
- (id)signingIdentity;
- (int)pid;
- (void)_provideTruthTag:(id)a3;
- (void)activate:(id)a3;
- (void)dealloc;
- (void)didDiscoverNearbyObject:(id)a3;
- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4;
- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4;
- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3;
- (void)didUpdateMotionState:(int64_t)a3;
- (void)didUpdateNearbyObjects:(id)a3;
- (void)invalidate;
- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5;
- (void)pause:(id)a3;
- (void)runWithConfiguration:(id)a3 reply:(id)a4;
- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4;
- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4;
@end

@implementation NIServerObservationSession

- (NIServerObservationSession)initWithClientInfo:(const NIServerClientInfo *)a3 connection:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"NIServerObservationSession.mm", 40, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)NIServerObservationSession;
  v7 = [(NIServerObservationSession *)&v15 init];
  v8 = v7;
  if (v7)
  {
    atomic_store(0, (unsigned __int8 *)&v7->_shouldDeliverUpdates);
    atomic_store(0, (unsigned __int8 *)&v7->_activated);
    atomic_store(0, (unsigned __int8 *)&v7->_runOnce);
    uint64_t v9 = +[NIServerClient delegateProxyWithConnection:v6];
    remote = v8->_remote;
    v8->_remote = (NIServerClient *)v9;

    operator new();
  }
  if ([0 validateClientPermissions])
  {
    v11 = (NIServerObservationSession *)0;
  }
  else
  {
    v12 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041A490(v12);
    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)validateClientPermissions
{
  BOOL v3 = [(PRAppStateMonitor *)self->_appStateMonitor isDaemon];
  v4 = [(PRAppStateMonitor *)self->_appStateMonitor launchdJobLabel];
  unsigned int v5 = [v4 isEqualToString:@"com.apple.locationd"];

  id v6 = [(PRAppStateMonitor *)self->_appStateMonitor launchdJobLabel];
  unsigned __int8 v7 = [v6 isEqualToString:@"com.apple.intelligentroutingd"];

  v8 = [(PRAppStateMonitor *)self->_appStateMonitor launchdJobLabel];
  unsigned __int8 v9 = [v8 isEqualToString:@"com.apple.milod"];

  v10 = [(PRAppStateMonitor *)self->_appStateMonitor monitoredProcessName];
  unsigned int v11 = [v10 isEqualToString:@"proxtool"];

  v12 = [(PRAppStateMonitor *)self->_appStateMonitor monitoredProcessName];
  unsigned int v13 = [v12 isEqualToString:@"Hello UWB"];

  v14 = [(PRAppStateMonitor *)self->_appStateMonitor launchdJobLabel];
  unsigned int v15 = [v14 isEqualToString:@"com.apple.WirelessStress"];

  if (os_variant_allows_internal_security_policies() && v11 | v13 | v15)
  {
    v16 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#obsrvr, Internal tool permitted to be an obervation client.", v18, 2u);
    }
    return 1;
  }
  else if (!v3 | v5)
  {
    return v3;
  }
  else
  {
    return v7 | v9;
  }
}

- (void)invalidate
{
  BOOL v3 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(NIServerObservationSession *)self signingIdentity];
    sessionIdentifier = self->_sessionIdentifier;
    int v8 = 138478083;
    unsigned __int8 v9 = v4;
    __int16 v10 = 2113;
    unsigned int v11 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#obsrvr, Invalidate: %{private}@ [%{private}@]", (uint8_t *)&v8, 0x16u);
  }
  id v6 = +[NIServerHomeDeviceService sharedInstance];
  [v6 removeServiceClientWithIdentifier:self->_sessionIdentifier];

  atomic_store(0, (unsigned __int8 *)&self->_shouldDeliverUpdates);
  remote = self->_remote;
  self->_remote = 0;
}

- (void)dealloc
{
  BOOL v3 = +[NIServerHomeDeviceService sharedInstance];
  [v3 removeServiceClientWithIdentifier:self->_sessionIdentifier];

  v4.receiver = self;
  v4.super_class = (Class)NIServerObservationSession;
  [(NIServerObservationSession *)&v4 dealloc];
}

- (int)pid
{
  value = self->_clientInfo.__ptr_.__value_;
  if (value) {
    return value->var1;
  }
  else {
    return 0;
  }
}

- (id)signingIdentity
{
  value = self->_clientInfo.__ptr_.__value_;
  if (value) {
    BOOL v3 = (__CFString *)value->var0;
  }
  else {
    BOOL v3 = @"(null)";
  }

  return v3;
}

- (void)activate:(id)a3
{
  objc_super v4 = (void (**)(id, void *, void))a3;
  unsigned int v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NIServerObservationSession *)self signingIdentity];
    sessionIdentifier = self->_sessionIdentifier;
    int v8 = 138478083;
    unsigned __int8 v9 = v6;
    __int16 v10 = 2113;
    unsigned int v11 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#obsrvr, Activate: %{private}@ [%{private}@]", (uint8_t *)&v8, 0x16u);
  }
  v4[2](v4, &__NSDictionary0__struct, 0);
  atomic_store(1u, (unsigned __int8 *)&self->_activated);
}

- (void)runWithConfiguration:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, void))a4;
  int v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v9 = [(NIServerObservationSession *)self signingIdentity];
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138478339;
    v19 = v9;
    __int16 v20 = 2113;
    v21 = sessionIdentifier;
    __int16 v22 = 2113;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#obsrvr, Run: %{private}@ [%{private}@]. Config: %{private}@", buf, 0x20u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v11 = +[NIServerHomeDeviceService sharedInstance];
    v12 = self->_sessionIdentifier;
    id v13 = [v6 copy];
    [v11 addServiceClient:self identifier:v12 configuration:v13];

    atomic_store(1u, (unsigned __int8 *)&self->_shouldDeliverUpdates);
    atomic_store(1u, (unsigned __int8 *)&self->_runOnce);
    v7[2](v7, 0);
  }
  else
  {
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    CFStringRef v17 = @"This NIConfiguration subclass does not support observation.";
    v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    unsigned int v15 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v14];

    ((void (**)(id, void *))v7)[2](v7, v15);
  }
}

- (void)pause:(id)a3
{
  objc_super v4 = (void (**)(id, void))a3;
  unsigned int v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NIServerObservationSession *)self signingIdentity];
    sessionIdentifier = self->_sessionIdentifier;
    int v8 = 138478083;
    unsigned __int8 v9 = v6;
    __int16 v10 = 2113;
    unsigned int v11 = sessionIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#obsrvr, Pause: %{private}@ [%{private}@]", (uint8_t *)&v8, 0x16u);
  }
  atomic_store(0, (unsigned __int8 *)&self->_shouldDeliverUpdates);
  v4[2](v4, 0);
}

- (void)_provideTruthTag:(id)a3
{
}

- (void)didDiscoverNearbyObject:(id)a3
{
  id v5 = a3;
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if (v4) {
    [(NIServerClient *)self->_remote didDiscoverNearbyObject:v5];
  }
}

- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4
{
  id v7 = a3;
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if (v6) {
    [(NIServerClient *)self->_remote didRemoveNearbyObjects:v7 withReason:a4];
  }
}

- (void)didUpdateNearbyObjects:(id)a3
{
  id v5 = a3;
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if (v4) {
    [(NIServerClient *)self->_remote didUpdateNearbyObjects:v5];
  }
}

- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if (v10) {
    [(NIServerClient *)self->_remote object:v11 didUpdateRegion:v8 previousRegion:v9];
  }
}

- (void)didUpdateMotionState:(int64_t)a3
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if (v3) {
    [(NIServerClient *)self->_remote didUpdateMotionState:a3];
  }
}

- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_activated);
  if (v4)
  {
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_runOnce);
    if (v5) {
      [(NIServerClient *)self->_remote uwbSessionInterruptedWithReason:a3 timestamp:a4];
    }
  }
}

- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_activated);
  if (v4)
  {
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_runOnce);
    if (v5) {
      [(NIServerClient *)self->_remote uwbSessionInterruptionReasonEnded:a3 timestamp:a4];
    }
  }
}

- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if (v7) {
    [(NIServerClient *)self->_remote didUpdateAlgorithmState:v8 forObject:v6];
  }
}

- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_shouldDeliverUpdates);
  if (v3) {
    [(NIServerClient *)self->_remote didUpdateHomeDeviceUWBRangingAvailability:a3];
  }
}

- (NSString)sessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  sub_1001CA854((id **)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);

  objc_storeStrong((id *)&self->_remote, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end