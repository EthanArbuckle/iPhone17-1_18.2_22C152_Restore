@interface FCFileCoordinatedTodayPrivateDataTransactionQueue
- (BOOL)peekAtTransactionsSyncWithAccessor:(id)a3;
- (FCFileCoordinatedDictionary)fileCoordinatedDictionary;
- (FCFileCoordinatedTodayPrivateDataTransactionQueue)init;
- (FCFileCoordinatedTodayPrivateDataTransactionQueue)initWithFileURL:(id)a3;
- (void)dequeueTransactionsWithCompletion:(id)a3;
- (void)enqueueTransaction:(id)a3 withMaxTransactionCount:(unint64_t)a4 completion:(id)a5;
- (void)setFileCoordinatedDictionary:(id)a3;
@end

@implementation FCFileCoordinatedTodayPrivateDataTransactionQueue

- (void)dequeueTransactionsWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completion");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCFileCoordinatedTodayPrivateDataTransactionQueue dequeueTransactionsWithCompletion:]";
    __int16 v12 = 2080;
    v13 = "FCFileCoordinatedTodayPrivateDataTransactionQueue.m";
    __int16 v14 = 1024;
    int v15 = 67;
    __int16 v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = [(FCFileCoordinatedTodayPrivateDataTransactionQueue *)self fileCoordinatedDictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__FCFileCoordinatedTodayPrivateDataTransactionQueue_dequeueTransactionsWithCompletion___block_invoke;
  v8[3] = &unk_1E5B4DE20;
  id v9 = v4;
  id v6 = v4;
  [v5 writeWithAccessor:v8 completion:0];
}

- (FCFileCoordinatedDictionary)fileCoordinatedDictionary
{
  return self->_fileCoordinatedDictionary;
}

- (FCFileCoordinatedTodayPrivateDataTransactionQueue)initWithFileURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "fileURL");
    *(_DWORD *)buf = 136315906;
    int v15 = "-[FCFileCoordinatedTodayPrivateDataTransactionQueue initWithFileURL:]";
    __int16 v16 = 2080;
    v17 = "FCFileCoordinatedTodayPrivateDataTransactionQueue.m";
    __int16 v18 = 1024;
    int v19 = 31;
    __int16 v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v13.receiver = self;
  v13.super_class = (Class)FCFileCoordinatedTodayPrivateDataTransactionQueue;
  v5 = [(FCFileCoordinatedTodayPrivateDataTransactionQueue *)&v13 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v9 = [[FCFileCoordinatedDictionary alloc] initWithFileURL:v4 allowedClasses:v8];
    fileCoordinatedDictionary = v5->_fileCoordinatedDictionary;
    v5->_fileCoordinatedDictionary = v9;
  }
  return v5;
}

void __87__FCFileCoordinatedTodayPrivateDataTransactionQueue_dequeueTransactionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_msgSend(a2, "fc_dequeueTransactions");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (FCFileCoordinatedTodayPrivateDataTransactionQueue)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFileCoordinatedTodayPrivateDataTransactionQueue init]";
    __int16 v9 = 2080;
    v10 = "FCFileCoordinatedTodayPrivateDataTransactionQueue.m";
    __int16 v11 = 1024;
    int v12 = 26;
    __int16 v13 = 2114;
    __int16 v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFileCoordinatedTodayPrivateDataTransactionQueue init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)enqueueTransaction:(id)a3 withMaxTransactionCount:(unint64_t)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "transaction");
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCFileCoordinatedTodayPrivateDataTransactionQueue enqueueTransaction:withMaxTransactionCount:completion:]";
    __int16 v18 = 2080;
    int v19 = "FCFileCoordinatedTodayPrivateDataTransactionQueue.m";
    __int16 v20 = 1024;
    int v21 = 46;
    __int16 v22 = 2114;
    v23 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10 = [(FCFileCoordinatedTodayPrivateDataTransactionQueue *)self fileCoordinatedDictionary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __107__FCFileCoordinatedTodayPrivateDataTransactionQueue_enqueueTransaction_withMaxTransactionCount_completion___block_invoke;
  v13[3] = &unk_1E5B5C6F0;
  id v14 = v8;
  unint64_t v15 = a4;
  id v11 = v8;
  [v10 writeWithAccessor:v13 completion:v9];
}

uint64_t __107__FCFileCoordinatedTodayPrivateDataTransactionQueue_enqueueTransaction_withMaxTransactionCount_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fc_enqueueTransaction:withMaxTransactionCount:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (BOOL)peekAtTransactionsSyncWithAccessor:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "accessor");
    *(_DWORD *)buf = 136315906;
    __int16 v13 = "-[FCFileCoordinatedTodayPrivateDataTransactionQueue peekAtTransactionsSyncWithAccessor:]";
    __int16 v14 = 2080;
    unint64_t v15 = "FCFileCoordinatedTodayPrivateDataTransactionQueue.m";
    __int16 v16 = 1024;
    int v17 = 57;
    __int16 v18 = 2114;
    int v19 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = [(FCFileCoordinatedTodayPrivateDataTransactionQueue *)self fileCoordinatedDictionary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__FCFileCoordinatedTodayPrivateDataTransactionQueue_peekAtTransactionsSyncWithAccessor___block_invoke;
  v10[3] = &unk_1E5B4DDF8;
  id v11 = v4;
  id v6 = v4;
  char v7 = [v5 readSyncWithAccessor:v10];

  return v7;
}

void __88__FCFileCoordinatedTodayPrivateDataTransactionQueue_peekAtTransactionsSyncWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = objc_msgSend(a2, "fc_transactions");
  id v5 = (id)v3;
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = MEMORY[0x1E4F1CBF0];
  }
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v4);
}

- (void)setFileCoordinatedDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end