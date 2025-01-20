id MTLTexture.makeTextureView(pixelFormat:textureType:levels:slices:)(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;

  if (__OFSUB__(a4, a3))
  {
    __break(1u);
  }
  else if (!__OFSUB__(a6, a5))
  {
    return [v6 newTextureViewWithPixelFormat:result textureType:a2 levels:a3 slices:a4 - a3];
  }
  __break(1u);
  return result;
}

id MTLBlitCommandEncoder.fill(buffer:range:value:)(id result, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (!__OFSUB__(a3, a2)) {
    return [v4 fillBuffer:result range:NSMakeRange(a2, a3 - a2) value:a4];
  }
  __break(1u);
  return result;
}

id MTLBlitCommandEncoder.resetCommandsInBuffer(_:range:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLBlitCommandEncoder.resetCommandsInBuffer(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_resetCommandsInBuffer_withRange_);
}

id MTLBlitCommandEncoder.copyIndirectCommandBuffer(_:sourceRange:destination:destinationIndex:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLBlitCommandEncoder.copyIndirectCommandBuffer(_:sourceRange:destination:destinationIndex:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_);
}

id MTLBlitCommandEncoder.optimizeIndirectCommandBuffer(_:range:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLBlitCommandEncoder.resetCommandsInBuffer(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_optimizeIndirectCommandBuffer_withRange_);
}

id MTLBlitCommandEncoder.resolveCounters(_:range:destinationBuffer:destinationOffset:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLBlitCommandEncoder.copyIndirectCommandBuffer(_:sourceRange:destination:destinationIndex:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_resolveCounters_inRange_destinationBuffer_destinationOffset_);
}

id MTLBlitCommandEncoder.copyIndirectCommandBuffer(_:sourceRange:destination:destinationIndex:)(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, SEL *a7)
{
  if (!__OFSUB__(a3, a2)) {
    return [v7 *a7:result:a2:a3 - a2:a4:a5];
  }
  __break(1u);
  return result;
}

id MTLBuffer.didModifyRange(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  return MTLBuffer.didModifyRange(_:)(a1, a2, a3, (SEL *)&selRef_didModifyRange_);
}

void MTLBuffer.addDebugMarker(_:range:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = MEMORY[0x216682720]();
  if (__OFSUB__(a4, a3))
  {
    __break(1u);
  }
  else
  {
    id v8 = (id)v7;
    [v4 addDebugMarker:range:];
  }
}

uint64_t MTLLogContainer.Iterator.next()()
{
  NSFastEnumerationIterator.next()();
  if (v3)
  {
    outlined init with take of Any(&v2, &v4);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MTLFunctionLog);
    swift_dynamicCast();
    return v1;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v2);
    return 0;
  }
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t protocol witness for IteratorProtocol.next() in conformance MTLLogContainer.Iterator@<X0>(void *a1@<X8>)
{
  NSFastEnumerationIterator.next()();
  if (v6)
  {
    outlined init with take of Any(&v5, &v7);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MTLFunctionLog);
    uint64_t result = swift_dynamicCast();
    uint64_t v3 = v4;
  }
  else
  {
    uint64_t result = outlined destroy of Any?((uint64_t)&v5);
    uint64_t v3 = 0;
  }
  *a1 = v3;
  return result;
}

uint64_t MTLLogContainer.makeIterator()()
{
  swift_unknownObjectRetain();

  return NSFastEnumerationIterator.init(_:)();
}

