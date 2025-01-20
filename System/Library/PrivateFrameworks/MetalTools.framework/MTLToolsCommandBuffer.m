@interface MTLToolsCommandBuffer
+ (id)unwrapMTLComputePassDescriptorInternal:(id)a3;
- (BOOL)addRetainedObject:(id)a3;
- (BOOL)commitAndWaitUntilSubmitted;
- (BOOL)commitAndWaitUntilSubmittedWithDeadline:(unint64_t)a3;
- (BOOL)isProfilingEnabled;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)retainedReferences;
- (BOOL)useRetainedObjectsLock;
- (MTLCommandQueue)commandQueue;
- (MTLDeadlineProfile)deadlineProfile;
- (MTLLogContainer)logs;
- (MTLToolsCommandBuffer)initWithBaseObject:(id)a3 parent:(id)a4;
- (MTLToolsCommandBuffer)initWithCommandBuffer:(id)a3 parent:(id)a4 descriptor:(id)a5;
- (NSDictionary)profilingResults;
- (NSError)error;
- (NSMutableDictionary)userDictionary;
- (NSMutableSet)retainedObjects;
- (NSString)label;
- (double)GPUEndTime;
- (double)GPUStartTime;
- (double)kernelEndTime;
- (double)kernelStartTime;
- (id).cxx_construct;
- (id)accelerationStructureCommandEncoder;
- (id)accelerationStructureCommandEncoderWithDescriptor:(id)a3;
- (id)blitCommandEncoder;
- (id)blitCommandEncoderWithDescriptor:(id)a3;
- (id)computeCommandEncoder;
- (id)computeCommandEncoderWithDescriptor:(id)a3;
- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3;
- (id)debugCommandEncoder;
- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3;
- (id)renderCommandEncoderWithDescriptor:(id)a3;
- (id)resourceStateCommandEncoder;
- (id)resourceStateCommandEncoderWithDescriptor:(id)a3;
- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4;
- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)unwrapMTLAccelerationStructurePassDescriptor:(id)a3;
- (id)unwrapMTLBlitPassDescriptor:(id)a3;
- (id)unwrapMTLComputePassDescriptor:(id)a3;
- (id)unwrapMTLRenderPassDescriptor:(id)a3;
- (id)unwrapMTLResourceStatePassDescriptor:(id)a3;
- (unint64_t)errorOptions;
- (unint64_t)getListIndex;
- (unint64_t)globalTraceObjectID;
- (unint64_t)protectionOptions;
- (unint64_t)status;
- (void)addCompletedHandler:(id)a3;
- (void)addPurgedHeap:(id)a3;
- (void)addPurgedResource:(id)a3;
- (void)addScheduledHandler:(id)a3;
- (void)addSynchronizationNotification:(id)a3;
- (void)clearRetainedObjects;
- (void)commit;
- (void)commitAndHold;
- (void)commitWithDeadline:(unint64_t)a3;
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
- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4 timeout:(unsigned int)a5;
- (void)enqueue;
- (void)executeSynchronizationNotifications:(int)a3;
- (void)executeSynchronizationNotifications:(int)a3 scope:(unint64_t)a4 resources:(const void *)a5 count:(unint64_t)a6;
- (void)invokeCompletedHandlers;
- (void)invokeScheduledHandlers;
- (void)popDebugGroup;
- (void)preCommit;
- (void)preCompletionHandlers;
- (void)preScheduledHandlers;
- (void)presentDrawable:(id)a3;
- (void)presentDrawable:(id)a3 afterMinimumDuration:(double)a4;
- (void)presentDrawable:(id)a3 atTime:(double)a4;
- (void)presentDrawable:(id)a3 options:(id)a4;
- (void)pushDebugGroup:(id)a3;
- (void)retainObjectsFromRenderPassDescriptor:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLogs:(id)a3;
- (void)setProfilingEnabled:(BOOL)a3;
- (void)setProtectionOptions:(unint64_t)a3;
- (void)setResourceGroups:(const void *)a3 count:(unint64_t)a4;
- (void)setResponsibleTaskIDs:(const unsigned int *)a3 count:(unsigned int)a4;
- (void)setUseRetainedObjectsLock:(BOOL)a3;
- (void)useInternalResidencySet:(id)a3;
- (void)useInternalResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)waitUntilCompleted;
- (void)waitUntilScheduled;
@end

@implementation MTLToolsCommandBuffer

