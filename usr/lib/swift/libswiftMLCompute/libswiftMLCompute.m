void MLCEmbeddingDescriptor.embeddingCount.getter()
{
  MLCEmbeddingDescriptor.embeddingCount.getter((SEL *)&selRef_embeddingCount);
}

void MLCEmbeddingDescriptor.embeddingDimension.getter()
{
}

void MLCEmbeddingDescriptor.embeddingCount.getter(SEL *a1)
{
  id v2 = [v1 *a1];
  Int.init(exactly:)();
  char v4 = v3;

  if (v4) {
    __break(1u);
  }
}

uint64_t MLCEmbeddingDescriptor.paddingIndex.getter()
{
  id v1 = [v0 sel_paddingIndex];
  if (!v1) {
    return 0;
  }
  uint64_t result = Int.init(exactly:)();
  if ((v3 & 1) == 0)
  {
    uint64_t v4 = result;

    return v4;
  }
  __break(1u);
  return result;
}

uint64_t MLCEmbeddingDescriptor.maximumNorm.getter()
{
  return MLCEmbeddingDescriptor.maximumNorm.getter((SEL *)&selRef_maximumNorm);
}

uint64_t MLCEmbeddingDescriptor.pNorm.getter()
{
  return MLCEmbeddingDescriptor.maximumNorm.getter((SEL *)&selRef_pNorm);
}

uint64_t MLCEmbeddingDescriptor.maximumNorm.getter(SEL *a1)
{
  id v2 = [v1 *a1];
  if (!v2)
  {
    uint64_t v5 = 0;
    return v5 | ((unint64_t)(v2 == 0) << 32);
  }
  uint64_t result = Float.init(exactly:)();
  if ((result & 0x100000000) == 0)
  {
    unsigned int v4 = result;

    uint64_t v5 = v4;
    return v5 | ((unint64_t)(v2 == 0) << 32);
  }
  __break(1u);
  return result;
}

MLCEmbeddingDescriptor_optional __swiftcall MLCEmbeddingDescriptor.init(embeddingCount:embeddingDimension:)(Swift::Int embeddingCount, Swift::Int embeddingDimension)
{
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  Class v4 = Int._bridgeToObjectiveC()().super.super.isa;
  uint64_t v5 = (objc_class *)[ObjCClassFromMetadata sel_descriptorWithEmbeddingCount_embeddingDimension_:isa, v4];

  v7 = v5;
  result.value.super.Class isa = v7;
  result.is_nil = v6;
  return result;
}

MLCEmbeddingDescriptor_optional __swiftcall MLCEmbeddingDescriptor.init(embeddingCount:embeddingDimension:paddingIndex:maximumNorm:pNorm:scalesGradientByFrequency:)(Swift::Int embeddingCount, Swift::Int embeddingDimension, Swift::Int_optional paddingIndex, Swift::Float_optional *maximumNorm, Swift::Float_optional *pNorm, Swift::Bool scalesGradientByFrequency)
{
  Swift::Bool is_nil = paddingIndex.is_nil;
  v10.super.super.Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  v11.super.super.Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  if (!is_nil)
  {
    v12.super.super.Class isa = Int._bridgeToObjectiveC()().super.super.isa;
    if (((unint64_t)maximumNorm & 0x100000000) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    Class isa = Float._bridgeToObjectiveC()().super.super.isa;
    if (((unint64_t)pNorm & 0x100000000) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    Class v14 = Float._bridgeToObjectiveC()().super.super.isa;
    goto LABEL_8;
  }
  v12.super.super.Class isa = 0;
  if (((unint64_t)maximumNorm & 0x100000000) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  Class isa = 0;
  if (((unint64_t)pNorm & 0x100000000) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  Class v14 = 0;
LABEL_8:
  v15 = (objc_class *)[swift_getObjCClassFromMetadata() descriptorWithEmbeddingCount:v10.super.super.isa embeddingDimension:v11.super.super.isa paddingIndex:v12.super.super.isa isa:isa embeddingDimension:v14 scalesGradientByFrequency:scalesGradientByFrequency];

  v17 = v15;
  result.value.super.Class isa = v17;
  result.Swift::Bool is_nil = v16;
  return result;
}

MLCPaddingLayer __swiftcall MLCPaddingLayer.init(reflectionPadding:)(Swift::OpaquePointer reflectionPadding)
{
  return (MLCPaddingLayer)MLCPaddingLayer.init(reflectionPadding:)((uint64_t)reflectionPadding._rawValue, (SEL *)&selRef_layerWithReflectionPadding_);
}

uint64_t specialized _arrayForceCast<A, B>(_:)(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    uint64_t v2 = v9;
    uint64_t v4 = a1 + 32;
    do
    {
      v4 += 8;
      v5.super.super.Class isa = Int._bridgeToObjectiveC()().super.super.isa;
      unint64_t v7 = *(void *)(v9 + 16);
      unint64_t v6 = *(void *)(v9 + 24);
      if (v7 >= v6 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v6 > 1), v7 + 1, 1);
      }
      *(void *)(v9 + 16) = v7 + 1;
      *(NSNumber *)(v9 + 8 * v7 + 32) = v5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

unint64_t type metadata accessor for NSNumber()
{
  unint64_t result = lazy cache variable for type metadata for NSNumber;
  if (!lazy cache variable for type metadata for NSNumber)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  }
  return result;
}

MLCPaddingLayer __swiftcall MLCPaddingLayer.init(symmetricPadding:)(Swift::OpaquePointer symmetricPadding)
{
  return (MLCPaddingLayer)MLCPaddingLayer.init(reflectionPadding:)((uint64_t)symmetricPadding._rawValue, (SEL *)&selRef_layerWithSymmetricPadding_);
}

MLCPaddingLayer __swiftcall MLCPaddingLayer.init(zeroPadding:)(Swift::OpaquePointer zeroPadding)
{
  return (MLCPaddingLayer)MLCPaddingLayer.init(reflectionPadding:)((uint64_t)zeroPadding._rawValue, (SEL *)&selRef_layerWithZeroPadding_);
}

id MLCPaddingLayer.init(reflectionPadding:)(uint64_t a1, SEL *a2)
{
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)(a1);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [ObjCClassFromMetadata *a2];

  return v6;
}

MLCPaddingLayer __swiftcall MLCPaddingLayer.init(constantPadding:constantValue:)(Swift::OpaquePointer constantPadding, Swift::Float constantValue)
{
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)constantPadding._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(Swift::Float *)&double v6 = constantValue;
  id v7 = [ObjCClassFromMetadata layerWithConstantPadding:isa constantValue:v6];

  return (MLCPaddingLayer)v7;
}

uint64_t MLCLayerNormalizationLayer.normalizedShape.getter()
{
  id v1 = [v0 sel_normalizedShape];
  type metadata accessor for NSNumber();
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62) {
    goto LABEL_15;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      uint64_t v13 = MEMORY[0x263F8EE78];
      uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
      if (v3 < 0) {
        break;
      }
      unint64_t v5 = 0;
      uint64_t v6 = v13;
      while (v3 != v5)
      {
        if ((v2 & 0xC000000000000001) != 0) {
          id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
        }
        else {
          id v7 = *(id *)(v2 + 8 * v5 + 32);
        }
        v8 = v7;
        uint64_t result = Int.init(exactly:)();
        if (v9) {
          goto LABEL_19;
        }
        uint64_t v10 = result;

        unint64_t v12 = *(void *)(v13 + 16);
        unint64_t v11 = *(void *)(v13 + 24);
        if (v12 >= v11 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
        }
        ++v5;
        *(void *)(v13 + 16) = v12 + 1;
        *(void *)(v13 + 8 * v12 + 32) = v10;
        if (v3 == v5)
        {
          swift_bridgeObjectRelease();
          return v6;
        }
      }
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v3) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return result;
}

