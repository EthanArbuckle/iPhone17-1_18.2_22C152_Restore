@interface TRITargetingTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithExperiment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5;
+ (id)taskWithExperiment:(id)a3 taskAttribution:(id)a4;
- (BOOL)_isRolloutV1For1PWithExperimentRecord:(id)a3 context:(id)a4;
- (BOOL)getFactorPackSetId:(id *)a3 forExperiment:(id)a4 treatmentId:(id)a5 error:(id *)a6;
- (BOOL)getTreatment:(id *)a3 forExperiment:(id)a4 isServerSideExperiment:(BOOL)a5 experimentCovariates:(id)a6 paths:(id)a7 experimentEndDate:(id)a8 error:(id *)a9;
- (BOOL)getTreatment:(id *)a3 forExperiment:(id)a4 isServerSideExperiment:(BOOL)a5 systemCovariates:(id)a6 userCovariates:(id)a7 experimentCovariates:(id)a8 experimentEndDate:(id)a9 error:(id *)a10;
- (BOOL)isEqual:(id)a3;
- (BOOL)validateSystemCovariates:(id)a3 experiment:(id)a4 error:(id *)a5;
- (BOOL)wasDeferred;
- (NSArray)dependencies;
- (NSArray)tags;
- (NSString)description;
- (TRIExperimentDeployment)experiment;
- (TRITargetingTask)initWithCoder:(id)a3;
- (TRITargetingTask)initWithExperiment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5;
- (id)_asPersistedTask;
- (id)_targetingErrorWithExperiment:(id)a3 errorType:(id)a4;
- (id)_targetingErrorWithExperiment:(id)a3 errorType:(id)a4 details:(id)a5;
- (id)dimensions;
- (id)metrics;
- (id)runTaskUsingContext:(id)a3 withTaskQueue:(id)a4 systemCovariates:(id)a5 userCovariates:(id)a6 error:(id *)a7;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (id)systemCovariatesWithPaths:(id)a3;
- (id)trialSystemTelemetry;
- (int)retryCount;
- (int)taskType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)runDequeueHandlerUsingContext:(id)a3;
- (void)runEnqueueHandlerUsingContext:(id)a3;
- (void)setRetryCount:(int)a3;
- (void)setWasDeferred:(BOOL)a3;
@end

@implementation TRITargetingTask

- (int)taskType
{
  return 6;
}

+ (id)taskWithExperiment:(id)a3 taskAttribution:(id)a4
{
  return (id)[a1 taskWithExperiment:a3 includeDependencies:1 taskAttribution:a4];
}

+ (id)taskWithExperiment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  v9 = [[TRITargetingTask alloc] initWithExperiment:v8 includeDependencies:v5 taskAttribution:v7];

  return v9;
}

- (TRITargetingTask)initWithExperiment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 99, @"Invalid parameter not satisfying: %@", @"experiment" object file lineNumber description];
  }
  if (([v9 hasDeploymentId] & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 100, @"Invalid parameter not satisfying: %@", @"experiment.hasDeploymentId" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)TRITargetingTask;
  v11 = [(TRITargetingTask *)&v18 init];
  if (v11)
  {
    v12 = [[TRIExperimentTaskSupport alloc] initWithExperimentDeployment:v9];
    support = v11->_support;
    v11->_support = v12;

    v11->_includeDependencies = a4;
    objc_storeStrong((id *)&v11->_taskAttributing, a5);
    v14 = +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:v10];
    [(TRIExperimentTaskSupport *)v11->_support mergeTelemetry:v14];
  }
  return v11;
}

- (TRIExperimentDeployment)experiment
{
  return [(TRIExperimentTaskSupport *)self->_support experimentDeployment];
}

- (NSArray)tags
{
  return (NSArray *)[(TRIExperimentTaskSupport *)self->_support tags];
}

- (NSArray)dependencies
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (self->_includeDependencies)
  {
    v3 = [(TRITargetingTask *)self experiment];
    v4 = +[TRIFetchExperimentTask taskWithExperimentDeployment:v3 taskAttributing:self->_taskAttributing];
    v7[0] = v4;
    BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    BOOL v5 = 0;
  }
  return (NSArray *)v5;
}

- (void)runEnqueueHandlerUsingContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TRITargetingTask *)self experiment];
  id v7 = +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:v5];

  v6 = [v4 contentTracker];

  [v6 addRefWithContentIdentifier:v7];
}

- (void)runDequeueHandlerUsingContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(TRITargetingTask *)self experiment];
  v6 = +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:v5];

  id v7 = [v4 contentTracker];

  LOBYTE(v4) = [v7 dropRefWithContentIdentifier:v6];
  if ((v4 & 1) == 0)
  {
    id v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(TRITargetingTask *)self experiment];
      id v10 = [v9 shortDesc];
      int v11 = 138543362;
      v12 = v10;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for experiment %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (id)systemCovariatesWithPaths:(id)a3
{
  id v3 = a3;
  id v4 = [[TRISystemCovariates alloc] initWithPaths:v3];

  return v4;
}

- (id)_targetingErrorWithExperiment:(id)a3 errorType:(id)a4 details:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 148, @"Invalid parameter not satisfying: %@", @"errorType != nil" object file lineNumber description];
  }
  if (!v9 || ([v9 experimentId], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_super v18 = [NSString stringWithFormat:@"Targeting error: %@", v10];
    if (!v11) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v13 = (void *)v12;
  char v14 = [v9 hasDeploymentId];
  v15 = NSString;
  uint64_t v16 = [v9 experimentId];
  v17 = (void *)v16;
  if (v14) {
    [v15 stringWithFormat:@"Targeting error for experiment %@.%u: %@", v16, objc_msgSend(v9, "deploymentId"), v10];
  }
  else {
  objc_super v18 = [v15 stringWithFormat:@"Targeting error for experiment %@: %@", v16, v10, v33];
  }

  if (v11)
  {
LABEL_8:
    uint64_t v19 = [NSString stringWithFormat:@"%@ -- %@", v18, v11];

    objc_super v18 = (void *)v19;
  }
LABEL_9:
  v34 = v11;
  v20 = TRILogCategory_Server();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v38 = v18;
    _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  v21 = (void *)MEMORY[0x1E4F28C58];
  v35[0] = *MEMORY[0x1E4F28568];
  v22 = [MEMORY[0x1E4F28B50] mainBundle];
  v23 = [v22 localizedStringForKey:v18 value:&stru_1F3455898 table:0];
  v36[0] = v23;
  v35[1] = @"experimentId";
  uint64_t v24 = [v9 experimentId];
  v25 = (void *)v24;
  if (v24) {
    v26 = (__CFString *)v24;
  }
  else {
    v26 = &stru_1F3455898;
  }
  v36[1] = v26;
  v35[2] = @"deploymentId";
  int v27 = [v9 hasDeploymentId];
  if (v27)
  {
    v28 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "deploymentId"));
  }
  else
  {
    v28 = &unk_1F347B558;
  }
  v35[3] = @"logMessage";
  v36[2] = v28;
  v36[3] = v10;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];
  v30 = [v21 errorWithDomain:@"triald" code:1 userInfo:v29];

  if (v27) {
  return v30;
  }
}

- (id)_targetingErrorWithExperiment:(id)a3 errorType:(id)a4
{
  return [(TRITargetingTask *)self _targetingErrorWithExperiment:a3 errorType:a4 details:0];
}

- (BOOL)validateSystemCovariates:(id)a3 experiment:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(v8, "tri_contextValueWithName:", @"OSBuild");
  if (!v10) {
    goto LABEL_8;
  }
  id v11 = objc_msgSend(v8, "tri_contextValueWithName:", @"DeviceModelCode");
  if (!v11) {
    goto LABEL_7;
  }
  uint64_t v12 = objc_msgSend(v8, "tri_contextValueWithName:", @"DeviceClass");
  if (!v12)
  {

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v13 = objc_msgSend(v8, "tri_contextValueWithName:", @"DeviceId");

  if (v13)
  {
    BOOL v14 = 1;
    goto LABEL_11;
  }
LABEL_8:
  v15 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v9 errorType:@"Unable to retrieve context -- no results from mobile gestalt"];
  if (a5) {
    objc_storeStrong(a5, v15);
  }

  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)getTreatment:(id *)a3 forExperiment:(id)a4 isServerSideExperiment:(BOOL)a5 experimentCovariates:(id)a6 paths:(id)a7 experimentEndDate:(id)a8 error:(id *)a9
{
  BOOL v12 = a5;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!a3)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 212, @"Invalid parameter not satisfying: %@", @"treatmentId != nil" object file lineNumber description];
  }
  if (!v16)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 213, @"Invalid parameter not satisfying: %@", @"experiment != nil" object file lineNumber description];
  }
  v20 = [(TRITargetingTask *)self systemCovariatesWithPaths:v18];
  BOOL v21 = [(TRITargetingTask *)self getTreatment:a3 forExperiment:v16 isServerSideExperiment:v12 systemCovariates:v20 userCovariates:0 experimentCovariates:v17 experimentEndDate:v19 error:a9];

  return v21;
}

