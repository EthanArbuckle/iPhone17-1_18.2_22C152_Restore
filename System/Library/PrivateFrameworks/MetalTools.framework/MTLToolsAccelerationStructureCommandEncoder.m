@interface MTLToolsAccelerationStructureCommandEncoder
- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4;
- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4;
- (MTLToolsAccelerationStructureCommandEncoder)initWithAccelerationStructureCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5;
- (id)endEncodingAndRetrieveProgramAddressTable;
- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6;
- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4;
- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4;
- (void)deserializeAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)deserializeAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6;
- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7;
- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)serializeAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)updateFence:(id)a3;
- (void)useHeap:(id)a3;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)waitForFence:(id)a3;
- (void)writeAccelerationStructureSerializationData:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5;
- (void)writeAccelerationStructureTraversalDepth:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5;
- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5;
- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6;
- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6;
- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6;
- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15 controlPointBuffer:(id)a16 controlPointBufferOffset:(unint64_t)a17;
- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5;
- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5;
- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5;
- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5;
@end

@implementation MTLToolsAccelerationStructureCommandEncoder

- (MTLToolsAccelerationStructureCommandEncoder)initWithAccelerationStructureCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)MTLToolsAccelerationStructureCommandEncoder;
  v7 = -[MTLToolsCommandEncoder initWithBaseObject:parent:](&v11, sel_initWithBaseObject_parent_, a3);
  v8 = v7;
  if (a5 && v7)
  {
    for (uint64_t i = 0; i != 4; ++i)
      objc_msgSend(a4, "addRetainedObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"));
  }
  return v8;
}

- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];
  uint64_t v11 = [a3 baseObject];
  id v12 = unwrapAccelerationStructureDescriptor(a4);
  uint64_t v13 = [a5 baseObject];

  [v10 buildAccelerationStructure:v11 descriptor:v12 scratchBuffer:v13 scratchBufferOffset:a6];
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7
{
  id v12 = [(MTLToolsObject *)self baseObject];
  uint64_t v13 = [a3 baseObject];
  id v14 = unwrapAccelerationStructureDescriptor(a4);
  uint64_t v15 = [a5 baseObject];
  uint64_t v16 = [a6 baseObject];

  [v12 refitAccelerationStructure:v13 descriptor:v14 destination:v15 scratchBuffer:v16 scratchBufferOffset:a7];
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8
{
  id v14 = [(MTLToolsObject *)self baseObject];
  uint64_t v15 = [a3 baseObject];
  id v16 = unwrapAccelerationStructureDescriptor(a4);
  uint64_t v17 = [a5 baseObject];
  uint64_t v18 = [a6 baseObject];

  [v14 refitAccelerationStructure:v15 descriptor:v16 destination:v17 scratchBuffer:v18 scratchBufferOffset:a7 options:a8];
}

- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];
  uint64_t v8 = [a4 baseObject];

  [v6 copyAccelerationStructure:v7 toAccelerationStructure:v8];
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];
  uint64_t v10 = [a4 baseObject];

  [v8 writeCompactedAccelerationStructureSize:v9 toBuffer:v10 offset:a5];
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];
  uint64_t v11 = [a3 baseObject];
  uint64_t v12 = [a4 baseObject];

  [v10 writeCompactedAccelerationStructureSize:v11 toBuffer:v12 offset:a5 sizeDataType:a6];
}

- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];
  uint64_t v8 = [a4 baseObject];

  [v6 copyAndCompactAccelerationStructure:v7 toAccelerationStructure:v8];
}

- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];
  uint64_t v10 = [a4 baseObject];

  [v8 writeSerializedAccelerationStructureSize:v9 toBuffer:v10 sizeBufferOffset:a5];
}

- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];
  uint64_t v11 = [a3 baseObject];
  uint64_t v12 = [a5 baseObject];

  [v10 writeDeserializedAccelerationStructureSize:v11 serializedOffset:a4 toBuffer:v12 sizeBufferOffset:a6];
}

- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];
  uint64_t v11 = [a3 baseObject];
  uint64_t v12 = [a5 baseObject];

  [v10 writeDeserializedPrimitiveAccelerationStructureSizes:v11 serializedOffset:a4 toBuffer:v12 sizesBufferOffset:a6];
}

- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];
  uint64_t v10 = [a4 baseObject];

  [v8 serializePrimitiveAccelerationStructure:v9 toBuffer:v10 serializedBufferOffset:a5];
}

- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if ([a4 count])
  {
    uint64_t v12 = 0;
    unsigned int v13 = 1;
    do
    {
      objc_msgSend(v11, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v12), "baseObject"));
      uint64_t v12 = v13;
    }
    while ([a4 count] > (unint64_t)v13++);
  }
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a3 baseObject];
  uint64_t v17 = [a5 baseObject];

  [v15 serializeInstanceAccelerationStructure:v16 primitiveAccelerationStructures:v11 toBuffer:v17 serializedBufferOffset:a6];
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];
  uint64_t v10 = [a4 baseObject];

  [v8 deserializePrimitiveAccelerationStructure:v9 fromBuffer:v10 serializedBufferOffset:a5];
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if ([a4 count])
  {
    uint64_t v12 = 0;
    unsigned int v13 = 1;
    do
    {
      objc_msgSend(v11, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v12), "baseObject"));
      uint64_t v12 = v13;
    }
    while ([a4 count] > (unint64_t)v13++);
  }
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a3 baseObject];
  uint64_t v17 = [a5 baseObject];

  [v15 deserializeInstanceAccelerationStructure:v16 primitiveAccelerationStructures:v11 fromBuffer:v17 serializedBufferOffset:a6];
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];
  uint64_t v11 = [a3 baseObject];
  uint64_t v12 = [a4 baseObject];
  id v13 = unwrapAccelerationStructureDescriptor(a6);

  [v10 deserializePrimitiveAccelerationStructure:v11 fromBuffer:v12 serializedBufferOffset:a5 withDescriptor:v13];
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7
{
  id v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if ([a4 count])
  {
    uint64_t v14 = 0;
    unsigned int v15 = 1;
    do
    {
      objc_msgSend(v13, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v14), "baseObject"));
      uint64_t v14 = v15;
    }
    while ([a4 count] > (unint64_t)v15++);
  }
  id v17 = [(MTLToolsObject *)self baseObject];
  uint64_t v18 = [a3 baseObject];
  uint64_t v19 = [a5 baseObject];
  id v20 = unwrapAccelerationStructureDescriptor(a7);

  [v17 deserializeInstanceAccelerationStructure:v18 primitiveAccelerationStructures:v13 fromBuffer:v19 serializedBufferOffset:a6 withDescriptor:v20];
}

- (void)serializeAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];
  uint64_t v10 = [a4 baseObject];

  [v8 serializeAccelerationStructure:v9 toBuffer:v10 serializedBufferOffset:a5];
}

- (void)deserializeAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];
  uint64_t v10 = [a4 baseObject];

  [v8 deserializeAccelerationStructure:v9 fromBuffer:v10 serializedBufferOffset:a5];
}

- (void)deserializeAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if ([a4 count])
  {
    uint64_t v12 = 0;
    unsigned int v13 = 1;
    do
    {
      objc_msgSend(v11, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v12), "baseObject"));
      uint64_t v12 = v13;
    }
    while ([a4 count] > (unint64_t)v13++);
  }
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a3 baseObject];
  uint64_t v17 = [a5 baseObject];

  [v15 deserializeAccelerationStructure:v16 primitiveAccelerationStructures:v11 fromBuffer:v17 serializedBufferOffset:a6];
}

- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];
  uint64_t v10 = [a4 baseObject];

  [v8 writeGeometrySizeOfAccelerationStructure:v9 toBuffer:v10 sizeBufferOffset:a5];
}

- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];
  uint64_t v10 = [a4 baseObject];

  [v8 writeGeometryOfAccelerationStructure:v9 toBuffer:v10 geometryBufferOffset:a5];
}

- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];
  uint64_t v7 = [a3 baseObject];

  return [v6 writeGenericBVHStructureSizesOfAccelerationStructure:v7 into:a4];
}

- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4
{
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263F128E8]), "initWithVersion:", objc_msgSend(a4, "version"));
  objc_msgSend(v7, "setHeaderBuffer:", objc_msgSend((id)objc_msgSend(a4, "headerBuffer"), "baseObject"));
  objc_msgSend(v7, "setHeaderBufferOffset:", objc_msgSend(a4, "headerBufferOffset"));
  objc_msgSend(v7, "setInnerNodeBuffer:", objc_msgSend((id)objc_msgSend(a4, "innerNodeBuffer"), "baseObject"));
  objc_msgSend(v7, "setInnerNodeBufferOffset:", objc_msgSend(a4, "innerNodeBufferOffset"));
  objc_msgSend(v7, "setLeafNodeBuffer:", objc_msgSend((id)objc_msgSend(a4, "leafNodeBuffer"), "baseObject"));
  objc_msgSend(v7, "setLeafNodeBufferOffset:", objc_msgSend(a4, "leafNodeBufferOffset"));
  objc_msgSend(v7, "setPrimitiveBuffer:", objc_msgSend((id)objc_msgSend(a4, "primitiveBuffer"), "baseObject"));
  objc_msgSend(v7, "setPrimitiveBufferOffset:", objc_msgSend(a4, "primitiveBufferOffset"));
  objc_msgSend(v7, "setGeometryBuffer:", objc_msgSend((id)objc_msgSend(a4, "geometryBuffer"), "baseObject"));
  objc_msgSend(v7, "setGeometryBufferOffset:", objc_msgSend(a4, "geometryBufferOffset"));
  objc_msgSend(v7, "setInstanceTransformBuffer:", objc_msgSend((id)objc_msgSend(a4, "instanceTransformBuffer"), "baseObject"));
  objc_msgSend(v7, "setInstanceTransformBufferOffset:", objc_msgSend(a4, "instanceTransformBufferOffset"));
  objc_msgSend(v7, "setPerPrimitiveDataBuffer:", objc_msgSend((id)objc_msgSend(a4, "perPrimitiveDataBuffer"), "baseObject"));
  objc_msgSend(v7, "setPerPrimitiveDataBufferOffset:", objc_msgSend(a4, "perPrimitiveDataBufferOffset"));
  objc_msgSend(v7, "setControlPointBuffer:", objc_msgSend((id)objc_msgSend(a4, "controlPointBuffer"), "baseObject"));
  objc_msgSend(v7, "setControlPointBufferOffset:", objc_msgSend(a4, "controlPointBufferOffset"));
  LOBYTE(a3) = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeGenericBVHStructureOfAccelerationStructure:into:", objc_msgSend(a3, "baseObject"), v7);

  return (char)a3;
}

- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];
  uint64_t v10 = [a4 baseObject];

  [v8 writeGenericBVHStructureSizesOfAccelerationStructure:v9 toBuffer:v10 sizesBufferOffset:a5];
}

- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15 controlPointBuffer:(id)a16 controlPointBufferOffset:(unint64_t)a17
{
  id v21 = [(MTLToolsObject *)self baseObject];
  uint64_t v22 = [a3 baseObject];
  uint64_t v23 = [a4 baseObject];
  uint64_t v24 = [a6 baseObject];
  uint64_t v25 = [a8 baseObject];
  [a10 baseObject];
  [a12 baseObject];
  [a14 baseObject];
  [a16 baseObject];

  objc_msgSend(v21, "writeGenericBVHStructureOfAccelerationStructure:headerBuffer:headerBufferOffset:innerNodeBuffer:innerNodeBufferOffset:leafNodeBuffer:leafNodeBufferOffset:primitiveBuffer:primitiveBufferOffset:geometryBuffer:geometryOffset:instanceTransformBuffer:instanceTransformOffset:controlPointBuffer:controlPointBufferOffset:", v22, v23, a5, v24, a7, v25);
}

- (void)writeAccelerationStructureSerializationData:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];
  uint64_t v10 = [a4 baseObject];

  [v8 writeAccelerationStructureSerializationData:v9 toBuffer:v10 offset:a5];
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];

  [v8 sampleCountersInBuffer:v9 atSampleIndex:a4 withBarrier:v5];
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

- (id)endEncodingAndRetrieveProgramAddressTable
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 endEncodingAndRetrieveProgramAddressTable];
}

- (void)writeAccelerationStructureTraversalDepth:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];
  uint64_t v10 = [a4 baseObject];

  [v8 writeAccelerationStructureTraversalDepth:v9 toBuffer:v10 offset:a5];
}

@end