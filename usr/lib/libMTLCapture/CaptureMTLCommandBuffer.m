@interface CaptureMTLCommandBuffer
- (BOOL)commitAndWaitUntilSubmitted;
- (BOOL)commitAndWaitUntilSubmittedWithDeadline:(unint64_t)a3;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isCapturing;
- (BOOL)isCommited;
- (BOOL)isEnqueued;
- (BOOL)isProfilingEnabled;
- (BOOL)presentDrawableUsed;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)retainedReferences;
- (CaptureMTLCommandBuffer)initWithBaseObject:(id)a3 captureCommandQueue:(id)a4 funcRef:(GTTraceFuncRef)a5;
- (CaptureMTLCommandQueue)captureCommandQueue;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLBuffer)privateData;
- (MTLBuffer)privateLoggingBuffer;
- (MTLCommandBuffer)baseObject;
- (MTLCommandQueue)commandQueue;
- (MTLDeadlineProfile)deadlineProfile;
- (MTLDevice)device;
- (MTLLogContainer)logs;
- (MTLSharedEvent)accelerationStructureDescriptorProcessEvent;
- (NSDictionary)profilingResults;
- (NSError)error;
- (NSMutableDictionary)userDictionary;
- (NSMutableSet)retainedObjects;
- (NSString)description;
- (NSString)label;
- (double)GPUEndTime;
- (double)GPUStartTime;
- (double)kernelEndTime;
- (double)kernelStartTime;
- (id)accelerationStructureCommandEncoder;
- (id)accelerationStructureCommandEncoderWithDescriptor:(id)a3;
- (id)blitCommandEncoder;
- (id)blitCommandEncoderWithDescriptor:(id)a3;
- (id)computeCommandEncoder;
- (id)computeCommandEncoderWithDescriptor:(id)a3;
- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3;
- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3 substreamCount:(unsigned int)a4;
- (id)debugCommandEncoder;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3;
- (id)renderCommandEncoderWithDescriptor:(id)a3;
- (id)resourceStateCommandEncoder;
- (id)resourceStateCommandEncoderWithDescriptor:(id)a3;
- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4;
- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (unint64_t)accelerationStructureCommandEncoderPreamble;
- (unint64_t)errorOptions;
- (unint64_t)getListIndex;
- (unint64_t)globalTraceObjectID;
- (unint64_t)privateDataOffset;
- (unint64_t)status;
- (unint64_t)streamReference;
- (void)_encodeDownloadPoint;
- (void)_preCommitWithIndex:(unint64_t)a3;
- (void)addCompletedHandler:(id)a3;
- (void)addPurgedHeap:(id)a3;
- (void)addPurgedResource:(id)a3;
- (void)addRequestsToDownloadQueue:(id)a3 withIndex:(unint64_t)a4;
- (void)addScheduledHandler:(id)a3;
- (void)commit;
- (void)commitAndHold;
- (void)commitWithDeadline:(unint64_t)a3;
- (void)configWithCommandBufferDescriptor:(id)a3;
- (void)dealloc;
- (void)debugBufferContentsWithLength:(unint64_t *)a3;
- (void)dropResourceGroups:(const void *)a3 count:(unint64_t)a4;
- (void)encodeCacheHintFinalize:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5;
- (void)encodeCacheHintTag:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5;
- (void)encodeConditionalAbortEvent:(id)a3;
- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 value:(unint64_t)a5 forIndex:(unint64_t)a6;
- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 values:(const unint64_t *)a5 indices:(const unint64_t *)a6 count:(unint64_t)a7;
- (void)encodeDashboardTagForResourceGroup:(id)a3;
- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4;
- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4 agentMask:(unint64_t)a5;
- (void)encodeSignalEventScheduled:(id)a3 value:(unint64_t)a4;
- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4;
- (void)enqueue;
- (void)popDebugGroup;
- (void)presentDrawable:(id)a3;
- (void)presentDrawable:(id)a3 afterMinimumDuration:(double)a4;
- (void)presentDrawable:(id)a3 atTime:(double)a4;
- (void)presentDrawable:(id)a3 options:(id)a4;
- (void)pushDebugGroup:(id)a3;
- (void)setIsCommited:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setPrivateData:(id)a3;
- (void)setPrivateDataOffset:(unint64_t)a3;
- (void)setPrivateLoggingBuffer:(id)a3;
- (void)setProfilingEnabled:(BOOL)a3;
- (void)setResourceGroups:(const void *)a3 count:(unint64_t)a4;
- (void)setResponsibleTaskIDs:(const unsigned int *)a3 count:(unsigned int)a4;
- (void)touch;
- (void)trackPresent:(id)a3;
- (void)unionRetainSet:(id)a3;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)waitUntilCompleted;
- (void)waitUntilScheduled;
@end

@implementation CaptureMTLCommandBuffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedObjects, 0);
  objc_storeStrong((id *)&self->_completedDispatchArray, 0);
  objc_storeStrong((id *)&self->_scheduledDispatchArray, 0);
  objc_storeStrong((id *)&self->_downloadPoints, 0);
  objc_storeStrong((id *)&self->_accelerationStructureDescriptorProcessEvent, 0);
  objc_storeStrong((id *)&self->_downloadEvent, 0);
  objc_storeStrong((id *)&self->_baseObject, 0);

  objc_storeStrong((id *)&self->_captureCommandQueue, 0);
}

- (BOOL)presentDrawableUsed
{
  return self->_presentDrawableUsed;
}

- (void)setIsCommited:(BOOL)a3
{
  self->_isCommited = a3;
}

- (BOOL)isCommited
{
  return self->_isCommited;
}

- (BOOL)isCapturing
{
  return self->_isCapturing;
}

- (NSMutableSet)retainedObjects
{
  return self->_retainedObjects;
}

- (void)waitUntilScheduled
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLCommandBufferSPI *)self->_baseObject waitUntilScheduled];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16357;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  v8 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
}

- (void)setResponsibleTaskIDs:(const unsigned int *)a3 count:(unsigned int)a4
{
}

- (void)setResourceGroups:(const void *)a3 count:(unint64_t)a4
{
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  uint64_t v7 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v26);
  baseObject = self->_baseObject;
  unint64_t v9 = 8 * a4;
  __chkstk_darwin(v7, v10);
  bzero((char *)&v26 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  if (a4)
  {
    uint64_t v11 = a3;
    long long v12 = (void *)((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v13 = a4;
    do
    {
      long long v14 = (void *)*v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }
    while (v13);
  }
  [(MTLCommandBufferSPI *)baseObject setResourceGroups:(char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) count:a4];
  uint64_t v15 = v27;
  *(_DWORD *)(v27 + 8) = -15898;
  char v16 = BYTE9(v28);
  if (BYTE9(v28) > 0x28uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v19 = BYTE10(v28);
    ++BYTE10(v28);
    v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v27 + 1), v19 | 0x1800000000) + 16;
    char v16 = v19;
  }
  else
  {
    v17 = (char *)(v15 + BYTE9(v28));
    BYTE9(v28) += 24;
  }
  *(unsigned char *)(v15 + 13) = v16;
  v20 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v20, v21);
  bzero((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  char v23 = StreamArray((uint64_t)&v26, (long long *)((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, a4);
  *(void *)v17 = var0;
  *((void *)v17 + 1) = a4;
  v17[16] = v23;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  s();
  *(void *)uint64_t v24 = v25;
  *(unsigned char *)(v24 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;
}

- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  baseObject = self->_baseObject;
  unint64_t v9 = unwrapMTLRenderPassDescriptor_(a3, self->_retainedObjects);
  uint64_t v10 = [(MTLCommandBufferSPI *)baseObject sampledRenderCommandEncoderWithDescriptor:v9 programInfoBuffer:a4 capacity:a5];

  if (v10) {
    uint64_t v11 = [[CaptureMTLRenderCommandEncoder alloc] initWithBaseObject:v10 captureCommandBuffer:self];
  }
  else {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  v5 = [(MTLCommandBufferSPI *)self->_baseObject sampledComputeCommandEncoderWithProgramInfoBuffer:a3 capacity:a4];
  if (v5) {
    uint64_t v6 = [[CaptureMTLComputeCommandEncoder alloc] initWithBaseObject:v5 captureCommandBuffer:self];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  uint64_t v6 = [(MTLCommandBufferSPI *)self->_baseObject sampledComputeCommandEncoderWithDispatchType:a3 programInfoBuffer:a4 capacity:a5];
  if (v6) {
    uint64_t v7 = [[CaptureMTLComputeCommandEncoder alloc] initWithBaseObject:v6 captureCommandBuffer:self];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  id v8 = a3;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  traceContext = self->_traceContext;
  long long v37 = (unint64_t)traceContext;
  *(void *)&long long v38 = 0;
  *((void *)&v38 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  *uint64_t v10 = v13;
  *(void *)&long long v39 = v12;
  BYTE8(v39) = *((unsigned char *)v10 + 8);
  *(_WORD *)((char *)&v39 + 9) = 16400;
  *(_DWORD *)((char *)&v39 + 11) = 0;
  HIBYTE(v39) = 0;
  baseObject = self->_baseObject;
  uint64_t v15 = unwrapMTLComputePassDescriptor_(v8, self->_retainedObjects);
  char v16 = [(MTLCommandBufferSPI *)baseObject sampledComputeCommandEncoderWithDescriptor:v15 programInfoBuffer:a4 capacity:a5];

  if (v16) {
    v17 = [[CaptureMTLComputeCommandEncoder alloc] initWithBaseObject:v16 captureCommandBuffer:self];
  }
  else {
    v17 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v37, (uint64_t)[(CaptureMTLComputeCommandEncoder *)v17 traceStream]);
  uint64_t v18 = v38;
  *(_DWORD *)(v38 + 8) = -15584;
  char v19 = BYTE9(v39);
  v36 = a4;
  if (BYTE9(v39) > 0x20uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v37 + 1) + 24);
    uint64_t v22 = BYTE10(v39);
    ++BYTE10(v39);
    v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v38 + 1), v22 | 0x2000000000) + 16;
    char v19 = v22;
  }
  else
  {
    v20 = (char *)(v18 + BYTE9(v39));
    BYTE9(v39) += 32;
  }
  *(unsigned char *)(v18 + 13) = v19;
  char v23 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v25 = [(CaptureMTLComputeCommandEncoder *)v17 traceStream];
  if (v25) {
    unint64_t v26 = v25->var0;
  }
  else {
    unint64_t v26 = 0;
  }
  char v27 = SaveMTLComputePassDescriptor((uint64_t)&v37, v8);
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v28 = GTTraceEncoder_storeBlob((uint64_t)&v37, v36, a5);
  }
  else {
    char v28 = 0;
  }
  *(void *)v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = a5;
  v20[24] = v27;
  v20[25] = v28;
  *(_DWORD *)(v20 + 26) = 0;
  *((_WORD *)v20 + 15) = 0;
  traceStream = self->_traceStream;
  *(unsigned char *)(v38 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v30 = v38;
  long long v31 = *(_OWORD *)(v38 + 16);
  long long v33 = *(_OWORD *)(v38 + 32);
  long long v32 = *(_OWORD *)(v38 + 48);
  _OWORD *v34 = *(_OWORD *)v38;
  v34[1] = v31;
  v34[2] = v33;
  v34[3] = v32;
  *uint64_t v11 = v39;
  *((unsigned char *)v11 + 8) = BYTE8(v39);
  *(unsigned char *)(v30 + 15) |= 8u;

  return v17;
}

- (id)resourceStateCommandEncoderWithDescriptor:(id)a3
{
  id v4 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  traceContext = self->_traceContext;
  long long v31 = (unint64_t)traceContext;
  *(void *)&long long v32 = 0;
  *((void *)&v32 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v7 = v6;
  uint64_t v8 = *v6;
  *uint64_t v6 = v9;
  *(void *)&long long v33 = v8;
  BYTE8(v33) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v33 + 9) = 16400;
  *(_DWORD *)((char *)&v33 + 11) = 0;
  HIBYTE(v33) = 0;
  baseObject = self->_baseObject;
  uint64_t v11 = unwrapMTLResourceStatePassDescriptor_(v4, self->_retainedObjects);
  uint64_t v12 = [(MTLCommandBufferSPI *)baseObject resourceStateCommandEncoderWithDescriptor:v11];

  if (v12) {
    uint64_t v13 = [[CaptureMTLResourceStateCommandEncoder alloc] initWithBaseObject:v12 captureCommandBuffer:self];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v31, (uint64_t)[(CaptureMTLResourceStateCommandEncoder *)v13 traceStream]);
  uint64_t v14 = v32;
  *(_DWORD *)(v32 + 8) = -15585;
  char v15 = BYTE9(v33);
  if (BYTE9(v33) > 0x28uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 24);
    uint64_t v18 = BYTE10(v33);
    ++BYTE10(v33);
    char v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v32 + 1), v18 | 0x1800000000) + 16;
    char v15 = v18;
  }
  else
  {
    char v16 = (char *)(v14 + BYTE9(v33));
    BYTE9(v33) += 24;
  }
  *(unsigned char *)(v14 + 13) = v15;
  char v19 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v21 = [(CaptureMTLResourceStateCommandEncoder *)v13 traceStream];
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0;
  }
  char v23 = SaveMTLResourceStatePassDescriptor((uint64_t)&v31, v4);
  *(void *)char v16 = var0;
  *((void *)v16 + 1) = v22;
  v16[16] = v23;
  *(_DWORD *)(v16 + 17) = 0;
  *((_DWORD *)v16 + 5) = 0;
  traceStream = self->_traceStream;
  *(unsigned char *)(v32 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v25 = v32;
  long long v26 = *(_OWORD *)(v32 + 16);
  long long v28 = *(_OWORD *)(v32 + 32);
  long long v27 = *(_OWORD *)(v32 + 48);
  _OWORD *v29 = *(_OWORD *)v32;
  v29[1] = v26;
  v29[2] = v28;
  v29[3] = v27;
  *uint64_t v7 = v33;
  *((unsigned char *)v7 + 8) = BYTE8(v33);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v13;
}

