@interface TRIInternalServiceRequestHandler
- (TRIInternalServiceRequestHandler)initWithPromise:(id)a3 auditToken:(id *)a4 entitlementWitness:(id)a5;
- (id)_activeExperimentFactorLevelsForNamespaceName:(id)a3;
- (void)_experimentRecordsWithDeploymentEnvironments:(id)a3 privacyFilterPolicy:(unsigned __int8)a4 serverContext:(id)a5 completion:(id)a6;
- (void)activeBMLTInformationWithPrivacyFilterPolicy:(unsigned __int8)a3 completion:(id)a4;
- (void)activeExperimentInformationWithPrivacyFilterPolicy:(unsigned __int8)a3 completion:(id)a4;
- (void)activeRolloutInformationWithPrivacyFilterPolicy:(unsigned __int8)a3 completion:(id)a4;
- (void)deregisterNamespaceWithNamespaceName:(id)a3 teamId:(id)a4 completion:(id)a5;
- (void)dynamicNamespaceRecordsWithCompletion:(id)a3;
- (void)experimentIdsWithActiveStateAndNamespaceName:(id)a3 completion:(id)a4;
- (void)experimentNotificationsWithExperimentId:(id)a3 cloudKitContainer:(int)a4 teamId:(id)a5 completion:(id)a6;
- (void)immediatelySchedulePostUpgradeActivityWithCompletion:(id)a3;
- (void)lastFetchDateForContainer:(int)a3 teamId:(id)a4 completion:(id)a5;
- (void)logSystemCovariates;
- (void)registerNamespaceWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 teamId:(id)a6 appContainerId:(id)a7 appContainerType:(int64_t)a8 cloudKitContainerId:(int)a9 completion:(id)a10;
- (void)removeUnusedChannelsWithCompletion:(id)a3;
- (void)resumeSQLiteCKDatabaseQueueWithCompletion:(id)a3;
- (void)rolloutNotificationWithLatestDeploymentForRolloutId:(id)a3 cloudKitContainer:(int)a4 teamId:(id)a5 completion:(id)a6;
- (void)setFailureInjectionDelegate:(id)a3;
- (void)setLastFetchDate:(id)a3 forContainer:(int)a4 teamId:(id)a5 completion:(id)a6;
- (void)setSubscription:(id)a3 namespaceName:(id)a4 completion:(id)a5;
- (void)startDownloadNamespaceWithName:(id)a3 teamId:(id)a4 options:(id)a5 completion:(id)a6;
- (void)submitTask:(id)a3 options:(id)a4 completion:(id)a5;
- (void)subscriptionForNamespaceName:(id)a3 completion:(id)a4;
- (void)suspendSQLiteCKDatabaseQueueWithCompletion:(id)a3;
- (void)taskRecordsWithCompletion:(id)a3;
@end

@implementation TRIInternalServiceRequestHandler

- (TRIInternalServiceRequestHandler)initWithPromise:(id)a3 auditToken:(id *)a4 entitlementWitness:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIXPCInternalService.m", 73, @"Invalid parameter not satisfying: %@", @"promise" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)TRIInternalServiceRequestHandler;
  v12 = [(TRIInternalServiceRequestHandler *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_promise, a3);
    long long v14 = *(_OWORD *)a4->var0;
    *(_OWORD *)&v13->_auditToken.val[4] = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v13->_auditToken.val = v14;
    objc_storeStrong((id *)&v13->_entitlementWitness, a5);
  }

  return v13;
}

- (void)taskRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__TRIInternalServiceRequestHandler_taskRecordsWithCompletion___block_invoke;
  v12[3] = &unk_1E6BB8F38;
  v12[4] = self;
  v5 = (void (**)(void, void))MEMORY[0x1E016EA80](v12);
  v5[2](v5, 0);
  promise = self->_promise;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__TRIInternalServiceRequestHandler_taskRecordsWithCompletion___block_invoke_31;
  v9[3] = &unk_1E6BB8F88;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  v8 = v5;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v9];
}

void __62__TRIInternalServiceRequestHandler_taskRecordsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 44);
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    v8 = (void *)v7;
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2) {
      id v10 = "begin";
    }
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    objc_super v17 = v10;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s taskRecordsWithCompletion:", (uint8_t *)v11, 0x26u);
  }
}

void __62__TRIInternalServiceRequestHandler_taskRecordsWithCompletion___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__TRIInternalServiceRequestHandler_taskRecordsWithCompletion___block_invoke_2;
  v12[3] = &unk_1E6BB8F60;
  id v13 = *(id *)(a1 + 32);
  uint64_t v7 = (void (**)(void))MEMORY[0x1E016EA80](v12);
  if (v5 && v6)
  {
    v8 = [v5 taskDatabase];
    uint64_t v9 = [v8 allTasks];
    id v10 = [v9 allValues];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    if (!v11) {
      goto LABEL_7;
    }
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v10);
  }

LABEL_7:
  if (v7) {
    v7[2](v7);
  }
}

uint64_t __62__TRIInternalServiceRequestHandler_taskRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)experimentNotificationsWithExperimentId:(id)a3 cloudKitContainer:(int)a4 teamId:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = [MEMORY[0x1E4FB00E0] applicationBundleIdentifierFromSelf];
  if (!v14)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"TRIXPCInternalService.m", 106, @"Invalid parameter not satisfying: %@", @"trialdBundleId" object file lineNumber description];
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __112__TRIInternalServiceRequestHandler_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion___block_invoke;
  v31[3] = &unk_1E6BB8FB0;
  v31[4] = self;
  id v15 = v11;
  id v32 = v15;
  int v33 = a4;
  __int16 v16 = (void (**)(void, void))MEMORY[0x1E016EA80](v31);
  v16[2](v16, 0);
  promise = self->_promise;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __112__TRIInternalServiceRequestHandler_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion___block_invoke_39;
  v24[3] = &unk_1E6BB9028;
  id v28 = v13;
  id v29 = v16;
  int v30 = a4;
  id v25 = v15;
  id v26 = v12;
  id v27 = v14;
  id v18 = v14;
  id v19 = v12;
  v20 = v16;
  id v21 = v15;
  id v22 = v13;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v24];
}

void __112__TRIInternalServiceRequestHandler_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 44);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    if (a2) {
      v8 = "end";
    }
    else {
      v8 = "begin";
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = TRICloudKitSupport_Container_EnumDescriptor();
    id v12 = [v11 textFormatNameForValue:*(unsigned int *)(a1 + 48)];
    v13[0] = 67110402;
    v13[1] = v5;
    __int16 v14 = 2114;
    id v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    __int16 v18 = 2080;
    id v19 = v8;
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s experimentNotificationsWithExperimentId:%@ cloudKitContainer:%@ completion:", (uint8_t *)v13, 0x3Au);
  }
}

void __112__TRIInternalServiceRequestHandler_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __112__TRIInternalServiceRequestHandler_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion___block_invoke_2;
    v25[3] = &unk_1E6BB8FD8;
    id v26 = *(id *)(a1 + 56);
    uint64_t v8 = MEMORY[0x1E016EA80](v25);
    uint64_t v9 = (void *)v8;
    if (*(void *)(a1 + 32))
    {
      uint64_t v10 = [v5 keyValueStore];
      id v11 = +[TRIFetchDateManager managerWithKeyValueStore:v10];

      id v12 = [v5 namespaceDatabase];
      id v13 = [v5 paths];
      __int16 v14 = [v13 namespaceDescriptorsDefaultDir];
      id v15 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v12 defaultDescriptorDirectoryPath:v14];

      __int16 v16 = +[TRICKNativeArtifactProvider providerForContainer:*(unsigned int *)(a1 + 72) teamId:*(void *)(a1 + 40) bundleId:*(void *)(a1 + 48) dateProvider:v11 namespaceDescriptorProvider:v15 serverContext:v5];
      uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4FB00D8]) initWithAllowsCellular:0 discretionaryBehavior:0];
      __int16 v18 = [[TRIFetchOptions alloc] initWithDownloadOptions:v17 cacheDeleteAvailableSpaceClass:&unk_1F347B570];
      uint64_t v19 = *(void *)(a1 + 32);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __112__TRIInternalServiceRequestHandler_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion___block_invoke_51;
      v22[3] = &unk_1E6BB9000;
      id v23 = *(id *)(a1 + 56);
      id v24 = *(id *)(a1 + 64);
      [v16 fetchExperimentWithLatestDeploymentForExperimentId:v19 options:v18 completion:v22];
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, __CFString *))(v8 + 16))(v8, 2, @"ExperimentId must not be nil");
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 56);
    if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v21);
    }
  }
}

void __112__TRIInternalServiceRequestHandler_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v5 = (objc_class *)MEMORY[0x1E4F28C58];
    id v6 = a3;
    id v7 = [v5 alloc];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __112__TRIInternalServiceRequestHandler_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion___block_invoke_51(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = TRILogCategory_Server();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [v7 experiment];
    *(_DWORD *)buf = 138543362;
    id v15 = v12;
    _os_log_debug_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEBUG, "got artifact from CloudKit with experiment %{public}@", buf, 0xCu);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v7)
  {
    id v13 = v7;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v8);
  }
  else
  {
    (*(void (**)(void, void, id))(v10 + 16))(*(void *)(a1 + 32), 0, v8);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)rolloutNotificationWithLatestDeploymentForRolloutId:(id)a3 cloudKitContainer:(int)a4 teamId:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = [MEMORY[0x1E4FB00E0] applicationBundleIdentifierFromSelf];
  if (!v14)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"TRIXPCInternalService.m", 166, @"Invalid parameter not satisfying: %@", @"trialdBundleId" object file lineNumber description];
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __124__TRIInternalServiceRequestHandler_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_completion___block_invoke;
  v31[3] = &unk_1E6BB8FB0;
  v31[4] = self;
  id v15 = v11;
  id v32 = v15;
  int v33 = a4;
  uint64_t v16 = (void (**)(void, void))MEMORY[0x1E016EA80](v31);
  v16[2](v16, 0);
  promise = self->_promise;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __124__TRIInternalServiceRequestHandler_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_completion___block_invoke_54;
  v24[3] = &unk_1E6BB9028;
  id v28 = v13;
  id v29 = v16;
  int v30 = a4;
  id v25 = v15;
  id v26 = v12;
  id v27 = v14;
  id v18 = v14;
  id v19 = v12;
  uint64_t v20 = v16;
  id v21 = v15;
  id v22 = v13;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v24];
}

