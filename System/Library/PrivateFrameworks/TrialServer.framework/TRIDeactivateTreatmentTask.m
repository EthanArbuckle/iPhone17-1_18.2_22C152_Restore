@interface TRIDeactivateTreatmentTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)prevTelemetryFieldsFromActivationEventDatabase:(id)a3 deactivatedRecord:(id)a4;
+ (id)taskWithExperimentId:(id)a3 deploymentId:(int)a4 failOnUnrecognizedExperiment:(BOOL)a5 triggerEvent:(unint64_t)a6 taskAttribution:(id)a7;
+ (id)taskWithExperimentId:(id)a3 deploymentId:(int)a4 startTime:(id)a5 failOnUnrecognizedExperiment:(BOOL)a6 triggerEvent:(unint64_t)a7 taskAttribution:(id)a8;
- (BOOL)_notifyUpdatedShadowEvaluationWithExperimentRecord:(id)a3 context:(id)a4;
- (BOOL)_purgeRolloutLayerIfNecessaryWithRecord:(id)a3 fromAppContainer:(id)a4 paths:(id)a5;
- (BOOL)failOnUnrecognizedExperiment;
- (BOOL)wasDeferred;
- (NSDate)startTime;
- (NSString)description;
- (TRIDeactivateTreatmentTask)initWithCoder:(id)a3;
- (TRITaskAttributing)taskAttribution;
- (id)_asPersistedTask;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (id)trialSystemTelemetry;
- (int)retryCount;
- (int)taskType;
- (unint64_t)requiredCapabilities;
- (unint64_t)triggerEvent;
- (void)encodeWithCoder:(id)a3;
- (void)setFailOnUnrecognizedExperiment:(BOOL)a3;
- (void)setRetryCount:(int)a3;
- (void)setStartTime:(id)a3;
- (void)setTaskAttribution:(id)a3;
- (void)setTriggerEvent:(unint64_t)a3;
- (void)setWasDeferred:(BOOL)a3;
@end

@implementation TRIDeactivateTreatmentTask

- (int)taskType
{
  return 2;
}

+ (id)taskWithExperimentId:(id)a3 deploymentId:(int)a4 startTime:(id)a5 failOnUnrecognizedExperiment:(BOOL)a6 triggerEvent:(unint64_t)a7 taskAttribution:(id)a8
{
  BOOL v9 = a6;
  uint64_t v11 = *(void *)&a4;
  v13 = (objc_class *)MEMORY[0x1E4FB00F8];
  id v14 = a8;
  id v15 = a5;
  id v16 = a3;
  v17 = (void *)[[v13 alloc] initWithExperimentId:v16 deploymentId:v11];

  v18 = [(TRIExperimentBaseTask *)[TRIDeactivateTreatmentTask alloc] initWithExperiment:v17];
  [(TRIDeactivateTreatmentTask *)v18 setStartTime:v15];

  [(TRIDeactivateTreatmentTask *)v18 setFailOnUnrecognizedExperiment:v9];
  [(TRIDeactivateTreatmentTask *)v18 setRetryCount:0];
  [(TRIDeactivateTreatmentTask *)v18 setTriggerEvent:a7];
  [(TRIDeactivateTreatmentTask *)v18 setTaskAttribution:v14];

  return v18;
}

