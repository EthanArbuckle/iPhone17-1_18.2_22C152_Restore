@interface NSPPrivacyProxyNetworkRegistration
- (void)reportErrorForAgent:(id)a3 error:(int)a4 withOptions:(id)a5;
- (void)tokenLowWaterMarkReachedForAgent:(id)a3;
@end

@implementation NSPPrivacyProxyNetworkRegistration

- (void)tokenLowWaterMarkReachedForAgent:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_100005D6C;
  v11[4] = sub_100049134;
  id v12 = (id)os_transaction_create();
  v5 = NPGetInternalQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049468;
  block[3] = &unk_100105358;
  id v8 = v4;
  v9 = self;
  v10 = v11;
  id v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v11, 8);
}

- (void)reportErrorForAgent:(id)a3 error:(int)a4 withOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_100005D6C;
  v19[4] = sub_100049134;
  id v20 = (id)os_transaction_create();
  v10 = NPGetInternalQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000496F8;
  block[3] = &unk_100105380;
  int v18 = a4;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  v17 = v19;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  _Block_object_dispose(v19, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationHash, 0);
  objc_storeStrong((id *)&self->_configurationData, 0);
  objc_storeStrong((id *)&self->_proxyConfigAgentRegistration, 0);
  objc_storeStrong((id *)&self->_proxyConfigAgent, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end