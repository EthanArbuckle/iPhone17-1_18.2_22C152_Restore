@interface EPSagaTransactionActivateDevice
- (EPTransactionDelegate)delegate;
- (id)_makeActiveDeviceCollection:(id)a3 diffWithPairingID:(id)a4 activate:(BOOL)a5;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionActivateDevice

- (id)_makeActiveDeviceCollection:(id)a3 diffWithPairingID:(id)a4 activate:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = +[NSDate date];
  v10 = +[NSMutableDictionary dictionary];
  v11 = [v7 activeDeviceID];
  v12 = v11;
  if (v5)
  {
    unsigned __int8 v13 = [v8 isEqual:v11];

    if (v13) {
      goto LABEL_9;
    }
    v14 = [v7 activeDeviceID];

    if (v14)
    {
      v15 = +[NRMutableDevice diffsToActivate:0 withDate:v9];
      id v16 = [objc_alloc((Class)NRDeviceDiff) initWithDiffPropertyDiffs:v15];
      id v17 = [objc_alloc((Class)NRDeviceDiffType) initWithDiff:v16 andChangeType:1];
      v18 = [v7 activeDeviceID];
      [v10 setObject:v17 forKeyedSubscript:v18];
    }
    v19 = +[NRMutableDevice diffsToActivate:1 withDate:v9];
    id v20 = [v19 mutableCopy];

    id v21 = objc_alloc((Class)NRDevicePropertyDiffType);
    id v22 = [objc_alloc((Class)NRDevicePropertyDiff) initWithValue:v8];
    id v23 = [v21 initWithDiff:v22 andChangeType:1];

    [v20 setObject:v23 forKeyedSubscript:NRDevicePropertyPairingID];
    id v24 = [objc_alloc((Class)NRDeviceDiff) initWithDiffPropertyDiffs:v20];
    id v25 = [objc_alloc((Class)NRDeviceDiffType) initWithDiff:v24 andChangeType:1];
    v26 = v10;
    id v27 = v25;
    id v28 = v8;
  }
  else
  {

    if (!v12) {
      goto LABEL_9;
    }
    id v20 = +[NRMutableDevice diffsToActivate:0 withDate:v9];
    id v23 = [objc_alloc((Class)NRDeviceDiff) initWithDiffPropertyDiffs:v20];
    id v24 = [objc_alloc((Class)NRDeviceDiffType) initWithDiff:v23 andChangeType:1];
    id v25 = [v7 activeDeviceID];
    v26 = v10;
    id v27 = v24;
    id v28 = v25;
  }
  [v26 setObject:v27 forKeyedSubscript:v28];

LABEL_9:
  if ([v10 count]) {
    id v29 = [objc_alloc((Class)NRDeviceCollectionDiff) initWithDeviceCollectionDiffDeviceDiffs:v10];
  }
  else {
    id v29 = 0;
  }

  return v29;
}

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  v9 = [v7 serviceFromClass:objc_opt_class()];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100022AAC;
  v12[3] = &unk_1001662B0;
  v12[4] = self;
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 grabRegistryWithWriteBlockAsync:v12];
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v9 objectForKeyedSubscript:@"shouldRollBack"];
  if ([v7 BOOLValue])
  {
    [(EPSagaTransactionActivateDevice *)self beginTransactionWithRoutingSlipEntry:v9 serviceRegistry:v6];
  }
  else
  {
    id v8 = [(EPSagaTransactionActivateDevice *)self delegate];
    [v8 transactionDidComplete:self];
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
}

@end