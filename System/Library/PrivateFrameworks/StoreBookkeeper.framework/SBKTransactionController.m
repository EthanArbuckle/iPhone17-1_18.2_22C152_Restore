@interface SBKTransactionController
- (BOOL)_delegateShouldScheduleTransaction:(id)a3 error:(id *)a4;
- (BOOL)_delegateTransactionDidFail:(id)a3 withError:(id)a4;
- (BOOL)_onQueue_authenticationCanProcessTransaction:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_canScheduleTransaction:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_clampsCanScheduleTransaction:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_isEnabledForTransaction:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_isIdle;
- (BOOL)_sendFinishedBlockForTransaction:(id)a3 success:(BOOL)a4 cancelled:(BOOL)a5 error:(id)a6 handledAsFinishedBlock:(BOOL *)a7;
- (BOOL)isEnabled;
- (BOOL)isIdle;
- (BOOL)isResolvingError;
- (BOOL)shouldAuthenticateIfNecessary;
- (MSVTaskAssertion)backgroundTaskAssertion;
- (NSMutableArray)pendingTransactions;
- (NSOperationQueue)operationQueue;
- (NSString)domain;
- (NSURL)requestURL;
- (OS_dispatch_queue)queue;
- (SBKStoreAuthenticationController)authenticationController;
- (SBKTransaction)currentTransaction;
- (SBKTransactionController)initWithDomain:(id)a3 requestURL:(id)a4;
- (SBKTransactionController)initWithDomain:(id)a3 requestURL:(id)a4 forAccount:(id)a5;
- (SBKTransactionControllerDelegate)delegate;
- (SSAccount)account;
- (id)_onQueue_clampsController;
- (id)networkTypeObserver;
- (int64_t)conflictResolutionAttempts;
- (void)_beginBackgroundTask;
- (void)_delegateTransactionDidCancel:(id)a3 withError:(id)a4;
- (void)_delegateTransactionDidFinish:(id)a3;
- (void)_endBackgroundTask;
- (void)_enqueueStoreOperation:(id)a3;
- (void)_networkTypeChangedNotification:(id)a3;
- (void)_onQueue_addPendingTransaction:(id)a3;
- (void)_onQueue_assertIsTransactionValid:(id)a3 error:(id *)a4;
- (void)_onQueue_beginBackgroundTask;
- (void)_onQueue_cancelAllPendingTransactions:(id)a3;
- (void)_onQueue_cancelTransaction:(id)a3 error:(id)a4;
- (void)_onQueue_currentTransactionDidFinish;
- (void)_onQueue_endBackgroundTask;
- (void)_onQueue_performCancelErrorHandlingForError:(id)a3;
- (void)_onQueue_performDefaultErrorHandlingForError:(id)a3;
- (void)_onQueue_performRetryErrorHandlingForError:(id)a3;
- (void)_onQueue_processCurrentTransaction;
- (void)_onQueue_processOperationOutput:(id)a3 operation:(id)a4 operationAuthenticated:(BOOL)a5;
- (void)_onQueue_processPendingTransactions;
- (void)_onQueue_resolveError:(id)a3 resolution:(int)a4;
- (void)_onQueue_scheduleTransaction:(id)a3 isRetry:(BOOL)a4;
- (void)_onQueue_transactionDidCancel:(id)a3 withError:(id)a4;
- (void)_onQueue_transactionDidFail:(id)a3 withError:(id)a4;
- (void)_processDataInResponse:(id)a3;
- (void)_resolveError:(id)a3 resolution:(int)a4;
- (void)_storeOperationDidComplete:(id)a3;
- (void)cancelAllTransactions;
- (void)cancelAllTransactionsCancelCode:(int64_t)a3;
- (void)cancelScheduledTransaction:(id)a3;
- (void)dealloc;
- (void)operation:(id)a3 didReceiveResponse:(id)a4;
- (void)operation:(id)a3 failedWithError:(id)a4;
- (void)operation:(id)a3 finishedWithOutput:(id)a4;
- (void)scheduleTransaction:(id)a3;
- (void)scheduleTransaction:(id)a3 withTransactionFinishedBlock:(id)a4;
- (void)setAuthenticationController:(id)a3;
- (void)setBackgroundTaskAssertion:(id)a3;
- (void)setConflictResolutionAttempts:(int64_t)a3;
- (void)setCurrentTransaction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDomain:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIsResolvingError:(BOOL)a3;
- (void)setNetworkTypeObserver:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPendingTransactions:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestURL:(id)a3;
- (void)setShouldAuthenticateIfNecessary:(BOOL)a3;
@end

