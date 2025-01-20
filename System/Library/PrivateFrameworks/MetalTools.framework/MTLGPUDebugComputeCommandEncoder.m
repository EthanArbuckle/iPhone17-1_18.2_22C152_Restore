@interface MTLGPUDebugComputeCommandEncoder
- (BOOL)encodeEndDoWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6;
- (BOOL)encodeEndIf;
- (BOOL)encodeEndWhile;
- (MTLGPUDebugComputeCommandEncoder)initWithComputeCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5 encoderID:(unsigned int)a6;
- (MTLGPUDebugComputeCommandEncoder)initWithComputeCommandEncoder:(id)a3 parent:(id)a4 encoderID:(unsigned int)a5;
- (id).cxx_construct;
- (id)temporaryBufferWithBytes:(const void *)a3 length:(unint64_t)a4;
- (id)temporaryBufferWithLength:(unint64_t)a3;
- (unint64_t)nextVirtualSubstream;
- (unsigned)encoderID;
- (void)beginVirtualSubstream;
- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5;
- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
- (void)encodeStartDoWhile;
- (void)encodeStartIf:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6;
- (void)encodeStartWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6;
- (void)endEncoding;
- (void)endVirtualSubstream;
- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)flushBindings;
- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setAccelerationStructures:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBufferUsageTable:(id)a3 textureUsageTable:(id)a4 textureTypeTable:(id)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setComputePipelineState:(id)a3;
- (void)setComputePipelineStateBuffers:(id)a3;
- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setKernelReportBuffer:(id)a3 offset:(unint64_t)a4;
- (void)setTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)useHeap:(id)a3;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResourceInternal:(id)a3 usage:(unint64_t)a4;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)waitForVirtualSubstream:(unint64_t)a3;
@end

@implementation MTLGPUDebugComputeCommandEncoder

- (MTLGPUDebugComputeCommandEncoder)initWithComputeCommandEncoder:(id)a3 parent:(id)a4 encoderID:(unsigned int)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  v6 = [(MTLToolsComputeCommandEncoder *)&v10 initWithBaseObject:a3 parent:a4];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [(MTLToolsObject *)v6 device];
    v7->_options = (Options *)(v8 + 264);
    v7->_dispatchID.encoderID = a5;
    v7->_dispatchID.eventID = 0;
    LOBYTE(v7->_commandBufferJumpNestingLevel) = (*(void *)(v8 + 284) & 0x200000001) != 0;
    MTLGPUDebugStageBufferHandles::clear(&v7->_handles);
    if ((*((unsigned char *)&v7->_options->var0 + 2) & 0x80) == 0) {
      [(MTLGPUDebugComputeCommandEncoder *)v7 _initBufferArgumentData:v7->super.super.super._device];
    }
  }
  return v7;
}

- (MTLGPUDebugComputeCommandEncoder)initWithComputeCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5 encoderID:(unsigned int)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  v7 = [(MTLToolsComputeCommandEncoder *)&v11 initWithComputeCommandEncoder:a3 parent:a4 descriptor:a5];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t p_deviceWrapper = (uint64_t)&v7->super.super.super._device[2]._deviceWrapper;
    v7->_options = (Options *)p_deviceWrapper;
    v7->_dispatchID.encoderID = a6;
    v7->_dispatchID.eventID = 0;
    LOBYTE(v7->_commandBufferJumpNestingLevel) = (*(void *)(p_deviceWrapper + 20) & 0x200000001) != 0;
    MTLGPUDebugStageBufferHandles::clear(&v7->_handles);
    if ((*((unsigned char *)&v8->_options->var0 + 2) & 0x80) == 0) {
      [(MTLGPUDebugComputeCommandEncoder *)v8 _initBufferArgumentData:v8->super.super.super._device];
    }
  }
  return v8;
}

- (unsigned)encoderID
{
  return self->_dispatchID.encoderID;
}

- (id)temporaryBufferWithBytes:(const void *)a3 length:(unint64_t)a4
{
  return (id)[(MTLToolsObject *)self->super.super.super._parent temporaryBufferWithBytes:a3 length:a4];
}

- (id)temporaryBufferWithLength:(unint64_t)a3
{
  return (id)[(MTLToolsObject *)self->super.super.super._parent temporaryBufferWithLength:a3];
}

