@interface MTLCountersTraceRenderCommandEncoder
- (id)init:(BinaryBuffer *)a3;
- (void)dispatchThreadsPerTile:(id *)a3;
- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9;
- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(unint64_t)a9 baseInstance:(unint64_t)a10;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8;
- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7;
- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9;
- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6;
- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5;
- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setCullMode:(unint64_t)a3;
- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5;
- (void)setDepthClipMode:(unint64_t)a3;
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
- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFrontFacingWinding:(unint64_t)a3;
- (void)setRenderPipelineState:(id)a3;
- (void)setScissorRect:(id *)a3;
- (void)setScissorRects:(id *)a3 count:(unint64_t)a4;
- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4;
- (void)setStencilReferenceValue:(unsigned int)a3;
- (void)setStencilStoreAction:(unint64_t)a3;
- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5;
- (void)setTessellationFactorScale:(float)a3;
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
- (void)useHeap:(id)a3 stages:(unint64_t)a4;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6;
- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4;
@end

@implementation MTLCountersTraceRenderCommandEncoder

- (id)init:(BinaryBuffer *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTLCountersTraceRenderCommandEncoder;
  return [(MTLCountersTraceCommandEncoder *)&v4 init:a3 flags:4];
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  unint64_t v7 = a3;
  unint64_t v5 = a5;
  unint64_t v6 = a4;
  BinaryBuffer::Append<MTLPrimitiveType,unsigned long,unsigned long>((uint64_t)self->super._stream, 42, self->super._timer, (uint64_t *)&v7, (uint64_t *)&v6, (uint64_t *)&v5);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  unint64_t v9 = a3;
  unint64_t v7 = a5;
  unint64_t v8 = a4;
  unint64_t v6 = a6;
  BinaryBuffer::Append<MTLPrimitiveType,unsigned long,unsigned long,unsigned long>((uint64_t)self->super._stream, 43, self->super._timer, (uint64_t *)&v9, (uint64_t *)&v8, (uint64_t *)&v7, (uint64_t *)&v6);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  unint64_t v10 = a4;
  unint64_t v11 = a3;
  unint64_t v8 = a6;
  unint64_t v9 = a5;
  unint64_t v7 = a7;
  BinaryBuffer::Append<MTLPrimitiveType,unsigned long,unsigned long,unsigned long,unsigned long>((uint64_t)self->super._stream, 44, self->super._timer, (uint64_t *)&v11, (uint64_t *)&v10, (uint64_t *)&v9, (uint64_t *)&v8, (uint64_t *)&v7);
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  unint64_t v7 = a3;
  unint64_t v5 = a5;
  id v6 = a4;
  BinaryBuffer::Append<MTLPrimitiveType,objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 45, self->super._timer, (uint64_t *)&v7, (uint64_t *)&v6, (uint64_t *)&v5);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  unint64_t v10 = a4;
  unint64_t v11 = a3;
  id v8 = a6;
  unint64_t v9 = a5;
  unint64_t v7 = a7;
  BinaryBuffer::Append<MTLPrimitiveType,unsigned long,MTLIndexType,objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 46, self->super._timer, (uint64_t *)&v11, (uint64_t *)&v10, (uint64_t *)&v9, (uint64_t *)&v8, (uint64_t *)&v7);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  unint64_t v12 = a4;
  unint64_t v13 = a3;
  unint64_t v11 = a5;
  unint64_t v9 = a7;
  id v10 = a6;
  unint64_t v8 = a8;
  BinaryBuffer::Append<MTLPrimitiveType,unsigned long,MTLIndexType,objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long>((uint64_t)self->super._stream, 47, self->super._timer, (uint64_t *)&v13, (uint64_t *)&v12, (uint64_t *)&v11, (uint64_t *)&v10, (uint64_t *)&v9, (uint64_t *)&v8);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(unint64_t)a9 baseInstance:(unint64_t)a10
{
  unint64_t v14 = a4;
  unint64_t v15 = a3;
  id v12 = a6;
  unint64_t v13 = a5;
  unint64_t v10 = a8;
  unint64_t v11 = a7;
  BinaryBuffer::Append<MTLPrimitiveType,unsigned long,MTLIndexType,objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long,unsigned long,unsigned long>((uint64_t)self->super._stream, 48, self->super._timer, (uint64_t *)&v15, (uint64_t *)&v14, (uint64_t *)&v13, (uint64_t *)&v12, (uint64_t *)&v11, (uint64_t *)&v10, (uint64_t *)&a9, (uint64_t *)&a10);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  unint64_t v12 = a4;
  unint64_t v13 = a3;
  id v11 = a5;
  id v9 = a7;
  unint64_t v10 = a6;
  unint64_t v8 = a8;
  BinaryBuffer::Append<MTLPrimitiveType,MTLIndexType,objc_object  {objcproto9MTLBuffer}*,unsigned long,objc_object  {objcproto9MTLBuffer},unsigned long>((uint64_t)self->super._stream, 49, self->super._timer, (uint64_t *)&v13, (uint64_t *)&v12, (uint64_t *)&v11, (uint64_t *)&v10, (uint64_t *)&v9, (uint64_t *)&v8);
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  unint64_t v15 = a4;
  unint64_t v16 = a3;
  unint64_t v14 = a5;
  unint64_t v12 = a7;
  id v13 = a6;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  unint64_t v11 = a8;
  BinaryBuffer::Append<unsigned long,unsigned long,unsigned long,objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long,unsigned long>((uint64_t)stream, 50, timer, (uint64_t *)&v16, (uint64_t *)&v15, (uint64_t *)&v14, (uint64_t *)&v13, (uint64_t *)&v12, (uint64_t *)&v11, (uint64_t *)&a9);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  unint64_t v15 = a4;
  unint64_t v16 = a3;
  id v13 = a6;
  unint64_t v14 = a5;
  id v11 = a8;
  unint64_t v12 = a7;
  BinaryBuffer::Append<unsigned long,unsigned long,unsigned long,objc_object  {objcproto9MTLBuffer}*,unsigned long,objc_object  {objcproto9MTLBuffer},unsigned long,unsigned long,unsigned long>((uint64_t)self->super._stream, 52, self->super._timer, (uint64_t *)&v16, (uint64_t *)&v15, (uint64_t *)&v14, (uint64_t *)&v11, (uint64_t *)&a9, (uint64_t *)&v13, (uint64_t *)&v12, (uint64_t *)&a10, (uint64_t *)&a11);
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  id v10 = a4;
  unint64_t v11 = a3;
  id v8 = a6;
  unint64_t v9 = a5;
  unint64_t v7 = a7;
  BinaryBuffer::Append<unsigned long,objc_object  {objcproto9MTLBuffer}*,unsigned long,objc_object  {objcproto9MTLBuffer},unsigned long>((uint64_t)self->super._stream, 51, self->super._timer, (uint64_t *)&v11, (uint64_t *)&v10, (uint64_t *)&v9, (uint64_t *)&v8, (uint64_t *)&v7);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  id v15 = a4;
  unint64_t v16 = a3;
  unint64_t v14 = a5;
  unint64_t v12 = a7;
  id v13 = a6;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  id v11 = a8;
  BinaryBuffer::Append<unsigned long,objc_object  {objcproto9MTLBuffer}*,unsigned long,objc_object  {objcproto9MTLBuffer},unsigned long,objc_object  {objcproto9MTLBuffer},unsigned long>((uint64_t)stream, 53, timer, (uint64_t *)&v16, (uint64_t *)&v15, (uint64_t *)&v14, (uint64_t *)&v13, (uint64_t *)&v12, (uint64_t *)&v11, (uint64_t *)&a9);
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  float v9 = a3;
  float v7 = a5;
  float v8 = a4;
  float v6 = a6;
  BinaryBuffer::Append<float,float,float,float>((uint64_t)self->super._stream, 55, self->super._timer, (int *)&v9, (int *)&v8, (int *)&v7, (int *)&v6);
}

