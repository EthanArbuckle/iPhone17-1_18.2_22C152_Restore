@interface MTLDebugComputeCommandEncoder
- (MTLComputePipelineState)computePipelineState;
- (MTLDebugComputeCommandEncoder)initWithComputeCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5;
- (id).cxx_construct;
- (id)description;
- (id)endEncodingAndRetrieveProgramAddressTable;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)nextVirtualSubstream;
- (void)_setDefaults;
- (void)_validateAllFunctionArguments;
- (void)_validateThreadsPerThreadgroup:(id *)a3;
- (void)beginVirtualSubstream;
- (void)dealloc;
- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5;
- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
- (void)enableNullBufferBinds:(BOOL)a3;
- (void)endEncoding;
- (void)endEncoding_private;
- (void)endVirtualSubstream;
- (void)enumerateBuffersUsingBlock:(id)a3;
- (void)enumerateSamplersUsingBlock:(id)a3;
- (void)enumerateTexturesUsingBlock:(id)a3;
- (void)enumerateThreadgroupMemoryLengthsUsingBlock:(id)a3;
- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5;
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
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)signalProgress:(unsigned int)a3;
- (void)updateFence:(id)a3;
- (void)useHeap:(id)a3;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)validateFunctionTableUseResource:(id)a3 selectorName:(id)a4;
- (void)validateStageInRegion:(id *)a3;
- (void)waitForFence:(id)a3;
- (void)waitForProgress:(unsigned int)a3;
- (void)waitForVirtualSubstream:(unint64_t)a3;
@end

@implementation MTLDebugComputeCommandEncoder

- (void)_setDefaults
{
  bzero(self->_buffers, 0xAA8uLL);
  bzero(self->_textures, 0x2C00uLL);
  bzero(self->_samplers, 0x580uLL);
  bzero(self->_threadgroupMemoryLengths, 0xAA8uLL);
  self->_imageBlockSize.width = 0;
  self->_imageBlockSize.height = 0;
  self->_imageBlockSize.depth = 1;
  self->canDealloc = 0;
  self->canEndEncoding = 0;
  self->canSetComputePipelineState = 1;
  self->hasEndEncoding = 0;
  self->hasSetComputePipelineState = 0;
  self->allowsNullBufferBinds = 0;
  var0 = self->updatedFences.__map_.var0;
  var1 = self->updatedFences.__map_.var1;
  self->updatedFences.__size_.__value_ = 0;
  unint64_t v5 = (char *)var1 - (char *)var0;
  if (v5 >= 0x11)
  {
    do
    {
      operator delete(*var0);
      v6 = self->updatedFences.__map_.var1;
      var0 = self->updatedFences.__map_.var0 + 1;
      self->updatedFences.__map_.var0 = var0;
      unint64_t v5 = (char *)v6 - (char *)var0;
    }
    while (v5 > 0x10);
  }
  if (v5 >> 3 == 1)
  {
    unint64_t v7 = 256;
    goto LABEL_7;
  }
  if (v5 >> 3 == 2)
  {
    unint64_t v7 = 512;
LABEL_7:
    self->updatedFences.__start_ = v7;
  }
  self->_activeSubstream = 0;
  self->_numSubstreams = 0;
  std::__tree<unsigned int>::destroy((uint64_t)&self->_progressLabels, (void *)self->_progressLabels.__tree_.__pair1_.__value_.__left_);
  self->_progressLabels.__tree_.__begin_node_ = &self->_progressLabels.__tree_.__pair1_;
  self->_progressLabels.__tree_.__pair3_.__value_ = 0;
  self->_progressLabels.__tree_.__pair1_.__value_.__left_ = 0;
  self->_encodingVirtualSubstream = 0;
  self->_currentVirtualSubstreamIndex = 0;
  self->_encodedVirtualSubstreamDispatch = 0;
}

- (MTLDebugComputeCommandEncoder)initWithComputeCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)MTLDebugComputeCommandEncoder;
  unint64_t v7 = -[MTLToolsComputeCommandEncoder initWithComputeCommandEncoder:parent:descriptor:](&v12, sel_initWithComputeCommandEncoder_parent_descriptor_, a3);
  v8 = v7;
  if (v7)
  {
    v7->_commandBuffer = (MTLDebugCommandBuffer *)a4;
    [(MTLDebugComputeCommandEncoder *)v7 _setDefaults];
    v8->hasSetStageInRegion = 0;
    if (a5)
    {
      for (uint64_t i = 0; i != 4; ++i)
        -[MTLDebugCommandBuffer addObject:retained:purgeable:](v8->_commandBuffer, "addObject:retained:purgeable:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"), 1, 0);
    }
    unsigned int v10 = [a5 substreamCount];
    v8->_activeSubstream = 0;
    v8->_numSubstreams = v10;
    std::__tree<unsigned int>::destroy((uint64_t)&v8->_progressLabels, (void *)v8->_progressLabels.__tree_.__pair1_.__value_.__left_);
    v8->_progressLabels.__tree_.__begin_node_ = &v8->_progressLabels.__tree_.__pair1_;
    v8->_progressLabels.__tree_.__pair3_.__value_ = 0;
    v8->_progressLabels.__tree_.__pair1_.__value_.__left_ = 0;
  }
  return v8;
}

- (void)dealloc
{
  p_updatedFences = &self->updatedFences;
  var0 = (void **)self->updatedFences.__map_.var0;
  var1 = self->updatedFences.__map_.var1;
  self->updatedFences.__size_.__value_ = 0;
  unint64_t v6 = (char *)var1 - (char *)var0;
  if (v6 >= 0x11)
  {
    do
    {
      operator delete(*var0);
      unint64_t v7 = p_updatedFences->__map_.var1;
      var0 = (void **)(p_updatedFences->__map_.var0 + 1);
      p_updatedFences->__map_.var0 = (__end_ ***)var0;
      unint64_t v6 = (char *)v7 - (char *)var0;
    }
    while (v6 > 0x10);
  }
  if (v6 >> 3 == 1)
  {
    uint64_t v8 = 256;
  }
  else
  {
    if (v6 >> 3 != 2) {
      goto LABEL_8;
    }
    uint64_t v8 = 512;
  }
  p_updatedFences->__start_ = v8;
LABEL_8:
  if (self->canDealloc)
  {
    v9.receiver = self;
    v9.super_class = (Class)MTLDebugComputeCommandEncoder;
    [(MTLToolsObject *)&v9 dealloc];
  }
  else
  {
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
    v9.receiver = self;
    v9.super_class = (Class)MTLDebugComputeCommandEncoder;
    [(MTLToolsObject *)&v9 dealloc];
    MTLReportFailure();
  }
}

- (id)formattedDescription:(unint64_t)a3
{
  v29[5] = *MEMORY[0x263EF8340];
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v6 = a3 + 8;
  uint64_t v7 = [@"\n" stringByPaddingToLength:a3 + 8 withString:@" " startingAtIndex:0];
  uint64_t v8 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:226];
  computePipelineState = self->_computePipelineState;
  v29[0] = v5;
  v29[1] = @"computePipelineState =";
  unsigned int v10 = @"<null>";
  if (computePipelineState) {
    unsigned int v10 = (__CFString *)computePipelineState;
  }
  v29[2] = v10;
  v29[3] = v5;
  v29[4] = @"Set Buffers:";
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v29, 5));
  uint64_t v11 = 0;
  v19 = self;
  do
  {
    v28[0] = v7;
    v28[1] = objc_msgSend(NSString, "stringWithFormat:", @"Buffer %lu:", v11);
    v28[2] = argumentFormattedDescription(v6, (uint64_t)self->_buffers);
    objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v28, 3));
    ++v11;
    self = (MTLDebugComputeCommandEncoder *)((char *)self + 88);
  }
  while (v11 != 31);
  v27[0] = v5;
  v27[1] = @"Set Textures:";
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v27, 2));
  uint64_t v12 = 0;
  v13 = v19;
  do
  {
    v26[0] = v7;
    v26[1] = objc_msgSend(NSString, "stringWithFormat:", @"Texture %lu:", v12);
    v26[2] = argumentFormattedDescription(v6, (uint64_t)v13->_textures);
    objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v26, 3));
    ++v12;
    v13 = (MTLDebugComputeCommandEncoder *)((char *)v13 + 88);
  }
  while (v12 != 128);
  v25[0] = v5;
  v25[1] = @"Set Samplers:";
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v25, 2));
  uint64_t v14 = 0;
  v15 = v19;
  do
  {
    v24[0] = v7;
    v24[1] = objc_msgSend(NSString, "stringWithFormat:", @"Sampler %lu:", v14);
    v24[2] = argumentFormattedDescription(v6, (uint64_t)v15->_samplers);
    objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v24, 3));
    ++v14;
    v15 = (MTLDebugComputeCommandEncoder *)((char *)v15 + 88);
  }
  while (v14 != 16);
  v23[0] = v5;
  v23[1] = @"Set ThreadgroupMemoryLengths:";
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v23, 2));
  uint64_t v16 = 0;
  v17 = v19;
  do
  {
    v22[0] = v7;
    v22[1] = objc_msgSend(NSString, "stringWithFormat:", @"Threadgroup %lu:", v16);
    v22[2] = argumentFormattedDescription(v6, (uint64_t)v17->_threadgroupMemoryLengths);
    objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v22, 3));
    ++v16;
    v17 = (MTLDebugComputeCommandEncoder *)((char *)v17 + 88);
  }
  while (v16 != 31);
  v21[0] = v5;
  v21[1] = objc_msgSend(NSString, "stringWithFormat:", @"Image Block Size: %lu x %lu", v19->_imageBlockSize.width, v19->_imageBlockSize.height);
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v21, 2));
  v20.receiver = v19;
  v20.super_class = (Class)MTLDebugComputeCommandEncoder;
  return (id)[NSString stringWithFormat:@"%@%@", -[MTLToolsObject description](&v20, sel_description), objc_msgSend(v8, "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLDebugComputeCommandEncoder *)self formattedDescription:0];
}

- (void)setComputePipelineState:(id)a3
{
  if (!self->hasEndEncoding)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_13:
    MTLReportFailure();
    goto LABEL_6;
  }
  MTLReportFailure();
  if (!a3) {
    goto LABEL_13;
  }
LABEL_3:
  if (([a3 conformsToProtocol:&unk_26EF88A38] & 1) == 0) {
    MTLReportFailure();
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    goto LABEL_13;
  }
LABEL_6:
  if (self->hasSetComputePipelineState && self->_computePipelineState == a3) {
    MTLReportFailure();
  }
  self->hasSetComputePipelineState = 1;
  if (!self->canSetComputePipelineState) {
    MTLReportFailure();
  }
  self->canSetComputePipelineState = 0;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:0];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setComputePipelineState:", objc_msgSend(a3, "baseObject"));
  self->_computePipelineState = (MTLComputePipelineState *)a3;
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers] <= a6)
  {
    unint64_t v14 = a6;
    unint64_t v15 = [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
    MTLReportFailure();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeInlineDataSize] < a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxComputeInlineDataSize];
    MTLReportFailure();
  }
  uint64_t v11 = &self->_buffers[a6];
  validateArg(MTLArgumentTypeBuffer, a6, v11);
  BOOL v12 = [(MTLToolsDevice *)self->super.super.super._device supportsDynamicAttributeStride];
  id v13 = [(MTLToolsObject *)self baseObject];
  if (v12) {
    [v13 setBytes:a3 length:a4 attributeStride:a5 atIndex:a6];
  }
  else {
    [v13 setBytes:a3 length:a4 atIndex:a6];
  }
  MTLReportFailureTypeEnabled();
  v11->isValid = a4 != 0;
  v11->hasBeenUsed = 0;
  v11->type = 0;
  v11->object = 0;
  v11->var0 = 0;
  v11->bufferLength = a4;
  v11->bufferOffset = 0;
  v11->bufferAttributeStride = a5;
  v11->threadgroupMemoryLength = 0;
  v11->threadgroupMemoryOffset = 0;
  v11->hasLodClamp = 0;
  v11->lodMinClamp = 0.0;
  v11->lodMaxClamp = 0.0;
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers] > a6)
  {
    if (a3) {
      goto LABEL_5;
    }
LABEL_12:
    if (!a4) {
      goto LABEL_13;
    }
    unint64_t v19 = a4;
    goto LABEL_29;
  }
  unint64_t v19 = a6;
  uint64_t v20 = [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
  MTLReportFailure();
  if (!a3) {
    goto LABEL_12;
  }
LABEL_5:
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_26EF82558, v19, v20) & 1) == 0) {
    MTLReportFailure();
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    MTLReportFailure();
  }
  if ([a3 length] <= a4)
  {
    unint64_t v19 = a4;
    uint64_t v20 = [a3 length];
LABEL_29:
    MTLReportFailure();
  }
