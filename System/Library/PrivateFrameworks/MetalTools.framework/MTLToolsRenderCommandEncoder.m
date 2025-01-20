@interface MTLToolsRenderCommandEncoder
- (BOOL)isMemorylessRender;
- (MTLToolsRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4;
- (MTLToolsRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5;
- (id)endEncodingAndRetrieveProgramAddressTable;
- (unint64_t)tileHeight;
- (unint64_t)tileWidth;
- (void)addSplitHandler:(id)a3;
- (void)dispatchThreadsPerTile:(id *)a3;
- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4;
- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int)a5;
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
- (void)enableNullBufferBinds:(BOOL)a3;
- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4 stage:(unint64_t)a5;
- (void)setAlphaTestReferenceValue:(float)a3;
- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6;
- (void)setClipPlane:(float)a3 p2:(float)a4 p3:(float)a5 p4:(float)a6 atIndex:(unint64_t)a7;
- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7;
- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7 yInvert:(BOOL)a8;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setCommandDataCorruptModeSPI:(unint64_t)a3;
- (void)setCullMode:(unint64_t)a3;
- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5;
- (void)setDepthCleared;
- (void)setDepthClipMode:(unint64_t)a3;
- (void)setDepthClipModeSPI:(unint64_t)a3;
- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6;
- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7;
- (void)setDepthStencilState:(id)a3;
- (void)setDepthStoreAction:(unint64_t)a3;
- (void)setDepthStoreActionOptions:(unint64_t)a3;
- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7;
- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6;
- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setFrontFacingWinding:(unint64_t)a3;
- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4 stage:(unint64_t)a5;
- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4 stage:(unint64_t)a5;
- (void)setLineWidth:(float)a3;
- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setPointSize:(float)a3;
- (void)setPrimitiveRestartEnabled:(BOOL)a3;
- (void)setPrimitiveRestartEnabled:(BOOL)a3 index:(unint64_t)a4;
- (void)setProvokingVertexMode:(unint64_t)a3;
- (void)setRenderPipelineState:(id)a3;
- (void)setScissorRect:(id *)a3;
- (void)setScissorRects:(id *)a3 count:(unint64_t)a4;
- (void)setStencilCleared;
- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4;
- (void)setStencilReferenceValue:(unsigned int)a3;
- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6;
- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7;
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
- (void)setTransformFeedbackState:(unint64_t)a3;
- (void)setTriangleFillMode:(unint64_t)a3;
- (void)setTriangleFrontFillMode:(unint64_t)a3 backFillMode:(unint64_t)a4;
- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
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
- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7;
- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setViewport:(id *)a3;
- (void)setViewportTransformEnabled:(BOOL)a3;
- (void)setViewports:(id *)a3 count:(unint64_t)a4;
- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4 stage:(unint64_t)a5;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4 stage:(unint64_t)a5;
- (void)updateFence:(id)a3 afterStages:(unint64_t)a4;
- (void)useHeap:(id)a3;
- (void)useHeap:(id)a3 stages:(unint64_t)a4;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useRenderPipelineState:(id)a3;
- (void)useRenderPipelineStates:(const void *)a3 count:(unint64_t)a4;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResourceGroup:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6;
- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4;
@end

@implementation MTLToolsRenderCommandEncoder

- (MTLToolsRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTLToolsRenderCommandEncoder;
  return [(MTLToolsCommandEncoder *)&v5 initWithBaseObject:a3 parallelRenderCommandEncoder:a4];
}

- (MTLToolsRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MTLToolsRenderCommandEncoder;
  v7 = -[MTLToolsCommandEncoder initWithBaseObject:parent:](&v9, sel_initWithBaseObject_parent_, a3);
  if (v7) {
    [a4 retainObjectsFromRenderPassDescriptor:a5];
  }
  return v7;
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v11 = a3;
  *(float *)&double v12 = a4;
  *(float *)&double v13 = a5;
  *(float *)&double v14 = a6;

  [v10 setBlendColorRed:v11 green:v12 blue:v13 alpha:v14];
}

- (void)setRenderPipelineState:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 setRenderPipelineState:v6];
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 setVertexBytes:a3 length:a4 atIndex:a5];
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setVertexBufferOffset:a3 atIndex:a4];
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];

  [v9 setVertexBuffer:v10 offset:a4 atIndex:a5];
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];

  [v11 setVertexBuffer:v12 offset:a4 attributeStride:a5 atIndex:a6];
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a6.length)
  {
    id v11 = a3;
    uint64_t v12 = v15;
    NSUInteger v13 = a6.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v11];
      double v14 = (void *)*v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }
    while (v13);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setVertexBuffers:offsets:attributeStrides:withRange:", v15, a4, a5, location, length);
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 setVertexBufferOffset:a3 attributeStride:a4 atIndex:a5];
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];

  [v10 setVertexBytes:a3 length:a4 attributeStride:a5 atIndex:a6];
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];

  objc_msgSend(v8, "executeCommandsInBuffer:withRange:", v9, location, length);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];
  uint64_t v11 = [a4 baseObject];

  [v9 executeCommandsInBuffer:v10 indirectBuffer:v11 indirectBufferOffset:a5];
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a5.length)
  {
    id v9 = a3;
    uint64_t v10 = v13;
    NSUInteger v11 = a5.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v9];
      uint64_t v12 = (void *)*v9++;
      *v10++ = [v12 baseObject];
      --v11;
    }
    while (v11);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setVertexBuffers:offsets:withRange:", v13, a4, location, length);
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 setVertexTexture:v8 atIndex:a4];
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a4.length)
  {
    id v7 = a3;
    uint64_t v8 = v11;
    NSUInteger v9 = a4.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v7];
      uint64_t v10 = (void *)*v7++;
      *v8++ = [v10 baseObject];
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setVertexTextures:withRange:", v11, location, length);
}

- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 setVertexSamplerState:v8 atIndex:a4];
}

- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a4.length)
  {
    id v7 = a3;
    uint64_t v8 = v11;
    NSUInteger v9 = a4.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v7];
      uint64_t v10 = (void *)*v7++;
      *v8++ = [v10 baseObject];
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setVertexSamplerStates:withRange:", v11, location, length);
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];
  *(float *)&double v13 = a4;
  *(float *)&double v14 = a5;

  [v11 setVertexSamplerState:v12 lodMinClamp:a6 lodMaxClamp:v13 atIndex:v14];
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7
{
  id v12 = [(MTLToolsObject *)self baseObject];
  uint64_t v13 = [a3 baseObject];
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  *(float *)&double v16 = a6;

  [v12 setVertexSamplerState:v13 lodMinClamp:a7 lodMaxClamp:v14 lodBias:v15 atIndex:v16];
}

- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a6.length)
  {
    id v11 = a3;
    id v12 = v15;
    NSUInteger v13 = a6.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v11];
      double v14 = (void *)*v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }
    while (v13);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v15, a4, a5, location, length);
}

- (void)setViewport:(id *)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  long long v5 = *(_OWORD *)&a3->var2;
  v6[0] = *(_OWORD *)&a3->var0;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->var4;
  [v4 setViewport:v6];
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setViewports:a3 count:a4];
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setScissorRects:a3 count:a4];
}

- (void)setFrontFacingWinding:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setFrontFacingWinding:a3];
}

- (void)setCullMode:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setCullMode:a3];
}

- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v9 = a3;
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;

  [v8 setDepthBias:v9 slopeScale:v10 clamp:v11];
}

- (void)setScissorRect:(id *)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  long long v5 = *(_OWORD *)&a3->var2;
  v6[0] = *(_OWORD *)&a3->var0;
  v6[1] = v5;
  [v4 setScissorRect:v6];
}

- (void)setTriangleFillMode:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setTriangleFillMode:a3];
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

- (void)setDepthClipMode:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setDepthClipModeSPI:a3];
}

- (void)setDepthClipModeSPI:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setDepthClipModeSPI:a3];
}

