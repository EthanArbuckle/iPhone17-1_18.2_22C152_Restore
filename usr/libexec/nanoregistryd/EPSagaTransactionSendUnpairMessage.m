@interface EPSagaTransactionSendUnpairMessage
- (EPTransactionDelegate)delegate;
- (id)registry;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setRemoteUnpairTimeout;
- (void)transactionDidComplete;
@end

@implementation EPSagaTransactionSendUnpairMessage

- (id)registry
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return [(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_serviceRegistry, a4);
  v8 = [v6 objectForKeyedSubscript:@"shouldObliterate"];
  v9 = [v6 objectForKeyedSubscript:@"shouldPreserveESim"];
  v10 = [v6 objectForKeyedSubscript:@"shouldBrick"];
  v29 = [v6 objectForKeyedSubscript:@"pairingReport"];
  v11 = [v6 objectForKeyedSubscript:@"remoteUnpairRequestID"];
  v12 = [v6 objectForKeyedSubscript:@"advertisedName"];
  v13 = [v6 objectForKeyedSubscript:@"idsDeviceIdentifier"];
  v14 = [v6 objectForKeyedSubscript:@"timeoutDuration"];
  timeoutDurationNumber = self->_timeoutDurationNumber;
  self->_timeoutDurationNumber = v14;

  v28 = v7;
  v16 = [v7 serviceFromClass:objc_opt_class()];
  if (![v16 isIDSConnected]) {
    goto LABEL_7;
  }
  [v16 defaultPairedDevice];
  v17 = v27 = v8;
  [v17 nsuuid];
  v18 = v26 = v9;
  unsigned int v19 = [v13 isEqual:v18];

  v9 = v26;
  v8 = v27;
  if (!v19) {
    goto LABEL_7;
  }
  if (v12 && v13)
  {
    [(EPSagaTransactionSendUnpairMessage *)self setRemoteUnpairTimeout];
    objc_initWeak(&location, self);
    unsigned int v20 = [v29 isErrorSet];
    v21 = v10;
    if (v20)
    {
      v10 = [v29 detailedError];
      v25 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 code]);
    }
    else
    {
      v25 = 0;
    }
    v22 = [v29 abortPairingReason];
    v24 = v10;
    unsigned int v23 = v20;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100019EEC;
    v30[3] = &unk_100165E40;
    objc_copyWeak(&v33, &location);
    id v31 = v11;
    id v32 = v6;
    v9 = v26;
    v8 = v27;
    [v16 sendUnpairMessageWithAdvertisedName:v12 btUUID:v13 shouldObliterate:v27 shouldBrick:v21 shouldPreserveESim:v26 withPairingFailureCode:v25 withAbortReason:v22 withRequestIdentifier:v31 responseBlock:v30];

    if (v23)
    {
    }
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_7:
    [(EPSagaTransactionSendUnpairMessage *)self transactionDidComplete];
    v21 = v10;
  }
}

- (void)setRemoteUnpairTimeout
{
  [(AbstractTimer *)self->_timer invalidate];
  if (self->_timeoutDurationNumber)
  {
    objc_initWeak(&location, self);
    timeoutDurationNumber = self->_timeoutDurationNumber;
    if (timeoutDurationNumber)
    {
      [(NSNumber *)timeoutDurationNumber doubleValue];
      double v5 = v4;
    }
    else
    {
      double v5 = 20.0;
    }
    id v6 = [(EPServiceRegistry *)self->_serviceRegistry queue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001A114;
    v9[3] = &unk_100165E68;
    objc_copyWeak(&v10, &location);
    id v7 = +[TimerFactory timerWithIdentifier:@"com.apple.NanoRegistry.EPSagaTransactionSendUnpairMessage" delay:1 gracePeriod:v6 waking:v9 handlerQueue:v5 handlerBlock:0.0];
    timer = self->_timer;
    self->_timer = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)transactionDidComplete
{
  [(AbstractTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;

  if (!self->_transactionComplete)
  {
    self->_transactionComplete = 1;
    id v4 = [(EPSagaTransactionSendUnpairMessage *)self delegate];
    [v4 transactionDidComplete:self];
  }
}

- (EPTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeoutDurationNumber, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_serviceRegistry, 0);
}

@end