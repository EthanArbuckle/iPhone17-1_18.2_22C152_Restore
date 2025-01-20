@interface MTLLegacySVAccelerationStructureCommandEncoder
- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4;
- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4;
- (MTLLegacySVAccelerationStructureCommandEncoder)initWithAccelerationStructureCommandEncoder:(id)a3 parent:(id)a4 accelerationStructurePassDescriptor:(id)a5;
- (id).cxx_construct;
- (id)createChildrenWrappersBufferWithASDescriptor:(id)a3;
- (id)createChildrenWrappersBufferWithIASDescriptor:(id)a3;
- (id)createChildrenWrappersBufferWithIndirectIASDescriptor:(id)a3;
- (id)createChildrenWrappersBufferWithInstanceDescriptorBuffer:(id)a3 maxInstanceCount:(unint64_t)a4 instanceCountBuffer:(id)a5 instanceCountBufferOffset:(unint64_t)a6 instanceDescriptorStride:(unint64_t)a7 instanceDescriptorBufferOffset:(unint64_t)a8 instanceDescriptorType:(unint64_t)a9 accelerationStructureIDs:(id)a10;
- (id)encodeUnwrapAccelerationStructureDescriptor:(id)a3;
- (id)psoWithFunctionName:(id)a3;
- (void)blitAccelerationStructureType:(unint64_t)a3 toAccelerationStructure:(id)a4;
- (void)blitChildrenWrappersBufferAddress:(id)a3 toAccelerationStructure:(id)a4;
- (void)blitChildrenWrappersBufferFromAcceleratrionStructure:(id)a3 toAccelerationStructure:(id)a4;
- (void)blitInstanceTypetoAccelerationStructure:(id)a3;
- (void)blitPrimitiveTypetoAccelerationStructure:(id)a3;
- (void)blitTypeFromAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4;
- (void)blitTypeFromAccelerationStructureDescriptor:(id)a3 toAccelerationStructure:(id)a4;
- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6;
- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4;
- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4;
- (void)dealloc;
- (void)deserializeAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)deserializeAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6;
- (void)destroyBaseAccelerationStructureCommandEncoder;
- (void)endEncoding;
- (void)newBaseAccelerationStructureCommandEncoder;
- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7;
- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)serializeAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)useHeap:(id)a3;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)writeAccelerationStructureSerializationData:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5;
- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5;
- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6;
- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6;
- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6;
- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15;
- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5;
- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5;
- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5;
- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5;
@end

@implementation MTLLegacySVAccelerationStructureCommandEncoder

- (MTLLegacySVAccelerationStructureCommandEncoder)initWithAccelerationStructureCommandEncoder:(id)a3 parent:(id)a4 accelerationStructurePassDescriptor:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  v6 = [(MTLToolsCommandEncoder *)&v8 initWithBaseObject:a3 parent:a4];
  if (v6)
  {
    v6->_accelerationStructurePassDescriptor = (MTLAccelerationStructurePassDescriptor *)[a5 copy];
    v6->_accelerationStructureSupportLibrary = (MTLLibrary *)-[MTLDevice newLibraryWithURL:error:](-[MTLToolsObject device](v6->super.super.super._parent, "device"), "newLibraryWithURL:error:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.gpusw.MetalTools"), "URLForResource:withExtension:", @"MTLLegacySVAccelerationStructureSupport", @"metallib"), 0);
  }
  return v6;
}

- (void)endEncoding
{
  std::__list_imp<objc_object  {objcproto9MTLBuffer}*>::clear(&self->_LegacySVResourceAndUsageList.__end_.__prev_);
  std::__list_imp<objc_object  {objcproto9MTLBuffer}*>::clear(&self->_heapList.__end_.__prev_);

  [(MTLLegacySVAccelerationStructureCommandEncoder *)self destroyBaseAccelerationStructureCommandEncoder];
}