- (void)setCullMode:(unint64_t)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v14[1] = v14;
  __int16 __src = 14593;
  char v8 = 100;
  unint64_t v9 = a3;
  uint64_t numer = stream->_timebase.numer;
  unint64_t denom = stream->_timebase.denom;
  char v10 = -108;
  unint64_t v11 = timer * numer / denom;
  char v12 = 16;
  v14[0] = v13;
  AppendBuffer::WriteBytes((AppendBuffer *)stream, &stream->stream, &__src, 0x15uLL);
}

- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5
{
  float v7 = a3;
  float v5 = a5;
  float v6 = a4;
  BinaryBuffer::Append<float,float,float>((uint64_t)self->super._stream, 58, self->super._timer, (int *)&v7, (int *)&v6, (int *)&v5);
}

- (void)setDepthClipMode:(unint64_t)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v14[1] = v14;
  __int16 __src = 15105;
  char v8 = 100;
  unint64_t v9 = a3;
  uint64_t numer = stream->_timebase.numer;
  unint64_t denom = stream->_timebase.denom;
  char v10 = -108;
  unint64_t v11 = timer * numer / denom;
  char v12 = 16;
  v14[0] = v13;
  AppendBuffer::WriteBytes((AppendBuffer *)stream, &stream->stream, &__src, 0x15uLL);
}

