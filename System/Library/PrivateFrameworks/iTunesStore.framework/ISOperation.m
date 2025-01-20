@interface ISOperation
- (BOOL)copyAccountID:(id *)a3 credentialSource:(unint64_t *)a4 byAuthenticatingWithContext:(id)a5 returningError:(id *)a6;
- (BOOL)copyAccountID:(id *)a3 credentialSource:(unint64_t *)a4 byHandlingAuthenticateResponse:(id)a5 returningError:(id *)a6;
- (BOOL)loadSoftwareMapReturningError:(id *)a3;
- (BOOL)loadURLBagWithContext:(id)a3 returningError:(id *)a4;
- (BOOL)runSubOperation:(id)a3 onQueue:(id)a4 error:(id *)a5;
- (BOOL)runSubOperation:(id)a3 returningError:(id *)a4;
- (BOOL)shouldFailAfterUniquePredecessorError:(id)a3;
- (BOOL)shouldMessageMainThread;
- (BOOL)shouldRunWithBackgroundPriority;
- (BOOL)stopRunLoop;
- (BOOL)success;
- (ISOperation)init;
- (ISOperation)parentOperation;
- (ISOperationDelegate)delegate;
- (NSArray)serializationLockIdentifiers;
- (NSError)error;
- (NSRunLoop)operationRunLoop;
- (NSString)powerAssertionIdentifier;
- (NSString)uniqueKey;
- (SSOperationProgress)progress;
- (id)authenticatedAccountDSID;
- (id)copyActivePowerAssertionIdentifiers;
- (id)copySerializationLocks;
- (id)loadedURLBagWithContext:(id)a3 accountDSID:(id)a4 returningError:(id *)a5;
- (id)loadedURLBagWithContext:(id)a3 returningError:(id *)a4;
- (int)runRunLoopUntilStopped;
- (int64_t)progressWeight;
- (unint64_t)authenticatedAccountCredentialSource;
- (void)_addSubOperation:(id)a3;
- (void)_failAfterException;
- (void)_main:(BOOL)a3;
- (void)_removeSubOperation:(id)a3;
- (void)_sendErrorToDelegate:(id)a3;
- (void)_sendSuccessToDelegate;
- (void)_sendWillStartToDelegate;
- (void)cancel;
- (void)delegateDispatch:(id)a3;
- (void)dispatchCompletionBlock;
- (void)lock;
- (void)main;
- (void)releasePowerAssertionsDuringBlock:(id)a3;
- (void)run;
- (void)run:(BOOL)a3;
- (void)sendDidTakeSerializationLocks;
- (void)sendProgressToDelegate;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setOperationRunLoop:(id)a3;
- (void)setParentOperation:(id)a3;
- (void)setPowerAssertionIdentifier:(id)a3;
- (void)setSerializationLockIdentifiers:(id)a3;
- (void)setShouldMessageMainThread:(BOOL)a3;
- (void)setShouldRunWithBackgroundPriority:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)unlock;
@end

@implementation ISOperation

- (ISOperation)init
{
  __ISRecordSPIClassUsage(self);
  v7.receiver = self;
  v7.super_class = (Class)ISOperation;
  v3 = [(ISOperation *)&v7 init];
  if (v3)
  {
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v3->_lock;
    v3->_lock = v4;
  }
  return v3;
}

- (SSOperationProgress)progress
{
  [(ISOperation *)self lock];
  v3 = self->_progress;
  [(ISOperation *)self unlock];

  return v3;
}

- (int64_t)progressWeight
{
  return 1;
}

- (void)run
{
  [(ISOperation *)self setError:0];

  [(ISOperation *)self setSuccess:1];
}

- (int)runRunLoopUntilStopped
{
  v3 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__keepAliveTimer_ selector:0 userInfo:0 repeats:1.79769313e308];
  self->_stopped = 0;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE88];
  do
  {
    v5 = (void *)MEMORY[0x2166C7A20]();
    CFRunLoopRunResult v6 = CFRunLoopRunInMode(v4, 10.0, 1u);
  }
  while (!self->_stopped && (v6 - 1) > 1);
  [v3 invalidate];

  return v6;
}

