@interface PCSCKKS
+ (BOOL)fetchWithTimeout:(unint64_t)a3 error:(id *)a4;
- (BOOL)shouldRetryWithSync:(id)a3;
- (NSString)dsid;
- (PCSCKKS)initWithIdentitySet:(_PCSIdentitySetData *)a3 dsid:(id)a4;
- (_PCSIdentitySetData)set;
- (id)createIdentityOperation:(id)a3;
- (id)ensurePCSFieldsOperation:(id)a3;
- (id)fetchCurrentOperation:(id)a3;
- (id)stripOperationErrorIfPCSError:(id)a3;
- (id)syncViewOperation:(id)a3;
- (void)createIdentity:(id)a3 complete:(id)a4;
- (void)createNewIdentity:(id)a3 roll:(BOOL)a4 sync:(BOOL)a5 forceSync:(BOOL)a6 complete:(id)a7;
- (void)dealloc;
- (void)setDsid:(id)a3;
- (void)setSet:(_PCSIdentitySetData *)a3;
- (void)submitRequest:(id)a3 complete:(id)a4;
@end

@implementation PCSCKKS

+ (BOOL)fetchWithTimeout:(unint64_t)a3 error:(id *)a4
{
  v4 = a4;
  v33[1] = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  v6 = [MEMORY[0x1E4F3B3F8] controlObject:a4];
  if (v6)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __34__PCSCKKS_fetchWithTimeout_error___block_invoke;
    v18 = &unk_1E5E6E688;
    v20 = &v28;
    v21 = &v22;
    v8 = v7;
    v19 = v8;
    [v6 rpcFetchAndProcessChangesIfNoRecentFetch:@"ProtectedCloudStorage" reply:&v15];
    dispatch_time_t v9 = dispatch_time(0, 1000000000 * a3);
    if (dispatch_semaphore_wait(v8, v9))
    {
      if (v4)
      {
        v10 = (void *)MEMORY[0x1E4F28C58];
        v11 = kPCSErrorDomain;
        uint64_t v32 = *MEMORY[0x1E4F28568];
        v33[0] = @"rpcFetchAndProcessChangesIfNoRecentFetch timed out";
        v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1, v15, v16, v17, v18);
        id *v4 = [v10 errorWithDomain:v11 code:99 userInfo:v12];

        LOBYTE(v4) = 0;
      }
    }
    else
    {
      if (v4)
      {
        v13 = (void *)v23[5];
        if (v13) {
          id *v4 = v13;
        }
      }
      LOBYTE(v4) = *((unsigned char *)v29 + 24) != 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return (char)v4;
}

