@interface WDTransaction
+ (id)log;
- (NSString)identifier;
- (NSString)transactionDescription;
- (OS_os_transaction)transaction;
- (WDTransaction)initWithDescription:(id)a3;
- (void)dealloc;
@end

@implementation WDTransaction

- (WDTransaction)initWithDescription:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WDTransaction;
  v5 = [(WDTransaction *)&v16 init];
  if (v5)
  {
    id v6 = v4;
    [v6 UTF8String];
    uint64_t v7 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v7;

    v9 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v10 = [v9 UUIDString];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_storeStrong((id *)&v5->_transactionDescription, v6);
    v12 = +[WDTransaction log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v5->_identifier;
      transactionDescription = v5->_transactionDescription;
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      __int16 v19 = 2114;
      v20 = transactionDescription;
      _os_log_impl(&dword_1A9410000, v12, OS_LOG_TYPE_DEFAULT, "Acquired transaction: %{public}@ for: %{public}@", buf, 0x16u);
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = +[WDTransaction log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    transactionDescription = self->_transactionDescription;
    *(_DWORD *)buf = 138543618;
    v8 = identifier;
    __int16 v9 = 2114;
    uint64_t v10 = transactionDescription;
    _os_log_impl(&dword_1A9410000, v3, OS_LOG_TYPE_DEFAULT, "Releasing transaction: %{public}@ for: %{public}@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)WDTransaction;
  [(WDTransaction *)&v6 dealloc];
}

+ (id)log
{
  if (log_onceToken[0] != -1) {
    dispatch_once(log_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)log_log;
  return v2;
}

uint64_t __20__WDTransaction_log__block_invoke()
{
  log_log = (uint64_t)os_log_create("com.apple.weather", "transactions");
  return MEMORY[0x1F41817F8]();
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)transactionDescription
{
  return self->_transactionDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionDescription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end