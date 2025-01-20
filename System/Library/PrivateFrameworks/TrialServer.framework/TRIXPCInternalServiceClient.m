@interface TRIXPCInternalServiceClient
- (BOOL)_performSyncXpcWithError:(id *)a3 block:(id)a4;
- (BOOL)deregisterNamespaceWithNamespaceName:(id)a3 withTeamId:(id)a4 error:(id *)a5;
- (BOOL)immediatelySchedulePostUpgradeActivityWithError:(id *)a3;
- (BOOL)registerNamespaceWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 withTeamId:(id)a6 appContainerId:(id)a7 appContainerType:(int64_t)a8 cloudKitContainerId:(int)a9 error:(id *)a10;
- (BOOL)removeUnusedChannels:(id *)a3;
- (BOOL)resumeSQLiteCKDatabaseQueueWithError:(id *)a3;
- (BOOL)setFailureInjectionDelegate:(id)a3 error:(id *)a4;
- (BOOL)setLastFetchDate:(id)a3 forContainer:(int)a4 teamId:(id)a5 error:(id *)a6;
- (BOOL)setSubscription:(id)a3 namespaceName:(id)a4 error:(id *)a5;
- (BOOL)startNamespaceDownloadWithName:(id)a3 withTeamId:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)submitTask:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)suspendSQLiteCKDatabaseQueueWithError:(id *)a3;
- (TRIXPCInternalServiceClient)init;
- (id)activeExperimentIdsForNamespaceName:(id)a3 error:(id *)a4;
- (id)dynamicNamespaceRecordsWithError:(id *)a3;
- (id)experimentNotificationsWithExperimentId:(id)a3 cloudKitContainer:(int)a4 teamId:(id)a5 error:(id *)a6;
- (id)lastFetchDateForContainer:(int)a3 teamId:(id)a4 error:(id *)a5;
- (id)rolloutNotificationWithLatestDeploymentForRolloutId:(id)a3 cloudKitContainer:(int)a4 teamId:(id)a5 error:(id *)a6;
- (id)subscriptionForNamespaceName:(id)a3 error:(id *)a4;
- (id)taskRecordsWithError:(id *)a3;
@end

@implementation TRIXPCInternalServiceClient

- (TRIXPCInternalServiceClient)init
{
  v25.receiver = self;
  v25.super_class = (Class)TRIXPCInternalServiceClient;
  v2 = [(TRIXPCInternalServiceClient *)&v25 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3485850];
    v4 = (void *)MEMORY[0x1E016E7F0]();
    id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v6 = objc_opt_class();
    v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
    [v3 setClasses:v7 forSelector:sel_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion_ argumentIndex:0 ofReply:1];

    v8 = (void *)MEMORY[0x1E016E7F0]();
    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    [v3 setClasses:v11 forSelector:sel_dynamicNamespaceRecordsWithCompletion_ argumentIndex:0 ofReply:1];

    v12 = (void *)MEMORY[0x1E016E7F0]();
    id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
    [v3 setClasses:v15 forSelector:sel_taskRecordsWithCompletion_ argumentIndex:0 ofReply:1];

    v16 = (void *)MEMORY[0x1E016E7F0]();
    id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
    [v3 setClasses:v19 forSelector:sel_subscriptionForNamespaceName_completion_ argumentIndex:0 ofReply:1];

    id v20 = objc_alloc(MEMORY[0x1E4F93BC0]);
    v21 = TRILogCategory_ClientFramework();
    uint64_t v22 = [v20 initWithServiceName:@"com.apple.triald.internal" allowlistedServerInterface:v3 allowlistedClientInterface:0 serverInitiatedRequestHandler:0 allowSystemToUserConnection:1 interruptionHandler:&__block_literal_global_24 invalidationHandler:&__block_literal_global_73 logHandle:v21];
    helper = v2->_helper;
    v2->_helper = (_PASXPCClientHelper *)v22;
  }
  return v2;
}

