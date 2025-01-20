@interface TRIActivateTargetedRolloutDeploymentTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithDeployment:(id)a3 factorPackSetId:(id)a4 taskAttribution:(id)a5 capabilityModifier:(id)a6;
- (BOOL)_notifyUpdatedShadowEvaluationsWithDeployments:(id)a3 context:(id)a4 usingTransaction:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)dependencies;
- (NSArray)tags;
- (NSString)description;
- (TRIActivateTargetedRolloutDeploymentTask)initWithCoder:(id)a3;
- (TRIActivateTargetedRolloutDeploymentTask)initWithDeployment:(id)a3 factorPackSetId:(id)a4 taskAttribution:(id)a5 capabilityModifier:(id)a6;
- (TRIFactorPackSetId)factorPackSetId;
- (TRIRolloutDeployment)deployment;
- (id)_asPersistedTask;
- (id)dimensions;
- (id)metrics;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (id)trialSystemTelemetry;
- (int)taskType;
- (unint64_t)hash;
- (unint64_t)requiredCapabilities;
- (void)encodeWithCoder:(id)a3;
- (void)runDequeueHandlerUsingContext:(id)a3;
- (void)runEnqueueHandlerUsingContext:(id)a3;
@end

@implementation TRIActivateTargetedRolloutDeploymentTask

- (TRIActivateTargetedRolloutDeploymentTask)initWithDeployment:(id)a3 factorPackSetId:(id)a4 taskAttribution:(id)a5 capabilityModifier:(id)a6
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
    [v30 handleFailureInMethod:a2, self, @"TRIActivateTargetedRolloutDeploymentTask.m", 59, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"TRIActivateTargetedRolloutDeploymentTask.m", 58, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"TRIActivateTargetedRolloutDeploymentTask.m", 60, @"Invalid parameter not satisfying: %@", @"taskAttribution" object file lineNumber description];

LABEL_4:
  v32.receiver = self;
  v32.super_class = (Class)TRIActivateTargetedRolloutDeploymentTask;
  v16 = [(TRIActivateTargetedRolloutDeploymentTask *)&v32 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_deployment, a3);
    objc_storeStrong((id *)&v17->_factorPackSetId, a4);
    objc_storeStrong((id *)&v17->_taskAttribution, a5);
    v18 = [[TRIRolloutTaskSupport alloc] initWithRolloutDeployment:v17->_deployment];
    support = v17->_support;
    v17->_support = v18;

    objc_storeStrong((id *)&v17->_capabilityModifier, a6);
    v20 = objc_opt_new();
    v21 = [v12 rolloutId];
    v22 = [v20 ensureRolloutFields];
    [v22 setClientRolloutId:v21];

    v23 = loggableFactorPackSetIdFromFactorPackSetId(v13);
    v24 = [v20 ensureRolloutFields];
    [v24 setClientFactorPackSetId:v23];

    v25 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "deploymentId"));
    v26 = [v25 stringValue];
    [v20 setClientDeploymentId:v26];

    v27 = +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:v14];
    [(TRIRolloutTaskSupport *)v17->_support mergeTelemetry:v20];
    [(TRIRolloutTaskSupport *)v17->_support mergeTelemetry:v27];
  }
  return v17;
}

+ (id)taskWithDeployment:(id)a3 factorPackSetId:(id)a4 taskAttribution:(id)a5 capabilityModifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) initWithDeployment:v13 factorPackSetId:v12 taskAttribution:v11 capabilityModifier:v10];

  return v14;
}

- (int)taskType
{
  return 21;
}

- (NSArray)tags
{
  return (NSArray *)[(TRIRolloutTaskSupport *)self->_support tags];
}

