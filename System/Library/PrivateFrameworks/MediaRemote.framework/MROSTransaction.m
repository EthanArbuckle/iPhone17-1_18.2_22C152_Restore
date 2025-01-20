@interface MROSTransaction
- (MROSTransaction)initWithName:(id)a3;
- (NSString)transactionName;
- (id)description;
- (void)invalidateTransaction;
@end

@implementation MROSTransaction

- (MROSTransaction)initWithName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MROSTransaction;
  v5 = [(MROSTransaction *)&v10 init];
  if (v5)
  {
    id v6 = v4;
    [v6 UTF8String];
    uint64_t v7 = os_transaction_create();
    containedTransaction = v5->_containedTransaction;
    v5->_containedTransaction = (OS_os_transaction *)v7;

    objc_storeStrong((id *)&v5->_transactionName, v6);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionName, 0);

  objc_storeStrong((id *)&self->_containedTransaction, 0);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %p %@>", objc_opt_class(), self, self->_containedTransaction, self->_transactionName];
}

- (void)invalidateTransaction
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = _MRLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[OS_Transaction] invalidating: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [(NSString *)self->_transactionName stringByAppendingString:@" (invalidated)"];
  transactionName = self->_transactionName;
  self->_transactionName = v4;

  containedTransaction = self->_containedTransaction;
  self->_containedTransaction = 0;
}

- (NSString)transactionName
{
  return self->_transactionName;
}

@end