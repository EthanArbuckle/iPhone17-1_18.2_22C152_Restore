@interface CaptureMTLComputeCommandEncoder
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)encodeEndDoWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6;
- (BOOL)encodeEndIf;
- (BOOL)encodeEndWhile;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLComputeCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLComputeCommandEncoder)baseObject;
- (MTLDevice)device;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newKernelDebugInfo;
- (id)originalObject;
- (unint64_t)dispatchType;
- (unint64_t)nextVirtualSubstream;
- (unint64_t)streamReference;
- (void)beginVirtualSubstream;
- (void)dealloc;
- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5;
- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
- (void)enableNullBufferBinds:(BOOL)a3;
- (void)encodeStartDoWhile;
- (void)encodeStartElse;
- (void)encodeStartIf:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6;
- (void)encodeStartWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6;
- (void)endEncoding;
- (void)endVirtualSubstream;
- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)insertCompressedTextureReinterpretationFlush;
- (void)insertDebugSignpost:(id)a3;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4;
- (void)memoryBarrierWithScope:(unint64_t)a3;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setComputePipelineState:(id)a3;
- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4;
- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setLabel:(id)a3;
- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setStageInRegion:(id *)a3;
- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
- (void)setSubstream:(unsigned int)a3;
- (void)setTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setThreadgroupDistributionMode:(int64_t)a3;
- (void)setThreadgroupDistributionModeWithClusterGroupIndex:(unsigned int)a3;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setThreadgroupPackingDisabled:(BOOL)a3;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)signalProgress:(unsigned int)a3;
- (void)touch;
- (void)updateFence:(id)a3;
- (void)useHeap:(id)a3;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResourceGroup:(id)a3 usage:(unint64_t)a4;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)waitForFence:(id)a3;
- (void)waitForProgress:(unsigned int)a3;
- (void)waitForVirtualSubstream:(unint64_t)a3;
@end

@implementation CaptureMTLComputeCommandEncoder

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_captureCommandBuffer);
  objc_storeStrong((id *)&self->_retainedObjects, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)waitForVirtualSubstream:(unint64_t)a3
{
}

- (void)waitForProgress:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject waitForProgress:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15709;
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
  v10 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
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