- (void)setDepthStencilState:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v14[1] = v14;
  __int16 __src = 15361;
  char v8 = 109;
  id v9 = a3;
  uint64_t numer = stream->_timebase.numer;
  unint64_t denom = stream->_timebase.denom;
  char v10 = -108;
  unint64_t v11 = timer * numer / denom;
  char v12 = 16;
  v14[0] = v13;
  AppendBuffer::WriteBytes((AppendBuffer *)stream, &stream->stream, &__src, 0x15uLL);
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v7 = a3;
  unint64_t v5 = a5;
  unint64_t v6 = a4;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long>((uint64_t)self->super._stream, 62, self->super._timer, (uint64_t *)&v7, (uint64_t *)&v6, (uint64_t *)&v5);
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  unint64_t v5 = a3;
  BinaryBuffer::Append<unsigned long,unsigned long>((uint64_t)self->super._stream, 63, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  _NSRange v9 = a5;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v8[0] = a3;
  v8[1] = a5.length;
  v7[0] = a4;
  v7[1] = a5.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto9MTLBuffer}* const>,BinaryBuffer::Array<unsigned long const>,_NSRange>((AppendBuffer *)stream, 64, timer, (uint64_t)v8, v7, (uint64_t *)&v9);
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v7 = a3;
  unint64_t v5 = a5;
  unint64_t v6 = a4;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long>((uint64_t)self->super._stream, 65, self->super._timer, (uint64_t *)&v7, (uint64_t *)&v6, (uint64_t *)&v5);
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v5 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 66, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v9 = a3;
  float v8 = a4;
  float v7 = a5;
  unint64_t v6 = a6;
  BinaryBuffer::Append<objc_object  {objcproto15MTLSamplerState}*,float,float,unsigned long>((uint64_t)self->super._stream, 67, self->super._timer, (uint64_t *)&v9, (int *)&v8, (int *)&v7, (uint64_t *)&v6);
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  _NSRange v7 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v6[0] = (uint64_t *)a3;
  v6[1] = (uint64_t *)a4.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto15MTLSamplerState}* const>,_NSRange>((AppendBuffer *)stream, 68, timer, v6, (uint64_t *)&v7);
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  _NSRange v11 = a6;
  id v9 = a5;
  char v10 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v8[0] = a3;
  v8[1] = a6.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto15MTLSamplerState}* const>,float const*,float const,_NSRange>((AppendBuffer *)stream, 69, timer, (uint64_t)v8, (uint64_t *)&v10, (uint64_t *)&v9, (uint64_t *)&v11);
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v5 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 70, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  _NSRange v7 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v6[0] = (uint64_t *)a3;
  v6[1] = (uint64_t *)a4.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto15MTLSamplerState}* const>,_NSRange>((AppendBuffer *)stream, 71, timer, v6, (uint64_t *)&v7);
}

