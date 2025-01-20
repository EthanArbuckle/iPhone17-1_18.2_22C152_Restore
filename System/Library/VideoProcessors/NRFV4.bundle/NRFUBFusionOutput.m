@interface NRFUBFusionOutput
- (BOOL)providesInferencesWithoutInferenceInputPixelBuffer;
- (NSMutableDictionary)gainMapOutputMetadata;
- (NSMutableDictionary)linearOutputMIWBAppliedMetadata;
- (NSMutableDictionary)linearOutputMetadata;
- (NSMutableDictionary)metadata;
- (__CVBuffer)gainMapOutputPixelBuffer;
- (__CVBuffer)inferenceInputPixelBuffer;
- (__CVBuffer)linearOutputMIWBAppliedPixelBuffer;
- (__CVBuffer)linearOutputPixelBuffer;
- (__CVBuffer)pixelBuffer;
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
- (void)setMetadata:(id)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3;
- (void)setProvidesInferencesWithoutInferenceInputPixelBuffer:(BOOL)a3;
@end

@implementation NRFUBFusionOutput

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  CVPixelBufferRelease(self->_linearOutputPixelBuffer);
  CVPixelBufferRelease(self->_inferenceInputPixelBuffer);
  CVPixelBufferRelease(self->_gainMapOutputPixelBuffer);
  CVPixelBufferRelease(self->_linearOutputMIWBAppliedPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)NRFUBFusionOutput;
  [(NRFUBFusionOutput *)&v3 dealloc];
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
}

- (NSMutableDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
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

- (int)fusionMode
{
  return self->_fusionMode;
}

- (void)setFusionMode:(int)a3
{
  self->_fusionMode = a3;
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

- (__n128)refFrameTransform
{
  return a1[7];
}

- (__n128)setRefFrameTransform:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gainMapOutputMetadata, 0);
  objc_storeStrong((id *)&self->_linearOutputMIWBAppliedMetadata, 0);
  objc_storeStrong((id *)&self->_linearOutputMetadata, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end