+ (id)taskWithExperimentId:(id)a3 deploymentId:(int)a4 failOnUnrecognizedExperiment:(BOOL)a5 triggerEvent:(unint64_t)a6 taskAttribution:(id)a7
{
  return (id)[a1 taskWithExperimentId:a3 deploymentId:*(void *)&a4 startTime:0 failOnUnrecognizedExperiment:a5 triggerEvent:a6 taskAttribution:a7];
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v231 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v195 = a4;
  uint64_t v6 = objc_opt_new();
  v210 = v5;
  v199 = +[TRIExperimentPostLaunchRecorder recorderFromContext:v5];
  v7 = [v5 experimentDatabase];
  v8 = [(TRIExperimentBaseTask *)self experiment];
  BOOL v9 = [v8 experimentId];
  v224[0] = MEMORY[0x1E4F143A8];
  v224[1] = 3221225472;
  v224[2] = __60__TRIDeactivateTreatmentTask_runUsingContext_withTaskQueue___block_invoke_2;
  v224[3] = &unk_1E6BB9310;
  v224[4] = self;
  id v196 = (id)v6;
  id v225 = v196;
  LOBYTE(v6) = [v7 enumerateExperimentRecordsMatchingExperimentId:v9 block:v224];

  if ((v6 & 1) == 0)
  {
    v156 = [(TRIExperimentBaseTask *)self experiment];
    v157 = [v156 experimentId];
    v158 = [(TRIExperimentBaseTask *)self experiment];
    v159 = +[TRIExperimentDeploymentTreatment treatmentTripleWithExperimentId:deploymentId:treatmentId:](TRIExperimentDeploymentTreatment, "treatmentTripleWithExperimentId:deploymentId:treatmentId:", v157, [v158 deploymentId], @"unspecified-or-default-treatment");

    v160 = +[TRIExperimentPostLaunchEvent failureEventWithEventType:9 treatmentTriple:v159 failureReason:@"database-failure"];
    if (!v160)
    {
      v192 = [MEMORY[0x1E4F28B00] currentHandler];
      [v192 handleFailureInMethod:a2, self, @"TRIDeactivateTreatmentTask.m", 138, @"Expression was unexpectedly nil/false: %@", @"[TRIExperimentPostLaunchEvent failureEventWithEventType:TRIInternalExperimentAllocationStatusTypeTreatmentDeactivationFailure treatmentTriple:triple failureReason:kDeactivateFailureReasonDatabaseFailure]" object file lineNumber description];
    }
    [v199 recordEvent:v160];
    v161 = +[TRITaskRunResult resultWithRunStatus:3 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];

    goto LABEL_157;
  }

  if (![v196 count])
  {
    BOOL v162 = [(TRIDeactivateTreatmentTask *)self failOnUnrecognizedExperiment];
    v163 = TRILogCategory_Server();
    v164 = v163;
    if (v162)
    {
      if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
      {
        v190 = [(TRIExperimentBaseTask *)self experiment];
        v191 = [v190 experimentId];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v191;
        _os_log_error_impl(&dword_1DA291000, v164, OS_LOG_TYPE_ERROR, "cannot deactivate experiment %{public}@: experiment not found in database", buf, 0xCu);
      }
      v165 = [(TRIExperimentBaseTask *)self experiment];
      v166 = [v165 experimentId];
      v167 = [(TRIExperimentBaseTask *)self experiment];
      v168 = +[TRIExperimentDeploymentTreatment treatmentTripleWithExperimentId:deploymentId:treatmentId:](TRIExperimentDeploymentTreatment, "treatmentTripleWithExperimentId:deploymentId:treatmentId:", v166, [v167 deploymentId], @"unspecified-or-default-treatment");

      v169 = +[TRIExperimentPostLaunchEvent failureEventWithEventType:9 treatmentTriple:v168 failureReason:@"experiment-not-found"];
      if (!v169)
      {
        v193 = [MEMORY[0x1E4F28B00] currentHandler];
        [v193 handleFailureInMethod:a2, self, @"TRIDeactivateTreatmentTask.m", 153, @"Expression was unexpectedly nil/false: %@", @"[TRIExperimentPostLaunchEvent failureEventWithEventType:TRIInternalExperimentAllocationStatusTypeTreatmentDeactivationFailure treatmentTriple:triple failureReason:kDeactivateFailureReasonExperimentNotFound]" object file lineNumber description];
      }
      [v199 recordEvent:v169];
      v161 = +[TRITaskRunResult resultWithRunStatus:3 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
    }
    else
    {
      if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
      {
        v171 = [(TRIExperimentBaseTask *)self experiment];
        v172 = [v171 experimentId];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v172;
        _os_log_impl(&dword_1DA291000, v164, OS_LOG_TYPE_DEFAULT, "Unable to find experiment %{public}@ in database. Completing", buf, 0xCu);
      }
      v161 = +[TRITaskRunResult resultWithRunStatus:2 reportResultToServer:0 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
    }
    goto LABEL_157;
  }
  v198 = objc_opt_new();
  long long v222 = 0u;
  long long v223 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  id obj = v196;
  uint64_t v209 = [obj countByEnumeratingWithState:&v220 objects:v230 count:16];
  if (!v209)
  {

    v149 = 0;
    v201 = 0;
    v203 = 0;
    char v10 = 0;
    uint64_t v170 = 2;
    goto LABEL_153;
  }
  v203 = 0;
  char v10 = 0;
  uint64_t v208 = *(void *)v221;
  v201 = 0;
  unsigned int v211 = 2;
  unsigned int v200 = -1;
  do
  {
    for (uint64_t i = 0; i != v209; ++i)
    {
      if (*(void *)v221 != v208) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v220 + 1) + 8 * i);
      v13 = (void *)MEMORY[0x1E016E7F0]();
      if ([v12 type] == 3) {
        [(TRIExperimentBaseTask *)self logAsRollout:1];
      }
      if ([v12 status] == 1 || objc_msgSend(v12, "status") == 2)
      {
        id v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "type"));
        char v15 = [&unk_1F347B378 containsObject:v14];

        if ((v15 & 1) == 0)
        {
          v25 = TRILogCategory_Server();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v77 = [v12 treatmentId];
            v78 = [v12 experimentDeployment];
            v79 = [v78 shortDesc];
            int v80 = [v12 type];
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v77;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v79;
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v229) = v80;
            _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Cannot deactivate treatment %@ of experiment %{public}@ because the type is %d.", buf, 0x1Cu);
          }
          goto LABEL_21;
        }
        if ([v12 type] == 3)
        {
          id v16 = TRILogCategory_Server();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = [v12 treatmentId];
            v18 = [v12 experimentDeployment];
            v19 = [v18 shortDesc];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v17;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v19;
            _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "Attempting to deactivate treatment %@ of ROLLOUT experiment %{public}@.", buf, 0x16u);
          }
          v20 = [v12 namespaces];
          v21 = [v20 firstObject];

          if (v21)
          {
            v22 = [v210 namespaceDatabase];
            v23 = [v21 name];
            v24 = [v22 dynamicNamespaceRecordWithNamespaceName:v23];

            if (v24)
            {
              v205 = [v24 appContainer];

              goto LABEL_28;
            }
            v75 = TRILogCategory_Server();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
            {
              v88 = [v12 treatmentId];
              v89 = [v12 experimentDeployment];
              v90 = [v89 shortDesc];
              v91 = [v21 name];
              *(_DWORD *)buf = 138412802;
              *(void *)&buf[4] = v88;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v90;
              *(_WORD *)&buf[22] = 2112;
              v229 = v91;
              _os_log_error_impl(&dword_1DA291000, v75, OS_LOG_TYPE_ERROR, "Cannot deactivate treatment %@ of ROLLOUT experiment %{public}@ because associated namespace %@ is not dynamic.", buf, 0x20u);
            }
            int v76 = v211;
            if (v211 == 2) {
              int v76 = 3;
            }
            unsigned int v211 = v76;

LABEL_117:
            char v10 = 1;
            goto LABEL_118;
          }
          v25 = TRILogCategory_Server();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v83 = [v12 treatmentId];
            v84 = [v12 experimentDeployment];
            v85 = [v84 shortDesc];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v83;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v85;
            _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Cannot deactivate treatment %@ of ROLLOUT experiment %{public}@ because the experiment has no namespaces.", buf, 0x16u);
          }
