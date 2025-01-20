@interface CaptureMTLVisibleFunctionTable
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isAliasable;
- (BOOL)isComplete;
- (BOOL)isPurgeable;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLVisibleFunctionTable)initWithBaseObject:(id)a3 captureComputePipelineState:(id)a4 descriptor:(id)a5;
- (CaptureMTLVisibleFunctionTable)initWithBaseObject:(id)a3 captureRenderPipelineState:(id)a4 descriptor:(id)a5;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLBuffer)globalBuffer;
- (MTLDevice)device;
- (MTLHeap)heap;
- (MTLResourceID)gpuResourceID;
- (MTLVisibleFunctionTable)baseObject;
- (NSArray)functionArray;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (int)responsibleProcess;
- (unint64_t)allocatedSize;
- (unint64_t)allocationID;
- (unint64_t)bufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)cpuCacheMode;
- (unint64_t)globalBufferOffset;
- (unint64_t)gpuAddress;
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
- (void)setResponsibleProcess:(int)a3;
- (void)setValue:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setValue:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)touch;
- (void)waitUntilComplete;
@end

@implementation CaptureMTLVisibleFunctionTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionArray, 0);
  objc_storeStrong((id *)&self->_renderPipelineState, 0);
  objc_storeStrong((id *)&self->_computePipelineState, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (NSArray)functionArray
{
  return &self->_functionArray->super;
}

- (void)waitUntilComplete
{
}

- (void)makeAliasable
{
}

- (BOOL)isPurgeable
{
  return [(MTLVisibleFunctionTableSPI *)self->_baseObject isPurgeable];
}

- (BOOL)isComplete
{
  return [(MTLVisibleFunctionTableSPI *)self->_baseObject isComplete];
}

- (BOOL)isAliasable
{
  return [(MTLVisibleFunctionTableSPI *)self->_baseObject isAliasable];
}

- (BOOL)doesAliasResource:(id)a3
{
  baseObject = self->_baseObject;
  v4 = [a3 baseObject];
  LOBYTE(baseObject) = [(MTLVisibleFunctionTableSPI *)baseObject doesAliasResource:v4];

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
    v9 = v8;
    unint64_t v10 = a4;
    do
    {
      v11 = (void *)*a3++;
      *(void *)v9 = [v11 baseObject];
      v9 += 8;
      --v10;
    }
    while (v10);
  }
  return [(MTLVisibleFunctionTableSPI *)baseObject doesAliasAnyResources:v8 count:a4];
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, 8 * a4);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v8, v7);
  if (a4)
  {
    v9 = v8;
    unint64_t v10 = a4;
    do
    {
      v11 = (void *)*a3++;
      *(void *)v9 = [v11 baseObject];
      v9 += 8;
      --v10;
    }
    while (v10);
  }
  return [(MTLVisibleFunctionTableSPI *)baseObject doesAliasAllResources:v8 count:a4];
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -15605;
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
  v8 = [(CaptureMTLVisibleFunctionTable *)self traceStream];
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
  v12.super_class = (Class)CaptureMTLVisibleFunctionTable;
  [(CaptureMTLVisibleFunctionTable *)&v12 dealloc];
}

- (unint64_t)bufferAddressAtIndex:(unint64_t)a3
{
  return (unint64_t)[(MTLVisibleFunctionTableSPI *)self->_baseObject bufferAddressAtIndex:a3];
}

- (unint64_t)unfilteredResourceOptions
{
  return (unint64_t)[(MTLVisibleFunctionTableSPI *)self->_baseObject unfilteredResourceOptions];
}

- (unint64_t)storageMode
{
  return (unint64_t)[(MTLVisibleFunctionTableSPI *)self->_baseObject storageMode];
}

- (void)setResponsibleProcess:(int)a3
{
}

- (int)responsibleProcess
{
  return [(MTLVisibleFunctionTableSPI *)self->_baseObject responsibleProcess];
}

- (unint64_t)resourceOptions
{
  return (unint64_t)[(MTLVisibleFunctionTableSPI *)self->_baseObject resourceOptions];
}

- (unint64_t)protectionOptions
{
  return (unint64_t)[(MTLVisibleFunctionTableSPI *)self->_baseObject protectionOptions];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLVisibleFunctionTableSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15607;
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
  uint64_t v10 = [(CaptureMTLVisibleFunctionTable *)self traceStream];
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
  return (NSString *)[(MTLVisibleFunctionTableSPI *)self->_baseObject label];
}

- (unint64_t)heapOffset
{
  return (unint64_t)[(MTLVisibleFunctionTableSPI *)self->_baseObject heapOffset];
}

- (MTLHeap)heap
{
  return (MTLHeap *)[(MTLVisibleFunctionTableSPI *)self->_baseObject heap];
}

