@interface VISConfigurationV2
- (BOOL)applyFrameCropOffset;
- (BOOL)attachEstimatedMotionVector;
- (BOOL)attachStabilizedOutputCameraTrajectory;
- (BOOL)attachStabilizedTrajectoryHomography;
- (BOOL)blurBorderPixels;
- (BOOL)disableTransformLimitsForPredeterminedTrajectory;
- (BOOL)enableRollingShutterCorrectionOnly;
- (BOOL)frameRateConversionEnabled;
- (BOOL)onlyGenerateTransformsParameters;
- (BOOL)p3ToBT2020ConversionEnabled;
- (BOOL)smartStyleRenderingEnabled;
- (BOOL)smartStyleReversibilityEnabled;
- (BOOL)sphereCorrectionEnabled;
- (BOOL)sphereVideoEnabled;
- (BOOL)useCameraGeometry;
- (BOOL)useISPMotionData;
- (BOOL)videoStabilizationDisabled;
- (BOOL)zoomSmoothingEnabled;
- (CGRect)livePhotoCleanOutputRect;
- (MTLCommandQueue)metalCommandQueue;
- (NSArray)distortionCompensationEnabledPortTypes;
- (NSArray)distortionCorrectionEnabledPortTypes;
- (NSData)cameraExtrinsicMatrix;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)inputPixelBufferAttributes;
- (NSDictionary)outputAttachmentsAuxAttributes;
- (NSDictionary)outputAttachmentsPixelBufferPools;
- (NSDictionary)outputAuxAttributes;
- (NSDictionary)outputDepthAuxAttributes;
- (NSDictionary)outputPixelBufferAttributes;
- (NSDictionary)sensorIDDict;
- (NSDictionary)videoGreenGhostMitigationParameters;
- (NSDictionary)videoSTFParameters;
- (OS_dispatch_semaphore)emitSampleBufferSemaphore;
- (__CVPixelBufferPool)outputDepthPixelBufferPool;
- (__CVPixelBufferPool)outputPixelBufferPool;
- (float)cinematicLookAheadTime;
- (float)horizonCorrectionThreshold;
- (float)minDistanceForBravoParallaxShift;
- (int)gpuPriority;
- (int)horizonCorrectionMode;
- (int)motionBlurShimmerMitigationMethod;
- (int)smoothingMethod;
- (int)transformPlatform;
- (unint64_t)smartStyleMemoryPoolId;
- (unsigned)cinematicLookAheadFrameCount;
- (unsigned)extendedOutputRowsToFill;
- (unsigned)metalSubmissionAndCompletionQueuePriority;
- (void)ispProcessingSession;
- (void)setApplyFrameCropOffset:(BOOL)a3;
- (void)setAttachEstimatedMotionVector:(BOOL)a3;
- (void)setAttachStabilizedOutputCameraTrajectory:(BOOL)a3;
- (void)setAttachStabilizedTrajectoryHomography:(BOOL)a3;
- (void)setBlurBorderPixels:(BOOL)a3;
- (void)setCameraExtrinsicMatrix:(id)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setCinematicLookAheadFrameCount:(unsigned int)a3;
- (void)setCinematicLookAheadTime:(float)a3;
- (void)setDisableTransformLimitsForPredeterminedTrajectory:(BOOL)a3;
- (void)setDistortionCompensationEnabledPortTypes:(id)a3;
- (void)setDistortionCorrectionEnabledPortTypes:(id)a3;
- (void)setEmitSampleBufferSemaphore:(id)a3;
- (void)setEnableRollingShutterCorrectionOnly:(BOOL)a3;
- (void)setExtendedOutputRowsToFill:(unsigned int)a3;
- (void)setFrameRateConversionEnabled:(BOOL)a3;
- (void)setGpuPriority:(int)a3;
- (void)setHorizonCorrectionMode:(int)a3;
- (void)setHorizonCorrectionThreshold:(float)a3;
- (void)setInputPixelBufferAttributes:(id)a3;
- (void)setIspProcessingSession:(void *)a3;
- (void)setLivePhotoCleanOutputRect:(CGRect)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setMetalSubmissionAndCompletionQueuePriority:(unsigned int)a3;
- (void)setMinDistanceForBravoParallaxShift:(float)a3;
- (void)setMotionBlurShimmerMitigationMethod:(int)a3;
- (void)setOnlyGenerateTransformsParameters:(BOOL)a3;
- (void)setOutputAttachmentsAuxAttributes:(id)a3;
- (void)setOutputAttachmentsPixelBufferPools:(id)a3;
- (void)setOutputAuxAttributes:(id)a3;
- (void)setOutputDepthAuxAttributes:(id)a3;
- (void)setOutputDepthPixelBufferPool:(__CVPixelBufferPool *)a3;
- (void)setOutputPixelBufferAttributes:(id)a3;
- (void)setOutputPixelBufferPool:(__CVPixelBufferPool *)a3;
- (void)setP3ToBT2020ConversionEnabled:(BOOL)a3;
- (void)setSensorIDDict:(id)a3;
- (void)setSmartStyleMemoryPoolId:(unint64_t)a3;
- (void)setSmartStyleRenderingEnabled:(BOOL)a3;
- (void)setSmartStyleReversibilityEnabled:(BOOL)a3;
- (void)setSmoothingMethod:(int)a3;
- (void)setSphereCorrectionEnabled:(BOOL)a3;
- (void)setSphereVideoEnabled:(BOOL)a3;
- (void)setTransformPlatform:(int)a3;
- (void)setUseCameraGeometry:(BOOL)a3;
- (void)setUseISPMotionData:(BOOL)a3;
- (void)setVideoGreenGhostMitigationParameters:(id)a3;
- (void)setVideoSTFParameters:(id)a3;
- (void)setVideoStabilizationDisabled:(BOOL)a3;
- (void)setZoomSmoothingEnabled:(BOOL)a3;
@end