- (void)setBufferUsageTable:(id)a3 textureUsageTable:(id)a4 textureTypeTable:(id)a5
{
  if (*((unsigned char *)&self->_options->var0 + 2))
  {
    [(MTLToolsObject *)self->super.super.super._baseObject setBuffer:a3 offset:0 atIndex:5];
    [(MTLToolsObject *)self->super.super.super._baseObject setBuffer:a4 offset:0 atIndex:6];
    [(MTLToolsObject *)self->super.super.super._baseObject setBuffer:a5 offset:0 atIndex:7];
    [(MTLToolsObject *)self->super.super.super._baseObject useResource:a3 usage:1];
    [(MTLToolsObject *)self->super.super.super._baseObject useResource:a4 usage:1];
    [(MTLToolsObject *)self->super.super.super._baseObject useResource:a5 usage:1];
    self->_bufferUsageTable = (MTLBuffer *)a3;
    self->_textureUsageTable = (MTLBuffer *)a4;
    self->_textureTypeTable = (MTLBuffer *)a5;
  }
}

- (void)setKernelReportBuffer:(id)a3 offset:(unint64_t)a4
{
  p_reportBuffer = &self->_reportBuffer;
  id v8 = a3;

  p_reportBuffer->buffer = (MTLBuffer *)a3;
  p_reportBuffer->offset = a4;
  baseObject = self->super.super.super._baseObject;
  uint64_t v10 = [a3 baseObject];
  if ((*(void *)&self->_options->var0 & 0x10000) != 0) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 32;
  }

  [(MTLToolsObject *)baseObject setBuffer:v10 offset:a4 atIndex:v11];
}

- (void)flushBindings
{
  baseObject = self->super.super.super._baseObject;
  if ((*(void *)&self->_options->var0 & 0x10000) != 0) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 33;
  }
  [(MTLToolsObject *)baseObject setBytes:&self->_dispatchID length:24 atIndex:v4];
  uint64_t v5 = *(void *)&self->_options->var0 & 0x7000000;
  unsigned int v6 = [(MTLDebugInstrumentationData *)[(MTLToolsComputePipelineState *)self->_currentPipeline debugInstrumentationData] activeThreadgroupMask];
  unsigned int v7 = [(MTLDebugInstrumentationData *)[(MTLToolsComputePipelineState *)self->_currentPipeline debugInstrumentationData] threadgroupArgumentOffset];
  if (v5 && self->_threadgroup.needsFlush)
  {
    unsigned int v15 = v6;
    unint64_t v8 = MTLGPUDebugThreadgroupLengths::setupTableEntries((uint64_t)&self->_threadgroup, &v15, v7);
    if (v8)
    {
      unint64_t v9 = v8;
      if ((*(void *)&self->_options->var0 & 0x10000) != 0) {
        uint64_t v10 = 4;
      }
      else {
        uint64_t v10 = 34;
      }
      [(MTLToolsObject *)self->super.super.super._baseObject setBytes:self->_threadgroup.entries length:256 atIndex:v10];
      [(MTLToolsObject *)self->super.super.super._baseObject setThreadgroupMemoryLength:v9 atIndex:0];
    }
    self->_threadgroup.needsFlush = 0;
  }
  $75A86BEFE5181BCE6D1FBDE93997BD40 var0 = self->_options->var0;
  if ((*(void *)&var0 & 0x200000001) != 0)
  {
    [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] encodeResourceTableBuffers:self type:1];
    $75A86BEFE5181BCE6D1FBDE93997BD40 var0 = self->_options->var0;
  }
  if ((*(_DWORD *)&var0 & 0x800000) != 0)
  {
    [(MTLToolsObject *)self->super.super.super._baseObject useResource:self->super.super.super._device[3].samplerObjectCache usage:1];
    uint64_t v14 = [(MTLDebugInstrumentationData *)[(MTLToolsComputePipelineState *)self->_currentPipeline debugInstrumentationData] bufferAccessMask];
    if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0) {
      [(MTLToolsObject *)self->super.super.super._baseObject setBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
    }
    if (self->_handles.needsFlush)
    {
      uint64_t v16 = v14;
      MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantIndirection<MTLGPUDebug::KernelEncoderClass>>((uint64_t)&self->_handles, (unint64_t *)&v16, (id *)&self->super.super.super.super.isa, 20, 23);
    }
  }
  else
  {
    uint64_t v12 = [(MTLDebugInstrumentationData *)[(MTLToolsComputePipelineState *)self->_currentPipeline debugInstrumentationData] bufferAccessMask];
    options = self->_options;
    if ((*(_DWORD *)&var0 & 0x10000) != 0)
    {
      if ((*((unsigned char *)&options->var0 + 2) & 0x80) != 0) {
        [(MTLToolsObject *)self->super.super.super._baseObject setBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
      }
      if (self->_handles.needsFlush)
      {
        uint64_t v16 = v12;
        MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT2<MTLGPUDebug::KernelEncoderClass>>((uint64_t)&self->_handles, (unint64_t *)&v16, self, 20, 23);
      }
    }
    else
    {
      if ((*((unsigned char *)&options->var0 + 2) & 0x80) != 0) {
        [(MTLToolsObject *)self->super.super.super._baseObject setBuffer:*(void *)([(MTLToolsObject *)self device] + 424) offset:0 atIndex:21];
      }
      if (self->_handles.needsFlush)
      {
        uint64_t v16 = v12;
        MTLGPUDebugStageBufferHandles::flush<MTLGPUDebug::EncoderVariantT1AGX<MTLGPUDebug::KernelEncoderClass>>((uint64_t)&self->_handles, (unint64_t *)&v16, self);
      }
    }
  }
  ++self->_dispatchID.eventID;
}