void __34__PCSCKKS_fetchWithTimeout_error___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (PCSCKKS)initWithIdentitySet:(_PCSIdentitySetData *)a3 dsid:(id)a4
{
  id v7 = a4;
  if (PCSCurrentPersonaMatchesDSIDFromSet((uint64_t)a3))
  {
    v11.receiver = self;
    v11.super_class = (Class)PCSCKKS;
    v8 = [(PCSCKKS *)&v11 init];
    if (v8)
    {
      v8->_set = (_PCSIdentitySetData *)CFRetain(a3);
      objc_storeStrong((id *)&v8->_dsid, a4);
    }
    self = v8;
    dispatch_time_t v9 = self;
  }
  else
  {
    dispatch_time_t v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  set = self->_set;
  if (set)
  {
    self->_set = 0;
    CFRelease(set);
  }
  v4.receiver = self;
  v4.super_class = (Class)PCSCKKS;
  [(PCSCKKS *)&v4 dealloc];
}

- (id)syncViewOperation:(id)a3
{
  id v3 = a3;
  objc_super v4 = [[PCSCKKSSyncViewOperation alloc] initWithItemModifyContext:v3];

  return v4;
}

- (id)fetchCurrentOperation:(id)a3
{
  id v3 = a3;
  objc_super v4 = [[PCSCKKSFetchCurrentOperation alloc] initWithItemModifyContext:v3];

  return v4;
}

- (id)ensurePCSFieldsOperation:(id)a3
{
  id v3 = a3;
  objc_super v4 = [[PCSCKKSEnsurePCSFieldsOperation alloc] initWithItemModifyContext:v3];

  return v4;
}

- (id)createIdentityOperation:(id)a3
{
  id v3 = a3;
  objc_super v4 = [[PCSCKKSCreateIdentityOperation alloc] initWithItemModifyContext:v3];

  return v4;
}

- (void)submitRequest:(id)a3 complete:(id)a4
{
  v35[5] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [(PCSCKKS *)self syncViewOperation:v7];
  dispatch_time_t v9 = [(PCSCKKS *)self fetchCurrentOperation:v7];
  [v9 addSuccessDependency:v8];
  v10 = [(PCSCKKS *)self ensurePCSFieldsOperation:v7];
  [v10 addSuccessDependency:v9];
  objc_super v11 = [(PCSCKKS *)self createIdentityOperation:v7];
  [v11 addSuccessDependency:v10];
  v12 = NSString;
  v13 = [v7 service];
  v14 = [v12 stringWithFormat:@"CreateIdentity: %@", v13];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __34__PCSCKKS_submitRequest_complete___block_invoke;
  v24[3] = &unk_1E5E6F398;
  v24[4] = self;
  id v25 = v6;
  id v15 = v6;
  uint64_t v16 = +[PCSCKKSOperation operation:v14 block:v24];
  [v16 addSuccessDependency:v11];
  v17 = [v7 service];

  id v18 = v17;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__5;
  v33 = __Block_byref_object_dispose__5;
  id v34 = 0;
  if (operationQueueForService_once != -1) {
    dispatch_once(&operationQueueForService_once, &__block_literal_global_362);
  }
  v19 = operationQueueForService_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __operationQueueForService_block_invoke_2;
  block[3] = &unk_1E5E6E100;
  id v27 = v18;
  uint64_t v28 = &v29;
  id v20 = v18;
  dispatch_sync(v19, block);
  v21 = v27;
  id v22 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  v35[0] = v16;
  v35[1] = v8;
  v35[2] = v9;
  v35[3] = v10;
  v35[4] = v11;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:5];
  [v22 addOperations:v23 waitUntilFinished:0];
}

void __34__PCSCKKS_submitRequest_complete___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) stripOperationErrorIfPCSError:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (BOOL)shouldRetryWithSync:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = [v3 domain];
  int v5 = [v4 isEqualToString:@"CKErrorDomain"];

  if (!v5)
  {
    id v18 = [v3 domain];
    int v19 = [v18 isEqualToString:@"securityd"];

    if (v19)
    {
      BOOL v20 = [v3 code] == -50;
      goto LABEL_21;
    }
    v21 = [v3 domain];
    int v22 = [v21 isEqualToString:@"CKKSErrorDomain"];

    if (!v22)
    {
      BOOL v17 = 0;
      goto LABEL_31;
    }
    if ([v3 code] == 12 || objc_msgSend(v3, "code") == 13)
    {
      BOOL v17 = 1;
      goto LABEL_31;
    }
LABEL_20:
    BOOL v20 = [v3 code] == 14;
LABEL_21:
    BOOL v17 = v20;
    goto LABEL_31;
  }
  if ([v3 code] != 2) {
    goto LABEL_20;
  }
  id v6 = [v3 userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"CKPartialErrors"];

  if ([v7 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(v8, "objectForKeyedSubscript:", *(void *)(*((void *)&v24 + 1) + 8 * i), (void)v24);
          v14 = [v13 domain];
          int v15 = [v14 isEqualToString:@"CKErrorDomain"];

          if (!v15)
          {

LABEL_28:
            BOOL v17 = 0;
            goto LABEL_29;
          }
          uint64_t v16 = [v13 code];

          if (v16 != 14) {
            goto LABEL_28;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        BOOL v17 = 1;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v17 = 1;
    }
LABEL_29:
  }
  else
  {
    BOOL v17 = 0;
  }

LABEL_31:
  return v17;
}

