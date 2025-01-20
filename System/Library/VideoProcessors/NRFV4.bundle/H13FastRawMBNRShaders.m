@interface H13FastRawMBNRShaders
- (H13FastRawMBNRShaders)initWithMetalContext:(id)a3;
- (MTLComputePipelineState)downscale2x;
- (MTLComputePipelineState)noiseLookup;
- (SoftISPKernelWithFunctionConstants)denoiseBayerAndStepDown;
- (SoftISPKernelWithFunctionConstants)denoiseChromaAndStepDown;
- (SoftISPKernelWithFunctionConstants)denoiseChromaAndStepDownAndRegenBayer;
- (SoftISPKernelWithFunctionConstants)lowPassBayer;
- (SoftISPKernelWithFunctionConstants)lowPassBayerAndDownscale2x;
- (SoftISPKernelWithFunctionConstants)regenerateBayer;
@end

@implementation H13FastRawMBNRShaders

- (H13FastRawMBNRShaders)initWithMetalContext:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_14;
  }
  v22.receiver = self;
  v22.super_class = (Class)H13FastRawMBNRShaders;
  self = [(H13FastRawMBNRShaders *)&v22 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_11;
  }
  v5 = [v4 computePipelineStateFor:@"H13FastRawMBNR::noiseLookup" constants:0];
  noiseLookup = self->_noiseLookup;
  self->_noiseLookup = v5;

  if (!self->_noiseLookup) {
    goto LABEL_14;
  }
  v7 = [v4 computePipelineStateFor:@"H13FastRawMBNR::downscale2x" constants:0];
  downscale2x = self->_downscale2x;
  self->_downscale2x = v7;

  if (!self->_downscale2x) {
    goto LABEL_14;
  }
  v9 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastRawMBNR::lowPassBayer" usingNamespace:@"H13FastRawMBNR::FunctionConstants" paramCombinations:&unk_270E98E40];
  lowPassBayer = self->_lowPassBayer;
  self->_lowPassBayer = v9;

  if (!self->_lowPassBayer) {
    goto LABEL_14;
  }
  v11 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastRawMBNR::lowPassBayerAndDownscale2x" usingNamespace:@"H13FastRawMBNR::FunctionConstants" paramCombinations:&unk_270E98E68];
  lowPassBayerAndDownscale2x = self->_lowPassBayerAndDownscale2x;
  self->_lowPassBayerAndDownscale2x = v11;

  if (!self->_lowPassBayerAndDownscale2x) {
    goto LABEL_14;
  }
  v13 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastRawMBNR::denoiseChromaAndStepDown" usingNamespace:@"H13FastRawMBNR::FunctionConstants" paramCombinations:&unk_270E98E90];
  denoiseChromaAndStepDown = self->_denoiseChromaAndStepDown;
  self->_denoiseChromaAndStepDown = v13;

  if (!self->_denoiseChromaAndStepDown) {
    goto LABEL_14;
  }
  v15 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastRawMBNR::regenerateBayer" usingNamespace:@"H13FastRawMBNR::FunctionConstants" paramCombinations:&unk_270E98EB8];
  regenerateBayer = self->_regenerateBayer;
  self->_regenerateBayer = v15;

  if (!self->_regenerateBayer) {
    goto LABEL_14;
  }
  v17 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastRawMBNR::denoiseBayerAndStepDown" usingNamespace:@"H13FastRawMBNR::FunctionConstants" paramCombinations:&unk_270E98EE0];
  denoiseBayerAndStepDown = self->_denoiseBayerAndStepDown;
  self->_denoiseBayerAndStepDown = v17;

  if (!self->_denoiseBayerAndStepDown
    || (v19 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastRawMBNR::denoiseChromaAndStepDownAndRegenBayer" usingNamespace:@"H13FastRawMBNR::FunctionConstants" paramCombinations:&unk_270E98F08], denoiseChromaAndStepDownAndRegenBayer = self->_denoiseChromaAndStepDownAndRegenBayer, self->_denoiseChromaAndStepDownAndRegenBayer = v19, denoiseChromaAndStepDownAndRegenBayer, !self->_denoiseChromaAndStepDownAndRegenBayer))
  {
LABEL_14:
    FigDebugAssert3();

    self = 0;
  }
LABEL_11:

  return self;
}

- (MTLComputePipelineState)noiseLookup
{
  return self->_noiseLookup;
}

- (MTLComputePipelineState)downscale2x
{
  return self->_downscale2x;
}

- (SoftISPKernelWithFunctionConstants)lowPassBayer
{
  return self->_lowPassBayer;
}

- (SoftISPKernelWithFunctionConstants)denoiseChromaAndStepDown
{
  return self->_denoiseChromaAndStepDown;
}

- (SoftISPKernelWithFunctionConstants)regenerateBayer
{
  return self->_regenerateBayer;
}

- (SoftISPKernelWithFunctionConstants)denoiseBayerAndStepDown
{
  return self->_denoiseBayerAndStepDown;
}

- (SoftISPKernelWithFunctionConstants)lowPassBayerAndDownscale2x
{
  return self->_lowPassBayerAndDownscale2x;
}

- (SoftISPKernelWithFunctionConstants)denoiseChromaAndStepDownAndRegenBayer
{
  return self->_denoiseChromaAndStepDownAndRegenBayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denoiseChromaAndStepDownAndRegenBayer, 0);
  objc_storeStrong((id *)&self->_lowPassBayerAndDownscale2x, 0);
  objc_storeStrong((id *)&self->_denoiseBayerAndStepDown, 0);
  objc_storeStrong((id *)&self->_regenerateBayer, 0);
  objc_storeStrong((id *)&self->_denoiseChromaAndStepDown, 0);
  objc_storeStrong((id *)&self->_lowPassBayer, 0);
  objc_storeStrong((id *)&self->_downscale2x, 0);

  objc_storeStrong((id *)&self->_noiseLookup, 0);
}

@end