- (void)setComputePipelineStateBuffers:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ((*((unsigned char *)&self->_options->var0 + 2) & 0x80) != 0)
  {
    if ([a3 globalConstantsBuffer])
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", [a3 globalConstantsBuffer]);
      -[MTLGPUDebugComputeCommandEncoder useResource:usage:](self, "useResource:usage:", [a3 globalConstantsBuffer], 1);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unint64_t v8 = (void *)[a3 binaryFunctionData];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if (*(void *)(v13 + 8))
          {
            -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
            [(MTLGPUDebugComputeCommandEncoder *)self useResource:*(void *)(v13 + 8) usage:1];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
    uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "globalConstantsBuffer"), "handleForOffset:", objc_msgSend(a3, "constantOffset"));
    [(MTLToolsObject *)self->super.super.super._baseObject setBytes:&v14 length:8 atIndex:12];
  }
  else
  {
    baseObject = self->super.super.super._baseObject;
    uint64_t v6 = [a3 globalConstantsBuffer];
    uint64_t v7 = [a3 constantOffset];
    [(MTLToolsObject *)baseObject setBuffer:v6 offset:v7 atIndex:12];
  }
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  MTLGPUDebugStageBufferHandles::setBuffer(&self->_handles, (MTLGPUDebugBuffer *)a3, (char *)a4, (void *)a5, a6);
  if (LOBYTE(self->_commandBufferJumpNestingLevel)) {
    [(MTLToolsObject *)self->super.super.super._parent markBuffer:a3 usage:3 stages:1];
  }

  [(MTLToolsCommandEncoder *)self addRetainedObject:a3];
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  std::vector<unsigned long>::vector(__p, a5.length);
  uint64_t v10 = __p[0];
  if (length)
  {
    uint64_t v11 = 0;
    do
      v10[v11++] = -1;
    while (length > v11);
  }
  -[MTLGPUDebugComputeCommandEncoder setBuffers:offsets:attributeStrides:withRange:](self, "setBuffers:offsets:attributeStrides:withRange:", a3, a4, v10, location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  if (a6.length)
  {
    NSUInteger length = a6.length;
    NSUInteger location = a6.location;
    uint64_t v12 = 0;
    unsigned int v13 = 1;
    do
    {
      [(MTLGPUDebugComputeCommandEncoder *)self setBuffer:a3[v12] offset:a4[v12] attributeStride:a5[v12] atIndex:v12 + location];
      uint64_t v12 = v13;
    }
    while (length > v13++);
  }
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  id v9 = [(MTLGPUDebugComputeCommandEncoder *)self temporaryBufferWithBytes:a3 length:a4];

  [(MTLGPUDebugComputeCommandEncoder *)self setBuffer:v9 offset:0 attributeStride:a5 atIndex:a6];
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setAccelerationStructures:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLGPUDebugComputeCommandEncoder *)self setAccelerationStructure:v8 atBufferIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = [a3 baseObject];
  baseObject = self->super.super.super._baseObject;
  if (a3)
  {
    if (LOBYTE(self->_commandBufferJumpNestingLevel)) {
      [(MTLToolsObject *)self->super.super.super._parent markTexture:a3 usage:3 stages:1];
    }
    [(MTLToolsCommandEncoder *)self addRetainedObject:a3];
  }

  [(MTLToolsObject *)baseObject setTexture:v7 atIndex:a4];
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = *a3;
      uint64_t v9 = [(id)*a3 baseObject];
      baseObject = self->super.super.super._baseObject;
      if (v8)
      {
        if (LOBYTE(self->_commandBufferJumpNestingLevel)) {
          [(MTLToolsObject *)self->super.super.super._parent markTexture:v8 usage:3 stages:1];
        }
        [(MTLToolsCommandEncoder *)self addRetainedObject:v8];
      }
      [(MTLToolsObject *)baseObject setTexture:v9 atIndex:location++];
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_handles, a3, a4);
  if (a3)
  {
    baseObject = self->super.super.super._baseObject;
    uint64_t v7 = *((void *)a3 + 2);
    [(MTLToolsObject *)baseObject useResource:v7 usage:1];
  }
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLGPUDebugComputeCommandEncoder *)self setVisibleFunctionTable:v8 atBufferIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLGPUDebugStageBufferHandles::setResource((uint64_t)&self->_handles, a3, a4);
  if (a3)
  {
    baseObject = self->super.super.super._baseObject;
    uint64_t v7 = *((void *)a3 + 2);
    [(MTLToolsObject *)baseObject useResource:v7 usage:1];
  }
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(MTLGPUDebugComputeCommandEncoder *)self setIntersectionFunctionTable:v8 atBufferIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  [(MTLGPUDebugComputeCommandEncoder *)self flushBindings];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = *a4;
  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  [(MTLToolsComputeCommandEncoder *)&v7 dispatchThreads:&v9 threadsPerThreadgroup:&v8];
}

- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  [(MTLGPUDebugComputeCommandEncoder *)self flushBindings];
  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  [(MTLToolsComputeCommandEncoder *)&v7 dispatchThreadsWithIndirectBuffer:a3 indirectBufferOffset:a4];
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  [(MTLGPUDebugComputeCommandEncoder *)self flushBindings];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = *a4;
  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  [(MTLToolsComputeCommandEncoder *)&v7 dispatchThreadgroups:&v9 threadsPerThreadgroup:&v8];
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  [(MTLGPUDebugComputeCommandEncoder *)self flushBindings];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10 = *a5;
  v9.receiver = self;
  v9.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  [(MTLToolsComputeCommandEncoder *)&v9 dispatchThreadgroupsWithIndirectBuffer:a3 indirectBufferOffset:a4 threadsPerThreadgroup:&v10];
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if ((*((unsigned char *)&self->_options->var0 + 3) & 7) != 0)
  {
    p_threadgroup = &self->_threadgroup;
    MTLGPUDebugThreadgroupLengths::setThreadgroupMemoryLength(p_threadgroup, a3, a4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
    [(MTLToolsComputeCommandEncoder *)&v5 setThreadgroupMemoryLength:a3 atIndex:a4];
  }
}

- (void)useResourceInternal:(id)a3 usage:(unint64_t)a4
{
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder useResource:usage:](&v7, sel_useResource_usage_);
  if (LOBYTE(self->_commandBufferJumpNestingLevel))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(MTLToolsObject *)self->super.super.super._parent markBuffer:a3 usage:a4 stages:1];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(MTLToolsObject *)self->super.super.super._parent markTexture:a3 usage:a4 stages:1];
      }
    }
  }
  [a3 useWithComputeEncoder:self usage:a4];
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  if (a4)
  {
    unint64_t v6 = a4;
    do
    {
      uint64_t v9 = (uint64_t)*a3++;
      [(MTLGPUDebugComputeCommandEncoder *)self useResource:v9 usage:a5];
      --v6;
    }
    while (v6);
  }
}

- (void)useHeap:(id)a3
{
  if (LOBYTE(self->_commandBufferJumpNestingLevel)) {
    [(MTLToolsObject *)self->super.super.super._parent markHeap:a3 stages:1];
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  [(MTLToolsComputeCommandEncoder *)&v5 useHeap:a3];
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    do
    {
      uint64_t v7 = (uint64_t)*a3++;
      [(MTLGPUDebugComputeCommandEncoder *)self useHeap:v7];
      --v4;
    }
    while (v4);
  }
}

- (void)useResidencySet:(id)a3
{
  if ((*(void *)&self->_options->var0 & 0x200000001) != 0) {
    [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] addResidencySetGPUDebug:a3 fromEncoder:self];
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  [(MTLToolsComputeCommandEncoder *)&v5 useResidencySet:a3];
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  if ((*(void *)&self->_options->var0 & 0x200000001) != 0 && a4 != 0)
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = a3;
    unint64_t v9 = a4;
    do
    {
      uint64_t v10 = (uint64_t)*v8++;
      [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] addResidencySetGPUDebug:v10 fromEncoder:self];
      --v9;
    }
    while (v9);
  }
  v11.receiver = self;
  v11.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  [(MTLToolsComputeCommandEncoder *)&v11 useResidencySets:a3 count:a4];
}

