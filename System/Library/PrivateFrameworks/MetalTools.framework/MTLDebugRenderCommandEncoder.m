@interface MTLDebugRenderCommandEncoder
- ($3CC19D079FD0B010EE84973AA846B91B)scissorRect;
- ($54B668FA3CFF7C50914A1C899F2834C0)viewport;
- (MTLDebugFunctionArgument)tessellationFactorBufferArgument;
- (MTLDebugRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parallelRenderCommandEncoder:(id)a4 descriptor:(id)a5;
- (MTLDebugRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5;
- (MTLDepthStencilDescriptor)defaultDepthStencilDescriptor;
- (MTLDepthStencilState)depthStencilState;
- (MTLRenderPassDescriptor)descriptor;
- (MTLRenderPipelineState)renderPipelineState;
- (float)blendColorAlpha;
- (float)blendColorBlue;
- (float)blendColorGreen;
- (float)blendColorRed;
- (float)depthBias;
- (float)depthBiasClamp;
- (float)depthBiasSlopeScale;
- (float)lineWidth;
- (float)tessellationFactorScale;
- (id).cxx_construct;
- (id)description;
- (id)endEncodingAndRetrieveProgramAddressTable;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)attachmentWriteMask;
- (unint64_t)cullMode;
- (unint64_t)depthClipMode;
- (unint64_t)frontFacingWinding;
- (unint64_t)height;
- (unint64_t)peakPerSampleStorage;
- (unint64_t)resolvedSampleCount;
- (unint64_t)tessellationFactorBufferInstanceStride;
- (unint64_t)triangleFillMode;
- (unint64_t)visibilityResultMode;
- (unint64_t)visibilityResultOffset;
- (unint64_t)width;
- (unsigned)backStencilRef;
- (unsigned)frontStencilRef;
- (void)_dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int *)a5;
- (void)_init;
- (void)_setDefaults;
- (void)_validateAllFunctionArguments:(_MTLMessageContext *)a3;
- (void)_validateDispatchThreadsPerTile:(id *)a3 context:(_MTLMessageContext *)a4;
- (void)dealloc;
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
- (void)endEncoding;
- (void)endEncoding_private;
- (void)enumerateFragmentBuffersUsingBlock:(id)a3;
- (void)enumerateFragmentSamplersUsingBlock:(id)a3;
- (void)enumerateFragmentTexturesUsingBlock:(id)a3;
- (void)enumerateThreadgroupMemoryUsingBlock:(id)a3;
- (void)enumerateTileBuffersUsingBlock:(id)a3;
- (void)enumerateTileSamplersUsingBlock:(id)a3;
- (void)enumerateTileTexturesUsingBlock:(id)a3;
- (void)enumerateVertexBuffersUsingBlock:(id)a3;
- (void)enumerateVertexSamplersUsingBlock:(id)a3;
- (void)enumerateVertexTexturesUsingBlock:(id)a3;
- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6;
- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)scissorRects;
- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4 maxBuffers:(unint64_t)a5 buffers:(MTLDebugFunctionArgument *)a6 buffersLength:(unint64_t)a7 stage:(unint64_t)a8;
- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6;
- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7;
- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7 atIndex:(unint64_t)a8;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setCullMode:(unint64_t)a3;
- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5;
- (void)setDepthClipMode:(unint64_t)a3;
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
- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4 maxBuffers:(unint64_t)a5 buffers:(MTLDebugFunctionArgument *)a6 buffersLength:(unint64_t)a7 stage:(unint64_t)a8;
- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4 maxBuffers:(unint64_t)a5 buffers:(MTLDebugFunctionArgument *)a6 buffersLength:(unint64_t)a7 stage:(unint64_t)a8;
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
- (void)setRenderPipelineState:(id)a3;
- (void)setScissorRect:(id *)a3;
- (void)setScissorRects:(id *)a3 count:(unint64_t)a4;
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
- (void)setViewports:(id *)a3 count:(unint64_t)a4;
- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4 maxBuffers:(unint64_t)a5 buffers:(MTLDebugFunctionArgument *)a6 buffersLength:(unint64_t)a7 stage:(unint64_t)a8;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4 maxBuffers:(unint64_t)a5 buffers:(MTLDebugFunctionArgument *)a6 buffersLength:(unint64_t)a7 stage:(unint64_t)a8;
- (void)textureBarrier;
- (void)updateFence:(id)a3 afterStages:(unint64_t)a4;
- (void)useHeap:(id)a3;
- (void)useHeap:(id)a3 stages:(unint64_t)a4;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6;
- (void)validateCommonDrawErrors:(unint64_t)a3;
- (void)validateCommonDrawErrors:(unint64_t)a3 instanceCount:(unint64_t)a4 baseInstance:(unint64_t)a5 maxVertexID:(unint64_t)a6;
- (void)validateDrawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 function:(const char *)a9;
- (void)validateDrawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 function:(const char *)a7;
- (void)validateFramebufferWithRenderPipelineState:(id)a3 context:(_MTLMessageContext *)a4;
- (void)validateFunctionTableUseResource:(id)a3 stages:(unint64_t)a4 context:(_MTLMessageContext *)a5 selectorName:(id)a6;
- (void)viewports;
- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4;
@end

@implementation MTLDebugRenderCommandEncoder

- (void)viewports
{
  return &self->_viewports.__end_;
}

- (void)scissorRects
{
  return &self->_scissorRects.__end_;
}

- ($54B668FA3CFF7C50914A1C899F2834C0)viewport
{
  result = ($54B668FA3CFF7C50914A1C899F2834C0 *)&self->_viewports.__end_;
  double var0 = result->var0;
  if (*(void *)&result->var1 == *(void *)&result->var0) {
    std::vector<MTLViewport>::__throw_out_of_range[abi:ne180100]();
  }
  long long v5 = *(_OWORD *)(*(void *)&var0 + 16);
  *(_OWORD *)&retstr->double var0 = **(_OWORD **)&var0;
  *(_OWORD *)&retstr->var2 = v5;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)(*(void *)&var0 + 32);
  return result;
}

- ($3CC19D079FD0B010EE84973AA846B91B)scissorRect
{
  result = ($3CC19D079FD0B010EE84973AA846B91B *)&self->_scissorRects.__end_;
  double var0 = (_OWORD *)result->var0;
  if (result->var1 == result->var0) {
    std::vector<MTLViewport>::__throw_out_of_range[abi:ne180100]();
  }
  long long v5 = var0[1];
  *(_OWORD *)&retstr->double var0 = *var0;
  *(_OWORD *)&retstr->var2 = v5;
  return result;
}

- (void)enumerateVertexBuffersUsingBlock:(id)a3
{
}

- (void)enumerateVertexTexturesUsingBlock:(id)a3
{
}

- (void)enumerateVertexSamplersUsingBlock:(id)a3
{
}

- (void)enumerateFragmentBuffersUsingBlock:(id)a3
{
}

- (void)enumerateFragmentTexturesUsingBlock:(id)a3
{
}

- (void)enumerateFragmentSamplersUsingBlock:(id)a3
{
}

- (void)enumerateTileBuffersUsingBlock:(id)a3
{
}

- (void)enumerateTileTexturesUsingBlock:(id)a3
{
}

- (void)enumerateTileSamplersUsingBlock:(id)a3
{
}

- (void)enumerateThreadgroupMemoryUsingBlock:(id)a3
{
}

- (void)_setDefaults
{
  self->_peakPerSampleStorage = 0;
  self->_defaultDepthStencilDescriptor = 0;
  self->_commandBuffer = 0;
  begin = self->_viewports.__begin_;
  if (begin)
  {
    std::__tree<unsigned int>::destroy((uint64_t)self->_viewports.__begin_, *((void **)begin + 1));
    MEMORY[0x23ECD5400](begin, 0x1020C4062D53EE8);
    self->_viewports.__begin_ = 0;
  }
  bzero(&self->_vertexBuffers[0].type, 0xC60uLL);
  bzero(&self->_vertexTextures[0].type, 0x2C00uLL);
  bzero(&self->_vertexSamplers[0].type, 0x580uLL);
  bzero(&self->_fragmentBuffers[0].type, 0xAA8uLL);
  bzero(&self->_fragmentTextures[0].type, 0x2C00uLL);
  bzero(&self->_fragmentSamplers[0].type, 0x580uLL);
  bzero(&self->_tileBuffers[0].type, 0xAA8uLL);
  bzero(&self->_tileTextures[0].type, 0x2C00uLL);
  bzero(&self->_tileSamplers[0].type, 0x580uLL);
  bzero(&self->_threadgroupMemoryArguments[0].type, 0xAA8uLL);
  LODWORD(self->_visibilityOffsets) = -2147418116;
  p_height = &self->_height;
  p_tessellationFactorBufferInstanceStride = &self->_tessellationFactorBufferInstanceStride;
  [self->_frontFacingWinding validate:self->super.super.super._device width:&self->_height height:&self->_tessellationFactorBufferInstanceStride];
  uint64_t v6 = [self->_frontFacingWinding rasterizationRateMap];
  if (v6)
  {
    v7 = (void *)v6;
    uint64_t v8 = [self->_frontFacingWinding renderTargetWidth];
    uint64_t v9 = [self->_frontFacingWinding renderTargetHeight];
    unint64_t v10 = v9;
    if (v8)
    {
      if (v9)
      {
LABEL_6:
        unint64_t *p_height = v8;
        unint64_t *p_tessellationFactorBufferInstanceStride = v10;
        goto LABEL_8;
      }
    }
    else
    {
      [v7 screenSize];
      uint64_t v8 = v21;
      if (v10) {
        goto LABEL_6;
      }
    }
    [v7 screenSize];
    unint64_t v10 = *((void *)&v21 + 1);
    goto LABEL_6;
  }
  unint64_t v10 = *p_tessellationFactorBufferInstanceStride;
LABEL_8:
  long long v21 = 0uLL;
  double v22 = (float)*p_height;
  double v23 = (float)v10;
  long long v24 = xmmword_23BE4AD50;
  std::vector<MTLViewport>::assign((char **)&self->_viewports.__end_, 1uLL, &v21);
  self->_cullMode = 0;
  self->_depthClipMode = 0;
  self->_triangleFillMode = 0;
  self->_depthBiasSlopeScale = 1.0;
  self->_depthBiasClamp = 0.0;
  self->_frontStencilRef = 0;
  self->_backStencilRef = 0;
  long long v18 = 0uLL;
  unint64_t v11 = *p_tessellationFactorBufferInstanceStride;
  unint64_t v19 = *p_height;
  unint64_t v20 = v11;
  std::vector<MTLScissorRect>::assign((char **)&self->_scissorRects.__end_, 1uLL, &v18);
  self->_renderPipelineState = 0;
  self->_amplificationValue = 0;
  self->_vertexAmplificationCount = 1;
  self->_updatedFences.__map_.__first_ = (__begin_ ***)1;

  self->_visibilityResultMode = objc_opt_new();
  self->_blendColorRed = 0.0;
  self->_blendColorGreen = 0.0;
  self->_visibilityResultOffset = 0;
  self->_width = 0;
  self->_blendColorBlue = 0.0;
  self->_blendColorAlpha = 0.0;
  self->_tessellationFactorScale = 0.0;
  LODWORD(self->_descriptor) = 0;
  LOBYTE(self->_tessellationFactorBufferArgument.type) = 0;
  *(void *)&self->_tessellationFactorBufferArgument.isValid = 0;
  HIDWORD(self->_descriptor) = 1065353216;
  LOBYTE(self->_depthBias) = 0;
  p_double var0 = &self->_updatedFences.__map_.var0;
  v13 = (void **)p_var0[1];
  v14 = p_var0[2];
  p_var0[5] = 0;
  unint64_t v15 = (char *)v14 - (char *)v13;
  if (v15 >= 0x11)
  {
    do
    {
      operator delete(*v13);
      v16 = p_var0[2];
      v13 = (void **)(p_var0[1] + 1);
      p_var0[1] = (__end_ ***)v13;
      unint64_t v15 = (char *)v16 - (char *)v13;
    }
    while (v15 > 0x10);
  }
  if (v15 >> 3 == 1)
  {
    uint64_t v17 = 256;
  }
  else
  {
    if (v15 >> 3 != 2) {
      return;
    }
    uint64_t v17 = 512;
  }
  p_var0[4] = (__end_ ***)v17;
}

- (MTLDebugRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugRenderCommandEncoder;
  v7 = -[MTLToolsRenderCommandEncoder initWithRenderCommandEncoder:parent:descriptor:](&v10, sel_initWithRenderCommandEncoder_parent_descriptor_, a3);
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_maxVertexBuffers = (unint64_t)a4;
    v7->_frontFacingWinding = [a5 copy];
    [(MTLDebugRenderCommandEncoder *)v8 _init];
  }
  return v8;
}

- (MTLDebugRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parallelRenderCommandEncoder:(id)a4 descriptor:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugRenderCommandEncoder;
  v7 = -[MTLToolsRenderCommandEncoder initWithRenderCommandEncoder:parent:](&v9, sel_initWithRenderCommandEncoder_parent_, a3);
  if (v7)
  {
    v7->_maxVertexBuffers = [a4 commandBuffer];
    v7->_frontFacingWinding = (unint64_t)a5;
    [(MTLDebugRenderCommandEncoder *)v7 _init];
  }
  return v7;
}

- (void)_init
{
  v26[64] = *MEMORY[0x263EF8340];
  if (hasMemorylessAttachments((MTLRenderPassDescriptor *)self->_frontFacingWinding)) {
    [(MTLToolsRenderCommandEncoder *)self addSplitHandler:&__block_literal_global_3];
  }
  *(_DWORD *)&self->_openGLModeEnabled = 0x7FFF;
  frontFacingWinding = (void *)self->_frontFacingWinding;
  if (frontFacingWinding)
  {
    v4 = (void *)[frontFacingWinding colorAttachments];
    long long v25 = 0uLL;
    unint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v24 = 0;
    v7 = self;
    do
    {
      uint64_t v8 = (void *)[v4 _descriptorAtIndex:v5];
      v7->_attachmentInfo[0].sampleCount = 0;
      v7->_attachmentInfo[1].pixelFormat = 0;
      if (v8)
      {
        objc_super v9 = v8;
        uint64_t v10 = [v8 texture];
        if (v10)
        {
          uint64_t v11 = v10;
          if ([v9 storeAction] == 4) {
            HIDWORD(self->_visibilityOffsets) |= 1 << v5;
          }
          v7->_attachmentInfo[1].pixelFormat = [(id)v11 sampleCount];
          v7->_attachmentInfo[0].sampleCount = [(id)v11 pixelFormat];
          if (v5 > 7)
          {
            if (v5 == 8) {
              uint64_t v16 = v25;
            }
            else {
              uint64_t v16 = v11;
            }
            uint64_t v17 = *((void *)&v25 + 1);
            if (v5 == 8) {
              uint64_t v17 = v11;
            }
            *(void *)&long long v25 = v16;
            *((void *)&v25 + 1) = v17;
          }
          else
          {
            uint64_t v24 = [(id)v11 sampleCount];
            v26[v6] = [(id)v11 pixelFormat];
            v12 = &v26[7 * v6++ + 8];
            long long v14 = *(_OWORD *)(v11 + 88);
            long long v13 = *(_OWORD *)(v11 + 104);
            long long v15 = *(_OWORD *)(v11 + 72);
            v12[6] = *(void *)(v11 + 120);
            *((_OWORD *)v12 + 1) = v14;
            *((_OWORD *)v12 + 2) = v13;
            *(_OWORD *)v12 = v15;
          }
          [self->_maxVertexBuffers addObject:v11 retained:1 purgeable:1];
          objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", objc_msgSend(v9, "resolveTexture"), 1, 1);
        }
      }
      ++v5;
      v7 = (MTLDebugRenderCommandEncoder *)((char *)v7 + 16);
    }
    while (v5 != 10);
    objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", objc_msgSend(self->_frontFacingWinding, "visibilityResultBuffer"), 1, 1);
    objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", objc_msgSend(self->_frontFacingWinding, "rasterizationRateMap"), 1, 0);
    for (uint64_t i = 0; i != 4; ++i)
      objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->_frontFacingWinding, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"), 1, 0);
    unint64_t v19 = (void *)*((void *)&v25 + 1);
    unint64_t v20 = (MTLDepthStencilState *)v24;
    if (v25 == 0)
    {
      uint64_t v21 = 0;
    }
    else
    {
      if (!*((void *)&v25 + 1)) {
        unint64_t v19 = (void *)v25;
      }
      uint64_t v21 = [v19 sampleCount];
    }
    if ([(MTLToolsDevice *)self->super.super.super._device supportsRenderPassWithoutRenderTarget])
    {
      if (!v24)
      {
        unint64_t v20 = (MTLDepthStencilState *)[self->_frontFacingWinding defaultColorSampleCount];
        if (!v20) {
          unint64_t v20 = (MTLDepthStencilState *)[self->_frontFacingWinding defaultRasterSampleCount];
        }
      }
      if (!v21) {
        uint64_t v21 = [self->_frontFacingWinding defaultRasterSampleCount];
      }
      if (!v21 || !v20)
      {
        if (!v20) {
          unint64_t v20 = (MTLDepthStencilState *)v21;
        }
        uint64_t v21 = (uint64_t)v20;
      }
    }
  }
  else
  {
    unint64_t v20 = 0;
    uint64_t v21 = 0;
  }
  [(MTLDebugRenderCommandEncoder *)self _setDefaults];
  self->_commandBuffer = (MTLDebugCommandBuffer *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:10];
  *(void *)&self->_vertexBuffers[0].isValid = v21;
  self->_depthStencilState = v20;
  unint64_t v22 = MTLPixelFormatComputeTotalSizeUsed();
  if (v22 <= [self->_frontFacingWinding imageblockSampleLength]) {
    unint64_t v22 = [self->_frontFacingWinding imageblockSampleLength];
  }
  self->_resolvedSampleCount = v22;
  self->_unint64_t attachmentWriteMask = [(MTLToolsDevice *)self->super.super.super._device maxVertexBuffers];
  if ([self->_frontFacingWinding openGLModeEnabled])
  {
    unint64_t attachmentWriteMask = self->_attachmentWriteMask;
    if (attachmentWriteMask <= 0x24) {
      unint64_t attachmentWriteMask = 36;
    }
    self->_unint64_t attachmentWriteMask = attachmentWriteMask;
    LOBYTE(self->_vertexBuiltinArguments) = 1;
  }
}

uint64_t __37__MTLDebugRenderCommandEncoder__init__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    uint64_t result = MTLReportFailure();
    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t result = MTLReportFailure();
      if ((a3 & 8) == 0) {
        return result;
      }
      goto LABEL_9;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t result = MTLReportFailure();
  if ((a3 & 4) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((a3 & 8) == 0) {
    return result;
  }
LABEL_9:

  return MTLReportFailure();
}

- (void)dealloc
{
  var1 = self->_updatedFences.__map_.var1;
  value = self->_updatedFences.__map_.var2.__value_;
  self->_storingRenderTargets = 0;
  unint64_t v5 = (char *)value - (char *)var1;
  if (v5 >= 0x11)
  {
    do
    {
      operator delete(*var1);
      uint64_t v6 = self->_updatedFences.__map_.var2.__value_;
      var1 = self->_updatedFences.__map_.var1 + 1;
      self->_updatedFences.__map_.var1 = var1;
      unint64_t v5 = (char *)v6 - (char *)var1;
    }
    while (v5 > 0x10);
  }
  if (v5 >> 3 == 1)
  {
    unint64_t v7 = 256;
  }
  else
  {
    if (v5 >> 3 != 2) {
      goto LABEL_8;
    }
    unint64_t v7 = 512;
  }
  self->_updatedFences.__size_.__value_ = v7;
LABEL_8:
  begin = self->_viewports.__begin_;
  if (begin)
  {
    std::__tree<unsigned int>::destroy((uint64_t)self->_viewports.__begin_, *((void **)begin + 1));
    MEMORY[0x23ECD5400](begin, 0x1020C4062D53EE8);
    self->_viewports.__begin_ = 0;
  }
  if ((uint64_t)self->_visibilityOffsets)
  {
    v9.receiver = self;
    v9.super_class = (Class)MTLDebugRenderCommandEncoder;
    [(MTLToolsObject *)&v9 dealloc];
  }
  else
  {
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
    v9.receiver = self;
    v9.super_class = (Class)MTLDebugRenderCommandEncoder;
    [(MTLToolsObject *)&v9 dealloc];
    MTLReportFailure();
  }
}

- (id)formattedDescription:(unint64_t)a3
{
  v79[8] = *MEMORY[0x263EF8340];
  unint64_t v5 = a3 + 4;
  uint64_t v6 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v7 = a3 + 8;
  uint64_t v8 = [@"\n" stringByPaddingToLength:a3 + 8 withString:@" " startingAtIndex:0];
  objc_super v9 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:128];
  v79[0] = v6;
  v79[1] = @"descriptor =";
  frontFacingWinding = (void *)self->_frontFacingWinding;
  if (frontFacingWinding) {
    uint64_t v11 = (__CFString *)[frontFacingWinding formattedDescription:v5];
  }
  else {
    uint64_t v11 = @"<null>";
  }
  v79[2] = v11;
  v79[3] = v6;
  v79[4] = @"viewportCount =";
  v54 = self;
  p_end = &self->_viewports.__end_;
  v79[5] = [NSNumber numberWithUnsignedLong:0xAAAAAAAAAAAAAAABLL * ((self->_viewports.__end_cap_.__value_ - self->_viewports.__end_) >> 4)];
  v79[6] = v6;
  uint64_t v55 = v6;
  v79[7] = @"viewports:";
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v79, 8));
  if (self->_viewports.__end_cap_.__value_ != self->_viewports.__end_)
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    do
    {
      v78[0] = v8;
      v78[1] = objc_msgSend(NSString, "stringWithFormat:", @"Viewport %lu:", v15);
      if (0xAAAAAAAAAAAAAAABLL * ((p_end[1] - *p_end) >> 4) <= v15) {
        std::vector<MTLViewport>::__throw_out_of_range[abi:ne180100]();
      }
      uint64_t v16 = *p_end;
      v78[2] = objc_msgSend(NSString, "stringWithFormat:", @"%g %g %g %g %g %g", *(void *)((char *)v16 + v14), *(void *)((char *)v16 + v14 + 8), *(void *)((char *)v16 + v14 + 16), *(void *)((char *)v16 + v14 + 24), *(void *)((char *)v16 + v14 + 32), *(void *)((char *)v16 + v14 + 40));
      objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v78, 3));
      ++v15;
      v14 += 48;
    }
    while (v15 < 0xAAAAAAAAAAAAAAABLL * ((p_end[1] - *p_end) >> 4));
  }
  unint64_t cullMode = v54->_cullMode;
  long long v18 = @"Unknown";
  v77[0] = v6;
  v77[1] = @"frontFacingWinding =";
  if (cullMode == 1) {
    unint64_t v19 = @"MTLWindingCounterClockwise";
  }
  else {
    unint64_t v19 = @"Unknown";
  }
  if (!cullMode) {
    unint64_t v19 = @"MTLWindingClockwise";
  }
  v77[2] = v19;
  v77[3] = v6;
  v77[4] = @"cullMode =";
  unint64_t depthClipMode = v54->_depthClipMode;
  uint64_t v21 = @"Unknown";
  if (depthClipMode <= 2) {
    uint64_t v21 = off_264E14010[depthClipMode];
  }
  v77[5] = v21;
  v77[6] = v6;
  unint64_t triangleFillMode = v54->_triangleFillMode;
  if (triangleFillMode == 1) {
    long long v18 = @"MTLDepthClipModeClamp";
  }
  if (!triangleFillMode) {
    long long v18 = @"MTLDepthClipModeClip";
  }
  v77[7] = @"depthClipMode =";
  v77[8] = v18;
  v77[9] = v6;
  v77[10] = @"lineWidth =";
  *(float *)&double v13 = v54->_depthBiasSlopeScale;
  v77[11] = [NSNumber numberWithFloat:v13];
  v77[12] = v6;
  v77[13] = @"depthBias =";
  *(float *)&double v23 = v54->_depthBiasClamp;
  v77[14] = [NSNumber numberWithFloat:v23];
  v77[15] = v6;
  v77[16] = @"depthBiasSlopeScale =";
  LODWORD(v24) = v54->_frontStencilRef;
  v77[17] = [NSNumber numberWithFloat:v24];
  v77[18] = v6;
  v77[19] = @"depthBiasClamp =";
  LODWORD(v25) = v54->_backStencilRef;
  v77[20] = [NSNumber numberWithFloat:v25];
  v77[21] = v6;
  v77[22] = @"scissorRectCount =";
  v77[23] = [NSNumber numberWithUnsignedLong:(v54->_scissorRects.__end_cap_.__value_ - v54->_scissorRects.__end_) >> 5];
  v77[24] = v6;
  v77[25] = @"scissorRects:";
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v77, 26));
  if (v54->_scissorRects.__end_cap_.__value_ != v54->_scissorRects.__end_)
  {
    uint64_t v26 = 0;
    unint64_t v27 = 0;
    do
    {
      v76[0] = v8;
      v76[1] = objc_msgSend(NSString, "stringWithFormat:", @"Scissor %lu:", v27);
      if (v27 >= (v54->_scissorRects.__end_cap_.__value_ - v54->_scissorRects.__end_) >> 5) {
        std::vector<MTLViewport>::__throw_out_of_range[abi:ne180100]();
      }
      v76[2] = objc_msgSend(NSString, "stringWithFormat:", @"%lu %lu %lu %lu", *(void *)((char *)v54->_scissorRects.__end_ + v26), *(void *)((char *)v54->_scissorRects.__end_ + v26 + 8), *(void *)((char *)v54->_scissorRects.__end_ + v26 + 16), *(void *)((char *)v54->_scissorRects.__end_ + v26 + 24));
      objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v76, 3));
      ++v27;
      v26 += 32;
    }
    while (v27 < (v54->_scissorRects.__end_cap_.__value_ - v54->_scissorRects.__end_) >> 5);
  }
  v75[0] = v55;
  v75[1] = @"amplificationMode =";
  v75[2] = MTLVertexAmplificationModeString();
  v75[3] = v55;
  v75[4] = @"amplificationValue =";
  v75[5] = [NSNumber numberWithUnsignedInteger:v54->_vertexAmplificationCount];
  v75[6] = v55;
  v75[7] = @"vertexAmplificationCount =";
  v75[8] = [NSNumber numberWithUnsignedInteger:v54->_updatedFences.__map_.__first_];
  v75[9] = v55;
  v75[10] = @"triangleFillMode =";
  unint64_t renderPipelineState = (unint64_t)v54->_renderPipelineState;
  if (renderPipelineState > 2) {
    v29 = @"Unknown";
  }
  else {
    v29 = off_264E14028[renderPipelineState];
  }
  v75[11] = v29;
  v75[12] = v55;
  v75[13] = @"renderPipelineState =";
  uint64_t peakPerSampleStorage = v54->_peakPerSampleStorage;
  if (!peakPerSampleStorage) {
    uint64_t peakPerSampleStorage = [MEMORY[0x263EFF9D0] null];
  }
  v75[14] = peakPerSampleStorage;
  v75[15] = v55;
  v75[16] = @"depthStencilState =";
  uint64_t defaultDepthStencilDescriptor = (uint64_t)v54->_defaultDepthStencilDescriptor;
  if (!defaultDepthStencilDescriptor)
  {
    uint64_t defaultDepthStencilDescriptor = v54->_visibilityResultMode;
    if (!defaultDepthStencilDescriptor) {
      uint64_t defaultDepthStencilDescriptor = [MEMORY[0x263EFF9D0] null];
    }
  }
  v75[17] = defaultDepthStencilDescriptor;
  v75[18] = v55;
  v75[19] = @"frontStencilRef =";
  v75[20] = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", LODWORD(v54->_blendColorRed));
  v75[21] = v55;
  v75[22] = @"backStencilRef =";
  v75[23] = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", LODWORD(v54->_blendColorGreen));
  v75[24] = v55;
  v75[25] = @"visibilityResultMode =";
  unint64_t visibilityResultOffset = v54->_visibilityResultOffset;
  if (visibilityResultOffset > 2) {
    v33 = @"Unknown";
  }
  else {
    v33 = off_264E14040[visibilityResultOffset];
  }
  v75[26] = v33;
  v75[27] = v55;
  v75[28] = @"visibilityResultOffset =";
  v75[29] = [NSNumber numberWithUnsignedInteger:v54->_width];
  v75[30] = v55;
  v75[31] = @"Blend Color =";
  v75[32] = objc_msgSend(NSString, "stringWithFormat:", @"%g %g %g %g", v54->_blendColorBlue, v54->_blendColorAlpha, v54->_tessellationFactorScale, *(float *)&v54->_descriptor);
  v75[33] = v55;
  v75[34] = @"Set Vertex Buffers:";
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v75, 35));
  uint64_t v34 = 0;
  v35 = v54;
  do
  {
    v74[0] = v8;
    v74[1] = objc_msgSend(NSString, "stringWithFormat:", @"Buffer %lu:", v34);
    v74[2] = argumentFormattedDescription(v7, (uint64_t)&v35->_vertexBuffers[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v74, 3));
    ++v34;
    v35 = (MTLDebugRenderCommandEncoder *)((char *)v35 + 88);
  }
  while (v34 != 36);
  v73[0] = v55;
  v73[1] = @"Set Vertex Textures:";
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v73, 2));
  uint64_t v36 = 0;
  v37 = v54;
  do
  {
    v72[0] = v8;
    v72[1] = objc_msgSend(NSString, "stringWithFormat:", @"Texture %lu:", v36);
    v72[2] = argumentFormattedDescription(v7, (uint64_t)&v37->_vertexTextures[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v72, 3));
    ++v36;
    v37 = (MTLDebugRenderCommandEncoder *)((char *)v37 + 88);
  }
  while (v36 != 128);
  v71[0] = v55;
  v71[1] = @"Set Vertex Samplers:";
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v71, 2));
  uint64_t v38 = 0;
  v39 = v54;
  do
  {
    v70[0] = v8;
    v70[1] = objc_msgSend(NSString, "stringWithFormat:", @"Sampler %lu:", v38);
    v70[2] = argumentFormattedDescription(v7, (uint64_t)&v39->_vertexSamplers[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v70, 3));
    ++v38;
    v39 = (MTLDebugRenderCommandEncoder *)((char *)v39 + 88);
  }
  while (v38 != 16);
  v69[0] = v55;
  v69[1] = @"Set Fragment Buffers:";
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v69, 2));
  uint64_t v40 = 0;
  v41 = v54;
  do
  {
    v68[0] = v8;
    v68[1] = objc_msgSend(NSString, "stringWithFormat:", @"Buffer %lu:", v40);
    v68[2] = argumentFormattedDescription(v7, (uint64_t)&v41->_fragmentBuffers[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v68, 3));
    ++v40;
    v41 = (MTLDebugRenderCommandEncoder *)((char *)v41 + 88);
  }
  while (v40 != 31);
  v67[0] = v55;
  v67[1] = @"Set Fragment Textures:";
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v67, 2));
  uint64_t v42 = 0;
  v43 = v54;
  do
  {
    v66[0] = v8;
    v66[1] = objc_msgSend(NSString, "stringWithFormat:", @"Texture %lu:", v42);
    v66[2] = argumentFormattedDescription(v7, (uint64_t)&v43->_fragmentTextures[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v66, 3));
    ++v42;
    v43 = (MTLDebugRenderCommandEncoder *)((char *)v43 + 88);
  }
  while (v42 != 128);
  v65[0] = v55;
  v65[1] = @"Set Fragment Samplers:";
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v65, 2));
  uint64_t v44 = 0;
  v45 = v54;
  do
  {
    v64[0] = v8;
    v64[1] = objc_msgSend(NSString, "stringWithFormat:", @"Sampler %lu:", v44);
    v64[2] = argumentFormattedDescription(v7, (uint64_t)&v45->_fragmentSamplers[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v64, 3));
    ++v44;
    v45 = (MTLDebugRenderCommandEncoder *)((char *)v45 + 88);
  }
  while (v44 != 16);
  v63[0] = v55;
  v63[1] = @"Set Tile Buffers:";
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v63, 2));
  uint64_t v46 = 0;
  v47 = v54;
  do
  {
    v62[0] = v8;
    v62[1] = objc_msgSend(NSString, "stringWithFormat:", @"Buffer %lu:", v46);
    v62[2] = argumentFormattedDescription(v7, (uint64_t)&v47->_tileBuffers[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v62, 3));
    ++v46;
    v47 = (MTLDebugRenderCommandEncoder *)((char *)v47 + 88);
  }
  while (v46 != 31);
  v61[0] = v55;
  v61[1] = @"Set Tile Textures:";
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v61, 2));
  uint64_t v48 = 0;
  v49 = v54;
  do
  {
    v60[0] = v8;
    v60[1] = objc_msgSend(NSString, "stringWithFormat:", @"Texture %lu:", v48);
    v60[2] = argumentFormattedDescription(v7, (uint64_t)&v49->_tileTextures[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v60, 3));
    ++v48;
    v49 = (MTLDebugRenderCommandEncoder *)((char *)v49 + 88);
  }
  while (v48 != 128);
  v59[0] = v55;
  v59[1] = @"Set Tile Samplers:";
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v59, 2));
  uint64_t v50 = 0;
  v51 = v54;
  do
  {
    v58[0] = v8;
    v58[1] = objc_msgSend(NSString, "stringWithFormat:", @"Sampler %lu:", v50);
    v58[2] = argumentFormattedDescription(v7, (uint64_t)&v51->_tileSamplers[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v58, 3));
    ++v50;
    v51 = (MTLDebugRenderCommandEncoder *)((char *)v51 + 88);
  }
  while (v50 != 16);
  v57[0] = v55;
  v57[1] = @"Set Tessellation Factor Buffer =";
  v57[2] = argumentFormattedDescription(v7, (uint64_t)&v54->_tessellationFactorBufferArgument.type);
  v57[3] = v55;
  v57[4] = @"tessellationFactorBufferInstanceStride =";
  v57[5] = [NSNumber numberWithUnsignedInteger:*(void *)&v54->_tessellationFactorBufferArgument.isValid];
  v57[6] = v55;
  v57[7] = @"tessellationFactorScale =";
  LODWORD(v52) = HIDWORD(v54->_descriptor);
  v57[8] = [NSNumber numberWithFloat:v52];
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v57, 9));
  v56.receiver = v54;
  v56.super_class = (Class)MTLDebugRenderCommandEncoder;
  return (id)[NSString stringWithFormat:@"%@%@", -[MTLToolsObject description](&v56, sel_description), objc_msgSend(v9, "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLDebugRenderCommandEncoder *)self formattedDescription:0];
}

- (void)validateFramebufferWithRenderPipelineState:(id)a3 context:(_MTLMessageContext *)a4
{
  uint64_t v6 = (MTLRenderPipelineState *)*((void *)a3 + 8);
  if ([(MTLToolsDevice *)self->super.super.super._device supportsRenderPassWithoutRenderTarget])
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "descriptor"), "rasterSampleCount");
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = (uint64_t)v6;
    }
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "descriptor"), "colorSampleCount");
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = (uint64_t)v6;
    }
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a3, "meshDescriptor"), "rasterSampleCount");
    if (v11) {
      v12 = (MTLRenderPipelineState *)v11;
    }
    else {
      v12 = (MTLRenderPipelineState *)v8;
    }
    uint64_t v13 = objc_msgSend((id)objc_msgSend(a3, "meshDescriptor"), "colorSampleCount");
    if (v13) {
      uint64_t v14 = (MTLDepthStencilState *)v13;
    }
    else {
      uint64_t v14 = (MTLDepthStencilState *)v10;
    }
  }
  else
  {
    uint64_t v14 = 0;
    v12 = 0;
  }
  if (![a3 rasterizationEnabled]) {
    goto LABEL_47;
  }
  unint64_t v15 = 0;
  uint64_t v16 = &self->_attachmentInfo[1];
  uint64_t v17 = @"For color attachment %d, the renderPipelineState pixelFormat must be MTLPixelFormatInvalid, as no texture is set.";
  long long v18 = @"For color attachment %d, the render pipeline's pixelFormat (%s) does not match the framebuffer's pixelFormat (%s).";
  unint64_t v19 = @"For color attachment %d, the texture sample count (%lu) does not match the renderPipelineState colorSampleCount (%lu).";
  do
  {
    uint64_t v20 = *((void *)a3 + v15 + 9);
    unint64_t sampleCount = v16[-1].sampleCount;
    if (sampleCount)
    {
      unint64_t pixelFormat = v16->pixelFormat;
      if (v14)
      {
        if (v14 == (MTLDepthStencilState *)pixelFormat) {
          goto LABEL_24;
        }
        uint64_t Name = v16->pixelFormat;
        uint64_t v37 = (uint64_t)v14;
        unint64_t v35 = v15;
      }
      else
      {
        if (v6 == (MTLRenderPipelineState *)pixelFormat) {
          goto LABEL_24;
        }
        uint64_t Name = v16->pixelFormat;
        uint64_t v37 = (uint64_t)v6;
        unint64_t v35 = v15;
      }
      _MTLMessageContextPush_();
      unint64_t v19 = @"For color attachment %d, the texture sample count (%lu) does not match the renderPipelineState colorSampleCount (%lu).";
      long long v18 = @"For color attachment %d, the render pipeline's pixelFormat (%s) does not match the framebuffer's pixelFormat (%s).";
      uint64_t v17 = @"For color attachment %d, the renderPipelineState pixelFormat must be MTLPixelFormatInvalid, as no texture is set.";
LABEL_24:
      if (v20 != sampleCount)
      {
        double v25 = v18;
        uint64_t Name = MTLPixelFormatGetName();
        uint64_t v37 = MTLPixelFormatGetName();
        unint64_t v35 = v15;
        _MTLMessageContextPush_();
        unint64_t v19 = @"For color attachment %d, the texture sample count (%lu) does not match the renderPipelineState colorSampleCount (%lu).";
        long long v18 = v25;
        uint64_t v17 = @"For color attachment %d, the renderPipelineState pixelFormat must be MTLPixelFormatInvalid, as no texture is set.";
      }
      goto LABEL_26;
    }
    if (v20)
    {
      unint64_t v35 = v15;
      double v23 = v17;
      double v24 = v19;
      _MTLMessageContextPush_();
      unint64_t v19 = v24;
      long long v18 = @"For color attachment %d, the render pipeline's pixelFormat (%s) does not match the framebuffer's pixelFormat (%s).";
      uint64_t v17 = v23;
    }
LABEL_26:
    ++v16;
    ++v15;
  }
  while (v15 != 8);
  if ([a3 tileDescriptor]) {
    goto LABEL_47;
  }
  unint64_t v26 = self->_attachmentInfo[8].sampleCount;
  uint64_t v27 = *((void *)a3 + 17);
  if (!v26)
  {
    if (!v27) {
      goto LABEL_39;
    }
    goto LABEL_62;
  }
  unint64_t v28 = self->_attachmentInfo[9].pixelFormat;
  if (v12)
  {
    if (v12 != (MTLRenderPipelineState *)v28)
    {
      unint64_t v35 = self->_attachmentInfo[9].pixelFormat;
      uint64_t Name = (uint64_t)v12;
      goto LABEL_66;
    }
  }
  else if (v6 != (MTLRenderPipelineState *)v28)
  {
    unint64_t v35 = self->_attachmentInfo[9].pixelFormat;
    uint64_t Name = (uint64_t)v6;
LABEL_66:
    _MTLMessageContextPush_();
  }
  if (v27 != v26)
  {
    unint64_t v35 = MTLPixelFormatGetName();
    uint64_t Name = MTLPixelFormatGetName();
LABEL_62:
    _MTLMessageContextPush_();
  }