- (MTLToolsCommandBuffer)initWithBaseObject:(id)a3 parent:(id)a4
{
  return [(MTLToolsCommandBuffer *)self initWithCommandBuffer:a3 parent:a4 descriptor:0];
}

- (MTLToolsCommandBuffer)initWithCommandBuffer:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MTLToolsCommandBuffer;
  v6 = [(MTLToolsObject *)&v9 initWithBaseObject:a3 parent:a4];
  v7 = v6;
  if (v6)
  {
    if ([(MTLToolsCommandBuffer *)v6 retainedReferences])
    {
      *((void *)v7 + 17) = objc_alloc_init(MEMORY[0x263EFF9C0]);
      *((_DWORD *)v7 + 10) = 0;
    }
    *((_DWORD *)v7 + 12) = 0;
    *((void *)v7 + 14) = objc_msgSend(*((id *)v7 + 1), "snapshotPerfSampleHandlerAndStatEnabled:forCommandBuffer:", (char *)v7 + 120, -[MTLToolsObject originalObject](v7, "originalObject"));
    *((void *)v7 + 16) = (id)[a5 deadlineProfile];
  }
  return v7;
}

- (void)dealloc
{
  v3 = (const void *)*((void *)self + 14);
  if (v3) {
    _Block_release(v3);
  }
  if (!*((unsigned char *)self + 104))
  {
    [(MTLToolsCommandBuffer *)self invokeScheduledHandlers];
    [(MTLToolsCommandBuffer *)self invokeCompletedHandlers];
  }

  v4.receiver = self;
  v4.super_class = (Class)MTLToolsCommandBuffer;
  [(MTLToolsObject *)&v4 dealloc];
}

- (void)invokeScheduledHandlers
{
  [(MTLToolsCommandBuffer *)self preScheduledHandlers];
  os_unfair_lock_lock((os_unfair_lock_t)self + 12);
  v3 = (void (***)(void, void))*((void *)self + 7);
  objc_super v4 = (void (***)(void, void))*((void *)self + 8);
  if (v3 != v4)
  {
    do
    {
      v5 = *v3++;
      ((void (**)(void, MTLToolsCommandBuffer *))v5)[2](v5, self);
      _Block_release(v5);
    }
    while (v3 != v4);
    v3 = (void (***)(void, void))*((void *)self + 7);
  }
  *((void *)self + 8) = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)self + 12);

  [(MTLToolsCommandBuffer *)self postScheduledHandlers];
}

- (void)invokeCompletedHandlers
{
  [(MTLToolsCommandBuffer *)self preCompletionHandlers];
  os_unfair_lock_lock((os_unfair_lock_t)self + 12);
  v3 = (void (***)(void, void))*((void *)self + 10);
  objc_super v4 = (void (***)(void, void))*((void *)self + 11);
  if (v3 != v4)
  {
    do
    {
      v5 = *v3++;
      ((void (**)(void, MTLToolsCommandBuffer *))v5)[2](v5, self);
      _Block_release(v5);
    }
    while (v3 != v4);
    v3 = (void (***)(void, void))*((void *)self + 10);
  }
  *((void *)self + 11) = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)self + 12);

  [(MTLToolsCommandBuffer *)self postCompletionHandlers];
}

