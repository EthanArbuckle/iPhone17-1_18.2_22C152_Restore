@interface WLMigrationKitController
- (WLDataMigrationDelegate)delegate;
- (void)cancel;
- (void)daemonDidGetInterrupted;
- (void)run:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation WLMigrationKitController

- (void)run:(id)a3
{
  id v4 = a3;
  [(WLMigrationKitController *)self setDelegate:v4];
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __32__WLMigrationKitController_run___block_invoke;
  v9 = &unk_264C65E28;
  objc_copyWeak(&v10, &location);
  [(WLDaemonConnection *)self setInterruptionHandler:&v6];
  v5 = -[WLDaemonConnection daemonWithErrorHandler:](self, "daemonWithErrorHandler:", &__block_literal_global_1, v6, v7, v8, v9);
  [v5 startMigrationUsingRetryPolicies:0 delegate:v4 useMigrationKit:1 replyBlock:&__block_literal_global_5];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __32__WLMigrationKitController_run___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained daemonDidGetInterrupted];
}

void __32__WLMigrationKitController_run___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _WLLog(v8, 0, @"WLMigrationKitController could not start MigrationKit because NSXPC error occurred. error=%@", a4, a5, a6, a7, a8, a2);
}

void __32__WLMigrationKitController_run___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _WLLog(v9, 2, @"WLMigrationKitController successfully started MigrationKit.", a4, a5, a6, a7, a8, a9);
}

- (void)cancel
{
  id v2 = [(WLDaemonConnection *)self daemonWithErrorHandler:&__block_literal_global_10];
  [v2 cancel];
}

void __34__WLMigrationKitController_cancel__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _WLLog(v8, 0, @"WLMigrationKitController could not start MigrationKit because NSXPC error occurred. error=%@", a4, a5, a6, a7, a8, a2);
}

- (void)daemonDidGetInterrupted
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dataMigratorDidGetInterrupted];
}

- (WLDataMigrationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WLDataMigrationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end