- (unint64_t)hazardTrackingMode
{
  return (unint64_t)[(MTLVisibleFunctionTableSPI *)self->_baseObject hazardTrackingMode];
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)[(MTLVisibleFunctionTableSPI *)self->_baseObject gpuResourceID];
}

- (unint64_t)gpuHandle
{
  return (unint64_t)[(MTLVisibleFunctionTableSPI *)self->_baseObject gpuHandle];
}

- (unint64_t)gpuAddress
{
  return (unint64_t)[(MTLVisibleFunctionTableSPI *)self->_baseObject gpuAddress];
}

- (MTLDevice)device
{
  return self->_captureDevice;
}

- (unint64_t)cpuCacheMode
{
  return (unint64_t)[(MTLVisibleFunctionTableSPI *)self->_baseObject cpuCacheMode];
}

- (unint64_t)allocationID
{
  return (unint64_t)[(MTLVisibleFunctionTableSPI *)self->_baseObject allocationID];
}

- (unint64_t)allocatedSize
{
  return (unint64_t)[(MTLVisibleFunctionTableSPI *)self->_baseObject allocatedSize];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLVisibleFunctionTableSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLVisibleFunctionTable;
  uint64_t v3 = [(CaptureMTLVisibleFunctionTable *)&v7 description];
  id v4 = [(MTLVisibleFunctionTableSPI *)self->_baseObject description];
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

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLVisibleFunctionTable_setVisibleFunctionTable_atBufferIndex", (uint64_t)"Function Pointers", 0, 0);
  baseObject = self->_baseObject;
  id v8 = [v6 baseObject];

  [(MTLVisibleFunctionTableSPI *)baseObject setVisibleFunctionTable:v8 atBufferIndex:a4];
}

- (void)setValue:(unint64_t)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLVisibleFunctionTable_setValue_withRange", (uint64_t)"Function Pointers", 0, 0);
  baseObject = self->_baseObject;

  -[MTLVisibleFunctionTableSPI setValue:withRange:](baseObject, "setValue:withRange:", a3, location, length);
}

- (void)setValue:(unint64_t)a3 atIndex:(unint64_t)a4
{
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLVisibleFunctionTable_setValue_atIndex", (uint64_t)"Function Pointers", 0, 0);
  baseObject = self->_baseObject;

  [(MTLVisibleFunctionTableSPI *)baseObject setValue:a3 atIndex:a4];
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  return (unint64_t)[(MTLVisibleFunctionTableSPI *)self->_baseObject setPurgeableState:a3];
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLVisibleFunctionTable_setBuffers_offsets_withRange", (uint64_t)"Function Pointers", 0, 0);
  baseObject = self->_baseObject;
  __chkstk_darwin(v11, 8 * length);
  id v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v13, v12);
  if (length)
  {
    id v14 = v13;
    NSUInteger v15 = length;
    do
    {
      size_t v16 = (void *)*a3++;
      *(void *)id v14 = [v16 baseObject];
      v14 += 8;
      --v15;
    }
    while (v15);
  }
  -[MTLVisibleFunctionTableSPI setBuffers:offsets:withRange:](baseObject, "setBuffers:offsets:withRange:", v13, a4, location, length);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLVisibleFunctionTable_setBuffer_offset_atIndex", (uint64_t)"Function Pointers", 0, 0);
  baseObject = self->_baseObject;
  id v10 = [v8 baseObject];

  [(MTLVisibleFunctionTableSPI *)baseObject setBuffer:v10 offset:a4 atIndex:a5];
}

- (unint64_t)uniqueIdentifier
{
  return (unint64_t)[(MTLVisibleFunctionTableSPI *)self->_baseObject uniqueIdentifier];
}

- (unint64_t)resourceIndex
{
  return (unint64_t)[(MTLVisibleFunctionTableSPI *)self->_baseObject resourceIndex];
}

- (void)setGlobalBufferOffset:(unint64_t)a3
{
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLVisibleFunctionTable_setGlobalBufferOffset", (uint64_t)"Function Pointers", 0, 0);
  baseObject = self->_baseObject;

  [(MTLVisibleFunctionTableSPI *)baseObject setGlobalBufferOffset:a3];
}

- (unint64_t)globalBufferOffset
{
  return (unint64_t)[(MTLVisibleFunctionTableSPI *)self->_baseObject globalBufferOffset];
}

- (void)setGlobalBuffer:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLVisibleFunctionTable_setGlobalBuffer", (uint64_t)"Function Pointers", 0, 0);
  [(MTLVisibleFunctionTableSPI *)self->_baseObject setGlobalBuffer:v4];
}

- (MTLBuffer)globalBuffer
{
  return (MTLBuffer *)[(MTLVisibleFunctionTableSPI *)self->_baseObject globalBuffer];
}

