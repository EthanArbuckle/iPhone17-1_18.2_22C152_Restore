@interface VisionCoreISPInferenceNetworkPostProcessingInput
- (VisionCoreISPInferenceNetworkPostProcessingInput)initWithInputImageBuffer:(__CVBuffer *)a3 inputImageOrientation:(unsigned int)a4 inferenceOutputNamedObjects:(id)a5;
- (VisionCoreNamedObjects)inferenceOutputNamedObjects;
- (__CVBuffer)inputImageBuffer;
- (unsigned)inputImageOrientation;
- (void)dealloc;
@end

@implementation VisionCoreISPInferenceNetworkPostProcessingInput

- (void).cxx_destruct
{
}

- (VisionCoreNamedObjects)inferenceOutputNamedObjects
{
  return self->_inferenceOutputNamedObjects;
}

- (unsigned)inputImageOrientation
{
  return self->_inputImageOrientation;
}

- (__CVBuffer)inputImageBuffer
{
  return self->_inputImageBuffer;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_inputImageBuffer);
  v3.receiver = self;
  v3.super_class = (Class)VisionCoreISPInferenceNetworkPostProcessingInput;
  [(VisionCoreISPInferenceNetworkPostProcessingInput *)&v3 dealloc];
}

- (VisionCoreISPInferenceNetworkPostProcessingInput)initWithInputImageBuffer:(__CVBuffer *)a3 inputImageOrientation:(unsigned int)a4 inferenceOutputNamedObjects:(id)a5
{
  id v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)VisionCoreISPInferenceNetworkPostProcessingInput;
  v10 = [(VisionCoreISPInferenceNetworkPostProcessingInput *)&v12 init];
  if (v10)
  {
    v10->_inputImageBuffer = CVPixelBufferRetain(a3);
    v10->_inputImageOrientation = a4;
    objc_storeStrong((id *)&v10->_inferenceOutputNamedObjects, a5);
  }

  return v10;
}

@end