uint64_t protocol witness for Sequence.makeIterator() in conformance MTLLogContainer()
{
  return NSFastEnumerationIterator.init(_:)();
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance MTLLogContainer()
{
  return 0;
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance MTLLogContainer()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance MTLLogContainer()
{
  uint64_t v0 = specialized _copySequenceToContiguousArray<A>(_:)();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance MTLLogContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance MTLLogContainer()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

id MTLCommandBuffer.logs.getter@<X0>(void *a1@<X8>)
{
  id result = [v1 sel_logs];
  *a1 = result;
  return result;
}

Swift::Void __swiftcall MTLCommandBuffer.useResidencySets(_:)(Swift::OpaquePointer a1)
{
  MTLCommandBuffer.useResidencySets(_:)((unint64_t)a1._rawValue, v1, (SEL *)&selRef_useResidencySets_count_);
}

Swift::Void __swiftcall MTLAccelerationStructureCommandEncoder.useHeaps(_:)(Swift::OpaquePointer a1)
{
  MTLCommandBuffer.useResidencySets(_:)((unint64_t)a1._rawValue, v1, (SEL *)&selRef_useHeaps_count_);
}

uint64_t MTLCommandBuffer.useResidencySets(_:)(unint64_t a1, uint64_t a2, SEL *a3)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if (_CocoaArrayWrapper.endIndex.getter())
    {
      v9 = specialized _copyCollectionToContiguousArray<A>(_:)(a1);
      swift_bridgeObjectRelease();
      uint64_t v7 = (uint64_t)(v9 + 4);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v7 = -8;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v7 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
    swift_bridgeObjectRetain();
  }
  [v3 *a3:v7, v6];

  return swift_unknownObjectRelease();
}

char *MTLVisibleFunctionTable.setFunctions(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setFunctions_withRange_);
}

char *MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(a1, a2, a3, a4, a5, (SEL *)&selRef_setBuffers_offsets_withRange_);
}

char *MTLIntersectionFunctionTable.setFunctions(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setFunctions_withRange_);
}

char *MTLIntersectionFunctionTable.setVisibleFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setVisibleFunctionTables_withBufferRange_);
}

uint64_t MTLAccelerationStructureCommandEncoder.useResources(_:usage:)(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if (_CocoaArrayWrapper.endIndex.getter())
    {
      id v8 = specialized _copyCollectionToContiguousArray<A>(_:)(a1);
      swift_bridgeObjectRelease();
      uint64_t v6 = (uint64_t)(v8 + 4);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v6 = -8;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v6 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
    swift_bridgeObjectRetain();
  }
  [v2 useResources:v6 count:v5 usage:a2];

  return swift_unknownObjectRelease();
}

Swift::Void __swiftcall MTLComputeCommandEncoder.useHeaps(_:)(Swift::OpaquePointer a1)
{
  MTLCommandBuffer.useResidencySets(_:)((unint64_t)a1._rawValue, v1, (SEL *)&selRef_useHeaps_count_);
}

char *MTLComputeCommandEncoder.setBuffers(_:offsets:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(a1, a2, a3, a4, a5, (SEL *)&selRef_setBuffers_offsets_withRange_);
}

char *MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_setBuffers_offsets_attributeStrides_withRange_);
}

char *MTLComputeCommandEncoder.setTextures(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setTextures_withRange_);
}

char *MTLComputeCommandEncoder.setSamplerStates(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setSamplerStates_withRange_);
}

char *MTLComputeCommandEncoder.setSamplerStates(_:lodMinClamps:lodMaxClamps:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_setSamplerStates_lodMinClamps_lodMaxClamps_withRange_);
}

Swift::Void __swiftcall MTLComputeCommandEncoder.memoryBarrier(resources:)(Swift::OpaquePointer resources)
{
  MTLCommandBuffer.useResidencySets(_:)((unint64_t)resources._rawValue, v1, (SEL *)&selRef_memoryBarrierWithResources_count_);
}

char *MTLComputeCommandEncoder.setVisibleFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setVisibleFunctionTables_withBufferRange_);
}

char *MTLComputeCommandEncoder.setIntersectionFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setIntersectionFunctionTables_withBufferRange_);
}

uint64_t MTLDevice.getDefaultSamplePositions(sampleCount:)(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = result;
    if (result)
    {
      type metadata accessor for MTLSamplePosition();
      uint64_t v3 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v3 + 16) = v2;
      bzero((void *)(v3 + 32), 8 * v2);
    }
    else
    {
      uint64_t v3 = MEMORY[0x263F8EE78];
    }
    [v1 sel_getDefaultSamplePositions_count_:v3 + 32, v2];
    return v3;
  }
  return result;
}

Swift::tuple_cpu_UInt64_gpu_UInt64 __swiftcall MTLDevice.sampleTimestamps()()
{
  v5[1] = *MEMORY[0x263EF8340];
  Swift::UInt64 v4 = 0;
  v5[0] = 0;
  [v0 sampleTimestamps:v5 gpuTimestamp:&v4];
  Swift::UInt64 v2 = v4;
  Swift::UInt64 v1 = v5[0];
  result.gpu = v2;
  result.cpu = v1;
  return result;
}