- (void)createNewIdentity:(id)a3 roll:(BOOL)a4 sync:(BOOL)a5 forceSync:(BOOL)a6 complete:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a7;
  v14 = objc_alloc_init(PCSCKKSItemModifyContext);
  [(PCSCKKSItemModifyContext *)v14 setService:v12];
  [(PCSCKKSItemModifyContext *)v14 setSet:[(PCSCKKS *)self set]];
  int v15 = [(PCSCKKS *)self dsid];
  [(PCSCKKSItemModifyContext *)v14 setDsid:v15];

  [(PCSCKKSItemModifyContext *)v14 setLog:PCSCreateLogContext(@"PCSCreateNewIdentity", 0)];
  [(PCSCKKSItemModifyContext *)v14 setSync:v9];
  [(PCSCKKSItemModifyContext *)v14 setForceSync:v8];
  [(PCSCKKSItemModifyContext *)v14 setRoll:v10];
  if (v10 && (PCSServiceItemTypeIsManatee(v12) & 1) != 0) {
    uint64_t v16 = 5;
  }
  else {
    uint64_t v16 = 1;
  }
  [(PCSCKKSItemModifyContext *)v14 setRetryLeftCount:v16];
  BOOL v17 = (void *)os_transaction_create();
  [(PCSCKKSItemModifyContext *)v14 setTransaction:v17];

  id v18 = +[PCSLockManager manager];
  int v19 = [NSString stringWithUTF8String:"com.apple.protectedcloudstorage.identity-creation"];
  BOOL v20 = [v18 lockAssertion:v19];
  [(PCSCKKSItemModifyContext *)v14 setLockAssertion:v20];

  v21 = [NSString stringWithFormat:@"%s-%@", "com.apple.protectedcloudstorage.identity-creation", v12];
  int v22 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v23 = [v22 beginActivityWithOptions:0x100000 reason:v21];
  [(PCSCKKSItemModifyContext *)v14 setActivityAssertion:v23];

  long long v24 = [(PCSCKKSItemModifyContext *)v14 lockAssertion];
  LOBYTE(v23) = [v24 holdAssertion];

  if ((v23 & 1) == 0)
  {
    PCSMigrationLog((uint64_t)[(PCSCKKSItemModifyContext *)v14 log], @"Failed to get an lock assertion continue w/o one");
    [(PCSCKKSItemModifyContext *)v14 setLockAssertion:0];
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __58__PCSCKKS_createNewIdentity_roll_sync_forceSync_complete___block_invoke;
  v29[3] = &unk_1E5E6F3C0;
  uint64_t v30 = v14;
  id v31 = v12;
  BOOL v33 = v10;
  id v32 = v13;
  id v25 = v13;
  id v26 = v12;
  long long v27 = v14;
  uint64_t v28 = (void *)MEMORY[0x1AD11D080](v29);
  [(PCSCKKS *)self createIdentity:v27 complete:v28];
}

