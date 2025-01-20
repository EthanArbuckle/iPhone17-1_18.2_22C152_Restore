@interface MTLToolsIOCommandQueue
- (MTLToolsIOCommandQueue)initWithBaseObject:(id)a3 parent:(id)a4;
- (NSString)label;
- (id)commandBuffer;
- (id)commandBufferWithUnretainedReferences;
- (unint64_t)globalTraceObjectID;
- (void)barrier;
- (void)dealloc;
- (void)enqueueBarrier;
- (void)setLabel:(id)a3;
@end

@implementation MTLToolsIOCommandQueue

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

- (MTLToolsIOCommandQueue)initWithBaseObject:(id)a3 parent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTLToolsIOCommandQueue;
  return [(MTLToolsObject *)&v5 initWithBaseObject:a3 parent:a4];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MTLToolsIOCommandQueue;
  [(MTLToolsObject *)&v2 dealloc];
}

- (id)commandBuffer
{
  v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  id v4 = -[MTLToolsIOCommandBuffer initWithBaseObject:parent:]([MTLToolsIOCommandBuffer alloc], "initWithBaseObject:parent:", objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBuffer"), self);

  return v4;
}

- (id)commandBufferWithUnretainedReferences
{
  v3 = (void *)MEMORY[0x23ECD5710](self, a2);
  id v4 = -[MTLToolsIOCommandBuffer initWithBaseObject:parent:]([MTLToolsIOCommandBuffer alloc], "initWithBaseObject:parent:", objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithUnretainedReferences"), self);

  return v4;
}

- (void)barrier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 enqueueBarrier];
}

- (void)enqueueBarrier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 enqueueBarrier];
}

- (unint64_t)globalTraceObjectID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 globalTraceObjectID];
}

@end