id MTLDevice.makeRenderPipelineState(descriptor:options:)(uint64_t a1, uint64_t a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v10 = 0;
  v11[0] = 0;
  id v3 = [v2 newRenderPipelineStateWithMeshDescriptor:a1 options:a2 reflection:v11 error:&v10];
  Swift::UInt64 v4 = (void *)v11[0];
  if (v3)
  {
    id v5 = v3;
    id v6 = v10;
    id v7 = v4;
  }
  else
  {
    id v5 = v10;
    id v8 = v4;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v5;
}

uint64_t MTLCounterSampleBuffer.resolveCounterRange(_:)(uint64_t result, uint64_t a2)
{
  if (__OFSUB__(a2, result))
  {
    __break(1u);
  }
  else
  {
    id v3 = [v2 sel_resolveCounterRange_:result, a2 - result];
    if (!v3) {
      return 0;
    }
    Swift::UInt64 v4 = v3;
    uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

    return v5;
  }
  return result;
}

MTLIOCompressionContext MTLIOCreateCompressionContext(_:_:_:)(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafeMutableRawPointer?);
    _StringGuts._slowWithCString<A>(_:)();
    return *(MTLIOCompressionContext *)path;
  }
  else
  {
    MEMORY[0x270FA5388]();
    if ((a2 & 0x2000000000000000) != 0)
    {
      *(void *)path = a1;
      uint64_t v10 = a2 & 0xFFFFFFFFFFFFFFLL;
      return MTLIOCreateCompressionContext(path, v4, v5);
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v6 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v6 = _StringObject.sharedUTF8.getter();
      }
      return (MTLIOCompressionContext)_sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5SvSg_Tg507_sSRys4f5VGxs5E36_pIgyrzo_ACxsAD_pIegyrzr_lTRSvSg_TG5SRyAGGAKsAD_pIgyrzo_Tf1cn_n(v6, v7, (uint64_t (*)(void))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:));
    }
  }
}

id MTLFunctionConstantValues.setConstantValues(_:type:range:)(id result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!__OFSUB__(a4, a3)) {
    return [v4 setConstantValues:result type:a2 withRange:a3 - a3];
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall MTLResidencySet.addAllocations(_:)(Swift::OpaquePointer a1)
{
  MTLCommandBuffer.useResidencySets(_:)((unint64_t)a1._rawValue, v1, (SEL *)&selRef_addAllocations_count_);
}

Swift::Void __swiftcall MTLResidencySet.removeAllocations(_:)(Swift::OpaquePointer a1)
{
  MTLCommandBuffer.useResidencySets(_:)((unint64_t)a1._rawValue, v1, (SEL *)&selRef_removeAllocations_count_);
}

Swift::Void __swiftcall MTLCommandQueue.addResidencySets(_:)(Swift::OpaquePointer a1)
{
  MTLCommandBuffer.useResidencySets(_:)((unint64_t)a1._rawValue, v1, (SEL *)&selRef_addResidencySets_count_);
}

Swift::Void __swiftcall MTLCommandQueue.removeResidencySets(_:)(Swift::OpaquePointer a1)
{
  MTLCommandBuffer.useResidencySets(_:)((unint64_t)a1._rawValue, v1, (SEL *)&selRef_removeResidencySets_count_);
}

char *MTLArgumentEncoder.setBuffers(_:offsets:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(a1, a2, a3, a4, a5, (SEL *)&selRef_setBuffers_offsets_withRange_);
}

char *MTLArgumentEncoder.setTextures(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setTextures_withRange_);
}

char *MTLArgumentEncoder.setSamplerStates(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setSamplerStates_withRange_);
}

char *MTLArgumentEncoder.setRenderPipelineStates(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setRenderPipelineStates_withRange_);
}

char *MTLArgumentEncoder.setIndirectCommandBuffers(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setIndirectCommandBuffers_withRange_);
}

char *MTLArgumentEncoder.setVisibleFunctionTables(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setVisibleFunctionTables_withRange_);
}

char *MTLArgumentEncoder.setIntersectionFunctionTables(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setIntersectionFunctionTables_withRange_);
}

Swift::Void __swiftcall MTLRenderCommandEncoder.useHeaps(_:)(Swift::OpaquePointer a1)
{
  MTLCommandBuffer.useResidencySets(_:)((unint64_t)a1._rawValue, v1, (SEL *)&selRef_useHeaps_count_);
}

Swift::Void __swiftcall MTLRenderCommandEncoder.setViewports(_:)(Swift::OpaquePointer a1)
{
  [v1 setViewports:a1._rawValue + 32 count:*((void *)a1._rawValue + 2)];
}

