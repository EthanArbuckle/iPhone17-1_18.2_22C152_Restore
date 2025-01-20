@interface DeepFusionOutput
- (NSMutableDictionary)gainMapOutputMetadata;
- (NSMutableDictionary)linearOutputMIWBAppliedMetadata;
- (NSMutableDictionary)linearOutputMetadata;
- (NSMutableDictionary)metadata;
- (NSMutableDictionary)quadraForEnhancedResOutputMetadata;
- (__CVBuffer)buffer;
- (__CVBuffer)gainMapOutputPixelBuffer;
- (__CVBuffer)inferenceInputPixelBuffer;
- (__CVBuffer)linearOutputMIWBAppliedPixelBuffer;
- (__CVBuffer)linearOutputPixelBuffer;
- (__CVBuffer)quadraForEnhancedResInferenceInputPixelBuffer;
- (__CVBuffer)quadraForEnhancedResOutputPixelBuffer;
- (int)fusionMode;
- (void)dealloc;
- (void)setBuffer:(__CVBuffer *)a3;
- (void)setFusionMode:(int)a3;
- (void)setGainMapOutputMetadata:(id)a3;
- (void)setGainMapOutputPixelBuffer:(__CVBuffer *)a3;
- (void)setInferenceInputPixelBuffer:(__CVBuffer *)a3;
- (void)setLinearOutputMIWBAppliedMetadata:(id)a3;
- (void)setLinearOutputMIWBAppliedPixelBuffer:(__CVBuffer *)a3;
- (void)setLinearOutputMetadata:(id)a3;
- (void)setLinearOutputPixelBuffer:(__CVBuffer *)a3;
- (void)setMetadata:(id)a3;
- (void)setQuadraForEnhancedResInferenceInputPixelBuffer:(__CVBuffer *)a3;
- (void)setQuadraForEnhancedResOutputMetadata:(id)a3;
- (void)setQuadraForEnhancedResOutputPixelBuffer:(__CVBuffer *)a3;
@end

@implementation DeepFusionOutput

- (void)dealloc
{
  CVPixelBufferRelease(self->_buffer);
  CVPixelBufferRelease(self->_linearOutputPixelBuffer);
  CVPixelBufferRelease(self->_quadraForEnhancedResOutputPixelBuffer);
  CVPixelBufferRelease(self->_inferenceInputPixelBuffer);
  CVPixelBufferRelease(self->_quadraForEnhancedResInferenceInputPixelBuffer);
  CVPixelBufferRelease(self->_gainMapOutputPixelBuffer);
  CVPixelBufferRelease(self->_linearOutputMIWBAppliedPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)DeepFusionOutput;
  [(DeepFusionOutput *)&v3 dealloc];
}

- (__CVBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(__CVBuffer *)a3
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

- (__CVBuffer)quadraForEnhancedResOutputPixelBuffer
{
  return self->_quadraForEnhancedResOutputPixelBuffer;
}

- (void)setQuadraForEnhancedResOutputPixelBuffer:(__CVBuffer *)a3
{
}

- (NSMutableDictionary)quadraForEnhancedResOutputMetadata
{
  return self->_quadraForEnhancedResOutputMetadata;
}

- (void)setQuadraForEnhancedResOutputMetadata:(id)a3
{
}

- (__CVBuffer)inferenceInputPixelBuffer
{
  return self->_inferenceInputPixelBuffer;
}

- (void)setInferenceInputPixelBuffer:(__CVBuffer *)a3
{
}

- (__CVBuffer)quadraForEnhancedResInferenceInputPixelBuffer
{
  return self->_quadraForEnhancedResInferenceInputPixelBuffer;
}

- (void)setQuadraForEnhancedResInferenceInputPixelBuffer:(__CVBuffer *)a3
{
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
  objc_storeStrong((id *)&self->_gainMapOutputMetadata, 0);
  objc_storeStrong((id *)&self->_quadraForEnhancedResOutputMetadata, 0);
  objc_storeStrong((id *)&self->_linearOutputMIWBAppliedMetadata, 0);
  objc_storeStrong((id *)&self->_linearOutputMetadata, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end