@interface EPSagaTransactionDeleteICloudPaymentCards
- (EPTransactionDelegate)delegate;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionDeleteICloudPaymentCards

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v8 = (void *)qword_1001A1070;
  uint64_t v21 = qword_1001A1070;
  if (!qword_1001A1070)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100012204;
    v17[3] = &unk_1001657F0;
    v17[4] = &v18;
    sub_100012204((uint64_t)v17);
    v8 = (void *)v19[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v18, 8);
  v10 = (NPKCompanionAgentConnection *)objc_opt_new();
  connection = self->_connection;
  self->_connection = v10;

  v12 = self->_connection;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100012098;
  v14[3] = &unk_100165530;
  id v15 = v7;
  v16 = self;
  id v13 = v7;
  [(NPKCompanionAgentConnection *)v12 handlePendingUnpairingWithCompletion:v14];
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

  objc_storeStrong((id *)&self->_connection, 0);
}

@end