Swift::Void __swiftcall MTLRenderCommandEncoder.setScissorRects(_:)(Swift::OpaquePointer a1)
{
  [v1 setScissorRects:a1._rawValue + 32 count:*((void *)a1._rawValue + 2)];
}

char *MTLRenderCommandEncoder.setVertexBuffers(_:offsets:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(a1, a2, a3, a4, a5, (SEL *)&selRef_setVertexBuffers_offsets_withRange_);
}

char *MTLRenderCommandEncoder.setVertexBuffers(_:offsets:attributeStrides:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_setVertexBuffers_offsets_attributeStrides_withRange_);
}

char *MTLRenderCommandEncoder.setVertexTextures(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setVertexTextures_withRange_);
}

char *MTLRenderCommandEncoder.setVertexSamplerStates(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setVertexSamplerStates_withRange_);
}

char *MTLRenderCommandEncoder.setVertexSamplerStates(_:lodMinClamps:lodMaxClamps:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_);
}

char *MTLRenderCommandEncoder.setFragmentBuffers(_:offsets:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(a1, a2, a3, a4, a5, (SEL *)&selRef_setFragmentBuffers_offsets_withRange_);
}

char *MTLRenderCommandEncoder.setFragmentTextures(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setFragmentTextures_withRange_);
}

char *MTLRenderCommandEncoder.setFragmentSamplerStates(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setFragmentSamplerStates_withRange_);
}

char *MTLRenderCommandEncoder.setFragmentSamplerStates(_:lodMinClamps:lodMaxClamps:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_);
}

char *MTLRenderCommandEncoder.setTileBuffers(_:offsets:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(a1, a2, a3, a4, a5, (SEL *)&selRef_setTileBuffers_offsets_withRange_);
}

char *MTLRenderCommandEncoder.setTileTextures(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setTileTextures_withRange_);
}

char *MTLRenderCommandEncoder.setTileSamplerStates(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setTileSamplerStates_withRange_);
}

char *MTLRenderCommandEncoder.setTileSamplerStates(_:lodMinClamps:lodMaxClamps:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange_);
}

char *MTLRenderCommandEncoder.setObjectBuffers(_:offsets:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(a1, a2, a3, a4, a5, (SEL *)&selRef_setObjectBuffers_offsets_withRange_);
}

char *MTLRenderCommandEncoder.setObjectTextures(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setObjectTextures_withRange_);
}

char *MTLRenderCommandEncoder.setObjectSamplerStates(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setObjectSamplerStates_withRange_);
}

char *MTLRenderCommandEncoder.setObjectSamplerStates(_:lodMinClamps:lodMaxClamps:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange_);
}

char *MTLRenderCommandEncoder.setMeshBuffers(_:offsets:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(a1, a2, a3, a4, a5, (SEL *)&selRef_setMeshBuffers_offsets_withRange_);
}

char *MTLIntersectionFunctionTable.setBuffers(_:offsets:range:)(char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, SEL *a6)
{
  if (!__OFSUB__(a4, a3)) {
    return (char *)[v6 *a6:result + 32:a2 + 32:a3:a4 - a3];
  }
  __break(1u);
  return result;
}

char *MTLRenderCommandEncoder.setMeshTextures(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setMeshTextures_withRange_);
}

char *MTLRenderCommandEncoder.setMeshSamplerStates(_:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setMeshSamplerStates_withRange_);
}

char *MTLRenderCommandEncoder.setMeshSamplerStates(_:lodMinClamps:lodMaxClamps:range:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(a1, a2, a3, a4, a5, a6, (SEL *)&selRef_setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange_);
}

