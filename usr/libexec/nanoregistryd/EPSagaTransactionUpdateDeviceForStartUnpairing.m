@interface EPSagaTransactionUpdateDeviceForStartUnpairing
- (EPTransactionDelegate)delegate;
- (void)_updateRegistryForUnpairing:(id)a3 pairingReport:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionUpdateDeviceForStartUnpairing

- (void)_updateRegistryForUnpairing:(id)a3 pairingReport:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc((Class)NRDevicePropertyDiffType);
    unsigned int v9 = [v7 isErrorSet];
    if (v9)
    {
      id v10 = objc_alloc((Class)NRDevicePropertyDiff);
      v4 = [v7 detailedError];
      id v11 = [v10 initWithValue:v4];
    }
    else
    {
      id v11 = 0;
    }
    if ([v7 isErrorSet]) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 2;
    }
    id v12 = [v8 initWithDiff:v11 andChangeType:v13];
    if (v9)
    {
    }
  }
  else
  {
    id v12 = 0;
  }
  id v14 = objc_alloc((Class)NRDevicePropertyDiffType);
  id v15 = [objc_alloc((Class)NRDevicePropertyDiff) initWithValue:&__kCFBooleanFalse];
  id v16 = [v14 initWithDiff:v15 andChangeType:0];

  id v17 = [objc_alloc((Class)NRDevicePropertyDiffType) initWithDiff:0 andChangeType:2];
  id v18 = objc_alloc((Class)NRDeviceDiff);
  if (v12)
  {
    v27[0] = _NRDevicePropertyLastPairingError;
    v27[1] = NRDevicePropertyIsPaired;
    v28[0] = v12;
    v28[1] = v16;
    v27[2] = _NRDevicePropertyPairingStatusBluetoothPaired;
    v28[2] = v17;
    v19 = v28;
    v20 = v27;
    uint64_t v21 = 3;
  }
  else
  {
    v25[0] = NRDevicePropertyIsPaired;
    v25[1] = _NRDevicePropertyPairingStatusBluetoothPaired;
    v26[0] = v16;
    v26[1] = v17;
    v19 = v26;
    v20 = v25;
    uint64_t v21 = 2;
  }
  v22 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v20 count:v21];
  id v23 = [v18 initWithDiffPropertyDiffs:v22];

  id v24 = [v6 applyDiff:v23];
}

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 serviceFromClass:objc_opt_class()];
  unsigned int v9 = [v7 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  id v10 = [v7 objectForKeyedSubscript:@"pairingReport"];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A0FF8;
  v14[3] = &unk_1001686B8;
  id v15 = v9;
  id v16 = self;
  id v17 = v10;
  id v18 = v6;
  id v11 = v6;
  id v12 = v10;
  id v13 = v9;
  [v8 grabRegistryWithWriteBlockAsync:v14];
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