LABEL_13:
  buffers = self->_buffers;
  id v13 = &self->_buffers[a6];
  validateArg(MTLArgumentTypeBuffer, a6, v13);
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  BOOL v14 = [(MTLToolsDevice *)self->super.super.super._device supportsDynamicAttributeStride];
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a3 baseObject];
  if (v14) {
    [v15 setBuffer:v16 offset:a4 attributeStride:a5 atIndex:a6];
  }
  else {
    [v15 setBuffer:v16 offset:a4 atIndex:a6];
  }
  uint64_t v17 = objc_msgSend(a3, "length", v19, v20);
  if (MTLReportFailureTypeEnabled())
  {
    if (a3)
    {
      v18 = &buffers[a6];
      if (!v18->hasLodClamp
        && v18->bufferAttributeStride == a5
        && v18->bufferOffset == a4
        && v18->bufferLength == v17
        && v18->object == a3
        && !(v18->var0 | v18->type)
        && *(_OWORD *)&v18->threadgroupMemoryLength == 0
        && !*(void *)&v18->lodMinClamp)
      {
        MTLReportFailure();
      }
    }
  }
  v13->isValid = v17 != 0;
  v13->hasBeenUsed = 0;
  v13->type = 0;
  v13->object = (baseLevel *)a3;
  v13->var0 = 0;
  v13->bufferLength = v17;
  v13->bufferOffset = a4;
  v13->bufferAttributeStride = a5;
  v13->threadgroupMemoryLength = 0;
  v13->threadgroupMemoryOffset = 0;
  v13->hasLodClamp = 0;
  v13->lodMinClamp = 0.0;
  v13->lodMaxClamp = 0.0;
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers] <= a5)
  {
    unint64_t v18 = a5;
    unint64_t v20 = [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
    MTLReportFailure();
  }
  buffers = self->_buffers;
  unsigned int v10 = &self->_buffers[a5];
  validateArg(MTLArgumentTypeBuffer, a5, v10);
  p_id object = (id *)&v10->object;
  id object = v10->object;
  if (!object)
  {
    unint64_t v18 = a5;
    MTLReportFailure();
    id object = *p_object;
  }
  if (objc_msgSend(object, "length", v18, v20) <= a3)
  {
    unint64_t v19 = a3;
    uint64_t v21 = [*p_object length];
    MTLReportFailure();
  }
  BOOL v13 = [(MTLToolsDevice *)self->super.super.super._device supportsDynamicAttributeStride];
  id v14 = [(MTLToolsObject *)self baseObject];
  if (v13) {
    [v14 setBufferOffset:a3 attributeStride:a4 atIndex:a5];
  }
  else {
    [v14 setBufferOffset:a3 atIndex:a5];
  }
  id v15 = (baseLevel *)*p_object;
  uint64_t v16 = [*p_object length];
  if (MTLReportFailureTypeEnabled())
  {
    if (v15)
    {
      uint64_t v17 = &buffers[a5];
      if (!v17->hasLodClamp
        && v17->bufferAttributeStride == -1
        && v17->bufferOffset == a3
        && v17->bufferLength == v16
        && *p_object == v15
        && !(v17->var0 | v17->type)
        && *(_OWORD *)&v17->threadgroupMemoryLength == 0
        && !*(void *)&v17->lodMinClamp)
      {
        MTLReportFailure();
      }
    }
  }
  v10->isValid = v16 != 0;
  v10->hasBeenUsed = 0;
  v10->type = 0;
  v10->id object = v15;
  v10->var0 = 0;
  v10->bufferLength = v16;
  v10->bufferOffset = a3;
  v10->bufferAttributeStride = -1;
  v10->threadgroupMemoryLength = 0;
  v10->threadgroupMemoryOffset = 0;
  v10->hasLodClamp = 0;
  v10->lodMinClamp = 0.0;
  v10->lodMaxClamp = 0.0;
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  std::vector<unsigned long>::vector(__b, a5.length);
  unsigned int v10 = __b[0];
  if (length) {
    memset(__b[0], 255, 8 * length);
  }
  -[MTLDebugComputeCommandEncoder setBuffers:offsets:attributeStrides:withRange:](self, "setBuffers:offsets:attributeStrides:withRange:", a3, a4, v10, location, length);
  if (__b[0])
  {
    __b[1] = __b[0];
    operator delete(__b[0]);
  }
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  unsigned int v10 = self;
  v39[31] = *MEMORY[0x263EF8340];
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if (location + length > [(MTLToolsDevice *)v10->super.super.super._device maxComputeBuffers])
  {
    v30 = (void *)(location + length);
    uint64_t v32 = [(MTLToolsDevice *)v10->super.super.super._device maxComputeBuffers];
    MTLReportFailure();
    if (length) {
      goto LABEL_5;
    }
  }
  else if (length)
  {
LABEL_5:
    uint64_t v11 = 0;
    uint64_t v12 = (uint64_t)(&v10->super.super._commandBuffer + 11 * location);
    NSUInteger v36 = location;
    NSUInteger v37 = length;
    v35 = v10;
    while (1)
    {
      BOOL v13 = (void *)a3[(void)v11];
      if (v13) {
        break;
      }
      if (a4[(void)v11])
      {
        v30 = v11;
        uint64_t v32 = a4[(void)v11];
LABEL_40:
        MTLReportFailure();
      }
LABEL_14:
      uint64_t v17 = v12 + 48;
      validateArg(MTLArgumentTypeBuffer, (unint64_t)v11 + location, (MTLDebugFunctionArgument *)(v12 + 8));
      [(MTLDebugCommandBuffer *)v10->_commandBuffer addObject:a3[(void)v11] retained:1 purgeable:1];
      v39[(void)v11] = [(id)a3[(void)v11] baseObject];
      unint64_t v18 = (void *)a3[(void)v11];
      uint64_t v19 = [v18 length];
      unint64_t v20 = a4[(void)v11];
      unint64_t v21 = a5[(void)v11];
      if (MTLReportFailureTypeEnabled() && v18 && !*(unsigned char *)(v12 + 80))
      {
        BOOL v22 = *(void *)(v12 + 56) == v21 && *(void *)v17 == v20;
        BOOL v23 = v22 && *(void *)(v12 + 40) == v19;
        BOOL v24 = v23 && *(void *)(v12 + 24) == (void)v18;
        BOOL v25 = v24 && (*(void *)(v12 + 32) | *(void *)(v12 + 16)) == 0;
        BOOL v26 = v25 && *(_OWORD *)(v12 + 64) == 0;
        if (v26 && *(void *)(v12 + 84) == 0)
        {
          v30 = v18;
          MTLReportFailure();
        }
      }
      *(unsigned char *)(v12 + 8) = v19 != 0;
      *(unsigned char *)(v12 + 9) = 0;
      *(void *)(v12 + 16) = 0;
      *(void *)(v12 + 24) = v18;
      *(void *)(v12 + 32) = 0;
      *(void *)(v12 + 40) = v19;
      *(void *)uint64_t v17 = v20;
      *(void *)(v12 + 56) = v21;
      *(void *)(v12 + 64) = 0;
      *(void *)(v12 + 72) = 0;
      *(unsigned char *)(v12 + 80) = 0;
      uint64_t v11 = (char *)v11 + 1;
      v12 += 88;
      *(_DWORD *)(v17 + 36) = 0;
      *(_DWORD *)(v17 + 40) = 0;
      NSUInteger location = v36;
      NSUInteger length = v37;
      unsigned int v10 = v35;
      if ((void *)v37 == v11) {
        goto LABEL_42;
      }
    }
    if (([v13 conformsToProtocol:&unk_26EF82558] & 1) == 0)
    {
      v30 = v11;
      MTLReportFailure();
    }
    device = v10->super.super.super._device;
    if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v11], "device", v30, v32, v33, v34))
    {
      v31 = v11;
      MTLReportFailure();
    }
    unint64_t v15 = a4[(void)v11];
    if (v15 < objc_msgSend((id)a3[(void)v11], "length", v31)) {
      goto LABEL_14;
    }
    unint64_t v16 = a4[(void)v11];
    v33 = v11;
    uint64_t v34 = [(id)a3[(void)v11] length];
    v30 = v11;
    uint64_t v32 = v16;
    goto LABEL_40;
  }
LABEL_42:
  BOOL v28 = [(MTLToolsDevice *)v10->super.super.super._device supportsDynamicAttributeStride];
  id v29 = [(MTLToolsObject *)v10 baseObject];
  if (v28) {
    objc_msgSend(v29, "setBuffers:offsets:attributeStrides:withRange:", v39, a4, a5, location, length);
  }
  else {
    objc_msgSend(v29, "setBuffers:offsets:withRange:", v39, a4, location, length);
  }
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeTextures] <= a4)
  {
    unint64_t v23 = a4;
    unint64_t v24 = [(MTLToolsDevice *)self->super.super.super._device maxComputeTextures];
    MTLReportFailure();
    if (!a3) {
      goto LABEL_13;
    }
  }
  else if (!a3)
  {
    goto LABEL_13;
  }
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_26EF9C6F8, v23, v24) & 1) == 0) {
    MTLReportFailure();
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    MTLReportFailure();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "baseObject"), "isFramebufferOnly")) {
    MTLReportFailure();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "baseObject"), "storageMode") == 3) {
    MTLReportFailure();
  }
