@interface TRIActivateTreatmentTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithExperiment:(id)a3 treatmentId:(id)a4 factorPackSetId:(id)a5 taskAttributing:(id)a6 requiresTreatmentInstallation:(BOOL)a7 capabilityModifier:(id)a8 startTime:(id)a9 taskOptions:(id)a10;
+ (id)taskWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 requiresTreatmentInstallation:(BOOL)a6 capabilityModifier:(id)a7 startTime:(id)a8 taskOptions:(id)a9;
- (BOOL)_notifyUpdatedShadowEvaluationWithExperimentRecord:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)testingIgnoreDependencies;
- (BOOL)wasDeferred;
- (NSArray)dependencies;
- (NSString)description;
- (TRIActivateTreatmentTask)initWithCoder:(id)a3;
- (TRIFactorPackSetId)factorPackSetId;
- (id)_asPersistedTask;
- (id)_nextTasksForRunStatus:(int)a3;
- (id)metrics;
- (id)runTaskUsingContext:(id)a3 experiment:(id)a4;
- (id)serialize;
- (int)retryCount;
- (int)taskType;
- (unint64_t)hash;
- (unint64_t)requiredCapabilities;
- (void)encodeWithCoder:(id)a3;
- (void)setRetryCount:(int)a3;
- (void)setTestingIgnoreDependencies:(BOOL)a3;
- (void)setWasDeferred:(BOOL)a3;
@end

@implementation TRIActivateTreatmentTask

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIActivateTreatmentTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIActivateTreatmentTask;
  v5 = [(TRIActivateTreatmentTask *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
    if (v6)
    {
      v7 = [(id)objc_opt_class() parseFromData:v6];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIActivateTreatmentTask.m", 82, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  v5 = [(TRIActivateTreatmentTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

+ (id)taskWithExperiment:(id)a3 treatmentId:(id)a4 factorPackSetId:(id)a5 taskAttributing:(id)a6 requiresTreatmentInstallation:(BOOL)a7 capabilityModifier:(id)a8 startTime:(id)a9 taskOptions:(id)a10
{
  BOOL v11 = a7;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (!v18)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"TRIActivateTreatmentTask.m", 92, @"Invalid parameter not satisfying: %@", @"factorPackSetId" object file lineNumber description];
  }
  v23 = +[TRIActivateTreatmentTask taskWithExperiment:v16 treatmentId:v17 taskAttributing:v19 requiresTreatmentInstallation:v11 capabilityModifier:v20 startTime:v21 taskOptions:v22];
  if (_os_feature_enabled_impl())
  {
    objc_storeStrong(v23 + 14, a5);
  }
  else
  {
    v24 = TRILogCategory_Server();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1DA291000, v24, OS_LOG_TYPE_FAULT, "TRIActivateTreatment is instantiated with a factor pack set id when FPE write is disabled.", buf, 2u);
    }
  }
  return v23;
}

+ (id)taskWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 requiresTreatmentInstallation:(BOOL)a6 capabilityModifier:(id)a7 startTime:(id)a8 taskOptions:(id)a9
{
  BOOL v11 = a6;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = (TRITaskCapabilityModifier *)a7;
  id v20 = a8;
  id v21 = (TRITaskOptions *)a9;
  if (!v16)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"TRIActivateTreatmentTask.m", 121, @"Invalid parameter not satisfying: %@", @"experiment" object file lineNumber description];
  }
  if (([v16 hasDeploymentId] & 1) == 0)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"TRIActivateTreatmentTask.m", 122, @"Invalid parameter not satisfying: %@", @"experiment.hasDeploymentId" object file lineNumber description];
  }
  id v22 = [(TRIActivateTreatmentBaseTask *)[TRIActivateTreatmentTask alloc] initWithExperiment:v16 treatmentId:v17 taskAttributing:v18 requiresTreatmentInstallation:v11];
  [(TRIActivateTreatmentBaseTask *)v22 setStartTime:v20];
  [(TRIActivateTreatmentTask *)v22 setRetryCount:0];
  capabilityModifier = v22->_capabilityModifier;
  v22->_capabilityModifier = v19;
  v24 = v19;

  taskOptions = v22->_taskOptions;
  v22->_taskOptions = v21;

  return v22;
}

- (unint64_t)requiredCapabilities
{
  v3.receiver = self;
  v3.super_class = (Class)TRIActivateTreatmentTask;
  return [(TRIBaseTask *)&v3 requiredCapabilities];
}

- (int)taskType
{
  return 1;
}

- (NSArray)dependencies
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(TRIActivateTreatmentTask *)self testingIgnoreDependencies])
  {
    objc_super v3 = 0;
    goto LABEL_14;
  }
  if (![(TRIActivateTreatmentBaseTask *)self requiresTreatmentInstallation])
  {
    v15 = [(TRIExperimentBaseTask *)self experiment];
    id v20 = [(TRITreatmentBaseTask *)self taskAttributing];
    id v21 = +[TRIFetchExperimentTask taskWithExperimentDeployment:v15 taskAttributing:v20];
    v23 = v21;
    objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];

LABEL_13:
    goto LABEL_14;
  }
  objc_super v3 = objc_opt_new();
  id v4 = [(TRIActivateTreatmentTask *)self factorPackSetId];

  if (v4)
  {
    v5 = [(TRIActivateTreatmentTask *)self factorPackSetId];
    v6 = [(TRITreatmentBaseTask *)self treatmentId];
    id v7 = [(TRITreatmentBaseTask *)self taskAttributing];
    v8 = [(TRIExperimentBaseTask *)self experiment];
    objc_super v9 = +[TRIFetchFactorPackSetTask taskWithFactorPackSetId:v5 treatmentId:v6 taskAttribution:v7 experimentDeployment:v8];
    [v3 addObject:v9];
  }
  if (!_os_feature_enabled_impl()
    || ([(TRIActivateTreatmentTask *)self factorPackSetId],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {
    BOOL v11 = [(TRIExperimentBaseTask *)self experiment];
    v12 = [(TRITreatmentBaseTask *)self treatmentId];
    v13 = [(TRITreatmentBaseTask *)self taskAttributing];
    v14 = +[TRIFetchTreatmentTask taskWithExperiment:v11 treatmentId:v12 taskAttributing:v13 capabilityModifier:self->_capabilityModifier];
    [v3 addObject:v14];
  }
  if (![v3 count])
  {
    v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      id v16 = [(TRIExperimentBaseTask *)self experiment];
      id v17 = [v16 experimentId];
      id v18 = [(TRITreatmentBaseTask *)self treatmentId];
      id v19 = [(TRIActivateTreatmentTask *)self factorPackSetId];
      *(_DWORD *)buf = 138412802;
      v25 = v17;
      __int16 v26 = 2112;
      v27 = v18;
      __int16 v28 = 2112;
      v29 = v19;
      _os_log_fault_impl(&dword_1DA291000, v15, OS_LOG_TYPE_FAULT, "Activate treatment task isn't queueing a fetch FPS or fetch treatmentV1. (ExperimentId: %@, TreatmentId: %@, FPSId:%@)", buf, 0x20u);
    }
    goto LABEL_13;
  }
LABEL_14:
  return (NSArray *)v3;
}