- (id)resourceStateCommandEncoder
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  long long v26 = (unint64_t)traceContext;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  v5 = v4;
  uint64_t v6 = *v4;
  *id v4 = v7;
  *(void *)&long long v28 = v6;
  BYTE8(v28) = *((unsigned char *)v4 + 8);
  *(_WORD *)((char *)&v28 + 9) = 16400;
  *(_DWORD *)((char *)&v28 + 11) = 0;
  HIBYTE(v28) = 0;
  uint64_t v8 = [(MTLCommandBufferSPI *)self->_baseObject resourceStateCommandEncoder];
  if (v8) {
    uint64_t v9 = [[CaptureMTLResourceStateCommandEncoder alloc] initWithBaseObject:v8 captureCommandBuffer:self];
  }
  else {
    uint64_t v9 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLResourceStateCommandEncoder *)v9 traceStream]);
  uint64_t v10 = v27;
  *(_DWORD *)(v27 + 8) = -15870;
  char v11 = BYTE9(v28);
  if (BYTE9(v28) > 0x30uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v14 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v27 + 1), v14 | 0x1000000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v28));
    BYTE9(v28) += 16;
  }
  *(unsigned char *)(v10 + 13) = v11;
  char v15 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = [(CaptureMTLResourceStateCommandEncoder *)v9 traceStream];
  if (v17) {
    unint64_t v18 = v17->var0;
  }
  else {
    unint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  traceStream = self->_traceStream;
  *(unsigned char *)(v27 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v20 = v27;
  long long v21 = *(_OWORD *)(v27 + 16);
  long long v23 = *(_OWORD *)(v27 + 32);
  long long v22 = *(_OWORD *)(v27 + 48);
  *uint64_t v24 = *(_OWORD *)v27;
  v24[1] = v21;
  v24[2] = v23;
  v24[3] = v22;
  uint64_t *v5 = v28;
  *((unsigned char *)v5 + 8) = BYTE8(v28);
  *(unsigned char *)(v20 + 15) |= 8u;

  return v9;
}

- (id)renderCommandEncoderWithDescriptor:(id)a3
{
  id v4 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  traceContext = self->_traceContext;
  long long v31 = (unint64_t)traceContext;
  *(void *)&long long v32 = 0;
  *((void *)&v32 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v7 = v6;
  uint64_t v8 = *v6;
  *uint64_t v6 = v9;
  *(void *)&long long v33 = v8;
  BYTE8(v33) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v33 + 9) = 16400;
  *(_DWORD *)((char *)&v33 + 11) = 0;
  HIBYTE(v33) = 0;
  baseObject = self->_baseObject;
  char v11 = unwrapMTLRenderPassDescriptor_(v4, self->_retainedObjects);
  uint64_t v12 = [(MTLCommandBufferSPI *)baseObject renderCommandEncoderWithDescriptor:v11];

  if (v12) {
    uint64_t v13 = [[CaptureMTLRenderCommandEncoder alloc] initWithBaseObject:v12 captureCommandBuffer:self];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v31, (uint64_t)[(CaptureMTLRenderCommandEncoder *)v13 traceStream]);
  uint64_t v14 = v32;
  *(_DWORD *)(v32 + 8) = -16353;
  char v15 = BYTE9(v33);
  if (BYTE9(v33) > 0x28uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 24);
    uint64_t v18 = BYTE10(v33);
    ++BYTE10(v33);
    char v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v32 + 1), v18 | 0x1800000000) + 16;
    char v15 = v18;
  }
  else
  {
    char v16 = (char *)(v14 + BYTE9(v33));
    BYTE9(v33) += 24;
  }
  *(unsigned char *)(v14 + 13) = v15;
  char v19 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v21 = [(CaptureMTLRenderCommandEncoder *)v13 traceStream];
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0;
  }
  char v23 = SaveMTLRenderPassDescriptor((uint64_t)&v31, v4);
  *(void *)char v16 = var0;
  *((void *)v16 + 1) = v22;
  v16[16] = v23;
  *(_DWORD *)(v16 + 17) = 0;
  *((_DWORD *)v16 + 5) = 0;
  traceStream = self->_traceStream;
  *(unsigned char *)(v32 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v25 = v32;
  long long v26 = *(_OWORD *)(v32 + 16);
  long long v28 = *(_OWORD *)(v32 + 32);
  long long v27 = *(_OWORD *)(v32 + 48);
  _OWORD *v29 = *(_OWORD *)v32;
  v29[1] = v26;
  v29[2] = v28;
  v29[3] = v27;
  *uint64_t v7 = v33;
  *((unsigned char *)v7 + 8) = BYTE8(v33);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v13;
}

- (void)pushDebugGroup:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLCommandBufferSPI *)self->_baseObject pushDebugGroup:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16065;
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
  uint64_t v10 = [(CaptureMTLCommandBuffer *)self traceStream];
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

- (void)presentDrawable:(id)a3 options:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLCommandBuffer_presentDrawable_options", (uint64_t)"Present SPI", 0, 0);
  [v11 touch];
  uint64_t v7 = v11;
  if (v11)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      [(NSMutableSet *)retainedObjects addObject:v11];
      uint64_t v7 = v11;
    }
  }
  baseObject = self->_baseObject;
  uint64_t v10 = [v7 baseObject];
  [(MTLCommandBufferSPI *)baseObject presentDrawable:v10 options:v6];
}

- (void)popDebugGroup
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLCommandBufferSPI *)self->_baseObject popDebugGroup];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16064;
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
  uint64_t v8 = [(CaptureMTLCommandBuffer *)self traceStream];
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

- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3
{
  id v4 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  traceContext = self->_traceContext;
  long long v31 = (unint64_t)traceContext;
  *(void *)&long long v32 = 0;
  *((void *)&v32 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v7 = v6;
  uint64_t v8 = *v6;
  *uint64_t v6 = v9;
  *(void *)&long long v33 = v8;
  BYTE8(v33) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v33 + 9) = 16400;
  *(_DWORD *)((char *)&v33 + 11) = 0;
  HIBYTE(v33) = 0;
  baseObject = self->_baseObject;
  uint64_t v11 = unwrapMTLRenderPassDescriptor_(v4, self->_retainedObjects);
  long long v12 = [(MTLCommandBufferSPI *)baseObject parallelRenderCommandEncoderWithDescriptor:v11];

  if (v12) {
    long long v13 = [[CaptureMTLParallelRenderCommandEncoder alloc] initWithBaseObject:v12 captureCommandBuffer:self];
  }
  else {
    long long v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v31, (uint64_t)[(CaptureMTLParallelRenderCommandEncoder *)v13 traceStream]);
  uint64_t v14 = v32;
  *(_DWORD *)(v32 + 8) = -16351;
  char v15 = BYTE9(v33);
  if (BYTE9(v33) > 0x28uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 24);
    uint64_t v18 = BYTE10(v33);
    ++BYTE10(v33);
    size_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v32 + 1), v18 | 0x1800000000) + 16;
    char v15 = v18;
  }
  else
  {
    size_t v16 = (char *)(v14 + BYTE9(v33));
    BYTE9(v33) += 24;
  }
  *(unsigned char *)(v14 + 13) = v15;
  long long v19 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v21 = [(CaptureMTLParallelRenderCommandEncoder *)v13 traceStream];
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0;
  }
  char v23 = SaveMTLRenderPassDescriptor((uint64_t)&v31, v4);
  *(void *)size_t v16 = var0;
  *((void *)v16 + 1) = v22;
  v16[16] = v23;
  *(_DWORD *)(v16 + 17) = 0;
  *((_DWORD *)v16 + 5) = 0;
  traceStream = self->_traceStream;
  *(unsigned char *)(v32 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v25 = v32;
  long long v26 = *(_OWORD *)(v32 + 16);
  long long v28 = *(_OWORD *)(v32 + 32);
  long long v27 = *(_OWORD *)(v32 + 48);
  _OWORD *v29 = *(_OWORD *)v32;
  v29[1] = v26;
  v29[2] = v28;
  v29[3] = v27;
  *uint64_t v7 = v33;
  *((unsigned char *)v7 + 8) = BYTE8(v33);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v13;
}

- (void)encodeSignalEventScheduled:(id)a3 value:(unint64_t)a4
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
  [(MTLCommandBufferSPI *)baseObject encodeSignalEventScheduled:v9 value:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15217;
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
  char v15 = [(CaptureMTLCommandBuffer *)self traceStream];
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

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4 agentMask:(unint64_t)a5
{
  id v12 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLCommandBuffer_encodeSignalEvent_value_agentMask", (uint64_t)"Shared event agent mask", 0, 0);
  [v12 touch];
  uint64_t v8 = v12;
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      [(NSMutableSet *)retainedObjects addObject:v12];
      uint64_t v8 = v12;
    }
  }
  baseObject = self->_baseObject;
  char v11 = [v8 baseObject];
  [(MTLCommandBufferSPI *)baseObject encodeSignalEvent:v11 value:a4 agentMask:a5];
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
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
  [(MTLCommandBufferSPI *)baseObject encodeSignalEvent:v9 value:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15990;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    id v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    id v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  char v15 = [(CaptureMTLCommandBuffer *)self traceStream];
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
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)encodeDashboardTagForResourceGroup:(id)a3
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
  [(MTLCommandBufferSPI *)baseObject encodeDashboardTagForResourceGroup:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15500;
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
  uint64_t v13 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v15 = (uint64_t *)[v4 traceStream];
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

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 values:(const unint64_t *)a5 indices:(const unint64_t *)a6 count:(unint64_t)a7
{
  id v12 = a3;
  [v12 touch];
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v12];
    }
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v29);
  baseObject = self->_baseObject;
  char v15 = [v12 baseObject];
  [(MTLCommandBufferSPI *)baseObject encodeDashboardFinalizeForResourceGroup:v15 dashboard:a4 values:a5 indices:a6 count:a7];

  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -15410;
  char v17 = BYTE9(v31);
  if (BYTE9(v31) > 0x18uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 24);
    uint64_t v20 = BYTE10(v31);
    ++BYTE10(v31);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v30 + 1), v20 | 0x2800000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v31));
    BYTE9(v31) += 40;
  }
  *(unsigned char *)(v16 + 13) = v17;
  long long v21 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v23 = (uint64_t *)[v12 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0;
  }
  char v25 = GTTraceEncoder_storeBytes((uint64_t)&v29, (void *)a5, 8 * a7);
  char v26 = GTTraceEncoder_storeBytes((uint64_t)&v29, (void *)a6, 8 * a7);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  *((void *)v18 + 3) = a7;
  v18[32] = v25;
  v18[33] = v26;
  *(_DWORD *)(v18 + 34) = 0;
  *((_WORD *)v18 + 19) = 0;
  s();
  *(void *)uint64_t v27 = v28;
  *(unsigned char *)(v27 + 8) = BYTE8(v31);
  *(unsigned char *)(v30 + 15) |= 8u;
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 value:(unint64_t)a5 forIndex:(unint64_t)a6
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
  [(MTLCommandBufferSPI *)baseObject encodeDashboardFinalizeForResourceGroup:v13 dashboard:a4 value:a5 forIndex:a6];

  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15501;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x18uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2800000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 40;
  }
  *(unsigned char *)(v14 + 13) = v15;
  uint64_t v19 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v21 = (uint64_t *)[v10 traceStream];
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
  *((void *)v16 + 4) = a6;
  s();
  *(void *)uint64_t v23 = v24;
  *(unsigned char *)(v23 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;
}