- (void)setFunction:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    [(NSMutableArray *)self->_functionArray setObject:v6 atIndexedSubscript:a4];
  }
  else
  {
    objc_super v7 = +[NSNull null];
    [(NSMutableArray *)self->_functionArray setObject:v7 atIndexedSubscript:a4];
  }
  traceStream = self->_traceStream;
  if (traceStream)
  {
    p_var1 = &traceStream[1].var1;
    unint64_t v10 = atomic_load(p_var1);
    unint64_t v11 = v10;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)p_var1, &v11, v10 | 2);
      BOOL v12 = v11 == v10;
      unint64_t v10 = v11;
    }
    while (!v12);
  }
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v28);
    baseObject = self->_baseObject;
    id v14 = [v6 baseObject];
    [(MTLVisibleFunctionTableSPI *)baseObject setFunction:v14 atIndex:a4];

    uint64_t v15 = v29;
    *(_DWORD *)(v29 + 8) = -15598;
    char v16 = BYTE9(v30);
    if (BYTE9(v30) > 0x28uLL)
    {
      uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 24);
      uint64_t v21 = BYTE10(v30);
      ++BYTE10(v30);
      uint64_t v17 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v29 + 1), v21 | 0x1800000000) + 16;
      char v16 = v21;
    }
    else
    {
      uint64_t v17 = (char *)(v15 + BYTE9(v30));
      BYTE9(v30) += 24;
    }
    *(unsigned char *)(v15 + 13) = v16;
    v22 = [(CaptureMTLVisibleFunctionTable *)self traceStream];
    if (v22) {
      unint64_t var0 = v22->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    v24 = (uint64_t *)[v6 traceStream];
    if (v24) {
      uint64_t v25 = *v24;
    }
    else {
      uint64_t v25 = 0;
    }
    *(void *)uint64_t v17 = var0;
    *((void *)v17 + 1) = v25;
    *((void *)v17 + 2) = a4;
    s();
    *(void *)uint64_t v26 = v27;
    *(unsigned char *)(v26 + 8) = BYTE8(v30);
    *(unsigned char *)(v29 + 15) |= 8u;
  }
  else
  {
    uint64_t v18 = self->_baseObject;
    long long v19 = [v6 baseObject];
    [(MTLVisibleFunctionTableSPI *)v18 setFunction:v19 atIndex:a4];
  }
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLVisibleFunctionTable_setVisibleFunctionTables_withBufferRange", (uint64_t)"Function Pointers", 0, 0);
  baseObject = self->_baseObject;
  __chkstk_darwin(v9, 8 * length);
  unint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v11, v10);
  if (length)
  {
    BOOL v12 = v11;
    NSUInteger v13 = length;
    do
    {
      id v14 = (void *)*a3++;
      *(void *)BOOL v12 = [v14 baseObject];
      v12 += 8;
      --v13;
    }
    while (v13);
  }
  -[MTLVisibleFunctionTableSPI setVisibleFunctionTables:withBufferRange:](baseObject, "setVisibleFunctionTables:withBufferRange:", v11, location, length);
}

- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  objc_super v7 = self;
  if (a4.length)
  {
    NSUInteger v8 = a4.location;
    uint64_t v9 = a3;
    NSUInteger v10 = a4.length;
    do
    {
      self = (CaptureMTLVisibleFunctionTable *)[(NSMutableArray *)v7->_functionArray count];
      if (v8 < (unint64_t)self)
      {
        if (*v9)
        {
          self = (CaptureMTLVisibleFunctionTable *)[(NSMutableArray *)v7->_functionArray setObject:*v9 atIndexedSubscript:v8];
        }
        else
        {
          unint64_t v11 = +[NSNull null];
          [(NSMutableArray *)v7->_functionArray setObject:v11 atIndexedSubscript:v8];
        }
      }
      ++v9;
      ++v8;
      --v10;
    }
    while (v10);
  }
  traceStream = v7->_traceStream;
  if (traceStream)
  {
    p_var1 = &traceStream[1].var1;
    unint64_t v14 = atomic_load(p_var1);
    unint64_t v15 = v14;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)p_var1, &v15, v14 | 2);
      BOOL v16 = v15 == v14;
      unint64_t v14 = v15;
    }
    while (!v16);
  }
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    NSUInteger v17 = location;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v43 = 0u;
    uint64_t v18 = GTTraceContext_pushEncoderWithStream((uint64_t)v7->_traceContext, (uint64_t)&v43);
    baseObject = v7->_baseObject;
    uint64_t v20 = 8 * length;
    __chkstk_darwin(v18, v21);
    bzero((char *)&v43 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
    if (length)
    {
      v22 = (void **)v6;
      v23 = (void *)((char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
      NSUInteger v24 = length;
      do
      {
        uint64_t v25 = *v22++;
        *v23++ = [v25 baseObject];
        --v24;
      }
      while (v24);
    }
    -[MTLVisibleFunctionTableSPI setFunctions:withRange:](baseObject, "setFunctions:withRange:", (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v17, length);
    uint64_t v26 = v44;
    *(_DWORD *)(v44 + 8) = -15597;
    char v27 = BYTE9(v45);
    if (BYTE9(v45) > 0x20uLL)
    {
      uint64_t v35 = *(void *)(*((void *)&v43 + 1) + 24);
      uint64_t v36 = BYTE10(v45);
      ++BYTE10(v45);
      long long v28 = GTTraceMemPool_allocateBytes(v35, *((uint64_t *)&v44 + 1), v36 | 0x2000000000) + 16;
      char v27 = v36;
    }
    else
    {
      long long v28 = (char *)(v26 + BYTE9(v45));
      BYTE9(v45) += 32;
    }
    *(unsigned char *)(v26 + 13) = v27;
    v37 = [(CaptureMTLVisibleFunctionTable *)v7 traceStream];
    if (v37) {
      unint64_t var0 = v37->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
    {
      __chkstk_darwin(v37, v38);
      bzero((char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
      char v40 = StreamArrayURL((uint64_t)&v43, (long long *)((char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)v6, length);
    }
    else
    {
      char v40 = 0;
    }
    *(void *)long long v28 = var0;
    *((void *)v28 + 1) = v17;
    *((void *)v28 + 2) = length;
    v28[24] = v40;
    *(_DWORD *)(v28 + 25) = 0;
    *((_DWORD *)v28 + 7) = 0;
    s();
    *(void *)uint64_t v41 = v42;
    *(unsigned char *)(v41 + 8) = BYTE8(v45);
    *(unsigned char *)(v44 + 15) |= 8u;
  }
  else
  {
    long long v29 = v7->_baseObject;
    __chkstk_darwin(self, 8 * length);
    v31 = (char *)&v43 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v31, v30);
    if (length)
    {
      v32 = v31;
      NSUInteger v33 = length;
      do
      {
        id v34 = (id)*v6++;
        *(void *)v32 = [v34 baseObject];
        v32 += 8;
        --v33;
      }
      while (v33);
    }
    -[MTLVisibleFunctionTableSPI setFunctions:withRange:](v29, "setFunctions:withRange:", v31, location, length);
  }
}

- (MTLVisibleFunctionTable)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLVisibleFunctionTable)initWithBaseObject:(id)a3 captureRenderPipelineState:(id)a4 descriptor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CaptureMTLVisibleFunctionTable;
  BOOL v12 = [(CaptureMTLVisibleFunctionTable *)&v24 init];
  NSUInteger v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseObject, a3);
    uint64_t v14 = [v10 device];
    captureDevice = v13->_captureDevice;
    v13->_captureDevice = (MTLDevice *)v14;

    objc_storeStrong((id *)&v13->_renderPipelineState, a4);
    BOOL v16 = (GTTraceContext *)[v10 traceContext];
    v13->_traceContext = v16;
    NSUInteger v17 = DEVICEOBJECT(v9);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v16, (unint64_t)v17, (unint64_t)v13);

    uint64_t v18 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v11 functionCount]);
    functionArray = v13->_functionArray;
    v13->_functionArray = (NSMutableArray *)v18;

    if ([v11 functionCount])
    {
      unint64_t v20 = 0;
      do
      {
        uint64_t v21 = v13->_functionArray;
        v22 = +[NSNull null];
        [(NSMutableArray *)v21 addObject:v22];

        ++v20;
      }
      while ((unint64_t)[v11 functionCount] > v20);
    }
  }

  return v13;
}

- (CaptureMTLVisibleFunctionTable)initWithBaseObject:(id)a3 captureComputePipelineState:(id)a4 descriptor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CaptureMTLVisibleFunctionTable;
  BOOL v12 = [(CaptureMTLVisibleFunctionTable *)&v24 init];
  NSUInteger v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_baseObject, a3);
    uint64_t v14 = [v10 device];
    captureDevice = v13->_captureDevice;
    v13->_captureDevice = (MTLDevice *)v14;

    objc_storeStrong((id *)&v13->_computePipelineState, a4);
    BOOL v16 = (GTTraceContext *)[v10 traceContext];
    v13->_traceContext = v16;
    NSUInteger v17 = DEVICEOBJECT(v9);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v16, (unint64_t)v17, (unint64_t)v13);

    uint64_t v18 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v11 functionCount]);
    functionArray = v13->_functionArray;
    v13->_functionArray = (NSMutableArray *)v18;

    if ([v11 functionCount])
    {
      unint64_t v20 = 0;
      do
      {
        uint64_t v21 = v13->_functionArray;
        v22 = +[NSNull null];
        [(NSMutableArray *)v21 addObject:v22];

        ++v20;
      }
      while ((unint64_t)[v11 functionCount] > v20);
    }
  }

  return v13;
}

@end