- (id)runTaskUsingContext:(id)a3 experiment:(id)a4
{
  uint64_t v169 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v133 = a4;
  v134 = v7;
  if (!+[TRIUserAdjustableSettings getExperimentOptOut:v7])
  {
    SEL v121 = a2;
    v135 = self;
    v13 = [v7 paths];
    v127 = [v13 namespaceDescriptorsExperimentDir];

    if (!v127)
    {
      v116 = [MEMORY[0x1E4F28B00] currentHandler];
      [v116 handleFailureInMethod:a2 object:self file:@"TRIActivateTreatmentTask.m" lineNumber:203 description:@"no namespace descriptor directory"];
    }
    v130 = [v133 experimentDeployment];
    uint64_t v156 = 0;
    v157 = &v156;
    uint64_t v158 = 0x2020000000;
    int v159 = 3;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v166 = __Block_byref_object_copy__13;
    v167 = __Block_byref_object_dispose__13;
    v168 = @"reason-not-set";
    v14 = [TRISystemCovariates alloc];
    v15 = [v7 paths];
    v136 = [(TRISystemCovariates *)v14 initWithPaths:v15];

    id v16 = [(TRISystemCovariates *)v136 dictionary];
    v129 = [v16 valueForKey:@"OSBuild"];

    id v17 = [(TRISystemCovariates *)v136 dictionary];
    v132 = [v17 valueForKey:@"UserSettingsLanguageCode"];

    id v18 = [(TRISystemCovariates *)v136 dictionary];
    v131 = [v18 valueForKey:@"UserSettingsRegionCode"];

    id v19 = [(TRISystemCovariates *)v136 dictionary];
    v128 = [v19 valueForKey:@"BCP47DeviceLocale"];

    if (v128)
    {
      id v20 = [v128 componentsSeparatedByString:@"-"];
      uint64_t v21 = [v20 firstObject];

      id v22 = [v128 componentsSeparatedByString:@"-"];
      v23 = [v22 lastObject];

      if (v23) {
        v24 = v23;
      }
      else {
        v24 = &stru_1F3455898;
      }
      v131 = v24;

      v132 = (void *)v21;
    }
    v25 = [(TRISystemCovariates *)v136 dictionary];
    uint64_t v26 = [v25 valueForKey:@"CarrierBundleIdentifier"];
    v27 = (void *)v26;
    if (v26) {
      __int16 v28 = (__CFString *)v26;
    }
    else {
      __int16 v28 = &stru_1F3455898;
    }
    v125 = v28;

    v29 = [(TRISystemCovariates *)v136 dictionary];
    uint64_t v30 = [v29 valueForKey:@"CarrierCountryIsoCode"];
    v31 = (void *)v30;
    if (v30) {
      v32 = (__CFString *)v30;
    }
    else {
      v32 = &stru_1F3455898;
    }
    v124 = v32;

    v33 = [(TRISystemCovariates *)v136 dictionary];
    v34 = [v33 valueForKey:@"DiagnosticsUsageEnabled"];
    BOOL v35 = v34 != 0;

    v36 = [(TRISystemCovariates *)v136 dictionary];
    v37 = [v36 valueForKey:@"HasANE"];
    BOOL v38 = v37 != 0;

    v39 = [(TRISystemCovariates *)v136 dictionary];
    uint64_t v40 = [v39 valueForKey:@"ANEVersion"];
    v41 = (void *)v40;
    if (v40) {
      v42 = (__CFString *)v40;
    }
    else {
      v42 = &stru_1F3455898;
    }
    v123 = v42;

    if (!v129)
    {
      v117 = [MEMORY[0x1E4F28B00] currentHandler];
      [v117 handleFailureInMethod:v121, v135, @"TRIActivateTreatmentTask.m", 225, @"Invalid parameter not satisfying: %@", @"osBuild" object file lineNumber description];
    }
    if (!v132)
    {
      v118 = [MEMORY[0x1E4F28B00] currentHandler];
      [v118 handleFailureInMethod:v121, v135, @"TRIActivateTreatmentTask.m", 226, @"Invalid parameter not satisfying: %@", @"languageCode" object file lineNumber description];
    }
    if (!v131)
    {
      v119 = [MEMORY[0x1E4F28B00] currentHandler];
      [v119 handleFailureInMethod:v121, v135, @"TRIActivateTreatmentTask.m", 227, @"Invalid parameter not satisfying: %@", @"regionCode" object file lineNumber description];
    }
    v43 = [v7 experimentDatabase];
    v44 = [v43 experimentRecordWithExperimentDeployment:v130];

    if (v44 && [v44 status] == 1)
    {
      v45 = TRILogCategory_Server();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = [(TRIExperimentBaseTask *)v135 experiment];
        v47 = [v46 experimentId];
        *(_DWORD *)v161 = 138543362;
        v162 = v47;
        _os_log_impl(&dword_1DA291000, v45, OS_LOG_TYPE_DEFAULT, "Experiment %{public}@ is already activated, nothing to do.", v161, 0xCu);
      }
      notify_post("com.apple.trial.ActivateTreatmentTaskComplete");
      v12 = +[TRITaskRunResult resultWithRunStatus:2 reportResultToServer:0 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
LABEL_73:

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v156, 8);

      goto LABEL_74;
    }

    v48 = [v7 experimentDatabase];
    v141[0] = MEMORY[0x1E4F143A8];
    v141[1] = 3221225472;
    v141[2] = __59__TRIActivateTreatmentTask_runTaskUsingContext_experiment___block_invoke_157;
    v141[3] = &unk_1E6BB9D28;
    id v122 = v7;
    id v142 = v122;
    id v143 = v130;
    v144 = v135;
    v152 = &v156;
    v153 = buf;
    id v145 = v129;
    id v146 = v132;
    v147 = v131;
    v148 = v125;
    v149 = v124;
    BOOL v154 = v35;
    BOOL v155 = v38;
    v150 = v123;
    id v126 = v133;
    id v151 = v126;
    [v48 writeTransactionWithFailableBlock:v141];

    v49 = [(TRIActivateTreatmentBaseTask *)v135 endTime];
    BOOL v50 = v49 == 0;

    if (v50)
    {
      v51 = [v126 endDate];
      [(TRIActivateTreatmentBaseTask *)v135 setEndTime:v51];
    }
    if ([(TRIActivateTreatmentBaseTask *)v135 requiresTreatmentInstallation])
    {
      if ([v126 isShadow])
      {
        [(TRIActivateTreatmentTask *)v135 _notifyUpdatedShadowEvaluationWithExperimentRecord:v126 context:v122];
      }
      else
      {
        v52 = TRILogCategory_Server();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v53 = [(TRITreatmentBaseTask *)v135 treatmentId];
          v54 = [(TRIExperimentBaseTask *)v135 experiment];
          v55 = [v54 shortDesc];
          *(_DWORD *)v161 = 138412546;
          v162 = v53;
          __int16 v163 = 2114;
          v164 = v55;
          _os_log_impl(&dword_1DA291000, v52, OS_LOG_TYPE_DEFAULT, "notify about updates to namespaces in treatment %@ for experiment %{public}@", v161, 0x16u);
        }
        long long v139 = 0u;
        long long v140 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        v56 = [v126 namespaces];
        uint64_t v57 = [v56 countByEnumeratingWithState:&v137 objects:v160 count:16];
        if (v57)
        {
          uint64_t v58 = *(void *)v138;
          do
          {
            for (uint64_t i = 0; i != v57; ++i)
            {
              if (*(void *)v138 != v58) {
                objc_enumerationMutation(v56);
              }
              v60 = *(void **)(*((void *)&v137 + 1) + 8 * i);
              v61 = TRILogCategory_Server();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                v62 = [v60 name];
                *(_DWORD *)v161 = 138543362;
                v162 = v62;
                _os_log_impl(&dword_1DA291000, v61, OS_LOG_TYPE_DEFAULT, "notify about updates to namespace %{public}@", v161, 0xCu);
              }
              v63 = (void *)MEMORY[0x1E4FB01E8];
              v64 = [v60 name];
              [v63 notifyUpdateForNamespaceName:v64];
            }
            uint64_t v57 = [v56 countByEnumeratingWithState:&v137 objects:v160 count:16];
          }
          while (v57);
        }
      }
    }
    if (*((_DWORD *)v157 + 6) == 2)
    {
      v65 = [(TRIExperimentBaseTask *)v135 experiment];
      v66 = +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:v65];

      v67 = [v122 contentTracker];
      [v67 addRefWithContentIdentifier:v66];

      v68 = [(TRIExperimentBaseTask *)v135 experiment];
      v69 = [v68 experimentId];
      v70 = [(TRITreatmentBaseTask *)v135 treatmentId];
      v71 = [(TRIExperimentBaseTask *)v135 experiment];
      BOOL v72 = +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 2, v69, v70, [v71 deploymentId], v126, 0, v122);

      if (!v72)
      {
        v73 = TRILogCategory_Server();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          v114 = [(TRITreatmentBaseTask *)v135 treatmentId];
          v115 = [(TRIExperimentBaseTask *)v135 experiment];
          *(_DWORD *)v161 = 138412546;
          v162 = v114;
          __int16 v163 = 2114;
          v164 = v115;
          _os_log_error_impl(&dword_1DA291000, v73, OS_LOG_TYPE_ERROR, "Treatment is active but we failed to update experiment history database for treatment %@ for experiment %{public}@:. We will retry running the task.", v161, 0x16u);
        }
        *((_DWORD *)v157 + 6) = 1;
      }
      if ([(TRIActivateTreatmentBaseTask *)v135 requiresTreatmentInstallation])
      {
        v74 = [(TRIExperimentBaseTask *)v135 containerForFirstNamespaceInExperimentWithContext:v122];
        v75 = [(TRITreatmentBaseTask *)v135 treatmentId];
        v76 = +[TRIContentTracker contentIdentifierForTreatmentArtifactWithTreatmentId:v75 container:v74];

        v77 = [v122 contentTracker];
        [v77 addRefWithContentIdentifier:v76];
      }
    }
    if (*((_DWORD *)v157 + 6) != 1)
    {
      v78 = [v126 artifact];
      v79 = [v78 experiment];
      int v80 = [v79 hasShadowEvaluation];

      if (v80)
      {
        int v81 = *((_DWORD *)v157 + 6);
        v82 = [v126 artifact];
        v83 = [v82 experiment];
        v84 = [v83 shadowEvaluation];
        if ([v84 hasClientBackgroundMlTask])
        {
          v85 = [v126 artifact];
          v86 = [v85 experiment];
          v87 = [v86 shadowEvaluation];
          v88 = [v87 clientBackgroundMlTask];
          int v89 = [v88 hasTaskId];

          if (v89)
          {
            v90 = [v126 artifact];
            v91 = [v90 experiment];
            v92 = [v91 shadowEvaluation];
            v93 = [v92 clientBackgroundMlTask];
            v94 = [v93 taskId];
            v95 = [(TRIExperimentBaseTask *)v135 experiment];
            +[TRILighthouseBitacoraHandler emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:", v94, [v95 deploymentId], 1, v81 == 2);

LABEL_64:
            goto LABEL_65;
          }
        }
        else
        {
        }
        v96 = [v126 artifact];
        v97 = [v96 experiment];
        v98 = [v97 shadowEvaluation];
        v99 = [v98 mlRuntime];
        int v100 = [v99 hasEvaluationId];

        if (v100)
        {
          v90 = [v126 artifact];
          v91 = [v90 experiment];
          v92 = [v91 experimentId];
          v93 = [(TRIExperimentBaseTask *)v135 experiment];
          uint64_t v101 = [v93 deploymentId];
          v94 = [(TRITreatmentBaseTask *)v135 treatmentId];
          +[TRILighthouseBitacoraHandler emitShadowEvaluationEventWithExperimentId:v92 deploymentId:v101 treatmentId:v94 eventType:1 succeeded:v81 == 2];
          goto LABEL_64;
        }
      }
    }
LABEL_65:
    uint64_t v102 = *((unsigned int *)v157 + 6);
    if (v102 == 3)
    {
      v103 = [(TRIExperimentBaseTask *)v135 experiment];
      v104 = [v103 experimentId];
      v105 = [(TRIExperimentBaseTask *)v135 experiment];
      uint64_t v106 = [v105 deploymentId];
      v107 = [(TRITreatmentBaseTask *)v135 treatmentId];
      v108 = +[TRIExperimentDeploymentTreatment treatmentTripleWithExperimentId:v104 deploymentId:v106 treatmentId:v107];

      v109 = +[TRIExperimentPostLaunchEvent failureEventWithEventType:8 treatmentTriple:v108 failureReason:*(void *)(*(void *)&buf[8] + 40)];
      if (!v109)
      {
        v120 = [MEMORY[0x1E4F28B00] currentHandler];
        [v120 handleFailureInMethod:v121, v135, @"TRIActivateTreatmentTask.m", 497, @"Expression was unexpectedly nil/false: %@", @"[TRIExperimentPostLaunchEvent failureEventWithEventType:TRIInternalExperimentAllocationStatusTypeTreatmentActivationFailure treatmentTriple:triple failureReason:failureReason]" object file lineNumber description];
      }
      v110 = +[TRIExperimentPostLaunchRecorder recorderFromContext:v122];
      [v110 recordEvent:v109];

      uint64_t v102 = *((unsigned int *)v157 + 6);
    }
    v111 = [(TRIActivateTreatmentTask *)v135 _nextTasksForRunStatus:v102];
    if (v111) {
      v112 = v111;
    }
    else {
      v112 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v12 = +[TRITaskRunResult resultWithRunStatus:v102 reportResultToServer:1 nextTasks:v112 earliestRetryDate:0];

    notify_post("com.apple.trial.ActivateTreatmentTaskComplete");
    v44 = v142;
    goto LABEL_73;
  }
  v8 = TRILogCategory_Server();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v9 = [v133 experimentDeployment];
    v10 = [v9 experimentId];
    BOOL v11 = [v133 experimentDeployment];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = [v11 deploymentId];
    _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "Skipping activation of treatment for experiment: %{public}@ (deployment: %{public}d) due to user opt-out of experiments", buf, 0x12u);
  }
  v12 = +[TRITaskRunResult resultWithRunStatus:4 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
LABEL_74:

  return v12;
}

