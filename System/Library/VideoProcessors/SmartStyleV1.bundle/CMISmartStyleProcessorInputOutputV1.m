@interface CMISmartStyleProcessorInputOutputV1
- (BOOL)applyDither;
- (BOOL)residualsCalculationDisabled;
- (BOOL)subjectRelightingEnabled;
- (CGRect)deltaMapRegionToRenderRect;
- (CGRect)inputCropRectWithinPrimaryCaptureRect;
- (CGRect)inputLinearCropRect;
- (CGRect)inputPersonMaskCropRect;
- (CGRect)inputReferenceForDeltaMapComputationCropRect;
- (CGRect)inputSkinMaskCropRect;
- (CGRect)inputSkyMaskCropRect;
- (CGRect)inputUnstyledCropRect;
- (CGRect)inputUnstyledThumbnailCropRect;
- (CGRect)outputDeltaMapCropRect;
- (CGRect)outputRenderRect;
- (CGRect)outputStyledCropRect;
- (CGRect)primaryCaptureRect;
- (CMISmartStyle)inputSmartStyle;
- (CMISmartStyleProcessorInputOutputV1)init;
- (MTLSharedEvent)metalSharedEvent;
- (NSData)outputSRLStats;
- (NSDictionary)inputLinearMetadataDict;
- (NSDictionary)inputMetadataDict;
- (NSMutableDictionary)outputCodedLinearThumbnailMetadata;
- (NSMutableDictionary)outputImageStatistics;
- (NSMutableDictionary)outputImageStatisticsExtended;
- (NSString)inputTuningType;
- (__CVBuffer)inputDeltaMapPixelBuffer;
- (__CVBuffer)inputGainMapPixelBuffer;
- (__CVBuffer)inputLearningTargetPixelBuffer;
- (__CVBuffer)inputLearningTargetThumbnailPixelBuffer;
- (__CVBuffer)inputLinearPixelBuffer;
- (__CVBuffer)inputPersonMaskPixelBuffer;
- (__CVBuffer)inputReferenceForDeltaMapComputationPixelBuffer;
- (__CVBuffer)inputSRLPixelBuffer;
- (__CVBuffer)inputSkinMaskPixelBuffer;
- (__CVBuffer)inputSkyMaskPixelBuffer;
- (__CVBuffer)inputStyleCoefficientsPixelBuffer;
- (__CVBuffer)inputUnstyledPixelBuffer;
- (__CVBuffer)inputUnstyledThumbnailPixelBuffer;
- (__CVBuffer)outputCodedLinearThumbnailPixelBuffer;
- (__CVBuffer)outputDeltaMapPixelBuffer;
- (__CVBuffer)outputGainMapPixelBuffer;
- (__CVBuffer)outputLearnedStyleCoefficientsPixelBuffer;
- (__CVBuffer)outputSmallLightMapPixelBuffer;
- (__CVBuffer)outputSmallLinearLightMapPixelBuffer;
- (__CVBuffer)outputStyledPixelBuffer;
- (__n128)setSpotlightAffineTransform:(__n128)a3;
- (__n128)spotlightAffineTransform;
- (float)globalLinearSystemMixFactor;
- (float)outputSRLCurveParameter;
- (float)personMasksValidHint;
- (int)semanticStyleSceneType;
- (void)dealloc;
- (void)setApplyDither:(BOOL)a3;
- (void)setDeltaMapRegionToRenderRect:(CGRect)a3;
- (void)setGlobalLinearSystemMixFactor:(float)a3;
- (void)setInputCropRectWithinPrimaryCaptureRect:(CGRect)a3;
- (void)setInputDeltaMapPixelBuffer:(__CVBuffer *)a3;
- (void)setInputGainMapPixelBuffer:(__CVBuffer *)a3;
- (void)setInputLearningTargetPixelBuffer:(__CVBuffer *)a3;
- (void)setInputLearningTargetThumbnailPixelBuffer:(__CVBuffer *)a3;
- (void)setInputLinearCropRect:(CGRect)a3;
- (void)setInputLinearMetadataDict:(id)a3;
- (void)setInputLinearPixelBuffer:(__CVBuffer *)a3;
- (void)setInputMetadataDict:(id)a3;
- (void)setInputPersonMaskCropRect:(CGRect)a3;
- (void)setInputPersonMaskPixelBuffer:(__CVBuffer *)a3;
- (void)setInputReferenceForDeltaMapComputationCropRect:(CGRect)a3;
- (void)setInputReferenceForDeltaMapComputationPixelBuffer:(__CVBuffer *)a3;
- (void)setInputSRLPixelBuffer:(__CVBuffer *)a3;
- (void)setInputSkinMaskCropRect:(CGRect)a3;
- (void)setInputSkinMaskPixelBuffer:(__CVBuffer *)a3;
- (void)setInputSkyMaskCropRect:(CGRect)a3;
- (void)setInputSkyMaskPixelBuffer:(__CVBuffer *)a3;
- (void)setInputSmartStyle:(id)a3;
- (void)setInputStyleCoefficientsPixelBuffer:(__CVBuffer *)a3;
- (void)setInputTuningType:(id)a3;
- (void)setInputUnstyledCropRect:(CGRect)a3;
- (void)setInputUnstyledPixelBuffer:(__CVBuffer *)a3;
- (void)setInputUnstyledThumbnailCropRect:(CGRect)a3;
- (void)setInputUnstyledThumbnailPixelBuffer:(__CVBuffer *)a3;
- (void)setMetalSharedEvent:(id)a3;
- (void)setOutputCodedLinearThumbnailMetadata:(id)a3;
- (void)setOutputCodedLinearThumbnailPixelBuffer:(__CVBuffer *)a3;
- (void)setOutputDeltaMapCropRect:(CGRect)a3;
- (void)setOutputDeltaMapPixelBuffer:(__CVBuffer *)a3;
- (void)setOutputGainMapPixelBuffer:(__CVBuffer *)a3;
- (void)setOutputImageStatistics:(id)a3;
- (void)setOutputImageStatisticsExtended:(id)a3;
- (void)setOutputLearnedStyleCoefficientsPixelBuffer:(__CVBuffer *)a3;
- (void)setOutputRenderRect:(CGRect)a3;
- (void)setOutputSRLCurveParameter:(float)a3;
- (void)setOutputSRLStats:(id)a3;
- (void)setOutputSmallLightMapPixelBuffer:(__CVBuffer *)a3;
- (void)setOutputSmallLinearLightMapPixelBuffer:(__CVBuffer *)a3;
- (void)setOutputStyledCropRect:(CGRect)a3;
- (void)setOutputStyledPixelBuffer:(__CVBuffer *)a3;
- (void)setPersonMasksValidHint:(float)a3;
- (void)setPrimaryCaptureRect:(CGRect)a3;
- (void)setResidualsCalculationDisabled:(BOOL)a3;
- (void)setSemanticStyleSceneType:(int)a3;
- (void)setSubjectRelightingEnabled:(BOOL)a3;
@end