- (BOOL)addRetainedObject:(id)a3
{
  objc_super v4 = (void *)*((void *)self + 17);
  if (a3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (!v5)
  {
    if (*((unsigned char *)self + 44)) {
      v8 = (os_unfair_lock_s *)((char *)self + 40);
    }
    else {
      v8 = 0;
    }
    if (*((unsigned char *)self + 44))
    {
      os_unfair_lock_lock((os_unfair_lock_t)self + 10);
      objc_super v4 = (void *)*((void *)self + 17);
    }
    [v4 addObject:a3];
    if (v8) {
      os_unfair_lock_unlock(v8);
    }
  }
  return v6;
}

- (void)clearRetainedObjects
{
  v3 = (void *)*((void *)self + 17);
  if (v3)
  {
    if (*((unsigned char *)self + 44)) {
      objc_super v4 = (os_unfair_lock_s *)((char *)self + 40);
    }
    else {
      objc_super v4 = 0;
    }
    if (*((unsigned char *)self + 44))
    {
      os_unfair_lock_lock((os_unfair_lock_t)self + 10);
      v3 = (void *)*((void *)self + 17);
    }
    [v3 removeAllObjects];
    if (v4)
    {
      os_unfair_lock_unlock(v4);
    }
  }
}

- (void)preCompletionHandlers
{
  if (*((unsigned char *)self + 120) && [(MTLToolsCommandBuffer *)self status] >= 2)
  {
    char v7 = 0;
    do
    {
      uint64_t v3 = *((void *)self + 1);
      uint64_t v6 = 0;
      objc_super v4 = (void *)[*(id *)(v3 + 40) extractDataAndNumSamples:&v6 forRequester:*((void *)self + 2) isLast:&v7];
      uint64_t v5 = *((void *)self + 14);
      if (v5) {
        (*(void (**)(uint64_t, MTLToolsCommandBuffer *, void *, uint64_t))(v5 + 16))(v5, self, v4, v6);
      }
    }
    while (!v7);
  }
}

- (void)preScheduledHandlers
{
  *((unsigned char *)self + 104) = 1;
}

- (void)preCommit
{
  *((_DWORD *)self + 9) |= 1u;
  uint64_t v3 = (void *)*((void *)self + 2);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__MTLToolsCommandBuffer_preCommit__block_invoke;
  v6[3] = &unk_264E12D20;
  v6[4] = self;
  [v3 addScheduledHandler:v6];
  objc_super v4 = (void *)*((void *)self + 2);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__MTLToolsCommandBuffer_preCommit__block_invoke_2;
  v5[3] = &unk_264E12D20;
  v5[4] = self;
  [v4 addCompletedHandler:v5];
}

uint64_t __34__MTLToolsCommandBuffer_preCommit__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeScheduledHandlers];
}

uint64_t __34__MTLToolsCommandBuffer_preCommit__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeCompletedHandlers];
}

- (void)commit
{
  [(MTLToolsCommandBuffer *)self preCommit];
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 commit];
}

- (void)commitAndHold
{
  [(MTLToolsCommandBuffer *)self preCommit];
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 commitAndHold];
}

- (BOOL)commitAndWaitUntilSubmitted
{
  [(MTLToolsCommandBuffer *)self preCommit];
  id v3 = [(MTLToolsObject *)self baseObject];

  return [v3 commitAndWaitUntilSubmitted];
}

- (id)debugCommandEncoder
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 debugCommandEncoder];
}

- (MTLLogContainer)logs
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLLogContainer *)[v2 logs];
}

- (void)setLogs:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setLogs:a3];
}

- (MTLCommandQueue)commandQueue
{
  return (MTLCommandQueue *)*((void *)self + 1);
}

- (BOOL)retainedReferences
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 retainedReferences];
}

- (double)GPUStartTime
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 GPUStartTime];
  return result;
}

- (double)GPUEndTime
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 GPUEndTime];
  return result;
}

- (unint64_t)globalTraceObjectID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 globalTraceObjectID];
}

- (NSString)label
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 label];
}

- (void)setLabel:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setLabel:a3];
}

- (void)enqueue
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 enqueue];
}

- (void)presentDrawable:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 presentDrawable:a3];
}

- (void)presentDrawable:(id)a3 atTime:(double)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 presentDrawable:a3 atTime:a4];
}

- (void)presentDrawable:(id)a3 afterMinimumDuration:(double)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 presentDrawable:a3 afterMinimumDuration:a4];
}

- (void)presentDrawable:(id)a3 options:(id)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 presentDrawable:a3 options:a4];
}

- (void)waitUntilScheduled
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 waitUntilScheduled];
}

- (void)waitUntilCompleted
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 waitUntilCompleted];
}

- (unint64_t)status
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 status];
}

- (NSError)error
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSError *)[v2 error];
}

- (id)blitCommandEncoder
{
  id v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "blitCommandEncoder");
  if (v4) {
    uint64_t v5 = [[MTLToolsBlitCommandEncoder alloc] initWithBaseObject:v4 parent:self];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)computeCommandEncoder
{
  id v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "computeCommandEncoder");
  if (v4) {
    uint64_t v5 = [[MTLToolsComputeCommandEncoder alloc] initWithBaseObject:v4 parent:self];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)accelerationStructureCommandEncoder
{
  id v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "accelerationStructureCommandEncoder");
  if (v4) {
    uint64_t v5 = [(MTLToolsCommandEncoder *)[MTLToolsAccelerationStructureCommandEncoder alloc] initWithBaseObject:v4 parent:self];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)resourceStateCommandEncoder
{
  id v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceStateCommandEncoder");
  if (v4) {
    uint64_t v5 = [[MTLToolsResourceStateCommandEncoder alloc] initWithBaseObject:v4 parent:self];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (double)kernelStartTime
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 kernelStartTime];
  return result;
}

