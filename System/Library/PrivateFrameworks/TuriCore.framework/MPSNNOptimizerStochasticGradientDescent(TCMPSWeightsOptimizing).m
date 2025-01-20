@interface MPSNNOptimizerStochasticGradientDescent(TCMPSWeightsOptimizing)
- (void)encodeToCommandBuffer:()TCMPSWeightsOptimizing batchNormalizationState:batchNormData:;
- (void)encodeToCommandBuffer:()TCMPSWeightsOptimizing convolutionGradientState:convolutionWeights:;
@end

@implementation MPSNNOptimizerStochasticGradientDescent(TCMPSWeightsOptimizing)

- (void)encodeToCommandBuffer:()TCMPSWeightsOptimizing convolutionGradientState:convolutionWeights:
{
  v16[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 state];
  v12 = [v10 weightMomentumVector];
  v16[0] = v12;
  v13 = [v10 biasMomentumVector];
  v16[1] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v15 = [v10 state];
  [a1 encodeToCommandBuffer:v8 convolutionGradientState:v9 convolutionSourceState:v11 inputMomentumVectors:v14 resultState:v15];
}

- (void)encodeToCommandBuffer:()TCMPSWeightsOptimizing batchNormalizationState:batchNormData:
{
  v15[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 gammaMomentumVector];
  v15[0] = v11;
  v12 = [v10 betaMomentumVector];
  v15[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v14 = [v10 gammaBetaState];
  [a1 encodeToCommandBuffer:v8 batchNormalizationState:v9 inputMomentumVectors:v13 resultState:v14];
}

@end