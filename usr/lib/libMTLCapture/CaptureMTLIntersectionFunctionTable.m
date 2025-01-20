@interface CaptureMTLIntersectionFunctionTable
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isAliasable;
- (BOOL)isComplete;
- (BOOL)isPurgeable;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLIntersectionFunctionTable)initWithBaseObject:(id)a3 captureComputePipelineState:(id)a4 descriptor:(id)a5;
- (CaptureMTLIntersectionFunctionTable)initWithBaseObject:(id)a3 captureDevice:(id)a4 descriptor:(id)a5;
- (CaptureMTLIntersectionFunctionTable)initWithBaseObject:(id)a3 captureRenderPipelineState:(id)a4 descriptor:(id)a5;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLHeap)heap;
- (MTLIntersectionFunctionTable)baseObject;
- (MTLResourceID)gpuResourceID;
- (NSArray)functionArray;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)globalBuffer;
- (id)originalObject;
- (int)responsibleProcess;
- (unint64_t)allocatedSize;
- (unint64_t)allocationID;
- (unint64_t)bufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)cpuCacheMode;
- (unint64_t)globalBufferOffset;
- (unint64_t)gpuHandle;
- (unint64_t)hazardTrackingMode;
- (unint64_t)heapOffset;
- (unint64_t)protectionOptions;
- (unint64_t)resourceIndex;
- (unint64_t)resourceOptions;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)storageMode;
- (unint64_t)streamReference;
- (unint64_t)unfilteredResourceOptions;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
- (void)makeAliasable;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setFunction:(id)a3 atIndex:(unint64_t)a4;
- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4;
- (void)setGlobalBuffer:(id)a3;
- (void)setGlobalBufferOffset:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)setResponsibleProcess:(int)a3;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)touch;
- (void)waitUntilComplete;
@end

@implementation CaptureMTLIntersectionFunctionTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffers, 0);
  objc_storeStrong((id *)&self->_functions, 0);
  objc_storeStrong((id *)&self->_captureRenderPipelineState, 0);
  objc_storeStrong((id *)&self->_captureComputePipelineState, 0);
  objc_storeStrong((id *)&self->_captureHeap, 0);
  objc_storeStrong((id *)&self->_captureBuffer, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (NSArray)functionArray
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
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
  id v5 = [(MTLIntersectionFunctionTableSPI *)self->_baseObject setPurgeableState:a3];
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15557;
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
  v11 = [(CaptureMTLIntersectionFunctionTable *)self traceStream];
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

- (void)makeAliasable
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLIntersectionFunctionTableSPI *)self->_baseObject makeAliasable];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15560;
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
  v8 = [(CaptureMTLIntersectionFunctionTable *)self traceStream];
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
  return [(MTLIntersectionFunctionTableSPI *)self->_baseObject isPurgeable];
}

- (BOOL)isComplete
{
  return [(MTLIntersectionFunctionTableSPI *)self->_baseObject isComplete];
}

- (BOOL)isAliasable
{
  return [(MTLIntersectionFunctionTableSPI *)self->_baseObject isAliasable];
}

