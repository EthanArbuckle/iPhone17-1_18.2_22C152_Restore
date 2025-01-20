@interface PMLMetaTrainingVariables
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMetaTrainingVariables:(id)a3;
- (BOOL)reportScale;
- (BOOL)summableMetricsOnly;
- (NSArray)labelsToTrainOn;
- (NSString)planId;
- (PMLMetaTrainingVariables)initWithPlanId:(id)a3 store:(id)a4 noiseStrategy:(id)a5 sessionDescriptor:(id)a6 maxSessionsToTrainOn:(unint64_t)a7 trainingSetSize:(unint64_t)a8 labelsToTrainOn:(id)a9 currentServerIteration:(unint64_t)a10 lossThresholdForStopping:(double)a11 epochsPerBatch:(unint64_t)a12 probThreshold:(double)a13 evaluationLevel:(unint64_t)a14 reportScale:(BOOL)a15 summableMetricsOnly:(BOOL)a16;
- (PMLMetaTrainingVariables)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (PMLNoiseStrategy)noiseStrategy;
- (PMLSessionDescriptor)sessionDescriptor;
- (PMLTrainingStore)store;
- (double)lossThresholdForStopping;
- (double)probThreshold;
- (id)toPlistWithChunks:(id)a3;
- (unint64_t)currentServerIteration;
- (unint64_t)epochsPerBatch;
- (unint64_t)evaluationLevel;
- (unint64_t)maxSessionsToTrainOn;
- (unint64_t)trainingSetSize;
@end

@implementation PMLMetaTrainingVariables

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsToTrainOn, 0);
  objc_storeStrong((id *)&self->_sessionDescriptor, 0);
  objc_storeStrong((id *)&self->_noiseStrategy, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_planId, 0);
}

- (BOOL)summableMetricsOnly
{
  return self->_summableMetricsOnly;
}

- (BOOL)reportScale
{
  return self->_reportScale;
}

- (unint64_t)evaluationLevel
{
  return self->_evaluationLevel;
}

- (double)probThreshold
{
  return self->_probThreshold;
}

- (unint64_t)epochsPerBatch
{
  return self->_epochsPerBatch;
}

- (double)lossThresholdForStopping
{
  return self->_lossThresholdForStopping;
}

- (unint64_t)currentServerIteration
{
  return self->_currentServerIteration;
}

- (NSArray)labelsToTrainOn
{
  return self->_labelsToTrainOn;
}

- (unint64_t)trainingSetSize
{
  return self->_trainingSetSize;
}

- (unint64_t)maxSessionsToTrainOn
{
  return self->_maxSessionsToTrainOn;
}

- (PMLSessionDescriptor)sessionDescriptor
{
  return self->_sessionDescriptor;
}

- (PMLNoiseStrategy)noiseStrategy
{
  return self->_noiseStrategy;
}

- (PMLTrainingStore)store
{
  return self->_store;
}

- (NSString)planId
{
  return self->_planId;
}