- (void)encodeConditionalAbortEvent:(id)a3
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLCommandBuffer_encodeConditionalAbortEvent", (uint64_t)"Conditional abort", 0, 0);
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
  uint64_t v7 = [v4 baseObject];
  [(MTLCommandBufferSPI *)baseObject encodeConditionalAbortEvent:v7];
}

- (void)encodeCacheHintTag:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5
{
  id v6 = a4;
  RetainArray(self->_retainedObjects, (id *)a4, a5);
  baseObject = self->_baseObject;
  __chkstk_darwin(v10, 8 * a5);
  id v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v12, v11);
  if (a5)
  {
    uint64_t v13 = v12;
    unint64_t v14 = a5;
    do
    {
      char v15 = (void *)*v6++;
      *(void *)uint64_t v13 = [v15 baseObject];
      v13 += 8;
      --v14;
    }
    while (v14);
  }
  [(MTLCommandBufferSPI *)baseObject encodeCacheHintTag:a3 resourceGroups:v12 count:a5];
}

- (void)encodeCacheHintFinalize:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5
{
  id v6 = a4;
  RetainArray(self->_retainedObjects, (id *)a4, a5);
  baseObject = self->_baseObject;
  __chkstk_darwin(v10, 8 * a5);
  id v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v12, v11);
  if (a5)
  {
    uint64_t v13 = v12;
    unint64_t v14 = a5;
    do
    {
      char v15 = (void *)*v6++;
      *(void *)uint64_t v13 = [v15 baseObject];
      v13 += 8;
      --v14;
    }
    while (v14);
  }
  [(MTLCommandBufferSPI *)baseObject encodeCacheHintFinalize:a3 resourceGroups:v12 count:a5];
}

- (void)dropResourceGroups:(const void *)a3 count:(unint64_t)a4
{
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  uint64_t v7 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v26);
  baseObject = self->_baseObject;
  unint64_t v9 = 8 * a4;
  __chkstk_darwin(v7, v10);
  bzero((char *)&v26 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  if (a4)
  {
    size_t v11 = a3;
    id v12 = (void *)((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v13 = a4;
    do
    {
      unint64_t v14 = (void *)*v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }
    while (v13);
  }
  [(MTLCommandBufferSPI *)baseObject dropResourceGroups:(char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) count:a4];
  uint64_t v15 = v27;
  *(_DWORD *)(v27 + 8) = -15897;
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
  uint64_t v20 = [(CaptureMTLCommandBuffer *)self traceStream];
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

- (void)debugBufferContentsWithLength:(unint64_t *)a3
{
  return [(MTLCommandBufferSPI *)self->_baseObject debugBufferContentsWithLength:a3];
}

- (void)configWithCommandBufferDescriptor:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLCommandBuffer_configWithCommandBufferDescriptor", (uint64_t)"Shader logging", 0, 0);
  baseObject = self->_baseObject;
  unwrapMTLCommandBufferDescriptor(v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(MTLCommandBufferSPI *)baseObject configWithCommandBufferDescriptor:v6];
}

- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3 substreamCount:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v20);
  uint64_t v7 = [(MTLCommandBufferSPI *)self->_baseObject computeCommandEncoderWithDispatchType:a3 substreamCount:v4];
  uint64_t v8 = v21;
  *(_DWORD *)(v21 + 8) = -15712;
  char v9 = BYTE9(v22);
  if (BYTE9(v22) > 0x20uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 24);
    uint64_t v12 = BYTE10(v22);
    ++BYTE10(v22);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v21 + 1), v12 | 0x2000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v22));
    BYTE9(v22) += 32;
  }
  *(unsigned char *)(v8 + 13) = v9;
  unint64_t v13 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v15 = (uint64_t *)[v7 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  *((void *)v10 + 2) = a3;
  *((_DWORD *)v10 + 6) = v4;
  *((_DWORD *)v10 + 7) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v22);
  *(unsigned char *)(v21 + 15) |= 8u;

  return v7;
}

- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  traceContext = self->_traceContext;
  long long v28 = (unint64_t)traceContext;
  *(void *)&long long v29 = 0;
  *((void *)&v29 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v9;
  *(void *)&long long v30 = v8;
  BYTE8(v30) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v30 + 9) = 16400;
  *(_DWORD *)((char *)&v30 + 11) = 0;
  HIBYTE(v30) = 0;
  uint64_t v10 = -[MTLCommandBufferSPI computeCommandEncoderWithDispatchType:](self->_baseObject, "computeCommandEncoderWithDispatchType:");
  if (v10) {
    uint64_t v11 = [[CaptureMTLComputeCommandEncoder alloc] initWithBaseObject:v10 captureCommandBuffer:self];
  }
  else {
    uint64_t v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)[(CaptureMTLComputeCommandEncoder *)v11 traceStream]);
  uint64_t v12 = v29;
  *(_DWORD *)(v29 + 8) = -16014;
  char v13 = BYTE9(v30);
  if (BYTE9(v30) > 0x28uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v16 = BYTE10(v30);
    ++BYTE10(v30);
    unint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v29 + 1), v16 | 0x1800000000) + 16;
    char v13 = v16;
  }
  else
  {
    unint64_t v14 = (char *)(v12 + BYTE9(v30));
    BYTE9(v30) += 24;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v19 = [(CaptureMTLComputeCommandEncoder *)v11 traceStream];
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0;
  }
  *(void *)unint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a3;
  traceStream = self->_traceStream;
  *(unsigned char *)(v29 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v22 = v29;
  long long v23 = *(_OWORD *)(v29 + 16);
  long long v25 = *(_OWORD *)(v29 + 32);
  long long v24 = *(_OWORD *)(v29 + 48);
  *long long v26 = *(_OWORD *)v29;
  v26[1] = v23;
  v26[2] = v25;
  v26[3] = v24;
  *uint64_t v7 = v30;
  *((unsigned char *)v7 + 8) = BYTE8(v30);
  *(unsigned char *)(v22 + 15) |= 8u;

  return v11;
}

- (id)computeCommandEncoderWithDescriptor:(id)a3
{
  id v4 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  traceContext = self->_traceContext;
  long long v31 = (unint64_t)traceContext;
  *(void *)&long long v32 = 0;
  *((void *)&v32 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v9;
  *(void *)&long long v33 = v8;
  BYTE8(v33) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v33 + 9) = 16400;
  *(_DWORD *)((char *)&v33 + 11) = 0;
  HIBYTE(v33) = 0;
  baseObject = self->_baseObject;
  uint64_t v11 = unwrapMTLComputePassDescriptor_(v4, self->_retainedObjects);
  uint64_t v12 = [(MTLCommandBufferSPI *)baseObject computeCommandEncoderWithDescriptor:v11];

  if (v12) {
    char v13 = [[CaptureMTLComputeCommandEncoder alloc] initWithBaseObject:v12 captureCommandBuffer:self];
  }
  else {
    char v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v31, (uint64_t)[(CaptureMTLComputeCommandEncoder *)v13 traceStream]);
  uint64_t v14 = v32;
  *(_DWORD *)(v32 + 8) = -15586;
  char v15 = BYTE9(v33);
  if (BYTE9(v33) > 0x28uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 24);
    uint64_t v18 = BYTE10(v33);
    ++BYTE10(v33);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v32 + 1), v18 | 0x1800000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v33));
    BYTE9(v33) += 24;
  }
  *(unsigned char *)(v14 + 13) = v15;
  uint64_t v19 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v21 = [(CaptureMTLComputeCommandEncoder *)v13 traceStream];
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0;
  }
  char v23 = SaveMTLComputePassDescriptor((uint64_t)&v31, v4);
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  v16[16] = v23;
  *(_DWORD *)(v16 + 17) = 0;
  *((_DWORD *)v16 + 5) = 0;
  traceStream = self->_traceStream;
  *(unsigned char *)(v32 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v25 = v32;
  long long v26 = *(_OWORD *)(v32 + 16);
  long long v28 = *(_OWORD *)(v32 + 32);
  long long v27 = *(_OWORD *)(v32 + 48);
  _OWORD *v29 = *(_OWORD *)v32;
  v29[1] = v26;
  v29[2] = v28;
  v29[3] = v27;
  *uint64_t v7 = v33;
  *((unsigned char *)v7 + 8) = BYTE8(v33);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v13;
}