- (BOOL)doesAliasResource:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = [a3 baseObject];
  LOBYTE(baseObject) = [(MTLIntersectionFunctionTableSPI *)baseObject doesAliasResource:v4];

  return (char)baseObject;
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, 8 * a4);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  return [(MTLIntersectionFunctionTableSPI *)baseObject doesAliasAnyResources:v8 count:a4];
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, 8 * a4);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  return [(MTLIntersectionFunctionTableSPI *)baseObject doesAliasAllResources:v8 count:a4];
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -15568;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    id v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    id v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  v8 = [(CaptureMTLIntersectionFunctionTable *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLIntersectionFunctionTable;
  [(CaptureMTLIntersectionFunctionTable *)&v12 dealloc];
}

- (unint64_t)bufferAddressAtIndex:(unint64_t)a3
{
  return (unint64_t)[(MTLIntersectionFunctionTableSPI *)self->_baseObject bufferAddressAtIndex:a3];
}

- (unint64_t)uniqueIdentifier
{
  return (unint64_t)[(MTLIntersectionFunctionTableSPI *)self->_baseObject uniqueIdentifier];
}

- (unint64_t)unfilteredResourceOptions
{
  return (unint64_t)[(MTLIntersectionFunctionTableSPI *)self->_baseObject unfilteredResourceOptions];
}

- (unint64_t)storageMode
{
  return (unint64_t)[(MTLIntersectionFunctionTableSPI *)self->_baseObject storageMode];
}

- (void)setResponsibleProcess:(int)a3
{
}

- (int)responsibleProcess
{
  return [(MTLIntersectionFunctionTableSPI *)self->_baseObject responsibleProcess];
}

- (unint64_t)resourceOptions
{
  return (unint64_t)[(MTLIntersectionFunctionTableSPI *)self->_baseObject resourceOptions];
}

- (unint64_t)resourceIndex
{
  return (unint64_t)[(MTLIntersectionFunctionTableSPI *)self->_baseObject resourceIndex];
}

- (unint64_t)protectionOptions
{
  return (unint64_t)[(MTLIntersectionFunctionTableSPI *)self->_baseObject protectionOptions];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLIntersectionFunctionTableSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15570;
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
  uint64_t v10 = [(CaptureMTLIntersectionFunctionTable *)self traceStream];
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
  return (NSString *)[(MTLIntersectionFunctionTableSPI *)self->_baseObject label];
}

- (unint64_t)heapOffset
{
  return (unint64_t)[(MTLIntersectionFunctionTableSPI *)self->_baseObject heapOffset];
}

- (MTLHeap)heap
{
  return (MTLHeap *)[(MTLIntersectionFunctionTableSPI *)self->_baseObject heap];
}

- (unint64_t)hazardTrackingMode
{
  return (unint64_t)[(MTLIntersectionFunctionTableSPI *)self->_baseObject hazardTrackingMode];
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)[(MTLIntersectionFunctionTableSPI *)self->_baseObject gpuResourceID];
}

- (unint64_t)gpuHandle
{
  return (unint64_t)[(MTLIntersectionFunctionTableSPI *)self->_baseObject gpuHandle];
}

- (void)setGlobalBufferOffset:(unint64_t)a3
{
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLIntersectionFunctionTable_setGlobalBufferOffset", (uint64_t)"Ray tracing", 0, 0);
  baseObject = self->_baseObject;

  [(MTLIntersectionFunctionTableSPI *)baseObject setGlobalBufferOffset:a3];
}

- (unint64_t)globalBufferOffset
{
  return (unint64_t)[(MTLIntersectionFunctionTableSPI *)self->_baseObject globalBufferOffset];
}

- (void)setGlobalBuffer:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLIntersectionFunctionTable_setGlobalBuffer", (uint64_t)"Ray tracing", 0, 0);
  [(MTLIntersectionFunctionTableSPI *)self->_baseObject setGlobalBuffer:v4];
}

- (id)globalBuffer
{
  return [(MTLIntersectionFunctionTableSPI *)self->_baseObject globalBuffer];
}

- (MTLDevice)device
{
  return self->_captureDevice;
}

- (unint64_t)cpuCacheMode
{
  return (unint64_t)[(MTLIntersectionFunctionTableSPI *)self->_baseObject cpuCacheMode];
}

- (unint64_t)allocationID
{
  return (unint64_t)[(MTLIntersectionFunctionTableSPI *)self->_baseObject allocationID];
}

