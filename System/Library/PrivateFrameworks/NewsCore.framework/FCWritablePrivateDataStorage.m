@interface FCWritablePrivateDataStorage
- (FCFileCoordinatedTodayDropbox)dropbox;
- (FCFileCoordinatedTodayPrivateDataTransactionQueue)transactionQueue;
- (FCWritablePrivateDataStorage)init;
- (FCWritablePrivateDataStorage)initWithDropbox:(id)a3 transactionQueue:(id)a4;
- (void)setDropbox:(id)a3;
- (void)setTransactionQueue:(id)a3;
- (void)writeReadHistoryItem:(id)a3 withCompletion:(id)a4;
- (void)writeSeenHistoryItems:(id)a3 withCompletion:(id)a4;
@end

@implementation FCWritablePrivateDataStorage

- (FCWritablePrivateDataStorage)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCWritablePrivateDataStorage init]";
    __int16 v9 = 2080;
    v10 = "FCWritablePrivateDataStorage.m";
    __int16 v11 = 1024;
    int v12 = 24;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCWritablePrivateDataStorage init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCWritablePrivateDataStorage)initWithDropbox:(id)a3 transactionQueue:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "dropbox");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCWritablePrivateDataStorage initWithDropbox:transactionQueue:]";
    __int16 v17 = 2080;
    v18 = "FCWritablePrivateDataStorage.m";
    __int16 v19 = 1024;
    int v20 = 29;
    __int16 v21 = 2114;
    v22 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "transactionQueue");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCWritablePrivateDataStorage initWithDropbox:transactionQueue:]";
    __int16 v17 = 2080;
    v18 = "FCWritablePrivateDataStorage.m";
    __int16 v19 = 1024;
    int v20 = 30;
    __int16 v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)FCWritablePrivateDataStorage;
  __int16 v9 = [(FCWritablePrivateDataStorage *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dropbox, a3);
    objc_storeStrong((id *)&v10->_transactionQueue, a4);
  }

  return v10;
}

- (void)writeSeenHistoryItems:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "historyItems");
    *(_DWORD *)buf = 136315906;
    __int16 v17 = "-[FCWritablePrivateDataStorage writeSeenHistoryItems:withCompletion:]";
    __int16 v18 = 2080;
    __int16 v19 = "FCWritablePrivateDataStorage.m";
    __int16 v20 = 1024;
    int v21 = 44;
    __int16 v22 = 2114;
    uint64_t v23 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v8 = objc_opt_new();
  __int16 v9 = +[FCFileCoordinatedTodayDropboxTransaction transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems:v6 deletedArticleIDs:v8];

  v10 = [(FCWritablePrivateDataStorage *)self dropbox];
  __int16 v11 = [v9 todayPrivateDataAccessor];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__FCWritablePrivateDataStorage_writeSeenHistoryItems_withCompletion___block_invoke;
  v14[3] = &unk_1E5B556D8;
  id v15 = v7;
  id v12 = v7;
  [v10 depositWithAccessor:v11 completion:v14];
}

uint64_t __69__FCWritablePrivateDataStorage_writeSeenHistoryItems_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)writeReadHistoryItem:(id)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "historyItem");
    *(_DWORD *)buf = 136315906;
    __int16 v19 = "-[FCWritablePrivateDataStorage writeReadHistoryItem:withCompletion:]";
    __int16 v20 = 2080;
    int v21 = "FCWritablePrivateDataStorage.m";
    __int16 v22 = 1024;
    int v23 = 54;
    __int16 v24 = 2114;
    v25 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v8 = [FCTodayMarkAsReadTransaction alloc];
  __int16 v9 = [v6 articleID];
  uint64_t v10 = [v6 maxVersionRead];
  __int16 v11 = [v6 lastVisitedAt];
  id v12 = [(FCTodayMarkAsReadTransaction *)v8 initWithArticleID:v9 articleVersion:v10 readDate:v11];

  __int16 v13 = [(FCWritablePrivateDataStorage *)self transactionQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__FCWritablePrivateDataStorage_writeReadHistoryItem_withCompletion___block_invoke;
  v16[3] = &unk_1E5B556D8;
  id v17 = v7;
  id v14 = v7;
  [v13 enqueueTransaction:v12 withMaxTransactionCount:100 completion:v16];
}

uint64_t __68__FCWritablePrivateDataStorage_writeReadHistoryItem_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (FCFileCoordinatedTodayDropbox)dropbox
{
  return self->_dropbox;
}

- (void)setDropbox:(id)a3
{
}

- (FCFileCoordinatedTodayPrivateDataTransactionQueue)transactionQueue
{
  return self->_transactionQueue;
}

- (void)setTransactionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_storeStrong((id *)&self->_dropbox, 0);
}

@end