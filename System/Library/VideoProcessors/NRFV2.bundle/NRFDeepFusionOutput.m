@interface NRFDeepFusionOutput
- (BOOL)providesInferencesWithoutInferenceInputPixelBuffer;
- (BOOL)refFrameTransformIsValid;
- (NSMutableDictionary)gainMapOutputMetadata;
- (NSMutableDictionary)linearOutputMIWBAppliedMetadata;
- (NSMutableDictionary)linearOutputMetadata;
- (NSMutableDictionary)proxyMetadata;
- (NSMutableDictionary)referenceEVZeroMetadata;
- (NSMutableDictionary)syntheticLongMetadata;
- (NSMutableDictionary)syntheticReferenceMetadata;
- (__CVBuffer)gainMapOutputPixelBuffer;
- (__CVBuffer)inferenceInputPixelBuffer;
- (__CVBuffer)linearOutputMIWBAppliedPixelBuffer;
- (__CVBuffer)linearOutputPixelBuffer;
- (__CVBuffer)longFusionMapPixelBuffer;
- (__CVBuffer)proxyPixelBuffer;
- (__CVBuffer)referenceEVZeroPixelBuffer;
- (__CVBuffer)syntheticLongFusionMapPixelBuffer;
- (__CVBuffer)syntheticLongPixelBuffer;
- (__CVBuffer)syntheticReferenceFusionMapPixelBuffer;
- (__CVBuffer)syntheticReferencePixelBuffer;
- (__n128)refFrameTransform;
- (__n128)setRefFrameTransform:(__n128)a3;
- (int)fusionMode;
- (void)dealloc;
- (void)setFusionMode:(int)a3;
- (void)setGainMapOutputMetadata:(id)a3;
- (void)setGainMapOutputPixelBuffer:(__CVBuffer *)a3;
- (void)setInferenceInputPixelBuffer:(__CVBuffer *)a3;
- (void)setLinearOutputMIWBAppliedMetadata:(id)a3;
- (void)setLinearOutputMIWBAppliedPixelBuffer:(__CVBuffer *)a3;
- (void)setLinearOutputMetadata:(id)a3;
- (void)setLinearOutputPixelBuffer:(__CVBuffer *)a3;
- (void)setLongFusionMapPixelBuffer:(__CVBuffer *)a3;
- (void)setProvidesInferencesWithoutInferenceInputPixelBuffer:(BOOL)a3;
- (void)setProxyMetadata:(id)a3;
- (void)setProxyPixelBuffer:(__CVBuffer *)a3;
- (void)setRefFrameTransformIsValid:(BOOL)a3;
- (void)setReferenceEVZeroMetadata:(id)a3;
- (void)setReferenceEVZeroPixelBuffer:(__CVBuffer *)a3;
- (void)setSyntheticLongFusionMapPixelBuffer:(__CVBuffer *)a3;
- (void)setSyntheticLongMetadata:(id)a3;
- (void)setSyntheticLongPixelBuffer:(__CVBuffer *)a3;
- (void)setSyntheticReferenceFusionMapPixelBuffer:(__CVBuffer *)a3;
- (void)setSyntheticReferenceMetadata:(id)a3;
- (void)setSyntheticReferencePixelBuffer:(__CVBuffer *)a3;
@end

@implementation NRFDeepFusionOutput

- (void)dealloc
{
  CVPixelBufferRelease(self->_proxyPixelBuffer);
  CVPixelBufferRelease(self->_syntheticReferencePixelBuffer);
  CVPixelBufferRelease(self->_syntheticReferenceFusionMapPixelBuffer);
  CVPixelBufferRelease(self->_syntheticLongPixelBuffer);
  CVPixelBufferRelease(self->_syntheticLongFusionMapPixelBuffer);
  CVPixelBufferRelease(self->_longFusionMapPixelBuffer);
  CVPixelBufferRelease(self->_inferenceInputPixelBuffer);
  CVPixelBufferRelease(self->_gainMapOutputPixelBuffer);
  CVPixelBufferRelease(self->_linearOutputPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)NRFDeepFusionOutput;
  [(NRFDeepFusionOutput *)&v3 dealloc];
}

- (__CVBuffer)proxyPixelBuffer
{
  return self->_proxyPixelBuffer;
}

- (void)setProxyPixelBuffer:(__CVBuffer *)a3
{
}

- (NSMutableDictionary)proxyMetadata
{
  return self->_proxyMetadata;
}

- (void)setProxyMetadata:(id)a3
{
}

- (__CVBuffer)syntheticReferencePixelBuffer
{
  return self->_syntheticReferencePixelBuffer;
}

- (void)setSyntheticReferencePixelBuffer:(__CVBuffer *)a3
{
}

