@interface CaptureMTLAccelerationStructureCommandEncoder
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4;
- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4;
- (CaptureMTLAccelerationStructureCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4 copyEventValue:(unint64_t)a5;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLAccelerationStructureCommandEncoder)baseObject;
- (MTLDevice)device;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)streamReference;
- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6;
- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4;
- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4;
- (void)dealloc;
- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6;
- (void)endEncoding;
- (void)insertDebugSignpost:(id)a3;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7;
- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)setLabel:(id)a3;
- (void)touch;
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
- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5;
@end

@implementation CaptureMTLAccelerationStructureCommandEncoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blitOperations, 0);
  objc_storeStrong((id *)&self->_retainedDescriptorObjectsByStreamRef, 0);
  objc_storeStrong((id *)&self->_retainedObjects, 0);
  objc_destroyWeak((id *)&self->_captureCommandBuffer);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  [v9 touch];
  if (v9)
  {
    v11 = self->_retainedObjects;
    if (v11) {
      [(NSMutableSet *)v11 addObject:v9];
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v28);
  baseObject = self->_baseObject;
  v13 = [v8 baseObject];
  v14 = [v9 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject writeSerializedAccelerationStructureSize:v13 toBuffer:v14 sizeBufferOffset:a5];

  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -15588;
  char v16 = BYTE9(v30);
  if (BYTE9(v30) > 0x20uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v19 = BYTE10(v30);
    ++BYTE10(v30);
    v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v29 + 1), v19 | 0x2000000000) + 16;
    char v16 = v19;
  }
  else
  {
    v17 = (char *)(v15 + BYTE9(v30));
    BYTE9(v30) += 32;
  }
  *(unsigned char *)(v15 + 13) = v16;
  v20 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v22 = (uint64_t *)[v8 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0;
  }
  v24 = (uint64_t *)[v9 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0;
  }
  *(void *)v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = v25;
  *((void *)v17 + 3) = a5;
  s();
  *(void *)uint64_t v26 = v27;
  *(unsigned char *)(v26 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;
}

- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  baseObject = self->_baseObject;
  v10 = [v6 baseObject];
  LOBYTE(baseObject) = [(MTLAccelerationStructureCommandEncoderSPI *)baseObject writeGenericBVHStructureSizesOfAccelerationStructure:v10 into:v7];

  return (char)baseObject;
}

- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  baseObject = self->_baseObject;
  v10 = [v6 baseObject];
  v11 = unwrapMTLGenericBVHBuffersSPI(v7);

  unsigned __int8 v12 = [(MTLAccelerationStructureCommandEncoderSPI *)baseObject writeGenericBVHStructureOfAccelerationStructure:v10 into:v11];
  return v12;
}

- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  [v11 touch];
  if (v11)
  {
    v13 = self->_retainedObjects;
    if (v13) {
      [(NSMutableSet *)v13 addObject:v11];
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v30);
  baseObject = self->_baseObject;
  uint64_t v15 = [v10 baseObject];
  char v16 = [v11 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject writeDeserializedPrimitiveAccelerationStructureSizes:v15 serializedOffset:a4 toBuffer:v16 sizesBufferOffset:a6];

  uint64_t v17 = v31;
  *(_DWORD *)(v31 + 8) = -15591;
  char v18 = BYTE9(v32);
  if (BYTE9(v32) > 0x18uLL)
  {
    uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 24);
    uint64_t v21 = BYTE10(v32);
    ++BYTE10(v32);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v31 + 1), v21 | 0x2800000000) + 16;
    char v18 = v21;
  }
  else
  {
    uint64_t v19 = (char *)(v17 + BYTE9(v32));
    BYTE9(v32) += 40;
  }
  *(unsigned char *)(v17 + 13) = v18;
  v22 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v24 = (uint64_t *)[v10 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t v26 = (uint64_t *)[v11 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0;
  }
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a4;
  *((void *)v19 + 3) = v27;
  *((void *)v19 + 4) = a6;
  s();
  *(void *)uint64_t v28 = v29;
  *(unsigned char *)(v28 + 8) = BYTE8(v32);
  *(unsigned char *)(v31 + 15) |= 8u;
}

- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  [v11 touch];
  if (v11)
  {
    v13 = self->_retainedObjects;
    if (v13) {
      [(NSMutableSet *)v13 addObject:v11];
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v30);
  baseObject = self->_baseObject;
  uint64_t v15 = [v10 baseObject];
  char v16 = [v11 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject writeDeserializedAccelerationStructureSize:v15 serializedOffset:a4 toBuffer:v16 sizeBufferOffset:a6];

  uint64_t v17 = v31;
  *(_DWORD *)(v31 + 8) = -15592;
  char v18 = BYTE9(v32);
  if (BYTE9(v32) > 0x18uLL)
  {
    uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 24);
    uint64_t v21 = BYTE10(v32);
    ++BYTE10(v32);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v31 + 1), v21 | 0x2800000000) + 16;
    char v18 = v21;
  }
  else
  {
    uint64_t v19 = (char *)(v17 + BYTE9(v32));
    BYTE9(v32) += 40;
  }
  *(unsigned char *)(v17 + 13) = v18;
  v22 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v24 = (uint64_t *)[v10 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t v26 = (uint64_t *)[v11 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0;
  }
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a4;
  *((void *)v19 + 3) = v27;
  *((void *)v19 + 4) = a6;
  s();
  *(void *)uint64_t v28 = v29;
  *(unsigned char *)(v28 + 8) = BYTE8(v32);
  *(unsigned char *)(v31 + 15) |= 8u;
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  [v11 touch];
  if (v11)
  {
    v13 = self->_retainedObjects;
    if (v13) {
      [(NSMutableSet *)v13 addObject:v11];
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v30);
  baseObject = self->_baseObject;
  uint64_t v15 = [v10 baseObject];
  char v16 = [v11 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject writeCompactedAccelerationStructureSize:v15 toBuffer:v16 offset:a5 sizeDataType:a6];

  uint64_t v17 = v31;
  *(_DWORD *)(v31 + 8) = -15502;
  char v18 = BYTE9(v32);
  if (BYTE9(v32) > 0x18uLL)
  {
    uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 24);
    uint64_t v21 = BYTE10(v32);
    ++BYTE10(v32);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v31 + 1), v21 | 0x2800000000) + 16;
    char v18 = v21;
  }
  else
  {
    uint64_t v19 = (char *)(v17 + BYTE9(v32));
    BYTE9(v32) += 40;
  }
  *(unsigned char *)(v17 + 13) = v18;
  v22 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v24 = (uint64_t *)[v10 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t v26 = (uint64_t *)[v11 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0;
  }
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = v27;
  *((void *)v19 + 3) = a5;
  *((void *)v19 + 4) = a6;
  s();
  *(void *)uint64_t v28 = v29;
  *(unsigned char *)(v28 + 8) = BYTE8(v32);
  *(unsigned char *)(v31 + 15) |= 8u;
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  [v9 touch];
  if (v9)
  {
    id v11 = self->_retainedObjects;
    if (v11) {
      [(NSMutableSet *)v11 addObject:v9];
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v28);
  baseObject = self->_baseObject;
  v13 = [v8 baseObject];
  v14 = [v9 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject writeCompactedAccelerationStructureSize:v13 toBuffer:v14 offset:a5];

  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -15629;
  char v16 = BYTE9(v30);
  if (BYTE9(v30) > 0x20uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v19 = BYTE10(v30);
    ++BYTE10(v30);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v29 + 1), v19 | 0x2000000000) + 16;
    char v16 = v19;
  }
  else
  {
    uint64_t v17 = (char *)(v15 + BYTE9(v30));
    BYTE9(v30) += 32;
  }
  *(unsigned char *)(v15 + 13) = v16;
  uint64_t v20 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v22 = (uint64_t *)[v8 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0;
  }
  v24 = (uint64_t *)[v9 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0;
  }
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = v25;
  *((void *)v17 + 3) = a5;
  s();
  *(void *)uint64_t v26 = v27;
  *(unsigned char *)(v26 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;
}