- (NSArray)dependencies
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = +[TRIFetchSingleRolloutNotificationTask taskWithDeployment:self->_deployment taskAttributing:self->_taskAttribution];
  v7[0] = v3;
  v4 = +[TRIFetchFactorPackSetTask taskWithFactorPackSetId:self->_factorPackSetId taskAttribution:self->_taskAttribution rolloutDeployment:self->_deployment capabilityModifier:self->_capabilityModifier];
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

  v7 = +[TRIContentTracker contentIdentifierForRolloutArtifactWithDeployment:self->_deployment];
  v8 = [v5 contentTracker];

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

  v8 = +[TRIContentTracker contentIdentifierForRolloutArtifactWithDeployment:self->_deployment];
  id v9 = [v5 contentTracker];

  LOBYTE(v5) = [v9 dropRefWithContentIdentifier:v8];
  if ((v5 & 1) == 0)
  {
    id v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [(TRIRolloutDeployment *)self->_deployment shortDesc];
      int v12 = 138543362;
      id v13 = v11;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for rollout %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (BOOL)_notifyUpdatedShadowEvaluationsWithDeployments:(id)a3 context:(id)a4 usingTransaction:(id)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v49 = [&unk_1F347B3F0 countByEnumeratingWithState:&v64 objects:v73 count:16];
  if (v49)
  {
    uint64_t v10 = *(void *)v65;
    v52 = v8;
    id v53 = v9;
    id v51 = v7;
    uint64_t v48 = *(void *)v65;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v65 != v10) {
          objc_enumerationMutation(&unk_1F347B3F0);
        }
        uint64_t v50 = v11;
        uint64_t v55 = *(void *)(*((void *)&v64 + 1) + 8 * v11);
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id obj = v7;
        uint64_t v58 = [obj countByEnumeratingWithState:&v60 objects:v72 count:16];
        if (v58)
        {
          uint64_t v57 = *(void *)v61;
          while (2)
          {
            for (uint64_t i = 0; i != v58; ++i)
            {
              if (*(void *)v61 != v57) {
                objc_enumerationMutation(obj);
              }
              id v13 = *(__CFString **)(*((void *)&v60 + 1) + 8 * i);
              uint64_t v14 = (void *)MEMORY[0x1E016E7F0]();
              id v15 = [v8 rolloutDatabase];
              v16 = [v15 recordWithDeployment:v13 usingTransaction:v9];

              if (!v16)
              {
                v16 = TRILogCategory_Server();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v69 = v13;
                  _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Unexpected failure to find record for rollout deployment %{public}@.", buf, 0xCu);
                }
                goto LABEL_37;
              }
              v17 = [v16 artifact];
              v18 = [v17 rollout];
              v19 = [v18 shadowEvaluation];
              int v20 = [v19 typeOneOfCase];

              context = v14;
              if (v20 == 1)
              {
                v21 = [v16 activeFactorPackSetId];
                if (v21) {
                  uint64_t v22 = 1;
                }
                else {
                  uint64_t v22 = 2;
                }

                v23 = [NSNumber numberWithUnsignedChar:v22];
                int v24 = [v23 isEqualToNumber:v55];

                if (v24)
                {
                  v25 = TRILogCategory_Server();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    v26 = [v16 activeFactorPackSetId];
                    *(_DWORD *)buf = 138412546;
                    v27 = @"activated";
                    if (!v26) {
                      v27 = @"deactivated";
                    }
                    v69 = v27;
                    __int16 v70 = 2112;
                    v71 = v13;
                    _os_log_impl(&dword_1DA291000, v25, OS_LOG_TYPE_DEFAULT, "Notifying MLRuntime of %@ shadow evaluation for rollout deployment %@.", buf, 0x16u);
                  }
                  v28 = [v16 activeFactorPackSetId];
                  v54 = v28 ? (void *)[objc_alloc(MEMORY[0x1E4FB0230]) initWithDeployment:v13] : 0;

                  id v30 = objc_alloc(MEMORY[0x1E4FB00E8]);
                  v31 = [v16 artifact];
                  objc_super v32 = [v31 rollout];
                  v33 = [v32 shadowEvaluation];
                  v34 = [v33 mlRuntime];
                  v35 = [v34 evaluationId];
                  v36 = objc_opt_new();
                  v37 = (void *)[v30 initWithType:v22 evaluationId:v35 date:v36 evalState:v54];

                  id v38 = objc_alloc(MEMORY[0x1E4FB0190]);
                  v39 = [v16 artifact];
                  uint64_t v40 = [v39 rollout];
                  v41 = [(id)v40 shadowEvaluation];
                  v42 = [v41 mlRuntime];
                  v43 = (void *)[v38 initWithEvaluation:v42 status:v37];

                  id v8 = v52;
                  v44 = [v52 evaluationHistoryDatabase];
                  LOBYTE(v40) = [v44 addRecord:v43 usingTransaction:v53];

                  id v9 = v53;
                  if ((v40 & 1) == 0)
                  {
                    uint64_t v14 = context;
LABEL_37:

                    BOOL v46 = 0;
                    id v7 = v51;
                    goto LABEL_38;
                  }
                }
              }
              else
              {
                v29 = TRILogCategory_Server();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  v45 = [(__CFString *)v13 shortDesc];
                  *(_DWORD *)buf = 138543362;
                  v69 = v45;
                  _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Don't know how to handle shadow evaluation on rollout deployment %{public}@ with unspecified type.", buf, 0xCu);

                  id v9 = v53;
                }
              }
            }
            uint64_t v58 = [obj countByEnumeratingWithState:&v60 objects:v72 count:16];
            if (v58) {
              continue;
            }
            break;
          }
        }

        uint64_t v11 = v50 + 1;
        id v7 = v51;
        uint64_t v10 = v48;
      }
      while (v50 + 1 != v49);
      BOOL v46 = 1;
      uint64_t v49 = [&unk_1F347B3F0 countByEnumeratingWithState:&v64 objects:v73 count:16];
    }
    while (v49);
  }
  else
  {
    BOOL v46 = 1;
  }
