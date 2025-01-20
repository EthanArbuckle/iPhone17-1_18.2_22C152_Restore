@interface PMLPlanSimulator
+ (id)simulatorWithDbPaths:(id)a3 sessionDescriptor:(id)a4 sessionsInBatch:(unint64_t)a5 maxSessionsLimit:(unint64_t)a6 seed:(unint64_t)a7;
- (PMLPlanSimulator)initWithStores:(id)a3 sessionDescriptor:(id)a4 seed:(unint64_t)a5;
- (id)_randomStore;
- (id)_randomStores:(unint64_t)a3;
- (id)runParallelPlansWithPlanId:(id)a3 tracker:(id)a4 noiseScaleFactors:(id)a5 noiseMinimumMagnitude:(float)a6 weights:(id)a7 serverIteration:(unint64_t)a8 useIntercept:(BOOL)a9 noiseMechanism:(int64_t)a10 usingRandomlySelected:(unint64_t)a11;
@end

@implementation PMLPlanSimulator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rng, 0);
  objc_storeStrong((id *)&self->_sessionDescriptor, 0);
  objc_storeStrong((id *)&self->_stores, 0);
}

- (id)runParallelPlansWithPlanId:(id)a3 tracker:(id)a4 noiseScaleFactors:(id)a5 noiseMinimumMagnitude:(float)a6 weights:(id)a7 serverIteration:(unint64_t)a8 useIntercept:(BOOL)a9 noiseMechanism:(int64_t)a10 usingRandomlySelected:(unint64_t)a11
{
  float var1 = a5.var1;
  float var0 = a5.var0;
  id v19 = a3;
  id v20 = a4;
  id v21 = a7;
  v22 = [(PMLPlanSimulator *)self _randomStores:a11];
  v23 = objc_opt_new();
  v24 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __169__PMLPlanSimulator_runParallelPlansWithPlanId_tracker_noiseScaleFactors_noiseMinimumMagnitude_weights_serverIteration_useIntercept_noiseMechanism_usingRandomlySelected___block_invoke;
  block[3] = &unk_26459E990;
  float v43 = var0;
  float v44 = var1;
  float v45 = a6;
  unint64_t v41 = a8;
  int64_t v42 = a10;
  id v35 = v22;
  id v36 = v20;
  id v37 = v19;
  v38 = self;
  id v39 = v21;
  BOOL v46 = a9;
  id v25 = v23;
  id v40 = v25;
  id v26 = v21;
  id v27 = v19;
  id v28 = v20;
  id v29 = v22;
  dispatch_apply(a11, v24, block);

  v30 = v40;
  id v31 = v25;

  return v31;
}

void __169__PMLPlanSimulator_runParallelPlansWithPlanId_tracker_noiseScaleFactors_noiseMinimumMagnitude_weights_serverIteration_useIntercept_noiseMechanism_usingRandomlySelected___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)MEMORY[0x223C7E5C0]();
  v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v6 = (a2 + *(_DWORD *)(a1 + 80) + 1);
  v7 = [PMLDiffPrivacyNoiseStrategy alloc];
  LODWORD(v8) = *(_DWORD *)(a1 + 100);
  LODWORD(v9) = *(_DWORD *)(a1 + 104);
  LODWORD(v10) = *(_DWORD *)(a1 + 96);
  v11 = -[PMLDiffPrivacyNoiseStrategy initWithMaxIterationCount:noiseScaleFactors:minimumMagnitude:seed:noiseMechanism:inplaceNorm:](v7, "initWithMaxIterationCount:noiseScaleFactors:minimumMagnitude:seed:noiseMechanism:inplaceNorm:", 1, v6, *(void *)(a1 + 88), 0, v10, v8, v9);
  v12 = [PMLLogRegTrainingPlan alloc];
  LOBYTE(v19) = 1;
  BYTE2(v18) = *(unsigned char *)(a1 + 108);
  LOWORD(v18) = 0;
  LODWORD(v13) = 1017370378;
  LODWORD(v14) = 953267991;
  v15 = -[PMLLogRegTrainingPlan initWithStore:tracker:noiseStrategy:planId:sessionDescriptor:maxSessionsLimit:sessionsInBatch:currentServerIteration:currentModelWeights:localLearningRate:stoppingThreshold:localMinimumIterations:localGradientIterations:useOnlyAppleInternalSessions:skew:threshold:isMultiLabel:intercept:positiveLabel:evaluationLevel:reportScale:](v12, "initWithStore:tracker:noiseStrategy:planId:sessionDescriptor:maxSessionsLimit:sessionsInBatch:currentServerIteration:currentModelWeights:localLearningRate:stoppingThreshold:localMinimumIterations:localGradientIterations:useOnlyAppleInternalSessions:skew:threshold:isMultiLabel:intercept:positiveLabel:evaluationLevel:reportScale:", v5, *(void *)(a1 + 40), v11, *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 56) + 16), 1, v13, v14, 0.0, 0.5, 1, *(void *)(a1 + 80), *(void *)(a1 + 64), 100, 1,
          v18,
          1,
          2,
          v19);
  v16 = [(PMLLogRegTrainingPlan *)v15 runWithError:0];
  if (v16)
  {
    id v17 = *(id *)(a1 + 72);
    objc_sync_enter(v17);
    [*(id *)(a1 + 72) addObject:v16];
    objc_sync_exit(v17);
  }
}

