@interface MTLDebugIndirectRenderCommand
- (MTLDebugIndirectRenderCommand)initWithBaseObject:(id)a3 descriptor:(id)a4 indexCount:(unint64_t)a5 indirectCommandBuffer:(id)a6;
- (MTLIndirectCommandBuffer)indirectCommandBuffer;
- (unint64_t)index;
- (void)clearBarrier;
- (void)dealloc;
- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10;
- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7;
- (void)setBarrier;
- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setRenderPipelineState:(id)a3;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
@end

@implementation MTLDebugIndirectRenderCommand

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
  v3.super_class = (Class)MTLDebugIndirectRenderCommand;
  [(MTLToolsObject *)&v3 dealloc];
}

- (MTLDebugIndirectRenderCommand)initWithBaseObject:(id)a3 descriptor:(id)a4 indexCount:(unint64_t)a5 indirectCommandBuffer:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)MTLDebugIndirectRenderCommand;
  v9 = [(MTLToolsObject *)&v12 initWithBaseObject:a3 parent:a6];
  v10 = v9;
  if (v9)
  {
    v9->_desc = (MTLIndirectCommandBufferDescriptor *)a4;
    v9->_iCB = (MTLIndirectCommandBufferSPI *)a6;
    v10->_index = a5;
  }
  return v10;
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if ([(MTLIndirectCommandBufferDescriptor *)self->_desc maxVertexBufferBindCount] <= a6)
  {
    unint64_t v11 = a6;
    NSUInteger v12 = [(MTLIndirectCommandBufferDescriptor *)self->_desc maxVertexBufferBindCount];
    _MTLMessageContextPush_();
  }
  if ([(MTLIndirectCommandBufferDescriptor *)self->_desc inheritBuffers]) {
    _MTLMessageContextPush_();
  }
  if (a5 != -1
    && ![(MTLIndirectCommandBufferDescriptor *)self->_desc supportDynamicAttributeStride])
  {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBuffer:offset:attributeStride:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5, a6);
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if ([(MTLIndirectCommandBufferDescriptor *)self->_desc maxFragmentBufferBindCount] <= a5)
  {
    unint64_t v9 = a5;
    NSUInteger v10 = [(MTLIndirectCommandBufferDescriptor *)self->_desc maxFragmentBufferBindCount];
    _MTLMessageContextPush_();
  }
  if ([(MTLIndirectCommandBufferDescriptor *)self->_desc inheritBuffers]) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  if (([(MTLIndirectCommandBufferDescriptor *)self->_desc commandTypes] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  _MTLDebugValidateMTLPrimitiveTypeWithContext(a3, 0);
  if (!a6) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:", a3, a4, a5, a6, a7);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (([(MTLIndirectCommandBufferDescriptor *)self->_desc commandTypes] & 2) == 0) {
    _MTLMessageContextPush_();
  }
  _MTLDebugValidateIndexBufferWithContext((uint64_t)self->super.super._device, a5, a6, (uint64_t)"indexBuffer", a7, 1, a4, (uint64_t *)v17);
  _MTLDebugValidateMTLPrimitiveTypeWithContext(a3, 0);
  if (!a8) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, a8, a9, a10);
}

