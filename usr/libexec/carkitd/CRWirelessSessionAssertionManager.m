@interface CRWirelessSessionAssertionManager
+ (id)_descriptionForTransportType:(unint64_t)a3;
- (CARConnectionTimeServiceAgent)connectionTimeService;
- (CARMessagingServiceConnector)messagingConnector;
- (CARSessionStatus)sessionStatus;
- (CRSessionStoredVehicleProviding)storedVehicleProvider;
- (CRWirelessSessionAssertionManager)initWithSessionStatus:(id)a3 connectionTimeServiceAgent:(id)a4 messagingConnector:(id)a5;
- (NSTimer)timeoutTimer;
- (OS_os_transaction)processTransaction;
- (void)cancelledConnectionAttemptOnTransport:(unint64_t)a3;
- (void)dealloc;
- (void)handleTimeout:(id)a3;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setProcessTransaction:(id)a3;
- (void)setSessionStatus:(id)a3;
- (void)setStoredVehicleProvider:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)startTimeoutTimer;
- (void)startWaitingForConnection;
- (void)startedConnectionAttemptOnTransport:(unint64_t)a3;
- (void)stopTimeoutTimer;
- (void)stopWaitingForConnection;
@end

@implementation CRWirelessSessionAssertionManager

- (CRWirelessSessionAssertionManager)initWithSessionStatus:(id)a3 connectionTimeServiceAgent:(id)a4 messagingConnector:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRWirelessSessionAssertionManager;
  v12 = [(CRWirelessSessionAssertionManager *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionStatus, a3);
    [v9 addSessionObserver:v13];
    objc_storeStrong((id *)&v13->_connectionTimeService, a4);
    objc_storeStrong((id *)&v13->_messagingConnector, a5);
    [(CRWirelessSessionAssertionManager *)v13 setTimeoutTimer:0];
    [(CRWirelessSessionAssertionManager *)v13 setProcessTransaction:0];
  }

  return v13;
}

- (void)dealloc
{
  [(CRWirelessSessionAssertionManager *)self setSessionStatus:0];
  [(CRWirelessSessionAssertionManager *)self stopTimeoutTimer];
  [(CRWirelessSessionAssertionManager *)self setProcessTransaction:0];
  v3.receiver = self;
  v3.super_class = (Class)CRWirelessSessionAssertionManager;
  [(CRWirelessSessionAssertionManager *)&v3 dealloc];
}

- (void)startTimeoutTimer
{
  objc_super v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "assertion manager starting re-evaluation timer", v6, 2u);
  }

  v4 = [(CRWirelessSessionAssertionManager *)self timeoutTimer];

  if (!v4)
  {
    v5 = +[NSTimer scheduledTimerWithTimeInterval:self target:"handleTimeout:" selector:0 userInfo:0 repeats:60.0];
    [(CRWirelessSessionAssertionManager *)self setTimeoutTimer:v5];
  }
}

- (void)stopTimeoutTimer
{
  objc_super v3 = [(CRWirelessSessionAssertionManager *)self timeoutTimer];
  [v3 invalidate];

  [(CRWirelessSessionAssertionManager *)self setTimeoutTimer:0];
}

- (void)handleTimeout:(id)a3
{
  v4 = [(CRWirelessSessionAssertionManager *)self sessionStatus];
  v5 = [v4 currentSession];

  if (v5
    && ([v5 configuration],
        v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 transportType],
        v6,
        v7 == (id)3))
  {
    v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100075AF0(v8);
    }
  }
  else
  {
    v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100075AAC(v8);
    }
  }

  [(CRWirelessSessionAssertionManager *)self stopWaitingForConnection];
}

- (void)startedConnectionAttemptOnTransport:(unint64_t)a3
{
  if (a3 == 3)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10005BE84;
    v11[3] = &unk_1000BD1B0;
    v11[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
  }
  v5 = +[CRWirelessSessionAssertionManager _descriptionForTransportType:a3];
  uint64_t v6 = CARCarKitTransportEvent;
  id v7 = +[NSDate date];
  CFStringRef v12 = @"transportType";
  v13 = v5;
  v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v9 = +[CARConnectionEvent eventWithName:v6 type:4 date:v7 payload:v8];

  connectionTimeService = self->_connectionTimeService;
  if (connectionTimeService) {
    [(CARConnectionTimeServiceAgent *)connectionTimeService recordConnectionEvent:v9 completion:&stru_1000BF4E8];
  }
}

+ (id)_descriptionForTransportType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Unknown";
  }
  else {
    return *(&off_1000BF508 + a3 - 1);
  }
}

- (void)cancelledConnectionAttemptOnTransport:(unint64_t)a3
{
  if (a3 == 3)
  {
    block[5] = v3;
    block[6] = v4;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005BF9C;
    block[3] = &unk_1000BD1B0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)sessionDidConnect:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005C03C;
  v5[3] = &unk_1000BD3A8;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)sessionDidDisconnect:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005C164;
  v5[3] = &unk_1000BD3A8;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)startWaitingForConnection
{
  uint64_t v3 = (void *)os_transaction_create();
  id v4 = CarGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "opening 'com.apple.carkit.active-session' transaction %@", (uint8_t *)&v5, 0xCu);
  }

  [(CRWirelessSessionAssertionManager *)self setProcessTransaction:v3];
  [(CRWirelessSessionAssertionManager *)self startTimeoutTimer];
}

- (void)stopWaitingForConnection
{
  uint64_t v3 = [(CRWirelessSessionAssertionManager *)self processTransaction];

  if (v3)
  {
    id v4 = CarGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "closing 'com.apple.carkit.active-session' transaction", v5, 2u);
    }
  }
  [(CRWirelessSessionAssertionManager *)self setProcessTransaction:0];
  [(CRWirelessSessionAssertionManager *)self stopTimeoutTimer];
}

- (CRSessionStoredVehicleProviding)storedVehicleProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storedVehicleProvider);

  return (CRSessionStoredVehicleProviding *)WeakRetained;
}

- (void)setStoredVehicleProvider:(id)a3
{
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (OS_os_transaction)processTransaction
{
  return self->_processTransaction;
}

- (void)setProcessTransaction:(id)a3
{
}

- (CARConnectionTimeServiceAgent)connectionTimeService
{
  return self->_connectionTimeService;
}

- (CARMessagingServiceConnector)messagingConnector
{
  return self->_messagingConnector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingConnector, 0);
  objc_storeStrong((id *)&self->_connectionTimeService, 0);
  objc_storeStrong((id *)&self->_processTransaction, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);

  objc_destroyWeak((id *)&self->_storedVehicleProvider);
}

@end