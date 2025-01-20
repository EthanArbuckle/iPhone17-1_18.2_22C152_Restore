@interface FCReadablePrivateDataStorage
- (FCFileCoordinatedTodayDropbox)dropbox;
- (FCFileCoordinatedTodayPrivateDataTransactionQueue)transactionQueue;
- (FCReadablePrivateDataStorage)init;
- (FCReadablePrivateDataStorage)initWithDropbox:(id)a3 transactionQueue:(id)a4;
- (void)readPrivateDataSyncWithAccessor:(id)a3;
- (void)setDropbox:(id)a3;
- (void)setTransactionQueue:(id)a3;
@end

@implementation FCReadablePrivateDataStorage

- (FCReadablePrivateDataStorage)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCReadablePrivateDataStorage init]";
    __int16 v9 = 2080;
    v10 = "FCReadablePrivateDataStorage.m";
    __int16 v11 = 1024;
    int v12 = 26;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCReadablePrivateDataStorage init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCReadablePrivateDataStorage)initWithDropbox:(id)a3 transactionQueue:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "dropbox");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCReadablePrivateDataStorage initWithDropbox:transactionQueue:]";
    __int16 v17 = 2080;
    v18 = "FCReadablePrivateDataStorage.m";
    __int16 v19 = 1024;
    int v20 = 31;
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
    v16 = "-[FCReadablePrivateDataStorage initWithDropbox:transactionQueue:]";
    __int16 v17 = 2080;
    v18 = "FCReadablePrivateDataStorage.m";
    __int16 v19 = 1024;
    int v20 = 32;
    __int16 v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)FCReadablePrivateDataStorage;
  __int16 v9 = [(FCReadablePrivateDataStorage *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dropbox, a3);
    objc_storeStrong((id *)&v10->_transactionQueue, a4);
  }

  return v10;
}

- (void)readPrivateDataSyncWithAccessor:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "accessor");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FCReadablePrivateDataStorage readPrivateDataSyncWithAccessor:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCReadablePrivateDataStorage.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v26) = 46;
    WORD2(v26) = 2114;
    *(void *)((char *)&v26 + 6) = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v26 = __Block_byref_object_copy__7;
  *((void *)&v26 + 1) = __Block_byref_object_dispose__7;
  id v27 = 0;
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  __int16 v21 = __Block_byref_object_copy__7;
  v22 = __Block_byref_object_dispose__7;
  id v23 = 0;
  v5 = [(FCReadablePrivateDataStorage *)self dropbox];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__FCReadablePrivateDataStorage_readPrivateDataSyncWithAccessor___block_invoke;
  v17[3] = &unk_1E5B4D1B0;
  v17[4] = buf;
  [v5 peekSyncWithAccessor:v17];

  id v6 = [(FCReadablePrivateDataStorage *)self transactionQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__FCReadablePrivateDataStorage_readPrivateDataSyncWithAccessor___block_invoke_2;
  v16[3] = &unk_1E5B4D1D8;
  v16[4] = &v18;
  [v6 peekAtTransactionsSyncWithAccessor:v16];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = (id)v19[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) performWithTodayPrivateData:*(void *)(*(void *)&buf[8] + 40)];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v24 count:16];
    }
    while (v8);
  }

  v4[2](v4, *(void *)(*(void *)&buf[8] + 40));
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(buf, 8);
}

uint64_t __64__FCReadablePrivateDataStorage_readPrivateDataSyncWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 mutableCopy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

uint64_t __64__FCReadablePrivateDataStorage_readPrivateDataSyncWithAccessor___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
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