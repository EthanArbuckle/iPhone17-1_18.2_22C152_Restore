@interface PHAPrivateFederatedLearningCoreMLModelTrainer
+ (unint64_t)countForTrainingData:(id)a3;
+ (void)_generateError:(id *)a3 errorCode:(int64_t)a4 message:(id)a5 underlyingError:(id)a6;
- (MLArrayBatchProvider)trainingData;
- (MLProgramTrainer)programTrainer;
- (NSSet)evaluationMetricNames;
- (PHAPrivateFederatedLearningCoreMLModelTrainer)initWithTrainingData:(id)a3 programTrainer:(id)a4 evaluationMetricNames:(id)a5;
- (id)_unpackEvaluationMetrics:(id)a3 resultDictionary:(id)a4 error:(id *)a5;
- (id)trainForNumberOfEpochs:(unint64_t)a3 error:(id *)a4;
- (id)unpackResults:(id)a3 error:(id *)a4;
@end

@implementation PHAPrivateFederatedLearningCoreMLModelTrainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluationMetricNames, 0);
  objc_storeStrong((id *)&self->_programTrainer, 0);

  objc_storeStrong((id *)&self->_trainingData, 0);
}

- (NSSet)evaluationMetricNames
{
  return self->_evaluationMetricNames;
}

- (MLProgramTrainer)programTrainer
{
  return self->_programTrainer;
}

- (MLArrayBatchProvider)trainingData
{
  return self->_trainingData;
}

- (id)_unpackEvaluationMetrics:(id)a3 resultDictionary:(id)a4 error:(id *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [(PHAPrivateFederatedLearningCoreMLModelTrainer *)self evaluationMetricNames];
  uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v12 = &off_1E6916000;
    uint64_t v42 = *(void *)v44;
    v37 = v9;
    v38 = a5;
    id v36 = v8;
    do
    {
      uint64_t v13 = 0;
      uint64_t v39 = v11;
      do
      {
        if (*(void *)v44 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v43 + 1) + 8 * v13);
        v15 = [v8 featureValueForName:v14];
        if ([v15 isUndefined])
        {
          v16 = v12[197];
          v17 = [NSString stringWithFormat:@"%@ is undefined", v14];
          [v16 _generateError:a5 errorCode:2 message:v17 underlyingError:0];
        }
        else
        {
          v18 = [v15 multiArrayValue];
          v17 = v18;
          if (v18)
          {
            v19 = [v18 shape];
            v20 = [v19 objectAtIndexedSubscript:0];
            uint64_t v21 = [v20 unsignedIntValue];

            v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v21];
            v23 = [v9 objectForKeyedSubscript:v14];
            v41 = v23;
            if (v23)
            {
              id v24 = v23;

              v22 = v24;
            }
            else if (v21)
            {
              do
              {
                [v22 addObject:&unk_1F291ABA0];
                --v21;
              }
              while (v21);
            }
            if ([v22 count])
            {
              unint64_t v26 = 0;
              do
              {
                v27 = [v22 objectAtIndexedSubscript:v26];
                v28 = NSNumber;
                [v27 floatValue];
                float v30 = v29;
                v31 = [v17 objectAtIndexedSubscript:v26];
                [v31 floatValue];
                *(float *)&double v33 = v30 + v32;
                v34 = [v28 numberWithFloat:v33];
                [v22 setObject:v34 atIndexedSubscript:v26];

                ++v26;
              }
              while (v26 < [v22 count]);
            }
            id v9 = v37;
            [v37 setObject:v22 forKeyedSubscript:v14];

            a5 = v38;
            id v8 = v36;
            v12 = &off_1E6916000;
          }
          else
          {
            v25 = v12[197];
            v22 = [NSString stringWithFormat:@"metricMLMultiArray is undefined for %@", v14];
            [v25 _generateError:a5 errorCode:3 message:v22 underlyingError:0];
          }

          uint64_t v11 = v39;
        }

        ++v13;
      }
      while (v13 != v11);
      uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v11);
  }

  return v9;
}

- (id)unpackResults:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = [v6 evaluationMetrics];
  uint64_t v9 = [v8 count];

  if (v9 < 1)
  {
    uint64_t v13 = v7;
  }
  else
  {
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = [v6 evaluationMetrics];
      v12 = [v11 featuresAtIndex:v10];

      uint64_t v13 = [(PHAPrivateFederatedLearningCoreMLModelTrainer *)self _unpackEvaluationMetrics:v12 resultDictionary:v7 error:a4];

      ++v10;
      uint64_t v14 = [v6 evaluationMetrics];
      uint64_t v15 = [v14 count];

      id v7 = v13;
    }
    while (v15 > v10);
  }
  id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v17 = NSNumber;
  [v6 loss];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  v19 = objc_msgSend(v16, "initWithObjects:", v18, 0);
  [v13 setObject:v19 forKeyedSubscript:@"loss"];

  return v13;
}

