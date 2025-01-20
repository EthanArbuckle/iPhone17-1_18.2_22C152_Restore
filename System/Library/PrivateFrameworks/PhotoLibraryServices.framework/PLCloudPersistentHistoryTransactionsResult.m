@interface PLCloudPersistentHistoryTransactionsResult
+ (id)_coalescingLimitTest;
+ (id)_isTransactionSyncableFilter;
+ (id)fetchTransactionsSinceToken:(id)a3 inContext:(id)a4;
+ (int64_t)_changeCoalescingLimit;
+ (int64_t)_transactionCoalescingLimit;
- (BOOL)_sendLocalEvent:(id)a3 toEnumerationBlock:(id)a4;
- (BOOL)hasMoreEvents;
- (NSPersistentHistoryToken)lastProcessedCoreDataToken;
- (NSString)currentTokenDescription;
- (PLCloudPersistentHistoryTransactionsResult)initWithResultType:(int64_t)a3 transactionIterator:(id)a4;
- (PLCloudPersistentHistoryTransactionsResult)initWithSuccesfulTransactionIterator:(id)a3;
- (PLCloudPersistentHistoryTransactionsResult)initWithUnsuccessfulResultType:(int64_t)a3;
- (id)_nextLocalEventUpToNonCoalescableTransaction;
- (int64_t)resultType;
- (void)_updateLastProcessedCoreDataToken;
- (void)enumerateLocalEventsWithBlock:(id)a3;
@end

@implementation PLCloudPersistentHistoryTransactionsResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedCoreDataToken, 0);
  objc_storeStrong((id *)&self->_currentTokenDescription, 0);
  objc_storeStrong(&self->_isTransactionSyncableFilter, 0);
  objc_storeStrong((id *)&self->_transactionIterator, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
}

- (NSPersistentHistoryToken)lastProcessedCoreDataToken
{
  return (NSPersistentHistoryToken *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)currentTokenDescription
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (void)_updateLastProcessedCoreDataToken
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(PLPersistentHistoryTransactionIterator *)self->_transactionIterator lastIteratedToken];
  if (v3)
  {
    p_lastProcessedCoreDataToken = &self->_lastProcessedCoreDataToken;
    objc_storeStrong((id *)&self->_lastProcessedCoreDataToken, v3);
    if (!*MEMORY[0x1E4F59AC0])
    {
      v5 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = *p_lastProcessedCoreDataToken;
        int v7 = 138412290;
        v8 = v6;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Setting _lastProcessedCoreDataToken to: %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (id)_nextLocalEventUpToNonCoalescableTransaction
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __90__PLCloudPersistentHistoryTransactionsResult__nextLocalEventUpToNonCoalescableTransaction__block_invoke;
  v4[3] = &unk_1E586D758;
  v4[4] = self;
  v2 = +[PLLocalChangeEventBuilder localEventWithBuilderBlock:v4];
  return v2;
}

void __90__PLCloudPersistentHistoryTransactionsResult__nextLocalEventUpToNonCoalescableTransaction__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [(id)objc_opt_class() _isTransactionSyncableFilter];
  [v3 setTransactionFilter:v4];

  id v5 = [(id)objc_opt_class() _coalescingLimitTest];
  [v3 recordTransactionsFromIterator:*(void *)(*(void *)(a1 + 32) + 16) untilTest:v5];
}

- (BOOL)_sendLocalEvent:(id)a3 toEnumerationBlock:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, id, unsigned char *))a4;
  if ([v5 count])
  {
    char v12 = 0;
    if (!*MEMORY[0x1E4F59AC0])
    {
      int v7 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = objc_msgSend(v5, "_pl_prettyDescription");
        *(_DWORD *)buf = 138412290;
        v14 = v8;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Enumerating local event: %@", buf, 0xCu);
      }
    }
    v6[2](v6, v5, &v12);
    BOOL v9 = v12 != 0;
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      v10 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Not enumerating empty local event", buf, 2u);
      }
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)hasMoreEvents
{
  return [(PLPersistentHistoryTransactionIterator *)self->_transactionIterator hasMoreTransactions];
}

- (void)enumerateLocalEventsWithBlock:(id)a3
{
  id v9 = a3;
  if (self->_resultType)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PLCloudPersistentHistoryTransactionsResult.m" lineNumber:87 description:@"Can only enumerate succesful results"];
  }
  id v5 = [(PLCloudPersistentHistoryTransactionsResult *)self _nextLocalEventUpToNonCoalescableTransaction];
  if ([v5 count])
  {
    while (1)
    {
      v6 = (void *)MEMORY[0x19F38D3B0]();
      if ([(PLCloudPersistentHistoryTransactionsResult *)self _sendLocalEvent:v5 toEnumerationBlock:v9])
      {
        break;
      }
      int v7 = [(PLCloudPersistentHistoryTransactionsResult *)self _nextLocalEventUpToNonCoalescableTransaction];

      id v5 = v7;
      if (![v7 count]) {
        goto LABEL_9;
      }
    }
  }
  int v7 = v5;