MLCLayerNormalizationLayer_optional __swiftcall MLCLayerNormalizationLayer.init(normalizedShape:beta:gamma:varianceEpsilon:)(Swift::OpaquePointer normalizedShape, MLCTensor beta, MLCTensor gamma, Swift::Float varianceEpsilon)
{
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)normalizedShape._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(Swift::Float *)&double v10 = varianceEpsilon;
  unint64_t v11 = (objc_class *)[ObjCClassFromMetadata layerWithNormalizedShape:isa beta:beta.super.isa gamma:gamma.super.isa varianceEpsilon:v10];

  uint64_t v13 = v11;
  result.value.super.super.Class isa = v13;
  result.Swift::Bool is_nil = v12;
  return result;
}

MLCLayerNormalizationLayer_optional __swiftcall MLCLayerNormalizationLayer.init(normalizedShape:beta:gamma:varianceEpsilon:)(Swift::OpaquePointer normalizedShape, MLCTensor_optional beta, MLCTensor_optional gamma, Swift::Float varianceEpsilon)
{
  unint64_t v5 = *(void **)&beta.is_nil;
  Class isa = beta.value.super.isa;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)normalizedShape._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class v9 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(Swift::Float *)&double v10 = varianceEpsilon;
  unint64_t v11 = (objc_class *)[ObjCClassFromMetadata layerWithNormalizedShape:v9 beta:isa gamma:v5 varianceEpsilon:v10];

  uint64_t v13 = v11;
  result.value.super.super.Class isa = v13;
  result.Swift::Bool is_nil = v12;
  return result;
}

void *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(void *a1, int64_t a2, char a3)
{
  MLCLayerNormalizationLayer_optional result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  MLCLayerNormalizationLayer_optional result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    double v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = (2 * (v12 >> 3)) | 1;
  }
  else
  {
    double v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    type metadata accessor for NSNumber();
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
    double v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    double v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  Class v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)(unint64_t a1, unint64_t a2)
{
  type metadata accessor for NSNumber();
  if (a2 >> 62)
  {
    uint64_t v4 = _CocoaArrayWrapper.subscript.getter();
    self;
    if (swift_dynamicCastObjCClass()) {
      return v4;
    }
LABEL_10:
    _StringGuts.grow(_:)(85);
    unint64_t v6 = 0xD000000000000046;
    unint64_t v5 = 0x8000000225AD0180;
    goto LABEL_11;
  }
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a1)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 0x20);
  swift_unknownObjectRetain();
  self;
  if (swift_dynamicCastObjCClass()) {
    return v4;
  }
  _StringGuts.grow(_:)(82);
  unint64_t v5 = 0x8000000225AD0130;
  unint64_t v6 = 0xD000000000000043;
LABEL_11:
  String.append(_:)(*(Swift::String *)&v6);
  v8._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 0x756F662074756220;
  v9._object = (void *)0xEB0000000020646ELL;
  String.append(_:)(v9);
  swift_getObjectType();
  swift_unknownObjectRelease();
  v10._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v10);
  swift_bridgeObjectRelease();
  uint64_t result = _assertionFailure(_:_:flags:)();
  __break(1u);
  return result;
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

uint64_t MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[17] = a6;
  v7[18] = v6;
  v7[15] = a4;
  v7[16] = a5;
  v7[13] = a2;
  v7[14] = a3;
  v7[12] = a1;
  return MEMORY[0x270FA2498](MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:), 0, 0);
}

uint64_t MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:)()
{
  uint64_t v2 = v0[17];
  id v1 = (void *)v0[18];
  uint64_t v4 = (objc_class *)v0[15];
  uint64_t v3 = v0[16];
  uint64_t v6 = (objc_class *)v0[13];
  unint64_t v5 = (objc_class *)v0[14];
  uint64_t v7 = v0[12];
  v0[2] = v0;
  v0[7] = v0 + 10;
  v0[3] = MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:);
  uint64_t v8 = swift_continuation_init();
  closure #1 in MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:)(v8, v1, v7, v6, v5, v4, v3, v2);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:)(__n128 a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 48))
  {
    swift_willThrow();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    uint64_t v6 = *(void *)(v2 + 80);
    a1.n128_u64[0] = *(void *)(v2 + 88);
    uint64_t v7 = *(uint64_t (**)(uint64_t, __n128))(v3 + 8);
    return v7(v6, a1);
  }
}

void closure #1 in MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:)(uint64_t a1, void *a2, uint64_t a3, Class isa, Class a5, Class a6, uint64_t a7, uint64_t a8)
{
  type metadata accessor for MLCTensorData();
  v15.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  if (isa) {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  if (a5) {
    a5 = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  if (a6) {
    a6 = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  aBlock[4] = partial apply for closure #1 in closure #1 in MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:);
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed MLCTensor?, @guaranteed Error?, @unowned Double) -> ();
  aBlock[3] = &block_descriptor;
  v17 = _Block_copy(aBlock);
  swift_release();
  [a2 executeWithInputsData:v15.super.isa isa:isa inputsData:a5 inputsData:a6 inputsData:a7 inputsData:a8 outputsData:v17];
  _Block_release(v17);
}

unint64_t type metadata accessor for MLCTensorData()
{
  unint64_t result = lazy cache variable for type metadata for MLCTensorData;
  if (!lazy cache variable for type metadata for MLCTensorData)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for MLCTensorData);
  }
  return result;
}

uint64_t closure #1 in closure #1 in MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:)(void *a1, void *a2, uint64_t a3, double a4)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v6 = swift_allocError();
    void *v7 = a2;
    id v8 = a2;
    return MEMORY[0x270FA2410](a3, v6);
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a3 + 64) + 40);
    *(void *)uint64_t v9 = a1;
    *(double *)(v9 + 8) = a4;
    id v10 = a1;
    return MEMORY[0x270FA2408](a3);
  }
}

