@interface TRIExperimentBaseTask
- (BOOL)isEqual:(id)a3;
- (TRIExperimentBaseTask)initWithExperiment:(id)a3;
- (TRIExperimentDeployment)experiment;
- (id)containerForFirstNamespaceInExperimentWithContext:(id)a3;
- (id)description;
- (id)dimensions;
- (id)metrics;
- (id)nextTasksForRunStatus:(int)a3;
- (id)tags;
- (id)trialSystemTelemetry;
- (unint64_t)hash;
- (void)addDimension:(id)a3;
- (void)addMetric:(id)a3;
- (void)logAsRollout:(BOOL)a3;
- (void)mergeTelemetry:(id)a3;
@end

@implementation TRIExperimentBaseTask

- (void)logAsRollout:(BOOL)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__TRIExperimentBaseTask_logAsRollout___block_invoke;
  v4[3] = &__block_descriptor_33_e42_v16__0__TRIExperimentBaseTaskGuardedData_8l;
  BOOL v5 = a3;
  [(_PASLock *)lock runWithLockAcquired:v4];
}

uint64_t __38__TRIExperimentBaseTask_logAsRollout___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(a2 + 32) = *(unsigned char *)(result + 32);
  return result;
}

- (TRIExperimentBaseTask)initWithExperiment:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIExperimentBaseTask.m", 55, @"Invalid parameter not satisfying: %@", @"experiment" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)TRIExperimentBaseTask;
  v6 = [(TRIExperimentBaseTask *)&v17 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    experiment = v6->_experiment;
    v6->_experiment = (TRIExperimentDeployment *)v7;

    uint64_t v9 = objc_opt_new();
    v10 = *(void **)(v9 + 8);
    *(void *)(v9 + 8) = 0;

    v11 = *(void **)(v9 + 16);
    *(void *)(v9 + 16) = 0;

    v12 = *(void **)(v9 + 24);
    *(void *)(v9 + 24) = 0;

    *(unsigned char *)(v9 + 32) = 0;
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v9];
    lock = v6->_lock;
    v6->_lock = (_PASLock *)v13;
  }
  return v6;
}

- (id)tags
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v3 = [(TRIExperimentBaseTask *)self experiment];
  v4 = [v3 taskTag];
  v9[0] = v4;
  id v5 = [(TRIExperimentBaseTask *)self experiment];
  v6 = [v5 experimentId];
  v9[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];

  return v7;
}