- (void)writeAccelerationStructureTraversalDepth:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  [v9 touch];
  if (v9)
  {
    id v11 = self->_retainedObjects;
    if (v11) {
      [(NSMutableSet *)v11 addObject:v9];
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v28);
  baseObject = self->_baseObject;
  v13 = [v8 baseObject];
  v14 = [v9 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject writeAccelerationStructureTraversalDepth:v13 toBuffer:v14 offset:a5];

  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -15287;
  char v16 = BYTE9(v30);
  if (BYTE9(v30) > 0x20uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v19 = BYTE10(v30);
    ++BYTE10(v30);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v29 + 1), v19 | 0x2000000000) + 16;
    char v16 = v19;
  }
  else
  {
    uint64_t v17 = (char *)(v15 + BYTE9(v30));
    BYTE9(v30) += 32;
  }
  *(unsigned char *)(v15 + 13) = v16;
  uint64_t v20 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v22 = (uint64_t *)[v8 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0;
  }
  v24 = (uint64_t *)[v9 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0;
  }
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = v25;
  *((void *)v17 + 3) = a5;
  s();
  *(void *)uint64_t v26 = v27;
  *(unsigned char *)(v26 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;
}

- (void)writeAccelerationStructureSerializationData:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  [v9 touch];
  if (v9)
  {
    id v11 = self->_retainedObjects;
    if (v11) {
      [(NSMutableSet *)v11 addObject:v9];
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v28);
  baseObject = self->_baseObject;
  v13 = [v8 baseObject];
  v14 = [v9 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject writeAccelerationStructureSerializationData:v13 toBuffer:v14 offset:a5];

  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -15365;
  char v16 = BYTE9(v30);
  if (BYTE9(v30) > 0x20uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v19 = BYTE10(v30);
    ++BYTE10(v30);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v29 + 1), v19 | 0x2000000000) + 16;
    char v16 = v19;
  }
  else
  {
    uint64_t v17 = (char *)(v15 + BYTE9(v30));
    BYTE9(v30) += 32;
  }
  *(unsigned char *)(v15 + 13) = v16;
  uint64_t v20 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v22 = (uint64_t *)[v8 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0;
  }
  v24 = (uint64_t *)[v9 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0;
  }
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = v25;
  *((void *)v17 + 3) = a5;
  s();
  *(void *)uint64_t v26 = v27;
  *(unsigned char *)(v26 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;
}

- (void)waitForFence:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  id v7 = [v4 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject waitForFence:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15630;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    id v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    id v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  v13 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)id v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  char v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v28);
  baseObject = self->_baseObject;
  unint64_t v11 = 8 * a4;
  __chkstk_darwin(v9, v12);
  bzero((char *)&v28 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  if (a4)
  {
    v13 = a3;
    v14 = (void *)((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v15 = a4;
    do
    {
      uint64_t v16 = (void *)*v13++;
      *v14++ = [v16 baseObject];
      --v15;
    }
    while (v15);
  }
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject useResources:(char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0) count:a4 usage:a5];
  uint64_t v17 = v29;
  *(_DWORD *)(v29 + 8) = -15631;
  char v18 = BYTE9(v30);
  if (BYTE9(v30) > 0x20uLL)
  {
    uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v21 = BYTE10(v30);
    ++BYTE10(v30);
    long long v19 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v29 + 1), v21 | 0x2000000000) + 16;
    char v18 = v21;
  }
  else
  {
    long long v19 = (char *)(v17 + BYTE9(v30));
    BYTE9(v30) += 32;
  }
  *(unsigned char *)(v17 + 13) = v18;
  v22 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v22, v23);
  bzero((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  char v25 = StreamArray((uint64_t)&v28, (long long *)((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, a4);
  *(void *)long long v19 = var0;
  *((void *)v19 + 1) = a4;
  *((void *)v19 + 2) = a5;
  v19[24] = v25;
  *(_DWORD *)(v19 + 25) = 0;
  *((_DWORD *)v19 + 7) = 0;
  s();
  *(void *)uint64_t v26 = v27;
  *(unsigned char *)(v26 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  baseObject = self->_baseObject;
  char v9 = [v6 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject useResource:v9 usage:a4];

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15632;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x28uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x1800000000) + 16;
    char v11 = v14;
  }
  else
  {
    uint64_t v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 24;
  }
  *(unsigned char *)(v10 + 13) = v11;
  unint64_t v15 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  id v7 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v26);
  baseObject = self->_baseObject;
  unint64_t v9 = 8 * a4;
  __chkstk_darwin(v7, v10);
  bzero((char *)&v26 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  if (a4)
  {
    char v11 = a3;
    uint64_t v12 = (void *)((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v13 = a4;
    do
    {
      uint64_t v14 = (void *)*v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }
    while (v13);
  }
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject useHeaps:(char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) count:a4];
  uint64_t v15 = v27;
  *(_DWORD *)(v27 + 8) = -15633;
  char v16 = BYTE9(v28);
  if (BYTE9(v28) > 0x28uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v19 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v27 + 1), v19 | 0x1800000000) + 16;
    char v16 = v19;
  }
  else
  {
    uint64_t v17 = (char *)(v15 + BYTE9(v28));
    BYTE9(v28) += 24;
  }
  *(unsigned char *)(v15 + 13) = v16;
  uint64_t v20 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  __chkstk_darwin(v20, v21);
  bzero((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a4);
  char v23 = StreamArray((uint64_t)&v26, (long long *)((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, a4);
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = a4;
  v17[16] = v23;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  s();
  *(void *)uint64_t v24 = v25;
  *(unsigned char *)(v24 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;
}

- (void)useHeap:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  id v7 = [v4 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject useHeap:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15634;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  unint64_t v13 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)updateFence:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v4];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  baseObject = self->_baseObject;
  id v7 = [v4 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject updateFence:v7];

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15635;
  char v9 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v12 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v20 + 1), v12 | 0x1000000000) + 16;
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = (char *)(v8 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v8 + 13) = v9;
  unint64_t v13 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  [v9 touch];
  if (v9)
  {
    uint64_t v11 = self->_retainedObjects;
    if (v11) {
      [(NSMutableSet *)v11 addObject:v9];
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v28);
  baseObject = self->_baseObject;
  unint64_t v13 = [v8 baseObject];
  uint64_t v14 = [v9 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject serializePrimitiveAccelerationStructure:v13 toBuffer:v14 serializedBufferOffset:a5];

  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -15521;
  char v16 = BYTE9(v30);
  if (BYTE9(v30) > 0x20uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v19 = BYTE10(v30);
    ++BYTE10(v30);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v29 + 1), v19 | 0x2000000000) + 16;
    char v16 = v19;
  }
  else
  {
    uint64_t v17 = (char *)(v15 + BYTE9(v30));
    BYTE9(v30) += 32;
  }
  *(unsigned char *)(v15 + 13) = v16;
  long long v20 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v22 = (uint64_t *)[v8 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0;
  }
  uint64_t v24 = (uint64_t *)[v9 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0;
  }
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = v25;
  *((void *)v17 + 3) = a5;
  s();
  *(void *)uint64_t v26 = v27;
  *(unsigned char *)(v26 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  baseObject = self->_baseObject;
  uint64_t v11 = [v8 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject sampleCountersInBuffer:v11 atSampleIndex:a4 withBarrier:v5];

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15637;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((_DWORD *)v14 + 6) = v5;
  *((_DWORD *)v14 + 7) = 0;
  s();
  *(void *)uint64_t v21 = v22;
  *(unsigned char *)(v21 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
}

- (void)pushDebugGroup:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLAccelerationStructureCommandEncoderSPI *)self->_baseObject pushDebugGroup:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15639;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    id v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    id v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)&v19, v15, v16 + 1);
  }
  *(void *)id v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)popDebugGroup
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLAccelerationStructureCommandEncoderSPI *)self->_baseObject popDebugGroup];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15640;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    uint64_t v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
}