uint64_t sub_225ACCA4C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in closure #1 in MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:)(void *a1, void *a2, double a3)
{
  return closure #1 in closure #1 in MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:)(a1, a2, *(void *)(v3 + 16), a3);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

void thunk for @escaping @callee_guaranteed (@guaranteed MLCTensor?, @guaranteed Error?, @unowned Double) -> ()(uint64_t a1, void *a2, void *a3, double a4)
{
  uint64_t v7 = *(void (**)(void *, void *, double))(a1 + 32);
  swift_retain();
  id v9 = a2;
  id v8 = a3;
  v7(a2, a3, a4);
  swift_release();
}

uint64_t MLCTrainingGraph.executeForward(batchSize:options:outputsData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[20] = a3;
  v4[21] = v3;
  v4[18] = a1;
  v4[19] = a2;
  return MEMORY[0x270FA2498](MLCTrainingGraph.executeForward(batchSize:options:outputsData:), 0, 0);
}

uint64_t MLCTrainingGraph.executeForward(batchSize:options:outputsData:)()
{
  Class isa = (Class)v0[20];
  v0[2] = v0;
  v0[7] = v0 + 16;
  v0[3] = MLCTrainingGraph.executeForward(batchSize:options:outputsData:);
  uint64_t v2 = swift_continuation_init();
  if (isa)
  {
    type metadata accessor for MLCTensorData();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  uint64_t v3 = (void *)v0[21];
  uint64_t v5 = v0[18];
  uint64_t v4 = v0[19];
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v2;
  v0[14] = partial apply for closure #1 in closure #1 in MLCInferenceGraph.execute(inputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:);
  v0[15] = v6;
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 1107296256;
  v0[12] = thunk for @escaping @callee_guaranteed (@guaranteed MLCTensor?, @guaranteed Error?, @unowned Double) -> ();
  v0[13] = &block_descriptor_0;
  uint64_t v7 = _Block_copy(v0 + 10);
  swift_release();
  [v3 sel_executeForwardWithBatchSize_options_outputsData_completionHandler_:v5, v4, isa, v7];
  _Block_release(v7);

  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t MLCTrainingGraph.executeForward(batchSize:options:outputsData:)(__n128 a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 48))
  {
    swift_willThrow();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    uint64_t v6 = *(void *)(v2 + 128);
    a1.n128_u64[0] = *(void *)(v2 + 136);
    uint64_t v7 = *(uint64_t (**)(uint64_t, __n128))(v3 + 8);
    return v7(v6, a1);
  }
}

uint64_t sub_225ACCE1C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t MLCTrainingGraph.executeGradient(batchSize:options:outputsData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[19] = a3;
  v4[20] = v3;
  v4[17] = a1;
  v4[18] = a2;
  return MEMORY[0x270FA2498](MLCTrainingGraph.executeGradient(batchSize:options:outputsData:), 0, 0);
}

uint64_t MLCTrainingGraph.executeGradient(batchSize:options:outputsData:)()
{
  Class isa = (Class)v0[19];
  v0[2] = v0;
  v0[7] = v0 + 16;
  v0[3] = MLCTrainingGraph.executeGradient(batchSize:options:outputsData:);
  uint64_t v2 = swift_continuation_init();
  if (isa)
  {
    type metadata accessor for MLCTensorData();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  uint64_t v3 = (void *)v0[20];
  uint64_t v5 = v0[17];
  uint64_t v4 = v0[18];
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v2;
  v0[14] = partial apply for closure #1 in closure #1 in MLCTrainingGraph.executeGradient(batchSize:options:outputsData:);
  v0[15] = v6;
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 1107296256;
  v0[12] = thunk for @escaping @callee_guaranteed (@guaranteed MLCTensor?, @guaranteed Error?, @unowned Double) -> ();
  v0[13] = &block_descriptor_7;
  uint64_t v7 = _Block_copy(v0 + 10);
  swift_release();
  [v3 executeGradientWithBatchSize:v5 options:v4 outputData:isa completionHandler:v7];
  _Block_release(v7);

  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t MLCTrainingGraph.executeGradient(batchSize:options:outputsData:)(__n128 a1)
{
  uint64_t v2 = *v1;
  if (*(void *)(*v1 + 48)) {
    swift_willThrow();
  }
  else {
    a1.n128_u64[0] = *(void *)(*v1 + 128);
  }
  uint64_t v3 = *(uint64_t (**)(__n128))(v2 + 8);
  return v3(a1);
}

uint64_t sub_225ACD110()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in closure #1 in MLCTrainingGraph.executeGradient(batchSize:options:outputsData:)(uint64_t a1, void *a2, double a3)
{
  return closure #1 in closure #1 in MLCTrainingGraph.executeGradient(batchSize:options:outputsData:)(a3, a1, a2, *(void *)(v3 + 16));
}

uint64_t MLCTrainingGraph.executeOptimizerUpdate(options:)(uint64_t a1)
{
  *(void *)(v2 + 136) = a1;
  *(void *)(v2 + 144) = v1;
  return MEMORY[0x270FA2498](MLCTrainingGraph.executeOptimizerUpdate(options:), 0, 0);
}

uint64_t MLCTrainingGraph.executeOptimizerUpdate(options:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0;
  uint64_t v3 = v0 + 2;
  uint64_t v4 = v0 + 10;
  uint64_t v5 = v0 + 16;
  uint64_t v8 = v0 + 17;
  uint64_t v7 = v0[17];
  uint64_t v6 = (void *)v8[1];
  v1[2] = v2;
  v1[7] = v5;
  v1[3] = MLCTrainingGraph.executeGradient(batchSize:options:outputsData:);
  uint64_t v9 = swift_continuation_init();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  v1[14] = partial apply for closure #1 in closure #1 in MLCTrainingGraph.executeOptimizerUpdate(options:);
  v1[15] = v10;
  v1[10] = MEMORY[0x263EF8330];
  v1[11] = 1107296256;
  v1[12] = thunk for @escaping @callee_guaranteed (@guaranteed MLCTensor?, @guaranteed Error?, @unowned Double) -> ();
  v1[13] = &block_descriptor_14;
  int64_t v11 = _Block_copy(v4);
  swift_release();
  [v6 executeOptimizerUpdateWithOptions:v7 completionHandler:v11];
  _Block_release(v11);
  return MEMORY[0x270FA23F0](v3);
}

uint64_t closure #1 in closure #1 in MLCTrainingGraph.executeGradient(batchSize:options:outputsData:)(double a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v6 = swift_allocError();
    void *v7 = a3;
    id v8 = a3;
    return MEMORY[0x270FA2410](a4, v6);
  }
  else
  {
    **(double **)(*(void *)(a4 + 64) + 40) = a1;
    return MEMORY[0x270FA2408](a4);
  }
}

uint64_t sub_225ACD368()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t MLCSplitLayer.splitSectionLengths.getter()
{
  id v1 = [v0 sel_splitSectionLengths];
  if (!v1) {
    return (uint64_t)v1;
  }
  type metadata accessor for NSNumber();
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  while (1)
  {
    uint64_t v12 = (void *)MEMORY[0x263F8EE78];
    uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
    if (v3 < 0) {
      break;
    }
    unint64_t v5 = 0;
    id v1 = v12;
    while (v3 != v5)
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
      }
      else {
        id v6 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v7 = v6;
      uint64_t result = Int.init(exactly:)();
      if (v8) {
        goto LABEL_20;
      }
      uint64_t v9 = result;

      unint64_t v11 = v12[2];
      unint64_t v10 = v12[3];
      if (v11 >= v10 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      }
      ++v5;
      v12[2] = v11 + 1;
      v12[v11 + 4] = v9;
      if (v3 == v5)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v1;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v3) {
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

MLCSplitLayer __swiftcall MLCSplitLayer.init(splitSectionLengths:dimension:)(Swift::OpaquePointer splitSectionLengths, Swift::Int dimension)
{
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)splitSectionLengths._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [ObjCClassFromMetadata layerWithSplitSectionLengths:dimension dimension:isa];

  return (MLCSplitLayer)v6;
}

uint64_t MLCUpsampleLayer.shape.getter()
{
  id v1 = [v0 sel_shape];
  type metadata accessor for NSNumber();
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62) {
    goto LABEL_15;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      uint64_t v13 = MEMORY[0x263F8EE78];
      uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
      if (v3 < 0) {
        break;
      }
      unint64_t v5 = 0;
      uint64_t v6 = v13;
      while (v3 != v5)
      {
        if ((v2 & 0xC000000000000001) != 0) {
          id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
        }
        else {
          id v7 = *(id *)(v2 + 8 * v5 + 32);
        }
        char v8 = v7;
        uint64_t result = Int.init(exactly:)();
        if (v9) {
          goto LABEL_19;
        }
        uint64_t v10 = result;

        unint64_t v12 = *(void *)(v13 + 16);
        unint64_t v11 = *(void *)(v13 + 24);
        if (v12 >= v11 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
        }
        ++v5;
        *(void *)(v13 + 16) = v12 + 1;
        *(void *)(v13 + 8 * v12 + 32) = v10;
        if (v3 == v5)
        {
          swift_bridgeObjectRelease();
          return v6;
        }
      }
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v3) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return result;
}

MLCUpsampleLayer_optional __swiftcall MLCUpsampleLayer.init(shape:)(Swift::OpaquePointer shape)
{
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)shape._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v4 = (objc_class *)[ObjCClassFromMetadata layerWithShape:isa];

  uint64_t v6 = v4;
  result.value.super.super.Class isa = v6;
  result.Swift::Bool is_nil = v5;
  return result;
}