LABEL_13:
  uint64_t v8 = &self->_textures[a4];
  validateArg(MTLArgumentTypeTexture, a4, v8);
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  if (MTLReportFailureTypeEnabled())
  {
    objc_super v9 = &self->_textures[a4];
    unint64_t type = v9->type;
    id object = v9->object;
    unint64_t bufferAttributeStride = v9->bufferAttributeStride;
    unint64_t v13 = v9->bufferLength | v9->var0 | v9->bufferOffset;
    unint64_t v14 = v9->threadgroupMemoryOffset | v9->threadgroupMemoryLength;
    BOOL hasLodClamp = v9->hasLodClamp;
    int v16 = LODWORD(v9->lodMaxClamp) | LODWORD(v9->lodMinClamp);
    if (!hasLodClamp && bufferAttributeStride == -1 && type == 1 && object == a3 && v13 == 0 && v14 == 0 && v16 == 0) {
      MTLReportFailure();
    }
  }
  v8->isValid = a3 != 0;
  v8->hasBeenUsed = 0;
  v8->unint64_t type = 1;
  v8->id object = (baseLevel *)a3;
  v8->var0 = 0;
  v8->bufferLength = 0;
  v8->bufferOffset = 0;
  v8->unint64_t bufferAttributeStride = -1;
  v8->threadgroupMemoryLength = 0;
  v8->threadgroupMemoryOffset = 0;
  v8->BOOL hasLodClamp = 0;
  v8->lodMinClamp = 0.0;
  v8->lodMaxClamp = 0.0;
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v24[128] = *MEMORY[0x263EF8340];
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if (location + length > [(MTLToolsDevice *)self->super.super.super._device maxComputeTextures])
  {
    unint64_t v20 = (const void *)(location + length);
    unint64_t v23 = [(MTLToolsDevice *)self->super.super.super._device maxComputeTextures];
    MTLReportFailure();
    if (!length) {
      goto LABEL_39;
    }
  }
  else if (!length)
  {
    goto LABEL_39;
  }
  uint64_t v8 = 0;
  objc_super v9 = (char *)self + 88 * location;
  do
  {
    unsigned int v10 = (void *)a3[(void)v8];
    if (v10)
    {
      if (([v10 conformsToProtocol:&unk_26EF9C6F8] & 1) == 0)
      {
        unint64_t v20 = v8;
        MTLReportFailure();
      }
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v8], "device", v20, v23))
      {
        unint64_t v21 = v8;
        MTLReportFailure();
      }
      if (objc_msgSend((id)objc_msgSend((id)a3[(void)v8], "baseObject", v21), "isFramebufferOnly"))
      {
        BOOL v22 = v8;
        MTLReportFailure();
      }
      if (objc_msgSend((id)objc_msgSend((id)a3[(void)v8], "baseObject", v22), "storageMode") == 3)
      {
        unint64_t v20 = v8;
        MTLReportFailure();
      }
    }
    uint64_t v12 = v9 + 2776;
    validateArg(MTLArgumentTypeTexture, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 2776));
    [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3[(void)v8] retained:1 purgeable:1];
    v24[(void)v8] = [(id)a3[(void)v8] baseObject];
    unint64_t v13 = a3[(void)v8];
    if (MTLReportFailureTypeEnabled())
    {
      if (v9[2848]) {
        BOOL v14 = 0;
      }
      else {
        BOOL v14 = *((void *)v9 + 353) == -1;
      }
      if (v14
        && *((void *)v9 + 348) == 1
        && *((void *)v9 + 349) == (void)v13
        && (*((void *)v9 + 351) | *((void *)v9 + 350) | *((void *)v9 + 352)) == 0
        && *((_OWORD *)v9 + 177) == 0
        && *(void *)(v9 + 2852) == 0)
      {
        unint64_t v20 = v13;
        MTLReportFailure();
      }
    }
    *uint64_t v12 = v13 != 0;
    v9[2777] = 0;
    *((void *)v9 + 348) = 1;
    *((void *)v9 + 349) = v13;
    *((void *)v9 + 350) = 0;
    *((void *)v9 + 351) = 0;
    *((void *)v9 + 352) = 0;
    *((void *)v9 + 353) = -1;
    *((void *)v9 + 354) = 0;
    *((void *)v9 + 355) = 0;
    v9[2848] = 0;
    uint64_t v8 = (char *)v8 + 1;
    v9 += 88;
    *((_DWORD *)v12 + 19) = 0;
    *((_DWORD *)v12 + 20) = 0;
  }
  while ((const void *)length != v8);
LABEL_39:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v20), "setTextures:withRange:", v24, location, length);
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers] <= a4)
  {
    unint64_t v23 = a4;
    unint64_t v24 = [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
    MTLReportFailure();
    if (!a3) {
      goto LABEL_9;
    }
  }
  else if (!a3)
  {
    goto LABEL_9;
  }
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_26EF82070, v23, v24) & 1) == 0) {
    MTLReportFailure();
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    MTLReportFailure();
  }
LABEL_9:
  uint64_t v8 = &self->_samplers[a4];
  validateArg(MTLArgumentTypeSampler, a4, v8);
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:0];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  if (MTLReportFailureTypeEnabled())
  {
    objc_super v9 = &self->_samplers[a4];
    unint64_t type = v9->type;
    id object = v9->object;
    unint64_t bufferAttributeStride = v9->bufferAttributeStride;
    unint64_t v13 = v9->bufferLength | v9->var0 | v9->bufferOffset;
    unint64_t v14 = v9->threadgroupMemoryOffset | v9->threadgroupMemoryLength;
    BOOL hasLodClamp = v9->hasLodClamp;
    int v16 = LODWORD(v9->lodMaxClamp) | LODWORD(v9->lodMinClamp);
    if (!hasLodClamp && bufferAttributeStride == -1 && type == 2 && object == a3 && v13 == 0 && v14 == 0 && v16 == 0) {
      MTLReportFailure();
    }
  }
  v8->isValid = a3 != 0;
  v8->hasBeenUsed = 0;
  v8->unint64_t type = 2;
  v8->id object = (baseLevel *)a3;
  v8->var0 = 0;
  v8->bufferLength = 0;
  v8->bufferOffset = 0;
  v8->unint64_t bufferAttributeStride = -1;
  v8->threadgroupMemoryLength = 0;
  v8->threadgroupMemoryOffset = 0;
  v8->BOOL hasLodClamp = 0;
  v8->lodMinClamp = 0.0;
  v8->lodMaxClamp = 0.0;
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v22[16] = *MEMORY[0x263EF8340];
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if (location + length > [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers])
  {
    unint64_t v20 = (const void *)(location + length);
    unint64_t v21 = [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
    MTLReportFailure();
    if (!length) {
      goto LABEL_35;
    }
  }
  else if (!length)
  {
    goto LABEL_35;
  }
  uint64_t v8 = 0;
  objc_super v9 = (char *)self + 88 * location;
  do
  {
    unsigned int v10 = (void *)a3[(void)v8];
    if (v10)
    {
      if (([v10 conformsToProtocol:&unk_26EF82070] & 1) == 0)
      {
        unint64_t v20 = v8;
        MTLReportFailure();
      }
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v8], "device", v20, v21))
      {
        unint64_t v20 = v8;
        MTLReportFailure();
      }
    }
    uint64_t v12 = v9 + 14040;
    validateArg(MTLArgumentTypeSampler, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 14040));
    [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3[(void)v8] retained:1 purgeable:0];
    v22[(void)v8] = [(id)a3[(void)v8] baseObject];
    unint64_t v13 = a3[(void)v8];
    if (MTLReportFailureTypeEnabled())
    {
      if (v9[14112]) {
        BOOL v14 = 0;
      }
      else {
        BOOL v14 = *((void *)v9 + 1761) == -1;
      }
      if (v14
        && *((void *)v9 + 1756) == 2
        && *((void *)v9 + 1757) == (void)v13
        && (*((void *)v9 + 1759) | *((void *)v9 + 1758) | *((void *)v9 + 1760)) == 0
        && *((_OWORD *)v9 + 881) == 0
        && *(void *)(v9 + 14116) == 0)
      {
        unint64_t v20 = v13;
        MTLReportFailure();
      }
    }
    *uint64_t v12 = v13 != 0;
    v9[14041] = 0;
    *((void *)v9 + 1756) = 2;
    *((void *)v9 + 1757) = v13;
    *((void *)v9 + 1758) = 0;
    *((void *)v9 + 1759) = 0;
    *((void *)v9 + 1760) = 0;
    *((void *)v9 + 1761) = -1;
    *((void *)v9 + 1762) = 0;
    *((void *)v9 + 1763) = 0;
    v9[14112] = 0;
    uint64_t v8 = (char *)v8 + 1;
    v9 += 88;
    *((_DWORD *)v12 + 19) = 0;
    *((_DWORD *)v12 + 20) = 0;
  }
  while ((const void *)length != v8);
LABEL_35:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v20), "setSamplerStates:withRange:", v22, location, length);
}

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers] <= a6)
  {
    unint64_t v26 = a6;
    unint64_t v27 = [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
    MTLReportFailure();
    if (!a3) {
      goto LABEL_9;
    }
  }
  else if (!a3)
  {
    goto LABEL_9;
  }
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_26EF82070, v26, v27) & 1) == 0) {
    MTLReportFailure();
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    MTLReportFailure();
  }