- (void)waitForFence:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  v7 = [v4 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject waitForFence:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16129;
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
  uint64_t v13 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  char v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v28);
  baseObject = self->_baseObject;
  unint64_t v11 = 8 * a4;
  __chkstk_darwin(v9, v12);
  bzero((char *)&v28 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  if (a4)
  {
    uint64_t v13 = a3;
    long long v14 = (void *)((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v15 = a4;
    do
    {
      uint64_t v16 = (void *)*v13++;
      *v14++ = [v16 baseObject];
      --v15;
    }
    while (v15);
  }
  [(MTLComputeCommandEncoderSPI *)baseObject useResources:(char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0) count:a4 usage:a5];
  uint64_t v17 = v29;
  *(_DWORD *)(v29 + 8) = -16046;
  char v18 = BYTE9(v30);
  if (BYTE9(v30) > 0x20uLL)
  {
    uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v21 = BYTE10(v30);
    ++BYTE10(v30);
    long long v19 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v29 + 1), v21 | 0x2000000000) + 16;
    char v18 = v21;
  }
  else
  {
    long long v19 = (char *)(v17 + BYTE9(v30));
    BYTE9(v30) += 32;
  }
  *(unsigned char *)(v17 + 13) = v18;
  v22 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v22, v23);
  bzero((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  char v25 = StreamArray((uint64_t)&v28, (long long *)((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, a4);
  *(void *)long long v19 = var0;
  *((void *)v19 + 1) = a4;
  *((void *)v19 + 2) = a5;
  v19[24] = v25;
  *(_DWORD *)(v19 + 25) = 0;
  *((_DWORD *)v19 + 7) = 0;
  s();
  *(void *)uint64_t v26 = v27;
  *(unsigned char *)(v26 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;
}

- (void)useResourceGroup:(id)a3 usage:(unint64_t)a4
{
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLComputeCommandEncoder_useResourceGroup_usage", (uint64_t)"Resource groups", 0, 0);
  [v10 touch];
  char v6 = v10;
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      [(NSMutableSet *)retainedObjects addObject:v10];
      char v6 = v10;
    }
  }
  baseObject = self->_baseObject;
  char v9 = [v6 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject useResourceGroup:v9 usage:a4];
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  char v9 = [v6 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject useResource:v9 usage:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16047;
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
  unint64_t v15 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = (uint64_t *)[v6 traceStream];
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

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLComputeCommandEncoder_useResidencySets_count", (uint64_t)"Deprecated Residency Set API", 0, 0);
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  baseObject = self->_baseObject;
  __chkstk_darwin(v8, 8 * a4);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v10, v9);
  if (a4)
  {
    char v11 = v10;
    unint64_t v12 = a4;
    do
    {
      uint64_t v13 = (void *)*a3++;
      *(void *)char v11 = [v13 baseObject];
      v11 += 8;
      --v12;
    }
    while (v12);
  }
  [(MTLComputeCommandEncoderSPI *)baseObject useResidencySets:v10 count:a4];
}

- (void)useResidencySet:(id)a3
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLComputeCommandEncoder_useResidencySet", (uint64_t)"Deprecated Residency Set API", 0, 0);
  [v8 touch];
  id v4 = v8;
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      [(NSMutableSet *)retainedObjects addObject:v8];
      id v4 = v8;
    }
  }
  baseObject = self->_baseObject;
  v7 = [v4 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject useResidencySet:v7];
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  v7 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v26);
  baseObject = self->_baseObject;
  unint64_t v9 = 8 * a4;
  __chkstk_darwin(v7, v10);
  bzero((char *)&v26 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  if (a4)
  {
    char v11 = a3;
    unint64_t v12 = (void *)((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v13 = a4;
    do
    {
      uint64_t v14 = (void *)*v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }
    while (v13);
  }
  [(MTLComputeCommandEncoderSPI *)baseObject useHeaps:(char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) count:a4];
  uint64_t v15 = v27;
  *(_DWORD *)(v27 + 8) = -16044;
  char v16 = BYTE9(v28);
  if (BYTE9(v28) > 0x28uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v19 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v27 + 1), v19 | 0x1800000000) + 16;
    char v16 = v19;
  }
  else
  {
    uint64_t v17 = (char *)(v15 + BYTE9(v28));
    BYTE9(v28) += 24;
  }
  *(unsigned char *)(v15 + 13) = v16;
  uint64_t v20 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v20, v21);
  bzero((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  char v23 = StreamArray((uint64_t)&v26, (long long *)((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, a4);
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = a4;
  v17[16] = v23;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  s();
  *(void *)uint64_t v24 = v25;
  *(unsigned char *)(v24 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;
}

- (void)useHeap:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  v7 = [v4 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject useHeap:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16045;
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
  unint64_t v13 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)updateFence:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  v7 = [v4 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject updateFence:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16130;
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
  unint64_t v13 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)signalProgress:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject signalProgress:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15710;
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
  uint64_t v10 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
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

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      long long v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLComputeCommandEncoderSPI setVisibleFunctionTables:withBufferRange:](baseObject, "setVisibleFunctionTables:withBufferRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15580;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject setVisibleFunctionTable:v9 atBufferIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15581;
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
  long long v15 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
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

- (void)setThreadgroupPackingDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject setThreadgroupPackingDisabled:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15278;
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
  uint64_t v10 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
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

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject setThreadgroupMemoryLength:a3 atIndex:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16328;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setThreadgroupDistributionModeWithClusterGroupIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject setThreadgroupDistributionModeWithClusterGroupIndex:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15279;
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
  uint64_t v10 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
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

- (void)setThreadgroupDistributionMode:(int64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject setThreadgroupDistributionMode:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15280;
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
  uint64_t v10 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      long long v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLComputeCommandEncoderSPI setTextures:withRange:](baseObject, "setTextures:withRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16333;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    long long v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    long long v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)long long v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject setTexture:v9 atIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16334;
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
  long long v15 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
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

- (void)setSubstream:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject setSubstream:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15711;
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
  uint64_t v10 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
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

- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject setStageInRegionWithIndirectBuffer:v9 indirectBufferOffset:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16017;
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
  long long v15 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
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

- (void)setStageInRegion:(id *)a3
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  long long v6 = *(_OWORD *)&a3->var0.var2;
  v18[0] = *(_OWORD *)&a3->var0.var0;
  v18[1] = v6;
  v18[2] = *(_OWORD *)&a3->var1.var1;
  [(MTLComputeCommandEncoderSPI *)baseObject setStageInRegion:v18];
  uint64_t v7 = v20;
  *(_DWORD *)(v20 + 8) = -16100;
  char v8 = BYTE9(v21);
  if (BYTE9(v21) > 8uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v11 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v20 + 1), v11 | 0x3800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v21));
    BYTE9(v21) += 56;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  long long v14 = *(_OWORD *)&a3->var0.var2;
  long long v15 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)(v9 + 8) = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)(v9 + 24) = v14;
  *(_OWORD *)(v9 + 40) = v15;
  s();
  *(void *)uint64_t v16 = v17;
  *(unsigned char *)(v16 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  char v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      long long v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLComputeCommandEncoderSPI setSamplerStates:withRange:](baseObject, "setSamplerStates:withRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16331;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  v34 = (float *)a4;
  RetainArray(self->_retainedObjects, (id *)a3, a6.length);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  uint64_t v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v35);
  baseObject = self->_baseObject;
  uint64_t v12 = 8 * length;
  __chkstk_darwin(v10, v13);
  bzero((char *)&location - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    NSUInteger v14 = a3;
    long long v15 = (NSUInteger *)((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v16 = length;
    do
    {
      char v17 = (void *)*v14++;
      *v15++ = [v17 baseObject:location];
      --v16;
    }
    while (v16);
  }
  NSUInteger v18 = location;
  uint64_t v19 = (float *)a5;
  -[MTLComputeCommandEncoderSPI setSamplerStates:lodMinClamps:lodMaxClamps:withRange:](baseObject, "setSamplerStates:lodMinClamps:lodMaxClamps:withRange:", (char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v34, a5, location, length, location);
  uint64_t v20 = v36;
  *(_DWORD *)(v36 + 8) = -16329;
  char v21 = BYTE9(v37);
  if (BYTE9(v37) > 0x20uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 24);
    uint64_t v24 = BYTE10(v37);
    ++BYTE10(v37);
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v36 + 1), v24 | 0x2000000000) + 16;
    char v21 = v24;
  }
  else
  {
    uint64_t v22 = (char *)(v20 + BYTE9(v37));
    BYTE9(v37) += 32;
  }
  *(unsigned char *)(v20 + 13) = v21;
  uint64_t v25 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v25, v26);
  bzero((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v28 = StreamArray((uint64_t)&v35, (NSUInteger *)((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  char v29 = GTTraceEncoder_storeBytes((uint64_t)&v35, v34, 4 * length);
  char v30 = GTTraceEncoder_storeBytes((uint64_t)&v35, v19, 4 * length);
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = v18;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  v22[25] = v29;
  v22[26] = v30;
  *(_DWORD *)(v22 + 27) = 0;
  v22[31] = 0;
  s();
  *(void *)uint64_t v31 = v32;
  *(unsigned char *)(v31 + 8) = BYTE8(v37);
  *(unsigned char *)(v36 + 15) |= 8u;
}

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v10 = a3;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v13 = [v10 baseObject];
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  [(MTLComputeCommandEncoderSPI *)baseObject setSamplerState:v13 lodMinClamp:a6 lodMaxClamp:v14 atIndex:v15];

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16330;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    NSUInteger v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    NSUInteger v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  char v21 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v23 = (uint64_t *)[v10 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0;
  }
  *(void *)NSUInteger v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a6;
  *((float *)v18 + 6) = a4;
  *((float *)v18 + 7) = a5;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject setSamplerState:v9 atIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16332;
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
  double v15 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
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

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  char v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = length;
    do
    {
      double v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  -[MTLComputeCommandEncoderSPI setIntersectionFunctionTables:withBufferRange:](baseObject, "setIntersectionFunctionTables:withBufferRange:", (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15582;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject setIntersectionFunctionTable:v9 atBufferIndex:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15583;
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
  double v15 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v17 = (uint64_t *)[v6 traceStream];
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

- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject setImageblockWidth:a3 height:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16149;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setComputePipelineState:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  uint64_t v7 = [v4 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject setComputePipelineState:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16337;
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
  uint64_t v13 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject setBytes:a3 length:a4 attributeStride:a5 atIndex:a6];
  uint64_t v11 = v22;
  *(_DWORD *)(v22 + 8) = -15281;
  char v12 = BYTE9(v23);
  if (BYTE9(v23) > 0x18uLL)
  {
    uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v15 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v22 + 1), v15 | 0x2800000000) + 16;
    char v12 = v15;
  }
  else
  {
    uint64_t v13 = (char *)(v11 + BYTE9(v23));
    BYTE9(v23) += 40;
  }
  *(unsigned char *)(v11 + 13) = v12;
  uint64_t v16 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v18 = GTTraceEncoder_storeBlob((uint64_t)&v21, a3, a4);
  }
  else {
    char v18 = 0;
  }
  *(void *)uint64_t v13 = var0;
  *((void *)v13 + 1) = a4;
  *((void *)v13 + 2) = a5;
  *((void *)v13 + 3) = a6;
  v13[32] = v18;
  *(_DWORD *)(v13 + 33) = 0;
  *((_DWORD *)v13 + 9) = 0;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject setBytes:a3 length:a4 atIndex:a5];
  uint64_t v9 = v20;
  *(_DWORD *)(v20 + 8) = -16227;
  char v10 = BYTE9(v21);
  if (BYTE9(v21) > 0x20uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v13 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v20 + 1), v13 | 0x2000000000) + 16;
    char v10 = v13;
  }
  else
  {
    uint64_t v11 = (char *)(v9 + BYTE9(v21));
    BYTE9(v21) += 32;
  }
  *(unsigned char *)(v9 + 13) = v10;
  uint64_t v14 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v16 = GTTraceEncoder_storeBlob((uint64_t)&v19, a3, a4);
  }
  else {
    char v16 = 0;
  }
  *(void *)uint64_t v11 = var0;
  *((void *)v11 + 1) = a4;
  *((void *)v11 + 2) = a5;
  v11[24] = v16;
  *(_DWORD *)(v11 + 25) = 0;
  *((_DWORD *)v11 + 7) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  RetainArray(self->_retainedObjects, (id *)a3, a5.length);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  uint64_t v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v32);
  baseObject = self->_baseObject;
  uint64_t v11 = 8 * length;
  __chkstk_darwin(v9, v12);
  bzero((char *)&v30 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v13 = a3;
    uint64_t v14 = (uint64_t *)((char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v15 = length;
    do
    {
      char v16 = (void *)*v13++;
      *v14++ = [v16 baseObject];
      --v15;
    }
    while (v15);
  }
  NSUInteger v17 = location;
  -[MTLComputeCommandEncoderSPI setBuffers:offsets:withRange:](baseObject, "setBuffers:offsets:withRange:", (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a4, location, length);
  uint64_t v18 = v33;
  *(_DWORD *)(v33 + 8) = -16335;
  char v19 = BYTE9(v34);
  if (BYTE9(v34) > 0x20uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 24);
    uint64_t v22 = BYTE10(v34);
    ++BYTE10(v34);
    long long v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v33 + 1), v22 | 0x2000000000) + 16;
    char v19 = v22;
  }
  else
  {
    long long v20 = (char *)(v18 + BYTE9(v34));
    BYTE9(v34) += 32;
  }
  *(unsigned char *)(v18 + 13) = v19;
  long long v23 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v23, v24);
  bzero((char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v26 = StreamArray((uint64_t)&v32, (uint64_t *)((char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  char v27 = GTTraceEncoder_storeBytes((uint64_t)&v32, (void *)a4, 8 * length);
  *(void *)long long v20 = var0;
  *((void *)v20 + 1) = v17;
  *((void *)v20 + 2) = length;
  v20[24] = v26;
  v20[25] = v27;
  *(_DWORD *)(v20 + 26) = 0;
  *((_WORD *)v20 + 15) = 0;
  s();
  *(void *)uint64_t v28 = v29;
  *(unsigned char *)(v28 + 8) = BYTE8(v34);
  *(unsigned char *)(v33 + 15) |= 8u;
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  long long v35 = a4;
  RetainArray(self->_retainedObjects, (id *)a3, a6.length);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  char v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v36);
  baseObject = self->_baseObject;
  uint64_t v12 = 8 * length;
  __chkstk_darwin(v10, v13);
  bzero((char *)&location - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  if (length)
  {
    uint64_t v14 = a3;
    NSUInteger v15 = (NSUInteger *)((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v16 = length;
    do
    {
      NSUInteger v17 = (void *)*v14++;
      *v15++ = [v17 baseObject:location];
      --v16;
    }
    while (v16);
  }
  NSUInteger v18 = location;
  char v19 = a5;
  -[MTLComputeCommandEncoderSPI setBuffers:offsets:attributeStrides:withRange:](baseObject, "setBuffers:offsets:attributeStrides:withRange:", (char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v35, a5, location, length, location);
  uint64_t v20 = v37;
  *(_DWORD *)(v37 + 8) = -15282;
  char v21 = BYTE9(v38);
  if (BYTE9(v38) > 0x20uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 24);
    uint64_t v24 = BYTE10(v38);
    ++BYTE10(v38);
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v37 + 1), v24 | 0x2000000000) + 16;
    char v21 = v24;
  }
  else
  {
    uint64_t v22 = (char *)(v20 + BYTE9(v38));
    BYTE9(v38) += 32;
  }
  *(unsigned char *)(v20 + 13) = v21;
  uint64_t v25 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v25, v26);
  bzero((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * length);
  char v28 = StreamArray((uint64_t)&v36, (NSUInteger *)((char *)&location - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, length);
  uint64_t v29 = boundaryTrackerInstance;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    char v30 = GTTraceEncoder_storeBlob((uint64_t)&v36, v35, length);
    uint64_t v29 = boundaryTrackerInstance;
  }
  else
  {
    char v30 = 0;
  }
  if ((*(_DWORD *)(v29 + 20) & 0xFFFFFFFE) == 2) {
    char v31 = GTTraceEncoder_storeBlob((uint64_t)&v36, v19, length);
  }
  else {
    char v31 = 0;
  }
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = v18;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  v22[25] = v30;
  v22[26] = v31;
  *(_DWORD *)(v22 + 27) = 0;
  v22[31] = 0;
  s();
  *(void *)uint64_t v32 = v33;
  *(unsigned char *)(v32 + 8) = BYTE8(v38);
  *(unsigned char *)(v37 + 15) |= 8u;
}

- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject setBufferOffset:a3 attributeStride:a4 atIndex:a5];
  uint64_t v9 = v19;
  *(_DWORD *)(v19 + 8) = -15283;
  char v10 = BYTE9(v20);
  if (BYTE9(v20) > 0x20uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 24);
    uint64_t v13 = BYTE10(v20);
    ++BYTE10(v20);
    uint64_t v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v19 + 1), v13 | 0x2000000000) + 16;
    char v10 = v13;
  }
  else
  {
    uint64_t v11 = (char *)(v9 + BYTE9(v20));
    BYTE9(v20) += 32;
  }
  *(unsigned char *)(v9 + 13) = v10;
  uint64_t v14 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v11 = var0;
  *((void *)v11 + 1) = a3;
  *((void *)v11 + 2) = a4;
  *((void *)v11 + 3) = a5;
  s();
  *(void *)uint64_t v16 = v17;
  *(unsigned char *)(v16 + 8) = BYTE8(v20);
  *(unsigned char *)(v19 + 15) |= 8u;
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject setBufferOffset:a3 atIndex:a4];
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16226;
  char v8 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v11 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v17 + 1), v11 | 0x1800000000) + 16;
    char v8 = v11;
  }
  else
  {
    uint64_t v9 = (char *)(v7 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v7 + 13) = v8;
  uint64_t v12 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  id v10 = a3;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v25);
  baseObject = self->_baseObject;
  uint64_t v13 = [v10 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject setBuffer:v13 offset:a4 attributeStride:a5 atIndex:a6];

  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15284;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x18uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    long long v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2800000000) + 16;
    char v15 = v18;
  }
  else
  {
    long long v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 40;
  }
  *(unsigned char *)(v14 + 13) = v15;
  long long v19 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v21 = (uint64_t *)[v10 traceStream];
  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0;
  }
  *(void *)long long v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  *((void *)v16 + 3) = a5;
  *((void *)v16 + 4) = a6;
  s();
  *(void *)uint64_t v23 = v24;
  *(unsigned char *)(v23 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = [v8 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject setBuffer:v11 offset:a4 atIndex:a5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -16336;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = [v8 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject sampleCountersInBuffer:v11 atSampleIndex:a4 withBarrier:v5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15754;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((_DWORD *)v14 + 6) = v5;
  *((_DWORD *)v14 + 7) = 0;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (void)pushDebugGroup:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject pushDebugGroup:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16323;
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
  id v10 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
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

- (void)popDebugGroup
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject popDebugGroup];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16322;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    uint64_t v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
}

- (unint64_t)nextVirtualSubstream
{
  return (unint64_t)[(MTLComputeCommandEncoderSPI *)self->_baseObject nextVirtualSubstream];
}

- (id)newKernelDebugInfo
{
  return [(MTLComputeCommandEncoderSPI *)self->_baseObject newKernelDebugInfo];
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject memoryBarrierWithScope:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16009;
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
  uint64_t v10 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  CaptureClearFuncSnapshot((apr_hash_index_t *)a3, (uint64_t)self->_snapshotMap);
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  uint64_t v7 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  uint64_t v9 = 8 * v4;
  __chkstk_darwin(v7, v10);
  bzero((char *)&v27 - ((8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
  if (v4)
  {
    uint64_t v11 = (void **)v5;
    uint64_t v12 = (void *)((char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v13 = v4;
    do
    {
      long long v14 = *v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }
    while (v13);
  }
  [(MTLComputeCommandEncoderSPI *)baseObject memoryBarrierWithResources:(char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) count:v4];
  uint64_t v15 = v28;
  *(_DWORD *)(v28 + 8) = -16008;
  char v16 = BYTE9(v29);
  if (BYTE9(v29) > 0x28uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v19 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v28 + 1), v19 | 0x1800000000) + 16;
    char v16 = v19;
  }
  else
  {
    uint64_t v17 = (char *)(v15 + BYTE9(v29));
    BYTE9(v29) += 24;
  }
  *(unsigned char *)(v15 + 13) = v16;
  long long v20 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v20, v21);
  bzero((char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
  char v23 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)v5, v4);
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v4;
  v17[16] = v23;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  s();
  *(void *)uint64_t v24 = v25;
  *(unsigned char *)(v24 + 8) = BYTE8(v29);
  for (*(unsigned char *)(v28 + 15) |= 8u; v4; --v4)
  {
    id v26 = (id)*v5++;
    CaptureRemoveFuncSnapshot(v26, self->_snapshotMap);
  }
}

- (void)insertDebugSignpost:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject insertDebugSignpost:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16324;
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
  uint64_t v10 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
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

- (void)insertCompressedTextureReinterpretationFlush
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject insertCompressedTextureReinterpretationFlush];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15511;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    uint64_t v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
}

- (void)endVirtualSubstream
{
}

- (void)endEncoding
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject endEncoding];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16325;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    uint64_t v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
}

