@interface TRIActivateTargetedBMLTDeploymentTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithBMLTDeployment:(id)a3 factorPackSetId:(id)a4 taskAttribution:(id)a5;
+ (id)taskWithBMLTDeployment:(id)a3 factorPackSetId:(id)a4 taskAttribution:(id)a5 bmltBatchNotificationIdentifier:(id)a6;
- (BOOL)_hasValidNCVForBMLT:(id)a3 namespaceDescriptorProvider:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)dependencies;
- (NSArray)tags;
- (NSString)description;
- (TRIActivateTargetedBMLTDeploymentTask)initWithCoder:(id)a3;
- (TRIActivateTargetedBMLTDeploymentTask)initWithTaskDeployment:(id)a3 factorPackSetId:(id)a4 taskAttribution:(id)a5 bmltBatchNotificationIdentifier:(id)a6;
- (TRIBMLTDeployment)deployment;
- (TRIFactorPackSetId)factorPackSetId;
- (id)_asPersistedTask;
- (id)dimensions;
- (id)metrics;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (id)trialSystemTelemetry;
- (int)taskType;
- (unint64_t)hash;
- (unint64_t)requiredCapabilities;
- (void)_activationTelemetryWithSuccess:(BOOL)a3 bmltRecord:(id)a4 serverContext:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)runDequeueHandlerUsingContext:(id)a3;
- (void)runEnqueueHandlerUsingContext:(id)a3;
@end

@implementation TRIActivateTargetedBMLTDeploymentTask

- (TRIActivateTargetedBMLTDeploymentTask)initWithTaskDeployment:(id)a3 factorPackSetId:(id)a4 taskAttribution:(id)a5 bmltBatchNotificationIdentifier:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_8:
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"TRIActivateTargetedBMLTDeploymentTask.m", 59, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"TRIActivateTargetedBMLTDeploymentTask.m", 58, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"TRIActivateTargetedBMLTDeploymentTask.m", 60, @"Invalid parameter not satisfying: %@", @"taskAttribution" object file lineNumber description];

LABEL_4:
  v32.receiver = self;
  v32.super_class = (Class)TRIActivateTargetedBMLTDeploymentTask;
  v16 = [(TRIActivateTargetedBMLTDeploymentTask *)&v32 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_deployment, a3);
    objc_storeStrong((id *)&v17->_factorPackSetId, a4);
    objc_storeStrong((id *)&v17->_taskAttribution, a5);
    objc_storeStrong((id *)&v17->_bmltBatchNotificationIdentifier, a6);
    v18 = [[TRIBMLTTaskSupport alloc] initWithBMLTDeployment:v17->_deployment];
    support = v17->_support;
    v17->_support = v18;

    v20 = objc_opt_new();
    v21 = [v12 backgroundMLTaskId];
    v22 = [v20 ensureBMLTFields];
    [v22 setClientBmltId:v21];

    v23 = loggableFactorPackSetIdFromFactorPackSetId(v13);
    v24 = [v20 ensureBMLTFields];
    [v24 setClientBmltFactorPackSetId:v23];

    v25 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "deploymentId"));
    v26 = [v25 stringValue];
    [v20 setClientDeploymentId:v26];

    v27 = +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:v14];
    [(TRIBMLTTaskSupport *)v17->_support mergeTelemetry:v20];
    [(TRIBMLTTaskSupport *)v17->_support mergeTelemetry:v27];
  }
  return v17;
}

+ (id)taskWithBMLTDeployment:(id)a3 factorPackSetId:(id)a4 taskAttribution:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  id v12 = NSString;
  id v13 = objc_opt_new();
  id v14 = [v13 UUIDString];
  id v15 = [v12 stringWithFormat:@"com.apple.triald.BMLTNotification.%@", v14];
  v16 = (void *)[v11 initWithTaskDeployment:v10 factorPackSetId:v9 taskAttribution:v8 bmltBatchNotificationIdentifier:v15];

  return v16;
}

+ (id)taskWithBMLTDeployment:(id)a3 factorPackSetId:(id)a4 taskAttribution:(id)a5 bmltBatchNotificationIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) initWithTaskDeployment:v13 factorPackSetId:v12 taskAttribution:v11 bmltBatchNotificationIdentifier:v10];

  return v14;
}

