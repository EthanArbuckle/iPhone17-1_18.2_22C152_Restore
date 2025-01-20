@interface PHAPrivateFederatedLearningLayerParameters
- (MAFloatVector)bias;
- (MAFloatVector)weights;
- (PHAPrivateFederatedLearningLayerParameters)initWithWeights:(id)a3 bias:(id)a4;
- (void)setBias:(id)a3;
- (void)setWeights:(id)a3;
@end

@implementation PHAPrivateFederatedLearningLayerParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bias, 0);

  objc_storeStrong((id *)&self->_weights, 0);
}

- (void)setBias:(id)a3
{
}

- (MAFloatVector)bias
{
  return self->_bias;
}

- (void)setWeights:(id)a3
{
}

- (MAFloatVector)weights
{
  return self->_weights;
}

- (PHAPrivateFederatedLearningLayerParameters)initWithWeights:(id)a3 bias:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHAPrivateFederatedLearningLayerParameters;
  v9 = [(PHAPrivateFederatedLearningLayerParameters *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_weights, a3);
    objc_storeStrong((id *)&v10->_bias, a4);
  }

  return v10;
}

@end