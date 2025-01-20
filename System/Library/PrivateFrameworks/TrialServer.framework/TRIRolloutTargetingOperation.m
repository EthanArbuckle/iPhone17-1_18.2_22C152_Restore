@interface TRIRolloutTargetingOperation
- (BOOL)_targetRolloutDeployment:(id)a3 appendingTelemetryToSupport:(id)a4 reportTelemetryToServer:(BOOL *)a5 factorPackSetIdToActivate:(id *)a6 shouldDisenroll:(BOOL *)a7 error:(id *)a8;
- (BOOL)targetRolloutDeployment:(id)a3 appendingTelemetryToSupport:(id)a4 reportTelemetryToServer:(BOOL *)a5 factorPackSetIdToActivate:(id *)a6 shouldDisenroll:(BOOL *)a7 error:(id *)a8;
- (TRIRolloutDatabase)rolloutDatabase;
- (TRIRolloutTargeting)targeter;
- (TRIRolloutTargetingOperation)initWithRolloutTargeter:(id)a3 rolloutDatabase:(id)a4 context:(id)a5;
- (TRIServerContext)context;
@end

@implementation TRIRolloutTargetingOperation

- (TRIRolloutTargetingOperation)initWithRolloutTargeter:(id)a3 rolloutDatabase:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TRIRolloutTargetingOperation;
  v12 = [(TRIRolloutTargetingOperation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_targeter, a3);
    objc_storeStrong((id *)&v13->_rolloutDatabase, a4);
    objc_storeStrong((id *)&v13->_context, a5);
  }

  return v13;
}

- (BOOL)targetRolloutDeployment:(id)a3 appendingTelemetryToSupport:(id)a4 reportTelemetryToServer:(BOOL *)a5 factorPackSetIdToActivate:(id *)a6 shouldDisenroll:(BOOL *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  v16 = (void *)MEMORY[0x1E016E7F0]();
  BOOL v17 = [(TRIRolloutTargetingOperation *)self _targetRolloutDeployment:v14 appendingTelemetryToSupport:v15 reportTelemetryToServer:a5 factorPackSetIdToActivate:a6 shouldDisenroll:a7 error:a8];
  if (*a8)
  {
    v18 = [*a8 userInfo];
    uint64_t v19 = [v18 objectForKeyedSubscript:@"logMessage"];
    v20 = (void *)v19;
    v21 = @"unknown";
    if (v19) {
      v21 = (__CFString *)v19;
    }
    v22 = v21;

    v23 = [MEMORY[0x1E4FB05A8] metricWithName:@"targeting_error" categoricalValue:v22];

    [v15 addMetric:v23];
  }

  return v17;
}

