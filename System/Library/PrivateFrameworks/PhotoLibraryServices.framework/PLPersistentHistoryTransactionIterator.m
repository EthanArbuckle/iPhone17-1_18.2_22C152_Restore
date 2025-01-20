@interface PLPersistentHistoryTransactionIterator
+ (id)iteratorSinceMarker:(id)a3 withFetchRequest:(id)a4 managedObjectObjectContext:(id)a5 error:(id *)a6;
+ (id)iteratorSinceToken:(id)a3 withManagedObjectObjectContext:(id)a4 error:(id *)a5;
- (BOOL)enumerateOneTransactionWithBlock:(id)a3;
- (BOOL)hasMoreTransactions;
- (NSManagedObjectContext)context;
- (NSMutableDictionary)userInfo;
- (NSPersistentHistoryToken)lastIteratedToken;
- (PLPersistentHistoryTransactionIterator)initWithTransactions:(id)a3 managedObjectObjectContext:(id)a4;
- (id)_safeTransactionAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)enumerateRemainingTransactionsWithBlock:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation PLPersistentHistoryTransactionIterator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lastIteratedToken, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
}

- (void)setUserInfo:(id)a3
{
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (NSPersistentHistoryToken)lastIteratedToken
{
  return self->_lastIteratedToken;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)_safeTransactionAtIndex:(unint64_t)a3
{
  v3 = -[NSArray objectAtIndexedSubscript:](self->_transactions, "objectAtIndexedSubscript:");
  return v3;
}

- (BOOL)enumerateOneTransactionWithBlock:(id)a3
{
  v4 = (void (**)(id, uint64_t, char *))a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__27510;
  v23 = __Block_byref_object_dispose__27511;
  id v24 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__27510;
  v17 = __Block_byref_object_dispose__27511;
  id v18 = 0;
  context = self->_context;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__PLPersistentHistoryTransactionIterator_enumerateOneTransactionWithBlock___block_invoke;
  v12[3] = &unk_1E5875A90;
  v12[4] = self;
  v12[5] = &v19;
  v12[6] = &v13;
  [(NSManagedObjectContext *)context performBlockAndWait:v12];
  uint64_t v6 = v20[5];
  if (v6)
  {
    char v11 = 0;
    v4[2](v4, v6, &v11);
    v7 = (NSPersistentHistoryToken *)[(id)v14[5] copy];
    lastIteratedToken = self->_lastIteratedToken;
    self->_lastIteratedToken = v7;

    BOOL v9 = v11 != 0;
  }
  else
  {
    BOOL v9 = 1;
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __75__PLPersistentHistoryTransactionIterator_enumerateOneTransactionWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _safeTransactionAtIndex:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    ++*(void *)(*(void *)(a1 + 32) + 16);
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) token];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (void)enumerateRemainingTransactionsWithBlock:(id)a3
{
  id v6 = a3;
  do
  {
    if (![(PLPersistentHistoryTransactionIterator *)self hasMoreTransactions]) {
      break;
    }
    v4 = (void *)MEMORY[0x19F38D3B0]();
    BOOL v5 = [(PLPersistentHistoryTransactionIterator *)self enumerateOneTransactionWithBlock:v6];
  }
  while (!v5);
}

- (BOOL)hasMoreTransactions
{
  return self->_transactionIndex < self->_count;
}

- (PLPersistentHistoryTransactionIterator)initWithTransactions:(id)a3 managedObjectObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PLPersistentHistoryTransactionIterator;
  v8 = [(PLPersistentHistoryTransactionIterator *)&v17 init];
  BOOL v9 = v8;
  if (v8)
  {
    v8->_transactionIndex = 0;
    objc_storeStrong((id *)&v8->_context, a4);
    context = v9->_context;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90__PLPersistentHistoryTransactionIterator_initWithTransactions_managedObjectObjectContext___block_invoke;
    v14[3] = &unk_1E5875E18;
    char v11 = v9;
    uint64_t v15 = v11;
    id v16 = v6;
    [(NSManagedObjectContext *)context performBlockAndWait:v14];
    v12 = v11;
  }
  return v9;
}

uint64_t __90__PLPersistentHistoryTransactionIterator_initWithTransactions_managedObjectObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(void *)(*(void *)(a1 + 32) + 32) = result;
  return result;
}

+ (id)iteratorSinceMarker:(id)a3 withFetchRequest:(id)a4 managedObjectObjectContext:(id)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = PLPersistentHistoryGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = a1;
    __int16 v23 = 2114;
    id v24 = v10;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: Fetching persistent history transactions since marker: %{public}@", buf, 0x16u);
  }

  v14 = +[PLPersistentHistoryUtilities fetchTransactionsSinceMarker:v10 withFetchRequest:v12 batchSize:100 context:v11 error:a6];

  uint64_t v15 = PLPersistentHistoryGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __112__PLPersistentHistoryTransactionIterator_iteratorSinceMarker_withFetchRequest_managedObjectObjectContext_error___block_invoke;
    v18[3] = &unk_1E5873348;
    id v20 = a1;
    id v19 = v14;
    [v11 performBlockAndWait:v18];
  }
  if (v14) {
    id v16 = (void *)[objc_alloc((Class)a1) initWithTransactions:v14 managedObjectObjectContext:v11];
  }
  else {
    id v16 = 0;
  }

  return v16;
}

void __112__PLPersistentHistoryTransactionIterator_iteratorSinceMarker_withFetchRequest_managedObjectObjectContext_error___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLPersistentHistoryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) count];
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2050;
    uint64_t v8 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "%{public}@: Fetched persistent history transaction count: %{public}lu", (uint8_t *)&v5, 0x16u);
  }
}

+ (id)iteratorSinceToken:(id)a3 withManagedObjectObjectContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = +[PLPersistentHistoryMarker markerWithToken:a3];
  id v10 = [a1 iteratorSinceMarker:v9 withFetchRequest:0 managedObjectObjectContext:v8 error:a5];

  return v10;
}

@end