@implementation SBKTransactionController

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_networkTypeObserver);
  objc_storeStrong((id *)&self->_backgroundTaskAssertion, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setConflictResolutionAttempts:(int64_t)a3
{
  self->_conflictResolutionAttempts = a3;
}

- (int64_t)conflictResolutionAttempts
{
  return self->_conflictResolutionAttempts;
}

- (void)setNetworkTypeObserver:(id)a3
{
}

- (id)networkTypeObserver
{
  id WeakRetained = objc_loadWeakRetained(&self->_networkTypeObserver);
  return WeakRetained;
}

- (void)setBackgroundTaskAssertion:(id)a3
{
}

- (MSVTaskAssertion)backgroundTaskAssertion
{
  return self->_backgroundTaskAssertion;
}

- (void)setIsResolvingError:(BOOL)a3
{
  self->_isResolvingError = a3;
}

- (BOOL)isResolvingError
{
  return self->_isResolvingError;
}

- (void)setPendingTransactions:(id)a3
{
}

- (NSMutableArray)pendingTransactions
{
  return self->_pendingTransactions;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setCurrentTransaction:(id)a3
{
}

- (SBKTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setShouldAuthenticateIfNecessary:(BOOL)a3
{
  self->_shouldAuthenticateIfNecessary = a3;
}

- (BOOL)shouldAuthenticateIfNecessary
{
  return self->_shouldAuthenticateIfNecessary;
}

- (void)setAuthenticationController:(id)a3
{
}

- (SBKStoreAuthenticationController)authenticationController
{
  return self->_authenticationController;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (SSAccount)account
{
  return self->_account;
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDelegate:(id)a3
{
}

- (SBKTransactionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBKTransactionControllerDelegate *)WeakRetained;
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = self->_currentTransaction;
  if ([v7 code] == 16)
  {
    v9 = +[SBKStoreError userCancelledSignInErrorWithTransaction:v8 underlyingError:v7];
    char v10 = 1;
    v11 = @"User cancelled sign-in";
  }
  else if ([v7 code] == 5)
  {
    v9 = +[SBKStoreError userEnteredWrongCredentialsErrorWithTransaction:v8 underlyingError:v7];
    char v10 = 1;
    v11 = @"User entered wrong credentials";
  }
  else
  {
    v12 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v6 requestProperties];
      v14 = [v13 URL];
      *(_DWORD *)buf = 138412546;
      v26 = v14;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_impl(&dword_22B807000, v12, OS_LOG_TYPE_DEFAULT, "Operation failedWithError: %@ -- inputError = %@", buf, 0x16u);
    }
    v9 = +[SBKStoreError unknownErrorWithTransaction:v8 underlyingError:v7];
    v11 = 0;
    char v10 = 0;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SBKTransactionController_operation_failedWithError___block_invoke;
  block[3] = &unk_2648AF0A0;
  char v23 = v10;
  v19 = v11;
  v20 = self;
  char v24 = v10;
  v21 = v8;
  id v22 = v9;
  id v16 = v9;
  v17 = v8;
  dispatch_async(queue, block);
}

void __54__SBKTransactionController_operation_failedWithError___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v3;
      _os_log_impl(&dword_22B807000, v2, OS_LOG_TYPE_DEFAULT, "[StoreBookkeeper] %@.  Will suppress authentication dialogs for a while.", (uint8_t *)&v7, 0xCu);
    }

    v4 = objc_msgSend(*(id *)(a1 + 40), "_onQueue_clampsController");
    [v4 setUserCancelledSignIn];
  }
  if (*(unsigned char *)(a1 + 65) && [*(id *)(*(void *)(a1 + 40) + 48) shouldAuthenticate])
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "_onQueue_clampsController");
    [v5 setAuthenticationRequest];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    objc_msgSend(*(id *)(a1 + 40), "_onQueue_transactionDidFail:withError:", v6, *(void *)(a1 + 56));
  }
}

- (void)operation:(id)a3 didReceiveResponse:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 statusCode] == 511)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__SBKTransactionController_operation_didReceiveResponse___block_invoke;
    block[3] = &unk_2648AF920;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __57__SBKTransactionController_operation_didReceiveResponse___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_clampsController");
  [v2 setNetworkingBlocked];

  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = +[SBKStoreError killSwitchErrorWithTransaction:0 underlyingError:0];
  objc_msgSend(v3, "_onQueue_cancelAllPendingTransactions:", v4);
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SBKTransactionController_operation_finishedWithOutput___block_invoke;
  block[3] = &unk_2648AF7A8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

uint64_t __57__SBKTransactionController_operation_finishedWithOutput___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = (void *)a1[6];
  uint64_t v4 = [v3 needsAuthentication];
  return objc_msgSend(v1, "_onQueue_processOperationOutput:operation:operationAuthenticated:", v2, v3, v4);
}

- (void)_delegateTransactionDidFinish:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__SBKTransactionController__delegateTransactionDidFinish___block_invoke;
  v9[3] = &unk_2648AF078;
  v9[4] = self;
  id v10 = v5;
  id v11 = WeakRetained;
  SEL v12 = a2;
  id v7 = WeakRetained;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __58__SBKTransactionController__delegateTransactionDidFinish___block_invoke(uint64_t a1)
{
  char v4 = 0;
  [*(id *)(a1 + 32) _sendFinishedBlockForTransaction:*(void *)(a1 + 40) success:1 cancelled:0 error:0 handledAsFinishedBlock:&v4];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    if (v4)
    {
      uint64_t v3 = [MEMORY[0x263F08690] currentHandler];
      [v3 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"SBKTransactionController.m" lineNumber:687 description:@"transaction controllers with delegates can not use transaction finish blocks"];
    }
    return [*(id *)(a1 + 48) transactionController:*(void *)(a1 + 32) transactionDidFinish:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)_delegateTransactionDidCancel:(id)a3 withError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__SBKTransactionController__delegateTransactionDidCancel_withError___block_invoke;
  block[3] = &unk_2648AF050;
  void block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v16 = WeakRetained;
  SEL v17 = a2;
  id v10 = WeakRetained;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __68__SBKTransactionController__delegateTransactionDidCancel_withError___block_invoke(uint64_t a1)
{
  char v4 = 0;
  [*(id *)(a1 + 32) _sendFinishedBlockForTransaction:*(void *)(a1 + 40) success:0 cancelled:1 error:*(void *)(a1 + 48) handledAsFinishedBlock:&v4];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    if (v4)
    {
      uint64_t v3 = [MEMORY[0x263F08690] currentHandler];
      [v3 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"SBKTransactionController.m" lineNumber:674 description:@"transaction controllers with delegates can not use transaction finish blocks"];
    }
    return [*(id *)(a1 + 56) transactionController:*(void *)(a1 + 32) transactionDidCancel:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  }
  return result;
}

- (BOOL)_delegateTransactionDidFail:(id)a3 withError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SBKTransactionController.m" lineNumber:653 description:@"Delegate calls should be done on the main thread"];
  }
  char v14 = 0;
  char v9 = [(SBKTransactionController *)self _sendFinishedBlockForTransaction:v7 success:0 cancelled:0 error:v8 handledAsFinishedBlock:&v14];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    if (v14)
    {
      id v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"SBKTransactionController.m" lineNumber:660 description:@"transaction controllers with delegates can not use transaction finish blocks"];
    }
    char v9 = [WeakRetained transactionController:self transactionDidFail:v7 error:v8];
  }

  return v9;
}