void __124__TRIInternalServiceRequestHandler_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 44);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (a2) {
      id v8 = "end";
    }
    else {
      id v8 = "begin";
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = TRICloudKitSupport_Container_EnumDescriptor();
    id v12 = [v11 textFormatNameForValue:*(unsigned int *)(a1 + 48)];
    v13[0] = 67110402;
    v13[1] = v5;
    __int16 v14 = 2114;
    id v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    __int16 v18 = 2080;
    id v19 = v8;
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s rolloutNotificationsWithLatestDeploymentForRolloutId:%@ cloudKitContainer:%@ completion:", (uint8_t *)v13, 0x3Au);
  }
}

void __124__TRIInternalServiceRequestHandler_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_completion___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && v6)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __124__TRIInternalServiceRequestHandler_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_completion___block_invoke_2;
    v32[3] = &unk_1E6BB8FD8;
    id v33 = *(id *)(a1 + 56);
    uint64_t v8 = MEMORY[0x1E016EA80](v32);
    uint64_t v9 = (void *)v8;
    if (*(void *)(a1 + 32))
    {
      uint64_t v10 = [v5 keyValueStore];
      uint64_t v11 = +[TRIFetchDateManager managerWithKeyValueStore:v10];

      id v12 = [v5 namespaceDatabase];
      id v13 = [v5 paths];
      __int16 v14 = [v13 namespaceDescriptorsDefaultDir];
      id v15 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v12 defaultDescriptorDirectoryPath:v14];

      id v27 = (void *)v11;
      __int16 v16 = +[TRICKNativeArtifactProvider providerForContainer:*(unsigned int *)(a1 + 72) teamId:*(void *)(a1 + 40) bundleId:*(void *)(a1 + 48) dateProvider:v11 namespaceDescriptorProvider:v15 serverContext:v5];
      uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4FB00D8]) initWithAllowsCellular:0 discretionaryBehavior:0];
      __int16 v18 = [[TRIFetchOptions alloc] initWithDownloadOptions:v17 cacheDeleteAvailableSpaceClass:&unk_1F347B588];
      id v19 = TRILogCategory_Server();
      os_signpost_id_t v20 = os_signpost_id_generate(v19);

      uint64_t v21 = TRILogCategory_Server();
      __int16 v22 = v21;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        uint64_t v23 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v35 = v23;
        _os_signpost_emit_with_name_impl(&dword_1DA291000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "FetchRolloutNotificationWithLatestDeployment", "r: %{public}@", buf, 0xCu);
      }

      uint64_t v24 = *(void *)(a1 + 32);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __124__TRIInternalServiceRequestHandler_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_completion___block_invoke_60;
      v28[3] = &unk_1E6BB9050;
      id v29 = *(id *)(a1 + 56);
      id v30 = *(id *)(a1 + 64);
      os_signpost_id_t v31 = v20;
      [v16 fetchRolloutNotificationWithLatestDeploymentForRolloutId:v24 options:v18 completion:v28];
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, __CFString *))(v8 + 16))(v8, 2, @"Parameter \"rolloutId\" must not be nil.");
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    uint64_t v25 = *(void *)(a1 + 56);
    if (v25)
    {
      id v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v25 + 16))(v25, 0, v26);
    }
  }
}

void __124__TRIInternalServiceRequestHandler_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v5 = (objc_class *)MEMORY[0x1E4F28C58];
    id v6 = a3;
    id v7 = [v5 alloc];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __124__TRIInternalServiceRequestHandler_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_completion___block_invoke_60(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = TRILogCategory_Server();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v15 = [v7 deployment];
    __int16 v16 = [v15 shortDesc];
    int v17 = 138543362;
    __int16 v18 = v16;
    _os_log_debug_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEBUG, "Downloaded artifact from CloudKit for rollout %{public}@", (uint8_t *)&v17, 0xCu);
  }
  (*(void (**)(void))(a1[4] + 16))();

  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v10 = TRILogCategory_Server();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    id v13 = [v7 deployment];
    __int16 v14 = [v13 shortDesc];
    int v17 = 138543362;
    __int16 v18 = v14;
    _os_signpost_emit_with_name_impl(&dword_1DA291000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchRolloutNotificationWithLatestDeployment", "r: %{public}@", (uint8_t *)&v17, 0xCu);
  }
}

- (void)submitTask:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __66__TRIInternalServiceRequestHandler_submitTask_options_completion___block_invoke;
  v24[3] = &unk_1E6BB9078;
  void v24[4] = self;
  id v11 = v8;
  id v25 = v11;
  id v12 = v9;
  id v26 = v12;
  id v13 = (void (**)(void, void))MEMORY[0x1E016EA80](v24);
  v13[2](v13, 0);
  promise = self->_promise;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__TRIInternalServiceRequestHandler_submitTask_options_completion___block_invoke_62;
  v19[3] = &unk_1E6BB90A0;
  id v22 = v10;
  id v23 = v13;
  id v20 = v11;
  id v21 = v12;
  id v15 = v12;
  id v16 = v11;
  int v17 = v13;
  id v18 = v10;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v19];
}

void __66__TRIInternalServiceRequestHandler_submitTask_options_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1[4] + 44);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (void *)v7;
    id v9 = "end";
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    uint64_t v12 = a1[6];
    if (!a2) {
      id v9 = "begin";
    }
    v13[0] = 67110402;
    v13[1] = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v10;
    __int16 v18 = 2080;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    uint64_t v23 = v12;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s submitTask:%@ options:%@ completion:", (uint8_t *)v13, 0x3Au);
  }
}

void __66__TRIInternalServiceRequestHandler_submitTask_options_completion___block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __66__TRIInternalServiceRequestHandler_submitTask_options_completion___block_invoke_2;
    uint64_t v24 = &unk_1E6BB8F60;
    id v25 = *(id *)(a1 + 56);
    id v8 = (void (**)(void))MEMORY[0x1E016EA80](&v21);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      char v10 = objc_msgSend(v7, "addTask:options:", v9, *(void *)(a1 + 40), v21, v22, v23, v24);
      id v11 = [[TRIRunningXPCActivityDescriptor alloc] initForImmediateWorkWithCapabilities:11];
      [v7 resumeWithXPCActivityDescriptor:v11 executeWhenSuspended:0];

      if (v10 == 2)
      {
        id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F28568];
        id v27 = @"Unable to add task.";
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        __int16 v14 = (void *)[v12 initWithDomain:@"TRIGeneralErrorDomain" code:13 userInfo:v13];
      }
      else
      {
        __int16 v14 = 0;
      }
      uint64_t v20 = *(void *)(a1 + 48);
      if (v20) {
        (*(void (**)(uint64_t, BOOL, void *))(v20 + 16))(v20, v10 != 2, v14);
      }
    }
    else
    {
      id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v28 = *MEMORY[0x1E4F28568];
      v29[0] = @"Task parameter cannot be nil.";
      __int16 v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1, v21, v22, v23, v24);
      __int16 v14 = (void *)[v17 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v18];

      uint64_t v19 = *(void *)(a1 + 48);
      if (v19) {
        (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v14);
      }
    }

    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 48);
    if (v15)
    {
      __int16 v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
    }
  }
}

uint64_t __66__TRIInternalServiceRequestHandler_submitTask_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)lastFetchDateForContainer:(int)a3 teamId:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __80__TRIInternalServiceRequestHandler_lastFetchDateForContainer_teamId_completion___block_invoke;
  v21[3] = &unk_1E6BB8FB0;
  v21[4] = self;
  int v23 = a3;
  id v10 = v8;
  id v22 = v10;
  id v11 = (void (**)(void, void))MEMORY[0x1E016EA80](v21);
  v11[2](v11, 0);
  promise = self->_promise;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__TRIInternalServiceRequestHandler_lastFetchDateForContainer_teamId_completion___block_invoke_70;
  v16[3] = &unk_1E6BB90C8;
  id v18 = v9;
  id v19 = v11;
  int v20 = a3;
  id v17 = v10;
  id v13 = v10;
  __int16 v14 = v11;
  id v15 = v9;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v16];
}

void __80__TRIInternalServiceRequestHandler_lastFetchDateForContainer_teamId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 44);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = *(void *)(a1 + 32);
    if (a2) {
      id v9 = "end";
    }
    else {
      id v9 = "begin";
    }
    id v10 = TRICloudKitSupport_Container_EnumDescriptor();
    id v11 = [v10 enumNameForValue:*(unsigned int *)(a1 + 48)];
    uint64_t v12 = *(void *)(a1 + 40);
    v13[0] = 67110402;
    v13[1] = v5;
    __int16 v14 = 2114;
    id v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    __int16 v18 = 2080;
    id v19 = v9;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    uint64_t v23 = v12;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s lastFetchDateForContainer:%@ teamId:%@ completion:", (uint8_t *)v13, 0x3Au);
  }
}

void __80__TRIInternalServiceRequestHandler_lastFetchDateForContainer_teamId_completion___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    __int16 v18 = __80__TRIInternalServiceRequestHandler_lastFetchDateForContainer_teamId_completion___block_invoke_2;
    id v19 = &unk_1E6BB8F60;
    id v20 = *(id *)(a1 + 48);
    uint64_t v8 = (void (**)(void))MEMORY[0x1E016EA80](&v16);
    if (*(void *)(a1 + 40))
    {
      if (TRICloudKitSupport_Container_IsValidValue() && *(_DWORD *)(a1 + 56))
      {
        id v9 = objc_msgSend(v5, "keyValueStore", v16, v17, v18, v19);
        id v10 = +[TRIFetchDateManager managerWithKeyValueStore:v9];

        id v11 = [v10 lastFetchDateWithType:0 container:*(unsigned int *)(a1 + 56) teamId:*(void *)(a1 + 32)];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = *MEMORY[0x1E4F28568];
        v22[0] = @"Container value is unsupported.";
        id v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1, v16, v17, v18, v19);
        id v10 = (void *)[v14 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v15];

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12)
    {
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
    }
  }
}

