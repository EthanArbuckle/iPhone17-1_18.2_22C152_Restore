@interface SBKSyncTransaction
- (NSArray)keysToDelete;
- (NSArray)keysToUpdate;
- (NSString)syncAnchor;
- (NSURL)syncRequestURL;
- (SBKSyncTransaction)initWithStoreBagContext:(id)a3 syncAnchor:(id)a4 keysToUpdate:(id)a5 keysToDelete:(id)a6 conflictDetectionType:(int64_t)a7;
- (SBKSyncTransaction)initWithSyncRequestURL:(id)a3 domain:(id)a4 syncAnchor:(id)a5 keysToUpdate:(id)a6 keysToDelete:(id)a7 conflictDetectionType:(int64_t)a8;
- (SBKSyncTransactionProcessing)transactionProcessor;
- (id)clampsKey;
- (id)conflictDetectionOrdinalForKey:(id)a3;
- (id)description;
- (id)domain;
- (id)keyValuePairForUpdatedKey:(id)a3;
- (id)newRequest;
- (id)requestURL;
- (int64_t)conflictDetectionType;
- (int64_t)type;
- (void)_validateTransactionProcessor:(id)a3;
- (void)processDataInResponse:(id)a3 withCompletionHandler:(id)a4;
- (void)setTransactionProcessor:(id)a3;
@end

@implementation SBKSyncTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncRequestURL, 0);
  objc_destroyWeak((id *)&self->_transactionProcessor);
  objc_storeStrong((id *)&self->_keysToDelete, 0);
  objc_storeStrong((id *)&self->_keysToUpdate, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_syncAnchor, 0);
}

- (NSURL)syncRequestURL
{
  return self->_syncRequestURL;
}

- (int64_t)type
{
  return self->_type;
}

- (void)processDataInResponse:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v6 syncResponseData], (v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_22B807000, v9, OS_LOG_TYPE_ERROR, "WARNING: Invalid response (%@).  Skipping...", buf, 0xCu);
    }

    v7[2](v7, 0);
    v8 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactionProcessor);
  [WeakRetained transaction:self willProcessResponseData:v8];

  v11 = [[SBKSyncResponseDataKeyEnumerator alloc] initWithResponseData:v8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__SBKSyncTransaction_processDataInResponse_withCompletionHandler___block_invoke;
  v14[3] = &unk_2648AF708;
  v14[4] = self;
  id v15 = v8;
  id v16 = v7;
  id v12 = v8;
  v13 = v7;
  [(SBKSyncResponseDataKeyEnumerator *)v11 enumerateKeysInResponseForTransaction:self completionBlock:v14];
}

uint64_t __66__SBKSyncTransaction_processDataInResponse_withCompletionHandler___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  [WeakRetained transaction:a1[4] didProcessResponseData:a1[5]];

  uint64_t result = a1[6];
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (NSArray)keysToDelete
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactionProcessor);
  char v4 = objc_opt_respondsToSelector();
  keysToDelete = self->_keysToDelete;
  if (v4)
  {
    id v6 = [WeakRetained transaction:self keysForTransactionForTransactionKeysToDelete:keysToDelete];
  }
  else
  {
    id v6 = keysToDelete;
  }
  v7 = v6;

  return v7;
}

- (NSArray)keysToUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactionProcessor);
  char v4 = objc_opt_respondsToSelector();
  keysToUpdate = self->_keysToUpdate;
  if (v4)
  {
    id v6 = [WeakRetained transaction:self keysForTransactionForTransactionKeysToUpdate:keysToUpdate];
  }
  else
  {
    id v6 = keysToUpdate;
  }
  v7 = v6;

  return v7;
}

- (int64_t)conflictDetectionType
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactionProcessor);
  char v4 = objc_opt_respondsToSelector();
  uint64_t conflictDetectionType = self->_conflictDetectionType;
  if (v4) {
    uint64_t conflictDetectionType = [WeakRetained transaction:self conflictDetectionTypeForTransactionDetectionType:self->_conflictDetectionType];
  }

  return conflictDetectionType;
}

- (NSString)syncAnchor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactionProcessor);
  char v4 = objc_opt_respondsToSelector();
  syncAnchor = self->_syncAnchor;
  if (v4)
  {
    id v6 = [WeakRetained transaction:self syncAnchorForTransactionSyncAnchor:syncAnchor];
  }
  else
  {
    id v6 = syncAnchor;
  }
  v7 = v6;

  return v7;
}

- (id)keyValuePairForUpdatedKey:(id)a3
{
  p_transactionProcessor = &self->_transactionProcessor;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_transactionProcessor);
  v7 = [WeakRetained transaction:self keyValuePairForUpdatedKey:v5];

  return v7;
}