uint64_t __59__TRIActivateTreatmentTask_runTaskUsingContext_experiment___block_invoke_157(uint64_t a1, void *a2)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) experimentDatabase];
  char v5 = [v4 setStatus:1 forExperimentDeployment:*(void *)(a1 + 40) usingTransaction:v3];

  if ((v5 & 1) == 0)
  {
    v42 = TRILogCategory_Server();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v56 = [*(id *)(a1 + 48) treatmentId];
      uint64_t v57 = [*(id *)(a1 + 48) experiment];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v56;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v57;
      _os_log_error_impl(&dword_1DA291000, v42, OS_LOG_TYPE_ERROR, "failed to activate treatment %@ for experiment %{public}@: failed to update database", buf, 0x16u);
    }
    goto LABEL_26;
  }
  v6 = *(void **)(*(void *)(a1 + 48) + 96);
  if (v6)
  {
    if ([v6 hasIsManuallyTargeted])
    {
      id v7 = [*(id *)(a1 + 32) experimentDatabase];
      char v8 = objc_msgSend(v7, "setManuallyTargeted:forExperimentDeployment:usingTransaction:", objc_msgSend(*(id *)(*(void *)(a1 + 48) + 96), "isManuallyTargeted"), *(void *)(a1 + 40), v3);

      if ((v8 & 1) == 0)
      {
        v44 = TRILogCategory_Server();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v66 = [*(id *)(a1 + 48) treatmentId];
          v67 = [*(id *)(a1 + 48) experiment];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v66;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v67;
          _os_log_error_impl(&dword_1DA291000, v44, OS_LOG_TYPE_ERROR, "failed to activate treatment %@ for experiment %{public}@: failed to update database", buf, 0x16u);
        }
        *(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 3;
        uint64_t v45 = *(void *)(*(void *)(a1 + 120) + 8);
        v46 = *(void **)(v45 + 40);
        *(void *)(v45 + 40) = @"database-failure";

        goto LABEL_27;
      }
    }
  }
  objc_super v9 = [*(id *)(a1 + 32) activationEventDatabase];
  v10 = [*(id *)(a1 + 40) experimentId];
  BOOL v11 = [*(id *)(a1 + 48) treatmentId];
  uint64_t v12 = [*(id *)(a1 + 40) deploymentId];
  if (*(void *)(a1 + 72)) {
    v13 = *(__CFString **)(a1 + 72);
  }
  else {
    v13 = &stru_1F3455898;
  }
  LOWORD(v72) = *(_WORD *)(a1 + 128);
  uint64_t v14 = objc_msgSend(v9, "addRecordWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleId:carrierCountryCode:diagnosticsUsageEnabled:hasAne:aneVersion:transaction:", v10, v11, v12, *(void *)(a1 + 56), *(void *)(a1 + 64), v13, *(void *)(a1 + 80), *(void *)(a1 + 88), v72, *(void *)(a1 + 96), v3);

  if (!v14)
  {
    v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v61 = [*(id *)(a1 + 48) treatmentId];
      v62 = [*(id *)(a1 + 48) experiment];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v61;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v62;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "error during activation of treatment %@ for experiment %{public}@: failed to update activation event database", buf, 0x16u);
    }
  }
  if (![*(id *)(a1 + 48) requiresTreatmentInstallation]) {
    goto LABEL_60;
  }
  id v16 = [*(id *)(a1 + 32) experimentDatabase];
  id v17 = [v16 treatmentURLsForExperimentDeployment:*(void *)(a1 + 40) usingTransaction:v3];

  if (!v17)
  {
    v42 = TRILogCategory_Server();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v64 = [*(id *)(a1 + 48) treatmentId];
      v65 = [*(id *)(a1 + 48) experiment];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v64;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v65;
      _os_log_error_impl(&dword_1DA291000, v42, OS_LOG_TYPE_ERROR, "cannot activate treatment %@ for experiment %{public}@: failed to read treatment paths", buf, 0x16u);
    }
