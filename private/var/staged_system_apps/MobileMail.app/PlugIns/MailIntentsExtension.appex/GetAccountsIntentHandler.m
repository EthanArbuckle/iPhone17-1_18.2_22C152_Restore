@interface GetAccountsIntentHandler
+ (EFScheduler)scheduler;
+ (OS_os_log)log;
- (EMDaemonInterface)daemonInterface;
- (void)handleMFGetAccounts:(id)a3 completion:(id)a4;
- (void)provideAccountsOptionsCollectionForMFGetAccounts:(id)a3 withCompletion:(id)a4;
- (void)setDaemonInterface:(id)a3;
@end

@implementation GetAccountsIntentHandler

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000194C;
  block[3] = &unk_10000C3A0;
  block[4] = a1;
  if (qword_100012308 != -1) {
    dispatch_once(&qword_100012308, block);
  }
  v2 = (void *)qword_100012300;

  return (OS_os_log *)v2;
}

- (void)provideAccountsOptionsCollectionForMFGetAccounts:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  v6 = +[GetAccountsIntentHandler scheduler];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100001AB0;
  v8[3] = &unk_10000C408;
  v8[4] = self;
  id v7 = v5;
  id v9 = v7;
  [v6 performBlock:v8];
}

- (void)handleMFGetAccounts:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, MFGetAccountsIntentResponse *))a4;
  v6 = [[MFGetAccountsIntentResponse alloc] initWithCode:4 userActivity:0];
  id v7 = [v8 accounts];
  [(MFGetAccountsIntentResponse *)v6 setAccounts:v7];

  v5[2](v5, v6);
}

+ (EFScheduler)scheduler
{
  if (qword_100012318 != -1) {
    dispatch_once(&qword_100012318, &stru_10000C448);
  }
  v2 = (void *)qword_100012310;

  return (EFScheduler *)v2;
}

- (EMDaemonInterface)daemonInterface
{
  daemonInterface = self->_daemonInterface;
  if (!daemonInterface)
  {
    v4 = (EMDaemonInterface *)objc_alloc_init((Class)EMDaemonInterface);
    id v5 = self->_daemonInterface;
    self->_daemonInterface = v4;

    daemonInterface = self->_daemonInterface;
  }

  return daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end