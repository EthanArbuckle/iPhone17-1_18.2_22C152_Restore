@interface CaptureMTLIndirectCommandBuffer
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isAliasable;
- (BOOL)isComplete;
- (BOOL)isPurgeable;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLIndirectCommandBuffer)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLHeap)heap;
- (MTLIndirectCommandBuffer)baseObject;
- (MTLResourceID)gpuResourceID;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)indirectComputeCommandAtIndex:(unint64_t)a3;
- (id)indirectRenderCommandAtIndex:(unint64_t)a3;
- (id)originalObject;
- (int)responsibleProcess;
- (unint64_t)allocatedSize;
- (unint64_t)allocationID;
- (unint64_t)cpuCacheMode;
- (unint64_t)gpuAddress;
- (unint64_t)gpuHandle;
- (unint64_t)hazardTrackingMode;
- (unint64_t)heapOffset;
- (unint64_t)resourceIndex;
- (unint64_t)resourceOptions;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)size;
- (unint64_t)storageMode;
- (unint64_t)streamReference;
- (unint64_t)unfilteredResourceOptions;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
- (void)getHeader:(void *)a3 headerSize:(unint64_t *)a4;
- (void)makeAliasable;
- (void)resetWithRange:(_NSRange)a3;
- (void)setLabel:(id)a3;
- (void)setResponsibleProcess:(int)a3;
- (void)touch;
- (void)waitUntilComplete;
@end

@implementation CaptureMTLIndirectCommandBuffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)waitUntilComplete
{
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  id v5 = [(MTLIndirectCommandBufferSPI *)self->_baseObject setPurgeableState:a3];
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15920;
  char v7 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v10 = BYTE10(v18);
    ++BYTE10(v18);
    v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v17 + 1), v10 | 0x1800000000) + 16;
    char v7 = v10;
  }
  else
  {
    v8 = (char *)(v6 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v6 + 13) = v7;
  v11 = [(CaptureMTLIndirectCommandBuffer *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v8 = var0;
  *((void *)v8 + 1) = v5;
  *((void *)v8 + 2) = a3;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
  return (unint64_t)v5;
}

- (void)resetWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v15);
  -[MTLIndirectCommandBufferSPI resetWithRange:](self->_baseObject, "resetWithRange:", location, length);
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -15896;
  char v7 = BYTE9(v17);
  if (BYTE9(v17) > 0x28uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 24);
    uint64_t v10 = BYTE10(v17);
    ++BYTE10(v17);
    v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v16 + 1), v10 | 0x1800000000) + 16;
    char v7 = v10;
  }
  else
  {
    v8 = (char *)(v6 + BYTE9(v17));
    BYTE9(v17) += 24;
  }
  *(unsigned char *)(v6 + 13) = v7;
  v11 = [(CaptureMTLIndirectCommandBuffer *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v8 = var0;
  *((void *)v8 + 1) = location;
  *((void *)v8 + 2) = length;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v17);
  *(unsigned char *)(v16 + 15) |= 8u;
}

