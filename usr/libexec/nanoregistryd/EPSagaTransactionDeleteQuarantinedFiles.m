@interface EPSagaTransactionDeleteQuarantinedFiles
- (EPTransactionDelegate)delegate;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionDeleteQuarantinedFiles

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 serviceFromClass:objc_opt_class()];

  v9 = [v7 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  v10 = [v7 queue];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B8B38;
  v11[3] = &unk_1001655F8;
  v11[4] = self;
  [v8 deleteQuarantinedDataWithStoreUUID:v9 queue:v10 completion:v11];
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