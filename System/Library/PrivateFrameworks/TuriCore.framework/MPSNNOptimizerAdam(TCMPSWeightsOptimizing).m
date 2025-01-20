@interface MPSNNOptimizerAdam(TCMPSWeightsOptimizing)
- (void)encodeToCommandBuffer:()TCMPSWeightsOptimizing batchNormalizationState:batchNormData:;
- (void)encodeToCommandBuffer:()TCMPSWeightsOptimizing convolutionGradientState:convolutionWeights:;
@end

@implementation MPSNNOptimizerAdam(TCMPSWeightsOptimizing)

- (void)encodeToCommandBuffer:()TCMPSWeightsOptimizing convolutionGradientState:convolutionWeights:
{
  v20[2] = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v8 = a5;
  v9 = [v8 state];
  v10 = [v8 weightMomentumVector];
  v20[0] = v10;
  v11 = [v8 biasMomentumVector];
  v20[1] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  v13 = [v8 weightVelocityVector];
  v19[0] = v13;
  v14 = [v8 biasVelocityVector];
  v19[1] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v16 = [v8 state];
  [a1 encodeToCommandBuffer:v17 convolutionGradientState:v18 convolutionSourceState:v9 inputMomentumVectors:v12 inputVelocityVectors:v15 resultState:v16];
}

- (void)encodeToCommandBuffer:()TCMPSWeightsOptimizing batchNormalizationState:batchNormData:
{
  void v19[2] = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v9 gammaMomentumVector];
  v19[0] = v10;
  v11 = [v9 betaMomentumVector];
  v19[1] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v13 = [v9 gammaVelocityVector];
  v18[0] = v13;
  v14 = [v9 betaVelocityVector];
  v18[1] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v16 = [v9 gammaBetaState];
  [a1 encodeToCommandBuffer:v17 batchNormalizationState:v8 inputMomentumVectors:v12 inputVelocityVectors:v15 resultState:v16];
}

@end