@interface VisionCoreISPInferenceNetworkPostProcessingOutput
- (NSArray)fullBodyResults;
- (NSArray)hands;
- (VisionCoreISPInferenceNetworkPostProcessingOutput)initWithPostProcessedPersonImageBuffer:(__CVBuffer *)a3 personImageOrientation:(unsigned int)a4 salientPersonImageBuffer:(__CVBuffer *)a5 salientPersonImageBufferOrientation:(unsigned int)a6 skinImageBuffer:(__CVBuffer *)a7 skinImageBufferOrientation:(unsigned int)a8 hairImageBuffer:(__CVBuffer *)a9 hairImageBufferOrientation:(unsigned int)a10 skyImageBuffer:(__CVBuffer *)a11 skyImageBufferOrientation:(unsigned int)a12;
- (__CVBuffer)hairImageBuffer;
- (__CVBuffer)personImageBuffer;
- (__CVBuffer)salientPersonImageBuffer;
- (__CVBuffer)skinImageBuffer;
- (__CVBuffer)skyImageBuffer;
- (unsigned)hairImageBufferOrientation;
- (unsigned)personImageBufferOrientation;
- (unsigned)salientPersonImageBufferOrientation;
- (unsigned)skinImageBufferOrientation;
- (unsigned)skyImageBufferOrientation;
- (void)dealloc;
- (void)setFullBodyResults:(id)a3;
- (void)setHands:(id)a3;
@end

@implementation VisionCoreISPInferenceNetworkPostProcessingOutput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullBodyResults, 0);
  objc_storeStrong((id *)&self->_hands, 0);
}

- (void)setFullBodyResults:(id)a3
{
}

- (NSArray)fullBodyResults
{
  return self->_fullBodyResults;
}

- (void)setHands:(id)a3
{
}

- (NSArray)hands
{
  return self->_hands;
}

- (unsigned)skyImageBufferOrientation
{
  return self->_skyImageBufferOrientation;
}

- (__CVBuffer)skyImageBuffer
{
  return self->_skyImageBuffer;
}

- (unsigned)hairImageBufferOrientation
{
  return self->_hairImageBufferOrientation;
}

- (__CVBuffer)hairImageBuffer
{
  return self->_hairImageBuffer;
}

- (unsigned)skinImageBufferOrientation
{
  return self->_skinImageBufferOrientation;
}

- (__CVBuffer)skinImageBuffer
{
  return self->_skinImageBuffer;
}

- (unsigned)salientPersonImageBufferOrientation
{
  return self->_salientPersonImageBufferOrientation;
}

- (__CVBuffer)salientPersonImageBuffer
{
  return self->_salientPersonImageBuffer;
}

- (unsigned)personImageBufferOrientation
{
  return self->_personImageBufferOrientation;
}

- (__CVBuffer)personImageBuffer
{
  return self->_personImageBuffer;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_personImageBuffer);
  CVPixelBufferRelease(self->_salientPersonImageBuffer);
  CVPixelBufferRelease(self->_skinImageBuffer);
  CVPixelBufferRelease(self->_hairImageBuffer);
  CVPixelBufferRelease(self->_skyImageBuffer);
  v3.receiver = self;
  v3.super_class = (Class)VisionCoreISPInferenceNetworkPostProcessingOutput;
  [(VisionCoreISPInferenceNetworkPostProcessingOutput *)&v3 dealloc];
}

- (VisionCoreISPInferenceNetworkPostProcessingOutput)initWithPostProcessedPersonImageBuffer:(__CVBuffer *)a3 personImageOrientation:(unsigned int)a4 salientPersonImageBuffer:(__CVBuffer *)a5 salientPersonImageBufferOrientation:(unsigned int)a6 skinImageBuffer:(__CVBuffer *)a7 skinImageBufferOrientation:(unsigned int)a8 hairImageBuffer:(__CVBuffer *)a9 hairImageBufferOrientation:(unsigned int)a10 skyImageBuffer:(__CVBuffer *)a11 skyImageBufferOrientation:(unsigned int)a12
{
  v20.receiver = self;
  v20.super_class = (Class)VisionCoreISPInferenceNetworkPostProcessingOutput;
  v18 = [(VisionCoreISPInferenceNetworkPostProcessingOutput *)&v20 init];
  if (v18)
  {
    v18->_personImageBuffer = CVPixelBufferRetain(a3);
    v18->_personImageBufferOrientation = a4;
    v18->_salientPersonImageBuffer = CVPixelBufferRetain(a5);
    v18->_salientPersonImageBufferOrientation = a6;
    v18->_skinImageBuffer = CVPixelBufferRetain(a7);
    v18->_skinImageBufferOrientation = a8;
    v18->_hairImageBuffer = CVPixelBufferRetain(a9);
    v18->_hairImageBufferOrientation = a10;
    v18->_skyImageBuffer = CVPixelBufferRetain(a11);
    v18->_skyImageBufferOrientation = a12;
  }
  return v18;
}

@end