@implementation CMISmartStyleProcessorInputOutputV1

- (CMISmartStyleProcessorInputOutputV1)init
{
  v7.receiver = self;
  v7.super_class = (Class)CMISmartStyleProcessorInputOutputV1;
  v2 = [(CMISmartStyleProcessorInputOutputV1 *)&v7 init];
  v3 = v2;
  if (v2)
  {
    LODWORD(v2[1].super.isa) = 1065353216;
    v2[1]._globalLinearSystemMixFactor = 1.0;
    v2->_outputSRLCurveParameter = -1.0;
    outputSRLStats = v2->_outputSRLStats;
    v2->_outputSRLStats = 0;

    v3->_personMasksValidHint = -1.0;
    v5 = v3;
  }
  else
  {
    FigDebugAssert3();
  }

  return v3;
}

- (void)dealloc
{
  inputUnstyledPixelBuffer = self->_inputUnstyledPixelBuffer;
  if (inputUnstyledPixelBuffer) {
    CFRelease(inputUnstyledPixelBuffer);
  }
  inputUnstyledThumbnailPixelBuffer = self->_inputUnstyledThumbnailPixelBuffer;
  if (inputUnstyledThumbnailPixelBuffer) {
    CFRelease(inputUnstyledThumbnailPixelBuffer);
  }
  inputLearningTargetPixelBuffer = self->_inputLearningTargetPixelBuffer;
  if (inputLearningTargetPixelBuffer) {
    CFRelease(inputLearningTargetPixelBuffer);
  }
  inputLearningTargetThumbnailPixelBuffer = self->_inputLearningTargetThumbnailPixelBuffer;
  if (inputLearningTargetThumbnailPixelBuffer) {
    CFRelease(inputLearningTargetThumbnailPixelBuffer);
  }
  inputLinearPixelBuffer = self->_inputLinearPixelBuffer;
  if (inputLinearPixelBuffer) {
    CFRelease(inputLinearPixelBuffer);
  }
  inputGainMapPixelBuffer = self->_inputGainMapPixelBuffer;
  if (inputGainMapPixelBuffer) {
    CFRelease(inputGainMapPixelBuffer);
  }
  inputPersonMaskPixelBuffer = self->_inputPersonMaskPixelBuffer;
  if (inputPersonMaskPixelBuffer) {
    CFRelease(inputPersonMaskPixelBuffer);
  }
  inputSkinMaskPixelBuffer = self->_inputSkinMaskPixelBuffer;
  if (inputSkinMaskPixelBuffer) {
    CFRelease(inputSkinMaskPixelBuffer);
  }
  inputSkyMaskPixelBuffer = self->_inputSkyMaskPixelBuffer;
  if (inputSkyMaskPixelBuffer) {
    CFRelease(inputSkyMaskPixelBuffer);
  }
  inputSRLPixelBuffer = self->_inputSRLPixelBuffer;
  if (inputSRLPixelBuffer) {
    CFRelease(inputSRLPixelBuffer);
  }
  inputStyleCoefficientsPixelBuffer = self->_inputStyleCoefficientsPixelBuffer;
  if (inputStyleCoefficientsPixelBuffer) {
    CFRelease(inputStyleCoefficientsPixelBuffer);
  }
  inputDeltaMapPixelBuffer = self->_inputDeltaMapPixelBuffer;
  if (inputDeltaMapPixelBuffer) {
    CFRelease(inputDeltaMapPixelBuffer);
  }
  inputReferenceForDeltaMapComputationPixelBuffer = self->_inputReferenceForDeltaMapComputationPixelBuffer;
  if (inputReferenceForDeltaMapComputationPixelBuffer) {
    CFRelease(inputReferenceForDeltaMapComputationPixelBuffer);
  }
  outputStyledPixelBuffer = self->_outputStyledPixelBuffer;
  if (outputStyledPixelBuffer) {
    CFRelease(outputStyledPixelBuffer);
  }
  outputGainMapPixelBuffer = self->_outputGainMapPixelBuffer;
  if (outputGainMapPixelBuffer) {
    CFRelease(outputGainMapPixelBuffer);
  }
  outputSmallLightMapPixelBuffer = self->_outputSmallLightMapPixelBuffer;
  if (outputSmallLightMapPixelBuffer) {
    CFRelease(outputSmallLightMapPixelBuffer);
  }
  outputSmallLinearLightMapPixelBuffer = self->_outputSmallLinearLightMapPixelBuffer;
  if (outputSmallLinearLightMapPixelBuffer) {
    CFRelease(outputSmallLinearLightMapPixelBuffer);
  }
  outputDeltaMapPixelBuffer = self->_outputDeltaMapPixelBuffer;
  if (outputDeltaMapPixelBuffer) {
    CFRelease(outputDeltaMapPixelBuffer);
  }
  outputLearnedStyleCoefficientsPixelBuffer = self->_outputLearnedStyleCoefficientsPixelBuffer;
  if (outputLearnedStyleCoefficientsPixelBuffer) {
    CFRelease(outputLearnedStyleCoefficientsPixelBuffer);
  }
  v22.receiver = self;
  v22.super_class = (Class)CMISmartStyleProcessorInputOutputV1;
  [(CMISmartStyleProcessorInputOutputV1 *)&v22 dealloc];
}