LABEL_26:

    *(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 1;
LABEL_27:
    v43 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
LABEL_61:
    uint64_t v36 = *v43;
    goto LABEL_62;
  }
  id v18 = [[TRIUserCovariates alloc] initWithContext:*(void *)(a1 + 32)];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v79 = __Block_byref_object_copy__13;
  int v80 = __Block_byref_object_dispose__13;
  id v81 = 0;
  id v19 = [*(id *)(a1 + 32) experimentDatabase];
  id v20 = [*(id *)(a1 + 48) experiment];
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __59__TRIActivateTreatmentTask_runTaskUsingContext_experiment___block_invoke_159;
  v73[3] = &unk_1E6BB9D00;
  v73[4] = buf;
  [v19 enumerateNamespaceRecordsForExperimentDeployment:v20 usingTransaction:v3 block:v73];

  if (*(void *)(*(void *)&buf[8] + 40))
  {
    uint64_t v21 = [*(id *)(a1 + 32) namespaceDatabase];
    id v22 = [v21 dynamicNamespaceRecordWithNamespaceName:*(void *)(*(void *)&buf[8] + 40)];

    if (v22)
    {
      v23 = [*(id *)(a1 + 48) taskAttributing];
      v24 = [v23 applicationBundleIdentifier];

      if (v24)
      {
        v25 = [MEMORY[0x1E4FB0650] dimensionWithName:@"client_app_bundle_id" value:v24];
        [*(id *)(a1 + 48) addDimension:v25];
        uint64_t v26 = [(TRIUserCovariates *)v18 tri_shortVersionStringForBundleId:v24];
        v27 = [MEMORY[0x1E4FB0650] dimensionWithName:@"client_app_version" value:v26];
        [*(id *)(a1 + 48) addDimension:v27];
      }
    }
  }
  if (([*(id *)(a1 + 104) isShadow] & 1) != 0
    || (__int16 v28 = *(void **)(a1 + 48),
        [*(id *)(a1 + 32) paths],
        v29 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v28) = [v28 _writeNamespaceDescriptorsWithPaths:v29 toTreatmentLayer:4 forExperiment:*(void *)(a1 + 104) treatmentURLs:v17 context:*(void *)(a1 + 32)], v29, (v28 & 1) != 0))
  {
    uint64_t v30 = [TRINamespaceResolverStorage alloc];
    v31 = [*(id *)(a1 + 32) paths];
    v32 = [(TRINamespaceResolverStorage *)v30 initWithPaths:v31];

    v33 = *(void **)(a1 + 48);
    if (v33[14])
    {
      v34 = [TRIFactorPackSetStorage alloc];
      BOOL v35 = [*(id *)(a1 + 32) paths];
      uint64_t v36 = [(TRIFactorPackSetStorage *)v34 initWithPaths:v35];

      int v37 = [(id)v36 hasFactorPackSetWithId:*(void *)(*(void *)(a1 + 48) + 112) path:0];
      BOOL v38 = *(void **)(a1 + 48);
      if (v37)
      {
        v39 = [v38 experiment];
        uint64_t v40 = [*(id *)(a1 + 48) treatmentId];
        BOOL v41 = [(TRINamespaceResolverStorage *)v32 rewriteExperimentDeployment:v39 targetedTreatmentId:v40 factorPackSetId:*(void *)(*(void *)(a1 + 48) + 112)];

        if (v41) {
          goto LABEL_47;
        }
LABEL_42:
        if ([*(id *)(a1 + 104) isShadow])
        {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 3;
          uint64_t v54 = *(void *)(*(void *)(a1 + 120) + 8);
          v55 = *(void **)(v54 + 40);
          *(void *)(v54 + 40) = @"storage-rewrite-failure";

LABEL_53:
          uint64_t v36 = *MEMORY[0x1E4F93BF0];
          int v50 = 1;
LABEL_58:

          goto LABEL_59;
        }
        uint64_t v36 = TRILogCategory_Server();
        if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v74 = 0;
          _os_log_impl(&dword_1DA291000, (os_log_t)v36, OS_LOG_TYPE_DEFAULT, "Unable to update on-disk experiment deployment directory, but continuing because the experiment is non-shadow.", v74, 2u);
        }

LABEL_47:
        if (_os_feature_enabled_impl()
          && ![(TRINamespaceResolverStorage *)v32 overwriteActiveFactorProvidersUsingTransaction:v3 fromContext:*(void *)(a1 + 32)])
        {
          if (_os_feature_enabled_impl())
          {
            uint64_t v58 = TRILogCategory_Server();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v74 = 0;
              _os_log_error_impl(&dword_1DA291000, v58, OS_LOG_TYPE_ERROR, "Unable to update the factor providers after experiment activation.", v74, 2u);
            }

            *(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 3;
            uint64_t v59 = *(void *)(*(void *)(a1 + 120) + 8);
            v60 = *(void **)(v59 + 40);
            *(void *)(v59 + 40) = @"storage-overwrite-failure";

            goto LABEL_53;
          }
          uint64_t v36 = TRILogCategory_Server();
          if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v74 = 0;
            _os_log_fault_impl(&dword_1DA291000, (os_log_t)v36, OS_LOG_TYPE_FAULT, "Unable to update the factor providers after experiment activation.", v74, 2u);
          }
        }
        int v50 = 0;
        goto LABEL_58;
      }
      v51 = [v38 experiment];
      v52 = [*(id *)(a1 + 48) treatmentId];
      BOOL v48 = [(TRINamespaceResolverStorage *)v32 rewriteExperimentDeployment:v51 targetedTreatmentId:v52];

      v53 = TRILogCategory_Server();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v70 = [*(id *)(a1 + 48) treatmentId];
        v71 = *(void **)(*(void *)(a1 + 48) + 112);
        *(_DWORD *)v74 = 138412546;
        v75 = v70;
        __int16 v76 = 2112;
        v77 = v71;
        _os_log_error_impl(&dword_1DA291000, v53, OS_LOG_TYPE_ERROR, "Activating treatment (%@) without FPS (%@): The fetch seems to have failed.", v74, 0x16u);
      }
    }
    else
    {
      uint64_t v36 = [v33 experiment];
      v47 = [*(id *)(a1 + 48) treatmentId];
      BOOL v48 = [(TRINamespaceResolverStorage *)v32 rewriteExperimentDeployment:v36 targetedTreatmentId:v47];
    }
    if (v48) {
      goto LABEL_47;
    }
    goto LABEL_42;
  }
  v49 = TRILogCategory_Server();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
  {
    v68 = [*(id *)(a1 + 48) treatmentId];
    v69 = [*(id *)(a1 + 48) experiment];
    *(_DWORD *)v74 = 138412546;
    v75 = v68;
    __int16 v76 = 2114;
    v77 = v69;
    _os_log_error_impl(&dword_1DA291000, v49, OS_LOG_TYPE_ERROR, "cannot activate treatment %@ for experiment %{public}@: failed to save namespace descriptors", v74, 0x16u);
  }
  int v50 = 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 1;
  uint64_t v36 = *MEMORY[0x1E4F93BF0];