LABEL_38:

  return v46;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v124 = a4;
  id v7 = [TRITaskRunResult alloc];
  v113 = [(TRITaskRunResult *)v7 initWithRunStatus:3 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
  id v8 = objc_opt_new();
  v112 = objc_opt_new();
  id v9 = [TRISystemCovariates alloc];
  v121 = v6;
  uint64_t v10 = [v6 paths];
  uint64_t v11 = [(TRISystemCovariates *)v9 initWithPaths:v10];

  v123 = v11;
  int v12 = [(TRISystemCovariates *)v11 dictionary];
  v117 = [v12 valueForKey:@"OSBuild"];

  id v13 = [(TRISystemCovariates *)v11 dictionary];
  v120 = [v13 valueForKey:@"UserSettingsLanguageCode"];

  uint64_t v14 = [(TRISystemCovariates *)v11 dictionary];
  v119 = [v14 valueForKey:@"UserSettingsRegionCode"];

  id v15 = [(TRISystemCovariates *)v11 dictionary];
  v118 = [v15 valueForKey:@"BCP47DeviceLocale"];

  if (v118)
  {
    v16 = [v118 componentsSeparatedByString:@"-"];
    uint64_t v17 = [v16 firstObject];

    v18 = [v118 componentsSeparatedByString:@"-"];
    v19 = [v18 lastObject];

    int v20 = &stru_1F3455898;
    if (v19) {
      int v20 = v19;
    }
    v119 = v20;

    v120 = (void *)v17;
  }
  v21 = [(TRISystemCovariates *)v11 dictionary];
  v116 = [v21 valueForKey:@"CarrierBundleIdentifier"];

  uint64_t v22 = [(TRISystemCovariates *)v11 dictionary];
  v115 = [v22 valueForKey:@"CarrierCountryIsoCode"];

  v23 = [(TRISystemCovariates *)v11 dictionary];
  int v24 = [v23 valueForKey:@"DiagnosticsUsageEnabled"];
  BOOL v25 = v24 != 0;

  v26 = [(TRISystemCovariates *)v11 dictionary];
  v27 = [v26 valueForKey:@"HasANE"];
  BOOL v28 = v27 != 0;

  v29 = [(TRISystemCovariates *)v11 dictionary];
  v114 = [v29 valueForKey:@"ANEVersion"];

  if (!v117)
  {
    v96 = [MEMORY[0x1E4F28B00] currentHandler];
    [v96 handleFailureInMethod:a2, self, @"TRIActivateTargetedRolloutDeploymentTask.m", 210, @"Invalid parameter not satisfying: %@", @"osBuild" object file lineNumber description];
  }
  if (!v120)
  {
    v97 = [MEMORY[0x1E4F28B00] currentHandler];
    [v97 handleFailureInMethod:a2, self, @"TRIActivateTargetedRolloutDeploymentTask.m", 211, @"Invalid parameter not satisfying: %@", @"languageCode" object file lineNumber description];
  }
  if (!v119)
  {
    v98 = [MEMORY[0x1E4F28B00] currentHandler];
    [v98 handleFailureInMethod:a2, self, @"TRIActivateTargetedRolloutDeploymentTask.m", 212, @"Invalid parameter not satisfying: %@", @"regionCode" object file lineNumber description];
  }
  if (!v116)
  {
    v99 = [MEMORY[0x1E4F28B00] currentHandler];
    [v99 handleFailureInMethod:a2, self, @"TRIActivateTargetedRolloutDeploymentTask.m", 213, @"Invalid parameter not satisfying: %@", @"carrierBundleId" object file lineNumber description];
  }
  if (!v115)
  {
    v100 = [MEMORY[0x1E4F28B00] currentHandler];
    [v100 handleFailureInMethod:a2, self, @"TRIActivateTargetedRolloutDeploymentTask.m", 214, @"Invalid parameter not satisfying: %@", @"carrierCountryCode" object file lineNumber description];
  }
  if (!v114)
  {
    v101 = [MEMORY[0x1E4F28B00] currentHandler];
    [v101 handleFailureInMethod:a2, self, @"TRIActivateTargetedRolloutDeploymentTask.m", 215, @"Invalid parameter not satisfying: %@", @"aneVersion" object file lineNumber description];
  }
  id v30 = [v121 rolloutDatabase];
  v122 = [v30 recordWithDeployment:self->_deployment usingTransaction:0];

  if (v122)
  {
    v31 = [v121 namespaceDatabase];
    objc_super v32 = [v121 paths];
    v33 = [v32 namespaceDescriptorsDefaultDir];
    v111 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v31 defaultDescriptorDirectoryPath:v33];

    v34 = [v122 artifact];
    v35 = [v34 rollout];
    v110 = +[TRISetupAssistantFetchUtils getIncompatibleNamespaceNamesForTriClientRollout:v35 namespaceDescriptorProvider:v111];

    if ([v110 count])
    {
      v36 = TRILogCategory_Server();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        deployment = self->_deployment;
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = deployment;
        _os_log_error_impl(&dword_1DA291000, v36, OS_LOG_TYPE_ERROR, "Rollout deployment %{public}@ does not match the device NCVs. Completing task without activating deployment.", buf, 0xCu);
      }

      v37 = [TRITaskRunResult alloc];
      uint64_t v38 = [(TRITaskRunResult *)v37 initWithRunStatus:2 reportResultToServer:0 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
      goto LABEL_35;
    }
    v43 = objc_opt_new();
    v44 = [v122 rampId];

    if (v44)
    {
      v45 = [v122 rampId];
      BOOL v46 = [v43 ensureRolloutFields];
      [v46 setClientRampId:v45];
    }
    factorPackSetId = self->_factorPackSetId;
    uint64_t v48 = [v122 targetedFactorPackSetId];
    if ([(TRIFactorPackSetId *)factorPackSetId isEqual:v48])
    {
      uint64_t v49 = [v122 targetedTargetingRuleIndex];

      uint64_t v50 = v122;
      if (!v49)
      {
LABEL_31:
        [(TRIRolloutTaskSupport *)self->_support mergeTelemetry:v43];

        id v53 = [v50 activeFactorPackSetId];
        int v54 = [v53 isEqualToString:self->_factorPackSetId];

        if (!v54)
        {
          long long v60 = v122;
          if ([v122 isShadow])
          {
            [v112 addObject:self->_deployment];
          }
          else
          {
            long long v153 = 0u;
            long long v154 = 0u;
            long long v151 = 0u;
            long long v152 = 0u;
            long long v61 = [v122 namespaces];
            uint64_t v62 = [v61 countByEnumeratingWithState:&v151 objects:v162 count:16];
            if (v62)
            {
              uint64_t v63 = *(void *)v152;
              do
              {
                for (uint64_t i = 0; i != v62; ++i)
                {
                  if (*(void *)v152 != v63) {
                    objc_enumerationMutation(v61);
                  }
                  [v8 addObject:*(void *)(*((void *)&v151 + 1) + 8 * i)];
                }
                uint64_t v62 = [v61 countByEnumeratingWithState:&v151 objects:v162 count:16];
              }
              while (v62);
            }

            long long v60 = v122;
          }
          char v65 = [v60 isShadow];
          long long v66 = [TRINamespaceResolverStorage alloc];
          long long v67 = [v121 paths];
          v109 = [(TRINamespaceResolverStorage *)v66 initWithPaths:v67];

          v68 = self->_deployment;
          v69 = [v122 rampId];
          LOBYTE(v68) = [(TRINamespaceResolverStorage *)v109 rewriteRolloutDeployment:v68 rampId:v69 targetedFactorPackSetId:self->_factorPackSetId];

          if (v68)
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000;
            char v161 = 0;
            __int16 v70 = objc_opt_new();
            v71 = objc_opt_new();
            v134[0] = MEMORY[0x1E4F143A8];
            v134[1] = 3221225472;
            v134[2] = __74__TRIActivateTargetedRolloutDeploymentTask_runUsingContext_withTaskQueue___block_invoke;
            v134[3] = &unk_1E6BBBF10;
            v134[4] = self;
            id v106 = v122;
            id v135 = v106;
            v147 = buf;
            id v108 = v121;
            id v136 = v108;
            id v105 = v70;
            id v137 = v105;
            id v103 = v71;
            id v138 = v103;
            id v139 = v117;
            id v140 = v120;
            v141 = v119;
            id v142 = v116;
            id v143 = v115;
            BOOL v148 = v25;
            BOOL v149 = v28;
            id v144 = v114;
            char v150 = v65;
            v145 = v109;
            id v146 = v112;
            v107 = (void *)MEMORY[0x1E016EA80](v134);
            v72 = [v108 rolloutDatabase];
            [v72 writeTransactionWithFailableBlock:v107];

            if (*(unsigned char *)(*(void *)&buf[8] + 24))
            {
              long long v132 = 0u;
              long long v133 = 0u;
              long long v130 = 0u;
              long long v131 = 0u;
              id v73 = v105;
              uint64_t v74 = [v73 countByEnumeratingWithState:&v130 objects:v159 count:16];
              if (v74)
              {
                uint64_t v75 = *(void *)v131;
                do
                {
                  for (uint64_t j = 0; j != v74; ++j)
                  {
                    if (*(void *)v131 != v75) {
                      objc_enumerationMutation(v73);
                    }
                    v77 = [*(id *)(*((void *)&v130 + 1) + 8 * j) taskTag];
                    v158 = self;
                    v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v158 count:1];
                    [v124 cancelTasksWithTag:v77 excludingTasks:v78];
                  }
                  uint64_t v74 = [v73 countByEnumeratingWithState:&v130 objects:v159 count:16];
                }
                while (v74);
              }

              v79 = [v108 pushServiceMuxer];
              [v79 subscribeForRolloutDeployment:self->_deployment];

              long long v128 = 0u;
              long long v129 = 0u;
              long long v126 = 0u;
              long long v127 = 0u;
              id v80 = v8;
              uint64_t v81 = [v80 countByEnumeratingWithState:&v126 objects:v157 count:16];
              if (v81)
              {
                uint64_t v82 = *(void *)v127;
                do
                {
                  for (uint64_t k = 0; k != v81; ++k)
                  {
                    if (*(void *)v127 != v82) {
                      objc_enumerationMutation(v80);
                    }
                    uint64_t v84 = *(void *)(*((void *)&v126 + 1) + 8 * k);
                    v85 = TRILogCategory_Server();
                    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v155 = 138543362;
                      uint64_t v156 = v84;
                      _os_log_impl(&dword_1DA291000, v85, OS_LOG_TYPE_DEFAULT, "notify about updates to namespace %{public}@", v155, 0xCu);
                    }

                    [MEMORY[0x1E4FB01E8] notifyUpdateForNamespaceName:v84];
                  }
                  uint64_t v81 = [v80 countByEnumeratingWithState:&v126 objects:v157 count:16];
                }
                while (v81);
              }

              v86 = [(TRIRolloutDeployment *)self->_deployment rolloutId];
              v87 = [v106 rampId];
              LOBYTE(v102) = 0;
              +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 3, v86, v87, [(TRIRolloutDeployment *)self->_deployment deploymentId], self->_factorPackSetId, 0, 0, v106, v102, v108, v103);

              v88 = [TRITaskRunResult alloc];
              v89 = [(TRITaskRunResult *)v88 initWithRunStatus:2 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
            }
            else
            {
              v94 = [(TRIRolloutDeployment *)self->_deployment rolloutId];
              v95 = [v106 rampId];
              LOBYTE(v102) = 0;
              +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 7, v94, v95, [(TRIRolloutDeployment *)self->_deployment deploymentId], self->_factorPackSetId, 0, 0, v106, v102, v108, v103, v105);

              v89 = v113;
            }
            v42 = v89;

            _Block_object_dispose(buf, 8);
          }
          else
          {
            v90 = [(TRIRolloutDeployment *)self->_deployment rolloutId];
            v91 = [v122 rampId];
            LOBYTE(v102) = 0;
            +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:7 forRollout:v90 ramp:v91 deployment:[(TRIRolloutDeployment *)self->_deployment deploymentId] fps:self->_factorPackSetId namespaces:0 telemetryMetric:0 rolloutRecord:v122 isBecomingObsolete:v102 context:v121];

            v42 = v113;
          }

          goto LABEL_36;
        }
        uint64_t v55 = TRILogCategory_Server();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = [(TRIRolloutDeployment *)self->_deployment shortDesc];
          uint64_t v57 = self->_factorPackSetId;
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v56;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v57;
          _os_log_impl(&dword_1DA291000, v55, OS_LOG_TYPE_DEFAULT, "Rollout deployment %{public}@ has already activated factor pack set %{public}@. Completing task without activating deployment again.", buf, 0x16u);
        }
        uint64_t v58 = [TRITaskRunResult alloc];
        uint64_t v38 = [(TRITaskRunResult *)v58 initWithRunStatus:2 reportResultToServer:0 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
LABEL_35:
        v42 = (TRITaskRunResult *)v38;
LABEL_36:

        goto LABEL_37;
      }
      uint64_t v48 = [v122 targetedTargetingRuleIndex];
      uint64_t v51 = [v48 intValue];
      v52 = [v43 ensureRolloutFields];
      [v52 setClientTargetingRuleGroupOrdinal:v51];
    }
    uint64_t v50 = v122;

    goto LABEL_31;
  }
  v39 = TRILogCategory_Server();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    v93 = [(TRIRolloutDeployment *)self->_deployment shortDesc];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v93;
    _os_log_error_impl(&dword_1DA291000, v39, OS_LOG_TYPE_ERROR, "Unexpected failure to lookup rollout record for deployment %{public}@.", buf, 0xCu);
  }
  uint64_t v40 = [(TRIRolloutDeployment *)self->_deployment rolloutId];
  v41 = [0 rampId];
  LOBYTE(v102) = 0;
  +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:7 forRollout:v40 ramp:v41 deployment:[(TRIRolloutDeployment *)self->_deployment deploymentId] fps:self->_factorPackSetId namespaces:0 telemetryMetric:0 rolloutRecord:0 isBecomingObsolete:v102 context:v121];

  v42 = v113;