- (id)computeCommandEncoder
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  long long v26 = (unint64_t)traceContext;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v5 = v4;
  uint64_t v6 = *v4;
  *id v4 = v7;
  *(void *)&long long v28 = v6;
  BYTE8(v28) = *((unsigned char *)v4 + 8);
  *(_WORD *)((char *)&v28 + 9) = 16400;
  *(_DWORD *)((char *)&v28 + 11) = 0;
  HIBYTE(v28) = 0;
  uint64_t v8 = [(MTLCommandBufferSPI *)self->_baseObject computeCommandEncoder];
  if (v8) {
    uint64_t v9 = [[CaptureMTLComputeCommandEncoder alloc] initWithBaseObject:v8 captureCommandBuffer:self];
  }
  else {
    uint64_t v9 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLComputeCommandEncoder *)v9 traceStream]);
  uint64_t v10 = v27;
  *(_DWORD *)(v27 + 8) = -16352;
  char v11 = BYTE9(v28);
  if (BYTE9(v28) > 0x30uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v14 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v27 + 1), v14 | 0x1000000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v28));
    BYTE9(v28) += 16;
  }
  *(unsigned char *)(v10 + 13) = v11;
  char v15 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = [(CaptureMTLComputeCommandEncoder *)v9 traceStream];
  if (v17) {
    unint64_t v18 = v17->var0;
  }
  else {
    unint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  traceStream = self->_traceStream;
  *(unsigned char *)(v27 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v20 = v27;
  long long v21 = *(_OWORD *)(v27 + 16);
  long long v23 = *(_OWORD *)(v27 + 32);
  long long v22 = *(_OWORD *)(v27 + 48);
  *long long v24 = *(_OWORD *)v27;
  v24[1] = v21;
  v24[2] = v23;
  v24[3] = v22;
  uint64_t *v5 = v28;
  *((unsigned char *)v5 + 8) = BYTE8(v28);
  *(unsigned char *)(v20 + 15) |= 8u;

  return v9;
}

- (id)blitCommandEncoderWithDescriptor:(id)a3
{
  id v4 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  traceContext = self->_traceContext;
  long long v31 = (unint64_t)traceContext;
  *(void *)&long long v32 = 0;
  *((void *)&v32 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v7 = v6;
  uint64_t v8 = *v6;
  *uint64_t v6 = v9;
  *(void *)&long long v33 = v8;
  BYTE8(v33) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v33 + 9) = 16400;
  *(_DWORD *)((char *)&v33 + 11) = 0;
  HIBYTE(v33) = 0;
  baseObject = self->_baseObject;
  char v11 = unwrapMTLBlitPassDescriptor_(v4, self->_retainedObjects);
  uint64_t v12 = [(MTLCommandBufferSPI *)baseObject blitCommandEncoderWithDescriptor:v11];

  if (v12) {
    uint64_t v13 = [[CaptureMTLBlitCommandEncoder alloc] initWithBaseObject:v12 captureCommandBuffer:self];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v31, (uint64_t)[(CaptureMTLBlitCommandEncoder *)v13 traceStream]);
  uint64_t v14 = v32;
  *(_DWORD *)(v32 + 8) = -15587;
  char v15 = BYTE9(v33);
  if (BYTE9(v33) > 0x28uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 24);
    uint64_t v18 = BYTE10(v33);
    ++BYTE10(v33);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v32 + 1), v18 | 0x1800000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v33));
    BYTE9(v33) += 24;
  }
  *(unsigned char *)(v14 + 13) = v15;
  uint64_t v19 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v21 = [(CaptureMTLBlitCommandEncoder *)v13 traceStream];
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0;
  }
  char v23 = SaveMTLBlitPassDescriptor((uint64_t)&v31, v4);
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  v16[16] = v23;
  *(_DWORD *)(v16 + 17) = 0;
  *((_DWORD *)v16 + 5) = 0;
  traceStream = self->_traceStream;
  *(unsigned char *)(v32 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v25 = v32;
  long long v26 = *(_OWORD *)(v32 + 16);
  long long v28 = *(_OWORD *)(v32 + 32);
  long long v27 = *(_OWORD *)(v32 + 48);
  _OWORD *v29 = *(_OWORD *)v32;
  v29[1] = v26;
  v29[2] = v28;
  v29[3] = v27;
  *uint64_t v7 = v33;
  *((unsigned char *)v7 + 8) = BYTE8(v33);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v13;
}

- (id)blitCommandEncoder
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  long long v26 = (unint64_t)traceContext;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v5 = v4;
  uint64_t v6 = *v4;
  *id v4 = v7;
  *(void *)&long long v28 = v6;
  BYTE8(v28) = *((unsigned char *)v4 + 8);
  *(_WORD *)((char *)&v28 + 9) = 16400;
  *(_DWORD *)((char *)&v28 + 11) = 0;
  HIBYTE(v28) = 0;
  uint64_t v8 = [(MTLCommandBufferSPI *)self->_baseObject blitCommandEncoder];
  if (v8) {
    uint64_t v9 = [[CaptureMTLBlitCommandEncoder alloc] initWithBaseObject:v8 captureCommandBuffer:self];
  }
  else {
    uint64_t v9 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLBlitCommandEncoder *)v9 traceStream]);
  uint64_t v10 = v27;
  *(_DWORD *)(v27 + 8) = -16354;
  char v11 = BYTE9(v28);
  if (BYTE9(v28) > 0x30uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v14 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v27 + 1), v14 | 0x1000000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v28));
    BYTE9(v28) += 16;
  }
  *(unsigned char *)(v10 + 13) = v11;
  char v15 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = [(CaptureMTLBlitCommandEncoder *)v9 traceStream];
  if (v17) {
    unint64_t v18 = v17->var0;
  }
  else {
    unint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  traceStream = self->_traceStream;
  *(unsigned char *)(v27 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v20 = v27;
  long long v21 = *(_OWORD *)(v27 + 16);
  long long v23 = *(_OWORD *)(v27 + 32);
  long long v22 = *(_OWORD *)(v27 + 48);
  *long long v24 = *(_OWORD *)v27;
  v24[1] = v21;
  v24[2] = v23;
  v24[3] = v22;
  uint64_t *v5 = v28;
  *((unsigned char *)v5 + 8) = BYTE8(v28);
  *(unsigned char *)(v20 + 15) |= 8u;

  return v9;
}

- (void)addPurgedResource:(id)a3
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
  [(MTLCommandBufferSPI *)baseObject addPurgedResource:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15967;
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
  uint64_t v13 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v15 = (uint64_t *)[v4 traceStream];
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

- (void)addPurgedHeap:(id)a3
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
  [(MTLCommandBufferSPI *)baseObject addPurgedHeap:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15966;
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
  uint64_t v13 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v15 = (uint64_t *)[v4 traceStream];
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

- (NSMutableDictionary)userDictionary
{
  return (NSMutableDictionary *)[(MTLCommandBufferSPI *)self->_baseObject userDictionary];
}

- (unint64_t)status
{
  return (unint64_t)[(MTLCommandBufferSPI *)self->_baseObject status];
}

- (BOOL)retainedReferences
{
  return [(MTLCommandBufferSPI *)self->_baseObject retainedReferences];
}

- (NSDictionary)profilingResults
{
  return (NSDictionary *)[(MTLCommandBufferSPI *)self->_baseObject profilingResults];
}

- (void)setProfilingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLCommandBufferSPI *)self->_baseObject setProfilingEnabled:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16364;
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
  uint64_t v10 = [(CaptureMTLCommandBuffer *)self traceStream];
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

- (BOOL)isProfilingEnabled
{
  return [(MTLCommandBufferSPI *)self->_baseObject isProfilingEnabled];
}

- (void)setPrivateLoggingBuffer:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLCommandBuffer_setPrivateLoggingBuffer", (uint64_t)"Command Buffer logging", 0, 0);
  [(MTLCommandBufferSPI *)self->_baseObject setPrivateLoggingBuffer:v4];
}

- (MTLBuffer)privateLoggingBuffer
{
  return (MTLBuffer *)[(MTLCommandBufferSPI *)self->_baseObject privateLoggingBuffer];
}

- (void)setPrivateDataOffset:(unint64_t)a3
{
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLCommandBuffer_setPrivateDataOffset", (uint64_t)"Command Buffer Private Data", 0, 0);
  baseObject = self->_baseObject;

  [(MTLCommandBufferSPI *)baseObject setPrivateDataOffset:a3];
}

- (unint64_t)privateDataOffset
{
  return (unint64_t)[(MTLCommandBufferSPI *)self->_baseObject privateDataOffset];
}

- (void)setPrivateData:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLCommandBuffer_setPrivateData", (uint64_t)"Command Buffer Private Data", 0, 0);
  [(MTLCommandBufferSPI *)self->_baseObject setPrivateData:v4];
}

- (MTLBuffer)privateData
{
  return (MTLBuffer *)[(MTLCommandBufferSPI *)self->_baseObject privateData];
}

- (MTLLogContainer)logs
{
  return (MTLLogContainer *)[(MTLCommandBufferSPI *)self->_baseObject logs];
}

- (unint64_t)getListIndex
{
  return (unint64_t)[(MTLCommandBufferSPI *)self->_baseObject getListIndex];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLCommandBufferSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16365;
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
  uint64_t v10 = [(CaptureMTLCommandBuffer *)self traceStream];
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
  return (NSString *)[(MTLCommandBufferSPI *)self->_baseObject label];
}

- (double)kernelStartTime
{
  [(MTLCommandBufferSPI *)self->_baseObject kernelStartTime];
  return result;
}

- (double)kernelEndTime
{
  [(MTLCommandBufferSPI *)self->_baseObject kernelEndTime];
  return result;
}

- (unint64_t)globalTraceObjectID
{
  return (unint64_t)[(MTLCommandBufferSPI *)self->_baseObject globalTraceObjectID];
}

- (unint64_t)errorOptions
{
  return (unint64_t)[(MTLCommandBufferSPI *)self->_baseObject errorOptions];
}

- (NSError)error
{
  return (NSError *)[(MTLCommandBufferSPI *)self->_baseObject error];
}

- (MTLDevice)device
{
  return [(CaptureMTLCommandQueue *)self->_captureCommandQueue device];
}

- (MTLDeadlineProfile)deadlineProfile
{
  return (MTLDeadlineProfile *)[(MTLCommandBufferSPI *)self->_baseObject deadlineProfile];
}

- (MTLCommandQueue)commandQueue
{
  return (MTLCommandQueue *)self->_captureCommandQueue;
}

- (double)GPUStartTime
{
  [(MTLCommandBufferSPI *)self->_baseObject GPUStartTime];
  return result;
}

- (double)GPUEndTime
{
  [(MTLCommandBufferSPI *)self->_baseObject GPUEndTime];
  return result;
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLCommandBufferSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLCommandBuffer;
  BOOL v3 = [(CaptureMTLCommandBuffer *)&v7 description];
  id v4 = [(MTLCommandBufferSPI *)self->_baseObject description];
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

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    for (uint64_t i = 0; i != a4; ++i)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        ResidencySetTakeSnapshotInternal((void *)a3[i], 0);
      }
    }
    RetainArray(self->_retainedObjects, (id *)a3, a4);
  }
  else
  {
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v27);
  baseObject = self->_baseObject;
  unint64_t v10 = 8 * a4;
  __chkstk_darwin(v8, v11);
  bzero((char *)&v27 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  if (a4)
  {
    id v12 = a3;
    id v13 = (void *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v14 = a4;
    do
    {
      id v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  [(MTLCommandBufferSPI *)baseObject useResidencySets:(char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0) count:a4];
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15253;
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
  long long v21 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v21, v22);
  bzero((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  char v24 = StreamArray((uint64_t)&v27, (long long *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, a4);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = a4;
  v18[16] = v24;
  *(_DWORD *)(v18 + 17) = 0;
  *((_DWORD *)v18 + 5) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(unsigned char *)(v25 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;
}

- (void)useResidencySet:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    ResidencySetTakeSnapshotInternal(v4, 0);
  }
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
  objc_super v7 = [v4 baseObject];
  [(MTLCommandBufferSPI *)baseObject useResidencySet:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15254;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    unint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    unint64_t v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  id v13 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)unint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (id)accelerationStructureCommandEncoderWithDescriptor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CaptureMTLCommandBuffer *)self accelerationStructureCommandEncoderPreamble];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  traceContext = self->_traceContext;
  long long v32 = (unint64_t)traceContext;
  *(void *)&long long v33 = 0;
  *((void *)&v33 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v8 = v7;
  uint64_t v9 = *v7;
  *objc_super v7 = v10;
  *(void *)&long long v34 = v9;
  BYTE8(v34) = *((unsigned char *)v7 + 8);
  *(_WORD *)((char *)&v34 + 9) = 16400;
  *(_DWORD *)((char *)&v34 + 11) = 0;
  HIBYTE(v34) = 0;
  baseObject = self->_baseObject;
  uint64_t v12 = unwrapMTLAccelerationStructurePassDescriptor_(v4, self->_retainedObjects);
  id v13 = [(MTLCommandBufferSPI *)baseObject accelerationStructureCommandEncoderWithDescriptor:v12];

  if (v13) {
    unint64_t v14 = [[CaptureMTLAccelerationStructureCommandEncoder alloc] initWithBaseObject:v13 captureCommandBuffer:self copyEventValue:v5];
  }
  else {
    unint64_t v14 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v32, (uint64_t)[(CaptureMTLAccelerationStructureCommandEncoder *)v14 traceStream]);
  uint64_t v15 = v33;
  *(_DWORD *)(v33 + 8) = -15364;
  char v16 = BYTE9(v34);
  if (BYTE9(v34) > 0x28uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 24);
    uint64_t v19 = BYTE10(v34);
    ++BYTE10(v34);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v33 + 1), v19 | 0x1800000000) + 16;
    char v16 = v19;
  }
  else
  {
    uint64_t v17 = (char *)(v15 + BYTE9(v34));
    BYTE9(v34) += 24;
  }
  *(unsigned char *)(v15 + 13) = v16;
  long long v20 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v22 = [(CaptureMTLAccelerationStructureCommandEncoder *)v14 traceStream];
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0;
  }
  char v24 = SaveMTLAccelerationStructurePassDescriptor((uint64_t)&v32, v4);
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  v17[16] = v24;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  traceStream = self->_traceStream;
  *(unsigned char *)(v33 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v26 = v33;
  long long v27 = *(_OWORD *)(v33 + 16);
  long long v29 = *(_OWORD *)(v33 + 32);
  long long v28 = *(_OWORD *)(v33 + 48);
  *long long v30 = *(_OWORD *)v33;
  v30[1] = v27;
  v30[2] = v29;
  v30[3] = v28;
  uint64_t *v8 = v34;
  *((unsigned char *)v8 + 8) = BYTE8(v34);
  *(unsigned char *)(v26 + 15) |= 8u;

  return v14;
}