- (double)kernelEndTime
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 kernelEndTime];
  return result;
}

- (void)debugBufferContentsWithLength:(unint64_t *)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (void *)[v4 debugBufferContentsWithLength:a3];
}

- (void)pushDebugGroup:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 pushDebugGroup:a3];
}

- (void)popDebugGroup
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 popDebugGroup];
}

- (void)encodeDashboardTagForResourceGroup:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  uint64_t v5 = [a3 baseObject];

  [v4 encodeDashboardTagForResourceGroup:v5];
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 value:(unint64_t)a5 forIndex:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];
  uint64_t v11 = [a3 baseObject];

  [v10 encodeDashboardFinalizeForResourceGroup:v11 dashboard:a4 value:a5 forIndex:a6];
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 values:(const unint64_t *)a5 indices:(const unint64_t *)a6 count:(unint64_t)a7
{
  id v12 = [(MTLToolsObject *)self baseObject];
  uint64_t v13 = [a3 baseObject];

  [v12 encodeDashboardFinalizeForResourceGroup:v13 dashboard:a4 values:a5 indices:a6 count:a7];
}

- (id)unwrapMTLRenderPassDescriptor:(id)a3
{
  id v4 = (void *)[a3 copy];
  objc_msgSend(v4, "setVisibilityResultBuffer:", objc_msgSend((id)objc_msgSend(v4, "visibilityResultBuffer"), "baseObject"));
  uint64_t v5 = [a3 _descriptorPrivate];
  uint64_t v6 = 0;
  char v7 = *(void **)v5;
  do
  {
    v8 = (void *)[v7 _descriptorAtIndex:v6];
    if (v8)
    {
      objc_super v9 = v8;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "colorAttachments"), "objectAtIndexedSubscript:", v6), "setTexture:", objc_msgSend((id)objc_msgSend(v8, "texture"), "baseObject"));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "colorAttachments"), "objectAtIndexedSubscript:", v6), "setResolveTexture:", objc_msgSend((id)objc_msgSend(v9, "resolveTexture"), "baseObject"));
    }
    ++v6;
  }
  while (v6 != 8);
  id v10 = (void *)[v7 _descriptorAtIndex:8];
  if (v10)
  {
    uint64_t v11 = v10;
    objc_msgSend((id)objc_msgSend(v4, "depthAttachment"), "setTexture:", objc_msgSend((id)objc_msgSend(v10, "texture"), "baseObject"));
    objc_msgSend((id)objc_msgSend(v4, "depthAttachment"), "setResolveTexture:", objc_msgSend((id)objc_msgSend(v11, "resolveTexture"), "baseObject"));
  }
  id v12 = (void *)[v7 _descriptorAtIndex:9];
  if (v12)
  {
    uint64_t v13 = v12;
    objc_msgSend((id)objc_msgSend(v4, "stencilAttachment"), "setTexture:", objc_msgSend((id)objc_msgSend(v12, "texture"), "baseObject"));
    objc_msgSend((id)objc_msgSend(v4, "stencilAttachment"), "setResolveTexture:", objc_msgSend((id)objc_msgSend(v13, "resolveTexture"), "baseObject"));
  }
  uint64_t v14 = 0;
  v15 = *(void **)(v5 + 144);
  do
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "sampleBufferAttachments"), "objectAtIndexedSubscript:", v14), "setSampleBuffer:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", v14), "sampleBuffer"), "baseObject"));
    ++v14;
  }
  while (v14 != 4);
  objc_msgSend(v4, "setRasterizationRateMap:", objc_msgSend(*(id *)(v5 + 136), "baseObject"));

  return v4;
}

+ (id)unwrapMTLComputePassDescriptorInternal:(id)a3
{
  id v4 = (void *)[a3 copy];
  uint64_t v5 = [a3 _descriptorPrivate];
  uint64_t v6 = 0;
  char v7 = *(void **)(v5 + 8);
  do
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "sampleBufferAttachments"), "objectAtIndexedSubscript:", v6), "setSampleBuffer:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", v6), "sampleBuffer"), "baseObject"));
    ++v6;
  }
  while (v6 != 4);

  return v4;
}

- (id)unwrapMTLComputePassDescriptor:(id)a3
{
  return +[MTLToolsCommandBuffer unwrapMTLComputePassDescriptorInternal:a3];
}

