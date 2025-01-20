@interface PVRenderRequest
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)highQuality;
- (CGSize)outputSize;
- (NSArray)outputNodes;
- (PVRenderRequest)initWithOutputs:(id)a3 atTime:(id *)a4 outputSize:(CGSize)a5;
- (id)userContext;
- (int)gcdPriority;
- (int)gpuPriority;
- (int)priority;
- (unsigned)childCode;
- (unsigned)outputCVPixelBufferFormat;
- (unsigned)parentCode;
- (void)setChildCode:(unsigned int)a3;
- (void)setGcdPriority:(int)a3;
- (void)setGpuPriority:(int)a3;
- (void)setHighQuality:(BOOL)a3;
- (void)setOutputCVPixelBufferFormat:(unsigned int)a3;
- (void)setParentCode:(unsigned int)a3;
- (void)setPriority:(int)a3;
- (void)setUserContext:(id)a3;
@end

@implementation PVRenderRequest

- (PVRenderRequest)initWithOutputs:(id)a3 atTime:(id *)a4 outputSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PVRenderRequest;
  v11 = [(PVRenderRequest *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_outputNodes, a3);
    long long v13 = *(_OWORD *)&a4->var0;
    v12->_time.epoch = a4->var3;
    *(_OWORD *)&v12->_time.value = v13;
    v12->_outputSize.CGFloat width = width;
    v12->_outputSize.CGFloat height = height;
    *(void *)&v12->_priority = 0x200000001;
    v12->_gpuPriority = 1;
    v12->_highQuality = 0;
    v12->_parentCode = +[PVRenderRequestJobDelegate jobTypeTag];
    v12->_childCode = 0;
    v12->_outputCVPixelBufferFormat = 0;
    id userContext = v12->_userContext;
    v12->_id userContext = 0;
  }
  return v12;
}

- (NSArray)outputNodes
{
  return self->_outputNodes;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (CGSize)outputSize
{
  double width = self->_outputSize.width;
  double height = self->_outputSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int)priority
{
  return self->_priority;
}

- (void)setPriority:(int)a3
{
  self->_priority = a3;
}

- (int)gcdPriority
{
  return self->_gcdPriority;
}

- (void)setGcdPriority:(int)a3
{
  self->_gcdPriority = a3;
}

- (int)gpuPriority
{
  return self->_gpuPriority;
}

- (void)setGpuPriority:(int)a3
{
  self->_gpuPriority = a3;
}

- (BOOL)highQuality
{
  return self->_highQuality;
}

- (void)setHighQuality:(BOOL)a3
{
  self->_highQuality = a3;
}

- (id)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
}

- (unsigned)outputCVPixelBufferFormat
{
  return self->_outputCVPixelBufferFormat;
}

- (void)setOutputCVPixelBufferFormat:(unsigned int)a3
{
  self->_outputCVPixelBufferFormat = a3;
}

- (unsigned)parentCode
{
  return self->_parentCode;
}

- (void)setParentCode:(unsigned int)a3
{
  self->_parentCode = a3;
}

- (unsigned)childCode
{
  return self->_childCode;
}

- (void)setChildCode:(unsigned int)a3
{
  self->_childCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userContext, 0);

  objc_storeStrong((id *)&self->_outputNodes, 0);
}

@end