- (id)conflictDetectionOrdinalForKey:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactionProcessor);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBKSyncTransaction.m" lineNumber:124 description:@"transactions using conflict detection must supply a conflict ordinal"];
  }
  v7 = [WeakRetained transaction:self conflictDetectionOrdinalForKey:v5];

  return v7;
}

- (id)description
{
  if ([(SBKSyncTransaction *)self type] == 1)
  {
    v3 = NSString;
    char v4 = [(SBKSyncTransaction *)self syncAnchor];
    [v3 stringWithFormat:@"SYNC: anchor=%@", v4];
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if ([(NSArray *)self->_keysToDelete count])
    {
      id v6 = [(NSArray *)self->_keysToDelete componentsJoinedByString:@", "];
      id v7 = (id)[(__CFString *)v5 stringByAppendingFormat:@", deletes=%@", v6];
    }
    if ([(NSArray *)self->_keysToUpdate count])
    {
      v8 = [(NSArray *)self->_keysToUpdate componentsJoinedByString:@", "];
      id v9 = (id)[(__CFString *)v5 stringByAppendingFormat:@", updates=%@", v8];
    }
  }
  else
  {
    id v5 = @"????";
  }
  v10 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)SBKSyncTransaction;
  v11 = [(SBKSyncTransaction *)&v14 description];
  id v12 = [v10 stringWithFormat:@"%@ domain = %@, %@", v11, self->_domain, v5];

  return v12;
}

- (SBKSyncTransactionProcessing)transactionProcessor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactionProcessor);
  return (SBKSyncTransactionProcessing *)WeakRetained;
}

- (void)setTransactionProcessor:(id)a3
{
  id obj = a3;
  [(SBKSyncTransaction *)self _validateTransactionProcessor:obj];
  objc_storeWeak((id *)&self->_transactionProcessor, obj);
}

- (void)_validateTransactionProcessor:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v6 = [MEMORY[0x263F08690] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"SBKSyncTransaction.m" lineNumber:81 description:@"Invalid processor"];
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v7 = [MEMORY[0x263F08690] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"SBKSyncTransaction.m" lineNumber:82 description:@"Invalid processor"];
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v8 = [MEMORY[0x263F08690] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"SBKSyncTransaction.m" lineNumber:83 description:@"Invalid processor"];
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"SBKSyncTransaction.m" lineNumber:84 description:@"Invalid processor"];
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v10 = [MEMORY[0x263F08690] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"SBKSyncTransaction.m" lineNumber:85 description:@"Invalid processor"];
    }
    if ([(SBKSyncTransaction *)self conflictDetectionType]
      && (objc_opt_respondsToSelector() & 1) == 0)
    {
      id v5 = [MEMORY[0x263F08690] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"SBKSyncTransaction.m" lineNumber:88 description:@"Invalid processor"];
    }
  }
  else
  {
    [(SBKSyncTransaction *)self conflictDetectionType];
  }
}

- (id)newRequest
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)requestURL
{
  return self->_syncRequestURL;
}

- (id)domain
{
  return self->_domain;
}

- (id)clampsKey
{
  v3 = NSString;
  int64_t v4 = [(SBKSyncTransaction *)self type];
  id v5 = [(SBKSyncTransaction *)self transactionProcessor];
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v8 = [(SBKSyncTransaction *)self keysToUpdate];
  id v9 = [v3 stringWithFormat:@"%lld-%@-%lld", v4, v7, objc_msgSend(v8, "count")];

  return v9;
}

- (SBKSyncTransaction)initWithStoreBagContext:(id)a3 syncAnchor:(id)a4 keysToUpdate:(id)a5 keysToDelete:(id)a6 conflictDetectionType:(int64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v15 syncRequestURL];
  v17 = [v15 domain];

  id v18 = [(SBKSyncTransaction *)self initWithSyncRequestURL:v16 domain:v17 syncAnchor:v14 keysToUpdate:v13 keysToDelete:v12 conflictDetectionType:a7];
  return v18;
}

- (SBKSyncTransaction)initWithSyncRequestURL:(id)a3 domain:(id)a4 syncAnchor:(id)a5 keysToUpdate:(id)a6 keysToDelete:(id)a7 conflictDetectionType:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = (__CFString *)a5;
  id v17 = a6;
  id v18 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SBKSyncTransaction;
  uint64_t v19 = [(SBKTransaction *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_syncRequestURL, a3);
    objc_storeStrong((id *)&v20->_domain, a4);
    if (v16) {
      v21 = v16;
    }
    else {
      v21 = @"0";
    }
    objc_storeStrong((id *)&v20->_syncAnchor, v21);
    objc_storeStrong((id *)&v20->_keysToUpdate, a6);
    objc_storeStrong((id *)&v20->_keysToDelete, a7);
    v20->_uint64_t conflictDetectionType = a8;
    v20->_type = 1;
  }

  return v20;
}

@end