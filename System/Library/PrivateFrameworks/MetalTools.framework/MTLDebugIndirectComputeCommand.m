@interface MTLDebugIndirectComputeCommand
- (MTLDebugIndirectComputeCommand)initWithBaseObject:(id)a3 descriptor:(id)a4 indexCount:(unint64_t)a5 indirectCommandBuffer:(id)a6;
- (MTLIndirectCommandBuffer)indirectCommandBuffer;
- (unint64_t)index;
- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dealloc;
- (void)setComputePipelineState:(id)a3;
- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
@end

@implementation MTLDebugIndirectComputeCommand

- (MTLDebugIndirectComputeCommand)initWithBaseObject:(id)a3 descriptor:(id)a4 indexCount:(unint64_t)a5 indirectCommandBuffer:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MTLDebugIndirectComputeCommand;
  v9 = [(MTLToolsObject *)&v11 initWithBaseObject:a3 parent:a6];
  if (v9)
  {
    v9->_iCB = (MTLIndirectCommandBufferSPI *)a6;
    v9->_desc = (MTLIndirectCommandBufferDescriptor *)a4;
    v9->_index = a5;
  }
  return v9;
}

- (unint64_t)index
{
  return self->_index;
}

- (MTLIndirectCommandBuffer)indirectCommandBuffer
{
  return self->_iCB;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugIndirectComputeCommand;
  [(MTLToolsObject *)&v3 dealloc];
}

- (void)setComputePipelineState:(id)a3
{
  if ([(MTLIndirectCommandBufferDescriptor *)self->_desc inheritPipelineState]) {
    MTLReportFailure();
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "baseObject"), "supportIndirectCommandBuffers") & 1) == 0) {
    MTLReportFailure();
  }
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 setComputePipelineState:v6];
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  if ([(MTLIndirectCommandBufferDescriptor *)self->_desc maxKernelBufferBindCount] <= a6)
  {
    unint64_t v13 = a6;
    NSUInteger v14 = [(MTLIndirectCommandBufferDescriptor *)self->_desc maxKernelBufferBindCount];
    MTLReportFailure();
  }
  if ([(MTLIndirectCommandBufferDescriptor *)self->_desc inheritBuffers]) {
    MTLReportFailure();
  }
  if (a5 != -1
    && ![(MTLIndirectCommandBufferDescriptor *)self->_desc supportDynamicAttributeStride])
  {
    MTLReportFailure();
  }
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];

  [v11 setKernelBuffer:v12 offset:a4 attributeStride:a5 atIndex:a6];
}

- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  if (([(MTLIndirectCommandBufferDescriptor *)self->_desc commandTypes] & 0x20) == 0) {
    MTLReportFailure();
  }
  id v7 = [(MTLToolsObject *)self baseObject];
  long long v10 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  long long v8 = *(_OWORD *)&a4->var0;
  unint64_t v9 = a4->var2;
  [v7 concurrentDispatchThreadgroups:&v10 threadsPerThreadgroup:&v8];
}

- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  if (([(MTLIndirectCommandBufferDescriptor *)self->_desc commandTypes] & 0x40) == 0) {
    MTLReportFailure();
  }
  id v7 = [(MTLToolsObject *)self baseObject];
  long long v10 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  long long v8 = *(_OWORD *)&a4->var0;
  unint64_t v9 = a4->var2;
  [v7 concurrentDispatchThreads:&v10 threadsPerThreadgroup:&v8];
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if ([(MTLIndirectCommandBufferDescriptor *)self->_desc maxKernelThreadgroupMemoryBindCount] <= a4)
  {
    unint64_t v7 = a4;
    NSUInteger v8 = [(MTLIndirectCommandBufferDescriptor *)self->_desc maxKernelThreadgroupMemoryBindCount];
    MTLReportFailure();
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugIndirectComputeCommand;
  -[MTLToolsIndirectComputeCommand setThreadgroupMemoryLength:atIndex:](&v9, sel_setThreadgroupMemoryLength_atIndex_, a3, a4, v7, v8);
}

@end