- (BOOL)_sendFinishedBlockForTransaction:(id)a3 success:(BOOL)a4 cancelled:(BOOL)a5 error:(id)a6 handledAsFinishedBlock:(BOOL *)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a6;
  uint64_t v13 = [v11 transactionContextForKey:@"SBKTransactionFinishedBlock"];
  char v14 = (void *)v13;
  if (v13)
  {
    *a7 = 1;
    char v15 = (*(uint64_t (**)(uint64_t, BOOL, BOOL, id))(v13 + 16))(v13, v10, v9, v12);
    [v11 setTransactionContext:0 forKey:@"SBKTransactionFinishedBlock"];
  }
  else
  {
    char v15 = 0;
    *a7 = 0;
  }

  return v15;
}

- (BOOL)_delegateShouldScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([WeakRetained transactionController:self shouldScheduleTransaction:v6] & 1) == 0)
  {
    if (a4)
    {
      +[SBKStoreError delegateCancelledErrorWithTransaction:v6 underlyingError:0];
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)_onQueue_performDefaultErrorHandlingForError:(id)a3
{
  id v9 = a3;
  if ([v9 isAuthenticationError]
    && [(SBKTransactionController *)self shouldAuthenticateIfNecessary]
    && ([v9 transaction],
        char v4 = (SBKTransaction *)objc_claimAutoreleasedReturnValue(),
        currentTransaction = self->_currentTransaction,
        v4,
        v4 == currentTransaction))
  {
    id v6 = self;
    id v7 = v9;
    uint64_t v8 = 1;
  }
  else
  {
    id v6 = self;
    id v7 = v9;
    uint64_t v8 = 2;
  }
  [(SBKTransactionController *)v6 _onQueue_resolveError:v7 resolution:v8];
}

- (void)_onQueue_performCancelErrorHandlingForError:(id)a3
{
  id v5 = a3;
  if ([v5 isAuthenticationError])
  {
    [(SBKTransactionController *)self _onQueue_cancelAllPendingTransactions:v5];
  }
  else
  {
    char v4 = [v5 transaction];
    [(SBKTransactionController *)self _onQueue_cancelTransaction:v4 error:v5];
  }
}

- (void)_onQueue_performRetryErrorHandlingForError:(id)a3
{
  id v7 = a3;
  char v4 = [(SBKTransactionController *)self _onQueue_clampsController];
  if ([v7 isAccountsChangedError])
  {
    [v4 setUserAcceptedSyncTimestamp];
LABEL_5:
    [(SBKTransactionController *)self _onQueue_processCurrentTransaction];
    goto LABEL_7;
  }
  if ([v7 isAuthenticationError])
  {
    [v4 setUserAcceptedSyncTimestamp];
    [(SBKStoreAuthenticationController *)self->_authenticationController saveAccountToLastSyncedDefaults];
    goto LABEL_5;
  }
  id v5 = [v7 transaction];
  [v4 clearTimestampForTransaction:v5];

  id v6 = [v7 transaction];
  [(SBKTransactionController *)self _onQueue_scheduleTransaction:v6 isRetry:1];

LABEL_7:
}

- (void)_onQueue_resolveError:(id)a3 resolution:(int)a4
{
  id v9 = a3;
  if (([v9 isTransactionCancelledError] & 1) == 0)
  {
    self->_isResolvingError = 1;
    id v6 = [v9 transaction];
    currentTransaction = self->_currentTransaction;
    if (v6 == currentTransaction)
    {
    }
    else
    {

      if (currentTransaction)
      {
LABEL_7:
        if (a4 == 2)
        {
          [(SBKTransactionController *)self _onQueue_performCancelErrorHandlingForError:v9];
        }
        else if (a4 == 1)
        {
          [(SBKTransactionController *)self _onQueue_performRetryErrorHandlingForError:v9];
        }
        else
        {
          [(SBKTransactionController *)self _onQueue_performDefaultErrorHandlingForError:v9];
        }
        self->_isResolvingError = 0;
        goto LABEL_13;
      }
    }
    uint64_t v8 = [(SBKTransactionController *)self _onQueue_clampsController];
    [v8 clearAccountIdentifierCheckTimestamp];

    goto LABEL_7;
  }
LABEL_13:
  MEMORY[0x270F9A758]();
}

- (void)_onQueue_processOperationOutput:(id)a3 operation:(id)a4 operationAuthenticated:(BOOL)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = self->_currentTransaction;
  BOOL v10 = [(SBKTransactionController *)self _onQueue_clampsController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v9 && self->_enabled)
    {
      id v11 = v7;
      id v12 = [v8 response];
      uint64_t v13 = +[SBKResponse responseWithURLResponse:v12 responseDictionary:v11];

      char v14 = [(SBKTransaction *)v9 activeRequest];
      char v15 = [v14 canonicalResponseForResponse:v13];

      int v16 = [v15 isSuccess];
      SEL v17 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (!v18) {
          goto LABEL_15;
        }
        *(_DWORD *)v31 = 138412290;
        *(void *)&v31[4] = v15;
        v19 = "Deserialized server response: %@";
      }
      else
      {
        if (!v18) {
          goto LABEL_15;
        }
        *(_DWORD *)v31 = 138412290;
        *(void *)&v31[4] = v11;
        v19 = "Deserialized server response produced response data: %@";
      }
      _os_log_impl(&dword_22B807000, v17, OS_LOG_TYPE_DEFAULT, v19, v31, 0xCu);
LABEL_15:

      if ([v15 isSuccess])
      {
        [(SBKStoreAuthenticationController *)self->_authenticationController saveAccountToLastSyncedDefaults];
        [(SBKStoreAuthenticationController *)self->_authenticationController setShouldAuthenticate:0];
        [(SBKTransactionController *)self _processDataInResponse:v15];
LABEL_39:

        goto LABEL_40;
      }
      [v15 retrySeconds];
      if (v21 <= 0.0)
      {
        if (![v15 isUnsupportedClient])
        {
          if ([v15 isGenericError])
          {
            __int16 v27 = _SBKLogCategoryDefault();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v31 = 138412290;
              *(void *)&v31[4] = v11;
              _os_log_impl(&dword_22B807000, v27, OS_LOG_TYPE_DEFAULT, "Generic error indicated by response responseDictionary: %@", v31, 0xCu);
            }

            char v24 = [v15 requestError];
            uint64_t v28 = +[SBKStoreError storeGenericErrorWithTransaction:v9 underlyingError:v24];
          }
          else if ([v15 isValidationError])
          {
            uint64_t v29 = _SBKLogCategoryDefault();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v31 = 138412290;
              *(void *)&v31[4] = v11;
              _os_log_impl(&dword_22B807000, v29, OS_LOG_TYPE_DEFAULT, "Validation error indicated by response responseDictionary: %@", v31, 0xCu);
            }

            char v24 = [v15 requestError];
            uint64_t v28 = +[SBKStoreError storeValidationErrorWithTransaction:v9 underlyingError:v24];
          }
          else if ([v15 isAuthenticationError])
          {
            [(SBKStoreAuthenticationController *)self->_authenticationController saveAccountToLastFailedSyncDefaults];
            if ([(SBKTransactionController *)self shouldAuthenticateIfNecessary])
            {
              [v10 clearAuthenticationRequest];
              [(SBKStoreAuthenticationController *)self->_authenticationController setShouldAuthenticate:1];
              [(SBKTransactionController *)self _onQueue_processCurrentTransaction];
              goto LABEL_39;
            }
            char v24 = [v15 requestError];
            uint64_t v28 = +[SBKStoreError storeAccountSessionExpiredWithTransaction:v9 underlyingError:v24];
          }
          else
          {
            v30 = _SBKLogCategoryDefault();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v31 = 138412290;
              *(void *)&v31[4] = v11;
              _os_log_impl(&dword_22B807000, v30, OS_LOG_TYPE_DEFAULT, "Unknown error in response: %@", v31, 0xCu);
            }

            char v24 = [v15 requestError];
            uint64_t v28 = +[SBKStoreError unknownErrorWithTransaction:v9 underlyingError:v24];
          }
          v26 = (void *)v28;
          -[SBKTransactionController _onQueue_transactionDidFail:withError:](self, "_onQueue_transactionDidFail:withError:", v9, v28, *(_OWORD *)v31);
