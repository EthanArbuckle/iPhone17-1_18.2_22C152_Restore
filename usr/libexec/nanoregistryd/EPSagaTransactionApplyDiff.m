@interface EPSagaTransactionApplyDiff
- (EPTransactionDelegate)delegate;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionApplyDiff

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"transactionCompleted"];
  if ([v8 BOOLValue])
  {
    v9 = [v6 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BAFDC;
    block[3] = &unk_1001655F8;
    block[4] = self;
    dispatch_async(v9, block);
  }
  else
  {
    v9 = [v7 serviceFromClass:objc_opt_class()];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000BAD94;
    v11[3] = &unk_1001692A8;
    id v12 = v6;
    v13 = self;
    [v9 grabRegistryWithWriteBlockAsync:v11];
  }
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"transactionCompleted"];
  if ([v8 BOOLValue])
  {
    v9 = [v7 serviceFromClass:objc_opt_class()];
    v10 = [v6 objectForKeyedSubscript:@"rollbackDiff"];
    if (!v10)
    {
      v10 = [v6 objectForKeyedSubscript:@"calculatedRollbackDiff"];
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000BB1E8;
    v13[3] = &unk_1001662B0;
    id v14 = v6;
    id v15 = v10;
    v16 = self;
    id v11 = v10;
    [v9 grabRegistryWithWriteBlockAsync:v13];
  }
  else
  {
    v9 = [v6 queue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000BB35C;
    v12[3] = &unk_1001655F8;
    v12[4] = self;
    dispatch_async(v9, v12);
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