- (void)setInputSmartStyle:(id)a3
{
  id v5 = a3;
  if ([v5 smartStyleVersion] == 1) {
    objc_storeStrong((id *)&self->_inputSmartStyle, a3);
  }
}

- (void)setInputUnstyledPixelBuffer:(__CVBuffer *)a3
{
  inputUnstyledPixelBuffer = self->_inputUnstyledPixelBuffer;
  self->_inputUnstyledPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (inputUnstyledPixelBuffer)
  {
    CFRelease(inputUnstyledPixelBuffer);
  }
}

- (void)setInputUnstyledThumbnailPixelBuffer:(__CVBuffer *)a3
{
  inputUnstyledThumbnailPixelBuffer = self->_inputUnstyledThumbnailPixelBuffer;
  self->_inputUnstyledThumbnailPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (inputUnstyledThumbnailPixelBuffer)
  {
    CFRelease(inputUnstyledThumbnailPixelBuffer);
  }
}

- (void)setInputLearningTargetPixelBuffer:(__CVBuffer *)a3
{
  inputLearningTargetPixelBuffer = self->_inputLearningTargetPixelBuffer;
  self->_inputLearningTargetPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (inputLearningTargetPixelBuffer)
  {
    CFRelease(inputLearningTargetPixelBuffer);
  }
}