uint64_t __80__TRIInternalServiceRequestHandler_lastFetchDateForContainer_teamId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setLastFetchDate:(id)a3 forContainer:(int)a4 teamId:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __84__TRIInternalServiceRequestHandler_setLastFetchDate_forContainer_teamId_completion___block_invoke;
  v27[3] = &unk_1E6BB90F0;
  v27[4] = self;
  id v13 = v10;
  id v28 = v13;
  int v30 = a4;
  id v14 = v11;
  id v29 = v14;
  id v15 = (void (**)(void, void))MEMORY[0x1E016EA80](v27);
  v15[2](v15, 0);
  promise = self->_promise;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__TRIInternalServiceRequestHandler_setLastFetchDate_forContainer_teamId_completion___block_invoke_74;
  v21[3] = &unk_1E6BB9118;
  id v24 = v12;
  id v25 = v15;
  int v26 = a4;
  id v22 = v13;
  id v23 = v14;
  id v17 = v14;
  id v18 = v13;
  id v19 = v15;
  id v20 = v12;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v21];
}

void __84__TRIInternalServiceRequestHandler_setLastFetchDate_forContainer_teamId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 44);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    if (a2) {
      uint64_t v8 = "end";
    }
    else {
      uint64_t v8 = "begin";
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = TRICloudKitSupport_Container_EnumDescriptor();
    id v12 = [v11 enumNameForValue:*(unsigned int *)(a1 + 56)];
    uint64_t v13 = *(void *)(a1 + 48);
    v14[0] = 67110658;
    v14[1] = v5;
    __int16 v15 = 2114;
    uint64_t v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    __int16 v19 = 2080;
    id v20 = v8;
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2114;
    uint64_t v26 = v13;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s setLastFetchDate:%@ forContainer:%@ teamId:%{public}@ completion:", (uint8_t *)v14, 0x44u);
  }
}

void __84__TRIInternalServiceRequestHandler_setLastFetchDate_forContainer_teamId_completion___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    __int16 v21 = __84__TRIInternalServiceRequestHandler_setLastFetchDate_forContainer_teamId_completion___block_invoke_2;
    uint64_t v22 = &unk_1E6BB8F60;
    id v23 = *(id *)(a1 + 56);
    uint64_t v8 = (void (**)(void))MEMORY[0x1E016EA80](&v19);
    if (*(void *)(a1 + 32))
    {
      if (TRICloudKitSupport_Container_IsValidValue() && *(_DWORD *)(a1 + 64))
      {
        uint64_t v9 = objc_msgSend(v5, "keyValueStore", v19, v20, v21, v22);
        uint64_t v10 = +[TRIFetchDateManager managerWithKeyValueStore:v9];

        [v10 setLastFetchDate:*(void *)(a1 + 32) type:0 container:*(unsigned int *)(a1 + 64) teamId:*(void *)(a1 + 40)];
        uint64_t v11 = *(void *)(a1 + 48);
        if (v11) {
          (*(void (**)(uint64_t, uint64_t, void))(v11 + 16))(v11, 1, 0);
        }
        goto LABEL_14;
      }
      id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v24 = *MEMORY[0x1E4F28568];
      __int16 v25 = @"Container value is unsupported.";
      __int16 v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1, v19, v20, v21, v22);
      uint64_t v10 = (void *)[v14 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v15];

      uint64_t v16 = *(void *)(a1 + 48);
      if (v16) {
        goto LABEL_13;
      }
    }
    else
    {
      id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27[0] = @"Date parameter must be non-nil.";
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1, v19, v20, v21, v22);
      uint64_t v10 = (void *)[v17 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v18];

      uint64_t v16 = *(void *)(a1 + 48);
      if (v16) {
LABEL_13:
      }
        (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v10);
    }
LABEL_14:

    if (v8) {
      v8[2](v8);
    }

    goto LABEL_17;
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
LABEL_17:
}

uint64_t __84__TRIInternalServiceRequestHandler_setLastFetchDate_forContainer_teamId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setFailureInjectionDelegate:(id)a3
{
  id v4 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  _DWORD v13[2] = __64__TRIInternalServiceRequestHandler_setFailureInjectionDelegate___block_invoke;
  v13[3] = &unk_1E6BB9140;
  v13[4] = self;
  id v5 = v4;
  id v14 = v5;
  id v6 = (void (**)(void, void))MEMORY[0x1E016EA80](v13);
  v6[2](v6, 0);
  promise = self->_promise;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__TRIInternalServiceRequestHandler_setFailureInjectionDelegate___block_invoke_78;
  v10[3] = &unk_1E6BB9168;
  id v11 = v5;
  id v12 = v6;
  id v8 = v5;
  uint64_t v9 = v6;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v10];
}

void __64__TRIInternalServiceRequestHandler_setFailureInjectionDelegate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 44);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (void *)v7;
    uint64_t v9 = "end";
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v12[0] = 67110146;
    if (!a2) {
      uint64_t v9 = "begin";
    }
    v12[1] = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    __int16 v17 = 2080;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s setFailureInjectionDelegate: %@", (uint8_t *)v12, 0x30u);
  }
}

void __64__TRIInternalServiceRequestHandler_setFailureInjectionDelegate___block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__TRIInternalServiceRequestHandler_setFailureInjectionDelegate___block_invoke_2;
    v9[3] = &unk_1E6BB8F60;
    id v10 = *(id *)(a1 + 40);
    id v8 = (void (**)(void))MEMORY[0x1E016EA80](v9);
    [v5 setFailureInjectionDelegate:*(void *)(a1 + 32)];
    if (v8) {
      v8[2](v8);
    }
  }
}

uint64_t __64__TRIInternalServiceRequestHandler_setFailureInjectionDelegate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suspendSQLiteCKDatabaseQueueWithCompletion:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  _DWORD v12[2] = __79__TRIInternalServiceRequestHandler_suspendSQLiteCKDatabaseQueueWithCompletion___block_invoke;
  v12[3] = &unk_1E6BB8F38;
  void v12[4] = self;
  id v5 = (void (**)(void, void))MEMORY[0x1E016EA80](v12);
  v5[2](v5, 0);
  promise = self->_promise;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__TRIInternalServiceRequestHandler_suspendSQLiteCKDatabaseQueueWithCompletion___block_invoke_79;
  v9[3] = &unk_1E6BB8F88;
  id v10 = v4;
  id v11 = v5;
  uint64_t v7 = v5;
  id v8 = v4;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v9];
}

void __79__TRIInternalServiceRequestHandler_suspendSQLiteCKDatabaseQueueWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 44);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (void *)v7;
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2) {
      id v10 = "begin";
    }
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    __int16 v17 = v10;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s suspendSQLiteCKDatabaseQueueWithCompletion:", (uint8_t *)v11, 0x26u);
  }
}

void __79__TRIInternalServiceRequestHandler_suspendSQLiteCKDatabaseQueueWithCompletion___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    _DWORD v12[2] = __79__TRIInternalServiceRequestHandler_suspendSQLiteCKDatabaseQueueWithCompletion___block_invoke_2;
    v12[3] = &unk_1E6BB8F60;
    id v13 = *(id *)(a1 + 40);
    id v8 = (void (**)(void))MEMORY[0x1E016EA80](v12);
    if ([MEMORY[0x1E4F93B08] isInternalBuild])
    {
      uint64_t v9 = [v5 ensureFakeCKDatabase];
      id v10 = [v9 operationQueue];
      dispatch_suspend(v10);
    }
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      (*(void (**)(void))(v11 + 16))();
    }
    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __79__TRIInternalServiceRequestHandler_suspendSQLiteCKDatabaseQueueWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resumeSQLiteCKDatabaseQueueWithCompletion:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  _DWORD v12[2] = __78__TRIInternalServiceRequestHandler_resumeSQLiteCKDatabaseQueueWithCompletion___block_invoke;
  v12[3] = &unk_1E6BB8F38;
  void v12[4] = self;
  id v5 = (void (**)(void, void))MEMORY[0x1E016EA80](v12);
  v5[2](v5, 0);
  promise = self->_promise;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__TRIInternalServiceRequestHandler_resumeSQLiteCKDatabaseQueueWithCompletion___block_invoke_81;
  v9[3] = &unk_1E6BB8F88;
  id v10 = v4;
  id v11 = v5;
  uint64_t v7 = v5;
  id v8 = v4;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v9];
}

void __78__TRIInternalServiceRequestHandler_resumeSQLiteCKDatabaseQueueWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 44);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (void *)v7;
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2) {
      id v10 = "begin";
    }
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    __int16 v17 = v10;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s resumeSQLiteCKDatabaseQueueWithCompletion:", (uint8_t *)v11, 0x26u);
  }
}

void __78__TRIInternalServiceRequestHandler_resumeSQLiteCKDatabaseQueueWithCompletion___block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    _DWORD v12[2] = __78__TRIInternalServiceRequestHandler_resumeSQLiteCKDatabaseQueueWithCompletion___block_invoke_2;
    v12[3] = &unk_1E6BB8F60;
    id v13 = *(id *)(a1 + 40);
    id v8 = (void (**)(void))MEMORY[0x1E016EA80](v12);
    if ([MEMORY[0x1E4F93B08] isInternalBuild])
    {
      uint64_t v9 = [v5 ensureFakeCKDatabase];
      id v10 = [v9 operationQueue];
      dispatch_resume(v10);
    }
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      (*(void (**)(void))(v11 + 16))();
    }
    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __78__TRIInternalServiceRequestHandler_resumeSQLiteCKDatabaseQueueWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeUnusedChannelsWithCompletion:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  _DWORD v12[2] = __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke;
  v12[3] = &unk_1E6BB8F38;
  void v12[4] = self;
  id v5 = (void (**)(void, void))MEMORY[0x1E016EA80](v12);
  v5[2](v5, 0);
  promise = self->_promise;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke_82;
  v9[3] = &unk_1E6BB8F88;
  id v10 = v4;
  id v11 = v5;
  uint64_t v7 = v5;
  id v8 = v4;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v9];
}

void __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 44);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (void *)v7;
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2) {
      id v10 = "begin";
    }
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    __int16 v17 = v10;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s removeUnusedChannelsWithCompletion:", (uint8_t *)v11, 0x26u);
  }
}

