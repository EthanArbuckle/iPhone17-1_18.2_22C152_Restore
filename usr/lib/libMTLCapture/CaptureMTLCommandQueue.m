@interface CaptureMTLCommandQueue
- (BOOL)commitSynchronously;
- (BOOL)commitsWithQoS;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)disableCrossQueueHazardTracking;
- (BOOL)executionEnabled;
- (BOOL)isOpenGLQueue;
- (BOOL)isProfilingEnabled;
- (BOOL)isStatEnabled;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)setBackgroundGPUPriority:(unint64_t)a3;
- (BOOL)setBackgroundGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4;
- (BOOL)setGPUPriority:(unint64_t)a3;
- (BOOL)setGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4;
- (BOOL)skipRender;
- (CaptureMTLCommandQueue)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLCommandQueue)accelerationStructureDescriptorDownloadQueue;
- (MTLCommandQueue)baseObject;
- (MTLCommandQueue)downloadQueue;
- (MTLDevice)device;
- (NSArray)enqueuedCommandBuffers;
- (NSString)description;
- (NSString)label;
- (OS_dispatch_queue)commitQueue;
- (OS_dispatch_queue)completionQueue;
- (id)availableCounters;
- (id)availableCountersAndDict;
- (id)commandBuffer;
- (id)commandBufferWithDescriptor:(id)a3;
- (id)commandBufferWithUnretainedReferences;
- (id)counterInfo;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)getRequestedCounters;
- (id)originalObject;
- (id)subdivideCounterList:(id)a3;
- (int)backgroundTrackingPID;
- (int)requestCounters:(id)a3;
- (int)requestCounters:(id)a3 withIndex:(unint64_t)a4;
- (unint64_t)getBackgroundGPUPriority;
- (unint64_t)getGPUPriority;
- (unint64_t)getStatLocations;
- (unint64_t)getStatOptions;
- (unint64_t)maxCommandBufferCount;
- (unint64_t)qosLevel;
- (unint64_t)streamReference;
- (void)addPerfSampleHandler:(id)a3;
- (void)addResidencySet:(id)a3;
- (void)addResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)commitCommandBuffer:(id)a3 withIndex:(unint64_t)a4;
- (void)dealloc;
- (void)enqueueCommandBuffer:(id)a3;
- (void)finish;
- (void)insertDebugCaptureBoundary;
- (void)removeResidencySet:(id)a3;
- (void)removeResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)setBackgroundTrackingPID:(int)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setExecutionEnabled:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setProfilingEnabled:(BOOL)a3;
- (void)setSkipRender:(BOOL)a3;
- (void)setStatEnabled:(BOOL)a3;
- (void)setStatLocations:(unint64_t)a3;
- (void)setStatOptions:(unint64_t)a3;
- (void)setSubmissionQueue:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLCommandQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSnapshot, 0);
  objc_storeStrong((id *)&self->_currentResidencySets, 0);
  objc_storeStrong((id *)&self->_accelerationStructureDescriptorDownloadQueue, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->_pendingQueueLock, 0);
  objc_storeStrong((id *)&self->_pendingQueue, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (id)subdivideCounterList:(id)a3
{
  return [(MTLCommandQueueSPI *)self->_baseObject subdivideCounterList:a3];
}

- (void)setSubmissionQueue:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v15);
  -[MTLCommandQueueSPI setSubmissionQueue:](self->_baseObject, "setSubmissionQueue:", v5, (void)v15);
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -15804;
  char v7 = BYTE9(v17);
  if (BYTE9(v17) > 0x30uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 24);
    uint64_t v10 = BYTE10(v17);
    ++BYTE10(v17);
    v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v16 + 1), v10 | 0x1000000000) + 16;
    char v7 = v10;
  }
  else
  {
    v8 = (char *)(v6 + BYTE9(v17));
    BYTE9(v17) += 16;
  }
  *(unsigned char *)(v6 + 13) = v7;
  v11 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v8 = var0;
  *((void *)v8 + 1) = v5;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v17);
  *(unsigned char *)(v16 + 15) |= 8u;
}

- (BOOL)setGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
  unsigned int v7 = [(MTLCommandQueueSPI *)self->_baseObject setGPUPriority:a3 offset:v4];
  uint64_t v8 = v19;
  *(_DWORD *)(v19 + 8) = -15805;
  char v9 = BYTE9(v20);
  if (BYTE9(v20) > 0x28uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 24);
    uint64_t v12 = BYTE10(v20);
    ++BYTE10(v20);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v19 + 1), v12 | 0x1800000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v20));
    BYTE9(v20) += 24;
  }
  *(unsigned char *)(v8 + 13) = v9;
  uint64_t v13 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = a3;
  *((_DWORD *)v10 + 4) = v7;
  *((_WORD *)v10 + 10) = v4;
  *((_WORD *)v10 + 11) = 0;
  s();
  *(void *)uint64_t v15 = v16;
  *(unsigned char *)(v15 + 8) = BYTE8(v20);
  *(unsigned char *)(v19 + 15) |= 8u;
  return v7;
}