LABEL_39:
  unint64_t v29 = self->_attachmentInfo[9].sampleCount;
  uint64_t v30 = *((void *)a3 + 18);
  if (!v29)
  {
    if (!v30) {
      goto LABEL_47;
    }
    goto LABEL_64;
  }
  previousRenderPipelineStateWithWritesToImageBlock = self->_previousRenderPipelineStateWithWritesToImageBlock;
  if (v12)
  {
    if (v12 != previousRenderPipelineStateWithWritesToImageBlock)
    {
      unint64_t v35 = (unint64_t)self->_previousRenderPipelineStateWithWritesToImageBlock;
      uint64_t Name = (uint64_t)v12;
      goto LABEL_68;
    }
  }
  else if (v6 != previousRenderPipelineStateWithWritesToImageBlock)
  {
    unint64_t v35 = (unint64_t)self->_previousRenderPipelineStateWithWritesToImageBlock;
    uint64_t Name = (uint64_t)v6;
LABEL_68:
    _MTLMessageContextPush_();
  }
  if (v30 != v29)
  {
    unint64_t v35 = MTLPixelFormatGetName();
    uint64_t Name = MTLPixelFormatGetName();
LABEL_64:
    _MTLMessageContextPush_();
  }
LABEL_47:
  if ([(MTLToolsDevice *)self->super.super.super._device supportsRenderPassWithoutRenderTarget])
  {
    BOOL v32 = [(MTLToolsDevice *)self->super.super.super._device supportsSeparateVisibilityAndShadingRate];
    depthStencilState = self->_depthStencilState;
    if (v32)
    {
      if (depthStencilState != v14) {
        _MTLMessageContextPush_();
      }
      if (*(MTLRenderPipelineState **)&self->_vertexBuffers[0].isValid != v12) {
        goto LABEL_60;
      }
    }
    else
    {
      if (depthStencilState != *(MTLDepthStencilState **)&self->_vertexBuffers[0].isValid || v14 != v12)
      {
        _MTLMessageContextPush_();
        depthStencilState = self->_depthStencilState;
      }
      if (depthStencilState != v14) {
LABEL_60:
      }
        _MTLMessageContextPush_();
    }
  }
}

- (void)setRenderPipelineState:(id)a3
{
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets))
  {
    _MTLMessageContextPush_();
    if (a3) {
      goto LABEL_3;
    }
LABEL_29:
    _MTLMessageContextPush_();
    goto LABEL_3;
  }
  if (!a3) {
    goto LABEL_29;
  }
LABEL_3:
  int visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x20000) != 0 && self->_peakPerSampleStorage == a3)
  {
    _MTLMessageContextPush_();
    if (((uint64_t)self->_visibilityOffsets & 4) != 0) {
      goto LABEL_6;
    }
  }
  else if ((visibilityOffsets & 4) != 0)
  {
    goto LABEL_6;
  }
  _MTLMessageContextPush_();
LABEL_6:
  _MTLMessageContextEnd();
  if (self->_peakPerSampleStorage != a3)
  {
    uint64_t v25 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v22 = 0u;
    _MTLMessageContextBegin_();
    if (a3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        device = self->super.super.super._device;
        if (device != (MTLToolsDevice *)[a3 device]) {
          _MTLMessageContextPush_();
        }
        if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled()) {
          [(MTLDebugRenderCommandEncoder *)self validateFramebufferWithRenderPipelineState:a3 context:&v22];
        }
      }
      else
      {
        _MTLMessageContextPush_();
      }
    }
    int v7 = (int)self->_visibilityOffsets;
    LODWORD(self->_visibilityOffsets) = v7 | 0x20000;
    uint64_t peakPerSampleStorage = (void *)self->_peakPerSampleStorage;
    if (peakPerSampleStorage && (v7 & 4) != 0 && [peakPerSampleStorage outputImageBlockData]) {
      self->_resolvedRasterSampleCount = self->_peakPerSampleStorage;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v9 = [a3 imageblockSampleLength];
      if (v9 > self->_resolvedSampleCount)
      {
        unint64_t v18 = v9;
        unint64_t resolvedSampleCount = self->_resolvedSampleCount;
        _MTLMessageContextPush_();
      }
    }
    uint64_t v10 = objc_msgSend(self->_frontFacingWinding, "tileWidth", v18, resolvedSampleCount);
    uint64_t v11 = [self->_frontFacingWinding tileHeight] * v10 * (uint64_t)self->_depthStencilState;
    unint64_t v12 = self->_resolvedSampleCount;
    unint64_t v13 = [self->_frontFacingWinding threadgroupMemoryLength] + v11 * v12;
    if (v13 > [(MTLToolsDevice *)self->super.super.super._device maxThreadgroupMemoryLength])
    {
      [(MTLToolsDevice *)self->super.super.super._device maxThreadgroupMemoryLength];
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
    LODWORD(self->_visibilityOffsets) &= ~4u;
    [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setRenderPipelineState:", objc_msgSend(a3, "baseObject"));
    self->_uint64_t peakPerSampleStorage = (unint64_t)a3;
    *(_DWORD *)&self->_openGLModeEnabled |= 0x7FFFu;
    p_height = &self->_objectThreadsPerTG.height;
    self->_objectThreadsPerTG.depth = 0;
    self->_meshThreadsPerTG.width = 0;
    self->_objectThreadsPerTG.height = 0;
    unint64_t v15 = &self->_meshThreadsPerTG.height;
    self->_meshThreadsPerTG.depth = 0;
    *(void *)&self->_allowsNullBufferBinds = 0;
    self->_meshThreadsPerTG.height = 0;
    if ([self->_peakPerSampleStorage isMeshShaderPipeline])
    {
      uint64_t v16 = (void *)[self->_peakPerSampleStorage descriptor];
      if (v16)
      {
        uint64_t v17 = v16;
        [v16 objectThreadsPerThreadgroup];
        *(_OWORD *)p_height = v20;
        p_height[2] = v21;
        [v17 meshThreadsPerThreadgroup];
        *(_OWORD *)unint64_t v15 = v20;
        v15[2] = v21;
      }
    }
  }
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  memset(&v16, 0, sizeof(v16));
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (self->_attachmentWriteMask <= a6)
  {
    unint64_t v14 = a6;
    unint64_t attachmentWriteMask = self->_attachmentWriteMask;
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxVertexInlineDataSize] < a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxVertexInlineDataSize];
    _MTLMessageContextPush_();
  }
  if (a6 <= 0x23) {
    validateArg(MTLArgumentTypeBuffer, a6, (MTLDebugFunctionArgument *)&self->_vertexBuffers[a6].type, &v16);
  }
  _MTLMessageContextEnd();
  BOOL v11 = [(MTLToolsDevice *)self->super.super.super._device supportsDynamicAttributeStride];
  id v12 = [(MTLToolsObject *)self baseObject];
  if (v11) {
    [v12 setVertexBytes:a3 length:a4 attributeStride:a5 atIndex:a6];
  }
  else {
    [v12 setVertexBytes:a3 length:a4 atIndex:a6];
  }
  MTLReportFailureTypeEnabled();
  p_type = &self->_vertexBuffers[a6].type;
  *(unsigned char *)p_type = a4 != 0;
  *((unsigned char *)p_type + 1) = 0;
  p_type[1] = 0;
  p_type[2] = 0;
  p_type[3] = 0;
  p_type[4] = a4;
  p_type[5] = 0;
  p_type[6] = a5;
  p_type[7] = 0;
  p_type[8] = 0;
  *((unsigned char *)p_type + 72) = 0;
  *((_DWORD *)p_type + 19) = 0;
  *((_DWORD *)p_type + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 2u;
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  memset(&v19, 0, sizeof(v19));
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (self->_attachmentWriteMask > a6)
  {
    if (a3) {
      goto LABEL_5;
    }
LABEL_12:
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  _MTLMessageContextPush_();
  if (!a3) {
    goto LABEL_12;
  }
LABEL_5:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    _MTLMessageContextPush_();
LABEL_13:
    unint64_t v12 = 0;
    goto LABEL_14;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  unint64_t v12 = *((void *)a3 + 8);
  if (v12 <= a4) {
    _MTLMessageContextPush_();
  }
LABEL_14:
  if (a6 <= 0x23) {
    validateArg(MTLArgumentTypeBuffer, a6, (MTLDebugFunctionArgument *)&self->_vertexBuffers[a6].type, &v19);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  BOOL v13 = [(MTLToolsDevice *)self->super.super.super._device supportsDynamicAttributeStride];
  id v14 = [(MTLToolsObject *)self baseObject];
  uint64_t v15 = [a3 baseObject];
  if (v13) {
    [v14 setVertexBuffer:v15 offset:a4 attributeStride:a5 atIndex:a6];
  }
  else {
    [v14 setVertexBuffer:v15 offset:a4 atIndex:a6];
  }
  p_type = &self->_vertexBuffers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    if (a3)
    {
      uint64_t v17 = &p_type[11 * a6];
      if (!*((unsigned char *)v17 + 72)
        && v17[6] == a5
        && v17[5] == a4
        && v17[4] == v12
        && (id)v17[2] == a3
        && !(v17[3] | v17[1])
        && *(_OWORD *)(v17 + 7) == 0
        && !*(unint64_t *)((char *)v17 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  unint64_t v18 = &p_type[11 * a6];
  *(unsigned char *)unint64_t v18 = v12 != 0;
  *((unsigned char *)v18 + 1) = 0;
  v18[1] = 0;
  v18[2] = (unint64_t)a3;
  v18[3] = 0;
  v18[4] = v12;
  v18[5] = a4;
  v18[6] = a5;
  v18[7] = 0;
  v18[8] = 0;
  *((unsigned char *)v18 + 72) = 0;
  *((_DWORD *)v18 + 19) = 0;
  *((_DWORD *)v18 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 2u;
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  memset(&v25, 0, sizeof(v25));
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (self->_attachmentWriteMask <= a5)
  {
    unint64_t v23 = a5;
    unint64_t attachmentWriteMask = self->_attachmentWriteMask;
    _MTLMessageContextPush_();
  }
  if (a5 <= 0x23)
  {
    p_type = (MTLDebugFunctionArgument *)&self->_vertexBuffers[a5].type;
    validateArg(MTLArgumentTypeBuffer, a5, p_type, &v25);
    object = p_type->object;
    p_object = (id *)&p_type->object;
    uint64_t v10 = object;
    if (object)
    {
      if ([(baseLevel *)v10 length] > a3) {
        goto LABEL_11;
      }
      unint64_t v23 = a3;
      unint64_t attachmentWriteMask = [*p_object length];
    }
    else
    {
      unint64_t v23 = a5;
    }
    _MTLMessageContextPush_();
  }
LABEL_11:
  _MTLMessageContextEnd();
  BOOL v13 = [(MTLToolsDevice *)self->super.super.super._device supportsDynamicAttributeStride];
  id v14 = [(MTLToolsObject *)self baseObject];
  if (v13) {
    [v14 setVertexBufferOffset:a3 attributeStride:a4 atIndex:a5];
  }
  else {
    [v14 setVertexBufferOffset:a3 atIndex:a5];
  }
  uint64_t v15 = &self->_vertexBuffers[0].type;
  _MTLMessageContext v16 = &self->_vertexBuffers[a5].type;
  _MTLMessageContext v19 = (void *)v16[2];
  unint64_t v18 = (void **)(v16 + 2);
  uint64_t v17 = v19;
  uint64_t v20 = objc_msgSend(v19, "length", v23, attachmentWriteMask, v25.var0, v25.var1, *(void *)&v25.var2, v25.var3, v25.var4, v25.var5, v25.var6);
  if (MTLReportFailureTypeEnabled())
  {
    if (v17)
    {
      unint64_t v21 = &v15[11 * a5];
      if (!*((unsigned char *)v21 + 72)
        && v21[6] == a4
        && v21[5] == a3
        && v21[4] == v20
        && *v18 == v17
        && !(v21[3] | v21[1])
        && *(_OWORD *)(v21 + 7) == 0
        && !*(unint64_t *)((char *)v21 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  long long v22 = &v15[11 * a5];
  *(unsigned char *)long long v22 = v20 != 0;
  *((unsigned char *)v22 + 1) = 0;
  v22[1] = 0;
  v22[2] = (unint64_t)v17;
  v22[3] = 0;
  v22[4] = v20;
  v22[5] = a3;
  v22[6] = a4;
  v22[7] = 0;
  v22[8] = 0;
  *((unsigned char *)v22 + 72) = 0;
  *((_DWORD *)v22 + 19) = 0;
  *((_DWORD *)v22 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 2u;
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  std::vector<unsigned long>::vector(__b, a5.length);
  uint64_t v10 = __b[0];
  if (length) {
    memset(__b[0], 255, 8 * length);
  }
  -[MTLDebugRenderCommandEncoder setVertexBuffers:offsets:attributeStrides:withRange:](self, "setVertexBuffers:offsets:attributeStrides:withRange:", a3, a4, v10, location, length);
  if (__b[0])
  {
    __b[1] = __b[0];
    operator delete(__b[0]);
  }
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v48 = *MEMORY[0x263EF8340];
  memset(&v46, 0, sizeof(v46));
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length > self->_attachmentWriteMask)
  {
    uint64_t v36 = (MTLToolsRetainingContainer *)(location + length);
    unint64_t attachmentWriteMask = self->_attachmentWriteMask;
    _MTLMessageContextPush_();
  }
  NSUInteger v42 = location;
  NSUInteger v43 = length;
  v41 = a4;
  if (!length)
  {
    _MTLMessageContextEnd();
    goto LABEL_52;
  }
  BOOL v11 = 0;
  unint64_t v12 = (char *)self + 88 * location;
  do
  {
    if (!a3[(void)v11])
    {
      if (!a4[(void)v11]) {
        goto LABEL_17;
      }
      uint64_t v36 = v11;
      unint64_t attachmentWriteMask = a4[(void)v11];
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v36 = v11;
      goto LABEL_16;
    }
    BOOL v13 = a3;
    device = self->super.super.super._device;
    if (device != (MTLToolsDevice *)[(id)v13[(void)v11] device])
    {
      uint64_t v36 = v11;
      _MTLMessageContextPush_();
    }
    a3 = v13;
    if (a4[(void)v11] >= *((void *)v13[(void)v11] + 8))
    {
      uint64_t v38 = v11;
      uint64_t v39 = *((void *)v13[(void)v11] + 8);
      uint64_t v36 = v11;
      unint64_t attachmentWriteMask = a4[(void)v11];
LABEL_16:
      _MTLMessageContextPush_();
    }
LABEL_17:
    if ((unint64_t)v11 + location <= 0x23) {
      validateArg(MTLArgumentTypeBuffer, (unint64_t)v11 + location, (MTLDebugFunctionArgument *)(v12 + 248), &v46);
    }
    BOOL v11 = (MTLToolsRetainingContainer *)((char *)v11 + 1);
    v12 += 88;
  }
  while ((MTLToolsRetainingContainer *)length != v11);
  _MTLMessageContextEnd();
  uint64_t v15 = a4;
  _MTLMessageContext v16 = &self->super.super._commandBuffer + 11 * v42;
  uint64_t v44 = self;
  uint64_t v17 = v47;
  unint64_t v18 = a5;
  NSUInteger v19 = length;
  do
  {
    if (*a3) {
      uint64_t v20 = (MTLToolsRetainingContainer *)*((void *)*a3 + 8);
    }
    else {
      uint64_t v20 = 0;
    }
    objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", v36, attachmentWriteMask, v38, v39);
    *uint64_t v17 = [(id)*a3 baseObject];
    unint64_t v21 = v16 + 31;
    v45 = a3;
    long long v22 = (MTLToolsRetainingContainer *)*a3;
    unint64_t v23 = *v15;
    long long v24 = (MTLToolsRetainingContainer *)*v18;
    int v25 = MTLReportFailureTypeEnabled();
    unint64_t v26 = (MTLToolsRetainingContainer *)v23;
    if (v25 && v22)
    {
      BOOL v27 = !*((unsigned char *)v16 + 280) && v16[32] == v24;
      BOOL v28 = v27 && *v21 == (MTLToolsRetainingContainer *)v23;
      BOOL v29 = v28 && v16[30] == v20;
      BOOL v30 = v29 && v16[28] == v22;
      BOOL v31 = v30 && ((unint64_t)v16[29] | (unint64_t)v16[27]) == 0;
      BOOL v32 = v31 && *(_OWORD *)(v16 + 33) == 0;
      if (v32 && *(MTLToolsRetainingContainer **)((char *)v16 + 284) == 0)
      {
        uint64_t v36 = v22;
        MTLReportFailure();
        unint64_t v26 = (MTLToolsRetainingContainer *)v23;
      }
    }
    *((unsigned char *)v16 + 208) = v20 != 0;
    *((unsigned char *)v16 + 209) = 0;
    v16[27] = 0;
    v16[28] = v22;
    v16[29] = 0;
    v16[30] = v20;
    *unint64_t v21 = v26;
    v16[32] = v24;
    v16[33] = 0;
    v16[34] = 0;
    v16 += 11;
    *((unsigned char *)v21 + 32) = 0;
    ++v18;
    ++v15;
    ++v17;
    a3 = v45 + 1;
    *((_DWORD *)v21 + 9) = 0;
    *((_DWORD *)v21 + 10) = 0;
    --v19;
    self = v44;
  }
  while (v19);
LABEL_52:
  BOOL v34 = [(MTLToolsDevice *)self->super.super.super._device supportsDynamicAttributeStride];
  id v35 = [(MTLToolsObject *)self baseObject];
  if (v34) {
    objc_msgSend(v35, "setVertexBuffers:offsets:attributeStrides:withRange:", v47, v41, a5, v42, v43);
  }
  else {
    objc_msgSend(v35, "setVertexBuffers:offsets:withRange:", v47, v41, v42, v43);
  }
  *(_DWORD *)&self->_openGLModeEnabled |= 2u;
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  memset(&v13, 0, sizeof(v13));
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxVertexTextures] <= a4)
  {
    unint64_t v11 = a4;
    unint64_t v12 = [(MTLToolsDevice *)self->super.super.super._device maxVertexTextures];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_10;
    }
  }
  else if (!a3)
  {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "storageMode", v11, v12, v13.var0, v13.var1, *(void *)&v13.var2, v13.var3, v13.var4, v13.var5, v13.var6) == 3)LABEL_9:_MTLMessageContextPush_(); {
LABEL_10:
  }
  if (a4 <= 0x7F) {
    validateArg(MTLArgumentTypeTexture, a4, (MTLDebugFunctionArgument *)&self->_vertexTextures[a4].type, &v13);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_vertexTextures[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    unint64_t v9 = &p_type[11 * a4];
    if (!*((unsigned char *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 1
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  uint64_t v10 = &p_type[11 * a4];
  *(unsigned char *)uint64_t v10 = a3 != 0;
  *((unsigned char *)v10 + 1) = 0;
  v10[1] = 1;
  v10[2] = (unint64_t)a3;
  v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((unsigned char *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 4u;
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v26 = *MEMORY[0x263EF8340];
  memset(&v24, 0, sizeof(v24));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length <= [(MTLToolsDevice *)self->super.super.super._device maxVertexTextures])
  {
    if (length) {
      goto LABEL_5;
    }
LABEL_40:
    _MTLMessageContextEnd();
    goto LABEL_41;
  }
  long long v22 = (const void *)(location + length);
  unint64_t v23 = [(MTLToolsDevice *)self->super.super.super._device maxVertexTextures];
  _MTLMessageContextPush_();
  if (!length) {
    goto LABEL_40;
  }
LABEL_5:
  uint64_t v8 = 0;
  unint64_t v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(void)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_11;
      }
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v8], "device", @"textures[%lu] is not an MTLTexture."))
      {
        long long v22 = v8;
        _MTLMessageContextPush_();
      }
      if (objc_msgSend((id)a3[(void)v8], "storageMode", v22, v23) == 3)
      {
LABEL_11:
        long long v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0x7F) {
      validateArg(MTLArgumentTypeTexture, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 3416), &v24);
    }
    uint64_t v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  unint64_t v11 = (char *)self + 88 * location;
  unint64_t v12 = v25;
  NSUInteger v13 = length;
  do
  {
    objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 1, v22);
    void *v12 = [(id)*a3 baseObject];
    id v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[3488]) {
        BOOL v15 = 0;
      }
      else {
        BOOL v15 = *((void *)v11 + 433) == -1;
      }
      if (v15
        && *((void *)v11 + 428) == 1
        && *((void *)v11 + 429) == (void)v14
        && (*((void *)v11 + 431) | *((void *)v11 + 430) | *((void *)v11 + 432)) == 0
        && *((_OWORD *)v11 + 217) == 0
        && *(void *)(v11 + 3492) == 0)
      {
        long long v22 = v14;
        MTLReportFailure();
      }
    }
    unint64_t v21 = v11 + 3416;
    v11[3416] = v14 != 0;
    v11[3417] = 0;
    *((void *)v11 + 428) = 1;
    *((void *)v11 + 429) = v14;
    *((void *)v11 + 430) = 0;
    *((void *)v11 + 431) = 0;
    *((void *)v11 + 432) = 0;
    *((void *)v11 + 433) = -1;
    *((void *)v11 + 434) = 0;
    *((void *)v11 + 435) = 0;
    v11[3488] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_41:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setVertexTextures:withRange:", v25, location, length);
  *(_DWORD *)&self->_openGLModeEnabled |= 4u;
}

- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  memset(&v11, 0, sizeof(v11));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxVertexSamplers] <= a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxVertexSamplers];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)[a3 device]))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a4 <= 0xF) {
    validateArg(MTLArgumentTypeSampler, a4, (MTLDebugFunctionArgument *)&self->_vertexSamplers[a4].type, &v11);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_vertexSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    unint64_t v9 = &p_type[11 * a4];
    if (!*((unsigned char *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 2
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  uint64_t v10 = &p_type[11 * a4];
  *(unsigned char *)uint64_t v10 = a3 != 0;
  *((unsigned char *)v10 + 1) = 0;
  v10[1] = 2;
  v10[2] = (unint64_t)a3;
  v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((unsigned char *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 8u;
}

- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v26 = *MEMORY[0x263EF8340];
  memset(&v24, 0, sizeof(v24));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length <= [(MTLToolsDevice *)self->super.super.super._device maxVertexSamplers])
  {
    if (length) {
      goto LABEL_5;
    }
LABEL_38:
    _MTLMessageContextEnd();
    goto LABEL_39;
  }
  long long v22 = (const void *)(location + length);
  unint64_t v23 = [(MTLToolsDevice *)self->super.super.super._device maxVertexSamplers];
  _MTLMessageContextPush_();
  if (!length) {
    goto LABEL_38;
  }
LABEL_5:
  uint64_t v8 = 0;
  unint64_t v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(void)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (device = self->super.super.super._device,
            device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v8], "device", @"samplers[%lu] is not an MTLSamplerState.")))
      {
        long long v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0xF) {
      validateArg(MTLArgumentTypeSampler, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 14680), &v24);
    }
    uint64_t v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  _MTLMessageContext v11 = (char *)self + 88 * location;
  unint64_t v12 = v25;
  NSUInteger v13 = length;
  do
  {
    objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v22, v23);
    void *v12 = [(id)*a3 baseObject];
    id v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[14752]) {
        BOOL v15 = 0;
      }
      else {
        BOOL v15 = *((void *)v11 + 1841) == -1;
      }
      if (v15
        && *((void *)v11 + 1836) == 2
        && *((void *)v11 + 1837) == (void)v14
        && (*((void *)v11 + 1839) | *((void *)v11 + 1838) | *((void *)v11 + 1840)) == 0
        && *((_OWORD *)v11 + 921) == 0
        && *(void *)(v11 + 14756) == 0)
      {
        long long v22 = v14;
        MTLReportFailure();
      }
    }
    unint64_t v21 = v11 + 14680;
    v11[14680] = v14 != 0;
    v11[14681] = 0;
    *((void *)v11 + 1836) = 2;
    *((void *)v11 + 1837) = v14;
    *((void *)v11 + 1838) = 0;
    *((void *)v11 + 1839) = 0;
    *((void *)v11 + 1840) = 0;
    *((void *)v11 + 1841) = -1;
    *((void *)v11 + 1842) = 0;
    *((void *)v11 + 1843) = 0;
    v11[14752] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_39:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setVertexSamplerStates:withRange:", v25, location, length);
  *(_DWORD *)&self->_openGLModeEnabled |= 8u;
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  memset(&v19, 0, sizeof(v19));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxVertexSamplers] <= a6)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxVertexSamplers];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)[a3 device]))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a6 <= 0xF) {
    validateArg(MTLArgumentTypeSampler, a6, (MTLDebugFunctionArgument *)&self->_vertexSamplers[a6].type, &v19);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
  id v12 = [(MTLToolsObject *)self baseObject];
  uint64_t v13 = [a3 baseObject];
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  [v12 setVertexSamplerState:v13 lodMinClamp:a6 lodMaxClamp:v14 atIndex:v15];
  p_type = &self->_vertexSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    uint64_t v17 = &p_type[11 * a6];
    if (*((_DWORD *)v17 + 20) == LODWORD(a5)
      && *((_DWORD *)v17 + 19) == LODWORD(a4)
      && *((unsigned char *)v17 + 72)
      && v17[6] == -1
      && v17[1] == 2
      && (id)v17[2] == a3
      && !(v17[4] | v17[3] | v17[5])
      && *(_OWORD *)(v17 + 7) == 0)
    {
      MTLReportFailure();
    }
  }
  unint64_t v18 = &p_type[11 * a6];
  *(unsigned char *)unint64_t v18 = a3 != 0;
  *((unsigned char *)v18 + 1) = 0;
  v18[1] = 2;
  v18[2] = (unint64_t)a3;
  v18[3] = 0;
  v18[4] = 0;
  v18[5] = 0;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((unsigned char *)v18 + 72) = 1;
  *((float *)v18 + 19) = a4;
  *((float *)v18 + 20) = a5;
  *(_DWORD *)&self->_openGLModeEnabled |= 8u;
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7
{
  memset(&v22, 0, sizeof(v22));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxVertexSamplers] <= a7)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxVertexSamplers];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)[a3 device]))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a7 <= 0xF) {
    validateArg(MTLArgumentTypeSampler, a7, (MTLDebugFunctionArgument *)&self->_vertexSamplers[a7].type, &v22);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
  id v14 = [(MTLToolsObject *)self baseObject];
  uint64_t v15 = [a3 baseObject];
  *(float *)&double v16 = a4;
  *(float *)&double v17 = a5;
  *(float *)&double v18 = a6;
  [v14 setVertexSamplerState:v15 lodMinClamp:a7 lodMaxClamp:v16 lodBias:v17 atIndex:v18];
  p_type = &self->_vertexSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    uint64_t v20 = &p_type[11 * a7];
    if (*((_DWORD *)v20 + 20) == LODWORD(a5)
      && *((_DWORD *)v20 + 19) == LODWORD(a4)
      && *((unsigned char *)v20 + 72)
      && v20[6] == -1
      && v20[1] == 2
      && (id)v20[2] == a3
      && !(v20[4] | v20[3] | v20[5])
      && *(_OWORD *)(v20 + 7) == 0)
    {
      MTLReportFailure();
    }
  }
  unint64_t v21 = &p_type[11 * a7];
  *(unsigned char *)unint64_t v21 = a3 != 0;
  *((unsigned char *)v21 + 1) = 0;
  v21[1] = 2;
  v21[2] = (unint64_t)a3;
  v21[3] = 0;
  v21[4] = 0;
  v21[5] = 0;
  v21[6] = -1;
  v21[7] = 0;
  v21[8] = 0;
  *((unsigned char *)v21 + 72) = 1;
  *((float *)v21 + 19) = a4;
  *((float *)v21 + 20) = a5;
  *(_DWORD *)&self->_openGLModeEnabled |= 8u;
}

- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v38 = *MEMORY[0x263EF8340];
  memset(&v36, 0, sizeof(v36));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length > [(MTLToolsDevice *)self->super.super.super._device maxVertexSamplers])
  {
    BOOL v30 = (const void *)(location + length);
    unint64_t v31 = [(MTLToolsDevice *)self->super.super.super._device maxVertexSamplers];
    _MTLMessageContextPush_();
  }
  NSUInteger v34 = length;
  id v35 = self;
  if (length)
  {
    uint64_t v10 = 0;
    NSUInteger v11 = location;
    id v12 = (char *)self + 88 * location;
    do
    {
      if (a3[(void)v10])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (device = v35->super.super.super._device,
              device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v10], "device", @"samplers[%lu] is not an MTLSamplerState.")))
        {
          BOOL v30 = v10;
          _MTLMessageContextPush_();
        }
      }
      if ((unint64_t)v10 + location <= 0xF) {
        validateArg(MTLArgumentTypeSampler, (unint64_t)v10 + location, (MTLDebugFunctionArgument *)(v12 + 14680), &v36);
      }
      uint64_t v10 = (char *)v10 + 1;
      v12 += 88;
    }
    while ((const void *)length != v10);
    _MTLMessageContextEnd();
    NSUInteger v14 = length;
    uint64_t v15 = (uint64_t)&v35->_attachmentInfo[1] + 88 * location;
    double v16 = v37;
    double v18 = a4;
    double v17 = a5;
    do
    {
      objc_msgSend((id)v35->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v30, v31);
      *double v16 = [(id)*a3 baseObject];
      _MTLMessageContext v19 = (_DWORD *)(v15 + 14680);
      uint64_t v20 = *a3;
      int v21 = *(_DWORD *)v18;
      int v22 = *(_DWORD *)v17;
      if (MTLReportFailureTypeEnabled())
      {
        if (*v19 == v22
          && *(_DWORD *)(v15 + 14676) == v21
          && *(unsigned char *)(v15 + 14672) != 0
          && *(void *)(v15 + 14648) == -1
          && *(void *)(v15 + 14608) == 2
          && *(void *)(v15 + 14616) == (void)v20
          && (*(void *)(v15 + 14632) | *(void *)(v15 + 14624) | *(void *)(v15 + 14640)) == 0
          && *(_OWORD *)(v15 + 14656) == 0)
        {
          BOOL v30 = v20;
          MTLReportFailure();
        }
      }
      *(unsigned char *)(v15 + 14600) = v20 != 0;
      *(unsigned char *)(v15 + 14601) = 0;
      *(void *)(v15 + 14608) = 2;
      *(void *)(v15 + 14616) = v20;
      *(void *)(v15 + 14624) = 0;
      *(void *)(v15 + 14632) = 0;
      *(void *)(v15 + 14640) = 0;
      *(void *)(v15 + 14648) = -1;
      *(void *)(v15 + 14656) = 0;
      *(void *)(v15 + 14664) = 0;
      v15 += 88;
      *((unsigned char *)v19 - 8) = 1;
      ++v17;
      ++v18;
      *(v19 - 1) = v21;
      *_MTLMessageContext v19 = v22;
      ++v16;
      ++a3;
      --v14;
    }
    while (v14);
  }
  else
  {
    NSUInteger v11 = location;
    _MTLMessageContextEnd();
  }
  objc_msgSend(-[MTLToolsObject baseObject](v35, "baseObject", v30), "setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v37, a4, a5, v11, v34);
  *(_DWORD *)&v35->_openGLModeEnabled |= 8u;
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  memset(&v12, 0, sizeof(v12));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxFragmentBuffers] <= a5)
  {
    unint64_t v10 = a5;
    unint64_t v11 = [(MTLToolsDevice *)self->super.super.super._device maxFragmentBuffers];
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxFragmentInlineDataSize] < a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxFragmentInlineDataSize];
    _MTLMessageContextPush_();
  }
  if (a5 <= 0x1E) {
    validateArg(MTLArgumentTypeBuffer, a5, (MTLDebugFunctionArgument *)&self->_fragmentBuffers[a5].type, &v12);
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBytes:length:atIndex:", a3, a4, a5);
  MTLReportFailureTypeEnabled();
  p_type = &self->_fragmentBuffers[a5].type;
  *(unsigned char *)p_type = a4 != 0;
  *((unsigned char *)p_type + 1) = 0;
  p_type[1] = 0;
  p_type[2] = 0;
  p_type[3] = 0;
  p_type[4] = a4;
  *(_OWORD *)(p_type + 5) = xmmword_23BE4AC80;
  p_type[7] = 0;
  p_type[8] = 0;
  *((unsigned char *)p_type + 72) = 0;
  *((_DWORD *)p_type + 19) = 0;
  *((_DWORD *)p_type + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x10u;
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  memset(&v14, 0, sizeof(v14));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxFragmentBuffers] > a5)
  {
    if (a3) {
      goto LABEL_5;
    }
LABEL_12:
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  [(MTLToolsDevice *)self->super.super.super._device maxFragmentBuffers];
  _MTLMessageContextPush_();
  if (!a3) {
    goto LABEL_12;
  }
LABEL_5:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    _MTLMessageContextPush_();
LABEL_13:
    unint64_t v10 = 0;
    goto LABEL_14;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  unint64_t v10 = *((void *)a3 + 8);
  if (v10 <= a4) {
    _MTLMessageContextPush_();
  }
LABEL_14:
  if (a5 <= 0x1E) {
    validateArg(MTLArgumentTypeBuffer, a5, (MTLDebugFunctionArgument *)&self->_fragmentBuffers[a5].type, &v14);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
  p_type = &self->_fragmentBuffers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    if (a3)
    {
      _MTLMessageContext v12 = &p_type[11 * a5];
      if (!*((unsigned char *)v12 + 72)
        && v12[6] == -1
        && v12[5] == a4
        && v12[4] == v10
        && (id)v12[2] == a3
        && !(v12[3] | v12[1])
        && *(_OWORD *)(v12 + 7) == 0
        && !*(unint64_t *)((char *)v12 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  uint64_t v13 = &p_type[11 * a5];
  *(unsigned char *)uint64_t v13 = v10 != 0;
  *((unsigned char *)v13 + 1) = 0;
  v13[1] = 0;
  v13[2] = (unint64_t)a3;
  v13[3] = 0;
  v13[4] = v10;
  v13[5] = a4;
  v13[6] = -1;
  v13[7] = 0;
  v13[8] = 0;
  *((unsigned char *)v13 + 72) = 0;
  *((_DWORD *)v13 + 19) = 0;
  *((_DWORD *)v13 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x10u;
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  memset(&v19, 0, sizeof(v19));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxFragmentBuffers] <= a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxFragmentBuffers];
    _MTLMessageContextPush_();
  }
  if (a4 <= 0x1E)
  {
    p_type = (MTLDebugFunctionArgument *)&self->_fragmentBuffers[a4].type;
    validateArg(MTLArgumentTypeBuffer, a4, p_type, &v19);
    object = p_type->object;
    p_object = (id *)&p_type->object;
    uint64_t v8 = object;
    if (!object)
    {
LABEL_9:
      _MTLMessageContextPush_();
      goto LABEL_10;
    }
    if ([(baseLevel *)v8 length] <= a3)
    {
      [*p_object length];
      goto LABEL_9;
    }
  }
LABEL_10:
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBufferOffset:atIndex:", a3, a4);
  unint64_t v11 = &self->_fragmentBuffers[0].type;
  _MTLMessageContext v12 = &self->_fragmentBuffers[a4].type;
  uint64_t v15 = (void *)v12[2];
  _MTLMessageContext v14 = (void **)(v12 + 2);
  uint64_t v13 = v15;
  uint64_t v16 = [v15 length];
  if (MTLReportFailureTypeEnabled())
  {
    if (v13)
    {
      double v17 = &v11[11 * a4];
      if (!*((unsigned char *)v17 + 72)
        && v17[6] == -1
        && v17[5] == a3
        && v17[4] == v16
        && *v14 == v13
        && !(v17[3] | v17[1])
        && *(_OWORD *)(v17 + 7) == 0
        && !*(unint64_t *)((char *)v17 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  double v18 = &v11[11 * a4];
  *(unsigned char *)double v18 = v16 != 0;
  *((unsigned char *)v18 + 1) = 0;
  v18[1] = 0;
  v18[2] = (unint64_t)v13;
  v18[3] = 0;
  v18[4] = v16;
  v18[5] = a3;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((unsigned char *)v18 + 72) = 0;
  *((_DWORD *)v18 + 19) = 0;
  *((_DWORD *)v18 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x10u;
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v8 = self;
  uint64_t v36 = *MEMORY[0x263EF8340];
  memset(&v34, 0, sizeof(v34));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(v8->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length > [(MTLToolsDevice *)v8->super.super.super._device maxFragmentBuffers])
  {
    BOOL v27 = (const void *)(location + length);
    uint64_t v28 = [(MTLToolsDevice *)v8->super.super.super._device maxFragmentBuffers];
    _MTLMessageContextPush_();
  }
  NSUInteger v31 = length;
  if (!length)
  {
    _MTLMessageContextEnd();
    goto LABEL_52;
  }
  unint64_t v9 = 0;
  unint64_t v10 = (char *)v8 + 88 * location;
  do
  {
    if (!a3[(void)v9])
    {
      if (!a4[(void)v9]) {
        goto LABEL_17;
      }
      BOOL v27 = v9;
      uint64_t v28 = a4[(void)v9];
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v27 = v9;
      goto LABEL_16;
    }
    device = v8->super.super.super._device;
    if (device != (MTLToolsDevice *)[(id)a3[(void)v9] device])
    {
      BOOL v27 = v9;
      _MTLMessageContextPush_();
    }
    if (a4[(void)v9] >= *((void *)a3[(void)v9] + 8))
    {
      BOOL v29 = v9;
      uint64_t v30 = *((void *)a3[(void)v9] + 8);
      BOOL v27 = v9;
      uint64_t v28 = a4[(void)v9];
LABEL_16:
      _MTLMessageContextPush_();
    }
LABEL_17:
    if ((unint64_t)v9 + location <= 0x1E) {
      validateArg(MTLArgumentTypeBuffer, (unint64_t)v9 + location, (MTLDebugFunctionArgument *)(v10 + 16088), &v34);
    }
    unint64_t v9 = (char *)v9 + 1;
    v10 += 88;
  }
  while ((const void *)length != v9);
  _MTLMessageContextEnd();
  uint64_t v12 = (uint64_t)(&v8->super.super._commandBuffer + 11 * location);
  NSUInteger v32 = location;
  uint64_t v13 = v35;
  _MTLMessageContext v14 = a4;
  do
  {
    if (*a3) {
      uint64_t v15 = *((void *)*a3 + 8);
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = v8;
    objc_msgSend((id)v8->_maxVertexBuffers, "addObject:retained:purgeable:", v27, v28, v29, v30);
    *uint64_t v13 = [(id)*a3 baseObject];
    uint64_t v17 = v12 + 16088;
    double v18 = *a3;
    unint64_t v19 = *v14;
    if (MTLReportFailureTypeEnabled() && v18)
    {
      if (*(unsigned char *)(v12 + 16120)) {
        BOOL v20 = 0;
      }
      else {
        BOOL v20 = *(void *)(v12 + 16096) == -1;
      }
      if (v20
        && *(void *)v17 == v19
        && *(void *)(v12 + 16080) == v15
        && *(void *)(v12 + 16064) == (void)v18
        && (*(void *)(v12 + 16072) | *(void *)(v12 + 16056)) == 0
        && *(_OWORD *)(v12 + 16104) == 0
        && *(void *)(v12 + 16124) == 0)
      {
        BOOL v27 = v18;
        MTLReportFailure();
      }
    }
    *(unsigned char *)(v12 + 16048) = v15 != 0;
    *(unsigned char *)(v12 + 16049) = 0;
    *(void *)(v12 + 16056) = 0;
    *(void *)(v12 + 16064) = v18;
    *(void *)(v12 + 16072) = 0;
    *(void *)(v12 + 16080) = v15;
    *(void *)uint64_t v17 = v19;
    *(void *)(v12 + 16096) = -1;
    *(void *)(v12 + 16104) = 0;
    *(void *)(v12 + 16112) = 0;
    *(unsigned char *)(v12 + 16120) = 0;
    v12 += 88;
    ++v14;
    ++v13;
    ++a3;
    *(_DWORD *)(v17 + 36) = 0;
    *(_DWORD *)(v17 + 40) = 0;
    --length;
    uint64_t v8 = v16;
    NSUInteger location = v32;
  }
  while (length);
LABEL_52:
  objc_msgSend(-[MTLToolsObject baseObject](v8, "baseObject", v27), "setFragmentBuffers:offsets:withRange:", v35, a4, location, v31);
  *(_DWORD *)&v8->_openGLModeEnabled |= 0x10u;
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  memset(&v13, 0, sizeof(v13));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxFragmentTextures] <= a4)
  {
    unint64_t v11 = a4;
    unint64_t v12 = [(MTLToolsDevice *)self->super.super.super._device maxFragmentTextures];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_10;
    }
  }
  else if (!a3)
  {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "storageMode", v11, v12) == 3) {
LABEL_9:
  }
    _MTLMessageContextPush_();
LABEL_10:
  if (a4 <= 0x7F) {
    validateArg(MTLArgumentTypeTexture, a4, (MTLDebugFunctionArgument *)&self->_fragmentTextures[a4].type, &v13);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_fragmentTextures[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    unint64_t v9 = &p_type[11 * a4];
    if (!*((unsigned char *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 1
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  unint64_t v10 = &p_type[11 * a4];
  *(unsigned char *)unint64_t v10 = a3 != 0;
  *((unsigned char *)v10 + 1) = 0;
  v10[1] = 1;
  v10[2] = (unint64_t)a3;
  v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((unsigned char *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x20u;
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v26 = *MEMORY[0x263EF8340];
  memset(&v24, 0, sizeof(v24));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length <= [(MTLToolsDevice *)self->super.super.super._device maxFragmentTextures])
  {
    if (length) {
      goto LABEL_5;
    }
LABEL_40:
    _MTLMessageContextEnd();
    goto LABEL_41;
  }
  int v22 = (const void *)(location + length);
  unint64_t v23 = [(MTLToolsDevice *)self->super.super.super._device maxFragmentTextures];
  _MTLMessageContextPush_();
  if (!length) {
    goto LABEL_40;
  }
LABEL_5:
  uint64_t v8 = 0;
  unint64_t v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(void)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_11;
      }
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v8], "device", @"textures[%lu] is not an MTLTexture."))
      {
        int v22 = v8;
        _MTLMessageContextPush_();
      }
      if (objc_msgSend((id)a3[(void)v8], "storageMode", v22, v23) == 3)
      {
LABEL_11:
        int v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0x7F) {
      validateArg(MTLArgumentTypeTexture, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 18816), &v24);
    }
    uint64_t v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  unint64_t v11 = (char *)self + 88 * location;
  unint64_t v12 = v25;
  NSUInteger v13 = length;
  do
  {
    objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 1, v22);
    void *v12 = [(id)*a3 baseObject];
    _MTLMessageContext v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[18888]) {
        BOOL v15 = 0;
      }
      else {
        BOOL v15 = *((void *)v11 + 2358) == -1;
      }
      if (v15
        && *((void *)v11 + 2353) == 1
        && *((void *)v11 + 2354) == (void)v14
        && (*((void *)v11 + 2356) | *((void *)v11 + 2355) | *((void *)v11 + 2357)) == 0
        && *(_OWORD *)(v11 + 18872) == 0
        && *(void *)(v11 + 18892) == 0)
      {
        int v22 = v14;
        MTLReportFailure();
      }
    }
    int v21 = v11 + 18816;
    v11[18816] = v14 != 0;
    v11[18817] = 0;
    *((void *)v11 + 2353) = 1;
    *((void *)v11 + 2354) = v14;
    *((void *)v11 + 2355) = 0;
    *((void *)v11 + 2356) = 0;
    *((void *)v11 + 2357) = 0;
    *((void *)v11 + 2358) = -1;
    *((void *)v11 + 2359) = 0;
    *((void *)v11 + 2360) = 0;
    v11[18888] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_41:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setFragmentTextures:withRange:", v25, location, length);
  *(_DWORD *)&self->_openGLModeEnabled |= 0x20u;
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  memset(&v11, 0, sizeof(v11));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxFragmentSamplers] <= a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxFragmentSamplers];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)[a3 device]))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a4 <= 0xF) {
    validateArg(MTLArgumentTypeSampler, a4, (MTLDebugFunctionArgument *)&self->_fragmentSamplers[a4].type, &v11);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_fragmentSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    unint64_t v9 = &p_type[11 * a4];
    if (!*((unsigned char *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 2
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  unint64_t v10 = &p_type[11 * a4];
  *(unsigned char *)unint64_t v10 = a3 != 0;
  *((unsigned char *)v10 + 1) = 0;
  v10[1] = 2;
  v10[2] = (unint64_t)a3;
  v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((unsigned char *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x40u;
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v26 = *MEMORY[0x263EF8340];
  memset(&v24, 0, sizeof(v24));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length <= [(MTLToolsDevice *)self->super.super.super._device maxFragmentSamplers])
  {
    if (length) {
      goto LABEL_5;
    }
LABEL_38:
    _MTLMessageContextEnd();
    goto LABEL_39;
  }
  int v22 = (const void *)(location + length);
  unint64_t v23 = [(MTLToolsDevice *)self->super.super.super._device maxFragmentSamplers];
  _MTLMessageContextPush_();
  if (!length) {
    goto LABEL_38;
  }
LABEL_5:
  uint64_t v8 = 0;
  unint64_t v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(void)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (device = self->super.super.super._device,
            device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v8], "device", @"samplers[%lu] is not an MTLSamplerState.")))
      {
        int v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0xF) {
      validateArg(MTLArgumentTypeSampler, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 30080), &v24);
    }
    uint64_t v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  _MTLMessageContext v11 = (char *)self + 88 * location;
  unint64_t v12 = v25;
  NSUInteger v13 = length;
  do
  {
    objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v22, v23);
    void *v12 = [(id)*a3 baseObject];
    _MTLMessageContext v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[30152]) {
        BOOL v15 = 0;
      }
      else {
        BOOL v15 = *((void *)v11 + 3766) == -1;
      }
      if (v15
        && *((void *)v11 + 3761) == 2
        && *((void *)v11 + 3762) == (void)v14
        && (*((void *)v11 + 3764) | *((void *)v11 + 3763) | *((void *)v11 + 3765)) == 0
        && *(_OWORD *)(v11 + 30136) == 0
        && *(void *)(v11 + 30156) == 0)
      {
        int v22 = v14;
        MTLReportFailure();
      }
    }
    int v21 = v11 + 30080;
    v11[30080] = v14 != 0;
    v11[30081] = 0;
    *((void *)v11 + 3761) = 2;
    *((void *)v11 + 3762) = v14;
    *((void *)v11 + 3763) = 0;
    *((void *)v11 + 3764) = 0;
    *((void *)v11 + 3765) = 0;
    *((void *)v11 + 3766) = -1;
    *((void *)v11 + 3767) = 0;
    *((void *)v11 + 3768) = 0;
    v11[30152] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_39:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setFragmentSamplerStates:withRange:", v25, location, length);
  *(_DWORD *)&self->_openGLModeEnabled |= 0x40u;
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  memset(&v19, 0, sizeof(v19));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxFragmentSamplers] <= a6)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxFragmentSamplers];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)[a3 device]))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a6 <= 0xF) {
    validateArg(MTLArgumentTypeSampler, a6, (MTLDebugFunctionArgument *)&self->_fragmentSamplers[a6].type, &v19);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
  id v12 = [(MTLToolsObject *)self baseObject];
  uint64_t v13 = [a3 baseObject];
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  [v12 setFragmentSamplerState:v13 lodMinClamp:a6 lodMaxClamp:v14 atIndex:v15];
  p_type = &self->_fragmentSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    uint64_t v17 = &p_type[11 * a6];
    if (*((_DWORD *)v17 + 20) == LODWORD(a5)
      && *((_DWORD *)v17 + 19) == LODWORD(a4)
      && *((unsigned char *)v17 + 72)
      && v17[6] == -1
      && v17[1] == 2
      && (id)v17[2] == a3
      && !(v17[4] | v17[3] | v17[5])
      && *(_OWORD *)(v17 + 7) == 0)
    {
      MTLReportFailure();
    }
  }
  double v18 = &p_type[11 * a6];
  *(unsigned char *)double v18 = a3 != 0;
  *((unsigned char *)v18 + 1) = 0;
  v18[1] = 2;
  v18[2] = (unint64_t)a3;
  v18[3] = 0;
  v18[4] = 0;
  v18[5] = 0;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((unsigned char *)v18 + 72) = 1;
  *((float *)v18 + 19) = a4;
  *((float *)v18 + 20) = a5;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x40u;
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7
{
  memset(&v22, 0, sizeof(v22));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxFragmentSamplers] <= a7)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxFragmentSamplers];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)[a3 device]))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a7 <= 0xF) {
    validateArg(MTLArgumentTypeSampler, a7, (MTLDebugFunctionArgument *)&self->_fragmentSamplers[a7].type, &v22);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
  id v14 = [(MTLToolsObject *)self baseObject];
  uint64_t v15 = [a3 baseObject];
  *(float *)&double v16 = a4;
  *(float *)&double v17 = a5;
  *(float *)&double v18 = a6;
  [v14 setFragmentSamplerState:v15 lodMinClamp:a7 lodMaxClamp:v16 lodBias:v17 atIndex:v18];
  p_type = &self->_fragmentSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    BOOL v20 = &p_type[11 * a7];
    if (*((_DWORD *)v20 + 20) == LODWORD(a5)
      && *((_DWORD *)v20 + 19) == LODWORD(a4)
      && *((unsigned char *)v20 + 72)
      && v20[6] == -1
      && v20[1] == 2
      && (id)v20[2] == a3
      && !(v20[4] | v20[3] | v20[5])
      && *(_OWORD *)(v20 + 7) == 0)
    {
      MTLReportFailure();
    }
  }
  int v21 = &p_type[11 * a7];
  *(unsigned char *)int v21 = a3 != 0;
  *((unsigned char *)v21 + 1) = 0;
  v21[1] = 2;
  v21[2] = (unint64_t)a3;
  v21[3] = 0;
  v21[4] = 0;
  v21[5] = 0;
  v21[6] = -1;
  v21[7] = 0;
  v21[8] = 0;
  *((unsigned char *)v21 + 72) = 1;
  *((float *)v21 + 19) = a4;
  *((float *)v21 + 20) = a5;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x40u;
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v38 = *MEMORY[0x263EF8340];
  memset(&v36, 0, sizeof(v36));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length > [(MTLToolsDevice *)self->super.super.super._device maxFragmentSamplers])
  {
    uint64_t v30 = (const void *)(location + length);
    unint64_t v31 = [(MTLToolsDevice *)self->super.super.super._device maxFragmentSamplers];
    _MTLMessageContextPush_();
  }
  NSUInteger v34 = length;
  id v35 = self;
  if (length)
  {
    unint64_t v10 = 0;
    NSUInteger v11 = location;
    id v12 = (char *)self + 88 * location;
    do
    {
      if (a3[(void)v10])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (device = v35->super.super.super._device,
              device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v10], "device", @"samplers[%lu] is not an MTLSamplerState.")))
        {
          uint64_t v30 = v10;
          _MTLMessageContextPush_();
        }
      }
      if ((unint64_t)v10 + location <= 0xF) {
        validateArg(MTLArgumentTypeSampler, (unint64_t)v10 + location, (MTLDebugFunctionArgument *)(v12 + 30080), &v36);
      }
      unint64_t v10 = (char *)v10 + 1;
      v12 += 88;
    }
    while ((const void *)length != v10);
    _MTLMessageContextEnd();
    NSUInteger v14 = length;
    uint64_t v15 = (uint64_t)&v35->_attachmentInfo[1] + 88 * location;
    double v16 = v37;
    double v18 = a4;
    double v17 = a5;
    do
    {
      objc_msgSend((id)v35->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v30, v31);
      *double v16 = [(id)*a3 baseObject];
      _MTLMessageContext v19 = (_DWORD *)(v15 + 30080);
      BOOL v20 = *a3;
      int v21 = *(_DWORD *)v18;
      int v22 = *(_DWORD *)v17;
      if (MTLReportFailureTypeEnabled())
      {
        if (*v19 == v22
          && *(_DWORD *)(v15 + 30076) == v21
          && *(unsigned char *)(v15 + 30072) != 0
          && *(void *)(v15 + 30048) == -1
          && *(void *)(v15 + 30008) == 2
          && *(void *)(v15 + 30016) == (void)v20
          && (*(void *)(v15 + 30032) | *(void *)(v15 + 30024) | *(void *)(v15 + 30040)) == 0
          && *(_OWORD *)(v15 + 30056) == 0)
        {
          uint64_t v30 = v20;
          MTLReportFailure();
        }
      }
      *(unsigned char *)(v15 + 30000) = v20 != 0;
      *(unsigned char *)(v15 + 30001) = 0;
      *(void *)(v15 + 30008) = 2;
      *(void *)(v15 + 30016) = v20;
      *(void *)(v15 + 30024) = 0;
      *(void *)(v15 + 30032) = 0;
      *(void *)(v15 + 30040) = 0;
      *(void *)(v15 + 30048) = -1;
      *(void *)(v15 + 30056) = 0;
      *(void *)(v15 + 30064) = 0;
      v15 += 88;
      *((unsigned char *)v19 - 8) = 1;
      ++v17;
      ++v18;
      *(v19 - 1) = v21;
      *_MTLMessageContext v19 = v22;
      ++v16;
      ++a3;
      --v14;
    }
    while (v14);
  }
  else
  {
    NSUInteger v11 = location;
    _MTLMessageContextEnd();
  }
  objc_msgSend(-[MTLToolsObject baseObject](v35, "baseObject", v30), "setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v37, a4, a5, v11, v34);
  *(_DWORD *)&v35->_openGLModeEnabled |= 0x40u;
}

- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6
{
  memset(&v20, 0, sizeof(v20));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxFragmentTextures] <= a4)
  {
    unint64_t v18 = a4;
    unint64_t v19 = [(MTLToolsDevice *)self->super.super.super._device maxFragmentTextures];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_10;
    }
  }
  else if (!a3)
  {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "storageMode", v18, v19) == 3) {
LABEL_9:
  }
    _MTLMessageContextPush_();
LABEL_10:
  if ([(MTLToolsDevice *)self->super.super.super._device maxFragmentSamplers] <= a6)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxFragmentSamplers];
    _MTLMessageContextPush_();
    if (!a5) {
      goto LABEL_15;
    }
  }
  else if (!a5)
  {
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (id v12 = self->super.super.super._device, v12 != (MTLToolsDevice *)[a5 device]))
  {
    _MTLMessageContextPush_();
  }
LABEL_15:
  if (a4 <= 0x7F) {
    validateArg(MTLArgumentTypeTexture, a4, (MTLDebugFunctionArgument *)&self->_fragmentTextures[a4].type, &v20);
  }
  if (a6 <= 0xF) {
    validateArg(MTLArgumentTypeSampler, a6, (MTLDebugFunctionArgument *)&self->_fragmentSamplers[a6].type, &v20);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  [self->_maxVertexBuffers addObject:a5 retained:1 purgeable:0];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentTexture:atTextureIndex:samplerState:atSamplerIndex:", objc_msgSend(a3, "baseObject"), a4, objc_msgSend(a5, "baseObject"), a6);
  p_type = &self->_fragmentTextures[a4].type;
  if (MTLReportFailureTypeEnabled())
  {
    NSUInteger v14 = &self->_fragmentTextures[a4].type;
    if (!*((unsigned char *)v14 + 72)
      && v14[6] == -1
      && v14[1] == 1
      && (id)v14[2] == a3
      && !(v14[4] | v14[3] | v14[5])
      && *(_OWORD *)(v14 + 7) == 0
      && !*(unint64_t *)((char *)v14 + 76))
    {
      MTLReportFailure();
    }
  }
  *(unsigned char *)p_type = a3 != 0;
  *((unsigned char *)p_type + 1) = 0;
  p_type[1] = 1;
  p_type[2] = (unint64_t)a3;
  p_type[3] = 0;
  p_type[4] = 0;
  p_type[5] = 0;
  p_type[6] = -1;
  p_type[7] = 0;
  p_type[8] = 0;
  *((unsigned char *)p_type + 72) = 0;
  *((_DWORD *)p_type + 19) = 0;
  *((_DWORD *)p_type + 20) = 0;
  uint64_t v15 = &self->_fragmentSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    double v16 = &v15[11 * a6];
    if (!*((unsigned char *)v16 + 72)
      && v16[6] == -1
      && v16[1] == 2
      && (id)v16[2] == a5
      && !(v16[4] | v16[3] | v16[5])
      && *(_OWORD *)(v16 + 7) == 0
      && !*(unint64_t *)((char *)v16 + 76))
    {
      MTLReportFailure();
    }
  }
  double v17 = &v15[11 * a6];
  *(unsigned char *)double v17 = a5 != 0;
  *((unsigned char *)v17 + 1) = 0;
  v17[1] = 2;
  v17[2] = (unint64_t)a5;
  v17[3] = 0;
  v17[4] = 0;
  v17[5] = 0;
  v17[6] = -1;
  v17[7] = 0;
  v17[8] = 0;
  *((unsigned char *)v17 + 72) = 0;
  *((_DWORD *)v17 + 19) = 0;
  *((_DWORD *)v17 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x20u;
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  memset(&v12, 0, sizeof(v12));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxTileBuffers] <= a5)
  {
    unint64_t v10 = a5;
    unint64_t v11 = [(MTLToolsDevice *)self->super.super.super._device maxTileBuffers];
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxTileInlineDataSize] < a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxTileInlineDataSize];
    _MTLMessageContextPush_();
  }
  if (a5 <= 0x1E) {
    validateArg(MTLArgumentTypeBuffer, a5, (MTLDebugFunctionArgument *)&self->_tileBuffers[a5].type, &v12);
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBytes:length:atIndex:", a3, a4, a5);
  MTLReportFailureTypeEnabled();
  p_type = &self->_tileBuffers[a5].type;
  *(unsigned char *)p_type = a4 != 0;
  *((unsigned char *)p_type + 1) = 0;
  p_type[1] = 0;
  p_type[2] = 0;
  p_type[3] = 0;
  p_type[4] = a4;
  *(_OWORD *)(p_type + 5) = xmmword_23BE4AC80;
  p_type[7] = 0;
  p_type[8] = 0;
  *((unsigned char *)p_type + 72) = 0;
  *((_DWORD *)p_type + 19) = 0;
  *((_DWORD *)p_type + 20) = 0;
}

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  memset(&v16, 0, sizeof(v16));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxTileBuffers] <= a5)
  {
    unint64_t v14 = a5;
    unint64_t v15 = [(MTLToolsDevice *)self->super.super.super._device maxTileBuffers];
    _MTLMessageContextPush_();
    if (a3) {
      goto LABEL_5;
    }
LABEL_12:
    if (a4) {
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  if (!a3) {
    goto LABEL_12;
  }
LABEL_5:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    _MTLMessageContextPush_();
    goto LABEL_13;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "length", v14, v15) <= a4)
  {
    [a3 length];
    goto LABEL_10;
  }
LABEL_13:
  if (a5 <= 0x1E) {
    validateArg(MTLArgumentTypeBuffer, a5, (MTLDebugFunctionArgument *)&self->_tileBuffers[a5].type, &v16);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
  p_type = &self->_tileBuffers[0].type;
  uint64_t v11 = [a3 length];
  if (MTLReportFailureTypeEnabled())
  {
    if (a3)
    {
      _MTLMessageContext v12 = &p_type[11 * a5];
      if (!*((unsigned char *)v12 + 72)
        && v12[6] == -1
        && v12[5] == a4
        && v12[4] == v11
        && (id)v12[2] == a3
        && !(v12[3] | v12[1])
        && *(_OWORD *)(v12 + 7) == 0
        && !*(unint64_t *)((char *)v12 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  uint64_t v13 = &p_type[11 * a5];
  *(unsigned char *)uint64_t v13 = v11 != 0;
  *((unsigned char *)v13 + 1) = 0;
  v13[1] = 0;
  v13[2] = (unint64_t)a3;
  v13[3] = 0;
  v13[4] = v11;
  v13[5] = a4;
  v13[6] = -1;
  v13[7] = 0;
  v13[8] = 0;
  *((unsigned char *)v13 + 72) = 0;
  *((_DWORD *)v13 + 19) = 0;
  *((_DWORD *)v13 + 20) = 0;
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  memset(&v19, 0, sizeof(v19));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxTileBuffers] <= a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxTileBuffers];
    _MTLMessageContextPush_();
  }
  if (a4 <= 0x1E)
  {
    p_type = (MTLDebugFunctionArgument *)&self->_tileBuffers[a4].type;
    validateArg(MTLArgumentTypeBuffer, a4, p_type, &v19);
    object = p_type->object;
    p_object = (id *)&p_type->object;
    uint64_t v8 = object;
    if (!object)
    {
LABEL_9:
      _MTLMessageContextPush_();
      goto LABEL_10;
    }
    if ([(baseLevel *)v8 length] <= a3)
    {
      [*p_object length];
      goto LABEL_9;
    }
  }
LABEL_10:
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBufferOffset:atIndex:", a3, a4);
  uint64_t v11 = &self->_tileBuffers[0].type;
  _MTLMessageContext v12 = &self->_tileBuffers[a4].type;
  unint64_t v15 = (void *)v12[2];
  unint64_t v14 = (void **)(v12 + 2);
  uint64_t v13 = v15;
  uint64_t v16 = [v15 length];
  if (MTLReportFailureTypeEnabled())
  {
    if (v13)
    {
      double v17 = &v11[11 * a4];
      if (!*((unsigned char *)v17 + 72)
        && v17[6] == -1
        && v17[5] == a3
        && v17[4] == v16
        && *v14 == v13
        && !(v17[3] | v17[1])
        && *(_OWORD *)(v17 + 7) == 0
        && !*(unint64_t *)((char *)v17 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  unint64_t v18 = &v11[11 * a4];
  *(unsigned char *)unint64_t v18 = v16 != 0;
  *((unsigned char *)v18 + 1) = 0;
  v18[1] = 0;
  v18[2] = (unint64_t)v13;
  v18[3] = 0;
  v18[4] = v16;
  v18[5] = a3;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((unsigned char *)v18 + 72) = 0;
  *((_DWORD *)v18 + 19) = 0;
  *((_DWORD *)v18 + 20) = 0;
}

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  unint64_t v9 = self;
  uint64_t v41 = *MEMORY[0x263EF8340];
  memset(&v39, 0, sizeof(v39));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(v9->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length > [(MTLToolsDevice *)v9->super.super.super._device maxTileBuffers])
  {
    unint64_t v31 = (const void *)(location + length);
    uint64_t v32 = [(MTLToolsDevice *)v9->super.super.super._device maxTileBuffers];
    _MTLMessageContextPush_();
  }
  NSUInteger v36 = location;
  NSUInteger v37 = length;
  id v35 = a4;
  if (!length)
  {
    _MTLMessageContextEnd();
    goto LABEL_49;
  }
  unint64_t v10 = 0;
  uint64_t v38 = v9;
  uint64_t v11 = (char *)v9 + 88 * location;
  do
  {
    if (!a3[(void)v10])
    {
      if (!a4[(void)v10]) {
        goto LABEL_17;
      }
      unint64_t v31 = v10;
      uint64_t v32 = a4[(void)v10];
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unint64_t v31 = v10;
      goto LABEL_16;
    }
    device = v38->super.super.super._device;
    if (device != (MTLToolsDevice *)[(id)a3[(void)v10] device])
    {
      unint64_t v31 = v10;
      _MTLMessageContextPush_();
    }
    unint64_t v13 = a4[(void)v10];
    if (v13 >= objc_msgSend((id)a3[(void)v10], "length", v31, v32, v33, v34))
    {
      unint64_t v14 = a4[(void)v10];
      v33 = v10;
      uint64_t v34 = [(id)a3[(void)v10] length];
      unint64_t v31 = v10;
      uint64_t v32 = v14;
LABEL_16:
      _MTLMessageContextPush_();
    }
LABEL_17:
    if ((unint64_t)v10 + location <= 0x1E) {
      validateArg(MTLArgumentTypeBuffer, (unint64_t)v10 + location, (MTLDebugFunctionArgument *)(v11 + 31488), &v39);
    }
    unint64_t v10 = (char *)v10 + 1;
    v11 += 88;
  }
  while ((const void *)length != v10);
  _MTLMessageContextEnd();
  unint64_t v9 = v38;
  unint64_t v15 = a4;
  uint64_t v16 = (uint64_t)(&v38->super.super._commandBuffer + 11 * v36);
  double v17 = v40;
  NSUInteger v18 = length;
  do
  {
    objc_msgSend((id)v9->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 1, v31);
    *double v17 = [(id)*a3 baseObject];
    uint64_t v19 = v16 + 31488;
    _MTLMessageContext v20 = *a3;
    uint64_t v21 = [(id)*a3 length];
    uint64_t v23 = *v15++;
    uint64_t v22 = v23;
    if (MTLReportFailureTypeEnabled() && v20)
    {
      if (*(unsigned char *)(v16 + 31520)) {
        BOOL v24 = 0;
      }
      else {
        BOOL v24 = *(void *)(v16 + 31496) == -1;
      }
      if (v24
        && *(void *)v19 == v22
        && *(void *)(v16 + 31480) == v21
        && *(void *)(v16 + 31464) == (void)v20
        && (*(void *)(v16 + 31472) | *(void *)(v16 + 31456)) == 0
        && *(_OWORD *)(v16 + 31504) == 0
        && *(void *)(v16 + 31524) == 0)
      {
        unint64_t v31 = v20;
        MTLReportFailure();
      }
    }
    *(unsigned char *)(v16 + 31448) = v21 != 0;
    *(unsigned char *)(v16 + 31449) = 0;
    *(void *)(v16 + 31456) = 0;
    *(void *)(v16 + 31464) = v20;
    *(void *)(v16 + 31472) = 0;
    *(void *)(v16 + 31480) = v21;
    *(void *)uint64_t v19 = v22;
    *(void *)(v16 + 31496) = -1;
    *(void *)(v16 + 31504) = 0;
    *(void *)(v16 + 31512) = 0;
    *(unsigned char *)(v16 + 31520) = 0;
    v16 += 88;
    ++v17;
    ++a3;
    *(_DWORD *)(v19 + 36) = 0;
    *(_DWORD *)(v19 + 40) = 0;
    --v18;
    unint64_t v9 = v38;
  }
  while (v18);
LABEL_49:
  objc_msgSend(-[MTLToolsObject baseObject](v9, "baseObject", v31), "setTileBuffers:offsets:withRange:", v40, v35, v36, v37);
}

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
{
  memset(&v11, 0, sizeof(v11));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxTileTextures] <= a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxTileTextures];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)[a3 device]))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a4 <= 0x7F) {
    validateArg(MTLArgumentTypeTexture, a4, (MTLDebugFunctionArgument *)&self->_tileTextures[a4].type, &v11);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_tileTextures[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    unint64_t v9 = &p_type[11 * a4];
    if (!*((unsigned char *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 1
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  unint64_t v10 = &p_type[11 * a4];
  *(unsigned char *)unint64_t v10 = a3 != 0;
  *((unsigned char *)v10 + 1) = 0;
  v10[1] = 1;
  v10[2] = (unint64_t)a3;
  v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((unsigned char *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
}

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v26 = *MEMORY[0x263EF8340];
  memset(&v24, 0, sizeof(v24));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length <= [(MTLToolsDevice *)self->super.super.super._device maxTileTextures])
  {
    if (length) {
      goto LABEL_5;
    }
LABEL_38:
    _MTLMessageContextEnd();
    goto LABEL_39;
  }
  uint64_t v22 = (const void *)(location + length);
  unint64_t v23 = [(MTLToolsDevice *)self->super.super.super._device maxTileTextures];
  _MTLMessageContextPush_();
  if (!length) {
    goto LABEL_38;
  }
LABEL_5:
  uint64_t v8 = 0;
  unint64_t v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(void)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (device = self->super.super.super._device,
            device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v8], "device", @"textures[%lu] is not an MTLTexture.")))
      {
        uint64_t v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0x7F) {
      validateArg(MTLArgumentTypeTexture, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 34216), &v24);
    }
    uint64_t v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  _MTLMessageContext v11 = (char *)self + 88 * location;
  _MTLMessageContext v12 = v25;
  NSUInteger v13 = length;
  do
  {
    objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 1, v22, v23);
    void *v12 = [(id)*a3 baseObject];
    unint64_t v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[34288]) {
        BOOL v15 = 0;
      }
      else {
        BOOL v15 = *((void *)v11 + 4283) == -1;
      }
      if (v15
        && *((void *)v11 + 4278) == 1
        && *((void *)v11 + 4279) == (void)v14
        && (*((void *)v11 + 4281) | *((void *)v11 + 4280) | *((void *)v11 + 4282)) == 0
        && *((_OWORD *)v11 + 2142) == 0
        && *(void *)(v11 + 34292) == 0)
      {
        uint64_t v22 = v14;
        MTLReportFailure();
      }
    }
    uint64_t v21 = v11 + 34216;
    v11[34216] = v14 != 0;
    v11[34217] = 0;
    *((void *)v11 + 4278) = 1;
    *((void *)v11 + 4279) = v14;
    *((void *)v11 + 4280) = 0;
    *((void *)v11 + 4281) = 0;
    *((void *)v11 + 4282) = 0;
    *((void *)v11 + 4283) = -1;
    *((void *)v11 + 4284) = 0;
    *((void *)v11 + 4285) = 0;
    v11[34288] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_39:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setTileTextures:withRange:", v25, location, length);
}

- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  memset(&v11, 0, sizeof(v11));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxTileSamplers] <= a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxTileSamplers];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)[a3 device]))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a4 <= 0xF) {
    validateArg(MTLArgumentTypeSampler, a4, (MTLDebugFunctionArgument *)&self->_tileSamplers[a4].type, &v11);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_tileSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    unint64_t v9 = &p_type[11 * a4];
    if (!*((unsigned char *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 2
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  unint64_t v10 = &p_type[11 * a4];
  *(unsigned char *)unint64_t v10 = a3 != 0;
  *((unsigned char *)v10 + 1) = 0;
  v10[1] = 2;
  v10[2] = (unint64_t)a3;
  v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((unsigned char *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
}

- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v26 = *MEMORY[0x263EF8340];
  memset(&v24, 0, sizeof(v24));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length <= [(MTLToolsDevice *)self->super.super.super._device maxTileSamplers])
  {
    if (length) {
      goto LABEL_5;
    }
LABEL_38:
    _MTLMessageContextEnd();
    goto LABEL_39;
  }
  uint64_t v22 = (const void *)(location + length);
  unint64_t v23 = [(MTLToolsDevice *)self->super.super.super._device maxTileSamplers];
  _MTLMessageContextPush_();
  if (!length) {
    goto LABEL_38;
  }
LABEL_5:
  uint64_t v8 = 0;
  unint64_t v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(void)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (device = self->super.super.super._device,
            device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v8], "device", @"samplers[%lu] is not an MTLSamplerState.")))
      {
        uint64_t v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0xF) {
      validateArg(MTLArgumentTypeSampler, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 45480), &v24);
    }
    uint64_t v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  _MTLMessageContext v11 = (char *)self + 88 * location;
  _MTLMessageContext v12 = v25;
  NSUInteger v13 = length;
  do
  {
    objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v22, v23);
    void *v12 = [(id)*a3 baseObject];
    unint64_t v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[45552]) {
        BOOL v15 = 0;
      }
      else {
        BOOL v15 = *((void *)v11 + 5691) == -1;
      }
      if (v15
        && *((void *)v11 + 5686) == 2
        && *((void *)v11 + 5687) == (void)v14
        && (*((void *)v11 + 5689) | *((void *)v11 + 5688) | *((void *)v11 + 5690)) == 0
        && *((_OWORD *)v11 + 2846) == 0
        && *(void *)(v11 + 45556) == 0)
      {
        uint64_t v22 = v14;
        MTLReportFailure();
      }
    }
    uint64_t v21 = v11 + 45480;
    v11[45480] = v14 != 0;
    v11[45481] = 0;
    *((void *)v11 + 5686) = 2;
    *((void *)v11 + 5687) = v14;
    *((void *)v11 + 5688) = 0;
    *((void *)v11 + 5689) = 0;
    *((void *)v11 + 5690) = 0;
    *((void *)v11 + 5691) = -1;
    *((void *)v11 + 5692) = 0;
    *((void *)v11 + 5693) = 0;
    v11[45552] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_39:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setTileSamplerStates:withRange:", v25, location, length);
}

- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  memset(&v19, 0, sizeof(v19));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxTileSamplers] <= a6)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxTileSamplers];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)[a3 device]))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a6 <= 0xF) {
    validateArg(MTLArgumentTypeSampler, a6, (MTLDebugFunctionArgument *)&self->_tileSamplers[a6].type, &v19);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
  id v12 = [(MTLToolsObject *)self baseObject];
  uint64_t v13 = [a3 baseObject];
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  [v12 setTileSamplerState:v13 lodMinClamp:a6 lodMaxClamp:v14 atIndex:v15];
  p_type = &self->_tileSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    double v17 = &p_type[11 * a6];
    if (*((_DWORD *)v17 + 20) == LODWORD(a5)
      && *((_DWORD *)v17 + 19) == LODWORD(a4)
      && *((unsigned char *)v17 + 72)
      && v17[6] == -1
      && v17[1] == 2
      && (id)v17[2] == a3
      && !(v17[4] | v17[3] | v17[5])
      && *(_OWORD *)(v17 + 7) == 0)
    {
      MTLReportFailure();
    }
  }
  NSUInteger v18 = &p_type[11 * a6];
  *(unsigned char *)NSUInteger v18 = a3 != 0;
  *((unsigned char *)v18 + 1) = 0;
  v18[1] = 2;
  v18[2] = (unint64_t)a3;
  v18[3] = 0;
  v18[4] = 0;
  v18[5] = 0;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((unsigned char *)v18 + 72) = 1;
  *((float *)v18 + 19) = a4;
  *((float *)v18 + 20) = a5;
}

- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v38 = *MEMORY[0x263EF8340];
  memset(&v36, 0, sizeof(v36));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length > [(MTLToolsDevice *)self->super.super.super._device maxTileSamplers])
  {
    uint64_t v30 = (const void *)(location + length);
    unint64_t v31 = [(MTLToolsDevice *)self->super.super.super._device maxTileSamplers];
    _MTLMessageContextPush_();
  }
  NSUInteger v34 = length;
  id v35 = self;
  if (length)
  {
    unint64_t v10 = 0;
    NSUInteger v11 = location;
    id v12 = (char *)self + 88 * location;
    do
    {
      if (a3[(void)v10])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (device = v35->super.super.super._device,
              device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v10], "device", @"samplers[%lu] is not an MTLSamplerState.")))
        {
          uint64_t v30 = v10;
          _MTLMessageContextPush_();
        }
      }
      if ((unint64_t)v10 + location <= 0xF) {
        validateArg(MTLArgumentTypeSampler, (unint64_t)v10 + location, (MTLDebugFunctionArgument *)(v12 + 45480), &v36);
      }
      unint64_t v10 = (char *)v10 + 1;
      v12 += 88;
    }
    while ((const void *)length != v10);
    _MTLMessageContextEnd();
    NSUInteger v14 = length;
    uint64_t v15 = (uint64_t)&v35->_attachmentInfo[1] + 88 * location;
    uint64_t v16 = v37;
    NSUInteger v18 = a4;
    double v17 = a5;
    do
    {
      objc_msgSend((id)v35->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v30, v31);
      *uint64_t v16 = [(id)*a3 baseObject];
      _MTLMessageContext v19 = (_DWORD *)(v15 + 45480);
      _MTLMessageContext v20 = *a3;
      int v21 = *(_DWORD *)v18;
      int v22 = *(_DWORD *)v17;
      if (MTLReportFailureTypeEnabled())
      {
        if (*v19 == v22
          && *(_DWORD *)(v15 + 45476) == v21
          && *(unsigned char *)(v15 + 45472) != 0
          && *(void *)(v15 + 45448) == -1
          && *(void *)(v15 + 45408) == 2
          && *(void *)(v15 + 45416) == (void)v20
          && (*(void *)(v15 + 45432) | *(void *)(v15 + 45424) | *(void *)(v15 + 45440)) == 0
          && *(_OWORD *)(v15 + 45456) == 0)
        {
          uint64_t v30 = v20;
          MTLReportFailure();
        }
      }
      *(unsigned char *)(v15 + 45400) = v20 != 0;
      *(unsigned char *)(v15 + 45401) = 0;
      *(void *)(v15 + 45408) = 2;
      *(void *)(v15 + 45416) = v20;
      *(void *)(v15 + 45424) = 0;
      *(void *)(v15 + 45432) = 0;
      *(void *)(v15 + 45440) = 0;
      *(void *)(v15 + 45448) = -1;
      *(void *)(v15 + 45456) = 0;
      *(void *)(v15 + 45464) = 0;
      v15 += 88;
      *((unsigned char *)v19 - 8) = 1;
      ++v17;
      ++v18;
      *(v19 - 1) = v21;
      *_MTLMessageContext v19 = v22;
      ++v16;
      ++a3;
      --v14;
    }
    while (v14);
  }
  else
  {
    NSUInteger v11 = location;
    _MTLMessageContextEnd();
  }
  objc_msgSend(-[MTLToolsObject baseObject](v35, "baseObject", v30), "setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v37, a4, a5, v11, v34);
}

- (void)dispatchThreadsPerTile:(id *)a3
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v3 = *a3;
  [(MTLDebugRenderCommandEncoder *)self _dispatchThreadsPerTile:&v3 inRegion:0 withRenderTargetArrayIndex:0];
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v4 = *a3;
  [(MTLDebugRenderCommandEncoder *)self _dispatchThreadsPerTile:&v4 inRegion:a4 withRenderTargetArrayIndex:0];
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int)a5
{
  unsigned int v6 = a5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = *a3;
  [(MTLDebugRenderCommandEncoder *)self _dispatchThreadsPerTile:&v5 inRegion:a4 withRenderTargetArrayIndex:&v6];
}

- (void)_validateDispatchThreadsPerTile:(id *)a3 context:(_MTLMessageContext *)a4
{
  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    if (BYTE2(self->_visibilityOffsets)) {
      _MTLMessageContextPush_();
    }
    if ([self->_peakPerSampleStorage tileDescriptor])
    {
      if ([(MTLRenderPipelineState *)[(MTLDebugRenderCommandEncoder *)self renderPipelineState] threadgroupSizeMatchesTileSize])
      {
        unint64_t var0 = a3->var0;
        if (var0 != [(MTLToolsRenderCommandEncoder *)self tileWidth]
          || (unint64_t v8 = a3->var1, v8 != [(MTLToolsRenderCommandEncoder *)self tileHeight]))
        {
          unint64_t v9 = a3->var0;
          unint64_t var1 = a3->var1;
          unint64_t v28 = [(MTLToolsRenderCommandEncoder *)self tileWidth];
          unint64_t v31 = [(MTLToolsRenderCommandEncoder *)self tileHeight];
          unint64_t v19 = v9;
          unint64_t v24 = var1;
          _MTLMessageContextPush_();
        }
      }
      if (![(MTLToolsDevice *)self->super.super.super._device supportsNonSquareTileShaders]&& ([(MTLRenderPipelineState *)[(MTLDebugRenderCommandEncoder *)self renderPipelineState] threadgroupSizeMatchesTileSize] & 1) == 0)
      {
        unint64_t v11 = a3->var0;
        if (v11 != [(MTLToolsRenderCommandEncoder *)self tileWidth]
          || (unint64_t v12 = a3->var1, v12 != [(MTLToolsRenderCommandEncoder *)self tileHeight]))
        {
          if (a3->var0 != a3->var1)
          {
            unint64_t v29 = a3->var0;
            unint64_t v32 = a3->var1;
            unint64_t v20 = a3->var0;
            unint64_t v25 = v32;
            _MTLMessageContextPush_();
          }
        }
      }
      unint64_t v13 = a3->var2 * ((a3->var0 & 1) + a3->var0) * ((a3->var1 & 1) + a3->var1);
      if (v13 > [(MTLRenderPipelineState *)[(MTLDebugRenderCommandEncoder *)self renderPipelineState] maxTotalThreadsPerThreadgroup])
      {
        long long v36 = *(_OWORD *)&a3->var0;
        unint64_t var2 = a3->var2;
        uint64_t v33 = [(MTLRenderPipelineState *)[(MTLDebugRenderCommandEncoder *)self renderPipelineState] maxTotalThreadsPerThreadgroup];
        long long v21 = v36;
        _MTLMessageContextPush_();
      }
      uint64_t peakPerSampleStorage = (void *)self->_peakPerSampleStorage;
      if (peakPerSampleStorage
        && self->_resolvedRasterSampleCount
        && (objc_msgSend(peakPerSampleStorage, "isImageBlockLayoutInputCompatibleWithOutputOf:") & 1) == 0)
      {
        _MTLMessageContextPush_();
      }
      unint64_t v15 = a3->var0;
      if (!(a3->var1 * a3->var0 * a3->var2))
      {
        long long v21 = *(_OWORD *)&a3->var0;
        unint64_t var2 = a3->var2;
        _MTLMessageContextPush_();
        unint64_t v15 = a3->var0;
      }
      if (v15 > [(MTLToolsRenderCommandEncoder *)self tileWidth])
      {
        unint64_t v22 = a3->var0;
        unint64_t v26 = [(MTLToolsRenderCommandEncoder *)self tileWidth];
        _MTLMessageContextPush_();
      }
      unint64_t v16 = a3->var1;
      if (v16 > [(MTLToolsRenderCommandEncoder *)self tileHeight])
      {
        unint64_t v23 = a3->var1;
        unint64_t v27 = [(MTLToolsRenderCommandEncoder *)self tileHeight];
        _MTLMessageContextPush_();
      }
      if (a3->var2 != 1)
      {
        unint64_t v23 = a3->var2;
        _MTLMessageContextPush_();
      }
      NSUInteger v34 = (const char *)[(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] protectionOptions];
      device = self->super.super.super._device;
      uint64_t v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "tileDescriptor"), "tileFunction"), "name");
      NSUInteger v18 = objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "reflection"), "tileArguments");
      [(MTLToolsDevice *)self->super.super.super._device maxFragmentBuffers];
      [(MTLToolsDevice *)self->super.super.super._device maxFragmentTextures];
      [(MTLToolsDevice *)self->super.super.super._device maxFragmentSamplers];
      validateFunctionArguments(device, @"Tile", v17, v18, (uint64_t)&self->_tileBuffers[0].type, (uint64_t)&self->_tileTextures[0].type, (uint64_t)&self->_tileSamplers[0].type, 0, 0, 0, 0, self->_commandBuffer, v34, (uint64_t)&self->_threadgroupMemoryArguments[0].type, [(MTLToolsDevice *)self->super.super.super._device maxComputeLocalMemorySizes], 1, 0, (uint64_t)a4, LOBYTE(self->_depthBias));
    }
    else
    {
      _MTLMessageContextPush_();
      _MTLMessageContextEnd();
    }
  }
}

- (void)_dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int *)a5
{
  uint64_t v24 = 0;
  memset(v23, 0, sizeof(v23));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a3;
  [(MTLDebugRenderCommandEncoder *)self _validateDispatchThreadsPerTile:&v22 context:v23];
  _MTLMessageContextEnd();
  if (a4)
  {
    id v9 = [(MTLToolsObject *)self baseObject];
    long long v10 = *(_OWORD *)&a3->var0;
    if (a5)
    {
      unint64_t var2 = a3->var2;
      long long v11 = *(_OWORD *)&a4->var0.var2;
      v19[0] = *(_OWORD *)&a4->var0.var0;
      v19[1] = v11;
      v19[2] = *(_OWORD *)&a4->var1.var1;
      long long v20 = v10;
      [v9 dispatchThreadsPerTile:&v20 inRegion:v19 withRenderTargetArrayIndex:*a5];
    }
    else
    {
      unint64_t v18 = a3->var2;
      long long v13 = *(_OWORD *)&a4->var0.var2;
      v16[0] = *(_OWORD *)&a4->var0.var0;
      v16[1] = v13;
      v16[2] = *(_OWORD *)&a4->var1.var1;
      long long v17 = v10;
      [v9 dispatchThreadsPerTile:&v17 inRegion:v16];
    }
  }
  else
  {
    id v12 = [(MTLToolsObject *)self baseObject];
    long long v14 = *(_OWORD *)&a3->var0;
    unint64_t v15 = a3->var2;
    [v12 dispatchThreadsPerTile:&v14];
  }
  LODWORD(self->_visibilityOffsets) |= 0x80000006;
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  memset(&v19, 0, sizeof(v19));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (a5 <= 0x1E)
  {
    p_type = (MTLDebugFunctionArgument *)&self->_threadgroupMemoryArguments[a5].type;
    if (p_type->isValid
      && BYTE1(self->_threadgroupMemoryArguments[a5].type)
      && ((uint64_t)self->_visibilityOffsets & 0x80000000) == 0)
    {
      _MTLMessageContextPush_();
      p_type = (MTLDebugFunctionArgument *)&self->_threadgroupMemoryArguments[a5].type;
    }
    validateArg(MTLArgumentTypeThreadgroupMemory, a5, p_type, &v19);
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeLocalMemorySizes] <= a5)
  {
    unint64_t v13 = a5;
    unint64_t v16 = [(MTLToolsDevice *)self->super.super.super._device maxComputeLocalMemorySizes];
    _MTLMessageContextPush_();
  }
  if (a4 + a3 > objc_msgSend(self->_frontFacingWinding, "threadgroupMemoryLength", v13, v16))
  {
    unint64_t v14 = a4 + a3;
    uint64_t v17 = [self->_frontFacingWinding threadgroupMemoryLength];
    _MTLMessageContextPush_();
  }
  if (a3
     % [(MTLToolsDevice *)self->super.super.super._device maxComputeThreadgroupMemoryAlignmentBytes])
  {
    unint64_t v15 = a3;
    unint64_t v18 = [(MTLToolsDevice *)self->super.super.super._device maxComputeThreadgroupMemoryAlignmentBytes];
    _MTLMessageContextPush_();
  }
  if (a4
     % [(MTLToolsDevice *)self->super.super.super._device maxComputeThreadgroupMemoryAlignmentBytes])
  {
    [(MTLToolsDevice *)self->super.super.super._device maxComputeThreadgroupMemoryAlignmentBytes];
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setThreadgroupMemoryLength:offset:atIndex:", a3, a4, a5);
  long long v10 = &self->_threadgroupMemoryArguments[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    long long v11 = &v10[11 * a5];
    if (!*((unsigned char *)v11 + 72)
      && v11[8] == a4
      && v11[7] == a3
      && v11[6] == -1
      && v11[1] == 3
      && !v11[2]
      && !(v11[4] | v11[3] | v11[5])
      && !*(unint64_t *)((char *)v11 + 76))
    {
      MTLReportFailure();
    }
  }
  id v12 = &v10[11 * a5];
  *(unsigned char *)id v12 = a3 != 0;
  *((unsigned char *)v12 + 1) = 0;
  v12[1] = 3;
  *((_OWORD *)v12 + 1) = 0u;
  *((_OWORD *)v12 + 2) = 0u;
  v12[6] = -1;
  v12[7] = a3;
  v12[8] = a4;
  *((unsigned char *)v12 + 72) = 0;
  *((_DWORD *)v12 + 19) = 0;
  *((_DWORD *)v12 + 20) = 0;
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if ([a3 storageMode] == 3) {
    _MTLMessageContextPush_();
  }
  if (a4 >= 8) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResource:usage:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)validateFunctionTableUseResource:(id)a3 stages:(unint64_t)a4 context:(_MTLMessageContext *)a5 selectorName:(id)a6
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !MTLDebugStageIsRenderStage([a3 stage], a4))
  {
    [NSString stringWithFormat:@"%@ called with stages (0x%lx), but %s resource was created for stage %@", a6, a4, "MTLVisibleFunctionTable", MTLDebugStageToString(objc_msgSend(a3, "stage"))];
    _MTLMessageContextPush_();
  }
}

- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if ([a3 storageMode] == 3) {
    _MTLMessageContextPush_();
  }
  if (a4 >= 8)
  {
    unint64_t v9 = a4;
    _MTLMessageContextPush_();
  }
  if (a5 >= 0x20)
  {
    unint64_t v9 = a5;
    goto LABEL_11;
  }
  if (!a5) {
LABEL_11:
  }
    _MTLMessageContextPush_();
  [(MTLDebugRenderCommandEncoder *)self validateFunctionTableUseResource:a3, a5, v10, @"useResource:usage:stages:", v9 stages context selectorName];
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResource:usage:stages:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (a5 < 8)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_13:
    _MTLMessageContextEnd();
    std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
    goto LABEL_14;
  }
  unint64_t v14 = a5;
  _MTLMessageContextPush_();
  if (!a4) {
    goto LABEL_13;
  }
LABEL_3:
  unint64_t v9 = 0;
  do
  {
    long long v10 = (void *)a3[v9];
    if (!v10)
    {
      unint64_t v14 = v9;
      _MTLMessageContextPush_();
      long long v10 = (void *)a3[v9];
    }
    if (objc_msgSend(v10, "storageMode", v14) == 3)
    {
      unint64_t v14 = v9;
      _MTLMessageContextPush_();
    }
    ++v9;
  }
  while (a4 != v9);
  _MTLMessageContextEnd();
  std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
  uint64_t v11 = 0;
  do
  {
    uint64_t v12 = objc_msgSend((id)a3[v11], "baseObject", v14);
    *((void *)__p[0] + v11) = v12;
    [self->_maxVertexBuffers addObject:a3[v11++] retained:1 purgeable:1];
  }
  while (a4 != v11);
LABEL_14:
  id v13 = [(MTLToolsObject *)self baseObject];
  [v13 useResources:__p[0] count:a4 usage:a5];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6
{
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (a5 >= 8)
  {
    unint64_t v16 = a5;
    _MTLMessageContextPush_();
  }
  if (a6 >= 0x20)
  {
    unint64_t v16 = a6;
  }
  else if (a6)
  {
    if (a4) {
      goto LABEL_6;
    }
LABEL_17:
    std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
    goto LABEL_18;
  }
  _MTLMessageContextPush_();
  if (!a4) {
    goto LABEL_17;
  }
LABEL_6:
  unint64_t v11 = 0;
  do
  {
    uint64_t v12 = (void *)a3[v11];
    if (!v12)
    {
      unint64_t v16 = v11;
      _MTLMessageContextPush_();
      uint64_t v12 = (void *)a3[v11];
    }
    if (objc_msgSend(v12, "storageMode", v16) == 3)
    {
      unint64_t v16 = v11;
      _MTLMessageContextPush_();
    }
    ++v11;
  }
  while (a4 != v11);
  std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
  uint64_t v13 = 0;
  do
  {
    -[MTLDebugRenderCommandEncoder validateFunctionTableUseResource:stages:context:selectorName:](self, "validateFunctionTableUseResource:stages:context:selectorName:", a3[v13], a6, v18, objc_msgSend(NSString, "stringWithFormat:", @"useResources:count:usage:stages: (index = %lu)", v13));
    uint64_t v14 = [(id)a3[v13] baseObject];
    *((void *)__p[0] + v13) = v14;
    [self->_maxVertexBuffers addObject:a3[v13++] retained:1 purgeable:1];
  }
  while (a4 != v13);
LABEL_18:
  _MTLMessageContextEnd();
  id v15 = [(MTLToolsObject *)self baseObject];
  [v15 useResources:__p[0] count:a4 usage:a5 stages:a6];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useHeap:(id)a3
{
  if (!a3) {
    MTLReportFailure();
  }
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 useHeap:v6];
}

- (void)useHeap:(id)a3 stages:(unint64_t)a4
{
  if (!a3) {
    _MTLMessageContextPush_();
  }
  if (a4 >= 0x20 || !a4) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useHeap:stages:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (a4)
  {
    uint64_t v7 = 0;
    do
    {
      if (!a3[v7])
      {
        uint64_t v11 = v7;
        _MTLMessageContextPush_();
      }
      ++v7;
    }
    while (a4 != v7);
    _MTLMessageContextEnd();
    std::vector<objc_object  {objcproto7MTLHeap}*>::vector(__p, a4);
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = objc_msgSend((id)a3[v8], "baseObject", v11);
      *((void *)__p[0] + v8) = v9;
      [self->_maxVertexBuffers addObject:a3[v8++] retained:1 purgeable:1];
    }
    while (a4 != v8);
  }
  else
  {
    _MTLMessageContextEnd();
    std::vector<objc_object  {objcproto7MTLHeap}*>::vector(__p, 0);
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  [v10 useHeaps:__p[0] count:a4];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5
{
  uint64_t v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (a5 >= 0x20)
  {
    unint64_t v13 = a5;
  }
  else if (a5)
  {
    if (a4) {
      goto LABEL_4;
    }
LABEL_13:
    _MTLMessageContextEnd();
    std::vector<objc_object  {objcproto7MTLHeap}*>::vector(__p, a4);
    goto LABEL_14;
  }
  _MTLMessageContextPush_();
  if (!a4) {
    goto LABEL_13;
  }
LABEL_4:
  unint64_t v9 = 0;
  do
  {
    if (!a3[v9])
    {
      unint64_t v13 = v9;
      _MTLMessageContextPush_();
    }
    ++v9;
  }
  while (a4 != v9);
  _MTLMessageContextEnd();
  std::vector<objc_object  {objcproto7MTLHeap}*>::vector(__p, a4);
  uint64_t v10 = 0;
  do
  {
    uint64_t v11 = objc_msgSend((id)a3[v10], "baseObject", v13);
    *((void *)__p[0] + v10) = v11;
    [self->_maxVertexBuffers addObject:a3[v10++] retained:1 purgeable:1];
  }
  while (a4 != v10);
LABEL_14:
  id v12 = [(MTLToolsObject *)self baseObject];
  [v12 useHeaps:__p[0] count:a4];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setViewport:(id *)a3
{
  uint64_t v15 = 0;
  memset(&v14, 0, sizeof(v14));
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  long long v6 = *(_OWORD *)&a3->var2;
  v13[0] = *(_OWORD *)&a3->var0;
  v13[1] = v6;
  v13[2] = *(_OWORD *)&a3->var4;
  validateMTLViewport((double *)v13, &v14, v5);
  int visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x40000) != 0)
  {
    end = self->_viewports.__end_;
    if (($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(self->_viewports.__end_cap_.__value_ - end) == ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)48
      && !memcmp(end, a3, 0x30uLL))
    {
      _MTLMessageContextPush_();
      int visibilityOffsets = (int)self->_visibilityOffsets;
    }
  }
  int v9 = visibilityOffsets | 0x40000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x40000;
  if ((visibilityOffsets & 8) == 0)
  {
    _MTLMessageContextPush_();
    int v9 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v9 & 0xFFFFFFF7;
  _MTLMessageContextEnd();
  id v10 = [(MTLToolsObject *)self baseObject];
  long long v11 = *(_OWORD *)&a3->var2;
  v12[0] = *(_OWORD *)&a3->var0;
  v12[1] = v11;
  v12[2] = *(_OWORD *)&a3->var4;
  [v10 setViewport:v12];
  std::vector<MTLViewport>::assign((char **)&self->_viewports.__end_, 1uLL, (long long *)a3);
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  uint64_t v23 = 0;
  memset(&v22, 0, sizeof(v22));
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) == 0)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_8:
    _MTLMessageContextPush_();
    goto LABEL_9;
  }
  _MTLMessageContextPush_();
  if (!a3) {
    goto LABEL_8;
  }
LABEL_3:
  BOOL v8 = a4 != 0;
  if (!a4)
  {
LABEL_9:
    BOOL v8 = 0;
    goto LABEL_10;
  }
  unint64_t v9 = 0;
  id v10 = a3;
  do
  {
    long long v11 = *(_OWORD *)&v10->var2;
    v21[0] = *(_OWORD *)&v10->var0;
    v21[1] = v11;
    v21[2] = *(_OWORD *)&v10->var4;
    validateMTLViewport((double *)v21, &v22, v7);
    ++v9;
    ++v10;
  }
  while (v9 < a4);
LABEL_10:
  char v12 = [self->_frontFacingWinding rasterizationRateMap] != 0;
  if (a4 - 1 >= [(MTLToolsDevice *)self->super.super.super._device maxViewportCount] >> v12) {
    _MTLMessageContextPush_();
  }
  int visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x40000) != 0)
  {
    if (a3)
    {
      end = self->_viewports.__end_;
      int64_t v15 = self->_viewports.__end_cap_.__value_ - end;
      if (0xAAAAAAAAAAAAAAABLL * (v15 >> 4) == a4 && !memcmp(end, a3, v15))
      {
        _MTLMessageContextPush_();
        int visibilityOffsets = (int)self->_visibilityOffsets;
      }
    }
  }
  int v16 = visibilityOffsets | 0x40000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x40000;
  if ((visibilityOffsets & 8) == 0)
  {
    _MTLMessageContextPush_();
    int v16 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v16 & 0xFFFFFFF7;
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setViewports:count:", a3, a4);
  p_end = (char *)&self->_viewports.__end_;
  if (v8)
  {
    std::vector<MTLViewport>::__assign_with_size[abi:ne180100]<MTLViewport const*,MTLViewport const*>(p_end, (char *)a3, (uint64_t)&a3[a4], a4);
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    uint64_t v19 = 0;
    uint64_t v20 = 0x3FF0000000000000;
    std::vector<MTLViewport>::assign((char **)p_end, 1uLL, v18);
  }
}

- (void)setFrontFacingWinding:(unint64_t)a3
{
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (a3 >= 2) {
    _MTLMessageContextPush_();
  }
  int visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x80000) != 0 && self->_cullMode == a3)
  {
    _MTLMessageContextPush_();
    int visibilityOffsets = (int)self->_visibilityOffsets;
  }
  int v6 = visibilityOffsets | 0x80000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x80000;
  if ((visibilityOffsets & 0x10) == 0)
  {
    _MTLMessageContextPush_();
    int v6 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v6 & 0xFFFFFFEF;
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0), "setFrontFacingWinding:", a3);
  self->_unint64_t cullMode = a3;
}

- (void)setCullMode:(unint64_t)a3
{
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (a3 >= 3) {
    _MTLMessageContextPush_();
  }
  int visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x100000) != 0 && self->_depthClipMode == a3)
  {
    _MTLMessageContextPush_();
    int visibilityOffsets = (int)self->_visibilityOffsets;
  }
  int v6 = visibilityOffsets | 0x100000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x100000;
  if ((visibilityOffsets & 0x20) == 0)
  {
    _MTLMessageContextPush_();
    int v6 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v6 & 0xFFFFFFDF;
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0), "setCullMode:", a3);
  self->_unint64_t depthClipMode = a3;
}

- (void)setDepthClipMode:(unint64_t)a3
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (a3 >= 2) {
    _MTLMessageContextPush_();
  }
  int visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x200000) != 0 && self->_triangleFillMode == a3)
  {
    _MTLMessageContextPush_();
    int visibilityOffsets = (int)self->_visibilityOffsets;
  }
  int v6 = visibilityOffsets | 0x200000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x200000;
  if ((visibilityOffsets & 0x40) == 0)
  {
    _MTLMessageContextPush_();
    int v6 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v6 & 0xFFFFFFBF;
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0), "setDepthClipModeSPI:", a3);
  self->_unint64_t triangleFillMode = a3;
}

- (void)setLineWidth:(float)a3
{
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (a3 < 1.0 || a3 > 16.0) {
    _MTLMessageContextPush_();
  }
  int visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x400000) != 0 && LODWORD(self->_depthBiasSlopeScale) == LODWORD(a3))
  {
    _MTLMessageContextPush_();
    int visibilityOffsets = (int)self->_visibilityOffsets;
  }
  int v7 = visibilityOffsets | 0x400000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x400000;
  if ((visibilityOffsets & 0x80) == 0)
  {
    _MTLMessageContextPush_();
    int v7 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v7 & 0xFFFFFF7F;
  _MTLMessageContextEnd();
  id v8 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v9 = a3;
  [v8 setLineWidth:v9];
  self->_depthBiasSlopeScale = a3;
}

- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5
{
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (MTLReportFailureTypeEnabled())
  {
    int visibilityOffsets = (int)self->_visibilityOffsets;
    if ((visibilityOffsets & 0x800000) != 0)
    {
      BOOL v10 = LODWORD(self->_depthBiasClamp) == LODWORD(a3) && self->_frontStencilRef == LODWORD(a4);
      if (v10 && self->_backStencilRef == LODWORD(a5))
      {
        _MTLMessageContextPush_();
        int visibilityOffsets = (int)self->_visibilityOffsets;
      }
    }
    int v12 = visibilityOffsets | 0x800000;
    LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x800000;
    if ((visibilityOffsets & 0x100) == 0)
    {
      _MTLMessageContextPush_();
      int v12 = (int)self->_visibilityOffsets;
    }
    LODWORD(self->_visibilityOffsets) = v12 & 0xFFFFFEFF;
  }
  _MTLMessageContextEnd();
  id v13 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v14 = a3;
  *(float *)&double v15 = a4;
  *(float *)&double v16 = a5;
  [v13 setDepthBias:v14 slopeScale:v15 clamp:v16];
  self->_depthBiasClamp = a3;
  *(float *)&self->_frontStencilRef = a4;
  *(float *)&self->_backStencilRef = a5;
}

- (void)setScissorRect:(id *)a3
{
  memset(&v18, 0, sizeof(v18));
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  validateMTLScissorRect(self, (const MTLScissorRect *)a3, &v18);
  int visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x1000000) != 0)
  {
    end = self->_scissorRects.__end_;
    if (($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(self->_scissorRects.__end_cap_.__value_ - end) == ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)32)
    {
      uint64_t v7 = *(void *)end;
      uint64_t v8 = *((void *)end + 1);
      uint64_t v10 = *((void *)end + 2);
      uint64_t v9 = *((void *)end + 3);
      BOOL v11 = v7 == a3->var0 && v8 == a3->var1;
      BOOL v12 = v11 && v10 == a3->var2;
      if (v12 && v9 == a3->var3)
      {
        _MTLMessageContextPush_();
        int visibilityOffsets = (int)self->_visibilityOffsets;
      }
    }
  }
  int v14 = visibilityOffsets | 0x1000000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x1000000;
  if ((visibilityOffsets & 0x200) == 0)
  {
    _MTLMessageContextPush_();
    int v14 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v14 & 0xFFFFFDFF;
  _MTLMessageContextEnd();
  id v15 = [(MTLToolsObject *)self baseObject];
  long long v16 = *(_OWORD *)&a3->var2;
  v17[0] = *(_OWORD *)&a3->var0;
  v17[1] = v16;
  [v15 setScissorRect:v17];
  std::vector<MTLScissorRect>::assign((char **)&self->_scissorRects.__end_, 1uLL, a3);
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
  memset(&v19, 0, sizeof(v19));
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets))
  {
    _MTLMessageContextPush_();
    if (a3) {
      goto LABEL_3;
    }
LABEL_26:
    _MTLMessageContextPush_();
    goto LABEL_3;
  }
  if (!a3) {
    goto LABEL_26;
  }
LABEL_3:
  char v7 = [self->_frontFacingWinding rasterizationRateMap] != 0;
  unint64_t v8 = [(MTLToolsDevice *)self->super.super.super._device maxViewportCount] >> v7;
  if (!a4 || v8 < a4) {
    _MTLMessageContextPush_();
  }
  if (a3) {
    BOOL v9 = a4 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (!v9 && v8 >= a4)
  {
    BOOL v11 = a3;
    unint64_t v12 = a4;
    do
    {
      validateMTLScissorRect(self, (const MTLScissorRect *)v11++, &v19);
      --v12;
    }
    while (v12);
  }
  int visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x1000000) != 0)
  {
    if (a3)
    {
      end = self->_scissorRects.__end_;
      int64_t v15 = self->_scissorRects.__end_cap_.__value_ - end;
      if (v15 >> 5 == a4 && !memcmp(end, a3, v15))
      {
        _MTLMessageContextPush_();
        int visibilityOffsets = (int)self->_visibilityOffsets;
      }
    }
  }
  int v16 = visibilityOffsets | 0x1000000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x1000000;
  if ((visibilityOffsets & 0x200) == 0)
  {
    _MTLMessageContextPush_();
    int v16 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v16 & 0xFFFFFDFF;
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setScissorRects:count:", a3, a4);
  p_end = (char *)&self->_scissorRects.__end_;
  if (v10)
  {
    std::vector<MTLScissorRect>::__assign_with_size[abi:ne180100]<MTLScissorRect const*,MTLScissorRect const*>(p_end, (char *)a3, (uint64_t)&a3[a4], a4);
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    std::vector<MTLScissorRect>::assign((char **)p_end, 1uLL, v18);
  }
}

- (void)setTransformFeedbackState:(unint64_t)a3
{
  if (a3 >= 2) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTransformFeedbackState:", a3);
}

- (void)setVertexAmplificationMode:(unint64_t)a3 value:(unint64_t)a4
{
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  unint64_t amplificationValue = self->_amplificationValue;
  unint64_t v8 = a4;
  if (!amplificationValue)
  {
LABEL_6:
    if (!v8) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (amplificationValue == 1)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a4);
    v9.i16[0] = vaddlv_u8(v9);
    unint64_t v8 = v9.u32[0];
    goto LABEL_6;
  }
  _MTLMessageContextPush_();
  unint64_t v8 = a4;
  if (!a4)
  {
LABEL_10:
    [(MTLToolsDevice *)self->super.super.super._device maxVertexAmplificationFactor];
    _MTLMessageContextPush_();
    goto LABEL_11;
  }