- (id)toPlistWithChunks:(id)a3
{
  v23[14] = *MEMORY[0x263EF8340];
  v23[0] = self->_planId;
  v22[0] = @"PLAN_ID";
  v22[1] = @"NOISE_STRATEGY_TYPE";
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v5);
  v23[1] = v21;
  v22[2] = @"NOISE_STRATEGY";
  v20 = [(PMLNoiseStrategy *)self->_noiseStrategy toPlistWithChunks:v4];
  v23[2] = v20;
  v22[3] = @"SESSIONS_MODEL_HANDLE";
  v19 = [(PMLSessionDescriptor *)self->_sessionDescriptor toPlistWithChunks:v4];

  v23[3] = v19;
  v22[4] = @"SESSIONS_LIMIT";
  v6 = [NSNumber numberWithUnsignedInteger:self->_maxSessionsToTrainOn];
  v23[4] = v6;
  v22[5] = @"SESSIONS_IN_BATCH";
  v7 = [NSNumber numberWithUnsignedInteger:self->_trainingSetSize];
  labelsToTrainOn = self->_labelsToTrainOn;
  unint64_t currentServerIteration = self->_currentServerIteration;
  v23[5] = v7;
  v23[6] = labelsToTrainOn;
  v22[6] = @"LABELS_TO_TRAIN_ON";
  v22[7] = @"SERVER_ITERATION";
  v10 = [NSNumber numberWithUnsignedInteger:currentServerIteration];
  v23[7] = v10;
  v22[8] = @"STOPPING_THRESHOLD";
  v11 = [NSNumber numberWithDouble:self->_lossThresholdForStopping];
  v23[8] = v11;
  v22[9] = @"MIN_ITERATIONS";
  v12 = [NSNumber numberWithUnsignedInteger:self->_epochsPerBatch];
  v23[9] = v12;
  v22[10] = @"THRESHOLD";
  v13 = [NSNumber numberWithDouble:self->_probThreshold];
  v23[10] = v13;
  v22[11] = @"EVALUATION_LEVEL";
  v14 = [NSNumber numberWithUnsignedInteger:self->_evaluationLevel];
  v23[11] = v14;
  v22[12] = @"REPORT_SCALE";
  v15 = [NSNumber numberWithBool:self->_reportScale];
  v23[12] = v15;
  v22[13] = @"SUMMABLE_METRICS_ONLY";
  v16 = [NSNumber numberWithBool:self->_summableMetricsOnly];
  v23[13] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:14];

  return v17;
}

