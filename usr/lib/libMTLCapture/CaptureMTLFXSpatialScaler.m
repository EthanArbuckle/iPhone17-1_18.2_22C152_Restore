@interface CaptureMTLFXSpatialScaler
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLFXSpatialScaler)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLFXSpatialScaler)baseObject;
- (MTLFence)fence;
- (MTLTexture)colorTexture;
- (MTLTexture)debugTexture;
- (MTLTexture)outputTexture;
- (NSString)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (int64_t)colorProcessingMode;
- (unint64_t)colorTextureFormat;
- (unint64_t)colorTextureUsage;
- (unint64_t)inputContentHeight;
- (unint64_t)inputContentWidth;
- (unint64_t)inputHeight;
- (unint64_t)inputWidth;
- (unint64_t)outputHeight;
- (unint64_t)outputTextureFormat;
- (unint64_t)outputTextureUsage;
- (unint64_t)outputWidth;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)encodeToCommandBuffer:(id)a3;
- (void)encodeToCommandQueue:(id)a3;
- (void)setColorTexture:(id)a3;
- (void)setDebugTexture:(id)a3;
- (void)setFence:(id)a3;
- (void)setInputContentHeight:(unint64_t)a3;
- (void)setInputContentWidth:(unint64_t)a3;
- (void)setOutputTexture:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLFXSpatialScaler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureDebugTexture, 0);
  objc_storeStrong((id *)&self->_captureOutputTexture, 0);
  objc_storeStrong((id *)&self->_captureColorTexture, 0);
  objc_storeStrong((id *)&self->_captureFence, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)encodeToCommandQueue:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLFXSpatialScaler_encodeToCommandQueue", (uint64_t)"MetalFX SPI", 0, 0);
  baseObject = self->_baseObject;
  id v6 = [v4 baseObject];

  [(MTLFXSpatialScalerSPI *)baseObject encodeToCommandQueue:v6];
}

- (unint64_t)outputWidth
{
  return (unint64_t)[(MTLFXSpatialScalerSPI *)self->_baseObject outputWidth];
}

- (unint64_t)outputTextureUsage
{
  return (unint64_t)[(MTLFXSpatialScalerSPI *)self->_baseObject outputTextureUsage];
}

- (unint64_t)outputTextureFormat
{
  return (unint64_t)[(MTLFXSpatialScalerSPI *)self->_baseObject outputTextureFormat];
}

- (unint64_t)outputHeight
{
  return (unint64_t)[(MTLFXSpatialScalerSPI *)self->_baseObject outputHeight];
}

- (unint64_t)inputWidth
{
  return (unint64_t)[(MTLFXSpatialScalerSPI *)self->_baseObject inputWidth];
}

- (unint64_t)inputHeight
{
  return (unint64_t)[(MTLFXSpatialScalerSPI *)self->_baseObject inputHeight];
}

- (void)setInputContentWidth:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLFXSpatialScalerSPI *)self->_baseObject setInputContentWidth:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -20477;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  v10 = [(CaptureMTLFXSpatialScaler *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (unint64_t)inputContentWidth
{
  return (unint64_t)[(MTLFXSpatialScalerSPI *)self->_baseObject inputContentWidth];
}

- (void)setInputContentHeight:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLFXSpatialScalerSPI *)self->_baseObject setInputContentHeight:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -20478;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  v10 = [(CaptureMTLFXSpatialScaler *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (unint64_t)inputContentHeight
{
  return (unint64_t)[(MTLFXSpatialScalerSPI *)self->_baseObject inputContentHeight];
}

- (unint64_t)colorTextureUsage
{
  return (unint64_t)[(MTLFXSpatialScalerSPI *)self->_baseObject colorTextureUsage];
}

- (unint64_t)colorTextureFormat
{
  return (unint64_t)[(MTLFXSpatialScalerSPI *)self->_baseObject colorTextureFormat];
}

- (int64_t)colorProcessingMode
{
  return (int64_t)[(MTLFXSpatialScalerSPI *)self->_baseObject colorProcessingMode];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLFXSpatialScalerSPI *)baseObject conformsToProtocol:v4];

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return CaptureRespondsToSelector((uint64_t)self->_baseObject, a3);
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)CaptureMTLFXSpatialScaler;
  v3 = [(CaptureMTLFXSpatialScaler *)&v7 description];
  id v4 = [(MTLFXSpatialScalerSPI *)self->_baseObject description];
  unsigned __int8 v5 = +[NSString stringWithFormat:@"%@ -> %@", v3, v4];

  return (NSString *)v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_baseObject;
}

- (unint64_t)streamReference
{
  traceStream = self->_traceStream;
  if (traceStream) {
    return traceStream->var0;
  }
  else {
    return 0;
  }
}

- (GTTraceStream)traceStream
{
  return self->_traceStream;
}

- (GTTraceContext)traceContext
{
  return self->_traceContext;
}

- (void)touch
{
  traceStream = self->_traceStream;
  uint64_t v3 = mach_absolute_time();
  if (traceStream)
  {
    unint64_t v4 = atomic_load(&traceStream[1].var1);
    unint64_t v5 = v4;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)&traceStream[1].var1, &v5, v4 & 0x1F | v3 & 0xFFFFFFFFFFFFFFE0);
      BOOL v6 = v5 == v4;
      unint64_t v4 = v5;
    }
    while (!v6);
  }
}

- (id)originalObject
{
  return DEVICEOBJECT(self->_baseObject);
}