- (id)unwrapMTLBlitPassDescriptor:(id)a3
{
  id v4 = (void *)[a3 copy];
  uint64_t v5 = (void **)[a3 _descriptorPrivate];
  uint64_t v6 = 0;
  char v7 = *v5;
  do
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "sampleBufferAttachments"), "objectAtIndexedSubscript:", v6), "setSampleBuffer:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", v6), "sampleBuffer"), "baseObject"));
    ++v6;
  }
  while (v6 != 4);

  return v4;
}

- (id)unwrapMTLResourceStatePassDescriptor:(id)a3
{
  id v4 = (void *)[a3 copy];
  uint64_t v5 = (void **)[a3 _descriptorPrivate];
  uint64_t v6 = 0;
  char v7 = *v5;
  do
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "sampleBufferAttachments"), "objectAtIndexedSubscript:", v6), "setSampleBuffer:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", v6), "sampleBuffer"), "baseObject"));
    ++v6;
  }
  while (v6 != 4);

  return v4;
}

- (void)addScheduledHandler:(id)a3
{
  *((_DWORD *)self + 9) |= 4u;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addScheduledHandler:", &__block_literal_global);
  uint64_t v5 = _Block_copy(a3);
  uint64_t v6 = (os_unfair_lock_s *)((char *)self + 48);
  os_unfair_lock_lock((os_unfair_lock_t)self + 12);
  char v7 = (void **)((char *)self + 56);
  v8 = v7[1];
  unint64_t v9 = (unint64_t)v7[2];
  if ((unint64_t)v8 >= v9)
  {
    uint64_t v11 = ((char *)v8 - (unsigned char *)*v7) >> 3;
    if ((unint64_t)(v11 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v9 - (void)*v7;
    uint64_t v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    if (v14) {
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v7 + 2), v14);
    }
    else {
      v15 = 0;
    }
    v16 = &v15[8 * v11];
    v17 = &v15[8 * v14];
    *(void *)v16 = v5;
    id v10 = v16 + 8;
    v19 = (char *)*v7;
    v18 = (char *)v7[1];
    if (v18 != *v7)
    {
      do
      {
        uint64_t v20 = *((void *)v18 - 1);
        v18 -= 8;
        *((void *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      v18 = (char *)*v7;
    }
    void *v7 = v16;
    v7[1] = v10;
    v7[2] = v17;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    void *v8 = v5;
    id v10 = v8 + 1;
  }
  v7[1] = v10;

  os_unfair_lock_unlock(v6);
}

- (void)addCompletedHandler:(id)a3
{
  *((_DWORD *)self + 9) |= 2u;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addCompletedHandler:", &__block_literal_global_9);
  uint64_t v5 = _Block_copy(a3);
  uint64_t v6 = (os_unfair_lock_s *)((char *)self + 48);
  os_unfair_lock_lock((os_unfair_lock_t)self + 12);
  char v7 = (void **)((char *)self + 80);
  v8 = v7[1];
  unint64_t v9 = (unint64_t)v7[2];
  if ((unint64_t)v8 >= v9)
  {
    uint64_t v11 = ((char *)v8 - (unsigned char *)*v7) >> 3;
    if ((unint64_t)(v11 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v9 - (void)*v7;
    uint64_t v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    if (v14) {
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v7 + 2), v14);
    }
    else {
      v15 = 0;
    }
    v16 = &v15[8 * v11];
    v17 = &v15[8 * v14];
    *(void *)v16 = v5;
    id v10 = v16 + 8;
    v19 = (char *)*v7;
    v18 = (char *)v7[1];
    if (v18 != *v7)
    {
      do
      {
        uint64_t v20 = *((void *)v18 - 1);
        v18 -= 8;
        *((void *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      v18 = (char *)*v7;
    }
    void *v7 = v16;
    v7[1] = v10;
    v7[2] = v17;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    void *v8 = v5;
    id v10 = v8 + 1;
  }
  v7[1] = v10;

  os_unfair_lock_unlock(v6);
}

- (id)renderCommandEncoderWithDescriptor:(id)a3
{
  id v5 = -[MTLToolsCommandBuffer unwrapMTLRenderPassDescriptor:](self, "unwrapMTLRenderPassDescriptor:");
  uint64_t v6 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "renderCommandEncoderWithDescriptor:", v5);
  if (v7)
  {
    v8 = [[MTLToolsRenderCommandEncoder alloc] initWithRenderCommandEncoder:v7 parent:self descriptor:a3];
    return v8;
  }
  else
  {
    return 0;
  }
}

- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3
{
  id v5 = -[MTLToolsCommandBuffer unwrapMTLRenderPassDescriptor:](self, "unwrapMTLRenderPassDescriptor:");
  uint64_t v6 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "parallelRenderCommandEncoderWithDescriptor:", v5);
  if (v7)
  {
    v8 = [[MTLToolsParallelRenderCommandEncoder alloc] initWithParallelRenderCommandEncoder:v7 parent:self descriptor:a3];
    return v8;
  }
  else
  {
    return 0;
  }
}

- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  id v9 = [(MTLToolsObject *)self baseObject];
  id v10 = [(MTLToolsCommandBuffer *)self unwrapMTLRenderPassDescriptor:a3];
  uint64_t v11 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v12 = [v9 sampledRenderCommandEncoderWithDescriptor:v10 programInfoBuffer:a4 capacity:a5];
  if (v12)
  {
    uint64_t v13 = [[MTLToolsRenderCommandEncoder alloc] initWithRenderCommandEncoder:v12 parent:self descriptor:a3];
    return v13;
  }
  else
  {
    return 0;
  }
}

- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  id v7 = [(MTLToolsObject *)self baseObject];
  v8 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v9 = [v7 sampledComputeCommandEncoderWithProgramInfoBuffer:a3 capacity:a4];
  if (v9)
  {
    id v10 = [[MTLToolsComputeCommandEncoder alloc] initWithComputeCommandEncoder:v9 parent:self descriptor:0];
    return v10;
  }
  else
  {
    return 0;
  }
}

- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3
{
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = (void *)MEMORY[0x23ECD5710]();
  id v7 = -[MTLToolsComputeCommandEncoder initWithComputeCommandEncoder:parent:descriptor:]([MTLToolsComputeCommandEncoder alloc], "initWithComputeCommandEncoder:parent:descriptor:", [v5 computeCommandEncoderWithDispatchType:a3], self, 0);

  return v7;
}

- (id)computeCommandEncoderWithDescriptor:(id)a3
{
  id v5 = -[MTLToolsCommandBuffer unwrapMTLComputePassDescriptor:](self, "unwrapMTLComputePassDescriptor:");
  id v6 = [(MTLToolsObject *)self baseObject];
  id v7 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v8 = [v6 computeCommandEncoderWithDescriptor:v5];
  if (v8)
  {
    uint64_t v9 = [[MTLToolsComputeCommandEncoder alloc] initWithComputeCommandEncoder:v8 parent:self descriptor:a3];
    return v9;
  }
  else
  {
    return 0;
  }
}

- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  id v9 = [(MTLToolsObject *)self baseObject];
  id v10 = [(MTLToolsCommandBuffer *)self unwrapMTLComputePassDescriptor:a3];
  uint64_t v11 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v12 = [v9 sampledComputeCommandEncoderWithDescriptor:v10 programInfoBuffer:a4 capacity:a5];
  if (v12)
  {
    uint64_t v13 = [[MTLToolsComputeCommandEncoder alloc] initWithComputeCommandEncoder:v12 parent:self descriptor:a3];
    return v13;
  }
  else
  {
    return 0;
  }
}

- (id)blitCommandEncoderWithDescriptor:(id)a3
{
  id v5 = [(MTLToolsObject *)self baseObject];
  id v6 = [(MTLToolsCommandBuffer *)self unwrapMTLBlitPassDescriptor:a3];
  id v7 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v8 = [v5 blitCommandEncoderWithDescriptor:v6];
  if (v8)
  {
    id v9 = [[MTLToolsBlitCommandEncoder alloc] initWithBlitCommandEncoder:v8 parent:self descriptor:a3];
    return v9;
  }
  else
  {
    return 0;
  }
}

- (id)resourceStateCommandEncoderWithDescriptor:(id)a3
{
  id v5 = [(MTLToolsObject *)self baseObject];
  id v6 = [(MTLToolsCommandBuffer *)self unwrapMTLResourceStatePassDescriptor:a3];
  id v7 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v8 = [v5 resourceStateCommandEncoderWithDescriptor:v6];
  if (v8)
  {
    id v9 = [[MTLToolsResourceStateCommandEncoder alloc] initWithResourceStateCommandEncoder:v8 parent:self descriptor:a3];
    return v9;
  }
  else
  {
    return 0;
  }
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
{
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 encodeSignalEvent:v8 value:a4];
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 encodeWaitForEvent:v8 value:a4];
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];

  [v9 encodeWaitForEvent:v10 value:a4 timeout:v5];
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4 agentMask:(unint64_t)a5
{
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];

  [v9 encodeSignalEvent:v10 value:a4 agentMask:a5];
}

