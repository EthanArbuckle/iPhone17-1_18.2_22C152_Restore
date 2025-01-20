uint64_t MDLMatrix4x4Array.float4x4Array.getter()
{
  return MDLMatrix4x4Array.float4x4Array.getter(type metadata accessor for simd_float4x4, (SEL *)&selRef_getFloat4x4Array_maxCount_);
}

unint64_t key path getter for MDLMatrix4x4Array.float4x4Array : MDLMatrix4x4Array@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  return key path getter for MDLMatrix4x4Array.float4x4Array : MDLMatrix4x4Array(a1, type metadata accessor for simd_float4x4, (SEL *)&selRef_getFloat4x4Array_maxCount_, a2);
}

id key path setter for MDLMatrix4x4Array.float4x4Array : MDLMatrix4x4Array(uint64_t a1, id *a2)
{
  return [*a2 setFloat4x4Array:*(void *)a1 + 32 count:*(void *)(*(void *)a1 + 16)];
}

uint64_t MDLMatrix4x4Array.float4x4Array.setter(uint64_t a1)
{
  return MDLMatrix4x4Array.float4x4Array.setter(a1, (SEL *)&selRef_setFloat4x4Array_count_);
}

void type metadata accessor for simd_float4x4(uint64_t a1)
{
}

uint64_t (*MDLMatrix4x4Array.float4x4Array.modify(uint64_t *a1))(id *a1, uint64_t a2)
{
  a1[1] = (uint64_t)v1;
  result = (uint64_t (*)(id *, uint64_t))[v1 elementCount];
  if (((unint64_t)result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v4 = result;
    if (result)
    {
      type metadata accessor for simd_float4x4(0);
      uint64_t v5 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v5 + 16) = v4;
    }
    else
    {
      uint64_t v5 = MEMORY[0x263F8EE78];
    }
    [v1 setFloat4x4Array:v5 + 32 maxCount:v4];
    *(void *)(v5 + 16) = v4;
    *a1 = v5;
    return MDLMatrix4x4Array.float4x4Array.modify;
  }
  return result;
}

uint64_t MDLMatrix4x4Array.float4x4Array.modify(id *a1, uint64_t a2)
{
  return MDLMatrix4x4Array.float4x4Array.modify(a1, a2, (SEL *)&selRef_setFloat4x4Array_count_);
}

uint64_t MDLMatrix4x4Array.double4x4Array.getter()
{
  return MDLMatrix4x4Array.float4x4Array.getter(type metadata accessor for simd_double4x4, (SEL *)&selRef_getDouble4x4Array_maxCount_);
}

uint64_t MDLMatrix4x4Array.float4x4Array.getter(void (*a1)(void), SEL *a2)
{
  uint64_t result = (uint64_t)[v2 elementCount];
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = result;
    if (result)
    {
      a1(0);
      uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v7 + 16) = v6;
    }
    else
    {
      uint64_t v7 = MEMORY[0x263F8EE78];
    }
    [v2 *a2:v7 + 32 v6];
    *(void *)(v7 + 16) = v6;
    return v7;
  }
  return result;
}

unint64_t key path getter for MDLMatrix4x4Array.double4x4Array : MDLMatrix4x4Array@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  return key path getter for MDLMatrix4x4Array.float4x4Array : MDLMatrix4x4Array(a1, type metadata accessor for simd_double4x4, (SEL *)&selRef_getDouble4x4Array_maxCount_, a2);
}

unint64_t key path getter for MDLMatrix4x4Array.float4x4Array : MDLMatrix4x4Array@<X0>(id *a1@<X0>, void (*a2)(void)@<X3>, SEL *a3@<X4>, uint64_t *a4@<X8>)
{
  id v7 = *a1;
  unint64_t result = (unint64_t)[*a1 elementCount];
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v9 = result;
    if (result)
    {
      a2(0);
      uint64_t v10 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v10 + 16) = v9;
    }
    else
    {
      uint64_t v10 = MEMORY[0x263F8EE78];
    }
    unint64_t result = (unint64_t)[v7 *a3:v10 + 32:v9];
    *(void *)(v10 + 16) = v9;
    *a4 = v10;
  }
  return result;
}

id key path setter for MDLMatrix4x4Array.double4x4Array : MDLMatrix4x4Array(uint64_t a1, id *a2)
{
  return [*a2 setDouble4x4Array:*(void *)a1 + 32 count:*(void *)(*(void *)a1 + 16)];
}

