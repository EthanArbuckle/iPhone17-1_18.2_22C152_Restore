@interface VMDAccountManager
- (BOOL)isAccountOnline:(id)a3;
- (BOOL)isAccountSubscribed:(id)a3;
- (BOOL)isCallVoicemailSupportedForAccountUUID:(id)a3;
- (BOOL)isPasscodeChangeSupportedForAccountUUID:(id)a3;
- (NSArray)accounts;
- (NSOperationQueue)dataSourceDelegateQueue;
- (VMAccountDataSource)dataSource;
- (VMDAccountManager)initWithDataSource:(id)a3;
- (int64_t)maximumPasscodeLengthForAccountUUID:(id)a3;
- (int64_t)minimumPasscodeLengthForAccountUUID:(id)a3;
- (void)accountsDidChangeForAccountDataSource:(id)a3;
- (void)setPasscode:(id)a3 forAccountUUID:(id)a4 completion:(id)a5;
@end

@implementation VMDAccountManager

- (VMDAccountManager)initWithDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VMDAccountManager;
  v6 = [(VMManager *)&v11 init];
  if (v6)
  {
    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    dataSourceDelegateQueue = v6->_dataSourceDelegateQueue;
    v6->_dataSourceDelegateQueue = v7;

    v9 = [(VMManager *)v6 queue];
    [(NSOperationQueue *)v6->_dataSourceDelegateQueue setUnderlyingQueue:v9];

    objc_storeStrong((id *)&v6->_dataSource, a3);
    [(VMAccountDataSource *)v6->_dataSource setDelegateQueue:v6->_dataSourceDelegateQueue];
    [(VMAccountDataSource *)v6->_dataSource setDelegate:v6];
  }

  return v6;
}

- (NSArray)accounts
{
  v2 = [(VMDAccountManager *)self dataSource];
  v3 = [v2 accounts];

  return (NSArray *)v3;
}

- (BOOL)isAccountSubscribed:(id)a3
{
  id v4 = a3;
  id v5 = [(VMDAccountManager *)self dataSource];
  unsigned __int8 v6 = [v5 isAccountSubscribed:v4];

  return v6;
}

- (BOOL)isAccountOnline:(id)a3
{
  id v4 = a3;
  id v5 = [(VMDAccountManager *)self dataSource];
  unsigned __int8 v6 = [v5 isAccountOnline:v4];

  return v6;
}

- (BOOL)isCallVoicemailSupportedForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(VMDAccountManager *)self dataSource];
  unsigned __int8 v6 = [v5 isCallVoicemailSupportedForAccountUUID:v4];

  return v6;
}

- (BOOL)isPasscodeChangeSupportedForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(VMDAccountManager *)self dataSource];
  unsigned __int8 v6 = [v5 isPasscodeChangeSupportedForAccountUUID:v4];

  return v6;
}

- (int64_t)minimumPasscodeLengthForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(VMDAccountManager *)self dataSource];
  id v6 = [v5 minimumPasscodeLengthForAccountUUID:v4];

  return (int64_t)v6;
}

- (int64_t)maximumPasscodeLengthForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(VMDAccountManager *)self dataSource];
  id v6 = [v5 maximumPasscodeLengthForAccountUUID:v4];

  return (int64_t)v6;
}

- (void)setPasscode:(id)a3 forAccountUUID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(VMDAccountManager *)self dataSource];
  [v11 setPasscode:v10 forAccountUUID:v9 completion:v8];
}

- (void)accountsDidChangeForAccountDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [(VMManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(VMDAccountManager *)self dataSource];

  if (v6 == v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100052A04;
    v7[3] = &unk_1000C12C0;
    v7[4] = self;
    [(VMManager *)self performAtomicDelegateBlock:v7];
  }
}

- (VMAccountDataSource)dataSource
{
  return self->_dataSource;
}

- (NSOperationQueue)dataSourceDelegateQueue
{
  return self->_dataSourceDelegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceDelegateQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end