- (int)taskType
{
  return 31;
}

- (NSArray)tags
{
  return (NSArray *)[(TRIBMLTTaskSupport *)self->_support tags];
}

- (NSArray)dependencies
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = +[TRIFetchBMLTNotificationsTask taskWithDeployment:self->_deployment taskAttribution:self->_taskAttribution bmltBatchNotificationIdentifier:self->_bmltBatchNotificationIdentifier];
  v7[0] = v3;
  v4 = +[TRIFetchFactorPackSetTask taskWithFactorPackSetId:self->_factorPackSetId taskAttribution:self->_taskAttribution bmltDeployment:self->_deployment];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return (NSArray *)v5;
}

- (void)runEnqueueHandlerUsingContext:(id)a3
{
  factorPackSetId = self->_factorPackSetId;
  id v5 = a3;
  id v9 = +[TRIContentTracker contentIdentifierForFactorPackSetWithId:factorPackSetId];
  v6 = [v5 contentTracker];
  [v6 addRefWithContentIdentifier:v9];

  v7 = +[TRIContentTracker contentIdentifierForBMLTArtifactWithDeployment:self->_deployment];
  id v8 = [v5 contentTracker];

  [v8 addRefWithContentIdentifier:v7];
}

- (void)runDequeueHandlerUsingContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  factorPackSetId = self->_factorPackSetId;
  id v5 = a3;
  v6 = +[TRIContentTracker contentIdentifierForFactorPackSetWithId:factorPackSetId];
  v7 = [v5 contentTracker];
  [v7 dropRefWithContentIdentifier:v6];

  id v8 = +[TRIContentTracker contentIdentifierForBMLTArtifactWithDeployment:self->_deployment];
  id v9 = [v5 contentTracker];

  LOBYTE(v5) = [v9 dropRefWithContentIdentifier:v8];
  if ((v5 & 1) == 0)
  {
    id v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [(TRIBMLTDeployment *)self->_deployment shortDesc];
      int v12 = 138543362;
      id v13 = v11;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for BMLT %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v79 = a4;
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __71__TRIActivateTargetedBMLTDeploymentTask_runUsingContext_withTaskQueue___block_invoke;
  v101[3] = &unk_1E6BBE1C8;
  v101[4] = self;
  v80 = (void (**)(void, void, void, void, void))MEMORY[0x1E016EA80](v101);
  id v8 = [TRISystemCovariates alloc];
  id v9 = [v7 paths];
  id v10 = [(TRISystemCovariates *)v8 initWithPaths:v9];

  id v11 = [(TRISystemCovariates *)v10 dictionary];
  v84 = [v11 valueForKey:@"OSBuild"];

  int v12 = [(TRISystemCovariates *)v10 dictionary];
  v87 = [v12 valueForKey:@"UserSettingsLanguageCode"];

  id v13 = [(TRISystemCovariates *)v10 dictionary];
  v86 = [v13 valueForKey:@"UserSettingsRegionCode"];

  uint64_t v14 = [(TRISystemCovariates *)v10 dictionary];
  v85 = [v14 valueForKey:@"BCP47DeviceLocale"];

  if (v85)
  {
    id v15 = [v85 componentsSeparatedByString:@"-"];
    uint64_t v16 = [v15 firstObject];

    v17 = [v85 componentsSeparatedByString:@"-"];
    v18 = [v17 lastObject];

    v19 = &stru_1F3455898;
    if (v18) {
      v19 = v18;
    }
    v86 = v19;

    v87 = (void *)v16;
  }
  v20 = [(TRISystemCovariates *)v10 dictionary];
  v83 = [v20 valueForKey:@"CarrierBundleIdentifier"];

  v21 = [(TRISystemCovariates *)v10 dictionary];
  v82 = [v21 valueForKey:@"CarrierCountryIsoCode"];

  v22 = [(TRISystemCovariates *)v10 dictionary];
  v23 = [v22 valueForKey:@"DiagnosticsUsageEnabled"];
  BOOL v75 = v23 != 0;

  v24 = [(TRISystemCovariates *)v10 dictionary];
  v25 = [v24 valueForKey:@"HasANE"];
  BOOL v73 = v25 != 0;

  v26 = [(TRISystemCovariates *)v10 dictionary];
  v81 = [v26 valueForKey:@"ANEVersion"];

  if (!v84)
  {
    v67 = [MEMORY[0x1E4F28B00] currentHandler];
    [v67 handleFailureInMethod:a2, self, @"TRIActivateTargetedBMLTDeploymentTask.m", 169, @"Invalid parameter not satisfying: %@", @"osBuild" object file lineNumber description];
  }
  if (!v87)
  {
    v68 = [MEMORY[0x1E4F28B00] currentHandler];
    [v68 handleFailureInMethod:a2, self, @"TRIActivateTargetedBMLTDeploymentTask.m", 170, @"Invalid parameter not satisfying: %@", @"languageCode" object file lineNumber description];
  }
  if (!v86)
  {
    v69 = [MEMORY[0x1E4F28B00] currentHandler];
    [v69 handleFailureInMethod:a2, self, @"TRIActivateTargetedBMLTDeploymentTask.m", 171, @"Invalid parameter not satisfying: %@", @"regionCode" object file lineNumber description];
  }
  if (!v83)
  {
    v70 = [MEMORY[0x1E4F28B00] currentHandler];
    [v70 handleFailureInMethod:a2, self, @"TRIActivateTargetedBMLTDeploymentTask.m", 172, @"Invalid parameter not satisfying: %@", @"carrierBundleId" object file lineNumber description];
  }
  if (!v82)
  {
    v71 = [MEMORY[0x1E4F28B00] currentHandler];
    [v71 handleFailureInMethod:a2, self, @"TRIActivateTargetedBMLTDeploymentTask.m", 173, @"Invalid parameter not satisfying: %@", @"carrierCountryCode" object file lineNumber description];
  }
  if (!v81)
  {
    v72 = [MEMORY[0x1E4F28B00] currentHandler];
    [v72 handleFailureInMethod:a2, self, @"TRIActivateTargetedBMLTDeploymentTask.m", 174, @"Invalid parameter not satisfying: %@", @"aneVersion" object file lineNumber description];
  }
  v27 = [v7 bmltDatabase];
  v28 = [v27 taskRecordWithTaskDeployment:self->_deployment];

  if (v28)
  {
    v29 = [v7 namespaceDatabase];
    v30 = [v7 paths];
    v31 = [v30 namespaceDescriptorsDefaultDir];
    v78 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v29 defaultDescriptorDirectoryPath:v31];

    objc_super v32 = [v28 artifact];
    v33 = [v32 backgroundTask];
    BOOL v34 = [(TRIActivateTargetedBMLTDeploymentTask *)self _hasValidNCVForBMLT:v33 namespaceDescriptorProvider:v78];

    if (!v34)
    {
      v47 = TRILogCategory_Server();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        deployment = self->_deployment;
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = deployment;
        _os_log_error_impl(&dword_1DA291000, v47, OS_LOG_TYPE_ERROR, "BMLT deployment %{public}@ does not match the device NCVs. Completing task without activating deployment.", buf, 0xCu);
      }

      v48 = [TRITaskRunResult alloc];
      v46 = [(TRITaskRunResult *)v48 initWithRunStatus:2 reportResultToServer:0 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
      goto LABEL_39;
    }
    v35 = objc_opt_new();
    factorPackSetId = self->_factorPackSetId;
    v37 = [v28 targetedFactorPackSetId];
    if ([(TRIFactorPackSetId *)factorPackSetId isEqual:v37])
    {
      v38 = [v28 targetedTargetingRuleIndex];
      BOOL v39 = v38 == 0;

      if (v39) {
        goto LABEL_23;
      }
      v37 = [v28 targetedTargetingRuleIndex];
      uint64_t v40 = [v37 intValue];
      v41 = [v35 ensureBMLTFields];
      [v41 setClientBmltTargetingRuleGroupOrdinal:v40];
    }
LABEL_23:
    [(TRIBMLTTaskSupport *)self->_support mergeTelemetry:v35];

    v42 = [v28 artifact];
    v77 = [v42 earliestStartDateForActivationIfInFuture];

    if (v77)
    {
      v43 = TRILogCategory_Server();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v66 = [(TRIBMLTDeployment *)self->_deployment shortDesc];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v66;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v77;
        _os_log_error_impl(&dword_1DA291000, v43, OS_LOG_TYPE_ERROR, "Cannot activate BMLT deployment %{public}@: start time %@ is in the future", buf, 0x16u);
      }
      uint64_t v44 = +[TRITaskRunResult resultWithRunStatus:1 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:v77];
    }
    else
    {
      v49 = [v28 activeFactorPackSetId];
      int v50 = [v49 isEqualToString:self->_factorPackSetId];

      if (!v50)
      {
        v55 = [TRINamespaceResolverStorage alloc];
        v56 = [v7 paths];
        v57 = [(TRINamespaceResolverStorage *)v55 initWithPaths:v56];

        if ([(TRINamespaceResolverStorage *)v57 rewriteBMLTDeployment:self->_deployment targetedFactorPackSetId:self->_factorPackSetId])
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          char v103 = 0;
          v88[0] = MEMORY[0x1E4F143A8];
          v88[1] = 3221225472;
          v88[2] = __71__TRIActivateTargetedBMLTDeploymentTask_runUsingContext_withTaskQueue___block_invoke_76;
          v88[3] = &unk_1E6BBE1F0;
          v88[4] = self;
          id v58 = v28;
          id v89 = v58;
          v98 = buf;
          id v59 = v7;
          id v90 = v59;
          id v91 = v84;
          id v92 = v87;
          v93 = v86;
          id v94 = v83;
          id v95 = v82;
          BOOL v99 = v75;
          BOOL v100 = v73;
          id v96 = v81;
          v97 = v57;
          v76 = (void *)MEMORY[0x1E016EA80](v88);
          v60 = [v59 bmltDatabase];
          [v60 writeTransactionWithFailableBlock:v76];

          if (*(unsigned char *)(*(void *)&buf[8] + 24))
          {
            v61 = [v58 artifact];
            v62 = [v61 backgroundTask];
            v63 = [v62 selectedNamespace];
            v74 = [v63 name];

            [MEMORY[0x1E4FB01E8] notifyUpdateForNamespaceName:v74];
            [(TRIActivateTargetedBMLTDeploymentTask *)self _activationTelemetryWithSuccess:1 bmltRecord:v58 serverContext:v59];
            v80[2](v80, 2, 1, MEMORY[0x1E4F1CBF0], 0);
            v46 = (TRITaskRunResult *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            [(TRIActivateTargetedBMLTDeploymentTask *)self _activationTelemetryWithSuccess:0 bmltRecord:v58 serverContext:v59];
            v80[2](v80, 3, 1, MEMORY[0x1E4F1CBF0], 0);
            v46 = (TRITaskRunResult *)objc_claimAutoreleasedReturnValue();
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          [(TRIActivateTargetedBMLTDeploymentTask *)self _activationTelemetryWithSuccess:0 bmltRecord:v28 serverContext:v7];
          v80[2](v80, 3, 1, MEMORY[0x1E4F1CBF0], 0);
          v46 = (TRITaskRunResult *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_38;
      }
      v51 = TRILogCategory_Server();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = [(TRIBMLTDeployment *)self->_deployment shortDesc];
        v53 = self->_factorPackSetId;
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v52;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v53;
        _os_log_impl(&dword_1DA291000, v51, OS_LOG_TYPE_DEFAULT, "BMLT deployment %{public}@ has already activated factor pack set %{public}@. Completing task without activating deployment again.", buf, 0x16u);
      }
      uint64_t v44 = v80[2](v80, 2, 0, MEMORY[0x1E4F1CBF0], 0);
    }
    v46 = (TRITaskRunResult *)v44;
LABEL_38:

LABEL_39:
    goto LABEL_40;
  }
  v45 = TRILogCategory_Server();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    v64 = [(TRIBMLTDeployment *)self->_deployment shortDesc];
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v64;
    _os_log_error_impl(&dword_1DA291000, v45, OS_LOG_TYPE_ERROR, "Unexpected failure to lookup BMLT record for deployment %{public}@.", buf, 0xCu);
  }
  [(TRIActivateTargetedBMLTDeploymentTask *)self _activationTelemetryWithSuccess:0 bmltRecord:0 serverContext:v7];
  v80[2](v80, 3, 1, MEMORY[0x1E4F1CBF0], 0);
  v46 = (TRITaskRunResult *)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v46;
}