- (PMLMetaTrainingVariables)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v11 objectForKeyedSubscript:@"TRAINING_STORE"];

  if (!v12)
  {
    v39 = [MEMORY[0x263F08690] currentHandler];
    v40 = (objc_class *)objc_opt_class();
    v41 = NSStringFromClass(v40);
    [v39 handleFailureInMethod:a2, self, @"PMLEspressoTrainingPlan.m", 135, @"Can't instantiate %@. Missing \"store\" dependency.", v41 object file lineNumber description];
  }
  v60 = [v11 objectForKeyedSubscript:@"TRAINING_STORE"];
  v59 = [v9 objectForKeyedSubscript:@"PLAN_ID"];
  v13 = [PMLSessionDescriptor alloc];
  v14 = [v9 objectForKeyedSubscript:@"SESSIONS_MODEL_HANDLE"];
  v15 = [(PMLSessionDescriptor *)v13 initWithPlist:v14 chunks:v10 context:v11];

  if (!v15)
  {
    v42 = [MEMORY[0x263F08690] currentHandler];
    [v42 handleFailureInMethod:a2 object:self file:@"PMLEspressoTrainingPlan.m" lineNumber:143 description:@"Session descriptor must be nonnull for PMLEspressoTrainingPlan initWithPlist"];
  }
  v16 = [v9 objectForKeyedSubscript:@"NOISE_STRATEGY_TYPE"];
  if (([MEMORY[0x263F61E28] isInternalBuild] & 1) == 0
    && ([MEMORY[0x263F61E28] isBetaBuild] & 1) == 0
    && [@"PMLNoNoiseStrategy" isEqualToString:v16])
  {

    v16 = @"PMLDiffPrivacyNoiseStrategy";
  }
  v58 = v15;
  if ([@"PMLSeparatedDPNoiseStrategy" isEqualToString:v16])
  {
    v17 = (void *)[v11 mutableCopy];
    v18 = [(PMLSessionDescriptor *)v15 name];
    v19 = +[PMLSeparatedDPNoiseStrategy getPFLIdentifier:v18];
    [v17 setObject:v19 forKey:@"PFL_ID"];

    id v11 = v17;
  }
  v20 = [v11 objectForKeyedSubscript:@"PLUGIN_SHOULD_ADD_NOISE_AND_ENCRYPT_RESULT"];
  v57 = v20;
  if (v20 && ([v20 BOOLValue] & 1) == 0)
  {
    v21 = PML_LogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2212A0000, v21, OS_LOG_TYPE_DEFAULT, "PMLEspressoTrainingPlan running with no noise strategy since pluginShouldAddNoiseAndEncryptResult set to false", buf, 2u);
    }

    v16 = @"PMLNoNoiseStrategy";
    char v45 = 1;
  }
  else
  {
    char v45 = 0;
  }
  v54 = v16;
  id v22 = objc_alloc(NSClassFromString(&v16->isa));
  v23 = [v9 objectForKeyedSubscript:@"NOISE_STRATEGY"];
  uint64_t v24 = [v22 initWithPlist:v23 chunks:v10 context:v11];

  v55 = v11;
  v56 = v10;
  v51 = (void *)v24;
  if (!v24)
  {
    v43 = [MEMORY[0x263F08690] currentHandler];
    [v43 handleFailureInMethod:a2 object:self file:@"PMLEspressoTrainingPlan.m" lineNumber:169 description:@"Noise strategy must be nonnull for PMLEspressoTrainingPlan initWithPlist"];
  }
  v53 = [v9 objectForKeyedSubscript:@"SESSIONS_LIMIT"];
  uint64_t v49 = [v53 unsignedIntegerValue];
  v52 = [v9 objectForKeyedSubscript:@"SESSIONS_IN_BATCH"];
  uint64_t v47 = [v52 unsignedIntegerValue];
  v25 = [v9 objectForKeyedSubscript:@"LABELS_TO_TRAIN_ON"];
  [v9 objectForKeyedSubscript:@"SERVER_ITERATION"];
  v48 = v46 = self;
  uint64_t v26 = [v48 unsignedIntegerValue];
  v27 = [v9 objectForKeyedSubscript:@"STOPPING_THRESHOLD"];
  [v27 doubleValue];
  double v29 = v28;
  v30 = [v9 objectForKeyedSubscript:@"MIN_ITERATIONS"];
  uint64_t v31 = [v30 unsignedIntegerValue];
  v32 = [v9 objectForKeyedSubscript:@"THRESHOLD"];
  [v32 doubleValue];
  double v34 = v33;
  v35 = [v9 objectForKeyedSubscript:@"EVALUATION_LEVEL"];
  uint64_t v36 = [v35 unsignedIntegerValue];
  v37 = [v9 objectForKeyedSubscript:@"REPORT_SCALE"];
  BYTE1(v44) = v45;
  LOBYTE(v44) = [v37 BOOLValue];
  v50 = -[PMLMetaTrainingVariables initWithPlanId:store:noiseStrategy:sessionDescriptor:maxSessionsToTrainOn:trainingSetSize:labelsToTrainOn:currentServerIteration:lossThresholdForStopping:epochsPerBatch:probThreshold:evaluationLevel:reportScale:summableMetricsOnly:](v46, "initWithPlanId:store:noiseStrategy:sessionDescriptor:maxSessionsToTrainOn:trainingSetSize:labelsToTrainOn:currentServerIteration:lossThresholdForStopping:epochsPerBatch:probThreshold:evaluationLevel:reportScale:summableMetricsOnly:", v59, v60, v51, v58, v49, v47, v29, v34, v25, v26, v31, v36, v44);

  return v50;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PMLMetaTrainingVariables *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PMLMetaTrainingVariables *)self isEqualToMetaTrainingVariables:v5];

  return v6;
}