- (void)encodeStartWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v14 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLComputeCommandEncoder_encodeStartWhile_offset_comparison_referenceValue", (uint64_t)"Command buffer jump", 0, 0);
  [v14 touch];
  uint64_t v10 = v14;
  if (v14)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      [(NSMutableSet *)retainedObjects addObject:v14];
      uint64_t v10 = v14;
    }
  }
  baseObject = self->_baseObject;
  long long v13 = [v10 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject encodeStartWhile:v13 offset:a4 comparison:a5 referenceValue:v6];
}

- (void)encodeStartIf:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v14 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLComputeCommandEncoder_encodeStartIf_offset_comparison_referenceValue", (uint64_t)"Command buffer jump", 0, 0);
  [v14 touch];
  uint64_t v10 = v14;
  if (v14)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      [(NSMutableSet *)retainedObjects addObject:v14];
      uint64_t v10 = v14;
    }
  }
  baseObject = self->_baseObject;
  long long v13 = [v10 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject encodeStartIf:v13 offset:a4 comparison:a5 referenceValue:v6];
}

- (void)encodeStartElse
{
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLComputeCommandEncoder_encodeStartElse", (uint64_t)"Command buffer jump", 0, 0);
  baseObject = self->_baseObject;

  [(MTLComputeCommandEncoderSPI *)baseObject encodeStartElse];
}