- (BOOL)setGPUPriority:(unint64_t)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  unsigned int v5 = [(MTLCommandQueueSPI *)self->_baseObject setGPUPriority:a3];
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15806;
  char v7 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v10 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v17 + 1), v10 | 0x1800000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v6 + 13) = v7;
  uint64_t v11 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  *((void *)v8 + 1) = a3;
  *((_DWORD *)v8 + 4) = v5;
  *((_DWORD *)v8 + 5) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
  return v5;
}

- (void)setCompletionQueue:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v15);
  -[MTLCommandQueueSPI setCompletionQueue:](self->_baseObject, "setCompletionQueue:", v5, (void)v15);
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -15807;
  char v7 = BYTE9(v17);
  if (BYTE9(v17) > 0x30uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 24);
    uint64_t v10 = BYTE10(v17);
    ++BYTE10(v17);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v16 + 1), v10 | 0x1000000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v17));
    BYTE9(v17) += 16;
  }
  *(unsigned char *)(v6 + 13) = v7;
  uint64_t v11 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  *((void *)v8 + 1) = v5;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v17);
  *(unsigned char *)(v16 + 15) |= 8u;
}

- (BOOL)setBackgroundGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
  unsigned int v7 = [(MTLCommandQueueSPI *)self->_baseObject setBackgroundGPUPriority:a3 offset:v4];
  uint64_t v8 = v19;
  *(_DWORD *)(v19 + 8) = -15808;
  char v9 = BYTE9(v20);
  if (BYTE9(v20) > 0x28uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 24);
    uint64_t v12 = BYTE10(v20);
    ++BYTE10(v20);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v19 + 1), v12 | 0x1800000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v20));
    BYTE9(v20) += 24;
  }
  *(unsigned char *)(v8 + 13) = v9;
  uint64_t v13 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = a3;
  *((_DWORD *)v10 + 4) = v7;
  *((_WORD *)v10 + 10) = v4;
  *((_WORD *)v10 + 11) = 0;
  s();
  *(void *)uint64_t v15 = v16;
  *(unsigned char *)(v15 + 8) = BYTE8(v20);
  *(unsigned char *)(v19 + 15) |= 8u;
  return v7;
}

- (BOOL)setBackgroundGPUPriority:(unint64_t)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  unsigned int v5 = [(MTLCommandQueueSPI *)self->_baseObject setBackgroundGPUPriority:a3];
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15809;
  char v7 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v10 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v17 + 1), v10 | 0x1800000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v6 + 13) = v7;
  uint64_t v11 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  *((void *)v8 + 1) = a3;
  *((_DWORD *)v8 + 4) = v5;
  *((_DWORD *)v8 + 5) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
  return v5;
}

- (int)requestCounters:(id)a3 withIndex:(unint64_t)a4
{
  return [(MTLCommandQueueSPI *)self->_baseObject requestCounters:a3 withIndex:a4];
}

- (int)requestCounters:(id)a3
{
  return [(MTLCommandQueueSPI *)self->_baseObject requestCounters:a3];
}

- (id)getRequestedCounters
{
  return [(MTLCommandQueueSPI *)self->_baseObject getRequestedCounters];
}

- (unint64_t)getGPUPriority
{
  return (unint64_t)[(MTLCommandQueueSPI *)self->_baseObject getGPUPriority];
}

- (unint64_t)getBackgroundGPUPriority
{
  return (unint64_t)[(MTLCommandQueueSPI *)self->_baseObject getBackgroundGPUPriority];
}

- (void)finish
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLCommandQueueSPI *)self->_baseObject finish];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16340;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    unsigned int v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    unsigned int v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)unsigned int v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
}

- (id)counterInfo
{
  return [(MTLCommandQueueSPI *)self->_baseObject counterInfo];
}

