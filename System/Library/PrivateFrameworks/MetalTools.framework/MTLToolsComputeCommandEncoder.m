@interface MTLToolsComputeCommandEncoder
- (BOOL)encodeEndDoWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6;
- (BOOL)encodeEndIf;
- (BOOL)encodeEndWhile;
- (MTLToolsComputeCommandEncoder)initWithBaseObject:(id)a3 parent:(id)a4;
- (MTLToolsComputeCommandEncoder)initWithComputeCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5;
- (id)endEncodingAndRetrieveProgramAddressTable;
- (id)newKernelDebugInfo;
- (unint64_t)dispatchType;
- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5;
- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
- (void)enableNullBufferBinds:(BOOL)a3;
- (void)encodeStartDoWhile;
- (void)encodeStartElse;
- (void)encodeStartIf:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6;
- (void)encodeStartWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6;
- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)insertCompressedTextureReinterpretationFlush;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4;
- (void)memoryBarrierWithScope:(unint64_t)a3;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setComputePipelineState:(id)a3;
- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4;
- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setStageInRegion:(id *)a3;
- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
- (void)setSubstream:(unsigned int)a3;
- (void)setTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setThreadgroupDistributionMode:(int64_t)a3;
- (void)setThreadgroupDistributionModeWithClusterGroupIndex:(unsigned int)a3;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setThreadgroupPackingDisabled:(BOOL)a3;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)signalProgress:(unsigned int)a3;
- (void)updateFence:(id)a3;
- (void)useHeap:(id)a3;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResourceGroup:(id)a3 usage:(unint64_t)a4;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)waitForFence:(id)a3;
- (void)waitForProgress:(unsigned int)a3;
@end

@implementation MTLToolsComputeCommandEncoder

- (MTLToolsComputeCommandEncoder)initWithBaseObject:(id)a3 parent:(id)a4
{
  return [(MTLToolsComputeCommandEncoder *)self initWithComputeCommandEncoder:a3 parent:a4 descriptor:0];
}

- (MTLToolsComputeCommandEncoder)initWithComputeCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)MTLToolsComputeCommandEncoder;
  v7 = -[MTLToolsCommandEncoder initWithBaseObject:parent:](&v11, sel_initWithBaseObject_parent_, a3);
  v8 = v7;
  if (a5 && v7)
  {
    for (uint64_t i = 0; i != 4; ++i)
      objc_msgSend(a4, "addRetainedObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"));
  }
  return v8;
}

- (void)setComputePipelineState:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 setComputePipelineState:v6];
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 setBytes:a3 length:a4 atIndex:a5];
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setBufferOffset:a3 atIndex:a4];
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];

  [v9 setBuffer:v10 offset:a4 atIndex:a5];
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
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
      v12 = (void *)*v9++;
      *v10++ = [v12 baseObject];
      --v11;
    }
    while (v11);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setBuffers:offsets:withRange:", v13, a4, location, length);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];

  [v11 setBuffer:v12 offset:a4 attributeStride:a5 atIndex:a6];
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  v15[31] = *MEMORY[0x263EF8340];
  if (a6.length)
  {
    id v11 = a3;
    uint64_t v12 = v15;
    NSUInteger v13 = a6.length;
    do
    {
      [(MTLToolsCommandEncoder *)self addRetainedObject:*v11];
      v14 = (void *)*v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }
    while (v13);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setBuffers:offsets:attributeStrides:withRange:", v15, a4, a5, location, length);
}

- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 setBufferOffset:a3 attributeStride:a4 atIndex:a5];
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];

  [v10 setBytes:a3 length:a4 attributeStride:a5 atIndex:a6];
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 setTexture:v8 atIndex:a4];
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
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
      id v10 = (void *)*v7++;
      *v8++ = [v10 baseObject];
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setTextures:withRange:", v11, location, length);
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 setSamplerState:v8 atIndex:a4];
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
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
      id v10 = (void *)*v7++;
      *v8++ = [v10 baseObject];
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setSamplerStates:withRange:", v11, location, length);
}

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];
  *(float *)&double v13 = a4;
  *(float *)&double v14 = a5;

  [v11 setSamplerState:v12 lodMinClamp:a6 lodMaxClamp:v13 atIndex:v14];
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
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
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v15, a4, a5, location, length);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setThreadgroupMemoryLength:a3 atIndex:a4];
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7 = *a4;
  [v6 dispatchThreadgroups:&v8 threadsPerThreadgroup:&v7];
}

