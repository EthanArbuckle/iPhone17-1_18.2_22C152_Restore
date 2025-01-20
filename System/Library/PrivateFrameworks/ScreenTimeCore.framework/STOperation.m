@interface STOperation
- (BOOL)isAsynchronous;
- (OS_os_activity)activity;
- (OS_os_transaction)transaction;
- (STOperation)init;
- (void)setActivity:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation STOperation

- (STOperation)init
{
  v7.receiver = self;
  v7.super_class = (Class)STOperation;
  v2 = [(STOperation *)&v7 init];
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"com.apple.ScreenTimeAgent.%@", objc_opt_class()];
    [v3 UTF8String];
    uint64_t v4 = os_transaction_create();
    transaction = v2->_transaction;
    v2->_transaction = (OS_os_transaction *)v4;
  }
  return v2;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end