LABEL_21:

          int v26 = v211;
          if (v211 == 2) {
            int v26 = 3;
          }
          unsigned int v211 = v26;
          goto LABEL_117;
        }
        v205 = 0;
LABEL_28:
        if (v203)
        {
          v28 = TRILogCategory_Server();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = [v12 experimentDeployment];
            v30 = [v29 shortDesc];
            v31 = [v12 treatmentId];
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v30;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v203;
            *(_WORD *)&buf[22] = 2112;
            v229 = v31;
            _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, "Same experiment %{public}@ has multiple treatments that can be deactivated.(%@, %@)", buf, 0x20u);
          }
        }
        else
        {
          v203 = [v12 treatmentId];
          v32 = [v12 experimentDeployment];
          unsigned int v200 = [v32 deploymentId];

          v28 = TRIDeploymentEnvironment_EnumDescriptor();
          uint64_t v33 = -[NSObject textFormatNameForValue:](v28, "textFormatNameForValue:", [v12 deploymentEnvironment]);

          v201 = (void *)v33;
        }

        v34 = TRILogCategory_Server();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = [v12 treatmentId];
          v36 = [v12 experimentDeployment];
          v37 = [v36 shortDesc];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v35;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v37;
          _os_log_impl(&dword_1DA291000, v34, OS_LOG_TYPE_DEFAULT, "Deactivating treatment %@ of experiment %{public}@.", buf, 0x16u);
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        LOBYTE(v229) = 1;
        if ([v12 type] == 3)
        {
          v38 = [v210 paths];
          [v38 namespaceDescriptorsRolloutDir];
        }
        else
        {
          v38 = [v210 paths];
          [v38 namespaceDescriptorsExperimentDir];
        v206 = };

        v39 = [v12 namespaces];

        if (v39)
        {
          v40 = [v12 namespaces];
          v217[0] = MEMORY[0x1E4F143A8];
          v217[1] = 3221225472;
          v217[2] = __60__TRIDeactivateTreatmentTask_runUsingContext_withTaskQueue___block_invoke_53;
          v217[3] = &unk_1E6BBB200;
          v219 = buf;
          id v218 = v206;
          [v40 enumerateObjectsUsingBlock:v217];
        }
        if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
          goto LABEL_61;
        }
        v41 = [v12 artifact];
        v42 = [v41 experiment];
        uint64_t v43 = [v42 projectId];

        v44 = [v210 paths];
        v45 = +[TRILogTreatmentProvider providerWithProjectId:v43 paths:v44];

        if (v45)
        {
          v46 = [v12 treatmentId];

          if (v46)
          {
            v47 = [v12 treatmentId];
            [v45 removeTreatment:v47];
          }
        }
        else
        {
          *(unsigned char *)(*(void *)&buf[8] + 24) = 0;
        }

        if (*(unsigned char *)(*(void *)&buf[8] + 24))
        {
          v48 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "type"));
          char v49 = [&unk_1F347B390 containsObject:v48];

          if ((v49 & 1) == 0)
          {
            v141 = [MEMORY[0x1E4F28B00] currentHandler];
            v142 = [v12 treatmentId];
            v143 = [v12 experimentDeployment];
            v144 = [v143 shortDesc];
            [v141 handleFailureInMethod:a2, self, @"TRIDeactivateTreatmentTask.m", 271, @"Cannot deactivate treatment %@ of experiment %@ because the type is %d.", v142, v144, objc_msgSend(v12, "type") object file lineNumber description];
          }
          v50 = [v12 artifact];
          v51 = [v50 experiment];
          uint64_t v52 = [v51 projectId];

          v53 = [v210 paths];
          v202 = +[TRILogTreatmentProvider providerWithProjectId:v52 paths:v53];

          v54 = [v12 treatmentId];

          if (v54)
          {
            v55 = [v12 treatmentId];
            [v202 removeTreatment:v55];
          }
          v56 = [v210 experimentDatabase];
          v57 = [v12 experimentDeployment];
          [v56 setStatus:3 forExperimentDeployment:v57 usingTransaction:0];

          [(TRIDeactivateTreatmentTask *)self _notifyUpdatedShadowEvaluationWithExperimentRecord:v12 context:v210];
          if ([v12 status] == 1)
          {
            v58 = [v12 treatmentId];

            if (v58)
            {
              v59 = [v210 activationEventDatabase];
              v60 = +[TRIDeactivateTreatmentTask prevTelemetryFieldsFromActivationEventDatabase:v59 deactivatedRecord:v12];

              v61 = +[TRIExperimentPostLaunchEvent deactivationEventWithTriggerEvent:[(TRIDeactivateTreatmentTask *)self triggerEvent] experimentRecord:v12 additionalTelemetry:v60];
              [v199 recordEvent:v61];
            }
            if ([v12 type] == 1
              && ![v12 deploymentEnvironment])
            {
              v62 = [v12 treatmentId];
              if (v62)
              {
                v63 = [v12 namespaces];
                v64 = [v63 firstObject];
                v65 = [v64 name];

                if (v65)
                {
                  v66 = [v210 namespaceDatabase];
                  v67 = [v66 dynamicNamespaceRecordWithNamespaceName:v65];

                  if (v67)
                  {
                    v68 = [v67 appContainer];
                  }
                  else
                  {
                    v68 = 0;
                  }
                }
                else
                {
                  v68 = 0;
                }
                v92 = +[TRIContentTracker contentIdentifierForTreatmentArtifactWithTreatmentId:v62 container:v68];
                v93 = [v210 contentTracker];
                char v94 = [v93 dropRefWithContentIdentifier:v92];

                if ((v94 & 1) == 0)
                {
                  v95 = TRILogCategory_Server();
                  if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
                  {
                    v140 = [v12 treatmentId];
                    *(_DWORD *)v226 = 138412290;
                    *(void *)&v226[4] = v140;
                    _os_log_error_impl(&dword_1DA291000, v95, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for treatment %@.", v226, 0xCu);
                  }
                }
              }
              else
              {
                v68 = TRILogCategory_Server();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  v86 = [v12 experimentDeployment];
                  v87 = [v86 shortDesc];
                  *(_DWORD *)v226 = 138543362;
                  *(void *)&v226[4] = v87;
                  _os_log_error_impl(&dword_1DA291000, v68, OS_LOG_TYPE_ERROR, "Can't drop reference when deactivating experiment %{public}@; no treatmentId available.",
                    v226,
                    0xCu);
                }
              }
            }
            v96 = [v12 experimentDeployment];
            v71 = +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:v96];

            v97 = [v210 contentTracker];
            char v98 = [v97 dropRefWithContentIdentifier:v71];

            if ((v98 & 1) == 0)
            {
              v74 = TRILogCategory_Server();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              {
                v138 = [v12 experimentDeployment];
                v139 = [v138 shortDesc];
                *(_DWORD *)v226 = 138543362;
                *(void *)&v226[4] = v139;
                _os_log_error_impl(&dword_1DA291000, v74, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for experiment %{public}@.", v226, 0xCu);
              }
LABEL_84:
            }
          }
          else if ([v12 status] == 2)
          {
            v69 = [v12 treatmentId];

            if (v69)
            {
              v70 = [v210 activationEventDatabase];
              v71 = +[TRIDeactivateTreatmentTask prevTelemetryFieldsFromActivationEventDatabase:v70 deactivatedRecord:v12];

              unint64_t v72 = [(TRIDeactivateTreatmentTask *)self triggerEvent];
              v73 = [v210 experimentHistoryDatabase];
              v74 = +[TRIExperimentPostLaunchEvent obsoletionOrDeactivationEventWithTriggerEvent:v72 previousStateProvider:v73 experimentRecord:v12 additionalTelemetry:v71];

              [v199 recordEvent:v74];
              goto LABEL_84;
            }
          }
          v99 = [v210 paths];
          BOOL v100 = [(TRIDeactivateTreatmentTask *)self _purgeRolloutLayerIfNecessaryWithRecord:v12 fromAppContainer:v205 paths:v99];

          if (v100)
          {
            if (_os_feature_enabled_impl())
            {
              *(void *)v226 = 0;
              *(void *)&v226[8] = v226;
              *(void *)&v226[16] = 0x2020000000;
              char v227 = 0;
              v101 = [v210 experimentDatabase];
              v214[0] = MEMORY[0x1E4F143A8];
              v214[1] = 3221225472;
              v214[2] = __60__TRIDeactivateTreatmentTask_runUsingContext_withTaskQueue___block_invoke_66;
              v214[3] = &unk_1E6BBB228;
              id v215 = v210;
              v216 = v226;
              [v101 writeTransactionWithFailableBlock:v214];

              if (!*(unsigned char *)(*(void *)&v226[8] + 24))
              {
                if (_os_feature_enabled_impl())
                {
                  v102 = TRILogCategory_Server();
                  if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)v213 = 0;
                    _os_log_error_impl(&dword_1DA291000, v102, OS_LOG_TYPE_ERROR, "Unable to update the factor providers for experiment deactivation.", v213, 2u);
                  }
                  unsigned int v211 = 3;
                }
                else
                {
                  v102 = TRILogCategory_Server();
                  if (os_log_type_enabled(v102, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)v213 = 0;
                    _os_log_fault_impl(&dword_1DA291000, v102, OS_LOG_TYPE_FAULT, "Unable to update the factor providers for experiment deactivation.", v213, 2u);
                  }
                }
              }
              _Block_object_dispose(v226, 8);
            }
            v104 = TRILogCategory_Server();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
            {
              v135 = [v12 experimentDeployment];
              v136 = [v135 shortDesc];
              v137 = [v12 treatmentId];
              *(_DWORD *)v226 = 138543618;
              *(void *)&v226[4] = v136;
              *(_WORD *)&v226[12] = 2112;
              *(void *)&v226[14] = v137;
              _os_log_debug_impl(&dword_1DA291000, v104, OS_LOG_TYPE_DEBUG, "Experiment %{public}@ with treatment %@ deactivated.", v226, 0x16u);
            }
            if (![v12 deploymentEnvironment])
            {
              v105 = TRILogCategory_Server();
              if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
              {
                v106 = [v12 treatmentId];
                v107 = [v12 experimentDeployment];
                v108 = [v107 shortDesc];
                *(_DWORD *)v226 = 138412546;
                *(void *)&v226[4] = v106;
                *(_WORD *)&v226[12] = 2114;
                *(void *)&v226[14] = v108;
                _os_log_impl(&dword_1DA291000, v105, OS_LOG_TYPE_DEFAULT, "Notify about updates to namespaces in treatment %@ of experiment %{public}@ (deactivated treatment).", v226, 0x16u);
              }
              v109 = [v12 namespaces];
              v212[0] = MEMORY[0x1E4F143A8];
              v212[1] = 3221225472;
              v212[2] = __60__TRIDeactivateTreatmentTask_runUsingContext_withTaskQueue___block_invoke_70;
              v212[3] = &unk_1E6BBB250;
              v212[4] = v12;
              [v109 enumerateObjectsUsingBlock:v212];
            }
            v110 = [v12 artifact];
            v111 = [v110 experiment];
            int v112 = [v111 hasShadowEvaluation];

            if (v112)
            {
              v113 = [v12 artifact];
              v114 = [v113 experiment];
              v115 = [v114 shadowEvaluation];
              if ([v115 hasClientBackgroundMlTask])
              {
                v116 = [v12 artifact];
                v117 = [v116 experiment];
                v118 = [v117 shadowEvaluation];
                v119 = [v118 clientBackgroundMlTask];
                int v197 = [v119 hasTaskId];

                if (v197)
                {
                  v120 = [v12 artifact];
                  v121 = [v120 experiment];
                  v122 = [v121 shadowEvaluation];
                  v123 = [v122 clientBackgroundMlTask];
                  v124 = [v123 taskId];
                  v125 = [(TRIExperimentBaseTask *)self experiment];
                  +[TRILighthouseBitacoraHandler emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:", v124, [v125 deploymentId], 2, v211 == 2);

                  goto LABEL_113;
                }
              }
              else
              {
              }
              v126 = [v12 artifact];
              v127 = [v126 experiment];
              v128 = [v127 shadowEvaluation];
              v129 = [v128 mlRuntime];
              int v130 = [v129 hasEvaluationId];

              if (v130)
              {
                v120 = [v12 artifact];
                v121 = [v120 experiment];
                v122 = [v121 experimentId];
                v123 = [(TRIExperimentBaseTask *)self experiment];
                +[TRILighthouseBitacoraHandler emitShadowEvaluationEventWithExperimentId:deploymentId:treatmentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitShadowEvaluationEventWithExperimentId:deploymentId:treatmentId:eventType:succeeded:", v122, [v123 deploymentId], v203, 2, v211 == 2);
LABEL_113:
              }
            }
            v131 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)(int)(60 * arc4random_uniform(0x1Eu))];
            v132 = [(TRIExperimentBaseTask *)self experiment];
            v133 = [v132 experimentId];
            v134 = +[TRIUnsubscribeChannelTask taskWithExperimentId:v133 startTime:v131];

            [v198 addObject:v134];
          }
          else
          {
            int v103 = v211;
            if (v211 == 2) {
              int v103 = 3;
            }
            unsigned int v211 = v103;
          }
        }
        else
        {
LABEL_61:
          unsigned int v211 = 1;
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_117;
      }
      v27 = TRILogCategory_Server();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v81 = [(TRIExperimentBaseTask *)self experiment];
        v82 = [v81 experimentId];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v82;
        _os_log_debug_impl(&dword_1DA291000, v27, OS_LOG_TYPE_DEBUG, "Experiment %{public}@ is already deactivated, nothing to do.", buf, 0xCu);
      }