- (void)dealloc
{
  baseObject = self->_baseObject;
  self->_baseObject = 0;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -20475;
  char v5 = BYTE9(v16);
  if (BYTE9(v16) > 0x38uLL)
  {
    uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v8 = BYTE10(v16);
    ++BYTE10(v16);
    BOOL v6 = GTTraceMemPool_allocateBytes(v7, *((uint64_t *)&v15 + 1), v8 | 0x800000000) + 16;
    char v5 = v8;
  }
  else
  {
    BOOL v6 = (char *)(v4 + BYTE9(v16));
    BYTE9(v16) += 8;
  }
  *(unsigned char *)(v4 + 13) = v5;
  uint64_t v9 = [(CaptureMTLFXSpatialScaler *)self traceStream];
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)BOOL v6 = var0;
  s();
  *(void *)uint64_t v11 = v12;
  *(unsigned char *)(v11 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v13.receiver = self;
  v13.super_class = (Class)CaptureMTLFXSpatialScaler;
  [(CaptureMTLFXSpatialScaler *)&v13 dealloc];
}

- (void)setDebugTexture:(id)a3
{
  objc_storeStrong((id *)&self->_captureDebugTexture, a3);
  id v5 = a3;
  id v6 = [v5 baseObject];
  [(MTLFXSpatialScalerSPI *)self->_baseObject setDebugTexture:v6];
}

- (MTLTexture)debugTexture
{
  return (MTLTexture *)self->_captureDebugTexture;
}

- (void)encodeToCommandBuffer:(id)a3
{
  id v4 = a3;
  if ([v4 isCapturing])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
    traceContext = self->_traceContext;
    [v4 traceStream];
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v21);
    baseObject = self->_baseObject;
    uint64_t v7 = [v4 baseObject];
    [(MTLFXSpatialScalerSPI *)baseObject encodeToCommandBuffer:v7];

    uint64_t v8 = v22;
    *(_DWORD *)(v22 + 8) = -20474;
    char v9 = BYTE9(v23);
    if (BYTE9(v23) > 0x30uLL)
    {
      uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
      uint64_t v14 = BYTE10(v23);
      ++BYTE10(v23);
      v10 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1000000000) + 16;
      char v9 = v14;
    }
    else
    {
      v10 = (char *)(v8 + BYTE9(v23));
      BYTE9(v23) += 16;
    }
    *(unsigned char *)(v8 + 13) = v9;
    long long v15 = [(CaptureMTLFXSpatialScaler *)self traceStream];
    if (v15) {
      unint64_t var0 = v15->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    v17 = (uint64_t *)[v4 traceStream];
    if (v17) {
      uint64_t v18 = *v17;
    }
    else {
      uint64_t v18 = 0;
    }
    *(void *)v10 = var0;
    *((void *)v10 + 1) = v18;
    s();
    *(void *)uint64_t v19 = v20;
    *(unsigned char *)(v19 + 8) = BYTE8(v23);
    *(unsigned char *)(v22 + 15) |= 8u;
  }
  else
  {
    uint64_t v11 = self->_baseObject;
    uint64_t v12 = [v4 baseObject];
    [(MTLFXSpatialScalerSPI *)v11 encodeToCommandBuffer:v12];
  }
}

- (void)setOutputTexture:(id)a3
{
  id v4 = (CaptureMTLTexture *)a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  id v5 = [(CaptureMTLTexture *)v4 baseObject];
  [(MTLFXSpatialScalerSPI *)self->_baseObject setOutputTexture:v5];

  captureOutputTexture = self->_captureOutputTexture;
  self->_captureOutputTexture = v4;
  uint64_t v7 = v4;

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -20476;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  uint64_t v13 = [(CaptureMTLFXSpatialScaler *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v15 = [(CaptureMTLTexture *)v7 traceStream];
  if (v15) {
    unint64_t v16 = v15->var0;
  }
  else {
    unint64_t v16 = 0;
  }
  *(void *)v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (MTLTexture)outputTexture
{
  return (MTLTexture *)self->_captureOutputTexture;
}

- (void)setColorTexture:(id)a3
{
  id v4 = (CaptureMTLTexture *)a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  id v5 = [(CaptureMTLTexture *)v4 baseObject];
  [(MTLFXSpatialScalerSPI *)self->_baseObject setColorTexture:v5];

  captureColorTexture = self->_captureColorTexture;
  self->_captureColorTexture = v4;
  uint64_t v7 = v4;

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -20480;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  uint64_t v13 = [(CaptureMTLFXSpatialScaler *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v15 = [(CaptureMTLTexture *)v7 traceStream];
  if (v15) {
    unint64_t v16 = v15->var0;
  }
  else {
    unint64_t v16 = 0;
  }
  *(void *)v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (MTLTexture)colorTexture
{
  return (MTLTexture *)self->_captureColorTexture;
}

- (void)setFence:(id)a3
{
  id v4 = (CaptureMTLFence *)a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  id v5 = [(CaptureMTLFence *)v4 baseObject];
  [(MTLFXSpatialScalerSPI *)self->_baseObject setFence:v5];

  captureFence = self->_captureFence;
  self->_captureFence = v4;
  uint64_t v7 = v4;

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -20479;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  uint64_t v13 = [(CaptureMTLFXSpatialScaler *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v15 = [(CaptureMTLFence *)v7 traceStream];
  if (v15) {
    unint64_t v16 = v15->var0;
  }
  else {
    unint64_t v16 = 0;
  }
  *(void *)v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (MTLFence)fence
{
  return (MTLFence *)self->_captureFence;
}

- (MTLFXSpatialScaler)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLFXSpatialScaler)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLFXSpatialScaler;
  char v9 = [(CaptureMTLFXSpatialScaler *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    uint64_t v11 = [(CaptureMTLDevice *)v10->_captureDevice traceContext];
    v10->_traceContext = v11;
    uint64_t v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);
  }
  return v10;
}

@end