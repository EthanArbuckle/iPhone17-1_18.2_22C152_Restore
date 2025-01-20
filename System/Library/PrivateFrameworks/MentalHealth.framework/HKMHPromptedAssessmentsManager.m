@interface HKMHPromptedAssessmentsManager
+ (id)taskIdentifier;
- (BOOL)_synchronouslyStartObservingWithError:(id *)a3;
- (HKMHPromptedAssessmentsManager)initWithHealthStore:(id)a3;
- (id)promptedAssessmentsWithError:(id *)a3;
- (void)_handleAutomaticProxyReconnection;
- (void)_notifyObserversForPromptedAssessmentUpdate;
- (void)_startObservingWithActivationHandler:(id)a3;
- (void)client_promptedAssessmentsManagerDidUpdatePromptedAssessments;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)registerObserver:(id)a3 queue:(id)a4 activationHandler:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation HKMHPromptedAssessmentsManager

- (HKMHPromptedAssessmentsManager)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKMHPromptedAssessmentsManager;
  v5 = [(HKMHPromptedAssessmentsManager *)&v16 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F0A5A8]);
    uint64_t v7 = [v6 initWithName:@"HKMHPromptedAssessmentsManager" loggingCategory:*MEMORY[0x263F09938]];
    observers = v5->_observers;
    v5->_observers = (HKObserverSet *)v7;

    id v9 = objc_alloc(MEMORY[0x263F0A818]);
    v10 = [(id)objc_opt_class() taskIdentifier];
    v11 = [MEMORY[0x263F08C38] UUID];
    uint64_t v12 = [v9 initWithHealthStore:v4 taskIdentifier:v10 exportedObject:v5 taskUUID:v11];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v12;

    [(HKTaskServerProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
    id v14 = objc_alloc_init(MEMORY[0x263F0A810]);
    [(HKTaskServerProxyProvider *)v5->_proxyProvider setTaskConfiguration:v14];
  }
  return v5;
}

uint64_t __71__HKMHPromptedAssessmentsManager__startObservingWithActivationHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", *(void *)(a1 + 32));
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)promptedAssessmentsWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__HKMHPromptedAssessmentsManager_promptedAssessmentsWithError___block_invoke;
  v10[3] = &unk_2653EF398;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__HKMHPromptedAssessmentsManager_promptedAssessmentsWithError___block_invoke_3;
  v9[3] = &unk_2653EF3C0;
  v9[4] = &v11;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __63__HKMHPromptedAssessmentsManager_promptedAssessmentsWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__HKMHPromptedAssessmentsManager_promptedAssessmentsWithError___block_invoke_2;
  v3[3] = &unk_2653EF370;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getPromptedAssessmentsWithCompletion:", v3);
}

void __63__HKMHPromptedAssessmentsManager_promptedAssessmentsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __63__HKMHPromptedAssessmentsManager_promptedAssessmentsWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
}

- (void)registerObserver:(id)a3 queue:(id)a4 activationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  observers = self->_observers;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__HKMHPromptedAssessmentsManager_registerObserver_queue_activationHandler___block_invoke;
  v13[3] = &unk_2653EF410;
  v13[4] = self;
  v15 = &v16;
  id v12 = v10;
  id v14 = v12;
  [(HKObserverSet *)observers registerObserver:v8 queue:v9 runIfFirstObserver:v13];
  if (!*((unsigned char *)v17 + 24)) {
    (*((void (**)(id, uint64_t, void))v12 + 2))(v12, 1, 0);
  }

  _Block_object_dispose(&v16, 8);
}

void __75__HKMHPromptedAssessmentsManager_registerObserver_queue_activationHandler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = *MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_255F13000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Beginning observation", buf, 0xCu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __75__HKMHPromptedAssessmentsManager_registerObserver_queue_activationHandler___block_invoke_286;
  v4[3] = &unk_2653EF3E8;
  objc_copyWeak(&v5, (id *)buf);
  [*(id *)(*(void *)(a1 + 32) + 16) setAutomaticProxyReconnectionHandler:v4];
  [*(id *)(*(void *)(a1 + 32) + 16) setShouldRetryOnInterruption:1];
  [*(id *)(a1 + 32) _startObservingWithActivationHandler:*(void *)(a1 + 40)];
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

void __75__HKMHPromptedAssessmentsManager_registerObserver_queue_activationHandler___block_invoke_286(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAutomaticProxyReconnection];
}