- (BOOL)getTreatment:(id *)a3 forExperiment:(id)a4 isServerSideExperiment:(BOOL)a5 systemCovariates:(id)a6 userCovariates:(id)a7 experimentCovariates:(id)a8 experimentEndDate:(id)a9 error:(id *)a10
{
  BOOL v13 = a5;
  v84[2] = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  id v18 = a6;
  id v77 = a7;
  id v19 = a8;
  id v78 = a9;
  if (a3)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    v65 = [MEMORY[0x1E4F28B00] currentHandler];
    [v65 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 235, @"Invalid parameter not satisfying: %@", @"treatmentId != nil" object file lineNumber description];

    if (v17)
    {
LABEL_3:
      if (v18) {
        goto LABEL_4;
      }
LABEL_62:
      v67 = [MEMORY[0x1E4F28B00] currentHandler];
      [v67 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 237, @"Invalid parameter not satisfying: %@", @"systemCovariates != nil" object file lineNumber description];

      if (v19) {
        goto LABEL_5;
      }
      goto LABEL_63;
    }
  }
  v66 = [MEMORY[0x1E4F28B00] currentHandler];
  [v66 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 236, @"Invalid parameter not satisfying: %@", @"experiment != nil" object file lineNumber description];

  if (!v18) {
    goto LABEL_62;
  }
LABEL_4:
  if (v19) {
    goto LABEL_5;
  }
LABEL_63:
  v68 = [MEMORY[0x1E4F28B00] currentHandler];
  [v68 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 238, @"Invalid parameter not satisfying: %@", @"experimentCovariates != nil" object file lineNumber description];

LABEL_5:
  context = (void *)MEMORY[0x1E016E7F0]();
  if ([v17 hasExperimentId])
  {
    id v20 = objc_alloc(MEMORY[0x1E4FB00F8]);
    BOOL v21 = [v17 experimentId];
    v75 = objc_msgSend(v20, "initWithExperimentId:deploymentId:", v21, objc_msgSend(v17, "deploymentId"));

    id v22 = *a3;
    *a3 = 0;

    if (v78)
    {
      v23 = objc_opt_new();
      uint64_t v24 = [v78 compare:v23];

      if (v24 == -1)
      {
        v37 = TRILogCategory_Server();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = [v17 experimentId];
          *(_DWORD *)buf = 138543362;
          id v80 = v38;
          _os_log_impl(&dword_1DA291000, v37, OS_LOG_TYPE_INFO, "experiment with id %{public}@ has end date in the past", buf, 0xCu);
        }
        BOOL v35 = 1;
        goto LABEL_58;
      }
    }
    if ([v17 hasAssignment])
    {
      if ([(TRITargetingTask *)self validateSystemCovariates:v18 experiment:v75 error:a10])
      {
        v84[0] = v18;
        v83[0] = @"SystemCovariates";
        v83[1] = @"TempValues";
        v25 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
        v84[1] = v25;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:2];
        v73 = (void *)[v26 mutableCopy];

        if (v77) {
          [v73 setObject:v77 forKeyedSubscript:@"UserCovariates"];
        }
        [v73 setObject:v19 forKeyedSubscript:@"ExperimentCovariates"];
        v74 = [v17 assignment];
        int v27 = [v74 nsexpressionLanguage];
        if ([v27 hasSchemaVersion])
        {
          v28 = [v74 nsexpressionLanguage];
          uint64_t v29 = [v28 schemaVersion];

          if (v29 >= 8)
          {
            v30 = TRILogCategory_Server();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v80) = v29;
              _os_log_impl(&dword_1DA291000, v30, OS_LOG_TYPE_DEFAULT, "Assigning to default treatment because assignment language schema version %u is incompatible.", buf, 8u);
            }

            if (!a10)
            {
              BOOL v35 = 1;
LABEL_57:

              goto LABEL_58;
            }
            v71 = objc_msgSend([NSString alloc], "initWithFormat:", @"Incompatible assignment language schema version %u", v29);
            v31 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v75 errorType:v71];
            id v32 = *a10;
            *a10 = v31;
LABEL_46:
            BOOL v35 = 1;
LABEL_56:

            goto LABEL_57;
          }
        }
        else
        {
        }
        uint64_t v39 = [v74 nsexpressionLanguage];
        if ([v39 hasAssignmentExpression])
        {
          v40 = [v74 nsexpressionLanguage];
          v41 = [v40 assignmentExpression];
          BOOL v72 = [v41 length] == 0;

          if (!v72)
          {
            v42 = [v74 nsexpressionLanguage];
            v71 = [v42 assignmentExpression];

            v43 = (void *)MEMORY[0x1E016E7F0]();
            uint64_t v44 = [MEMORY[0x1E4F28C68] expressionWithFormat:v71];
            v70 = (void *)v44;
            v45 = objc_opt_new();
            int v46 = [v45 validateExpression:v44 outError:a10];

            if (v46)
            {
              v47 = TRILogCategory_Backtrace();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                v48 = [v73 objectForKeyedSubscript:@"SystemCovariates"];
                id v49 = [v48 dictionary];
                v50 = [v73 objectForKeyedSubscript:@"ExperimentCovariates"];
                [v50 dictionary];
                v69 = v48;
                *(_DWORD *)buf = 138412546;
                id v80 = v49;
                v51 = __int16 v81 = 2112;
                v82 = v51;
                _os_log_impl(&dword_1DA291000, v47, OS_LOG_TYPE_DEFAULT, "Using the following covariates for targeting. SystemCovariate: %@ ExperimentCovariates: %@", buf, 0x16u);
              }
              v52 = (void *)MEMORY[0x1E016E7F0]();
              v53 = [v70 expressionValueWithObject:v73 context:0];
              id v54 = *a3;
              *a3 = v53;

              v55 = TRILogCategory_Server();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                id v56 = *a3;
                v57 = [v17 experimentId];
                *(_DWORD *)buf = 138412546;
                id v80 = v56;
                __int16 v81 = 2114;
                v82 = v57;
                _os_log_impl(&dword_1DA291000, v55, OS_LOG_TYPE_DEFAULT, "Targeting treatment %@ for experiment %{public}@.", buf, 0x16u);
              }
              if (![*a3 compare:@"default" options:1])
              {
                id v58 = *a3;
                *a3 = 0;
              }
              if (!*a3 || ([*a3 triIsValidTreatmentId] & 1) != 0)
              {
                BOOL v35 = 1;
LABEL_55:
                id v32 = v70;
                goto LABEL_56;
              }
              v61 = [NSString stringWithFormat:@"invalid treatment id \"%@\"", *a3];
              v62 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v75 errorType:v61];

              if (a10) {
                objc_storeStrong(a10, v62);
              }
              id v63 = *a3;
              *a3 = 0;
            }
            BOOL v35 = 0;
            goto LABEL_55;
          }
        }
        else
        {
        }
        if (!v13)
        {
          v60 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v75 errorType:@"assignment string is missing or empty"];
          if (a10) {
            objc_storeStrong(a10, v60);
          }

          id v32 = 0;
          v71 = 0;
          BOOL v35 = 0;
          goto LABEL_56;
        }
        v59 = TRILogCategory_Server();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA291000, v59, OS_LOG_TYPE_DEFAULT, "Assigning to default treatment because this server-side experiment is not using device-side allocation.", buf, 2u);
        }

        id v32 = 0;
        v71 = 0;
        goto LABEL_46;
      }
    }
    else
    {
      v36 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v75 errorType:@"missing treatment assignment"];
      if (a10) {
        objc_storeStrong(a10, v36);
      }
    }
    BOOL v35 = 0;
LABEL_58:

    goto LABEL_59;
  }
  uint64_t v33 = [(TRITargetingTask *)self experiment];
  v34 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v33 errorType:@"experiment id is missing in experiment definition"];

  if (a10) {
    objc_storeStrong(a10, v34);
  }

  BOOL v35 = 0;
LABEL_59:

  return v35;
}

- (BOOL)getFactorPackSetId:(id *)a3 forExperiment:(id)a4 treatmentId:(id)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  if (a3)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 379, @"Invalid parameter not satisfying: %@", @"factorPackSetId != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
  [v39 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 380, @"Invalid parameter not satisfying: %@", @"experiment != nil" object file lineNumber description];