- (BOOL)_performSyncXpcWithError:(id *)a3 block:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__42;
  v16 = __Block_byref_object_dispose__42;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__TRIXPCInternalServiceClient__performSyncXpcWithError_block___block_invoke;
  v11[3] = &unk_1E6BBBB50;
  v11[4] = &v12;
  v7 = (void *)MEMORY[0x1E016EA80](v11);
  v8 = [(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[2](v6, v8);
  id v9 = (void *)v13[5];
  if (a3 && v9) {
    *a3 = v9;
  }

  _Block_object_dispose(&v12, 8);
  return v9 == 0;
}

void __62__TRIXPCInternalServiceClient__performSyncXpcWithError_block___block_invoke(uint64_t a1, void *a2)
{
}

- (id)taskRecordsWithError:(id *)a3
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__42;
  uint64_t v18 = __Block_byref_object_dispose__42;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__42;
  uint64_t v12 = __Block_byref_object_dispose__42;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__TRIXPCInternalServiceClient_taskRecordsWithError___block_invoke;
  v7[3] = &unk_1E6BBD428;
  v7[4] = &v14;
  v7[5] = &v8;
  if (![(TRIXPCInternalServiceClient *)self _performSyncXpcWithError:a3 block:v7])
  {
LABEL_5:
    id v5 = 0;
    goto LABEL_7;
  }
  v4 = (void *)v9[5];
  if (v4)
  {
    if (a3)
    {
      id v5 = 0;
      *a3 = v4;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  id v5 = (id)v15[5];
LABEL_7:
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

uint64_t __52__TRIXPCInternalServiceClient_taskRecordsWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__TRIXPCInternalServiceClient_taskRecordsWithError___block_invoke_2;
  v3[3] = &unk_1E6BBD400;
  long long v4 = *(_OWORD *)(a1 + 32);
  return [a2 taskRecordsWithCompletion:v3];
}

void __52__TRIXPCInternalServiceClient_taskRecordsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)experimentNotificationsWithExperimentId:(id)a3 cloudKitContainer:(int)a4 teamId:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__42;
  v33 = __Block_byref_object_dispose__42;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__42;
  v27 = __Block_byref_object_dispose__42;
  id v28 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __102__TRIXPCInternalServiceClient_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_error___block_invoke;
  v17[3] = &unk_1E6BBD450;
  id v12 = v10;
  id v18 = v12;
  int v22 = a4;
  id v13 = v11;
  id v19 = v13;
  id v20 = &v29;
  v21 = &v23;
  if (![(TRIXPCInternalServiceClient *)self _performSyncXpcWithError:a6 block:v17])
  {
LABEL_5:
    id v15 = 0;
    goto LABEL_7;
  }
  uint64_t v14 = (void *)v24[5];
  if (v14)
  {
    if (a6)
    {
      id v15 = 0;
      *a6 = v14;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  id v15 = (id)v30[5];
LABEL_7:

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

uint64_t __102__TRIXPCInternalServiceClient_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __102__TRIXPCInternalServiceClient_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_error___block_invoke_2;
  v6[3] = &unk_1E6BBD400;
  long long v7 = *(_OWORD *)(a1 + 48);
  return [a2 experimentNotificationsWithExperimentId:v3 cloudKitContainer:v2 teamId:v4 completion:v6];
}

void __102__TRIXPCInternalServiceClient_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (v6 && [v6 count])
  {
    id v10 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [v6 lastObject];
      id v12 = [v11 experiment];
      id v13 = [v6 lastObject];
      uint64_t v14 = [v13 encodedExperimentDefinition];
      int v15 = 138412546;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v14;
      _os_log_debug_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEBUG, "got artifact from server with experiment %@ -- encoded: %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (id)rolloutNotificationWithLatestDeploymentForRolloutId:(id)a3 cloudKitContainer:(int)a4 teamId:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__42;
  v33 = __Block_byref_object_dispose__42;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__42;
  v27 = __Block_byref_object_dispose__42;
  id v28 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __114__TRIXPCInternalServiceClient_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_error___block_invoke;
  v17[3] = &unk_1E6BBD450;
  id v12 = v10;
  id v18 = v12;
  int v22 = a4;
  id v13 = v11;
  id v19 = v13;
  id v20 = &v29;
  v21 = &v23;
  if (![(TRIXPCInternalServiceClient *)self _performSyncXpcWithError:a6 block:v17])
  {
LABEL_5:
    id v15 = 0;
    goto LABEL_7;
  }
  uint64_t v14 = (void *)v24[5];
  if (v14)
  {
    if (a6)
    {
      id v15 = 0;
      *a6 = v14;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  id v15 = (id)v30[5];
LABEL_7:

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

uint64_t __114__TRIXPCInternalServiceClient_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __114__TRIXPCInternalServiceClient_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_error___block_invoke_2;
  v6[3] = &unk_1E6BBD478;
  long long v7 = *(_OWORD *)(a1 + 48);
  return [a2 rolloutNotificationWithLatestDeploymentForRolloutId:v3 cloudKitContainer:v2 teamId:v4 completion:v6];
}

void __114__TRIXPCInternalServiceClient_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v7 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [v5 deployment];
    uint64_t v14 = [v13 shortDesc];
    int v15 = 138543362;
    uint64_t v16 = v14;
    _os_log_debug_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEBUG, "Received rollout artifact from server: %{public}@", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

- (BOOL)submitTask:(id)a3 options:(id)a4 error:(id *)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"TRIXPCInternalServiceClient.m", 169, @"Invalid parameter not satisfying: %@", @"task" object file lineNumber description];
  }
  uint64_t v11 = +[TRITaskSupport sharedInstance];
  id v12 = [v11 XPCTaskAllowlist];
  char v13 = [v12 containsObject:objc_opt_class()];

  if (v13)
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__42;
    v33 = __Block_byref_object_dispose__42;
    id v34 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __56__TRIXPCInternalServiceClient_submitTask_options_error___block_invoke;
    v24[3] = &unk_1E6BBD4C8;
    id v25 = v9;
    id v26 = v10;
    v27 = &v35;
    id v28 = &v29;
    if (![(TRIXPCInternalServiceClient *)self _performSyncXpcWithError:a5 block:v24])goto LABEL_11; {
    uint64_t v14 = (void *)v30[5];
    }
    if (!v14)
    {
      BOOL v15 = *((unsigned char *)v36 + 24) != 0;
      goto LABEL_13;
    }
    if (a5)
    {
      BOOL v15 = 0;
      *a5 = v14;
    }
    else
    {
LABEL_11:
      BOOL v15 = 0;
    }
LABEL_13:

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);
    goto LABEL_14;
  }
  if (a5)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v39 = *MEMORY[0x1E4F28568];
    id v17 = [NSString alloc];
    id v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    id v20 = (void *)[v17 initWithFormat:@"Task class %@ is not allowlisted for remote submission.", v19];
    v40[0] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    *a5 = (id)[v16 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v21];
  }
  BOOL v15 = 0;
