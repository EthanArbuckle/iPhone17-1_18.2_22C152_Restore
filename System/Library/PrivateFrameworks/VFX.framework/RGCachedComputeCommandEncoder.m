@interface RGCachedComputeCommandEncoder
- (BOOL)isEncoding;
- (MTLDevice)device;
- (NSString)label;
- (RGCachedComputeCommandEncoder)init;
- (RGCachedComputeCommandEncoder)initWithEncoder:(id)a3;
- (id)getEncoderAndResetCache;
- (unint64_t)dispatchType;
- (void)dealloc;
- (void)dispatch:(id)a3 onTexture2D:(id)a4;
- (void)dispatch:(id)a3 threadgroups:(id *)a4 threadsPerThreadgroup:(id *)a5;
- (void)dispatch:(id)a3 threadgroupsWithIndirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 threadsPerThreadgroup:(id *)a6;
- (void)dispatchOnTexture2D:(id)a3;
- (void)dispatchOnTexture2DWithoutOptimizedThreadGroupPerGrid:(id)a3;
- (void)dispatchOnTexture3D:(id)a3;
- (void)dispatchOnTextureCube:(id)a3;
- (void)dispatchOnVertices:(id)a3 vertexCount:(unsigned int)a4;
- (void)dispatchOne:(id)a3;
- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5;
- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)endEncoding;
- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)insertDebugSignpost:(id)a3;
- (void)loadWithCommandBuffer:(id)a3 label:(id)a4;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4;
- (void)memoryBarrierWithScope:(unint64_t)a3;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)resetCache;
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
- (void)setEncoder:(id)a3;
- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4;
- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setLabel:(id)a3;
- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setStageInRegion:(id *)a3;
- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
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

@implementation RGCachedComputeCommandEncoder

- (RGCachedComputeCommandEncoder)init
{
  v3.receiver = self;
  v3.super_class = (Class)RGCachedComputeCommandEncoder;
  return [(RGCachedComputeCommandEncoder *)&v3 init];
}

- (RGCachedComputeCommandEncoder)initWithEncoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RGCachedComputeCommandEncoder;
  v4 = [(RGCachedComputeCommandEncoder *)&v8 init];
  objc_msgSend_setEncoder_(v4, v5, (uint64_t)a3, v6);
  return v4;
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_msgSend_device(self->_encoder, a2, v2, v3);
}

- (void)setLabel:(id)a3
{
  objc_msgSend_setLabel_(self->_encoder, a2, (uint64_t)a3, v3);
}

- (NSString)label
{
  return (NSString *)((uint64_t (*)(MTLComputeCommandEncoder *, char *))MEMORY[0x1F4181798])(self->_encoder, sel_label);
}

- (unint64_t)dispatchType
{
  return ((uint64_t (*)(MTLComputeCommandEncoder *, char *))MEMORY[0x1F4181798])(self->_encoder, sel_dispatchType);
}

- (void)dealloc
{
  objc_msgSend_setEncoder_(self, a2, 0, v2);
  v4.receiver = self;
  v4.super_class = (Class)RGCachedComputeCommandEncoder;
  [(RGCachedComputeCommandEncoder *)&v4 dealloc];
}