uint64_t MDLMatrix4x4Array.double4x4Array.setter(uint64_t a1)
{
  return MDLMatrix4x4Array.float4x4Array.setter(a1, (SEL *)&selRef_setDouble4x4Array_count_);
}

uint64_t MDLMatrix4x4Array.float4x4Array.setter(uint64_t a1, SEL *a2)
{
  [v2 *a2 a1 + 32 *(void *)(a1 + 16)];

  return MEMORY[0x270FA01E8](a1);
}

void type metadata accessor for simd_double4x4(uint64_t a1)
{
}

uint64_t (*MDLMatrix4x4Array.double4x4Array.modify(uint64_t *a1))(id *a1, uint64_t a2)
{
  a1[1] = (uint64_t)v1;
  unint64_t result = (uint64_t (*)(id *, uint64_t))[v1 sel_elementCount];
  if (((unint64_t)result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v4 = result;
    if (result)
    {
      type metadata accessor for simd_double4x4(0);
      uint64_t v5 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v5 + 16) = v4;
    }
    else
    {
      uint64_t v5 = MEMORY[0x263F8EE78];
    }
    [v1 sel_getDouble4x4Array_maxCount_:v5 + 32, v4];
    *(void *)(v5 + 16) = v4;
    *a1 = v5;
    return MDLMatrix4x4Array.double4x4Array.modify;
  }
  return result;
}

uint64_t MDLMatrix4x4Array.double4x4Array.modify(id *a1, uint64_t a2)
{
  return MDLMatrix4x4Array.float4x4Array.modify(a1, a2, (SEL *)&selRef_setDouble4x4Array_count_);
}

uint64_t MDLMatrix4x4Array.float4x4Array.modify(id *a1, uint64_t a2, SEL *a3)
{
  id v3 = *a1;
  [a1[1] *a3:((char *)*a1 + 32):*((void *)*a1 + 2)];

  return MEMORY[0x270FA01E8](v3);
}

uint64_t MDLAnimatedValue.times.getter()
{
  return MDLAnimatedValue.times.getter(MEMORY[0x263F8D538], (SEL *)&selRef_getTimes_maxCount_);
}

Swift::Void __swiftcall MDLAnimatedScalarArray.set(floatArray:atTime:)(Swift::OpaquePointer floatArray, Swift::Double atTime)
{
  [v2 setFloatArray:((char *)floatArray._rawValue + 32) count:*((void *)floatArray._rawValue + 2) atTime:atTime];
}

Swift::Void __swiftcall MDLAnimatedScalarArray.set(doubleArray:atTime:)(Swift::OpaquePointer doubleArray, Swift::Double atTime)
{
  [v2 setDoubleArray:((char *)doubleArray._rawValue + 32) count:*((void *)doubleArray._rawValue + 2) atTime:atTime];
}

uint64_t MDLAnimatedScalarArray.floatArray(atTime:)(double a1)
{
  return MDLAnimatedScalarArray.floatArray(atTime:)(a1, MEMORY[0x263F8D5C8], (SEL *)&selRef_getFloatArray_maxCount_atTime_);
}

uint64_t MDLAnimatedScalarArray.doubleArray(atTime:)(double a1)
{
  return MDLAnimatedScalarArray.floatArray(atTime:)(a1, MEMORY[0x263F8D538], (SEL *)&selRef_getDoubleArray_maxCount_atTime_);
}

uint64_t MDLAnimatedScalarArray.floatArray(atTime:)(double a1, uint64_t a2, SEL *a3)
{
  uint64_t result = (uint64_t)[v3 elementCount];
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = result;
    if (result)
    {
      uint64_t v8 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v8 + 16) = v7;
    }
    else
    {
      uint64_t v8 = MEMORY[0x263F8EE78];
    }
    [v3 *a3:v8 + 32:objc_msgSend(v3, sel_elementCount):a1];
    *(void *)(v8 + 16) = v7;
    return v8;
  }
  return result;
}

Swift::Void __swiftcall MDLAnimatedScalarArray.reset(floatArray:atTimes:)(Swift::OpaquePointer floatArray, Swift::OpaquePointer atTimes)
{
}

Swift::Void __swiftcall MDLAnimatedScalarArray.reset(doubleArray:atTimes:)(Swift::OpaquePointer doubleArray, Swift::OpaquePointer atTimes)
{
}

uint64_t MDLAnimatedScalarArray.floatArray.getter()
{
  return MDLAnimatedScalarArray.floatArray.getter(MEMORY[0x263F8D5C8], (SEL *)&selRef_getFloatArray_maxCount_);
}