- (BOOL)isEqualToMetaTrainingVariables:(id)a3
{
  id v4 = (id *)a3;
  planId = self->_planId;
  BOOL v6 = (NSString *)v4[1];
  if (planId == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = planId;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
LABEL_23:
      char v33 = 0;
      goto LABEL_24;
    }
  }
  sessionDescriptor = self->_sessionDescriptor;
  id v11 = (PMLSessionDescriptor *)v4[4];
  if (sessionDescriptor == v11)
  {
  }
  else
  {
    v12 = v11;
    v13 = sessionDescriptor;
    BOOL v14 = [(PMLSessionDescriptor *)v13 isEqual:v12];

    if (!v14) {
      goto LABEL_23;
    }
  }
  unint64_t maxSessionsToTrainOn = self->_maxSessionsToTrainOn;
  if (maxSessionsToTrainOn != [v4 maxSessionsToTrainOn]) {
    goto LABEL_23;
  }
  unint64_t trainingSetSize = self->_trainingSetSize;
  if (trainingSetSize != [v4 trainingSetSize]) {
    goto LABEL_23;
  }
  labelsToTrainOn = self->_labelsToTrainOn;
  v18 = (NSArray *)v4[7];
  if (labelsToTrainOn == v18)
  {
  }
  else
  {
    v19 = v18;
    v20 = labelsToTrainOn;
    char v21 = [(NSArray *)v20 isEqual:v19];

    if ((v21 & 1) == 0) {
      goto LABEL_23;
    }
  }
  unint64_t currentServerIteration = self->_currentServerIteration;
  if (currentServerIteration != [v4 currentServerIteration]) {
    goto LABEL_23;
  }
  double lossThresholdForStopping = self->_lossThresholdForStopping;
  [v4 lossThresholdForStopping];
  if (lossThresholdForStopping != v24) {
    goto LABEL_23;
  }
  unint64_t epochsPerBatch = self->_epochsPerBatch;
  if (epochsPerBatch != [v4 epochsPerBatch]) {
    goto LABEL_23;
  }
  double probThreshold = self->_probThreshold;
  [v4 probThreshold];
  if (probThreshold != v27) {
    goto LABEL_23;
  }
  unint64_t evaluationLevel = self->_evaluationLevel;
  if (evaluationLevel != [v4 evaluationLevel]) {
    goto LABEL_23;
  }
  int reportScale = self->_reportScale;
  if (reportScale != [v4 reportScale]) {
    goto LABEL_23;
  }
  int summableMetricsOnly = self->_summableMetricsOnly;
  if (summableMetricsOnly != [v4 summableMetricsOnly]) {
    goto LABEL_23;
  }
  noiseStrategy = self->_noiseStrategy;
  v32 = [v4 noiseStrategy];
  char v33 = [(PMLNoiseStrategy *)noiseStrategy isMemberOfClass:objc_opt_class()];

LABEL_24:
  return v33;
}

- (PMLMetaTrainingVariables)initWithPlanId:(id)a3 store:(id)a4 noiseStrategy:(id)a5 sessionDescriptor:(id)a6 maxSessionsToTrainOn:(unint64_t)a7 trainingSetSize:(unint64_t)a8 labelsToTrainOn:(id)a9 currentServerIteration:(unint64_t)a10 lossThresholdForStopping:(double)a11 epochsPerBatch:(unint64_t)a12 probThreshold:(double)a13 evaluationLevel:(unint64_t)a14 reportScale:(BOOL)a15 summableMetricsOnly:(BOOL)a16
{
  id v23 = a3;
  id v33 = a4;
  id v24 = a5;
  id v25 = a6;
  id v26 = a9;
  v34.receiver = self;
  v34.super_class = (Class)PMLMetaTrainingVariables;
  double v27 = [(PMLMetaTrainingVariables *)&v34 init];
  if (v27)
  {
    if (!+[PMLPlanDescriptor isValidPlanId:v23])
    {
      double v29 = [MEMORY[0x263F08690] currentHandler];
      [v29 handleFailureInMethod:a2, v27, @"PMLEspressoTrainingPlan.m", 79, @"Invalid planId. Must be <name>-<version>-<locale> but got %@", v23 object file lineNumber description];
    }
    objc_storeStrong((id *)&v27->_planId, a3);
    objc_storeStrong((id *)&v27->_store, a4);
    objc_storeStrong((id *)&v27->_noiseStrategy, a5);
    objc_storeStrong((id *)&v27->_sessionDescriptor, a6);
    v27->_unint64_t maxSessionsToTrainOn = a7;
    v27->_unint64_t trainingSetSize = a8;
    objc_storeStrong((id *)&v27->_labelsToTrainOn, a9);
    v27->_unint64_t currentServerIteration = a10;
    v27->_double lossThresholdForStopping = a11;
    v27->_unint64_t epochsPerBatch = a12;
    v27->_double probThreshold = a13;
    v27->_unint64_t evaluationLevel = a14;
    v27->_int reportScale = a15;
    v27->_int summableMetricsOnly = a16;
  }

  return v27;
}

@end