LABEL_38:

          goto LABEL_39;
        }
        [v10 setNetworkingBlocked];
        char v24 = [v15 requestError];
        uint64_t v25 = +[SBKStoreError killSwitchErrorWithTransaction:v9 underlyingError:v24];
      }
      else
      {
        [v15 retrySeconds];
        objc_msgSend(v10, "backOffForTimeInterval:");
        [v15 retrySeconds];
        double v23 = v22;
        char v24 = [v15 requestError];
        uint64_t v25 = +[SBKStoreError serverClampErrorWithTransaction:v9 retrySeconds:v24 underlyingError:v23];
      }
      v26 = (void *)v25;
      -[SBKTransactionController _onQueue_cancelAllPendingTransactions:](self, "_onQueue_cancelAllPendingTransactions:", v25, *(_OWORD *)v31);
      goto LABEL_38;
    }
    id v11 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      v20 = "Not using deserialized responseDictionary because transactions have been cancelled!";
      goto LABEL_11;
    }
  }
  else
  {
    id v11 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      v20 = "Not using deserialized response because it is not a dictionary as expected!";
LABEL_11:
      _os_log_impl(&dword_22B807000, v11, OS_LOG_TYPE_DEFAULT, v20, v31, 2u);
    }
  }
LABEL_40:
}

- (void)_processDataInResponse:(id)a3
{
  currentTransaction = self->_currentTransaction;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SBKTransactionController__processDataInResponse___block_invoke;
  v4[3] = &unk_2648AF028;
  v4[4] = self;
  [(SBKTransaction *)currentTransaction processDataInResponse:a3 withCompletionHandler:v4];
}

void __51__SBKTransactionController__processDataInResponse___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 64);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SBKTransactionController__processDataInResponse___block_invoke_2;
  v4[3] = &unk_2648AF248;
  char v5 = a2;
  v4[4] = v2;
  dispatch_async(v3, v4);
}

void __51__SBKTransactionController__processDataInResponse___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = v1[13];
    if (v2 <= 0)
    {
      v1[13] = v2 + 1;
      char v5 = *(void **)(a1 + 32);
      objc_msgSend(v5, "_onQueue_processCurrentTransaction");
    }
    else
    {
      uint64_t v3 = v1[7];
      id v6 = +[SBKStoreError storeGenericErrorWithTransaction:v3 underlyingError:0];
      objc_msgSend(v1, "_onQueue_transactionDidFail:withError:", v3, v6);
    }
  }
  else
  {
    char v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "_onQueue_currentTransactionDidFinish");
  }
}