LABEL_9:
  if (v8 > [(MTLToolsDevice *)self->super.super.super._device maxVertexAmplificationFactor])goto LABEL_10; {
LABEL_11:
  }
  int visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x40000000) != 0 && self->_vertexAmplificationCount == a4)
  {
    _MTLMessageContextPush_();
    int visibilityOffsets = (int)self->_visibilityOffsets;
  }
  int v11 = visibilityOffsets | 0x40000000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x40000000;
  if ((visibilityOffsets & 0x8000) == 0)
  {
    _MTLMessageContextPush_();
    int v11 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v11 & 0xFFFF7FFF;
  _MTLMessageContextEnd();
  self->_unint64_t amplificationValue = a3;
  self->_vertexAmplificationCount = a4;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexAmplificationMode:value:", a3, a4);
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
  _MTLMessageContextBegin_();
  if (([(MTLDevice *)[(MTLToolsObject *)self device] supportsVertexAmplification] & 1) == 0)_MTLMessageContextPush_(); {
  if (BYTE2(self->_visibilityOffsets))
  }
    _MTLMessageContextPush_();
  if (([(MTLDevice *)[(MTLToolsObject *)self device] supportsVertexAmplificationCount:a3] & 1) == 0)_MTLMessageContextPush_(); {
  int visibilityOffsets = (int)self->_visibilityOffsets;
  }
  if ((visibilityOffsets & 0x40000000) != 0 && self->_updatedFences.__map_.__first_ == (__begin_ ***)a3)
  {
    _MTLMessageContextPush_();
    int visibilityOffsets = (int)self->_visibilityOffsets;
  }
  int v8 = visibilityOffsets | 0x40000000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x40000000;
  if ((visibilityOffsets & 0x8000) == 0)
  {
    _MTLMessageContextPush_();
    int v8 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v8 & 0xFFFF7FFF;
  _MTLMessageContextEnd();
  self->_updatedFences.__map_.__first_ = (__begin_ ***)a3;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexAmplificationCount:viewMappings:", a3, a4);
}

- (void)setTriangleFrontFillMode:(unint64_t)a3 backFillMode:(unint64_t)a4
{
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (a3 >= 3) {
    _MTLMessageContextPush_();
  }
  if (a4 >= 3) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0), "setTriangleFrontFillMode:backFillMode:", a3, a4);
  self->_unint64_t renderPipelineState = (MTLRenderPipelineState *)a3;
}

- (void)setTriangleFillMode:(unint64_t)a3
{
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (a3 >= 3) {
    _MTLMessageContextPush_();
  }
  int visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x2000000) != 0 && self->_renderPipelineState == (MTLRenderPipelineState *)a3)
  {
    _MTLMessageContextPush_();
    int visibilityOffsets = (int)self->_visibilityOffsets;
  }
  int v6 = visibilityOffsets | 0x2000000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x2000000;
  if ((visibilityOffsets & 0x400) == 0)
  {
    _MTLMessageContextPush_();
    int v6 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v6 & 0xFFFFFBFF;
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0), "setTriangleFillMode:", a3);
  self->_unint64_t renderPipelineState = (MTLRenderPipelineState *)a3;
}

- (void)setDepthStencilState:(id)a3
{
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets))
  {
    _MTLMessageContextPush_();
    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    _MTLMessageContextPush_();
    goto LABEL_6;
  }
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device", 0, 0, 0, 0, 0, 0, 0)) {
    goto LABEL_5;
  }
LABEL_6:
  int visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x4000000) != 0 && self->_defaultDepthStencilDescriptor == a3)
  {
    _MTLMessageContextPush_();
    int visibilityOffsets = (int)self->_visibilityOffsets;
  }
  int v7 = visibilityOffsets | 0x4000000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x4000000;
  if ((visibilityOffsets & 0x800) == 0)
  {
    _MTLMessageContextPush_();
    int v7 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v7 & 0xFFFFF7FF;
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthStencilState:", objc_msgSend(a3, "baseObject"));
  self->_uint64_t defaultDepthStencilDescriptor = (MTLDepthStencilDescriptor *)a3;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x80u;
}

- (void)setStencilReferenceValue:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  _MTLMessageContextBegin_();
  int visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x10000) != 0)
  {
    _MTLMessageContextPush_();
    int visibilityOffsets = (int)self->_visibilityOffsets;
  }
  if ((visibilityOffsets & 0x8000000) != 0
    && LODWORD(self->_blendColorRed) == v3
    && LODWORD(self->_blendColorGreen) == v3)
  {
    _MTLMessageContextPush_();
    int visibilityOffsets = (int)self->_visibilityOffsets;
  }
  int v6 = visibilityOffsets | 0x8000000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x8000000;
  if ((visibilityOffsets & 0x1000) == 0)
  {
    _MTLMessageContextPush_();
    int v6 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v6 & 0xFFFFEFFF;
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0), "setStencilReferenceValue:", v3);
  LODWORD(self->_blendColorRed) = v3;
  LODWORD(self->_blendColorGreen) = v3;
}

- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  _MTLMessageContextBegin_();
  int visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x10000) != 0)
  {
    _MTLMessageContextPush_();
    int visibilityOffsets = (int)self->_visibilityOffsets;
  }
  if ((visibilityOffsets & 0x8000000) != 0
    && LODWORD(self->_blendColorRed) == v5
    && LODWORD(self->_blendColorGreen) == v4)
  {
    _MTLMessageContextPush_();
    int visibilityOffsets = (int)self->_visibilityOffsets;
  }
  int v8 = visibilityOffsets | 0x8000000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x8000000;
  if ((visibilityOffsets & 0x1000) == 0)
  {
    _MTLMessageContextPush_();
    int v8 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v8 & 0xFFFFEFFF;
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0), "setStencilFrontReferenceValue:backReferenceValue:", v5, v4);
  LODWORD(self->_blendColorRed) = v5;
  LODWORD(self->_blendColorGreen) = v4;
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  _MTLMessageContextBegin_();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if (a4 >= 8) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  int v7 = objc_msgSend((id)objc_msgSend(self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", a4);
  _MTLDebugValidateDeferredStoreActionOnDevice(self->super.super.super._device, a3, v7, a4, HIDWORD(self->_visibilityOffsets));
  [v7 setStoreAction:a3];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorStoreAction:atIndex:", a3, a4);
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    MTLReportFailure();
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", 8);
  _MTLDebugValidateDeferredStoreActionOnDevice(self->super.super.super._device, a3, v5, 8uLL, HIDWORD(self->_visibilityOffsets));
  [v5 setStoreAction:a3];
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setDepthStoreAction:a3];
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    MTLReportFailure();
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", 9);
  _MTLDebugValidateDeferredStoreActionOnDevice(self->super.super.super._device, a3, v5, 9uLL, HIDWORD(self->_visibilityOffsets));
  [v5 setStoreAction:a3];
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setStencilStoreAction:a3];
}

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
  _MTLMessageContextBegin_();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if (a4 >= 8) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  int v7 = objc_msgSend((id)objc_msgSend(self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", a4);
  _MTLDebugValidateDeferredStoreActionOptionsOnDevice(self->super.super.super._device, a3, v7, a4, HIDWORD(self->_visibilityOffsets));
  [v7 setStoreActionOptions:a3];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorStoreActionOptions:atIndex:", a3, a4);
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    MTLReportFailure();
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", 8);
  _MTLDebugValidateDeferredStoreActionOptionsOnDevice(self->super.super.super._device, a3, v5, 8, HIDWORD(self->_visibilityOffsets));
  [v5 setStoreActionOptions:a3];
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setDepthStoreActionOptions:a3];
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    MTLReportFailure();
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", 9);
  _MTLDebugValidateDeferredStoreActionOptionsOnDevice(self->super.super.super._device, a3, v5, 9, HIDWORD(self->_visibilityOffsets));
  [v5 setStoreActionOptions:a3];
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setStencilStoreActionOptions:a3];
}

- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4
{
  if (a3 == 2)
  {
    [(MTLToolsObject *)self->super.super.super._device originalObject];
    MTLValidateFeatureSupport();
  }
  uint64_t v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (a3 >= 3) {
    _MTLMessageContextPush_();
  }
  if ((a4 & 7) != 0)
  {
    unint64_t v21 = a4;
    uint64_t v23 = 8;
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxVisibilityQueryOffset] < a4)
  {
    unint64_t v22 = a4;
    unint64_t v24 = [(MTLToolsDevice *)self->super.super.super._device maxVisibilityQueryOffset];
    _MTLMessageContextPush_();
  }
  if (a3)
  {
    begin = self->_viewports.__begin_;
    if (!begin) {
      operator new();
    }
    int v10 = (char *)*((void *)begin + 1);
    int v8 = (char *)begin + 8;
    uint8x8_t v9 = v10;
    if (v10)
    {
      int v11 = v8;
      do
      {
        unsigned int v12 = *((_DWORD *)v9 + 7);
        BOOL v13 = v12 >= a4;
        if (v12 >= a4) {
          int v14 = (char **)v9;
        }
        else {
          int v14 = (char **)(v9 + 8);
        }
        if (v13) {
          int v11 = v9;
        }
        uint8x8_t v9 = *v14;
      }
      while (*v14);
      if (v11 != v8 && *((_DWORD *)v11 + 7) <= a4)
      {
        unint64_t v22 = a4;
        _MTLMessageContextPush_();
      }
    }
    uint64_t v15 = objc_msgSend(self->_frontFacingWinding, "_descriptorPrivate", v22, v24);
    int v16 = *(void **)(v15 + 8);
    if (!v16)
    {
      _MTLMessageContextPush_();
      int v16 = *(void **)(v15 + 8);
    }
    if (a4 + 8 > [v16 length])
    {
      [*(id *)(v15 + 8) length];
      _MTLMessageContextPush_();
    }
  }
  if (MTLReportFailureTypeEnabled())
  {
    int visibilityOffsets = (int)self->_visibilityOffsets;
    if ((visibilityOffsets & 0x10000000) != 0 && self->_visibilityResultOffset == a3 && self->_width == a4)
    {
      _MTLMessageContextPush_();
      int visibilityOffsets = (int)self->_visibilityOffsets;
    }
    int v19 = visibilityOffsets | 0x10000000;
    LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x10000000;
    if ((visibilityOffsets & 0x2000) == 0)
    {
      _MTLMessageContextPush_();
      int v19 = (int)self->_visibilityOffsets;
    }
    LODWORD(self->_visibilityOffsets) = v19 & 0xFFFFDFFF;
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibilityResultMode:offset:", a3, a4);
  if (a3)
  {
    uint64_t v20 = self->_viewports.__begin_;
    unsigned int v25 = a4;
    std::__tree<unsigned int>::__emplace_hint_unique_key_args<unsigned int,unsigned int>((uint64_t **)v20, (uint64_t *)v20 + 1, &v25, &v25);
  }
  self->_unint64_t visibilityResultOffset = a3;
  self->_width = a4;
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (MTLReportFailureTypeEnabled())
  {
    int visibilityOffsets = (int)self->_visibilityOffsets;
    if ((visibilityOffsets & 0x20000000) != 0)
    {
      BOOL v12 = LODWORD(self->_blendColorBlue) == LODWORD(a3) && LODWORD(self->_blendColorAlpha) == LODWORD(a4);
      BOOL v13 = v12 && LODWORD(self->_tessellationFactorScale) == LODWORD(a5);
      if (v13 && LODWORD(self->_descriptor) == LODWORD(a6))
      {
        _MTLMessageContextPush_();
        int visibilityOffsets = (int)self->_visibilityOffsets;
      }
    }
    int v15 = visibilityOffsets | 0x20000000;
    LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x20000000;
    if ((visibilityOffsets & 0x4000) == 0)
    {
      _MTLMessageContextPush_();
      int v15 = (int)self->_visibilityOffsets;
    }
    LODWORD(self->_visibilityOffsets) = v15 & 0xFFFFBFFF;
  }
  _MTLMessageContextEnd();
  id v16 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v17 = a3;
  *(float *)&double v18 = a4;
  *(float *)&double v19 = a5;
  *(float *)&double v20 = a6;
  [v16 setBlendColorRed:v17 green:v18 blue:v19 alpha:v20];
  self->_blendColorBlue = a3;
  self->_blendColorAlpha = a4;
  self->_tessellationFactorScale = a5;
  *(float *)&self->_descriptor = a6;
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7
{
  if (a7 >= 8)
  {
    unint64_t v15 = a7;
    uint64_t v16 = 8;
    MTLReportFailure();
  }
  BOOL v13 = objc_msgSend(*(id *)objc_msgSend(self->_frontFacingWinding, "_descriptorPrivate", v15, v16), "_descriptorAtIndex:", a7);
  int v14 = (void **)[v13 _descriptorPrivate];
  _MTLMessageContextBegin_();
  _MTLValidateResolveTextureWithContext([(MTLToolsObject *)self device], (uint64_t *)a3, a7, [(MTLDebugRenderCommandEncoder *)self width], [(MTLDebugRenderCommandEncoder *)self height], a4, a5, a6, *v14, (char)self->_vertexBuiltinArguments);
  _MTLMessageContextEnd();
  [v13 setResolveTexture:a3];
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorResolveTexture:slice:depthPlane:level:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5, a6, a7);
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7 atIndex:(unint64_t)a8
{
  BOOL v18 = a7;
  if (a8 >= 8)
  {
    unint64_t v16 = a8;
    uint64_t v17 = 8;
    MTLReportFailure();
  }
  int v14 = objc_msgSend(*(id *)objc_msgSend(self->_frontFacingWinding, "_descriptorPrivate", v16, v17), "_descriptorAtIndex:", a8);
  unint64_t v15 = (void **)[v14 _descriptorPrivate];
  _MTLMessageContextBegin_();
  _MTLValidateResolveTextureWithContext([(MTLToolsObject *)self device], (uint64_t *)a3, a8, [(MTLDebugRenderCommandEncoder *)self width], [(MTLDebugRenderCommandEncoder *)self height], a4, a5, a6, *v15, (char)self->_vertexBuiltinArguments);
  _MTLMessageContextEnd();
  [v14 setResolveTexture:a3];
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorResolveTexture:slice:depthPlane:level:yInvert:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5, a6, v18, a8);
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  int v11 = objc_msgSend(*(id *)objc_msgSend(self->_frontFacingWinding, "_descriptorPrivate"), "_descriptorAtIndex:", 8);
  BOOL v12 = (void **)[v11 _descriptorPrivate];
  _MTLMessageContextBegin_();
  _MTLValidateResolveTextureWithContext([(MTLToolsObject *)self device], (uint64_t *)a3, 8uLL, [(MTLDebugRenderCommandEncoder *)self width], [(MTLDebugRenderCommandEncoder *)self height], a4, a5, a6, *v12, (char)self->_vertexBuiltinArguments);
  _MTLMessageContextEnd();
  [v11 setResolveTexture:a3];
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthResolveTexture:slice:depthPlane:level:", objc_msgSend(a3, "baseObject"), a4, a5, a6);
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  BOOL v14 = a7;
  BOOL v12 = objc_msgSend(*(id *)objc_msgSend(self->_frontFacingWinding, "_descriptorPrivate"), "_descriptorAtIndex:", 8);
  BOOL v13 = (void **)[v12 _descriptorPrivate];
  _MTLMessageContextBegin_();
  _MTLValidateResolveTextureWithContext([(MTLToolsObject *)self device], (uint64_t *)a3, 8uLL, [(MTLDebugRenderCommandEncoder *)self width], [(MTLDebugRenderCommandEncoder *)self height], a4, a5, a6, *v13, (char)self->_vertexBuiltinArguments);
  _MTLMessageContextEnd();
  [v12 setResolveTexture:a3];
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthResolveTexture:slice:depthPlane:level:yInvert:", objc_msgSend(a3, "baseObject"), a4, a5, a6, v14);
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  int v11 = objc_msgSend(*(id *)objc_msgSend(self->_frontFacingWinding, "_descriptorPrivate"), "_descriptorAtIndex:", 9);
  BOOL v12 = (void **)[v11 _descriptorPrivate];
  _MTLMessageContextBegin_();
  _MTLValidateResolveTextureWithContext([(MTLToolsObject *)self device], (uint64_t *)a3, 9uLL, [(MTLDebugRenderCommandEncoder *)self width], [(MTLDebugRenderCommandEncoder *)self height], a4, a5, a6, *v12, (char)self->_vertexBuiltinArguments);
  _MTLMessageContextEnd();
  [v11 setResolveTexture:a3];
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilResolveTexture:slice:depthPlane:level:", objc_msgSend(a3, "baseObject"), a4, a5, a6);
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  BOOL v14 = a7;
  BOOL v12 = objc_msgSend(*(id *)objc_msgSend(self->_frontFacingWinding, "_descriptorPrivate"), "_descriptorAtIndex:", 9);
  BOOL v13 = (void **)[v12 _descriptorPrivate];
  _MTLMessageContextBegin_();
  _MTLValidateResolveTextureWithContext([(MTLToolsObject *)self device], (uint64_t *)a3, 9uLL, [(MTLDebugRenderCommandEncoder *)self width], [(MTLDebugRenderCommandEncoder *)self height], a4, a5, a6, *v13, (char)self->_vertexBuiltinArguments);
  _MTLMessageContextEnd();
  [v12 setResolveTexture:a3];
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilResolveTexture:slice:depthPlane:level:yInvert:", objc_msgSend(a3, "baseObject"), a4, a5, a6, v14);
}

- (void)validateCommonDrawErrors:(unint64_t)a3 instanceCount:(unint64_t)a4 baseInstance:(unint64_t)a5 maxVertexID:(unint64_t)a6
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  unint64_t v11 = a3 - 5;
  if (a3 >= 5 && (v11 > 4 || !LOBYTE(self->_vertexBuiltinArguments))) {
    _MTLMessageContextPush_();
  }
  uint64_t v12 = [self->_frontFacingWinding rasterizationRateMap];
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && v12) {
    _MTLMessageContextPush_();
  }
  if (BYTE2(self->_visibilityOffsets))
  {
    _MTLMessageContextPush_();
    if (a4) {
      goto LABEL_10;
    }
  }
  else if (a4)
  {
    goto LABEL_10;
  }
  uint64_t v30 = 0;
  _MTLMessageContextPush_();
LABEL_10:
  uint64_t peakPerSampleStorage = (void *)self->_peakPerSampleStorage;
  if (!peakPerSampleStorage || ![peakPerSampleStorage descriptor]) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  BOOL v14 = (void *)[self->_peakPerSampleStorage descriptor];
  uint64_t v15 = [self->_peakPerSampleStorage attachmentWriteMask];
  self->_objectThreadsPerTG.width |= (([(MTLDepthStencilDescriptor *)self->_defaultDepthStencilDescriptor attachmentWriteMask] << 32) | 0xFFFFFFFFLL) & v15;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  switch([v14 inputPrimitiveTopology])
  {
    case 0:
      goto LABEL_19;
    case 1:
      if (a3) {
        goto LABEL_52;
      }
      goto LABEL_19;
    case 2:
      if (a3 - 3 < 0xFFFFFFFFFFFFFFFELL) {
        goto LABEL_52;
      }
      goto LABEL_19;
    case 3:
      if (v11 >= 0xFFFFFFFFFFFFFFFELL) {
        goto LABEL_19;
      }
LABEL_52:
      _MTLMessageContextPush_();
LABEL_19:
      unint64_t v16 = self->_peakPerSampleStorage;
      unint64_t v17 = a5 + a4;
      if (*(void *)(v16 + 40) < a6)
      {
        uint64_t v30 = (const char *)a6;
        _MTLMessageContextPush_();
      }
      if (*(void *)(v16 + 48) < v17)
      {
        uint64_t v30 = (const char *)v17;
        _MTLMessageContextPush_();
      }
      if ((self->_openGLModeEnabled & 3) == 0) {
        goto LABEL_47;
      }
      unint64_t v18 = self->_peakPerSampleStorage;
      unint64_t v32 = [(MTLToolsObject *)self device];
      if (!*(void *)(v18 + 152)) {
        goto LABEL_47;
      }
      unint64_t v19 = 0;
      p_type = &self->_vertexBuffers[0].type;
      unint64_t v21 = v18;
      break;
    default:
      abort();
  }
  do
  {
    uint64_t v22 = *(void *)(v21 + 160);
    uint64_t v23 = &p_type[11 * v22];
    if (!*(unsigned char *)v23 || p_type[11 * v22 + 1])
    {
      uint64_t v30 = "buffer";
      uint64_t v31 = *(void *)(v21 + 160);
      _MTLMessageContextPush_();
      int v24 = *(unsigned __int8 *)v23;
      BYTE1(p_type[11 * v22]) = 1;
      if (!v24) {
        goto LABEL_31;
      }
    }
    else
    {
      BYTE1(p_type[11 * v22]) = 1;
    }
    if (!p_type[11 * v22 + 1])
    {
      unsigned int v25 = *(const char **)(v21 + 168);
      if (v25 == (const char *)-1) {
        goto LABEL_37;
      }
      if (!v25) {
        goto LABEL_31;
      }
      if (p_type[11 * v22 + 6] != -1)
      {
        uint64_t v30 = (const char *)p_type[11 * v22 + 6];
        uint64_t v31 = *(void *)(v21 + 160);
        _MTLMessageContextPush_();
        unsigned int v25 = *(const char **)(v21 + 168);
        if (v25 == (const char *)-1)
        {
LABEL_37:
          long long v26 = &p_type[11 * v22];
          long long v28 = (const char *)v26[6];
          long long v27 = (const char **)(v26 + 6);
          unsigned int v25 = v28;
          if (v28 == (const char *)-1)
          {
            uint64_t v30 = *(const char **)(v21 + 160);
            _MTLMessageContextPush_();
            unsigned int v25 = *(const char **)(v21 + 168);
            if (v25 == (const char *)-1) {
              unsigned int v25 = *v27;
            }
          }
        }
      }
      if (([(MTLDevice *)v32 supportsUnalignedVertexFetch] & 1) == 0
        && (unint64_t)(v25 + 1) >= 2
        && (v25 & 3) != 0)
      {
        uint64_t v30 = v25;
        uint64_t v31 = *(void *)(v21 + 160);
        _MTLMessageContextPush_();
      }
    }
LABEL_31:
    ++v19;
    v21 += 16;
  }
  while (*(void *)(v18 + 152) > v19);
LABEL_47:
  objc_msgSend(self->_peakPerSampleStorage, "reflection", v30);
  [(MTLToolsDevice *)self->super.super.super._device maxFragmentBuffers];
  [(MTLToolsDevice *)self->super.super.super._device maxVertexTextures];
  [(MTLToolsDevice *)self->super.super.super._device maxFragmentTextures];
  if ([self->_peakPerSampleStorage isMeshShaderPipeline]) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  [(MTLDebugRenderCommandEncoder *)self validateCommonDrawErrors:3];
}

- (void)validateCommonDrawErrors:(unint64_t)a3
{
  char v3 = a3;
  v54[4] = *MEMORY[0x263EF8340];
  uint64_t v53 = 0;
  memset(v52, 0, sizeof(v52));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  uint64_t v5 = (void *)[self->_peakPerSampleStorage descriptor];
  int64_t v6 = self->_scissorRects.__end_cap_.__value_ - self->_scissorRects.__end_;
  if (v6 != 32
    && 0xAAAAAAAAAAAAAAABLL * ((self->_viewports.__end_cap_.__value_ - self->_viewports.__end_) >> 4) != v6 >> 5)
  {
    uint64_t v36 = v6 >> 5;
    unint64_t v38 = 0xAAAAAAAAAAAAAAABLL * ((self->_viewports.__end_cap_.__value_ - self->_viewports.__end_) >> 4);
    _MTLMessageContextPush_();
  }
  if (self->_openGLModeEnabled)
  {
    [(MTLDebugRenderCommandEncoder *)self updatePipelineData];
    uint64_t peakPerSampleStorage = (void *)self->_peakPerSampleStorage;
    if (peakPerSampleStorage
      && self->_resolvedRasterSampleCount
      && (objc_msgSend(peakPerSampleStorage, "isImageBlockLayoutInputCompatibleWithOutputOf:") & 1) == 0)
    {
      _MTLMessageContextPush_();
      if (!v5) {
        goto LABEL_14;
      }
    }
    else if (!v5)
    {
      goto LABEL_14;
    }
    if (objc_msgSend((id)objc_msgSend(v5, "vertexFunction", v36, v38), "renderTargetArrayIndexType")
      && ![self->_frontFacingWinding renderTargetArrayLength])
    {
      _MTLMessageContextPush_();
    }
  }
LABEL_14:
  uint64_t v50 = (void *)[(MTLDepthStencilDescriptor *)self->_defaultDepthStencilDescriptor descriptor];
  v51 = (const char *)[(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] protectionOptions];
  if ((v3 & 1) != 0 && (self->_openGLModeEnabled & 0xE) != 0)
  {
    memset(v54, 0, 31);
    unint64_t v9 = self->_peakPerSampleStorage;
    if ([(MTLToolsDevice *)self->super.super.super._device supportsUnalignedVertexFetch])
    {
      uint64_t v10 = *(void *)(v9 + 152);
      if (v10)
      {
        unint64_t v11 = (uint64_t *)(v9 + 160);
        do
        {
          uint64_t v12 = *v11;
          v11 += 2;
          *((unsigned char *)v54 + v12) = 1;
          --v10;
        }
        while (v10);
      }
    }
    device = self->super.super.super._device;
    uint64_t v43 = objc_msgSend((id)objc_msgSend(v5, "vertexFunction"), "name");
    uint64_t v40 = objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "reflection"), "vertexArguments");
    [(MTLToolsDevice *)self->super.super.super._device maxVertexTextures];
    [(MTLToolsDevice *)self->super.super.super._device maxVertexSamplers];
    validateFunctionArguments(device, @"Vertex", v43, v40, (uint64_t)&self->_vertexBuffers[0].type, (uint64_t)&self->_vertexTextures[0].type, (uint64_t)&self->_vertexSamplers[0].type, 0, 0, 0, 0, self->_commandBuffer, v51, (uint64_t)&self->_threadgroupMemoryArguments[0].type, [(MTLToolsDevice *)self->super.super.super._device maxComputeLocalMemorySizes], 1, (uint64_t)v54, (uint64_t)v52, LOBYTE(self->_depthBias));
  }
  if ((v3 & 2) != 0 && (self->_openGLModeEnabled & 0x70) != 0)
  {
    v47 = self->super.super.super._device;
    BOOL v13 = (void *)[v5 fragmentFunction];
    if (!v13) {
      BOOL v13 = objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "meshDescriptor"), "fragmentFunction");
    }
    uint64_t v44 = [v13 name];
    uint64_t v41 = objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "reflection"), "fragmentArguments");
    [(MTLToolsDevice *)self->super.super.super._device maxFragmentBuffers];
    [(MTLToolsDevice *)self->super.super.super._device maxFragmentTextures];
    [(MTLToolsDevice *)self->super.super.super._device maxFragmentSamplers];
    validateFunctionArguments(v47, @"Fragment", v44, v41, (uint64_t)&self->_fragmentBuffers[0].type, (uint64_t)&self->_fragmentTextures[0].type, (uint64_t)&self->_fragmentSamplers[0].type, (void *)[self->_frontFacingWinding colorAttachments], objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "descriptor"), "colorAttachments"), objc_msgSend(self->_frontFacingWinding, "renderTargetArrayLength"), v50, self->_commandBuffer, v51, (uint64_t)&self->_threadgroupMemoryArguments[0].type, -[MTLToolsDevice maxComputeLocalMemorySizes](self->super.super.super._device, "maxComputeLocalMemorySizes"), 1, 0, (uint64_t)v52, LOBYTE(self->_depthBias));
  }
  if ((v3 & 8) != 0)
  {
    if ((*(&self->_openGLModeEnabled + 1) & 7) != 0)
    {
      uint64_t v48 = self->super.super.super._device;
      uint64_t v45 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "meshDescriptor"), "objectFunction"), "name");
      NSUInteger v42 = objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "reflection"), "objectArguments");
      [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
      [(MTLToolsDevice *)self->super.super.super._device maxComputeTextures];
      [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
      validateFunctionArguments(v48, @"Object", v45, v42, (uint64_t)&self->_objectBuffers[0].type, (uint64_t)&self->_objectTextures[0].type, (uint64_t)&self->_objectSamplers[0].type, 0, 0, 0, 0, self->_commandBuffer, v51, (uint64_t)&self->_objectThreadgroupMemoryLengths[0].type, [(MTLToolsDevice *)self->super.super.super._device maxComputeLocalMemorySizes], 0, 0, (uint64_t)v52, LOBYTE(self->_depthBias));
    }
    [self->_peakPerSampleStorage _validateThreadgroupSize:&self->_objectThreadsPerTG.height stage:8 context:v52];
  }
  if ((v3 & 0x10) != 0)
  {
    if ((*(&self->_openGLModeEnabled + 1) & 0x70) != 0)
    {
      v49 = self->super.super.super._device;
      uint64_t v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "meshDescriptor"), "meshFunction"), "name");
      uint64_t v15 = objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "reflection"), "meshArguments");
      [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
      [(MTLToolsDevice *)self->super.super.super._device maxComputeTextures];
      [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
      validateFunctionArguments(v49, @"Mesh", v14, v15, (uint64_t)&self->_meshBuffers[0].type, (uint64_t)&self->_meshTextures[0].type, (uint64_t)&self->_meshSamplers[0].type, 0, 0, 0, 0, self->_commandBuffer, v51, 0, 0, 0, 0, (uint64_t)v52, LOBYTE(self->_depthBias));
    }
    [self->_peakPerSampleStorage _validateThreadgroupSize:&self->_meshThreadsPerTG.height stage:16 context:v52];
    if (([self->_peakPerSampleStorage isMeshShaderPipeline] & 1) == 0) {
      _MTLMessageContextPush_();
    }
  }
  unint64_t v16 = objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "descriptor"), "maxVertexAmplificationCount");
  unint64_t v17 = (void *)[self->_peakPerSampleStorage meshDescriptor];
  if (v17) {
    unint64_t v16 = [v17 maxVertexAmplificationCount];
  }
  first = self->_updatedFences.__map_.__first_;
  if (!first || v16 && v16 < (unint64_t)first)
  {
    NSUInteger v37 = self->_updatedFences.__map_.__first_;
    unint64_t v39 = v16;
    _MTLMessageContextPush_();
  }
  frontFacingWinding = (void *)self->_frontFacingWinding;
  double v20 = (void *)[(MTLDepthStencilDescriptor *)self->_defaultDepthStencilDescriptor descriptor];
  if (v20)
  {
    unint64_t v21 = v20;
    if ([v20 depthCompareFunction] != 7
      && [v21 depthCompareFunction]
      && !objc_msgSend((id)objc_msgSend(frontFacingWinding, "depthAttachment"), "texture"))
    {
      _MTLMessageContextPush_();
    }
    if ([v21 isDepthWriteEnabled]
      && !objc_msgSend((id)objc_msgSend(frontFacingWinding, "depthAttachment"), "texture"))
    {
      _MTLMessageContextPush_();
    }
    if (usesStencilTexture((MTLStencilDescriptor *)[v21 frontFaceStencil])
      && !objc_msgSend((id)objc_msgSend(frontFacingWinding, "stencilAttachment"), "texture"))
    {
      _MTLMessageContextPush_();
    }
    if (usesStencilTexture((MTLStencilDescriptor *)[v21 backFaceStencil])
      && !objc_msgSend((id)objc_msgSend(frontFacingWinding, "stencilAttachment"), "texture"))
    {
      _MTLMessageContextPush_();
    }
  }
  _MTLMessageContextEnd();
  LODWORD(self->_visibilityOffsets) = (uint64_t)self->_visibilityOffsets & 0x7FFF0001 | 0xFFFE;
  if (self->_openGLModeEnabled < 0)
  {
    uint64_t v22 = [self->_frontFacingWinding renderTargetArrayLength];
    uint64_t v23 = objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "descriptor"), "colorAttachments");
    if (!v23) {
      uint64_t v23 = objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "meshDescriptor"), "colorAttachments");
    }
    for (uint64_t i = 0; i != 8; ++i)
    {
      unsigned int v25 = objc_msgSend((id)objc_msgSend(self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", i);
      if (v25)
      {
        long long v26 = v25;
        if ([v25 texture])
        {
          if ([v26 storeAction] == 1
            && objc_msgSend((id)objc_msgSend(v23, "objectAtIndexedSubscript:", i), "writeMask"))
          {
            long long v27 = -[MTLDebugRenderTargetAttachmentInfo initWithDesc:renderTargetArrayLength:]([MTLDebugRenderTargetAttachmentInfo alloc], "initWithDesc:renderTargetArrayLength:", [v26 _descriptorPrivate], v22);
            [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:v27];
          }
        }
      }
    }
    long long v28 = objc_msgSend((id)objc_msgSend(self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", 8);
    uint64_t v29 = v28;
    if (v28 && [v28 texture])
    {
      BOOL v30 = [v29 storeAction] != 1 || v50 == 0;
      if (!v30 && [v50 isDepthWriteEnabled])
      {
        uint64_t v31 = -[MTLDebugRenderTargetAttachmentInfo initWithDesc:renderTargetArrayLength:]([MTLDebugRenderTargetAttachmentInfo alloc], "initWithDesc:renderTargetArrayLength:", [v29 _descriptorPrivate], v22);
        [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:v31];
      }
    }
    unint64_t v32 = objc_msgSend((id)objc_msgSend(self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", 9);
    if (v32)
    {
      uint64_t v33 = v32;
      if ([v32 texture])
      {
        if ([v33 storeAction] == 1)
        {
          uint64_t v34 = [v33 texture];
          if (v34 != [v29 texture]
            && v50
            && (writesStencilTexture((MTLStencilDescriptor *)[v50 backFaceStencil])
             || writesStencilTexture((MTLStencilDescriptor *)[v50 frontFaceStencil])))
          {
            id v35 = -[MTLDebugRenderTargetAttachmentInfo initWithDesc:renderTargetArrayLength:]([MTLDebugRenderTargetAttachmentInfo alloc], "initWithDesc:renderTargetArrayLength:", [v33 _descriptorPrivate], v22);
            [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:v35];
          }
        }
      }
    }
    [self->_maxVertexBuffers addActiveRenderTargets:self->_commandBuffer];
  }
  *(_DWORD *)&self->_openGLModeEnabled = 0;
}

- (void)_validateAllFunctionArguments:(_MTLMessageContext *)a3
{
  unint64_t v5 = 0;
  p_type = &self->_vertexBuffers[0].type;
  do
  {
    validateArg(MTLArgumentTypeBuffer, v5++, (MTLDebugFunctionArgument *)p_type, a3);
    p_type += 11;
  }
  while (v5 != 36);
  unint64_t v7 = 0;
  int v8 = &self->_vertexTextures[0].type;
  do
  {
    validateArg(MTLArgumentTypeTexture, v7++, (MTLDebugFunctionArgument *)v8, a3);
    v8 += 11;
  }
  while (v7 != 128);
  unint64_t v9 = 0;
  uint64_t v10 = &self->_vertexSamplers[0].type;
  do
  {
    validateArg(MTLArgumentTypeSampler, v9++, (MTLDebugFunctionArgument *)v10, a3);
    v10 += 11;
  }
  while (v9 != 16);
  unint64_t v11 = 0;
  uint64_t v12 = &self->_fragmentBuffers[0].type;
  do
  {
    validateArg(MTLArgumentTypeBuffer, v11++, (MTLDebugFunctionArgument *)v12, a3);
    v12 += 11;
  }
  while (v11 != 31);
  unint64_t v13 = 0;
  uint64_t v14 = &self->_fragmentTextures[0].type;
  do
  {
    validateArg(MTLArgumentTypeTexture, v13++, (MTLDebugFunctionArgument *)v14, a3);
    v14 += 11;
  }
  while (v13 != 128);
  unint64_t v15 = 0;
  unint64_t v16 = &self->_fragmentSamplers[0].type;
  do
  {
    validateArg(MTLArgumentTypeSampler, v15++, (MTLDebugFunctionArgument *)v16, a3);
    v16 += 11;
  }
  while (v15 != 16);
  unint64_t v17 = 0;
  unint64_t v18 = &self->_threadgroupMemoryArguments[0].type;
  do
  {
    validateArg(MTLArgumentTypeThreadgroupMemory, v17++, (MTLDebugFunctionArgument *)v18, a3);
    v18 += 11;
  }
  while (v17 != 31);
  unint64_t v19 = 0;
  double v20 = &self->_objectBuffers[0].type;
  do
  {
    validateArg(MTLArgumentTypeBuffer, v19++, (MTLDebugFunctionArgument *)v20, a3);
    v20 += 11;
  }
  while (v19 != 31);
  unint64_t v21 = 0;
  uint64_t v22 = &self->_objectTextures[0].type;
  do
  {
    validateArg(MTLArgumentTypeTexture, v21++, (MTLDebugFunctionArgument *)v22, a3);
    v22 += 11;
  }
  while (v21 != 128);
  unint64_t v23 = 0;
  int v24 = &self->_objectSamplers[0].type;
  do
  {
    validateArg(MTLArgumentTypeSampler, v23++, (MTLDebugFunctionArgument *)v24, a3);
    v24 += 11;
  }
  while (v23 != 16);
  unint64_t v25 = 0;
  long long v26 = &self->_objectThreadgroupMemoryLengths[0].type;
  do
  {
    validateArg(MTLArgumentTypeThreadgroupMemory, v25++, (MTLDebugFunctionArgument *)v26, a3);
    v26 += 11;
  }
  while (v25 != 31);
  unint64_t v27 = 0;
  long long v28 = &self->_meshBuffers[0].type;
  do
  {
    validateArg(MTLArgumentTypeBuffer, v27++, (MTLDebugFunctionArgument *)v28, a3);
    v28 += 11;
  }
  while (v27 != 31);
  unint64_t v29 = 0;
  BOOL v30 = &self->_meshTextures[0].type;
  do
  {
    validateArg(MTLArgumentTypeTexture, v29++, (MTLDebugFunctionArgument *)v30, a3);
    v30 += 11;
  }
  while (v29 != 128);
  unint64_t v31 = 0;
  unint64_t v32 = &self->_meshSamplers[0].type;
  do
  {
    validateArg(MTLArgumentTypeSampler, v31++, (MTLDebugFunctionArgument *)v32, a3);
    v32 += 11;
  }
  while (v31 != 16);
}

- (void)validateDrawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 function:(const char *)a7
{
  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    if (a5 <= 1) {
      unint64_t v12 = 1;
    }
    else {
      unint64_t v12 = a5;
    }
    [(MTLDebugRenderCommandEncoder *)self validateCommonDrawErrors:a3 instanceCount:a6 baseInstance:0 maxVertexID:a4 + v12 - 1];
    [(MTLToolsObject *)self device];
    _MTLMessageContextBegin_();
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "descriptor"), "vertexFunction"), "patchType"))
    {
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
  }
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  -[MTLDebugRenderCommandEncoder validateDrawPrimitives:vertexStart:vertexCount:instanceCount:function:](self, "validateDrawPrimitives:vertexStart:vertexCount:instanceCount:function:", a3, a4, a5, a6, "-[MTLDebugRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:instanceCount:]");
  id v11 = [(MTLToolsObject *)self baseObject];

  [v11 drawPrimitives:a3 vertexStart:a4 vertexCount:a5 instanceCount:a6];
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  -[MTLDebugRenderCommandEncoder validateDrawPrimitives:vertexStart:vertexCount:instanceCount:function:](self, "validateDrawPrimitives:vertexStart:vertexCount:instanceCount:function:", a3, a4, a5, 1, "-[MTLDebugRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:]");
  id v9 = [(MTLToolsObject *)self baseObject];

  [v9 drawPrimitives:a3 vertexStart:a4 vertexCount:a5];
}