- (void)insertDebugSignpost:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLAccelerationStructureCommandEncoderSPI *)self->_baseObject insertDebugSignpost:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15641;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)&v19, v15, v16 + 1);
  }
  *(void *)uint64_t v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  [v11 touch];
  if (v11)
  {
    id v14 = self->_retainedObjects;
    if (v14) {
      [(NSMutableSet *)v14 addObject:v11];
    }
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v33);
  baseObject = self->_baseObject;
  size_t v16 = [v10 baseObject];
  uint64_t v17 = [v11 baseObject];
  uint64_t v18 = unwrapMTLAccelerationStructureDescriptor(v12);
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject deserializePrimitiveAccelerationStructure:v16 fromBuffer:v17 serializedBufferOffset:a5 withDescriptor:v18];

  uint64_t v19 = v34;
  *(_DWORD *)(v34 + 8) = -15465;
  char v20 = BYTE9(v35);
  if (BYTE9(v35) > 0x18uLL)
  {
    uint64_t v22 = *(void *)(*((void *)&v33 + 1) + 24);
    uint64_t v23 = BYTE10(v35);
    ++BYTE10(v35);
    long long v21 = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v34 + 1), v23 | 0x2800000000) + 16;
    char v20 = v23;
  }
  else
  {
    long long v21 = (char *)(v19 + BYTE9(v35));
    BYTE9(v35) += 40;
  }
  *(unsigned char *)(v19 + 13) = v20;
  long long v24 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v26 = (uint64_t *)[v10 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0;
  }
  long long v28 = (uint64_t *)[v11 traceStream];
  if (v28) {
    uint64_t v29 = *v28;
  }
  else {
    uint64_t v29 = 0;
  }
  char v30 = SaveMTLAccelerationStructureDescriptor((uint64_t)&v33, v12);

  *(void *)long long v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = v29;
  *((void *)v21 + 3) = a5;
  v21[32] = v30;
  *(_DWORD *)(v21 + 33) = 0;
  *((_DWORD *)v21 + 9) = 0;
  s();
  *(void *)uint64_t v31 = v32;
  *(unsigned char *)(v31 + 8) = BYTE8(v35);
  *(unsigned char *)(v34 + 15) |= 8u;
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -15644;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    uint64_t v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLAccelerationStructureCommandEncoder;
  [(CaptureMTLAccelerationStructureCommandEncoder *)&v12 dealloc];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLAccelerationStructureCommandEncoderSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15648;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    uint64_t v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)&v19, v15, v16 + 1);
  }
  *(void *)uint64_t v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (NSString)label
{
  return (NSString *)[(MTLAccelerationStructureCommandEncoderSPI *)self->_baseObject label];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLAccelerationStructureCommandEncoderSPI *)baseObject conformsToProtocol:v4];

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return CaptureRespondsToSelector((uint64_t)self->_baseObject, a3);
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)CaptureMTLAccelerationStructureCommandEncoder;
  uint64_t v3 = [(CaptureMTLAccelerationStructureCommandEncoder *)&v7 description];
  id v4 = [(MTLAccelerationStructureCommandEncoderSPI *)self->_baseObject description];
  unsigned __int8 v5 = +[NSString stringWithFormat:@"%@ -> %@", v3, v4];

  return (NSString *)v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_baseObject;
}

- (unint64_t)streamReference
{
  traceStream = self->_traceStream;
  if (traceStream) {
    return traceStream->var0;
  }
  else {
    return 0;
  }
}

- (GTTraceStream)traceStream
{
  return self->_traceStream;
}

- (GTTraceContext)traceContext
{
  return self->_traceContext;
}

- (void)touch
{
  traceStream = self->_traceStream;
  uint64_t v3 = mach_absolute_time();
  if (traceStream)
  {
    unint64_t v4 = atomic_load(&traceStream[1].var1);
    unint64_t v5 = v4;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)&traceStream[1].var1, &v5, v4 & 0x1F | v3 & 0xFFFFFFFFFFFFFFE0);
      BOOL v6 = v5 == v4;
      unint64_t v4 = v5;
    }
    while (!v6);
  }
}

- (id)originalObject
{
  return DEVICEOBJECT(self->_baseObject);
}

