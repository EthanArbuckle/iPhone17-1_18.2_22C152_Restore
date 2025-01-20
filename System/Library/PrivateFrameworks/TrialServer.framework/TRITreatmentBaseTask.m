@interface TRITreatmentBaseTask
- (BOOL)isEqual:(id)a3;
- (NSString)treatmentId;
- (TRITaskAttributing)taskAttributing;
- (TRITreatmentBaseTask)initWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5;
- (id)description;
- (id)dimensions;
- (id)metrics;
- (id)trialSystemTelemetry;
- (unint64_t)hash;
@end

@implementation TRITreatmentBaseTask

- (TRITreatmentBaseTask)initWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TRITreatmentBaseTask.m", 27, @"Invalid parameter not satisfying: %@", @"experiment" object file lineNumber description];
  }
  if ([v9 hasDeploymentId])
  {
    if (v10) {
      goto LABEL_5;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRITreatmentBaseTask.m", 28, @"Invalid parameter not satisfying: %@", @"experiment.hasDeploymentId" object file lineNumber description];

    if (v10) {
      goto LABEL_5;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"TRITreatmentBaseTask.m", 29, @"Invalid parameter not satisfying: %@", @"treatmentId" object file lineNumber description];

LABEL_5:
  v18.receiver = self;
  v18.super_class = (Class)TRITreatmentBaseTask;
  v12 = [(TRIExperimentBaseTask *)&v18 initWithExperiment:v9];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_treatmentId, a4);
    objc_storeStrong((id *)&v13->_taskAttributing, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TRITreatmentBaseTask *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TRITreatmentBaseTask;
    if ([(TRIExperimentBaseTask *)&v13 isEqual:v4])
    {
      v5 = v4;
      v6 = [(TRITreatmentBaseTask *)self treatmentId];
      v7 = [(TRITreatmentBaseTask *)v5 treatmentId];
      int v8 = [v6 isEqual:v7];

      if (v8)
      {
        id v9 = [(TRITreatmentBaseTask *)self taskAttributing];
        id v10 = [(TRITreatmentBaseTask *)v5 taskAttributing];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)TRITreatmentBaseTask;
  unint64_t v3 = [(TRIExperimentBaseTask *)&v10 hash];
  v4 = [(TRITreatmentBaseTask *)self treatmentId];
  if (v4)
  {
    v5 = [(TRITreatmentBaseTask *)self treatmentId];
    uint64_t v6 = [v5 hash];
  }
  else
  {
    uint64_t v6 = 0;
  }

  v7 = [(TRITreatmentBaseTask *)self taskAttributing];
  unint64_t v8 = [v7 hash] + 37 * (v6 + 37 * v3);

  return v8;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(TRIExperimentBaseTask *)self experiment];
  uint64_t v6 = [v5 shortDesc];
  v7 = [(TRITreatmentBaseTask *)self treatmentId];
  unint64_t v8 = [(TRITreatmentBaseTask *)self taskAttributing];
  id v9 = [v8 applicationBundleIdentifier];
  objc_super v10 = [v3 stringWithFormat:@"<%@:%@,%@,%@>", v4, v6, v7, v9];

  return v10;
}

- (id)metrics
{
  return 0;
}

- (id)dimensions
{
  v2 = (void *)MEMORY[0x1E4F1CA48];
  v10.receiver = self;
  v10.super_class = (Class)TRITreatmentBaseTask;
  uint64_t v3 = [(TRIExperimentBaseTask *)&v10 dimensions];
  uint64_t v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v6 = [v2 arrayWithArray:v5];

  if ([v6 count]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (id)trialSystemTelemetry
{
  v9.receiver = self;
  v9.super_class = (Class)TRITreatmentBaseTask;
  uint64_t v3 = [(TRIExperimentBaseTask *)&v9 trialSystemTelemetry];
  if (!v3) {
    uint64_t v3 = objc_opt_new();
  }
  uint64_t v4 = [(TRITreatmentBaseTask *)self treatmentId];
  uint64_t v5 = [v3 ensureExperimentFields];
  [v5 setClientTreatmentId:v4];

  uint64_t v6 = [(TRITreatmentBaseTask *)self taskAttributing];
  v7 = +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:v6];

  [v3 mergeFrom:v7];
  return v3;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (TRITaskAttributing)taskAttributing
{
  return self->_taskAttributing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskAttributing, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
}

@end