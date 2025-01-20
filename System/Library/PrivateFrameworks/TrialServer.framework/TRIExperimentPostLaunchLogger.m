@interface TRIExperimentPostLaunchLogger
- (TRIClient)client;
- (TRIExperimentPostLaunchLogger)initWithClient:(id)a3;
- (id)_metricForEvent:(id)a3;
- (void)logExperimentPostLaunchEvent:(id)a3;
@end

@implementation TRIExperimentPostLaunchLogger

- (TRIExperimentPostLaunchLogger)initWithClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIExperimentPostLaunchLogger;
  v6 = [(TRIExperimentPostLaunchLogger *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v7;
}

- (id)_metricForEvent:(id)a3
{
  id v3 = a3;
  v4 = [v3 experimentStateName];
  if (v4)
  {
    id v5 = [v3 errorOrDeactivationReason];

    v6 = (void *)MEMORY[0x1E4FB05A8];
    if (v5)
    {
      v7 = [v3 errorOrDeactivationReason];
      v8 = [v6 metricWithName:v4 categoricalValue:v7];
    }
    else
    {
      v8 = [MEMORY[0x1E4FB05A8] metricWithName:v4];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)logExperimentPostLaunchEvent:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TRIExperimentPostLaunchLogger.m", 46, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v6 = [(TRIExperimentPostLaunchLogger *)self _metricForEvent:v5];
  if (v6)
  {
    v7 = objc_opt_new();
    v8 = [v5 treatmentTriple];
    objc_super v9 = [v8 experimentId];
    uint64_t v10 = [v7 ensureExperimentFields];
    [(id)v10 setClientExperimentId:v9];

    v11 = [v8 treatmentId];
    LOBYTE(v10) = [v11 isEqual:@"unspecified-or-default-treatment"];

    if ((v10 & 1) == 0)
    {
      v12 = [v8 treatmentId];
      v13 = [v7 ensureExperimentFields];
      [v13 setClientTreatmentId:v12];
    }
    v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "deploymentId"));
    v15 = [v14 stringValue];
    [v7 setClientDeploymentId:v15];

    v16 = TRIDeploymentEnvironment_EnumDescriptor();
    v17 = objc_msgSend(v16, "textFormatNameForValue:", objc_msgSend(v5, "deploymentEnvironment"));

    if (!v17) {
      v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", (int)objc_msgSend(v5, "deploymentEnvironment"));
    }
    [v7 setClientDeploymentEnv:v17];
    v18 = [v5 additionalTelemetry];

    if (v18)
    {
      v19 = [v5 additionalTelemetry];
      [v7 mergeFrom:v19];
    }
    v20 = [(TRIExperimentPostLaunchLogger *)self client];
    v21 = [v20 logger];
    v22 = [(TRIExperimentPostLaunchLogger *)self client];
    v23 = [v22 trackingId];
    v26[0] = v6;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    [v21 logWithTrackingId:v23 metrics:v24 dimensions:0 trialSystemTelemetry:v7];
  }
}

- (TRIClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
}

@end