@interface _RSFrame
- (RSCamera)camera;
- (RSCamera)sceneCamera;
- (RSRawPointCloud)rawFeaturePoints;
- (__CVBuffer)colorBuffer;
- (__CVBuffer)depthBuffer;
- (__CVBuffer)depthConfidenceBuffer;
- (__CVBuffer)sceneColorBuffer;
- (__CVBuffer)semanticConfidenceBuffer;
- (__CVBuffer)semanticLabelBuffer;
- (__n128)referenceOriginTransform;
- (__n128)setReferenceOriginTransform:(__n128)a3;
- (double)timestamp;
- (int64_t)deviceOrientation;
- (int64_t)vioTrackingState;
- (void)dealloc;
- (void)setCamera:(id)a3;
- (void)setColorBuffer:(__CVBuffer *)a3;
- (void)setDepthBuffer:(__CVBuffer *)a3;
- (void)setDepthConfidenceBuffer:(__CVBuffer *)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setRawFeaturePoints:(id)a3;
- (void)setSceneCamera:(id)a3;
- (void)setSceneColorBuffer:(__CVBuffer *)a3;
- (void)setSemanticConfidenceBuffer:(__CVBuffer *)a3;
- (void)setSemanticLabelBuffer:(__CVBuffer *)a3;
- (void)setTimestamp:(double)a3;
- (void)setVioTrackingState:(int64_t)a3;
@end

@implementation _RSFrame

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawFeaturePoints, 0);
  objc_storeStrong((id *)&self->_sceneCamera, 0);

  objc_storeStrong((id *)&self->_camera, 0);
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (__n128)setReferenceOriginTransform:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  result[10] = a5;
  return result;
}

- (__n128)referenceOriginTransform
{
  return a1[7];
}

- (void)setRawFeaturePoints:(id)a3
{
}

- (RSRawPointCloud)rawFeaturePoints
{
  return self->_rawFeaturePoints;
}

- (void)setVioTrackingState:(int64_t)a3
{
  self->_vioTrackingState = a3;
}

- (int64_t)vioTrackingState
{
  return self->_vioTrackingState;
}

- (void)setSemanticConfidenceBuffer:(__CVBuffer *)a3
{
  self->_semanticConfidenceBuffer = a3;
}

- (__CVBuffer)semanticConfidenceBuffer
{
  return self->_semanticConfidenceBuffer;
}

- (void)setSemanticLabelBuffer:(__CVBuffer *)a3
{
  self->_semanticLabelBuffer = a3;
}

- (__CVBuffer)semanticLabelBuffer
{
  return self->_semanticLabelBuffer;
}

- (void)setDepthConfidenceBuffer:(__CVBuffer *)a3
{
  self->_depthConfidenceBuffer = a3;
}

- (__CVBuffer)depthConfidenceBuffer
{
  return self->_depthConfidenceBuffer;
}

- (void)setDepthBuffer:(__CVBuffer *)a3
{
  self->_depthBuffer = a3;
}

- (__CVBuffer)depthBuffer
{
  return self->_depthBuffer;
}

- (void)setSceneColorBuffer:(__CVBuffer *)a3
{
  self->_sceneColorBuffer = a3;
}

- (__CVBuffer)sceneColorBuffer
{
  return self->_sceneColorBuffer;
}

- (void)setSceneCamera:(id)a3
{
}

- (RSCamera)sceneCamera
{
  return self->_sceneCamera;
}

- (void)setColorBuffer:(__CVBuffer *)a3
{
  self->_colorBuffer = a3;
}

- (__CVBuffer)colorBuffer
{
  return self->_colorBuffer;
}

- (void)setCamera:(id)a3
{
}

- (RSCamera)camera
{
  return self->_camera;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)dealloc
{
  depthBuffer = self->_depthBuffer;
  if (depthBuffer)
  {
    CVPixelBufferRelease(depthBuffer);
    self->_depthBuffer = 0;
  }
  depthConfidenceBuffer = self->_depthConfidenceBuffer;
  if (depthConfidenceBuffer)
  {
    CVPixelBufferRelease(depthConfidenceBuffer);
    self->_depthConfidenceBuffer = 0;
  }
  semanticLabelBuffer = self->_semanticLabelBuffer;
  if (semanticLabelBuffer)
  {
    CVPixelBufferRelease(semanticLabelBuffer);
    self->_semanticLabelBuffer = 0;
  }
  semanticConfidenceBuffer = self->_semanticConfidenceBuffer;
  if (semanticConfidenceBuffer)
  {
    CVPixelBufferRelease(semanticConfidenceBuffer);
    self->_semanticConfidenceBuffer = 0;
  }
  colorBuffer = self->_colorBuffer;
  if (colorBuffer)
  {
    CVPixelBufferRelease(colorBuffer);
    self->_colorBuffer = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)_RSFrame;
  [(_RSFrame *)&v8 dealloc];
}

@end