MLCUpsampleLayer_optional __swiftcall MLCUpsampleLayer.init(shape:sampleMode:alignsCorners:)(Swift::OpaquePointer shape, MLCSampleMode sampleMode, Swift::Bool alignsCorners)
{
  uint64_t v4 = *(void *)&sampleMode;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)shape._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  char v8 = (objc_class *)[ObjCClassFromMetadata layerWithShape:isa sampleMode:v4 alignsCorners:alignsCorners];

  uint64_t v10 = v8;
  result.value.super.super.Class isa = v10;
  result.Swift::Bool is_nil = v9;
  return result;
}

uint64_t MLCSliceLayer.start.getter()
{
  return MLCSliceLayer.start.getter((SEL *)&selRef_start);
}

uint64_t MLCSliceLayer.end.getter()
{
  return MLCSliceLayer.start.getter((SEL *)&selRef_end);
}

uint64_t MLCSliceLayer.start.getter(SEL *a1)
{
  id v2 = [v1 *a1];
  type metadata accessor for NSNumber();
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62) {
    goto LABEL_15;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      uint64_t v14 = MEMORY[0x263F8EE78];
      uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0);
      if (v4 < 0) {
        break;
      }
      unint64_t v6 = 0;
      uint64_t v7 = v14;
      while (v4 != v6)
      {
        if ((v3 & 0xC000000000000001) != 0) {
          id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v3);
        }
        else {
          id v8 = *(id *)(v3 + 8 * v6 + 32);
        }
        Swift::Bool v9 = v8;
        uint64_t result = Int.init(exactly:)();
        if (v10) {
          goto LABEL_19;
        }
        uint64_t v11 = result;

        unint64_t v13 = *(void *)(v14 + 16);
        unint64_t v12 = *(void *)(v14 + 24);
        if (v13 >= v12 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v12 > 1), v13 + 1, 1);
        }
        ++v6;
        *(void *)(v14 + 16) = v13 + 1;
        *(void *)(v14 + 8 * v13 + 32) = v11;
        if (v4 == v6)
        {
          swift_bridgeObjectRelease();
          return v7;
        }
      }
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v4) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t MLCSliceLayer.stride.getter()
{
  id v1 = [v0 sel_stride];
  if (!v1) {
    return (uint64_t)v1;
  }
  type metadata accessor for NSNumber();
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  while (1)
  {
    unint64_t v12 = (void *)MEMORY[0x263F8EE78];
    uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
    if (v3 < 0) {
      break;
    }
    unint64_t v5 = 0;
    id v1 = v12;
    while (v3 != v5)
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
      }
      else {
        id v6 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v7 = v6;
      uint64_t result = Int.init(exactly:)();
      if (v8) {
        goto LABEL_20;
      }
      uint64_t v9 = result;

      unint64_t v11 = v12[2];
      unint64_t v10 = v12[3];
      if (v11 >= v10 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      }
      ++v5;
      v12[2] = v11 + 1;
      v12[v11 + 4] = v9;
      if (v3 == v5)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v1;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v3) {
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

MLCSliceLayer_optional __swiftcall MLCSliceLayer.init(start:end:stride:)(Swift::OpaquePointer start, Swift::OpaquePointer end, Swift::OpaquePointer_optional stride)
{
  rawValue = stride.value._rawValue;
  specialized _arrayForceCast<A, B>(_:)((uint64_t)start._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  v5.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)end._rawValue);
  swift_bridgeObjectRelease();
  v6.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (rawValue)
  {
    specialized _arrayForceCast<A, B>(_:)((uint64_t)rawValue);
    swift_bridgeObjectRelease();
    rawValue = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  uint64_t v7 = (objc_class *)[swift_getObjCClassFromMetadata() sliceLayerWithStart_end_stride_:v5.super.isa end_stride_:v6.super.isa rawValue:rawValue];

  uint64_t v9 = v7;
  result.value.super.super.Class isa = v9;
  result.Swift::Bool is_nil = v8;
  return result;
}

id MLCConvolutionDescriptor.kernelSizes.getter()
{
  return MLCConvolutionDescriptor.kernelSizes.getter((SEL *)&selRef_kernelHeight, (SEL *)&selRef_kernelWidth);
}

id MLCConvolutionDescriptor.strides.getter()
{
  return MLCConvolutionDescriptor.kernelSizes.getter((SEL *)&selRef_strideInY, (SEL *)&selRef_strideInX);
}

id MLCConvolutionDescriptor.dilationRates.getter()
{
  return MLCConvolutionDescriptor.kernelSizes.getter((SEL *)&selRef_dilationRateInY, (SEL *)&selRef_dilationRateInX);
}

id MLCConvolutionDescriptor.kernelSizes.getter(SEL *a1, SEL *a2)
{
  id v4 = [v2 *a1];
  [v2 *a2];
  return v4;
}

id MLCConvolutionDescriptor.paddingPolicy.getter@<X0>(uint64_t a1@<X8>)
{
  id result = [v1 sel_paddingPolicy];
  switch(result)
  {
    case 2:
      id v4 = [v1 sel_paddingSizeInY];
      id result = [v1 sel_paddingSizeInX];
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = result;
      *(unsigned char *)(a1 + 16) = 0;
      return result;
    case 1:
      *(_OWORD *)a1 = xmmword_225AD00A0;
LABEL_7:
      *(unsigned char *)(a1 + 16) = 1;
      return result;
    case 0:
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      goto LABEL_7;
  }
  id result = (id)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id MLCConvolutionDescriptor.init(type:kernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strides:dilationRates:paddingPolicy:)(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_225AD00B0;
  *(NSNumber *)(v12 + 32) = Int._bridgeToObjectiveC()();
  *(NSNumber *)(v12 + 40) = Int._bridgeToObjectiveC()();
  type metadata accessor for NSNumber();
  v13.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_225AD00B0;
  *(NSNumber *)(v14 + 32) = Int._bridgeToObjectiveC()();
  *(NSNumber *)(v14 + 40) = Int._bridgeToObjectiveC()();
  v15.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_225AD00B0;
  *(NSNumber *)(v16 + 32) = Int._bridgeToObjectiveC()();
  *(NSNumber *)(v16 + 40) = Int._bridgeToObjectiveC()();
  v17.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(a11 + 16) == 1) {
    int v18 = *(_OWORD *)a11 != 0;
  }
  else {
    int v18 = 2;
  }
  if (MLCPaddingPolicy.objcSizes.getter())
  {
    v19.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v19.super.Class isa = 0;
  }
  LODWORD(v22) = v18;
  id v20 = [swift_getObjCClassFromMetadata() descriptorWithType:a1 super:v13.super.isa inputFeatureChannelCount:a4 outputFeatureChannelCount:a5 groupCount:a6 super:v15.super.isa kernelSizes:v17.super.isa strides:v22 paddingPolicy:v19.super.isa];

  return v20;
}

uint64_t MLCReductionLayer.dimensions.getter()
{
  id v1 = [v0 sel_dimensions];
  type metadata accessor for NSNumber();
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62) {
    goto LABEL_15;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      uint64_t v13 = MEMORY[0x263F8EE78];
      uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
      if (v3 < 0) {
        break;
      }
      unint64_t v5 = 0;
      uint64_t v6 = v13;
      while (v3 != v5)
      {
        if ((v2 & 0xC000000000000001) != 0) {
          id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
        }
        else {
          id v7 = *(id *)(v2 + 8 * v5 + 32);
        }
        Swift::Bool v8 = v7;
        uint64_t result = Int.init(exactly:)();
        if (v9) {
          goto LABEL_19;
        }
        uint64_t v10 = result;

        unint64_t v12 = *(void *)(v13 + 16);
        unint64_t v11 = *(void *)(v13 + 24);
        if (v12 >= v11 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
        }
        ++v5;
        *(void *)(v13 + 16) = v12 + 1;
        *(void *)(v13 + 8 * v12 + 32) = v10;
        if (v3 == v5)
        {
          swift_bridgeObjectRelease();
          return v6;
        }
      }
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v3) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return result;
}

MLCReductionLayer_optional __swiftcall MLCReductionLayer.init(reductionType:dimensions:)(MLCReductionType reductionType, Swift::OpaquePointer dimensions)
{
  uint64_t v3 = *(void *)&reductionType;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)dimensions._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v6 = (objc_class *)[ObjCClassFromMetadata layerWithReductionType:v3 dimensions:isa];

  Swift::Bool v8 = v6;
  result.value.super.super.Class isa = v8;
  result.Swift::Bool is_nil = v7;
  return result;
}