LABEL_118:
    }
    uint64_t v209 = [obj countByEnumeratingWithState:&v220 objects:v230 count:16];
  }
  while (v209);

  if (v203)
  {
    v145 = [v210 activationEventDatabase];
    v146 = [(TRIExperimentBaseTask *)self experiment];
    v147 = [v146 experimentId];
    v148 = [v145 activationEventRecordWithParentId:v147 factorPackSetId:v203 deploymentId:v200];

    if (v148)
    {
      v149 = objc_opt_new();
      v150 = [v148 osBuild];
      [v149 setPrevOsBuild:v150];

      v151 = NSString;
      v152 = [v148 languageCode];
      v153 = [v148 regionCode];
      if (v153)
      {
        v154 = [v148 regionCode];
        v155 = [v151 stringWithFormat:@"%@-%@", v152, v154];
      }
      else
      {
        v155 = [v151 stringWithFormat:@"%@-%@", v152, &stru_1F3455898];
      }

      [v149 setPrevBcp47DeviceLocale:v155];
      v175 = [v148 carrierBundleIdentifier];
      [v149 setPrevCarrierBundleIdentifier:v175];

      v176 = [v148 carrierCountryIsoCode];
      [v149 setPrevCarrierCountryIsoCode:v176];

      v177 = [v149 ensureExperimentFields];
      [v177 setClientTreatmentId:v203];

      if (v201) {
        [v149 setClientDeploymentEnv:v201];
      }
      v178 = [v210 activationEventDatabase];
      v179 = [(TRIExperimentBaseTask *)self experiment];
      v180 = [v179 experimentId];
      uint64_t v181 = [v178 deleteRecordWithParentId:v180 factorPackSetId:v203 deploymentId:v200];

      if (!v181)
      {
        v182 = TRILogCategory_Server();
        if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v203;
          _os_log_error_impl(&dword_1DA291000, v182, OS_LOG_TYPE_ERROR, "Unable to delete row from treatments db for treatment %@.", buf, 0xCu);
        }
      }
    }
    else
    {
      v155 = TRILogCategory_Server();
      if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
      {
        v173 = [(TRIExperimentBaseTask *)self experiment];
        v174 = [v173 experimentId];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v174;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v203;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v229) = v200;
        _os_log_impl(&dword_1DA291000, v155, OS_LOG_TYPE_DEFAULT, "Unable to retrieve activation event for experiment id %{public}@, treatment id %@, deployment id %ul", buf, 0x1Cu);
      }
      v149 = 0;
    }

    if (v200 != -1)
    {
      v183 = objc_msgSend(NSNumber, "numberWithInt:");
      v184 = [v183 stringValue];
      [v149 setClientDeploymentId:v184];
    }
    v185 = (void *)MEMORY[0x1E4FB05A8];
    v186 = +[TRIDeactivationTriggerEventString categoricalValueForTriggerEvent:self->_triggerEvent];
    v187 = [v185 metricWithName:@"trigger_event" categoricalValue:v186];
    [(TRIExperimentBaseTask *)self addMetric:v187];

    if (v149) {
      [(TRIExperimentBaseTask *)self mergeTelemetry:v149];
    }
  }
  else
  {
    v149 = 0;
    v203 = 0;
  }
  uint64_t v170 = v211;
