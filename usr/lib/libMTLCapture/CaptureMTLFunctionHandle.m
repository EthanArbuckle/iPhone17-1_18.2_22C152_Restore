@interface CaptureMTLFunctionHandle
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLFunctionHandle)initWithBaseObject:(id)a3 captureComputePipelineState:(id)a4 captureFunction:(id)a5;
- (CaptureMTLFunctionHandle)initWithBaseObject:(id)a3 captureRenderPipelineState:(id)a4 captureFunction:(id)a5;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLFunctionHandle)baseObject;
- (NSString)description;
- (NSString)name;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)functionType;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)touch;
@end

@implementation CaptureMTLFunctionHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureFunction, 0);
  objc_storeStrong((id *)&self->_renderPipelineState, 0);
  objc_storeStrong((id *)&self->_computePipelineState, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -15610;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  v8 = [(CaptureMTLFunctionHandle *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLFunctionHandle;
  [(CaptureMTLFunctionHandle *)&v12 dealloc];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLFunctionHandleSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLFunctionHandle;
  uint64_t v3 = [(CaptureMTLFunctionHandle *)&v7 description];
  char v4 = [(MTLFunctionHandleSPI *)self->_baseObject description];
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

- (NSString)name
{
  return (NSString *)[(MTLFunctionHandleSPI *)self->_baseObject name];
}

- (unint64_t)functionType
{
  return (unint64_t)[(MTLFunctionHandleSPI *)self->_baseObject functionType];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (MTLFunctionHandle)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLFunctionHandle)initWithBaseObject:(id)a3 captureRenderPipelineState:(id)a4 captureFunction:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CaptureMTLFunctionHandle;
  objc_super v12 = [(CaptureMTLFunctionHandle *)&v19 init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseObject, a3);
    objc_storeStrong((id *)&v13->_renderPipelineState, a4);
    uint64_t v14 = [(CaptureMTLRenderPipelineState *)v13->_renderPipelineState device];
    captureDevice = v13->_captureDevice;
    v13->_captureDevice = (CaptureMTLDevice *)v14;

    objc_storeStrong((id *)&v13->_captureFunction, a5);
    v16 = [(CaptureMTLRenderPipelineState *)v13->_renderPipelineState traceContext];
    v13->_traceContext = v16;
    v17 = DEVICEOBJECT(v9);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v16, (unint64_t)v17, (unint64_t)v13);
  }
  return v13;
}

- (CaptureMTLFunctionHandle)initWithBaseObject:(id)a3 captureComputePipelineState:(id)a4 captureFunction:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CaptureMTLFunctionHandle;
  objc_super v12 = [(CaptureMTLFunctionHandle *)&v19 init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseObject, a3);
    objc_storeStrong((id *)&v13->_computePipelineState, a4);
    uint64_t v14 = [(CaptureMTLComputePipelineState *)v13->_computePipelineState device];
    captureDevice = v13->_captureDevice;
    v13->_captureDevice = (CaptureMTLDevice *)v14;

    objc_storeStrong((id *)&v13->_captureFunction, a5);
    v16 = [(CaptureMTLComputePipelineState *)v13->_computePipelineState traceContext];
    v13->_traceContext = v16;
    v17 = DEVICEOBJECT(v9);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v16, (unint64_t)v17, (unint64_t)v13);
  }
  return v13;
}

@end