- (void)newBaseAccelerationStructureCommandEncoder
{
  id v3 = [(MTLToolsObject *)self->super.super.super._parent baseObject];
  if (self->_accelerationStructurePassDescriptor) {
    uint64_t v4 = objc_msgSend(v3, "accelerationStructureCommandEncoderWithDescriptor:");
  }
  else {
    uint64_t v4 = [v3 accelerationStructureCommandEncoder];
  }
  [(MTLToolsObject *)self setBaseObject:v4];
  [(MTLToolsObject *)self baseObject];
  for (i = (MTLLegacySVAccelerationStructureCommandEncoder *)self->_LegacySVResourceAndUsageList.__end_.__next_;
        i != (MTLLegacySVAccelerationStructureCommandEncoder *)&self->_LegacySVResourceAndUsageList;
        i = (MTLLegacySVAccelerationStructureCommandEncoder *)i->super.super.super._parent)
  {
    baseObject = i->super.super.super._baseObject;
    device = i->super.super.super._device;
    v11.receiver = self;
    v11.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
    [(MTLToolsAccelerationStructureCommandEncoder *)&v11 useResource:baseObject usage:device];
  }
  for (j = (MTLLegacySVAccelerationStructureCommandEncoder *)self->_heapList.__end_.__next_;
        j != (MTLLegacySVAccelerationStructureCommandEncoder *)&self->_heapList;
        j = (MTLLegacySVAccelerationStructureCommandEncoder *)j->super.super.super._parent)
  {
    v9 = j->super.super.super._baseObject;
    v10.receiver = self;
    v10.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
    [(MTLToolsAccelerationStructureCommandEncoder *)&v10 useHeap:v9];
  }
}

- (void)destroyBaseAccelerationStructureCommandEncoder
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");

  [(MTLToolsObject *)self setBaseObject:0];
}

- (void)blitAccelerationStructureType:(unint64_t)a3 toAccelerationStructure:(id)a4
{
  v7 = (void *)[(MTLToolsObject *)self->super.super.super._parent blitCommandEncoder];
  id v8 = (id)[(MTLDevice *)[(MTLToolsObject *)self->super.super.super._parent device] newInternalBufferWithLength:8 options:0];
  *(void *)[v8 contents] = a3;
  objc_msgSend(v7, "copyFromInternalBuffer:sourceOffset:toInternalBuffer:destinationOffset:size:", v8, 0, objc_msgSend(a4, "debugBuf"), 16, 8);
  [v7 endEncoding];
}

- (void)blitPrimitiveTypetoAccelerationStructure:(id)a3
{
}

- (void)blitInstanceTypetoAccelerationStructure:(id)a3
{
}

- (void)blitTypeFromAccelerationStructureDescriptor:(id)a3 toAccelerationStructure:(id)a4
{
  uint64_t v6 = MTLLegacySVAccelerationStructureTypeFromDescriptor((MTLAccelerationStructureDescriptor *)a3);

  [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitAccelerationStructureType:v6 toAccelerationStructure:a4];
}

- (void)blitTypeFromAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  uint64_t v6 = (void *)[(MTLToolsObject *)self->super.super.super._parent blitCommandEncoder];
  objc_msgSend(v6, "copyFromInternalBuffer:sourceOffset:toInternalBuffer:destinationOffset:size:", objc_msgSend(a3, "debugBuf"), 16, objc_msgSend(a4, "debugBuf"), 16, 8);

  [v6 endEncoding];
}

- (id)psoWithFunctionName:(id)a3
{
  v5 = [(MTLToolsObject *)self->super.super.super._parent device];
  uint64_t v6 = (void *)[(MTLLibrary *)self->_accelerationStructureSupportLibrary newFunctionWithName:a3];
  v7 = objc_opt_new();
  [v7 setComputeFunction:v6];

  id v8 = (void *)[(MTLDevice *)v5 newComputePipelineStateWithDescriptor:v7 options:0 reflection:0 error:0];
  return v8;
}