- (id)accelerationStructureCommandEncoder
{
  unint64_t v3 = [(CaptureMTLCommandBuffer *)self accelerationStructureCommandEncoderPreamble];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  traceContext = self->_traceContext;
  long long v27 = (unint64_t)traceContext;
  *(void *)&long long v28 = 0;
  *((void *)&v28 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  BOOL v6 = v5;
  uint64_t v7 = *v5;
  uint64_t *v5 = v8;
  *(void *)&long long v29 = v7;
  BYTE8(v29) = *((unsigned char *)v5 + 8);
  *(_WORD *)((char *)&v29 + 9) = 16400;
  *(_DWORD *)((char *)&v29 + 11) = 0;
  HIBYTE(v29) = 0;
  uint64_t v9 = [(MTLCommandBufferSPI *)self->_baseObject accelerationStructureCommandEncoder];
  if (v9) {
    uint64_t v10 = [[CaptureMTLAccelerationStructureCommandEncoder alloc] initWithBaseObject:v9 captureCommandBuffer:self copyEventValue:v3];
  }
  else {
    uint64_t v10 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)[(CaptureMTLAccelerationStructureCommandEncoder *)v10 traceStream]);
  uint64_t v11 = v28;
  *(_DWORD *)(v28 + 8) = -15673;
  char v12 = BYTE9(v29);
  if (BYTE9(v29) > 0x30uLL)
  {
    uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v15 = BYTE10(v29);
    ++BYTE10(v29);
    id v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v28 + 1), v15 | 0x1000000000) + 16;
    char v12 = v15;
  }
  else
  {
    id v13 = (char *)(v11 + BYTE9(v29));
    BYTE9(v29) += 16;
  }
  *(unsigned char *)(v11 + 13) = v12;
  char v16 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v18 = [(CaptureMTLAccelerationStructureCommandEncoder *)v10 traceStream];
  if (v18) {
    unint64_t v19 = v18->var0;
  }
  else {
    unint64_t v19 = 0;
  }
  *(void *)id v13 = var0;
  *((void *)v13 + 1) = v19;
  traceStream = self->_traceStream;
  *(unsigned char *)(v28 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v21 = v28;
  long long v22 = *(_OWORD *)(v28 + 16);
  long long v24 = *(_OWORD *)(v28 + 32);
  long long v23 = *(_OWORD *)(v28 + 48);
  *uint64_t v25 = *(_OWORD *)v28;
  v25[1] = v22;
  v25[2] = v24;
  v25[3] = v23;
  *BOOL v6 = v29;
  *((unsigned char *)v6 + 8) = BYTE8(v29);
  *(unsigned char *)(v21 + 15) |= 8u;

  return v10;
}

- (unint64_t)accelerationStructureCommandEncoderPreamble
{
  if (!self->_accelerationStructureDescriptorProcessEvent)
  {
    unint64_t v3 = [(MTLCommandBufferSPI *)self->_baseObject device];
    id v4 = DEVICEOBJECT(v3);

    unint64_t v5 = (MTLSharedEvent *)[v4 newSharedEvent];
    accelerationStructureDescriptorProcessEvent = self->_accelerationStructureDescriptorProcessEvent;
    self->_accelerationStructureDescriptorProcessEvent = v5;

    self->_accelerationStructureDescriptorCopyEventValue = 0;
  }
  unint64_t result = self->_accelerationStructureDescriptorCopyEventValue;
  self->_accelerationStructureDescriptorCopyEventValue = result + 1;
  return result;
}

- (void)waitUntilCompleted
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16355;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    unint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    unint64_t v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)unint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
  [(MTLCommandBufferSPI *)self->_baseObject waitUntilCompleted];
}

- (id)debugCommandEncoder
{
  uint64_t v3 = [(MTLCommandBufferSPI *)self->_baseObject debugCommandEncoder];
  if (v3) {
    char v4 = [[CaptureMTLDebugCommandEncoder alloc] initWithBaseObject:v3 captureCommandBuffer:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)addCompletedHandler:(id)a3
{
  id v4 = a3;
  completedDispatchArray = self->_completedDispatchArray;
  if (!completedDispatchArray)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_completedDispatchArray;
    self->_completedDispatchArray = v6;

    completedDispatchArray = self->_completedDispatchArray;
  }
  id v8 = objc_retainBlock(v4);
  [(NSMutableArray *)completedDispatchArray addObject:v8];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
  uint64_t v9 = v19;
  *(_DWORD *)(v19 + 8) = -16356;
  char v10 = BYTE9(v20);
  if (BYTE9(v20) > 0x30uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 24);
    uint64_t v13 = BYTE10(v20);
    ++BYTE10(v20);
    uint64_t v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v19 + 1), v13 | 0x1000000000) + 16;
    char v10 = v13;
  }
  else
  {
    uint64_t v11 = (char *)(v9 + BYTE9(v20));
    BYTE9(v20) += 16;
  }
  *(unsigned char *)(v9 + 13) = v10;
  long long v14 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v11 = var0;
  *((void *)v11 + 1) = v4;
  s();
  *(void *)uint64_t v16 = v17;
  *(unsigned char *)(v16 + 8) = BYTE8(v20);
  *(unsigned char *)(v19 + 15) |= 8u;
}

- (void)presentDrawable:(id)a3 afterMinimumDuration:(double)a4
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
  [(CaptureMTLCommandBuffer *)self trackPresent:v6];
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLCommandBufferSPI *)baseObject presentDrawable:v9 afterMinimumDuration:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16133;
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
  uint64_t v15 = [(CaptureMTLCommandBuffer *)self traceStream];
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
  *((double *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)presentDrawable:(id)a3 atTime:(double)a4
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
  [(CaptureMTLCommandBuffer *)self trackPresent:v6];
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLCommandBufferSPI *)baseObject presentDrawable:v9 atTime:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16358;
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
  uint64_t v15 = [(CaptureMTLCommandBuffer *)self traceStream];
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
  *((double *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)presentDrawable:(id)a3
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
  [(CaptureMTLCommandBuffer *)self trackPresent:v4];
  baseObject = self->_baseObject;
  uint64_t v7 = [v4 baseObject];
  [(MTLCommandBufferSPI *)baseObject presentDrawable:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16359;
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
  uint64_t v13 = [(CaptureMTLCommandBuffer *)self traceStream];
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

- (void)trackPresent:(id)a3
{
  id v4 = a3;
  self->_layerRef = 0;
  id v8 = v4;
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___CAMetalDrawable])
  {
    unint64_t v5 = [v8 layer];
    id v6 = (unint64_t *)[v5 traceStream];
    if (v6) {
      unint64_t v7 = *v6;
    }
    else {
      unint64_t v7 = 0;
    }
    self->_layerRef = v7;
    GTTelemetry_trackPresent(v8);
  }
  self->_presentDrawableUsed = 1;
}

- (void)addScheduledHandler:(id)a3
{
  id v4 = a3;
  scheduledDispatchArray = self->_scheduledDispatchArray;
  if (!scheduledDispatchArray)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    unint64_t v7 = self->_scheduledDispatchArray;
    self->_scheduledDispatchArray = v6;

    scheduledDispatchArray = self->_scheduledDispatchArray;
  }
  id v8 = objc_retainBlock(v4);
  [(NSMutableArray *)scheduledDispatchArray addObject:v8];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
  uint64_t v9 = v19;
  *(_DWORD *)(v19 + 8) = -16360;
  char v10 = BYTE9(v20);
  if (BYTE9(v20) > 0x30uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 24);
    uint64_t v13 = BYTE10(v20);
    ++BYTE10(v20);
    uint64_t v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v19 + 1), v13 | 0x1000000000) + 16;
    char v10 = v13;
  }
  else
  {
    uint64_t v11 = (char *)(v9 + BYTE9(v20));
    BYTE9(v20) += 16;
  }
  *(unsigned char *)(v9 + 13) = v10;
  uint64_t v14 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v11 = var0;
  *((void *)v11 + 1) = v4;
  s();
  *(void *)uint64_t v16 = v17;
  *(unsigned char *)(v16 + 8) = BYTE8(v20);
  *(unsigned char *)(v19 + 15) |= 8u;
}

- (BOOL)commitAndWaitUntilSubmittedWithDeadline:(unint64_t)a3
{
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    CommandQueueCaptureResidencySetSnapshots(self->_captureCommandQueue);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15316;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x28uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    unint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1800000000) + 16;
    char v6 = v9;
  }
  else
  {
    unint64_t v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 24;
  }
  *(unsigned char *)(v5 + 13) = v6;
  char v10 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)unint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  *((void *)v7 + 2) = 1;
  uint64_t v12 = (void *)v20;
  *(unsigned char *)(v20 + 15) |= 8u;
  [(CaptureMTLCommandBuffer *)self _preCommitWithIndex:*v12];
  unsigned int v13 = [(MTLCommandBufferSPI *)self->_baseObject commitAndWaitUntilSubmittedWithDeadline:a3];
  uint64_t v14 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v14) {
    unint64_t v15 = v14->var0;
  }
  else {
    unint64_t v15 = 0;
  }
  *(void *)unint64_t v7 = v15;
  *((void *)v7 + 1) = a3;
  *((_DWORD *)v7 + 4) = v13;
  *((_DWORD *)v7 + 5) = 0;
  s();
  *(void *)uint64_t v16 = v17;
  *(unsigned char *)(v16 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
  return v13;
}

- (BOOL)commitAndWaitUntilSubmitted
{
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    CommandQueueCaptureResidencySetSnapshots(self->_captureCommandQueue);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v17);
  uint64_t v3 = v18;
  *(_DWORD *)(v18 + 8) = -15908;
  char v4 = BYTE9(v19);
  if (BYTE9(v19) > 0x30uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v17 + 1) + 24);
    uint64_t v7 = BYTE10(v19);
    ++BYTE10(v19);
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v18 + 1), v7 | 0x1000000000) + 16;
    char v4 = v7;
  }
  else
  {
    uint64_t v5 = (char *)(v3 + BYTE9(v19));
    BYTE9(v19) += 16;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  *((void *)v5 + 1) = 1;
  char v10 = (void *)v18;
  *(unsigned char *)(v18 + 15) |= 8u;
  [(CaptureMTLCommandBuffer *)self _preCommitWithIndex:*v10];
  unsigned int v11 = [(MTLCommandBufferSPI *)self->_baseObject commitAndWaitUntilSubmitted];
  uint64_t v12 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v12) {
    unint64_t v13 = v12->var0;
  }
  else {
    unint64_t v13 = 0;
  }
  *(void *)uint64_t v5 = v13;
  *((_DWORD *)v5 + 2) = v11;
  *((_DWORD *)v5 + 3) = 0;
  s();
  *(void *)uint64_t v14 = v15;
  *(unsigned char *)(v14 + 8) = BYTE8(v19);
  *(unsigned char *)(v18 + 15) |= 8u;
  return v11;
}