- (BOOL)_targetRolloutDeployment:(id)a3 appendingTelemetryToSupport:(id)a4 reportTelemetryToServer:(BOOL *)a5 factorPackSetIdToActivate:(id *)a6 shouldDisenroll:(BOOL *)a7 error:(id *)a8
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  BOOL v17 = v16;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_61:
    v73 = [MEMORY[0x1E4F28B00] currentHandler];
    [v73 handleFailureInMethod:a2, self, @"TRIRolloutTargetingOperation.m", 79, @"Invalid parameter not satisfying: %@", @"support != nil" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_62;
  }
  v72 = [MEMORY[0x1E4F28B00] currentHandler];
  [v72 handleFailureInMethod:a2, self, @"TRIRolloutTargetingOperation.m", 78, @"Invalid parameter not satisfying: %@", @"deployment != nil" object file lineNumber description];

  if (!v17) {
    goto LABEL_61;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_62:
  v74 = [MEMORY[0x1E4F28B00] currentHandler];
  [v74 handleFailureInMethod:a2, self, @"TRIRolloutTargetingOperation.m", 80, @"Invalid parameter not satisfying: %@", @"reportTelemetryToServer != nil" object file lineNumber description];

LABEL_4:
  *a5 = 1;
  if (!a6)
  {
    v75 = [MEMORY[0x1E4F28B00] currentHandler];
    [v75 handleFailureInMethod:a2, self, @"TRIRolloutTargetingOperation.m", 82, @"Invalid parameter not satisfying: %@", @"factorPackSetIdToActivate != nil" object file lineNumber description];
  }
  id v18 = *a6;
  *a6 = 0;

  if (!a7)
  {
    v76 = [MEMORY[0x1E4F28B00] currentHandler];
    [v76 handleFailureInMethod:a2, self, @"TRIRolloutTargetingOperation.m", 84, @"Invalid parameter not satisfying: %@", @"shouldDisenroll != NULL" object file lineNumber description];
  }
  *a7 = 0;
  if (!a8)
  {
    v77 = [MEMORY[0x1E4F28B00] currentHandler];
    [v77 handleFailureInMethod:a2, self, @"TRIRolloutTargetingOperation.m", 86, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
  }
  uint64_t v19 = [(TRIRolloutTargetingOperation *)self rolloutDatabase];
  v20 = [v19 recordWithDeployment:v15 usingTransaction:0];

  if (v20)
  {
    v81 = v17;
    SEL v21 = a2;
    v22 = [v20 artifact];
    uint64_t v23 = [v22 rollout];

    v83 = 0;
    v79 = self;
    v24 = [(TRIRolloutTargetingOperation *)self targeter];
    v80 = (void *)v23;
    int v25 = [v24 targetRollout:v23 factorPackSetId:&v83 relatedRampDeployment:0 error:a8];

    BOOL v26 = 0;
    switch(v25)
    {
      case 0:
        goto LABEL_58;
      case 1:
        if (!v83)
        {
          v78 = [MEMORY[0x1E4F28B00] currentHandler];
          [v78 handleFailureInMethod:v21, v79, @"TRIRolloutTargetingOperation.m", 104, @"Invalid parameter not satisfying: %@", @"assignedFactorPackSetId" object file lineNumber description];
        }
        v28 = objc_opt_new();
        v32 = [(__CFString *)v83 ident];
        v33 = loggableFactorPackSetIdFromFactorPackSetId(v32);
        v34 = [v28 ensureRolloutFields];
        [v34 setClientFactorPackSetId:v33];

        if (([(__CFString *)v83 targetingRuleIndex] & 0x80000000) == 0)
        {
          uint64_t v35 = [(__CFString *)v83 targetingRuleIndex];
          v29 = [v28 ensureRolloutFields];
          [v29 setClientTargetingRuleGroupOrdinal:v35];
          goto LABEL_18;
        }
        v36 = v81;
        goto LABEL_19;
      case 2:
      case 3:
        v27 = v83;
        v83 = 0;

        v28 = objc_opt_new();
        v29 = [v28 ensureRolloutFields];
        [v29 setClientFactorPackSetId:@"no-op"];
LABEL_18:
        v36 = v81;

LABEL_19:
        [v36 mergeTelemetry:v28];

        goto LABEL_20;
      case 4:
        BOOL v26 = 1;
        *a7 = 1;
        v53 = objc_opt_new();
        v54 = [v53 ensureRolloutFields];
        [v54 setClientFactorPackSetId:@"disenroll"];

        [v81 mergeTelemetry:v53];
        goto LABEL_57;
      default:
LABEL_20:
        v37 = [v20 activeFactorPackSetId];
        if (v37)
        {

LABEL_23:
          v39 = @"(Retargeting) ";
          goto LABEL_24;
        }
        v38 = [v20 targetedFactorPackSetId];

        if (v38) {
          goto LABEL_23;
        }
        v39 = &stru_1F3455898;
LABEL_24:
        if (v83)
        {
          v40 = TRILogCategory_Server();
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_30;
          }
          v41 = v83;
          v42 = [v15 shortDesc];
          *(_DWORD *)buf = 138543874;
          v85 = v39;
          __int16 v86 = 2114;
          v87 = v41;
          __int16 v88 = 2114;
          v89 = v42;
          v43 = "%{public}@Enrolling in factor pack set id %{public}@ for rollout %{public}@";
          v44 = v40;
          uint32_t v45 = 32;
        }
        else
        {
          *a5 = 0;
          v40 = TRILogCategory_Server();
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_30;
          }
          v42 = [v15 shortDesc];
          *(_DWORD *)buf = 138543618;
          v85 = v39;
          __int16 v86 = 2114;
          v87 = v42;
          v43 = "%{public}@Targeting resulted in the default treatment (non-enrollment) for rollout %{public}@";
          v44 = v40;
          uint32_t v45 = 22;
        }
        _os_log_impl(&dword_1DA291000, v44, OS_LOG_TYPE_DEFAULT, v43, buf, v45);

LABEL_30:
        if (!v83)
        {
          BOOL v26 = 1;
          goto LABEL_58;
        }
        v46 = [v20 targetedFactorPackSetId];

        if (v46)
        {
          v47 = [(__CFString *)v83 ident];
          v48 = [v20 targetedFactorPackSetId];
          int v49 = [v47 isEqualToString:v48];

          v50 = TRILogCategory_Server();
          BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
          if (v49)
          {
            if (v51)
            {
              *(_WORD *)buf = 0;
              v52 = "Retargeting resulted in no change to the targetedFactorPackSetId.";
LABEL_41:
              _os_log_impl(&dword_1DA291000, v50, OS_LOG_TYPE_DEFAULT, v52, buf, 2u);
              goto LABEL_42;
            }
            goto LABEL_42;
          }
          if (v51)
          {
            v60 = [v20 targetedFactorPackSetId];
            *(_DWORD *)buf = 138543618;
            v85 = v60;
            __int16 v86 = 2114;
            v87 = v83;
            v61 = "Retargeting resulted in targetedFactorPackSetId change: %{public}@ --> %{public}@";
LABEL_49:
            _os_log_impl(&dword_1DA291000, v50, OS_LOG_TYPE_DEFAULT, v61, buf, 0x16u);
          }
        }
        else
        {
          v55 = [v20 activeFactorPackSetId];

          if (!v55) {
            goto LABEL_51;
          }
          v56 = [(__CFString *)v83 ident];
          v57 = [v20 activeFactorPackSetId];
          int v58 = [v56 isEqualToString:v57];

          v50 = TRILogCategory_Server();
          BOOL v59 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
          if (v58)
          {
            if (v59)
            {
              *(_WORD *)buf = 0;
              v52 = "Retargeting resulted in no change to the activeFactorPackSetId. Still attempting activation";
              goto LABEL_41;
            }
LABEL_42:

            *a5 = 0;
            goto LABEL_51;
          }
          if (v59)
          {
            v62 = v83;
            v60 = [v20 activeFactorPackSetId];
            *(_DWORD *)buf = 138543618;
            v85 = v62;
            __int16 v86 = 2114;
            v87 = v60;
            v61 = "Retargeting result: targeted %{public}@, previously active: %{public}@";
            goto LABEL_49;
          }
        }

LABEL_51:
        v53 = objc_opt_new();
        v63 = [(TRIRolloutTargetingOperation *)v79 rolloutDatabase];
        v64 = [(__CFString *)v83 ident];
        if (([(__CFString *)v83 targetingRuleIndex] & 0x80000000) != 0)
        {
          char v69 = [v63 targetDeployment:v15 toFactorPackSetId:v64 targetingRuleIndex:0 deallocatedDeployments:v53 usingTransaction:0];

          if (v69) {
            goto LABEL_53;
          }
        }
        else
        {
          v65 = objc_msgSend(NSNumber, "numberWithInt:", -[__CFString targetingRuleIndex](v83, "targetingRuleIndex"));
          char v66 = [v63 targetDeployment:v15 toFactorPackSetId:v64 targetingRuleIndex:v65 deallocatedDeployments:v53 usingTransaction:0];

          if (v66)
          {
LABEL_53:
            v82[0] = MEMORY[0x1E4F143A8];
            v82[1] = 3221225472;
            v82[2] = __157__TRIRolloutTargetingOperation__targetRolloutDeployment_appendingTelemetryToSupport_reportTelemetryToServer_factorPackSetIdToActivate_shouldDisenroll_error___block_invoke;
            v82[3] = &unk_1E6BBD2E8;
            v82[4] = v79;
            [v53 enumerateObjectsUsingBlock:v82];
            v67 = v83;
            id v68 = *a6;
            *a6 = v67;
            BOOL v26 = 1;
            goto LABEL_56;
          }
        }
        v70 = +[TRIRolloutTargeter targetingErrorWithDeployment:v15 errorType:@"failed update database"];
        BOOL v26 = 0;
        id v68 = *a8;
        *a8 = v70;
LABEL_56:

LABEL_57:
LABEL_58:

        BOOL v17 = v81;
        break;
    }
  }
  else
  {
    v30 = +[TRIRolloutTargeter targetingErrorWithDeployment:v15 errorType:@"rollout artifact not found"];
    id v31 = *a8;
    *a8 = v30;

    BOOL v26 = 0;
  }

  return v26;
}

void __157__TRIRolloutTargetingOperation__targetRolloutDeployment_appendingTelemetryToSupport_reportTelemetryToServer_factorPackSetIdToActivate_shouldDisenroll_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = [v3 deployment];
  v4 = [v11 rolloutId];
  v5 = [v3 rampId];
  v6 = [v3 deployment];
  uint64_t v7 = [v6 deploymentId];
  v8 = [v3 targetedFactorPackSetId];
  id v9 = [v3 namespaces];

  LOBYTE(v10) = 1;
  +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:4 forRollout:v4 ramp:v5 deployment:v7 fps:v8 namespaces:v9 telemetryMetric:0 rolloutRecord:0 isBecomingObsolete:v10 context:*(void *)(*(void *)(a1 + 32) + 24)];
}

- (TRIRolloutTargeting)targeter
{
  return self->_targeter;
}

- (TRIRolloutDatabase)rolloutDatabase
{
  return self->_rolloutDatabase;
}

- (TRIServerContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_rolloutDatabase, 0);
  objc_storeStrong((id *)&self->_targeter, 0);
}

@end