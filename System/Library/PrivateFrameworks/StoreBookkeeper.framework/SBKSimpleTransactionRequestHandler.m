@interface SBKSimpleTransactionRequestHandler
- (BOOL)canceled;
- (SBKSimpleTransactionRequestHandler)initWithBagContext:(id)a3;
- (SBKTransactionController)transactionController;
- (void)cancel;
- (void)cancelWithError:(id)a3;
- (void)scheduleTransaction:(id)a3 finishedBlock:(id)a4;
- (void)timeout;
@end

@implementation SBKSimpleTransactionRequestHandler

- (void).cxx_destruct
{
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (SBKTransactionController)transactionController
{
  return self->_transactionController;
}

- (void)cancelWithError:(id)a3
{
  id v5 = a3;
  self->_canceled = 1;
  v4 = [(SBKSimpleTransactionRequestHandler *)self transactionController];
  if (v5) {
    objc_msgSend(v4, "cancelAllTransactionsCancelCode:", objc_msgSend(v5, "code"));
  }
  else {
    [v4 cancelAllTransactions];
  }
}

- (void)cancel
{
}

- (void)timeout
{
  if (![(SBKTransactionController *)self->_transactionController isIdle])
  {
    id v4 = [(SBKTransactionController *)self->_transactionController currentTransaction];
    v3 = +[SBKStoreError transactionTimeoutErrorWithTransaction:v4 underlyingError:0];
    [(SBKSimpleTransactionRequestHandler *)self cancelWithError:v3];
  }
}

- (void)scheduleTransaction:(id)a3 finishedBlock:(id)a4
{
  id v6 = a3;
  v7 = (void *)[a4 copy];
  v8 = [(SBKSimpleTransactionRequestHandler *)self transactionController];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__SBKSimpleTransactionRequestHandler_scheduleTransaction_finishedBlock___block_invoke;
  v10[3] = &unk_2648AF948;
  id v11 = v7;
  id v9 = v7;
  [v8 scheduleTransaction:v6 withTransactionFinishedBlock:v10];
}

uint64_t __72__SBKSimpleTransactionRequestHandler_scheduleTransaction_finishedBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  return 1;
}

- (SBKSimpleTransactionRequestHandler)initWithBagContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBKSimpleTransactionRequestHandler;
  id v5 = [(SBKSimpleTransactionRequestHandler *)&v12 init];
  if (v5)
  {
    id v6 = [SBKTransactionController alloc];
    v7 = [v4 domain];
    v8 = [v4 syncRequestURL];
    uint64_t v9 = [(SBKTransactionController *)v6 initWithDomain:v7 requestURL:v8];
    transactionController = v5->_transactionController;
    v5->_transactionController = (SBKTransactionController *)v9;
  }
  return v5;
}

@end