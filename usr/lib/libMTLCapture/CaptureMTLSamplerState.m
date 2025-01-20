@interface CaptureMTLSamplerState
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLSamplerState)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLResourceID)gpuResourceID;
- (MTLSamplerState)baseObject;
- (NSString)description;
- (NSString)label;
- (id)_quicklookData;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)gpuAddress;
- (unint64_t)gpuHandle;
- (unint64_t)pixelFormat;
- (unint64_t)resourceIndex;
- (unint64_t)streamReference;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
- (void)touch;
@end

@implementation CaptureMTLSamplerState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (id)_quicklookData
{
  return GTMTLQL_EncodeSamplerState((uint64_t)self->_traceContext, self);
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16241;
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
  v8 = [(CaptureMTLSamplerState *)self traceStream];
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
  v12.super_class = (Class)CaptureMTLSamplerState;
  [(CaptureMTLSamplerState *)&v12 dealloc];
}

- (unint64_t)uniqueIdentifier
{
  return (unint64_t)[(MTLSamplerStateSPI *)self->_baseObject uniqueIdentifier];
}

- (unint64_t)resourceIndex
{
  return (unint64_t)[(MTLSamplerStateSPI *)self->_baseObject resourceIndex];
}

- (unint64_t)pixelFormat
{
  return (unint64_t)[(MTLSamplerStateSPI *)self->_baseObject pixelFormat];
}

- (NSString)label
{
  return (NSString *)[(MTLSamplerStateSPI *)self->_baseObject label];
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)[(MTLSamplerStateSPI *)self->_baseObject gpuResourceID];
}

- (unint64_t)gpuHandle
{
  return (unint64_t)[(MTLSamplerStateSPI *)self->_baseObject gpuHandle];
}

- (unint64_t)gpuAddress
{
  return (unint64_t)[(MTLSamplerStateSPI *)self->_baseObject gpuAddress];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLSamplerStateSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLSamplerState;
  uint64_t v3 = [(CaptureMTLSamplerState *)&v7 description];
  char v4 = [(MTLSamplerStateSPI *)self->_baseObject description];
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

- (MTLSamplerState)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLSamplerState)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLSamplerState;
  v9 = [(CaptureMTLSamplerState *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    objc_super v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);
  }
  return v10;
}

@end