- (void)setRenderPipelineState:(id)a3
{
  if ([(MTLIndirectCommandBufferDescriptor *)self->_desc inheritPipelineState]) {
    _MTLMessageContextPush_();
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "baseObject"), "supportIndirectCommandBuffers") & 1) == 0) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setRenderPipelineState:", objc_msgSend(a3, "baseObject"));
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12
{
  uint64_t v20 = 0;
  memset(v19, 0, sizeof(v19));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (([(MTLIndirectCommandBufferDescriptor *)self->_desc commandTypes] & 4) == 0) {
    _MTLMessageContextPush_();
  }
  if (!a8) {
    _MTLMessageContextPush_();
  }
  if (a3 >= 0x21) {
    _MTLMessageContextPush_();
  }
  _MTLDebugValidatePatchIndexBufferWithContext((unint64_t)self->super.super._device, a6, (uint64_t)"patchIndexBuffer", a7, 1, a4, a5, a9, a8, (uint64_t *)v19);
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, a8, a9, objc_msgSend(a10, "baseObject"), a11, a12);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14
{
  uint64_t v22 = 0;
  memset(v21, 0, sizeof(v21));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (([(MTLIndirectCommandBufferDescriptor *)self->_desc commandTypes] & 8) == 0) {
    _MTLMessageContextPush_();
  }
  if (!a10) {
    _MTLMessageContextPush_();
  }
  if (a3 >= 0x21) {
    _MTLMessageContextPush_();
  }
  _MTLDebugValidatePatchIndexBufferWithContext((unint64_t)self->super.super._device, a6, (uint64_t)"patchIndexBuffer", a7, 1, a4, a5, a11, a10, (uint64_t *)v21);
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, objc_msgSend(a8, "baseObject"), a9, a10, a11, objc_msgSend(a12, "baseObject"), a13, a14);
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if ([(MTLIndirectCommandBufferDescriptor *)self->_desc maxObjectBufferBindCount] <= a5)
  {
    unint64_t v9 = a5;
    NSUInteger v10 = [(MTLIndirectCommandBufferDescriptor *)self->_desc maxObjectBufferBindCount];
    _MTLMessageContextPush_();
  }
  if ([(MTLIndirectCommandBufferDescriptor *)self->_desc inheritBuffers]) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if ([(MTLIndirectCommandBufferDescriptor *)self->_desc maxMeshBufferBindCount] <= a5)
  {
    unint64_t v9 = a5;
    NSUInteger v10 = [(MTLIndirectCommandBufferDescriptor *)self->_desc maxMeshBufferBindCount];
    _MTLMessageContextPush_();
  }
  if ([(MTLIndirectCommandBufferDescriptor *)self->_desc inheritBuffers]) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setBarrier
{
  if (([(MTLIndirectCommandBufferDescriptor *)self->_desc commandTypes] & 0x180) == 0) {
    MTLReportFailure();
  }
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 setBarrier];
}

- (void)clearBarrier
{
  if (([(MTLIndirectCommandBufferDescriptor *)self->_desc commandTypes] & 0x180) == 0) {
    MTLReportFailure();
  }
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 clearBarrier];
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  if (([(MTLIndirectCommandBufferDescriptor *)self->_desc commandTypes] & 0x80) == 0) {
    MTLReportFailure();
  }
  id v9 = [(MTLToolsObject *)self baseObject];
  long long v14 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  long long v12 = *(_OWORD *)&a4->var0;
  unint64_t v13 = a4->var2;
  long long v10 = *(_OWORD *)&a5->var0;
  unint64_t v11 = a5->var2;
  [v9 drawMeshThreadgroups:&v14 threadsPerObjectThreadgroup:&v12 threadsPerMeshThreadgroup:&v10];
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  if (([(MTLIndirectCommandBufferDescriptor *)self->_desc commandTypes] & 0x100) == 0) {
    MTLReportFailure();
  }
  id v9 = [(MTLToolsObject *)self baseObject];
  long long v14 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  long long v12 = *(_OWORD *)&a4->var0;
  unint64_t v13 = a4->var2;
  long long v10 = *(_OWORD *)&a5->var0;
  unint64_t v11 = a5->var2;
  [v9 drawMeshThreads:&v14 threadsPerObjectThreadgroup:&v12 threadsPerMeshThreadgroup:&v10];
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if ([(MTLIndirectCommandBufferDescriptor *)self->_desc maxObjectThreadgroupMemoryBindCount] <= a4)
  {
    unint64_t v7 = a4;
    NSUInteger v8 = [(MTLIndirectCommandBufferDescriptor *)self->_desc maxObjectThreadgroupMemoryBindCount];
    MTLReportFailure();
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugIndirectRenderCommand;
  -[MTLToolsIndirectRenderCommand setObjectThreadgroupMemoryLength:atIndex:](&v9, sel_setObjectThreadgroupMemoryLength_atIndex_, a3, a4, v7, v8);
}

@end