LABEL_14:

  return v15;
}

uint64_t __56__TRIXPCInternalServiceClient_submitTask_options_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__TRIXPCInternalServiceClient_submitTask_options_error___block_invoke_2;
  v5[3] = &unk_1E6BBD4A0;
  long long v6 = *(_OWORD *)(a1 + 48);
  return [a2 submitTask:v2 options:v3 completion:v5];
}

void __56__TRIXPCInternalServiceClient_submitTask_options_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)lastFetchDateForContainer:(int)a3 teamId:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__42;
  id v28 = __Block_byref_object_dispose__42;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__42;
  int v22 = __Block_byref_object_dispose__42;
  id v23 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__TRIXPCInternalServiceClient_lastFetchDateForContainer_teamId_error___block_invoke;
  v13[3] = &unk_1E6BBD518;
  int v17 = a3;
  id v9 = v8;
  id v14 = v9;
  BOOL v15 = &v24;
  id v16 = &v18;
  if (![(TRIXPCInternalServiceClient *)self _performSyncXpcWithError:a5 block:v13])
  {
LABEL_5:
    id v11 = 0;
    goto LABEL_7;
  }
  id v10 = (void *)v19[5];
  if (v10)
  {
    if (a5)
    {
      id v11 = 0;
      *a5 = v10;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  id v11 = (id)v25[5];
LABEL_7:

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

uint64_t __70__TRIXPCInternalServiceClient_lastFetchDateForContainer_teamId_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__TRIXPCInternalServiceClient_lastFetchDateForContainer_teamId_error___block_invoke_2;
  v5[3] = &unk_1E6BBD4F0;
  long long v6 = *(_OWORD *)(a1 + 40);
  return [a2 lastFetchDateForContainer:v2 teamId:v3 completion:v5];
}

void __70__TRIXPCInternalServiceClient_lastFetchDateForContainer_teamId_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)setLastFetchDate:(id)a3 forContainer:(int)a4 teamId:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a5;
  if (!v11)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"TRIXPCInternalServiceClient.m", 237, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__42;
  id v29 = __Block_byref_object_dispose__42;
  id v30 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__TRIXPCInternalServiceClient_setLastFetchDate_forContainer_teamId_error___block_invoke;
  v19[3] = &unk_1E6BBD450;
  id v13 = v11;
  id v20 = v13;
  int v24 = a4;
  id v14 = v12;
  id v21 = v14;
  int v22 = &v31;
  id v23 = &v25;
  if (![(TRIXPCInternalServiceClient *)self _performSyncXpcWithError:a6 block:v19]) {
    goto LABEL_7;
  }
  BOOL v15 = (void *)v26[5];
  if (!v15)
  {
    BOOL v16 = *((unsigned char *)v32 + 24) != 0;
    goto LABEL_9;
  }
  if (a6)
  {
    BOOL v16 = 0;
    *a6 = v15;
  }
  else
  {
LABEL_7:
    BOOL v16 = 0;
  }