- (id)nextTasksForRunStatus:(int)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 3)
  {
    v4 = [(TRIExperimentBaseTask *)self experiment];
    id v5 = [v4 experimentId];
    v6 = [(TRIExperimentBaseTask *)self experiment];
    uint64_t v7 = +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v5, [v6 deploymentId], 0, 23, 0);
    v10[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)containerForFirstNamespaceInExperimentWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 experimentDatabase];
  v6 = [(TRIExperimentBaseTask *)self experiment];
  uint64_t v7 = [v5 experimentRecordWithExperimentDeployment:v6];

  if (v7)
  {
    v8 = [v7 namespaces];
    uint64_t v9 = [v8 firstObject];
    v10 = [v9 name];

    if (v10)
    {
      v11 = [v4 namespaceDatabase];
      v12 = [v11 dynamicNamespaceRecordWithNamespaceName:v10];

      if (v12)
      {
        uint64_t v13 = [v12 appContainer];
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIExperimentBaseTask *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TRIExperimentBaseTask;
    if ([(TRIBaseTask *)&v10 isEqual:v4])
    {
      id v5 = v4;
      v6 = [(TRIExperimentBaseTask *)self experiment];
      uint64_t v7 = [(TRIExperimentBaseTask *)v5 experiment];

      char v8 = [v6 isEqualToDeployment:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v13.receiver = self;
  v13.super_class = (Class)TRIExperimentBaseTask;
  unint64_t v3 = [(TRIBaseTask *)&v13 hash];
  id v4 = [(TRIExperimentBaseTask *)self experiment];
  id v5 = [v4 experimentId];
  if (v5)
  {
    v6 = [(TRIExperimentBaseTask *)self experiment];
    uint64_t v7 = [v6 experimentId];
    uint64_t v8 = [v7 hash];
  }
  else
  {
    uint64_t v8 = 0;
  }

  uint64_t v9 = [(TRIExperimentBaseTask *)self experiment];
  if ([v9 hasDeploymentId])
  {
    objc_super v10 = [(TRIExperimentBaseTask *)self experiment];
    uint64_t v11 = (int)[v10 deploymentId];
  }
  else
  {
    uint64_t v11 = -2;
  }

  return v11 + 37 * (v8 + 37 * v3);
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(TRIExperimentBaseTask *)self experiment];
  v6 = [v5 shortDesc];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%@>", v4, v6];

  return v7;
}

- (void)addMetric:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__TRIExperimentBaseTask_addMetric___block_invoke;
  v7[3] = &unk_1E6BB89C8;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __35__TRIExperimentBaseTask_addMetric___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = (void *)a2[1];
  if (!v3)
  {
    id v5 = a2;
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = (void *)a2[1];
    a2[1] = v6;

    unint64_t v3 = (void *)a2[1];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  return [v3 addObject:v8];
}

- (void)addDimension:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__TRIExperimentBaseTask_addDimension___block_invoke;
  v7[3] = &unk_1E6BB89C8;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __38__TRIExperimentBaseTask_addDimension___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = (void *)a2[2];
  if (!v3)
  {
    id v5 = a2;
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = (void *)a2[2];
    a2[2] = v6;

    unint64_t v3 = (void *)a2[2];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  return [v3 addObject:v8];
}

- (void)mergeTelemetry:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__TRIExperimentBaseTask_mergeTelemetry___block_invoke;
  v7[3] = &unk_1E6BB89C8;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __40__TRIExperimentBaseTask_mergeTelemetry___block_invoke(uint64_t a1, id *location)
{
  id v5 = location[3];
  id v4 = location + 3;
  unint64_t v3 = v5;
  if (v5) {
    [v3 mergeFrom:*(void *)(a1 + 32)];
  }
  else {
    objc_storeStrong(v4, *(id *)(a1 + 32));
  }
}

- (id)metrics
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__3;
  objc_super v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__TRIExperimentBaseTask_metrics__block_invoke;
  v5[3] = &unk_1E6BB89F0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void *__32__TRIExperimentBaseTask_metrics__block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a2 + 8);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [result copy];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)dimensions
{
  id v3 = (void *)MEMORY[0x1E016E7F0](self, a2);
  id v4 = [(TRIExperimentBaseTask *)self experiment];
  if (v4)
  {
    uint64_t v9 = 0;
    objc_super v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__3;
    objc_super v13 = __Block_byref_object_dispose__3;
    id v14 = (id)MEMORY[0x1E4F1CBF0];
    lock = self->_lock;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __35__TRIExperimentBaseTask_dimensions__block_invoke;
    v8[3] = &unk_1E6BB89F0;
    v8[4] = &v9;
    [(_PASLock *)lock runWithLockAcquired:v8];
    id v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __35__TRIExperimentBaseTask_dimensions__block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    uint64_t v2 = result;
    *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 40) = objc_msgSend(*(id *)(*(void *)(*(void *)(result + 32) + 8) + 40), "arrayByAddingObjectsFromArray:");
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)trialSystemTelemetry
{
  id v3 = (void *)MEMORY[0x1E016E7F0](self, a2);
  id v4 = [(TRIExperimentBaseTask *)self experiment];
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__TRIExperimentBaseTask_trialSystemTelemetry__block_invoke;
  void v9[3] = &unk_1E6BB8A18;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(_PASLock *)lock runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__TRIExperimentBaseTask_trialSystemTelemetry__block_invoke(uint64_t a1, void *a2)
{
  objc_super v13 = a2;
  id v3 = (void *)v13[3];
  if (v3) {
    uint64_t v4 = [v3 copy];
  }
  else {
    uint64_t v4 = objc_opt_new();
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if ([*(id *)(a1 + 32) hasDeploymentId])
  {
    id v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
    uint64_t v8 = [v7 stringValue];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setClientDeploymentId:v8];
  }
  int v9 = *((unsigned __int8 *)v13 + 32);
  id v10 = [*(id *)(a1 + 32) experimentId];
  uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v9)
  {
    uint64_t v12 = [v11 ensureRolloutFields];
    [v12 setClientRolloutId:v10];
  }
  else
  {
    uint64_t v12 = [v11 ensureExperimentFields];
    [v12 setClientExperimentId:v10];
  }
}

- (TRIExperimentDeployment)experiment
{
  return self->_experiment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end