void __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke_2;
    v21[3] = &unk_1E6BB8F60;
    id v22 = *(id *)(a1 + 40);
    id v8 = (void (**)(void))MEMORY[0x1E016EA80](v21);
    uint64_t v9 = objc_opt_new();
    id v10 = [v5 rolloutDatabase];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke_3;
    v19[3] = &unk_1E6BB8D18;
    id v11 = v9;
    id v20 = v11;
    [v10 enumerateActiveRecordsWithVisibility:1 usingTransaction:0 block:v19];

    __int16 v12 = objc_opt_new();
    uint64_t v13 = [v5 experimentDatabase];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke_4;
    v17[3] = &unk_1E6BB8D40;
    id v14 = v12;
    id v18 = v14;
    [v13 enumerateActiveExperimentRecordsWithVisibility:1 block:v17];

    uint64_t v15 = [v5 pushServiceMuxer];
    [v15 ensureSubscriptionsExistOnlyForRolloutDeployments:v11 experimentIds:v14 maxChannelsAllowed:75];

    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      (*(void (**)(void))(v16 + 16))();
    }

    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 deployment];
  [v2 addObject:v3];
}

void __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 experimentDeployment];
  id v3 = [v4 experimentId];
  [v2 addObject:v3];
}

- (void)registerNamespaceWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 teamId:(id)a6 appContainerId:(id)a7 appContainerType:(int64_t)a8 cloudKitContainerId:(int)a9 completion:(id)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a10;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __178__TRIInternalServiceRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_completion___block_invoke;
  v43[3] = &unk_1E6BB9190;
  v43[4] = self;
  id v20 = v15;
  id v44 = v20;
  unsigned int v49 = a4;
  id v21 = v16;
  id v45 = v21;
  id v22 = v17;
  id v46 = v22;
  id v23 = v18;
  id v47 = v23;
  int64_t v48 = a8;
  int v50 = a9;
  uint64_t v24 = (void (**)(void, void))MEMORY[0x1E016EA80](v43);
  v24[2](v24, 0);
  promise = self->_promise;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __178__TRIInternalServiceRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_completion___block_invoke_86;
  v33[3] = &unk_1E6BB91E0;
  id v38 = v19;
  id v39 = v24;
  id v34 = v20;
  id v35 = v23;
  id v36 = v22;
  id v37 = v21;
  int64_t v40 = a8;
  unsigned int v41 = a4;
  int v42 = a9;
  id v26 = v21;
  id v27 = v22;
  id v28 = v23;
  id v29 = v20;
  int v30 = v24;
  id v31 = v19;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v33];
}

void __178__TRIInternalServiceRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 44);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    if (a2) {
      id v8 = "end";
    }
    else {
      id v8 = "begin";
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = *(_DWORD *)(a1 + 80);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v17 = *(void *)(a1 + 72);
    uint64_t v13 = TRICloudKitSupport_Container_EnumDescriptor();
    id v14 = [v13 enumNameForValue:*(unsigned int *)(a1 + 84)];
    *(_DWORD *)buf = 67111682;
    int v19 = v5;
    __int16 v20 = 2114;
    id v21 = v7;
    __int16 v22 = 2048;
    uint64_t v23 = v9;
    __int16 v24 = 2080;
    __int16 v25 = v8;
    __int16 v26 = 2114;
    uint64_t v27 = v10;
    __int16 v28 = 1024;
    int v29 = v11;
    __int16 v30 = 2112;
    uint64_t v31 = v12;
    __int16 v32 = 2114;
    uint64_t v33 = v15;
    __int16 v34 = 2112;
    uint64_t v35 = v16;
    __int16 v36 = 1024;
    int v37 = v17;
    __int16 v38 = 2112;
    id v39 = v14;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s registerNamespaceWithNamespaceName:%{public}@ compatibilityVersion:%u defaultsFileURL:%@ teamId:%{public}@ appContainerId:%@ appContainerType:%u cloudKitContainerId:%@", buf, 0x64u);
  }
}

void __178__TRIInternalServiceRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_completion___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __178__TRIInternalServiceRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_completion___block_invoke_2;
    v19[3] = &unk_1E6BB8F60;
    id v20 = *(id *)(a1 + 72);
    id v8 = (void (**)(void))MEMORY[0x1E016EA80](v19);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __178__TRIInternalServiceRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_completion___block_invoke_3;
    v16[3] = &unk_1E6BB91B8;
    id v18 = *(id *)(a1 + 64);
    id v17 = *(id *)(a1 + 32);
    uint64_t v9 = (void (**)(void, void, void))MEMORY[0x1E016EA80](v16);
    if (*(void *)(a1 + 32))
    {
      if (objc_msgSend(MEMORY[0x1E4FB0280], "validateSafeASCIISubsetIdentifier:"))
      {
        if (!*(void *)(a1 + 40))
        {
          uint64_t v13 = @"bundleOrGroupId must be non-nil.";
          goto LABEL_17;
        }
        if (objc_msgSend(MEMORY[0x1E4FB0280], "validateSafeASCIISubsetIdentifier:"))
        {
          uint64_t v10 = *(void *)(a1 + 48);
          if (v10)
          {
            LODWORD(v15) = *(_DWORD *)(a1 + 92);
            +[TRIXPCNamespaceManagementRequestHandler usingServerContext:v5 registerNamespaceWithNamespaceName:*(void *)(a1 + 32) compatibilityVersion:*(unsigned int *)(a1 + 88) defaultsFileURL:*(void *)(a1 + 56) teamId:v10 appContainerId:*(void *)(a1 + 40) appContainerType:*(void *)(a1 + 80) cloudKitContainerId:v15 bundleId:@"com.apple.trial" completion:*(void *)(a1 + 64)];
LABEL_18:

            if (v8) {
              v8[2](v8);
            }

            goto LABEL_21;
          }
          uint64_t v13 = @"teamId not found in caller entitlements.";
LABEL_17:
          ((void (**)(void, uint64_t, __CFString *))v9)[2](v9, 2, v13);
          goto LABEL_18;
        }
        id v14 = (void *)[[NSString alloc] initWithFormat:@"appContainerId(%@) can only contain alphanumeric characters, underscore (_), hyphen (-) or period (.)", *(void *)(a1 + 40)];
        ((void (**)(void, uint64_t, void *))v9)[2](v9, 2, v14);
      }
      else
      {
        id v14 = (void *)[[NSString alloc] initWithFormat:@"namespaceName(%@) can only contain alphanumeric characters, underscore (_), hyphen (-) or period (.)", *(void *)(a1 + 32)];
        ((void (**)(void, uint64_t, void *))v9)[2](v9, 2, v14);
      }

      goto LABEL_18;
    }
    uint64_t v13 = @"namespaceName must be non-nil.";
    goto LABEL_17;
  }
  uint64_t v11 = *(void *)(a1 + 64);
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
  }
LABEL_21:
}

uint64_t __178__TRIInternalServiceRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __178__TRIInternalServiceRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = TRILoggedNamespaceName(*(void **)(a1 + 32));
      *(_DWORD *)buf = 138543618;
      id v14 = v10;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_debug_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEBUG, "failed to register namespace %{public}@: %{public}@", buf, 0x16u);
    }
    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = *MEMORY[0x1E4F28568];
    id v12 = v5;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)deregisterNamespaceWithNamespaceName:(id)a3 teamId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __91__TRIInternalServiceRequestHandler_deregisterNamespaceWithNamespaceName_teamId_completion___block_invoke;
  v24[3] = &unk_1E6BB9078;
  void v24[4] = self;
  id v11 = v8;
  id v25 = v11;
  id v12 = v9;
  id v26 = v12;
  uint64_t v13 = (void (**)(void, void))MEMORY[0x1E016EA80](v24);
  v13[2](v13, 0);
  promise = self->_promise;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __91__TRIInternalServiceRequestHandler_deregisterNamespaceWithNamespaceName_teamId_completion___block_invoke_108;
  v19[3] = &unk_1E6BB90A0;
  id v22 = v10;
  id v23 = v13;
  id v20 = v11;
  id v21 = v12;
  id v15 = v12;
  id v16 = v11;
  uint64_t v17 = v13;
  id v18 = v10;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v19];
}

void __91__TRIInternalServiceRequestHandler_deregisterNamespaceWithNamespaceName_teamId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 44);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (a2) {
      id v8 = "end";
    }
    else {
      id v8 = "begin";
    }
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = TRILoggedNamespaceName(*(void **)(a1 + 40));
    uint64_t v11 = *(void *)(a1 + 48);
    v12[0] = 67110402;
    v12[1] = v5;
    __int16 v13 = 2114;
    id v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 2080;
    id v18 = v8;
    __int16 v19 = 2114;
    id v20 = v10;
    __int16 v21 = 2114;
    uint64_t v22 = v11;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s deregisterNamespaceWithNamespaceName:%{public}@ teamId:%{public}@ completion:", (uint8_t *)v12, 0x3Au);
  }
}

void __91__TRIInternalServiceRequestHandler_deregisterNamespaceWithNamespaceName_teamId_completion___block_invoke_108(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && v6)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __91__TRIInternalServiceRequestHandler_deregisterNamespaceWithNamespaceName_teamId_completion___block_invoke_2;
    v19[3] = &unk_1E6BB8F60;
    id v20 = a1[7];
    id v8 = (void (**)(void))MEMORY[0x1E016EA80](v19);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __91__TRIInternalServiceRequestHandler_deregisterNamespaceWithNamespaceName_teamId_completion___block_invoke_3;
    v16[3] = &unk_1E6BB91B8;
    id v18 = a1[6];
    id v17 = a1[4];
    uint64_t v9 = (void (**)(void, void, void))MEMORY[0x1E016EA80](v16);
    if (a1[4])
    {
      id v10 = a1[5];
      if (v10)
      {
        if ([v10 length])
        {
          id v11 = a1[4];
          id v12 = [a1[5] stringByAppendingString:@"."];
          LOBYTE(v11) = [v11 hasPrefix:v12];

          if (v11)
          {
            +[TRIXPCNamespaceManagementRequestHandler usingServerContext:v5 deregisterNamespaceWithName:a1[4] teamId:a1[5] taskQueue:v7 completion:a1[6]];
LABEL_14:

            if (v8) {
              v8[2](v8);
            }

            goto LABEL_17;
          }
        }
        __int16 v15 = @"app not entitled to remove namespace.";
      }
      else
      {
        __int16 v15 = @"teamId must be non-nil.";
      }
    }
    else
    {
      __int16 v15 = @"namespaceName must be non-nil.";
    }
    ((void (**)(void, uint64_t, __CFString *))v9)[2](v9, 2, v15);
    goto LABEL_14;
  }
  __int16 v13 = (void (**)(id, void, void *))a1[6];
  if (v13)
  {
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
    v13[2](v13, 0, v14);
  }
LABEL_17:
}

