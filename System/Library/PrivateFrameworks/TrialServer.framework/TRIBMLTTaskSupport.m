@interface TRIBMLTTaskSupport
- (TRIBMLTDeployment)bmltDeployment;
- (TRIBMLTTaskSupport)initWithBMLTDeployment:(id)a3;
- (id)dimensions;
- (id)metrics;
- (id)tags;
- (id)trialSystemTelemetry;
- (void)addDimension:(id)a3;
- (void)addMetric:(id)a3;
- (void)mergeTelemetry:(id)a3;
@end

@implementation TRIBMLTTaskSupport

- (TRIBMLTTaskSupport)initWithBMLTDeployment:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TRIBMLTTaskSupport;
  v6 = [(TRIBMLTTaskSupport *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bmltDeployment, a3);
    v8 = objc_opt_new();
    v9 = (void *)v8[1];
    v8[1] = 0;

    v10 = (void *)v8[2];
    v8[2] = 0;

    v11 = (void *)v8[3];
    v8[3] = 0;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v8];
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v12;
  }
  return v7;
}

- (id)tags
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [(TRIBMLTDeployment *)self->_bmltDeployment taskTag];
  v7[0] = v3;
  v4 = [(TRIBMLTDeployment *)self->_bmltDeployment backgroundMLTaskId];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (void)addMetric:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__TRIBMLTTaskSupport_addMetric___block_invoke;
  void v7[3] = &unk_1E6BB87F0;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __32__TRIBMLTTaskSupport_addMetric___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)a2[1];
  if (!v3)
  {
    id v5 = a2;
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
  v7[2] = __35__TRIBMLTTaskSupport_addDimension___block_invoke;
  void v7[3] = &unk_1E6BB87F0;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __35__TRIBMLTTaskSupport_addDimension___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)a2[2];
  if (!v3)
  {
    id v5 = a2;
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
  v7[2] = __37__TRIBMLTTaskSupport_mergeTelemetry___block_invoke;
  void v7[3] = &unk_1E6BB87F0;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __37__TRIBMLTTaskSupport_mergeTelemetry___block_invoke(uint64_t a1, id *location)
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
  v5[2] = __29__TRIBMLTTaskSupport_metrics__block_invoke;
  v5[3] = &unk_1E6BB8818;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void *__29__TRIBMLTTaskSupport_metrics__block_invoke(uint64_t a1, uint64_t a2)
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
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__TRIBMLTTaskSupport_dimensions__block_invoke;
  v8[3] = &unk_1E6BB87F0;
  id v6 = v4;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v8];

  return v6;
}

uint64_t __32__TRIBMLTTaskSupport_dimensions__block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 16)) {
    return objc_msgSend(*(id *)(result + 32), "addObjectsFromArray:");
  }
  return result;
}

- (id)trialSystemTelemetry
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  id v11 = __Block_byref_object_dispose__2;
  id v12 = objc_alloc_init(MEMORY[0x1E4FB0648]);
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__TRIBMLTTaskSupport_trialSystemTelemetry__block_invoke;
  v6[3] = &unk_1E6BB8840;
  v6[4] = self;
  v6[5] = &v7;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v4 = (void *)[(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__TRIBMLTTaskSupport_trialSystemTelemetry__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 24)) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "mergeFrom:");
  }
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) backgroundMLTaskId];
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) ensureBMLTFields];
  [v4 setClientBmltId:v3];

  objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "deploymentId"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v6 stringValue];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setClientDeploymentId:v5];
}

- (TRIBMLTDeployment)bmltDeployment
{
  return self->_bmltDeployment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bmltDeployment, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end