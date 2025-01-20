@interface MTLDebugIOCommandQueue
- (id)commandBuffer;
- (id)commandBufferWithUnretainedReferences;
- (unint64_t)globalTraceObjectID;
- (void)barrier;
@end

@implementation MTLDebugIOCommandQueue

- (id)commandBuffer
{
  v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  v4 = -[MTLToolsIOCommandBuffer initWithBaseObject:parent:]([MTLDebugIOCommandBuffer alloc], "initWithBaseObject:parent:", objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBuffer"), self);

  return v4;
}

- (id)commandBufferWithUnretainedReferences
{
  v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  v4 = -[MTLToolsIOCommandBuffer initWithBaseObject:parent:]([MTLDebugIOCommandBuffer alloc], "initWithBaseObject:parent:", objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithUnretainedReferences"), self);

  return v4;
}

- (void)barrier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 barrier];
}

- (unint64_t)globalTraceObjectID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 globalTraceObjectID];
}

@end