- (id)commandBufferWithUnretainedReferences
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  long long v23 = (unint64_t)traceContext;
  s();
  uint64_t v6 = v5;
  unint64_t v7 = *v5;
  *unsigned int v5 = add;
  *(void *)&long long v25 = v7;
  BYTE8(v25) = *((unsigned char *)v5 + 8);
  *(_WORD *)((char *)&v25 + 9) = 16400;
  *(_DWORD *)((char *)&v25 + 11) = 0;
  HIBYTE(v25) = 0;
  uint64_t v8 = [(MTLCommandQueueSPI *)self->_baseObject commandBufferWithUnretainedReferences];
  if (v8) {
    uint64_t v9 = -[CaptureMTLCommandBuffer initWithBaseObject:captureCommandQueue:funcRef:]([CaptureMTLCommandBuffer alloc], "initWithBaseObject:captureCommandQueue:funcRef:", v8, self, 0, add);
  }
  else {
    uint64_t v9 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v23, (uint64_t)[(CaptureMTLCommandBuffer *)v9 traceStream]);
  CreateCommandBufferEpilogue(v8);
  uint64_t v10 = v24;
  *(_DWORD *)(v24 + 8) = -16342;
  char v11 = BYTE9(v25);
  if (BYTE9(v25) > 0x30uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v14 = BYTE10(v25);
    ++BYTE10(v25);
    long long v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v24 + 1), v14 | 0x1000000000) + 16;
    char v11 = v14;
  }
  else
  {
    long long v12 = (char *)(v10 + BYTE9(v25));
    BYTE9(v25) += 16;
  }
  *(unsigned char *)(v10 + 13) = v11;
  uint64_t v15 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v17 = [(CaptureMTLCommandBuffer *)v9 traceStream];
  if (v17) {
    unint64_t v18 = v17->var0;
  }
  else {
    unint64_t v18 = 0;
  }
  *(void *)long long v12 = var0;
  *((void *)v12 + 1) = v18;
  unsigned __int8 __src = [(CaptureMTLCommandBuffer *)v9 isCapturing];
  char v19 = GTTraceEncoder_storeBytes((uint64_t)&v23, &__src, 1uLL);
  uint64_t v20 = v24;
  *(unsigned char *)(v24 + 14) = v19;
  *uint64_t v6 = v25;
  *((unsigned char *)v6 + 8) = BYTE8(v25);
  *(unsigned char *)(v20 + 15) |= 8u;

  return v9;
}

- (id)commandBufferWithDescriptor:(id)a3
{
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  traceContext = self->_traceContext;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  long long v28 = (unint64_t)traceContext;
  *(void *)&long long v29 = 0;
  *((void *)&v29 + 1) = add;
  s();
  uint64_t v8 = v7;
  unint64_t v9 = *v7;
  *unint64_t v7 = add;
  *(void *)&long long v30 = v9;
  BYTE8(v30) = *((unsigned char *)v7 + 8);
  *(_WORD *)((char *)&v30 + 9) = 16400;
  *(_DWORD *)((char *)&v30 + 11) = 0;
  HIBYTE(v30) = 0;
  baseObject = self->_baseObject;
  char v11 = unwrapMTLCommandBufferDescriptor(v4);
  long long v12 = [(MTLCommandQueueSPI *)baseObject commandBufferWithDescriptor:v11];

  if (v12) {
    uint64_t v13 = -[CaptureMTLCommandBuffer initWithBaseObject:captureCommandQueue:funcRef:]([CaptureMTLCommandBuffer alloc], "initWithBaseObject:captureCommandQueue:funcRef:", v12, self, 0, add);
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)[(CaptureMTLCommandBuffer *)v13 traceStream]);
  CreateCommandBufferEpilogue(v12);
  uint64_t v14 = v29;
  *(_DWORD *)(v29 + 8) = -15701;
  char v15 = BYTE9(v30);
  if (BYTE9(v30) > 0x28uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v18 = BYTE10(v30);
    ++BYTE10(v30);
    long long v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v29 + 1), v18 | 0x1800000000) + 16;
    char v15 = v18;
  }
  else
  {
    long long v16 = (char *)(v14 + BYTE9(v30));
    BYTE9(v30) += 24;
  }
  *(unsigned char *)(v14 + 13) = v15;
  char v19 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v21 = [(CaptureMTLCommandBuffer *)v13 traceStream];
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0;
  }
  char v23 = SaveMTLCommandBufferDescriptor((uint64_t)&v28, v4);
  *(void *)long long v16 = var0;
  *((void *)v16 + 1) = v22;
  v16[16] = v23;
  *(_DWORD *)(v16 + 17) = 0;
  *((_DWORD *)v16 + 5) = 0;
  unsigned __int8 __src = [(CaptureMTLCommandBuffer *)v13 isCapturing];
  char v24 = GTTraceEncoder_storeBytes((uint64_t)&v28, &__src, 1uLL);
  uint64_t v25 = v29;
  *(unsigned char *)(v29 + 14) = v24;
  unint64_t *v8 = v30;
  *((unsigned char *)v8 + 8) = BYTE8(v30);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v13;
}

