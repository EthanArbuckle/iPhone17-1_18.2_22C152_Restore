@interface SBKSyncResponseDataKeyEnumerator
- (BOOL)resolvedConflictsNeedSyncToServer;
- (NSEnumerator)conflictedKeysEnumerator;
- (NSEnumerator)deletedKeysEnumerator;
- (NSEnumerator)updatedKeysEnumerator;
- (SBKSyncResponseData)responseData;
- (SBKSyncResponseDataKeyEnumerator)initWithResponseData:(id)a3;
- (SBKSyncTransaction)transaction;
- (id)completionBlock;
- (void)_processDeletedKey:(id)a3 isDirty:(BOOL *)a4;
- (void)_processNextKey;
- (void)_processUpdatedKey:(id)a3 isConflict:(BOOL)a4 isDirty:(BOOL *)a5;
- (void)enumerateKeysInResponseForTransaction:(id)a3 completionBlock:(id)a4;
- (void)setCompletionBlock:(id)a3;
- (void)setConflictedKeysEnumerator:(id)a3;
- (void)setDeletedKeysEnumerator:(id)a3;
- (void)setResolvedConflictsNeedSyncToServer:(BOOL)a3;
- (void)setResponseData:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUpdatedKeysEnumerator:(id)a3;
@end

@implementation SBKSyncResponseDataKeyEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedKeysEnumerator, 0);
  objc_storeStrong((id *)&self->_conflictedKeysEnumerator, 0);
  objc_storeStrong((id *)&self->_updatedKeysEnumerator, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
}

- (void)setDeletedKeysEnumerator:(id)a3
{
}

- (NSEnumerator)deletedKeysEnumerator
{
  return self->_deletedKeysEnumerator;
}

- (void)setConflictedKeysEnumerator:(id)a3
{
}

- (NSEnumerator)conflictedKeysEnumerator
{
  return self->_conflictedKeysEnumerator;
}

- (void)setUpdatedKeysEnumerator:(id)a3
{
}

- (NSEnumerator)updatedKeysEnumerator
{
  return self->_updatedKeysEnumerator;
}

- (void)setResolvedConflictsNeedSyncToServer:(BOOL)a3
{
  self->_resolvedConflictsNeedSyncToServer = a3;
}

- (BOOL)resolvedConflictsNeedSyncToServer
{
  return self->_resolvedConflictsNeedSyncToServer;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setTransaction:(id)a3
{
}

- (SBKSyncTransaction)transaction
{
  return self->_transaction;
}

- (void)setResponseData:(id)a3
{
}

- (SBKSyncResponseData)responseData
{
  return self->_responseData;
}

- (void)_processNextKey
{
  v3 = 0;
  while (1)
  {
    unsigned __int8 v8 = 0;
    uint64_t v4 = [(NSEnumerator *)self->_updatedKeysEnumerator nextObject];

    if (v4)
    {
      [(SBKSyncResponseDataKeyEnumerator *)self _processUpdatedKey:v4 isConflict:0 isDirty:&v8];
      v3 = (void *)v4;
      goto LABEL_8;
    }
    uint64_t v5 = [(NSEnumerator *)self->_conflictedKeysEnumerator nextObject];
    if (v5)
    {
      v3 = (void *)v5;
      [(SBKSyncResponseDataKeyEnumerator *)self _processUpdatedKey:v5 isConflict:1 isDirty:&v8];
      goto LABEL_8;
    }
    uint64_t v6 = [(NSEnumerator *)self->_deletedKeysEnumerator nextObject];
    if (!v6) {
      break;
    }
    v3 = (void *)v6;
    [(SBKSyncResponseDataKeyEnumerator *)self _processDeletedKey:v6 isDirty:&v8];
LABEL_8:
    self->_resolvedConflictsNeedSyncToServer = (self->_resolvedConflictsNeedSyncToServer | v8) != 0;
  }
  completionBlock = (void (**)(id, BOOL))self->_completionBlock;
  if (completionBlock) {
    completionBlock[2](completionBlock, self->_resolvedConflictsNeedSyncToServer);
  }
}

- (void)_processDeletedKey:(id)a3 isDirty:(BOOL *)a4
{
  transaction = self->_transaction;
  id v7 = a3;
  id v8 = [(SBKSyncTransaction *)transaction transactionProcessor];
  [v8 transaction:self->_transaction processDeletedKey:v7 isDirty:a4];
}

- (void)_processUpdatedKey:(id)a3 isConflict:(BOOL)a4 isDirty:(BOOL *)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v8 = -[SBKSyncResponseData payloadDataForUpdateResponseKey:](self->_responseData, "payloadDataForUpdateResponseKey:");
  if (v8)
  {
    v9 = [(SBKSyncTransaction *)self->_transaction transactionProcessor];
    [v9 transaction:self->_transaction processUpdatedKey:v10 data:v8 conflict:v6 isDirty:a5];
  }
}

- (void)enumerateKeysInResponseForTransaction:(id)a3 completionBlock:(id)a4
{
  objc_storeStrong((id *)&self->_transaction, a3);
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x230F4DE10]();

  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v9;

  v11 = [(SBKSyncResponseData *)self->_responseData updatedKeys];
  v12 = [v11 objectEnumerator];
  updatedKeysEnumerator = self->_updatedKeysEnumerator;
  self->_updatedKeysEnumerator = v12;

  v14 = [(SBKSyncResponseData *)self->_responseData conflictedKeys];
  v15 = [v14 objectEnumerator];
  conflictedKeysEnumerator = self->_conflictedKeysEnumerator;
  self->_conflictedKeysEnumerator = v15;

  v17 = [(SBKSyncResponseData *)self->_responseData deletedKeys];
  v18 = [v17 objectEnumerator];
  deletedKeysEnumerator = self->_deletedKeysEnumerator;
  self->_deletedKeysEnumerator = v18;

  self->_resolvedConflictsNeedSyncToServer = 0;
  [(SBKSyncResponseDataKeyEnumerator *)self _processNextKey];
}

- (SBKSyncResponseDataKeyEnumerator)initWithResponseData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKSyncResponseDataKeyEnumerator;
  BOOL v6 = [(SBKSyncResponseDataKeyEnumerator *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_responseData, a3);
  }

  return v7;
}

@end