char *MTLComputeCommandEncoder.setBuffers(_:offsets:attributeStrides:range:)(char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, SEL *a7)
{
  if (!__OFSUB__(a5, a4)) {
    return (char *)[v7 *a7:result + 32, a2 + 32, a3 + 32, a4, a5 - a4];
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall MTLRenderCommandEncoder.memoryBarrier(resources:after:before:)(Swift::OpaquePointer resources, MTLRenderStages after, MTLRenderStages before)
{
  MTLIOCompressionMethod v4 = v3;
  if ((unint64_t)resources._rawValue >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if (_CocoaArrayWrapper.endIndex.getter())
    {
      uint64_t v10 = specialized _copyCollectionToContiguousArray<A>(_:)((unint64_t)resources._rawValue);
      swift_bridgeObjectRelease();
      unint64_t v9 = (unint64_t)(v10 + 4);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      unint64_t v9 = -8;
    }
  }
  else
  {
    uint64_t v8 = *(void *)(((unint64_t)resources._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    unint64_t v9 = ((unint64_t)resources._rawValue & 0xFFFFFFFFFFFFFF8) + 32;
    swift_bridgeObjectRetain();
  }
  [v4 memoryBarrierWithResources:v9 count:v8 afterStages:after beforeStages:before];

  swift_unknownObjectRelease();
}

id MTLRenderCommandEncoder.executeCommandsInBuffer(_:range:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLBlitCommandEncoder.resetCommandsInBuffer(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_executeCommandsInBuffer_withRange_);
}

id MTLBlitCommandEncoder.resetCommandsInBuffer(_:range:)(id result, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  if (!__OFSUB__(a3, a2)) {
    return [v5 *a5:result:a2:a3 - a2];
  }
  __break(1u);
  return result;
}

char *MTLRenderCommandEncoder.setVertexVisibleFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setVertexVisibleFunctionTables_withBufferRange_);
}

char *MTLRenderCommandEncoder.setFragmentVisibleFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setFragmentVisibleFunctionTables_withBufferRange_);
}

char *MTLRenderCommandEncoder.setTileVisibleFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setTileVisibleFunctionTables_withBufferRange_);
}

char *MTLRenderCommandEncoder.setVertexIntersectionFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setVertexIntersectionFunctionTables_withBufferRange_);
}

char *MTLRenderCommandEncoder.setFragmentIntersectionFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setFragmentIntersectionFunctionTables_withBufferRange_);
}

char *MTLRenderCommandEncoder.setTileIntersectionFunctionTables(_:bufferRange:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MTLVisibleFunctionTable.setFunctions(_:range:)(a1, a2, a3, a4, (SEL *)&selRef_setTileIntersectionFunctionTables_withBufferRange_);
}

char *MTLVisibleFunctionTable.setFunctions(_:range:)(char *result, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  if (!__OFSUB__(a3, a2)) {
    return (char *)[v5 *a5:result + 32:a2:a3 - a2];
  }
  __break(1u);
  return result;
}

id MTLIndirectCommandBuffer.reset(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  return MTLBuffer.didModifyRange(_:)(a1, a2, a3, (SEL *)&selRef_resetWithRange_);
}

id MTLBuffer.didModifyRange(_:)(id result, uint64_t a2, uint64_t a3, SEL *a4)
{
  if (!__OFSUB__(a2, result)) {
    return [v4 *a4:result, a2 - (void)result];
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall MTLRenderPassDescriptor.setSamplePositions(_:)(Swift::OpaquePointer a1)
{
  [v1 setSamplePositions:a1._rawValue + 32 count:*((void *)a1._rawValue + 2)];
}

uint64_t MTLRenderPassDescriptor.getSamplePositions()()
{
  uint64_t result = (uint64_t)[v0 sel_getSamplePositions_count_:0:0];
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = result;
    if (result)
    {
      type metadata accessor for MTLSamplePosition();
      uint64_t v3 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v3 + 16) = v2;
      bzero((void *)(v3 + 32), 8 * v2);
    }
    else
    {
      uint64_t v3 = MEMORY[0x263F8EE78];
    }
    [v0 sel_getSamplePositions_count_:v3 + 32, v2];
    return v3;
  }
  return result;
}

id MTLTexture.makeTextureView(pixelFormat:textureType:levels:slices:swizzle:)(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  if (__OFSUB__(a4, a3))
  {
    __break(1u);
  }
  else if (!__OFSUB__(a6, a5))
  {
    return [v7 newTextureViewWithPixelFormat:result textureType:a2 levels:a3 slices:a4 - a3 swizzle:a5];
  }
  __break(1u);
  return result;
}

float MTLRasterizationRateSampleArray.subscript.getter(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = 0;
  uint64_t v3 = (float *)[v1 __getRawArray:v5];
  float result = 0.0;
  if ((a1 & 0x8000000000000000) == 0 && v5[0] > a1) {
    return v3[a1];
  }
  return result;
}