- (void)commitWithDeadline:(unint64_t)a3
{
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    CommandQueueCaptureResidencySetSnapshots(self->_captureCommandQueue);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v15);
  uint64_t v5 = v16;
  *(_DWORD *)(v16 + 8) = -15318;
  char v6 = BYTE9(v17);
  if (BYTE9(v17) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 24);
    uint64_t v9 = BYTE10(v17);
    ++BYTE10(v17);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v16 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v17));
    BYTE9(v17) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  char v10 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  uint64_t v12 = (void *)v16;
  *(unsigned char *)(v16 + 15) |= 8u;
  [(CaptureMTLCommandBuffer *)self _preCommitWithIndex:*v12];
  [(MTLCommandBufferSPI *)self->_baseObject commitWithDeadline:a3];
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v17);
  *(unsigned char *)(v16 + 15) |= 8u;
}

- (void)commitAndHold
{
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    CommandQueueCaptureResidencySetSnapshots(self->_captureCommandQueue);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16202;
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
  uint64_t v8 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  char v10 = (void *)v14;
  *(unsigned char *)(v14 + 15) |= 8u;
  [(CaptureMTLCommandBuffer *)self _preCommitWithIndex:*v10];
  [(MTLCommandBufferSPI *)self->_baseObject commitAndHold];
  s();
  *(void *)uint64_t v11 = v12;
  *(unsigned char *)(v11 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
}

- (void)commit
{
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    CommandQueueCaptureResidencySetSnapshots(self->_captureCommandQueue);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16361;
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
  uint64_t v8 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  char v10 = (void *)v14;
  *(unsigned char *)(v14 + 15) |= 8u;
  [(CaptureMTLCommandBuffer *)self _preCommitWithIndex:*v10];
  [(MTLCommandBufferSPI *)self->_baseObject commit];
  if ((qword_2501C8 & 0x10000) != 0) {
    [(MTLCommandBufferSPI *)self->_baseObject waitUntilCompleted];
  }
  s();
  *(void *)uint64_t v11 = v12;
  *(unsigned char *)(v11 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
}

- (void)enqueue
{
  [(CaptureMTLCommandQueue *)self->_captureCommandQueue enqueueCommandBuffer:self];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLCommandBufferSPI *)self->_baseObject enqueue];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16362;
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
  uint64_t v8 = [(CaptureMTLCommandBuffer *)self traceStream];
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

- (BOOL)isEnqueued
{
  return [(MTLCommandBufferSPI *)self->_baseObject status] != 0;
}

- (void)addRequestsToDownloadQueue:(id)a3 withIndex:(unint64_t)a4
{
  id v89 = a3;
  if (self->_isCapturing)
  {
    if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
    {
      newpool = 0;
      apr_pool_create_ex(&newpool, 0, 0, 0);
      uint64_t v6 = newpool;
      uint64_t v7 = GTTraceContext_copyStreamMap((uint64_t)self->_traceContext, newpool);
      uint64_t v8 = apr_hash_make(v6);
      *((void *)v7 + 3) = 0;
      *((void *)v7 + 4) = 0;
      *((void *)v7 + 2) = v7;
      uint64_t v85 = (uint64_t)v7;
      *((_DWORD *)v7 + 10) = 0;
      uint64_t v9 = apr_hash_next((apr_hash_t *)((char *)v7 + 16));
      if (v9)
      {
        uint64_t v10 = v9;
        do
        {
          GTTraceMemPool_buildMemoryMap(*(void *)(*(void *)(*((void *)v10 + 1) + 32) + 24), v8);
          uint64_t v10 = apr_hash_next(v10);
        }
        while (v10);
      }
      v88 = [(CaptureMTLCommandQueue *)self->_captureCommandQueue device];
      uint64_t v86 = _sharedCaptureManager;
      uint64_t v11 = GTResourceTrackerMake(v85, (uint64_t)v8, v6);
      uint64_t v12 = [(NSMutableArray *)self->_downloadPoints objectAtIndexedSubscript:0];
      traceuint64_t Stream = self->_traceStream;
      if (traceStream) {
        uint64_t var0 = traceStream->var0;
      }
      else {
        uint64_t var0 = 0;
      }
      long long v23 = traceStream->var4.var0;
      v96 = self;
      unint64_t v83 = a4;
      v91 = (void *)v12;
      unsigned int v24 = 0;
      if (v23)
      {
        while (1)
        {
          unsigned int v25 = atomic_load((unsigned int *)v23 + 1);
          uint64_t v26 = v24 + (v25 >> 6) - 1;
          if ((int)v26 > 0) {
            break;
          }
          long long v23 = (GTTraceStoreNode)^(GTTraceStoreNode)AiAi *)*((void *)v23 + 5);
          unsigned int v24 = v26;
          if (!v23)
          {
            unsigned int v24 = v26;
            goto LABEL_22;
          }
        }
      }
      uint64_t v26 = 0;
LABEL_22:
      int v90 = 0;
      long long v27 = 0;
      unint64_t v28 = v24 | (unint64_t)(v26 << 32);
      long long v29 = &s_accelerationStructuresByStreamRef;
      uint64_t v95 = (uint64_t)v8;
LABEL_23:
      long long v30 = (char *)v23 + 64;
      while (1)
      {
        v92 = v27;
        if (!v23) {
          break;
        }
        int v31 = HIDWORD(v28) - v28;
        if ((v30[64 * (uint64_t)(HIDWORD(v28) - (int)v28) + 15] & 8) == 0) {
          break;
        }
        uint64_t v32 = v31;
        uint64_t v94 = (uint64_t)&v30[64 * (uint64_t)v31];
        uint64_t v33 = v29[57];
        if (*(_DWORD *)(v94 + 8) == -15991 && (v29[57] & 0x400) != 0)
        {
          v35 = newpool;
          v36 = ResourceTracker_harvestResources(v11, newpool);
          DownloadRequests = GTResourceHarvesterGetDownloadRequests((pthread_mutex_t *)[(NSMutableArray *)v88 harvester], var0, (uint64_t)v36);
          long long v38 = GTResourceDownloaderProcessRequest(v35, (uint64_t)DownloadRequests);
          GTMTLCaptureState_appendDownloadRequests(v86, v38);
          [v91 setDownloadQueue:v89];
          long long v39 = [(NSMutableArray *)v88 downloader];
          v40 = v38;
          uint64_t v8 = (apr_hash_t *)v95;
          [v39 downloadRequest:v40 atPoint:v91];

          v41 = GTResourceTrackerMake(v85, v95, v35);
          uint64_t v42 = [(NSMutableArray *)v96->_downloadPoints objectAtIndexedSubscript:++v90];

          uint64_t v11 = v41;
          uint64_t v33 = v29[57];
          v91 = (void *)v42;
        }
        if ((v33 & 1) != 0 && IsFuncEnumPresent(*(_DWORD *)(v94 + 8)))
        {
          unint64_t layerRef = v96->_layerRef;
          v43 = GTTraceFunc_argumentBytesWithMap((void *)v94, *((unsigned __int8 *)v23 + 64 * v32 + 77), (uint64_t)v8);
          uint64_t v44 = *(void *)(GTTraceContext_getStream((uint64_t)v96->_traceContext, *((void *)v43 + 1)) + 32);
          if (v44)
          {
            unsigned int v45 = 0;
            while (1)
            {
              unsigned int v46 = atomic_load((unsigned int *)(v44 + 4));
              uint64_t v47 = v45 + (v46 >> 6) - 1;
              if ((int)v47 > 0) {
                break;
              }
              uint64_t v44 = *(void *)(v44 + 40);
              unsigned int v45 = v47;
              if (!v44)
              {
                v48 = v11;
                unsigned int v45 = v47;
                goto LABEL_42;
              }
            }
            v48 = v11;
          }
          else
          {
            v48 = v11;
            unsigned int v45 = 0;
          }
          uint64_t v47 = 0;
LABEL_42:
          unint64_t v49 = v45 | (unint64_t)(v47 << 32);
LABEL_43:
          uint64_t v50 = v44 + 64;
          while (v44 && (*(unsigned char *)(v50 + ((uint64_t)(HIDWORD(v49) - (int)v49) << 6) + 15) & 8) != 0)
          {
            v51 = (uint64_t *)(v50 + ((uint64_t)(HIDWORD(v49) - (int)v49) << 6));
            if (*((_DWORD *)v51 + 2) == -7167)
            {
              v52 = GTTraceFunc_argumentBytesWithMap(v51, *((unsigned __int8 *)v51 + 13), v95);
              uint64_t Stream = GTTraceContext_getStream((uint64_t)v96->_traceContext, *((void *)v52 + 1));
              if (Stream)
              {
                v61 = (uint64_t *)Stream;
                v93 = newpool;
                v62 = apr_array_make(newpool, 1, 56);
                uint64_t v64 = *v61;
                uint64_t v63 = v61[1];
                uint64_t v65 = *(void *)v94;
                LODWORD(v61) = GetFuncEnumConstructorType(*((_DWORD *)v51 + 2));
                v66 = (char *)apr_array_push(v62);
                *(void *)v66 = v63;
                *((void *)v66 + 1) = v64;
                *((void *)v66 + 2) = v65;
                *((void *)v66 + 3) = v65;
                *((void *)v66 + 4) = v65;
                *((_DWORD *)v66 + 10) = v61;
                *((_DWORD *)v66 + 11) = 0;
                v66[48] = 1;
                *(_DWORD *)(v66 + 49) = 0;
                *((_DWORD *)v66 + 13) = 0;
                v67 = GTResourceHarvesterGetDownloadRequests((pthread_mutex_t *)[(NSMutableArray *)v88 harvester], var0, (uint64_t)v62);
                v68 = GTResourceDownloaderProcessRequest(v93, (uint64_t)v67);
                long long v27 = v68;
                if (v68->nelts >= 1)
                {
                  uint64_t v69 = 0;
                  uint64_t v70 = 0;
                  uint64_t v8 = (apr_hash_t *)v95;
                  uint64_t v11 = v48;
                  long long v30 = (char *)v23 + 64;
                  int v57 = HIDWORD(v28);
                  do
                  {
                    uint64_t v71 = *v51;
                    v72 = &v68->elts[v69];
                    v72[47] |= 4u;
                    *((void *)v72 + 3) = layerRef;
                    *((void *)v72 + 4) = v71;
                    ++v70;
                    v69 += 88;
                  }
                  while (v70 < v68->nelts);
                  goto LABEL_53;
                }
                uint64_t v8 = (apr_hash_t *)v95;
LABEL_51:
                uint64_t v11 = v48;
                goto LABEL_52;
              }
            }
            unsigned int v54 = atomic_load((unsigned int *)(v44 + 4));
            int v55 = v49 + (v54 >> 6);
            uint64_t v56 = (HIDWORD(v49) + 1);
            unint64_t v49 = (v56 << 32) | v49;
            if (v56 == v55 - 1)
            {
              unint64_t v49 = (v56 << 32) | v56;
              uint64_t v44 = *(void *)(v44 + 40);
              goto LABEL_43;
            }
          }
          uint64_t v8 = (apr_hash_t *)v95;
          long long v27 = v92;
          goto LABEL_51;
        }
        long long v27 = v92;
LABEL_52:
        long long v30 = (char *)v23 + 64;
        int v57 = HIDWORD(v28);
LABEL_53:
        GTResourceTrackerProcessFunction((uint64_t)v11, v94);
        unsigned int v58 = atomic_load((unsigned int *)v23 + 1);
        int v59 = v28 + (v58 >> 6);
        uint64_t v60 = (v57 + 1);
        unint64_t v28 = (v60 << 32) | v28;
        long long v29 = &s_accelerationStructuresByStreamRef;
        if (v60 == v59 - 1)
        {
          unint64_t v28 = (v60 << 32) | v60;
          long long v23 = (GTTraceStoreNode)^(GTTraceStoreNode)AiAi *)*((void *)v23 + 5);
          goto LABEL_23;
        }
      }
      v73 = [(CaptureMTLCommandBuffer *)v96 commandQueue];
      id v74 = [v73 traceStream];
      v75 = newpool;
      ResourceTracker_processUsedResidencySets((uint64_t)v11, v83, (uint64_t)v74, newpool);

      v76 = ResourceTracker_harvestResources(v11, v75);
      v77 = GTResourceHarvesterGetDownloadRequests((pthread_mutex_t *)[(NSMutableArray *)v88 harvester], var0, (uint64_t)v76);
      v78 = GTResourceDownloaderProcessRequest(v75, (uint64_t)v77);
      GTMTLCaptureState_appendDownloadRequests(v86, v78);
      v79 = v91;
      [v91 setDownloadQueue:v89];
      v80 = [(NSMutableArray *)v88 downloader];
      [v80 downloadRequest:v78 atPoint:v91];

      if ((v29[57] & 1) != 0 && v96->_presentDrawableUsed)
      {
        v81 = [(NSMutableArray *)v96->_downloadPoints objectAtIndexedSubscript:v90 + 1];

        GTMTLCaptureState_appendDownloadRequests(v86, v92);
        [v81 setDownloadQueue:v89];
        v82 = [(NSMutableArray *)v88 downloader];
        [v82 downloadRequest:v92 atPoint:v81];

        v79 = v81;
      }
      apr_pool_destroy(v75);

      downloadPoints = v88;
    }
    else
    {
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v14 = self->_downloadPoints;
      id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v97 objects:v102 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v98;
        do
        {
          for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v98 != v17) {
              objc_enumerationMutation(v14);
            }
            long long v19 = *(void **)(*((void *)&v97 + 1) + 8 * i);
            id v20 = [v19 downloadValue];
            long long v21 = [v19 downloadEvent];
            [v21 setSignaledValue:v20];
          }
          id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v97 objects:v102 count:16];
        }
        while (v16);
      }

      downloadPoints = self->_downloadPoints;
      self->_downloadPoints = 0;
    }
  }
}

