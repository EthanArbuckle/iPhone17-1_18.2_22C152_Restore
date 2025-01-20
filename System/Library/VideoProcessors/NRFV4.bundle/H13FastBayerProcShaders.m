@interface H13FastBayerProcShaders
- (H13FastBayerProcShaders)initWithMetalContext:(id)a3;
- (MTLComputePipelineState)calcuateFlareDetectionResult;
- (MTLComputePipelineState)convertI17ToF16;
- (MTLComputePipelineState)convertScaledToI17;
- (MTLComputePipelineState)convertToU16;
- (MTLComputePipelineState)draftDemosaicBayer;
- (MTLComputePipelineState)draftDemosaicQuadra2x;
- (MTLComputePipelineState)generateFlareMapPerThreadgroup;
- (MTLComputePipelineState)hoclBin;
- (MTLComputePipelineState)hrGenerateHuemapThumbnails;
- (MTLComputePipelineState)hrHighlightRecoveryQuadra_FirstPixB;
- (MTLComputePipelineState)hrHighlightRecoveryQuadra_FirstPixGB;
- (MTLComputePipelineState)hrHighlightRecoveryQuadra_FirstPixGR;
- (MTLComputePipelineState)hrHighlightRecoveryQuadra_FirstPixR;
- (MTLComputePipelineState)hrHighlightRecovery_FirstPixB;
- (MTLComputePipelineState)hrHighlightRecovery_FirstPixGB;
- (MTLComputePipelineState)hrHighlightRecovery_FirstPixGR;
- (MTLComputePipelineState)hrHighlightRecovery_FirstPixR;
- (MTLComputePipelineState)hrPreprocessDSLUT;
- (MTLComputePipelineState)hrdGnuCorrectionQuadra;
- (MTLComputePipelineState)hrdRedBlueFilter;
- (MTLComputePipelineState)hrdRedBlueFilterQuadra;
- (MTLComputePipelineState)huemap;
- (MTLComputePipelineState)huemapMotionCompensation;
- (MTLComputePipelineState)huemapThumbnailGeneration0;
- (MTLComputePipelineState)huemapThumbnailGeneration0Quadra;
- (MTLComputePipelineState)summarizeFlareMap;
- (SoftISPKernelWithFunctionConstants)hrdGnuCorrection;
- (SoftISPKernelWithFunctionConstants)preHR;
- (SoftISPKernelWithFunctionConstants)preHRQuadra;
@end

@implementation H13FastBayerProcShaders