LABEL_3:
  if (_os_feature_enabled_impl())
  {
    if (v12 && objc_msgSend(v11, "factorPackSetMapping_Count"))
    {
      BOOL v13 = [v11 factorPackSetMapping];
      BOOL v14 = [v13 objectForKeyedSubscript:v12];

      if (v14)
      {
        v15 = TRIValidateFactorPackSetId();
        id v16 = TRILogCategory_Server();
        id v17 = v16;
        if (v15)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = [v11 experimentId];
            *(_DWORD *)buf = 138544130;
            v41 = v18;
            __int16 v42 = 1024;
            *(_DWORD *)v43 = [v11 deploymentId];
            *(_WORD *)&v43[4] = 2112;
            *(void *)&v43[6] = v12;
            __int16 v44 = 2112;
            id v45 = v15;
            _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, "Experiment %{public}@.%u, treatment %@ successfully resolved to factor pack set: %@", buf, 0x26u);
          }
          id v19 = v15;
          id v20 = *a3;
          *a3 = v19;
          BOOL v21 = 1;
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v37 = [v11 experimentId];
            *(_DWORD *)buf = 138413058;
            v41 = v14;
            __int16 v42 = 2114;
            *(void *)v43 = v37;
            *(_WORD *)&v43[8] = 1024;
            *(_DWORD *)&v43[10] = [v11 deploymentId];
            __int16 v44 = 2112;
            id v45 = v12;
            _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Invalid fpsId %@ found for experiment %{public}@.%u, treatment %@.", buf, 0x26u);
          }
          id v31 = objc_alloc(MEMORY[0x1E4FB00F8]);
          id v32 = [v11 experimentId];
          id v20 = (id)objc_msgSend(v31, "initWithExperimentId:deploymentId:", v32, objc_msgSend(v11, "deploymentId"));

          id v33 = *a3;
          *a3 = 0;

          if (a6)
          {
            v34 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v20 errorType:@"Invalid fpsId found for experiment."];
            id v35 = *a6;
            *a6 = v34;
          }
          id v19 = 0;
          BOOL v21 = 0;
        }
      }
      else
      {
        v26 = TRILogCategory_Server();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v36 = [v11 experimentId];
          *(_DWORD *)buf = 138543874;
          v41 = v36;
          __int16 v42 = 1024;
          *(_DWORD *)v43 = [v11 deploymentId];
          *(_WORD *)&v43[4] = 2112;
          *(void *)&v43[6] = v12;
          _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "Could not find fpsId in experiment factor pack set map for experiment %{public}@.%u, treatment %@.", buf, 0x1Cu);
        }
        id v27 = objc_alloc(MEMORY[0x1E4FB00F8]);
        v28 = [v11 experimentId];
        id v19 = (id)objc_msgSend(v27, "initWithExperimentId:deploymentId:", v28, objc_msgSend(v11, "deploymentId"));

        id v29 = *a3;
        *a3 = 0;

        if (!a6)
        {
          BOOL v21 = 0;
          goto LABEL_26;
        }
        v30 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v19 errorType:@"Could not find fpsId in experiment factor pack set map."];
        BOOL v21 = 0;
        id v20 = *a6;
        *a6 = v30;
      }

LABEL_26:
      goto LABEL_15;
    }
    id v22 = TRILogCategory_Server();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [v11 experimentId];
      *(_DWORD *)buf = 138543874;
      v41 = v23;
      __int16 v42 = 1024;
      *(_DWORD *)v43 = [v11 deploymentId];
      *(_WORD *)&v43[4] = 2112;
      *(void *)&v43[6] = v12;
      _os_log_impl(&dword_1DA291000, v22, OS_LOG_TYPE_DEFAULT, "Experiment %{public}@.%u, treatment %@ will not consider using factor pack sets.", buf, 0x1Cu);
    }
  }
  id v24 = *a3;
  *a3 = 0;

  BOOL v21 = 1;
LABEL_15:

  return v21;
}

