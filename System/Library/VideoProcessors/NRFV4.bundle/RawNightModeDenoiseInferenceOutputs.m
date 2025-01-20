@interface RawNightModeDenoiseInferenceOutputs
- (MTLTexture)outputChromaTexture;
- (MTLTexture)outputClippingMapTex;
- (MTLTexture)outputDenoisedBand3LumaTex;
- (MTLTexture)outputLocalDNRBiasTex;
- (MTLTexture)outputLumaTexture;
- (__n128)outputGlobalDnrBias;
- (void)setOutputChromaTexture:(id)a3;
- (void)setOutputClippingMapTex:(id)a3;
- (void)setOutputDenoisedBand3LumaTex:(id)a3;
- (void)setOutputGlobalDnrBias:(RawNightModeDenoiseInferenceOutputs *)self;
- (void)setOutputLocalDNRBiasTex:(id)a3;
- (void)setOutputLumaTexture:(id)a3;
@end

@implementation RawNightModeDenoiseInferenceOutputs

- (MTLTexture)outputLumaTexture
{
  return self->_outputLumaTexture;
}

- (void)setOutputLumaTexture:(id)a3
{
}

- (MTLTexture)outputChromaTexture
{
  return self->_outputChromaTexture;
}

- (void)setOutputChromaTexture:(id)a3
{
}

- (__n128)outputGlobalDnrBias
{
  return a1[3];
}

- (void)setOutputGlobalDnrBias:(RawNightModeDenoiseInferenceOutputs *)self
{
  *(_OWORD *)self->_outputGlobalDnrBias = v2;
}

- (MTLTexture)outputLocalDNRBiasTex
{
  return self->_outputLocalDNRBiasTex;
}

- (void)setOutputLocalDNRBiasTex:(id)a3
{
}

- (MTLTexture)outputDenoisedBand3LumaTex
{
  return self->_outputDenoisedBand3LumaTex;
}

- (void)setOutputDenoisedBand3LumaTex:(id)a3
{
}

- (MTLTexture)outputClippingMapTex
{
  return self->_outputClippingMapTex;
}

- (void)setOutputClippingMapTex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputClippingMapTex, 0);
  objc_storeStrong((id *)&self->_outputDenoisedBand3LumaTex, 0);
  objc_storeStrong((id *)&self->_outputLocalDNRBiasTex, 0);
  objc_storeStrong((id *)&self->_outputChromaTexture, 0);

  objc_storeStrong((id *)&self->_outputLumaTexture, 0);
}

@end