- (id)commandBuffer
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  long long v23 = (unint64_t)traceContext;
  s();
  uint64_t v6 = v5;
  unint64_t v7 = *v5;
  *unsigned int v5 = add;
  *(void *)&long long v25 = v7;
  BYTE8(v25) = *((unsigned char *)v5 + 8);
  *(_WORD *)((char *)&v25 + 9) = 16400;
  *(_DWORD *)((char *)&v25 + 11) = 0;
  HIBYTE(v25) = 0;
  uint64_t v8 = [(MTLCommandQueueSPI *)self->_baseObject commandBuffer];
  if (v8) {
    unint64_t v9 = -[CaptureMTLCommandBuffer initWithBaseObject:captureCommandQueue:funcRef:]([CaptureMTLCommandBuffer alloc], "initWithBaseObject:captureCommandQueue:funcRef:", v8, self, 0, add);
  }
  else {
    unint64_t v9 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v23, (uint64_t)[(CaptureMTLCommandBuffer *)v9 traceStream]);
  CreateCommandBufferEpilogue(v8);
  uint64_t v10 = v24;
  *(_DWORD *)(v24 + 8) = -16343;
  char v11 = BYTE9(v25);
  if (BYTE9(v25) > 0x30uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v14 = BYTE10(v25);
    ++BYTE10(v25);
    long long v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v24 + 1), v14 | 0x1000000000) + 16;
    char v11 = v14;
  }
  else
  {
    long long v12 = (char *)(v10 + BYTE9(v25));
    BYTE9(v25) += 16;
  }
  *(unsigned char *)(v10 + 13) = v11;
  char v15 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = [(CaptureMTLCommandBuffer *)v9 traceStream];
  if (v17) {
    unint64_t v18 = v17->var0;
  }
  else {
    unint64_t v18 = 0;
  }
  *(void *)long long v12 = var0;
  *((void *)v12 + 1) = v18;
  unsigned __int8 __src = [(CaptureMTLCommandBuffer *)v9 isCapturing];
  char v19 = GTTraceEncoder_storeBytes((uint64_t)&v23, &__src, 1uLL);
  uint64_t v20 = v24;
  *(unsigned char *)(v24 + 14) = v19;
  *uint64_t v6 = v25;
  *((unsigned char *)v6 + 8) = BYTE8(v25);
  *(unsigned char *)(v20 + 15) |= 8u;

  return v9;
}

- (id)availableCountersAndDict
{
  return [(MTLCommandQueueSPI *)self->_baseObject availableCountersAndDict];
}

- (id)availableCounters
{
  return [(MTLCommandQueueSPI *)self->_baseObject availableCounters];
}

- (void)setSkipRender:(BOOL)a3
{
  BOOL v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLCommandQueueSPI *)self->_baseObject setSkipRender:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16347;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    unint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    unint64_t v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)unint64_t v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (BOOL)skipRender
{
  return [(MTLCommandQueueSPI *)self->_baseObject skipRender];
}

- (unint64_t)qosLevel
{
  return (unint64_t)[(MTLCommandQueueSPI *)self->_baseObject qosLevel];
}

- (void)setProfilingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLCommandQueueSPI *)self->_baseObject setProfilingEnabled:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16345;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    unint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    unint64_t v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)unint64_t v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (BOOL)isProfilingEnabled
{
  return [(MTLCommandQueueSPI *)self->_baseObject isProfilingEnabled];
}

- (unint64_t)maxCommandBufferCount
{
  return (unint64_t)[(MTLCommandQueueSPI *)self->_baseObject maxCommandBufferCount];
}

- (NSString)label
{
  return (NSString *)[(MTLCommandQueueSPI *)self->_baseObject label];
}

- (BOOL)isOpenGLQueue
{
  return [(MTLCommandQueueSPI *)self->_baseObject isOpenGLQueue];
}

- (void)setExecutionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLCommandQueueSPI *)self->_baseObject setExecutionEnabled:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16346;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    unint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    unint64_t v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)unint64_t v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (BOOL)executionEnabled
{
  return [(MTLCommandQueueSPI *)self->_baseObject executionEnabled];
}