LABEL_37:

  return v42;
}

uint64_t __74__TRIActivateTargetedRolloutDeploymentTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v100 = objc_opt_new();
  v4 = *(void **)(*(void *)(a1 + 32) + 56);
  id v5 = [*(id *)(a1 + 40) targetedFactorPackSetId];
  if ([v4 isEqual:v5])
  {
    id v6 = [*(id *)(a1 + 40) targetedTargetingRuleIndex];
  }
  else
  {
    id v6 = 0;
  }

  id v7 = [*(id *)(a1 + 48) rolloutDatabase];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = [v7 activateDeployment:*(void *)(*(void *)(a1 + 32) + 48) withFactorPackSetId:*(void *)(*(void *)(a1 + 32) + 56) targetingRuleIndex:v6 deactivatedDeployments:*(void *)(a1 + 56) deactivatedFactorPackSetIds:v100 deactivationStateTransitions:*(void *)(a1 + 64) usingTransaction:v3];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24))
  {
    id v8 = *(void **)(a1 + 64);
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = __74__TRIActivateTargetedRolloutDeploymentTask_runUsingContext_withTaskQueue___block_invoke_2;
    v109[3] = &unk_1E6BBBEE8;
    id v110 = *(id *)(a1 + 40);
    id v111 = *(id *)(a1 + 48);
    [v8 enumerateKeysAndObjectsUsingBlock:v109];
    id v9 = [*(id *)(a1 + 48) activationEventDatabase];
    uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 48) rolloutId];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = [*(id *)(v11 + 48) deploymentId];
    if (*(void *)(a1 + 88)) {
      uint64_t v14 = *(__CFString **)(a1 + 88);
    }
    else {
      uint64_t v14 = &stru_1F3455898;
    }
    LOWORD(v94) = *(_WORD *)(a1 + 144);
    uint64_t v15 = objc_msgSend(v9, "addRecordWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleId:carrierCountryCode:diagnosticsUsageEnabled:hasAne:aneVersion:transaction:", v10, v12, v13, *(void *)(a1 + 72), *(void *)(a1 + 80), v14, *(void *)(a1 + 96), *(void *)(a1 + 104), v94, *(void *)(a1 + 112), v3);

    if (!v15)
    {
      v16 = TRILogCategory_Server();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v91 = *(void *)(a1 + 32);
        v92 = *(void **)(v91 + 56);
        uint64_t v93 = *(void *)(v91 + 48);
        *(_DWORD *)buf = 138412546;
        v114 = v92;
        __int16 v115 = 2114;
        *(void *)v116 = v93;
        _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "error during activation of factorPackSetId {public}%@ for rollout %{public}@: failed to update activation event database", buf, 0x16u);
      }
    }
    if (*(unsigned char *)(a1 + 146))
    {
      uint64_t v17 = TRILogCategory_Server();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(void **)(*(void *)(a1 + 32) + 48);
        *(_DWORD *)buf = 138543362;
        v114 = v18;
        v19 = "Rollout deployment %{public}@ is shadow-installed, no associated activation.";
LABEL_19:
        _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = [*(id *)(a1 + 120) overwriteActiveFactorProvidersUsingTransaction:v3 fromContext:*(void *)(a1 + 48)];
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24))
      {
        uint64_t v82 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
LABEL_63:
        uint64_t v20 = *v82;

        goto LABEL_64;
      }
      uint64_t v17 = TRILogCategory_Server();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(void **)(*(void *)(a1 + 32) + 48);
        *(_DWORD *)buf = 138543362;
        v114 = v21;
        v19 = "Activated rollout deployment: %{public}@";
        goto LABEL_19;
      }
    }
    id v98 = v3;

    unint64_t v22 = 0x1E6BB6000uLL;
    v23 = +[TRIContentTracker contentIdentifierForRolloutArtifactWithDeployment:*(void *)(*(void *)(a1 + 32) + 48)];
    int v24 = [*(id *)(a1 + 48) contentTracker];
    char v25 = [v24 addRefWithContentIdentifier:v23];

    if ((v25 & 1) == 0)
    {
      v26 = TRILogCategory_Server();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v84 = [*(id *)(*(void *)(a1 + 32) + 48) rolloutId];
        int v85 = [*(id *)(*(void *)(a1 + 32) + 48) deploymentId];
        v86 = (objc_class *)objc_opt_class();
        v87 = NSStringFromClass(v86);
        *(_DWORD *)buf = 138543874;
        v114 = v84;
        __int16 v115 = 1024;
        *(_DWORD *)v116 = v85;
        *(_WORD *)&v116[4] = 2114;
        *(void *)&v116[6] = v87;
        _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "Unable to increment ref for rollout deployment: (r: %{public}@, d: %d) in %{public}@", buf, 0x1Cu);

        unint64_t v22 = 0x1E6BB6000;
      }
    }
    v27 = [*(id *)(v22 + 3744) contentIdentifierForFactorPackSetWithId:*(void *)(*(void *)(a1 + 32) + 56)];
    BOOL v28 = [*(id *)(a1 + 48) contentTracker];
    char v29 = [v28 addRefWithContentIdentifier:v27];

    if ((v29 & 1) == 0)
    {
      id v30 = TRILogCategory_Server();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v88 = *(void **)(*(void *)(a1 + 32) + 56);
        v89 = (objc_class *)objc_opt_class();
        v90 = NSStringFromClass(v89);
        *(_DWORD *)buf = 138543618;
        v114 = v88;
        __int16 v115 = 2114;
        *(void *)v116 = v90;
        _os_log_error_impl(&dword_1DA291000, v30, OS_LOG_TYPE_ERROR, "Unable to increment ref for factor pack set: %{public}@ in %{public}@", buf, 0x16u);
      }
    }
    v96 = v6;

    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id obj = *(id *)(a1 + 56);
    id v3 = v98;
    uint64_t v103 = [obj countByEnumeratingWithState:&v105 objects:v112 count:16];
    if (v103)
    {
      uint64_t v102 = *(void *)v106;
      uint64_t v97 = a1;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v106 != v102) {
            objc_enumerationMutation(obj);
          }
          objc_super v32 = *(void **)(*((void *)&v105 + 1) + 8 * v31);
          v33 = (void *)MEMORY[0x1E016E7F0]();
          v34 = [*(id *)(a1 + 48) rolloutDatabase];
          v35 = [v34 recordWithDeployment:v32 usingTransaction:v3];

          if (v35)
          {
            v104 = v33;
            v36 = [v100 objectForKeyedSubscript:v32];
            if (v36)
            {
              v37 = [*(id *)(a1 + 48) activationEventDatabase];
              uint64_t v38 = [v35 deployment];
              v39 = [v38 rolloutId];
              uint64_t v40 = [v35 deployment];
              v41 = objc_msgSend(v37, "activationEventRecordWithParentId:factorPackSetId:deploymentId:", v39, v36, objc_msgSend(v40, "deploymentId"));

              if (v41)
              {
                v42 = [*(id *)(*(void *)(a1 + 32) + 32) trialSystemTelemetry];
                char v43 = [v42 hasPrevOsBuild];

                if ((v43 & 1) == 0)
                {
                  v44 = objc_opt_new();
                  v45 = [v41 osBuild];
                  [v44 setPrevOsBuild:v45];

                  BOOL v46 = [v41 regionCode];
                  [v44 setPrevRegionCode:v46];

                  v47 = [v41 languageCode];
                  [v44 setPrevLanguageCode:v47];

                  uint64_t v48 = NSString;
                  uint64_t v49 = [v41 languageCode];
                  uint64_t v50 = [v41 regionCode];
                  if (v50)
                  {
                    uint64_t v51 = [v41 regionCode];
                    v52 = [v48 stringWithFormat:@"%@-%@", v49, v51];

                    a1 = v97;
                  }
                  else
                  {
                    v52 = [v48 stringWithFormat:@"%@-%@", v49, &stru_1F3455898];
                  }

                  [v44 setPrevBcp47DeviceLocale:v52];
                  id v53 = [v41 carrierBundleIdentifier];
                  [v44 setPrevCarrierBundleIdentifier:v53];

                  int v54 = [v41 carrierCountryIsoCode];
                  [v44 setPrevCarrierCountryIsoCode:v54];

                  [*(id *)(*(void *)(a1 + 32) + 32) mergeTelemetry:v44];
                }
              }
              v101 = v41;
              uint64_t v55 = [v35 deployment];
              v56 = [v55 rolloutId];
              uint64_t v57 = [v35 rampId];
              [v35 deployment];
              v59 = uint64_t v58 = a1;
              LOBYTE(v95) = 0;
              +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 4, v56, v57, [v59 deploymentId], v36, 0, 0, v35, v95, *(void *)(v58 + 48));

              long long v60 = [*(id *)(v58 + 48) activationEventDatabase];
              long long v61 = [v35 deployment];
              uint64_t v62 = [v61 rolloutId];
              uint64_t v63 = [v35 deployment];
              uint64_t v64 = objc_msgSend(v60, "deleteRecordWithParentId:factorPackSetId:deploymentId:", v62, v36, objc_msgSend(v63, "deploymentId"));

              unint64_t v22 = 0x1E6BB6000uLL;
              if (!v64)
              {
                char v65 = TRILogCategory_Server();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v81 = [v32 rolloutId];
                  *(_DWORD *)buf = 138543362;
                  v114 = v81;
                  _os_log_error_impl(&dword_1DA291000, v65, OS_LOG_TYPE_ERROR, "Unable to clear activation record for deactivated rollout: %{public}@", buf, 0xCu);
                }
                uint64_t v58 = v97;
              }
              long long v66 = +[TRIContentTracker contentIdentifierForFactorPackSetWithId:v36];
              long long v67 = [*(id *)(v58 + 48) contentTracker];
              char v68 = [v67 dropRefWithContentIdentifier:v66];

              a1 = v58;
              if ((v68 & 1) == 0)
              {
                v69 = TRILogCategory_Server();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                {
                  v78 = *(void **)(*(void *)(v58 + 32) + 56);
                  v79 = (objc_class *)objc_opt_class();
                  id v80 = NSStringFromClass(v79);
                  *(_DWORD *)buf = 138543618;
                  v114 = v78;
                  unint64_t v22 = 0x1E6BB6000;
                  __int16 v115 = 2114;
                  *(void *)v116 = v80;
                  _os_log_error_impl(&dword_1DA291000, v69, OS_LOG_TYPE_ERROR, "Unable to decrement ref for factor pack set: %{public}@ in %{public}@", buf, 0x16u);
                }
              }

              id v3 = v98;
            }
            if ([v35 isShadow]) {
              [*(id *)(a1 + 128) addObject:v32];
            }

            v33 = v104;
          }
          __int16 v70 = [*(id *)(v22 + 3744) contentIdentifierForRolloutArtifactWithDeployment:v32];
          v71 = [*(id *)(a1 + 48) contentTracker];
          char v72 = [v71 dropRefWithContentIdentifier:v70];

          if ((v72 & 1) == 0)
          {
            id v73 = TRILogCategory_Server();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
            {
              uint64_t v74 = [v32 rolloutId];
              int v75 = [v32 deploymentId];
              v76 = (objc_class *)objc_opt_class();
              v77 = NSStringFromClass(v76);
              *(_DWORD *)buf = 138543874;
              v114 = v74;
              __int16 v115 = 1024;
              *(_DWORD *)v116 = v75;
              id v3 = v98;
              *(_WORD *)&v116[4] = 2114;
              *(void *)&v116[6] = v77;
              _os_log_error_impl(&dword_1DA291000, v73, OS_LOG_TYPE_ERROR, "Unable to decrement ref for rollout deployment: (r: %{public}@, d: %d) in %{public}@", buf, 0x1Cu);

              unint64_t v22 = 0x1E6BB6000;
            }
          }
          ++v31;
        }
        while (v103 != v31);
        uint64_t v103 = [obj countByEnumeratingWithState:&v105 objects:v112 count:16];
      }
      while (v103);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = [*(id *)(a1 + 32) _notifyUpdatedShadowEvaluationsWithDeployments:*(void *)(a1 + 128) context:*(void *)(a1 + 48) usingTransaction:v3];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24)) {
      uint64_t v82 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
    }
    else {
      uint64_t v82 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
    }
    id v6 = v96;
    goto LABEL_63;
  }
  uint64_t v20 = *MEMORY[0x1E4F93BF0];
