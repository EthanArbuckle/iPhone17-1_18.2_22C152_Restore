@interface CaptureMTLFXTemporalScaler
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isDepthReversed;
- (BOOL)reset;
- (BOOL)respondsToSelector:(SEL)a3;
- (CGPoint)previousJitterOffset;
- (CaptureMTLFXTemporalScaler)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLFXTemporalScaler)baseObject;
- (MTLFence)fence;
- (MTLTexture)colorTexture;
- (MTLTexture)debugTexture;
- (MTLTexture)depthTexture;
- (MTLTexture)exposureTexture;
- (MTLTexture)motionTexture;
- (MTLTexture)outputTexture;
- (MTLTexture)reactiveMaskTexture;
- (NSString)description;
- (float)inputContentMaxScale;
- (float)inputContentMinScale;
- (float)jitterOffsetX;
- (float)jitterOffsetY;
- (float)motionVectorScaleX;
- (float)motionVectorScaleY;
- (float)preExposure;
- (id)currentViewToClipMatrix;
- (id)currentWorldToViewMatrix;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (id)previousViewToClipMatrix;
- (id)previousWorldToViewMatrix;
- (unint64_t)colorTextureFormat;
- (unint64_t)colorTextureUsage;
- (unint64_t)depthTextureFormat;
- (unint64_t)depthTextureUsage;
- (unint64_t)executionMode;
- (unint64_t)inputContentHeight;
- (unint64_t)inputContentWidth;
- (unint64_t)inputHeight;
- (unint64_t)inputWidth;
- (unint64_t)motionTextureFormat;
- (unint64_t)motionTextureUsage;
- (unint64_t)outputHeight;
- (unint64_t)outputTextureFormat;
- (unint64_t)outputTextureUsage;
- (unint64_t)outputWidth;
- (unint64_t)reactiveTextureUsage;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)encodeToCommandBuffer:(id)a3;
- (void)encodeToCommandQueue:(id)a3;
- (void)setColorTexture:(id)a3;
- (void)setDebugTexture:(id)a3;
- (void)setDepthReversed:(BOOL)a3;
- (void)setDepthTexture:(id)a3;
- (void)setExposureTexture:(id)a3;
- (void)setFence:(id)a3;
- (void)setInputContentHeight:(unint64_t)a3;
- (void)setInputContentWidth:(unint64_t)a3;
- (void)setJitterOffsetX:(float)a3;
- (void)setJitterOffsetY:(float)a3;
- (void)setMotionTexture:(id)a3;
- (void)setMotionVectorScaleX:(float)a3;
- (void)setMotionVectorScaleY:(float)a3;
- (void)setOutputTexture:(id)a3;
- (void)setPreExposure:(float)a3;
- (void)setReactiveMaskTexture:(id)a3;
- (void)setReset:(BOOL)a3;
- (void)touch;
@end

@implementation CaptureMTLFXTemporalScaler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureReactiveMaskTexture, 0);
  objc_storeStrong((id *)&self->_captureDebugTexture, 0);
  objc_storeStrong((id *)&self->_captureOutputTexture, 0);
  objc_storeStrong((id *)&self->_captureExposureTexture, 0);
  objc_storeStrong((id *)&self->_captureMotionTexture, 0);
  objc_storeStrong((id *)&self->_captureDepthTexture, 0);
  objc_storeStrong((id *)&self->_captureColorTexture, 0);
  objc_storeStrong((id *)&self->_captureFence, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)encodeToCommandQueue:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLFXTemporalScaler_encodeToCommandQueue", (uint64_t)"MetalFX SPI", 0, 0);
  baseObject = self->_baseObject;
  id v6 = [v4 baseObject];

  [(MTLFXTemporalScalerSPI *)baseObject encodeToCommandQueue:v6];
}

