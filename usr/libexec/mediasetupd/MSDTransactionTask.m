@interface MSDTransactionTask
+ (id)createTransactionWithIdentifier:(id)a3;
- (MSDTransactionTask)initWithIdentifier:(id)a3;
- (NSString)transactionID;
- (id)description;
- (void)dealloc;
- (void)releaseTransaction;
- (void)setTransactionID:(id)a3;
@end

@implementation MSDTransactionTask

- (MSDTransactionTask)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSDTransactionTask;
  v6 = [(MSDTransactionTask *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transactionID, a3);
    [v5 UTF8String];
    uint64_t v8 = os_transaction_create();
    transaction = v7->_transaction;
    v7->_transaction = (OS_os_transaction *)v8;
  }
  return v7;
}

+ (id)createTransactionWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [objc_alloc((Class)a1) initWithIdentifier:v4];
  }
  else
  {
    v6 = sub_100031A80();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100023674(v6);
    }

    id v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  transaction = self->_transaction;
  self->_transaction = 0;

  v5.receiver = self;
  v5.super_class = (Class)MSDTransactionTask;
  [(MSDTransactionTask *)&v5 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<MSDTransactionTask: TaskID: %@ Transaction: %@>", self->_transactionID, self->_transaction];
}

- (void)releaseTransaction
{
  transaction = self->_transaction;
  self->_transaction = 0;
}

- (NSString)transactionID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTransactionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionID, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end