- (id)encodeUnwrapAccelerationStructureDescriptor:(id)a3
{
  v5 = objc_opt_class();
  if ([v5 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v6 = [(MTLToolsObject *)self->super.super.super._parent device];
    v7 = (void *)[a3 copy];
    id v8 = (void *)-[MTLDevice newBufferWithLength:options:](v6, "newBufferWithLength:options:", objc_msgSend((id)objc_msgSend(a3, "instanceDescriptorBuffer"), "length"), objc_msgSend((id)objc_msgSend(a3, "instanceDescriptorBuffer"), "resourceOptions"));
    [v7 setInstanceDescriptorBuffer:v8];

    v9 = (void *)[(MTLToolsObject *)self->super.super.super._parent blitCommandEncoder];
    uint64_t v10 = [a3 instanceDescriptorBufferOffset];
    objc_msgSend(v9, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", objc_msgSend(a3, "instanceDescriptorBuffer"), v10, objc_msgSend(v7, "instanceDescriptorBuffer"), v10, objc_msgSend(a3, "maxInstanceCount") * objc_msgSend(a3, "instanceDescriptorStride"));
    [v9 endEncoding];
    id v11 = [(MTLLegacySVAccelerationStructureCommandEncoder *)self psoWithFunctionName:@"unwrap_acceleration_structure_descriptor_buffer"];
    v12 = (void *)[(MTLToolsObject *)self->super.super.super._parent computeCommandEncoder];
    p_LegacySVResourceAndUsageList = &self->_LegacySVResourceAndUsageList;
    for (i = (list<LegacySVResourceAndUsage, std::allocator<LegacySVResourceAndUsage>> *)p_LegacySVResourceAndUsageList->__end_.__next_;
          i != p_LegacySVResourceAndUsageList;
          i = (list<LegacySVResourceAndUsage, std::allocator<LegacySVResourceAndUsage>> *)i->__end_.__next_)
    {
      [v12 useResource:i->__size_alloc_.__value_ usage:i[1].__end_.__prev_];
    }
    uint64_t v23 = 0;
    uint64_t v24 = [a3 instanceDescriptorStride];
    uint64_t v15 = [a3 instanceDescriptorType];
    if (v15 == 3)
    {
      uint64_t v16 = 64;
    }
    else
    {
      if (v15 != 4)
      {
LABEL_10:
        unint64_t v22 = [a3 maxInstanceCount];
        [v12 setComputePipelineState:v11];
        objc_msgSend(v12, "setBuffer:offset:atIndex:", objc_msgSend(a3, "instanceDescriptorBuffer"), objc_msgSend(a3, "instanceDescriptorBufferOffset"), 0);
        objc_msgSend(v12, "setBuffer:offset:atIndex:", objc_msgSend(v7, "instanceDescriptorBuffer"), objc_msgSend(v7, "instanceDescriptorBufferOffset"), 1);
        [v12 setBytes:&v24 length:8 atIndex:2];
        [v12 setBytes:&v23 length:8 atIndex:3];
        [v12 setBytes:&v22 length:8 atIndex:4];
        unint64_t v20 = vcvtpd_u64_f64((double)v22 / (double)(unint64_t)[v11 maxTotalThreadsPerThreadgroup]);
        int64x2_t v21 = vdupq_n_s64(1uLL);
        uint64_t v18 = [v11 maxTotalThreadsPerThreadgroup];
        int64x2_t v19 = v21;
        [v12 dispatchThreadgroups:&v20 threadsPerThreadgroup:&v18];
        [v12 endEncoding];

        return v7;
      }
      uint64_t v16 = 16;
    }
    uint64_t v23 = v16;
    goto LABEL_10;
  }
  return a3;
}

- (id)createChildrenWrappersBufferWithInstanceDescriptorBuffer:(id)a3 maxInstanceCount:(unint64_t)a4 instanceCountBuffer:(id)a5 instanceCountBufferOffset:(unint64_t)a6 instanceDescriptorStride:(unint64_t)a7 instanceDescriptorBufferOffset:(unint64_t)a8 instanceDescriptorType:(unint64_t)a9 accelerationStructureIDs:(id)a10
{
  uint64_t v16 = [(MTLToolsObject *)self->super.super.super._parent device];
  v17 = (void *)[(MTLToolsObject *)self->super.super.super._parent computeCommandEncoder];
  uint64_t v18 = (void *)[(MTLDevice *)v16 newBufferWithLength:8 * a4 options:0];
  uint64_t v29 = 0;
  unint64_t v30 = a7;
  switch(a9)
  {
    case 0uLL:
    case 1uLL:
      uint64_t v19 = 60;
      goto LABEL_5;
    case 2uLL:
      uint64_t v19 = 12;
LABEL_5:
      uint64_t v29 = v19;
      unint64_t v20 = @"create_children_wrappers_buffer";
      break;
    case 3uLL:
      uint64_t v21 = 64;
      goto LABEL_8;
    case 4uLL:
      uint64_t v21 = 16;
LABEL_8:
      uint64_t v29 = v21;
      unint64_t v20 = @"create_children_wrappers_buffer_from_indirect_descriptor";
      break;
    default:
      unint64_t v20 = 0;
      break;
  }
  id v22 = [(MTLLegacySVAccelerationStructureCommandEncoder *)self psoWithFunctionName:v20];
  [v17 setComputePipelineState:v22];
  [v17 setBuffer:a3 offset:a8 atIndex:0];
  [v17 setBuffer:v18 offset:0 atIndex:1];
  if (a10) {
    [v17 setBuffer:a10 offset:0 atIndex:2];
  }
  [v17 setBytes:&v30 length:8 atIndex:3];
  [v17 setBytes:&v29 length:8 atIndex:4];
  [v17 setBuffer:a5 offset:a6 atIndex:5];
  unint64_t v27 = vcvtpd_u64_f64((double)a4 / (double)(unint64_t)[v22 maxTotalThreadsPerThreadgroup]);
  int64x2_t v28 = vdupq_n_s64(1uLL);
  uint64_t v25 = [v22 maxTotalThreadsPerThreadgroup];
  int64x2_t v26 = v28;
  [v17 dispatchThreadgroups:&v27 threadsPerThreadgroup:&v25];
  [v17 endEncoding];

  return v18;
}

- (id)createChildrenWrappersBufferWithIASDescriptor:(id)a3
{
  v5 = [(MTLToolsObject *)self->super.super.super._parent device];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "instancedAccelerationStructures"), "count");
  v7 = (void *)[(MTLDevice *)v5 newBufferWithLength:8 * v6 options:0];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "instancedAccelerationStructures"), "objectAtIndexedSubscript:", i), "gpuResourceID");
      *(void *)([v7 contents] + 8 * i) = v9;
    }
  }
  uint64_t v14 = [a3 instanceCount];
  uint64_t v10 = (void *)[(MTLDevice *)v5 newBufferWithBytes:&v14 length:8 options:0];
  uint64_t v11 = [a3 instanceDescriptorBuffer];
  id v12 = -[MTLLegacySVAccelerationStructureCommandEncoder createChildrenWrappersBufferWithInstanceDescriptorBuffer:maxInstanceCount:instanceCountBuffer:instanceCountBufferOffset:instanceDescriptorStride:instanceDescriptorBufferOffset:instanceDescriptorType:accelerationStructureIDs:](self, "createChildrenWrappersBufferWithInstanceDescriptorBuffer:maxInstanceCount:instanceCountBuffer:instanceCountBufferOffset:instanceDescriptorStride:instanceDescriptorBufferOffset:instanceDescriptorType:accelerationStructureIDs:", v11, v14, v10, 0, [a3 instanceDescriptorStride], objc_msgSend(a3, "instanceDescriptorBufferOffset"), objc_msgSend(a3, "instanceDescriptorType"), v7);

  return v12;
}