- (void)endEncoding
{
  v2 = self;
  int v3 = GTAccelerationStructureDescriptorDownloader_needsDownloader((uint64_t)self->_traceStream);
  if (endEncoding_descriptorDownloaderToken != -1) {
    dispatch_once(&endEncoding_descriptorDownloaderToken, &__block_literal_global_6890);
  }
  [(MTLAccelerationStructureCommandEncoderSPI *)v2->_baseObject endEncoding];
  p_captureCommandBuffer = (id *)&v2->_captureCommandBuffer;
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_captureCommandBuffer);
  BOOL v6 = DEVICEOBJECT(WeakRetained);

  if ([(NSMutableArray *)v2->_blitOperations count])
  {
    int v72 = v3;
    v73 = &v2->_captureCommandBuffer;
    v74 = v6;
    context = [v6 blitCommandEncoder];
    [context setLabel:@"com.apple.gputools.ADSExtraBuffersBlit"];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    v75 = v2;
    obj = v2->_blitOperations;
    id v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v84 objects:v88 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v85;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v85 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v84 + 1) + 8 * i);
          id v12 = [v11 objectForKeyedSubscript:@"srcBuffer"];
          id v13 = DEVICEOBJECT(v12);
          id v14 = [v11 objectForKeyedSubscript:@"srcOffset"];
          id v15 = NumberToInt(v14);
          size_t v16 = [v11 objectForKeyedSubscript:@"dstBuffer"];
          uint64_t v17 = DEVICEOBJECT(v16);
          uint64_t v18 = [v11 objectForKeyedSubscript:@"length"];
          [context copyFromBuffer:v13 sourceOffset:v15 toBuffer:v17 destinationOffset:0 size:NumberToInt(v18)];
        }
        id v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v84 objects:v88 count:16];
      }
      while (v8);
    }

    [context endEncoding];
    v2 = v75;
    long long v19 = v75->_blitOperations;
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = __60__CaptureMTLAccelerationStructureCommandEncoder_endEncoding__block_invoke_2;
    v82[3] = &unk_222170;
    v83 = v19;
    long long v20 = v19;
    BOOL v6 = v74;
    [v74 addCompletedHandler:v82];
    blitOperations = v75->_blitOperations;
    v75->_blitOperations = 0;

    p_captureCommandBuffer = (id *)v73;
    int v3 = v72;
  }
  if (v3)
  {
    uint64_t v23 = [v6 computeCommandEncoder];
    [v23 setLabel:@"com.apple.gputools.GTAccelerationStructureDescriptorDownloader.copyCommandEncoder"];
    newpool[0] = 0;
    apr_pool_create_ex(newpool, 0, 0, 0);
    long long v24 = apr_hash_make(newpool[0]);
    GTTraceMemPool_buildMemoryMap((uint64_t)v2->_traceStream->var3, v24);
    id v25 = objc_loadWeakRetained(p_captureCommandBuffer);
    uint64_t v26 = [v25 device];
    retainedDescriptorObjectsByStreamRef = v2->_retainedDescriptorObjectsByStreamRef;
    long long v28 = (apr_pool_t *)atomic_load(&v2->_traceContext->var2);
    uint64_t v29 = GTAccelerationStructureDescriptorDownloader_make(v26, retainedDescriptorObjectsByStreamRef, v24, v28, newpool[0]);

    unint64_t var0 = v2->_traceStream->var4.var0;
    contexta = v22;
    unsigned int v31 = 0;
    if (var0)
    {
      while (1)
      {
        unsigned int v32 = atomic_load((unsigned int *)var0 + 1);
        uint64_t v33 = v31 + (v32 >> 6) - 1;
        if ((int)v33 > 0) {
          break;
        }
        unint64_t var0 = (GTTraceStoreNode)^(GTTraceStoreNode)AiAi *)*((void *)var0 + 5);
        unsigned int v31 = v33;
        if (!var0)
        {
          unsigned int v31 = v33;
          goto LABEL_18;
        }
      }
    }
    uint64_t v33 = 0;
LABEL_18:
    unint64_t v34 = v31 | (unint64_t)(v33 << 32);
LABEL_19:
    long long v35 = (char *)var0 + 64;
    while (var0 && (v35[64 * (uint64_t)(HIDWORD(v34) - (int)v34) + 15] & 8) != 0)
    {
      GTAccelerationStructureDescriptorDownloader_preProcessFunc((uint64_t)v29, (uint64_t)&v35[64 * (uint64_t)(HIDWORD(v34) - (int)v34)]);
      unsigned int v36 = atomic_load((unsigned int *)var0 + 1);
      int v37 = v34 + (v36 >> 6);
      uint64_t v38 = (HIDWORD(v34) + 1);
      unint64_t v34 = (v38 << 32) | v34;
      if (v38 == v37 - 1)
      {
        unint64_t v34 = (v38 << 32) | v38;
        unint64_t var0 = (GTTraceStoreNode)^(GTTraceStoreNode)AiAi *)*((void *)var0 + 5);
        goto LABEL_19;
      }
    }
    id v39 = objc_loadWeakRetained(p_captureCommandBuffer);
    v40 = [v39 device];
    v41 = DEVICEOBJECT(v40);
    GTAccelerationStructureDescriptorDownloader_allocateStateBuffers((uint64_t)v29, v41);

    v42 = v2->_traceStream->var4.var0;
    if (v42)
    {
      unsigned int v43 = 0;
      while (1)
      {
        unsigned int v44 = atomic_load((unsigned int *)v42 + 1);
        uint64_t v45 = v43 + (v44 >> 6) - 1;
        if ((int)v45 > 0) {
          break;
        }
        v42 = (GTTraceStoreNode)^(GTTraceStoreNode)AiAi *)*((void *)v42 + 5);
        unsigned int v43 = v45;
        if (!v42)
        {
          unsigned int v43 = v45;
          goto LABEL_31;
        }
      }
    }
    else
    {
      unsigned int v43 = 0;
    }
    uint64_t v45 = 0;
LABEL_31:
    unint64_t v46 = v43 | (unint64_t)(v45 << 32);
LABEL_32:
    v47 = (char *)v42 + 64;
    while (v42 && (v47[64 * (uint64_t)(HIDWORD(v46) - (int)v46) + 15] & 8) != 0)
    {
      GTAccelerationStructureDescriptorDownloader_processFunc((uint64_t)v29, (uint64_t)&v47[64 * (uint64_t)(HIDWORD(v46) - (int)v46)], v23);
      unsigned int v48 = atomic_load((unsigned int *)v42 + 1);
      int v49 = v46 + (v48 >> 6);
      uint64_t v50 = (HIDWORD(v46) + 1);
      unint64_t v46 = (v50 << 32) | v46;
      if (v50 == v49 - 1)
      {
        unint64_t v46 = (v50 << 32) | v50;
        v42 = (GTTraceStoreNode)^(GTTraceStoreNode)AiAi *)*((void *)v42 + 5);
        goto LABEL_32;
      }
    }
    id v51 = objc_loadWeakRetained(p_captureCommandBuffer);
    v52 = [v51 accelerationStructureDescriptorProcessEvent];
    v53 = (void *)endEncoding_descriptorDownloaderEventListener;
    uint64_t copyEventValue = v2->_copyEventValue;
    v55 = p_captureCommandBuffer;
    id v56 = objc_loadWeakRetained(p_captureCommandBuffer);
    GTAccelerationStructureDescriptorDownloader_postProcess((uint64_t)v29, v52, v53, copyEventValue, (char)[v56 isCapturing], v2, (uint64_t)v2->_traceContext);

    v57 = v29[3];
    v29[3] = 0;

    v58 = v29[4];
    v29[4] = 0;

    apr_pool_destroy(newpool[0]);
    [v23 endEncoding];
    id v59 = objc_loadWeakRetained(v55);
    v60 = [v59 accelerationStructureDescriptorProcessEvent];
    [v6 encodeSignalEvent:v60 value:v2->_copyEventValue];

    id v61 = objc_loadWeakRetained(v55);
    v62 = [v61 accelerationStructureDescriptorProcessEvent];
    [v6 encodeWaitForEvent:v62 value:v2->_copyEventValue + 1 timeout:GT_ENV];

    [v6 addCompletedHandler:&__block_literal_global_64];
  }
  long long v80 = 0u;
  long long v81 = 0u;
  *(_OWORD *)newpool = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)v2->_traceContext, (uint64_t)newpool);
  uint64_t v63 = v80;
  *(_DWORD *)(v80 + 8) = -15642;
  char v64 = BYTE9(v81);
  if (BYTE9(v81) > 0x38uLL)
  {
    uint64_t v66 = *((void *)newpool[1] + 3);
    uint64_t v67 = BYTE10(v81);
    ++BYTE10(v81);
    v65 = GTTraceMemPool_allocateBytes(v66, *((uint64_t *)&v80 + 1), v67 | 0x800000000) + 16;
    char v64 = v67;
  }
  else
  {
    v65 = (char *)(v63 + BYTE9(v81));
    BYTE9(v81) += 8;
  }
  *(unsigned char *)(v63 + 13) = v64;
  v68 = [(CaptureMTLAccelerationStructureCommandEncoder *)v2 traceStream];
  if (v68) {
    unint64_t v69 = v68->var0;
  }
  else {
    unint64_t v69 = 0;
  }
  *(void *)v65 = v69;
  s();
  *(void *)uint64_t v70 = v71;
  *(unsigned char *)(v70 + 8) = BYTE8(v81);
  *(unsigned char *)(v80 + 15) |= 8u;
}