LABEL_9:
  samplers = self->_samplers;
  unint64_t v13 = &self->_samplers[a6];
  validateArg(MTLArgumentTypeSampler, a6, v13);
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:0];
  id v14 = [(MTLToolsObject *)self baseObject];
  uint64_t v15 = [a3 baseObject];
  *(float *)&double v16 = a4;
  *(float *)&double v17 = a5;
  [v14 setSamplerState:v15 lodMinClamp:a6 lodMaxClamp:v16 atIndex:v17];
  if (MTLReportFailureTypeEnabled())
  {
    unint64_t v18 = &samplers[a6];
    if (LODWORD(v18->lodMaxClamp) == LODWORD(a5)
      && LODWORD(v18->lodMinClamp) == LODWORD(a4)
      && v18->hasLodClamp
      && v18->bufferAttributeStride == -1
      && v18->type == 2
      && v18->object == a3
      && (v18->bufferLength | v18->var0 | v18->bufferOffset) == 0
      && *(_OWORD *)&v18->threadgroupMemoryLength == 0)
    {
      MTLReportFailure();
    }
  }
  v13->isValid = a3 != 0;
  v13->hasBeenUsed = 0;
  v13->unint64_t type = 2;
  v13->id object = (baseLevel *)a3;
  v13->var0 = 0;
  v13->bufferLength = 0;
  v13->bufferOffset = 0;
  v13->unint64_t bufferAttributeStride = -1;
  v13->threadgroupMemoryLength = 0;
  v13->threadgroupMemoryOffset = 0;
  v13->BOOL hasLodClamp = 1;
  v13->lodMinClamp = a4;
  v13->lodMaxClamp = a5;
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  v29[16] = *MEMORY[0x263EF8340];
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if (location + length > [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers])
  {
    unint64_t v26 = (const void *)(location + length);
    unint64_t v27 = [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
    MTLReportFailure();
    if (!length) {
      goto LABEL_38;
    }
  }
  else if (!length)
  {
    goto LABEL_38;
  }
  uint64_t v11 = 0;
  p_bufferLength = &self->_buffers[location].bufferLength;
  do
  {
    unint64_t v13 = (void *)a3[(void)v11];
    if (v13)
    {
      if (([v13 conformsToProtocol:&unk_26EF82070] & 1) == 0)
      {
        unint64_t v26 = v11;
        MTLReportFailure();
      }
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v11], "device", v26, v27))
      {
        unint64_t v26 = v11;
        MTLReportFailure();
      }
    }
    uint64_t v15 = (float *)(p_bufferLength + 1755);
    validateArg(MTLArgumentTypeSampler, (unint64_t)v11 + location, (MTLDebugFunctionArgument *)(p_bufferLength + 1745));
    [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3[(void)v11] retained:1 purgeable:0];
    v29[(void)v11] = [(id)a3[(void)v11] baseObject];
    double v16 = a3[(void)v11];
    float v17 = a4[(void)v11];
    float v18 = a5[(void)v11];
    if (MTLReportFailureTypeEnabled())
    {
      if (*(_DWORD *)v15 == LODWORD(v18)
        && *((_DWORD *)p_bufferLength + 3509) == LODWORD(v17)
        && *((unsigned char *)p_bufferLength + 14032) != 0
        && p_bufferLength[1751] == -1
        && p_bufferLength[1746] == 2
        && p_bufferLength[1747] == (void)v16
        && (p_bufferLength[1749] | p_bufferLength[1748] | p_bufferLength[1750]) == 0
        && *((_OWORD *)p_bufferLength + 876) == 0)
      {
        unint64_t v26 = v16;
        MTLReportFailure();
      }
    }
    *((unsigned char *)p_bufferLength + 13960) = v16 != 0;
    *((unsigned char *)p_bufferLength + 13961) = 0;
    p_bufferLength[1746] = 2;
    p_bufferLength[1747] = (unint64_t)v16;
    p_bufferLength[1748] = 0;
    p_bufferLength[1749] = 0;
    p_bufferLength[1750] = 0;
    p_bufferLength[1751] = -1;
    p_bufferLength[1752] = 0;
    p_bufferLength[1753] = 0;
    *((unsigned char *)p_bufferLength + 14032) = 1;
    *((float *)p_bufferLength + 3509) = v17;
    float *v15 = v18;
    uint64_t v11 = (char *)v11 + 1;
    p_bufferLength += 11;
  }
  while ((const void *)length != v11);
LABEL_38:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v26), "setSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v29, a4, a5, location, length);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeLocalMemorySizes] <= a4)
  {
    unint64_t v9 = a4;
    unint64_t v11 = [(MTLToolsDevice *)self->super.super.super._device maxComputeLocalMemorySizes];
    MTLReportFailure();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxThreadgroupMemoryLength] < a3)
  {
    unint64_t v10 = a3;
    unint64_t v12 = [(MTLToolsDevice *)self->super.super.super._device maxThreadgroupMemoryLength];
    MTLReportFailure();
  }
  if (a3
     % [(MTLToolsDevice *)self->super.super.super._device maxComputeThreadgroupMemoryAlignmentBytes])
  {
    [(MTLToolsDevice *)self->super.super.super._device maxComputeThreadgroupMemoryAlignmentBytes];
    MTLReportFailure();
  }
  uint64_t v7 = &self->_threadgroupMemoryLengths[a4];
  validateArg(MTLArgumentTypeThreadgroupMemory, a4, v7);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setThreadgroupMemoryLength:atIndex:", a3, a4);
  if (MTLReportFailureTypeEnabled())
  {
    uint64_t v8 = &self->_threadgroupMemoryLengths[a4];
    if (!v8->hasLodClamp
      && !v8->threadgroupMemoryOffset
      && v8->threadgroupMemoryLength == a3
      && v8->bufferAttributeStride == -1
      && v8->type == 3
      && !v8->object
      && !(v8->bufferLength | v8->var0 | v8->bufferOffset)
      && !*(void *)&v8->lodMinClamp)
    {
      MTLReportFailure();
    }
  }
  v7->isValid = a3 != 0;
  v7->hasBeenUsed = 0;
  v7->unint64_t type = 3;
  *(_OWORD *)&v7->id object = 0u;
  *(_OWORD *)&v7->bufferLength = 0u;
  v7->unint64_t bufferAttributeStride = -1;
  v7->threadgroupMemoryLength = a3;
  v7->threadgroupMemoryOffset = 0;
  v7->BOOL hasLodClamp = 0;
  v7->lodMinClamp = 0.0;
  v7->lodMaxClamp = 0.0;
}

- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] != 1)
  {
    unint64_t v10 = a3;
    MTLReportFailure();
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)a4);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] != 1)
  {
    unint64_t v10 = a4;
    MTLReportFailure();
  }
  if (a4 * a3 >= 0x401)
  {
    unint64_t v10 = a3;
    unint64_t v11 = a4;
    MTLReportFailure();
  }
  self->_imageBlockSize.width = a3;
  self->_imageBlockSize.height = a4;
  id v9 = [(MTLToolsObject *)self baseObject];

  [v9 setImageblockWidth:a3 height:a4];
}

- (void)validateStageInRegion:(id *)a3
{
  p_stageInRegion = &self->stageInRegion;
  unint64_t width = self->stageInRegion.size.width;
  if (!(self->stageInRegion.size.height * width * self->stageInRegion.size.depth))
  {
    MTLReportFailure();
    unint64_t width = p_stageInRegion->size.width;
  }
  if (width > a3->var0) {
    MTLReportFailure();
  }
  if (p_stageInRegion->size.height > a3->var1) {
    MTLReportFailure();
  }
  if (p_stageInRegion->size.depth > a3->var2) {
    MTLReportFailure();
  }
}

- (void)setStageInRegion:(id *)a3
{
  self->hasSetStageInRegion = 1;
  self->hasIndirectSetStageInRegion = 0;
  long long v4 = *(_OWORD *)&a3->var0.var0;
  long long v5 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->stageInRegion.origin.z = *(_OWORD *)&a3->var0.var2;
  *(_OWORD *)&self->stageInRegion.size.height = v5;
  *(_OWORD *)&self->stageInRegion.origin.x = v4;
  id v6 = [(MTLToolsObject *)self baseObject];
  long long v7 = *(_OWORD *)&a3->var0.var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&a3->var1.var1;
  [v6 setStageInRegion:v8];
}

- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  self->hasSetStageInRegion = 0;
  self->hasIndirectSetStageInRegion = 1;
  if ((a4 & 3) != 0)
  {
    unint64_t v9 = a4;
    MTLReportFailure();
  }
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 setStageInRegionWithIndirectBuffer:v8 indirectBufferOffset:a4];
}

- (void)_validateAllFunctionArguments
{
  unint64_t v3 = 0;
  buffers = self->_buffers;
  do
    validateArg(MTLArgumentTypeBuffer, v3++, buffers++);
  while (v3 != 31);
  unint64_t v5 = 0;
  textures = self->_textures;
  do
    validateArg(MTLArgumentTypeTexture, v5++, textures++);
  while (v5 != 128);
  unint64_t v7 = 0;
  samplers = self->_samplers;
  do
    validateArg(MTLArgumentTypeSampler, v7++, samplers++);
  while (v7 != 16);
  unint64_t v9 = 0;
  threadgroupMemoryLengths = self->_threadgroupMemoryLengths;
  do
    validateArg(MTLArgumentTypeThreadgroupMemory, v9++, threadgroupMemoryLengths++);
  while (v9 != 31);
}

- (void)_validateThreadsPerThreadgroup:(id *)a3
{
  unint64_t v5 = a3->var1 * a3->var0 * a3->var2;
  if (!v5)
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v28 = *a3;
    uint64_t v35 = 0;
    MTLReportFailure();
    unint64_t v5 = a3->var1 * a3->var0 * a3->var2;
  }
  if (v5 > [(MTLToolsDevice *)self->super.super.super._device maxTotalComputeThreadsPerThreadgroup])
  {
    unint64_t var0 = a3->var0;
    unint64_t var1 = a3->var1;
    unint64_t var2 = a3->var2;
    unint64_t v36 = var1 * a3->var0 * var2;
    unint64_t v38 = [(MTLToolsDevice *)self->super.super.super._device maxTotalComputeThreadsPerThreadgroup];
    unint64_t v31 = var1;
    unint64_t v33 = var2;
    unint64_t v29 = var0;
    MTLReportFailure();
  }
  unint64_t v6 = a3->var1 * a3->var0 * a3->var2;
  if (v6 > [(MTLComputePipelineState *)self->_computePipelineState maxTotalThreadsPerThreadgroup])
  {
    unint64_t v18 = a3->var0;
    unint64_t v19 = a3->var1;
    unint64_t v20 = a3->var2;
    unint64_t v37 = v19 * a3->var0 * v20;
    uint64_t v39 = [(MTLComputePipelineState *)self->_computePipelineState maxTotalThreadsPerThreadgroup];
    unint64_t v32 = v19;
    unint64_t v34 = v20;
    unint64_t v30 = v18;
    MTLReportFailure();
  }
  unint64_t v7 = a3->var0;
  device = self->super.super.super._device;
  if (!device)
  {
    if (!v7)
    {
      unint64_t v10 = a3->var1;
      goto LABEL_15;
    }
    unint64_t v24 = a3->var0;
LABEL_33:
    unint64_t v25 = 0;
    unint64_t v40 = 0;
    unint64_t v41 = 0;
    unint64_t v42 = 0;
    goto LABEL_34;
  }
  [(MTLToolsDevice *)device maxThreadsPerThreadgroup];
  unint64_t v9 = self->super.super.super._device;
  if (v7 <= v40) {
    goto LABEL_9;
  }
  unint64_t v24 = a3->var0;
  if (!v9) {
    goto LABEL_33;
  }
  [(MTLToolsDevice *)v9 maxThreadsPerThreadgroup];
  unint64_t v25 = v40;
LABEL_34:
  unint64_t v30 = v24;
  unint64_t v32 = v25;
  MTLReportFailure();
  unint64_t v9 = self->super.super.super._device;
LABEL_9:
  unint64_t v10 = a3->var1;
  if (!v9)
  {
LABEL_15:
    if (!v10)
    {
      unint64_t v13 = 0;
      unint64_t v12 = a3->var2;
      goto LABEL_17;
    }
    unint64_t v26 = a3->var1;
LABEL_30:
    unint64_t v27 = 0;
    unint64_t v40 = 0;
    unint64_t v41 = 0;
    unint64_t v42 = 0;
    goto LABEL_31;
  }
  [(MTLToolsDevice *)v9 maxThreadsPerThreadgroup];
  unint64_t v11 = self->super.super.super._device;
  if (v10 <= v41) {
    goto LABEL_11;
  }
  unint64_t v26 = a3->var1;
  if (!v11) {
    goto LABEL_30;
  }
  [(MTLToolsDevice *)v11 maxThreadsPerThreadgroup];
  unint64_t v27 = v41;
LABEL_31:
  unint64_t v30 = v26;
  unint64_t v32 = v27;
  MTLReportFailure();
  unint64_t v11 = self->super.super.super._device;