LABEL_59:
  _Block_object_dispose(buf, 8);

  if (!v50)
  {
LABEL_60:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 2;
    v43 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
    goto LABEL_61;
  }
LABEL_62:

  return v36;
}

void __59__TRIActivateTreatmentTask_runTaskUsingContext_experiment___block_invoke_159(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 name];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = 1;
}

- (id)_nextTasksForRunStatus:(int)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    uint64_t v12 = [(TRIActivateTreatmentBaseTask *)self endTime];

    if (!v12)
    {
      uint64_t v5 = TRILogCategory_Server();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v24 = [(TRITreatmentBaseTask *)self treatmentId];
        v25 = [(TRIExperimentBaseTask *)self experiment];
        uint64_t v26 = [v25 experimentId];
        int v27 = 138412546;
        __int16 v28 = v24;
        __int16 v29 = 2114;
        uint64_t v30 = v26;
        _os_log_debug_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEBUG, "not scheduling deactivation of treatment %@ for experiment %{public}@ since end time is nil", (uint8_t *)&v27, 0x16u);
      }
      BOOL v11 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_9;
    }
    v13 = [(TRIExperimentBaseTask *)self experiment];
    uint64_t v14 = [v13 experimentId];
    v15 = [(TRIExperimentBaseTask *)self experiment];
    uint64_t v16 = [v15 deploymentId];
    id v17 = [(TRIActivateTreatmentBaseTask *)self endTime];
    id v18 = [(TRITreatmentBaseTask *)self taskAttributing];
    uint64_t v5 = +[TRIDeactivateTreatmentTask taskWithExperimentId:v14 deploymentId:v16 startTime:v17 failOnUnrecognizedExperiment:1 triggerEvent:2 taskAttribution:v18];

    uint64_t v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)(int)(60 * arc4random_uniform(0x1Eu))];
    id v19 = [(TRIExperimentBaseTask *)self experiment];
    id v20 = [v19 experimentId];
    uint64_t v21 = +[TRISubscribeChannelTask taskWithExperimentId:v20 startTime:v6];

    v31[0] = v5;
    v31[1] = v21;
    BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];

