@interface MTLCountersRenderCommandEncoder
- (MTLCountersRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4;
- (MTLCountersRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5;
- (void)_initWithCommandBuffer:(id)a3;
- (void)dealloc;
- (void)dispatchThreadsPerTile:(id *)a3;
- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9;
- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8;
- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7;
- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9;
- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7;
- (void)endEncoding;
- (void)insertDebugSignpost:(id)a3;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6;
- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6;
- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7;
- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7 atIndex:(unint64_t)a8;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setCullMode:(unint64_t)a3;
- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5;
- (void)setDepthClipMode:(unint64_t)a3;
- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6;
- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7;
- (void)setDepthStencilState:(id)a3;
- (void)setDepthStoreAction:(unint64_t)a3;
- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6;
- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFrontFacingWinding:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setLineWidth:(float)a3;
- (void)setRenderPipelineState:(id)a3;
- (void)setScissorRect:(id *)a3;
- (void)setScissorRects:(id *)a3 count:(unint64_t)a4;
- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4;
- (void)setStencilReferenceValue:(unsigned int)a3;
- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6;
- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7;
- (void)setStencilStoreAction:(unint64_t)a3;
- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5;
- (void)setTessellationFactorScale:(float)a3;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTriangleFillMode:(unint64_t)a3;
- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4;
- (void)setVertexAmplificationMode:(unint64_t)a3 value:(unint64_t)a4;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6;
- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setViewport:(id *)a3;
- (void)setViewports:(id *)a3 count:(unint64_t)a4;
- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4;
- (void)updateFence:(id)a3 afterStages:(unint64_t)a4;
- (void)useHeap:(id)a3;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6;
- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4;
@end

@implementation MTLCountersRenderCommandEncoder

- (void)_initWithCommandBuffer:(id)a3
{
  *(&self->_APITimingEnabled + 4) = objc_msgSend((id)objc_msgSend(a3, "device"), "APITimingEnabled");
  self->_traceEncoder = (MTLCountersTraceRenderCommandEncoder *)(id)objc_msgSend((id)objc_msgSend(a3, "traceBuffer"), "renderCommandEncoder");
}

- (MTLCountersRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTLCountersRenderCommandEncoder;
  v5 = -[MTLToolsRenderCommandEncoder initWithRenderCommandEncoder:parent:](&v7, sel_initWithRenderCommandEncoder_parent_, a3);
  if (v5) {
    -[MTLCountersRenderCommandEncoder _initWithCommandBuffer:](v5, "_initWithCommandBuffer:", [a4 commandBuffer]);
  }
  return v5;
}

- (MTLCountersRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MTLCountersRenderCommandEncoder;
  v6 = [(MTLToolsRenderCommandEncoder *)&v9 initWithRenderCommandEncoder:a3 parent:a4 descriptor:a5];
  objc_super v7 = v6;
  if (v6) {
    [(MTLCountersRenderCommandEncoder *)v6 _initWithCommandBuffer:a4];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLCountersRenderCommandEncoder;
  [(MTLToolsObject *)&v3 dealloc];
}

- (void)insertDebugSignpost:(id)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "insertDebugSignpost:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  objc_super v9 = self->_traceEncoder;

  [(MTLCountersTraceCommandEncoder *)v9 insertDebugSignpost:a3];
}

- (void)pushDebugGroup:(id)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "pushDebugGroup:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  objc_super v9 = self->_traceEncoder;

  [(MTLCountersTraceCommandEncoder *)v9 pushDebugGroup:a3];
}

- (void)popDebugGroup
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v3 = mach_absolute_time();
  }
  else {
    uint64_t v3 = 0;
  }
  self->_traceEncoder->super._timer = v3;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "popDebugGroup");
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v4 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v6 = v4 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v6 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v6;
  objc_super v7 = self->_traceEncoder;

  [(MTLCountersTraceCommandEncoder *)v7 popDebugGroup];
}

- (void)setLabel:(id)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  objc_super v9 = self->_traceEncoder;

  [(MTLCountersTraceCommandEncoder *)v9 setLabel:a3];
}