uint64_t MLCTransposeLayer.dimensions.getter()
{
  id v1 = [v0 sel_dimensions];
  type metadata accessor for NSNumber();
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62) {
    goto LABEL_15;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      uint64_t v13 = MEMORY[0x263F8EE78];
      uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
      if (v3 < 0) {
        break;
      }
      unint64_t v5 = 0;
      uint64_t v6 = v13;
      while (v3 != v5)
      {
        if ((v2 & 0xC000000000000001) != 0) {
          id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
        }
        else {
          id v7 = *(id *)(v2 + 8 * v5 + 32);
        }
        Swift::Bool v8 = v7;
        uint64_t result = Int.init(exactly:)();
        if (v9) {
          goto LABEL_19;
        }
        uint64_t v10 = result;

        unint64_t v12 = *(void *)(v13 + 16);
        unint64_t v11 = *(void *)(v13 + 24);
        if (v12 >= v11 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
        }
        ++v5;
        *(void *)(v13 + 16) = v12 + 1;
        *(void *)(v13 + 8 * v12 + 32) = v10;
        if (v3 == v5)
        {
          swift_bridgeObjectRelease();
          return v6;
        }
      }
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v3) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return result;
}

MLCTransposeLayer_optional __swiftcall MLCTransposeLayer.init(dimensions:)(Swift::OpaquePointer dimensions)
{
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)dimensions._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v4 = (objc_class *)[ObjCClassFromMetadata layerWithDimensions:isa];

  uint64_t v6 = v4;
  result.value.super.super.Class isa = v6;
  result.Swift::Bool is_nil = v5;
  return result;
}

uint64_t MLCPaddingPolicy.objcPolicy.getter()
{
  if (*(unsigned char *)(v0 + 16) == 1) {
    return *(_OWORD *)v0 != 0;
  }
  else {
    return 2;
  }
}