id __71__TRIActivateTargetedBMLTDeploymentTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v8) {
    notify_post((const char *)[v8 UTF8String]);
  }
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }
  id v10 = +[TRITaskRunResult resultWithRunStatus:a2 reportResultToServer:a3 nextTasks:v9 earliestRetryDate:0];

  return v10;
}

uint64_t __71__TRIActivateTargetedBMLTDeploymentTask_runUsingContext_withTaskQueue___block_invoke_76(uint64_t a1, void *a2)
{
  *(void *)&v42[13] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(*(void *)(a1 + 32) + 56);
  id v5 = [*(id *)(a1 + 40) targetedFactorPackSetId];
  if ([v4 isEqual:v5])
  {
    v6 = [*(id *)(a1 + 40) targetedTargetingRuleIndex];
  }
  else
  {
    v6 = 0;
  }

  id v7 = [*(id *)(a1 + 48) bmltDatabase];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = [v7 activateDeployment:*(void *)(*(void *)(a1 + 32) + 48) withFactorPackSetId:*(void *)(*(void *)(a1 + 32) + 56) targetingRuleIndex:v6 usingTransaction:v3];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
  {
    id v8 = [*(id *)(a1 + 48) activationEventDatabase];
    id v9 = [*(id *)(*(void *)(a1 + 32) + 48) backgroundMLTaskId];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(v10 + 56);
    uint64_t v12 = [*(id *)(v10 + 48) deploymentId];
    if (*(void *)(a1 + 72)) {
      id v13 = *(__CFString **)(a1 + 72);
    }
    else {
      id v13 = &stru_1F3455898;
    }
    LOWORD(v36) = *(_WORD *)(a1 + 120);
    uint64_t v14 = objc_msgSend(v8, "addRecordWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleId:carrierCountryCode:diagnosticsUsageEnabled:hasAne:aneVersion:transaction:", v9, v11, v12, *(void *)(a1 + 56), *(void *)(a1 + 64), v13, *(void *)(a1 + 80), *(void *)(a1 + 88), v36, *(void *)(a1 + 96), v3);

    if (!v14)
    {
      id v15 = TRILogCategory_Server();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = *(void *)(a1 + 32);
        v29 = *(void **)(v28 + 56);
        uint64_t v30 = *(void *)(v28 + 48);
        *(_DWORD *)buf = 138412546;
        uint64_t v40 = v29;
        __int16 v41 = 2114;
        *(void *)v42 = v30;
        _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "error during activation of factorPackSetId {public}%@ for BMLT %{public}@: failed to update activation event database", buf, 0x16u);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = [*(id *)(a1 + 104) overwriteActiveFactorProvidersUsingTransaction:v3 fromContext:*(void *)(a1 + 48)];
    uint64_t v16 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
    {
      v17 = TRILogCategory_Server();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(void **)(*(void *)(a1 + 32) + 48);
        *(_DWORD *)buf = 138543362;
        uint64_t v40 = v18;
        _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, "Activated BMLT deployment: %{public}@", buf, 0xCu);
      }

      v19 = +[TRIContentTracker contentIdentifierForBMLTArtifactWithDeployment:*(void *)(*(void *)(a1 + 32) + 48)];
      v20 = [*(id *)(a1 + 48) contentTracker];
      char v21 = [v20 addRefWithContentIdentifier:v19];

      if ((v21 & 1) == 0)
      {
        v22 = TRILogCategory_Server();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v38 = [*(id *)(*(void *)(a1 + 32) + 48) backgroundMLTaskId];
          int v37 = [*(id *)(*(void *)(a1 + 32) + 48) deploymentId];
          v31 = (objc_class *)objc_opt_class();
          objc_super v32 = NSStringFromClass(v31);
          *(_DWORD *)buf = 138543874;
          uint64_t v40 = v38;
          __int16 v41 = 1024;
          *(_DWORD *)v42 = v37;
          v42[2] = 2114;
          *(void *)&v42[3] = v32;
          _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "Unable to increment ref for BMLT deployment: (r: %{public}@, d: %d) in %{public}@", buf, 0x1Cu);
        }
      }
      v23 = +[TRIContentTracker contentIdentifierForFactorPackSetWithId:*(void *)(*(void *)(a1 + 32) + 56)];
      v24 = [*(id *)(a1 + 48) contentTracker];
      char v25 = [v24 addRefWithContentIdentifier:v23];

      if ((v25 & 1) == 0)
      {
        v26 = TRILogCategory_Server();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v33 = *(void **)(*(void *)(a1 + 32) + 56);
          BOOL v34 = (objc_class *)objc_opt_class();
          v35 = NSStringFromClass(v34);
          *(_DWORD *)buf = 138543618;
          uint64_t v40 = v33;
          __int16 v41 = 2114;
          *(void *)v42 = v35;
          _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "Unable to increment ref for factor pack set: %{public}@ in %{public}@", buf, 0x16u);
        }
      }

      notify_post("com.apple.trial.shadow-evaluation.mlruntime.status-change");
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24)) {
        uint64_t v16 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
      }
    }
  }
  else
  {
    uint64_t v16 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  return *v16;
}