LABEL_153:
  if (v198) {
    v188 = v198;
  }
  else {
    v188 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v161 = +[TRITaskRunResult resultWithRunStatus:v170 reportResultToServer:v10 & 1 nextTasks:v188 earliestRetryDate:0];

LABEL_157:
  return v161;
}

void __60__TRIDeactivateTreatmentTask_runUsingContext_withTaskQueue___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [*(id *)(a1 + 32) experiment];
  if ([v3 deploymentId] == -1)
  {

    goto LABEL_5;
  }
  v4 = [*(id *)(a1 + 32) experiment];
  int v5 = [v4 deploymentId];
  uint64_t v6 = [v8 experimentDeployment];
  int v7 = [v6 deploymentId];

  if (v5 == v7) {
LABEL_5:
  }
    [*(id *)(a1 + 40) addObject:v8];
}

void __60__TRIDeactivateTreatmentTask_runUsingContext_withTaskQueue___block_invoke_53(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4FB01A0];
  id v7 = [a2 name];
  char v4 = [v3 removeDescriptorWithNamespaceName:v7 fromDirectory:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24)) {
    char v6 = v4;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)(v5 + 24) = v6;
}

uint64_t __60__TRIDeactivateTreatmentTask_runUsingContext_withTaskQueue___block_invoke_66(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [TRINamespaceResolverStorage alloc];
  uint64_t v5 = [*(id *)(a1 + 32) paths];
  char v6 = [(TRINamespaceResolverStorage *)v4 initWithPaths:v5];

  LOBYTE(v5) = [(TRINamespaceResolverStorage *)v6 overwriteActiveFactorProvidersUsingTransaction:v3 fromContext:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v5;
  LODWORD(a1) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];

  if (a1) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = v7;
  }
  return *v9;
}

