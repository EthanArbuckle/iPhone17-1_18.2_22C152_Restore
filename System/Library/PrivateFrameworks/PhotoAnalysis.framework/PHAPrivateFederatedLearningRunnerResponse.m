@interface PHAPrivateFederatedLearningRunnerResponse
- (NSData)dataPackage;
- (NSDictionary)trainingMetrics;
- (PHAPrivateFederatedLearningRunnerResponse)initWithDataPackage:(id)a3 layersToTrain:(id)a4 trainingLossesPerEpoch:(id)a5 trainingAccuraciesPerEpoch:(id)a6;
- (PHAPrivateFederatedLearningRunnerResponse)initWithDataPackage:(id)a3 trainingMetrics:(id)a4;
- (void)setDataPackage:(id)a3;
- (void)setTrainingMetrics:(id)a3;
@end

@implementation PHAPrivateFederatedLearningRunnerResponse

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

- (PHAPrivateFederatedLearningRunnerResponse)initWithDataPackage:(id)a3 trainingMetrics:(id)a4
{
  v6 = (NSData *)a3;
  v7 = (NSDictionary *)a4;
  dataPackage = self->_dataPackage;
  self->_dataPackage = v6;
  v9 = v6;

  trainingMetrics = self->_trainingMetrics;
  self->_trainingMetrics = v7;

  return self;
}

- (PHAPrivateFederatedLearningRunnerResponse)initWithDataPackage:(id)a3 layersToTrain:(id)a4 trainingLossesPerEpoch:(id)a5 trainingAccuraciesPerEpoch:(id)a6
{
  v22[3] = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)&self->_dataPackage, a3);
  id v11 = a3;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v20 = v13;
  v21[0] = @"TrainingLosses";
  v19 = @"losses";
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v22[0] = v15;
  v22[1] = v12;
  v21[1] = @"TrainingAccuracies";
  v21[2] = @"UpdatedModelIndices";
  v22[2] = v14;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  trainingMetrics = self->_trainingMetrics;
  self->_trainingMetrics = v16;

  return self;
}

@end