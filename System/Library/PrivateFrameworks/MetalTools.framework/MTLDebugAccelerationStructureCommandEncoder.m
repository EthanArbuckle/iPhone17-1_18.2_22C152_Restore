@interface MTLDebugAccelerationStructureCommandEncoder
- (BOOL)checkEncoderState;
- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4;
- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4;
- (MTLDebugAccelerationStructureCommandEncoder)initWithAccelerationStructureCommandEncoder:(id)a3 parent:(id)a4;
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
- (void)serializeAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)validateRefit:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8;
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

@implementation MTLDebugAccelerationStructureCommandEncoder

- (MTLDebugAccelerationStructureCommandEncoder)initWithAccelerationStructureCommandEncoder:(id)a3 parent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugAccelerationStructureCommandEncoder;
  return [(MTLToolsCommandEncoder *)&v5 initWithBaseObject:a3 parent:a4];
}

- (BOOL)checkEncoderState
{
  return !self->hasEndedEncoding;
}

- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkAccelerationStructureDescriptorWithRefitOptions(self->super.super.super._device, a4, 1, 3);
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  checkBuffer((unint64_t)self->super.super.super._device, a5, a6, 0, @"Scratch buffer");
  v11 = [(MTLToolsObject *)self device];
  if (v11) {
    [(MTLDevice *)v11 accelerationStructureSizesWithDescriptor:a4];
  }
  [a3 size];
  if (a6 > objc_msgSend(a5, "length", v12, v14))
  {
    unint64_t v15 = a6;
    uint64_t v16 = 0;
    uint64_t v13 = [a5 length];
    MTLReportFailure();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v13, v15, v16), "buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:", objc_msgSend(a3, "baseObject"), unwrapAccelerationStructureDescriptor(a4), objc_msgSend(a5, "baseObject"), a6);
}

- (void)validateRefit:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState])
  {
    MTLReportFailure();
    if (a8) {
      goto LABEL_3;
    }
LABEL_27:
    MTLReportFailure();
    goto LABEL_3;
  }
  if (!a8) {
    goto LABEL_27;
  }
LABEL_3:
  checkAccelerationStructureDescriptorWithRefitOptions(self->super.super.super._device, a4, 1, a8);
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Source acceleration structure");
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a5, 1, @"Destination acceleration structure");
  id v29 = a6;
  checkBuffer((unint64_t)self->super.super.super._device, a6, a7, 1, @"Scratch buffer");
  unint64_t v15 = objc_opt_class();
  if ([v15 isSubclassOfClass:objc_opt_class()]
    && objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "count"))
  {
    unint64_t v16 = 0;
    do
    {
      v17 = objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "objectAtIndexedSubscript:", v16);
      v18 = objc_opt_class();
      if ([v18 isSubclassOfClass:objc_opt_class()])
      {
        MTLAttributeFormat v19 = [v17 vertexFormat];
        unint64_t v20 = [v17 vertexStride];
        if ((unint64_t)MTLAttributeFormatComponentCount(v19) <= 1) {
          MTLReportFailure();
        }
        unint64_t v21 = MTLAttributeFormatSize(v19);
        if (v20 && v21 > v20)
        {
          unint64_t v27 = v20;
          uint64_t v28 = v21;
          MTLReportFailure();
        }
        unint64_t v22 = MTLAttributeFormatAlignment(v19);
        if (v20 % v22)
        {
          unint64_t v27 = v20;
          uint64_t v28 = v22;
          MTLReportFailure();
        }
        device = self->super.super.super._device;
        v24 = objc_msgSend(v17, "transformationMatrixBuffer", v27, v28);
        unint64_t v25 = [v17 transformationMatrixBufferOffset];
        checkBuffer((unint64_t)device, v24, v25, 1, @"Transformation buffer");
        if (v24)
        {
          if (v25 + 48 > [v24 length])
          {
            unint64_t v27 = v25;
            uint64_t v28 = [v24 length];
            MTLReportFailure();
          }
          if ((v25 & 3) != 0)
          {
            unint64_t v27 = v25;
            MTLReportFailure();
          }
        }
      }
      ++v16;
    }
    while (v16 < objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors", v27), "count"));
  }
  if (v29)
  {
    v26 = [(MTLToolsObject *)self device];
    if (v26) {
      [(MTLDevice *)v26 accelerationStructureSizesWithDescriptor:a4];
    }
    if (a7 > [v29 length])
    {
      [v29 length];
      MTLReportFailure();
    }
  }
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7
{
  [(MTLDebugAccelerationStructureCommandEncoder *)self validateRefit:a3 descriptor:a4 destination:a5 scratchBuffer:a6 scratchBufferOffset:a7 options:3];
  id v13 = [(MTLToolsObject *)self baseObject];
  uint64_t v14 = [a3 baseObject];
  id v15 = unwrapAccelerationStructureDescriptor(a4);
  uint64_t v16 = [a5 baseObject];
  uint64_t v17 = [a6 baseObject];

  [v13 refitAccelerationStructure:v14 descriptor:v15 destination:v16 scratchBuffer:v17 scratchBufferOffset:a7];
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8
{
  -[MTLDebugAccelerationStructureCommandEncoder validateRefit:descriptor:destination:scratchBuffer:scratchBufferOffset:options:](self, "validateRefit:descriptor:destination:scratchBuffer:scratchBufferOffset:options:");
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a3 baseObject];
  id v17 = unwrapAccelerationStructureDescriptor(a4);
  uint64_t v18 = [a5 baseObject];
  uint64_t v19 = [a6 baseObject];

  [v15 refitAccelerationStructure:v16 descriptor:v17 destination:v18 scratchBuffer:v19 scratchBufferOffset:a7 options:a8];
}

- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Source acceleration structure");
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a4, 0, @"Destination acceleration structure");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];
  uint64_t v9 = [a4 baseObject];

  [v7 copyAccelerationStructure:v8 toAccelerationStructure:v9];
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, @"Size buffer");
  if (a5 + 4 > [a4 length])
  {
    unint64_t v12 = a5;
    uint64_t v13 = [a4 length];
    MTLReportFailure();
  }
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];
  uint64_t v11 = [a4 baseObject];

  [v9 writeCompactedAccelerationStructureSize:v10 toBuffer:v11 offset:a5];
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  if (a6 != 33 && a6 != 85) {
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, @"Size buffer");
  uint64_t v11 = 8;
  if (a6 == 33) {
    uint64_t v11 = 4;
  }
  if (v11 + a5 > [a4 length])
  {
    unint64_t v15 = a5;
    uint64_t v16 = [a4 length];
    MTLReportFailure();
  }
  id v12 = [(MTLToolsObject *)self baseObject];
  uint64_t v13 = [a3 baseObject];
  uint64_t v14 = [a4 baseObject];

  [v12 writeCompactedAccelerationStructureSize:v13 toBuffer:v14 offset:a5 sizeDataType:a6];
}

- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Source acceleration structure");
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a4, 0, @"Destination acceleration structure");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];
  uint64_t v9 = [a4 baseObject];

  [v7 copyAndCompactAccelerationStructure:v8 toAccelerationStructure:v9];
}

- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, @"Size buffer");
  if ((unint64_t)[a4 length] <= 7) {
    MTLReportFailure();
  }
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];
  uint64_t v11 = [a4 baseObject];

  [v9 writeSerializedAccelerationStructureSize:v10 toBuffer:v11 sizeBufferOffset:a5];
}

- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkBuffer((unint64_t)self->super.super.super._device, a3, a4, 0, @"Serialized acceleration structure buffer");
  checkBuffer((unint64_t)self->super.super.super._device, a5, a6, 0, @"Size buffer");
  if ((unint64_t)[a5 length] <= 7) {
    MTLReportFailure();
  }
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];
  uint64_t v13 = [a5 baseObject];

  [v11 writeDeserializedAccelerationStructureSize:v12 serializedOffset:a4 toBuffer:v13 sizeBufferOffset:a6];
}

- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkBuffer((unint64_t)self->super.super.super._device, a3, a4, 0, @"Serialized acceleration structure buffer");
  checkBuffer((unint64_t)self->super.super.super._device, a5, a6, 0, @"Size buffer");
  id v11 = [(MTLToolsObject *)self baseObject];
  uint64_t v12 = [a3 baseObject];
  uint64_t v13 = [a5 baseObject];

  [v11 writeDeserializedPrimitiveAccelerationStructureSizes:v12 serializedOffset:a4 toBuffer:v13 sizesBufferOffset:a6];
}

- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
}

- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  _MTLMessageContextBegin_();
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    _MTLMessageContextPush_();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  unint64_t v15 = a6;
  checkBuffer((unint64_t)self->super.super.super._device, a5, a6, 0, @"Buffer");
  _MTLMessageContextEnd();
  id v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if ([a4 count])
  {
    uint64_t v12 = 0;
    unsigned int v13 = 1;
    do
    {
      checkAccelerationStructure((uint64_t)self->super.super.super._device, (void *)[a4 objectAtIndexedSubscript:v12], 0, @"Primitive acceleration structure");
      objc_msgSend(v11, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v12), "baseObject"));
      uint64_t v12 = v13;
    }
    while ([a4 count] > (unint64_t)v13++);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "serializeInstanceAccelerationStructure:primitiveAccelerationStructures:toBuffer:serializedBufferOffset:", objc_msgSend(a3, "baseObject"), v11, objc_msgSend(a5, "baseObject"), v15);
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  _MTLMessageContextBegin_();
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    _MTLMessageContextPush_();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if ([a4 count])
  {
    uint64_t v11 = 0;
    unsigned int v12 = 1;
    do
    {
      checkAccelerationStructure((uint64_t)self->super.super.super._device, (void *)[a4 objectAtIndexedSubscript:v11], 0, @"Primitive acceleration structure");
      objc_msgSend(v10, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v11), "baseObject"));
      uint64_t v11 = v12;
    }
    while ([a4 count] > (unint64_t)v12++);
  }
  checkBuffer((unint64_t)self->super.super.super._device, a5, a6, 0, @"Buffer");
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:", objc_msgSend(a3, "baseObject"), v10, objc_msgSend(a5, "baseObject"), a6);
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6
{
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7
{
  id v15 = a7;
  _MTLMessageContextBegin_();
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    _MTLMessageContextPush_();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if ([a4 count])
  {
    uint64_t v12 = 0;
    unsigned int v13 = 1;
    do
    {
      checkAccelerationStructure((uint64_t)self->super.super.super._device, objc_msgSend(a4, "objectAtIndexedSubscript:", v12, v15), 0, @"Primitive acceleration structure");
      objc_msgSend(v11, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v12), "baseObject"));
      uint64_t v12 = v13;
    }
    while ([a4 count] > (unint64_t)v13++);
  }
  checkBuffer((unint64_t)self->super.super.super._device, a5, a6, 0, @"Buffer");
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:withDescriptor:", objc_msgSend(a3, "baseObject"), v11, objc_msgSend(a5, "baseObject"), a6, unwrapAccelerationStructureDescriptor(v15));
}

- (void)serializeAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, @"Buffer");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];
  uint64_t v11 = [a4 baseObject];

  [v9 serializeAccelerationStructure:v10 toBuffer:v11 serializedBufferOffset:a5];
}

- (void)deserializeAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, @"Buffer");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];
  uint64_t v11 = [a4 baseObject];

  [v9 deserializeAccelerationStructure:v10 fromBuffer:v11 serializedBufferOffset:a5];
}

- (void)deserializeAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if ([a4 count])
  {
    uint64_t v11 = 0;
    unsigned int v12 = 1;
    do
    {
      checkAccelerationStructure((uint64_t)self->super.super.super._device, (void *)[a4 objectAtIndexedSubscript:v11], 0, @"Primitive acceleration structure");
      objc_msgSend(v10, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v11), "baseObject"));
      uint64_t v11 = v12;
    }
    while ([a4 count] > (unint64_t)v12++);
  }
  checkBuffer((unint64_t)self->super.super.super._device, a5, a6, 0, @"Buffer");
  id v14 = [(MTLToolsObject *)self baseObject];
  uint64_t v15 = [a3 baseObject];
  uint64_t v16 = [a5 baseObject];

  [v14 deserializeAccelerationStructure:v15 primitiveAccelerationStructures:v10 fromBuffer:v16 serializedBufferOffset:a6];
}

- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, @"Size buffer");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];
  uint64_t v11 = [a4 baseObject];

  [v9 writeGeometrySizeOfAccelerationStructure:v10 toBuffer:v11 sizeBufferOffset:a5];
}

- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, @"Geometry buffer");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];
  uint64_t v11 = [a4 baseObject];

  [v9 writeGeometryOfAccelerationStructure:v10 toBuffer:v11 geometryBufferOffset:a5];
}

- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];

  return [v7 writeGenericBVHStructureSizesOfAccelerationStructure:v8 into:a4];
}

- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  checkBuffer((unint64_t)self->super.super.super._device, (void *)[a4 headerBuffer], objc_msgSend(a4, "headerBufferOffset"), 0, @"Header buffer");
  checkBuffer((unint64_t)self->super.super.super._device, (void *)[a4 innerNodeBuffer], objc_msgSend(a4, "innerNodeBufferOffset"), 1, @"Inner node buffer");
  checkBuffer((unint64_t)self->super.super.super._device, (void *)[a4 leafNodeBuffer], objc_msgSend(a4, "leafNodeBufferOffset"), 1, @"Leaf node buffer");
  checkBuffer((unint64_t)self->super.super.super._device, (void *)[a4 primitiveBuffer], objc_msgSend(a4, "primitiveBufferOffset"), 1, @"Primitive buffer");
  checkBuffer((unint64_t)self->super.super.super._device, (void *)[a4 geometryBuffer], objc_msgSend(a4, "geometryBufferOffset"), 1, @"Geometry buffer");
  checkBuffer((unint64_t)self->super.super.super._device, (void *)[a4 instanceTransformBuffer], objc_msgSend(a4, "instanceTransformBufferOffset"), 1, @"Instance transform buffer");
  checkBuffer((unint64_t)self->super.super.super._device, (void *)[a4 controlPointBuffer], objc_msgSend(a4, "controlPointBufferOffset"), 1, @"Control Point buffer");
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugAccelerationStructureCommandEncoder;
  return [(MTLToolsAccelerationStructureCommandEncoder *)&v8 writeGenericBVHStructureOfAccelerationStructure:a3 into:a4];
}

- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, @"Sizes buffer");
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];
  uint64_t v11 = [a4 baseObject];

  [v9 writeGenericBVHStructureSizesOfAccelerationStructure:v10 toBuffer:v11 sizesBufferOffset:a5];
}

- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15 controlPointBuffer:(id)a16 controlPointBufferOffset:(unint64_t)a17
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, @"Header buffer");
  checkBuffer((unint64_t)self->super.super.super._device, a6, a7, 0, @"Inner node buffer");
  checkBuffer((unint64_t)self->super.super.super._device, a8, a9, 0, @"Leaf node buffer");
  checkBuffer((unint64_t)self->super.super.super._device, a10, a11, 0, @"Primitive buffer");
  checkBuffer((unint64_t)self->super.super.super._device, a12, a13, 0, @"Geometry buffer");
  checkBuffer((unint64_t)self->super.super.super._device, a14, a15, 0, @"Instance transform buffer");
  checkBuffer((unint64_t)self->super.super.super._device, a16, a17, 0, @"Control Point buffer");
  id v26 = [(MTLToolsObject *)self baseObject];
  uint64_t v27 = [a3 baseObject];
  uint64_t v25 = [a4 baseObject];
  uint64_t v23 = [a6 baseObject];
  uint64_t v24 = [a8 baseObject];
  [a10 baseObject];
  [a12 baseObject];
  [a14 baseObject];
  [a16 baseObject];

  objc_msgSend(v26, "writeGenericBVHStructureOfAccelerationStructure:headerBuffer:headerBufferOffset:innerNodeBuffer:innerNodeBufferOffset:leafNodeBuffer:leafNodeBufferOffset:primitiveBuffer:primitiveBufferOffset:geometryBuffer:geometryOffset:instanceTransformBuffer:instanceTransformOffset:controlPointBuffer:controlPointBufferOffset:", v27, v25, a5, v23, a7, v24);
}

- (void)writeAccelerationStructureSerializationData:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, @"Output buffer");
  if (a5 + 24 > [a4 length])
  {
    unint64_t v12 = a5;
    uint64_t v13 = [a4 length];
    MTLReportFailure();
  }
  if ((a5 & 3) != 0)
  {
    unint64_t v12 = a5;
    MTLReportFailure();
  }
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];
  uint64_t v11 = [a4 baseObject];

  [v9 writeAccelerationStructureSerializationData:v10 toBuffer:v11 offset:a5];
}

- (void)writeAccelerationStructureTraversalDepth:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  if (![(MTLDebugAccelerationStructureCommandEncoder *)self checkEncoderState]) {
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, @"Acceleration structure");
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, @"Destination buffer");
  if ((a5 & 3) != 0)
  {
    unint64_t v12 = a5;
    uint64_t v13 = 4;
    MTLReportFailure();
  }
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];
  uint64_t v11 = [a4 baseObject];

  [v9 writeAccelerationStructureTraversalDepth:v10 toBuffer:v11 offset:a5];
}

@end