void __60__TRIDeactivateTreatmentTask_runUsingContext_withTaskQueue___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 name];
    char v6 = [*(id *)(a1 + 32) treatmentId];
    id v7 = [*(id *)(a1 + 32) experimentDeployment];
    id v8 = [v7 shortDesc];
    int v11 = 138543874;
    v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Notify about updates to namespace %{public}@ (deactivate treatment %@ of experiment %{public}@.", (uint8_t *)&v11, 0x20u);
  }
  BOOL v9 = (void *)MEMORY[0x1E4FB01E8];
  char v10 = [v3 name];
  [v9 notifyUpdateForNamespaceName:v10];
}

+ (id)prevTelemetryFieldsFromActivationEventDatabase:(id)a3 deactivatedRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  id v8 = [v6 treatmentId];

  if (v8)
  {
    BOOL v9 = [v6 experimentDeployment];
    char v10 = [v9 experimentId];
    int v11 = [v6 treatmentId];
    v12 = [v6 experimentDeployment];
    __int16 v13 = objc_msgSend(v5, "activationEventRecordWithParentId:factorPackSetId:deploymentId:", v10, v11, objc_msgSend(v12, "deploymentId"));

    if (v13)
    {
      id v14 = [v13 osBuild];
      [v7 setPrevOsBuild:v14];

      __int16 v15 = NSString;
      id v16 = [v13 languageCode];
      uint64_t v17 = [v13 regionCode];
      if (v17)
      {
        v18 = [v13 regionCode];
        v19 = [v15 stringWithFormat:@"%@-%@", v16, v18];
      }
      else
      {
        v19 = [v15 stringWithFormat:@"%@-%@", v16, &stru_1F3455898];
      }

      [v7 setPrevBcp47DeviceLocale:v19];
      v22 = [v13 carrierBundleIdentifier];
      [v7 setPrevCarrierBundleIdentifier:v22];

      v23 = [v13 carrierCountryIsoCode];
      [v7 setPrevCarrierCountryIsoCode:v23];

      id v24 = v7;
    }
    else
    {
      id v21 = v7;
    }
  }
  else
  {
    id v20 = v7;
  }

  return v7;
}

- (BOOL)_notifyUpdatedShadowEvaluationWithExperimentRecord:(id)a3 context:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E016E7F0]();
  id v8 = [v5 artifact];
  BOOL v9 = [v8 experiment];

  if (![v9 hasShadowEvaluation]) {
    goto LABEL_11;
  }
  char v10 = [v9 shadowEvaluation];
  char v11 = [v10 hasClientBackgroundMlTask];

  if (v11) {
    goto LABEL_11;
  }
  v12 = [v9 shadowEvaluation];
  int v13 = [v12 typeOneOfCase];

  id v14 = TRILogCategory_Server();
  __int16 v15 = v14;
  if (v13 != 1)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v31 = [v5 experimentDeployment];
      v32 = [v31 shortDesc];
      int v33 = 138543362;
      v34 = v32;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Don't know how to handle shadow evaluation on experiment deployment %{public}@ with unspecified type.", (uint8_t *)&v33, 0xCu);
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v5 experimentDeployment];
    uint64_t v17 = [v16 shortDesc];
    int v33 = 138543362;
    v34 = v17;
    _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "Notifying MLRuntime of deactivated shadow evaluation for experiment deployment %{public}@.", (uint8_t *)&v33, 0xCu);
  }
  id v18 = objc_alloc(MEMORY[0x1E4FB00E8]);
  v19 = [v9 shadowEvaluation];
  id v20 = [v19 mlRuntime];
  id v21 = [v20 evaluationId];
  v22 = objc_opt_new();
  v23 = (void *)[v18 initWithType:2 evaluationId:v21 date:v22 evalState:0];

  id v24 = objc_alloc(MEMORY[0x1E4FB0190]);
  v25 = [v9 shadowEvaluation];
  uint64_t v26 = [v25 mlRuntime];
  v27 = (void *)[v24 initWithEvaluation:v26 status:v23];

  v28 = [v6 evaluationHistoryDatabase];
  LOBYTE(v26) = [v28 addRecord:v27 usingTransaction:0];

  if (v26)
  {
LABEL_11:
    BOOL v29 = 1;
    goto LABEL_12;
  }
  BOOL v29 = 0;