- (BOOL)runSubOperation:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  if (([v6 isCancelled] & 1) == 0)
  {
    [v6 setParentOperation:self];
    [(ISOperation *)self lock];
    [(ISOperation *)self _addSubOperation:v6];
    [(ISOperation *)self unlock];
    objc_super v7 = +[ISUniqueOperationManager sharedInstance];
    [v7 checkInOperation:v6];

    [v6 main];
    [v6 dispatchCompletionBlock];
    [v6 setParentOperation:0];
    [(ISOperation *)self lock];
    [(ISOperation *)self _removeSubOperation:v6];
    [(ISOperation *)self unlock];
  }
  if (a4)
  {
    *a4 = [v6 error];
  }
  char v8 = [v6 success];

  return v8;
}

- (BOOL)runSubOperation:(id)a3 onQueue:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (([v8 isCancelled] & 1) == 0)
  {
    [v8 setParentOperation:self];
    [(ISOperation *)self lock];
    [(ISOperation *)self _addSubOperation:v8];
    [(ISOperation *)self unlock];
    v10 = [MEMORY[0x263EFF8C0] arrayWithObject:v8];
    [v9 addOperations:v10 waitUntilFinished:1];

    [v8 setParentOperation:0];
    [(ISOperation *)self lock];
    [(ISOperation *)self _removeSubOperation:v8];
    [(ISOperation *)self unlock];
  }
  if (a5)
  {
    *a5 = [v8 error];
  }
  char v11 = [v8 success];

  return v11;
}

- (BOOL)stopRunLoop
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [(ISOperation *)self lock];
  v3 = (void *)[(NSMutableArray *)self->_subOperations copy];
  [(ISOperation *)self unlock];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v16 + 1) + 8 * i) stopRunLoop])
        {
          BOOL v11 = 1;
          v10 = v4;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v9 = [(ISOperation *)self operationRunLoop];
  v10 = v9;
  BOOL v11 = v9 != 0;
  if (v9)
  {
    v12 = (__CFRunLoop *)[v9 getCFRunLoop];
    v13 = (const void *)*MEMORY[0x263EFFE88];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26__ISOperation_stopRunLoop__block_invoke;
    block[3] = &unk_264260B08;
    block[4] = self;
    CFRunLoopPerformBlock(v12, v13, block);
    CFRunLoopWakeUp(v12);
    CFRunLoopStop(v12);
    BOOL v11 = 1;
  }
LABEL_12:

  return v11;
}

uint64_t __26__ISOperation_stopRunLoop__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 329) = 1;
  return result;
}

- (ISOperationDelegate)delegate
{
  [(ISOperation *)self lock];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(ISOperation *)self unlock];

  return (ISOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  [(ISOperation *)self lock];
  objc_storeWeak((id *)&self->_delegate, v4);

  [(ISOperation *)self unlock];
}

- (void)setShouldMessageMainThread:(BOOL)a3
{
  [(ISOperation *)self lock];
  self->_shouldMessageMainThread = a3;

  [(ISOperation *)self unlock];
}

- (BOOL)shouldFailAfterUniquePredecessorError:(id)a3
{
  return 1;
}

- (BOOL)shouldMessageMainThread
{
  [(ISOperation *)self lock];
  BOOL shouldMessageMainThread = self->_shouldMessageMainThread;
  [(ISOperation *)self unlock];
  return shouldMessageMainThread;
}

- (NSString)uniqueKey
{
  return 0;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)ISOperation;
  [(ISOperation *)&v4 cancel];
  [(ISOperation *)self lock];
  v3 = (void *)[(NSMutableArray *)self->_subOperations copy];
  [(ISOperation *)self unlock];
  [v3 makeObjectsPerformSelector:sel_cancel];
  [(ISOperation *)self stopRunLoop];
}

