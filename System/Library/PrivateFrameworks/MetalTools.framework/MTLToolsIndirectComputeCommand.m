@interface MTLToolsIndirectComputeCommand
- ($1A7EE345FBD7959593737C54B12A4BDF)getStageInRegion;
- (BOOL)hasBarrier;
- (id)dispatchThreadgroupsArguments;
- (id)dispatchThreadsArguments;
- (id)getImageBlockSize;
- (unint64_t)getCommandType;
- (unint64_t)getKernelAttributeStrideAtIndex:(unint64_t)a3;
- (unint64_t)getKernelBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)getOptimizedStatus;
- (unint64_t)getPipelineStateUniqueIdentifier;
- (unint64_t)getThreadgroupMemoryLengthAtIndex:(unint64_t)a3;
- (void)clearBarrier;
- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)getKernelBufferAtIndex:(unint64_t)a3;
- (void)reset;
- (void)setBarrier;
- (void)setComputePipelineState:(id)a3;
- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4;
- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setStageInRegion:(id *)a3;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
@end

@implementation MTLToolsIndirectComputeCommand

- (void)setComputePipelineState:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  uint64_t v5 = [a3 baseObject];

  [v4 setComputePipelineState:v5];
}

- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7 = *a4;
  [v6 concurrentDispatchThreads:&v8 threadsPerThreadgroup:&v7];
}

- (unint64_t)getThreadgroupMemoryLengthAtIndex:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 getThreadgroupMemoryLengthAtIndex:a3];
}

- ($1A7EE345FBD7959593737C54B12A4BDF)getStageInRegion
{
  result = [(MTLToolsObject *)self baseObject];
  if (result)
  {
    return ($1A7EE345FBD7959593737C54B12A4BDF *)[($1A7EE345FBD7959593737C54B12A4BDF *)result getStageInRegion];
  }
  else
  {
    *(_OWORD *)&retstr->var0.var2 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }
  return result;
}

- (BOOL)hasBarrier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 hasBarrier];
}

- (id)getImageBlockSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 getImageBlockSize];
}

- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setImageblockWidth:a3 height:a4];
}

- (void)setBarrier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 setBarrier];
}

- (void)clearBarrier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 clearBarrier];
}

- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7 = *a4;
  [v6 concurrentDispatchThreadgroups:&v8 threadsPerThreadgroup:&v7];
}

- (id)dispatchThreadgroupsArguments
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 dispatchThreadgroupsArguments];
}

- (id)dispatchThreadsArguments
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 dispatchThreadsArguments];
}

- (void)reset
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 reset];
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setThreadgroupMemoryLength:a3 atIndex:a4];
}

- (void)setStageInRegion:(id *)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  long long v5 = *(_OWORD *)&a3->var0.var2;
  v6[0] = *(_OWORD *)&a3->var0.var0;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->var1.var1;
  [v4 setStageInRegion:v6];
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];

  [v8 setKernelBuffer:v9 offset:a4 atIndex:a5];
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];

  [v10 setKernelBuffer:a3 offset:a4 attributeStride:a5 atIndex:a6];
}

- (unint64_t)getPipelineStateUniqueIdentifier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 getPipelineStateUniqueIdentifier];
}

- (void)getKernelBufferAtIndex:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (void *)[v4 getKernelBufferAtIndex:a3];
}

- (unint64_t)getKernelBufferAddressAtIndex:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 getKernelBufferAddressAtIndex:a3];
}

- (unint64_t)getCommandType
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 getCommandType];
}

- (unint64_t)getOptimizedStatus
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 getOptimizedStatus];
}

- (unint64_t)getKernelAttributeStrideAtIndex:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 getKernelAttributeStrideAtIndex:a3];
}

@end