- (void)loadWithCommandBuffer:(id)a3 label:(id)a4
{
  uint64_t v6 = objc_msgSend_computeCommandEncoder(a3, a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_setEncoder_(self, v7, v6, v8);
  encoder = self->_encoder;

  objc_msgSend_setLabel_(encoder, v9, (uint64_t)a4, v10);
}

- (void)setEncoder:(id)a3
{
  id v5 = a3;

  self->_encoder = (MTLComputeCommandEncoder *)a3;

  objc_msgSend_resetCache(self, v6, v7, v8);
}

- (void)endEncoding
{
  objc_msgSend_endEncoding(self->_encoder, a2, v2, v3);

  objc_msgSend_setEncoder_(self, v5, 0, v6);
}

- (BOOL)isEncoding
{
  return self->_encoder != 0;
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

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  encoder = self->_encoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = *a4;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(encoder, a2, (uint64_t)&v6, (uint64_t)&v5);
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  encoder = self->_encoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a5;
  objc_msgSend_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_(encoder, a2, (uint64_t)a3, a4, &v6);
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  encoder = self->_encoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = *a4;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(encoder, a2, (uint64_t)&v6, (uint64_t)&v5);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (*((id *)&self->_cache.mesh + a5) == a3)
  {
    if (*((void *)&self[1]._cache.node + a5) != a4)
    {
      *((void *)&self[1]._cache.node + a5) = a4;
      objc_msgSend_setBufferOffset_atIndex_(self->_encoder, a2, a4, a5);
    }
  }
  else
  {
    *((void *)&self->_cache.mesh + a5) = a3;
    *((void *)&self[1]._cache.node + a5) = a4;
    objc_msgSend_setBuffer_offset_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
  }
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (*((void *)&self[1]._cache.node + a4) != a3)
  {
    *((void *)&self[1]._cache.node + a4) = a3;
    objc_msgSend_setBufferOffset_atIndex_(self->_encoder, a2, a3, a4);
  }
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  if (a5.length)
  {
    NSUInteger length = a5.length;
    NSUInteger location = a5.location;
    do
    {
      uint64_t v11 = (uint64_t)*a3++;
      uint64_t v10 = v11;
      uint64_t v12 = *a4++;
      objc_msgSend_setBuffer_offset_atIndex_(self, a2, v10, v12, location++);
      --length;
    }
    while (length);
  }
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
}

- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = &self->super.isa + a5;
  v5[3] = 0;
  v5[34] = 0;
  objc_msgSend_setBytes_length_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = &self->super.isa + a6;
  v6[3] = 0;
  v6[34] = 0;
  MEMORY[0x1F4181798](self->_encoder, sel_setBytes_length_attributeStride_atIndex_, a3, a4);
}

- (void)setComputePipelineState:(id)a3
{
  if (self->_cache.rasterizerStates != a3)
  {
    self->_cache.rasterizerStates = (__CFXRasterizerStates *)a3;
    objc_msgSend_setComputePipelineState_(self->_encoder, a2, (uint64_t)a3, v3);
  }
}

- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4
{
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  if (*((id *)&self[9]._cache.colorBufferWriteMask + a4) != a3)
  {
    *((void *)&self[9]._cache.colorBufferWriteMask + a4) = a3;
    objc_msgSend_setSamplerState_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
  }
}

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  *((void *)&self[9]._cache.colorBufferWriteMask + a6) = a3;
  MEMORY[0x1F4181798](self->_encoder, sel_setSamplerState_lodMinClamp_lodMaxClamp_atIndex_, a3, a6);
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  memcpy(&self[9]._cache.colorBufferWriteMask + 8 * a6.location, a3, 8 * a6.length);
  encoder = self->_encoder;

  MEMORY[0x1F4181798](encoder, sel_setSamplerStates_lodMinClamps_lodMaxClamps_withRange_, a3, a4);
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger location = a4.location;
  memcpy(&self[9]._cache.colorBufferWriteMask + 8 * a4.location, a3, 8 * a4.length);
  encoder = self->_encoder;

  MEMORY[0x1F4181798](encoder, sel_setSamplerStates_withRange_, a3, location);
}

- (void)setStageInRegion:(id *)a3
{
  encoder = self->_encoder;
  long long v5 = *(_OWORD *)&a3->var0.var2;
  v6[0] = *(_OWORD *)&a3->var0.var0;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend_setStageInRegion_(encoder, a2, (uint64_t)v6, v3);
}

- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  if (*((id *)&self[3]._cache.meshElement + a4) != a3)
  {
    *((void *)&self[3]._cache.meshElement + a4) = a3;
    objc_msgSend_setTexture_atIndex_(self->_encoder, a2, (uint64_t)a3, a4);
  }
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    for (uint64_t i = 0; i != length; ++i)
      objc_msgSend_setTexture_atIndex_(self, a2, (uint64_t)a3[i], i);
  }
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)updateFence:(id)a3
{
}

- (void)useHeap:(id)a3
{
  objc_msgSend_useHeap_(self->_encoder, a2, (uint64_t)a3, v3);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
}

