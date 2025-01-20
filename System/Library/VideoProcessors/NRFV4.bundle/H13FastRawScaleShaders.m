@interface H13FastRawScaleShaders
- (H13FastRawScaleShaders)initWithMetalContext:(id)a3;
- (MTLComputePipelineState)advBLESTApplyCorrection;
- (MTLComputePipelineState)advBLESTCalcMeanCorrection;
- (MTLComputePipelineState)advBLESTFilterEstimate;
- (MTLComputePipelineState)advBLESTFilterMeans;
- (MTLComputePipelineState)advBLESTHorizontalMeanBL;
- (MTLComputePipelineState)advBLESTInitialEstimate;
- (MTLComputePipelineState)advBLESTUpdateCorrection;
- (MTLComputePipelineState)advBLESTVerticalMeanBL;
- (MTLComputePipelineState)blackLevelCorrection;
- (MTLComputePipelineState)blackLevelEstimation;
- (MTLComputePipelineState)blackLevelEstimationQuadra;
- (MTLComputePipelineState)downscale;
- (MTLComputePipelineState)downscaleQuadra;
- (MTLComputePipelineState)extractFocusPixels;
- (MTLComputePipelineState)generateSashimiCopy;
- (MTLComputePipelineState)generateSyntheticThumbnail;
- (MTLComputePipelineState)generateSyntheticThumbnailQuadra;
- (MTLComputePipelineState)hoclXtalkCorrectionKernel;
- (MTLComputePipelineState)pdcMarkStaticDefects;
- (MTLComputePipelineState)pdcStaticDefectReplace;
- (MTLComputePipelineState)pdcWriteStaticDefectLookup;
- (MTLComputePipelineState)pdcWriteStaticDefectReplace;
- (MTLComputePipelineState)qhoclXtalkCorrectionKernel;
- (MTLComputePipelineState)qpdcCorrectStaticDefectsKernel;
- (MTLComputePipelineState)qpdcDynamicCorrectKernel;
- (MTLComputePipelineState)qpdcFocusPixelCorrectionKernel;
- (MTLComputePipelineState)qpdcReplaceStaticDefectsKernel;
- (MTLComputePipelineState)qpdcWriteCorrectedStaticDefectsKernel;
- (MTLComputePipelineState)sensorRawDecode;
- (SoftISPKernelWithFunctionConstants)pdcDetectionCorrectionScan;
- (SoftISPKernelWithFunctionConstants)processFocusPixelBlock;
- (SoftISPKernelWithFunctionConstants)processFocusPixelBlockPairs;
- (SoftISPKernelWithFunctionConstants)processFocusPixelBlockPairsFixedCenterIndex;
- (SoftISPKernelWithFunctionConstants)qpdcDynamicDetectKernel;
@end

@implementation H13FastRawScaleShaders