- (void)main
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  v74 = AMSGenerateLogCorrelationKey();
  v3 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v3)
  {
    v3 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    v4 |= 2u;
  }
  uint64_t v5 = [v3 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (v4)
  {
    int v75 = 138543618;
    id v76 = (id)objc_opt_class();
    __int16 v77 = 2114;
    uint64_t v78 = (uint64_t)v74;
    id v6 = v76;
    LODWORD(v72) = 22;
    v69 = &v75;
    uint64_t v7 = (void *)_os_log_send_and_compose_impl();

    if (v7)
    {
      objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v75, v72);
      id v8 = (int *)objc_claimAutoreleasedReturnValue();
      free(v7);
      v69 = v8;
      SSFileLog();
    }
  }
  else
  {
  }
  id v9 = [(ISOperation *)self uniqueKey];
  if (v9)
  {
    v10 = [MEMORY[0x263F08A48] currentQueue];
    BOOL v11 = ISUniqueOperationLock((uint64_t)v9, (uint64_t)self, v10);

    if (!v11
      || ([v11 success] & 1) != 0
      || ([v11 error],
          v12 = objc_claimAutoreleasedReturnValue(),
          BOOL v13 = [(ISOperation *)self shouldFailAfterUniquePredecessorError:v12], v12, !v13))
    {
      uint64_t v21 = 0;
      goto LABEL_27;
    }
    v14 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v14)
    {
      v14 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v15 = objc_msgSend(v14, "shouldLog", v69);
    if ([v14 shouldLogToDisk]) {
      v15 |= 2u;
    }
    long long v16 = [v14 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      v15 &= 2u;
    }
    if (v15)
    {
      long long v17 = objc_opt_class();
      int v75 = 138412290;
      id v76 = v17;
      id v18 = v17;
      LODWORD(v72) = 12;
      v69 = &v75;
      long long v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_25:

        v20 = [v11 error];
        [(ISOperation *)self setError:v20];

        uint64_t v21 = 1;
LABEL_27:

        goto LABEL_29;
      }
      long long v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v75, v72);
      free(v19);
      v69 = (int *)v16;
      SSFileLog();
    }

    goto LABEL_25;
  }
  uint64_t v21 = 0;
LABEL_29:
  v22 = [(ISOperation *)self powerAssertionIdentifier];
  if (v22)
  {
    v23 = +[ISDevice sharedInstance];
    int v24 = [v23 takePowerAssertion:v22];
  }
  else
  {
    int v24 = 0;
  }
  if (![(ISOperation *)self shouldRunWithBackgroundPriority]
    || (*__error() = 0, int v25 = getpriority(3, 0), *__error())
    || setpriority(3, 0, 4096))
  {
    BOOL v26 = 0;
    goto LABEL_36;
  }
  v53 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v53)
  {
    v53 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v54 = [v53 shouldLog];
  if ([v53 shouldLogToDisk]) {
    v54 |= 2u;
  }
  v55 = [v53 OSLogObject];
  BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG);
  int v57 = v54 & 2;
  if (v56) {
    int v57 = v54;
  }
  if (!v57) {
    goto LABEL_83;
  }
  v58 = objc_opt_class();
  v59 = v55;
  v60 = v53;
  int v61 = v24;
  int v62 = v25;
  v63 = (void *)MEMORY[0x263F08B88];
  id v73 = v58;
  v64 = v63;
  int v25 = v62;
  int v24 = v61;
  v53 = v60;
  v65 = v59;
  uint64_t v66 = [v64 currentThread];
  int v75 = 138412546;
  id v76 = v58;
  __int16 v77 = 2048;
  uint64_t v78 = v66;
  LODWORD(v72) = 22;
  v70 = &v75;
  v67 = (void *)v66;
  v68 = (void *)_os_log_send_and_compose_impl();

  if (v68)
  {
    v55 = objc_msgSend(NSString, "stringWithCString:encoding:", v68, 4, &v75, v72);
    free(v68);
    v70 = (int *)v55;
    SSFileLog();
LABEL_83:
  }
  BOOL v26 = v25 == 0;
LABEL_36:
  -[ISOperation _main:](self, "_main:", v21, v70);
  if (v24)
  {
    v27 = +[ISDevice sharedInstance];
    [v27 releasePowerAssertion:v22];
  }
  if (v26)
  {
    v28 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v28)
    {
      v28 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v29 = [v28 shouldLog];
    int v30 = [v28 shouldLogToDisk];
    v31 = [v28 OSLogObject];
    v32 = v31;
    if (v30) {
      v29 |= 2u;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      int v33 = v29;
    }
    else {
      int v33 = v29 & 2;
    }
    if (v33)
    {
      id v34 = (id)objc_opt_class();
      v35 = [MEMORY[0x263F08B88] currentThread];
      int v75 = 138412546;
      id v76 = v34;
      __int16 v77 = 2048;
      uint64_t v78 = (uint64_t)v35;
      LODWORD(v72) = 22;
      v71 = &v75;
      v36 = (void *)_os_log_send_and_compose_impl();

      if (!v36)
      {
LABEL_50:

        setpriority(3, 0, 0);
        goto LABEL_51;
      }
      v32 = objc_msgSend(NSString, "stringWithCString:encoding:", v36, 4, &v75, v72);
      free(v36);
      v71 = (int *)v32;
      SSFileLog();
    }

    goto LABEL_50;
  }