- (void)makeAliasable
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLIndirectCommandBufferSPI *)self->_baseObject makeAliasable];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15919;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    id v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    id v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  v8 = [(CaptureMTLIndirectCommandBuffer *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
}

- (BOOL)isPurgeable
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  unsigned int v3 = [(MTLIndirectCommandBufferSPI *)self->_baseObject isPurgeable];
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -15917;
  char v5 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v8 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v6 = GTTraceMemPool_allocateBytes(v7, *((uint64_t *)&v15 + 1), v8 | 0x1000000000) + 16;
    char v5 = v8;
  }
  else
  {
    uint64_t v6 = (char *)(v4 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v4 + 13) = v5;
  uint64_t v9 = [(CaptureMTLIndirectCommandBuffer *)self traceStream];
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v6 = var0;
  *((_DWORD *)v6 + 2) = v3;
  *((_DWORD *)v6 + 3) = 0;
  s();
  *(void *)uint64_t v11 = v12;
  *(unsigned char *)(v11 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  return v3;
}

- (BOOL)isComplete
{
  return [(MTLIndirectCommandBufferSPI *)self->_baseObject isComplete];
}

- (BOOL)isAliasable
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  unsigned int v3 = [(MTLIndirectCommandBufferSPI *)self->_baseObject isAliasable];
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -15918;
  char v5 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v8 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v6 = GTTraceMemPool_allocateBytes(v7, *((uint64_t *)&v15 + 1), v8 | 0x1000000000) + 16;
    char v5 = v8;
  }
  else
  {
    uint64_t v6 = (char *)(v4 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v4 + 13) = v5;
  uint64_t v9 = [(CaptureMTLIndirectCommandBuffer *)self traceStream];
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v6 = var0;
  *((_DWORD *)v6 + 2) = v3;
  *((_DWORD *)v6 + 3) = 0;
  s();
  *(void *)uint64_t v11 = v12;
  *(unsigned char *)(v11 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  return v3;
}

- (id)indirectRenderCommandAtIndex:(unint64_t)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  traceContext = self->_traceContext;
  long long v22 = (unint64_t)traceContext;
  *(void *)&long long v23 = 0;
  *((void *)&v23 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v7 = v6;
  uint64_t v8 = *v6;
  *uint64_t v6 = v9;
  *(void *)&long long v24 = v8;
  BYTE8(v24) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v24 + 9) = 16400;
  *(_DWORD *)((char *)&v24 + 11) = 0;
  HIBYTE(v24) = 0;
  uint64_t v10 = -[MTLIndirectCommandBufferSPI indirectRenderCommandAtIndex:](self->_baseObject, "indirectRenderCommandAtIndex:");
  if (v10) {
    uint64_t v11 = [[CaptureMTLIndirectRenderCommand alloc] initWithBaseObject:v10 captureContext:self->_traceContext];
  }
  else {
    uint64_t v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v22, (uint64_t)[(CaptureMTLIndirectRenderCommand *)v11 traceStream]);
  uint64_t v12 = v23;
  *(_DWORD *)(v23 + 8) = -15922;
  char v13 = BYTE9(v24);
  if (BYTE9(v24) > 0x28uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v16 = BYTE10(v24);
    ++BYTE10(v24);
    long long v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v23 + 1), v16 | 0x1800000000) + 16;
    char v13 = v16;
  }
  else
  {
    long long v14 = (char *)(v12 + BYTE9(v24));
    BYTE9(v24) += 24;
  }
  *(unsigned char *)(v12 + 13) = v13;
  long long v17 = [(CaptureMTLIndirectCommandBuffer *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v19 = [(CaptureMTLIndirectRenderCommand *)v11 traceStream];
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0;
  }
  *(void *)long long v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a3;
  *uint64_t v7 = v24;
  *((unsigned char *)v7 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;

  return v11;
}

- (id)indirectComputeCommandAtIndex:(unint64_t)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  traceContext = self->_traceContext;
  long long v22 = (unint64_t)traceContext;
  *(void *)&long long v23 = 0;
  *((void *)&v23 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v7 = v6;
  uint64_t v8 = *v6;
  *uint64_t v6 = v9;
  *(void *)&long long v24 = v8;
  BYTE8(v24) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v24 + 9) = 16400;
  *(_DWORD *)((char *)&v24 + 11) = 0;
  HIBYTE(v24) = 0;
  uint64_t v10 = -[MTLIndirectCommandBufferSPI indirectComputeCommandAtIndex:](self->_baseObject, "indirectComputeCommandAtIndex:");
  if (v10) {
    uint64_t v11 = [[CaptureMTLIndirectComputeCommand alloc] initWithBaseObject:v10 captureContext:self->_traceContext];
  }
  else {
    uint64_t v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v22, (uint64_t)[(CaptureMTLIndirectComputeCommand *)v11 traceStream]);
  uint64_t v12 = v23;
  *(_DWORD *)(v23 + 8) = -15921;
  char v13 = BYTE9(v24);
  if (BYTE9(v24) > 0x28uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v16 = BYTE10(v24);
    ++BYTE10(v24);
    long long v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v23 + 1), v16 | 0x1800000000) + 16;
    char v13 = v16;
  }
  else
  {
    long long v14 = (char *)(v12 + BYTE9(v24));
    BYTE9(v24) += 24;
  }
  *(unsigned char *)(v12 + 13) = v13;
  long long v17 = [(CaptureMTLIndirectCommandBuffer *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v19 = [(CaptureMTLIndirectComputeCommand *)v11 traceStream];
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0;
  }
  *(void *)long long v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a3;
  *uint64_t v7 = v24;
  *((unsigned char *)v7 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;

  return v11;
}

- (void)getHeader:(void *)a3 headerSize:(unint64_t *)a4
{
}

- (BOOL)doesAliasResource:(id)a3
{
  baseObject = self->_baseObject;
  uint64_t v4 = [a3 baseObject];
  LOBYTE(baseObject) = [(MTLIndirectCommandBufferSPI *)baseObject doesAliasResource:v4];

  return (char)baseObject;
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, 8 * a4);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v8, v7);
  if (a4)
  {
    uint64_t v9 = v8;
    unint64_t v10 = a4;
    do
    {
      uint64_t v11 = (void *)*a3++;
      *(void *)uint64_t v9 = [v11 baseObject];
      v9 += 8;
      --v10;
    }
    while (v10);
  }
  return [(MTLIndirectCommandBufferSPI *)baseObject doesAliasAnyResources:v8 count:a4];
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, 8 * a4);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v8, v7);
  if (a4)
  {
    uint64_t v9 = v8;
    unint64_t v10 = a4;
    do
    {
      uint64_t v11 = (void *)*a3++;
      *(void *)uint64_t v9 = [v11 baseObject];
      v9 += 8;
      --v10;
    }
    while (v10);
  }
  return [(MTLIndirectCommandBufferSPI *)baseObject doesAliasAllResources:v8 count:a4];
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -15923;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    char v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    char v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLIndirectCommandBuffer *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)char v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLIndirectCommandBuffer;
  [(CaptureMTLIndirectCommandBuffer *)&v12 dealloc];
}

