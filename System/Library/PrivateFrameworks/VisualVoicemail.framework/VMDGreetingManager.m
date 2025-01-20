@interface VMDGreetingManager
- (BOOL)isGreetingChangeSupportedForAccountUUID:(id)a3;
- (NSOperationQueue)dataSourceDelegateQueue;
- (VMDGreetingManager)initWithDataSource:(id)a3;
- (VMGreetingDataSource)dataSource;
- (double)maximumGreetingDurationForAccountUUID:(id)a3;
- (void)greetingChangedByCarrier:(id)a3;
- (void)greetingDataSource:(id)a3 greetingDidChangeForAccountUUID:(id)a4;
- (void)greetingDataSource:(id)a3 greetingWillChangeForAccountUUID:(id)a4;
- (void)greetingForAccountUUID:(id)a3 completion:(id)a4;
- (void)setGreeting:(id)a3 forAccountUUID:(id)a4 completion:(id)a5;
@end

@implementation VMDGreetingManager

- (VMDGreetingManager)initWithDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VMDGreetingManager;
  v6 = [(VMManager *)&v11 init];
  if (v6)
  {
    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    dataSourceDelegateQueue = v6->_dataSourceDelegateQueue;
    v6->_dataSourceDelegateQueue = v7;

    v9 = [(VMManager *)v6 queue];
    [(NSOperationQueue *)v6->_dataSourceDelegateQueue setUnderlyingQueue:v9];

    objc_storeStrong((id *)&v6->_dataSource, a3);
    [(VMGreetingDataSource *)v6->_dataSource setDelegate:v6];
    [(VMGreetingDataSource *)v6->_dataSource setDelegateQueue:v6->_dataSourceDelegateQueue];
  }

  return v6;
}

- (BOOL)isGreetingChangeSupportedForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(VMDGreetingManager *)self dataSource];
  unsigned __int8 v6 = [v5 isGreetingChangeSupportedForAccountUUID:v4];

  return v6;
}

- (double)maximumGreetingDurationForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(VMDGreetingManager *)self dataSource];
  [v5 maximumGreetingDurationForAccountUUID:v4];
  double v7 = v6;

  return v7;
}

- (void)greetingForAccountUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VMDGreetingManager *)self dataSource];
  [v8 greetingForAccountUUID:v7 completion:v6];
}

- (void)setGreeting:(id)a3 forAccountUUID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(VMDGreetingManager *)self dataSource];
  [v11 setGreeting:v10 forAccountUUID:v9 completion:v8];
}

- (void)greetingDataSource:(id)a3 greetingWillChangeForAccountUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VMManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(VMDGreetingManager *)self dataSource];

  if (v9 == v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100017D34;
    v10[3] = &unk_1000C11B8;
    v10[4] = self;
    id v11 = v6;
    [(VMManager *)self performAtomicDelegateBlock:v10];
  }
}

- (void)greetingDataSource:(id)a3 greetingDidChangeForAccountUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VMManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(VMDGreetingManager *)self dataSource];

  if (v9 == v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100017FDC;
    v10[3] = &unk_1000C11B8;
    v10[4] = self;
    id v11 = v6;
    [(VMManager *)self performAtomicDelegateBlock:v10];
  }
}

- (void)greetingChangedByCarrier:(id)a3
{
  id v4 = a3;
  id v5 = [(VMManager *)self queue];
  dispatch_assert_queue_V2(v5);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018258;
  v7[3] = &unk_1000C11B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(VMManager *)self performAtomicDelegateBlock:v7];
}

- (VMGreetingDataSource)dataSource
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