LABEL_64:

  return v20;
}

void __74__TRIActivateTargetedRolloutDeploymentTask_runUsingContext_withTaskQueue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v15 = a3;
  id v5 = a2;
  int v6 = [v15 isEqualToString:@"obsoleted-unknown-previous-state"];
  id v7 = [v5 deployment];
  id v8 = [v7 rolloutId];
  id v9 = [v5 rampId];
  uint64_t v10 = [v5 deployment];
  uint64_t v11 = [v10 deploymentId];
  if (v6)
  {
    uint64_t v12 = [v5 targetedFactorPackSetId];
    uint64_t v13 = [v5 namespaces];

    LOBYTE(v14) = 1;
    +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:4 forRollout:v8 ramp:v9 deployment:v11 fps:v12 namespaces:v13 telemetryMetric:0 rolloutRecord:*(void *)(a1 + 32) isBecomingObsolete:v14 context:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v12 = [v5 activeFactorPackSetId];
    uint64_t v13 = [v5 namespaces];

    LOBYTE(v14) = 0;
    +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:4 forRollout:v8 ramp:v9 deployment:v11 fps:v12 namespaces:v13 telemetryMetric:v15 rolloutRecord:*(void *)(a1 + 32) isBecomingObsolete:v14 context:*(void *)(a1 + 40)];
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TRIActivateTargetedRolloutDeploymentTask *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TRIActivateTargetedRolloutDeploymentTask;
    if ([(TRIBaseTask *)&v8 isEqual:v4]
      && [(TRIActivateTargetedRolloutDeploymentTask *)v4 isMemberOfClass:objc_opt_class()])
    {
      id v5 = v4;
      if ([(TRIRolloutDeployment *)self->_deployment isEqualToDeployment:v5->_deployment]&& [(TRIFactorPackSetId *)self->_factorPackSetId isEqualToString:v5->_factorPackSetId])
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
  v7.super_class = (Class)TRIActivateTargetedRolloutDeploymentTask;
  unint64_t v3 = [(TRIBaseTask *)&v7 hash];
  uint64_t v4 = [(TRIRolloutDeployment *)self->_deployment hash] + 37 * v3;
  uint64_t v5 = [(TRIFactorPackSetId *)self->_factorPackSetId hash] + 37 * v4;
  return [(TRITaskAttributing *)self->_taskAttribution hash] + 37 * v5;
}

