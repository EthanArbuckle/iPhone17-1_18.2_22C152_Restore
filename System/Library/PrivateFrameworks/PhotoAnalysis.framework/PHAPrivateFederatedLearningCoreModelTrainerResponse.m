@interface PHAPrivateFederatedLearningCoreModelTrainerResponse
- (NSData)dataPackage;
- (NSDictionary)trainingMetrics;
- (PHAPrivateFederatedLearningCoreModelTrainerResponse)initWithDataPackage:(id)a3 trainingMetrics:(id)a4;
- (void)setDataPackage:(id)a3;
- (void)setTrainingMetrics:(id)a3;
@end

@implementation PHAPrivateFederatedLearningCoreModelTrainerResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingMetrics, 0);

  objc_storeStrong((id *)&self->_dataPackage, 0);
}

- (void)setTrainingMetrics:(id)a3
{
}

- (NSDictionary)trainingMetrics
{
  return self->_trainingMetrics;
}

- (void)setDataPackage:(id)a3
{
}

- (NSData)dataPackage
{
  return self->_dataPackage;
}

- (PHAPrivateFederatedLearningCoreModelTrainerResponse)initWithDataPackage:(id)a3 trainingMetrics:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHAPrivateFederatedLearningCoreModelTrainerResponse;
  v9 = [(PHAPrivateFederatedLearningCoreModelTrainerResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataPackage, a3);
    objc_storeStrong((id *)&v10->_trainingMetrics, a4);
  }

  return v10;
}

@end