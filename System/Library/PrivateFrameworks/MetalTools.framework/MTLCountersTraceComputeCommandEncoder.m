@interface MTLCountersTraceComputeCommandEncoder
- (id)init:(BinaryBuffer *)a3;
- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5;
- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4;
- (void)memoryBarrierWithScope:(unint64_t)a3;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setComputePipelineState:(id)a3;
- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setStageInRegion:(id *)a3;
- (void)setTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)updateFence:(id)a3;
- (void)useHeap:(id)a3;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)waitForFence:(id)a3;
@end

@implementation MTLCountersTraceComputeCommandEncoder

- (id)init:(BinaryBuffer *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTLCountersTraceComputeCommandEncoder;
  return [(MTLCountersTraceCommandEncoder *)&v4 init:a3 flags:2];
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  unint64_t v5 = a4;
  id v6 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long,MTLSize>((uint64_t)self->super._stream, 24, self->super._timer, (uint64_t *)&v6, (uint64_t *)&v5, (uint64_t *)a5);
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
}

- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v5 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 26, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v7 = a3;
  unint64_t v5 = a5;
  unint64_t v6 = a4;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long>((uint64_t)self->super._stream, 27, self->super._timer, (uint64_t *)&v7, (uint64_t *)&v6, (uint64_t *)&v5);
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  unint64_t v5 = a3;
  BinaryBuffer::Append<unsigned long,unsigned long>((uint64_t)self->super._stream, 28, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  _NSRange v9 = a5;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v8[0] = a3;
  v8[1] = a5.length;
  v7[0] = a4;
  v7[1] = a5.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto9MTLBuffer}* const>,BinaryBuffer::Array<unsigned long const>,_NSRange>((AppendBuffer *)stream, 29, timer, (uint64_t)v8, v7, (uint64_t *)&v9);
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v7 = a3;
  unint64_t v5 = a5;
  unint64_t v6 = a4;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long,unsigned long>((uint64_t)self->super._stream, 30, self->super._timer, (uint64_t *)&v7, (uint64_t *)&v6, (uint64_t *)&v5);
}

- (void)setComputePipelineState:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v14[1] = v14;
  __int16 __src = 7937;
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

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v5 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 32, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v9 = a3;
  float v8 = a4;
  float v7 = a5;
  unint64_t v6 = a6;
  BinaryBuffer::Append<objc_object  {objcproto15MTLSamplerState}*,float,float,unsigned long>((uint64_t)self->super._stream, 33, self->super._timer, (uint64_t *)&v9, (int *)&v8, (int *)&v7, (uint64_t *)&v6);
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  _NSRange v7 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v6[0] = (uint64_t *)a3;
  v6[1] = (uint64_t *)a4.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto15MTLSamplerState}* const>,_NSRange>((AppendBuffer *)stream, 34, timer, v6, (uint64_t *)&v7);
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  _NSRange v11 = a6;
  id v9 = a5;
  char v10 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v8[0] = a3;
  v8[1] = a6.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto15MTLSamplerState}* const>,float const*,float const,_NSRange>((AppendBuffer *)stream, 35, timer, (uint64_t)v8, (uint64_t *)&v10, (uint64_t *)&v9, (uint64_t *)&v11);
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v5 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 37, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  _NSRange v7 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v6[0] = (uint64_t *)a3;
  v6[1] = (uint64_t *)a4.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto15MTLSamplerState}* const>,_NSRange>((AppendBuffer *)stream, 38, timer, v6, (uint64_t *)&v7);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  unint64_t v5 = a3;
  BinaryBuffer::Append<unsigned long,unsigned long>((uint64_t)self->super._stream, 39, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setStageInRegion:(id *)a3
{
}

- (void)updateFence:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v14[1] = v14;
  __int16 __src = 29697;
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

- (void)waitForFence:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v14[1] = v14;
  __int16 __src = 32257;
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

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v7 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v6[0] = (uint64_t *)a3;
  v6[1] = (uint64_t *)a4;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto7MTLHeap}* const>,unsigned long>((AppendBuffer *)stream, 120, timer, v6, (uint64_t *)&v7);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v5 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 122, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
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

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v14[1] = v14;
  __int16 __src = 10241;
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

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v7 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v6[0] = (uint64_t *)a3;
  v6[1] = (uint64_t *)a4;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto7MTLHeap}* const>,unsigned long>((AppendBuffer *)stream, 41, timer, v6, (uint64_t *)&v7);
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v5 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 108, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  _NSRange v7 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v6[0] = (uint64_t *)a3;
  v6[1] = (uint64_t *)a4.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto15MTLSamplerState}* const>,_NSRange>((AppendBuffer *)stream, 109, timer, v6, (uint64_t *)&v7);
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v5 = a3;
  BinaryBuffer::Append<objc_object  {objcproto9MTLBuffer}*,unsigned long>((uint64_t)self->super._stream, 110, self->super._timer, (uint64_t *)&v5, (uint64_t *)&v4);
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  _NSRange v7 = a4;
  unint64_t timer = self->super._timer;
  stream = self->super._stream;
  v6[0] = (uint64_t *)a3;
  v6[1] = (uint64_t *)a4.length;
  BinaryBuffer::Append<BinaryBuffer::Array<objc_object  {objcproto15MTLSamplerState}* const>,_NSRange>((AppendBuffer *)stream, 111, timer, v6, (uint64_t *)&v7);
}

@end