- (void)encodeStartDoWhile
{
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLComputeCommandEncoder_encodeStartDoWhile", (uint64_t)"Command buffer jump", 0, 0);
  baseObject = self->_baseObject;

  [(MTLComputeCommandEncoderSPI *)baseObject encodeStartDoWhile];
}

- (BOOL)encodeEndWhile
{
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLComputeCommandEncoder_encodeEndWhile", (uint64_t)"Command buffer jump", 0, 0);
  baseObject = self->_baseObject;

  return [(MTLComputeCommandEncoderSPI *)baseObject encodeEndWhile];
}

- (BOOL)encodeEndIf
{
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLComputeCommandEncoder_encodeEndIf", (uint64_t)"Command buffer jump", 0, 0);
  baseObject = self->_baseObject;

  return [(MTLComputeCommandEncoderSPI *)baseObject encodeEndIf];
}

- (BOOL)encodeEndDoWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLComputeCommandEncoder_encodeEndDoWhile_offset_comparison_referenceValue", (uint64_t)"Command buffer jump", 0, 0);
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  baseObject = self->_baseObject;
  long long v13 = [v10 baseObject];
  unsigned __int8 v14 = [(MTLComputeCommandEncoderSPI *)baseObject encodeEndDoWhile:v13 offset:a4 comparison:a5 referenceValue:v6];

  return v14;
}

- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject dispatchThreadsWithIndirectBuffer:v9 indirectBufferOffset:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16079;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    long long v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    long long v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  id v15 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)long long v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v22);
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = *a4;
  [(MTLComputeCommandEncoderSPI *)baseObject dispatchThreads:&v21 threadsPerThreadgroup:&v20];
  uint64_t v8 = v23;
  *(_DWORD *)(v23 + 8) = -16078;
  char v9 = BYTE9(v24);
  if (BYTE9(v24) > 8uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v12 = BYTE10(v24);
    ++BYTE10(v24);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v23 + 1), v12 | 0x3800000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v24));
    BYTE9(v24) += 56;
  }
  *(unsigned char *)(v8 + 13) = v9;
  uint64_t v13 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t var2 = a3->var2;
  unint64_t v16 = a4->var2;
  *(void *)uint64_t v10 = var0;
  long long v17 = *(_OWORD *)&a4->var0;
  *(_OWORD *)(v10 + 8) = *(_OWORD *)&a3->var0;
  *((void *)v10 + 3) = var2;
  *((_OWORD *)v10 + 2) = v17;
  *((void *)v10 + 6) = v16;
  s();
  *(void *)uint64_t v18 = v19;
  *(unsigned char *)(v18 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v26);
  baseObject = self->_baseObject;
  uint64_t v11 = [v8 baseObject];
  long long v24 = *(_OWORD *)&a5->var0;
  unint64_t var2 = a5->var2;
  [(MTLComputeCommandEncoderSPI *)baseObject dispatchThreadgroupsWithIndirectBuffer:v11 indirectBufferOffset:a4 threadsPerThreadgroup:&v24];

  uint64_t v12 = v27;
  *(_DWORD *)(v27 + 8) = -16220;
  char v13 = BYTE9(v28);
  if (BYTE9(v28) > 0x10uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v16 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v27 + 1), v16 | 0x3000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v28));
    BYTE9(v28) += 48;
  }
  *(unsigned char *)(v12 + 13) = v13;
  long long v17 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  unint64_t v21 = a5->var2;
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *(_OWORD *)(v14 + 24) = *(_OWORD *)&a5->var0;
  *((void *)v14 + 5) = v21;
  s();
  *(void *)uint64_t v22 = v23;
  *(unsigned char *)(v22 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v22);
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = *a4;
  [(MTLComputeCommandEncoderSPI *)baseObject dispatchThreadgroups:&v21 threadsPerThreadgroup:&v20];
  uint64_t v8 = v23;
  *(_DWORD *)(v23 + 8) = -16327;
  char v9 = BYTE9(v24);
  if (BYTE9(v24) > 8uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v12 = BYTE10(v24);
    ++BYTE10(v24);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v23 + 1), v12 | 0x3800000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v24));
    BYTE9(v24) += 56;
  }
  *(unsigned char *)(v8 + 13) = v9;
  char v13 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t var2 = a3->var2;
  unint64_t v16 = a4->var2;
  *(void *)uint64_t v10 = var0;
  long long v17 = *(_OWORD *)&a4->var0;
  *(_OWORD *)(v10 + 8) = *(_OWORD *)&a3->var0;
  *((void *)v10 + 3) = var2;
  *((_OWORD *)v10 + 2) = v17;
  *((void *)v10 + 6) = v16;
  s();
  *(void *)uint64_t v18 = v19;
  *(unsigned char *)(v18 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;
}