- (id)createChildrenWrappersBufferWithIndirectIASDescriptor:(id)a3
{
  return -[MTLLegacySVAccelerationStructureCommandEncoder createChildrenWrappersBufferWithInstanceDescriptorBuffer:maxInstanceCount:instanceCountBuffer:instanceCountBufferOffset:instanceDescriptorStride:instanceDescriptorBufferOffset:instanceDescriptorType:accelerationStructureIDs:](self, "createChildrenWrappersBufferWithInstanceDescriptorBuffer:maxInstanceCount:instanceCountBuffer:instanceCountBufferOffset:instanceDescriptorStride:instanceDescriptorBufferOffset:instanceDescriptorType:accelerationStructureIDs:", [a3 instanceDescriptorBuffer], objc_msgSend(a3, "maxInstanceCount"), objc_msgSend(a3, "instanceCountBuffer"), objc_msgSend(a3, "instanceCountBufferOffset"), objc_msgSend(a3, "instanceDescriptorStride"), objc_msgSend(a3, "instanceDescriptorBufferOffset"), objc_msgSend(a3, "instanceDescriptorType"), 0);
}

- (id)createChildrenWrappersBufferWithASDescriptor:(id)a3
{
  v5 = objc_opt_class();
  if ([v5 isSubclassOfClass:objc_opt_class()])
  {
    if ([a3 instanceCount])
    {
      id v6 = [(MTLLegacySVAccelerationStructureCommandEncoder *)self createChildrenWrappersBufferWithIASDescriptor:a3];
      goto LABEL_6;
    }
    return 0;
  }
  v7 = objc_opt_class();
  if (![v7 isSubclassOfClass:objc_opt_class()]) {
    return 0;
  }
  id v6 = [(MTLLegacySVAccelerationStructureCommandEncoder *)self createChildrenWrappersBufferWithIndirectIASDescriptor:a3];
LABEL_6:
  id v8 = v6;
  if (v6) {
    [(MTLLegacySVAccelerationStructureCommandEncoder *)self useResource:v6 usage:1];
  }
  return v8;
}