- (void)setInputLearningTargetThumbnailPixelBuffer:(__CVBuffer *)a3
{
  inputLearningTargetThumbnailPixelBuffer = self->_inputLearningTargetThumbnailPixelBuffer;
  self->_inputLearningTargetThumbnailPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (inputLearningTargetThumbnailPixelBuffer)
  {
    CFRelease(inputLearningTargetThumbnailPixelBuffer);
  }
}

- (void)setInputLinearPixelBuffer:(__CVBuffer *)a3
{
  inputLinearPixelBuffer = self->_inputLinearPixelBuffer;
  self->_inputLinearPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (inputLinearPixelBuffer)
  {
    CFRelease(inputLinearPixelBuffer);
  }
}

- (void)setInputGainMapPixelBuffer:(__CVBuffer *)a3
{
  inputGainMapPixelBuffer = self->_inputGainMapPixelBuffer;
  self->_inputGainMapPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (inputGainMapPixelBuffer)
  {
    CFRelease(inputGainMapPixelBuffer);
  }
}

- (void)setInputDeltaMapPixelBuffer:(__CVBuffer *)a3
{
  inputDeltaMapPixelBuffer = self->_inputDeltaMapPixelBuffer;
  self->_inputDeltaMapPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (inputDeltaMapPixelBuffer)
  {
    CFRelease(inputDeltaMapPixelBuffer);
  }
}

- (void)setInputReferenceForDeltaMapComputationPixelBuffer:(__CVBuffer *)a3
{
  inputReferenceForDeltaMapComputationPixelBuffer = self->_inputReferenceForDeltaMapComputationPixelBuffer;
  self->_inputReferenceForDeltaMapComputationPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (inputReferenceForDeltaMapComputationPixelBuffer)
  {
    CFRelease(inputReferenceForDeltaMapComputationPixelBuffer);
  }
}

- (void)setInputPersonMaskPixelBuffer:(__CVBuffer *)a3
{
  inputPersonMaskPixelBuffer = self->_inputPersonMaskPixelBuffer;
  self->_inputPersonMaskPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (inputPersonMaskPixelBuffer)
  {
    CFRelease(inputPersonMaskPixelBuffer);
  }
}

