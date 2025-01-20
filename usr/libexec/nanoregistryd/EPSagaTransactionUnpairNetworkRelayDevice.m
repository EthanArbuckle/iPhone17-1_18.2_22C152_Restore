@interface EPSagaTransactionUnpairNetworkRelayDevice
- (EPMassUnpairer)unpairer;
- (EPRoutingSlipEntry)routingSlipEntry;
- (EPTransactionDelegate)delegate;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)networkRelayPairingCompletedWithError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRoutingSlipEntry:(id)a3;
- (void)setUnpairer:(id)a3;
@end

@implementation EPSagaTransactionUnpairNetworkRelayDevice

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_routingSlipEntry, a3);
  v7 = [v6 objectForKeyedSubscript:@"networkRelayID"];
  if (v7)
  {
    objc_storeStrong((id *)&self->_routingSlipEntry, a3);
    v8 = +[NetworkRelayAgent sharedInstance];
    [v8 addDelegate:self];
    [v8 unpairNetworkRelayDeviceWithNetworkRelayIdentifier:v7];
  }
  else
  {
    v8 = [(EPRoutingSlipEntry *)self->_routingSlipEntry queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100098828;
    block[3] = &unk_1001655F8;
    block[4] = self;
    dispatch_async(v8, block);
  }
}

- (void)networkRelayPairingCompletedWithError:(id)a3
{
  id v4 = a3;
  v5 = networkrelay_pairing_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "networkRelayPairingCompletedWithError called with error %{public}@", buf, 0xCu);
  }

  id v6 = +[NetworkRelayAgent sharedInstance];
  [v6 removeDelegate:self];
  v7 = [(EPRoutingSlipEntry *)self->_routingSlipEntry queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000989B8;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v7, block);
}

- (EPTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EPMassUnpairer)unpairer
{
  return self->_unpairer;
}

- (void)setUnpairer:(id)a3
{
}

- (EPRoutingSlipEntry)routingSlipEntry
{
  return self->_routingSlipEntry;
}

- (void)setRoutingSlipEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingSlipEntry, 0);
  objc_storeStrong((id *)&self->_unpairer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end