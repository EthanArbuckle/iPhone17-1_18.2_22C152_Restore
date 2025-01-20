@interface SRUIFTrialManager
- (SRUIFTrialManager)initWithNamespace:(id)a3;
- (SRUIFTrialManager)initWithNamespace:(id)a3 projectId:(int)a4;
- (id)_levelForFactor:(id)a3;
- (void)BOOLValueForFactor:(id)a3 defaultValueIfNoFactorsFilePresent:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)BOOLValueForFactor:(id)a3 withCompletionHandler:(id)a4;
- (void)_initializeTrialClient;
- (void)_refreshTreatments;
@end

@implementation SRUIFTrialManager

- (SRUIFTrialManager)initWithNamespace:(id)a3
{
  return [(SRUIFTrialManager *)self initWithNamespace:a3 projectId:135];
}

- (SRUIFTrialManager)initWithNamespace:(id)a3 projectId:(int)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SRUIFTrialManager;
  v8 = [(SRUIFTrialManager *)&v12 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("SRUIFTrialManager", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v8->_trialNamespaceName, a3);
    v8->_trialProjectId = a4;
    [(SRUIFTrialManager *)v8 _initializeTrialClient];
  }

  return v8;
}

- (void)_initializeTrialClient
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SRUIFTrialManager__initializeTrialClient__block_invoke;
  block[3] = &unk_264785A48;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __43__SRUIFTrialManager__initializeTrialClient__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [MEMORY[0x263F80E18] clientWithIdentifier:*(unsigned int *)(*(void *)(a1 + 32) + 8)];
    v4 = (void *)WeakRetained[2];
    WeakRetained[2] = v3;

    if (!WeakRetained[2])
    {
      id v5 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        id v7 = "-[SRUIFTrialManager _initializeTrialClient]_block_invoke";
        _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s #trial client initializations returned nil.", (uint8_t *)&v6, 0xCu);
      }
    }
  }
}

- (id)_levelForFactor:(id)a3
{
  id v4 = a3;
  [(SRUIFTrialManager *)self _refreshTreatments];
  trialClient = self->_trialClient;
  if (trialClient)
  {
    int v6 = [(TRIClient *)trialClient levelForFactor:v4 withNamespaceName:self->_trialNamespaceName];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)BOOLValueForFactor:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__SRUIFTrialManager_BOOLValueForFactor_withCompletionHandler___block_invoke;
  v11[3] = &unk_264785A70;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __62__SRUIFTrialManager_BOOLValueForFactor_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained _levelForFactor:*(void *)(a1 + 32)];
    id v5 = *MEMORY[0x263F28348];
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = v3[3];
        uint64_t v8 = v5;
        int v9 = [v4 BOOLeanValue];
        id v10 = "FALSE";
        *(_DWORD *)id v12 = 136315906;
        *(void *)&v12[4] = "-[SRUIFTrialManager BOOLValueForFactor:withCompletionHandler:]_block_invoke";
        *(void *)&v12[14] = v6;
        *(_WORD *)&v12[12] = 2112;
        if (v9) {
          id v10 = "TRUE";
        }
        *(_WORD *)&v12[22] = 2112;
        uint64_t v13 = v7;
        __int16 v14 = 2080;
        v15 = v10;
        _os_log_impl(&dword_225FBA000, v8, OS_LOG_TYPE_DEFAULT, "%s #trial Trial factor %@ found with namespace %@, value: %s", v12, 0x2Au);
      }
      (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, objc_msgSend(v4, "BOOLeanValue", *(_OWORD *)v12, *(void *)&v12[16]));
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        __62__SRUIFTrialManager_BOOLValueForFactor_withCompletionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32), (uint64_t)v3, v5);
      }
      v11 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.siri.Trial" code:0 userInfo:&unk_26D9B6088];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)BOOLValueForFactor:(id)a3 defaultValueIfNoFactorsFilePresent:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__SRUIFTrialManager_BOOLValueForFactor_defaultValueIfNoFactorsFilePresent_withCompletionHandler___block_invoke;
  block[3] = &unk_264786908;
  objc_copyWeak(&v16, &location);
  id v14 = v8;
  id v15 = v9;
  BOOL v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __97__SRUIFTrialManager_BOOLValueForFactor_defaultValueIfNoFactorsFilePresent_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained _levelForFactor:*(void *)(a1 + 32)];
    id v5 = *MEMORY[0x263F28348];
    BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = v3[3];
        id v9 = v5;
        int v10 = [v4 BOOLeanValue];
        id v11 = "FALSE";
        *(_DWORD *)id v14 = 136315906;
        *(void *)&v14[4] = "-[SRUIFTrialManager BOOLValueForFactor:defaultValueIfNoFactorsFilePresent:withCompletionHan"
                             "dler:]_block_invoke";
        *(void *)&v14[14] = v7;
        *(_WORD *)&v14[12] = 2112;
        if (v10) {
          id v11 = "TRUE";
        }
        *(_WORD *)&v14[22] = 2112;
        uint64_t v15 = v8;
        __int16 v16 = 2080;
        BOOL v17 = v11;
        _os_log_impl(&dword_225FBA000, v9, OS_LOG_TYPE_DEFAULT, "%s #trial Trial factor %@ found with namespace %@, value: %s", v14, 0x2Au);
      }
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), objc_msgSend(v4, "BOOLeanValue", *(_OWORD *)v14, *(void *)&v14[16]));
    }
    else
    {
      if (v6)
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = v3[3];
        *(_DWORD *)id v14 = 136315650;
        *(void *)&v14[4] = "-[SRUIFTrialManager BOOLValueForFactor:defaultValueIfNoFactorsFilePresent:withCompletionHan"
                             "dler:]_block_invoke";
        *(_WORD *)&v14[12] = 2112;
        *(void *)&v14[14] = v12;
        *(_WORD *)&v14[22] = 2112;
        uint64_t v15 = v13;
        _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s #trial Failed to read Trial factor %@ with namespace %@ and default_factors.pb file doesn't exist.", v14, 0x20u);
      }
      (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
    }
  }
}

- (void)_refreshTreatments
{
  trialClient = self->_trialClient;
  if (trialClient) {
    [(TRIClient *)trialClient refresh];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_trialNamespaceName, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

void __62__SRUIFTrialManager_BOOLValueForFactor_withCompletionHandler___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 24);
  int v5 = 136315650;
  BOOL v6 = "-[SRUIFTrialManager BOOLValueForFactor:withCompletionHandler:]_block_invoke";
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_225FBA000, log, OS_LOG_TYPE_ERROR, "%s #trial Failed to read Trial factor %@ with namespace %@ and default_factors.pb file doesn't exist.", (uint8_t *)&v5, 0x20u);
}

@end