LABEL_9:

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

uint64_t __74__TRIXPCInternalServiceClient_setLastFetchDate_forContainer_teamId_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__TRIXPCInternalServiceClient_setLastFetchDate_forContainer_teamId_error___block_invoke_2;
  v6[3] = &unk_1E6BBD4A0;
  long long v7 = *(_OWORD *)(a1 + 48);
  return [a2 setLastFetchDate:v3 forContainer:v2 teamId:v4 completion:v6];
}

void __74__TRIXPCInternalServiceClient_setLastFetchDate_forContainer_teamId_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)setFailureInjectionDelegate:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIXPCInternalServiceClient.m", 266, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__TRIXPCInternalServiceClient_setFailureInjectionDelegate_error___block_invoke;
  v12[3] = &unk_1E6BBD540;
  id v13 = v7;
  id v8 = v7;
  BOOL v9 = [(TRIXPCInternalServiceClient *)self _performSyncXpcWithError:a4 block:v12];

  return v9;
}

uint64_t __65__TRIXPCInternalServiceClient_setFailureInjectionDelegate_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFailureInjectionDelegate:*(void *)(a1 + 32)];
}

- (BOOL)suspendSQLiteCKDatabaseQueueWithError:(id *)a3
{
  return [(TRIXPCInternalServiceClient *)self _performSyncXpcWithError:a3 block:&__block_literal_global_103];
}

uint64_t __69__TRIXPCInternalServiceClient_suspendSQLiteCKDatabaseQueueWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 suspendSQLiteCKDatabaseQueueWithCompletion:&__block_literal_global_105];
}

- (BOOL)resumeSQLiteCKDatabaseQueueWithError:(id *)a3
{
  return [(TRIXPCInternalServiceClient *)self _performSyncXpcWithError:a3 block:&__block_literal_global_107];
}

uint64_t __68__TRIXPCInternalServiceClient_resumeSQLiteCKDatabaseQueueWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 resumeSQLiteCKDatabaseQueueWithCompletion:&__block_literal_global_109];
}

- (BOOL)removeUnusedChannels:(id *)a3
{
  return [(TRIXPCInternalServiceClient *)self _performSyncXpcWithError:a3 block:&__block_literal_global_111];
}

uint64_t __52__TRIXPCInternalServiceClient_removeUnusedChannels___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeUnusedChannelsWithCompletion:&__block_literal_global_113];
}

- (BOOL)registerNamespaceWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 withTeamId:(id)a6 appContainerId:(id)a7 appContainerType:(int64_t)a8 cloudKitContainerId:(int)a9 error:(id *)a10
{
  uint64_t v14 = *(void *)&a4;
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  if (v17)
  {
    if (v19) {
      goto LABEL_3;
    }
LABEL_13:
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"TRIXPCInternalServiceClient.m", 305, @"Invalid parameter not satisfying: %@", @"teamId" object file lineNumber description];

    if (v20) {
      goto LABEL_4;
    }
    goto LABEL_14;
  }
  uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"TRIXPCInternalServiceClient.m", 304, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

  if (!v19) {
    goto LABEL_13;
  }
LABEL_3:
  if (v20) {
    goto LABEL_4;
  }
LABEL_14:
  id v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"TRIXPCInternalServiceClient.m", 306, @"Invalid parameter not satisfying: %@", @"appContainerId" object file lineNumber description];