- (void)blitChildrenWrappersBufferAddress:(id)a3 toAccelerationStructure:(id)a4
{
  v7 = (void *)[(MTLToolsObject *)self->super.super.super._parent blitCommandEncoder];
  id v10 = (id)[(MTLDevice *)[(MTLToolsObject *)self->super.super.super._parent device] newInternalBufferWithLength:8 options:0];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "baseObject"), "gpuAddress");
  *(void *)[v10 contents] = v8;
  id v9 = (id)[a4 debugBuf];
  [a4 setChildrenWrappersBuffer:a3];
  [v7 copyFromInternalBuffer:v10 sourceOffset:0 toInternalBuffer:v9 destinationOffset:24 size:8];
  [v7 endEncoding];
}

- (void)blitChildrenWrappersBufferFromAcceleratrionStructure:(id)a3 toAccelerationStructure:(id)a4
{
  id v6 = (void *)[(MTLToolsObject *)self->super.super.super._parent blitCommandEncoder];
  id v8 = (id)[a3 debugBuf];
  id v7 = (id)[a4 debugBuf];
  objc_msgSend(a4, "setChildrenWrappersBuffer:", objc_msgSend(a3, "childrenWrappersBuffer"));
  [v6 copyFromInternalBuffer:v8 sourceOffset:24 toInternalBuffer:v7 destinationOffset:24 size:8];
  [v6 endEncoding];
}

- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6
{
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self destroyBaseAccelerationStructureCommandEncoder];
  id v11 = [(MTLLegacySVAccelerationStructureCommandEncoder *)self createChildrenWrappersBufferWithASDescriptor:a4];
  id v12 = [(MTLLegacySVAccelerationStructureCommandEncoder *)self encodeUnwrapAccelerationStructureDescriptor:a4];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self newBaseAccelerationStructureCommandEncoder];
  v13.receiver = self;
  v13.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v13 buildAccelerationStructure:a3 descriptor:v12 scratchBuffer:a5 scratchBufferOffset:a6];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self destroyBaseAccelerationStructureCommandEncoder];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitTypeFromAccelerationStructureDescriptor:a4 toAccelerationStructure:a3];
  if (v11) {
    [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitChildrenWrappersBufferAddress:v11 toAccelerationStructure:a3];
  }

  [(MTLLegacySVAccelerationStructureCommandEncoder *)self newBaseAccelerationStructureCommandEncoder];
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7
{
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self destroyBaseAccelerationStructureCommandEncoder];
  id v13 = [(MTLLegacySVAccelerationStructureCommandEncoder *)self createChildrenWrappersBufferWithASDescriptor:a4];
  id v14 = [(MTLLegacySVAccelerationStructureCommandEncoder *)self encodeUnwrapAccelerationStructureDescriptor:a4];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self newBaseAccelerationStructureCommandEncoder];
  v15.receiver = self;
  v15.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v15 refitAccelerationStructure:a3 descriptor:v14 destination:a5 scratchBuffer:a6 scratchBufferOffset:a7];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self destroyBaseAccelerationStructureCommandEncoder];
  if (a5)
  {
    [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitTypeFromAccelerationStructureDescriptor:a4 toAccelerationStructure:a5];
    if (v13) {
      [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitChildrenWrappersBufferAddress:v13 toAccelerationStructure:a5];
    }
  }
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self newBaseAccelerationStructureCommandEncoder];
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8
{
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self destroyBaseAccelerationStructureCommandEncoder];
  id v15 = [(MTLLegacySVAccelerationStructureCommandEncoder *)self createChildrenWrappersBufferWithASDescriptor:a4];
  id v16 = [(MTLLegacySVAccelerationStructureCommandEncoder *)self encodeUnwrapAccelerationStructureDescriptor:a4];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self newBaseAccelerationStructureCommandEncoder];
  v17.receiver = self;
  v17.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v17 refitAccelerationStructure:a3 descriptor:v16 destination:a5 scratchBuffer:a6 scratchBufferOffset:a7 options:a8];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self destroyBaseAccelerationStructureCommandEncoder];
  if (a5)
  {
    [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitTypeFromAccelerationStructureDescriptor:a4 toAccelerationStructure:a5];
    if (v15) {
      [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitChildrenWrappersBufferAddress:v15 toAccelerationStructure:a5];
    }
  }
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self newBaseAccelerationStructureCommandEncoder];
}

- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder copyAccelerationStructure:toAccelerationStructure:](&v7, sel_copyAccelerationStructure_toAccelerationStructure_);
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self destroyBaseAccelerationStructureCommandEncoder];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitTypeFromAccelerationStructure:a3 toAccelerationStructure:a4];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitChildrenWrappersBufferFromAcceleratrionStructure:a3 toAccelerationStructure:a4];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self newBaseAccelerationStructureCommandEncoder];
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v5 writeCompactedAccelerationStructureSize:a3 toBuffer:a4 offset:a5];
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6
{
  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v6 writeCompactedAccelerationStructureSize:a3 toBuffer:a4 offset:a5 sizeDataType:a6];
}

- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder copyAndCompactAccelerationStructure:toAccelerationStructure:](&v7, sel_copyAndCompactAccelerationStructure_toAccelerationStructure_);
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self destroyBaseAccelerationStructureCommandEncoder];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitTypeFromAccelerationStructure:a3 toAccelerationStructure:a4];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitChildrenWrappersBufferFromAcceleratrionStructure:a3 toAccelerationStructure:a4];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self newBaseAccelerationStructureCommandEncoder];
}

- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v5 writeSerializedAccelerationStructureSize:a3 toBuffer:a4 sizeBufferOffset:a5];
}

- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6
{
  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v6 writeDeserializedAccelerationStructureSize:a3 serializedOffset:a4 toBuffer:a5 sizeBufferOffset:a6];
}

- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6
{
  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v6 writeDeserializedPrimitiveAccelerationStructureSizes:a3 serializedOffset:a4 toBuffer:a5 sizesBufferOffset:a6];
}

- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v5 serializePrimitiveAccelerationStructure:a3 toBuffer:a4 serializedBufferOffset:a5];
}

- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v6 serializeInstanceAccelerationStructure:a3 primitiveAccelerationStructures:a4 toBuffer:a5 serializedBufferOffset:a6];
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v7 deserializePrimitiveAccelerationStructure:a3 fromBuffer:a4 serializedBufferOffset:a5];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self destroyBaseAccelerationStructureCommandEncoder];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitPrimitiveTypetoAccelerationStructure:a3];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self newBaseAccelerationStructureCommandEncoder];
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  v8.receiver = self;
  v8.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v8 deserializeInstanceAccelerationStructure:a3 primitiveAccelerationStructures:a4 fromBuffer:a5 serializedBufferOffset:a6];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self destroyBaseAccelerationStructureCommandEncoder];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitInstanceTypetoAccelerationStructure:a3];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self newBaseAccelerationStructureCommandEncoder];
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:withDescriptor:](&v9, sel_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor_, a3, a4, a5);
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self destroyBaseAccelerationStructureCommandEncoder];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitTypeFromAccelerationStructureDescriptor:a6 toAccelerationStructure:a3];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self newBaseAccelerationStructureCommandEncoder];
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7
{
  v10.receiver = self;
  v10.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:withDescriptor:](&v10, sel_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor_, a3, a4, a5, a6);
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self destroyBaseAccelerationStructureCommandEncoder];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitTypeFromAccelerationStructureDescriptor:a7 toAccelerationStructure:a3];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self newBaseAccelerationStructureCommandEncoder];
}

- (void)serializeAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v5 serializeAccelerationStructure:a3 toBuffer:a4 serializedBufferOffset:a5];
}

- (void)deserializeAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v7 deserializeAccelerationStructure:a3 fromBuffer:a4 serializedBufferOffset:a5];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self destroyBaseAccelerationStructureCommandEncoder];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitPrimitiveTypetoAccelerationStructure:a3];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self newBaseAccelerationStructureCommandEncoder];
}

