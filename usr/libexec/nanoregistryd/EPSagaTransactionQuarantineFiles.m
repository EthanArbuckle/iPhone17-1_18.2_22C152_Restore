@interface EPSagaTransactionQuarantineFiles
- (EPTransactionDelegate)delegate;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionQuarantineFiles

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 serviceFromClass:objc_opt_class()];

  v9 = [v6 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  v10 = [v6 queue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000567D0;
  v14[3] = &unk_100165EB0;
  id v15 = v6;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v11 = v9;
  id v12 = v8;
  id v13 = v6;
  [v12 quarantineDataWithStoreUUID:v11 services:0 queue:v10 completion:v14];
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 serviceFromClass:objc_opt_class()];

  v9 = [v6 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  v10 = [v6 queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100056A8C;
  v12[3] = &unk_1001678E8;
  id v13 = v6;
  v14 = self;
  id v11 = v6;
  [v8 unquarantineDataWithStoreUUID:v9 services:0 queue:v10 completion:v12];
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