uint64_t __91__TRIInternalServiceRequestHandler_deregisterNamespaceWithNamespaceName_teamId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__TRIInternalServiceRequestHandler_deregisterNamespaceWithNamespaceName_teamId_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v10 = TRILoggedNamespaceName(*(void **)(a1 + 32));
      *(_DWORD *)buf = 138543618;
      id v14 = v10;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_debug_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEBUG, "failed to deregister namespace %{public}@: %{public}@", buf, 0x16u);
    }
    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = *MEMORY[0x1E4F28568];
    id v12 = v5;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)startDownloadNamespaceWithName:(id)a3 teamId:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __93__TRIInternalServiceRequestHandler_startDownloadNamespaceWithName_teamId_options_completion___block_invoke;
  v30[3] = &unk_1E6BB9208;
  v30[4] = self;
  id v14 = v10;
  id v31 = v14;
  id v15 = v11;
  id v32 = v15;
  id v16 = v12;
  id v33 = v16;
  uint64_t v17 = (void (**)(void, void))MEMORY[0x1E016EA80](v30);
  v17[2](v17, 0);
  promise = self->_promise;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __93__TRIInternalServiceRequestHandler_startDownloadNamespaceWithName_teamId_options_completion___block_invoke_118;
  v24[3] = &unk_1E6BB9230;
  id v28 = v13;
  id v29 = v17;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  uint64_t v22 = v17;
  id v23 = v13;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v24];
}

void __93__TRIInternalServiceRequestHandler_startDownloadNamespaceWithName_teamId_options_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1[4] + 44);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (void *)v7;
    uint64_t v9 = "end";
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    if (!a2) {
      uint64_t v9 = "begin";
    }
    uint64_t v12 = a1[6];
    uint64_t v13 = a1[7];
    v14[0] = 67110658;
    v14[1] = v5;
    __int16 v15 = 2114;
    uint64_t v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v10;
    __int16 v19 = 2080;
    id v20 = v9;
    __int16 v21 = 2114;
    uint64_t v22 = v11;
    __int16 v23 = 2114;
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s startDownloadNamespaceWithName:%{public}@ teamId:%{public}@ options:%@ completion:", (uint8_t *)v14, 0x44u);
  }
}

void __93__TRIInternalServiceRequestHandler_startDownloadNamespaceWithName_teamId_options_completion___block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __93__TRIInternalServiceRequestHandler_startDownloadNamespaceWithName_teamId_options_completion___block_invoke_2;
    v18[3] = &unk_1E6BB8F60;
    id v19 = *(id *)(a1 + 64);
    id v8 = (void (**)(void))MEMORY[0x1E016EA80](v18);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __93__TRIInternalServiceRequestHandler_startDownloadNamespaceWithName_teamId_options_completion___block_invoke_3;
    v15[3] = &unk_1E6BB91B8;
    id v17 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 32);
    uint64_t v9 = MEMORY[0x1E016EA80](v15);
    uint64_t v10 = (void *)v9;
    if (*(void *)(a1 + 32))
    {
      if (*(void *)(a1 + 40))
      {
        uint64_t v11 = [[TRITaskAttributionInternalInsecure alloc] initWithTeamIdentifier:*(void *)(a1 + 40) triCloudKitContainer:2 applicationBundleIdentifier:@"com.apple.triald" networkOptions:*(void *)(a1 + 48)];
        +[TRIXPCNamespaceManagementRequestHandler usingServerContext:v5 taskQueue:v7 startDownloadNamespaceWithName:*(void *)(a1 + 32) attribution:v11 completion:*(void *)(a1 + 56)];

LABEL_11:
        if (v8) {
          v8[2](v8);
        }

        goto LABEL_14;
      }
      id v14 = @"teamId must be non-nil.";
    }
    else
    {
      id v14 = @"namespaceName must be non-nil.";
    }
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v9 + 16))(v9, 2, v14);
    goto LABEL_11;
  }
  uint64_t v12 = *(void *)(a1 + 56);
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
LABEL_14:
}

uint64_t __93__TRIInternalServiceRequestHandler_startDownloadNamespaceWithName_teamId_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__TRIInternalServiceRequestHandler_startDownloadNamespaceWithName_teamId_options_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_debug_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEBUG, "failed to deregister namespace %{public}@: %{public}@", buf, 0x16u);
    }

    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = *MEMORY[0x1E4F28568];
    id v12 = v5;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)dynamicNamespaceRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  _DWORD v12[2] = __74__TRIInternalServiceRequestHandler_dynamicNamespaceRecordsWithCompletion___block_invoke;
  v12[3] = &unk_1E6BB8F38;
  void v12[4] = self;
  id v5 = (void (**)(void, void))MEMORY[0x1E016EA80](v12);
  v5[2](v5, 0);
  promise = self->_promise;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__TRIInternalServiceRequestHandler_dynamicNamespaceRecordsWithCompletion___block_invoke_123;
  v9[3] = &unk_1E6BB8F88;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v9];
}

void __74__TRIInternalServiceRequestHandler_dynamicNamespaceRecordsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 44);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (void *)v7;
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2) {
      id v10 = "begin";
    }
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s dynamicNamespaceRecordsWithCompletion:", (uint8_t *)v11, 0x26u);
  }
}

void __74__TRIInternalServiceRequestHandler_dynamicNamespaceRecordsWithCompletion___block_invoke_123(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__TRIInternalServiceRequestHandler_dynamicNamespaceRecordsWithCompletion___block_invoke_2;
    v19[3] = &unk_1E6BB8F60;
    id v20 = *(id *)(a1 + 40);
    id v8 = (void (**)(void))MEMORY[0x1E016EA80](v19);
    uint64_t v9 = objc_opt_new();
    id v10 = [v5 namespaceDatabase];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__TRIInternalServiceRequestHandler_dynamicNamespaceRecordsWithCompletion___block_invoke_3;
    v17[3] = &unk_1E6BB8CF0;
    id v11 = v9;
    id v18 = v11;
    int v12 = [v10 enumerateDynamicNamespaceRecordsWithBlock:v17];

    uint64_t v13 = *(void *)(a1 + 32);
    if (v13)
    {
      if (v12) {
        id v14 = v11;
      }
      else {
        id v14 = 0;
      }
      (*(void (**)(uint64_t, id, void))(v13 + 16))(v13, v14, 0);
    }

    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15)
    {
      __int16 v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
    }
  }
}

uint64_t __74__TRIInternalServiceRequestHandler_dynamicNamespaceRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__TRIInternalServiceRequestHandler_dynamicNamespaceRecordsWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)subscriptionForNamespaceName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  promise = self->_promise;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _DWORD v11[2] = __76__TRIInternalServiceRequestHandler_subscriptionForNamespaceName_completion___block_invoke;
  v11[3] = &unk_1E6BB9168;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v11];
}

void __76__TRIInternalServiceRequestHandler_subscriptionForNamespaceName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11 && v5)
  {
    id v6 = [v11 keyValueStore];
    id v7 = +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:v6];

    id v8 = [v7 subscribedFactorsForNamespaceName:*(void *)(a1 + 32)];
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v8, 0);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (!v10) {
      goto LABEL_9;
    }
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, MEMORY[0x1E4F1CBF0], v7);
  }

LABEL_9:
}

- (void)setSubscription:(id)a3 namespaceName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  promise = self->_promise;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__TRIInternalServiceRequestHandler_setSubscription_namespaceName_completion___block_invoke;
  v15[3] = &unk_1E6BB9258;
  id v17 = v9;
  id v18 = v10;
  id v16 = v8;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v15];
}

void __77__TRIInternalServiceRequestHandler_setSubscription_namespaceName_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && v6)
  {
    id v8 = [v5 keyValueStore];
    id v9 = +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:v8];

    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    id v16 = 0;
    uint64_t v12 = [v9 setSubscriptionWithFactorNames:v10 inNamespaceName:v11 error:&v16];
    id v13 = v16;
    uint64_t v14 = a1[6];
    if (v14) {
      (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, v12, v13);
    }

    goto LABEL_8;
  }
  uint64_t v15 = a1[6];
  if (v15)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v9);
LABEL_8:
  }
}

- (void)activeRolloutInformationWithPrivacyFilterPolicy:(unsigned __int8)a3 completion:(id)a4
{
  id v6 = a4;
  promise = self->_promise;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__TRIInternalServiceRequestHandler_activeRolloutInformationWithPrivacyFilterPolicy_completion___block_invoke;
  v9[3] = &unk_1E6BB92E8;
  id v10 = v6;
  unsigned __int8 v11 = a3;
  id v8 = v6;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v9];
}