uint64_t MDLAnimatedScalarArray.doubleArray.getter()
{
  return MDLAnimatedScalarArray.floatArray.getter(MEMORY[0x263F8D538], (SEL *)&selRef_getDoubleArray_maxCount_);
}

uint64_t MDLAnimatedScalarArray.floatArray.getter(uint64_t a1, SEL *a2)
{
  uint64_t v4 = (uint64_t)[v2 sel_elementCount];
  uint64_t result = (uint64_t)[v2 timeSampleCount];
  uint64_t v6 = v4 * result;
  if ((unsigned __int128)(v4 * (__int128)result) >> 64 != (v4 * result) >> 63)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v6 < 0)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  if (v6)
  {
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v7 + 16) = v6;
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
  }
  [v2 *a2:v7 + 32, v6];
  *(void *)(v7 + 16) = v6;
  return v7;
}

Swift::Void __swiftcall MDLAnimatedVector3Array.set(float3Array:atTime:)(Swift::OpaquePointer float3Array, Swift::Double atTime)
{
  [v2 setFloat3Array:((char *)float3Array._rawValue + 32) count:*((void *)float3Array._rawValue + 2) atTime:atTime];
}

Swift::Void __swiftcall MDLAnimatedVector3Array.set(double3Array:atTime:)(Swift::OpaquePointer double3Array, Swift::Double atTime)
{
  [v2 setDouble3Array:((char *)double3Array._rawValue + 32) count:*((void *)double3Array._rawValue + 2) atTime:atTime];
}

uint64_t MDLAnimatedVector3Array.float3Array(atTime:)(double a1)
{
  return MDLAnimatedVector3Array.float3Array(atTime:)(&demangling cache variable for type metadata for SIMD3<Float>, (SEL *)&selRef_getFloat3Array_maxCount_atTime_, a1);
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

uint64_t MDLAnimatedVector3Array.double3Array(atTime:)(double a1)
{
  return MDLAnimatedVector3Array.float3Array(atTime:)(&demangling cache variable for type metadata for SIMD3<Double>, (SEL *)&selRef_getDouble3Array_maxCount_atTime_, a1);
}

uint64_t MDLAnimatedVector3Array.float3Array(atTime:)(uint64_t *a1, SEL *a2, double a3)
{
  uint64_t result = (uint64_t)[v3 sel_elementCount];
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = result;
    if (result)
    {
      __swift_instantiateConcreteTypeFromMangledName(a1);
      uint64_t v9 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v9 + 16) = v8;
    }
    else
    {
      uint64_t v9 = MEMORY[0x263F8EE78];
    }
    [v3 *a2:v9 + 32:objc_msgSend(v3, sel_elementCount):a3];
    *(void *)(v9 + 16) = v8;
    return v9;
  }
  return result;
}

Swift::Void __swiftcall MDLAnimatedVector3Array.reset(float3Array:atTimes:)(Swift::OpaquePointer float3Array, Swift::OpaquePointer atTimes)
{
}

Swift::Void __swiftcall MDLAnimatedVector3Array.reset(double3Array:atTimes:)(Swift::OpaquePointer double3Array, Swift::OpaquePointer atTimes)
{
}

uint64_t MDLAnimatedVector3Array.float3Array.getter()
{
  return MDLAnimatedVector3Array.float3Array.getter(&demangling cache variable for type metadata for SIMD3<Float>, (SEL *)&selRef_getFloat3Array_maxCount_);
}

uint64_t MDLAnimatedVector3Array.double3Array.getter()
{
  return MDLAnimatedVector3Array.float3Array.getter(&demangling cache variable for type metadata for SIMD3<Double>, (SEL *)&selRef_getDouble3Array_maxCount_);
}

uint64_t MDLAnimatedVector3Array.float3Array.getter(uint64_t *a1, SEL *a2)
{
  uint64_t v5 = (uint64_t)[v2 elementCount];
  uint64_t result = (uint64_t)[v2 timeSampleCount];
  uint64_t v7 = v5 * result;
  if ((unsigned __int128)(v5 * (__int128)result) >> 64 != (v5 * result) >> 63)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v7 < 0)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(a1);
    uint64_t v8 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v8 + 16) = v7;
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  [v2 *a2:v8 + 32:v7];
  *(void *)(v8 + 16) = v7;
  return v8;
}