- (void)waitForFence:(id)a3
{
}

- (void)resetCache
{
}

- (id)getEncoderAndResetCache
{
  objc_msgSend_resetCache(self, a2, v2, v3);
  return self->_encoder;
}

- (void)dispatch:(id)a3 threadgroups:(id *)a4 threadsPerThreadgroup:(id *)a5
{
  objc_msgSend_setComputePipelineState_(self, a2, (uint64_t)a3, (uint64_t)a4);
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9 = *a5;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(self, v8, (uint64_t)&v10, (uint64_t)&v9);
}

- (void)dispatch:(id)a3 threadgroupsWithIndirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 threadsPerThreadgroup:(id *)a6
{
  objc_msgSend_setComputePipelineState_(self, a2, (uint64_t)a3, (uint64_t)a4);
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a6;
  objc_msgSend_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_(self, v10, (uint64_t)a4, a5, &v11);
}

- (void)dispatchOne:(id)a3
{
  objc_msgSend_setComputePipelineState_(self, a2, (uint64_t)a3, v3);
  int64x2_t v8 = vdupq_n_s64(1uLL);
  uint64_t v9 = 1;
  int64x2_t v6 = v8;
  uint64_t v7 = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(self, v5, (uint64_t)&v8, (uint64_t)&v6);
}

- (void)dispatchOnVertices:(id)a3 vertexCount:(unsigned int)a4
{
  objc_msgSend_setComputePipelineState_(self, a2, (uint64_t)a3, *(uint64_t *)&a4);
  encoder = self->_encoder;

  RGMTLComputeCommandEncoderDispatchOnGrid1D(encoder, a3, a4, v7);
}

- (void)dispatch:(id)a3 onTexture2D:(id)a4
{
  uint64_t v7 = objc_msgSend_width(a4, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v11 = objc_msgSend_height(a4, v8, v9, v10);
  objc_msgSend_setComputePipelineState_(self, v12, (uint64_t)a3, v13);
  v14[0] = v7;
  v14[1] = v11;
  v14[2] = 1;
  RGMTLComputeCommandEncoderDispatchOnGrid2D(self, a3, (uint64_t)v14, 1);
}

- (void)dispatchOnTexture2D:(id)a3
{
  uint64_t v6 = objc_msgSend_width(a3, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_height(a3, v7, v8, v9);
  rasterizerStates = self->_cache.rasterizerStates;
  v12[0] = v6;
  v12[1] = v10;
  v12[2] = 1;
  RGMTLComputeCommandEncoderDispatchOnGrid2D(self, rasterizerStates, (uint64_t)v12, 1);
}

- (void)dispatchOnTexture2DWithoutOptimizedThreadGroupPerGrid:(id)a3
{
  uint64_t v6 = objc_msgSend_width(a3, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_height(a3, v7, v8, v9);
  rasterizerStates = self->_cache.rasterizerStates;
  v12[0] = v6;
  v12[1] = v10;
  v12[2] = 1;
  RGMTLComputeCommandEncoderDispatchOnGrid2D(self, rasterizerStates, (uint64_t)v12, 0);
}

- (void)dispatchOnTexture3D:(id)a3
{
  uint64_t v6 = objc_msgSend_width(a3, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_height(a3, v7, v8, v9);
  uint64_t v14 = objc_msgSend_depth(a3, v11, v12, v13);
  rasterizerStates = self->_cache.rasterizerStates;
  v17[0] = v6;
  v17[1] = v10;
  v17[2] = v14;
  RGMTLComputeCommandEncoderDispatchOnGrid3D(self, rasterizerStates, (uint64_t)v17, v16);
}

- (void)dispatchOnTextureCube:(id)a3
{
  uint64_t v6 = objc_msgSend_width(a3, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_height(a3, v7, v8, v9);
  rasterizerStates = self->_cache.rasterizerStates;
  v13[0] = v6;
  v13[1] = v10;
  v13[2] = 6;
  RGMTLComputeCommandEncoderDispatchOnGrid3D(self, rasterizerStates, (uint64_t)v13, v12);
}

@end