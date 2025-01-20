@interface TRILatencyMetricTelemetryValidator
- (BOOL)_isRecordContainingAllowedLoggingNamespace:(id)a3;
- (NSSet)namespacesAllowedForLogging;
- (TRILatencyMetricTelemetryValidator)initWithRolloutDatabase:(id)a3 paths:(id)a4;
- (TRIRolloutDatabase)rolloutDb;
- (id)createRolloutFieldForDeployment:(id)a3 factorPackSetId:(id)a4 record:(id)a5;
- (id)validateAndReturnTelemetryForDeployment:(id)a3 factorPackSetId:(id)a4;
@end

@implementation TRILatencyMetricTelemetryValidator

- (TRILatencyMetricTelemetryValidator)initWithRolloutDatabase:(id)a3 paths:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TRILatencyMetricTelemetryValidator;
  v9 = [(TRILatencyMetricTelemetryValidator *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rolloutDb, a3);
    v11 = +[TRISetupAssistantFetchUtils getNamespaceNamesWithFetchDuringSetupAssistantEnabledWithTRIPaths:v8];
    v12 = v11;
    if (v11) {
      v13 = v11;
    }
    else {
      v13 = (NSSet *)objc_opt_new();
    }
    namespacesAllowedForLogging = v10->_namespacesAllowedForLogging;
    v10->_namespacesAllowedForLogging = v13;
  }
  return v10;
}

- (BOOL)_isRecordContainingAllowedLoggingNamespace:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CA80];
  v5 = [a3 artifact];
  v6 = [v5 namespaceNames];
  id v7 = [v4 setWithArray:v6];

  id v8 = TRILogCategory_Server();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(TRILatencyMetricTelemetryValidator *)self namespacesAllowedForLogging];
    int v12 = 138412546;
    v13 = v7;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "Intersecting artifact namespaces: %@ with relevant namespaces: %@ for telemetry", (uint8_t *)&v12, 0x16u);
  }
  v10 = [(TRILatencyMetricTelemetryValidator *)self namespacesAllowedForLogging];
  [v7 intersectSet:v10];

  LOBYTE(v10) = [v7 count] != 0;
  return (char)v10;
}

- (id)createRolloutFieldForDeployment:(id)a3 factorPackSetId:(id)a4 record:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = objc_opt_new();
  v11 = [v9 rolloutId];

  [v10 setClientRolloutId:v11];
  int v12 = loggableFactorPackSetIdFromFactorPackSetId(v7);
  [v10 setClientFactorPackSetId:v12];

  v13 = [v8 rampId];

  if (v13)
  {
    __int16 v14 = [v8 rampId];
    [v10 setClientRampId:v14];
  }
  v15 = [v8 activeFactorPackSetId];
  if ([v7 isEqual:v15])
  {
    uint64_t v16 = [v8 activeTargetingRuleIndex];

    if (!v16) {
      goto LABEL_7;
    }
    v15 = [v8 targetedTargetingRuleIndex];
    objc_msgSend(v10, "setClientTargetingRuleGroupOrdinal:", objc_msgSend(v15, "intValue"));
  }

LABEL_7:
  return v10;
}

- (id)validateAndReturnTelemetryForDeployment:(id)a3 factorPackSetId:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TRILatencyMetricTelemetryValidator *)self rolloutDb];
  id v9 = [v8 recordWithDeployment:v6 usingTransaction:0];

  if (v9)
  {
    if ([(TRILatencyMetricTelemetryValidator *)self _isRecordContainingAllowedLoggingNamespace:v9])
    {
      v10 = [(TRILatencyMetricTelemetryValidator *)self createRolloutFieldForDeployment:v6 factorPackSetId:v7 record:v9];
      goto LABEL_8;
    }
  }
  else
  {
    v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543362;
      id v14 = v6;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Unexpected failure to find record for rollout deployment %{public}@.", (uint8_t *)&v13, 0xCu);
    }
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (TRIRolloutDatabase)rolloutDb
{
  return self->_rolloutDb;
}

- (NSSet)namespacesAllowedForLogging
{
  return self->_namespacesAllowedForLogging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespacesAllowedForLogging, 0);
  objc_storeStrong((id *)&self->_rolloutDb, 0);
}

@end