_DWORD *key path getter for MTLRasterizationRateSampleArray.subscript(_:) : MTLRasterizationRateSampleArray@<X0>(void **a1@<X0>, uint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  v8[1] = *MEMORY[0x263EF8340];
  MTLIOCompressionMethod v4 = *a1;
  uint64_t v5 = *a2;
  v8[0] = 0;
  float result = [v4 _getRawArray:v8];
  int v7 = 0;
  if ((v5 & 0x8000000000000000) == 0 && v5 < v8[0]) {
    int v7 = result[v5];
  }
  *a3 = v7;
  return result;
}

_DWORD *key path setter for MTLRasterizationRateSampleArray.subscript(_:) : MTLRasterizationRateSampleArray(int *a1, void **a2, uint64_t *a3)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *a3;
  int v4 = *a1;
  uint64_t v5 = *a2;
  v7[0] = 0;
  float result = [v5 _getRawArray:v7];
  if ((v3 & 0x8000000000000000) == 0 && v3 < v7[0]) {
    result[v3] = v4;
  }
  return result;
}

float *MTLRasterizationRateSampleArray.subscript.setter(uint64_t a1, float a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  v6[0] = 0;
  float result = (float *)[v2 _getRawArray:v6];
  if ((a1 & 0x8000000000000000) == 0 && v6[0] > a1) {
    result[a1] = a2;
  }
  return result;
}

_DWORD *(*MTLRasterizationRateSampleArray.subscript.modify(uint64_t a1, uint64_t a2))(uint64_t a1)
{
  uint64_t v3 = v2;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = v3;
  *(void *)a1 = 0;
  uint64_t v6 = [v3 _getRawArray:a1];
  int v7 = 0;
  if ((a2 & 0x8000000000000000) == 0 && *(void *)a1 > a2) {
    int v7 = v6[a2];
  }
  *(_DWORD *)(a1 + 24) = v7;
  return MTLRasterizationRateSampleArray.subscript.modify;
}

_DWORD *MTLRasterizationRateSampleArray.subscript.modify(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 24);
  uint64_t v3 = *(void **)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 8);
  *(void *)a1 = 0;
  float result = [v3 _getRawArray:a1];
  if ((v4 & 0x8000000000000000) == 0 && *(void *)a1 > v4) {
    result[*(void *)(a1 + 8)] = v2;
  }
  return result;
}

MTLRasterizationRateLayerDescriptor __swiftcall MTLRasterizationRateLayerDescriptor.init(horizontal:vertical:)(Swift::OpaquePointer horizontal, Swift::OpaquePointer vertical)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  MTLSizeMake(*((void *)horizontal._rawValue + 2), *((void *)vertical._rawValue + 2), &v7);
  id v5 = [v4 initWithSampleCount:&v7 horizontal:horizontal._rawValue vertical:vertical._rawValue];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (MTLRasterizationRateLayerDescriptor)v5;
}