- (void)setReset:(BOOL)a3
{
  BOOL v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLFXTemporalScalerSPI *)self->_baseObject setReset:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -20459;
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
  v10 = [(CaptureMTLFXTemporalScaler *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (BOOL)reset
{
  return [(MTLFXTemporalScalerSPI *)self->_baseObject reset];
}

- (unint64_t)reactiveTextureUsage
{
  return (unint64_t)[(MTLFXTemporalScalerSPI *)self->_baseObject reactiveTextureUsage];
}

- (id)previousWorldToViewMatrix
{
  return [*(id *)(a1 + 8) previousWorldToViewMatrix];
}

- (id)previousViewToClipMatrix
{
  return [*(id *)(a1 + 8) previousViewToClipMatrix];
}

- (CGPoint)previousJitterOffset
{
  [(MTLFXTemporalScalerSPI *)self->_baseObject previousJitterOffset];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPreExposure:(float)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v15);
  *(float *)&double v5 = a3;
  [(MTLFXTemporalScalerSPI *)self->_baseObject setPreExposure:v5];
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -20460;
  char v7 = BYTE9(v17);
  if (BYTE9(v17) > 0x30uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 24);
    uint64_t v10 = BYTE10(v17);
    ++BYTE10(v17);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v16 + 1), v10 | 0x1000000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v17));
    BYTE9(v17) += 16;
  }
  *(unsigned char *)(v6 + 13) = v7;
  v11 = [(CaptureMTLFXTemporalScaler *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  *((float *)v8 + 2) = a3;
  *((_DWORD *)v8 + 3) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v17);
  *(unsigned char *)(v16 + 15) |= 8u;
}

- (float)preExposure
{
  [(MTLFXTemporalScalerSPI *)self->_baseObject preExposure];
  return result;
}

- (unint64_t)outputWidth
{
  return (unint64_t)[(MTLFXTemporalScalerSPI *)self->_baseObject outputWidth];
}

- (unint64_t)outputTextureUsage
{
  return (unint64_t)[(MTLFXTemporalScalerSPI *)self->_baseObject outputTextureUsage];
}

- (unint64_t)outputTextureFormat
{
  return (unint64_t)[(MTLFXTemporalScalerSPI *)self->_baseObject outputTextureFormat];
}

- (unint64_t)outputHeight
{
  return (unint64_t)[(MTLFXTemporalScalerSPI *)self->_baseObject outputHeight];
}

- (void)setMotionVectorScaleY:(float)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v15);
  *(float *)&double v5 = a3;
  [(MTLFXTemporalScalerSPI *)self->_baseObject setMotionVectorScaleY:v5];
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -20462;
  char v7 = BYTE9(v17);
  if (BYTE9(v17) > 0x30uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 24);
    uint64_t v10 = BYTE10(v17);
    ++BYTE10(v17);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v16 + 1), v10 | 0x1000000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v17));
    BYTE9(v17) += 16;
  }
  *(unsigned char *)(v6 + 13) = v7;
  v11 = [(CaptureMTLFXTemporalScaler *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  *((float *)v8 + 2) = a3;
  *((_DWORD *)v8 + 3) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v17);
  *(unsigned char *)(v16 + 15) |= 8u;
}

- (float)motionVectorScaleY
{
  [(MTLFXTemporalScalerSPI *)self->_baseObject motionVectorScaleY];
  return result;
}

- (void)setMotionVectorScaleX:(float)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v15);
  *(float *)&double v5 = a3;
  [(MTLFXTemporalScalerSPI *)self->_baseObject setMotionVectorScaleX:v5];
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -20463;
  char v7 = BYTE9(v17);
  if (BYTE9(v17) > 0x30uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 24);
    uint64_t v10 = BYTE10(v17);
    ++BYTE10(v17);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v16 + 1), v10 | 0x1000000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v17));
    BYTE9(v17) += 16;
  }
  *(unsigned char *)(v6 + 13) = v7;
  v11 = [(CaptureMTLFXTemporalScaler *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  *((float *)v8 + 2) = a3;
  *((_DWORD *)v8 + 3) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v17);
  *(unsigned char *)(v16 + 15) |= 8u;
}

- (float)motionVectorScaleX
{
  [(MTLFXTemporalScalerSPI *)self->_baseObject motionVectorScaleX];
  return result;
}

- (unint64_t)motionTextureUsage
{
  return (unint64_t)[(MTLFXTemporalScalerSPI *)self->_baseObject motionTextureUsage];
}

- (unint64_t)motionTextureFormat
{
  return (unint64_t)[(MTLFXTemporalScalerSPI *)self->_baseObject motionTextureFormat];
}

