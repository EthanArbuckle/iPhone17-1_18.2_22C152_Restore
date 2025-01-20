@interface PBFMutablePosterExtensionDataStorePrewarmPlan
- (void)appendPrewarmPhase:(id)a3;
- (void)removePrewarmPhase:(id)a3;
- (void)setExecutionBlock:(id)a3 forPhase:(id)a4;
- (void)setTimeoutInterval:(double)a3 forPhase:(id)a4;
@end

@implementation PBFMutablePosterExtensionDataStorePrewarmPlan

- (void)appendPrewarmPhase:(id)a3
{
  id v12 = a3;
  v4 = [(PBFPosterExtensionDataStorePrewarmPlan *)self prewarmPhasePlan];
  char v5 = [v4 containsObject:v12];

  if ((v5 & 1) == 0)
  {
    v6 = [(PBFPosterExtensionDataStorePrewarmPlan *)self prewarmPhasePlan];
    v7 = (void *)[v6 mutableCopy];
    v8 = v7;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = (id)objc_opt_new();
    }
    v10 = v9;

    [v10 addObject:v12];
    v11 = (void *)[v10 copy];
    [(PBFPosterExtensionDataStorePrewarmPlan *)self setPrewarmPhasePlan:v11];
  }
}

- (void)removePrewarmPhase:(id)a3
{
  id v9 = a3;
  v4 = [(PBFPosterExtensionDataStorePrewarmPlan *)self prewarmPhasePlan];
  int v5 = [v4 containsObject:v9];

  if (v5)
  {
    v6 = [(PBFPosterExtensionDataStorePrewarmPlan *)self prewarmPhasePlan];
    v7 = (void *)[v6 mutableCopy];

    [v7 removeObject:v9];
    v8 = (void *)[v7 copy];
    [(PBFPosterExtensionDataStorePrewarmPlan *)self setPrewarmPhasePlan:v8];
  }
}

- (void)setTimeoutInterval:(double)a3 forPhase:(id)a4
{
  id v12 = a4;
  v6 = [(PBFPosterExtensionDataStorePrewarmPlan *)self phaseToPrewarmTimeout];
  v7 = (void *)[v6 mutableCopy];
  v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  v10 = v9;

  if (a3 >= 0.0)
  {
    v11 = [NSNumber numberWithDouble:a3];
    [v10 setObject:v11 forKeyedSubscript:v12];
  }
  else
  {
    [v10 removeObjectForKey:v12];
  }
  [(PBFPosterExtensionDataStorePrewarmPlan *)self setPhaseToPrewarmTimeout:v10];
}

- (void)setExecutionBlock:(id)a3 forPhase:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = [(PBFPosterExtensionDataStorePrewarmPlan *)self phaseToExecutionBlock];
  v8 = (void *)[v7 mutableCopy];
  id v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  v11 = v10;

  if (v14)
  {
    id v12 = (void *)[v14 copy];
    v13 = _Block_copy(v12);
    [v11 setObject:v13 forKeyedSubscript:v6];
  }
  else
  {
    [v11 removeObjectForKey:v6];
  }
  [(PBFPosterExtensionDataStorePrewarmPlan *)self setPhaseToExecutionBlock:v11];
}

@end