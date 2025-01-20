@interface CaptureMTLTextureLayout
- ($71D83D51AB0F57F7CF166351F850C832)watermark;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)copyGranularity;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLTextureLayout)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLTextureLayout)baseObject;
- (NSString)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)alignment;
- (unint64_t)size;
- (unint64_t)streamReference;
- (void)copyFromLinearBytes:(const void *)a3 linearOffset:(unint64_t)a4 linearBytesPerRow:(unint64_t)a5 linearBytesPerImage:(unint64_t)a6 toTextureMemory:(void *)a7 textureSlice:(unint64_t)a8 textureLevel:(unint64_t)a9 textureRegion:(id *)a10;
- (void)copyFromTextureMemory:(const void *)a3 textureSlice:(unint64_t)a4 textureLevel:(unint64_t)a5 textureRegion:(id *)a6 toLinearBytes:(void *)a7 linearOffset:(unint64_t)a8 linearBytesPerRow:(unint64_t)a9 linearBytesPerImage:(unint64_t)a10;
- (void)dealloc;
- (void)finalizeTextureMemory:(void *)a3;
- (void)initializeTextureMemory:(void *)a3;
- (void)touch;
@end

@implementation CaptureMTLTextureLayout

- (void).cxx_destruct
{
}

- (void)initializeTextureMemory:(void *)a3
{
}

- (void)finalizeTextureMemory:(void *)a3
{
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16097;
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
  v8 = [(CaptureMTLTextureLayout *)self traceStream];
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
  v12.super_class = (Class)CaptureMTLTextureLayout;
  [(CaptureMTLTextureLayout *)&v12 dealloc];
}

- (void)copyFromTextureMemory:(const void *)a3 textureSlice:(unint64_t)a4 textureLevel:(unint64_t)a5 textureRegion:(id *)a6 toLinearBytes:(void *)a7 linearOffset:(unint64_t)a8 linearBytesPerRow:(unint64_t)a9 linearBytesPerImage:(unint64_t)a10
{
  baseObject = self->_baseObject;
  long long v11 = *(_OWORD *)&a6->var0.var2;
  v12[0] = *(_OWORD *)&a6->var0.var0;
  v12[1] = v11;
  v12[2] = *(_OWORD *)&a6->var1.var1;
  [(MTLTextureLayout *)baseObject copyFromTextureMemory:a3 textureSlice:a4 textureLevel:a5 textureRegion:v12 toLinearBytes:a7 linearOffset:a8 linearBytesPerRow:a9 linearBytesPerImage:a10];
}

- (void)copyFromLinearBytes:(const void *)a3 linearOffset:(unint64_t)a4 linearBytesPerRow:(unint64_t)a5 linearBytesPerImage:(unint64_t)a6 toTextureMemory:(void *)a7 textureSlice:(unint64_t)a8 textureLevel:(unint64_t)a9 textureRegion:(id *)a10
{
  baseObject = self->_baseObject;
  long long v11 = *(_OWORD *)&a10->var0.var2;
  v12[0] = *(_OWORD *)&a10->var0.var0;
  v12[1] = v11;
  v12[2] = *(_OWORD *)&a10->var1.var1;
  [(MTLTextureLayout *)baseObject copyFromLinearBytes:a3 linearOffset:a4 linearBytesPerRow:a5 linearBytesPerImage:a6 toTextureMemory:a7 textureSlice:a8 textureLevel:a9 textureRegion:v12];
}

- ($71D83D51AB0F57F7CF166351F850C832)watermark
{
  id v2 = [(MTLTextureLayout *)self->_baseObject watermark];
  result.var0[1] = v3;
  result.var0[0] = (unint64_t)v2;
  return result;
}

- (unint64_t)size
{
  return (unint64_t)[(MTLTextureLayout *)self->_baseObject size];
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)copyGranularity
{
  $71D83D51AB0F57F7CF166351F850C832 result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)self->_baseObject;
  if (result) {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[($F99D9A4FB75BC57F3386B8DC8EE08D7A *)result copyGranularity];
  }
  retstr->unint64_t var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return result;
}

- (unint64_t)alignment
{
  return (unint64_t)[(MTLTextureLayout *)self->_baseObject alignment];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLTextureLayout *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLTextureLayout;
  unint64_t v3 = [(CaptureMTLTextureLayout *)&v7 description];
  char v4 = [(MTLTextureLayout *)self->_baseObject description];
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

- (MTLTextureLayout)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLTextureLayout)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLTextureLayout;
  v8 = [(CaptureMTLTextureLayout *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_baseObject, a3);
    v9->_traceContext = a4;
    uint64_t v10 = DEVICEOBJECT(v7);
    v9->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)a4, (unint64_t)v10, (unint64_t)v9);
  }
  return v9;
}

@end