- (void)setRenderPipelineState:(id)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setRenderPipelineState:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  objc_super v9 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v9 setRenderPipelineState:a3];
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBytes:length:atIndex:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  v13 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v13 setVertexBytes:a3 length:a4 atIndex:a5];
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBuffer:offset:atIndex:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  v13 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v13 setVertexBuffer:a3 offset:a4 atIndex:a5];
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBufferOffset:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  v11 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v11 setVertexBufferOffset:a3 atIndex:a4];
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v10 = mach_absolute_time();
  }
  else {
    uint64_t v10 = 0;
  }
  self->_traceEncoder->super._timer = v10;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBuffers:offsets:withRange:", a3, a4, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v11 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v13 = v11 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v13 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v13;
  v14 = self->_traceEncoder;

  -[MTLCountersTraceRenderCommandEncoder setVertexBuffers:offsets:withRange:](v14, "setVertexBuffers:offsets:withRange:", a3, a4, location, length);
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v11 = mach_absolute_time();
  }
  else {
    uint64_t v11 = 0;
  }
  self->_traceEncoder->super._timer = v11;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBytes:length:attributeStride:atIndex:", a3, a4, a5, a6);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v12 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v14 = v12 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v14 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v14;
  v15 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v15 setVertexBytes:a3 length:a4 attributeStride:a5 atIndex:a6];
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v11 = mach_absolute_time();
  }
  else {
    uint64_t v11 = 0;
  }
  self->_traceEncoder->super._timer = v11;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBuffer:offset:attributeStride:atIndex:", a3, a4, a5, a6);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v12 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v14 = v12 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v14 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v14;
  v15 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v15 setVertexBuffer:a3 offset:a4 attributeStride:a5 atIndex:a6];
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBufferOffset:attributeStride:atIndex:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  unint64_t v13 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v13 setVertexBufferOffset:a3 attributeStride:a4 atIndex:a5];
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v12 = mach_absolute_time();
  }
  else {
    uint64_t v12 = 0;
  }
  self->_traceEncoder->super._timer = v12;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBuffers:offsets:attributeStrides:withRange:", a3, a4, a5, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v13 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v15 = v13 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v15 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v15;
  v16 = self->_traceEncoder;

  -[MTLCountersTraceRenderCommandEncoder setVertexBuffers:offsets:attributeStrides:withRange:](v16, "setVertexBuffers:offsets:attributeStrides:withRange:", a3, a4, a5, location, length);
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexTexture:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  uint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v11 setVertexTexture:a3 atIndex:a4];
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v8 = mach_absolute_time();
  }
  else {
    uint64_t v8 = 0;
  }
  self->_traceEncoder->super._timer = v8;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexTextures:withRange:", a3, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v9 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v11 = v9 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v11 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v11;
  uint64_t v12 = self->_traceEncoder;

  -[MTLCountersTraceRenderCommandEncoder setVertexTextures:withRange:](v12, "setVertexTextures:withRange:", a3, location, length);
}

- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexSamplerState:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  unint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v11 setVertexSamplerState:a3 atIndex:a4];
}

- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v8 = mach_absolute_time();
  }
  else {
    uint64_t v8 = 0;
  }
  self->_traceEncoder->super._timer = v8;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexSamplerStates:withRange:", a3, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v9 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v11 = v9 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v11 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v11;
  uint64_t v12 = self->_traceEncoder;

  -[MTLCountersTraceRenderCommandEncoder setVertexSamplerStates:withRange:](v12, "setVertexSamplerStates:withRange:", a3, location, length);
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v11 = mach_absolute_time();
  }
  else {
    uint64_t v11 = 0;
  }
  self->_traceEncoder->super._timer = v11;
  id v12 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v13 = a4;
  *(float *)&double v14 = a5;
  [v12 setVertexSamplerState:a3 lodMinClamp:a6 lodMaxClamp:v13 atIndex:v14];
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v17 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v19 = v17 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v19 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v19;
  v20 = self->_traceEncoder;
  *(float *)&double v15 = a4;
  *(float *)&double v16 = a5;

  [(MTLCountersTraceRenderCommandEncoder *)v20 setVertexSamplerState:a3 lodMinClamp:a6 lodMaxClamp:v15 atIndex:v16];
}

- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v12 = mach_absolute_time();
  }
  else {
    uint64_t v12 = 0;
  }
  self->_traceEncoder->super._timer = v12;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v13 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v15 = v13 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v15 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v15;
  double v16 = self->_traceEncoder;

  -[MTLCountersTraceRenderCommandEncoder setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:](v16, "setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, location, length);
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBytes:length:atIndex:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  uint64_t v13 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v13 setFragmentBytes:a3 length:a4 atIndex:a5];
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBuffer:offset:atIndex:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  uint64_t v13 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v13 setFragmentBuffer:a3 offset:a4 atIndex:a5];
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBufferOffset:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  uint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v11 setFragmentBufferOffset:a3 atIndex:a4];
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v10 = mach_absolute_time();
  }
  else {
    uint64_t v10 = 0;
  }
  self->_traceEncoder->super._timer = v10;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBuffers:offsets:withRange:", a3, a4, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v11 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v13 = v11 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v13 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v13;
  double v14 = self->_traceEncoder;

  -[MTLCountersTraceRenderCommandEncoder setFragmentBuffers:offsets:withRange:](v14, "setFragmentBuffers:offsets:withRange:", a3, a4, location, length);
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentTexture:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  uint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v11 setFragmentTexture:a3 atIndex:a4];
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v8 = mach_absolute_time();
  }
  else {
    uint64_t v8 = 0;
  }
  self->_traceEncoder->super._timer = v8;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentTextures:withRange:", a3, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v9 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v11 = v9 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v11 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v11;
  unint64_t v12 = self->_traceEncoder;

  -[MTLCountersTraceRenderCommandEncoder setFragmentTextures:withRange:](v12, "setFragmentTextures:withRange:", a3, location, length);
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentSamplerState:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  unint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v11 setFragmentSamplerState:a3 atIndex:a4];
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v8 = mach_absolute_time();
  }
  else {
    uint64_t v8 = 0;
  }
  self->_traceEncoder->super._timer = v8;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentSamplerStates:withRange:", a3, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v9 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v11 = v9 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v11 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v11;
  unint64_t v12 = self->_traceEncoder;

  -[MTLCountersTraceRenderCommandEncoder setFragmentSamplerStates:withRange:](v12, "setFragmentSamplerStates:withRange:", a3, location, length);
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v11 = mach_absolute_time();
  }
  else {
    uint64_t v11 = 0;
  }
  self->_traceEncoder->super._timer = v11;
  id v12 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v13 = a4;
  *(float *)&double v14 = a5;
  [v12 setFragmentSamplerState:a3 lodMinClamp:a6 lodMaxClamp:v13 atIndex:v14];
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v17 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v19 = v17 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v19 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v19;
  v20 = self->_traceEncoder;
  *(float *)&double v15 = a4;
  *(float *)&double v16 = a5;

  [(MTLCountersTraceRenderCommandEncoder *)v20 setFragmentSamplerState:a3 lodMinClamp:a6 lodMaxClamp:v15 atIndex:v16];
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v12 = mach_absolute_time();
  }
  else {
    uint64_t v12 = 0;
  }
  self->_traceEncoder->super._timer = v12;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v13 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v15 = v13 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v15 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v15;
  double v16 = self->_traceEncoder;

  -[MTLCountersTraceRenderCommandEncoder setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:](v16, "setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, location, length);
}

- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];

  [v10 setFragmentTexture:a3 atTextureIndex:a4 samplerState:a5 atSamplerIndex:a6];
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBytes:length:atIndex:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  uint64_t v13 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v13 setTileBytes:a3 length:a4 atIndex:a5];
}

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBuffer:offset:atIndex:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  uint64_t v13 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v13 setTileBuffer:a3 offset:a4 atIndex:a5];
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBufferOffset:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  uint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v11 setTileBufferOffset:a3 atIndex:a4];
}

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v10 = mach_absolute_time();
  }
  else {
    uint64_t v10 = 0;
  }
  self->_traceEncoder->super._timer = v10;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBuffers:offsets:withRange:", a3, a4, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v11 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v13 = v11 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v13 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v13;
  double v14 = self->_traceEncoder;

  -[MTLCountersTraceRenderCommandEncoder setTileBuffers:offsets:withRange:](v14, "setTileBuffers:offsets:withRange:", a3, a4, location, length);
}

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setTileTexture:a3 atIndex:a4];
}

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = [(MTLToolsObject *)self baseObject];

  objc_msgSend(v7, "setTileTextures:withRange:", a3, location, length);
}

- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setTileSamplerState:a3 atIndex:a4];
}

- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = [(MTLToolsObject *)self baseObject];

  objc_msgSend(v7, "setTileSamplerStates:withRange:", a3, location, length);
}

- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v11 = a4;
  *(float *)&double v12 = a5;

  [v10 setTileSamplerState:a3 lodMinClamp:a6 lodMaxClamp:v11 atIndex:v12];
}

- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v11 = [(MTLToolsObject *)self baseObject];

  objc_msgSend(v11, "setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, location, length);
}

- (void)dispatchThreadsPerTile:(id *)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = *a3;
  [v4 dispatchThreadsPerTile:&v5];
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 setThreadgroupMemoryLength:a3 offset:a4 atIndex:a5];
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResource:usage:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  id v11 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v11 useResource:a3 usage:a4];
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResources:count:usage:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  unint64_t v13 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v13 useResources:a3 count:a4 usage:a5];
}

- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResource:usage:stages:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  unint64_t v13 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v13 useResource:a3 usage:a4 stages:a5];
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v11 = mach_absolute_time();
  }
  else {
    uint64_t v11 = 0;
  }
  self->_traceEncoder->super._timer = v11;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResources:count:usage:stages:", a3, a4, a5, a6);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v12 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v14 = v12 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v14 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v14;
  unint64_t v15 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v15 useResources:a3 count:a4 usage:a5 stages:a6];
}

- (void)useHeap:(id)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useHeap:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  uint64_t v9 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v9 useHeap:a3];
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useHeaps:count:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  uint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v11 useHeaps:a3 count:a4];
}

- (void)setViewport:(id *)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  id v6 = [(MTLToolsObject *)self baseObject];
  long long v7 = *(_OWORD *)&a3->var2;
  v14[0] = *(_OWORD *)&a3->var0;
  v14[1] = v7;
  v14[2] = *(_OWORD *)&a3->var4;
  [v6 setViewport:v14];
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  uint64_t v11 = self->_traceEncoder;
  long long v12 = *(_OWORD *)&a3->var2;
  v13[0] = *(_OWORD *)&a3->var0;
  v13[1] = v12;
  v13[2] = *(_OWORD *)&a3->var4;
  [(MTLCountersTraceRenderCommandEncoder *)v11 setViewport:v13];
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setViewports:count:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  uint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v11 setViewports:a3 count:a4];
}

- (void)setFrontFacingWinding:(unint64_t)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFrontFacingWinding:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  uint64_t v9 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v9 setFrontFacingWinding:a3];
}

- (void)setCullMode:(unint64_t)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setCullMode:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  uint64_t v9 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v9 setCullMode:a3];
}

- (void)setDepthClipMode:(unint64_t)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthClipMode:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  uint64_t v9 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v9 setDepthClipMode:a3];
}

- (void)setLineWidth:(float)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v5 = a3;

  [v4 setLineWidth:v5];
}

- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  id v10 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v11 = a3;
  *(float *)&double v12 = a4;
  *(float *)&double v13 = a5;
  [v10 setDepthBias:v11 slopeScale:v12 clamp:v13];
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v17 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v19 = v17 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v19 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v19;
  v20 = self->_traceEncoder;
  *(float *)&double v14 = a3;
  *(float *)&double v15 = a4;
  *(float *)&double v16 = a5;

  [(MTLCountersTraceRenderCommandEncoder *)v20 setDepthBias:v14 slopeScale:v15 clamp:v16];
}

- (void)setScissorRect:(id *)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  id v6 = [(MTLToolsObject *)self baseObject];
  long long v7 = *(_OWORD *)&a3->var2;
  v14[0] = *(_OWORD *)&a3->var0;
  v14[1] = v7;
  [v6 setScissorRect:v14];
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  double v11 = self->_traceEncoder;
  long long v12 = *(_OWORD *)&a3->var2;
  v13[0] = *(_OWORD *)&a3->var0;
  v13[1] = v12;
  [(MTLCountersTraceRenderCommandEncoder *)v11 setScissorRect:v13];
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setScissorRects:count:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  double v11 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v11 setScissorRects:a3 count:a4];
}

- (void)setVertexAmplificationMode:(unint64_t)a3 value:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setVertexAmplificationMode:a3 value:a4];
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setVertexAmplificationCount:a3 viewMappings:a4];
}

- (void)setTriangleFillMode:(unint64_t)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTriangleFillMode:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  uint64_t v9 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v9 setTriangleFillMode:a3];
}

- (void)setDepthStencilState:(id)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthStencilState:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  uint64_t v9 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v9 setDepthStencilState:a3];
}

