@interface MTLToolsIndirectRenderCommand
- (BOOL)hasBarrier;
- (id)drawArguments;
- (id)drawIndexedArguments;
- (id)drawIndexedPatchesArguments;
- (id)drawMeshThreadgroupsArguments;
- (id)drawMeshThreadsArguments;
- (id)drawPatchesArguments;
- (id)getTessellationFactorArguments;
- (unint64_t)getCommandType;
- (unint64_t)getFragmentBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)getMeshBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)getObjectBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)getObjectThreadgroupMemoryLengthAtIndex:(unint64_t)a3;
- (unint64_t)getOptimizedStatus;
- (unint64_t)getPipelineStateUniqueIdentifier;
- (unint64_t)getVertexAttributeStrideAtIndex:(unint64_t)a3;
- (unint64_t)getVertexBufferAddressAtIndex:(unint64_t)a3;
- (void)clearBarrier;
- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10;
- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7;
- (void)getFragmentBufferAtIndex:(unint64_t)a3;
- (void)getVertexBufferAtIndex:(unint64_t)a3;
- (void)reset;
- (void)setBarrier;
- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setRenderPipelineState:(id)a3;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
@end

@implementation MTLToolsIndirectRenderCommand

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  id v12 = [(MTLToolsObject *)self baseObject];

  [v12 drawPrimitives:a3 vertexStart:a4 vertexCount:a5 instanceCount:a6 baseInstance:a7];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  id v16 = [(MTLToolsObject *)self baseObject];
  uint64_t v17 = [a6 baseObject];

  objc_msgSend(v16, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", a3, a4, a5, v17, a7, a8);
}

- (void)setRenderPipelineState:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  uint64_t v5 = [a3 baseObject];

  [v4 setRenderPipelineState:v5];
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12
{
  id v17 = [(MTLToolsObject *)self baseObject];
  uint64_t v18 = [a6 baseObject];
  [a10 baseObject];

  objc_msgSend(v17, "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:", a3, a4, a5, v18, a7, a8);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14
{
  id v17 = [(MTLToolsObject *)self baseObject];
  uint64_t v18 = [a6 baseObject];
  uint64_t v19 = [a8 baseObject];
  [a12 baseObject];

  objc_msgSend(v17, "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:", a3, a4, a5, v18, a7, v19);
}

- (void)reset
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 reset];
}

- (unint64_t)getPipelineStateUniqueIdentifier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 getPipelineStateUniqueIdentifier];
}

- (id)drawArguments
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 drawArguments];
}

- (id)drawIndexedArguments
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 drawIndexedArguments];
}

- (id)drawIndexedPatchesArguments
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 drawIndexedPatchesArguments];
}

- (id)drawPatchesArguments
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 drawPatchesArguments];
}

- (id)drawMeshThreadgroupsArguments
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 drawMeshThreadgroupsArguments];
}

- (id)drawMeshThreadsArguments
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 drawMeshThreadsArguments];
}

- (id)getTessellationFactorArguments
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 getTessellationFactorArguments];
}

- (unint64_t)getCommandType
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 getCommandType];
}

- (void)getFragmentBufferAtIndex:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (void *)[v4 getFragmentBufferAtIndex:a3];
}

- (void)getVertexBufferAtIndex:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (void *)[v4 getVertexBufferAtIndex:a3];
}

- (unint64_t)getFragmentBufferAddressAtIndex:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 getFragmentBufferAddressAtIndex:a3];
}

- (unint64_t)getVertexBufferAddressAtIndex:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 getVertexBufferAddressAtIndex:a3];
}

- (unint64_t)getObjectBufferAddressAtIndex:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 getObjectBufferAddressAtIndex:a3];
}

- (unint64_t)getMeshBufferAddressAtIndex:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 getMeshBufferAddressAtIndex:a3];
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 setVertexBuffer:a3 offset:a4 atIndex:a5];
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];

  [v10 setVertexBuffer:a3 offset:a4 attributeStride:a5 atIndex:a6];
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 setFragmentBuffer:a3 offset:a4 atIndex:a5];
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 setObjectBuffer:a3 offset:a4 atIndex:a5];
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 setMeshBuffer:a3 offset:a4 atIndex:a5];
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

- (BOOL)hasBarrier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 hasBarrier];
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9 = *a5;
  [v8 drawMeshThreadgroups:&v11 threadsPerObjectThreadgroup:&v10 threadsPerMeshThreadgroup:&v9];
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9 = *a5;
  [v8 drawMeshThreads:&v11 threadsPerObjectThreadgroup:&v10 threadsPerMeshThreadgroup:&v9];
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setObjectThreadgroupMemoryLength:a3 atIndex:a4];
}

- (unint64_t)getObjectThreadgroupMemoryLengthAtIndex:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 getObjectThreadgroupMemoryLengthAtIndex:a3];
}

- (unint64_t)getOptimizedStatus
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 getOptimizedStatus];
}

- (unint64_t)getVertexAttributeStrideAtIndex:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 getVertexAttributeStrideAtIndex:a3];
}

@end