- (void)_onQueue_transactionDidCancel:(id)a3 withError:(id)a4
{
  id v6 = (SBKTransaction *)a3;
  id v7 = a4;
  currentTransaction = self->_currentTransaction;
  if (currentTransaction) {
    BOOL v9 = currentTransaction == v6;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    [(SBKTransactionController *)self _onQueue_endBackgroundTask];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__SBKTransactionController__onQueue_transactionDidCancel_withError___block_invoke;
  block[3] = &unk_2648AF7A8;
  uint64_t v13 = v6;
  id v14 = v7;
  char v15 = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __68__SBKTransactionController__onQueue_transactionDidCancel_withError___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_22B807000, v2, OS_LOG_TYPE_DEFAULT, "Transaction Failed: %@ -- Error: %@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 48) _delegateTransactionDidCancel:*(void *)(a1 + 32) withError:*(void *)(a1 + 40)];
}

- (void)_onQueue_transactionDidFail:(id)a3 withError:(id)a4
{
  int v6 = (SBKTransaction *)a3;
  id v7 = a4;
  currentTransaction = self->_currentTransaction;
  if (currentTransaction) {
    BOOL v9 = currentTransaction == v6;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    [(SBKTransactionController *)self _onQueue_endBackgroundTask];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__SBKTransactionController__onQueue_transactionDidFail_withError___block_invoke;
  block[3] = &unk_2648AF7A8;
  uint64_t v13 = v6;
  id v14 = v7;
  char v15 = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __66__SBKTransactionController__onQueue_transactionDidFail_withError___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_22B807000, v2, OS_LOG_TYPE_DEFAULT, "Transaction Failed: %@ -- Error: %@", (uint8_t *)&v6, 0x16u);
  }

  uint64_t result = [*(id *)(a1 + 48) _delegateTransactionDidFail:*(void *)(a1 + 32) withError:*(void *)(a1 + 40)];
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 48) _resolveError:*(void *)(a1 + 40) resolution:0];
  }
  return result;
}

- (void)_onQueue_currentTransactionDidFinish
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    currentTransaction = self->_currentTransaction;
    int v6 = 138412290;
    uint64_t v7 = currentTransaction;
    _os_log_impl(&dword_22B807000, v3, OS_LOG_TYPE_DEFAULT, "Transaction Finished: %@", (uint8_t *)&v6, 0xCu);
  }

  [(SBKTransactionController *)self _onQueue_endBackgroundTask];
  [(SBKTransactionController *)self _delegateTransactionDidFinish:self->_currentTransaction];
  [(NSMutableArray *)self->_pendingTransactions removeObject:self->_currentTransaction];
  [(SBKTransaction *)self->_currentTransaction setActiveRequest:0];
  char v5 = self->_currentTransaction;
  self->_currentTransaction = 0;

  [(SBKTransactionController *)self _onQueue_processPendingTransactions];
}

- (BOOL)_onQueue_authenticationCanProcessTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBKTransactionController *)self _onQueue_clampsController];
  BOOL v8 = ([v7 hasUserRecentlyAcceptedSync] & 1) == 0
    && !-[SBKStoreAuthenticationController isAuthenticationValidForTransaction:error:](self->_authenticationController, "isAuthenticationValidForTransaction:error:", v6, a4)|| !-[SBKStoreAuthenticationController shouldAuthenticate](self->_authenticationController, "shouldAuthenticate")|| ([v7 hasAuthenticatedTooRecentlyForTransaction:v6 error:a4] & 1) == 0;

  return v8;
}

- (BOOL)_onQueue_clampsCanScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBKTransactionController *)self _onQueue_clampsController];
  BOOL v8 = v7;
  if (v7) {
    char v9 = [v7 canScheduleTransaction:v6 error:a4];
  }
  else {
    char v9 = 1;
  }

  return v9;
}

- (void)_onQueue_assertIsTransactionValid:(id)a3 error:(id *)a4
{
  id v11 = a3;
  id v6 = [v11 domain];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    char v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBKTransactionController.m", 413, @"No domain specified in transaction %@!", v11 object file lineNumber description];
  }
  BOOL v8 = [v11 requestURL];

  if (!v8)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBKTransactionController.m", 414, @"No url specified in transaction %@!", v11 object file lineNumber description];
  }
}

- (BOOL)_onQueue_isEnabledForTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(SBKTransactionController *)self isEnabled];
  BOOL v8 = v7;
  if (a4 && !v7)
  {
    *a4 = +[SBKStoreError keyValueStoreDisabledErrorWithTransaction:v6 underlyingError:0];
  }

  return v8;
}

- (BOOL)_onQueue_canScheduleTransaction:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![(SBKTransactionController *)self _onQueue_isEnabledForTransaction:v6 error:a4])
  {
LABEL_10:
    BOOL v7 = 0;
    goto LABEL_11;
  }
  [(SBKTransactionController *)self _onQueue_assertIsTransactionValid:v6 error:a4];
  if (![(SBKTransactionController *)self _onQueue_clampsCanScheduleTransaction:v6 error:a4])
  {
    BOOL v8 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        id v9 = *a4;
      }
      else {
        id v9 = 0;
      }
      int v11 = 138412546;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_22B807000, v8, OS_LOG_TYPE_DEFAULT, "Unable to schedule (due to clamps %@) transaction %@.", (uint8_t *)&v11, 0x16u);
    }

    goto LABEL_10;
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (void)_onQueue_addPendingTransaction:(id)a3
{
  id v4 = a3;
  char v5 = [(SBKTransactionController *)self _onQueue_clampsController];
  [v5 setTimestampForTransaction:v4];

  [(NSMutableArray *)self->_pendingTransactions addObject:v4];
  [(SBKTransactionController *)self _onQueue_processPendingTransactions];
}

