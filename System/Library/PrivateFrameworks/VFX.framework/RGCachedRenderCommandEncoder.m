@interface RGCachedRenderCommandEncoder
- (BOOL)deferredBindingEnabled;
- (BOOL)isCullModeLocked;
- (BOOL)isFillModeLocked;
- (MTLDevice)device;
- (NSString)label;
- (RGCachedRenderCommandEncoder)init;
- (RGCachedRenderCommandEncoder)initWithEncoder:(id)a3;
- (id).cxx_construct;
- (id)fragmentBufferBoundAt:(unint64_t)a3;
- (id)vertexBufferBoundAt:(unint64_t)a3;
- (unint64_t)frontFacingWinding;
- (unint64_t)tileHeight;
- (unint64_t)tileWidth;
- (void)applyChangedStates;
- (void)clear;
- (void)dealloc;
- (void)dispatchThreadsPerTile:(id *)a3;
- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9;
- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8;
- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6;
- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7;
- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9;
- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7;
- (void)endEncoding;
- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)insertDebugSignpost:(id)a3;
- (void)loadWithCommandBuffer:(id)a3 renderPassDescriptor:(id)a4;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6;
- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)rg_setLineWidth:(float)a3;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setCounters:(__RGRenderCounters *)a3;
- (void)setCullMode:(unint64_t)a3;
- (void)setDeferredBindingEnabled:(BOOL)a3;
- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5;
- (void)setDepthClipMode:(unint64_t)a3;
- (void)setDepthStencilState:(id)a3;
- (void)setDepthStoreAction:(unint64_t)a3;
- (void)setDepthStoreActionOptions:(unint64_t)a3;
- (void)setEncoder:(id)a3;
- (void)setEncoder:(id)a3 alreadyUsed:(BOOL)a4;
- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6;
- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setFrontFacingWinding:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setLockCullMode:(BOOL)a3;
- (void)setLockFillMode:(BOOL)a3;
- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setRenderPipelineState:(id)a3;
- (void)setScissorRect:(id *)a3;
- (void)setScissorRects:(id *)a3 count:(unint64_t)a4;
- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4;
- (void)setStencilReferenceValue:(unsigned int)a3;
- (void)setStencilStoreAction:(unint64_t)a3;
- (void)setStencilStoreActionOptions:(unint64_t)a3;
- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5;
- (void)setTessellationFactorScale:(float)a3;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setTriangleFillMode:(unint64_t)a3;
- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6;
- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setViewport:(id *)a3;
- (void)setViewports:(id *)a3 count:(unint64_t)a4;
- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4;
- (void)updateFence:(id)a3 afterStages:(unint64_t)a4;
- (void)useHeap:(id)a3;
- (void)useHeap:(id)a3 stages:(unint64_t)a4;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6;
- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4;
@end

@implementation RGCachedRenderCommandEncoder

- (RGCachedRenderCommandEncoder)init
{
  v3.receiver = self;
  v3.super_class = (Class)RGCachedRenderCommandEncoder;
  return [(RGCachedRenderCommandEncoder *)&v3 init];
}

- (RGCachedRenderCommandEncoder)initWithEncoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RGCachedRenderCommandEncoder;
  v4 = [(RGCachedRenderCommandEncoder *)&v7 init];
  objc_msgSend_setEncoder_alreadyUsed_(v4, v5, (uint64_t)a3, 0);
  return v4;
}

- (void)dealloc
{
  objc_msgSend_setEncoder_(self, a2, 0, v2);
  v4.receiver = self;
  v4.super_class = (Class)RGCachedRenderCommandEncoder;
  [(RGCachedRenderCommandEncoder *)&v4 dealloc];
}

- (void)setCounters:(__RGRenderCounters *)a3
{
  long long v3 = *(_OWORD *)&a3->storage.impl;
  *(void *)&self->_counters.primitiveCount = *(void *)&a3->primitiveCount;
  *(_OWORD *)&self->_counters.storage.impl = v3;
}

- (void)loadWithCommandBuffer:(id)a3 renderPassDescriptor:(id)a4
{
  uint64_t v6 = objc_msgSend_renderCommandEncoderWithDescriptor_(a3, a2, (uint64_t)a4, (uint64_t)a4);

  objc_msgSend_setEncoder_alreadyUsed_(self, v5, v6, 0);
}

- (BOOL)deferredBindingEnabled
{
  return (uint64_t)self[22].super.isa & 1;
}

- (void)setDeferredBindingEnabled:(BOOL)a3
{
  LOWORD(self[22].super.isa) = (uint64_t)self[22].super.isa & 0xFFFE | a3;
}

