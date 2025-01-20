@interface EPSagaTransactionMakeDevicePaired
- (EPTransactionDelegate)delegate;
- (id)_makeIsPairedDeviceCollection:(id)a3 diffWithPairingID:(id)a4 pair:(BOOL)a5;
- (id)_makeIsSetupNoDeviceCollection:(id)a3 diffWithPairingID:(id)a4;
- (id)registry;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionMakeDevicePaired

- (id)registry
{
  serviceRegistry = self->_serviceRegistry;
  uint64_t v3 = objc_opt_class();

  return [(EPServiceRegistry *)serviceRegistry serviceFromClass:v3];
}

- (id)_makeIsPairedDeviceCollection:(id)a3 diffWithPairingID:(id)a4 pair:(BOOL)a5
{
  BOOL v5 = a5;
  id v6 = objc_alloc((Class)NRDevicePropertyDiffType);
  id v7 = objc_alloc((Class)NRDevicePropertyDiff);
  v8 = +[NSNumber numberWithBool:v5];
  id v9 = [v7 initWithValue:v8];
  id v10 = [v6 initWithDiff:v9 andChangeType:1];

  if (v5)
  {
    v11 = +[NSDate date];
    id v12 = objc_alloc((Class)NRDevicePropertyDiffType);
    id v13 = [objc_alloc((Class)NRDevicePropertyDiff) initWithValue:v11];
    id v14 = [v12 initWithDiff:v13 andChangeType:1];

    id v15 = objc_alloc((Class)NRDeviceDiff);
    v22[0] = NRDevicePropertyIsPaired;
    v22[1] = NRDevicePropertyPairedDate;
    v23[0] = v10;
    v23[1] = v14;
    v16 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    id v17 = [v15 initWithDiffPropertyDiffs:v16];
  }
  else
  {
    id v18 = objc_alloc((Class)NRDeviceDiff);
    uint64_t v20 = NRDevicePropertyIsPaired;
    id v21 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v17 = [v18 initWithDiffPropertyDiffs:v11];
  }

  return v17;
}

- (id)_makeIsSetupNoDeviceCollection:(id)a3 diffWithPairingID:(id)a4
{
  id v4 = objc_alloc((Class)NRDevicePropertyDiffType);
  id v5 = [objc_alloc((Class)NRDevicePropertyDiff) initWithValue:&__kCFBooleanFalse];
  id v6 = [v4 initWithDiff:v5 andChangeType:1];

  id v7 = objc_alloc((Class)NRDeviceDiff);
  uint64_t v11 = NRDevicePropertyIsSetup;
  id v12 = v6;
  v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  id v9 = [v7 initWithDiffPropertyDiffs:v8];

  return v9;
}

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_serviceRegistry, a4);
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  id v9 = [v6 objectForKeyedSubscript:@"isPaired"];
  unsigned __int8 v10 = [v9 BOOLValue];
  uint64_t v11 = [(EPSagaTransactionMakeDevicePaired *)self registry];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100068DF0;
  v14[3] = &unk_100167D70;
  id v15 = v8;
  v16 = self;
  unsigned __int8 v18 = v10;
  id v17 = v6;
  id v12 = v6;
  id v13 = v8;
  [v11 grabRegistryWithWriteBlockAsync:v14];
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"shouldRollBack"];
  if ([v8 BOOLValue])
  {
    objc_storeStrong((id *)&self->_serviceRegistry, a4);
    id v9 = [v6 objectForKeyedSubscript:@"nrDeviceIdentifier"];
    unsigned __int8 v10 = [v6 objectForKeyedSubscript:@"isPaired"];
    unsigned __int8 v11 = [v10 BOOLValue];
    id v12 = [(EPSagaTransactionMakeDevicePaired *)self registry];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000690E8;
    v14[3] = &unk_100167D70;
    id v15 = v9;
    v16 = self;
    unsigned __int8 v18 = v11;
    id v17 = v6;
    id v13 = v9;
    [v12 grabRegistryWithWriteBlockAsync:v14];
  }
  else
  {
    unsigned __int8 v10 = [(EPSagaTransactionMakeDevicePaired *)self delegate];
    [v10 transactionDidComplete:self];
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

  objc_storeStrong((id *)&self->_serviceRegistry, 0);
}

@end