- (void)_onQueue_scheduleTransaction:(id)a3 isRetry:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_22B807000, v7, OS_LOG_TYPE_DEFAULT, "Scheduling Transaction: %@", buf, 0xCu);
  }

  id v18 = 0;
  BOOL v8 = [(SBKTransactionController *)self _onQueue_canScheduleTransaction:v6 error:&v18];
  id v9 = v18;
  uint64_t v10 = v9;
  if (v8)
  {
    [(SBKTransactionController *)self _onQueue_addPendingTransaction:v6];
  }
  else if (!a4 && [v9 isClampError] && (objc_msgSend(v10, "retrySeconds"), v11 <= 5.0))
  {
    [(NSMutableArray *)self->_pendingTransactions insertObject:v6 atIndex:0];
    id v12 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      [v10 retrySeconds];
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2048;
      uint64_t v22 = v13;
      _os_log_impl(&dword_22B807000, v12, OS_LOG_TYPE_DEFAULT, "Holding transaction %@ (due to clamps) %.2f seconds", buf, 0x16u);
    }

    [v10 retrySeconds];
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)((v14 + 0.5) * 1000000000.0));
    queue = self->_queue;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __65__SBKTransactionController__onQueue_scheduleTransaction_isRetry___block_invoke;
    v17[3] = &unk_2648AF920;
    v17[4] = self;
    dispatch_after(v15, queue, v17);
  }
  else
  {
    [(SBKTransactionController *)self _onQueue_transactionDidFail:v6 withError:v10];
  }
}

void __65__SBKTransactionController__onQueue_scheduleTransaction_isRetry___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 80) count])
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) objectAtIndex:0];
    if (v2)
    {
      id v3 = (id)v2;
      [*(id *)(*(void *)(a1 + 32) + 80) removeObject:v2];
      objc_msgSend(*(id *)(a1 + 32), "_onQueue_scheduleTransaction:isRetry:", v3, 1);
    }
  }
}

- (void)_onQueue_processCurrentTransaction
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    currentTransaction = self->_currentTransaction;
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = currentTransaction;
    _os_log_impl(&dword_22B807000, v3, OS_LOG_TYPE_DEFAULT, "Processing Transaction: %@", buf, 0xCu);
  }

  char v5 = self->_currentTransaction;
  id v11 = 0;
  BOOL v6 = [(SBKTransactionController *)self _onQueue_authenticationCanProcessTransaction:v5 error:&v11];
  id v7 = v11;
  if (v6)
  {
    [(SBKTransactionController *)self _onQueue_beginBackgroundTask];
    id v8 = [(SBKTransaction *)self->_currentTransaction newRequest];
    objc_msgSend(v8, "setShouldAuthenticate:", -[SBKStoreAuthenticationController shouldAuthenticate](self->_authenticationController, "shouldAuthenticate"));
    [(SBKTransaction *)self->_currentTransaction setActiveRequest:v8];
    id v9 = (void *)[v8 newURLOperationWithDelegate:self];
    [(SBKTransactionController *)self _enqueueStoreOperation:v9];

    id v7 = v8;
  }
  else
  {
    uint64_t v10 = [(SBKTransactionController *)self _onQueue_clampsController];
    [v10 setAccountIdentifierCheckTimestamp];

    [(SBKTransactionController *)self _onQueue_transactionDidFail:self->_currentTransaction withError:v7];
  }
}

- (void)_onQueue_processPendingTransactions
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_currentTransaction)
  {
    id v3 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      currentTransaction = self->_currentTransaction;
      int v8 = 138412290;
      id v9 = currentTransaction;
      _os_log_impl(&dword_22B807000, v3, OS_LOG_TYPE_DEFAULT, "Transaction In progress: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if ([(NSMutableArray *)self->_pendingTransactions count])
  {
    [(SBKTransaction *)self->_currentTransaction setActiveRequest:0];
    char v5 = [(NSMutableArray *)self->_pendingTransactions objectAtIndex:0];
    BOOL v6 = self->_currentTransaction;
    self->_currentTransaction = v5;

    [(SBKTransactionController *)self _onQueue_processCurrentTransaction];
  }
  else
  {
    id v7 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_22B807000, v7, OS_LOG_TYPE_DEFAULT, "No Pending Transactions", (uint8_t *)&v8, 2u);
    }

    [(SBKTransactionController *)self _onQueue_endBackgroundTask];
  }
}

- (void)_onQueue_cancelTransaction:(id)a3 error:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v6 = (SBKTransaction *)a3;
  id v7 = a4;
  if (v6)
  {
    currentTransaction = self->_currentTransaction;
    id v9 = os_log_create("com.apple.amp.StoreBookkeeper", "KVS");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = @"NO";
      if (currentTransaction == v6) {
        uint64_t v10 = @"YES";
      }
      int v12 = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      dispatch_time_t v15 = v10;
      _os_log_impl(&dword_22B807000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling transaction: %@ -- isCurrentTransaction: %@", (uint8_t *)&v12, 0x16u);
    }

    if (!v7)
    {
      id v7 = +[SBKStoreError transactionCancelledErrorWithTransaction:0 underlyingError:0];
    }
    [v7 setTransaction:v6];
    if (currentTransaction == v6)
    {
      [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
      [(SBKTransaction *)self->_currentTransaction setActiveRequest:0];
      id v11 = self->_currentTransaction;
      self->_currentTransaction = 0;
    }
    if (self->_isResolvingError) {
      [(SBKTransactionController *)self _onQueue_transactionDidCancel:v6 withError:v7];
    }
    else {
      [(SBKTransactionController *)self _onQueue_transactionDidFail:v6 withError:v7];
    }
    [(NSMutableArray *)self->_pendingTransactions removeObject:v6];
    [(SBKTransactionController *)self _onQueue_processPendingTransactions];
  }
}