LABEL_51:
  if (v9)
  {
    v37 = [MEMORY[0x263F08A48] currentQueue];
    ISUniqueOperationUnlock((uint64_t)v9, (uint64_t)self, v37);
  }
  v38 = +[ISUniqueOperationManager sharedInstance];
  [v38 checkOutOperation:self];

  v39 = [(ISOperation *)self error];

  if (v39)
  {
    v40 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v40)
    {
      v40 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v41 = [v40 shouldLog];
    int v42 = [v40 shouldLogToDisk];
    v43 = [v40 OSLogObject];
    v44 = v43;
    if (v42) {
      v41 |= 2u;
    }
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      v41 &= 2u;
    }
    if (!v41) {
      goto LABEL_72;
    }
    v45 = objc_opt_class();
    int v75 = 138543618;
    id v76 = v45;
    __int16 v77 = 2114;
    uint64_t v78 = (uint64_t)v74;
    id v46 = v45;
    LODWORD(v72) = 22;
    v47 = (void *)_os_log_send_and_compose_impl();

    if (v47)
    {
LABEL_71:
      v44 = objc_msgSend(NSString, "stringWithCString:encoding:", v47, 4, &v75, v72);
      free(v47);
      SSFileLog();
LABEL_72:
    }
  }
  else
  {
    v40 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v40)
    {
      v40 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v48 = [v40 shouldLog];
    int v49 = [v40 shouldLogToDisk];
    v50 = [v40 OSLogObject];
    v44 = v50;
    if (v49) {
      v48 |= 2u;
    }
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
      v48 &= 2u;
    }
    if (!v48) {
      goto LABEL_72;
    }
    v51 = objc_opt_class();
    int v75 = 138543618;
    id v76 = v51;
    __int16 v77 = 2114;
    uint64_t v78 = (uint64_t)v74;
    id v52 = v51;
    LODWORD(v72) = 22;
    v47 = (void *)_os_log_send_and_compose_impl();

    if (v47) {
      goto LABEL_71;
    }
  }
}

- (id)copyActivePowerAssertionIdentifiers
{
  v3 = [(ISOperation *)self parentOperation];
  int v4 = v3;
  if (v3) {
    id v5 = (id)[v3 copyActivePowerAssertionIdentifiers];
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  id v6 = v5;
  uint64_t v7 = [(ISOperation *)self powerAssertionIdentifier];
  if (v7) {
    [v6 addObject:v7];
  }

  return v6;
}

- (id)copySerializationLocks
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(ISOperation *)self serializationLockIdentifiers];
  if ([v2 count])
  {
    v3 = +[ISUniqueOperationManager sharedInstance];
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v2;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(v3, "lockWithIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * v9), (void)v12);
          [v4 addObject:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)delegateDispatch:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(ISOperation *)self shouldMessageMainThread])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__ISOperation_delegateDispatch___block_invoke;
    block[3] = &unk_264260B30;
    uint64_t v6 = v4;
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __32__ISOperation_delegateDispatch___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dispatchCompletionBlock
{
  v3 = [(ISOperation *)self completionBlock];

  if (v3)
  {
    id v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__ISOperation_dispatchCompletionBlock__block_invoke;
    block[3] = &unk_264260B08;
    void block[4] = self;
    dispatch_async(v4, block);
  }
}

void __38__ISOperation_dispatchCompletionBlock__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) completionBlock];
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }
}

- (void)lock
{
}