- (id)trainForNumberOfEpochs:(unint64_t)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = [(PHAPrivateFederatedLearningCoreMLModelTrainer *)self trainingData];
  uint64_t v9 = v8;
  if (!v8 || ![v8 count]) {
    +[PHAPrivateFederatedLearningCoreMLModelTrainer _generateError:a4 errorCode:4 message:@"Empty training data" underlyingError:0];
  }
  uint64_t v10 = [(PHAPrivateFederatedLearningCoreMLModelTrainer *)self trainingData];
  unint64_t v11 = +[PHAPrivateFederatedLearningCoreMLModelTrainer countForTrainingData:v10];

  v12 = [NSNumber numberWithUnsignedInteger:v11];
  v39[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  [v7 setObject:v13 forKeyedSubscript:@"count"];

  uint64_t v14 = [(PHAPrivateFederatedLearningCoreMLModelTrainer *)self programTrainer];
  uint64_t v15 = [(PHAPrivateFederatedLearningCoreMLModelTrainer *)self evaluationMetricNames];
  uint64_t v16 = [v14 evaluateUsingTestData:v9 evaluationMetricNames:v15 error:a4];

  id v36 = (void *)v16;
  uint64_t v17 = [(PHAPrivateFederatedLearningCoreMLModelTrainer *)self unpackResults:v16 error:a4];
  if (v17) {
    [v7 setObject:v17 forKey:@"Pretraining"];
  }
  v35 = (void *)v17;
  v37 = v7;
  id v18 = 0;
  if (!a3)
  {
LABEL_12:
    v27 = [(PHAPrivateFederatedLearningCoreMLModelTrainer *)self programTrainer];
    v28 = (void *)[v27 copyCurrentTrainingDelta];

    float v29 = [v28 flattenedModelUpdate];
    float v30 = v37;
    v31 = [[PHAPrivateFederatedLearningCoreModelTrainerResponse alloc] initWithDataPackage:v29 trainingMetrics:v37];

LABEL_15:
    float v32 = v35;

    double v33 = v36;
    goto LABEL_16;
  }
  uint64_t v19 = 0;
  while (1)
  {
    v20 = v18;
    uint64_t v21 = [(PHAPrivateFederatedLearningCoreMLModelTrainer *)self programTrainer];
    v22 = [(PHAPrivateFederatedLearningCoreMLModelTrainer *)self evaluationMetricNames];
    id v38 = v18;
    v23 = v9;
    id v24 = [v21 trainUsingTrainingData:v9 evaluationMetricNames:v22 error:&v38];
    id v18 = v38;

    if (!v24) {
      break;
    }
    v25 = [(PHAPrivateFederatedLearningCoreMLModelTrainer *)self unpackResults:v24 error:a4];
    if (v25)
    {
      unint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"Epoch %lu", v19);
      [v37 setObject:v25 forKey:v26];
    }
    ++v19;
    uint64_t v9 = v23;
    if (a3 == v19) {
      goto LABEL_12;
    }
  }
  if (v18)
  {
    v28 = [NSString stringWithFormat:@"Empty training result"];
    +[PHAPrivateFederatedLearningCoreMLModelTrainer _generateError:a4 errorCode:1 message:v28 underlyingError:v18];
    v31 = 0;
    float v30 = v37;
    uint64_t v9 = v23;
    goto LABEL_15;
  }
  v31 = 0;
  uint64_t v9 = v23;
  double v33 = v36;
  float v30 = v37;
  float v32 = v35;
LABEL_16:

  return v31;
}

- (PHAPrivateFederatedLearningCoreMLModelTrainer)initWithTrainingData:(id)a3 programTrainer:(id)a4 evaluationMetricNames:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHAPrivateFederatedLearningCoreMLModelTrainer;
  v12 = [(PHAPrivateFederatedLearningCoreMLModelTrainer *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_trainingData, a3);
    objc_storeStrong((id *)&v13->_programTrainer, a4);
    objc_storeStrong((id *)&v13->_evaluationMetricNames, a5);
  }

  return v13;
}

+ (void)_generateError:(id *)a3 errorCode:(int64_t)a4 message:(id)a5 underlyingError:(id)a6
{
  id v9 = a6;
  if (a3)
  {
    id v10 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v13 = v9;
    id v11 = a5;
    id v12 = objc_alloc_init(v10);
    [v12 setObject:v11 forKey:*MEMORY[0x1E4F28568]];

    if (v13) {
      [v12 setObject:v13 forKey:*MEMORY[0x1E4F28A50]];
    }
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotoAnalysis.PHAPrivateFederatedLearningCoreMLModelTrainer" code:a4 userInfo:v12];

    id v9 = v13;
  }
}

+ (unint64_t)countForTrainingData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [a3 array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = [v9 featureNames];
        id v11 = [v10 anyObject];

        id v12 = [v9 featureValueForName:v11];
        id v13 = [v12 multiArrayValue];
        uint64_t v14 = [v13 shape];
        objc_super v15 = [v14 objectAtIndexedSubscript:0];
        v6 += [v15 unsignedIntValue];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

@end