- (void)setCommandDataCorruptModeSPI:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setCommandDataCorruptModeSPI:a3];
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 setFragmentBytes:a3 length:a4 atIndex:a5];
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setFragmentBufferOffset:a3 atIndex:a4];
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];

  [v9 setFragmentBuffer:v10 offset:a4 atIndex:a5];
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v13[31] = *MEMORY[0x263EF8340];
  if (a5.length)
  {
    id v9 = a3;
    uint64_t v10 = v13;
    NSUInteger v11 = a5.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v9];
      id v12 = (void *)*v9++;
      *v10++ = [v12 baseObject];
      --v11;
    }
    while (v11);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setFragmentBuffers:offsets:withRange:", v13, a4, location, length);
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 setFragmentTexture:v8 atIndex:a4];
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a4.length)
  {
    id v7 = a3;
    uint64_t v8 = v11;
    NSUInteger v9 = a4.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v7];
      uint64_t v10 = (void *)*v7++;
      *v8++ = [v10 baseObject];
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setFragmentTextures:withRange:", v11, location, length);
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 setFragmentSamplerState:v8 atIndex:a4];
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a4.length)
  {
    id v7 = a3;
    uint64_t v8 = v11;
    NSUInteger v9 = a4.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v7];
      uint64_t v10 = (void *)*v7++;
      *v8++ = [v10 baseObject];
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setFragmentSamplerStates:withRange:", v11, location, length);
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];
  *(float *)&double v13 = a4;
  *(float *)&double v14 = a5;

  [v11 setFragmentSamplerState:v12 lodMinClamp:a6 lodMaxClamp:v13 atIndex:v14];
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7
{
  id v12 = [(MTLToolsObject *)self baseObject];
  uint64_t v13 = [a3 baseObject];
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  *(float *)&double v16 = a6;

  [v12 setFragmentSamplerState:v13 lodMinClamp:a7 lodMaxClamp:v14 lodBias:v15 atIndex:v16];
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a6.length)
  {
    id v11 = a3;
    id v12 = v15;
    NSUInteger v13 = a6.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v11];
      double v14 = (void *)*v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }
    while (v13);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v15, a4, a5, location, length);
}

- (void)setDepthStencilState:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 setDepthStencilState:v6];
}

- (void)setStencilReferenceValue:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setStencilReferenceValue:v3];
}

- (void)setDepthCleared
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 setDepthCleared];
}

- (void)setStencilCleared
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 setStencilCleared];
}

- (void)setAlphaTestReferenceValue:(float)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v5 = a3;

  [v4 setAlphaTestReferenceValue:v5];
}

- (void)setPointSize:(float)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v5 = a3;

  [v4 setPointSize:v5];
}

- (void)setClipPlane:(float)a3 p2:(float)a4 p3:(float)a5 p4:(float)a6 atIndex:(unint64_t)a7
{
  id v12 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v13 = a3;
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  *(float *)&double v16 = a6;

  [v12 setClipPlane:a7 p2:v13 p3:v14 p4:v15 atIndex:v16];
}

- (void)setViewportTransformEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setViewportTransformEnabled:v3];
}

- (void)setProvokingVertexMode:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setProvokingVertexMode:a3];
}

- (void)setPrimitiveRestartEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setPrimitiveRestartEnabled:v3];
}

- (void)setPrimitiveRestartEnabled:(BOOL)a3 index:(unint64_t)a4
{
  BOOL v5 = a3;
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setPrimitiveRestartEnabled:v5 index:a4];
}

- (void)setTriangleFrontFillMode:(unint64_t)a3 backFillMode:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setTriangleFrontFillMode:a3 backFillMode:a4];
}

- (void)setTransformFeedbackState:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setTransformFeedbackState:a3];
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v13 = [(MTLToolsObject *)self baseObject];
  uint64_t v14 = [a3 baseObject];

  [v13 setColorResolveTexture:v14 slice:a4 depthPlane:a5 level:a6 atIndex:a7];
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7 yInvert:(BOOL)a8
{
  BOOL v8 = a8;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a3 baseObject];

  [v15 setColorResolveTexture:v16 slice:a4 depthPlane:a5 level:a6 yInvert:v8 atIndex:a7];
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];

  [v11 setDepthResolveTexture:v12 slice:a4 depthPlane:a5 level:a6];
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  BOOL v7 = a7;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v13 = [(MTLToolsObject *)self baseObject];
  uint64_t v14 = [a3 baseObject];

  [v13 setDepthResolveTexture:v14 slice:a4 depthPlane:a5 level:a6 yInvert:v7];
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];

  [v11 setStencilResolveTexture:v12 slice:a4 depthPlane:a5 level:a6];
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  BOOL v7 = a7;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v13 = [(MTLToolsObject *)self baseObject];
  uint64_t v14 = [a3 baseObject];

  [v13 setStencilResolveTexture:v14 slice:a4 depthPlane:a5 level:a6 yInvert:v7];
}