- (void)deserializeAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  v8.receiver = self;
  v8.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v8 deserializeInstanceAccelerationStructure:a3 primitiveAccelerationStructures:a4 fromBuffer:a5 serializedBufferOffset:a6];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self destroyBaseAccelerationStructureCommandEncoder];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self blitInstanceTypetoAccelerationStructure:a3];
  [(MTLLegacySVAccelerationStructureCommandEncoder *)self newBaseAccelerationStructureCommandEncoder];
}

- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v5 writeGeometrySizeOfAccelerationStructure:a3 toBuffer:a4 sizeBufferOffset:a5];
}

- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v5 writeGeometryOfAccelerationStructure:a3 toBuffer:a4 geometryBufferOffset:a5];
}

- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  return [(MTLToolsAccelerationStructureCommandEncoder *)&v5 writeGenericBVHStructureSizesOfAccelerationStructure:a3 into:a4];
}

- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  return [(MTLToolsAccelerationStructureCommandEncoder *)&v5 writeGenericBVHStructureOfAccelerationStructure:a3 into:a4];
}

- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v5 writeGenericBVHStructureSizesOfAccelerationStructure:a3 toBuffer:a4 sizesBufferOffset:a5];
}

- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15
{
  v15.receiver = self;
  v15.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLLegacySVAccelerationStructureCommandEncoder *)&v15 writeGenericBVHStructureOfAccelerationStructure:a3 headerBuffer:a4 headerBufferOffset:a5 innerNodeBuffer:a6 innerNodeBufferOffset:a7 leafNodeBuffer:a8 leafNodeBufferOffset:a9 primitiveBuffer:a10 primitiveBufferOffset:a11 geometryBuffer:a12 geometryOffset:a13 instanceTransformBuffer:a14 instanceTransformOffset:a15];
}

- (void)writeAccelerationStructureSerializationData:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v5 writeAccelerationStructureSerializationData:a3 toBuffer:a4 offset:a5];
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsAccelerationStructureCommandEncoder *)&v5 sampleCountersInBuffer:a3 atSampleIndex:a4 withBarrier:a5];
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  p_LegacySVResourceAndUsageList = &self->_LegacySVResourceAndUsageList;
  objc_super v7 = operator new(0x20uLL);
  v7[2] = a3;
  v7[3] = a4;
  prev = p_LegacySVResourceAndUsageList->__end_.__prev_;
  void *v7 = p_LegacySVResourceAndUsageList->__end_.__prev_;
  v7[1] = p_LegacySVResourceAndUsageList;
  prev[1] = v7;
  p_LegacySVResourceAndUsageList->__end_.__prev_ = v7;
  ++p_LegacySVResourceAndUsageList->__size_alloc_.__value_;
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  if (a4)
  {
    unint64_t v6 = a4;
    do
    {
      uint64_t v9 = (uint64_t)*a3++;
      [(MTLLegacySVAccelerationStructureCommandEncoder *)self useResource:v9 usage:a5];
      --v6;
    }
    while (v6);
  }
}

- (void)useHeap:(id)a3
{
  p_heapList = &self->_heapList;
  objc_super v5 = operator new(0x18uLL);
  v5[1] = p_heapList;
  v5[2] = a3;
  prev = p_heapList->__end_.__prev_;
  void *v5 = p_heapList->__end_.__prev_;
  prev[1] = v5;
  p_heapList->__end_.__prev_ = v5;
  ++p_heapList->__size_alloc_.__value_;
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    do
    {
      uint64_t v7 = (uint64_t)*a3++;
      [(MTLLegacySVAccelerationStructureCommandEncoder *)self useHeap:v7];
      --v4;
    }
    while (v4);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  [(MTLToolsObject *)&v3 dealloc];
}

- (void).cxx_destruct
{
  std::__list_imp<objc_object  {objcproto9MTLBuffer}*>::clear(&self->_heapList.__end_.__prev_);

  std::__list_imp<objc_object  {objcproto9MTLBuffer}*>::clear(&self->_LegacySVResourceAndUsageList.__end_.__prev_);
}

- (id).cxx_construct
{
  *((void *)self + 7) = (char *)self + 56;
  *((void *)self + 8) = (char *)self + 56;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = (char *)self + 80;
  *((void *)self + 11) = (char *)self + 80;
  *((void *)self + 12) = 0;
  return self;
}

@end