- (id)metrics
{
  return [(TRIRolloutTaskSupport *)self->_support metrics];
}

- (id)dimensions
{
  return [(TRIRolloutTaskSupport *)self->_support dimensions];
}

- (id)trialSystemTelemetry
{
  return [(TRIRolloutTaskSupport *)self->_support trialSystemTelemetry];
}

- (id)_asPersistedTask
{
  unint64_t v3 = objc_opt_new();
  uint64_t v4 = [(TRIRolloutDeployment *)self->_deployment rolloutId];
  [v3 setRolloutId:v4];

  objc_msgSend(v3, "setDeploymentId:", -[TRIRolloutDeployment deploymentId](self->_deployment, "deploymentId"));
  [v3 setFactorPackSetId:self->_factorPackSetId];
  uint64_t v5 = [(TRITaskAttributing *)self->_taskAttribution asPersistedTaskAttribution];
  [v3 setTaskAttribution:v5];

  char v6 = [(TRITaskCapabilityModifier *)self->_capabilityModifier asPersistedModifier];
  [v3 setCapabilityModifier:v6];

  return v3;
}

- (id)serialize
{
  uint64_t v4 = [(TRIActivateTargetedRolloutDeploymentTask *)self _asPersistedTask];
  uint64_t v5 = [v4 data];

  if (!v5)
  {
    objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIActivateTargetedRolloutDeploymentTask.m", 511, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v31 = 0;
  unint64_t v3 = +[TRIPBMessage parseFromData:a3 error:&v31];
  id v4 = v31;
  if (!v3)
  {
    objc_super v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = v4;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIActivateTargetedRolloutDeploymentPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_26;
  }
  if (([v3 hasRolloutId] & 1) == 0)
  {
    v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      char v29 = (objc_class *)objc_opt_class();
      id v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138412290;
      id v33 = v30;
      _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: rolloutId", buf, 0xCu);
    }
    objc_super v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    uint64_t v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138412290;
    id v33 = v21;
    unint64_t v22 = "Cannot decode message of type %@ with missing field: rolloutId";
    goto LABEL_25;
  }
  uint64_t v5 = [v3 rolloutId];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    objc_super v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    v23 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v23);
    *(_DWORD *)buf = 138412290;
    id v33 = v21;
    unint64_t v22 = "Cannot decode message of type %@ with field of length 0: rolloutId";