id __60__CaptureMTLAccelerationStructureCommandEncoder_endEncoding__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) count];
}

void __60__CaptureMTLAccelerationStructureCommandEncoder_endEncoding__block_invoke(id a1)
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.gputools.ADSDescriptorDownloader", 0);
  id v1 = [objc_alloc((Class)MTLSharedEventListener) initWithDispatchQueue:v3];
  v2 = (void *)endEncoding_descriptorDownloaderEventListener;
  endEncoding_descriptorDownloaderEventListener = (uint64_t)v1;
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  [v11 touch];
  if (v11)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v11];
    }
  }
  RetainNSArray(self->_retainedObjects, v12);
  [v13 touch];
  if (v13)
  {
    size_t v16 = self->_retainedObjects;
    if (v16) {
      [(NSMutableSet *)v16 addObject:v13];
    }
  }
  RetainObjectForDescriptorDownloader(v11, self->_retainedDescriptorObjectsByStreamRef);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v17 = v12;
  id v18 = [v17 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v51;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v51 != v20) {
          objc_enumerationMutation(v17);
        }
        RetainObjectForDescriptorDownloader(*(void **)(*((void *)&v50 + 1) + 8 * i), self->_retainedDescriptorObjectsByStreamRef);
      }
      id v19 = [v17 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v19);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v47);
  baseObject = self->_baseObject;
  uint64_t v23 = [v11 baseObject];
  long long v24 = unwrapNSArray(v17);
  id v25 = [v13 baseObject];
  uint64_t v26 = unwrapMTLAccelerationStructureDescriptor(v14);
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject deserializeInstanceAccelerationStructure:v23 primitiveAccelerationStructures:v24 fromBuffer:v25 serializedBufferOffset:a6 withDescriptor:v26];

  id v27 = objc_alloc_init((Class)MTLInstanceAccelerationStructureDescriptor);
  [v11 setCaptureDescriptor:v27];

  uint64_t v28 = v48;
  *(_DWORD *)(v48 + 8) = -15466;
  char v29 = BYTE9(v49);
  if (BYTE9(v49) > 0x18uLL)
  {
    uint64_t v31 = *(void *)(*((void *)&v47 + 1) + 24);
    uint64_t v32 = BYTE10(v49);
    ++BYTE10(v49);
    char v30 = GTTraceMemPool_allocateBytes(v31, *((uint64_t *)&v48 + 1), v32 | 0x2800000000) + 16;
    char v29 = v32;
  }
  else
  {
    char v30 = (char *)(v28 + BYTE9(v49));
    BYTE9(v49) += 40;
  }
  *(unsigned char *)(v28 + 13) = v29;
  uint64_t v33 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v33) {
    unint64_t var0 = v33->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v35 = (uint64_t *)[v11 traceStream];
  if (v35) {
    uint64_t v36 = *v35;
  }
  else {
    uint64_t v36 = 0;
  }
  int v37 = (uint64_t *)[v13 traceStream];
  if (v37) {
    uint64_t v38 = *v37;
  }
  else {
    uint64_t v38 = 0;
  }
  char v39 = StreamMTLNameArray((uint64_t)&v47, v17);
  char v40 = SaveMTLAccelerationStructureDescriptor((uint64_t)&v47, v14);
  *(void *)char v30 = var0;
  *((void *)v30 + 1) = v36;
  *((void *)v30 + 2) = v38;
  *((void *)v30 + 3) = a6;
  v30[32] = v39;
  v30[33] = v40;
  *(_DWORD *)(v30 + 34) = 0;
  *((_WORD *)v30 + 19) = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  int v42 = [WeakRetained isCapturing];
  id v43 = objc_alloc_init((Class)MTLInstanceAccelerationStructureDescriptor);
  SetCaptureDescriptor(v11, self, v42, v43);

  s();
  *(void *)uint64_t v44 = v45;
  *(unsigned char *)(v44 + 8) = BYTE8(v49);
  *(unsigned char *)(v48 + 15) |= 8u;
}

- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  RetainNSArray(self->_retainedObjects, v11);
  [v12 touch];
  if (v12)
  {
    id v14 = self->_retainedObjects;
    if (v14) {
      [(NSMutableSet *)v14 addObject:v12];
    }
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v33);
  baseObject = self->_baseObject;
  size_t v16 = [v10 baseObject];
  id v17 = unwrapNSArray(v11);
  id v18 = [v12 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject serializeInstanceAccelerationStructure:v16 primitiveAccelerationStructures:v17 toBuffer:v18 serializedBufferOffset:a6];

  uint64_t v19 = v34;
  *(_DWORD *)(v34 + 8) = -15522;
  char v20 = BYTE9(v35);
  if (BYTE9(v35) > 0x18uLL)
  {
    uint64_t v22 = *(void *)(*((void *)&v33 + 1) + 24);
    uint64_t v23 = BYTE10(v35);
    ++BYTE10(v35);
    long long v21 = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v34 + 1), v23 | 0x2800000000) + 16;
    char v20 = v23;
  }
  else
  {
    long long v21 = (char *)(v19 + BYTE9(v35));
    BYTE9(v35) += 40;
  }
  *(unsigned char *)(v19 + 13) = v20;
  long long v24 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v26 = (uint64_t *)[v10 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t v28 = (uint64_t *)[v12 traceStream];
  if (v28) {
    uint64_t v29 = *v28;
  }
  else {
    uint64_t v29 = 0;
  }
  char v30 = StreamMTLNameArray((uint64_t)&v33, v11);
  *(void *)long long v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = v29;
  *((void *)v21 + 3) = a6;
  v21[32] = v30;
  *(_DWORD *)(v21 + 33) = 0;
  *((_DWORD *)v21 + 9) = 0;
  s();
  *(void *)uint64_t v31 = v32;
  *(unsigned char *)(v31 + 8) = BYTE8(v35);
  *(unsigned char *)(v34 + 15) |= 8u;
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v10];
    }
  }
  RetainNSArray(self->_retainedObjects, v11);
  [v12 touch];
  if (v12)
  {
    id v14 = self->_retainedObjects;
    if (v14) {
      [(NSMutableSet *)v14 addObject:v12];
    }
  }
  RetainObjectForDescriptorDownloader(v10, self->_retainedDescriptorObjectsByStreamRef);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v15 = v11;
  id v16 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v45;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v15);
        }
        RetainObjectForDescriptorDownloader(*(void **)(*((void *)&v44 + 1) + 8 * i), self->_retainedDescriptorObjectsByStreamRef);
      }
      id v17 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v17);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v41);
  char v20 = [v10 baseObject];
  baseObject = self->_baseObject;
  uint64_t v22 = unwrapNSArray(v15);
  uint64_t v23 = [v12 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject deserializeInstanceAccelerationStructure:v20 primitiveAccelerationStructures:v22 fromBuffer:v23 serializedBufferOffset:a6];

  uint64_t v24 = v42;
  *(_DWORD *)(v42 + 8) = -15524;
  char v25 = BYTE9(v43);
  if (BYTE9(v43) > 0x18uLL)
  {
    uint64_t v27 = *(void *)(*((void *)&v41 + 1) + 24);
    uint64_t v28 = BYTE10(v43);
    ++BYTE10(v43);
    uint64_t v26 = GTTraceMemPool_allocateBytes(v27, *((uint64_t *)&v42 + 1), v28 | 0x2800000000) + 16;
    char v25 = v28;
  }
  else
  {
    uint64_t v26 = (char *)(v24 + BYTE9(v43));
    BYTE9(v43) += 40;
  }
  *(unsigned char *)(v24 + 13) = v25;
  uint64_t v29 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v29) {
    unint64_t var0 = v29->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v31 = (uint64_t *)[v10 traceStream];
  if (v31) {
    uint64_t v32 = *v31;
  }
  else {
    uint64_t v32 = 0;
  }
  long long v33 = (uint64_t *)[v12 traceStream];
  if (v33) {
    uint64_t v34 = *v33;
  }
  else {
    uint64_t v34 = 0;
  }
  char v35 = StreamMTLNameArray((uint64_t)&v41, v15);
  *(void *)uint64_t v26 = var0;
  *((void *)v26 + 1) = v32;
  *((void *)v26 + 2) = v34;
  *((void *)v26 + 3) = a6;
  v26[32] = v35;
  *(_DWORD *)(v26 + 33) = 0;
  *((_DWORD *)v26 + 9) = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  int v37 = [WeakRetained isCapturing];
  id v38 = objc_alloc_init((Class)MTLInstanceAccelerationStructureDescriptor);
  SetCaptureDescriptor(v10, self, v37, v38);

  s();
  *(void *)uint64_t v39 = v40;
  *(unsigned char *)(v39 + 8) = BYTE8(v43);
  *(unsigned char *)(v42 + 15) |= 8u;
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v8];
    }
  }
  [v9 touch];
  if (v9)
  {
    id v11 = self->_retainedObjects;
    if (v11) {
      [(NSMutableSet *)v11 addObject:v9];
    }
  }
  RetainObjectForDescriptorDownloader(v8, self->_retainedDescriptorObjectsByStreamRef);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v31);
  id v12 = [v8 baseObject];
  baseObject = self->_baseObject;
  id v14 = [v9 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject deserializePrimitiveAccelerationStructure:v12 fromBuffer:v14 serializedBufferOffset:a5];

  uint64_t v15 = v32;
  *(_DWORD *)(v32 + 8) = -15523;
  char v16 = BYTE9(v33);
  if (BYTE9(v33) > 0x20uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 24);
    uint64_t v19 = BYTE10(v33);
    ++BYTE10(v33);
    id v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v32 + 1), v19 | 0x2000000000) + 16;
    char v16 = v19;
  }
  else
  {
    id v17 = (char *)(v15 + BYTE9(v33));
    BYTE9(v33) += 32;
  }
  *(unsigned char *)(v15 + 13) = v16;
  char v20 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v22 = (uint64_t *)[v8 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0;
  }
  uint64_t v24 = (uint64_t *)[v9 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0;
  }
  *(void *)id v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = v25;
  *((void *)v17 + 3) = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  int v27 = [WeakRetained isCapturing];
  id v28 = objc_alloc_init((Class)MTLPrimitiveAccelerationStructureDescriptor);
  SetCaptureDescriptor(v8, self, v27, v28);

  s();
  *(void *)uint64_t v29 = v30;
  *(unsigned char *)(v29 + 8) = BYTE8(v33);
  *(unsigned char *)(v32 + 15) |= 8u;
}

- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v10 device];
  unsigned __int8 v14 = [v13 captureRaytracingEnabled];

  if (v14)
  {
    [v10 touch];
    if (v10)
    {
      retainedObjects = self->_retainedObjects;
      if (retainedObjects) {
        [(NSMutableSet *)retainedObjects addObject:v10];
      }
    }
    [v12 touch];
    if (v12)
    {
      char v16 = self->_retainedObjects;
      if (v16) {
        [(NSMutableSet *)v16 addObject:v12];
      }
    }
    RetainObjectForDescriptorDownloader(v10, self->_retainedDescriptorObjectsByStreamRef);
    RetainAccelerationStructureDescriptorObjects(self->_retainedObjects, self->_retainedDescriptorObjectsByStreamRef, v11);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v51 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v51);
    baseObject = self->_baseObject;
    uint64_t v18 = [v10 baseObject];
    uint64_t v19 = unwrapMTLAccelerationStructureDescriptor(v11);
    long long v48 = v12;
    char v20 = [v12 baseObject];
    unint64_t v49 = a6;
    [(MTLAccelerationStructureCommandEncoderSPI *)baseObject buildAccelerationStructure:v18 descriptor:v19 scratchBuffer:v20 scratchBufferOffset:a6];

    id v50 = v11;
    id v21 = v10;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
    LODWORD(v18) = [WeakRetained isCapturing];
    unint64_t v23 = ((unint64_t)qword_2501C8 >> 4) & 1;
    captureDevice = self->_captureDevice;
    blitOperations = self->_blitOperations;
    uint64_t v26 = [v21 extraRetainedObjects];
    int v27 = copyCaptureDescriptor(&v50, (int)v18, v23, captureDevice, blitOperations, v26, self->_retainedDescriptorObjectsByStreamRef);
    id v28 = v50;

    uint64_t v29 = v52;
    *(_DWORD *)(v52 + 8) = -15647;
    char v30 = BYTE9(v53);
    if (BYTE9(v53) > 0x18uLL)
    {
      uint64_t v36 = *(void *)(*((void *)&v51 + 1) + 24);
      uint64_t v37 = BYTE10(v53);
      ++BYTE10(v53);
      long long v31 = GTTraceMemPool_allocateBytes(v36, *((uint64_t *)&v52 + 1), v37 | 0x2800000000) + 16;
      char v30 = v37;
    }
    else
    {
      long long v31 = (char *)(v29 + BYTE9(v53));
      BYTE9(v53) += 40;
    }
    id v12 = v48;
    *(unsigned char *)(v29 + 13) = v30;
    id v38 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
    if (v38) {
      unint64_t var0 = v38->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    uint64_t v40 = (uint64_t *)[v21 traceStream];
    if (v40) {
      uint64_t v41 = *v40;
    }
    else {
      uint64_t v41 = 0;
    }
    long long v42 = (uint64_t *)[v48 traceStream];
    if (v42) {
      uint64_t v43 = *v42;
    }
    else {
      uint64_t v43 = 0;
    }
    char v44 = SaveMTLAccelerationStructureDescriptor((uint64_t)&v51, v28);
    *(void *)long long v31 = var0;
    *((void *)v31 + 1) = v41;
    *((void *)v31 + 2) = v43;
    *((void *)v31 + 3) = v49;
    v31[32] = v44;
    *(_DWORD *)(v31 + 33) = 0;
    *((_DWORD *)v31 + 9) = 0;
    id v45 = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
    SetCaptureDescriptor(v21, self, (int)[v45 isCapturing], v27);

    s();
    *(void *)uint64_t v46 = v47;
    *(unsigned char *)(v46 + 8) = BYTE8(v53);
    *(unsigned char *)(v52 + 15) |= 8u;
  }
  else
  {
    GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLAccelerationStructureCommandEncoder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset", (uint64_t)"Raytracing", 0, 0);
    long long v32 = self->_baseObject;
    long long v33 = [v10 baseObject];
    uint64_t v34 = unwrapMTLAccelerationStructureDescriptor(v11);
    char v35 = [v12 baseObject];
    [(MTLAccelerationStructureCommandEncoderSPI *)v32 buildAccelerationStructure:v33 descriptor:v34 scratchBuffer:v35 scratchBufferOffset:a6];

    id v28 = v11;
  }
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  [v12 touch];
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v12];
    }
  }
  [v14 touch];
  if (v14)
  {
    id v17 = self->_retainedObjects;
    if (v17) {
      [(NSMutableSet *)v17 addObject:v14];
    }
  }
  [v15 touch];
  if (v15)
  {
    uint64_t v18 = self->_retainedObjects;
    if (v18) {
      [(NSMutableSet *)v18 addObject:v15];
    }
  }
  RetainObjectForDescriptorDownloader(v12, self->_retainedDescriptorObjectsByStreamRef);
  RetainObjectForDescriptorDownloader(v14, self->_retainedDescriptorObjectsByStreamRef);
  RetainAccelerationStructureDescriptorObjects(self->_retainedObjects, self->_retainedDescriptorObjectsByStreamRef, v13);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v53 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v53);
  baseObject = self->_baseObject;
  char v20 = [v12 baseObject];
  id v21 = unwrapMTLAccelerationStructureDescriptor(v13);
  uint64_t v22 = [v14 baseObject];
  long long v51 = v15;
  unint64_t v23 = [v15 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject refitAccelerationStructure:v20 descriptor:v21 destination:v22 scratchBuffer:v23 scratchBufferOffset:a7 options:a8];

  id v52 = v13;
  id v24 = v14;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  LODWORD(v23) = [WeakRetained isCapturing];
  unint64_t v26 = ((unint64_t)qword_2501C8 >> 4) & 1;
  captureDevice = self->_captureDevice;
  blitOperations = self->_blitOperations;
  uint64_t v29 = [v24 extraRetainedObjects];
  char v30 = copyCaptureDescriptor(&v52, (int)v23, v26, captureDevice, blitOperations, v29, self->_retainedDescriptorObjectsByStreamRef);
  id v31 = v52;

  uint64_t v32 = v54;
  *(_DWORD *)(v54 + 8) = -15366;
  char v33 = BYTE9(v55);
  if (BYTE9(v55) > 8uLL)
  {
    uint64_t v35 = *(void *)(*((void *)&v53 + 1) + 24);
    uint64_t v36 = BYTE10(v55);
    ++BYTE10(v55);
    uint64_t v34 = GTTraceMemPool_allocateBytes(v35, *((uint64_t *)&v54 + 1), v36 | 0x3800000000) + 16;
    char v33 = v36;
  }
  else
  {
    uint64_t v34 = (char *)(v32 + BYTE9(v55));
    BYTE9(v55) += 56;
  }
  *(unsigned char *)(v32 + 13) = v33;
  uint64_t v37 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v37) {
    unint64_t var0 = v37->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v39 = (uint64_t *)[v12 traceStream];
  if (v39) {
    uint64_t v40 = *v39;
  }
  else {
    uint64_t v40 = 0;
  }
  uint64_t v41 = (uint64_t *)[v24 traceStream];
  if (v41) {
    uint64_t v42 = *v41;
  }
  else {
    uint64_t v42 = 0;
  }
  uint64_t v43 = (uint64_t *)[v51 traceStream];
  if (v43) {
    uint64_t v44 = *v43;
  }
  else {
    uint64_t v44 = 0;
  }
  char v45 = SaveMTLAccelerationStructureDescriptor((uint64_t)&v53, v31);
  *(void *)uint64_t v34 = var0;
  *((void *)v34 + 1) = v40;
  *((void *)v34 + 2) = v42;
  *((void *)v34 + 3) = v44;
  *((void *)v34 + 4) = a7;
  *((void *)v34 + 5) = a8;
  v34[48] = v45;
  *(_DWORD *)(v34 + 49) = 0;
  *((_DWORD *)v34 + 13) = 0;
  id v46 = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  SetCaptureDescriptor(v24, self, (int)[v46 isCapturing], v30);

  s();
  *(void *)uint64_t v47 = v48;
  *(unsigned char *)(v47 + 8) = BYTE8(v55);
  *(unsigned char *)(v54 + 15) |= 8u;
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  [v11 touch];
  if (v11)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v11];
    }
  }
  [v13 touch];
  if (v13)
  {
    char v16 = self->_retainedObjects;
    if (v16) {
      [(NSMutableSet *)v16 addObject:v13];
    }
  }
  [v14 touch];
  if (v14)
  {
    id v17 = self->_retainedObjects;
    if (v17) {
      [(NSMutableSet *)v17 addObject:v14];
    }
  }
  RetainObjectForDescriptorDownloader(v11, self->_retainedDescriptorObjectsByStreamRef);
  RetainObjectForDescriptorDownloader(v13, self->_retainedDescriptorObjectsByStreamRef);
  RetainAccelerationStructureDescriptorObjects(self->_retainedObjects, self->_retainedDescriptorObjectsByStreamRef, v12);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v52 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v52);
  baseObject = self->_baseObject;
  uint64_t v19 = [v11 baseObject];
  char v20 = unwrapMTLAccelerationStructureDescriptor(v12);
  id v21 = [v13 baseObject];
  id v50 = v14;
  uint64_t v22 = [v14 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject refitAccelerationStructure:v19 descriptor:v20 destination:v21 scratchBuffer:v22 scratchBufferOffset:a7];

  id v51 = v12;
  id v23 = v13;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  LODWORD(baseObject) = [WeakRetained isCapturing];
  unint64_t v25 = ((unint64_t)qword_2501C8 >> 4) & 1;
  captureDevice = self->_captureDevice;
  blitOperations = self->_blitOperations;
  id v28 = [v23 extraRetainedObjects];
  uint64_t v29 = copyCaptureDescriptor(&v51, (int)baseObject, v25, captureDevice, blitOperations, v28, self->_retainedDescriptorObjectsByStreamRef);
  id v30 = v51;

  uint64_t v31 = v53;
  *(_DWORD *)(v53 + 8) = -15638;
  char v32 = BYTE9(v54);
  if (BYTE9(v54) > 0x10uLL)
  {
    uint64_t v34 = *(void *)(*((void *)&v52 + 1) + 24);
    uint64_t v35 = BYTE10(v54);
    ++BYTE10(v54);
    char v33 = GTTraceMemPool_allocateBytes(v34, *((uint64_t *)&v53 + 1), v35 | 0x3000000000) + 16;
    char v32 = v35;
  }
  else
  {
    char v33 = (char *)(v31 + BYTE9(v54));
    BYTE9(v54) += 48;
  }
  *(unsigned char *)(v31 + 13) = v32;
  uint64_t v36 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v36) {
    unint64_t var0 = v36->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v38 = (uint64_t *)[v11 traceStream];
  if (v38) {
    uint64_t v39 = *v38;
  }
  else {
    uint64_t v39 = 0;
  }
  uint64_t v40 = (uint64_t *)[v23 traceStream];
  if (v40) {
    uint64_t v41 = *v40;
  }
  else {
    uint64_t v41 = 0;
  }
  uint64_t v42 = (uint64_t *)[v50 traceStream];
  if (v42) {
    uint64_t v43 = *v42;
  }
  else {
    uint64_t v43 = 0;
  }
  char v44 = SaveMTLAccelerationStructureDescriptor((uint64_t)&v52, v30);
  *(void *)char v33 = var0;
  *((void *)v33 + 1) = v39;
  *((void *)v33 + 2) = v41;
  *((void *)v33 + 3) = v43;
  *((void *)v33 + 4) = a7;
  v33[40] = v44;
  *(_DWORD *)(v33 + 41) = 0;
  *((_DWORD *)v33 + 11) = 0;
  id v45 = objc_loadWeakRetained(location);
  SetCaptureDescriptor(v23, self, (int)[v45 isCapturing], v29);

  s();
  *(void *)uint64_t v46 = v47;
  *(unsigned char *)(v46 + 8) = BYTE8(v54);
  *(unsigned char *)(v53 + 15) |= 8u;
}

- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  [v7 touch];
  if (v7)
  {
    id v9 = self->_retainedObjects;
    if (v9) {
      [(NSMutableSet *)v9 addObject:v7];
    }
  }
  RetainObjectForDescriptorDownloader(v6, self->_retainedDescriptorObjectsByStreamRef);
  RetainObjectForDescriptorDownloader(v7, self->_retainedDescriptorObjectsByStreamRef);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v29);
  baseObject = self->_baseObject;
  id v11 = [v6 baseObject];
  id v12 = [v7 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject copyAndCompactAccelerationStructure:v11 toAccelerationStructure:v12];

  uint64_t v13 = v30;
  *(_DWORD *)(v30 + 8) = -15645;
  char v14 = BYTE9(v31);
  if (BYTE9(v31) > 0x28uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 24);
    uint64_t v17 = BYTE10(v31);
    ++BYTE10(v31);
    id v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v30 + 1), v17 | 0x1800000000) + 16;
    char v14 = v17;
  }
  else
  {
    id v15 = (char *)(v13 + BYTE9(v31));
    BYTE9(v31) += 24;
  }
  *(unsigned char *)(v13 + 13) = v14;
  uint64_t v18 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v20 = (uint64_t *)[v6 traceStream];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v22 = (uint64_t *)[v7 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0;
  }
  *(void *)id v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = v23;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  int v25 = [WeakRetained isCapturing];
  unint64_t v26 = [v6 captureDescriptor];
  SetCaptureDescriptor(v7, self, v25, v26);

  s();
  *(void *)uint64_t v27 = v28;
  *(unsigned char *)(v27 + 8) = BYTE8(v31);
  *(unsigned char *)(v30 + 15) |= 8u;
}

- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      [(NSMutableSet *)retainedObjects addObject:v6];
    }
  }
  [v7 touch];
  if (v7)
  {
    id v9 = self->_retainedObjects;
    if (v9) {
      [(NSMutableSet *)v9 addObject:v7];
    }
  }
  RetainObjectForDescriptorDownloader(v6, self->_retainedDescriptorObjectsByStreamRef);
  RetainObjectForDescriptorDownloader(v7, self->_retainedDescriptorObjectsByStreamRef);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v29);
  baseObject = self->_baseObject;
  id v11 = [v6 baseObject];
  id v12 = [v7 baseObject];
  [(MTLAccelerationStructureCommandEncoderSPI *)baseObject copyAccelerationStructure:v11 toAccelerationStructure:v12];

  uint64_t v13 = v30;
  *(_DWORD *)(v30 + 8) = -15646;
  char v14 = BYTE9(v31);
  if (BYTE9(v31) > 0x28uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 24);
    uint64_t v17 = BYTE10(v31);
    ++BYTE10(v31);
    id v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v30 + 1), v17 | 0x1800000000) + 16;
    char v14 = v17;
  }
  else
  {
    id v15 = (char *)(v13 + BYTE9(v31));
    BYTE9(v31) += 24;
  }
  *(unsigned char *)(v13 + 13) = v14;
  uint64_t v18 = [(CaptureMTLAccelerationStructureCommandEncoder *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v20 = (uint64_t *)[v6 traceStream];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v22 = (uint64_t *)[v7 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0;
  }
  *(void *)id v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = v23;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  int v25 = [WeakRetained isCapturing];
  unint64_t v26 = [v6 captureDescriptor];
  SetCaptureDescriptor(v7, self, v25, v26);

  s();
  *(void *)uint64_t v27 = v28;
  *(unsigned char *)(v27 + 8) = BYTE8(v31);
  *(unsigned char *)(v30 + 15) |= 8u;
}

- (MTLAccelerationStructureCommandEncoder)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLAccelerationStructureCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4 copyEventValue:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CaptureMTLAccelerationStructureCommandEncoder;
  id v11 = [(CaptureMTLAccelerationStructureCommandEncoder *)&v26 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_baseObject, a3);
    uint64_t v13 = [v10 device];
    captureDevice = v12->_captureDevice;
    v12->_captureDevice = (CaptureMTLDevice *)v13;

    objc_storeWeak((id *)&v12->_captureCommandBuffer, v10);
    id v15 = (GTTraceContext *)[v10 traceContext];
    v12->_traceContext = v15;
    uint64_t v16 = DEVICEOBJECT(v9);
    v12->_traceStream = (GTTraceStream *)GTTraceContext_openEncoderStream((uint64_t)v15, (unint64_t)v16, *((void *)[v10 traceStream] + 3));

    uint64_t v17 = [v10 retainedObjects];
    retainedObjects = v12->_retainedObjects;
    v12->_retainedObjects = (NSMutableSet *)v17;

    v12->_uint64_t copyEventValue = a5;
    uint64_t v19 = v12->_retainedObjects;
    char v20 = DEVICEOBJECT(v12->_baseObject);
    [(NSMutableSet *)v19 addObject:v20];

    uint64_t v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    retainedDescriptorObjectsByStreamRef = v12->_retainedDescriptorObjectsByStreamRef;
    v12->_retainedDescriptorObjectsByStreamRef = v21;

    if ((qword_2501C8 & 0x10) != 0)
    {
      uint64_t v23 = objc_opt_new();
      blitOperations = v12->_blitOperations;
      v12->_blitOperations = (NSMutableArray *)v23;
    }
  }

  return v12;
}

@end