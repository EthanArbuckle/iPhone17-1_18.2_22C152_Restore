@interface PHAPrivateFederatedLearningModelTrainerResponse
- (NSArray)parameterDeltas;
- (NSArray)trainingAccuraciesPerEpoch;
- (NSArray)trainingLossesPerEpoch;
- (PHAPrivateFederatedLearningModelTrainerResponse)initWithParameterDeltas:(id)a3 trainingLossesPerEpoch:(id)a4 trainingAccuraciesPerEpoch:(id)a5 trainingEpochs:(unint64_t)a6 numberOfTrainingSamples:(unint64_t)a7;
- (unint64_t)numberOfTrainingSamples;
- (unint64_t)trainingEpochs;
- (void)setNumberOfTrainingSamples:(unint64_t)a3;
- (void)setParameterDeltas:(id)a3;
- (void)setTrainingAccuraciesPerEpoch:(id)a3;
- (void)setTrainingEpochs:(unint64_t)a3;
- (void)setTrainingLossesPerEpoch:(id)a3;
@end

@implementation PHAPrivateFederatedLearningModelTrainerResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingAccuraciesPerEpoch, 0);
  objc_storeStrong((id *)&self->_trainingLossesPerEpoch, 0);

  objc_storeStrong((id *)&self->_parameterDeltas, 0);
}

- (void)setNumberOfTrainingSamples:(unint64_t)a3
{
  self->_numberOfTrainingSamples = a3;
}

- (unint64_t)numberOfTrainingSamples
{
  return self->_numberOfTrainingSamples;
}

- (void)setTrainingEpochs:(unint64_t)a3
{
  self->_trainingEpochs = a3;
}

- (unint64_t)trainingEpochs
{
  return self->_trainingEpochs;
}

- (void)setTrainingAccuraciesPerEpoch:(id)a3
{
}

- (NSArray)trainingAccuraciesPerEpoch
{
  return self->_trainingAccuraciesPerEpoch;
}

- (void)setTrainingLossesPerEpoch:(id)a3
{
}

- (NSArray)trainingLossesPerEpoch
{
  return self->_trainingLossesPerEpoch;
}

- (void)setParameterDeltas:(id)a3
{
}

- (NSArray)parameterDeltas
{
  return self->_parameterDeltas;
}

- (PHAPrivateFederatedLearningModelTrainerResponse)initWithParameterDeltas:(id)a3 trainingLossesPerEpoch:(id)a4 trainingAccuraciesPerEpoch:(id)a5 trainingEpochs:(unint64_t)a6 numberOfTrainingSamples:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PHAPrivateFederatedLearningModelTrainerResponse;
  v16 = [(PHAPrivateFederatedLearningModelTrainerResponse *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_parameterDeltas, a3);
    objc_storeStrong((id *)&v17->_trainingLossesPerEpoch, a4);
    objc_storeStrong((id *)&v17->_trainingAccuraciesPerEpoch, a5);
    v17->_trainingEpochs = a6;
    v17->_numberOfTrainingSamples = a7;
  }

  return v17;
}

@end