- (void)setJitterOffsetY:(float)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v15);
  *(float *)&double v5 = a3;
  [(MTLFXTemporalScalerSPI *)self->_baseObject setJitterOffsetY:v5];
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -20465;
  char v7 = BYTE9(v17);
  if (BYTE9(v17) > 0x30uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 24);
    uint64_t v10 = BYTE10(v17);
    ++BYTE10(v17);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v16 + 1), v10 | 0x1000000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v17));
    BYTE9(v17) += 16;
  }
  *(unsigned char *)(v6 + 13) = v7;
  v11 = [(CaptureMTLFXTemporalScaler *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  *((float *)v8 + 2) = a3;
  *((_DWORD *)v8 + 3) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v17);
  *(unsigned char *)(v16 + 15) |= 8u;
}

- (float)jitterOffsetY
{
  [(MTLFXTemporalScalerSPI *)self->_baseObject jitterOffsetY];
  return result;
}

- (void)setJitterOffsetX:(float)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v15);
  *(float *)&double v5 = a3;
  [(MTLFXTemporalScalerSPI *)self->_baseObject setJitterOffsetX:v5];
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -20466;
  char v7 = BYTE9(v17);
  if (BYTE9(v17) > 0x30uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 24);
    uint64_t v10 = BYTE10(v17);
    ++BYTE10(v17);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v16 + 1), v10 | 0x1000000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v17));
    BYTE9(v17) += 16;
  }
  *(unsigned char *)(v6 + 13) = v7;
  v11 = [(CaptureMTLFXTemporalScaler *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  *((float *)v8 + 2) = a3;
  *((_DWORD *)v8 + 3) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v17);
  *(unsigned char *)(v16 + 15) |= 8u;
}

- (float)jitterOffsetX
{
  [(MTLFXTemporalScalerSPI *)self->_baseObject jitterOffsetX];
  return result;
}

- (unint64_t)inputWidth
{
  return (unint64_t)[(MTLFXTemporalScalerSPI *)self->_baseObject inputWidth];
}

- (unint64_t)inputHeight
{
  return (unint64_t)[(MTLFXTemporalScalerSPI *)self->_baseObject inputHeight];
}

- (void)setInputContentWidth:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLFXTemporalScalerSPI *)self->_baseObject setInputContentWidth:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -20467;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    char v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    char v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLFXTemporalScaler *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)char v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (unint64_t)inputContentWidth
{
  return (unint64_t)[(MTLFXTemporalScalerSPI *)self->_baseObject inputContentWidth];
}

- (float)inputContentMinScale
{
  [(MTLFXTemporalScalerSPI *)self->_baseObject inputContentMinScale];
  return result;
}

- (float)inputContentMaxScale
{
  [(MTLFXTemporalScalerSPI *)self->_baseObject inputContentMaxScale];
  return result;
}

- (void)setInputContentHeight:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLFXTemporalScalerSPI *)self->_baseObject setInputContentHeight:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -20468;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    char v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    char v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLFXTemporalScaler *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)char v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (unint64_t)inputContentHeight
{
  return (unint64_t)[(MTLFXTemporalScalerSPI *)self->_baseObject inputContentHeight];
}

- (unint64_t)executionMode
{
  return (unint64_t)[(MTLFXTemporalScalerSPI *)self->_baseObject executionMode];
}

- (unint64_t)depthTextureUsage
{
  return (unint64_t)[(MTLFXTemporalScalerSPI *)self->_baseObject depthTextureUsage];
}

- (unint64_t)depthTextureFormat
{
  return (unint64_t)[(MTLFXTemporalScalerSPI *)self->_baseObject depthTextureFormat];
}

- (void)setDepthReversed:(BOOL)a3
{
  BOOL v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLFXTemporalScalerSPI *)self->_baseObject setDepthReversed:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -20472;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    char v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    char v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLFXTemporalScaler *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)char v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (BOOL)isDepthReversed
{
  return [(MTLFXTemporalScalerSPI *)self->_baseObject isDepthReversed];
}

- (id)currentWorldToViewMatrix
{
  return [*(id *)(a1 + 8) currentWorldToViewMatrix];
}

- (id)currentViewToClipMatrix
{
  return [*(id *)(a1 + 8) currentViewToClipMatrix];
}

- (unint64_t)colorTextureUsage
{
  return (unint64_t)[(MTLFXTemporalScalerSPI *)self->_baseObject colorTextureUsage];
}