- (void)_onQueue_cancelAllPendingTransactions:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = (void *)[(NSMutableArray *)self->_pendingTransactions copy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = objc_msgSend(v4, "copy", (void)v12);
        [v11 setTransaction:v10];
        [(SBKTransactionController *)self _onQueue_cancelTransaction:v10 error:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_pendingTransactions removeAllObjects];
}

- (void)_onQueue_endBackgroundTask
{
  id v3 = self->_backgroundTaskAssertion;
  backgroundTaskAssertion = self->_backgroundTaskAssertion;
  self->_backgroundTaskAssertion = 0;

  if (v3)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__SBKTransactionController__onQueue_endBackgroundTask__block_invoke;
    block[3] = &unk_2648AF920;
    uint64_t v7 = v3;
    dispatch_async(queue, block);
  }
}

uint64_t __54__SBKTransactionController__onQueue_endBackgroundTask__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 invalidate];
  }
  return result;
}

- (void)_onQueue_beginBackgroundTask
{
  if (!self->_backgroundTaskAssertion)
  {
    objc_initWeak(&location, self);
    id v3 = (void *)[objc_alloc(MEMORY[0x263F54F50]) initWithName:@"SBKTransactionController" pid:getpid() subsystem:@"com.apple.amp.StoreBookkeeper" reason:2 flags:1];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __56__SBKTransactionController__onQueue_beginBackgroundTask__block_invoke;
    v5[3] = &unk_2648AF780;
    objc_copyWeak(&v6, &location);
    [v3 setInvalidationHandler:v5];
    backgroundTaskAssertion = self->_backgroundTaskAssertion;
    self->_backgroundTaskAssertion = (MSVTaskAssertion *)v3;

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __56__SBKTransactionController__onQueue_beginBackgroundTask__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[8];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __56__SBKTransactionController__onQueue_beginBackgroundTask__block_invoke_2;
    v7[3] = &unk_2648AF8A8;
    uint64_t v8 = WeakRetained;
    id v9 = v3;
    dispatch_async(v6, v7);
  }
}

void __56__SBKTransactionController__onQueue_beginBackgroundTask__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backgroundTaskAssertion];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "_onQueue_endBackgroundTask");
  }
}

- (void)_endBackgroundTask
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SBKTransactionController__endBackgroundTask__block_invoke;
  block[3] = &unk_2648AF920;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __46__SBKTransactionController__endBackgroundTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_endBackgroundTask");
}

- (void)_beginBackgroundTask
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SBKTransactionController__beginBackgroundTask__block_invoke;
  block[3] = &unk_2648AF920;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __48__SBKTransactionController__beginBackgroundTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_beginBackgroundTask");
}

- (void)_resolveError:(id)a3 resolution:(int)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SBKTransactionController__resolveError_resolution___block_invoke;
  block[3] = &unk_2648AF000;
  void block[4] = self;
  id v10 = v6;
  int v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __53__SBKTransactionController__resolveError_resolution___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_resolveError:resolution:", *(void *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

- (void)_storeOperationDidComplete:(id)a3
{
  id v5 = a3;
  id v4 = [v5 delegate];

  if (v4 == self) {
    [v5 setDelegate:0];
  }
}

- (void)_enqueueStoreOperation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __51__SBKTransactionController__enqueueStoreOperation___block_invoke;
  id v8 = &unk_2648AEFD8;
  objc_copyWeak(&v9, &from);
  objc_copyWeak(&v10, &location);
  [v4 setCompletionBlock:&v5];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v4, v5, v6, v7, v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __51__SBKTransactionController__enqueueStoreOperation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_loadWeakRetained((id *)(a1 + 40));
    [v2 _storeOperationDidComplete:WeakRetained];
  }
}

- (void)cancelAllTransactionsCancelCode:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__SBKTransactionController_cancelAllTransactionsCancelCode___block_invoke;
  v4[3] = &unk_2648AF4C0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

void __60__SBKTransactionController_cancelAllTransactionsCancelCode___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  int v3 = +[SBKStoreError transactionCancelledErrorWithTransaction:0 code:*(void *)(a1 + 40) underlyingError:0];
  objc_msgSend(v2, "_onQueue_cancelAllPendingTransactions:", v3);

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = v5[7];
  id v7 = +[SBKStoreError transactionCancelledErrorWithTransaction:v6 code:v4 underlyingError:0];
  objc_msgSend(v5, "_onQueue_cancelTransaction:error:", v6, v7);
}

- (void)cancelAllTransactions
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SBKTransactionController_cancelAllTransactions__block_invoke;
  block[3] = &unk_2648AF920;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __49__SBKTransactionController_cancelAllTransactions__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  int v3 = +[SBKStoreError transactionCancelledErrorWithTransaction:0 underlyingError:0];
  objc_msgSend(v2, "_onQueue_cancelAllPendingTransactions:", v3);

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[7];
  id v6 = +[SBKStoreError transactionCancelledErrorWithTransaction:v5 underlyingError:0];
  objc_msgSend(v4, "_onQueue_cancelTransaction:error:", v5, v6);
}