- (void)encodeConditionalAbortEvent:(id)a3
{
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 encodeConditionalAbortEvent:v6];
}

- (void)encodeSignalEventScheduled:(id)a3 value:(unint64_t)a4
{
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 encodeSignalEventScheduled:v8 value:a4];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_encodeSignalEventScheduled_value_ == a3)
  {
    [(MTLToolsObject *)self baseObject];
    unsigned __int8 v3 = objc_opt_respondsToSelector();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTLToolsCommandBuffer;
    unsigned __int8 v3 = [(MTLToolsCommandBuffer *)&v5 respondsToSelector:a3];
  }
  return v3 & 1;
}

- (void)addPurgedResource:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  uint64_t v5 = [a3 baseObject];

  [v4 addPurgedResource:v5];
}

- (void)addPurgedHeap:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  uint64_t v5 = [a3 baseObject];

  [v4 addPurgedHeap:v5];
}

- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v11 = [v9 sampledComputeCommandEncoderWithDispatchType:a3 programInfoBuffer:a4 capacity:a5];
  if (v11)
  {
    uint64_t v12 = [[MTLToolsComputeCommandEncoder alloc] initWithComputeCommandEncoder:v11 parent:self descriptor:0];
    return v12;
  }
  else
  {
    return 0;
  }
}

