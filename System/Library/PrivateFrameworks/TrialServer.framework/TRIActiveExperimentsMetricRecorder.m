@interface TRIActiveExperimentsMetricRecorder
- (BOOL)_isValidCount:(int64_t)a3;
- (TRIActiveExperimentsMetricRecorder)initWithExperimentCountProvider:(id)a3 client:(id)a4;
- (TRIActiveExperimentsMetricRecorder)initWithServerContext:(id)a3;
- (TRIClient)client;
- (TRIExperimentCountProviding)experimentCountProvider;
- (id)loggableMetrics;
- (void)recordMetric;
@end

@implementation TRIActiveExperimentsMetricRecorder

- (TRIActiveExperimentsMetricRecorder)initWithExperimentCountProvider:(id)a3 client:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIActiveExperimentsMetricRecorder;
  v9 = [(TRIActiveExperimentsMetricRecorder *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_experimentCountProvider, a3);
    objc_storeStrong((id *)&v10->_client, a4);
  }

  return v10;
}

- (TRIActiveExperimentsMetricRecorder)initWithServerContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 experimentDatabase];
  v6 = [v4 client];

  id v7 = [(TRIActiveExperimentsMetricRecorder *)self initWithExperimentCountProvider:v5 client:v6];
  return v7;
}

- (BOOL)_isValidCount:(int64_t)a3
{
  return (unint64_t)a3 < 0x7FFFFFFFFFFFFFFFLL;
}

- (id)loggableMetrics
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  experimentCountProvider = self->_experimentCountProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__TRIActiveExperimentsMetricRecorder_loggableMetrics__block_invoke;
  v9[3] = &unk_1E6BB8A40;
  v9[4] = &v14;
  v9[5] = &v10;
  [(TRIExperimentCountProviding *)experimentCountProvider activeCountWithCompletion:v9];
  id v4 = objc_opt_new();
  if ([(TRIActiveExperimentsMetricRecorder *)self _isValidCount:v15[3]])
  {
    v5 = [MEMORY[0x1E4FB05A8] metricWithName:@"activeDeviceExperiments" integerValue:v15[3]];
    [v4 addObject:v5];
  }
  if ([(TRIActiveExperimentsMetricRecorder *)self _isValidCount:v11[3]])
  {
    v6 = [MEMORY[0x1E4FB05A8] metricWithName:@"activeServerExperiments" integerValue:v11[3]];
    [v4 addObject:v6];
  }
  id v7 = (void *)[v4 copy];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __53__TRIActiveExperimentsMetricRecorder_loggableMetrics__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
  return result;
}

- (void)recordMetric
{
  id v7 = [(TRIActiveExperimentsMetricRecorder *)self loggableMetrics];
  if ([v7 count])
  {
    v3 = [(TRIActiveExperimentsMetricRecorder *)self client];
    id v4 = [v3 logger];
    v5 = [(TRIActiveExperimentsMetricRecorder *)self client];
    v6 = [v5 trackingId];
    [v4 logWithTrackingId:v6 metrics:v7 dimensions:0 trialSystemTelemetry:0];
  }
}

- (TRIExperimentCountProviding)experimentCountProvider
{
  return self->_experimentCountProvider;
}

- (TRIClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_experimentCountProvider, 0);
}

@end