- (void)releasePowerAssertionsDuringBlock:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  id v5 = [(ISOperation *)self copyActivePowerAssertionIdentifiers];
  uint64_t v6 = +[ISDevice sharedInstance];
  uint64_t v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    v9 &= 2u;
  }
  if (v9)
  {
    BOOL v11 = objc_opt_class();
    id v12 = v11;
    int v35 = 138412546;
    v36 = v11;
    __int16 v37 = 2048;
    uint64_t v38 = [v5 count];
    LODWORD(v24) = 22;
    v23 = &v35;
    long long v13 = (void *)_os_log_send_and_compose_impl();

    if (v13)
    {
      objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v35, v24);
      long long v14 = (int *)objc_claimAutoreleasedReturnValue();
      free(v13);
      v23 = v14;
      SSFileLog();
    }
  }
  else
  {
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(v6, "releasePowerAssertion:", *(void *)(*((void *)&v29 + 1) + 8 * i), v23);
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v16);
  }

  v4[2](v4);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v19 = v15;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend(v6, "takePowerAssertion:", *(void *)(*((void *)&v25 + 1) + 8 * j), v23);
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }
}

- (void)run:(BOOL)a3
{
  if (!a3) {
    [(ISOperation *)self run];
  }
}

- (void)sendDidTakeSerializationLocks
{
  v3 = [(ISOperation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __44__ISOperation_sendDidTakeSerializationLocks__block_invoke;
    v4[3] = &unk_264260B58;
    id v5 = v3;
    uint64_t v6 = self;
    [(ISOperation *)self delegateDispatch:v4];
  }
}

uint64_t __44__ISOperation_sendDidTakeSerializationLocks__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) operationDidTakeSerializationLocks:*(void *)(a1 + 40)];
}

- (void)sendProgressToDelegate
{
  v3 = [(ISOperation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [(ISOperation *)self lock];
    id v4 = (void *)[(SSOperationProgress *)self->_progress copy];
    [(ISOperation *)self unlock];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __37__ISOperation_sendProgressToDelegate__block_invoke;
    v6[3] = &unk_264260B80;
    id v7 = v3;
    int v8 = self;
    id v9 = v4;
    id v5 = v4;
    [(ISOperation *)self delegateDispatch:v6];
  }
}

uint64_t __37__ISOperation_sendProgressToDelegate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) operation:*(void *)(a1 + 40) updatedProgress:*(void *)(a1 + 48)];
}

- (NSArray)serializationLockIdentifiers
{
  [(ISOperation *)self lock];
  v3 = self->_serializationLockIdentifiers;
  [(ISOperation *)self unlock];

  return v3;
}

- (void)setSerializationLockIdentifiers:(id)a3
{
  uint64_t v6 = (NSArray *)a3;
  [(ISOperation *)self lock];
  if (self->_serializationLockIdentifiers != v6)
  {
    id v4 = (NSArray *)[(NSArray *)v6 copy];
    serializationLockIdentifiers = self->_serializationLockIdentifiers;
    self->_serializationLockIdentifiers = v4;
  }
  [(ISOperation *)self unlock];
}

- (void)unlock
{
}

- (void)_addSubOperation:(id)a3
{
  id v4 = a3;
  subOperations = self->_subOperations;
  id v8 = v4;
  if (!subOperations)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v7 = self->_subOperations;
    self->_subOperations = v6;

    id v4 = v8;
    subOperations = self->_subOperations;
  }
  [(NSMutableArray *)subOperations addObject:v4];
}

- (void)_failAfterException
{
  uint64_t v3 = [(ISOperation *)self error];
  if (!v3)
  {
    ISError(0, 0, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(ISOperation *)self setError:v4];
    uint64_t v3 = (uint64_t)v4;
  }
  id v5 = (id)v3;
  [(ISOperation *)self _sendErrorToDelegate:v3];
}

- (void)_main:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [(ISOperation *)self setOperationRunLoop:v5];

  uint64_t v6 = [(ISOperation *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    [(ISOperation *)self lock];
    id v8 = (SSOperationProgress *)objc_alloc_init(MEMORY[0x263F7B2A0]);
    progress = self->_progress;
    self->_progress = v8;

    [(SSOperationProgress *)self->_progress setMaxValue:1];
    [(ISOperation *)self unlock];
    [(ISOperation *)self sendProgressToDelegate];
  }
  [(ISOperation *)self _sendWillStartToDelegate];
  [(ISOperation *)self run:v3];
  if ([(ISOperation *)self success])
  {
    if (v7)
    {
      [(ISOperation *)self lock];
      [(SSOperationProgress *)self->_progress setCurrentValue:[(SSOperationProgress *)self->_progress maxValue]];
      [(SSOperationProgress *)self->_progress setEstimatedTimeRemaining:-1.0];
      [(ISOperation *)self unlock];
      [(ISOperation *)self sendProgressToDelegate];
    }
    [(ISOperation *)self _sendSuccessToDelegate];
  }
  else
  {
    v10 = [(ISOperation *)self error];
    [(ISOperation *)self _sendErrorToDelegate:v10];
  }
  [(ISOperation *)self lock];
  BOOL v11 = self->_progress;
  self->_progress = 0;

  [(ISOperation *)self unlock];

  [(ISOperation *)self setOperationRunLoop:0];
}