- (BOOL)isProfilingEnabled
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isProfilingEnabled];
}

- (void)setProfilingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setProfilingEnabled:v3];
}

- (NSDictionary)profilingResults
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSDictionary *)[v2 profilingResults];
}

- (NSMutableDictionary)userDictionary
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSMutableDictionary *)[v2 userDictionary];
}

- (unint64_t)getListIndex
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 getListIndex];
}

- (void)addSynchronizationNotification:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 addSynchronizationNotification:a3];
}

- (void)executeSynchronizationNotifications:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 executeSynchronizationNotifications:v3];
}

- (void)executeSynchronizationNotifications:(int)a3 scope:(unint64_t)a4 resources:(const void *)a5 count:(unint64_t)a6
{
  uint64_t v9 = *(void *)&a3;
  id v10 = [(MTLToolsObject *)self baseObject];

  [v10 executeSynchronizationNotifications:v9 scope:a4 resources:a5 count:a6];
}

- (void)setResourceGroups:(const void *)a3 count:(unint64_t)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = (char *)v11 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    id v7 = a3;
    unint64_t v8 = a4;
    uint64_t v9 = (void *)((char *)v11 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      id v10 = (void *)*v7++;
      *v9++ = [v10 baseObject];
      --v8;
    }
    while (v8);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setResourceGroups:count:", v6, a4);
}

- (void)dropResourceGroups:(const void *)a3 count:(unint64_t)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = (char *)v11 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    id v7 = a3;
    unint64_t v8 = a4;
    uint64_t v9 = (void *)((char *)v11 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      id v10 = (void *)*v7++;
      *v9++ = [v10 baseObject];
      --v8;
    }
    while (v8);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "dropResourceGroups:count:", v6, a4);
}

- (void)encodeCacheHintTag:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5
{
  v13[1] = *MEMORY[0x263EF8340];
  unint64_t v8 = (char *)v13 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    uint64_t v9 = a4;
    unint64_t v10 = a5;
    uint64_t v11 = (void *)((char *)v13 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      uint64_t v12 = (void *)*v9++;
      *v11++ = [v12 baseObject];
      --v10;
    }
    while (v10);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3, a4), "encodeCacheHintTag:resourceGroups:count:", a3, v8, a5);
}

- (void)encodeCacheHintFinalize:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5
{
  v13[1] = *MEMORY[0x263EF8340];
  unint64_t v8 = (char *)v13 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    uint64_t v9 = a4;
    unint64_t v10 = a5;
    uint64_t v11 = (void *)((char *)v13 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      uint64_t v12 = (void *)*v9++;
      *v11++ = [v12 baseObject];
      --v10;
    }
    while (v10);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3, a4), "encodeCacheHintFinalize:resourceGroups:count:", a3, v8, a5);
}