- (void)setEncoder:(id)a3
{
}

- (void)setEncoder:(id)a3 alreadyUsed:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  encoder = self->_encoder;
  if (encoder) {

  }
  self->_encoder = (MTLRenderCommandEncoder *)a3;
  objc_msgSend_clear(self, v8, v9, v10);
  if (self->_encoder) {
    BOOL v12 = !v4;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12) {
    LOWORD(self[22].super.isa) |= 0x9Eu;
  }
}

- (void)clear
{
  p_cache = &self->_cache;
  sub_1B6388108((uint64_t)&self->_cache);

  bzero(p_cache, 0x1060uLL);
}

- (id)vertexBufferBoundAt:(unint64_t)a3
{
  return (id)*((void *)&self[4]._cache.blendStates + 2 * a3);
}

- (id)fragmentBufferBoundAt:(unint64_t)a3
{
  return (id)*((void *)&self[13]._cache.rasterizerStates + 2 * a3);
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_msgSend_device(self->_encoder, a2, v2, v3);
}

- (NSString)label
{
  return (NSString *)((uint64_t (*)(MTLRenderCommandEncoder *, char *))MEMORY[0x1F4181798])(self->_encoder, sel_label);
}

- (void)setLabel:(id)a3
{
  objc_msgSend_setLabel_(self->_encoder, a2, (uint64_t)a3, v3);
}

- (unint64_t)tileWidth
{
  return ((uint64_t (*)(MTLRenderCommandEncoder *, char *))MEMORY[0x1F4181798])(self->_encoder, sel_tileWidth);
}

- (unint64_t)tileHeight
{
  return ((uint64_t (*)(MTLRenderCommandEncoder *, char *))MEMORY[0x1F4181798])(self->_encoder, sel_tileHeight);
}

- (void)endEncoding
{
  objc_msgSend_endEncoding(self->_encoder, a2, v2, v3);
}

- (void)insertDebugSignpost:(id)a3
{
}

- (void)popDebugGroup
{
  objc_msgSend_popDebugGroup(self->_encoder, a2, v2, v3);
}