- (void)setFrontFacingWinding:(unint64_t)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v14[1] = v14;
  __int16 __src = 18433;
  char v8 = 100;
  unint64_t v9 = a3;
  uint64_t numer = stream->_timebase.numer;
  unint64_t denom = stream->_timebase.denom;
  char v10 = -108;
  unint64_t v11 = timer * numer / denom;
  char v12 = 16;
  v14[0] = v13;
  AppendBuffer::WriteBytes((AppendBuffer *)stream, &stream->stream, &__src, 0x15uLL);
}

- (void)setRenderPipelineState:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v14[1] = v14;
  __int16 __src = 18689;
  char v8 = 109;
  id v9 = a3;
  uint64_t numer = stream->_timebase.numer;
  unint64_t denom = stream->_timebase.denom;
  char v10 = -108;
  unint64_t v11 = timer * numer / denom;
  char v12 = 16;
  v14[0] = v13;
  AppendBuffer::WriteBytes((AppendBuffer *)stream, &stream->stream, &__src, 0x15uLL);
}

- (void)setScissorRect:(id *)a3
{
}

- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4
{
  unsigned int v5 = a3;
  unsigned int v4 = a4;
  BinaryBuffer::Append<unsigned int,unsigned int>((uint64_t)self->super._stream, 76, self->super._timer, (int *)&v5, (int *)&v4);
}

- (void)setStencilReferenceValue:(unsigned int)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v14[1] = v14;
  __int16 __src = 19713;
  char v8 = 99;
  unsigned int v9 = a3;
  uint64_t numer = stream->_timebase.numer;
  unint64_t denom = stream->_timebase.denom;
  char v10 = -108;
  unint64_t v11 = timer * numer / denom;
  char v12 = 16;
  v14[0] = v13;
  AppendBuffer::WriteBytes((AppendBuffer *)stream, &stream->stream, &__src, 0x11uLL);
}

- (void)setTriangleFillMode:(unint64_t)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v14[1] = v14;
  __int16 __src = 20737;
  char v8 = 100;
  unint64_t v9 = a3;
  uint64_t numer = stream->_timebase.numer;
  unint64_t denom = stream->_timebase.denom;
  char v10 = -108;
  unint64_t v11 = timer * numer / denom;
  char v12 = 16;
  v14[0] = v13;
  AppendBuffer::WriteBytes((AppendBuffer *)stream, &stream->stream, &__src, 0x15uLL);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v7 = a3;
  unint64_t v5 = a5;
  unint64_t v6 = a4;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long>((uint64_t)self->super._stream, 82, self->super._timer, (uint64_t *)&v7, (uint64_t *)&v6, (uint64_t *)&v5);
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  unint64_t v5 = a3;
  BinaryBuffer::Append<unsigned long,unsigned long>((uint64_t)self->super._stream, 83, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  _NSRange v9 = a5;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v8[0] = a3;
  v8[1] = a5.length;
  v7[0] = a4;
  v7[1] = a5.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto9MTLBuffer}* const>,BinaryBuffer::Array<unsigned long const>,_NSRange>((AppendBuffer *)stream, 84, timer, (uint64_t)v8, v7, (uint64_t *)&v9);
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v7 = a3;
  unint64_t v5 = a5;
  unint64_t v6 = a4;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long>((uint64_t)self->super._stream, 85, self->super._timer, (uint64_t *)&v7, (uint64_t *)&v6, (uint64_t *)&v5);
}

- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v5 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 86, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v9 = a3;
  float v8 = a4;
  float v7 = a5;
  unint64_t v6 = a6;
  BinaryBuffer::Append<objc_object  {objcproto15MTLSamplerState}*,float,float,unsigned long>((uint64_t)self->super._stream, 87, self->super._timer, (uint64_t *)&v9, (int *)&v8, (int *)&v7, (uint64_t *)&v6);
}

- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  _NSRange v7 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v6[0] = (uint64_t *)a3;
  v6[1] = (uint64_t *)a4.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto15MTLSamplerState}* const>,_NSRange>((AppendBuffer *)stream, 88, timer, v6, (uint64_t *)&v7);
}

- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  _NSRange v11 = a6;
  id v9 = a5;
  char v10 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v8[0] = a3;
  v8[1] = a6.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto15MTLSamplerState}* const>,float const*,float const,_NSRange>((AppendBuffer *)stream, 89, timer, (uint64_t)v8, (uint64_t *)&v10, (uint64_t *)&v9, (uint64_t *)&v11);
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v5 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 90, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  _NSRange v7 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v6[0] = (uint64_t *)a3;
  v6[1] = (uint64_t *)a4.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto15MTLSamplerState}* const>,_NSRange>((AppendBuffer *)stream, 91, timer, v6, (uint64_t *)&v7);
}

- (void)setViewport:(id *)a3
{
}

- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4
{
  unint64_t v4 = a4;
  unint64_t v5 = a3;
  BinaryBuffer::Append<unsigned long,unsigned long>((uint64_t)self->super._stream, 104, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5
{
  id v7 = a3;
  unint64_t v5 = a5;
  unint64_t v6 = a4;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long>((uint64_t)self->super._stream, 79, self->super._timer, (uint64_t *)&v7, (uint64_t *)&v6, (uint64_t *)&v5);
}

- (void)setTessellationFactorScale:(float)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v14[1] = v14;
  __int16 __src = 20481;
  char v8 = 106;
  float v9 = a3;
  uint64_t numer = stream->_timebase.numer;
  unint64_t denom = stream->_timebase.denom;
  char v10 = -108;
  unint64_t v11 = timer * numer / denom;
  char v12 = 16;
  v14[0] = v13;
  AppendBuffer::WriteBytes((AppendBuffer *)stream, &stream->stream, &__src, 0x11uLL);
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  unint64_t v7 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v6[0] = a3;
  v6[1] = a4;
  BinaryBuffer::Append<BinaryBuffer::Array<MTLViewport const>,unsigned long>((AppendBuffer *)stream, 103, timer, v6, (uint64_t *)&v7);
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
  unint64_t v7 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v6[0] = a3;
  v6[1] = a4;
  BinaryBuffer::Append<BinaryBuffer::Array<MTLScissorRect const>,unsigned long>((AppendBuffer *)stream, 75, timer, v6, (uint64_t *)&v7);
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  unint64_t v5 = a3;
  BinaryBuffer::Append<unsigned long,unsigned long>((uint64_t)self->super._stream, 56, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v14[1] = v14;
  __int16 __src = 15617;
  char v8 = 100;
  unint64_t v9 = a3;
  uint64_t numer = stream->_timebase.numer;
  unint64_t denom = stream->_timebase.denom;
  char v10 = -108;
  unint64_t v11 = timer * numer / denom;
  char v12 = 16;
  v14[0] = v13;
  AppendBuffer::WriteBytes((AppendBuffer *)stream, &stream->stream, &__src, 0x15uLL);
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v14[1] = v14;
  __int16 __src = 19969;
  char v8 = 100;
  unint64_t v9 = a3;
  uint64_t numer = stream->_timebase.numer;
  unint64_t denom = stream->_timebase.denom;
  char v10 = -108;
  unint64_t v11 = timer * numer / denom;
  char v12 = 16;
  v14[0] = v13;
  AppendBuffer::WriteBytes((AppendBuffer *)stream, &stream->stream, &__src, 0x15uLL);
}

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v5 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 117, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v5 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 127, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)useHeap:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v14[1] = v14;
  __int16 __src = 30209;
  char v8 = 109;
  id v9 = a3;
  uint64_t numer = stream->_timebase.numer;
  unint64_t denom = stream->_timebase.denom;
  char v10 = -108;
  unint64_t v11 = timer * numer / denom;
  char v12 = 16;
  v14[0] = v13;
  AppendBuffer::WriteBytes((AppendBuffer *)stream, &stream->stream, &__src, 0x15uLL);
}