- (void)setStageInRegion:(id *)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  long long v5 = *(_OWORD *)&a3->var0.var2;
  v6[0] = *(_OWORD *)&a3->var0.var0;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->var1.var1;
  [v4 setStageInRegion:v6];
}

- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 setStageInRegionWithIndirectBuffer:v8 indirectBufferOffset:a4];
}

- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setImageblockWidth:a3 height:a4];
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a5;
  [v9 dispatchThreadgroupsWithIndirectBuffer:v10 indirectBufferOffset:a4 threadsPerThreadgroup:&v11];
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7 = *a4;
  [v6 dispatchThreads:&v8 threadsPerThreadgroup:&v7];
}

- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 dispatchThreadsWithIndirectBuffer:v8 indirectBufferOffset:a4];
}

- (id)newKernelDebugInfo
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 newKernelDebugInfo];
}

- (void)updateFence:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 updateFence:v6];
}

- (void)waitForFence:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v5 = [(MTLToolsObject *)self baseObject];
  uint64_t v6 = [a3 baseObject];

  [v5 waitForFence:v6];
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 useResource:v8 usage:a4];
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

- (unint64_t)dispatchType
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 dispatchType];
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 memoryBarrierWithScope:a3];
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
  std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
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
  [v9 memoryBarrierWithResources:__p[0] count:a4];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  BOOL v5 = a5;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];

  [v9 sampleCountersInBuffer:v10 atSampleIndex:a4 withBarrier:v5];
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

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setVisibleFunctionTable:v7 atBufferIndex:a4];
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
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
  objc_msgSend(v10, "setVisibleFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setIntersectionFunctionTable:v7 atBufferIndex:a4];
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  std::vector<objc_object  {objcproto28MTLIntersectionFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (uint64_t i = 0; i != length; ++i)
    {
      uint64_t v9 = [(id)a3[i] baseObject];
      *((void *)__p[0] + i) = v9;
    }
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  objc_msgSend(v10, "setIntersectionFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  [v6 setAccelerationStructure:v7 atBufferIndex:a4];
}

- (void)useResourceGroup:(id)a3 usage:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 useResourceGroup:a3 usage:a4];
}

- (void)insertCompressedTextureReinterpretationFlush
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 insertCompressedTextureReinterpretationFlush];
}

- (void)encodeStartDoWhile
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 encodeStartDoWhile];
}

- (BOOL)encodeEndDoWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];

  return [v11 encodeEndDoWhile:v12 offset:a4 comparison:a5 referenceValue:v6];
}

- (void)encodeStartWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];

  [v11 encodeStartWhile:v12 offset:a4 comparison:a5 referenceValue:v6];
}

- (BOOL)encodeEndWhile
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 encodeEndWhile];
}

- (void)encodeStartIf:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];

  [v11 encodeStartIf:v12 offset:a4 comparison:a5 referenceValue:v6];
}

- (void)encodeStartElse
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 encodeStartElse];
}

- (BOOL)encodeEndIf
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 encodeEndIf];
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 endEncodingAndRetrieveProgramAddressTable];
}

- (void)setSubstream:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setSubstream:v3];
}

- (void)signalProgress:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 signalProgress:v3];
}

- (void)waitForProgress:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 waitForProgress:v3];
}

- (void)setThreadgroupPackingDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setThreadgroupPackingDisabled:v3];
}

- (void)setThreadgroupDistributionMode:(int64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setThreadgroupDistributionMode:a3];
}

- (void)setThreadgroupDistributionModeWithClusterGroupIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setThreadgroupDistributionModeWithClusterGroupIndex:v3];
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