- (void)pushDebugGroup:(id)a3
{
  objc_msgSend_pushDebugGroup_(self->_encoder, a2, (uint64_t)a3, v3);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  unint64_t v10 = a4;
  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  objc_msgSend_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_(self->_encoder, v13, a3, v10, a5, a6, a7);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    v15 = self->_counters.storage.impl;
    unsigned int primitiveCount = self->_counters.primitiveCount;
    switch(a3)
    {
      case 0uLL:
        break;
      case 1uLL:
        v10 >>= 1;
        break;
      case 2uLL:
        --v10;
        break;
      case 3uLL:
        v10 /= 3uLL;
        break;
      case 4uLL:
        v10 -= 2;
        break;
      default:
        unint64_t v10 = 0;
        break;
    }
    vfx_counters_update((uint64_t)v15, primitiveCount, (double)v10);
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  unint64_t v12 = a4;
  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  objc_msgSend_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_(self->_encoder, v15, a3, v12, a5, a6, a7, a8);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    v17 = self->_counters.storage.impl;
    unsigned int primitiveCount = self->_counters.primitiveCount;
    switch(a3)
    {
      case 0uLL:
        break;
      case 1uLL:
        v12 >>= 1;
        break;
      case 2uLL:
        --v12;
        break;
      case 3uLL:
        v12 /= 3uLL;
        break;
      case 4uLL:
        v12 -= 2;
        break;
      default:
        unint64_t v12 = 0;
        break;
    }
    vfx_counters_update((uint64_t)v17, primitiveCount, (double)(v12 * a8));
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  unint64_t v14 = a4;
  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  if (v14)
  {
    encoder = self->_encoder;
    if (a9 <= 0 && a10 == 0) {
      objc_msgSend_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_(encoder, v17, a3, v14, a5, a6, a7, a8);
    }
    else {
      objc_msgSend_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_(encoder, v17, a3, v14, a5, a6, a7, a8, a9, a10);
    }
  }
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    v21 = self->_counters.storage.impl;
    unsigned int primitiveCount = self->_counters.primitiveCount;
    switch(a3)
    {
      case 0uLL:
        break;
      case 1uLL:
        v14 >>= 1;
        break;
      case 2uLL:
        --v14;
        break;
      case 3uLL:
        v14 /= 3uLL;
        break;
      case 4uLL:
        v14 -= 2;
        break;
      default:
        unint64_t v14 = 0;
        break;
    }
    vfx_counters_update((uint64_t)v21, primitiveCount, (double)(v14 * a8));
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  objc_msgSend_drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_(self->_encoder, v15, a3, a4, a5, a6, a7, a8);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    v17 = self->_counters.storage.impl;
    unsigned int indirectDrawCount = self->_counters.indirectDrawCount;
    vfx_counters_update((uint64_t)v17, indirectDrawCount, 1.0);
  }
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  objc_msgSend_applyChangedStates(self, a2, a3, (uint64_t)a4);
  objc_msgSend_drawPrimitives_indirectBuffer_indirectBufferOffset_(self->_encoder, v9, a3, (uint64_t)a4, a5);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    v11 = self->_counters.storage.impl;
    unsigned int indirectDrawCount = self->_counters.indirectDrawCount;
    vfx_counters_update((uint64_t)v11, indirectDrawCount, 1.0);
  }
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  objc_msgSend_drawPrimitives_vertexStart_vertexCount_(self->_encoder, v9, a3, a4, a5);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    v11 = self->_counters.storage.impl;
    unsigned int primitiveCount = self->_counters.primitiveCount;
    switch(a3)
    {
      case 0uLL:
        break;
      case 1uLL:
        a5 >>= 1;
        break;
      case 2uLL:
        --a5;
        break;
      case 3uLL:
        a5 /= 3uLL;
        break;
      case 4uLL:
        a5 -= 2;
        break;
      default:
        a5 = 0;
        break;
    }
    vfx_counters_update((uint64_t)v11, primitiveCount, (double)a5);
  }
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  objc_msgSend_drawPrimitives_vertexStart_vertexCount_instanceCount_(self->_encoder, v11, a3, a4, a5, a6);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    v13 = self->_counters.storage.impl;
    unsigned int primitiveCount = self->_counters.primitiveCount;
    switch(a3)
    {
      case 0uLL:
        break;
      case 1uLL:
        a5 >>= 1;
        break;
      case 2uLL:
        --a5;
        break;
      case 3uLL:
        a5 /= 3uLL;
        break;
      case 4uLL:
        a5 -= 2;
        break;
      default:
        a5 = 0;
        break;
    }
    vfx_counters_update((uint64_t)v13, primitiveCount, (double)(a5 * a6));
  }
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  encoder = self->_encoder;
  if (a7) {
    objc_msgSend_drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_(encoder, v13, a3, a4, a5, a6, a7);
  }
  else {
    objc_msgSend_drawPrimitives_vertexStart_vertexCount_instanceCount_(encoder, v13, a3, a4, a5, a6);
  }
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    v16 = self->_counters.storage.impl;
    unsigned int primitiveCount = self->_counters.primitiveCount;
    switch(a3)
    {
      case 0uLL:
        break;
      case 1uLL:
        a5 >>= 1;
        break;
      case 2uLL:
        --a5;
        break;
      case 3uLL:
        a5 /= 3uLL;
        break;
      case 4uLL:
        a5 -= 2;
        break;
      default:
        a5 = 0;
        break;
    }
    vfx_counters_update((uint64_t)v16, primitiveCount, (double)(a5 * a6));
  }
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  objc_msgSend_applyChangedStates(self, a2, a3, (uint64_t)a4);
  objc_msgSend_drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset_(self->_encoder, v16, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    v18 = self->_counters.storage.impl;
    unsigned int indirectDrawCount = self->_counters.indirectDrawCount;
    vfx_counters_update((uint64_t)v18, indirectDrawCount, 1.0);
  }
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  objc_msgSend_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_(self->_encoder, v18, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    unsigned int drawCount = self->_counters.drawCount;
    vfx_counters_update((uint64_t)impl, drawCount, 1.0);
  }
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  objc_msgSend_applyChangedStates(self, a2, (uint64_t)a3, (uint64_t)a4);
  encoder = self->_encoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v14 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *a5;
  objc_msgSend_drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_(encoder, v10, (uint64_t)&v14, (uint64_t)&v13, &v12);
  impl = self->_counters.storage.impl;
  if (impl) {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
  }
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
{
  objc_msgSend_applyChangedStates(self, a2, (uint64_t)a3, a4);
  encoder = self->_encoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v15 = *a5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v14 = *a6;
  objc_msgSend_drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_(encoder, v12, (uint64_t)a3, a4, &v15, &v14);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    vfx_counters_update((uint64_t)self->_counters.storage.impl, self->_counters.indirectDrawCount, 1.0);
  }
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  objc_msgSend_applyChangedStates(self, a2, (uint64_t)a3, (uint64_t)a4);
  encoder = self->_encoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v14 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *a5;
  objc_msgSend_drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_(encoder, v10, (uint64_t)&v14, (uint64_t)&v13, &v12);
  impl = self->_counters.storage.impl;
  if (impl) {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
  }
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  objc_msgSend_applyChangedStates(self, a2, a3, (uint64_t)a4);
  objc_msgSend_drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset_(self->_encoder, v13, a3, (uint64_t)a4, a5, a6, a7);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    vfx_counters_update((uint64_t)impl, self->_counters.drawCount, 1.0);
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v15 = self->_counters.storage.impl;
    unsigned int indirectDrawCount = self->_counters.indirectDrawCount;
    vfx_counters_update((uint64_t)v15, indirectDrawCount, 1.0);
  }
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  objc_msgSend_applyChangedStates(self, a2, a3, a4);
  objc_msgSend_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_(self->_encoder, v16, a3, a4, a5, a6, a7, a8, a9);
  impl = self->_counters.storage.impl;
  if (impl)
  {
    unsigned int drawCount = self->_counters.drawCount;
    vfx_counters_update((uint64_t)impl, drawCount, 1.0);
  }
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  v8.f32[0] = a3;
  v8.f32[1] = a4;
  v8.i64[1] = __PAIR64__(LODWORD(a6), LODWORD(a5));
  if ((vmaxvq_u32((uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_cache.material, v8))) & 0x80000000) != 0)
  {
    *(float32x4_t *)&self->_cache.material = v8;
    objc_msgSend_setBlendColorRed_green_blue_alpha_(self->_encoder, a2, v6, v7);
  }
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setCullMode:(unint64_t)a3
{
  __int16 isa = (__int16)self[22].super.isa;
  if ((isa & 0x20) == 0 && self->_cache.meshElement != (__CFXMeshElement *)a3)
  {
    self->_cache.meshElement = (__CFXMeshElement *)a3;
    LOWORD(self[22].super.isa) = isa | 4;
  }
}

- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5
{
  objc_msgSend_setDepthBias_slopeScale_clamp_(self->_encoder, a2, v5, v6);
}

- (void)setDepthClipMode:(unint64_t)a3
{
  if (self->_cache.program != (__CFXFXProgram *)a3)
  {
    self->_cache.program = (__CFXFXProgram *)a3;
    LOWORD(self[22].super.isa) |= 0x10u;
  }
}

- (void)setDepthStencilState:(id)a3
{
  if (self->_cache.rasterizerStates != a3)
  {
    self->_cache.rasterizerStates = (__CFXRasterizerStates *)a3;
    objc_msgSend_setDepthStencilState_(self->_encoder, a2, (uint64_t)a3, v3);
  }
}

- (void)setDepthStoreAction:(unint64_t)a3
{
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
}

- (unint64_t)frontFacingWinding
{
  return (unint64_t)self->_cache.metalMesh;
}

- (void)setFrontFacingWinding:(unint64_t)a3
{
  if (self->_cache.metalMesh != (VFXMTLMesh *)a3)
  {
    self->_cache.metalMesh = (VFXMTLMesh *)a3;
    LOWORD(self[22].super.isa) |= 2u;
  }
}

- (void)setRenderPipelineState:(id)a3
{
  if (self->_cache.mesh != a3)
  {
    self->_cache.mesh = (__CFXMesh *)a3;
    objc_msgSend_setRenderPipelineState_(self->_encoder, a2, (uint64_t)a3, v3);
  }
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v5 = (char *)self + 16 * a5;
  *((void *)v5 + 113) = 0;
  *((void *)v5 + 112) = 0;
  MEMORY[0x1F4181798](self->_encoder, sel_setVertexBytes_length_atIndex_, a3, a4);
}

- (void)setScissorRect:(id *)a3
{
  encoder = self->_encoder;
  long long v5 = *(_OWORD *)&a3->var2;
  v6[0] = *(_OWORD *)&a3->var0;
  v6[1] = v5;
  objc_msgSend_setScissorRect_(encoder, a2, (uint64_t)v6, v3);
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
}

- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4
{
  if (LODWORD(self->_cache.metalShadable) != a3 || HIDWORD(self->_cache.metalShadable) != a4)
  {
    LODWORD(self->_cache.metalShadable) = a3;
    HIDWORD(self->_cache.metalShadable) = a4;
    MEMORY[0x1F4181798](self->_encoder, sel_setStencilFrontReferenceValue_backReferenceValue_, *(void *)&a3, *(void *)&a4);
  }
}