Swift::Void __swiftcall MDLAnimatedQuaternionArray.set(floatQuaternionArray:atTime:)(Swift::OpaquePointer floatQuaternionArray, Swift::Double atTime)
{
  [v2 setFloatQuaternionArray:floatQuaternionArray count:*((void *)floatQuaternionArray._rawValue + 2) atTime:atTime];
}

Swift::Void __swiftcall MDLAnimatedQuaternionArray.set(doubleQuaternionArray:atTime:)(Swift::OpaquePointer doubleQuaternionArray, Swift::Double atTime)
{
  [v2 setDoubleQuaternionArray:((char *)doubleQuaternionArray._rawValue + 32) count:*((void *)doubleQuaternionArray._rawValue + 2) atTime:atTime];
}

uint64_t MDLAnimatedQuaternionArray.floatQuaternionArray(atTime:)(double a1)
{
  return MDLAnimatedQuaternionArray.floatQuaternionArray(atTime:)(type metadata accessor for simd_quatf, (SEL *)&selRef_getFloatQuaternionArray_maxCount_atTime_, a1);
}

void type metadata accessor for simd_quatf(uint64_t a1)
{
}

uint64_t MDLAnimatedQuaternionArray.doubleQuaternionArray(atTime:)(double a1)
{
  return MDLAnimatedQuaternionArray.floatQuaternionArray(atTime:)(type metadata accessor for simd_quatd, (SEL *)&selRef_getDoubleQuaternionArray_maxCount_atTime_, a1);
}

uint64_t MDLAnimatedQuaternionArray.floatQuaternionArray(atTime:)(void (*a1)(void), SEL *a2, double a3)
{
  uint64_t result = (uint64_t)[v3 elementCount];
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = result;
    if (result)
    {
      a1(0);
      uint64_t v9 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v9 + 16) = v8;
    }
    else
    {
      uint64_t v9 = MEMORY[0x263F8EE78];
    }
    [v3 *a2:v9 + 32:objc_msgSend(v3, sel_elementCount):a3];
    *(void *)(v9 + 16) = v8;
    return v9;
  }
  return result;
}

void type metadata accessor for simd_quatd(uint64_t a1)
{
}

void type metadata accessor for simd_float4x4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

Swift::Void __swiftcall MDLAnimatedQuaternionArray.reset(floatQuaternionArray:atTimes:)(Swift::OpaquePointer floatQuaternionArray, Swift::OpaquePointer atTimes)
{
}

Swift::Void __swiftcall MDLAnimatedQuaternionArray.reset(doubleQuaternionArray:atTimes:)(Swift::OpaquePointer doubleQuaternionArray, Swift::OpaquePointer atTimes)
{
}

id MDLAnimatedScalarArray.reset(floatArray:atTimes:)(uint64_t a1, uint64_t a2, SEL *a3)
{
  return [v3 *a3:a1 + 32:*(void *)(a1 + 16):a2 + 32:*(void *)(a2 + 16)];
}

uint64_t MDLAnimatedQuaternionArray.floatQuaternionArray.getter()
{
  return MDLAnimatedQuaternionArray.floatQuaternionArray.getter(type metadata accessor for simd_quatf, (SEL *)&selRef_getFloatQuaternionArray_maxCount_);
}

uint64_t MDLAnimatedQuaternionArray.doubleQuaternionArray.getter()
{
  return MDLAnimatedQuaternionArray.floatQuaternionArray.getter(type metadata accessor for simd_quatd, (SEL *)&selRef_getDoubleQuaternionArray_maxCount_);
}

uint64_t MDLAnimatedQuaternionArray.floatQuaternionArray.getter(void (*a1)(void), SEL *a2)
{
  uint64_t v5 = (uint64_t)[v2 sel_elementCount];
  uint64_t result = (uint64_t)[v2 sel_timeSampleCount];
  uint64_t v7 = v5 * result;
  if ((unsigned __int128)(v5 * (__int128)result) >> 64 != (v5 * result) >> 63)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v7 < 0)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  if (v7)
  {
    a1(0);
    uint64_t v8 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v8 + 16) = v7;
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  [v2 *a2:v8 + 32 v7];
  *(void *)(v8 + 16) = v7;
  return v8;
}

Swift::Void __swiftcall MDLAnimatedScalar.reset(floatArray:atTimes:)(Swift::OpaquePointer floatArray, Swift::OpaquePointer atTimes)
{
  [v2 resetWithFloatArray:floatArray atTimes:atTimes count:*((void *)atTimes._rawValue + 2)];
}