LABEL_11:
  unint64_t v12 = a3->var2;
  if (v11)
  {
    [(MTLToolsDevice *)v11 maxThreadsPerThreadgroup];
    unint64_t v13 = v42;
  }
  else
  {
    unint64_t v13 = 0;
  }
LABEL_17:
  if (v12 > v13)
  {
    unint64_t v21 = a3->var2;
    BOOL v22 = self->super.super.super._device;
    if (v22)
    {
      [(MTLToolsDevice *)v22 maxThreadsPerThreadgroup];
      unint64_t v23 = v42;
    }
    else
    {
      unint64_t v23 = 0;
      unint64_t v40 = 0;
      unint64_t v41 = 0;
      unint64_t v42 = 0;
    }
    unint64_t v30 = v21;
    unint64_t v32 = v23;
    MTLReportFailure();
  }
  if (objc_msgSend((id)-[MTLComputePipelineState descriptor](self->_computePipelineState, "descriptor", v30, v32, v34, v37, v39, v40, v41, v42), "threadGroupSizeIsMultipleOfThreadExecutionWidth"))
  {
    unint64_t v14 = a3->var1 * a3->var0 * a3->var2;
    if (v14 % [(MTLComputePipelineState *)self->_computePipelineState threadExecutionWidth])
    {
      [(MTLComputePipelineState *)self->_computePipelineState threadExecutionWidth];
      MTLReportFailure();
    }
  }
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    if (self->hasEndEncoding) {
      MTLReportFailure();
    }
    if (!self->_computePipelineState) {
      MTLReportFailure();
    }
    if (HIDWORD(a3->var0))
    {
      unint64_t var0 = a3->var0;
      MTLReportFailure();
    }
    if (HIDWORD(a3->var1))
    {
      unint64_t var0 = a3->var1;
      MTLReportFailure();
    }
    unint64_t var2 = a3->var2;
    if (HIDWORD(var2))
    {
      unint64_t var0 = a3->var2;
      MTLReportFailure();
      unint64_t var2 = a3->var2;
    }
    if (!(a3->var1 * a3->var0 * var2))
    {
      unint64_t v25 = var2;
      uint64_t v26 = 0;
      unint64_t var0 = a3->var0;
      unint64_t var1 = a3->var1;
      MTLReportFailure();
    }
    long long v44 = *(_OWORD *)&a4->var0;
    unint64_t v45 = a4->var2;
    -[MTLDebugComputeCommandEncoder _validateThreadsPerThreadgroup:](self, "_validateThreadsPerThreadgroup:", &v44, var0, var1, v25, v26);
    computePipelineState = self->_computePipelineState;
    MTLSize v43 = (MTLSize)*a4;
    MTLSize v42 = (MTLSize)*a3;
    validateBuiltinArguments((MTLDebugComputePipelineState *)computePipelineState, &v43, &v42);
    unint64_t v7 = self->_computePipelineState;
    long long v40 = *(_OWORD *)&self->_imageBlockSize.width;
    unint64_t depth = self->_imageBlockSize.depth;
    uint64_t v28 = [(MTLComputePipelineState *)v7 imageblockMemoryLengthForDimensions:&v40];
    unint64_t v27 = (const char *)[(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] protectionOptions];
    device = self->super.super.super._device;
    uint64_t v9 = objc_msgSend((id)-[MTLComputePipelineState function](self->_computePipelineState, "function"), "name");
    unint64_t v10 = objc_msgSend((id)-[MTLComputePipelineState reflection](self->_computePipelineState, "reflection"), "arguments");
    [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
    [(MTLToolsDevice *)self->super.super.super._device maxComputeTextures];
    [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
    [(MTLToolsDevice *)self->super.super.super._device maxComputeLocalMemorySizes];
    validateComputeFunctionArguments(device, v9, v10, (uint64_t)self->_buffers, (uint64_t)self->_textures, (uint64_t)self->_samplers, v27, (uint64_t)self->_threadgroupMemoryLengths, [(MTLComputePipelineState *)self->_computePipelineState staticThreadgroupMemoryLength], v28, self->allowsNullBufferBinds);
  }
  uint64_t v39 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  unint64_t v11 = self->_computePipelineState;
  unint64_t v12 = [(MTLToolsObject *)self device];
  unint64_t v13 = [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
  uint64_t v14 = objc_msgSend((id)objc_msgSend((id)-[MTLComputePipelineState descriptor](v11, "descriptor"), "stageInputDescriptor"), "layouts");
  if (v13)
  {
    uint64_t v15 = (void *)v14;
    unint64_t v16 = 0;
    p_unint64_t bufferAttributeStride = &self->_buffers[0].bufferAttributeStride;
    do
    {
      if (*((unsigned char *)p_bufferAttributeStride - 48)
        && !*(p_bufferAttributeStride - 5)
        && objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", v16), "stride"))
      {
        if (objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", v16), "stride") != -1
          && *p_bufferAttributeStride != -1)
        {
          unint64_t var0 = *p_bufferAttributeStride;
          unint64_t var1 = v16;
          _MTLMessageContextPush_();
        }
        if (objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", v16, var0, var1), "stride") == -1
          && *p_bufferAttributeStride == -1)
        {
          unint64_t v23 = v16;
          _MTLMessageContextPush_();
        }
        if (objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", v16, v23), "stride") == -1) {
          uint64_t v18 = *p_bufferAttributeStride;
        }
        else {
          uint64_t v18 = objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", v16), "stride");
        }
        if (([(MTLDevice *)v12 supportsUnalignedVertexFetch] & 1) == 0
          && (unint64_t)(v18 + 1) >= 2
          && (v18 & 3) != 0)
        {
          unint64_t var0 = v18;
          unint64_t var1 = v16;
          _MTLMessageContextPush_();
        }
      }
      ++v16;
      p_bufferAttributeStride += 11;
    }
    while (v13 != v16);
  }
  _MTLMessageContextEnd();
  if (objc_msgSend((id)objc_msgSend((id)-[MTLComputePipelineState function](self->_computePipelineState, "function"), "stageInputAttributes"), "count"))
  {
    if (!self->hasSetStageInRegion && !self->hasIndirectSetStageInRegion) {
      MTLReportFailure();
    }
    if (!self->hasIndirectSetStageInRegion)
    {
      unint64_t v19 = a4->var2 * a3->var2;
      unint64_t v20 = a4->var1 * a3->var1;
      v35[0] = a4->var0 * a3->var0;
      v35[1] = v20;
      v35[2] = v19;
      [(MTLDebugComputeCommandEncoder *)self validateStageInRegion:v35];
    }
  }
  self->canSetComputePipelineState = 1;
  self->canEndEncoding = 1;
  self->_encodedVirtualSubstreamDispatch = 1;
  id v21 = [(MTLToolsObject *)self baseObject];
  long long v33 = *(_OWORD *)&a3->var0;
  unint64_t v34 = a3->var2;
  long long v31 = *(_OWORD *)&a4->var0;
  unint64_t v32 = a4->var2;
  [v21 dispatchThreadgroups:&v33 threadsPerThreadgroup:&v31];
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  if ((MTLReportFailureTypeEnabled() & 1) == 0 && !MTLReportFailureTypeEnabled()) {
    goto LABEL_15;
  }
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if (self->_computePipelineState)
  {
    if (a3) {
      goto LABEL_7;
    }
  }
  else
  {
    MTLReportFailure();
    if (a3)
    {
LABEL_7:
      if (([a3 conformsToProtocol:&unk_26EF82558] & 1) == 0) {
        MTLReportFailure();
      }
      device = self->super.super.super._device;
      if (device == (MTLToolsDevice *)[a3 device]) {
        goto LABEL_10;
      }
    }
  }
  MTLReportFailure();
LABEL_10:
  if (a4 + 12 > [a3 length])
  {
    unint64_t v16 = a4 + 12;
    uint64_t v17 = [a3 length];
    MTLReportFailure();
  }
  if ((a4 & 3) != 0)
  {
    unint64_t v16 = a4;
    MTLReportFailure();
  }
  long long v28 = *(_OWORD *)&a5->var0;
  unint64_t var2 = a5->var2;
  -[MTLDebugComputeCommandEncoder _validateThreadsPerThreadgroup:](self, "_validateThreadsPerThreadgroup:", &v28, v16, v17);
  computePipelineState = self->_computePipelineState;
  MTLSize v27 = (MTLSize)*a5;
  *(int64x2_t *)&v26.unint64_t width = vdupq_n_s64(1uLL);
  v26.unint64_t depth = 1;
  validateBuiltinArguments((MTLDebugComputePipelineState *)computePipelineState, &v27, &v26);
  unint64_t v11 = self->_computePipelineState;
  long long v24 = *(_OWORD *)&self->_imageBlockSize.width;
  unint64_t depth = self->_imageBlockSize.depth;
  uint64_t v21 = [(MTLComputePipelineState *)v11 imageblockMemoryLengthForDimensions:&v24];
  uint64_t v12 = [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] protectionOptions];
  unint64_t v19 = self->super.super.super._device;
  unint64_t v20 = (const char *)v12;
  uint64_t v18 = objc_msgSend((id)-[MTLComputePipelineState function](self->_computePipelineState, "function"), "name");
  unint64_t v13 = objc_msgSend((id)-[MTLComputePipelineState reflection](self->_computePipelineState, "reflection"), "arguments");
  [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
  [(MTLToolsDevice *)self->super.super.super._device maxComputeTextures];
  [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
  [(MTLToolsDevice *)self->super.super.super._device maxComputeLocalMemorySizes];
  validateComputeFunctionArguments(v19, v18, v13, (uint64_t)self->_buffers, (uint64_t)self->_textures, (uint64_t)self->_samplers, v20, (uint64_t)self->_threadgroupMemoryLengths, [(MTLComputePipelineState *)self->_computePipelineState staticThreadgroupMemoryLength], v21, self->allowsNullBufferBinds);
LABEL_15:
  self->canSetComputePipelineState = 1;
  self->canEndEncoding = 1;
  self->_encodedVirtualSubstreamDispatch = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  id v14 = [(MTLToolsObject *)self baseObject];
  uint64_t v15 = [a3 baseObject];
  long long v22 = *(_OWORD *)&a5->var0;
  unint64_t v23 = a5->var2;
  [v14 dispatchThreadgroupsWithIndirectBuffer:v15 indirectBufferOffset:a4 threadsPerThreadgroup:&v22];
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    [(MTLToolsObject *)self->super.super.super._device originalObject];
    MTLValidateFeatureSupport();
    if (self->hasEndEncoding) {
      MTLReportFailure();
    }
    if (!self->_computePipelineState) {
      MTLReportFailure();
    }
    if (HIDWORD(a3->var0))
    {
      unint64_t var0 = a3->var0;
      MTLReportFailure();
    }
    if (HIDWORD(a3->var1))
    {
      unint64_t var0 = a3->var1;
      MTLReportFailure();
    }
    unint64_t var2 = a3->var2;
    if (HIDWORD(var2))
    {
      unint64_t var0 = a3->var2;
      MTLReportFailure();
      unint64_t var2 = a3->var2;
    }
    if (!(a3->var1 * a3->var0 * var2))
    {
      unint64_t v18 = var2;
      uint64_t v19 = 0;
      unint64_t var0 = a3->var0;
      unint64_t var1 = a3->var1;
      MTLReportFailure();
    }
    long long v32 = *(_OWORD *)&a4->var0;
    unint64_t v33 = a4->var2;
    -[MTLDebugComputeCommandEncoder _validateThreadsPerThreadgroup:](self, "_validateThreadsPerThreadgroup:", &v32, var0, var1, v18, v19);
    unint64_t v8 = a3->var1;
    unint64_t v9 = a4->var1;
    NSUInteger v10 = (a3->var0 + a4->var0 - 1) / a4->var0;
    computePipelineState = self->_computePipelineState;
    MTLSize v31 = (MTLSize)*a4;
    v30.unint64_t width = v10;
    v30.height = (v8 + v9 - 1) / v9;
    v30.unint64_t depth = (a3->var2 + v31.depth - 1) / v31.depth;
    validateBuiltinArguments((MTLDebugComputePipelineState *)computePipelineState, &v31, &v30);
    uint64_t v12 = self->_computePipelineState;
    long long v28 = *(_OWORD *)&self->_imageBlockSize.width;
    unint64_t depth = self->_imageBlockSize.depth;
    uint64_t v23 = [(MTLComputePipelineState *)v12 imageblockMemoryLengthForDimensions:&v28];
    uint64_t v13 = [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] protectionOptions];
    device = self->super.super.super._device;
    long long v22 = (const char *)v13;
    uint64_t v20 = objc_msgSend((id)-[MTLComputePipelineState function](self->_computePipelineState, "function"), "name");
    id v14 = objc_msgSend((id)-[MTLComputePipelineState reflection](self->_computePipelineState, "reflection"), "arguments");
    [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
    [(MTLToolsDevice *)self->super.super.super._device maxComputeTextures];
    [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
    [(MTLToolsDevice *)self->super.super.super._device maxComputeLocalMemorySizes];
    validateComputeFunctionArguments(device, v20, v14, (uint64_t)self->_buffers, (uint64_t)self->_textures, (uint64_t)self->_samplers, v22, (uint64_t)self->_threadgroupMemoryLengths, [(MTLComputePipelineState *)self->_computePipelineState staticThreadgroupMemoryLength], v23, self->allowsNullBufferBinds);
  }
  self->canSetComputePipelineState = 1;
  self->canEndEncoding = 1;
  self->_encodedVirtualSubstreamDispatch = 1;
  id v15 = [(MTLToolsObject *)self baseObject];
  long long v26 = *(_OWORD *)&a3->var0;
  unint64_t v27 = a3->var2;
  long long v24 = *(_OWORD *)&a4->var0;
  unint64_t v25 = a4->var2;
  [v15 dispatchThreads:&v26 threadsPerThreadgroup:&v24];
}

- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  if ((MTLReportFailureTypeEnabled() & 1) == 0 && !MTLReportFailureTypeEnabled()) {
    goto LABEL_15;
  }
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if (self->_computePipelineState)
  {
    if (a3) {
      goto LABEL_7;
    }
  }
  else
  {
    MTLReportFailure();
    if (a3)
    {
LABEL_7:
      if (([a3 conformsToProtocol:&unk_26EF82558] & 1) == 0) {
        MTLReportFailure();
      }
      device = self->super.super.super._device;
      if (device == (MTLToolsDevice *)[a3 device]) {
        goto LABEL_10;
      }
    }
  }
  MTLReportFailure();
LABEL_10:
  if (a4 + 24 > [a3 length])
  {
    unint64_t v12 = a4 + 24;
    uint64_t v13 = [a3 length];
    MTLReportFailure();
  }
  if ((a4 & 3) != 0)
  {
    unint64_t v12 = a4;
    MTLReportFailure();
  }
  computePipelineState = self->_computePipelineState;
  long long v17 = *(_OWORD *)&self->_imageBlockSize.width;
  unint64_t depth = self->_imageBlockSize.depth;
  uint64_t v16 = -[MTLComputePipelineState imageblockMemoryLengthForDimensions:](computePipelineState, "imageblockMemoryLengthForDimensions:", &v17, v12, v13);
  uint64_t v9 = [(MTLToolsRetainingContainer *)[(MTLToolsCommandEncoder *)self commandBuffer] protectionOptions];
  id v14 = self->super.super.super._device;
  id v15 = (const char *)v9;
  uint64_t v10 = objc_msgSend((id)-[MTLComputePipelineState function](self->_computePipelineState, "function"), "name");
  unint64_t v11 = objc_msgSend((id)-[MTLComputePipelineState reflection](self->_computePipelineState, "reflection"), "arguments");
  [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
  [(MTLToolsDevice *)self->super.super.super._device maxComputeTextures];
  [(MTLToolsDevice *)self->super.super.super._device maxComputeSamplers];
  [(MTLToolsDevice *)self->super.super.super._device maxComputeLocalMemorySizes];
  validateComputeFunctionArguments(v14, v10, v11, (uint64_t)self->_buffers, (uint64_t)self->_textures, (uint64_t)self->_samplers, v15, (uint64_t)self->_threadgroupMemoryLengths, [(MTLComputePipelineState *)self->_computePipelineState staticThreadgroupMemoryLength], v16, self->allowsNullBufferBinds);
LABEL_15:
  self->canSetComputePipelineState = 1;
  self->canEndEncoding = 1;
  self->_encodedVirtualSubstreamDispatch = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "dispatchThreadsWithIndirectBuffer:indirectBufferOffset:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)updateFence:(id)a3
{
  id v5 = a3;
  std::deque<objc_object *>::push_back(&self->updatedFences.__map_.__first_, &v5);
  self->canEndEncoding = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:0];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateFence:", objc_msgSend(a3, "baseObject"));
}

- (void)waitForFence:(id)a3
{
  p_updatedFences = &self->updatedFences;
  unint64_t value = self->updatedFences.__size_.__value_;
  if (value)
  {
    uint64_t v7 = 0;
    unsigned int v8 = 1;
    do
    {
      if ((*(__end_ ***)((char *)p_updatedFences->__map_.var0
                        + (((p_updatedFences->__start_ + v7) >> 6) & 0x3FFFFFFFFFFFFF8)))[(p_updatedFences->__start_
                                                                                           + v7) & 0x1FF] == a3)
      {
        MTLReportFailure();
        unint64_t value = p_updatedFences->__size_.__value_;
      }
      uint64_t v7 = v8;
    }
    while (value > v8++);
  }
  self->canEndEncoding = 1;
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:0];
  id v10 = [(MTLToolsObject *)self baseObject];
  uint64_t v11 = [a3 baseObject];

  [v10 waitForFence:v11];
}

- (void)endEncoding_private
{
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if (!self->canEndEncoding) {
    MTLReportFailure();
  }
  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled()) {
    [(MTLDebugComputeCommandEncoder *)self _validateAllFunctionArguments];
  }
  [(MTLDebugComputeCommandEncoder *)self _setDefaults];
  self->canDealloc = 1;
  self->hasEndEncoding = 1;
}

- (void)endEncoding
{
  [(MTLDebugComputeCommandEncoder *)self endEncoding_private];
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 endEncoding];
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  [(MTLDebugComputeCommandEncoder *)self endEncoding_private];
  id v3 = [(MTLToolsObject *)self baseObject];

  return (id)[v3 endEncodingAndRetrieveProgramAddressTable];
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

- (void)enumerateBuffersUsingBlock:(id)a3
{
  buffers = self->_buffers;
  unint64_t v5 = [(MTLDevice *)[(MTLToolsObject *)self device] maxComputeBuffers];

  enumerateFunctionArgumentWithArray((uint64_t)buffers, v5, (uint64_t)a3);
}

- (void)enumerateTexturesUsingBlock:(id)a3
{
  textures = self->_textures;
  unint64_t v5 = [(MTLDevice *)[(MTLToolsObject *)self device] maxComputeTextures];

  enumerateFunctionArgumentWithArray((uint64_t)textures, v5, (uint64_t)a3);
}

- (void)enumerateSamplersUsingBlock:(id)a3
{
  samplers = self->_samplers;
  unint64_t v5 = [(MTLDevice *)[(MTLToolsObject *)self device] maxComputeSamplers];

  enumerateFunctionArgumentWithArray((uint64_t)samplers, v5, (uint64_t)a3);
}

- (void)enumerateThreadgroupMemoryLengthsUsingBlock:(id)a3
{
  threadgroupMemoryLengths = self->_threadgroupMemoryLengths;
  unint64_t v5 = [(MTLDevice *)[(MTLToolsObject *)self device] maxComputeLocalMemorySizes];

  enumerateFunctionArgumentWithArray((uint64_t)threadgroupMemoryLengths, v5, (uint64_t)a3);
}

- (void)validateFunctionTableUseResource:(id)a3 selectorName:(id)a4
{
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 stage] != 1)
  {
    MTLDebugStageToString([a3 stage]);
    MTLReportFailure();
  }
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  if (!a3) {
    MTLReportFailure();
  }
  if ([a3 storageMode] == 3) {
    MTLReportFailure();
  }
  if (a4 >= 8)
  {
    unint64_t v9 = a4;
    MTLReportFailure();
  }
  [(MTLDebugComputeCommandEncoder *)self validateFunctionTableUseResource:a3, @"useResource:usage:", v9 selectorName];
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  [v7 useResource:v8 usage:a4];
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  if (a5 >= 8)
  {
    unint64_t v13 = a5;
    MTLReportFailure();
  }
  std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
  if (a4)
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = (void *)a3[v9];
      if (!v10)
      {
        unint64_t v13 = v9;
        MTLReportFailure();
        uint64_t v10 = (void *)a3[v9];
      }
      if (objc_msgSend(v10, "storageMode", v13) == 3) {
        MTLReportFailure();
      }
      -[MTLDebugComputeCommandEncoder validateFunctionTableUseResource:selectorName:](self, "validateFunctionTableUseResource:selectorName:", a3[v9], objc_msgSend(NSString, "stringWithFormat:", @"useResources:count:usage: (index = %lu)", v9));
      uint64_t v11 = [(id)a3[v9] baseObject];
      *((void *)__p[0] + v9) = v11;
      [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3[v9++] retained:1 purgeable:1];
    }
    while (a4 != v9);
  }
  id v12 = [(MTLToolsObject *)self baseObject];
  [v12 useResources:__p[0] count:a4 usage:a5];
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
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
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
      uint64_t v8 = (void *)a3[v7];
      if (!v8)
      {
        uint64_t v11 = v7;
        MTLReportFailure();
        uint64_t v8 = (void *)a3[v7];
      }
      uint64_t v9 = objc_msgSend(v8, "baseObject", v11);
      *((void *)__p[0] + v7) = v9;
      [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3[v7++] retained:1 purgeable:1];
    }
    while (a4 != v7);
  }
  id v10 = [(MTLToolsObject *)self baseObject];
  [v10 useHeaps:__p[0] count:a4];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  if ([(MTLToolsDevice *)self->super.super.super._device supportsComputeMemoryBarrier])
  {
    if (a3 >= 4)
    {
      unint64_t v6 = a3;
      MTLReportFailure();
    }
    id v5 = [(MTLToolsObject *)self baseObject];
    [v5 memoryBarrierWithScope:a3];
  }
  else
  {
    MTLReportFailure();
  }
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
  if (!a3 || !a4) {
    MTLReportFailure();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device supportsComputeMemoryBarrier])
  {
    if (a3)
    {
      std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
      if (a4)
      {
        uint64_t v7 = 0;
        do
        {
          uint64_t v8 = (void *)a3[v7];
          if (!v8)
          {
            uint64_t v11 = v7;
            MTLReportFailure();
            uint64_t v8 = (void *)a3[v7];
          }
          uint64_t v9 = objc_msgSend(v8, "baseObject", v11);
          *((void *)__p[0] + v7++) = v9;
        }
        while (a4 != v7);
      }
      id v10 = [(MTLToolsObject *)self baseObject];
      [v10 memoryBarrierWithResources:__p[0] count:a4];
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
  }
  else
  {
    MTLReportFailure();
  }
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (self->_encodingVirtualSubstream) {
    MTLReportFailure();
  }
  v14.NSUInteger length = [a3 size];
  v13.NSUInteger location = location;
  v13.NSUInteger length = length;
  v14.NSUInteger location = 0;
  NSRange v8 = NSIntersectionRange(v13, v14);
  if (v8.location != location || v8.length != length)
  {
    NSUInteger v10 = length;
    uint64_t v11 = [a3 size];
    NSUInteger v9 = location;
    MTLReportFailure();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "descriptor", v9, v10, v11), "inheritPipelineState")
    && ([(MTLComputePipelineState *)[(MTLDebugComputeCommandEncoder *)self computePipelineState] supportIndirectCommandBuffers] & 1) == 0)
  {
    MTLReportFailure();
  }
  v12.receiver = self;
  v12.super_class = (Class)MTLDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder executeCommandsInBuffer:withRange:](&v12, sel_executeCommandsInBuffer_withRange_, a3, location, length);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  if (self->_encodingVirtualSubstream) {
    MTLReportFailure();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "descriptor"), "inheritPipelineState")
    && ([(MTLComputePipelineState *)[(MTLDebugComputeCommandEncoder *)self computePipelineState] supportIndirectCommandBuffers] & 1) == 0)
  {
    MTLReportFailure();
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugComputeCommandEncoder;
  [(MTLToolsComputeCommandEncoder *)&v9 executeCommandsInBuffer:a3 indirectBuffer:a4 indirectBufferOffset:a5];
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  BOOL v5 = a5;
  if ([(MTLToolsDevice *)self->super.super.super._device supportsCounterSampling:2])
  {
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    MTLReportFailure();
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (([a3 conformsToProtocol:&unk_26EF802D0] & 1) == 0) {
    MTLReportFailure();
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    MTLReportFailure();
  }
LABEL_7:
  if ([a3 sampleCount] <= a4)
  {
    unint64_t v12 = a4;
    uint64_t v13 = [a3 sampleCount];
    MTLReportFailure();
  }
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 0, v12, v13);
  id v10 = [(MTLToolsObject *)self baseObject];
  uint64_t v11 = [a3 baseObject];

  [v10 sampleCountersInBuffer:v11 atSampleIndex:a4 withBarrier:v5];
}