- (void)setInputSkinMaskPixelBuffer:(__CVBuffer *)a3
{
  inputSkinMaskPixelBuffer = self->_inputSkinMaskPixelBuffer;
  self->_inputSkinMaskPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (inputSkinMaskPixelBuffer)
  {
    CFRelease(inputSkinMaskPixelBuffer);
  }
}

- (void)setInputSkyMaskPixelBuffer:(__CVBuffer *)a3
{
  inputSkyMaskPixelBuffer = self->_inputSkyMaskPixelBuffer;
  self->_inputSkyMaskPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (inputSkyMaskPixelBuffer)
  {
    CFRelease(inputSkyMaskPixelBuffer);
  }
}

- (void)setInputSRLPixelBuffer:(__CVBuffer *)a3
{
  inputSRLPixelBuffer = self->_inputSRLPixelBuffer;
  self->_inputSRLPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (inputSRLPixelBuffer)
  {
    CFRelease(inputSRLPixelBuffer);
  }
}

- (void)setInputStyleCoefficientsPixelBuffer:(__CVBuffer *)a3
{
  inputStyleCoefficientsPixelBuffer = self->_inputStyleCoefficientsPixelBuffer;
  self->_inputStyleCoefficientsPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (inputStyleCoefficientsPixelBuffer)
  {
    CFRelease(inputStyleCoefficientsPixelBuffer);
  }
}

- (void)setOutputStyledPixelBuffer:(__CVBuffer *)a3
{
  outputStyledPixelBuffer = self->_outputStyledPixelBuffer;
  self->_outputStyledPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (outputStyledPixelBuffer)
  {
    CFRelease(outputStyledPixelBuffer);
  }
}

- (void)setOutputGainMapPixelBuffer:(__CVBuffer *)a3
{
  outputGainMapPixelBuffer = self->_outputGainMapPixelBuffer;
  self->_outputGainMapPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (outputGainMapPixelBuffer)
  {
    CFRelease(outputGainMapPixelBuffer);
  }
}

- (void)setOutputSmallLightMapPixelBuffer:(__CVBuffer *)a3
{
  outputSmallLightMapPixelBuffer = self->_outputSmallLightMapPixelBuffer;
  self->_outputSmallLightMapPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (outputSmallLightMapPixelBuffer)
  {
    CFRelease(outputSmallLightMapPixelBuffer);
  }
}

- (void)setOutputSmallLinearLightMapPixelBuffer:(__CVBuffer *)a3
{
  outputSmallLinearLightMapPixelBuffer = self->_outputSmallLinearLightMapPixelBuffer;
  self->_outputSmallLinearLightMapPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (outputSmallLinearLightMapPixelBuffer)
  {
    CFRelease(outputSmallLinearLightMapPixelBuffer);
  }
}

- (void)setOutputLearnedStyleCoefficientsPixelBuffer:(__CVBuffer *)a3
{
  outputLearnedStyleCoefficientsPixelBuffer = self->_outputLearnedStyleCoefficientsPixelBuffer;
  self->_outputLearnedStyleCoefficientsPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (outputLearnedStyleCoefficientsPixelBuffer)
  {
    CFRelease(outputLearnedStyleCoefficientsPixelBuffer);
  }
}

- (void)setOutputDeltaMapPixelBuffer:(__CVBuffer *)a3
{
  outputDeltaMapPixelBuffer = self->_outputDeltaMapPixelBuffer;
  self->_outputDeltaMapPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (outputDeltaMapPixelBuffer)
  {
    CFRelease(outputDeltaMapPixelBuffer);
  }
}

- (CMISmartStyle)inputSmartStyle
{
  return self->_inputSmartStyle;
}

- (MTLSharedEvent)metalSharedEvent
{
  return self->_metalSharedEvent;
}

- (void)setMetalSharedEvent:(id)a3
{
}

- (__CVBuffer)inputUnstyledPixelBuffer
{
  return self->_inputUnstyledPixelBuffer;
}