LABEL_4:
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__42;
  v46 = __Block_byref_object_dispose__42;
  id v47 = 0;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __172__TRIXPCInternalServiceClient_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_withTeamId_appContainerId_appContainerType_cloudKitContainerId_error___block_invoke;
  v41[3] = &unk_1E6BBBB50;
  v41[4] = &v42;
  id v21 = (void *)MEMORY[0x1E016EA80](v41);
  uint64_t v37 = 0;
  char v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  char v34 = __Block_byref_object_copy__42;
  uint64_t v35 = __Block_byref_object_dispose__42;
  id v36 = 0;
  int v22 = [(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:v21];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __172__TRIXPCInternalServiceClient_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_withTeamId_appContainerId_appContainerType_cloudKitContainerId_error___block_invoke_2;
  v30[3] = &unk_1E6BBD4A0;
  v30[4] = &v37;
  v30[5] = &v31;
  LODWORD(v29) = a9;
  [v22 registerNamespaceWithNamespaceName:v17 compatibilityVersion:v14 defaultsFileURL:v18 teamId:v19 appContainerId:v20 appContainerType:a8 cloudKitContainerId:v29 completion:v30];
  id v23 = (void *)v43[5];
  if (!v23)
  {
    id v23 = (void *)v32[5];
    if (!v23)
    {
      BOOL v24 = *((unsigned char *)v38 + 24) != 0;
      goto LABEL_11;
    }
    if (a10) {
      goto LABEL_6;
    }
LABEL_9:
    BOOL v24 = 0;
    goto LABEL_11;
  }
  if (!a10) {
    goto LABEL_9;
  }
LABEL_6:
  BOOL v24 = 0;
  *a10 = v23;
LABEL_11:

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v42, 8);
  return v24;
}

void __172__TRIXPCInternalServiceClient_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_withTeamId_appContainerId_appContainerType_cloudKitContainerId_error___block_invoke(uint64_t a1, void *a2)
{
}

void __172__TRIXPCInternalServiceClient_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_withTeamId_appContainerId_appContainerType_cloudKitContainerId_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)deregisterNamespaceWithNamespaceName:(id)a3 withTeamId:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIXPCInternalServiceClient.m", 348, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"TRIXPCInternalServiceClient.m", 349, @"Invalid parameter not satisfying: %@", @"teamId" object file lineNumber description];

LABEL_3:
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  char v34 = __Block_byref_object_copy__42;
  uint64_t v35 = __Block_byref_object_dispose__42;
  id v36 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __85__TRIXPCInternalServiceClient_deregisterNamespaceWithNamespaceName_withTeamId_error___block_invoke;
  v30[3] = &unk_1E6BBBB50;
  v30[4] = &v31;
  id v12 = (void *)MEMORY[0x1E016EA80](v30);
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__42;
  BOOL v24 = __Block_byref_object_dispose__42;
  id v25 = 0;
  id v13 = [(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:v12];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __85__TRIXPCInternalServiceClient_deregisterNamespaceWithNamespaceName_withTeamId_error___block_invoke_2;
  v19[3] = &unk_1E6BBD4A0;
  void v19[4] = &v26;
  v19[5] = &v20;
  [v13 deregisterNamespaceWithNamespaceName:v9 teamId:v11 completion:v19];
  uint64_t v14 = (void *)v32[5];
  if (!v14)
  {
    uint64_t v14 = (void *)v21[5];
    if (!v14)
    {
      BOOL v15 = *((unsigned char *)v27 + 24) != 0;
      goto LABEL_10;
    }
    if (a5) {
      goto LABEL_5;
    }
LABEL_8:
    BOOL v15 = 0;
    goto LABEL_10;
  }
  if (!a5) {
    goto LABEL_8;
  }
LABEL_5:
  BOOL v15 = 0;
  *a5 = v14;
LABEL_10:

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v31, 8);
  return v15;
}

void __85__TRIXPCInternalServiceClient_deregisterNamespaceWithNamespaceName_withTeamId_error___block_invoke(uint64_t a1, void *a2)
{
}

void __85__TRIXPCInternalServiceClient_deregisterNamespaceWithNamespaceName_withTeamId_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)startNamespaceDownloadWithName:(id)a3 withTeamId:(id)a4 options:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRIXPCInternalServiceClient.m", 387, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"TRIXPCInternalServiceClient.m", 388, @"Invalid parameter not satisfying: %@", @"teamId" object file lineNumber description];