- (void)enableNullBufferBinds:(BOOL)a3
{
  BOOL v3 = a3;
  self->allowsNullBufferBinds = a3;
  [(MTLToolsObject *)self baseObject];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(MTLToolsObject *)self baseObject];
    [v5 enableNullBufferBinds:v3];
  }
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers] <= a4)
  {
    [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 1, @"Acceleration structure");
  buffers = self->_buffers;
  NSRange v8 = &self->_buffers[a4];
  validateArg(MTLArgumentTypePrimitiveAccelerationStructure, a4, v8);
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
  uint64_t v9 = [a3 size];
  if (MTLReportFailureTypeEnabled())
  {
    id v10 = &buffers[a4];
    v11.i64[0] = v10->type;
    v11.i64[1] = v10->var0;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v11, (int64x2_t)xmmword_23BE4AC70), (int32x4_t)vceqq_s64(*(int64x2_t *)&v10->bufferLength, (int64x2_t)(unint64_t)v9))))) & 1) == 0&& v10->bufferAttributeStride == -1&& *(_OWORD *)&v10->threadgroupMemoryLength == 0&& v10->object == a3&& a3&& !*(void *)&v10->lodMinClamp&& !v10->hasLodClamp)
    {
      MTLReportFailure();
    }
  }
  v8->isValid = v9 != 0;
  v8->hasBeenUsed = 0;
  v8->unint64_t type = 4;
  v8->id object = (baseLevel *)a3;
  v8->unint64_t var0 = 0;
  v8->bufferLength = v9;
  *(_OWORD *)&v8->bufferOffset = xmmword_23BE4AC80;
  v8->threadgroupMemoryLength = 0;
  v8->threadgroupMemoryOffset = 0;
  v8->BOOL hasLodClamp = 0;
  v8->lodMinClamp = 0.0;
  v8->lodMaxClamp = 0.0;
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers] <= a4)
  {
    unint64_t v13 = a4;
    unint64_t v14 = [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
    MTLReportFailure();
  }
  if (objc_msgSend((id)-[MTLDevice baseObject](-[MTLToolsObject device](self, "device", v13, v14), "baseObject"), "supportsFunctionPointers"))
  {
    if (!a3) {
      goto LABEL_11;
    }
  }
  else
  {
    MTLReportFailure();
    if (!a3) {
      goto LABEL_11;
    }
  }
  if (([a3 conformsToProtocol:&unk_26EF85818] & 1) == 0) {
    MTLReportFailure();
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    MTLReportFailure();
  }
LABEL_11:
  buffers = self->_buffers;
  uint64_t v9 = &self->_buffers[a4];
  validateArg(MTLArgumentTypeVisibleFunctionTable, a4, v9);
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
  uint64_t v10 = [a3 functionCount];
  if (MTLReportFailureTypeEnabled())
  {
    int64x2_t v11 = &buffers[a4];
    v12.i64[0] = v11->type;
    v12.i64[1] = v11->var0;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v12, (int64x2_t)xmmword_23BE4AC90), (int32x4_t)vceqq_s64(*(int64x2_t *)&v11->bufferLength, (int64x2_t)(unint64_t)v10))))) & 1) == 0&& v11->bufferAttributeStride == -1&& *(_OWORD *)&v11->threadgroupMemoryLength == 0&& v11->object == a3&& a3&& !*(void *)&v11->lodMinClamp&& !v11->hasLodClamp)
    {
      MTLReportFailure();
    }
  }
  v9->isValid = v10 != 0;
  v9->hasBeenUsed = 0;
  v9->unint64_t type = 5;
  v9->id object = (baseLevel *)a3;
  v9->unint64_t var0 = 0;
  v9->bufferLength = v10;
  *(_OWORD *)&v9->bufferOffset = xmmword_23BE4AC80;
  v9->threadgroupMemoryLength = 0;
  v9->threadgroupMemoryOffset = 0;
  v9->BOOL hasLodClamp = 0;
  v9->lodMinClamp = 0.0;
  v9->lodMaxClamp = 0.0;
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v24[31] = *MEMORY[0x263EF8340];
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if (location + length > [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers])
  {
    NSUInteger v21 = location + length;
    unint64_t v23 = [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
    MTLReportFailure();
  }
  if (objc_msgSend((id)-[MTLDevice baseObject](-[MTLToolsObject device](self, "device", v21, v23), "baseObject"), "supportsFunctionPointers"))
  {
    if (!length) {
      goto LABEL_35;
    }
  }
  else
  {
    MTLReportFailure();
    if (!length) {
      goto LABEL_35;
    }
  }
  NSRange v8 = 0;
  uint64_t v9 = &self->super.super._commandBuffer + 11 * location;
  do
  {
    uint64_t v10 = (void *)a3[(void)v8];
    if (v10)
    {
      if (([v10 conformsToProtocol:&unk_26EF85818] & 1) == 0)
      {
        long long v22 = v8;
        MTLReportFailure();
      }
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v8], "device", v22))
      {
        long long v22 = v8;
        MTLReportFailure();
      }
    }
    int64x2_t v12 = v9 + 6;
    validateArg(MTLArgumentTypeVisibleFunctionTable, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 1));
    [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3[(void)v8] retained:1 purgeable:1];
    v24[(void)v8] = [(id)a3[(void)v8] baseObject];
    unint64_t v13 = (MTLToolsRetainingContainer *)a3[(void)v8];
    uint64_t v14 = [(MTLToolsRetainingContainer *)v13 functionCount];
    if (MTLReportFailureTypeEnabled())
    {
      v15.i64[0] = (uint64_t)v9[2];
      v15.i64[1] = (uint64_t)v9[4];
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v15, (int64x2_t)xmmword_23BE4AC90), (int32x4_t)vceqq_s64(*(int64x2_t *)(v9 + 5), (int64x2_t)(unint64_t)v14))))) & 1) == 0&& v9[7] == (MTLToolsRetainingContainer *)-1&& *((_OWORD *)v9 + 4) == 0&& v9[3] == v13&& v13 != 0&& *(MTLToolsRetainingContainer **)((char *)v9 + 84) == 0&& *((unsigned char *)v9 + 80) == 0)
      {
        long long v22 = v13;
        MTLReportFailure();
      }
    }
    *((unsigned char *)v9 + 8) = v14 != 0;
    *((unsigned char *)v9 + 9) = 0;
    v9[2] = (MTLToolsRetainingContainer *)5;
    v9[3] = v13;
    v9[4] = 0;
    v9[5] = (MTLToolsRetainingContainer *)v14;
    *(_OWORD *)int64x2_t v12 = xmmword_23BE4AC80;
    v9[8] = 0;
    v9[9] = 0;
    *((unsigned char *)v9 + 80) = 0;
    NSRange v8 = (MTLToolsRetainingContainer *)((char *)v8 + 1);
    v9 += 11;
    *((_DWORD *)v12 + 9) = 0;
    *((_DWORD *)v12 + 10) = 0;
  }
  while ((MTLToolsRetainingContainer *)length != v8);
