@interface FCCKPrivateDatabaseOperation
- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4;
- (BOOL)handleIdentityLoss;
- (BOOL)skipPreflight;
- (BOOL)validateOperation;
- (FCCKPrivateDatabase)database;
- (FCCKPrivateDatabaseOperation)init;
- (unint64_t)maxRetries;
- (void)runChildCKOperation:(id)a3 destination:(int64_t)a4;
- (void)setDatabase:(id)a3;
- (void)setHandleIdentityLoss:(BOOL)a3;
- (void)setSkipPreflight:(BOOL)a3;
@end

@implementation FCCKPrivateDatabaseOperation

- (FCCKPrivateDatabaseOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCCKPrivateDatabaseOperation;
  result = [(FCOperation *)&v3 init];
  if (result)
  {
    result->_skipPreflight = 0;
    result->_handleIdentityLoss = 1;
  }
  return result;
}

- (BOOL)validateOperation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)FCCKPrivateDatabaseOperation;
  BOOL v3 = [(FCOperation *)&v7 validateOperation];
  v4 = [(FCCKPrivateDatabaseOperation *)self database];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)[[NSString alloc] initWithFormat:@"can't execute a private database operation without a database"];
    *(_DWORD *)buf = 136315906;
    v9 = "-[FCCKPrivateDatabaseOperation validateOperation]";
    __int16 v10 = 2080;
    v11 = "FCCKPrivateDatabaseOperation.m";
    __int16 v12 = 1024;
    int v13 = 41;
    __int16 v14 = 2114;
    v15 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return v4 && v3;
}

- (unint64_t)maxRetries
{
  return 1;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  id v6 = a3;
  if (objc_msgSend(v6, "fc_hasIdentityStillSyncingError"))
  {
    objc_super v7 = [FCOperationNotificationRetrySignal alloc];
    v8 = [(FCOperationNotificationRetrySignal *)v7 initWithNotificationName:*MEMORY[0x1E4F19C98] timeout:30.0];
LABEL_8:
    *a4 = v8;
    BOOL v12 = 1;
    goto LABEL_10;
  }
  if (![(FCCKPrivateDatabaseOperation *)self handleIdentityLoss]
    || !objc_msgSend(v6, "fc_hasIdentityLostError"))
  {
    if (!objc_msgSend(v6, "fc_hasXPCInterruptedOrInvalidError"))
    {
      BOOL v12 = 0;
      goto LABEL_10;
    }
    v15 = [FCOperationDelayedRetrySignal alloc];
    CKRetryAfterSecondsForError();
    v8 = -[FCOperationDelayedRetrySignal initWithDelay:](v15, "initWithDelay:");
    goto LABEL_8;
  }
  v9 = objc_alloc_init(FCOperationExternalSignal);
  __int16 v10 = objc_alloc_init(FCCKSecureDatabaseResetOperation);
  v11 = [(FCCKPrivateDatabaseOperation *)self database];
  [(FCCKSecureDatabaseResetOperation *)v10 setDatabase:v11];

  BOOL v12 = 1;
  [(FCCKSecureDatabaseResetOperation *)v10 setDeleteZones:1];
  [(FCCKSecureDatabaseResetOperation *)v10 setRestoreSecureSentinel:1];
  [(FCCKSecureDatabaseResetOperation *)v10 setRestoreZoneContents:1];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __61__FCCKPrivateDatabaseOperation_canRetryWithError_retryAfter___block_invoke;
  v20 = &unk_1E5B4C808;
  v21 = self;
  v22 = v9;
  int v13 = v9;
  [(FCCKSecureDatabaseResetOperation *)v10 setResetCompletionHandler:&v17];
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v10, v17, v18, v19, v20, v21);
  [(FCOperation *)v10 start];
  __int16 v14 = v13;
  *a4 = v14;

LABEL_10:
  return v12;
}

uint64_t __61__FCCKPrivateDatabaseOperation_canRetryWithError_retryAfter___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    id v5 = a2;
    id v6 = [v4 database];
    -[FCCKPrivateDatabase takeDatabaseOfflineDueToError:]((uint64_t)v6, v5);
  }
  objc_super v7 = *(void **)(a1 + 40);
  return [v7 triggerWithRetry:a2 == 0];
}

- (void)runChildCKOperation:(id)a3 destination:(int64_t)a4
{
  id v6 = a3;
  [(FCOperation *)self associateChildOperation:v6];
  BOOL v7 = [(FCCKPrivateDatabaseOperation *)self skipPreflight];
  v8 = [(FCCKPrivateDatabaseOperation *)self database];
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      -[FCCKPrivateDatabase _addCKOperation:destination:]((uint64_t)v8, v6, a4);
    }
  }
  else
  {
    -[FCCKPrivateDatabase addCKOperation:destination:](v8, v6, a4);
  }
}

- (FCCKPrivateDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (BOOL)skipPreflight
{
  return self->_skipPreflight;
}

- (void)setSkipPreflight:(BOOL)a3
{
  self->_skipPreflight = a3;
}

- (BOOL)handleIdentityLoss
{
  return self->_handleIdentityLoss;
}

- (void)setHandleIdentityLoss:(BOOL)a3
{
  self->_handleIdentityLoss = a3;
}

- (void).cxx_destruct
{
}

@end