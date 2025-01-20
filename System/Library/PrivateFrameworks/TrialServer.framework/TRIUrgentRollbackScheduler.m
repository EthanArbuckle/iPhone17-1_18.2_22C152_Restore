@interface TRIUrgentRollbackScheduler
- (TRIExperimentDatabase)experimentDatabase;
- (TRITaskQueuing)queue;
- (TRIUrgentRollbackScheduler)initWithExperimentDatabase:(id)a3 taskQueue:(id)a4;
- (id)_validRollbackDeploymentsForRollbackExperiment:(id)a3 deploymentIds:(id)a4;
- (void)scheduleUrgentRollbackForExperiment:(id)a3 deploymentIds:(id)a4;
@end

@implementation TRIUrgentRollbackScheduler

- (TRIUrgentRollbackScheduler)initWithExperimentDatabase:(id)a3 taskQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIUrgentRollbackScheduler;
  v9 = [(TRIUrgentRollbackScheduler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_experimentDatabase, a3);
  }

  return v10;
}

- (id)_validRollbackDeploymentsForRollbackExperiment:(id)a3 deploymentIds:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__TRIUrgentRollbackScheduler__validRollbackDeploymentsForRollbackExperiment_deploymentIds___block_invoke;
  v16[3] = &unk_1E6BBB338;
  id v17 = v6;
  id v18 = v7;
  id v19 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = v6;
  objc_super v12 = (void *)MEMORY[0x1E016EA80](v16);
  v13 = [(TRIUrgentRollbackScheduler *)self experimentDatabase];
  [v13 enumerateActiveExperimentRecordsWithVisibility:3 block:v12];

  v14 = (void *)[v9 copy];
  return v14;
}

void __91__TRIUrgentRollbackScheduler__validRollbackDeploymentsForRollbackExperiment_deploymentIds___block_invoke(void *a1, void *a2)
{
  id v15 = a2;
  v3 = [v15 experimentDeployment];
  v4 = [v3 experimentId];
  int v5 = [v4 isEqual:a1[4]];

  id v6 = (void *)a1[5];
  id v7 = NSNumber;
  id v8 = [v15 experimentDeployment];
  id v9 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "deploymentId"));
  int v10 = [v6 containsObject:v9];

  if (v5 && v10)
  {
    id v11 = (void *)a1[6];
    objc_super v12 = NSNumber;
    v13 = [v15 experimentDeployment];
    v14 = objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "deploymentId"));
    [v11 addObject:v14];
  }
}

- (void)scheduleUrgentRollbackForExperiment:(id)a3 deploymentIds:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIUrgentRollbackScheduler.m", 53, @"Invalid parameter not satisfying: %@", @"experimentId" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"TRIUrgentRollbackScheduler.m", 54, @"Invalid parameter not satisfying: %@", @"deploymentIds" object file lineNumber description];

LABEL_3:
  [(TRIUrgentRollbackScheduler *)self _validRollbackDeploymentsForRollbackExperiment:v7 deploymentIds:v9];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:startTime:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:startTime:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v7, [*(id *)(*((void *)&v20 + 1) + 8 * i) intValue], 0, 0, 1, 0);
        id v15 = [(TRIUrgentRollbackScheduler *)self queue];
        v16 = +[TRITaskQueuingOptions optionsWithDuplicateTaskResolution:1];
        [v15 addTask:v14 options:v16];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
}

- (TRITaskQueuing)queue
{
  return self->_queue;
}

- (TRIExperimentDatabase)experimentDatabase
{
  return self->_experimentDatabase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentDatabase, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end