- (void)validateDrawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 function:(const char *)a9
{
  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    uint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    [(MTLToolsObject *)self device];
    _MTLMessageContextBegin_();
    _MTLDebugValidateIndexBufferWithContext((uint64_t)self->super.super.super._device, a5, a6, (uint64_t)"indexBuffer", a7, 1, a4, (uint64_t *)&v18);
    if (a5)
    {
      if (a5 == 1)
      {
        char v16 = 32;
      }
      else
      {
        _MTLMessageContextPush_();
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 16;
    }
    uint64_t v17 = ~(-1 << v16);
    _MTLMessageContextEnd();
    [(MTLDebugRenderCommandEncoder *)self validateCommonDrawErrors:a3 instanceCount:a8 baseInstance:0 maxVertexID:v17];
    uint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    [(MTLToolsObject *)self device];
    _MTLMessageContextBegin_();
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "descriptor"), "vertexFunction"), "patchType"))
    {
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  -[MTLDebugRenderCommandEncoder validateDrawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:function:](self, "validateDrawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:function:", "-[MTLDebugRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:]");
  [self->_maxVertexBuffers addObject:a6 retained:1 purgeable:1];
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a6 baseObject];

  [v15 drawIndexedPrimitives:a3 indexCount:a4 indexType:a5 indexBuffer:v16 indexBufferOffset:a7 instanceCount:a8];
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  -[MTLDebugRenderCommandEncoder validateDrawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:function:](self, "validateDrawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:function:", a3, a4, a5, a6, a7, 1, "-[MTLDebugRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:]");
  [self->_maxVertexBuffers addObject:a6 retained:1 purgeable:1];
  id v13 = [(MTLToolsObject *)self baseObject];
  uint64_t v14 = [a6 baseObject];

  [v13 drawIndexedPrimitives:a3 indexCount:a4 indexType:a5 indexBuffer:v14 indexBufferOffset:a7];
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    [(MTLToolsObject *)self->super.super.super._device originalObject];
    MTLValidateFeatureSupport();
    if (a5 <= 1) {
      unint64_t v13 = 1;
    }
    else {
      unint64_t v13 = a5;
    }
    [(MTLDebugRenderCommandEncoder *)self validateCommonDrawErrors:a3 instanceCount:a6 baseInstance:a7 maxVertexID:a4 + v13 - 1];
    [(MTLToolsObject *)self device];
    _MTLMessageContextBegin_();
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "descriptor"), "vertexFunction"), "patchType"))
    {
      uint64_t v14 = "-[MTLDebugRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:]";
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v14), "drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:", a3, a4, a5, a6, a7);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    [(MTLToolsObject *)self->super.super.super._device originalObject];
    MTLValidateFeatureSupport();
    uint64_t v23 = 0;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
    [(MTLToolsObject *)self device];
    _MTLMessageContextBegin_();
    _MTLDebugValidateIndexBufferWithContext((uint64_t)self->super.super.super._device, a5, a6, (uint64_t)"indexBuffer", a7, 1, a4, (uint64_t *)&v20);
    if (a5)
    {
      if (a5 == 1)
      {
        char v17 = 32;
      }
      else
      {
        _MTLMessageContextPush_();
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 16;
    }
    uint64_t v18 = ~(-1 << v17);
    _MTLMessageContextEnd();
    [(MTLDebugRenderCommandEncoder *)self validateCommonDrawErrors:a3 instanceCount:a8 baseInstance:a10 maxVertexID:v18];
    uint64_t v23 = 0;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
    [(MTLToolsObject *)self device];
    _MTLMessageContextBegin_();
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "descriptor"), "vertexFunction"), "patchType"))
    {
      long long v19 = "-[MTLDebugRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:inst"
            "anceCount:baseVertex:baseInstance:]";
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
  }
  objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", a6, 1, 1, v19);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, a8, a9, a10);
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    [(MTLToolsObject *)self->super.super.super._device originalObject];
    MTLValidateFeatureSupport();
    uint64_t v13 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
    [(MTLToolsObject *)self device];
    _MTLMessageContextBegin_();
    validateIndirectBuffer((uint64_t)self->super.super.super._device, a4, a5, 16, (uint64_t)"sizeof(MTLDrawPrimitivesIndirectArguments)", (uint64_t *)&v10);
    _MTLMessageContextEnd();
    [(MTLDebugRenderCommandEncoder *)self validateCommonDrawErrors:a3 instanceCount:1 baseInstance:0 maxVertexID:1];
    uint64_t v13 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
    [(MTLToolsObject *)self device];
    _MTLMessageContextBegin_();
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "descriptor"), "vertexFunction"), "patchType"))
    {
      id v9 = "-[MTLDebugRenderCommandEncoder drawPrimitives:indirectBuffer:indirectBufferOffset:]";
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
  }
  objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", a4, 1, 1, v9);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:indirectBuffer:indirectBufferOffset:", a3, objc_msgSend(a4, "baseObject"), a5);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    [(MTLToolsObject *)self->super.super.super._device originalObject];
    MTLValidateFeatureSupport();
    uint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    [(MTLToolsObject *)self device];
    _MTLMessageContextBegin_();
    validateIndirectBuffer((uint64_t)self->super.super.super._device, a7, a8, 20, (uint64_t)"sizeof(MTLDrawIndexedPrimitivesIndirectArguments)", (uint64_t *)&v18);
    _MTLDebugValidateIndexBufferWithContext((uint64_t)self->super.super.super._device, a4, a5, (uint64_t)"indexBuffer", a6, 0, 0, (uint64_t *)&v18);
    if (a4)
    {
      if (a4 == 1)
      {
        char v15 = 32;
      }
      else
      {
        _MTLMessageContextPush_();
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 16;
    }
    uint64_t v16 = ~(-1 << v15);
    _MTLMessageContextEnd();
    [(MTLDebugRenderCommandEncoder *)self validateCommonDrawErrors:a3 instanceCount:1 baseInstance:0 maxVertexID:v16];
    uint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    [(MTLToolsObject *)self device];
    _MTLMessageContextBegin_();
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->_peakPerSampleStorage, "descriptor"), "vertexFunction"), "patchType"))
    {
      char v17 = "-[MTLDebugRenderCommandEncoder drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:"
            "indirectBufferOffset:]";
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
  }
  objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", a5, 1, 1, v17);
  [self->_maxVertexBuffers addObject:a7 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, objc_msgSend(a5, "baseObject"), a6, objc_msgSend(a7, "baseObject"), a8);
}

- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v12, 0, sizeof(v12));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers] <= a5)
  {
    unint64_t v10 = a5;
    unint64_t v11 = [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeInlineDataSize] < a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxComputeInlineDataSize];
    _MTLMessageContextPush_();
  }
  if (a5 <= 0x1E) {
    validateArg(MTLArgumentTypeBuffer, a5, (MTLDebugFunctionArgument *)&self->_objectBuffers[a5].type, &v12);
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectBytes:length:atIndex:", a3, a4, a5);
  MTLReportFailureTypeEnabled();
  p_type = &self->_objectBuffers[a5].type;
  *(unsigned char *)p_type = a4 != 0;
  *((unsigned char *)p_type + 1) = 0;
  p_type[1] = 0;
  p_type[2] = 0;
  p_type[3] = 0;
  p_type[4] = a4;
  *(_OWORD *)(p_type + 5) = xmmword_23BE4AC80;
  p_type[7] = 0;
  p_type[8] = 0;
  *((unsigned char *)p_type + 72) = 0;
  *((_DWORD *)p_type + 19) = 0;
  *((_DWORD *)p_type + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x100u;
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v14, 0, sizeof(v14));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers] > a5)
  {
    if (a3) {
      goto LABEL_5;
    }
LABEL_12:
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
  _MTLMessageContextPush_();
  if (!a3) {
    goto LABEL_12;
  }
LABEL_5:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    _MTLMessageContextPush_();
LABEL_13:
    unint64_t v10 = 0;
    goto LABEL_14;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  unint64_t v10 = *((void *)a3 + 8);
  if (v10 <= a4) {
    _MTLMessageContextPush_();
  }
LABEL_14:
  if (a5 <= 0x1E) {
    validateArg(MTLArgumentTypeBuffer, a5, (MTLDebugFunctionArgument *)&self->_objectBuffers[a5].type, &v14);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
  p_type = &self->_objectBuffers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    if (a3)
    {
      _MTLMessageContext v12 = &p_type[11 * a5];
      if (!*((unsigned char *)v12 + 72)
        && v12[6] == -1
        && v12[5] == a4
        && v12[4] == v10
        && (id)v12[2] == a3
        && !(v12[3] | v12[1])
        && *(_OWORD *)(v12 + 7) == 0
        && !*(unint64_t *)((char *)v12 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  uint64_t v13 = &p_type[11 * a5];
  *(unsigned char *)uint64_t v13 = v10 != 0;
  *((unsigned char *)v13 + 1) = 0;
  v13[1] = 0;
  v13[2] = (unint64_t)a3;
  _OWORD v13[3] = 0;
  v13[4] = v10;
  v13[5] = a4;
  v13[6] = -1;
  v13[7] = 0;
  v13[8] = 0;
  *((unsigned char *)v13 + 72) = 0;
  *((_DWORD *)v13 + 19) = 0;
  *((_DWORD *)v13 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x100u;
}

- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v19, 0, sizeof(v19));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers] <= a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
    _MTLMessageContextPush_();
  }
  if (a4 <= 0x1E)
  {
    p_type = (MTLDebugFunctionArgument *)&self->_objectBuffers[a4].type;
    validateArg(MTLArgumentTypeBuffer, a4, p_type, &v19);
    object = p_type->object;
    p_object = (id *)&p_type->object;
    int v8 = object;
    if (!object)
    {
LABEL_9:
      _MTLMessageContextPush_();
      goto LABEL_10;
    }
    if ([(baseLevel *)v8 length] <= a3)
    {
      [*p_object length];
      goto LABEL_9;
    }
  }
LABEL_10:
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectBufferOffset:atIndex:", a3, a4);
  unint64_t v11 = &self->_objectBuffers[0].type;
  _MTLMessageContext v12 = &self->_objectBuffers[a4].type;
  char v15 = (void *)v12[2];
  _MTLMessageContext v14 = (void **)(v12 + 2);
  uint64_t v13 = v15;
  uint64_t v16 = [v15 length];
  if (MTLReportFailureTypeEnabled())
  {
    if (v13)
    {
      char v17 = &v11[11 * a4];
      if (!*((unsigned char *)v17 + 72)
        && v17[6] == -1
        && v17[5] == a3
        && v17[4] == v16
        && *v14 == v13
        && !(v17[3] | v17[1])
        && *(_OWORD *)(v17 + 7) == 0
        && !*(unint64_t *)((char *)v17 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  long long v18 = &v11[11 * a4];
  *(unsigned char *)long long v18 = v16 != 0;
  *((unsigned char *)v18 + 1) = 0;
  v18[1] = 0;
  _OWORD v18[2] = (unint64_t)v13;
  _OWORD v18[3] = 0;
  v18[4] = v16;
  v18[5] = a3;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((unsigned char *)v18 + 72) = 0;
  *((_DWORD *)v18 + 19) = 0;
  *((_DWORD *)v18 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x100u;
}

- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  int v8 = self;
  uint64_t v36 = *MEMORY[0x263EF8340];
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v34, 0, sizeof(v34));
  [(MTLToolsObject *)v8 device];
  _MTLMessageContextBegin_();
  if (BYTE2(v8->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length > [(MTLToolsDevice *)v8->super.super.super._device maxComputeBuffers])
  {
    unint64_t v27 = (const void *)(location + length);
    uint64_t v28 = [(MTLToolsDevice *)v8->super.super.super._device maxComputeBuffers];
    _MTLMessageContextPush_();
  }
  NSUInteger v31 = location;
  NSUInteger v32 = length;
  if (!length)
  {
    _MTLMessageContextEnd();
    goto LABEL_52;
  }
  id v9 = 0;
  unint64_t v10 = (char *)v8 + 88 * location;
  do
  {
    if (!a3[(void)v9])
    {
      if (!a4[(void)v9]) {
        goto LABEL_17;
      }
      unint64_t v27 = v9;
      uint64_t v28 = a4[(void)v9];
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unint64_t v27 = v9;
      goto LABEL_16;
    }
    device = v8->super.super.super._device;
    if (device != (MTLToolsDevice *)[(id)a3[(void)v9] device])
    {
      unint64_t v27 = v9;
      _MTLMessageContextPush_();
    }
    if (a4[(void)v9] >= *((void *)a3[(void)v9] + 8))
    {
      unint64_t v29 = v9;
      uint64_t v30 = *((void *)a3[(void)v9] + 8);
      unint64_t v27 = v9;
      uint64_t v28 = a4[(void)v9];
LABEL_16:
      _MTLMessageContextPush_();
    }
LABEL_17:
    if ((unint64_t)v9 + location <= 0x1E) {
      validateArg(MTLArgumentTypeBuffer, (unint64_t)v9 + location, (MTLDebugFunctionArgument *)(v10 + 49616), &v34);
    }
    id v9 = (char *)v9 + 1;
    v10 += 88;
  }
  while ((const void *)length != v9);
  _MTLMessageContextEnd();
  uint64_t v12 = (uint64_t)(&v8->super.super._commandBuffer + 11 * location);
  uint64_t v13 = v35;
  _MTLMessageContext v14 = a4;
  do
  {
    if (*a3) {
      uint64_t v15 = *((void *)*a3 + 8);
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = v8;
    objc_msgSend((id)v8->_maxVertexBuffers, "addObject:retained:purgeable:", v27, v28, v29, v30);
    *uint64_t v13 = [(id)*a3 baseObject];
    uint64_t v17 = v12 + 49616;
    long long v18 = *a3;
    unint64_t v19 = *v14;
    if (MTLReportFailureTypeEnabled() && v18)
    {
      if (*(unsigned char *)(v12 + 49648)) {
        BOOL v20 = 0;
      }
      else {
        BOOL v20 = *(void *)(v12 + 49624) == -1;
      }
      if (v20
        && *(void *)v17 == v19
        && *(void *)(v12 + 49608) == v15
        && *(void *)(v12 + 49592) == (void)v18
        && (*(void *)(v12 + 49600) | *(void *)(v12 + 49584)) == 0
        && *(_OWORD *)(v12 + 49632) == 0
        && *(void *)(v12 + 49652) == 0)
      {
        unint64_t v27 = v18;
        MTLReportFailure();
      }
    }
    *(unsigned char *)(v12 + 49576) = v15 != 0;
    *(unsigned char *)(v12 + 49577) = 0;
    *(void *)(v12 + 49584) = 0;
    *(void *)(v12 + 49592) = v18;
    *(void *)(v12 + 49600) = 0;
    *(void *)(v12 + 49608) = v15;
    *(void *)uint64_t v17 = v19;
    *(void *)(v12 + 49624) = -1;
    *(void *)(v12 + 49632) = 0;
    *(void *)(v12 + 49640) = 0;
    *(unsigned char *)(v12 + 49648) = 0;
    v12 += 88;
    ++v14;
    ++v13;
    ++a3;
    *(_DWORD *)(v17 + 36) = 0;
    *(_DWORD *)(v17 + 40) = 0;
    --length;
    int v8 = v16;
  }
  while (length);
LABEL_52:
  objc_msgSend(-[MTLToolsObject baseObject](v8, "baseObject", v27), "setObjectBuffers:offsets:withRange:", v35, a4, v31, v32);
  *(_DWORD *)&v8->_openGLModeEnabled |= 0x100u;
}

- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v13, 0, sizeof(v13));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeTextures] <= a4)
  {
    unint64_t v11 = a4;
    unint64_t v12 = [(MTLToolsDevice *)self->super.super.super._device maxComputeTextures];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_10;
    }
  }
  else if (!a3)
  {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "storageMode", v11, v12) == 3) {
LABEL_9:
  }
    _MTLMessageContextPush_();
LABEL_10:
  if (a4 <= 0x7F) {
    validateArg(MTLArgumentTypeTexture, a4, (MTLDebugFunctionArgument *)&self->_objectTextures[a4].type, &v13);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_objectTextures[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    id v9 = &p_type[11 * a4];
    if (!*((unsigned char *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 1
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  unint64_t v10 = &p_type[11 * a4];
  *(unsigned char *)unint64_t v10 = a3 != 0;
  *((unsigned char *)v10 + 1) = 0;
  v10[1] = 1;
  v10[2] = (unint64_t)a3;
  _OWORD v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((unsigned char *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x200u;
}

- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v26 = *MEMORY[0x263EF8340];
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v24, 0, sizeof(v24));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length <= [(MTLToolsDevice *)self->super.super.super._device maxComputeTextures])
  {
    if (length) {
      goto LABEL_5;
    }
LABEL_40:
    _MTLMessageContextEnd();
    goto LABEL_41;
  }
  long long v22 = (const void *)(location + length);
  unint64_t v23 = [(MTLToolsDevice *)self->super.super.super._device maxComputeTextures];
  _MTLMessageContextPush_();
  if (!length) {
    goto LABEL_40;
  }
LABEL_5:
  int v8 = 0;
  id v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(void)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_11;
      }
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v8], "device", @"textures[%lu] is not an MTLTexture."))
      {
        long long v22 = v8;
        _MTLMessageContextPush_();
      }
      if (objc_msgSend((id)a3[(void)v8], "storageMode", v22, v23) == 3)
      {
LABEL_11:
        long long v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0x7F) {
      validateArg(MTLArgumentTypeTexture, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 52344), &v24);
    }
    int v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  unint64_t v11 = (char *)self + 88 * location;
  unint64_t v12 = v25;
  NSUInteger v13 = length;
  do
  {
    objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 1, v22);
    void *v12 = [(id)*a3 baseObject];
    _MTLMessageContext v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[52416]) {
        BOOL v15 = 0;
      }
      else {
        BOOL v15 = *((void *)v11 + 6549) == -1;
      }
      if (v15
        && *((void *)v11 + 6544) == 1
        && *((void *)v11 + 6545) == (void)v14
        && (*((void *)v11 + 6547) | *((void *)v11 + 6546) | *((void *)v11 + 6548)) == 0
        && *((_OWORD *)v11 + 3275) == 0
        && *(void *)(v11 + 52420) == 0)
      {
        long long v22 = v14;
        MTLReportFailure();
      }
    }
    uint64_t v21 = v11 + 52344;
    v11[52344] = v14 != 0;
    v11[52345] = 0;
    *((void *)v11 + 6544) = 1;
    *((void *)v11 + 6545) = v14;
    *((void *)v11 + 6546) = 0;
    *((void *)v11 + 6547) = 0;
    *((void *)v11 + 6548) = 0;
    *((void *)v11 + 6549) = -1;
    *((void *)v11 + 6550) = 0;
    *((void *)v11 + 6551) = 0;
    v11[52416] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_41:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setObjectTextures:withRange:", v25, location, length);
  *(_DWORD *)&self->_openGLModeEnabled |= 0x200u;
}

- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v11, 0, sizeof(v11));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers] <= a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)[a3 device]))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a4 <= 0xF) {
    validateArg(MTLArgumentTypeSampler, a4, (MTLDebugFunctionArgument *)&self->_objectSamplers[a4].type, &v11);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_objectSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    id v9 = &p_type[11 * a4];
    if (!*((unsigned char *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 2
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  unint64_t v10 = &p_type[11 * a4];
  *(unsigned char *)unint64_t v10 = a3 != 0;
  *((unsigned char *)v10 + 1) = 0;
  v10[1] = 2;
  v10[2] = (unint64_t)a3;
  _OWORD v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((unsigned char *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x400u;
}

- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v26 = *MEMORY[0x263EF8340];
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v24, 0, sizeof(v24));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length <= [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers])
  {
    if (length) {
      goto LABEL_5;
    }
LABEL_38:
    _MTLMessageContextEnd();
    goto LABEL_39;
  }
  long long v22 = (const void *)(location + length);
  unint64_t v23 = [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
  _MTLMessageContextPush_();
  if (!length) {
    goto LABEL_38;
  }
LABEL_5:
  int v8 = 0;
  id v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(void)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (device = self->super.super.super._device,
            device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v8], "device", @"samplers[%lu] is not an MTLSamplerState.")))
      {
        long long v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0xF) {
      validateArg(MTLArgumentTypeSampler, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 63608), &v24);
    }
    int v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  _MTLMessageContext v11 = (char *)self + 88 * location;
  unint64_t v12 = v25;
  NSUInteger v13 = length;
  do
  {
    objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v22, v23);
    void *v12 = [(id)*a3 baseObject];
    _MTLMessageContext v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[63680]) {
        BOOL v15 = 0;
      }
      else {
        BOOL v15 = *((void *)v11 + 7957) == -1;
      }
      if (v15
        && *((void *)v11 + 7952) == 2
        && *((void *)v11 + 7953) == (void)v14
        && (*((void *)v11 + 7955) | *((void *)v11 + 7954) | *((void *)v11 + 7956)) == 0
        && *((_OWORD *)v11 + 3979) == 0
        && *(void *)(v11 + 63684) == 0)
      {
        long long v22 = v14;
        MTLReportFailure();
      }
    }
    uint64_t v21 = v11 + 63608;
    v11[63608] = v14 != 0;
    v11[63609] = 0;
    *((void *)v11 + 7952) = 2;
    *((void *)v11 + 7953) = v14;
    *((void *)v11 + 7954) = 0;
    *((void *)v11 + 7955) = 0;
    *((void *)v11 + 7956) = 0;
    *((void *)v11 + 7957) = -1;
    *((void *)v11 + 7958) = 0;
    *((void *)v11 + 7959) = 0;
    v11[63680] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_39:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setObjectSamplerStates:withRange:", v25, location, length);
  *(_DWORD *)&self->_openGLModeEnabled |= 0x400u;
}

- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v19, 0, sizeof(v19));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers] <= a6)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)[a3 device]))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a6 <= 0xF) {
    validateArg(MTLArgumentTypeSampler, a6, (MTLDebugFunctionArgument *)&self->_objectSamplers[a6].type, &v19);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
  id v12 = [(MTLToolsObject *)self baseObject];
  uint64_t v13 = [a3 baseObject];
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  [v12 setObjectSamplerState:v13 lodMinClamp:a6 lodMaxClamp:v14 atIndex:v15];
  p_type = &self->_objectSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    uint64_t v17 = &p_type[11 * a6];
    if (*((_DWORD *)v17 + 20) == LODWORD(a5)
      && *((_DWORD *)v17 + 19) == LODWORD(a4)
      && *((unsigned char *)v17 + 72)
      && v17[6] == -1
      && v17[1] == 2
      && (id)v17[2] == a3
      && !(v17[4] | v17[3] | v17[5])
      && *(_OWORD *)(v17 + 7) == 0)
    {
      MTLReportFailure();
    }
  }
  long long v18 = &p_type[11 * a6];
  *(unsigned char *)long long v18 = a3 != 0;
  *((unsigned char *)v18 + 1) = 0;
  v18[1] = 2;
  _OWORD v18[2] = (unint64_t)a3;
  _OWORD v18[3] = 0;
  v18[4] = 0;
  v18[5] = 0;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((unsigned char *)v18 + 72) = 1;
  *((float *)v18 + 19) = a4;
  *((float *)v18 + 20) = a5;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x400u;
}

- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v38 = *MEMORY[0x263EF8340];
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v36, 0, sizeof(v36));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length > [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers])
  {
    uint64_t v30 = (const void *)(location + length);
    unint64_t v31 = [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
    _MTLMessageContextPush_();
  }
  NSUInteger v34 = length;
  id v35 = self;
  if (length)
  {
    unint64_t v10 = 0;
    NSUInteger v11 = location;
    id v12 = (char *)self + 88 * location;
    do
    {
      if (a3[(void)v10])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (device = v35->super.super.super._device,
              device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v10], "device", @"samplers[%lu] is not an MTLSamplerState.")))
        {
          uint64_t v30 = v10;
          _MTLMessageContextPush_();
        }
      }
      if ((unint64_t)v10 + location <= 0xF) {
        validateArg(MTLArgumentTypeSampler, (unint64_t)v10 + location, (MTLDebugFunctionArgument *)(v12 + 63608), &v36);
      }
      unint64_t v10 = (char *)v10 + 1;
      v12 += 88;
    }
    while ((const void *)length != v10);
    _MTLMessageContextEnd();
    NSUInteger v14 = length;
    uint64_t v15 = (uint64_t)&v35->_attachmentInfo[1] + 88 * location;
    uint64_t v16 = v37;
    long long v18 = a4;
    uint64_t v17 = a5;
    do
    {
      objc_msgSend((id)v35->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v30, v31);
      *uint64_t v16 = [(id)*a3 baseObject];
      _MTLMessageContext v19 = (_DWORD *)(v15 + 63608);
      BOOL v20 = *a3;
      int v21 = *(_DWORD *)v18;
      int v22 = *(_DWORD *)v17;
      if (MTLReportFailureTypeEnabled())
      {
        if (*v19 == v22
          && *(_DWORD *)(v15 + 63604) == v21
          && *(unsigned char *)(v15 + 63600) != 0
          && *(void *)(v15 + 63576) == -1
          && *(void *)(v15 + 63536) == 2
          && *(void *)(v15 + 63544) == (void)v20
          && (*(void *)(v15 + 63560) | *(void *)(v15 + 63552) | *(void *)(v15 + 63568)) == 0
          && *(_OWORD *)(v15 + 63584) == 0)
        {
          uint64_t v30 = v20;
          MTLReportFailure();
        }
      }
      *(unsigned char *)(v15 + 63528) = v20 != 0;
      *(unsigned char *)(v15 + 63529) = 0;
      *(void *)(v15 + 63536) = 2;
      *(void *)(v15 + 63544) = v20;
      *(void *)(v15 + 63552) = 0;
      *(void *)(v15 + 63560) = 0;
      *(void *)(v15 + 63568) = 0;
      *(void *)(v15 + 63576) = -1;
      *(void *)(v15 + 63584) = 0;
      *(void *)(v15 + 63592) = 0;
      v15 += 88;
      *((unsigned char *)v19 - 8) = 1;
      ++v17;
      ++v18;
      *(v19 - 1) = v21;
      *_MTLMessageContext v19 = v22;
      ++v16;
      ++a3;
      --v14;
    }
    while (v14);
  }
  else
  {
    NSUInteger v11 = location;
    _MTLMessageContextEnd();
  }
  objc_msgSend(-[MTLToolsObject baseObject](v35, "baseObject", v30), "setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v37, a4, a5, v11, v34);
  *(_DWORD *)&v35->_openGLModeEnabled |= 0x400u;
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v14, 0, sizeof(v14));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeLocalMemorySizes] <= a4)
  {
    unint64_t v10 = a4;
    unint64_t v12 = [(MTLToolsDevice *)self->super.super.super._device maxComputeLocalMemorySizes];
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxThreadgroupMemoryLength] < a3)
  {
    unint64_t v11 = a3;
    unint64_t v13 = [(MTLToolsDevice *)self->super.super.super._device maxThreadgroupMemoryLength];
    _MTLMessageContextPush_();
  }
  if (a3
     % [(MTLToolsDevice *)self->super.super.super._device maxComputeThreadgroupMemoryAlignmentBytes])
  {
    [(MTLToolsDevice *)self->super.super.super._device maxComputeThreadgroupMemoryAlignmentBytes];
    _MTLMessageContextPush_();
  }
  if (a4 <= 0x1E) {
    validateArg(MTLArgumentTypeThreadgroupMemory, a4, (MTLDebugFunctionArgument *)&self->_objectThreadgroupMemoryLengths[a4].type, &v14);
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectThreadgroupMemoryLength:atIndex:", a3, a4);
  p_type = &self->_objectThreadgroupMemoryLengths[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    int v8 = &p_type[11 * a4];
    if (!*((unsigned char *)v8 + 72)
      && !v8[8]
      && v8[7] == a3
      && v8[6] == -1
      && v8[1] == 3
      && !v8[2]
      && !(v8[4] | v8[3] | v8[5])
      && !*(unint64_t *)((char *)v8 + 76))
    {
      MTLReportFailure();
    }
  }
  id v9 = &p_type[11 * a4];
  *(unsigned char *)id v9 = a3 != 0;
  *((unsigned char *)v9 + 1) = 0;
  v9[1] = 3;
  *((_OWORD *)v9 + 1) = 0u;
  *((_OWORD *)v9 + 2) = 0u;
  v9[6] = -1;
  v9[7] = a3;
  v9[8] = 0;
  *((unsigned char *)v9 + 72) = 0;
  *((_DWORD *)v9 + 19) = 0;
  *((_DWORD *)v9 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x800u;
}

- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v12, 0, sizeof(v12));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers] <= a5)
  {
    unint64_t v10 = a5;
    unint64_t v11 = [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeInlineDataSize] < a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxComputeInlineDataSize];
    _MTLMessageContextPush_();
  }
  if (a5 <= 0x1E) {
    validateArg(MTLArgumentTypeBuffer, a5, (MTLDebugFunctionArgument *)&self->_meshBuffers[a5].type, &v12);
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshBytes:length:atIndex:", a3, a4, a5);
  MTLReportFailureTypeEnabled();
  p_type = &self->_meshBuffers[a5].type;
  *(unsigned char *)p_type = a4 != 0;
  *((unsigned char *)p_type + 1) = 0;
  p_type[1] = 0;
  p_type[2] = 0;
  p_type[3] = 0;
  p_type[4] = a4;
  *(_OWORD *)(p_type + 5) = xmmword_23BE4AC80;
  p_type[7] = 0;
  p_type[8] = 0;
  *((unsigned char *)p_type + 72) = 0;
  *((_DWORD *)p_type + 19) = 0;
  *((_DWORD *)p_type + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x1000u;
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v14, 0, sizeof(v14));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers] > a5)
  {
    if (a3) {
      goto LABEL_5;
    }
LABEL_12:
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
  _MTLMessageContextPush_();
  if (!a3) {
    goto LABEL_12;
  }
LABEL_5:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    _MTLMessageContextPush_();
LABEL_13:
    unint64_t v10 = 0;
    goto LABEL_14;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  unint64_t v10 = *((void *)a3 + 8);
  if (v10 <= a4) {
    _MTLMessageContextPush_();
  }
LABEL_14:
  if (a5 <= 0x1E) {
    validateArg(MTLArgumentTypeBuffer, a5, (MTLDebugFunctionArgument *)&self->_meshBuffers[a5].type, &v14);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
  p_type = &self->_meshBuffers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    if (a3)
    {
      _MTLMessageContext v12 = &p_type[11 * a5];
      if (!*((unsigned char *)v12 + 72)
        && v12[6] == -1
        && v12[5] == a4
        && v12[4] == v10
        && (id)v12[2] == a3
        && !(v12[3] | v12[1])
        && *(_OWORD *)(v12 + 7) == 0
        && !*(unint64_t *)((char *)v12 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  unint64_t v13 = &p_type[11 * a5];
  *(unsigned char *)unint64_t v13 = v10 != 0;
  *((unsigned char *)v13 + 1) = 0;
  v13[1] = 0;
  v13[2] = (unint64_t)a3;
  _OWORD v13[3] = 0;
  v13[4] = v10;
  v13[5] = a4;
  v13[6] = -1;
  v13[7] = 0;
  v13[8] = 0;
  *((unsigned char *)v13 + 72) = 0;
  *((_DWORD *)v13 + 19) = 0;
  *((_DWORD *)v13 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x1000u;
}

- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v19, 0, sizeof(v19));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers] <= a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
    _MTLMessageContextPush_();
  }
  if (a4 <= 0x1E)
  {
    p_type = (MTLDebugFunctionArgument *)&self->_meshBuffers[a4].type;
    validateArg(MTLArgumentTypeBuffer, a4, p_type, &v19);
    object = p_type->object;
    p_object = (id *)&p_type->object;
    int v8 = object;
    if (!object)
    {
LABEL_9:
      _MTLMessageContextPush_();
      goto LABEL_10;
    }
    if ([(baseLevel *)v8 length] <= a3)
    {
      [*p_object length];
      goto LABEL_9;
    }
  }
LABEL_10:
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshBufferOffset:atIndex:", a3, a4);
  unint64_t v11 = &self->_meshBuffers[0].type;
  _MTLMessageContext v12 = &self->_meshBuffers[a4].type;
  uint64_t v15 = (void *)v12[2];
  _MTLMessageContext v14 = (void **)(v12 + 2);
  unint64_t v13 = v15;
  uint64_t v16 = [v15 length];
  if (MTLReportFailureTypeEnabled())
  {
    if (v13)
    {
      uint64_t v17 = &v11[11 * a4];
      if (!*((unsigned char *)v17 + 72)
        && v17[6] == -1
        && v17[5] == a3
        && v17[4] == v16
        && *v14 == v13
        && !(v17[3] | v17[1])
        && *(_OWORD *)(v17 + 7) == 0
        && !*(unint64_t *)((char *)v17 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  long long v18 = &v11[11 * a4];
  *(unsigned char *)long long v18 = v16 != 0;
  *((unsigned char *)v18 + 1) = 0;
  v18[1] = 0;
  _OWORD v18[2] = (unint64_t)v13;
  _OWORD v18[3] = 0;
  v18[4] = v16;
  v18[5] = a3;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((unsigned char *)v18 + 72) = 0;
  *((_DWORD *)v18 + 19) = 0;
  *((_DWORD *)v18 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x1000u;
}

- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  int v8 = self;
  uint64_t v36 = *MEMORY[0x263EF8340];
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v34, 0, sizeof(v34));
  [(MTLToolsObject *)v8 device];
  _MTLMessageContextBegin_();
  if (BYTE2(v8->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length > [(MTLToolsDevice *)v8->super.super.super._device maxComputeBuffers])
  {
    unint64_t v27 = (const void *)(location + length);
    uint64_t v28 = [(MTLToolsDevice *)v8->super.super.super._device maxComputeBuffers];
    _MTLMessageContextPush_();
  }
  NSUInteger v31 = length;
  if (!length)
  {
    _MTLMessageContextEnd();
    goto LABEL_52;
  }
  id v9 = 0;
  unint64_t v10 = (char *)v8 + 88 * location;
  do
  {
    if (!a3[(void)v9])
    {
      if (!a4[(void)v9]) {
        goto LABEL_15;
      }
      unint64_t v27 = v9;
      uint64_t v28 = a4[(void)v9];
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unint64_t v27 = v9;
      _MTLMessageContextPush_();
    }
    device = v8->super.super.super._device;
    if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v9], "device", v27, v28, v29, v30))
    {
      unint64_t v27 = v9;
      _MTLMessageContextPush_();
    }
    if (a4[(void)v9] >= *((void *)a3[(void)v9] + 8))
    {
      unint64_t v29 = v9;
      uint64_t v30 = *((void *)a3[(void)v9] + 8);
      unint64_t v27 = v9;
      uint64_t v28 = a4[(void)v9];
LABEL_20:
      _MTLMessageContextPush_();
    }
LABEL_15:
    if ((unint64_t)v9 + location <= 0x1E) {
      validateArg(MTLArgumentTypeBuffer, (unint64_t)v9 + location, (MTLDebugFunctionArgument *)(v10 + 67744), &v34);
    }
    id v9 = (char *)v9 + 1;
    v10 += 88;
  }
  while ((const void *)length != v9);
  _MTLMessageContextEnd();
  uint64_t v12 = (uint64_t)(&v8->super.super._commandBuffer + 11 * location);
  NSUInteger v32 = location;
  unint64_t v13 = v35;
  _MTLMessageContext v14 = a4;
  do
  {
    if (*a3) {
      uint64_t v15 = *((void *)*a3 + 8);
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = v8;
    objc_msgSend((id)v8->_maxVertexBuffers, "addObject:retained:purgeable:", v27);
    *unint64_t v13 = [(id)*a3 baseObject];
    uint64_t v17 = v12 + 67744;
    long long v18 = *a3;
    unint64_t v19 = *v14;
    if (MTLReportFailureTypeEnabled() && v18)
    {
      if (*(unsigned char *)(v12 + 67776)) {
        BOOL v20 = 0;
      }
      else {
        BOOL v20 = *(void *)(v12 + 67752) == -1;
      }
      if (v20
        && *(void *)v17 == v19
        && *(void *)(v12 + 67736) == v15
        && *(void *)(v12 + 67720) == (void)v18
        && (*(void *)(v12 + 67728) | *(void *)(v12 + 67712)) == 0
        && *(_OWORD *)(v12 + 67760) == 0
        && *(void *)(v12 + 67780) == 0)
      {
        unint64_t v27 = v18;
        MTLReportFailure();
      }
    }
    *(unsigned char *)(v12 + 67704) = v15 != 0;
    *(unsigned char *)(v12 + 67705) = 0;
    *(void *)(v12 + 67712) = 0;
    *(void *)(v12 + 67720) = v18;
    *(void *)(v12 + 67728) = 0;
    *(void *)(v12 + 67736) = v15;
    *(void *)uint64_t v17 = v19;
    *(void *)(v12 + 67752) = -1;
    *(void *)(v12 + 67760) = 0;
    *(void *)(v12 + 67768) = 0;
    *(unsigned char *)(v12 + 67776) = 0;
    v12 += 88;
    ++v14;
    ++v13;
    ++a3;
    *(_DWORD *)(v17 + 36) = 0;
    *(_DWORD *)(v17 + 40) = 0;
    --length;
    int v8 = v16;
    NSUInteger location = v32;
  }
  while (length);
LABEL_52:
  objc_msgSend(-[MTLToolsObject baseObject](v8, "baseObject", v27), "setMeshBuffers:offsets:withRange:", v35, a4, location, v31);
  *(_DWORD *)&v8->_openGLModeEnabled |= 0x1000u;
}

- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v13, 0, sizeof(v13));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeTextures] <= a4)
  {
    unint64_t v11 = a4;
    unint64_t v12 = [(MTLToolsDevice *)self->super.super.super._device maxComputeTextures];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_10;
    }
  }
  else if (!a3)
  {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "storageMode", v11, v12) == 3) {
LABEL_9:
  }
    _MTLMessageContextPush_();