LABEL_12:

  return v29;
}

- (BOOL)_purgeRolloutLayerIfNecessaryWithRecord:(id)a3 fromAppContainer:(id)a4 paths:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 type] == 3 && !objc_msgSend(v9, "deploymentEnvironment"))
  {
    if (!v10)
    {
      id v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v28 = [v9 experimentDeployment];
        BOOL v29 = [v28 shortDesc];
        v30 = [v9 treatmentId];
        *(_DWORD *)buf = 138543618;
        os_log_t v40 = v29;
        __int16 v41 = 2112;
        v42 = v30;
        _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Unexpected nil app container for deactivation of ROLLOUT experiment %{public}@ treatment %@", buf, 0x16u);
      }
      BOOL v12 = 0;
      goto LABEL_37;
    }
    id v14 = [v11 pathsForContainer:v10 asClientProcess:0];
    BOOL v12 = v14 == 0;
    if (!v14)
    {
      id v20 = TRILogCategory_Server();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [v10 identifier];
        *(_DWORD *)buf = 138543362;
        os_log_t v40 = v21;
        _os_log_impl(&dword_1DA291000, v20, OS_LOG_TYPE_DEFAULT, "Not purging dynamic namespace for missing app container: %{public}@", buf, 0xCu);
      }
      goto LABEL_37;
    }
    __int16 v15 = [v9 namespaces];
    id v16 = [v15 firstObject];
    uint64_t v17 = [v16 name];

    if (!v17)
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2, self, @"TRIDeactivateTreatmentTask.m", 547, @"Invalid parameter not satisfying: %@", @"firstNamespaceName" object file lineNumber description];
    }
    int v18 = _os_feature_enabled_impl();
    if (v18)
    {
      if ((_os_feature_enabled_impl() & 1) == 0)
      {

LABEL_36:
        BOOL v12 = 1;
LABEL_37:

        goto LABEL_4;
      }
      LOBYTE(v19) = 1;
    }
    else
    {
      v22 = [[TRIClientTreatmentStorage alloc] initWithPaths:v14];
      BOOL v19 = [(TRIClientTreatmentStorage *)v22 removeTreatmentFromLayer:2 withNamespaceName:v17 upgradeNCVs:0];
      if (!v19)
      {
        v23 = TRILogCategory_Server();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uint64_t v35 = [v9 experimentDeployment];
          os_log_t loga = [v35 shortDesc];
          int v33 = [v9 treatmentId];
          *(_DWORD *)buf = 138543874;
          os_log_t v40 = loga;
          __int16 v41 = 2112;
          v42 = v33;
          __int16 v43 = 2114;
          v44 = v17;
          _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "While deactivating ROLLOUT experiment %{public}@ treatment %@, failed to remove rollout layer for namespace %{public}@.", buf, 0x20u);
        }
      }

      if ((_os_feature_enabled_impl() & 1) == 0)
      {

        if (!v19) {
          goto LABEL_37;
        }
        goto LABEL_36;
      }
    }
    id v24 = [[TRIFBClientTreatmentStorage alloc] initWithPaths:v14];
    BOOL v25 = [(TRIFBClientTreatmentStorage *)v24 removeTreatmentFromLayer:2 withNamespaceName:v17 upgradeNCVs:0];
    if (v25)
    {
LABEL_32:
      if (v18) {
        char v27 = v25;
      }
      else {
        char v27 = v19;
      }

      if ((v27 & 1) == 0) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
    log = TRILogCategory_Server();
    BOOL v26 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v26) {
        goto LABEL_38;
      }
    }
    else if (v26)
    {
LABEL_38:
      v34 = [v9 experimentDeployment];
      v36 = [v34 shortDesc];
      v32 = [v9 treatmentId];
      *(_DWORD *)buf = 138543874;
      os_log_t v40 = v36;
      __int16 v41 = 2112;
      v42 = v32;
      __int16 v43 = 2114;
      v44 = v17;
      _os_log_error_impl(&dword_1DA291000, log, OS_LOG_TYPE_ERROR, "From flatbuffers, while deactivating ROLLOUT experiment %{public}@ treatment %@, failed to remove rollout layer for namespace %{public}@", buf, 0x20u);
    }
    goto LABEL_32;
  }
  BOOL v12 = 1;
LABEL_4:

  return v12;
}

- (id)_asPersistedTask
{
  id v3 = objc_opt_new();
  char v4 = [(TRIExperimentBaseTask *)self experiment];
  id v5 = [v4 experimentId];
  [v3 setExperimentId:v5];

  id v6 = [(TRIExperimentBaseTask *)self experiment];
  objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v6, "deploymentId"));

  objc_msgSend(v3, "setFailOnUnrecognizedExperiment:", -[TRIDeactivateTreatmentTask failOnUnrecognizedExperiment](self, "failOnUnrecognizedExperiment"));
  objc_msgSend(v3, "setRetryCount:", -[TRIDeactivateTreatmentTask retryCount](self, "retryCount"));
  id v7 = [(TRIDeactivateTreatmentTask *)self startTime];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4FB05F0]);
    id v9 = [(TRIDeactivateTreatmentTask *)self startTime];
    id v10 = (void *)[v8 initWithDate:v9];
    [v3 setStartTimestamp:v10];
  }
  taskAttribution = self->_taskAttribution;
  if (taskAttribution)
  {
    BOOL v12 = [(TRITaskAttributing *)taskAttribution asPersistedTaskAttribution];
    [v3 setTaskAttribution:v12];
  }
  unint64_t triggerEvent = self->_triggerEvent;
  if (triggerEvent <= 0x19 && ((0x3FFDFFFu >> triggerEvent) & 1) != 0) {
    [v3 setTriggerEvent:dword_1DA403140[triggerEvent]];
  }
  return v3;
}