- (void)useHeap:(id)a3 stages:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v5 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 119, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v7 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v6[0] = (uint64_t *)a3;
  v6[1] = (uint64_t *)a4;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto7MTLHeap}* const>,unsigned long>((AppendBuffer *)stream, 120, timer, v6, (uint64_t *)&v7);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5
{
  unint64_t v9 = a4;
  v7[1] = (uint64_t *)a4;
  unint64_t v8 = a5;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v7[0] = (uint64_t *)a3;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto11MTLResource}* const>,unsigned long,unsigned long>((AppendBuffer *)stream, 121, timer, v7, (uint64_t *)&v9, (uint64_t *)&v8);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v5 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 122, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  id v7 = a3;
  unint64_t v5 = a5;
  unint64_t v6 = a4;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long>((uint64_t)self->super._stream, 123, self->super._timer, (uint64_t *)&v7, (uint64_t *)&v6, (uint64_t *)&v5);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  unint64_t v9 = a4;
  v7[1] = (uint64_t *)a4;
  unint64_t v8 = a5;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v7[0] = (uint64_t *)a3;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto11MTLResource}* const>,unsigned long,unsigned long>((AppendBuffer *)stream, 124, timer, v7, (uint64_t *)&v9, (uint64_t *)&v8);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6
{
  unint64_t v10 = a5;
  unint64_t v11 = a4;
  v8[1] = (uint64_t *)a4;
  unint64_t v9 = a6;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v8[0] = (uint64_t *)a3;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto11MTLResource}* const>,unsigned long,unsigned long,unsigned long>((AppendBuffer *)stream, 125, timer, v8, (uint64_t *)&v11, (uint64_t *)&v10, (uint64_t *)&v9);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  id v9 = a3;
  unint64_t v7 = a5;
  unint64_t v8 = a4;
  unint64_t v6 = a6;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long,unsigned long>((uint64_t)self->super._stream, 133, self->super._timer, (uint64_t *)&v9, (uint64_t *)&v8, (uint64_t *)&v7, (uint64_t *)&v6);
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unint64_t v7 = a3;
  unint64_t v5 = a5;
  unint64_t v6 = a4;
  BinaryBuffer::Append<MTLPrimitiveType,unsigned long,unsigned long>((uint64_t)self->super._stream, 134, self->super._timer, (uint64_t *)&v7, (uint64_t *)&v6, (uint64_t *)&v5);
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  _NSRange v11 = a6;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v10[0] = (uint64_t *)a3;
  v10[1] = (uint64_t *)a6.length;
  v9[0] = a4;
  v9[1] = a6.length;
  v8[0] = a5;
  v8[1] = a6.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto9MTLBuffer}* const>,BinaryBuffer::Array<unsigned long const>,unsigned long const,_NSRange>((AppendBuffer *)stream, 135, timer, v10, v9, v8, (uint64_t *)&v11);
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  id v9 = a3;
  unint64_t v7 = a5;
  unint64_t v8 = a4;
  unint64_t v6 = a6;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long,unsigned long>((uint64_t)self->super._stream, 136, self->super._timer, (uint64_t *)&v9, (uint64_t *)&v8, (uint64_t *)&v7, (uint64_t *)&v6);
}

- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5
{
  unint64_t v7 = a3;
  unint64_t v5 = a5;
  unint64_t v6 = a4;
  BinaryBuffer::Append<MTLPrimitiveType,unsigned long,unsigned long>((uint64_t)self->super._stream, 106, self->super._timer, (uint64_t *)&v7, (uint64_t *)&v6, (uint64_t *)&v5);
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6
{
  unint64_t v10 = a5;
  unint64_t v11 = a4;
  v8[1] = (uint64_t *)a4;
  unint64_t v9 = a6;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v8[0] = (uint64_t *)a3;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto11MTLResource}* const>,unsigned long,unsigned long,unsigned long>((AppendBuffer *)stream, 107, timer, v8, (uint64_t *)&v11, (uint64_t *)&v10, (uint64_t *)&v9);
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unint64_t v5 = a5;
  unint64_t v6 = a4;
  BinaryBuffer::Append<unsigned long,unsigned long>((uint64_t)self->super._stream, 95, self->super._timer, (uint64_t *)&v6, (uint64_t *)&v5);
}

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v7 = a3;
  unint64_t v5 = a5;
  unint64_t v6 = a4;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long>((uint64_t)self->super._stream, 92, self->super._timer, (uint64_t *)&v7, (uint64_t *)&v6, (uint64_t *)&v5);
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  unint64_t v5 = a3;
  BinaryBuffer::Append<unsigned long,unsigned long>((uint64_t)self->super._stream, 93, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  _NSRange v9 = a5;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v8[0] = a3;
  v8[1] = a5.length;
  v7[0] = a4;
  v7[1] = a5.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto9MTLBuffer}* const>,BinaryBuffer::Array<unsigned long const>,_NSRange>((AppendBuffer *)stream, 94, timer, (uint64_t)v8, v7, (uint64_t *)&v9);
}

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v5 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 100, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
{
  _NSRange v7 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v6[0] = (uint64_t *)a3;
  v6[1] = (uint64_t *)a4.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto15MTLSamplerState}* const>,_NSRange>((AppendBuffer *)stream, 101, timer, v6, (uint64_t *)&v7);
}

- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v5 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 96, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  _NSRange v7 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v6[0] = (uint64_t *)a3;
  v6[1] = (uint64_t *)a4.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto15MTLSamplerState}* const>,_NSRange>((AppendBuffer *)stream, 98, timer, v6, (uint64_t *)&v7);
}

- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v9 = a3;
  float v8 = a4;
  float v7 = a5;
  unint64_t v6 = a6;
  BinaryBuffer::Append<objc_object  {objcproto15MTLSamplerState}*,float,float,unsigned long>((uint64_t)self->super._stream, 96, self->super._timer, (uint64_t *)&v9, (int *)&v8, (int *)&v7, (uint64_t *)&v6);
}

- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  _NSRange v11 = a6;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v10[0] = (uint64_t *)a3;
  v10[1] = (uint64_t *)a6.length;
  v9[0] = a4;
  v9[1] = a6.length;
  v8[0] = a5;
  v8[1] = a6.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto15MTLSamplerState}* const>,BinaryBuffer::Array<float const>,float const,_NSRange>((AppendBuffer *)stream, 98, timer, v10, v9, v8, (uint64_t *)&v11);
}

- (void)dispatchThreadsPerTile:(id *)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v12[1] = v12;
  __int16 __src = 13825;
  uint64_t numer = stream->_timebase.numer;
  unint64_t denom = stream->_timebase.denom;
  char v8 = -108;
  unint64_t v9 = timer * numer / denom;
  char v10 = 16;
  v12[0] = &v11;
  AppendBuffer::WriteBytes((AppendBuffer *)stream, &stream->stream, &__src, 0xCuLL);
}

@end