LABEL_3:
  uint64_t v33 = 0;
  char v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__42;
  uint64_t v37 = __Block_byref_object_dispose__42;
  id v38 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __87__TRIXPCInternalServiceClient_startNamespaceDownloadWithName_withTeamId_options_error___block_invoke;
  v32[3] = &unk_1E6BBBB50;
  v32[4] = &v33;
  uint64_t v14 = (void *)MEMORY[0x1E016EA80](v32);
  uint64_t v28 = 0;
  char v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__42;
  uint64_t v26 = __Block_byref_object_dispose__42;
  id v27 = 0;
  BOOL v15 = [(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:v14];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __87__TRIXPCInternalServiceClient_startNamespaceDownloadWithName_withTeamId_options_error___block_invoke_2;
  v21[3] = &unk_1E6BBD4A0;
  v21[4] = &v28;
  v21[5] = &v22;
  [v15 startDownloadNamespaceWithName:v11 teamId:v12 options:v13 completion:v21];
  BOOL v16 = (void *)v34[5];
  if (!v16)
  {
    BOOL v16 = (void *)v23[5];
    if (!v16)
    {
      BOOL v17 = *((unsigned char *)v29 + 24) != 0;
      goto LABEL_10;
    }
    if (a6) {
      goto LABEL_5;
    }
LABEL_8:
    BOOL v17 = 0;
    goto LABEL_10;
  }
  if (!a6) {
    goto LABEL_8;
  }
LABEL_5:
  BOOL v17 = 0;
  *a6 = v16;
LABEL_10:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v33, 8);
  return v17;
}

void __87__TRIXPCInternalServiceClient_startNamespaceDownloadWithName_withTeamId_options_error___block_invoke(uint64_t a1, void *a2)
{
}

void __87__TRIXPCInternalServiceClient_startNamespaceDownloadWithName_withTeamId_options_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)dynamicNamespaceRecordsWithError:(id *)a3
{
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  BOOL v17 = __Block_byref_object_copy__42;
  id v18 = __Block_byref_object_dispose__42;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__42;
  id v12 = __Block_byref_object_dispose__42;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__TRIXPCInternalServiceClient_dynamicNamespaceRecordsWithError___block_invoke;
  v7[3] = &unk_1E6BBD428;
  v7[4] = &v14;
  v7[5] = &v8;
  if (![(TRIXPCInternalServiceClient *)self _performSyncXpcWithError:a3 block:v7])
  {
LABEL_5:
    id v5 = 0;
    goto LABEL_7;
  }
  uint64_t v4 = (void *)v9[5];
  if (v4)
  {
    if (a3)
    {
      id v5 = 0;
      *a3 = v4;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  id v5 = (id)v15[5];
LABEL_7:
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

uint64_t __64__TRIXPCInternalServiceClient_dynamicNamespaceRecordsWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__TRIXPCInternalServiceClient_dynamicNamespaceRecordsWithError___block_invoke_2;
  v3[3] = &unk_1E6BBD400;
  long long v4 = *(_OWORD *)(a1 + 32);
  return [a2 dynamicNamespaceRecordsWithCompletion:v3];
}

void __64__TRIXPCInternalServiceClient_dynamicNamespaceRecordsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)activeExperimentIdsForNamespaceName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__42;
  id v25 = __Block_byref_object_dispose__42;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__42;
  id v19 = __Block_byref_object_dispose__42;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__TRIXPCInternalServiceClient_activeExperimentIdsForNamespaceName_error___block_invoke;
  v11[3] = &unk_1E6BBD588;
  id v7 = v6;
  id v12 = v7;
  id v13 = &v21;
  uint64_t v14 = &v15;
  if (![(TRIXPCInternalServiceClient *)self _performSyncXpcWithError:a4 block:v11])
  {
LABEL_5:
    id v9 = 0;
    goto LABEL_7;
  }
  uint64_t v8 = (void *)v16[5];
  if (v8)
  {
    if (a4)
    {
      id v9 = 0;
      *a4 = v8;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  id v9 = (id)v22[5];
LABEL_7:

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

uint64_t __73__TRIXPCInternalServiceClient_activeExperimentIdsForNamespaceName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__TRIXPCInternalServiceClient_activeExperimentIdsForNamespaceName_error___block_invoke_2;
  v4[3] = &unk_1E6BBD400;
  long long v5 = *(_OWORD *)(a1 + 40);
  return [a2 experimentIdsWithActiveStateAndNamespaceName:v2 completion:v4];
}

void __73__TRIXPCInternalServiceClient_activeExperimentIdsForNamespaceName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)subscriptionForNamespaceName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__42;
  id v25 = __Block_byref_object_dispose__42;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__42;
  id v19 = __Block_byref_object_dispose__42;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__TRIXPCInternalServiceClient_subscriptionForNamespaceName_error___block_invoke;
  v11[3] = &unk_1E6BBD588;
  id v7 = v6;
  id v12 = v7;
  id v13 = &v21;
  uint64_t v14 = &v15;
  if (![(TRIXPCInternalServiceClient *)self _performSyncXpcWithError:a4 block:v11])
  {
LABEL_5:
    id v9 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_6;
  }
  uint64_t v8 = (void *)v16[5];
  if (v8)
  {
    if (a4) {
      *a4 = v8;
    }
    goto LABEL_5;
  }
  id v9 = (id)v22[5];
LABEL_6:

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

uint64_t __66__TRIXPCInternalServiceClient_subscriptionForNamespaceName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__TRIXPCInternalServiceClient_subscriptionForNamespaceName_error___block_invoke_2;
  v4[3] = &unk_1E6BBD400;
  long long v5 = *(_OWORD *)(a1 + 40);
  return [a2 subscriptionForNamespaceName:v2 completion:v4];
}

