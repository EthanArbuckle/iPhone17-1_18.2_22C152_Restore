@interface HistogramMetal
- (HistogramMetal)init;
- (HistogramMetal)initWithDevice:(__CVBuffer *)a3;
- (future<CF<const)generateHistogramMetal:(__CVBuffer *)a3 forRegion:(id *)a4;
- (id).cxx_construct;
- (id)loadTextureRGBAUnorm:(__CVBuffer *)a3 forPlane:(int)a4 withAttributes:(id)a5;
@end

@implementation HistogramMetal

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readAttributes, 0);
  sub_1BB9C4888((const void **)&self->_textureCacheRGBALuma.value_);

  objc_storeStrong((id *)&self->_histogramKernel, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (future<CF<const)generateHistogramMetal:(__CVBuffer *)a3 forRegion:(id *)a4
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  char v8 = sub_1BBA13A1C(PixelFormatType);
  uint64_t v9 = (1 << v8);
  if (!self->_histogramKernel)
  {
    unint64_t v28 = (1 << v8);
    LOBYTE(v29) = 1;
    uint64_t v30 = 0;
    CFTypeRef v31 = 0;
    __asm { FMOV            V0.4S, #1.0 }
    long long v32 = _Q0;
    v15 = (MPSImageHistogram *)[objc_alloc(MEMORY[0x1E4F355A0]) initWithDevice:self->_device histogramInfo:&v28];
    histogramKernel = self->_histogramKernel;
    self->_histogramKernel = v15;
  }
  uint64_t v17 = [(HistogramMetal *)self loadTextureRGBAUnorm:a3 forPlane:0 withAttributes:self->_readAttributes];
  p_histogramBufferPool = &self->_histogramBufferPool;
  if (self->_histogramBufferPool.allocSize_ != 16 * v9)
  {
    pool = p_histogramBufferPool->pool_;
    p_histogramBufferPool->pool_ = 0;
  }
  self->_histogramBufferPool.allocSize_ = 16 * v9;
  CFTypeRef cf = 0;
  v20 = sub_1BB9CC530((uint64_t)&self->_histogramBufferPool, &cf);
  v21 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v21 setLabel:@"histogram"];
  long long v22 = *(_OWORD *)&a4->var0.var2;
  v26[0] = *(_OWORD *)&a4->var0.var0;
  v26[1] = v22;
  v26[2] = *(_OWORD *)&a4->var1.var1;
  [(MPSImageHistogram *)self->_histogramKernel setClipRectSource:v26];
  [(MPSImageHistogram *)self->_histogramKernel encodeToCommandBuffer:v21 sourceTexture:v17 histogram:v20 histogramOffset:0];
  [v21 commit];
  id v23 = v21;
  id v24 = v20;
  CFTypeRef v25 = cf;
  if (cf) {
    CFRetain(cf);
  }
  int v35 = v9;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  unint64_t v28 = (unint64_t)v23;
  id v29 = v24;
  LODWORD(v30) = v9;
  CFTypeRef v31 = v25;
  uint64_t v36 = 0;
  operator new();
}

- (id)loadTextureRGBAUnorm:(__CVBuffer *)a3 forPlane:(int)a4 withAttributes:(id)a5
{
  CFDictionaryRef v8 = (const __CFDictionary *)a5;
  CFTypeRef cf = 0;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (sub_1BBA13A1C(PixelFormatType) == 10) {
    MTLPixelFormat v10 = MTLPixelFormatRGBA16Unorm;
  }
  else {
    MTLPixelFormat v10 = MTLPixelFormatRGBA8Unorm;
  }
  value = self->_textureCacheRGBALuma.value_;
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a4);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a4);
  if (CVMetalTextureCacheCreateTextureFromImage(0, value, a3, v8, v10, WidthOfPlane >> 2, HeightOfPlane, a4, (CVMetalTextureRef *)&cf))
  {
    v14 = 0;
  }
  else
  {
    v14 = CVMetalTextureGetTexture((CVMetalTextureRef)cf);
  }
  sub_1BB9C14A0(&cf);

  return v14;
}

- (HistogramMetal)initWithDevice:(__CVBuffer *)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    CVPixelBufferGetIOSurface(a3);
    uint64_t RegistryID = IOSurfaceGetRegistryID();
    p_device = &self->_device;
    device = self->_device;
    if (device)
    {
      if (RegistryID && [(MTLDevice *)device registryID] != RegistryID)
      {
        v7 = *p_device;
        goto LABEL_9;
      }
      return 0;
    }
    v7 = 0;
  }
  else
  {
    p_device = &self->_device;
    v7 = self->_device;
    if (v7) {
      return 0;
    }
  }
LABEL_9:
  self->_device = 0;

  histogramKernel = self->_histogramKernel;
  self->_histogramKernel = 0;

  MTLPixelFormat v10 = self->_device;
  if (!v10)
  {
    v11 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    v12 = *p_device;
    *p_device = v11;

    MTLPixelFormat v10 = *p_device;
    if (!*p_device) {
      return (HistogramMetal *)4294954385;
    }
  }
  v13 = (MTLCommandQueue *)[(MTLDevice *)v10 newCommandQueue];
  commandQueue = self->_commandQueue;
  self->_commandQueue = v13;

  if (!self->_commandQueue) {
    return (HistogramMetal *)4294954385;
  }
  sub_1BB9CFDC8((uint64_t)&self->_histogramBufferPool, self->_device);
  if (!self->_readAttributes)
  {
    uint64_t v21 = *MEMORY[0x1E4F24C88];
    v22[0] = &unk_1F14F4498;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    readAttributes = self->_readAttributes;
    self->_readAttributes = v15;
  }
  value = self->_textureCacheRGBALuma.value_;
  p_textureCacheRGBALuma = &self->_textureCacheRGBALuma;
  uint64_t v17 = value;
  v20 = p_textureCacheRGBALuma[-7].value_;
  if (value)
  {
    CFRelease(v17);
    p_textureCacheRGBALuma->value_ = 0;
  }
  return (HistogramMetal *)CVMetalTextureCacheCreate(0, 0, v20, 0, &p_textureCacheRGBALuma->value_);
}

- (HistogramMetal)init
{
  v6.receiver = self;
  v6.super_class = (Class)HistogramMetal;
  v2 = [(HistogramMetal *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(HistogramMetal *)v2 initWithDevice:0];
    v4 = v3;
  }

  return v3;
}

@end