LABEL_8:
LABEL_9:

    goto LABEL_11;
  }
  if (a3 == 3)
  {
    id v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v23 = [(TRITreatmentBaseTask *)self treatmentId];
      int v27 = 138412290;
      __int16 v28 = v23;
      _os_log_error_impl(&dword_1DA291000, v4, OS_LOG_TYPE_ERROR, "failed to activate treatment id %@", (uint8_t *)&v27, 0xCu);
    }
    uint64_t v5 = [(TRIExperimentBaseTask *)self experiment];
    uint64_t v6 = [v5 experimentId];
    id v7 = [(TRIExperimentBaseTask *)self experiment];
    uint64_t v8 = [v7 deploymentId];
    objc_super v9 = [(TRITreatmentBaseTask *)self taskAttributing];
    v10 = +[TRIDeactivateTreatmentTask taskWithExperimentId:v6 deploymentId:v8 failOnUnrecognizedExperiment:1 triggerEvent:10 taskAttribution:v9];
    v32[0] = v10;
    BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];

    goto LABEL_8;
  }
  BOOL v11 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_11:
  return v11;
}

- (BOOL)_notifyUpdatedShadowEvaluationWithExperimentRecord:(id)a3 context:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v8 = [v5 artifact];
  objc_super v9 = [v8 experiment];

  if (![v9 hasShadowEvaluation]) {
    goto LABEL_11;
  }
  v10 = [v9 shadowEvaluation];
  char v11 = [v10 hasClientBackgroundMlTask];

  if (v11) {
    goto LABEL_11;
  }
  uint64_t v12 = [v9 shadowEvaluation];
  int v13 = [v12 typeOneOfCase];

  uint64_t v14 = TRILogCategory_Server();
  v15 = v14;
  if (v13 != 1)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v35 = [v5 experimentDeployment];
      uint64_t v36 = [v35 shortDesc];
      int v37 = 138543362;
      BOOL v38 = v36;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Don't know how to handle shadow evaluation on experiment deployment %{public}@ with unspecified type.", (uint8_t *)&v37, 0xCu);
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v5 experimentDeployment];
    id v17 = [v16 shortDesc];
    int v37 = 138543362;
    BOOL v38 = v17;
    _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "Notifying MLRuntime of activated shadow evaluation for experiment deployment %{public}@.", (uint8_t *)&v37, 0xCu);
  }
  id v18 = objc_alloc(MEMORY[0x1E4FB0100]);
  id v19 = [v5 experimentDeployment];
  id v20 = [v5 treatmentId];
  uint64_t v21 = (void *)[v18 initWithDeployment:v19 treatmentId:v20];

  id v22 = objc_alloc(MEMORY[0x1E4FB00E8]);
  v23 = [v9 shadowEvaluation];
  v24 = [v23 mlRuntime];
  v25 = [v24 evaluationId];
  uint64_t v26 = objc_opt_new();
  int v27 = (void *)[v22 initWithType:1 evaluationId:v25 date:v26 evalState:v21];

  id v28 = objc_alloc(MEMORY[0x1E4FB0190]);
  __int16 v29 = [v9 shadowEvaluation];
  uint64_t v30 = [v29 mlRuntime];
  v31 = (void *)[v28 initWithEvaluation:v30 status:v27];

  v32 = [v6 evaluationHistoryDatabase];
  LOBYTE(v30) = [v32 addRecord:v31 usingTransaction:0];

  if (v30)
  {
LABEL_11:
    BOOL v33 = 1;
    goto LABEL_12;
  }
  BOOL v33 = 0;
LABEL_12:

  return v33;
}