- (BOOL)disableCrossQueueHazardTracking
{
  return [(MTLCommandQueueSPI *)self->_baseObject disableCrossQueueHazardTracking];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (OS_dispatch_queue)completionQueue
{
  return (OS_dispatch_queue *)[(MTLCommandQueueSPI *)self->_baseObject completionQueue];
}

- (BOOL)commitsWithQoS
{
  return [(MTLCommandQueueSPI *)self->_baseObject commitsWithQoS];
}

- (BOOL)commitSynchronously
{
  return [(MTLCommandQueueSPI *)self->_baseObject commitSynchronously];
}

- (OS_dispatch_queue)commitQueue
{
  return (OS_dispatch_queue *)[(MTLCommandQueueSPI *)self->_baseObject commitQueue];
}

- (void)setBackgroundTrackingPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLCommandQueueSPI *)self->_baseObject setBackgroundTrackingPID:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16348;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    unint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    unint64_t v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)unint64_t v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (int)backgroundTrackingPID
{
  return [(MTLCommandQueueSPI *)self->_baseObject backgroundTrackingPID];
}

- (void)setStatOptions:(unint64_t)a3
{
}

- (unint64_t)getStatOptions
{
  return (unint64_t)[(MTLCommandQueueSPI *)self->_baseObject getStatOptions];
}

- (void)setStatLocations:(unint64_t)a3
{
}

- (unint64_t)getStatLocations
{
  return (unint64_t)[(MTLCommandQueueSPI *)self->_baseObject getStatLocations];
}

- (void)setStatEnabled:(BOOL)a3
{
}

- (BOOL)isStatEnabled
{
  return [(MTLCommandQueueSPI *)self->_baseObject isStatEnabled];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLCommandQueueSPI *)baseObject conformsToProtocol:v4];

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
  v7.super_class = (Class)CaptureMTLCommandQueue;
  uint64_t v3 = [(CaptureMTLCommandQueue *)&v7 description];
  id v4 = [(MTLCommandQueueSPI *)self->_baseObject description];
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

- (void)removeResidencySets:(const void *)a3 count:(unint64_t)a4
{
  CommandQueueTakeSnapshot(self);
  if (a4)
  {
    uint64_t v7 = 0;
    do
    {
      objc_opt_class();
      uint64_t isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        uint64_t isKindOfClass = (uint64_t)[(NSMutableSet *)self->_currentResidencySets removeObject:a3[v7]];
      }
      ++v7;
    }
    while (a4 != v7);
    baseObject = self->_baseObject;
    size_t v11 = 8 * a4;
    __chkstk_darwin(isKindOfClass, v9);
    uint64_t v12 = (char *)&v25 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v12, 8 * a4);
    uint64_t v13 = 0;
    do
    {
      *(void *)&v12[8 * v13] = [(id)a3[v13] baseObject];
      ++v13;
    }
    while (a4 != v13);
  }
  else
  {
    size_t v11 = 0;
    baseObject = self->_baseObject;
    uint64_t v12 = &v28;
  }
  [(MTLCommandQueueSPI *)baseObject removeResidencySets:v12 count:a4];
  if (self->_snapshotCreated)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v25);
    uint64_t v14 = v26;
    *(_DWORD *)(v26 + 8) = -15249;
    char v15 = BYTE9(v27);
    if (BYTE9(v27) > 0x28uLL)
    {
      uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
      uint64_t v18 = BYTE10(v27);
      ++BYTE10(v27);
      long long v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x1800000000) + 16;
      char v15 = v18;
    }
    else
    {
      long long v16 = (char *)(v14 + BYTE9(v27));
      BYTE9(v27) += 24;
    }
    *(unsigned char *)(v14 + 13) = v15;
    char v19 = [(CaptureMTLCommandQueue *)self traceStream];
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    __chkstk_darwin(v19, v20);
    bzero((char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
    char v22 = StreamArray((uint64_t)&v25, (long long *)((char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, a4);
    *(void *)long long v16 = var0;
    *((void *)v16 + 1) = a4;
    v16[16] = v22;
    *(_DWORD *)(v16 + 17) = 0;
    *((_DWORD *)v16 + 5) = 0;
    s();
    *(void *)uint64_t v23 = v24;
    *(unsigned char *)(v23 + 8) = BYTE8(v27);
    *(unsigned char *)(v26 + 15) |= 8u;
  }
}

- (void)removeResidencySet:(id)a3
{
  id v4 = a3;
  CommandQueueTakeSnapshot(self);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(NSMutableSet *)self->_currentResidencySets removeObject:v4];
  }
  baseObject = self->_baseObject;
  BOOL v6 = [v4 baseObject];
  [(MTLCommandQueueSPI *)baseObject removeResidencySet:v6];

  if (self->_snapshotCreated)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
    uint64_t v7 = v19;
    *(_DWORD *)(v19 + 8) = -15250;
    char v8 = BYTE9(v20);
    if (BYTE9(v20) > 0x30uLL)
    {
      uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 24);
      uint64_t v11 = BYTE10(v20);
      ++BYTE10(v20);
      uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v19 + 1), v11 | 0x1000000000) + 16;
      char v8 = v11;
    }
    else
    {
      uint64_t v9 = (char *)(v7 + BYTE9(v20));
      BYTE9(v20) += 16;
    }
    *(unsigned char *)(v7 + 13) = v8;
    uint64_t v12 = [(CaptureMTLCommandQueue *)self traceStream];
    if (v12) {
      unint64_t var0 = v12->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    uint64_t v14 = (uint64_t *)[v4 traceStream];
    if (v14) {
      uint64_t v15 = *v14;
    }
    else {
      uint64_t v15 = 0;
    }
    *(void *)uint64_t v9 = var0;
    *((void *)v9 + 1) = v15;
    s();
    *(void *)uint64_t v16 = v17;
    *(unsigned char *)(v16 + 8) = BYTE8(v20);
    *(unsigned char *)(v19 + 15) |= 8u;
  }
}

