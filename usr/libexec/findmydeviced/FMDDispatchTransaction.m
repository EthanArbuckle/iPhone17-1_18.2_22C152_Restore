@interface FMDDispatchTransaction
+ (id)transactionName:(id)a3;
+ (void)dispatchTransactionAsync:(id)a3 transactionName:(id)a4 block:(id)a5;
+ (void)dispatchTransactionSync:(id)a3 transactionName:(id)a4 block:(id)a5;
@end

@implementation FMDDispatchTransaction

+ (void)dispatchTransactionAsync:(id)a3 transactionName:(id)a4 block:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = a3;
  v10 = [(id)objc_opt_class() transactionName:v8];

  v11 = +[FMXPCTransactionManager sharedInstance];
  [v11 beginTransaction:v10];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000CB1F4;
  v14[3] = &unk_1002D97B0;
  id v15 = v10;
  id v16 = v7;
  id v12 = v10;
  id v13 = v7;
  dispatch_async(v9, v14);
}

+ (void)dispatchTransactionSync:(id)a3 transactionName:(id)a4 block:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = a3;
  v10 = [(id)objc_opt_class() transactionName:v8];

  v11 = +[FMXPCTransactionManager sharedInstance];
  [v11 beginTransaction:v10];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000CB374;
  v14[3] = &unk_1002D97B0;
  id v15 = v10;
  id v16 = v7;
  id v12 = v10;
  id v13 = v7;
  dispatch_sync(v9, v14);
}

+ (id)transactionName:(id)a3
{
  id v3 = a3;

  return v3;
}

@end