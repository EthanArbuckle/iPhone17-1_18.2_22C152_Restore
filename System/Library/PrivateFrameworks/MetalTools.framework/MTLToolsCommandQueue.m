@interface MTLToolsCommandQueue
- (BOOL)commitSynchronously;
- (BOOL)commitsWithQoS;
- (BOOL)disableCrossQueueHazardTracking;
- (BOOL)executionEnabled;
- (BOOL)isOpenGLQueue;
- (BOOL)isProfilingEnabled;
- (BOOL)isStatEnabled;
- (BOOL)setBackgroundGPUPriority:(unint64_t)a3;
- (BOOL)setBackgroundGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4;
- (BOOL)setGPUPriority:(unint64_t)a3;
- (BOOL)setGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4;
- (BOOL)skipRender;
- (MTLToolsCommandQueue)initWithBaseObject:(id)a3 parent:(id)a4;
- (NSString)label;
- (OS_dispatch_queue)commitQueue;
- (OS_dispatch_queue)completionQueue;
- (id)availableCounters;
- (id)commandBuffer;
- (id)commandBufferWithDescriptor:(id)a3;
- (id)commandBufferWithUnretainedReferences;
- (id)counterInfo;
- (id)getRequestedCounters;
- (id)getSPIStats;
- (id)internalResidencySetsArray;
- (id)residencySetsArray;
- (id)snapshotPerfSampleHandlerAndStatEnabled:(BOOL *)a3 forCommandBuffer:(id)a4;
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
- (void)addInternalResidencySet:(id)a3;
- (void)addInternalResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)addPerfSampleHandler:(id)a3;
- (void)addResidencySet:(id)a3;
- (void)addResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)dealloc;
- (void)dispatchAvailableCompletionNotifications;
- (void)finish;
- (void)insertDebugCaptureBoundary;
- (void)removeInternalResidencySet:(id)a3;
- (void)removeInternalResidencySets:(const void *)a3 count:(unint64_t)a4;
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
@end

@implementation MTLToolsCommandQueue

- (MTLToolsCommandQueue)initWithBaseObject:(id)a3 parent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTLToolsCommandQueue;
  v4 = [(MTLToolsObject *)&v7 initWithBaseObject:a3 parent:a4];
  v5 = v4;
  if (v4)
  {
    v4->_perfHandlerLock._os_unfair_lock_opaque = 0;
    v4->_residencySetsLock._os_unfair_lock_opaque = 0;
    v4->_residencySets = (NSCountedSet *)objc_opt_new();
    v5->_internalResidencySets = (NSCountedSet *)objc_opt_new();
  }
  return v5;
}

- (void)dealloc
{
  _Block_release(self->_perfSampleHandlerBlock);

  v3.receiver = self;
  v3.super_class = (Class)MTLToolsCommandQueue;
  [(MTLToolsObject *)&v3 dealloc];
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

- (id)commandBuffer
{
  objc_super v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBuffer");
  if (v4) {
    v5 = [[MTLToolsCommandBuffer alloc] initWithBaseObject:v4 parent:self];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (id)commandBufferWithUnretainedReferences
{
  objc_super v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithUnretainedReferences");
  if (v4) {
    v5 = [[MTLToolsCommandBuffer alloc] initWithBaseObject:v4 parent:self];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (id)commandBufferWithDescriptor:(id)a3
{
  v5 = (void *)MEMORY[0x23ECD5710](self, a2);
  v6 = (MTLToolsCommandBuffer *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithDescriptor:", -[MTLToolsDevice unwrapMTLCommandBufferDescriptor:alwaysCopy:](self->super._device, "unwrapMTLCommandBufferDescriptor:alwaysCopy:", a3, 0));
  if (v6) {
    v6 = [[MTLToolsCommandBuffer alloc] initWithCommandBuffer:v6 parent:self descriptor:a3];
  }
  objc_super v7 = v6;
  return v7;
}

- (void)insertDebugCaptureBoundary
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 insertDebugCaptureBoundary];
}

- (void)dispatchAvailableCompletionNotifications
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 dispatchAvailableCompletionNotifications];
}

- (unint64_t)getGPUPriority
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 getGPUPriority];
}

- (BOOL)setGPUPriority:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 setGPUPriority:a3];
}

- (BOOL)setGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = [(MTLToolsObject *)self baseObject];

  return [v6 setGPUPriority:a3 offset:v4];
}

- (unint64_t)getBackgroundGPUPriority
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 getBackgroundGPUPriority];
}