- (void)addResidencySets:(const void *)a3 count:(unint64_t)a4
{
  CommandQueueTakeSnapshot(self);
  size_t v7 = 0;
  if (a4)
  {
    do
      AddResidencySet(self, (void *)a3[v7++]);
    while (a4 != v7);
    baseObject = self->_baseObject;
    size_t v7 = 8 * a4;
    __chkstk_darwin(v8, v9);
    uint64_t v11 = (char *)&v24 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v11, 8 * a4);
    uint64_t v12 = 0;
    do
    {
      *(void *)&v11[8 * v12] = [(id)a3[v12] baseObject];
      ++v12;
    }
    while (a4 != v12);
  }
  else
  {
    baseObject = self->_baseObject;
    uint64_t v11 = &v27;
  }
  [(MTLCommandQueueSPI *)baseObject addResidencySets:v11 count:a4];
  if (self->_snapshotCreated)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v24);
    uint64_t v13 = v25;
    *(_DWORD *)(v25 + 8) = -15251;
    char v14 = BYTE9(v26);
    if (BYTE9(v26) > 0x28uLL)
    {
      uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 24);
      uint64_t v17 = BYTE10(v26);
      ++BYTE10(v26);
      uint64_t v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v25 + 1), v17 | 0x1800000000) + 16;
      char v14 = v17;
    }
    else
    {
      uint64_t v15 = (char *)(v13 + BYTE9(v26));
      BYTE9(v26) += 24;
    }
    *(unsigned char *)(v13 + 13) = v14;
    long long v18 = [(CaptureMTLCommandQueue *)self traceStream];
    if (v18) {
      unint64_t var0 = v18->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    __chkstk_darwin(v18, v19);
    bzero((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    char v21 = StreamArray((uint64_t)&v24, (long long *)((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, a4);
    *(void *)uint64_t v15 = var0;
    *((void *)v15 + 1) = a4;
    v15[16] = v21;
    *(_DWORD *)(v15 + 17) = 0;
    *((_DWORD *)v15 + 5) = 0;
    s();
    *(void *)uint64_t v22 = v23;
    *(unsigned char *)(v22 + 8) = BYTE8(v26);
    *(unsigned char *)(v25 + 15) |= 8u;
  }
}

- (void)addResidencySet:(id)a3
{
  id v4 = a3;
  CommandQueueTakeSnapshot(self);
  AddResidencySet(self, v4);
  baseObject = self->_baseObject;
  BOOL v6 = [v4 baseObject];
  [(MTLCommandQueueSPI *)baseObject addResidencySet:v6];

  if (self->_snapshotCreated)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v18);
    uint64_t v7 = v19;
    *(_DWORD *)(v19 + 8) = -15252;
    char v8 = BYTE9(v20);
    if (BYTE9(v20) > 0x30uLL)
    {
      uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 24);
      uint64_t v11 = BYTE10(v20);
      ++BYTE10(v20);
      uint64_t v9 = GTTraceMemPool_allocateBytes(v10, *((uint64_t *)&v19 + 1), v11 | 0x1000000000) + 16;
      char v8 = v11;
    }
    else
    {
      uint64_t v9 = (char *)(v7 + BYTE9(v20));
      BYTE9(v20) += 16;
    }
    *(unsigned char *)(v7 + 13) = v8;
    uint64_t v12 = [(CaptureMTLCommandQueue *)self traceStream];
    if (v12) {
      unint64_t var0 = v12->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    char v14 = (uint64_t *)[v4 traceStream];
    if (v14) {
      uint64_t v15 = *v14;
    }
    else {
      uint64_t v15 = 0;
    }
    *(void *)uint64_t v9 = var0;
    *((void *)v9 + 1) = v15;
    s();
    *(void *)uint64_t v16 = v17;
    *(unsigned char *)(v16 + 8) = BYTE8(v20);
    *(unsigned char *)(v19 + 15) |= 8u;
  }
}

- (void)addPerfSampleHandler:(id)a3
{
  id v4 = a3;
  self->_perfSampleHandlerUsed = 1;
  baseObject = self->_baseObject;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __47__CaptureMTLCommandQueue_addPerfSampleHandler___block_invoke;
  v7[3] = &unk_2221E8;
  id v8 = v4;
  id v6 = v4;
  [(MTLCommandQueueSPI *)baseObject addPerfSampleHandler:v7];
}

void __47__CaptureMTLCommandQueue_addPerfSampleHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_getAssociatedObject(v6, &sAssociationKey);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v6, &sAssociationKey, 0, 0);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSArray)enqueuedCommandBuffers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__8841;
  uint64_t v10 = __Block_byref_object_dispose__8842;
  id v11 = 0;
  pendingQueueLock = self->_pendingQueueLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __48__CaptureMTLCommandQueue_enqueuedCommandBuffers__block_invoke;
  v5[3] = &unk_2221C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(pendingQueueLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __48__CaptureMTLCommandQueue_enqueuedCommandBuffers__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return _objc_release_x1(v2, v4);
}