- (unint64_t)uniqueIdentifier
{
  return (unint64_t)[(MTLIndirectCommandBufferSPI *)self->_baseObject uniqueIdentifier];
}

- (unint64_t)unfilteredResourceOptions
{
  return (unint64_t)[(MTLIndirectCommandBufferSPI *)self->_baseObject unfilteredResourceOptions];
}

- (unint64_t)storageMode
{
  return (unint64_t)[(MTLIndirectCommandBufferSPI *)self->_baseObject storageMode];
}

- (unint64_t)size
{
  return (unint64_t)[(MTLIndirectCommandBufferSPI *)self->_baseObject size];
}

- (void)setResponsibleProcess:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLIndirectCommandBufferSPI *)self->_baseObject setResponsibleProcess:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15924;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLIndirectCommandBuffer *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (int)responsibleProcess
{
  return [(MTLIndirectCommandBufferSPI *)self->_baseObject responsibleProcess];
}

- (unint64_t)resourceOptions
{
  return (unint64_t)[(MTLIndirectCommandBufferSPI *)self->_baseObject resourceOptions];
}

- (unint64_t)resourceIndex
{
  return (unint64_t)[(MTLIndirectCommandBufferSPI *)self->_baseObject resourceIndex];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLIndirectCommandBufferSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15925;
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
  uint64_t v10 = [(CaptureMTLIndirectCommandBuffer *)self traceStream];
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
  return (NSString *)[(MTLIndirectCommandBufferSPI *)self->_baseObject label];
}

- (unint64_t)heapOffset
{
  return (unint64_t)[(MTLIndirectCommandBufferSPI *)self->_baseObject heapOffset];
}

- (MTLHeap)heap
{
  return (MTLHeap *)[(MTLIndirectCommandBufferSPI *)self->_baseObject heap];
}

- (unint64_t)hazardTrackingMode
{
  return (unint64_t)[(MTLIndirectCommandBufferSPI *)self->_baseObject hazardTrackingMode];
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)[(MTLIndirectCommandBufferSPI *)self->_baseObject gpuResourceID];
}

- (unint64_t)gpuHandle
{
  return (unint64_t)[(MTLIndirectCommandBufferSPI *)self->_baseObject gpuHandle];
}

- (unint64_t)gpuAddress
{
  return (unint64_t)[(MTLIndirectCommandBufferSPI *)self->_baseObject gpuAddress];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (unint64_t)cpuCacheMode
{
  return (unint64_t)[(MTLIndirectCommandBufferSPI *)self->_baseObject cpuCacheMode];
}

- (unint64_t)allocationID
{
  return (unint64_t)[(MTLIndirectCommandBufferSPI *)self->_baseObject allocationID];
}

- (unint64_t)allocatedSize
{
  return (unint64_t)[(MTLIndirectCommandBufferSPI *)self->_baseObject allocatedSize];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLIndirectCommandBufferSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLIndirectCommandBuffer;
  uint64_t v3 = [(CaptureMTLIndirectCommandBuffer *)&v7 description];
  id v4 = [(MTLIndirectCommandBufferSPI *)self->_baseObject description];
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

- (MTLIndirectCommandBuffer)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLIndirectCommandBuffer)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLIndirectCommandBuffer;
  uint64_t v9 = [(CaptureMTLIndirectCommandBuffer *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    id v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);
  }
  return v10;
}

@end