- (BOOL)_hasValidNCVForBMLT:(id)a3 namespaceDescriptorProvider:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasSelectedNamespace])
  {
    id v7 = [v5 selectedNamespace];
    id v8 = [v7 name];
    id v9 = [v6 descriptorWithNamespaceName:v8];

    if (v9)
    {
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2020000000;
      char v35 = 0;
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSObject compatibilityVersionArray_Count](v7, "compatibilityVersionArray_Count"));
      uint64_t v11 = [v7 compatibilityVersionArray];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __89__TRIActivateTargetedBMLTDeploymentTask__hasValidNCVForBMLT_namespaceDescriptorProvider___block_invoke;
      v28[3] = &unk_1E6BBC0D0;
      id v12 = v9;
      id v29 = v12;
      v31 = &v32;
      id v13 = v10;
      id v30 = v13;
      [v11 enumerateValuesWithBlock:v28];

      if (*((unsigned char *)v33 + 24))
      {
        BOOL v14 = 1;
      }
      else
      {
        v19 = TRILogCategory_Server();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v27 = [v5 taskId];
          int v26 = [v5 deploymentId];
          id v20 = [v13 componentsJoinedByString:@","];
          char v21 = [v7 name];
          int v22 = [v12 downloadNCV];
          v23 = [v5 taskId];
          *(_DWORD *)buf = 138544642;
          int v37 = v27;
          __int16 v38 = 1024;
          int v39 = v26;
          __int16 v40 = 2114;
          id v41 = v20;
          __int16 v42 = 2114;
          v43 = v21;
          __int16 v44 = 1024;
          int v45 = v22;
          __int16 v46 = 2114;
          v47 = v23;
          _os_log_impl(&dword_1DA291000, v19, OS_LOG_TYPE_DEFAULT, "BMLT %{public}@.%u supports namespace compatibility versions {%{public}@} for namespace \"%{public}@\", but the namespace descriptor declares download compatibility with version %u. (This is unlikely to be an issue, unless you're REALLY sure rollout %{public}@ should be available on this device.)", buf, 0x36u);
        }
        BOOL v14 = *((unsigned char *)v33 + 24) != 0;
      }

      _Block_object_dispose(&v32, 8);
    }
    else
    {
      id v15 = TRILogCategory_Server();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [v5 taskId];
        int v17 = [v5 deploymentId];
        v18 = [v7 name];
        *(_DWORD *)buf = 138543874;
        int v37 = v16;
        __int16 v38 = 1024;
        int v39 = v17;
        __int16 v40 = 2114;
        id v41 = v18;
        _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "Note: BMLT %{public}@.%u involves namespace %{public}@ but it is not registered with Trial. Factor packs for this namespace shall not be downloaded.", buf, 0x1Cu);
      }
      BOOL v14 = 0;
    }
  }
  else
  {
    id v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      char v25 = [v5 taskId];
      *(_DWORD *)buf = 138543618;
      int v37 = v25;
      __int16 v38 = 1024;
      int v39 = [v5 deploymentId];
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Note: BMLT %{public}@.%u is missing a selected namespace.", buf, 0x12u);
    }
    BOOL v14 = 0;
  }

  return v14;
}