- (void)beginVirtualSubstream
{
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16339;
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
  uint64_t v10 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
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
  return (NSString *)[(MTLComputeCommandEncoderSPI *)self->_baseObject label];
}

- (unint64_t)dispatchType
{
  return (unint64_t)[(MTLComputeCommandEncoderSPI *)self->_baseObject dispatchType];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLComputeCommandEncoderSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLComputeCommandEncoder;
  uint64_t v3 = [(CaptureMTLComputeCommandEncoder *)&v7 description];
  id v4 = [(MTLComputeCommandEncoderSPI *)self->_baseObject description];
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

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 device];
    unsigned __int8 v9 = [v8 captureRaytracingEnabled];

    if ((v9 & 1) == 0)
    {
      GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLComputeCommandEncoder_setAccelerationStructure_atBufferIndex", (uint64_t)"Raytracing", 0, 0);
      baseObject = self->_baseObject;
      long long v21 = [v7 baseObject];
      [(MTLComputeCommandEncoderSPI *)baseObject setAccelerationStructure:v21 atBufferIndex:a4];

      goto LABEL_17;
    }
    [v7 touch];
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v7];
    }
  }
  else
  {
    [0 touch];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v26);
  uint64_t v11 = self->_baseObject;
  id v12 = [v7 baseObject];
  [(MTLComputeCommandEncoderSPI *)v11 setAccelerationStructure:v12 atBufferIndex:a4];

  uint64_t v13 = v27;
  *(_DWORD *)(v27 + 8) = -15623;
  char v14 = BYTE9(v28);
  if (BYTE9(v28) > 0x28uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v17 = BYTE10(v28);
    ++BYTE10(v28);
    id v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v27 + 1), v17 | 0x1800000000) + 16;
    char v14 = v17;
  }
  else
  {
    id v15 = (char *)(v13 + BYTE9(v28));
    BYTE9(v28) += 24;
  }
  *(unsigned char *)(v13 + 13) = v14;
  uint64_t v18 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v22 = (uint64_t *)[v7 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0;
  }
  *(void *)id v15 = var0;
  *((void *)v15 + 1) = v23;
  *((void *)v15 + 2) = a4;
  s();
  *(void *)uint64_t v24 = v25;
  *(unsigned char *)(v24 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;
LABEL_17:
}