LABEL_25:
    _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);

    goto LABEL_26;
  }
  if (([v3 hasDeploymentId] & 1) == 0)
  {
    objc_super v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    int v24 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v24);
    *(_DWORD *)buf = 138412290;
    id v33 = v21;
    unint64_t v22 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_25;
  }
  if (([v3 hasFactorPackSetId] & 1) == 0)
  {
    objc_super v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    char v25 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v25);
    *(_DWORD *)buf = 138412290;
    id v33 = v21;
    unint64_t v22 = "Cannot decode message of type %@ with missing field: factorPackSetId";
    goto LABEL_25;
  }
  if (([v3 hasTaskAttribution] & 1) == 0)
  {
    objc_super v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v26);
      *(_DWORD *)buf = 138412290;
      id v33 = v21;
      unint64_t v22 = "Cannot decode message of type %@ with missing field: taskAttribution";
      goto LABEL_25;
    }
LABEL_26:
    v27 = 0;
    goto LABEL_27;
  }
  objc_super v7 = [v3 taskAttribution];
  objc_super v8 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v7];

  if (v8)
  {
    id v9 = [v3 factorPackSetId];
    uint64_t v10 = TRIValidateFactorPackSetId();

    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4FB0228]);
      uint64_t v12 = [v3 rolloutId];
      uint64_t v13 = objc_msgSend(v11, "initWithRolloutId:deploymentId:", v12, objc_msgSend(v3, "deploymentId"));

      if ([v3 hasCapabilityModifier])
      {
        uint64_t v14 = [TRITaskCapabilityModifier alloc];
        id v15 = [v3 capabilityModifier];
        uint64_t v16 = [v15 add];
        uint64_t v17 = [v3 capabilityModifier];
        v18 = -[TRITaskCapabilityModifier initWithAdd:remove:](v14, "initWithAdd:remove:", v16, [v17 remove]);
      }
      else
      {
        v18 = (TRITaskCapabilityModifier *)objc_opt_new();
      }
      v27 = [(id)objc_opt_class() taskWithDeployment:v13 factorPackSetId:v10 taskAttribution:v8 capabilityModifier:v18];

      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
  }
  v27 = 0;