- (unint64_t)colorTextureFormat
{
  return (unint64_t)[(MTLFXTemporalScalerSPI *)self->_baseObject colorTextureFormat];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLFXTemporalScalerSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLFXTemporalScaler;
  BOOL v3 = [(CaptureMTLFXTemporalScaler *)&v7 description];
  id v4 = [(MTLFXTemporalScalerSPI *)self->_baseObject description];
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
  *(_DWORD *)(v15 + 8) = -20458;
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
  uint64_t v9 = [(CaptureMTLFXTemporalScaler *)self traceStream];
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
  v13.super_class = (Class)CaptureMTLFXTemporalScaler;
  [(CaptureMTLFXTemporalScaler *)&v13 dealloc];
}

- (void)setReactiveMaskTexture:(id)a3
{
  uint64_t v4 = (CaptureMTLTexture *)a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  char v5 = [(CaptureMTLTexture *)v4 baseObject];
  [(MTLFXTemporalScalerSPI *)self->_baseObject setReactiveMaskTexture:v5];

  captureReactiveMaskTexture = self->_captureReactiveMaskTexture;
  self->_captureReactiveMaskTexture = v4;
  uint64_t v7 = v4;

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -20456;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  objc_super v13 = [(CaptureMTLFXTemporalScaler *)self traceStream];
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
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (MTLTexture)reactiveMaskTexture
{
  return (MTLTexture *)self->_captureReactiveMaskTexture;
}

- (void)encodeToCommandBuffer:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isCapturing];
  baseObject = self->_baseObject;
  if (v5)
  {
    if (objc_opt_respondsToSelector())
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v32 = 0u;
      GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v32);
      id v7 = [(MTLFXTemporalScalerSPI *)self->_baseObject executionMode];
      uint64_t v8 = v33;
      *(_DWORD *)(v33 + 8) = -18430;
      char v9 = BYTE9(v34);
      if (BYTE9(v34) > 0x30uLL)
      {
        uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 24);
        uint64_t v13 = BYTE10(v34);
        ++BYTE10(v34);
        uint64_t v10 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v33 + 1), v13 | 0x1000000000) + 16;
        char v9 = v13;
      }
      else
      {
        uint64_t v10 = (char *)(v8 + BYTE9(v34));
        BYTE9(v34) += 16;
      }
      *(unsigned char *)(v8 + 13) = v9;
      long long v14 = [(CaptureMTLFXTemporalScaler *)self traceStream];
      if (v14) {
        unint64_t var0 = v14->var0;
      }
      else {
        unint64_t var0 = 0;
      }
      *(void *)uint64_t v10 = var0;
      *((void *)v10 + 1) = v7;
      s();
      *(void *)uint64_t v16 = v17;
      *(unsigned char *)(v16 + 8) = BYTE8(v34);
      *(unsigned char *)(v33 + 15) |= 8u;
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    traceContext = self->_traceContext;
    [v4 traceStream];
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v32);
    long long v19 = self->_baseObject;
    long long v20 = [v4 baseObject];
    [(MTLFXTemporalScalerSPI *)v19 encodeToCommandBuffer:v20];

    uint64_t v21 = v33;
    *(_DWORD *)(v33 + 8) = -20457;
    char v22 = BYTE9(v34);
    if (BYTE9(v34) > 0x30uLL)
    {
      uint64_t v24 = *(void *)(*((void *)&v32 + 1) + 24);
      uint64_t v25 = BYTE10(v34);
      ++BYTE10(v34);
      v23 = GTTraceMemPool_allocateBytes(v24, *((uint64_t *)&v33 + 1), v25 | 0x1000000000) + 16;
      char v22 = v25;
    }
    else
    {
      v23 = (char *)(v21 + BYTE9(v34));
      BYTE9(v34) += 16;
    }
    *(unsigned char *)(v21 + 13) = v22;
    v26 = [(CaptureMTLFXTemporalScaler *)self traceStream];
    if (v26) {
      unint64_t v27 = v26->var0;
    }
    else {
      unint64_t v27 = 0;
    }
    v28 = (uint64_t *)[v4 traceStream];
    if (v28) {
      uint64_t v29 = *v28;
    }
    else {
      uint64_t v29 = 0;
    }
    *(void *)v23 = v27;
    *((void *)v23 + 1) = v29;
    s();
    *(void *)uint64_t v30 = v31;
    *(unsigned char *)(v30 + 8) = BYTE8(v34);
    *(unsigned char *)(v33 + 15) |= 8u;
  }
  else
  {
    uint64_t v11 = [v4 baseObject];
    [(MTLFXTemporalScalerSPI *)baseObject encodeToCommandBuffer:v11];
  }
}

