@interface EPSagaTransactionEnableWatchGraduation
- (EPTransactionDelegate)delegate;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionEnableWatchGraduation

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v5 = a4;
  v6 = [v5 serviceFromClass:objc_opt_class()];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000156D0;
  v8[3] = &unk_100165730;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  [v6 grabRegistryWithReadBlockAsync:v8];
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