- (unint64_t)allocatedSize
{
  return (unint64_t)[(MTLIntersectionFunctionTableSPI *)self->_baseObject allocatedSize];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLIntersectionFunctionTableSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLIntersectionFunctionTable;
  uint64_t v3 = [(CaptureMTLIntersectionFunctionTable *)&v7 description];
  id v4 = [(MTLIntersectionFunctionTableSPI *)self->_baseObject description];
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

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v30 = (id *)a3;
  if (a4.length)
  {
    NSUInteger v7 = a4.location;
    uint64_t v8 = v30;
    NSUInteger v9 = a4.length;
    do
    {
      if (v7 < (unint64_t)[(NSMutableArray *)self->_buffers count])
      {
        if (*v8)
        {
          [(NSMutableArray *)self->_buffers setObject:*v8 atIndexedSubscript:v7];
        }
        else
        {
          uint64_t v10 = +[NSNull null];
          [(NSMutableArray *)self->_buffers setObject:v10 atIndexedSubscript:v7];
        }
      }
      ++v8;
      ++v7;
      --v9;
    }
    while (v9);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v31);
  s();
  uint64_t v12 = v11;
  *(unsigned char *)(v11 + 8) |= 1u;
  baseObject = self->_baseObject;
  uint64_t v14 = 8 * length;
  __chkstk_darwin(v11, v15);
  bzero((char *)&v29 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    size_t v16 = v30;
    uint64_t v17 = (uint64_t *)((char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v18 = length;
    do
    {
      long long v19 = *v16++;
      *v17++ = [v19 baseObject];
      --v18;
    }
    while (v18);
  }
  -[MTLIntersectionFunctionTableSPI setVisibleFunctionTables:withBufferRange:](baseObject, "setVisibleFunctionTables:withBufferRange:", (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v20 = v32;
  *(_DWORD *)(v32 + 8) = -15525;
  char v21 = BYTE9(v33);
  if (BYTE9(v33) > 0x20uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 24);
    uint64_t v24 = BYTE10(v33);
    ++BYTE10(v33);
    v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v32 + 1), v24 | 0x2000000000) + 16;
    char v21 = v24;
  }
  else
  {
    v22 = (char *)(v20 + BYTE9(v33));
    BYTE9(v33) += 32;
  }
  *(unsigned char *)(v20 + 13) = v21;
  v25 = [(CaptureMTLIntersectionFunctionTable *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v25, v26);
  bzero((char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v28 = StreamArray((uint64_t)&v31, (uint64_t *)((char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0)), v30, length);
  *(void *)v22 = var0;
  *((void *)v22 + 1) = location;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  *(_DWORD *)(v22 + 25) = 0;
  *((_DWORD *)v22 + 7) = 0;
  *(void *)uint64_t v12 = v33;
  *(unsigned char *)(v12 + 8) = BYTE8(v33);
  *(unsigned char *)(v32 + 15) |= 8u;
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  if ((unint64_t)[(NSMutableArray *)self->_buffers count] > a4)
  {
    if (v6)
    {
      [(NSMutableArray *)self->_buffers setObject:v6 atIndexedSubscript:a4];
    }
    else
    {
      NSUInteger v7 = +[NSNull null];
      [(NSMutableArray *)self->_buffers setObject:v7 atIndexedSubscript:a4];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  s();
  uint64_t v9 = v8;
  *(unsigned char *)(v8 + 8) |= 1u;
  baseObject = self->_baseObject;
  uint64_t v11 = [v6 baseObject];
  [(MTLIntersectionFunctionTableSPI *)baseObject setVisibleFunctionTable:v11 atBufferIndex:a4];

  uint64_t v12 = v22;
  *(_DWORD *)(v22 + 8) = -15526;
  char v13 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v16 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v22 + 1), v16 | 0x1800000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLIntersectionFunctionTable *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v19 = (uint64_t *)[v6 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *(void *)uint64_t v9 = v23;
  *(unsigned char *)(v9 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.length)
  {
    NSUInteger v8 = a4.location;
    NSUInteger v9 = a4.length;
    do
    {
      if (v8 < (unint64_t)[(NSMutableArray *)self->_functions count])
      {
        uint64_t v10 = +[NSNull null];
        [(NSMutableArray *)self->_functions setObject:v10 atIndexedSubscript:v8];
      }
      ++v8;
      --v9;
    }
    while (v9);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v20);
  -[MTLIntersectionFunctionTableSPI setOpaqueCurveIntersectionFunctionWithSignature:withRange:](self->_baseObject, "setOpaqueCurveIntersectionFunctionWithSignature:withRange:", a3, location, length);
  uint64_t v11 = v21;
  *(_DWORD *)(v21 + 8) = -15257;
  char v12 = BYTE9(v22);
  if (BYTE9(v22) > 0x20uLL)
  {
    uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 24);
    uint64_t v15 = BYTE10(v22);
    ++BYTE10(v22);
    char v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v21 + 1), v15 | 0x2000000000) + 16;
    char v12 = v15;
  }
  else
  {
    char v13 = (char *)(v11 + BYTE9(v22));
    BYTE9(v22) += 32;
  }
  *(unsigned char *)(v11 + 13) = v12;
  uint64_t v16 = [(CaptureMTLIntersectionFunctionTable *)self traceStream];
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)char v13 = var0;
  *((void *)v13 + 1) = a3;
  *((void *)v13 + 2) = location;
  *((void *)v13 + 3) = length;
  s();
  *(void *)uint64_t v18 = v19;
  *(unsigned char *)(v18 + 8) = BYTE8(v22);
  *(unsigned char *)(v21 + 15) |= 8u;
}

- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if ((unint64_t)[(NSMutableArray *)self->_functions count] > a4)
  {
    NSUInteger v7 = +[NSNull null];
    [(NSMutableArray *)self->_functions setObject:v7 atIndexedSubscript:a4];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v17);
  [(MTLIntersectionFunctionTableSPI *)self->_baseObject setOpaqueCurveIntersectionFunctionWithSignature:a3 atIndex:a4];
  uint64_t v8 = v18;
  *(_DWORD *)(v18 + 8) = -15258;
  char v9 = BYTE9(v19);
  if (BYTE9(v19) > 0x28uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 24);
    uint64_t v12 = BYTE10(v19);
    ++BYTE10(v19);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v18 + 1), v12 | 0x1800000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v19));
    BYTE9(v19) += 24;
  }
  *(unsigned char *)(v8 + 13) = v9;
  char v13 = [(CaptureMTLIntersectionFunctionTable *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = a3;
  *((void *)v10 + 2) = a4;
  s();
  *(void *)uint64_t v15 = v16;
  *(unsigned char *)(v15 + 8) = BYTE8(v19);
  *(unsigned char *)(v18 + 15) |= 8u;
}

- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.length)
  {
    NSUInteger v8 = a4.location;
    NSUInteger v9 = a4.length;
    do
    {
      if (v8 < (unint64_t)[(NSMutableArray *)self->_functions count])
      {
        uint64_t v10 = +[NSNull null];
        [(NSMutableArray *)self->_functions setObject:v10 atIndexedSubscript:v8];
      }
      ++v8;
      --v9;
    }
    while (v9);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v20);
  -[MTLIntersectionFunctionTableSPI setOpaqueTriangleIntersectionFunctionWithSignature:withRange:](self->_baseObject, "setOpaqueTriangleIntersectionFunctionWithSignature:withRange:", a3, location, length);
  uint64_t v11 = v21;
  *(_DWORD *)(v21 + 8) = -15529;
  char v12 = BYTE9(v22);
  if (BYTE9(v22) > 0x20uLL)
  {
    uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 24);
    uint64_t v15 = BYTE10(v22);
    ++BYTE10(v22);
    char v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v21 + 1), v15 | 0x2000000000) + 16;
    char v12 = v15;
  }
  else
  {
    char v13 = (char *)(v11 + BYTE9(v22));
    BYTE9(v22) += 32;
  }
  *(unsigned char *)(v11 + 13) = v12;
  uint64_t v16 = [(CaptureMTLIntersectionFunctionTable *)self traceStream];
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)char v13 = var0;
  *((void *)v13 + 1) = a3;
  *((void *)v13 + 2) = location;
  *((void *)v13 + 3) = length;
  s();
  *(void *)uint64_t v18 = v19;
  *(unsigned char *)(v18 + 8) = BYTE8(v22);
  *(unsigned char *)(v21 + 15) |= 8u;
}

- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if ((unint64_t)[(NSMutableArray *)self->_functions count] > a4)
  {
    NSUInteger v7 = +[NSNull null];
    [(NSMutableArray *)self->_functions setObject:v7 atIndexedSubscript:a4];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v17);
  [(MTLIntersectionFunctionTableSPI *)self->_baseObject setOpaqueTriangleIntersectionFunctionWithSignature:a3 atIndex:a4];
  uint64_t v8 = v18;
  *(_DWORD *)(v18 + 8) = -15530;
  char v9 = BYTE9(v19);
  if (BYTE9(v19) > 0x28uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 24);
    uint64_t v12 = BYTE10(v19);
    ++BYTE10(v19);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v18 + 1), v12 | 0x1800000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v19));
    BYTE9(v19) += 24;
  }
  *(unsigned char *)(v8 + 13) = v9;
  char v13 = [(CaptureMTLIntersectionFunctionTable *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = a3;
  *((void *)v10 + 2) = a4;
  s();
  *(void *)uint64_t v15 = v16;
  *(unsigned char *)(v15 + 8) = BYTE8(v19);
  *(unsigned char *)(v18 + 15) |= 8u;
}

- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.length)
  {
    NSUInteger v8 = a4.location;
    char v9 = a3;
    NSUInteger v10 = a4.length;
    do
    {
      if (v8 < (unint64_t)[(NSMutableArray *)self->_functions count])
      {
        if (*v9)
        {
          [(NSMutableArray *)self->_functions setObject:*v9 atIndexedSubscript:v8];
        }
        else
        {
          uint64_t v11 = +[NSNull null];
          [(NSMutableArray *)self->_functions setObject:v11 atIndexedSubscript:v8];
        }
      }
      ++v9;
      ++v8;
      --v10;
    }
    while (v10);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  uint64_t v12 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v31);
  baseObject = self->_baseObject;
  uint64_t v14 = 8 * length;
  __chkstk_darwin(v12, v15);
  bzero((char *)&v31 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v16 = a3;
    long long v17 = (void *)((char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v18 = length;
    do
    {
      long long v19 = (void *)*v16++;
      *v17++ = [v19 baseObject];
      --v18;
    }
    while (v18);
  }
  -[MTLIntersectionFunctionTableSPI setFunctions:withRange:](baseObject, "setFunctions:withRange:", (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v20 = v32;
  *(_DWORD *)(v32 + 8) = -15558;
  char v21 = BYTE9(v33);
  if (BYTE9(v33) > 0x20uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 24);
    uint64_t v24 = BYTE10(v33);
    ++BYTE10(v33);
    long long v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v32 + 1), v24 | 0x2000000000) + 16;
    char v21 = v24;
  }
  else
  {
    long long v22 = (char *)(v20 + BYTE9(v33));
    BYTE9(v33) += 32;
  }
  *(unsigned char *)(v20 + 13) = v21;
  v25 = [(CaptureMTLIntersectionFunctionTable *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v25, v26);
  bzero((char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v28 = StreamArray((uint64_t)&v31, (long long *)((char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)long long v22 = var0;
  *((void *)v22 + 1) = location;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  *(_DWORD *)(v22 + 25) = 0;
  *((_DWORD *)v22 + 7) = 0;
  s();
  *(void *)uint64_t v29 = v30;
  *(unsigned char *)(v29 + 8) = BYTE8(v33);
  *(unsigned char *)(v32 + 15) |= 8u;
}

- (void)setFunction:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if ((unint64_t)[(NSMutableArray *)self->_functions count] > a4)
  {
    if (v6)
    {
      [(NSMutableArray *)self->_functions setObject:v6 atIndexedSubscript:a4];
    }
    else
    {
      NSUInteger v7 = +[NSNull null];
      [(NSMutableArray *)self->_functions setObject:v7 atIndexedSubscript:a4];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  char v9 = [v6 baseObject];
  [(MTLIntersectionFunctionTableSPI *)baseObject setFunction:v9 atIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15559;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  uint64_t v15 = [(CaptureMTLIntersectionFunctionTable *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  long long v33 = a4;
  v34 = (id *)a3;
  if (a5.length)
  {
    NSUInteger v8 = a5.location;
    char v9 = v34;
    NSUInteger v10 = a5.length;
    do
    {
      if (v8 < (unint64_t)[(NSMutableArray *)self->_buffers count])
      {
        if (*v9)
        {
          [(NSMutableArray *)self->_buffers setObject:*v9 atIndexedSubscript:v8];
        }
        else
        {
          char v11 = +[NSNull null];
          [(NSMutableArray *)self->_buffers setObject:v11 atIndexedSubscript:v8];
        }
      }
      ++v9;
      ++v8;
      --v10;
    }
    while (v10);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v35);
  s();
  uint64_t v13 = v12;
  *(unsigned char *)(v12 + 8) |= 1u;
  baseObject = self->_baseObject;
  uint64_t v15 = 8 * length;
  __chkstk_darwin(v12, v16);
  bzero((char *)&v33 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    long long v17 = v34;
    uint64_t v18 = (const unint64_t **)((char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v19 = length;
    do
    {
      uint64_t v20 = *v17++;
      *v18++ = [v20 baseObject:v33];
      --v19;
    }
    while (v19);
  }
  long long v21 = (unint64_t *)v33;
  NSUInteger v22 = location;
  -[MTLIntersectionFunctionTableSPI setBuffers:offsets:withRange:](baseObject, "setBuffers:offsets:withRange:", (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v33, location, length, v33);
  uint64_t v23 = v36;
  *(_DWORD *)(v36 + 8) = -15544;
  char v24 = BYTE9(v37);
  if (BYTE9(v37) > 0x20uLL)
  {
    uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 24);
    uint64_t v27 = BYTE10(v37);
    ++BYTE10(v37);
    v25 = GTTraceMemPool_allocateBytes(v26, *((uint64_t *)&v36 + 1), v27 | 0x2000000000) + 16;
    char v24 = v27;
  }
  else
  {
    v25 = (char *)(v23 + BYTE9(v37));
    BYTE9(v37) += 32;
  }
  *(unsigned char *)(v23 + 13) = v24;
  char v28 = [(CaptureMTLIntersectionFunctionTable *)self traceStream];
  if (v28) {
    unint64_t var0 = v28->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v28, v29);
  bzero((char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v31 = StreamArray((uint64_t)&v35, (const unint64_t **)((char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0)), v34, length);
  char v32 = GTTraceEncoder_storeBytes((uint64_t)&v35, v21, 8 * length);
  *(void *)v25 = var0;
  *((void *)v25 + 1) = v22;
  *((void *)v25 + 2) = length;
  v25[24] = v31;
  v25[25] = v32;
  *(_DWORD *)(v25 + 26) = 0;
  *((_WORD *)v25 + 15) = 0;
  *(void *)uint64_t v13 = v37;
  *(unsigned char *)(v13 + 8) = BYTE8(v37);
  *(unsigned char *)(v36 + 15) |= 8u;
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  if ((unint64_t)[(NSMutableArray *)self->_buffers count] > a5)
  {
    if (v8)
    {
      [(NSMutableArray *)self->_buffers setObject:v8 atIndexedSubscript:a5];
    }
    else
    {
      char v9 = +[NSNull null];
      [(NSMutableArray *)self->_buffers setObject:v9 atIndexedSubscript:a5];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  s();
  uint64_t v11 = v10;
  *(unsigned char *)(v10 + 8) |= 1u;
  baseObject = self->_baseObject;
  uint64_t v13 = [v8 baseObject];
  [(MTLIntersectionFunctionTableSPI *)baseObject setBuffer:v13 offset:a4 atIndex:a5];

  uint64_t v14 = v24;
  *(_DWORD *)(v24 + 8) = -15545;
  char v15 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v18 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v24 + 1), v18 | 0x2000000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v14 + 13) = v15;
  NSUInteger v19 = [(CaptureMTLIntersectionFunctionTable *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v21 = (uint64_t *)[v8 traceStream];
  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0;
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  *((void *)v16 + 3) = a5;
  *(void *)uint64_t v11 = v25;
  *(unsigned char *)(v11 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (MTLIntersectionFunctionTable)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLIntersectionFunctionTable)initWithBaseObject:(id)a3 captureRenderPipelineState:(id)a4 descriptor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CaptureMTLIntersectionFunctionTable;
  uint64_t v12 = [(CaptureMTLIntersectionFunctionTable *)&v29 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseObject, a3);
    uint64_t v14 = [v10 device];
    captureDevice = v13->_captureDevice;
    v13->_captureDevice = (MTLDevice *)v14;

    objc_storeStrong((id *)&v13->_captureRenderPipelineState, a4);
    uint64_t v16 = (GTTraceContext *)[v10 traceContext];
    v13->_traceContext = v16;
    uint64_t v17 = DEVICEOBJECT(v9);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v16, (unint64_t)v17, (unint64_t)v13);

    int v18 = 31;
    NSUInteger v19 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:31];
    buffers = v13->_buffers;
    v13->_buffers = v19;

    do
    {
      long long v21 = v13->_buffers;
      uint64_t v22 = +[NSNull null];
      [(NSMutableArray *)v21 addObject:v22];

      --v18;
    }
    while (v18);
    long long v23 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:[v11 functionCount]];
    functions = v13->_functions;
    v13->_functions = v23;

    if ([v11 functionCount])
    {
      unint64_t v25 = 0;
      do
      {
        uint64_t v26 = v13->_functions;
        uint64_t v27 = +[NSNull null];
        [(NSMutableArray *)v26 addObject:v27];

        ++v25;
      }
      while ((unint64_t)[v11 functionCount] > v25);
    }
  }

  return v13;
}

- (CaptureMTLIntersectionFunctionTable)initWithBaseObject:(id)a3 captureComputePipelineState:(id)a4 descriptor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CaptureMTLIntersectionFunctionTable;
  uint64_t v12 = [(CaptureMTLIntersectionFunctionTable *)&v29 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseObject, a3);
    uint64_t v14 = [v10 device];
    captureDevice = v13->_captureDevice;
    v13->_captureDevice = (MTLDevice *)v14;

    objc_storeStrong((id *)&v13->_captureComputePipelineState, a4);
    uint64_t v16 = (GTTraceContext *)[v10 traceContext];
    v13->_traceContext = v16;
    uint64_t v17 = DEVICEOBJECT(v9);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v16, (unint64_t)v17, (unint64_t)v13);

    int v18 = 31;
    NSUInteger v19 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:31];
    buffers = v13->_buffers;
    v13->_buffers = v19;

    do
    {
      long long v21 = v13->_buffers;
      uint64_t v22 = +[NSNull null];
      [(NSMutableArray *)v21 addObject:v22];

      --v18;
    }
    while (v18);
    long long v23 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:[v11 functionCount]];
    functions = v13->_functions;
    v13->_functions = v23;

    if ([v11 functionCount])
    {
      unint64_t v25 = 0;
      do
      {
        uint64_t v26 = v13->_functions;
        uint64_t v27 = +[NSNull null];
        [(NSMutableArray *)v26 addObject:v27];

        ++v25;
      }
      while ((unint64_t)[v11 functionCount] > v25);
    }
  }

  return v13;
}

- (CaptureMTLIntersectionFunctionTable)initWithBaseObject:(id)a3 captureDevice:(id)a4 descriptor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)CaptureMTLIntersectionFunctionTable;
  uint64_t v12 = [(CaptureMTLIntersectionFunctionTable *)&v27 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseObject, a3);
    objc_storeStrong((id *)&v13->_captureDevice, a4);
    uint64_t v14 = (GTTraceContext *)[v10 traceContext];
    v13->_traceContext = v14;
    char v15 = DEVICEOBJECT(v9);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v14, (unint64_t)v15, (unint64_t)v13);

    int v16 = 31;
    uint64_t v17 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:31];
    buffers = v13->_buffers;
    v13->_buffers = v17;

    do
    {
      NSUInteger v19 = v13->_buffers;
      uint64_t v20 = +[NSNull null];
      [(NSMutableArray *)v19 addObject:v20];

      --v16;
    }
    while (v16);
    long long v21 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:[v11 functionCount]];
    functions = v13->_functions;
    v13->_functions = v21;

    if ([v11 functionCount])
    {
      unint64_t v23 = 0;
      do
      {
        long long v24 = v13->_functions;
        unint64_t v25 = +[NSNull null];
        [(NSMutableArray *)v24 addObject:v25];

        ++v23;
      }
      while ((unint64_t)[v11 functionCount] > v23);
    }
  }

  return v13;
}

@end