@implementation VISConfigurationV2

- (int)transformPlatform
{
  return self->_transformPlatform;
}

- (void)setTransformPlatform:(int)a3
{
  self->_transformPlatform = a3;
}

- (int)smoothingMethod
{
  return self->_smoothingMethod;
}

- (void)setSmoothingMethod:(int)a3
{
  self->_smoothingMethod = a3;
}

- (int)motionBlurShimmerMitigationMethod
{
  return self->_motionBlurShimmerMitigationMethod;
}

- (void)setMotionBlurShimmerMitigationMethod:(int)a3
{
  self->_motionBlurShimmerMitigationMethod = a3;
}

- (void)ispProcessingSession
{
  return self->_ispProcessingSession;
}

- (void)setIspProcessingSession:(void *)a3
{
  self->_ispProcessingSession = a3;
}

- (NSDictionary)inputPixelBufferAttributes
{
  return self->_inputPixelBufferAttributes;
}

- (void)setInputPixelBufferAttributes:(id)a3
{
}

- (NSDictionary)outputPixelBufferAttributes
{
  return self->_outputPixelBufferAttributes;
}

- (void)setOutputPixelBufferAttributes:(id)a3
{
}

- (__CVPixelBufferPool)outputPixelBufferPool
{
  return self->_outputPixelBufferPool;
}

- (void)setOutputPixelBufferPool:(__CVPixelBufferPool *)a3
{
  self->_outputPixelBufferPool = a3;
}

- (NSDictionary)outputAuxAttributes
{
  return self->_outputAuxAttributes;
}

- (void)setOutputAuxAttributes:(id)a3
{
}

- (__CVPixelBufferPool)outputDepthPixelBufferPool
{
  return self->_outputDepthPixelBufferPool;
}

- (void)setOutputDepthPixelBufferPool:(__CVPixelBufferPool *)a3
{
  self->_outputDepthPixelBufferPool = a3;
}

- (NSDictionary)outputDepthAuxAttributes
{
  return self->_outputDepthAuxAttributes;
}

- (void)setOutputDepthAuxAttributes:(id)a3
{
}

- (NSDictionary)outputAttachmentsPixelBufferPools
{
  return self->_outputAttachmentsPixelBufferPools;
}

- (void)setOutputAttachmentsPixelBufferPools:(id)a3
{
}

- (NSDictionary)outputAttachmentsAuxAttributes
{
  return self->_outputAttachmentsAuxAttributes;
}

- (void)setOutputAttachmentsAuxAttributes:(id)a3
{
}

- (NSDictionary)sensorIDDict
{
  return self->_sensorIDDict;
}

- (void)setSensorIDDict:(id)a3
{
}

- (float)cinematicLookAheadTime
{
  return self->_cinematicLookAheadTime;
}

- (void)setCinematicLookAheadTime:(float)a3
{
  self->_cinematicLookAheadTime = a3;
}

- (unsigned)cinematicLookAheadFrameCount
{
  return self->_cinematicLookAheadFrameCount;
}