uint64_t MLCPaddingPolicy.objcSizes.getter()
{
  if (*(unsigned char *)(v0 + 16)) {
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_225AD00B0;
  *(NSNumber *)(v1 + 32) = Int._bridgeToObjectiveC()();
  *(NSNumber *)(v1 + 40) = Int._bridgeToObjectiveC()();
  return v1;
}

uint64_t MLCPaddingPolicy.debugDescription.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 16);
  if (v1 == 1) {
    MLCPaddingPolicy v2 = *(_OWORD *)v0 != 0;
  }
  else {
    MLCPaddingPolicy v2 = MLCPaddingPolicyUsePaddingSize;
  }
  uint64_t v3 = MLCPaddingPolicyDebugDescription(v2);
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v1 & 1) == 0)
  {
    v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v5);
    swift_bridgeObjectRelease();
    v6._countAndFlagsBits = 0x203A78202CLL;
    v6._object = (void *)0xE500000000000000;
    String.append(_:)(v6);
    v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    v8._countAndFlagsBits = 41;
    v8._object = (void *)0xE100000000000000;
    String.append(_:)(v8);
    swift_bridgeObjectRetain();
    v9._countAndFlagsBits = 0x203A792820;
    v9._object = (void *)0xE500000000000000;
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for MLCPaddingPolicy(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MLCPaddingPolicy(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
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
  *(unsigned char *)(result + 17) = v3;
  return result;
}

uint64_t getEnumTag for MLCPaddingPolicy(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t destructiveInjectEnumTag for MLCPaddingPolicy(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 1;
  }
  else
  {
    *(unsigned char *)(result + 16) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for MLCPaddingPolicy()
{
  return &type metadata for MLCPaddingPolicy;
}

MLCTensor __swiftcall MLCTensor.init(shape:)(Swift::OpaquePointer shape)
{
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)shape._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v4 = [ObjCClassFromMetadata tensorWithShape:isa];

  return (MLCTensor)v4;
}

MLCTensor __swiftcall MLCTensor.init(shape:randomInitializerType:)(Swift::OpaquePointer shape, MLCRandomInitializerType randomInitializerType)
{
  return (MLCTensor)MLCTensor.init(shape:randomInitializerType:)((uint64_t)shape._rawValue, *(uint64_t *)&randomInitializerType, (SEL *)&selRef_tensorWithShape_randomInitializerType_);
}

MLCTensor __swiftcall MLCTensor.init(shape:dataType:)(Swift::OpaquePointer shape, MLCDataType dataType)
{
  return (MLCTensor)MLCTensor.init(shape:randomInitializerType:)((uint64_t)shape._rawValue, *(uint64_t *)&dataType, (SEL *)&selRef_tensorWithShape_dataType_);
}

id MLCTensor.init(shape:randomInitializerType:)(uint64_t a1, uint64_t a2, SEL *a3)
{
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)(a1);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v8 = [ObjCClassFromMetadata *a3 isa:a2];

  return v8;
}

MLCTensor __swiftcall MLCTensor.init(shape:data:dataType:)(Swift::OpaquePointer shape, MLCTensorData data, MLCDataType dataType)
{
  return (MLCTensor)MLCTensor.init(shape:data:dataType:)((uint64_t)shape._rawValue, data.super.isa, *(uint64_t *)&dataType, (SEL *)&selRef_tensorWithShape_data_dataType_);
}

MLCTensor __swiftcall MLCTensor.init(shape:fillWithData:dataType:)(Swift::OpaquePointer shape, NSNumber fillWithData, MLCDataType dataType)
{
  return (MLCTensor)MLCTensor.init(shape:data:dataType:)((uint64_t)shape._rawValue, fillWithData.super.super.isa, *(uint64_t *)&dataType, (SEL *)&selRef_tensorWithShape_fillWithData_dataType_);
}

id MLCTensor.init(shape:data:dataType:)(uint64_t a1, void *a2, uint64_t a3, SEL *a4)
{
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)(a1);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v10 = [ObjCClassFromMetadata *a4 isa:a2 a3];

  return v10;
}

MLCTensor_optional __swiftcall MLCTensor.init(sequenceLengths:sortedSequences:featureChannelCount:batchSize:randomInitializerType:)(Swift::OpaquePointer sequenceLengths, Swift::Bool sortedSequences, Swift::Int featureChannelCount, Swift::Int batchSize, MLCRandomInitializerType randomInitializerType)
{
  uint64_t v5 = *(void *)&randomInitializerType;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)sequenceLengths._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  unint64_t v12 = (objc_class *)[ObjCClassFromMetadata tensorWithSequenceLengths:sortedSequences featureChannelCount:featureChannelCount batchSize:batchSize randomInitializerType:v5];

  uint64_t v14 = v12;
  result.value.super.Class isa = v14;
  result.Swift::Bool is_nil = v13;
  return result;
}

MLCTensor_optional __swiftcall MLCTensor.init(sequenceLengths:sortedSequences:featureChannelCount:batchSize:data:)(Swift::OpaquePointer sequenceLengths, Swift::Bool sortedSequences, Swift::Int featureChannelCount, Swift::Int batchSize, MLCTensorData_optional data)
{
  Class isa = data.value.super.isa;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)sequenceLengths._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class v11 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  unint64_t v12 = (objc_class *)[ObjCClassFromMetadata tensorWithSequenceLengths:v11 sortedSequences:sortedSequences featureChannelCount:featureChannelCount batchSize:batchSize data:isa];

  uint64_t v14 = v12;
  result.value.super.Class isa = v14;
  result.Swift::Bool is_nil = v13;
  return result;
}

