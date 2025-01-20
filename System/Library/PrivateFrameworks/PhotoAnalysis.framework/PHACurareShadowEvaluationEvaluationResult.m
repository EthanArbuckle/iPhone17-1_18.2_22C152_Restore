@interface PHACurareShadowEvaluationEvaluationResult
- (BOOL)isPositiveData;
- (NSNumber)meanPredictionValue;
- (NSNumber)numberOfCorrectSamples;
- (NSNumber)numberOfTotalSamples;
- (NSNumber)stddevPredictionValue;
- (NSString)modelName;
- (PHACurareShadowEvaluationEvaluationResult)initWithModelPath:(id)a3 isPositiveData:(BOOL)a4 numberOfTotalSamples:(id)a5 numberOfCorrectSamples:(id)a6 meanPredictionValue:(id)a7 stddevPredictionValue:(id)a8;
- (void)setIsPositiveData:(BOOL)a3;
- (void)setMeanPredictionValue:(id)a3;
- (void)setModelName:(id)a3;
- (void)setNumberOfCorrectSamples:(id)a3;
- (void)setNumberOfTotalSamples:(id)a3;
- (void)setStddevPredictionValue:(id)a3;
@end

@implementation PHACurareShadowEvaluationEvaluationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stddevPredictionValue, 0);
  objc_storeStrong((id *)&self->_meanPredictionValue, 0);
  objc_storeStrong((id *)&self->_numberOfCorrectSamples, 0);
  objc_storeStrong((id *)&self->_numberOfTotalSamples, 0);

  objc_storeStrong((id *)&self->_modelName, 0);
}

- (void)setStddevPredictionValue:(id)a3
{
}

- (NSNumber)stddevPredictionValue
{
  return self->_stddevPredictionValue;
}

- (void)setMeanPredictionValue:(id)a3
{
}

- (NSNumber)meanPredictionValue
{
  return self->_meanPredictionValue;
}

- (void)setNumberOfCorrectSamples:(id)a3
{
}

- (NSNumber)numberOfCorrectSamples
{
  return self->_numberOfCorrectSamples;
}

- (void)setNumberOfTotalSamples:(id)a3
{
}

- (NSNumber)numberOfTotalSamples
{
  return self->_numberOfTotalSamples;
}

- (void)setIsPositiveData:(BOOL)a3
{
  self->_isPositiveData = a3;
}

- (BOOL)isPositiveData
{
  return self->_isPositiveData;
}

- (void)setModelName:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (PHACurareShadowEvaluationEvaluationResult)initWithModelPath:(id)a3 isPositiveData:(BOOL)a4 numberOfTotalSamples:(id)a5 numberOfCorrectSamples:(id)a6 meanPredictionValue:(id)a7 stddevPredictionValue:(id)a8
{
  id v14 = a3;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v15 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PHACurareShadowEvaluationEvaluationResult;
  v16 = [(PHACurareShadowEvaluationEvaluationResult *)&v24 init];
  if (v16)
  {
    v17 = [v14 lastPathComponent];
    uint64_t v18 = [v17 stringByDeletingPathExtension];
    modelName = v16->_modelName;
    v16->_modelName = (NSString *)v18;

    v16->_isPositiveData = a4;
    objc_storeStrong((id *)&v16->_numberOfTotalSamples, a5);
    objc_storeStrong((id *)&v16->_numberOfCorrectSamples, a6);
    objc_storeStrong((id *)&v16->_meanPredictionValue, a7);
    objc_storeStrong((id *)&v16->_stddevPredictionValue, a8);
  }

  return v16;
}

@end