- (BOOL)_isRolloutV1For1PWithExperimentRecord:(id)a3 context:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 type] == 3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = objc_msgSend(v5, "namespaces", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v12 = [v6 namespaceDatabase];
          BOOL v13 = [v11 name];
          BOOL v14 = [v12 dynamicNamespaceRecordWithNamespaceName:v13];

          if (!v14)
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)runTaskUsingContext:(id)a3 withTaskQueue:(id)a4 systemCovariates:(id)a5 userCovariates:(id)a6 error:(id *)a7
{
  uint64_t v260 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v212 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a7)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v122 = [MEMORY[0x1E4F28B00] currentHandler];
    [v122 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 455, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v123 = [MEMORY[0x1E4F28B00] currentHandler];
  [v123 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 456, @"Invalid parameter not satisfying: %@", @"context != nil" object file lineNumber description];

LABEL_3:
  v213 = v14;
  if (v14)
  {
    if (v15) {
      goto LABEL_5;
    }
  }
  else
  {
    v124 = [MEMORY[0x1E4F28B00] currentHandler];
    [v124 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 457, @"Invalid parameter not satisfying: %@", @"systemCovariates != nil" object file lineNumber description];

    if (v15) {
      goto LABEL_5;
    }
  }
  v125 = [MEMORY[0x1E4F28B00] currentHandler];
  [v125 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 458, @"Invalid parameter not satisfying: %@", @"userCovariates != nil" object file lineNumber description];

LABEL_5:
  v245[0] = MEMORY[0x1E4F143A8];
  v245[1] = 3221225472;
  v245[2] = __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke;
  v245[3] = &unk_1E6BB8A68;
  v245[4] = self;
  v214 = (void (**)(void, void, void, void, void))MEMORY[0x1E016EA80](v245);
  v242[0] = MEMORY[0x1E4F143A8];
  v242[1] = 3221225472;
  v242[2] = __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_2;
  v242[3] = &unk_1E6BB8A90;
  SEL v244 = a2;
  v242[4] = self;
  id v16 = v13;
  id v243 = v16;
  long long v17 = (void (**)(void, void, void, void))MEMORY[0x1E016EA80](v242);
  long long v18 = [(TRITargetingTask *)self experiment];
  char v19 = [v18 hasDeploymentId];

  if ((v19 & 1) == 0)
  {
    v34 = [(TRITargetingTask *)self experiment];
    id v35 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v34 errorType:@"deployment id is missing"];
    id v36 = *a7;
    *a7 = v35;

    v37 = ((void (**)(void, __CFString *, __CFString *, void))v17)[2](v17, @"missing-deployment-id", @"unspecified-or-default-treatment", 0);
    goto LABEL_26;
  }
  id v20 = [v16 experimentDatabase];
  uint64_t v21 = [(TRITargetingTask *)self experiment];
  v215 = [v20 experimentRecordWithExperimentDeployment:v21];

  if (v215)
  {
    if ([v215 type] == 3) {
      [(TRIExperimentTaskSupport *)self->_support setIdentifyTelemetryAsV1Rollout:1];
    }
    id v22 = [v215 artifact];
    v211 = v22;
    if (v22)
    {
      v23 = [v22 experiment];
      v210 = v23;
      if (v23)
      {
        id v24 = [v23 experimentId];
        v25 = [(TRITargetingTask *)self experiment];
        v26 = [v25 experimentId];
        if ([v24 isEqualToString:v26])
        {
          int v27 = [v210 deploymentId];
          v28 = [(TRITargetingTask *)self experiment];
          LOBYTE(v27) = v27 == [v28 deploymentId];

          if (v27)
          {
            id v29 = [v16 experimentDatabase];
            char v30 = [v211 hasNamespacesAvailableForExperimentWithDatabase:v29];

            if ((v30 & 1) == 0)
            {
              v48 = TRILogCategory_Server();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                id v49 = TRICloudKitSupport_NotificationType_EnumDescriptor();
                v50 = objc_msgSend(v49, "textFormatNameForValue:", objc_msgSend(v211, "experimentType"));
                v51 = [v211 experimentDeployment];
                v52 = [v51 shortDesc];
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v50;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v52;
                _os_log_impl(&dword_1DA291000, v48, OS_LOG_TYPE_DEFAULT, "No namespace available for %@ with id %{public}@.", buf, 0x16u);
              }
              v53 = [v16 experimentDatabase];
              id v54 = [(TRITargetingTask *)self experiment];
              int v55 = [v53 setStatus:4 forExperimentDeployment:v54 usingTransaction:0];

              if (v55)
              {
                ((void (**)(void, uint64_t, void, uint64_t, void *))v214)[2](v214, 2, 0, 1, v215);
              }
              else
              {
                v66 = [(TRITargetingTask *)self experiment];
                v67 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v66 errorType:@"failed to update experiment database"];
                id v68 = *a7;
                *a7 = v67;

                ((void (**)(void, uint64_t, void, uint64_t, void *))v214)[2](v214, 1, 0, 1, v215);
              uint64_t v33 = };
              goto LABEL_23;
            }
            if ([(TRITargetingTask *)self _isRolloutV1For1PWithExperimentRecord:v215 context:v16])
            {
              id v31 = TRILogCategory_Server();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                id v32 = [(TRITargetingTask *)self experiment];
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v32;
                _os_log_impl(&dword_1DA291000, v31, OS_LOG_TYPE_DEFAULT, "1P v1 rollout %{public}@ is not supported in this release", buf, 0xCu);
              }
              uint64_t v33 = ((void (**)(void, uint64_t, void, uint64_t, void *))v214)[2](v214, 2, 0, 1, v215);
              goto LABEL_23;
            }
            BOOL v56 = [v211 deploymentEnvironment] != 0;
            v209 = [[TRIExperimentCovariates alloc] initWithExperimentRecord:v215];
            v57 = [TRIExperimentDependentSystemCovariates alloc];
            id v58 = [v16 paths];
            v59 = [v215 endDate];
            v208 = [(TRIExperimentDependentSystemCovariates *)v57 initWithPaths:v58 baseSystemCovariates:v213 clientExperiment:v210 experimentEndDate:v59];

            v241 = 0;
            uint64_t v237 = 0;
            v238 = &v237;
            uint64_t v239 = 0x2020000000;
            BOOL v240 = 0;
            v60 = [v215 endDate];
            BOOL v61 = [(TRITargetingTask *)self getTreatment:&v241 forExperiment:v210 isServerSideExperiment:v56 systemCovariates:v208 userCovariates:v15 experimentCovariates:v209 experimentEndDate:v60 error:a7];

            BOOL v240 = v61;
            if (!*((unsigned char *)v238 + 24))
            {
              if (*a7)
              {
                id v69 = *a7;
                v70 = *a7;
                *a7 = v69;
              }
              else
              {
                v70 = [(TRITargetingTask *)self experiment];
                v108 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v70 errorType:@"unknown targeting error"];
                id v109 = *a7;
                *a7 = v108;
              }
              if (v241) {
                v110 = v241;
              }
              else {
                v110 = @"unspecified-or-default-treatment";
              }
              v37 = ((void (**)(void, __CFString *, __CFString *, void *))v17)[2](v17, @"unknown-targeting-error", v110, v215);
              goto LABEL_147;
            }
            id v236 = 0;
            BOOL v62 = [(TRITargetingTask *)self getFactorPackSetId:&v236 forExperiment:v210 treatmentId:v241 error:a7];
            *((unsigned char *)v238 + 24) = v62;
            if (!v62)
            {
              if (_os_feature_enabled_impl())
              {
                id v63 = TRILogCategory_Server();
                if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                {
                  v178 = [v210 experimentId];
                  int v179 = [v210 deploymentId];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v178;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = v179;
                  *(_WORD *)&buf[18] = 2112;
                  *(void *)&buf[20] = v241;
                  _os_log_error_impl(&dword_1DA291000, v63, OS_LOG_TYPE_ERROR, "Failed to find the factor pack set corresponding to the experiment %@.%u, treatment %@.", buf, 0x1Cu);
                }
                if (*a7)
                {
                  id v64 = *a7;
                  v65 = *a7;
                  *a7 = v64;
                }
                else
                {
                  v65 = [(TRITargetingTask *)self experiment];
                  v127 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v65 errorType:@"unknown error with FPS map"];
                  id v128 = *a7;
                  *a7 = v127;
                }
                if (v241) {
                  v129 = v241;
                }
                else {
                  v129 = @"unspecified-or-default-treatment";
                }
                v37 = ((void (**)(void, __CFString *, __CFString *, void *))v17)[2](v17, @"unknown-fps-map-error", v129, v215);
LABEL_146:

LABEL_147:
                _Block_object_dispose(&v237, 8);

                goto LABEL_24;
              }
              v71 = TRILogCategory_Server();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
              {
                v180 = [v210 experimentId];
                int v181 = [v210 deploymentId];
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v180;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v181;
                *(_WORD *)&buf[18] = 2112;
                *(void *)&buf[20] = v241;
                _os_log_fault_impl(&dword_1DA291000, v71, OS_LOG_TYPE_FAULT, "Failed to find the factor pack set corresponding to the experiment %@.%u, treatment %@. (This will not fail experiment targeting).", buf, 0x1Cu);
              }
            }
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            *(void *)&buf[24] = __Block_byref_object_copy__4;
            v258 = __Block_byref_object_dispose__4;
            id v259 = (id)objc_opt_new();
            BOOL v72 = [(TRITaskAttributing *)self->_taskAttributing networkOptions];
            int v73 = [v72 allowsCellularAccess];

            if (v73)
            {
              v74 = (void *)MEMORY[0x1E016E7F0]();
              v75 = [v215 artifact];
              v76 = [v75 namespaces];
              v233[0] = MEMORY[0x1E4F143A8];
              v233[1] = 3221225472;
              v233[2] = __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_235;
              v233[3] = &unk_1E6BB8AB8;
              id v234 = v16;
              v235 = buf;
              [v76 enumerateObjectsUsingBlock:v233];
            }
            switch([v215 status])
            {
              case 0:
              case 4:
                goto LABEL_50;
              case 1:
              case 2:
                int v98 = [v211 experimentType];
                if ((v98 & 0xFFFFFFFD) == 1)
                {
                  v99 = [v215 treatmentId];
                  v203 = v99;
                  if (v241)
                  {
                    if (objc_msgSend(v99, "isEqualToString:"))
                    {
                      v100 = TRILogCategory_Server();
                      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                      {
                        v101 = [(TRITargetingTask *)self experiment];
                        v102 = [v101 shortDesc];
                        *(_DWORD *)v255 = 138543362;
                        *(void *)&v255[4] = v102;
                        _os_log_impl(&dword_1DA291000, v100, OS_LOG_TYPE_DEFAULT, "re-targeting for experiment %{public}@ resulted in no changes", v255, 0xCu);
                      }
                      v207 = objc_opt_new();
                      v103 = v241;
                      v104 = [v207 ensureExperimentFields];
                      [v104 setClientTreatmentId:v103];

                      v105 = TRIDeploymentEnvironment_EnumDescriptor();
                      v106 = objc_msgSend(v105, "textFormatNameForValue:", objc_msgSend(v211, "deploymentEnvironment"));

                      if (!v106) {
                        v106 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", (int)objc_msgSend(v211, "deploymentEnvironment"));
                      }
                      [v207 setClientDeploymentEnv:v106];
                      [(TRIExperimentTaskSupport *)self->_support mergeTelemetry:v207];
                      uint64_t v107 = ((void (**)(void, uint64_t, void, void, void *))v214)[2](v214, 2, 0, 0, v215);
                    }
                    else if (v98 == 1)
                    {
                      v144 = TRILogCategory_Server();
                      if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
                      {
                        v145 = v241;
                        v146 = [(TRITargetingTask *)self experiment];
                        v147 = [v146 shortDesc];
                        *(_DWORD *)v255 = 138412802;
                        *(void *)&v255[4] = v203;
                        *(_WORD *)&v255[12] = 2112;
                        *(void *)&v255[14] = v145;
                        *(_WORD *)&v255[22] = 2114;
                        v256 = v147;
                        _os_log_impl(&dword_1DA291000, v144, OS_LOG_TYPE_DEFAULT, "re-targeting with current treatment %@ resulted in treatment %@ which will be treated as a deactivation for %{public}@", v255, 0x20u);
                      }
                      v148 = [(TRITargetingTask *)self experiment];
                      v149 = [v148 experimentId];
                      v150 = [(TRITargetingTask *)self experiment];
                      v207 = +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v149, [v150 deploymentId], 1, 6, self->_taskAttributing);

                      v151 = [(TRITargetingTask *)self experiment];
                      v152 = [v151 taskTag];
                      [v212 cancelTasksWithTag:v152];

                      v247 = v207;
                      v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v247 count:1];
                      uint64_t v107 = ((void (**)(void, uint64_t, void *, uint64_t, void *))v214)[2](v214, 2, v106, 1, v215);
                    }
                    else
                    {
                      v159 = TRILogCategory_Server();
                      if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
                      {
                        v160 = [(TRITargetingTask *)self experiment];
                        v161 = [v160 shortDesc];
                        *(_DWORD *)v255 = 138543874;
                        *(void *)&v255[4] = v161;
                        *(_WORD *)&v255[12] = 2112;
                        *(void *)&v255[14] = v203;
                        *(_WORD *)&v255[22] = 2112;
                        v256 = v241;
                        _os_log_impl(&dword_1DA291000, v159, OS_LOG_TYPE_DEFAULT, "re-targeting ROLLOUT experiment %{public}@ with treatment %@ resulted in treatment %@", v255, 0x20u);
                      }
                      v162 = [v215 namespaces];
                      v207 = [v162 firstObject];

                      if (!v207)
                      {
                        v187 = TRILogCategory_Server();
                        if (os_log_type_enabled(v187, OS_LOG_TYPE_ERROR))
                        {
                          v191 = [(TRITargetingTask *)self experiment];
                          v192 = [v191 shortDesc];
                          *(_DWORD *)v255 = 138543362;
                          *(void *)&v255[4] = v192;
                          _os_log_error_impl(&dword_1DA291000, v187, OS_LOG_TYPE_ERROR, "Cannot retarget experiment %{public}@ because the experiment has no namespaces.", v255, 0xCu);
                        }
                        v37 = ((void (**)(void, uint64_t, void, uint64_t, void *))v214)[2](v214, 3, 0, 1, v215);

                        goto LABEL_128;
                      }
                      v163 = [v16 namespaceDatabase];
                      v164 = [v207 name];
                      v106 = [v163 dynamicNamespaceRecordWithNamespaceName:v164];

                      if (v106)
                      {
                        v201 = [(TRITaskAttributing *)self->_taskAttributing applicationBundleIdentifier];
                        v199 = [MEMORY[0x1E4FB0650] dimensionWithName:@"client_app_bundle_id" value:v201];
                        [(TRIExperimentTaskSupport *)self->_support addDimension:v199];
                        v198 = objc_msgSend(v15, "tri_shortVersionStringForBundleId:", v201);
                        v197 = [MEMORY[0x1E4FB0650] dimensionWithName:@"client_app_version" value:v198];
                        [(TRIExperimentTaskSupport *)self->_support addDimension:v197];
                        *(void *)v255 = 0;
                        *(void *)&v255[8] = v255;
                        *(void *)&v255[16] = 0x2020000000;
                        LOBYTE(v256) = 0;
                        v165 = [v16 experimentDatabase];
                        v216[0] = MEMORY[0x1E4F143A8];
                        v216[1] = 3221225472;
                        v216[2] = __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_255;
                        v216[3] = &unk_1E6BB7CA0;
                        id v166 = v16;
                        id v217 = v166;
                        v218 = self;
                        v219 = v241;
                        v220 = v255;
                        [v165 writeTransactionWithFailableBlock:v216];

                        if (*(unsigned char *)(*(void *)&v255[8] + 24))
                        {
                          v167 = [(TRITargetingTask *)self experiment];
                          v168 = +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:v167];

                          v169 = [v166 contentTracker];
                          [v169 dropRefWithContentIdentifier:v168];

                          v170 = [(TRITargetingTask *)self experiment];
                          v171 = +[TRIMakeDefaultTask taskWithExperiment:v170 treatmentId:v241 taskAttributing:self->_taskAttributing capabilityModifier:*(void *)(*(void *)&buf[8] + 40)];
                          v246 = v171;
                          v172 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v246 count:1];

                          v37 = ((void (**)(void, uint64_t, void *, uint64_t, void *))v214)[2](v214, 2, v172, 1, v215);
                        }
                        else
                        {
                          v37 = ((void (**)(void, uint64_t, void, uint64_t, void *))v214)[2](v214, 3, 0, 1, v215);
                        }

                        _Block_object_dispose(v255, 8);
                        goto LABEL_127;
                      }
                      v189 = TRILogCategory_Server();
                      if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
                      {
                        v193 = [(TRITargetingTask *)self experiment];
                        v194 = [v193 shortDesc];
                        v195 = [v207 name];
                        v196 = TRILoggedNamespaceName(v195);
                        *(_DWORD *)v255 = 138543618;
                        *(void *)&v255[4] = v194;
                        *(_WORD *)&v255[12] = 2114;
                        *(void *)&v255[14] = v196;
                        _os_log_error_impl(&dword_1DA291000, v189, OS_LOG_TYPE_ERROR, "Cannot retarget ROLLOUT experiment %{public}@ because associated namespace %{public}@ is not dynamic.", v255, 0x16u);
                      }
                      uint64_t v107 = ((void (**)(void, uint64_t, void, uint64_t, void *))v214)[2](v214, 3, 0, 1, v215);
                    }
                  }
                  else
                  {
                    v132 = TRILogCategory_Server();
                    if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
                    {
                      v133 = [(TRITargetingTask *)self experiment];
                      v134 = [v133 shortDesc];
                      *(_DWORD *)v255 = 138543362;
                      *(void *)&v255[4] = v134;
                      _os_log_impl(&dword_1DA291000, v132, OS_LOG_TYPE_DEFAULT, "re-targeting of active experiment resulted in default treatment - scheduling deactivation of experiment %{public}@", v255, 0xCu);
                    }
                    v135 = [(TRITargetingTask *)self experiment];
                    v136 = [v135 taskTag];
                    [v212 cancelTasksWithTag:v136];

                    v137 = [(TRITargetingTask *)self experiment];
                    v138 = [v137 experimentId];
                    v139 = [(TRITargetingTask *)self experiment];
                    v207 = +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v138, [v139 deploymentId], 1, 7, self->_taskAttributing);

                    v248 = v207;
                    v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v248 count:1];
                    uint64_t v107 = ((void (**)(void, uint64_t, void *, uint64_t, void *))v214)[2](v214, 2, v106, 1, v215);
                  }
                  v37 = (void *)v107;