- (void)setStencilReferenceValue:(unsigned int)a3
{
  if (LODWORD(self->_cache.metalShadable) != a3 || HIDWORD(self->_cache.metalShadable) != a3)
  {
    LODWORD(self->_cache.metalShadable) = a3;
    HIDWORD(self->_cache.metalShadable) = a3;
    ((void (*)(MTLRenderCommandEncoder *, char *, void))MEMORY[0x1F4181798])(self->_encoder, sel_setStencilReferenceValue_, *(void *)&a3);
  }
}

- (void)setStencilStoreAction:(unint64_t)a3
{
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
}

- (void)setTriangleFillMode:(unint64_t)a3
{
  __int16 isa = (__int16)self[22].super.isa;
  if ((isa & 0x40) == 0 && self->_cache.metalMeshElement != (VFXMTLMeshElement *)a3)
  {
    self->_cache.metalMeshElement = (VFXMTLMeshElement *)a3;
    LOWORD(self[22].super.isa) = isa | 8;
  }
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v5 = (id *)(&self[13]._cache.rasterizerStates + 2 * a5);
  if (*v5 == a3)
  {
    id v7 = v5[1];
    uint64_t v6 = (unint64_t *)(v5 + 1);
    if (v7 != (id)a4)
    {
      *uint64_t v6 = a4;
      MEMORY[0x1F4181798](self->_encoder, sel_setFragmentBufferOffset_atIndex_, a4, a5);
    }
  }
  else
  {
    id *v5 = a3;
    v5[1] = (id)a4;
    objc_msgSend_setFragmentBuffer_offset_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
  }
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  BOOL v4 = (char *)self + 16 * a4;
  if (*((void *)v4 + 319) != a3)
  {
    *((void *)v4 + 319) = a3;
    MEMORY[0x1F4181798](self->_encoder, sel_setFragmentBufferOffset_atIndex_, a3, a4);
  }
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  if (a5.length)
  {
    long long v5 = &self[13]._cache.mesh + 2 * a5.location;
    uint64_t v6 = a3;
    id v7 = a4;
    NSUInteger length = a5.length;
    do
    {
      unint64_t v10 = (__CFXMesh *)*v6++;
      uint64_t v9 = v10;
      v11 = (__CFXMesh *)*v7++;
      *(v5 - 1) = v9;
      id *v5 = v11;
      v5 += 2;
      --length;
    }
    while (length);
  }
  MEMORY[0x1F4181798](self->_encoder, sel_setFragmentBuffers_offsets_withRange_, a3, a4);
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v5 = (char *)self + 16 * a5;
  *((void *)v5 + 319) = 0;
  *((void *)v5 + 318) = 0;
  objc_msgSend_setFragmentBytes_length_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  if (*((id *)&self[21]._counters.primitiveCount + a4) != a3)
  {
    *((void *)&self[21]._counters.primitiveCount + a4) = a3;
    objc_msgSend_setFragmentSamplerState_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
  }
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  *((void *)&self[21]._counters.primitiveCount + a6) = a3;
  MEMORY[0x1F4181798](self->_encoder, sel_setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_, a3, a6);
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  if (a6.length)
  {
    uint64_t v6 = &self[21]._counters.primitiveCount + 2 * a6.location;
    id v7 = a3;
    NSUInteger length = a6.length;
    do
    {
      uint64_t v9 = (uint64_t)*v7++;
      *(void *)uint64_t v6 = v9;
      v6 += 2;
      --length;
    }
    while (length);
  }
  MEMORY[0x1F4181798](self->_encoder, sel_setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_, a3, a4);
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    BOOL v4 = &self[21]._counters.primitiveCount + 2 * a4.location;
    long long v5 = a3;
    NSUInteger length = a4.length;
    do
    {
      uint64_t v7 = (uint64_t)*v5++;
      *(void *)BOOL v4 = v7;
      v4 += 2;
      --length;
    }
    while (length);
  }
  MEMORY[0x1F4181798](self->_encoder, sel_setFragmentSamplerStates_withRange_, a3, a4.location);
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  if (*((id *)&self[15]._cache.deformers + a4) != a3)
  {
    *((void *)&self[15]._cache.deformers + a4) = a3;
    __int16 isa = (__int16)self[22].super.isa;
    if (isa)
    {
      LOWORD(self[22].super.isa) = isa | 0x100;
      *((void *)&self[21]._cache.tessellationPipelineStateHash + (a4 >> 6)) |= 1 << a4;
    }
    else
    {
      objc_msgSend_setFragmentTexture_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
    }
  }
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    BOOL v4 = &self[15]._cache.deformers + a4.location;
    long long v5 = a3;
    NSUInteger length = a4.length;
    do
    {
      uint64_t v7 = (__CFXDeformerStack *)*v5++;
      *v4++ = v7;
      --length;
    }
    while (length);
  }
  objc_msgSend_setFragmentTextures_withRange_(self->_encoder, a2, (uint64_t)a3, a4.location);
}

- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6
{
  if (*((id *)&self[15]._cache.deformers + a4) != a3 || *((id *)&self[21]._counters.primitiveCount + a6) != a5)
  {
    *((void *)&self[15]._cache.deformers + a4) = a3;
    *((void *)&self[21]._counters.primitiveCount + a6) = a5;
    objc_msgSend_setFragmentTexture_atTextureIndex_samplerState_atSamplerIndex_(self->_encoder, a2, (uint64_t)a3, a4);
  }
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  long long v5 = (id *)(&self[4]._cache.blendStates + 2 * a5);
  if (*v5 == a3)
  {
    id v7 = v5[1];
    uint64_t v6 = (unint64_t *)(v5 + 1);
    if (v7 != (id)a4)
    {
      *uint64_t v6 = a4;
      objc_msgSend_setVertexBufferOffset_atIndex_(self->_encoder, a2, a4, a5);
    }
  }
  else
  {
    id *v5 = a3;
    v5[1] = (id)a4;
    objc_msgSend_setVertexBuffer_offset_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
  }
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  BOOL v4 = (char *)self + 16 * a4;
  if (*((void *)v4 + 113) != a3)
  {
    *((void *)v4 + 113) = a3;
    objc_msgSend_setVertexBufferOffset_atIndex_(self->_encoder, a2, a3, a4);
  }
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  if (a5.length)
  {
    NSUInteger length = a5.length;
    NSUInteger location = a5.location;
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    for (i = (unint64_t *)(&self[4]._cache.colorBufferWriteMask + 16 * a5.location); ; i += 2)
    {
      NSUInteger v13 = location + v11;
      $F99D9A4FB75BC57F3386B8DC8EE08D7A v14 = a3[v11];
      if ((const void *)*(i - 1) != v14) {
        break;
      }
      unint64_t v15 = a4[v11];
      if (*i != v15)
      {
        unint64_t *i = v15;
        objc_msgSend_setVertexBufferOffset_atIndex_(self->_encoder, a2, a4[v11], location + v11);
      }
      ++v11;
      v10 -= 8;
      if (length == v11) {
        return;
      }
    }
    NSUInteger v16 = length - v11;
    if (length != v11)
    {
      if (length - 1 == v11)
      {
        unint64_t v17 = a4[v11];
        *(i - 1) = (unint64_t)v14;
        unint64_t *i = v17;
        encoder = self->_encoder;
        v19 = a3[v11];
        uint64_t v20 = a4[v11];
        objc_msgSend_setVertexBuffer_offset_atIndex_(encoder, a2, (uint64_t)v19, v20, v13);
      }
      else
      {
        v21 = &a3[v10 / 0xFFFFFFFFFFFFFFF8];
        v22 = &a4[v10 / 0xFFFFFFFFFFFFFFF8];
        objc_msgSend_setVertexBuffers_offsets_withRange_(self->_encoder, a2, (uint64_t)v21, (uint64_t)v22, v13, length - v11);
        if (length > v11)
        {
          do
          {
            unint64_t v24 = (unint64_t)*v21++;
            unint64_t v23 = v24;
            unint64_t v25 = *v22++;
            *(i - 1) = v23;
            unint64_t *i = v25;
            i += 2;
            --v16;
          }
          while (v16);
        }
      }
    }
  }
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
}

- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  if (*((id *)&self[12]._cache.metalShadable + a4) != a3)
  {
    *((void *)&self[12]._cache.metalShadable + a4) = a3;
    objc_msgSend_setVertexSamplerState_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
  }
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  *((void *)&self[12]._cache.metalShadable + a6) = a3;
  MEMORY[0x1F4181798](self->_encoder, sel_setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_, a3, a6);
}

- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  if (a6.length)
  {
    uint64_t v6 = &self[12]._cache.metalShadable + a6.location;
    id v7 = a3;
    NSUInteger length = a6.length;
    do
    {
      uint64_t v9 = (VFXMTLShadable *)*v7++;
      *v6++ = v9;
      --length;
    }
    while (length);
  }
  MEMORY[0x1F4181798](self->_encoder, sel_setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_, a3, a4);
}

- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    BOOL v4 = &self[12]._cache.metalShadable + a4.location;
    long long v5 = a3;
    NSUInteger length = a4.length;
    do
    {
      id v7 = (VFXMTLShadable *)*v5++;
      *v4++ = v7;
      --length;
    }
    while (length);
  }
  MEMORY[0x1F4181798](self->_encoder, sel_setVertexSamplerStates_withRange_, a3, a4.location);
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  if (*((id *)&self[7]._cache.rasterizerStates + a4) != a3)
  {
    *((void *)&self[7]._cache.rasterizerStates + a4) = a3;
    __int16 isa = (__int16)self[22].super.isa;
    if (isa)
    {
      LOWORD(self[22].super.isa) = isa | 0x100;
      *((void *)&self[21]._cache.deformers + (a4 >> 6)) |= 1 << a4;
    }
    else
    {
      objc_msgSend_setVertexTexture_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
    }
  }
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    BOOL v4 = &self[7]._cache.rasterizerStates + a4.location;
    long long v5 = a3;
    NSUInteger length = a4.length;
    do
    {
      id v7 = (__CFXRasterizerStates *)*v5++;
      *v4++ = v7;
      --length;
    }
    while (length);
  }
  objc_msgSend_setVertexTextures_withRange_(self->_encoder, a2, (uint64_t)a3, a4.location);
}

- (void)setViewport:(id *)a3
{
  if (self[4]._cache.commonProfile != (__CFXCommonProfile *)1 || memcmp(&self->_cache.commonProfile, a3, 0x30uLL))
  {
    long long v5 = *(_OWORD *)&a3->var0;
    long long v6 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&self->_cache.pointOfView = *(_OWORD *)&a3->var4;
    *(_OWORD *)&self->_cache.colorBufferWriteMask = v6;
    *(_OWORD *)&self->_cache.commonProfile = v5;
    self[4]._cache.commonProfile = (__CFXCommonProfile *)1;
    LOWORD(self[22].super.isa) |= 0x80u;
  }
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  if (self[4]._cache.commonProfile != (__CFXCommonProfile *)a4)
  {
    size_t v7 = 48 * a4;
    goto LABEL_5;
  }
  size_t v7 = 48 * a4;
  if (memcmp(&self->_cache.commonProfile, a3, 48 * a4))
  {
LABEL_5:
    memcpy(&self->_cache.commonProfile, a3, v7);
    self[4]._cache.commonProfile = (__CFXCommonProfile *)a4;
    LOWORD(self[22].super.isa) |= 0x80u;
  }
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
}

- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6
{
}

- (void)dispatchThreadsPerTile:(id *)a3
{
  objc_msgSend_applyChangedStates(self, a2, (uint64_t)a3, v3);
  encoder = self->_encoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9 = *a3;
  objc_msgSend_dispatchThreadsPerTile_(encoder, v7, (uint64_t)&v9, v8);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6
{
}

- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5
{
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
}

- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
}

- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
}

- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
}

- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
}

- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
}

- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5
{
}

- (void)setTessellationFactorScale:(float)a3
{
  objc_msgSend_setTessellationFactorScale_(self->_encoder, a2, v3, v4);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
}

- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
}

- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4
{
}

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
{
}

- (void)useHeap:(id)a3
{
  objc_msgSend_useHeap_(self->_encoder, a2, (uint64_t)a3, v3);
}

