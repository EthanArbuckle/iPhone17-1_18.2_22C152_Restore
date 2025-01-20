@interface CaptureMTLRasterizationRateMap
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)parameterBufferSizeAndAlign;
- ($94F468A8D4C62B317260615823C2B210)mapPhysicalToScreenCoordinates:(id)a3 forLayer:(unint64_t)a4;
- ($94F468A8D4C62B317260615823C2B210)mapScreenToPhysicalCoordinates:(id)a3 forLayer:(unint64_t)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalGranularity;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalSizeForLayer:(SEL)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)screenSize;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLRasterizationRateMap)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLRasterizationRateMap)baseObject;
- (NSString)description;
- (NSString)label;
- (float)minFactor;
- (id)formattedDescription:(unint64_t)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)layerCount;
- (unint64_t)mutability;
- (unint64_t)streamReference;
- (void)copyParameterDataToBuffer:(id)a3 offset:(unint64_t)a4;
- (void)dealloc;
- (void)resetUsingDescriptor:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLRasterizationRateMap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)resetUsingDescriptor:(id)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v16);
  -[MTLRasterizationRateMapSPI resetUsingDescriptor:](self->_baseObject, "resetUsingDescriptor:", v5, (void)v16);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15411;
  char v7 = BYTE9(v18);
  if (BYTE9(v18) > 0x30uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v10 = BYTE10(v18);
    ++BYTE10(v18);
    v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v17 + 1), v10 | 0x1000000000) + 16;
    char v7 = v10;
  }
  else
  {
    v8 = (char *)(v6 + BYTE9(v18));
    BYTE9(v18) += 16;
  }
  *(unsigned char *)(v6 + 13) = v7;
  v11 = [(CaptureMTLRasterizationRateMap *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v13 = SaveMTLRasterizationRateMapDescriptor((uint64_t)&v16, v5);

  *(void *)v8 = var0;
  v8[8] = v13;
  *(_DWORD *)(v8 + 9) = 0;
  *((_DWORD *)v8 + 3) = 0;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (id)formattedDescription:(unint64_t)a3
{
  return [(MTLRasterizationRateMapSPI *)self->_baseObject formattedDescription:a3];
}

- (unint64_t)mutability
{
  return (unint64_t)[(MTLRasterizationRateMapSPI *)self->_baseObject mutability];
}

- (float)minFactor
{
  [(MTLRasterizationRateMapSPI *)self->_baseObject minFactor];
  return result;
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLRasterizationRateMapSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLRasterizationRateMap;
  v3 = [(CaptureMTLRasterizationRateMap *)&v7 description];
  v4 = [(MTLRasterizationRateMapSPI *)self->_baseObject description];
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

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalSizeForLayer:(SEL)a3
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
  retstr->unint64_t var0 = 0;
  retstr->var1 = 0;
  retstr->unint64_t var2 = 0;
  baseObject = self->_baseObject;
  if (baseObject) {
    [(MTLRasterizationRateMapSPI *)baseObject physicalSizeForLayer:a4];
  }
  uint64_t v8 = v19;
  *(_DWORD *)(v19 + 8) = -15797;
  char v9 = BYTE9(v20);
  if (BYTE9(v20) > 0x18uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 24);
    uint64_t v12 = BYTE10(v20);
    ++BYTE10(v20);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v19 + 1), v12 | 0x2800000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v20));
    BYTE9(v20) += 40;
  }
  *(unsigned char *)(v8 + 13) = v9;
  char v13 = [(CaptureMTLRasterizationRateMap *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t var2 = retstr->var2;
  *(void *)uint64_t v10 = var0;
  *(_OWORD *)(v10 + 8) = *(_OWORD *)&retstr->var0;
  *((void *)v10 + 3) = var2;
  *((void *)v10 + 4) = a4;
  s();
  result->unint64_t var0 = v17;
  LOBYTE(result->var1) = BYTE8(v20);
  *(unsigned char *)(v19 + 15) |= 8u;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)mapScreenToPhysicalCoordinates:(id)a3 forLayer:(unint64_t)a4
{
  float var1 = a3.var1;
  float var0 = a3.var0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v25);
  *(float *)&double v8 = var0;
  *(float *)&double v9 = var1;
  -[MTLRasterizationRateMapSPI mapScreenToPhysicalCoordinates:forLayer:](self->_baseObject, "mapScreenToPhysicalCoordinates:forLayer:", a4, v8, v9);
  float v11 = v10;
  float v13 = v12;
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15770;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x20uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    long long v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2000000000) + 16;
    char v15 = v18;
  }
  else
  {
    long long v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 32;
  }
  *(unsigned char *)(v14 + 13) = v15;
  long long v19 = [(CaptureMTLRasterizationRateMap *)self traceStream];
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0;
  }
  *(void *)long long v16 = v20;
  *((void *)v16 + 1) = a4;
  *((float *)v16 + 4) = v11;
  *((float *)v16 + 5) = v13;
  *((float *)v16 + 6) = var0;
  *((float *)v16 + 7) = var1;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;
  float v23 = v11;
  float v24 = v13;
  result.float var1 = v24;
  result.float var0 = v23;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)mapPhysicalToScreenCoordinates:(id)a3 forLayer:(unint64_t)a4
{
  -[MTLRasterizationRateMapSPI mapPhysicalToScreenCoordinates:forLayer:](self->_baseObject, "mapPhysicalToScreenCoordinates:forLayer:", a4, *(double *)&a3, *(double *)&a3.var1);
  result.float var1 = v5;
  result.float var0 = v4;
  return result;
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -15801;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    float v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    float v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  double v8 = [(CaptureMTLRasterizationRateMap *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)float v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLRasterizationRateMap;
  [(CaptureMTLRasterizationRateMap *)&v12 dealloc];
}

- (void)copyParameterDataToBuffer:(id)a3 offset:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (unint64_t *)[v6 traceStream];
  if (v7)
  {
    unint64_t v8 = atomic_load(v7 + 7);
    unint64_t v9 = v8;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)v7 + 7, &v9, v8 | 2);
      BOOL v10 = v9 == v8;
      unint64_t v8 = v9;
    }
    while (!v10);
  }
  uint64_t v11 = (unint64_t *)[v6 traceStream];
  if (v11)
  {
    unint64_t v12 = atomic_load(v11 + 7);
    unint64_t v13 = v12;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)v11 + 7, &v13, v12 | 8);
      BOOL v10 = v13 == v12;
      unint64_t v12 = v13;
    }
    while (!v10);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  long long v15 = [v6 baseObject];
  [(MTLRasterizationRateMapSPI *)baseObject copyParameterDataToBuffer:v15 offset:a4];

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15776;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x28uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x1800000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 24;
  }
  *(unsigned char *)(v16 + 13) = v17;
  uint64_t v21 = [(CaptureMTLRasterizationRateMap *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  float v23 = (uint64_t *)[v6 traceStream];

  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0;
  }
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)screenSize
{
  $94F468A8D4C62B317260615823C2B210 result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)self->_baseObject;
  if (result) {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[($F99D9A4FB75BC57F3386B8DC8EE08D7A *)result screenSize];
  }
  retstr->unint64_t var0 = 0;
  retstr->float var1 = 0;
  retstr->unint64_t var2 = 0;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalGranularity
{
  $94F468A8D4C62B317260615823C2B210 result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)self->_baseObject;
  if (result) {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[($F99D9A4FB75BC57F3386B8DC8EE08D7A *)result physicalGranularity];
  }
  retstr->unint64_t var0 = 0;
  retstr->float var1 = 0;
  retstr->unint64_t var2 = 0;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)parameterBufferSizeAndAlign
{
  id v2 = [(MTLRasterizationRateMapSPI *)self->_baseObject parameterBufferSizeAndAlign];
  result.float var1 = v3;
  result.unint64_t var0 = (unint64_t)v2;
  return result;
}

- (unint64_t)layerCount
{
  return (unint64_t)[(MTLRasterizationRateMapSPI *)self->_baseObject layerCount];
}

- (NSString)label
{
  return (NSString *)[(MTLRasterizationRateMapSPI *)self->_baseObject label];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (MTLRasterizationRateMap)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLRasterizationRateMap)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLRasterizationRateMap;
  unint64_t v9 = [(CaptureMTLRasterizationRateMap *)&v14 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    unint64_t v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);
  }
  return v10;
}

@end