- (H13FastBayerProcShaders)initWithMetalContext:(id)a3
{
  id v4 = a3;
  char v67 = 0;
  if (!v4) {
    goto LABEL_36;
  }
  v66.receiver = self;
  v66.super_class = (Class)H13FastBayerProcShaders;
  self = [(H13FastBayerProcShaders *)&v66 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_33;
  }
  v5 = [v4 computePipelineStateFor:@"H13Fast::convertToU16" constants:0];
  convertToU16 = self->_convertToU16;
  self->_convertToU16 = v5;

  if (!self->_convertToU16) {
    goto LABEL_36;
  }
  v7 = [v4 computePipelineStateFor:@"H13Fast::convertI17ToF16" constants:0];
  convertI17ToF16 = self->_convertI17ToF16;
  self->_convertI17ToF16 = v7;

  if (!self->_convertI17ToF16) {
    goto LABEL_36;
  }
  v9 = [v4 computePipelineStateFor:@"H13Fast::convertScaledToI17" constants:0];
  convertScaledToI17 = self->_convertScaledToI17;
  self->_convertScaledToI17 = v9;

  if (!self->_convertScaledToI17) {
    goto LABEL_36;
  }
  v11 = [v4 computePipelineStateFor:@"H13FastBayerProc::hrPreprocessDSLUT" constants:0];
  hrPreprocessDSLUT = self->_hrPreprocessDSLUT;
  self->_hrPreprocessDSLUT = v11;

  if (!self->_hrPreprocessDSLUT) {
    goto LABEL_36;
  }
  v13 = [v4 computePipelineStateFor:@"H13FastBayerProc::hrGenerateHuemapThumbnails" constants:0];
  hrGenerateHuemapThumbnails = self->_hrGenerateHuemapThumbnails;
  self->_hrGenerateHuemapThumbnails = v13;

  if (!self->_hrGenerateHuemapThumbnails) {
    goto LABEL_36;
  }
  v15 = [v4 computePipelineStateFor:@"H13FastBayerProc::hrHighlightRecovery_FirstPixGR" constants:0];
  hrHighlightRecovery_FirstPixGR = self->_hrHighlightRecovery_FirstPixGR;
  self->_hrHighlightRecovery_FirstPixGR = v15;

  if (!self->_hrHighlightRecovery_FirstPixGR) {
    goto LABEL_36;
  }
  v17 = [v4 computePipelineStateFor:@"H13FastBayerProc::hrHighlightRecovery_FirstPixR" constants:0];
  hrHighlightRecovery_FirstPixR = self->_hrHighlightRecovery_FirstPixR;
  self->_hrHighlightRecovery_FirstPixR = v17;

  if (!self->_hrHighlightRecovery_FirstPixR) {
    goto LABEL_36;
  }
  v19 = [v4 computePipelineStateFor:@"H13FastBayerProc::hrHighlightRecovery_FirstPixB" constants:0];
  hrHighlightRecovery_FirstPixB = self->_hrHighlightRecovery_FirstPixB;
  self->_hrHighlightRecovery_FirstPixB = v19;

  if (!self->_hrHighlightRecovery_FirstPixB) {
    goto LABEL_36;
  }
  v21 = [v4 computePipelineStateFor:@"H13FastBayerProc::hrHighlightRecovery_FirstPixGB" constants:0];
  hrHighlightRecovery_FirstPixGB = self->_hrHighlightRecovery_FirstPixGB;
  self->_hrHighlightRecovery_FirstPixGB = v21;

  if (!self->_hrHighlightRecovery_FirstPixGB) {
    goto LABEL_36;
  }
  v23 = [v4 computePipelineStateFor:@"H13FastBayerProc::hrHighlightRecoveryQuadra_FirstPixGR" constants:0];
  hrHighlightRecoveryQuadra_FirstPixGR = self->_hrHighlightRecoveryQuadra_FirstPixGR;
  self->_hrHighlightRecoveryQuadra_FirstPixGR = v23;

  if (!self->_hrHighlightRecoveryQuadra_FirstPixGR) {
    goto LABEL_36;
  }
  v25 = [v4 computePipelineStateFor:@"H13FastBayerProc::hrHighlightRecoveryQuadra_FirstPixR" constants:0];
  hrHighlightRecoveryQuadra_FirstPixR = self->_hrHighlightRecoveryQuadra_FirstPixR;
  self->_hrHighlightRecoveryQuadra_FirstPixR = v25;

  if (!self->_hrHighlightRecoveryQuadra_FirstPixR) {
    goto LABEL_36;
  }
  v27 = [v4 computePipelineStateFor:@"H13FastBayerProc::hrHighlightRecoveryQuadra_FirstPixB" constants:0];
  hrHighlightRecoveryQuadra_FirstPixB = self->_hrHighlightRecoveryQuadra_FirstPixB;
  self->_hrHighlightRecoveryQuadra_FirstPixB = v27;

  if (!self->_hrHighlightRecoveryQuadra_FirstPixB) {
    goto LABEL_36;
  }
  v29 = [v4 computePipelineStateFor:@"H13FastBayerProc::hrHighlightRecoveryQuadra_FirstPixGB" constants:0];
  hrHighlightRecoveryQuadra_FirstPixGB = self->_hrHighlightRecoveryQuadra_FirstPixGB;
  self->_hrHighlightRecoveryQuadra_FirstPixGB = v29;

  if (!self->_hrHighlightRecoveryQuadra_FirstPixGB) {
    goto LABEL_36;
  }
  v31 = [v4 computePipelineStateFor:@"H13FastBayerProc::huemapThumbnailGeneration0" constants:0];
  huemapThumbnailGeneration0 = self->_huemapThumbnailGeneration0;
  self->_huemapThumbnailGeneration0 = v31;

  if (!self->_huemapThumbnailGeneration0) {
    goto LABEL_36;
  }
  v33 = [v4 computePipelineStateFor:@"H13FastBayerProc::huemapThumbnailGeneration0Quadra" constants:0];
  huemapThumbnailGeneration0Quadra = self->_huemapThumbnailGeneration0Quadra;
  self->_huemapThumbnailGeneration0Quadra = v33;

  if (!self->_huemapThumbnailGeneration0Quadra) {
    goto LABEL_36;
  }
  v35 = [v4 computePipelineStateFor:@"H13FastBayerProc::huemapMotionCompensation" constants:0];
  huemapMotionCompensation = self->_huemapMotionCompensation;
  self->_huemapMotionCompensation = v35;

  if (!self->_huemapMotionCompensation) {
    goto LABEL_36;
  }
  v37 = [v4 computePipelineStateFor:@"H13FastBayerProc::hrdGnuCorrectionQuadra" constants:0];
  hrdGnuCorrectionQuadra = self->_hrdGnuCorrectionQuadra;
  self->_hrdGnuCorrectionQuadra = v37;

  if (!self->_hrdGnuCorrectionQuadra) {
    goto LABEL_36;
  }
  v39 = [v4 computePipelineStateFor:@"H13FastBayerProc::huemap" constants:0];
  huemap = self->_huemap;
  self->_huemap = v39;

  if (!self->_huemap) {
    goto LABEL_36;
  }
  v41 = [v4 computePipelineStateFor:@"H13FastBayerProc::generateFlareMapPerThreadgroup" constants:0];
  generateFlareMapPerThreadgroup = self->_generateFlareMapPerThreadgroup;
  self->_generateFlareMapPerThreadgroup = v41;

  if (!self->_generateFlareMapPerThreadgroup) {
    goto LABEL_36;
  }
  v43 = [v4 computePipelineStateFor:@"H13FastBayerProc::summarizeFlareMap" constants:0];
  summarizeFlareMap = self->_summarizeFlareMap;
  self->_summarizeFlareMap = v43;

  if (!self->_summarizeFlareMap) {
    goto LABEL_36;
  }
  v45 = [v4 computePipelineStateFor:@"H13FastBayerProc::calcuateFlareDetectionResult" constants:0];
  calcuateFlareDetectionResult = self->_calcuateFlareDetectionResult;
  self->_calcuateFlareDetectionResult = v45;

  if (!self->_calcuateFlareDetectionResult) {
    goto LABEL_36;
  }
  v47 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastBayerProc::preHR" usingNamespace:@"H13FastBayerProc::FunctionConstants" paramCombinations:&unk_270E98F58];
  preHR = self->_preHR;
  self->_preHR = v47;

  if (!self->_preHR) {
    goto LABEL_36;
  }
  v49 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastBayerProc::preHRQuadra" usingNamespace:@"H13FastBayerProc::FunctionConstants" paramCombinations:&unk_270E98F80];
  preHRQuadra = self->_preHRQuadra;
  self->_preHRQuadra = v49;

  if (!self->_preHRQuadra) {
    goto LABEL_36;
  }
  v51 = [v4 computePipelineStateFor:@"H13FastBayerProc::hoclBin" constants:0];
  hoclBin = self->_hoclBin;
  self->_hoclBin = v51;

  if (!self->_hoclBin
    || (v53 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastBayerProc::hrdGnuCorrection" usingNamespace:@"H13FastBayerProc::FunctionConstants" paramCombinations:&unk_270E98FA8], hrdGnuCorrection = self->_hrdGnuCorrection, self->_hrdGnuCorrection = v53, hrdGnuCorrection, !self->_hrdGnuCorrection))
  {
LABEL_36:
    FigDebugAssert3();
LABEL_37:

    self = 0;
    goto LABEL_33;
  }
  v55 = [v4 device];
  char v67 = [v55 supportsFamily:1008];

  v56 = objc_opt_new();
  [v56 setConstantValue:&v67 type:53 withName:@"H13FastBayerProc::FunctionConstants::simdShuffleFillSupported"];
  v57 = [v4 computePipelineStateFor:@"H13FastBayerProc::hrdRedBlueFilter" constants:v56];
  hrdRedBlueFilter = self->_hrdRedBlueFilter;
  self->_hrdRedBlueFilter = v57;

  if (!self->_hrdRedBlueFilter) {
    goto LABEL_42;
  }
  v59 = [v4 computePipelineStateFor:@"H13FastBayerProc::hrdRedBlueFilterQuadra" constants:v56];
  hrdRedBlueFilterQuadra = self->_hrdRedBlueFilterQuadra;
  self->_hrdRedBlueFilterQuadra = v59;

  if (!self->_hrdRedBlueFilterQuadra) {
    goto LABEL_42;
  }
  v61 = [v4 computePipelineStateFor:@"H13FastBayerProc::draftDemosaicBayer" constants:0];
  draftDemosaicBayer = self->_draftDemosaicBayer;
  self->_draftDemosaicBayer = v61;

  if (!self->_draftDemosaicBayer
    || ([v4 computePipelineStateFor:@"H13FastBayerProc::draftDemosaicQuadra2x" constants:0],
        v63 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(),
        draftDemosaicQuadra2x = self->_draftDemosaicQuadra2x,
        self->_draftDemosaicQuadra2x = v63,
        draftDemosaicQuadra2x,
        !self->_draftDemosaicQuadra2x))
  {
LABEL_42:
    FigDebugAssert3();

    goto LABEL_37;
  }
  self = self;

LABEL_33:
  return self;
}

- (MTLComputePipelineState)convertToU16
{
  return self->_convertToU16;
}

- (MTLComputePipelineState)convertI17ToF16
{
  return self->_convertI17ToF16;
}

- (MTLComputePipelineState)convertScaledToI17
{
  return self->_convertScaledToI17;
}

- (MTLComputePipelineState)hrPreprocessDSLUT
{
  return self->_hrPreprocessDSLUT;
}

- (MTLComputePipelineState)hrGenerateHuemapThumbnails
{
  return self->_hrGenerateHuemapThumbnails;
}

- (MTLComputePipelineState)hrHighlightRecovery_FirstPixGR
{
  return self->_hrHighlightRecovery_FirstPixGR;
}

- (MTLComputePipelineState)hrHighlightRecovery_FirstPixR
{
  return self->_hrHighlightRecovery_FirstPixR;
}

- (MTLComputePipelineState)hrHighlightRecovery_FirstPixB
{
  return self->_hrHighlightRecovery_FirstPixB;
}

- (MTLComputePipelineState)hrHighlightRecovery_FirstPixGB
{
  return self->_hrHighlightRecovery_FirstPixGB;
}

- (MTLComputePipelineState)hrHighlightRecoveryQuadra_FirstPixGR
{
  return self->_hrHighlightRecoveryQuadra_FirstPixGR;
}

- (MTLComputePipelineState)hrHighlightRecoveryQuadra_FirstPixR
{
  return self->_hrHighlightRecoveryQuadra_FirstPixR;
}

- (MTLComputePipelineState)hrHighlightRecoveryQuadra_FirstPixB
{
  return self->_hrHighlightRecoveryQuadra_FirstPixB;
}

- (MTLComputePipelineState)hrHighlightRecoveryQuadra_FirstPixGB
{
  return self->_hrHighlightRecoveryQuadra_FirstPixGB;
}

- (MTLComputePipelineState)huemapThumbnailGeneration0
{
  return self->_huemapThumbnailGeneration0;
}

- (MTLComputePipelineState)huemapThumbnailGeneration0Quadra
{
  return self->_huemapThumbnailGeneration0Quadra;
}

- (MTLComputePipelineState)huemapMotionCompensation
{
  return self->_huemapMotionCompensation;
}

- (MTLComputePipelineState)hrdGnuCorrectionQuadra
{
  return self->_hrdGnuCorrectionQuadra;
}

- (MTLComputePipelineState)huemap
{
  return self->_huemap;
}

- (MTLComputePipelineState)generateFlareMapPerThreadgroup
{
  return self->_generateFlareMapPerThreadgroup;
}

- (MTLComputePipelineState)summarizeFlareMap
{
  return self->_summarizeFlareMap;
}

- (MTLComputePipelineState)calcuateFlareDetectionResult
{
  return self->_calcuateFlareDetectionResult;
}

- (SoftISPKernelWithFunctionConstants)preHR
{
  return self->_preHR;
}

- (SoftISPKernelWithFunctionConstants)preHRQuadra
{
  return self->_preHRQuadra;
}

- (MTLComputePipelineState)hoclBin
{
  return self->_hoclBin;
}

- (SoftISPKernelWithFunctionConstants)hrdGnuCorrection
{
  return self->_hrdGnuCorrection;
}

- (MTLComputePipelineState)hrdRedBlueFilter
{
  return self->_hrdRedBlueFilter;
}

- (MTLComputePipelineState)hrdRedBlueFilterQuadra
{
  return self->_hrdRedBlueFilterQuadra;
}

- (MTLComputePipelineState)draftDemosaicBayer
{
  return self->_draftDemosaicBayer;
}

- (MTLComputePipelineState)draftDemosaicQuadra2x
{
  return self->_draftDemosaicQuadra2x;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draftDemosaicQuadra2x, 0);
  objc_storeStrong((id *)&self->_draftDemosaicBayer, 0);
  objc_storeStrong((id *)&self->_hrdRedBlueFilterQuadra, 0);
  objc_storeStrong((id *)&self->_hrdRedBlueFilter, 0);
  objc_storeStrong((id *)&self->_hrdGnuCorrection, 0);
  objc_storeStrong((id *)&self->_hoclBin, 0);
  objc_storeStrong((id *)&self->_preHRQuadra, 0);
  objc_storeStrong((id *)&self->_preHR, 0);
  objc_storeStrong((id *)&self->_calcuateFlareDetectionResult, 0);
  objc_storeStrong((id *)&self->_summarizeFlareMap, 0);
  objc_storeStrong((id *)&self->_generateFlareMapPerThreadgroup, 0);
  objc_storeStrong((id *)&self->_huemap, 0);
  objc_storeStrong((id *)&self->_hrdGnuCorrectionQuadra, 0);
  objc_storeStrong((id *)&self->_huemapMotionCompensation, 0);
  objc_storeStrong((id *)&self->_huemapThumbnailGeneration0Quadra, 0);
  objc_storeStrong((id *)&self->_huemapThumbnailGeneration0, 0);
  objc_storeStrong((id *)&self->_hrHighlightRecoveryQuadra_FirstPixGB, 0);
  objc_storeStrong((id *)&self->_hrHighlightRecoveryQuadra_FirstPixB, 0);
  objc_storeStrong((id *)&self->_hrHighlightRecoveryQuadra_FirstPixR, 0);
  objc_storeStrong((id *)&self->_hrHighlightRecoveryQuadra_FirstPixGR, 0);
  objc_storeStrong((id *)&self->_hrHighlightRecovery_FirstPixGB, 0);
  objc_storeStrong((id *)&self->_hrHighlightRecovery_FirstPixB, 0);
  objc_storeStrong((id *)&self->_hrHighlightRecovery_FirstPixR, 0);
  objc_storeStrong((id *)&self->_hrHighlightRecovery_FirstPixGR, 0);
  objc_storeStrong((id *)&self->_hrGenerateHuemapThumbnails, 0);
  objc_storeStrong((id *)&self->_hrPreprocessDSLUT, 0);
  objc_storeStrong((id *)&self->_convertScaledToI17, 0);
  objc_storeStrong((id *)&self->_convertI17ToF16, 0);

  objc_storeStrong((id *)&self->_convertToU16, 0);
}

@end