LABEL_127:

LABEL_128:
                  v143 = v203;
                  goto LABEL_144;
                }
                v115 = TRILogCategory_Server();
                if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
                {
                  v185 = [(TRITargetingTask *)self experiment];
                  v186 = [v185 shortDesc];
                  *(_DWORD *)v255 = 138543618;
                  *(void *)&v255[4] = v186;
                  *(_WORD *)&v255[12] = 1024;
                  *(_DWORD *)&v255[14] = v98;
                  _os_log_error_impl(&dword_1DA291000, v115, OS_LOG_TYPE_ERROR, "re-targeting for already active experiment %{public}@ with unexpected type %u", v255, 0x12u);
                }
                if (v241) {
                  v116 = v241;
                }
                else {
                  v116 = @"unspecified-or-default-treatment";
                }
                goto LABEL_94;
              case 3:
                if ([v215 type] == 3)
                {
                  v113 = TRILogCategory_Server();
                  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
                  {
                    v114 = [(TRITargetingTask *)self experiment];
                    *(_DWORD *)v255 = 138543362;
                    *(void *)&v255[4] = v114;
                    _os_log_impl(&dword_1DA291000, v113, OS_LOG_TYPE_DEFAULT, "Rollout v1 experiment %{public}@ was previously finished, still attempting re-targeting", v255, 0xCu);
                  }
LABEL_50:
                  int v205 = [v211 experimentType];
                  if (!v241)
                  {
                    v117 = TRILogCategory_Server();
                    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
                    {
                      v118 = [(TRITargetingTask *)self experiment];
                      v119 = [v210 description];
                      *(_DWORD *)v255 = 138543618;
                      *(void *)&v255[4] = v118;
                      *(_WORD *)&v255[12] = 2114;
                      *(void *)&v255[14] = v119;
                      _os_log_impl(&dword_1DA291000, v117, OS_LOG_TYPE_DEFAULT, "targeting resulted in default treatment for experiment %{public}@ (%{public}@)", v255, 0x16u);
                    }
                    *((unsigned char *)v238 + 24) = 0;
                    v120 = [v16 experimentDatabase];
                    v229[0] = MEMORY[0x1E4F143A8];
                    v229[1] = 3221225472;
                    v229[2] = __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_238;
                    v229[3] = &unk_1E6BB8050;
                    id v230 = v16;
                    v231 = self;
                    v232 = &v237;
                    [v120 writeTransactionWithFailableBlock:v229];

                    if (*((unsigned char *)v238 + 24))
                    {
                      uint64_t v121 = 2;
                    }
                    else
                    {
                      v140 = [(TRITargetingTask *)self experiment];
                      v141 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v140 errorType:@"failed to update experiment database"];
                      id v142 = *a7;
                      *a7 = v141;

                      uint64_t v121 = 1;
                    }
                    v37 = ((void (**)(void, uint64_t, void, uint64_t, void *))v214)[2](v214, v121, 0, 1, v215);
                    v143 = v230;
                    goto LABEL_144;
                  }
                  if ((v205 & 0xFFFFFFFD) == 1)
                  {
                    id v77 = TRILogCategory_Server();
                    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
                    {
                      id v78 = v241;
                      v79 = [(TRITargetingTask *)self experiment];
                      id v80 = [v210 description];
                      *(_DWORD *)v255 = 138412802;
                      *(void *)&v255[4] = v78;
                      *(_WORD *)&v255[12] = 2114;
                      *(void *)&v255[14] = v79;
                      *(_WORD *)&v255[22] = 2114;
                      v256 = v80;
                      _os_log_impl(&dword_1DA291000, v77, OS_LOG_TYPE_DEFAULT, "enrolling in treatment %@ of experiment %{public}@ (%{public}@)", v255, 0x20u);
                    }
                    if (v205 == 1)
                    {
                      *(void *)v255 = 0;
                      *(void *)&v255[8] = v255;
                      *(void *)&v255[16] = 0x2020000000;
                      LODWORD(v256) = -1;
                      __int16 v81 = [v16 experimentDatabase];
                      v82 = [(TRITargetingTask *)self experiment];
                      v83 = [v82 experimentId];
                      v228[0] = MEMORY[0x1E4F143A8];
                      v228[1] = 3221225472;
                      v228[2] = __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_240;
                      v228[3] = &unk_1E6BB8AE0;
                      v228[4] = self;
                      v228[5] = v255;
                      [v81 enumerateExperimentRecordsMatchingExperimentId:v83 block:v228];

                      if (*(_DWORD *)(*(void *)&v255[8] + 24) != -1)
                      {
                        v84 = [(TRITargetingTask *)self experiment];
                        v85 = [v84 experimentId];
                        v254 = self;
                        v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v254 count:1];
                        [v212 cancelTasksWithTag:v85 excludingTasks:v86];

                        v87 = [(TRITargetingTask *)self experiment];
                        v88 = [v87 experimentId];
                        v89 = +[TRIDeactivateTreatmentTask taskWithExperimentId:v88 deploymentId:*(unsigned int *)(*(void *)&v255[8] + 24) failOnUnrecognizedExperiment:0 triggerEvent:11 taskAttribution:self->_taskAttributing];

                        v90 = [v89 runUsingContext:v16 withTaskQueue:v212];
                        if ([v90 runStatus] != 2)
                        {
                          v91 = TRILogCategory_Server();
                          if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                          {
                            v204 = [(TRITargetingTask *)self experiment];
                            v190 = [v204 shortDesc];
                            *(_DWORD *)v252 = 138543362;
                            v253 = v190;
                            _os_log_error_impl(&dword_1DA291000, v91, OS_LOG_TYPE_ERROR, "Failed to deactivate one or more prior deployment(s) of experiment %{public}@, but forging boldly onward", v252, 0xCu);
                          }
                        }
                      }
                      _Block_object_dispose(v255, 8);
                    }
                    *((unsigned char *)v238 + 24) = 0;
                    v92 = [v16 experimentDatabase];
                    v221[0] = MEMORY[0x1E4F143A8];
                    v221[1] = 3221225472;
                    v221[2] = __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_243;
                    v221[3] = &unk_1E6BB8B08;
                    id v222 = v16;
                    v223 = self;
                    v224 = v241;
                    id v225 = v236;
                    id v200 = v215;
                    id v226 = v200;
                    v227 = &v237;
                    [v92 writeTransactionWithFailableBlock:v221];

                    if (*((unsigned char *)v238 + 24))
                    {
                      v202 = objc_opt_new();
                      v93 = v241;
                      v94 = [v202 ensureExperimentFields];
                      [v94 setClientTreatmentId:v93];

                      v95 = TRIDeploymentEnvironment_EnumDescriptor();
                      v96 = objc_msgSend(v95, "textFormatNameForValue:", objc_msgSend(v211, "deploymentEnvironment"));

                      if (!v96) {
                        v96 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", (int)objc_msgSend(v211, "deploymentEnvironment"));
                      }
                      [v202 setClientDeploymentEnv:v96];
                      if (v205 == 1)
                      {
                        if ([v210 hasStartDate])
                        {
                          v97 = [v210 startDate];
                          v206 = [v97 date];
                        }
                        else
                        {
                          v206 = 0;
                        }
                        if (v236)
                        {
                          v157 = [(TRITargetingTask *)self experiment];
                          v173 = v241;
                          id v174 = v236;
                          taskAttributing = self->_taskAttributing;
                          BOOL v176 = [v211 deploymentEnvironment] == 0;
                          v177 = +[TRIActivateTreatmentTask taskWithExperiment:v157 treatmentId:v173 factorPackSetId:v174 taskAttributing:taskAttributing requiresTreatmentInstallation:v176 capabilityModifier:*(void *)(*(void *)&buf[8] + 40) startTime:v206 taskOptions:0];
                          v251 = v177;
                          [MEMORY[0x1E4F1C978] arrayWithObjects:&v251 count:1];
                        }
                        else
                        {
                          v157 = [(TRITargetingTask *)self experiment];
                          v182 = v241;
                          v183 = self->_taskAttributing;
                          BOOL v184 = [v211 deploymentEnvironment] == 0;
                          v177 = +[TRIActivateTreatmentTask taskWithExperiment:v157 treatmentId:v182 taskAttributing:v183 requiresTreatmentInstallation:v184 capabilityModifier:*(void *)(*(void *)&buf[8] + 40) startTime:v206 taskOptions:0];
                          v250 = v177;
                          [MEMORY[0x1E4F1C978] arrayWithObjects:&v250 count:1];
                        v158 = };
                      }
                      else
                      {
                        uint64_t v156 = [(TRITargetingTask *)self experiment];
                        v157 = +[TRIMakeDefaultTask taskWithExperiment:v156 treatmentId:v241 taskAttributing:self->_taskAttributing capabilityModifier:*(void *)(*(void *)&buf[8] + 40)];
                        v249 = v157;
                        v158 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v249 count:1];
                        v206 = (void *)v156;
                      }

                      [(TRIExperimentTaskSupport *)self->_support mergeTelemetry:v202];
                      v37 = ((void (**)(void, uint64_t, void *, uint64_t, id))v214)[2](v214, 2, v158, 1, v200);
                    }
                    else
                    {
                      v153 = [(TRITargetingTask *)self experiment];
                      v154 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v153 errorType:@"failed update database"];
                      id v155 = *a7;
                      *a7 = v154;

                      v37 = ((void (**)(void, uint64_t, void, uint64_t, id))v214)[2](v214, 1, 0, 1, v200);
                    }

                    v143 = v222;