- (id)_randomStores:(unint64_t)a3
{
  for (i = objc_opt_new(); a3; --a3)
  {
    uint64_t v6 = [(PMLPlanSimulator *)self _randomStore];
    [i addObject:v6];
  }
  return i;
}

- (id)_randomStore
{
  unint64_t v3 = [(_PASRng *)self->_rng next];
  unint64_t v4 = v3 % [(NSArray *)self->_stores count];
  stores = self->_stores;
  return [(NSArray *)stores objectAtIndexedSubscript:v4];
}

- (PMLPlanSimulator)initWithStores:(id)a3 sessionDescriptor:(id)a4 seed:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PMLPlanSimulator;
  v11 = [(PMLPlanSimulator *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_stores, a3);
    objc_storeStrong((id *)&v12->_sessionDescriptor, a4);
    uint64_t v13 = [objc_alloc(MEMORY[0x263F61E88]) initWithSeed:a5];
    rng = v12->_rng;
    v12->_rng = (_PASRng *)v13;
  }
  return v12;
}

+ (id)simulatorWithDbPaths:(id)a3 sessionDescriptor:(id)a4 sessionsInBatch:(unint64_t)a5 maxSessionsLimit:(unint64_t)a6 seed:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  if (![v13 count])
  {
    id v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"PMLPlanSimulator.m", 91, @"Can't instantiate simulator, need at least one db file." object file lineNumber description];
  }
  if (a5 != a6)
  {
    id v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2 object:a1 file:@"PMLPlanSimulator.m" lineNumber:92 description:@"Multiple batches not supported in simulation."];
  }
  v15 = objc_opt_new();
  size_t v16 = [v13 count];
  id v17 = dispatch_get_global_queue(33, 0);
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  id v31 = __97__PMLPlanSimulator_simulatorWithDbPaths_sessionDescriptor_sessionsInBatch_maxSessionsLimit_seed___block_invoke;
  v32 = &unk_26459E968;
  id v18 = v13;
  id v33 = v18;
  SEL v36 = a2;
  id v37 = a1;
  id v19 = v14;
  id v34 = v19;
  unint64_t v38 = a6;
  id v20 = v15;
  id v35 = v20;
  dispatch_apply(v16, v17, &v29);

  id v21 = objc_opt_new();
  if (objc_msgSend(v18, "count", v29, v30, v31, v32))
  {
    unint64_t v22 = 0;
    do
    {
      v23 = [NSNumber numberWithUnsignedInteger:v22];
      v24 = [v20 objectForKeyedSubscript:v23];
      [v21 addObject:v24];

      ++v22;
    }
    while (v22 < [v18 count]);
  }
  id v25 = (void *)[objc_alloc((Class)a1) initWithStores:v21 sessionDescriptor:v19 seed:a7];

  return v25;
}

void __97__PMLPlanSimulator_simulatorWithDbPaths_sessionDescriptor_sessionsInBatch_maxSessionsLimit_seed___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)MEMORY[0x223C7E5C0]();
  v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  char v7 = [v6 fileExistsAtPath:v5];

  if ((v7 & 1) == 0)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 64), @"PMLPlanSimulator.m", 98, @"Can't instantiate simulator, no db at %@", v5 object file lineNumber description];
  }
  double v8 = [[PMLTrainingStore alloc] initWithPath:v5];
  id v9 = +[PMLInMemoryCachedStore cachedStoreFromRealStore:v8 sessionDescriptor:*(void *)(a1 + 40) sessionsLimit:*(void *)(a1 + 72)];
  id v10 = *(id *)(a1 + 48);
  objc_sync_enter(v10);
  v11 = *(void **)(a1 + 48);
  v12 = [NSNumber numberWithUnsignedLong:a2];
  [v11 setObject:v9 forKeyedSubscript:v12];

  objc_sync_exit(v10);
}

@end