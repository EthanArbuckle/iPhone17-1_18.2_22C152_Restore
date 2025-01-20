@interface EPSagaTransactionNotifyCompanionOfCompletion
- (EPTransactionDelegate)delegate;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionNotifyCompanionOfCompletion

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 serviceFromClass:objc_opt_class()];

  v9 = [v6 objectForKeyedSubscript:@"coreBluetoothID"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E1E08;
  v11[3] = &unk_1001673C0;
  id v12 = v6;
  v13 = self;
  id v10 = v6;
  [v8 sendMigrationCompletionWithStatus:0 toIDSBTUUID:v9 withResponseBlock:v11];
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  v5 = [a3 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E2058;
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

- (void).cxx_destruct
{
}

@end