- (BOOL)isMemorylessRender
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isMemorylessRender];
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  long long v7 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  long long v8 = *(_OWORD *)&a4->var0.var2;
  v9[0] = *(_OWORD *)&a4->var0.var0;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&a4->var1.var1;
  long long v10 = v7;
  [v6 dispatchThreadsPerTile:&v10 inRegion:v9];
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = [(MTLToolsObject *)self baseObject];
  long long v9 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  long long v10 = *(_OWORD *)&a4->var0.var2;
  v11[0] = *(_OWORD *)&a4->var0.var0;
  v11[1] = v10;
  v11[2] = *(_OWORD *)&a4->var1.var1;
  long long v12 = v9;
  [v8 dispatchThreadsPerTile:&v12 inRegion:v11 withRenderTargetArrayIndex:v5];
}

- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setStencilFrontReferenceValue:v5 backReferenceValue:v4];
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setColorStoreAction:a3 atIndex:a4];
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setDepthStoreAction:a3];
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setStencilStoreAction:a3];
}

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setColorStoreActionOptions:a3 atIndex:a4];
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setDepthStoreActionOptions:a3];
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setStencilStoreActionOptions:a3];
}

- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setVisibilityResultMode:a3 offset:a4];
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];

  [v10 drawPrimitives:a3 vertexStart:a4 vertexCount:a5 instanceCount:a6];
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 drawPrimitives:a3 vertexStart:a4 vertexCount:a5];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  [(MTLToolsCommandEncoder *)self addRetainedObject:a6];
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a6 baseObject];

  [v15 drawIndexedPrimitives:a3 indexCount:a4 indexType:a5 indexBuffer:v16 indexBufferOffset:a7 instanceCount:a8];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  [(MTLToolsCommandEncoder *)self addRetainedObject:a6];
  id v13 = [(MTLToolsObject *)self baseObject];
  uint64_t v14 = [a6 baseObject];

  [v13 drawIndexedPrimitives:a3 indexCount:a4 indexType:a5 indexBuffer:v14 indexBufferOffset:a7];
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  id v12 = [(MTLToolsObject *)self baseObject];

  [v12 drawPrimitives:a3 vertexStart:a4 vertexCount:a5 instanceCount:a6 baseInstance:a7];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  [(MTLToolsCommandEncoder *)self addRetainedObject:a6];
  id v17 = [(MTLToolsObject *)self baseObject];
  uint64_t v18 = [a6 baseObject];

  objc_msgSend(v17, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", a3, a4, a5, v18, a7, a8);
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  [(MTLToolsCommandEncoder *)self addRetainedObject:a4];
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a4 baseObject];

  [v9 drawPrimitives:a3 indirectBuffer:v10 indirectBufferOffset:a5];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  [(MTLToolsCommandEncoder *)self addRetainedObject:a5];
  [(MTLToolsCommandEncoder *)self addRetainedObject:a7];
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a5 baseObject];
  uint64_t v17 = [a7 baseObject];

  [v15 drawIndexedPrimitives:a3 indexType:a4 indexBuffer:v16 indexBufferOffset:a6 indirectBuffer:v17 indirectBufferOffset:a8];
}

- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];

  [v8 setTessellationFactorBuffer:v9 offset:a4 instanceStride:a5];
}