- (void)_removeSubOperation:(id)a3
{
}

- (void)_sendErrorToDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(ISOperation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__ISOperation__sendErrorToDelegate___block_invoke;
    v6[3] = &unk_264260B80;
    id v7 = v5;
    id v8 = self;
    id v9 = v4;
    [(ISOperation *)self delegateDispatch:v6];
  }
}

uint64_t __36__ISOperation__sendErrorToDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) operation:*(void *)(a1 + 40) failedWithError:*(void *)(a1 + 48)];
}

- (void)_sendSuccessToDelegate
{
  BOOL v3 = [(ISOperation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __37__ISOperation__sendSuccessToDelegate__block_invoke;
    v4[3] = &unk_264260B58;
    id v5 = v3;
    uint64_t v6 = self;
    [(ISOperation *)self delegateDispatch:v4];
  }
}

uint64_t __37__ISOperation__sendSuccessToDelegate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) operationFinished:*(void *)(a1 + 40)];
}

- (void)_sendWillStartToDelegate
{
  BOOL v3 = [(ISOperation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __39__ISOperation__sendWillStartToDelegate__block_invoke;
    v4[3] = &unk_264260B58;
    id v5 = v3;
    uint64_t v6 = self;
    [(ISOperation *)self delegateDispatch:v4];
  }
}

uint64_t __39__ISOperation__sendWillStartToDelegate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) operationWillStart:*(void *)(a1 + 40)];
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 256, 1);
}

- (void)setError:(id)a3
{
}

- (NSRunLoop)operationRunLoop
{
  return (NSRunLoop *)objc_getProperty(self, a2, 272, 1);
}

- (void)setOperationRunLoop:(id)a3
{
}

- (ISOperation)parentOperation
{
  return (ISOperation *)objc_getProperty(self, a2, 280, 1);
}

- (void)setParentOperation:(id)a3
{
}

- (NSString)powerAssertionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (void)setPowerAssertionIdentifier:(id)a3
{
}

- (BOOL)shouldRunWithBackgroundPriority
{
  return self->_shouldRunWithBackgroundPriority;
}

- (void)setShouldRunWithBackgroundPriority:(BOOL)a3
{
  self->_shouldRunWithBackgroundPriority = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subOperations, 0);
  objc_storeStrong((id *)&self->_serializationLockIdentifiers, 0);
  objc_storeStrong((id *)&self->_powerAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_parentOperation, 0);
  objc_storeStrong((id *)&self->_operationRunLoop, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id)loadedURLBagWithContext:(id)a3 accountDSID:(id)a4 returningError:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [[ISLoadURLBagOperation alloc] initWithBagContext:v9];

  [(ISLoadURLBagOperation *)v10 setAccountDSID:v8];
  id v14 = 0;
  LODWORD(v8) = [(ISOperation *)self runSubOperation:v10 returningError:&v14];
  id v11 = v14;
  id v12 = 0;
  if (v8)
  {
    id v12 = [(ISLoadURLBagOperation *)v10 URLBag];
  }
  if (a5 && !v12) {
    *a5 = v11;
  }

  return v12;
}

- (id)loadedURLBagWithContext:(id)a3 returningError:(id *)a4
{
  return [(ISOperation *)self loadedURLBagWithContext:a3 accountDSID:0 returningError:a4];
}

- (BOOL)loadURLBagWithContext:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  id v7 = [[ISLoadURLBagOperation alloc] initWithBagContext:v6];

  id v12 = 0;
  BOOL v8 = [(ISOperation *)self runSubOperation:v7 returningError:&v12];
  id v9 = v12;
  v10 = v9;
  if (a4) {
    *a4 = v9;
  }

  return v8;
}