- (BOOL)setBackgroundGPUPriority:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 setBackgroundGPUPriority:a3];
}

- (BOOL)setBackgroundGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = [(MTLToolsObject *)self baseObject];

  return [v6 setBackgroundGPUPriority:a3 offset:v4];
}

- (unint64_t)maxCommandBufferCount
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxCommandBufferCount];
}

- (int)backgroundTrackingPID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 backgroundTrackingPID];
}

- (void)setBackgroundTrackingPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setBackgroundTrackingPID:v3];
}

- (void)finish
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 finish];
}

- (BOOL)skipRender
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 skipRender];
}

- (void)setSkipRender:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setSkipRender:v3];
}

- (BOOL)executionEnabled
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 executionEnabled];
}

- (void)setExecutionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setExecutionEnabled:v3];
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

- (void)setCompletionQueue:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setCompletionQueue:a3];
}

- (void)setSubmissionQueue:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setSubmissionQueue:a3];
}

- (BOOL)isOpenGLQueue
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isOpenGLQueue];
}

- (id)getSPIStats
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 getSPIStats];
}

- (int)requestCounters:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 requestCounters:a3];
}

- (void)addPerfSampleHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  os_unfair_lock_lock(&self->_perfHandlerLock);
  if (!self->_perfSampleMailbox)
  {
    v5 = (MTLToolsPerfCounterMailbox *)objc_opt_new();
    self->_perfSampleMailbox = v5;
    baseObject = self->super._baseObject;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __45__MTLToolsCommandQueue_addPerfSampleHandler___block_invoke;
    v8[3] = &unk_264E12D68;
    v8[4] = v5;
    [(MTLToolsObject *)baseObject addPerfSampleHandler:v8];
  }
  id perfSampleHandlerBlock = self->_perfSampleHandlerBlock;
  self->_id perfSampleHandlerBlock = v4;
  os_unfair_lock_unlock(&self->_perfHandlerLock);
  _Block_release(perfSampleHandlerBlock);
}

uint64_t __45__MTLToolsCommandQueue_addPerfSampleHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) insertData:a3 andNumSamples:a4 forRequester:a2];
}

- (id)snapshotPerfSampleHandlerAndStatEnabled:(BOOL *)a3 forCommandBuffer:(id)a4
{
  p_perfHandlerLock = &self->_perfHandlerLock;
  os_unfair_lock_lock(&self->_perfHandlerLock);
  if ([a4 isStatEnabled])
  {
    *a3 = 1;
    v8 = _Block_copy(self->_perfSampleHandlerBlock);
  }
  else
  {
    v8 = 0;
    *a3 = 0;
  }
  os_unfair_lock_unlock(p_perfHandlerLock);
  return v8;
}

- (int)requestCounters:(id)a3 withIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  return [v6 requestCounters:a3 withIndex:a4];
}

- (id)subdivideCounterList:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 subdivideCounterList:a3];
}

- (unint64_t)qosLevel
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 qosLevel];
}

- (OS_dispatch_queue)commitQueue
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (OS_dispatch_queue *)[v2 commitQueue];
}

- (BOOL)commitSynchronously
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 commitSynchronously];
}

- (OS_dispatch_queue)completionQueue
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (OS_dispatch_queue *)[v2 completionQueue];
}

- (BOOL)disableCrossQueueHazardTracking
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 disableCrossQueueHazardTracking];
}

- (id)availableCounters
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 availableCounters];
}

- (id)getRequestedCounters
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 getRequestedCounters];
}

- (BOOL)isStatEnabled
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isStatEnabled];
}

- (void)setStatEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setStatEnabled:v3];
}

- (unint64_t)getStatOptions
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 getStatOptions];
}

- (void)setStatOptions:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setStatOptions:a3];
}

- (unint64_t)getStatLocations
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 getStatLocations];
}

- (void)setStatLocations:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setStatLocations:a3];
}

- (id)counterInfo
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 counterInfo];
}

- (BOOL)commitsWithQoS
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 commitsWithQoS];
}

- (void)addResidencySet:(id)a3
{
  p_residencySetsLock = &self->_residencySetsLock;
  os_unfair_lock_lock(&self->_residencySetsLock);
  [(NSCountedSet *)self->_residencySets addObject:a3];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addResidencySet:", objc_msgSend(a3, "baseObject"));

  os_unfair_lock_unlock(p_residencySetsLock);
}

