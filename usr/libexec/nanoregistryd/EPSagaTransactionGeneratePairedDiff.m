@interface EPSagaTransactionGeneratePairedDiff
- (EPTransactionDelegate)delegate;
- (id)_makeActiveDeviceCollectionDiffWithPairingID:(id)a3;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionGeneratePairedDiff

- (id)_makeActiveDeviceCollectionDiffWithPairingID:(id)a3
{
  id v3 = a3;
  v4 = +[NRMutableDevice diffsToPair:1 withDate:0];
  id v5 = [objc_alloc((Class)NRDeviceDiff) initWithDiffPropertyDiffs:v4];
  id v6 = [objc_alloc((Class)NRDeviceDiffType) initWithDiff:v5 andChangeType:1];
  id v7 = objc_alloc((Class)NRDeviceCollectionDiff);
  id v11 = v3;
  id v12 = v6;
  v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  id v9 = [v7 initWithDeviceCollectionDiffDeviceDiffs:v8];

  return v9;
}

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  id v9 = [v7 serviceFromClass:objc_opt_class()];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100088318;
  v13[3] = &unk_1001656B8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v7;
  id v16 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  [v9 grabRegistryWithReadBlockAsync:v13];
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v5 = [(EPSagaTransactionGeneratePairedDiff *)self delegate];
  [v5 transactionDidComplete:self];
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
}

@end