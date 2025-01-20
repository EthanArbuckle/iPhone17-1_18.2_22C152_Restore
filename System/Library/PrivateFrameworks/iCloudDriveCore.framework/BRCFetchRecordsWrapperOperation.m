@interface BRCFetchRecordsWrapperOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCFetchRecordsWrapperOperation)initWithCKFetchRecordsOperation:(id)a3 group:(id)a4 serverZone:(id)a5 isUserWaiting:(BOOL)a6 sessionContext:(id)a7;
- (id)createActivity;
- (void)main;
@end

@implementation BRCFetchRecordsWrapperOperation

- (BRCFetchRecordsWrapperOperation)initWithCKFetchRecordsOperation:(id)a3 group:(id)a4 serverZone:(id)a5 isUserWaiting:(BOOL)a6 sessionContext:(id)a7
{
  BOOL v24 = a6;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = brc_bread_crumbs();
  v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v12;
    __int16 v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_INFO, "[INFO] Request to wrap and run CKFetchRecordsOperation: [%@]%@", buf, 0x16u);
  }

  v18 = [MEMORY[0x263F08C38] UUID];
  v19 = [v18 UUIDString];
  v20 = [@"fetch-records-wrapper/" stringByAppendingString:v19];

  v21 = [v14 metadataSyncContext];
  v25.receiver = self;
  v25.super_class = (Class)BRCFetchRecordsWrapperOperation;
  v22 = [(_BRCOperation *)&v25 initWithName:v20 syncContext:v21 sessionContext:v15];

  if (v22)
  {
    [(_BRCOperation *)v22 setGroup:v13];
    [(_BRCOperation *)v22 setNonDiscretionary:v24];
    objc_storeStrong((id *)&v22->_serverZone, a5);
    objc_storeStrong((id *)&v22->_fetchRecordsOperation, a3);
  }

  return v22;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sync/fetch-records-wrapper", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)main
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    fetchRecordsOperation = self->_fetchRecordsOperation;
    *(_DWORD *)buf = 138412546;
    id v15 = fetchRecordsOperation;
    __int16 v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_23FA42000, v4, OS_LOG_TYPE_INFO, "[INFO] Running CKFetchRecordsOperation: [%@]%@", buf, 0x16u);
  }

  v6 = [(CKFetchRecordsOperation *)self->_fetchRecordsOperation fetchRecordsCompletionBlock];
  objc_initWeak((id *)buf, self);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __39__BRCFetchRecordsWrapperOperation_main__block_invoke;
  v11 = &unk_265083E68;
  objc_copyWeak(&v13, (id *)buf);
  id v7 = v6;
  id v12 = v7;
  [(CKFetchRecordsOperation *)self->_fetchRecordsOperation setFetchRecordsCompletionBlock:&v8];
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", self->_fetchRecordsOperation, v8, v9, v10, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __39__BRCFetchRecordsWrapperOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = WeakRetained[64];
    int v11 = 138412802;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] finished running CKFetchRecordsOperation [%@] with error [%@]%@", (uint8_t *)&v11, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [WeakRetained completedWithResult:0 error:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchRecordsOperation, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
}

@end