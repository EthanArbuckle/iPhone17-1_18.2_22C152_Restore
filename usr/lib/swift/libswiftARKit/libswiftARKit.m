BOOL static ARPlaneAnchor.Classification.Status.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void ARPlaneAnchor.Classification.Status.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int ARPlaneAnchor.Classification.Status.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ARPlaneAnchor.Classification.Status(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ARPlaneAnchor.Classification.Status()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ARPlaneAnchor.Classification.Status()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ARPlaneAnchor.Classification.Status()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

char *ARPlaneAnchor.classification.getter@<X0>(char *a1@<X8>)
{
  result = [v1 sel_classification];
  if ((unint64_t)(result - 1) >= 7)
  {
    result = (char *)[v1 sel_classificationStatus];
    if (result == (char *)2) {
      char v4 = 2;
    }
    else {
      char v4 = 1;
    }
    if (!result) {
      char v4 = 0;
    }
  }
  else
  {
    char v4 = (_BYTE)result + 2;
  }
  *a1 = v4;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ARConfidenceLevel(void *a1, void *a2)
{
  return *a1 == *a2;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance MTLVertexFormat(void *a1@<X8>)
{
  *a1 = *v1;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance ARConfidenceLevel@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

BOOL specialized static ARPlaneAnchor.Classification.== infix(_:_:)(unsigned char *a1, unsigned __int8 *a2)
{
  int v2 = *a2;
  switch(*a1)
  {
    case 3:
      if (v2 != 3) {
        goto LABEL_18;
      }
      BOOL result = 1;
      break;
    case 4:
      if (v2 != 4) {
        goto LABEL_18;
      }
      BOOL result = 1;
      break;
    case 5:
      if (v2 != 5) {
        goto LABEL_18;
      }
      BOOL result = 1;
      break;
    case 6:
      if (v2 != 6) {
        goto LABEL_18;
      }
      BOOL result = 1;
      break;
    case 7:
      if (v2 != 7) {
        goto LABEL_18;
      }
      BOOL result = 1;
      break;
    case 8:
      if (v2 != 8) {
        goto LABEL_18;
      }
      BOOL result = 1;
      break;
    case 9:
      if (v2 != 9) {
        goto LABEL_18;
      }
      BOOL result = 1;
      break;
    default:
      if ((v2 - 3) < 7) {
LABEL_18:
      }
        BOOL result = 0;
      else {
        BOOL result = *a1 == v2;
      }
      break;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ARPlaneAnchor.Classification.Status and conformance ARPlaneAnchor.Classification.Status()
{
  unint64_t result = lazy protocol witness table cache variable for type ARPlaneAnchor.Classification.Status and conformance ARPlaneAnchor.Classification.Status;
  if (!lazy protocol witness table cache variable for type ARPlaneAnchor.Classification.Status and conformance ARPlaneAnchor.Classification.Status)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ARPlaneAnchor.Classification.Status and conformance ARPlaneAnchor.Classification.Status);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  char *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ARPlaneAnchor.Classification(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF7)
  {
    unsigned int v2 = a2 + 9;
    if (a2 + 9 >= 0xFFFF00) {
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
        return (*a1 | (v5 << 8)) - 9;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 9;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x23EADF4F8);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 9;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  if (v7 >= 3) {
    unsigned int v8 = v7 - 2;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 >= 8) {
    return v8 - 7;
  }
  else {
    return 0;
  }
}

unsigned char *storeEnumTagSinglePayload for ARPlaneAnchor.Classification(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 9;
  if (a3 + 9 >= 0xFFFF00) {
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
  if (a3 >= 0xF7) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v7 = ((a2 - 247) >> 8) + 1;
    char *result = a2 + 9;
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
        JUMPOUT(0x23EADF5E0);
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
          char *result = a2 + 9;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for ARPlaneAnchor.Classification(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 3) {
    return v1 - 2;
  }
  else {
    return 0;
  }
}

unsigned char *destructiveInjectEnumTag for ARPlaneAnchor.Classification(unsigned char *result, int a2)
{
  if (a2) {
    char *result = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ARPlaneAnchor.Classification()
{
  return &type metadata for ARPlaneAnchor.Classification;
}

uint64_t getEnumTagSinglePayload for ARPlaneAnchor.Classification.Status(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ARPlaneAnchor.Classification.Status(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    char *result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23EADF79CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for ARPlaneAnchor.Classification.Status(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for ARPlaneAnchor.Classification.Status(unsigned char *result, char a2)
{
  char *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ARPlaneAnchor.Classification.Status()
{
  return &type metadata for ARPlaneAnchor.Classification.Status;
}

void type metadata accessor for ARConfidenceLevel(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for simd_float4x4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
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

void type metadata accessor for simd_float4x4(uint64_t a1)
{
}

void type metadata accessor for ARConfidenceLevel(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void *ARPointCloud.points.getter()
{
  id v1 = [v0 sel_points];
  id v2 = [v0 count];

  return specialized _copyCollectionToContiguousArray<A>(_:)(v1, (uint64_t)v2);
}

void *ARPointCloud.identifiers.getter()
{
  return specialized _copyCollectionToContiguousArray<A>(_:)(objc_msgSend(v0, sel_identifiers), (uint64_t)objc_msgSend(v0, sel_count), &demangling cache variable for type metadata for _ContiguousArrayStorage<UInt64>);
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(const void *a1, uint64_t a2)
{
  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    size_t v4 = 16 * a2;
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SIMD3<Float>>);
    size_t v4 = 16 * a2;
    uint64_t v5 = (void *)swift_allocObject();
    int64_t v6 = _swift_stdlib_malloc_size(v5);
    uint64_t v7 = v6 - 32;
    if (v6 < 32) {
      uint64_t v7 = v6 - 17;
    }
    v5[2] = a2;
    v5[3] = 2 * (v7 >> 4);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

{
  return specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2, &demangling cache variable for type metadata for _ContiguousArrayStorage<SIMD2<Float>>);
}

{
  size_t v4;
  void *v5;
  int64_t v6;
  int64_t v7;

  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    size_t v4 = 2 * a2;
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int16>);
    size_t v4 = 2 * a2;
    uint64_t v5 = (void *)swift_allocObject();
    int64_t v6 = _swift_stdlib_malloc_size(v5);
    uint64_t v7 = v6 - 32;
    if (v6 < 32) {
      uint64_t v7 = v6 - 31;
    }
    v5[2] = a2;
    v5[3] = v7 & 0xFFFFFFFFFFFFFFFELL;
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

{
  size_t v4;
  void *v5;
  int64_t v6;
  uint64_t v7;

  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    size_t v4 = a2 << 6;
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<simd_float4x4>);
    size_t v4 = a2 << 6;
    uint64_t v5 = (void *)swift_allocObject();
    int64_t v6 = _swift_stdlib_malloc_size(v5);
    uint64_t v7 = v6 - 32;
    if (v6 < 32) {
      uint64_t v7 = v6 + 31;
    }
    v5[2] = a2;
    v5[3] = 2 * (v7 >> 6);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(const void *a1, uint64_t a2, uint64_t *a3)
{
  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    size_t v5 = 8 * a2;
    int64_t v6 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    size_t v5 = 8 * a2;
    int64_t v6 = (void *)swift_allocObject();
    int64_t v7 = _swift_stdlib_malloc_size(v6);
    uint64_t v8 = v7 - 32;
    if (v7 < 32) {
      uint64_t v8 = v7 - 25;
    }
    v6[2] = a2;
    v6[3] = 2 * (v8 >> 3);
  }
  memcpy(v6 + 4, a1, v5);
  return v6;
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

BOOL static ARConfidenceLevel.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 < a2;
}

unint64_t lazy protocol witness table accessor for type ARConfidenceLevel and conformance ARConfidenceLevel()
{
  unint64_t result = lazy protocol witness table cache variable for type ARConfidenceLevel and conformance ARConfidenceLevel;
  if (!lazy protocol witness table cache variable for type ARConfidenceLevel and conformance ARConfidenceLevel)
  {
    type metadata accessor for ARConfidenceLevel(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ARConfidenceLevel and conformance ARConfidenceLevel);
  }
  return result;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance ARConfidenceLevel(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance ARConfidenceLevel(void *a1, void *a2)
{
  return *a2 >= *a1;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance ARConfidenceLevel(void *a1, void *a2)
{
  return *a1 >= *a2;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance ARConfidenceLevel(void *a1, void *a2)
{
  return *a2 < *a1;
}

uint64_t ARGeometrySource.subscript.getter(int a1)
{
  uint64_t result = (uint64_t)[v1 sel_format];
  if (result != 30)
  {
    __break(1u);
    goto LABEL_6;
  }
  id v4 = [v1 sel_buffer];
  [v4 sel_contents];
  id v5 = v4;
  id v6 = [v1 sel_offset];
  uint64_t result = (uint64_t)[v1 sel_stride];
  uint64_t v7 = result * a1;
  if ((unsigned __int128)(result * (__int128)a1) >> 64 != v7 >> 63)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (__OFADD__(v6, v7)) {
LABEL_7:
  }
    __break(1u);
  return result;
}

{
  void *v1;
  uint64_t result;
  id v4;
  id v5;
  id v6;
  char *v7;
  uint64_t v8;
  BOOL v9;
  char *v10;

  uint64_t result = (uint64_t)[v1 sel_format];
  if (result != 45)
  {
    __break(1u);
    goto LABEL_6;
  }
  id v4 = [v1 sel_buffer];
  id v5 = [v4 sel_contents];
  id v6 = v4;
  uint64_t v7 = (char *)[v1 sel_offset];
  uint64_t result = (uint64_t)[v1 sel_stride];
  uint64_t v8 = result * a1;
  if ((unsigned __int128)(result * (__int128)a1) >> 64 != v8 >> 63)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v9 = __OFADD__(v7, v8);
  v10 = &v7[v8];
  if (!v9) {
    return v10[(void)v5];
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t ARGeometryElement.subscript.getter(uint64_t a1)
{
  uint64_t result = (uint64_t)[v1 bytesPerIndex];
  if (result != 4)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v4 = (uint64_t)[v1 indexCountPerPrimitive];
  id v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0, MEMORY[0x263F8EE78]);
  uint64_t result = (uint64_t)[v1 indexCountPerPrimitive];
  if ((result & 0x8000000000000000) == 0)
  {
    uint64_t v6 = result;
    if (!result) {
      return (uint64_t)v5;
    }
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = [v1 sel_buffer];
      v9 = [v8 sel_contents];
      id v10 = v8;
      uint64_t result = (uint64_t)[v1 indexCountPerPrimitive];
      uint64_t v11 = a1 * result;
      if ((unsigned __int128)(a1 * (__int128)result) >> 64 != (a1 * result) >> 63) {
        break;
      }
      BOOL v12 = __OFADD__(v11, v7);
      uint64_t v13 = v11 + v7;
      if (v12) {
        goto LABEL_13;
      }
      if ((unint64_t)(v13 - 0x2000000000000000) >> 62 != 3) {
        goto LABEL_14;
      }
      int v14 = v9[v13];
      unint64_t v16 = *((void *)v5 + 2);
      unint64_t v15 = *((void *)v5 + 3);
      if (v16 >= v15 >> 1) {
        id v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v15 > 1), v16 + 1, 1, v5);
      }
      ++v7;
      *((void *)v5 + 2) = v16 + 1;
      *(_DWORD *)&v5[4 * v16 + 32] = v14;
      if (v6 == v7) {
        return (uint64_t)v5;
      }
    }
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t ARPlaneGeometry.vertices.getter()
{
  return ARPlaneGeometry.vertices.getter((SEL *)&selRef_vertices, (SEL *)&selRef_vertexCount, (uint64_t (*)(id, id))specialized _copyCollectionToContiguousArray<A>(_:));
}

uint64_t ARPlaneGeometry.textureCoordinates.getter()
{
  return ARPlaneGeometry.vertices.getter((SEL *)&selRef_textureCoordinates, (SEL *)&selRef_textureCoordinateCount, (uint64_t (*)(id, id))specialized _copyCollectionToContiguousArray<A>(_:));
}

uint64_t ARPlaneGeometry.triangleIndices.getter()
{
  id v1 = [v0 sel_triangleIndices];
  uint64_t result = (uint64_t)[v0 triangleCount];
  if ((unsigned __int128)(result * (__int128)3) >> 64 == (3 * result) >> 63)
  {
    return (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(v1, 3 * result);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t ARPlaneGeometry.boundaryVertices.getter()
{
  return ARPlaneGeometry.vertices.getter((SEL *)&selRef_boundaryVertices, (SEL *)&selRef_boundaryVertexCount, (uint64_t (*)(id, id))specialized _copyCollectionToContiguousArray<A>(_:));
}

uint64_t ARPlaneGeometry.vertices.getter(SEL *a1, SEL *a2, uint64_t (*a3)(id, id))
{
  id v5 = [v3 *a1];
  id v6 = [v3 *a2];

  return a3(v5, v6);
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int32>);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  int v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t ARSCNView.unprojectPoint(_:ontoPlane:)()
{
  [v0 sel_unprojectPoint_ontoPlaneWithTransform_];
  BOOL v3 = (~v1 & 0x7F800000) != 0 || (v1 & 0x7FFFFF) == 0;
  if (v3
    && ((~HIDWORD(v1) & 0x7F800000) == 0 ? (BOOL v4 = (v1 & 0x7FFFFF00000000) == 0) : (BOOL v4 = 1),
        v4 && ((~v2 & 0x7F800000) == 0 ? (BOOL v5 = (v2 & 0x7FFFFF) == 0) : (BOOL v5 = 1), v5)))
  {
    return v1;
  }
  else
  {
    return 0;
  }
}

ARGeoAnchor __swiftcall ARGeoAnchor.init(coordinate:altitude:)(CLLocationCoordinate2D coordinate, Swift::Double_optional altitude)
{
  CLLocationDegrees longitude = coordinate.longitude;
  CLLocationDegrees latitude = coordinate.latitude;
  if (v2)
  {
    id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    int64_t v7 = sel_initWithCoordinate_;
    double v8 = latitude;
    double v9 = longitude;
  }
  else
  {
    double v5 = *(double *)&altitude.is_nil;
    id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    int64_t v7 = sel_initWithCoordinate_altitude_;
    double v8 = latitude;
    double v9 = longitude;
    double v10 = v5;
  }
  return (ARGeoAnchor)[v6 v7:v8:v9:v10];
}

ARGeoAnchor __swiftcall ARGeoAnchor.init(name:coordinate:altitude:)(Swift::String name, CLLocationCoordinate2D coordinate, Swift::Double_optional altitude)
{
  double longitude = coordinate.longitude;
  double latitude = coordinate.latitude;
  object = name._object;
  uint64_t countAndFlagsBits = name._countAndFlagsBits;
  if (v3)
  {
    id v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    double v10 = (void *)MEMORY[0x23ED0AF30](countAndFlagsBits, object);
    swift_bridgeObjectRelease();
    int64_t v11 = (objc_class *)[v12 initWithName:v10 coordinate:CGPointMake(latitude, longitude)];
  }
  else
  {
    double v8 = *(double *)&altitude.is_nil;
    id v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    double v10 = (void *)MEMORY[0x23ED0AF30](countAndFlagsBits, object);
    swift_bridgeObjectRelease();
    int64_t v11 = (objc_class *)[v9 sel_initWithName_coordinate_altitude_:v10 latitude:latitude longitude:longitude altitude:v8];
  }
  v13.super.super.isa = v11;

  return v13;
}

double ARGeoAnchor.altitude.getter()
{
  if (objc_msgSend(v0, sel_altitudeSource)) {
    [v0 sel_altitude];
  }
  return result;
}

char *ARSkeletonDefinition.parentIndices.getter()
{
  id v1 = [v0 sel_parentIndices];
  type metadata accessor for NSNumber();
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v12 = MEMORY[0x263F8EE78];
  double result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v12;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x23ED0AF50](v5, v2);
      }
      else {
        id v7 = *(id *)(v2 + 8 * v5 + 32);
      }
      double v8 = v7;
      id v9 = [v7 integerValue];

      unint64_t v11 = *(void *)(v12 + 16);
      unint64_t v10 = *(void *)(v12 + 24);
      if (v11 >= v10 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      }
      ++v5;
      *(void *)(v12 + 16) = v11 + 1;
      *(void *)(v12 + 8 * v11 + 32) = v9;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
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

Swift::Int __swiftcall ARSkeletonDefinition.index(for:)(ARSkeletonJointName a1)
{
  return (Swift::Int)[v1 sel_indexForJointName_:a1];
}

uint64_t ARSkeleton3D.jointModelTransforms.getter()
{
  return ARSkeleton3D.jointModelTransforms.getter((SEL *)&selRef_jointModelTransforms, (uint64_t (*)(id, id))specialized _copyCollectionToContiguousArray<A>(_:));
}

uint64_t ARSkeleton3D.jointLocalTransforms.getter()
{
  return ARSkeleton3D.jointModelTransforms.getter((SEL *)&selRef_jointLocalTransforms, (uint64_t (*)(id, id))specialized _copyCollectionToContiguousArray<A>(_:));
}

void __swiftcall ARSkeleton3D.modelTransform(for:)(simd_float4x4_optional *__return_ptr retstr, ARSkeletonJointName a2)
{
}

void __swiftcall ARSkeleton3D.localTransform(for:)(simd_float4x4_optional *__return_ptr retstr, ARSkeletonJointName a2)
{
}

void ARSkeleton3D.modelTransform(for:)(uint64_t a1@<X0>, SEL *a2@<X1>, uint64_t a3@<X8>)
{
  id v7 = [v3 sel_definition];
  unint64_t v8 = (unint64_t)[v7 sel_indexForJointName_:a1];

  if ((v8 & 0x8000000000000000) != 0
    || (id v9 = objc_msgSend(v3, sel_definition),
        id v10 = objc_msgSend(v9, sel_jointCount),
        v9,
        (uint64_t)v8 >= (uint64_t)v10))
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
    uint64_t v16 = 0;
    uint64_t v15 = 0;
    uint64_t v18 = 0;
    uint64_t v17 = 0;
    uint64_t v20 = 0;
    uint64_t v19 = 0;
    char v21 = 1;
    goto LABEL_6;
  }
  unint64_t v11 = specialized _copyCollectionToContiguousArray<A>(_:)([v3 *a2], (uint64_t)[v3 sel_jointCount]);
  if (v8 < v11[2])
  {
    uint64_t v12 = &v11[8 * v8];
    uint64_t v14 = v12[4];
    uint64_t v13 = v12[5];
    uint64_t v16 = v12[6];
    uint64_t v15 = v12[7];
    uint64_t v18 = v12[8];
    uint64_t v17 = v12[9];
    uint64_t v20 = v12[10];
    uint64_t v19 = v12[11];
    swift_release();
    char v21 = 0;
LABEL_6:
    *(void *)a3 = v14;
    *(void *)(a3 + 8) = v13;
    *(void *)(a3 + 16) = v16;
    *(void *)(a3 + 24) = v15;
    *(void *)(a3 + 32) = v18;
    *(void *)(a3 + 40) = v17;
    *(void *)(a3 + 48) = v20;
    *(void *)(a3 + 56) = v19;
    *(unsigned char *)(a3 + 64) = v21;
    return;
  }
  __break(1u);
}

uint64_t ARSkeleton2D.jointLandmarks.getter()
{
  return ARSkeleton3D.jointModelTransforms.getter((SEL *)&selRef_jointLandmarks, (uint64_t (*)(id, id))specialized _copyCollectionToContiguousArray<A>(_:));
}

uint64_t ARSkeleton3D.jointModelTransforms.getter(SEL *a1, uint64_t (*a2)(id, id))
{
  id v3 = [v2 *a1];
  id v4 = [v2 sel_jointCount];

  return a2(v3, v4);
}

void *ARSkeleton2D.landmark(for:)(uint64_t a1)
{
  id v3 = [v1 sel_definition];
  unint64_t v4 = (unint64_t)[v3 sel_indexForJointName_:a1];

  if ((v4 & 0x8000000000000000) != 0) {
    return 0;
  }
  id v5 = [v1 sel_definition];
  id v6 = [v5 sel_jointCount];

  if ((uint64_t)v4 >= (uint64_t)v6) {
    return 0;
  }
  unint64_t result = specialized _copyCollectionToContiguousArray<A>(_:)(objc_msgSend(v1, sel_jointLandmarks), (uint64_t)objc_msgSend(v1, sel_jointCount));
  if (v4 < result[2])
  {
    uint64_t v8 = result[v4 + 4];
    swift_release();
    return (void *)v8;
  }
  __break(1u);
  return result;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  unint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *id v3 = result;
  return result;
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
    id v10 = (char *)swift_allocObject();
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
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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

uint64_t ARFaceGeometry.vertices.getter()
{
  return ARFaceGeometry.vertices.getter((SEL *)&selRef_vertices, (SEL *)&selRef_vertexCount, (uint64_t (*)(id, id))specialized _copyCollectionToContiguousArray<A>(_:));
}

uint64_t ARFaceGeometry.textureCoordinates.getter()
{
  return ARFaceGeometry.vertices.getter((SEL *)&selRef_textureCoordinates, (SEL *)&selRef_textureCoordinateCount, (uint64_t (*)(id, id))specialized _copyCollectionToContiguousArray<A>(_:));
}

uint64_t ARFaceGeometry.vertices.getter(SEL *a1, SEL *a2, uint64_t (*a3)(id, id))
{
  id v5 = [v3 *a1];
  id v6 = [v3 *a2];

  return a3(v5, v6);
}

uint64_t ARFaceGeometry.triangleIndices.getter()
{
  id v1 = [v0 sel_triangleIndices];
  uint64_t result = (uint64_t)[v0 triangleCount];
  if ((unsigned __int128)(result * (__int128)3) >> 64 == (3 * result) >> 63)
  {
    return (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(v1, 3 * result);
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL static ARCamera.TrackingState.Reason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void ARCamera.TrackingState.Reason.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int ARCamera.TrackingState.Reason.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

id ARCamera.trackingState.getter@<X0>(char *a1@<X8>)
{
  id result = [v1 sel_trackingState];
  if (!result)
  {
    char v4 = 4;
LABEL_9:
    *a1 = v4;
    return result;
  }
  if (result == (id)1)
  {
    id result = [v1 sel_trackingStateReason];
    if ((unint64_t)result >= 5) {
      char v4 = 2;
    }
    else {
      char v4 = 0x302010002uLL >> (8 * result);
    }
    goto LABEL_9;
  }
  if (result == (id)2)
  {
    char v4 = 5;
    goto LABEL_9;
  }
  id result = (id)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t ARCamera.unprojectPoint(_:ontoPlane:orientation:viewportSize:)(uint64_t a1)
{
  [v1 unprojectPoint:a1 ontoPlaneWithTransform:v2 orientation:v3 viewportSize:v4];
  BOOL v4 = (~v2 & 0x7F800000) != 0 || (v2 & 0x7FFFFF) == 0;
  if (v4
    && ((~HIDWORD(v2) & 0x7F800000) == 0 ? (BOOL v5 = (v2 & 0x7FFFFF00000000) == 0) : (BOOL v5 = 1),
        v5 && ((~v3 & 0x7F800000) == 0 ? (BOOL v6 = (v3 & 0x7FFFFF) == 0) : (BOOL v6 = 1), v6)))
  {
    return v2;
  }
  else
  {
    return 0;
  }
}

BOOL static ARCamera.TrackingState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  if (v2 == 5) {
    return v3 == 5;
  }
  if (v2 == 4) {
    return v3 == 4;
  }
  if ((v3 & 0xFE) == 4) {
    return 0;
  }
  return v2 == v3;
}

unint64_t lazy protocol witness table accessor for type ARCamera.TrackingState.Reason and conformance ARCamera.TrackingState.Reason()
{
  unint64_t result = lazy protocol witness table cache variable for type ARCamera.TrackingState.Reason and conformance ARCamera.TrackingState.Reason;
  if (!lazy protocol witness table cache variable for type ARCamera.TrackingState.Reason and conformance ARCamera.TrackingState.Reason)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ARCamera.TrackingState.Reason and conformance ARCamera.TrackingState.Reason);
  }
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ARCamera.TrackingState(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  if (v2 == 5) {
    return v3 == 5;
  }
  if (v2 == 4) {
    return v3 == 4;
  }
  if ((v3 & 0xFE) == 4) {
    return 0;
  }
  return v2 == v3;
}

uint64_t getEnumTagSinglePayload for ARCamera.TrackingState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB)
  {
    unsigned int v2 = a2 + 5;
    if (a2 + 5 >= 0xFFFF00) {
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
        return (*a1 | (v5 << 8)) - 5;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 5;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x23EAE0FF8);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 5;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  if (v7 >= 4) {
    unsigned int v8 = v7 - 3;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 >= 3) {
    return v8 - 2;
  }
  else {
    return 0;
  }
}

unsigned char *storeEnumTagSinglePayload for ARCamera.TrackingState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 5;
  if (a3 + 5 >= 0xFFFF00) {
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
  if (a3 >= 0xFB) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v7 = ((a2 - 251) >> 8) + 1;
    char *result = a2 + 5;
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
        JUMPOUT(0x23EAE10E0);
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
          char *result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for ARCamera.TrackingState(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 4) {
    return v1 - 3;
  }
  else {
    return 0;
  }
}

unsigned char *destructiveInjectEnumTag for ARCamera.TrackingState(unsigned char *result, int a2)
{
  if (a2) {
    char *result = a2 + 3;
  }
  return result;
}

ValueMetadata *type metadata accessor for ARCamera.TrackingState()
{
  return &type metadata for ARCamera.TrackingState;
}

uint64_t getEnumTagSinglePayload for ARCamera.TrackingState.Reason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ARCamera.TrackingState.Reason(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    char *result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23EAE1298);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ARCamera.TrackingState.Reason()
{
  return &type metadata for ARCamera.TrackingState.Reason;
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}