- (BOOL)loadSoftwareMapReturningError:(id *)a3
{
  BOOL v8 = 0;
  id v5 = objc_alloc_init(ISLoadSoftwareMapOperation);
  BOOL v6 = [(ISOperation *)self runSubOperation:v5 returningError:&v8];

  if (a3) {
    *a3 = v8;
  }
  return v6;
}

- (unint64_t)authenticatedAccountCredentialSource
{
  v2 = [(ISOperation *)self parentOperation];

  return [(ISOperation *)v2 authenticatedAccountCredentialSource];
}

- (id)authenticatedAccountDSID
{
  v2 = [(ISOperation *)self parentOperation];

  return [(ISOperation *)v2 authenticatedAccountDSID];
}

- (BOOL)copyAccountID:(id *)a3 credentialSource:(unint64_t *)a4 byAuthenticatingWithContext:(id)a5 returningError:(id *)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v21 = 0;
  v10 = [[ISStoreAuthenticateOperation alloc] initWithAuthenticationContext:a5];
  if (v10)
  {
    if ([(ISOperation *)self runSubOperation:v10 returningError:&v21])
    {
      id v11 = [(ISStoreAuthenticateOperation *)v10 authenticatedAccountDSID];
      unint64_t v12 = [(ISOperation *)v10 authenticatedAccountCredentialSource];
      BOOL v13 = 1;
    }
    else
    {
      unint64_t v12 = 0;
      id v11 = 0;
      BOOL v13 = 0;
    }
  }
  else
  {
    id v14 = (void *)[MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
    if (!v14) {
      id v14 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v16 &= 2u;
    }
    if (v16)
    {
      int v22 = 138543362;
      uint64_t v23 = objc_opt_class();
      LODWORD(v20) = 12;
      uint64_t v17 = _os_log_send_and_compose_impl();
      if (v17)
      {
        id v18 = (void *)v17;
        objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v22, v20);
        free(v18);
        SSFileLog();
      }
    }
    unint64_t v12 = 0;
    id v11 = 0;
    BOOL v13 = 0;
    uint64_t v21 = (void *)ISError(4, 0, 0);
  }

  if (a3)
  {
    *a3 = v11;
    if (!a4) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  if (a4) {
LABEL_18:
  }
    *a4 = v12;
LABEL_19:
  if (a6) {
    *a6 = v21;
  }
  return v13;
}

- (BOOL)copyAccountID:(id *)a3 credentialSource:(unint64_t *)a4 byHandlingAuthenticateResponse:(id)a5 returningError:(id *)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  uint64_t v10 = [a5 responseDictionary];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = (void *)[MEMORY[0x263F7B1F8] sharedDaemonConfigOversize];
    if (!v11) {
      id v11 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v13 &= 2u;
    }
    if (v13)
    {
      int v25 = 138412546;
      uint64_t v26 = objc_opt_class();
      __int16 v27 = 2112;
      uint64_t v28 = v10;
      LODWORD(v23) = 22;
      int v22 = &v25;
      uint64_t v14 = _os_log_send_and_compose_impl();
      if (v14)
      {
        int v15 = (void *)v14;
        uint64_t v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v25, v23);
        free(v15);
        int v22 = (int *)v16;
        SSFileLog();
      }
    }
  }
  BOOL v17 = +[ISStoreAuthenticateOperation _copyErrorForAuthenticateResponse:error:](ISStoreAuthenticateOperation, "_copyErrorForAuthenticateResponse:error:", a5, &v24, v22);
  if (v17)
  {
    id v18 = (id)objc_msgSend((id)objc_msgSend(a5, "authenticatedAccount"), "uniqueIdentifier");
    unint64_t v19 = [a5 credentialSource];
    if (a3) {
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v19 = 0;
    id v18 = 0;
    if (a3)
    {
LABEL_14:
      *a3 = v18;
      if (!a4) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }

  if (a4) {
LABEL_15:
  }
    *a4 = v19;
LABEL_16:
  if (a6) {
    char v20 = v17;
  }
  else {
    char v20 = 1;
  }
  if ((v20 & 1) == 0) {
    *a6 = v24;
  }
  return v17;
}

@end