void __95__TRIInternalServiceRequestHandler_activeRolloutInformationWithPrivacyFilterPolicy_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v50 = v5;
  if (v5 && v6)
  {
    id v48 = v6;
    uint64_t v49 = a1;
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__7;
    v70 = __Block_byref_object_dispose__7;
    id v71 = (id)objc_opt_new();
    id v7 = [v5 rolloutDatabase];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __95__TRIInternalServiceRequestHandler_activeRolloutInformationWithPrivacyFilterPolicy_completion___block_invoke_126;
    v64[3] = &unk_1E6BB9280;
    char v65 = *(unsigned char *)(a1 + 40);
    v64[4] = &v66;
    char v8 = [v7 enumerateRecordsUsingTransaction:0 block:v64];

    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
      id v10 = [(id)v67[5] sortedArrayUsingComparator:&__block_literal_global_4];
      uint64_t v11 = [v9 initWithArray:v10];
      uint64_t v12 = (void *)v67[5];
      v67[5] = v11;

      id v13 = objc_alloc(MEMORY[0x1E4FB00C8]);
      uint64_t v14 = [v50 paths];
      uint64_t v15 = (void *)[v13 initWithPaths:v14 factorsState:0];

      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id obj = (id)v67[5];
      uint64_t v17 = [obj countByEnumeratingWithState:&v60 objects:v75 count:16];
      v52 = v16;
      if (v17)
      {
        uint64_t v53 = *(void *)v61;
        do
        {
          uint64_t v18 = 0;
          uint64_t v54 = v17;
          do
          {
            if (*(void *)v61 != v53) {
              objc_enumerationMutation(obj);
            }
            id v19 = *(void **)(*((void *)&v60 + 1) + 8 * v18);
            context = (void *)MEMORY[0x1E016E7F0]();
            id v20 = [v19 activeFactorPackSetId];
            BOOL v21 = v20 == 0;

            if (!v21)
            {
              v73[0] = @"rolloutId";
              uint64_t v22 = [v19 deployment];
              __int16 v23 = [v22 rolloutId];
              v74[0] = v23;
              v73[1] = @"deploymentId";
              uint64_t v24 = NSNumber;
              __int16 v25 = [v19 deployment];
              uint64_t v26 = objc_msgSend(v24, "numberWithInt:", objc_msgSend(v25, "deploymentId"));
              v74[1] = v26;
              v73[2] = @"status";
              unint64_t v27 = [v19 status] - 1;
              id v28 = @"inactive  ";
              if (v27 <= 3) {
                id v28 = off_1E6BB94C0[v27];
              }
              id v29 = [(__CFString *)v28 triTrim];
              v74[2] = v29;
              __int16 v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:3];
              id v31 = (void *)[v30 mutableCopy];

              [v52 addObject:v31];
              id v32 = [v19 rampId];
              [v31 setObject:v32 forKeyedSubscript:@"rampId"];

              id v33 = [v19 activeFactorPackSetId];
              [v31 setObject:v33 forKeyedSubscript:@"activeFactorPackSetId"];

              __int16 v34 = [v19 targetedFactorPackSetId];
              [v31 setObject:v34 forKeyedSubscript:@"targetedFactorPackSetId"];

              uint64_t v35 = objc_opt_new();
              [v31 setObject:v35 forKeyedSubscript:@"namespaces"];
              __int16 v36 = [v19 artifact];
              int v37 = [v36 rollout];
              __int16 v38 = [v37 selectedNamespaceArray];
              id v39 = [v38 sortedArrayUsingComparator:&__block_literal_global_172];

              long long v58 = 0u;
              long long v59 = 0u;
              long long v56 = 0u;
              long long v57 = 0u;
              id v40 = v39;
              uint64_t v41 = [v40 countByEnumeratingWithState:&v56 objects:v72 count:16];
              if (v41)
              {
                uint64_t v42 = *(void *)v57;
                do
                {
                  for (uint64_t i = 0; i != v41; ++i)
                  {
                    if (*(void *)v57 != v42) {
                      objc_enumerationMutation(v40);
                    }
                    id v44 = _namespaceDictionaryForClientSelectedNamespace(*(void **)(*((void *)&v56 + 1) + 8 * i), v15);
                    [v35 addObject:v44];
                  }
                  uint64_t v41 = [v40 countByEnumeratingWithState:&v56 objects:v72 count:16];
                }
                while (v41);
              }
            }
            ++v18;
          }
          while (v18 != v54);
          uint64_t v17 = [obj countByEnumeratingWithState:&v60 objects:v75 count:16];
        }
        while (v17);
      }

      (*(void (**)(void))(*(void *)(v49 + 32) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    _Block_object_dispose(&v66, 8);

    id v6 = v48;
  }
  else
  {
    uint64_t v45 = *(void *)(a1 + 32);
    if (v45)
    {
      id v46 = v6;
      id v47 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v45 + 16))(v45, 0, v47);

      id v6 = v46;
    }
  }
}

void __95__TRIInternalServiceRequestHandler_activeRolloutInformationWithPrivacyFilterPolicy_completion___block_invoke_126(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend(v3, "namespaces", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([MEMORY[0x1E4FB01B8] shouldPrivacyFilterNamespace:*(void *)(*((void *)&v9 + 1) + 8 * v8) policy:*(unsigned __int8 *)(a1 + 40)])
        {

          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
LABEL_11:
}

uint64_t __95__TRIInternalServiceRequestHandler_activeRolloutInformationWithPrivacyFilterPolicy_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 deployment];
  uint64_t v7 = [v6 rolloutId];
  uint64_t v8 = [v5 deployment];
  long long v9 = [v8 rolloutId];
  uint64_t v10 = [v7 compare:v9];

  if (!v10)
  {
    long long v11 = NSNumber;
    long long v12 = [v4 deployment];
    id v13 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "deploymentId"));
    uint64_t v14 = NSNumber;
    uint64_t v15 = [v5 deployment];
    id v16 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "deploymentId"));
    uint64_t v10 = [v13 compare:v16];
  }
  return v10;
}

uint64_t __95__TRIInternalServiceRequestHandler_activeRolloutInformationWithPrivacyFilterPolicy_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_experimentRecordsWithDeploymentEnvironments:(id)a3 privacyFilterPolicy:(unsigned __int8)a4 serverContext:(id)a5 completion:(id)a6
{
  int v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke;
  v34[3] = &unk_1E6BB8F38;
  v34[4] = self;
  id v13 = (void (**)(void, void))MEMORY[0x1E016EA80](v34);
  v13[2](v13, 0);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke_173;
  v32[3] = &unk_1E6BB8F60;
  uint64_t v14 = v13;
  id v33 = v14;
  uint64_t v15 = (void (**)(void))MEMORY[0x1E016EA80](v32);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke_2;
  v30[3] = &unk_1E6BB8FD8;
  id v16 = v12;
  id v31 = v16;
  uint64_t v17 = (void (**)(void, void, void))MEMORY[0x1E016EA80](v30);
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F347B2A0];
  if (v10)
  {
    if ([v10 isSubsetOfSet:v18])
    {
      int v24 = v8;
      id v19 = objc_opt_new();
      id v20 = [v11 experimentDatabase];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      void v27[2] = __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke_188;
      v27[3] = &unk_1E6BB9310;
      id v28 = v10;
      id v21 = v19;
      id v29 = v21;
      char v22 = [v20 enumerateExperimentRecordsWithBlock:v27];

      if (v22)
      {
        if (v24)
        {
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke_2_194;
          v25[3] = &__block_descriptor_33_e25_B24__0_8__NSDictionary_16l;
          char v26 = v24;
          __int16 v23 = [MEMORY[0x1E4F28F60] predicateWithBlock:v25];
          [v21 filterUsingPredicate:v23];
        }
        if (v16) {
          (*((void (**)(id, id, void))v16 + 2))(v16, v21, 0);
        }
      }
      else
      {
        ((void (**)(void, uint64_t, __CFString *))v17)[2](v17, 12, @"The database query failed.");
      }
    }
    else
    {
      id v21 = (id)[[NSString alloc] initWithFormat:@"The calling process is not entitled for access to deployment environments %@.", v10];
      ((void (**)(void, uint64_t, id))v17)[2](v17, 3, v21);
    }
  }
  else
  {
    ((void (**)(void, uint64_t, __CFString *))v17)[2](v17, 2, @"Parameter 'environments' must be non-nil.");
  }

  if (v15) {
    v15[2](v15);
  }
}

void __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 44);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = (void *)v7;
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2) {
      id v10 = "begin";
    }
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s experimentRecordsWithDeploymentEnvironments:completion:", (uint8_t *)v11, 0x26u);
  }
}

uint64_t __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke_173(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v5;
      _os_log_debug_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEBUG, "experimentRecordsWithDeploymentEnvironments: %{public}@", buf, 0xCu);
    }

    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v10 = *MEMORY[0x1E4F28568];
    id v11 = v5;
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke_188(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v18 = v3;
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "deploymentEnvironment"));
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    id v17 = objc_alloc(MEMORY[0x1E4FB01F8]);
    uint64_t v6 = [v18 deploymentEnvironment];
    id v7 = [v18 experimentDeployment];
    int v8 = [v18 treatmentId];
    uint64_t v9 = [v18 factorPackSetId];
    uint64_t v10 = [v18 type];
    uint64_t v11 = [v18 status];
    __int16 v12 = [v18 startDate];
    id v13 = [v18 endDate];
    uint64_t v14 = [v18 namespaces];
    LOBYTE(v16) = [v18 isShadow];
    uint64_t v15 = (void *)[v17 initWithDeploymentEnvironment:v6 experimentDeployment:v7 treatmentId:v8 factorPackSetId:v9 type:v10 status:v11 startDate:v12 endDate:v13 namespaces:v14 isShadow:v16];

    [*(id *)(a1 + 40) addObject:v15];
  }
}

uint64_t __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke_2_194(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(a2, "namespaces", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = (void *)MEMORY[0x1E4FB01B8];
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v7) name];
        LOBYTE(v8) = [v8 shouldPrivacyFilterNamespace:v9 policy:*(unsigned __int8 *)(a1 + 32)];

        if (v8)
        {
          uint64_t v10 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_11:

  return v10;
}

- (void)activeExperimentInformationWithPrivacyFilterPolicy:(unsigned __int8)a3 completion:(id)a4
{
  id v5 = a4;
  promise = self->_promise;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98__TRIInternalServiceRequestHandler_activeExperimentInformationWithPrivacyFilterPolicy_completion___block_invoke;
  v8[3] = &unk_1E6BB9168;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v8];
}

