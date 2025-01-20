@interface WLDataMigrationControllerSurrogate
- (WLDataMigrationControllerSurrogate)initWithDelegate:(id)a3;
- (WLDataMigrationControllerSurrogate)initWithDelegate:(id)a3 forceDownloadError:(BOOL)a4;
- (void)_startMigrationUsingRetryPolicies:(BOOL)a3;
- (void)startMigrationUsingRetryPolicies:(BOOL)a3;
@end

@implementation WLDataMigrationControllerSurrogate

- (WLDataMigrationControllerSurrogate)initWithDelegate:(id)a3 forceDownloadError:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)WLDataMigrationControllerSurrogate;
  result = [(WLDataMigrationController *)&v6 initWithDelegate:a3];
  if (result) {
    result->_forceDownloadError = a4;
  }
  return result;
}

- (WLDataMigrationControllerSurrogate)initWithDelegate:(id)a3
{
  return [(WLDataMigrationControllerSurrogate *)self initWithDelegate:a3 forceDownloadError:0];
}

- (void)startMigrationUsingRetryPolicies:(BOOL)a3
{
  objc_initWeak(&location, self);
  v4 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__WLDataMigrationControllerSurrogate_startMigrationUsingRetryPolicies___block_invoke;
  block[3] = &unk_264C65F80;
  objc_copyWeak(&v6, &location);
  BOOL v7 = a3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __71__WLDataMigrationControllerSurrogate_startMigrationUsingRetryPolicies___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startMigrationUsingRetryPolicies:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_startMigrationUsingRetryPolicies:(BOOL)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  if (!a3)
  {
    v4 = [(WLDataMigrationController *)self delegate];
    [v4 dataMigrator:0 didUpdateMigrationState:1];

    sleep(1u);
    v5 = [(WLDataMigrationController *)self delegate];
    [v5 dataMigrator:0 didUpdateMigrationState:2];

    sleep(2u);
  }
  char v6 = 0;
  float v7 = 0.0;
  double v8 = 0.0;
  do
  {
    if (v7 == 0.0)
    {
      v9 = [(WLDataMigrationController *)self delegate];
      [v9 dataMigrator:0 didUpdateMigrationState:3];
    }
    v10 = [(WLDataMigrationController *)self delegate];
    *(float *)&double v11 = v7;
    [v10 dataMigrator:0 didUpdateProgressPercentage:v11];

    if (v8 < 0.8)
    {
      v12 = [(WLDataMigrationController *)self delegate];
      objc_msgSend(v12, "dataMigrator:didUpdateRemainingDownloadTime:", 0, (double)pow(20.0, (0.8 - v8) * 10.0 * 0.5 / 0.8));
    }
    if (!(v6 & 1 | (v8 < 0.8)))
    {
      v13 = [(WLDataMigrationController *)self delegate];
      [v13 dataMigrator:0 didUpdateMigrationState:4];

      v14 = [(WLDataMigrationController *)self delegate];
      [v14 dataMigratorDidBecomeRestartable:0];

      char v6 = 1;
    }
    sleep(1u);
    if (v7 < 0.25 && v8 > 0.15 && self->_forceDownloadError) {
      goto LABEL_15;
    }
    float v7 = v8 + 0.1;
    double v8 = v7;
  }
  while (v7 < 1.0);
  if (self->_forceDownloadError)
  {
LABEL_15:
    v15 = (void *)MEMORY[0x263F087E8];
    v22 = @"com.apple.welcomekit.error.offerRetry";
    v23[0] = MEMORY[0x263EFFA88];
    v16 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v17 = [v15 errorWithDomain:@"com.apple.welcomekit" code:2 userInfo:v16];

    v18 = [(WLDataMigrationController *)self delegate];
    [v18 dataMigrator:0 didFailWithError:v17];

    return;
  }
  v19 = [(WLDataMigrationController *)self delegate];
  LODWORD(v20) = 1.0;
  [v19 dataMigrator:0 didUpdateProgressPercentage:v20];

  id v21 = [(WLDataMigrationController *)self delegate];
  [v21 dataMigratorDidFinish:0 withImportErrors:0 context:0];
}

@end