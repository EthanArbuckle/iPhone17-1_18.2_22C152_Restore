@interface TRIDownloadLatencyTaskResultTelemetryBuilder
- (NSMutableDictionary)telemetryForDeployment;
- (TRIDownloadLatencyTaskResultTelemetryBuilder)initWithTelemetryValidator:(id)a3;
- (TRILatencyMetricTelemetryValidating)validator;
- (id)builtTelemetry;
- (void)_handleActivationTask:(id)a3 runResult:(id)a4;
- (void)_handleFetchTask:(id)a3 runResult:(id)a4;
- (void)_updateBuiltTelemetryWithDeployment:(id)a3 rolloutFields:(id)a4 downloadStatus:(int)a5;
- (void)updateWithTask:(id)a3 runResult:(id)a4;
@end

@implementation TRIDownloadLatencyTaskResultTelemetryBuilder

- (TRIDownloadLatencyTaskResultTelemetryBuilder)initWithTelemetryValidator:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIDownloadLatencyTaskResultTelemetryBuilder;
  v6 = [(TRIDownloadLatencyTaskResultTelemetryBuilder *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_validator, a3);
    uint64_t v8 = objc_opt_new();
    telemetryForDeployment = v7->_telemetryForDeployment;
    v7->_telemetryForDeployment = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (void)updateWithTask:(id)a3 runResult:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(TRIDownloadLatencyTaskResultTelemetryBuilder *)self _handleActivationTask:v7 runResult:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(TRIDownloadLatencyTaskResultTelemetryBuilder *)self _handleFetchTask:v7 runResult:v6];
    }
  }
}

- (void)_handleActivationTask:(id)a3 runResult:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 deployment];
  validator = self->_validator;
  v10 = [v6 deployment];
  objc_super v11 = [v6 factorPackSetId];
  v12 = [(TRILatencyMetricTelemetryValidating *)validator validateAndReturnTelemetryForDeployment:v10 factorPackSetId:v11];

  if (v12)
  {
    if ([v7 reportResultToServer]) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 2;
    }
    [(TRIDownloadLatencyTaskResultTelemetryBuilder *)self _updateBuiltTelemetryWithDeployment:v8 rolloutFields:v12 downloadStatus:v13];
  }
  else
  {
    v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = 138543362;
      id v16 = v6;
      _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_INFO, "Skipping immediate download telemetry for task %{public}@ (likely because the namespace descriptor has not opted in)", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_handleFetchTask:(id)a3 runResult:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 rolloutDeployment];
  if (v8)
  {
    validator = self->_validator;
    v10 = [v6 rolloutDeployment];
    objc_super v11 = [v6 factorPackSetId];
    v12 = [(TRILatencyMetricTelemetryValidating *)validator validateAndReturnTelemetryForDeployment:v10 factorPackSetId:v11];

    if (v12)
    {
      if ([v7 runStatus] == 2) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = 3;
      }
      [(TRIDownloadLatencyTaskResultTelemetryBuilder *)self _updateBuiltTelemetryWithDeployment:v8 rolloutFields:v12 downloadStatus:v13];
    }
    else
    {
      v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = 138543362;
        id v16 = v6;
        _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_INFO, "Skipping immediate download telemetry for task %{public}@ (likely because the namespace descriptor has not opted in)", (uint8_t *)&v15, 0xCu);
      }
    }
  }
}

- (void)_updateBuiltTelemetryWithDeployment:(id)a3 rolloutFields:(id)a4 downloadStatus:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v17 = a3;
  id v8 = a4;
  v9 = [(TRIDownloadLatencyTaskResultTelemetryBuilder *)self telemetryForDeployment];
  v10 = [v9 objectForKeyedSubscript:v17];

  if (!v10)
  {
    objc_super v11 = objc_opt_new();
    v12 = [(TRIDownloadLatencyTaskResultTelemetryBuilder *)self telemetryForDeployment];
    [v12 setObject:v11 forKeyedSubscript:v17];
  }
  uint64_t v13 = [(TRIDownloadLatencyTaskResultTelemetryBuilder *)self telemetryForDeployment];
  v14 = [v13 objectForKeyedSubscript:v17];

  int v15 = objc_opt_new();
  [v14 setDownloadStatusFields:v15];

  id v16 = [v14 downloadStatusFields];
  [v16 setStatus:v5];

  [v14 setRolloutFields:v8];
}

- (id)builtTelemetry
{
  v2 = [(TRIDownloadLatencyTaskResultTelemetryBuilder *)self telemetryForDeployment];
  v3 = [v2 allValues];

  return v3;
}

- (TRILatencyMetricTelemetryValidating)validator
{
  return self->_validator;
}

- (NSMutableDictionary)telemetryForDeployment
{
  return self->_telemetryForDeployment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryForDeployment, 0);
  objc_storeStrong((id *)&self->_validator, 0);
}

@end