- (void)setStencilReferenceValue:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilReferenceValue:", v3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  uint64_t v9 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v9 setStencilReferenceValue:v3];
}

- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilFrontReferenceValue:backReferenceValue:", v5, v4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  double v11 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v11 setStencilFrontReferenceValue:v5 backReferenceValue:v4];
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorStoreAction:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  double v11 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v11 setColorStoreAction:a3 atIndex:a4];
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthStoreAction:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  uint64_t v9 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v9 setDepthStoreAction:a3];
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilStoreAction:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  uint64_t v9 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v9 setStencilStoreAction:a3];
}

- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibilityResultMode:offset:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  double v11 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v11 setVisibilityResultMode:a3 offset:a4];
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v11 = mach_absolute_time();
  }
  else {
    uint64_t v11 = 0;
  }
  self->_traceEncoder->super._timer = v11;
  id v12 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v13 = a3;
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  *(float *)&double v16 = a6;
  [v12 setBlendColorRed:v13 green:v14 blue:v15 alpha:v16];
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v21 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v23 = v21 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v23 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v23;
  v24 = self->_traceEncoder;
  *(float *)&double v17 = a3;
  *(float *)&double v18 = a4;
  *(float *)&double v19 = a5;
  *(float *)&double v20 = a6;

  [(MTLCountersTraceRenderCommandEncoder *)v24 setBlendColorRed:v17 green:v18 blue:v19 alpha:v20];
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7
{
  id v12 = [(MTLToolsObject *)self baseObject];

  [v12 setColorResolveTexture:a3 slice:a4 depthPlane:a5 level:a6 atIndex:a7];
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7 atIndex:(unint64_t)a8
{
  BOOL v9 = a7;
  id v14 = [(MTLToolsObject *)self baseObject];

  [v14 setColorResolveTexture:a3 slice:a4 depthPlane:a5 level:a6 yInvert:v9 atIndex:a8];
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];

  [v10 setDepthResolveTexture:a3 slice:a4 depthPlane:a5 level:a6];
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = [(MTLToolsObject *)self baseObject];

  [v12 setDepthResolveTexture:a3 slice:a4 depthPlane:a5 level:a6 yInvert:v7];
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];

  [v10 setStencilResolveTexture:a3 slice:a4 depthPlane:a5 level:a6];
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = [(MTLToolsObject *)self baseObject];

  [v12 setStencilResolveTexture:a3 slice:a4 depthPlane:a5 level:a6 yInvert:v7];
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v11 = mach_absolute_time();
  }
  else {
    uint64_t v11 = 0;
  }
  self->_traceEncoder->super._timer = v11;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:vertexStart:vertexCount:instanceCount:", a3, a4, a5, a6);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v12 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v14 = v12 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v14 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v14;
  double v15 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v15 drawPrimitives:a3 vertexStart:a4 vertexCount:a5 instanceCount:a6];
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:vertexStart:vertexCount:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  double v13 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v13 drawPrimitives:a3 vertexStart:a4 vertexCount:a5];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v15 = mach_absolute_time();
  }
  else {
    uint64_t v15 = 0;
  }
  self->_traceEncoder->super._timer = v15;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:", a3, a4, a5, a6, a7, a8);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v16 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v18 = v16 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v18 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v18;
  double v19 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v19 drawIndexedPrimitives:a3 indexCount:a4 indexType:a5 indexBuffer:a6 indexBufferOffset:a7 instanceCount:a8];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v13 = mach_absolute_time();
  }
  else {
    uint64_t v13 = 0;
  }
  self->_traceEncoder->super._timer = v13;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", a3, a4, a5, a6, a7);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v14 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v16 = v14 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v16 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v16;
  double v17 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v17 drawIndexedPrimitives:a3 indexCount:a4 indexType:a5 indexBuffer:a6 indexBufferOffset:a7];
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v13 = mach_absolute_time();
  }
  else {
    uint64_t v13 = 0;
  }
  self->_traceEncoder->super._timer = v13;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:", a3, a4, a5, a6, a7);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v14 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v16 = v14 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v16 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v16;
  double v17 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v17 drawPrimitives:a3 vertexStart:a4 vertexCount:a5 instanceCount:a6 baseInstance:a7];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v16 = mach_absolute_time();
  }
  else {
    uint64_t v16 = 0;
  }
  self->_traceEncoder->super._timer = v16;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", a3, a4, a5, a6, a7, a8, a9, a10);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v17 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v19 = v17 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v19 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v19;
  double v20 = self->_traceEncoder;

  -[MTLCountersTraceRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:](v20, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", a3, a4, a5, a6, a7, a8);
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:indirectBuffer:indirectBufferOffset:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  uint64_t v13 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v13 drawPrimitives:a3 indirectBuffer:a4 indirectBufferOffset:a5];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v15 = mach_absolute_time();
  }
  else {
    uint64_t v15 = 0;
  }
  self->_traceEncoder->super._timer = v15;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, a5, a6, a7, a8);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v16 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v18 = v16 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v18 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v18;
  unint64_t v19 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v19 drawIndexedPrimitives:a3 indexType:a4 indexBuffer:a5 indexBufferOffset:a6 indirectBuffer:a7 indirectBufferOffset:a8];
}

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateFence:afterStages:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  uint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v11 updateFence:a3 afterStages:a4];
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForFence:beforeStages:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  uint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v11 waitForFence:a3 beforeStages:a4];
}