Swift::Void __swiftcall MDLAnimatedScalar.reset(doubleArray:atTimes:)(Swift::OpaquePointer doubleArray, Swift::OpaquePointer atTimes)
{
  [v2 resetWithDoubleArray:doubleArray atTimes:atTimes count:*((void *)atTimes._rawValue + 2)];
}

uint64_t MDLAnimatedScalar.floatArray.getter()
{
  return MDLAnimatedValue.times.getter(MEMORY[0x263F8D5C8], (SEL *)&selRef_getFloatArray_maxCount_);
}

uint64_t MDLAnimatedScalar.doubleArray.getter()
{
  return MDLAnimatedValue.times.getter(MEMORY[0x263F8D538], (SEL *)&selRef_getDoubleArray_maxCount_);
}

uint64_t MDLAnimatedValue.times.getter(uint64_t a1, SEL *a2)
{
  uint64_t result = (uint64_t)[v2 timeSampleCount];
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = result;
    if (result)
    {
      uint64_t v6 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v6 + 16) = v5;
    }
    else
    {
      uint64_t v6 = MEMORY[0x263F8EE78];
    }
    [v2 *a2:v6 + 32 timeSampleCount:[v2 timeSampleCount]];
    *(void *)(v6 + 16) = v5;
    return v6;
  }
  return result;
}

Swift::Void __swiftcall MDLAnimatedVector2.reset(float2Array:atTimes:)(Swift::OpaquePointer float2Array, Swift::OpaquePointer atTimes)
{
  [v2 resetWithFloat2Array:float2Array atTimes:atTimes count:*((void *)atTimes._rawValue + 2)];
}

Swift::Void __swiftcall MDLAnimatedVector2.reset(double2Array:atTimes:)(Swift::OpaquePointer double2Array, Swift::OpaquePointer atTimes)
{
  [v2 resetWithDouble2Array:double2Array atTimes:atTimes count:*((void *)atTimes._rawValue + 2)];
}

uint64_t MDLAnimatedVector2.float2Array.getter()
{
  return MDLAnimatedVector2.float2Array.getter(&demangling cache variable for type metadata for SIMD2<Float>, (SEL *)&selRef_getFloat2Array_maxCount_);
}

uint64_t MDLAnimatedVector2.double2Array.getter()
{
  return MDLAnimatedVector2.float2Array.getter(&demangling cache variable for type metadata for SIMD2<Double>, (SEL *)&selRef_getDouble2Array_maxCount_);
}

Swift::Void __swiftcall MDLAnimatedVector3.reset(float3Array:atTimes:)(Swift::OpaquePointer float3Array, Swift::OpaquePointer atTimes)
{
  [v2 resetWithFloat3Array:float3Array atTimes:atTimes count:*((void *)atTimes._rawValue + 2)];
}

Swift::Void __swiftcall MDLAnimatedVector3.reset(double3Array:atTimes:)(Swift::OpaquePointer double3Array, Swift::OpaquePointer atTimes)
{
  [v2 resetWithDouble3Array:double3Array atTimes:atTimes count:*((void *)atTimes._rawValue + 2)];
}

uint64_t MDLAnimatedVector3.float3Array.getter()
{
  return MDLAnimatedVector2.float2Array.getter(&demangling cache variable for type metadata for SIMD3<Float>, (SEL *)&selRef_getFloat3Array_maxCount_);
}

uint64_t MDLAnimatedVector3.double3Array.getter()
{
  return MDLAnimatedVector2.float2Array.getter(&demangling cache variable for type metadata for SIMD3<Double>, (SEL *)&selRef_getDouble3Array_maxCount_);
}

Swift::Void __swiftcall MDLAnimatedVector4.reset(float4Array:atTimes:)(Swift::OpaquePointer float4Array, Swift::OpaquePointer atTimes)
{
  [v2 resetWithFloat4Array:float4Array atTimes:atTimes count:*((void *)atTimes._rawValue + 2)];
}

Swift::Void __swiftcall MDLAnimatedVector4.reset(double4Array:atTimes:)(Swift::OpaquePointer double4Array, Swift::OpaquePointer atTimes)
{
  [v2 resetWithDouble4Array:double4Array atTimes:atTimes count:*((void *)atTimes._rawValue + 2)];
}

uint64_t MDLAnimatedVector4.float4Array.getter()
{
  return MDLAnimatedVector2.float2Array.getter(&demangling cache variable for type metadata for SIMD4<Float>, (SEL *)&selRef_getFloat4Array_maxCount_);
}

