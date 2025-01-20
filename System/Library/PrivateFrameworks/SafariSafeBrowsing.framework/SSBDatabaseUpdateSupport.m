@interface SSBDatabaseUpdateSupport
- (BOOL)onHighCellularDataPlan;
- (SSBDatabaseUpdateSupport)init;
- (id)fetchCellularDataPlanSynchronously;
- (void)_fetchCellularDataPlan;
- (void)_fetchCellularDataPlanWithCompletionHandler:(id)a3;
@end

@implementation SSBDatabaseUpdateSupport

- (SSBDatabaseUpdateSupport)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSBDatabaseUpdateSupport;
  v2 = [(SSBDatabaseUpdateSupport *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_onHighCellularDataPlan = 0;
    [(SSBDatabaseUpdateSupport *)v2 _fetchCellularDataPlan];
    v4 = v3;
  }

  return v3;
}

- (void)_fetchCellularDataPlanWithCompletionHandler:(id)a3
{
  id v4 = a3;
  carrierSpaceClient = self->_carrierSpaceClient;
  if (!carrierSpaceClient)
  {
    objc_super v6 = (CTCarrierSpaceClient *)[objc_alloc(MEMORY[0x263F2FA18]) initWithQueue:0];
    v7 = self->_carrierSpaceClient;
    self->_carrierSpaceClient = v6;

    carrierSpaceClient = self->_carrierSpaceClient;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__SSBDatabaseUpdateSupport__fetchCellularDataPlanWithCompletionHandler___block_invoke;
  v9[3] = &unk_263FCE428;
  id v10 = v4;
  id v8 = v4;
  [(CTCarrierSpaceClient *)carrierSpaceClient fetchDataPlanMetrics:v9];
}

void __72__SSBDatabaseUpdateSupport__fetchCellularDataPlanWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    objc_super v6 = SSBOSLogDatabase();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __72__SSBDatabaseUpdateSupport__fetchCellularDataPlanWithCompletionHandler___block_invoke_cold_1(v6, v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [a2 domestic];
    v9 = [v8 capacityBytes];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
  }
}

- (void)_fetchCellularDataPlan
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __50__SSBDatabaseUpdateSupport__fetchCellularDataPlan__block_invoke;
  v2[3] = &unk_263FCE450;
  v2[4] = self;
  [(SSBDatabaseUpdateSupport *)self _fetchCellularDataPlanWithCompletionHandler:v2];
}

uint64_t __50__SSBDatabaseUpdateSupport__fetchCellularDataPlan__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 integerValue];
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = (result & 0xFFFFFFFFC0000000) != 0;
  return result;
}

- (id)fetchCellularDataPlanSynchronously
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__SSBDatabaseUpdateSupport_fetchCellularDataPlanSynchronously__block_invoke;
  v7[3] = &unk_263FCE478;
  v9 = &v10;
  id v4 = v3;
  id v8 = v4;
  [(SSBDatabaseUpdateSupport *)self _fetchCellularDataPlanWithCompletionHandler:v7];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

intptr_t __62__SSBDatabaseUpdateSupport_fetchCellularDataPlanSynchronously__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 stringValue];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  objc_super v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

- (BOOL)onHighCellularDataPlan
{
  return self->_onHighCellularDataPlan;
}

- (void).cxx_destruct
{
}

void __72__SSBDatabaseUpdateSupport__fetchCellularDataPlanWithCompletionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "ssb_privacyPreservingDescription");
  int v5 = 138543362;
  objc_super v6 = v4;
  _os_log_error_impl(&dword_209FC0000, v3, OS_LOG_TYPE_ERROR, "Failed to get data plan metrics: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end