Swift::OpaquePointer_optional __swiftcall MLCGraph.split(source:splitSectionLengths:dimension:)(MLCTensor source, Swift::OpaquePointer splitSectionLengths, Swift::Int dimension)
{
  specialized _arrayForceCast<A, B>(_:)((uint64_t)splitSectionLengths._rawValue);
  type metadata accessor for NSNumber(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v7 = [v3 sel_splitWithSource_splitSectionLengths_dimension_:source.super.isa:isa:dimension];

  if (v7)
  {
    type metadata accessor for NSNumber(0, &lazy cache variable for type metadata for MLCTensor);
    uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = (void *)v9;
  result.value._rawValue = v10;
  result.Swift::Bool is_nil = v8;
  return result;
}

uint64_t type metadata accessor for NSNumber(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

MLCTensor_optional __swiftcall MLCGraph.reshape(shape:source:)(Swift::OpaquePointer shape, MLCTensor source)
{
  MLCPaddingPolicy v2 = (objc_class *)MLCGraph.reshape(shape:source:)((uint64_t)shape._rawValue, (uint64_t)source.super.isa, (SEL *)&selRef_reshapeWithShape_source_);
  result.value.super.Class isa = v2;
  result.Swift::Bool is_nil = v3;
  return result;
}

MLCTensor_optional __swiftcall MLCGraph.transpose(dimensions:source:)(Swift::OpaquePointer dimensions, MLCTensor source)
{
  MLCPaddingPolicy v2 = (objc_class *)MLCGraph.reshape(shape:source:)((uint64_t)dimensions._rawValue, (uint64_t)source.super.isa, (SEL *)&selRef_transposeWithDimensions_source_);
  result.value.super.Class isa = v2;
  result.Swift::Bool is_nil = v3;
  return result;
}

id MLCGraph.reshape(shape:source:)(uint64_t a1, uint64_t a2, SEL *a3)
{
  specialized _arrayForceCast<A, B>(_:)(a1);
  type metadata accessor for NSNumber(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v7 = [v3 *a3:isa:a2];

  return v7;
}

MLCReshapeLayer_optional __swiftcall MLCReshapeLayer.init(shape:)(Swift::OpaquePointer shape)
{
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)shape._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v4 = (objc_class *)[ObjCClassFromMetadata layerWithShape:isa];

  Swift::String v6 = v4;
  result.value.super.super.Class isa = v6;
  result.Swift::Bool is_nil = v5;
  return result;
}

uint64_t MLCReshapeLayer.shape.getter()
{
  id v1 = [v0 sel_shape];
  type metadata accessor for NSNumber();
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62) {
    goto LABEL_15;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      uint64_t v13 = MEMORY[0x263F8EE78];
      uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
      if (v3 < 0) {
        break;
      }
      unint64_t v5 = 0;
      uint64_t v6 = v13;
      while (v3 != v5)
      {
        if ((v2 & 0xC000000000000001) != 0) {
          id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
        }
        else {
          id v7 = *(id *)(v2 + 8 * v5 + 32);
        }
        Swift::Bool v8 = v7;
        uint64_t result = Int.init(exactly:)();
        if (v9) {
          goto LABEL_19;
        }
        uint64_t v10 = result;

        unint64_t v12 = *(void *)(v13 + 16);
        unint64_t v11 = *(void *)(v13 + 24);
        if (v12 >= v11 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
        }
        ++v5;
        *(void *)(v13 + 16) = v12 + 1;
        *(void *)(v13 + 8 * v12 + 32) = v10;
        if (v3 == v5)
        {
          swift_bridgeObjectRelease();
          return v6;
        }
      }
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v3) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t MLCTensorDescriptor.shape.getter()
{
  return MLCSliceLayer.start.getter((SEL *)&selRef_shape);
}

uint64_t MLCTensorDescriptor.stride.getter()
{
  return MLCSliceLayer.start.getter((SEL *)&selRef_stride);
}

uint64_t MLCTensorDescriptor.sequenceLengths.getter()
{
  return MLCTensorDescriptor.sequenceLengths.getter((SEL *)&selRef_sequenceLengths);
}

uint64_t MLCTensorDescriptor.batchSizePerSequenceStep.getter()
{
  return MLCTensorDescriptor.sequenceLengths.getter((SEL *)&selRef_batchSizePerSequenceStep);
}

uint64_t MLCTensorDescriptor.sequenceLengths.getter(SEL *a1)
{
  id v2 = [v1 *a1];
  if (!v2) {
    return (uint64_t)v2;
  }
  type metadata accessor for NSNumber();
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  while (1)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0);
    if (v4 < 0) {
      break;
    }
    unint64_t v6 = 0;
    id v2 = v13;
    while (v4 != v6)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v3);
      }
      else {
        id v7 = *(id *)(v3 + 8 * v6 + 32);
      }
      Swift::Bool v8 = v7;
      uint64_t result = Int.init(exactly:)();
      if (v9) {
        goto LABEL_20;
      }
      uint64_t v10 = result;

      unint64_t v12 = v13[2];
      unint64_t v11 = v13[3];
      if (v12 >= v11 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
      }
      ++v6;
      v13[2] = v12 + 1;
      v13[v12 + 4] = v10;
      if (v4 == v6)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v2;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v4) {
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

MLCTensorDescriptor_optional __swiftcall MLCTensorDescriptor.init(shape:dataType:)(Swift::OpaquePointer shape, MLCDataType dataType)
{
  uint64_t v2 = *(void *)&dataType;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)shape._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  unint64_t v6 = (objc_class *)[ObjCClassFromMetadata sel_descriptorWithShape_dataType_:isa, v2];

  Swift::Bool v8 = v6;
  result.value.super.Class isa = v8;
  result.Swift::Bool is_nil = v7;
  return result;
}

MLCTensorDescriptor_optional __swiftcall MLCTensorDescriptor.init(shape:sequenceLengths:sortedSequences:dataType:)(Swift::OpaquePointer shape, Swift::OpaquePointer sequenceLengths, Swift::Bool sortedSequences, MLCDataType dataType)
{
  uint64_t v4 = *(void *)&dataType;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)shape._rawValue);
  swift_bridgeObjectRelease();
  type metadata accessor for NSNumber();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  specialized _arrayForceCast<A, B>(_:)((uint64_t)sequenceLengths._rawValue);
  swift_bridgeObjectRelease();
  Class v10 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  unint64_t v11 = (objc_class *)[ObjCClassFromMetadata sel_descriptorWithShape_sequenceLengths_sortedSequences_dataType_:isa, v10, sortedSequences, v4];

  uint64_t v13 = v11;
  result.value.super.Class isa = v13;
  result.Swift::Bool is_nil = v12;
  return result;
}

uint64_t MLCPoolingType.objcPoolingType.getter()
{
  int v1 = *v0;
  if (v1 == 3) {
    unsigned int v2 = 3;
  }
  else {
    unsigned int v2 = 2;
  }
  if (v1 == 2) {
    return 1;
  }
  else {
    return v2;
  }
}