void __98__TRIInternalServiceRequestHandler_activeExperimentInformationWithPrivacyFilterPolicy_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  long long v59 = v5;
  if (v5 && v6)
  {
    id v52 = v6;
    uint64_t v87 = 0;
    v88 = &v87;
    uint64_t v89 = 0x3032000000;
    v90 = __Block_byref_object_copy__7;
    v91 = __Block_byref_object_dispose__7;
    id v92 = 0;
    int v8 = *(void **)(a1 + 32);
    id v9 = (void *)MEMORY[0x1E016E7F0]();
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F347B5A0, 0);
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __98__TRIInternalServiceRequestHandler_activeExperimentInformationWithPrivacyFilterPolicy_completion___block_invoke_2;
    v86[3] = &unk_1E6BB9358;
    v86[4] = &v87;
    [v8 _experimentRecordsWithDeploymentEnvironments:v10 privacyFilterPolicy:1 serverContext:v59 completion:v86];

    long long v57 = objc_opt_new();
    uint64_t v68 = [MEMORY[0x1E4FB0098] clientWithIdentifier:1];
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id obj = (id)v88[5];
    uint64_t v53 = [obj countByEnumeratingWithState:&v82 objects:v97 count:16];
    if (!v53) {
      goto LABEL_40;
    }
    uint64_t v54 = *(void *)v83;
    while (1)
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v83 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        v95[0] = @"experiment";
        long long v12 = [v11 experimentId];
        v96[0] = v12;
        v95[1] = @"deploymentId";
        long long v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "deploymentId"));
        v96[1] = v13;
        v95[2] = @"treatmentId";
        long long v14 = [v11 treatmentId];
        v96[2] = v14;
        long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:3];
        long long v58 = (void *)[v15 mutableCopy];

        [v57 addObject:v58];
        uint64_t v16 = objc_opt_new();
        [v58 setObject:v16 forKeyedSubscript:@"namespaces"];
        long long v63 = (void *)v16;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v60 = [v11 namespaces];
        uint64_t v62 = [v60 countByEnumeratingWithState:&v78 objects:v94 count:16];
        if (v62)
        {
          uint64_t v61 = *(void *)v79;
          do
          {
            for (uint64_t j = 0; j != v62; ++j)
            {
              if (*(void *)v79 != v61) {
                objc_enumerationMutation(v60);
              }
              id v71 = *(void **)(*((void *)&v78 + 1) + 8 * j);
              uint64_t v66 = [MEMORY[0x1E4F1CA60] dictionary];
              [v63 addObject:v66];
              uint64_t v17 = [v71 name];
              [v66 setObject:v17 forKeyedSubscript:@"name"];

              id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v71, "compatibilityVersion"));
              [v66 setObject:v18 forKeyedSubscript:@"compatibility"];

              uint64_t v19 = objc_opt_new();
              [v66 setObject:v19 forKeyedSubscript:@"factors"];
              v70 = (void *)v19;
              id v20 = *(void **)(a1 + 32);
              id v21 = [v71 name];
              char v22 = [v20 _activeExperimentFactorLevelsForNamespaceName:v21];

              long long v76 = 0u;
              long long v77 = 0u;
              long long v74 = 0u;
              long long v75 = 0u;
              id v67 = v22;
              uint64_t v23 = [v67 countByEnumeratingWithState:&v74 objects:v93 count:16];
              if (v23)
              {
                uint64_t v69 = *(void *)v75;
                do
                {
                  uint64_t v72 = v23;
                  for (uint64_t k = 0; k != v72; ++k)
                  {
                    if (*(void *)v75 != v69) {
                      objc_enumerationMutation(v67);
                    }
                    __int16 v25 = *(void **)(*((void *)&v74 + 1) + 8 * k);
                    char v26 = [v25 factor];
                    unint64_t v27 = [v26 name];
                    id v28 = [v71 name];
                    id v29 = [v68 levelForFactor:v27 withNamespaceName:v28];

                    if ([v29 levelOneOfCase] == 101)
                    {
                      __int16 v30 = [v29 directoryValue];
                      id v31 = [v30 path];

                      id v32 = [v29 directoryValue];
                      id v33 = [v32 asset];
                      uint64_t v34 = [v33 size];

                      uint64_t v35 = [v29 directoryValue];
                      __int16 v36 = [v35 asset];
                      uint64_t v37 = [v36 assetId];
                    }
                    else
                    {
                      if ([v29 levelOneOfCase] != 100)
                      {
                        uint64_t v34 = 0;
                        uint64_t v41 = 0;
                        id v31 = &stru_1F3455898;
                        goto LABEL_24;
                      }
                      __int16 v38 = [v29 fileValue];
                      id v31 = [v38 path];

                      id v39 = [v29 fileValue];
                      id v40 = [v39 asset];
                      uint64_t v34 = [v40 size];

                      uint64_t v35 = [v29 fileValue];
                      __int16 v36 = [v35 asset];
                      uint64_t v37 = [v36 assetId];
                    }
                    uint64_t v41 = (void *)v37;

LABEL_24:
                    uint64_t v42 = [MEMORY[0x1E4F1CA60] dictionary];
                    v43 = [v25 factor];
                    id v44 = [v43 name];
                    [v42 setObject:v44 forKeyedSubscript:@"name"];

                    uint64_t v45 = [v29 metadata];
                    [v42 setObject:v45 forKeyedSubscript:@"metadata"];

                    id v46 = [v25 factor];
                    id v47 = [v46 typeString];
                    [v42 setObject:v47 forKeyedSubscript:@"type"];

                    if (v31 && [(__CFString *)v31 length])
                    {
                      [v42 setObject:v41 forKeyedSubscript:@"assetReference"];
                      [v42 setObject:v31 forKeyedSubscript:@"path"];
                      if (!v34) {
                        goto LABEL_34;
                      }
                      id v48 = [NSNumber numberWithUnsignedLongLong:v34];
                      [v42 setObject:v48 forKeyedSubscript:@"size"];
                    }
                    else
                    {
                      id v48 = [v29 object];
                      if (v48)
                      {
                        uint64_t v49 = NSString;
                        v73 = [v29 object];
                        id v3 = [v49 stringWithFormat:@"%@", v73];
                        int v50 = v3;
                      }
                      else
                      {
                        int v50 = &stru_1F3455898;
                      }
                      [v42 setObject:v50 forKeyedSubscript:@"levelValue"];
                      if (v48)
                      {
                      }
                    }

LABEL_34:
                    [v70 addObject:v42];
                  }
                  uint64_t v23 = [v67 countByEnumeratingWithState:&v74 objects:v93 count:16];
                }
                while (v23);
              }
            }
            uint64_t v62 = [v60 countByEnumeratingWithState:&v78 objects:v94 count:16];
          }
          while (v62);
        }
      }
      uint64_t v53 = [obj countByEnumeratingWithState:&v82 objects:v97 count:16];
      if (!v53)
      {
LABEL_40:

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        _Block_object_dispose(&v87, 8);

        id v7 = v52;
        goto LABEL_43;
      }
    }
  }
  uint64_t v51 = *(void *)(a1 + 40);
  if (v51) {
    (*(void (**)(uint64_t, void))(v51 + 16))(v51, MEMORY[0x1E4F1CBF0]);
  }
LABEL_43:
}

void __98__TRIInternalServiceRequestHandler_activeExperimentInformationWithPrivacyFilterPolicy_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v5;
    uint64_t v11 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      __int16 v36 = v7;
      id v37 = v5;
      uint64_t v13 = *(void *)v50;
      uint64_t v39 = *(void *)v50;
      do
      {
        uint64_t v14 = 0;
        uint64_t v40 = v12;
        do
        {
          if (*(void *)v50 != v13) {
            objc_enumerationMutation(obj);
          }
          long long v15 = *(void **)(*((void *)&v49 + 1) + 8 * v14);
          if (objc_msgSend(v15, "status", v36, v37) == 1)
          {
            uint64_t v16 = [v15 treatmentId];

            if (v16)
            {
              uint64_t v17 = objc_opt_new();
              long long v45 = 0u;
              long long v46 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              id v44 = v15;
              id v18 = [v15 namespaces];
              uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v53 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v46;
                do
                {
                  for (uint64_t i = 0; i != v20; ++i)
                  {
                    if (*(void *)v46 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    uint64_t v23 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                    id v24 = objc_alloc(MEMORY[0x1E4FB0278]);
                    __int16 v25 = [v23 name];
                    char v26 = objc_msgSend(v24, "initWithName:compatibilityVersion:", v25, objc_msgSend(v23, "compatibilityVersion"));
                    [v17 addObject:v26];
                  }
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v45 objects:v53 count:16];
                }
                while (v20);
              }

              v43 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
              id v27 = objc_alloc(MEMORY[0x1E4FB00F0]);
              id v28 = [v44 startDate];
              uint64_t v29 = (uint64_t)v28;
              if (!v28)
              {
                uint64_t v29 = objc_opt_new();
                __int16 v38 = (void *)v29;
              }
              uint64_t v42 = [v44 experimentDeployment];
              __int16 v30 = [v42 experimentId];
              id v31 = [v44 experimentDeployment];
              uint64_t v32 = [v31 deploymentId];
              id v33 = [v44 treatmentId];
              uint64_t v34 = (void *)[v27 initWithType:2 date:v29 experimentId:v30 deploymentId:v32 treatmentId:v33 namespaces:v17];
              [v43 addObject:v34];

              if (!v28) {
              uint64_t v13 = v39;
              }
              uint64_t v12 = v40;
            }
          }
          ++v14;
        }
        while (v14 != v12);
        uint64_t v12 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v12);
      id v7 = v36;
      id v5 = v37;
    }
LABEL_27:

    goto LABEL_28;
  }
  if (v6)
  {
    id obj = TRILogCategory_Server();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = [v7 localizedDescription];
      *(_DWORD *)buf = 138543362;
      long long v56 = v35;
      _os_log_error_impl(&dword_1DA291000, obj, OS_LOG_TYPE_ERROR, "activeExperimentInformationWithPrivacyFilterPolicy: %{public}@", buf, 0xCu);
    }
    goto LABEL_27;
  }
LABEL_28:
}

- (id)_activeExperimentFactorLevelsForNamespaceName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = objc_opt_new();
  id v6 = (void *)MEMORY[0x1E4FB01A8];
  id v7 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  uint64_t v8 = [v6 factorProviderWithNamespaceName:v3 paths:v7 treatmentLayer:4 faultOnMissingFactors:1 shouldLockFactorDirectory:1];

  uint64_t v9 = [v8 factorLevels];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __82__TRIInternalServiceRequestHandler__activeExperimentFactorLevelsForNamespaceName___block_invoke;
  v25[3] = &unk_1E6BB9380;
  id v10 = v4;
  id v26 = v10;
  id v11 = v5;
  id v27 = v11;
  [v9 enumerateObjectsUsingBlock:v25];

  if (_os_feature_enabled_impl())
  {
    uint64_t v12 = (void *)MEMORY[0x1E4FB01A8];
    uint64_t v13 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
    uint64_t v14 = [v12 factorProviderWithNamespaceName:v3 paths:v13 treatmentLayer:32 faultOnMissingFactors:1 shouldLockFactorDirectory:1];

    long long v15 = [v14 factorLevels];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __82__TRIInternalServiceRequestHandler__activeExperimentFactorLevelsForNamespaceName___block_invoke_2;
    char v22 = &unk_1E6BB9380;
    id v23 = v10;
    id v24 = v11;
    [v15 enumerateObjectsUsingBlock:&v19];
  }
  uint64_t v16 = objc_msgSend(v10, "allValues", v19, v20, v21, v22);
  [v11 addObjectsFromArray:v16];

  uint64_t v17 = [v11 sortedArrayUsingComparator:&__block_literal_global_248];

  return v17;
}

