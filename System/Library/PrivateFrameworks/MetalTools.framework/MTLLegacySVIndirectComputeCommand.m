@interface MTLLegacySVIndirectComputeCommand
- (MTLLegacySVIndirectComputeCommand)initWithIndirectComputeCommand:(id)a3 commandIndex:(unint64_t)a4 indirectCommandBuffer:(id)a5;
- (void)clearBarrier;
- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dealloc;
- (void)reset;
- (void)setBarrier;
- (void)setComputePipelineState:(id)a3;
- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setStageInRegion:(id *)a3;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
@end

@implementation MTLLegacySVIndirectComputeCommand

- (MTLLegacySVIndirectComputeCommand)initWithIndirectComputeCommand:(id)a3 commandIndex:(unint64_t)a4 indirectCommandBuffer:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVIndirectComputeCommand;
  result = [(MTLToolsObject *)&v7 initWithBaseObject:a3 parent:a5];
  if (result) {
    result->_commandIndex = a4;
  }
  return result;
}

- (void)reset
{
  [(MTLToolsObject *)self->super.super._parent resetAtIndex:self->_commandIndex];
  baseObject = self->super.super._baseObject;

  [(MTLToolsObject *)baseObject reset];
}

- (void)setBarrier
{
}

- (void)clearBarrier
{
}

- (void)setStageInRegion:(id *)a3
{
  baseObject = self->super.super._baseObject;
  long long v4 = *(_OWORD *)&a3->var0.var2;
  v5[0] = *(_OWORD *)&a3->var0.var0;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->var1.var1;
  [(MTLToolsObject *)baseObject setStageInRegion:v5];
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setComputePipelineState:(id)a3
{
  [(MTLToolsObject *)self->super.super._parent setComputePipelineStateBuffers:a3 commandIndex:self->_commandIndex];
  baseObject = self->super.super._baseObject;
  uint64_t v6 = [a3 baseObject];

  [(MTLToolsObject *)baseObject setComputePipelineState:v6];
}

- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = *a4;
  v4.receiver = self;
  v4.super_class = (Class)MTLLegacySVIndirectComputeCommand;
  [(MTLToolsIndirectComputeCommand *)&v4 concurrentDispatchThreads:&v6 threadsPerThreadgroup:&v5];
}

- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = *a4;
  v4.receiver = self;
  v4.super_class = (Class)MTLLegacySVIndirectComputeCommand;
  [(MTLToolsIndirectComputeCommand *)&v4 concurrentDispatchThreadgroups:&v6 threadsPerThreadgroup:&v5];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MTLLegacySVIndirectComputeCommand;
  [(MTLToolsObject *)&v2 dealloc];
}

@end