LABEL_10:
  if (a4 <= 0x7F) {
    validateArg(MTLArgumentTypeTexture, a4, (MTLDebugFunctionArgument *)&self->_meshTextures[a4].type, &v13);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_meshTextures[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    id v9 = &p_type[11 * a4];
    if (!*((unsigned char *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 1
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  unint64_t v10 = &p_type[11 * a4];
  *(unsigned char *)unint64_t v10 = a3 != 0;
  *((unsigned char *)v10 + 1) = 0;
  v10[1] = 1;
  v10[2] = (unint64_t)a3;
  _OWORD v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((unsigned char *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x2000u;
}

- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v26 = *MEMORY[0x263EF8340];
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v24, 0, sizeof(v24));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length <= [(MTLToolsDevice *)self->super.super.super._device maxComputeTextures])
  {
    if (length) {
      goto LABEL_5;
    }
LABEL_40:
    _MTLMessageContextEnd();
    goto LABEL_41;
  }
  int v22 = (const void *)(location + length);
  unint64_t v23 = [(MTLToolsDevice *)self->super.super.super._device maxComputeTextures];
  _MTLMessageContextPush_();
  if (!length) {
    goto LABEL_40;
  }
LABEL_5:
  int v8 = 0;
  id v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(void)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_11;
      }
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v8], "device", @"textures[%lu] is not an MTLTexture."))
      {
        int v22 = v8;
        _MTLMessageContextPush_();
      }
      if (objc_msgSend((id)a3[(void)v8], "storageMode", v22, v23) == 3)
      {
LABEL_11:
        int v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0x7F) {
      validateArg(MTLArgumentTypeTexture, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 70472), &v24);
    }
    int v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  unint64_t v11 = (char *)self + 88 * location;
  unint64_t v12 = v25;
  NSUInteger v13 = length;
  do
  {
    objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 1, v22);
    void *v12 = [(id)*a3 baseObject];
    _MTLMessageContext v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[70544]) {
        BOOL v15 = 0;
      }
      else {
        BOOL v15 = *((void *)v11 + 8815) == -1;
      }
      if (v15
        && *((void *)v11 + 8810) == 1
        && *((void *)v11 + 8811) == (void)v14
        && (*((void *)v11 + 8813) | *((void *)v11 + 8812) | *((void *)v11 + 8814)) == 0
        && *((_OWORD *)v11 + 4408) == 0
        && *(void *)(v11 + 70548) == 0)
      {
        int v22 = v14;
        MTLReportFailure();
      }
    }
    int v21 = v11 + 70472;
    v11[70472] = v14 != 0;
    v11[70473] = 0;
    *((void *)v11 + 8810) = 1;
    *((void *)v11 + 8811) = v14;
    *((void *)v11 + 8812) = 0;
    *((void *)v11 + 8813) = 0;
    *((void *)v11 + 8814) = 0;
    *((void *)v11 + 8815) = -1;
    *((void *)v11 + 8816) = 0;
    *((void *)v11 + 8817) = 0;
    v11[70544] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_41:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setMeshTextures:withRange:", v25, location, length);
  *(_DWORD *)&self->_openGLModeEnabled |= 0x2000u;
}

- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v11, 0, sizeof(v11));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers] <= a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)[a3 device]))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a4 <= 0xF) {
    validateArg(MTLArgumentTypeSampler, a4, (MTLDebugFunctionArgument *)&self->_meshSamplers[a4].type, &v11);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_meshSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    id v9 = &p_type[11 * a4];
    if (!*((unsigned char *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 2
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  unint64_t v10 = &p_type[11 * a4];
  *(unsigned char *)unint64_t v10 = a3 != 0;
  *((unsigned char *)v10 + 1) = 0;
  v10[1] = 2;
  v10[2] = (unint64_t)a3;
  _OWORD v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((unsigned char *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x4000u;
}

- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v26 = *MEMORY[0x263EF8340];
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v24, 0, sizeof(v24));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length <= [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers])
  {
    if (length) {
      goto LABEL_5;
    }
LABEL_38:
    _MTLMessageContextEnd();
    goto LABEL_39;
  }
  int v22 = (const void *)(location + length);
  unint64_t v23 = [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
  _MTLMessageContextPush_();
  if (!length) {
    goto LABEL_38;
  }
LABEL_5:
  int v8 = 0;
  id v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(void)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (device = self->super.super.super._device,
            device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v8], "device", @"samplers[%lu] is not an MTLSamplerState.")))
      {
        int v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0xF) {
      validateArg(MTLArgumentTypeSampler, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 81736), &v24);
    }
    int v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  _MTLMessageContext v11 = (char *)self + 88 * location;
  unint64_t v12 = v25;
  NSUInteger v13 = length;
  do
  {
    objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v22, v23);
    void *v12 = [(id)*a3 baseObject];
    _MTLMessageContext v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[81808]) {
        BOOL v15 = 0;
      }
      else {
        BOOL v15 = *((void *)v11 + 10223) == -1;
      }
      if (v15
        && *((void *)v11 + 10218) == 2
        && *((void *)v11 + 10219) == (void)v14
        && (*((void *)v11 + 10221) | *((void *)v11 + 10220) | *((void *)v11 + 10222)) == 0
        && *((_OWORD *)v11 + 5112) == 0
        && *(void *)(v11 + 81812) == 0)
      {
        int v22 = v14;
        MTLReportFailure();
      }
    }
    int v21 = v11 + 81736;
    v11[81736] = v14 != 0;
    v11[81737] = 0;
    *((void *)v11 + 10218) = 2;
    *((void *)v11 + 10219) = v14;
    *((void *)v11 + 10220) = 0;
    *((void *)v11 + 10221) = 0;
    *((void *)v11 + 10222) = 0;
    *((void *)v11 + 10223) = -1;
    *((void *)v11 + 10224) = 0;
    *((void *)v11 + 10225) = 0;
    v11[81808] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_39:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setMeshSamplerStates:withRange:", v25, location, length);
  *(_DWORD *)&self->_openGLModeEnabled |= 0x4000u;
}

- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v19, 0, sizeof(v19));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers] <= a6)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)[a3 device]))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a6 <= 0xF) {
    validateArg(MTLArgumentTypeSampler, a6, (MTLDebugFunctionArgument *)&self->_meshSamplers[a6].type, &v19);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
  id v12 = [(MTLToolsObject *)self baseObject];
  uint64_t v13 = [a3 baseObject];
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  [v12 setMeshSamplerState:v13 lodMinClamp:a6 lodMaxClamp:v14 atIndex:v15];
  p_type = &self->_meshSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    uint64_t v17 = &p_type[11 * a6];
    if (*((_DWORD *)v17 + 20) == LODWORD(a5)
      && *((_DWORD *)v17 + 19) == LODWORD(a4)
      && *((unsigned char *)v17 + 72)
      && v17[6] == -1
      && v17[1] == 2
      && (id)v17[2] == a3
      && !(v17[4] | v17[3] | v17[5])
      && *(_OWORD *)(v17 + 7) == 0)
    {
      MTLReportFailure();
    }
  }
  long long v18 = &p_type[11 * a6];
  *(unsigned char *)long long v18 = a3 != 0;
  *((unsigned char *)v18 + 1) = 0;
  v18[1] = 2;
  _OWORD v18[2] = (unint64_t)a3;
  _OWORD v18[3] = 0;
  v18[4] = 0;
  v18[5] = 0;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((unsigned char *)v18 + 72) = 1;
  *((float *)v18 + 19) = a4;
  *((float *)v18 + 20) = a5;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x4000u;
}

- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v38 = *MEMORY[0x263EF8340];
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  memset(&v36, 0, sizeof(v36));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length > [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers])
  {
    uint64_t v30 = (const void *)(location + length);
    unint64_t v31 = [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
    _MTLMessageContextPush_();
  }
  NSUInteger v34 = length;
  id v35 = self;
  if (length)
  {
    unint64_t v10 = 0;
    NSUInteger v11 = location;
    id v12 = (char *)self + 88 * location;
    do
    {
      if (a3[(void)v10])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (device = v35->super.super.super._device,
              device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v10], "device", @"samplers[%lu] is not an MTLSamplerState.")))
        {
          uint64_t v30 = v10;
          _MTLMessageContextPush_();
        }
      }
      if ((unint64_t)v10 + location <= 0xF) {
        validateArg(MTLArgumentTypeSampler, (unint64_t)v10 + location, (MTLDebugFunctionArgument *)(v12 + 81736), &v36);
      }
      unint64_t v10 = (char *)v10 + 1;
      v12 += 88;
    }
    while ((const void *)length != v10);
    _MTLMessageContextEnd();
    NSUInteger v14 = length;
    uint64_t v15 = (uint64_t)&v35->_attachmentInfo[1] + 88 * location;
    uint64_t v16 = v37;
    long long v18 = a4;
    uint64_t v17 = a5;
    do
    {
      objc_msgSend((id)v35->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v30, v31);
      *uint64_t v16 = [(id)*a3 baseObject];
      _MTLMessageContext v19 = (_DWORD *)(v15 + 81736);
      BOOL v20 = *a3;
      int v21 = *(_DWORD *)v18;
      int v22 = *(_DWORD *)v17;
      if (MTLReportFailureTypeEnabled())
      {
        if (*v19 == v22
          && *(_DWORD *)(v15 + 81732) == v21
          && *(unsigned char *)(v15 + 81728) != 0
          && *(void *)(v15 + 81704) == -1
          && *(void *)(v15 + 81664) == 2
          && *(void *)(v15 + 81672) == (void)v20
          && (*(void *)(v15 + 81688) | *(void *)(v15 + 81680) | *(void *)(v15 + 81696)) == 0
          && *(_OWORD *)(v15 + 81712) == 0)
        {
          uint64_t v30 = v20;
          MTLReportFailure();
        }
      }
      *(unsigned char *)(v15 + 81656) = v20 != 0;
      *(unsigned char *)(v15 + 81657) = 0;
      *(void *)(v15 + 81664) = 2;
      *(void *)(v15 + 81672) = v20;
      *(void *)(v15 + 81680) = 0;
      *(void *)(v15 + 81688) = 0;
      *(void *)(v15 + 81696) = 0;
      *(void *)(v15 + 81704) = -1;
      *(void *)(v15 + 81712) = 0;
      *(void *)(v15 + 81720) = 0;
      v15 += 88;
      *((unsigned char *)v19 - 8) = 1;
      ++v17;
      ++v18;
      *(v19 - 1) = v21;
      *_MTLMessageContext v19 = v22;
      ++v16;
      ++a3;
      --v14;
    }
    while (v14);
  }
  else
  {
    NSUInteger v11 = location;
    _MTLMessageContextEnd();
  }
  objc_msgSend(-[MTLToolsObject baseObject](v35, "baseObject", v30), "setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v37, a4, a5, v11, v34);
  *(_DWORD *)&v35->_openGLModeEnabled |= 0x4000u;
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  unint64_t var2 = a4->var2;
  *(_OWORD *)&self->_objectThreadsPerTG.height = *(_OWORD *)&a4->var0;
  self->_meshThreadsPerTG.width = var2;
  unint64_t v10 = a5->var2;
  *(_OWORD *)&self->_meshThreadsPerTG.height = *(_OWORD *)&a5->var0;
  *(void *)&self->_allowsNullBufferBinds = v10;
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  [(MTLDebugRenderCommandEncoder *)self validateCommonDrawErrors:26];
  id v11 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v14 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *a5;
  [v11 drawMeshThreadgroups:&v14 threadsPerObjectThreadgroup:&v13 threadsPerMeshThreadgroup:&v12];
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  unint64_t var2 = a4->var2;
  *(_OWORD *)&self->_objectThreadsPerTG.height = *(_OWORD *)&a4->var0;
  self->_meshThreadsPerTG.width = var2;
  unint64_t v10 = a5->var2;
  *(_OWORD *)&self->_meshThreadsPerTG.height = *(_OWORD *)&a5->var0;
  *(void *)&self->_allowsNullBufferBinds = v10;
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  [(MTLDebugRenderCommandEncoder *)self validateCommonDrawErrors:26];
  id v11 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v14 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *a5;
  [v11 drawMeshThreads:&v14 threadsPerObjectThreadgroup:&v13 threadsPerMeshThreadgroup:&v12];
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
{
  unint64_t var2 = a5->var2;
  *(_OWORD *)&self->_objectThreadsPerTG.height = *(_OWORD *)&a5->var0;
  self->_meshThreadsPerTG.width = var2;
  unint64_t v12 = a6->var2;
  *(_OWORD *)&self->_meshThreadsPerTG.height = *(_OWORD *)&a6->var0;
  *(void *)&self->_allowsNullBufferBinds = v12;
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  [(MTLDebugRenderCommandEncoder *)self validateCommonDrawErrors:26];
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  validateIndirectBuffer((uint64_t)self->super.super.super._device, a3, a4, 12, (uint64_t)"sizeof(MTLDispatchThreadgroupsIndirectArguments)", (uint64_t *)v17);
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  id v13 = [(MTLToolsObject *)self baseObject];
  uint64_t v14 = [a3 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v16 = *a5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v15 = *a6;
  [v13 drawMeshThreadgroupsWithIndirectBuffer:v14 indirectBufferOffset:a4 threadsPerObjectThreadgroup:&v16 threadsPerMeshThreadgroup:&v15];
}

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
{
  if (!a4) {
    MTLReportFailure();
  }
  id v7 = a3;
  std::deque<objc_object *>::push_back(&self->_updatedFences.__map_.var0, &v7);
  LODWORD(self->_visibilityOffsets) |= 2u;
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateFence:afterStages:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
{
  if (!a4) {
    MTLReportFailure();
  }
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  storingRenderTargets = self->_storingRenderTargets;
  if (storingRenderTargets)
  {
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      if ((*(__end_cap_ ***)((char *)self->_updatedFences.__map_.var1
                            + (((self->_updatedFences.__size_.__value_ + v8) >> 6) & 0x3FFFFFFFFFFFFF8)))[(self->_updatedFences.__size_.__value_ + v8) & 0x1FF] == a3)
      {
        _MTLMessageContextPush_();
        storingRenderTargets = self->_storingRenderTargets;
      }
      uint64_t v8 = v9;
    }
    while ((unint64_t)storingRenderTargets > v9++);
  }
  _MTLMessageContextEnd();
  LODWORD(self->_visibilityOffsets) |= 2u;
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForFence:beforeStages:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)endEncoding_private
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  memset(v23, 0, sizeof(v23));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (self->_commandBuffer)
  {
    objc_msgSend(self->_maxVertexBuffers, "addActiveRenderTargets:");

    self->_commandBuffer = 0;
  }
  frontFacingWinding = (void *)self->_frontFacingWinding;
  if (!frontFacingWinding) {
    goto LABEL_46;
  }
  uint64_t v4 = (void *)[frontFacingWinding colorAttachments];
  for (unint64_t i = 0; i != 10; ++i)
  {
    int64_t v6 = (void *)[v4 _descriptorAtIndex:i];
    if (!v6) {
      continue;
    }
    id v7 = v6;
    uint64_t v8 = [v6 texture];
    if (!v8) {
      continue;
    }
    unsigned int v9 = (void *)v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (i > 7)
      {
        uint64_t v10 = [v7 storeAction];
        if (i == 8)
        {
          if (v10 != 4) {
            goto LABEL_15;
          }
        }
        else if (v10 != 4)
        {
          goto LABEL_15;
        }
      }
      else
      {
        if ([v7 storeAction] != 4) {
          goto LABEL_15;
        }
        unint64_t v19 = i;
      }
      _MTLMessageContextPush_();
LABEL_15:
      if (objc_msgSend(v9, "storageMode", v19) == 3
        && [v7 storeAction]
        && [v7 storeAction] != 2)
      {
        _MTLMessageContextPush_();
      }
      int v11 = MTLReportFailureTypeEnabled();
      if (i <= 7 && v11 && ((HIDWORD(self->_visibilityOffsets) >> i) & 1) != 0) {
        -[MTLToolsRetainingContainer validateStoreLoadTransition:atIndex:renderTargetArrayLength:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "validateStoreLoadTransition:atIndex:renderTargetArrayLength:", v7, i, [self->_frontFacingWinding renderTargetArrayLength]);
      }
      uint64_t v12 = [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] protectionOptions];
      uint64_t v13 = [v9 protectionOptions];
      if (([v7 loadAction] == 1
         || [v7 storeAction] != 4 && objc_msgSend(v7, "storeAction"))
        && (v13 & ~v12) != 0)
      {
        uint64_t v21 = [v9 protectionOptions];
        uint64_t v22 = v12;
        unint64_t v20 = i;
        _MTLMessageContextPush_();
      }
      if (objc_msgSend(v7, "storeAction", v20, v21, v22) != 4 && objc_msgSend(v7, "storeAction") && (v12 & ~v13) != 0)
      {
        uint64_t v21 = [v9 protectionOptions];
        uint64_t v22 = v12;
        unint64_t v19 = i;
        _MTLMessageContextPush_();
      }
    }
    if (objc_msgSend(v7, "loadAction", v19) == 2 && objc_msgSend(v7, "storeAction")) {
      LODWORD(self->_visibilityOffsets) |= 2u;
    }
  }
  uint64_t v14 = (void *)[v4 _descriptorAtIndex:8];
  uint64_t v15 = [v4 _descriptorAtIndex:9];
  if (v14)
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v16 = (void *)v15;
    if (v15)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      _MTLValidateDepthStencilStoreStateWithContext([v14 storeAction], objc_msgSend(v16, "storeAction"), *(void *)(objc_msgSend(v16, "_descriptorPrivate") + 104), isKindOfClass & 1);
    }
  }
  int visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x10000) != 0)
  {
    _MTLMessageContextPush_();
    if (((uint64_t)self->_visibilityOffsets & 2) == 0) {
      goto LABEL_52;
    }
  }
  else
  {
    if ((visibilityOffsets & 2) != 0) {
      goto LABEL_43;
    }
LABEL_52:
    _MTLMessageContextPush_();
  }
LABEL_43:
  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled()) {
    [(MTLDebugRenderCommandEncoder *)self _validateAllFunctionArguments:v23];
  }
LABEL_46:
  _MTLMessageContextEnd();
  [(MTLDebugRenderCommandEncoder *)self _setDefaults];
  LODWORD(self->_visibilityOffsets) |= 0x10001u;
  if ([(MTLToolsDevice *)self->super.super.super._device storeValidationEnabled])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(MTLToolsObject *)self->super.super.super._parent mergeAttachmentWriteMask:self->_objectThreadsPerTG.width];
    }
    else
    {
      v25[0] = xmmword_23BE4AD60;
      v25[1] = unk_23BE4AD70;
      [(MTLDevice *)[(MTLToolsObject *)self device] clearRenderEncoder:self writeMask:self->_objectThreadsPerTG.width withCheckerboard:v25];
    }
  }
}

- (void)endEncoding
{
  [(MTLDebugRenderCommandEncoder *)self endEncoding_private];
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 endEncoding];
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  [(MTLDebugRenderCommandEncoder *)self endEncoding_private];
  id v3 = [(MTLToolsObject *)self baseObject];

  return (id)[v3 endEncodingAndRetrieveProgramAddressTable];
}

- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5
{
  validateSupportsTessellation(self->super.super.super._device);
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (a3)
  {
    _MTLDebugValidateBuffer((uint64_t)self->super.super.super._device, a3);
    if ((a4 & 3) == 0) {
      goto LABEL_5;
    }
  }
  else if (!a4)
  {
    goto LABEL_5;
  }
  unint64_t v10 = a4;
  _MTLMessageContextPush_();
LABEL_5:
  if ((a5 & 3) != 0)
  {
    unint64_t v10 = a5;
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  unint64_t v9 = [a3 length];
  if (MTLReportFailureTypeEnabled()
    && a3
    && !LOBYTE(self->_tessellationFactorBufferArgument.lodMaxClamp)
    && self->_tessellationFactorBufferArgument.threadgroupMemoryLength == -1
    && self->_tessellationFactorBufferArgument.bufferAttributeStride == a4
    && self->_tessellationFactorBufferArgument.bufferOffset == v9
    && self->_tessellationFactorBufferArgument.var0 == a3
    && !(self->_tessellationFactorBufferArgument.bufferLength | (unint64_t)self->_tessellationFactorBufferArgument.object)
    && *(_OWORD *)&self->_tessellationFactorBufferArgument.threadgroupMemoryOffset == 0
    && !*(void *)(&self->_tessellationFactorBufferArgument.lodMaxClamp + 1))
  {
    unint64_t v10 = (unint64_t)a3;
    MTLReportFailure();
  }
  LOBYTE(self->_tessellationFactorBufferArgument.type) = v9 != 0;
  BYTE1(self->_tessellationFactorBufferArgument.type) = 0;
  self->_tessellationFactorBufferArgument.object = 0;
  self->_tessellationFactorBufferArgument.unint64_t var0 = (unint64_t)a3;
  self->_tessellationFactorBufferArgument.bufferLength = 0;
  self->_tessellationFactorBufferArgument.bufferOffset = v9;
  self->_tessellationFactorBufferArgument.bufferAttributeStride = a4;
  self->_tessellationFactorBufferArgument.threadgroupMemoryLength = -1;
  self->_tessellationFactorBufferArgument.threadgroupMemoryOffset = 0;
  *(void *)&self->_tessellationFactorBufferArgument.hasLodClamp = 0;
  LOBYTE(self->_tessellationFactorBufferArgument.lodMaxClamp) = 0;
  *((_DWORD *)&self->_tessellationFactorBufferArgument.lodMaxClamp + 1) = 0;
  LODWORD(self[1].super.super.super.super.isa) = 0;
  *(void *)&self->_tessellationFactorBufferArgument.isValid = a5;
  objc_msgSend(self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1, v10);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTessellationFactorBuffer:offset:instanceStride:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setTessellationFactorScale:(float)a3
{
  validateSupportsTessellation(self->super.super.super._device);
  if (SLODWORD(a3) <= -1 || ((LODWORD(a3) & 0x7FFFFFFFu) - 0x800000) >> 24 >= 0x7F)
  {
    double v9 = a3;
    MTLReportFailure();
  }
  *((float *)&self->_descriptor + 1) = a3;
  id v7 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v8 = a3;

  [v7 setTessellationFactorScale:v8];
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  [(MTLDebugRenderCommandEncoder *)self validateCommonDrawErrors:3 instanceCount:a8 baseInstance:a9 maxVertexID:1];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v16 = (void *)[self->_peakPerSampleStorage descriptor];
  if (!LOBYTE(self->_vertexBuiltinArguments)) {
    validateCommonTessellationErrors(self->super.super.super._device, v16, (uint64_t)&self->_tessellationFactorBufferArgument.type, *(void *)&self->_tessellationFactorBufferArgument.isValid, a3, 0, 0, (uint64_t)"-[MTLDebugRenderCommandEncoder drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:]", a4, a5, a9, a8);
  }
  _MTLDebugValidatePatchIndexBuffer((uint64_t)self->super.super.super._device, a6, (uint64_t)"patchIndexBuffer", a7, 1, a4, a5, v17, a8);
  [self->_maxVertexBuffers addObject:a6 retained:1 purgeable:1];
  id v18 = [(MTLToolsObject *)self baseObject];
  uint64_t v19 = [a6 baseObject];

  objc_msgSend(v18, "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, v19, a7, a8);
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  [(MTLDebugRenderCommandEncoder *)self validateCommonDrawErrors:3 instanceCount:1 baseInstance:0 maxVertexID:1];
  uint64_t v13 = (void *)[self->_peakPerSampleStorage descriptor];
  if (!LOBYTE(self->_vertexBuiltinArguments)) {
    validateCommonTessellationErrors(self->super.super.super._device, v13, (uint64_t)&self->_tessellationFactorBufferArgument.type, *(void *)&self->_tessellationFactorBufferArgument.isValid, a3, 1, 0, (uint64_t)"-[MTLDebugRenderCommandEncoder drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:]", 0, 0, 0, 0);
  }
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  _MTLDebugValidatePatchIndexBufferWithContext((unint64_t)self->super.super.super._device, a4, (uint64_t)"patchIndexBuffer", a5, 0, 0, 0, v14, 0, (uint64_t *)v15);
  validateIndirectBuffer((uint64_t)self->super.super.super._device, a6, a7, 16, (uint64_t)"sizeof(MTLDrawPatchIndirectArguments)", (uint64_t *)v15);
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a4 retained:1 purgeable:1];
  [self->_maxVertexBuffers addObject:a6 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, objc_msgSend(a4, "baseObject"), a5, objc_msgSend(a6, "baseObject"), a7);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  [(MTLDebugRenderCommandEncoder *)self validateCommonDrawErrors:3 instanceCount:a10 baseInstance:a11 maxVertexID:1];
  uint64_t v17 = (void *)[self->_peakPerSampleStorage descriptor];
  if (!LOBYTE(self->_vertexBuiltinArguments)) {
    validateCommonTessellationErrors(self->super.super.super._device, v17, (uint64_t)&self->_tessellationFactorBufferArgument.type, *(void *)&self->_tessellationFactorBufferArgument.isValid, a3, 0, 1, (uint64_t)"-[MTLDebugRenderCommandEncoder drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:]", a4, a5, a11, a10);
  }
  uint64_t v22 = 0;
  memset(v21, 0, sizeof(v21));
  _MTLMessageContextBegin_();
  _MTLDebugValidatePatchIndexBufferWithContext((unint64_t)self->super.super.super._device, a6, (uint64_t)"patchIndexBuffer", a7, 1, a4, a5, v18, a10, (uint64_t *)v21);
  if (a3)
  {
    uint64_t v19 = _MTLTessellationControlPointIndexTypeToMTLIndexType((MTLTessellationControlPointIndexType)[v17 tessellationControlPointIndexType]);
    _MTLDebugValidateIndexBufferWithContext((uint64_t)self->super.super.super._device, v19, a8, (uint64_t)"controlPointIndexBuffer", a9, a6 == 0, (a5 + a4) * a3, (uint64_t *)v21);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a6 retained:1 purgeable:1];
  [self->_maxVertexBuffers addObject:a8 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, objc_msgSend(a8, "baseObject"), a9, a10, a11);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  [(MTLDebugRenderCommandEncoder *)self validateCommonDrawErrors:3 instanceCount:1 baseInstance:0 maxVertexID:1];
  uint64_t v15 = (void *)[self->_peakPerSampleStorage descriptor];
  if (!LOBYTE(self->_vertexBuiltinArguments)) {
    validateCommonTessellationErrors(self->super.super.super._device, v15, (uint64_t)&self->_tessellationFactorBufferArgument.type, *(void *)&self->_tessellationFactorBufferArgument.isValid, a3, 1, 1, (uint64_t)"-[MTLDebugRenderCommandEncoder drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:]", 0, 0, 0, 0);
  }
  uint64_t v20 = 0;
  memset(v19, 0, sizeof(v19));
  _MTLMessageContextBegin_();
  _MTLDebugValidatePatchIndexBufferWithContext((unint64_t)self->super.super.super._device, a4, (uint64_t)"patchIndexBuffer", a5, 0, 0, 0, v16, 0, (uint64_t *)v19);
  validateIndirectBuffer((uint64_t)self->super.super.super._device, a8, a9, 16, (uint64_t)"sizeof(MTLDrawPatchIndirectArguments)", (uint64_t *)v19);
  if (a3)
  {
    uint64_t v17 = _MTLTessellationControlPointIndexTypeToMTLIndexType((MTLTessellationControlPointIndexType)[v15 tessellationControlPointIndexType]);
    _MTLDebugValidateIndexBufferWithContext((uint64_t)self->super.super.super._device, v17, a6, (uint64_t)"controlPointIndexBuffer", a7, 0, 0, (uint64_t *)v19);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a4 retained:1 purgeable:1];
  [self->_maxVertexBuffers addObject:a6 retained:1 purgeable:1];
  [self->_maxVertexBuffers addObject:a8 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, objc_msgSend(a4, "baseObject"), a5, objc_msgSend(a6, "baseObject"), a7, objc_msgSend(a8, "baseObject"), a9);
}

- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  if (a3 > a4)
  {
    uint64_t v10 = *(void *)&a3;
    uint64_t v11 = *(void *)&a4;
    MTLReportFailure();
  }
  id v9 = [(MTLToolsObject *)self baseObject];

  [v9 filterCounterRangeWithFirstBatch:v7 lastBatch:v6 filterIndex:v5];
}

- (void)textureBarrier
{
}

- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5
{
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  _MTLMessageContextBegin_();
  validateCommonBarrier((uint64_t)self->super.super.super._device, (uint64_t)v9, a3, a4, a5);
  if (![(MTLToolsDevice *)self->super.super.super._device supportsPartialRenderMemoryBarrier])goto LABEL_5; {
  if ((a3 & 4) != 0)
  }
    _MTLMessageContextPush_();
  if ((a4 & 6) != 0) {
LABEL_5:
  }
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "memoryBarrierWithScope:afterStages:beforeStages:", a3, a4, a5);
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v31 = 0;
  memset(v30, 0, sizeof(v30));
  p_device = (uint64_t *)&self->super.super.super._device;
  _MTLMessageContextBegin_();
  validateCommonBarrier(*p_device, (uint64_t)v30, 3uLL, a5, a6);
  if (!a3 || !a4) {
    _MTLMessageContextPush_();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device supportsPartialRenderMemoryBarrier])
  {
    if ((a5 & 6) != 0)
    {
      unint64_t v21 = a5;
      _MTLMessageContextPush_();
    }
  }
  else
  {
    _MTLMessageContextPush_();
  }
  std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
  unint64_t v22 = a5;
  unint64_t v23 = a6;
  if (a4)
  {
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = (void *)a3[v11];
      if (!v12)
      {
        unint64_t v21 = v11;
        MTLReportFailure();
        uint64_t v12 = (void *)a3[v11];
      }
      uint64_t v13 = objc_msgSend(v12, "baseObject", v21);
      *((void *)__p[0] + v11) = v13;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = a3[v11];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v15 = (void *)[(MTLDebugCommandBuffer *)self->_commandBuffer allObjects];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v32 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v26 != v17) {
                objc_enumerationMutation(v15);
              }
              uint64_t v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              if ((const void *)[v19 attachmentTexture] == v14) {
                [(MTLDebugCommandBuffer *)self->_commandBuffer removeObject:v19];
              }
            }
            uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v32 count:16];
          }
          while (v16);
        }
      }
      ++v11;
    }
    while (v11 != a4);
  }
  _MTLMessageContextEnd();
  id v20 = [(MTLToolsObject *)self baseObject];
  [v20 memoryBarrierWithResources:__p[0] count:a4 afterStages:v22 beforeStages:v23];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  _MTLMessageContextBegin_();
  v18.NSUInteger length = [a3 size];
  v17.NSUInteger location = location;
  v17.NSUInteger length = length;
  v18.NSUInteger location = 0;
  NSRange v8 = NSIntersectionRange(v17, v18);
  if (v8.location != location || v8.length != length)
  {
    NSUInteger v10 = length;
    uint64_t v11 = [a3 size];
    NSUInteger v9 = location;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "descriptor", v9, v10, v11), "inheritPipelineState")
    && ([(MTLRenderPipelineState *)[(MTLDebugRenderCommandEncoder *)self renderPipelineState] supportIndirectCommandBuffers] & 1) == 0)
  {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  v12.receiver = self;
  v12.super_class = (Class)MTLDebugRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder executeCommandsInBuffer:withRange:](&v12, sel_executeCommandsInBuffer_withRange_, a3, location, length);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  if (objc_msgSend((id)objc_msgSend(a3, "descriptor"), "inheritPipelineState")
    && ([(MTLRenderPipelineState *)[(MTLDebugRenderCommandEncoder *)self renderPipelineState] supportIndirectCommandBuffers] & 1) == 0)
  {
    MTLReportFailure();
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v9 executeCommandsInBuffer:a3 indirectBuffer:a4 indirectBufferOffset:a5];
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  BOOL v5 = a5;
  _MTLMessageContextBegin_();
  if ([(MTLToolsDevice *)self->super.super.super._device supportsCounterSampling:1])
  {
    if (!a3) {
      goto LABEL_9;
    }
  }
  else
  {
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_9;
    }
  }
  if (([a3 conformsToProtocol:&unk_26EF802D0] & 1) == 0)
  {
LABEL_8:
    _MTLMessageContextPush_();
    goto LABEL_9;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  if ([a3 sampleCount] <= a4)
  {
    [a3 sampleCount];
    goto LABEL_8;
  }
LABEL_9:
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:0];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampleCountersInBuffer:atSampleIndex:withBarrier:", objc_msgSend(a3, "baseObject"), a4, v5);
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4 maxBuffers:(unint64_t)a5 buffers:(MTLDebugFunctionArgument *)a6 buffersLength:(unint64_t)a7 stage:(unint64_t)a8
{
  memset(&v22, 0, sizeof(v22));
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (a4 >= a5)
  {
    unint64_t v20 = a4;
    unint64_t v21 = a5;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend((id)-[MTLDevice baseObject](-[MTLToolsObject device](self, "device", v20, v21, v22.var0, v22.var1, *(void *)&v22.var2, v22.var3, v22.var4, v22.var5, v22.var6), "baseObject"), "supportsFunctionPointers"))
  {
    if (!a3) {
      goto LABEL_10;
    }
  }
  else
  {
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_10;
    }
  }
  if (![a3 conformsToProtocol:&unk_26EF85818]
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)[a3 device]))
  {
    _MTLMessageContextPush_();
  }