- (void)setCinematicLookAheadFrameCount:(unsigned int)a3
{
  self->_cinematicLookAheadFrameCount = a3;
}

- (BOOL)useISPMotionData
{
  return self->_useISPMotionData;
}

- (void)setUseISPMotionData:(BOOL)a3
{
  self->_useISPMotionData = a3;
}

- (BOOL)sphereCorrectionEnabled
{
  return self->_sphereCorrectionEnabled;
}

- (void)setSphereCorrectionEnabled:(BOOL)a3
{
  self->_sphereCorrectionEnabled = a3;
}

- (BOOL)sphereVideoEnabled
{
  return self->_sphereVideoEnabled;
}

- (void)setSphereVideoEnabled:(BOOL)a3
{
  self->_sphereVideoEnabled = a3;
}

- (int)gpuPriority
{
  return self->_gpuPriority;
}

- (void)setGpuPriority:(int)a3
{
  self->_gpuPriority = a3;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (unsigned)metalSubmissionAndCompletionQueuePriority
{
  return self->_metalSubmissionAndCompletionQueuePriority;
}

- (void)setMetalSubmissionAndCompletionQueuePriority:(unsigned int)a3
{
  self->_metalSubmissionAndCompletionQueuePriority = a3;
}

- (BOOL)frameRateConversionEnabled
{
  return self->_frameRateConversionEnabled;
}

- (void)setFrameRateConversionEnabled:(BOOL)a3
{
  self->_frameRateConversionEnabled = a3;
}

- (BOOL)smartStyleRenderingEnabled
{
  return self->_smartStyleRenderingEnabled;
}

- (void)setSmartStyleRenderingEnabled:(BOOL)a3
{
  self->_smartStyleRenderingEnabled = a3;
}

- (BOOL)smartStyleReversibilityEnabled
{
  return self->_smartStyleReversibilityEnabled;
}

- (void)setSmartStyleReversibilityEnabled:(BOOL)a3
{
  self->_smartStyleReversibilityEnabled = a3;
}

- (unint64_t)smartStyleMemoryPoolId
{
  return self->_smartStyleMemoryPoolId;
}

- (void)setSmartStyleMemoryPoolId:(unint64_t)a3
{
  self->_smartStyleMemoryPoolId = a3;
}

- (BOOL)videoStabilizationDisabled
{
  return self->_videoStabilizationDisabled;
}

- (void)setVideoStabilizationDisabled:(BOOL)a3
{
  self->_videoStabilizationDisabled = a3;
}

- (BOOL)blurBorderPixels
{
  return self->_blurBorderPixels;
}

- (void)setBlurBorderPixels:(BOOL)a3
{
  self->_blurBorderPixels = a3;
}

- (CGRect)livePhotoCleanOutputRect
{
  double x = self->_livePhotoCleanOutputRect.origin.x;
  double y = self->_livePhotoCleanOutputRect.origin.y;
  double width = self->_livePhotoCleanOutputRect.size.width;
  double height = self->_livePhotoCleanOutputRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLivePhotoCleanOutputRect:(CGRect)a3
{
  self->_livePhotoCleanOutputRect = a3;
}

- (BOOL)onlyGenerateTransformsParameters
{
  return self->_onlyGenerateTransformsParameters;
}

- (void)setOnlyGenerateTransformsParameters:(BOOL)a3
{
  self->_onlyGenerateTransformsParameters = a3;
}

- (BOOL)attachStabilizedOutputCameraTrajectory
{
  return self->_attachStabilizedOutputCameraTrajectory;
}

- (void)setAttachStabilizedOutputCameraTrajectory:(BOOL)a3
{
  self->_attachStabilizedOutputCameraTrajectordouble y = a3;
}

- (BOOL)attachStabilizedTrajectoryHomography
{
  return self->_attachStabilizedTrajectoryHomography;
}

- (void)setAttachStabilizedTrajectoryHomography:(BOOL)a3
{
  self->_attachStabilizedTrajectoryHomographdouble y = a3;
}

- (BOOL)attachEstimatedMotionVector
{
  return self->_attachEstimatedMotionVector;
}

- (void)setAttachEstimatedMotionVector:(BOOL)a3
{
  self->_attachEstimatedMotionVector = a3;
}

- (BOOL)p3ToBT2020ConversionEnabled
{
  return self->_p3ToBT2020ConversionEnabled;
}

- (void)setP3ToBT2020ConversionEnabled:(BOOL)a3
{
  self->_p3ToBT2020ConversionEnabled = a3;
}

- (unsigned)extendedOutputRowsToFill
{
  return self->_extendedOutputRowsToFill;
}

- (void)setExtendedOutputRowsToFill:(unsigned int)a3
{
  self->_extendedOutputRowsToFill = a3;
}

- (OS_dispatch_semaphore)emitSampleBufferSemaphore
{
  return self->_emitSampleBufferSemaphore;
}

- (void)setEmitSampleBufferSemaphore:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (NSArray)distortionCorrectionEnabledPortTypes
{
  return self->_distortionCorrectionEnabledPortTypes;
}

- (void)setDistortionCorrectionEnabledPortTypes:(id)a3
{
}

- (NSArray)distortionCompensationEnabledPortTypes
{
  return self->_distortionCompensationEnabledPortTypes;
}

- (void)setDistortionCompensationEnabledPortTypes:(id)a3
{
}

- (float)minDistanceForBravoParallaxShift
{
  return self->_minDistanceForBravoParallaxShift;
}

- (void)setMinDistanceForBravoParallaxShift:(float)a3
{
  self->_minDistanceForBravoParallaxShift = a3;
}

- (NSDictionary)videoSTFParameters
{
  return self->_videoSTFParameters;
}

- (void)setVideoSTFParameters:(id)a3
{
}

- (NSDictionary)videoGreenGhostMitigationParameters
{
  return self->_videoGreenGhostMitigationParameters;
}

- (void)setVideoGreenGhostMitigationParameters:(id)a3
{
}

- (float)horizonCorrectionThreshold
{
  return self->_horizonCorrectionThreshold;
}

- (void)setHorizonCorrectionThreshold:(float)a3
{
  self->_horizonCorrectionThreshold = a3;
}

- (int)horizonCorrectionMode
{
  return self->_horizonCorrectionMode;
}

- (void)setHorizonCorrectionMode:(int)a3
{
  self->_horizonCorrectionMode = a3;
}

- (BOOL)zoomSmoothingEnabled
{
  return self->_zoomSmoothingEnabled;
}

- (void)setZoomSmoothingEnabled:(BOOL)a3
{
  self->_zoomSmoothingEnabled = a3;
}

- (BOOL)applyFrameCropOffset
{
  return self->_applyFrameCropOffset;
}

- (void)setApplyFrameCropOffset:(BOOL)a3
{
  self->_applyFrameCropOffset = a3;
}

- (NSData)cameraExtrinsicMatrix
{
  return self->_cameraExtrinsicMatrix;
}

- (void)setCameraExtrinsicMatrix:(id)a3
{
}

- (BOOL)enableRollingShutterCorrectionOnly
{
  return self->_enableRollingShutterCorrectionOnly;
}

- (void)setEnableRollingShutterCorrectionOnly:(BOOL)a3
{
  self->_enableRollingShutterCorrectionOnldouble y = a3;
}

- (BOOL)disableTransformLimitsForPredeterminedTrajectory
{
  return self->_disableTransformLimitsForPredeterminedTrajectory;
}

- (void)setDisableTransformLimitsForPredeterminedTrajectory:(BOOL)a3
{
  self->_disableTransformLimitsForPredeterminedTrajectordouble y = a3;
}

- (BOOL)useCameraGeometry
{
  return self->_useCameraGeometry;
}

- (void)setUseCameraGeometry:(BOOL)a3
{
  self->_useCameraGeometrdouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraExtrinsicMatrix, 0);
  objc_storeStrong((id *)&self->_videoGreenGhostMitigationParameters, 0);
  objc_storeStrong((id *)&self->_videoSTFParameters, 0);
  objc_storeStrong((id *)&self->_distortionCompensationEnabledPortTypes, 0);
  objc_storeStrong((id *)&self->_distortionCorrectionEnabledPortTypes, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_emitSampleBufferSemaphore, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_sensorIDDict, 0);
  objc_storeStrong((id *)&self->_outputAttachmentsAuxAttributes, 0);
  objc_storeStrong((id *)&self->_outputAttachmentsPixelBufferPools, 0);
  objc_storeStrong((id *)&self->_outputDepthAuxAttributes, 0);
  objc_storeStrong((id *)&self->_outputAuxAttributes, 0);
  objc_storeStrong((id *)&self->_outputPixelBufferAttributes, 0);

  objc_storeStrong((id *)&self->_inputPixelBufferAttributes, 0);
}

@end