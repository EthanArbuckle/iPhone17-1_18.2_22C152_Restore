@interface GlobalDistortionCorrectionShaders
- (GlobalDistortionCorrectionShaders)initWithMetal:(id)a3;
@end

@implementation GlobalDistortionCorrectionShaders

- (GlobalDistortionCorrectionShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GlobalDistortionCorrectionShaders;
  v6 = [(GlobalDistortionCorrectionShaders *)&v26 init];
  if (!v6) {
    goto LABEL_8;
  }
  uint64_t v7 = objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"kernelGlobalDistortionCorrectionHWCSC", 0);
  kernelGlobalDistortionCorrectionHWCSC = v6->_kernelGlobalDistortionCorrectionHWCSC;
  v6->_kernelGlobalDistortionCorrectionHWCSC = (MTLComputePipelineState *)v7;

  if (!v6->_kernelGlobalDistortionCorrectionHWCSC) {
    goto LABEL_10;
  }
  uint64_t v10 = objc_msgSend_computePipelineStateFor_constants_(v4, v9, @"kernelGlobalDistortionCorrectionCopy", 0);
  kernelGlobalDistortionCorrectionCopy = v6->_kernelGlobalDistortionCorrectionCopy;
  v6->_kernelGlobalDistortionCorrectionCopy = (MTLComputePipelineState *)v10;

  if (!v6->_kernelGlobalDistortionCorrectionCopy) {
    goto LABEL_10;
  }
  uint64_t v13 = objc_msgSend_computePipelineStateFor_constants_(v4, v12, @"kernelGlobalDistortionCorrectionSWCSCtoLinearRGB", 0);
  kernelGlobalDistortionCorrectionSWCSCtoLinearRGB = v6->_kernelGlobalDistortionCorrectionSWCSCtoLinearRGB;
  v6->_kernelGlobalDistortionCorrectionSWCSCtoLinearRGB = (MTLComputePipelineState *)v13;

  if (!v6->_kernelGlobalDistortionCorrectionSWCSCtoLinearRGB) {
    goto LABEL_10;
  }
  uint64_t v16 = objc_msgSend_computePipelineStateFor_constants_(v4, v15, @"kernelGlobalDistortionCorrectionLinearRGB", 0);
  kernelGlobalDistortionCorrectionLinearRGB = v6->_kernelGlobalDistortionCorrectionLinearRGB;
  v6->_kernelGlobalDistortionCorrectionLinearRGB = (MTLComputePipelineState *)v16;

  if (!v6->_kernelGlobalDistortionCorrectionLinearRGB) {
    goto LABEL_10;
  }
  uint64_t v19 = objc_msgSend_computePipelineStateFor_constants_(v4, v18, @"kernelPack10BitY", 0);
  kernelPack10BitY = v6->_kernelPack10BitY;
  v6->_kernelPack10BitY = (MTLComputePipelineState *)v19;

  if (!v6->_kernelPack10BitY) {
    goto LABEL_10;
  }
  uint64_t v22 = objc_msgSend_computePipelineStateFor_constants_(v4, v21, @"kernelPack10BitCbCr", 0);
  kernelPack10BitCbCr = v6->_kernelPack10BitCbCr;
  v6->_kernelPack10BitCbCr = (MTLComputePipelineState *)v22;

  if (v6->_kernelPack10BitCbCr)
  {
LABEL_8:
    v24 = v6;
  }
  else
  {
LABEL_10:
    FigDebugAssert3();
    FigSignalErrorAt();
    v24 = 0;
  }

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kernelGlobalDistortionCorrectionLinearRGB, 0);
  objc_storeStrong((id *)&self->_kernelGlobalDistortionCorrectionSWCSCtoLinearRGB, 0);
  objc_storeStrong((id *)&self->_kernelPack10BitCbCr, 0);
  objc_storeStrong((id *)&self->_kernelPack10BitY, 0);
  objc_storeStrong((id *)&self->_kernelGlobalDistortionCorrectionCopy, 0);

  objc_storeStrong((id *)&self->_kernelGlobalDistortionCorrectionHWCSC, 0);
}

@end