- (void)setComputePipelineState:(id)a3
{
  self->_dispatchID.pipelineStateID = (unint64_t)a3;
  self->_dispatchID.entryPointImageID = [a3 kernelFunctionData];
  if (self->_currentPipeline == a3)
  {
    options = self->_options;
  }
  else
  {
    self->_threadgroup.needsFlush = 1;
    options = self->_options;
    if ((*((unsigned char *)&options->var0 + 2) & 0x81) == 0) {
      self->_handles.needsFlush = 1;
    }
  }
  if ((*((unsigned char *)&options->var0 + 2) & 0x40) != 0) {
    [(MTLGPUDebugComputeCommandEncoder *)self setComputePipelineStateBuffers:a3];
  }
  self->_currentPipeline = (MTLGPUDebugComputePipelineState *)a3;
  v6.receiver = self;
  v6.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  [(MTLToolsComputeCommandEncoder *)&v6 setComputePipelineState:a3];
}

- (void)endEncoding
{
  [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] endingEncoder:self type:1];
  MTLGPUDebugStageBufferHandles::clear(&self->_handles);

  self->_reportBuffer.buffer = 0;
  self->_reportBuffer.offset = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  [(MTLToolsCommandEncoder *)&v3 endEncoding];
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  unint64_t v9 = LODWORD(a4.location) | ((unint64_t)LODWORD(a4.length) << 32);
  int v10 = 1;
  PrepareExecuteIndirect(self, a3, (uint64_t)&v9);
  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder executeCommandsInBuffer:withRange:](&v8, sel_executeCommandsInBuffer_withRange_, a3, location, length);
  RestoreInternalState(self);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  v10[0] = a4;
  v10[1] = a5;
  int v11 = 0;
  PrepareExecuteIndirect(self, a3, (uint64_t)v10);
  v9.receiver = self;
  v9.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  [(MTLToolsComputeCommandEncoder *)&v9 executeCommandsInBuffer:a3 indirectBuffer:a4 indirectBufferOffset:a5];
  RestoreInternalState(self);
}

- (void)encodeStartDoWhile
{
  v4.receiver = self;
  v4.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  [(MTLToolsComputeCommandEncoder *)&v4 encodeStartDoWhile];
  int v3 = *(&self->_commandBufferJumpNestingLevel + 1);
  if (!v3)
  {
    RestoreInternalState(self);
    int v3 = *(&self->_commandBufferJumpNestingLevel + 1);
  }
  *(&self->_commandBufferJumpNestingLevel + 1) = v3 + 1;
}

- (BOOL)encodeEndDoWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  --*(&self->_commandBufferJumpNestingLevel + 1);
  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  return [(MTLToolsComputeCommandEncoder *)&v7 encodeEndDoWhile:a3 offset:a4 comparison:a5 referenceValue:*(void *)&a6];
}

- (void)encodeStartIf:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  [(MTLToolsComputeCommandEncoder *)&v8 encodeStartIf:a3 offset:a4 comparison:a5 referenceValue:*(void *)&a6];
  int v7 = *(&self->_commandBufferJumpNestingLevel + 1);
  if (!v7)
  {
    RestoreInternalState(self);
    int v7 = *(&self->_commandBufferJumpNestingLevel + 1);
  }
  *(&self->_commandBufferJumpNestingLevel + 1) = v7 + 1;
}

- (BOOL)encodeEndIf
{
  --*(&self->_commandBufferJumpNestingLevel + 1);
  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  return [(MTLToolsComputeCommandEncoder *)&v3 encodeEndIf];
}

- (void)encodeStartWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  [(MTLToolsComputeCommandEncoder *)&v8 encodeStartWhile:a3 offset:a4 comparison:a5 referenceValue:*(void *)&a6];
  int v7 = *(&self->_commandBufferJumpNestingLevel + 1);
  if (!v7)
  {
    RestoreInternalState(self);
    int v7 = *(&self->_commandBufferJumpNestingLevel + 1);
  }
  *(&self->_commandBufferJumpNestingLevel + 1) = v7 + 1;
}

- (BOOL)encodeEndWhile
{
  --*(&self->_commandBufferJumpNestingLevel + 1);
  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugComputeCommandEncoder;
  return [(MTLToolsComputeCommandEncoder *)&v3 encodeEndWhile];
}

- (void)beginVirtualSubstream
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 beginVirtualSubstream];
}

- (unint64_t)nextVirtualSubstream
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 nextVirtualSubstream];
}

- (void)endVirtualSubstream
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 endVirtualSubstream];
}

- (void)waitForVirtualSubstream:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 waitForVirtualSubstream:a3];
}

- (id).cxx_construct
{
  *((unsigned char *)self + 1688) = 0;
  *((unsigned char *)self + 2076) = 0;
  *((void *)self + 264) = 0;
  return self;
}

@end