- (void)_preCommitWithIndex:(unint64_t)a3
{
  uint64_t v5 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v5) {
    unint64_t var0 = v5->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v7 = [(CaptureMTLCommandQueue *)self->_captureCommandQueue device];
  uint64_t v8 = (uint64_t *)[v7 traceStream];
  if (v8) {
    uint64_t v9 = *v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [(CaptureMTLCommandQueue *)self->_captureCommandQueue traceStream];
  if (v10) {
    unint64_t v11 = v10->var0;
  }
  else {
    unint64_t v11 = 0;
  }
  uint64_t v12 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v12) {
    unint64_t v13 = v12->var0;
  }
  else {
    unint64_t v13 = 0;
  }
  BOOL isCapturing = self->_isCapturing;

  *(void *)&long long size_ptr = 0x500000008;
  *((void *)&size_ptr + 1) = var0;
  unint64_t v78 = a3;
  uint64_t v79 = 0;
  uint64_t v80 = 0;
  uint64_t v81 = v9;
  unint64_t v82 = 0;
  unint64_t v83 = v11;
  unint64_t v84 = v13;
  BOOL v85 = isCapturing;
  memset(v86, 0, sizeof(v86));
  GTCaptureBoundaryTracker_handleTrigger(&size_ptr);
  if (self->_presentDrawableUsed)
  {
    id v15 = [(CaptureMTLCommandBuffer *)self traceStream];
    if (v15) {
      unint64_t v16 = v15->var0;
    }
    else {
      unint64_t v16 = 0;
    }
    uint64_t v17 = [(CaptureMTLCommandQueue *)self->_captureCommandQueue device];
    long long v18 = (uint64_t *)[v17 traceStream];
    if (v18) {
      uint64_t v19 = *v18;
    }
    else {
      uint64_t v19 = 0;
    }
    unint64_t layerRef = self->_layerRef;
    long long v21 = [(CaptureMTLCommandQueue *)self->_captureCommandQueue traceStream];
    if (v21) {
      unint64_t v22 = v21->var0;
    }
    else {
      unint64_t v22 = 0;
    }
    long long v23 = [(CaptureMTLCommandBuffer *)self traceStream];
    if (v23) {
      unint64_t v24 = v23->var0;
    }
    else {
      unint64_t v24 = 0;
    }
    BOOL v25 = self->_isCapturing;

    *(void *)&long long size_ptr = 0x300000003;
    *((void *)&size_ptr + 1) = v16;
    unint64_t v78 = a3;
    uint64_t v79 = 0;
    uint64_t v80 = 0;
    uint64_t v81 = v19;
    unint64_t v82 = layerRef;
    unint64_t v83 = v22;
    unint64_t v84 = v24;
    BOOL v85 = v25;
    memset(v86, 0, sizeof(v86));
    GTCaptureBoundaryTracker_handleTrigger(&size_ptr);
  }
  scheduledDispatchArray = self->_scheduledDispatchArray;
  if (scheduledDispatchArray)
  {
    long long v27 = scheduledDispatchArray;
    unint64_t v28 = self->_scheduledDispatchArray;
    self->_scheduledDispatchArray = 0;

    traceContext = self->_traceContext;
    long long v30 = self;
    BOOL v31 = self->_isCapturing;
    baseObject = v30->_baseObject;
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = __47__CaptureMTLCommandBuffer__preCommitWithIndex___block_invoke;
    v71[3] = &unk_221828;
    v72 = v27;
    v73 = v30;
    unint64_t v74 = a3;
    v75 = traceContext;
    BOOL v76 = v31;
    uint64_t v33 = v30;
    long long v34 = v27;
    [(MTLCommandBufferSPI *)baseObject addScheduledHandler:v71];
  }
  if (self->_completedDispatchArray || self->_retainedObjects || self->_downloadPoints)
  {
    v35 = self->_downloadPoints;
    v36 = self->_completedDispatchArray;
    long long v37 = self->_retainedObjects;
    completedDispatchArray = self->_completedDispatchArray;
    self->_completedDispatchArray = 0;

    retainedObjects = self->_retainedObjects;
    self->_retainedObjects = 0;

    v40 = self;
    v41 = v40->_baseObject;
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = __47__CaptureMTLCommandBuffer__preCommitWithIndex___block_invoke_2;
    v65[3] = &unk_221850;
    uint64_t v69 = v37;
    unint64_t v70 = a3;
    v66 = v35;
    v67 = v36;
    v68 = v40;
    uint64_t v42 = v37;
    v43 = v40;
    uint64_t v44 = v36;
    unsigned int v45 = v35;
    [(MTLCommandBufferSPI *)v41 addCompletedHandler:v65];
  }
  if (self->_isCapturing && (*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    unsigned int v46 = [(CaptureMTLCommandBuffer *)self device];
    uint64_t v47 = [v46 dispatchGroup];
    dispatch_group_enter(v47);

    GTMTLCaptureState_notifyCommandBufferCaptured(_sharedCaptureManager);
    v48 = [v46 baseObject];
    unint64_t v49 = DEVICEOBJECT(v48);

    if (objc_opt_respondsToSelector())
    {
      uint64_t v50 = [v49 indirectArgumentBufferDecodingData];
      v51 = v50;
      if (v50 != &_dispatch_data_empty && v50)
      {
        *(void *)&long long size_ptr = 0;
        buffer_ptr = 0;
        dispatch_data_t map = dispatch_data_create_map(v50, (const void **)&buffer_ptr, (size_t *)&size_ptr);
        v53 = buffer_ptr;
        if (buffer_ptr)
        {
          unint64_t v54 = ((void)size_ptr << 32) | 0xFFLL;
          if (HIDWORD(v54))
          {
            size_t v55 = size_ptr;
            Bytes = GTTraceMemPool_allocateBytes((uint64_t)self->_traceStream->var3, a3, v54);
            memcpy(Bytes + 16, v53, v55);
          }
        }
      }
    }
    int v57 = DEVICEOBJECT(self->_baseObject);
    int v59 = _NSConcreteStackBlock;
    uint64_t v60 = 3221225472;
    v61 = __47__CaptureMTLCommandBuffer__preCommitWithIndex___block_invoke_3;
    v62 = &unk_222170;
    id v58 = v46;
    id v63 = v58;
    [v57 addCompletedHandler:&v59];

    if ((qword_2501C8 & 1) != 0 && self->_presentDrawableUsed) {
      [(CaptureMTLCommandBuffer *)self _encodeDownloadPoint];
    }
  }
  GTTelemetry_trackCommit(self);
  [(CaptureMTLCommandQueue *)self->_captureCommandQueue commitCommandBuffer:self withIndex:a3];
}

void __47__CaptureMTLCommandBuffer__preCommitWithIndex___block_invoke(uint64_t a1)
{
  atomic_fetch_add((atomic_uint *volatile)(boundaryTrackerInstance + 92), 1u);
  s();
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  void *v2 = v5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = *(id *)(a1 + 32);
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v25 + 1) + 8 * (void)v10) + 16))();
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  *uint64_t v3 = v4;
  unint64_t v11 = (uint64_t *)[*(id *)(a1 + 40) traceStream];
  if (v11) {
    uint64_t v12 = *v11;
  }
  else {
    uint64_t v12 = 0;
  }
  unint64_t v13 = atomic_load((unint64_t *)(*(void *)(a1 + 56) + 72));
  long long v14 = (uint64_t *)[*(id *)(a1 + 40) traceStream];
  if (v14) {
    uint64_t v15 = *v14;
  }
  else {
    uint64_t v15 = 0;
  }
  char v16 = *(unsigned char *)(a1 + 64);
  *(void *)&long long v17 = 0x600000008;
  *((void *)&v17 + 1) = v12;
  unint64_t v18 = v13;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v21 = 0;
  uint64_t v22 = v15;
  char v23 = v16;
  memset(v24, 0, sizeof(v24));
  GTCaptureBoundaryTracker_handleTrigger(&v17);
  atomic_fetch_add((atomic_uint *volatile)(boundaryTrackerInstance + 92), 0xFFFFFFFF);
}

id __47__CaptureMTLCommandBuffer__preCommitWithIndex___block_invoke_2(id *a1)
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = a1[4];
  id v3 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v8 = [v7 downloadValue];
        uint64_t v9 = [v7 downloadEvent];
        [v9 setSignaledValue:v8];
      }
      id v4 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v4);
  }

  atomic_fetch_add((atomic_uint *volatile)(boundaryTrackerInstance + 92), 1u);
  s();
  unint64_t v11 = v10;
  uint64_t v12 = *v10;
  *uint64_t v10 = v13;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = a1[5];
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * (void)j) + 16))(*(void *)(*((void *)&v20 + 1) + 8 * (void)j));
      }
      id v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }

  *unint64_t v11 = v12;
  atomic_fetch_add((atomic_uint *volatile)(boundaryTrackerInstance + 92), 0xFFFFFFFF);
  return [a1[7] count:v20];
}

void __47__CaptureMTLCommandBuffer__preCommitWithIndex___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) dispatchGroup];
  dispatch_group_leave(v1);
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
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
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v32);
  baseObject = self->_baseObject;
  uint64_t v9 = [v6 baseObject];
  [(MTLCommandBufferSPI *)baseObject encodeWaitForEvent:v9 value:a4];

  if (self->_isCapturing)
  {
    if ((qword_2501C8 & 0x400) != 0) {
      [(CaptureMTLCommandBuffer *)self _encodeDownloadPoint];
    }
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = *((void *)&v33 + 1);
    uint64_t v10 = [(CaptureMTLCommandQueue *)self->_captureCommandQueue device];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v6;
      if (IsEventActuallyShared((uint64_t)[v11 traceStream]))
      {
        uint64_t v12 = [v10 dispatchGroup];
        dispatch_group_enter(v12);

        uint64_t v13 = [v11 baseObject];
        id v14 = [v10 captureEventListener];
        id v15 = v30;
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = __52__CaptureMTLCommandBuffer_encodeWaitForEvent_value___block_invoke;
        v30[3] = &unk_2217D8;
        v30[7] = v31;
        v30[4] = self;
        v30[5] = v11;
        v30[6] = v10;
        [v13 notifyListener:v14 atValue:a4 block:v30];
LABEL_13:
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_15:

        _Block_object_dispose(v31, 8);
        goto LABEL_16;
      }
      id v16 = v6;
      if (IsEventActuallyShared((uint64_t)[v16 traceStream]))
      {
        uint64_t v17 = [v10 dispatchGroup];
        dispatch_group_enter(v17);

        uint64_t v13 = [v16 baseObject];
        id v14 = [v10 captureEventListener];
        id v15 = v29;
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = __52__CaptureMTLCommandBuffer_encodeWaitForEvent_value___block_invoke_2;
        v29[3] = &unk_221800;
        v29[7] = v31;
        v29[4] = self;
        v29[5] = v16;
        v29[6] = v10;
        [v13 notifyListener:v14 atValue:a4 block:v29];
        goto LABEL_13;
      }
    }

    goto LABEL_15;
  }
