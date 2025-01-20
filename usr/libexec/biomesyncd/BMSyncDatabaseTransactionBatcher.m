@interface BMSyncDatabaseTransactionBatcher
- (BMSyncDatabaseTransactionBatcher)initWithDatabase:(id)a3 transcationBatchSize:(unint64_t)a4;
- (BOOL)_commitTransaction;
- (BOOL)executeOperationWithBlock:(id)a3;
- (BOOL)markAllOperationsComplete;
- (BOOL)markOperationComplete;
- (BOOL)markOperationStarted;
@end

@implementation BMSyncDatabaseTransactionBatcher

- (BMSyncDatabaseTransactionBatcher)initWithDatabase:(id)a3 transcationBatchSize:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BMSyncDatabaseTransactionBatcher;
  v8 = [(BMSyncDatabaseTransactionBatcher *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_database, a3);
    v9->_batchSize = a4;
  }

  return v9;
}

- (BOOL)executeOperationWithBlock:(id)a3
{
  v4 = (void (**)(id, unsigned char *))a3;
  while (1)
  {
    [(BMSyncDatabase *)self->_database beginTransaction];
    if (self->_batchSize) {
      break;
    }
LABEL_6:
    if (![(BMSyncDatabase *)self->_database commit])
    {
      v18 = __biome_log_for_category();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100047DF4(v18, v19, v20, v21, v22, v23, v24, v25);
      }

      [(BMSyncDatabase *)self->_database rollback];
      BOOL v8 = 0;
      goto LABEL_13;
    }
  }
  uint64_t v6 = 0;
  while (1)
  {
    char v26 = 0;
    v4[2](v4, &v26);
    if (v26) {
      break;
    }
    if (++v6 >= self->_batchSize) {
      goto LABEL_6;
    }
  }
  BOOL v8 = [(BMSyncDatabase *)self->_database commit];
  if (!v8)
  {
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100047DF4(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    [(BMSyncDatabase *)self->_database rollback];
  }
LABEL_13:

  return v8;
}

- (BOOL)_commitTransaction
{
  BOOL v3 = [(BMSyncDatabase *)self->_database commit];
  if (!v3)
  {
    v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100047DF4(v4, v5, v6, v7, v8, v9, v10, v11);
    }

    self->_transactionError = 1;
    [(BMSyncDatabase *)self->_database rollback];
  }
  return v3;
}

- (BOOL)markOperationStarted
{
  ++self->_currentBatchCount;
  if ([(BMSyncDatabase *)self->_database isInTransaction]) {
    return 1;
  }
  database = self->_database;

  return [(BMSyncDatabase *)database beginTransaction];
}

- (BOOL)markOperationComplete
{
  if (![(BMSyncDatabase *)self->_database isInTransaction]
    || self->_currentBatchCount < self->_batchSize)
  {
    return 1;
  }
  self->_currentBatchCount = 0;

  return [(BMSyncDatabaseTransactionBatcher *)self _commitTransaction];
}

- (BOOL)markAllOperationsComplete
{
  if (self->_transactionError) {
    return 0;
  }
  if (![(BMSyncDatabase *)self->_database isInTransaction]) {
    return 1;
  }

  return [(BMSyncDatabaseTransactionBatcher *)self _commitTransaction];
}

- (void).cxx_destruct
{
}

@end