@interface PLXPCTransaction
+ (id)openXPCTransactionStatus;
+ (id)transaction:(const char *)a3;
+ (void)_startTrackingTransaction:(id)a3;
+ (void)_stopTrackingTransaction:(id)a3;
+ (void)initialize;
- (PLXPCTransaction)initWithIdentifier:(const char *)a3;
- (id)description;
- (void)dealloc;
@end

@implementation PLXPCTransaction

+ (id)transaction:(const char *)a3
{
  v3 = [[PLXPCTransaction alloc] initWithIdentifier:a3];
  return v3;
}

- (PLXPCTransaction)initWithIdentifier:(const char *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)PLXPCTransaction;
  v4 = [(PLXPCTransaction *)&v23 init];
  if (v4)
  {
    if (a3)
    {
      if (*a3) {
        goto LABEL_4;
      }
      v11 = [NSString stringWithFormat:@"PLXPCTransaction: identifier passed as empty string argument."];
      v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        goto LABEL_21;
      }
    }
    else
    {
      v11 = [NSString stringWithFormat:@"PLXPCTransaction: NULL identifier passed as argument."];
      v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
LABEL_21:
        v21 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 138543618;
        v25 = v11;
        __int16 v26 = 2112;
        v27 = v21;
        _os_log_impl(&dword_19BCFB000, v12, OS_LOG_TYPE_FAULT, "%{public}@, backtrace:\n%@", buf, 0x16u);
      }
    }

LABEL_4:
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"photos.PLXPCTransaction: %p %s", v4, a3);
    if (!v5)
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"PLXPCTransaction: created nil transaction description (identifier: %s).", a3);
      v14 = PLBackendGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v15 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 138543618;
        v25 = v13;
        __int16 v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_19BCFB000, v14, OS_LOG_TYPE_FAULT, "%{public}@, backtrace:\n%@", buf, 0x16u);
      }
    }
    id v6 = v5;
    [v6 UTF8String];
    uint64_t v7 = os_transaction_create();
    transaction = v4->_transaction;
    v4->_transaction = (OS_os_transaction *)v7;

    if (!v4->_transaction)
    {
      v16 = [NSString stringWithFormat:@"PLXPCTransaction: created NULL os_transaction (identifier: %s, transactionDescription: %@).", a3, v6];
      v17 = PLBackendGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        v18 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 138543618;
        v25 = v16;
        __int16 v26 = 2112;
        v27 = v18;
        _os_log_impl(&dword_19BCFB000, v17, OS_LOG_TYPE_FAULT, "%{public}@, backtrace:\n%@", buf, 0x16u);
      }
    }
    description = (unsigned char *)os_transaction_get_description();
    if (description)
    {
      if (*description)
      {
LABEL_8:
        v4->_identifier = a3;
        +[PLXPCTransaction _startTrackingTransaction:v4];

        return v4;
      }
      v19 = [NSString stringWithFormat:@"PLXPCTransaction: os_transaction has an empty description (identifier: %s, transactionDescription: %@).", a3, v6];
      v20 = PLBackendGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        goto LABEL_24;
      }
    }
    else
    {
      v19 = [NSString stringWithFormat:@"PLXPCTransaction: os_transaction has a NULL description (identifier: %s, transactionDescription: %@).", a3, v6];
      v20 = PLBackendGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
LABEL_24:
        v22 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 138543618;
        v25 = v19;
        __int16 v26 = 2112;
        v27 = v22;
        _os_log_impl(&dword_19BCFB000, v20, OS_LOG_TYPE_FAULT, "%{public}@, backtrace:\n%@", buf, 0x16u);
      }
    }

    goto LABEL_8;
  }
  return v4;
}

+ (void)_startTrackingTransaction:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PLXPCUtilities.m", 985, @"Invalid parameter not satisfying: %@", @"transaction" object file lineNumber description];
  }
  id v6 = _allTransactionsLock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__PLXPCTransaction__startTrackingTransaction___block_invoke;
  v9[3] = &unk_1E58A1EC0;
  id v10 = v5;
  id v7 = v5;
  pl_dispatch_sync(v6, v9);
}

uint64_t __46__PLXPCTransaction__startTrackingTransaction___block_invoke(uint64_t a1)
{
  return [(id)_allTransactions addObject:*(void *)(a1 + 32)];
}

uint64_t __45__PLXPCTransaction__stopTrackingTransaction___block_invoke(uint64_t a1)
{
  [(id)_allTransactions removeObject:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  uint64_t result = [(id)_allTransactions count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  +[PLXPCTransaction _stopTrackingTransaction:self];
  v3.receiver = self;
  v3.super_class = (Class)PLXPCTransaction;
  [(PLXPCTransaction *)&v3 dealloc];
}

+ (void)_stopTrackingTransaction:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"PLXPCUtilities.m", 993, @"Invalid parameter not satisfying: %@", @"transaction" object file lineNumber description];
  }
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2050000000;
  v9[3] = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__PLXPCTransaction__stopTrackingTransaction___block_invoke;
  v8[3] = &unk_1E589F4B0;
  v8[4] = v9;
  v8[5] = &v10;
  pl_dispatch_sync(_allTransactionsLock, v8);
  if (!v11[3])
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"kPLXPCTransactionIdleNotification" object:0];
  }
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v10, 8);
}

+ (void)initialize
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:256 capacity:0];
  objc_super v3 = (void *)_allTransactions;
  _allTransactions = v2;

  _allTransactionsLock = (uint64_t)dispatch_queue_create("com.apple.assetsd.trasactionTracking", 0);
  MEMORY[0x1F41817F8]();
}

- (id)description
{
  objc_super v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PLXPCTransaction;
  v4 = [(PLXPCTransaction *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@: os_transaction: %p, identifier: %s", v4, self->_transaction, self->_identifier];

  return v5;
}

+ (id)openXPCTransactionStatus
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  __int16 v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__PLXPCTransaction_openXPCTransactionStatus__block_invoke;
  v4[3] = &unk_1E58A2238;
  v4[4] = &v5;
  pl_dispatch_sync(_allTransactionsLock, v4);
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"Open XPC transactions: %d", *((__int16 *)v6 + 12));
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__PLXPCTransaction_openXPCTransactionStatus__block_invoke(uint64_t a1)
{
  uint64_t result = [(id)_allTransactions count];
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end