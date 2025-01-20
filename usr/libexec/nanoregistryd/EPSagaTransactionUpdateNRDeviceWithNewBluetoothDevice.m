@interface EPSagaTransactionUpdateNRDeviceWithNewBluetoothDevice
- (EPRoutingSlipEntry)routingSlipEntry;
- (EPTransactionDelegate)delegate;
- (id)_deviceCollection:(id)a3 diffToUpdateBluetoothId:(id)a4 ofDevice:(id)a5;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setRoutingSlipEntry:(id)a3;
@end

@implementation EPSagaTransactionUpdateNRDeviceWithNewBluetoothDevice

- (id)_deviceCollection:(id)a3 diffToUpdateBluetoothId:(id)a4 ofDevice:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 activeDeviceID];
  v11 = +[NSMutableDictionary dictionary];
  v12 = +[NSDate date];
  v13 = +[NSMutableDictionary dictionary];
  v14 = [v9 objectForKeyedSubscript:v8];

  LOBYTE(v9) = [v14 isActive];
  if ((v9 & 1) == 0)
  {
    v15 = +[NRMutableDevice diffsToActivate:1 withDate:v12];
    [v13 addEntriesFromDictionary:v15];
  }
  if (v7)
  {
    id v16 = objc_alloc((Class)NRDevicePropertyDiffType);
    id v17 = [objc_alloc((Class)NRDevicePropertyDiff) initWithValue:v7];
    id v18 = [v16 initWithDiff:v17 andChangeType:1];

    [v13 setObject:v18 forKeyedSubscript:_NRDevicePropertyBluetoothIdentifier];
  }
  if ([v13 count])
  {
    id v19 = [objc_alloc((Class)NRDeviceDiff) initWithDiffPropertyDiffs:v13];
    id v20 = [objc_alloc((Class)NRDeviceDiffType) initWithDiff:v19 andChangeType:1];
    [v11 setObject:v20 forKeyedSubscript:v8];
  }
  if (v10 && ([v10 isEqual:v8] & 1) == 0)
  {
    v21 = +[NSMutableDictionary dictionary];
    v22 = +[NRMutableDevice diffsToActivate:0 withDate:v12];
    [v21 addEntriesFromDictionary:v22];

    v23 = +[NRMutableDevice diffsToClearStatusCodeAndCompatibilityState];
    [v21 addEntriesFromDictionary:v23];

    id v24 = [objc_alloc((Class)NRDeviceDiff) initWithDiffPropertyDiffs:v21];
    id v25 = [objc_alloc((Class)NRDeviceDiffType) initWithDiff:v24 andChangeType:1];
    [v11 setObject:v25 forKeyedSubscript:v10];
  }
  if ([v11 count]) {
    id v26 = [objc_alloc((Class)NRDeviceCollectionDiff) initWithDeviceCollectionDiffDeviceDiffs:v11];
  }
  else {
    id v26 = 0;
  }

  return v26;
}

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"coreBluetoothID"];
  id v9 = [v6 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  v10 = [v7 serviceFromClass:objc_opt_class()];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000195F8;
  v14[3] = &unk_1001656B8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v6;
  id v11 = v6;
  id v12 = v9;
  id v13 = v8;
  [v10 grabRegistryWithReadBlock:v14];
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  v5 = [a3 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001999C;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v5, block);
}

- (EPTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

  objc_destroyWeak((id *)&self->_delegate);
}

@end