LABEL_10:
  if (a4 < a7) {
    validateArg(MTLArgumentTypeVisibleFunctionTable, a4, &a6[a4], &v22);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  switch(a8)
  {
    case 2uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 3uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 4uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 5uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 6uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    default:
      break;
  }
  uint64_t v16 = [a3 functionCount];
  if (MTLReportFailureTypeEnabled())
  {
    NSRange v17 = &a6[a4];
    v18.i64[0] = v17->type;
    v18.i64[1] = v17->var0;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v18, (int64x2_t)xmmword_23BE4AC90), (int32x4_t)vceqq_s64(*(int64x2_t *)&v17->bufferLength, (int64x2_t)(unint64_t)v16))))) & 1) == 0&& v17->bufferAttributeStride == -1&& *(_OWORD *)&v17->threadgroupMemoryLength == 0&& v17->object == a3&& a3&& !*(void *)&v17->lodMinClamp&& !v17->hasLodClamp)
    {
      MTLReportFailure();
    }
  }
  uint64_t v19 = &a6[a4];
  v19->isValid = v16 != 0;
  v19->hasBeenUsed = 0;
  v19->type = 5;
  v19->object = (baseLevel *)a3;
  v19->unint64_t var0 = 0;
  v19->bufferLength = v16;
  *(_OWORD *)&v19->bufferOffset = xmmword_23BE4AC80;
  v19->threadgroupMemoryLength = 0;
  v19->threadgroupMemoryOffset = 0;
  v19->hasLodClamp = 0;
  v19->lodMinClamp = 0.0;
  v19->lodMaxClamp = 0.0;
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4 maxBuffers:(unint64_t)a5 buffers:(MTLDebugFunctionArgument *)a6 buffersLength:(unint64_t)a7 stage:(unint64_t)a8
{
  *(void *)&long long v36 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v38 = *MEMORY[0x263EF8340];
  memset(&v37, 0, sizeof(v37));
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length > a5) {
    _MTLMessageContextPush_();
  }
  v35.i64[0] = a5;
  if ((objc_msgSend((id)-[MTLDevice baseObject](-[MTLToolsObject device](self, "device"), "baseObject"), "supportsFunctionPointers") & 1) == 0)_MTLMessageContextPush_(); {
  unint64_t v33 = a8;
  }
  NSUInteger v34 = location;
  if (length)
  {
    uint64_t v14 = 0;
    long long v15 = (MTLDebugFunctionArgument *)(v36 + 88 * location);
    do
    {
      uint64_t v16 = (void *)a3[v14];
      if (v16)
      {
        if ([v16 conformsToProtocol:&unk_26EF85818])
        {
          device = self->super.super.super._device;
          if (device != (MTLToolsDevice *)[(id)a3[v14] device]) {
            _MTLMessageContextPush_();
          }
          NSUInteger location = v34;
          if (![(id)a3[v14] stage] || objc_msgSend((id)a3[v14], "stage") == v33) {
            goto LABEL_17;
          }
          NSUInteger v32 = MTLDebugStageToString([(id)a3[v14] stage]);
          MTLDebugStageToString(v33);
        }
        _MTLMessageContextPush_();
      }
LABEL_17:
      if (location + v14 < a7) {
        validateArg(MTLArgumentTypeVisibleFunctionTable, location + v14, v15, &v37);
      }
      ++v14;
      ++v15;
    }
    while (length != v14);
  }
  uint64_t v18 = _MTLMessageContextEnd();
  uint64_t v31 = (uint64_t)&v31;
  MEMORY[0x270FA5388](v18);
  NSUInteger v32 = (__CFString *)((char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (length)
  {
    uint64_t v20 = v36 + 88 * v34 + 40;
    int64x2_t v35 = (int64x2_t)xmmword_23BE4AC90;
    long long v36 = xmmword_23BE4AC80;
    unint64_t v21 = v32;
    NSUInteger v22 = length;
    do
    {
      [self->_maxVertexBuffers addObject:*a3 retained:1 purgeable:1];
      v21->isa = (void *)[(id)*a3 baseObject];
      unint64_t v23 = *a3;
      uint64_t v24 = [(id)*a3 functionCount];
      if (MTLReportFailureTypeEnabled())
      {
        v25.i64[0] = *(void *)(v20 - 32);
        v25.i64[1] = *(void *)(v20 - 16);
        if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v25, v35), (int32x4_t)vceqq_s64(*(int64x2_t *)(v20 - 8), (int64x2_t)(unint64_t)v24))))) & 1) == 0&& *(void *)(v20 + 8) == -1&& *(_OWORD *)(v20 + 16) == 0&& *(const void **)(v20 - 24) == v23&& v23&& !*(void *)(v20 + 36)&& !*(unsigned char *)(v20 + 32))
        {
          MTLReportFailure();
        }
      }
      *(_WORD *)(v20 - 40) = v24 != 0;
      *(void *)(v20 - 32) = 5;
      *(void *)(v20 - 24) = v23;
      *(void *)(v20 - 16) = 0;
      *(void *)(v20 - 8) = v24;
      *(_OWORD *)uint64_t v20 = v36;
      *(void *)(v20 + 16) = 0;
      *(void *)(v20 + 24) = 0;
      *(unsigned char *)(v20 + 32) = 0;
      unint64_t v21 = (__CFString *)((char *)v21 + 8);
      ++a3;
      *(_DWORD *)(v20 + 36) = 0;
      *(_DWORD *)(v20 + 40) = 0;
      v20 += 88;
      --v22;
    }
    while (v22);
  }
  switch(v33)
  {
    case 2uLL:
      id v26 = [(MTLToolsObject *)self baseObject];
      objc_msgSend(v26, "setVertexVisibleFunctionTables:withBufferRange:", v32, v34, length);
      break;
    case 3uLL:
      id v27 = [(MTLToolsObject *)self baseObject];
      objc_msgSend(v27, "setFragmentVisibleFunctionTables:withBufferRange:", v32, v34, length);
      break;
    case 4uLL:
      id v28 = [(MTLToolsObject *)self baseObject];
      objc_msgSend(v28, "setTileVisibleFunctionTables:withBufferRange:", v32, v34, length);
      break;
    case 5uLL:
      id v29 = [(MTLToolsObject *)self baseObject];
      objc_msgSend(v29, "setObjectVisibleFunctionTables:withBufferRange:", v32, v34, length);
      break;
    case 6uLL:
      id v30 = [(MTLToolsObject *)self baseObject];
      objc_msgSend(v30, "setMeshVisibleFunctionTables:withBufferRange:", v32, v34, length);
      break;
    default:
      return;
  }
}

- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  unint64_t v7 = [(MTLToolsDevice *)self->super.super.super._device maxFragmentBuffers];

  [(MTLDebugRenderCommandEncoder *)self setVisibleFunctionTable:a3 atBufferIndex:a4 maxBuffers:v7 buffers:&self->_fragmentBuffers[0].type buffersLength:31 stage:3];
}

- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  unint64_t v7 = [(MTLToolsDevice *)self->super.super.super._device maxTileBuffers];

  [(MTLDebugRenderCommandEncoder *)self setVisibleFunctionTable:a3 atBufferIndex:a4 maxBuffers:v7 buffers:&self->_tileBuffers[0].type buffersLength:31 stage:4];
}

- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  unint64_t v7 = [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];

  [(MTLDebugRenderCommandEncoder *)self setVisibleFunctionTable:a3 atBufferIndex:a4 maxBuffers:v7 buffers:&self->_objectBuffers[0].type buffersLength:36 stage:5];
}

- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  unint64_t v7 = [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];

  [(MTLDebugRenderCommandEncoder *)self setVisibleFunctionTable:a3 atBufferIndex:a4 maxBuffers:v7 buffers:&self->_meshBuffers[0].type buffersLength:36 stage:6];
}

- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4 maxBuffers:(unint64_t)a5 buffers:(MTLDebugFunctionArgument *)a6 buffersLength:(unint64_t)a7 stage:(unint64_t)a8
{
  memset(&v22, 0, sizeof(v22));
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (a4 >= a5)
  {
    unint64_t v20 = a4;
    unint64_t v21 = a5;
    _MTLMessageContextPush_();
    if (!a3) {
      goto LABEL_12;
    }
  }
  else if (!a3)
  {
    goto LABEL_12;
  }
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_26EF9B378, v20, v21, v22.var0, v22.var1, *(void *)&v22.var2, v22.var3, v22.var4, v22.var5, v22.var6) & 1) == 0)
  {
LABEL_11:
    _MTLMessageContextPush_();
    goto LABEL_12;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    _MTLMessageContextPush_();
  }
  if ([a3 stage] && objc_msgSend(a3, "stage") != a8)
  {
    unint64_t v20 = (unint64_t)MTLDebugStageToString([a3 stage]);
    unint64_t v21 = (unint64_t)MTLDebugStageToString(a8);
    goto LABEL_11;
  }
LABEL_12:
  if (a4 < a7) {
    validateArg(MTLArgumentTypeBuffer, a4, &a6[a4], &v22);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  switch(a8)
  {
    case 2uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 3uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 4uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 5uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 6uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    default:
      break;
  }
  uint64_t v16 = objc_msgSend(a3, "functionCount", v20, v21);
  if (MTLReportFailureTypeEnabled())
  {
    NSRange v17 = &a6[a4];
    v18.i64[0] = v17->type;
    v18.i64[1] = v17->var0;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v18, (int64x2_t)xmmword_23BE4ACA0), (int32x4_t)vceqq_s64(*(int64x2_t *)&v17->bufferLength, (int64x2_t)(unint64_t)v16))))) & 1) == 0&& v17->bufferAttributeStride == -1&& *(_OWORD *)&v17->threadgroupMemoryLength == 0&& v17->object == a3&& a3&& !*(void *)&v17->lodMinClamp&& !v17->hasLodClamp)
    {
      MTLReportFailure();
    }
  }
  uint64_t v19 = &a6[a4];
  v19->isValid = v16 != 0;
  v19->hasBeenUsed = 0;
  v19->type = 6;
  v19->object = (baseLevel *)a3;
  v19->unint64_t var0 = 0;
  v19->bufferLength = v16;
  *(_OWORD *)&v19->bufferOffset = xmmword_23BE4AC80;
  v19->threadgroupMemoryLength = 0;
  v19->threadgroupMemoryOffset = 0;
  v19->hasLodClamp = 0;
  v19->lodMinClamp = 0.0;
  v19->lodMaxClamp = 0.0;
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4 maxBuffers:(unint64_t)a5 buffers:(MTLDebugFunctionArgument *)a6 buffersLength:(unint64_t)a7 stage:(unint64_t)a8
{
  *(void *)&long long v36 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v38 = *MEMORY[0x263EF8340];
  memset(&v37, 0, sizeof(v37));
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (location + length > a5) {
    _MTLMessageContextPush_();
  }
  NSUInteger v34 = location;
  v35.i64[0] = a5;
  unint64_t v33 = a8;
  if (length)
  {
    uint64_t v14 = 0;
    long long v15 = (MTLDebugFunctionArgument *)(v36 + 88 * location);
    do
    {
      uint64_t v16 = (void *)a3[v14];
      if (v16)
      {
        if ([v16 conformsToProtocol:&unk_26EF9B378])
        {
          device = self->super.super.super._device;
          if (device != (MTLToolsDevice *)[(id)a3[v14] device]) {
            _MTLMessageContextPush_();
          }
          NSUInteger location = v34;
          if (![(id)a3[v14] stage] || objc_msgSend((id)a3[v14], "stage") == v33) {
            goto LABEL_15;
          }
          NSUInteger v32 = MTLDebugStageToString([(id)a3[v14] stage]);
          MTLDebugStageToString(v33);
        }
        _MTLMessageContextPush_();
      }
LABEL_15:
      if (location + v14 < a7) {
        validateArg(MTLArgumentTypeBuffer, location + v14, v15, &v37);
      }
      ++v14;
      ++v15;
    }
    while (length != v14);
  }
  uint64_t v18 = _MTLMessageContextEnd();
  uint64_t v31 = (uint64_t)&v31;
  MEMORY[0x270FA5388](v18);
  NSUInteger v32 = (__CFString *)((char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (length)
  {
    uint64_t v20 = v36 + 88 * v34 + 40;
    int64x2_t v35 = (int64x2_t)xmmword_23BE4ACA0;
    long long v36 = xmmword_23BE4AC80;
    unint64_t v21 = v32;
    NSUInteger v22 = length;
    do
    {
      [self->_maxVertexBuffers addObject:*a3 retained:1 purgeable:1];
      v21->isa = (void *)[(id)*a3 baseObject];
      unint64_t v23 = *a3;
      uint64_t v24 = [(id)*a3 functionCount];
      if (MTLReportFailureTypeEnabled())
      {
        v25.i64[0] = *(void *)(v20 - 32);
        v25.i64[1] = *(void *)(v20 - 16);
        if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v25, v35), (int32x4_t)vceqq_s64(*(int64x2_t *)(v20 - 8), (int64x2_t)(unint64_t)v24))))) & 1) == 0&& *(void *)(v20 + 8) == -1&& *(_OWORD *)(v20 + 16) == 0&& *(const void **)(v20 - 24) == v23&& v23&& !*(void *)(v20 + 36)&& !*(unsigned char *)(v20 + 32))
        {
          MTLReportFailure();
        }
      }
      *(_WORD *)(v20 - 40) = v24 != 0;
      *(void *)(v20 - 32) = 6;
      *(void *)(v20 - 24) = v23;
      *(void *)(v20 - 16) = 0;
      *(void *)(v20 - 8) = v24;
      *(_OWORD *)uint64_t v20 = v36;
      *(void *)(v20 + 16) = 0;
      *(void *)(v20 + 24) = 0;
      *(unsigned char *)(v20 + 32) = 0;
      unint64_t v21 = (__CFString *)((char *)v21 + 8);
      ++a3;
      *(_DWORD *)(v20 + 36) = 0;
      *(_DWORD *)(v20 + 40) = 0;
      v20 += 88;
      --v22;
    }
    while (v22);
  }
  switch(v33)
  {
    case 2uLL:
      id v26 = [(MTLToolsObject *)self baseObject];
      objc_msgSend(v26, "setVertexIntersectionFunctionTables:withBufferRange:", v32, v34, length);
      break;
    case 3uLL:
      id v27 = [(MTLToolsObject *)self baseObject];
      objc_msgSend(v27, "setFragmentIntersectionFunctionTables:withBufferRange:", v32, v34, length);
      break;
    case 4uLL:
      id v28 = [(MTLToolsObject *)self baseObject];
      objc_msgSend(v28, "setTileIntersectionFunctionTables:withBufferRange:", v32, v34, length);
      break;
    case 5uLL:
      id v29 = [(MTLToolsObject *)self baseObject];
      objc_msgSend(v29, "setObjectIntersectionFunctionTables:withBufferRange:", v32, v34, length);
      break;
    case 6uLL:
      id v30 = [(MTLToolsObject *)self baseObject];
      objc_msgSend(v30, "setMeshIntersectionFunctionTables:withBufferRange:", v32, v34, length);
      break;
    default:
      return;
  }
}

- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  unint64_t v7 = [(MTLToolsDevice *)self->super.super.super._device maxFragmentBuffers];

  [(MTLDebugRenderCommandEncoder *)self setIntersectionFunctionTable:a3 atBufferIndex:a4 maxBuffers:v7 buffers:&self->_fragmentBuffers[0].type buffersLength:31 stage:3];
}

- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  unint64_t v7 = [(MTLToolsDevice *)self->super.super.super._device maxTileBuffers];

  [(MTLDebugRenderCommandEncoder *)self setIntersectionFunctionTable:a3 atBufferIndex:a4 maxBuffers:v7 buffers:&self->_tileBuffers[0].type buffersLength:31 stage:4];
}

- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4 maxBuffers:(unint64_t)a5 buffers:(MTLDebugFunctionArgument *)a6 buffersLength:(unint64_t)a7 stage:(unint64_t)a8
{
  memset(&v21, 0, sizeof(v21));
  _MTLMessageContextBegin_();
  if (BYTE2(self->_visibilityOffsets)) {
    _MTLMessageContextPush_();
  }
  if (a4 >= a5)
  {
    unint64_t v19 = a4;
    unint64_t v20 = a5;
    _MTLMessageContextPush_();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 1, @"Acceleration structure");
  if (a4 < a7) {
    validateArg(MTLArgumentTypePrimitiveAccelerationStructure, a4, &a6[a4], &v21);
  }
  _MTLMessageContextEnd();
  [self->_maxVertexBuffers addObject:a3 retained:1 purgeable:1];
  switch(a8)
  {
    case 2uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 3uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 4uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 5uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 6uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    default:
      break;
  }
  uint64_t v15 = objc_msgSend(a3, "size", v19, v20, v21.var0, v21.var1, *(void *)&v21.var2, v21.var3, v21.var4, v21.var5, v21.var6);
  if (MTLReportFailureTypeEnabled())
  {
    uint64_t v16 = &a6[a4];
    v17.i64[0] = v16->type;
    v17.i64[1] = v16->var0;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v17, (int64x2_t)xmmword_23BE4AC70), (int32x4_t)vceqq_s64(*(int64x2_t *)&v16->bufferLength, (int64x2_t)(unint64_t)v15))))) & 1) == 0&& v16->bufferAttributeStride == -1&& *(_OWORD *)&v16->threadgroupMemoryLength == 0&& v16->object == a3&& a3&& !*(void *)&v16->lodMinClamp&& !v16->hasLodClamp)
    {
      MTLReportFailure();
    }
  }
  uint64_t v18 = &a6[a4];
  v18->isValid = v15 != 0;
  v18->hasBeenUsed = 0;
  v18->type = 4;
  v18->object = (baseLevel *)a3;
  v18->unint64_t var0 = 0;
  v18->bufferLength = v15;
  *(_OWORD *)&v18->bufferOffset = xmmword_23BE4AC80;
  v18->threadgroupMemoryLength = 0;
  v18->threadgroupMemoryOffset = 0;
  v18->hasLodClamp = 0;
  v18->lodMinClamp = 0.0;
  v18->lodMaxClamp = 0.0;
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  unint64_t v7 = [(MTLToolsDevice *)self->super.super.super._device maxFragmentBuffers];

  [(MTLDebugRenderCommandEncoder *)self setAccelerationStructure:a3 atBufferIndex:a4 maxBuffers:v7 buffers:&self->_fragmentBuffers[0].type buffersLength:31 stage:3];
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  unint64_t v7 = [(MTLToolsDevice *)self->super.super.super._device maxTileBuffers];

  [(MTLDebugRenderCommandEncoder *)self setAccelerationStructure:a3 atBufferIndex:a4 maxBuffers:v7 buffers:&self->_tileBuffers[0].type buffersLength:31 stage:4];
}

- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)enableNullBufferBinds:(BOOL)a3
{
  BOOL v3 = a3;
  LOBYTE(self->_depthBias) = a3;
  [(MTLToolsObject *)self baseObject];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(MTLToolsObject *)self baseObject];
    [v5 enableNullBufferBinds:v3];
  }
}

- (void)useResidencySet:(id)a3
{
  if (!a3) {
    MTLReportFailure();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugRenderCommandEncoder;
  [(MTLToolsRenderCommandEncoder *)&v5 useResidencySet:a3];
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    for (uint64_t i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        uint64_t v8 = i;
        MTLReportFailure();
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder useResidencySets:count:](&v9, sel_useResidencySets_count_, a3, a4, v8);
}

- (unint64_t)attachmentWriteMask
{
  return self->_objectThreadsPerTG.width;
}

- (MTLRenderPassDescriptor)descriptor
{
  return (MTLRenderPassDescriptor *)self->_frontFacingWinding;
}

- (unint64_t)frontFacingWinding
{
  return self->_cullMode;
}

- (unint64_t)cullMode
{
  return self->_depthClipMode;
}

- (unint64_t)depthClipMode
{
  return self->_triangleFillMode;
}

- (float)lineWidth
{
  return self->_depthBiasSlopeScale;
}

- (float)depthBias
{
  return self->_depthBiasClamp;
}

- (float)depthBiasSlopeScale
{
  return *(float *)&self->_frontStencilRef;
}

- (float)depthBiasClamp
{
  return *(float *)&self->_backStencilRef;
}

- (unint64_t)triangleFillMode
{
  return (unint64_t)self->_renderPipelineState;
}

- (MTLRenderPipelineState)renderPipelineState
{
  return (MTLRenderPipelineState *)self->_peakPerSampleStorage;
}

- (unint64_t)peakPerSampleStorage
{
  return self->_resolvedSampleCount;
}

- (unint64_t)resolvedSampleCount
{
  return (unint64_t)self->_depthStencilState;
}

- (MTLDepthStencilState)depthStencilState
{
  return (MTLDepthStencilState *)self->_defaultDepthStencilDescriptor;
}

- (MTLDepthStencilDescriptor)defaultDepthStencilDescriptor
{
  return (MTLDepthStencilDescriptor *)self->_visibilityResultMode;
}

- (unsigned)frontStencilRef
{
  return LODWORD(self->_blendColorRed);
}

- (unsigned)backStencilRef
{
  return LODWORD(self->_blendColorGreen);
}

- (unint64_t)visibilityResultMode
{
  return self->_visibilityResultOffset;
}

- (unint64_t)visibilityResultOffset
{
  return self->_width;
}

- (float)blendColorRed
{
  return self->_blendColorBlue;
}

- (float)blendColorGreen
{
  return self->_blendColorAlpha;
}

- (float)blendColorBlue
{
  return self->_tessellationFactorScale;
}

- (float)blendColorAlpha
{
  return *(float *)&self->_descriptor;
}

- (unint64_t)width
{
  return self->_height;
}

- (unint64_t)height
{
  return self->_tessellationFactorBufferInstanceStride;
}

- (MTLDebugFunctionArgument)tessellationFactorBufferArgument
{
  long long v3 = *(_OWORD *)&self[949].threadgroupMemoryOffset;
  *(_OWORD *)&retstr->bufferLength = *(_OWORD *)&self[949].bufferAttributeStride;
  *(_OWORD *)&retstr->bufferAttributeStride = v3;
  *(_OWORD *)&retstr->threadgroupMemoryOffset = *(_OWORD *)&self[949].lodMaxClamp;
  *(void *)&retstr->lodMaxClamp = self[950].type;
  long long v4 = *(_OWORD *)&self[949].bufferLength;
  *(_OWORD *)&retstr->isValid = *(_OWORD *)&self[949].object;
  *(_OWORD *)&retstr->object = v4;
  return self;
}

- (unint64_t)tessellationFactorBufferInstanceStride
{
  return *(void *)&self->_tessellationFactorBufferArgument.isValid;
}

- (float)tessellationFactorScale
{
  return *((float *)&self->_descriptor + 1);
}

- (void).cxx_destruct
{
  std::deque<objc_object *>::~deque[abi:ne180100](&self->_updatedFences.__map_.var0);
  end = self->_scissorRects.__end_;
  if (end)
  {
    self->_scissorRects.__end_cap_.__value_ = end;
    operator delete(end);
  }
  long long v4 = self->_viewports.__end_;
  if (v4)
  {
    self->_viewports.__end_cap_.__value_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  uint64_t v2 = 248;
  uint64_t v3 = 36;
  do
  {
    long long v4 = (char *)self + v2;
    *((void *)v4 + 3) = 0;
    *((void *)v4 + 4) = 0;
    *((void *)v4 + 5) = 0;
    *((void *)v4 + 6) = -1;
    *((_DWORD *)v4 + 19) = 0;
    *((_DWORD *)v4 + 20) = 0;
    *((void *)v4 + 7) = 0;
    *((void *)v4 + 8) = 0;
    v2 += 88;
    v4[72] = 0;
    --v3;
  }
  while (v3);
  uint64_t v5 = 3416;
  uint64_t v6 = 128;
  do
  {
    unint64_t v7 = (char *)self + v5;
    *((void *)v7 + 3) = 0;
    *((void *)v7 + 4) = 0;
    *((void *)v7 + 5) = 0;
    *((void *)v7 + 6) = -1;
    *((_DWORD *)v7 + 19) = 0;
    *((_DWORD *)v7 + 20) = 0;
    *((void *)v7 + 7) = 0;
    *((void *)v7 + 8) = 0;
    v5 += 88;
    v7[72] = 0;
    --v6;
  }
  while (v6);
  uint64_t v8 = 14680;
  uint64_t v9 = 16;
  do
  {
    NSUInteger v10 = (char *)self + v8;
    *((void *)v10 + 3) = 0;
    *((void *)v10 + 4) = 0;
    *((void *)v10 + 5) = 0;
    *((void *)v10 + 6) = -1;
    *((_DWORD *)v10 + 19) = 0;
    *((_DWORD *)v10 + 20) = 0;
    *((void *)v10 + 7) = 0;
    *((void *)v10 + 8) = 0;
    v8 += 88;
    v10[72] = 0;
    --v9;
  }
  while (v9);
  uint64_t v11 = 16088;
  uint64_t v12 = 31;
  do
  {
    long long v13 = (char *)self + v11;
    *((void *)v13 + 3) = 0;
    *((void *)v13 + 4) = 0;
    *((void *)v13 + 5) = 0;
    *((void *)v13 + 6) = -1;
    *((_DWORD *)v13 + 19) = 0;
    *((_DWORD *)v13 + 20) = 0;
    *((void *)v13 + 7) = 0;
    *((void *)v13 + 8) = 0;
    v11 += 88;
    v13[72] = 0;
    --v12;
  }
  while (v12);
  uint64_t v14 = 18816;
  uint64_t v15 = 128;
  do
  {
    uint64_t v16 = (char *)self + v14;
    *((void *)v16 + 3) = 0;
    *((void *)v16 + 4) = 0;
    *((void *)v16 + 5) = 0;
    *((void *)v16 + 6) = -1;
    *((_DWORD *)v16 + 19) = 0;
    *((_DWORD *)v16 + 20) = 0;
    *((void *)v16 + 7) = 0;
    *((void *)v16 + 8) = 0;
    v14 += 88;
    v16[72] = 0;
    --v15;
  }
  while (v15);
  uint64_t v17 = 30080;
  uint64_t v18 = 16;
  do
  {
    unint64_t v19 = (char *)self + v17;
    *((void *)v19 + 3) = 0;
    *((void *)v19 + 4) = 0;
    *((void *)v19 + 5) = 0;
    *((void *)v19 + 6) = -1;
    *((_DWORD *)v19 + 19) = 0;
    *((_DWORD *)v19 + 20) = 0;
    *((void *)v19 + 7) = 0;
    *((void *)v19 + 8) = 0;
    v17 += 88;
    v19[72] = 0;
    --v18;
  }
  while (v18);
  uint64_t v20 = 31488;
  uint64_t v21 = 31;
  do
  {
    NSUInteger v22 = (char *)self + v20;
    *((void *)v22 + 3) = 0;
    *((void *)v22 + 4) = 0;
    *((void *)v22 + 5) = 0;
    *((void *)v22 + 6) = -1;
    *((_DWORD *)v22 + 19) = 0;
    *((_DWORD *)v22 + 20) = 0;
    *((void *)v22 + 7) = 0;
    *((void *)v22 + 8) = 0;
    v20 += 88;
    v22[72] = 0;
    --v21;
  }
  while (v21);
  uint64_t v23 = 34216;
  uint64_t v24 = 128;
  do
  {
    int64x2_t v25 = (char *)self + v23;
    *((void *)v25 + 3) = 0;
    *((void *)v25 + 4) = 0;
    *((void *)v25 + 5) = 0;
    *((void *)v25 + 6) = -1;
    *((_DWORD *)v25 + 19) = 0;
    *((_DWORD *)v25 + 20) = 0;
    *((void *)v25 + 7) = 0;
    *((void *)v25 + 8) = 0;
    v23 += 88;
    v25[72] = 0;
    --v24;
  }
  while (v24);
  uint64_t v26 = 45480;
  uint64_t v27 = 16;
  do
  {
    id v28 = (char *)self + v26;
    *((void *)v28 + 3) = 0;
    *((void *)v28 + 4) = 0;
    *((void *)v28 + 5) = 0;
    *((void *)v28 + 6) = -1;
    *((_DWORD *)v28 + 19) = 0;
    *((_DWORD *)v28 + 20) = 0;
    *((void *)v28 + 7) = 0;
    *((void *)v28 + 8) = 0;
    v26 += 88;
    v28[72] = 0;
    --v27;
  }
  while (v27);
  uint64_t v29 = 46888;
  uint64_t v30 = 31;
  do
  {
    uint64_t v31 = (char *)self + v29;
    *((void *)v31 + 3) = 0;
    *((void *)v31 + 4) = 0;
    *((void *)v31 + 5) = 0;
    *((void *)v31 + 6) = -1;
    *((_DWORD *)v31 + 19) = 0;
    *((_DWORD *)v31 + 20) = 0;
    *((void *)v31 + 7) = 0;
    *((void *)v31 + 8) = 0;
    v29 += 88;
    v31[72] = 0;
    --v30;
  }
  while (v30);
  uint64_t v32 = 49616;
  uint64_t v33 = 31;
  do
  {
    NSUInteger v34 = (char *)self + v32;
    *((void *)v34 + 3) = 0;
    *((void *)v34 + 4) = 0;
    *((void *)v34 + 5) = 0;
    *((void *)v34 + 6) = -1;
    *((_DWORD *)v34 + 19) = 0;
    *((_DWORD *)v34 + 20) = 0;
    *((void *)v34 + 7) = 0;
    *((void *)v34 + 8) = 0;
    v32 += 88;
    v34[72] = 0;
    --v33;
  }
  while (v33);
  uint64_t v35 = 52344;
  uint64_t v36 = 128;
  do
  {
    _MTLMessageContext v37 = (char *)self + v35;
    *((void *)v37 + 3) = 0;
    *((void *)v37 + 4) = 0;
    *((void *)v37 + 5) = 0;
    *((void *)v37 + 6) = -1;
    *((_DWORD *)v37 + 19) = 0;
    *((_DWORD *)v37 + 20) = 0;
    *((void *)v37 + 7) = 0;
    *((void *)v37 + 8) = 0;
    v35 += 88;
    v37[72] = 0;
    --v36;
  }
  while (v36);
  uint64_t v38 = 63608;
  uint64_t v39 = 16;
  do
  {
    uint64_t v40 = (char *)self + v38;
    *((void *)v40 + 3) = 0;
    *((void *)v40 + 4) = 0;
    *((void *)v40 + 5) = 0;
    *((void *)v40 + 6) = -1;
    *((_DWORD *)v40 + 19) = 0;
    *((_DWORD *)v40 + 20) = 0;
    *((void *)v40 + 7) = 0;
    *((void *)v40 + 8) = 0;
    v38 += 88;
    v40[72] = 0;
    --v39;
  }
  while (v39);
  uint64_t v41 = 65016;
  uint64_t v42 = 31;
  do
  {
    uint64_t v43 = (char *)self + v41;
    *((void *)v43 + 3) = 0;
    *((void *)v43 + 4) = 0;
    *((void *)v43 + 5) = 0;
    *((void *)v43 + 6) = -1;
    *((_DWORD *)v43 + 19) = 0;
    *((_DWORD *)v43 + 20) = 0;
    *((void *)v43 + 7) = 0;
    *((void *)v43 + 8) = 0;
    v41 += 88;
    v43[72] = 0;
    --v42;
  }
  while (v42);
  uint64_t v44 = 67744;
  uint64_t v45 = 31;
  do
  {
    _MTLMessageContext v46 = (char *)self + v44;
    *((void *)v46 + 3) = 0;
    *((void *)v46 + 4) = 0;
    *((void *)v46 + 5) = 0;
    *((void *)v46 + 6) = -1;
    *((_DWORD *)v46 + 19) = 0;
    *((_DWORD *)v46 + 20) = 0;
    *((void *)v46 + 7) = 0;
    *((void *)v46 + 8) = 0;
    v44 += 88;
    v46[72] = 0;
    --v45;
  }
  while (v45);
  uint64_t v47 = 70472;
  uint64_t v48 = 128;
  do
  {
    v49 = (char *)self + v47;
    *((void *)v49 + 3) = 0;
    *((void *)v49 + 4) = 0;
    *((void *)v49 + 5) = 0;
    *((void *)v49 + 6) = -1;
    *((_DWORD *)v49 + 19) = 0;
    *((_DWORD *)v49 + 20) = 0;
    *((void *)v49 + 7) = 0;
    *((void *)v49 + 8) = 0;
    v47 += 88;
    v49[72] = 0;
    --v48;
  }
  while (v48);
  uint64_t v50 = 81736;
  uint64_t v51 = 16;
  do
  {
    double v52 = (char *)self + v50;
    *((void *)v52 + 3) = 0;
    *((void *)v52 + 4) = 0;
    *((void *)v52 + 5) = 0;
    *((void *)v52 + 6) = -1;
    *((_DWORD *)v52 + 19) = 0;
    *((_DWORD *)v52 + 20) = 0;
    *((void *)v52 + 7) = 0;
    *((void *)v52 + 8) = 0;
    v50 += 88;
    v52[72] = 0;
    --v51;
  }
  while (v51);
  *((void *)self + 10396) = 0;
  *((void *)self + 10397) = 0;
  *((void *)self + 10395) = 0;
  *((void *)self + 10399) = 0;
  *((void *)self + 10400) = 0;
  *((void *)self + 10398) = 0;
  *((_OWORD *)self + 5202) = 0u;
  *((_OWORD *)self + 5203) = 0u;
  *((_OWORD *)self + 5204) = 0u;
  *((void *)self + 10444) = 0;
  *((void *)self + 10445) = 0;
  *((void *)self + 10446) = 0;
  *((void *)self + 10447) = -1;
  *((_DWORD *)self + 20901) = 0;
  *((_DWORD *)self + 20902) = 0;
  *((unsigned char *)self + 83600) = 0;
  *((void *)self + 10448) = 0;
  *((void *)self + 10449) = 0;
  return self;
}

@end