- (void)unregisterObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__HKMHPromptedAssessmentsManager_unregisterObserver___block_invoke;
  v4[3] = &unk_2653EF480;
  void v4[4] = self;
  [(HKObserverSet *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __53__HKMHPromptedAssessmentsManager_unregisterObserver___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = *MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v3;
    _os_log_impl(&dword_255F13000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ending observation", buf, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 32) + 16) setAutomaticProxyReconnectionHandler:0];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__HKMHPromptedAssessmentsManager_unregisterObserver___block_invoke_2;
  v7[3] = &unk_2653EF458;
  v7[4] = v4;
  return [v5 fetchProxyWithHandler:&__block_literal_global_0 errorHandler:v7];
}

uint64_t __53__HKMHPromptedAssessmentsManager_unregisterObserver___block_invoke_289(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopObservingChanges");
}

void __53__HKMHPromptedAssessmentsManager_unregisterObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
    __53__HKMHPromptedAssessmentsManager_unregisterObserver___block_invoke_2_cold_1(a1);
  }
}

- (void)_startObservingWithActivationHandler:(id)a3
{
  id v4 = a3;
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__HKMHPromptedAssessmentsManager__startObservingWithActivationHandler___block_invoke;
  v9[3] = &unk_2653EF4A8;
  id v10 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__HKMHPromptedAssessmentsManager__startObservingWithActivationHandler___block_invoke_2;
  v7[3] = &unk_2653EF4D0;
  v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

void __71__HKMHPromptedAssessmentsManager__startObservingWithActivationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
    __71__HKMHPromptedAssessmentsManager__startObservingWithActivationHandler___block_invoke_2_cold_1(a1);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_synchronouslyStartObservingWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__HKMHPromptedAssessmentsManager__synchronouslyStartObservingWithError___block_invoke;
  v10[3] = &unk_2653EF398;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__HKMHPromptedAssessmentsManager__synchronouslyStartObservingWithError___block_invoke_3;
  v9[3] = &unk_2653EF520;
  void v9[4] = self;
  void v9[5] = &v11;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v7 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __72__HKMHPromptedAssessmentsManager__synchronouslyStartObservingWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __72__HKMHPromptedAssessmentsManager__synchronouslyStartObservingWithError___block_invoke_2;
  v3[3] = &unk_2653EF4F8;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", v3);
}

void __72__HKMHPromptedAssessmentsManager__synchronouslyStartObservingWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __72__HKMHPromptedAssessmentsManager__synchronouslyStartObservingWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  long long v4 = *MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
    __72__HKMHPromptedAssessmentsManager__synchronouslyStartObservingWithError___block_invoke_3_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)_handleAutomaticProxyReconnection
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_255F13000, v1, v2, "[%{public}@] Failed to resume observation on server reconnection: %{public}@", (void)v3, DWORD2(v3));
}

- (void)client_promptedAssessmentsManagerDidUpdatePromptedAssessments
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  long long v3 = *MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = self;
    _os_log_impl(&dword_255F13000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received server notification of prompted assessment update", (uint8_t *)&v4, 0xCu);
  }
  [(HKMHPromptedAssessmentsManager *)self _notifyObserversForPromptedAssessmentUpdate];
}

- (void)_notifyObserversForPromptedAssessmentUpdate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  long long v3 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = NSNumber;
    observers = self->_observers;
    uint64_t v6 = v3;
    char v7 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[HKObserverSet count](observers, "count"));
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_255F13000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of prompted assessment update", buf, 0x16u);
  }
  id v8 = self->_observers;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__HKMHPromptedAssessmentsManager__notifyObserversForPromptedAssessmentUpdate__block_invoke;
  v9[3] = &unk_2653EF548;
  void v9[4] = self;
  [(HKObserverSet *)v8 notifyObservers:v9];
}

uint64_t __77__HKMHPromptedAssessmentsManager__notifyObserversForPromptedAssessmentUpdate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 promptedAssessmentsProvidingDidUpdatePromptedAssessments:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __53__HKMHPromptedAssessmentsManager_unregisterObserver___block_invoke_2_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_255F13000, v1, v2, "[%{public}@] Failed to communicate with task server for observation stop: %{public}@", (void)v3, DWORD2(v3));
}

void __71__HKMHPromptedAssessmentsManager__startObservingWithActivationHandler___block_invoke_2_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_255F13000, v1, v2, "[%{public}@] Failed to communicate with task server for observation start: %{public}@", (void)v3, DWORD2(v3));
}

void __72__HKMHPromptedAssessmentsManager__synchronouslyStartObservingWithError___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_255F13000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to communicate with task server for observation start: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end