void __82__TRIInternalServiceRequestHandler__activeExperimentFactorLevelsForNamespaceName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 factor];
  id v5 = [v4 name];

  if (v5) {
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v5];
  }
  else {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __82__TRIInternalServiceRequestHandler__activeExperimentFactorLevelsForNamespaceName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 factor];
  id v5 = [v4 name];

  if (v5) {
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v5];
  }
  else {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

uint64_t __82__TRIInternalServiceRequestHandler__activeExperimentFactorLevelsForNamespaceName___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v5 factor];
  id v7 = [v6 name];

  if (v7)
  {
    uint64_t v8 = [v4 factor];
    uint64_t v9 = [v8 name];
    id v10 = [v5 factor];
    id v11 = [v10 name];
    uint64_t v12 = [v9 compare:v11];
  }
  else
  {
    uint64_t v12 = -1;
  }

  return v12;
}

- (void)activeBMLTInformationWithPrivacyFilterPolicy:(unsigned __int8)a3 completion:(id)a4
{
  id v6 = a4;
  promise = self->_promise;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__TRIInternalServiceRequestHandler_activeBMLTInformationWithPrivacyFilterPolicy_completion___block_invoke;
  v9[3] = &unk_1E6BB92E8;
  id v10 = v6;
  unsigned __int8 v11 = a3;
  id v8 = v6;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v9];
}

void __92__TRIInternalServiceRequestHandler_activeBMLTInformationWithPrivacyFilterPolicy_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v44 = v4;
  if (v4 && v5)
  {
    id v42 = v5;
    uint64_t v57 = 0;
    long long v58 = &v57;
    uint64_t v59 = 0x3032000000;
    id v60 = __Block_byref_object_copy__7;
    uint64_t v61 = __Block_byref_object_dispose__7;
    id v62 = (id)objc_opt_new();
    id v6 = [v4 bmltDatabase];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __92__TRIInternalServiceRequestHandler_activeBMLTInformationWithPrivacyFilterPolicy_completion___block_invoke_2;
    v55[3] = &unk_1E6BB93C8;
    char v56 = *(unsigned char *)(a1 + 40);
    v55[4] = &v57;
    char v7 = [v6 enumerateActiveTasksWithBlock:v55];

    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v9 = [(id)v58[5] sortedArrayUsingComparator:&__block_literal_global_252];
      uint64_t v10 = [v8 initWithArray:v9];
      unsigned __int8 v11 = (void *)v58[5];
      v58[5] = v10;

      id v12 = objc_alloc(MEMORY[0x1E4FB00C8]);
      uint64_t v13 = [v44 paths];
      long long v45 = (void *)[v12 initWithPaths:v13 factorsState:0];

      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id obj = (id)v58[5];
      uint64_t v15 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
      long long v47 = v14;
      if (v15)
      {
        uint64_t v48 = *(void *)v52;
        do
        {
          uint64_t v16 = 0;
          uint64_t v49 = v15;
          do
          {
            if (*(void *)v52 != v48) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void **)(*((void *)&v51 + 1) + 8 * v16);
            context = (void *)MEMORY[0x1E016E7F0]();
            id v18 = [v17 activeFactorPackSetId];
            BOOL v19 = v18 == 0;

            if (!v19)
            {
              v63[0] = @"bmltId";
              uint64_t v20 = [v17 bmltDeployment];
              uint64_t v21 = [v20 backgroundMLTaskId];
              v64[0] = v21;
              v63[1] = @"deploymentId";
              char v22 = NSNumber;
              id v23 = [v17 bmltDeployment];
              id v24 = objc_msgSend(v22, "numberWithInt:", objc_msgSend(v23, "deploymentId"));
              v64[1] = v24;
              v63[2] = @"pluginId";
              __int16 v25 = [v17 pluginId];
              v64[2] = v25;
              v63[3] = @"status";
              unint64_t v26 = [v17 status] - 1;
              id v27 = @"inactive  ";
              if (v26 <= 3) {
                id v27 = off_1E6BB94E0[v26];
              }
              id v28 = [(__CFString *)v27 triTrim];
              v64[3] = v28;
              uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:4];
              __int16 v30 = (void *)[v29 mutableCopy];

              [v47 addObject:v30];
              id v31 = [v17 activeFactorPackSetId];
              [v30 setObject:v31 forKeyedSubscript:@"activeFactorPackSetId"];

              uint64_t v32 = objc_opt_new();
              [v30 setObject:v32 forKeyedSubscript:@"namespaces"];
              id v33 = [v17 artifact];
              uint64_t v34 = [v33 backgroundTask];
              uint64_t v35 = [v34 selectedNamespace];

              if (v35)
              {
                __int16 v36 = _namespaceDictionaryForClientSelectedNamespace(v35, v45);
                [v32 addObject:v36];
              }
            }
            ++v16;
          }
          while (v49 != v16);
          uint64_t v15 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
        }
        while (v15);
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id v37 = v45;
    }
    else
    {
      uint64_t v41 = *(void *)(a1 + 32);
      if (!v41)
      {
LABEL_23:
        _Block_object_dispose(&v57, 8);

        id v5 = v42;
        goto LABEL_24;
      }
      id v37 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v41 + 16))(v41, 0, v37);
    }

    goto LABEL_23;
  }
  uint64_t v38 = *(void *)(a1 + 32);
  if (v38)
  {
    id v39 = v5;
    uint64_t v40 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v38 + 16))(v38, 0, v40);

    id v5 = v39;
  }
LABEL_24:
}

void __92__TRIInternalServiceRequestHandler_activeBMLTInformationWithPrivacyFilterPolicy_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [v12 artifact];
  id v4 = [v3 backgroundTask];
  id v5 = [v4 selectedNamespace];
  int v6 = [v5 hasName];

  char v7 = v12;
  if (v6)
  {
    id v8 = [v12 artifact];
    uint64_t v9 = [v8 backgroundTask];
    uint64_t v10 = [v9 selectedNamespace];
    unsigned __int8 v11 = [v10 name];

    if (([MEMORY[0x1E4FB01B8] shouldPrivacyFilterNamespace:v11 policy:*(unsigned __int8 *)(a1 + 40)] & 1) == 0) {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v12];
    }

    char v7 = v12;
  }
}

uint64_t __92__TRIInternalServiceRequestHandler_activeBMLTInformationWithPrivacyFilterPolicy_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 bmltDeployment];
  char v7 = [v6 backgroundMLTaskId];
  id v8 = [v5 bmltDeployment];
  uint64_t v9 = [v8 backgroundMLTaskId];
  uint64_t v10 = [v7 compare:v9];

  if (!v10)
  {
    unsigned __int8 v11 = NSNumber;
    id v12 = [v4 bmltDeployment];
    uint64_t v13 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "deploymentId"));
    id v14 = NSNumber;
    uint64_t v15 = [v5 bmltDeployment];
    uint64_t v16 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "deploymentId"));
    uint64_t v10 = [v13 compare:v16];
  }
  return v10;
}

- (void)immediatelySchedulePostUpgradeActivityWithCompletion:(id)a3
{
  id v4 = a3;
  promise = self->_promise;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__TRIInternalServiceRequestHandler_immediatelySchedulePostUpgradeActivityWithCompletion___block_invoke;
  v7[3] = &unk_1E6BB9410;
  id v8 = v4;
  id v6 = v4;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v7];
}

void __89__TRIInternalServiceRequestHandler_immediatelySchedulePostUpgradeActivityWithCompletion___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    v2 = +[TRILaunchDaemonActivityDescriptor postUpgradeDescriptor];
    +[TRIXPCActivitySupport unsafe_immediatelyScheduleActivityWithLaunchDaemonDescriptor:v2];

    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = @"Permission denied.";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    char v7 = (void *)[v5 initWithDomain:@"TRIGeneralErrorDomain" code:3 userInfo:v6];

    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v7);
    }
  }
}

- (void)logSystemCovariates
{
}

void __55__TRIInternalServiceRequestHandler_logSystemCovariates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [TRISystemCovariates alloc];
  id v4 = [v2 paths];

  id v5 = [(TRISystemCovariates *)v3 initWithPaths:v4];
  id v6 = TRILogCategory_Backtrace();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = [(TRISystemCovariates *)v5 dictionary];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "System covariates at the time of sysdiagnose: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)experimentIdsWithActiveStateAndNamespaceName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke;
  v17[3] = &unk_1E6BB8F38;
  void v17[4] = self;
  int v8 = (void *)MEMORY[0x1E016EA80](v17);
  promise = self->_promise;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  _DWORD v13[2] = __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke_272;
  v13[3] = &unk_1E6BB9458;
  id v15 = v8;
  id v16 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v13];
}

void __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 44);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = (void *)v7;
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2) {
      id v10 = "begin";
    }
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s experimentIdsWithActiveStateAndNamespaceName:completion:", (uint8_t *)v11, 0x26u);
  }
}

void __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke_272(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke_2;
  v19[3] = &unk_1E6BB8F60;
  id v20 = *(id *)(a1 + 40);
  uint64_t v7 = (void (**)(void))MEMORY[0x1E016EA80](v19);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke_3;
  v17[3] = &unk_1E6BB8FD8;
  id v18 = *(id *)(a1 + 48);
  uint64_t v8 = MEMORY[0x1E016EA80](v17);
  uint64_t v9 = (void (**)(void, void, void))v8;
  if (*(void *)(a1 + 32))
  {
    id v10 = objc_opt_new();
    id v11 = [v5 experimentDatabase];
    uint64_t v12 = *(void *)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke_276;
    v15[3] = &unk_1E6BB8D40;
    id v13 = v10;
    id v16 = v13;
    LOBYTE(v12) = [v11 enumerateExperimentRecordsMatchingNamespaceName:v12 block:v15];

    if (v12)
    {
      uint64_t v14 = *(void *)(a1 + 48);
      if (v14) {
        (*(void (**)(uint64_t, id, void))(v14 + 16))(v14, v13, 0);
      }
    }
    else
    {
      ((void (**)(void, uint64_t, __CFString *))v9)[2](v9, 12, @"The database query failed.");
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v8 + 16))(v8, 2, @"Parameter 'namespace-name' must be non-nil.");
  }

  if (v7) {
    v7[2](v7);
  }
}

uint64_t __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v5;
      _os_log_debug_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEBUG, "_experimentIdsWithActiveStateAndNamespaceName: %{public}@", buf, 0xCu);
    }

    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v10 = *MEMORY[0x1E4F28568];
    id v11 = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke_276(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 status] == 1 || objc_msgSend(v6, "status") == 2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = [v6 experimentDeployment];
    id v5 = [v4 experimentId];
    [v3 addObject:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementWitness, 0);
  objc_storeStrong((id *)&self->_promise, 0);
}

@end