- (CGRect)inputUnstyledCropRect
{
  double x = self->_inputUnstyledCropRect.origin.x;
  double y = self->_inputUnstyledCropRect.origin.y;
  double width = self->_inputUnstyledCropRect.size.width;
  double height = self->_inputUnstyledCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInputUnstyledCropRect:(CGRect)a3
{
  self->_inputUnstyledCropRect = a3;
}

- (__CVBuffer)inputUnstyledThumbnailPixelBuffer
{
  return self->_inputUnstyledThumbnailPixelBuffer;
}

- (CGRect)inputUnstyledThumbnailCropRect
{
  double x = self->_inputUnstyledThumbnailCropRect.origin.x;
  double y = self->_inputUnstyledThumbnailCropRect.origin.y;
  double width = self->_inputUnstyledThumbnailCropRect.size.width;
  double height = self->_inputUnstyledThumbnailCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInputUnstyledThumbnailCropRect:(CGRect)a3
{
  self->_inputUnstyledThumbnailCropRect = a3;
}

- (__CVBuffer)inputLearningTargetPixelBuffer
{
  return self->_inputLearningTargetPixelBuffer;
}

- (__CVBuffer)inputLearningTargetThumbnailPixelBuffer
{
  return self->_inputLearningTargetThumbnailPixelBuffer;
}

- (NSDictionary)inputMetadataDict
{
  return self->_inputMetadataDict;
}

- (void)setInputMetadataDict:(id)a3
{
}

- (NSDictionary)inputLinearMetadataDict
{
  return self->_inputLinearMetadataDict;
}

- (void)setInputLinearMetadataDict:(id)a3
{
}

- (__CVBuffer)inputLinearPixelBuffer
{
  return self->_inputLinearPixelBuffer;
}

- (CGRect)inputLinearCropRect
{
  double x = self->_inputLinearCropRect.origin.x;
  double y = self->_inputLinearCropRect.origin.y;
  double width = self->_inputLinearCropRect.size.width;
  double height = self->_inputLinearCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInputLinearCropRect:(CGRect)a3
{
  self->_inputLinearCropRect = a3;
}

- (__CVBuffer)inputGainMapPixelBuffer
{
  return self->_inputGainMapPixelBuffer;
}

- (__CVBuffer)inputDeltaMapPixelBuffer
{
  return self->_inputDeltaMapPixelBuffer;
}

- (__CVBuffer)inputReferenceForDeltaMapComputationPixelBuffer
{
  return self->_inputReferenceForDeltaMapComputationPixelBuffer;
}

- (__CVBuffer)inputPersonMaskPixelBuffer
{
  return self->_inputPersonMaskPixelBuffer;
}

- (CGRect)inputPersonMaskCropRect
{
  double x = self->_inputPersonMaskCropRect.origin.x;
  double y = self->_inputPersonMaskCropRect.origin.y;
  double width = self->_inputPersonMaskCropRect.size.width;
  double height = self->_inputPersonMaskCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInputPersonMaskCropRect:(CGRect)a3
{
  self->_inputPersonMaskCropRect = a3;
}

- (__CVBuffer)inputSkinMaskPixelBuffer
{
  return self->_inputSkinMaskPixelBuffer;
}

- (CGRect)inputSkinMaskCropRect
{
  double x = self->_inputSkinMaskCropRect.origin.x;
  double y = self->_inputSkinMaskCropRect.origin.y;
  double width = self->_inputSkinMaskCropRect.size.width;
  double height = self->_inputSkinMaskCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInputSkinMaskCropRect:(CGRect)a3
{
  self->_inputSkinMaskCropRect = a3;
}

- (__CVBuffer)inputSkyMaskPixelBuffer
{
  return self->_inputSkyMaskPixelBuffer;
}

- (CGRect)inputSkyMaskCropRect
{
  double x = self->_inputSkyMaskCropRect.origin.x;
  double y = self->_inputSkyMaskCropRect.origin.y;
  double width = self->_inputSkyMaskCropRect.size.width;
  double height = self->_inputSkyMaskCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInputSkyMaskCropRect:(CGRect)a3
{
  self->_inputSkyMaskCropRect = a3;
}

- (__CVBuffer)inputSRLPixelBuffer
{
  return self->_inputSRLPixelBuffer;
}

- (__CVBuffer)inputStyleCoefficientsPixelBuffer
{
  return self->_inputStyleCoefficientsPixelBuffer;
}

- (int)semanticStyleSceneType
{
  return self->_semanticStyleSceneType;
}

- (void)setSemanticStyleSceneType:(int)a3
{
  self->_semanticStyleSceneType = a3;
}

- (NSString)inputTuningType
{
  return self->_inputTuningType;
}

- (void)setInputTuningType:(id)a3
{
}

- (__CVBuffer)outputStyledPixelBuffer
{
  return self->_outputStyledPixelBuffer;
}

- (CGRect)outputStyledCropRect
{
  double x = self->_outputStyledCropRect.origin.x;
  double y = self->_outputStyledCropRect.origin.y;
  double width = self->_outputStyledCropRect.size.width;
  double height = self->_outputStyledCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOutputStyledCropRect:(CGRect)a3
{
  self->_outputStyledCropRect = a3;
}

- (__CVBuffer)outputGainMapPixelBuffer
{
  return self->_outputGainMapPixelBuffer;
}

- (__CVBuffer)outputSmallLightMapPixelBuffer
{
  return self->_outputSmallLightMapPixelBuffer;
}

- (__CVBuffer)outputSmallLinearLightMapPixelBuffer
{
  return self->_outputSmallLinearLightMapPixelBuffer;
}

- (__CVBuffer)outputDeltaMapPixelBuffer
{
  return self->_outputDeltaMapPixelBuffer;
}

- (CGRect)deltaMapRegionToRenderRect
{
  double x = self->_deltaMapRegionToRenderRect.origin.x;
  double y = self->_deltaMapRegionToRenderRect.origin.y;
  double width = self->_deltaMapRegionToRenderRect.size.width;
  double height = self->_deltaMapRegionToRenderRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDeltaMapRegionToRenderRect:(CGRect)a3
{
  self->_deltaMapRegionToRenderRect = a3;
}

- (__CVBuffer)outputLearnedStyleCoefficientsPixelBuffer
{
  return self->_outputLearnedStyleCoefficientsPixelBuffer;
}

- (CGRect)outputDeltaMapCropRect
{
  double x = self->_outputDeltaMapCropRect.origin.x;
  double y = self->_outputDeltaMapCropRect.origin.y;
  double width = self->_outputDeltaMapCropRect.size.width;
  double height = self->_outputDeltaMapCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOutputDeltaMapCropRect:(CGRect)a3
{
  self->_outputDeltaMapCropRect = a3;
}

- (CGRect)inputReferenceForDeltaMapComputationCropRect
{
  double x = self->_inputReferenceForDeltaMapComputationCropRect.origin.x;
  double y = self->_inputReferenceForDeltaMapComputationCropRect.origin.y;
  double width = self->_inputReferenceForDeltaMapComputationCropRect.size.width;
  double height = self->_inputReferenceForDeltaMapComputationCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInputReferenceForDeltaMapComputationCropRect:(CGRect)a3
{
  self->_inputReferenceForDeltaMapComputationCropRect = a3;
}

- (NSMutableDictionary)outputImageStatistics
{
  return self->_outputImageStatistics;
}

- (void)setOutputImageStatistics:(id)a3
{
}

- (NSMutableDictionary)outputImageStatisticsExtended
{
  return self->_outputImageStatisticsExtended;
}

- (void)setOutputImageStatisticsExtended:(id)a3
{
}

- (__CVBuffer)outputCodedLinearThumbnailPixelBuffer
{
  return self->_outputCodedLinearThumbnailPixelBuffer;
}

- (void)setOutputCodedLinearThumbnailPixelBuffer:(__CVBuffer *)a3
{
  self->_outputCodedLinearThumbnailPixelBuffer = a3;
}

- (NSMutableDictionary)outputCodedLinearThumbnailMetadata
{
  return self->_outputCodedLinearThumbnailMetadata;
}

- (void)setOutputCodedLinearThumbnailMetadata:(id)a3
{
}

- (float)outputSRLCurveParameter
{
  return self->_outputSRLCurveParameter;
}

- (void)setOutputSRLCurveParameter:(float)a3
{
  self->_outputSRLCurveParameter = a3;
}

- (NSData)outputSRLStats
{
  return self->_outputSRLStats;
}

- (void)setOutputSRLStats:(id)a3
{
}

- (CGRect)primaryCaptureRect
{
  double x = self->_primaryCaptureRect.origin.x;
  double y = self->_primaryCaptureRect.origin.y;
  double width = self->_primaryCaptureRect.size.width;
  double height = self->_primaryCaptureRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPrimaryCaptureRect:(CGRect)a3
{
  self->_primaryCaptureRect = a3;
}

- (CGRect)inputCropRectWithinPrimaryCaptureRect
{
  double x = self->_inputCropRectWithinPrimaryCaptureRect.origin.x;
  double y = self->_inputCropRectWithinPrimaryCaptureRect.origin.y;
  double width = self->_inputCropRectWithinPrimaryCaptureRect.size.width;
  double height = self->_inputCropRectWithinPrimaryCaptureRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInputCropRectWithinPrimaryCaptureRect:(CGRect)a3
{
  self->_inputCropRectWithinPrimaryCaptureRect = a3;
}

- (CGRect)outputRenderRect
{
  double x = self->_outputRenderRect.origin.x;
  double y = self->_outputRenderRect.origin.y;
  double width = self->_outputRenderRect.size.width;
  double height = self->_outputRenderRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOutputRenderRect:(CGRect)a3
{
  self->_outputRenderRect = a3;
}

- (__n128)spotlightAffineTransform
{
  return a1[43];
}

- (__n128)setSpotlightAffineTransform:(__n128)a3
{
  result[43] = a2;
  result[44] = a3;
  result[45] = a4;
  return result;
}

- (float)globalLinearSystemMixFactor
{
  return self->_globalLinearSystemMixFactor;
}

- (void)setGlobalLinearSystemMixFactor:(float)a3
{
  self->_globalLinearSystemMixFactor = a3;
}

- (BOOL)subjectRelightingEnabled
{
  return self->_subjectRelightingEnabled;
}

- (void)setSubjectRelightingEnabled:(BOOL)a3
{
  self->_subjectRelightingEnabled = a3;
}

- (BOOL)residualsCalculationDisabled
{
  return self->_residualsCalculationDisabled;
}

- (void)setResidualsCalculationDisabled:(BOOL)a3
{
  self->_residualsCalculationDisabled = a3;
}

- (BOOL)applyDither
{
  return self->_applyDither;
}

- (void)setApplyDither:(BOOL)a3
{
  self->_applyDither = a3;
}

- (float)personMasksValidHint
{
  return self->_personMasksValidHint;
}

- (void)setPersonMasksValidHint:(float)a3
{
  self->_personMasksValidHint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputSRLStats, 0);
  objc_storeStrong((id *)&self->_outputCodedLinearThumbnailMetadata, 0);
  objc_storeStrong((id *)&self->_outputImageStatisticsExtended, 0);
  objc_storeStrong((id *)&self->_outputImageStatistics, 0);
  objc_storeStrong((id *)&self->_inputTuningType, 0);
  objc_storeStrong((id *)&self->_inputLinearMetadataDict, 0);
  objc_storeStrong((id *)&self->_inputMetadataDict, 0);
  objc_storeStrong((id *)&self->_metalSharedEvent, 0);

  objc_storeStrong((id *)&self->_inputSmartStyle, 0);
}

@end