- (void)commitCommandBuffer:(id)a3 withIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_perfSampleHandlerUsed)
  {
    uint64_t v8 = [v6 baseObject];
    objc_setAssociatedObject(v8, &sAssociationKey, v7, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __56__CaptureMTLCommandQueue_commitCommandBuffer_withIndex___block_invoke;
    v14[3] = &unk_222170;
    id v15 = v7;
    [v8 addCompletedHandler:v14];
  }
  pendingQueueLock = self->_pendingQueueLock;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __56__CaptureMTLCommandQueue_commitCommandBuffer_withIndex___block_invoke_2;
  v11[3] = &unk_222198;
  v11[4] = self;
  id v12 = v7;
  unint64_t v13 = a4;
  id v10 = v7;
  dispatch_sync(pendingQueueLock, v11);
}

id __56__CaptureMTLCommandQueue_commitCommandBuffer_withIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) label];
}

id __56__CaptureMTLCommandQueue_commitCommandBuffer_withIndex___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 56) && (*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    uint64_t v3 = [*(id *)(v2 + 16) baseObject];
    uint64_t v4 = DEVICEOBJECT(v3);

    if (!qword_2501B8) {
      [*(id *)(*(void *)(a1 + 32) + 8) maxCommandBufferCount];
    }
    id v5 = [v4 newCommandQueueWithMaxCommandBufferCount:];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = v5;
  }
  [*(id *)(a1 + 40) setIsCommited:1];
  if (([*(id *)(a1 + 40) isEnqueued] & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  }
  uint64_t v8 = (char *)[*(id *)(*(void *)(a1 + 32) + 40) count];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    while (1)
    {
      id v11 = [*(id *)(*(void *)(a1 + 32) + 40) objectAtIndexedSubscript:v10];
      if (([v11 isCommited] & 1) == 0) {
        break;
      }
      [v11 addRequestsToDownloadQueue:*(void *)(*(void *)(a1 + 32) + 56) withIndex:*(void *)(a1 + 48)];

      if (v9 == ++v10)
      {
        id v10 = v9;
        goto LABEL_15;
      }
    }
  }
  else
  {
    id v10 = 0;
  }
LABEL_15:
  id v12 = *(void **)(*(void *)(a1 + 32) + 40);

  return [v12 removeObjectsInRange:0, v10];
}

- (void)enqueueCommandBuffer:(id)a3
{
  id v4 = a3;
  if (([v4 isEnqueued] & 1) == 0)
  {
    pendingQueueLock = self->_pendingQueueLock;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __47__CaptureMTLCommandQueue_enqueueCommandBuffer___block_invoke;
    v6[3] = &unk_222148;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(pendingQueueLock, v6);
  }
}

id __47__CaptureMTLCommandQueue_enqueueCommandBuffer___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  GTMTLGuestAppClientRemoveMTLCommandQueueInfo(g_guestAppClientMTL, self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16344;
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
  uint64_t v8 = [(CaptureMTLCommandQueue *)self traceStream];
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
  v12.super_class = (Class)CaptureMTLCommandQueue;
  [(CaptureMTLCommandQueue *)&v12 dealloc];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLCommandQueueSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16349;
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
  uint64_t v10 = [(CaptureMTLCommandQueue *)self traceStream];
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
  GTMTLGuestAppClientUpdateMTLCommandQueueInfo(g_guestAppClientMTL);
}