void __58__PCSCKKS_createNewIdentity_roll_sync_forceSync_complete___block_invoke(uint64_t a1, void *a2)
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) mtt];
  [v4 stop];

  int v5 = [*(id *)(a1 + 32) lockAssertion];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) lockAssertion];
    [v6 dropAssertion];

    [*(id *)(a1 + 32) setLockAssertion:0];
  }
  [*(id *)(a1 + 32) setTransaction:0];
  id v7 = [*(id *)(a1 + 32) activityAssertion];

  if (v7)
  {
    BOOL v8 = [MEMORY[0x1E4F28F80] processInfo];
    BOOL v9 = [*(id *)(a1 + 32) activityAssertion];
    [v8 endActivity:v9];

    [*(id *)(a1 + 32) setActivityAssertion:0];
  }
  if ([*(id *)(a1 + 32) roll])
  {
    v48[0] = @"PCSEventKeyCreation";
    v48[1] = @"PCSEventIndividualKeyRoll";
    BOOL v10 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v11 = (__CFString **)v48;
    uint64_t v12 = 2;
  }
  else
  {
    v47 = @"PCSEventKeyCreation";
    BOOL v10 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v11 = &v47;
    uint64_t v12 = 1;
  }
  id v13 = [v10 arrayWithObjects:v11 count:v12];
  v14 = +[PCSAnalytics logger];
  if ([*(id *)(a1 + 32) currentIdentity])
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(v15);
          }
          [v14 logSuccessForEvent:*(void *)(*((void *)&v39 + 1) + 8 * i)];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v17);
    }
  }
  else
  {
    v44[0] = @"roll";
    BOOL v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "roll"));
    v45[0] = v20;
    v44[1] = @"sync";
    v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "sync"));
    v45[1] = v21;
    v44[2] = @"retryLeftCount";
    int v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "retryLeftCount"));
    v45[2] = v22;
    v44[3] = @"lockassertion";
    uint64_t v23 = [NSNumber numberWithBool:v5 != 0];
    v44[4] = @"service";
    uint64_t v24 = *(void *)(a1 + 40);
    v45[3] = v23;
    v45[4] = v24;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:5];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v25 = v13;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v25);
          }
          [v14 logUnrecoverableError:v3 forEvent:*(void *)(*((void *)&v35 + 1) + 8 * j) withAttributes:v15];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v27);
    }
  }
  if (*(unsigned char *)(a1 + 56))
  {
    id v30 = [NSString stringWithFormat:@"com.apple.protectedcloudstorage.roll.%@", *(void *)(a1 + 40)];
    notify_post((const char *)[v30 UTF8String]);
  }
  uint64_t v31 = *(void *)(a1 + 48);
  uint64_t v32 = [*(id *)(a1 + 32) currentIdentity];
  BOOL v33 = [*(id *)(a1 + 32) currentItemReference];
  id v34 = [*(id *)(a1 + 32) mtt];
  (*(void (**)(uint64_t, uint64_t, void *, void *, uint64_t, id))(v31 + 16))(v31, v32, v33, v34, [*(id *)(a1 + 32) returnedExistingIdentity], v3);
}

- (void)createIdentity:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__PCSCKKS_createIdentity_complete___block_invoke;
  v10[3] = &unk_1E5E6F3E8;
  id v11 = v6;
  uint64_t v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PCSCKKS *)self submitRequest:v9 complete:v10];
}

void __35__PCSCKKS_createIdentity_complete___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((int)[*(id *)(a1 + 32) retryLeftCount] >= 1
    && [*(id *)(a1 + 40) shouldRetryWithSync:v4])
  {
    objc_msgSend(*(id *)(a1 + 32), "setRetryLeftCount:", objc_msgSend(*(id *)(a1 + 32), "retryLeftCount") - 1);
    [*(id *)(a1 + 32) resetIdentities];
    [*(id *)(a1 + 32) setSync:1];
    id v3 = [*(id *)(a1 + 32) transaction];
    os_transaction_needs_more_time();

    [*(id *)(a1 + 40) createIdentity:*(void *)(a1 + 32) complete:*(void *)(a1 + 48)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)stripOperationErrorIfPCSError:(id)a3
{
  id v3 = a3;
  if ([v3 code] != 1) {
    goto LABEL_4;
  }
  id v4 = [v3 domain];
  int v5 = [v4 isEqualToString:PCSCKKSOperationErrorDomain];

  if (!v5
    || ([v3 userInfo],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]],
        id v7 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
LABEL_4:
    id v7 = v3;
  }

  return v7;
}

- (_PCSIdentitySetData)set
{
  return self->_set;
}

- (void)setSet:(_PCSIdentitySetData *)a3
{
  self->_set = a3;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDsid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end