LABEL_35:

LABEL_27:
  return v27;
}

- (unint64_t)requiredCapabilities
{
  v3.receiver = self;
  v3.super_class = (Class)TRIActivateTargetedRolloutDeploymentTask;
  return [(TRIBaseTask *)&v3 requiredCapabilities];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(TRIRolloutDeployment *)self->_deployment shortDesc];
  factorPackSetId = self->_factorPackSetId;
  objc_super v7 = [(TRITaskAttributing *)self->_taskAttribution applicationBundleIdentifier];
  objc_super v8 = [v3 stringWithFormat:@"<%@:%@,%@,%@>", v4, v5, factorPackSetId, v7];

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIActivateTargetedRolloutDeploymentTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIActivateTargetedRolloutDeploymentTask;
  uint64_t v5 = [(TRIActivateTargetedRolloutDeploymentTask *)&v9 init];
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
    [v6 handleFailureInMethod:a2, self, @"TRIActivateTargetedRolloutDeploymentTask.m", 563, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  uint64_t v5 = [(TRIActivateTargetedRolloutDeploymentTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (TRIRolloutDeployment)deployment
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
  objc_storeStrong((id *)&self->_capabilityModifier, 0);
  objc_storeStrong((id *)&self->_support, 0);
  objc_storeStrong((id *)&self->_taskAttribution, 0);
}

@end