- (void)insertDebugCaptureBoundary
{
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v30);
  uint64_t v3 = v31;
  *(_DWORD *)(v31 + 8) = -16341;
  char v4 = BYTE9(v32);
  if (BYTE9(v32) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v30 + 1) + 24);
    uint64_t v7 = BYTE10(v32);
    ++BYTE10(v32);
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v31 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    uint64_t v5 = (char *)(v3 + BYTE9(v32));
    BYTE9(v32) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  [(MTLCommandQueueSPI *)self->_baseObject insertDebugCaptureBoundary];
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v32);
  *(unsigned char *)(v31 + 15) |= 8u;
  id v12 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v12) {
    unint64_t v13 = v12->var0;
  }
  else {
    unint64_t v13 = 0;
  }
  uint64_t v14 = *(void *)v31;
  id v15 = [(CaptureMTLCommandQueue *)self device];
  size_t v16 = (uint64_t *)[v15 traceStream];
  if (v16) {
    uint64_t v17 = *v16;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = [(CaptureMTLCommandQueue *)self traceStream];
  if (v18) {
    unint64_t v19 = v18->var0;
  }
  else {
    unint64_t v19 = 0;
  }

  *(void *)&long long v20 = 0x300000007;
  *((void *)&v20 + 1) = v13;
  uint64_t v21 = v14;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = v17;
  uint64_t v25 = 0;
  unint64_t v26 = v19;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  GTCaptureBoundaryTracker_handleTrigger(&v20);
}

- (MTLCommandQueue)baseObject
{
  return self->_baseObject;
}

- (MTLCommandQueue)accelerationStructureDescriptorDownloadQueue
{
  accelerationStructureDescriptorDownloadQueue = self->_accelerationStructureDescriptorDownloadQueue;
  if (!accelerationStructureDescriptorDownloadQueue)
  {
    pendingQueueLock = self->_pendingQueueLock;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __70__CaptureMTLCommandQueue_accelerationStructureDescriptorDownloadQueue__block_invoke;
    block[3] = &unk_222120;
    block[4] = self;
    dispatch_sync(pendingQueueLock, block);
    accelerationStructureDescriptorDownloadQueue = self->_accelerationStructureDescriptorDownloadQueue;
  }

  return accelerationStructureDescriptorDownloadQueue;
}

void __70__CaptureMTLCommandQueue_accelerationStructureDescriptorDownloadQueue__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 64))
  {
    uint64_t v3 = [*(id *)(v1 + 16) baseObject];
    DEVICEOBJECT(v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!qword_2501B8) {
      [*(id *)(*(void *)(a1 + 32) + 8) maxCommandBufferCount];
    }
    id v4 = [v7 newCommandQueueWithMaxCommandBufferCount:];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v4;
  }
}

- (MTLCommandQueue)downloadQueue
{
  downloadQueue = self->_downloadQueue;
  if (!downloadQueue)
  {
    pendingQueueLock = self->_pendingQueueLock;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __39__CaptureMTLCommandQueue_downloadQueue__block_invoke;
    block[3] = &unk_222120;
    block[4] = self;
    dispatch_sync(pendingQueueLock, block);
    downloadQueue = self->_downloadQueue;
  }

  return downloadQueue;
}

void __39__CaptureMTLCommandQueue_downloadQueue__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 56))
  {
    uint64_t v3 = [*(id *)(v1 + 16) baseObject];
    DEVICEOBJECT(v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!qword_2501B8) {
      [*(id *)(*(void *)(a1 + 32) + 8) maxCommandBufferCount];
    }
    id v4 = [v7 newCommandQueueWithMaxCommandBufferCount:];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v4;
  }
}

- (CaptureMTLCommandQueue)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CaptureMTLCommandQueue;
  uint64_t v9 = [(CaptureMTLCommandQueue *)&v21 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_captureDevice, a4);
    objc_storeStrong((id *)&v10->_baseObject, a3);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    id v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);

    GTMTLGuestAppClientAddMTLCommandQueueInfo(g_guestAppClientMTL, v10);
    unint64_t v13 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:1];
    pendingQueue = v10->_pendingQueue;
    v10->_pendingQueue = v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.dt.GPUTools.pendingQueueLock", 0);
    pendingQueueLock = v10->_pendingQueueLock;
    v10->_pendingQueueLock = (OS_dispatch_queue *)v15;

    uint64_t v17 = +[NSMutableSet set];
    currentResidencySets = v10->_currentResidencySets;
    v10->_currentResidencySets = (NSMutableSet *)v17;

    lastSnapshot = v10->_lastSnapshot;
    v10->_lastSnapshot = 0;

    v10->_snapshotCreated = (*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2;
  }

  return v10;
}

@end