@interface TRIExperimentTaskSupport
- (TRIExperimentDeployment)experimentDeployment;
- (TRIExperimentTaskSupport)initWithExperimentDeployment:(id)a3;
- (id)dimensions;
- (id)metrics;
- (id)tags;
- (id)trialSystemTelemetry;
- (void)addDimension:(id)a3;
- (void)addMetric:(id)a3;
- (void)mergeTelemetry:(id)a3;
- (void)setIdentifyTelemetryAsV1Rollout:(BOOL)a3;
@end

@implementation TRIExperimentTaskSupport

- (TRIExperimentTaskSupport)initWithExperimentDeployment:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TRIExperimentTaskSupport;
  v6 = [(TRIExperimentTaskSupport *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_experimentDeployment, a3);
    uint64_t v8 = objc_opt_new();
    v9 = *(void **)(v8 + 8);
    *(void *)(v8 + 8) = 0;

    v10 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = 0;

    *(unsigned char *)(v8 + 32) = 0;
    uint64_t v11 = objc_opt_new();
    v12 = *(void **)(v8 + 24);
    *(void *)(v8 + 24) = v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v8];
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v13;
  }
  return v7;
}

- (id)tags
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [(TRIExperimentDeployment *)self->_experimentDeployment taskTag];
  v7[0] = v3;
  v4 = [(TRIExperimentDeployment *)self->_experimentDeployment experimentId];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (void)setIdentifyTelemetryAsV1Rollout:(BOOL)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__TRIExperimentTaskSupport_setIdentifyTelemetryAsV1Rollout___block_invoke;
  v4[3] = &__block_descriptor_33_e45_v16__0__TRIExperimentTaskSupportGuardedData_8l;
  BOOL v5 = a3;
  [(_PASLock *)lock runWithLockAcquired:v4];
}

uint64_t __60__TRIExperimentTaskSupport_setIdentifyTelemetryAsV1Rollout___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(a2 + 32) = *(unsigned char *)(result + 32);
  return result;
}

- (void)addMetric:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__TRIExperimentTaskSupport_addMetric___block_invoke;
  void v7[3] = &unk_1E6BB8700;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __38__TRIExperimentTaskSupport_addMetric___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)a2[1];
  if (!v3)
  {
    BOOL v5 = a2;
    uint64_t v6 = objc_opt_new();
    v7 = (void *)a2[1];
    a2[1] = v6;

    v3 = (void *)a2[1];
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
  v7[2] = __41__TRIExperimentTaskSupport_addDimension___block_invoke;
  void v7[3] = &unk_1E6BB8700;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __41__TRIExperimentTaskSupport_addDimension___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)a2[2];
  if (!v3)
  {
    BOOL v5 = a2;
    uint64_t v6 = objc_opt_new();
    v7 = (void *)a2[2];
    a2[2] = v6;

    v3 = (void *)a2[2];
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
  v7[2] = __43__TRIExperimentTaskSupport_mergeTelemetry___block_invoke;
  void v7[3] = &unk_1E6BB8700;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __43__TRIExperimentTaskSupport_mergeTelemetry___block_invoke(uint64_t a1, id *location)
{
  id v5 = location[3];
  id v4 = location + 3;
  v3 = v5;
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
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__TRIExperimentTaskSupport_metrics__block_invoke;
  v5[3] = &unk_1E6BB8728;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void *__35__TRIExperimentTaskSupport_metrics__block_invoke(uint64_t a1, uint64_t a2)
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
  id v4 = objc_opt_new();
  lock = self->_lock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__TRIExperimentTaskSupport_dimensions__block_invoke;
  v10[3] = &unk_1E6BB8700;
  id v11 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v10];
  if ([v6 count]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
}

uint64_t __38__TRIExperimentTaskSupport_dimensions__block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 16)) {
    return objc_msgSend(*(id *)(result + 32), "addObjectsFromArray:");
  }
  return result;
}

- (id)trialSystemTelemetry
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__TRIExperimentTaskSupport_trialSystemTelemetry__block_invoke;
  v5[3] = &unk_1E6BB8750;
  v5[4] = self;
  void v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__TRIExperimentTaskSupport_trialSystemTelemetry__block_invoke(uint64_t a1, void *a2)
{
  v10 = a2;
  id v3 = (void *)v10[3];
  if (v3) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  }
  if ([*(id *)(*(void *)(a1 + 32) + 16) hasDeploymentId])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "deploymentId"));
    id v5 = [v4 stringValue];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setClientDeploymentId:v5];
  }
  int v6 = *((unsigned __int8 *)v10 + 32);
  v7 = [*(id *)(*(void *)(a1 + 32) + 16) experimentId];
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v6)
  {
    v9 = [v8 ensureRolloutFields];
    [v9 setClientRolloutId:v7];
  }
  else
  {
    v9 = [v8 ensureExperimentFields];
    [v9 setClientExperimentId:v7];
  }
}

- (TRIExperimentDeployment)experimentDeployment
{
  return self->_experimentDeployment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentDeployment, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end