- (void)setDebugTexture:(id)a3
{
  objc_storeStrong((id *)&self->_captureDebugTexture, a3);
  id v5 = a3;
  id v6 = [v5 baseObject];
  [(MTLFXTemporalScalerSPI *)self->_baseObject setDebugTexture:v6];
}

- (MTLTexture)debugTexture
{
  return (MTLTexture *)self->_captureDebugTexture;
}

- (void)setOutputTexture:(id)a3
{
  id v4 = (CaptureMTLTexture *)a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  id v5 = [(CaptureMTLTexture *)v4 baseObject];
  [(MTLFXTemporalScalerSPI *)self->_baseObject setOutputTexture:v5];

  captureOutputTexture = self->_captureOutputTexture;
  self->_captureOutputTexture = v4;
  id v7 = v4;

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -20461;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  uint64_t v13 = [(CaptureMTLFXTemporalScaler *)self traceStream];
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
  *(void *)uint64_t v10 = var0;
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

- (void)setMotionTexture:(id)a3
{
  id v4 = (CaptureMTLTexture *)a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  id v5 = [(CaptureMTLTexture *)v4 baseObject];
  [(MTLFXTemporalScalerSPI *)self->_baseObject setMotionTexture:v5];

  captureMotionTexture = self->_captureMotionTexture;
  self->_captureMotionTexture = v4;
  id v7 = v4;

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -20464;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  uint64_t v13 = [(CaptureMTLFXTemporalScaler *)self traceStream];
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
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (MTLTexture)motionTexture
{
  return (MTLTexture *)self->_captureMotionTexture;
}

- (void)setExposureTexture:(id)a3
{
  id v4 = (CaptureMTLTexture *)a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  id v5 = [(CaptureMTLTexture *)v4 baseObject];
  [(MTLFXTemporalScalerSPI *)self->_baseObject setExposureTexture:v5];

  captureExposureTexture = self->_captureExposureTexture;
  self->_captureExposureTexture = v4;
  id v7 = v4;

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -20470;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  uint64_t v13 = [(CaptureMTLFXTemporalScaler *)self traceStream];
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
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (MTLTexture)exposureTexture
{
  return (MTLTexture *)self->_captureExposureTexture;
}

- (void)setDepthTexture:(id)a3
{
  id v4 = (CaptureMTLTexture *)a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  id v5 = [(CaptureMTLTexture *)v4 baseObject];
  [(MTLFXTemporalScalerSPI *)self->_baseObject setDepthTexture:v5];

  captureDepthTexture = self->_captureDepthTexture;
  self->_captureDepthTexture = v4;
  id v7 = v4;

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -20471;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  uint64_t v13 = [(CaptureMTLFXTemporalScaler *)self traceStream];
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
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (MTLTexture)depthTexture
{
  return (MTLTexture *)self->_captureDepthTexture;
}

- (void)setColorTexture:(id)a3
{
  id v4 = (CaptureMTLTexture *)a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  id v5 = [(CaptureMTLTexture *)v4 baseObject];
  [(MTLFXTemporalScalerSPI *)self->_baseObject setColorTexture:v5];

  captureColorTexture = self->_captureColorTexture;
  self->_captureColorTexture = v4;
  id v7 = v4;

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -20473;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  uint64_t v13 = [(CaptureMTLFXTemporalScaler *)self traceStream];
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
  *(void *)uint64_t v10 = var0;
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
  [(MTLFXTemporalScalerSPI *)self->_baseObject setFence:v5];

  captureFence = self->_captureFence;
  self->_captureFence = v4;
  id v7 = v4;

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -20469;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  uint64_t v13 = [(CaptureMTLFXTemporalScaler *)self traceStream];
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
  *(void *)uint64_t v10 = var0;
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

- (MTLFXTemporalScaler)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLFXTemporalScaler)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLFXTemporalScaler;
  char v9 = [(CaptureMTLFXTemporalScaler *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    uint64_t v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);
  }
  return v10;
}

@end