- (void)enableNullBufferBinds:(BOOL)a3
{
  BOOL v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLComputeCommandEncoderSPI *)self->_baseObject enableNullBufferBinds:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15732;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    objc_super v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    objc_super v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)objc_super v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  [v7 touch];
  if (v7)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v7];
    }
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v48);
  baseObject = self->_baseObject;
  uint64_t v10 = [v7 baseObject];
  -[MTLComputeCommandEncoderSPI executeCommandsInBuffer:withRange:](baseObject, "executeCommandsInBuffer:withRange:", v10, location, length);

  uint64_t v11 = v49;
  *(_DWORD *)(v49 + 8) = -15964;
  char v12 = BYTE9(v50);
  if (BYTE9(v50) > 0x10uLL)
  {
    uint64_t v14 = *(void *)(*((void *)&v48 + 1) + 24);
    uint64_t v15 = BYTE10(v50);
    ++BYTE10(v50);
    uint64_t v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v49 + 1), v15 | 0x3000000000) + 16;
    char v12 = v15;
  }
  else
  {
    uint64_t v13 = (char *)(v11 + BYTE9(v50));
    BYTE9(v50) += 48;
  }
  *(unsigned char *)(v11 + 13) = v12;
  long long v16 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v18 = (uint64_t *)[v7 traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0;
  }
  *(void *)uint64_t v13 = var0;
  *((void *)v13 + 1) = v19;
  *((void *)v13 + 2) = location;
  *((void *)v13 + 3) = length;
  *((void *)v13 + 4) = 0;
  *((void *)v13 + 5) = 0;
  s();
  *(void *)uint64_t v20 = v21;
  *(unsigned char *)(v20 + 8) = BYTE8(v50);
  *(unsigned char *)(v49 + 15) |= 8u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  unsigned int v23 = [WeakRetained isCapturing];

  if (v23)
  {
    id v24 = v7;
    uint64_t v25 = MTLIndirectCommandBuffer_descriptor((uint64_t)[v24 traceStream]);
    long long v26 = MakeMTLIndirectCommandBufferDescriptorWithoutResourceIndex(v25);
    uint64_t FuncSnapshot = CaptureFindFuncSnapshot(v24, (uint64_t)self->_snapshotMap);
    if (FuncSnapshot)
    {
      long long v29 = (void *)FuncSnapshot;
      id v30 = 0;
      v40 = 0;
      SnapshotMemory = *(char **)(FuncSnapshot + 8);
    }
    else
    {
      id v47 = 0;
      v40 = CreateIndirectComputeCommandBufferSnapshot(self, v24, v26, &v47);
      id v30 = v47;
      SnapshotMemory = AllocateSnapshotMemory((uint64_t)&v48, v25, (int)[v24 size]);
      pool = self->_pool;
      ht = self->_snapshotMap;
      id v33 = [v24 streamReference];
      long long v29 = apr_palloc(pool, 0x18uLL);
      *long long v29 = v33;
      apr_hash_set(ht, v29, 8, v29);
      v29[1] = SnapshotMemory;
      v29[2] = *(void *)v49;
    }
    RestoreComputeCommandEncoder((uint64_t)self, v28);
    v13[40] = SnapshotMemory[8];
    *((void *)v13 + 4) = v29[2];
    id v34 = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
    long long v35 = DEVICEOBJECT(v34);

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = __69__CaptureMTLComputeCommandEncoder_executeCommandsInBuffer_withRange___block_invoke;
    v42[3] = &unk_221D08;
    id v43 = v30;
    id v44 = v40;
    id v45 = v26;
    v46 = SnapshotMemory;
    id v36 = v26;
    id v37 = v40;
    id v38 = v30;
    [v35 addCompletedHandler:v42];
  }
}

