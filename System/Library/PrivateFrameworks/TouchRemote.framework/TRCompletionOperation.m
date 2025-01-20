@interface TRCompletionOperation
- (BOOL)success;
- (int64_t)errorCode;
- (void)execute;
- (void)setErrorCode:(int64_t)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation TRCompletionOperation

- (void)execute
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(TRCompletionOperation *)self isCancelled])
  {
    id v6 = [(id)objc_opt_class() userCancelledError];
    [(TROperation *)self finishWithError:v6];
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      v3 = TRLogHandle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v10 = "-[TRCompletionOperation execute]";
        _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%s Send Completion Request", buf, 0xCu);
      }
    }
    v4 = objc_alloc_init(TRSetupCompletionRequest);
    [(TRSetupCompletionRequest *)v4 setCompletedSuccessfully:1];
    objc_initWeak((id *)buf, self);
    v5 = [(TROperation *)self session];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __32__TRCompletionOperation_execute__block_invoke;
    v7[3] = &unk_264220930;
    objc_copyWeak(&v8, (id *)buf);
    [v5 sendRequest:v4 withResponseHandler:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __32__TRCompletionOperation_execute__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (a3) {
    [WeakRetained finishWithResult:MEMORY[0x263EFFA78]];
  }
  else {
    [WeakRetained finishWithError:v7];
  }
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

@end