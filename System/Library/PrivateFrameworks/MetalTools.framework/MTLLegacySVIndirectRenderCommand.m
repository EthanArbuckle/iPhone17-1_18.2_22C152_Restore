@interface MTLLegacySVIndirectRenderCommand
- (MTLLegacySVIndirectRenderCommand)initWithIndirectRenderCommand:(id)a3 commandIndex:(unint64_t)a4 indirectCommandBuffer:(id)a5;
- (void)dealloc;
- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14;
- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setRenderPipelineState:(id)a3;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
@end

@implementation MTLLegacySVIndirectRenderCommand

- (MTLLegacySVIndirectRenderCommand)initWithIndirectRenderCommand:(id)a3 commandIndex:(unint64_t)a4 indirectCommandBuffer:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVIndirectRenderCommand;
  result = [(MTLToolsObject *)&v7 initWithBaseObject:a3 parent:a5];
  if (result) {
    result->_commandIndex = a4;
  }
  return result;
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setRenderPipelineState:(id)a3
{
  [(MTLToolsObject *)self->super.super._parent setRenderPipelineStateBuffers:a3 commandIndex:self->_commandIndex];
  baseObject = self->super.super._baseObject;
  uint64_t v6 = [a3 baseObject];

  [(MTLToolsObject *)baseObject setRenderPipelineState:v6];
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14
{
  [(MTLToolsObject *)self->super.super._parent setTessellationControlPointIndexBuffer:a8 offset:a9 commandIndex:self->_commandIndex];
  v20.receiver = self;
  v20.super_class = (Class)MTLLegacySVIndirectRenderCommand;
  [(MTLToolsIndirectRenderCommand *)&v20 drawPatches:a3 patchStart:a4 patchCount:a5 patchIndexBuffer:a6 patchIndexBufferOffset:a7 instanceCount:a10 baseInstance:a11 tessellationFactorBuffer:a12 tessellationFactorBufferOffset:a13 tessellationFactorBufferInstanceStride:a14];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MTLLegacySVIndirectRenderCommand;
  [(MTLToolsObject *)&v2 dealloc];
}

@end