LABEL_9:
  [(PLCloudPersistentHistoryTransactionsResult *)self _updateLastProcessedCoreDataToken];
}

- (PLCloudPersistentHistoryTransactionsResult)initWithResultType:(int64_t)a3 transactionIterator:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLCloudPersistentHistoryTransactionsResult;
  v8 = [(PLCloudPersistentHistoryTransactionsResult *)&v13 init];
  id v9 = v8;
  if (v8)
  {
    v8->_resultType = a3;
    objc_storeStrong((id *)&v8->_transactionIterator, a4);
    lastProcessedCoreDataToken = v9->_lastProcessedCoreDataToken;
    v9->_lastProcessedCoreDataToken = 0;

    v11 = v9;
  }

  return v9;
}

- (PLCloudPersistentHistoryTransactionsResult)initWithUnsuccessfulResultType:(int64_t)a3
{
  if (!a3)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLCloudPersistentHistoryTransactionsResult.m", 69, @"Invalid parameter not satisfying: %@", @"resultType != PLCloudChangeEventsResultSuccess" object file lineNumber description];
  }
  return [(PLCloudPersistentHistoryTransactionsResult *)self initWithResultType:a3 transactionIterator:0];
}

- (PLCloudPersistentHistoryTransactionsResult)initWithSuccesfulTransactionIterator:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PLCloudPersistentHistoryTransactionsResult.m", 63, @"Invalid parameter not satisfying: %@", @"iterator != nil" object file lineNumber description];
  }
  v6 = [(PLCloudPersistentHistoryTransactionsResult *)self initWithResultType:0 transactionIterator:v5];

  return v6;
}

+ (id)_isTransactionSyncableFilter
{
  v2 = objc_alloc_init(PLPersistentHistoryTransactionModifiers);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PLCloudPersistentHistoryTransactionsResult__isTransactionSyncableFilter__block_invoke;
  v7[3] = &unk_1E5869628;
  v8 = v2;
  id v3 = v2;
  v4 = (void *)MEMORY[0x19F38D650](v7);
  id v5 = (void *)MEMORY[0x19F38D650]();

  return v5;
}

uint64_t __74__PLCloudPersistentHistoryTransactionsResult__isTransactionSyncableFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  v4 = [a2 author];
  [v3 updateFromTransactionAuthor:v4];

  id v5 = *(void **)(a1 + 32);
  return [v5 isSyncable];
}

+ (int64_t)_changeCoalescingLimit
{
  if (_changeCoalescingLimit_sOnceToken != -1) {
    dispatch_once(&_changeCoalescingLimit_sOnceToken, &__block_literal_global_25_38135);
  }
  return _changeCoalescingLimit_sChangeCoalescingLimit;
}

void __68__PLCloudPersistentHistoryTransactionsResult__changeCoalescingLimit__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = [v0 objectForKey:@"PLCloudPersistentHistoryChangeCoalescingLimit"];

  if (v1)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      v2 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        int v3 = 134218240;
        uint64_t v4 = _changeCoalescingLimit_sChangeCoalescingLimit;
        __int16 v5 = 2048;
        uint64_t v6 = [v1 integerValue];
        _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "Overriding CPL change coalescing limit of %zd to %zd)", (uint8_t *)&v3, 0x16u);
      }
    }
    _changeCoalescingLimit_sChangeCoalescingLimit = [v1 integerValue];
  }
}

+ (int64_t)_transactionCoalescingLimit
{
  if (_transactionCoalescingLimit_sOnceToken != -1) {
    dispatch_once(&_transactionCoalescingLimit_sOnceToken, &__block_literal_global_38142);
  }
  return _transactionCoalescingLimit_sTransactionCoalescingLimit;
}

void __73__PLCloudPersistentHistoryTransactionsResult__transactionCoalescingLimit__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = [v0 objectForKey:@"PLCloudPersistentHistoryTransactionCoalescingLimit"];

  if (v1)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      v2 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        int v3 = 134218240;
        uint64_t v4 = _transactionCoalescingLimit_sTransactionCoalescingLimit;
        __int16 v5 = 2048;
        uint64_t v6 = [v1 integerValue];
        _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "Overriding CPL transaction coalescing limit of %zd to %zd", (uint8_t *)&v3, 0x16u);
      }
    }
    _transactionCoalescingLimit_sTransactionCoalescingLimit = [v1 integerValue];
  }
}