LABEL_144:

                    goto LABEL_145;
                  }
                  v126 = TRILogCategory_Server();
                  if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
                  {
                    v188 = [(TRITargetingTask *)self experiment];
                    *(_DWORD *)v255 = 138543362;
                    *(void *)&v255[4] = v188;
                    _os_log_error_impl(&dword_1DA291000, v126, OS_LOG_TYPE_ERROR, "unexpected experimentType for experiment %{public}@", v255, 0xCu);
                  }
                  if (v241) {
                    v116 = v241;
                  }
                  else {
                    v116 = @"unspecified-or-default-treatment";
                  }
LABEL_94:
                  uint64_t v112 = ((void (**)(void, __CFString *, __CFString *, void *))v17)[2](v17, @"invalid-notification-type", v116, v215);
                }
                else
                {
                  v130 = TRILogCategory_Server();
                  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
                  {
                    v131 = [(TRITargetingTask *)self experiment];
                    *(_DWORD *)v255 = 138543362;
                    *(void *)&v255[4] = v131;
                    _os_log_impl(&dword_1DA291000, v130, OS_LOG_TYPE_DEFAULT, "experiment %{public}@ already finished, not running re-targeting", v255, 0xCu);
                  }
                  uint64_t v112 = ((void (**)(void, uint64_t, void, uint64_t, void *))v214)[2](v214, 2, 0, 1, v215);
                }
LABEL_116:
                v37 = (void *)v112;