LABEL_16:
  uint64_t v18 = v33;
  *(_DWORD *)(v33 + 8) = -15991;
  char v19 = BYTE9(v34);
  if (BYTE9(v34) > 0x28uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 24);
    uint64_t v22 = BYTE10(v34);
    ++BYTE10(v34);
    long long v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v33 + 1), v22 | 0x1800000000) + 16;
    char v19 = v22;
  }
  else
  {
    long long v20 = (char *)(v18 + BYTE9(v34));
    BYTE9(v34) += 24;
  }
  *(unsigned char *)(v18 + 13) = v19;
  long long v23 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v25 = (uint64_t *)[v6 traceStream];
  if (v25) {
    uint64_t v26 = *v25;
  }
  else {
    uint64_t v26 = 0;
  }
  *(void *)long long v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = a4;
  s();
  *(void *)uint64_t v27 = v28;
  *(unsigned char *)(v27 + 8) = BYTE8(v34);
  *(unsigned char *)(v33 + 15) |= 8u;
}

void __52__CaptureMTLCommandBuffer_encodeWaitForEvent_value___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  s();
  id v6 = v5;
  uint64_t v7 = *v5;
  uint64_t *v5 = v8;
  *((unsigned char *)v5 + 8) |= 0x40u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 24);
  [*(id *)(a1 + 40) traceStream];
  GTTraceContext_pushEncoderWithStream(v9, (uint64_t)&v18);
  uint64_t v10 = v19;
  *(_DWORD *)(v19 + 8) = -15975;
  char v11 = BYTE9(v20);
  if (BYTE9(v20) > 0x30uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 24);
    uint64_t v14 = BYTE10(v20);
    ++BYTE10(v20);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v19 + 1), v14 | 0x1000000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v20));
    BYTE9(v20) += 16;
  }
  *(unsigned char *)(v10 + 13) = v11;
  id v15 = (uint64_t *)[*(id *)(a1 + 40) traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)uint64_t v12 = v16;
  *((void *)v12 + 1) = a3;
  *id v6 = v7;
  *(unsigned char *)(v19 + 15) |= 8u;
  uint64_t v17 = [*(id *)(a1 + 48) dispatchGroup];
  dispatch_group_leave(v17);
}

void __52__CaptureMTLCommandBuffer_encodeWaitForEvent_value___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  s();
  id v6 = v5;
  uint64_t v7 = *v5;
  uint64_t *v5 = v8;
  *((unsigned char *)v5 + 8) |= 0x40u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 24);
  [*(id *)(a1 + 40) traceStream];
  GTTraceContext_pushEncoderWithStream(v9, (uint64_t)&v18);
  uint64_t v10 = v19;
  *(_DWORD *)(v19 + 8) = -15490;
  char v11 = BYTE9(v20);
  if (BYTE9(v20) > 0x30uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 24);
    uint64_t v14 = BYTE10(v20);
    ++BYTE10(v20);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v19 + 1), v14 | 0x1000000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v20));
    BYTE9(v20) += 16;
  }
  *(unsigned char *)(v10 + 13) = v11;
  id v15 = (uint64_t *)[*(id *)(a1 + 40) traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)uint64_t v12 = v16;
  *((void *)v12 + 1) = a3;
  *id v6 = v7;
  *(unsigned char *)(v19 + 15) |= 8u;
  uint64_t v17 = [*(id *)(a1 + 48) dispatchGroup];
  dispatch_group_leave(v17);
}

- (void)unionRetainSet:(id)a3
{
  if (self->_retainedObjects != a3)
  {
    p_retainMutex = &self->_retainMutex;
    id v5 = a3;
    pthread_mutex_lock(p_retainMutex);
    [(NSMutableSet *)self->_retainedObjects unionSet:v5];

    pthread_mutex_unlock(p_retainMutex);
  }
}

- (void)dealloc
{
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v3 = self->_downloadPoints;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v9 = [v8 downloadValue];
        uint64_t v10 = [v8 downloadEvent];
        [v10 setSignaledValue:v9];
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v5);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v33);
  s();
  uint64_t v12 = v11;
  uint64_t v13 = *v11;
  *char v11 = v14;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v15 = self->_completedDispatchArray;
  id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v29 + 1) + 8 * (void)j) + 16))();
      }
      id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v40 count:16];
    }
    while (v17);
  }

  *uint64_t v12 = v13;
  uint64_t v20 = v34;
  *(_DWORD *)(v34 + 8) = -16363;
  char v21 = BYTE9(v35);
  if (BYTE9(v35) > 0x38uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v33 + 1) + 24);
    uint64_t v24 = BYTE10(v35);
    ++BYTE10(v35);
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v34 + 1), v24 | 0x800000000) + 16;
    char v21 = v24;
  }
  else
  {
    uint64_t v22 = (char *)(v20 + BYTE9(v35));
    BYTE9(v35) += 8;
  }
  *(unsigned char *)(v20 + 13) = v21;
  long long v25 = [(CaptureMTLCommandBuffer *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v22 = var0;
  *uint64_t v12 = v35;
  *((unsigned char *)v12 + 8) = BYTE8(v35);
  *(unsigned char *)(v34 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  pthread_mutex_destroy(&self->_retainMutex);
  pool = self->_pool;
  if (pool) {
    apr_pool_destroy(pool);
  }
  v28.receiver = self;
  v28.super_class = (Class)CaptureMTLCommandBuffer;
  [(CaptureMTLCommandBuffer *)&v28 dealloc];
}

- (MTLSharedEvent)accelerationStructureDescriptorProcessEvent
{
  return self->_accelerationStructureDescriptorProcessEvent;
}

- (CaptureMTLCommandQueue)captureCommandQueue
{
  return self->_captureCommandQueue;
}

- (CaptureMTLCommandBuffer)initWithBaseObject:(id)a3 captureCommandQueue:(id)a4 funcRef:(GTTraceFuncRef)a5
{
  unint64_t var1 = a5.var1;
  unint64_t var0 = a5.var0;
  id v10 = a3;
  id v11 = a4;
  v57.receiver = self;
  v57.super_class = (Class)CaptureMTLCommandBuffer;
  uint64_t v12 = [(CaptureMTLCommandBuffer *)&v57 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_captureCommandQueue, a4);
    objc_storeStrong((id *)&v13->_baseObject, a3);
    uint64_t v14 = (GTTraceContext *)[v11 traceContext];
    v13->_traceContext = v14;
    id v15 = DEVICEOBJECT(v10);
    v13->_traceuint64_t Stream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v14, (unint64_t)v15, 0);

    traceuint64_t Stream = v13->_traceStream;
    if (traceStream) {
      unint64_t v17 = traceStream->var0;
    }
    else {
      unint64_t v17 = 0;
    }
    uint64_t v18 = [v11 device];
    long long v19 = (uint64_t *)[v18 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0;
    }
    char v21 = (uint64_t *)[v11 traceStream];
    if (v21) {
      uint64_t v22 = *v21;
    }
    else {
      uint64_t v22 = 0;
    }

    *(void *)&long long v47 = 0x400000008;
    *((void *)&v47 + 1) = v17;
    unint64_t v48 = var1;
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = v20;
    uint64_t v52 = 0;
    uint64_t v53 = v22;
    unint64_t v54 = var0;
    uint64_t v55 = 0;
    uint64_t v56 = 0;
    GTCaptureBoundaryTracker_handleTrigger(&v47);
    BOOL v23 = (*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2;
    v13->_BOOL isCapturing = v23;
    if (v23)
    {
      uint64_t v24 = *(void *)_sharedCaptureManager;
      if (*(void *)_sharedCaptureManager)
      {
        long long v25 = [v11 device];
        uint64_t v26 = (uint64_t *)[v25 traceStream];
        if (v26) {
          uint64_t v27 = *v26;
        }
        else {
          uint64_t v27 = 0;
        }
        v13->_BOOL isCapturing = v24 == v27;
      }
      else
      {
        v13->_BOOL isCapturing = 1;
      }
      uint64_t v28 = objc_opt_new();
      scheduledDispatchArray = v13->_scheduledDispatchArray;
      v13->_scheduledDispatchArray = (NSMutableArray *)v28;
    }
    pthread_mutex_init(&v13->_retainMutex, 0);
    if (([v10 retainedReferences] & 1) != 0 || v13->_isCapturing)
    {
      long long v30 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      retainedObjects = v13->_retainedObjects;
      v13->_retainedObjects = v30;

      if (v13->_isCapturing)
      {
        apr_pool_create_ex(&v13->_pool, 0, 0, 0);
        long long v32 = DEVICEOBJECT(v10);

        long long v33 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:1];
        downloadPoints = v13->_downloadPoints;
        v13->_downloadPoints = v33;

        long long v35 = [v32 device];
        long long v36 = (MTLSharedEvent *)[v35 newSharedEvent];
        downloadEvent = v13->_downloadEvent;
        v13->_downloadEvent = v36;

        long long v38 = DEVICEOBJECT(v13->_downloadEvent);
        long long v39 = DEVICEOBJECT(v13->_baseObject);
        uint64_t v42 = _NSConcreteStackBlock;
        uint64_t v43 = 3221225472;
        uint64_t v44 = __74__CaptureMTLCommandBuffer_initWithBaseObject_captureCommandQueue_funcRef___block_invoke;
        unsigned int v45 = &unk_222170;
        id v46 = v38;
        id v40 = v38;
        [v39 addCompletedHandler:&v42];

        [(CaptureMTLCommandBuffer *)v13 _encodeDownloadPoint];
        id v10 = v32;
      }
    }
    v13->_presentDrawableUsed = 0;
  }

  return v13;
}

id __74__CaptureMTLCommandBuffer_initWithBaseObject_captureCommandQueue_funcRef___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hash];
}

- (void)_encodeDownloadPoint
{
  id v9 = objc_alloc_init(GTDownloadPoint);
  uint64_t v3 = 2 * (void)[(NSMutableArray *)self->_downloadPoints count];
  [(GTDownloadPoint *)v9 setWaitValue:v3 | 1];
  [(GTDownloadPoint *)v9 setWaitEvent:self->_downloadEvent];
  [(GTDownloadPoint *)v9 setDownloadValue:v3 + 2];
  [(GTDownloadPoint *)v9 setDownloadEvent:self->_downloadEvent];
  [(NSMutableArray *)self->_downloadPoints addObject:v9];
  id v4 = DEVICEOBJECT(self->_baseObject);
  id v5 = [(GTDownloadPoint *)v9 waitEvent];
  [v4 encodeSignalEvent:v5 value:-[GTDownloadPoint waitValue](v9, "waitValue")];

  char v6 = objc_opt_respondsToSelector();
  uint64_t v7 = [(GTDownloadPoint *)v9 downloadEvent];
  id v8 = [(GTDownloadPoint *)v9 downloadValue];
  if (v6) {
    [v4 encodeWaitForEvent:v7 value:v8 timeout:GT_ENV];
  }
  else {
    [v4 encodeWaitForEvent:v7 value:v8];
  }
}

- (MTLCommandBuffer)baseObject
{
  return self->_baseObject;
}

@end