- (void)setTessellationFactorScale:(float)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v5 = a3;

  [v4 setTessellationFactorScale:v5];
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  [(MTLToolsCommandEncoder *)self addRetainedObject:a6];
  id v16 = [(MTLToolsObject *)self baseObject];
  uint64_t v17 = [a6 baseObject];

  objc_msgSend(v16, "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, v17, a7, a8);
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  [(MTLToolsCommandEncoder *)self addRetainedObject:a4];
  [(MTLToolsCommandEncoder *)self addRetainedObject:a6];
  id v13 = [(MTLToolsObject *)self baseObject];
  uint64_t v14 = [a4 baseObject];
  uint64_t v15 = [a6 baseObject];

  [v13 drawPatches:a3 patchIndexBuffer:v14 patchIndexBufferOffset:a5 indirectBuffer:v15 indirectBufferOffset:a7];
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  [(MTLToolsCommandEncoder *)self addRetainedObject:a6];
  [(MTLToolsCommandEncoder *)self addRetainedObject:a8];
  id v18 = [(MTLToolsObject *)self baseObject];
  uint64_t v19 = [a6 baseObject];
  uint64_t v20 = [a8 baseObject];

  objc_msgSend(v18, "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, v19, a7, v20);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  [(MTLToolsCommandEncoder *)self addRetainedObject:a4];
  [(MTLToolsCommandEncoder *)self addRetainedObject:a6];
  [(MTLToolsCommandEncoder *)self addRetainedObject:a8];
  id v16 = [(MTLToolsObject *)self baseObject];
  uint64_t v17 = [a4 baseObject];
  uint64_t v18 = [a6 baseObject];
  uint64_t v19 = [a8 baseObject];

  objc_msgSend(v16, "drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, v17, a5, v18, a7, v19);
}

- (void)setLineWidth:(float)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v5 = a3;

  [v4 setLineWidth:v5];
}

- (void)addSplitHandler:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 addSplitHandler:a3];
}

- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  [(MTLToolsCommandEncoder *)self addRetainedObject:a5];
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];
  uint64_t v13 = [a5 baseObject];

  [v11 setFragmentTexture:v12 atTextureIndex:a4 samplerState:v13 atSamplerIndex:a6];
}

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 updateFence:v8 afterStages:a4];
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 waitForFence:v8 beforeStages:a4];
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 setTileBytes:a3 length:a4 atIndex:a5];
}

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];

  [v9 setTileBuffer:v10 offset:a4 atIndex:a5];
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setTileBufferOffset:a3 atIndex:a4];
}

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v14[1] = *MEMORY[0x263EF8340];
  id v9 = (char *)v14 - ((8 * a5.length + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5.length)
  {
    uint64_t v10 = a3;
    id v11 = (void *)((char *)v14 - ((8 * a5.length + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v12 = a5.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v10];
      uint64_t v13 = (void *)*v10++;
      *v11++ = [v13 baseObject];
      --v12;
    }
    while (v12);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setTileBuffers:offsets:withRange:", v9, a4, location, length);
}

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 setTileTexture:v8 atIndex:a4];
}

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v12[1] = *MEMORY[0x263EF8340];
  id v7 = (char *)v12 - ((8 * a4.length + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4.length)
  {
    uint64_t v8 = a3;
    id v9 = (void *)((char *)v12 - ((8 * a4.length + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v10 = a4.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v8];
      id v11 = (void *)*v8++;
      *v9++ = [v11 baseObject];
      --v10;
    }
    while (v10);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setTileTextures:withRange:", v7, location, length);
}

- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 setTileSamplerState:v8 atIndex:a4];
}

- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v12[1] = *MEMORY[0x263EF8340];
  id v7 = (char *)v12 - ((8 * a4.length + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4.length)
  {
    uint64_t v8 = a3;
    id v9 = (void *)((char *)v12 - ((8 * a4.length + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v10 = a4.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v8];
      id v11 = (void *)*v8++;
      *v9++ = [v11 baseObject];
      --v10;
    }
    while (v10);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setTileSamplerStates:withRange:", v7, location, length);
}

- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];
  *(float *)&double v13 = a4;
  *(float *)&double v14 = a5;

  [v11 setTileSamplerState:v12 lodMinClamp:a6 lodMaxClamp:v13 atIndex:v14];
}

- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  v16[1] = *MEMORY[0x263EF8340];
  id v11 = (char *)v16 - ((8 * a6.length + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6.length)
  {
    uint64_t v12 = a3;
    double v13 = (void *)((char *)v16 - ((8 * a6.length + 15) & 0xFFFFFFFFFFFFFFF0));
    NSUInteger v14 = a6.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v12];
      uint64_t v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }
    while (v14);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v11, a4, a5, location, length);
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
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 useResource:v8 usage:a4];
}

- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];

  [v9 useResource:v10 usage:a4 stages:a5];
}

- (void)useRenderPipelineState:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  uint64_t v5 = [a3 baseObject];

  [v4 useRenderPipelineState:v5];
}

- (void)useRenderPipelineStates:(const void *)a3 count:(unint64_t)a4
{
  std::vector<objc_object  {objcproto22MTLRenderPipelineState}*>::vector(__p, a4);
  if (a4)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = [(id)a3[v7] baseObject];
      *((void *)__p[0] + v7++) = v8;
    }
    while (a4 != v7);
  }
  id v9 = [(MTLToolsObject *)self baseObject];
  [v9 useRenderPipelineStates:__p[0] count:a4];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
  if (a4)
  {
    uint64_t v9 = 0;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:a3[v9]];
      uint64_t v10 = [(id)a3[v9] baseObject];
      *((void *)__p[0] + v9++) = v10;
    }
    while (a4 != v9);
  }
  id v11 = [(MTLToolsObject *)self baseObject];
  [v11 useResources:__p[0] count:a4 usage:a5];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6
{
  std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
  if (a4)
  {
    uint64_t v11 = 0;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:a3[v11]];
      uint64_t v12 = [(id)a3[v11] baseObject];
      *((void *)__p[0] + v11++) = v12;
    }
    while (a4 != v11);
  }
  id v13 = [(MTLToolsObject *)self baseObject];
  [v13 useResources:__p[0] count:a4 usage:a5 stages:a6];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useHeap:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 useHeap:v6];
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  std::vector<objc_object  {objcproto7MTLHeap}*>::vector(__p, a4);
  if (a4)
  {
    uint64_t v7 = 0;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:a3[v7]];
      uint64_t v8 = [(id)a3[v7] baseObject];
      *((void *)__p[0] + v7++) = v8;
    }
    while (a4 != v7);
  }
  id v9 = [(MTLToolsObject *)self baseObject];
  [v9 useHeaps:__p[0] count:a4];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useHeap:(id)a3 stages:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 useHeap:v8 stages:a4];
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5
{
  std::vector<objc_object  {objcproto7MTLHeap}*>::vector(__p, a4);
  if (a4)
  {
    uint64_t v9 = 0;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:a3[v9]];
      uint64_t v10 = [(id)a3[v9] baseObject];
      *((void *)__p[0] + v9++) = v10;
    }
    while (a4 != v9);
  }
  id v11 = [(MTLToolsObject *)self baseObject];
  [v11 useHeaps:__p[0] count:a4 stages:a5];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (unint64_t)tileWidth
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 tileWidth];
}

- (unint64_t)tileHeight
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 tileHeight];
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  BOOL v5 = a5;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];

  [v9 sampleCountersInBuffer:v10 atSampleIndex:a4 withBarrier:v5];
}

- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 setObjectBytes:a3 length:a4 atIndex:a5];
}

- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setObjectBufferOffset:a3 atIndex:a4];
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];

  [v9 setObjectBuffer:v10 offset:a4 atIndex:a5];
}

- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v13[31] = *MEMORY[0x263EF8340];
  if (a5.length)
  {
    id v9 = a3;
    uint64_t v10 = v13;
    NSUInteger v11 = a5.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v9];
      uint64_t v12 = (void *)*v9++;
      *v10++ = [v12 baseObject];
      --v11;
    }
    while (v11);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setObjectBuffers:offsets:withRange:", v13, a4, location, length);
}

- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 setObjectTexture:v8 atIndex:a4];
}

- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a4.length)
  {
    id v7 = a3;
    uint64_t v8 = v11;
    NSUInteger v9 = a4.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v7];
      uint64_t v10 = (void *)*v7++;
      *v8++ = [v10 baseObject];
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setObjectTextures:withRange:", v11, location, length);
}

- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 setObjectSamplerState:v8 atIndex:a4];
}

- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a4.length)
  {
    id v7 = a3;
    uint64_t v8 = v11;
    NSUInteger v9 = a4.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v7];
      uint64_t v10 = (void *)*v7++;
      *v8++ = [v10 baseObject];
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setObjectSamplerStates:withRange:", v11, location, length);
}

- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];
  *(float *)&double v13 = a4;
  *(float *)&double v14 = a5;

  [v11 setObjectSamplerState:v12 lodMinClamp:a6 lodMaxClamp:v13 atIndex:v14];
}

- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a6.length)
  {
    id v11 = a3;
    uint64_t v12 = v15;
    NSUInteger v13 = a6.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v11];
      double v14 = (void *)*v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }
    while (v13);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v15, a4, a5, location, length);
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setObjectThreadgroupMemoryLength:a3 atIndex:a4];
}

- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 setMeshBytes:a3 length:a4 atIndex:a5];
}

- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setMeshBufferOffset:a3 atIndex:a4];
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];

  [v9 setMeshBuffer:v10 offset:a4 atIndex:a5];
}

- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v13[31] = *MEMORY[0x263EF8340];
  if (a5.length)
  {
    id v9 = a3;
    uint64_t v10 = v13;
    NSUInteger v11 = a5.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v9];
      uint64_t v12 = (void *)*v9++;
      *v10++ = [v12 baseObject];
      --v11;
    }
    while (v11);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setMeshBuffers:offsets:withRange:", v13, a4, location, length);
}

- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 setMeshTexture:v8 atIndex:a4];
}

- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a4.length)
  {
    id v7 = a3;
    uint64_t v8 = v11;
    NSUInteger v9 = a4.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v7];
      uint64_t v10 = (void *)*v7++;
      *v8++ = [v10 baseObject];
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setMeshTextures:withRange:", v11, location, length);
}

- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 setMeshSamplerState:v8 atIndex:a4];
}

- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a4.length)
  {
    id v7 = a3;
    uint64_t v8 = v11;
    NSUInteger v9 = a4.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v7];
      uint64_t v10 = (void *)*v7++;
      *v8++ = [v10 baseObject];
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setMeshSamplerStates:withRange:", v11, location, length);
}

- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];
  *(float *)&double v13 = a4;
  *(float *)&double v14 = a5;

  [v11 setMeshSamplerState:v12 lodMinClamp:a6 lodMaxClamp:v13 atIndex:v14];
}

- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a6.length)
  {
    id v11 = a3;
    uint64_t v12 = v15;
    NSUInteger v13 = a6.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v11];
      double v14 = (void *)*v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }
    while (v13);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v15, a4, a5, location, length);
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9 = *a5;
  [v8 drawMeshThreadgroups:&v11 threadsPerObjectThreadgroup:&v10 threadsPerMeshThreadgroup:&v9];
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v14 = *a5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13 = *a6;
  [v11 drawMeshThreadgroupsWithIndirectBuffer:v12 indirectBufferOffset:a4 threadsPerObjectThreadgroup:&v14 threadsPerMeshThreadgroup:&v13];
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9 = *a5;
  [v8 drawMeshThreads:&v11 threadsPerObjectThreadgroup:&v10 threadsPerMeshThreadgroup:&v9];
}

- (void)useResourceGroup:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 useResourceGroup:a3 usage:a4 stages:a5];
}

- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setVertexVisibleFunctionTable:v7 atBufferIndex:a4];
}

- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  std::vector<objc_object  {objcproto23MTLVisibleFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (uint64_t i = 0; i != length; ++i)
    {
      uint64_t v9 = [(id)a3[i] baseObject];
      *((void *)__p[0] + i) = v9;
    }
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v10, "setVertexVisibleFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setFragmentVisibleFunctionTable:v7 atBufferIndex:a4];
}

- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  std::vector<objc_object  {objcproto23MTLVisibleFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (uint64_t i = 0; i != length; ++i)
    {
      uint64_t v9 = [(id)a3[i] baseObject];
      *((void *)__p[0] + i) = v9;
    }
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v10, "setFragmentVisibleFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setTileVisibleFunctionTable:v7 atBufferIndex:a4];
}

- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  std::vector<objc_object  {objcproto23MTLVisibleFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (uint64_t i = 0; i != length; ++i)
    {
      uint64_t v9 = [(id)a3[i] baseObject];
      *((void *)__p[0] + i) = v9;
    }
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v10, "setTileVisibleFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setObjectVisibleFunctionTable:v7 atBufferIndex:a4];
}

- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  std::vector<objc_object  {objcproto23MTLVisibleFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (uint64_t i = 0; i != length; ++i)
    {
      uint64_t v9 = [(id)a3[i] baseObject];
      *((void *)__p[0] + i) = v9;
    }
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v10, "setObjectVisibleFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setMeshVisibleFunctionTable:v7 atBufferIndex:a4];
}

- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  std::vector<objc_object  {objcproto23MTLVisibleFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (uint64_t i = 0; i != length; ++i)
    {
      uint64_t v9 = [(id)a3[i] baseObject];
      *((void *)__p[0] + i) = v9;
    }
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v10, "setMeshVisibleFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4 stage:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];

  [v8 setVisibleFunctionTable:v9 atBufferIndex:a4 stage:a5];
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4 stage:(unint64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  std::vector<objc_object  {objcproto23MTLVisibleFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (uint64_t i = 0; i != length; ++i)
    {
      uint64_t v11 = [(id)a3[i] baseObject];
      *((void *)__p[0] + i) = v11;
    }
  }
  id v12 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v12, "setVisibleFunctionTables:withBufferRange:stage:", __p[0], location, length, a5);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setVertexIntersectionFunctionTable:v7 atBufferIndex:a4];
}

- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  buildBaseVector((uint64_t)a3, a4.length, __p);
  id v7 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v7, "setVertexIntersectionFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setFragmentIntersectionFunctionTable:v7 atBufferIndex:a4];
}

- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  buildBaseVector((uint64_t)a3, a4.length, __p);
  id v7 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v7, "setFragmentIntersectionFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setTileIntersectionFunctionTable:v7 atBufferIndex:a4];
}

- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  buildBaseVector((uint64_t)a3, a4.length, __p);
  id v7 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v7, "setTileIntersectionFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setVertexAccelerationStructure:v7 atBufferIndex:a4];
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setFragmentAccelerationStructure:v7 atBufferIndex:a4];
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setTileAccelerationStructure:v7 atBufferIndex:a4];
}

- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setObjectIntersectionFunctionTable:v7 atBufferIndex:a4];
}

- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  buildBaseVector((uint64_t)a3, a4.length, __p);
  id v7 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v7, "setObjectIntersectionFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setObjectAccelerationStructure:v7 atBufferIndex:a4];
}

- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setMeshIntersectionFunctionTable:v7 atBufferIndex:a4];
}

- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  buildBaseVector((uint64_t)a3, a4.length, __p);
  id v7 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v7, "setMeshIntersectionFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setMeshAccelerationStructure:v7 atBufferIndex:a4];
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4 stage:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];

  [v8 setIntersectionFunctionTable:v9 atBufferIndex:a4 stage:a5];
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4 stage:(unint64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  buildBaseVector((uint64_t)a3, a4.length, __p);
  id v9 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v9, "setIntersectionFunctionTables:withBufferRange:stage:", __p[0], location, length, a5);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4 stage:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];

  [v8 setAccelerationStructure:v9 atBufferIndex:a4 stage:a5];
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 endEncodingAndRetrieveProgramAddressTable];
}

- (void)enableNullBufferBinds:(BOOL)a3
{
  BOOL v3 = a3;
  [(MTLToolsObject *)self baseObject];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(MTLToolsObject *)self baseObject];
    [v5 enableNullBufferBinds:v3];
  }
}

- (void)useResidencySet:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 useResidencySet:v6];
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  std::vector<objc_object  {objcproto15MTLResidencySet}*>::vector(__p, a4);
  if (a4)
  {
    uint64_t v7 = 0;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:a3[v7]];
      uint64_t v8 = [(id)a3[v7] baseObject];
      *((void *)__p[0] + v7++) = v8;
    }
    while (a4 != v7);
  }
  id v9 = [(MTLToolsObject *)self baseObject];
  [v9 useResidencySets:__p[0] count:a4];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

@end