uint64_t MLCPoolingType.debugDescription.getter()
{
  int v1 = *v0;
  if (v1 == 3) {
    int v2 = 3;
  }
  else {
    int v2 = 2;
  }
  if (v1 == 2) {
    MLCPoolingType v3 = MLCPoolingTypeMax;
  }
  else {
    MLCPoolingType v3 = v2;
  }
  uint64_t v4 = MLCPoolingTypeDebugDescription(v3);
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v1 & 0xFE) != 2)
  {
    _StringGuts.grow(_:)(28);
    swift_bridgeObjectRelease();
    if (v1) {
      uint64_t v6 = 1702195828;
    }
    else {
      uint64_t v6 = 0x65736C6166;
    }
    if (v1) {
      unint64_t v7 = 0xE400000000000000;
    }
    else {
      unint64_t v7 = 0xE500000000000000;
    }
    unint64_t v8 = v7;
    String.append(_:)(*(Swift::String *)&v6);
    swift_bridgeObjectRelease();
    v9._countAndFlagsBits = 41;
    v9._object = (void *)0xE100000000000000;
    String.append(_:)(v9);
    swift_bridgeObjectRetain();
    v10._countAndFlagsBits = 0xD000000000000019;
    v10._object = (void *)0x8000000225AD0290;
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t MLCPoolingDescriptor.poolingType.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (uint64_t)[v1 poolingType];
  switch(result)
  {
    case 1:
      uint64_t result = 2;
      goto LABEL_6;
    case 3:
LABEL_6:
      *a1 = result;
      return result;
    case 2:
      uint64_t result = (uint64_t)[v1 countIncludesPadding];
      goto LABEL_6;
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id MLCPoolingDescriptor.kernelSizes.getter()
{
  return MLCConvolutionDescriptor.kernelSizes.getter((SEL *)&selRef_kernelHeight, (SEL *)&selRef_kernelWidth);
}

id MLCPoolingDescriptor.strides.getter()
{
  return MLCConvolutionDescriptor.kernelSizes.getter((SEL *)&selRef_strideInY, (SEL *)&selRef_strideInX);
}

id MLCPoolingDescriptor.dilationRates.getter()
{
  return MLCConvolutionDescriptor.kernelSizes.getter((SEL *)&selRef_dilationRateInY, (SEL *)&selRef_dilationRateInX);
}

id MLCPoolingDescriptor.paddingPolicy.getter@<X0>(uint64_t a1@<X8>)
{
  id result = [v1 sel_paddingPolicy];
  switch(result)
  {
    case 2:
      id v4 = [v1 sel_paddingSizeInY];
      id result = [v1 sel_paddingSizeInX];
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = result;
      *(unsigned char *)(a1 + 16) = 0;
      return result;
    case 1:
      *(_OWORD *)a1 = xmmword_225AD00A0;
LABEL_7:
      *(unsigned char *)(a1 + 16) = 1;
      return result;
    case 0:
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      goto LABEL_7;
  }
  id result = (id)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id MLCPoolingDescriptor.init(type:kernelSizes:strides:dilationRates:paddingPolicy:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = *a1;
  if (v9 == 3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_225AD00B0;
    *(NSNumber *)(v17 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v17 + 40) = Int._bridgeToObjectiveC()();
    type metadata accessor for NSNumber();
    v11.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_225AD00B0;
    *(NSNumber *)(v18 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v18 + 40) = Int._bridgeToObjectiveC()();
    v13.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_225AD00B0;
    *(NSNumber *)(v19 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v19 + 40) = Int._bridgeToObjectiveC()();
    v15.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(a8 + 16) == 1) {
      uint64_t v20 = *(_OWORD *)a8 != 0;
    }
    else {
      uint64_t v20 = 2;
    }
    if (MLCPaddingPolicy.objcSizes.getter())
    {
      v25.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      v25.super.Class isa = 0;
    }
    id v26 = [swift_getObjCClassFromMetadata() l2NormPoolingDescriptorWithKernelSizes:v11.super.isa strides:v13.super.isa dilationRates:v15.super.isa paddingPolicy:v20 paddingSizes:v25.super.isa];
  }
  else if (v9 == 2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_225AD00B0;
    *(NSNumber *)(v10 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v10 + 40) = Int._bridgeToObjectiveC()();
    type metadata accessor for NSNumber();
    v11.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_225AD00B0;
    *(NSNumber *)(v12 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v12 + 40) = Int._bridgeToObjectiveC()();
    v13.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_225AD00B0;
    *(NSNumber *)(v14 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v14 + 40) = Int._bridgeToObjectiveC()();
    v15.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(a8 + 16) == 1) {
      uint64_t v16 = *(_OWORD *)a8 != 0;
    }
    else {
      uint64_t v16 = 2;
    }
    if (MLCPaddingPolicy.objcSizes.getter())
    {
      v25.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      v25.super.Class isa = 0;
    }
    id v26 = [swift_getObjCClassFromMetadata() maxPoolingDescriptorWithKernelSizes:v11.super.isa strides:v13.super.isa dilationRates:v15.super.isa paddingPolicy:v16 paddingSizes:v25.super.isa];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_225AD00B0;
    *(NSNumber *)(v21 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v21 + 40) = Int._bridgeToObjectiveC()();
    type metadata accessor for NSNumber();
    v11.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_225AD00B0;
    *(NSNumber *)(v22 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v22 + 40) = Int._bridgeToObjectiveC()();
    v13.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_225AD00B0;
    *(NSNumber *)(v23 + 32) = Int._bridgeToObjectiveC()();
    *(NSNumber *)(v23 + 40) = Int._bridgeToObjectiveC()();
    v15.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(a8 + 16) == 1) {
      uint64_t v24 = *(_OWORD *)a8 != 0;
    }
    else {
      uint64_t v24 = 2;
    }
    if (MLCPaddingPolicy.objcSizes.getter())
    {
      v25.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      v25.super.Class isa = 0;
    }
    id v26 = [swift_getObjCClassFromMetadata() averagePoolingDescriptorWithKernelSizes:v11.super.isa strides:v13.super.isa dilationRates:v15.super.isa paddingPolicy:v24 paddingSizes:v9 & 1 countIncludesPadding:v25.super.isa];
  }
  id v27 = v26;

  return v27;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *id result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MLCPoolingType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD)
  {
    unsigned int v2 = a2 + 3;
    if (a2 + 3 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 3;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 3;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x225ACFB4CLL);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 3;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  if (v7 < 2) {
    return 0;
  }
  unsigned int v8 = (v7 + 2147483646) & 0x7FFFFFFF;
  uint64_t result = v8 - 1;
  if (v8 <= 1) {
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MLCPoolingType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 3;
  if (a3 + 3 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFD) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v7 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x225ACFC34);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for MLCPoolingType(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0;
  }
}

unsigned char *destructiveInjectEnumTag for MLCPoolingType(unsigned char *result, int a2)
{
  if (a2) {
    *uint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for MLCPoolingType()
{
  return &type metadata for MLCPoolingType;
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

NSNumber __swiftcall Float._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1C48]();
}

uint64_t Float.init(exactly:)()
{
  return MEMORY[0x270EF1C88]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1CE0]();
}

uint64_t Int.init(exactly:)()
{
  return MEMORY[0x270EF1D10]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _assertionFailure(_:_:flags:)()
{
  return MEMORY[0x270F9EFF8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return MEMORY[0x270F9F090]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

NSString *__cdecl MLCPaddingPolicyDebugDescription(MLCPaddingPolicy paddingPolicy)
{
  return (NSString *)MEMORY[0x270EF5658](*(void *)&paddingPolicy);
}

NSString *__cdecl MLCPoolingTypeDebugDescription(MLCPoolingType poolingType)
{
  return (NSString *)MEMORY[0x270EF5660](*(void *)&poolingType);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}