@interface MTLDebugCommandQueue
- (id)commandBuffer;
- (id)commandBufferWithDescriptor:(id)a3;
- (id)commandBufferWithUnretainedReferences;
- (void)addInternalResidencySet:(id)a3;
- (void)addInternalResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)addResidencySet:(id)a3;
- (void)addResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)insertDebugCaptureBoundary;
- (void)removeInternalResidencySet:(id)a3;
- (void)removeInternalResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)removeResidencySet:(id)a3;
- (void)removeResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)validateDeadlineAwareness:(id)a3;
@end

@implementation MTLDebugCommandQueue

- (void)insertDebugCaptureBoundary
{
  if (_MTLIsInsideCompletionHandler()) {
    MTLReportFailure();
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugCommandQueue;
  [(MTLToolsCommandQueue *)&v3 insertDebugCaptureBoundary];
}

- (id)commandBuffer
{
  objc_super v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBuffer");
  if (v4)
  {
    v5 = [[MTLDebugCommandBuffer alloc] initWithCommandBuffer:v4 commandQueue:self descriptor:0];
    return v5;
  }
  else
  {
    return 0;
  }
}

- (id)commandBufferWithUnretainedReferences
{
  objc_super v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithUnretainedReferences");
  if (v4)
  {
    v5 = [[MTLDebugCommandBuffer alloc] initWithCommandBuffer:v4 commandQueue:self descriptor:0];
    return v5;
  }
  else
  {
    return 0;
  }
}

- (id)commandBufferWithDescriptor:(id)a3
{
  v5 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithDescriptor:", -[MTLToolsDevice unwrapMTLCommandBufferDescriptor:alwaysCopy:](self->super.super._device, "unwrapMTLCommandBufferDescriptor:alwaysCopy:", a3, 0));
  if (v6)
  {
    v7 = [[MTLDebugCommandBuffer alloc] initWithCommandBuffer:v6 commandQueue:self descriptor:a3];
    [(MTLDeadlineProfile *)[(MTLToolsCommandBuffer *)v7 deadlineProfile] validateCommandQueue:self];
    return v7;
  }
  else
  {
    return 0;
  }
}

- (void)validateDeadlineAwareness:(id)a3
{
  p_deadlineAwareState = &self->_deadlineAwareState;
  unsigned int v5 = atomic_load((unsigned int *)&self->_deadlineAwareState);
  uint64_t v6 = [a3 deadlineProfile];
  uint64_t v7 = v6;
  if (v6) {
    unsigned int v8 = 1;
  }
  else {
    unsigned int v8 = 2;
  }
  if (v5)
  {
    if (v5 != v8) {
      goto LABEL_15;
    }
LABEL_9:
    if (!v6) {
      return;
    }
    goto LABEL_10;
  }
  int v9 = 0;
  atomic_compare_exchange_strong(p_deadlineAwareState, (unsigned int *)&v9, v8);
  if (!v9 || v9 == v8) {
    goto LABEL_9;
  }
LABEL_15:
  MTLReportFailure();
  if (!v7) {
    return;
  }
LABEL_10:
  if ([(MTLToolsCommandQueue *)self getGPUPriority] != 5)
  {
    MTLReportFailure();
  }
}

- (void)addResidencySet:(id)a3
{
  if (!a3) {
    MTLReportFailure();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugCommandQueue;
  [(MTLToolsCommandQueue *)&v5 addResidencySet:a3];
}

- (void)addResidencySets:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    for (uint64_t i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        uint64_t v8 = i;
        MTLReportFailure();
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugCommandQueue;
  -[MTLToolsCommandQueue addResidencySets:count:](&v9, sel_addResidencySets_count_, a3, a4, v8);
}

- (void)removeResidencySet:(id)a3
{
  if (!a3) {
    MTLReportFailure();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugCommandQueue;
  [(MTLToolsCommandQueue *)&v5 removeResidencySet:a3];
}

- (void)removeResidencySets:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    for (uint64_t i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        uint64_t v8 = i;
        MTLReportFailure();
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugCommandQueue;
  -[MTLToolsCommandQueue removeResidencySets:count:](&v9, sel_removeResidencySets_count_, a3, a4, v8);
}

- (void)addInternalResidencySet:(id)a3
{
  if (!a3) {
    MTLReportFailure();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugCommandQueue;
  [(MTLToolsCommandQueue *)&v5 addInternalResidencySet:a3];
}

- (void)addInternalResidencySets:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    for (uint64_t i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        uint64_t v8 = i;
        MTLReportFailure();
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugCommandQueue;
  -[MTLToolsCommandQueue addInternalResidencySets:count:](&v9, sel_addInternalResidencySets_count_, a3, a4, v8);
}

- (void)removeInternalResidencySet:(id)a3
{
  if (!a3) {
    MTLReportFailure();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugCommandQueue;
  [(MTLToolsCommandQueue *)&v5 removeInternalResidencySet:a3];
}

- (void)removeInternalResidencySets:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    for (uint64_t i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        uint64_t v8 = i;
        MTLReportFailure();
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugCommandQueue;
  -[MTLToolsCommandQueue removeInternalResidencySets:count:](&v9, sel_removeInternalResidencySets_count_, a3, a4, v8);
}

@end