- (void)setProtectionOptions:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setProtectionOptions:a3];
}

- (unint64_t)protectionOptions
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 protectionOptions];
}

- (unint64_t)errorOptions
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 errorOptions];
}

- (void)retainObjectsFromRenderPassDescriptor:(id)a3
{
  for (uint64_t i = 0; i != 10; ++i)
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "_descriptorAtIndex:", i);
    if (v6)
    {
      id v7 = v6;
      -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:", [v6 texture]);
      -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:", [v7 resolveTexture]);
    }
  }
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:", [a3 visibilityResultBuffer]);
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:", [a3 rasterizationRateMap]);
  for (uint64_t j = 0; j != 4; ++j)
    -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "sampleBufferAttachments"), "objectAtIndexedSubscript:", j), "sampleBuffer"));
}

- (MTLDeadlineProfile)deadlineProfile
{
  return (MTLDeadlineProfile *)*((void *)self + 16);
}

- (void)commitWithDeadline:(unint64_t)a3
{
  [(MTLToolsCommandBuffer *)self preCommit];
  id v5 = [(MTLToolsObject *)self baseObject];

  [v5 commitWithDeadline:a3];
}

- (BOOL)commitAndWaitUntilSubmittedWithDeadline:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 commitAndWaitUntilSubmittedWithDeadline:a3];
}

- (id)unwrapMTLAccelerationStructurePassDescriptor:(id)a3
{
  id v4 = (void *)[a3 copy];
  for (uint64_t i = 0; i != 4; ++i)
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "setSampleBuffer:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"), "baseObject"));

  return v4;
}

- (id)accelerationStructureCommandEncoderWithDescriptor:(id)a3
{
  id v5 = -[MTLToolsCommandBuffer unwrapMTLAccelerationStructurePassDescriptor:](self, "unwrapMTLAccelerationStructurePassDescriptor:");
  uint64_t v6 = (void *)MEMORY[0x23ECD5710]();
  uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "accelerationStructureCommandEncoderWithDescriptor:", v5);
  if (v7)
  {
    unint64_t v8 = [[MTLToolsAccelerationStructureCommandEncoder alloc] initWithAccelerationStructureCommandEncoder:v7 parent:self descriptor:a3];
    return v8;
  }
  else
  {
    return 0;
  }
}

- (void)setResponsibleTaskIDs:(const unsigned int *)a3 count:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setResponsibleTaskIDs:a3 count:v4];
}

- (void)useResidencySet:(id)a3
{
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 useResidencySet:v6];
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  std::vector<objc_object  {objcproto15MTLResidencySet}*>::vector(__p, a4);
  if (a4)
  {
    uint64_t v7 = 0;
    do
    {
      [(MTLToolsCommandBuffer *)self addRetainedObject:a3[v7]];
      uint64_t v8 = [(id)a3[v7] baseObject];
      *((void *)__p[0] + v7++) = v8;
    }
    while (a4 != v7);
  }
  id v9 = [(MTLToolsObject *)self baseObject];
  [v9 useResidencySets:__p[0] count:a4];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useInternalResidencySet:(id)a3
{
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 useInternalResidencySet:v6];
}

- (void)useInternalResidencySets:(const void *)a3 count:(unint64_t)a4
{
  std::vector<objc_object  {objcproto15MTLResidencySet}*>::vector(__p, a4);
  if (a4)
  {
    uint64_t v7 = 0;
    do
    {
      [(MTLToolsCommandBuffer *)self addRetainedObject:a3[v7]];
      uint64_t v8 = [(id)a3[v7] baseObject];
      *((void *)__p[0] + v7++) = v8;
    }
    while (a4 != v7);
  }
  id v9 = [(MTLToolsObject *)self baseObject];
  [v9 useInternalResidencySets:__p[0] count:a4];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (NSMutableSet)retainedObjects
{
  return (NSMutableSet *)*((void *)self + 17);
}

- (BOOL)useRetainedObjectsLock
{
  return *((unsigned char *)self + 44) & 1;
}

- (void)setUseRetainedObjectsLock:(BOOL)a3
{
  *((unsigned char *)self + 44) = a3;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + 80;
  uint64_t v4 = (void *)*((void *)self + 10);
  if (v4)
  {
    *((void *)v3 + 1) = v4;
    operator delete(v4);
  }
  id v5 = (void *)*((void *)self + 7);
  if (v5)
  {
    *((void *)self + 8) = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 10) = 0;
  return self;
}

@end