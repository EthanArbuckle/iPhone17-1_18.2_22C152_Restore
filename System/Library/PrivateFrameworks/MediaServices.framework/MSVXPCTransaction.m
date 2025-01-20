@interface MSVXPCTransaction
+ (id)activeTransactions;
- (BOOL)isActive;
- (MSVXPCTransaction)initWithName:(id)a3;
- (NSString)name;
- (id)description;
- (void)beginTransaction;
- (void)endTransaction;
- (void)endTransactionOnDate:(id)a3;
@end

@implementation MSVXPCTransaction

- (void)endTransaction
{
  int64_t transactionCount = self->_transactionCount;
  self->_int64_t transactionCount = transactionCount - 1;
  if (transactionCount <= 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MSVXPCTransaction.m" lineNumber:113 description:@"Unbalanced calls to -[MSVXPCTransaction endTransaction]"];

    if (self->_transactionCount) {
      return;
    }
  }
  else if (transactionCount != 1)
  {
    return;
  }
  if (self->_transaction)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MSVXPCTransactionLock);
    transaction = self->_transaction;
    self->_transaction = 0;

    v7 = _MSVXPCTransactionsGet();
    [v7 removeObject:self];

    os_unfair_lock_unlock((os_unfair_lock_t)&_MSVXPCTransactionLock);
  }
}

- (void)beginTransaction
{
  int64_t transactionCount = self->_transactionCount;
  self->_int64_t transactionCount = transactionCount + 1;
  if ((transactionCount & 0x8000000000000000) == 0 && !self->_transaction)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MSVXPCTransactionLock);
    v4 = NSString;
    name = self->_name;
    v6 = [(NSUUID *)self->_identifier UUIDString];
    id v7 = [v4 stringWithFormat:@"%@:%@", name, v6];
    [v7 UTF8String];
    v8 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v8;

    v10 = _MSVXPCTransactionsGet();
    [v10 addObject:self];

    os_unfair_lock_unlock((os_unfair_lock_t)&_MSVXPCTransactionLock);
  }
}

- (MSVXPCTransaction)initWithName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSVXPCTransaction;
  v5 = [(MSVXPCTransaction *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = @"<UNNAMED TRANSACTION>";
    }
    objc_storeStrong((id *)&v5->_name, v8);

    v9 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    identifier = v5->_identifier;
    v5->_identifier = v9;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)endTransactionOnDate:(id)a3
{
  [a3 timeIntervalSinceNow];
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MSVXPCTransaction_endTransactionOnDate___block_invoke;
  block[3] = &unk_1E5ADA860;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E4F14428], block);
}

uint64_t __42__MSVXPCTransaction_endTransactionOnDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endTransaction];
}

- (BOOL)isActive
{
  LOBYTE(self) = self->_transaction != 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MSVXPCTransactionLock);
  return (char)self;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  name = self->_name;
  uint64_t v6 = [(NSUUID *)self->_identifier UUIDString];
  id v7 = (void *)v6;
  if (self->_transaction) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = [v3 stringWithFormat:@"<%@:%p, name=\"%@:%@\" isActive=%@>", v4, self, name, v6, v8];

  return v9;
}

+ (id)activeTransactions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&_MSVXPCTransactionLock);
  v2 = _MSVXPCTransactionsGet();
  v3 = [v2 allObjects];

  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(void *)(*(void *)(*((void *)&v11 + 1) + 8 * i) + 16)) {
          [v4 addObject:(void)v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_MSVXPCTransactionLock);
  return v4;
}

@end