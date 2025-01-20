@interface CaptureMTLArgumentEncoder
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLArgumentEncoder)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLArgumentEncoder)baseObject;
- (MTLDevice)device;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3;
- (id)originalObject;
- (unint64_t)alignment;
- (unint64_t)encodedLength;
- (unint64_t)streamReference;
- (void)constantDataAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4;
- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4;
- (void)setArgumentBuffer:(id)a3 startOffset:(unint64_t)a4 arrayElement:(unint64_t)a5;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4;
- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4;
- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4;
- (void)setIntersectionFunctionTable:(id)a3 atIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withRange:(_NSRange)a4;
- (void)setLabel:(id)a3;
- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4;
- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVisibleFunctionTable:(id)a3 atIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withRange:(_NSRange)a4;
- (void)touch;
@end

@implementation CaptureMTLArgumentEncoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)setVisibleFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
    v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v33);
    baseObject = self->_baseObject;
    uint64_t v10 = 8 * length;
    __chkstk_darwin(v8, v11);
    bzero((char *)&v33 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
    if (length)
    {
      v12 = a3;
      v13 = (void *)((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
      NSUInteger v14 = length;
      do
      {
        v15 = (void *)*v12++;
        *v13++ = [v15 baseObject];
        --v14;
      }
      while (v14);
    }
    -[MTLArgumentEncoder setVisibleFunctionTables:withRange:](baseObject, "setVisibleFunctionTables:withRange:", (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
    uint64_t v16 = v34;
    *(_DWORD *)(v34 + 8) = -15536;
    char v17 = BYTE9(v35);
    if (BYTE9(v35) > 0x20uLL)
    {
      uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 24);
      uint64_t v26 = BYTE10(v35);
      ++BYTE10(v35);
      v18 = GTTraceMemPool_allocateBytes(v25, *((uint64_t *)&v34 + 1), v26 | 0x2000000000) + 16;
      char v17 = v26;
    }
    else
    {
      v18 = (char *)(v16 + BYTE9(v35));
      BYTE9(v35) += 32;
    }
    *(unsigned char *)(v16 + 13) = v17;
    v27 = [(CaptureMTLArgumentEncoder *)self traceStream];
    if (v27) {
      unint64_t var0 = v27->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    __chkstk_darwin(v27, v28);
    bzero((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
    char v30 = StreamArray((uint64_t)&v33, (long long *)((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
    *(void *)v18 = var0;
    *((void *)v18 + 1) = location;
    *((void *)v18 + 2) = length;
    v18[24] = v30;
    *(_DWORD *)(v18 + 25) = 0;
    *((_DWORD *)v18 + 7) = 0;
    s();
    *(void *)uint64_t v31 = v32;
    *(unsigned char *)(v31 + 8) = BYTE8(v35);
    *(unsigned char *)(v34 + 15) |= 8u;
  }
  else
  {
    v19 = self->_baseObject;
    __chkstk_darwin(self, 8 * a4.length);
    v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v21, v20);
    if (length)
    {
      v22 = v21;
      NSUInteger v23 = length;
      do
      {
        v24 = (void *)*a3++;
        *(void *)v22 = [v24 baseObject];
        v22 += 8;
        --v23;
      }
      while (v23);
    }
    -[MTLArgumentEncoder setVisibleFunctionTables:withRange:](v19, "setVisibleFunctionTables:withRange:", v21, location, length);
  }
}

- (void)setVisibleFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
    baseObject = self->_baseObject;
    v9 = [v7 baseObject];
    [(MTLArgumentEncoder *)baseObject setVisibleFunctionTable:v9 atIndex:a4];

    uint64_t v10 = v24;
    *(_DWORD *)(v24 + 8) = -15537;
    char v11 = BYTE9(v25);
    if (BYTE9(v25) > 0x28uLL)
    {
      uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
      uint64_t v16 = BYTE10(v25);
      ++BYTE10(v25);
      v12 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x1800000000) + 16;
      char v11 = v16;
    }
    else
    {
      v12 = (char *)(v10 + BYTE9(v25));
      BYTE9(v25) += 24;
    }
    *(unsigned char *)(v10 + 13) = v11;
    char v17 = [(CaptureMTLArgumentEncoder *)self traceStream];
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    v19 = (uint64_t *)[v7 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0;
    }
    *(void *)v12 = var0;
    *((void *)v12 + 1) = v20;
    *((void *)v12 + 2) = a4;
    s();
    *(void *)uint64_t v21 = v22;
    *(unsigned char *)(v21 + 8) = BYTE8(v25);
    *(unsigned char *)(v24 + 15) |= 8u;
  }
  else
  {
    v13 = self->_baseObject;
    NSUInteger v14 = [v6 baseObject];
    [(MTLArgumentEncoder *)v13 setVisibleFunctionTable:v14 atIndex:a4];
  }
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
    v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v33);
    baseObject = self->_baseObject;
    uint64_t v10 = 8 * length;
    __chkstk_darwin(v8, v11);
    bzero((char *)&v33 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
    if (length)
    {
      v12 = a3;
      v13 = (void *)((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
      NSUInteger v14 = length;
      do
      {
        uint64_t v15 = (void *)*v12++;
        *v13++ = [v15 baseObject];
        --v14;
      }
      while (v14);
    }
    -[MTLArgumentEncoder setTextures:withRange:](baseObject, "setTextures:withRange:", (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
    uint64_t v16 = v34;
    *(_DWORD *)(v34 + 8) = -16057;
    char v17 = BYTE9(v35);
    if (BYTE9(v35) > 0x20uLL)
    {
      uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 24);
      uint64_t v26 = BYTE10(v35);
      ++BYTE10(v35);
      v18 = GTTraceMemPool_allocateBytes(v25, *((uint64_t *)&v34 + 1), v26 | 0x2000000000) + 16;
      char v17 = v26;
    }
    else
    {
      v18 = (char *)(v16 + BYTE9(v35));
      BYTE9(v35) += 32;
    }
    *(unsigned char *)(v16 + 13) = v17;
    v27 = [(CaptureMTLArgumentEncoder *)self traceStream];
    if (v27) {
      unint64_t var0 = v27->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    __chkstk_darwin(v27, v28);
    bzero((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
    char v30 = StreamArray((uint64_t)&v33, (long long *)((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
    *(void *)v18 = var0;
    *((void *)v18 + 1) = location;
    *((void *)v18 + 2) = length;
    v18[24] = v30;
    *(_DWORD *)(v18 + 25) = 0;
    *((_DWORD *)v18 + 7) = 0;
    s();
    *(void *)uint64_t v31 = v32;
    *(unsigned char *)(v31 + 8) = BYTE8(v35);
    *(unsigned char *)(v34 + 15) |= 8u;
  }
  else
  {
    v19 = self->_baseObject;
    __chkstk_darwin(self, 8 * a4.length);
    uint64_t v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v21, v20);
    if (length)
    {
      uint64_t v22 = v21;
      NSUInteger v23 = length;
      do
      {
        long long v24 = (void *)*a3++;
        *(void *)uint64_t v22 = [v24 baseObject];
        v22 += 8;
        --v23;
      }
      while (v23);
    }
    -[MTLArgumentEncoder setTextures:withRange:](v19, "setTextures:withRange:", v21, location, length);
  }
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
    baseObject = self->_baseObject;
    v9 = [v7 baseObject];
    [(MTLArgumentEncoder *)baseObject setTexture:v9 atIndex:a4];

    uint64_t v10 = v24;
    *(_DWORD *)(v24 + 8) = -16058;
    char v11 = BYTE9(v25);
    if (BYTE9(v25) > 0x28uLL)
    {
      uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
      uint64_t v16 = BYTE10(v25);
      ++BYTE10(v25);
      v12 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x1800000000) + 16;
      char v11 = v16;
    }
    else
    {
      v12 = (char *)(v10 + BYTE9(v25));
      BYTE9(v25) += 24;
    }
    *(unsigned char *)(v10 + 13) = v11;
    char v17 = [(CaptureMTLArgumentEncoder *)self traceStream];
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    v19 = (uint64_t *)[v7 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0;
    }
    *(void *)v12 = var0;
    *((void *)v12 + 1) = v20;
    *((void *)v12 + 2) = a4;
    s();
    *(void *)uint64_t v21 = v22;
    *(unsigned char *)(v21 + 8) = BYTE8(v25);
    *(unsigned char *)(v24 + 15) |= 8u;
  }
  else
  {
    v13 = self->_baseObject;
    NSUInteger v14 = [v6 baseObject];
    [(MTLArgumentEncoder *)v13 setTexture:v14 atIndex:a4];
  }
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
    v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v33);
    baseObject = self->_baseObject;
    uint64_t v10 = 8 * length;
    __chkstk_darwin(v8, v11);
    bzero((char *)&v33 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
    if (length)
    {
      v12 = a3;
      v13 = (void *)((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
      NSUInteger v14 = length;
      do
      {
        uint64_t v15 = (void *)*v12++;
        *v13++ = [v15 baseObject];
        --v14;
      }
      while (v14);
    }
    -[MTLArgumentEncoder setSamplerStates:withRange:](baseObject, "setSamplerStates:withRange:", (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
    uint64_t v16 = v34;
    *(_DWORD *)(v34 + 8) = -16055;
    char v17 = BYTE9(v35);
    if (BYTE9(v35) > 0x20uLL)
    {
      uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 24);
      uint64_t v26 = BYTE10(v35);
      ++BYTE10(v35);
      v18 = GTTraceMemPool_allocateBytes(v25, *((uint64_t *)&v34 + 1), v26 | 0x2000000000) + 16;
      char v17 = v26;
    }
    else
    {
      v18 = (char *)(v16 + BYTE9(v35));
      BYTE9(v35) += 32;
    }
    *(unsigned char *)(v16 + 13) = v17;
    v27 = [(CaptureMTLArgumentEncoder *)self traceStream];
    if (v27) {
      unint64_t var0 = v27->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    __chkstk_darwin(v27, v28);
    bzero((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
    char v30 = StreamArray((uint64_t)&v33, (long long *)((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
    *(void *)v18 = var0;
    *((void *)v18 + 1) = location;
    *((void *)v18 + 2) = length;
    v18[24] = v30;
    *(_DWORD *)(v18 + 25) = 0;
    *((_DWORD *)v18 + 7) = 0;
    s();
    *(void *)uint64_t v31 = v32;
    *(unsigned char *)(v31 + 8) = BYTE8(v35);
    *(unsigned char *)(v34 + 15) |= 8u;
  }
  else
  {
    v19 = self->_baseObject;
    __chkstk_darwin(self, 8 * a4.length);
    uint64_t v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v21, v20);
    if (length)
    {
      uint64_t v22 = v21;
      NSUInteger v23 = length;
      do
      {
        long long v24 = (void *)*a3++;
        *(void *)uint64_t v22 = [v24 baseObject];
        v22 += 8;
        --v23;
      }
      while (v23);
    }
    -[MTLArgumentEncoder setSamplerStates:withRange:](v19, "setSamplerStates:withRange:", v21, location, length);
  }
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
    baseObject = self->_baseObject;
    v9 = [v7 baseObject];
    [(MTLArgumentEncoder *)baseObject setSamplerState:v9 atIndex:a4];

    uint64_t v10 = v24;
    *(_DWORD *)(v24 + 8) = -16056;
    char v11 = BYTE9(v25);
    if (BYTE9(v25) > 0x28uLL)
    {
      uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
      uint64_t v16 = BYTE10(v25);
      ++BYTE10(v25);
      v12 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x1800000000) + 16;
      char v11 = v16;
    }
    else
    {
      v12 = (char *)(v10 + BYTE9(v25));
      BYTE9(v25) += 24;
    }
    *(unsigned char *)(v10 + 13) = v11;
    char v17 = [(CaptureMTLArgumentEncoder *)self traceStream];
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    v19 = (uint64_t *)[v7 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0;
    }
    *(void *)v12 = var0;
    *((void *)v12 + 1) = v20;
    *((void *)v12 + 2) = a4;
    s();
    *(void *)uint64_t v21 = v22;
    *(unsigned char *)(v21 + 8) = BYTE8(v25);
    *(unsigned char *)(v24 + 15) |= 8u;
  }
  else
  {
    v13 = self->_baseObject;
    NSUInteger v14 = [v6 baseObject];
    [(MTLArgumentEncoder *)v13 setSamplerState:v14 atIndex:a4];
  }
}

- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
    v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v33);
    baseObject = self->_baseObject;
    uint64_t v10 = 8 * length;
    __chkstk_darwin(v8, v11);
    bzero((char *)&v33 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
    if (length)
    {
      v12 = a3;
      v13 = (void *)((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
      NSUInteger v14 = length;
      do
      {
        uint64_t v15 = (void *)*v12++;
        *v13++ = [v15 baseObject];
        --v14;
      }
      while (v14);
    }
    -[MTLArgumentEncoder setRenderPipelineStates:withRange:](baseObject, "setRenderPipelineStates:withRange:", (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
    uint64_t v16 = v34;
    *(_DWORD *)(v34 + 8) = -16001;
    char v17 = BYTE9(v35);
    if (BYTE9(v35) > 0x20uLL)
    {
      uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 24);
      uint64_t v26 = BYTE10(v35);
      ++BYTE10(v35);
      v18 = GTTraceMemPool_allocateBytes(v25, *((uint64_t *)&v34 + 1), v26 | 0x2000000000) + 16;
      char v17 = v26;
    }
    else
    {
      v18 = (char *)(v16 + BYTE9(v35));
      BYTE9(v35) += 32;
    }
    *(unsigned char *)(v16 + 13) = v17;
    v27 = [(CaptureMTLArgumentEncoder *)self traceStream];
    if (v27) {
      unint64_t var0 = v27->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    __chkstk_darwin(v27, v28);
    bzero((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
    char v30 = StreamArray((uint64_t)&v33, (long long *)((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
    *(void *)v18 = var0;
    *((void *)v18 + 1) = location;
    *((void *)v18 + 2) = length;
    v18[24] = v30;
    *(_DWORD *)(v18 + 25) = 0;
    *((_DWORD *)v18 + 7) = 0;
    s();
    *(void *)uint64_t v31 = v32;
    *(unsigned char *)(v31 + 8) = BYTE8(v35);
    *(unsigned char *)(v34 + 15) |= 8u;
  }
  else
  {
    v19 = self->_baseObject;
    __chkstk_darwin(self, 8 * a4.length);
    uint64_t v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v21, v20);
    if (length)
    {
      uint64_t v22 = v21;
      NSUInteger v23 = length;
      do
      {
        long long v24 = (void *)*a3++;
        *(void *)uint64_t v22 = [v24 baseObject];
        v22 += 8;
        --v23;
      }
      while (v23);
    }
    -[MTLArgumentEncoder setRenderPipelineStates:withRange:](v19, "setRenderPipelineStates:withRange:", v21, location, length);
  }
}

- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
    baseObject = self->_baseObject;
    v9 = [v7 baseObject];
    [(MTLArgumentEncoder *)baseObject setRenderPipelineState:v9 atIndex:a4];

    uint64_t v10 = v24;
    *(_DWORD *)(v24 + 8) = -16002;
    char v11 = BYTE9(v25);
    if (BYTE9(v25) > 0x28uLL)
    {
      uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
      uint64_t v16 = BYTE10(v25);
      ++BYTE10(v25);
      v12 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x1800000000) + 16;
      char v11 = v16;
    }
    else
    {
      v12 = (char *)(v10 + BYTE9(v25));
      BYTE9(v25) += 24;
    }
    *(unsigned char *)(v10 + 13) = v11;
    char v17 = [(CaptureMTLArgumentEncoder *)self traceStream];
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    v19 = (uint64_t *)[v7 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0;
    }
    *(void *)v12 = var0;
    *((void *)v12 + 1) = v20;
    *((void *)v12 + 2) = a4;
    s();
    *(void *)uint64_t v21 = v22;
    *(unsigned char *)(v21 + 8) = BYTE8(v25);
    *(unsigned char *)(v24 + 15) |= 8u;
  }
  else
  {
    v13 = self->_baseObject;
    NSUInteger v14 = [v6 baseObject];
    [(MTLArgumentEncoder *)v13 setRenderPipelineState:v14 atIndex:a4];
  }
}

- (void)setIntersectionFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
    v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v33);
    baseObject = self->_baseObject;
    uint64_t v10 = 8 * length;
    __chkstk_darwin(v8, v11);
    bzero((char *)&v33 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
    if (length)
    {
      v12 = a3;
      v13 = (void *)((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
      NSUInteger v14 = length;
      do
      {
        uint64_t v15 = (void *)*v12++;
        *v13++ = [v15 baseObject];
        --v14;
      }
      while (v14);
    }
    -[MTLArgumentEncoder setIntersectionFunctionTables:withRange:](baseObject, "setIntersectionFunctionTables:withRange:", (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
    uint64_t v16 = v34;
    *(_DWORD *)(v34 + 8) = -15538;
    char v17 = BYTE9(v35);
    if (BYTE9(v35) > 0x20uLL)
    {
      uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 24);
      uint64_t v26 = BYTE10(v35);
      ++BYTE10(v35);
      v18 = GTTraceMemPool_allocateBytes(v25, *((uint64_t *)&v34 + 1), v26 | 0x2000000000) + 16;
      char v17 = v26;
    }
    else
    {
      v18 = (char *)(v16 + BYTE9(v35));
      BYTE9(v35) += 32;
    }
    *(unsigned char *)(v16 + 13) = v17;
    v27 = [(CaptureMTLArgumentEncoder *)self traceStream];
    if (v27) {
      unint64_t var0 = v27->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    __chkstk_darwin(v27, v28);
    bzero((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
    char v30 = StreamArray((uint64_t)&v33, (long long *)((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
    *(void *)v18 = var0;
    *((void *)v18 + 1) = location;
    *((void *)v18 + 2) = length;
    v18[24] = v30;
    *(_DWORD *)(v18 + 25) = 0;
    *((_DWORD *)v18 + 7) = 0;
    s();
    *(void *)uint64_t v31 = v32;
    *(unsigned char *)(v31 + 8) = BYTE8(v35);
    *(unsigned char *)(v34 + 15) |= 8u;
  }
  else
  {
    v19 = self->_baseObject;
    __chkstk_darwin(self, 8 * a4.length);
    uint64_t v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v21, v20);
    if (length)
    {
      uint64_t v22 = v21;
      NSUInteger v23 = length;
      do
      {
        long long v24 = (void *)*a3++;
        *(void *)uint64_t v22 = [v24 baseObject];
        v22 += 8;
        --v23;
      }
      while (v23);
    }
    -[MTLArgumentEncoder setIntersectionFunctionTables:withRange:](v19, "setIntersectionFunctionTables:withRange:", v21, location, length);
  }
}

- (void)setIntersectionFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
    baseObject = self->_baseObject;
    v9 = [v7 baseObject];
    [(MTLArgumentEncoder *)baseObject setIntersectionFunctionTable:v9 atIndex:a4];

    uint64_t v10 = v24;
    *(_DWORD *)(v24 + 8) = -15539;
    char v11 = BYTE9(v25);
    if (BYTE9(v25) > 0x28uLL)
    {
      uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
      uint64_t v16 = BYTE10(v25);
      ++BYTE10(v25);
      v12 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x1800000000) + 16;
      char v11 = v16;
    }
    else
    {
      v12 = (char *)(v10 + BYTE9(v25));
      BYTE9(v25) += 24;
    }
    *(unsigned char *)(v10 + 13) = v11;
    char v17 = [(CaptureMTLArgumentEncoder *)self traceStream];
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    v19 = (uint64_t *)[v7 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0;
    }
    *(void *)v12 = var0;
    *((void *)v12 + 1) = v20;
    *((void *)v12 + 2) = a4;
    s();
    *(void *)uint64_t v21 = v22;
    *(unsigned char *)(v21 + 8) = BYTE8(v25);
    *(unsigned char *)(v24 + 15) |= 8u;
  }
  else
  {
    v13 = self->_baseObject;
    NSUInteger v14 = [v6 baseObject];
    [(MTLArgumentEncoder *)v13 setIntersectionFunctionTable:v14 atIndex:a4];
  }
}

- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
    v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v33);
    baseObject = self->_baseObject;
    uint64_t v10 = 8 * length;
    __chkstk_darwin(v8, v11);
    bzero((char *)&v33 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
    if (length)
    {
      v12 = a3;
      v13 = (void *)((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
      NSUInteger v14 = length;
      do
      {
        uint64_t v15 = (void *)*v12++;
        *v13++ = [v15 baseObject];
        --v14;
      }
      while (v14);
    }
    -[MTLArgumentEncoder setIndirectCommandBuffers:withRange:](baseObject, "setIndirectCommandBuffers:withRange:", (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
    uint64_t v16 = v34;
    *(_DWORD *)(v34 + 8) = -15915;
    char v17 = BYTE9(v35);
    if (BYTE9(v35) > 0x20uLL)
    {
      uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 24);
      uint64_t v26 = BYTE10(v35);
      ++BYTE10(v35);
      v18 = GTTraceMemPool_allocateBytes(v25, *((uint64_t *)&v34 + 1), v26 | 0x2000000000) + 16;
      char v17 = v26;
    }
    else
    {
      v18 = (char *)(v16 + BYTE9(v35));
      BYTE9(v35) += 32;
    }
    *(unsigned char *)(v16 + 13) = v17;
    v27 = [(CaptureMTLArgumentEncoder *)self traceStream];
    if (v27) {
      unint64_t var0 = v27->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    __chkstk_darwin(v27, v28);
    bzero((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
    char v30 = StreamArray((uint64_t)&v33, (long long *)((char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
    *(void *)v18 = var0;
    *((void *)v18 + 1) = location;
    *((void *)v18 + 2) = length;
    v18[24] = v30;
    *(_DWORD *)(v18 + 25) = 0;
    *((_DWORD *)v18 + 7) = 0;
    s();
    *(void *)uint64_t v31 = v32;
    *(unsigned char *)(v31 + 8) = BYTE8(v35);
    *(unsigned char *)(v34 + 15) |= 8u;
  }
  else
  {
    v19 = self->_baseObject;
    __chkstk_darwin(self, 8 * a4.length);
    uint64_t v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v21, v20);
    if (length)
    {
      uint64_t v22 = v21;
      NSUInteger v23 = length;
      do
      {
        long long v24 = (void *)*a3++;
        *(void *)uint64_t v22 = [v24 baseObject];
        v22 += 8;
        --v23;
      }
      while (v23);
    }
    -[MTLArgumentEncoder setIndirectCommandBuffers:withRange:](v19, "setIndirectCommandBuffers:withRange:", v21, location, length);
  }
}

- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
    baseObject = self->_baseObject;
    v9 = [v7 baseObject];
    [(MTLArgumentEncoder *)baseObject setIndirectCommandBuffer:v9 atIndex:a4];

    uint64_t v10 = v24;
    *(_DWORD *)(v24 + 8) = -15916;
    char v11 = BYTE9(v25);
    if (BYTE9(v25) > 0x28uLL)
    {
      uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
      uint64_t v16 = BYTE10(v25);
      ++BYTE10(v25);
      v12 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x1800000000) + 16;
      char v11 = v16;
    }
    else
    {
      v12 = (char *)(v10 + BYTE9(v25));
      BYTE9(v25) += 24;
    }
    *(unsigned char *)(v10 + 13) = v11;
    char v17 = [(CaptureMTLArgumentEncoder *)self traceStream];
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    v19 = (uint64_t *)[v7 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0;
    }
    *(void *)v12 = var0;
    *((void *)v12 + 1) = v20;
    *((void *)v12 + 2) = a4;
    s();
    *(void *)uint64_t v21 = v22;
    *(unsigned char *)(v21 + 8) = BYTE8(v25);
    *(unsigned char *)(v24 + 15) |= 8u;
  }
  else
  {
    v13 = self->_baseObject;
    NSUInteger v14 = [v6 baseObject];
    [(MTLArgumentEncoder *)v13 setIndirectCommandBuffer:v14 atIndex:a4];
  }
}

- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  baseObject = self->_baseObject;
  __chkstk_darwin(self, 8 * a4.length);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v9, v8);
  if (length)
  {
    uint64_t v10 = v9;
    NSUInteger v11 = length;
    do
    {
      v12 = (void *)*a3++;
      *(void *)uint64_t v10 = [v12 baseObject];
      v10 += 8;
      --v11;
    }
    while (v11);
  }
  -[MTLArgumentEncoder setComputePipelineStates:withRange:](baseObject, "setComputePipelineStates:withRange:", v9, location, length);
}

- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4
{
  baseObject = self->_baseObject;
  id v6 = [a3 baseObject];
  [(MTLArgumentEncoder *)baseObject setComputePipelineState:v6 atIndex:a4];
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    NSUInteger v38 = a5.location;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v39 = 0u;
    uint64_t v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v39);
    baseObject = self->_baseObject;
    uint64_t v12 = 8 * length;
    __chkstk_darwin(v10, v13);
    bzero((char *)&v37 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
    if (length)
    {
      NSUInteger v14 = a3;
      uint64_t v15 = (uint64_t *)((char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
      NSUInteger v16 = length;
      do
      {
        char v17 = (void *)*v14++;
        *v15++ = [v17 baseObject];
        --v16;
      }
      while (v16);
    }
    NSUInteger v18 = v38;
    -[MTLArgumentEncoder setBuffers:offsets:withRange:](baseObject, "setBuffers:offsets:withRange:", (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v38, length);
    uint64_t v19 = v40;
    *(_DWORD *)(v40 + 8) = -16059;
    char v20 = BYTE9(v41);
    if (BYTE9(v41) > 0x20uLL)
    {
      uint64_t v28 = *(void *)(*((void *)&v39 + 1) + 24);
      uint64_t v29 = BYTE10(v41);
      ++BYTE10(v41);
      uint64_t v21 = GTTraceMemPool_allocateBytes(v28, *((uint64_t *)&v40 + 1), v29 | 0x2000000000) + 16;
      char v20 = v29;
    }
    else
    {
      uint64_t v21 = (char *)(v19 + BYTE9(v41));
      BYTE9(v41) += 32;
    }
    *(unsigned char *)(v19 + 13) = v20;
    char v30 = [(CaptureMTLArgumentEncoder *)self traceStream];
    if (v30) {
      unint64_t var0 = v30->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    __chkstk_darwin(v30, v31);
    bzero((char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
    char v33 = StreamArray((uint64_t)&v39, (uint64_t *)((char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
    char v34 = GTTraceEncoder_storeBytes((uint64_t)&v39, (void *)a4, 8 * length);
    *(void *)uint64_t v21 = var0;
    *((void *)v21 + 1) = v18;
    *((void *)v21 + 2) = length;
    v21[24] = v33;
    v21[25] = v34;
    *(_DWORD *)(v21 + 26) = 0;
    *((_WORD *)v21 + 15) = 0;
    s();
    *(void *)uint64_t v35 = v36;
    *(unsigned char *)(v35 + 8) = BYTE8(v41);
    *(unsigned char *)(v40 + 15) |= 8u;
  }
  else
  {
    uint64_t v22 = self->_baseObject;
    __chkstk_darwin(self, 8 * a5.length);
    long long v24 = (char *)&v37 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v24, v23);
    if (length)
    {
      long long v25 = v24;
      NSUInteger v26 = length;
      do
      {
        v27 = (void *)*a3++;
        *(void *)long long v25 = [v27 baseObject];
        v25 += 8;
        --v26;
      }
      while (v26);
    }
    -[MTLArgumentEncoder setBuffers:offsets:withRange:](v22, "setBuffers:offsets:withRange:", v24, a4, location, length);
  }
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  v9 = v8;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v25);
    baseObject = self->_baseObject;
    NSUInteger v11 = [v9 baseObject];
    [(MTLArgumentEncoder *)baseObject setBuffer:v11 offset:a4 atIndex:a5];

    uint64_t v12 = v26;
    *(_DWORD *)(v26 + 8) = -16060;
    char v13 = BYTE9(v27);
    if (BYTE9(v27) > 0x20uLL)
    {
      uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
      uint64_t v18 = BYTE10(v27);
      ++BYTE10(v27);
      NSUInteger v14 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2000000000) + 16;
      char v13 = v18;
    }
    else
    {
      NSUInteger v14 = (char *)(v12 + BYTE9(v27));
      BYTE9(v27) += 32;
    }
    *(unsigned char *)(v12 + 13) = v13;
    uint64_t v19 = [(CaptureMTLArgumentEncoder *)self traceStream];
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    uint64_t v21 = (uint64_t *)[v9 traceStream];
    if (v21) {
      uint64_t v22 = *v21;
    }
    else {
      uint64_t v22 = 0;
    }
    *(void *)NSUInteger v14 = var0;
    *((void *)v14 + 1) = v22;
    *((void *)v14 + 2) = a4;
    *((void *)v14 + 3) = a5;
    s();
    *(void *)uint64_t v23 = v24;
    *(unsigned char *)(v23 + 8) = BYTE8(v27);
    *(unsigned char *)(v26 + 15) |= 8u;
  }
  else
  {
    uint64_t v15 = self->_baseObject;
    NSUInteger v16 = [v8 baseObject];
    [(MTLArgumentEncoder *)v15 setBuffer:v16 offset:a4 atIndex:a5];
  }
}

- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  traceContext = self->_traceContext;
  long long v24 = (unint64_t)traceContext;
  *(void *)&long long v25 = 0;
  *((void *)&v25 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v9;
  *(void *)&long long v26 = v8;
  BYTE8(v26) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v26 + 9) = 16400;
  *(_DWORD *)((char *)&v26 + 11) = 0;
  HIBYTE(v26) = 0;
  id v10 = -[MTLArgumentEncoder newArgumentEncoderForBufferAtIndex:](self->_baseObject, "newArgumentEncoderForBufferAtIndex:");
  if (v10)
  {
    NSUInteger v11 = [CaptureMTLArgumentEncoder alloc];
    uint64_t v12 = [(CaptureMTLArgumentEncoder *)self device];
    char v13 = [(CaptureMTLArgumentEncoder *)v11 initWithBaseObject:v10 captureDevice:v12];
  }
  else
  {
    char v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)[(CaptureMTLArgumentEncoder *)v13 traceStream]);
  uint64_t v14 = v25;
  *(_DWORD *)(v25 + 8) = -16053;
  char v15 = BYTE9(v26);
  if (BYTE9(v26) > 0x28uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v18 = BYTE10(v26);
    ++BYTE10(v26);
    NSUInteger v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v25 + 1), v18 | 0x1800000000) + 16;
    char v15 = v18;
  }
  else
  {
    NSUInteger v16 = (char *)(v14 + BYTE9(v26));
    BYTE9(v26) += 24;
  }
  *(unsigned char *)(v14 + 13) = v15;
  uint64_t v19 = [(CaptureMTLArgumentEncoder *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v21 = [(CaptureMTLArgumentEncoder *)v13 traceStream];
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0;
  }
  *(void *)NSUInteger v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a3;
  uint64_t *v7 = v26;
  *((unsigned char *)v7 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v13;
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16062;
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
  uint64_t v8 = [(CaptureMTLArgumentEncoder *)self traceStream];
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
  v12.super_class = (Class)CaptureMTLArgumentEncoder;
  [(CaptureMTLArgumentEncoder *)&v12 dealloc];
}

- (void)constantDataAtIndex:(unint64_t)a3
{
  return [(MTLArgumentEncoder *)self->_baseObject constantDataAtIndex:a3];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLArgumentEncoder *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16063;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLArgumentEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)&v19, v15, v16 + 1);
  }
  *(void *)uint64_t v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (NSString)label
{
  return (NSString *)[(MTLArgumentEncoder *)self->_baseObject label];
}

- (unint64_t)encodedLength
{
  return (unint64_t)[(MTLArgumentEncoder *)self->_baseObject encodedLength];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (unint64_t)alignment
{
  return (unint64_t)[(MTLArgumentEncoder *)self->_baseObject alignment];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLArgumentEncoder *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLArgumentEncoder;
  uint64_t v3 = [(CaptureMTLArgumentEncoder *)&v7 description];
  id v4 = [(MTLArgumentEncoder *)self->_baseObject description];
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

- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = [v6 device];
  unsigned __int8 v8 = [v7 captureRaytracingEnabled];

  if ((v8 & 1) == 0)
  {
    GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLArgumentEncoder_setAccelerationStructure_atIndex", (uint64_t)"Raytracing", 0, 0);
    goto LABEL_6;
  }
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) != 2)
  {
LABEL_6:
    baseObject = self->_baseObject;
    id v15 = [v6 baseObject];
    [(MTLArgumentEncoder *)baseObject setAccelerationStructure:v15 atIndex:a4];

    goto LABEL_15;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v24);
  uint64_t v9 = self->_baseObject;
  uint64_t v10 = [v6 baseObject];
  [(MTLArgumentEncoder *)v9 setAccelerationStructure:v10 atIndex:a4];

  uint64_t v11 = v25;
  *(_DWORD *)(v25 + 8) = -15627;
  char v12 = BYTE9(v26);
  if (BYTE9(v26) > 0x28uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v17 = BYTE10(v26);
    ++BYTE10(v26);
    id v13 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v25 + 1), v17 | 0x1800000000) + 16;
    char v12 = v17;
  }
  else
  {
    id v13 = (char *)(v11 + BYTE9(v26));
    BYTE9(v26) += 24;
  }
  *(unsigned char *)(v11 + 13) = v12;
  uint64_t v18 = [(CaptureMTLArgumentEncoder *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v20 = (uint64_t *)[v6 traceStream];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0;
  }
  *(void *)id v13 = var0;
  *((void *)v13 + 1) = v21;
  *((void *)v13 + 2) = a4;
  s();
  *(void *)uint64_t v22 = v23;
  *(unsigned char *)(v22 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;
LABEL_15:
}

- (void)setArgumentBuffer:(id)a3 startOffset:(unint64_t)a4 arrayElement:(unint64_t)a5
{
  id v8 = a3;
  id v9 = v8;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    uint64_t v10 = (unint64_t *)[v8 traceStream];
    if (v10)
    {
      unint64_t v11 = atomic_load(v10 + 7);
      unint64_t v12 = v11;
      do
      {
        atomic_compare_exchange_strong((atomic_ullong *volatile)v10 + 7, &v12, v11 | 2);
        BOOL v13 = v12 == v11;
        unint64_t v11 = v12;
      }
      while (!v13);
    }
    if (v9) {
      CaptureMTLBuffer_registerBaseBufferForTracing(*((void **)v9 + 1), *((void *)v9 + 6), 0);
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v29 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v29);
    baseObject = self->_baseObject;
    id v15 = [v9 baseObject];
    [(MTLArgumentEncoder *)baseObject setArgumentBuffer:v15 startOffset:a4 arrayElement:a5];

    uint64_t v16 = v30;
    *(_DWORD *)(v30 + 8) = -16033;
    char v17 = BYTE9(v31);
    if (BYTE9(v31) > 0x20uLL)
    {
      uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 24);
      uint64_t v22 = BYTE10(v31);
      ++BYTE10(v31);
      uint64_t v18 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v30 + 1), v22 | 0x2000000000) + 16;
      char v17 = v22;
    }
    else
    {
      uint64_t v18 = (char *)(v16 + BYTE9(v31));
      BYTE9(v31) += 32;
    }
    *(unsigned char *)(v16 + 13) = v17;
    uint64_t v23 = [(CaptureMTLArgumentEncoder *)self traceStream];
    if (v23) {
      unint64_t var0 = v23->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    long long v25 = (uint64_t *)[v9 traceStream];
    if (v25) {
      uint64_t v26 = *v25;
    }
    else {
      uint64_t v26 = 0;
    }
    *(void *)uint64_t v18 = var0;
    *((void *)v18 + 1) = v26;
    *((void *)v18 + 2) = a4;
    *((void *)v18 + 3) = a5;
    s();
    *(void *)uint64_t v27 = v28;
    *(unsigned char *)(v27 + 8) = BYTE8(v31);
    *(unsigned char *)(v30 + 15) |= 8u;
  }
  else
  {
    long long v19 = self->_baseObject;
    long long v20 = [v8 baseObject];
    [(MTLArgumentEncoder *)v19 setArgumentBuffer:v20 startOffset:a4 arrayElement:a5];
  }
}

- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    id v8 = (unint64_t *)[v6 traceStream];
    if (v8)
    {
      unint64_t v9 = atomic_load(v8 + 7);
      unint64_t v10 = v9;
      do
      {
        atomic_compare_exchange_strong((atomic_ullong *volatile)v8 + 7, &v10, v9 | 2);
        BOOL v11 = v10 == v9;
        unint64_t v9 = v10;
      }
      while (!v11);
    }
    if (v7) {
      CaptureMTLBuffer_registerBaseBufferForTracing(*((void **)v7 + 1), *((void *)v7 + 6), 0);
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
    baseObject = self->_baseObject;
    BOOL v13 = [v7 baseObject];
    [(MTLArgumentEncoder *)baseObject setArgumentBuffer:v13 offset:a4];

    uint64_t v14 = v28;
    *(_DWORD *)(v28 + 8) = -16061;
    char v15 = BYTE9(v29);
    if (BYTE9(v29) > 0x28uLL)
    {
      uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
      uint64_t v20 = BYTE10(v29);
      ++BYTE10(v29);
      uint64_t v16 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x1800000000) + 16;
      char v15 = v20;
    }
    else
    {
      uint64_t v16 = (char *)(v14 + BYTE9(v29));
      BYTE9(v29) += 24;
    }
    *(unsigned char *)(v14 + 13) = v15;
    uint64_t v21 = [(CaptureMTLArgumentEncoder *)self traceStream];
    if (v21) {
      unint64_t var0 = v21->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    uint64_t v23 = (uint64_t *)[v7 traceStream];
    if (v23) {
      uint64_t v24 = *v23;
    }
    else {
      uint64_t v24 = 0;
    }
    *(void *)uint64_t v16 = var0;
    *((void *)v16 + 1) = v24;
    *((void *)v16 + 2) = a4;
    s();
    *(void *)uint64_t v25 = v26;
    *(unsigned char *)(v25 + 8) = BYTE8(v29);
    *(unsigned char *)(v28 + 15) |= 8u;
  }
  else
  {
    char v17 = self->_baseObject;
    uint64_t v18 = [v6 baseObject];
    [(MTLArgumentEncoder *)v17 setArgumentBuffer:v18 offset:a4];
  }
}

- (MTLArgumentEncoder)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLArgumentEncoder)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLArgumentEncoder;
  unint64_t v9 = [(CaptureMTLArgumentEncoder *)&v14 init];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    BOOL v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    unint64_t v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);
  }
  return v10;
}

@end