+ (id)_coalescingLimitTest
{
  v2 = objc_alloc_init(PLPersistentHistoryTransactionModifiers);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PLCloudPersistentHistoryTransactionsResult__coalescingLimitTest__block_invoke;
  v7[3] = &unk_1E5869600;
  id v9 = v12;
  v10 = v11;
  v8 = v2;
  int v3 = v2;
  uint64_t v4 = (void *)MEMORY[0x19F38D650](v7);
  __int16 v5 = (void *)MEMORY[0x19F38D650]();

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v12, 8);
  return v5;
}

uint64_t __66__PLCloudPersistentHistoryTransactionsResult__coalescingLimitTest__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    __int16 v5 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      v8 = [v3 changes];
      int v22 = 134218496;
      uint64_t v23 = v6;
      __int16 v24 = 2048;
      uint64_t v25 = v7;
      __int16 v26 = 2048;
      uint64_t v27 = [v8 count];
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Checking coalescing limit: transaction count = %zd + 1, change count = %zd + %zd", (uint8_t *)&v22, 0x20u);
    }
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v9 = [v3 changes];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v9 count];

  int64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v10 >= +[PLCloudPersistentHistoryTransactionsResult _transactionCoalescingLimit](PLCloudPersistentHistoryTransactionsResult, "_transactionCoalescingLimit")|| (int64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v11 >= +[PLCloudPersistentHistoryTransactionsResult _changeCoalescingLimit]))
  {
    if (!*v4)
    {
      v14 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        int v22 = 134218240;
        uint64_t v23 = v18;
        __int16 v24 = 2048;
        uint64_t v25 = v19;
        uint64_t v15 = "Stopping history iteration due to coalescing limit: transaction count = %zd, change count = %zd";
        v16 = v14;
        uint32_t v17 = 22;
        goto LABEL_14;
      }
LABEL_15:
    }
  }
  else
  {
    char v12 = *(void **)(a1 + 32);
    objc_super v13 = [v3 author];
    [v12 updateFromTransactionAuthor:v13];

    if (![*(id *)(a1 + 32) nonCoalescing])
    {
      uint64_t v20 = 0;
      goto LABEL_17;
    }
    if (!*v4)
    {
      v14 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        uint64_t v15 = "Stopping history iteration due non coalescing transaction modifier";
        v16 = v14;
        uint32_t v17 = 2;
LABEL_14:
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v22, v17);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }
  uint64_t v20 = 1;
LABEL_17:

  return v20;
}

+ (id)fetchTransactionsSinceToken:(id)a3 inContext:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v17 = 0;
  uint64_t v7 = +[PLPersistentHistoryTransactionIterator iteratorSinceToken:v5 withManagedObjectObjectContext:v6 error:&v17];
  id v8 = v17;
  if (!v7)
  {
    if (PLIsErrorEqualToCode())
    {
      if (!*MEMORY[0x1E4F59AC0])
      {
        char v12 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v19 = (uint64_t)v5;
          __int16 v20 = 2114;
          id v21 = v6;
          objc_super v13 = "Token was expired, sending back PLCloudChangeEventsResultHistoryTokenInvalid, token: %{public}@, context: %{public}@";
LABEL_15:
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x16u);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (!PLIsErrorEqualToCode())
      {
        if (*MEMORY[0x1E4F59AC0])
        {
          uint64_t v14 = 1;
          goto LABEL_22;
        }
        char v12 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          uint64_t v19 = (uint64_t)v5;
          __int16 v20 = 2112;
          id v21 = v6;
          __int16 v22 = 2112;
          id v23 = v8;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch transactions since token: %{public}@, context: %@, error: %@,", buf, 0x20u);
        }
        uint64_t v14 = 1;
        goto LABEL_21;
      }
      if (!*MEMORY[0x1E4F59AC0])
      {
        char v12 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v19 = (uint64_t)v5;
          __int16 v20 = 2114;
          id v21 = v6;
          objc_super v13 = "Token is inconsistent (token passed to NSPersistentChangeRequest does not contain the store), sending ba"
                "ck PLCloudChangeEventsResultHistoryTokenInvalid, token: %{public}@, context: %{public}@";
          goto LABEL_15;
        }
LABEL_16:
        uint64_t v14 = 2;
LABEL_21:

LABEL_22:
        int64_t v11 = [[PLCloudPersistentHistoryTransactionsResult alloc] initWithUnsuccessfulResultType:v14];
        goto LABEL_23;
      }
    }
    uint64_t v14 = 2;
    goto LABEL_22;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v9 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [v7 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Sending back PLCloudChangeEventsResultSuccess with %lu transactions in an iterator", buf, 0xCu);
    }
  }
  int64_t v11 = [[PLCloudPersistentHistoryTransactionsResult alloc] initWithSuccesfulTransactionIterator:v7];
LABEL_23:
  uint64_t v15 = v11;

  return v15;
}

@end