MTLRasterizationRateMapDescriptor __swiftcall MTLRasterizationRateMapDescriptor.init(screenSize:label:)(MTLSize screenSize, Swift::String_optional label)
{
  object = label.value._object;
  uint64_t countAndFlagsBits = label.value._countAndFlagsBits;
  MTLSize v8 = screenSize;
  id v4 = [swift_getObjCClassFromMetadata() rasterizationRateMapDescriptorWithScreenSize:&v8];
  id v5 = v4;
  if (object)
  {
    uint64_t v6 = (void *)MEMORY[0x216682720](countAndFlagsBits, object);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  [v4 setLabel:v6];

  return (MTLRasterizationRateMapDescriptor)v4;
}

MTLRasterizationRateMapDescriptor __swiftcall MTLRasterizationRateMapDescriptor.init(screenSize:layer:label:)(MTLSize screenSize, MTLRasterizationRateLayerDescriptor layer, Swift::String_optional label)
{
  object = label.value._object;
  uint64_t countAndFlagsBits = label.value._countAndFlagsBits;
  MTLSize v10 = screenSize;
  id v6 = [swift_getObjCClassFromMetadata() rasterizationRateMapDescriptorWithScreenSize:&v10 layer:layer.super.isa];
  id v7 = v6;
  if (object)
  {
    MTLSize v8 = (void *)MEMORY[0x216682720](countAndFlagsBits, object);
    swift_bridgeObjectRelease();
  }
  else
  {
    MTLSize v8 = 0;
  }
  [v6 setLabel:v8];

  return (MTLRasterizationRateMapDescriptor)v6;
}

MTLRasterizationRateMapDescriptor __swiftcall MTLRasterizationRateMapDescriptor.init(screenSize:layers:label:)(MTLSize screenSize, Swift::OpaquePointer layers, Swift::String_optional label)
{
  object = label.value._object;
  uint64_t countAndFlagsBits = label.value._countAndFlagsBits;
  NSUInteger depth = screenSize.depth;
  NSUInteger height = screenSize.height;
  NSUInteger width = screenSize.width;
  if (!((unint64_t)layers._rawValue >> 62))
  {
    unint64_t v9 = (unint64_t)layers._rawValue & 0xFFFFFFFFFFFFFF8;
    uint64_t v10 = *(void *)(((unint64_t)layers._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
    uint64_t v11 = v9 + 32;
    goto LABEL_4;
  }
  uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRetain();
  if (_CocoaArrayWrapper.endIndex.getter())
  {
    unint64_t v9 = (unint64_t)specialized _copyCollectionToContiguousArray<A>(_:)((unint64_t)layers._rawValue);
    swift_bridgeObjectRelease_n();
    goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = -8;
LABEL_4:
  v16[0] = width;
  v16[1] = height;
  v16[2] = depth;
  id v12 = [swift_getObjCClassFromMetadata() rasterizationRateMapDescriptorWithScreenSize:v16 layerCount:v10 layers:v11];
  swift_unknownObjectRelease();
  id v13 = v12;
  if (object)
  {
    v14 = (void *)MEMORY[0x216682720](countAndFlagsBits, object);
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  [v12 setLabel:v14];

  return (MTLRasterizationRateMapDescriptor)v12;
}

uint64_t specialized _copySequenceToContiguousArray<A>(_:)()
{
  type metadata accessor for MTLLogContainer.Iterator();
  MEMORY[0x270FA5388]();
  uint64_t v1 = (char *)v21 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain();
  NSFastEnumerationIterator.init(_:)();
  NSFastEnumerationIterator.next()();
  int v2 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = 0;
  if (v23)
  {
    id v4 = (void *)(MEMORY[0x263F8EE78] + 32);
    while (1)
    {
      outlined init with take of Any(&v22, &v24);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MTLFunctionLog);
      uint64_t result = swift_dynamicCast();
      uint64_t v6 = v21[1];
      if (!v3)
      {
        unint64_t v7 = v2[3];
        if ((uint64_t)((v7 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_23;
        }
        int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
        if (v8 <= 1) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = v8;
        }
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
        uint64_t v10 = (void *)swift_allocObject();
        int64_t v11 = _swift_stdlib_malloc_size(v10);
        uint64_t v12 = v11 - 32;
        if (v11 < 32) {
          uint64_t v12 = v11 - 25;
        }
        uint64_t v13 = v12 >> 3;
        v10[2] = v9;
        v10[3] = (2 * (v12 >> 3)) | 1;
        unint64_t v14 = (unint64_t)(v10 + 4);
        uint64_t v15 = v2[3] >> 1;
        if (v2[2])
        {
          v16 = v2 + 4;
          if (v10 != v2 || v14 >= (unint64_t)v16 + 8 * v15) {
            memmove(v10 + 4, v16, 8 * v15);
          }
          v2[2] = 0;
        }
        id v4 = (void *)(v14 + 8 * v15);
        uint64_t v3 = (v13 & 0x7FFFFFFFFFFFFFFFLL) - v15;
        uint64_t result = swift_release();
        int v2 = v10;
      }
      BOOL v17 = __OFSUB__(v3--, 1);
      if (v17) {
        break;
      }
      *v4++ = v6;
      NSFastEnumerationIterator.next()();
      if (!v23) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
LABEL_18:
  outlined destroy of Any?((uint64_t)&v22);
  uint64_t result = outlined destroy of MTLLogContainer.Iterator((uint64_t)v1);
  unint64_t v18 = v2[3];
  if (v18 < 2) {
    return (uint64_t)v2;
  }
  unint64_t v19 = v18 >> 1;
  BOOL v17 = __OFSUB__(v19, v3);
  uint64_t v20 = v19 - v3;
  if (!v17)
  {
    v2[2] = v20;
    return (uint64_t)v2;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for MTLLogContainer.Iterator();
  MEMORY[0x270FA5388]();
  unint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = NSFastEnumerationIterator.init(_:)();
  if (!a2)
  {
    a3 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_12:
    outlined init with take of MTLLogContainer.Iterator((uint64_t)v7, a1);
    return a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    NSFastEnumerationIterator.next()();
    if (v12)
    {
      uint64_t v9 = 0;
      while (1)
      {
        outlined init with take of Any(&v11, &v13);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MTLFunctionLog);
        swift_dynamicCast();
        *(void *)(a2 + 8 * v9) = v10[1];
        if (a3 - 1 == v9) {
          break;
        }
        NSFastEnumerationIterator.next()();
        ++v9;
        if (!v12) {
          goto LABEL_11;
        }
      }
    }
    else
    {
      uint64_t v9 = 0;
LABEL_11:
      outlined destroy of Any?((uint64_t)&v11);
      a3 = v9;
    }
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5SvSg_Tg507_sSRys4f5VGxs5E36_pIgyrzo_ACxsAD_pIegyrzr_lTRSvSg_TG5SRyAGGAKsAD_pIgyrzo_Tf1cn_n(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (!v3) {
    return v5;
  }
  return result;
}

void type metadata accessor for MTLSamplePosition()
{
  if (!lazy cache variable for type metadata for MTLSamplePosition)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for MTLSamplePosition);
    }
  }
}

MTLIOCompressionContext partial apply for closure #1 in MTLIOCreateCompressionContext(_:_:_:)@<X0>(const char *a1@<X0>, void *a2@<X8>)
{
  MTLIOCompressionContext result = MTLIOCreateCompressionContext(a1, *(MTLIOCompressionMethod *)(v2 + 16), *(void *)(v2 + 24));
  *a2 = result;
  return result;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    MEMORY[0x216682760](v3 + 4, v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

void *partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:)@<X0>(void *a1@<X8>)
{
  MTLIOCompressionContext result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t MTLSizeMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  a3[2] = 0;
  return result;
}

unint64_t lazy protocol witness table accessor for type MTLLogContainer.Iterator and conformance MTLLogContainer.Iterator()
{
  unint64_t result = lazy protocol witness table cache variable for type MTLLogContainer.Iterator and conformance MTLLogContainer.Iterator;
  if (!lazy protocol witness table cache variable for type MTLLogContainer.Iterator and conformance MTLLogContainer.Iterator)
  {
    type metadata accessor for MTLLogContainer.Iterator();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MTLLogContainer.Iterator and conformance MTLLogContainer.Iterator);
  }
  return result;
}

uint64_t type metadata accessor for MTLLogContainer.Iterator()
{
  uint64_t result = type metadata singleton initialization cache for MTLLogContainer.Iterator;
  if (!type metadata singleton initialization cache for MTLLogContainer.Iterator) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21281749C()
{
  return 0;
}

ValueMetadata *type metadata accessor for MTLLogContainer()
{
  return &type metadata for MTLLogContainer;
}

uint64_t initializeBufferWithCopyOfBuffer for MTLLogContainer.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NSFastEnumerationIterator();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for MTLLogContainer.Iterator(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NSFastEnumerationIterator();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for MTLLogContainer.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NSFastEnumerationIterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for MTLLogContainer.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NSFastEnumerationIterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for MTLLogContainer.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NSFastEnumerationIterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for MTLLogContainer.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NSFastEnumerationIterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for MTLLogContainer.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_212817730);
}

uint64_t sub_212817730(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NSFastEnumerationIterator();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for MTLLogContainer.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2128177B0);
}

uint64_t sub_2128177B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NSFastEnumerationIterator();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata completion function for MTLLogContainer.Iterator()
{
  uint64_t result = type metadata accessor for NSFastEnumerationIterator();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *__swift_memcpy8_4(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MTLSamplePosition(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MTLSamplePosition(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 8) = v3;
  return result;
}

uint64_t outlined init with take of MTLLogContainer.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MTLLogContainer.Iterator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of MTLLogContainer.Iterator(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MTLLogContainer.Iterator();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t NSFastEnumerationIterator.next()()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t NSFastEnumerationIterator.init(_:)()
{
  return MEMORY[0x270EEFA28]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D968]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x270F9E988]();
}

uint64_t specialized _ArrayBuffer._copyContents(initializing:)()
{
  return MEMORY[0x270F9EA28]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

MTLIOCompressionContext MTLIOCreateCompressionContext(const char *path, MTLIOCompressionMethod type, size_t chunkSize)
{
  return (MTLIOCompressionContext)MEMORY[0x270EF5EB0](path, type, chunkSize);
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}