LABEL_145:
                _Block_object_dispose(buf, 8);

                goto LABEL_146;
              default:
                if (v241) {
                  v111 = v241;
                }
                else {
                  v111 = @"unspecified-or-default-treatment";
                }
                uint64_t v112 = ((void (**)(void, __CFString *, __CFString *, void *))v17)[2](v17, @"invalid-experiment-status", v111, v215);
                goto LABEL_116;
            }
          }
        }
        else
        {
        }
        __int16 v44 = [(TRITargetingTask *)self experiment];
        id v45 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v44 errorType:@"loaded artifact with wrong experiment deployment"];
        id v46 = *a7;
        *a7 = v45;

        uint64_t v33 = ((void (**)(void, __CFString *, __CFString *, void *))v17)[2](v17, @"encoded-experiment-mismatches-record", @"unspecified-or-default-treatment", v215);
      }
      else
      {
        v41 = [(TRITargetingTask *)self experiment];
        __int16 v42 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v41 errorType:@"decoded experiment definition is nil"];
        id v43 = *a7;
        *a7 = v42;

        uint64_t v33 = ((void (**)(void, __CFString *, __CFString *, void *))v17)[2](v17, @"decoded-experiment-is-nil", @"unspecified-or-default-treatment", v215);
      }
LABEL_23:
      v37 = (void *)v33;
LABEL_24:

      goto LABEL_25;
    }
  }
  v38 = [(TRITargetingTask *)self experiment];
  uint64_t v39 = [(TRITargetingTask *)self _targetingErrorWithExperiment:v38 errorType:@"experiment record not found"];
  id v40 = *a7;
  *a7 = v39;

  v37 = ((void (**)(void, __CFString *, __CFString *, void *))v17)[2](v17, @"experiment-not-found", @"unspecified-or-default-treatment", v215);
LABEL_25:

LABEL_26:
  return v37;
}

id __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (a2 == 1) {
    goto LABEL_12;
  }
  if (!v10) {
    goto LABEL_12;
  }
  if (!a4) {
    goto LABEL_12;
  }
  id v12 = [v10 artifact];
  id v13 = [v12 experiment];
  int v14 = [v13 hasShadowEvaluation];

  if (!v14) {
    goto LABEL_12;
  }
  id v15 = [v11 artifact];
  id v16 = [v15 experiment];
  long long v17 = [v16 shadowEvaluation];
  if ([v17 hasClientBackgroundMlTask])
  {
    id v36 = [v11 artifact];
    [v36 experiment];
    long long v18 = v37 = a1;
    char v19 = [v18 shadowEvaluation];
    id v20 = [v19 clientBackgroundMlTask];
    int v35 = [v20 hasTaskId];

    a1 = v37;
    if (v35)
    {
      uint64_t v21 = [v11 artifact];
      id v22 = [v21 experiment];
      v23 = [v22 shadowEvaluation];
      id v24 = [v23 clientBackgroundMlTask];
      v25 = [v24 taskId];
      v26 = [*(id *)(v37 + 32) experiment];
      +[TRILighthouseBitacoraHandler emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:", v25, [v26 deploymentId], 0, a2 == 2);

      goto LABEL_11;
    }
  }
  else
  {
  }
  int v27 = [v11 artifact];
  v28 = [v27 experiment];
  id v29 = [v28 shadowEvaluation];
  char v30 = [v29 mlRuntime];
  int v31 = [v30 hasEvaluationId];

  if (!v31) {
    goto LABEL_12;
  }
  uint64_t v21 = [v11 artifact];
  id v22 = [v21 experiment];
  v23 = [v22 experimentId];
  id v24 = [*(id *)(a1 + 32) experiment];
  +[TRILighthouseBitacoraHandler emitShadowEvaluationEventWithExperimentId:deploymentId:treatmentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitShadowEvaluationEventWithExperimentId:deploymentId:treatmentId:eventType:succeeded:", v23, [v24 deploymentId], 0, 0, a2 == 2);
LABEL_11:

LABEL_12:
  if (v9) {
    id v32 = v9;
  }
  else {
    id v32 = (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v33 = +[TRITaskRunResult resultWithRunStatus:a2 reportResultToServer:a4 nextTasks:v32 earliestRetryDate:0];

  return v33;
}

id __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRITargetingTask.m", 488, @"Invalid parameter not satisfying: %@", @"failureReason" object file lineNumber description];

    if (v8)
    {
LABEL_3:
      if (!v9) {
        goto LABEL_12;
      }
LABEL_4:
      id v10 = [v9 artifact];
      id v11 = [v10 experiment];
      int v12 = [v11 hasShadowEvaluation];

      if (!v12) {
        goto LABEL_12;
      }
      id v13 = [v9 artifact];
      int v14 = [v13 experiment];
      id v15 = [v14 shadowEvaluation];
      if ([v15 hasClientBackgroundMlTask])
      {
        id v16 = [v9 artifact];
        long long v17 = [v16 experiment];
        [v17 shadowEvaluation];
        long long v18 = v43 = v7;
        char v19 = [v18 clientBackgroundMlTask];
        int v42 = [v19 hasTaskId];

        id v7 = v43;
        if (v42)
        {
          id v20 = [v9 artifact];
          uint64_t v21 = [v20 experiment];
          id v22 = [v21 shadowEvaluation];
          v23 = [v22 clientBackgroundMlTask];
          id v24 = [v23 taskId];
          v25 = [*(id *)(a1 + 32) experiment];
          +[TRILighthouseBitacoraHandler emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:", v24, [v25 deploymentId], 0, 0);

          id v7 = v43;
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
      }
      v26 = [v9 artifact];
      int v27 = [v26 experiment];
      v28 = [v27 shadowEvaluation];
      id v29 = [v28 mlRuntime];
      int v30 = [v29 hasEvaluationId];

      if (!v30) {
        goto LABEL_12;
      }
      id v20 = [v9 artifact];
      uint64_t v21 = [v20 experiment];
      id v22 = [v21 experimentId];
      v23 = [*(id *)(a1 + 32) experiment];
      +[TRILighthouseBitacoraHandler emitShadowEvaluationEventWithExperimentId:deploymentId:treatmentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitShadowEvaluationEventWithExperimentId:deploymentId:treatmentId:eventType:succeeded:", v22, [v23 deploymentId], 0, 0, 0);
      goto LABEL_11;
    }
  }
  id v40 = [MEMORY[0x1E4F28B00] currentHandler];
  [v40 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRITargetingTask.m", 489, @"Invalid parameter not satisfying: %@", @"assignedTreatment" object file lineNumber description];

  if (v9) {
    goto LABEL_4;
  }
LABEL_12:
  int v31 = +[TRIExperimentPostLaunchRecorder recorderFromContext:*(void *)(a1 + 40)];
  id v32 = [*(id *)(a1 + 32) experiment];
  uint64_t v33 = [v32 experimentId];
  v34 = [*(id *)(a1 + 32) experiment];
  int v35 = +[TRIExperimentDeploymentTreatment treatmentTripleWithExperimentId:deploymentId:treatmentId:](TRIExperimentDeploymentTreatment, "treatmentTripleWithExperimentId:deploymentId:treatmentId:", v33, [v34 deploymentId], v8);

  id v36 = +[TRIExperimentPostLaunchEvent failureEventWithEventType:6 treatmentTriple:v35 failureReason:v7];
  if (!v36)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRITargetingTask.m", 522, @"Expression was unexpectedly nil/false: %@", @"[TRIExperimentPostLaunchEvent failureEventWithEventType:TRIInternalExperimentAllocationStatusTypeAllocationFailure treatmentTriple:triple failureReason:failureReason]" object file lineNumber description];
  }
  [v31 recordEvent:v36];
  uint64_t v37 = +[TRITaskRunResult resultWithRunStatus:3 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];

  return v37;
}

void __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_235(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = (void *)MEMORY[0x1E4FB01A0];
  id v8 = [*(id *)(a1 + 32) paths];
  id v9 = [v8 namespaceDescriptorsDefaultDir];
  id v10 = [v7 loadWithNamespaceName:v6 fromDirectory:v9];

  if (([v10 expensiveNetworkingAllowed] & 1) == 0)
  {
    id v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, "Changing TRIFetchTreatmentTask to require inexpensive networking since %@ does not support expensive networking", (uint8_t *)&v15, 0xCu);
    }

    int v12 = [[TRITaskCapabilityModifier alloc] initWithAdd:1 remove:2];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    int v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a4 = 1;
  }
}

uint64_t __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_238(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 experimentDatabase];
  id v6 = [*(id *)(a1 + 40) experiment];
  int v7 = [v5 setStatus:4 forExperimentDeployment:v6 usingTransaction:v4];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  if (!v7) {
    id v8 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }
  return *v8;
}

void __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_240(uint64_t a1, void *a2, unsigned char *a3)
{
  id v12 = a2;
  id v5 = [v12 experimentDeployment];
  if (([v5 hasDeploymentId] & 1) == 0) {
    goto LABEL_4;
  }
  id v6 = [v12 experimentDeployment];
  int v7 = [v6 deploymentId];
  id v8 = [*(id *)(a1 + 32) experiment];
  if (v7 == [v8 deploymentId])
  {

LABEL_4:
    id v9 = v12;
    goto LABEL_9;
  }
  if ([v12 status] == 2)
  {
  }
  else
  {
    uint64_t v10 = [v12 status];

    id v9 = v12;
    if (v10 != 1) {
      goto LABEL_9;
    }
  }
  id v11 = [v12 experimentDeployment];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v11 deploymentId];

  id v9 = v12;
  *a3 = 1;
LABEL_9:
}