- (void)endEncoding
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v3 = mach_absolute_time();
  }
  else {
    uint64_t v3 = 0;
  }
  self->_traceEncoder->super._timer = v3;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v4 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v6 = v4 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v6 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v6;
  uint64_t v7 = self->_traceEncoder;

  [(MTLCountersTraceCommandEncoder *)v7 endEncoding];
}

- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTessellationFactorBuffer:offset:instanceStride:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  uint64_t v13 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v13 setTessellationFactorBuffer:a3 offset:a4 instanceStride:a5];
}

- (void)setTessellationFactorScale:(float)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  id v6 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v7 = a3;
  [v6 setTessellationFactorScale:v7];
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v9 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v11 = v9 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v11 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v11;
  unint64_t v12 = self->_traceEncoder;
  *(float *)&double v8 = a3;

  [(MTLCountersTraceRenderCommandEncoder *)v12 setTessellationFactorScale:v8];
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v15 = mach_absolute_time();
  }
  else {
    uint64_t v15 = 0;
  }
  self->_traceEncoder->super._timer = v15;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, a6, a7, a8, a9);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v16 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v18 = v16 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v18 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v18;
  unint64_t v19 = self->_traceEncoder;

  -[MTLCountersTraceRenderCommandEncoder drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:](v19, "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, a6, a7, a8);
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v13 = mach_absolute_time();
  }
  else {
    uint64_t v13 = 0;
  }
  self->_traceEncoder->super._timer = v13;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, a5, a6, a7);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v14 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v16 = v14 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v16 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v16;
  uint64_t v17 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v17 drawPatches:a3 patchIndexBuffer:a4 patchIndexBufferOffset:a5 indirectBuffer:a6 indirectBufferOffset:a7];
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v16 = mach_absolute_time();
  }
  else {
    uint64_t v16 = 0;
  }
  self->_traceEncoder->super._timer = v16;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, a6, a7, a8, a9, a10, a11);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v17 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v19 = v17 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v19 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v19;
  double v20 = self->_traceEncoder;

  -[MTLCountersTraceRenderCommandEncoder drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:](v20, "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, a6, a7, a8);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v15 = mach_absolute_time();
  }
  else {
    uint64_t v15 = 0;
  }
  self->_traceEncoder->super._timer = v15;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, a5, a6, a7, a8, a9);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v16 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v18 = v16 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v18 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v18;
  unint64_t v19 = self->_traceEncoder;

  -[MTLCountersTraceRenderCommandEncoder drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:](v19, "drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, a5, a6, a7, a8);
}

- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "memoryBarrierWithScope:afterStages:beforeStages:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  uint64_t v13 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v13 memoryBarrierWithScope:a3 afterStages:a4 beforeStages:a5];
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v11 = mach_absolute_time();
  }
  else {
    uint64_t v11 = 0;
  }
  self->_traceEncoder->super._timer = v11;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "memoryBarrierWithResources:count:afterStages:beforeStages:", a3, a4, a5, a6);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v12 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v14 = v12 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v14 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v14;
  uint64_t v15 = self->_traceEncoder;

  [(MTLCountersTraceRenderCommandEncoder *)v15 memoryBarrierWithResources:a3 count:a4 afterStages:a5 beforeStages:a6];
}

@end