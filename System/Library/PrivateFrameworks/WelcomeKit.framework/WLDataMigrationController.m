@interface WLDataMigrationController
- (WLDataMigrationController)initWithDelegate:(id)a3;
- (WLDataMigrationDelegate)delegate;
- (void)deleteMessages;
- (void)lookupAppDataContainer:(id)a3;
- (void)startMigrationUsingRetryPolicies:(BOOL)a3;
- (void)testAMSPurchase;
@end

@implementation WLDataMigrationController

- (WLDataMigrationController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(WLDaemonConnection *)self init];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46__WLDataMigrationController_initWithDelegate___block_invoke;
    v7[3] = &unk_264C65E28;
    objc_copyWeak(&v8, &location);
    [(WLDaemonConnection *)v5 setInterruptionHandler:v7];
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __46__WLDataMigrationController_initWithDelegate___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 5;
    v5 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 5);

    WeakRetained = v5;
    if (v3)
    {
      id v4 = objc_loadWeakRetained(v2);
      [v4 dataMigratorDidGetInterrupted];

      WeakRetained = v5;
    }
  }
}

- (void)startMigrationUsingRetryPolicies:(BOOL)a3
{
  BOOL v4 = a3;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__WLDataMigrationController_startMigrationUsingRetryPolicies___block_invoke;
  v14[3] = &unk_264C65E50;
  v14[4] = self;
  v6 = [(WLDaemonConnection *)self daemonWithErrorHandler:v14];
  _WLLog(v3, 1, @"%@: startMigration will call daemon", v7, v8, v9, v10, v11, (uint64_t)self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__WLDataMigrationController_startMigrationUsingRetryPolicies___block_invoke_2;
  v13[3] = &unk_264C65E78;
  v13[4] = self;
  [v6 startMigrationUsingRetryPolicies:v4 delegate:WeakRetained useMigrationKit:0 replyBlock:v13];
}

void __62__WLDataMigrationController_startMigrationUsingRetryPolicies___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = a2;
  _WLLog(v2, 0, @"%@: XPC Error when starting migration - %@", v5, v6, v7, v8, v9, v4);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained dataMigrator:0 didFailWithError:v10];
}

void __62__WLDataMigrationController_startMigrationUsingRetryPolicies___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v6 = a3;
  _WLLog(v3, 1, @"%@: startMigration did call daemon with migrator %@ error %@", v7, v8, v9, v10, v11, *(void *)(a1 + 32));
  uint64_t v17 = *(void *)(a1 + 32);
  if (v20)
  {
    id v18 = v20;
    id WeakRetained = *(id *)(v17 + 32);
    *(void *)(v17 + 32) = v18;
  }
  else
  {
    _WLLog(v3, 0, @"%@: Failed to start migration (nil migrator in reply) - %@", v12, v13, v14, v15, v16, v17);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [WeakRetained dataMigrator:0 didFailWithError:v6];
  }
}

- (void)deleteMessages
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__WLDataMigrationController_deleteMessages__block_invoke;
  v3[3] = &unk_264C65E50;
  v3[4] = self;
  uint64_t v2 = [(WLDaemonConnection *)self daemonWithErrorHandler:v3];
  [v2 deleteMessages];
}

void __43__WLDataMigrationController_deleteMessages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = a2;
  _WLLog(v2, 0, @"%@: XPC Error when starting migration - %@", v5, v6, v7, v8, v9, v4);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained dataMigrator:0 didFailWithError:v10];
}

- (void)lookupAppDataContainer:(id)a3
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__WLDataMigrationController_lookupAppDataContainer___block_invoke;
  v6[3] = &unk_264C65E50;
  v6[4] = self;
  id v4 = a3;
  uint64_t v5 = [(WLDaemonConnection *)self daemonWithErrorHandler:v6];
  [v5 lookupAppDataContainer:v4];
}

void __52__WLDataMigrationController_lookupAppDataContainer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = a2;
  _WLLog(v2, 0, @"%@: XPC Error when starting migration - %@", v5, v6, v7, v8, v9, v4);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained dataMigrator:0 didFailWithError:v10];
}

- (void)testAMSPurchase
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__WLDataMigrationController_testAMSPurchase__block_invoke;
  v3[3] = &unk_264C65E50;
  v3[4] = self;
  uint64_t v2 = [(WLDaemonConnection *)self daemonWithErrorHandler:v3];
  [v2 testAMSPurchase];
}

void __44__WLDataMigrationController_testAMSPurchase__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = a2;
  _WLLog(v2, 0, @"%@: XPC Error when starting migration - %@", v5, v6, v7, v8, v9, v4);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained dataMigrator:0 didFailWithError:v10];
}

- (WLDataMigrationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WLDataMigrationDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_migrator, 0);
}

@end