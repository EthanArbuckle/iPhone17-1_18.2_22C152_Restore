uint64_t initializeBufferWithCopyOfBuffer for simd_quatd(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
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

void type metadata accessor for simd_quatd(uint64_t a1)
{
}

void type metadata accessor for simd_quatf(uint64_t a1)
{
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

void type metadata accessor for simd_double4x4(uint64_t a1)
{
}

__n128 __swift_memcpy96_16(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

void type metadata accessor for simd_double3x4(uint64_t a1)
{
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

void type metadata accessor for simd_double2x4(uint64_t a1)
{
}

uint64_t getEnumTagSinglePayload for simd_double4x3(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 128)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for simd_double4x3(uint64_t result, int a2, int a3)
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

void type metadata accessor for simd_double4x3(uint64_t a1)
{
}

uint64_t getEnumTagSinglePayload for simd_double3x3(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 96)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for simd_double3x3(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 88) = 0;
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
  *(unsigned char *)(result + 96) = v3;
  return result;
}

void type metadata accessor for simd_double3x3(uint64_t a1)
{
}

void type metadata accessor for simd_double2x3(uint64_t a1)
{
}

void type metadata accessor for simd_double4x2(uint64_t a1)
{
}

__n128 __swift_memcpy48_16(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void type metadata accessor for simd_double3x2(uint64_t a1)
{
}

void type metadata accessor for simd_double2x2(uint64_t a1)
{
}

void type metadata accessor for simd_float4x4(uint64_t a1)
{
}

void type metadata accessor for simd_float3x4(uint64_t a1)
{
}

void type metadata accessor for simd_float2x4(uint64_t a1)
{
}

uint64_t getEnumTagSinglePayload for simd_float4x3(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for simd_float4x3(uint64_t result, int a2, int a3)
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

void type metadata accessor for simd_float4x3(uint64_t a1)
{
}

uint64_t getEnumTagSinglePayload for simd_float3x3(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for simd_float3x3(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for simd_float3x3(uint64_t a1)
{
}

void type metadata accessor for simd_float2x3(uint64_t a1)
{
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void type metadata accessor for simd_float4x2(uint64_t a1)
{
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for simd_float3x2(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for simd_float3x2(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

void type metadata accessor for simd_float3x2(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for simd_float2x2(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for simd_float2x2(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for simd_float2x2(uint64_t a1)
{
}

void type metadata accessor for simd_quatd(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t SIMD.init(_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  long long v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v16 = v2;
  v17 = (char *)v15 - v6;
  uint64_t v7 = v2 + 16;
  uint64_t v9 = v8;
  v10 = *(void (**)(void))(v2 + 16);
  v15[1] = v7;
  v10();
  dispatch thunk of SIMDStorage.init()();
  uint64_t result = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v12 = result;
    v15[0] = a1;
    if (result)
    {
      uint64_t v13 = 0;
      do
      {
        ((void (*)(char *, char *, uint64_t))v10)(v5, v17, v9);
        dispatch thunk of SIMDStorage.subscript.setter();
        ++v13;
      }
      while (v12 != v13);
    }
    v14 = *(uint64_t (**)(char *, uint64_t))(v16 + 8);
    v14((char *)v15[0], v9);
    return v14(v17, v9);
  }
  return result;
}

uint64_t SIMD2._descriptionAsArray.getter(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  v1._countAndFlagsBits = 91;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v2._countAndFlagsBits = 8236;
  v2._object = (void *)0xE200000000000000;
  String.append(_:)(v2);
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v3._countAndFlagsBits = 93;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return 0;
}

uint64_t specialized SIMD3._descriptionAsArray.getter()
{
  v0._countAndFlagsBits = 91;
  v0._object = (void *)0xE100000000000000;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 8236;
  v2._object = (void *)0xE200000000000000;
  String.append(_:)(v2);
  _print_unlocked<A, B>(_:_:)();
  v3._countAndFlagsBits = 93;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return 0;
}

{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;

  v0._countAndFlagsBits = 91;
  v0._object = (void *)0xE100000000000000;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 8236;
  v2._object = (void *)0xE200000000000000;
  String.append(_:)(v2);
  _print_unlocked<A, B>(_:_:)();
  v3._countAndFlagsBits = 93;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return 0;
}

uint64_t SIMD3._descriptionAsArray.getter(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  v1._countAndFlagsBits = 91;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v2._countAndFlagsBits = 8236;
  v2._object = (void *)0xE200000000000000;
  String.append(_:)(v2);
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v3._countAndFlagsBits = 8236;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v4._countAndFlagsBits = 93;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  return 0;
}

uint64_t specialized SIMD4._descriptionAsArray.getter()
{
  _StringGuts.grow(_:)(16);
  v0._countAndFlagsBits = 91;
  v0._object = (void *)0xE100000000000000;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 8236;
  v2._object = (void *)0xE200000000000000;
  String.append(_:)(v2);
  _print_unlocked<A, B>(_:_:)();
  v3._countAndFlagsBits = 8236;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  _print_unlocked<A, B>(_:_:)();
  v4._countAndFlagsBits = 93;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  return 0;
}

{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  _StringGuts.grow(_:)(16);
  v0._countAndFlagsBits = 91;
  v0._object = (void *)0xE100000000000000;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 8236;
  v2._object = (void *)0xE200000000000000;
  String.append(_:)(v2);
  _print_unlocked<A, B>(_:_:)();
  v3._countAndFlagsBits = 8236;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  _print_unlocked<A, B>(_:_:)();
  v4._countAndFlagsBits = 93;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  return 0;
}

uint64_t SIMD4._descriptionAsArray.getter(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  _StringGuts.grow(_:)(16);
  v1._countAndFlagsBits = 91;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v2._countAndFlagsBits = 8236;
  v2._object = (void *)0xE200000000000000;
  String.append(_:)(v2);
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v3._countAndFlagsBits = 8236;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v4._countAndFlagsBits = 8236;
  v4._object = (void *)0xE200000000000000;
  String.append(_:)(v4);
  dispatch thunk of SIMDStorage.subscript.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v5._countAndFlagsBits = 93;
  v5._object = (void *)0xE100000000000000;
  String.append(_:)(v5);
  return 0;
}

uint64_t static SIMD<>.- prefix(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v59 = a1;
  uint64_t v61 = a4;
  uint64_t v56 = *(void *)(a2 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  v64 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v54 = (char *)&v51 - v8;
  uint64_t v10 = *(void *)(v9 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  v53 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v52 = (char *)&v51 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v55 = (char *)&v51 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v21 = (char *)&v51 - v20;
  MEMORY[0x270FA5388](v19);
  v23 = (char *)&v51 - v22;
  uint64_t v58 = a3;
  uint64_t v24 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v24);
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  uint64_t v63 = v12;
  v26 = (void (*)(char *, uint64_t))(v12 + 16);
  v25 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v27 = v21;
  v28 = v25;
  v60 = v26;
  v25(v21, v23, AssociatedTypeWitness);
  v29 = v64;
  dispatch thunk of SIMDStorage.init()();
  v30 = v29;
  uint64_t v62 = v10;
  uint64_t result = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (result < 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v32 = result;
  v51 = v23;
  v33 = v55;
  if (result)
  {
    uint64_t v34 = 0;
    do
    {
      v28(v33, v21, AssociatedTypeWitness);
      dispatch thunk of SIMDStorage.subscript.setter();
      ++v34;
    }
    while (v32 != v34);
  }
  uint64_t v36 = v63 + 8;
  v35 = *(void (**)(char *, uint64_t))(v63 + 8);
  uint64_t v37 = AssociatedTypeWitness;
  v35(v27, AssociatedTypeWitness);
  v38 = v54;
  (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v54, v30, a2);
  dispatch thunk of SIMDStorage.init()();
  uint64_t result = dispatch thunk of SIMDStorage.scalarCount.getter();
  if (result < 0) {
    goto LABEL_11;
  }
  v39 = v38;
  uint64_t v63 = v36;
  v41 = v52;
  v40 = v53;
  uint64_t v42 = a2;
  v60 = v35;
  v43 = v55;
  if (result)
  {
    v44 = 0;
    v57 = (char *)result;
    do
    {
      v64 = v44 + 1;
      v45 = v39;
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of SIMDStorage.subscript.getter();
      dispatch thunk of FixedWidthInteger.subtractingReportingOverflow(_:)();
      v46 = v40;
      v47 = v40;
      uint64_t v48 = v42;
      v49 = v43;
      v50 = v60;
      v60(v46, v37);
      v50(v41, v37);
      v43 = v49;
      uint64_t v42 = v48;
      v40 = v47;
      dispatch thunk of SIMDStorage.subscript.setter();
      v39 = v45;
      v44 = v64;
    }
    while (v57 != v64);
  }
  (*(void (**)(char *, uint64_t))(v56 + 8))(v39, v42);
  return ((uint64_t (*)(char *, uint64_t))v60)(v51, v37);
}

double abs(_:)(double a1)
{
  *(void *)&double result = *(void *)&a1 & 0x7FFFFFFF7FFFFFFFLL;
  return result;
}

{
  double result;

  *(void *)&double result = *(void *)&a1 & 0x7FFFFFFF7FFFFFFFLL;
  return result;
}

float32x2_t min(_:_:)(float32x2_t a1, float32x2_t a2)
{
  return vminnm_f32(a1, a2);
}

float32x2_t max(_:_:)(float32x2_t a1, float32x2_t a2)
{
  return vmaxnm_f32(a1, a2);
}

float32x2_t min(_:_:)(float32x2_t a1, int32x2_t a2)
{
  return vminnm_f32(a1, (float32x2_t)vdup_lane_s32(a2, 0));
}

float32x2_t max(_:_:)(float32x2_t a1, int32x2_t a2)
{
  return vmaxnm_f32(a1, (float32x2_t)vdup_lane_s32(a2, 0));
}

float32x2_t clamp(_:min:max:)(float32x2_t a1, float32x2_t a2, float32x2_t a3)
{
  return vminnm_f32(vmaxnm_f32(a1, a2), a3);
}

float32x2_t clamp(_:min:max:)(float32x2_t a1, int32x2_t a2, int32x2_t a3)
{
  return vminnm_f32(vmaxnm_f32(a1, (float32x2_t)vdup_lane_s32(a2, 0)), (float32x2_t)vdup_lane_s32(a3, 0));
}

float reduce_add(_:)(float32x2_t a1)
{
  return vaddv_f32(a1);
}

float reduce_min(_:)(double a1)
{
  return fminf(*(float *)&a1, *((float *)&a1 + 1));
}

float reduce_max(_:)(double a1)
{
  return fmaxf(*(float *)&a1, *((float *)&a1 + 1));
}

int8x8_t sign(_:)(int8x8_t a1)
{
  __asm { FMOV            V2.2S, #1.0 }
  return vand_s8(vorr_s8(vand_s8(a1, (int8x8_t)0x8000000080000000), _D2), vorr_s8((int8x8_t)vcltz_f32((float32x2_t)a1), (int8x8_t)vcgtz_f32((float32x2_t)a1)));
}

float32x2_t mix(_:_:t:)(float32x2_t a1, float32x2_t a2, float32x2_t a3)
{
  return vadd_f32(vmul_f32(vsub_f32(a2, a1), a3), a1);
}

float32x2_t mix(_:_:t:)(float32x2_t a1, float32x2_t a2, float a3)
{
  return vadd_f32(vmul_n_f32(vsub_f32(a2, a1), a3), a1);
}

float32x2_t recip(_:)(float32x2_t a1)
{
  float32x2_t v1 = vrecpe_f32(a1);
  float32x2_t v2 = vmul_f32(v1, vrecps_f32(a1, v1));
  return vmul_f32(v2, vrecps_f32(a1, v2));
}

float32x2_t rsqrt(_:)(float32x2_t a1)
{
  float32x2_t v1 = vrsqrte_f32(a1);
  float32x2_t v2 = vmul_f32(v1, vrsqrts_f32(a1, vmul_f32(v1, v1)));
  return vmul_f32(v2, vrsqrts_f32(a1, vmul_f32(v2, v2)));
}

float32x2_t fmin(_:_:)(float32x2_t a1, float32x2_t a2)
{
  return vminnm_f32(a1, a2);
}

float32x2_t fmax(_:_:)(float32x2_t a1, float32x2_t a2)
{
  return vmaxnm_f32(a1, a2);
}

float32x2_t ceil(_:)(float32x2_t a1)
{
  return vrndp_f32(a1);
}

float32x2_t floor(_:)(float32x2_t a1)
{
  return vrndm_f32(a1);
}

float32x2_t trunc(_:)(float32x2_t a1)
{
  return vrnd_f32(a1);
}

float32x2_t fract(_:)(float32x2_t a1)
{
  return vminnm_f32(vsub_f32(a1, vrndm_f32(a1)), (float32x2_t)vdup_n_s32(0x3F7FFFFFu));
}

int8x8_t step(_:edge:)(float32x2_t a1, float32x2_t a2)
{
  int8x8_t v2 = (int8x8_t)vcgt_f32(a2, a1);
  __asm { FMOV            V1.2S, #1.0 }
  return vbic_s8(_D1, v2);
}

float32x2_t smoothstep(_:edge0:edge1:)(float32x2_t a1, float32x2_t a2, float32x2_t a3)
{
  float32x2_t v3 = vmaxnm_f32(vdiv_f32(vsub_f32(a1, a2), vsub_f32(a3, a2)), 0);
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v9 = vminnm_f32(v3, _D1);
  __asm { FMOV            V3.2S, #3.0 }
  return vmul_f32(vmul_f32(v9, v9), vmla_f32(_D3, (float32x2_t)0xC0000000C0000000, v9));
}

float dot(_:_:)(float32x2_t a1, float32x2_t a2)
{
  return vaddv_f32(vmul_f32(a1, a2));
}

float32x2_t project(_:_:)(float32x2_t a1, float32x2_t a2)
{
  int32x2_t v2 = (int32x2_t)vmul_f32(a1, a2);
  int32x2_t v3 = (int32x2_t)vmul_f32(a2, a2);
  float32x2_t v4 = vadd_f32((float32x2_t)vzip1_s32(v2, v3), (float32x2_t)vzip2_s32(v2, v3));
  return vmul_n_f32(a2, vdiv_f32(v4, (float32x2_t)vdup_lane_s32((int32x2_t)v4, 1)).f32[0]);
}

float length_squared(_:)(float32x2_t a1)
{
  return vaddv_f32(vmul_f32(a1, a1));
}

float length(_:)(float32x2_t a1)
{
  return sqrtf(vaddv_f32(vmul_f32(a1, a1)));
}

float norm_one(_:)(double a1)
{
  return vaddv_f32((float32x2_t)(*(void *)&a1 & 0x7FFFFFFF7FFFFFFFLL));
}

float norm_inf(_:)(double a1)
{
  return fmaxf(COERCE_FLOAT(LODWORD(a1) & 0x7FFFFFFF), COERCE_FLOAT(HIDWORD(a1) & 0x7FFFFFFF));
}

float distance_squared(_:_:)(float32x2_t a1, float32x2_t a2)
{
  float32x2_t v2 = vsub_f32(a1, a2);
  return vaddv_f32(vmul_f32(v2, v2));
}

float distance(_:_:)(float32x2_t a1, float32x2_t a2)
{
  float32x2_t v2 = vsub_f32(a1, a2);
  return sqrtf(vaddv_f32(vmul_f32(v2, v2)));
}

float32x2_t normalize(_:)(float32x2_t a1)
{
  float32x2_t v1 = vmul_f32(a1, a1);
  v1.i32[0] = vadd_f32(v1, (float32x2_t)vdup_lane_s32((int32x2_t)v1, 1)).u32[0];
  float32x2_t v2 = vrsqrte_f32((float32x2_t)v1.u32[0]);
  float32x2_t v3 = vmul_f32(v2, vrsqrts_f32((float32x2_t)v1.u32[0], vmul_f32(v2, v2)));
  return vmul_n_f32(a1, vmul_f32(v3, vrsqrts_f32((float32x2_t)v1.u32[0], vmul_f32(v3, v3))).f32[0]);
}

float32x2_t reflect(_:n:)(float32x2_t a1, float32x2_t a2)
{
  float32x2_t v2 = vmul_f32(a1, a2);
  v2.f32[0] = vaddv_f32(v2);
  v2.f32[0] = v2.f32[0] + v2.f32[0];
  return vmls_lane_f32(a1, a2, v2, 0);
}

float32x2_t refract(_:n:eta:)(float32x2_t a1, float32x2_t a2, float a3)
{
  float32x2_t v3 = vmul_f32(a1, a2);
  v3.f32[0] = vaddv_f32(v3);
  float v4 = (float)((float)-(float)(a3 * a3) * (float)(1.0 - (float)(v3.f32[0] * v3.f32[0]))) + 1.0;
  if (v4 >= 0.0)
  {
    v3.f32[0] = sqrtf(v4) + (float)(a3 * v3.f32[0]);
    return vmla_n_f32(vmul_f32(vneg_f32((float32x2_t)vdup_lane_s32((int32x2_t)v3, 0)), a2), a1, a3);
  }
  else
  {
    return 0;
  }
}

double abs(_:)(float32x4_t a1)
{
  *(void *)&double result = vabsq_f32(a1).u64[0];
  return result;
}

double min(_:_:)(float32x4_t a1, float32x4_t a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  a1.i64[0] = vminnmq_f32(a1, a2).u64[0];
  return *(double *)a1.i64;
}

{
  double result;

  *(void *)&double result = vminnmq_f32(a1, a2).u64[0];
  return result;
}

double max(_:_:)(float32x4_t a1, float32x4_t a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  a1.i64[0] = vmaxnmq_f32(a1, a2).u64[0];
  return *(double *)a1.i64;
}

{
  double result;

  *(void *)&double result = vmaxnmq_f32(a1, a2).u64[0];
  return result;
}

double min(_:_:)(float32x4_t a1, int32x2_t a2)
{
  a1.i32[3] = 0;
  float32x4_t v2 = (float32x4_t)vdupq_lane_s32(a2, 0);
  v2.i32[3] = 0;
  a1.i64[0] = vminnmq_f32(a1, v2).u64[0];
  return *(double *)a1.i64;
}

{
  double result;

  *(void *)&double result = vminnmq_f32(a1, (float32x4_t)vdupq_lane_s32(a2, 0)).u64[0];
  return result;
}

double max(_:_:)(float32x4_t a1, int32x2_t a2)
{
  a1.i32[3] = 0;
  float32x4_t v2 = (float32x4_t)vdupq_lane_s32(a2, 0);
  v2.i32[3] = 0;
  a1.i64[0] = vmaxnmq_f32(a1, v2).u64[0];
  return *(double *)a1.i64;
}

{
  double result;

  *(void *)&double result = vmaxnmq_f32(a1, (float32x4_t)vdupq_lane_s32(a2, 0)).u64[0];
  return result;
}

double clamp(_:min:max:)(float32x4_t a1, float32x4_t a2, float32x4_t a3)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  float32x4_t v3 = vmaxnmq_f32(a1, a2);
  v3.i32[3] = 0;
  a3.i32[3] = 0;
  *(void *)&double result = vminnmq_f32(v3, a3).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vminnmq_f32(vmaxnmq_f32(a1, a2), a3).u64[0];
  return result;
}

double clamp(_:min:max:)(float32x4_t a1, int32x2_t a2, int32x2_t a3)
{
  a1.i32[3] = 0;
  float32x4_t v3 = (float32x4_t)vdupq_lane_s32(a2, 0);
  v3.i32[3] = 0;
  float32x4_t v4 = vmaxnmq_f32(a1, v3);
  v4.i32[3] = 0;
  float32x4_t v5 = (float32x4_t)vdupq_lane_s32(a3, 0);
  v5.i32[3] = 0;
  *(void *)&double result = vminnmq_f32(v4, v5).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vminnmq_f32(vmaxnmq_f32(a1, (float32x4_t)vdupq_lane_s32(a2, 0)), (float32x4_t)vdupq_lane_s32(a3, 0)).u64[0];
  return result;
}

double reduce_add(_:)(int32x4_t a1)
{
  *(void *)&double result = vaddq_f32((float32x4_t)vdupq_laneq_s32(a1, 2), vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a1.i8, 1), (float32x4_t)a1)).u64[0];
  return result;
}

float reduce_min(_:)(__n128 a1)
{
  return fminf(fminf(a1.n128_f32[0], a1.n128_f32[2]), a1.n128_f32[1]);
}

float reduce_max(_:)(__n128 a1)
{
  return fmaxf(fmaxf(a1.n128_f32[0], a1.n128_f32[2]), a1.n128_f32[1]);
}

double sign(_:)(float32x4_t a1)
{
  v1.i64[0] = 0x8000000080000000;
  v1.i64[1] = 0x8000000080000000;
  __asm { FMOV            V2.4S, #1.0 }
  *(void *)&double result = vbslq_s8(vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgtzq_f32(a1)), vorrq_s8(vandq_s8((int8x16_t)a1, v1), _Q2), (int8x16_t)0).u64[0];
  return result;
}

double mix(_:_:t:)(float32x4_t a1, float32x4_t a2, float32x4_t a3)
{
  *(void *)&double result = vaddq_f32(vmulq_f32(vsubq_f32(a2, a1), a3), a1).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vaddq_f32(vmulq_f32(vsubq_f32(a2, a1), a3), a1).u64[0];
  return result;
}

float32x2_t mix(_:_:t:)(float32x4_t a1, float32x4_t a2, float a3)
{
  return vadd_f32(*(float32x2_t *)a1.f32, vmul_n_f32((float32x2_t)*(_OWORD *)&vsubq_f32(a2, a1), a3));
}

double recip(_:)(float32x4_t a1)
{
  a1.i32[3] = 0;
  float32x4_t v1 = vrecpeq_f32(a1);
  float32x4_t v2 = vmulq_f32(v1, vrecpsq_f32(a1, v1));
  a1.i64[0] = vmulq_f32(v2, vrecpsq_f32(a1, v2)).u64[0];
  return *(double *)a1.i64;
}

{
  float32x4_t v1;
  float32x4_t v2;
  double result;

  float32x4_t v1 = vrecpeq_f32(a1);
  float32x4_t v2 = vmulq_f32(v1, vrecpsq_f32(a1, v1));
  *(void *)&double result = vmulq_f32(v2, vrecpsq_f32(a1, v2)).u64[0];
  return result;
}

double rsqrt(_:)(float32x4_t a1)
{
  a1.i32[3] = 0;
  float32x4_t v1 = vrsqrteq_f32(a1);
  float32x4_t v2 = vmulq_f32(v1, vrsqrtsq_f32(a1, vmulq_f32(v1, v1)));
  a1.i64[0] = vmulq_f32(v2, vrsqrtsq_f32(a1, vmulq_f32(v2, v2))).u64[0];
  return *(double *)a1.i64;
}

{
  float32x4_t v1;
  float32x4_t v2;
  double result;

  float32x4_t v1 = vrsqrteq_f32(a1);
  float32x4_t v2 = vmulq_f32(v1, vrsqrtsq_f32(a1, vmulq_f32(v1, v1)));
  *(void *)&double result = vmulq_f32(v2, vrsqrtsq_f32(a1, vmulq_f32(v2, v2))).u64[0];
  return result;
}

double ceil(_:)(float32x4_t a1)
{
  a1.i32[3] = 0;
  a1.i64[0] = vrndpq_f32(a1).u64[0];
  return *(double *)a1.i64;
}

{
  double result;

  *(void *)&double result = vrndpq_f32(a1).u64[0];
  return result;
}

double floor(_:)(float32x4_t a1)
{
  a1.i32[3] = 0;
  a1.i64[0] = vrndmq_f32(a1).u64[0];
  return *(double *)a1.i64;
}

{
  double result;

  *(void *)&double result = vrndmq_f32(a1).u64[0];
  return result;
}

double trunc(_:)(float32x4_t a1)
{
  a1.i32[3] = 0;
  a1.i64[0] = vrndq_f32(a1).u64[0];
  return *(double *)a1.i64;
}

{
  double result;

  *(void *)&double result = vrndq_f32(a1).u64[0];
  return result;
}

double fract(_:)(float32x4_t a1)
{
  float32x4_t v1 = a1;
  v1.i32[3] = 0;
  float32x4_t v2 = vsubq_f32(a1, vrndmq_f32(v1));
  v2.i32[3] = 0;
  *(void *)&double result = vminnmq_f32(v2, (float32x4_t)xmmword_212833750).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vminnmq_f32(vsubq_f32(a1, vrndmq_f32(a1)), (float32x4_t)vdupq_n_s32(0x3F7FFFFFu)).u64[0];
  return result;
}

double step(_:edge:)(float32x4_t a1, float32x4_t a2)
{
  int8x16_t v2 = (int8x16_t)vcgtq_f32(a2, a1);
  __asm { FMOV            V1.4S, #1.0 }
  *(void *)&double result = vbslq_s8(v2, (int8x16_t)0, _Q1).u64[0];
  return result;
}

{
  int8x16_t v2;
  double result;

  int8x16_t v2 = (int8x16_t)vcgtq_f32(a2, a1);
  __asm { FMOV            V1.4S, #1.0 }
  *(void *)&double result = vbicq_s8(_Q1, v2).u64[0];
  return result;
}

double smoothstep(_:edge0:edge1:)(float32x4_t a1, float32x4_t a2, float32x4_t a3)
{
  float32x4_t v3 = vdivq_f32(vsubq_f32(a1, a2), vsubq_f32(a3, a2));
  v3.i32[3] = 0;
  float32x4_t v4 = vmaxnmq_f32(v3, (float32x4_t)0);
  v4.i32[3] = 0;
  float32x4_t v5 = vminnmq_f32(v4, (float32x4_t)xmmword_212833760);
  v6.i64[0] = 0xC0000000C0000000;
  v6.i64[1] = 0xC0000000C0000000;
  __asm { FMOV            V3.4S, #3.0 }
  *(void *)&double result = vmulq_f32(vmulq_f32(v5, v5), vmlaq_f32(_Q3, v6, v5)).u64[0];
  return result;
}

{
  float32x4_t v3;
  float32x4_t v9;
  float32x4_t v10;
  double result;

  float32x4_t v3 = vmaxnmq_f32(vdivq_f32(vsubq_f32(a1, a2), vsubq_f32(a3, a2)), (float32x4_t)0);
  __asm { FMOV            V1.4S, #1.0 }
  float32x2_t v9 = vminnmq_f32(v3, _Q1);
  v10.i64[0] = 0xC0000000C0000000;
  v10.i64[1] = 0xC0000000C0000000;
  __asm { FMOV            V3.4S, #3.0 }
  *(void *)&double result = vmulq_f32(vmulq_f32(v9, v9), vmlaq_f32(_Q3, v10, v9)).u64[0];
  return result;
}

float dot(_:_:)(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vmulq_f32(a1, a2);
  return v2.f32[2] + vaddv_f32(*(float32x2_t *)v2.f32);
}

{
  int8x16_t v2;

  float32x4_t v2 = (int8x16_t)vmulq_f32(a1, a2);
  return vaddv_f32(vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL)));
}

double project(_:_:)(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vmulq_f32(a1, a2);
  float32x4_t v3 = vmulq_f32(a2, a2);
  *(void *)&double result = vmulq_n_f32(a2, vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), vaddq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v2.f32, 1))), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1)))).f32[0]).u64[0];
  return result;
}

{
  int8x16_t v2;
  int8x16_t v3;
  double result;

  float32x4_t v2 = (int8x16_t)vmulq_f32(a1, a2);
  *(float32x2_t *)v2.i8 = vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
  float32x4_t v3 = (int8x16_t)vmulq_f32(a2, a2);
  *(float32x2_t *)v3.i8 = vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
  *(float32x2_t *)v2.i8 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v2.i8, *(int32x2_t *)v3.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v2.i8, *(int32x2_t *)v3.i8));
  *(void *)&double result = vmulq_n_f32(a2, vdiv_f32(*(float32x2_t *)v2.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.i8, 1)).f32[0]).u64[0];
  return result;
}

float length_squared(_:)(float32x4_t a1)
{
  float32x4_t v1 = vmulq_f32(a1, a1);
  return v1.f32[2] + vaddv_f32(*(float32x2_t *)v1.f32);
}

{
  int8x16_t v1;

  float32x4_t v1 = (int8x16_t)vmulq_f32(a1, a1);
  return vaddv_f32(vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL)));
}

float length(_:)(float32x4_t a1)
{
  float32x4_t v1 = vmulq_f32(a1, a1);
  return sqrtf(v1.f32[2] + vaddv_f32(*(float32x2_t *)v1.f32));
}

{
  int8x16_t v1;

  float32x4_t v1 = (int8x16_t)vmulq_f32(a1, a1);
  return sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL))));
}

double norm_one(_:)(float32x4_t a1)
{
  float32x4_t v1 = vabsq_f32(a1);
  *(void *)&double result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v1, 2), vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v1.f32, 1), v1)).u64[0];
  return result;
}

float norm_inf(_:)(float32x4_t a1)
{
  float32x4_t v1 = vabsq_f32(a1);
  return fmaxf(fmaxf(v1.f32[0], v1.f32[2]), v1.f32[1]);
}

float distance_squared(_:_:)(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vsubq_f32(a1, a2);
  float32x4_t v3 = vmulq_f32(v2, v2);
  return v3.f32[2] + vaddv_f32(*(float32x2_t *)v3.f32);
}

{
  float32x4_t v2;
  int8x16_t v3;

  float32x4_t v2 = vsubq_f32(a1, a2);
  float32x4_t v3 = (int8x16_t)vmulq_f32(v2, v2);
  return vaddv_f32(vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL)));
}

float distance(_:_:)(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vsubq_f32(a1, a2);
  float32x4_t v3 = vmulq_f32(v2, v2);
  return sqrtf(v3.f32[2] + vaddv_f32(*(float32x2_t *)v3.f32));
}

{
  float32x4_t v2;
  int8x16_t v3;

  float32x4_t v2 = vsubq_f32(a1, a2);
  float32x4_t v3 = (int8x16_t)vmulq_f32(v2, v2);
  return sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL))));
}

double normalize(_:)(float32x4_t a1)
{
  int32x4_t v1 = (int32x4_t)vmulq_f32(a1, a1);
  v1.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v1, 2), vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v1.i8, 1))).u32[0];
  float32x2_t v2 = vrsqrte_f32((float32x2_t)v1.u32[0]);
  float32x2_t v3 = vmul_f32(v2, vrsqrts_f32((float32x2_t)v1.u32[0], vmul_f32(v2, v2)));
  *(void *)&double result = vmulq_n_f32(a1, vmul_f32(v3, vrsqrts_f32((float32x2_t)v1.u32[0], vmul_f32(v3, v3))).f32[0]).u64[0];
  return result;
}

{
  int8x16_t v1;
  float32x2_t v2;
  float32x2_t v3;
  double result;

  int32x4_t v1 = (int8x16_t)vmulq_f32(a1, a1);
  *(float32x2_t *)v1.i8 = vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL));
  v1.i32[0] = vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v1.i8, 1)).u32[0];
  float32x2_t v2 = vrsqrte_f32((float32x2_t)v1.u32[0]);
  float32x2_t v3 = vmul_f32(v2, vrsqrts_f32((float32x2_t)v1.u32[0], vmul_f32(v2, v2)));
  *(void *)&double result = vmulq_n_f32(a1, vmul_f32(v3, vrsqrts_f32((float32x2_t)v1.u32[0], vmul_f32(v3, v3))).f32[0]).u64[0];
  return result;
}

double reflect(_:n:)(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vmulq_f32(a1, a2);
  v2.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), vaddq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v2.f32, 1))).u64[0];
  v2.f32[0] = v2.f32[0] + v2.f32[0];
  *(void *)&double result = vmlsq_lane_f32(a1, a2, *(float32x2_t *)v2.f32, 0).u64[0];
  return result;
}

{
  int8x16_t v2;
  double result;

  float32x4_t v2 = (int8x16_t)vmulq_f32(a1, a2);
  *(float32x2_t *)v2.i8 = vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
  *(float *)v2.i32 = vaddv_f32(*(float32x2_t *)v2.i8);
  *(float *)v2.i32 = *(float *)v2.i32 + *(float *)v2.i32;
  *(void *)&double result = vmlsq_lane_f32(a1, a2, *(float32x2_t *)v2.i8, 0).u64[0];
  return result;
}

double refract(_:n:eta:)(float32x4_t a1, float32x4_t a2, float a3)
{
  float32x4_t v3 = vmulq_f32(a1, a2);
  LODWORD(_S4) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).u32[0];
  __asm { FMLS            S5, S4, V4.S[0] }
  float v10 = (float)((float)-(float)(a3 * a3) * _S5) + 1.0;
  int32x2_t v11 = 0;
  if (v10 >= 0.0)
  {
    *(float *)v11.i32 = sqrtf(v10) + (float)(a3 * _S4);
    int32x2_t v11 = (int32x2_t)vmlaq_n_f32(vmulq_f32(a2, vnegq_f32((float32x4_t)vdupq_lane_s32(v11, 0))), a1, a3).u64[0];
  }
  return *(double *)&v11;
}

{
  int8x16_t v3;
  float32x2_t v4;
  float v5;
  double result;

  float32x4_t v3 = (int8x16_t)vmulq_f32(a1, a2);
  float32x4_t v4 = vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
  v4.f32[0] = vaddv_f32(v4);
  float32x4_t v5 = (float)((float)-(float)(a3 * a3) * (float)(1.0 - (float)(v4.f32[0] * v4.f32[0]))) + 1.0;
  if (v5 < 0.0) {
    return 0.0;
  }
  v4.f32[0] = sqrtf(v5) + (float)(a3 * v4.f32[0]);
  *(void *)&double result = vmlaq_n_f32(vmulq_f32(vnegq_f32((float32x4_t)vdupq_lane_s32((int32x2_t)v4, 0)), a2), a1, a3).u64[0];
  return result;
}

float reduce_add(_:)(int8x16_t a1)
{
  return vaddv_f32(vadd_f32(*(float32x2_t *)a1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(a1, a1, 8uLL)));
}

{
  int32x2_t v1;
  float result;

  int32x4_t v1 = vadd_s32(*(int32x2_t *)a1.i8, (int32x2_t)*(_OWORD *)&vextq_s8(a1, a1, 8uLL));
  LODWORD(result) = vadd_s32(v1, vdup_lane_s32(v1, 1)).u32[0];
  return result;
}

{
  int32x2_t v1;
  float result;

  int32x4_t v1 = vadd_s32(*(int32x2_t *)a1.i8, (int32x2_t)*(_OWORD *)&vextq_s8(a1, a1, 8uLL));
  LODWORD(result) = vadd_s32(v1, vdup_lane_s32(v1, 1)).u32[0];
  return result;
}

float reduce_min(_:)(float32x4_t a1)
{
  return vminvq_f32(a1);
}

float reduce_max(_:)(float32x4_t a1)
{
  return vmaxvq_f32(a1);
}

double sign(_:)(int8x16_t a1)
{
  v1.i64[0] = 0x8000000080000000;
  v1.i64[1] = 0x8000000080000000;
  __asm { FMOV            V2.4S, #1.0 }
  *(void *)&double result = vandq_s8(vorrq_s8(vandq_s8(a1, v1), _Q2), vorrq_s8((int8x16_t)vcltzq_f32((float32x4_t)a1), (int8x16_t)vcgtzq_f32((float32x4_t)a1))).u64[0];
  return result;
}

{
  double result;

  __asm { FMOV            V2.2D, #1.0 }
  *(void *)&double result = vandq_s8(vorrq_s8(vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x8000000000000000)), _Q2), vorrq_s8((int8x16_t)vcltzq_f64((float64x2_t)a1), (int8x16_t)vcgtzq_f64((float64x2_t)a1))).u64[0];
  return result;
}

{
  double result;

  __asm { FMOV            V4.2D, #1.0 }
  *(void *)&double result = vandq_s8(vorrq_s8(vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x8000000000000000)), _Q4), vorrq_s8((int8x16_t)vcltzq_f64((float64x2_t)a1), (int8x16_t)vcgtzq_f64((float64x2_t)a1))).u64[0];
  return result;
}

{
  double result;

  __asm { FMOV            V4.2D, #1.0 }
  *(void *)&double result = vandq_s8(vorrq_s8(vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x8000000000000000)), _Q4), vorrq_s8((int8x16_t)vcltzq_f64((float64x2_t)a1), (int8x16_t)vcgtzq_f64((float64x2_t)a1))).u64[0];
  return result;
}

double mix(_:_:t:)(float32x4_t a1, float32x4_t a2, float a3)
{
  *(void *)&double result = vaddq_f32(vmulq_n_f32(vsubq_f32(a2, a1), a3), a1).u64[0];
  return result;
}

double fmin(_:_:)(float32x4_t a1, float32x4_t a2)
{
  *(void *)&double result = vminnmq_f32(a1, a2).u64[0];
  return result;
}

double fmax(_:_:)(float32x4_t a1, float32x4_t a2)
{
  *(void *)&double result = vmaxnmq_f32(a1, a2).u64[0];
  return result;
}

float norm_one(_:)(__n128 a1)
{
  return vaddv_f32(vadd_f32((float32x2_t)(a1.n128_u64[0] & 0x7FFFFFFF7FFFFFFFLL), (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)(*(_OWORD *)&a1 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), (int8x16_t)(*(_OWORD *)&a1 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), 8uLL)));
}

float norm_inf(_:)(__n128 a1)
{
  return vmaxvq_f32((float32x4_t)(*(_OWORD *)&a1 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)));
}

Swift::Float __swiftcall sign(_:)(Swift::Float a1)
{
  v1.i32[0] = 1.0;
  v2.i64[0] = 0x8000000080000000;
  v2.i64[1] = 0x8000000080000000;
  v1.i32[0] = vbslq_s8(v2, v1, *(int8x16_t *)&a1).u32[0];
  if (a1 == 0.0) {
    *(float *)v1.i32 = 0.0;
  }
  return *(float *)v1.i32;
}

Swift::Float __swiftcall recip(_:)(Swift::Float a1)
{
  uint64_t v1 = LODWORD(a1);
  float32x2_t v2 = vrecpe_f32((float32x2_t)LODWORD(a1));
  float32x2_t v3 = vmul_f32(v2, vrecps_f32((float32x2_t)v1, v2));
  LODWORD(result) = vmul_f32(v3, vrecps_f32((float32x2_t)v1, v3)).u32[0];
  return result;
}

Swift::Float __swiftcall rsqrt(_:)(Swift::Float a1)
{
  uint64_t v1 = LODWORD(a1);
  float32x2_t v2 = vrsqrte_f32((float32x2_t)LODWORD(a1));
  float32x2_t v3 = vmul_f32(v2, vrsqrts_f32((float32x2_t)v1, vmul_f32(v2, v2)));
  LODWORD(result) = vmul_f32(v3, vrsqrts_f32((float32x2_t)v1, vmul_f32(v3, v3))).u32[0];
  return result;
}

Swift::Float __swiftcall step(_:edge:)(Swift::Float _, Swift::Float edge)
{
  BOOL v2 = _ < edge;
  Swift::Float result = 0.0;
  if (!v2) {
    return 1.0;
  }
  return result;
}

double cross(_:_:)()
{
  return 0.0;
}

{
  return *(double *)&_PromotedConst;
}

double cross(_:_:)(float32x4_t a1, int32x4_t a2)
{
  int32x4_t v2 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(a2, a2), (int8x16_t)a2, 0xCuLL), vnegq_f32(a1)), (float32x4_t)a2, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a1, (int32x4_t)a1), (int8x16_t)a1, 0xCuLL));
  *(void *)&double result = vextq_s8((int8x16_t)vuzp1q_s32(v2, v2), (int8x16_t)v2, 0xCuLL).u64[0];
  return result;
}

double abs(_:)(int8x16_t a1)
{
  *(void *)&double result = vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)).u64[0];
  return result;
}

double min(_:_:)(float64x2_t a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(a1, a2);
  return result;
}

double max(_:_:)(float64x2_t a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmaxnmq_f64(a1, a2);
  return result;
}

double min(_:_:)(float64x2_t a1, double a2)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0));
  return result;
}

double max(_:_:)(float64x2_t a1, double a2)
{
  *(void *)&double result = *(_OWORD *)&vmaxnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0));
  return result;
}

double clamp(_:min:max:)(float64x2_t a1, float64x2_t a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(vmaxnmq_f64(a1, a2), a3);
  return result;
}

double clamp(_:min:max:)(float64x2_t a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(vmaxnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0)), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0));
  return result;
}

double reduce_add(_:)(float64x2_t a1)
{
  return vaddvq_f64(a1);
}

double reduce_min(_:)(float64x2_t a1)
{
  return vpminq_f64(a1);
}

double reduce_max(_:)(float64x2_t a1)
{
  return vpmaxq_f64(a1);
}

double mix(_:_:t:)(float64x2_t a1, float64x2_t a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmulq_f64(vsubq_f64(a2, a1), a3), a1);
  return result;
}

double mix(_:_:t:)(float64x2_t a1, float64x2_t a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmulq_n_f64(vsubq_f64(a2, a1), a3), a1);
  return result;
}

double recip(_:)(float64x2_t a1)
{
  __asm { FMOV            V1.2D, #1.0 }
  *(void *)&double result = *(_OWORD *)&vdivq_f64(_Q1, a1);
  return result;
}

{
  double result;

  __asm { FMOV            V2.2D, #1.0 }
  *(void *)&double result = *(_OWORD *)&vdivq_f64(_Q2, a1);
  return result;
}

{
  double result;

  __asm { FMOV            V2.2D, #1.0 }
  *(void *)&double result = *(_OWORD *)&vdivq_f64(_Q2, a1);
  return result;
}

double rsqrt(_:)(float64x2_t a1)
{
  __asm { FMOV            V1.2D, #1.0 }
  *(void *)&double result = *(_OWORD *)&vdivq_f64(_Q1, vsqrtq_f64(a1));
  return result;
}

{
  double result;

  __asm { FMOV            V2.2D, #1.0 }
  *(void *)&double result = *(_OWORD *)&vdivq_f64(_Q2, vsqrtq_f64(a1));
  return result;
}

{
  double result;

  __asm { FMOV            V2.2D, #1.0 }
  *(void *)&double result = *(_OWORD *)&vdivq_f64(_Q2, vsqrtq_f64(a1));
  return result;
}

double fmin(_:_:)(float64x2_t a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(a1, a2);
  return result;
}

double fmax(_:_:)(float64x2_t a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmaxnmq_f64(a1, a2);
  return result;
}

double ceil(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vrndpq_f64(a1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vrndpq_f64(a1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vrndpq_f64(a1);
  return result;
}

double floor(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vrndmq_f64(a1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vrndmq_f64(a1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vrndmq_f64(a1);
  return result;
}

double trunc(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vrndq_f64(a1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vrndq_f64(a1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vrndq_f64(a1);
  return result;
}

double fract(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(vsubq_f64(a1, vrndmq_f64(a1)), (float64x2_t)vdupq_n_s64(0x3FEFFFFFFFFFFFFFuLL));
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vminnmq_f64(vsubq_f64(a1, vrndmq_f64(a1)), (float64x2_t)vdupq_n_s64(0x3FEFFFFFFFFFFFFFuLL));
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vminnmq_f64(vsubq_f64(a1, vrndmq_f64(a1)), (float64x2_t)vdupq_n_s64(0x3FEFFFFFFFFFFFFFuLL));
  return result;
}

double step(_:edge:)(float64x2_t a1, float64x2_t a2)
{
  int8x16_t v2 = (int8x16_t)vcgtq_f64(a2, a1);
  __asm { FMOV            V1.2D, #1.0 }
  *(void *)&double result = vbicq_s8(_Q1, v2).u64[0];
  return result;
}

double smoothstep(_:edge0:edge1:)(float64x2_t a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v3 = vmaxnmq_f64(vdivq_f64(vsubq_f64(a1, a2), vsubq_f64(a3, a2)), (float64x2_t)0);
  __asm { FMOV            V1.2D, #1.0 }
  float64x2_t v9 = vminnmq_f64(v3, _Q1);
  __asm
  {
    FMOV            V2.2D, #-2.0
    FMOV            V3.2D, #3.0
  }
  *(void *)&double result = *(_OWORD *)&vmulq_f64(vmulq_f64(v9, v9), vmlaq_f64(_Q3, _Q2, v9));
  return result;
}

double dot(_:_:)(float64x2_t a1, float64x2_t a2)
{
  return vaddvq_f64(vmulq_f64(a1, a2));
}

double project(_:_:)(float64x2_t a1, float64x2_t a2)
{
  int64x2_t v2 = (int64x2_t)vmulq_f64(a1, a2);
  int64x2_t v3 = (int64x2_t)vmulq_f64(a2, a2);
  float64x2_t v4 = vaddq_f64((float64x2_t)vzip1q_s64(v2, v3), (float64x2_t)vzip2q_s64(v2, v3));
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a2, vdivq_f64(v4, (float64x2_t)vdupq_laneq_s64((int64x2_t)v4, 1)).f64[0]);
  return result;
}

double length_squared(_:)(float64x2_t a1)
{
  return vaddvq_f64(vmulq_f64(a1, a1));
}

double length(_:)(float64x2_t a1)
{
  return sqrt(vaddvq_f64(vmulq_f64(a1, a1)));
}

double norm_one(_:)(int8x16_t a1)
{
  return vaddvq_f64((float64x2_t)vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)));
}

double norm_inf(_:)(int8x16_t a1)
{
  return vpmaxq_f64((float64x2_t)vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)));
}

double distance_squared(_:_:)(float64x2_t a1, float64x2_t a2)
{
  float64x2_t v2 = vsubq_f64(a1, a2);
  return vaddvq_f64(vmulq_f64(v2, v2));
}

double distance(_:_:)(float64x2_t a1, float64x2_t a2)
{
  float64x2_t v2 = vsubq_f64(a1, a2);
  return sqrt(vaddvq_f64(vmulq_f64(v2, v2)));
}

double normalize(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, 1.0 / sqrt(vaddvq_f64(vmulq_f64(a1, a1))));
  return result;
}

double reflect(_:n:)(float64x2_t a1, float64x2_t a2)
{
  double v2 = vaddvq_f64(vmulq_f64(a1, a2));
  *(void *)&double result = *(_OWORD *)&vmlsq_lane_f64(a1, a2, v2 + v2, 0);
  return result;
}

double refract(_:n:eta:)(float64x2_t a1, float64x2_t a2, double a3)
{
  double v3 = vaddvq_f64(vmulq_f64(a1, a2));
  double v4 = -(a3 * a3) * (1.0 - v3 * v3) + 1.0;
  if (v4 < 0.0) {
    return 0.0;
  }
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmulq_f64(vnegq_f64((float64x2_t)vdupq_lane_s64(COERCE__INT64(sqrt(v4) + a3 * v3), 0)), a2), a1, a3);
  return result;
}

double min(_:_:)(float64x2_t a1, double a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(a1, a3);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vminnmq_f64(a1, a3);
  return result;
}

double max(_:_:)(float64x2_t a1, double a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmaxnmq_f64(a1, a3);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmaxnmq_f64(a1, a3);
  return result;
}

double min(_:_:)(float64x2_t a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0));
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vminnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0));
  return result;
}

double max(_:_:)(float64x2_t a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vmaxnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0));
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmaxnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0));
  return result;
}

double clamp(_:min:max:)(float64x2_t a1, double a2, float64x2_t a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(vmaxnmq_f64(a1, a3), a5);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vminnmq_f64(vmaxnmq_f64(a1, a3), a5);
  return result;
}

double clamp(_:min:max:)(float64x2_t a1, double a2, double a3, double a4)
{
  *(void *)&double result = *(_OWORD *)&vminnmq_f64(vmaxnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0)), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0));
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vminnmq_f64(vmaxnmq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0)), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0));
  return result;
}

double reduce_add(_:)(int64x2_t a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vaddq_f64((float64x2_t)vdupq_laneq_s64(a1, 1), (float64x2_t)a1), a2);
  return result;
}

double reduce_min(_:)(__n128 a1, double a2)
{
  return fmin(fmin(a1.n128_f64[0], a2), a1.n128_f64[1]);
}

double reduce_max(_:)(__n128 a1, double a2)
{
  return fmax(fmax(a1.n128_f64[0], a2), a1.n128_f64[1]);
}

double mix(_:_:t:)(float64x2_t a1, double a2, float64x2_t a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmulq_f64(vsubq_f64(a3, a1), a5), a1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmulq_f64(vsubq_f64(a3, a1), a5), a1);
  return result;
}

double mix(_:_:t:)(float64x2_t a1, double a2, float64x2_t a3, double a4, double a5)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmulq_n_f64(vsubq_f64(a3, a1), a5), a1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmulq_n_f64(vsubq_f64(a3, a1), a5), a1);
  return result;
}

double step(_:edge:)(float64x2_t a1, double a2, float64x2_t a3)
{
  int8x16_t v3 = (int8x16_t)vcgtq_f64(a3, a1);
  __asm { FMOV            V2.2D, #1.0 }
  *(void *)&double result = vbicq_s8(_Q2, v3).u64[0];
  return result;
}

{
  int8x16_t v3;
  double result;

  int8x16_t v3 = (int8x16_t)vcgtq_f64(a3, a1);
  __asm { FMOV            V2.2D, #1.0 }
  *(void *)&double result = vbicq_s8(_Q2, v3).u64[0];
  return result;
}

double smoothstep(_:edge0:edge1:)(float64x2_t a1, double a2, float64x2_t a3, double a4, float64x2_t a5)
{
  float64x2_t v5 = vmaxnmq_f64(vdivq_f64(vsubq_f64(a1, a3), vsubq_f64(a5, a3)), (float64x2_t)0);
  __asm { FMOV            V2.2D, #1.0 }
  float64x2_t v11 = vminnmq_f64(v5, _Q2);
  __asm
  {
    FMOV            V4.2D, #-2.0
    FMOV            V5.2D, #3.0
  }
  *(void *)&double result = *(_OWORD *)&vmulq_f64(vmlaq_f64(_Q5, _Q4, v11), vmulq_f64(v11, v11));
  return result;
}

{
  float64x2_t v5;
  float64x2_t v11;
  double result;

  float64x2_t v5 = vmaxnmq_f64(vdivq_f64(vsubq_f64(a1, a3), vsubq_f64(a5, a3)), (float64x2_t)0);
  __asm { FMOV            V2.2D, #1.0 }
  float64x2_t v11 = vminnmq_f64(v5, _Q2);
  __asm
  {
    FMOV            V4.2D, #-2.0
    FMOV            V5.2D, #3.0
  }
  *(void *)&double result = *(_OWORD *)&vmulq_f64(vmulq_f64(v11, v11), vmlaq_f64(_Q5, _Q4, v11));
  return result;
}

double dot(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v4 = vmulq_f64(a1, a3);
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmulq_f64(a2, a4), vaddq_f64(v4, (float64x2_t)vdupq_laneq_s64((int64x2_t)v4, 1)));
  return result;
}

{
  return vaddvq_f64(vaddq_f64(vmulq_f64(a1, a3), vmulq_f64(a2, a4)));
}

double project(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a3, (vmulq_f64(a2, a4).f64[0] + vaddvq_f64(vmulq_f64(a1, a3)))/ (vmulq_f64(a4, a4).f64[0] + vaddvq_f64(vmulq_f64(a3, a3))));
  return result;
}

{
  int64x2_t v4;
  int64x2_t v5;
  float64x2_t v6;
  double result;

  float64x2_t v4 = (int64x2_t)vaddq_f64(vmulq_f64(a1, a3), vmulq_f64(a2, a4));
  float64x2_t v5 = (int64x2_t)vaddq_f64(vmulq_f64(a3, a3), vmulq_f64(a4, a4));
  float32x4_t v6 = vaddq_f64((float64x2_t)vzip1q_s64(v4, v5), (float64x2_t)vzip2q_s64(v4, v5));
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a3, vdivq_f64(v6, (float64x2_t)vdupq_laneq_s64((int64x2_t)v6, 1)).f64[0]);
  return result;
}

double length_squared(_:)(float64x2_t a1, float64x2_t a2)
{
  float64x2_t v2 = vmulq_f64(a1, a1);
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmulq_f64(a2, a2), vaddq_f64(v2, (float64x2_t)vdupq_laneq_s64((int64x2_t)v2, 1)));
  return result;
}

{
  return vaddvq_f64(vaddq_f64(vmulq_f64(a1, a1), vmulq_f64(a2, a2)));
}

double length(_:)(float64x2_t a1, float64x2_t a2)
{
  float64x2_t v2 = vmulq_f64(a1, a1);
  return sqrt(vaddq_f64(vmulq_f64(a2, a2), vaddq_f64(v2, (float64x2_t)vdupq_laneq_s64((int64x2_t)v2, 1))).f64[0]);
}

{
  return sqrt(vaddvq_f64(vaddq_f64(vmulq_f64(a1, a1), vmulq_f64(a2, a2))));
}

float64_t norm_one(_:)(float64x2_t a1, float64x2_t a2)
{
  return vabsq_f64(a2).f64[0] + vaddvq_f64(vabsq_f64(a1));
}

double norm_inf(_:)(float64x2_t a1, float64x2_t a2)
{
  float64x2_t v2 = vabsq_f64(a1);
  return fmax(fmax(v2.f64[0], vabsq_f64(a2).f64[0]), v2.f64[1]);
}

double distance_squared(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v4 = vsubq_f64(a2, a4);
  float64x2_t v5 = vsubq_f64(a1, a3);
  float64x2_t v6 = vmulq_f64(v5, v5);
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmulq_f64(v4, v4), vaddq_f64(v6, (float64x2_t)vdupq_laneq_s64((int64x2_t)v6, 1)));
  return result;
}

{
  float64x2_t v4;
  float64x2_t v5;

  float64x2_t v4 = vsubq_f64(a1, a3);
  float64x2_t v5 = vsubq_f64(a2, a4);
  return vaddvq_f64(vaddq_f64(vmulq_f64(v4, v4), vmulq_f64(v5, v5)));
}

double distance(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v4 = vsubq_f64(a2, a4);
  float64x2_t v5 = vsubq_f64(a1, a3);
  float64x2_t v6 = vmulq_f64(v5, v5);
  return sqrt(vaddq_f64(vmulq_f64(v4, v4), vaddq_f64(v6, (float64x2_t)vdupq_laneq_s64((int64x2_t)v6, 1))).f64[0]);
}

{
  float64x2_t v4;
  float64x2_t v5;

  float64x2_t v4 = vsubq_f64(a1, a3);
  float64x2_t v5 = vsubq_f64(a2, a4);
  return sqrt(vaddvq_f64(vaddq_f64(vmulq_f64(v4, v4), vmulq_f64(v5, v5))));
}

double normalize(_:)(float64x2_t a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, 1.0 / sqrt(vmulq_f64(a2, a2).f64[0] + vaddvq_f64(vmulq_f64(a1, a1))));
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, 1.0 / sqrt(vaddvq_f64(vaddq_f64(vmulq_f64(a1, a1), vmulq_f64(a2, a2)))));
  return result;
}

double reflect(_:n:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  double v4 = vmulq_f64(a2, a4).f64[0];
  double v5 = vaddvq_f64(vmulq_f64(a1, a3));
  *(void *)&double result = *(_OWORD *)&vmlsq_lane_f64(a1, a3, v4 + v5 + v4 + v5, 0);
  return result;
}

{
  double v4;
  double result;

  double v4 = vaddvq_f64(vaddq_f64(vmulq_f64(a1, a3), vmulq_f64(a2, a4)));
  *(void *)&double result = *(_OWORD *)&vmlsq_lane_f64(a1, a3, v4 + v4, 0);
  return result;
}

float64x2_t refract(_:n:eta:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, double a5)
{
  float64x2_t result = vmulq_f64(a2, a4);
  result.f64[0] = result.f64[0] + vaddvq_f64(vmulq_f64(a1, a3));
  double v7 = -(a5 * a5) * (1.0 - result.f64[0] * result.f64[0]) + 1.0;
  if (v7 >= 0.0) {
    return vmlaq_n_f64(vmulq_f64(a3, vnegq_f64((float64x2_t)vdupq_lane_s64(COERCE__INT64(sqrt(v7) + a5 * result.f64[0]), 0))), a1, a5);
  }
  else {
    result.f64[0] = 0.0;
  }
  return result;
}

double reduce_add(_:)(float64x2_t a1, float64x2_t a2)
{
  return vaddvq_f64(vaddq_f64(a1, a2));
}

double reduce_min(_:)(float64x2_t a1, float64x2_t a2)
{
  return vpminq_f64(vminnmq_f64(a1, a2));
}

double reduce_max(_:)(float64x2_t a1, float64x2_t a2)
{
  return vpmaxq_f64(vmaxnmq_f64(a1, a2));
}

double norm_one(_:)(int8x16_t a1, int8x16_t a2)
{
  int8x16_t v2 = (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  return vaddvq_f64(vaddq_f64((float64x2_t)vandq_s8(a1, v2), (float64x2_t)vandq_s8(a2, v2)));
}

double norm_inf(_:)(int8x16_t a1, int8x16_t a2)
{
  int8x16_t v2 = (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  return vpmaxq_f64(vmaxnmq_f64((float64x2_t)vandq_s8(a1, v2), (float64x2_t)vandq_s8(a2, v2)));
}

double refract(_:n:eta:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, double a5)
{
  double v5 = vaddvq_f64(vaddq_f64(vmulq_f64(a1, a3), vmulq_f64(a2, a4)));
  double v6 = -(a5 * a5) * (1.0 - v5 * v5) + 1.0;
  double v7 = 0.0;
  if (v6 >= 0.0) {
    *(void *)&double v7 = *(_OWORD *)&vmlaq_n_f64(vmulq_f64(a3, vnegq_f64((float64x2_t)vdupq_lane_s64(COERCE__INT64(sqrt(v6) + a5 * v5), 0))), a1, a5);
  }
  return v7;
}

Swift::Double __swiftcall sign(_:)(Swift::Double a1)
{
  v1.i64[0] = 1.0;
  v2.f64[0] = NAN;
  v2.f64[1] = NAN;
  v1.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v2), v1, *(int8x16_t *)&a1).u64[0];
  if (a1 == 0.0) {
    *(double *)v1.i64 = 0.0;
  }
  return *(double *)v1.i64;
}

Swift::Double __swiftcall recip(_:)(Swift::Double a1)
{
  return 1.0 / a1;
}

Swift::Double __swiftcall rsqrt(_:)(Swift::Double a1)
{
  return 1.0 / sqrt(a1);
}

Swift::Double __swiftcall step(_:edge:)(Swift::Double _, Swift::Double edge)
{
  BOOL v2 = _ < edge;
  Swift::Double result = 0.0;
  if (!v2) {
    return 1.0;
  }
  return result;
}

double cross(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  int64x2_t v4 = (int64x2_t)vmlaq_laneq_f64(vmulq_laneq_f64(vnegq_f64(a2), a3, 1), a4, a1, 1);
  a4.f64[1] = a3.f64[0];
  a2.f64[1] = a1.f64[0];
  *(void *)&double result = vzip1q_s64(v4, (int64x2_t)vmlaq_f64(vmulq_f64(a4, vnegq_f64(a1)), a3, a2)).u64[0];
  return result;
}

int32x2_t abs(_:)(int32x2_t a1)
{
  return vabs_s32(a1);
}

int32x2_t min(_:_:)(int32x2_t a1, int32x2_t a2)
{
  return vmin_s32(a1, a2);
}

int32x2_t max(_:_:)(int32x2_t a1, int32x2_t a2)
{
  return vmax_s32(a1, a2);
}

int32x2_t min(_:_:)(unsigned int a1, int32x2_t a2)
{
  return vmin_s32(a2, vdup_n_s32(a1));
}

int32x2_t max(_:_:)(unsigned int a1, int32x2_t a2)
{
  return vmax_s32(a2, vdup_n_s32(a1));
}

int32x2_t clamp(_:min:max:)(int32x2_t a1, int32x2_t a2, int32x2_t a3)
{
  return vmin_s32(vmax_s32(a1, a2), a3);
}

int32x2_t clamp(_:min:max:)(unsigned int a1, unsigned int a2, int32x2_t a3)
{
  return vmin_s32(vmax_s32(a3, vdup_n_s32(a1)), vdup_n_s32(a2));
}

float reduce_add(_:)(int32x2_t a1)
{
  LODWORD(result) = vadd_s32(vdup_lane_s32(a1, 1), a1).u32[0];
  return result;
}

{
  float result;

  LODWORD(result) = vadd_s32(vdup_lane_s32(a1, 1), a1).u32[0];
  return result;
}

uint64_t reduce_min(_:)(double a1)
{
  if (SHIDWORD(a1) >= SLODWORD(a1)) {
    return LODWORD(a1);
  }
  else {
    return HIDWORD(a1);
  }
}

{
  if (HIDWORD(a1) >= LODWORD(a1)) {
    return LODWORD(a1);
  }
  else {
    return HIDWORD(a1);
  }
}

uint64_t reduce_max(_:)(double a1)
{
  if (SHIDWORD(a1) <= SLODWORD(a1)) {
    return LODWORD(a1);
  }
  else {
    return HIDWORD(a1);
  }
}

{
  if (HIDWORD(a1) <= LODWORD(a1)) {
    return LODWORD(a1);
  }
  else {
    return HIDWORD(a1);
  }
}

double abs(_:)(int32x4_t a1)
{
  a1.i32[3] = 0;
  a1.i64[0] = vabsq_s32(a1).u64[0];
  return *(double *)a1.i64;
}

{
  double result;

  *(void *)&float result = vabsq_s32(a1).u64[0];
  return result;
}

double min(_:_:)(int32x4_t a1, int32x4_t a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  a1.i64[0] = vminq_s32(a1, a2).u64[0];
  return *(double *)a1.i64;
}

{
  double result;

  *(void *)&float result = vminq_s32(a1, a2).u64[0];
  return result;
}

double max(_:_:)(int32x4_t a1, int32x4_t a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  a1.i64[0] = vmaxq_s32(a1, a2).u64[0];
  return *(double *)a1.i64;
}

{
  double result;

  *(void *)&float result = vmaxq_s32(a1, a2).u64[0];
  return result;
}

double min(_:_:)(unsigned int a1, int32x4_t a2)
{
  a2.i32[3] = 0;
  int32x4_t v2 = vdupq_n_s32(a1);
  v2.i32[3] = 0;
  a2.i64[0] = vminq_s32(a2, v2).u64[0];
  return *(double *)a2.i64;
}

{
  double result;

  *(void *)&float result = vminq_s32(a2, vdupq_n_s32(a1)).u64[0];
  return result;
}

double max(_:_:)(unsigned int a1, int32x4_t a2)
{
  a2.i32[3] = 0;
  int32x4_t v2 = vdupq_n_s32(a1);
  v2.i32[3] = 0;
  a2.i64[0] = vmaxq_s32(a2, v2).u64[0];
  return *(double *)a2.i64;
}

{
  double result;

  *(void *)&float result = vmaxq_s32(a2, vdupq_n_s32(a1)).u64[0];
  return result;
}

double clamp(_:min:max:)(int32x4_t a1, int32x4_t a2, int32x4_t a3)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  int32x4_t v3 = vmaxq_s32(a1, a2);
  v3.i32[3] = 0;
  a3.i32[3] = 0;
  *(void *)&double result = vminq_s32(v3, a3).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vminq_s32(vmaxq_s32(a1, a2), a3).u64[0];
  return result;
}

double clamp(_:min:max:)(unsigned int a1, unsigned int a2, int32x4_t a3)
{
  a3.i32[3] = 0;
  int32x4_t v3 = vdupq_n_s32(a1);
  v3.i32[3] = 0;
  int32x4_t v4 = vmaxq_s32(a3, v3);
  v4.i32[3] = 0;
  int32x4_t v5 = vdupq_n_s32(a2);
  v5.i32[3] = 0;
  *(void *)&double result = vminq_s32(v4, v5).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vminq_s32(vmaxq_s32(a3, vdupq_n_s32(a1)), vdupq_n_s32(a2)).u64[0];
  return result;
}

float reduce_add(_:)(int32x4_t a1)
{
  LODWORD(result) = vaddq_s32(vaddq_s32(vdupq_lane_s32(*(int32x2_t *)a1.i8, 1), a1), vdupq_laneq_s32(a1, 2)).u32[0];
  return result;
}

{
  float result;

  LODWORD(result) = vaddq_s32(vaddq_s32(vdupq_lane_s32(*(int32x2_t *)a1.i8, 1), a1), vdupq_laneq_s32(a1, 2)).u32[0];
  return result;
}

uint64_t reduce_min(_:)(__n128 a1)
{
  __int32 v1 = a1.n128_i32[2];
  if (a1.n128_i32[2] >= a1.n128_i32[0]) {
    __int32 v1 = a1.n128_u32[0];
  }
  if (a1.n128_i32[1] >= v1) {
    return v1;
  }
  else {
    return a1.n128_u32[1];
  }
}

{
  unsigned __int32 v1;

  __int32 v1 = a1.n128_u32[2];
  if (a1.n128_u32[2] >= a1.n128_u32[0]) {
    __int32 v1 = a1.n128_u32[0];
  }
  if (a1.n128_u32[1] >= v1) {
    return v1;
  }
  else {
    return a1.n128_u32[1];
  }
}

uint64_t reduce_max(_:)(__n128 a1)
{
  __int32 v1 = a1.n128_i32[2];
  if (a1.n128_i32[2] <= a1.n128_i32[0]) {
    __int32 v1 = a1.n128_u32[0];
  }
  if (a1.n128_i32[1] <= v1) {
    return v1;
  }
  else {
    return a1.n128_u32[1];
  }
}

{
  unsigned __int32 v1;

  __int32 v1 = a1.n128_u32[2];
  if (a1.n128_u32[2] <= a1.n128_u32[0]) {
    __int32 v1 = a1.n128_u32[0];
  }
  if (a1.n128_u32[1] <= v1) {
    return v1;
  }
  else {
    return a1.n128_u32[1];
  }
}

uint64_t reduce_min(_:)(int32x4_t a1)
{
  return vminvq_s32(a1);
}

uint64_t reduce_max(_:)(int32x4_t a1)
{
  return vmaxvq_s32(a1);
}

uint32x2_t min(_:_:)(uint32x2_t a1, uint32x2_t a2)
{
  return vmin_u32(a1, a2);
}

uint32x2_t max(_:_:)(uint32x2_t a1, uint32x2_t a2)
{
  return vmax_u32(a1, a2);
}

uint32x2_t min(_:_:)(unsigned int a1, uint32x2_t a2)
{
  return vmin_u32(a2, (uint32x2_t)vdup_n_s32(a1));
}

uint32x2_t max(_:_:)(unsigned int a1, uint32x2_t a2)
{
  return vmax_u32(a2, (uint32x2_t)vdup_n_s32(a1));
}

uint32x2_t clamp(_:min:max:)(uint32x2_t a1, uint32x2_t a2, uint32x2_t a3)
{
  return vmin_u32(vmax_u32(a1, a2), a3);
}

uint32x2_t clamp(_:min:max:)(unsigned int a1, unsigned int a2, uint32x2_t a3)
{
  return vmin_u32(vmax_u32(a3, (uint32x2_t)vdup_n_s32(a1)), (uint32x2_t)vdup_n_s32(a2));
}

double min(_:_:)(uint32x4_t a1, uint32x4_t a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  a1.i64[0] = vminq_u32(a1, a2).u64[0];
  return *(double *)a1.i64;
}

{
  double result;

  *(void *)&float result = vminq_u32(a1, a2).u64[0];
  return result;
}

double max(_:_:)(uint32x4_t a1, uint32x4_t a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  a1.i64[0] = vmaxq_u32(a1, a2).u64[0];
  return *(double *)a1.i64;
}

{
  double result;

  *(void *)&float result = vmaxq_u32(a1, a2).u64[0];
  return result;
}

double min(_:_:)(unsigned int a1, uint32x4_t a2)
{
  a2.i32[3] = 0;
  uint32x4_t v2 = (uint32x4_t)vdupq_n_s32(a1);
  v2.i32[3] = 0;
  a2.i64[0] = vminq_u32(a2, v2).u64[0];
  return *(double *)a2.i64;
}

{
  double result;

  *(void *)&float result = vminq_u32(a2, (uint32x4_t)vdupq_n_s32(a1)).u64[0];
  return result;
}

double max(_:_:)(unsigned int a1, uint32x4_t a2)
{
  a2.i32[3] = 0;
  uint32x4_t v2 = (uint32x4_t)vdupq_n_s32(a1);
  v2.i32[3] = 0;
  a2.i64[0] = vmaxq_u32(a2, v2).u64[0];
  return *(double *)a2.i64;
}

{
  double result;

  *(void *)&float result = vmaxq_u32(a2, (uint32x4_t)vdupq_n_s32(a1)).u64[0];
  return result;
}

double clamp(_:min:max:)(uint32x4_t a1, uint32x4_t a2, uint32x4_t a3)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  uint32x4_t v3 = vmaxq_u32(a1, a2);
  v3.i32[3] = 0;
  a3.i32[3] = 0;
  *(void *)&double result = vminq_u32(v3, a3).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vminq_u32(vmaxq_u32(a1, a2), a3).u64[0];
  return result;
}

double clamp(_:min:max:)(unsigned int a1, unsigned int a2, uint32x4_t a3)
{
  a3.i32[3] = 0;
  uint32x4_t v3 = (uint32x4_t)vdupq_n_s32(a1);
  v3.i32[3] = 0;
  uint32x4_t v4 = vmaxq_u32(a3, v3);
  v4.i32[3] = 0;
  uint32x4_t v5 = (uint32x4_t)vdupq_n_s32(a2);
  v5.i32[3] = 0;
  *(void *)&double result = vminq_u32(v4, v5).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vminq_u32(vmaxq_u32(a3, (uint32x4_t)vdupq_n_s32(a1)), (uint32x4_t)vdupq_n_s32(a2)).u64[0];
  return result;
}

uint64_t reduce_min(_:)(uint32x4_t a1)
{
  return vminvq_u32(a1);
}

uint64_t reduce_max(_:)(uint32x4_t a1)
{
  return vmaxvq_u32(a1);
}

__n64 simd_float2x2.init(diagonal:)()
{
  result.n64_u32[1] = 0;
  return result;
}

void __swiftcall simd_float2x2.init(_:)(simd_float2x2 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 2) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_float2x2.init(rows:)(simd_float2x2 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 2)
  {
    uint32x4_t v2 = (const float *)((char *)rows._rawValue + 32);
    vld2_f32(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

int32x2_t simd_float2x2.transpose.getter(int32x2_t a1, int32x2_t a2)
{
  return vzip1_s32(a1, a2);
}

unint64_t simd_float2x2.subscript.getter(unint64_t result)
{
  if (result > 1) {
    __break(1u);
  }
  return result;
}

uint64_t simd_float2x2.subscript.setter(uint64_t result, double a2)
{
  if (!result) {
    goto LABEL_4;
  }
  if (result == 1)
  {
    ++v2;
LABEL_4:
    *uint32x4_t v2 = a2;
    return result;
  }
  __break(1u);
  return result;
}

double (*simd_float2x2.subscript.modify(double (*result)(uint64_t a1), uint64_t a2))(uint64_t a1)
{
  *((void *)result + 1) = v2;
  if (!a2)
  {
    *(void *)__n64 result = *v2;
    return simd_float2x2.subscript.modify;
  }
  if (a2 == 1)
  {
    *(void *)__n64 result = v2[1];
    return simd_float2x2.subscript.modify;
  }
  __break(1u);
  return result;
}

double simd_float2x2.subscript.modify(uint64_t a1)
{
  double result = *(double *)a1;
  **(void **)(a1 + 8) = *(void *)a1;
  return result;
}

{
  double result;

  double result = *(double *)a1;
  *(void *)(*(void *)(a1 + 8) + 8) = *(void *)a1;
  return result;
}

unint64_t simd_float2x2.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 1)
  {
    if (a2 <= 1) {
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

int *key path setter for simd_float2x2.subscript(_:_:) : simd_float2x2(int *result, uint64_t a2, void *a3)
{
  unint64_t v3 = a3[1];
  int v4 = *result;
  if (!*a3)
  {
    if (v3 <= 1)
    {
      *(_DWORD *)(a2 + 4 * v3) = v4;
      return result;
    }
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*a3 == 1)
  {
    if (v3 <= 1)
    {
      *(_DWORD *)(a2 + 8 + 4 * v3) = v4;
      return result;
    }
    goto LABEL_7;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t simd_float2x2.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  if (!result)
  {
    if (a2 > 1) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (result == 1)
  {
    if (a2 > 1)
    {
LABEL_8:
      __break(1u);
      goto LABEL_9;
    }
    v3 += 8;
LABEL_7:
    *(float *)(v3 + 4 * a2) = a3;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

float (*simd_float2x2.subscript.modify(float (*result)(uint64_t a1), uint64_t a2, unint64_t a3))(uint64_t a1)
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)double result = a2;
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_7;
    }
    v3 += 8;
  }
  if (a3 <= 1)
  {
    *((_DWORD *)result + 6) = *(_DWORD *)(v3 + 4 * (a3 & 1));
    return simd_float2x2.subscript.modify;
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

float simd_float2x2.subscript.modify(uint64_t a1)
{
  float result = *(float *)(a1 + 24);
  *(float *)(*(void *)(a1 + 16) + 8 * (*(void *)a1 != 0) + 4 * *(unsigned int *)(a1 + 8)) = result;
  return result;
}

uint64_t simd_float2x2.debugDescription.getter()
{
  _StringGuts.grow(_:)(23);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = 91;
  v0._object = (void *)0xE100000000000000;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 93;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 8236;
  v4._object = (void *)0xE200000000000000;
  String.append(_:)(v4);
  v5._countAndFlagsBits = 91;
  v5._object = (void *)0xE100000000000000;
  String.append(_:)(v5);
  _print_unlocked<A, B>(_:_:)();
  v6._countAndFlagsBits = 8236;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  _print_unlocked<A, B>(_:_:)();
  v7._countAndFlagsBits = 93;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 10589;
  v9._object = (void *)0xE200000000000000;
  String.append(_:)(v9);
  return 0x6F6C665F646D6973;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_float2x2()
{
  return simd_float2x2.debugDescription.getter();
}

uint64_t static simd_float2x2.== infix(_:_:)(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4)
{
  uint32x2_t v4 = (uint32x2_t)vand_s8((int8x8_t)vceq_f32(a2, a4), (int8x8_t)vceq_f32(a1, a3));
  return vpmin_u32(v4, v4).u32[0] >> 31;
}

uint64_t simd_equal(simd_float2x2 a1, simd_float2x2 a2)
{
  uint32x2_t v2 = (uint32x2_t)vand_s8((int8x8_t)vceq_f32((float32x2_t)a1.columns[0], (float32x2_t)a2.columns[0]), (int8x8_t)vceq_f32((float32x2_t)a1.columns[1], (float32x2_t)a2.columns[1]));
  return vpmin_u32(v2, v2).u32[0] >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float2x2(simd_float2x2 *a1, simd_float2x2 *a2)
{
  return simd_equal(*a1, *a2);
}

float simd_float2x2.determinant.getter(double a1, double a2)
{
  return vmlas_n_f32((float)-*((float *)&a1 + 1) * *(float *)&a2, *((float *)&a2 + 1), *(float *)&a1);
}

float32x2_t static simd_float2x2.+ infix(_:_:)(float32x2_t a1, double a2, float32x2_t a3)
{
  return vadd_f32(a1, a3);
}

float32x2_t static simd_float2x2.- prefix(_:)(float32x2_t a1)
{
  return vsub_f32(0, a1);
}

float32x2_t static simd_float2x2.- infix(_:_:)(float32x2_t a1, double a2, float32x2_t a3)
{
  return vsub_f32(a1, a3);
}

float32x2_t static simd_float2x2.+= infix(_:_:)(float32x2_t *a1, float32x2_t a2, float32x2_t a3)
{
  float32x2_t result = vadd_f32(*a1, a2);
  float32x2_t v4 = vadd_f32(a1[1], a3);
  *a1 = result;
  a1[1] = v4;
  return result;
}

float32x2_t static simd_float2x2.-= infix(_:_:)(float32x2_t *a1, float32x2_t a2, float32x2_t a3)
{
  float32x2_t result = vsub_f32(*a1, a2);
  float32x2_t v4 = vsub_f32(a1[1], a3);
  *a1 = result;
  a1[1] = v4;
  return result;
}

float32x2_t static simd_float2x2.* infix(_:_:)(float a1, float32x2_t a2)
{
  return vmul_n_f32(a2, a1);
}

float32x2_t static simd_float2x2.* infix(_:_:)(float32x2_t a1, double a2, float a3)
{
  return vmul_n_f32(a1, a3);
}

float32x2_t static simd_float2x2.*= infix(_:_:)(float32x2_t *a1, float a2)
{
  float32x2_t v2 = vmul_n_f32(*a1, a2);
  float32x2_t result = vmul_n_f32(a1[1], a2);
  *a1 = v2;
  a1[1] = result;
  return result;
}

float32x2_t static simd_float2x2.* infix(_:_:)(float32x2_t a1, float32x2_t a2, double a3)
{
  return vmla_lane_f32(vmul_n_f32(a1, *(float *)&a3), a2, *(float32x2_t *)&a3, 1);
}

{
  return vmla_lane_f32(vmul_n_f32(a1, *(float *)&a3), a2, *(float32x2_t *)&a3, 1);
}

{
  return vmla_lane_f32(vmul_n_f32(a1, *(float *)&a3), a2, *(float32x2_t *)&a3, 1);
}

{
  return vmla_lane_f32(vmul_n_f32(a1, *(float *)&a3), a2, *(float32x2_t *)&a3, 1);
}

float32x2_t static simd_float2x2.* infix(_:_:)(double a1, int32x2_t a2, int32x2_t a3)
{
  return vmla_lane_f32(vmul_n_f32((float32x2_t)vzip1_s32(a2, a3), *(float *)&a1), (float32x2_t)vzip2_s32(a2, a3), *(float32x2_t *)&a1, 1);
}

float32x2_t static simd_float2x2.*= infix(_:_:)(float32x2_t *a1, double a2, double a3)
{
  float32x2_t v3 = a1[1];
  float32x2_t v4 = vmla_lane_f32(vmul_n_f32(*a1, *(float *)&a2), v3, *(float32x2_t *)&a2, 1);
  float32x2_t result = vmla_lane_f32(vmul_n_f32(*a1, *(float *)&a3), v3, *(float32x2_t *)&a3, 1);
  *a1 = v4;
  a1[1] = result;
  return result;
}

__n64 matrix_from_diagonal(_:)()
{
  result.n64_u32[1] = 0;
  return result;
}

Swift::Float __swiftcall matrix_determinant(_:)(simd_float2x2 *a1)
{
  return vmlas_n_f32((float)-*((float *)&v1 + 1) * *(float *)&v2, *((float *)&v2 + 1), *(float *)&v1);
}

int32x2_t matrix_from_rows(_:_:)(int32x2_t a1, int32x2_t a2)
{
  return vzip1_s32(a1, a2);
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float2x2 *a1, simd_float2x2 *a2)
{
  uint32x2_t v6 = (uint32x2_t)vand_s8((int8x8_t)vceq_f32(v3, v5), (int8x8_t)vceq_f32(v2, v4));
  return vpmin_u32(v6, v6).u32[0] >> 31;
}

__n64 simd_float3x2.init(diagonal:)()
{
  result.n64_u32[1] = 0;
  return result;
}

void __swiftcall simd_float3x2.init(_:)(simd_float3x2 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 3) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_float3x2.init(rows:)(simd_float3x2 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 2) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_float2x3.init(_:)(simd_float2x3 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 2) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

int32x2_t simd_float2x3.transpose.getter(int32x2_t a1, double a2, int32x2_t a3)
{
  return vzip1_s32(a1, a3);
}

unint64_t simd_float3x2.subscript.getter(unint64_t result)
{
  if (result > 2) {
    __break(1u);
  }
  return result;
}

uint64_t simd_float3x2.subscript.setter(uint64_t result, double a2)
{
  switch(result)
  {
    case 0:
      goto LABEL_6;
    case 1:
      ++v2;
LABEL_6:
      *float32x2_t v2 = a2;
      return result;
    case 2:
      v2 += 2;
      goto LABEL_6;
  }
  __break(1u);
  return result;
}

double (*simd_float3x2.subscript.modify(double (*result)(uint64_t a1), uint64_t a2))(uint64_t a1)
{
  *((void *)result + 1) = a2;
  *((void *)result + 2) = v2;
  switch(a2)
  {
    case 0:
      *(void *)__n64 result = *v2;
      return simd_float3x2.subscript.modify;
    case 1:
      uint64_t v3 = v2[1];
LABEL_7:
      *(void *)__n64 result = v3;
      return (double (*)(uint64_t))simd_float3x2.subscript.modify;
    case 2:
      uint64_t v3 = v2[2];
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t *simd_float3x2.subscript.modify(uint64_t *result, char a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  BOOL v4 = v3 == 1;
  if (a2)
  {
    if (v3 == 1)
    {
LABEL_7:
      *(void *)(result[2] + 8) = v2;
      return result;
    }
    BOOL v4 = v3 == 2;
    if (v3 == 2)
    {
LABEL_9:
      *(void *)(result[2] + 16) = v2;
      return result;
    }
    __break(1u);
  }
  if (v4) {
    goto LABEL_7;
  }
  if (v3 == 2) {
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

double simd_float3x2.subscript.modify(uint64_t a1)
{
  double result = *(double *)a1;
  **(void **)(a1 + 16) = *(void *)a1;
  return result;
}

{
  int v1;
  int8x8_t *v2;
  uint64_t v3;
  int8x8_t v4;
  _DWORD *v5;
  double result;
  double v7;

  uint64_t v1 = *(_DWORD *)(a1 + 24);
  uint64_t v2 = *(int8x8_t **)(a1 + 16);
  uint64_t v3 = *(void *)a1;
  if (*(void *)a1)
  {
    BOOL v4 = vbsl_s8((int8x8_t)vceqd_s64(v3, 1), v2[1], v2[2]);
    if (v3 == 1) {
      ++v2;
    }
    else {
      v2 += 2;
    }
  }
  else
  {
    BOOL v4 = *v2;
  }
  float32x2_t v5 = (_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFFBLL | (4 * (*(_DWORD *)(a1 + 8) & 1)));
  Swift::String v7 = *(double *)&v4;
  *float32x2_t v5 = v1;
  double result = v7;
  *(double *)uint64_t v2 = v7;
  return result;
}

unint64_t simd_float3x2.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 2)
  {
    if (a2 <= 1) {
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t key path getter for simd_float3x2.subscript(_:_:) : simd_float3x2@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 1)
  {
    result += 8;
  }
  else if (v3)
  {
    if (v3 != 2) {
      goto LABEL_9;
    }
    result += 16;
  }
  if ((unint64_t)a2[1] <= 1)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 1));
    return result;
  }
  __break(1u);
LABEL_9:
  __break(1u);
  return result;
}

int *key path setter for simd_float3x2.subscript(_:_:) : simd_float3x2(int *result, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  unint64_t v3 = a3[1];
  int v5 = *result;
  if (!*a3)
  {
    if (v3 <= 1)
    {
      uint64_t v7 = *a2;
      *(_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v3 & 1))) = v5;
      *a2 = v7;
      return result;
    }
    goto LABEL_12;
  }
  if (v4 == 1)
  {
    uint64_t v6 = a2[1];
  }
  else
  {
    if (v4 != 2)
    {
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
    }
    uint64_t v6 = a2[2];
  }
  if (v3 > 1)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v8 = v6;
  *(_DWORD *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v3 & 1))) = v5;
  if (v4 == 1) {
    a2[1] = v8;
  }
  else {
    a2[2] = v8;
  }
  return result;
}

uint64_t simd_float3x2.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  switch(result)
  {
    case 0:
      if (a2 <= 1)
      {
        uint64_t v5 = *v3;
        *(float *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFFBLL | (4 * (a2 & 1))) = a3;
        *unint64_t v3 = v5;
        return result;
      }
      goto LABEL_12;
    case 1:
      uint64_t v4 = v3[1];
      break;
    case 2:
      uint64_t v4 = v3[2];
      break;
    default:
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
  }
  if (a2 > 1)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v6 = v4;
  *(float *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFFBLL | (4 * (a2 & 1))) = a3;
  if (result == 1) {
    v3[1] = v6;
  }
  else {
    v3[2] = v6;
  }
  return result;
}

double (*simd_float3x2.subscript.modify(double (*result)(uint64_t a1), uint64_t a2, unint64_t a3))(uint64_t a1)
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)double result = a2;
  switch(a2)
  {
    case 0:
      uint64_t v4 = *v3;
      if (a3 <= 1) {
        goto LABEL_6;
      }
LABEL_9:
      __break(1u);
      break;
    case 1:
      uint64_t v4 = v3[1];
      if (a3 > 1) {
        goto LABEL_9;
      }
LABEL_6:
      uint64_t v5 = v4;
      *((_DWORD *)result + 6) = *(_DWORD *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFFBLL | (4 * (a3 & 1)));
      return simd_float3x2.subscript.modify;
    case 2:
      uint64_t v4 = v3[2];
      if (a3 <= 1) {
        goto LABEL_6;
      }
      goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t simd_float3x2.debugDescription.getter()
{
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = 91;
  v0._object = (void *)0xE100000000000000;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 93;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 8236;
  v4._object = (void *)0xE200000000000000;
  String.append(_:)(v4);
  v5._countAndFlagsBits = 91;
  v5._object = (void *)0xE100000000000000;
  String.append(_:)(v5);
  _print_unlocked<A, B>(_:_:)();
  v6._countAndFlagsBits = 8236;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  _print_unlocked<A, B>(_:_:)();
  v7._countAndFlagsBits = 93;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 8236;
  v9._object = (void *)0xE200000000000000;
  String.append(_:)(v9);
  v10._countAndFlagsBits = 91;
  v10._object = (void *)0xE100000000000000;
  String.append(_:)(v10);
  _print_unlocked<A, B>(_:_:)();
  v11._countAndFlagsBits = 8236;
  v11._object = (void *)0xE200000000000000;
  String.append(_:)(v11);
  _print_unlocked<A, B>(_:_:)();
  v12._countAndFlagsBits = 93;
  v12._object = (void *)0xE100000000000000;
  String.append(_:)(v12);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 10589;
  v14._object = (void *)0xE200000000000000;
  String.append(_:)(v14);
  return 0x6F6C665F646D6973;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_float3x2()
{
  return simd_float3x2.debugDescription.getter();
}

uint64_t static simd_float3x2.== infix(_:_:)(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x2_t a5, float32x2_t a6)
{
  uint32x2_t v6 = (uint32x2_t)vand_s8(vand_s8((int8x8_t)vceq_f32(a2, a5), (int8x8_t)vceq_f32(a1, a4)), (int8x8_t)vceq_f32(a3, a6));
  return vpmin_u32(v6, v6).u32[0] >> 31;
}

uint64_t simd_equal(simd_float3x2 a1, simd_float3x2 a2)
{
  uint32x2_t v2 = (uint32x2_t)vand_s8(vand_s8((int8x8_t)vceq_f32((float32x2_t)a1.columns[0], (float32x2_t)a2.columns[0]), (int8x8_t)vceq_f32((float32x2_t)a1.columns[1], (float32x2_t)a2.columns[1])), (int8x8_t)vceq_f32((float32x2_t)a1.columns[2], (float32x2_t)a2.columns[2]));
  return vpmin_u32(v2, v2).u32[0] >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float3x2(simd_float3x2 *a1, simd_float3x2 *a2)
{
  return simd_equal(*a1, *a2);
}

int32x2_t simd_float3x2.transpose.getter(int32x2_t a1, int32x2_t a2)
{
  return vzip1_s32(a1, a2);
}

float32x2_t static simd_float3x2.+ infix(_:_:)(float32x2_t a1, double a2, double a3, float32x2_t a4)
{
  return vadd_f32(a1, a4);
}

float32x2_t static simd_float3x2.- prefix(_:)(float32x2_t a1)
{
  return vsub_f32(0, a1);
}

float32x2_t static simd_float3x2.- infix(_:_:)(float32x2_t a1, double a2, double a3, float32x2_t a4)
{
  return vsub_f32(a1, a4);
}

float32x2_t static simd_float3x2.+= infix(_:_:)(float32x2_t *a1, float32x2_t a2, float32x2_t a3, float32x2_t a4)
{
  float32x2_t result = vadd_f32(*a1, a2);
  float32x2_t v5 = vadd_f32(a1[1], a3);
  float32x2_t v6 = vadd_f32(a1[2], a4);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

float32x2_t static simd_float3x2.-= infix(_:_:)(float32x2_t *a1, float32x2_t a2, float32x2_t a3, float32x2_t a4)
{
  float32x2_t result = vsub_f32(*a1, a2);
  float32x2_t v5 = vsub_f32(a1[1], a3);
  float32x2_t v6 = vsub_f32(a1[2], a4);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

float32x2_t static simd_float3x2.* infix(_:_:)(float a1, float32x2_t a2)
{
  return vmul_n_f32(a2, a1);
}

float32x2_t static simd_float3x2.* infix(_:_:)(float32x2_t a1, double a2, double a3, float a4)
{
  return vmul_n_f32(a1, a4);
}

float32x2_t static simd_float3x2.*= infix(_:_:)(float32x2_t *a1, float a2)
{
  float32x2_t v2 = vmul_n_f32(*a1, a2);
  float32x2_t v3 = vmul_n_f32(a1[1], a2);
  float32x2_t result = vmul_n_f32(a1[2], a2);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = result;
  return result;
}

float32x2_t static simd_float3x2.* infix(_:_:)(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x4_t a4)
{
  return vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(a1, a4.f32[0]), a2, *(float32x2_t *)a4.f32, 1), a3, a4, 2);
}

double static simd_float3x2.* infix(_:_:)(double a1, int32x4_t a2, int32x2_t a3, int32x4_t a4)
{
  int32x2_t v4 = vzip1_s32(*(int32x2_t *)a2.i8, *(int32x2_t *)a4.i8);
  *(int32x2_t *)v5.f32 = vzip1_s32(v4, a3);
  *(int32x2_t *)&v5.u32[2] = vdup_lane_s32(v4, 1);
  a2.u64[1] = (unint64_t)a3;
  *(void *)&double result = vmlaq_lane_f32(vmulq_n_f32(v5, *(float *)&a1), (float32x4_t)vuzp2q_s32(a2, a4), *(float32x2_t *)&a1, 1).u64[0];
  return result;
}

float32x2_t static simd_float3x2.* infix(_:_:)(float32x2_t a1, float32x2_t a2, float32x2_t a3, double a4, float a5)
{
  return vmla_n_f32(vmla_lane_f32(vmul_n_f32(a1, *(float *)&a4), a2, *(float32x2_t *)&a4, 1), a3, a5);
}

float32x2_t static simd_float3x2.* infix(_:_:)(float32x2_t *a1, float32x2_t a2, float32x2_t a3, float32x2_t a4)
{
  return vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(a2, COERCE_FLOAT(*(_OWORD *)a1->f32)), a3, *a1, 1), a4, *(float32x4_t *)a1->f32, 2);
}

{
  return vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(a2, COERCE_FLOAT(*(_OWORD *)a1->f32)), a3, *a1, 1), a4, *(float32x4_t *)a1->f32, 2);
}

float32x2_t static simd_float3x2.*= infix(_:_:)(float32x2_t *a1, float32x2_t *a2)
{
  float32x2_t v2 = a1[1];
  float32x2_t v3 = a1[2];
  float32x2_t result = vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[2].f32)), v2, a2[2], 1), v3, *(float32x4_t *)a2[2].f32, 2);
  float32x2_t v5 = vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[4].f32)), v2, a2[4], 1), v3, *(float32x4_t *)a2[4].f32, 2);
  *a1 = vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2->f32)), v2, *a2, 1), v3, *(float32x4_t *)a2->f32, 2);
  a1[1] = result;
  a1[2] = v5;
  return result;
}

double matrix_from_rows(_:_:)(int32x4_t a1, int32x4_t a2)
{
  *(void *)&double result = vzip1q_s32(a1, a2).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vzip1q_s32(a1, a2).u64[0];
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float3x2 *a1, simd_float3x2 *a2)
{
  uint32x2_t v8 = (uint32x2_t)vand_s8(vand_s8((int8x8_t)vceq_f32(v3, v6), (int8x8_t)vceq_f32(v2, v5)), (int8x8_t)vceq_f32(v4, v7));
  return vpmin_u32(v8, v8).u32[0] >> 31;
}

__n64 simd_float4x2.init(diagonal:)()
{
  result.n64_u32[1] = 0;
  return result;
}

void __swiftcall simd_float4x2.init(_:)(simd_float4x2 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 4) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_float4x2.init(rows:)(simd_float4x2 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 2)
  {
    float32x2_t v2 = (const float *)((char *)rows._rawValue + 32);
    vld4_f32(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

void __swiftcall simd_float2x4.init(_:)(simd_float2x4 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 2) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

double simd_float2x4.transpose.getter(int32x4_t a1, int32x4_t a2)
{
  *(void *)&double result = vzip1q_s32(a1, a2).u64[0];
  return result;
}

double simd_float4x2.subscript.getter(uint64_t a1, double a2, double a3, double a4, double a5)
{
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      double result = a3;
      break;
    case 2:
      double result = a4;
      break;
    case 3:
      double result = a5;
      break;
    default:
      __break(1u);
      JUMPOUT(0x2128219D8);
  }
  return result;
}

uint64_t simd_float4x2.subscript.setter(uint64_t result, double a2)
{
  switch(result)
  {
    case 0:
      break;
    case 1:
      ++v2;
      break;
    case 2:
      v2 += 2;
      break;
    case 3:
      v2 += 3;
      break;
    default:
      __break(1u);
      JUMPOUT(0x212821A3CLL);
  }
  *float32x2_t v2 = a2;
  return result;
}

uint64_t *(*simd_float4x2.subscript.modify(uint64_t *(*result)(uint64_t *result, char a2), uint64_t a2))(uint64_t *result, char a2)
{
  *((void *)result + 1) = a2;
  *((void *)result + 2) = v2;
  switch(a2)
  {
    case 0:
      *(void *)double result = *v2;
      return (uint64_t *(*)(uint64_t *, char))simd_float4x2.subscript.modify;
    case 1:
      uint64_t v3 = v2[1];
      goto LABEL_9;
    case 2:
      uint64_t v3 = v2[2];
LABEL_9:
      *(void *)double result = v3;
      return simd_float4x2.subscript.modify;
    case 3:
      uint64_t v3 = v2[3];
      goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t *simd_float4x2.subscript.modify(uint64_t *result, char a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  BOOL v4 = v3 == 1;
  if (a2)
  {
    if (v3 == 1)
    {
LABEL_9:
      *(void *)(result[2] + 8) = v2;
      return result;
    }
    if (v3 == 2)
    {
LABEL_8:
      *(void *)(result[2] + 16) = v2;
      return result;
    }
    BOOL v4 = v3 == 3;
    if (v3 == 3) {
      goto LABEL_11;
    }
    __break(1u);
  }
  if (v4) {
    goto LABEL_9;
  }
  if (v3 == 2) {
    goto LABEL_8;
  }
  if (v3 == 3)
  {
LABEL_11:
    *(void *)(result[2] + 24) = v2;
    return result;
  }
  __break(1u);
  return result;
}

float simd_float4x2.subscript.getter(uint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6)
{
  switch(a1)
  {
    case 0:
      goto LABEL_5;
    case 1:
      a3 = a4;
      goto LABEL_5;
    case 2:
      a3 = a5;
      goto LABEL_5;
    case 3:
      a3 = a6;
LABEL_5:
      if (a2 > 1)
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x212821B9CLL);
      }
      double v7 = a3;
      return *(float *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFFBLL | (4 * (a2 & 1)));
    default:
      goto LABEL_8;
  }
}

uint64_t key path getter for simd_float4x2.subscript(_:_:) : simd_float4x2@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 2)
  {
    result += 16;
  }
  else if (v3 == 1)
  {
    result += 8;
  }
  else if (v3)
  {
    if (v3 != 3) {
      goto LABEL_11;
    }
    result += 24;
  }
  if ((unint64_t)a2[1] <= 1)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 1));
    return result;
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

int *key path setter for simd_float4x2.subscript(_:_:) : simd_float4x2(int *result, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = a3[1];
  int v5 = *result;
  if (!*a3)
  {
    if (v4 <= 1)
    {
      uint64_t v7 = *a2;
      *(_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v4 & 1))) = v5;
      *a2 = v7;
      return result;
    }
    goto LABEL_16;
  }
  switch(v3)
  {
    case 1:
      uint64_t v6 = a2[1];
      break;
    case 2:
      uint64_t v6 = a2[2];
      break;
    case 3:
      uint64_t v6 = a2[3];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }
  if (v4 > 1)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v8 = v6;
  *(_DWORD *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v4 & 1))) = v5;
  if (v3 == 1)
  {
    a2[1] = v8;
  }
  else if (v3 == 2)
  {
    a2[2] = v8;
  }
  else
  {
    a2[3] = v8;
  }
  return result;
}

uint64_t simd_float4x2.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  switch(result)
  {
    case 0:
      if (a2 <= 1)
      {
        uint64_t v5 = *v3;
        *(float *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFFBLL | (4 * (a2 & 1))) = a3;
        *uint64_t v3 = v5;
        return result;
      }
      goto LABEL_16;
    case 1:
      uint64_t v4 = v3[1];
      break;
    case 2:
      uint64_t v4 = v3[2];
      break;
    case 3:
      uint64_t v4 = v3[3];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }
  if (a2 > 1)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = v4;
  *(float *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFFBLL | (4 * (a2 & 1))) = a3;
  if (result == 1)
  {
    v3[1] = v6;
  }
  else if (result == 2)
  {
    v3[2] = v6;
  }
  else
  {
    v3[3] = v6;
  }
  return result;
}

double (*simd_float4x2.subscript.modify(double (*result)(uint64_t *a1, char a2), uint64_t a2, unint64_t a3))(uint64_t *a1, char a2)
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)double result = a2;
  if (a2)
  {
    switch(a2)
    {
      case 1:
        uint64_t v4 = v3[1];
        break;
      case 2:
        uint64_t v4 = v3[2];
        break;
      case 3:
        uint64_t v4 = v3[3];
        break;
      default:
        goto LABEL_12;
    }
  }
  else
  {
    uint64_t v4 = *v3;
  }
  if (a3 <= 1)
  {
    uint64_t v5 = v4;
    *((_DWORD *)result + 6) = *(_DWORD *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFFBLL | (4 * (a3 & 1)));
    return simd_float4x2.subscript.modify;
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

double simd_float4x2.subscript.modify(uint64_t *a1, char a2)
{
  int v2 = *((_DWORD *)a1 + 6);
  uint64_t v3 = a1[2];
  double v5 = *(double *)(v3 + 24);
  uint64_t v4 = (double *)(v3 + 24);
  double v6 = v5;
  uint64_t v7 = a1[2];
  double v9 = *(double *)(v7 + 16);
  uint64_t v8 = (double *)(v7 + 16);
  double v10 = v9;
  uint64_t v11 = a1[2];
  double v13 = *(double *)(v11 + 8);
  Swift::String v12 = (double *)(v11 + 8);
  double v14 = v13;
  uint64_t v15 = *a1;
  if (a2)
  {
    switch(v15)
    {
      case 0:
        goto LABEL_4;
      case 1:
        goto LABEL_5;
      case 2:
        goto LABEL_6;
      case 3:
        goto LABEL_7;
      default:
        __break(1u);
        goto LABEL_9;
    }
  }
  switch(v15)
  {
    case 0:
LABEL_4:
      double v14 = *(double *)a1[2];
      Swift::String v12 = (double *)a1[2];
      break;
    case 1:
      break;
    case 2:
LABEL_6:
      double v14 = v10;
      Swift::String v12 = v8;
      break;
    case 3:
LABEL_7:
      double v14 = v6;
      Swift::String v12 = v4;
      break;
    default:
LABEL_9:
      __break(1u);
      JUMPOUT(0x212821EE4);
  }
LABEL_5:
  uint64_t v16 = (_DWORD *)((unint64_t)&v18 & 0xFFFFFFFFFFFFFFFBLL | (4 * (a1[1] & 1)));
  double v18 = v14;
  *uint64_t v16 = v2;
  double result = v18;
  *Swift::String v12 = v18;
  return result;
}

uint64_t simd_float4x2.debugDescription.getter()
{
  _StringGuts.grow(_:)(31);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = 91;
  v0._object = (void *)0xE100000000000000;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 93;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 8236;
  v4._object = (void *)0xE200000000000000;
  String.append(_:)(v4);
  v5._countAndFlagsBits = 91;
  v5._object = (void *)0xE100000000000000;
  String.append(_:)(v5);
  _print_unlocked<A, B>(_:_:)();
  v6._countAndFlagsBits = 8236;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  _print_unlocked<A, B>(_:_:)();
  v7._countAndFlagsBits = 93;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 8236;
  v9._object = (void *)0xE200000000000000;
  String.append(_:)(v9);
  v10._countAndFlagsBits = 91;
  v10._object = (void *)0xE100000000000000;
  String.append(_:)(v10);
  _print_unlocked<A, B>(_:_:)();
  v11._countAndFlagsBits = 8236;
  v11._object = (void *)0xE200000000000000;
  String.append(_:)(v11);
  _print_unlocked<A, B>(_:_:)();
  v12._countAndFlagsBits = 93;
  v12._object = (void *)0xE100000000000000;
  String.append(_:)(v12);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 8236;
  v14._object = (void *)0xE200000000000000;
  String.append(_:)(v14);
  v15._countAndFlagsBits = 91;
  v15._object = (void *)0xE100000000000000;
  String.append(_:)(v15);
  _print_unlocked<A, B>(_:_:)();
  v16._countAndFlagsBits = 8236;
  v16._object = (void *)0xE200000000000000;
  String.append(_:)(v16);
  _print_unlocked<A, B>(_:_:)();
  v17._countAndFlagsBits = 93;
  v17._object = (void *)0xE100000000000000;
  String.append(_:)(v17);
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  v19._countAndFlagsBits = 10589;
  v19._object = (void *)0xE200000000000000;
  String.append(_:)(v19);
  return 0x6F6C665F646D6973;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_float4x2()
{
  return simd_float4x2.debugDescription.getter();
}

uint64_t static simd_float4x2.== infix(_:_:)(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x2_t a5, float32x2_t a6, float32x2_t a7, float32x2_t a8)
{
  uint32x2_t v8 = (uint32x2_t)vand_s8(vand_s8((int8x8_t)vceq_f32(a2, a6), (int8x8_t)vceq_f32(a1, a5)), vand_s8((int8x8_t)vceq_f32(a3, a7), (int8x8_t)vceq_f32(a4, a8)));
  return vpmin_u32(v8, v8).u32[0] >> 31;
}

uint64_t simd_equal(simd_float4x2 a1, simd_float4x2 a2)
{
  uint32x2_t v2 = (uint32x2_t)vand_s8(vand_s8((int8x8_t)vceq_f32((float32x2_t)a1.columns[0], (float32x2_t)a2.columns[0]), (int8x8_t)vceq_f32((float32x2_t)a1.columns[1], (float32x2_t)a2.columns[1])), vand_s8((int8x8_t)vceq_f32((float32x2_t)a1.columns[2], (float32x2_t)a2.columns[2]), (int8x8_t)vceq_f32((float32x2_t)a1.columns[3], (float32x2_t)a2.columns[3])));
  return vpmin_u32(v2, v2).u32[0] >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float4x2(simd_float4x2 *a1, simd_float4x2 *a2)
{
  return simd_equal(*a1, *a2);
}

double simd_float4x2.transpose.getter(int32x4_t a1, int32x4_t a2, int32x4_t a3, int32x4_t a4)
{
  *(void *)&double result = vzip1q_s32(vzip1q_s32(a1, a3), vzip1q_s32(a2, a4)).u64[0];
  return result;
}

float32x2_t static simd_float4x2.+ infix(_:_:)(float32x2_t a1, double a2, double a3, double a4, float32x2_t a5)
{
  return vadd_f32(a1, a5);
}

float32x2_t static simd_float4x2.- prefix(_:)(float32x2_t a1)
{
  return vsub_f32(0, a1);
}

float32x2_t static simd_float4x2.- infix(_:_:)(float32x2_t a1, double a2, double a3, double a4, float32x2_t a5)
{
  return vsub_f32(a1, a5);
}

float32x2_t static simd_float4x2.+= infix(_:_:)(float32x2_t *a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x2_t a5)
{
  float32x2_t result = vadd_f32(*a1, a2);
  float32x2_t v6 = vadd_f32(a1[1], a3);
  float32x2_t v7 = vadd_f32(a1[2], a4);
  float32x2_t v8 = vadd_f32(a1[3], a5);
  *a1 = result;
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  return result;
}

float32x2_t static simd_float4x2.-= infix(_:_:)(float32x2_t *a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x2_t a5)
{
  float32x2_t result = vsub_f32(*a1, a2);
  float32x2_t v6 = vsub_f32(a1[1], a3);
  float32x2_t v7 = vsub_f32(a1[2], a4);
  float32x2_t v8 = vsub_f32(a1[3], a5);
  *a1 = result;
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  return result;
}

float32x2_t static simd_float4x2.* infix(_:_:)(float a1, float32x2_t a2)
{
  return vmul_n_f32(a2, a1);
}

float32x2_t static simd_float4x2.* infix(_:_:)(float32x2_t a1, double a2, double a3, double a4, float a5)
{
  return vmul_n_f32(a1, a5);
}

float32x2_t static simd_float4x2.*= infix(_:_:)(float32x2_t *a1, float a2)
{
  float32x2_t v2 = vmul_n_f32(*a1, a2);
  float32x2_t v3 = vmul_n_f32(a1[1], a2);
  float32x2_t v4 = vmul_n_f32(a1[2], a2);
  float32x2_t result = vmul_n_f32(a1[3], a2);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = result;
  return result;
}

float32x2_t static simd_float4x2.* infix(_:_:)(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x4_t a5)
{
  return vmla_laneq_f32(vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1), a3, a5, 2), a4, a5, 3);
}

{
  return vmla_laneq_f32(vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1), a3, a5, 2), a4, a5, 3);
}

{
  return vmla_laneq_f32(vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1), a3, a5, 2), a4, a5, 3);
}

{
  return vmla_laneq_f32(vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1), a3, a5, 2), a4, a5, 3);
}

double static simd_float4x2.* infix(_:_:)(double a1, int32x4_t a2, int32x4_t a3, int32x4_t a4, int32x4_t a5)
{
  int32x4_t v5 = vzip1q_s32(a2, a4);
  int32x4_t v6 = vzip1q_s32(a3, a5);
  *(void *)&double result = vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(v5, v6), *(float *)&a1), (float32x4_t)vzip2q_s32(v5, v6), *(float32x2_t *)&a1, 1).u64[0];
  return result;
}

float32x2_t static simd_float4x2.*= infix(_:_:)(float32x2_t *a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  float32x2_t v5 = a1[1];
  float32x2_t v6 = a1[2];
  float32x2_t v7 = a1[3];
  float32x2_t v8 = vmla_laneq_f32(vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(*a1, a2.f32[0]), v5, *(float32x2_t *)a2.f32, 1), v6, a2, 2), v7, a2, 3);
  float32x2_t result = vmla_laneq_f32(vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(*a1, a3.f32[0]), v5, *(float32x2_t *)a3.f32, 1), v6, a3, 2), v7, a3, 3);
  float32x2_t v10 = vmla_laneq_f32(vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(*a1, a4.f32[0]), v5, *(float32x2_t *)a4.f32, 1), v6, a4, 2), v7, a4, 3);
  float32x2_t v11 = vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(*a1, a5.f32[0]), v5, *(float32x2_t *)a5.f32, 1), v6, a5, 2);
  *a1 = v8;
  a1[1] = result;
  a1[2] = v10;
  a1[3] = vmla_laneq_f32(v11, v7, a5, 3);
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float4x2 *a1, simd_float4x2 *a2)
{
  uint32x2_t v10 = (uint32x2_t)vand_s8(vand_s8((int8x8_t)vceq_f32(v3, v7), (int8x8_t)vceq_f32(v2, v6)), vand_s8((int8x8_t)vceq_f32(v4, v8), (int8x8_t)vceq_f32(v5, v9)));
  return vpmin_u32(v10, v10).u32[0] >> 31;
}

__n64 simd_float2x3.init(diagonal:)()
{
  result.n64_u32[1] = 0;
  return result;
}

void __swiftcall simd_float2x3.init(rows:)(simd_float2x3 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 3) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

unint64_t simd_float2x3.subscript.getter(unint64_t result)
{
  if (result > 1) {
    __break(1u);
  }
  return result;
}

uint64_t simd_float2x3.subscript.setter(uint64_t result, __n128 a2)
{
  if (!result) {
    goto LABEL_4;
  }
  if (result == 1)
  {
    ++v2;
LABEL_4:
    *float32x2_t v2 = a2;
    return result;
  }
  __break(1u);
  return result;
}

void (*simd_float2x3.subscript.modify(void (**a1)(void **a1), uint64_t a2))(void **a1)
{
  __n64 result = (void (*)(void **))malloc(0x18uLL);
  *a1 = result;
  *((void *)result + 2) = v2;
  if (!a2)
  {
    *(_OWORD *)__n64 result = *v2;
    return simd_float2x3.subscript.modify;
  }
  if (a2 == 1)
  {
    *(_OWORD *)__n64 result = v2[1];
    return simd_float2x3.subscript.modify;
  }
  __break(1u);
  return result;
}

void simd_float2x3.subscript.modify(void **a1)
{
  Swift::String v1 = *a1;
  *(_OWORD *)v1[2] = *(_OWORD *)v1;
  free(v1);
}

{
  void *v1;

  Swift::String v1 = *a1;
  *(_OWORD *)(v1[2] + 16) = *(_OWORD *)v1;
  free(v1);
}

uint64_t simd_float2x3.subscript.getter(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (result != 1)
    {
LABEL_7:
      __break(1u);
      return result;
    }
    if (a2 <= 2) {
      return result;
    }
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a2 > 2) {
    goto LABEL_6;
  }
  return result;
}

int *key path setter for simd_float2x3.subscript(_:_:) : simd_float2x3(int *result, uint64_t a2, void *a3)
{
  unint64_t v3 = a3[1];
  int v4 = *result;
  if (!*a3)
  {
    if (v3 <= 2)
    {
      *(_DWORD *)(a2 + 4 * v3) = v4;
      return result;
    }
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*a3 == 1)
  {
    if (v3 <= 2)
    {
      *(_DWORD *)(a2 + 16 + 4 * v3) = v4;
      return result;
    }
    goto LABEL_7;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t simd_float2x3.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  if (!result)
  {
    if (a2 > 2) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (result == 1)
  {
    if (a2 > 2)
    {
LABEL_8:
      __break(1u);
      goto LABEL_9;
    }
    v3 += 16;
LABEL_7:
    *(float *)(v3 + 4 * a2) = a3;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t (*simd_float2x3.subscript.modify(uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)__n64 result = a2;
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_7;
    }
    v3 += 16;
  }
  if (a3 <= 2)
  {
    *((_DWORD *)result + 6) = *(_DWORD *)(v3 + 4 * (a3 & 3));
    return simd_float2x3.subscript.modify;
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t simd_float2x3.debugDescription.getter()
{
  _StringGuts.grow(_:)(23);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  v2._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 10589;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  return 0x6F6C665F646D6973;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_float2x3()
{
  return simd_float2x3.debugDescription.getter();
}

uint64_t static simd_float2x3.== infix(_:_:)(float32x4_t a1, float32_t a2, float32x4_t a3, float32_t a4, float32x4_t a5, float32_t a6, float32x4_t a7, float32_t a8)
{
  a1.f32[2] = a2;
  a3.f32[2] = a4;
  a5.f32[2] = a6;
  a7.f32[2] = a8;
  uint32x4_t v8 = (uint32x4_t)vandq_s8((int8x16_t)vceqq_f32(a3, a7), (int8x16_t)vceqq_f32(a1, a5));
  v8.i32[3] = v8.i32[2];
  return vminvq_u32(v8) >> 31;
}

uint64_t simd_equal(simd_float2x3 a1, simd_float2x3 a2)
{
  uint32x4_t v2 = (uint32x4_t)vandq_s8((int8x16_t)vceqq_f32((float32x4_t)a1.columns[0], (float32x4_t)a2.columns[0]), (int8x16_t)vceqq_f32((float32x4_t)a1.columns[1], (float32x4_t)a2.columns[1]));
  v2.i32[3] = v2.i32[2];
  return vminvq_u32(v2) >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float2x3(__n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_float2x3(a1, a2, a3, a4, (uint64_t (*)(__n128, __n128, __n128, __n128))simd_equal);
}

double static simd_float2x3.+ infix(_:_:)(float32x4_t a1, float32_t a2, double a3, double a4, float32x4_t a5, float32_t a6)
{
  a1.f32[2] = a2;
  a5.f32[2] = a6;
  a1.i64[0] = vaddq_f32(a1, a5).u64[0];
  return *(double *)a1.i64;
}

double static simd_float2x3.- prefix(_:)(float32x4_t a1, float32_t a2)
{
  a1.f32[2] = a2;
  a1.i64[0] = vsubq_f32((float32x4_t)0, a1).u64[0];
  return *(double *)a1.i64;
}

double static simd_float2x3.- infix(_:_:)(float32x4_t a1, float32_t a2, double a3, double a4, float32x4_t a5, float32_t a6)
{
  a1.f32[2] = a2;
  a5.f32[2] = a6;
  a1.i64[0] = vsubq_f32(a1, a5).u64[0];
  return *(double *)a1.i64;
}

float32x4_t static simd_float2x3.+= infix(_:_:)(float32x4_t *a1, float32x4_t a2, float32_t a3, float32x4_t a4, float32_t a5)
{
  a2.f32[2] = a3;
  a4.f32[2] = a5;
  float32x4_t result = vaddq_f32(a2, *a1);
  float32x4_t v6 = vaddq_f32(a4, a1[1]);
  *a1 = result;
  a1[1] = v6;
  return result;
}

float32x4_t static simd_float2x3.-= infix(_:_:)(float32x4_t *a1, float32x4_t a2, float32_t a3, float32x4_t a4, float32_t a5)
{
  a2.f32[2] = a3;
  a4.f32[2] = a5;
  float32x4_t result = vsubq_f32(*a1, a2);
  float32x4_t v6 = vsubq_f32(a1[1], a4);
  *a1 = result;
  a1[1] = v6;
  return result;
}

double static simd_float2x3.* infix(_:_:)(float a1, float32x4_t a2, float32_t a3)
{
  a2.f32[2] = a3;
  *(void *)&double result = vmulq_n_f32(a2, a1).u64[0];
  return result;
}

double static simd_float2x3.* infix(_:_:)(float32x4_t a1, float32_t a2, double a3, double a4, float a5)
{
  a1.f32[2] = a2;
  a1.i64[0] = vmulq_n_f32(a1, a5).u64[0];
  return *(double *)a1.i64;
}

float32x4_t static simd_float2x3.*= infix(_:_:)(float32x4_t *a1, float a2)
{
  float32x4_t v2 = vmulq_n_f32(*a1, a2);
  float32x4_t result = vmulq_n_f32(a1[1], a2);
  *a1 = v2;
  a1[1] = result;
  return result;
}

double static simd_float2x3.* infix(_:_:)(float32x4_t a1, float32_t a2, float32x4_t a3, float32_t a4, double a5)
{
  a1.f32[2] = a2;
  a3.f32[2] = a4;
  a1.i64[0] = vmlaq_lane_f32(vmulq_n_f32(a1, *(float *)&a5), a3, *(float32x2_t *)&a5, 1).u64[0];
  return *(double *)a1.i64;
}

{
  a1.f32[2] = a2;
  a3.f32[2] = a4;
  a1.i64[0] = vmlaq_lane_f32(vmulq_n_f32(a1, *(float *)&a5), a3, *(float32x2_t *)&a5, 1).u64[0];
  return *(double *)a1.i64;
}

float32x2_t static simd_float2x3.* infix(_:_:)(float32x4_t a1, int32x2_t a2, float32x2_t a3, int32x2_t a4, float32_t a5)
{
  a3.f32[1] = a5;
  return vmla_laneq_f32(vmla_lane_f32(vmul_n_f32((float32x2_t)vzip1_s32(a2, a4), a1.f32[0]), (float32x2_t)vzip2_s32(a2, a4), *(float32x2_t *)a1.f32, 1), a3, a1, 2);
}

float32x4_t static simd_float2x3.* infix(_:_:)@<Q0>(float32x4_t *a1@<X8>, float32x4_t a2@<Q0>, float32_t a3@<S1>, float32x4_t a4@<Q2>, float32_t a5@<S3>, double a6@<D4>, double a7@<D5>, double a8@<D6>)
{
  a2.f32[2] = a3;
  a4.f32[2] = a5;
  float32x4_t v8 = vmlaq_lane_f32(vmulq_n_f32(a2, *(float *)&a6), a4, *(float32x2_t *)&a6, 1);
  float32x4_t v9 = vmlaq_lane_f32(vmulq_n_f32(a2, *(float *)&a7), a4, *(float32x2_t *)&a7, 1);
  float32x4_t result = vmlaq_lane_f32(vmulq_n_f32(a2, *(float *)&a8), a4, *(float32x2_t *)&a8, 1);
  *a1 = v8;
  a1[1] = v9;
  a1[2] = result;
  return result;
}

float32x4_t static simd_float2x3.* infix(_:_:)@<Q0>(float32x4_t *a1@<X8>, float32x4_t a2@<Q0>, float32_t a3@<S1>, float32x4_t a4@<Q2>, float32_t a5@<S3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>)
{
  a2.f32[2] = a3;
  a4.f32[2] = a5;
  float32x4_t v9 = vmlaq_lane_f32(vmulq_n_f32(a2, *(float *)&a6), a4, *(float32x2_t *)&a6, 1);
  float32x4_t v10 = vmlaq_lane_f32(vmulq_n_f32(a2, *(float *)&a8), a4, *(float32x2_t *)&a8, 1);
  *a1 = v9;
  a1[1] = vmlaq_lane_f32(vmulq_n_f32(a2, *(float *)&a7), a4, *(float32x2_t *)&a7, 1);
  float32x4_t result = vmlaq_lane_f32(vmulq_n_f32(a2, *(float *)&a9), a4, *(float32x2_t *)&a9, 1);
  a1[2] = v10;
  a1[3] = result;
  return result;
}

float32x4_t static simd_float2x3.*= infix(_:_:)(float32x4_t *a1, double a2, double a3)
{
  float32x4_t v3 = a1[1];
  float32x4_t v4 = vmlaq_lane_f32(vmulq_n_f32(*a1, *(float *)&a2), v3, *(float32x2_t *)&a2, 1);
  float32x4_t result = vmlaq_lane_f32(vmulq_n_f32(*a1, *(float *)&a3), v3, *(float32x2_t *)&a3, 1);
  *a1 = v4;
  a1[1] = result;
  return result;
}

int32x2_t matrix_transpose(_:)(int32x2_t a1, int32x2_t a2)
{
  return vzip1_s32(a1, a2);
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float2x3 *a1, simd_float2x3 *a2)
{
  v2.i32[2] = v3;
  v4.i32[2] = v5;
  v6.i32[2] = v7;
  v8.i32[2] = v9;
  uint32x4_t v10 = (uint32x4_t)vandq_s8((int8x16_t)vceqq_f32(v4, v8), (int8x16_t)vceqq_f32(v2, v6));
  v10.i32[3] = v10.i32[2];
  return vminvq_u32(v10) >> 31;
}

void __swiftcall simd_float3x3.init(_:)(simd_float3x3 *__return_ptr retstr, Swift::Float a2)
{
  int32x4_t v2 = vdupq_lane_s32(0, 0);
  simd_float3 v3 = (simd_float3)v2;
  v3.f32[0] = a2;
  simd_float3 v4 = (simd_float3)v2;
  v4.f32[1] = a2;
  *(Swift::Float *)&v2.i32[2] = a2;
  retstr->columns[0] = v3;
  retstr->columns[1] = v4;
  retstr->columns[2] = (simd_float3)v2;
}

void simd_float3x3.init(diagonal:)(int32x4_t *a1@<X8>, __n128 a2@<Q0>)
{
  int32x4_t v2 = vdupq_lane_s32(0, 0);
  int32x4_t v3 = v2;
  v3.i32[0] = a2.n128_u32[0];
  int32x4_t v4 = v2;
  v4.i32[1] = a2.n128_i32[1];
  v2.i32[2] = a2.n128_i32[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v2;
}

void __swiftcall simd_float3x3.init(_:)(simd_float3x3 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 3)
  {
    simd_float3 v4 = *((simd_float3 *)a2._rawValue + 3);
    simd_float3 v5 = *((simd_float3 *)a2._rawValue + 2);
    simd_float3 v3 = *((simd_float3 *)a2._rawValue + 4);
    swift_bridgeObjectRelease();
    retstr->columns[0] = v5;
    retstr->columns[1] = v4;
    retstr->columns[2] = v3;
  }
  else
  {
    __break(1u);
  }
}

void __swiftcall simd_float3x3.init(rows:)(simd_float3x3 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 3)
  {
    int32x4_t v9 = *((int32x4_t *)rows._rawValue + 2);
    int32x4_t v10 = *((int32x4_t *)rows._rawValue + 3);
    int32x4_t v8 = *((int32x4_t *)rows._rawValue + 4);
    swift_bridgeObjectRelease();
    int32x4_t v3 = vzip1q_s32(v9, v8);
    int32x4_t v4 = vzip1q_s32(v10, (int32x4_t)0);
    int32x4_t v5 = vzip1q_s32(v3, v4);
    int32x4_t v6 = vzip2q_s32(v3, v4);
    v5.i32[2] = vdupq_lane_s32(*(int32x2_t *)&v8, 0).i32[2];
    v6.i32[2] = vdupq_lane_s32(*(int32x2_t *)&v8, 1).i32[2];
    int32x4_t v7 = vzip1q_s32(vdupq_laneq_s32(v9, 2), vdupq_laneq_s32(v10, 2));
    v7.i32[2] = v8.i32[2];
    retstr->columns[0] = (simd_float3)v5;
    retstr->columns[1] = (simd_float3)v6;
    retstr->columns[2] = (simd_float3)v7;
  }
  else
  {
    __break(1u);
  }
}

__n128 simd_float3x3.transpose.getter@<Q0>(int32x4_t *a1@<X8>)
{
  int32x4_t v2 = v1[1];
  int32x4_t v3 = v1[2];
  int32x4_t v4 = vzip1q_s32(*v1, v3);
  int32x4_t v5 = vzip1q_s32(v2, (int32x4_t)0);
  int32x4_t v6 = vzip1q_s32(v4, v5);
  int32x4_t v7 = vzip2q_s32(v4, v5);
  v6.i32[2] = vdupq_lane_s32(*(int32x2_t *)&v3, 0).i32[2];
  v7.i32[2] = vdupq_lane_s32(*(int32x2_t *)&v3, 1).i32[2];
  int32x4_t v8 = vzip1q_s32(vdupq_laneq_s32(*v1, 2), vdupq_laneq_s32(v2, 2));
  v8.i32[2] = v1[2].i64[1];
  *a1 = v6;
  a1[1] = v7;
  a1[2] = v8;
  result.n128_u64[0] = v8.i64[0];
  result.n128_u32[2] = v8.u32[2];
  return result;
}

void simd_float3x3.init(_:_:_:)(__n128 *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>, __n128 a4@<Q2>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
}

void __swiftcall simd_float3x3.init(_:)(simd_float3x3 *__return_ptr retstr, simd_float3x3 *a2)
{
  simd_float3 v2 = a2->columns[1];
  retstr->columns[0] = a2->columns[0];
  retstr->columns[1] = v2;
  retstr->columns[2] = a2->columns[2];
}

__n128 simd_float3x3.cmatrix.getter@<Q0>(uint64_t a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(v1 + 32);
  *(__n128 *)(a1 + 32) = result;
  return result;
}

unint64_t simd_float3x3.subscript.getter(unint64_t result)
{
  if (result > 2) {
    __break(1u);
  }
  return result;
}

void (*simd_float3x3.subscript.modify(void (**a1)(void **a1), uint64_t a2))(void **a1)
{
  __n128 result = (void (*)(void **))malloc(0x20uLL);
  *a1 = result;
  *((void *)result + 2) = a2;
  *((void *)result + 3) = v2;
  switch(a2)
  {
    case 0:
      *(_OWORD *)__n128 result = *v2;
      return simd_float3x3.subscript.modify;
    case 1:
      long long v6 = v2[1];
LABEL_7:
      *(_OWORD *)__n128 result = v6;
      return (void (*)(void **))simd_float3x3.subscript.modify;
    case 2:
      long long v6 = v2[2];
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

void simd_float3x3.subscript.modify(void **a1)
{
  uint64_t v1 = *a1;
  *(_OWORD *)v1[3] = *(_OWORD *)v1;
  free(v1);
}

unint64_t simd_float3x3.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 2)
  {
    if (a2 <= 2) {
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t key path getter for simd_float3x3.subscript(_:_:) : simd_float3x3@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 1)
  {
    result += 16;
  }
  else if (v3)
  {
    if (v3 != 2) {
      goto LABEL_9;
    }
    result += 32;
  }
  if ((unint64_t)a2[1] <= 2)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 3));
    return result;
  }
  __break(1u);
LABEL_9:
  __break(1u);
  return result;
}

int *key path setter for simd_float3x3.subscript(_:_:) : simd_float3x3(int *result, long long *a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  unint64_t v3 = a3[1];
  int v5 = *result;
  if (!*a3)
  {
    if (v3 <= 2)
    {
      long long v7 = *a2;
      *(_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3 | (4 * (v3 & 3))) = v5;
      *a2 = v7;
      return result;
    }
    goto LABEL_12;
  }
  if (v4 == 1)
  {
    long long v6 = a2[1];
  }
  else
  {
    if (v4 != 2)
    {
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
    }
    long long v6 = a2[2];
  }
  if (v3 > 2)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  long long v8 = v6;
  *(_DWORD *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF3 | (4 * (v3 & 3))) = v5;
  if (v4 == 1) {
    a2[1] = v8;
  }
  else {
    a2[2] = v8;
  }
  return result;
}

uint64_t simd_float3x3.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  switch(result)
  {
    case 0:
      if (a2 <= 2)
      {
        long long v5 = *v3;
        *(float *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3 | (4 * (a2 & 3))) = a3;
        *unint64_t v3 = v5;
        return result;
      }
      goto LABEL_12;
    case 1:
      long long v4 = v3[1];
      break;
    case 2:
      long long v4 = v3[2];
      break;
    default:
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
  }
  if (a2 > 2)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  long long v6 = v4;
  *(float *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (a2 & 3))) = a3;
  if (result == 1) {
    v3[1] = v6;
  }
  else {
    v3[2] = v6;
  }
  return result;
}

uint64_t (*simd_float3x3.subscript.modify(uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)__n128 result = a2;
  switch(a2)
  {
    case 0:
      long long v4 = *v3;
      if (a3 <= 2) {
        goto LABEL_6;
      }
LABEL_9:
      __break(1u);
      break;
    case 1:
      long long v4 = v3[1];
      if (a3 > 2) {
        goto LABEL_9;
      }
LABEL_6:
      long long v5 = v4;
      *((_DWORD *)result + 6) = *(_DWORD *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3 | (4 * (a3 & 3)));
      return simd_float3x3.subscript.modify;
    case 2:
      long long v4 = v3[2];
      if (a3 <= 2) {
        goto LABEL_6;
      }
      goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t simd_float3x3.debugDescription.getter()
{
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  v2._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 8236;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  v4._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 10589;
  v5._object = (void *)0xE200000000000000;
  String.append(_:)(v5);
  return 0x6F6C665F646D6973;
}

uint64_t static simd_float3x3.== infix(_:_:)(float32x4_t *a1, float32x4_t *a2)
{
  uint32x4_t v2 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a1[1], a2[1]), (int8x16_t)vceqq_f32(*a1, *a2)), (int8x16_t)vceqq_f32(a1[2], a2[2]));
  v2.i32[3] = v2.i32[2];
  return vminvq_u32(v2) >> 31;
}

uint64_t simd_equal(simd_float3x3 a1, simd_float3x3 a2)
{
  uint32x4_t v2 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32((float32x4_t)a1.columns[0], (float32x4_t)a2.columns[0]), (int8x16_t)vceqq_f32((float32x4_t)a1.columns[1], (float32x4_t)a2.columns[1])), (int8x16_t)vceqq_f32((float32x4_t)a1.columns[2], (float32x4_t)a2.columns[2]));
  v2.i32[3] = v2.i32[2];
  return vminvq_u32(v2) >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float3x3(__n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_float3x3(a1, a2, a3, a4, (uint64_t (*)(__n128, __n128, __n128, __n128, __n128, __n128))simd_equal);
}

void simd_float3x3.inverse.getter(simd_float3x3 *a1@<X8>)
{
  *a1 = __invert_f3(*v1);
}

double simd_float3x3.determinant.getter()
{
  int32x4_t v1 = *(int32x4_t *)(v0 + 16);
  int32x4_t v2 = *(int32x4_t *)(v0 + 32);
  float32x4_t v3 = vmulq_f32(*(float32x4_t *)v0, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v2, (int8x16_t)v2, 0xCuLL), (int8x16_t)v2, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v1, v1), (int8x16_t)v1, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v2, v2), (int8x16_t)v2, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v1, (int8x16_t)v1, 0xCuLL), (int8x16_t)v1, 8uLL)));
  *(void *)&double result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).u64[0];
  return result;
}

float32x4_t static simd_float3x3.+ infix(_:_:)@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X1>, float32x4_t *a3@<X8>)
{
  float32x4_t result = vaddq_f32(*a2, *a1);
  float32x4_t v4 = vaddq_f32(a2[1], a1[1]);
  float32x4_t v5 = vaddq_f32(a2[2], a1[2]);
  *a3 = result;
  a3[1] = v4;
  a3[2] = v5;
  return result;
}

float32x4_t static simd_float3x3.- prefix(_:)@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X8>)
{
  float32x4_t result = vsubq_f32((float32x4_t)0, *a1);
  float32x4_t v3 = vsubq_f32((float32x4_t)0, a1[1]);
  float32x4_t v4 = vsubq_f32((float32x4_t)0, a1[2]);
  *a2 = result;
  a2[1] = v3;
  a2[2] = v4;
  return result;
}

float32x4_t static simd_float3x3.- infix(_:_:)@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X1>, float32x4_t *a3@<X8>)
{
  float32x4_t result = vsubq_f32(*a1, *a2);
  float32x4_t v4 = vsubq_f32(a1[1], a2[1]);
  float32x4_t v5 = vsubq_f32(a1[2], a2[2]);
  *a3 = result;
  a3[1] = v4;
  a3[2] = v5;
  return result;
}

float32x4_t static simd_float3x3.+= infix(_:_:)(float32x4_t *a1, float32x4_t *a2)
{
  float32x4_t result = vaddq_f32(*a2, *a1);
  float32x4_t v3 = vaddq_f32(a2[1], a1[1]);
  float32x4_t v4 = vaddq_f32(a2[2], a1[2]);
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

float32x4_t static simd_float3x3.-= infix(_:_:)(float32x4_t *a1, float32x4_t *a2)
{
  float32x4_t result = vsubq_f32(*a1, *a2);
  float32x4_t v3 = vsubq_f32(a1[1], a2[1]);
  float32x4_t v4 = vsubq_f32(a1[2], a2[2]);
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

float32x4_t static simd_float3x3.* infix(_:_:)@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X8>, float a3@<S0>)
{
  float32x4_t v3 = vmulq_n_f32(*a1, a3);
  float32x4_t v4 = vmulq_n_f32(a1[1], a3);
  float32x4_t result = vmulq_n_f32(a1[2], a3);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = result;
  return result;
}

{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t result;

  float32x4_t v3 = vmulq_n_f32(*a1, a3);
  float32x4_t v4 = vmulq_n_f32(a1[1], a3);
  float32x4_t result = vmulq_n_f32(a1[2], a3);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = result;
  return result;
}

float32x4_t static simd_float3x3.*= infix(_:_:)(float32x4_t *a1, float a2)
{
  float32x4_t v2 = vmulq_n_f32(*a1, a2);
  float32x4_t v3 = vmulq_n_f32(a1[1], a2);
  float32x4_t result = vmulq_n_f32(a1[2], a2);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = result;
  return result;
}

double static simd_float3x3.* infix(_:_:)(float32x4_t *a1, float32x4_t a2)
{
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a2.f32[0]), a1[1], *(float32x2_t *)a2.f32, 1), a1[2], a2, 2).u64[0];
  return result;
}

double static simd_float3x3.* infix(_:_:)(int32x4_t *a1, float32x4_t a2)
{
  int32x4_t v2 = a1[1];
  float32x4_t v3 = (float32x4_t)vtrn2q_s32(*a1, v2);
  v3.i32[2] = HIDWORD(a1[2].i64[0]);
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(vzip1q_s32(*a1, a1[2]), v2), a2.f32[0]), v3, *(float32x2_t *)a2.f32, 1), (float32x4_t)vzip1q_s32(vzip2q_s32(*a1, a1[2]), vdupq_laneq_s32(v2, 2)), a2, 2).u64[0];
  return result;
}

double static simd_float3x3.* infix(_:_:)(float32x4_t *a1, double a2, float a3)
{
  *(void *)&double result = vmlaq_n_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, *(float *)&a2), a1[1], *(float32x2_t *)&a2, 1), a1[2], a3).u64[0];
  return result;
}

float32x4_t static simd_float3x3.* infix(_:_:)@<Q0>(float32x4_t *a1@<X0>, float32x2_t *a2@<X1>, float32x4_t *a3@<X8>)
{
  float32x4_t v3 = a1[1];
  float32x4_t v4 = a1[2];
  float32x4_t result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[2].f32)), v3, a2[2], 1), v4, *(float32x4_t *)a2[2].f32, 2);
  float32x4_t v6 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[4].f32)), v3, a2[4], 1), v4, *(float32x4_t *)a2[4].f32, 2);
  *a3 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2->f32)), v3, *a2, 1), v4, *(float32x4_t *)a2->f32, 2);
  a3[1] = result;
  a3[2] = v6;
  return result;
}

{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t result;
  float32x4_t v6;
  float32x4_t v7;

  float32x4_t v3 = a1[1];
  float32x4_t v4 = a1[2];
  float32x4_t result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[2].f32)), v3, a2[2], 1), v4, *(float32x4_t *)a2[2].f32, 2);
  float32x4_t v6 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[4].f32)), v3, a2[4], 1), v4, *(float32x4_t *)a2[4].f32, 2);
  long long v7 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[6].f32)), v3, a2[6], 1), v4, *(float32x4_t *)a2[6].f32, 2);
  *a3 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2->f32)), v3, *a2, 1), v4, *(float32x4_t *)a2->f32, 2);
  a3[1] = result;
  a3[2] = v6;
  a3[3] = v7;
  return result;
}

float32x4_t static simd_float3x3.*= infix(_:_:)(float32x4_t *a1, float32x2_t *a2)
{
  float32x4_t v2 = a1[1];
  float32x4_t v3 = a1[2];
  float32x4_t result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[2].f32)), v2, a2[2], 1), v3, *(float32x4_t *)a2[2].f32, 2);
  float32x4_t v5 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[4].f32)), v2, a2[4], 1), v3, *(float32x4_t *)a2[4].f32, 2);
  *a1 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2->f32)), v2, *a2, 1), v3, *(float32x4_t *)a2->f32, 2);
  a1[1] = result;
  a1[2] = v5;
  return result;
}

void matrix_from_diagonal(_:)(int32x4_t *a1@<X8>, __n128 a2@<Q0>)
{
  int32x4_t v2 = vdupq_lane_s32(0, 0);
  int32x4_t v3 = v2;
  v3.i32[0] = a2.n128_u32[0];
  int32x4_t v4 = v2;
  v4.i32[1] = a2.n128_i32[1];
  v2.i32[2] = a2.n128_i32[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v2;
}

void __swiftcall matrix_invert(_:)(simd_float3x3 *__return_ptr retstr, simd_float3x3 *a2)
{
  *retstr = __invert_f3(*a2);
}

Swift::Float __swiftcall matrix_determinant(_:)(simd_float3x3 *a1)
{
  int32x4_t v1 = (int32x4_t)a1->columns[1];
  int32x4_t v2 = (int32x4_t)a1->columns[2];
  float32x4_t v3 = vmulq_f32((float32x4_t)a1->columns[0], vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v2, (int8x16_t)v2, 0xCuLL), (int8x16_t)v2, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v1, v1), (int8x16_t)v1, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v2, v2), (int8x16_t)v2, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v1, (int8x16_t)v1, 0xCuLL), (int8x16_t)v1, 8uLL)));
  LODWORD(result) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).u32[0];
  return result;
}

void matrix_from_columns(_:_:_:)(__n128 *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>, __n128 a4@<Q2>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
}

__n128 matrix_from_rows(_:_:_:)@<Q0>(int32x4_t *a1@<X8>, int32x4_t a2@<Q0>, int32x4_t a3@<Q1>, int32x4_t a4@<Q2>)
{
  int32x4_t v4 = vzip1q_s32(a2, a4);
  int32x4_t v5 = vzip1q_s32(a3, (int32x4_t)0);
  int32x4_t v6 = vzip1q_s32(v4, v5);
  int32x4_t v7 = vzip2q_s32(v4, v5);
  v6.i32[2] = vdupq_lane_s32(*(int32x2_t *)&a4, 0).i32[2];
  v7.i32[2] = vdupq_lane_s32(*(int32x2_t *)&a4, 1).i32[2];
  int32x4_t v8 = vzip1q_s32(vdupq_laneq_s32(a2, 2), vdupq_laneq_s32(a3, 2));
  v8.i32[2] = a4.i32[2];
  *a1 = v6;
  a1[1] = v7;
  a1[2] = v8;
  result.n128_u64[0] = v8.i64[0];
  result.n128_u32[2] = v8.u32[2];
  return result;
}

{
  int32x4_t v4;
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  __n128 result;

  int32x4_t v4 = vzip1q_s32(a2, a4);
  int32x4_t v5 = vzip2q_s32(a2, a4);
  int32x4_t v6 = vzip1q_s32(a3, (int32x4_t)0);
  int32x4_t v7 = vzip2q_s32(a3, (int32x4_t)0);
  int32x4_t v8 = vzip1q_s32(v4, v6);
  int32x4_t v9 = vzip2q_s32(v4, v6);
  int32x4_t v10 = vzip1q_s32(v5, v7);
  float32x2_t v11 = vzip2q_s32(v5, v7);
  v8.i32[2] = vdupq_lane_s32(*(int32x2_t *)&a4, 0).i32[2];
  v9.i32[2] = vdupq_lane_s32(*(int32x2_t *)&a4, 1).i32[2];
  v10.i32[2] = a4.i32[2];
  v11.i32[2] = vdupq_laneq_s32(a4, 3).i32[2];
  *a1 = v8;
  a1[1] = v9;
  a1[2] = v10;
  a1[3] = v11;
  result.n128_u64[0] = v11.i64[0];
  result.n128_u32[2] = v11.u32[2];
  return result;
}

void __swiftcall matrix_transpose(_:)(simd_float3x3 *__return_ptr retstr, simd_float3x3 *a2)
{
  int32x4_t v2 = (int32x4_t)a2->columns[1];
  int32x4_t v3 = (int32x4_t)a2->columns[2];
  int32x4_t v4 = vzip1q_s32((int32x4_t)a2->columns[0], v3);
  int32x4_t v5 = vzip1q_s32(v2, (int32x4_t)0);
  int32x4_t v6 = vzip1q_s32(v4, v5);
  int32x4_t v7 = vzip2q_s32(v4, v5);
  v6.i32[2] = vdupq_lane_s32(*(int32x2_t *)&v3, 0).i32[2];
  v7.i32[2] = vdupq_lane_s32(*(int32x2_t *)&v3, 1).i32[2];
  int32x4_t v8 = vzip1q_s32(vdupq_laneq_s32((int32x4_t)a2->columns[0], 2), vdupq_laneq_s32(v2, 2));
  v8.i32[2] = a2->columns[2].i64[1];
  retstr->columns[0] = (simd_float3)v6;
  retstr->columns[1] = (simd_float3)v7;
  retstr->columns[2] = (simd_float3)v8;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float3x3 *a1, simd_float3x3 *a2)
{
  uint32x4_t v2 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32((float32x4_t)a1->columns[1], (float32x4_t)a2->columns[1]), (int8x16_t)vceqq_f32((float32x4_t)a1->columns[0], (float32x4_t)a2->columns[0])), (int8x16_t)vceqq_f32((float32x4_t)a1->columns[2], (float32x4_t)a2->columns[2]));
  v2.i32[3] = v2.i32[2];
  return vminvq_u32(v2) >> 31;
}

void __swiftcall simd_float4x3.init(_:)(simd_float4x3 *__return_ptr retstr, Swift::Float a2)
{
  int32x4_t v2 = vdupq_lane_s32(0, 0);
  simd_float3 v3 = (simd_float3)v2;
  v3.f32[0] = a2;
  simd_float3 v4 = (simd_float3)v2;
  v4.f32[1] = a2;
  *(Swift::Float *)&v2.i32[2] = a2;
  retstr->columns[0] = v3;
  retstr->columns[1] = v4;
  retstr->columns[2] = (simd_float3)v2;
  retstr->columns[3] = 0uLL;
}

void simd_float4x3.init(diagonal:)(int32x4_t *a1@<X8>, __n128 a2@<Q0>)
{
  int32x4_t v2 = vdupq_lane_s32(0, 0);
  int32x4_t v3 = v2;
  v3.i32[0] = a2.n128_u32[0];
  int32x4_t v4 = v2;
  v4.i32[1] = a2.n128_i32[1];
  v2.i32[2] = a2.n128_i32[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v2;
  a1[3].i64[0] = 0;
  a1[3].i64[1] = 0;
}

void __swiftcall simd_float4x3.init(_:)(simd_float4x3 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 4)
  {
    simd_float3 v6 = *((simd_float3 *)a2._rawValue + 2);
    simd_float3 v4 = *((simd_float3 *)a2._rawValue + 4);
    simd_float3 v5 = *((simd_float3 *)a2._rawValue + 3);
    simd_float3 v3 = *((simd_float3 *)a2._rawValue + 5);
    swift_bridgeObjectRelease();
    retstr->columns[0] = v6;
    retstr->columns[1] = v5;
    retstr->columns[2] = v4;
    retstr->columns[3] = v3;
  }
  else
  {
    __break(1u);
  }
}

void __swiftcall simd_float4x3.init(rows:)(simd_float4x3 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 3)
  {
    int32x4_t v12 = *((int32x4_t *)rows._rawValue + 2);
    int32x4_t v13 = *((int32x4_t *)rows._rawValue + 3);
    int32x4_t v11 = *((int32x4_t *)rows._rawValue + 4);
    swift_bridgeObjectRelease();
    int32x4_t v3 = vzip1q_s32(v12, v11);
    int32x4_t v4 = vzip2q_s32(v12, v11);
    int32x4_t v5 = vzip1q_s32(v13, (int32x4_t)0);
    int32x4_t v6 = vzip2q_s32(v13, (int32x4_t)0);
    int32x4_t v7 = vzip1q_s32(v3, v5);
    int32x4_t v8 = vzip2q_s32(v3, v5);
    int32x4_t v9 = vzip1q_s32(v4, v6);
    int32x4_t v10 = vzip2q_s32(v4, v6);
    v7.i32[2] = vdupq_lane_s32(*(int32x2_t *)&v11, 0).i32[2];
    v8.i32[2] = vdupq_lane_s32(*(int32x2_t *)&v11, 1).i32[2];
    v9.i32[2] = v11.i32[2];
    v10.i32[2] = vdupq_laneq_s32(v11, 3).i32[2];
    retstr->columns[0] = (simd_float3)v7;
    retstr->columns[1] = (simd_float3)v8;
    retstr->columns[2] = (simd_float3)v9;
    retstr->columns[3] = (simd_float3)v10;
  }
  else
  {
    __break(1u);
  }
}

void __swiftcall simd_float3x4.init(_:)(simd_float3x4 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 3) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

__n128 simd_float3x4.transpose.getter@<Q0>(int32x4_t *a1@<X8>, int32x4_t a2@<Q0>, int32x4_t a3@<Q1>, int32x4_t a4@<Q2>)
{
  int32x4_t v4 = vzip1q_s32(a2, a4);
  int32x4_t v5 = vzip2q_s32(a2, a4);
  int32x4_t v6 = vzip1q_s32(a3, (int32x4_t)0);
  int32x4_t v7 = vzip2q_s32(a3, (int32x4_t)0);
  int32x4_t v8 = vzip1q_s32(v4, v6);
  int32x4_t v9 = vzip2q_s32(v4, v6);
  int32x4_t v10 = vzip1q_s32(v5, v7);
  int32x4_t v11 = vzip2q_s32(v5, v7);
  v8.i32[2] = vdupq_lane_s32(*(int32x2_t *)&a4, 0).i32[2];
  v9.i32[2] = vdupq_lane_s32(*(int32x2_t *)&a4, 1).i32[2];
  v10.i32[2] = a4.i32[2];
  v11.i32[2] = vdupq_laneq_s32(a4, 3).i32[2];
  *a1 = v8;
  a1[1] = v9;
  a1[2] = v10;
  a1[3] = v11;
  result.n128_u64[0] = v11.i64[0];
  result.n128_u32[2] = v11.u32[2];
  return result;
}

void simd_float4x3.init(_:_:_:_:)(__n128 *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
}

void __swiftcall simd_float4x3.init(_:)(simd_float4x3 *__return_ptr retstr, simd_float4x3 *a2)
{
  simd_float3 v2 = a2->columns[1];
  retstr->columns[0] = a2->columns[0];
  retstr->columns[1] = v2;
  simd_float3 v3 = a2->columns[3];
  retstr->columns[2] = a2->columns[2];
  retstr->columns[3] = v3;
}

__n128 simd_float4x3.cmatrix.getter@<Q0>(uint64_t a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(v1 + 32);
  long long v4 = *(_OWORD *)(v1 + 48);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

__n128 simd_float4x3.subscript.getter(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      break;
    case 1:
      v1 += 16;
      break;
    case 2:
      v1 += 32;
      break;
    case 3:
      v1 += 48;
      break;
    default:
      __break(1u);
      JUMPOUT(0x2128238E0);
  }
  return *(__n128 *)v1;
}

uint64_t (*simd_float4x3.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  __n128 result = (uint64_t (*)())malloc(0x20uLL);
  *a1 = result;
  *((void *)result + 2) = a2;
  *((void *)result + 3) = v2;
  switch(a2)
  {
    case 0:
      *(_OWORD *)__n128 result = *v2;
      return simd_float4x3.subscript.modify;
    case 1:
      long long v6 = v2[1];
      goto LABEL_9;
    case 2:
      long long v6 = v2[2];
LABEL_9:
      *(_OWORD *)__n128 result = v6;
      return simd_float4x3.subscript.modify;
    case 3:
      long long v6 = v2[3];
      goto LABEL_9;
  }
  __break(1u);
  return result;
}

float simd_float4x3.subscript.getter(uint64_t a1, unint64_t a2)
{
  switch(a1)
  {
    case 0:
      goto LABEL_5;
    case 1:
      v2 += 16;
      goto LABEL_5;
    case 2:
      v2 += 32;
      goto LABEL_5;
    case 3:
      v2 += 48;
LABEL_5:
      if (a2 > 2)
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x212823A0CLL);
      }
      return *(float *)(v2 + 4 * (a2 & 3));
    default:
      goto LABEL_8;
  }
}

uint64_t key path getter for simd_float4x3.subscript(_:_:) : simd_float4x3@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 2)
  {
    result += 32;
  }
  else if (v3 == 1)
  {
    result += 16;
  }
  else if (v3)
  {
    if (v3 != 3) {
      goto LABEL_11;
    }
    result += 48;
  }
  if ((unint64_t)a2[1] <= 2)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 3));
    return result;
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

int *key path setter for simd_float4x3.subscript(_:_:) : simd_float4x3(int *result, long long *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = a3[1];
  int v5 = *result;
  if (!*a3)
  {
    if (v4 <= 2)
    {
      long long v7 = *a2;
      *(_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3 | (4 * (v4 & 3))) = v5;
      *a2 = v7;
      return result;
    }
    goto LABEL_16;
  }
  switch(v3)
  {
    case 1:
      long long v6 = a2[1];
      break;
    case 2:
      long long v6 = a2[2];
      break;
    case 3:
      long long v6 = a2[3];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }
  if (v4 > 2)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  long long v8 = v6;
  *(_DWORD *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF3 | (4 * (v4 & 3))) = v5;
  if (v3 == 1)
  {
    a2[1] = v8;
  }
  else if (v3 == 2)
  {
    a2[2] = v8;
  }
  else
  {
    a2[3] = v8;
  }
  return result;
}

uint64_t simd_float4x3.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  switch(result)
  {
    case 0:
      if (a2 <= 2)
      {
        long long v5 = *v3;
        *(float *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3 | (4 * (a2 & 3))) = a3;
        *uint64_t v3 = v5;
        return result;
      }
      goto LABEL_16;
    case 1:
      long long v4 = v3[1];
      break;
    case 2:
      long long v4 = v3[2];
      break;
    case 3:
      long long v4 = v3[3];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }
  if (a2 > 2)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  long long v6 = v4;
  *(float *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (a2 & 3))) = a3;
  if (result == 1)
  {
    v3[1] = v6;
  }
  else if (result == 2)
  {
    v3[2] = v6;
  }
  else
  {
    v3[3] = v6;
  }
  return result;
}

uint64_t (*simd_float4x3.subscript.modify(uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)__n128 result = a2;
  if (a2)
  {
    switch(a2)
    {
      case 1:
        long long v4 = v3[1];
        break;
      case 2:
        long long v4 = v3[2];
        break;
      case 3:
        long long v4 = v3[3];
        break;
      default:
        goto LABEL_12;
    }
  }
  else
  {
    long long v4 = *v3;
  }
  if (a3 <= 2)
  {
    long long v5 = v4;
    *((_DWORD *)result + 6) = *(_DWORD *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3 | (4 * (a3 & 3)));
    return simd_float4x3.subscript.modify;
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t simd_float4x3.debugDescription.getter()
{
  _StringGuts.grow(_:)(31);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  v2._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 8236;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  v4._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 8236;
  v5._object = (void *)0xE200000000000000;
  String.append(_:)(v5);
  v6._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 10589;
  v7._object = (void *)0xE200000000000000;
  String.append(_:)(v7);
  return 0x6F6C665F646D6973;
}

uint64_t static simd_float4x3.== infix(_:_:)(float32x4_t *a1, float32x4_t *a2)
{
  uint32x4_t v2 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a1[1], a2[1]), (int8x16_t)vceqq_f32(*a1, *a2)), vandq_s8((int8x16_t)vceqq_f32(a1[2], a2[2]), (int8x16_t)vceqq_f32(a1[3], a2[3])));
  v2.i32[3] = v2.i32[2];
  return vminvq_u32(v2) >> 31;
}

uint64_t simd_equal(simd_float4x3 a1, simd_float4x3 a2)
{
  uint32x4_t v2 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32((float32x4_t)a1.columns[0], (float32x4_t)a2.columns[0]), (int8x16_t)vceqq_f32((float32x4_t)a1.columns[1], (float32x4_t)a2.columns[1])), vandq_s8((int8x16_t)vceqq_f32((float32x4_t)a1.columns[2], (float32x4_t)a2.columns[2]), (int8x16_t)vceqq_f32((float32x4_t)a1.columns[3], (float32x4_t)a2.columns[3])));
  v2.i32[3] = v2.i32[2];
  return vminvq_u32(v2) >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float4x3(__n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_float4x3(a1, a2, a3, a4, (uint64_t (*)(__n128, __n128, __n128, __n128, __n128, __n128, __n128, __n128))simd_equal);
}

double simd_float4x3.transpose.getter()
{
  *(void *)&double result = vzip1q_s32(vzip1q_s32(*v0, v0[2]), vzip1q_s32(v0[1], v0[3])).u64[0];
  return result;
}

float32x4_t static simd_float4x3.+ infix(_:_:)@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X1>, float32x4_t *a3@<X8>)
{
  float32x4_t result = vaddq_f32(*a2, *a1);
  float32x4_t v4 = vaddq_f32(a2[1], a1[1]);
  float32x4_t v5 = vaddq_f32(a2[2], a1[2]);
  float32x4_t v6 = vaddq_f32(a2[3], a1[3]);
  *a3 = result;
  a3[1] = v4;
  a3[2] = v5;
  a3[3] = v6;
  return result;
}

float32x4_t static simd_float4x3.- prefix(_:)@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X8>)
{
  float32x4_t result = vsubq_f32((float32x4_t)0, *a1);
  float32x4_t v3 = vsubq_f32((float32x4_t)0, a1[1]);
  float32x4_t v4 = vsubq_f32((float32x4_t)0, a1[2]);
  float32x4_t v5 = vsubq_f32((float32x4_t)0, a1[3]);
  *a2 = result;
  a2[1] = v3;
  a2[2] = v4;
  a2[3] = v5;
  return result;
}

float32x4_t static simd_float4x3.- infix(_:_:)@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X1>, float32x4_t *a3@<X8>)
{
  float32x4_t result = vsubq_f32(*a1, *a2);
  float32x4_t v4 = vsubq_f32(a1[1], a2[1]);
  float32x4_t v5 = vsubq_f32(a1[2], a2[2]);
  float32x4_t v6 = vsubq_f32(a1[3], a2[3]);
  *a3 = result;
  a3[1] = v4;
  a3[2] = v5;
  a3[3] = v6;
  return result;
}

float32x4_t static simd_float4x3.+= infix(_:_:)(float32x4_t *a1, float32x4_t *a2)
{
  float32x4_t result = vaddq_f32(*a2, *a1);
  float32x4_t v3 = vaddq_f32(a2[1], a1[1]);
  float32x4_t v4 = vaddq_f32(a2[2], a1[2]);
  float32x4_t v5 = vaddq_f32(a2[3], a1[3]);
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return result;
}

float32x4_t static simd_float4x3.-= infix(_:_:)(float32x4_t *a1, float32x4_t *a2)
{
  float32x4_t result = vsubq_f32(*a1, *a2);
  float32x4_t v3 = vsubq_f32(a1[1], a2[1]);
  float32x4_t v4 = vsubq_f32(a1[2], a2[2]);
  float32x4_t v5 = vsubq_f32(a1[3], a2[3]);
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return result;
}

float32x4_t static simd_float4x3.* infix(_:_:)@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X8>, float a3@<S0>)
{
  float32x4_t v3 = vmulq_n_f32(*a1, a3);
  float32x4_t v4 = vmulq_n_f32(a1[1], a3);
  float32x4_t v5 = vmulq_n_f32(a1[2], a3);
  float32x4_t result = vmulq_n_f32(a1[3], a3);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = result;
  return result;
}

{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t result;

  float32x4_t v3 = vmulq_n_f32(*a1, a3);
  float32x4_t v4 = vmulq_n_f32(a1[1], a3);
  float32x4_t v5 = vmulq_n_f32(a1[2], a3);
  float32x4_t result = vmulq_n_f32(a1[3], a3);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = result;
  return result;
}

float32x4_t static simd_float4x3.*= infix(_:_:)(float32x4_t *a1, float a2)
{
  float32x4_t v2 = vmulq_n_f32(*a1, a2);
  float32x4_t v3 = vmulq_n_f32(a1[1], a2);
  float32x4_t v4 = vmulq_n_f32(a1[2], a2);
  float32x4_t result = vmulq_n_f32(a1[3], a2);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = result;
  return result;
}

double static simd_float4x3.* infix(_:_:)(float32x4_t *a1, float32x4_t a2)
{
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a2.f32[0]), a1[1], *(float32x2_t *)a2.f32, 1), a1[2], a2, 2), a1[3], a2, 3).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a2.f32[0]), a1[1], *(float32x2_t *)a2.f32, 1), a1[2], a2, 2), a1[3], a2, 3).u64[0];
  return result;
}

double static simd_float4x3.* infix(_:_:)(int32x4_t *a1, float32x4_t a2)
{
  int32x4_t v2 = a1[1];
  int32x4_t v3 = a1[2];
  int32x4_t v4 = a1[3];
  int32x4_t v5 = vzip1q_s32(*a1, v3);
  int32x4_t v6 = vzip2q_s32(*a1, v3);
  int32x4_t v7 = vzip1q_s32(v2, v4);
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(v5, v7), a2.f32[0]), (float32x4_t)vzip2q_s32(v5, v7), *(float32x2_t *)a2.f32, 1), (float32x4_t)vzip1q_s32(v6, vzip2q_s32(v2, v4)), a2, 2).u64[0];
  return result;
}

float32x4_t static simd_float4x3.* infix(_:_:)@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X8>, float32x4_t a3@<Q0>, float32x4_t a4@<Q1>, float32x4_t a5@<Q2>)
{
  float32x4_t v5 = a1[1];
  float32x4_t v6 = a1[2];
  float32x4_t v7 = a1[3];
  float32x4_t v8 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a3.f32[0]), v5, *(float32x2_t *)a3.f32, 1), v6, a3, 2), v7, a3, 3);
  float32x4_t result = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a4.f32[0]), v5, *(float32x2_t *)a4.f32, 1), v6, a4, 2), v7, a4, 3);
  float32x4_t v10 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a5.f32[0]), v5, *(float32x2_t *)a5.f32, 1), v6, a5, 2), v7, a5, 3);
  *a2 = v8;
  a2[1] = result;
  a2[2] = v10;
  return result;
}

float32x4_t static simd_float4x3.* infix(_:_:)@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X8>, float32x4_t a3@<Q0>, float32x4_t a4@<Q1>, float32x4_t a5@<Q2>, float32x4_t a6@<Q3>)
{
  float32x4_t v6 = a1[1];
  float32x4_t v7 = a1[2];
  float32x4_t v8 = a1[3];
  float32x4_t v9 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a3.f32[0]), v6, *(float32x2_t *)a3.f32, 1), v7, a3, 2), v8, a3, 3);
  float32x4_t result = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a4.f32[0]), v6, *(float32x2_t *)a4.f32, 1), v7, a4, 2), v8, a4, 3);
  float32x4_t v11 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a5.f32[0]), v6, *(float32x2_t *)a5.f32, 1), v7, a5, 2), v8, a5, 3);
  float32x4_t v12 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a6.f32[0]), v6, *(float32x2_t *)a6.f32, 1), v7, a6, 2);
  *a2 = v9;
  a2[1] = result;
  a2[2] = v11;
  a2[3] = vmlaq_laneq_f32(v12, v8, a6, 3);
  return result;
}

float32x4_t static simd_float4x3.*= infix(_:_:)(float32x4_t *a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  float32x4_t v5 = a1[1];
  float32x4_t v6 = a1[2];
  float32x4_t v7 = a1[3];
  float32x4_t v8 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a2.f32[0]), v5, *(float32x2_t *)a2.f32, 1), v6, a2, 2), v7, a2, 3);
  float32x4_t result = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a3.f32[0]), v5, *(float32x2_t *)a3.f32, 1), v6, a3, 2), v7, a3, 3);
  float32x4_t v10 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a4.f32[0]), v5, *(float32x2_t *)a4.f32, 1), v6, a4, 2), v7, a4, 3);
  float32x4_t v11 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a5.f32[0]), v5, *(float32x2_t *)a5.f32, 1), v6, a5, 2);
  *a1 = v8;
  a1[1] = result;
  a1[2] = v10;
  a1[3] = vmlaq_laneq_f32(v11, v7, a5, 3);
  return result;
}

void matrix_from_columns(_:_:_:_:)(__n128 *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float4x3 *a1, simd_float4x3 *a2)
{
  uint32x4_t v2 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32((float32x4_t)a1->columns[1], (float32x4_t)a2->columns[1]), (int8x16_t)vceqq_f32((float32x4_t)a1->columns[0], (float32x4_t)a2->columns[0])), vandq_s8((int8x16_t)vceqq_f32((float32x4_t)a1->columns[2], (float32x4_t)a2->columns[2]), (int8x16_t)vceqq_f32((float32x4_t)a1->columns[3], (float32x4_t)a2->columns[3])));
  v2.i32[3] = v2.i32[2];
  return vminvq_u32(v2) >> 31;
}

double simd_float2x4.init(diagonal:)(float a1)
{
  int32x4_t v1 = vdupq_lane_s32(0, 0);
  *(float *)v1.i32 = a1;
  return *(double *)v1.i64;
}

void __swiftcall simd_float2x4.init(rows:)(simd_float2x4 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 4)
  {
    uint32x4_t v2 = (const float *)((char *)rows._rawValue + 32);
    vld2q_f32(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

unint64_t simd_float2x4.subscript.getter(unint64_t result)
{
  if (result > 1) {
    __break(1u);
  }
  return result;
}

uint64_t (*simd_float2x4.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  float32x4_t result = (uint64_t (*)())malloc(0x18uLL);
  *a1 = result;
  *((void *)result + 2) = v2;
  if (!a2)
  {
    *(_OWORD *)float32x4_t result = *v2;
    return simd_float2x4.subscript.modify;
  }
  if (a2 == 1)
  {
    *(_OWORD *)float32x4_t result = v2[1];
    return simd_float2x4.subscript.modify;
  }
  __break(1u);
  return result;
}

unint64_t simd_float2x4.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 1)
  {
    if (a2 <= 3) {
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

int *key path setter for simd_float2x4.subscript(_:_:) : simd_float2x4(int *result, uint64_t a2, void *a3)
{
  unint64_t v3 = a3[1];
  int v4 = *result;
  if (!*a3)
  {
    if (v3 <= 3)
    {
      *(_DWORD *)(a2 + 4 * v3) = v4;
      return result;
    }
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*a3 == 1)
  {
    if (v3 <= 3)
    {
      *(_DWORD *)(a2 + 16 + 4 * v3) = v4;
      return result;
    }
    goto LABEL_7;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t simd_float2x4.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  if (!result)
  {
    if (a2 > 3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (result == 1)
  {
    if (a2 > 3)
    {
LABEL_8:
      __break(1u);
      goto LABEL_9;
    }
    v3 += 16;
LABEL_7:
    *(float *)(v3 + 4 * a2) = a3;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t (*simd_float2x4.subscript.modify(uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)float32x4_t result = a2;
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_7;
    }
    v3 += 16;
  }
  if (a3 <= 3)
  {
    *((_DWORD *)result + 6) = *(_DWORD *)(v3 + 4 * (a3 & 3));
    return simd_float2x3.subscript.modify;
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

float simd_float2x3.subscript.modify(uint64_t a1)
{
  float result = *(float *)(a1 + 24);
  *(float *)(*(void *)(a1 + 16) + 16 * (*(void *)a1 != 0) + 4 * *(unsigned int *)(a1 + 8)) = result;
  return result;
}

uint64_t simd_float2x4.debugDescription.getter()
{
  _StringGuts.grow(_:)(23);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  v2._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 10589;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  return 0x6F6C665F646D6973;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_float2x4()
{
  return simd_float2x4.debugDescription.getter();
}

uint64_t static simd_float2x4.== infix(_:_:)(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4)
{
  return vminvq_u32((uint32x4_t)vandq_s8((int8x16_t)vceqq_f32(a2, a4), (int8x16_t)vceqq_f32(a1, a3))) >> 31;
}

uint64_t simd_equal(simd_float2x4 a1, simd_float2x4 a2)
{
  return vminvq_u32((uint32x4_t)vandq_s8((int8x16_t)vceqq_f32((float32x4_t)a1.columns[0], (float32x4_t)a2.columns[0]), (int8x16_t)vceqq_f32((float32x4_t)a1.columns[1], (float32x4_t)a2.columns[1]))) >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float2x4(__n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_float2x3(a1, a2, a3, a4, (uint64_t (*)(__n128, __n128, __n128, __n128))simd_equal);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float2x3(__n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(__n128, __n128, __n128, __n128))
{
  return a5(*a1, a1[1], *a2, a2[1]);
}

double static simd_float2x4.+ infix(_:_:)(float32x4_t a1, double a2, float32x4_t a3)
{
  *(void *)&double result = vaddq_f32(a1, a3).u64[0];
  return result;
}

double static simd_float2x4.- prefix(_:)(float32x4_t a1)
{
  *(void *)&double result = vsubq_f32((float32x4_t)0, a1).u64[0];
  return result;
}

double static simd_float2x4.- infix(_:_:)(float32x4_t a1, double a2, float32x4_t a3)
{
  *(void *)&double result = vsubq_f32(a1, a3).u64[0];
  return result;
}

float32x4_t static simd_float2x4.+= infix(_:_:)(float32x4_t *a1, float32x4_t a2, float32x4_t a3)
{
  float32x4_t result = vaddq_f32(*a1, a2);
  float32x4_t v4 = vaddq_f32(a1[1], a3);
  *a1 = result;
  a1[1] = v4;
  return result;
}

float32x4_t static simd_float2x4.-= infix(_:_:)(float32x4_t *a1, float32x4_t a2, float32x4_t a3)
{
  float32x4_t result = vsubq_f32(*a1, a2);
  float32x4_t v4 = vsubq_f32(a1[1], a3);
  *a1 = result;
  a1[1] = v4;
  return result;
}

double static simd_float2x4.* infix(_:_:)(float a1, float32x4_t a2)
{
  *(void *)&double result = vmulq_n_f32(a2, a1).u64[0];
  return result;
}

double static simd_float2x4.* infix(_:_:)(float32x4_t a1, double a2, float a3)
{
  *(void *)&double result = vmulq_n_f32(a1, a3).u64[0];
  return result;
}

float32x4_t static simd_float2x4.*= infix(_:_:)(float32x4_t *a1, float a2)
{
  float32x4_t v2 = vmulq_n_f32(*a1, a2);
  float32x4_t result = vmulq_n_f32(a1[1], a2);
  *a1 = v2;
  a1[1] = result;
  return result;
}

double static simd_float2x4.* infix(_:_:)(float32x4_t a1, float32x4_t a2, double a3)
{
  *(void *)&double result = vmlaq_lane_f32(vmulq_n_f32(a1, *(float *)&a3), a2, *(float32x2_t *)&a3, 1).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vmlaq_lane_f32(vmulq_n_f32(a1, *(float *)&a3), a2, *(float32x2_t *)&a3, 1).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vmlaq_lane_f32(vmulq_n_f32(a1, *(float *)&a3), a2, *(float32x2_t *)&a3, 1).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vmlaq_lane_f32(vmulq_n_f32(a1, *(float *)&a3), a2, *(float32x2_t *)&a3, 1).u64[0];
  return result;
}

float32x2_t static simd_float2x4.* infix(_:_:)(float32x4_t a1, int32x4_t a2, int32x4_t a3)
{
  int8x16_t v3 = (int8x16_t)vzip1q_s32(a2, a3);
  int8x16_t v4 = (int8x16_t)vzip2q_s32(a2, a3);
  return vmla_laneq_f32(vmla_laneq_f32(vmla_lane_f32(vmul_n_f32(*(float32x2_t *)v3.i8, a1.f32[0]), (float32x2_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL), *(float32x2_t *)a1.f32, 1), *(float32x2_t *)v4.i8, a1, 2), (float32x2_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL), a1, 3);
}

float32x4_t static simd_float2x4.*= infix(_:_:)(float32x4_t *a1, double a2, double a3)
{
  float32x4_t v3 = a1[1];
  float32x4_t v4 = vmlaq_lane_f32(vmulq_n_f32(*a1, *(float *)&a2), v3, *(float32x2_t *)&a2, 1);
  float32x4_t result = vmlaq_lane_f32(vmulq_n_f32(*a1, *(float *)&a3), v3, *(float32x2_t *)&a3, 1);
  *a1 = v4;
  a1[1] = result;
  return result;
}

double matrix_from_rows(_:_:_:_:)(int32x4_t a1, int32x4_t a2, int32x4_t a3, int32x4_t a4)
{
  *(void *)&double result = vzip1q_s32(vzip1q_s32(a1, a3), vzip1q_s32(a2, a4)).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vzip1q_s32(vzip1q_s32(a1, a3), vzip1q_s32(a2, a4)).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vzip1q_s32(vzip1q_s32(a1, a3), vzip1q_s32(a2, a4)).u64[0];
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float2x4 *a1, simd_float2x4 *a2)
{
  return vminvq_u32((uint32x4_t)vandq_s8((int8x16_t)vceqq_f32(v3, v5), (int8x16_t)vceqq_f32(v2, v4))) >> 31;
}

double simd_float3x4.init(diagonal:)(float a1)
{
  HIDWORD(v1) = vdupq_lane_s32(0, 0).i32[1];
  *(float *)&double v1 = a1;
  return v1;
}

void __swiftcall simd_float3x4.init(rows:)(simd_float3x4 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 4) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

unint64_t simd_float3x4.subscript.getter(unint64_t result)
{
  if (result > 2) {
    __break(1u);
  }
  return result;
}

uint64_t simd_float3x3.subscript.setter(uint64_t result, __n128 a2)
{
  switch(result)
  {
    case 0:
      goto LABEL_6;
    case 1:
      ++v2;
LABEL_6:
      *float32x4_t v2 = a2;
      return result;
    case 2:
      v2 += 2;
      goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t (*simd_float3x4.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  double result = (uint64_t (*)())malloc(0x20uLL);
  *a1 = result;
  *((void *)result + 2) = a2;
  *((void *)result + 3) = v2;
  switch(a2)
  {
    case 0:
      *(_OWORD *)double result = *v2;
      return simd_float4x3.subscript.modify;
    case 1:
      long long v6 = v2[1];
LABEL_7:
      *(_OWORD *)double result = v6;
      return simd_float3x3.subscript.modify;
    case 2:
      long long v6 = v2[2];
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

void simd_float3x3.subscript.modify(void **a1, char a2)
{
  float32x4_t v2 = *a1;
  long long v3 = *(_OWORD *)v2;
  uint64_t v4 = v2[2];
  BOOL v5 = v4 == 1;
  if (a2)
  {
    if (v4 == 1)
    {
LABEL_7:
      *(_OWORD *)(v2[3] + 16) = v3;
LABEL_8:
      free(v2);
      return;
    }
    BOOL v5 = v4 == 2;
    if (v4 == 2)
    {
LABEL_10:
      *(_OWORD *)(v2[3] + 32) = v3;
      goto LABEL_8;
    }
    __break(1u);
  }
  if (v5) {
    goto LABEL_7;
  }
  if (v4 == 2) {
    goto LABEL_10;
  }
  __break(1u);
}

unint64_t simd_float3x4.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 2)
  {
    if (a2 <= 3) {
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t key path getter for simd_float3x4.subscript(_:_:) : simd_float3x4@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 1)
  {
    result += 16;
  }
  else if (v3)
  {
    if (v3 != 2) {
      goto LABEL_9;
    }
    result += 32;
  }
  if ((unint64_t)a2[1] <= 3)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 3));
    return result;
  }
  __break(1u);
LABEL_9:
  __break(1u);
  return result;
}

int *key path setter for simd_float3x4.subscript(_:_:) : simd_float3x4(int *result, long long *a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  unint64_t v3 = a3[1];
  int v5 = *result;
  if (!*a3)
  {
    if (v3 <= 3)
    {
      long long v7 = *a2;
      *(_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3 | (4 * (v3 & 3))) = v5;
      *a2 = v7;
      return result;
    }
    goto LABEL_12;
  }
  if (v4 == 1)
  {
    long long v6 = a2[1];
  }
  else
  {
    if (v4 != 2)
    {
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
    }
    long long v6 = a2[2];
  }
  if (v3 > 3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  long long v8 = v6;
  *(_DWORD *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF3 | (4 * (v3 & 3))) = v5;
  if (v4 == 1) {
    a2[1] = v8;
  }
  else {
    a2[2] = v8;
  }
  return result;
}

uint64_t simd_float3x4.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  switch(result)
  {
    case 0:
      if (a2 <= 3)
      {
        long long v5 = *v3;
        *(float *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3 | (4 * (a2 & 3))) = a3;
        *unint64_t v3 = v5;
        return result;
      }
      goto LABEL_12;
    case 1:
      long long v4 = v3[1];
      break;
    case 2:
      long long v4 = v3[2];
      break;
    default:
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
  }
  if (a2 > 3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  long long v6 = v4;
  *(float *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (a2 & 3))) = a3;
  if (result == 1) {
    v3[1] = v6;
  }
  else {
    v3[2] = v6;
  }
  return result;
}

uint64_t (*simd_float3x4.subscript.modify(uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)double result = a2;
  switch(a2)
  {
    case 0:
      long long v4 = *v3;
      if (a3 <= 3) {
        goto LABEL_6;
      }
LABEL_9:
      __break(1u);
      break;
    case 1:
      long long v4 = v3[1];
      if (a3 > 3) {
        goto LABEL_9;
      }
LABEL_6:
      long long v5 = v4;
      *((_DWORD *)result + 6) = *(_DWORD *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3 | (4 * (a3 & 3)));
      return simd_float3x3.subscript.modify;
    case 2:
      long long v4 = v3[2];
      if (a3 <= 3) {
        goto LABEL_6;
      }
      goto LABEL_9;
  }
  __break(1u);
  return result;
}

double simd_float3x3.subscript.modify(uint64_t a1, double a2, double a3, double a4, int64x2_t a5, int64x2_t a6)
{
  int v6 = *(_DWORD *)(a1 + 24);
  long long v7 = *(int8x16_t **)(a1 + 16);
  if (*(void *)a1)
  {
    a5.i64[0] = *(void *)a1;
    a6.i64[0] = 1;
    int8x16_t v8 = vbslq_s8((int8x16_t)vdupq_lane_s64(vceqq_s64(a5, a6).i64[0], 0), v7[1], v7[2]);
    if (*(void *)a1 == 1) {
      ++v7;
    }
    else {
      v7 += 2;
    }
  }
  else
  {
    int8x16_t v8 = *v7;
  }
  float32x4_t v9 = (_DWORD *)((unint64_t)&v11 & 0xFFFFFFFFFFFFFFF3 | (4 * (*(_DWORD *)(a1 + 8) & 3)));
  int8x16_t v11 = v8;
  *float32x4_t v9 = v6;
  double result = *(double *)v11.i64;
  *long long v7 = v11;
  return result;
}

uint64_t simd_float3x4.debugDescription.getter()
{
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  v2._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 8236;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  v4._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 10589;
  v5._object = (void *)0xE200000000000000;
  String.append(_:)(v5);
  return 0x6F6C665F646D6973;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_float3x4()
{
  return simd_float3x4.debugDescription.getter();
}

uint64_t static simd_float3x4.== infix(_:_:)(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5, float32x4_t a6)
{
  return vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a2, a5), (int8x16_t)vceqq_f32(a1, a4)), (int8x16_t)vceqq_f32(a3, a6))) >> 31;
}

uint64_t simd_equal(simd_float3x4 a1, simd_float3x4 a2)
{
  return vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32((float32x4_t)a1.columns[0], (float32x4_t)a2.columns[0]), (int8x16_t)vceqq_f32((float32x4_t)a1.columns[1], (float32x4_t)a2.columns[1])), (int8x16_t)vceqq_f32((float32x4_t)a1.columns[2], (float32x4_t)a2.columns[2]))) >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float3x4(__n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_float3x3(a1, a2, a3, a4, (uint64_t (*)(__n128, __n128, __n128, __n128, __n128, __n128))simd_equal);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float3x3(__n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(__n128, __n128, __n128, __n128, __n128, __n128))
{
  return a5(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

double static simd_float3x4.+ infix(_:_:)(float32x4_t a1, double a2, double a3, float32x4_t a4)
{
  *(void *)&double result = vaddq_f32(a1, a4).u64[0];
  return result;
}

double static simd_float3x4.- prefix(_:)(float32x4_t a1)
{
  *(void *)&double result = vsubq_f32((float32x4_t)0, a1).u64[0];
  return result;
}

double static simd_float3x4.- infix(_:_:)(float32x4_t a1, double a2, double a3, float32x4_t a4)
{
  *(void *)&double result = vsubq_f32(a1, a4).u64[0];
  return result;
}

float32x4_t static simd_float3x4.+= infix(_:_:)(float32x4_t *a1, float32x4_t a2, float32x4_t a3, float32x4_t a4)
{
  float32x4_t result = vaddq_f32(*a1, a2);
  float32x4_t v5 = vaddq_f32(a1[1], a3);
  float32x4_t v6 = vaddq_f32(a1[2], a4);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

float32x4_t static simd_float3x4.-= infix(_:_:)(float32x4_t *a1, float32x4_t a2, float32x4_t a3, float32x4_t a4)
{
  float32x4_t result = vsubq_f32(*a1, a2);
  float32x4_t v5 = vsubq_f32(a1[1], a3);
  float32x4_t v6 = vsubq_f32(a1[2], a4);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

double static simd_float3x4.* infix(_:_:)(float a1, float32x4_t a2)
{
  *(void *)&double result = vmulq_n_f32(a2, a1).u64[0];
  return result;
}

double static simd_float3x4.* infix(_:_:)(float32x4_t a1, double a2, double a3, float a4)
{
  *(void *)&double result = vmulq_n_f32(a1, a4).u64[0];
  return result;
}

float32x4_t static simd_float3x4.*= infix(_:_:)(float32x4_t *a1, float a2)
{
  float32x4_t v2 = vmulq_n_f32(*a1, a2);
  float32x4_t v3 = vmulq_n_f32(a1[1], a2);
  float32x4_t result = vmulq_n_f32(a1[2], a2);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = result;
  return result;
}

double static simd_float3x4.* infix(_:_:)(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4)
{
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a1, a4.f32[0]), a2, *(float32x2_t *)a4.f32, 1), a3, a4, 2).u64[0];
  return result;
}

double static simd_float3x4.* infix(_:_:)(float32x4_t a1, int32x4_t a2, int32x4_t a3, int32x4_t a4)
{
  int32x4_t v4 = vdupq_laneq_s32(a3, 2);
  float32x4_t v5 = (float32x4_t)vzip1q_s32(vzip1q_s32(a2, a4), a3);
  float32x4_t v6 = (float32x4_t)vtrn2q_s32(a2, a3);
  v6.i32[2] = a4.i32[1];
  float32x4_t v7 = (float32x4_t)vuzp2q_s32(vuzp2q_s32(a2, a3), a2);
  v7.i32[2] = a4.i32[3];
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v5, a1.f32[0]), v6, *(float32x2_t *)a1.f32, 1), (float32x4_t)vzip1q_s32(vzip2q_s32(a2, a4), v4), a1, 2), v7, a1, 3).u64[0];
  return result;
}

double static simd_float3x4.* infix(_:_:)(float32x4_t a1, float32x4_t a2, float32x4_t a3, double a4, float a5)
{
  *(void *)&double result = vmlaq_n_f32(vmlaq_lane_f32(vmulq_n_f32(a1, *(float *)&a4), a2, *(float32x2_t *)&a4, 1), a3, a5).u64[0];
  return result;
}

double static simd_float3x4.* infix(_:_:)(float32x2_t *a1, float32x4_t a2, float32x4_t a3, float32x4_t a4)
{
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)a1->f32)), a3, *a1, 1), a4, *(float32x4_t *)a1->f32, 2).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)a1->f32)), a3, *a1, 1), a4, *(float32x4_t *)a1->f32, 2).u64[0];
  return result;
}

float32x4_t static simd_float3x4.*= infix(_:_:)(float32x4_t *a1, float32x2_t *a2)
{
  float32x4_t v2 = a1[1];
  float32x4_t v3 = a1[2];
  float32x4_t result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[2].f32)), v2, a2[2], 1), v3, *(float32x4_t *)a2[2].f32, 2);
  float32x4_t v5 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2[4].f32)), v2, a2[4], 1), v3, *(float32x4_t *)a2[4].f32, 2);
  *a1 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, COERCE_FLOAT(*(_OWORD *)a2->f32)), v2, *a2, 1), v3, *(float32x4_t *)a2->f32, 2);
  a1[1] = result;
  a1[2] = v5;
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float3x4 *a1, simd_float3x4 *a2)
{
  return vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v3, v6), (int8x16_t)vceqq_f32(v2, v5)), (int8x16_t)vceqq_f32(v4, v7))) >> 31;
}

double simd_float4x4.init(diagonal:)(float a1)
{
  HIDWORD(v1) = vdupq_lane_s32(0, 0).i32[1];
  *(float *)&double v1 = a1;
  return v1;
}

void __swiftcall simd_float4x4.init(_:)(simd_float4x4 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 4) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_float4x4.init(rows:)(simd_float4x4 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 4)
  {
    float32x4_t v2 = (const float *)((char *)rows._rawValue + 32);
    vld4q_f32(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

double simd_float4x4.transpose.getter(int32x4_t a1, int32x4_t a2, int32x4_t a3, int32x4_t a4)
{
  *(void *)&double result = vzip1q_s32(vzip1q_s32(a1, a3), vzip1q_s32(a2, a4)).u64[0];
  return result;
}

double simd_float4x4.subscript.getter(uint64_t a1, double a2, double a3, double a4, double a5)
{
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      double result = a3;
      break;
    case 2:
      double result = a4;
      break;
    case 3:
      double result = a5;
      break;
    default:
      __break(1u);
      JUMPOUT(0x2128250DCLL);
  }
  return result;
}

uint64_t simd_float4x3.subscript.setter(uint64_t result, __n128 a2)
{
  switch(result)
  {
    case 0:
      break;
    case 1:
      ++v2;
      break;
    case 2:
      v2 += 2;
      break;
    case 3:
      v2 += 3;
      break;
    default:
      __break(1u);
      JUMPOUT(0x212825144);
  }
  *float32x4_t v2 = a2;
  return result;
}

uint64_t (*simd_float4x4.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  double result = (uint64_t (*)())malloc(0x20uLL);
  *a1 = result;
  *((void *)result + 2) = a2;
  *((void *)result + 3) = v2;
  switch(a2)
  {
    case 0:
      *(_OWORD *)double result = *v2;
      return simd_float4x3.subscript.modify;
    case 1:
      long long v6 = v2[1];
      goto LABEL_9;
    case 2:
      long long v6 = v2[2];
LABEL_9:
      *(_OWORD *)double result = v6;
      return simd_float4x3.subscript.modify;
    case 3:
      long long v6 = v2[3];
      goto LABEL_9;
  }
  __break(1u);
  return result;
}

void simd_float4x3.subscript.modify(void **a1, char a2)
{
  float32x4_t v2 = *a1;
  long long v3 = *(_OWORD *)v2;
  uint64_t v4 = v2[2];
  BOOL v5 = v4 == 1;
  if (a2)
  {
    if (v4 == 1)
    {
LABEL_10:
      *(_OWORD *)(v2[3] + 16) = v3;
      goto LABEL_9;
    }
    if (v4 == 2)
    {
LABEL_8:
      *(_OWORD *)(v2[3] + 32) = v3;
LABEL_9:
      free(v2);
      return;
    }
    BOOL v5 = v4 == 3;
    if (v4 == 3)
    {
LABEL_12:
      *(_OWORD *)(v2[3] + 48) = v3;
      goto LABEL_9;
    }
    __break(1u);
  }
  if (v5) {
    goto LABEL_10;
  }
  if (v4 == 2) {
    goto LABEL_8;
  }
  if (v4 == 3) {
    goto LABEL_12;
  }
  __break(1u);
}

float simd_float4x4.subscript.getter(uint64_t a1, unint64_t a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6)
{
  switch(a1)
  {
    case 0:
      goto LABEL_5;
    case 1:
      a3 = a4;
      goto LABEL_5;
    case 2:
      a3 = a5;
      goto LABEL_5;
    case 3:
      a3 = a6;
LABEL_5:
      if (a2 > 3)
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x2128252D4);
      }
      __n128 v7 = a3;
      return *(float *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3 | (4 * (a2 & 3)));
    default:
      goto LABEL_8;
  }
}

uint64_t key path getter for simd_float4x4.subscript(_:_:) : simd_float4x4@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 2)
  {
    result += 32;
  }
  else if (v3 == 1)
  {
    result += 16;
  }
  else if (v3)
  {
    if (v3 != 3) {
      goto LABEL_11;
    }
    result += 48;
  }
  if ((unint64_t)a2[1] <= 3)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 3));
    return result;
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

int *key path setter for simd_float4x4.subscript(_:_:) : simd_float4x4(int *result, long long *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = a3[1];
  int v5 = *result;
  if (!*a3)
  {
    if (v4 <= 3)
    {
      long long v7 = *a2;
      *(_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3 | (4 * (v4 & 3))) = v5;
      *a2 = v7;
      return result;
    }
    goto LABEL_16;
  }
  switch(v3)
  {
    case 1:
      long long v6 = a2[1];
      break;
    case 2:
      long long v6 = a2[2];
      break;
    case 3:
      long long v6 = a2[3];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }
  if (v4 > 3)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  long long v8 = v6;
  *(_DWORD *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF3 | (4 * (v4 & 3))) = v5;
  if (v3 == 1)
  {
    a2[1] = v8;
  }
  else if (v3 == 2)
  {
    a2[2] = v8;
  }
  else
  {
    a2[3] = v8;
  }
  return result;
}

uint64_t simd_float4x4.subscript.setter(uint64_t result, unint64_t a2, float a3)
{
  switch(result)
  {
    case 0:
      if (a2 <= 3)
      {
        long long v5 = *v3;
        *(float *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3 | (4 * (a2 & 3))) = a3;
        *uint64_t v3 = v5;
        return result;
      }
      goto LABEL_16;
    case 1:
      long long v4 = v3[1];
      break;
    case 2:
      long long v4 = v3[2];
      break;
    case 3:
      long long v4 = v3[3];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }
  if (a2 > 3)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  long long v6 = v4;
  *(float *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (a2 & 3))) = a3;
  if (result == 1)
  {
    v3[1] = v6;
  }
  else if (result == 2)
  {
    v3[2] = v6;
  }
  else
  {
    v3[3] = v6;
  }
  return result;
}

uint64_t (*simd_float4x4.subscript.modify(uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 1) = a3;
  *((void *)result + 2) = v3;
  *(void *)double result = a2;
  if (a2)
  {
    switch(a2)
    {
      case 1:
        long long v4 = v3[1];
        break;
      case 2:
        long long v4 = v3[2];
        break;
      case 3:
        long long v4 = v3[3];
        break;
      default:
        goto LABEL_12;
    }
  }
  else
  {
    long long v4 = *v3;
  }
  if (a3 <= 3)
  {
    long long v5 = v4;
    *((_DWORD *)result + 6) = *(_DWORD *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3 | (4 * (a3 & 3)));
    return simd_float4x3.subscript.modify;
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

double simd_float4x3.subscript.modify(uint64_t *a1, char a2)
{
  int v2 = *((_DWORD *)a1 + 6);
  uint64_t v3 = a1[2];
  long long v5 = *(_OWORD *)(v3 + 48);
  long long v4 = (_OWORD *)(v3 + 48);
  long long v6 = v5;
  uint64_t v7 = a1[2];
  long long v9 = *(_OWORD *)(v7 + 32);
  long long v8 = (_OWORD *)(v7 + 32);
  long long v10 = v9;
  uint64_t v11 = a1[2];
  long long v13 = *(_OWORD *)(v11 + 16);
  float32x4_t v12 = (_OWORD *)(v11 + 16);
  long long v14 = v13;
  uint64_t v15 = *a1;
  if (a2)
  {
    switch(v15)
    {
      case 0:
        goto LABEL_4;
      case 1:
        goto LABEL_5;
      case 2:
        goto LABEL_6;
      case 3:
        goto LABEL_7;
      default:
        __break(1u);
        goto LABEL_9;
    }
  }
  switch(v15)
  {
    case 0:
LABEL_4:
      long long v14 = *(_OWORD *)a1[2];
      float32x4_t v12 = (_OWORD *)a1[2];
      break;
    case 1:
      break;
    case 2:
LABEL_6:
      long long v14 = v10;
      float32x4_t v12 = v8;
      break;
    case 3:
LABEL_7:
      long long v14 = v6;
      float32x4_t v12 = v4;
      break;
    default:
LABEL_9:
      __break(1u);
      JUMPOUT(0x21282561CLL);
  }
LABEL_5:
  Swift::String v16 = (_DWORD *)((unint64_t)&v18 & 0xFFFFFFFFFFFFFFF3 | (4 * (a1[1] & 3)));
  long long v18 = v14;
  *Swift::String v16 = v2;
  double result = *(double *)&v18;
  *float32x4_t v12 = v18;
  return result;
}

uint64_t simd_float4x4.debugDescription.getter()
{
  _StringGuts.grow(_:)(31);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  v2._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 8236;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  v4._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 8236;
  v5._object = (void *)0xE200000000000000;
  String.append(_:)(v5);
  v6._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 10589;
  v7._object = (void *)0xE200000000000000;
  String.append(_:)(v7);
  return 0x6F6C665F646D6973;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_float4x4()
{
  return simd_float4x4.debugDescription.getter();
}

uint64_t static simd_float4x4.== infix(_:_:)(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5, float32x4_t a6, float32x4_t a7, float32x4_t a8)
{
  return vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a2, a6), (int8x16_t)vceqq_f32(a1, a5)), vandq_s8((int8x16_t)vceqq_f32(a3, a7), (int8x16_t)vceqq_f32(a4, a8)))) >> 31;
}

uint64_t simd_equal(simd_float4x4 a1, simd_float4x4 a2)
{
  return vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32((float32x4_t)a1.columns[0], (float32x4_t)a2.columns[0]), (int8x16_t)vceqq_f32((float32x4_t)a1.columns[1], (float32x4_t)a2.columns[1])), vandq_s8((int8x16_t)vceqq_f32((float32x4_t)a1.columns[2], (float32x4_t)a2.columns[2]), (int8x16_t)vceqq_f32((float32x4_t)a1.columns[3], (float32x4_t)a2.columns[3])))) >> 31;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float4x4(__n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_float4x3(a1, a2, a3, a4, (uint64_t (*)(__n128, __n128, __n128, __n128, __n128, __n128, __n128, __n128))simd_equal);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_float4x3(__n128 *a1, __n128 *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(__n128, __n128, __n128, __n128, __n128, __n128, __n128, __n128))
{
  return a5(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

float simd_float4x4.determinant.getter(float32x4_t a1, int8x16_t a2, int8x16_t a3, int8x16_t a4)
{
  float32x4_t v4 = (float32x4_t)vextq_s8(a3, a3, 8uLL);
  float32x4_t v5 = (float32x4_t)vextq_s8(a4, a4, 0xCuLL);
  float32x4_t v6 = (float32x4_t)vextq_s8(a3, a3, 0xCuLL);
  float32x4_t v7 = (float32x4_t)vextq_s8(a4, a4, 8uLL);
  float32x4_t v8 = (float32x4_t)vextq_s8(a4, a4, 4uLL);
  float32x4_t v9 = (float32x4_t)vextq_s8(a3, a3, 4uLL);
  int8x16_t v10 = (int8x16_t)vmulq_f32(vmlaq_f32(vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(a2, a2, 8uLL), vmlaq_f32(vmulq_f32(v5, vnegq_f32(v9)), v8, v6)), vmlaq_f32(vmulq_f32(v7, vnegq_f32(v6)), v5, v4), (float32x4_t)vextq_s8(a2, a2, 4uLL)), vmlaq_f32(vmulq_f32(v8, vnegq_f32(v4)), v7, v9), (float32x4_t)vextq_s8(a2, a2, 0xCuLL)), a1);
  int32x2_t v11 = (int32x2_t)vextq_s8(v10, v10, 8uLL).u64[0];
  return vaddv_f32(vsub_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v10.i8, v11), (float32x2_t)vzip2_s32(*(int32x2_t *)v10.i8, v11)));
}

double static simd_float4x4.+ infix(_:_:)(float32x4_t a1, double a2, double a3, double a4, float32x4_t a5)
{
  *(void *)&double result = vaddq_f32(a1, a5).u64[0];
  return result;
}

double static simd_float4x4.- prefix(_:)(float32x4_t a1)
{
  *(void *)&double result = vsubq_f32((float32x4_t)0, a1).u64[0];
  return result;
}

double static simd_float4x4.- infix(_:_:)(float32x4_t a1, double a2, double a3, double a4, float32x4_t a5)
{
  *(void *)&double result = vsubq_f32(a1, a5).u64[0];
  return result;
}

float32x4_t static simd_float4x4.+= infix(_:_:)(float32x4_t *a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  float32x4_t result = vaddq_f32(*a1, a2);
  float32x4_t v6 = vaddq_f32(a1[1], a3);
  float32x4_t v7 = vaddq_f32(a1[2], a4);
  float32x4_t v8 = vaddq_f32(a1[3], a5);
  *a1 = result;
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  return result;
}

float32x4_t static simd_float4x4.-= infix(_:_:)(float32x4_t *a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  float32x4_t result = vsubq_f32(*a1, a2);
  float32x4_t v6 = vsubq_f32(a1[1], a3);
  float32x4_t v7 = vsubq_f32(a1[2], a4);
  float32x4_t v8 = vsubq_f32(a1[3], a5);
  *a1 = result;
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  return result;
}

double static simd_float4x4.* infix(_:_:)(float a1, float32x4_t a2)
{
  *(void *)&double result = vmulq_n_f32(a2, a1).u64[0];
  return result;
}

double static simd_float4x4.* infix(_:_:)(float32x4_t a1, double a2, double a3, double a4, float a5)
{
  *(void *)&double result = vmulq_n_f32(a1, a5).u64[0];
  return result;
}

float32x4_t static simd_float4x4.*= infix(_:_:)(float32x4_t *a1, float a2)
{
  float32x4_t v2 = vmulq_n_f32(*a1, a2);
  float32x4_t v3 = vmulq_n_f32(a1[1], a2);
  float32x4_t v4 = vmulq_n_f32(a1[2], a2);
  float32x4_t result = vmulq_n_f32(a1[3], a2);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = result;
  return result;
}

double static simd_float4x4.* infix(_:_:)(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1), a3, a5, 2), a4, a5, 3).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1), a3, a5, 2), a4, a5, 3).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1), a3, a5, 2), a4, a5, 3).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1), a3, a5, 2), a4, a5, 3).u64[0];
  return result;
}

double static simd_float4x4.* infix(_:_:)(float32x4_t a1, int32x4_t a2, int32x4_t a3, int32x4_t a4, int32x4_t a5)
{
  int32x4_t v5 = vzip1q_s32(a2, a4);
  int32x4_t v6 = vzip2q_s32(a2, a4);
  int32x4_t v7 = vzip1q_s32(a3, a5);
  int32x4_t v8 = vzip2q_s32(a3, a5);
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(v5, v7), a1.f32[0]), (float32x4_t)vzip2q_s32(v5, v7), *(float32x2_t *)a1.f32, 1), (float32x4_t)vzip1q_s32(v6, v8), a1, 2), (float32x4_t)vzip2q_s32(v6, v8), a1, 3).u64[0];
  return result;
}

float32x4_t static simd_float4x4.*= infix(_:_:)(float32x4_t *a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  float32x4_t v5 = a1[1];
  float32x4_t v6 = a1[2];
  float32x4_t v7 = a1[3];
  float32x4_t v8 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a2.f32[0]), v5, *(float32x2_t *)a2.f32, 1), v6, a2, 2), v7, a2, 3);
  float32x4_t result = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a3.f32[0]), v5, *(float32x2_t *)a3.f32, 1), v6, a3, 2), v7, a3, 3);
  float32x4_t v10 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a4.f32[0]), v5, *(float32x2_t *)a4.f32, 1), v6, a4, 2), v7, a4, 3);
  float32x4_t v11 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*a1, a5.f32[0]), v5, *(float32x2_t *)a5.f32, 1), v6, a5, 2);
  *a1 = v8;
  a1[1] = result;
  a1[2] = v10;
  a1[3] = vmlaq_laneq_f32(v11, v7, a5, 3);
  return result;
}

double matrix_from_diagonal(_:)(float a1)
{
  HIDWORD(v1) = vdupq_lane_s32(0, 0).i32[1];
  *(float *)&double v1 = a1;
  return v1;
}

Swift::Float __swiftcall matrix_determinant(_:)(simd_float4x4 *a1)
{
  float32x4_t v5 = (float32x4_t)vextq_s8(v3, v3, 8uLL);
  float32x4_t v6 = (float32x4_t)vextq_s8(v4, v4, 0xCuLL);
  float32x4_t v7 = (float32x4_t)vextq_s8(v3, v3, 0xCuLL);
  float32x4_t v8 = (float32x4_t)vextq_s8(v4, v4, 8uLL);
  float32x4_t v9 = (float32x4_t)vextq_s8(v4, v4, 4uLL);
  float32x4_t v10 = (float32x4_t)vextq_s8(v3, v3, 4uLL);
  int8x16_t v11 = (int8x16_t)vmulq_f32(vmlaq_f32(vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v2, v2, 8uLL), vmlaq_f32(vmulq_f32(v6, vnegq_f32(v10)), v9, v7)), vmlaq_f32(vmulq_f32(v8, vnegq_f32(v7)), v6, v5), (float32x4_t)vextq_s8(v2, v2, 4uLL)), vmlaq_f32(vmulq_f32(v9, vnegq_f32(v5)), v8, v10), (float32x4_t)vextq_s8(v2, v2, 0xCuLL)), v1);
  int32x2_t v12 = (int32x2_t)vextq_s8(v11, v11, 8uLL).u64[0];
  return vaddv_f32(vsub_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v11.i8, v12), (float32x2_t)vzip2_s32(*(int32x2_t *)v11.i8, v12)));
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_float4x4 *a1, simd_float4x4 *a2)
{
  return vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v3, v7), (int8x16_t)vceqq_f32(v2, v6)), vandq_s8((int8x16_t)vceqq_f32(v4, v8), (int8x16_t)vceqq_f32(v5, v9)))) >> 31;
}

void __swiftcall simd_double2x2.init(_:)(simd_double2x2 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 2) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_double2x2.init(rows:)(simd_double2x2 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 2)
  {
    float32x4_t v2 = (const double *)((char *)rows._rawValue + 32);
    vld2q_f64(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

double simd_double2x2.transpose.getter(int64x2_t a1, int64x2_t a2)
{
  *(void *)&double result = vzip1q_s64(a1, a2).u64[0];
  return result;
}

unint64_t simd_double2x2.subscript.getter(unint64_t result)
{
  if (result > 1) {
    __break(1u);
  }
  return result;
}

uint64_t simd_double2x2.subscript.setter(uint64_t result, __n128 a2)
{
  if (!result) {
    goto LABEL_4;
  }
  if (result == 1)
  {
    ++v2;
LABEL_4:
    *float32x4_t v2 = a2;
    return result;
  }
  __break(1u);
  return result;
}

void (*simd_double2x2.subscript.modify(void (**a1)(void **a1), uint64_t a2))(void **a1)
{
  double result = (void (*)(void **))malloc(0x18uLL);
  *a1 = result;
  *((void *)result + 2) = v2;
  if (!a2)
  {
    *(_OWORD *)double result = *v2;
    return simd_float2x3.subscript.modify;
  }
  if (a2 == 1)
  {
    *(_OWORD *)double result = v2[1];
    return simd_float2x3.subscript.modify;
  }
  __break(1u);
  return result;
}

unint64_t simd_double2x2.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 1)
  {
    if (a2 <= 1) {
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double2x2.subscript(_:_:) : simd_double2x2(uint64_t *result, uint64_t a2, void *a3)
{
  unint64_t v3 = a3[1];
  uint64_t v4 = *result;
  if (!*a3)
  {
    if (v3 <= 1)
    {
      *(void *)(a2 + 8 * v3) = v4;
      return result;
    }
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*a3 == 1)
  {
    if (v3 <= 1)
    {
      *(void *)(a2 + 16 + 8 * v3) = v4;
      return result;
    }
    goto LABEL_7;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t simd_double2x2.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  if (!result)
  {
    if (a2 > 1) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (result == 1)
  {
    if (a2 > 1)
    {
LABEL_8:
      __break(1u);
      goto LABEL_9;
    }
    v3 += 16;
LABEL_7:
    *(double *)(v3 + 8 * a2) = a3;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

double (*simd_double2x2.subscript.modify(double (*result)(uint64_t a1), uint64_t a2, unint64_t a3))(uint64_t a1)
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_7;
    }
    v3 += 16;
  }
  if (a3 <= 1)
  {
    *(void *)double result = *(void *)(v3 + 8 * (a3 & 1));
    return simd_double2x2.subscript.modify;
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

double simd_double2x2.subscript.modify(uint64_t a1)
{
  double result = *(double *)a1;
  *(void *)(*(void *)(a1 + 24) + 16 * (*(void *)(a1 + 8) != 0) + 8 * *(unsigned int *)(a1 + 16)) = *(void *)a1;
  return result;
}

unint64_t simd_double2x2.debugDescription.getter()
{
  _StringGuts.grow(_:)(24);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = 91;
  v0._object = (void *)0xE100000000000000;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 93;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 8236;
  v4._object = (void *)0xE200000000000000;
  String.append(_:)(v4);
  v5._countAndFlagsBits = 91;
  v5._object = (void *)0xE100000000000000;
  String.append(_:)(v5);
  _print_unlocked<A, B>(_:_:)();
  v6._countAndFlagsBits = 8236;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  _print_unlocked<A, B>(_:_:)();
  v7._countAndFlagsBits = 93;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 10589;
  v9._object = (void *)0xE200000000000000;
  String.append(_:)(v9);
  return 0xD000000000000010;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_double2x2()
{
  return simd_double2x2.debugDescription.getter();
}

unint64_t static simd_double2x2.== infix(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  int64x2_t v4 = (int64x2_t)vandq_s8((int8x16_t)vceqq_f64(a2, a4), (int8x16_t)vceqq_f64(a1, a3));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v4, 1), (int8x16_t)v4).u64[0] >> 63;
}

unint64_t simd_equal(simd_double2x2 a1, simd_double2x2 a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8((int8x16_t)vceqq_f64((float64x2_t)a1.columns[0], (float64x2_t)a2.columns[0]), (int8x16_t)vceqq_f64((float64x2_t)a1.columns[1], (float64x2_t)a2.columns[1]));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), (int8x16_t)v2).u64[0] >> 63;
}

unint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double2x2(simd_double2x2 *a1, simd_double2x2 *a2)
{
  return simd_equal(*a1, *a2);
}

double simd_double2x2.determinant.getter(__n128 a1, __n128 a2)
{
  return vmlad_n_f64(-a1.n128_f64[1] * a2.n128_f64[0], a2.n128_f64[1], a1.n128_f64[0]);
}

double static simd_double2x2.+ infix(_:_:)(float64x2_t a1, double a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(a1, a3);
  return result;
}

double static simd_double2x2.- prefix(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64((float64x2_t)0, a1);
  return result;
}

double static simd_double2x2.- infix(_:_:)(float64x2_t a1, double a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(a1, a3);
  return result;
}

float64x2_t static simd_double2x2.+= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t result = vaddq_f64(*a1, a2);
  float64x2_t v4 = vaddq_f64(a1[1], a3);
  *a1 = result;
  a1[1] = v4;
  return result;
}

float64x2_t static simd_double2x2.-= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t result = vsubq_f64(*a1, a2);
  float64x2_t v4 = vsubq_f64(a1[1], a3);
  *a1 = result;
  a1[1] = v4;
  return result;
}

double static simd_double2x2.* infix(_:_:)(double a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a2, a1);
  return result;
}

double static simd_double2x2.* infix(_:_:)(float64x2_t a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, a3);
  return result;
}

float64x2_t static simd_double2x2.*= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64x2_t v2 = vmulq_n_f64(*a1, a2);
  float64x2_t result = vmulq_n_f64(a1[1], a2);
  *a1 = v2;
  a1[1] = result;
  return result;
}

double static simd_double2x2.* infix(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64(a1, a3.f64[0]), a2, a3, 1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64(a1, a3.f64[0]), a2, a3, 1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64(a1, a3.f64[0]), a2, a3, 1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64(a1, a3.f64[0]), a2, a3, 1);
  return result;
}

double static simd_double2x2.* infix(_:_:)(float64x2_t a1, int64x2_t a2, int64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)vzip1q_s64(a2, a3), a1.f64[0]), (float64x2_t)vzip2q_s64(a2, a3), a1, 1);
  return result;
}

float64x2_t static simd_double2x2.*= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v3 = a1[1];
  float64x2_t v4 = vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), v3, a2, 1);
  float64x2_t result = vmlaq_laneq_f64(vmulq_n_f64(*a1, a3.f64[0]), v3, a3, 1);
  *a1 = v4;
  a1[1] = result;
  return result;
}

Swift::Double __swiftcall matrix_determinant(_:)(simd_double2x2 *a1)
{
  return vmlad_n_f64(-*((double *)&v1 + 1) * *(double *)&v2, *((double *)&v2 + 1), *(double *)&v1);
}

double matrix_from_rows(_:_:)(int64x2_t a1, int64x2_t a2)
{
  *(void *)&double result = vzip1q_s64(a1, a2).u64[0];
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double2x2 *a1, simd_double2x2 *a2)
{
  int64x2_t v6 = (int64x2_t)vandq_s8((int8x16_t)vceqq_f64(v3, v5), (int8x16_t)vceqq_f64(v2, v4));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v6, 1), (int8x16_t)v6).u64[0] >> 63;
}

void __swiftcall simd_double3x2.init(_:)(simd_double3x2 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 3) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_double3x2.init(rows:)(simd_double3x2 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 2) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_double2x3.init(_:)(simd_double2x3 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 2) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

double simd_double2x3.transpose.getter(int64x2_t a1, double a2, int64x2_t a3)
{
  *(void *)&double result = vzip1q_s64(a1, a3).u64[0];
  return result;
}

unint64_t simd_double3x2.subscript.getter(unint64_t result)
{
  if (result > 2) {
    __break(1u);
  }
  return result;
}

uint64_t simd_double3x2.subscript.setter(uint64_t result, __n128 a2)
{
  switch(result)
  {
    case 0:
      goto LABEL_6;
    case 1:
      ++v2;
LABEL_6:
      *float64x2_t v2 = a2;
      return result;
    case 2:
      v2 += 2;
      goto LABEL_6;
  }
  __break(1u);
  return result;
}

void (*simd_double3x2.subscript.modify(void (**a1)(void **a1), uint64_t a2))(void **a1)
{
  double result = (void (*)(void **))malloc(0x20uLL);
  *a1 = result;
  *((void *)result + 2) = a2;
  *((void *)result + 3) = v2;
  switch(a2)
  {
    case 0:
      *(_OWORD *)double result = *v2;
      return simd_float3x3.subscript.modify;
    case 1:
      long long v6 = v2[1];
LABEL_7:
      *(_OWORD *)double result = v6;
      return (void (*)(void **))simd_float3x3.subscript.modify;
    case 2:
      long long v6 = v2[2];
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t simd_double3x2.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 2)
  {
    if (a2 <= 1) {
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t key path getter for simd_double3x2.subscript(_:_:) : simd_double3x2@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 1)
  {
    result += 16;
  }
  else if (v3)
  {
    if (v3 != 2) {
      goto LABEL_9;
    }
    result += 32;
  }
  if ((unint64_t)a2[1] <= 1)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 1));
    return result;
  }
  __break(1u);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double3x2.subscript(_:_:) : simd_double3x2(uint64_t *result, long long *a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  unint64_t v3 = a3[1];
  uint64_t v5 = *result;
  if (!*a3)
  {
    if (v3 <= 1)
    {
      long long v7 = *a2;
      *(void *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF7 | (8 * (v3 & 1))) = v5;
      *a2 = v7;
      return result;
    }
    goto LABEL_12;
  }
  if (v4 == 1)
  {
    long long v6 = a2[1];
  }
  else
  {
    if (v4 != 2)
    {
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
    }
    long long v6 = a2[2];
  }
  if (v3 > 1)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  long long v8 = v6;
  *(void *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF7 | (8 * (v3 & 1))) = v5;
  if (v4 == 1) {
    a2[1] = v8;
  }
  else {
    a2[2] = v8;
  }
  return result;
}

uint64_t simd_double3x2.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  switch(result)
  {
    case 0:
      if (a2 <= 1)
      {
        long long v5 = *v3;
        *(double *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF7 | (8 * (a2 & 1))) = a3;
        *unint64_t v3 = v5;
        return result;
      }
      goto LABEL_12;
    case 1:
      long long v4 = v3[1];
      break;
    case 2:
      long long v4 = v3[2];
      break;
    default:
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
  }
  if (a2 > 1)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  long long v6 = v4;
  *(double *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF7 | (8 * (a2 & 1))) = a3;
  if (result == 1) {
    v3[1] = v6;
  }
  else {
    v3[2] = v6;
  }
  return result;
}

double (*simd_double3x2.subscript.modify(double (*result)(uint64_t *a1, double a2, double a3, double a4, int64x2_t a5, int64x2_t a6), uint64_t a2, unint64_t a3))(uint64_t *a1, double a2, double a3, double a4, int64x2_t a5, int64x2_t a6)
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  switch(a2)
  {
    case 0:
      long long v4 = *v3;
      if (a3 <= 1) {
        goto LABEL_6;
      }
LABEL_9:
      __break(1u);
      break;
    case 1:
      long long v4 = v3[1];
      if (a3 > 1) {
        goto LABEL_9;
      }
LABEL_6:
      long long v5 = v4;
      *(void *)double result = *(void *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF7 | (8 * (a3 & 1)));
      return simd_double3x2.subscript.modify;
    case 2:
      long long v4 = v3[2];
      if (a3 <= 1) {
        goto LABEL_6;
      }
      goto LABEL_9;
  }
  __break(1u);
  return result;
}

double simd_double3x2.subscript.modify(uint64_t *a1, double a2, double a3, double a4, int64x2_t a5, int64x2_t a6)
{
  long long v6 = (int8x16_t *)a1[3];
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  if (v8)
  {
    a5.i64[0] = a1[1];
    a6.i64[0] = 1;
    int8x16_t v9 = vbslq_s8((int8x16_t)vdupq_lane_s64(vceqq_s64(a5, a6).i64[0], 0), v6[1], v6[2]);
    if (v8 == 1) {
      ++v6;
    }
    else {
      v6 += 2;
    }
  }
  else
  {
    int8x16_t v9 = *v6;
  }
  float32x4_t v10 = (void *)((unint64_t)&v12 & 0xFFFFFFFFFFFFFFF7 | (8 * (a1[2] & 1)));
  int8x16_t v12 = v9;
  *float32x4_t v10 = v7;
  double result = *(double *)v12.i64;
  *long long v6 = v12;
  return result;
}

unint64_t simd_double3x2.debugDescription.getter()
{
  _StringGuts.grow(_:)(28);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = 91;
  v0._object = (void *)0xE100000000000000;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 93;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 8236;
  v4._object = (void *)0xE200000000000000;
  String.append(_:)(v4);
  v5._countAndFlagsBits = 91;
  v5._object = (void *)0xE100000000000000;
  String.append(_:)(v5);
  _print_unlocked<A, B>(_:_:)();
  v6._countAndFlagsBits = 8236;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  _print_unlocked<A, B>(_:_:)();
  v7._countAndFlagsBits = 93;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 8236;
  v9._object = (void *)0xE200000000000000;
  String.append(_:)(v9);
  v10._countAndFlagsBits = 91;
  v10._object = (void *)0xE100000000000000;
  String.append(_:)(v10);
  _print_unlocked<A, B>(_:_:)();
  v11._countAndFlagsBits = 8236;
  v11._object = (void *)0xE200000000000000;
  String.append(_:)(v11);
  _print_unlocked<A, B>(_:_:)();
  v12._countAndFlagsBits = 93;
  v12._object = (void *)0xE100000000000000;
  String.append(_:)(v12);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 10589;
  v14._object = (void *)0xE200000000000000;
  String.append(_:)(v14);
  return 0xD000000000000010;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_double3x2()
{
  return simd_double3x2.debugDescription.getter();
}

unint64_t static simd_double3x2.== infix(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, float64x2_t a6)
{
  int64x2_t v6 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a2, a5), (int8x16_t)vceqq_f64(a1, a4)), (int8x16_t)vceqq_f64(a3, a6));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v6, 1), (int8x16_t)v6).u64[0] >> 63;
}

unint64_t simd_equal(simd_double3x2 a1, simd_double3x2 a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64((float64x2_t)a1.columns[0], (float64x2_t)a2.columns[0]), (int8x16_t)vceqq_f64((float64x2_t)a1.columns[1], (float64x2_t)a2.columns[1])), (int8x16_t)vceqq_f64((float64x2_t)a1.columns[2], (float64x2_t)a2.columns[2]));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), (int8x16_t)v2).u64[0] >> 63;
}

unint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double3x2(simd_double3x2 *a1, simd_double3x2 *a2)
{
  return simd_equal(*a1, *a2);
}

double simd_double3x2.transpose.getter(int64x2_t a1, int64x2_t a2)
{
  *(void *)&double result = vzip1q_s64(a1, a2).u64[0];
  return result;
}

double static simd_double3x2.+ infix(_:_:)(float64x2_t a1, double a2, double a3, float64x2_t a4)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(a1, a4);
  return result;
}

double static simd_double3x2.- prefix(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64((float64x2_t)0, a1);
  return result;
}

double static simd_double3x2.- infix(_:_:)(float64x2_t a1, double a2, double a3, float64x2_t a4)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(a1, a4);
  return result;
}

float64x2_t static simd_double3x2.+= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t result = vaddq_f64(*a1, a2);
  float64x2_t v5 = vaddq_f64(a1[1], a3);
  float64x2_t v6 = vaddq_f64(a1[2], a4);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

float64x2_t static simd_double3x2.-= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t result = vsubq_f64(*a1, a2);
  float64x2_t v5 = vsubq_f64(a1[1], a3);
  float64x2_t v6 = vsubq_f64(a1[2], a4);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

double static simd_double3x2.* infix(_:_:)(double a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a2, a1);
  return result;
}

double static simd_double3x2.* infix(_:_:)(float64x2_t a1, double a2, double a3, double a4)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, a4);
  return result;
}

float64x2_t static simd_double3x2.*= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64x2_t v2 = vmulq_n_f64(*a1, a2);
  float64x2_t v3 = vmulq_n_f64(a1[1], a2);
  float64x2_t result = vmulq_n_f64(a1[2], a2);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = result;
  return result;
}

double static simd_double3x2.* infix(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, double a5)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(a1, a4.f64[0]), a2, a4, 1), a3, a5);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(a1, a4.f64[0]), a2, a4, 1), a3, a5);
  return result;
}

double static simd_double3x2.* infix(_:_:)(float64x2_t a1, int64x2_t a2, int64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)vzip1q_s64(a2, a3), a1.f64[0]), (float64x2_t)vzip2q_s64(a2, a3), a1, 1);
  return result;
}

double static simd_double3x2.* infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(a2, a1->f64[0]), a3, *a1, 1), a4, a1[1].f64[0]);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(a2, a1->f64[0]), a3, *a1, 1), a4, a1[1].f64[0]);
  return result;
}

float64x2_t static simd_double3x2.*= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = a1[1];
  float64x2_t v3 = a1[2];
  float64x2_t result = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2[2].f64[0]), v2, a2[2], 1), v3, a2[3].f64[0]);
  float64x2_t v5 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2[4].f64[0]), v2, a2[4], 1), v3, a2[5].f64[0]);
  *a1 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v2, *a2, 1), v3, a2[1].f64[0]);
  a1[1] = result;
  a1[2] = v5;
  return result;
}

double matrix_from_rows(_:_:)(int64x2_t a1, double a2, int64x2_t a3)
{
  *(void *)&double result = vzip1q_s64(a1, a3).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vzip1q_s64(a1, a3).u64[0];
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double3x2 *a1, simd_double3x2 *a2)
{
  int64x2_t v8 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v3, v6), (int8x16_t)vceqq_f64(v2, v5)), (int8x16_t)vceqq_f64(v4, v7));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v8, 1), (int8x16_t)v8).u64[0] >> 63;
}

void __swiftcall simd_double4x2.init(_:)(simd_double4x2 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 4) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

void __swiftcall simd_double4x2.init(rows:)(simd_double4x2 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 2)
  {
    float64x2_t v2 = (const double *)((char *)rows._rawValue + 32);
    vld4q_f64(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

void __swiftcall simd_double2x4.init(_:)(simd_double2x4 *__return_ptr retstr, Swift::OpaquePointer a2)
{
  if (*((void *)a2._rawValue + 2) == 2) {
    swift_bridgeObjectRelease();
  }
  else {
    __break(1u);
  }
}

double simd_double2x4.transpose.getter(int64x2_t a1, double a2, int64x2_t a3)
{
  *(void *)&double result = vzip1q_s64(a1, a3).u64[0];
  return result;
}

double simd_double4x2.subscript.getter(uint64_t a1, double a2, double a3, double a4, double a5)
{
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      double result = a3;
      break;
    case 2:
      double result = a4;
      break;
    case 3:
      double result = a5;
      break;
    default:
      __break(1u);
      JUMPOUT(0x212826E20);
  }
  return result;
}

uint64_t simd_double4x2.subscript.setter(uint64_t result, __n128 a2)
{
  switch(result)
  {
    case 0:
      break;
    case 1:
      ++v2;
      break;
    case 2:
      v2 += 2;
      break;
    case 3:
      v2 += 3;
      break;
    default:
      __break(1u);
      JUMPOUT(0x212826E84);
  }
  *float64x2_t v2 = a2;
  return result;
}

uint64_t (*simd_double4x2.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  double result = (uint64_t (*)())malloc(0x20uLL);
  *a1 = result;
  *((void *)result + 2) = a2;
  *((void *)result + 3) = v2;
  switch(a2)
  {
    case 0:
      *(_OWORD *)double result = *v2;
      return simd_float4x3.subscript.modify;
    case 1:
      long long v6 = v2[1];
      goto LABEL_9;
    case 2:
      long long v6 = v2[2];
LABEL_9:
      *(_OWORD *)double result = v6;
      return (uint64_t (*)())simd_float4x3.subscript.modify;
    case 3:
      long long v6 = v2[3];
      goto LABEL_9;
  }
  __break(1u);
  return result;
}

double simd_double4x2.subscript.getter(uint64_t a1, unint64_t a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6)
{
  switch(a1)
  {
    case 0:
      goto LABEL_5;
    case 1:
      a3 = a4;
      goto LABEL_5;
    case 2:
      a3 = a5;
      goto LABEL_5;
    case 3:
      a3 = a6;
LABEL_5:
      if (a2 > 1)
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x212826FACLL);
      }
      __n128 v7 = a3;
      return *(double *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF7 | (8 * (a2 & 1)));
    default:
      goto LABEL_8;
  }
}

uint64_t key path getter for simd_double4x2.subscript(_:_:) : simd_double4x2@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 2)
  {
    result += 32;
  }
  else if (v3 == 1)
  {
    result += 16;
  }
  else if (v3)
  {
    if (v3 != 3) {
      goto LABEL_11;
    }
    result += 48;
  }
  if ((unint64_t)a2[1] <= 1)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 1));
    return result;
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double4x2.subscript(_:_:) : simd_double4x2(uint64_t *result, long long *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = a3[1];
  uint64_t v5 = *result;
  if (!*a3)
  {
    if (v4 <= 1)
    {
      long long v7 = *a2;
      *(void *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF7 | (8 * (v4 & 1))) = v5;
      *a2 = v7;
      return result;
    }
    goto LABEL_16;
  }
  switch(v3)
  {
    case 1:
      long long v6 = a2[1];
      break;
    case 2:
      long long v6 = a2[2];
      break;
    case 3:
      long long v6 = a2[3];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }
  if (v4 > 1)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  long long v8 = v6;
  *(void *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF7 | (8 * (v4 & 1))) = v5;
  if (v3 == 1)
  {
    a2[1] = v8;
  }
  else if (v3 == 2)
  {
    a2[2] = v8;
  }
  else
  {
    a2[3] = v8;
  }
  return result;
}

uint64_t simd_double4x2.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  switch(result)
  {
    case 0:
      if (a2 <= 1)
      {
        long long v5 = *v3;
        *(double *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF7 | (8 * (a2 & 1))) = a3;
        *uint64_t v3 = v5;
        return result;
      }
      goto LABEL_16;
    case 1:
      long long v4 = v3[1];
      break;
    case 2:
      long long v4 = v3[2];
      break;
    case 3:
      long long v4 = v3[3];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }
  if (a2 > 1)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  long long v6 = v4;
  *(double *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF7 | (8 * (a2 & 1))) = a3;
  if (result == 1)
  {
    v3[1] = v6;
  }
  else if (result == 2)
  {
    v3[2] = v6;
  }
  else
  {
    v3[3] = v6;
  }
  return result;
}

double (*simd_double4x2.subscript.modify(double (*result)(uint64_t *a1, char a2), uint64_t a2, unint64_t a3))(uint64_t *a1, char a2)
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  if (a2)
  {
    switch(a2)
    {
      case 1:
        long long v4 = v3[1];
        break;
      case 2:
        long long v4 = v3[2];
        break;
      case 3:
        long long v4 = v3[3];
        break;
      default:
        goto LABEL_12;
    }
  }
  else
  {
    long long v4 = *v3;
  }
  if (a3 <= 1)
  {
    long long v5 = v4;
    *(void *)double result = *(void *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF7 | (8 * (a3 & 1)));
    return simd_double4x2.subscript.modify;
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

double simd_double4x2.subscript.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[3];
  long long v4 = *(_OWORD *)(v2 + 48);
  uint64_t v3 = (_OWORD *)(v2 + 48);
  long long v5 = v4;
  uint64_t v6 = a1[3];
  long long v8 = *(_OWORD *)(v6 + 32);
  long long v7 = (_OWORD *)(v6 + 32);
  long long v9 = v8;
  uint64_t v10 = a1[3];
  long long v12 = *(_OWORD *)(v10 + 16);
  Swift::String v11 = (_OWORD *)(v10 + 16);
  long long v13 = v12;
  uint64_t v14 = *a1;
  uint64_t v15 = a1[1];
  if (a2)
  {
    switch(v15)
    {
      case 0:
        goto LABEL_4;
      case 1:
        goto LABEL_5;
      case 2:
        goto LABEL_6;
      case 3:
        goto LABEL_7;
      default:
        __break(1u);
        goto LABEL_9;
    }
  }
  switch(v15)
  {
    case 0:
LABEL_4:
      long long v13 = *(_OWORD *)a1[3];
      Swift::String v11 = (_OWORD *)a1[3];
      break;
    case 1:
      break;
    case 2:
LABEL_6:
      long long v13 = v9;
      Swift::String v11 = v7;
      break;
    case 3:
LABEL_7:
      long long v13 = v5;
      Swift::String v11 = v3;
      break;
    default:
LABEL_9:
      __break(1u);
      JUMPOUT(0x2128272F4);
  }
LABEL_5:
  Swift::String v16 = (void *)((unint64_t)&v18 & 0xFFFFFFFFFFFFFFF7 | (8 * (a1[2] & 1)));
  long long v18 = v13;
  *Swift::String v16 = v14;
  double result = *(double *)&v18;
  *Swift::String v11 = v18;
  return result;
}

unint64_t simd_double4x2.debugDescription.getter()
{
  _StringGuts.grow(_:)(32);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = 91;
  v0._object = (void *)0xE100000000000000;
  String.append(_:)(v0);
  _print_unlocked<A, B>(_:_:)();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  v2._countAndFlagsBits = 93;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 8236;
  v4._object = (void *)0xE200000000000000;
  String.append(_:)(v4);
  v5._countAndFlagsBits = 91;
  v5._object = (void *)0xE100000000000000;
  String.append(_:)(v5);
  _print_unlocked<A, B>(_:_:)();
  v6._countAndFlagsBits = 8236;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  _print_unlocked<A, B>(_:_:)();
  v7._countAndFlagsBits = 93;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 8236;
  v9._object = (void *)0xE200000000000000;
  String.append(_:)(v9);
  v10._countAndFlagsBits = 91;
  v10._object = (void *)0xE100000000000000;
  String.append(_:)(v10);
  _print_unlocked<A, B>(_:_:)();
  v11._countAndFlagsBits = 8236;
  v11._object = (void *)0xE200000000000000;
  String.append(_:)(v11);
  _print_unlocked<A, B>(_:_:)();
  v12._countAndFlagsBits = 93;
  v12._object = (void *)0xE100000000000000;
  String.append(_:)(v12);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 8236;
  v14._object = (void *)0xE200000000000000;
  String.append(_:)(v14);
  v15._countAndFlagsBits = 91;
  v15._object = (void *)0xE100000000000000;
  String.append(_:)(v15);
  _print_unlocked<A, B>(_:_:)();
  v16._countAndFlagsBits = 8236;
  v16._object = (void *)0xE200000000000000;
  String.append(_:)(v16);
  _print_unlocked<A, B>(_:_:)();
  v17._countAndFlagsBits = 93;
  v17._object = (void *)0xE100000000000000;
  String.append(_:)(v17);
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  v19._countAndFlagsBits = 10589;
  v19._object = (void *)0xE200000000000000;
  String.append(_:)(v19);
  return 0xD000000000000010;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_double4x2()
{
  return simd_double4x2.debugDescription.getter();
}

unint64_t static simd_double4x2.== infix(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, float64x2_t a6, float64x2_t a7, float64x2_t a8)
{
  int64x2_t v8 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a2, a6), (int8x16_t)vceqq_f64(a1, a5)), vandq_s8((int8x16_t)vceqq_f64(a3, a7), (int8x16_t)vceqq_f64(a4, a8)));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v8, 1), (int8x16_t)v8).u64[0] >> 63;
}

unint64_t simd_equal(simd_double4x2 a1, simd_double4x2 a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64((float64x2_t)a1.columns[0], (float64x2_t)a2.columns[0]), (int8x16_t)vceqq_f64((float64x2_t)a1.columns[1], (float64x2_t)a2.columns[1])), vandq_s8((int8x16_t)vceqq_f64((float64x2_t)a1.columns[2], (float64x2_t)a2.columns[2]), (int8x16_t)vceqq_f64((float64x2_t)a1.columns[3], (float64x2_t)a2.columns[3])));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), (int8x16_t)v2).u64[0] >> 63;
}

unint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double4x2(simd_double4x2 *a1, simd_double4x2 *a2)
{
  return simd_equal(*a1, *a2);
}

double simd_double4x2.transpose.getter(int64x2_t a1, int64x2_t a2)
{
  *(void *)&double result = vzip1q_s64(a1, a2).u64[0];
  return result;
}

double static simd_double4x2.+ infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(a1, a5);
  return result;
}

double static simd_double4x2.- prefix(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64((float64x2_t)0, a1);
  return result;
}

double static simd_double4x2.- infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(a1, a5);
  return result;
}

float64x2_t static simd_double4x2.+= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  float64x2_t result = vaddq_f64(*a1, a2);
  float64x2_t v6 = vaddq_f64(a1[1], a3);
  float64x2_t v7 = vaddq_f64(a1[2], a4);
  float64x2_t v8 = vaddq_f64(a1[3], a5);
  *a1 = result;
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  return result;
}

float64x2_t static simd_double4x2.-= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  float64x2_t result = vsubq_f64(*a1, a2);
  float64x2_t v6 = vsubq_f64(a1[1], a3);
  float64x2_t v7 = vsubq_f64(a1[2], a4);
  float64x2_t v8 = vsubq_f64(a1[3], a5);
  *a1 = result;
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  return result;
}

double static simd_double4x2.* infix(_:_:)(double a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a2, a1);
  return result;
}

double static simd_double4x2.* infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, a5);
  return result;
}

float64x2_t static simd_double4x2.*= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64x2_t v2 = vmulq_n_f64(*a1, a2);
  float64x2_t v3 = vmulq_n_f64(a1[1], a2);
  float64x2_t v4 = vmulq_n_f64(a1[2], a2);
  float64x2_t result = vmulq_n_f64(a1[3], a2);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = result;
  return result;
}

double static simd_double4x2.* infix(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, float64x2_t a6)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(a1, a5.f64[0]), a2, a5, 1), a3, a6.f64[0]), a4, a6, 1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(a1, a5.f64[0]), a2, a5, 1), a3, a6.f64[0]), a4, a6, 1);
  return result;
}

double static simd_double4x2.* infix(_:_:)(float64x2_t a1, int64x2_t a2, int64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)vzip1q_s64(a2, a3), a1.f64[0]), (float64x2_t)vzip2q_s64(a2, a3), a1, 1);
  return result;
}

double static simd_double4x2.* infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(a2, a1->f64[0]), a3, *a1, 1), a4, a1[1].f64[0]), a5, a1[1], 1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(a2, a1->f64[0]), a3, *a1, 1), a4, a1[1].f64[0]), a5, a1[1], 1);
  return result;
}

float64x2_t static simd_double4x2.*= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = a2[7];
  float64x2_t v3 = a1[1];
  float64x2_t v4 = a1[2];
  float64x2_t v5 = a1[3];
  float64x2_t result = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2[2].f64[0]), v3, a2[2], 1), v4, a2[3].f64[0]), v5, a2[3], 1);
  float64x2_t v7 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2[4].f64[0]), v3, a2[4], 1), v4, a2[5].f64[0]), v5, a2[5], 1);
  float64x2_t v8 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2[6].f64[0]), v3, a2[6], 1), v4, v2.f64[0]);
  *a1 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v3, *a2, 1), v4, a2[1].f64[0]), v5, a2[1], 1);
  a1[1] = result;
  a1[2] = v7;
  a1[3] = vmlaq_laneq_f64(v8, v5, v2, 1);
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double4x2 *a1, simd_double4x2 *a2)
{
  int64x2_t v10 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v3, v7), (int8x16_t)vceqq_f64(v2, v6)), vandq_s8((int8x16_t)vceqq_f64(v4, v8), (int8x16_t)vceqq_f64(v5, v9)));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v10, 1), (int8x16_t)v10).u64[0] >> 63;
}

void __swiftcall simd_double2x3.init(rows:)(simd_double2x3 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 3)
  {
    float64x2_t v2 = (const double *)((char *)rows._rawValue + 32);
    vld2q_f64(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

unint64_t simd_double2x3.subscript.getter(unint64_t result)
{
  if (result > 1) {
    __break(1u);
  }
  return result;
}

void (*simd_double2x3.subscript.modify(void (**a1)(void **a1), uint64_t a2))(void **a1)
{
  float64x2_t result = (void (*)(void **))malloc(0x28uLL);
  *a1 = result;
  *((void *)result + 4) = v2;
  if (!a2)
  {
    long long v6 = v2[1];
    *(_OWORD *)float64x2_t result = *v2;
    *((_OWORD *)result + 1) = v6;
    return simd_double2x3.subscript.modify;
  }
  if (a2 == 1)
  {
    long long v8 = v2[3];
    *(_OWORD *)float64x2_t result = v2[2];
    *((_OWORD *)result + 1) = v8;
    return simd_double2x3.subscript.modify;
  }
  __break(1u);
  return result;
}

void simd_double2x3.subscript.modify(void **a1)
{
  Swift::String v1 = *a1;
  float64x2_t v2 = (_OWORD *)v1[4];
  long long v3 = *((_OWORD *)v1 + 1);
  *float64x2_t v2 = *(_OWORD *)v1;
  v2[1] = v3;
  free(v1);
}

{
  void *v1;
  uint64_t v2;
  long long v3;

  Swift::String v1 = *a1;
  float64x2_t v2 = v1[4];
  long long v3 = *((_OWORD *)v1 + 1);
  *(_OWORD *)(v2 + 32) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 48) = v3;
  free(v1);
}

unint64_t simd_double2x3.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 1)
  {
    if (a2 <= 2) {
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double2x3.subscript(_:_:) : simd_double2x3(uint64_t *result, uint64_t a2, void *a3)
{
  unint64_t v3 = a3[1];
  uint64_t v4 = *result;
  if (!*a3)
  {
    if (v3 <= 2)
    {
      *(void *)(a2 + 8 * v3) = v4;
      return result;
    }
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*a3 == 1)
  {
    if (v3 <= 2)
    {
      *(void *)(a2 + 32 + 8 * v3) = v4;
      return result;
    }
    goto LABEL_7;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t simd_double2x3.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  if (!result)
  {
    if (a2 > 2) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (result == 1)
  {
    if (a2 > 2)
    {
LABEL_8:
      __break(1u);
      goto LABEL_9;
    }
    v3 += 32;
LABEL_7:
    *(double *)(v3 + 8 * a2) = a3;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t (*simd_double2x3.subscript.modify(uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_7;
    }
    v3 += 32;
  }
  if (a3 <= 2)
  {
    *(void *)float64x2_t result = *(void *)(v3 + 8 * (a3 & 3));
    return simd_double2x3.subscript.modify;
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

unint64_t simd_double2x3.debugDescription.getter()
{
  _StringGuts.grow(_:)(24);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  v2._countAndFlagsBits = specialized SIMD3._descriptionAsArray.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 10589;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  return 0xD000000000000010;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_double2x3()
{
  return simd_double2x3.debugDescription.getter();
}

unint64_t static simd_double2x3.== infix(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, float64x2_t a6, float64x2_t a7, float64x2_t a8)
{
  int64x2_t v8 = (int64x2_t)vandq_s8((int8x16_t)vceqq_f64(a3, a7), (int8x16_t)vceqq_f64(a1, a5));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v8, 1), vandq_s8((int8x16_t)vshlq_n_s64((int64x2_t)vandq_s8((int8x16_t)vceqq_f64(a4, a8), (int8x16_t)vceqq_f64(a2, a6)), 0x3FuLL), (int8x16_t)v8)).u64[0] >> 63;
}

unint64_t simd_equal(float64x2_t *a1, float64x2_t *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), vandq_s8((int8x16_t)vshlq_n_s64((int64x2_t)vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])), 0x3FuLL), (int8x16_t)v2)).u64[0] >> 63;
}

{
  int64x2_t v2;

  int64x2_t v2 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)), (int8x16_t)vceqq_f64(a1[4], a2[4]));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), vandq_s8((int8x16_t)vshlq_n_s64((int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])), (int8x16_t)vceqq_f64(a1[5], a2[5])), 0x3FuLL), (int8x16_t)v2)).u64[0] >> 63;
}

{
  int64x2_t v2;

  int64x2_t v2 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)), vandq_s8((int8x16_t)vceqq_f64(a1[4], a2[4]), (int8x16_t)vceqq_f64(a1[6], a2[6])));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), vandq_s8((int8x16_t)vshlq_n_s64((int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])), vandq_s8((int8x16_t)vceqq_f64(a1[5], a2[5]), (int8x16_t)vceqq_f64(a1[7], a2[7]))), 0x3FuLL), (int8x16_t)v2)).u64[0] >> 63;
}

{
  int64x2_t v2;

  int64x2_t v2 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)), vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])));
  return vandq_s8((int8x16_t)v2, (int8x16_t)vdupq_laneq_s64(v2, 1)).u64[0] >> 63;
}

{
  int64x2_t v2;

  int64x2_t v2 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)), (int8x16_t)vceqq_f64(a1[4], a2[4])), vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])), (int8x16_t)vceqq_f64(a1[5], a2[5])));
  return vandq_s8((int8x16_t)v2, (int8x16_t)vdupq_laneq_s64(v2, 1)).u64[0] >> 63;
}

{
  int64x2_t v2;

  int64x2_t v2 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)), vandq_s8((int8x16_t)vceqq_f64(a1[4], a2[4]), (int8x16_t)vceqq_f64(a1[6], a2[6]))), vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])), vandq_s8((int8x16_t)vceqq_f64(a1[5], a2[5]), (int8x16_t)vceqq_f64(a1[7], a2[7]))));
  return vandq_s8((int8x16_t)v2, (int8x16_t)vdupq_laneq_s64(v2, 1)).u64[0] >> 63;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double2x3(_OWORD *a1, long long *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_double2x3(a1, a2, a3, a4, (uint64_t (*)(_OWORD *, _OWORD *))simd_equal);
}

double static simd_double2x3.+ infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(a1, a5);
  return result;
}

double static simd_double2x3.- prefix(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64((float64x2_t)0, a1);
  return result;
}

double static simd_double2x3.- infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(a1, a5);
  return result;
}

float64x2_t static simd_double2x3.+= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  float64x2_t v5 = vaddq_f64(a3, a1[1]);
  float64x2_t result = vaddq_f64(a2, *a1);
  float64x2_t v7 = vaddq_f64(a5, a1[3]);
  float64x2_t v8 = vaddq_f64(a4, a1[2]);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v8;
  a1[3] = v7;
  return result;
}

float64x2_t static simd_double2x3.-= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  float64x2_t v5 = vsubq_f64(a1[1], a3);
  float64x2_t result = vsubq_f64(*a1, a2);
  float64x2_t v7 = vsubq_f64(a1[3], a5);
  float64x2_t v8 = vsubq_f64(a1[2], a4);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v8;
  a1[3] = v7;
  return result;
}

double static simd_double2x3.* infix(_:_:)(double a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a2, a1);
  return result;
}

double static simd_double2x3.* infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, a5);
  return result;
}

float64x2_t static simd_double2x3.*= infix(_:_:)(float64x2_t *a1, float64x2_t a2)
{
  float64x2_t v2 = vmulq_f64(a2, a1[1]);
  float64x2_t v3 = vmulq_n_f64(*a1, a2.f64[0]);
  float64x2_t v4 = vmulq_f64(a2, a1[3]);
  float64x2_t result = vmulq_n_f64(a1[2], a2.f64[0]);
  *a1 = v3;
  a1[1] = v2;
  a1[2] = result;
  a1[3] = v4;
  return result;
}

double static simd_double2x3.* infix(_:_:)(float64x2_t a1, double a2, float64x2_t a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64(a1, a5.f64[0]), a3, a5, 1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64(a1, a5.f64[0]), a3, a5, 1);
  return result;
}

double static simd_double2x3.* infix(_:_:)(float64x2_t a1, double a2, int64x2_t a3, float64x2_t a4, int64x2_t a5, float64_t a6)
{
  a4.f64[1] = a6;
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)vzip1q_s64(a3, a5), a1.f64[0]), (float64x2_t)vzip2q_s64(a3, a5), a1, 1), a4, a2);
  return result;
}

float64x2_t static simd_double2x3.* infix(_:_:)@<Q0>(float64x2_t *a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>, float64x2_t a7@<Q5>, float64x2_t a8@<Q6>)
{
  *a1 = vmlaq_laneq_f64(vmulq_n_f64(a2, a6.f64[0]), a4, a6, 1);
  a1[1] = vmlaq_laneq_f64(vmulq_f64(a3, a6), a5, a6, 1);
  a1[2] = vmlaq_laneq_f64(vmulq_n_f64(a2, a7.f64[0]), a4, a7, 1);
  a1[3] = vmlaq_laneq_f64(vmulq_f64(a3, a7), a5, a7, 1);
  float64x2_t result = vmlaq_laneq_f64(vmulq_n_f64(a2, a8.f64[0]), a4, a8, 1);
  a1[4] = result;
  a1[5] = vmlaq_laneq_f64(vmulq_f64(a3, a8), a5, a8, 1);
  return result;
}

float64x2_t static simd_double2x3.* infix(_:_:)@<Q0>(float64x2_t *a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>, float64x2_t a7@<Q5>, float64x2_t a8@<Q6>, float64x2_t a9@<Q7>)
{
  *a1 = vmlaq_laneq_f64(vmulq_n_f64(a2, a6.f64[0]), a4, a6, 1);
  a1[1] = vmlaq_laneq_f64(vmulq_f64(a3, a6), a5, a6, 1);
  a1[2] = vmlaq_laneq_f64(vmulq_n_f64(a2, a7.f64[0]), a4, a7, 1);
  a1[3] = vmlaq_laneq_f64(vmulq_f64(a3, a7), a5, a7, 1);
  a1[4] = vmlaq_laneq_f64(vmulq_n_f64(a2, a8.f64[0]), a4, a8, 1);
  a1[5] = vmlaq_laneq_f64(vmulq_f64(a3, a8), a5, a8, 1);
  float64x2_t result = vmlaq_laneq_f64(vmulq_n_f64(a2, a9.f64[0]), a4, a9, 1);
  a1[6] = result;
  a1[7] = vmlaq_laneq_f64(vmulq_f64(a3, a9), a5, a9, 1);
  return result;
}

float64x2_t static simd_double2x3.*= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v3 = a1[1];
  float64x2_t v4 = a1[2];
  float64x2_t v5 = a1[3];
  float64x2_t v6 = vmlaq_laneq_f64(vmulq_f64(v3, a2), v5, a2, 1);
  float64x2_t v7 = vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), v4, a2, 1);
  float64x2_t v8 = vmulq_n_f64(*a1, a3.f64[0]);
  *a1 = v7;
  a1[1] = v6;
  float64x2_t result = vmlaq_laneq_f64(v8, v4, a3, 1);
  a1[2] = result;
  a1[3] = vmlaq_laneq_f64(vmulq_f64(v3, a3), v5, a3, 1);
  return result;
}

double matrix_from_rows(_:_:_:)(int64x2_t a1, int64x2_t a2)
{
  *(void *)&double result = vzip1q_s64(a1, a2).u64[0];
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double2x3 *a1, simd_double2x3 *a2)
{
  int64x2_t v10 = (int64x2_t)vandq_s8((int8x16_t)vceqq_f64(v4, v8), (int8x16_t)vceqq_f64(v2, v6));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v10, 1), vandq_s8((int8x16_t)vshlq_n_s64((int64x2_t)vandq_s8((int8x16_t)vceqq_f64(v5, v9), (int8x16_t)vceqq_f64(v3, v7)), 0x3FuLL), (int8x16_t)v10)).u64[0] >> 63;
}

void __swiftcall simd_double3x3.init(_:)(simd_double3x3 *__return_ptr retstr, Swift::Double a2)
{
  *(void *)&long long v2 = 0;
  *((Swift::Double *)&v2 + 1) = a2;
  *(_OWORD *)retstr->columns[0].f64 = *(unint64_t *)&a2;
  *(_OWORD *)&retstr->columns[0].f64[2] = 0u;
  *(_OWORD *)retstr->columns[1].f64 = v2;
  *(_OWORD *)&retstr->columns[1].f64[2] = 0u;
  *(_OWORD *)retstr->columns[2].f64 = 0u;
  *(_OWORD *)&retstr->columns[2].f64[2] = *(unint64_t *)&a2;
}

void simd_double3x3.init(diagonal:)(_OWORD *a1@<X8>, __n128 a2@<Q0>, unint64_t a3@<D1>)
{
  *(void *)&long long v3 = 0;
  *((void *)&v3 + 1) = a2.n128_u64[1];
  *a1 = a2.n128_u64[0];
  a1[1] = 0u;
  a1[2] = v3;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = a3;
}

void __swiftcall simd_double3x3.init(rows:)(simd_double3x3 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 3)
  {
    int64x2_t v8 = *((int64x2_t *)rows._rawValue + 3);
    int64x2_t v5 = *((int64x2_t *)rows._rawValue + 2);
    int64x2_t v6 = *((int64x2_t *)rows._rawValue + 5);
    int64x2_t v4 = *((int64x2_t *)rows._rawValue + 4);
    long long v7 = *((_OWORD *)rows._rawValue + 7);
    int64x2_t v3 = *((int64x2_t *)rows._rawValue + 6);
    swift_bridgeObjectRelease();
    *(int64x2_t *)retstr->columns[0].f64 = vzip1q_s64(v5, v4);
    *(int64x2_t *)&retstr->columns[0].f64[2] = v3;
    *(int64x2_t *)retstr->columns[1].f64 = vzip2q_s64(v5, v4);
    *(int64x2_t *)&retstr->columns[1].f64[2] = vdupq_laneq_s64(v3, 1);
    *(int64x2_t *)retstr->columns[2].f64 = vzip1q_s64(v8, v6);
    *(_OWORD *)&retstr->columns[2].f64[2] = v7;
  }
  else
  {
    __break(1u);
  }
}

int64x2_t simd_double3x3.transpose.getter@<Q0>(uint64_t a1@<X8>)
{
  int64x2_t v2 = *(int64x2_t *)(v1 + 32);
  int64x2_t v4 = *(int64x2_t *)(v1 + 64);
  long long v3 = *(_OWORD *)(v1 + 80);
  int64x2_t v5 = vzip2q_s64(*(int64x2_t *)v1, v2);
  int64x2_t result = vzip1q_s64(*(int64x2_t *)(v1 + 16), *(int64x2_t *)(v1 + 48));
  *(int64x2_t *)a1 = vzip1q_s64(*(int64x2_t *)v1, v2);
  *(int64x2_t *)(a1 + 16) = v4;
  *(int64x2_t *)(a1 + 32) = v5;
  *(int64x2_t *)(a1 + 48) = vdupq_laneq_s64(v4, 1);
  *(int64x2_t *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v3;
  return result;
}

void __swiftcall simd_double3x3.init(_:)(simd_double3x3 *__return_ptr retstr, simd_double3x3 *a2)
{
  long long v2 = *(_OWORD *)&a2->columns[1].f64[2];
  *(_OWORD *)retstr->columns[1].f64 = *(_OWORD *)a2->columns[1].f64;
  *(_OWORD *)&retstr->columns[1].f64[2] = v2;
  long long v3 = *(_OWORD *)&a2->columns[2].f64[2];
  *(_OWORD *)retstr->columns[2].f64 = *(_OWORD *)a2->columns[2].f64;
  *(_OWORD *)&retstr->columns[2].f64[2] = v3;
  long long v4 = *(_OWORD *)&a2->columns[0].f64[2];
  *(_OWORD *)retstr->columns[0].f64 = *(_OWORD *)a2->columns[0].f64;
  *(_OWORD *)&retstr->columns[0].f64[2] = v4;
}

__n128 simd_double3x3.cmatrix.getter@<Q0>(_OWORD *a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 48);
  a1[2] = *(_OWORD *)(v1 + 32);
  a1[3] = v2;
  long long v3 = *(_OWORD *)(v1 + 80);
  a1[4] = *(_OWORD *)(v1 + 64);
  a1[5] = v3;
  __n128 result = *(__n128 *)v1;
  long long v5 = *(_OWORD *)(v1 + 16);
  *a1 = *(_OWORD *)v1;
  a1[1] = v5;
  return result;
}

void (*simd_double3x3.subscript.modify(void (**a1)(void **a1), uint64_t a2))(void **a1)
{
  __n128 result = (void (*)(void **))malloc(0x30uLL);
  *a1 = result;
  *((void *)result + 4) = a2;
  *((void *)result + 5) = v2;
  switch(a2)
  {
    case 0:
      long long v8 = v2[1];
      *(_OWORD *)__n128 result = *v2;
      *((_OWORD *)result + 1) = v8;
      return simd_double3x3.subscript.modify;
    case 1:
      long long v7 = v2[2];
      long long v6 = v2[3];
LABEL_7:
      *(_OWORD *)__n128 result = v7;
      *((_OWORD *)result + 1) = v6;
      return (void (*)(void **))simd_double3x3.subscript.modify;
    case 2:
      long long v7 = v2[4];
      long long v6 = v2[5];
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

void simd_double3x3.subscript.modify(void **a1)
{
  uint64_t v1 = *a1;
  long long v2 = (_OWORD *)v1[5];
  long long v3 = *((_OWORD *)v1 + 1);
  *long long v2 = *(_OWORD *)v1;
  v2[1] = v3;
  free(v1);
}

unint64_t simd_double3x3.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 2)
  {
    if (a2 <= 2) {
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t key path getter for simd_double3x3.subscript(_:_:) : simd_double3x3@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 1)
  {
    result += 32;
  }
  else if (v3)
  {
    if (v3 != 2) {
      goto LABEL_9;
    }
    result += 64;
  }
  if ((unint64_t)a2[1] <= 2)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 3));
    return result;
  }
  __break(1u);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double3x3.subscript(_:_:) : simd_double3x3(uint64_t *result, long long *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = a3[1];
  uint64_t v5 = *result;
  if (!*a3)
  {
    if (v4 <= 2)
    {
      long long v8 = a2[1];
      long long v11 = *a2;
      long long v12 = v8;
      *((void *)&v11 + (v4 & 3)) = v5;
      long long v9 = v12;
      *a2 = v11;
      a2[1] = v9;
      return result;
    }
    goto LABEL_12;
  }
  if (v3 == 1)
  {
    long long v7 = a2[2];
    long long v6 = a2[3];
  }
  else
  {
    if (v3 != 2)
    {
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
    }
    long long v7 = a2[4];
    long long v6 = a2[5];
  }
  if (v4 > 2)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  long long v13 = v7;
  long long v14 = v6;
  *((void *)&v13 + (v4 & 3)) = v5;
  long long v10 = v14;
  if (v3 == 1)
  {
    a2[2] = v13;
    a2[3] = v10;
  }
  else
  {
    a2[4] = v13;
    a2[5] = v10;
  }
  return result;
}

uint64_t simd_double3x3.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  switch(result)
  {
    case 0:
      if (a2 <= 2)
      {
        long long v6 = v3[1];
        long long v9 = *v3;
        long long v10 = v6;
        *((double *)&v9 + (a2 & 3)) = a3;
        long long v7 = v10;
        *uint64_t v3 = v9;
        v3[1] = v7;
        return result;
      }
      goto LABEL_12;
    case 1:
      long long v5 = v3[2];
      long long v4 = v3[3];
      break;
    case 2:
      long long v5 = v3[4];
      long long v4 = v3[5];
      break;
    default:
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
  }
  if (a2 > 2)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  long long v11 = v5;
  long long v12 = v4;
  *((double *)&v11 + (a2 & 3)) = a3;
  long long v8 = v12;
  if (result == 1)
  {
    v3[2] = v11;
    v3[3] = v8;
  }
  else
  {
    v3[4] = v11;
    v3[5] = v8;
  }
  return result;
}

uint64_t (*simd_double3x3.subscript.modify(uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  switch(a2)
  {
    case 0:
      long long v5 = *v3;
      long long v4 = v3[1];
      if (a3 <= 2) {
        goto LABEL_6;
      }
LABEL_9:
      __break(1u);
      break;
    case 1:
      long long v5 = v3[2];
      long long v4 = v3[3];
      if (a3 > 2) {
        goto LABEL_9;
      }
LABEL_6:
      v6[0] = v5;
      v6[1] = v4;
      *(void *)__n128 result = *((void *)v6 + (a3 & 3));
      return simd_double3x3.subscript.modify;
    case 2:
      long long v5 = v3[4];
      long long v4 = v3[5];
      if (a3 <= 2) {
        goto LABEL_6;
      }
      goto LABEL_9;
  }
  __break(1u);
  return result;
}

unint64_t simd_double3x3.debugDescription.getter()
{
  return simd_double3x3.debugDescription.getter(0x8000000212834830, (uint64_t (*)(__n128, __n128))specialized SIMD3._descriptionAsArray.getter);
}

unint64_t static simd_double3x3.== infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)), (int8x16_t)vceqq_f64(a1[4], a2[4]));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), vandq_s8((int8x16_t)vshlq_n_s64((int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])), (int8x16_t)vceqq_f64(a1[5], a2[5])), 0x3FuLL), (int8x16_t)v2)).u64[0] >> 63;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double3x3(_OWORD *a1, long long *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_double3x3(a1, a2, a3, a4, (uint64_t (*)(_OWORD *, _OWORD *))simd_equal);
}

double simd_double3x3.inverse.getter@<D0>(_OWORD *a1@<X8>)
{
  __invert_d3();
  double result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  return result;
}

float64_t simd_double3x3.determinant.getter()
{
  float64x2_t v2 = v0[2];
  float64x2_t v1 = v0[3];
  float64x2_t v3 = v0[4];
  float64x2_t v4 = v0[5];
  float64x2_t v5 = (float64x2_t)vextq_s8((int8x16_t)v2, (int8x16_t)v1, 8uLL);
  v1.f64[1] = v0[2].f64[0];
  float64x2_t v6 = (float64x2_t)vextq_s8((int8x16_t)v3, (int8x16_t)v4, 8uLL);
  v4.f64[1] = v0[4].f64[0];
  return vmulq_f64(v0[1], vmlaq_laneq_f64(vmulq_f64(v3, vnegq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)v2, 1))), v2, v3, 1)).f64[0]+ vaddvq_f64(vmulq_f64(*v0, vmlaq_f64(vmulq_f64(v6, vnegq_f64(v1)), v4, v5)));
}

float64x2_t static simd_double3x3.+ infix(_:_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vaddq_f64(a2[1], a1[1]);
  float64x2_t v4 = vaddq_f64(a2[2], a1[2]);
  float64x2_t v5 = vaddq_f64(a2[3], a1[3]);
  float64x2_t v6 = vaddq_f64(a2[4], a1[4]);
  float64x2_t v7 = vaddq_f64(a2[5], a1[5]);
  *a3 = vaddq_f64(*a2, *a1);
  a3[1] = result;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v6;
  a3[5] = v7;
  return result;
}

float64x2_t static simd_double3x3.- prefix(_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X8>)
{
  float64x2_t result = vsubq_f64((float64x2_t)0, a1[1]);
  float64x2_t v3 = vsubq_f64((float64x2_t)0, a1[2]);
  float64x2_t v4 = vsubq_f64((float64x2_t)0, a1[3]);
  float64x2_t v5 = vsubq_f64((float64x2_t)0, a1[4]);
  float64x2_t v6 = vsubq_f64((float64x2_t)0, a1[5]);
  *a2 = vsubq_f64((float64x2_t)0, *a1);
  a2[1] = result;
  a2[2] = v3;
  a2[3] = v4;
  a2[4] = v5;
  a2[5] = v6;
  return result;
}

float64x2_t static simd_double3x3.- infix(_:_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vsubq_f64(a1[1], a2[1]);
  float64x2_t v4 = vsubq_f64(a1[2], a2[2]);
  float64x2_t v5 = vsubq_f64(a1[3], a2[3]);
  float64x2_t v6 = vsubq_f64(a1[4], a2[4]);
  float64x2_t v7 = vsubq_f64(a1[5], a2[5]);
  *a3 = vsubq_f64(*a1, *a2);
  a3[1] = result;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v6;
  a3[5] = v7;
  return result;
}

float64x2_t static simd_double3x3.+= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vaddq_f64(a2[1], a1[1]);
  float64x2_t result = vaddq_f64(*a2, *a1);
  float64x2_t v4 = vaddq_f64(a2[3], a1[3]);
  float64x2_t v5 = vaddq_f64(a2[2], a1[2]);
  float64x2_t v6 = vaddq_f64(a2[5], a1[5]);
  float64x2_t v7 = vaddq_f64(a2[4], a1[4]);
  *a1 = result;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  return result;
}

float64x2_t static simd_double3x3.-= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vsubq_f64(a1[1], a2[1]);
  float64x2_t result = vsubq_f64(*a1, *a2);
  float64x2_t v4 = vsubq_f64(a1[3], a2[3]);
  float64x2_t v5 = vsubq_f64(a1[2], a2[2]);
  float64x2_t v6 = vsubq_f64(a1[5], a2[5]);
  float64x2_t v7 = vsubq_f64(a1[4], a2[4]);
  *a1 = result;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  return result;
}

float64x2_t static simd_double3x3.* infix(_:_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X8>, float64x2_t a3@<Q0>)
{
  float64x2_t v3 = vmulq_n_f64(*a1, a3.f64[0]);
  float64x2_t v4 = vmulq_f64(a3, a1[1]);
  float64x2_t v5 = vmulq_n_f64(a1[2], a3.f64[0]);
  float64x2_t v6 = vmulq_f64(a3, a1[3]);
  float64x2_t v7 = vmulq_n_f64(a1[4], a3.f64[0]);
  float64x2_t result = vmulq_f64(a3, a1[5]);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = result;
  return result;
}

{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t result;

  float64x2_t v3 = vmulq_n_f64(*a1, a3.f64[0]);
  float64x2_t v4 = vmulq_f64(a3, a1[1]);
  float64x2_t v5 = vmulq_n_f64(a1[2], a3.f64[0]);
  float64x2_t v6 = vmulq_f64(a3, a1[3]);
  float64x2_t v7 = vmulq_n_f64(a1[4], a3.f64[0]);
  float64x2_t result = vmulq_f64(a3, a1[5]);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = result;
  return result;
}

float64x2_t static simd_double3x3.*= infix(_:_:)(float64x2_t *a1, float64x2_t a2)
{
  float64x2_t v2 = vmulq_f64(a2, a1[1]);
  float64x2_t v3 = vmulq_n_f64(*a1, a2.f64[0]);
  float64x2_t v4 = vmulq_f64(a2, a1[3]);
  float64x2_t v5 = vmulq_n_f64(a1[2], a2.f64[0]);
  float64x2_t v6 = vmulq_f64(a2, a1[5]);
  float64x2_t result = vmulq_n_f64(a1[4], a2.f64[0]);
  *a1 = v3;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = result;
  a1[5] = v6;
  return result;
}

double static simd_double3x3.* infix(_:_:)(float64x2_t *a1, float64x2_t a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a2, 1), a1[4], a3);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a2, 1), a1[4], a3);
  return result;
}

double static simd_double3x3.* infix(_:_:)(int64x2_t *a1, float64x2_t a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)vzip1q_s64(*a1, a1[2]), a2.f64[0]), (float64x2_t)vzip2q_s64(*a1, a1[2]), a2, 1), (float64x2_t)vzip1q_s64(a1[1], a1[3]), a3);
  return result;
}

float64x2_t static simd_double3x3.* infix(_:_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t v3 = a2[1];
  float64x2_t v5 = a2[2];
  float64x2_t v4 = a2[3];
  float64x2_t v7 = a2[4];
  float64x2_t v6 = a2[5];
  float64x2_t v8 = a1[1];
  float64x2_t v9 = a1[2];
  float64x2_t v10 = a1[3];
  float64x2_t v12 = a1[4];
  float64x2_t v11 = a1[5];
  float64x2_t v13 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v9, *a2, 1), v12, v3.f64[0]);
  float64x2_t v14 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v8, *a2), v10, *a2, 1), v3, v11);
  float64x2_t result = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v5.f64[0]), v9, v5, 1), v12, v4.f64[0]);
  float64x2_t v16 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v8, v5), v10, v5, 1), v4, v11);
  float64x2_t v17 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v7.f64[0]), v9, v7, 1), v12, v6.f64[0]);
  *a3 = v13;
  a3[1] = v14;
  a3[2] = result;
  a3[3] = v16;
  a3[4] = v17;
  a3[5] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v8, v7), v10, v7, 1), v6, v11);
  return result;
}

{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t result;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;

  float64x2_t v3 = a2[1];
  float64x2_t v5 = a2[2];
  float64x2_t v4 = a2[3];
  float64x2_t v7 = a2[4];
  float64x2_t v6 = a2[5];
  float64x2_t v9 = a2[6];
  float64x2_t v8 = a2[7];
  float64x2_t v10 = a1[1];
  float64x2_t v11 = a1[2];
  float64x2_t v12 = a1[3];
  float64x2_t v14 = a1[4];
  float64x2_t v13 = a1[5];
  Swift::String v15 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v11, *a2, 1), v14, v3.f64[0]);
  float64x2_t v16 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, *a2), v12, *a2, 1), v3, v13);
  float64x2_t result = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v5.f64[0]), v11, v5, 1), v14, v4.f64[0]);
  Swift::String v18 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, v5), v12, v5, 1), v4, v13);
  Swift::String v19 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v7.f64[0]), v11, v7, 1), v14, v6.f64[0]);
  uint64_t v20 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, v7), v12, v7, 1), v6, v13);
  v21 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v9.f64[0]), v11, v9, 1), v14, v8.f64[0]);
  *a3 = v15;
  a3[1] = v16;
  a3[2] = result;
  a3[3] = v18;
  a3[4] = v19;
  a3[5] = v20;
  a3[6] = v21;
  a3[7] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, v9), v12, v9, 1), v8, v13);
  return result;
}

float64x2_t static simd_double3x3.*= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = a2[1];
  float64x2_t v4 = a2[2];
  float64x2_t v3 = a2[3];
  float64x2_t v6 = a2[4];
  float64x2_t v5 = a2[5];
  float64x2_t v7 = a1[1];
  float64x2_t v9 = a1[2];
  float64x2_t v8 = a1[3];
  float64x2_t v10 = a1[4];
  float64x2_t v11 = a1[5];
  float64x2_t v12 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v7, *a2), v8, *a2, 1), v2, v11);
  float64x2_t v13 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v9, *a2, 1), v10, v2.f64[0]);
  float64x2_t result = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v7, v4), v8, v4, 1), v3, v11);
  float64x2_t v15 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v4.f64[0]), v9, v4, 1), v10, v3.f64[0]);
  float64x2_t v16 = vmlaq_laneq_f64(vmulq_n_f64(*a1, v6.f64[0]), v9, v6, 1);
  *a1 = v13;
  a1[1] = v12;
  a1[2] = v15;
  a1[3] = result;
  a1[4] = vmlaq_n_f64(v16, v10, v5.f64[0]);
  a1[5] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v7, v6), v8, v6, 1), v5, v11);
  return result;
}

void matrix_from_diagonal(_:)(_OWORD *a1@<X8>, __n128 a2@<Q0>, unint64_t a3@<D1>)
{
  *(void *)&long long v3 = 0;
  *((void *)&v3 + 1) = a2.n128_u64[1];
  *a1 = a2.n128_u64[0];
  a1[1] = 0u;
  a1[2] = v3;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = a3;
}

void __swiftcall matrix_invert(_:)(simd_double3x3 *__return_ptr retstr, simd_double3x3 *a2)
{
  __invert_d3();
  *retstr = v3;
}

Swift::Double __swiftcall matrix_determinant(_:)(simd_double3x3 *a1)
{
  float64x2_t v2 = *(float64x2_t *)a1->columns[1].f64;
  float64x2_t v1 = *(float64x2_t *)&a1->columns[1].f64[2];
  float64x2_t v3 = *(float64x2_t *)a1->columns[2].f64;
  float64x2_t v4 = *(float64x2_t *)&a1->columns[2].f64[2];
  float64x2_t v5 = (float64x2_t)vextq_s8((int8x16_t)v2, (int8x16_t)v1, 8uLL);
  v1.f64[1] = a1->columns[1].f64[0];
  float64x2_t v6 = (float64x2_t)vextq_s8((int8x16_t)v3, (int8x16_t)v4, 8uLL);
  v4.f64[1] = a1->columns[2].f64[0];
  return vmulq_f64(*(float64x2_t *)&a1->columns[0].f64[2], vmlaq_laneq_f64(vmulq_f64(v3, vnegq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)v2, 1))), v2, v3, 1)).f64[0]+ vaddvq_f64(vmulq_f64(*(float64x2_t *)a1->columns[0].f64, vmlaq_f64(vmulq_f64(v6, vnegq_f64(v1)), v4, v5)));
}

int64x2_t matrix_from_rows(_:_:_:)@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>, int64x2_t a4@<Q2>, int64x2_t a5@<Q3>, int64x2_t a6@<Q4>, __n128 a7@<Q5>)
{
  *(int64x2_t *)a1 = vzip1q_s64(a2, a4);
  *(int64x2_t *)(a1 + 16) = a6;
  *(int64x2_t *)(a1 + 32) = vzip2q_s64(a2, a4);
  *(int64x2_t *)(a1 + 48) = vdupq_laneq_s64(a6, 1);
  int64x2_t result = vzip1q_s64(a3, a5);
  *(int64x2_t *)(a1 + 64) = result;
  *(__n128 *)(a1 + 80) = a7;
  return result;
}

void __swiftcall matrix_transpose(_:)(simd_double3x3 *__return_ptr retstr, simd_double3x3 *a2)
{
  int64x2_t v2 = *(int64x2_t *)a2->columns[1].f64;
  int64x2_t v4 = *(int64x2_t *)a2->columns[2].f64;
  long long v3 = *(_OWORD *)&a2->columns[2].f64[2];
  int64x2_t v5 = vzip2q_s64(*(int64x2_t *)a2->columns[0].f64, v2);
  int64x2_t v6 = vzip1q_s64(*(int64x2_t *)&a2->columns[0].f64[2], *(int64x2_t *)&a2->columns[1].f64[2]);
  *(int64x2_t *)retstr->columns[0].f64 = vzip1q_s64(*(int64x2_t *)a2->columns[0].f64, v2);
  *(int64x2_t *)&retstr->columns[0].f64[2] = v4;
  *(int64x2_t *)retstr->columns[1].f64 = v5;
  *(int64x2_t *)&retstr->columns[1].f64[2] = vdupq_laneq_s64(v4, 1);
  *(int64x2_t *)retstr->columns[2].f64 = v6;
  *(_OWORD *)&retstr->columns[2].f64[2] = v3;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double3x3 *a1, simd_double3x3 *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[1].f64, *(float64x2_t *)a2->columns[1].f64), (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[0].f64, *(float64x2_t *)a2->columns[0].f64)), (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[2].f64, *(float64x2_t *)a2->columns[2].f64));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), vandq_s8((int8x16_t)vshlq_n_s64((int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&a1->columns[1].f64[2], *(float64x2_t *)&a2->columns[1].f64[2]), (int8x16_t)vceqq_f64(*(float64x2_t *)&a1->columns[0].f64[2], *(float64x2_t *)&a2->columns[0].f64[2])), (int8x16_t)vceqq_f64(*(float64x2_t *)&a1->columns[2].f64[2], *(float64x2_t *)&a2->columns[2].f64[2])), 0x3FuLL), (int8x16_t)v2)).u64[0] >> 63;
}

void __swiftcall simd_double4x3.init(_:)(simd_double4x3 *__return_ptr retstr, Swift::Double a2)
{
  *(void *)&long long v2 = 0;
  *((Swift::Double *)&v2 + 1) = a2;
  *(_OWORD *)retstr->columns[0].f64 = *(unint64_t *)&a2;
  *(_OWORD *)&retstr->columns[0].f64[2] = 0u;
  *(_OWORD *)retstr->columns[1].f64 = v2;
  *(_OWORD *)&retstr->columns[1].f64[2] = 0u;
  *(_OWORD *)retstr->columns[2].f64 = 0u;
  *(_OWORD *)&retstr->columns[2].f64[2] = *(unint64_t *)&a2;
  *(_OWORD *)retstr->columns[3].f64 = 0u;
  *(_OWORD *)&retstr->columns[3].f64[2] = 0u;
}

void simd_double4x3.init(diagonal:)(_OWORD *a1@<X8>, __n128 a2@<Q0>, unint64_t a3@<D1>)
{
  *(void *)&long long v3 = 0;
  *((void *)&v3 + 1) = a2.n128_u64[1];
  *a1 = a2.n128_u64[0];
  a1[1] = 0u;
  a1[2] = v3;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = a3;
  a1[6] = 0u;
  a1[7] = 0u;
}

void __swiftcall simd_double4x3.init(rows:)(simd_double4x3 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 3)
  {
    long long v3 = (const double *)((char *)rows._rawValue + 32);
    int64x2_t v4 = *((int64x2_t *)rows._rawValue + 6);
    int64x2_t v5 = *((int64x2_t *)rows._rawValue + 7);
    float64x2x4_t v7 = vld4q_f64(v3);
    float64x2x4_t v6 = v7;
    swift_bridgeObjectRelease();
    *(float64x2_t *)retstr->columns[0].f64 = v6.val[0];
    *(int64x2_t *)&retstr->columns[0].f64[2] = v4;
    *(float64x2_t *)retstr->columns[1].f64 = v6.val[1];
    *(int64x2_t *)&retstr->columns[1].f64[2] = vdupq_laneq_s64(v4, 1);
    *(float64x2_t *)retstr->columns[2].f64 = v6.val[2];
    *(int64x2_t *)&retstr->columns[2].f64[2] = v5;
    *(float64x2_t *)retstr->columns[3].f64 = v6.val[3];
    *(int64x2_t *)&retstr->columns[3].f64[2] = vdupq_laneq_s64(v5, 1);
  }
  else
  {
    __break(1u);
  }
}

uint64_t simd_double3x3.init(_:)@<X0>(uint64_t result@<X0>, _OWORD *a2@<X8>)
{
  if (*(void *)(result + 16) == 3)
  {
    long long v8 = *(_OWORD *)(result + 32);
    long long v5 = *(_OWORD *)(result + 48);
    long long v7 = *(_OWORD *)(result + 64);
    long long v6 = *(_OWORD *)(result + 96);
    long long v3 = *(_OWORD *)(result + 112);
    long long v4 = *(_OWORD *)(result + 80);
    int64x2_t result = swift_bridgeObjectRelease();
    *a2 = v8;
    a2[1] = v5;
    a2[2] = v7;
    a2[3] = v4;
    a2[4] = v6;
    a2[5] = v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

int64x2_t simd_double3x4.transpose.getter@<Q0>(int64x2_t *a1@<X8>)
{
  int64x2_t v2 = v1[1];
  int64x2_t v4 = v1[2];
  int64x2_t v3 = v1[3];
  int64x2_t v6 = v1[4];
  int64x2_t v5 = v1[5];
  int64x2_t v7 = vzip1q_s64(*v1, v4);
  int64x2_t v8 = vzip2q_s64(*v1, v4);
  int64x2_t v9 = vzip1q_s64(v2, v3);
  int64x2_t result = vzip2q_s64(v2, v3);
  *a1 = v7;
  a1[1] = v6;
  a1[2] = v8;
  a1[3] = vdupq_laneq_s64(v6, 1);
  a1[4] = v9;
  a1[5] = v5;
  a1[6] = result;
  a1[7] = vdupq_laneq_s64(v5, 1);
  return result;
}

void __swiftcall simd_double4x3.init(_:)(simd_double4x3 *__return_ptr retstr, simd_double4x3 *a2)
{
  long long v2 = *(_OWORD *)&a2->columns[2].f64[2];
  *(_OWORD *)retstr->columns[2].f64 = *(_OWORD *)a2->columns[2].f64;
  *(_OWORD *)&retstr->columns[2].f64[2] = v2;
  long long v3 = *(_OWORD *)&a2->columns[3].f64[2];
  *(_OWORD *)retstr->columns[3].f64 = *(_OWORD *)a2->columns[3].f64;
  *(_OWORD *)&retstr->columns[3].f64[2] = v3;
  long long v4 = *(_OWORD *)&a2->columns[0].f64[2];
  *(_OWORD *)retstr->columns[0].f64 = *(_OWORD *)a2->columns[0].f64;
  *(_OWORD *)&retstr->columns[0].f64[2] = v4;
  long long v5 = *(_OWORD *)&a2->columns[1].f64[2];
  *(_OWORD *)retstr->columns[1].f64 = *(_OWORD *)a2->columns[1].f64;
  *(_OWORD *)&retstr->columns[1].f64[2] = v5;
}

__n128 simd_double4x3.cmatrix.getter@<Q0>(uint64_t a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 80) = v2;
  long long v3 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(a1 + 112) = v3;
  long long v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v4;
  __n128 result = *(__n128 *)(v1 + 32);
  long long v6 = *(_OWORD *)(v1 + 48);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v6;
  return result;
}

uint64_t (*simd_double4x3.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  __n128 result = (uint64_t (*)())malloc(0x30uLL);
  *a1 = result;
  *((void *)result + 4) = a2;
  *((void *)result + 5) = v2;
  switch(a2)
  {
    case 0:
      long long v8 = v2[1];
      *(_OWORD *)__n128 result = *v2;
      *((_OWORD *)result + 1) = v8;
      return simd_double4x3.subscript.modify;
    case 1:
      long long v7 = v2[2];
      long long v6 = v2[3];
      goto LABEL_9;
    case 2:
      long long v7 = v2[4];
      long long v6 = v2[5];
LABEL_9:
      *(_OWORD *)__n128 result = v7;
      *((_OWORD *)result + 1) = v6;
      return simd_double4x3.subscript.modify;
    case 3:
      long long v7 = v2[6];
      long long v6 = v2[7];
      goto LABEL_9;
  }
  __break(1u);
  return result;
}

double simd_double4x3.subscript.getter(uint64_t a1, unint64_t a2)
{
  switch(a1)
  {
    case 0:
      goto LABEL_5;
    case 1:
      v2 += 32;
      goto LABEL_5;
    case 2:
      v2 += 64;
      goto LABEL_5;
    case 3:
      v2 += 96;
LABEL_5:
      if (a2 > 2)
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x212828E78);
      }
      return *(double *)(v2 + 8 * (a2 & 3));
    default:
      goto LABEL_8;
  }
}

uint64_t key path getter for simd_double4x3.subscript(_:_:) : simd_double4x3@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 2)
  {
    result += 64;
  }
  else if (v3 == 1)
  {
    result += 32;
  }
  else if (v3)
  {
    if (v3 != 3) {
      goto LABEL_11;
    }
    result += 96;
  }
  if ((unint64_t)a2[1] <= 2)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 3));
    return result;
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double4x3.subscript(_:_:) : simd_double4x3(uint64_t *result, long long *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = a3[1];
  uint64_t v5 = *result;
  if (!*a3)
  {
    if (v4 <= 2)
    {
      long long v8 = a2[1];
      long long v11 = *a2;
      long long v12 = v8;
      *((void *)&v11 + (v4 & 3)) = v5;
      long long v9 = v12;
      *a2 = v11;
      a2[1] = v9;
      return result;
    }
    goto LABEL_16;
  }
  switch(v3)
  {
    case 1:
      long long v7 = a2[2];
      long long v6 = a2[3];
      break;
    case 2:
      long long v7 = a2[4];
      long long v6 = a2[5];
      break;
    case 3:
      long long v7 = a2[6];
      long long v6 = a2[7];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }
  if (v4 > 2)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  long long v13 = v7;
  long long v14 = v6;
  *((void *)&v13 + (v4 & 3)) = v5;
  long long v10 = v14;
  if (v3 == 1)
  {
    a2[2] = v13;
    a2[3] = v10;
  }
  else if (v3 == 2)
  {
    a2[4] = v13;
    a2[5] = v10;
  }
  else
  {
    a2[6] = v13;
    a2[7] = v10;
  }
  return result;
}

uint64_t simd_double4x3.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  switch(result)
  {
    case 0:
      if (a2 <= 2)
      {
        long long v6 = v3[1];
        long long v9 = *v3;
        long long v10 = v6;
        *((double *)&v9 + (a2 & 3)) = a3;
        long long v7 = v10;
        *uint64_t v3 = v9;
        v3[1] = v7;
        return result;
      }
      goto LABEL_16;
    case 1:
      long long v5 = v3[2];
      long long v4 = v3[3];
      break;
    case 2:
      long long v5 = v3[4];
      long long v4 = v3[5];
      break;
    case 3:
      long long v5 = v3[6];
      long long v4 = v3[7];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }
  if (a2 > 2)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  long long v11 = v5;
  long long v12 = v4;
  *((double *)&v11 + (a2 & 3)) = a3;
  long long v8 = v12;
  if (result == 1)
  {
    v3[2] = v11;
    v3[3] = v8;
  }
  else if (result == 2)
  {
    v3[4] = v11;
    v3[5] = v8;
  }
  else
  {
    v3[6] = v11;
    v3[7] = v8;
  }
  return result;
}

uint64_t (*simd_double4x3.subscript.modify(uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  if (a2)
  {
    switch(a2)
    {
      case 1:
        long long v5 = v3[2];
        long long v4 = v3[3];
        break;
      case 2:
        long long v5 = v3[4];
        long long v4 = v3[5];
        break;
      case 3:
        long long v5 = v3[6];
        long long v4 = v3[7];
        break;
      default:
        goto LABEL_12;
    }
  }
  else
  {
    long long v5 = *v3;
    long long v4 = v3[1];
  }
  if (a3 <= 2)
  {
    v6[0] = v5;
    v6[1] = v4;
    *(void *)__n128 result = *((void *)v6 + (a3 & 3));
    return simd_double4x3.subscript.modify;
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t simd_double4x3.debugDescription.getter()
{
  return simd_double4x3.debugDescription.getter(0x8000000212834850, (uint64_t (*)(__n128, __n128))specialized SIMD3._descriptionAsArray.getter);
}

unint64_t static simd_double4x3.== infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)), vandq_s8((int8x16_t)vceqq_f64(a1[4], a2[4]), (int8x16_t)vceqq_f64(a1[6], a2[6])));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), vandq_s8((int8x16_t)vshlq_n_s64((int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])), vandq_s8((int8x16_t)vceqq_f64(a1[5], a2[5]), (int8x16_t)vceqq_f64(a1[7], a2[7]))), 0x3FuLL), (int8x16_t)v2)).u64[0] >> 63;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double4x3(_OWORD *a1, long long *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_double4x3(a1, a2, a3, a4, (uint64_t (*)(_OWORD *, _OWORD *))simd_equal);
}

int64x2_t simd_double4x3.transpose.getter@<Q0>(int64x2_t *a1@<X8>)
{
  int64x2_t v2 = v1[2];
  int64x2_t v3 = v1[4];
  int64x2_t v4 = v1[6];
  int64x2_t v5 = vzip2q_s64(*v1, v2);
  int64x2_t result = vzip1q_s64(v1[1], v1[3]);
  int64x2_t v7 = vzip1q_s64(v1[5], v1[7]);
  *a1 = vzip1q_s64(*v1, v2);
  a1[1] = vzip1q_s64(v3, v4);
  a1[2] = v5;
  a1[3] = vzip2q_s64(v3, v4);
  a1[4] = result;
  a1[5] = v7;
  return result;
}

float64x2_t static simd_double4x3.+ infix(_:_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vaddq_f64(a2[1], a1[1]);
  float64x2_t v4 = vaddq_f64(a2[2], a1[2]);
  float64x2_t v5 = vaddq_f64(a2[3], a1[3]);
  float64x2_t v6 = vaddq_f64(a2[4], a1[4]);
  float64x2_t v7 = vaddq_f64(a2[5], a1[5]);
  float64x2_t v8 = vaddq_f64(a2[6], a1[6]);
  float64x2_t v9 = vaddq_f64(a2[7], a1[7]);
  *a3 = vaddq_f64(*a2, *a1);
  a3[1] = result;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v6;
  a3[5] = v7;
  a3[6] = v8;
  a3[7] = v9;
  return result;
}

float64x2_t static simd_double4x3.- prefix(_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X8>)
{
  float64x2_t result = vsubq_f64((float64x2_t)0, a1[1]);
  float64x2_t v3 = vsubq_f64((float64x2_t)0, a1[2]);
  float64x2_t v4 = vsubq_f64((float64x2_t)0, a1[3]);
  float64x2_t v5 = vsubq_f64((float64x2_t)0, a1[4]);
  float64x2_t v6 = vsubq_f64((float64x2_t)0, a1[5]);
  float64x2_t v7 = vsubq_f64((float64x2_t)0, a1[6]);
  float64x2_t v8 = vsubq_f64((float64x2_t)0, a1[7]);
  *a2 = vsubq_f64((float64x2_t)0, *a1);
  a2[1] = result;
  a2[2] = v3;
  a2[3] = v4;
  a2[4] = v5;
  a2[5] = v6;
  a2[6] = v7;
  a2[7] = v8;
  return result;
}

float64x2_t static simd_double4x3.- infix(_:_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vsubq_f64(a1[1], a2[1]);
  float64x2_t v4 = vsubq_f64(a1[2], a2[2]);
  float64x2_t v5 = vsubq_f64(a1[3], a2[3]);
  float64x2_t v6 = vsubq_f64(a1[4], a2[4]);
  float64x2_t v7 = vsubq_f64(a1[5], a2[5]);
  float64x2_t v8 = vsubq_f64(a1[6], a2[6]);
  float64x2_t v9 = vsubq_f64(a1[7], a2[7]);
  *a3 = vsubq_f64(*a1, *a2);
  a3[1] = result;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v6;
  a3[5] = v7;
  a3[6] = v8;
  a3[7] = v9;
  return result;
}

float64x2_t static simd_double4x3.+= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vaddq_f64(a2[1], a1[1]);
  float64x2_t result = vaddq_f64(*a2, *a1);
  float64x2_t v4 = vaddq_f64(a2[3], a1[3]);
  float64x2_t v5 = vaddq_f64(a2[2], a1[2]);
  float64x2_t v6 = vaddq_f64(a2[5], a1[5]);
  float64x2_t v7 = vaddq_f64(a2[4], a1[4]);
  float64x2_t v8 = vaddq_f64(a2[7], a1[7]);
  float64x2_t v9 = vaddq_f64(a2[6], a1[6]);
  *a1 = result;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  a1[6] = v9;
  a1[7] = v8;
  return result;
}

float64x2_t static simd_double4x3.-= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vsubq_f64(a1[1], a2[1]);
  float64x2_t result = vsubq_f64(*a1, *a2);
  float64x2_t v4 = vsubq_f64(a1[3], a2[3]);
  float64x2_t v5 = vsubq_f64(a1[2], a2[2]);
  float64x2_t v6 = vsubq_f64(a1[5], a2[5]);
  float64x2_t v7 = vsubq_f64(a1[4], a2[4]);
  float64x2_t v8 = vsubq_f64(a1[7], a2[7]);
  float64x2_t v9 = vsubq_f64(a1[6], a2[6]);
  *a1 = result;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  a1[6] = v9;
  a1[7] = v8;
  return result;
}

float64x2_t static simd_double4x3.* infix(_:_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X8>, float64x2_t a3@<Q0>)
{
  float64x2_t v3 = vmulq_n_f64(*a1, a3.f64[0]);
  float64x2_t v4 = vmulq_f64(a3, a1[1]);
  float64x2_t v5 = vmulq_n_f64(a1[2], a3.f64[0]);
  float64x2_t v6 = vmulq_f64(a3, a1[3]);
  float64x2_t v7 = vmulq_n_f64(a1[4], a3.f64[0]);
  float64x2_t v8 = vmulq_f64(a3, a1[5]);
  float64x2_t v9 = vmulq_n_f64(a1[6], a3.f64[0]);
  float64x2_t result = vmulq_f64(a3, a1[7]);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = v8;
  a2[6] = v9;
  a2[7] = result;
  return result;
}

{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t result;

  float64x2_t v3 = vmulq_n_f64(*a1, a3.f64[0]);
  float64x2_t v4 = vmulq_f64(a3, a1[1]);
  float64x2_t v5 = vmulq_n_f64(a1[2], a3.f64[0]);
  float64x2_t v6 = vmulq_f64(a3, a1[3]);
  float64x2_t v7 = vmulq_n_f64(a1[4], a3.f64[0]);
  float64x2_t v8 = vmulq_f64(a3, a1[5]);
  float64x2_t v9 = vmulq_n_f64(a1[6], a3.f64[0]);
  float64x2_t result = vmulq_f64(a3, a1[7]);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = v8;
  a2[6] = v9;
  a2[7] = result;
  return result;
}

float64x2_t static simd_double4x3.*= infix(_:_:)(float64x2_t *a1, float64x2_t a2)
{
  float64x2_t v2 = vmulq_f64(a2, a1[1]);
  float64x2_t v3 = vmulq_n_f64(*a1, a2.f64[0]);
  float64x2_t v4 = vmulq_f64(a2, a1[3]);
  float64x2_t v5 = vmulq_n_f64(a1[2], a2.f64[0]);
  float64x2_t v6 = vmulq_f64(a2, a1[5]);
  float64x2_t v7 = vmulq_n_f64(a1[4], a2.f64[0]);
  float64x2_t v8 = vmulq_f64(a2, a1[7]);
  float64x2_t result = vmulq_n_f64(a1[6], a2.f64[0]);
  *a1 = v3;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  a1[6] = result;
  a1[7] = v8;
  return result;
}

double static simd_double4x3.* infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a2, 1), a1[4], a3.f64[0]), a1[6], a3, 1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a2, 1), a1[4], a3.f64[0]), a1[6], a3, 1);
  return result;
}

double static simd_double4x3.* infix(_:_:)(int64x2_t *a1, float64x2_t a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)vzip1q_s64(*a1, a1[2]), a2.f64[0]), (float64x2_t)vzip2q_s64(*a1, a1[2]), a2, 1), (float64x2_t)vzip1q_s64(a1[1], a1[3]), a3);
  return result;
}

float64x2_t static simd_double4x3.* infix(_:_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t v3 = a2[1];
  float64x2_t v5 = a2[2];
  float64x2_t v4 = a2[3];
  float64x2_t v7 = a2[4];
  float64x2_t v6 = a2[5];
  float64x2_t v8 = a1[1];
  float64x2_t v10 = a1[2];
  float64x2_t v9 = a1[3];
  float64x2_t v11 = a1[4];
  float64x2_t v12 = a1[5];
  float64x2_t v14 = a1[6];
  float64x2_t v13 = a1[7];
  float64x2_t v15 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v10, *a2, 1), v11, v3.f64[0]), v14, v3, 1);
  float64x2_t v16 = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v8, *a2), v9, *a2, 1), v3, v12), v13, v3, 1);
  float64x2_t v17 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v5.f64[0]), v10, v5, 1), v11, v4.f64[0]), v14, v4, 1);
  float64x2_t result = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v8, v5), v9, v5, 1), v4, v12), v13, v4, 1);
  float64x2_t v19 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v7.f64[0]), v10, v7, 1), v11, v6.f64[0]), v14, v6, 1);
  *a3 = v15;
  a3[1] = v16;
  a3[2] = v17;
  a3[3] = result;
  a3[4] = v19;
  a3[5] = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v8, v7), v9, v7, 1), v6, v12), v13, v6, 1);
  return result;
}

{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t result;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;

  float64x2_t v3 = a2[1];
  float64x2_t v5 = a2[2];
  float64x2_t v4 = a2[3];
  float64x2_t v7 = a2[4];
  float64x2_t v6 = a2[5];
  float64x2_t v9 = a2[6];
  float64x2_t result = a2[7];
  float64x2_t v10 = a1[1];
  float64x2_t v12 = a1[2];
  float64x2_t v11 = a1[3];
  float64x2_t v13 = a1[4];
  float64x2_t v14 = a1[5];
  float64x2_t v16 = a1[6];
  float64x2_t v15 = a1[7];
  float64x2_t v17 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v12, *a2, 1), v13, v3.f64[0]), v16, v3, 1);
  Swift::String v18 = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, *a2), v11, *a2, 1), v3, v14), v15, v3, 1);
  float64x2_t v19 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v5.f64[0]), v12, v5, 1), v13, v4.f64[0]), v16, v4, 1);
  uint64_t v20 = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, v5), v11, v5, 1), v4, v14), v15, v4, 1);
  v21 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v7.f64[0]), v12, v7, 1), v13, v6.f64[0]), v16, v6, 1);
  uint64_t v22 = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, v7), v11, v7, 1), v6, v14), v15, v6, 1);
  v23 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v9.f64[0]), v12, v9, 1), v13, result.f64[0]), v16, result, 1);
  *a3 = v17;
  a3[1] = v18;
  a3[2] = v19;
  a3[3] = v20;
  a3[4] = v21;
  a3[5] = v22;
  a3[6] = v23;
  a3[7] = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, v9), v11, v9, 1), result, v14), v15, result, 1);
  return result;
}

float64x2_t static simd_double4x3.*= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = a2[1];
  float64x2_t v4 = a2[2];
  float64x2_t v3 = a2[3];
  float64x2_t v6 = a2[4];
  float64x2_t v5 = a2[5];
  float64x2_t v8 = a2[6];
  float64x2_t result = a2[7];
  float64x2_t v9 = a1[1];
  float64x2_t v10 = a1[2];
  float64x2_t v11 = a1[3];
  float64x2_t v13 = a1[4];
  float64x2_t v12 = a1[5];
  float64x2_t v14 = a1[6];
  float64x2_t v15 = a1[7];
  float64x2_t v16 = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v9, *a2), v11, *a2, 1), v2, v12), v15, v2, 1);
  float64x2_t v17 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v10, *a2, 1), v13, v2.f64[0]), v14, v2, 1);
  float64x2_t v18 = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v9, v4), v11, v4, 1), v3, v12), v15, v3, 1);
  float64x2_t v19 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v4.f64[0]), v10, v4, 1), v13, v3.f64[0]), v14, v3, 1);
  float64x2_t v20 = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v9, v6), v11, v6, 1), v5, v12), v15, v5, 1);
  float64x2_t v21 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v6.f64[0]), v10, v6, 1), v13, v5.f64[0]), v14, v5, 1);
  float64x2_t v22 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v8.f64[0]), v10, v8, 1), v13, result.f64[0]);
  *a1 = v17;
  a1[1] = v16;
  a1[2] = v19;
  a1[3] = v18;
  a1[4] = v21;
  a1[5] = v20;
  a1[6] = vmlaq_laneq_f64(v22, v14, result, 1);
  a1[7] = vmlaq_laneq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v9, v8), v11, v8, 1), result, v12), v15, result, 1);
  return result;
}

int64x2_t matrix_from_rows(_:_:_:)@<Q0>(int64x2_t *a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>, int64x2_t a4@<Q2>, int64x2_t a5@<Q3>, int64x2_t a6@<Q4>, int64x2_t a7@<Q5>)
{
  *a1 = vzip1q_s64(a2, a4);
  a1[1] = a6;
  a1[2] = vzip2q_s64(a2, a4);
  a1[3] = vdupq_laneq_s64(a6, 1);
  int64x2_t result = vzip2q_s64(a3, a5);
  a1[4] = vzip1q_s64(a3, a5);
  a1[5] = a7;
  a1[6] = result;
  a1[7] = vdupq_laneq_s64(a7, 1);
  return result;
}

void simd_double3x3.init(_:_:_:)(__n128 *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>, __n128 a6@<Q4>, __n128 a7@<Q5>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
  a1[4] = a6;
  a1[5] = a7;
}

void __swiftcall matrix_transpose(_:)(simd_double3x4 *__return_ptr retstr, simd_double4x3 *a2)
{
  int64x2_t v2 = *(int64x2_t *)a2->columns[1].f64;
  int64x2_t v3 = *(int64x2_t *)a2->columns[2].f64;
  int64x2_t v4 = *(int64x2_t *)a2->columns[3].f64;
  int64x2_t v5 = vzip2q_s64(*(int64x2_t *)a2->columns[0].f64, v2);
  int64x2_t v6 = vzip1q_s64(*(int64x2_t *)&a2->columns[0].f64[2], *(int64x2_t *)&a2->columns[1].f64[2]);
  int64x2_t v7 = vzip1q_s64(*(int64x2_t *)&a2->columns[2].f64[2], *(int64x2_t *)&a2->columns[3].f64[2]);
  *(int64x2_t *)retstr->columns[0].f64 = vzip1q_s64(*(int64x2_t *)a2->columns[0].f64, v2);
  *(int64x2_t *)&retstr->columns[0].f64[2] = vzip1q_s64(v3, v4);
  *(int64x2_t *)retstr->columns[1].f64 = v5;
  *(int64x2_t *)&retstr->columns[1].f64[2] = vzip2q_s64(v3, v4);
  *(int64x2_t *)retstr->columns[2].f64 = v6;
  *(int64x2_t *)&retstr->columns[2].f64[2] = v7;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double4x3 *a1, simd_double4x3 *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[1].f64, *(float64x2_t *)a2->columns[1].f64), (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[0].f64, *(float64x2_t *)a2->columns[0].f64)), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[2].f64, *(float64x2_t *)a2->columns[2].f64), (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[3].f64, *(float64x2_t *)a2->columns[3].f64)));
  return vandq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), vandq_s8((int8x16_t)vshlq_n_s64((int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&a1->columns[1].f64[2], *(float64x2_t *)&a2->columns[1].f64[2]), (int8x16_t)vceqq_f64(*(float64x2_t *)&a1->columns[0].f64[2], *(float64x2_t *)&a2->columns[0].f64[2])), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&a1->columns[2].f64[2], *(float64x2_t *)&a2->columns[2].f64[2]), (int8x16_t)vceqq_f64(*(float64x2_t *)&a1->columns[3].f64[2], *(float64x2_t *)&a2->columns[3].f64[2]))), 0x3FuLL),
             (int8x16_t)v2)).u64[0] >> 63;
}

void __swiftcall simd_double2x4.init(rows:)(simd_double2x4 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 4)
  {
    int64x2_t v2 = (const double *)((char *)rows._rawValue + 32);
    vld2q_f64(v2);
    int64x2_t v3 = (const double *)((char *)rows._rawValue + 64);
    vld2q_f64(v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

unint64_t simd_double2x4.subscript.getter(unint64_t result)
{
  if (result > 1) {
    __break(1u);
  }
  return result;
}

uint64_t simd_double2x3.subscript.setter(uint64_t result, __n128 a2, __n128 a3)
{
  if (!result) {
    goto LABEL_4;
  }
  if (result == 1)
  {
    v3 += 2;
LABEL_4:
    *int64x2_t v3 = a2;
    v3[1] = a3;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t (*simd_double2x4.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  int64x2_t result = (uint64_t (*)())malloc(0x28uLL);
  *a1 = result;
  *((void *)result + 4) = v2;
  if (!a2)
  {
    long long v6 = v2[1];
    *(_OWORD *)int64x2_t result = *v2;
    *((_OWORD *)result + 1) = v6;
    return simd_double2x4.subscript.modify;
  }
  if (a2 == 1)
  {
    long long v8 = v2[3];
    *(_OWORD *)int64x2_t result = v2[2];
    *((_OWORD *)result + 1) = v8;
    return simd_double2x4.subscript.modify;
  }
  __break(1u);
  return result;
}

unint64_t simd_double2x4.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 1)
  {
    if (a2 <= 3) {
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double2x4.subscript(_:_:) : simd_double2x4(uint64_t *result, uint64_t a2, void *a3)
{
  unint64_t v3 = a3[1];
  uint64_t v4 = *result;
  if (!*a3)
  {
    if (v3 <= 3)
    {
      *(void *)(a2 + 8 * v3) = v4;
      return result;
    }
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*a3 == 1)
  {
    if (v3 <= 3)
    {
      *(void *)(a2 + 32 + 8 * v3) = v4;
      return result;
    }
    goto LABEL_7;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t simd_double2x4.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  if (!result)
  {
    if (a2 > 3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (result == 1)
  {
    if (a2 > 3)
    {
LABEL_8:
      __break(1u);
      goto LABEL_9;
    }
    v3 += 32;
LABEL_7:
    *(double *)(v3 + 8 * a2) = a3;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t (*simd_double2x4.subscript.modify(uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_7;
    }
    v3 += 32;
  }
  if (a3 <= 3)
  {
    *(void *)int64x2_t result = *(void *)(v3 + 8 * (a3 & 3));
    return simd_double2x3.subscript.modify;
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

double simd_double2x3.subscript.modify(uint64_t a1)
{
  double result = *(double *)a1;
  *(void *)(*(void *)(a1 + 24) + 32 * (*(void *)(a1 + 8) != 0) + 8 * *(unsigned int *)(a1 + 16)) = *(void *)a1;
  return result;
}

unint64_t simd_double2x4.debugDescription.getter()
{
  _StringGuts.grow(_:)(24);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  String.append(_:)(v1);
  v2._countAndFlagsBits = specialized SIMD4._descriptionAsArray.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 10589;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  return 0xD000000000000010;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_double2x4()
{
  return simd_double2x4.debugDescription.getter();
}

unint64_t static simd_double2x4.== infix(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, float64x2_t a6, float64x2_t a7, float64x2_t a8)
{
  int64x2_t v8 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a3, a7), (int8x16_t)vceqq_f64(a1, a5)), vandq_s8((int8x16_t)vceqq_f64(a4, a8), (int8x16_t)vceqq_f64(a2, a6)));
  return vandq_s8((int8x16_t)v8, (int8x16_t)vdupq_laneq_s64(v8, 1)).u64[0] >> 63;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double2x4(_OWORD *a1, long long *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_double2x3(a1, a2, a3, a4, (uint64_t (*)(_OWORD *, _OWORD *))simd_equal);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double2x3(_OWORD *a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_OWORD *, _OWORD *))
{
  long long v5 = a1[1];
  long long v6 = a1[2];
  long long v7 = a1[3];
  long long v8 = *a2;
  long long v9 = a2[1];
  long long v10 = a2[2];
  long long v11 = a2[3];
  v14[0] = *a1;
  v14[1] = v5;
  v14[2] = v6;
  v14[3] = v7;
  v13[0] = v8;
  v13[1] = v9;
  v13[2] = v10;
  v13[3] = v11;
  return a5(v14, v13);
}

double static simd_double2x4.+ infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(a1, a5);
  return result;
}

double static simd_double2x4.- prefix(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64((float64x2_t)0, a1);
  return result;
}

double static simd_double2x4.- infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(a1, a5);
  return result;
}

float64x2_t static simd_double2x4.+= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  float64x2_t v5 = vaddq_f64(a3, a1[1]);
  float64x2_t result = vaddq_f64(a2, *a1);
  float64x2_t v7 = vaddq_f64(a5, a1[3]);
  float64x2_t v8 = vaddq_f64(a4, a1[2]);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v8;
  a1[3] = v7;
  return result;
}

float64x2_t static simd_double2x4.-= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  float64x2_t v5 = vsubq_f64(a1[1], a3);
  float64x2_t result = vsubq_f64(*a1, a2);
  float64x2_t v7 = vsubq_f64(a1[3], a5);
  float64x2_t v8 = vsubq_f64(a1[2], a4);
  *a1 = result;
  a1[1] = v5;
  a1[2] = v8;
  a1[3] = v7;
  return result;
}

double static simd_double2x4.* infix(_:_:)(double a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a2, a1);
  return result;
}

double static simd_double2x4.* infix(_:_:)(float64x2_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, a5);
  return result;
}

float64x2_t static simd_double2x4.*= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64x2_t v2 = vmulq_n_f64(a1[1], a2);
  float64x2_t v3 = vmulq_n_f64(*a1, a2);
  float64x2_t v4 = vmulq_n_f64(a1[3], a2);
  float64x2_t result = vmulq_n_f64(a1[2], a2);
  *a1 = v3;
  a1[1] = v2;
  a1[2] = result;
  a1[3] = v4;
  return result;
}

double static simd_double2x4.* infix(_:_:)(float64x2_t a1, double a2, float64x2_t a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64(a1, a5.f64[0]), a3, a5, 1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmulq_n_f64(a1, a5.f64[0]), a3, a5, 1);
  return result;
}

double static simd_double2x4.* infix(_:_:)(float64x2_t a1, float64x2_t a2, int64x2_t a3, int64x2_t a4, int64x2_t a5, int64x2_t a6)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)vzip1q_s64(a3, a5), a1.f64[0]), (float64x2_t)vzip2q_s64(a3, a5), a1, 1), (float64x2_t)vzip1q_s64(a4, a6), a2.f64[0]), (float64x2_t)vzip2q_s64(a4, a6), a2, 1);
  return result;
}

float64x2_t static simd_double2x4.* infix(_:_:)@<Q0>(float64x2_t *a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>, float64x2_t a7@<Q5>, float64x2_t a8@<Q6>)
{
  float64x2_t v8 = vmlaq_laneq_f64(vmulq_n_f64(a2, a6.f64[0]), a4, a6, 1);
  float64x2_t v9 = vmlaq_laneq_f64(vmulq_n_f64(a2, a7.f64[0]), a4, a7, 1);
  float64x2_t result = vmlaq_laneq_f64(vmulq_n_f64(a2, a8.f64[0]), a4, a8, 1);
  *a1 = v8;
  a1[1] = vmlaq_laneq_f64(vmulq_n_f64(a3, a6.f64[0]), a5, a6, 1);
  a1[2] = v9;
  a1[3] = vmlaq_laneq_f64(vmulq_n_f64(a3, a7.f64[0]), a5, a7, 1);
  a1[4] = result;
  a1[5] = vmlaq_laneq_f64(vmulq_n_f64(a3, a8.f64[0]), a5, a8, 1);
  return result;
}

float64x2_t static simd_double2x4.* infix(_:_:)@<Q0>(float64x2_t *a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>, float64x2_t a7@<Q5>, float64x2_t a8@<Q6>, float64x2_t a9@<Q7>)
{
  float64x2_t v9 = vmlaq_laneq_f64(vmulq_n_f64(a2, a6.f64[0]), a4, a6, 1);
  float64x2_t v10 = vmlaq_laneq_f64(vmulq_n_f64(a2, a7.f64[0]), a4, a7, 1);
  float64x2_t v11 = vmlaq_laneq_f64(vmulq_n_f64(a2, a8.f64[0]), a4, a8, 1);
  float64x2_t result = vmlaq_laneq_f64(vmulq_n_f64(a2, a9.f64[0]), a4, a9, 1);
  *a1 = v9;
  a1[1] = vmlaq_laneq_f64(vmulq_n_f64(a3, a6.f64[0]), a5, a6, 1);
  a1[2] = v10;
  a1[3] = vmlaq_laneq_f64(vmulq_n_f64(a3, a7.f64[0]), a5, a7, 1);
  a1[4] = v11;
  a1[5] = vmlaq_laneq_f64(vmulq_n_f64(a3, a8.f64[0]), a5, a8, 1);
  a1[6] = result;
  a1[7] = vmlaq_laneq_f64(vmulq_n_f64(a3, a9.f64[0]), a5, a9, 1);
  return result;
}

float64x2_t static simd_double2x4.*= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v3 = a1[1];
  float64x2_t v4 = a1[2];
  float64x2_t v5 = a1[3];
  float64x2_t v6 = vmlaq_laneq_f64(vmulq_n_f64(v3, a2.f64[0]), v5, a2, 1);
  float64x2_t v7 = vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), v4, a2, 1);
  float64x2_t v8 = vmulq_n_f64(*a1, a3.f64[0]);
  *a1 = v7;
  a1[1] = v6;
  float64x2_t result = vmlaq_laneq_f64(v8, v4, a3, 1);
  a1[2] = result;
  a1[3] = vmlaq_laneq_f64(vmulq_n_f64(v3, a3.f64[0]), v5, a3, 1);
  return result;
}

double matrix_transpose(_:)(int64x2_t a1, int64x2_t a2)
{
  *(void *)&double result = vzip1q_s64(a1, a2).u64[0];
  return result;
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double2x4 *a1, simd_double2x4 *a2)
{
  int64x2_t v10 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v4, v8), (int8x16_t)vceqq_f64(v2, v6)), vandq_s8((int8x16_t)vceqq_f64(v5, v9), (int8x16_t)vceqq_f64(v3, v7)));
  return vandq_s8((int8x16_t)v10, (int8x16_t)vdupq_laneq_s64(v10, 1)).u64[0] >> 63;
}

void __swiftcall simd_double3x4.init(rows:)(simd_double3x4 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 4)
  {
    int64x2_t v9 = *((int64x2_t *)rows._rawValue + 3);
    int64x2_t v6 = *((int64x2_t *)rows._rawValue + 2);
    int64x2_t v7 = *((int64x2_t *)rows._rawValue + 5);
    int64x2_t v4 = *((int64x2_t *)rows._rawValue + 4);
    int64x2_t v10 = *((int64x2_t *)rows._rawValue + 7);
    int64x2_t v5 = *((int64x2_t *)rows._rawValue + 6);
    int64x2_t v8 = *((int64x2_t *)rows._rawValue + 9);
    int64x2_t v3 = *((int64x2_t *)rows._rawValue + 8);
    swift_bridgeObjectRelease();
    *(int64x2_t *)retstr->columns[0].f64 = vzip1q_s64(v6, v4);
    *(int64x2_t *)&retstr->columns[0].f64[2] = vzip1q_s64(v5, v3);
    *(int64x2_t *)retstr->columns[1].f64 = vzip2q_s64(v6, v4);
    *(int64x2_t *)&retstr->columns[1].f64[2] = vzip2q_s64(v5, v3);
    *(int64x2_t *)retstr->columns[2].f64 = vzip1q_s64(v9, v7);
    *(int64x2_t *)&retstr->columns[2].f64[2] = vzip1q_s64(v10, v8);
  }
  else
  {
    __break(1u);
  }
}

void __swiftcall simd_double3x4.init(_:)(simd_double3x4 *__return_ptr retstr, simd_double3x4 *a2)
{
  long long v2 = *(_OWORD *)&a2->columns[1].f64[2];
  *(_OWORD *)retstr->columns[1].f64 = *(_OWORD *)a2->columns[1].f64;
  *(_OWORD *)&retstr->columns[1].f64[2] = v2;
  long long v3 = *(_OWORD *)&a2->columns[2].f64[2];
  *(_OWORD *)retstr->columns[2].f64 = *(_OWORD *)a2->columns[2].f64;
  *(_OWORD *)&retstr->columns[2].f64[2] = v3;
  long long v4 = *(_OWORD *)&a2->columns[0].f64[2];
  *(_OWORD *)retstr->columns[0].f64 = *(_OWORD *)a2->columns[0].f64;
  *(_OWORD *)&retstr->columns[0].f64[2] = v4;
}

__n128 simd_double3x4.cmatrix.getter@<Q0>(_OWORD *a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 48);
  a1[2] = *(_OWORD *)(v1 + 32);
  a1[3] = v2;
  long long v3 = *(_OWORD *)(v1 + 80);
  a1[4] = *(_OWORD *)(v1 + 64);
  a1[5] = v3;
  __n128 result = *(__n128 *)v1;
  long long v5 = *(_OWORD *)(v1 + 16);
  *a1 = *(_OWORD *)v1;
  a1[1] = v5;
  return result;
}

unint64_t simd_double3x3.subscript.getter(unint64_t result)
{
  if (result > 2) {
    __break(1u);
  }
  return result;
}

uint64_t simd_double3x3.subscript.setter(uint64_t result, __n128 a2, __n128 a3)
{
  switch(result)
  {
    case 0:
      goto LABEL_6;
    case 1:
      v3 += 2;
LABEL_6:
      *long long v3 = a2;
      v3[1] = a3;
      return result;
    case 2:
      v3 += 4;
      goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t (*simd_double3x4.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  __n128 result = (uint64_t (*)())malloc(0x30uLL);
  *a1 = result;
  *((void *)result + 4) = a2;
  *((void *)result + 5) = v2;
  switch(a2)
  {
    case 0:
      long long v8 = v2[1];
      *(_OWORD *)__n128 result = *v2;
      *((_OWORD *)result + 1) = v8;
      return simd_double4x3.subscript.modify;
    case 1:
      long long v7 = v2[2];
      long long v6 = v2[3];
LABEL_7:
      *(_OWORD *)__n128 result = v7;
      *((_OWORD *)result + 1) = v6;
      return simd_double3x3.subscript.modify;
    case 2:
      long long v7 = v2[4];
      long long v6 = v2[5];
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

void simd_double3x3.subscript.modify(void **a1, char a2)
{
  long long v2 = *a1;
  long long v4 = *(_OWORD *)v2;
  long long v3 = *((_OWORD *)v2 + 1);
  uint64_t v5 = v2[4];
  BOOL v6 = v5 == 1;
  if (a2)
  {
    if (v5 == 1)
    {
LABEL_7:
      long long v7 = (_OWORD *)(v2[5] + 32);
      *long long v7 = v4;
      v7[1] = v3;
LABEL_8:
      free(v2);
      return;
    }
    BOOL v6 = v5 == 2;
    if (v5 == 2)
    {
LABEL_10:
      long long v8 = (_OWORD *)(v2[5] + 64);
      *long long v8 = v4;
      v8[1] = v3;
      goto LABEL_8;
    }
    __break(1u);
  }
  if (v6) {
    goto LABEL_7;
  }
  if (v5 == 2) {
    goto LABEL_10;
  }
  __break(1u);
}

unint64_t simd_double3x4.subscript.getter(unint64_t result, unint64_t a2)
{
  if (result <= 2)
  {
    if (a2 <= 3) {
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t key path getter for simd_double3x4.subscript(_:_:) : simd_double3x4@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 1)
  {
    result += 32;
  }
  else if (v3)
  {
    if (v3 != 2) {
      goto LABEL_9;
    }
    result += 64;
  }
  if ((unint64_t)a2[1] <= 3)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 3));
    return result;
  }
  __break(1u);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double3x4.subscript(_:_:) : simd_double3x4(uint64_t *result, long long *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = a3[1];
  uint64_t v5 = *result;
  if (!*a3)
  {
    if (v4 <= 3)
    {
      long long v8 = a2[1];
      long long v11 = *a2;
      long long v12 = v8;
      *((void *)&v11 + (v4 & 3)) = v5;
      long long v9 = v12;
      *a2 = v11;
      a2[1] = v9;
      return result;
    }
    goto LABEL_12;
  }
  if (v3 == 1)
  {
    long long v7 = a2[2];
    long long v6 = a2[3];
  }
  else
  {
    if (v3 != 2)
    {
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
    }
    long long v7 = a2[4];
    long long v6 = a2[5];
  }
  if (v4 > 3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  long long v13 = v7;
  long long v14 = v6;
  *((void *)&v13 + (v4 & 3)) = v5;
  long long v10 = v14;
  if (v3 == 1)
  {
    a2[2] = v13;
    a2[3] = v10;
  }
  else
  {
    a2[4] = v13;
    a2[5] = v10;
  }
  return result;
}

uint64_t simd_double3x4.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  switch(result)
  {
    case 0:
      if (a2 <= 3)
      {
        long long v6 = v3[1];
        long long v9 = *v3;
        long long v10 = v6;
        *((double *)&v9 + (a2 & 3)) = a3;
        long long v7 = v10;
        *uint64_t v3 = v9;
        v3[1] = v7;
        return result;
      }
      goto LABEL_12;
    case 1:
      long long v5 = v3[2];
      long long v4 = v3[3];
      break;
    case 2:
      long long v5 = v3[4];
      long long v4 = v3[5];
      break;
    default:
LABEL_13:
      __break(1u);
      __break(1u);
      return result;
  }
  if (a2 > 3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  long long v11 = v5;
  long long v12 = v4;
  *((double *)&v11 + (a2 & 3)) = a3;
  long long v8 = v12;
  if (result == 1)
  {
    v3[2] = v11;
    v3[3] = v8;
  }
  else
  {
    v3[4] = v11;
    v3[5] = v8;
  }
  return result;
}

uint64_t (*simd_double3x4.subscript.modify(uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  switch(a2)
  {
    case 0:
      long long v5 = *v3;
      long long v4 = v3[1];
      if (a3 <= 3) {
        goto LABEL_6;
      }
LABEL_9:
      __break(1u);
      break;
    case 1:
      long long v5 = v3[2];
      long long v4 = v3[3];
      if (a3 > 3) {
        goto LABEL_9;
      }
LABEL_6:
      v6[0] = v5;
      v6[1] = v4;
      *(void *)__n128 result = *((void *)v6 + (a3 & 3));
      return simd_double3x3.subscript.modify;
    case 2:
      long long v5 = v3[4];
      long long v4 = v3[5];
      if (a3 <= 3) {
        goto LABEL_6;
      }
      goto LABEL_9;
  }
  __break(1u);
  return result;
}

double simd_double3x3.subscript.modify(uint64_t a1, double a2, double a3, double a4, double a5, double a6, int64x2_t a7, int64x2_t a8)
{
  long long v8 = *(int8x16_t **)(a1 + 24);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    a7.i64[0] = *(void *)(a1 + 8);
    a8.i64[0] = 1;
    int8x16_t v11 = (int8x16_t)vdupq_lane_s64(vceqq_s64(a7, a8).i64[0], 0);
    int8x16_t v12 = vbslq_s8(v11, v8[3], v8[5]);
    int8x16_t v13 = vbslq_s8(v11, v8[2], v8[4]);
    if (v10 == 1) {
      v8 += 2;
    }
    else {
      v8 += 4;
    }
  }
  else
  {
    int8x16_t v13 = *v8;
    int8x16_t v12 = v8[1];
  }
  uint64_t v14 = *(_DWORD *)(a1 + 16) & 3;
  int8x16_t v17 = v13;
  int8x16_t v18 = v12;
  v17.i64[v14] = v9;
  double result = *(double *)v17.i64;
  int8x16_t v16 = v18;
  *long long v8 = v17;
  v8[1] = v16;
  return result;
}

unint64_t simd_double3x4.debugDescription.getter()
{
  return simd_double3x3.debugDescription.getter(0x8000000212834890, (uint64_t (*)(__n128, __n128))specialized SIMD4._descriptionAsArray.getter);
}

unint64_t simd_double3x3.debugDescription.getter(uint64_t a1, uint64_t (*a2)(__n128, __n128))
{
  _StringGuts.grow(_:)(28);
  uint64_t v4 = swift_bridgeObjectRelease();
  __n128 v12 = v2[2];
  __n128 v13 = v2[3];
  __n128 v14 = v2[4];
  __n128 v15 = v2[5];
  v5._countAndFlagsBits = ((uint64_t (*)(uint64_t, __n128, __n128))a2)(v4, *v2, v2[1]);
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 8236;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  v7._countAndFlagsBits = a2(v12, v13);
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 8236;
  v8._object = (void *)0xE200000000000000;
  String.append(_:)(v8);
  v9._countAndFlagsBits = a2(v14, v15);
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 10589;
  v10._object = (void *)0xE200000000000000;
  String.append(_:)(v10);
  return 0xD000000000000010;
}

unint64_t static simd_double3x4.== infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)), (int8x16_t)vceqq_f64(a1[4], a2[4])), vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])), (int8x16_t)vceqq_f64(a1[5], a2[5])));
  return vandq_s8((int8x16_t)v2, (int8x16_t)vdupq_laneq_s64(v2, 1)).u64[0] >> 63;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double3x4(_OWORD *a1, long long *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_double3x3(a1, a2, a3, a4, (uint64_t (*)(_OWORD *, _OWORD *))simd_equal);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double3x3(_OWORD *a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_OWORD *, _OWORD *))
{
  long long v5 = a1[1];
  long long v6 = a1[2];
  long long v7 = a1[3];
  long long v8 = a1[4];
  long long v9 = a1[5];
  long long v10 = *a2;
  long long v11 = a2[1];
  long long v12 = a2[2];
  long long v13 = a2[3];
  long long v14 = a2[4];
  long long v15 = a2[5];
  v18[0] = *a1;
  v18[1] = v5;
  v18[2] = v6;
  v18[3] = v7;
  v18[4] = v8;
  v18[5] = v9;
  v17[0] = v10;
  v17[1] = v11;
  v17[2] = v12;
  v17[3] = v13;
  v17[4] = v14;
  v17[5] = v15;
  return a5(v18, v17);
}

float64x2_t static simd_double3x4.+ infix(_:_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vaddq_f64(a2[1], a1[1]);
  float64x2_t v4 = vaddq_f64(a2[2], a1[2]);
  float64x2_t v5 = vaddq_f64(a2[3], a1[3]);
  float64x2_t v6 = vaddq_f64(a2[4], a1[4]);
  float64x2_t v7 = vaddq_f64(a2[5], a1[5]);
  *a3 = vaddq_f64(*a2, *a1);
  a3[1] = result;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v6;
  a3[5] = v7;
  return result;
}

float64x2_t static simd_double3x4.- prefix(_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X8>)
{
  float64x2_t result = vsubq_f64((float64x2_t)0, a1[1]);
  float64x2_t v3 = vsubq_f64((float64x2_t)0, a1[2]);
  float64x2_t v4 = vsubq_f64((float64x2_t)0, a1[3]);
  float64x2_t v5 = vsubq_f64((float64x2_t)0, a1[4]);
  float64x2_t v6 = vsubq_f64((float64x2_t)0, a1[5]);
  *a2 = vsubq_f64((float64x2_t)0, *a1);
  a2[1] = result;
  a2[2] = v3;
  a2[3] = v4;
  a2[4] = v5;
  a2[5] = v6;
  return result;
}

float64x2_t static simd_double3x4.- infix(_:_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vsubq_f64(a1[1], a2[1]);
  float64x2_t v4 = vsubq_f64(a1[2], a2[2]);
  float64x2_t v5 = vsubq_f64(a1[3], a2[3]);
  float64x2_t v6 = vsubq_f64(a1[4], a2[4]);
  float64x2_t v7 = vsubq_f64(a1[5], a2[5]);
  *a3 = vsubq_f64(*a1, *a2);
  a3[1] = result;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v6;
  a3[5] = v7;
  return result;
}

float64x2_t static simd_double3x4.+= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vaddq_f64(a2[1], a1[1]);
  float64x2_t result = vaddq_f64(*a2, *a1);
  float64x2_t v4 = vaddq_f64(a2[3], a1[3]);
  float64x2_t v5 = vaddq_f64(a2[2], a1[2]);
  float64x2_t v6 = vaddq_f64(a2[5], a1[5]);
  float64x2_t v7 = vaddq_f64(a2[4], a1[4]);
  *a1 = result;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  return result;
}

float64x2_t static simd_double3x4.-= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vsubq_f64(a1[1], a2[1]);
  float64x2_t result = vsubq_f64(*a1, *a2);
  float64x2_t v4 = vsubq_f64(a1[3], a2[3]);
  float64x2_t v5 = vsubq_f64(a1[2], a2[2]);
  float64x2_t v6 = vsubq_f64(a1[5], a2[5]);
  float64x2_t v7 = vsubq_f64(a1[4], a2[4]);
  *a1 = result;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  return result;
}

float64x2_t static simd_double3x4.* infix(_:_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X8>, double a3@<D0>)
{
  float64x2_t v3 = vmulq_n_f64(*a1, a3);
  float64x2_t v4 = vmulq_n_f64(a1[1], a3);
  float64x2_t v5 = vmulq_n_f64(a1[2], a3);
  float64x2_t v6 = vmulq_n_f64(a1[3], a3);
  float64x2_t v7 = vmulq_n_f64(a1[4], a3);
  float64x2_t result = vmulq_n_f64(a1[5], a3);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = result;
  return result;
}

{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t result;

  float64x2_t v3 = vmulq_n_f64(*a1, a3);
  float64x2_t v4 = vmulq_n_f64(a1[1], a3);
  float64x2_t v5 = vmulq_n_f64(a1[2], a3);
  float64x2_t v6 = vmulq_n_f64(a1[3], a3);
  float64x2_t v7 = vmulq_n_f64(a1[4], a3);
  float64x2_t result = vmulq_n_f64(a1[5], a3);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = result;
  return result;
}

float64x2_t static simd_double3x4.*= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64x2_t v2 = vmulq_n_f64(a1[1], a2);
  float64x2_t v3 = vmulq_n_f64(*a1, a2);
  float64x2_t v4 = vmulq_n_f64(a1[3], a2);
  float64x2_t v5 = vmulq_n_f64(a1[2], a2);
  float64x2_t v6 = vmulq_n_f64(a1[5], a2);
  float64x2_t result = vmulq_n_f64(a1[4], a2);
  *a1 = v3;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = result;
  a1[5] = v6;
  return result;
}

double static simd_double3x4.* infix(_:_:)(float64x2_t *a1, float64x2_t a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a2, 1), a1[4], a3);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a2, 1), a1[4], a3);
  return result;
}

double static simd_double3x4.* infix(_:_:)(int64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)vzip1q_s64(*a1, a1[2]), a2.f64[0]), (float64x2_t)vzip2q_s64(*a1, a1[2]), a2, 1), (float64x2_t)vzip1q_s64(a1[1], a1[3]), a3.f64[0]), (float64x2_t)vzip2q_s64(a1[1], a1[3]), a3, 1);
  return result;
}

float64x2_t static simd_double3x4.* infix(_:_:)@<Q0>(float64x2_t *a1@<X0>, uint64_t a2@<X1>, float64x2_t *a3@<X8>)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  float64x2_t v5 = *(float64x2_t *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  float64x2_t v7 = *(float64x2_t *)(a2 + 64);
  long long v6 = *(_OWORD *)(a2 + 80);
  float64x2_t v8 = a1[1];
  float64x2_t v9 = a1[2];
  float64x2_t v10 = a1[3];
  float64x2_t v12 = a1[4];
  float64x2_t v11 = a1[5];
  float64x2_t v13 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, *(double *)a2), v9, *(float64x2_t *)a2, 1), v12, *(double *)&v3);
  float64x2_t v14 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v8, *(double *)a2), v10, *(float64x2_t *)a2, 1), v11, *(double *)&v3);
  float64x2_t result = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v5.f64[0]), v9, v5, 1), v12, *(double *)&v4);
  float64x2_t v16 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v8, v5.f64[0]), v10, v5, 1), v11, *(double *)&v4);
  float64x2_t v17 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v7.f64[0]), v9, v7, 1), v12, *(double *)&v6);
  *a3 = v13;
  a3[1] = v14;
  a3[2] = result;
  a3[3] = v16;
  a3[4] = v17;
  a3[5] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v8, v7.f64[0]), v10, v7, 1), v11, *(double *)&v6);
  return result;
}

{
  long long v3;
  long long v4;
  float64x2_t v5;
  long long v6;
  float64x2_t v7;
  long long v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t result;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;

  long long v3 = *(_OWORD *)(a2 + 16);
  float64x2_t v5 = *(float64x2_t *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  float64x2_t v7 = *(float64x2_t *)(a2 + 64);
  long long v6 = *(_OWORD *)(a2 + 80);
  float64x2_t v9 = *(float64x2_t *)(a2 + 96);
  float64x2_t v8 = *(_OWORD *)(a2 + 112);
  float64x2_t v10 = a1[1];
  float64x2_t v11 = a1[2];
  float64x2_t v12 = a1[3];
  float64x2_t v14 = a1[4];
  float64x2_t v13 = a1[5];
  long long v15 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, *(double *)a2), v11, *(float64x2_t *)a2, 1), v14, *(double *)&v3);
  float64x2_t v16 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, *(double *)a2), v12, *(float64x2_t *)a2, 1), v13, *(double *)&v3);
  float64x2_t result = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v5.f64[0]), v11, v5, 1), v14, *(double *)&v4);
  int8x16_t v18 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, v5.f64[0]), v12, v5, 1), v13, *(double *)&v4);
  float64x2_t v19 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v7.f64[0]), v11, v7, 1), v14, *(double *)&v6);
  float64x2_t v20 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, v7.f64[0]), v12, v7, 1), v13, *(double *)&v6);
  float64x2_t v21 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v9.f64[0]), v11, v9, 1), v14, *(double *)&v8);
  *a3 = v15;
  a3[1] = v16;
  a3[2] = result;
  a3[3] = v18;
  a3[4] = v19;
  a3[5] = v20;
  a3[6] = v21;
  a3[7] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, v9.f64[0]), v12, v9, 1), v13, *(double *)&v8);
  return result;
}

float64x2_t static simd_double3x4.*= infix(_:_:)(float64x2_t *a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  float64x2_t v4 = *(float64x2_t *)(a2 + 32);
  long long v3 = *(_OWORD *)(a2 + 48);
  float64x2_t v6 = *(float64x2_t *)(a2 + 64);
  long long v5 = *(_OWORD *)(a2 + 80);
  float64x2_t v7 = a1[1];
  float64x2_t v9 = a1[2];
  float64x2_t v8 = a1[3];
  float64x2_t v10 = a1[4];
  float64x2_t v11 = a1[5];
  float64x2_t v12 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v7, *(double *)a2), v8, *(float64x2_t *)a2, 1), v11, *(double *)&v2);
  float64x2_t v13 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, *(double *)a2), v9, *(float64x2_t *)a2, 1), v10, *(double *)&v2);
  float64x2_t result = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v7, v4.f64[0]), v8, v4, 1), v11, *(double *)&v3);
  float64x2_t v15 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v4.f64[0]), v9, v4, 1), v10, *(double *)&v3);
  float64x2_t v16 = vmlaq_laneq_f64(vmulq_n_f64(*a1, v6.f64[0]), v9, v6, 1);
  *a1 = v13;
  a1[1] = v12;
  a1[2] = v15;
  a1[3] = result;
  a1[4] = vmlaq_n_f64(v16, v10, *(double *)&v5);
  a1[5] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v7, v6.f64[0]), v8, v6, 1), v11, *(double *)&v5);
  return result;
}

int64x2_t matrix_from_rows(_:_:_:_:)@<Q0>(int64x2_t *a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>, int64x2_t a4@<Q2>, int64x2_t a5@<Q3>, int64x2_t a6@<Q4>, int64x2_t a7@<Q5>, int64x2_t a8@<Q6>, int64x2_t a9@<Q7>)
{
  *a1 = vzip1q_s64(a2, a4);
  a1[1] = vzip1q_s64(a6, a8);
  a1[2] = vzip2q_s64(a2, a4);
  a1[3] = vzip2q_s64(a6, a8);
  int64x2_t result = vzip1q_s64(a7, a9);
  a1[4] = vzip1q_s64(a3, a5);
  a1[5] = result;
  return result;
}

{
  int64x2_t result;

  *a1 = vzip1q_s64(a2, a4);
  a1[1] = vzip1q_s64(a6, a8);
  a1[2] = vzip2q_s64(a2, a4);
  a1[3] = vzip2q_s64(a6, a8);
  a1[4] = vzip1q_s64(a3, a5);
  a1[5] = vzip1q_s64(a7, a9);
  int64x2_t result = vzip2q_s64(a7, a9);
  a1[6] = vzip2q_s64(a3, a5);
  a1[7] = result;
  return result;
}

void __swiftcall matrix_transpose(_:)(simd_double4x3 *__return_ptr retstr, simd_double3x4 *a2)
{
  int64x2_t v2 = *(int64x2_t *)&a2->columns[0].f64[2];
  int64x2_t v4 = *(int64x2_t *)a2->columns[1].f64;
  int64x2_t v3 = *(int64x2_t *)&a2->columns[1].f64[2];
  int64x2_t v6 = *(int64x2_t *)a2->columns[2].f64;
  int64x2_t v5 = *(int64x2_t *)&a2->columns[2].f64[2];
  int64x2_t v7 = vzip2q_s64(*(int64x2_t *)a2->columns[0].f64, v4);
  *(int64x2_t *)retstr->columns[0].f64 = vzip1q_s64(*(int64x2_t *)a2->columns[0].f64, v4);
  *(int64x2_t *)&retstr->columns[0].f64[2] = v6;
  *(int64x2_t *)retstr->columns[1].f64 = v7;
  *(int64x2_t *)&retstr->columns[1].f64[2] = vdupq_laneq_s64(v6, 1);
  *(int64x2_t *)retstr->columns[2].f64 = vzip1q_s64(v2, v3);
  *(int64x2_t *)&retstr->columns[2].f64[2] = v5;
  *(int64x2_t *)retstr->columns[3].f64 = vzip2q_s64(v2, v3);
  *(int64x2_t *)&retstr->columns[3].f64[2] = vdupq_laneq_s64(v5, 1);
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double3x4 *a1, simd_double3x4 *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[1].f64, *(float64x2_t *)a2->columns[1].f64), (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[0].f64, *(float64x2_t *)a2->columns[0].f64)), (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[2].f64, *(float64x2_t *)a2->columns[2].f64)), vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&a1->columns[1].f64[2], *(float64x2_t *)&a2->columns[1].f64[2]), (int8x16_t)vceqq_f64(*(float64x2_t *)&a1->columns[0].f64[2], *(float64x2_t *)&a2->columns[0].f64[2])), (int8x16_t)vceqq_f64(*(float64x2_t *)&a1->columns[2].f64[2], *(float64x2_t *)&a2->columns[2].f64[2])));
  return vandq_s8((int8x16_t)v2, (int8x16_t)vdupq_laneq_s64(v2, 1)).u64[0] >> 63;
}

void __swiftcall simd_double4x4.init(_:)(simd_double4x4 *__return_ptr retstr, Swift::Double a2)
{
  *(void *)&long long v2 = 0;
  *((Swift::Double *)&v2 + 1) = a2;
  *(_OWORD *)retstr->columns[0].f64 = *(unint64_t *)&a2;
  *(_OWORD *)&retstr->columns[0].f64[2] = 0u;
  *(_OWORD *)retstr->columns[1].f64 = v2;
  *(_OWORD *)&retstr->columns[1].f64[2] = 0u;
  *(_OWORD *)retstr->columns[2].f64 = 0u;
  *(_OWORD *)&retstr->columns[2].f64[2] = *(unint64_t *)&a2;
  *(_OWORD *)retstr->columns[3].f64 = 0u;
  *(_OWORD *)&retstr->columns[3].f64[2] = v2;
}

void simd_double4x4.init(diagonal:)(_OWORD *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>)
{
  *(void *)&long long v3 = 0;
  *((void *)&v3 + 1) = a2.n128_u64[1];
  *(void *)&long long v4 = 0;
  *((void *)&v4 + 1) = a3.n128_u64[1];
  *a1 = a2.n128_u64[0];
  a1[1] = 0u;
  a1[2] = v3;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = a3.n128_u64[0];
  a1[6] = 0u;
  a1[7] = v4;
}

uint64_t simd_double4x3.init(_:)@<X0>(uint64_t result@<X0>, _OWORD *a2@<X8>)
{
  if (*(void *)(result + 16) == 4)
  {
    long long v10 = *(_OWORD *)(result + 32);
    long long v6 = *(_OWORD *)(result + 48);
    long long v9 = *(_OWORD *)(result + 64);
    long long v5 = *(_OWORD *)(result + 80);
    long long v8 = *(_OWORD *)(result + 96);
    long long v7 = *(_OWORD *)(result + 128);
    long long v3 = *(_OWORD *)(result + 144);
    long long v4 = *(_OWORD *)(result + 112);
    int64x2_t result = swift_bridgeObjectRelease();
    *a2 = v10;
    a2[1] = v6;
    a2[2] = v9;
    a2[3] = v5;
    a2[4] = v8;
    a2[5] = v4;
    a2[6] = v7;
    a2[7] = v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void __swiftcall simd_double4x4.init(rows:)(simd_double4x4 *__return_ptr retstr, Swift::OpaquePointer rows)
{
  if (*((void *)rows._rawValue + 2) == 4)
  {
    long long v3 = (const double *)((char *)rows._rawValue + 32);
    float64x2x4_t v7 = vld4q_f64(v3);
    float64x2x4_t v6 = v7;
    long long v4 = (const double *)((char *)rows._rawValue + 96);
    float64x2x4_t v8 = vld4q_f64(v4);
    float64x2x4_t v5 = v8;
    swift_bridgeObjectRelease();
    *(float64x2_t *)retstr->columns[0].f64 = v6.val[0];
    *(float64x2_t *)&retstr->columns[0].f64[2] = v5.val[0];
    *(float64x2_t *)retstr->columns[1].f64 = v6.val[1];
    *(float64x2_t *)&retstr->columns[1].f64[2] = v5.val[1];
    *(float64x2_t *)retstr->columns[2].f64 = v6.val[2];
    *(float64x2_t *)&retstr->columns[2].f64[2] = v5.val[2];
    *(float64x2_t *)retstr->columns[3].f64 = v6.val[3];
    *(float64x2_t *)&retstr->columns[3].f64[2] = v5.val[3];
  }
  else
  {
    __break(1u);
  }
}

int64x2_t simd_double4x4.transpose.getter@<Q0>(uint64_t a1@<X8>)
{
  int64x2_t v2 = *(int64x2_t *)(v1 + 16);
  int64x2_t v4 = *(int64x2_t *)(v1 + 32);
  int64x2_t v3 = *(int64x2_t *)(v1 + 48);
  float64x2x4_t v5 = (const double *)(v1 + 64);
  float64x2x4_t v10 = vld4q_f64(v5);
  int64x2_t v6 = vzip1q_s64(*(int64x2_t *)v1, v4);
  int64x2_t v7 = vzip2q_s64(*(int64x2_t *)v1, v4);
  int64x2_t v8 = vzip1q_s64(v2, v3);
  int64x2_t result = vzip2q_s64(v2, v3);
  *(int64x2_t *)a1 = v6;
  *(float64x2_t *)(a1 + 16) = v10.val[0];
  *(int64x2_t *)(a1 + 32) = v7;
  *(float64x2_t *)(a1 + 48) = v10.val[1];
  *(int64x2_t *)(a1 + 64) = v8;
  *(float64x2_t *)(a1 + 80) = v10.val[2];
  *(int64x2_t *)(a1 + 96) = result;
  *(float64x2_t *)(a1 + 112) = v10.val[3];
  return result;
}

void simd_double4x3.init(_:_:_:_:)(__n128 *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>, __n128 a6@<Q4>, __n128 a7@<Q5>, __n128 a8@<Q6>, __n128 a9@<Q7>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
  a1[4] = a6;
  a1[5] = a7;
  a1[6] = a8;
  a1[7] = a9;
}

void __swiftcall simd_double4x4.init(_:)(simd_double4x4 *__return_ptr retstr, simd_double4x4 *a2)
{
  long long v2 = *(_OWORD *)&a2->columns[2].f64[2];
  *(_OWORD *)retstr->columns[2].f64 = *(_OWORD *)a2->columns[2].f64;
  *(_OWORD *)&retstr->columns[2].f64[2] = v2;
  long long v3 = *(_OWORD *)&a2->columns[3].f64[2];
  *(_OWORD *)retstr->columns[3].f64 = *(_OWORD *)a2->columns[3].f64;
  *(_OWORD *)&retstr->columns[3].f64[2] = v3;
  long long v4 = *(_OWORD *)&a2->columns[0].f64[2];
  *(_OWORD *)retstr->columns[0].f64 = *(_OWORD *)a2->columns[0].f64;
  *(_OWORD *)&retstr->columns[0].f64[2] = v4;
  long long v5 = *(_OWORD *)&a2->columns[1].f64[2];
  *(_OWORD *)retstr->columns[1].f64 = *(_OWORD *)a2->columns[1].f64;
  *(_OWORD *)&retstr->columns[1].f64[2] = v5;
}

__n128 simd_double4x4.cmatrix.getter@<Q0>(uint64_t a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 80) = v2;
  long long v3 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(a1 + 112) = v3;
  long long v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v4;
  __n128 result = *(__n128 *)(v1 + 32);
  long long v6 = *(_OWORD *)(v1 + 48);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v6;
  return result;
}

__n128 simd_double4x3.subscript.getter(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      break;
    case 1:
      v1 += 32;
      break;
    case 2:
      v1 += 64;
      break;
    case 3:
      v1 += 96;
      break;
    default:
      __break(1u);
      JUMPOUT(0x21282ADFCLL);
  }
  return *(__n128 *)v1;
}

uint64_t simd_double4x3.subscript.setter(uint64_t result, __n128 a2, __n128 a3)
{
  switch(result)
  {
    case 0:
      break;
    case 1:
      v3 += 2;
      break;
    case 2:
      v3 += 4;
      break;
    case 3:
      v3 += 6;
      break;
    default:
      __break(1u);
      JUMPOUT(0x21282AE64);
  }
  *long long v3 = a2;
  v3[1] = a3;
  return result;
}

uint64_t (*simd_double4x4.subscript.modify(uint64_t (**a1)(), uint64_t a2))()
{
  __n128 result = (uint64_t (*)())malloc(0x30uLL);
  *a1 = result;
  *((void *)result + 4) = a2;
  *((void *)result + 5) = v2;
  switch(a2)
  {
    case 0:
      long long v8 = v2[1];
      *(_OWORD *)__n128 result = *v2;
      *((_OWORD *)result + 1) = v8;
      return simd_double4x3.subscript.modify;
    case 1:
      long long v7 = v2[2];
      long long v6 = v2[3];
      goto LABEL_9;
    case 2:
      long long v7 = v2[4];
      long long v6 = v2[5];
LABEL_9:
      *(_OWORD *)__n128 result = v7;
      *((_OWORD *)result + 1) = v6;
      return simd_double4x3.subscript.modify;
    case 3:
      long long v7 = v2[6];
      long long v6 = v2[7];
      goto LABEL_9;
  }
  __break(1u);
  return result;
}

void simd_double4x3.subscript.modify(void **a1, char a2)
{
  long long v2 = *a1;
  long long v4 = *(_OWORD *)v2;
  long long v3 = *((_OWORD *)v2 + 1);
  uint64_t v5 = v2[4];
  BOOL v6 = v5 == 1;
  if (a2)
  {
    if (v5 == 1)
    {
LABEL_10:
      long long v8 = (_OWORD *)(v2[5] + 32);
      *long long v8 = v4;
      v8[1] = v3;
      goto LABEL_9;
    }
    if (v5 == 2)
    {
LABEL_8:
      long long v7 = (_OWORD *)(v2[5] + 64);
      *long long v7 = v4;
      v7[1] = v3;
LABEL_9:
      free(v2);
      return;
    }
    BOOL v6 = v5 == 3;
    if (v5 == 3)
    {
LABEL_12:
      long long v9 = (_OWORD *)(v2[5] + 96);
      *long long v9 = v4;
      v9[1] = v3;
      goto LABEL_9;
    }
    __break(1u);
  }
  if (v6) {
    goto LABEL_10;
  }
  if (v5 == 2) {
    goto LABEL_8;
  }
  if (v5 == 3) {
    goto LABEL_12;
  }
  __break(1u);
}

double simd_double4x4.subscript.getter(uint64_t a1, unint64_t a2)
{
  switch(a1)
  {
    case 0:
      goto LABEL_5;
    case 1:
      v2 += 32;
      goto LABEL_5;
    case 2:
      v2 += 64;
      goto LABEL_5;
    case 3:
      v2 += 96;
LABEL_5:
      if (a2 > 3)
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x21282AFFCLL);
      }
      return *(double *)(v2 + 8 * (a2 & 3));
    default:
      goto LABEL_8;
  }
}

uint64_t key path getter for simd_double4x4.subscript(_:_:) : simd_double4x4@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (*a2 == 2)
  {
    result += 64;
  }
  else if (v3 == 1)
  {
    result += 32;
  }
  else if (v3)
  {
    if (v3 != 3) {
      goto LABEL_11;
    }
    result += 96;
  }
  if ((unint64_t)a2[1] <= 3)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 3));
    return result;
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t *key path setter for simd_double4x4.subscript(_:_:) : simd_double4x4(uint64_t *result, long long *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = a3[1];
  uint64_t v5 = *result;
  if (!*a3)
  {
    if (v4 <= 3)
    {
      long long v8 = a2[1];
      long long v11 = *a2;
      long long v12 = v8;
      *((void *)&v11 + (v4 & 3)) = v5;
      long long v9 = v12;
      *a2 = v11;
      a2[1] = v9;
      return result;
    }
    goto LABEL_16;
  }
  switch(v3)
  {
    case 1:
      long long v7 = a2[2];
      long long v6 = a2[3];
      break;
    case 2:
      long long v7 = a2[4];
      long long v6 = a2[5];
      break;
    case 3:
      long long v7 = a2[6];
      long long v6 = a2[7];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }
  if (v4 > 3)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  long long v13 = v7;
  long long v14 = v6;
  *((void *)&v13 + (v4 & 3)) = v5;
  long long v10 = v14;
  if (v3 == 1)
  {
    a2[2] = v13;
    a2[3] = v10;
  }
  else if (v3 == 2)
  {
    a2[4] = v13;
    a2[5] = v10;
  }
  else
  {
    a2[6] = v13;
    a2[7] = v10;
  }
  return result;
}

uint64_t simd_double4x4.subscript.setter(uint64_t result, unint64_t a2, double a3)
{
  switch(result)
  {
    case 0:
      if (a2 <= 3)
      {
        long long v6 = v3[1];
        long long v9 = *v3;
        long long v10 = v6;
        *((double *)&v9 + (a2 & 3)) = a3;
        long long v7 = v10;
        *uint64_t v3 = v9;
        v3[1] = v7;
        return result;
      }
      goto LABEL_16;
    case 1:
      long long v5 = v3[2];
      long long v4 = v3[3];
      break;
    case 2:
      long long v5 = v3[4];
      long long v4 = v3[5];
      break;
    case 3:
      long long v5 = v3[6];
      long long v4 = v3[7];
      break;
    default:
LABEL_17:
      __break(1u);
      __break(1u);
      return result;
  }
  if (a2 > 3)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  long long v11 = v5;
  long long v12 = v4;
  *((double *)&v11 + (a2 & 3)) = a3;
  long long v8 = v12;
  if (result == 1)
  {
    v3[2] = v11;
    v3[3] = v8;
  }
  else if (result == 2)
  {
    v3[4] = v11;
    v3[5] = v8;
  }
  else
  {
    v3[6] = v11;
    v3[7] = v8;
  }
  return result;
}

uint64_t (*simd_double4x4.subscript.modify(uint64_t (*result)(), uint64_t a2, unint64_t a3))()
{
  *((void *)result + 2) = a3;
  *((void *)result + 3) = v3;
  *((void *)result + 1) = a2;
  if (a2)
  {
    switch(a2)
    {
      case 1:
        long long v5 = v3[2];
        long long v4 = v3[3];
        break;
      case 2:
        long long v5 = v3[4];
        long long v4 = v3[5];
        break;
      case 3:
        long long v5 = v3[6];
        long long v4 = v3[7];
        break;
      default:
        goto LABEL_12;
    }
  }
  else
  {
    long long v5 = *v3;
    long long v4 = v3[1];
  }
  if (a3 <= 3)
  {
    v6[0] = v5;
    v6[1] = v4;
    *(void *)__n128 result = *((void *)v6 + (a3 & 3));
    return simd_double4x3.subscript.modify;
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

double simd_double4x3.subscript.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = (long long *)a1[3];
  uint64_t v3 = v2 + 2;
  long long v4 = v2[2];
  uint64_t v5 = *a1;
  long long v6 = v2[3];
  uint64_t v7 = a1[1];
  if (a2)
  {
    switch(v7)
    {
      case 0:
        goto LABEL_4;
      case 1:
        goto LABEL_5;
      case 2:
        goto LABEL_6;
      case 3:
        goto LABEL_7;
      default:
        __break(1u);
        goto LABEL_9;
    }
  }
  switch(v7)
  {
    case 0:
LABEL_4:
      long long v4 = *v2;
      long long v6 = v2[1];
      uint64_t v3 = (_OWORD *)a1[3];
      break;
    case 1:
      break;
    case 2:
LABEL_6:
      long long v4 = v2[4];
      long long v6 = v2[5];
      uint64_t v3 = v2 + 4;
      break;
    case 3:
LABEL_7:
      long long v4 = v2[6];
      long long v6 = v2[7];
      uint64_t v3 = v2 + 6;
      break;
    default:
LABEL_9:
      __break(1u);
      JUMPOUT(0x21282B358);
  }
LABEL_5:
  uint64_t v8 = a1[2] & 3;
  long long v11 = v4;
  long long v12 = v6;
  *((void *)&v11 + v8) = v5;
  double result = *(double *)&v11;
  long long v10 = v12;
  *uint64_t v3 = v11;
  v3[1] = v10;
  return result;
}

unint64_t simd_double4x4.debugDescription.getter()
{
  return simd_double4x3.debugDescription.getter(0x80000002128348B0, (uint64_t (*)(__n128, __n128))specialized SIMD4._descriptionAsArray.getter);
}

unint64_t simd_double4x3.debugDescription.getter(uint64_t a1, uint64_t (*a2)(__n128, __n128))
{
  _StringGuts.grow(_:)(32);
  uint64_t v4 = swift_bridgeObjectRelease();
  __n128 v14 = v2[2];
  __n128 v15 = v2[3];
  __n128 v16 = v2[4];
  __n128 v17 = v2[5];
  __n128 v19 = v2[7];
  __n128 v18 = v2[6];
  v5._countAndFlagsBits = ((uint64_t (*)(uint64_t, __n128, __n128))a2)(v4, *v2, v2[1]);
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 8236;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  v7._countAndFlagsBits = a2(v14, v15);
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 8236;
  v8._object = (void *)0xE200000000000000;
  String.append(_:)(v8);
  v9._countAndFlagsBits = a2(v16, v17);
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 8236;
  v10._object = (void *)0xE200000000000000;
  String.append(_:)(v10);
  v11._countAndFlagsBits = a2(v18, v19);
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 10589;
  v12._object = (void *)0xE200000000000000;
  String.append(_:)(v12);
  return 0xD000000000000010;
}

unint64_t static simd_double4x4.== infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[2], a2[2]), (int8x16_t)vceqq_f64(*a1, *a2)), vandq_s8((int8x16_t)vceqq_f64(a1[4], a2[4]), (int8x16_t)vceqq_f64(a1[6], a2[6]))), vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a1[3], a2[3]), (int8x16_t)vceqq_f64(a1[1], a2[1])), vandq_s8((int8x16_t)vceqq_f64(a1[5], a2[5]), (int8x16_t)vceqq_f64(a1[7], a2[7]))));
  return vandq_s8((int8x16_t)v2, (int8x16_t)vdupq_laneq_s64(v2, 1)).u64[0] >> 63;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double4x4(_OWORD *a1, long long *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance simd_double4x3(a1, a2, a3, a4, (uint64_t (*)(_OWORD *, _OWORD *))simd_equal);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_double4x3(_OWORD *a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_OWORD *, _OWORD *))
{
  long long v5 = a1[1];
  long long v6 = a1[2];
  long long v7 = a1[3];
  long long v8 = a1[4];
  long long v9 = a1[5];
  long long v10 = a1[6];
  long long v11 = a1[7];
  long long v12 = *a2;
  long long v13 = a2[1];
  long long v14 = a2[2];
  long long v15 = a2[3];
  long long v16 = a2[4];
  long long v17 = a2[5];
  long long v18 = a2[6];
  long long v19 = a2[7];
  v22[0] = *a1;
  v22[1] = v5;
  v22[2] = v6;
  v22[3] = v7;
  v22[4] = v8;
  v22[5] = v9;
  v22[6] = v10;
  v22[7] = v11;
  v21[0] = v12;
  v21[1] = v13;
  v21[2] = v14;
  v21[3] = v15;
  v21[4] = v16;
  v21[5] = v17;
  v21[6] = v18;
  v21[7] = v19;
  return a5(v22, v21);
}

double simd_double4x4.inverse.getter@<D0>(_OWORD *a1@<X8>)
{
  __invert_d4();
  double result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  return result;
}

double simd_double4x4.determinant.getter()
{
  uint64_t v1 = v0;
  float64x2x2_t v18 = vld2q_f64(v1->f64);
  v1 += 2;
  float64x2_t v2 = v0[3];
  float64x2_t v3 = v0[4];
  float64x2_t v4 = v0[5];
  float64x2_t v5 = v0[6];
  float64x2_t v6 = v0[7];
  float64x2_t v7 = (float64x2_t)vextq_s8((int8x16_t)v2, *(int8x16_t *)v1, 8uLL);
  float64x2_t v8 = (float64x2_t)vextq_s8(*(int8x16_t *)v1, (int8x16_t)v2, 8uLL);
  float64x2_t v9 = (float64x2_t)vextq_s8((int8x16_t)v6, (int8x16_t)v5, 8uLL);
  float64x2_t v10 = (float64x2_t)vextq_s8((int8x16_t)v5, (int8x16_t)v6, 8uLL);
  float64x2_t v11 = (float64x2_t)vextq_s8((int8x16_t)v4, (int8x16_t)v3, 8uLL);
  float64x2_t v12 = (float64x2_t)vextq_s8((int8x16_t)v3, (int8x16_t)v4, 8uLL);
  float64x2_t v13 = vnegq_f64(v12);
  float64x2_t v14 = vnegq_f64(v11);
  int64x2_t v15 = (int64x2_t)vmlaq_f64(vmlaq_f64(vmulq_f64(*v1, vmlaq_f64(vmulq_f64(v10, v14), v9, v12)), vmlaq_f64(vmulq_f64(v5, v13), v10, v3), v7), vmlaq_f64(vmulq_f64(v9, vnegq_f64(v3)), v5, v11), v8);
  int64x2_t v16 = (int64x2_t)vmlaq_f64(vmlaq_f64(vmulq_f64(v2, vmlaq_f64(vmulq_f64(v9, v13), v10, v11)), vmlaq_f64(vmulq_f64(v6, v14), v9, v4), v8), vmlaq_f64(vmulq_f64(v10, vnegq_f64(v4)), v6, v12), v7);
  return vaddvq_f64(vsubq_f64(vmulq_f64(v18.val[0], (float64x2_t)vzip1q_s64(v16, v15)), vmulq_f64(v18.val[1], (float64x2_t)vzip2q_s64(v16, v15))));
}

float64x2_t static simd_double4x4.+ infix(_:_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vaddq_f64(a2[1], a1[1]);
  float64x2_t v4 = vaddq_f64(a2[2], a1[2]);
  float64x2_t v5 = vaddq_f64(a2[3], a1[3]);
  float64x2_t v6 = vaddq_f64(a2[4], a1[4]);
  float64x2_t v7 = vaddq_f64(a2[5], a1[5]);
  float64x2_t v8 = vaddq_f64(a2[6], a1[6]);
  float64x2_t v9 = vaddq_f64(a2[7], a1[7]);
  *a3 = vaddq_f64(*a2, *a1);
  a3[1] = result;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v6;
  a3[5] = v7;
  a3[6] = v8;
  a3[7] = v9;
  return result;
}

float64x2_t static simd_double4x4.- prefix(_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X8>)
{
  float64x2_t result = vsubq_f64((float64x2_t)0, a1[1]);
  float64x2_t v3 = vsubq_f64((float64x2_t)0, a1[2]);
  float64x2_t v4 = vsubq_f64((float64x2_t)0, a1[3]);
  float64x2_t v5 = vsubq_f64((float64x2_t)0, a1[4]);
  float64x2_t v6 = vsubq_f64((float64x2_t)0, a1[5]);
  float64x2_t v7 = vsubq_f64((float64x2_t)0, a1[6]);
  float64x2_t v8 = vsubq_f64((float64x2_t)0, a1[7]);
  *a2 = vsubq_f64((float64x2_t)0, *a1);
  a2[1] = result;
  a2[2] = v3;
  a2[3] = v4;
  a2[4] = v5;
  a2[5] = v6;
  a2[6] = v7;
  a2[7] = v8;
  return result;
}

float64x2_t static simd_double4x4.- infix(_:_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vsubq_f64(a1[1], a2[1]);
  float64x2_t v4 = vsubq_f64(a1[2], a2[2]);
  float64x2_t v5 = vsubq_f64(a1[3], a2[3]);
  float64x2_t v6 = vsubq_f64(a1[4], a2[4]);
  float64x2_t v7 = vsubq_f64(a1[5], a2[5]);
  float64x2_t v8 = vsubq_f64(a1[6], a2[6]);
  float64x2_t v9 = vsubq_f64(a1[7], a2[7]);
  *a3 = vsubq_f64(*a1, *a2);
  a3[1] = result;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v6;
  a3[5] = v7;
  a3[6] = v8;
  a3[7] = v9;
  return result;
}

float64x2_t static simd_double4x4.+= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vaddq_f64(a2[1], a1[1]);
  float64x2_t result = vaddq_f64(*a2, *a1);
  float64x2_t v4 = vaddq_f64(a2[3], a1[3]);
  float64x2_t v5 = vaddq_f64(a2[2], a1[2]);
  float64x2_t v6 = vaddq_f64(a2[5], a1[5]);
  float64x2_t v7 = vaddq_f64(a2[4], a1[4]);
  float64x2_t v8 = vaddq_f64(a2[7], a1[7]);
  float64x2_t v9 = vaddq_f64(a2[6], a1[6]);
  *a1 = result;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  a1[6] = v9;
  a1[7] = v8;
  return result;
}

float64x2_t static simd_double4x4.-= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = vsubq_f64(a1[1], a2[1]);
  float64x2_t result = vsubq_f64(*a1, *a2);
  float64x2_t v4 = vsubq_f64(a1[3], a2[3]);
  float64x2_t v5 = vsubq_f64(a1[2], a2[2]);
  float64x2_t v6 = vsubq_f64(a1[5], a2[5]);
  float64x2_t v7 = vsubq_f64(a1[4], a2[4]);
  float64x2_t v8 = vsubq_f64(a1[7], a2[7]);
  float64x2_t v9 = vsubq_f64(a1[6], a2[6]);
  *a1 = result;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  a1[6] = v9;
  a1[7] = v8;
  return result;
}

float64x2_t static simd_double4x4.* infix(_:_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X8>, double a3@<D0>)
{
  float64x2_t v3 = vmulq_n_f64(*a1, a3);
  float64x2_t v4 = vmulq_n_f64(a1[1], a3);
  float64x2_t v5 = vmulq_n_f64(a1[2], a3);
  float64x2_t v6 = vmulq_n_f64(a1[3], a3);
  float64x2_t v7 = vmulq_n_f64(a1[4], a3);
  float64x2_t v8 = vmulq_n_f64(a1[5], a3);
  float64x2_t v9 = vmulq_n_f64(a1[6], a3);
  float64x2_t result = vmulq_n_f64(a1[7], a3);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = v8;
  a2[6] = v9;
  a2[7] = result;
  return result;
}

{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t result;

  float64x2_t v3 = vmulq_n_f64(*a1, a3);
  float64x2_t v4 = vmulq_n_f64(a1[1], a3);
  float64x2_t v5 = vmulq_n_f64(a1[2], a3);
  float64x2_t v6 = vmulq_n_f64(a1[3], a3);
  float64x2_t v7 = vmulq_n_f64(a1[4], a3);
  float64x2_t v8 = vmulq_n_f64(a1[5], a3);
  float64x2_t v9 = vmulq_n_f64(a1[6], a3);
  float64x2_t result = vmulq_n_f64(a1[7], a3);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = v8;
  a2[6] = v9;
  a2[7] = result;
  return result;
}

float64x2_t static simd_double4x4.*= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64x2_t v2 = vmulq_n_f64(a1[1], a2);
  float64x2_t v3 = vmulq_n_f64(*a1, a2);
  float64x2_t v4 = vmulq_n_f64(a1[3], a2);
  float64x2_t v5 = vmulq_n_f64(a1[2], a2);
  float64x2_t v6 = vmulq_n_f64(a1[5], a2);
  float64x2_t v7 = vmulq_n_f64(a1[4], a2);
  float64x2_t v8 = vmulq_n_f64(a1[7], a2);
  float64x2_t result = vmulq_n_f64(a1[6], a2);
  *a1 = v3;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  a1[6] = result;
  a1[7] = v8;
  return result;
}

double static simd_double4x4.* infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a2, 1), a1[4], a3.f64[0]), a1[6], a3, 1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2.f64[0]), a1[2], a2, 1), a1[4], a3.f64[0]), a1[6], a3, 1);
  return result;
}

double static simd_double4x4.* infix(_:_:)(int64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  i64 = (const double *)a1[4].i64;
  vld4q_f64(i64);
  *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)vzip1q_s64(*a1, a1[2]), a2.f64[0]), (float64x2_t)vzip2q_s64(*a1, a1[2]), a2, 1), (float64x2_t)vzip1q_s64(a1[1], a1[3]), a3.f64[0]), (float64x2_t)vzip2q_s64(a1[1], a1[3]), a3, 1);
  return result;
}

float64x2_t static simd_double4x4.* infix(_:_:)@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t v3 = a2[1];
  float64x2_t v5 = a2[2];
  float64x2_t v4 = a2[3];
  float64x2_t v7 = a2[4];
  float64x2_t v6 = a2[5];
  float64x2_t v8 = a1[1];
  float64x2_t v10 = a1[2];
  float64x2_t v9 = a1[3];
  float64x2_t v11 = a1[4];
  float64x2_t v12 = a1[5];
  float64x2_t v14 = a1[6];
  float64x2_t v13 = a1[7];
  float64x2_t v15 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v10, *a2, 1), v11, v3.f64[0]), v14, v3, 1);
  float64x2_t v16 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v8, a2->f64[0]), v9, *a2, 1), v12, v3.f64[0]), v13, v3, 1);
  float64x2_t v17 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v5.f64[0]), v10, v5, 1), v11, v4.f64[0]), v14, v4, 1);
  float64x2_t result = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v8, v5.f64[0]), v9, v5, 1), v12, v4.f64[0]), v13, v4, 1);
  float64x2_t v19 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v7.f64[0]), v10, v7, 1), v11, v6.f64[0]), v14, v6, 1);
  *a3 = v15;
  a3[1] = v16;
  a3[2] = v17;
  a3[3] = result;
  a3[4] = v19;
  a3[5] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v8, v7.f64[0]), v9, v7, 1), v12, v6.f64[0]), v13, v6, 1);
  return result;
}

{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t result;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;

  float64x2_t v3 = a2[1];
  float64x2_t v5 = a2[2];
  float64x2_t v4 = a2[3];
  float64x2_t v7 = a2[4];
  float64x2_t v6 = a2[5];
  float64x2_t v9 = a2[6];
  float64x2_t result = a2[7];
  float64x2_t v10 = a1[1];
  float64x2_t v12 = a1[2];
  float64x2_t v11 = a1[3];
  float64x2_t v13 = a1[4];
  float64x2_t v14 = a1[5];
  float64x2_t v16 = a1[6];
  float64x2_t v15 = a1[7];
  float64x2_t v17 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v12, *a2, 1), v13, v3.f64[0]), v16, v3, 1);
  float64x2x2_t v18 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, a2->f64[0]), v11, *a2, 1), v14, v3.f64[0]), v15, v3, 1);
  float64x2_t v19 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v5.f64[0]), v12, v5, 1), v13, v4.f64[0]), v16, v4, 1);
  float64x2_t v20 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, v5.f64[0]), v11, v5, 1), v14, v4.f64[0]), v15, v4, 1);
  float64x2_t v21 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v7.f64[0]), v12, v7, 1), v13, v6.f64[0]), v16, v6, 1);
  float64x2_t v22 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, v7.f64[0]), v11, v7, 1), v14, v6.f64[0]), v15, v6, 1);
  v23 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v9.f64[0]), v12, v9, 1), v13, result.f64[0]), v16, result, 1);
  *a3 = v17;
  a3[1] = v18;
  a3[2] = v19;
  a3[3] = v20;
  a3[4] = v21;
  a3[5] = v22;
  a3[6] = v23;
  a3[7] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, v9.f64[0]), v11, v9, 1), v14, result.f64[0]), v15, result, 1);
  return result;
}

float64x2_t static simd_double4x4.*= infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2 = a2[1];
  float64x2_t v4 = a2[2];
  float64x2_t v3 = a2[3];
  float64x2_t v6 = a2[4];
  float64x2_t v5 = a2[5];
  float64x2_t v8 = a2[6];
  float64x2_t result = a2[7];
  float64x2_t v9 = a1[1];
  float64x2_t v10 = a1[2];
  float64x2_t v11 = a1[3];
  float64x2_t v13 = a1[4];
  float64x2_t v12 = a1[5];
  float64x2_t v14 = a1[6];
  float64x2_t v15 = a1[7];
  float64x2_t v16 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v9, a2->f64[0]), v11, *a2, 1), v12, v2.f64[0]), v15, v2, 1);
  float64x2_t v17 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, a2->f64[0]), v10, *a2, 1), v13, v2.f64[0]), v14, v2, 1);
  float64x2_t v18 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v9, v4.f64[0]), v11, v4, 1), v12, v3.f64[0]), v15, v3, 1);
  float64x2_t v19 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v4.f64[0]), v10, v4, 1), v13, v3.f64[0]), v14, v3, 1);
  float64x2_t v20 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v9, v6.f64[0]), v11, v6, 1), v12, v5.f64[0]), v15, v5, 1);
  float64x2_t v21 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v6.f64[0]), v10, v6, 1), v13, v5.f64[0]), v14, v5, 1);
  float64x2_t v22 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*a1, v8.f64[0]), v10, v8, 1), v13, result.f64[0]);
  *a1 = v17;
  a1[1] = v16;
  a1[2] = v19;
  a1[3] = v18;
  a1[4] = v21;
  a1[5] = v20;
  a1[6] = vmlaq_laneq_f64(v22, v14, result, 1);
  a1[7] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v9, v8.f64[0]), v11, v8, 1), v12, result.f64[0]), v15, result, 1);
  return result;
}

void matrix_from_diagonal(_:)(_OWORD *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>)
{
  *(void *)&long long v3 = 0;
  *((void *)&v3 + 1) = a2.n128_u64[1];
  *(void *)&long long v4 = 0;
  *((void *)&v4 + 1) = a3.n128_u64[1];
  *a1 = a2.n128_u64[0];
  a1[1] = 0u;
  a1[2] = v3;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = a3.n128_u64[0];
  a1[6] = 0u;
  a1[7] = v4;
}

void __swiftcall matrix_invert(_:)(simd_double4x4 *__return_ptr retstr, simd_double4x4 *a2)
{
  __invert_d4();
  *retstr = v3;
}

Swift::Double __swiftcall matrix_determinant(_:)(simd_double4x4 *a1)
{
  uint64_t v1 = (float64x2_t *)a1;
  float64x2x2_t v18 = vld2q_f64(v1->f64);
  v1 += 2;
  float64x2_t v2 = *(float64x2_t *)&a1->columns[1].f64[2];
  float64x2_t v3 = *(float64x2_t *)a1->columns[2].f64;
  float64x2_t v4 = *(float64x2_t *)&a1->columns[2].f64[2];
  float64x2_t v5 = *(float64x2_t *)a1->columns[3].f64;
  float64x2_t v6 = *(float64x2_t *)&a1->columns[3].f64[2];
  float64x2_t v7 = (float64x2_t)vextq_s8((int8x16_t)v2, *(int8x16_t *)v1, 8uLL);
  float64x2_t v8 = (float64x2_t)vextq_s8(*(int8x16_t *)v1, (int8x16_t)v2, 8uLL);
  float64x2_t v9 = (float64x2_t)vextq_s8((int8x16_t)v6, (int8x16_t)v5, 8uLL);
  float64x2_t v10 = (float64x2_t)vextq_s8((int8x16_t)v5, (int8x16_t)v6, 8uLL);
  float64x2_t v11 = (float64x2_t)vextq_s8((int8x16_t)v4, (int8x16_t)v3, 8uLL);
  float64x2_t v12 = (float64x2_t)vextq_s8((int8x16_t)v3, (int8x16_t)v4, 8uLL);
  float64x2_t v13 = vnegq_f64(v12);
  float64x2_t v14 = vnegq_f64(v11);
  int64x2_t v15 = (int64x2_t)vmlaq_f64(vmlaq_f64(vmulq_f64(*v1, vmlaq_f64(vmulq_f64(v10, v14), v9, v12)), vmlaq_f64(vmulq_f64(v5, v13), v10, v3), v7), vmlaq_f64(vmulq_f64(v9, vnegq_f64(v3)), v5, v11), v8);
  int64x2_t v16 = (int64x2_t)vmlaq_f64(vmlaq_f64(vmulq_f64(v2, vmlaq_f64(vmulq_f64(v9, v13), v10, v11)), vmlaq_f64(vmulq_f64(v6, v14), v9, v4), v8), vmlaq_f64(vmulq_f64(v10, vnegq_f64(v4)), v6, v12), v7);
  return vaddvq_f64(vsubq_f64(vmulq_f64(v18.val[0], (float64x2_t)vzip1q_s64(v16, v15)), vmulq_f64(v18.val[1], (float64x2_t)vzip2q_s64(v16, v15))));
}

void __swiftcall matrix_transpose(_:)(simd_double4x4 *__return_ptr retstr, simd_double4x4 *a2)
{
  int64x2_t v2 = *(int64x2_t *)&a2->columns[0].f64[2];
  int64x2_t v4 = *(int64x2_t *)a2->columns[1].f64;
  int64x2_t v3 = *(int64x2_t *)&a2->columns[1].f64[2];
  float64x2_t v5 = &a2->columns[2];
  float64x2x4_t v7 = vld4q_f64(v5->f64);
  int64x2_t v6 = vzip2q_s64(*(int64x2_t *)a2->columns[0].f64, v4);
  *(int64x2_t *)retstr->columns[0].f64 = vzip1q_s64(*(int64x2_t *)a2->columns[0].f64, v4);
  *(float64x2_t *)&retstr->columns[0].f64[2] = v7.val[0];
  *(int64x2_t *)retstr->columns[1].f64 = v6;
  *(float64x2_t *)&retstr->columns[1].f64[2] = v7.val[1];
  *(int64x2_t *)retstr->columns[2].f64 = vzip1q_s64(v2, v3);
  *(float64x2_t *)&retstr->columns[2].f64[2] = v7.val[2];
  *(int64x2_t *)retstr->columns[3].f64 = vzip2q_s64(v2, v3);
  *(float64x2_t *)&retstr->columns[3].f64[2] = v7.val[3];
}

Swift::Bool __swiftcall matrix_equal(_:_:)(simd_double4x4 *a1, simd_double4x4 *a2)
{
  int64x2_t v2 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[1].f64, *(float64x2_t *)a2->columns[1].f64), (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[0].f64, *(float64x2_t *)a2->columns[0].f64)), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[2].f64, *(float64x2_t *)a2->columns[2].f64), (int8x16_t)vceqq_f64(*(float64x2_t *)a1->columns[3].f64, *(float64x2_t *)a2->columns[3].f64))), vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&a1->columns[1].f64[2], *(float64x2_t *)&a2->columns[1].f64[2]), (int8x16_t)vceqq_f64(*(float64x2_t *)&a1->columns[0].f64[2], *(float64x2_t *)&a2->columns[0].f64[2])), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&a1->columns[2].f64[2], *(float64x2_t *)&a2->columns[2].f64[2]),
                        (int8x16_t)vceqq_f64(*(float64x2_t *)&a1->columns[3].f64[2], *(float64x2_t *)&a2->columns[3].f64[2]))));
  return vandq_s8((int8x16_t)v2, (int8x16_t)vdupq_laneq_s64(v2, 1)).u64[0] >> 63;
}

double sincos(_:)()
{
  Swift::String v0 = (void (*)(double *, long long *))MEMORY[0x263EF8610];

  return sincos(_:)(v0);
}

{
  void (*v0)(double *, long long *);
  uint64_t vars8;

  Swift::String v0 = (void (*)(double *, long long *))MEMORY[0x263EF8618];

  return sincos(_:)(v0);
}

double sincospi(_:)()
{
  Swift::String v0 = (void (*)(double *, long long *))MEMORY[0x263EF8620];

  return sincos(_:)(v0);
}

{
  void (*v0)(double *, long long *);
  uint64_t vars8;

  Swift::String v0 = (void (*)(double *, long long *))MEMORY[0x263EF8628];

  return sincos(_:)(v0);
}

double sincos(_:)(void (*a1)(double *, long long *))
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  long long v2 = 0u;
  *(_OWORD *)int64x2_t v3 = 0u;
  a1(v3, &v2);
  return v3[0];
}

{
  long long v2;
  double v3[3];
  uint64_t v4;

  uint64_t v4 = *MEMORY[0x263EF8340];
  long long v2 = 0u;
  *(_OWORD *)int64x2_t v3 = 0u;
  a1(v3, &v2);
  return v3[0];
}

double fma(_:_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_f64(a3, a2, a1);
  return result;
}

double round(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vrndaq_f64(a1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vrndaq_f64(a1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vrndaq_f64(a1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vrndaq_f64(a1);
  return result;
}

double isfinite(_:)(float64x2_t a1)
{
  *(void *)&double result = vbicq_s8(vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1)), (int8x16_t)vceqq_f64((float64x2_t)vandq_s8((int8x16_t)a1, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)), (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL))).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vbicq_s8(vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1)), (int8x16_t)vceqq_f64(vabsq_f64(a1), (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL))).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vbicq_s8(vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1)), (int8x16_t)vceqq_f64(vabsq_f64(a1), (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL))).u64[0];
  return result;
}

double isinf(_:)(int8x16_t a1)
{
  *(void *)&double result = vceqq_f64((float64x2_t)vandq_s8(a1, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)), (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL)).u64[0];
  return result;
}

double isnan(_:)(float64x2_t a1)
{
  *(void *)&double result = vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1))).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1))).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1))).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1))).u64[0];
  return result;
}

double isnormal(_:)(float64x2_t a1)
{
  int8x16_t v1 = vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1));
  float64x2_t v2 = (float64x2_t)vandq_s8((int8x16_t)a1, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  *(void *)&double result = vandq_s8(vbicq_s8(v1, (int8x16_t)vceqq_f64(v2, (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL))), (int8x16_t)vcgeq_f64(v2, (float64x2_t)vdupq_n_s64(0x10000000000000uLL))).u64[0];
  return result;
}

{
  int8x16_t v1;
  float64x2_t v2;
  double result;

  int8x16_t v1 = vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1));
  float64x2_t v2 = vabsq_f64(a1);
  *(void *)&double result = vandq_s8(vbicq_s8(v1, (int8x16_t)vceqq_f64(v2, (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL))), (int8x16_t)vcgeq_f64(v2, (float64x2_t)vdupq_n_s64(0x10000000000000uLL))).u64[0];
  return result;
}

{
  int8x16_t v1;
  float64x2_t v2;
  double result;

  int8x16_t v1 = vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1));
  float64x2_t v2 = vabsq_f64(a1);
  *(void *)&double result = vandq_s8(vbicq_s8(v1, (int8x16_t)vceqq_f64(v2, (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL))), (int8x16_t)vcgeq_f64(v2, (float64x2_t)vdupq_n_s64(0x10000000000000uLL))).u64[0];
  return result;
}

double sincos(_:)(double a1, double a2)
{
  float64x2_t v2 = (void (*)(long long *, long long *))MEMORY[0x263EF8610];

  return sincos(_:)(v2, a1, a2);
}

double sincospi(_:)(double a1, double a2)
{
  float64x2_t v2 = (void (*)(long long *, long long *))MEMORY[0x263EF8620];

  return sincos(_:)(v2, a1, a2);
}

double sincos(_:)(void (*a1)(long long *, long long *), double a2, double a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  __n128 v5 = (__n128)*(unint64_t *)&a3;
  a1(&v8, &v6);
  ((void (*)(long long *, long long *, __n128))a1)(&v9, &v7, v5);
  return *(double *)&v8;
}

double cos(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF84D0], a1, a2).n128_u64[0];
  return result;
}

double cosh(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF84E0], a1, a2).n128_u64[0];
  return result;
}

double cospi(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF84F0], a1, a2).n128_u64[0];
  return result;
}

double acos(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8450], a1, a2).n128_u64[0];
  return result;
}

double acosh(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8460], a1, a2).n128_u64[0];
  return result;
}

double sin(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8600], a1, a2).n128_u64[0];
  return result;
}

double sinh(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8630], a1, a2).n128_u64[0];
  return result;
}

double sinpi(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8640], a1, a2).n128_u64[0];
  return result;
}

double asin(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8470], a1, a2).n128_u64[0];
  return result;
}

double asinh(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8480], a1, a2).n128_u64[0];
  return result;
}

double tan(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8650], a1, a2).n128_u64[0];
  return result;
}

double tanh(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8660], a1, a2).n128_u64[0];
  return result;
}

double tanpi(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8670], a1, a2).n128_u64[0];
  return result;
}

double atan(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF84A0], a1, a2).n128_u64[0];
  return result;
}

double atanh(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF84B0], a1, a2).n128_u64[0];
  return result;
}

double atan2(_:_:)(__n128 a1, double a2, __n128 a3, double a4)
{
  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF8490], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double exp(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8540], a1, a2).n128_u64[0];
  return result;
}

double exp2(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8530], a1, a2).n128_u64[0];
  return result;
}

double exp10(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8520], a1, a2).n128_u64[0];
  return result;
}

double expm1(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8550], a1, a2).n128_u64[0];
  return result;
}

double log(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF85C0], a1, a2).n128_u64[0];
  return result;
}

double log2(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF85B0], a1, a2).n128_u64[0];
  return result;
}

double log10(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8590], a1, a2).n128_u64[0];
  return result;
}

double log1p(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF85A0], a1, a2).n128_u64[0];
  return result;
}

double lgamma(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8580], a1, a2).n128_u64[0];
  return result;
}

double tgamma(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8680], a1, a2).n128_u64[0];
  return result;
}

double erf(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8500], a1, a2).n128_u64[0];
  return result;
}

double erfc(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8510], a1, a2).n128_u64[0];
  return result;
}

double cbrt(_:)(double a1, double a2)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF84C0], a1, a2).n128_u64[0];
  return result;
}

__n128 cos(_:)(double (*a1)(void), double a2, double a3)
{
  __n128 v7 = (__n128)*(unint64_t *)&a3;
  *(double *)&long long v4 = a1();
  long long v6 = v4;
  ((void (*)(__n128))a1)(v7);
  return (__n128)v6;
}

double pow(_:_:)(__n128 a1, double a2, __n128 a3, double a4)
{
  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF85E0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double hypot(_:_:)(__n128 a1, double a2, __n128 a3, double a4)
{
  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF8570], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double fma(_:_:_:)(float64x2_t a1, double a2, float64x2_t a3, double a4, float64x2_t a5)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_f64(a5, a3, a1);
  return result;
}

{
  double result;

  *(void *)&double result = *(_OWORD *)&vmlaq_f64(a5, a3, a1);
  return result;
}

double fmod(_:_:)(__n128 a1, double a2, __n128 a3, double a4)
{
  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF8560], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double remainder(_:_:)(__n128 a1, double a2, __n128 a3, double a4)
{
  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF85F0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double nextafter(_:_:)(__n128 a1, double a2, __n128 a3, double a4)
{
  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF85D0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

__n128 atan2(_:_:)(double (*a1)(__n128, __n128), __n128 a2, double a3, __n128 a4, double a5)
{
  __n128 v9 = (__n128)*(unint64_t *)&a5;
  __n128 v10 = (__n128)*(unint64_t *)&a3;
  *(double *)&long long v6 = a1(a2, a4);
  long long v8 = v6;
  a1(v10, v9);
  return (__n128)v8;
}

double isinf(_:)(float64x2_t a1)
{
  *(void *)&double result = vceqq_f64(vabsq_f64(a1), (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL)).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vceqq_f64(vabsq_f64(a1), (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL)).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vceqq_f64(vabsq_f64(a1), (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL)).u64[0];
  return result;
}

double sincos(_:)(double a1, __n128 a2)
{
  float64x2_t v2 = (void (*)(long long *, long long *))MEMORY[0x263EF8610];

  return sincos(_:)(v2, a1, a2);
}

{
  void (*v2)(long long *, long long *);
  uint64_t vars8;

  float64x2_t v2 = (void (*)(long long *, long long *))MEMORY[0x263EF8618];

  return sincos(_:)(v2, a1, a2);
}

double sincospi(_:)(double a1, __n128 a2)
{
  float64x2_t v2 = (void (*)(long long *, long long *))MEMORY[0x263EF8620];

  return sincos(_:)(v2, a1, a2);
}

{
  void (*v2)(long long *, long long *);
  uint64_t vars8;

  float64x2_t v2 = (void (*)(long long *, long long *))MEMORY[0x263EF8628];

  return sincos(_:)(v2, a1, a2);
}

double sincos(_:)(void (*a1)(long long *, long long *), double a2, __n128 a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  a1(&v8, &v6);
  ((void (*)(long long *, long long *, __n128))a1)(&v9, &v7, a3);
  return *(double *)&v8;
}

{
  long long v6;
  long long v7;
  long long v8;
  long long v9;
  uint64_t v10;

  uint64_t v10 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  a1(&v8, &v6);
  ((void (*)(long long *, long long *, __n128))a1)(&v9, &v7, a3);
  return *(double *)&v8;
}

__n128 cos(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_cos_d2(a1);
  _simd_cos_d2(a2);
  return (__n128)v3;
}

__n128 cosh(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_cosh_d2(a1);
  _simd_cosh_d2(a2);
  return (__n128)v3;
}

__n128 cospi(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_cospi_d2(a1);
  _simd_cospi_d2(a2);
  return (__n128)v3;
}

__n128 acos(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_acos_d2(a1);
  _simd_acos_d2(a2);
  return (__n128)v3;
}

__n128 acosh(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_acosh_d2(a1);
  _simd_acosh_d2(a2);
  return (__n128)v3;
}

__n128 sin(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_sin_d2(a1);
  _simd_sin_d2(a2);
  return (__n128)v3;
}

__n128 sinh(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_sinh_d2(a1);
  _simd_sinh_d2(a2);
  return (__n128)v3;
}

__n128 sinpi(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_sinpi_d2(a1);
  _simd_sinpi_d2(a2);
  return (__n128)v3;
}

__n128 asin(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_asin_d2(a1);
  _simd_asin_d2(a2);
  return (__n128)v3;
}

__n128 asinh(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_asinh_d2(a1);
  _simd_asinh_d2(a2);
  return (__n128)v3;
}

__n128 tan(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_tan_d2(a1);
  _simd_tan_d2(a2);
  return (__n128)v3;
}

__n128 tanh(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_tanh_d2(a1);
  _simd_tanh_d2(a2);
  return (__n128)v3;
}

__n128 tanpi(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_tanpi_d2(a1);
  _simd_tanpi_d2(a2);
  return (__n128)v3;
}

__n128 atan(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_atan_d2(a1);
  _simd_atan_d2(a2);
  return (__n128)v3;
}

__n128 atanh(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_atanh_d2(a1);
  _simd_atanh_d2(a2);
  return (__n128)v3;
}

__n128 atan2(_:_:)(simd_double2 a1, simd_double2 a2, simd_double2 a3, simd_double2 a4)
{
  simd_double2 v5 = _simd_atan2_d2(a1, a3);
  _simd_atan2_d2(a2, a4);
  return (__n128)v5;
}

__n128 exp(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_exp_d2(a1);
  _simd_exp_d2(a2);
  return (__n128)v3;
}

__n128 exp2(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_exp2_d2(a1);
  _simd_exp2_d2(a2);
  return (__n128)v3;
}

__n128 exp10(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_exp10_d2(a1);
  _simd_exp10_d2(a2);
  return (__n128)v3;
}

__n128 expm1(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_expm1_d2(a1);
  _simd_expm1_d2(a2);
  return (__n128)v3;
}

__n128 log(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_log_d2(a1);
  _simd_log_d2(a2);
  return (__n128)v3;
}

__n128 log2(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_log2_d2(a1);
  _simd_log2_d2(a2);
  return (__n128)v3;
}

__n128 log10(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_log10_d2(a1);
  _simd_log10_d2(a2);
  return (__n128)v3;
}

__n128 log1p(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_log1p_d2(a1);
  _simd_log1p_d2(a2);
  return (__n128)v3;
}

__n128 lgamma(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_lgamma_d2(a1);
  _simd_lgamma_d2(a2);
  return (__n128)v3;
}

__n128 tgamma(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_tgamma_d2(a1);
  _simd_tgamma_d2(a2);
  return (__n128)v3;
}

__n128 erf(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_erf_d2(a1);
  _simd_erf_d2(a2);
  return (__n128)v3;
}

__n128 erfc(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_erfc_d2(a1);
  _simd_erfc_d2(a2);
  return (__n128)v3;
}

__n128 cbrt(_:)(simd_double2 a1, simd_double2 a2)
{
  simd_double2 v3 = _simd_cbrt_d2(a1);
  _simd_cbrt_d2(a2);
  return (__n128)v3;
}

__n128 pow(_:_:)(simd_double2 a1, simd_double2 a2, simd_double2 a3, simd_double2 a4)
{
  simd_double2 v5 = _simd_pow_d2(a1, a3);
  _simd_pow_d2(a2, a4);
  return (__n128)v5;
}

__n128 hypot(_:_:)(simd_double2 a1, simd_double2 a2, simd_double2 a3, simd_double2 a4)
{
  simd_double2 v5 = _simd_hypot_d2(a1, a3);
  _simd_hypot_d2(a2, a4);
  return (__n128)v5;
}

__n128 fmod(_:_:)(simd_double2 a1, simd_double2 a2, simd_double2 a3, simd_double2 a4)
{
  simd_double2 v5 = _simd_fmod_d2(a1, a3);
  _simd_fmod_d2(a2, a4);
  return (__n128)v5;
}

__n128 remainder(_:_:)(simd_double2 a1, simd_double2 a2, simd_double2 a3, simd_double2 a4)
{
  simd_double2 v5 = _simd_remainder_d2(a1, a3);
  _simd_remainder_d2(a2, a4);
  return (__n128)v5;
}

__n128 nextafter(_:_:)(simd_double2 a1, simd_double2 a2, simd_double2 a3, simd_double2 a4)
{
  simd_double2 v5 = _simd_nextafter_d2(a1, a3);
  _simd_nextafter_d2(a2, a4);
  return (__n128)v5;
}

double sincos(_:)@<D0>(uint64_t a1@<X8>, __n128 a2@<Q1>, __n128 a3@<Q2>, __n128 a4@<Q3>)
{
  long long v4 = (void (*)(__n128 *, long long *))MEMORY[0x263EF8610];

  *(void *)&double result = sincos(_:)(v4, a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  void (*v4)(__n128 *, long long *);
  double result;
  uint64_t vars8;

  long long v4 = (void (*)(__n128 *, long long *))MEMORY[0x263EF8618];

  *(void *)&double result = sincos(_:)(v4, a1, a2, a3, a4).n128_u64[0];
  return result;
}

double sincospi(_:)@<D0>(uint64_t a1@<X8>, __n128 a2@<Q1>, __n128 a3@<Q2>, __n128 a4@<Q3>)
{
  long long v4 = (void (*)(__n128 *, long long *))MEMORY[0x263EF8620];

  *(void *)&double result = sincos(_:)(v4, a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  void (*v4)(__n128 *, long long *);
  double result;
  uint64_t vars8;

  long long v4 = (void (*)(__n128 *, long long *))MEMORY[0x263EF8628];

  *(void *)&double result = sincos(_:)(v4, a1, a2, a3, a4).n128_u64[0];
  return result;
}

__n128 sincos(_:)@<Q0>(void (*a1)(__n128 *, long long *)@<X0>, uint64_t a2@<X8>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  __n128 v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  a1(&v21, &v17);
  ((void (*)(long long *, long long *, __n128))a1)(&v22, &v18, a3);
  ((void (*)(long long *, long long *, __n128))a1)(&v23, &v19, a4);
  ((void (*)(long long *, long long *, __n128))a1)(&v24, &v20, a5);
  __n128 result = v21;
  long long v8 = v22;
  long long v9 = v24;
  long long v10 = v17;
  long long v11 = v18;
  long long v12 = v19;
  long long v13 = v20;
  *(_OWORD *)(a2 + 32) = v23;
  *(_OWORD *)(a2 + 48) = v9;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v8;
  *(_OWORD *)(a2 + 96) = v12;
  *(_OWORD *)(a2 + 112) = v13;
  *(_OWORD *)(a2 + 64) = v10;
  *(_OWORD *)(a2 + 80) = v11;
  return result;
}

{
  __n128 result;
  long long v8;
  long long v9;
  long long v10;
  long long v11;
  long long v12;
  long long v13;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  __n128 v21;
  long long v22;
  long long v23;
  long long v24;
  uint64_t v25;

  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  __n128 v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  a1(&v21, &v17);
  ((void (*)(long long *, long long *, __n128))a1)(&v22, &v18, a3);
  ((void (*)(long long *, long long *, __n128))a1)(&v23, &v19, a4);
  ((void (*)(long long *, long long *, __n128))a1)(&v24, &v20, a5);
  __n128 result = v21;
  long long v8 = v22;
  long long v9 = v24;
  long long v10 = v17;
  long long v11 = v18;
  long long v12 = v19;
  long long v13 = v20;
  *(_OWORD *)(a2 + 32) = v23;
  *(_OWORD *)(a2 + 48) = v9;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v8;
  *(_OWORD *)(a2 + 96) = v12;
  *(_OWORD *)(a2 + 112) = v13;
  *(_OWORD *)(a2 + 64) = v10;
  *(_OWORD *)(a2 + 80) = v11;
  return result;
}

double cos(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF84D0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF84D8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double cosh(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF84E0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF84E8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double cospi(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF84F0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF84F8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double acos(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8450], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8458], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double acosh(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8460], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8468], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double sin(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8600], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8608], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double sinh(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8630], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8638], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double sinpi(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8640], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8648], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double asin(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8470], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8478], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double asinh(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8480], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8488], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double tan(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8650], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8658], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double tanh(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8660], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8668], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double tanpi(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8670], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8678], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double atan(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF84A0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF84A8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double atanh(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF84B0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF84B8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double atan2(_:_:)(__n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8)
{
  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF8490], a1, a2, a3, a4, a5, a6, a7, a8).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF8498], a1, a2, a3, a4, a5, a6, a7, a8).n128_u64[0];
  return result;
}

double exp(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8540], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8548], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double exp2(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8530], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8538], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double exp10(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8520], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8528], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double expm1(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8550], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8558], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double log(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF85C0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF85C8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double log2(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF85B0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF85B8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double log10(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8590], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8598], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double log1p(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF85A0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF85A8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double lgamma(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8580], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8588], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double tgamma(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8680], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8688], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double erf(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8500], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8508], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double erfc(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF8510], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF8518], a1, a2, a3, a4).n128_u64[0];
  return result;
}

double cbrt(_:)(double a1, __n128 a2, __n128 a3, __n128 a4)
{
  *(void *)&double result = cos(_:)(MEMORY[0x263EF84C0], a1, a2, a3, a4).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = cos(_:)(MEMORY[0x263EF84C8], a1, a2, a3, a4).n128_u64[0];
  return result;
}

__n128 cos(_:)(double (*a1)(void), double a2, __n128 a3, __n128 a4, __n128 a5)
{
  *(double *)&long long v6 = a1();
  long long v10 = v6;
  ((void (*)(__n128))a1)(a3);
  ((void (*)(__n128))a1)(a4);
  ((void (*)(__n128))a1)(a5);
  return (__n128)v10;
}

{
  long long v6;
  long long v10;

  *(double *)&long long v6 = a1();
  long long v10 = v6;
  ((void (*)(__n128))a1)(a3);
  ((void (*)(__n128))a1)(a4);
  ((void (*)(__n128))a1)(a5);
  return (__n128)v10;
}

double pow(_:_:)(__n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8)
{
  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF85E0], a1, a2, a3, a4, a5, a6, a7, a8).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF85E8], a1, a2, a3, a4, a5, a6, a7, a8).n128_u64[0];
  return result;
}

double hypot(_:_:)(__n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8)
{
  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF8570], a1, a2, a3, a4, a5, a6, a7, a8).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF8578], a1, a2, a3, a4, a5, a6, a7, a8).n128_u64[0];
  return result;
}

double fma(_:_:_:)(float64x2_t a1, double a2, double a3, double a4, float64x2_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, float64x2_t a14)
{
  *(void *)&double result = *(_OWORD *)&vmlaq_f64(a14, a5, a1);
  return result;
}

double fmod(_:_:)(__n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8)
{
  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF8560], a1, a2, a3, a4, a5, a6, a7, a8).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF8568], a1, a2, a3, a4, a5, a6, a7, a8).n128_u64[0];
  return result;
}

double remainder(_:_:)(__n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8)
{
  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF85F0], a1, a2, a3, a4, a5, a6, a7, a8).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF85F8], a1, a2, a3, a4, a5, a6, a7, a8).n128_u64[0];
  return result;
}

double nextafter(_:_:)(__n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8)
{
  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF85D0], a1, a2, a3, a4, a5, a6, a7, a8).n128_u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = atan2(_:_:)(MEMORY[0x263EF85D8], a1, a2, a3, a4, a5, a6, a7, a8).n128_u64[0];
  return result;
}

__n128 atan2(_:_:)(double (*a1)(__n128, __n128), __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8, __n128 a9)
{
  *(double *)&long long v10 = a1(a2, a6);
  long long v15 = v10;
  a1(a3, a7);
  a1(a4, a8);
  a1(a5, a9);
  return (__n128)v15;
}

{
  long long v10;
  long long v15;

  *(double *)&long long v10 = a1(a2, a6);
  long long v15 = v10;
  a1(a3, a7);
  a1(a4, a8);
  a1(a5, a9);
  return (__n128)v15;
}

double isfinite(_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v4 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
  unsigned __int16 v5 = vmovn_s16((int16x8_t)vbicq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1)), (int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(a2), (int8x16_t)vcgezq_f64(a2))), (int16x8_t)vuzp1q_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(a3), (int8x16_t)vcgezq_f64(a3)), (int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(a4), (int8x16_t)vcgezq_f64(a4)))), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(vabsq_f64(a1), v4), (int32x4_t)vceqq_f64(vabsq_f64(a2), v4)),
                                           (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(vabsq_f64(a3), v4), (int32x4_t)vceqq_f64(vabsq_f64(a4), v4))))).u16[0];
  v6.i64[0] = v5;
  v6.i64[1] = HIBYTE(v5);
  *(void *)&double result = vcltzq_s64(vshlq_n_s64(v6, 0x3FuLL)).u64[0];
  return result;
}

double isnormal(_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  int8x16_t v4 = (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(a1), (int8x16_t)vcgezq_f64(a1)), (int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(a2), (int8x16_t)vcgezq_f64(a2))), (int16x8_t)vuzp1q_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(a3), (int8x16_t)vcgezq_f64(a3)), (int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(a4), (int8x16_t)vcgezq_f64(a4))));
  float64x2_t v5 = vabsq_f64(a1);
  float64x2_t v6 = vabsq_f64(a2);
  float64x2_t v7 = vabsq_f64(a3);
  float64x2_t v8 = vabsq_f64(a4);
  float64x2_t v9 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
  float64x2_t v10 = (float64x2_t)vdupq_n_s64(0x10000000000000uLL);
  LOWORD(v8.f64[0]) = vmovn_s16((int16x8_t)vandq_s8(vbicq_s8(v4, (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(v5, v9), (int32x4_t)vceqq_f64(v6, v9)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(v7, v9), (int32x4_t)vceqq_f64(v8, v9)))), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vcgeq_f64(v5, v10), (int32x4_t)vcgeq_f64(v6, v10)), (int16x8_t)vuzp1q_s32((int32x4_t)vcgeq_f64(v7, v10), (int32x4_t)vcgeq_f64(v8, v10))))).u16[0];
  v11.i64[0] = LOBYTE(v8.f64[0]);
  v11.i64[1] = BYTE1(v8.f64[0]);
  *(void *)&double result = vcltzq_s64(vshlq_n_s64(v11, 0x3FuLL)).u64[0];
  return result;
}

double sincos(_:)(double a1)
{
  int8x16_t v1 = (void (*)(double *, long long *, __n128))MEMORY[0x263EF8618];

  return sincos(_:)(v1, a1);
}

double sincospi(_:)(double a1)
{
  int8x16_t v1 = (void (*)(double *, long long *, __n128))MEMORY[0x263EF8628];

  return sincos(_:)(v1, a1);
}

double sincos(_:)(void (*a1)(double *, long long *, __n128), double a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  long long v3 = 0u;
  *(_OWORD *)int8x16_t v4 = 0u;
  a1(v4, &v3, (__n128)*(unint64_t *)&a2);
  return v4[0];
}

double cos(_:)(double a1)
{
  *(void *)&double result = _simd_cos_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double cosh(_:)(double a1)
{
  *(void *)&double result = _simd_cosh_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double cospi(_:)(double a1)
{
  *(void *)&double result = _simd_cospi_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double acos(_:)(double a1)
{
  *(void *)&double result = _simd_acos_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double acosh(_:)(double a1)
{
  *(void *)&double result = _simd_acosh_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double sin(_:)(double a1)
{
  *(void *)&double result = _simd_sin_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double sinh(_:)(double a1)
{
  *(void *)&double result = _simd_sinh_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double sinpi(_:)(double a1)
{
  *(void *)&double result = _simd_sinpi_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double asin(_:)(double a1)
{
  *(void *)&double result = _simd_asin_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double asinh(_:)(double a1)
{
  *(void *)&double result = _simd_asinh_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double tan(_:)(double a1)
{
  *(void *)&double result = _simd_tan_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double tanh(_:)(double a1)
{
  *(void *)&double result = _simd_tanh_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double tanpi(_:)(double a1)
{
  *(void *)&double result = _simd_tanpi_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double atan(_:)(double a1)
{
  *(void *)&double result = _simd_atan_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double atanh(_:)(double a1)
{
  *(void *)&double result = _simd_atanh_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double atan2(_:_:)(double a1, double a2)
{
  *(void *)&double result = _simd_atan2_f4((simd_float4)*(unint64_t *)&a1, (simd_float4)*(unint64_t *)&a2).u64[0];
  return result;
}

double exp(_:)(double a1)
{
  *(void *)&double result = _simd_exp_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double exp2(_:)(double a1)
{
  *(void *)&double result = _simd_exp2_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double exp10(_:)(double a1)
{
  *(void *)&double result = _simd_exp10_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double expm1(_:)(double a1)
{
  *(void *)&double result = _simd_expm1_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double log(_:)(double a1)
{
  *(void *)&double result = _simd_log_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double log2(_:)(double a1)
{
  *(void *)&double result = _simd_log2_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double log10(_:)(double a1)
{
  *(void *)&double result = _simd_log10_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double log1p(_:)(double a1)
{
  *(void *)&double result = _simd_log1p_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double lgamma(_:)(double a1)
{
  *(void *)&double result = _simd_lgamma_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double tgamma(_:)(double a1)
{
  *(void *)&double result = _simd_tgamma_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double erf(_:)(double a1)
{
  *(void *)&double result = _simd_erf_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double erfc(_:)(double a1)
{
  *(void *)&double result = _simd_erfc_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double cbrt(_:)(double a1)
{
  *(void *)&double result = _simd_cbrt_f4((simd_float4)*(unint64_t *)&a1).u64[0];
  return result;
}

double pow(_:_:)(double a1, double a2)
{
  *(void *)&double result = _simd_pow_f4((simd_float4)*(unint64_t *)&a1, (simd_float4)*(unint64_t *)&a2).u64[0];
  return result;
}

double hypot(_:_:)(double a1, double a2)
{
  *(void *)&double result = _simd_hypot_f4((simd_float4)*(unint64_t *)&a1, (simd_float4)*(unint64_t *)&a2).u64[0];
  return result;
}

float32x2_t fma(_:_:_:)(float32x2_t a1, float32x2_t a2, float32x2_t a3)
{
  return vmla_f32(a3, a2, a1);
}

double round(_:)(double a1)
{
  *(void *)&double result = vrndaq_f32((float32x4_t)*(unint64_t *)&a1).u64[0];
  return result;
}

double fmod(_:_:)(double a1, double a2)
{
  *(void *)&double result = _simd_fmod_f4((simd_float4)*(unint64_t *)&a1, (simd_float4)*(unint64_t *)&a2).u64[0];
  return result;
}

double remainder(_:_:)(double a1, double a2)
{
  *(void *)&double result = _simd_remainder_f4((simd_float4)*(unint64_t *)&a1, (simd_float4)*(unint64_t *)&a2).u64[0];
  return result;
}

double nextafter(_:_:)(double a1, double a2)
{
  *(void *)&double result = _simd_nextafter_f4((simd_float4)*(unint64_t *)&a1, (simd_float4)*(unint64_t *)&a2).u64[0];
  return result;
}

int8x8_t isfinite(_:)(float32x2_t a1)
{
  return vbic_s8(vorr_s8((int8x8_t)vcltz_f32(a1), (int8x8_t)vcgez_f32(a1)), (int8x8_t)vceq_f32((float32x2_t)(*(void *)&a1 & 0x7FFFFFFF7FFFFFFFLL), (float32x2_t)vdup_n_s32(0x7F800000u)));
}

int32x2_t isinf(_:)(double a1)
{
  return vceq_f32((float32x2_t)(*(void *)&a1 & 0x7FFFFFFF7FFFFFFFLL), (float32x2_t)vdup_n_s32(0x7F800000u));
}

int8x8_t isnan(_:)(float32x2_t a1)
{
  return vmvn_s8(vorr_s8((int8x8_t)vcltz_f32(a1), (int8x8_t)vcgez_f32(a1)));
}

int8x8_t isnormal(_:)(float32x2_t a1)
{
  return vand_s8(vbic_s8(vorr_s8((int8x8_t)vcltz_f32(a1), (int8x8_t)vcgez_f32(a1)), (int8x8_t)vceq_f32((float32x2_t)(*(void *)&a1 & 0x7FFFFFFF7FFFFFFFLL), (float32x2_t)vdup_n_s32(0x7F800000u))), (int8x8_t)vcge_f32((float32x2_t)(*(void *)&a1 & 0x7FFFFFFF7FFFFFFFLL), (float32x2_t)0x80000000800000));
}

double sincos(_:)(__n128 a1)
{
  int8x16_t v1 = (void (*)(double *, long long *, __n128))MEMORY[0x263EF8618];

  return sincos(_:)(v1, a1);
}

double sincospi(_:)(__n128 a1)
{
  int8x16_t v1 = (void (*)(double *, long long *, __n128))MEMORY[0x263EF8628];

  return sincos(_:)(v1, a1);
}

double sincos(_:)(void (*a1)(double *, long long *, __n128), __n128 a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  long long v3 = 0u;
  *(_OWORD *)int8x16_t v4 = 0u;
  a2.n128_u32[3] = 0;
  a1(v4, &v3, a2);
  return v4[0];
}

double cos(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_cos_f4(a1).u64[0];
  return result;
}

double cosh(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_cosh_f4(a1).u64[0];
  return result;
}

double cospi(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_cospi_f4(a1).u64[0];
  return result;
}

double acos(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_acos_f4(a1).u64[0];
  return result;
}

double acosh(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_acosh_f4(a1).u64[0];
  return result;
}

double sin(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_sin_f4(a1).u64[0];
  return result;
}

double sinh(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_sinh_f4(a1).u64[0];
  return result;
}

double sinpi(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_sinpi_f4(a1).u64[0];
  return result;
}

double asin(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_asin_f4(a1).u64[0];
  return result;
}

double asinh(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_asinh_f4(a1).u64[0];
  return result;
}

double tan(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_tan_f4(a1).u64[0];
  return result;
}

double tanh(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_tanh_f4(a1).u64[0];
  return result;
}

double tanpi(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_tanpi_f4(a1).u64[0];
  return result;
}

double atan(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_atan_f4(a1).u64[0];
  return result;
}

double atanh(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_atanh_f4(a1).u64[0];
  return result;
}

double atan2(_:_:)(simd_float4 a1, simd_float4 a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  *(void *)&double result = _simd_atan2_f4(a1, a2).u64[0];
  return result;
}

double exp(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_exp_f4(a1).u64[0];
  return result;
}

double exp2(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_exp2_f4(a1).u64[0];
  return result;
}

double exp10(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_exp10_f4(a1).u64[0];
  return result;
}

double expm1(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_expm1_f4(a1).u64[0];
  return result;
}

double log(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_log_f4(a1).u64[0];
  return result;
}

double log2(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_log2_f4(a1).u64[0];
  return result;
}

double log10(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_log10_f4(a1).u64[0];
  return result;
}

double log1p(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_log1p_f4(a1).u64[0];
  return result;
}

double lgamma(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_lgamma_f4(a1).u64[0];
  return result;
}

double tgamma(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_tgamma_f4(a1).u64[0];
  return result;
}

double erf(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_erf_f4(a1).u64[0];
  return result;
}

double erfc(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_erfc_f4(a1).u64[0];
  return result;
}

double cbrt(_:)(simd_float4 a1)
{
  a1.i32[3] = 0;
  *(void *)&double result = _simd_cbrt_f4(a1).u64[0];
  return result;
}

double pow(_:_:)(simd_float4 a1, simd_float4 a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  *(void *)&double result = _simd_pow_f4(a1, a2).u64[0];
  return result;
}

double hypot(_:_:)(simd_float4 a1, simd_float4 a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  *(void *)&double result = _simd_hypot_f4(a1, a2).u64[0];
  return result;
}

double fma(_:_:_:)(float32x4_t a1, float32x4_t a2, float32x4_t a3)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  a3.i32[3] = 0;
  a1.i64[0] = vmlaq_f32(a3, a2, a1).u64[0];
  return *(double *)a1.i64;
}

{
  double result;

  *(void *)&double result = vmlaq_f32(a3, a2, a1).u64[0];
  return result;
}

double round(_:)(float32x4_t a1)
{
  a1.i32[3] = 0;
  a1.i64[0] = vrndaq_f32(a1).u64[0];
  return *(double *)a1.i64;
}

{
  double result;

  *(void *)&double result = vrndaq_f32(a1).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vrndaq_f32(a1).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vrndaq_f32(a1).u64[0];
  return result;
}

double fmod(_:_:)(simd_float4 a1, simd_float4 a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  *(void *)&double result = _simd_fmod_f4(a1, a2).u64[0];
  return result;
}

double remainder(_:_:)(simd_float4 a1, simd_float4 a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  *(void *)&double result = _simd_remainder_f4(a1, a2).u64[0];
  return result;
}

double nextafter(_:_:)(simd_float4 a1, simd_float4 a2)
{
  a1.i32[3] = 0;
  a2.i32[3] = 0;
  *(void *)&double result = _simd_nextafter_f4(a1, a2).u64[0];
  return result;
}

double isfinite(_:)(float32x4_t a1)
{
  *(void *)&double result = vbicq_s8(vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1)), (int8x16_t)vceqq_f32(vabsq_f32(a1), (float32x4_t)vdupq_n_s32(0x7F800000u))).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vbicq_s8(vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1)), (int8x16_t)vceqq_f32((float32x4_t)(*(_OWORD *)&a1 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), (float32x4_t)vdupq_n_s32(0x7F800000u))).u64[0];
  return result;
}

double isinf(_:)(float32x4_t a1)
{
  *(void *)&double result = vceqq_f32(vabsq_f32(a1), (float32x4_t)vdupq_n_s32(0x7F800000u)).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vceqq_f32(vabsq_f32(a1), (float32x4_t)vdupq_n_s32(0x7F800000u)).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vceqq_f32(vabsq_f32(a1), (float32x4_t)vdupq_n_s32(0x7F800000u)).u64[0];
  return result;
}

double isnan(_:)(float32x4_t a1)
{
  *(void *)&double result = vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1))).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1))).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1))).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1))).u64[0];
  return result;
}

double isnormal(_:)(float32x4_t a1)
{
  int8x16_t v1 = vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1));
  float32x4_t v2 = vabsq_f32(a1);
  v3.i64[0] = 0x80000000800000;
  v3.i64[1] = 0x80000000800000;
  *(void *)&double result = vandq_s8(vbicq_s8(v1, (int8x16_t)vceqq_f32(v2, (float32x4_t)vdupq_n_s32(0x7F800000u))), (int8x16_t)vcgeq_f32(v2, v3)).u64[0];
  return result;
}

{
  float32x4_t v1;
  double result;

  v1.i64[0] = 0x80000000800000;
  v1.i64[1] = 0x80000000800000;
  *(void *)&double result = vandq_s8(vbicq_s8(vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1)), (int8x16_t)vceqq_f32((float32x4_t)(*(_OWORD *)&a1 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), (float32x4_t)vdupq_n_s32(0x7F800000u))), (int8x16_t)vcgeq_f32((float32x4_t)(*(_OWORD *)&a1 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), v1)).u64[0];
  return result;
}

double isinf(_:)(__n128 a1)
{
  *(void *)&double result = vceqq_f32((float32x4_t)(*(_OWORD *)&a1 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), (float32x4_t)vdupq_n_s32(0x7F800000u)).u64[0];
  return result;
}

__n128 cos(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_cos_f4(a1);
  _simd_cos_f4(a2);
  return (__n128)v3;
}

__n128 cosh(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_cosh_f4(a1);
  _simd_cosh_f4(a2);
  return (__n128)v3;
}

__n128 cospi(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_cospi_f4(a1);
  _simd_cospi_f4(a2);
  return (__n128)v3;
}

__n128 acos(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_acos_f4(a1);
  _simd_acos_f4(a2);
  return (__n128)v3;
}

__n128 acosh(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_acosh_f4(a1);
  _simd_acosh_f4(a2);
  return (__n128)v3;
}

__n128 sin(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_sin_f4(a1);
  _simd_sin_f4(a2);
  return (__n128)v3;
}

__n128 sinh(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_sinh_f4(a1);
  _simd_sinh_f4(a2);
  return (__n128)v3;
}

__n128 sinpi(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_sinpi_f4(a1);
  _simd_sinpi_f4(a2);
  return (__n128)v3;
}

__n128 asin(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_asin_f4(a1);
  _simd_asin_f4(a2);
  return (__n128)v3;
}

__n128 asinh(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_asinh_f4(a1);
  _simd_asinh_f4(a2);
  return (__n128)v3;
}

__n128 tan(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_tan_f4(a1);
  _simd_tan_f4(a2);
  return (__n128)v3;
}

__n128 tanh(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_tanh_f4(a1);
  _simd_tanh_f4(a2);
  return (__n128)v3;
}

__n128 tanpi(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_tanpi_f4(a1);
  _simd_tanpi_f4(a2);
  return (__n128)v3;
}

__n128 atan(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_atan_f4(a1);
  _simd_atan_f4(a2);
  return (__n128)v3;
}

__n128 atanh(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_atanh_f4(a1);
  _simd_atanh_f4(a2);
  return (__n128)v3;
}

__n128 atan2(_:_:)(simd_float4 a1, simd_float4 a2, simd_float4 a3, simd_float4 a4)
{
  simd_float4 v5 = _simd_atan2_f4(a1, a3);
  _simd_atan2_f4(a2, a4);
  return (__n128)v5;
}

__n128 exp(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_exp_f4(a1);
  _simd_exp_f4(a2);
  return (__n128)v3;
}

__n128 exp2(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_exp2_f4(a1);
  _simd_exp2_f4(a2);
  return (__n128)v3;
}

__n128 exp10(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_exp10_f4(a1);
  _simd_exp10_f4(a2);
  return (__n128)v3;
}

__n128 expm1(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_expm1_f4(a1);
  _simd_expm1_f4(a2);
  return (__n128)v3;
}

__n128 log(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_log_f4(a1);
  _simd_log_f4(a2);
  return (__n128)v3;
}

__n128 log2(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_log2_f4(a1);
  _simd_log2_f4(a2);
  return (__n128)v3;
}

__n128 log10(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_log10_f4(a1);
  _simd_log10_f4(a2);
  return (__n128)v3;
}

__n128 log1p(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_log1p_f4(a1);
  _simd_log1p_f4(a2);
  return (__n128)v3;
}

__n128 lgamma(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_lgamma_f4(a1);
  _simd_lgamma_f4(a2);
  return (__n128)v3;
}

__n128 tgamma(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_tgamma_f4(a1);
  _simd_tgamma_f4(a2);
  return (__n128)v3;
}

__n128 erf(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_erf_f4(a1);
  _simd_erf_f4(a2);
  return (__n128)v3;
}

__n128 erfc(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_erfc_f4(a1);
  _simd_erfc_f4(a2);
  return (__n128)v3;
}

__n128 cbrt(_:)(simd_float4 a1, simd_float4 a2)
{
  simd_float4 v3 = _simd_cbrt_f4(a1);
  _simd_cbrt_f4(a2);
  return (__n128)v3;
}

__n128 pow(_:_:)(simd_float4 a1, simd_float4 a2, simd_float4 a3, simd_float4 a4)
{
  simd_float4 v5 = _simd_pow_f4(a1, a3);
  _simd_pow_f4(a2, a4);
  return (__n128)v5;
}

__n128 hypot(_:_:)(simd_float4 a1, simd_float4 a2, simd_float4 a3, simd_float4 a4)
{
  simd_float4 v5 = _simd_hypot_f4(a1, a3);
  _simd_hypot_f4(a2, a4);
  return (__n128)v5;
}

double fma(_:_:_:)(float32x4_t a1, double a2, float32x4_t a3, double a4, float32x4_t a5)
{
  *(void *)&double result = vmlaq_f32(a5, a3, a1).u64[0];
  return result;
}

__n128 fmod(_:_:)(simd_float4 a1, simd_float4 a2, simd_float4 a3, simd_float4 a4)
{
  simd_float4 v5 = _simd_fmod_f4(a1, a3);
  _simd_fmod_f4(a2, a4);
  return (__n128)v5;
}

__n128 remainder(_:_:)(simd_float4 a1, simd_float4 a2, simd_float4 a3, simd_float4 a4)
{
  simd_float4 v5 = _simd_remainder_f4(a1, a3);
  _simd_remainder_f4(a2, a4);
  return (__n128)v5;
}

__n128 nextafter(_:_:)(simd_float4 a1, simd_float4 a2, simd_float4 a3, simd_float4 a4)
{
  simd_float4 v5 = _simd_nextafter_f4(a1, a3);
  _simd_nextafter_f4(a2, a4);
  return (__n128)v5;
}

double isfinite(_:)(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = (float32x4_t)vdupq_n_s32(0x7F800000u);
  int16x8_t v3 = (int16x8_t)vbicq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1)), (int16x8_t)vorrq_s8((int8x16_t)vcltzq_f32(a2), (int8x16_t)vcgezq_f32(a2))), (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(vabsq_f32(a1), v2), (int16x8_t)vceqq_f32(vabsq_f32(a2), v2)));
  *(void *)&double result = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vzip1_s8(vmovn_s16(v3), *(int8x8_t *)v3.i8)), 0x1FuLL)).u64[0];
  return result;
}

{
  int8x8_t v2;
  float32x4_t v3;
  int8x8_t v4;
  double result;

  float32x4_t v2 = vmovn_s16(vuzp1q_s16((int16x8_t)vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1)), (int16x8_t)vorrq_s8((int8x16_t)vcltzq_f32(a2), (int8x16_t)vcgezq_f32(a2))));
  int16x8_t v3 = (float32x4_t)vdupq_n_s32(0x7F800000u);
  int8x16_t v4 = vmovn_s16((int16x8_t)vmvnq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(vabsq_f32(a1), v3), (int16x8_t)vceqq_f32(vabsq_f32(a2), v3))));
  *(void *)&double result = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vzip1_s8(vand_s8(v4, v2), v4)), 0x1FuLL)).u64[0];
  return result;
}

double isnormal(_:)(float32x4_t a1, float32x4_t a2)
{
  int8x16_t v2 = (int8x16_t)vuzp1q_s16((int16x8_t)vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1)), (int16x8_t)vorrq_s8((int8x16_t)vcltzq_f32(a2), (int8x16_t)vcgezq_f32(a2)));
  float32x4_t v3 = vabsq_f32(a1);
  float32x4_t v4 = vabsq_f32(a2);
  float32x4_t v5 = (float32x4_t)vdupq_n_s32(0x7F800000u);
  int8x16_t v6 = vbicq_s8(v2, (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(v3, v5), (int16x8_t)vceqq_f32(v4, v5)));
  v5.i64[0] = 0x80000000800000;
  v5.i64[1] = 0x80000000800000;
  int16x8_t v7 = (int16x8_t)vandq_s8(v6, (int8x16_t)vuzp1q_s16((int16x8_t)vcgeq_f32(v3, v5), (int16x8_t)vcgeq_f32(v4, v5)));
  *(void *)&double result = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vzip1_s8(vmovn_s16(v7), *(int8x8_t *)v7.i8)), 0x1FuLL)).u64[0];
  return result;
}

{
  int8x8_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  int8x8_t v6;
  float32x4_t v7;
  double result;

  int8x16_t v2 = vmovn_s16(vuzp1q_s16((int16x8_t)vorrq_s8((int8x16_t)vcltzq_f32(a1), (int8x16_t)vcgezq_f32(a1)), (int16x8_t)vorrq_s8((int8x16_t)vcltzq_f32(a2), (int8x16_t)vcgezq_f32(a2))));
  float32x4_t v3 = vabsq_f32(a1);
  float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x7F800000u);
  float32x4_t v5 = vabsq_f32(a2);
  int8x16_t v6 = vmovn_s16((int16x8_t)vmvnq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(v3, v4), (int16x8_t)vceqq_f32(v5, v4))));
  v7.i64[0] = 0x80000000800000;
  v7.i64[1] = 0x80000000800000;
  *(int8x8_t *)v3.f32 = vand_s8(v2, vmovn_s16(vuzp1q_s16((int16x8_t)vcgeq_f32(v3, v7), (int16x8_t)vcgeq_f32(v5, v7))));
  *(void *)&double result = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vzip1_s8(vand_s8(v6, *(int8x8_t *)v3.f32), *(int8x8_t *)v3.f32)), 0x1FuLL)).u64[0];
  return result;
}

double fma(_:_:_:)(float32x4_t a1, double a2, double a3, double a4, float32x4_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, float32x4_t a14)
{
  *(void *)&double result = vmlaq_f32(a14, a5, a1).u64[0];
  return result;
}

double ceil(_:)(__n128 a1, __n128 a2)
{
  LOWORD(v2) = a1.n128_u16[0];
  HIWORD(v2) = a2.n128_u16[0];
  *(void *)&double result = vrndpq_f16((float16x8_t)v2).u64[0];
  return result;
}

double floor(_:)(__n128 a1, __n128 a2)
{
  LOWORD(v2) = a1.n128_u16[0];
  HIWORD(v2) = a2.n128_u16[0];
  *(void *)&double result = vrndmq_f16((float16x8_t)v2).u64[0];
  return result;
}

double trunc(_:)(__n128 a1, __n128 a2)
{
  LOWORD(v2) = a1.n128_u16[0];
  HIWORD(v2) = a2.n128_u16[0];
  *(void *)&double result = vrndq_f16((float16x8_t)v2).u64[0];
  return result;
}

double rint(_:)(__n128 a1, __n128 a2)
{
  LOWORD(v2) = a1.n128_u16[0];
  HIWORD(v2) = a2.n128_u16[0];
  *(void *)&double result = vrndxq_f16((float16x8_t)v2).u64[0];
  return result;
}

float16x4_t sqrt(_:)(__n128 a1, __n128 a2)
{
  LOWORD(v2) = a1.n128_u16[0];
  HIWORD(v2) = a2.n128_u16[0];
  return vsqrt_f16((float16x4_t)v2);
}

float16x4_t abs(_:)(float16x4_t a1, __n128 a2)
{
  a1.i16[1] = a2.n128_u16[0];
  return vabs_f16(a1);
}

float16x4_t min(_:_:)(float a1, __n128 a2, float a3, __n128 a4)
{
  HIWORD(a1) = a2.n128_u16[0];
  HIWORD(a3) = a4.n128_u16[0];
  return vminnm_f16((float16x4_t)LODWORD(a1), (float16x4_t)LODWORD(a3));
}

float16x4_t max(_:_:)(float a1, __n128 a2, float a3, __n128 a4)
{
  HIWORD(a1) = a2.n128_u16[0];
  HIWORD(a3) = a4.n128_u16[0];
  return vmaxnm_f16((float16x4_t)LODWORD(a1), (float16x4_t)LODWORD(a3));
}

float16x4_t min(_:_:)(float a1, __n128 a2, int16x4_t a3)
{
  HIWORD(a1) = a2.n128_u16[0];
  return vminnm_f16((float16x4_t)LODWORD(a1), (float16x4_t)vdup_lane_s16(a3, 0).u32[0]);
}

float16x4_t max(_:_:)(float a1, __n128 a2, int16x4_t a3)
{
  HIWORD(a1) = a2.n128_u16[0];
  return vmaxnm_f16((float16x4_t)LODWORD(a1), (float16x4_t)vdup_lane_s16(a3, 0).u32[0]);
}

float16x4_t ceil(_:)(float16x4_t a1)
{
  a1.i16[3] = 0;
  return vrndp_f16(a1);
}

{
  return vrndp_f16(a1);
}

float16x4_t floor(_:)(float16x4_t a1)
{
  a1.i16[3] = 0;
  return vrndm_f16(a1);
}

{
  return vrndm_f16(a1);
}

float16x4_t trunc(_:)(float16x4_t a1)
{
  a1.i16[3] = 0;
  return vrnd_f16(a1);
}

{
  return vrnd_f16(a1);
}

float16x4_t rint(_:)(float16x4_t a1)
{
  a1.i16[3] = 0;
  return vrndx_f16(a1);
}

{
  return vrndx_f16(a1);
}

float16x4_t sqrt(_:)(float16x4_t a1)
{
  a1.i16[3] = 0;
  return vsqrt_f16(a1);
}

{
  return vsqrt_f16(a1);
}

float16x4_t abs(_:)(float16x4_t a1)
{
  return vabs_f16(a1);
}

{
  return vabs_f16(a1);
}

float16x4_t min(_:_:)(float16x4_t a1, float16x4_t a2)
{
  a1.i16[3] = 0;
  a2.i16[3] = 0;
  return vminnm_f16(a1, a2);
}

{
  return vminnm_f16(a1, a2);
}

float16x4_t max(_:_:)(float16x4_t a1, float16x4_t a2)
{
  a1.i16[3] = 0;
  a2.i16[3] = 0;
  return vmaxnm_f16(a1, a2);
}

{
  return vmaxnm_f16(a1, a2);
}

float16x4_t min(_:_:)(float16x4_t a1, int16x4_t a2)
{
  a1.i16[3] = 0;
  float16x4_t v2 = (float16x4_t)vdup_lane_s16(a2, 0);
  v2.i16[3] = 0;
  return vminnm_f16(a1, v2);
}

{
  return vminnm_f16(a1, (float16x4_t)vdup_lane_s16(a2, 0));
}

float16x4_t max(_:_:)(float16x4_t a1, int16x4_t a2)
{
  a1.i16[3] = 0;
  float16x4_t v2 = (float16x4_t)vdup_lane_s16(a2, 0);
  v2.i16[3] = 0;
  return vmaxnm_f16(a1, v2);
}

{
  return vmaxnm_f16(a1, (float16x4_t)vdup_lane_s16(a2, 0));
}

double ceil(_:)(float16x8_t a1)
{
  *(void *)&double result = vrndpq_f16(a1).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vrndpq_f16(a1).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vrndpq_f16(a1).u64[0];
  return result;
}

double floor(_:)(float16x8_t a1)
{
  *(void *)&double result = vrndmq_f16(a1).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vrndmq_f16(a1).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vrndmq_f16(a1).u64[0];
  return result;
}

double trunc(_:)(float16x8_t a1)
{
  *(void *)&double result = vrndq_f16(a1).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vrndq_f16(a1).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vrndq_f16(a1).u64[0];
  return result;
}

double rint(_:)(float16x8_t a1)
{
  *(void *)&double result = vrndxq_f16(a1).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vrndxq_f16(a1).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vrndxq_f16(a1).u64[0];
  return result;
}

double sqrt(_:)(float16x8_t a1)
{
  *(void *)&double result = vsqrtq_f16(a1).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vsqrtq_f16(a1).u64[0];
  return result;
}

{
  double result;

  *(void *)&double result = vsqrtq_f16(a1).u64[0];
  return result;
}

double abs(_:)(float16x8_t a1)
{
  *(void *)&double result = vabsq_f16(a1).u64[0];
  return result;
}

double min(_:_:)(float16x8_t a1, float16x8_t a2)
{
  *(void *)&double result = vminnmq_f16(a1, a2).u64[0];
  return result;
}

double max(_:_:)(float16x8_t a1, float16x8_t a2)
{
  *(void *)&double result = vmaxnmq_f16(a1, a2).u64[0];
  return result;
}

double min(_:_:)(float16x8_t a1, int16x4_t a2)
{
  *(void *)&double result = vminnmq_f16(a1, (float16x8_t)vdupq_lane_s16(a2, 0)).u64[0];
  return result;
}

double max(_:_:)(float16x8_t a1, int16x4_t a2)
{
  *(void *)&double result = vmaxnmq_f16(a1, (float16x8_t)vdupq_lane_s16(a2, 0)).u64[0];
  return result;
}

__n64 abs(_:)(__n64 result)
{
  result.n64_u32[0] &= 0x7FFF7FFFu;
  result.n64_u16[2] &= ~0x8000u;
  result.n64_u16[3] &= ~0x8000u;
  return result;
}

{
  result.n64_u32[0] &= 0x7FFF7FFFu;
  result.n64_u16[2] &= ~0x8000u;
  result.n64_u16[3] &= ~0x8000u;
  return result;
}

double min(_:_:)(float16x8_t a1, double a2, float16x8_t a3)
{
  *(void *)&double result = vminnmq_f16(a1, a3).u64[0];
  return result;
}

double max(_:_:)(float16x8_t a1, double a2, float16x8_t a3)
{
  *(void *)&double result = vmaxnmq_f16(a1, a3).u64[0];
  return result;
}

double min(_:_:)(float16x8_t a1, double a2, int16x4_t a3)
{
  *(void *)&double result = vminnmq_f16(a1, (float16x8_t)vdupq_lane_s16(a3, 0)).u64[0];
  return result;
}

double max(_:_:)(float16x8_t a1, double a2, int16x4_t a3)
{
  *(void *)&double result = vmaxnmq_f16(a1, (float16x8_t)vdupq_lane_s16(a3, 0)).u64[0];
  return result;
}

double min(_:_:)(float16x8_t a1, double a2, double a3, double a4, float16x8_t a5)
{
  *(void *)&double result = vminnmq_f16(a1, a5).u64[0];
  return result;
}

double max(_:_:)(float16x8_t a1, double a2, double a3, double a4, float16x8_t a5)
{
  *(void *)&double result = vmaxnmq_f16(a1, a5).u64[0];
  return result;
}

double min(_:_:)(float16x8_t a1, double a2, double a3, double a4, int16x4_t a5)
{
  *(void *)&double result = vminnmq_f16(a1, (float16x8_t)vdupq_lane_s16(a5, 0)).u64[0];
  return result;
}

double max(_:_:)(float16x8_t a1, double a2, double a3, double a4, int16x4_t a5)
{
  *(void *)&double result = vmaxnmq_f16(a1, (float16x8_t)vdupq_lane_s16(a5, 0)).u64[0];
  return result;
}

void *sub_21282FEEC@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (!*a2) {
    goto LABEL_4;
  }
  if (*a2 == 1)
  {
    ++result;
LABEL_4:
    *a3 = *result;
    return result;
  }
  __break(1u);
  return result;
}

void *sub_21282FF10(void *result, void *a2, void *a3)
{
  if (!*a3) {
    goto LABEL_4;
  }
  if (*a3 == 1)
  {
    ++a2;
LABEL_4:
    *a2 = *result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_21282FF34()
{
  return 0;
}

uint64_t sub_21282FF44@<X0>(uint64_t result@<X0>, void *a2@<X1>, _DWORD *a3@<X8>)
{
  if (*a2)
  {
    if (*a2 != 1) {
      goto LABEL_7;
    }
    result += 8;
  }
  if (a2[1] <= 1uLL)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 1));
    return result;
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_21282FF7C()
{
  return 0;
}

void *sub_21282FF8C@<X0>(void *result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    goto LABEL_6;
  }
  if (v3 == 1)
  {
    ++result;
LABEL_6:
    *a3 = *result;
    return result;
  }
  if (v3 == 2)
  {
    result += 2;
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t *sub_21282FFC0(uint64_t *result, void *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  uint64_t v4 = *result;
  if (!*a3) {
    goto LABEL_4;
  }
  if (v3 == 1)
  {
    ++a2;
LABEL_4:
    *a2 = v4;
    return result;
  }
  if (v3 == 2) {
    a2[2] = v4;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_21282FFF4()
{
  return 0;
}

uint64_t sub_21283000C()
{
  return 0;
}

void *sub_21283001C@<X0>(void *result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    goto LABEL_8;
  }
  switch(v3)
  {
    case 2:
      result += 2;
      goto LABEL_8;
    case 1:
      ++result;
LABEL_8:
      *a3 = *result;
      return result;
    case 3:
      result += 3;
      goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t *sub_212830060(uint64_t *result, void *a2, void *a3)
{
  uint64_t v3 = *result;
  switch(*a3)
  {
    case 0:
      goto LABEL_3;
    case 1:
      ++a2;
LABEL_3:
      *a2 = v3;
      break;
    case 2:
      a2[2] = v3;
      break;
    case 3:
      a2[3] = v3;
      break;
    default:
      __break(1u);
      JUMPOUT(0x2128300B0);
  }
  return result;
}

uint64_t sub_2128300C0()
{
  return 0;
}

uint64_t sub_2128300D8()
{
  return 0;
}

uint64_t sub_2128300F0()
{
  return 0;
}

uint64_t sub_212830100@<X0>(uint64_t result@<X0>, void *a2@<X1>, _DWORD *a3@<X8>)
{
  if (*a2)
  {
    if (*a2 != 1) {
      goto LABEL_7;
    }
    result += 16;
  }
  if (a2[1] <= 2uLL)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 3));
    return result;
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_212830138()
{
  return 0;
}

uint64_t sub_212830150()
{
  return 0;
}

uint64_t sub_212830168()
{
  return 0;
}

uint64_t sub_212830180()
{
  return 0;
}

uint64_t sub_212830198()
{
  return 0;
}

_OWORD *keypath_get_21Tm@<X0>(_OWORD *result@<X0>, void *a2@<X1>, _OWORD *a3@<X8>)
{
  if (!*a2) {
    goto LABEL_4;
  }
  if (*a2 == 1)
  {
    ++result;
LABEL_4:
    *a3 = *result;
    return result;
  }
  __break(1u);
  return result;
}

_OWORD *keypath_set_22Tm(_OWORD *result, _OWORD *a2, void *a3)
{
  if (!*a3) {
    goto LABEL_4;
  }
  if (*a3 == 1)
  {
    ++a2;
LABEL_4:
    *a2 = *result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_2128301F8()
{
  return 0;
}

uint64_t sub_212830208@<X0>(uint64_t result@<X0>, void *a2@<X1>, _DWORD *a3@<X8>)
{
  if (*a2)
  {
    if (*a2 != 1) {
      goto LABEL_7;
    }
    result += 16;
  }
  if (a2[1] <= 3uLL)
  {
    *a3 = *(_DWORD *)(result + 4 * (a2[1] & 3));
    return result;
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_212830240()
{
  return 0;
}

_OWORD *keypath_get_29Tm@<X0>(_OWORD *result@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    goto LABEL_6;
  }
  if (v3 == 1)
  {
    ++result;
LABEL_6:
    *a3 = *result;
    return result;
  }
  if (v3 == 2)
  {
    result += 2;
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

long long *keypath_set_30Tm(long long *result, _OWORD *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  long long v4 = *result;
  if (!*a3) {
    goto LABEL_4;
  }
  if (v3 == 1)
  {
    ++a2;
LABEL_4:
    *a2 = v4;
    return result;
  }
  if (v3 == 2) {
    a2[2] = v4;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_2128302C0()
{
  return 0;
}

uint64_t sub_2128302D8()
{
  return 0;
}

_OWORD *keypath_get_37Tm@<X0>(_OWORD *result@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    goto LABEL_8;
  }
  switch(v3)
  {
    case 2:
      result += 2;
      goto LABEL_8;
    case 1:
      ++result;
LABEL_8:
      *a3 = *result;
      return result;
    case 3:
      result += 3;
      goto LABEL_8;
  }
  __break(1u);
  return result;
}

long long *keypath_set_38Tm(long long *result, _OWORD *a2, void *a3)
{
  long long v3 = *result;
  switch(*a3)
  {
    case 0:
      goto LABEL_3;
    case 1:
      ++a2;
LABEL_3:
      *a2 = v3;
      break;
    case 2:
      a2[2] = v3;
      break;
    case 3:
      a2[3] = v3;
      break;
    default:
      __break(1u);
      JUMPOUT(0x212830384);
  }
  return result;
}

uint64_t sub_212830394()
{
  return 0;
}

uint64_t sub_2128303AC()
{
  return 0;
}

_OWORD *sub_2128303BC@<X0>(_OWORD *result@<X0>, void *a2@<X1>, _OWORD *a3@<X8>)
{
  if (!*a2) {
    goto LABEL_4;
  }
  if (*a2 == 1)
  {
    ++result;
LABEL_4:
    *a3 = *result;
    return result;
  }
  __break(1u);
  return result;
}

_OWORD *sub_2128303E0(_OWORD *result, _OWORD *a2, void *a3)
{
  if (!*a3) {
    goto LABEL_4;
  }
  if (*a3 == 1)
  {
    ++a2;
LABEL_4:
    *a2 = *result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_212830404()
{
  return 0;
}

uint64_t sub_212830414@<X0>(uint64_t result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*a2)
  {
    if (*a2 != 1) {
      goto LABEL_7;
    }
    result += 16;
  }
  if (a2[1] <= 1uLL)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 1));
    return result;
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_21283044C()
{
  return 0;
}

_OWORD *sub_21283045C@<X0>(_OWORD *result@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    goto LABEL_6;
  }
  if (v3 == 1)
  {
    ++result;
LABEL_6:
    *a3 = *result;
    return result;
  }
  if (v3 == 2)
  {
    result += 2;
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

long long *sub_212830490(long long *result, _OWORD *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  long long v4 = *result;
  if (!*a3) {
    goto LABEL_4;
  }
  if (v3 == 1)
  {
    ++a2;
LABEL_4:
    *a2 = v4;
    return result;
  }
  if (v3 == 2) {
    a2[2] = v4;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_2128304C4()
{
  return 0;
}

uint64_t sub_2128304DC()
{
  return 0;
}

_OWORD *sub_2128304EC@<X0>(_OWORD *result@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    goto LABEL_8;
  }
  switch(v3)
  {
    case 2:
      result += 2;
      goto LABEL_8;
    case 1:
      ++result;
LABEL_8:
      *a3 = *result;
      return result;
    case 3:
      result += 3;
      goto LABEL_8;
  }
  __break(1u);
  return result;
}

long long *sub_212830530(long long *result, _OWORD *a2, void *a3)
{
  long long v3 = *result;
  switch(*a3)
  {
    case 0:
      goto LABEL_3;
    case 1:
      ++a2;
LABEL_3:
      *a2 = v3;
      break;
    case 2:
      a2[2] = v3;
      break;
    case 3:
      a2[3] = v3;
      break;
    default:
      __break(1u);
      JUMPOUT(0x212830580);
  }
  return result;
}

uint64_t sub_212830590()
{
  return 0;
}

uint64_t sub_2128305A8()
{
  return 0;
}

uint64_t sub_2128305C0()
{
  return 0;
}

uint64_t sub_2128305D0@<X0>(uint64_t result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*a2)
  {
    if (*a2 != 1) {
      goto LABEL_7;
    }
    result += 32;
  }
  if (a2[1] <= 2uLL)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 3));
    return result;
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_212830608()
{
  return 0;
}

uint64_t sub_212830620()
{
  return 0;
}

uint64_t sub_212830638()
{
  return 0;
}

uint64_t sub_212830650()
{
  return 0;
}

uint64_t sub_212830668()
{
  return 0;
}

_OWORD *keypath_get_93Tm@<X0>(_OWORD *result@<X0>, void *a2@<X1>, _OWORD *a3@<X8>)
{
  if (!*a2) {
    goto LABEL_4;
  }
  if (*a2 == 1)
  {
    result += 2;
LABEL_4:
    long long v3 = result[1];
    *a3 = *result;
    a3[1] = v3;
    return result;
  }
  __break(1u);
  return result;
}

_OWORD *keypath_set_94Tm(_OWORD *result, _OWORD *a2, void *a3)
{
  long long v3 = result[1];
  if (!*a3) {
    goto LABEL_4;
  }
  if (*a3 == 1)
  {
    a2 += 2;
LABEL_4:
    *a2 = *result;
    a2[1] = v3;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_2128306C8()
{
  return 0;
}

uint64_t sub_2128306D8@<X0>(uint64_t result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*a2)
  {
    if (*a2 != 1) {
      goto LABEL_7;
    }
    result += 32;
  }
  if (a2[1] <= 3uLL)
  {
    *a3 = *(void *)(result + 8 * (a2[1] & 3));
    return result;
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_212830710()
{
  return 0;
}

_OWORD *keypath_get_101Tm@<X0>(_OWORD *result@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    goto LABEL_6;
  }
  if (v3 == 1)
  {
    result += 2;
LABEL_6:
    long long v4 = result[1];
    *a3 = *result;
    a3[1] = v4;
    return result;
  }
  if (v3 == 2)
  {
    result += 4;
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

long long *keypath_set_102Tm(long long *result, _OWORD *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  long long v5 = *result;
  long long v4 = result[1];
  if (!*a3) {
    goto LABEL_4;
  }
  if (v3 == 1)
  {
    a2 += 2;
LABEL_4:
    *a2 = v5;
    a2[1] = v4;
    return result;
  }
  if (v3 == 2)
  {
    int8x16_t v6 = a2 + 4;
    *int8x16_t v6 = v5;
    v6[1] = v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_212830794()
{
  return 0;
}

uint64_t sub_2128307AC()
{
  return 0;
}

_OWORD *keypath_get_109Tm@<X0>(_OWORD *result@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    goto LABEL_8;
  }
  switch(v3)
  {
    case 2:
      result += 4;
      goto LABEL_8;
    case 1:
      result += 2;
LABEL_8:
      long long v4 = result[1];
      *a3 = *result;
      a3[1] = v4;
      return result;
    case 3:
      result += 6;
      goto LABEL_8;
  }
  __break(1u);
  return result;
}

long long *keypath_set_110Tm(long long *result, _OWORD *a2, void *a3)
{
  long long v4 = *result;
  long long v3 = result[1];
  switch(*a3)
  {
    case 0:
      goto LABEL_3;
    case 1:
      a2 += 2;
LABEL_3:
      *a2 = v4;
      a2[1] = v3;
      break;
    case 2:
      long long v5 = a2 + 4;
      *long long v5 = v4;
      v5[1] = v3;
      break;
    case 3:
      int8x16_t v6 = a2 + 6;
      *int8x16_t v6 = v4;
      v6[1] = v3;
      break;
    default:
      __break(1u);
      JUMPOUT(0x212830860);
  }
  return result;
}

uint64_t sub_212830870()
{
  return 0;
}

uint64_t sub_212830888()
{
  return 0;
}

void __swiftcall simd_quatf.init(ix:iy:iz:r:)(simd_quatf *__return_ptr retstr, Swift::Float ix, Swift::Float iy, Swift::Float iz, Swift::Float r)
{
}

double simd_quatf.init(real:imag:)(double a1, double a2)
{
  return a2;
}

double simd_quatf.init(angle:axis:)(float a1, float32x4_t a2)
{
  *(void *)&double result = vmulq_n_f32(a2, __sincosf_stret(a1 * 0.5).__sinval).u64[0];
  return result;
}

double simd_quaternion(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vmulq_f32(a1, a2);
  if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), vaddq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v2.f32, 1))).f32[0] >= 0.0)
  {
    v33  = vaddq_f32(a1, a2);
    int32x4_t v34 = (int32x4_t)vmulq_f32(v33, v33);
    v34.i32[0]  = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2), vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1))).u32[0];
    v35  = vrsqrte_f32((float32x2_t)v34.u32[0]);
    float32x2_t v36 = vmul_f32(v35, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)));
    float32x4_t v37 = vmulq_n_f32(v33, vmul_f32(v36, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v36, v36))).f32[0]);
    v38  = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v37, (int32x4_t)v37), (int8x16_t)v37, 0xCuLL), vnegq_f32(a1)), v37, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a1, (int32x4_t)a1), (int8x16_t)a1, 0xCuLL));
    unint64_t v32 = vextq_s8((int8x16_t)vuzp1q_s32(v38, v38), (int8x16_t)v38, 0xCuLL).u64[0];
  }
  else
  {
    int32x4_t v3 = (int32x4_t)vmulq_f32(a1, a1);
    v3.i32[0]  = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v3, 2), vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v3.i8, 1))).u32[0];
    float32x2_t v4 = vrsqrte_f32((float32x2_t)v3.u32[0]);
    float32x2_t v5 = vmul_f32(v4, vrsqrts_f32((float32x2_t)v3.u32[0], vmul_f32(v4, v4)));
    v3.i32[0]  = vmul_f32(v5, vrsqrts_f32((float32x2_t)v3.u32[0], vmul_f32(v5, v5))).u32[0];
    int32x4_t v6 = (int32x4_t)vmulq_f32(a2, a2);
    v6.i32[0]  = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v6, 2), vadd_f32(*(float32x2_t *)v6.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v6.i8, 1))).u32[0];
    float32x2_t v7 = vrsqrte_f32((float32x2_t)v6.u32[0]);
    float32x2_t v8 = vmul_f32(v7, vrsqrts_f32((float32x2_t)v6.u32[0], vmul_f32(v7, v7)));
    float32x4_t v9 = vaddq_f32(vmulq_n_f32(a1, *(float *)v3.i32), vmulq_n_f32(a2, vmul_f32(v8, vrsqrts_f32((float32x2_t)v6.u32[0], vmul_f32(v8, v8))).f32[0]));
    float32x4_t v10 = vmulq_f32(v9, v9);
    float v11 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).f32[0];
    if (v11 <= 1.4211e-14)
    {
      v39  = vabsq_f32(a1);
      v40  = v39.f32[1];
      v41  = v39.f32[2];
      if (v39.f32[0] > v39.f32[1] || v39.f32[0] > v39.f32[2])
      {
        float32x4_t v42 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a1, (int32x4_t)a1), (int8x16_t)a1, 0xCuLL);
        if (v40 <= v41)
        {
          v43  = vmulq_f32(a1, (float32x4_t)xmmword_212833D90);
          v44  = (float32x4_t)xmmword_212833DA0;
        }
        else
        {
          v43  = vmulq_f32(a1, (float32x4_t)xmmword_212833DB0);
          v44  = (float32x4_t)xmmword_212833DC0;
        }
      }
      else
      {
        float32x4_t v42 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a1, (int32x4_t)a1), (int8x16_t)a1, 0xCuLL);
        v43  = vmulq_f32(a1, (float32x4_t)xmmword_212833D70);
        v44  = (float32x4_t)xmmword_212833D80;
      }
      v45  = vmlaq_f32(v43, v44, v42);
      v46  = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v45, (int32x4_t)v45), (int8x16_t)v45, 0xCuLL);
      v47  = (int32x4_t)vmulq_f32(v45, v45);
      v47.i32[0]  = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v47.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v47, 2), *(float32x2_t *)v47.i8)).u32[0];
      float32x2_t v48 = vrsqrte_f32((float32x2_t)v47.u32[0]);
      v49  = vmul_f32(v48, vrsqrts_f32((float32x2_t)v47.u32[0], vmul_f32(v48, v48)));
      unint64_t v32 = vmulq_n_f32(v46, vmul_f32(v49, vrsqrts_f32((float32x2_t)v47.u32[0], vmul_f32(v49, v49))).f32[0]).u64[0];
    }
    else
    {
      float v12 = v11;
      float32x2_t v13 = vrsqrte_f32((float32x2_t)LODWORD(v11));
      float32x2_t v14 = vmul_f32(v13, vrsqrts_f32((float32x2_t)LODWORD(v12), vmul_f32(v13, v13)));
      float32x4_t v15 = vmulq_n_f32(v9, vmul_f32(v14, vrsqrts_f32((float32x2_t)LODWORD(v12), vmul_f32(v14, v14))).f32[0]);
      float32x4_t v16 = vaddq_f32(a1, v15);
      int32x4_t v17 = (int32x4_t)vmulq_f32(v16, v16);
      v17.i32[0]  = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v17, 2), vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v17.i8, 1))).u32[0];
      float32x2_t v18 = vrsqrte_f32((float32x2_t)v17.u32[0]);
      float32x2_t v19 = vmul_f32(v18, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v18, v18)));
      float32x4_t v20 = vmulq_n_f32(v16, vmul_f32(v19, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v19, v19))).f32[0]);
      float32x4_t v21 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v20, (int32x4_t)v20), (int8x16_t)v20, 0xCuLL), vnegq_f32(a1)), v20, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a1, (int32x4_t)a1), (int8x16_t)a1, 0xCuLL));
      float32x4_t v22 = vmulq_f32(v20, a1);
      float32x4_t v23 = vaddq_f32(a2, v15);
      int32x4_t v24 = (int32x4_t)vmulq_f32(v23, v23);
      v24.i32[0]  = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v24, 2), vadd_f32(*(float32x2_t *)v24.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v24.i8, 1))).u32[0];
      *(float32x2_t *)v20.f32  = vrsqrte_f32((float32x2_t)v24.u32[0]);
      *(float32x2_t *)v20.f32  = vmul_f32(*(float32x2_t *)v20.f32, vrsqrts_f32((float32x2_t)v24.u32[0], vmul_f32(*(float32x2_t *)v20.f32, *(float32x2_t *)v20.f32)));
      float32x4_t v25 = vmulq_n_f32(v23, vmul_f32(*(float32x2_t *)v20.f32, vrsqrts_f32((float32x2_t)v24.u32[0], vmul_f32(*(float32x2_t *)v20.f32, *(float32x2_t *)v20.f32))).f32[0]);
      v26  = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25), (int8x16_t)v25, 0xCuLL), vnegq_f32(v15)), v25, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v15, (int32x4_t)v15), (int8x16_t)v15, 0xCuLL));
      v27  = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v26, v26), (int8x16_t)v26, 0xCuLL);
      v28  = vmulq_f32(v15, v25);
      v27.i32[3]  = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1))).u32[0];
      v29  = (int32x4_t)vnegq_f32(v27);
      v30  = (int8x16_t)vtrn2q_s32((int32x4_t)v27, vtrn1q_s32((int32x4_t)v27, v29));
      v31  = (float32x4_t)vrev64q_s32((int32x4_t)v27);
      v31.i32[0]  = v29.i32[1];
      v31.i32[3]  = v29.i32[2];
      unint64_t v32 = vaddq_f32(vmlaq_lane_f32(vmulq_n_f32(v27, vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0]), v31, *(float32x2_t *)v21.f32, 1), vmlaq_laneq_f32(vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)v27, (int8x16_t)v29, 8uLL), v21.f32[0]), (float32x4_t)vextq_s8(v30, v30, 8uLL), v21, 2)).u64[0];
    }
  }
  return *(double *)&v32;
}

void __swiftcall simd_quatf.init(_:)(simd_quatf *__return_ptr retstr, simd_float3x3 *a2)
{
}

double simd_quaternion(simd_float3x3 a1)
{
  float v1 = a1.columns[2].f32[2] + (float)(a1.columns[0].f32[0] + a1.columns[1].f32[1]);
  if (v1 >= 0.0)
  {
    float v8 = sqrtf(v1 + 1.0);
    float32x2_t v9 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v8 + v8));
    float32x2_t v10 = vmul_f32(v9, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v8 + v8), v9));
    float32x2_t v20 = vmul_n_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[1], (int8x16_t)a1.columns[1], 8uLL), *(int32x2_t *)a1.columns[2].f32), (float32x2_t)vext_s8(*(int8x8_t *)a1.columns[2].f32, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[0], (int8x16_t)a1.columns[0], 8uLL), 4uLL)), vmul_f32(v10, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v8 + v8), v10)).f32[0]);
  }
  else if (a1.columns[0].f32[0] < a1.columns[1].f32[1] || a1.columns[0].f32[0] < a1.columns[2].f32[2])
  {
    float v3 = 1.0 - a1.columns[0].f32[0];
    if (a1.columns[1].f32[1] >= a1.columns[2].f32[2])
    {
      float v21 = sqrtf(a1.columns[1].f32[1] + (float)(v3 - a1.columns[2].f32[2]));
      *(float *)&unsigned int v22 = v21 + v21;
      float32x2_t v23 = vrecpe_f32((float32x2_t)v22);
      float32x2_t v24 = vmul_f32(v23, vrecps_f32((float32x2_t)v22, v23));
      v25.i32[0]  = vmul_f32(v24, vrecps_f32((float32x2_t)v22, v24)).u32[0];
      v24.i32[0]  = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)a1.columns[0].f32, 1), *(float32x2_t *)a1.columns[1].f32).u32[0];
      v24.i32[1]  = v22;
      v25.i32[1]  = 0.25;
      float32x2_t v20 = vmul_f32(v24, v25);
    }
    else
    {
      float32x2_t v4 = (float32x2_t)__PAIR64__(a1.columns[0].u32[1], COERCE_UNSIGNED_INT(sqrtf(a1.columns[2].f32[2] + (float)(v3 - a1.columns[1].f32[1]))));
      *(float32x2_t *)a1.columns[2].f32  = vadd_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[0], (int8x16_t)a1.columns[0], 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[1], (int8x16_t)a1.columns[1], 8uLL)), *(float32x2_t *)a1.columns[2].f32);
      *(int32x2_t *)a1.columns[1].f32  = vdup_lane_s32(*(int32x2_t *)a1.columns[1].f32, 0);
      a1.columns[1].i32[0]  = 2.0;
      a1.columns[1].i32[0]  = vmul_f32(v4, *(float32x2_t *)a1.columns[1].f32).u32[0];
      float32x2_t v5 = vrecpe_f32((float32x2_t)a1.columns[1].u32[0]);
      float32x2_t v6 = vmul_f32(v5, vrecps_f32((float32x2_t)a1.columns[1].u32[0], v5));
      float32x2_t v20 = vmul_n_f32(*(float32x2_t *)a1.columns[2].f32, vmul_f32(v6, vrecps_f32((float32x2_t)a1.columns[1].u32[0], v6)).f32[0]);
      __asm { FMOV            V2.2S, #0.25 }
    }
  }
  else
  {
    float32x2_t v11 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)a1.columns[1].f32, 0);
    float32x2_t v12 = vadd_f32(*(float32x2_t *)a1.columns[0].f32, v11);
    v11.i32[0]  = 2.0;
    v11.i32[0]  = vmul_f32((float32x2_t)__PAIR64__(a1.columns[0].u32[1], COERCE_UNSIGNED_INT(sqrtf(a1.columns[0].f32[0]+ (float)((float)(1.0 - a1.columns[1].f32[1]) - a1.columns[2].f32[2])))), v11).u32[0];
    v11.i32[1]  = v12.i32[1];
    float32x2_t v13 = vrecpe_f32((float32x2_t)v11.u32[0]);
    float32x2_t v14 = vmul_f32(v13, vrecps_f32((float32x2_t)v11.u32[0], v13));
    unsigned __int32 v15 = vmul_f32(v14, vrecps_f32((float32x2_t)v11.u32[0], v14)).u32[0];
    __asm { FMOV            V5.2S, #0.25 }
    _D5.i32[1]  = v15;
    float32x2_t v20 = vmul_f32(v11, _D5);
  }
  return *(double *)&v20;
}

float simd_quatf.real.getter(__n128 a1)
{
  return a1.n128_f32[3];
}

void simd_quatf.real.setter(float a1)
{
  *(float *)(v1 + 12)  = a1;
}

float (*simd_quatf.real.modify(uint64_t a1))(float *a1)
{
  *(void *)a1  = v1;
  *(_DWORD *)(a1 + 8)  = *(_DWORD *)(v1 + 12);
  return simd_quatf.real.modify;
}

float simd_quatf.real.modify(float *a1)
{
  float result = a1[2];
  *(float *)(*(void *)a1 + 12)  = result;
  return result;
}

__n128 simd_quatf.imag.setter(__n128 result)
{
  result.n128_u32[3]  = v1->n128_u32[3];
  *uint64_t v1 = result;
  return result;
}

__n128 (*simd_quatf.imag.modify(void *a1))(void **a1)
{
  float v3 = malloc(0x18uLL);
  *a1  = v3;
  v3[2]  = v1;
  *(_OWORD *)float v3 = *v1;
  return simd_quatf.imag.modify;
}

__n128 simd_quatf.imag.modify(void **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = v1[2];
  long long v3 = *(_OWORD *)v1;
  HIDWORD(v3)  = *(_DWORD *)(v2 + 12);
  *(_OWORD *)uint64_t v2 = v3;
  free(v1);
  return result;
}

float simd_quatf.angle.getter(float32x4_t a1)
{
  float32x4_t v1 = vmulq_f32(a1, a1);
  float v2 = atan2f(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v1, 2), vaddq_f32(v1, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v1.f32, 1))).f32[0]), a1.f32[3]);
  return v2 + v2;
}

double simd_quatf.axis.getter(float32x4_t a1)
{
  int32x4_t v1 = (int32x4_t)vmulq_f32(a1, a1);
  v1.i32[0]  = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v1, 2), vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v1.i8, 1))).u32[0];
  float32x2_t v2 = vrsqrte_f32((float32x2_t)v1.u32[0]);
  float32x2_t v3 = vmul_f32(v2, vrsqrts_f32((float32x2_t)v1.u32[0], vmul_f32(v2, v2)));
  *(void *)&double result = vmulq_n_f32(a1, vmul_f32(v3, vrsqrts_f32((float32x2_t)v1.u32[0], vmul_f32(v3, v3))).f32[0]).u64[0];
  return result;
}

double simd_quatf.conjugate.getter(float32x4_t a1)
{
  *(void *)&double result = vmulq_f32(a1, (float32x4_t)xmmword_212833DD0).u64[0];
  return result;
}

double simd_quatf.inverse.getter(float32x4_t a1)
{
  float32x4_t v1 = vmulq_f32(a1, (float32x4_t)xmmword_212833DD0);
  int8x16_t v2 = (int8x16_t)vmulq_f32(a1, a1);
  *(float32x2_t *)v2.i8  = vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
  v2.i32[0]  = vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.i8, 1)).u32[0];
  float32x2_t v3 = vrecpe_f32((float32x2_t)v2.u32[0]);
  float32x2_t v4 = vmul_f32(v3, vrecps_f32((float32x2_t)v2.u32[0], v3));
  *(void *)&double result = vmulq_n_f32(v1, vmul_f32(v4, vrecps_f32((float32x2_t)v2.u32[0], v4)).f32[0]).u64[0];
  return result;
}

double simd_quatf.normalized.getter(float32x4_t a1)
{
  int8x16_t v1 = (int8x16_t)vmulq_f32(a1, a1);
  float32x2_t v2 = vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL));
  if (vaddv_f32(v2) == 0.0) {
    return 0.0;
  }
  unsigned __int32 v4 = vadd_f32(v2, (float32x2_t)vdup_lane_s32((int32x2_t)v2, 1)).u32[0];
  float32x2_t v5 = vrsqrte_f32((float32x2_t)v4);
  float32x2_t v6 = vmul_f32(v5, vrsqrts_f32((float32x2_t)v4, vmul_f32(v5, v5)));
  *(void *)&double result = vmulq_n_f32(a1, vmul_f32(v6, vrsqrts_f32((float32x2_t)v4, vmul_f32(v6, v6))).f32[0]).u64[0];
  return result;
}

float simd_quatf.length.getter(float32x4_t a1)
{
  int8x16_t v1 = (int8x16_t)vmulq_f32(a1, a1);
  return sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL))));
}

double simd_quatf.act(_:)(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vmulq_f32(a2, (float32x4_t)xmmword_212833DD0);
  int32x4_t v3 = (int32x4_t)vnegq_f32(v2);
  int8x16_t v4 = (int8x16_t)vtrn2q_s32((int32x4_t)v2, vtrn1q_s32((int32x4_t)v2, v3));
  float32x4_t v5 = vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v2, (int8x16_t)v3, 8uLL), *(float32x2_t *)a1.f32, 1);
  float32x4_t v6 = (float32x4_t)vrev64q_s32((int32x4_t)v2);
  v6.i32[0]  = v3.i32[1];
  v6.i32[3]  = v3.i32[2];
  float32x4_t v7 = vmlaq_laneq_f32(vmlaq_n_f32(v5, (float32x4_t)vextq_s8(v4, v4, 8uLL), a1.f32[0]), v6, a1, 2);
  int32x4_t v8 = (int32x4_t)vnegq_f32(v7);
  int8x16_t v9 = (int8x16_t)vtrn2q_s32((int32x4_t)v7, vtrn1q_s32((int32x4_t)v7, v8));
  float32x4_t v10 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v7, (int8x16_t)v8, 8uLL), *(float32x2_t *)a2.f32, 1), (float32x4_t)vextq_s8(v9, v9, 8uLL), a2.f32[0]);
  float32x4_t v11 = (float32x4_t)vrev64q_s32((int32x4_t)v7);
  v11.i32[0]  = v8.i32[1];
  v11.i32[3]  = v8.i32[2];
  *(void *)&double result = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v7, a2, 3), v11, a2, 2), v10).u64[0];
  return result;
}

void __swiftcall simd_float3x3.init(_:)(simd_float3x3 *__return_ptr retstr, simd_quatf *a2)
{
  *(double *)v4.i64  = simd_matrix3x3(v2);
  retstr->columns[0]  = v4;
  retstr->columns[1]  = v5;
  retstr->columns[2]  = v6;
}

double simd_matrix3x3(float32x4_t a1)
{
  return simd_matrix4x4(a1);
}

double simd_matrix4x4(float32x4_t a1)
{
  _S3  = a1.i32[1];
  _S5  = a1.i32[2];
  __asm { FMLS            S1, S5, V0.S[2] }
  _S7  = a1.i32[3];
  __asm { FMLA            S1, S7, V0.S[3] }
  float v10 = vmlas_n_f32(vmuls_lane_f32(a1.f32[2], a1, 3), a1.f32[1], a1.f32[0]);
  LODWORD(v11)  = _S1;
  *((float *)&v11 + 1)  = v10 + v10;
  __asm
  {
    FMLA            S6, S3, V0.S[1]
    FMLA            S6, S7, V0.S[3]
    FMLS            S6, S0, V0.S[0]
    FMLA            S18, S5, V0.S[1]
    FMLA            S17, S0, V0.S[2]
    FMLA            S16, S5, V0.S[1]
    FMLA            S7, S5, V0.S[2]
    FMLS            S7, S0, V0.S[0]
    FMLS            S7, S3, V0.S[1]
  }
  return v11;
}

uint64_t simd_quatf.debugDescription.getter()
{
  _StringGuts.grow(_:)(30);
  v0._object  = (void *)0x80000002128348D0;
  v0._countAndFlagsBits  = 0xD000000000000011;
  String.append(_:)(v0);
  Float.write<A>(to:)();
  v1._countAndFlagsBits  = 0x203A67616D69202CLL;
  v1._object  = (void *)0xE800000000000000;
  String.append(_:)(v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SIMD3<Float>);
  lazy protocol witness table accessor for type SIMD3<Float> and conformance SIMD3<A>(&lazy protocol witness table cache variable for type SIMD3<Float> and conformance SIMD3<A>, &demangling cache variable for type metadata for SIMD3<Float>);
  v2._countAndFlagsBits  = SIMD.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits  = 41;
  v3._object  = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return 0;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1  = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1  = result;
  }
  return result;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_quatf()
{
  return simd_quatf.debugDescription.getter();
}

uint64_t static simd_quatf.== infix(_:_:)(float32x4_t a1, float32x4_t a2)
{
  __int8 v2 = 0;
  int16x4_t v3 = vmovn_s32(vceqq_f32(a1, a2));
  if (v3.i8[0] & 1) != 0 && (v3.i8[2] & 1) != 0 && (v3.i8[4]) {
    __int8 v2 = v3.i8[6];
  }
  return v2 & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_quatf(float32x4_t *a1, float32x4_t *a2)
{
  __int8 v2 = 0;
  int16x4_t v3 = vmovn_s32(vceqq_f32(*a1, *a2));
  if (v3.i8[0] & 1) != 0 && (v3.i8[2] & 1) != 0 && (v3.i8[4]) {
    __int8 v2 = v3.i8[6];
  }
  return v2 & 1;
}

void simd_quatf.hash(into:)(int32x4_t a1, int32x4_t a2)
{
  a2.i32[0]  = 0;
  specialized SIMD.hash(into:)((__n128)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(a2, a1), 0), (int8x16_t)vnegq_f32((float32x4_t)a1), (int8x16_t)a1));
}

double simd_negate(float32x4_t a1)
{
  *(void *)&double result = vnegq_f32(a1).u64[0];
  return result;
}

Swift::Int simd_quatf.hashValue.getter(int32x4_t a1)
{
  Hasher.init(_seed:)();
  v1.i32[0]  = 0;
  specialized SIMD.hash(into:)((__n128)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v1, a1), 0), (int8x16_t)vnegq_f32((float32x4_t)a1), (int8x16_t)a1));
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance simd_quatf()
{
  return simd_quatf.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance simd_quatf()
{
  __n128 v1 = *v0;
  if ((*(_OWORD *)v0 & 0x80000000) != 0) {
    v1.n128_f64[0]  = simd_negate((float32x4_t)v1);
  }

  specialized SIMD.hash(into:)(v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance simd_quatf()
{
  simd_quatf v3 = *v0;
  Hasher.init(_seed:)();
  __n128 v1 = (__n128)v3;
  if (v3.vector.i32[0] < 0) {
    v1.n128_f64[0]  = simd_negate((float32x4_t)v3);
  }
  specialized SIMD.hash(into:)(v1);
  return Hasher._finalize()();
}

double static simd_quatf.+ infix(_:_:)(float32x4_t a1, float32x4_t a2)
{
  *(void *)&double result = vaddq_f32(a1, a2).u64[0];
  return result;
}

float32x4_t static simd_quatf.+= infix(_:_:)(float32x4_t *a1, float32x4_t a2)
{
  float32x4_t result = vaddq_f32(*a1, a2);
  *a1  = result;
  return result;
}

double static simd_quatf.- infix(_:_:)(float32x4_t a1, float32x4_t a2)
{
  *(void *)&double result = vsubq_f32(a1, a2).u64[0];
  return result;
}

float32x4_t static simd_quatf.-= infix(_:_:)(float32x4_t *a1, float32x4_t a2)
{
  float32x4_t result = vsubq_f32(*a1, a2);
  *a1  = result;
  return result;
}

double static simd_quatf.- prefix(_:)(float32x4_t a1)
{
  *(void *)&double result = vsubq_f32((float32x4_t)0, a1).u64[0];
  return result;
}

double static simd_quatf.* infix(_:_:)(float32x4_t a1, float32x4_t a2)
{
  int32x4_t v2 = (int32x4_t)vnegq_f32(a2);
  int8x16_t v3 = (int8x16_t)vtrn2q_s32((int32x4_t)a2, vtrn1q_s32((int32x4_t)a2, v2));
  float32x4_t v4 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)a2, (int8x16_t)v2, 8uLL), *(float32x2_t *)a1.f32, 1), (float32x4_t)vextq_s8(v3, v3, 8uLL), a1.f32[0]);
  float32x4_t v5 = (float32x4_t)vrev64q_s32((int32x4_t)a2);
  v5.i32[0]  = v2.i32[1];
  v5.i32[3]  = v2.i32[2];
  *(void *)&double result = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(a2, a1, 3), v5, a1, 2), v4).u64[0];
  return result;
}

double static simd_quatf.* infix(_:_:)(float a1, float32x4_t a2)
{
  *(void *)&double result = vmulq_n_f32(a2, a1).u64[0];
  return result;
}

double static simd_quatf.* infix(_:_:)(float32x4_t a1, float a2)
{
  *(void *)&double result = vmulq_n_f32(a1, a2).u64[0];
  return result;
}

float32x4_t static simd_quatf.*= infix(_:_:)(float32x2_t *a1, float32x4_t a2)
{
  int32x4_t v2 = (int32x4_t)vnegq_f32(a2);
  int8x16_t v3 = (int8x16_t)vtrn2q_s32((int32x4_t)a2, vtrn1q_s32((int32x4_t)a2, v2));
  float32x4_t v4 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)a2, (int8x16_t)v2, 8uLL), *a1, 1), (float32x4_t)vextq_s8(v3, v3, 8uLL), COERCE_FLOAT(*(_OWORD *)a1->f32));
  float32x4_t v5 = (float32x4_t)vrev64q_s32((int32x4_t)a2);
  v5.i32[0]  = v2.i32[1];
  v5.i32[3]  = v2.i32[2];
  float32x4_t result = vaddq_f32(v4, vmlaq_laneq_f32(vmulq_laneq_f32(a2, *(float32x4_t *)a1->f32, 3), v5, *(float32x4_t *)a1->f32, 2));
  *(float32x4_t *)a1->f32  = result;
  return result;
}

float32x4_t static simd_quatf.*= infix(_:_:)(float32x4_t *a1, float a2)
{
  float32x4_t result = vmulq_n_f32(*a1, a2);
  *a1  = result;
  return result;
}

double static simd_quatf./ infix(_:_:)(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vmulq_f32(a2, (float32x4_t)xmmword_212833DD0);
  int8x16_t v3 = (int8x16_t)vmulq_f32(a2, a2);
  *(float32x2_t *)v3.i8  = vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
  v3.i32[0]  = vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v3.i8, 1)).u32[0];
  float32x2_t v4 = vrecpe_f32((float32x2_t)v3.u32[0]);
  float32x2_t v5 = vmul_f32(v4, vrecps_f32((float32x2_t)v3.u32[0], v4));
  float32x4_t v6 = vmulq_n_f32(v2, vmul_f32(v5, vrecps_f32((float32x2_t)v3.u32[0], v5)).f32[0]);
  int32x4_t v7 = (int32x4_t)vnegq_f32(v6);
  int8x16_t v8 = (int8x16_t)vtrn2q_s32((int32x4_t)v6, vtrn1q_s32((int32x4_t)v6, v7));
  float32x4_t v9 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v6, (int8x16_t)v7, 8uLL), *(float32x2_t *)a1.f32, 1), (float32x4_t)vextq_s8(v8, v8, 8uLL), a1.f32[0]);
  float32x4_t v10 = (float32x4_t)vrev64q_s32((int32x4_t)v6);
  v10.i32[0]  = v7.i32[1];
  v10.i32[3]  = v7.i32[2];
  *(void *)&double result = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v6, a1, 3), v10, a1, 2), v9).u64[0];
  return result;
}

double static simd_quatf./ infix(_:_:)(float32x4_t a1, int32x2_t a2)
{
  *(void *)&double result = vdivq_f32(a1, (float32x4_t)vdupq_lane_s32(a2, 0)).u64[0];
  return result;
}

float32x4_t static simd_quatf./= infix(_:_:)(float32x2_t *a1, float32x4_t a2)
{
  float32x4_t v2 = vmulq_f32(a2, (float32x4_t)xmmword_212833DD0);
  int8x16_t v3 = (int8x16_t)vmulq_f32(a2, a2);
  *(float32x2_t *)v3.i8  = vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
  v3.i32[0]  = vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v3.i8, 1)).u32[0];
  float32x2_t v4 = vrecpe_f32((float32x2_t)v3.u32[0]);
  float32x2_t v5 = vmul_f32(v4, vrecps_f32((float32x2_t)v3.u32[0], v4));
  float32x4_t v6 = vmulq_n_f32(v2, vmul_f32(v5, vrecps_f32((float32x2_t)v3.u32[0], v5)).f32[0]);
  int32x4_t v7 = (int32x4_t)vnegq_f32(v6);
  int8x16_t v8 = (int8x16_t)vtrn2q_s32((int32x4_t)v6, vtrn1q_s32((int32x4_t)v6, v7));
  float32x4_t v9 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v6, (int8x16_t)v7, 8uLL), *a1, 1), (float32x4_t)vextq_s8(v8, v8, 8uLL), COERCE_FLOAT(*(_OWORD *)a1->f32));
  float32x4_t v10 = (float32x4_t)vrev64q_s32((int32x4_t)v6);
  v10.i32[0]  = v7.i32[1];
  v10.i32[3]  = v7.i32[2];
  float32x4_t result = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v6, *(float32x4_t *)a1->f32, 3), v10, *(float32x4_t *)a1->f32, 2), v9);
  *(float32x4_t *)a1->f32  = result;
  return result;
}

float32x4_t static simd_quatf./= infix(_:_:)(float32x4_t *a1, int32x2_t a2)
{
  float32x4_t result = vdivq_f32(*a1, (float32x4_t)vdupq_lane_s32(a2, 0));
  *a1  = result;
  return result;
}

Swift::Float __swiftcall dot(_:_:)(simd_quatf *a1, simd_quatf *a2)
{
  int8x16_t v4 = (int8x16_t)vmulq_f32(v2, v3);
  return vaddv_f32(vadd_f32(*(float32x2_t *)v4.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)));
}

void __swiftcall simd_quatd.init(ix:iy:iz:r:)(simd_quatd *__return_ptr retstr, Swift::Double ix, Swift::Double iy, Swift::Double iz, Swift::Double r)
{
}

double simd_quatd.init(real:imag:)(double a1, double a2)
{
  return a2;
}

double simd_quatd.init(angle:axis:)(double a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a2, __sincos_stret(a1 * 0.5).__sinval);
  return result;
}

float64_t simd_quatd.init(from:to:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  v7[0]  = a1;
  v7[1]  = a2;
  v6[0]  = a3;
  v6[1]  = a4;
  simd_quaternion(v7, v6, &v5);
  return v5.f64[0];
}

void __swiftcall simd_quatd.init(_:)(simd_quatd *__return_ptr retstr, simd_double3x3 *a2)
{
  long long v2 = *(_OWORD *)&a2->columns[0].f64[2];
  long long v3 = *(_OWORD *)a2->columns[1].f64;
  long long v4 = *(_OWORD *)&a2->columns[1].f64[2];
  long long v5 = *(_OWORD *)a2->columns[2].f64;
  long long v6 = *(_OWORD *)&a2->columns[2].f64[2];
  v8[0]  = *(_OWORD *)a2->columns[0].f64;
  v8[1]  = v2;
  v8[2]  = v3;
  v8[3]  = v4;
  v8[4]  = v5;
  v8[5]  = v6;
  simd_quaternion((uint64_t)v8, (uint64_t)&v7);
}

void __swiftcall simd_quatd.init(_:)(simd_quatd *__return_ptr retstr, simd_double4x4 *a2)
{
  long long v2 = *(_OWORD *)&a2->columns[0].f64[2];
  long long v3 = *(_OWORD *)a2->columns[1].f64;
  long long v4 = *(_OWORD *)&a2->columns[1].f64[2];
  long long v5 = *(_OWORD *)a2->columns[2].f64;
  long long v6 = *(_OWORD *)&a2->columns[2].f64[2];
  long long v7 = *(_OWORD *)a2->columns[3].f64;
  long long v8 = *(_OWORD *)&a2->columns[3].f64[2];
  v10[0]  = *(_OWORD *)a2->columns[0].f64;
  v10[1]  = v2;
  v10[2]  = v3;
  v10[3]  = v4;
  v10[4]  = v5;
  v10[5]  = v6;
  v10[6]  = v7;
  v10[7]  = v8;
  simd_quaternion((uint64_t)v10, (uint64_t)&v9);
}

double simd_quatd.real.getter(double a1, __n128 a2)
{
  return a2.n128_f64[1];
}

void simd_quatd.real.setter(double a1)
{
  *(double *)(v1 + 24)  = a1;
}

double (*simd_quatd.real.modify(void *a1))(uint64_t a1)
{
  a1[1]  = v1;
  *a1  = *(void *)(v1 + 24);
  return simd_quatd.real.modify;
}

double simd_quatd.real.modify(uint64_t a1)
{
  double result = *(double *)a1;
  *(void *)(*(void *)(a1 + 8) + 24)  = *(void *)a1;
  return result;
}

void simd_quatd.imag.setter(__n128 a1, __n128 a2)
{
  a2.n128_u64[1]  = v2[1].n128_u64[1];
  *long long v2 = a1;
  v2[1]  = a2;
}

void (*simd_quatd.imag.modify(void *a1))(void **a1)
{
  long long v3 = malloc(0x28uLL);
  *a1  = v3;
  v3[4]  = v1;
  long long v4 = v1[1];
  *(_OWORD *)long long v3 = *v1;
  *((_OWORD *)v3 + 1)  = v4;
  return simd_quatd.imag.modify;
}

void simd_quatd.imag.modify(void **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = v1[4];
  long long v3 = *((_OWORD *)v1 + 1);
  *((void *)&v3 + 1)  = *(void *)(v2 + 24);
  *(_OWORD *)uint64_t v2 = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 16)  = v3;
  free(v1);
}

long double simd_quatd.angle.getter(float64x2_t a1, float64x2_t a2)
{
  long double v2 = atan2(sqrt(vmulq_f64(a2, a2).f64[0] + vaddvq_f64(vmulq_f64(a1, a1))), a2.f64[1]);
  return v2 + v2;
}

double simd_quatd.axis.getter(float64x2_t a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, 1.0 / sqrt(vmulq_f64(a2, a2).f64[0] + vaddvq_f64(vmulq_f64(a1, a1))));
  return result;
}

double simd_quatd.conjugate.getter(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vnegq_f64(a1);
  return result;
}

double simd_quatd.inverse.getter(float64x2_t a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(vnegq_f64(a1), 1.0 / vaddvq_f64(vaddq_f64(vmulq_f64(a1, a1), vmulq_f64(a2, a2))));
  return result;
}

double simd_quatd.normalized.getter(float64x2_t a1, float64x2_t a2)
{
  double v2 = vaddvq_f64(vaddq_f64(vmulq_f64(a1, a1), vmulq_f64(a2, a2)));
  if (v2 == 0.0) {
    return 0.0;
  }
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, 1.0 / sqrt(v2));
  return result;
}

double simd_quatd.length.getter(float64x2_t a1, float64x2_t a2)
{
  return sqrt(vaddvq_f64(vaddq_f64(vmulq_f64(a1, a1), vmulq_f64(a2, a2))));
}

double simd_quatd.act(_:)(float64x2_t a1, double a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v4 = vmulq_f64(a4, (float64x2_t)xmmword_212833DF0);
  int8x16_t v5 = (int8x16_t)vnegq_f64(a3);
  float64x2_t v6 = (float64x2_t)vextq_s8((int8x16_t)v4, (int8x16_t)vnegq_f64(v4), 8uLL);
  float64x2_t v7 = vmlaq_n_f64(vmlaq_n_f64(vmulq_laneq_f64(a3, a1, 1), (float64x2_t)vextq_s8(v5, (int8x16_t)a3, 8uLL), a1.f64[0]), v6, a2);
  float64x2_t v8 = vmlaq_n_f64(vmlaq_n_f64(vmulq_laneq_f64(v4, a1, 1), v6, a1.f64[0]), (float64x2_t)vextq_s8((int8x16_t)a3, v5, 8uLL), a2);
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(v8, a4, 1), (float64x2_t)vextq_s8((int8x16_t)vnegq_f64(v8), (int8x16_t)v8, 8uLL), a4.f64[0]), vmlaq_n_f64(vmulq_laneq_f64(v7, a3, 1), (float64x2_t)vextq_s8((int8x16_t)v7, (int8x16_t)vnegq_f64(v7), 8uLL), a3.f64[0]));
  return result;
}

void __swiftcall simd_double3x3.init(_:)(simd_double3x3 *__return_ptr retstr, simd_quatd *a2)
{
  simd_quatd v10 = v2;
  simd_matrix3x3(v2, (uint64_t)&v10, v9);
  long long v4 = v9[1];
  long long v5 = v9[2];
  long long v6 = v9[3];
  long long v7 = v9[4];
  long long v8 = v9[5];
  *(_OWORD *)retstr->columns[0].f64  = v9[0];
  *(_OWORD *)&retstr->columns[0].f64[2]  = v4;
  *(_OWORD *)retstr->columns[1].f64  = v5;
  *(_OWORD *)&retstr->columns[1].f64[2]  = v6;
  *(_OWORD *)retstr->columns[2].f64  = v7;
  *(_OWORD *)&retstr->columns[2].f64[2]  = v8;
}

void __swiftcall simd_double4x4.init(_:)(simd_double4x4 *__return_ptr retstr, simd_quatd *a2)
{
  float64x2_t v12 = *(float64x2_t *)v2.vector.f64;
  long long v13 = *(_OWORD *)&v2.vector.f64[2];
  simd_matrix4x4(v2, &v12, (uint64_t)v11);
  long long v4 = v11[1];
  long long v5 = v11[2];
  long long v6 = v11[3];
  long long v7 = v11[4];
  long long v8 = v11[5];
  long long v9 = v11[6];
  long long v10 = v11[7];
  *(_OWORD *)retstr->columns[0].f64  = v11[0];
  *(_OWORD *)&retstr->columns[0].f64[2]  = v4;
  *(_OWORD *)retstr->columns[1].f64  = v5;
  *(_OWORD *)&retstr->columns[1].f64[2]  = v6;
  *(_OWORD *)retstr->columns[2].f64  = v7;
  *(_OWORD *)&retstr->columns[2].f64[2]  = v8;
  *(_OWORD *)retstr->columns[3].f64  = v9;
  *(_OWORD *)&retstr->columns[3].f64[2]  = v10;
}

uint64_t simd_quatd.debugDescription.getter()
{
  _StringGuts.grow(_:)(30);
  v0._object  = (void *)0x80000002128348F0;
  v0._countAndFlagsBits  = 0xD000000000000011;
  String.append(_:)(v0);
  Double.write<A>(to:)();
  v1._countAndFlagsBits  = 0x203A67616D69202CLL;
  v1._object  = (void *)0xE800000000000000;
  String.append(_:)(v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SIMD3<Double>);
  lazy protocol witness table accessor for type SIMD3<Float> and conformance SIMD3<A>(&lazy protocol witness table cache variable for type SIMD3<Double> and conformance SIMD3<A>, &demangling cache variable for type metadata for SIMD3<Double>);
  v2._countAndFlagsBits  = SIMD.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits  = 41;
  v3._object  = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return 0;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance simd_quatd()
{
  return simd_quatd.debugDescription.getter();
}

uint64_t static simd_quatd.== infix(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  __int8 v4 = 0;
  if (vmovn_s64(vceqq_f64(a1, a3)).u8[0])
  {
    v5.f64[0]  = a2.f64[0];
    v5.f64[1]  = a1.f64[1];
    v6.f64[0]  = a4.f64[0];
    v6.f64[1]  = a3.f64[1];
    int32x2_t v7 = vmovn_s64(vceqq_f64(v5, v6));
    if (v7.i8[4] & 1) != 0 && (v7.i8[0]) {
      __int8 v4 = vmovn_s64(vceqq_f64(a2, a4)).i8[4];
    }
  }
  return v4 & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance simd_quatd(float64x2_t *a1, float64x2_t *a2)
{
  __int8 v2 = 0;
  if (a1->f64[0] == a2->f64[0])
  {
    int32x4_t v3 = (int32x4_t)vceqq_f64(a1[1], a2[1]);
    int16x4_t v4 = vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*a1, *a2), v3));
    if (v4.i8[2] & 1) != 0 && (v4.i8[4]) {
      __int8 v2 = vmovn_s32(vmovn_hight_s64(*(int32x2_t *)&v3, *(int64x2_t *)&v3)).i8[6];
    }
  }
  return v2 & 1;
}

void simd_quatd.hash(into:)(float64x2_t a1, float64x2_t a2)
{
  if ((*(void *)&a1.f64[0] & 0x8000000000000000) != 0)
  {
    a1  = vnegq_f64(a1);
    a2  = vnegq_f64(a2);
  }
  specialized SIMD.hash(into:)((__n128)a1, (__n128)a2);
}

Swift::Int simd_quatd.hashValue.getter(float64x2_t a1, float64x2_t a2)
{
  Hasher.init(_seed:)();
  __n128 v2 = (__n128)a1;
  if ((*(void *)&a1.f64[0] & 0x8000000000000000) != 0)
  {
    __n128 v2 = (__n128)vnegq_f64(a1);
    __n128 v3 = (__n128)vnegq_f64(a2);
  }
  else
  {
    __n128 v3 = (__n128)a2;
  }
  specialized SIMD.hash(into:)(v2, v3);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance simd_quatd()
{
  float64x2_t v3 = *v0;
  float64x2_t v4 = v0[1];
  Hasher.init(_seed:)();
  *(float64x2_t *)v1.vector.f64  = v3;
  if ((*(void *)&v3.f64[0] & 0x8000000000000000) != 0)
  {
    v6[0]  = v3;
    *(float64x2_t *)v1.vector.f64  = v4;
    v6[1]  = v4;
    simd_negate(v1, v6, (float64x2_t *)&v5);
    simd_quatd v1 = v5;
  }
  else
  {
    *(float64x2_t *)&v1.vector.f64[2]  = v4;
  }
  specialized SIMD.hash(into:)(*(__n128 *)v1.vector.f64, *(__n128 *)&v1.vector.f64[2]);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance simd_quatd()
{
  simd_quatd v1 = *v0;
  if ((*(void *)&v0->vector.f64[0] & 0x8000000000000000) != 0)
  {
    v3[0]  = *(float64x2_t *)v0->vector.f64;
    v3[1]  = *(float64x2_t *)&v1.vector.f64[2];
    simd_negate(v1, v3, v2);
    *(float64x2_t *)v1.vector.f64  = v2[0];
    *(float64x2_t *)&v1.vector.f64[2]  = v2[1];
  }

  specialized SIMD.hash(into:)(*(__n128 *)v1.vector.f64, *(__n128 *)&v1.vector.f64[2]);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance simd_quatd()
{
  float64x2_t v3 = *v0;
  float64x2_t v4 = v0[1];
  Hasher.init(_seed:)();
  *(float64x2_t *)v1.vector.f64  = v3;
  if ((*(void *)&v3.f64[0] & 0x8000000000000000) != 0)
  {
    v6[0]  = v3;
    *(float64x2_t *)v1.vector.f64  = v4;
    v6[1]  = v4;
    simd_negate(v1, v6, (float64x2_t *)&v5);
    simd_quatd v1 = v5;
  }
  else
  {
    *(float64x2_t *)&v1.vector.f64[2]  = v4;
  }
  specialized SIMD.hash(into:)(*(__n128 *)v1.vector.f64, *(__n128 *)&v1.vector.f64[2]);
  return Hasher._finalize()();
}

double static simd_quatd.+ infix(_:_:)(float64x2_t a1, double a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(a1, a3);
  return result;
}

float64x2_t static simd_quatd.+= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v3 = vaddq_f64(a3, a1[1]);
  float64x2_t result = vaddq_f64(a2, *a1);
  *a1  = result;
  a1[1]  = v3;
  return result;
}

double static simd_quatd.- infix(_:_:)(float64x2_t a1, double a2, float64x2_t a3)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(a1, a3);
  return result;
}

float64x2_t static simd_quatd.-= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v3 = vsubq_f64(a1[1], a3);
  float64x2_t result = vsubq_f64(*a1, a2);
  *a1  = result;
  a1[1]  = v3;
  return result;
}

double static simd_quatd.- prefix(_:)(float64x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64((float64x2_t)0, a1);
  return result;
}

double static simd_quatd.* infix(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(a3, a2, 1), (float64x2_t)vextq_s8((int8x16_t)vnegq_f64(a3), (int8x16_t)a3, 8uLL), a2.f64[0]), vmlaq_n_f64(vmulq_laneq_f64(a4, a1, 1), (float64x2_t)vextq_s8((int8x16_t)a4, (int8x16_t)vnegq_f64(a4), 8uLL), a1.f64[0]));
  return result;
}

double static simd_quatd.* infix(_:_:)(double a1, float64x2_t a2)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a2, a1);
  return result;
}

double static simd_quatd.* infix(_:_:)(float64x2_t a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(a1, a3);
  return result;
}

float64x2_t static simd_quatd.*= infix(_:_:)(float64x2_t *a1, float64x2_t a2, int8x16_t a3)
{
  float64x2_t v3 = a1[1];
  float64x2_t v4 = vnegq_f64(a2);
  float64x2_t v5 = (float64x2_t)vextq_s8(a3, (int8x16_t)vnegq_f64((float64x2_t)a3), 8uLL);
  float64x2_t v6 = vmlaq_n_f64(vmulq_laneq_f64(v4, *a1, 1), (float64x2_t)vextq_s8((int8x16_t)a2, (int8x16_t)v4, 8uLL), a1->f64[0]);
  float64x2_t result = vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)a3, *a1, 1), v5, a1->f64[0]), vmlaq_n_f64(vmulq_laneq_f64(a2, v3, 1), (float64x2_t)vextq_s8((int8x16_t)v4, (int8x16_t)a2, 8uLL), v3.f64[0]));
  *a1  = result;
  a1[1]  = vaddq_f64(v6, vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)a3, v3, 1), v5, v3.f64[0]));
  return result;
}

float64x2_t static simd_quatd.*= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64x2_t v2 = vmulq_n_f64(a1[1], a2);
  float64x2_t result = vmulq_n_f64(*a1, a2);
  *a1  = result;
  a1[1]  = v2;
  return result;
}

double static simd_quatd./ infix(_:_:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v4 = vnegq_f64(a3);
  double v5 = 1.0 / vaddvq_f64(vaddq_f64(vmulq_f64(a3, a3), vmulq_f64(a4, a4)));
  float64x2_t v6 = vmulq_n_f64(vmulq_f64(a4, (float64x2_t)xmmword_212833DF0), v5);
  float64x2_t v7 = vmulq_n_f64(v4, v5);
  *(void *)&double result = *(_OWORD *)&vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(v7, a2, 1), (float64x2_t)vextq_s8((int8x16_t)vnegq_f64(v7), (int8x16_t)v7, 8uLL), a2.f64[0]), vmlaq_n_f64(vmulq_laneq_f64(v6, a1, 1), (float64x2_t)vextq_s8((int8x16_t)v6, (int8x16_t)vnegq_f64(v6), 8uLL), a1.f64[0]));
  return result;
}

double static simd_quatd./ infix(_:_:)(float64x2_t a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vdivq_f64(a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0));
  return result;
}

float64x2_t static simd_quatd./= infix(_:_:)(float64x2_t *a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v3 = a1[1];
  float64x2_t v4 = vnegq_f64(a2);
  double v5 = 1.0 / vaddvq_f64(vaddq_f64(vmulq_f64(a2, a2), vmulq_f64(a3, a3)));
  float64x2_t v6 = vmulq_n_f64(vmulq_f64(a3, (float64x2_t)xmmword_212833DF0), v5);
  float64x2_t v7 = vmulq_n_f64(v4, v5);
  float64x2_t v8 = vnegq_f64(v7);
  float64x2_t v9 = (float64x2_t)vextq_s8((int8x16_t)v6, (int8x16_t)vnegq_f64(v6), 8uLL);
  float64x2_t v10 = vmlaq_n_f64(vmulq_laneq_f64(v8, *a1, 1), (float64x2_t)vextq_s8((int8x16_t)v7, (int8x16_t)v8, 8uLL), a1->f64[0]);
  float64x2_t result = vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(v6, *a1, 1), v9, a1->f64[0]), vmlaq_n_f64(vmulq_laneq_f64(v7, v3, 1), (float64x2_t)vextq_s8((int8x16_t)v8, (int8x16_t)v7, 8uLL), v3.f64[0]));
  *a1  = result;
  a1[1]  = vaddq_f64(v10, vmlaq_n_f64(vmulq_laneq_f64(v6, v3, 1), v9, v3.f64[0]));
  return result;
}

float64x2_t static simd_quatd./= infix(_:_:)(float64x2_t *a1, double a2)
{
  float64x2_t v2 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0);
  float64x2_t v3 = vdivq_f64(a1[1], v2);
  float64x2_t result = vdivq_f64(*a1, v2);
  *a1  = result;
  a1[1]  = v3;
  return result;
}

Swift::Double __swiftcall dot(_:_:)(simd_quatd *a1, simd_quatd *a2)
{
  return vaddvq_f64(vaddq_f64(vmulq_f64(v2, v4), vmulq_f64(v3, v5)));
}

void __swiftcall log(_:)(simd_quatd *__return_ptr retstr, simd_quatd *a2)
{
  float64x2_t v4 = *(float64x2_t *)v2.vector.f64;
  long long v5 = *(_OWORD *)&v2.vector.f64[2];
  __tg_log(v2, &v4, &v3);
}

void __swiftcall exp(_:)(simd_quatd *__return_ptr retstr, simd_quatd *a2)
{
  float64x2_t v4 = *(float64x2_t *)v2.vector.f64;
  long long v5 = *(_OWORD *)&v2.vector.f64[2];
  __tg_exp(v2, &v4, &v3);
}

void specialized SIMD.hash(into:)(__n128 a1, __n128 a2)
{
  unint64_t v6 = a1.n128_u64[1];
  if ((a1.n128_u64[0] & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v2 = a1.n128_u64[0];
  }
  else {
    Swift::UInt64 v2 = 0;
  }
  Hasher._combine(_:)(v2);
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v3 = v6;
  }
  else {
    Swift::UInt64 v3 = 0;
  }
  Hasher._combine(_:)(v3);
  if ((a2.n128_u64[0] & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v4 = a2.n128_u64[0];
  }
  else {
    Swift::UInt64 v4 = 0;
  }
  Hasher._combine(_:)(v4);
  if ((a2.n128_u64[1] & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v5 = a2.n128_u64[1];
  }
  else {
    Swift::UInt64 v5 = 0;
  }
  Hasher._combine(_:)(v5);
}

void specialized SIMD.hash(into:)(__n128 a1)
{
  if ((a1.n128_u32[0] & 0x7FFFFFFF) != 0) {
    Swift::UInt32 v1 = a1.n128_u32[0];
  }
  else {
    Swift::UInt32 v1 = 0;
  }
  Hasher._combine(_:)(v1);
  if ((a1.n128_u32[1] & 0x7FFFFFFF) != 0) {
    Swift::UInt32 v2 = a1.n128_u32[1];
  }
  else {
    Swift::UInt32 v2 = 0;
  }
  Hasher._combine(_:)(v2);
  if ((a1.n128_u32[2] & 0x7FFFFFFF) != 0) {
    Swift::UInt32 v3 = a1.n128_u32[2];
  }
  else {
    Swift::UInt32 v3 = 0;
  }
  Hasher._combine(_:)(v3);
  if ((a1.n128_u32[3] & 0x7FFFFFFF) != 0) {
    Swift::UInt32 v4 = a1.n128_u32[3];
  }
  else {
    Swift::UInt32 v4 = 0;
  }
  Hasher._combine(_:)(v4);
}

__n128 __tg_log(float32x4_t a1)
{
  int8x16_t v1 = (int8x16_t)vmulq_f32(a1, a1);
  float v2 = vaddv_f32(vadd_f32(*(float32x2_t *)v1.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL)));
  uint32x4_t v3 = (uint32x4_t)vceqzq_f32(a1);
  v3.i32[3]  = v3.i32[2];
  if ((vminvq_u32(v3) & 0x80000000) != 0)
  {
    float32x4_t v8 = 0uLL;
  }
  else
  {
    int32x4_t v10 = (int32x4_t)v1;
    float v4 = acosf(a1.f32[3] / sqrtf(v2));
    unsigned __int32 v5 = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v10, 2), vadd_f32(*(float32x2_t *)v10.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v10.i8, 1))).u32[0];
    float32x2_t v6 = vrsqrte_f32((float32x2_t)v5);
    float32x2_t v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)v5, vmul_f32(v6, v6)));
    float32x4_t v8 = vmulq_n_f32(vmulq_n_f32(a1, vmul_f32(v7, vrsqrts_f32((float32x2_t)v5, vmul_f32(v7, v7))).f32[0]), v4);
  }
  float32x4_t v12 = v8;
  logf(v2);
  return (__n128)v12;
}

double __tg_exp(float32x4_t a1)
{
  float32x4_t v2 = vmulq_f32(a1, a1);
  LODWORD(v3)  = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), vaddq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v2.f32, 1))).u32[0];
  float v4 = sqrtf(v3);
  if (v4 == 0.0)
  {
    expf(a1.f32[3]);
    return 0.0;
  }
  else
  {
    float v6 = v3;
    float32x2_t v7 = vrsqrte_f32((float32x2_t)LODWORD(v3));
    float32x2_t v8 = vmul_f32(v7, vrsqrts_f32((float32x2_t)LODWORD(v6), vmul_f32(v7, v7)));
    float32x4_t v11 = vmulq_n_f32(a1, vmul_f32(v8, vrsqrts_f32((float32x2_t)LODWORD(v6), vmul_f32(v8, v8))).f32[0]);
    float v12 = a1.f32[3];
    __float2 v9 = __sincosf_stret(v4);
    float32x4_t v10 = vmulq_n_f32(v11, v9.__sinval);
    v10.i32[3]  = LODWORD(v9.__cosval);
    *(void *)&double result = vmulq_n_f32(v10, expf(v12)).u64[0];
  }
  return result;
}

_OWORD *simd_make_double4@<X0>(_OWORD *result@<X0>, _OWORD *a2@<X8>, double a3@<D0>)
{
  long long v3 = result[1];
  *((double *)&v3 + 1)  = a3;
  *a2  = *result;
  a2[1]  = v3;
  return result;
}

float64x2_t *simd_quaternion@<X0>(float64x2_t *result@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t v3 = *result;
  float64x2_t v4 = result[1];
  float64x2_t v6 = *a2;
  float64x2_t v5 = a2[1];
  if (vmulq_f64(v4, v5).f64[0] + vaddvq_f64(vmulq_f64(*result, *a2)) >= 0.0)
  {
    v40  = vaddq_f64(v3, v6);
    v41  = vaddq_f64(v4, v5);
    float64x2_t v42 = vmulq_f64(v41, v41);
    v42.f64[0]  = 1.0 / sqrt(v42.f64[0] + vaddvq_f64(vmulq_f64(v40, v40)));
    v43  = vmulq_n_f64(v40, v42.f64[0]);
    v44  = vmulq_f64(v41, v42);
    v42.f64[0]  = result[1].f64[0];
    v42.f64[1]  = result->f64[0];
    *(void *)&v39.f64[0]  = *(_OWORD *)&vmlaq_laneq_f64(vmulq_laneq_f64(vnegq_f64(v4), v43, 1), v44, v3, 1);
    v45  = vmulq_f64(v4, v44).f64[0];
    v44.f64[1]  = v43.f64[0];
    v46  = (int64x2_t)vmlaq_f64(vmulq_f64(v44, vnegq_f64(v3)), v43, v42);
    *(void *)&v39.f64[1]  = v46.i64[0];
    v47  = v45 + vaddvq_f64(vmulq_f64(v3, v43));
    *(void *)&v38.f64[0]  = vdupq_laneq_s64(v46, 1).u64[0];
    v38.f64[1]  = v47;
  }
  else
  {
    float64x2_t v7 = (float64x2_t)vextq_s8((int8x16_t)v3, (int8x16_t)v3, 8uLL);
    float64x2_t v8 = vmulq_f64(v3, v3);
    v8.f64[0]  = 1.0 / sqrt(vmulq_f64(v4, v4).f64[0] + vaddvq_f64(v8));
    float64x2_t v9 = vmulq_n_f64(v3, v8.f64[0]);
    float64x2_t v10 = vmulq_f64(v5, v5);
    v10.f64[0]  = 1.0 / sqrt(v10.f64[0] + vaddvq_f64(vmulq_f64(v6, v6)));
    float64x2_t v11 = vaddq_f64(vmulq_f64(v4, v8), vmulq_f64(v5, v10));
    float64x2_t v12 = vaddq_f64(v9, vmulq_n_f64(v6, v10.f64[0]));
    float64x2_t v13 = vmulq_f64(v11, v11);
    v13.f64[0]  = v13.f64[0] + vaddvq_f64(vmulq_f64(v12, v12));
    if (v13.f64[0] <= 4.93038066e-32)
    {
      v48.f64[0]  = result->f64[0];
      v48.f64[1]  = v7.f64[0];
      v49  = vabsq_f64(v48);
      v50  = vabsq_f64(v4);
      v51  = v49.f64[1];
      if (v49.f64[0] > v49.f64[1] || v49.f64[0] > v50.f64[0])
      {
        v58.f64[0]  = result[1].f64[0];
        v58.f64[1]  = result->f64[0];
        unint64_t v59 = vextq_s8((int8x16_t)v58, (int8x16_t)v58, 8uLL).u64[0];
        if (v51 <= v50.f64[0])
        {
          v3.f64[1]  = v7.f64[0];
          v60  = vnegq_f64(v4);
          *(void *)&v58.f64[1]  = v59;
          v38  = vmlaq_f64(vmulq_f64(v3, (float64x2_t)vdupq_n_s64(0x8000000000000000)), (float64x2_t)xmmword_212833E00, v58);
          _Q3  = 0uLL;
        }
        else
        {
          v50.f64[0]  = -0.0;
          v3.f64[1]  = v7.f64[0];
          v60  = vmulq_f64(v4, v50);
          *(void *)&v58.f64[1]  = v59;
          v38  = vmlaq_f64(vmulq_f64(v3, (float64x2_t)xmmword_212833E10), (float64x2_t)0, v58);
          __asm { FMOV            V3.2D, #1.0 }
        }
        v66  = vmlaq_f64(v60, _Q3, v7);
        v67  = vmulq_f64(v38, v38);
        v68  = vmulq_f64(v66, v66);
        v66.f64[1]  = v38.f64[0];
        v68.f64[0]  = 1.0 / sqrt(v67.f64[1] + v68.f64[0] + v67.f64[0]);
        v39  = vmulq_n_f64(v66, v68.f64[0]);
        *(void *)&v38.f64[0]  = *(_OWORD *)&vmulq_laneq_f64(v68, v38, 1);
      }
      else
      {
        v52.f64[0]  = result[1].f64[0];
        v52.f64[1]  = result->f64[0];
        v6.f64[0]  = -0.0;
        v53  = vmulq_f64(v4, v6);
        v54.f64[0]  = result->f64[0];
        v54.f64[1]  = v7.f64[0];
        v55  = vmlaq_f64(vmulq_f64(v54, (float64x2_t)xmmword_212833E20), (float64x2_t)xmmword_212833780, v52);
        float64x2_t v56 = vmlaq_laneq_f64(v53, (float64x2_t)0, v3, 1);
        v38  = vmulq_f64(v55, v55);
        v57  = vmulq_f64(v56, v56).f64[0];
        v56.f64[1]  = v55.f64[0];
        v38.f64[0]  = 1.0 / sqrt(v38.f64[1] + v57 + v38.f64[0]);
        v39  = vmulq_n_f64(v56, v38.f64[0]);
        *(void *)&v38.f64[0]  = *(_OWORD *)&vmulq_laneq_f64(v38, v55, 1);
      }
      v38.f64[1]  = 0.0;
    }
    else
    {
      v13.f64[0]  = 1.0 / sqrt(v13.f64[0]);
      float64x2_t v14 = vmulq_f64(v11, v13);
      *(void *)&v12.f64[1]  = vextq_s8((int8x16_t)v12, (int8x16_t)v12, 8uLL).u64[0];
      float64x2_t v15 = vmulq_n_f64(v12, v13.f64[0]);
      float64x2_t v16 = vaddq_f64(v3, v15);
      float64x2_t v17 = vaddq_f64(v4, v14);
      float64x2_t v18 = vmulq_f64(v17, v17);
      v18.f64[0]  = 1.0 / sqrt(v18.f64[0] + vaddvq_f64(vmulq_f64(v16, v16)));
      float64x2_t v19 = vmulq_n_f64(v16, v18.f64[0]);
      float64x2_t v20 = vmulq_f64(v17, v18);
      v18.f64[0]  = result[1].f64[0];
      v18.f64[1]  = result->f64[0];
      *(void *)&double v21 = *(_OWORD *)&vmlaq_laneq_f64(vmulq_laneq_f64(vnegq_f64(v4), v19, 1), v20, v3, 1);
      double v22 = vmulq_f64(v4, v20).f64[0];
      v20.f64[1]  = v19.f64[0];
      v23.f64[0]  = result->f64[0];
      v23.f64[1]  = v7.f64[0];
      float64x2_t v24 = vmlaq_f64(vmulq_f64(v20, vnegq_f64(v23)), v19, v18);
      double v25 = v22 + vaddvq_f64(vmulq_f64(v3, v19));
      v26  = vaddq_f64(v6, v15);
      v27  = vaddq_f64(v5, v14);
      v28  = vmulq_f64(v27, v27);
      v28.f64[0]  = 1.0 / sqrt(v28.f64[0] + vaddvq_f64(vmulq_f64(v26, v26)));
      v29  = vmulq_n_f64(v26, v28.f64[0]);
      v30  = vmulq_f64(v27, v28);
      v31  = vnegq_f64(v14);
      double v32 = vmulq_f64(v14, v30).f64[0];
      v14.f64[1]  = v15.f64[0];
      v33  = (int8x16_t)vmlaq_laneq_f64(vmulq_laneq_f64(v31, v29, 1), v30, v15, 1);
      v30.f64[1]  = v29.f64[0];
      int64x2_t v34 = (int64x2_t)vmlaq_f64(vmulq_f64(v30, vnegq_f64(v15)), v29, v14);
      *(void *)&v14.f64[0]  = v33.i64[0];
      *(void *)&v14.f64[1]  = v34.i64[0];
      v29.f64[0]  = vaddvq_f64(vmulq_f64(v15, v29));
      *(void *)&v15.f64[0]  = vdupq_laneq_s64(v34, 1).u64[0];
      v15.f64[1]  = v32 + v29.f64[0];
      v35  = vnegq_f64(v14);
      float64x2_t v36 = (float64x2_t)vextq_s8((int8x16_t)v15, (int8x16_t)vnegq_f64(v15), 8uLL);
      float64x2_t v37 = vmlaq_laneq_f64(vmulq_n_f64(v14, v25), (float64x2_t)vextq_s8((int8x16_t)v35, v33, 8uLL), v24, 1);
      v38  = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v35, v24.f64[0]), (float64x2_t)vzip1q_s64(v34, (int64x2_t)v35), v21), vmlaq_laneq_f64(vmulq_n_f64(v15, v25), v36, v24, 1));
      v39  = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v15, v24.f64[0]), v36, v21), v37);
    }
  }
  *a3  = v39;
  a3[1]  = v38;
  return result;
}

__n128 simd_quaternion@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int64x2_t v3 = *(int64x2_t *)a1;
  __n128 result = *(__n128 *)(a1 + 16);
  float64x2_t v4 = *(float64x2_t *)(a1 + 32);
  float64x2_t v5 = *(float64x2_t *)(a1 + 48);
  double v6 = *(double *)(a1 + 40);
  int64x2_t v7 = *(int64x2_t *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 80);
  double v9 = *(double *)a1 + v6 + *(double *)&v8;
  if (v9 >= 0.0)
  {
    v27  = sqrt(v9 + 1.0);
    v28  = v27 + v27;
    v29  = 1.0 / (v27 + v27);
    *(double *)&v33  = v29 * vsubq_f64(v5, (float64x2_t)vdupq_laneq_s64(v7, 1)).f64[0];
    double v34 = (*(double *)v7.i64 - result.n128_f64[0]) * v29;
    result.n128_f64[0]  = v29 * vsubq_f64((float64x2_t)vdupq_laneq_s64(v3, 1), v4).f64[0];
    v35  = v28 * 0.25;
  }
  else if (*(double *)v3.i64 < v6 || *(double *)v3.i64 < *(double *)&v8)
  {
    double v11 = 1.0 - *(double *)v3.i64;
    BOOL v12 = v6 < *(double *)&v8;
    double v13 = sqrt(1.0 - *(double *)v3.i64 - v6 + *(double *)&v8);
    double v14 = v13 + v13;
    double v15 = 1.0 / v14;
    double v16 = (result.n128_f64[0] + *(double *)v7.i64) * (1.0 / v14);
    double v17 = vaddq_f64(v5, (float64x2_t)vdupq_laneq_s64(v7, 1)).f64[0];
    double v18 = 1.0 / v14 * v17;
    float64x2_t v19 = (float64x2_t)vdupq_laneq_s64(v3, 1);
    double v20 = v14 * 0.25;
    double v21 = v15 * vsubq_f64(v19, v4).f64[0];
    double v22 = sqrt(v6 + v11 - *(double *)&v8);
    double v23 = v22 + v22;
    double v24 = 1.0 / v23 * vaddq_f64(v19, v4).f64[0];
    double v25 = v23 * 0.25;
    v26  = 1.0 / v23 * v17;
    v35  = (*(double *)v7.i64 - result.n128_f64[0]) * (1.0 / v23);
    if (v12) {
      *(double *)&v33  = v16;
    }
    else {
      *(double *)&v33  = v24;
    }
    if (v12) {
      double v34 = v18;
    }
    else {
      double v34 = v25;
    }
    if (v12) {
      result.n128_f64[0]  = v20;
    }
    else {
      result.n128_f64[0]  = v26;
    }
    if (v12) {
      v35  = v21;
    }
  }
  else
  {
    v30  = sqrt(*(double *)v3.i64 + 1.0 - v6 - *(double *)&v8);
    v31  = v30 + v30;
    double v32 = 1.0 / v31;
    *(double *)&v33  = v31 * 0.25;
    double v34 = v32 * vaddq_f64((float64x2_t)vdupq_laneq_s64(v3, 1), v4).f64[0];
    result.n128_f64[0]  = (result.n128_f64[0] + *(double *)v7.i64) * v32;
    v35  = v32 * vsubq_f64(v5, (float64x2_t)vdupq_laneq_s64(v7, 1)).f64[0];
  }
  *((double *)&v33 + 1)  = v34;
  result.n128_f64[1]  = v35;
  *(_OWORD *)a2  = v33;
  *(__n128 *)(a2 + 16)  = result;
  return result;
}

__n128 simd_make_double3@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2  = *(_OWORD *)a1;
  a2[1]  = v3;
  return result;
}

double simd_matrix3x3@<D0>(simd_quatd a1@<0:Q0, 16:Q1>, uint64_t a2@<X0>, _OWORD *a3@<X8>)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  *(_OWORD *)&v17.vector.f64[2]  = *(_OWORD *)(a2 + 16);
  v8[0]  = *(float64x2_t *)a2;
  *(float64x2_t *)v17.vector.f64  = v8[0];
  v8[1]  = *(float64x2_t *)&v17.vector.f64[2];
  simd_matrix4x4(v17, v8, (uint64_t)&v9);
  long long v4 = v10;
  *a3  = v9;
  a3[1]  = v4;
  long long v5 = v12;
  a3[2]  = v11;
  a3[3]  = v5;
  double result = *(double *)&v13;
  long long v7 = v14;
  a3[4]  = v13;
  a3[5]  = v7;
  return result;
}

double simd_matrix4x4@<D0>(simd_quatd a1@<0:Q0, 16:Q1>, float64x2_t *a2@<X0>, uint64_t a3@<X8>)
{
  _Q1  = *a2;
  _Q0  = a2[1];
  _D2  = a2->f64[1];
  __asm { FMLS            D3, D0, V0.D[0] }
  _D5  = a2[1].f64[1];
  __asm { FMLA            D3, D5, V0.D[1] }
  double v13 = vmlad_n_f64(vmuld_lane_f64(_Q0.f64[0], _Q0, 1), _D2, a2->f64[0]);
  v14.f64[0]  = vmuld_lane_f64(_D2, _Q0, 1);
  double v15 = vmlad_n_f64(-(_D2 * _D5), _Q0.f64[0], a2->f64[0]);
  *((double *)&_Q3 + 1)  = v13 + v13;
  *(_OWORD *)a3  = _Q3;
  *(_OWORD *)(a3 + 16)  = COERCE_UNSIGNED_INT64(v15 + v15);
  *(double *)&_Q3  = vmlad_n_f64(-(_Q0.f64[0] * _D5), _D2, _Q1.f64[0]);
  *(double *)&_Q3  = *(double *)&_Q3 + *(double *)&_Q3;
  __asm
  {
    FMLA            D4, D2, V1.D[1]
    FMLA            D4, D5, V0.D[1]
    FMLS            D4, D1, V1.D[0]
    FMLA            D6, D0, V1.D[1]
  }
  *((void *)&_Q3 + 1)  = _D4;
  *(double *)&unint64_t v20 = _D6 + _D6;
  float64_t v21 = -(_Q1.f64[0] * _D5);
  float64x2_t v22 = (float64x2_t)vzip1q_s64((int64x2_t)_Q1, (int64x2_t)_Q0);
  __asm
  {
    FMLS            D5, D1, V1.D[0]
    FMLS            D5, D2, V1.D[1]
  }
  _Q1.f64[0]  = _Q0.f64[0];
  v14.f64[1]  = v21;
  *(_OWORD *)(a3 + 32)  = _Q3;
  *(_OWORD *)(a3 + 48)  = v20;
  float64x2_t v25 = vmlaq_f64(v14, v22, _Q1);
  *(float64x2_t *)(a3 + 64)  = vaddq_f64(v25, v25);
  *(_OWORD *)(a3 + 80)  = _D5;
  *(void *)(a3 + 96)  = 0;
  *(void *)(a3 + 104)  = 0;
  double result = 0.0;
  *(_OWORD *)(a3 + 112)  = xmmword_212833E00;
  return result;
}

uint64_t lazy protocol witness table accessor for type SIMD3<Float> and conformance SIMD3<A>(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

float64x2_t simd_negate@<Q0>(simd_quatd a1@<0:Q0, 16:Q1>, float64x2_t *a2@<X0>, float64x2_t *a3@<X8>)
{
  float64x2_t result = vnegq_f64(a2[1]);
  *a3  = vnegq_f64(*a2);
  a3[1]  = result;
  return result;
}

__n128 __tg_log@<Q0>(simd_quatd a1@<0:Q0, 16:Q1>, float64x2_t *a2@<X0>, float64x2_t *a3@<X8>)
{
  float64x2_t v4 = a2[1];
  float64x2_t v5 = vmulq_f64(v4, v4);
  float64x2_t v6 = vmulq_f64(*a2, *a2);
  double v7 = vaddvq_f64(vaddq_f64(v6, v5));
  int64x2_t v8 = vceqzq_f64(*a2);
  if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v8, 1), vandq_s8((int8x16_t)vceqzq_f64(v4), (int8x16_t)v8)).u64[0] & 0x8000000000000000) != 0)
  {
    float64_t v18 = 0.0;
    float64x2_t v20 = 0u;
  }
  else
  {
    float64x2_t v17 = *a2;
    float64x2_t v19 = a2[1];
    float64x2_t v15 = v6;
    double v16 = v5.f64[0];
    v9.f64[0]  = acos(v4.f64[1] / sqrt(v7));
    v10.f64[1]  = v15.f64[1];
    v10.f64[0]  = 1.0 / sqrt(v16 + vaddvq_f64(v15));
    float64x2_t v11 = vmulq_n_f64(v17, v10.f64[0]);
    *(void *)&float64_t v18 = *(_OWORD *)&vmulq_f64(vmulq_f64(v19, v10), v9);
    float64x2_t v20 = vmulq_n_f64(v11, v9.f64[0]);
  }
  long double v12 = log(v7);
  v13.f64[0]  = v18;
  v13.f64[1]  = v12 * 0.5;
  __n128 result = (__n128)v20;
  *a3  = v20;
  a3[1]  = v13;
  return result;
}

void __tg_exp(simd_quatd a1@<0:Q0, 16:Q1>, float64x2_t *a2@<X0>, float64x2_t *a3@<X8>)
{
  float64x2_t v4 = *a2;
  float64x2_t v5 = a2[1];
  float64x2_t v6 = vmulq_f64(v4, v4);
  double v7 = sqrt(vmulq_f64(v5, v5).f64[0] + vaddvq_f64(v6));
  if (v7 == 0.0)
  {
    long double v8 = exp(v5.f64[1]);
    float64x2_t v9 = 0uLL;
    v10.f64[0]  = 0.0;
    v10.f64[1]  = v8;
  }
  else
  {
    v6.f64[0]  = 1.0 / v7;
    float64x2_t v15 = vmulq_n_f64(v4, 1.0 / v7);
    float64x2_t v16 = vmulq_f64(v5, v6);
    float64x2_t v14 = a2[1];
    __double2 v12 = __sincos_stret(v7);
    v11.f64[0]  = v12.__sinval;
    *(void *)&v11.f64[0]  = *(_OWORD *)&vmulq_f64(v11, v16);
    v11.f64[1]  = v12.__cosval;
    float64x2_t v17 = v11;
    double v13 = exp(v14.f64[1]);
    float64x2_t v9 = vmulq_n_f64(vmulq_n_f64(v15, v12.__sinval), v13);
    float64x2_t v10 = vmulq_n_f64(v17, v13);
  }
  *a3  = v9;
  a3[1]  = v10;
}

uint64_t base witness table accessor for Equatable in simd_quatf()
{
  return lazy protocol witness table accessor for type simd_quatf and conformance simd_quatf(&lazy protocol witness table cache variable for type simd_quatf and conformance simd_quatf, type metadata accessor for simd_quatf);
}

uint64_t base witness table accessor for Equatable in simd_quatd()
{
  return lazy protocol witness table accessor for type simd_quatf and conformance simd_quatf(&lazy protocol witness table cache variable for type simd_quatd and conformance simd_quatd, type metadata accessor for simd_quatd);
}

uint64_t lazy protocol witness table accessor for type simd_quatf and conformance simd_quatf(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

float sub_212832CC4@<S0>(uint64_t a1@<X0>, float *a2@<X8>)
{
  float result = *(float *)(a1 + 12);
  *a2  = result;
  return result;
}

float sub_212832CD0(float *a1, uint64_t a2)
{
  float result = *a1;
  *(float *)(a2 + 12)  = *a1;
  return result;
}

void sub_212832CDC(__n128 *a1@<X0>, _OWORD *a2@<X8>)
{
  *(double *)&long long v3 = simd_make_float3(*a1);
  *a2  = v3;
}

void sub_212832D08(uint64_t a1, _OWORD *a2)
{
  simd_make_float4();
  *a2  = v3;
}

double sub_212832D38@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result = *(double *)(a1 + 24);
  *a2  = result;
  return result;
}

double sub_212832D44(double *a1, uint64_t a2)
{
  double result = *a1;
  *(double *)(a2 + 24)  = *a1;
  return result;
}

double sub_212832D50@<D0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v2 = a1[1];
  v4[0]  = *a1;
  v4[1]  = v2;
  *(void *)&double result = simd_make_double3((uint64_t)v4, a2).n128_u64[0];
  return result;
}

_OWORD *sub_212832D7C(_OWORD *a1, uint64_t a2)
{
  long long v2 = a1[1];
  double v3 = *(double *)(a2 + 24);
  v5[0]  = *a1;
  v5[1]  = v2;
  return simd_make_double4(v5, (_OWORD *)a2, v3);
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t Float.write<A>(to:)()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t dispatch thunk of SIMDStorage.scalarCount.getter()
{
  return MEMORY[0x270F9E938]();
}

uint64_t dispatch thunk of SIMDStorage.init()()
{
  return MEMORY[0x270F9E940]();
}

uint64_t dispatch thunk of SIMDStorage.subscript.getter()
{
  return MEMORY[0x270F9E948]();
}

uint64_t dispatch thunk of SIMDStorage.subscript.setter()
{
  return MEMORY[0x270F9E950]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t dispatch thunk of FixedWidthInteger.subtractingReportingOverflow(_:)()
{
  return MEMORY[0x270F9EE58]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x270F9F770]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t SIMD.description.getter()
{
  return MEMORY[0x270F9FAD0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

simd_double2x2 __invert_d2(simd_double2x2 a1)
{
  MEMORY[0x270ED7DF8]((__n128)a1.columns[0], (__n128)a1.columns[1]);
  result.columns[1].f64[1]  = v4;
  result.columns[1].f64[0]  = v3;
  result.columns[0].f64[1]  = v2;
  result.columns[0].f64[0]  = v1;
  return result;
}

uint64_t __invert_d3()
{
  return MEMORY[0x270ED7E00]();
}

uint64_t __invert_d4()
{
  return MEMORY[0x270ED7E08]();
}

simd_float2x2 __invert_f2(simd_float2x2 a1)
{
  MEMORY[0x270ED7E10]((__n128)a1, *(__n128 *)((char *)&a1 + 8));
  result.columns[1]  = v2;
  result.columns[0]  = v1;
  return result;
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x270ED7E18]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1]  = v6;
  result.columns[2].i64[0]  = v5;
  result.columns[1].i64[1]  = v4;
  result.columns[1].i64[0]  = v3;
  result.columns[0].i64[1]  = v2;
  result.columns[0].i64[0]  = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x270ED7E20]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1]  = v8;
  result.columns[3].i64[0]  = v7;
  result.columns[2].i64[1]  = v6;
  result.columns[2].i64[0]  = v5;
  result.columns[1].i64[1]  = v4;
  result.columns[1].i64[0]  = v3;
  result.columns[0].i64[1]  = v2;
  result.columns[0].i64[0]  = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval  = v2;
  result.__sinval  = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval  = v2;
  result.__sinval  = v1;
  return result;
}

simd_double2 _simd_acos_d2(simd_double2 x)
{
  MEMORY[0x270ED8160]((__n128)x);
  return result;
}

simd_float4 _simd_acos_f4(simd_float4 x)
{
  MEMORY[0x270ED8168]((__n128)x);
  return result;
}

simd_double2 _simd_acosh_d2(simd_double2 x)
{
  MEMORY[0x270ED8170]((__n128)x);
  return result;
}

simd_float4 _simd_acosh_f4(simd_float4 x)
{
  MEMORY[0x270ED8178]((__n128)x);
  return result;
}

simd_double2 _simd_asin_d2(simd_double2 x)
{
  MEMORY[0x270ED8180]((__n128)x);
  return result;
}

simd_float4 _simd_asin_f4(simd_float4 x)
{
  MEMORY[0x270ED8188]((__n128)x);
  return result;
}

simd_double2 _simd_asinh_d2(simd_double2 x)
{
  MEMORY[0x270ED8190]((__n128)x);
  return result;
}

simd_float4 _simd_asinh_f4(simd_float4 x)
{
  MEMORY[0x270ED8198]((__n128)x);
  return result;
}

simd_double2 _simd_atan2_d2(simd_double2 y, simd_double2 x)
{
  MEMORY[0x270ED81A0]((__n128)y, (__n128)x);
  return result;
}

simd_float4 _simd_atan2_f4(simd_float4 y, simd_float4 x)
{
  MEMORY[0x270ED81A8]((__n128)y, (__n128)x);
  return result;
}

simd_double2 _simd_atan_d2(simd_double2 x)
{
  MEMORY[0x270ED81B0]((__n128)x);
  return result;
}

simd_float4 _simd_atan_f4(simd_float4 x)
{
  MEMORY[0x270ED81B8]((__n128)x);
  return result;
}

simd_double2 _simd_atanh_d2(simd_double2 x)
{
  MEMORY[0x270ED81C0]((__n128)x);
  return result;
}

simd_float4 _simd_atanh_f4(simd_float4 x)
{
  MEMORY[0x270ED81C8]((__n128)x);
  return result;
}

simd_double2 _simd_cbrt_d2(simd_double2 x)
{
  MEMORY[0x270ED81D0]((__n128)x);
  return result;
}

simd_float4 _simd_cbrt_f4(simd_float4 x)
{
  MEMORY[0x270ED81D8]((__n128)x);
  return result;
}

simd_double2 _simd_cos_d2(simd_double2 x)
{
  MEMORY[0x270ED81E0]((__n128)x);
  return result;
}

simd_float4 _simd_cos_f4(simd_float4 x)
{
  MEMORY[0x270ED81E8]((__n128)x);
  return result;
}

simd_double2 _simd_cosh_d2(simd_double2 x)
{
  MEMORY[0x270ED81F0]((__n128)x);
  return result;
}

simd_float4 _simd_cosh_f4(simd_float4 x)
{
  MEMORY[0x270ED81F8]((__n128)x);
  return result;
}

simd_double2 _simd_cospi_d2(simd_double2 x)
{
  MEMORY[0x270ED8200]((__n128)x);
  return result;
}

simd_float4 _simd_cospi_f4(simd_float4 x)
{
  MEMORY[0x270ED8208]((__n128)x);
  return result;
}

simd_double2 _simd_erf_d2(simd_double2 x)
{
  MEMORY[0x270ED8210]((__n128)x);
  return result;
}

simd_float4 _simd_erf_f4(simd_float4 x)
{
  MEMORY[0x270ED8218]((__n128)x);
  return result;
}

simd_double2 _simd_erfc_d2(simd_double2 x)
{
  MEMORY[0x270ED8220]((__n128)x);
  return result;
}

simd_float4 _simd_erfc_f4(simd_float4 x)
{
  MEMORY[0x270ED8228]((__n128)x);
  return result;
}

simd_double2 _simd_exp10_d2(simd_double2 x)
{
  MEMORY[0x270ED8230]((__n128)x);
  return result;
}

simd_float4 _simd_exp10_f4(simd_float4 x)
{
  MEMORY[0x270ED8238]((__n128)x);
  return result;
}

simd_double2 _simd_exp2_d2(simd_double2 x)
{
  MEMORY[0x270ED8240]((__n128)x);
  return result;
}

simd_float4 _simd_exp2_f4(simd_float4 x)
{
  MEMORY[0x270ED8248]((__n128)x);
  return result;
}

simd_double2 _simd_exp_d2(simd_double2 x)
{
  MEMORY[0x270ED8250]((__n128)x);
  return result;
}

simd_float4 _simd_exp_f4(simd_float4 x)
{
  MEMORY[0x270ED8258]((__n128)x);
  return result;
}

simd_double2 _simd_expm1_d2(simd_double2 x)
{
  MEMORY[0x270ED8260]((__n128)x);
  return result;
}

simd_float4 _simd_expm1_f4(simd_float4 x)
{
  MEMORY[0x270ED8268]((__n128)x);
  return result;
}

simd_double2 _simd_fmod_d2(simd_double2 x, simd_double2 y)
{
  MEMORY[0x270ED8270]((__n128)x, (__n128)y);
  return result;
}

simd_float4 _simd_fmod_f4(simd_float4 x, simd_float4 y)
{
  MEMORY[0x270ED8278]((__n128)x, (__n128)y);
  return result;
}

simd_double2 _simd_hypot_d2(simd_double2 x, simd_double2 y)
{
  MEMORY[0x270ED8280]((__n128)x, (__n128)y);
  return result;
}

simd_float4 _simd_hypot_f4(simd_float4 x, simd_float4 y)
{
  MEMORY[0x270ED8288]((__n128)x, (__n128)y);
  return result;
}

simd_double2 _simd_lgamma_d2(simd_double2 x)
{
  MEMORY[0x270ED8290]((__n128)x);
  return result;
}

simd_float4 _simd_lgamma_f4(simd_float4 x)
{
  MEMORY[0x270ED8298]((__n128)x);
  return result;
}

simd_double2 _simd_log10_d2(simd_double2 x)
{
  MEMORY[0x270ED82A0]((__n128)x);
  return result;
}

simd_float4 _simd_log10_f4(simd_float4 x)
{
  MEMORY[0x270ED82A8]((__n128)x);
  return result;
}

simd_double2 _simd_log1p_d2(simd_double2 x)
{
  MEMORY[0x270ED82B0]((__n128)x);
  return result;
}

simd_float4 _simd_log1p_f4(simd_float4 x)
{
  MEMORY[0x270ED82B8]((__n128)x);
  return result;
}

simd_double2 _simd_log2_d2(simd_double2 x)
{
  MEMORY[0x270ED82C0]((__n128)x);
  return result;
}

simd_float4 _simd_log2_f4(simd_float4 x)
{
  MEMORY[0x270ED82C8]((__n128)x);
  return result;
}

simd_double2 _simd_log_d2(simd_double2 x)
{
  MEMORY[0x270ED82D0]((__n128)x);
  return result;
}

simd_float4 _simd_log_f4(simd_float4 x)
{
  MEMORY[0x270ED82D8]((__n128)x);
  return result;
}

simd_double2 _simd_nextafter_d2(simd_double2 x, simd_double2 y)
{
  MEMORY[0x270ED82E0]((__n128)x, (__n128)y);
  return result;
}

simd_float4 _simd_nextafter_f4(simd_float4 x, simd_float4 y)
{
  MEMORY[0x270ED82E8]((__n128)x, (__n128)y);
  return result;
}

simd_double2 _simd_pow_d2(simd_double2 x, simd_double2 y)
{
  MEMORY[0x270ED8318]((__n128)x, (__n128)y);
  return result;
}

simd_float4 _simd_pow_f4(simd_float4 x, simd_float4 y)
{
  MEMORY[0x270ED8320]((__n128)x, (__n128)y);
  return result;
}

simd_double2 _simd_remainder_d2(simd_double2 x, simd_double2 y)
{
  MEMORY[0x270ED8328]((__n128)x, (__n128)y);
  return result;
}

simd_float4 _simd_remainder_f4(simd_float4 x, simd_float4 y)
{
  MEMORY[0x270ED8330]((__n128)x, (__n128)y);
  return result;
}

simd_double2 _simd_sin_d2(simd_double2 x)
{
  MEMORY[0x270ED8340]((__n128)x);
  return result;
}

simd_float4 _simd_sin_f4(simd_float4 x)
{
  MEMORY[0x270ED8348]((__n128)x);
  return result;
}

simd_double2 _simd_sinh_d2(simd_double2 x)
{
  MEMORY[0x270ED8350]((__n128)x);
  return result;
}

simd_float4 _simd_sinh_f4(simd_float4 x)
{
  MEMORY[0x270ED8358]((__n128)x);
  return result;
}

simd_double2 _simd_sinpi_d2(simd_double2 x)
{
  MEMORY[0x270ED8360]((__n128)x);
  return result;
}

simd_float4 _simd_sinpi_f4(simd_float4 x)
{
  MEMORY[0x270ED8368]((__n128)x);
  return result;
}

simd_double2 _simd_tan_d2(simd_double2 x)
{
  MEMORY[0x270ED8370]((__n128)x);
  return result;
}

simd_float4 _simd_tan_f4(simd_float4 x)
{
  MEMORY[0x270ED8378]((__n128)x);
  return result;
}

simd_double2 _simd_tanh_d2(simd_double2 x)
{
  MEMORY[0x270ED8380]((__n128)x);
  return result;
}

simd_float4 _simd_tanh_f4(simd_float4 x)
{
  MEMORY[0x270ED8388]((__n128)x);
  return result;
}

simd_double2 _simd_tanpi_d2(simd_double2 x)
{
  MEMORY[0x270ED8390]((__n128)x);
  return result;
}

simd_float4 _simd_tanpi_f4(simd_float4 x)
{
  MEMORY[0x270ED8398]((__n128)x);
  return result;
}

simd_double2 _simd_tgamma_d2(simd_double2 x)
{
  MEMORY[0x270ED83A0]((__n128)x);
  return result;
}

simd_float4 _simd_tgamma_f4(simd_float4 x)
{
  MEMORY[0x270ED83A8]((__n128)x);
  return result;
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}