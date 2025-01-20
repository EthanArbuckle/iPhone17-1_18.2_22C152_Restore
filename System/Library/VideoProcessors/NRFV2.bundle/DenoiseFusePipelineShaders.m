@interface DenoiseFusePipelineShaders
- (DenoiseFusePipelineShaders)initWithMetal:(id)a3;
@end

@implementation DenoiseFusePipelineShaders

- (DenoiseFusePipelineShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DenoiseFusePipelineShaders;
  v6 = [(DenoiseFusePipelineShaders *)&v17 init];
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v7 = objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"kernelPickRandomSamples", 0);
  pickRandomSamples = v6->_pickRandomSamples;
  v6->_pickRandomSamples = (MTLComputePipelineState *)v7;

  if (!v6->_pickRandomSamples) {
    goto LABEL_7;
  }
  uint64_t v10 = objc_msgSend_computePipelineStateFor_constants_(v4, v9, @"adjustEvmPyramidColor", 0);
  adjustEvmPyramidColor = v6->_adjustEvmPyramidColor;
  v6->_adjustEvmPyramidColor = (MTLComputePipelineState *)v10;

  if (!v6->_adjustEvmPyramidColor) {
    goto LABEL_7;
  }
  uint64_t v13 = objc_msgSend_computePipelineStateFor_constants_(v4, v12, @"stationaryDownsampleForInference", 0);
  downsampleInference = v6->_downsampleInference;
  v6->_downsampleInference = (MTLComputePipelineState *)v13;

  if (v6->_downsampleInference)
  {
LABEL_5:
    v15 = v6;
  }
  else
  {
LABEL_7:
    FigDebugAssert3();
    FigSignalErrorAt();
    v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downsampleInference, 0);
  objc_storeStrong((id *)&self->_adjustEvmPyramidColor, 0);
  objc_storeStrong((id *)&self->_pickRandomSamples, 0);

  objc_storeStrong((id *)&self->_redFaceFix, 0);
}

@end