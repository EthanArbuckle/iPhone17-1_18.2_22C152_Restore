@interface HDMHPromptedAssessmentsManagerServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)taskIdentifier;
- (id)_clientRemoteObjectProxy;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)promptedAssessmentsManagerDidUpdatePromptedAssessments:(id)a3;
- (void)remote_getPromptedAssessmentsWithCompletion:(id)a3;
- (void)remote_startObservingChangesWithCompletion:(id)a3;
- (void)remote_stopObservingChanges;
@end

@implementation HDMHPromptedAssessmentsManagerServer

- (void)remote_getPromptedAssessmentsWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, id))a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 database];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__HDMHPromptedAssessmentsManagerServer_remote_getPromptedAssessmentsWithCompletion___block_invoke;
  v8[3] = &unk_2653F0490;
  v8[5] = &v10;
  id v9 = 0;
  v8[4] = self;
  [v6 performHighPriorityTransactionsWithError:&v9 block:v8];
  id v7 = v9;

  v4[2](v4, v11[5], v7);
  _Block_object_dispose(&v10, 8);
}

BOOL __84__HDMHPromptedAssessmentsManagerServer_remote_getPromptedAssessmentsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) promptedAssessmentsWithError:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (void)remote_startObservingChangesWithCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_255F2E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering for extension changes", (uint8_t *)&v6, 0xCu);
  }
  [(HDMHPromptedAssessmentsManager *)self->_manager registerObserver:self queue:0];
  v4[2](v4, 1, 0);
}

- (void)remote_stopObservingChanges
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  uint64_t v3 = *MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_255F2E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unregistering for extension changes", (uint8_t *)&v4, 0xCu);
  }
  [(HDMHPromptedAssessmentsManager *)self->_manager unregisterObserver:self];
}

- (void)promptedAssessmentsManagerDidUpdatePromptedAssessments:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  int v4 = *MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_255F2E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying client of prompted assessment update", (uint8_t *)&v6, 0xCu);
  }
  v5 = -[HDMHPromptedAssessmentsManagerServer _clientRemoteObjectProxy](self);
  objc_msgSend(v5, "client_promptedAssessmentsManagerDidUpdatePromptedAssessments");
}

- (id)_clientRemoteObjectProxy
{
  if (a1)
  {
    v1 = [a1 client];
    v2 = [v1 connection];
    uint64_t v3 = [v2 remoteObjectProxy];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [v13 profile];
  v16 = [v15 profileExtensionWithIdentifier:*MEMORY[0x263F54FD0]];

  if (v16)
  {
    uint64_t v17 = *MEMORY[0x263F097C0];
    id v18 = [v16 featureAvailabilityExtensionForFeatureIdentifier:*MEMORY[0x263F097C0]];
    if (v18)
    {
      uint64_t v19 = *MEMORY[0x263F09808];
      v20 = [v16 featureAvailabilityExtensionForFeatureIdentifier:*MEMORY[0x263F09808]];
      if (v20)
      {
        v21 = [(HDStandardTaskServer *)[HDMHPromptedAssessmentsManagerServer alloc] initWithUUID:v11 configuration:v12 client:v13 delegate:v14];
        v22 = [HDMHPromptedAssessmentsManager alloc];
        v23 = [v13 profile];
        uint64_t v24 = [(HDMHPromptedAssessmentsManager *)v22 initWithProfile:v23 periodicAssessmentsAvailability:v18 loggingPatternEscalationsAvailability:v20];
        manager = v21->_manager;
        v21->_manager = (HDMHPromptedAssessmentsManager *)v24;
      }
      else
      {
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a7, 110, @"No availability extension found for %@", v19);
        v21 = 0;
      }

      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a7, 110, @"No availability extension found for %@", v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_error:format:", 3, @"No profile extension found for %@", objc_opt_class());
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a7) {
        *a7 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  v21 = 0;
LABEL_14:

  return v21;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x270F4A458](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x270F4A450](self, a2);
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
}

@end