- (id)serialize
{
  char v4 = [(TRIDeactivateTreatmentTask *)self _asPersistedTask];
  id v5 = [v4 data];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIDeactivateTreatmentTask.m", 697, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v30 = 0;
  id v3 = +[TRIPBMessage parseFromData:a3 error:&v30];
  id v4 = v30;
  if (v3)
  {
    if ([v3 hasExperimentId])
    {
      id v5 = [v3 experimentId];
      uint64_t v6 = [v5 length];

      if (v6)
      {
        if ([v3 hasFailOnUnrecognizedExperiment]) {
          uint64_t v7 = [v3 failOnUnrecognizedExperiment];
        }
        else {
          uint64_t v7 = 0;
        }
        if ([v3 hasDeploymentId]) {
          uint64_t v17 = [v3 deploymentId];
        }
        else {
          uint64_t v17 = 0xFFFFFFFFLL;
        }
        if ([v3 hasTriggerEvent]
          && (unsigned int v18 = [v3 triggerEvent] - 2, v18 <= 0x17))
        {
          uint64_t v19 = qword_1DA4031A8[v18];
        }
        else
        {
          uint64_t v19 = 0;
        }
        if ([v3 hasTaskAttribution])
        {
          id v20 = [v3 taskAttribution];
          id v8 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v20];

          if (!v8)
          {
            id v8 = TRILogCategory_Server();
            if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
              goto LABEL_27;
            }
            *(_WORD *)buf = 0;
            id v9 = "invalid de-serialized TRITaskAttribution pb message";
            id v10 = v8;
            uint32_t v11 = 2;
            goto LABEL_8;
          }
        }
        else
        {
          id v8 = 0;
        }
        v23 = objc_opt_class();
        id v24 = [v3 experimentId];
        if ([v3 hasStartTimestamp])
        {
          BOOL v25 = [v3 startTimestamp];
          BOOL v26 = [v25 date];
          id v21 = [v23 taskWithExperimentId:v24 deploymentId:v17 startTime:v26 failOnUnrecognizedExperiment:v7 triggerEvent:v19 taskAttribution:v8];
        }
        else
        {
          id v21 = [v23 taskWithExperimentId:v24 deploymentId:v17 startTime:0 failOnUnrecognizedExperiment:v7 triggerEvent:v19 taskAttribution:v8];
        }

        if ([v3 hasRetryCount]) {
          uint64_t v27 = [v3 retryCount];
        }
        else {
          uint64_t v27 = 0;
        }
        [v21 setRetryCount:v27];
        goto LABEL_28;
      }
      id v8 = TRILogCategory_Server();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      id v16 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138412290;
      id v32 = v14;
      __int16 v15 = "Cannot decode message of type %@ with field of length 0: experimentId";
    }
    else
    {
      BOOL v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v28 = (objc_class *)objc_opt_class();
        BOOL v29 = NSStringFromClass(v28);
        *(_DWORD *)buf = 138412290;
        id v32 = v29;
        _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);
      }
      id v8 = TRILogCategory_Server();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      int v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138412290;
      id v32 = v14;
      __int16 v15 = "Cannot decode message of type %@ with missing field: experimentId";
    }
    _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);

    goto LABEL_27;
  }
  id v8 = TRILogCategory_Server();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v32 = v4;
    id v9 = "Unable to parse buffer as TRIDeactivateTreatmentPersistedTask: %{public}@";
    id v10 = v8;
    uint32_t v11 = 12;
LABEL_8:
    _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
  }
LABEL_27:
  id v21 = 0;
LABEL_28:

  return v21;
}

- (unint64_t)requiredCapabilities
{
  v3.receiver = self;
  v3.super_class = (Class)TRIDeactivateTreatmentTask;
  return [(TRIBaseTask *)&v3 requiredCapabilities];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(TRIExperimentBaseTask *)self experiment];
  uint64_t v6 = [v5 experimentId];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%@,r:%d>", v4, v6, -[TRIDeactivateTreatmentTask retryCount](self, "retryCount")];

  return (NSString *)v7;
}

- (id)trialSystemTelemetry
{
  v8.receiver = self;
  v8.super_class = (Class)TRIDeactivateTreatmentTask;
  objc_super v3 = [(TRIExperimentBaseTask *)&v8 trialSystemTelemetry];
  if (!v3) {
    objc_super v3 = objc_opt_new();
  }
  taskAttribution = self->_taskAttribution;
  if (taskAttribution)
  {
    id v5 = [(TRITaskAttributing *)taskAttribution teamIdentifier];
    [v3 setClientTeamId:v5];

    if (([v3 hasContainerOriginFields] & 1) == 0)
    {
      uint64_t v6 = +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:self->_taskAttribution];
      [v3 mergeFrom:v6];
    }
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIDeactivateTreatmentTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIDeactivateTreatmentTask;
  id v5 = [(TRIDeactivateTreatmentTask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
    if (v6)
    {
      uint64_t v7 = [(id)objc_opt_class() parseFromData:v6];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
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
    [v6 handleFailureInMethod:a2, self, @"TRIDeactivateTreatmentTask.m", 851, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  id v5 = [(TRIDeactivateTreatmentTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
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

- (BOOL)failOnUnrecognizedExperiment
{
  return self->_failOnUnrecognizedExperiment;
}

- (void)setFailOnUnrecognizedExperiment:(BOOL)a3
{
  self->_failOnUnrecognizedExperiment = a3;
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_unint64_t triggerEvent = a3;
}

- (TRITaskAttributing)taskAttribution
{
  return self->_taskAttribution;
}

- (void)setTaskAttribution:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskAttribution, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end