- (NSMutableDictionary)syntheticReferenceMetadata
{
  return self->_syntheticReferenceMetadata;
}

- (void)setSyntheticReferenceMetadata:(id)a3
{
}

- (__CVBuffer)syntheticReferenceFusionMapPixelBuffer
{
  return self->_syntheticReferenceFusionMapPixelBuffer;
}

- (void)setSyntheticReferenceFusionMapPixelBuffer:(__CVBuffer *)a3
{
}

- (__CVBuffer)syntheticLongPixelBuffer
{
  return self->_syntheticLongPixelBuffer;
}

- (void)setSyntheticLongPixelBuffer:(__CVBuffer *)a3
{
}

- (NSMutableDictionary)syntheticLongMetadata
{
  return self->_syntheticLongMetadata;
}

- (void)setSyntheticLongMetadata:(id)a3
{
}

- (__CVBuffer)syntheticLongFusionMapPixelBuffer
{
  return self->_syntheticLongFusionMapPixelBuffer;
}

- (void)setSyntheticLongFusionMapPixelBuffer:(__CVBuffer *)a3
{
}

- (__CVBuffer)longFusionMapPixelBuffer
{
  return self->_longFusionMapPixelBuffer;
}

- (void)setLongFusionMapPixelBuffer:(__CVBuffer *)a3
{
}

- (__CVBuffer)referenceEVZeroPixelBuffer
{
  return self->_referenceEVZeroPixelBuffer;
}

- (void)setReferenceEVZeroPixelBuffer:(__CVBuffer *)a3
{
}

- (NSMutableDictionary)referenceEVZeroMetadata
{
  return self->_referenceEVZeroMetadata;
}

- (void)setReferenceEVZeroMetadata:(id)a3
{
}

- (__CVBuffer)inferenceInputPixelBuffer
{
  return self->_inferenceInputPixelBuffer;
}

- (void)setInferenceInputPixelBuffer:(__CVBuffer *)a3
{
}

- (BOOL)providesInferencesWithoutInferenceInputPixelBuffer
{
  return self->_providesInferencesWithoutInferenceInputPixelBuffer;
}

- (void)setProvidesInferencesWithoutInferenceInputPixelBuffer:(BOOL)a3
{
  self->_providesInferencesWithoutInferenceInputPixelBuffer = a3;
}

- (__CVBuffer)gainMapOutputPixelBuffer
{
  return self->_gainMapOutputPixelBuffer;
}

- (void)setGainMapOutputPixelBuffer:(__CVBuffer *)a3
{
}

- (NSMutableDictionary)gainMapOutputMetadata
{
  return self->_gainMapOutputMetadata;
}

- (void)setGainMapOutputMetadata:(id)a3
{
}

- (__CVBuffer)linearOutputPixelBuffer
{
  return self->_linearOutputPixelBuffer;
}

- (void)setLinearOutputPixelBuffer:(__CVBuffer *)a3
{
}

- (NSMutableDictionary)linearOutputMetadata
{
  return self->_linearOutputMetadata;
}

- (void)setLinearOutputMetadata:(id)a3
{
}

- (__CVBuffer)linearOutputMIWBAppliedPixelBuffer
{
  return self->_linearOutputMIWBAppliedPixelBuffer;
}

- (void)setLinearOutputMIWBAppliedPixelBuffer:(__CVBuffer *)a3
{
}

- (NSMutableDictionary)linearOutputMIWBAppliedMetadata
{
  return self->_linearOutputMIWBAppliedMetadata;
}

- (void)setLinearOutputMIWBAppliedMetadata:(id)a3
{
}

- (__n128)refFrameTransform
{
  return a1[11];
}

- (__n128)setRefFrameTransform:(__n128)a3
{
  result[11] = a2;
  result[12] = a3;
  result[13] = a4;
  return result;
}

- (BOOL)refFrameTransformIsValid
{
  return self->_refFrameTransformIsValid;
}

- (void)setRefFrameTransformIsValid:(BOOL)a3
{
  self->_refFrameTransformIsValid = a3;
}

- (int)fusionMode
{
  return self->_fusionMode;
}

- (void)setFusionMode:(int)a3
{
  self->_fusionMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linearOutputMIWBAppliedMetadata, 0);
  objc_storeStrong((id *)&self->_linearOutputMetadata, 0);
  objc_storeStrong((id *)&self->_gainMapOutputMetadata, 0);
  objc_storeStrong((id *)&self->_referenceEVZeroMetadata, 0);
  objc_storeStrong((id *)&self->_syntheticLongMetadata, 0);
  objc_storeStrong((id *)&self->_syntheticReferenceMetadata, 0);

  objc_storeStrong((id *)&self->_proxyMetadata, 0);
}

@end