- (H13FastRawScaleShaders)initWithMetalContext:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_40;
  }
  v74.receiver = self;
  v74.super_class = (Class)H13FastRawScaleShaders;
  self = [(H13FastRawScaleShaders *)&v74 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_37;
  }
  v5 = [v4 computePipelineStateFor:@"H13FastRawScale::sensorRawDecode" constants:0];
  sensorRawDecode = self->_sensorRawDecode;
  self->_sensorRawDecode = v5;

  if (!self->_sensorRawDecode) {
    goto LABEL_40;
  }
  v7 = [v4 computePipelineStateFor:@"H13FastRawScale::blackLevelEstimation" constants:0];
  blackLevelEstimation = self->_blackLevelEstimation;
  self->_blackLevelEstimation = v7;

  if (!self->_blackLevelEstimation) {
    goto LABEL_40;
  }
  v9 = [v4 computePipelineStateFor:@"H13FastRawScale::blackLevelEstimationQuadra" constants:0];
  blackLevelEstimationQuadra = self->_blackLevelEstimationQuadra;
  self->_blackLevelEstimationQuadra = v9;

  if (!self->_blackLevelEstimationQuadra) {
    goto LABEL_40;
  }
  v11 = [v4 computePipelineStateFor:@"H13FastRawScale::blackLevelCorrection" constants:0];
  blackLevelCorrection = self->_blackLevelCorrection;
  self->_blackLevelCorrection = v11;

  if (!self->_blackLevelCorrection) {
    goto LABEL_40;
  }
  v13 = [v4 computePipelineStateFor:@"H13FastRawScale::advBLESTInitialEstimate" constants:0];
  advBLESTInitialEstimate = self->_advBLESTInitialEstimate;
  self->_advBLESTInitialEstimate = v13;

  if (!self->_advBLESTInitialEstimate) {
    goto LABEL_40;
  }
  v15 = [v4 computePipelineStateFor:@"H13FastRawScale::advBLESTFilterEstimate" constants:0];
  advBLESTFilterEstimate = self->_advBLESTFilterEstimate;
  self->_advBLESTFilterEstimate = v15;

  if (!self->_advBLESTFilterEstimate) {
    goto LABEL_40;
  }
  v17 = [v4 computePipelineStateFor:@"H13FastRawScale::advBLESTHorizontalMeanBL" constants:0];
  advBLESTHorizontalMeanBL = self->_advBLESTHorizontalMeanBL;
  self->_advBLESTHorizontalMeanBL = v17;

  if (!self->_advBLESTHorizontalMeanBL) {
    goto LABEL_40;
  }
  v19 = [v4 computePipelineStateFor:@"H13FastRawScale::advBLESTVerticalMeanBL" constants:0];
  advBLESTVerticalMeanBL = self->_advBLESTVerticalMeanBL;
  self->_advBLESTVerticalMeanBL = v19;

  if (!self->_advBLESTVerticalMeanBL) {
    goto LABEL_40;
  }
  v21 = [v4 computePipelineStateFor:@"H13FastRawScale::advBLESTFilterMeans" constants:0];
  advBLESTFilterMeans = self->_advBLESTFilterMeans;
  self->_advBLESTFilterMeans = v21;

  if (!self->_advBLESTFilterMeans) {
    goto LABEL_40;
  }
  v23 = [v4 computePipelineStateFor:@"H13FastRawScale::advBLESTUpdateCorrection" constants:0];
  advBLESTUpdateCorrection = self->_advBLESTUpdateCorrection;
  self->_advBLESTUpdateCorrection = v23;

  if (!self->_advBLESTUpdateCorrection) {
    goto LABEL_40;
  }
  v25 = [v4 computePipelineStateFor:@"H13FastRawScale::advBLESTCalcMeanCorrection" constants:0];
  advBLESTCalcMeanCorrection = self->_advBLESTCalcMeanCorrection;
  self->_advBLESTCalcMeanCorrection = v25;

  if (!self->_advBLESTCalcMeanCorrection) {
    goto LABEL_40;
  }
  v27 = [v4 computePipelineStateFor:@"H13FastRawScale::advBLESTApplyCorrection" constants:0];
  advBLESTApplyCorrection = self->_advBLESTApplyCorrection;
  self->_advBLESTApplyCorrection = v27;

  if (!self->_advBLESTApplyCorrection) {
    goto LABEL_40;
  }
  v29 = [v4 computePipelineStateFor:@"H13FastRawScale::pdcMarkStaticDefects" constants:0];
  pdcMarkStaticDefects = self->_pdcMarkStaticDefects;
  self->_pdcMarkStaticDefects = v29;

  if (!self->_pdcMarkStaticDefects) {
    goto LABEL_40;
  }
  v31 = [v4 computePipelineStateFor:@"H13FastRawScale::pdcStaticDefectReplace" constants:0];
  pdcStaticDefectReplace = self->_pdcStaticDefectReplace;
  self->_pdcStaticDefectReplace = v31;

  if (!self->_pdcStaticDefectReplace) {
    goto LABEL_40;
  }
  v33 = [v4 computePipelineStateFor:@"H13FastRawScale::pdcWriteStaticDefectReplace" constants:0];
  pdcWriteStaticDefectReplace = self->_pdcWriteStaticDefectReplace;
  self->_pdcWriteStaticDefectReplace = v33;

  if (!self->_pdcWriteStaticDefectReplace) {
    goto LABEL_40;
  }
  v35 = [v4 computePipelineStateFor:@"H13FastRawScale::pdcWriteStaticDefectLookup" constants:0];
  pdcWriteStaticDefectLookup = self->_pdcWriteStaticDefectLookup;
  self->_pdcWriteStaticDefectLookup = v35;

  if (!self->_pdcWriteStaticDefectLookup) {
    goto LABEL_40;
  }
  v37 = [v4 computePipelineStateFor:@"H13FastRawScale::hoclXtalkCorrectionKernel" constants:0];
  hoclXtalkCorrectionKernel = self->_hoclXtalkCorrectionKernel;
  self->_hoclXtalkCorrectionKernel = v37;

  if (!self->_hoclXtalkCorrectionKernel) {
    goto LABEL_40;
  }
  v39 = [v4 computePipelineStateFor:@"H13FastRawScale::qpdcReplaceStaticDefectsKernel" constants:0];
  qpdcReplaceStaticDefectsKernel = self->_qpdcReplaceStaticDefectsKernel;
  self->_qpdcReplaceStaticDefectsKernel = v39;

  if (!self->_qpdcReplaceStaticDefectsKernel) {
    goto LABEL_40;
  }
  v41 = [v4 computePipelineStateFor:@"H13FastRawScale::qpdcCorrectStaticDefectsKernel" constants:0];
  qpdcCorrectStaticDefectsKernel = self->_qpdcCorrectStaticDefectsKernel;
  self->_qpdcCorrectStaticDefectsKernel = v41;

  if (!self->_qpdcCorrectStaticDefectsKernel) {
    goto LABEL_40;
  }
  v43 = [v4 computePipelineStateFor:@"H13FastRawScale::qpdcWriteCorrectedStaticDefectsKernel" constants:0];
  qpdcWriteCorrectedStaticDefectsKernel = self->_qpdcWriteCorrectedStaticDefectsKernel;
  self->_qpdcWriteCorrectedStaticDefectsKernel = v43;

  if (!self->_qpdcWriteCorrectedStaticDefectsKernel) {
    goto LABEL_40;
  }
  v45 = [v4 computePipelineStateFor:@"H13FastRawScale::qpdcFocusPixelCorrectionKernel" constants:0];
  qpdcFocusPixelCorrectionKernel = self->_qpdcFocusPixelCorrectionKernel;
  self->_qpdcFocusPixelCorrectionKernel = v45;

  if (!self->_qpdcFocusPixelCorrectionKernel) {
    goto LABEL_40;
  }
  v47 = [v4 computePipelineStateFor:@"H13FastRawScale::qpdcDynamicCorrectKernel" constants:0];
  qpdcDynamicCorrectKernel = self->_qpdcDynamicCorrectKernel;
  self->_qpdcDynamicCorrectKernel = v47;

  if (!self->_qpdcDynamicCorrectKernel) {
    goto LABEL_40;
  }
  v49 = [v4 computePipelineStateFor:@"H13FastRawScale::qhoclXtalkCorrectionKernel" constants:0];
  qhoclXtalkCorrectionKernel = self->_qhoclXtalkCorrectionKernel;
  self->_qhoclXtalkCorrectionKernel = v49;

  if (!self->_qhoclXtalkCorrectionKernel) {
    goto LABEL_40;
  }
  v51 = [v4 computePipelineStateFor:@"H13FastRawScale::downscale" constants:0];
  downscale = self->_downscale;
  self->_downscale = v51;

  if (!self->_downscale) {
    goto LABEL_40;
  }
  v53 = [v4 computePipelineStateFor:@"H13FastRawScale::downscaleQuadra" constants:0];
  downscaleQuadra = self->_downscaleQuadra;
  self->_downscaleQuadra = v53;

  if (!self->_downscaleQuadra) {
    goto LABEL_40;
  }
  v55 = [v4 computePipelineStateFor:@"H13FastRawScale::generateSyntheticThumbnail" constants:0];
  generateSyntheticThumbnail = self->_generateSyntheticThumbnail;
  self->_generateSyntheticThumbnail = v55;

  if (!self->_generateSyntheticThumbnail) {
    goto LABEL_40;
  }
  v57 = [v4 computePipelineStateFor:@"H13FastRawScale::generateSyntheticThumbnailQuadra" constants:0];
  generateSyntheticThumbnailQuadra = self->_generateSyntheticThumbnailQuadra;
  self->_generateSyntheticThumbnailQuadra = v57;

  if (!self->_generateSyntheticThumbnailQuadra) {
    goto LABEL_40;
  }
  v59 = [v4 computePipelineStateFor:@"H13FastRawScale::extractFocusPixels" constants:0];
  extractFocusPixels = self->_extractFocusPixels;
  self->_extractFocusPixels = v59;

  if (!self->_extractFocusPixels) {
    goto LABEL_40;
  }
  v61 = [v4 computePipelineStateFor:@"H13FastRawScale::generateSashimiCopy" constants:0];
  generateSashimiCopy = self->_generateSashimiCopy;
  self->_generateSashimiCopy = v61;

  if (!self->_generateSashimiCopy) {
    goto LABEL_40;
  }
  v63 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastRawScale::pdcDetectionCorrectionScan" usingNamespace:@"H13FastRawScale::FunctionConstants" paramCombinations:&unk_270E990C0];
  pdcDetectionCorrectionScan = self->_pdcDetectionCorrectionScan;
  self->_pdcDetectionCorrectionScan = v63;

  if (!self->_pdcDetectionCorrectionScan) {
    goto LABEL_40;
  }
  v65 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastRawScale::processFocusPixelBlock" usingNamespace:@"H13FastRawScale::FunctionConstants" paramValues:&unk_270E98320];
  processFocusPixelBlock = self->_processFocusPixelBlock;
  self->_processFocusPixelBlock = v65;

  if (!self->_processFocusPixelBlock) {
    goto LABEL_40;
  }
  v67 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastRawScale::processFocusPixelBlockPairs" usingNamespace:@"H13FastRawScale::FunctionConstants" paramValues:&unk_270E98338];
  processFocusPixelBlockPairs = self->_processFocusPixelBlockPairs;
  self->_processFocusPixelBlockPairs = v67;

  if (!self->_processFocusPixelBlockPairs) {
    goto LABEL_40;
  }
  v69 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastRawScale::processFocusPixelBlockPairsFixedCenterIndex" usingNamespace:@"H13FastRawScale::FunctionConstants" paramValues:&unk_270E98350];
  processFocusPixelBlockPairsFixedCenterIndex = self->_processFocusPixelBlockPairsFixedCenterIndex;
  self->_processFocusPixelBlockPairsFixedCenterIndex = v69;

  if (!self->_processFocusPixelBlockPairsFixedCenterIndex
    || (v71 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastRawScale::qpdcDynamicDetectKernel" usingNamespace:@"H13FastRawScale::FunctionConstants" paramValues:&unk_270E98368], qpdcDynamicDetectKernel = self->_qpdcDynamicDetectKernel, self->_qpdcDynamicDetectKernel = v71, qpdcDynamicDetectKernel, !self->_qpdcDynamicDetectKernel))
  {
LABEL_40:
    FigDebugAssert3();

    self = 0;
  }
LABEL_37:

  return self;
}

- (SoftISPKernelWithFunctionConstants)processFocusPixelBlock
{
  return self->_processFocusPixelBlock;
}

- (SoftISPKernelWithFunctionConstants)processFocusPixelBlockPairs
{
  return self->_processFocusPixelBlockPairs;
}

- (SoftISPKernelWithFunctionConstants)processFocusPixelBlockPairsFixedCenterIndex
{
  return self->_processFocusPixelBlockPairsFixedCenterIndex;
}

- (SoftISPKernelWithFunctionConstants)pdcDetectionCorrectionScan
{
  return self->_pdcDetectionCorrectionScan;
}

- (SoftISPKernelWithFunctionConstants)qpdcDynamicDetectKernel
{
  return self->_qpdcDynamicDetectKernel;
}

- (MTLComputePipelineState)sensorRawDecode
{
  return self->_sensorRawDecode;
}

- (MTLComputePipelineState)blackLevelEstimation
{
  return self->_blackLevelEstimation;
}

- (MTLComputePipelineState)blackLevelEstimationQuadra
{
  return self->_blackLevelEstimationQuadra;
}

- (MTLComputePipelineState)blackLevelCorrection
{
  return self->_blackLevelCorrection;
}

- (MTLComputePipelineState)advBLESTInitialEstimate
{
  return self->_advBLESTInitialEstimate;
}

- (MTLComputePipelineState)advBLESTFilterEstimate
{
  return self->_advBLESTFilterEstimate;
}

- (MTLComputePipelineState)advBLESTHorizontalMeanBL
{
  return self->_advBLESTHorizontalMeanBL;
}

- (MTLComputePipelineState)advBLESTVerticalMeanBL
{
  return self->_advBLESTVerticalMeanBL;
}

- (MTLComputePipelineState)advBLESTFilterMeans
{
  return self->_advBLESTFilterMeans;
}

- (MTLComputePipelineState)advBLESTUpdateCorrection
{
  return self->_advBLESTUpdateCorrection;
}

- (MTLComputePipelineState)advBLESTCalcMeanCorrection
{
  return self->_advBLESTCalcMeanCorrection;
}

- (MTLComputePipelineState)advBLESTApplyCorrection
{
  return self->_advBLESTApplyCorrection;
}

- (MTLComputePipelineState)pdcMarkStaticDefects
{
  return self->_pdcMarkStaticDefects;
}

- (MTLComputePipelineState)pdcStaticDefectReplace
{
  return self->_pdcStaticDefectReplace;
}

- (MTLComputePipelineState)pdcWriteStaticDefectReplace
{
  return self->_pdcWriteStaticDefectReplace;
}

- (MTLComputePipelineState)pdcWriteStaticDefectLookup
{
  return self->_pdcWriteStaticDefectLookup;
}

- (MTLComputePipelineState)hoclXtalkCorrectionKernel
{
  return self->_hoclXtalkCorrectionKernel;
}

- (MTLComputePipelineState)qpdcReplaceStaticDefectsKernel
{
  return self->_qpdcReplaceStaticDefectsKernel;
}

- (MTLComputePipelineState)qpdcCorrectStaticDefectsKernel
{
  return self->_qpdcCorrectStaticDefectsKernel;
}

- (MTLComputePipelineState)qpdcWriteCorrectedStaticDefectsKernel
{
  return self->_qpdcWriteCorrectedStaticDefectsKernel;
}

- (MTLComputePipelineState)qpdcFocusPixelCorrectionKernel
{
  return self->_qpdcFocusPixelCorrectionKernel;
}

- (MTLComputePipelineState)qpdcDynamicCorrectKernel
{
  return self->_qpdcDynamicCorrectKernel;
}

- (MTLComputePipelineState)qhoclXtalkCorrectionKernel
{
  return self->_qhoclXtalkCorrectionKernel;
}

- (MTLComputePipelineState)downscale
{
  return self->_downscale;
}

- (MTLComputePipelineState)downscaleQuadra
{
  return self->_downscaleQuadra;
}

- (MTLComputePipelineState)generateSyntheticThumbnail
{
  return self->_generateSyntheticThumbnail;
}

- (MTLComputePipelineState)generateSyntheticThumbnailQuadra
{
  return self->_generateSyntheticThumbnailQuadra;
}

- (MTLComputePipelineState)extractFocusPixels
{
  return self->_extractFocusPixels;
}

- (MTLComputePipelineState)generateSashimiCopy
{
  return self->_generateSashimiCopy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generateSashimiCopy, 0);
  objc_storeStrong((id *)&self->_extractFocusPixels, 0);
  objc_storeStrong((id *)&self->_generateSyntheticThumbnailQuadra, 0);
  objc_storeStrong((id *)&self->_generateSyntheticThumbnail, 0);
  objc_storeStrong((id *)&self->_downscaleQuadra, 0);
  objc_storeStrong((id *)&self->_downscale, 0);
  objc_storeStrong((id *)&self->_qhoclXtalkCorrectionKernel, 0);
  objc_storeStrong((id *)&self->_qpdcDynamicCorrectKernel, 0);
  objc_storeStrong((id *)&self->_qpdcFocusPixelCorrectionKernel, 0);
  objc_storeStrong((id *)&self->_qpdcWriteCorrectedStaticDefectsKernel, 0);
  objc_storeStrong((id *)&self->_qpdcCorrectStaticDefectsKernel, 0);
  objc_storeStrong((id *)&self->_qpdcReplaceStaticDefectsKernel, 0);
  objc_storeStrong((id *)&self->_hoclXtalkCorrectionKernel, 0);
  objc_storeStrong((id *)&self->_pdcWriteStaticDefectLookup, 0);
  objc_storeStrong((id *)&self->_pdcWriteStaticDefectReplace, 0);
  objc_storeStrong((id *)&self->_pdcStaticDefectReplace, 0);
  objc_storeStrong((id *)&self->_pdcMarkStaticDefects, 0);
  objc_storeStrong((id *)&self->_advBLESTApplyCorrection, 0);
  objc_storeStrong((id *)&self->_advBLESTCalcMeanCorrection, 0);
  objc_storeStrong((id *)&self->_advBLESTUpdateCorrection, 0);
  objc_storeStrong((id *)&self->_advBLESTFilterMeans, 0);
  objc_storeStrong((id *)&self->_advBLESTVerticalMeanBL, 0);
  objc_storeStrong((id *)&self->_advBLESTHorizontalMeanBL, 0);
  objc_storeStrong((id *)&self->_advBLESTFilterEstimate, 0);
  objc_storeStrong((id *)&self->_advBLESTInitialEstimate, 0);
  objc_storeStrong((id *)&self->_blackLevelCorrection, 0);
  objc_storeStrong((id *)&self->_blackLevelEstimationQuadra, 0);
  objc_storeStrong((id *)&self->_blackLevelEstimation, 0);
  objc_storeStrong((id *)&self->_sensorRawDecode, 0);
  objc_storeStrong((id *)&self->_qpdcDynamicDetectKernel, 0);
  objc_storeStrong((id *)&self->_pdcDetectionCorrectionScan, 0);
  objc_storeStrong((id *)&self->_processFocusPixelBlockPairsFixedCenterIndex, 0);
  objc_storeStrong((id *)&self->_processFocusPixelBlockPairs, 0);

  objc_storeStrong((id *)&self->_processFocusPixelBlock, 0);
}

@end