void __66__TRIXPCInternalServiceClient_subscriptionForNamespaceName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)setSubscription:(id)a3 namespaceName:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIXPCInternalServiceClient.m", 496, @"Invalid parameter not satisfying: %@", @"factorNames" object file lineNumber description];
  }
  uint64_t v28 = 0;
  char v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__42;
  id v26 = __Block_byref_object_dispose__42;
  id v27 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__TRIXPCInternalServiceClient_setSubscription_namespaceName_error___block_invoke;
  v17[3] = &unk_1E6BBD4C8;
  id v11 = v9;
  id v18 = v11;
  id v12 = v10;
  id v19 = v12;
  id v20 = &v28;
  uint64_t v21 = &v22;
  if (![(TRIXPCInternalServiceClient *)self _performSyncXpcWithError:a5 block:v17]) {
    goto LABEL_7;
  }
  id v13 = (void *)v23[5];
  if (!v13)
  {
    BOOL v14 = *((unsigned char *)v29 + 24) != 0;
    goto LABEL_9;
  }
  if (a5)
  {
    BOOL v14 = 0;
    *a5 = v13;
  }
  else
  {
LABEL_7:
    BOOL v14 = 0;
  }
LABEL_9:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

uint64_t __67__TRIXPCInternalServiceClient_setSubscription_namespaceName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__TRIXPCInternalServiceClient_setSubscription_namespaceName_error___block_invoke_2;
  v5[3] = &unk_1E6BBD4A0;
  long long v6 = *(_OWORD *)(a1 + 48);
  return [a2 setSubscription:v2 namespaceName:v3 completion:v5];
}

void __67__TRIXPCInternalServiceClient_setSubscription_namespaceName_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)immediatelySchedulePostUpgradeActivityWithError:(id *)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__42;
  id v12 = __Block_byref_object_dispose__42;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__TRIXPCInternalServiceClient_immediatelySchedulePostUpgradeActivityWithError___block_invoke;
  v7[3] = &unk_1E6BBD428;
  v7[4] = &v14;
  v7[5] = &v8;
  if (![(TRIXPCInternalServiceClient *)self _performSyncXpcWithError:a3 block:v7]) {
    goto LABEL_5;
  }
  long long v4 = (void *)v9[5];
  if (!v4)
  {
    BOOL v5 = *((unsigned char *)v15 + 24) != 0;
    goto LABEL_7;
  }
  if (a3)
  {
    BOOL v5 = 0;
    *a3 = v4;
  }
  else
  {
LABEL_5:
    BOOL v5 = 0;
  }
LABEL_7:
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

uint64_t __79__TRIXPCInternalServiceClient_immediatelySchedulePostUpgradeActivityWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__TRIXPCInternalServiceClient_immediatelySchedulePostUpgradeActivityWithError___block_invoke_2;
  v3[3] = &unk_1E6BBD4A0;
  long long v4 = *(_OWORD *)(a1 + 32);
  return [a2 immediatelySchedulePostUpgradeActivityWithCompletion:v3];
}

void __79__TRIXPCInternalServiceClient_immediatelySchedulePostUpgradeActivityWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void).cxx_destruct
{
}

@end