- (id)metrics
{
  v10.receiver = self;
  v10.super_class = (Class)TRIActivateTreatmentTask;
  uint64_t v3 = [(TRITreatmentBaseTask *)&v10 metrics];
  id v4 = (void *)v3;
  id v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  if (self->_treatmentMetric)
  {
    objc_msgSend(v6, "arrayByAddingObject:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v6;
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)_asPersistedTask
{
  uint64_t v3 = objc_opt_new();
  id v4 = [(TRIExperimentBaseTask *)self experiment];
  id v5 = [v4 experimentId];
  [v3 setExperimentId:v5];

  id v6 = [(TRIExperimentBaseTask *)self experiment];
  objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v6, "deploymentId"));

  id v7 = [(TRITreatmentBaseTask *)self treatmentId];
  [v3 setTreatmentId:v7];

  uint64_t v8 = [(TRIActivateTreatmentTask *)self factorPackSetId];

  if (v8)
  {
    objc_super v9 = [(TRIActivateTreatmentTask *)self factorPackSetId];
    [v3 setFactorPackSetId:v9];
  }
  objc_super v10 = [(TRITreatmentBaseTask *)self taskAttributing];
  char v11 = [v10 asPersistedTaskAttribution];
  [v3 setTaskAttribution:v11];

  uint64_t v12 = [(TRIActivateTreatmentBaseTask *)self startTime];

  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4FB05F0]);
    uint64_t v14 = [(TRIActivateTreatmentBaseTask *)self startTime];
    v15 = (void *)[v13 initWithDate:v14];
    [v3 setStartTimestamp:v15];
  }
  uint64_t v16 = [(TRIActivateTreatmentBaseTask *)self endTime];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x1E4FB05F0]);
    id v18 = [(TRIActivateTreatmentBaseTask *)self endTime];
    id v19 = (void *)[v17 initWithDate:v18];
    [v3 setEndTimestamp:v19];
  }
  objc_msgSend(v3, "setRequiresTreatmentInstallation:", -[TRIActivateTreatmentBaseTask requiresTreatmentInstallation](self, "requiresTreatmentInstallation"));
  id v20 = [(TRITaskCapabilityModifier *)self->_capabilityModifier asPersistedModifier];
  [v3 setCapabilityModifier:v20];

  if (self->_taskOptions) {
    objc_msgSend(v3, "setTaskOptions:");
  }
  return v3;
}

- (id)serialize
{
  id v4 = [(TRIActivateTreatmentTask *)self _asPersistedTask];
  id v5 = [v4 data];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = (objc_class *)objc_opt_class();
    objc_super v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIActivateTreatmentTask.m", 614, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v58 = 0;
  id v4 = +[TRIPBMessage parseFromData:a3 error:&v58];
  id v5 = v58;
  if (!v4)
  {
    char v11 = TRILogCategory_Server();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_32:
      uint64_t v36 = 0;
      goto LABEL_33;
    }
    *(_DWORD *)buf = 138543362;
    id v60 = v5;
    uint64_t v21 = "Unable to parse buffer as TRIActivateTreatmentPersistedTask: %{public}@";
    id v22 = v11;
    uint32_t v23 = 12;
LABEL_14:
    _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    goto LABEL_32;
  }
  if (([v4 hasExperimentId] & 1) == 0)
  {
    v24 = TRILogCategory_Server();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      BOOL v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      *(_DWORD *)buf = 138412290;
      id v60 = v34;
      _os_log_error_impl(&dword_1DA291000, v24, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);
    }
    char v11 = TRILogCategory_Server();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    v25 = (objc_class *)objc_opt_class();
    uint64_t v26 = NSStringFromClass(v25);
    *(_DWORD *)buf = 138412290;
    id v60 = v26;
    int v27 = "Cannot decode message of type %@ with missing field: experimentId";
    goto LABEL_31;
  }
  id v6 = [v4 experimentId];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    char v11 = TRILogCategory_Server();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    id v28 = (objc_class *)objc_opt_class();
    uint64_t v26 = NSStringFromClass(v28);
    *(_DWORD *)buf = 138412290;
    id v60 = v26;
    int v27 = "Cannot decode message of type %@ with field of length 0: experimentId";