uint64_t MDLAnimatedVector4.double4Array.getter()
{
  return MDLAnimatedVector2.float2Array.getter(&demangling cache variable for type metadata for SIMD4<Double>, (SEL *)&selRef_getDouble4Array_maxCount_);
}

uint64_t MDLAnimatedVector2.float2Array.getter(uint64_t *a1, SEL *a2)
{
  uint64_t result = (uint64_t)[v2 timeSampleCount];
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = result;
    if (result)
    {
      __swift_instantiateConcreteTypeFromMangledName(a1);
      uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v7 + 16) = v6;
    }
    else
    {
      uint64_t v7 = MEMORY[0x263F8EE78];
    }
    [v2 *a2:v7 + 32:objc_msgSend(v2, sel_timeSampleCount)];
    *(void *)(v7 + 16) = v6;
    return v7;
  }
  return result;
}

Swift::Void __swiftcall MDLAnimatedMatrix4x4.reset(float4x4Array:atTimes:)(Swift::OpaquePointer float4x4Array, Swift::OpaquePointer atTimes)
{
  [v2 resetWithFloat4x4Array:float4x4Array atTimes:atTimes count:*((void *)atTimes._rawValue + 2)];
}

Swift::Void __swiftcall MDLAnimatedMatrix4x4.reset(double4Array:atTimes:)(Swift::OpaquePointer double4Array, Swift::OpaquePointer atTimes)
{
  [v2 resetWithDouble4x4Array:double4Array atTimes:atTimes count:*((void *)atTimes._rawValue + 2)];
}

uint64_t MDLAnimatedMatrix4x4.float4x4Array.getter()
{
  return MDLAnimatedMatrix4x4.float4x4Array.getter(type metadata accessor for simd_float4x4, (SEL *)&selRef_getFloat4x4Array_maxCount_);
}

uint64_t MDLAnimatedMatrix4x4.double4x4Array.getter()
{
  return MDLAnimatedMatrix4x4.float4x4Array.getter(type metadata accessor for simd_double4x4, (SEL *)&selRef_getDouble4x4Array_maxCount_);
}

uint64_t MDLAnimatedMatrix4x4.float4x4Array.getter(void (*a1)(void), SEL *a2)
{
  uint64_t result = (uint64_t)[v2 timeSampleCount];
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = result;
    if (result)
    {
      a1(0);
      uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v7 + 16) = v6;
    }
    else
    {
      uint64_t v7 = MEMORY[0x263F8EE78];
    }
    [v2 *a2:v7 + 32:objc_msgSend(v2, sel_timeSampleCount)];
    *(void *)(v7 + 16) = v6;
    return v7;
  }
  return result;
}

Swift::Void __swiftcall MDLAnimatedQuaternion.reset(floatQuaternionArray:atTimes:)(Swift::OpaquePointer floatQuaternionArray, Swift::OpaquePointer atTimes)
{
  [v2 resetWithFloatQuaternionArray:floatQuaternionArray atTimes:atTimes count:*((void *)atTimes._rawValue + 2)];
}

Swift::Void __swiftcall MDLAnimatedQuaternion.reset(doubleQuaternionArray:atTimes:)(Swift::OpaquePointer doubleQuaternionArray, Swift::OpaquePointer atTimes)
{
  [v2 resetWithDoubleQuaternionArray:doubleQuaternionArray atTimes:atTimes count:*((void *)atTimes._rawValue + 2)];
}

uint64_t MDLAnimatedQuaternion.floatQuaternionArray.getter()
{
  return MDLAnimatedMatrix4x4.float4x4Array.getter(type metadata accessor for simd_quatf, (SEL *)&selRef_getFloatQuaternionArray_maxCount_);
}

uint64_t MDLAnimatedQuaternion.doubleQuaternionArray.getter()
{
  return MDLAnimatedMatrix4x4.float4x4Array.getter(type metadata accessor for simd_quatd, (SEL *)&selRef_getDoubleQuaternionArray_maxCount_);
}

uint64_t initializeBufferWithCopyOfBuffer for simd_quatd(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_16(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for simd_quatd(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for simd_quatd(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

__n128 __swift_memcpy128_16(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t getEnumTagSinglePayload for simd_double4x4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 128)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for simd_double4x4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 128) = v3;
  return result;
}

__n128 __swift_memcpy64_16(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for simd_float4x4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for simd_float4x4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 64) = v3;
  return result;
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}