void __69__CaptureMTLComputeCommandEncoder_executeCommandsInBuffer_withRange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) length];
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    BOOL v3 = GTMTLDecodeIndirectCommandBuffer(v2, *(void **)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4) {
      uint64_t v5 = (void *)(v4 + 16);
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v3;
    memcpy(v5, [v6 bytes], (size_t)[v6 length]);
  }
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  [v7 touch];
  if (v7)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v7];
    }
  }
  [v8 touch];
  if (v8)
  {
    uint64_t v10 = self->_retainedObjects;
    if (v10) {
      [(NSMutableSet *)v10 addObject:v8];
    }
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v75 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v75);
  baseObject = self->_baseObject;
  char v12 = [v7 baseObject];
  uint64_t v13 = [v8 baseObject];
  [(MTLComputeCommandEncoderSPI *)baseObject executeCommandsInBuffer:v12 indirectBuffer:v13 indirectBufferOffset:a5];

  uint64_t v14 = v76;
  *(_DWORD *)(v76 + 8) = -15963;
  char v15 = BYTE9(v77);
  if (BYTE9(v77) > 0x10uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v75 + 1) + 24);
    uint64_t v18 = BYTE10(v77);
    ++BYTE10(v77);
    long long v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v76 + 1), v18 | 0x3000000000) + 16;
    char v15 = v18;
  }
  else
  {
    long long v16 = (char *)(v14 + BYTE9(v77));
    BYTE9(v77) += 48;
  }
  *(unsigned char *)(v14 + 13) = v15;
  uint64_t v19 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v21 = (uint64_t *)[v7 traceStream];
  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0;
  }
  unsigned int v23 = (uint64_t *)[v8 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0;
  }
  *(void *)long long v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = v24;
  *((void *)v16 + 3) = a5;
  *((void *)v16 + 4) = 0;
  *((void *)v16 + 5) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v77);
  *(unsigned char *)(v76 + 15) |= 8u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  unsigned int v28 = [WeakRetained isCapturing];

  if (v28)
  {
    p_captureCommandBuffer = &self->_captureCommandBuffer;
    id v29 = v7;
    uint64_t v30 = MTLIndirectCommandBuffer_descriptor((uint64_t)[v29 traceStream]);
    char v31 = MakeMTLIndirectCommandBufferDescriptorWithoutResourceIndex(v30);
    uint64_t FuncSnapshot = CaptureFindFuncSnapshot(v29, (uint64_t)self->_snapshotMap);
    v63 = v31;
    v64 = v29;
    id v59 = v7;
    if (FuncSnapshot)
    {
      id v34 = (void *)FuncSnapshot;
      id v61 = 0;
      v62 = 0;
      v60 = *(char **)(FuncSnapshot + 8);
    }
    else
    {
      id v74 = 0;
      v62 = CreateIndirectComputeCommandBufferSnapshot(self, v29, v31, &v74);
      id v61 = v74;
      SnapshotMemory = AllocateSnapshotMemory((uint64_t)&v75, v30, (int)[v29 size]);
      pool = self->_pool;
      snapshotMap = self->_snapshotMap;
      id v38 = [v29 streamReference];
      id v34 = apr_palloc(pool, 0x18uLL);
      void *v34 = v38;
      apr_hash_set(snapshotMap, v34, 8, v34);
      v60 = SnapshotMemory;
      v34[1] = SnapshotMemory;
      v34[2] = *(void *)v76;
    }
    RestoreComputeCommandEncoder((uint64_t)self, v33);
    v39 = self;
    id v40 = v8;
    v41 = [(CaptureMTLComputeCommandEncoder *)v39 device];
    v42 = DEVICEOBJECT(v40);

    id v43 = [v42 device];
    id v44 = [v43 newBufferWithLength:8 options:0];
    id v45 = DEVICEOBJECT(v39);

    [v45 setBuffer:v44 offset:0 atIndex:0];
    [v45 setBuffer:v42 offset:a5 atIndex:1];
    v46 = v41;
    id v47 = [v41 computePipelineCopyBuffer];
    [v45 setComputePipelineState:v47];
    unsigned int v48 = [v43 supportsNonUniformThreadgroupSize];
    long long v79 = xmmword_1DA280;
    uint64_t v80 = 1;
    if (v48)
    {
      *(void *)v78 = [v47 threadExecutionWidth];
      *(int64x2_t *)&v78[8] = vdupq_n_s64(1uLL);
      [v45 dispatchThreads:&v79 threadsPerThreadgroup:v78];
    }
    else
    {
      *(int64x2_t *)v78 = vdupq_n_s64(1uLL);
      *(void *)&v78[16] = 1;
      [v45 dispatchThreadgroups:&v79 threadsPerThreadgroup:v78];
    }

    uint64_t v49 = *(void *)(*((void *)&v75 + 1) + 24);
    uint64_t v50 = BYTE10(v77);
    ++BYTE10(v77);
    Bytes = GTTraceMemPool_allocateBytes(v49, *((uint64_t *)&v76 + 1), v50 | 0x1000000100);
    v16[40] = v60[8];
    v16[41] = Bytes[8];
    *((void *)v16 + 4) = v34[2];
    id v52 = objc_loadWeakRetained((id *)p_captureCommandBuffer);
    v53 = DEVICEOBJECT(v52);

    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = __95__CaptureMTLComputeCommandEncoder_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset___block_invoke;
    v67[3] = &unk_221CE0;
    id v68 = v61;
    id v69 = v62;
    id v70 = v63;
    id v71 = v44;
    v72 = v60;
    v73 = Bytes;
    id v54 = v44;
    id v55 = v63;
    id v56 = v62;
    id v57 = v61;
    [v53 addCompletedHandler:v67];

    id v7 = v59;
  }
}

float __95__CaptureMTLComputeCommandEncoder_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) length];
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    BOOL v3 = GTMTLDecodeIndirectCommandBuffer(v2, *(void **)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 64);
    if (v4) {
      uint64_t v5 = (void *)(v4 + 16);
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v3;
    memcpy(v5, [v6 bytes], (size_t)[v6 length]);
  }
  id v7 = [*(id *)(a1 + 56) contents];
  uint64_t v8 = *(void *)(a1 + 72);
  if (v8) {
    uint64_t v9 = (_OWORD *)(v8 + 16);
  }
  else {
    uint64_t v9 = 0;
  }
  *(void *)&long long v10 = *v7;
  *((void *)&v10 + 1) = HIDWORD(*v7);
  LODWORD(result) = *v7;
  *uint64_t v9 = v10;
  return result;
}

- (MTLComputeCommandEncoder)baseObject
{
  return self->_baseObject;
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16338;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    uint64_t v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLComputeCommandEncoder *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  apr_pool_destroy(self->_pool);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLComputeCommandEncoder;
  [(CaptureMTLComputeCommandEncoder *)&v12 dealloc];
}

- (CaptureMTLComputeCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CaptureMTLComputeCommandEncoder;
  uint64_t v9 = [(CaptureMTLComputeCommandEncoder *)&v20 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = [v8 device];
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (CaptureMTLDevice *)v11;

    long long v13 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v13;
    long long v14 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openEncoderStream((uint64_t)v13, (unint64_t)v14, *((void *)[v8 traceStream] + 3));

    objc_storeWeak((id *)&v10->_captureCommandBuffer, v8);
    uint64_t v15 = [v8 retainedObjects];
    retainedObjects = v10->_retainedObjects;
    v10->_retainedObjects = (NSMutableSet *)v15;

    uint64_t v17 = v10->_retainedObjects;
    uint64_t v18 = DEVICEOBJECT(v10->_baseObject);
    [(NSMutableSet *)v17 addObject:v18];

    apr_pool_create_ex(&v10->_pool, 0, 0, 0);
    v10->_snapshotMap = apr_hash_make(v10->_pool);
  }

  return v10;
}

@end