void __89__TRIActivateTargetedBMLTDeploymentTask__hasValidNCVForBMLT_namespaceDescriptorProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) downloadNCV] == a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v4 = *(void **)(a1 + 40);
    id v5 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%u", a2);
    [v4 addObject:v5];
  }
}

- (void)_activationTelemetryWithSuccess:(BOOL)a3 bmltRecord:(id)a4 serverContext:(id)a5
{
  BOOL v6 = a3;
  deployment = self->_deployment;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [(TRIBMLTDeployment *)deployment backgroundMLTaskId];
  +[TRILighthouseBitacoraHandler emitBMLTEventWithBMLTId:v11 deploymentId:[(TRIBMLTDeployment *)self->_deployment deploymentId] eventType:1 succeeded:v6];

  id v14 = [(TRIBMLTDeployment *)self->_deployment backgroundMLTaskId];
  uint64_t v12 = [(TRIBMLTDeployment *)self->_deployment deploymentId];
  if (v6) {
    uint64_t v13 = 8;
  }
  else {
    uint64_t v13 = 7;
  }
  +[TRITaskUtils updateBMLTHistoryDatabaseWithAllocationStatus:v13 forBMLT:v14 deployment:v12 fps:self->_factorPackSetId bmltRecord:v10 context:v9];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TRIActivateTargetedBMLTDeploymentTask *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TRIActivateTargetedBMLTDeploymentTask;
    if ([(TRIBaseTask *)&v8 isEqual:v4]
      && [(TRIActivateTargetedBMLTDeploymentTask *)v4 isMemberOfClass:objc_opt_class()])
    {
      id v5 = v4;
      if ([(TRIBMLTDeployment *)self->_deployment isEqualToDeployment:v5->_deployment]&& [(TRIFactorPackSetId *)self->_factorPackSetId isEqualToString:v5->_factorPackSetId])
      {
        char v6 = [(TRITaskAttributing *)self->_taskAttribution isEqual:v5->_taskAttribution];
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)TRIActivateTargetedBMLTDeploymentTask;
  unint64_t v3 = [(TRIBaseTask *)&v7 hash];
  uint64_t v4 = [(TRIBMLTDeployment *)self->_deployment hash] + 37 * v3;
  uint64_t v5 = [(TRIFactorPackSetId *)self->_factorPackSetId hash] + 37 * v4;
  return [(TRITaskAttributing *)self->_taskAttribution hash] + 37 * v5;
}

- (id)metrics
{
  return [(TRIBMLTTaskSupport *)self->_support metrics];
}

- (id)dimensions
{
  return [(TRIBMLTTaskSupport *)self->_support dimensions];
}

- (id)trialSystemTelemetry
{
  return [(TRIBMLTTaskSupport *)self->_support trialSystemTelemetry];
}

- (id)_asPersistedTask
{
  unint64_t v3 = objc_opt_new();
  uint64_t v4 = [(TRIBMLTDeployment *)self->_deployment backgroundMLTaskId];
  [v3 setBackgroundMlTaskId:v4];

  objc_msgSend(v3, "setDeploymentId:", -[TRIBMLTDeployment deploymentId](self->_deployment, "deploymentId"));
  [v3 setFactorPackSetId:self->_factorPackSetId];
  uint64_t v5 = [(TRITaskAttributing *)self->_taskAttribution asPersistedTaskAttribution];
  [v3 setTaskAttribution:v5];

  if (self->_bmltBatchNotificationIdentifier) {
    objc_msgSend(v3, "setBmltBatchNotificationId:");
  }
  return v3;
}

- (id)serialize
{
  uint64_t v4 = [(TRIActivateTargetedBMLTDeploymentTask *)self _asPersistedTask];
  uint64_t v5 = [v4 data];

  if (!v5)
  {
    objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIActivateTargetedBMLTDeploymentTask.m", 422, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v28 = 0;
  unint64_t v3 = +[TRIPBMessage parseFromData:a3 error:&v28];
  id v4 = v28;
  if (!v3)
  {
    objc_super v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v30 = v4;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIActivateTargetedBMLTDeploymentPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_26;
  }
  if (([v3 hasBackgroundMlTaskId] & 1) == 0)
  {
    int v17 = TRILogCategory_Server();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      *(_DWORD *)buf = 138412290;
      id v30 = v27;
      _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: backgroundMlTaskId", buf, 0xCu);
    }
    objc_super v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138412290;
    id v30 = v19;
    id v20 = "Cannot decode message of type %@ with missing field: backgroundMlTaskId";
    goto LABEL_25;
  }
  uint64_t v5 = [v3 backgroundMlTaskId];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    objc_super v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    char v21 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v21);
    *(_DWORD *)buf = 138412290;
    id v30 = v19;
    id v20 = "Cannot decode message of type %@ with field of length 0: backgroundMlTaskId";
LABEL_25:
    _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);

    goto LABEL_26;
  }
  if (([v3 hasDeploymentId] & 1) == 0)
  {
    objc_super v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    int v22 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v22);
    *(_DWORD *)buf = 138412290;
    id v30 = v19;
    id v20 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_25;
  }
  if (([v3 hasFactorPackSetId] & 1) == 0)
  {
    objc_super v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    v23 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v23);
    *(_DWORD *)buf = 138412290;
    id v30 = v19;
    id v20 = "Cannot decode message of type %@ with missing field: factorPackSetId";
    goto LABEL_25;
  }
  if (([v3 hasTaskAttribution] & 1) == 0)
  {
    objc_super v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v24);
      *(_DWORD *)buf = 138412290;
      id v30 = v19;
      id v20 = "Cannot decode message of type %@ with missing field: taskAttribution";
      goto LABEL_25;
    }
