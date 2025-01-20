@interface PHAPrivateFederatedLearningLayerParameterDeltas
+ (id)deltasFromLayerParameters:(id)a3 toLayerParameters:(id)a4;
- (MAFloatVector)biasDeltas;
- (MAFloatVector)weightDeltas;
- (PHAPrivateFederatedLearningLayerParameterDeltas)initWithWeightDeltas:(id)a3 biasDeltas:(id)a4;
- (void)setBiasDeltas:(id)a3;
- (void)setWeightDeltas:(id)a3;
@end

@implementation PHAPrivateFederatedLearningLayerParameterDeltas

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasDeltas, 0);

  objc_storeStrong((id *)&self->_weightDeltas, 0);
}

- (void)setBiasDeltas:(id)a3
{
}

- (MAFloatVector)biasDeltas
{
  return self->_biasDeltas;
}

- (void)setWeightDeltas:(id)a3
{
}

- (MAFloatVector)weightDeltas
{
  return self->_weightDeltas;
}

- (PHAPrivateFederatedLearningLayerParameterDeltas)initWithWeightDeltas:(id)a3 biasDeltas:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHAPrivateFederatedLearningLayerParameterDeltas;
  v9 = [(PHAPrivateFederatedLearningLayerParameterDeltas *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_weightDeltas, a3);
    objc_storeStrong((id *)&v10->_biasDeltas, a4);
  }

  return v10;
}

+ (id)deltasFromLayerParameters:(id)a3 toLayerParameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v9 = [v7 weights];
  v10 = [v6 weights];
  v11 = [v9 vectorBySubtractingVector:v10];
  objc_super v12 = [v7 bias];

  v13 = [v6 bias];

  v14 = [v12 vectorBySubtractingVector:v13];
  v15 = (void *)[v8 initWithWeightDeltas:v11 biasDeltas:v14];

  return v15;
}

@end