- (void)cancelScheduledTransaction:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SBKTransactionController_cancelScheduledTransaction___block_invoke;
  v7[3] = &unk_2648AF8A8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __55__SBKTransactionController_cancelScheduledTransaction___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[SBKStoreError transactionCancelledErrorWithTransaction:v2 underlyingError:0];
  objc_msgSend(v1, "_onQueue_cancelTransaction:error:", v2, v3);
}

- (void)scheduleTransaction:(id)a3
{
  id v4 = a3;
  if (self->_account)
  {
    id v14 = 0;
    BOOL v5 = [(SBKTransactionController *)self _delegateShouldScheduleTransaction:v4 error:&v14];
    id v6 = v14;
  }
  else
  {
    id v6 = +[SBKStoreError noStoreAccountErrorWithTransaction:v4 underlyingError:0];
    BOOL v5 = 0;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SBKTransactionController_scheduleTransaction___block_invoke;
  block[3] = &unk_2648AF998;
  BOOL v13 = v5;
  void block[4] = self;
  id v11 = v4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v4;
  dispatch_async(queue, block);
}

uint64_t __48__SBKTransactionController_scheduleTransaction___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return objc_msgSend(v3, "_onQueue_scheduleTransaction:isRetry:", v4, 0);
  }
  else {
    return objc_msgSend(v3, "_onQueue_transactionDidFail:withError:", v4, *(void *)(a1 + 48));
  }
}

- (void)scheduleTransaction:(id)a3 withTransactionFinishedBlock:(id)a4
{
  id v7 = a3;
  id v6 = (void *)[a4 copy];
  [v7 setTransactionContext:v6 forKey:@"SBKTransactionFinishedBlock"];

  [(SBKTransactionController *)self scheduleTransaction:v7];
}

- (BOOL)isIdle
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__SBKTransactionController_isIdle__block_invoke;
  v5[3] = &unk_2648AF7F8;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__SBKTransactionController_isIdle__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_isIdle");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_onQueue_isIdle
{
  return !self->_currentTransaction && [(NSMutableArray *)self->_pendingTransactions count] == 0;
}

- (id)_onQueue_clampsController
{
  return +[SBKStoreClampsController sharedClampsController];
}

- (void)_networkTypeChangedNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SBKTransactionController__networkTypeChangedNotification___block_invoke;
  block[3] = &unk_2648AF920;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __60__SBKTransactionController__networkTypeChangedNotification___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clampsController");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 clearNetworkingBlocked];
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SBKTransactionController_setEnabled___block_invoke;
  block[3] = &unk_2648AF920;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __39__SBKTransactionController_setEnabled___block_invoke(uint64_t a1)
{
  id v1 = *(unsigned char **)(a1 + 32);
  if (v1[8])
  {
    int v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "_onQueue_processPendingTransactions");
  }
  else
  {
    id v3 = +[SBKStoreError keyValueStoreDisabledErrorWithTransaction:0 underlyingError:0];
    objc_msgSend(v1, "_onQueue_cancelAllPendingTransactions:", v3);
  }
}

- (void)setRequestURL:(id)a3
{
  id v5 = a3;
  if (([(NSURL *)self->_requestURL isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_requestURL, a3);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__SBKTransactionController_setRequestURL___block_invoke;
    block[3] = &unk_2648AF920;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __42__SBKTransactionController_setRequestURL___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clampsController");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 reset];
}

- (void)setDomain:(id)a3
{
  id v4 = a3;
  if (![(NSString *)self->_domain isEqualToString:v4])
  {
    id v5 = (NSString *)[v4 copy];
    domain = self->_domain;
    self->_domain = v5;

    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__SBKTransactionController_setDomain___block_invoke;
    block[3] = &unk_2648AF920;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __38__SBKTransactionController_setDomain___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clampsController");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 reset];
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F89418];
  id v5 = [MEMORY[0x263F894C0] sharedInstance];
  [v3 removeObserver:self name:v4 object:v5];

  [(SBKTransactionController *)self _onQueue_endBackgroundTask];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(NSOperationQueue *)self->_operationQueue operations];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v11 setDelegate:0];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v12.receiver = self;
  v12.super_class = (Class)SBKTransactionController;
  [(SBKTransactionController *)&v12 dealloc];
}

- (SBKTransactionController)initWithDomain:(id)a3 requestURL:(id)a4 forAccount:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)SBKTransactionController;
  id v11 = [(SBKTransactionController *)&v26 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    domain = v11->_domain;
    v11->_domain = (NSString *)v12;

    objc_storeStrong((id *)&v11->_requestURL, a4);
    v11->_enabled = 1;
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.SBKTransactionController", 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v14;

    v11->_conflictResolutionAttempts = 0;
    long long v16 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v11->_operationQueue;
    v11->_operationQueue = v16;

    [(NSOperationQueue *)v11->_operationQueue setName:@"com.apple.SBKTransactionController.operationQueue"];
    [(NSOperationQueue *)v11->_operationQueue setMaxConcurrentOperationCount:1];
    objc_storeStrong((id *)&v11->_account, a5);
    uint64_t v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingTransactions = v11->_pendingTransactions;
    v11->_pendingTransactions = v18;

    id v20 = [[SBKStoreAuthenticationController alloc] initWithStoreAccount:v11->_account];
    authenticationController = v11->_authenticationController;
    v11->_authenticationController = v20;

    uint64_t v22 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v23 = *MEMORY[0x263F89418];
    char v24 = [MEMORY[0x263F894C0] sharedInstance];
    [v22 addObserver:v11 selector:sel__networkTypeChangedNotification_ name:v23 object:v24];
  }
  return v11;
}

- (SBKTransactionController)initWithDomain:(id)a3 requestURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = SBKStoreAccount();
  id v9 = [(SBKTransactionController *)self initWithDomain:v7 requestURL:v6 forAccount:v8];

  return v9;
}

@end