- (void)useHeap:(id)a3 stages:(unint64_t)a4
{
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5
{
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
{
}

- (void)applyChangedStates
{
  __int16 isa = (__int16)self[22].super.isa;
  if ((isa & 2) != 0)
  {
    LOWORD(self[22].super.isa) = isa & 0xFFFD;
    objc_msgSend_setFrontFacingWinding_(self->_encoder, a2, (uint64_t)self->_cache.metalMesh, v2);
    __int16 isa = (__int16)self[22].super.isa;
    if ((isa & 8) == 0)
    {
LABEL_3:
      if ((isa & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((isa & 8) == 0)
  {
    goto LABEL_3;
  }
  LOWORD(self[22].super.isa) = isa & 0xFFF7;
  objc_msgSend_setTriangleFillMode_(self->_encoder, a2, (uint64_t)self->_cache.metalMeshElement, v2);
  __int16 isa = (__int16)self[22].super.isa;
  if ((isa & 4) == 0)
  {
LABEL_4:
    if ((isa & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  LOWORD(self[22].super.isa) = isa & 0xFFFB;
  objc_msgSend_setCullMode_(self->_encoder, a2, (uint64_t)self->_cache.meshElement, v2);
  __int16 isa = (__int16)self[22].super.isa;
  if ((isa & 0x10) == 0)
  {
LABEL_5:
    if ((isa & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
LABEL_10:
  LOWORD(self[22].super.isa) = isa & 0xFFEF;
  objc_msgSend_setDepthClipMode_(self->_encoder, a2, (uint64_t)self->_cache.program, v2);
  __int16 isa = (__int16)self[22].super.isa;
  if ((isa & 0x80) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  commonProfile = self[4]._cache.commonProfile;
  if (commonProfile)
  {
    LOWORD(self[22].super.isa) = isa & 0xFF7F;
    objc_msgSend_setViewports_count_(self->_encoder, a2, (uint64_t)&self->_cache.commonProfile, (uint64_t)commonProfile);
    __int16 isa = (__int16)self[22].super.isa;
  }
LABEL_13:
  if (isa)
  {
    encoder = self->_encoder;
    sub_1B6DAB7C8((uint64_t)&self->_cache, encoder);
  }
}

- (void)rg_setLineWidth:(float)a3
{
}

- (void)setLockCullMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self[22].super.isa) = (uint64_t)self[22].super.isa & 0xFFDF | v3;
}

- (BOOL)isCullModeLocked
{
  return (LOWORD(self[22].super.isa) >> 5) & 1;
}

- (void)setLockFillMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self[22].super.isa) = (uint64_t)self[22].super.isa & 0xFFBF | v3;
}

- (BOOL)isFillModeLocked
{
  return (LOWORD(self[22].super.isa) >> 6) & 1;
}

- (id).cxx_construct
{
  *((_OWORD *)self + 86) = 0u;
  *((_OWORD *)self + 85) = 0u;
  *((_OWORD *)self + 84) = 0u;
  *((_OWORD *)self + 83) = 0u;
  *((_OWORD *)self + 82) = 0u;
  *((_OWORD *)self + 81) = 0u;
  *((_OWORD *)self + 80) = 0u;
  *((_OWORD *)self + 79) = 0u;
  *((_OWORD *)self + 78) = 0u;
  *((_OWORD *)self + 77) = 0u;
  *((_OWORD *)self + 76) = 0u;
  *((_OWORD *)self + 75) = 0u;
  *((_OWORD *)self + 74) = 0u;
  *((_OWORD *)self + 73) = 0u;
  *((_OWORD *)self + 72) = 0u;
  *((_OWORD *)self + 71) = 0u;
  *((_OWORD *)self + 70) = 0u;
  *((_OWORD *)self + 69) = 0u;
  *((_OWORD *)self + 68) = 0u;
  *((_OWORD *)self + 67) = 0u;
  *((_OWORD *)self + 66) = 0u;
  *((_OWORD *)self + 65) = 0u;
  *((_OWORD *)self + 63) = 0u;
  *((_OWORD *)self + 64) = 0u;
  *((_OWORD *)self + 61) = 0u;
  *((_OWORD *)self + 62) = 0u;
  *((_OWORD *)self + 59) = 0u;
  *((_OWORD *)self + 60) = 0u;
  *((_OWORD *)self + 57) = 0u;
  *((_OWORD *)self + 58) = 0u;
  *((_OWORD *)self + 56) = 0u;
  *((_OWORD *)self + 189) = 0u;
  *((_OWORD *)self + 188) = 0u;
  *((_OWORD *)self + 187) = 0u;
  *((_OWORD *)self + 186) = 0u;
  *((_OWORD *)self + 185) = 0u;
  *((_OWORD *)self + 184) = 0u;
  *((_OWORD *)self + 183) = 0u;
  *((_OWORD *)self + 182) = 0u;
  *((_OWORD *)self + 181) = 0u;
  *((_OWORD *)self + 180) = 0u;
  *((_OWORD *)self + 179) = 0u;
  *((_OWORD *)self + 178) = 0u;
  *((_OWORD *)self + 177) = 0u;
  *((_OWORD *)self + 176) = 0u;
  *((_OWORD *)self + 175) = 0u;
  *((_OWORD *)self + 174) = 0u;
  *((_OWORD *)self + 173) = 0u;
  *((_OWORD *)self + 172) = 0u;
  *((_OWORD *)self + 171) = 0u;
  *((_OWORD *)self + 170) = 0u;
  *((_OWORD *)self + 169) = 0u;
  *((_OWORD *)self + 168) = 0u;
  *((_OWORD *)self + 167) = 0u;
  *((_OWORD *)self + 166) = 0u;
  *((_OWORD *)self + 165) = 0u;
  *((_OWORD *)self + 164) = 0u;
  *((_OWORD *)self + 163) = 0u;
  *((_OWORD *)self + 162) = 0u;
  *((_OWORD *)self + 161) = 0u;
  *((_OWORD *)self + 160) = 0u;
  *((_OWORD *)self + 159) = 0u;
  return self;
}

@end