- (void)addResidencySets:(const void *)a3 count:(unint64_t)a4
{
  p_residencySetsLock = &self->_residencySetsLock;
  os_unfair_lock_lock(&self->_residencySetsLock);
  std::vector<objc_object  {objcproto15MTLResidencySet}*>::vector(__p, a4);
  if (a4)
  {
    uint64_t v8 = 0;
    do
    {
      [(NSCountedSet *)self->_residencySets addObject:a3[v8]];
      uint64_t v9 = [(id)a3[v8] baseObject];
      *((void *)__p[0] + v8++) = v9;
    }
    while (a4 != v8);
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  [v10 addResidencySets:__p[0] count:a4];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  os_unfair_lock_unlock(p_residencySetsLock);
}

- (void)removeResidencySet:(id)a3
{
  p_residencySetsLock = &self->_residencySetsLock;
  os_unfair_lock_lock(&self->_residencySetsLock);
  [(NSCountedSet *)self->_residencySets removeObject:a3];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "removeResidencySet:", objc_msgSend(a3, "baseObject"));

  os_unfair_lock_unlock(p_residencySetsLock);
}

- (void)removeResidencySets:(const void *)a3 count:(unint64_t)a4
{
  p_residencySetsLock = &self->_residencySetsLock;
  os_unfair_lock_lock(&self->_residencySetsLock);
  std::vector<objc_object  {objcproto15MTLResidencySet}*>::vector(__p, a4);
  if (a4)
  {
    uint64_t v8 = 0;
    do
    {
      [(NSCountedSet *)self->_residencySets removeObject:a3[v8]];
      uint64_t v9 = [(id)a3[v8] baseObject];
      *((void *)__p[0] + v8++) = v9;
    }
    while (a4 != v8);
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  [v10 removeResidencySets:__p[0] count:a4];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  os_unfair_lock_unlock(p_residencySetsLock);
}

- (id)residencySetsArray
{
  return (id)[(NSCountedSet *)self->_residencySets allObjects];
}

- (void)addInternalResidencySet:(id)a3
{
  p_residencySetsLock = &self->_residencySetsLock;
  os_unfair_lock_lock(&self->_residencySetsLock);
  [(NSCountedSet *)self->_internalResidencySets addObject:a3];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addInternalResidencySet:", objc_msgSend(a3, "baseObject"));

  os_unfair_lock_unlock(p_residencySetsLock);
}

- (void)addInternalResidencySets:(const void *)a3 count:(unint64_t)a4
{
  p_residencySetsLock = &self->_residencySetsLock;
  os_unfair_lock_lock(&self->_residencySetsLock);
  std::vector<objc_object  {objcproto15MTLResidencySet}*>::vector(__p, a4);
  if (a4)
  {
    uint64_t v8 = 0;
    do
    {
      [(NSCountedSet *)self->_internalResidencySets addObject:a3[v8]];
      uint64_t v9 = [(id)a3[v8] baseObject];
      *((void *)__p[0] + v8++) = v9;
    }
    while (a4 != v8);
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  [v10 addInternalResidencySets:__p[0] count:a4];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  os_unfair_lock_unlock(p_residencySetsLock);
}

- (void)removeInternalResidencySet:(id)a3
{
  p_residencySetsLock = &self->_residencySetsLock;
  os_unfair_lock_lock(&self->_residencySetsLock);
  [(NSCountedSet *)self->_internalResidencySets removeObject:a3];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "removeInternalResidencySet:", objc_msgSend(a3, "baseObject"));

  os_unfair_lock_unlock(p_residencySetsLock);
}

- (void)removeInternalResidencySets:(const void *)a3 count:(unint64_t)a4
{
  p_residencySetsLock = &self->_residencySetsLock;
  os_unfair_lock_lock(&self->_residencySetsLock);
  std::vector<objc_object  {objcproto15MTLResidencySet}*>::vector(__p, a4);
  if (a4)
  {
    uint64_t v8 = 0;
    do
    {
      [(NSCountedSet *)self->_internalResidencySets removeObject:a3[v8]];
      uint64_t v9 = [(id)a3[v8] baseObject];
      *((void *)__p[0] + v8++) = v9;
    }
    while (a4 != v8);
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  [v10 removeInternalResidencySets:__p[0] count:a4];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  os_unfair_lock_unlock(p_residencySetsLock);
}

- (id)internalResidencySetsArray
{
  return (id)[(NSCountedSet *)self->_internalResidencySets allObjects];
}

@end