LABEL_35:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setVisibleFunctionTables:withBufferRange:", v24, location, length);
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if ([(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers] <= a4)
  {
    unint64_t v13 = a4;
    unint64_t v14 = [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
    MTLReportFailure();
    if (!a3) {
      goto LABEL_9;
    }
  }
  else if (!a3)
  {
    goto LABEL_9;
  }
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_26EF9B378, v13, v14) & 1) == 0) {
    MTLReportFailure();
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)[a3 device]) {
    MTLReportFailure();
  }
LABEL_9:
  buffers = self->_buffers;
  uint64_t v9 = &self->_buffers[a4];
  validateArg(MTLArgumentTypeIntersectionFunctionTable, a4, v9);
  [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3 retained:1 purgeable:1];
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
  uint64_t v10 = [a3 functionCount];
  if (MTLReportFailureTypeEnabled())
  {
    int64x2_t v11 = &buffers[a4];
    v12.i64[0] = v11->type;
    v12.i64[1] = v11->var0;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v12, (int64x2_t)xmmword_23BE4ACA0), (int32x4_t)vceqq_s64(*(int64x2_t *)&v11->bufferLength, (int64x2_t)(unint64_t)v10))))) & 1) == 0&& v11->bufferAttributeStride == -1&& *(_OWORD *)&v11->threadgroupMemoryLength == 0&& v11->object == a3&& a3&& !*(void *)&v11->lodMinClamp&& !v11->hasLodClamp)
    {
      MTLReportFailure();
    }
  }
  v9->isValid = v10 != 0;
  v9->hasBeenUsed = 0;
  v9->unint64_t type = 6;
  v9->id object = (baseLevel *)a3;
  v9->unint64_t var0 = 0;
  v9->bufferLength = v10;
  *(_OWORD *)&v9->bufferOffset = xmmword_23BE4AC80;
  v9->threadgroupMemoryLength = 0;
  v9->threadgroupMemoryOffset = 0;
  v9->BOOL hasLodClamp = 0;
  v9->lodMinClamp = 0.0;
  v9->lodMaxClamp = 0.0;
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v23[31] = *MEMORY[0x263EF8340];
  if (self->hasEndEncoding) {
    MTLReportFailure();
  }
  if (location + length > [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers])
  {
    NSUInteger v21 = (MTLToolsRetainingContainer *)(location + length);
    unint64_t v22 = [(MTLToolsDevice *)self->super.super.super._device maxComputeBuffers];
    MTLReportFailure();
    if (!length) {
      goto LABEL_33;
    }
  }
  else if (!length)
  {
    goto LABEL_33;
  }
  NSRange v8 = 0;
  uint64_t v9 = &self->super.super._commandBuffer + 11 * location;
  do
  {
    uint64_t v10 = (void *)a3[(void)v8];
    if (v10)
    {
      if (([v10 conformsToProtocol:&unk_26EF9B378] & 1) == 0)
      {
        NSUInteger v21 = v8;
        MTLReportFailure();
      }
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(void)v8], "device", v21, v22))
      {
        NSUInteger v21 = v8;
        MTLReportFailure();
      }
    }
    int64x2_t v12 = v9 + 6;
    validateArg(MTLArgumentTypeIntersectionFunctionTable, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 1));
    [(MTLDebugCommandBuffer *)self->_commandBuffer addObject:a3[(void)v8] retained:1 purgeable:1];
    v23[(void)v8] = [(id)a3[(void)v8] baseObject];
    unint64_t v13 = (MTLToolsRetainingContainer *)a3[(void)v8];
    uint64_t v14 = [(MTLToolsRetainingContainer *)v13 functionCount];
    if (MTLReportFailureTypeEnabled())
    {
      v15.i64[0] = (uint64_t)v9[2];
      v15.i64[1] = (uint64_t)v9[4];
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v15, (int64x2_t)xmmword_23BE4ACA0), (int32x4_t)vceqq_s64(*(int64x2_t *)(v9 + 5), (int64x2_t)(unint64_t)v14))))) & 1) == 0&& v9[7] == (MTLToolsRetainingContainer *)-1&& *((_OWORD *)v9 + 4) == 0&& v9[3] == v13&& v13 != 0&& *(MTLToolsRetainingContainer **)((char *)v9 + 84) == 0&& *((unsigned char *)v9 + 80) == 0)
      {
        NSUInteger v21 = v13;
        MTLReportFailure();
      }
    }
    *((unsigned char *)v9 + 8) = v14 != 0;
    *((unsigned char *)v9 + 9) = 0;
    v9[2] = (MTLToolsRetainingContainer *)6;
    v9[3] = v13;
    v9[4] = 0;
    v9[5] = (MTLToolsRetainingContainer *)v14;
    *(_OWORD *)int64x2_t v12 = xmmword_23BE4AC80;
    v9[8] = 0;
    v9[9] = 0;
    *((unsigned char *)v9 + 80) = 0;
    NSRange v8 = (MTLToolsRetainingContainer *)((char *)v8 + 1);
    v9 += 11;
    *((_DWORD *)v12 + 9) = 0;
    *((_DWORD *)v12 + 10) = 0;
  }
  while ((MTLToolsRetainingContainer *)length != v8);