LABEL_31:
    _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);

    goto LABEL_32;
  }
  if (([v4 hasTreatmentId] & 1) == 0)
  {
    __int16 v29 = TRILogCategory_Server();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      BOOL v38 = (objc_class *)objc_opt_class();
      uint64_t v39 = NSStringFromClass(v38);
      *(_DWORD *)buf = 138412290;
      id v60 = v39;
      _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: treatmentId", buf, 0xCu);
    }
    char v11 = TRILogCategory_Server();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    uint64_t v30 = (objc_class *)objc_opt_class();
    uint64_t v26 = NSStringFromClass(v30);
    *(_DWORD *)buf = 138412290;
    id v60 = v26;
    int v27 = "Cannot decode message of type %@ with missing field: treatmentId";
    goto LABEL_31;
  }
  uint64_t v8 = [v4 treatmentId];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    char v11 = TRILogCategory_Server();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    v31 = (objc_class *)objc_opt_class();
    uint64_t v26 = NSStringFromClass(v31);
    *(_DWORD *)buf = 138412290;
    id v60 = v26;
    int v27 = "Cannot decode message of type %@ with field of length 0: treatmentId";
    goto LABEL_31;
  }
  if (([v4 hasDeploymentId] & 1) == 0)
  {
    char v11 = TRILogCategory_Server();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    v32 = (objc_class *)objc_opt_class();
    uint64_t v26 = NSStringFromClass(v32);
    *(_DWORD *)buf = 138412290;
    id v60 = v26;
    int v27 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_31;
  }
  if (([v4 hasTaskAttribution] & 1) == 0)
  {
    char v11 = TRILogCategory_Server();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    BOOL v35 = (objc_class *)objc_opt_class();
    uint64_t v26 = NSStringFromClass(v35);
    *(_DWORD *)buf = 138412290;
    id v60 = v26;
    int v27 = "Cannot decode message of type %@ with missing field: taskAttribution";
    goto LABEL_31;
  }
  if ([v4 deploymentId] == -1)
  {
    char v11 = TRILogCategory_Server();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    uint64_t v21 = "TRIActivateTreatmentPersistedTask encodes unspecified deploymentId.";
    id v22 = v11;
    uint32_t v23 = 2;
    goto LABEL_14;
  }
  objc_super v10 = [v4 taskAttribution];
  char v11 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v10];

  if (!v11)
  {
    uint64_t v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    uint64_t v36 = 0;
    goto LABEL_74;
  }
  id v12 = objc_alloc(MEMORY[0x1E4FB00F8]);
  id v13 = [v4 experimentId];
  uint64_t v14 = objc_msgSend(v12, "initWithExperimentId:deploymentId:", v13, objc_msgSend(v4, "deploymentId"));

  if ([v4 hasCapabilityModifier])
  {
    v15 = [TRITaskCapabilityModifier alloc];
    uint64_t v16 = [v4 capabilityModifier];
    uint64_t v17 = [v16 add];
    uint64_t v3 = [v4 capabilityModifier];
    uint64_t v18 = -[TRITaskCapabilityModifier initWithAdd:remove:](v15, "initWithAdd:remove:", v17, [v3 remove]);
    id v13 = v14;
    id v19 = (void *)v18;

    id v20 = v19;
    uint64_t v14 = v13;
  }
  else
  {
    id v20 = objc_opt_new();
  }
  if (_os_feature_enabled_impl() && [v4 hasFactorPackSetId])
  {
    uint64_t v54 = objc_opt_class();
    uint64_t v40 = [v4 treatmentId];
    uint64_t v3 = [v4 factorPackSetId];
    if ([v4 hasRequiresTreatmentInstallation]) {
      uint64_t v41 = [v4 requiresTreatmentInstallation];
    }
    else {
      uint64_t v41 = 1;
    }
    int v48 = [v4 hasStartTimestamp];
    if (v48)
    {
      id v13 = [v4 startTimestamp];
      uint64_t v57 = [v13 date];
    }
    else
    {
      uint64_t v57 = 0;
    }
    if ([v4 hasTaskOptions])
    {
      [v4 taskOptions];
      v49 = v53 = v13;
      uint64_t v36 = [v54 taskWithExperiment:v14 treatmentId:v40 factorPackSetId:v3 taskAttributing:v11 requiresTreatmentInstallation:v41 capabilityModifier:v20 startTime:v57 taskOptions:v49];

      id v13 = v53;
    }
    else
    {
      uint64_t v36 = [v54 taskWithExperiment:v14 treatmentId:v40 factorPackSetId:v3 taskAttributing:v11 requiresTreatmentInstallation:v41 capabilityModifier:v20 startTime:v57 taskOptions:0];
    }
    if (!v48) {
      goto LABEL_67;
    }
  }
  else
  {
    v56 = objc_opt_class();
    uint64_t v40 = [v4 treatmentId];
    if ([v4 hasRequiresTreatmentInstallation]) {
      uint64_t v42 = [v4 requiresTreatmentInstallation];
    }
    else {
      uint64_t v42 = 1;
    }
    int v43 = [v4 hasStartTimestamp];
    if (v43)
    {
      uint64_t v3 = [v4 startTimestamp];
      id v13 = [v3 date];
    }
    else
    {
      id v13 = 0;
    }
    if ([v4 hasTaskOptions])
    {
      [v4 taskOptions];
      v55 = v3;
      v44 = v40;
      uint64_t v45 = v14;
      v47 = v46 = v20;
      uint64_t v36 = [v56 taskWithExperiment:v45 treatmentId:v44 taskAttributing:v11 requiresTreatmentInstallation:v42 capabilityModifier:v46 startTime:v13 taskOptions:v47];

      id v20 = v46;
      uint64_t v14 = v45;
      uint64_t v40 = v44;
      uint64_t v3 = v55;
    }
    else
    {
      uint64_t v36 = [v56 taskWithExperiment:v14 treatmentId:v40 taskAttributing:v11 requiresTreatmentInstallation:v42 capabilityModifier:v20 startTime:v13 taskOptions:0];
    }
    if (!v43) {
      goto LABEL_68;
    }
  }

LABEL_67:
LABEL_68:

  if ([v4 hasEndTimestamp])
  {
    int v50 = [v4 endTimestamp];
    v51 = [v50 date];
    [v36 setEndTime:v51];
  }
  if ([v4 hasRetryCount]) {
    uint64_t v52 = [v4 retryCount];
  }
  else {
    uint64_t v52 = 0;
  }
  [v36 setRetryCount:v52];

LABEL_74:
LABEL_33:

  return v36;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(TRIExperimentBaseTask *)self experiment];
  id v6 = [v5 shortDesc];
  uint64_t v7 = [(TRITreatmentBaseTask *)self treatmentId];
  uint64_t v8 = [(TRITreatmentBaseTask *)self taskAttributing];
  uint64_t v9 = [v8 applicationBundleIdentifier];
  objc_super v10 = [v3 stringWithFormat:@"<%@:%@,%@,%@,r:%d>", v4, v6, v7, v9, -[TRIActivateTreatmentTask retryCount](self, "retryCount")];

  return (NSString *)v10;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)TRIActivateTreatmentTask;
  unint64_t v3 = [(TRIActivateTreatmentBaseTask *)&v8 hash];
  uint64_t v4 = [(TRIActivateTreatmentTask *)self factorPackSetId];
  if (v4)
  {
    id v5 = [(TRIActivateTreatmentTask *)self factorPackSetId];
    uint64_t v6 = [v5 hash];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6 + 37 * v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TRIActivateTreatmentTask *)a3;
  if (self == v4)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TRIActivateTreatmentTask;
    unsigned int v5 = [(TRIActivateTreatmentBaseTask *)&v13 isEqual:v4];
    LOBYTE(v6) = 0;
    if (v4 && v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = v4;
        objc_super v8 = [(TRIActivateTreatmentTask *)self factorPackSetId];

        uint64_t v6 = [(TRIActivateTreatmentTask *)v7 factorPackSetId];

        if (v8)
        {
          if (!v6)
          {
LABEL_13:

            goto LABEL_14;
          }
          uint64_t v9 = [(TRIActivateTreatmentTask *)self factorPackSetId];
          objc_super v10 = [(TRIActivateTreatmentTask *)v7 factorPackSetId];
          int v11 = [v9 isEqualToString:v10];

          if (v11)
          {
LABEL_8:
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        else if (!v6)
        {
          goto LABEL_8;
        }
        LOBYTE(v6) = 0;
        goto LABEL_13;
      }
      LOBYTE(v6) = 0;
    }
  }
LABEL_14:

  return (char)v6;
}

- (int)retryCount
{
  return self->retryCount;
}

- (void)setRetryCount:(int)a3
{
  self->retryCount = a3;
}

- (BOOL)wasDeferred
{
  return self->wasDeferred;
}

- (void)setWasDeferred:(BOOL)a3
{
  self->wasDeferred = a3;
}

- (TRIFactorPackSetId)factorPackSetId
{
  return self->_factorPackSetId;
}

- (BOOL)testingIgnoreDependencies
{
  return self->_testingIgnoreDependencies;
}

- (void)setTestingIgnoreDependencies:(BOOL)a3
{
  self->_testingIgnoreDependencies = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
  objc_storeStrong((id *)&self->_taskOptions, 0);
  objc_storeStrong((id *)&self->_capabilityModifier, 0);
  objc_storeStrong((id *)&self->_treatmentMetric, 0);
}

@end