LABEL_26:
    uint64_t v16 = 0;
    goto LABEL_27;
  }
  objc_super v7 = [v3 taskAttribution];
  objc_super v8 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v7];

  if (v8)
  {
    id v9 = [v3 factorPackSetId];
    id v10 = TRIValidateFactorPackSetId();

    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4FB0078]);
      uint64_t v12 = [v3 backgroundMlTaskId];
      uint64_t v13 = objc_msgSend(v11, "initWithBackgroundMLTaskId:deploymentId:", v12, objc_msgSend(v3, "deploymentId"));

      id v14 = objc_opt_class();
      if ([v3 hasBmltBatchNotificationId])
      {
        id v15 = [v3 bmltBatchNotificationId];
        uint64_t v16 = [v14 taskWithBMLTDeployment:v13 factorPackSetId:v10 taskAttribution:v8 bmltBatchNotificationIdentifier:v15];
      }
      else
      {
        uint64_t v16 = [v14 taskWithBMLTDeployment:v13 factorPackSetId:v10 taskAttribution:v8 bmltBatchNotificationIdentifier:0];
      }

      goto LABEL_35;
    }
  }
  else
  {
    id v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
  }
  uint64_t v16 = 0;
LABEL_35:

LABEL_27:
  return v16;
}

- (unint64_t)requiredCapabilities
{
  v3.receiver = self;
  v3.super_class = (Class)TRIActivateTargetedBMLTDeploymentTask;
  return [(TRIBaseTask *)&v3 requiredCapabilities];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(TRIBMLTDeployment *)self->_deployment shortDesc];
  factorPackSetId = self->_factorPackSetId;
  objc_super v7 = [(TRITaskAttributing *)self->_taskAttribution applicationBundleIdentifier];
  objc_super v8 = [v3 stringWithFormat:@"<%@:%@,%@,%@>", v4, v5, factorPackSetId, v7];

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIActivateTargetedBMLTDeploymentTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIActivateTargetedBMLTDeploymentTask;
  uint64_t v5 = [(TRIActivateTargetedBMLTDeploymentTask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
    if (v6)
    {
      objc_super v7 = [(id)objc_opt_class() parseFromData:v6];
    }
    else
    {
      objc_super v7 = 0;
    }
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIActivateTargetedBMLTDeploymentTask.m", 473, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  uint64_t v5 = [(TRIActivateTargetedBMLTDeploymentTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (TRIBMLTDeployment)deployment
{
  return self->_deployment;
}

- (TRIFactorPackSetId)factorPackSetId
{
  return self->_factorPackSetId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
  objc_storeStrong((id *)&self->_bmltBatchNotificationIdentifier, 0);
  objc_storeStrong((id *)&self->_support, 0);
  objc_storeStrong((id *)&self->_taskAttribution, 0);
}

@end