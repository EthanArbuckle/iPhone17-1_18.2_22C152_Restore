@interface VSWLKAppInstallationOperation
- (NSString)appAdamID;
- (VSOptional)result;
- (WLKInstallable)installable;
- (void)executionDidBegin;
- (void)setAppAdamID:(id)a3;
- (void)setInstallable:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation VSWLKAppInstallationOperation

- (void)setInstallable:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_installable, a3);
  v5 = [v9 appAdamIDs];
  v6 = [v5 firstObject];

  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [[installable appAdamIDs] firstObject] parameter must not be nil."];
  }
  v7 = [v9 appAdamIDs];
  v8 = [v7 firstObject];

  [(VSWLKAppInstallationOperation *)self setAppAdamID:v8];
}

- (void)executionDidBegin
{
  objc_initWeak(&location, self);
  v3 = [MEMORY[0x263F85B28] defaultAppInstaller];
  v4 = [(VSWLKAppInstallationOperation *)self installable];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__VSWLKAppInstallationOperation_executionDidBegin__block_invoke;
  v7[3] = &unk_265077CB0;
  objc_copyWeak(&v8, &location);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__VSWLKAppInstallationOperation_executionDidBegin__block_invoke_15;
  v5[3] = &unk_265076C58;
  objc_copyWeak(&v6, &location);
  [v3 installAppForInstallable:v4 progressHandler:v7 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __50__VSWLKAppInstallationOperation_executionDidBegin__block_invoke(uint64_t a1, double a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v12 = a2;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "VSWLKAppInstallationOperation - Install Progress %f", buf, 0xCu);
  }

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  id v6 = objc_msgSend(WeakRetained, "appAdamID", @"VSWLKAppInstallationOperationNotificationUserInfoAppAdamIDKey");
  v9[1] = @"VSWLKAppInstallationOperationNotificationUserInfoInstallProgressKey";
  v10[0] = v6;
  v7 = [NSNumber numberWithDouble:a2];
  v10[1] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v5 postNotificationName:@"VSWLKAppInstallationOperationProgressDidChange" object:0 userInfo:v8];
}

void __50__VSWLKAppInstallationOperation_executionDidBegin__block_invoke_15(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (void *)MEMORY[0x263F1E250];
  v5 = (void *)MEMORY[0x263F1E208];
  if (v9)
  {
    id v6 = [MEMORY[0x263F1E208] failableWithError:v9];
    v7 = [v4 optionalWithObject:v6];
    [WeakRetained setResult:v7];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263F8C6D0]);
    v7 = [v5 failableWithObject:v6];
    id v8 = [v4 optionalWithObject:v7];
    [WeakRetained setResult:v8];
  }
  [WeakRetained finishExecutionIfPossible];
}

- (WLKInstallable)installable
{
  return self->_installable;
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSString)appAdamID
{
  return self->_appAdamID;
}

- (void)setAppAdamID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appAdamID, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_installable, 0);
}

@end