LABEL_33:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v21), "setIntersectionFunctionTables:withBufferRange:", v23, location, length);
}

- (void)setSubstream:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int numSubstreams = self->_numSubstreams;
  if (!numSubstreams)
  {
    MTLReportFailure();
    unsigned int numSubstreams = self->_numSubstreams;
  }
  if (numSubstreams <= v3) {
    MTLReportFailure();
  }
  if (self->_encodingVirtualSubstream && self->_encodedVirtualSubstreamDispatch) {
    MTLReportFailure();
  }
  self->_activeSubstream = v3;
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setSubstream:v3];
}

- (void)signalProgress:(unsigned int)a3
{
  unsigned int v14 = a3;
  if (!self->_numSubstreams) {
    MTLReportFailure();
  }
  if (self->_encodingVirtualSubstream) {
    MTLReportFailure();
  }
  if (self->_progressLabels.__tree_.__pair3_.__value_)
  {
    p_pair1 = &self->_progressLabels.__tree_.__pair1_;
    left = self->_progressLabels.__tree_.__pair1_.__value_.__left_;
    if (left)
    {
      uint64_t v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> **)self->_progressLabels.__tree_.__pair1_.__value_.__left_;
      do
      {
        NSRange v8 = v7;
        uint64_t v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> **)v7[1];
      }
      while (v7);
    }
    else
    {
      uint64_t v9 = &self->_progressLabels.__tree_.__pair1_;
      do
      {
        NSRange v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> **)v9[2].__value_.__left_;
        BOOL v10 = *v8 == v9;
        uint64_t v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> *)v8;
      }
      while (v10);
    }
    if (*((_DWORD *)v8 + 7) >= a3)
    {
      if (left)
      {
        int64x2_t v12 = self->_progressLabels.__tree_.__pair1_.__value_.__left_;
        do
          int64x2_t v12 = (void *)v12[1];
        while (v12);
      }
      else
      {
        unint64_t v13 = &self->_progressLabels.__tree_.__pair1_;
        do
        {
          BOOL v10 = *(void *)v13[2].__value_.__left_ == (void)v13;
          unint64_t v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> *)v13[2].__value_.__left_;
        }
        while (v10);
      }
      if (left)
      {
        do
          left = (void *)left[1];
        while (left);
      }
      else
      {
        do
        {
          BOOL v10 = *(void *)p_pair1[2].__value_.__left_ == (void)p_pair1;
          p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> *)p_pair1[2].__value_.__left_;
        }
        while (v10);
      }
      MTLReportFailure();
    }
  }
  std::__tree<unsigned int>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t **)&self->_progressLabels, &v14, &v14);
  id v11 = [(MTLToolsObject *)self baseObject];
  [v11 signalProgress:v14];
}

- (void)waitForProgress:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!self->_numSubstreams) {
    MTLReportFailure();
  }
  left = (char *)self->_progressLabels.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_14;
  }
  p_pair1 = &self->_progressLabels.__tree_.__pair1_;
  do
  {
    unsigned int v7 = *((_DWORD *)left + 7);
    BOOL v8 = v7 >= v3;
    if (v7 >= v3) {
      uint64_t v9 = (char **)left;
    }
    else {
      uint64_t v9 = (char **)(left + 8);
    }
    if (v8) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> *)left;
    }
    left = *v9;
  }
  while (*v9);
  if (p_pair1 == &self->_progressLabels.__tree_.__pair1_ || HIDWORD(p_pair1[3].__value_.__left_) > v3)
  {
LABEL_14:
    uint64_t v11 = v3;
    uint64_t v12 = v3;
    MTLReportFailure();
  }
  if (self->_encodingVirtualSubstream) {
    MTLReportFailure();
  }
  id v10 = [(MTLToolsObject *)self baseObject];

  [v10 waitForProgress:v3];
}

- (void)beginVirtualSubstream
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  if (self->_encodingVirtualSubstream) {
    MTLReportFailure();
  }
  self->_encodingVirtualSubstream = 1;
  self->_currentVirtualSubstreamIndex = 0;
  self->_encodedVirtualSubstreamDispatch = 0;
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 beginVirtualSubstream];
}

- (unint64_t)nextVirtualSubstream
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  if (!self->_encodingVirtualSubstream) {
    MTLReportFailure();
  }
  ++self->_currentVirtualSubstreamIndex;
  self->_encodedVirtualSubstreamDispatch = 0;
  id v3 = [(MTLToolsObject *)self baseObject];

  return [v3 nextVirtualSubstream];
}

- (void)endVirtualSubstream
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  if (!self->_encodingVirtualSubstream) {
    MTLReportFailure();
  }
  self->_encodingVirtualSubstream = 0;
  id v3 = [(MTLToolsObject *)self baseObject];

  [v3 endVirtualSubstream];
}

- (void)waitForVirtualSubstream:(unint64_t)a3
{
  [(MTLToolsObject *)self->super.super.super._device originalObject];
  MTLValidateFeatureSupport();
  if (!self->_encodingVirtualSubstream) {
    MTLReportFailure();
  }
  if (self->_encodedVirtualSubstreamDispatch) {
    MTLReportFailure();
  }
  if (self->_currentVirtualSubstreamIndex <= a3)
  {
    unint64_t v6 = a3;
    uint64_t currentVirtualSubstreamIndex = self->_currentVirtualSubstreamIndex;
    MTLReportFailure();
  }
  id v5 = [(MTLToolsObject *)self baseObject];

  [v5 waitForVirtualSubstream:a3];
}

- (void)useResidencySet:(id)a3
{
  if (!a3) {
    MTLReportFailure();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugComputeCommandEncoder;
  [(MTLToolsComputeCommandEncoder *)&v5 useResidencySet:a3];
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
  v9.super_class = (Class)MTLDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder useResidencySets:count:](&v9, sel_useResidencySets_count_, a3, a4, v8);
}

- (MTLComputePipelineState)computePipelineState
{
  return self->_computePipelineState;
}

- (void).cxx_destruct
{
  std::__tree<unsigned int>::destroy((uint64_t)&self->_progressLabels, (void *)self->_progressLabels.__tree_.__pair1_.__value_.__left_);

  std::deque<objc_object *>::~deque[abi:ne180100](&self->updatedFences.__map_.__first_);
}

- (id).cxx_construct
{
  uint64_t v2 = 48;
  uint64_t v3 = 31;
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
  uint64_t v5 = 2776;
  uint64_t v6 = 128;
  do
  {
    unsigned int v7 = (char *)self + v5;
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
  uint64_t v8 = 14040;
  uint64_t v9 = 16;
  do
  {
    id v10 = (char *)self + v8;
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
  uint64_t v11 = 15448;
  uint64_t v12 = 31;
  do
  {
    unint64_t v13 = (char *)self + v11;
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
  *((_OWORD *)self + 1142) = 0u;
  *((_OWORD *)self + 1143) = 0u;
  *((_OWORD *)self + 1144) = 0u;
  *((void *)self + 2293) = 0;
  *((void *)self + 2292) = 0;
  *((void *)self + 2291) = (char *)self + 18336;
  return self;
}

@end