uint64_t __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_243(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) experimentDatabase];
  id v5 = [*(id *)(a1 + 40) experiment];
  int v6 = [v4 setStatus:2 forExperimentDeployment:v5 usingTransaction:v3];

  if (v6)
  {
    int v7 = [*(id *)(a1 + 32) experimentDatabase];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v10 = [*(id *)(a1 + 40) experiment];
    int v11 = [v7 setTreatmentId:v9 factorPackSetId:v8 forExperimentDeployment:v10 usingTransaction:v3];
  }
  else
  {
    int v11 = 0;
  }
  if ([*(id *)(a1 + 64) status] == 4) {
    id v12 = @"retargeting_by_dynamic_enrollment";
  }
  else {
    id v12 = 0;
  }
  uint64_t v13 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  if (v11)
  {
    int v14 = [*(id *)(a1 + 40) experiment];
    int v15 = [v14 experimentId];
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = [*(id *)(a1 + 40) experiment];
    int v11 = +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:categoricalMetric:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:categoricalMetric:context:", 1, v15, v16, [v17 deploymentId], *(void *)(a1 + 64), 0, v12, *(void *)(a1 + 32));

    if (v11) {
      uint64_t v13 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v11;

  return *v13;
}

uint64_t __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_255(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 experimentDatabase];
  int v6 = [*(id *)(a1 + 40) experiment];
  char v7 = [v5 setStatus:2 forExperimentDeployment:v6 usingTransaction:v4];

  uint64_t v8 = [*(id *)(a1 + 32) experimentDatabase];
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = [*(id *)(a1 + 40) experiment];
  LOBYTE(v9) = [v8 setTreatmentId:v9 forExperimentDeployment:v10 usingTransaction:v4];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7 & v9;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    int v11 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else {
    int v11 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }
  return *v11;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 paths];
  uint64_t v9 = [(TRITargetingTask *)self systemCovariatesWithPaths:v8];

  uint64_t v10 = [[TRIUserCovariates alloc] initWithContext:v7];
  id v23 = 0;
  int v11 = [(TRITargetingTask *)self runTaskUsingContext:v7 withTaskQueue:v6 systemCovariates:v9 userCovariates:v10 error:&v23];

  int v12 = [v11 runStatus];
  id v13 = 0;
  if (v12 != 2 || v23 != 0)
  {
    int v15 = @"unknown";
    if (v23)
    {
      uint64_t v16 = [v23 userInfo];
      uint64_t v17 = [v16 objectForKeyedSubscript:@"logMessage"];
      long long v18 = (void *)v17;
      if (v17) {
        char v19 = (__CFString *)v17;
      }
      else {
        char v19 = @"unknown";
      }
      int v15 = v19;
    }
    support = self->_support;
    uint64_t v21 = [MEMORY[0x1E4FB05A8] metricWithName:@"targeting_error" categoricalValue:v15];
    [(TRIExperimentTaskSupport *)support addMetric:v21];

    id v13 = v23;
  }

  return v11;
}

- (id)metrics
{
  return [(TRIExperimentTaskSupport *)self->_support metrics];
}

- (id)dimensions
{
  return [(TRIExperimentTaskSupport *)self->_support dimensions];
}

- (id)trialSystemTelemetry
{
  return [(TRIExperimentTaskSupport *)self->_support trialSystemTelemetry];
}

- (id)_asPersistedTask
{
  id v3 = objc_opt_new();
  id v4 = [(TRITargetingTask *)self experiment];
  id v5 = [v4 experimentId];
  [v3 setExperimentId:v5];

  id v6 = [(TRITargetingTask *)self experiment];
  objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v6, "deploymentId"));

  [v3 setIncludeDependencies:self->_includeDependencies];
  id v7 = [(TRITaskAttributing *)self->_taskAttributing asPersistedTaskAttribution];
  [v3 setTaskAttribution:v7];

  objc_msgSend(v3, "setRetryCount:", -[TRITargetingTask retryCount](self, "retryCount"));
  return v3;
}

- (id)serialize
{
  id v4 = [(TRITargetingTask *)self _asPersistedTask];
  id v5 = [v4 data];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 969, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v25 = 0;
  id v3 = +[TRIPBMessage parseFromData:a3 error:&v25];
  id v4 = v25;
  if (!v3)
  {
    uint64_t v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v4;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRITargetingPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_25;
  }
  if (([v3 hasExperimentId] & 1) == 0)
  {
    int v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v23 = (objc_class *)objc_opt_class();
      id v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138412290;
      id v27 = v24;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);
    }
    uint64_t v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    int v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138412290;
    id v27 = v16;
    uint64_t v17 = "Cannot decode message of type %@ with missing field: experimentId";
    goto LABEL_24;
  }
  id v5 = [v3 experimentId];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    uint64_t v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    long long v18 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138412290;
    id v27 = v16;
    uint64_t v17 = "Cannot decode message of type %@ with field of length 0: experimentId";
LABEL_24:
    _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);

    goto LABEL_25;
  }
  if (([v3 hasDeploymentId] & 1) == 0)
  {
    uint64_t v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    char v19 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138412290;
    id v27 = v16;
    uint64_t v17 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_24;
  }
  if (([v3 hasIncludeDependencies] & 1) == 0)
  {
    uint64_t v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    id v20 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138412290;
    id v27 = v16;
    uint64_t v17 = "Cannot decode message of type %@ with missing field: includeDependencies";
    goto LABEL_24;
  }
  if (([v3 hasTaskAttribution] & 1) == 0)
  {
    uint64_t v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138412290;
      id v27 = v16;
      uint64_t v17 = "Cannot decode message of type %@ with missing field: taskAttribution";
      goto LABEL_24;
    }
LABEL_25:
    int v12 = 0;
    goto LABEL_26;
  }
  id v7 = [v3 taskAttribution];
  uint64_t v8 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v7];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4FB00F8]);
    uint64_t v10 = [v3 experimentId];
    int v11 = objc_msgSend(v9, "initWithExperimentId:deploymentId:", v10, objc_msgSend(v3, "deploymentId"));

    int v12 = objc_msgSend((id)objc_opt_class(), "taskWithExperiment:includeDependencies:taskAttribution:", v11, objc_msgSend(v3, "includeDependencies"), v8);
    if ([v3 hasRetryCount]) {
      uint64_t v13 = [v3 retryCount];
    }
    else {
      uint64_t v13 = 0;
    }
    [v12 setRetryCount:v13];
  }
  else
  {
    int v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    int v12 = 0;
  }

LABEL_26:
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TRITargetingTask;
  if ([(TRIBaseTask *)&v10 isEqual:v4])
  {
    id v5 = v4;
    uint64_t v6 = [(TRITargetingTask *)self experiment];
    id v7 = [v5 experiment];

    char v8 = [v6 isEqualToDeployment:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v13.receiver = self;
  v13.super_class = (Class)TRITargetingTask;
  unint64_t v3 = [(TRIBaseTask *)&v13 hash];
  id v4 = [(TRITargetingTask *)self experiment];
  id v5 = [v4 experimentId];
  if (v5)
  {
    uint64_t v6 = [(TRITargetingTask *)self experiment];
    id v7 = [v6 experimentId];
    uint64_t v8 = [v7 hash];
  }
  else
  {
    uint64_t v8 = 0;
  }

  id v9 = [(TRITargetingTask *)self experiment];
  if ([v9 hasDeploymentId])
  {
    objc_super v10 = [(TRITargetingTask *)self experiment];
    uint64_t v11 = (int)[v10 deploymentId];
  }
  else
  {
    uint64_t v11 = -2;
  }

  return v11 + 37 * (v8 + 37 * v3);
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(TRITargetingTask *)self experiment];
  uint64_t v6 = [v5 shortDesc];
  id v7 = [v3 stringWithFormat:@"<%@:%@,r:%d>", v4, v6, -[TRITargetingTask retryCount](self, "retryCount")];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRITargetingTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRITargetingTask;
  id v5 = [(TRITargetingTask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
    if (v6)
    {
      id v7 = [(id)objc_opt_class() parseFromData:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
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
    [v6 handleFailureInMethod:a2, self, @"TRITargetingTask.m", 1032, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  id v5 = [(TRITargetingTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskAttributing, 0);
  objc_storeStrong((id *)&self->_support, 0);
}

@end