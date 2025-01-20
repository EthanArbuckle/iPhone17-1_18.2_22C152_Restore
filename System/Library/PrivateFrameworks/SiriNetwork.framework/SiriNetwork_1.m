uint64_t specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 != a2)
  {
    v4 = *a4;
    v5 = *a4 + 16 * a3 - 16;
    while (2)
    {
      v6 = *(void *)(v4 + 16 * a3);
      v7 = result;
      v8 = v5;
      do
      {
        if (*(void *)v8 >= v6) {
          break;
        }
        if (!v4)
        {
          __break(1u);
          return result;
        }
        v9 = *(void *)(v8 + 24);
        *(_OWORD *)(v8 + 16) = *(_OWORD *)v8;
        *(void *)v8 = v6;
        *(void *)(v8 + 8) = v9;
        v8 -= 16;
        ++v7;
      }
      while (a3 != v7);
      ++a3;
      v5 += 16;
      if (a3 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(char *a1, char *a2, unint64_t a3, char *a4)
{
  v4 = a4;
  v6 = a2;
  v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 16;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 16;
  if (v9 >= v11)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(a2, (uint64_t)(a3 - (void)a2) / 16, a4);
    v12 = &v4[16 * v11];
    if (v7 >= v6 || v10 < 16) {
      goto LABEL_39;
    }
    v18 = (char *)(a3 - 16);
    while (1)
    {
      v19 = v18 + 16;
      v20 = v6 - 16;
      if (*((void *)v6 - 2) >= *((void *)v12 - 2))
      {
        BOOL v22 = v19 != v12 || v18 >= v12;
        v20 = v12 - 16;
        v12 -= 16;
        if (!v22) {
          goto LABEL_35;
        }
      }
      else
      {
        BOOL v21 = v19 != v6 || v18 >= v6;
        v6 -= 16;
        if (!v21) {
          goto LABEL_35;
        }
      }
      *(_OWORD *)v18 = *(_OWORD *)v20;
LABEL_35:
      v18 -= 16;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_39;
      }
    }
  }
  specialized UnsafeMutablePointer.moveInitialize(from:count:)(a1, (a2 - a1) / 16, a4);
  v12 = &v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (*(void *)v4 >= *(void *)v6)
    {
      v14 = v4;
      BOOL v15 = v7 == v4;
      v4 += 16;
      if (!v15) {
        goto LABEL_11;
      }
LABEL_12:
      v7 += 16;
      if (v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_17;
      }
    }
    v14 = v6;
    BOOL v15 = v7 == v6;
    v6 += 16;
    if (v15) {
      goto LABEL_12;
    }
LABEL_11:
    *(_OWORD *)v7 = *(_OWORD *)v14;
    goto LABEL_12;
  }
LABEL_17:
  v6 = v7;
LABEL_39:
  specialized UnsafeMutablePointer.moveInitialize(from:count:)(v4, (v12 - v4) / 16, v6);
  return 1;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Range<Int>>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t outlined bridged method (pb) of @objc SAConnectionPolicyRoute.routeId.getter(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (v2)
  {
    v3 = v2;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return OUTLINED_FUNCTION_23_0();
}

unint64_t lazy protocol witness table accessor for type ConnectionPolicyType and conformance ConnectionPolicyType()
{
  unint64_t result = lazy protocol witness table cache variable for type ConnectionPolicyType and conformance ConnectionPolicyType;
  if (!lazy protocol witness table cache variable for type ConnectionPolicyType and conformance ConnectionPolicyType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ConnectionPolicyType and conformance ConnectionPolicyType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ConnectionPolicyProtocol and conformance ConnectionPolicyProtocol()
{
  unint64_t result = lazy protocol witness table cache variable for type ConnectionPolicyProtocol and conformance ConnectionPolicyProtocol;
  if (!lazy protocol witness table cache variable for type ConnectionPolicyProtocol and conformance ConnectionPolicyProtocol)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ConnectionPolicyProtocol and conformance ConnectionPolicyProtocol);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ConnectionPolicyType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
    if (a2 + 4 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 4) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ConnectionPolicyType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x25D758FB8);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

void type metadata accessor for ConnectionPolicyType()
{
}

unsigned char *storeEnumTagSinglePayload for ConnectionPolicyProtocol(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x25D7590B8);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

void type metadata accessor for ConnectionPolicyProtocol()
{
}

uint64_t destroy for ConnectionPolicyRoute()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ConnectionPolicyRoute(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(_WORD *)(a1 + 112) = *(_WORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ConnectionPolicyRoute(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  uint64_t v4 = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 104) = v4;
  *(unsigned char *)(a1 + 113) = *(unsigned char *)(a2 + 113);
  return a1;
}

void *__swift_memcpy114_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x72uLL);
}

uint64_t assignWithTake for ConnectionPolicyRoute(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(_WORD *)(a1 + 112) = *(_WORD *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for ConnectionPolicyRoute(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 114))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ConnectionPolicyRoute(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 112) = 0;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 114) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 114) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

void type metadata accessor for ConnectionPolicyRoute()
{
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  size_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    *size_t v11 = *(void *)(*(void *)(a4 + 48) + 8 * v16);
    v11[1] = v20;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    unint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void *specialized _ContiguousArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

void OUTLINED_FUNCTION_1_28()
{
  uint64_t v1 = 8236;
  unint64_t v2 = 0xE200000000000000;
  String.append(_:)(*(Swift::String *)&v1);
}

uint64_t OUTLINED_FUNCTION_3_23()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

id OUTLINED_FUNCTION_4_16(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_5_17()
{
  return 3028785;
}

uint64_t OUTLINED_FUNCTION_7_8()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_10_10()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

BOOL OUTLINED_FUNCTION_11_7@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

void OUTLINED_FUNCTION_12_8(uint64_t a1)
{
  uint64_t v3 = v1;
  String.append(_:)(*(Swift::String *)&a1);
}

uint64_t NetworkManager.addObserver(_:)(uint64_t a1)
{
  return NetworkManager.addObserver(_:)(a1, (uint64_t)&unk_270A6C080, (uint64_t)partial apply for closure #1 in NetworkManager.addObserver(_:), (uint64_t)&block_descriptor_15);
}

uint64_t sub_25D759784()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t closure #1 in NetworkManager.addObserver(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x2611B37F0](v3);
  if (result)
  {
    uint64_t v5 = (void *)result;
    v6[0] = a2;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NetworkManagerObserver);
    if (swift_dynamicCast())
    {
      v10[0] = v7;
      v10[1] = v8;
      uint64_t v11 = v9;
      outlined init with copy of AnyHashable((uint64_t)v10, (uint64_t)v6);
      swift_beginAccess();
      specialized Set._Variant.insert(_:)((uint64_t)&v7, (uint64_t)v6);
      outlined destroy of AnyHashable((uint64_t)&v7);
      swift_endAccess();

      return outlined destroy of AnyHashable((uint64_t)v10);
    }
    else
    {
      uint64_t v9 = 0;
      long long v7 = 0u;
      long long v8 = 0u;

      return outlined destroy of AnyHashable?((uint64_t)&v7);
    }
  }
  return result;
}

uint64_t partial apply for closure #1 in NetworkManager.addObserver(_:)()
{
  return closure #1 in NetworkManager.addObserver(_:)(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t block_copy_helper_15(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_15()
{
  return swift_release();
}

uint64_t NetworkManager.removeObserver(_:)(uint64_t a1)
{
  return NetworkManager.addObserver(_:)(a1, (uint64_t)&unk_270A6C0D0, (uint64_t)partial apply for closure #1 in NetworkManager.removeObserver(_:), (uint64_t)&block_descriptor_10_3);
}

uint64_t NetworkManager.addObserver(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = v4;
  uint64_t v10 = type metadata accessor for DispatchWorkItemFlags();
  OUTLINED_FUNCTION_0_0();
  uint64_t v24 = v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v23 = OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_2();
  unint64_t v16 = *(void **)(v8 + OBJC_IVAR___SNNetworkManagerInternal_queue);
  uint64_t v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = a1;
  aBlock[4] = a3;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = a4;
  int64_t v19 = _Block_copy(aBlock);
  id v20 = v16;
  swift_retain();
  swift_unknownObjectRetain();
  static DispatchQoS.unspecified.getter();
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_9_4();
  _Block_release(v19);

  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v5, v10);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v6, v23);
  swift_release();
  return swift_release();
}

void closure #1 in NetworkManager.removeObserver(_:)(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x2611B37F0](v1);
  if (v2)
  {
    uint64_t v3 = (char *)v2;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NetworkManagerObserver);
    if (swift_dynamicCast())
    {
      v8[0] = v5;
      v8[1] = v6;
      uint64_t v9 = v7;
      swift_beginAccess();
      specialized Set._Variant.remove(_:)((uint64_t)v8, (uint64_t)&v5);
      outlined destroy of AnyHashable?((uint64_t)&v5);
      swift_endAccess();
      outlined destroy of AnyHashable((uint64_t)v8);
    }
    else
    {
      uint64_t v7 = 0;
      long long v5 = 0u;
      long long v6 = 0u;
      outlined destroy of AnyHashable?((uint64_t)&v5);
    }
    uint64_t v4 = &v3[OBJC_IVAR___SNNetworkManagerInternal_observers];
    swift_beginAccess();
    if (!*(void *)(*(void *)v4 + 16)) {
      objc_msgSend(v3, sel_stopMonitoringNetwork);
    }
  }
}

uint64_t objectdestroy_2Tm_0()
{
  swift_release();
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void partial apply for closure #1 in NetworkManager.removeObserver(_:)()
{
  closure #1 in NetworkManager.removeObserver(_:)(*(void *)(v0 + 16));
}

void @objc NetworkManager.addObserver(_:)(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  id v7 = a1;
  a4(a3);
  swift_unknownObjectRelease();
}

Swift::Void __swiftcall NetworkManager.startMonitoringNetwork(_:)(Swift::String a1)
{
  uint64_t v2 = v1;
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  type metadata accessor for DispatchWorkItemFlags();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2();
  id v7 = *(void **)(v2 + OBJC_IVAR___SNNetworkManagerInternal_queue);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = countAndFlagsBits;
  v9[4] = object;
  aBlock[4] = partial apply for closure #1 in NetworkManager.startMonitoringNetwork(_:);
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_17_0;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = v7;
  swift_retain();
  swift_bridgeObjectRetain();
  static DispatchQoS.unspecified.getter();
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_9_4();
  _Block_release(v10);

  uint64_t v12 = OUTLINED_FUNCTION_6();
  v13(v12);
  uint64_t v14 = OUTLINED_FUNCTION_3();
  v15(v14);
  swift_release();
  swift_release();
}

void closure #1 in NetworkManager.startMonitoringNetwork(_:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = a1 + 16;
  swift_beginAccess();
  uint64_t v6 = (char *)MEMORY[0x2611B37F0](v5);
  if (v6)
  {
    id v7 = v6;
    if (*(void *)&v6[OBJC_IVAR___SNNetworkManagerInternal_pathEvaluator])
    {
    }
    else
    {
      if (one-time initialization token for siriNetwork != -1) {
        swift_once();
      }
      uint64_t v8 = type metadata accessor for Logger();
      __swift_project_value_buffer(v8, (uint64_t)static Logger.siriNetwork);
      swift_bridgeObjectRetain_n();
      uint64_t v9 = Logger.logObject.getter();
      os_log_type_t v10 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v9, v10))
      {
        id v11 = (uint8_t *)swift_slowAlloc();
        uint64_t v12 = swift_slowAlloc();
        aBlock[0] = v12;
        *(_DWORD *)id v11 = 136315138;
        swift_bridgeObjectRetain();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a2, a3, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25D6CC000, v9, v10, "NetworkManager - PathEvaluator: Start monitoring network %s", v11, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2611B3750](v12, -1, -1);
        MEMORY[0x2611B3750](v11, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v13 = String.utf8CString.getter();
      nw_endpoint_create_host((const char *)(v13 + 32), "443");
      swift_release();
      uint64_t evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint();
      uint64_t v15 = *(void **)&v7[OBJC_IVAR___SNNetworkManagerInternal_queue];
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = v7;
      aBlock[4] = (uint64_t)partial apply for closure #1 in closure #1 in NetworkManager.startMonitoringNetwork(_:);
      aBlock[5] = v16;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed OS_nw_path?) -> ();
      aBlock[3] = (uint64_t)&block_descriptor_27;
      uint64_t v17 = _Block_copy(aBlock);
      id v18 = v15;
      int64_t v19 = v7;
      swift_release();
      nw_path_evaluator_set_update_handler();
      _Block_release(v17);

      NetworkManager.pathEvaluator.setter(evaluator_for_endpoint);
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_25D75A258()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void partial apply for closure #1 in NetworkManager.startMonitoringNetwork(_:)()
{
  closure #1 in NetworkManager.startMonitoringNetwork(_:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

void closure #1 in closure #1 in NetworkManager.startMonitoringNetwork(_:)(NSObject *a1)
{
  if (a1)
  {
    uint64_t v2 = swift_unknownObjectRetain();
    nw_path_status_t status = nw_path_get_status(v2);
    Swift::Bool v4 = nw_path_uses_interface_type(a1, nw_interface_type_cellular);
    swift_unknownObjectRelease();
  }
  else
  {
    Swift::Bool v4 = 0;
    nw_path_status_t status = nw_path_status_invalid;
  }
  NetworkManager.pathUpdated(status:usesCellular:)(status, v4);
}

Swift::Void __swiftcall NetworkManager.pathUpdated(status:usesCellular:)(nw_path_status_t status, Swift::Bool usesCellular)
{
  uint64_t v3 = v2;
  int64_t v4 = usesCellular;
  nw_path_status_t v5 = status;
  uint64_t v6 = OBJC_IVAR___SNNetworkManagerInternal_pathStatus;
  id v7 = &OBJC_IVAR___SNNetworkManagerInternal_pathUsesCellular;
  if (*(_DWORD *)&v2[OBJC_IVAR___SNNetworkManagerInternal_pathStatus] == status
    && v2[OBJC_IVAR___SNNetworkManagerInternal_pathUsesCellular] == usesCellular)
  {
    return;
  }
  if (one-time initialization token for siriNetwork != -1) {
    goto LABEL_101;
  }
LABEL_4:
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Logger.siriNetwork);
  uint64_t v9 = v3;
  os_log_type_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 67109888;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v12 + 8) = 1024;
    OUTLINED_FUNCTION_14_5();
    *(_WORD *)(v12 + 14) = 1024;
    OUTLINED_FUNCTION_14_5();
    *(_WORD *)(v12 + 20) = 1024;
    id v7 = &OBJC_IVAR___SNNetworkManagerInternal_pathUsesCellular;
    OUTLINED_FUNCTION_14_5();

    _os_log_impl(&dword_25D6CC000, v10, v11, "NetworkManager - PathEvaluator: Path updated, status %u from %u, usesCellular %{BOOL}d from %{BOOL}d", (uint8_t *)v12, 0x1Au);
    MEMORY[0x2611B3750](v12, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = *v7;
  char v14 = v9[*v7];
  int v15 = *(_DWORD *)&v3[v6];
  if (v15 == 3)
  {
    if (v5 == nw_path_status_satisfiable)
    {
      if (v14 & 1 | ((v4 & 1) == 0)) {
        goto LABEL_92;
      }
      OUTLINED_FUNCTION_15_4();
LABEL_44:
      HIDWORD(v35) = v16;
LABEL_47:
      id v7 = (uint64_t *)v9;
      swift_beginAccess();
      OUTLINED_FUNCTION_1_29();
      int64_t v27 = 0;
      nw_path_status_t v5 = 40;
      while (1)
      {
        if (v3)
        {
          OUTLINED_FUNCTION_8_12();
        }
        else
        {
          int64_t v29 = v27 + 1;
          if (__OFADD__(v27, 1))
          {
            __break(1u);
LABEL_97:
            __break(1u);
            goto LABEL_98;
          }
          if (v29 >= v4) {
            goto LABEL_66;
          }
          ++v27;
          if (!*(void *)(v6 + 8 * v29))
          {
            int64_t v27 = v29 + 1;
            if (v29 + 1 >= v4) {
              goto LABEL_66;
            }
            if (!*(void *)(v6 + 8 * v27))
            {
              int64_t v27 = v29 + 2;
              if (v29 + 2 >= v4) {
                goto LABEL_66;
              }
              if (!*(void *)(v6 + 8 * v27))
              {
                int64_t v30 = v29 + 3;
                if (v30 >= v4)
                {
LABEL_66:
                  swift_release();
                  uint64_t v3 = (char *)v36;
                  uint64_t v13 = v37;
                  nw_path_status_t v5 = v39;
                  int64_t v4 = HIDWORD(v39);
                  uint64_t v6 = v38;
                  uint64_t v9 = (char *)v7;
                  BOOL v17 = v40;
                  if ((v35 & 0x100000000) == 0) {
                    goto LABEL_92;
                  }
LABEL_69:
                  if (v17) {
                    goto LABEL_92;
                  }
                  goto LABEL_70;
                }
                if (!*(void *)(v6 + 8 * v30))
                {
                  while (1)
                  {
                    int64_t v27 = v30 + 1;
                    if (__OFADD__(v30, 1)) {
                      break;
                    }
                    if (v27 >= v4) {
                      goto LABEL_66;
                    }
                    ++v30;
                    if (*(void *)(v6 + 8 * v27)) {
                      goto LABEL_63;
                    }
                  }
LABEL_98:
                  __break(1u);
                  goto LABEL_99;
                }
                int64_t v27 = v30;
              }
            }
          }
LABEL_63:
          OUTLINED_FUNCTION_9_11();
        }
        OUTLINED_FUNCTION_6_14(v28, v35, v36, v37, v38, v39, v40, (uint64_t)v41, v42, v43, (uint64_t)v44, v45, v46, v47, v48, v49);
        OUTLINED_FUNCTION_4_17();
        if (OUTLINED_FUNCTION_13_8())
        {
          objc_msgSend(v50, sel_networkManagerLostNonWWANConnectivity_, v7);
          swift_unknownObjectRelease();
        }
      }
    }
    BOOL v17 = v5 == nw_path_status_satisfied;
    if (!v9[*v7])
    {
      if ((v4 & 1) == 0) {
        goto LABEL_69;
      }
      OUTLINED_FUNCTION_16_6();
      int v16 = 1;
      goto LABEL_44;
    }
    if (v4) {
      goto LABEL_69;
    }
    if (v5 != nw_path_status_satisfied)
    {
LABEL_70:
      uint64_t v37 = v13;
      uint64_t v38 = v6;
      uint64_t v39 = __PAIR64__(v4, v5);
      uint64_t v36 = (uint64_t)v3;
      id v7 = (uint64_t *)v9;
      OUTLINED_FUNCTION_10_11();
      OUTLINED_FUNCTION_1_29();
      int64_t v31 = 0;
      nw_path_status_t v5 = 40;
      while (1)
      {
        if (v3)
        {
          OUTLINED_FUNCTION_8_12();
        }
        else
        {
          int64_t v33 = v31 + 1;
          if (__OFADD__(v31, 1)) {
            goto LABEL_97;
          }
          if (v33 >= v4)
          {
LABEL_89:
            swift_release();
            uint64_t v3 = (char *)v36;
            nw_path_status_t v5 = v39;
            LOBYTE(v4) = BYTE4(v39);
            uint64_t v6 = v38;
            uint64_t v9 = (char *)v7;
            goto LABEL_91;
          }
          ++v31;
          if (!*(void *)(v6 + 8 * v33))
          {
            int64_t v31 = v33 + 1;
            if (v33 + 1 >= v4) {
              goto LABEL_89;
            }
            if (!*(void *)(v6 + 8 * v31))
            {
              int64_t v31 = v33 + 2;
              if (v33 + 2 >= v4) {
                goto LABEL_89;
              }
              if (!*(void *)(v6 + 8 * v31))
              {
                int64_t v34 = v33 + 3;
                if (v34 >= v4) {
                  goto LABEL_89;
                }
                if (!*(void *)(v6 + 8 * v34))
                {
                  while (1)
                  {
                    int64_t v31 = v34 + 1;
                    if (__OFADD__(v34, 1)) {
                      break;
                    }
                    if (v31 >= v4) {
                      goto LABEL_89;
                    }
                    ++v34;
                    if (*(void *)(v6 + 8 * v31)) {
                      goto LABEL_86;
                    }
                  }
LABEL_99:
                  __break(1u);
LABEL_100:
                  __break(1u);
LABEL_101:
                  swift_once();
                  goto LABEL_4;
                }
                int64_t v31 = v34;
              }
            }
          }
LABEL_86:
          OUTLINED_FUNCTION_9_11();
        }
        OUTLINED_FUNCTION_6_14(v32, v35, v36, v37, v38, v39, v40, (uint64_t)v41, v42, v43, (uint64_t)v44, v45, v46, v47, v48, v49);
        OUTLINED_FUNCTION_4_17();
        if (OUTLINED_FUNCTION_13_8())
        {
          objc_msgSend(v44, sel_networkManagerNetworkUnreachable_, v7);
          swift_unknownObjectRelease();
        }
      }
    }
LABEL_21:
    uint64_t v37 = *v7;
    uint64_t v38 = v6;
    uint64_t v39 = __PAIR64__(v4, v5);
    uint64_t v40 = (uint64_t)v9;
    OUTLINED_FUNCTION_10_11();
    v18.isa = v10->isa;
    uint64_t v6 = (uint64_t)v18.isa + 56;
    uint64_t v19 = 1 << *((unsigned char *)v18.isa + 32);
    uint64_t v20 = -1;
    if (v19 < 64) {
      uint64_t v20 = ~(-1 << v19);
    }
    unint64_t v21 = v20 & *((void *)v18.isa + 7);
    int64_t v4 = (unint64_t)(v19 + 63) >> 6;
    swift_bridgeObjectRetain();
    id v7 = 0;
    nw_path_status_t v5 = 40;
    while (1)
    {
      if (v21)
      {
        unint64_t v22 = __clz(__rbit64(v21));
        v21 &= v21 - 1;
        uint64_t v23 = v22 | ((void)v7 << 6);
      }
      else
      {
        int64_t v24 = (int64_t)v7 + 1;
        if (__OFADD__(v7, 1)) {
          goto LABEL_100;
        }
        if (v24 >= v4)
        {
LABEL_90:
          swift_release();
          nw_path_status_t v5 = v39;
          LOBYTE(v4) = BYTE4(v39);
          uint64_t v6 = v38;
          uint64_t v9 = (char *)v40;
LABEL_91:
          uint64_t v13 = v37;
          goto LABEL_92;
        }
        unint64_t v25 = *(void *)(v6 + 8 * v24);
        id v7 = (uint64_t *)((char *)v7 + 1);
        if (!v25)
        {
          id v7 = (uint64_t *)(v24 + 1);
          if (v24 + 1 >= v4) {
            goto LABEL_90;
          }
          unint64_t v25 = *(void *)(v6 + 8 * (void)v7);
          if (!v25)
          {
            id v7 = (uint64_t *)(v24 + 2);
            if (v24 + 2 >= v4) {
              goto LABEL_90;
            }
            unint64_t v25 = *(void *)(v6 + 8 * (void)v7);
            if (!v25)
            {
              v26 = (uint64_t *)(v24 + 3);
              if ((uint64_t)v26 >= v4) {
                goto LABEL_90;
              }
              unint64_t v25 = *(void *)(v6 + 8 * (void)v26);
              if (!v25)
              {
                while (1)
                {
                  id v7 = (uint64_t *)((char *)v26 + 1);
                  if (__OFADD__(v26, 1)) {
                    break;
                  }
                  if ((uint64_t)v7 >= v4) {
                    goto LABEL_90;
                  }
                  unint64_t v25 = *(void *)(v6 + 8 * (void)v7);
                  v26 = (uint64_t *)((char *)v26 + 1);
                  if (v25) {
                    goto LABEL_39;
                  }
                }
                __break(1u);
                return;
              }
              id v7 = v26;
            }
          }
        }
LABEL_39:
        unint64_t v21 = (v25 - 1) & v25;
        uint64_t v23 = __clz(__rbit64(v25)) + ((void)v7 << 6);
      }
      OUTLINED_FUNCTION_6_14(v23, v35, v36, v37, v38, v39, v40, (uint64_t)v41, v42, v43, (uint64_t)v44, v45, v46, v47, v48, v49);
      OUTLINED_FUNCTION_4_17();
      if (OUTLINED_FUNCTION_13_8())
      {
        objc_msgSend(v41, sel_networkManagerNonWWANDidBecomeAvailable_, v40);
        swift_unknownObjectRelease();
      }
    }
  }
  if (v5 == nw_path_status_satisfiable)
  {
    if (v14 & 1 | ((v4 & 1) == 0)) {
      goto LABEL_92;
    }
    HIDWORD(v35) = v15 == 1;
    OUTLINED_FUNCTION_15_4();
    goto LABEL_47;
  }
  BOOL v17 = v5 == nw_path_status_satisfied;
  if ((v9[*v7] & 1) == 0)
  {
    if (v4)
    {
      HIDWORD(v35) = v15 == 1;
      OUTLINED_FUNCTION_16_6();
      goto LABEL_47;
    }
LABEL_68:
    if (v15 != 1) {
      goto LABEL_92;
    }
    goto LABEL_69;
  }
  if (v4) {
    goto LABEL_68;
  }
  if (v5 == nw_path_status_satisfied) {
    goto LABEL_21;
  }
  if (v15 == 1) {
    goto LABEL_70;
  }
LABEL_92:
  *(_DWORD *)&v3[v6] = v5;
  v9[v13] = v4 & 1;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed OS_nw_path?) -> ()(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

Swift::Void __swiftcall NetworkManager.stopMonitoringNetwork()()
{
  type metadata accessor for DispatchWorkItemFlags();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_2();
  nw_path_status_t v5 = *(void **)(v0 + OBJC_IVAR___SNNetworkManagerInternal_queue);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = partial apply for closure #1 in NetworkManager.stopMonitoringNetwork();
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_21;
  id v7 = _Block_copy(aBlock);
  id v8 = v5;
  swift_retain();
  static DispatchQoS.unspecified.getter();
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  OUTLINED_FUNCTION_1_17();
  MEMORY[0x2611B24E0](0, v2, v1, v7);
  _Block_release(v7);

  uint64_t v9 = OUTLINED_FUNCTION_6();
  v10(v9);
  uint64_t v11 = OUTLINED_FUNCTION_3();
  v12(v11);
  swift_release();
  swift_release();
}

void closure #1 in NetworkManager.stopMonitoringNetwork()(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = (char *)MEMORY[0x2611B37F0](v1);
  if (v2)
  {
    uint64_t v3 = v2;
    if (*(void *)&v2[OBJC_IVAR___SNNetworkManagerInternal_pathEvaluator])
    {
      uint64_t v4 = one-time initialization token for siriNetwork;
      swift_unknownObjectRetain();
      if (v4 != -1) {
        swift_once();
      }
      uint64_t v5 = type metadata accessor for Logger();
      __swift_project_value_buffer(v5, (uint64_t)static Logger.siriNetwork);
      uint64_t v6 = Logger.logObject.getter();
      os_log_type_t v7 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v6, v7))
      {
        id v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_25D6CC000, v6, v7, "NetworkManager - PathEvaluator: Stop monitoring network", v8, 2u);
        MEMORY[0x2611B3750](v8, -1, -1);
      }

      nw_path_evaluator_cancel();
      NetworkManager.pathEvaluator.setter(0);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void partial apply for closure #1 in NetworkManager.stopMonitoringNetwork()()
{
  closure #1 in NetworkManager.stopMonitoringNetwork()(v0);
}

uint64_t sub_25D75ADB4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void partial apply for closure #1 in closure #1 in NetworkManager.startMonitoringNetwork(_:)(NSObject *a1)
{
}

uint64_t outlined destroy of AnyHashable?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnyHashable?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_29()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_4_17()
{
  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_6_14@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  uint64_t v19 = *(void *)(v16 + 48) + a1 * v17;
  return outlined init with copy of AnyHashable(v19, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_10_11()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_13_8()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_14_5()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

id ConnectionInfo.__allocating_init(connectionConfiguration:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ConnectionInfo.init(connectionConfiguration:)(a1);
}

void *key path setter for ConnectionInfo.connectionConfiguration : ConnectionInfo(void *__src)
{
  memcpy(__dst, __src, 0x204uLL);
  outlined retain of ConnectionConfiguration(__dst);
  return ConnectionInfo.connectionConfiguration.setter();
}

void *ConnectionInfo.connectionConfiguration.getter@<X0>(void *a1@<X8>)
{
  id v3 = (const void *)(v1 + OBJC_IVAR___SNConnectionInfoInternal_connectionConfiguration);
  swift_beginAccess();
  memcpy(__dst, v3, 0x204uLL);
  memcpy(a1, v3, 0x204uLL);
  return outlined retain of ConnectionConfiguration(__dst);
}

void *ConnectionInfo.connectionConfiguration.setter()
{
  uint64_t v1 = (const void *)(v0 + OBJC_IVAR___SNConnectionInfoInternal_connectionConfiguration);
  OUTLINED_FUNCTION_1_30();
  memcpy(__dst, v1, 0x204uLL);
  uint64_t v2 = (void *)OUTLINED_FUNCTION_16_7();
  memcpy(v2, v3, 0x204uLL);
  return outlined release of ConnectionConfiguration(__dst);
}

uint64_t (*ConnectionInfo.connectionConfiguration.modify())()
{
  return static ConnectionConfigurationError.errorDomain.modify;
}

void *ConnectionInfo.policy.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___SNConnectionInfoInternal_policy);
  id v2 = v1;
  return v1;
}

void ConnectionInfo.policy.setter(uint64_t a1)
{
}

void *ConnectionInfo.policyRoute.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___SNConnectionInfoInternal_policyRoute);
  id v2 = v1;
  return v1;
}

void ConnectionInfo.policyRoute.setter(uint64_t a1)
{
}

id ConnectionInfo.init(connectionConfiguration:)(void *__src)
{
  *(void *)&v1[OBJC_IVAR___SNConnectionInfoInternal_policy] = 0;
  *(void *)&v1[OBJC_IVAR___SNConnectionInfoInternal_policyRoute] = 0;
  memcpy(&v1[OBJC_IVAR___SNConnectionInfoInternal_connectionConfiguration], __src, 0x204uLL);
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for ConnectionInfo();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for ConnectionInfo()
{
  return self;
}

id ConnectionInfo.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id ConnectionInfo.init()()
{
  *(void *)&v0[OBJC_IVAR___SNConnectionInfoInternal_policy] = 0;
  *(void *)&v0[OBJC_IVAR___SNConnectionInfoInternal_policyRoute] = 0;
  id v1 = v0;
  int v2 = AFIsInternalInstall();
  if (v2) {
    LOBYTE(v2) = _AFPreferencesShouldUseTFO();
  }
  char v13 = 1;
  char v12 = 1;
  char v11 = 1;
  char v10 = 1;
  char v9 = 1;
  char v8 = 1;
  char v7 = 1;
  char v6 = 1;
  objc_super v3 = &v1[OBJC_IVAR___SNConnectionInfoInternal_connectionConfiguration];
  *(int64x2_t *)objc_super v3 = vdupq_n_s64(1uLL);
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  *((_OWORD *)v3 + 5) = 0u;
  *((_DWORD *)v3 + 24) = 1;
  *((void *)v3 + 13) = 0;
  *(_DWORD *)(v3 + 111) = 0;
  *((void *)v3 + 15) = 0;
  v3[128] = v13;
  *(int64x2_t *)(v3 + 136) = vdupq_n_s64(0x4056800000000000uLL);
  *(_OWORD *)(v3 + 152) = 0u;
  *(_OWORD *)(v3 + 168) = 0u;
  *(_OWORD *)(v3 + 184) = 0u;
  v3[200] = v2;
  v3[201] = 1;
  *((void *)v3 + 26) = 0;
  v3[216] = v12;
  *((void *)v3 + 28) = 0;
  v3[232] = v11;
  *((void *)v3 + 30) = 0;
  v3[248] = v10;
  *((void *)v3 + 32) = 0;
  v3[264] = v9;
  *((void *)v3 + 34) = 0;
  v3[280] = v8;
  *((void *)v3 + 36) = 0;
  v3[296] = v7;
  *((void *)v3 + 38) = 0;
  v3[312] = v6;
  v3[313] = 0;
  *((_OWORD *)v3 + 23) = 0u;
  *((_OWORD *)v3 + 24) = 0u;
  *((_OWORD *)v3 + 21) = 0u;
  *((_OWORD *)v3 + 22) = 0u;
  *((_OWORD *)v3 + 20) = 0u;
  *((void *)v3 + 50) = 0;
  *((void *)v3 + 51) = 1;
  *((_DWORD *)v3 + 128) = 0;
  *((_OWORD *)v3 + 30) = 0u;
  *((_OWORD *)v3 + 31) = 0u;
  *((_OWORD *)v3 + 28) = 0u;
  *((_OWORD *)v3 + 29) = 0u;
  *((_OWORD *)v3 + 26) = 0u;
  *((_OWORD *)v3 + 27) = 0u;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConnectionInfo();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t ConnectionInfo.connectionProtocolTechnology.getter()
{
  ConnectionInfo.connectionConfiguration.getter(v1);
  outlined release of ConnectionConfiguration(v1);
  return v1[0];
}

uint64_t ConnectionInfo.connectionProtocolTechnology.setter(uint64_t a1)
{
  if (a1 == 2) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  uint64_t result = OUTLINED_FUNCTION_7_9();
  *id v1 = v2;
  return result;
}

void (*ConnectionInfo.connectionProtocolTechnology.modify())(uint64_t a1, uint64_t a2)
{
  id v1 = malloc(0x218uLL);
  OUTLINED_FUNCTION_15_5(v1);
  outlined release of ConnectionConfiguration(v0);
  v0[65] = *v0;
  return ConnectionInfo.connectionProtocolTechnology.modify;
}

void ConnectionInfo.connectionProtocolTechnology.modify(uint64_t a1, uint64_t a2)
{
}

uint64_t ConnectionInfo.communicationProtocolTechnology.getter()
{
  ConnectionInfo.connectionConfiguration.getter(v1);
  outlined release of ConnectionConfiguration(v1);
  return v1[1];
}

uint64_t ConnectionInfo.communicationProtocolTechnology.setter(uint64_t a1)
{
  if (a1 == 2) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  uint64_t result = OUTLINED_FUNCTION_7_9();
  *(void *)(v1 + 8) = v2;
  return result;
}

void (*ConnectionInfo.communicationProtocolTechnology.modify())(uint64_t a1, uint64_t a2)
{
  uint64_t v1 = malloc(0x218uLL);
  OUTLINED_FUNCTION_15_5(v1);
  outlined release of ConnectionConfiguration(v0);
  v0[65] = v0[1];
  return ConnectionInfo.communicationProtocolTechnology.modify;
}

void ConnectionInfo.communicationProtocolTechnology.modify(uint64_t a1, uint64_t a2)
{
}

void ConnectionInfo.connectionProtocolTechnology.modify(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  objc_super v3 = *(void **)a1;
  a3(*(void *)(*(void *)a1 + 520));

  free(v3);
}

uint64_t ConnectionInfo.assistantIdentifier.getter()
{
  ConnectionInfo.connectionConfiguration.getter(&v1);
  swift_bridgeObjectRetain();
  outlined release of ConnectionConfiguration(&v1);
  return OUTLINED_FUNCTION_6_15();
}

uint64_t ConnectionInfo.assistantIdentifier.setter()
{
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_1_20();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return swift_bridgeObjectRelease();
}

uint64_t (*ConnectionInfo.assistantIdentifier.modify(uint64_t a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_12_9(a1);
  *uint64_t v1 = ConnectionInfo.assistantIdentifier.getter();
  v1[1] = v2;
  return ConnectionInfo.assistantIdentifier.modify;
}

uint64_t ConnectionInfo.assistantIdentifier.modify(uint64_t a1, char a2)
{
  return ConnectionInfo.assistantIdentifier.modify(a1, a2, (void (*)(uint64_t))ConnectionInfo.assistantIdentifier.setter);
}

uint64_t ConnectionInfo.peerAssistantIdentifier.getter()
{
  ConnectionInfo.connectionConfiguration.getter(&v1);
  swift_bridgeObjectRetain();
  outlined release of ConnectionConfiguration(&v1);
  return OUTLINED_FUNCTION_6_15();
}

uint64_t ConnectionInfo.peerAssistantIdentifier.setter()
{
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_1_20();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v0;
  return swift_bridgeObjectRelease();
}

uint64_t (*ConnectionInfo.peerAssistantIdentifier.modify(uint64_t a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_12_9(a1);
  *uint64_t v1 = ConnectionInfo.peerAssistantIdentifier.getter();
  v1[1] = v2;
  return ConnectionInfo.peerAssistantIdentifier.modify;
}

uint64_t ConnectionInfo.peerAssistantIdentifier.modify(uint64_t a1, char a2)
{
  return ConnectionInfo.assistantIdentifier.modify(a1, a2, (void (*)(uint64_t))ConnectionInfo.peerAssistantIdentifier.setter);
}

uint64_t ConnectionInfo.connectionId.getter()
{
  ConnectionInfo.connectionConfiguration.getter(v67);
  uint64_t v0 = v68;
  uint64_t v1 = v69;
  uint64_t v8 = v108;
  uint64_t v2 = v109;
  uint64_t v3 = v110;
  uint64_t v4 = v111;
  long long v12 = v113;
  long long v13 = v112;
  long long v10 = v115;
  long long v11 = v114;
  long long v9 = v116;
  __int16 v6 = v117;
  if (v109 == 1 || !v111)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v7 = v0;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = v3;
  }
  uint64_t v15 = v0;
  uint64_t v16 = v1;
  char v19 = v72;
  char v20 = v73;
  char v21 = v74;
  char v22 = v75;
  uint64_t v23 = v76;
  char v24 = v77;
  char v25 = v78;
  char v26 = v79;
  uint64_t v27 = v80;
  char v28 = v81;
  long long v29 = v82;
  long long v30 = v83;
  long long v31 = v84;
  long long v32 = v85;
  char v33 = v86;
  char v34 = v87;
  uint64_t v35 = v88;
  char v36 = v89;
  uint64_t v37 = v90;
  char v38 = v91;
  uint64_t v39 = v92;
  char v40 = v93;
  char v42 = v95;
  uint64_t v41 = v94;
  uint64_t v43 = v96;
  char v44 = v97;
  char v46 = v99;
  char v48 = v101;
  uint64_t v45 = v98;
  uint64_t v47 = v100;
  char v49 = v102;
  uint64_t v55 = v8;
  uint64_t v56 = v2;
  uint64_t v57 = v3;
  uint64_t v58 = v4;
  __int16 v64 = v6;
  char v65 = v118;
  char v66 = v119;
  v14[0] = v67[0];
  v14[1] = v67[1];
  v14[2] = v67[2];
  long long v17 = v70;
  long long v18 = v71;
  long long v50 = v103;
  long long v51 = v104;
  long long v52 = v105;
  long long v53 = v106;
  long long v54 = v107;
  long long v59 = v13;
  long long v60 = v12;
  long long v61 = v11;
  long long v62 = v10;
  long long v63 = v9;
  outlined release of ConnectionConfiguration(v14);
  return v7;
}

uint64_t ConnectionInfo.connectionId.setter()
{
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_1_20();
  *(void *)(v1 + 48) = v2;
  *(void *)(v1 + 56) = v0;
  return swift_bridgeObjectRelease();
}

uint64_t (*ConnectionInfo.connectionId.modify(uint64_t a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_12_9(a1);
  *uint64_t v1 = ConnectionInfo.connectionId.getter();
  v1[1] = v2;
  return ConnectionInfo.connectionId.modify;
}

uint64_t ConnectionInfo.connectionId.modify(uint64_t a1, char a2)
{
  return ConnectionInfo.assistantIdentifier.modify(a1, a2, (void (*)(uint64_t))ConnectionInfo.connectionId.setter);
}

uint64_t ConnectionInfo.aceHost.getter()
{
  ConnectionInfo.connectionConfiguration.getter(&v1);
  swift_bridgeObjectRetain();
  outlined release of ConnectionConfiguration(&v1);
  return OUTLINED_FUNCTION_6_15();
}

uint64_t ConnectionInfo.aceHost.setter()
{
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_1_20();
  *(void *)(v1 + 64) = v2;
  *(void *)(v1 + 72) = v0;
  return swift_bridgeObjectRelease();
}

uint64_t (*ConnectionInfo.aceHost.modify(uint64_t a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_12_9(a1);
  *uint64_t v1 = ConnectionInfo.aceHost.getter();
  v1[1] = v2;
  return ConnectionInfo.aceHost.modify;
}

uint64_t ConnectionInfo.aceHost.modify(uint64_t a1, char a2)
{
  return ConnectionInfo.assistantIdentifier.modify(a1, a2, (void (*)(uint64_t))ConnectionInfo.aceHost.setter);
}

uint64_t ConnectionInfo.languageCode.getter()
{
  ConnectionInfo.connectionConfiguration.getter(&v1);
  swift_bridgeObjectRetain();
  outlined release of ConnectionConfiguration(&v1);
  return OUTLINED_FUNCTION_6_15();
}

uint64_t ConnectionInfo.languageCode.setter()
{
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_1_20();
  *(void *)(v1 + 80) = v2;
  *(void *)(v1 + 88) = v0;
  return swift_bridgeObjectRelease();
}

uint64_t (*ConnectionInfo.languageCode.modify(uint64_t a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_12_9(a1);
  *uint64_t v1 = ConnectionInfo.languageCode.getter();
  v1[1] = v2;
  return ConnectionInfo.languageCode.modify;
}

uint64_t ConnectionInfo.languageCode.modify(uint64_t a1, char a2)
{
  return ConnectionInfo.assistantIdentifier.modify(a1, a2, (void (*)(uint64_t))ConnectionInfo.languageCode.setter);
}

uint64_t ConnectionInfo.prefersWWAN.getter()
{
  ConnectionInfo.connectionConfiguration.getter(v1);
  outlined release of ConnectionConfiguration(v1);
  return v2;
}

uint64_t ConnectionInfo.prefersWWAN.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_20();
  *(unsigned char *)(v1 + 96) = a1;
  return result;
}

void (*ConnectionInfo.prefersWWAN.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_2_23(v1);
  outlined release of ConnectionConfiguration((void *)v0);
  *(unsigned char *)(v0 + 516) = *(unsigned char *)(v0 + 96);
  return ConnectionInfo.prefersWWAN.modify;
}

void ConnectionInfo.prefersWWAN.modify()
{
  OUTLINED_FUNCTION_4_18();
  OUTLINED_FUNCTION_5_18();
  OUTLINED_FUNCTION_1_30();
  *(unsigned char *)(v1 + 96) = v2;

  free(v0);
}

uint64_t ConnectionInfo.skipPeer.getter()
{
  ConnectionInfo.connectionConfiguration.getter(v1);
  outlined release of ConnectionConfiguration(v1);
  return v2;
}

uint64_t ConnectionInfo.skipPeer.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_20();
  *(unsigned char *)(v1 + 97) = a1;
  return result;
}

void (*ConnectionInfo.skipPeer.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_2_23(v1);
  outlined release of ConnectionConfiguration((void *)v0);
  *(unsigned char *)(v0 + 516) = *(unsigned char *)(v0 + 97);
  return ConnectionInfo.skipPeer.modify;
}

void ConnectionInfo.skipPeer.modify()
{
  OUTLINED_FUNCTION_4_18();
  OUTLINED_FUNCTION_5_18();
  OUTLINED_FUNCTION_1_30();
  *(unsigned char *)(v1 + 97) = v2;

  free(v0);
}

uint64_t ConnectionInfo.useWiFiHint.getter()
{
  ConnectionInfo.connectionConfiguration.getter(v1);
  outlined release of ConnectionConfiguration(v1);
  return v2;
}

uint64_t ConnectionInfo.useWiFiHint.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_20();
  *(unsigned char *)(v1 + 98) = a1;
  return result;
}

void (*ConnectionInfo.useWiFiHint.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_2_23(v1);
  outlined release of ConnectionConfiguration((void *)v0);
  *(unsigned char *)(v0 + 516) = *(unsigned char *)(v0 + 98);
  return ConnectionInfo.useWiFiHint.modify;
}

void ConnectionInfo.useWiFiHint.modify()
{
  OUTLINED_FUNCTION_4_18();
  OUTLINED_FUNCTION_5_18();
  OUTLINED_FUNCTION_1_30();
  *(unsigned char *)(v1 + 98) = v2;

  free(v0);
}

id ConnectionInfo.skipPeerErrorReason.getter()
{
  ConnectionInfo.connectionConfiguration.getter(v3);
  id v0 = v4;
  id v1 = v4;
  outlined release of ConnectionConfiguration(v3);
  return v0;
}

void ConnectionInfo.skipPeerErrorReason.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_1_20();
  uint64_t v3 = *(void **)(v1 + 104);
  *(void *)(v1 + 104) = a1;
}

void key path setter for ConnectionInfo.skipPeerErrorReason : ConnectionInfo(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  ConnectionInfo.skipPeerErrorReason.setter((uint64_t)v1);
}

void (*ConnectionInfo.skipPeerErrorReason.modify(id *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = ConnectionInfo.skipPeerErrorReason.getter();
  return ConnectionInfo.skipPeerErrorReason.modify;
}

void ConnectionInfo.skipPeerErrorReason.modify(uint64_t *a1, char a2)
{
  id v2 = (void *)*a1;
  if (a2)
  {
    id v3 = v2;
    ConnectionInfo.skipPeerErrorReason.setter((uint64_t)v2);
  }
  else
  {
    ConnectionInfo.skipPeerErrorReason.setter(*a1);
  }
}

uint64_t ConnectionInfo.forceReconnect.getter()
{
  ConnectionInfo.connectionConfiguration.getter(v1);
  outlined release of ConnectionConfiguration(v1);
  return v2;
}

uint64_t ConnectionInfo.forceReconnect.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_20();
  *(unsigned char *)(v1 + 113) = a1;
  return result;
}

void (*ConnectionInfo.forceReconnect.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_2_23(v1);
  outlined release of ConnectionConfiguration((void *)v0);
  *(unsigned char *)(v0 + 516) = *(unsigned char *)(v0 + 113);
  return ConnectionInfo.forceReconnect.modify;
}

void ConnectionInfo.forceReconnect.modify()
{
  OUTLINED_FUNCTION_4_18();
  OUTLINED_FUNCTION_5_18();
  OUTLINED_FUNCTION_1_30();
  *(unsigned char *)(v1 + 113) = v2;

  free(v0);
}

double ConnectionInfo.timeout.getter()
{
  ConnectionInfo.connectionConfiguration.getter(v1);
  outlined release of ConnectionConfiguration(v1);
  double result = *(double *)&v1[15];
  if (v2) {
    return 0.0;
  }
  return result;
}

uint64_t ConnectionInfo.timeout.setter(double a1)
{
  uint64_t result = OUTLINED_FUNCTION_7_9();
  *(double *)(v1 + 120) = a1;
  *(unsigned char *)(v1 + 128) = 0;
  return result;
}

void (*ConnectionInfo.timeout.modify(double **a1))(uint64_t a1)
{
  id v3 = (double *)malloc(0x40uLL);
  *a1 = v3;
  *((void *)v3 + 7) = v1;
  v3[6] = ConnectionInfo.timeout.getter();
  return ConnectionInfo.timeout.modify;
}

void ConnectionInfo.timeout.modify(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)(*(void *)a1 + 48);
  uint64_t v3 = *(void *)(*(void *)a1 + 56) + OBJC_IVAR___SNConnectionInfoInternal_connectionConfiguration;
  OUTLINED_FUNCTION_1_30();
  *(void *)(v3 + 120) = v2;
  *(unsigned char *)(v3 + 128) = 0;

  free(v1);
}

uint64_t ConnectionInfo.imposePolicyBan.getter()
{
  ConnectionInfo.connectionConfiguration.getter(v1);
  outlined release of ConnectionConfiguration(v1);
  return v2;
}

uint64_t ConnectionInfo.imposePolicyBan.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_20();
  *(unsigned char *)(v1 + 313) = a1;
  return result;
}

void (*ConnectionInfo.imposePolicyBan.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_2_23(v1);
  outlined release of ConnectionConfiguration((void *)v0);
  *(unsigned char *)(v0 + 516) = *(unsigned char *)(v0 + 313);
  return ConnectionInfo.imposePolicyBan.modify;
}

void ConnectionInfo.imposePolicyBan.modify()
{
  OUTLINED_FUNCTION_4_18();
  OUTLINED_FUNCTION_5_18();
  OUTLINED_FUNCTION_1_30();
  *(unsigned char *)(v1 + 313) = v2;

  free(v0);
}

void ConnectionInfo.connectionPolicy.setter(void *a1)
{
  id v3 = a1;
  ConnectionInfo.policy.setter((uint64_t)a1);
  id v4 = v3;
  ConnectionPolicy.init(from:)(a1, (uint64_t)&v23);
  uint64_t v5 = v23;
  uint64_t v6 = v25;
  long long v21 = v26;
  long long v22 = v24;
  uint64_t v7 = v27;
  long long v20 = v28;
  uint64_t v8 = v29;
  long long v9 = (void *)(v1 + OBJC_IVAR___SNConnectionInfoInternal_connectionConfiguration);
  OUTLINED_FUNCTION_1_30();
  uint64_t v10 = v9[40];
  uint64_t v11 = v9[41];
  uint64_t v12 = v9[42];
  uint64_t v13 = v9[43];
  uint64_t v14 = v9[44];
  uint64_t v15 = v9[45];
  uint64_t v16 = v9[46];
  uint64_t v17 = v9[47];
  uint64_t v18 = v9[48];
  uint64_t v19 = v9[49];
  v9[40] = v5;
  *(_OWORD *)(v9 + 41) = v22;
  v9[43] = v6;
  *((_OWORD *)v9 + 22) = v21;
  v9[46] = v7;
  *(_OWORD *)(v9 + 47) = v20;
  v9[49] = v8;
  outlined consume of ConnectionPolicy?(v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);
}

void key path setter for ConnectionInfo.connectionPolicy : ConnectionInfo(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  ConnectionInfo.connectionPolicy.setter(v1);
}

uint64_t ConnectionInfo.connectionPolicy.modify(void *a1)
{
  id v2 = *(void **)(v1 + OBJC_IVAR___SNConnectionInfoInternal_policy);
  *a1 = v2;
  a1[1] = v1;
  id v3 = v2;
  return OUTLINED_FUNCTION_16_7();
}

void ConnectionInfo.connectionPolicy.modify(void **a1, char a2)
{
}

void ConnectionInfo.connectionPolicyRoute.setter(void *a1)
{
  id v3 = a1;
  ConnectionInfo.policyRoute.setter((uint64_t)a1);
  id v4 = v3;
  ConnectionPolicyRoute.init(from:)(a1, (uint64_t)&v19);
  uint64_t v5 = v19;
  uint64_t v6 = v21;
  long long v17 = v22;
  long long v18 = v20;
  uint64_t v7 = v23;
  uint64_t v8 = v25;
  long long v15 = v26;
  long long v16 = v24;
  uint64_t v9 = v27;
  uint64_t v10 = v28;
  __int16 v11 = v29;
  uint64_t v12 = v1 + OBJC_IVAR___SNConnectionInfoInternal_connectionConfiguration;
  OUTLINED_FUNCTION_1_30();
  uint64_t v13 = *(void *)(v12 + 400);
  uint64_t v14 = *(void *)(v12 + 408);
  *(void *)(v12 + 400) = v5;
  *(_OWORD *)(v12 + 408) = v18;
  *(void *)(v12 + 424) = v6;
  *(_OWORD *)(v12 + 432) = v17;
  *(void *)(v12 + 448) = v7;
  *(_OWORD *)(v12 + 456) = v16;
  *(void *)(v12 + 472) = v8;
  *(_OWORD *)(v12 + 480) = v15;
  *(void *)(v12 + 496) = v9;
  *(void *)(v12 + 504) = v10;
  *(_WORD *)(v12 + 512) = v11;
  outlined consume of ConnectionPolicyRoute?(v13, v14);
}

void key path setter for ConnectionInfo.connectionPolicyRoute : ConnectionInfo(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  ConnectionInfo.connectionPolicyRoute.setter(v1);
}

uint64_t ConnectionInfo.connectionPolicyRoute.modify(void *a1)
{
  id v2 = *(void **)(v1 + OBJC_IVAR___SNConnectionInfoInternal_policyRoute);
  *a1 = v2;
  a1[1] = v1;
  id v3 = v2;
  return OUTLINED_FUNCTION_16_7();
}

void ConnectionInfo.connectionPolicyRoute.modify(void **a1, char a2)
{
}

void ConnectionInfo.connectionPolicy.modify(void **a1, char a2, void (*a3)(void *))
{
  id v4 = *a1;
  if (a2)
  {
    id v5 = v4;
    a3(v4);
  }
  else
  {
    a3(*a1);
  }
}

uint64_t ConnectionInfo.forceOnDeviceOnlyDictation.getter()
{
  ConnectionInfo.connectionConfiguration.getter(v1);
  outlined release of ConnectionConfiguration(v1);
  return v2;
}

uint64_t ConnectionInfo.forceOnDeviceOnlyDictation.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_20();
  *(unsigned char *)(v1 + 114) = a1;
  return result;
}

void (*ConnectionInfo.forceOnDeviceOnlyDictation.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_2_23(v1);
  outlined release of ConnectionConfiguration((void *)v0);
  *(unsigned char *)(v0 + 516) = *(unsigned char *)(v0 + 114);
  return ConnectionInfo.forceOnDeviceOnlyDictation.modify;
}

void ConnectionInfo.forceOnDeviceOnlyDictation.modify()
{
  OUTLINED_FUNCTION_4_18();
  OUTLINED_FUNCTION_5_18();
  OUTLINED_FUNCTION_1_30();
  *(unsigned char *)(v1 + 114) = v2;

  free(v0);
}

uint64_t ConnectionInfo.productTypePrefix.getter()
{
  ConnectionInfo.connectionConfiguration.getter(&v1);
  swift_bridgeObjectRetain();
  outlined release of ConnectionConfiguration(&v1);
  return OUTLINED_FUNCTION_6_15();
}

uint64_t ConnectionInfo.productTypePrefix.setter()
{
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_1_20();
  *(void *)(v1 + 152) = v2;
  *(void *)(v1 + 160) = v0;
  return swift_bridgeObjectRelease();
}

uint64_t (*ConnectionInfo.productTypePrefix.modify(uint64_t a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_12_9(a1);
  *uint64_t v1 = ConnectionInfo.productTypePrefix.getter();
  v1[1] = v2;
  return ConnectionInfo.productTypePrefix.modify;
}

uint64_t ConnectionInfo.productTypePrefix.modify(uint64_t a1, char a2)
{
  return ConnectionInfo.assistantIdentifier.modify(a1, a2, (void (*)(uint64_t))ConnectionInfo.productTypePrefix.setter);
}

uint64_t ConnectionInfo.peerType.getter()
{
  ConnectionInfo.connectionConfiguration.getter(&v1);
  swift_bridgeObjectRetain();
  outlined release of ConnectionConfiguration(&v1);
  return OUTLINED_FUNCTION_6_15();
}

uint64_t ConnectionInfo.peerType.setter()
{
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_1_20();
  *(void *)(v1 + 168) = v2;
  *(void *)(v1 + 176) = v0;
  return swift_bridgeObjectRelease();
}

uint64_t (*ConnectionInfo.peerType.modify(uint64_t a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_12_9(a1);
  *uint64_t v1 = ConnectionInfo.peerType.getter();
  v1[1] = v2;
  return ConnectionInfo.peerType.modify;
}

uint64_t ConnectionInfo.peerType.modify(uint64_t a1, char a2)
{
  return ConnectionInfo.assistantIdentifier.modify(a1, a2, (void (*)(uint64_t))ConnectionInfo.peerType.setter);
}

id @objc ConnectionInfo.assistantIdentifier.getter(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();
  uint64_t v6 = v5;

  if (v6)
  {
    uint64_t v7 = OUTLINED_FUNCTION_16_7();
    uint64_t v8 = (void *)MEMORY[0x2611B2220](v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t ConnectionInfo.peerVersion.getter()
{
  ConnectionInfo.connectionConfiguration.getter(&v1);
  swift_bridgeObjectRetain();
  outlined release of ConnectionConfiguration(&v1);
  return OUTLINED_FUNCTION_6_15();
}

void @objc ConnectionInfo.assistantIdentifier.setter(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a1;
  a4(v6, v8);
}

uint64_t ConnectionInfo.peerVersion.setter()
{
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_1_20();
  *(void *)(v1 + 184) = v2;
  *(void *)(v1 + 192) = v0;
  return swift_bridgeObjectRelease();
}

uint64_t key path setter for ConnectionInfo.assistantIdentifier : ConnectionInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  swift_bridgeObjectRetain();
  uint64_t v6 = OUTLINED_FUNCTION_14_6();
  return a5(v6);
}

uint64_t (*ConnectionInfo.peerVersion.modify(uint64_t a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_12_9(a1);
  *uint64_t v1 = ConnectionInfo.peerVersion.getter();
  v1[1] = v2;
  return ConnectionInfo.peerVersion.modify;
}

uint64_t ConnectionInfo.peerVersion.modify(uint64_t a1, char a2)
{
  return ConnectionInfo.assistantIdentifier.modify(a1, a2, (void (*)(uint64_t))ConnectionInfo.peerVersion.setter);
}

uint64_t ConnectionInfo.assistantIdentifier.modify(uint64_t a1, char a2, void (*a3)(uint64_t))
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = OUTLINED_FUNCTION_14_6();
    a3(v4);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = OUTLINED_FUNCTION_14_6();
    return ((uint64_t (*)(uint64_t))a3)(v6);
  }
}

uint64_t ConnectionInfo.deviceIsInWalkaboutExperimentGroup.getter()
{
  ConnectionInfo.connectionConfiguration.getter(v1);
  outlined release of ConnectionConfiguration(v1);
  return v2;
}

uint64_t ConnectionInfo.deviceIsInWalkaboutExperimentGroup.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_20();
  *(unsigned char *)(v1 + 514) = a1;
  return result;
}

void (*ConnectionInfo.deviceIsInWalkaboutExperimentGroup.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_2_23(v1);
  outlined release of ConnectionConfiguration((void *)v0);
  *(unsigned char *)(v0 + 516) = *(unsigned char *)(v0 + 514);
  return ConnectionInfo.deviceIsInWalkaboutExperimentGroup.modify;
}

void ConnectionInfo.deviceIsInWalkaboutExperimentGroup.modify()
{
  OUTLINED_FUNCTION_4_18();
  OUTLINED_FUNCTION_5_18();
  OUTLINED_FUNCTION_1_30();
  *(unsigned char *)(v1 + 514) = v2;

  free(v0);
}

uint64_t ConnectionInfo.usesProxyConnection.getter()
{
  ConnectionInfo.connectionConfiguration.getter(v1);
  outlined release of ConnectionConfiguration(v1);
  return v2;
}

uint64_t ConnectionInfo.usesProxyConnection.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_20();
  *(unsigned char *)(v1 + 99) = a1;
  return result;
}

void (*ConnectionInfo.usesProxyConnection.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_2_23(v1);
  outlined release of ConnectionConfiguration((void *)v0);
  *(unsigned char *)(v0 + 516) = *(unsigned char *)(v0 + 99);
  return ConnectionInfo.usesProxyConnection.modify;
}

void ConnectionInfo.usesProxyConnection.modify()
{
  OUTLINED_FUNCTION_4_18();
  OUTLINED_FUNCTION_5_18();
  OUTLINED_FUNCTION_1_30();
  *(unsigned char *)(v1 + 99) = v2;

  free(v0);
}

uint64_t ConnectionInfo.usesPeerManagedSync.getter()
{
  ConnectionInfo.connectionConfiguration.getter(v1);
  outlined release of ConnectionConfiguration(v1);
  return v2;
}

uint64_t ConnectionInfo.usesPeerManagedSync.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_20();
  *(unsigned char *)(v1 + 515) = a1;
  return result;
}

void (*ConnectionInfo.usesPeerManagedSync.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_2_23(v1);
  outlined release of ConnectionConfiguration((void *)v0);
  *(unsigned char *)(v0 + 516) = *(unsigned char *)(v0 + 515);
  return ConnectionInfo.usesPeerManagedSync.modify;
}

void ConnectionInfo.usesPeerManagedSync.modify()
{
  OUTLINED_FUNCTION_4_18();
  OUTLINED_FUNCTION_5_18();
  OUTLINED_FUNCTION_1_30();
  *(unsigned char *)(v1 + 515) = v2;

  free(v0);
}

id ConnectionInfo.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConnectionInfo();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_25D75DBB0@<X0>(void *a1@<X8>)
{
  return ConnectionInfo.connectionConfiguration.getter(a1);
}

uint64_t sub_25D75DBD8()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t result = ConnectionInfo.connectionProtocolTechnology.getter();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_25D75DC00(uint64_t *a1)
{
  return ConnectionInfo.connectionProtocolTechnology.setter(*a1);
}

uint64_t sub_25D75DC28()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t result = ConnectionInfo.communicationProtocolTechnology.getter();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_25D75DC50(uint64_t *a1)
{
  return ConnectionInfo.communicationProtocolTechnology.setter(*a1);
}

uint64_t sub_25D75DC78()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t result = ConnectionInfo.assistantIdentifier.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25D75DCA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ConnectionInfo.assistantIdentifier : ConnectionInfo(a1, a2, a3, a4, (uint64_t (*)(uint64_t))ConnectionInfo.assistantIdentifier.setter);
}

uint64_t sub_25D75DCCC()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t result = ConnectionInfo.peerAssistantIdentifier.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25D75DCF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ConnectionInfo.assistantIdentifier : ConnectionInfo(a1, a2, a3, a4, (uint64_t (*)(uint64_t))ConnectionInfo.peerAssistantIdentifier.setter);
}

uint64_t sub_25D75DD20()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t result = ConnectionInfo.connectionId.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25D75DD48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ConnectionInfo.assistantIdentifier : ConnectionInfo(a1, a2, a3, a4, (uint64_t (*)(uint64_t))ConnectionInfo.connectionId.setter);
}

uint64_t sub_25D75DD74()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t result = ConnectionInfo.aceHost.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25D75DD9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ConnectionInfo.assistantIdentifier : ConnectionInfo(a1, a2, a3, a4, (uint64_t (*)(uint64_t))ConnectionInfo.aceHost.setter);
}

uint64_t sub_25D75DDC8()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t result = ConnectionInfo.languageCode.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25D75DDF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ConnectionInfo.assistantIdentifier : ConnectionInfo(a1, a2, a3, a4, (uint64_t (*)(uint64_t))ConnectionInfo.languageCode.setter);
}

uint64_t sub_25D75DE1C()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t v0 = ConnectionInfo.prefersWWAN.getter();
  return OUTLINED_FUNCTION_9_12(v0);
}

uint64_t sub_25D75DE44(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_8_13(a1);
  return ConnectionInfo.prefersWWAN.setter(v1);
}

uint64_t sub_25D75DE68()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t v0 = ConnectionInfo.skipPeer.getter();
  return OUTLINED_FUNCTION_9_12(v0);
}

uint64_t sub_25D75DE90(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_8_13(a1);
  return ConnectionInfo.skipPeer.setter(v1);
}

uint64_t sub_25D75DEB4()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t v0 = ConnectionInfo.useWiFiHint.getter();
  return OUTLINED_FUNCTION_9_12(v0);
}

uint64_t sub_25D75DEDC(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_8_13(a1);
  return ConnectionInfo.useWiFiHint.setter(v1);
}

id sub_25D75DF00()
{
  OUTLINED_FUNCTION_5_9();
  id result = ConnectionInfo.skipPeerErrorReason.getter();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_25D75DF2C()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t v0 = ConnectionInfo.forceReconnect.getter();
  return OUTLINED_FUNCTION_9_12(v0);
}

uint64_t sub_25D75DF54(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_8_13(a1);
  return ConnectionInfo.forceReconnect.setter(v1);
}

void sub_25D75DF78()
{
  OUTLINED_FUNCTION_5_9();
  *uint64_t v0 = ConnectionInfo.timeout.getter();
}

uint64_t sub_25D75DFA0(double *a1)
{
  return ConnectionInfo.timeout.setter(*a1);
}

uint64_t sub_25D75DFC8()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t v0 = ConnectionInfo.imposePolicyBan.getter();
  return OUTLINED_FUNCTION_9_12(v0);
}

uint64_t sub_25D75DFF0(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_8_13(a1);
  return ConnectionInfo.imposePolicyBan.setter(v1);
}

void *sub_25D75E014()
{
  OUTLINED_FUNCTION_5_9();
  id result = ConnectionInfo.policy.getter();
  *uint64_t v0 = result;
  return result;
}

void *sub_25D75E040()
{
  OUTLINED_FUNCTION_5_9();
  id result = ConnectionInfo.policyRoute.getter();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_25D75E06C()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t v0 = ConnectionInfo.forceOnDeviceOnlyDictation.getter();
  return OUTLINED_FUNCTION_9_12(v0);
}

uint64_t sub_25D75E094(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_8_13(a1);
  return ConnectionInfo.forceOnDeviceOnlyDictation.setter(v1);
}

uint64_t sub_25D75E0B8()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t result = ConnectionInfo.productTypePrefix.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25D75E0E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ConnectionInfo.assistantIdentifier : ConnectionInfo(a1, a2, a3, a4, (uint64_t (*)(uint64_t))ConnectionInfo.productTypePrefix.setter);
}

uint64_t sub_25D75E10C()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t result = ConnectionInfo.peerType.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25D75E134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ConnectionInfo.assistantIdentifier : ConnectionInfo(a1, a2, a3, a4, (uint64_t (*)(uint64_t))ConnectionInfo.peerType.setter);
}

uint64_t sub_25D75E160()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t result = ConnectionInfo.peerVersion.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25D75E188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ConnectionInfo.assistantIdentifier : ConnectionInfo(a1, a2, a3, a4, (uint64_t (*)(uint64_t))ConnectionInfo.peerVersion.setter);
}

uint64_t sub_25D75E1B4()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t v0 = ConnectionInfo.deviceIsInWalkaboutExperimentGroup.getter();
  return OUTLINED_FUNCTION_9_12(v0);
}

uint64_t sub_25D75E1DC(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_8_13(a1);
  return ConnectionInfo.deviceIsInWalkaboutExperimentGroup.setter(v1);
}

uint64_t sub_25D75E200()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t v0 = ConnectionInfo.usesProxyConnection.getter();
  return OUTLINED_FUNCTION_9_12(v0);
}

uint64_t sub_25D75E228(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_8_13(a1);
  return ConnectionInfo.usesProxyConnection.setter(v1);
}

uint64_t sub_25D75E24C()
{
  OUTLINED_FUNCTION_5_9();
  uint64_t v0 = ConnectionInfo.usesPeerManagedSync.getter();
  return OUTLINED_FUNCTION_9_12(v0);
}

uint64_t sub_25D75E274(unsigned __int8 *a1)
{
  char v1 = OUTLINED_FUNCTION_8_13(a1);
  return ConnectionInfo.usesPeerManagedSync.setter(v1);
}

uint64_t method lookup function for ConnectionInfo(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ConnectionInfo);
}

uint64_t dispatch thunk of ConnectionInfo.connectionConfiguration.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ConnectionInfo.connectionConfiguration.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ConnectionInfo.connectionConfiguration.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ConnectionInfo.__allocating_init(connectionConfiguration:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of ConnectionInfo.connectionProtocolTechnology.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ConnectionInfo.connectionProtocolTechnology.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ConnectionInfo.connectionProtocolTechnology.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of ConnectionInfo.communicationProtocolTechnology.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ConnectionInfo.communicationProtocolTechnology.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ConnectionInfo.communicationProtocolTechnology.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ConnectionInfo.assistantIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ConnectionInfo.assistantIdentifier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of ConnectionInfo.assistantIdentifier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of ConnectionInfo.peerAssistantIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of ConnectionInfo.peerAssistantIdentifier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of ConnectionInfo.peerAssistantIdentifier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of ConnectionInfo.connectionId.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of ConnectionInfo.connectionId.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of ConnectionInfo.connectionId.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of ConnectionInfo.aceHost.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of ConnectionInfo.aceHost.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of ConnectionInfo.aceHost.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of ConnectionInfo.languageCode.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of ConnectionInfo.languageCode.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of ConnectionInfo.languageCode.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of ConnectionInfo.prefersWWAN.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of ConnectionInfo.prefersWWAN.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of ConnectionInfo.prefersWWAN.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of ConnectionInfo.skipPeer.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of ConnectionInfo.skipPeer.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of ConnectionInfo.skipPeer.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of ConnectionInfo.useWiFiHint.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of ConnectionInfo.useWiFiHint.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of ConnectionInfo.useWiFiHint.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of ConnectionInfo.skipPeerErrorReason.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of ConnectionInfo.skipPeerErrorReason.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of ConnectionInfo.skipPeerErrorReason.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of ConnectionInfo.forceReconnect.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of ConnectionInfo.forceReconnect.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of ConnectionInfo.forceReconnect.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of ConnectionInfo.timeout.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of ConnectionInfo.timeout.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of ConnectionInfo.timeout.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of ConnectionInfo.imposePolicyBan.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of ConnectionInfo.imposePolicyBan.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of ConnectionInfo.imposePolicyBan.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of ConnectionInfo.connectionPolicy.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of ConnectionInfo.connectionPolicy.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of ConnectionInfo.connectionPolicy.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of ConnectionInfo.connectionPolicyRoute.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of ConnectionInfo.connectionPolicyRoute.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of ConnectionInfo.connectionPolicyRoute.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of ConnectionInfo.forceOnDeviceOnlyDictation.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x238))();
}

uint64_t dispatch thunk of ConnectionInfo.forceOnDeviceOnlyDictation.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x240))();
}

uint64_t dispatch thunk of ConnectionInfo.forceOnDeviceOnlyDictation.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x248))();
}

uint64_t dispatch thunk of ConnectionInfo.productTypePrefix.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x250))();
}

uint64_t dispatch thunk of ConnectionInfo.productTypePrefix.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x258))();
}

uint64_t dispatch thunk of ConnectionInfo.productTypePrefix.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x260))();
}

uint64_t dispatch thunk of ConnectionInfo.peerType.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x268))();
}

uint64_t dispatch thunk of ConnectionInfo.peerType.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x270))();
}

uint64_t dispatch thunk of ConnectionInfo.peerType.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x278))();
}

uint64_t dispatch thunk of ConnectionInfo.peerVersion.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x280))();
}

uint64_t dispatch thunk of ConnectionInfo.peerVersion.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x288))();
}

uint64_t dispatch thunk of ConnectionInfo.peerVersion.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x290))();
}

uint64_t dispatch thunk of ConnectionInfo.deviceIsInWalkaboutExperimentGroup.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x298))();
}

uint64_t dispatch thunk of ConnectionInfo.deviceIsInWalkaboutExperimentGroup.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of ConnectionInfo.deviceIsInWalkaboutExperimentGroup.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of ConnectionInfo.usesProxyConnection.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of ConnectionInfo.usesProxyConnection.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of ConnectionInfo.usesProxyConnection.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of ConnectionInfo.usesPeerManagedSync.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of ConnectionInfo.usesPeerManagedSync.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of ConnectionInfo.usesPeerManagedSync.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2D8))();
}

uint64_t OUTLINED_FUNCTION_1_30()
{
  return swift_beginAccess();
}

void *OUTLINED_FUNCTION_2_23(void *a1)
{
  *char v1 = a1;
  a1[71] = v2;
  return ConnectionInfo.connectionConfiguration.getter(a1);
}

uint64_t OUTLINED_FUNCTION_6_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_9()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_8_13(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t OUTLINED_FUNCTION_9_12(uint64_t result)
{
  *char v1 = result & 1;
  return result;
}

void *OUTLINED_FUNCTION_10_12()
{
  return malloc(0x240uLL);
}

uint64_t OUTLINED_FUNCTION_12_9(uint64_t result)
{
  *(void *)(result + 16) = v1;
  return result;
}

void OUTLINED_FUNCTION_13_9(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void **)(v2 + a2);
  *(void *)(v2 + a2) = a1;
}

uint64_t OUTLINED_FUNCTION_14_6()
{
  return v0;
}

void *OUTLINED_FUNCTION_15_5(void *a1)
{
  *uint64_t v1 = a1;
  a1[66] = v2;
  return ConnectionInfo.connectionConfiguration.getter(a1);
}

uint64_t OUTLINED_FUNCTION_16_7()
{
  return v0;
}

uint64_t static SNUtilities.createUserAgentString(fromProductTypePrefix:)(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  id v3 = (id)AFProductType();
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25D793280;
  swift_bridgeObjectRetain();
  id v8 = (id)AFDeviceName();
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  uint64_t v12 = MEMORY[0x263F8D310];
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  unint64_t v13 = lazy protocol witness table accessor for type String and conformance String();
  unint64_t v14 = v13;
  *(void *)(v7 + 64) = v13;
  *(void *)(v7 + 32) = v9;
  *(void *)(v7 + 40) = v11;
  if (!a2)
  {
    long long v18 = (uint64_t *)(v7 + 72);
    *(void *)(v7 + 96) = v12;
    *(void *)(v7 + 104) = v13;
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = specialized StringProtocol.appending<A>(_:)();
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v18 = (uint64_t *)(v7 + 72);
  *(void *)(v7 + 96) = v12;
  *(void *)(v7 + 104) = v14;
  if (!v17)
  {
LABEL_5:
    uint64_t *v18 = v4;
    uint64_t v17 = v6;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  uint64_t *v18 = v15;
LABEL_6:
  *(void *)(v7 + 80) = v17;
  id v19 = (id)AFProductName();
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = v21;

  *(void *)(v7 + 136) = v12;
  *(void *)(v7 + 144) = v14;
  *(void *)(v7 + 112) = v20;
  *(void *)(v7 + 120) = v22;
  id v23 = (id)AFProductVersion();
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v26 = v25;

  *(void *)(v7 + 176) = v12;
  *(void *)(v7 + 184) = v14;
  *(void *)(v7 + 152) = v24;
  *(void *)(v7 + 160) = v26;
  id v27 = (id)AFBuildVersion();
  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v30 = v29;

  *(void *)(v7 + 216) = v12;
  *(void *)(v7 + 224) = v14;
  *(void *)(v7 + 192) = v28;
  *(void *)(v7 + 200) = v30;
  uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v7 + 256) = v12;
  *(void *)(v7 + 264) = v14;
  *(void *)(v7 + 232) = v31;
  *(void *)(v7 + 240) = v32;
  uint64_t v33 = String.init(format:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v33;
}

uint64_t specialized StringProtocol.appending<A>(_:)()
{
  swift_bridgeObjectRetain();
  uint64_t v1 = String.init<A>(_:)();
  String.append<A>(contentsOf:)();
  return v1;
}

SNUtilities __swiftcall SNUtilities.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return (SNUtilities)objc_msgSend(v0, sel_init);
}

id SNUtilities.init()()
{
  v1.super_class = (Class)SNUtilities;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for SNUtilities()
{
  unint64_t result = lazy cache variable for type metadata for SNUtilities;
  if (!lazy cache variable for type metadata for SNUtilities)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SNUtilities);
  }
  return result;
}

uint64_t ConnectionPolicy.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::UInt8 v4 = *(unsigned char *)(v2 + 16);
  Swift::UInt8 v5 = *(unsigned char *)(v2 + 17);
  Swift::UInt8 v6 = *(unsigned char *)(v2 + 18);
  Swift::UInt8 v7 = *(unsigned char *)(v2 + 19);
  Swift::UInt8 v8 = *(unsigned char *)(v2 + 20);
  Swift::UInt8 v9 = *(unsigned char *)(v2 + 21);
  Swift::UInt64 v10 = *(void *)(v2 + 24);
  int v11 = *(unsigned __int8 *)(v2 + 32);
  Swift::UInt v15 = *(void *)(v2 + 40);
  Swift::UInt64 v16 = *(void *)(v2 + 56);
  int v18 = *(unsigned __int8 *)(v2 + 48);
  int v19 = *(unsigned __int8 *)(v2 + 64);
  uint64_t v17 = *(void *)(v2 + 72);
  if (*(void *)(v2 + 8))
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  Hasher._combine(_:)(v4);
  Hasher._combine(_:)(v5);
  Hasher._combine(_:)(v6);
  Hasher._combine(_:)(v7);
  Hasher._combine(_:)(v8);
  Hasher._combine(_:)(v9);
  if (v11)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    Hasher._combine(_:)(1u);
    if ((v10 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
      Swift::UInt64 v12 = v10;
    }
    else {
      Swift::UInt64 v12 = 0;
    }
    Hasher._combine(_:)(v12);
  }
  if (v18)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    Hasher._combine(_:)(1u);
    Hasher._combine(_:)(v15);
  }
  if (v19)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    Hasher._combine(_:)(1u);
    if ((v16 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
      Swift::UInt64 v13 = v16;
    }
    else {
      Swift::UInt64 v13 = 0;
    }
    Hasher._combine(_:)(v13);
  }
  swift_bridgeObjectRetain();
  specialized Set.hash(into:)(a1, v17);

  return swift_bridgeObjectRelease();
}

void static ConnectionPolicy.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  int v5 = *(unsigned __int8 *)(a1 + 17);
  double v6 = *(double *)(a1 + 24);
  char v7 = *(unsigned char *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  char v9 = *(unsigned char *)(a1 + 48);
  double v10 = *(double *)(a1 + 56);
  char v11 = *(unsigned char *)(a1 + 64);
  uint64_t v12 = *(void *)(a2 + 8);
  int v13 = *(unsigned __int8 *)(a2 + 16);
  int v14 = *(unsigned __int8 *)(a2 + 17);
  int v15 = *(unsigned __int8 *)(a2 + 18);
  int v16 = *(unsigned __int8 *)(a2 + 19);
  double v17 = *(double *)(a2 + 24);
  int v18 = *(unsigned __int8 *)(a2 + 32);
  uint64_t v19 = *(void *)(a2 + 40);
  int v20 = *(unsigned __int8 *)(a2 + 48);
  double v21 = *(double *)(a2 + 56);
  int v22 = *(unsigned __int8 *)(a2 + 64);
  if (!v3)
  {
    if (!v12) {
      goto LABEL_16;
    }
LABEL_38:
    OUTLINED_FUNCTION_0_31();
    return;
  }
  if (!v12) {
    goto LABEL_38;
  }
  if (*(void *)a1 == *(void *)a2 && v3 == v12)
  {
LABEL_16:
    if (v4 != v13
      || ((v5 ^ v14) & 1) != 0
      || ((*(unsigned __int8 *)(a1 + 18) ^ v15) & 1) != 0
      || ((*(unsigned __int8 *)(a1 + 19) ^ v16) & 1) != 0
      || ((*(unsigned __int8 *)(a1 + 20) ^ *(unsigned __int8 *)(a2 + 20)) & 1) != 0
      || ((*(unsigned __int8 *)(a1 + 21) ^ *(unsigned __int8 *)(a2 + 21)) & 1) != 0)
    {
      goto LABEL_38;
    }
    goto LABEL_22;
  }
  int v39 = *(unsigned __int8 *)(a2 + 32);
  int v40 = *(unsigned __int8 *)(a1 + 21);
  int v35 = *(unsigned __int8 *)(a1 + 18);
  int v36 = *(unsigned __int8 *)(a2 + 21);
  char v24 = *(unsigned char *)(a1 + 64);
  uint64_t v41 = *(void *)(a2 + 40);
  int v34 = *(unsigned __int8 *)(a2 + 20);
  uint64_t v25 = *(void *)(a1 + 40);
  int v43 = *(unsigned __int8 *)(a2 + 64);
  char v26 = *(unsigned char *)(a1 + 48);
  int v42 = *(unsigned __int8 *)(a2 + 48);
  int v37 = *(unsigned __int8 *)(a1 + 19);
  int v38 = *(unsigned __int8 *)(a1 + 20);
  char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
  int v18 = v39;
  uint64_t v19 = v41;
  int v20 = v42;
  int v22 = v43;
  if ((v27 & 1) == 0) {
    goto LABEL_38;
  }
  if ((v4 ^ v13)) {
    goto LABEL_38;
  }
  if ((v5 ^ v14)) {
    goto LABEL_38;
  }
  if ((v35 ^ v15)) {
    goto LABEL_38;
  }
  if ((v37 ^ v16)) {
    goto LABEL_38;
  }
  if ((v38 ^ v34)) {
    goto LABEL_38;
  }
  char v9 = v26;
  uint64_t v8 = v25;
  char v11 = v24;
  if ((v40 ^ v36)) {
    goto LABEL_38;
  }
LABEL_22:
  if (v7)
  {
    if (!v18) {
      goto LABEL_38;
    }
  }
  else
  {
    if (v6 == v17) {
      char v28 = v18;
    }
    else {
      char v28 = 1;
    }
    if (v28) {
      goto LABEL_38;
    }
  }
  if (v9)
  {
    if (!v20) {
      goto LABEL_38;
    }
  }
  else
  {
    if (v8 == v19) {
      char v29 = v20;
    }
    else {
      char v29 = 1;
    }
    if (v29) {
      goto LABEL_38;
    }
  }
  if (v11)
  {
    if (!v22) {
      goto LABEL_38;
    }
  }
  else
  {
    if (v10 == v21) {
      char v30 = v22;
    }
    else {
      char v30 = 1;
    }
    if (v30) {
      goto LABEL_38;
    }
  }
  OUTLINED_FUNCTION_0_31();
  specialized static Set.== infix(_:_:)(v31, v32);
}

uint64_t specialized static Set.== infix(_:_:)(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v2 = a2;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v44 = result;
  uint64_t v45 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v46 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = a2 + 56;
  if (!v6) {
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v47 = (v6 - 1) & v6;
  int64_t v48 = v3;
  for (unint64_t i = __clz(__rbit64(v6)) | (v3 << 6); ; unint64_t i = __clz(__rbit64(v10)) + (v11 << 6))
  {
    uint64_t v13 = *(void *)(result + 48) + 120 * i;
    uint64_t v14 = *(void *)v13;
    uint64_t v15 = *(void *)(v13 + 8);
    uint64_t v16 = *(void *)(v13 + 16);
    uint64_t v17 = *(void *)(v13 + 24);
    uint64_t v18 = *(void *)(v13 + 32);
    uint64_t v19 = *(void *)(v13 + 40);
    uint64_t v21 = *(void *)(v13 + 48);
    uint64_t v20 = *(void *)(v13 + 56);
    uint64_t v22 = *(void *)(v13 + 64);
    char v23 = *(unsigned char *)(v13 + 72);
    uint64_t v24 = *(void *)(v13 + 80);
    uint64_t v25 = *(void *)(v13 + 88);
    char v26 = *(unsigned char *)(v13 + 96);
    uint64_t v27 = *(void *)(v13 + 104);
    char v28 = *(unsigned char *)(v13 + 112);
    LOBYTE(v13) = *(unsigned char *)(v13 + 113);
    v60[0] = v14;
    v60[1] = v15;
    v60[2] = v16;
    v60[3] = v17;
    v60[4] = v18;
    v60[5] = v19;
    v60[6] = v21;
    v60[7] = v20;
    v60[8] = v22;
    char v61 = v23;
    uint64_t v62 = v24;
    uint64_t v63 = v25;
    char v64 = v26;
    uint64_t v65 = v27;
    char v66 = v28;
    char v67 = v13;
    *(void *)&long long v49 = v14;
    *((void *)&v49 + 1) = v15;
    *(void *)&long long v50 = v16;
    *((void *)&v50 + 1) = v17;
    *(void *)&long long v51 = v18;
    *((void *)&v51 + 1) = v19;
    *(void *)&long long v52 = v21;
    *((void *)&v52 + 1) = v20;
    uint64_t v53 = v22;
    char v54 = v23;
    *(void *)&long long v55 = v24;
    *((void *)&v55 + 1) = v25;
    char v56 = v26;
    uint64_t v57 = v27;
    char v58 = v28;
    char v59 = v13;
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    ConnectionPolicyRoute.hash(into:)();
    Swift::Int v29 = Hasher._finalize()();
    uint64_t v30 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v31 = v29 & ~v30;
    if (((*(void *)(v7 + ((v31 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v31) & 1) == 0)
    {
LABEL_32:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v32 = v2;
    uint64_t v33 = ~v30;
    uint64_t v34 = *(void *)(v2 + 48);
    while (1)
    {
      int v35 = (long long *)(v34 + 120 * v31);
      uint64_t v36 = *((void *)v35 + 8);
      char v37 = *((unsigned char *)v35 + 72);
      char v38 = *((unsigned char *)v35 + 96);
      uint64_t v39 = *((void *)v35 + 13);
      char v40 = *((unsigned char *)v35 + 112);
      char v41 = *((unsigned char *)v35 + 113);
      long long v42 = v35[1];
      long long v49 = *v35;
      long long v50 = v42;
      long long v43 = v35[3];
      long long v51 = v35[2];
      long long v52 = v43;
      uint64_t v53 = v36;
      char v54 = v37;
      long long v55 = v35[5];
      char v56 = v38;
      uint64_t v57 = v39;
      char v58 = v40;
      char v59 = v41;
      if (static ConnectionPolicyRoute.== infix(_:_:)((uint64_t)&v49, (uint64_t)v60)) {
        break;
      }
      unint64_t v31 = (v31 + 1) & v33;
      if (((*(void *)(v7 + ((v31 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v31) & 1) == 0) {
        goto LABEL_32;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = v32;
    unint64_t result = v44;
    unint64_t v6 = v47;
    int64_t v3 = v48;
    if (v47) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v9 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v9 >= v46) {
      return 1;
    }
    unint64_t v10 = *(void *)(v45 + 8 * v9);
    int64_t v11 = v3 + 1;
    if (!v10)
    {
      int64_t v11 = v9 + 1;
      if (v9 + 1 >= v46) {
        return 1;
      }
      unint64_t v10 = *(void *)(v45 + 8 * v11);
      if (!v10)
      {
        int64_t v11 = v9 + 2;
        if (v9 + 2 >= v46) {
          return 1;
        }
        unint64_t v10 = *(void *)(v45 + 8 * v11);
        if (!v10)
        {
          int64_t v11 = v9 + 3;
          if (v9 + 3 >= v46) {
            return 1;
          }
          unint64_t v10 = *(void *)(v45 + 8 * v11);
          if (!v10) {
            break;
          }
        }
      }
    }
LABEL_23:
    uint64_t v47 = (v10 - 1) & v10;
    int64_t v48 = v11;
  }
  int64_t v12 = v9 + 4;
  if (v12 >= v46) {
    return 1;
  }
  unint64_t v10 = *(void *)(v45 + 8 * v12);
  if (v10)
  {
    int64_t v11 = v12;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v11 >= v46) {
      return 1;
    }
    unint64_t v10 = *(void *)(v45 + 8 * v11);
    ++v12;
    if (v10) {
      goto LABEL_23;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

Swift::Int ConnectionPolicy.hashValue.getter()
{
  char v1 = *((unsigned char *)v0 + 16);
  char v2 = *((unsigned char *)v0 + 17);
  char v3 = *((unsigned char *)v0 + 18);
  char v4 = *((unsigned char *)v0 + 19);
  char v5 = *((unsigned char *)v0 + 20);
  char v6 = *((unsigned char *)v0 + 21);
  uint64_t v7 = *((void *)v0 + 3);
  char v8 = *((unsigned char *)v0 + 32);
  uint64_t v9 = *((void *)v0 + 5);
  char v10 = *((unsigned char *)v0 + 48);
  uint64_t v11 = *((void *)v0 + 7);
  char v12 = *((unsigned char *)v0 + 64);
  uint64_t v13 = *((void *)v0 + 9);
  long long v16 = *v0;
  char v17 = v1;
  char v18 = v2;
  char v19 = v3;
  char v20 = v4;
  char v21 = v5;
  char v22 = v6;
  uint64_t v23 = v7;
  char v24 = v8;
  uint64_t v25 = v9;
  char v26 = v10;
  uint64_t v27 = v11;
  char v28 = v12;
  uint64_t v29 = v13;
  Hasher.init(_seed:)();
  ConnectionPolicy.hash(into:)((uint64_t)v15);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ConnectionPolicy()
{
  char v1 = *((unsigned char *)v0 + 16);
  char v2 = *((unsigned char *)v0 + 17);
  char v3 = *((unsigned char *)v0 + 18);
  char v4 = *((unsigned char *)v0 + 19);
  char v5 = *((unsigned char *)v0 + 20);
  char v6 = *((unsigned char *)v0 + 21);
  uint64_t v7 = *((void *)v0 + 3);
  char v8 = *((unsigned char *)v0 + 32);
  uint64_t v9 = *((void *)v0 + 5);
  char v10 = *((unsigned char *)v0 + 48);
  uint64_t v11 = *((void *)v0 + 7);
  char v12 = *((unsigned char *)v0 + 64);
  uint64_t v13 = *((void *)v0 + 9);
  long long v16 = *v0;
  char v17 = v1;
  char v18 = v2;
  char v19 = v3;
  char v20 = v4;
  char v21 = v5;
  char v22 = v6;
  uint64_t v23 = v7;
  char v24 = v8;
  uint64_t v25 = v9;
  char v26 = v10;
  uint64_t v27 = v11;
  char v28 = v12;
  uint64_t v29 = v13;
  Hasher.init(_seed:)();
  ConnectionPolicy.hash(into:)((uint64_t)v15);
  return Hasher._finalize()();
}

void specialized Set.hash(into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = a2 + 56;
  Hasher._finalize()();
  uint64_t v3 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  uint64_t v5 = v4 & *(void *)(a2 + 56);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  Swift::UInt v7 = 0;
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_5;
  }
LABEL_4:
  for (v5 &= v5 - 1; ; uint64_t v5 = (v10 - 1) & v10)
  {
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    ConnectionPolicyRoute.hash(into:)();
    Swift::Int v12 = Hasher._finalize()();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v7 ^= v12;
    if (v5) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v8++, 1)) {
      goto LABEL_19;
    }
    if (v8 >= v6)
    {
LABEL_17:
      swift_release();
      Hasher._combine(_:)(v7);
      return;
    }
    uint64_t v10 = *(void *)(v13 + 8 * v8);
    if (!v10) {
      break;
    }
LABEL_14:
    ;
  }
  int64_t v11 = v8 + 1;
  if (v8 + 1 >= v6) {
    goto LABEL_17;
  }
  uint64_t v10 = *(void *)(v13 + 8 * v11);
  if (v10)
  {
    ++v8;
    goto LABEL_14;
  }
  while (1)
  {
    int64_t v8 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v8 >= v6) {
      goto LABEL_17;
    }
    uint64_t v10 = *(void *)(v13 + 8 * v8);
    ++v11;
    if (v10) {
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
}

unint64_t lazy protocol witness table accessor for type ConnectionPolicy and conformance ConnectionPolicy()
{
  unint64_t result = lazy protocol witness table cache variable for type ConnectionPolicy and conformance ConnectionPolicy;
  if (!lazy protocol witness table cache variable for type ConnectionPolicy and conformance ConnectionPolicy)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ConnectionPolicy and conformance ConnectionPolicy);
  }
  return result;
}

void destroy for ConnectionPreparationReport(void *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a1[6])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (a1[11] != 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v2 = (void *)a1[44];
}

uint64_t initializeWithCopy for ConnectionPreparationReport(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  uint64_t v6 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v6)
  {
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = v6;
    uint64_t v7 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = v7;
    *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
    *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
    uint64_t v8 = *(void *)(a2 + 88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v8 != 1)
    {
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(void *)(a1 + 88) = v8;
      uint64_t v12 = *(void *)(a2 + 104);
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = v12;
      *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
      uint64_t v13 = *(void *)(a2 + 152);
      *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
      *(void *)(a1 + 152) = v13;
      *(void *)(a1 + 168) = *(void *)(a2 + 168);
      *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
      *(void *)(a1 + 184) = *(void *)(a2 + 184);
      *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
      *(void *)(a1 + 200) = *(void *)(a2 + 200);
      *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
      *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
      *(void *)(a1 + 216) = *(void *)(a2 + 216);
      *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
      *(void *)(a1 + 232) = *(void *)(a2 + 232);
      *(unsigned char *)(a1 + 248) = *(unsigned char *)(a2 + 248);
      *(_DWORD *)(a1 + 244) = *(_DWORD *)(a2 + 244);
      *(unsigned char *)(a1 + 256) = *(unsigned char *)(a2 + 256);
      *(_DWORD *)(a1 + 252) = *(_DWORD *)(a2 + 252);
      *(unsigned char *)(a1 + 264) = *(unsigned char *)(a2 + 264);
      *(_DWORD *)(a1 + 260) = *(_DWORD *)(a2 + 260);
      LODWORD(v13) = *(_DWORD *)(a2 + 268);
      *(unsigned char *)(a1 + 272) = *(unsigned char *)(a2 + 272);
      *(_DWORD *)(a1 + 268) = v13;
      uint64_t v14 = *(void *)(a2 + 280);
      *(unsigned char *)(a1 + 288) = *(unsigned char *)(a2 + 288);
      *(void *)(a1 + 280) = v14;
      uint64_t v15 = *(void *)(a2 + 296);
      *(unsigned char *)(a1 + 304) = *(unsigned char *)(a2 + 304);
      *(void *)(a1 + 296) = v15;
      LODWORD(v15) = *(_DWORD *)(a2 + 308);
      *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
      *(_DWORD *)(a1 + 308) = v15;
      LODWORD(v15) = *(_DWORD *)(a2 + 316);
      *(unsigned char *)(a1 + 320) = *(unsigned char *)(a2 + 320);
      *(_DWORD *)(a1 + 316) = v15;
      LODWORD(v15) = *(_DWORD *)(a2 + 324);
      *(unsigned char *)(a1 + 328) = *(unsigned char *)(a2 + 328);
      *(_DWORD *)(a1 + 324) = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_7;
    }
    uint64_t v9 = (void *)(a1 + 80);
    uint64_t v10 = (const void *)(a2 + 80);
    size_t v11 = 249;
  }
  else
  {
    uint64_t v9 = (void *)(a1 + 40);
    uint64_t v10 = (const void *)(a2 + 40);
    size_t v11 = 289;
  }
  memcpy(v9, v10, v11);
LABEL_7:
  uint64_t v16 = *(void *)(a2 + 344);
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  *(void *)(a1 + 344) = v16;
  char v17 = *(void **)(a2 + 352);
  *(void *)(a1 + 352) = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v18 = v17;
  return a1;
}

uint64_t assignWithCopy for ConnectionPreparationReport(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  *(unsigned char *)(a1 + 35) = *(unsigned char *)(a2 + 35);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  uint64_t v4 = *(void *)(a2 + 48);
  if (!*(void *)(a1 + 48))
  {
    if (v4)
    {
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
      *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
      uint64_t v6 = *(void *)(a2 + 88);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v6 == 1)
      {
        uint64_t v7 = (void *)(a1 + 80);
        uint64_t v8 = (const void *)(a2 + 80);
LABEL_15:
        size_t v9 = 249;
        goto LABEL_16;
      }
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v7 = (void *)(a1 + 40);
    uint64_t v8 = (const void *)(a2 + 40);
    size_t v9 = 289;
LABEL_16:
    memcpy(v7, v8, v9);
    goto LABEL_17;
  }
  if (!v4)
  {
    outlined destroy of ConnectionInterfaceReport(a1 + 40);
    goto LABEL_10;
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  uint64_t v5 = *(void *)(a2 + 88);
  if (*(void *)(a1 + 88) != 1)
  {
    if (v5 != 1)
    {
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
      uint64_t v24 = *(void *)(a2 + 120);
      *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
      *(void *)(a1 + 120) = v24;
      uint64_t v25 = *(void *)(a2 + 136);
      *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
      *(void *)(a1 + 136) = v25;
      uint64_t v26 = *(void *)(a2 + 152);
      *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
      *(void *)(a1 + 152) = v26;
      uint64_t v27 = *(void *)(a2 + 168);
      *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
      *(void *)(a1 + 168) = v27;
      uint64_t v28 = *(void *)(a2 + 184);
      *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
      *(void *)(a1 + 184) = v28;
      uint64_t v29 = *(void *)(a2 + 200);
      *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
      *(void *)(a1 + 200) = v29;
      uint64_t v30 = *(void *)(a2 + 216);
      *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
      *(void *)(a1 + 216) = v30;
      uint64_t v31 = *(void *)(a2 + 232);
      *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
      *(void *)(a1 + 232) = v31;
      LODWORD(v31) = *(_DWORD *)(a2 + 244);
      *(unsigned char *)(a1 + 248) = *(unsigned char *)(a2 + 248);
      *(_DWORD *)(a1 + 244) = v31;
      LODWORD(v31) = *(_DWORD *)(a2 + 252);
      *(unsigned char *)(a1 + 256) = *(unsigned char *)(a2 + 256);
      *(_DWORD *)(a1 + 252) = v31;
      LODWORD(v31) = *(_DWORD *)(a2 + 260);
      *(unsigned char *)(a1 + 264) = *(unsigned char *)(a2 + 264);
      *(_DWORD *)(a1 + 260) = v31;
      LODWORD(v31) = *(_DWORD *)(a2 + 268);
      *(unsigned char *)(a1 + 272) = *(unsigned char *)(a2 + 272);
      *(_DWORD *)(a1 + 268) = v31;
      uint64_t v32 = *(void *)(a2 + 280);
      *(unsigned char *)(a1 + 288) = *(unsigned char *)(a2 + 288);
      *(void *)(a1 + 280) = v32;
      uint64_t v33 = *(void *)(a2 + 296);
      *(unsigned char *)(a1 + 304) = *(unsigned char *)(a2 + 304);
      *(void *)(a1 + 296) = v33;
      LODWORD(v33) = *(_DWORD *)(a2 + 308);
      *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
      *(_DWORD *)(a1 + 308) = v33;
      LODWORD(v33) = *(_DWORD *)(a2 + 316);
      *(unsigned char *)(a1 + 320) = *(unsigned char *)(a2 + 320);
      *(_DWORD *)(a1 + 316) = v33;
      LODWORD(v33) = *(_DWORD *)(a2 + 324);
      *(unsigned char *)(a1 + 328) = *(unsigned char *)(a2 + 328);
      *(_DWORD *)(a1 + 324) = v33;
      goto LABEL_17;
    }
    outlined destroy of ConnectionTCPInfoMetrics(a1 + 80);
    goto LABEL_14;
  }
  if (v5 == 1)
  {
LABEL_14:
    uint64_t v7 = (void *)(a1 + 80);
    uint64_t v8 = (const void *)(a2 + 80);
    goto LABEL_15;
  }
LABEL_11:
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  uint64_t v10 = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 120) = v10;
  uint64_t v11 = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 136) = v11;
  uint64_t v12 = *(void *)(a2 + 152);
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(void *)(a1 + 152) = v12;
  uint64_t v13 = *(void *)(a2 + 168);
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  *(void *)(a1 + 168) = v13;
  uint64_t v14 = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(void *)(a1 + 184) = v14;
  uint64_t v15 = *(void *)(a2 + 200);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(void *)(a1 + 200) = v15;
  uint64_t v16 = *(void *)(a2 + 216);
  *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
  *(void *)(a1 + 216) = v16;
  uint64_t v17 = *(void *)(a2 + 232);
  *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
  *(void *)(a1 + 232) = v17;
  LODWORD(v17) = *(_DWORD *)(a2 + 244);
  *(unsigned char *)(a1 + 248) = *(unsigned char *)(a2 + 248);
  *(_DWORD *)(a1 + 244) = v17;
  LODWORD(v17) = *(_DWORD *)(a2 + 252);
  *(unsigned char *)(a1 + 256) = *(unsigned char *)(a2 + 256);
  *(_DWORD *)(a1 + 252) = v17;
  LODWORD(v17) = *(_DWORD *)(a2 + 260);
  *(unsigned char *)(a1 + 264) = *(unsigned char *)(a2 + 264);
  *(_DWORD *)(a1 + 260) = v17;
  LODWORD(v17) = *(_DWORD *)(a2 + 268);
  *(unsigned char *)(a1 + 272) = *(unsigned char *)(a2 + 272);
  *(_DWORD *)(a1 + 268) = v17;
  uint64_t v18 = *(void *)(a2 + 280);
  *(unsigned char *)(a1 + 288) = *(unsigned char *)(a2 + 288);
  *(void *)(a1 + 280) = v18;
  uint64_t v19 = *(void *)(a2 + 296);
  *(unsigned char *)(a1 + 304) = *(unsigned char *)(a2 + 304);
  *(void *)(a1 + 296) = v19;
  LODWORD(v19) = *(_DWORD *)(a2 + 308);
  *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
  *(_DWORD *)(a1 + 308) = v19;
  LODWORD(v19) = *(_DWORD *)(a2 + 316);
  *(unsigned char *)(a1 + 320) = *(unsigned char *)(a2 + 320);
  *(_DWORD *)(a1 + 316) = v19;
  LODWORD(v19) = *(_DWORD *)(a2 + 324);
  *(unsigned char *)(a1 + 328) = *(unsigned char *)(a2 + 328);
  *(_DWORD *)(a1 + 324) = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
LABEL_17:
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 344) = *(void *)(a2 + 344);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  char v20 = *(void **)(a2 + 352);
  char v21 = *(void **)(a1 + 352);
  *(void *)(a1 + 352) = v20;
  id v22 = v20;

  return a1;
}

void *__swift_memcpy360_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x168uLL);
}

uint64_t assignWithTake for ConnectionPreparationReport(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  *(unsigned char *)(a1 + 35) = *(unsigned char *)(a2 + 35);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  if (!*(void *)(a1 + 48)) {
    goto LABEL_8;
  }
  uint64_t v6 = *(void *)(a2 + 48);
  if (!v6)
  {
    outlined destroy of ConnectionInterfaceReport(a1 + 40);
LABEL_8:
    size_t v9 = (void *)(a1 + 40);
    uint64_t v10 = (const void *)(a2 + 40);
    size_t v11 = 289;
    goto LABEL_9;
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  if (*(void *)(a1 + 88) != 1)
  {
    uint64_t v8 = *(void *)(a2 + 88);
    if (v8 != 1)
    {
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(void *)(a1 + 88) = v8;
      swift_bridgeObjectRelease();
      uint64_t v14 = *(void *)(a2 + 104);
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = v14;
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
      *(void *)(a1 + 152) = *(void *)(a2 + 152);
      *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
      *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
      *(void *)(a1 + 168) = *(void *)(a2 + 168);
      uint64_t v15 = *(void *)(a2 + 184);
      *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
      *(void *)(a1 + 184) = v15;
      *(void *)(a1 + 200) = *(void *)(a2 + 200);
      *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
      *(void *)(a1 + 216) = *(void *)(a2 + 216);
      *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
      *(void *)(a1 + 232) = *(void *)(a2 + 232);
      *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
      *(unsigned char *)(a1 + 248) = *(unsigned char *)(a2 + 248);
      *(_DWORD *)(a1 + 244) = *(_DWORD *)(a2 + 244);
      *(unsigned char *)(a1 + 256) = *(unsigned char *)(a2 + 256);
      *(_DWORD *)(a1 + 252) = *(_DWORD *)(a2 + 252);
      *(unsigned char *)(a1 + 264) = *(unsigned char *)(a2 + 264);
      *(_DWORD *)(a1 + 260) = *(_DWORD *)(a2 + 260);
      *(unsigned char *)(a1 + 272) = *(unsigned char *)(a2 + 272);
      *(_DWORD *)(a1 + 268) = *(_DWORD *)(a2 + 268);
      *(unsigned char *)(a1 + 288) = *(unsigned char *)(a2 + 288);
      *(void *)(a1 + 280) = *(void *)(a2 + 280);
      uint64_t v16 = *(void *)(a2 + 296);
      *(unsigned char *)(a1 + 304) = *(unsigned char *)(a2 + 304);
      *(void *)(a1 + 296) = v16;
      LODWORD(v16) = *(_DWORD *)(a2 + 308);
      *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
      *(_DWORD *)(a1 + 308) = v16;
      LODWORD(v16) = *(_DWORD *)(a2 + 316);
      *(unsigned char *)(a1 + 320) = *(unsigned char *)(a2 + 320);
      *(_DWORD *)(a1 + 316) = v16;
      LODWORD(v16) = *(_DWORD *)(a2 + 324);
      *(unsigned char *)(a1 + 328) = *(unsigned char *)(a2 + 328);
      *(_DWORD *)(a1 + 324) = v16;
      goto LABEL_10;
    }
    outlined destroy of ConnectionTCPInfoMetrics(a1 + 80);
  }
  size_t v9 = (void *)(a1 + 80);
  uint64_t v10 = (const void *)(a2 + 80);
  size_t v11 = 249;
LABEL_9:
  memcpy(v9, v10, v11);
LABEL_10:
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 344) = *(void *)(a2 + 344);
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void **)(a1 + 352);
  *(void *)(a1 + 352) = *(void *)(a2 + 352);

  return a1;
}

uint64_t getEnumTagSinglePayload for ConnectionPreparationReport(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 360))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 336);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ConnectionPreparationReport(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 360) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 336) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 360) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConnectionPreparationReport()
{
  return &type metadata for ConnectionPreparationReport;
}

uint64_t ConnectionPreparationReport.debugDescription.getter()
{
  uint64_t v1 = 0x6E776F6E6B6E75;
  uint64_t v2 = *(void *)v0;
  uint64_t v3 = *(void **)(v0 + 8);
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v4 = *(void **)(v0 + 24);
  int v6 = *(unsigned __int8 *)(v0 + 32);
  int v7 = *(unsigned __int8 *)(v0 + 33);
  int v58 = *(unsigned __int8 *)(v0 + 34);
  int v56 = *(unsigned __int8 *)(v0 + 35);
  int v53 = *(unsigned __int8 *)(v0 + 36);
  outlined init with take of ConnectionInterfaceReport?(v0 + 40, (uint64_t)v71);
  uint64_t v67 = 0;
  unint64_t v68 = 0xE000000000000000;
  _StringGuts.grow(_:)(17);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_24(0x697463656E6E6F63uLL);
  if (v3) {
    uint64_t v8 = v2;
  }
  else {
    uint64_t v8 = 0x6E776F6E6B6E75;
  }
  size_t v9 = (void *)0xE700000000000000;
  if (v3) {
    uint64_t v10 = v3;
  }
  else {
    uint64_t v10 = (void *)0xE700000000000000;
  }
  swift_bridgeObjectRetain();
  v11._uint64_t countAndFlagsBits = v8;
  v11._object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_31();
  v62._uint64_t countAndFlagsBits = v13;
  v62._object = v12;
  OUTLINED_FUNCTION_3_24(0x7461745368746170uLL);
  if (v4) {
    uint64_t v14 = v5;
  }
  else {
    uint64_t v14 = 0x6E776F6E6B6E75;
  }
  if (v4) {
    uint64_t v15 = v4;
  }
  else {
    uint64_t v15 = (void *)0xE700000000000000;
  }
  swift_bridgeObjectRetain();
  v16._uint64_t countAndFlagsBits = v14;
  v16._object = v15;
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_31();
  v61._uint64_t countAndFlagsBits = v18;
  v61._object = v17;
  uint64_t v67 = 0x20534E44736168;
  unint64_t v68 = 0xE700000000000000;
  if (v6) {
    uint64_t v19 = 1702195828;
  }
  else {
    uint64_t v19 = 0x65736C6166;
  }
  OUTLINED_FUNCTION_2_24(v19);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_31();
  v60._uint64_t countAndFlagsBits = v21;
  v60._object = v20;
  OUTLINED_FUNCTION_3_24(0x736E657078457369uLL);
  if (v7) {
    uint64_t v22 = 1702195828;
  }
  else {
    uint64_t v22 = 0x65736C6166;
  }
  OUTLINED_FUNCTION_2_24(v22);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_31();
  v59._uint64_t countAndFlagsBits = v24;
  v59._object = v23;
  uint64_t v67 = 0;
  unint64_t v68 = 0xE000000000000000;
  _StringGuts.grow(_:)(16);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_24(0x7274736E6F437369uLL);
  if (v58) {
    uint64_t v25 = 1702195828;
  }
  else {
    uint64_t v25 = 0x65736C6166;
  }
  OUTLINED_FUNCTION_2_24(v25);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_31();
  v57._uint64_t countAndFlagsBits = v27;
  v57._object = v26;
  uint64_t v67 = 0x2034767049736168;
  unint64_t v68 = 0xE800000000000000;
  if (v56) {
    uint64_t v28 = 1702195828;
  }
  else {
    uint64_t v28 = 0x65736C6166;
  }
  OUTLINED_FUNCTION_2_24(v28);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_31();
  v55._uint64_t countAndFlagsBits = v30;
  v55._object = v29;
  uint64_t v69 = 0x2036767049736168;
  unint64_t v70 = 0xE800000000000000;
  if (v53) {
    uint64_t v31 = 1702195828;
  }
  else {
    uint64_t v31 = 0x65736C6166;
  }
  if (v53) {
    unint64_t v32 = 0xE400000000000000;
  }
  else {
    unint64_t v32 = 0xE500000000000000;
  }
  unint64_t v33 = v32;
  String.append(_:)(*(Swift::String *)&v31);
  swift_bridgeObjectRelease();
  uint64_t v34 = v69;
  int v35 = (void *)v70;
  uint64_t v67 = 0;
  unint64_t v68 = 0xE000000000000000;
  _StringGuts.grow(_:)(19);
  swift_bridgeObjectRelease();
  unint64_t v65 = 0xD000000000000011;
  unint64_t v66 = 0x800000025D795660;
  outlined init with take of ConnectionInterfaceReport?((uint64_t)v71, (uint64_t)&v67);
  if (_s11SiriNetwork25ConnectionInterfaceReportVSgWOg((uint64_t)&v67) != 1)
  {
    outlined init with take of ConnectionInterfaceReport?((uint64_t)v71, (uint64_t)__src);
    memcpy(__dst, __src, sizeof(__dst));
    outlined retain of ConnectionInterfaceReport((uint64_t)__src);
    uint64_t v1 = String.init<A>(describing:)();
    size_t v9 = v36;
  }
  v37._uint64_t countAndFlagsBits = v1;
  v37._object = v9;
  String.append(_:)(v37);
  swift_bridgeObjectRelease();
  uint64_t v54 = v65;
  char v38 = (void *)v66;
  __src[0] = 0;
  __src[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(17);
  swift_bridgeObjectRelease();
  __src[0] = 0x65746E4968746170;
  __src[1] = 0xEF20736563616672;
  uint64_t v39 = swift_bridgeObjectRetain();
  v40._uint64_t countAndFlagsBits = MEMORY[0x2611B2390](v39, &type metadata for ConnectionInterfaceReport);
  String.append(_:)(v40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v41 = __src[0];
  long long v42 = (void *)__src[1];
  strcpy((char *)__src, "pathGateways ");
  HIWORD(__src[1]) = -4864;
  uint64_t v43 = swift_bridgeObjectRetain();
  v44._uint64_t countAndFlagsBits = MEMORY[0x2611B2390](v43, &type metadata for ConnectionEndpointReport);
  String.append(_:)(v44);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v46 = __src[0];
  uint64_t v45 = (void *)__src[1];
  __src[0] = 0;
  __src[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(84);
  v47._uint64_t countAndFlagsBits = 0xD00000000000002ELL;
  v47._object = (void *)0x800000025D797030;
  String.append(_:)(v47);
  String.append(_:)(v61);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_32();
  String.append(_:)(v60);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_32();
  String.append(_:)(v59);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_32();
  String.append(_:)(v57);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_32();
  String.append(_:)(v55);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_32();
  v48._uint64_t countAndFlagsBits = v34;
  v48._object = v35;
  String.append(_:)(v48);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_32();
  v49._uint64_t countAndFlagsBits = v54;
  v49._object = v38;
  String.append(_:)(v49);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_32();
  v50._uint64_t countAndFlagsBits = v41;
  v50._object = v42;
  String.append(_:)(v50);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_32();
  v51._uint64_t countAndFlagsBits = v46;
  v51._object = v45;
  String.append(_:)(v51);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_32();
  String.append(_:)(v62);
  swift_bridgeObjectRelease();
  return __src[0];
}

uint64_t outlined init with take of ConnectionInterfaceReport?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void OUTLINED_FUNCTION_0_32()
{
  uint64_t v1 = 8236;
  unint64_t v2 = 0xE200000000000000;
  String.append(_:)(*(Swift::String *)&v1);
}

void OUTLINED_FUNCTION_2_24(uint64_t a1)
{
  uint64_t v3 = v1;
  String.append(_:)(*(Swift::String *)&a1);
}

void OUTLINED_FUNCTION_3_24(unint64_t a1@<X8>)
{
  STACK[0x2D8] = a1;
  STACK[0x2E0] = v1;
}

uint64_t Data.init(copying:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DispatchData?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = type metadata accessor for DispatchData();
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2();
  outlined init with copy of DispatchData?(a1, (uint64_t)v5);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
    outlined destroy of DispatchData?(a1);
    outlined destroy of DispatchData?((uint64_t)v5);
    return 0;
  }
  else
  {
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v8 + 32))(v1, v5, v6);
    uint64_t v11 = DispatchData.count.getter();
    uint64_t v14 = MEMORY[0x2611B18E0](v11);
    uint64_t v15 = v12;
    MEMORY[0x270FA5388](v14);
    *(void *)&v13[-16] = v1;
    specialized Data._Representation.withUnsafeMutableBytes<A>(_:)((void *(*)(uint64_t *__return_ptr, char *, char *))partial apply for closure #1 in Data.init(copying:));
    outlined destroy of DispatchData?(a1);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v6);
    return v14;
  }
}

const __CFData *Data.init(fromCFData:)(const __CFData *result)
{
  if (result)
  {
    CFDataRef v1 = result;
    if (CFDataGetBytePtr(result))
    {
      CFDataGetLength(v1);
      Data.append(_:count:)();
    }

    return 0;
  }
  return result;
}

uint64_t closure #1 in Data.init(copying:)@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for DispatchData();
  lazy protocol witness table accessor for type DispatchData and conformance DispatchData();
  uint64_t result = DataProtocol.copyBytes(to:)();
  *a1 = result;
  return result;
}

uint64_t Data.init(instance:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DispatchData?);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v20 - v7;
  uint64_t v9 = type metadata accessor for DispatchData();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_2();
  outlined init with copy of Any((uint64_t)a1, (uint64_t)v23);
  if (swift_dynamicCast()) {
    goto LABEL_2;
  }
  outlined init with copy of Any((uint64_t)a1, (uint64_t)v23);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v9);
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v1, v8, v9);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v6, v1, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v9);
    uint64_t v13 = Data.init(copying:)((uint64_t)v6);
    unint64_t v15 = v14;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v9);
    if (v15 >> 60 != 15) {
      goto LABEL_3;
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v9);
    outlined destroy of DispatchData?((uint64_t)v8);
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  Swift::String v16 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  CFTypeID v17 = CFGetTypeID(v16);
  swift_unknownObjectRelease();
  if (v17 != CFDataGetTypeID())
  {
LABEL_12:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    return 0;
  }
  outlined init with copy of Any((uint64_t)a1, (uint64_t)v23);
  type metadata accessor for CFDataRef(0);
  swift_dynamicCast();
  CFDataRef v18 = v21;
  if (!CFDataGetBytePtr(v21))
  {

    goto LABEL_12;
  }
  long long v22 = xmmword_25D7906C0;
  CFDataGetLength(v18);
  Data.append(_:count:)();

LABEL_2:
  uint64_t v13 = v22;
LABEL_3:
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v13;
}

uint64_t outlined destroy of DispatchData?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DispatchData?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of DispatchData?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DispatchData?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in Data.init(copying:)@<X0>(uint64_t *a1@<X8>)
{
  return closure #1 in Data.init(copying:)(a1);
}

char *specialized Data._Representation.withUnsafeMutableBytes<A>(_:)(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_25D7906C0;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_14;
      }
      if (v11 < (int)v4) {
        goto LABEL_19;
      }
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v4, __DataStorage._offset.getter())) {
        goto LABEL_20;
      }
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v13 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_14:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
      }
      uint64_t result = specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      *uint64_t v5 = v4;
LABEL_16:
      v5[1] = v12;
      return result;
    case 2uLL:
      *(void *)&long long v14 = *v1;
      *((void *)&v14 + 1) = v3 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      uint64_t result = specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = *((void *)&v14 + 1) | 0x8000000000000000;
      *uint64_t v1 = v14;
      goto LABEL_16;
    case 3uLL:
      *(void *)((char *)&v14 + 7) = 0;
      *(void *)&long long v14 = 0;
      uint64_t result = (char *)a1(v15, (char *)&v14, (char *)&v14);
      if (!v2) {
        return (char *)v15[0];
      }
      return result;
    default:
      *(void *)&long long v14 = *v1;
      WORD4(v14) = v3;
      BYTE10(v14) = BYTE2(v3);
      BYTE11(v14) = BYTE3(v3);
      BYTE12(v14) = BYTE4(v3);
      BYTE13(v14) = BYTE5(v3);
      BYTE14(v14) = BYTE6(v3);
      uint64_t result = (char *)a1(v15, (char *)&v14, (char *)&v15[-2] + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v15[0];
      }
      unint64_t v8 = DWORD2(v14) | ((unint64_t)BYTE12(v14) << 32) | ((unint64_t)BYTE13(v14) << 40) | ((unint64_t)BYTE14(v14) << 48);
      *uint64_t v1 = v14;
      v1[1] = v8;
      return result;
  }
}

char *specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)__DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_12;
  }
  unint64_t v8 = result;
  uint64_t result = (char *)__DataStorage._offset.getter();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = __DataStorage._length.getter();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type DispatchData and conformance DispatchData()
{
  unint64_t result = lazy protocol witness table cache variable for type DispatchData and conformance DispatchData;
  if (!lazy protocol witness table cache variable for type DispatchData and conformance DispatchData)
  {
    type metadata accessor for DispatchData();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchData and conformance DispatchData);
  }
  return result;
}

id ConnectionMetrics.snConnectionMetrics.getter()
{
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  outlined init with take of ConnectionSnapshotReport?(v0 + 568, (uint64_t)v232, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
  uint64_t v5 = *(void *)(v0 + 1296);
  uint64_t v137 = *(void *)(v0 + 1288);
  uint64_t v141 = *(void *)(v0 + 1304);
  uint64_t v6 = *(void *)(v0 + 1312);
  uint64_t v125 = *(void *)(v0 + 1320);
  double v7 = *(double *)(v0 + 1336);
  LODWORD(v149) = *(unsigned __int8 *)(v0 + 1328);
  HIDWORD(v149) = *(unsigned __int8 *)(v0 + 1344);
  double v8 = *(double *)(v0 + 1352);
  uint64_t v9 = *(void *)(v0 + 1376);
  HIDWORD(v121) = *(_DWORD *)(v0 + 1384);
  HIDWORD(v145) = *(unsigned __int8 *)(v0 + 1388);
  double v10 = *(double *)(v0 + 1392);
  LODWORD(v153) = *(unsigned __int8 *)(v0 + 1360);
  HIDWORD(v153) = *(unsigned __int8 *)(v0 + 1400);
  double v11 = *(double *)(v0 + 1408);
  uint64_t v129 = *(void *)(v0 + 1424);
  uint64_t v133 = *(void *)(v0 + 1368);
  LODWORD(v157) = *(unsigned __int8 *)(v0 + 1416);
  HIDWORD(v157) = *(unsigned __int8 *)(v0 + 1432);
  id v12 = objc_msgSend(objc_allocWithZone((Class)SNConnectionMetrics), sel_init);
  if (*(void *)(v3 + 16))
  {
    uint64_t v13 = memcpy(__dst, (const void *)(v3 + 32), 0x599uLL);
    uint64_t v14 = (void *)ConnectionMetrics.snConnectionMetrics.getter(v13);
    OUTLINED_FUNCTION_4_16((uint64_t)v14, sel_setRemoteMetrics_);
  }
  if (v2[2])
  {
    specialized _arrayForceCast<A, B>(_:)((uint64_t)v2);
    Array._bridgeToObjectiveC()();
    uint64_t v15 = OUTLINED_FUNCTION_3_25();
    OUTLINED_FUNCTION_2_25(v15, sel_setConnectionMethodHistory_);
  }
  if (v4)
  {
    Swift::String v16 = (void *)MEMORY[0x2611B2220](v1, v4);
    OUTLINED_FUNCTION_4_16((uint64_t)v16, sel_setPolicyId_);
  }
  outlined init with take of ConnectionSnapshotReport?((uint64_t)v232, (uint64_t)__dst, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
  uint64_t v17 = _s11SiriNetwork24ConnectionSnapshotReportVSgWOg((uint64_t)__dst);
  uint64_t v25 = (SEL *)&selRef_logNetworkConnectionStateReadySnapshotCaptured_;
  if (v17 == 1)
  {
LABEL_63:
    if (!v9) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
  OUTLINED_FUNCTION_1_32(v17, v18, v19, v20, v21, v22, v23, v24, v116, v121, v125, v129, v133, v137, v141, v145, v149, v153, v157,
    v161,
    v162,
    v163,
    v164,
    v165,
    v166,
    v167,
    v168,
    v169,
    v170,
    v171,
    v172,
    v173,
    v174,
    v175,
    v176,
    v177,
    v178,
    v179,
    v180,
    v181,
    v182,
    v183,
    v184,
    v185,
    v186,
    v187,
    v188,
    v189,
    v190,
    v191,
    v192,
    v193,
    v194,
    v195,
    v196,
    v197,
    v198,
    v199,
    v200,
    v201[0]);
  outlined retain of ConnectionSnapshotReport((uint64_t)__dst);
  id v26 = ConnectionSnapshotReport.netConnectionSnapshot.getter();
  OUTLINED_FUNCTION_4_16((uint64_t)v26, sel_setConnectionSnapshot_);

  OUTLINED_FUNCTION_1_32(v27, v28, v29, v30, v31, v32, v33, v34, v117, v122, v126, v130, v134, v138, v142, v146, v150, v154, v158,
    v161,
    v162,
    v163,
    v164,
    v165,
    v166,
    v167,
    v168,
    v169,
    v170,
    v171,
    v172,
    v173,
    v174,
    v175,
    v176,
    v177,
    v178,
    v179,
    v180,
    v181,
    v182,
    v183,
    v184,
    v185,
    v186,
    v187,
    v188,
    v189,
    v190,
    v191,
    v192,
    v193,
    v194,
    v195,
    v196,
    v197,
    v198,
    v199,
    v200,
    v201[0]);
  id v35 = ConnectionSnapshotReport.netDebugConnectionSnapshot.getter();
  OUTLINED_FUNCTION_4_16((uint64_t)v35, sel_setDebugConnectionSnapshot_);

  uint64_t v36 = (void *)MEMORY[0x2611B2220](__dst[1], __dst[2]);
  OUTLINED_FUNCTION_4_16((uint64_t)v36, sel_setProviderStyle_);

  Swift::String v37 = (void *)MEMORY[0x2611B2220](__dst[3], __dst[4]);
  OUTLINED_FUNCTION_4_16((uint64_t)v37, sel_setSnapshotTriggerReason_);

  outlined init with take of ConnectionSnapshotReport?((uint64_t)&__dst[5], (uint64_t)&v202, (uint64_t *)&demangling cache variable for type metadata for ConnectionNetworkReport?);
  uint64_t v38 = _s11SiriNetwork010ConnectionB6ReportVSgWOg((uint64_t)&v202);
  if (v38 != 1)
  {
    if (v205)
    {
      uint64_t v46 = v204;
      _s11SiriNetwork010ConnectionB6ReportVSgWOsTm_0((uint64_t)&__dst[5], (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))outlined copy of ConnectionNetworkReport?);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_6_16();
      uint64_t v47 = OUTLINED_FUNCTION_3_25();
      OUTLINED_FUNCTION_2_25(v47, sel_setCarrierName_);
    }
    else
    {
      outlined init with take of ConnectionSnapshotReport?((uint64_t)&__dst[5], (uint64_t)v201, (uint64_t *)&demangling cache variable for type metadata for ConnectionNetworkReport?);
      outlined retain of ConnectionNetworkReport((uint64_t)v201);
    }
    if (v216)
    {
      Swift::String v48 = v215;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_6_16();
      uint64_t v49 = OUTLINED_FUNCTION_3_25();
      OUTLINED_FUNCTION_2_25(v49, sel_setConnectionMethod_);
    }
    if (v210)
    {
      Swift::String v50 = v209;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_6_16();
      uint64_t v51 = OUTLINED_FUNCTION_3_25();
      OUTLINED_FUNCTION_2_25(v51, sel_setPrimarySubflowInterfaceName_);
    }
    id v52 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v227);
    OUTLINED_FUNCTION_4_16((uint64_t)v52, sel_setIsCaptive_);

    if ((v228 & 1) == 0)
    {
      id v53 = OUTLINED_FUNCTION_4_19(objc_allocWithZone(NSNumber));
      OUTLINED_FUNCTION_4_16((uint64_t)v53, sel_setRssi_);
    }
    if ((v229 & 1) == 0)
    {
      id v54 = OUTLINED_FUNCTION_4_19(objc_allocWithZone(NSNumber));
      OUTLINED_FUNCTION_4_16((uint64_t)v54, sel_setSnr_);
    }
    if ((v230 & 1) == 0)
    {
      id v55 = OUTLINED_FUNCTION_4_19(objc_allocWithZone(NSNumber));
      OUTLINED_FUNCTION_4_16((uint64_t)v55, sel_setCca_);
    }
    if ((v203 & 1) == 0)
    {
      id v56 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, v202);
      OUTLINED_FUNCTION_4_16((uint64_t)v56, sel_setAttemptCount_);
    }
    if ((v226 & 1) == 0)
    {
      id v57 = OUTLINED_FUNCTION_4_19(objc_allocWithZone(NSNumber));
      OUTLINED_FUNCTION_4_16((uint64_t)v57, sel_setTimeUntilFirstByteRead_);
    }
    if ((v217 & 1) == 0)
    {
      id v58 = OUTLINED_FUNCTION_5_19(objc_allocWithZone(NSNumber));
      OUTLINED_FUNCTION_4_16((uint64_t)v58, sel_setDnsResolutionTime_);
    }
    if ((v218 & 1) == 0)
    {
      id v59 = OUTLINED_FUNCTION_5_19(objc_allocWithZone(NSNumber));
      OUTLINED_FUNCTION_4_16((uint64_t)v59, sel_setConnectionStartTimeToDNSResolutionTimeMsec_);
    }
    if (v224)
    {
      Swift::String v60 = v223;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_6_16();
      uint64_t v61 = OUTLINED_FUNCTION_3_25();
      OUTLINED_FUNCTION_2_25(v61, sel_setTlsVersion_);
    }
    if ((v222 & 1) == 0)
    {
      id v62 = OUTLINED_FUNCTION_5_19(objc_allocWithZone(NSNumber));
      OUTLINED_FUNCTION_4_16((uint64_t)v62, sel_setTlsHandshakeTimeMsec_);
    }
    if ((v219 & 1) == 0)
    {
      id v63 = OUTLINED_FUNCTION_5_19(objc_allocWithZone(NSNumber));
      OUTLINED_FUNCTION_4_16((uint64_t)v63, sel_setConnectionEstablishmentTimeMsec_);
    }
    if ((v220 & 1) == 0)
    {
      id v64 = OUTLINED_FUNCTION_5_19(objc_allocWithZone(NSNumber));
      OUTLINED_FUNCTION_4_16((uint64_t)v64, sel_setConnectionStartTimeToConnectionEstablishmentTimeMsec_);
    }
    if ((v221 & 1) == 0)
    {
      id v65 = OUTLINED_FUNCTION_5_19(objc_allocWithZone(NSNumber));
      OUTLINED_FUNCTION_4_16((uint64_t)v65, sel_setConnectionStartTimeToTLSHandshakeTimeMsec_);
    }
    if (v208)
    {
      unint64_t v66 = v207;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_6_16();
      uint64_t v67 = OUTLINED_FUNCTION_3_25();
      OUTLINED_FUNCTION_2_25(v67, sel_setWifiPhyMode_);
    }
    if ((v206 & 1) == 0)
    {
      id v68 = OUTLINED_FUNCTION_4_19(objc_allocWithZone(NSNumber));
      OUTLINED_FUNCTION_4_16((uint64_t)v68, sel_setSignalStrengthBars_);
    }
    if ((v225 & 1) == 0)
    {
      id v69 = OUTLINED_FUNCTION_4_19(objc_allocWithZone(NSNumber));
      OUTLINED_FUNCTION_4_16((uint64_t)v69, sel_setTimeUntilOpen_);
    }
    uint64_t v25 = (SEL *)&selRef_logNetworkConnectionStateReadySnapshotCaptured_;
    if ((v212 & 1) == 0)
    {
      id v70 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, v211);
      OUTLINED_FUNCTION_4_16((uint64_t)v70, sel_setConnectedSubflowCount_);
    }
    uint64_t v38 = _s11SiriNetwork010ConnectionB6ReportVSgWOsTm_0((uint64_t)&__dst[5], (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))outlined consume of ConnectionNetworkReport?);
    if ((v214 & 1) == 0)
    {
      id v71 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, v213);
      OUTLINED_FUNCTION_4_16((uint64_t)v71, sel_setConnectedSubflowCount_);
    }
  }
  OUTLINED_FUNCTION_1_32(v38, v39, v40, v41, v42, v43, v44, v45, v118, v123, v127, v131, v135, v139, v143, v147, v151, v155, v159,
    v161,
    v162,
    v163,
    v164,
    v165,
    v166,
    v167,
    v168,
    v169,
    v170,
    v171,
    v172,
    v173,
    v174,
    v175,
    v176,
    v177,
    v178,
    v179,
    v180,
    v181,
    v182,
    v183,
    v184,
    v185,
    v186,
    v187,
    v188,
    v189,
    v190,
    v191,
    v192,
    v193,
    v194,
    v195,
    v196,
    v197,
    v198,
    v199,
    v200,
    v201[0]);
  uint64_t v72 = ConnectionSnapshotReport.flowNetworkInterfaceType.getter()[2];
  uint64_t v73 = swift_bridgeObjectRelease();
  if (v72)
  {
    OUTLINED_FUNCTION_1_32(v73, v74, v75, v76, v77, v78, v79, v80, v119, v124, v128, v132, v136, v140, v144, v148, v152, v156, v160,
      v161,
      v162,
      v163,
      v164,
      v165,
      v166,
      v167,
      v168,
      v169,
      v170,
      v171,
      v172,
      v173,
      v174,
      v175,
      v176,
      v177,
      v178,
      v179,
      v180,
      v181,
      v182,
      v183,
      v184,
      v185,
      v186,
      v187,
      v188,
      v189,
      v190,
      v191,
      v192,
      v193,
      v194,
      v195,
      v196,
      v197,
      v198,
      v199,
      v200,
      v201[0]);
    char v81 = ConnectionSnapshotReport.flowNetworkInterfaceType.getter();
    specialized _dictionaryUpCast<A, B, C, D>(_:)((uint64_t)v81);
    OUTLINED_FUNCTION_3_25();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    uint64_t v83 = swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_16(v83, sel_setFlowNetworkInterfaceType_);
  }
  OUTLINED_FUNCTION_1_32(v73, v74, v75, v76, v77, v78, v79, v80, v119, v124, v128, v132, v136, v140, v144, v148, v152, v156, v160,
    v161,
    v162,
    v163,
    v164,
    v165,
    v166,
    v167,
    v168,
    v169,
    v170,
    v171,
    v172,
    v173,
    v174,
    v175,
    v176,
    v177,
    v178,
    v179,
    v180,
    v181,
    v182,
    v183,
    v184,
    v185,
    v186,
    v187,
    v188,
    v189,
    v190,
    v191,
    v192,
    v193,
    v194,
    v195,
    v196,
    v197,
    v198,
    v199,
    v200,
    v201[0]);
  uint64_t v84 = *(void *)(ConnectionSnapshotReport.tcpInfoMetricsByInterfaceName.getter() + 16);
  uint64_t v85 = swift_bridgeObjectRelease();
  if (v84)
  {
    OUTLINED_FUNCTION_1_32(v85, v86, v87, v88, v89, v90, v91, v92, v120, v121, v125, v129, v133, v137, v141, v145, v149, v153, v157,
      v161,
      v162,
      v163,
      v164,
      v165,
      v166,
      v167,
      v168,
      v169,
      v170,
      v171,
      v172,
      v173,
      v174,
      v175,
      v176,
      v177,
      v178,
      v179,
      v180,
      v181,
      v182,
      v183,
      v184,
      v185,
      v186,
      v187,
      v188,
      v189,
      v190,
      v191,
      v192,
      v193,
      v194,
      v195,
      v196,
      v197,
      v198,
      v199,
      v200,
      v201[0]);
    ConnectionSnapshotReport.tcpInfoMetricsByInterfaceName.getter();
    type metadata accessor for SNConnectionTCPInfoMetrics();
    Dictionary._bridgeToObjectiveC()();
    uint64_t v93 = OUTLINED_FUNCTION_3_25();
    OUTLINED_FUNCTION_2_25(v93, sel_setTCPInfoMetricsByInterfaceName_);
  }
  if ((__dst[47] & 1) == 0)
  {
    uint64_t v94 = HIDWORD(__dst[46]);
    double v95 = *(double *)&__dst[45];
    id v96 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, LODWORD(__dst[46]));
    OUTLINED_FUNCTION_2_25((uint64_t)v96, sel_setPingCount_);

    uint64_t v25 = (SEL *)objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v95);
    OUTLINED_FUNCTION_2_25((uint64_t)v25, sel_setMeanPing_);

    id v97 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, v94);
    OUTLINED_FUNCTION_4_16((uint64_t)v97, sel_setUnacknowledgedPingCount_);
  }
  outlined init with take of ConnectionSnapshotReport?((uint64_t)&__dst[5], (uint64_t)v201, (uint64_t *)&demangling cache variable for type metadata for ConnectionNetworkReport?);
  if (_s11SiriNetwork010ConnectionB6ReportVSgWOg((uint64_t)v201) != 1)
  {
    uint64_t v98 = v201[13];
    outlined init with take of ConnectionSnapshotReport?((uint64_t)&__dst[5], (uint64_t)&v161, (uint64_t *)&demangling cache variable for type metadata for ConnectionNetworkReport?);
    outlined retain of ConnectionNetworkReport((uint64_t)&v161);
    specialized _dictionaryUpCast<A, B, C, D>(_:)(v98);
    Dictionary._bridgeToObjectiveC()();
    OUTLINED_FUNCTION_3_25();
    uint64_t v99 = _s11SiriNetwork010ConnectionB6ReportVSgWOsTm_0((uint64_t)&__dst[5], (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))outlined consume of ConnectionNetworkReport?);
    OUTLINED_FUNCTION_2_25(v99, sel_setSubflowSwitchCounts_);
  }
  unsigned int v100 = __dst[87];
  if (LOBYTE(__dst[87]) == 4)
  {
    outlined release of ConnectionSnapshotReport?((uint64_t)v232);
    uint64_t v25 = (SEL *)&selRef_logNetworkConnectionStateReadySnapshotCaptured_;
    if (!v9) {
      goto LABEL_65;
    }
LABEL_64:
    long long v105 = (void *)MEMORY[0x2611B2220](v133, v9);
    OUTLINED_FUNCTION_4_16((uint64_t)v105, sel_setWifiChannelInfo_);

    goto LABEL_65;
  }
  uint64_t v101 = *(void *)(ConnectionQualityReport.symptomsBasedNetworkQuality.getter(__dst[87]) + 16);
  swift_bridgeObjectRelease();
  uint64_t v25 = (SEL *)&selRef_logNetworkConnectionStateReadySnapshotCaptured_;
  if (v101)
  {
    uint64_t v102 = ConnectionQualityReport.symptomsBasedNetworkQuality.getter(v100);
    specialized _dictionaryUpCast<A, B, C, D>(_:)(v102);
    swift_bridgeObjectRelease();
    Class v103 = Dictionary._bridgeToObjectiveC()().super.isa;
    uint64_t v104 = swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_16(v104, sel_setSymptomsBasedNetworkQuality_);
    outlined release of ConnectionSnapshotReport?((uint64_t)v232);

    goto LABEL_63;
  }
  outlined release of ConnectionSnapshotReport?((uint64_t)v232);
  if (v9) {
    goto LABEL_64;
  }
LABEL_65:
  if ((v145 & 0x100000000) == 0)
  {
    id v106 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, HIDWORD(v121));
    OUTLINED_FUNCTION_4_16((uint64_t)v106, sel_setSimSubscriptions_);
  }
  if (v5)
  {
    long long v107 = (void *)MEMORY[0x2611B2220](v137, v5);
    OUTLINED_FUNCTION_4_16((uint64_t)v107, sel_setConnectionEdgeID_);
  }
  if (v6)
  {
    uint64_t v108 = (void *)MEMORY[0x2611B2220](v141, v6);
    OUTLINED_FUNCTION_4_16((uint64_t)v108, sel_setConnectionEdgeType_);
  }
  if ((v149 & 1) == 0)
  {
    id v109 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedLongLong_, v125);
    OUTLINED_FUNCTION_4_16((uint64_t)v109, sel_setConnectionFallbackReason_);
  }
  if ((v149 & 0x100000000) == 0)
  {
    id v110 = objc_msgSend(objc_allocWithZone(NSNumber), v25[436], v7);
    OUTLINED_FUNCTION_4_16((uint64_t)v110, sel_setConnectionDelay_);
  }
  if ((v153 & 1) == 0)
  {
    id v111 = objc_msgSend(objc_allocWithZone(NSNumber), v25[436], v8);
    OUTLINED_FUNCTION_4_16((uint64_t)v111, sel_setFirstTxByteDelay_);
  }
  if ((v153 & 0x100000000) == 0)
  {
    id v112 = objc_msgSend(objc_allocWithZone(NSNumber), v25[436], v10);
    OUTLINED_FUNCTION_4_16((uint64_t)v112, sel_setIdsLastMessageDelay_);
  }
  if ((v157 & 1) == 0)
  {
    id v113 = objc_msgSend(objc_allocWithZone(NSNumber), v25[436], v11);
    OUTLINED_FUNCTION_4_16((uint64_t)v113, sel_setIdsLastSocketDelay_);
  }
  if ((v157 & 0x100000000) == 0)
  {
    id v114 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedLongLong_, v129);
    OUTLINED_FUNCTION_4_16((uint64_t)v114, sel_setIdsLastSocketOpenError_);
  }
  return v12;
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
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 16;
      *(void *)(v2 + 16) = v6 + 1;
      outlined init with take of Any(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

unint64_t type metadata accessor for SNConnectionTCPInfoMetrics()
{
  unint64_t result = lazy cache variable for type metadata for SNConnectionTCPInfoMetrics;
  if (!lazy cache variable for type metadata for SNConnectionTCPInfoMetrics)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SNConnectionTCPInfoMetrics);
  }
  return result;
}

uint64_t _s11SiriNetwork010ConnectionB6ReportVSgWOsTm_0(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v8 = *(unsigned char *)(a1 + 312);
  long long v6 = *(_OWORD *)(a1 + 272);
  long long v7 = *(_OWORD *)(a1 + 288);
  long long v4 = *(_OWORD *)(a1 + 240);
  long long v5 = *(_OWORD *)(a1 + 256);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    *(void *)(a1 + 224),
    *(void *)(a1 + 232),
    v4,
    *((void *)&v4 + 1),
    v5,
    *((void *)&v5 + 1),
    v6,
    *((void *)&v6 + 1),
    v7,
    *((void *)&v7 + 1),
    *(void *)(a1 + 304),
    v8);
  return a1;
}

void *OUTLINED_FUNCTION_1_32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t __dst)
{
  return memcpy(&__dst, &STACK[0x5A0], 0x2C8uLL);
}

id OUTLINED_FUNCTION_2_25(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_3_25()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_4_19(void *a1)
{
  return objc_msgSend(a1, (SEL)(v1 + 2093), v3);
}

id OUTLINED_FUNCTION_5_19(void *a1)
{
  return objc_msgSend(a1, (SEL)(v2 + 2072), v1);
}

void OUTLINED_FUNCTION_6_16()
{
  JUMPOUT(0x2611B2220);
}

uint64_t dispatch thunk of SessionObject.internalAceId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SessionObject.internalAceId.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of SessionObject.internalAceId.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of SessionObject.internalRefId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SessionObject.internalRefId.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of SessionObject.internalRefId.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of SessionObject.serializedAceData()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of SessionObject.bufferingAllowedDuringActiveSession()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of SessionObject.isRetryable()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of SessionObject.isRestartable()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of SessionObject.isProvisional()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of SessionObject.logDiagnostics()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of SessionObject.sessionRequestId()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of SessionObject.setSessionRequestId(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 112))();
}

uint64_t dispatch thunk of SessionObject.supportedByLocalSession()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t dispatch thunk of SessionObject.supportedByRemoteLimitedSession()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t ZlibDataCompressor.init()()
{
  uint64_t v1 = swift_slowAlloc();
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 120) = 0;
  *(void *)(v0 + 128) = v1;
  *(_DWORD *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  *(_DWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  *(_OWORD *)(v0 + 88) = 0u;
  *(_DWORD *)(v0 + 104) = 0;
  *(void *)(v0 + 112) = 0;
  OUTLINED_FUNCTION_1();
  *(void *)(v0 + 80) = 0;
  *(void *)(v0 + 88) = 0;
  *(void *)(v0 + 96) = 0;
  int v2 = deflateInit_((z_streamp)(v0 + 16), 9, "1.2.12", 112);
  swift_endAccess();
  if (v2)
  {
    swift_release();
    return 0;
  }
  return v0;
}

uint64_t ZlibDataCompressor.deinit()
{
  MEMORY[0x2611B3750](*(void *)(v0 + 128), -1, -1);
  OUTLINED_FUNCTION_1();
  deflateEnd((z_streamp)(v0 + 16));
  swift_endAccess();
  return v0;
}

uint64_t ZlibDataCompressor.__deallocating_deinit()
{
  ZlibDataCompressor.deinit();

  return MEMORY[0x270FA0228](v0, 136, 7);
}

uint64_t type metadata accessor for ZlibDataCompressor()
{
  return self;
}

uint64_t ZlibDataCompressor.compressedDataForData(_:)(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15) {
    return 0;
  }
  unint64_t v5 = a2 >> 62;
  uint64_t v7 = (int)a1;
  uint64_t v8 = a1 >> 32;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v10 = a1 >> 32;
      uint64_t v11 = (int)a1;
      goto LABEL_9;
    case 2uLL:
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v10 = *(void *)(a1 + 24);
LABEL_9:
      if (v11 == v10) {
        return 0;
      }
      outlined copy of Data._Representation(a1, a2);
      if (v5 == 2)
      {
        uint64_t v12 = *(void *)(a1 + 16);
        uint64_t v13 = *(void *)(a1 + 24);
        outlined copy of Data?(a1, a2);
        swift_retain();
        swift_retain();
        swift_retain();
        OUTLINED_FUNCTION_0_33(v12, v13, &v15);
        uint64_t v14 = v3;
        swift_release();
        swift_release();
      }
      else
      {
        if (v8 < (int)a1)
        {
          __break(1u);
          JUMPOUT(0x25D7631E4);
        }
        outlined copy of Data?(a1, a2);
        swift_retain();
        OUTLINED_FUNCTION_0_33(v7, v8, &v15);
        uint64_t v14 = v3;
      }
      uint64_t result = outlined consume of Data?(a1, a2);
      if (v14) {
        return result;
      }
      goto LABEL_5;
    case 3uLL:
      goto LABEL_6;
    default:
      if ((a2 & 0xFF000000000000) == 0)
      {
LABEL_6:
        outlined consume of Data?(a1, a2);
        return 0;
      }
      swift_retain();
      _ss15withUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_A13Et_sAC_p10Foundation4DataVSgTg5015_s10Foundation4h18V06InlineB0V15withB33BytesyxxSWKXEKlFxSWKXEfU_ACSg_TG5SWxsAC_pRi_zRi0_zlyAIIsgyrzo_SiTf1nnc_n021_s11SiriNetwork18ZlibH64CompressorC010compressedd3ForD0y10Foundation0D0VSgAHKFAHSWKXEfU_0V7Network0xhY0CAHTf1nncn_n(a1, a2 & 0xFFFFFFFFFFFFLL, v2, a1, a2, &v15);
      uint64_t result = outlined consume of Data?(a1, a2);
      if (!v3) {
LABEL_5:
      }
        uint64_t result = v15;
      break;
  }
  return result;
}

uint64_t closure #1 in ZlibDataCompressor.compressedDataForData(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, long long *a3@<X8>)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (a1)
  {
    swift_beginAccess();
    *(void *)(a2 + 16) = a1;
  }
  unint64_t v6 = Data.count.getter();
  if ((v6 & 0x8000000000000000) != 0) {
    goto LABEL_25;
  }
  int v7 = v6;
  if (HIDWORD(v6)) {
    goto LABEL_25;
  }
  swift_beginAccess();
  *(_DWORD *)(a2 + 24) = v7;
  long long v26 = xmmword_25D7906C0;
  uint64_t v8 = *(const void **)(a2 + 128);
  while (1)
  {
    swift_beginAccess();
    *(void *)(a2 + 40) = v8;
    *(_DWORD *)(a2 + 48) = 0x2000;
    unsigned int v9 = deflate((z_streamp)(a2 + 16), 2);
    swift_endAccess();
    if (v9 > 1) {
      break;
    }
    uint64_t v10 = *(unsigned int *)(a2 + 48);
    if (v10 == 0x2000)
    {
      uint64_t v11 = 0;
      unint64_t v12 = 0xC000000000000000;
    }
    else
    {
      size_t v13 = 0x2000 - v10;
      if (v10 >> 1 >= 0xFF9)
      {
        memset(__dst, 0, sizeof(__dst));
        unsigned __int8 v25 = -(char)v10;
        memcpy(__dst, v8, v13);
        uint64_t v11 = *(void *)__dst;
        unint64_t v12 = *(unsigned int *)&__dst[8] | ((unint64_t)__dst[12] << 32) | ((unint64_t)__dst[13] << 40) | ((unint64_t)v25 << 48);
      }
      else
      {
        type metadata accessor for __DataStorage();
        swift_allocObject();
        uint64_t v11 = v13 << 32;
        unint64_t v12 = __DataStorage.init(bytes:length:)() | 0x4000000000000000;
      }
    }
    if (*((void *)&v26 + 1) >> 60 != 15) {
      Data.append(_:)();
    }
    uint64_t result = outlined consume of Data._Representation(v11, v12);
    if (v9 || *(_DWORD *)(a2 + 48))
    {
      *a3 = v26;
      return result;
    }
  }
  if (!*(void *)(a2 + 64))
  {
    __break(1u);
LABEL_25:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  uint64_t v15 = String.init(cString:)();
  unint64_t v17 = v16;
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v18 = type metadata accessor for Logger();
  __swift_project_value_buffer(v18, (uint64_t)static Logger.siriNetwork);
  swift_bridgeObjectRetain();
  uint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(void *)__dst = v22;
    *(_DWORD *)uint64_t v21 = 67109378;
    swift_beginAccess();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v21 + 8) = 2080;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v17, (uint64_t *)__dst);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25D6CC000, v19, v20, "DataCompressor - Compression: Deflate finished with unexpected status %d %s", (uint8_t *)v21, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x2611B3750](v22, -1, -1);
    MEMORY[0x2611B3750](v21, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  outlined consume of Data?(v26, *((unint64_t *)&v26 + 1));
  long long v26 = xmmword_25D7906D0;
  swift_beginAccess();
  lazy protocol witness table accessor for type DataCompressorError and conformance DataCompressorError();
  swift_allocError();
  *uint64_t v23 = v9;
  swift_willThrow();
  return outlined consume of Data?(v26, *((unint64_t *)&v26 + 1));
}

uint64_t protocol witness for DataCompressing.compressedDataForData(_:) in conformance ZlibDataCompressor(uint64_t a1, unint64_t a2)
{
  return ZlibDataCompressor.compressedDataForData(_:)(a1, a2);
}

uint64_t _ss15withUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_A13Et_sAC_p10Foundation4DataVSgTg5015_s10Foundation4h18V06InlineB0V15withB33BytesyxxSWKXEKlFxSWKXEfU_ACSg_TG5SWxsAC_pRi_zRi0_zlyAIIsgyrzo_SiTf1nnc_n021_s11SiriNetwork18ZlibH64CompressorC010compressedd3ForD0y10Foundation0D0VSgAHKFAHSWKXEfU_0V7Network0xhY0CAHTf1nncn_n@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, unint64_t a5@<X5>, long long *a6@<X8>)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v9 = a1;
  __int16 v10 = a2;
  char v11 = BYTE2(a2);
  char v12 = BYTE3(a2);
  char v13 = BYTE4(a2);
  char v14 = BYTE5(a2);
  closure #1 in ZlibDataCompressor.compressedDataForData(_:)((uint64_t)&v9, a3, a6);
  swift_release();
  return outlined consume of Data._Representation(a4, a5);
}

uint64_t OUTLINED_FUNCTION_0_33@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X8>)
{
  return specialized __DataStorage.withUnsafeBytes<A>(in:apply:)(a1, a2, v3, v4, v5, a3);
}

void *ConnectionPreparationReport.netDebugConnectionStatePreparationSnapshot.getter()
{
  uint64_t v2 = *v0;
  uint64_t v1 = (void *)v0[1];
  uint64_t v3 = v0[3];
  uint64_t v4 = *((unsigned __int8 *)v0 + 33);
  uint64_t v5 = *((unsigned __int8 *)v0 + 34);
  uint64_t v6 = *((unsigned __int8 *)v0 + 35);
  unsigned int v32 = *((unsigned __int8 *)v0 + 36);
  uint64_t v7 = v0[42];
  uint64_t v33 = v0[43];
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E458]), sel_init);
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
    if (v1) {
      uint64_t v1 = (void *)MEMORY[0x2611B2220](v2, v1);
    }
    objc_msgSend(v9, sel_setConnectionInfo_, v1);

    if (v3)
    {
      type metadata accessor for NetworkAnalytics(0);
      id v11 = v9;
      objc_msgSend(v11, sel_setStatus_, static NetworkAnalytics.netPathStatus(from:)());
    }
  }
  objc_msgSend(v9, sel_setIsConstrained_, v5);
  objc_msgSend(v9, sel_setIsExpensive_, v4);
  objc_msgSend(v9, sel_setHasIpv4_, v6);
  uint64_t v34 = v9;
  objc_msgSend(v9, sel_setHasIpv6_, v32);
  uint64_t v12 = *(void *)(v7 + 16);
  uint64_t v13 = MEMORY[0x263F8EE78];
  if (v12)
  {
    uint64_t v36 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    uint64_t v14 = v12 - 1;
    for (uint64_t i = 32; ; i += 296)
    {
      memcpy(__dst, (const void *)(v7 + i), 0x121uLL);
      id v16 = objc_allocWithZone(MEMORY[0x263F6E4C8]);
      outlined retain of ConnectionInterfaceReport((uint64_t)__dst);
      id v17 = objc_msgSend(v16, sel_init);
      if (v17)
      {
        uint64_t v18 = __dst[0];
        uint64_t v19 = __dst[1];
        id v20 = v17;
        outlined bridged method (mbgnn) of @objc NETSchemaNETPathInterface.name.setter(v18, v19, v20);

        objc_msgSend(v20, sel_setIndex_, HIDWORD(__dst[4]));
        type metadata accessor for NetworkAnalytics(0);
        id v21 = v20;
        objc_msgSend(v21, sel_setType_, static NetworkAnalytics.netPathType(from:)());

        outlined release of ConnectionInterfaceReport((uint64_t)__dst);
        id v22 = v21;
        MEMORY[0x2611B2350]();
        if (*(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();

        if (!v14)
        {
LABEL_15:
          swift_bridgeObjectRelease();
          if (v34) {
            outlined bridged method (mbnn) of @objc NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured.pathGateways.setter(v36, v34, &lazy cache variable for type metadata for NETSchemaNETPathInterface, 0x263F6E4C8, (SEL *)&selRef_setPathInterfaces_);
          }
          else {
            swift_bridgeObjectRelease();
          }
          uint64_t v13 = MEMORY[0x263F8EE78];
          break;
        }
      }
      else
      {
        objc_msgSend(0, sel_setIndex_, HIDWORD(__dst[4]));
        outlined release of ConnectionInterfaceReport((uint64_t)__dst);
        if (!v14) {
          goto LABEL_15;
        }
      }
      --v14;
    }
  }
  uint64_t v23 = *(void *)(v33 + 16);
  if (v23)
  {
    __dst[0] = v13;
    swift_bridgeObjectRetain();
    uint64_t v24 = (unsigned int *)(v33 + 52);
    do
    {
      uint64_t v26 = *(v24 - 1);
      unsigned int v25 = *v24;
      id v27 = objc_allocWithZone(MEMORY[0x263F6E490]);
      swift_bridgeObjectRetain();
      id v28 = objc_msgSend(v27, sel_init);
      if (v28)
      {
        uint64_t v29 = v28;
        objc_msgSend(v28, sel_setPort_, v26);
        type metadata accessor for NetworkAnalytics(0);
        objc_msgSend(v29, sel_setType_, static NetworkAnalytics.netEndpointType(from:)(v25));
        swift_bridgeObjectRelease();
        id v30 = v29;
        MEMORY[0x2611B2350]();
        if (*(void *)((__dst[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((__dst[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v24 += 6;
      --v23;
    }
    while (v23);
    swift_bridgeObjectRelease();
    if (v34) {
      outlined bridged method (mbnn) of @objc NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured.pathGateways.setter(__dst[0], v34, &lazy cache variable for type metadata for NETSchemaNETEndpoint, 0x263F6E490, (SEL *)&selRef_setPathGateways_);
    }
    else {
      swift_bridgeObjectRelease();
    }
  }
  return v34;
}

void outlined bridged method (mbgnn) of @objc NETSchemaNETPathInterface.name.setter(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)MEMORY[0x2611B2220]();
  objc_msgSend(a3, sel_setName_, v4);
}

void outlined bridged method (mbnn) of @objc NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured.pathGateways.setter(uint64_t a1, void *a2, unint64_t *a3, uint64_t a4, SEL *a5)
{
  type metadata accessor for CTServiceDescriptor(0, a3);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(a2, *a5, isa);
}

uint64_t static BackgroundConnectionError.errorDomain.getter()
{
  if (one-time initialization token for errorDomain != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = static BackgroundConnectionError.errorDomain;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static BackgroundConnectionError.errorDomain.setter(uint64_t a1, uint64_t a2)
{
  if (one-time initialization token for errorDomain != -1) {
    swift_once();
  }
  swift_beginAccess();
  static BackgroundConnectionError.errorDomain = a1;
  qword_26A693030 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static BackgroundConnectionError.errorDomain.modify())()
{
  if (one-time initialization token for errorDomain != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static ConnectionConfigurationError.errorDomain.modify;
}

uint64_t BackgroundConnectionError.errorCode.getter()
{
  uint64_t v1 = *v0;
  uint64_t result = 2;
  switch(*((unsigned char *)v0 + 32))
  {
    case 1:
      return result;
    case 2:
      uint64_t result = 3;
      break;
    case 3:
      uint64_t result = 7;
      break;
    case 4:
      uint64_t v3 = v0[1];
      uint64_t v4 = v0[2] | v0[3];
      if (v4 | v1 | v3)
      {
        uint64_t v5 = v4 | v3;
        if (v1 == 1 && v5 == 0)
        {
          uint64_t result = 4;
        }
        else if (v1 == 2 && v5 == 0)
        {
          uint64_t result = 5;
        }
        else
        {
          if (v5) {
            BOOL v8 = 0;
          }
          else {
            BOOL v8 = v1 == 3;
          }
          if (v8) {
            uint64_t result = 6;
          }
          else {
            uint64_t result = 8;
          }
        }
      }
      else
      {
        uint64_t result = 1;
      }
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t BackgroundConnectionError.errorUserInfo.getter()
{
  uint64_t v1 = *v0;
  switch(*((unsigned char *)v0 + 32))
  {
    case 0:
      uint64_t v3 = (void *)v0[1];
      uint64_t v4 = v0[2];
      unint64_t v5 = v0[3];
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25D7933C0;
      uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v8 = MEMORY[0x263F8D6C8];
      *(void *)(inited + 32) = v7;
      *(void *)(inited + 40) = v9;
      *(void *)(inited + 72) = v8;
      *(void *)(inited + 48) = v1;
      *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(void *)(inited + 88) = v10;
      type metadata accessor for CFStringRef(0);
      *(void *)(inited + 120) = v11;
      swift_bridgeObjectRetain();
      if (v3) {
        uint64_t v12 = (uint64_t)v3;
      }
      else {
        uint64_t v12 = MEMORY[0x2611B2220](0, 0xE000000000000000);
      }
      *(void *)(inited + 96) = v12;
      *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(void *)(inited + 136) = v13;
      *(void *)(inited + 168) = MEMORY[0x263F8D310];
      if (v5) {
        uint64_t v14 = v4;
      }
      else {
        uint64_t v14 = 0;
      }
      unint64_t v15 = 0xE000000000000000;
      if (v5) {
        unint64_t v15 = v5;
      }
      *(void *)(inited + 144) = v14;
      *(void *)(inited + 152) = v15;
      id v16 = v3;
      uint64_t result = Dictionary.init(dictionaryLiteral:)();
      break;
    case 1:
    case 2:
    case 3:
      uint64_t result = BackgroundConnectionError.shouldSkipIDSOrTuscanyUserInfo(_:_:)(*(unsigned char *)v0 & 1, BYTE1(v1) & 1);
      break;
    default:
      uint64_t result = Dictionary.init(dictionaryLiteral:)();
      break;
  }
  return result;
}

uint64_t BackgroundConnectionError.shouldSkipIDSOrTuscanyUserInfo(_:_:)(char a1, char a2)
{
  uint64_t v12 = Dictionary.init(dictionaryLiteral:)();
  uint64_t v4 = MEMORY[0x263F8D4F8];
  if (a1)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v4;
    v10[0] = 1;
    specialized Dictionary.subscript.setter((uint64_t)v10, v5, v6);
  }
  if (a2)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v4;
    v10[0] = 1;
    specialized Dictionary.subscript.setter((uint64_t)v10, v7, v8);
  }
  return v12;
}

BOOL static BackgroundConnectionError.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  unint64_t v3 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  int v6 = *(unsigned __int8 *)(a1 + 32);
  unint64_t v7 = *(void *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  uint64_t v10 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  int v11 = *(unsigned __int8 *)(a2 + 32);
  switch(*(unsigned char *)(a1 + 32))
  {
    case 1:
      if (v11 != 1) {
        goto LABEL_67;
      }
      uint64_t v13 = OUTLINED_FUNCTION_2_26();
      outlined consume of BackgroundConnectionError(v13, v14, v15, v16, 1);
      uint64_t v17 = OUTLINED_FUNCTION_3_26();
      char v21 = 1;
      goto LABEL_10;
    case 2:
      if (v11 != 2) {
        goto LABEL_67;
      }
      uint64_t v22 = OUTLINED_FUNCTION_2_26();
      outlined consume of BackgroundConnectionError(v22, v23, v24, v25, 2);
      uint64_t v17 = OUTLINED_FUNCTION_3_26();
      char v21 = 2;
      goto LABEL_10;
    case 3:
      if (v11 != 3) {
        goto LABEL_67;
      }
      uint64_t v26 = OUTLINED_FUNCTION_2_26();
      outlined consume of BackgroundConnectionError(v26, v27, v28, v29, 3);
      uint64_t v17 = OUTLINED_FUNCTION_3_26();
      char v21 = 3;
LABEL_10:
      outlined consume of BackgroundConnectionError(v17, v18, v19, v20, v21);
      if (v6 == v11) {
        return 0;
      }
      else {
        return ((v2 & 0x100) == 0) ^ (v7 >> 8) & 1;
      }
    case 4:
      if (v5 | v3 | v2 | v4)
      {
        unint64_t v31 = v5 | v3 | v4;
        if (v2 == 1 && v31 == 0)
        {
          if (v11 == 4 && v7 == 1 && (v10 | v8 | v9) == 0)
          {
            uint64_t v30 = 1;
            OUTLINED_FUNCTION_0_34(1);
            OUTLINED_FUNCTION_0_34(1);
            return v30;
          }
        }
        else if (v2 == 2 && v31 == 0)
        {
          if (v11 == 4 && v7 == 2 && (v10 | v8 | v9) == 0)
          {
            OUTLINED_FUNCTION_0_34(2);
            uint64_t v36 = 2;
            goto LABEL_77;
          }
        }
        else if (v2 == 3 && v31 == 0)
        {
          BOOL v50 = v11 == 4 && v7 == 3;
          if (v50 && !(v10 | v8 | v9))
          {
            OUTLINED_FUNCTION_0_34(3);
            uint64_t v36 = 3;
            goto LABEL_77;
          }
        }
        else
        {
          BOOL v35 = v11 == 4 && v7 == 4;
          if (v35 && !(v10 | v8 | v9))
          {
            OUTLINED_FUNCTION_0_34(4);
            uint64_t v36 = 4;
LABEL_77:
            OUTLINED_FUNCTION_0_34(v36);
            return 1;
          }
        }
      }
      else if (v11 == 4 && (v10 | v8 | v7 | v9) == 0)
      {
        OUTLINED_FUNCTION_0_34(0);
        uint64_t v36 = 0;
        goto LABEL_77;
      }
LABEL_67:
      uint64_t v51 = OUTLINED_FUNCTION_7_10();
      outlined copy of BackgroundConnectionError(v51, v52, v53, v54, v55);
      outlined consume of BackgroundConnectionError(v2, (void *)v3, v5, v4, v6);
      uint64_t v47 = OUTLINED_FUNCTION_7_10();
LABEL_68:
      outlined consume of BackgroundConnectionError(v47, v56, v57, v58, v59);
      return 0;
    default:
      if (*(unsigned char *)(a2 + 32))
      {
        swift_bridgeObjectRetain();
        id v12 = (id)v3;
        goto LABEL_67;
      }
      if (v2 != v7)
      {
        uint64_t v43 = OUTLINED_FUNCTION_3_26();
        outlined copy of BackgroundConnectionError(v43, v44, v45, v46, 0);
        OUTLINED_FUNCTION_4_20();
        OUTLINED_FUNCTION_1_33();
        uint64_t v47 = v7;
LABEL_74:
        id v56 = (void *)v8;
        uint64_t v57 = v10;
        uint64_t v58 = v9;
        char v59 = 0;
        goto LABEL_68;
      }
      if (!v3)
      {
        if (!v8)
        {
          OUTLINED_FUNCTION_6_17(*(void *)a1, 0);
          outlined copy of BackgroundConnectionError(v2, 0, v5, v4, 0);
          goto LABEL_80;
        }
LABEL_72:
        OUTLINED_FUNCTION_6_17(*(void *)a1, *(void **)(a2 + 8));
        OUTLINED_FUNCTION_4_20();
        goto LABEL_73;
      }
      if (!v8) {
        goto LABEL_72;
      }
      type metadata accessor for CFStringRef(0);
      id v37 = (id)v8;
      OUTLINED_FUNCTION_6_17(v2, (void *)v8);
      OUTLINED_FUNCTION_4_20();
      lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef();
      id v38 = (id)v3;
      char v39 = static _CFObject.== infix(_:_:)();

      if ((v39 & 1) == 0)
      {

LABEL_73:
        OUTLINED_FUNCTION_1_33();
        uint64_t v47 = v2;
        goto LABEL_74;
      }
LABEL_80:
      if (!v4)
      {
        swift_bridgeObjectRetain();

        outlined consume of BackgroundConnectionError(v2, (void *)v3, v5, 0, 0);
        OUTLINED_FUNCTION_5_20();
        if (!v9) {
          return 1;
        }
        goto LABEL_91;
      }
      if (!v9)
      {
        swift_bridgeObjectRetain_n();

        OUTLINED_FUNCTION_1_33();
        outlined consume of BackgroundConnectionError(v2, (void *)v8, v10, 0, 0);
        swift_bridgeObjectRelease();
LABEL_91:
        swift_bridgeObjectRelease();
        return 0;
      }
      if (v5 == v10 && v4 == v9)
      {
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();

        OUTLINED_FUNCTION_1_33();
        OUTLINED_FUNCTION_5_20();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        return 1;
      }
      char v62 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();

      OUTLINED_FUNCTION_1_33();
      OUTLINED_FUNCTION_5_20();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      return (v62 & 1) != 0;
  }
}

void outlined copy of BackgroundConnectionError(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, char a5)
{
  if (!a5)
  {
    swift_bridgeObjectRetain();
    id v6 = a2;
  }
}

uint64_t protocol witness for Error._domain.getter in conformance BackgroundConnectionError(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type BackgroundConnectionError and conformance BackgroundConnectionError();

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t protocol witness for Error._code.getter in conformance BackgroundConnectionError(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type BackgroundConnectionError and conformance BackgroundConnectionError();

  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t destroy for BackgroundConnectionError(uint64_t a1)
{
  return outlined consume of BackgroundConnectionError(*(void *)a1, *(void **)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t initializeWithCopy for BackgroundConnectionError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  outlined copy of BackgroundConnectionError(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for BackgroundConnectionError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  outlined copy of BackgroundConnectionError(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void **)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  outlined consume of BackgroundConnectionError(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for BackgroundConnectionError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void **)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  outlined consume of BackgroundConnectionError(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for BackgroundConnectionError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFC && *(unsigned char *)(a1 + 33))
    {
      int v2 = *(_DWORD *)a1 + 251;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
      if (v3 <= 4) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BackgroundConnectionError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for BackgroundConnectionError(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 3u) {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t destructiveInjectEnumTag for BackgroundConnectionError(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)__n128 result = a2 - 4;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 4;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for BackgroundConnectionError()
{
  return &type metadata for BackgroundConnectionError;
}

uint64_t OUTLINED_FUNCTION_0_34(uint64_t a1)
{
  return outlined consume of BackgroundConnectionError(a1, 0, 0, 0, 4);
}

uint64_t OUTLINED_FUNCTION_1_33()
{
  return outlined consume of BackgroundConnectionError(v0, v3, v2, v1, 0);
}

uint64_t OUTLINED_FUNCTION_2_26()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_26()
{
  return v0;
}

void OUTLINED_FUNCTION_4_20()
{
  outlined copy of BackgroundConnectionError(v0, v3, v2, v1, 0);
}

uint64_t OUTLINED_FUNCTION_5_20()
{
  return outlined consume of BackgroundConnectionError(v1, v3, v2, v0, 0);
}

void OUTLINED_FUNCTION_6_17(uint64_t a1, void *a2)
{
  outlined copy of BackgroundConnectionError(a1, a2, v3, v2, 0);
}

uint64_t OUTLINED_FUNCTION_7_10()
{
  return v0;
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  return Hasher._finalize()();
}

{
  OUTLINED_FUNCTION_56_2();
  Hasher._combine(_:)(1uLL);
  return Hasher._finalize()();
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

{
  OUTLINED_FUNCTION_56_2();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  specialized RawRepresentable<>.hash(into:)();
  return Hasher._finalize()();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, char a2)
{
  return Hasher._finalize()();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, unsigned __int8 a2)
{
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a2);
  return Hasher._finalize()();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, Swift::UInt a2)
{
  return Hasher._finalize()();
}

void specialized Set.contains(_:)(unsigned __int8 a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    Swift::UInt v3 = a1;
    Hasher.init(_seed:)();
    Hasher._combine(_:)(v3);
    unint64_t v4 = Hasher._finalize()() & ~(-1 << *(unsigned char *)(a2 + 32));
    if (((*(void *)(a2 + 56 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0
      && *(unsigned __int8 *)(*(void *)(a2 + 48) + v4) != v3)
    {
      OUTLINED_FUNCTION_66_2();
      if (v7)
      {
        do
        {
          if (*(unsigned __int8 *)(v5 + v6) == v3) {
            break;
          }
          OUTLINED_FUNCTION_66_2();
        }
        while ((v8 & 1) != 0);
      }
    }
  }
}

void specialized Set.contains(_:)(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_retain();
    __CocoaSet.contains(_:)();
    swift_release();
  }
  else if (*(void *)(a2 + 16))
  {
    Hasher.init(_seed:)();
    Swift::UInt64 v4 = NWConnection.identifier.getter();
    Hasher._combine(_:)(v4);
    Swift::Int v5 = Hasher._finalize()();
    uint64_t v6 = -1 << *(unsigned char *)(a2 + 32);
    Swift::Int v7 = v5 & ~v6;
    OUTLINED_FUNCTION_52_1();
    if (v8)
    {
      swift_retain();
      uint64_t v9 = NWConnection.identifier.getter();
      NWConnection.identifier.getter();
      OUTLINED_FUNCTION_136();
      if (v9 != a1)
      {
        uint64_t v10 = ~v6;
        uint64_t v11 = (v7 + 1) & v10;
        OUTLINED_FUNCTION_52_1();
        if (v12)
        {
          do
          {
            swift_retain();
            uint64_t v13 = NWConnection.identifier.getter();
            NWConnection.identifier.getter();
            OUTLINED_FUNCTION_136();
            if (v13 == a1) {
              break;
            }
            uint64_t v11 = (v11 + 1) & v10;
            OUTLINED_FUNCTION_52_1();
          }
          while ((v14 & 1) != 0);
        }
      }
    }
  }
}

BOOL specialized Set.contains(_:)(void *__src, uint64_t a2)
{
  memcpy(__dst, __src, 0x72uLL);
  if (*(void *)(a2 + 16)
    && (memcpy(v19, __src, sizeof(v19)),
        Hasher.init(_seed:)(),
        ConnectionPolicyRoute.hash(into:)(),
        Swift::Int v4 = Hasher._finalize()(),
        uint64_t v5 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v6 = v4 & ~v5,
        ((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0))
  {
    uint64_t v7 = ~v5;
    do
    {
      OUTLINED_FUNCTION_62_2();
      long long v9 = v8[1];
      *(_OWORD *)uint64_t v19 = *v8;
      *(_OWORD *)&v19[16] = v9;
      long long v10 = v8[3];
      *(_OWORD *)&v19[32] = v8[2];
      *(_OWORD *)&v19[48] = v10;
      *(void *)&v19[64] = v11;
      v19[72] = v12;
      *(_OWORD *)&v19[80] = v8[5];
      v19[96] = v13;
      *(void *)&v19[104] = v14;
      v19[112] = v15;
      v19[113] = v16;
      BOOL v17 = static ConnectionPolicyRoute.== infix(_:_:)((uint64_t)v19, (uint64_t)__dst);
      if (v17) {
        break;
      }
      unint64_t v6 = (v6 + 1) & v7;
    }
    while (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
  }
  else
  {
    return 0;
  }
  return v17;
}

void specialized BackgroundConnectionProtocol.hash(into:)(uint64_t a1)
{
  memcpy(__dst, (const void *)(v1 + 40), sizeof(__dst));
  ConnectionConfiguration.hash(into:)(a1);
}

SiriNetwork::ConnectionState_optional __swiftcall ConnectionState.init(rawValue:)(Swift::Int rawValue)
{
  if ((unint64_t)rawValue >= 3) {
    LOBYTE(rawValue) = 3;
  }
  return (SiriNetwork::ConnectionState_optional)rawValue;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ConnectionState()
{
  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ConnectionState(uint64_t a1)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

SiriNetwork::ConnectionState_optional protocol witness for RawRepresentable.init(rawValue:) in conformance ConnectionState@<W0>(Swift::Int *a1@<X0>, SiriNetwork::ConnectionState_optional *a2@<X8>)
{
  result.value = ConnectionState.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

void *protocol witness for OptionSet.init(rawValue:) in conformance PingStatus@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t protocol witness for SetAlgebra.intersection(_:) in conformance PingStatus@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = specialized OptionSet.intersection(_:)(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t protocol witness for SetAlgebra.formUnion(_:) in conformance PingStatus(uint64_t *a1)
{
  return specialized OptionSet<>.formUnion(_:)(*a1);
}

uint64_t protocol witness for SetAlgebra.formIntersection(_:) in conformance PingStatus(uint64_t *a1)
{
  return specialized OptionSet<>.formIntersection(_:)(*a1);
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance PingStatus(uint64_t *a1)
{
  return specialized SetAlgebra.isSubset(of:)(*a1, *v1);
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance PingStatus(uint64_t *a1)
{
  return specialized SetAlgebra.isSuperset(of:)(*a1, *v1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance PingStatus(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t (*BackgroundConnection.communicationProtocol.modify())()
{
  return static ConnectionConfigurationError.errorDomain.modify;
}

uint64_t BackgroundConnection.connectionAnalysisInfo.getter()
{
  OUTLINED_FUNCTION_119_0();
  if (*(void *)(v0 + 1080))
  {
    OUTLINED_FUNCTION_116_0();
    uint64_t v2 = *(void (**)(uint64_t))(v1 + 64);
    swift_unknownObjectRetain();
    uint64_t v3 = OUTLINED_FUNCTION_43_2();
    v2(v3);
    OUTLINED_FUNCTION_85_2();
    return swift_unknownObjectRelease();
  }
  else
  {
    type metadata accessor for ConnectionAnalysisInfo();
    OUTLINED_FUNCTION_85_2();
    return __swift_storeEnumTagSinglePayload(v6, v7, v8, v9);
  }
}

uint64_t BackgroundConnection.init(connectionConfiguration:connectionQueue:networkManager:networkAnalytics:)(void *__src, uint64_t a2, uint64_t a3, uint64_t a4)
{
  memcpy(__dst, __src, 0x204uLL);
  *(void *)(v4 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_OWORD *)(v4 + 1121) = 0u;
  *(_OWORD *)(v4 + 1096) = 0u;
  *(_OWORD *)(v4 + 1112) = 0u;
  *(_OWORD *)(v4 + 1080) = 0u;
  *(_OWORD *)(v4 + 1160) = 0u;
  *(_DWORD *)(v4 + 1184) = 0;
  *(_WORD *)(v4 + 1188) = 0;
  *(_OWORD *)(v4 + 1192) = 0u;
  *(_OWORD *)(v4 + 1208) = 0u;
  *(_OWORD *)(v4 + 1224) = 0u;
  *(unsigned char *)(v4 + 1240) = 1;
  *(void *)(v4 + 1248) = 0;
  memcpy((void *)(v4 + 40), __src, 0x204uLL);
  memcpy((void *)(v4 + 560), __src, 0x204uLL);
  *(void *)(v4 + 32) = a2;
  *(void *)(v4 + 1152) = MEMORY[0x263F8EE88];
  *(void *)(v4 + 1176) = a4;
  *(void *)(v4 + 1144) = a3;
  outlined retain of ConnectionConfiguration(__dst);
  return v4;
}

id *BackgroundConnection.deinit()
{
  BackgroundConnection.closeConnectionAndPrepareForReconnect(_:)(0);
  outlined destroy of weak ConnectionProviderDelegate?((uint64_t)(v0 + 2));

  memcpy(v2, v0 + 5, 0x204uLL);
  outlined release of ConnectionConfiguration(v2);
  memcpy(__dst, v0 + 70, 0x204uLL);
  outlined release of ConnectionConfiguration(__dst);
  swift_unknownObjectRelease();
  outlined destroy of CommunicationProtocol?((uint64_t)(v0 + 137), &demangling cache variable for type metadata for CommunicationProtocol?);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return v0;
}

uint64_t BackgroundConnection.__deallocating_deinit()
{
  BackgroundConnection.deinit();

  return MEMORY[0x270FA0228](v0, 1256, 7);
}

uint64_t type metadata accessor for BackgroundConnection()
{
  return self;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BackgroundConnection.start()()
{
  v0[1136] = 0;
  v0[138] = v0[658];
  v0[136] = v0[656];
  BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(SiriNetwork_ConnectionMethod_unknown, 1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(SiriNetwork::ConnectionMethod proposedFallbackMethod, Swift::Bool allowFallbackToNewMethod)
{
  void (*v86)(unsigned char *__return_ptr, uint64_t, uint64_t);
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  char v92;
  char v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  char v100;
  char v101;
  char v102;
  uint64_t v103;
  char v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  char v114;
  uint64_t v115;
  char v116;
  char v117;
  char v118;
  char v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *__src;
  id __srca;
  uint64_t *v129;
  __int16 v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  int v134;
  unsigned int v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  id v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168[12];
  char v169;
  unsigned char v170[15];
  BOOL v171;
  unsigned char v172[31];
  uint64_t v173;
  unsigned char v174[168];
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  unsigned char v185[116];
  uint64_t v186;
  unsigned char v187[516];
  unsigned char v188[516];
  unsigned char v189[116];
  unsigned char v190[168];
  _OWORD v191[2];
  void v192[2];
  char v193;
  unsigned char v194[96];
  _OWORD __dst[33];
  unsigned char v196[24];
  uint64_t v197;
  unsigned char v198[516];

  uint64_t v3 = v2;
  siri_kdebug_trace_0(320);
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Logger.siriNetwork);
  swift_retain_n();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    *(void *)&__dst[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315650;
    uint64_t v10 = 0x6E776F6E6B6E75;
    switch(*(unsigned char *)(v3 + 1136))
    {
      case 1:
        uint64_t v10 = OUTLINED_FUNCTION_11_8();
        break;
      case 2:
        uint64_t v10 = OUTLINED_FUNCTION_21_5();
        break;
      case 3:
        uint64_t v10 = OUTLINED_FUNCTION_20_5();
        break;
      default:
        break;
    }
    unint64_t v11 = OUTLINED_FUNCTION_105_1(v10);
    OUTLINED_FUNCTION_76_2(v11);
    OUTLINED_FUNCTION_64_1();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v12 = 0x6E776F6E6B6E75;
    switch(proposedFallbackMethod)
    {
      case SiriNetwork_ConnectionMethod_network:
        uint64_t v12 = OUTLINED_FUNCTION_11_8();
        break;
      case SiriNetwork_ConnectionMethod_peer:
        uint64_t v12 = OUTLINED_FUNCTION_21_5();
        break;
      case SiriNetwork_ConnectionMethod_pop:
        uint64_t v12 = OUTLINED_FUNCTION_20_5();
        break;
      default:
        break;
    }
    *(_DWORD *)&v188[4] = (unint64_t)OUTLINED_FUNCTION_105_1(v12) >> 32;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 22) = 1024;
    *(_DWORD *)uint64_t v188 = allowFallbackToNewMethod;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_25D6CC000, v7, v8, "Background Connection - Start. Current method: %s. Proposed: %s. Allow fallback: %{BOOL}d", (uint8_t *)v9, 0x1Cu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_1_2();
  }
  else
  {

    OUTLINED_FUNCTION_64_1();
  }
  objc_msgSend(*(id *)(v3 + 1144), sel_updateNetworkPerformanceFeed);
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AB0]), sel_init);
  objc_msgSend(v13, sel_systemUptime);
  uint64_t v15 = v14;

  *(void *)(v3 + 1200) = v15;
  if (*(double *)(v3 + 1192) <= 0.0) {
    *(void *)(v3 + 1192) = v15;
  }
  *(void *)(v3 + 1208) = 0;
  uint64_t v16 = *(void *)(v3 + 1224);
  BOOL v17 = __CFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (v17)
  {
    __break(1u);
    JUMPOUT(0x25D766DA8);
  }
  *(void *)(v3 + 1224) = v18;
  Swift::Int v19 = *(unsigned __int8 *)(v3 + 1136);
  if (!*(unsigned char *)(v3 + 1136))
  {
    if ((*(unsigned char *)(v3 + 138) & 1) == 0)
    {
      v188[0] = *(unsigned char *)(v3 + 168);
      v187[0] = *(unsigned char *)(v3 + 256);
      LOBYTE(v168[0]) = *(unsigned char *)(v3 + 272);
      v190[0] = *(unsigned char *)(v3 + 288);
      v189[0] = *(unsigned char *)(v3 + 304);
      v194[0] = *(unsigned char *)(v3 + 320);
      v196[0] = *(unsigned char *)(v3 + 336);
      LOBYTE(v191[0]) = *(unsigned char *)(v3 + 352);
      LOWORD(__dst[6]) = *(_WORD *)(v3 + 136);
      BYTE3(__dst[6]) = *(unsigned char *)(v3 + 139);
      *((void *)&__dst[6] + 1) = *(void *)(v3 + 144);
      LOWORD(__dst[7]) = *(_WORD *)(v3 + 152);
      BYTE2(__dst[7]) = *(unsigned char *)(v3 + 154);
      *((void *)&__dst[7] + 1) = *(void *)(v3 + 160);
      LOBYTE(__dst[8]) = v188[0];
      WORD4(__dst[12]) = *(_WORD *)(v3 + 240);
      *(void *)&__dst[13] = *(void *)(v3 + 248);
      BYTE8(__dst[13]) = v187[0];
      *(void *)&unsigned char __dst[14] = *(void *)(v3 + 264);
      BYTE8(__dst[14]) = v168[0];
      *(void *)&__dst[15] = *(void *)(v3 + 280);
      BYTE8(__dst[15]) = v190[0];
      *(void *)&__dst[16] = *(void *)(v3 + 296);
      BYTE8(__dst[16]) = v189[0];
      *(void *)&__dst[17] = *(void *)(v3 + 312);
      BYTE8(__dst[17]) = v194[0];
      *(void *)&__dst[18] = *(void *)(v3 + 328);
      BYTE8(__dst[18]) = v196[0];
      *(void *)&__dst[19] = *(void *)(v3 + 344);
      BYTE8(__dst[19]) = v191[0];
      BYTE9(__dst[19]) = *(unsigned char *)(v3 + 353);
      long long v25 = *(_OWORD *)(v3 + 520);
      long long v26 = *(_OWORD *)(v3 + 536);
      LOWORD(__dst[32]) = *(_WORD *)(v3 + 552);
      BYTE2(__dst[32]) = *(unsigned char *)(v3 + 554);
      long long v27 = *(_OWORD *)(v3 + 360);
      long long v28 = *(_OWORD *)(v3 + 376);
      long long v29 = *(_OWORD *)(v3 + 392);
      long long v30 = *(_OWORD *)(v3 + 408);
      long long v31 = *(_OWORD *)(v3 + 424);
      long long v32 = *(_OWORD *)(v3 + 440);
      long long v33 = *(_OWORD *)(v3 + 456);
      long long v34 = *(_OWORD *)(v3 + 472);
      long long v35 = *(_OWORD *)(v3 + 488);
      long long v36 = *(_OWORD *)(v3 + 504);
      BYTE3(__dst[32]) = *(unsigned char *)(v3 + 555);
      long long v37 = *(_OWORD *)(v3 + 56);
      __dst[0] = *(_OWORD *)(v3 + 40);
      __dst[1] = v37;
      long long v38 = *(_OWORD *)(v3 + 88);
      __dst[2] = *(_OWORD *)(v3 + 72);
      __dst[3] = v38;
      long long v39 = *(_OWORD *)(v3 + 120);
      __dst[4] = *(_OWORD *)(v3 + 104);
      __dst[5] = v39;
      long long v40 = *(_OWORD *)(v3 + 192);
      *(_OWORD *)((char *)&__dst[8] + 8) = *(_OWORD *)(v3 + 176);
      *(_OWORD *)((char *)&__dst[9] + 8) = v40;
      long long v41 = *(_OWORD *)(v3 + 224);
      *(_OWORD *)((char *)&__dst[10] + 8) = *(_OWORD *)(v3 + 208);
      *(_OWORD *)((char *)&__dst[11] + 8) = v41;
      __dst[20] = v27;
      __dst[21] = v28;
      __dst[22] = v29;
      __dst[23] = v30;
      __dst[24] = v31;
      __dst[25] = v32;
      BYTE2(__dst[6]) = 0;
      __dst[26] = v33;
      __dst[27] = v34;
      __dst[28] = v35;
      __dst[29] = v36;
      __dst[30] = v25;
      __dst[31] = v26;
      Swift::Int v20 = 0;
      goto LABEL_27;
    }
    proposedFallbackMethod = SiriNetwork_ConnectionMethod_network;
LABEL_28:
    *(unsigned char *)(v3 + 1136) = proposedFallbackMethod;
    goto LABEL_34;
  }
  if (allowFallbackToNewMethod)
  {
    if (proposedFallbackMethod == SiriNetwork_ConnectionMethod_unknown)
    {
      memcpy(__dst, (const void *)(v3 + 40), 0x204uLL);
      Swift::Int v20 = v19;
LABEL_27:
      proposedFallbackMethod = ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)__dst, v20);
      goto LABEL_28;
    }
    goto LABEL_28;
  }
  swift_retain_n();
  char v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(void *)&__dst[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 136315138;
    uint64_t v24 = 0x6E776F6E6B6E75;
    switch(*(unsigned char *)(v3 + 1136))
    {
      case 1:
        uint64_t v24 = OUTLINED_FUNCTION_11_8();
        break;
      case 2:
        uint64_t v24 = OUTLINED_FUNCTION_21_5();
        break;
      case 3:
        uint64_t v24 = OUTLINED_FUNCTION_20_5();
        break;
      default:
        break;
    }
    unint64_t v42 = OUTLINED_FUNCTION_105_1(v24);
    OUTLINED_FUNCTION_76_2(v42);
    OUTLINED_FUNCTION_64_1();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25D6CC000, v21, v22, "Background Connection - Start. Fallback not allowed for this attempt, sticking with %s method.", v23, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_1_2();
  }
  else
  {

    OUTLINED_FUNCTION_64_1();
  }
  proposedFallbackMethod = *(unsigned char *)(v3 + 1136);
LABEL_34:
  if (proposedFallbackMethod == SiriNetwork_ConnectionMethod_peer && *(unsigned char *)(v3 + 137) == 1)
  {
    swift_beginAccess();
    specialized Set._Variant.insert(_:)(v188, 2);
    swift_endAccess();
    Swift::Int v43 = *(unsigned __int8 *)(v3 + 1136);
    memcpy(__dst, (const void *)(v3 + 40), 0x204uLL);
    *(unsigned char *)(v3 + 1136) = ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)__dst, v43);
  }
  swift_retain_n();
  uint64_t v44 = Logger.logObject.getter();
  os_log_type_t v45 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    *(void *)&__dst[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v46 = 136315138;
    uint64_t v47 = 0x6E776F6E6B6E75;
    switch(*(unsigned char *)(v3 + 1136))
    {
      case 1:
        uint64_t v47 = OUTLINED_FUNCTION_11_8();
        break;
      case 2:
        uint64_t v47 = OUTLINED_FUNCTION_21_5();
        break;
      case 3:
        uint64_t v47 = OUTLINED_FUNCTION_20_5();
        break;
      default:
        break;
    }
    *(void *)uint64_t v188 = OUTLINED_FUNCTION_105_1(v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_64_1();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25D6CC000, v44, v45, "Background Connection - Start. Selected method: %s.", v46, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_1_2();
  }
  else
  {

    OUTLINED_FUNCTION_64_1();
  }
  uint64_t v48 = ConnectionMethod.communicationProtocolClass(for:)(*(void *)(v3 + 48));
  uint64_t v50 = v49;
  uint64_t v51 = (uint64_t *)swift_allocObject();
  id v52 = *(void **)(v3 + 32);
  uint64_t v53 = *(void (**)(uint64_t, _UNKNOWN **))(v50 + 8);
  uint64_t v54 = (uint64_t)(v51 + 2);
  v51[5] = v48;
  v51[6] = v50;
  uint64_t v129 = v51;
  __swift_allocate_boxed_opaque_existential_1(v51 + 2);
  swift_retain();
  uint64_t v94 = v52;
  v53(v3, &protocol witness table for BackgroundConnection);
  outlined init with copy of RPCOspreyConnectionProtocol(v54, (uint64_t)__dst);
  _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)__dst, (uint64_t)v188, &demangling cache variable for type metadata for CommunicationProtocol?);
  swift_beginAccess();
  outlined assign with take of CommunicationProtocol?((uint64_t)v188, v3 + 1096);
  swift_endAccess();
  uint64_t v98 = v3 + 1096;
  outlined init with copy of NetworkConnectionProtocol?(v3 + 1096, (uint64_t)v196, &demangling cache variable for type metadata for CommunicationProtocol?);
  if (v197)
  {
    outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v196, (uint64_t)__dst);
    outlined destroy of CommunicationProtocol?((uint64_t)v196, &demangling cache variable for type metadata for CommunicationProtocol?);
    uint64_t v55 = *((void *)&__dst[1] + 1);
    uint64_t v56 = *(void *)&__dst[2];
    __swift_project_boxed_opaque_existential_1(__dst, *((uint64_t *)&__dst[1] + 1));
    (*(void (**)(BOOL, uint64_t, uint64_t))(v56 + 88))(*(unsigned char *)(v3 + 1136) != 0, v55, v56);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)__dst);
  }
  else
  {
    outlined destroy of CommunicationProtocol?((uint64_t)v196, &demangling cache variable for type metadata for CommunicationProtocol?);
  }
  memcpy(__dst, (const void *)(v3 + 40), 0x204uLL);
  uint64_t v155 = *((void *)&__dst[1] + 1);
  uint64_t v122 = *(void *)&__dst[2];
  uint64_t v123 = *(void *)&__dst[1];
  uint64_t v156 = *((void *)&__dst[2] + 1);
  uint64_t v157 = *((void *)&__dst[3] + 1);
  uint64_t v120 = *(void *)&__dst[4];
  uint64_t v121 = *(void *)&__dst[3];
  uint64_t v166 = *((void *)&__dst[4] + 1);
  uint64_t v167 = *((void *)&__dst[5] + 1);
  uint64_t v165 = (id)*((void *)&__dst[6] + 1);
  uint64_t v126 = *((void *)&__dst[9] + 1);
  long long v57 = __dst[10];
  uint64_t v164 = *(void *)&__dst[11];
  uint64_t v124 = *(void *)&__dst[5];
  uint64_t v125 = *((void *)&__dst[11] + 1);
  uint64_t v153 = *((void *)&__dst[25] + 1);
  uint64_t v152 = *((void *)&__dst[26] + 1);
  uint64_t v147 = *(void *)&__dst[27];
  uint64_t v148 = *(void *)&__dst[26];
  uint64_t v151 = *((void *)&__dst[27] + 1);
  uint64_t v150 = *((void *)&__dst[28] + 1);
  uint64_t v133 = *(void *)&__dst[29];
  uint64_t v145 = *(void *)&__dst[30];
  uint64_t v146 = *(void *)&__dst[28];
  uint64_t v143 = *(void *)&__dst[31];
  uint64_t v144 = *((void *)&__dst[30] + 1);
  uint64_t v131 = *((void *)&__dst[31] + 1);
  uint64_t v132 = *((void *)&__dst[29] + 1);
  uint64_t v130 = __dst[32];
  uint64_t v154 = *(void *)&__dst[12];
  uint64_t v141 = *(void *)&__dst[21];
  uint64_t v142 = *((void *)&__dst[20] + 1);
  uint64_t v139 = *(void *)&__dst[22];
  uint64_t v140 = *((void *)&__dst[21] + 1);
  uint64_t v136 = *(void *)&__dst[20];
  uint64_t v137 = *((void *)&__dst[22] + 1);
  uint64_t v162 = *((void *)&__dst[23] + 1);
  uint64_t v138 = *(void *)&__dst[23];
  uint64_t v160 = *(void *)&__dst[24];
  uint64_t v58 = *(void *)&__dst[25];
  uint64_t v149 = *(void *)&__dst[25];
  uint64_t v158 = *((void *)&__dst[24] + 1);
  memcpy(v194, (const void *)(v3 + 40), sizeof(v194));
  uint64_t v193 = __dst[6];
  v192[0] = *(void *)((char *)&__dst[6] + 1);
  *(void *)((char *)v192 + 7) = *((void *)&__dst[6] + 1);
  v191[0] = *(_OWORD *)((char *)&__dst[7] + 1);
  *(_OWORD *)((char *)v191 + 15) = __dst[8];
  memcpy(v190, (char *)&__dst[9] + 8, sizeof(v190));
  memcpy(v189, &__dst[25], sizeof(v189));
  __src = (void *)v3;
  uint64_t v134 = *(unsigned __int8 *)(v3 + 1136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v59 = v165;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of ConnectionPolicyRoute?(v58, v153);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v60 = v165;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of ConnectionPolicyRoute?(v149, v153);
  outlined retain of ConnectionConfiguration(__dst);
  if (v134)
  {
    uint64_t v61 = v162;
    uint64_t v62 = v160;
    uint64_t v63 = v158;
  }
  else
  {
    outlined consume of ConnectionPolicy?(v136, v142, v141, v140, v139, v137, v138, v162, v160, v158);
    uint64_t v136 = 0;
    uint64_t v137 = 0;
    uint64_t v141 = 0;
    uint64_t v142 = 0;
    uint64_t v139 = 0;
    uint64_t v140 = 0;
    uint64_t v138 = 0;
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    uint64_t v63 = 0;
  }
  char v64 = BYTE2(__dst[6]);
  uint64_t v163 = v61;
  uint64_t v161 = v62;
  uint64_t v159 = v63;
  if (BYTE2(__dst[6]))
  {
    char v65 = __dst[6];
  }
  else
  {
    char v65 = 1;
    uint64_t v193 = 1;
  }
  long long v66 = __dst[0];
  unsigned int v100 = BYTE1(__dst[6]);
  uint64_t v101 = BYTE3(__dst[6]);
  uint64_t v135 = BYTE1(__dst[7]);
  uint64_t v104 = BYTE2(__dst[7]);
  Class v103 = *((void *)&__dst[7] + 1);
  uint64_t v102 = __dst[8];
  uint64_t v67 = *((void *)&__dst[8] + 1);
  uint64_t v117 = BYTE8(__dst[12]);
  uint64_t v116 = BYTE9(__dst[12]);
  long long v115 = *(void *)&__dst[13];
  id v114 = BYTE8(__dst[13]);
  id v113 = *(void *)&__dst[14];
  id v112 = BYTE8(__dst[14]);
  id v111 = *(void *)&__dst[15];
  id v110 = BYTE8(__dst[15]);
  char v68 = BYTE8(__dst[16]);
  uint64_t v108 = *(void *)&__dst[17];
  id v109 = *(void *)&__dst[16];
  char v69 = BYTE8(__dst[17]);
  char v70 = BYTE8(__dst[18]);
  id v106 = *(void *)&__dst[19];
  long long v107 = *(void *)&__dst[18];
  char v71 = BYTE8(__dst[19]);
  long long v105 = BYTE9(__dst[19]);
  uint64_t v119 = BYTE2(__dst[32]);
  BOOL v72 = *(unsigned char *)(v3 + 1136) == 3;
  uint64_t v118 = BYTE3(__dst[32]);
  id v96 = ConnectionMethod.providerClass(for:)(*(uint64_t *)&__dst[0]);
  id v97 = v73;
  v188[96] = v65;
  *(void *)&v188[144] = 0x4056800000000000;
  uint64_t v92 = v69;
  uint64_t v93 = v68;
  v188[264] = v68;
  v188[280] = v69;
  uint64_t v91 = v71;
  v188[296] = v70;
  v188[312] = v71;
  *(_OWORD *)uint64_t v188 = v66;
  *(void *)&v188[16] = v123;
  *(void *)&v188[24] = v155;
  *(void *)&v188[32] = v122;
  *(void *)&v188[40] = v156;
  *(void *)&v188[48] = v121;
  *(void *)&v188[56] = v157;
  *(void *)&v188[64] = v120;
  *(void *)&v188[72] = v166;
  *(void *)&v188[80] = v124;
  *(void *)&v188[88] = v167;
  v188[97] = v100;
  v188[98] = v64;
  v188[99] = v101;
  *(void *)&v188[104] = v165;
  v188[112] = v72;
  v188[113] = v135;
  v188[114] = v104;
  *(void *)&v188[120] = v103;
  v188[128] = v102;
  *(void *)&v188[136] = v67;
  *(void *)&v188[152] = v126;
  *(_OWORD *)&v188[160] = v57;
  *(void *)&v188[176] = v164;
  *(void *)&v188[184] = v125;
  *(void *)&v188[192] = v154;
  v188[200] = v117;
  v188[201] = v116;
  *(void *)&v188[208] = v115;
  v188[216] = v114;
  *(void *)&v188[224] = v113;
  v188[232] = v112;
  *(void *)&v188[240] = v111;
  v188[248] = v110;
  *(void *)&v188[256] = v109;
  *(void *)&v188[272] = v108;
  *(void *)&v188[288] = v107;
  *(void *)&v188[304] = v106;
  v188[313] = v105;
  *(void *)&v188[320] = v136;
  *(void *)&v188[328] = v142;
  *(void *)&v188[336] = v141;
  *(void *)&v188[344] = v140;
  *(void *)&v188[352] = v139;
  *(void *)&v188[360] = v137;
  *(void *)&v188[368] = v138;
  *(void *)&v188[376] = v163;
  *(void *)&v188[384] = v161;
  *(void *)&v188[392] = v159;
  *(void *)&v188[400] = v149;
  *(void *)&v188[408] = v153;
  *(void *)&v188[416] = v148;
  *(void *)&v188[424] = v152;
  *(void *)&v188[432] = v147;
  *(void *)&v188[440] = v151;
  *(void *)&v188[448] = v146;
  *(void *)&v188[456] = v150;
  *(void *)&v188[464] = v133;
  *(void *)&v188[472] = v132;
  *(void *)&v188[480] = v145;
  *(void *)&v188[488] = v144;
  *(void *)&v188[496] = v143;
  *(void *)&v188[504] = v131;
  *(_WORD *)&v188[512] = v130;
  v188[514] = v119;
  v188[515] = v118;
  outlined retain of ConnectionConfiguration(v188);
  outlined consume of ConnectionPolicyRoute?(v149, v153);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(v187, v188, sizeof(v187));
  uint64_t v74 = (void *)__src[143];
  uint64_t v75 = (void *)__src[147];
  uint64_t v76 = *(uint64_t (**)(unsigned char *, id, void *, void *, uint64_t, uint64_t))(v97 + 448);
  id v77 = v74;
  uint64_t v78 = v76(v187, v94, v74, v75, v96, v97);
  __src[135] = v78;
  __src[136] = v97;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v186 = 0;
  outlined init with copy of NetworkConnectionProtocol?(v98, (uint64_t)v187, &demangling cache variable for type metadata for CommunicationProtocol?);
  if (*(void *)&v187[24])
  {
    outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v187, (uint64_t)v168);
    outlined destroy of CommunicationProtocol?((uint64_t)v187, &demangling cache variable for type metadata for CommunicationProtocol?);
    uint64_t v79 = v168[3];
    uint64_t v80 = v168[4];
    __swift_project_boxed_opaque_existential_1(v168, v168[3]);
    char v81 = v135;
    uint64_t v99 = (void *)(*(uint64_t (**)(uint64_t *, void, uint64_t, uint64_t))(v80 + 96))(&v186, v135, v79, v80);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v168);
  }
  else
  {
    outlined destroy of CommunicationProtocol?((uint64_t)v187, &demangling cache variable for type metadata for CommunicationProtocol?);
    uint64_t v99 = 0;
    char v81 = v135;
  }
  long long v82 = *(void (**)(void *, _UNKNOWN **, uint64_t, uint64_t))(v97 + 128);
  swift_retain();
  swift_unknownObjectRetain();
  v82(__src, &protocol witness table for BackgroundConnection, v96, v97);
  swift_unknownObjectRelease();
  uint64_t v83 = MEMORY[0x2611B37F0](__src + 2);
  if (v83)
  {
    uint64_t v84 = v83;
    char v85 = v81;
    uint64_t v86 = *(void (**)(unsigned char *__return_ptr, uint64_t, uint64_t))(v97 + 168);
    swift_unknownObjectRetain();
    v86(v187, v96, v97);
    char v81 = v85;
    swift_unknownObjectRelease();
    specialized Connection.willStartConnection(_:type:)((uint64_t)__src, v187[0], v84);
    swift_unknownObjectRelease();
  }
  double v95 = swift_allocObject();
  swift_weakInit();
  *(_OWORD *)uint64_t v187 = v66;
  *(void *)&v187[16] = v123;
  *(void *)&v187[32] = v122;
  *(void *)&v187[48] = v121;
  *(void *)&v187[64] = v120;
  *(void *)&v187[72] = v166;
  *(void *)&v187[80] = v124;
  *(void *)&v187[24] = v155;
  *(void *)&v187[40] = v156;
  *(void *)&v187[56] = v157;
  *(void *)&v187[88] = v167;
  v187[96] = v193;
  v187[97] = v100;
  v187[98] = v64;
  v187[99] = v101;
  *(void *)&v187[104] = v165;
  v187[112] = v72;
  v187[113] = v81;
  v187[114] = v104;
  *(void *)&v187[120] = v103;
  v187[128] = v102;
  *(void *)&v187[136] = v67;
  *(void *)&v187[144] = 0x4056800000000000;
  *(void *)&v187[152] = v126;
  *(_OWORD *)&v187[160] = v57;
  *(void *)&v187[176] = v164;
  *(void *)&v187[184] = v125;
  *(void *)&v187[192] = v154;
  v187[200] = v117;
  v187[201] = v116;
  *(void *)&v187[208] = v115;
  v187[216] = v114;
  *(void *)&v187[224] = v113;
  v187[232] = v112;
  *(void *)&v187[240] = v111;
  v187[248] = v110;
  v187[264] = v93;
  *(void *)&v187[256] = v109;
  *(void *)&v187[272] = v108;
  v187[280] = v92;
  v187[296] = v70;
  *(void *)&v187[288] = v107;
  *(void *)&v187[304] = v106;
  v187[312] = v91;
  v187[313] = v105;
  *(void *)&v187[320] = v136;
  *(void *)&v187[328] = v142;
  *(void *)&v187[336] = v141;
  *(void *)&v187[344] = v140;
  *(void *)&v187[352] = v139;
  *(void *)&v187[360] = v137;
  *(void *)&v187[368] = v138;
  *(void *)&v187[376] = v163;
  *(void *)&v187[384] = v161;
  *(void *)&v187[392] = v159;
  *(void *)&v187[400] = v149;
  *(void *)&v187[408] = v153;
  *(void *)&v187[416] = v148;
  *(void *)&v187[424] = v152;
  *(void *)&v187[432] = v147;
  *(void *)&v187[440] = v151;
  *(void *)&v187[448] = v146;
  *(void *)&v187[456] = v150;
  *(void *)&v187[464] = v133;
  *(void *)&v187[472] = v132;
  *(void *)&v187[480] = v145;
  *(void *)&v187[488] = v144;
  *(void *)&v187[496] = v143;
  *(void *)&v187[504] = v131;
  *(_WORD *)&v187[512] = v130;
  v187[514] = v119;
  v187[515] = v118;
  memcpy(v198, v187, sizeof(v198));
  __srca = v99;
  swift_unknownObjectRetain_n();
  swift_retain();
  swift_retain();
  outlined retain of ConnectionConfiguration(v187);
  outlined consume of ConnectionPolicyRoute?(v149, v153);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v87 = v186;
  uint64_t v88 = (void *)swift_allocObject();
  v88[2] = v95;
  v88[3] = v78;
  v88[4] = v97;
  v88[5] = v129;
  memcpy(v88 + 6, v198, 0x204uLL);
  v88[71] = v99;
  v88[72] = v87;
  (*(void (**)(void *, void (*)(uint64_t), void *, uint64_t, uint64_t, uint64_t, uint64_t))(v97 + 456))(v99, partial apply for specialized closure #2 in BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:), v88, v96, v97, v89, v90);

  swift_release();
  swift_release();
  swift_unknownObjectRelease_n();
  memcpy(v168, v194, sizeof(v168));
  uint64_t v169 = v193;
  *(void *)uint64_t v170 = v192[0];
  *(void *)&v170[7] = *(void *)((char *)v192 + 7);
  uint64_t v171 = v72;
  *(_OWORD *)uint64_t v172 = v191[0];
  *(_OWORD *)&v172[15] = *(_OWORD *)((char *)v191 + 15);
  uint64_t v173 = 0x4056800000000000;
  memcpy(v174, v190, sizeof(v174));
  uint64_t v175 = v136;
  uint64_t v176 = v142;
  uint64_t v177 = v141;
  uint64_t v178 = v140;
  uint64_t v179 = v139;
  uint64_t v180 = v137;
  uint64_t v181 = v138;
  uint64_t v182 = v163;
  uint64_t v183 = v161;
  uint64_t v184 = v159;
  memcpy(v185, v189, sizeof(v185));
  outlined release of ConnectionConfiguration(v168);
  swift_release();
}

void specialized closure #2 in BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = *(void *)(a1 + 8);
  unint64_t v13 = *(void *)(a1 + 24);
  uint64_t v66 = *(void *)(a1 + 16);
  uint64_t v67 = *(void **)a1;
  uint64_t v14 = *(void **)(a1 + 32);
  char v15 = *(unsigned char *)(a1 + 40);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v17 = Strong;
    id v60 = v14;
    uint64_t v61 = v12;
    siri_kdebug_trace_0(321);
    uint64_t v18 = *(void *)(v17 + 1080);
    if (v18 && (uint64_t v19 = *(void *)(v17 + 1088), v20 = swift_getObjectType(), v18 == a3))
    {
      if (v15)
      {
        uint64_t v26 = v66;
        long long v25 = v67;
        long long v27 = v60;
        v73[0] = v67;
        v73[1] = v61;
        v73[2] = v66;
        unint64_t v74 = v13;
        uint64_t v75 = v60;
        outlined copy of NetworkConnectionError(v67, v61, v66, v13, v60);
        if (AFDeviceSupportsSiriUOD() && (v13 & 0xF000000000000000) == 0x1000000000000000)
        {
          if (one-time initialization token for siriNetwork != -1) {
            swift_once();
          }
          uint64_t v28 = type metadata accessor for Logger();
          __swift_project_value_buffer(v28, (uint64_t)static Logger.siriNetwork);
          outlined copy of NetworkConnectionError(v67, v61, v66, v13, v60);
          outlined copy of NetworkConnectionError(v67, v61, v66, v13, v60);
          long long v29 = Logger.logObject.getter();
          os_log_type_t v30 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v29, v30))
          {
            long long v31 = (uint8_t *)swift_slowAlloc();
            long long v32 = (void *)swift_slowAlloc();
            bufa = v31;
            *(_DWORD *)long long v31 = 138412290;
            lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
            swift_allocError();
            outlined init with take of NetworkConnectionError((uint64_t)v73, v33);
            outlined copy of NetworkConnectionError(v67, v61, v66, v13, v60);
            v70[0] = _swift_stdlib_bridgeErrorToNSError();
            uint64_t v26 = v66;
            long long v25 = v67;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *long long v32 = v70[0];
            outlined consume of Result<(), NetworkConnectionError>(v67, v61, v66, v13, v60, 1);
            outlined consume of Result<(), NetworkConnectionError>(v67, v61, v66, v13, v60, 1);
            _os_log_impl(&dword_25D6CC000, v29, v30, "Background Connection - Provider: Connection failed. Error: (%@), but device support UOD.", bufa, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            swift_arrayDestroy();
            MEMORY[0x2611B3750](v32, -1, -1);
            MEMORY[0x2611B3750](bufa, -1, -1);
          }
          else
          {
            outlined consume of Result<(), NetworkConnectionError>(v67, v61, v66, v13, v60, 1);
            outlined consume of Result<(), NetworkConnectionError>(v67, v61, v66, v13, v60, 1);
          }

          lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
          uint64_t v56 = (void *)swift_allocError();
          outlined init with take of NetworkConnectionError((uint64_t)v73, v57);
          outlined copy of NetworkConnectionError(v25, v61, v26, v13, v60);
          BackgroundConnection.didEncounterError(_:)(v56);
          outlined consume of Result<(), NetworkConnectionError>(v25, v61, v26, v13, v60, 1);

          *(unsigned char *)(v17 + 1187) = 0;
        }
        else
        {
          if (*(void *)(v17 + 1080))
          {
            uint64_t v45 = *(void *)(v17 + 1088);
            uint64_t ObjectType = swift_getObjectType();
            uint64_t v47 = *(void (**)(void, void, uint64_t, uint64_t))(v45 + 184);
            swift_unknownObjectRetain();
            uint64_t v48 = ObjectType;
            long long v25 = v67;
            v47(0, 0, v48, v45);
            swift_unknownObjectRelease();
          }
          if (one-time initialization token for siriNetwork != -1) {
            swift_once();
          }
          uint64_t v49 = type metadata accessor for Logger();
          __swift_project_value_buffer(v49, (uint64_t)static Logger.siriNetwork);
          outlined copy of Result<(), NetworkConnectionError>(v25, v61, v66, v13, v60, 1);
          swift_retain();
          outlined copy of Result<(), NetworkConnectionError>(v25, v61, v66, v13, v60, 1);
          swift_retain();
          uint64_t v50 = Logger.logObject.getter();
          os_log_type_t v51 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v50, v51))
          {
            uint64_t v52 = swift_slowAlloc();
            bufb = (uint8_t *)swift_slowAlloc();
            char v69 = bufb;
            *(_DWORD *)uint64_t v52 = 136315394;
            outlined init with take of NetworkConnectionError((uint64_t)v73, (uint64_t)v70);
            outlined copy of NetworkConnectionError(v25, v61, v66, v13, v60);
            uint64_t v53 = String.init<A>(describing:)();
            v70[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v53, v54, (uint64_t *)&v69);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            uint64_t v26 = v66;
            swift_bridgeObjectRelease();
            outlined consume of Result<(), NetworkConnectionError>(v25, v61, v66, v13, v60, 1);
            outlined consume of Result<(), NetworkConnectionError>(v25, v61, v66, v13, v60, 1);
            *(_WORD *)(v52 + 12) = 1024;
            int v55 = *(unsigned __int8 *)(v17 + 1186);
            swift_release();
            LODWORD(v70[0]) = v55;
            long long v27 = v60;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_release();
            _os_log_impl(&dword_25D6CC000, v50, v51, "Background Connection - Provider. Connection failed. Error: %s. Connection was Cancelled: %{BOOL}d", (uint8_t *)v52, 0x12u);
            swift_arrayDestroy();
            MEMORY[0x2611B3750](bufb, -1, -1);
            MEMORY[0x2611B3750](v52, -1, -1);
          }
          else
          {
            swift_release();
            outlined consume of Result<(), NetworkConnectionError>(v25, v61, v66, v13, v60, 1);
            outlined consume of Result<(), NetworkConnectionError>(v25, v61, v66, v13, v60, 1);

            swift_release();
          }
          if ((*(unsigned char *)(v17 + 1186) & 1) == 0)
          {
            lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
            uint64_t v58 = (void *)swift_allocError();
            outlined init with take of NetworkConnectionError((uint64_t)v73, v59);
            swift_allocObject();
            swift_beginAccess();
            swift_weakLoadStrong();
            swift_weakInit();
            outlined copy of NetworkConnectionError(v67, v61, v26, v13, v27);
            swift_release();
            outlined copy of Result<(), NetworkConnectionError>(v67, v61, v26, v13, v27, 1);
            swift_retain();
            outlined copy of Result<(), NetworkConnectionError>(v67, v61, v26, v13, v27, 1);
            swift_retain();
            specialized BackgroundConnection.fallbackToNextConnectionMethodWithError(_:with:)();
            swift_release();
            swift_release();
            outlined consume of Result<(), NetworkConnectionError>(v67, v61, v26, v13, v27, 1);
            swift_release();

            outlined consume of Result<(), NetworkConnectionError>(v67, v61, v26, v13, v27, 1);
            return;
          }
          outlined consume of Result<(), NetworkConnectionError>(v67, v61, v26, v13, v27, 1);
        }
      }
      else
      {
        uint64_t v68 = v20;
        uint64_t v34 = a5 + 16;
        uint64_t v35 = swift_getObjectType();
        long long v36 = *(void (**)(void, void, uint64_t, uint64_t))(v19 + 184);
        swift_unknownObjectRetain();
        v36(0, 0, v35, v19);
        swift_unknownObjectRelease();
        if (one-time initialization token for siriNetwork != -1) {
          swift_once();
        }
        uint64_t v37 = type metadata accessor for Logger();
        __swift_project_value_buffer(v37, (uint64_t)static Logger.siriNetwork);
        long long v38 = Logger.logObject.getter();
        os_log_type_t v39 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v38, v39))
        {
          long long v40 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)long long v40 = 0;
          _os_log_impl(&dword_25D6CC000, v38, v39, "Background Connection - Provider. Connection ready.", v40, 2u);
          MEMORY[0x2611B3750](v40, -1, -1);
        }

        swift_beginAccess();
        outlined init with copy of RPCOspreyConnectionProtocol(v34, (uint64_t)v73);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol);
        type metadata accessor for CommunicationProtocolAce();
        if (swift_dynamicCast())
        {
          char v41 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 544))(v68, a4);
          double v42 = 5.0;
          if ((v41 & 1) == 0)
          {
            double v42 = 7.0;
            if (*(unsigned char *)(v17 + 1136) == 3)
            {
              double v42 = *(double *)(a6 + 120);
              if (*(unsigned char *)(a6 + 128)) {
                double v42 = -1.0;
              }
            }
          }
          CommunicationProtocolAce.scheduleAceHeaderTimeout(withInterval:)(v42);
          swift_release();
        }
        swift_beginAccess();
        outlined init with copy of NetworkConnectionProtocol?(v17 + 1096, (uint64_t)v73, &demangling cache variable for type metadata for CommunicationProtocol?);
        if (v74)
        {
          outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v73, (uint64_t)v70);
          outlined destroy of CommunicationProtocol?((uint64_t)v73, &demangling cache variable for type metadata for CommunicationProtocol?);
          uint64_t v43 = v71;
          uint64_t v44 = v72;
          __swift_project_boxed_opaque_existential_1(v70, v71);
          (*(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v44 + 104))(a7, a8, *(unsigned __int8 *)(v17 + 153), v43, v44);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v70);
        }
        else
        {
          outlined destroy of CommunicationProtocol?((uint64_t)v73, &demangling cache variable for type metadata for CommunicationProtocol?);
        }
        BackgroundConnection.setupReadHandlerOnProvider()();
        BackgroundConnection.networkProviderDidOpen()();
      }
    }
    else
    {
      if (one-time initialization token for siriNetwork != -1) {
        swift_once();
      }
      uint64_t v21 = type metadata accessor for Logger();
      __swift_project_value_buffer(v21, (uint64_t)static Logger.siriNetwork);
      os_log_type_t v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl(&dword_25D6CC000, v22, v23, "Background Connection - Provider. Connection open ignored for stale connection.", v24, 2u);
        MEMORY[0x2611B3750](v24, -1, -1);
        swift_release();

        return;
      }
    }
    swift_release();
  }
}

uint64_t closure #1 in closure #2 in BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)a1;
  unint64_t v4 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v6 = *(void *)(a1 + 24);
  os_log_type_t v8 = *(void **)(a1 + 32);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (v4 >> 1 != 0xFFFFFFFF || v6 >= 2)
    {
      if (one-time initialization token for siriNetwork != -1) {
        swift_once();
      }
      uint64_t v11 = type metadata accessor for Logger();
      __swift_project_value_buffer(v11, (uint64_t)static Logger.siriNetwork);
      outlined copy of NetworkConnectionError?(v5, v4, v7, v6, v8);
      outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
      outlined copy of NetworkConnectionError?(v5, v4, v7, v6, v8);
      outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
      uint64_t v12 = Logger.logObject.getter();
      os_log_type_t v13 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = swift_slowAlloc();
        uint64_t v21 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v14 = 138412546;
        lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
        swift_allocError();
        os_log_type_t type = v13;
        *char v15 = v5;
        v15[1] = v4;
        void v15[2] = v7;
        v15[3] = v6;
        v15[4] = v8;
        outlined copy of NetworkConnectionError(v5, v4, v7, v6, v8);
        uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v21 = v16;
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        *(_WORD *)(v14 + 12) = 2112;
        swift_allocError();
        outlined init with take of NetworkConnectionError((uint64_t)a3, v17);
        outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
        uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        v21[1] = v22;
        outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
        outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
        _os_log_impl(&dword_25D6CC000, v12, type, "Background Connection - Fallback: Callback to Completion with error %@ for Open Connection error (%@)", (uint8_t *)v14, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x2611B3750](v21, -1, -1);
        MEMORY[0x2611B3750](v14, -1, -1);
      }
      else
      {
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
        outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
      }

      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      uint64_t v18 = (void *)swift_allocError();
      outlined init with take of NetworkConnectionError((uint64_t)a3, v19);
      outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
      BackgroundConnection.didEncounterError(_:)(v18);

      BackgroundConnection.cancel()();
    }
    return swift_release();
  }
  return result;
}

void BackgroundConnection.startSecondaryConnection()()
{
  OUTLINED_FUNCTION_14_7();
  uint64_t v113 = v1;
  uint64_t v114 = v2;
  if (!*(unsigned char *)(v0 + 1184))
  {
    uint64_t v3 = v0;
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    uint64_t v5 = (void *)OUTLINED_FUNCTION_7(v4, (uint64_t)static Logger.siriNetwork);
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (OUTLINED_FUNCTION_2_17(v6))
    {
      *(_WORD *)OUTLINED_FUNCTION_2_0() = 0;
      OUTLINED_FUNCTION_1_21(&dword_25D6CC000, v7, v8, "Background Connection - Provider. Secondary connection started.");
      OUTLINED_FUNCTION_1_2();
    }

    ConnectionMethod.providerClass(for:)(*(void *)(v3 + 40));
    uint64_t v10 = v9;
    memcpy(__dst, (const void *)(v3 + 40), 0x204uLL);
    uint64_t v82 = __dst[0];
    uint64_t v83 = __dst[1];
    uint64_t v84 = __dst[2];
    uint64_t v85 = __dst[3];
    uint64_t v86 = __dst[4];
    uint64_t v87 = __dst[5];
    uint64_t v88 = __dst[6];
    uint64_t v11 = __dst[9];
    uint64_t v12 = __dst[17];
    uint64_t v13 = __dst[18];
    char v98 = __dst[33];
    LOBYTE(__src[33]) = __dst[33];
    char v96 = __dst[35];
    LOBYTE(__src[35]) = __dst[35];
    char v94 = __dst[37];
    LOBYTE(__src[37]) = __dst[37];
    LOWORD(__src[39]) = __dst[39];
    char v92 = __dst[39];
    char v108 = __dst[16];
    LOBYTE(__src[16]) = __dst[16];
    char v104 = __dst[27];
    LOBYTE(__src[27]) = __dst[27];
    char v102 = __dst[29];
    LOBYTE(__src[29]) = __dst[29];
    char v100 = __dst[31];
    LOBYTE(__src[31]) = __dst[31];
    char v14 = *(unsigned char *)(v3 + 656);
    __src[0] = __dst[0];
    __src[1] = __dst[1];
    __src[2] = __dst[2];
    __src[3] = __dst[3];
    __src[4] = __dst[4];
    __src[5] = __dst[5];
    __src[6] = __dst[6];
    uint64_t v34 = __dst[7];
    uint64_t v35 = __dst[8];
    __src[7] = __dst[7];
    __src[8] = __dst[8];
    uint64_t v36 = __dst[10];
    __src[9] = __dst[9];
    __src[10] = __dst[10];
    uint64_t v37 = __dst[11];
    __src[11] = __dst[11];
    char v28 = v14;
    LOBYTE(__src[12]) = v14;
    char v46 = BYTE1(__dst[12]);
    char v47 = BYTE2(__dst[12]);
    *(_WORD *)((char *)&__src[12] + 1) = *(_WORD *)((char *)&__dst[12] + 1);
    char v48 = BYTE3(__dst[12]);
    char v49 = BYTE2(__dst[14]);
    BYTE3(__src[12]) = BYTE3(__dst[12]);
    uint64_t v52 = __dst[13];
    __src[13] = __dst[13];
    LOBYTE(__src[14]) = 0;
    char v51 = BYTE1(__dst[14]);
    *(_WORD *)((char *)&__src[14] + 1) = *(_WORD *)((char *)&__dst[14] + 1);
    uint64_t v50 = __dst[15];
    __src[15] = __dst[15];
    __src[17] = __dst[17];
    __src[18] = __dst[18];
    uint64_t v44 = __dst[20];
    uint64_t v45 = __dst[19];
    __src[19] = __dst[19];
    __src[20] = __dst[20];
    uint64_t v42 = __dst[22];
    uint64_t v43 = __dst[21];
    __src[21] = __dst[21];
    __src[22] = __dst[22];
    uint64_t v40 = __dst[24];
    uint64_t v41 = __dst[23];
    __src[23] = __dst[23];
    __src[24] = __dst[24];
    char v38 = BYTE1(__dst[25]);
    char v39 = __dst[25];
    LOWORD(__src[25]) = __dst[25];
    uint64_t v15 = __dst[26];
    __src[26] = __dst[26];
    uint64_t v33 = __dst[28];
    __src[28] = __dst[28];
    uint64_t v32 = __dst[30];
    __src[30] = __dst[30];
    uint64_t v30 = __dst[34];
    uint64_t v31 = __dst[32];
    __src[32] = __dst[32];
    __src[34] = __dst[34];
    uint64_t v29 = __dst[36];
    __src[36] = __dst[36];
    uint64_t v53 = __dst[38];
    __src[38] = __dst[38];
    char v79 = BYTE1(__dst[39]);
    uint64_t v64 = __dst[40];
    __src[40] = __dst[40];
    uint64_t v75 = __dst[41];
    __src[41] = __dst[41];
    uint64_t v63 = __dst[42];
    __src[42] = __dst[42];
    uint64_t v74 = __dst[43];
    __src[43] = __dst[43];
    uint64_t v62 = __dst[44];
    __src[44] = __dst[44];
    uint64_t v73 = __dst[45];
    __src[45] = __dst[45];
    uint64_t v61 = __dst[46];
    __src[46] = __dst[46];
    uint64_t v72 = __dst[47];
    __src[47] = __dst[47];
    uint64_t v60 = __dst[48];
    __src[48] = __dst[48];
    uint64_t v71 = __dst[49];
    __src[49] = __dst[49];
    uint64_t v59 = __dst[50];
    __src[50] = __dst[50];
    uint64_t v70 = __dst[51];
    __src[51] = __dst[51];
    uint64_t v58 = __dst[52];
    __src[52] = __dst[52];
    uint64_t v69 = __dst[53];
    __src[53] = __dst[53];
    uint64_t v57 = __dst[54];
    __src[54] = __dst[54];
    uint64_t v68 = __dst[55];
    __src[55] = __dst[55];
    uint64_t v56 = __dst[56];
    __src[56] = __dst[56];
    uint64_t v67 = __dst[57];
    __src[57] = __dst[57];
    uint64_t v55 = __dst[58];
    __src[58] = __dst[58];
    uint64_t v66 = __dst[59];
    __src[59] = __dst[59];
    uint64_t v54 = __dst[60];
    __src[60] = __dst[60];
    uint64_t v65 = __dst[61];
    __src[61] = __dst[61];
    uint64_t v76 = __dst[62];
    uint64_t v77 = __dst[63];
    __src[62] = __dst[62];
    __src[63] = __dst[63];
    __int16 v78 = __dst[64];
    LODWORD(__src[64]) = __dst[64];
    char v80 = BYTE2(__dst[64]);
    char v81 = BYTE3(__dst[64]);
    memcpy(v89, __src, 0x204uLL);
    uint64_t v16 = *(void **)(v3 + 1144);
    uint64_t v17 = *(void **)(v3 + 1176);
    uint64_t v18 = *(uint64_t (**)(void *, id, void *, id))(v10 + 448);
    id v19 = *(id *)(v3 + 32);
    id v20 = v17;
    outlined retain of ConnectionConfiguration(__dst);
    outlined retain of ConnectionConfiguration(__src);
    id v21 = v16;
    *(void *)(v3 + 1160) = v18(v89, v19, v16, v20);
    *(void *)(v3 + 1168) = v10;
    swift_unknownObjectRelease();
    if (*(void *)(v3 + 1160))
    {
      uint64_t v22 = *(void *)(v3 + 1168);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v24 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v22 + 128);
      swift_unknownObjectRetain();
      uint64_t v25 = swift_retain();
      v24(v25, &protocol witness table for BackgroundConnection, ObjectType, v22);
      *(unsigned char *)(v3 + 1184) = 1;
      uint64_t v26 = OUTLINED_FUNCTION_23_2();
      swift_weakInit();
      long long v27 = *(void (**)(void, void (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v22 + 456);
      swift_retain();
      v27(0, partial apply for closure #1 in BackgroundConnection.startSecondaryConnection(), v26, ObjectType, v22);
      swift_unknownObjectRelease();
      swift_release();
      v89[0] = v82;
      v89[1] = v83;
      v89[2] = v84;
      v89[3] = v85;
      v89[4] = v86;
      v89[5] = v87;
      v89[6] = v88;
      v89[7] = v34;
      v89[8] = v35;
      v89[9] = v11;
      v89[10] = v36;
      v89[11] = v37;
      LOBYTE(v89[12]) = v28;
      BYTE1(v89[12]) = v46;
      BYTE2(v89[12]) = v47;
      BYTE3(v89[12]) = v48;
      v89[13] = v52;
      BYTE1(v89[14]) = v51;
      BYTE2(v89[14]) = v49;
      v89[15] = v50;
      v89[19] = v45;
      v89[20] = v44;
      v89[21] = v43;
      v89[22] = v42;
      v89[23] = v41;
      v89[24] = v40;
      LOBYTE(v89[25]) = v39;
      BYTE1(v89[25]) = v38;
      v89[26] = v15;
      v89[28] = v33;
      v89[30] = v32;
      v89[32] = v31;
      v89[34] = v30;
      v89[36] = v29;
      *(_DWORD *)((char *)&v89[16] + 1) = *(_DWORD *)v107;
      *(_DWORD *)((char *)&v89[25] + 2) = v105;
      HIDWORD(v89[27]) = *(_DWORD *)&v103[3];
      *(_DWORD *)((char *)&v89[27] + 1) = *(_DWORD *)v103;
      *(_DWORD *)((char *)&v89[29] + 1) = *(_DWORD *)v101;
      HIDWORD(v89[31]) = *(_DWORD *)&v99[3];
      *(_DWORD *)((char *)&v89[31] + 1) = *(_DWORD *)v99;
      *(_DWORD *)((char *)&v89[33] + 1) = *(_DWORD *)v97;
      *(_DWORD *)((char *)&v89[35] + 1) = *(_DWORD *)v95;
      *(_DWORD *)((char *)&v89[37] + 1) = *(_DWORD *)v93;
      *(_DWORD *)((char *)&v89[14] + 3) = v109;
      HIBYTE(v89[14]) = v110;
      LOBYTE(v89[16]) = v108;
      HIDWORD(v89[16]) = *(_DWORD *)&v107[3];
      HIWORD(v89[25]) = v106;
      LOBYTE(v89[27]) = v104;
      LOBYTE(v89[29]) = v102;
      HIDWORD(v89[29]) = *(_DWORD *)&v101[3];
      LOBYTE(v89[31]) = v100;
      LOBYTE(v89[33]) = v98;
      HIDWORD(v89[33]) = *(_DWORD *)&v97[3];
      LOBYTE(v89[35]) = v96;
      HIDWORD(v89[35]) = *(_DWORD *)&v95[3];
      LOBYTE(v89[37]) = v94;
      HIDWORD(v89[37]) = *(_DWORD *)&v93[3];
      LOBYTE(v89[14]) = 0;
      v89[17] = v12;
      v89[18] = v13;
      v89[38] = v53;
      LOBYTE(v89[39]) = v92;
      BYTE1(v89[39]) = v79;
      *(_DWORD *)((char *)&v89[39] + 2) = v90;
      HIWORD(v89[39]) = v91;
      v89[40] = v64;
      v89[41] = v75;
      v89[42] = v63;
      v89[43] = v74;
      v89[44] = v62;
      v89[45] = v73;
      v89[46] = v61;
      v89[47] = v72;
      v89[48] = v60;
      v89[49] = v71;
      v89[50] = v59;
      v89[51] = v70;
      v89[52] = v58;
      v89[53] = v69;
      v89[54] = v57;
      v89[55] = v68;
      v89[56] = v56;
      v89[57] = v67;
      v89[58] = v55;
      v89[59] = v66;
      v89[60] = v54;
      v89[61] = v65;
      v89[62] = v76;
      v89[63] = v77;
      LOWORD(v89[64]) = v78;
      BYTE2(v89[64]) = v80;
      BYTE3(v89[64]) = v81;
      outlined release of ConnectionConfiguration(v89);
      swift_release();
    }
    else
    {
      outlined release of ConnectionConfiguration(__src);
    }
  }
  OUTLINED_FUNCTION_23_5();
}

void closure #1 in BackgroundConnection.startSecondaryConnection()(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ConnectionAnalysisInfo?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void **)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 40);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v12 = Strong;
    siri_kdebug_trace_0(321);
    if (*(unsigned char *)(v12 + 1188))
    {
      if (one-time initialization token for siriNetwork != -1) {
        swift_once();
      }
      uint64_t v13 = type metadata accessor for Logger();
      __swift_project_value_buffer(v13, (uint64_t)static Logger.siriNetwork);
      char v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_25D6CC000, v14, v15, "Background Connection - Provider. Secondary connection ignored. Primary connection viable.", v16, 2u);
        MEMORY[0x2611B3750](v16, -1, -1);
      }

      BackgroundConnection.cancelSecondaryConnection()();
LABEL_8:
      swift_release();
      return;
    }
    if (v10)
    {
      outlined copy of NetworkConnectionError(v5, v6, v7, v8, v9);
      if (one-time initialization token for siriNetwork != -1) {
        swift_once();
      }
      uint64_t v17 = type metadata accessor for Logger();
      __swift_project_value_buffer(v17, (uint64_t)static Logger.siriNetwork);
      outlined copy of NetworkConnectionError(v5, v6, v7, v8, v9);
      outlined copy of NetworkConnectionError(v5, v6, v7, v8, v9);
      uint64_t v18 = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.error.getter();
      uint64_t v42 = v18;
      if (os_log_type_enabled(v18, v19))
      {
        id v20 = (uint8_t *)swift_slowAlloc();
        uint64_t v41 = swift_slowAlloc();
        char v47 = v9;
        uint64_t v48 = v41;
        *(_DWORD *)id v20 = 136315138;
        uint64_t v40 = v20 + 4;
        uint64_t v43 = (uint64_t)v5;
        uint64_t v44 = v6;
        uint64_t v45 = v7;
        unint64_t v46 = v8;
        outlined copy of NetworkConnectionError(v5, v6, v7, v8, v9);
        uint64_t v21 = String.init<A>(describing:)();
        uint64_t v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v48);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        outlined consume of Result<(), NetworkConnectionError>(v5, v6, v7, v8, v9, 1);
        outlined consume of Result<(), NetworkConnectionError>(v5, v6, v7, v8, v9, 1);
        os_log_type_t v23 = v42;
        _os_log_impl(&dword_25D6CC000, v42, v19, "Background Connection - Provider. Secondary connection failed. Error: %s", v20, 0xCu);
        uint64_t v24 = v41;
        swift_arrayDestroy();
        MEMORY[0x2611B3750](v24, -1, -1);
        MEMORY[0x2611B3750](v20, -1, -1);
      }
      else
      {
        outlined consume of Result<(), NetworkConnectionError>(v5, v6, v7, v8, v9, 1);
        outlined consume of Result<(), NetworkConnectionError>(v5, v6, v7, v8, v9, 1);
      }
      BackgroundConnection.cancelSecondaryConnection()();
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      uint64_t v35 = (void *)swift_allocError();
      *uint64_t v36 = v5;
      v36[1] = v6;
      v36[2] = v7;
      v36[3] = v8;
      v36[4] = v9;
      uint64_t v37 = (void *)swift_allocError();
      *(void *)(v38 + 8) = 0;
      *(void *)(v38 + 16) = 0;
      *(void *)uint64_t v38 = v35;
      *(_OWORD *)(v38 + 24) = xmmword_25D791760;
      outlined copy of Result<(), NetworkConnectionError>(v5, v6, v7, v8, v9, 1);
      id v39 = v35;
      BackgroundConnection.didEncounterError(_:)(v37);
      swift_release();

      outlined consume of Result<(), NetworkConnectionError>(v5, v6, v7, v8, v9, 1);
    }
    else
    {
      *(unsigned char *)(v12 + 1184) = 2;
      if (one-time initialization token for siriNetwork != -1) {
        swift_once();
      }
      uint64_t v25 = type metadata accessor for Logger();
      __swift_project_value_buffer(v25, (uint64_t)static Logger.siriNetwork);
      uint64_t v26 = Logger.logObject.getter();
      os_log_type_t v27 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v26, v27))
      {
        char v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v28 = 0;
        _os_log_impl(&dword_25D6CC000, v26, v27, "Background Connection - Provider. Secondary connection ready.", v28, 2u);
        MEMORY[0x2611B3750](v28, -1, -1);
      }

      uint64_t v29 = MEMORY[0x2611B37F0](v12 + 16);
      if (!v29) {
        goto LABEL_8;
      }
      uint64_t v30 = v29;
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      uint64_t v31 = (void *)swift_allocError();
      *(void *)(v32 + 8) = 0;
      *(void *)(v32 + 16) = 0;
      *(void *)uint64_t v32 = 0;
      *(_OWORD *)(v32 + 24) = xmmword_25D7917A0;
      uint64_t v33 = type metadata accessor for ConnectionAnalysisInfo();
      __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v33);
      uint64_t v34 = swift_retain();
      specialized Connection.didEncounterError(_:error:analysisInfo:)(v34, v31, (uint64_t)v4, v30);
      swift_unknownObjectRelease();
      swift_release_n();
      outlined destroy of CommunicationProtocol?((uint64_t)v4, &demangling cache variable for type metadata for ConnectionAnalysisInfo?);
    }
  }
}

void BackgroundConnection.cancelSecondaryConnection()()
{
  OUTLINED_FUNCTION_119_0();
  if (*(void *)(v0 + 1160))
  {
    uint64_t v1 = v0;
    uint64_t v2 = *(void *)(v0 + 1168);
    uint64_t v3 = one-time initialization token for siriNetwork;
    swift_unknownObjectRetain();
    if (v3 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    uint64_t v5 = (void *)OUTLINED_FUNCTION_7(v4, (uint64_t)static Logger.siriNetwork);
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (OUTLINED_FUNCTION_24_0(v6))
    {
      *(_WORD *)OUTLINED_FUNCTION_2_0() = 0;
      OUTLINED_FUNCTION_20_3(&dword_25D6CC000, v7, v8, "Background Connection - Provider. Secondary connection cancelled.");
      OUTLINED_FUNCTION_1_2();
    }

    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v2 + 472))(ObjectType, v2);
    swift_unknownObjectRelease();
    *(void *)(v1 + 1160) = 0;
    *(void *)(v1 + 1168) = 0;
    swift_unknownObjectRelease();
    *(unsigned char *)(v1 + 1184) = 0;
    *(unsigned char *)(v1 + 1189) = 0;
  }
  OUTLINED_FUNCTION_85_2();
}

Swift::Void __swiftcall BackgroundConnection.updateActiveBackgroundConnectionWithSecondary()()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)(v0 + 1080);
  BackgroundConnection.closeConnectionAndPrepareForReconnect(_:)(0);
  *(_OWORD *)(v0 + 1080) = *(_OWORD *)(v0 + 1160);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(v0 + 1168) = 0;
  *(void *)(v0 + 1160) = 0;
  swift_unknownObjectRelease();
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_7(v3, (uint64_t)static Logger.siriNetwork);
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (OUTLINED_FUNCTION_2_17(v5))
  {
    *(_WORD *)OUTLINED_FUNCTION_2_0() = 0;
    OUTLINED_FUNCTION_1_21(&dword_25D6CC000, v6, v7, "Background Connection - Provider. Secondary connection active.");
    OUTLINED_FUNCTION_1_2();
  }

  OUTLINED_FUNCTION_24_2();
  outlined init with copy of NetworkConnectionProtocol?(v1 + 1096, (uint64_t)v17, &demangling cache variable for type metadata for CommunicationProtocol?);
  if (v18)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol);
    type metadata accessor for CommunicationProtocolAce();
    if (swift_dynamicCast())
    {
      if (*v2)
      {
        uint64_t v8 = *(void *)(v1 + 1088);
        uint64_t ObjectType = swift_getObjectType();
        if ((*(uint64_t (**)(uint64_t, uint64_t))(v8 + 544))(ObjectType, v8)) {
          double v10 = 5.0;
        }
        else {
          double v10 = 7.0;
        }
        swift_unknownObjectRetain();
        CommunicationProtocolAce.scheduleAceHeaderTimeout(withInterval:)(v10);
        swift_release();
        swift_unknownObjectRelease();
      }
      else
      {
        swift_release();
      }
    }
  }
  else
  {
    outlined destroy of CommunicationProtocol?((uint64_t)v17, &demangling cache variable for type metadata for CommunicationProtocol?);
  }
  uint64_t v11 = outlined init with copy of NetworkConnectionProtocol?(v1 + 1096, (uint64_t)v17, &demangling cache variable for type metadata for CommunicationProtocol?);
  if (v18)
  {
    OUTLINED_FUNCTION_82_1(v11);
    outlined destroy of CommunicationProtocol?((uint64_t)v17, &demangling cache variable for type metadata for CommunicationProtocol?);
    uint64_t v12 = v15;
    uint64_t v13 = v16;
    __swift_project_boxed_opaque_existential_1(v14, v15);
    (*(void (**)(void, void, void, uint64_t, uint64_t))(v13 + 104))(0, 0, *(unsigned __int8 *)(v1 + 153), v12, v13);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  }
  else
  {
    outlined destroy of CommunicationProtocol?((uint64_t)v17, &demangling cache variable for type metadata for CommunicationProtocol?);
  }
  BackgroundConnection.setupReadHandlerOnProvider()();
  BackgroundConnection.networkProviderDidOpen()();
  *(unsigned char *)(v1 + 1184) = 0;
  *(_WORD *)(v1 + 1188) = 1;
}

void BackgroundConnection.networkProviderDidOpen()()
{
  OUTLINED_FUNCTION_14_7();
  uint64_t v34 = v1;
  uint64_t v35 = v2;
  if (*(unsigned char *)(v0 + 1185))
  {
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    oslog = OUTLINED_FUNCTION_7(v3, (uint64_t)static Logger.siriNetwork);
    os_log_type_t v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v4))
    {
      *(_WORD *)OUTLINED_FUNCTION_2_0() = 0;
      OUTLINED_FUNCTION_108_1(&dword_25D6CC000, v5, v6, "Background Connection - Provider. Provider ready received when it is already ready.", v7, v8, v9, v10, oslog);
      OUTLINED_FUNCTION_1_2();
    }
    OUTLINED_FUNCTION_23_5();
  }
  else
  {
    uint64_t v13 = v0;
    siri_kdebug_trace_0(322);
    *(unsigned char *)(v0 + 1185) = 1;
    *(unsigned char *)(v0 + 1188) = 1;
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AB0]), sel_init);
    objc_msgSend(v14, sel_systemUptime);
    uint64_t v16 = v15;

    *(void *)(v13 + 1208) = v16;
    OUTLINED_FUNCTION_22_0();
    outlined init with copy of NetworkConnectionProtocol?(v13 + 1096, (uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
    if (__dst[3])
    {
      outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)__dst, (uint64_t)v31);
      outlined destroy of CommunicationProtocol?((uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
      uint64_t v17 = v31[3];
      uint64_t v18 = v31[4];
      __swift_project_boxed_opaque_existential_1(v31, v31[3]);
      (*(void (**)(uint64_t, uint64_t))(v18 + 168))(v17, v18);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
    }
    else
    {
      outlined destroy of CommunicationProtocol?((uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
    }
    double v19 = *(double *)(v13 + 1208);
    double v20 = *(double *)(v13 + 1200);
    uint64_t v21 = MEMORY[0x2611B37F0](v13 + 16);
    if (v21)
    {
      uint64_t v22 = v21;
      if (*(void *)(v13 + 1080))
      {
        double v23 = v19 - v20;
        uint64_t v24 = *(void *)(v13 + 1088);
        swift_getObjectType();
        uint64_t v25 = *(void (**)(uint64_t))(v24 + 168);
        swift_unknownObjectRetain();
        uint64_t v26 = OUTLINED_FUNCTION_43_2();
        v25(v26);
        char v27 = v32[103];
        memcpy(__dst, (const void *)(v13 + 40), 0x204uLL);
        uint64_t v28 = __dst[51];
        if (__dst[51] == 1)
        {
          uint64_t v29 = 0;
          uint64_t v28 = 0;
        }
        else
        {
          uint64_t v29 = __dst[50];
          memcpy(v31, (const void *)(v13 + 40), 0x190uLL);
          v31[50] = __dst[50];
          v31[51] = __dst[51];
          memcpy(v32, &__dst[52], 0x64uLL);
          outlined retain of ConnectionConfiguration(__dst);
          swift_bridgeObjectRetain();
          outlined release of ConnectionConfiguration(v31);
        }
        specialized Connection.didOpenConnectionType(_:type:routeId:delay:)(v13, v27, v29, v28, v22, v23);
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    BackgroundConnection.tryToWriteBufferedOutputData(with:)(0, 0);
    OUTLINED_FUNCTION_23_5();
  }
}

void BackgroundConnection.sendData(_:with:)(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  outlined init with copy of Any(a1, (uint64_t)v24);
  uint64_t v6 = Data.init(instance:)(v24);
  if (v7 >> 60 == 15)
  {
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    int v9 = (void *)OUTLINED_FUNCTION_7(v8, (uint64_t)static Logger.siriNetwork);
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_9(v10))
    {
      *(_WORD *)OUTLINED_FUNCTION_2_0() = 0;
      OUTLINED_FUNCTION_3_0(&dword_25D6CC000, v11, v12, "Background Connection - Writter. Error, data nil");
      OUTLINED_FUNCTION_1_2();
    }

    if (a2)
    {
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_58_3(v13, 6);
      *(_OWORD *)(v14 + 24) = xmmword_25D790FF0;
      uint64_t v15 = (void *)OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_101_1((uint64_t)v15, v16);
      *(_OWORD *)(v17 + 24) = xmmword_25D791000;
      a2();
    }
  }
  else
  {
    uint64_t v18 = v6;
    unint64_t v19 = v7;
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v20 = type metadata accessor for Logger();
    __swift_project_value_buffer(v20, (uint64_t)static Logger.siriNetwork);
    outlined copy of Data._Representation(v18, v19);
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    if (OUTLINED_FUNCTION_18_4(v22))
    {
      double v23 = (uint8_t *)OUTLINED_FUNCTION_12_0();
      *(_DWORD *)double v23 = 134217984;
      v24[0] = Data.count.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      outlined consume of Data?(v18, v19);
      _os_log_impl(&dword_25D6CC000, v21, v3, "Background Connection - Writter. Send %ld bytes", v23, 0xCu);
      OUTLINED_FUNCTION_1_2();
    }
    else
    {
      outlined consume of Data?(v18, v19);
    }

    BackgroundConnection.bufferGeneralData(data:)();
    BackgroundConnection.tryToWriteBufferedOutputData(with:)(a2, a3);
    outlined consume of Data?(v18, v19);
  }
}

void BackgroundConnection.sendCommand(_:moreComing:with:)(void *a1, char a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v6 = v4;
  uint64_t v115 = *MEMORY[0x263EF8340];
  v113[0] = 0;
  id v11 = objc_msgSend(a1, sel_serializedAceDataError_, v113);
  id v12 = v113[0];
  if (!v11)
  {
    id v23 = v113[0];
    uint64_t v24 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    id v105 = (id)_convertErrorToNSError(_:)();
    id v25 = objc_msgSend(v105, sel_domain);
    uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v28 = v27;

    if (v26 == 0xD00000000000001CLL && v28 == 0x800000025D7972E0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v40 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v40 & 1) == 0) {
        goto LABEL_19;
      }
    }
    if (!objc_msgSend(v105, sel_code))
    {
      if (one-time initialization token for siriNetwork != -1) {
        swift_once();
      }
      uint64_t v69 = type metadata accessor for Logger();
      uint64_t v70 = OUTLINED_FUNCTION_7(v69, (uint64_t)static Logger.siriNetwork);
      os_log_type_t v71 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v70, v71))
      {
        uint64_t v72 = (uint8_t *)OUTLINED_FUNCTION_2_0();
        *(_WORD *)uint64_t v72 = 0;
        _os_log_impl(&dword_25D6CC000, v70, v71, "Background Connection - sendCommand. Got invalid error from Objective-C", v72, 2u);
        OUTLINED_FUNCTION_1_2();
      }

      if (a3) {
        ((void (*)(void))a3)(0);
      }
      goto LABEL_40;
    }
LABEL_19:
    char v108 = a3;
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v41 = type metadata accessor for Logger();
    __swift_project_value_buffer(v41, (uint64_t)static Logger.siriNetwork);
    swift_unknownObjectRetain();
    id v42 = v24;
    swift_unknownObjectRetain();
    id v43 = v24;
    uint64_t v44 = Logger.logObject.getter();
    os_log_type_t v45 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = swift_slowAlloc();
      char v47 = (void *)OUTLINED_FUNCTION_36_2();
      v113[0] = (id)OUTLINED_FUNCTION_10_0();
      *(_DWORD *)uint64_t v46 = 136315394;
      OUTLINED_FUNCTION_68_2();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SNSessionObject & SNThunking);
      uint64_t v48 = String.init<A>(describing:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v48, v49, (uint64_t *)v113);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_28_5();
      swift_bridgeObjectRelease();
      *(_WORD *)(v46 + 12) = 2112;
      id v50 = v24;
      v110[0] = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *char v47 = v110[0];

      _os_log_impl(&dword_25D6CC000, v44, v45, "Background Connection - sendCommand. Error sending %s, error: %@", (uint8_t *)v46, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1_2();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_1_2();
    }
    else
    {
      OUTLINED_FUNCTION_28_5();
    }
    if (v108)
    {
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      uint64_t v56 = OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_101_1(v56, v57);
      *(_OWORD *)(v58 + 24) = xmmword_25D791000;
      id v59 = v24;
      OUTLINED_FUNCTION_143();
      v108();

      goto LABEL_52;
    }
LABEL_40:

    return;
  }
  uint64_t v13 = v11;
  unint64_t v114 = type metadata accessor for OS_dispatch_data();
  v113[0] = v13;
  id v14 = v12;
  uint64_t v15 = Data.init(instance:)(v113);
  if (v16 >> 60 != 15)
  {
    uint64_t v29 = v15;
    unint64_t v30 = v16;
    long long v107 = a3;
    OUTLINED_FUNCTION_24_2();
    outlined init with copy of NetworkConnectionProtocol?(v6 + 1096, (uint64_t)v113, &demangling cache variable for type metadata for CommunicationProtocol?);
    if (v114)
    {
      outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v113, (uint64_t)v110);
      outlined copy of Data._Representation(v29, v30);
      outlined destroy of CommunicationProtocol?((uint64_t)v113, &demangling cache variable for type metadata for CommunicationProtocol?);
      __swift_project_boxed_opaque_existential_1(v110, v111);
      uint64_t v31 = OUTLINED_FUNCTION_89();
      v32(v31);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v110);
      if (a2)
      {
LABEL_13:
        if (one-time initialization token for siriNetwork != -1) {
          swift_once();
        }
        uint64_t v33 = type metadata accessor for Logger();
        __swift_project_value_buffer(v33, (uint64_t)static Logger.siriNetwork);
        outlined copy of Data?(v29, v30);
        swift_unknownObjectRetain();
        outlined copy of Data?(v29, v30);
        swift_unknownObjectRetain();
        uint64_t v34 = Logger.logObject.getter();
        os_log_type_t v35 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v34, v35))
        {
          uint64_t v36 = swift_slowAlloc();
          v113[0] = (id)OUTLINED_FUNCTION_10_0();
          *(_DWORD *)uint64_t v36 = 136315394;
          OUTLINED_FUNCTION_68_2();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SNSessionObject & SNThunking);
          uint64_t v37 = String.init<A>(describing:)();
          v110[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v37, v38, (uint64_t *)v113);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          OUTLINED_FUNCTION_28_5();
          swift_bridgeObjectRelease();
          *(_WORD *)(v36 + 12) = 2048;
          OUTLINED_FUNCTION_89();
          uint64_t v39 = Data.count.getter();
          OUTLINED_FUNCTION_22_3();
          v110[0] = v39;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          OUTLINED_FUNCTION_22_3();
          _os_log_impl(&dword_25D6CC000, v34, v35, "Background Connection - sendCommand. Buffering %s of size %ld, more commands are comming.", (uint8_t *)v36, 0x16u);
          OUTLINED_FUNCTION_57_2();
          OUTLINED_FUNCTION_1_2();
          OUTLINED_FUNCTION_1_2();
        }
        else
        {
          OUTLINED_FUNCTION_22_3();
          OUTLINED_FUNCTION_28_5();
          OUTLINED_FUNCTION_22_3();
        }

        if (a3) {
          ((void (*)(void))a3)(0);
        }
        goto LABEL_54;
      }
    }
    else
    {
      outlined copy of Data._Representation(v29, v30);
      outlined destroy of CommunicationProtocol?((uint64_t)v113, &demangling cache variable for type metadata for CommunicationProtocol?);
      if (a2) {
        goto LABEL_13;
      }
    }
    outlined init with copy of NetworkConnectionProtocol?(v6 + 1096, (uint64_t)v113, &demangling cache variable for type metadata for CommunicationProtocol?);
    if (v114)
    {
      outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v113, (uint64_t)v110);
      outlined destroy of CommunicationProtocol?((uint64_t)v113, &demangling cache variable for type metadata for CommunicationProtocol?);
      uint64_t v60 = v111;
      uint64_t v61 = v112;
      __swift_project_boxed_opaque_existential_1(v110, v111);
      uint64_t v62 = (*(uint64_t (**)(uint64_t, uint64_t))(v61 + 136))(v60, v61);
      unint64_t v64 = v63;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v110);
      if (v64 >> 60 != 15)
      {
        outlined init with copy of NetworkConnectionProtocol?(v6 + 1096, (uint64_t)v113, &demangling cache variable for type metadata for CommunicationProtocol?);
        if (v114)
        {
          outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v113, (uint64_t)v110);
          outlined destroy of CommunicationProtocol?((uint64_t)v113, &demangling cache variable for type metadata for CommunicationProtocol?);
          uint64_t v65 = (void *)v62;
          uint64_t v66 = v111;
          uint64_t v67 = v112;
          __swift_project_boxed_opaque_existential_1(v110, v111);
          id v106 = v65;
          uint64_t v68 = (*(uint64_t (**)(void *, unint64_t, uint64_t, uint64_t))(v67 + 192))(v65, v64, v66, v67);
          unint64_t v86 = v85;
          char v104 = (void *)v68;
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v110);
          if (v86 >> 60 != 15)
          {
            unint64_t v103 = v64;
            outlined copy of Data._Representation((uint64_t)v104, v86);
            if (one-time initialization token for siriNetwork != -1) {
              swift_once();
            }
            uint64_t v109 = a4;
            uint64_t v96 = type metadata accessor for Logger();
            OUTLINED_FUNCTION_77_2(v96, (uint64_t)static Logger.siriNetwork);
            id v97 = Logger.logObject.getter();
            os_log_type_t v98 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v97, v98))
            {
              uint64_t v99 = (uint8_t *)OUTLINED_FUNCTION_12_0();
              v113[0] = (id)OUTLINED_FUNCTION_10_0();
              *(_DWORD *)uint64_t v99 = 136315138;
              OUTLINED_FUNCTION_68_2();
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SNSessionObject & SNThunking);
              uint64_t v100 = String.init<A>(describing:)();
              getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v100, v101, (uint64_t *)v113);
              OUTLINED_FUNCTION_147();
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              OUTLINED_FUNCTION_28_5();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_25D6CC000, v97, v98, "Background Connection - sendCommand. Sending %s and any buffered command.", v99, 0xCu);
              OUTLINED_FUNCTION_95_2();
              OUTLINED_FUNCTION_1_2();
              OUTLINED_FUNCTION_1_2();
            }
            else
            {

              OUTLINED_FUNCTION_28_5();
            }
            unint64_t v114 = MEMORY[0x263F06F78];
            v113[0] = v104;
            v113[1] = (id)v86;
            char v102 = (void *)swift_allocObject();
            v102[2] = a1;
            v102[3] = v107;
            v102[4] = v109;
            outlined copy of Data?((uint64_t)v104, v86);
            swift_unknownObjectRetain();
            outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?((uint64_t)v107);
            BackgroundConnection.sendData(_:with:)((uint64_t)v113, (void (*)(void))partial apply for closure #1 in BackgroundConnection.sendCommand(_:moreComing:with:), (uint64_t)v102);
            outlined consume of Data?((uint64_t)v104, v86);
            OUTLINED_FUNCTION_22_3();
            outlined consume of Data?((uint64_t)v104, v86);
            swift_release();
            outlined consume of Data?((uint64_t)v106, v103);
            OUTLINED_FUNCTION_22_3();
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v113);
            return;
          }
        }
        else
        {
          outlined destroy of CommunicationProtocol?((uint64_t)v113, &demangling cache variable for type metadata for CommunicationProtocol?);
        }
        if (one-time initialization token for siriNetwork != -1) {
          swift_once();
        }
        uint64_t v87 = type metadata accessor for Logger();
        uint64_t v88 = (void *)OUTLINED_FUNCTION_7(v87, (uint64_t)static Logger.siriNetwork);
        os_log_type_t v89 = static os_log_type_t.error.getter();
        if (OUTLINED_FUNCTION_2_17(v89))
        {
          *(_WORD *)OUTLINED_FUNCTION_2_0() = 0;
          OUTLINED_FUNCTION_1_21(&dword_25D6CC000, v90, v91, "Background Connection - Writter. Error compressing data: nil data");
          OUTLINED_FUNCTION_1_2();
        }

        if (v107)
        {
          lazy protocol witness table accessor for type BackgroundConnectionError and conformance BackgroundConnectionError();
          uint64_t v92 = OUTLINED_FUNCTION_16_0();
          *(void *)uint64_t v93 = 3;
          *(void *)(v93 + 8) = 0;
          *(void *)(v93 + 16) = 0;
          *(void *)(v93 + 24) = 0;
          *(unsigned char *)(v93 + 32) = 4;
          lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
          uint64_t v53 = OUTLINED_FUNCTION_16_0();
          *(void *)(v94 + 8) = 0;
          *(void *)(v94 + 16) = 0;
          *(void *)uint64_t v94 = v92;
          *(_OWORD *)(v94 + 24) = xmmword_25D791000;
          v107();
          uint64_t v95 = OUTLINED_FUNCTION_112_0();
          outlined consume of Data?(v95, v64);
          OUTLINED_FUNCTION_22_3();
          goto LABEL_25;
        }
        uint64_t v83 = OUTLINED_FUNCTION_112_0();
        unint64_t v84 = v64;
LABEL_55:
        outlined consume of Data?(v83, v84);
        OUTLINED_FUNCTION_22_3();
        return;
      }
    }
    else
    {
      outlined destroy of CommunicationProtocol?((uint64_t)v113, &demangling cache variable for type metadata for CommunicationProtocol?);
    }
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v73 = type metadata accessor for Logger();
    OUTLINED_FUNCTION_77_2(v73, (uint64_t)static Logger.siriNetwork);
    uint64_t v74 = Logger.logObject.getter();
    os_log_type_t v75 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v74, v75))
    {
      uint64_t v76 = (uint8_t *)OUTLINED_FUNCTION_12_0();
      v113[0] = (id)OUTLINED_FUNCTION_10_0();
      *(_DWORD *)uint64_t v76 = 136315138;
      OUTLINED_FUNCTION_68_2();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SNSessionObject & SNThunking);
      uint64_t v77 = String.init<A>(describing:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v77, v78, (uint64_t *)v113);
      OUTLINED_FUNCTION_147();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_28_5();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25D6CC000, v74, v75, "Background Connection - sendCommand. Error sending %s, error: connection does not have buffered out pudata to write", v76, 0xCu);
      OUTLINED_FUNCTION_57_2();
      OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_1_2();
    }
    else
    {

      OUTLINED_FUNCTION_28_5();
    }
    if (!a3)
    {
LABEL_54:
      uint64_t v83 = OUTLINED_FUNCTION_89();
      goto LABEL_55;
    }
    lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
    uint64_t v79 = OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_58_3(v80, 6);
    *(_OWORD *)(v81 + 24) = xmmword_25D790FF0;
    uint64_t v56 = OUTLINED_FUNCTION_16_0();
    *(void *)(v82 + 8) = 0;
    *(void *)(v82 + 16) = 0;
    *(void *)uint64_t v82 = v79;
    *(_OWORD *)(v82 + 24) = xmmword_25D791000;
    OUTLINED_FUNCTION_143();
    a3();
    OUTLINED_FUNCTION_22_3();
    OUTLINED_FUNCTION_22_3();
LABEL_52:
    uint64_t v55 = (void *)v56;
    goto LABEL_53;
  }
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v17 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_77_2(v17, (uint64_t)static Logger.siriNetwork);
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.error.getter();
  if (OUTLINED_FUNCTION_24_0(v19))
  {
    uint64_t v20 = (uint8_t *)OUTLINED_FUNCTION_12_0();
    v113[0] = (id)OUTLINED_FUNCTION_10_0();
    *(_DWORD *)uint64_t v20 = 136315138;
    OUTLINED_FUNCTION_68_2();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SNSessionObject & SNThunking);
    uint64_t v21 = String.init<A>(describing:)();
    v110[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, (uint64_t *)v113);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_28_5();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25D6CC000, v18, v5, "Background Connection - sendCommand. Error sending %s, error: serialization error, ace data nil", v20, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_1_2();

    if (!a3) {
      return;
    }
    goto LABEL_24;
  }

  OUTLINED_FUNCTION_28_5();
  if (a3)
  {
LABEL_24:
    lazy protocol witness table accessor for type AceSerializationError and conformance AceSerializationError();
    uint64_t v51 = OUTLINED_FUNCTION_16_0();
    *(_OWORD *)uint64_t v52 = xmmword_25D7934E0;
    *(unsigned char *)(v52 + 16) = 3;
    lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
    uint64_t v53 = OUTLINED_FUNCTION_16_0();
    *(void *)(v54 + 8) = 0;
    *(void *)(v54 + 16) = 0;
    *(void *)uint64_t v54 = v51;
    *(_OWORD *)(v54 + 24) = xmmword_25D791000;
    OUTLINED_FUNCTION_143();
    a3();
LABEL_25:
    uint64_t v55 = (void *)v53;
LABEL_53:
  }
}

void closure #1 in BackgroundConnection.sendCommand(_:moreComing:with:)(void *a1, uint64_t a2, void (*a3)(void *))
{
  if (a1)
  {
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)static Logger.siriNetwork);
    swift_unknownObjectRetain();
    id v6 = a1;
    swift_unknownObjectRetain();
    id v7 = a1;
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v8, v9))
    {
      swift_unknownObjectRelease_n();

LABEL_12:
      if (!a3) {
        return;
      }
      goto LABEL_13;
    }
    uint64_t v10 = swift_slowAlloc();
    id v11 = (void *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v23 = v12;
    *(_DWORD *)uint64_t v10 = 136315394;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SNSessionObject & SNThunking);
    uint64_t v13 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2112;
    id v15 = a1;
    uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v11 = v22;

    _os_log_impl(&dword_25D6CC000, v8, v9, "Background Connection - sendCommand. Error sending %s and any buffered command, error: %@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x2611B3750](v11, -1, -1);
    swift_arrayDestroy();
    uint64_t v16 = v12;
LABEL_10:
    MEMORY[0x2611B3750](v16, -1, -1);
    MEMORY[0x2611B3750](v10, -1, -1);
    goto LABEL_12;
  }
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v17 = type metadata accessor for Logger();
  __swift_project_value_buffer(v17, (uint64_t)static Logger.siriNetwork);
  swift_unknownObjectRetain_n();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v18))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v23 = v19;
    *(_DWORD *)uint64_t v10 = 136315138;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SNSessionObject & SNThunking);
    uint64_t v20 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25D6CC000, v8, v18, "Background Connection - sendCommand. %s and any buffered command sent", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    uint64_t v16 = v19;
    goto LABEL_10;
  }

  swift_unknownObjectRelease_n();
  if (!a3) {
    return;
  }
LABEL_13:
  a3(a1);
}

uint64_t BackgroundConnection.sendCommands(_:with:)()
{
  OUTLINED_FUNCTION_14_7();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  unint64_t v5 = v0;
  if (v0 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = _CocoaArrayWrapper.endIndex.getter();
    if (v17)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = swift_bridgeObjectRelease();
LABEL_3:
      uint64_t v9 = v8 - 1;
      if (__OFSUB__(v8, 1))
      {
        __break(1u);
      }
      else if (v17 >= 1)
      {
        uint64_t v10 = 0;
        unint64_t v11 = v5 & 0xC000000000000001;
        unint64_t v12 = v5;
        do
        {
          if (v11)
          {
            uint64_t v13 = MEMORY[0x2611B2780](v10, v5);
          }
          else
          {
            uint64_t v13 = *(void *)(v5 + 8 * v10 + 32);
            swift_unknownObjectRetain();
          }
          unint64_t v14 = (void *)swift_allocObject();
          v14[2] = v4;
          void v14[3] = v2;
          v14[4] = v13;
          outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?(v4);
          id v15 = (void *)swift_unknownObjectRetain();
          BackgroundConnection.sendCommand(_:moreComing:with:)(v15, v9 != v10, (void (*)(void))partial apply for closure #1 in BackgroundConnection.sendCommands(_:with:), (uint64_t)v14);
          swift_unknownObjectRelease();
          swift_release();
          ++v10;
          unint64_t v5 = v12;
        }
        while (v17 != v10);
        goto LABEL_10;
      }
      __break(1u);
      return result;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v8 = v6;
    uint64_t v17 = v6;
    if (v6) {
      goto LABEL_3;
    }
  }
LABEL_10:
  OUTLINED_FUNCTION_42();
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall BackgroundConnection.cancel()()
{
  if ((*(unsigned char *)(v0 + 1186) & 1) == 0)
  {
    BackgroundConnection.closeConnectionAndPrepareForReconnect(_:)(0);
    *(unsigned char *)(v0 + 1186) = 1;
    uint64_t v1 = MEMORY[0x2611B37F0](v0 + 16);
    if (v1)
    {
      specialized Connection.didClose(_:)(v0, v1);
      swift_unknownObjectRelease();
      *(void *)(v0 + 24) = 0;
      swift_unknownObjectWeakAssign();
    }
  }
}

uint64_t BackgroundConnection.barrier(with:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_22_0();
  outlined init with copy of NetworkConnectionProtocol?(v2 + 1096, (uint64_t)v6, &demangling cache variable for type metadata for CommunicationProtocol?);
  if (!v7) {
    return outlined destroy of CommunicationProtocol?((uint64_t)v6, &demangling cache variable for type metadata for CommunicationProtocol?);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol);
  type metadata accessor for CommunicationProtocolAce();
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    CommunicationProtocolAce.barrier(with:)(a1, a2);
    return swift_release();
  }
  return result;
}

void BackgroundConnection.didEncounterError(_:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ConnectionAnalysisInfo?);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6 - v5;
  if ((*(unsigned char *)(v1 + 1187) & 1) == 0)
  {
    uint64_t v17 = (unsigned char *)(v1 + 1187);
    uint64_t v18 = MEMORY[0x2611B37F0](v1 + 16);
    if (v18)
    {
      uint64_t v19 = v18;
      if (one-time initialization token for siriNetwork != -1) {
        swift_once();
      }
      uint64_t v20 = type metadata accessor for Logger();
      __swift_project_value_buffer(v20, (uint64_t)static Logger.siriNetwork);
      id v21 = a1;
      id v22 = a1;
      uint64_t v23 = (void *)Logger.logObject.getter();
      os_log_type_t v24 = static os_log_type_t.error.getter();
      if (OUTLINED_FUNCTION_18_4(v24))
      {
        uint64_t v34 = v17;
        id v25 = (_DWORD *)OUTLINED_FUNCTION_12_0();
        uint64_t v32 = (void *)OUTLINED_FUNCTION_36_2();
        *id v25 = 138412290;
        id v26 = a1;
        uint64_t v27 = _swift_stdlib_bridgeErrorToNSError();
        OUTLINED_FUNCTION_118_0(v27);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v32 = v27;

        OUTLINED_FUNCTION_140(&dword_25D6CC000, v28, v29, "Background Connection - Provider: Did encounter error %@");
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1_2();
        uint64_t v17 = v34;
        OUTLINED_FUNCTION_1_2();
      }
      else
      {
      }
      BackgroundConnection.connectionAnalysisInfo.getter();
      specialized Connection.didEncounterError(_:error:analysisInfo:)(v2, a1, v7, v19);
      swift_unknownObjectRelease();
      outlined destroy of CommunicationProtocol?(v7, &demangling cache variable for type metadata for ConnectionAnalysisInfo?);
    }
    *uint64_t v17 = 1;
    goto LABEL_17;
  }
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Logger.siriNetwork);
  id v9 = a1;
  id v10 = a1;
  uint64_t v33 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v33, v11))
  {
    unint64_t v12 = (_DWORD *)OUTLINED_FUNCTION_12_0();
    uint64_t v13 = (void *)OUTLINED_FUNCTION_36_2();
    _DWORD *v12 = 138412290;
    id v14 = a1;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_118_0(v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v13 = v15;

    OUTLINED_FUNCTION_73_2(&dword_25D6CC000, v33, v16, "Background Connection - Provider: Did encounter error %@, but it is not going to be reported because a more recent error was already reported.");
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    OUTLINED_FUNCTION_89_0();
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_1_2();

LABEL_17:
    OUTLINED_FUNCTION_29();
    return;
  }

  OUTLINED_FUNCTION_29();
}

void BackgroundConnection.didEncounterIntermediateError(_:)()
{
  OUTLINED_FUNCTION_14_7();
  uint64_t v2 = *(void *)(v0 + 1080);
  if (v2)
  {
    uint64_t v3 = v0;
    uint64_t v4 = v1;
    uint64_t v5 = *(void *)(v0 + 1088);
    uint64_t v6 = one-time initialization token for siriNetwork;
    swift_unknownObjectRetain();
    if (v6 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    __swift_project_value_buffer(v7, (uint64_t)static Logger.siriNetwork);
    id v8 = v4;
    id v9 = v4;
    id v10 = (void *)Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_18_4(v11))
    {
      unint64_t v12 = (_DWORD *)OUTLINED_FUNCTION_12_0();
      uint64_t v13 = (void *)OUTLINED_FUNCTION_36_2();
      _DWORD *v12 = 138412290;
      id v14 = v4;
      uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v13 = v18;

      OUTLINED_FUNCTION_140(&dword_25D6CC000, v15, v16, "Background Connection - Provider: Did encounter error %@");
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      OUTLINED_FUNCTION_48_2();
      OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_1_2();
    }
    else
    {
    }
    uint64_t ObjectType = swift_getObjectType();
    specialized BackgroundConnection.connectionProvider(_:receivedIntermediateError:)(v2, v4, v3, ObjectType, v5);
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_42();
}

uint64_t BackgroundConnection.closeConnectionAndPrepareForReconnect(_:)(char a1)
{
  if (*(void *)(v1 + 1080))
  {
    uint64_t v3 = *(void *)(v1 + 1088);
    swift_getObjectType();
    uint64_t v4 = *(void (**)(uint64_t))(v3 + 472);
    swift_unknownObjectRetain();
    uint64_t v5 = OUTLINED_FUNCTION_43_2();
    v4(v5);
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_22_0();
  uint64_t v6 = outlined init with copy of NetworkConnectionProtocol?(v1 + 1096, (uint64_t)v12, &demangling cache variable for type metadata for CommunicationProtocol?);
  if (v13)
  {
    OUTLINED_FUNCTION_82_1(v6);
    outlined destroy of CommunicationProtocol?((uint64_t)v12, &demangling cache variable for type metadata for CommunicationProtocol?);
    uint64_t v7 = v11[3];
    uint64_t v8 = v11[4];
    OUTLINED_FUNCTION_113_0(v11);
    (*(void (**)(void, uint64_t, uint64_t))(v9 + 144))(a1 & 1, v7, v8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  }
  else
  {
    outlined destroy of CommunicationProtocol?((uint64_t)v12, &demangling cache variable for type metadata for CommunicationProtocol?);
  }
  *(_WORD *)(v1 + 1185) = 0;
  *(unsigned char *)(v1 + 1187) = 0;
  return siri_kdebug_trace_0(351);
}

Swift::String __swiftcall BackgroundConnection.getConnectionMethod()()
{
  OUTLINED_FUNCTION_119_0();
  char v2 = *(unsigned char *)(v0 + 1136);
  memcpy(__dst, (const void *)(v0 + 40), 0x204uLL);
  memcpy(v9, (const void *)(v0 + 40), 0x204uLL);
  if (*(void *)(v0 + 1080))
  {
    OUTLINED_FUNCTION_116_0();
    uint64_t v3 = *(uint64_t (**)(uint64_t))(v1 + 280);
    outlined retain of ConnectionConfiguration(__dst);
    swift_unknownObjectRetain();
    uint64_t v4 = OUTLINED_FUNCTION_43_2();
    char v5 = v3(v4);
    swift_unknownObjectRelease();
  }
  else
  {
    outlined retain of ConnectionConfiguration(__dst);
    char v5 = 0;
  }
  ConnectionMethod.connectionMethodDescription(connectionConfiguration:isMPTCP:)((uint64_t)v9, v5 & 1, v2);
  outlined release of ConnectionConfiguration(__dst);
  OUTLINED_FUNCTION_85_2();
  result._object = v7;
  result._uint64_t countAndFlagsBits = v6;
  return result;
}

uint64_t BackgroundConnection.getConnectionMetrics(connectionMethodHistory:with:)(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = v1;
  uint64_t v9 = v8;
  uint64_t v162 = v10;
  uint64_t v166 = v6;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WiFiRecord?);
  MEMORY[0x270FA5388](v11 - 8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v163 = v13 - v12;
  id v14 = (void *)type metadata accessor for WiFiRecord(0);
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_0_1();
  uint64_t v18 = (int64x2_t *)(v17 - v16);
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v19 = type metadata accessor for Logger();
  uint64_t v20 = OUTLINED_FUNCTION_7(v19, (uint64_t)static Logger.siriNetwork);
  os_log_type_t v21 = static os_log_type_t.default.getter();
  if (OUTLINED_FUNCTION_18_4(v21))
  {
    id v22 = (_WORD *)OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_39_2(v22);
    _os_log_impl(&dword_25D6CC000, v20, (os_log_type_t)v4, "Background Connection - Provider: Get Connection Metrics.", v2, 2u);
    OUTLINED_FUNCTION_1_2();
  }

  if (*(void *)(v7 + 1232) == -1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v160 = (uint64_t)v14;
    uint64_t v150 = v9;
    id v14 = v193;
    uint64_t v3 = v185;
    OUTLINED_FUNCTION_109_1();
    *(void *)(v7 + 1232) = v23;
    _s11SiriNetwork27ConnectionPreparationReportVSgWOi0_(v191);
    _s11SiriNetwork24ConnectionSnapshotReportVSgWOi0_(v192);
    LOBYTE(v20) = 1;
    LOBYTE(v193[1]) = 1;
    uint64_t v5 = MEMORY[0x263F8EE78];
    v193[0] = 0;
    v193[2] = MEMORY[0x263F8EE78];
    *(_OWORD *)&v193[3] = 0u;
    v193[5] = MEMORY[0x263F8EE78];
    LODWORD(v193[6]) = 0;
    BYTE4(v193[6]) = 1;
    memset(&v193[7], 0, 40);
    _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v191, (uint64_t)&v193[12], &demangling cache variable for type metadata for ConnectionPreparationReport?);
    memset(&v193[57], 0, 112);
    _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v192, (uint64_t)&v193[71], (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
    v193[160] = v5;
    memset(&v193[161], 0, 40);
    LOBYTE(v193[166]) = 1;
    v193[167] = 0;
    LOBYTE(v193[168]) = 1;
    v193[169] = 0;
    LOBYTE(v193[170]) = 1;
    memset(&v193[171], 0, 20);
    BYTE4(v193[173]) = 1;
    v193[174] = 0;
    LOBYTE(v193[175]) = 1;
    v193[176] = 0;
    LOBYTE(v193[177]) = 1;
    v193[178] = 0;
    LOBYTE(v193[179]) = 1;
    memcpy(v190, v193, 0x599uLL);
    _s11SiriNetwork010ConnectionB6ReportVSgWOi0_(v194);
    _s11SiriNetwork25ConnectionInterfaceReportVSgWOi0_(v195);
    if (one-time initialization token for sharedNetworkAnalytics == -1) {
      goto LABEL_7;
    }
  }
  swift_once();
LABEL_7:
  os_log_type_t v24 = static NetworkAnalytics.sharedNetworkAnalytics;
  LODWORD(v196[0]) = 0;
  v196[1] = 0;
  v196[2] = 0xE000000000000000;
  v196[3] = 0;
  v196[4] = 0xE000000000000000;
  _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v194, (uint64_t)&v196[5], (uint64_t *)&demangling cache variable for type metadata for ConnectionNetworkReport?);
  v196[46] = 0;
  v196[45] = 0;
  *((unsigned char *)v14 + 2432) = (_BYTE)v20;
  _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v195, (uint64_t)&v196[48], (uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
  v196[85] = v5;
  v196[86] = v5;
  LODWORD(v196[87]) = 4;
  v196[88] = v24;
  memcpy(v189, v196, sizeof(v189));
  *(unsigned char *)(v4 + 95) = (_BYTE)v20;
  *(unsigned char *)(v4 + 91) = (_BYTE)v20;
  *(unsigned char *)(v4 + 87) = (_BYTE)v20;
  *(unsigned char *)(v4 + 79) = (_BYTE)v20;
  *(unsigned char *)(v4 + 71) = (_BYTE)v20;
  *(unsigned char *)(v4 + 63) = (_BYTE)v20;
  *(unsigned char *)(v4 + 55) = (_BYTE)v20;
  *(unsigned char *)(v4 + 47) = (_BYTE)v20;
  *(unsigned char *)(v4 + 39) = (_BYTE)v20;
  *(unsigned char *)(v4 + 31) = (_BYTE)v20;
  *(unsigned char *)(v4 + 23) = (_BYTE)v20;
  *(unsigned char *)(v4 + 15) = (_BYTE)v20;
  *(unsigned char *)(v4 + 7) = (_BYTE)v20;
  double v25 = 0.0;
  double v26 = *(double *)(v7 + 1208);
  double v27 = *(double *)(v7 + 1192);
  double v28 = 0.0;
  *((unsigned char *)v3 + 960) = (_BYTE)v20;
  if (v27 < v26)
  {
    double v28 = v26 - v27;
    *(unsigned char *)(v4 + 31) = 0;
  }
  double v29 = *(double *)(v7 + 1216);
  if (v27 < v29)
  {
    double v25 = v29 - v27;
    *(unsigned char *)(v4 + 23) = 0;
  }
  unint64_t v170 = *(void *)(v7 + 1224);
  if (HIDWORD(v170)) {
    goto LABEL_35;
  }
  unint64_t v30 = (BOOL *)(v3 + 33);
  *(unsigned char *)(v4 + 99) = 0;
  uint64_t v167 = (void *)v7;
  uint64_t v31 = *(unsigned char **)(v7 + 1144);
  if (v31)
  {
    uint64_t v32 = *(void *)&v31[OBJC_IVAR___SNNetworkManagerInternal_carrierName + 8];
    uint64_t v171 = *(void *)&v31[OBJC_IVAR___SNNetworkManagerInternal_carrierName];
    char v33 = v31[OBJC_IVAR___SNNetworkManagerInternal_lastSignalStrength + 8];
    double v34 = 0.0;
    if ((v33 & 1) == 0)
    {
      double v34 = (double)*(uint64_t *)&v31[OBJC_IVAR___SNNetworkManagerInternal_lastSignalStrength];
      *(unsigned char *)(v4 + 95) = 0;
    }
    os_log_type_t v35 = *(void **)&v31[OBJC_IVAR___SNNetworkManagerInternal_networkWiFiManager];
    swift_bridgeObjectRetain();
    id v36 = v35;
    id v37 = v24;
    unint64_t v38 = v31;
    NetworkWiFiManager.getWiFiRecord()(v163);

    if (__swift_getEnumTagSinglePayload(v163, 1, v160) == 1)
    {
      outlined destroy of CommunicationProtocol?(v163, &demangling cache variable for type metadata for WiFiRecord?);
      LOBYTE(v31) = 0;
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      float64x2_t v41 = 0uLL;
      double v42 = 0.0;
      char v43 = 1;
    }
    else
    {
      outlined init with take of WiFiRecord(v163, (uint64_t)v18);
      *(unsigned char *)(v4 + 7) = 0;
      float64x2_t v164 = vcvtq_f64_s64(*v18);
      *(unsigned char *)(v4 + 15) = 0;
      double v42 = (double)v18[1].i64[0];
      *((unsigned char *)v3 + 960) = 0;
      LOBYTE(v31) = v18[3].i8[8];
      uint64_t v46 = v18[2].i64[1];
      uint64_t v39 = v18[3].i64[0];
      swift_bridgeObjectRetain();
      outlined destroy of WiFiRecord((uint64_t)v18);
      swift_bridgeObjectRelease();
      float64x2_t v41 = v164;
      uint64_t v40 = v46;
      char v43 = 0;
    }
    uint64_t v45 = v171;
  }
  else
  {
    id v44 = v24;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    uint64_t v32 = 0;
    uint64_t v45 = 0;
    float64x2_t v41 = 0uLL;
    double v34 = 0.0;
    char v43 = 1;
    double v42 = 0.0;
    char v33 = 1;
  }
  LODWORD(v185[0]) = v170;
  BYTE4(v185[0]) = 0;
  v185[1] = v45;
  v185[2] = v32;
  *(double *)&v185[3] = v34;
  LOBYTE(v185[4]) = v33;
  uint64_t v157 = v40;
  uint64_t v158 = v39;
  v185[5] = v40;
  v185[6] = v39;
  *(_OWORD *)(v3 + 7) = 0u;
  *(_OWORD *)(v3 + 9) = 0u;
  *((unsigned char *)v3 + 92) = 1;
  LODWORD(v185[11]) = 0;
  LODWORD(v185[12]) = 0;
  *((unsigned char *)v3 + 100) = 1;
  v185[13] = MEMORY[0x263F8EE80];
  memset(&v185[14], 0, 24);
  *((unsigned char *)v3 + 136) = 1;
  *((unsigned char *)v3 + 152) = 1;
  v185[18] = 0;
  v185[20] = 0;
  *((unsigned char *)v3 + 168) = 1;
  *((unsigned char *)v3 + 184) = 1;
  v185[22] = 0;
  v185[24] = 0;
  *((unsigned char *)v3 + 200) = 1;
  *((unsigned char *)v3 + 216) = 1;
  v185[26] = 0;
  v185[28] = 0;
  v185[29] = 0;
  *((unsigned char *)v3 + 248) = v27 >= v26;
  *(double *)&v185[30] = v28;
  *(double *)&v185[32] = v25;
  *unint64_t v30 = v27 >= v29;
  *((unsigned char *)v3 + 265) = (_BYTE)v31;
  float64_t v47 = v41.f64[0];
  v30[16] = v43;
  v185[36] = *(void *)&v41.f64[1];
  v30[32] = v43;
  float64_t v165 = v41.f64[1];
  v185[34] = *(void *)&v41.f64[0];
  *(double *)&v185[38] = v42;
  v30[48] = v43;
  memcpy(v186, v185, 0x139uLL);
  destructiveProjectEnumData for ConnectionConfigurationError(v186);
  _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)&v189[5], (uint64_t)v187, (uint64_t *)&demangling cache variable for type metadata for ConnectionNetworkReport?);
  outlined retain of ConnectionNetworkReport((uint64_t)v185);
  outlined release of ConnectionNetworkReport?(v187);
  _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v186, (uint64_t)&v189[5], (uint64_t *)&demangling cache variable for type metadata for ConnectionNetworkReport?);
  OUTLINED_FUNCTION_22_0();
  outlined init with copy of NetworkConnectionProtocol?((uint64_t)(v167 + 137), (uint64_t)v182, &demangling cache variable for type metadata for CommunicationProtocol?);
  uint64_t v48 = v183;
  uint64_t v161 = v32;
  uint64_t v172 = v45;
  char v159 = (char)v31;
  float64_t v156 = v47;
  if (v183)
  {
    uint64_t v49 = v184;
    __swift_project_boxed_opaque_existential_1(v182, v183);
    uint64_t v50 = (*(uint64_t (**)(uint64_t, uint64_t))(v49 + 40))(v48, v49);
  }
  else
  {
    uint64_t v50 = 0;
  }
  outlined destroy of CommunicationProtocol?((uint64_t)v182, &demangling cache variable for type metadata for CommunicationProtocol?);
  uint64_t v51 = ConnectionPingInfoReport.init(pingInfo:)(v50);
  uint64_t v53 = v52;
  v189[45] = v51;
  v189[46] = v52;
  char v55 = v54 & 1;
  *(unsigned char *)(v4 + 479) = v54 & 1;
  int v56 = v189[0];
  long long v151 = *(_OWORD *)(v4 + 111);
  uint64_t v153 = v189[3];
  uint64_t v57 = v189[4];
  _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)&v189[5], (uint64_t)v177, (uint64_t *)&demangling cache variable for type metadata for ConnectionNetworkReport?);
  _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)&v189[48], (uint64_t)v178, (uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
  uint64_t v58 = v189[85];
  uint64_t v59 = v189[86];
  int v60 = v189[87];
  uint64_t v61 = v189[88];
  LODWORD(v179[0]) = v56;
  *(_OWORD *)&v179[1] = v151;
  v179[3] = v153;
  v179[4] = v57;
  _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v177, (uint64_t)&v179[5], (uint64_t *)&demangling cache variable for type metadata for ConnectionNetworkReport?);
  v179[45] = v51;
  v179[46] = v53;
  LOBYTE(v179[47]) = v55;
  _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v178, (uint64_t)&v179[48], (uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
  v179[85] = v58;
  v179[86] = v59;
  LODWORD(v179[87]) = v60;
  v179[88] = v61;
  memcpy(v180, v179, sizeof(v180));
  destructiveProjectEnumData for ConnectionConfigurationError(v180);
  _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)&v190[35] + 8, (uint64_t)v181, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
  outlined retain of ConnectionSnapshotReport((uint64_t)v179);
  outlined release of ConnectionSnapshotReport?((uint64_t)v181);
  _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v180, (uint64_t)&v190[35] + 8, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&v190[1] = v166;
  unint64_t v62 = v167[154];
  if (HIDWORD(v62))
  {
LABEL_35:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    LODWORD(v190[3]) = v167[154];
    BYTE4(v190[3]) = 0;
    uint64_t v63 = v167[135];
    OUTLINED_FUNCTION_109_1();
    if (v63
      && (uint64_t v64 = v167[136],
          uint64_t v65 = swift_getObjectType(),
          uint64_t v66 = *(void (**)(uint64_t, uint64_t))(v64 + 520),
          swift_unknownObjectRetain(),
          v66(v65, v64),
          swift_unknownObjectRelease(),
          v167[135]))
    {
      uint64_t v168 = v167[136];
      char v67 = BYTE8(v190[0]);
      long long v100 = *(_OWORD *)((char *)&v190[1] + 8);
      uint64_t v68 = *(void *)&v190[0];
      uint64_t v99 = *((void *)&v190[2] + 1);
      long long v117 = *(_OWORD *)((char *)&v190[4] + 8);
      long long v119 = *(_OWORD *)((char *)&v190[3] + 8);
      uint64_t v115 = *((void *)&v190[5] + 1);
      _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)&v190[6], (uint64_t)v175, &demangling cache variable for type metadata for ConnectionPreparationReport?);
      __n128 v109 = OUTLINED_FUNCTION_128_0((__n128 *)((char *)&v190[28] + 8));
      long long v111 = v69;
      __n128 v105 = OUTLINED_FUNCTION_126_0(v70);
      long long v107 = v71;
      __n128 v101 = OUTLINED_FUNCTION_125_0(v72);
      long long v103 = v73;
      uint64_t v74 = *((void *)&v190[34] + 1);
      uint64_t v113 = *(void *)&v190[35];
      long long v152 = v190[81];
      long long v154 = v190[80];
      long long v75 = v190[82];
      char v147 = v190[83];
      uint64_t v145 = *((void *)&v190[83] + 1);
      char v143 = v190[84];
      uint64_t v141 = *((void *)&v190[84] + 1);
      char v139 = v190[85];
      uint64_t v135 = *(void *)&v190[86];
      uint64_t v137 = *((void *)&v190[85] + 1);
      int v133 = DWORD2(v190[86]);
      char v131 = BYTE12(v190[86]);
      uint64_t v129 = *(void *)&v190[87];
      char v127 = BYTE8(v190[87]);
      uint64_t v125 = *(void *)&v190[88];
      char v123 = BYTE8(v190[88]);
      uint64_t v121 = *(void *)&v190[89];
      char v76 = BYTE8(v190[89]);
      *(void *)&v176[0] = v68;
      BYTE8(v176[0]) = v67;
      *(_OWORD *)((char *)&v176[1] + 8) = v100;
      *(void *)&v176[1] = v166;
      *((void *)&v176[2] + 1) = v99;
      LODWORD(v176[3]) = v62;
      BYTE4(v176[3]) = 0;
      *(_OWORD *)((char *)&v176[3] + 8) = v119;
      *(_OWORD *)((char *)&v176[4] + 8) = v117;
      *((void *)&v176[5] + 1) = v115;
      _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v175, (uint64_t)&v176[6], &demangling cache variable for type metadata for ConnectionPreparationReport?);
      *(_OWORD *)((char *)&v176[28] + 8) = v111;
      *(__n128 *)((char *)&v176[29] + 8) = v109;
      *(_OWORD *)((char *)&v176[30] + 8) = v107;
      *(__n128 *)((char *)&v176[31] + 8) = v105;
      *(_OWORD *)((char *)&v176[32] + 8) = v103;
      *(__n128 *)((char *)&v176[33] + 8) = v101;
      *((void *)&v176[34] + 1) = v74;
      *(void *)&v176[35] = v113;
      _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v180, (uint64_t)&v176[35] + 8, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
      v176[80] = v154;
      v176[81] = v152;
      v176[82] = v75;
      LOBYTE(v176[83]) = v147;
      *((void *)&v176[83] + 1) = v145;
      LOBYTE(v176[84]) = v143;
      *((void *)&v176[84] + 1) = v141;
      LOBYTE(v176[85]) = v139;
      *((void *)&v176[85] + 1) = v137;
      *(void *)&v176[86] = v135;
      DWORD2(v176[86]) = v133;
      BYTE12(v176[86]) = v131;
      *(void *)&v176[87] = v129;
      BYTE8(v176[87]) = v127;
      *(void *)&v176[88] = v125;
      BYTE8(v176[88]) = v123;
      *(void *)&v176[89] = v121;
      BYTE8(v176[89]) = v76;
      memcpy(v174, v176, 0x599uLL);
      if (v162)
      {
        uint64_t v77 = swift_allocObject();
        uint64_t v58 = v150;
        *(void *)(v77 + 16) = v162;
        *(void *)(v77 + 24) = v150;
        unint64_t v78 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed ConnectionMetrics?) -> ();
      }
      else
      {
        unint64_t v78 = 0;
        uint64_t v77 = 0;
        uint64_t v58 = v150;
      }
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v90 = *(void (**)(_OWORD *, uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v168 + 528);
      swift_unknownObjectRetain();
      outlined retain of ConnectionMetrics((uint64_t)v176);
      outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?((uint64_t)v162);
      v90(v174, v78, v77, ObjectType, v168);
      outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v78);
      swift_unknownObjectRelease();
      memcpy(v173, v174, 0x599uLL);
      outlined release of ConnectionMetrics((uint64_t)v173);
      OUTLINED_FUNCTION_109_1();
    }
    else if (v162)
    {
      char v79 = BYTE8(v190[0]);
      long long v102 = *(_OWORD *)((char *)&v190[1] + 8);
      uint64_t v58 = *(void *)&v190[0];
      uint64_t v80 = *((void *)&v190[2] + 1);
      long long v120 = *(_OWORD *)((char *)&v190[4] + 8);
      long long v122 = *(_OWORD *)((char *)&v190[3] + 8);
      uint64_t v118 = *((void *)&v190[5] + 1);
      _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)&v190[6], (uint64_t)v175, &demangling cache variable for type metadata for ConnectionPreparationReport?);
      __n128 v112 = OUTLINED_FUNCTION_128_0((__n128 *)((char *)&v190[28] + 8));
      long long v114 = v81;
      __n128 v108 = OUTLINED_FUNCTION_126_0(v82);
      long long v110 = v83;
      __n128 v104 = OUTLINED_FUNCTION_125_0(v84);
      long long v106 = v85;
      uint64_t v86 = *((void *)&v190[34] + 1);
      uint64_t v116 = *(void *)&v190[35];
      long long v169 = v190[80];
      long long v155 = v190[81];
      long long v87 = v190[82];
      char v149 = v190[83];
      uint64_t v148 = *((void *)&v190[83] + 1);
      char v146 = v190[84];
      uint64_t v144 = *((void *)&v190[84] + 1);
      char v142 = v190[85];
      uint64_t v138 = *(void *)&v190[86];
      uint64_t v140 = *((void *)&v190[85] + 1);
      int v136 = DWORD2(v190[86]);
      char v134 = BYTE12(v190[86]);
      uint64_t v132 = *(void *)&v190[87];
      char v130 = BYTE8(v190[87]);
      uint64_t v128 = *(void *)&v190[88];
      char v126 = BYTE8(v190[88]);
      uint64_t v124 = *(void *)&v190[89];
      char v88 = BYTE8(v190[89]);
      *(void *)&v174[0] = v58;
      OUTLINED_FUNCTION_109_1();
      BYTE8(v174[0]) = v79;
      *(_OWORD *)((char *)&v174[1] + 8) = v102;
      *(void *)&v174[1] = v166;
      *((void *)&v174[2] + 1) = v80;
      LODWORD(v174[3]) = v62;
      BYTE4(v174[3]) = 0;
      *(_OWORD *)((char *)&v174[3] + 8) = v122;
      *(_OWORD *)((char *)&v174[4] + 8) = v120;
      *((void *)&v174[5] + 1) = v118;
      _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v175, (uint64_t)&v174[6], &demangling cache variable for type metadata for ConnectionPreparationReport?);
      *(_OWORD *)((char *)&v174[28] + 8) = v114;
      *(__n128 *)((char *)&v174[29] + 8) = v112;
      *(_OWORD *)((char *)&v174[30] + 8) = v110;
      *(__n128 *)((char *)&v174[31] + 8) = v108;
      *(_OWORD *)((char *)&v174[32] + 8) = v106;
      *(__n128 *)((char *)&v174[33] + 8) = v104;
      *((void *)&v174[34] + 1) = v86;
      *(void *)&v174[35] = v116;
      _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v180, (uint64_t)&v174[35] + 8, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
      v174[80] = v169;
      v174[81] = v155;
      v174[82] = v87;
      LOBYTE(v174[83]) = v149;
      *((void *)&v174[83] + 1) = v148;
      LOBYTE(v174[84]) = v146;
      *((void *)&v174[84] + 1) = v144;
      LOBYTE(v174[85]) = v142;
      *((void *)&v174[85] + 1) = v140;
      *(void *)&v174[86] = v138;
      DWORD2(v174[86]) = v136;
      BYTE12(v174[86]) = v134;
      *(void *)&v174[87] = v132;
      BYTE8(v174[87]) = v130;
      *(void *)&v174[88] = v128;
      BYTE8(v174[88]) = v126;
      *(void *)&v174[89] = v124;
      BYTE8(v174[89]) = v88;
      memcpy(v176, v174, 0x599uLL);
      destructiveProjectEnumData for ConnectionConfigurationError(v176);
      _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v176, (uint64_t)v173, (uint64_t *)&demangling cache variable for type metadata for ConnectionMetrics?);
      outlined retain of ConnectionMetrics((uint64_t)v174);
      v162(v173);
      outlined release of ConnectionMetrics((uint64_t)v174);
    }
    LODWORD(v173[0]) = v170;
    BYTE4(v173[0]) = *(unsigned char *)(v58 + 99);
    *(_WORD *)((char *)v173 + 5) = *(_WORD *)(v58 + 96);
    HIBYTE(v173[0]) = *(unsigned char *)(v58 + 98);
    v173[1] = v172;
    v173[2] = v161;
    *(double *)&v173[3] = v34;
    LOBYTE(v173[4]) = *(unsigned char *)(v58 + 95);
    *(_DWORD *)((char *)&v173[4] + 1) = *(_DWORD *)v175;
    HIDWORD(v173[4]) = *(_DWORD *)&v175[3];
    v173[5] = v157;
    v173[6] = v158;
    memset(&v173[7], 0, 36);
    BYTE4(v173[11]) = *(unsigned char *)(v58 + 91);
    *(_WORD *)((char *)&v173[11] + 5) = *(_WORD *)(v58 + 88);
    HIBYTE(v173[11]) = *(unsigned char *)(v58 + 90);
    LODWORD(v173[12]) = 0;
    BYTE4(v173[12]) = *(unsigned char *)(v58 + 87);
    *(_WORD *)((char *)&v173[12] + 5) = *(_WORD *)(v58 + 84);
    HIBYTE(v173[12]) = *(unsigned char *)(v58 + 86);
    v173[13] = MEMORY[0x263F8EE80];
    memset(&v173[14], 0, 24);
    LOBYTE(v173[17]) = *(unsigned char *)(v58 + 79);
    HIDWORD(v173[17]) = *(_DWORD *)(v58 + 75);
    *(_DWORD *)((char *)&v173[17] + 1) = *(_DWORD *)(v58 + 72);
    v173[18] = 0;
    LOBYTE(v173[19]) = *(unsigned char *)(v58 + 71);
    HIDWORD(v173[19]) = *(_DWORD *)(v58 + 67);
    *(_DWORD *)((char *)&v173[19] + 1) = *(_DWORD *)(v58 + 64);
    v173[20] = 0;
    LOBYTE(v173[21]) = *(unsigned char *)(v58 + 63);
    *(_DWORD *)((char *)&v173[21] + 1) = *(_DWORD *)(v58 + 56);
    HIDWORD(v173[21]) = *(_DWORD *)(v58 + 59);
    v173[22] = 0;
    LOBYTE(v173[23]) = *(unsigned char *)(v58 + 55);
    int v91 = *(_DWORD *)(v58 + 48);
    HIDWORD(v173[23]) = *(_DWORD *)(v58 + 51);
    *(_DWORD *)((char *)&v173[23] + 1) = v91;
    v173[24] = 0;
    LOBYTE(v173[25]) = *(unsigned char *)(v58 + 47);
    int v92 = *(_DWORD *)(v58 + 40);
    HIDWORD(v173[25]) = *(_DWORD *)(v58 + 43);
    *(_DWORD *)((char *)&v173[25] + 1) = v92;
    v173[26] = 0;
    LOBYTE(v173[27]) = *(unsigned char *)(v58 + 39);
    int v93 = *(_DWORD *)(v58 + 32);
    HIDWORD(v173[27]) = *(_DWORD *)(v58 + 35);
    *(_DWORD *)((char *)&v173[27] + 1) = v93;
    v173[29] = 0;
    v173[28] = 0;
    *(double *)&v173[30] = v28;
    LOBYTE(v173[31]) = *(unsigned char *)(v58 + 31);
    int v94 = *(_DWORD *)(v58 + 24);
    HIDWORD(v173[31]) = *(_DWORD *)(v58 + 27);
    *(_DWORD *)((char *)&v173[31] + 1) = v94;
    *(double *)&v173[32] = v25;
    LOBYTE(v173[33]) = *(unsigned char *)(v58 + 23);
    BYTE1(v173[33]) = v159;
    __int16 v95 = *(_WORD *)(v58 + 21);
    *(_DWORD *)((char *)&v173[33] + 2) = *(_DWORD *)(v58 + 17);
    HIWORD(v173[33]) = v95;
    *(float64_t *)&v173[34] = v156;
    LOBYTE(v173[35]) = *(unsigned char *)(v58 + 15);
    int v96 = *(_DWORD *)(v58 + 11);
    *(_DWORD *)((char *)&v173[35] + 1) = *(_DWORD *)(v58 + 8);
    HIDWORD(v173[35]) = v96;
    *(float64_t *)&v173[36] = v165;
    LOBYTE(v173[37]) = *(unsigned char *)(v58 + 7);
    int v97 = *(_DWORD *)(v58 + 3);
    *(_DWORD *)((char *)&v173[37] + 1) = *(_DWORD *)v58;
    HIDWORD(v173[37]) = v97;
    *(double *)&v173[38] = v42;
    LOBYTE(v173[39]) = v188;
    outlined release of ConnectionNetworkReport((uint64_t)v173);
    memcpy(v174, v189, 0x2C8uLL);
    outlined release of ConnectionSnapshotReport((uint64_t)v174);
    memcpy(v176, v190, 0x599uLL);
    return outlined release of ConnectionMetrics((uint64_t)v176);
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed ConnectionMetrics?) -> ()(uint64_t a1)
{
  uint64_t v1 = (const void *)MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  memcpy(__dst, v1, 0x599uLL);
  memcpy(v8, v4, 0x599uLL);
  destructiveProjectEnumData for ConnectionConfigurationError(v8);
  _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v8, (uint64_t)v6, (uint64_t *)&demangling cache variable for type metadata for ConnectionMetrics?);
  outlined retain of ConnectionMetrics((uint64_t)__dst);
  v3(v6);
  return outlined release of ConnectionMetrics((uint64_t)__dst);
}

Swift::Void __swiftcall BackgroundConnection.probeConnection()()
{
  OUTLINED_FUNCTION_24_2();
  uint64_t v1 = outlined init with copy of NetworkConnectionProtocol?(v0 + 1096, (uint64_t)v7, &demangling cache variable for type metadata for CommunicationProtocol?);
  if (v8)
  {
    OUTLINED_FUNCTION_82_1(v1);
    outlined destroy of CommunicationProtocol?((uint64_t)v7, &demangling cache variable for type metadata for CommunicationProtocol?);
    uint64_t v2 = v5;
    uint64_t v3 = v6;
    __swift_project_boxed_opaque_existential_1(v4, v5);
    (*(void (**)(uint64_t, uint64_t))(v3 + 160))(v2, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  }
  else
  {
    outlined destroy of CommunicationProtocol?((uint64_t)v7, &demangling cache variable for type metadata for CommunicationProtocol?);
  }
}

void specialized BackgroundConnection.fallbackToNextConnectionMethodWithError(_:with:)(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  void __dst[65] = *MEMORY[0x263EF8340];
  Swift::Int v8 = *(unsigned __int8 *)(a2 + 1136);
  __src = (void *)(a2 + 40);
  memcpy(__dst, (const void *)(a2 + 40), 0x204uLL);
  uint64_t v76 = a3;
  swift_retain();
  id v9 = a4;
  int v10 = ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)__dst, v8);
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.siriNetwork);
  swift_retain_n();
  id v12 = a1;
  swift_retain();
  id v13 = a1;
  id v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  id v77 = a1;
  if (os_log_type_enabled(v14, v15))
  {
    int v78 = v10;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    __dst[0] = v18;
    *(_DWORD *)uint64_t v16 = 136315650;
    unint64_t v19 = 0xE700000000000000;
    uint64_t v20 = 0x6E776F6E6B6E75;
    uint64_t v74 = a4;
    switch(*(unsigned char *)(a2 + 1136))
    {
      case 1:
        uint64_t v20 = 0x6B726F7774656ELL;
        break;
      case 2:
        unint64_t v19 = 0xE400000000000000;
        uint64_t v20 = 1919247728;
        break;
      case 3:
        unint64_t v19 = 0xE300000000000000;
        uint64_t v20 = 7368560;
        break;
      default:
        break;
    }
    v81[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v19, __dst);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2112;
    if (a1)
    {
      id v21 = a1;
      uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
      v81[0] = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
    }
    else
    {
      v81[0] = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v22 = 0;
    }
    *uint64_t v17 = v22;

    *(_WORD *)(v16 + 22) = 1024;
    int v23 = *(unsigned __int8 *)(a2 + 139);
    swift_release();
    LODWORD(v81[0]) = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl(&dword_25D6CC000, v14, v15, "Background Connection - Fallback: Start. Current method: %s. Error: %@. Uses Proxy: %{BOOL}d", (uint8_t *)v16, 0x1Cu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x2611B3750](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2611B3750](v18, -1, -1);
    MEMORY[0x2611B3750](v16, -1, -1);

    a4 = v74;
    int v10 = v78;
  }
  else
  {
    swift_release_n();

    swift_release();
  }
  double v24 = 0.0;
  if (!(_BYTE)v10)
  {
    if (*(unsigned char *)(a2 + 1136) == 1 && *(unsigned char *)(a2 + 139) == 1)
    {
      if (*(unsigned char *)(a2 + 138) == 1)
      {
        id v25 = a1;
        id v26 = a1;
        double v27 = Logger.logObject.getter();
        os_log_type_t v28 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v27, v28))
        {
          double v29 = a4;
          unint64_t v30 = (uint8_t *)swift_slowAlloc();
          uint64_t v31 = (void *)swift_slowAlloc();
          *(_DWORD *)unint64_t v30 = 138412290;
          if (v77)
          {
            id v32 = v77;
            uint64_t v33 = _swift_stdlib_bridgeErrorToNSError();
            __dst[0] = v33;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
          }
          else
          {
            __dst[0] = 0;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            uint64_t v33 = 0;
          }
          *uint64_t v31 = v33;

          _os_log_impl(&dword_25D6CC000, v27, v28, "Background Connection - Fallback: Resetting connection method on error (%@). Trying Peer now.", v30, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          swift_arrayDestroy();
          MEMORY[0x2611B3750](v31, -1, -1);
          MEMORY[0x2611B3750](v30, -1, -1);
          a4 = v29;
        }
        else
        {
        }
        memcpy(__dst, __src, 0x204uLL);
        int v10 = ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)__dst, 0);
        *(unsigned char *)(a2 + 138) = 0;
        goto LABEL_35;
      }
      int v10 = 0;
      if (!AFHasCellularData() || !a1) {
        goto LABEL_35;
      }
      swift_getErrorValue();
      id v34 = a1;
      if (!Error.sn_isNetworkDown()())
      {

        int v10 = 0;
        goto LABEL_35;
      }
      id v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AB0]), sel_init);
      objc_msgSend(v35, sel_systemUptime);
      double v37 = v36;

      if (v37 - *(double *)(a2 + 1192) <= 30.0)
      {
        id v41 = a1;
        id v42 = a1;
        char v43 = Logger.logObject.getter();
        os_log_type_t v44 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v43, v44))
        {
          uint64_t v45 = (uint8_t *)swift_slowAlloc();
          char v79 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v45 = 138412290;
          id v46 = v77;
          uint64_t v47 = _swift_stdlib_bridgeErrorToNSError();
          __dst[0] = v47;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *char v79 = v47;

          _os_log_impl(&dword_25D6CC000, v43, v44, "Background Connection - Fallback: Resetting connection method on error (%@) while waiting for cellular.", v45, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          swift_arrayDestroy();
          MEMORY[0x2611B3750](v79, -1, -1);
          MEMORY[0x2611B3750](v45, -1, -1);
        }
        else
        {
        }
        memcpy(__dst, __src, 0x204uLL);
        memcpy(v81, __src, 0x204uLL);
        outlined retain of ConnectionConfiguration(__dst);
        int v10 = ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)v81, 0);

        outlined release of ConnectionConfiguration(__dst);
        double v24 = 1.0;
        goto LABEL_35;
      }
      unint64_t v38 = Logger.logObject.getter();
      os_log_type_t v39 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v40 = 0;
        _os_log_impl(&dword_25D6CC000, v38, v39, "Background Connection - Fallback: Ran out of time waiting for network to become available.", v40, 2u);
        MEMORY[0x2611B3750](v40, -1, -1);
      }
      else
      {
      }
    }
    int v10 = 0;
  }
LABEL_35:
  swift_beginAccess();
  outlined init with copy of NetworkConnectionProtocol?(a2 + 1096, (uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
  uint64_t v48 = __dst[3];
  int v80 = v10;
  if (__dst[3])
  {
    uint64_t v49 = __dst[4];
    __swift_project_boxed_opaque_existential_1(__dst, __dst[3]);
    uint64_t v50 = (*(uint64_t (**)(uint64_t, uint64_t))(v49 + 16))(v48, v49);
    unint64_t v52 = v51;
    outlined destroy of CommunicationProtocol?((uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
    if (v52 >> 60 != 15)
    {
      outlined consume of Data?(v50, v52);
      if ((_BYTE)v10)
      {
        char v53 = BackgroundConnection.canFallBackFromError(_:)((uint64_t)v77);
        goto LABEL_41;
      }
    }
  }
  else
  {
    outlined destroy of CommunicationProtocol?((uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
  }
  char v53 = 0;
LABEL_41:
  swift_retain_n();
  char v54 = Logger.logObject.getter();
  os_log_type_t v55 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v54, v55))
  {

    swift_release_n();
    goto LABEL_50;
  }
  uint64_t v56 = swift_slowAlloc();
  uint64_t v57 = swift_slowAlloc();
  uint64_t v82 = v57;
  *(_DWORD *)uint64_t v56 = 67109378;
  LODWORD(__dst[0]) = v53 & 1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *(_WORD *)(v56 + 8) = 2080;
  outlined init with copy of NetworkConnectionProtocol?(a2 + 1096, (uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
  uint64_t v58 = __dst[3];
  if (__dst[3])
  {
    uint64_t v59 = a4;
    uint64_t v60 = __dst[4];
    __swift_project_boxed_opaque_existential_1(__dst, __dst[3]);
    uint64_t v58 = (*(uint64_t (**)(uint64_t, uint64_t))(v60 + 16))(v58, v60);
    unint64_t v62 = v61;
    outlined destroy of CommunicationProtocol?((uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
    if (v62 >> 60 != 15)
    {
      __dst[0] = v58;
      __dst[1] = v62;
      uint64_t v64 = String.init<A>(describing:)();
      unint64_t v63 = v65;
      a4 = v59;
      goto LABEL_49;
    }
    a4 = v59;
  }
  else
  {
    outlined destroy of CommunicationProtocol?((uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
    unint64_t v62 = 0xF000000000000000;
  }
  outlined consume of Data?(v58, v62);
  unint64_t v63 = 0xE800000000000000;
  uint64_t v64 = 0x6566617320746F4ELL;
LABEL_49:
  __dst[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v64, v63, &v82);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_release_n();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_25D6CC000, v54, v55, "Background Connection - Fallback: Can fallback %{BOOL}d. Buffer: %s", (uint8_t *)v56, 0x12u);
  swift_arrayDestroy();
  MEMORY[0x2611B3750](v57, -1, -1);
  MEMORY[0x2611B3750](v56, -1, -1);

LABEL_50:
  if (v53)
  {
    swift_retain();
    id v66 = a4;
    specialized BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(v80, v77, a2, v76, a4, v24);
    swift_release();
  }
  else
  {
    char v67 = Logger.logObject.getter();
    os_log_type_t v68 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v67, v68))
    {
      long long v69 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v69 = 0;
      _os_log_impl(&dword_25D6CC000, v67, v68, "Background Connection - Fallback: No fallback available.", v69, 2u);
      MEMORY[0x2611B3750](v69, -1, -1);
    }

    long long v71 = BackgroundConnection.communicationProtocol.modify();
    uint64_t v72 = *(void *)(v70 + 24);
    if (v72)
    {
      uint64_t v73 = *(void *)(v70 + 32);
      __swift_mutable_project_boxed_opaque_existential_1(v70, *(void *)(v70 + 24));
      (*(void (**)(void, unint64_t, uint64_t, uint64_t))(v73 + 24))(0, 0xF000000000000000, v72, v73);
    }
    ((void (*)(uint64_t *, void))v71)(__dst, 0);
    __dst[2] = 0;
    __dst[0] = 9;
    __dst[1] = 0;
    *(_OWORD *)&__dst[3] = xmmword_25D790FF0;
    closure #1 in closure #1 in BackgroundConnection.connectionProvider(_:received:)((uint64_t)__dst, v76, a4);
    swift_release();
  }
  swift_release();
}

void specialized BackgroundConnection.fallbackToNextConnectionMethodWithError(_:with:)()
{
  OUTLINED_FUNCTION_14_7();
  uint64_t v95 = v5;
  uint64_t v96 = v6;
  OUTLINED_FUNCTION_93_2();
  OUTLINED_FUNCTION_65_2(v7, *MEMORY[0x263EF8340]);
  uint64_t v90 = v1;
  swift_retain();
  outlined retain of NetworkConnectionError(v4, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
  char v8 = ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)__dst, v0);
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  __swift_project_value_buffer(v9, (uint64_t)static Logger.siriNetwork);
  swift_retain_n();
  id v10 = v3;
  swift_retain();
  id v11 = v3;
  id v12 = Logger.logObject.getter();
  uint64_t v13 = static os_log_type_t.default.getter();
  if (OUTLINED_FUNCTION_93_0((os_log_type_t)v13))
  {
    id v14 = (uint8_t *)OUTLINED_FUNCTION_135();
    os_log_type_t v15 = (void *)OUTLINED_FUNCTION_36_2();
    __dst[0] = OUTLINED_FUNCTION_10_0();
    *(_DWORD *)id v14 = 136315650;
    uint64_t v16 = 0x6E776F6E6B6E75;
    uint64_t v85 = (uint64_t)v4;
    switch(v2[1136])
    {
      case 1:
        uint64_t v16 = OUTLINED_FUNCTION_11_8();
        break;
      case 2:
        uint64_t v16 = OUTLINED_FUNCTION_21_5();
        break;
      case 3:
        uint64_t v16 = OUTLINED_FUNCTION_20_5();
        break;
      default:
        break;
    }
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, 0xE700000000000000, __dst);
    OUTLINED_FUNCTION_51_2();
    OUTLINED_FUNCTION_25_4();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_144();
    if (v3)
    {
      id v17 = v3;
      uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
      v92[0] = v18;
      OUTLINED_FUNCTION_50_1();
    }
    else
    {
      v92[0] = 0;
      OUTLINED_FUNCTION_50_1();
      uint64_t v18 = 0;
    }
    *os_log_type_t v15 = v18;

    OUTLINED_FUNCTION_103_2();
    OUTLINED_FUNCTION_63_0();
    swift_release();
    _os_log_impl(&dword_25D6CC000, v12, (os_log_type_t)v13, "Background Connection - Fallback: Start. Current method: %s. Error: %@. Uses Proxy: %{BOOL}d", v14, 0x1Cu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    OUTLINED_FUNCTION_48_2();
    OUTLINED_FUNCTION_1_2();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_1_2();

    uint64_t v4 = (void *)v85;
    char v8 = v91;
  }
  else
  {
    swift_release_n();

    swift_release();
  }
  if (!v8)
  {
    if (v2[1136] != 1 || v2[139] != 1) {
      goto LABEL_28;
    }
    if (v2[138] == 1)
    {
      id v19 = v3;
      id v20 = v3;
      id v21 = Logger.logObject.getter();
      os_log_type_t v22 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v21, v22))
      {
        int v23 = (uint8_t *)OUTLINED_FUNCTION_12_0();
        double v24 = (void *)OUTLINED_FUNCTION_36_2();
        *(_DWORD *)int v23 = 138412290;
        if (v3)
        {
          id v25 = v3;
          uint64_t v26 = _swift_stdlib_bridgeErrorToNSError();
          __dst[0] = v26;
          OUTLINED_FUNCTION_27_5();
        }
        else
        {
          __dst[0] = 0;
          OUTLINED_FUNCTION_27_5();
          uint64_t v26 = 0;
        }
        *double v24 = v26;

        _os_log_impl(&dword_25D6CC000, v21, v22, "Background Connection - Fallback: Resetting connection method on error (%@). Trying Peer now.", v23, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_1_2();
      }
      else
      {
      }
      memcpy(__dst, __src, 0x204uLL);
      char v8 = ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)__dst, 0);
      v2[138] = 0;
      goto LABEL_29;
    }
    char v8 = 0;
    if (!AFHasCellularData() || !v3) {
      goto LABEL_29;
    }
    swift_getErrorValue();
    id v27 = v3;
    if (Error.sn_isNetworkDown()())
    {
      id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AB0]), sel_init);
      objc_msgSend(v28, sel_systemUptime);

      OUTLINED_FUNCTION_131_0();
      if (!(!v30 & v29))
      {
        id v70 = v3;
        id v71 = v3;
        uint64_t v72 = Logger.logObject.getter();
        os_log_type_t v73 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v72, v73))
        {
          OUTLINED_FUNCTION_12_0();
          uint64_t v74 = (void *)OUTLINED_FUNCTION_36_2();
          OUTLINED_FUNCTION_133((int)v74, v75, v76, v77, v78, v79, v80, v81, 5.7779e-34, v84, v85, (uint64_t)__src, v87, v88, v89, v90, v3);
          unint64_t v82 = _swift_stdlib_bridgeErrorToNSError();
          OUTLINED_FUNCTION_33_6(v82);
          *uint64_t v74 = v13;

          OUTLINED_FUNCTION_73_2(&dword_25D6CC000, v72, v83, "Background Connection - Fallback: Resetting connection method on error (%@) while waiting for cellular.");
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          OUTLINED_FUNCTION_89_0();
          OUTLINED_FUNCTION_1_2();
          OUTLINED_FUNCTION_1_2();
        }
        else
        {
        }
        OUTLINED_FUNCTION_54_3(__dst);
        OUTLINED_FUNCTION_54_3(v92);
        outlined retain of ConnectionConfiguration(__dst);
        char v8 = ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)v92, 0);

        outlined release of ConnectionConfiguration(__dst);
        goto LABEL_29;
      }
      uint64_t v31 = (void *)Logger.logObject.getter();
      os_log_type_t v32 = static os_log_type_t.default.getter();
      if (!OUTLINED_FUNCTION_47_2(v32))
      {

        goto LABEL_28;
      }
      uint64_t v33 = (_WORD *)OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_39_2(v33);
      OUTLINED_FUNCTION_26_3(&dword_25D6CC000, v34, v35, "Background Connection - Fallback: Ran out of time waiting for network to become available.");
      OUTLINED_FUNCTION_1_2();
    }
LABEL_28:
    char v8 = 0;
  }
LABEL_29:
  uint64_t v36 = OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_130_0(v36, v37, &demangling cache variable for type metadata for CommunicationProtocol?);
  if (__dst[3])
  {
    __swift_project_boxed_opaque_existential_1(__dst, __dst[3]);
    uint64_t v38 = OUTLINED_FUNCTION_40_3();
    uint64_t v40 = v39(v38);
    unint64_t v42 = v41;
    outlined destroy of CommunicationProtocol?((uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
    OUTLINED_FUNCTION_129_0();
    if (!(!v30 & v29))
    {
      outlined consume of Data?(v40, v42);
      if (v8)
      {
        char v43 = BackgroundConnection.canFallBackFromError(_:)((uint64_t)v3);
        goto LABEL_35;
      }
    }
  }
  else
  {
    outlined destroy of CommunicationProtocol?((uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
  }
  char v43 = 0;
LABEL_35:
  OUTLINED_FUNCTION_114_0();
  os_log_type_t v44 = Logger.logObject.getter();
  os_log_type_t v45 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v44, v45))
  {

    OUTLINED_FUNCTION_25_4();
    goto LABEL_44;
  }
  uint64_t v46 = swift_slowAlloc();
  uint64_t v93 = OUTLINED_FUNCTION_10_0();
  uint64_t v47 = OUTLINED_FUNCTION_32_4(1.5047e-36);
  *(_WORD *)(v46 + 8) = 2080;
  OUTLINED_FUNCTION_130_0(v47, v48, &demangling cache variable for type metadata for CommunicationProtocol?);
  uint64_t v49 = __dst[3];
  if (!__dst[3])
  {
    outlined destroy of CommunicationProtocol?((uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
    unint64_t v53 = 0xF000000000000000;
    goto LABEL_42;
  }
  uint64_t v4 = (void *)__dst[4];
  __swift_project_boxed_opaque_existential_1(__dst, __dst[3]);
  uint64_t v50 = OUTLINED_FUNCTION_49_3();
  uint64_t v49 = v51(v50);
  unint64_t v53 = v52;
  outlined destroy of CommunicationProtocol?((uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
  OUTLINED_FUNCTION_129_0();
  if (!v30 & v29)
  {
    OUTLINED_FUNCTION_124_0();
LABEL_42:
    outlined consume of Data?(v49, v53);
    uint64_t v55 = OUTLINED_FUNCTION_87_2();
    goto LABEL_43;
  }
  __dst[0] = v49;
  __dst[1] = v53;
  String.init<A>(describing:)();
  unint64_t v53 = v54;
  OUTLINED_FUNCTION_124_0();
LABEL_43:
  unint64_t v56 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v55, v53, &v93);
  OUTLINED_FUNCTION_60_3(v56);
  OUTLINED_FUNCTION_25_4();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_25D6CC000, v44, v45, "Background Connection - Fallback: Can fallback %{BOOL}d. Buffer: %s", (uint8_t *)v46, 0x12u);
  OUTLINED_FUNCTION_95_2();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_2();

LABEL_44:
  if (v43)
  {
    swift_retain();
    outlined retain of NetworkConnectionError(v4, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
    double v57 = OUTLINED_FUNCTION_46_1();
    v58(v57);
  }
  else
  {
    uint64_t v59 = (void *)Logger.logObject.getter();
    os_log_type_t v60 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_47_2(v60))
    {
      unint64_t v61 = (_WORD *)OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_39_2(v61);
      OUTLINED_FUNCTION_26_3(&dword_25D6CC000, v62, v63, "Background Connection - Fallback: No fallback available.");
      OUTLINED_FUNCTION_1_2();
    }

    unint64_t v65 = BackgroundConnection.communicationProtocol.modify();
    if (*(void *)(v64 + 24))
    {
      __swift_mutable_project_boxed_opaque_existential_1(v64, *(void *)(v64 + 24));
      uint64_t v66 = OUTLINED_FUNCTION_35_3();
      v67(v66);
    }
    os_log_type_t v68 = OUTLINED_FUNCTION_138();
    ((void (*)(unint64_t *))v65)(v68);
    OUTLINED_FUNCTION_120_0();
    OUTLINED_FUNCTION_44_2((__n128)xmmword_25D790FF0);
    v69();
  }
  swift_release();
  outlined retain of NetworkConnectionError(v4, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
  swift_release();
  outlined retain of NetworkConnectionError(v4, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
  OUTLINED_FUNCTION_23_5();
}

{
  Swift::Int v0;
  uint64_t v1;
  unsigned char *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  char v30;
  char v31;
  void *v32;
  os_log_type_t v33;
  _WORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t);
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t);
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  id v58;
  double v59;
  void (*v60)(double);
  void *v61;
  os_log_type_t v62;
  _WORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)();
  uint64_t v68;
  void (*v69)(uint64_t);
  unint64_t *v70;
  void (*v71)(void);
  id v72;
  id v73;
  NSObject *v74;
  os_log_type_t v75;
  void *v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *__src;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  void v94[65];
  uint64_t v95;
  uint64_t __dst[67];
  uint64_t v97;
  uint64_t v98;

  OUTLINED_FUNCTION_14_7();
  int v97 = v5;
  os_log_type_t v98 = v6;
  OUTLINED_FUNCTION_93_2();
  OUTLINED_FUNCTION_65_2(v7, *MEMORY[0x263EF8340]);
  int v92 = v1;
  swift_retain();
  char v8 = v4;
  uint64_t v9 = ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)__dst, v0);
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  id v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)static Logger.siriNetwork);
  swift_retain_n();
  id v11 = v3;
  swift_retain();
  id v12 = v3;
  uint64_t v13 = Logger.logObject.getter();
  id v14 = static os_log_type_t.default.getter();
  if (OUTLINED_FUNCTION_93_0((os_log_type_t)v14))
  {
    os_log_type_t v15 = (uint8_t *)OUTLINED_FUNCTION_135();
    uint64_t v16 = (void *)OUTLINED_FUNCTION_36_2();
    __dst[0] = OUTLINED_FUNCTION_10_0();
    *(_DWORD *)os_log_type_t v15 = 136315650;
    id v17 = 0x6E776F6E6B6E75;
    uint64_t v87 = (uint64_t)v4;
    switch(v2[1136])
    {
      case 1:
        id v17 = OUTLINED_FUNCTION_11_8();
        break;
      case 2:
        id v17 = OUTLINED_FUNCTION_21_5();
        break;
      case 3:
        id v17 = OUTLINED_FUNCTION_20_5();
        break;
      default:
        break;
    }
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, 0xE700000000000000, __dst);
    OUTLINED_FUNCTION_51_2();
    OUTLINED_FUNCTION_25_4();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_144();
    if (v3)
    {
      uint64_t v18 = v3;
      id v19 = _swift_stdlib_bridgeErrorToNSError();
      v94[0] = v19;
      OUTLINED_FUNCTION_50_1();
    }
    else
    {
      v94[0] = 0;
      OUTLINED_FUNCTION_50_1();
      id v19 = 0;
    }
    *uint64_t v16 = v19;

    OUTLINED_FUNCTION_103_2();
    OUTLINED_FUNCTION_63_0();
    swift_release();
    _os_log_impl(&dword_25D6CC000, v13, (os_log_type_t)v14, "Background Connection - Fallback: Start. Current method: %s. Error: %@. Uses Proxy: %{BOOL}d", v15, 0x1Cu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    OUTLINED_FUNCTION_48_2();
    OUTLINED_FUNCTION_1_2();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_1_2();

    uint64_t v4 = (void *)v87;
    uint64_t v9 = v93;
  }
  else
  {
    swift_release_n();

    swift_release();
  }
  if (!v9)
  {
    if (v2[1136] != 1 || v2[139] != 1) {
      goto LABEL_28;
    }
    if (v2[138] == 1)
    {
      id v20 = v3;
      id v21 = v3;
      os_log_type_t v22 = Logger.logObject.getter();
      int v23 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v22, v23))
      {
        double v24 = (uint8_t *)OUTLINED_FUNCTION_12_0();
        id v25 = (void *)OUTLINED_FUNCTION_36_2();
        *(_DWORD *)double v24 = 138412290;
        if (v3)
        {
          uint64_t v26 = v3;
          id v27 = _swift_stdlib_bridgeErrorToNSError();
          __dst[0] = v27;
          OUTLINED_FUNCTION_27_5();
        }
        else
        {
          __dst[0] = 0;
          OUTLINED_FUNCTION_27_5();
          id v27 = 0;
        }
        *id v25 = v27;

        _os_log_impl(&dword_25D6CC000, v22, v23, "Background Connection - Fallback: Resetting connection method on error (%@). Trying Peer now.", v24, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_1_2();
      }
      else
      {
      }
      memcpy(__dst, __src, 0x204uLL);
      uint64_t v9 = ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)__dst, 0);
      v2[138] = 0;
      goto LABEL_29;
    }
    uint64_t v9 = 0;
    if (!AFHasCellularData() || !v3) {
      goto LABEL_29;
    }
    swift_getErrorValue();
    id v28 = v3;
    if (Error.sn_isNetworkDown()())
    {
      char v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AB0]), sel_init);
      objc_msgSend(v29, sel_systemUptime);

      OUTLINED_FUNCTION_131_0();
      if (!(!v31 & v30))
      {
        uint64_t v72 = v3;
        os_log_type_t v73 = v3;
        uint64_t v74 = Logger.logObject.getter();
        int v75 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v74, v75))
        {
          OUTLINED_FUNCTION_12_0();
          int v76 = (void *)OUTLINED_FUNCTION_36_2();
          OUTLINED_FUNCTION_133((int)v76, v77, v78, v79, v80, v81, v82, v83, 5.7779e-34, v86, v87, (uint64_t)__src, v89, v90, v91, v92, v3);
          uint64_t v84 = _swift_stdlib_bridgeErrorToNSError();
          OUTLINED_FUNCTION_33_6(v84);
          *int v76 = v14;

          OUTLINED_FUNCTION_73_2(&dword_25D6CC000, v74, v85, "Background Connection - Fallback: Resetting connection method on error (%@) while waiting for cellular.");
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          OUTLINED_FUNCTION_89_0();
          OUTLINED_FUNCTION_1_2();
          OUTLINED_FUNCTION_1_2();
        }
        else
        {
        }
        OUTLINED_FUNCTION_54_3(__dst);
        OUTLINED_FUNCTION_54_3(v94);
        outlined retain of ConnectionConfiguration(__dst);
        uint64_t v9 = ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)v94, 0);

        outlined release of ConnectionConfiguration(__dst);
        goto LABEL_29;
      }
      os_log_type_t v32 = (void *)Logger.logObject.getter();
      uint64_t v33 = static os_log_type_t.default.getter();
      if (!OUTLINED_FUNCTION_47_2(v33))
      {

        goto LABEL_28;
      }
      uint64_t v34 = (_WORD *)OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_39_2(v34);
      OUTLINED_FUNCTION_26_3(&dword_25D6CC000, v35, v36, "Background Connection - Fallback: Ran out of time waiting for network to become available.");
      OUTLINED_FUNCTION_1_2();
    }
LABEL_28:
    uint64_t v9 = 0;
  }
LABEL_29:
  uint64_t v37 = OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_130_0(v37, v38, &demangling cache variable for type metadata for CommunicationProtocol?);
  if (__dst[3])
  {
    __swift_project_boxed_opaque_existential_1(__dst, __dst[3]);
    os_log_type_t v39 = OUTLINED_FUNCTION_40_3();
    unint64_t v41 = v40(v39);
    char v43 = v42;
    outlined destroy of CommunicationProtocol?((uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
    OUTLINED_FUNCTION_129_0();
    if (!(!v31 & v30))
    {
      outlined consume of Data?(v41, v43);
      if (v9)
      {
        os_log_type_t v44 = BackgroundConnection.canFallBackFromError(_:)((uint64_t)v3);
        goto LABEL_35;
      }
    }
  }
  else
  {
    outlined destroy of CommunicationProtocol?((uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
  }
  os_log_type_t v44 = 0;
LABEL_35:
  OUTLINED_FUNCTION_114_0();
  os_log_type_t v45 = Logger.logObject.getter();
  uint64_t v46 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v45, v46))
  {

    OUTLINED_FUNCTION_25_4();
    goto LABEL_44;
  }
  uint64_t v47 = swift_slowAlloc();
  uint64_t v95 = OUTLINED_FUNCTION_10_0();
  uint64_t v48 = OUTLINED_FUNCTION_32_4(1.5047e-36);
  *(_WORD *)(v47 + 8) = 2080;
  OUTLINED_FUNCTION_130_0(v48, v49, &demangling cache variable for type metadata for CommunicationProtocol?);
  uint64_t v50 = __dst[3];
  if (!__dst[3])
  {
    outlined destroy of CommunicationProtocol?((uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
    unint64_t v54 = 0xF000000000000000;
    goto LABEL_42;
  }
  uint64_t v4 = (void *)__dst[4];
  __swift_project_boxed_opaque_existential_1(__dst, __dst[3]);
  unint64_t v51 = OUTLINED_FUNCTION_49_3();
  uint64_t v50 = v52(v51);
  unint64_t v54 = v53;
  outlined destroy of CommunicationProtocol?((uint64_t)__dst, &demangling cache variable for type metadata for CommunicationProtocol?);
  OUTLINED_FUNCTION_129_0();
  if (!v31 & v30)
  {
    OUTLINED_FUNCTION_124_0();
LABEL_42:
    outlined consume of Data?(v50, v54);
    unint64_t v56 = OUTLINED_FUNCTION_87_2();
    goto LABEL_43;
  }
  __dst[0] = v50;
  __dst[1] = v54;
  String.init<A>(describing:)();
  unint64_t v54 = v55;
  OUTLINED_FUNCTION_124_0();
LABEL_43:
  double v57 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v56, v54, &v95);
  OUTLINED_FUNCTION_60_3(v57);
  OUTLINED_FUNCTION_25_4();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_25D6CC000, v45, v46, "Background Connection - Fallback: Can fallback %{BOOL}d. Buffer: %s", (uint8_t *)v47, 0x12u);
  OUTLINED_FUNCTION_95_2();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_2();

LABEL_44:
  if (v44)
  {
    swift_retain();
    uint64_t v58 = v4;
    uint64_t v59 = OUTLINED_FUNCTION_46_1();
    v60(v59);
  }
  else
  {
    unint64_t v61 = (void *)Logger.logObject.getter();
    uint64_t v62 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_47_2(v62))
    {
      uint64_t v63 = (_WORD *)OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_39_2(v63);
      OUTLINED_FUNCTION_26_3(&dword_25D6CC000, v64, v65, "Background Connection - Fallback: No fallback available.");
      OUTLINED_FUNCTION_1_2();
    }

    char v67 = BackgroundConnection.communicationProtocol.modify();
    if (*(void *)(v66 + 24))
    {
      __swift_mutable_project_boxed_opaque_existential_1(v66, *(void *)(v66 + 24));
      os_log_type_t v68 = OUTLINED_FUNCTION_35_3();
      v69(v68);
    }
    id v70 = OUTLINED_FUNCTION_138();
    ((void (*)(unint64_t *))v67)(v70);
    OUTLINED_FUNCTION_120_0();
    OUTLINED_FUNCTION_44_2((__n128)xmmword_25D790FF0);
    v71();
  }
  swift_release();

  swift_release();
  OUTLINED_FUNCTION_23_5();
}

void specialized BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(int a1, void *a2, uint64_t a3, uint64_t a4, void *a5, double a6)
{
  LODWORD(v58) = a1;
  uint64_t v11 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v56 = *(void *)(v11 - 8);
  uint64_t v57 = v11;
  MEMORY[0x270FA5388](v11);
  unint64_t v53 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = type metadata accessor for DispatchQoS();
  uint64_t v54 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  unint64_t v52 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = type metadata accessor for DispatchTime();
  uint64_t v50 = *(void *)(v51 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v51);
  uint64_t v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v49 = (char *)&v48 - v17;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a4;
  *(void *)(v18 + 24) = a5;
  uint64_t v59 = a4;
  swift_retain();
  id v60 = a5;
  id v19 = a5;
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v20 = type metadata accessor for Logger();
  __swift_project_value_buffer(v20, (uint64_t)static Logger.siriNetwork);
  id v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = v18;
    double v24 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)double v24 = 134217984;
    *(double *)aBlock = a6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_25D6CC000, v21, v22, "Background Connection - Fallback: Fallback after delay %f.", v24, 0xCu);
    id v25 = v24;
    uint64_t v18 = v23;
    MEMORY[0x2611B3750](v25, -1, -1);
  }

  swift_beginAccess();
  specialized Set.contains(_:)(*(unsigned char *)(a3 + 1136), *(void *)(a3 + 1152));
  if (v26)
  {
    Swift::Bool v27 = 0;
  }
  else if (a2)
  {
    Swift::Int v28 = *(unsigned __int8 *)(a3 + 1136);
    swift_beginAccess();
    id v29 = a2;
    specialized Set._Variant.insert(_:)(&v61, v28);
    swift_endAccess();
    swift_getErrorValue();
    Swift::Bool v27 = Error.isFallbackConnectionMethodRetryable(for:)(*(SiriNetwork::ConnectionMethod *)(a3 + 1136));
  }
  else
  {
    Swift::Bool v27 = 1;
  }
  BackgroundConnection.closeConnectionAndPrepareForReconnect(_:)(1);
  uint64_t v30 = swift_allocObject();
  swift_weakInit();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v30;
  unint64_t v32 = v58;
  *(unsigned char *)(v31 + 24) = v58;
  uint64_t v33 = v27;
  *(unsigned char *)(v31 + 25) = v33;
  *(void *)(v31 + 32) = partial apply for closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(error:);
  *(void *)(v31 + 40) = v18;
  if (a6 <= 0.0)
  {
    uint64_t v43 = v59;
    os_log_type_t v44 = (void *)v32;
    swift_retain();
    id v45 = v60;
    id v46 = v60;
    swift_retain();
    uint64_t v47 = swift_retain();
    specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(v47, v44, v33, v43, v45);
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v58 = v18;
    swift_retain();
    uint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 134217984;
      *(double *)aBlock = a6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_25D6CC000, v34, v35, "Background Connection - Fallback: Delaying start %f.", v36, 0xCu);
      MEMORY[0x2611B3750](v36, -1, -1);
    }

    uint64_t v48 = *(void *)(a3 + 32);
    static DispatchTime.now()();
    uint64_t v37 = v49;
    MEMORY[0x2611B2190](v16, a6);
    uint64_t v50 = *(void *)(v50 + 8);
    uint64_t v38 = v51;
    ((void (*)(char *, uint64_t))v50)(v16, v51);
    aBlock[4] = partial apply for specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:);
    aBlock[5] = v31;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    aBlock[3] = &block_descriptor_150_0;
    os_log_type_t v39 = _Block_copy(aBlock);
    swift_retain();
    uint64_t v40 = v52;
    static DispatchQoS.unspecified.getter();
    uint64_t v61 = MEMORY[0x263F8EE78];
    lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    unint64_t v41 = v53;
    uint64_t v42 = v57;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x2611B24C0](v37, v40, v41, v39);
    _Block_release(v39);
    swift_release();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v41, v42);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v40, v55);
    ((void (*)(char *, uint64_t))v50)(v37, v38);
    swift_release();
  }
  swift_release();
  swift_release();
}

{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint8_t *v25;
  char v26;
  Swift::Bool v27;
  Swift::Int v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  SiriNetwork::ConnectionMethod v32;
  char v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  char *v37;
  uint64_t v38;
  void *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  SiriNetwork::ConnectionMethod v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  void aBlock[6];

  LODWORD(v58) = a1;
  uint64_t v11 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v56 = *(void *)(v11 - 8);
  uint64_t v57 = v11;
  MEMORY[0x270FA5388](v11);
  unint64_t v53 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = type metadata accessor for DispatchQoS();
  uint64_t v54 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  unint64_t v52 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = type metadata accessor for DispatchTime();
  uint64_t v50 = *(void *)(v51 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v51);
  uint64_t v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v49 = (char *)&v48 - v17;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a4;
  *(void *)(v18 + 24) = a5;
  uint64_t v59 = a4;
  swift_retain();
  id v60 = a5;
  id v19 = a5;
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v20 = type metadata accessor for Logger();
  __swift_project_value_buffer(v20, (uint64_t)static Logger.siriNetwork);
  id v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = v18;
    double v24 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)double v24 = 134217984;
    *(double *)aBlock = a6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_25D6CC000, v21, v22, "Background Connection - Fallback: Fallback after delay %f.", v24, 0xCu);
    id v25 = v24;
    uint64_t v18 = v23;
    MEMORY[0x2611B3750](v25, -1, -1);
  }

  swift_beginAccess();
  specialized Set.contains(_:)(*(unsigned char *)(a3 + 1136), *(void *)(a3 + 1152));
  if (v26)
  {
    Swift::Bool v27 = 0;
  }
  else if (a2)
  {
    Swift::Int v28 = *(unsigned __int8 *)(a3 + 1136);
    swift_beginAccess();
    id v29 = a2;
    specialized Set._Variant.insert(_:)(&v61, v28);
    swift_endAccess();
    swift_getErrorValue();
    Swift::Bool v27 = Error.isFallbackConnectionMethodRetryable(for:)(*(SiriNetwork::ConnectionMethod *)(a3 + 1136));
  }
  else
  {
    Swift::Bool v27 = 1;
  }
  BackgroundConnection.closeConnectionAndPrepareForReconnect(_:)(1);
  uint64_t v30 = swift_allocObject();
  swift_weakInit();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v30;
  unint64_t v32 = (char)v58;
  *(unsigned char *)(v31 + 24) = v58;
  uint64_t v33 = v27;
  *(unsigned char *)(v31 + 25) = v33;
  *(void *)(v31 + 32) = partial apply for closure #1 in closure #1 in BackgroundConnection.connectionProvider(_:received:);
  *(void *)(v31 + 40) = v18;
  if (a6 <= 0.0)
  {
    uint64_t v43 = v59;
    os_log_type_t v44 = v32;
    swift_retain();
    id v45 = v60;
    id v46 = v60;
    swift_retain();
    uint64_t v47 = swift_retain();
    specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(v47, v44, v33, v43, v45);
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v58 = v18;
    swift_retain();
    uint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 134217984;
      *(double *)aBlock = a6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_25D6CC000, v34, v35, "Background Connection - Fallback: Delaying start %f.", v36, 0xCu);
      MEMORY[0x2611B3750](v36, -1, -1);
    }

    uint64_t v48 = *(void *)(a3 + 32);
    static DispatchTime.now()();
    uint64_t v37 = v49;
    MEMORY[0x2611B2190](v16, a6);
    uint64_t v50 = *(void *)(v50 + 8);
    uint64_t v38 = v51;
    ((void (*)(char *, uint64_t))v50)(v16, v51);
    aBlock[4] = partial apply for specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:);
    aBlock[5] = v31;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    aBlock[3] = &block_descriptor_268_0;
    os_log_type_t v39 = _Block_copy(aBlock);
    swift_retain();
    uint64_t v40 = v52;
    static DispatchQoS.unspecified.getter();
    uint64_t v61 = MEMORY[0x263F8EE78];
    lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    unint64_t v41 = v53;
    uint64_t v42 = v57;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x2611B24C0](v37, v40, v41, v39);
    _Block_release(v39);
    swift_release();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v41, v42);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v40, v55);
    ((void (*)(char *, uint64_t))v50)(v37, v38);
    swift_release();
  }
  swift_release();
  swift_release();
}

{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint8_t *v25;
  char v26;
  Swift::Bool v27;
  Swift::Int v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  char *v37;
  uint64_t v38;
  void *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  void aBlock[6];

  LODWORD(v58) = a1;
  uint64_t v11 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v56 = *(void *)(v11 - 8);
  uint64_t v57 = v11;
  MEMORY[0x270FA5388](v11);
  unint64_t v53 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = type metadata accessor for DispatchQoS();
  uint64_t v54 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  unint64_t v52 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = type metadata accessor for DispatchTime();
  uint64_t v50 = *(void *)(v51 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v51);
  uint64_t v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v49 = (char *)&v48 - v17;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a4;
  *(void *)(v18 + 24) = a5;
  uint64_t v59 = a4;
  swift_retain();
  id v60 = a5;
  id v19 = a5;
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v20 = type metadata accessor for Logger();
  __swift_project_value_buffer(v20, (uint64_t)static Logger.siriNetwork);
  id v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = v18;
    double v24 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)double v24 = 134217984;
    *(double *)aBlock = a6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_25D6CC000, v21, v22, "Background Connection - Fallback: Fallback after delay %f.", v24, 0xCu);
    id v25 = v24;
    uint64_t v18 = v23;
    MEMORY[0x2611B3750](v25, -1, -1);
  }

  swift_beginAccess();
  specialized Set.contains(_:)(*(unsigned char *)(a3 + 1136), *(void *)(a3 + 1152));
  if (v26)
  {
    Swift::Bool v27 = 0;
  }
  else if (a2)
  {
    Swift::Int v28 = *(unsigned __int8 *)(a3 + 1136);
    swift_beginAccess();
    id v29 = a2;
    specialized Set._Variant.insert(_:)(&v61, v28);
    swift_endAccess();
    swift_getErrorValue();
    Swift::Bool v27 = Error.isFallbackConnectionMethodRetryable(for:)(*(SiriNetwork::ConnectionMethod *)(a3 + 1136));
  }
  else
  {
    Swift::Bool v27 = 1;
  }
  BackgroundConnection.closeConnectionAndPrepareForReconnect(_:)(1);
  uint64_t v30 = swift_allocObject();
  swift_weakInit();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v30;
  unint64_t v32 = v58;
  *(unsigned char *)(v31 + 24) = v58;
  uint64_t v33 = v27;
  *(unsigned char *)(v31 + 25) = v33;
  *(void *)(v31 + 32) = partial apply for closure #2 in closure #1 in BackgroundConnection.setupReadHandlerOnProvider();
  *(void *)(v31 + 40) = v18;
  if (a6 <= 0.0)
  {
    uint64_t v43 = v59;
    os_log_type_t v44 = v32;
    swift_retain();
    id v45 = v60;
    id v46 = v60;
    swift_retain();
    uint64_t v47 = swift_retain();
    specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(v47, v44, v33, v43, v45);
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v58 = v18;
    swift_retain();
    uint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 134217984;
      *(double *)aBlock = a6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_25D6CC000, v34, v35, "Background Connection - Fallback: Delaying start %f.", v36, 0xCu);
      MEMORY[0x2611B3750](v36, -1, -1);
    }

    uint64_t v48 = *(void *)(a3 + 32);
    static DispatchTime.now()();
    uint64_t v37 = v49;
    MEMORY[0x2611B2190](v16, a6);
    uint64_t v50 = *(void *)(v50 + 8);
    uint64_t v38 = v51;
    ((void (*)(char *, uint64_t))v50)(v16, v51);
    aBlock[4] = partial apply for specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:);
    aBlock[5] = v31;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    aBlock[3] = &block_descriptor_185;
    os_log_type_t v39 = _Block_copy(aBlock);
    swift_retain();
    uint64_t v40 = v52;
    static DispatchQoS.unspecified.getter();
    uint64_t v61 = MEMORY[0x263F8EE78];
    lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    unint64_t v41 = v53;
    uint64_t v42 = v57;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x2611B24C0](v37, v40, v41, v39);
    _Block_release(v39);
    swift_release();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v41, v42);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v40, v55);
    ((void (*)(char *, uint64_t))v50)(v37, v38);
    swift_release();
  }
  swift_release();
  swift_release();
}

void *specialized BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(int a1, void *a2, uint64_t a3, uint64_t a4, void *a5, double a6)
{
  LODWORD(v57) = a1;
  uint64_t v11 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v55 = *(void *)(v11 - 8);
  uint64_t v56 = v11;
  MEMORY[0x270FA5388](v11);
  unint64_t v52 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = type metadata accessor for DispatchQoS();
  uint64_t v53 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v51 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = type metadata accessor for DispatchTime();
  uint64_t v49 = *(void *)(v50 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v50);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v48 = (char *)&v47 - v17;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a4;
  outlined init with take of NetworkConnectionError((uint64_t)a5, v18 + 24);
  uint64_t v58 = a4;
  swift_retain();
  uint64_t v59 = a5;
  outlined retain of NetworkConnectionError(a5, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v19 = type metadata accessor for Logger();
  __swift_project_value_buffer(v19, (uint64_t)static Logger.siriNetwork);
  uint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = v18;
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 134217984;
    *(double *)aBlock = a6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_25D6CC000, v20, v21, "Background Connection - Fallback: Fallback after delay %f.", v23, 0xCu);
    double v24 = v23;
    uint64_t v18 = v22;
    MEMORY[0x2611B3750](v24, -1, -1);
  }

  swift_beginAccess();
  specialized Set.contains(_:)(*(unsigned char *)(a3 + 1136), *(void *)(a3 + 1152));
  if (v25)
  {
    Swift::Bool v26 = 0;
  }
  else if (a2)
  {
    Swift::Int v27 = *(unsigned __int8 *)(a3 + 1136);
    swift_beginAccess();
    id v28 = a2;
    specialized Set._Variant.insert(_:)(&v60, v27);
    swift_endAccess();
    swift_getErrorValue();
    Swift::Bool v26 = Error.isFallbackConnectionMethodRetryable(for:)(*(SiriNetwork::ConnectionMethod *)(a3 + 1136));
  }
  else
  {
    Swift::Bool v26 = 1;
  }
  BackgroundConnection.closeConnectionAndPrepareForReconnect(_:)(1);
  uint64_t v29 = swift_allocObject();
  swift_weakInit();
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v29;
  unint64_t v31 = v57;
  *(unsigned char *)(v30 + 24) = v57;
  uint64_t v32 = v26;
  *(unsigned char *)(v30 + 25) = v32;
  *(void *)(v30 + 32) = partial apply for closure #1 in closure #2 in BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:);
  *(void *)(v30 + 40) = v18;
  if (a6 <= 0.0)
  {
    uint64_t v42 = v58;
    uint64_t v43 = (void *)v31;
    swift_retain();
    os_log_type_t v44 = v59;
    outlined retain of NetworkConnectionError(v59, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
    swift_retain();
    uint64_t v45 = swift_retain();
    specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(v45, v43, v32, v42, v44);
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v57 = v18;
    swift_retain();
    uint64_t v33 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v33, v34))
    {
      os_log_type_t v35 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v35 = 134217984;
      *(double *)aBlock = a6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_25D6CC000, v33, v34, "Background Connection - Fallback: Delaying start %f.", v35, 0xCu);
      MEMORY[0x2611B3750](v35, -1, -1);
    }

    uint64_t v47 = *(void *)(a3 + 32);
    static DispatchTime.now()();
    uint64_t v36 = v48;
    MEMORY[0x2611B2190](v16, a6);
    uint64_t v49 = *(void *)(v49 + 8);
    uint64_t v37 = v50;
    ((void (*)(char *, uint64_t))v49)(v16, v50);
    aBlock[4] = partial apply for specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:);
    aBlock[5] = v30;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    aBlock[3] = &block_descriptor_256;
    uint64_t v38 = _Block_copy(aBlock);
    swift_retain();
    os_log_type_t v39 = v51;
    static DispatchQoS.unspecified.getter();
    uint64_t v60 = MEMORY[0x263F8EE78];
    lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    uint64_t v40 = v52;
    uint64_t v41 = v56;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x2611B24C0](v36, v39, v40, v38);
    _Block_release(v38);
    swift_release();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v40, v41);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v39, v54);
    ((void (*)(char *, uint64_t))v49)(v36, v37);
    swift_release();
  }
  swift_release();
  swift_release();
  return outlined retain of NetworkConnectionError(v59, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
}

{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint8_t *v24;
  char v25;
  Swift::Bool v26;
  Swift::Int v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  char *v36;
  uint64_t v37;
  void *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void aBlock[6];

  LODWORD(v57) = a1;
  uint64_t v11 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v55 = *(void *)(v11 - 8);
  uint64_t v56 = v11;
  MEMORY[0x270FA5388](v11);
  unint64_t v52 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = type metadata accessor for DispatchQoS();
  uint64_t v53 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v51 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = type metadata accessor for DispatchTime();
  uint64_t v49 = *(void *)(v50 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v50);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v48 = (char *)&v47 - v17;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a4;
  outlined init with take of NetworkConnectionError((uint64_t)a5, v18 + 24);
  uint64_t v58 = a4;
  swift_retain();
  uint64_t v59 = a5;
  outlined retain of NetworkConnectionError(a5, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v19 = type metadata accessor for Logger();
  __swift_project_value_buffer(v19, (uint64_t)static Logger.siriNetwork);
  uint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = v18;
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 134217984;
    *(double *)aBlock = a6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_25D6CC000, v20, v21, "Background Connection - Fallback: Fallback after delay %f.", v23, 0xCu);
    double v24 = v23;
    uint64_t v18 = v22;
    MEMORY[0x2611B3750](v24, -1, -1);
  }

  swift_beginAccess();
  specialized Set.contains(_:)(*(unsigned char *)(a3 + 1136), *(void *)(a3 + 1152));
  if (v25)
  {
    Swift::Bool v26 = 0;
  }
  else if (a2)
  {
    Swift::Int v27 = *(unsigned __int8 *)(a3 + 1136);
    swift_beginAccess();
    id v28 = a2;
    specialized Set._Variant.insert(_:)(&v60, v27);
    swift_endAccess();
    swift_getErrorValue();
    Swift::Bool v26 = Error.isFallbackConnectionMethodRetryable(for:)(*(SiriNetwork::ConnectionMethod *)(a3 + 1136));
  }
  else
  {
    Swift::Bool v26 = 1;
  }
  BackgroundConnection.closeConnectionAndPrepareForReconnect(_:)(1);
  uint64_t v29 = swift_allocObject();
  swift_weakInit();
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v29;
  unint64_t v31 = v57;
  *(unsigned char *)(v30 + 24) = v57;
  uint64_t v32 = v26;
  *(unsigned char *)(v30 + 25) = v32;
  *(void *)(v30 + 32) = partial apply for closure #1 in closure #1 in BackgroundConnection.setupReadHandlerOnProvider();
  *(void *)(v30 + 40) = v18;
  if (a6 <= 0.0)
  {
    uint64_t v42 = v58;
    uint64_t v43 = (void *)v31;
    swift_retain();
    os_log_type_t v44 = v59;
    outlined retain of NetworkConnectionError(v59, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
    swift_retain();
    uint64_t v45 = swift_retain();
    specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(v45, v43, v32, v42, v44);
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v57 = v18;
    swift_retain();
    uint64_t v33 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v33, v34))
    {
      os_log_type_t v35 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v35 = 134217984;
      *(double *)aBlock = a6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_25D6CC000, v33, v34, "Background Connection - Fallback: Delaying start %f.", v35, 0xCu);
      MEMORY[0x2611B3750](v35, -1, -1);
    }

    uint64_t v47 = *(void *)(a3 + 32);
    static DispatchTime.now()();
    uint64_t v36 = v48;
    MEMORY[0x2611B2190](v16, a6);
    uint64_t v49 = *(void *)(v49 + 8);
    uint64_t v37 = v50;
    ((void (*)(char *, uint64_t))v49)(v16, v50);
    aBlock[4] = partial apply for specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:);
    aBlock[5] = v30;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    aBlock[3] = &block_descriptor_174;
    uint64_t v38 = _Block_copy(aBlock);
    swift_retain();
    os_log_type_t v39 = v51;
    static DispatchQoS.unspecified.getter();
    uint64_t v60 = MEMORY[0x263F8EE78];
    lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    uint64_t v40 = v52;
    uint64_t v41 = v56;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x2611B24C0](v36, v39, v40, v38);
    _Block_release(v38);
    swift_release();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v40, v41);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v39, v54);
    ((void (*)(char *, uint64_t))v49)(v36, v37);
    swift_release();
  }
  swift_release();
  swift_release();
  return outlined retain of NetworkConnectionError(v59, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
}

void specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(uint64_t a1, SiriNetwork::ConnectionMethod a2, char a3, uint64_t a4, void *a5)
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    __swift_project_value_buffer(v8, (uint64_t)static Logger.siriNetwork);
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_25D6CC000, v9, v10, "Background Connection - Fallback: Start new connection.", v11, 2u);
      MEMORY[0x2611B3750](v11, -1, -1);
    }

    BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(a2, (a3 & 1) == 0);
    if (v12) {

    }
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_release();
    swift_release();
  }
  swift_release();
}

void specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  OUTLINED_FUNCTION_22_0();
  if (swift_weakLoadStrong())
  {
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    uint64_t v8 = (void *)OUTLINED_FUNCTION_7(v7, (uint64_t)static Logger.siriNetwork);
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (OUTLINED_FUNCTION_18_4(v9))
    {
      *(_WORD *)OUTLINED_FUNCTION_2_0() = 0;
      OUTLINED_FUNCTION_141(&dword_25D6CC000, v10, v11, "Background Connection - Fallback: Start new connection.");
      OUTLINED_FUNCTION_1_2();
    }

    OUTLINED_FUNCTION_83_2();
    if (a2) {

    }
    OUTLINED_FUNCTION_22_0();
    swift_weakLoadStrong();
    OUTLINED_FUNCTION_136();
    swift_release();
  }
  swift_release();
}

void *specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  OUTLINED_FUNCTION_22_0();
  if (swift_weakLoadStrong())
  {
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    uint64_t v8 = (void *)OUTLINED_FUNCTION_7(v7, (uint64_t)static Logger.siriNetwork);
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (OUTLINED_FUNCTION_18_4(v9))
    {
      *(_WORD *)OUTLINED_FUNCTION_2_0() = 0;
      OUTLINED_FUNCTION_141(&dword_25D6CC000, v10, v11, "Background Connection - Fallback: Start new connection.");
      OUTLINED_FUNCTION_1_2();
    }

    OUTLINED_FUNCTION_83_2();
    if (a2) {

    }
    OUTLINED_FUNCTION_22_0();
    swift_weakLoadStrong();
    OUTLINED_FUNCTION_136();
    swift_release();
  }
  swift_release();
  return outlined retain of NetworkConnectionError(a5, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
}

uint64_t specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(uint64_t a1, SiriNetwork::ConnectionMethod a2, char a3, void (*a4)(long long *))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    __swift_project_value_buffer(v8, (uint64_t)static Logger.siriNetwork);
    os_log_type_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_25D6CC000, v9, v10, "Background Connection - Fallback: Start new connection.", v11, 2u);
      MEMORY[0x2611B3750](v11, -1, -1);
    }

    BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(a2, (a3 & 1) == 0);
    if (v12) {

    }
    long long v13 = xmmword_25D7934F0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v14 = 0;
    a4(&v13);
    return swift_release();
  }
  return result;
}

uint64_t BackgroundConnection.canFallBackFromError(_:)(uint64_t a1)
{
  if (!*(void *)(v1 + 1080)) {
    return 1;
  }
  uint64_t v4 = OUTLINED_FUNCTION_116_0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 496))(a1, v4, v2) & 1;
}

Swift::Void __swiftcall BackgroundConnection.setSendPings(_:)(Swift::Bool a1)
{
  OUTLINED_FUNCTION_22_0();
  outlined init with copy of NetworkConnectionProtocol?(v1 + 1096, (uint64_t)&v5, &demangling cache variable for type metadata for CommunicationProtocol?);
  if (v6)
  {
    outlined init with take of RPCOspreyConnectionProtocol(&v5, (uint64_t)v7);
    uint64_t v3 = v8;
    uint64_t v4 = v9;
    __swift_project_boxed_opaque_existential_1(v7, v8);
    (*(void (**)(Swift::Bool, uint64_t, uint64_t))(v4 + 152))(a1, v3, v4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  }
  else
  {
    outlined destroy of CommunicationProtocol?((uint64_t)&v5, &demangling cache variable for type metadata for CommunicationProtocol?);
  }
}

void closure #1 in BackgroundConnection.connectionProvider(_:received:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = (void *)(a1 + 16);
  OUTLINED_FUNCTION_24_2();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    goto LABEL_5;
  }
  uint64_t v9 = Strong;
  uint64_t v10 = *(void *)(Strong + 1080);
  if (!v10 || v10 != a2) {
    goto LABEL_4;
  }
  swift_getObjectType();
  OUTLINED_FUNCTION_132();
  uint64_t v11 = OUTLINED_FUNCTION_94_2();
  if (v4(v11))
  {
    type metadata accessor for BackgroundConnection();
    uint64_t v12 = swift_dynamicCastClass();
    if (!v12) {
      swift_unknownObjectRelease();
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  OUTLINED_FUNCTION_24_2();
  uint64_t v13 = swift_weakLoadStrong();
  uint64_t v14 = v13;
  if (v12)
  {
    if (!v13)
    {
      swift_unknownObjectRelease();
      swift_release();
LABEL_58:
      swift_unknownObjectRelease();
      goto LABEL_5;
    }
    swift_unknownObjectRelease();
    swift_release();
    if (v14 != v12)
    {
      swift_unknownObjectRelease();
LABEL_4:
      swift_release();
      goto LABEL_5;
    }
  }
  else if (v13)
  {
    swift_unknownObjectRelease();
    swift_release();
    goto LABEL_4;
  }
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  __swift_project_value_buffer(v15, (uint64_t)static Logger.siriNetwork);
  id v16 = a4;
  id v17 = a4;
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (_DWORD *)OUTLINED_FUNCTION_12_0();
    os_log_type_t v21 = (void *)OUTLINED_FUNCTION_36_2();
    _DWORD *v20 = 138412290;
    if (a4)
    {
      id v22 = a4;
      uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
      OUTLINED_FUNCTION_41_2();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
    }
    else
    {
      OUTLINED_FUNCTION_110_1();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v23 = 0;
    }
    *os_log_type_t v21 = v23;

    OUTLINED_FUNCTION_139(&dword_25D6CC000, v18, v19, "Background Connection - Provider: Error (%@)");
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_1_2();
  }
  else
  {
  }
  if (*(unsigned char *)(v9 + 1186) != 1)
  {
    if (!a4)
    {
      os_log_type_t v39 = (void *)Logger.logObject.getter();
      os_log_type_t v40 = static os_log_type_t.default.getter();
      if (OUTLINED_FUNCTION_9(v40))
      {
        *(_WORD *)OUTLINED_FUNCTION_2_0() = 0;
        OUTLINED_FUNCTION_3_0(&dword_25D6CC000, v41, v42, "Background Connection - Provider: Closing provider connection without error");
        OUTLINED_FUNCTION_1_2();
      }

      BackgroundConnection.cancel()();
      goto LABEL_57;
    }
    id v32 = a4;
    id v33 = a4;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
    if (OUTLINED_FUNCTION_111_0())
    {
      if (v62 >> 60 == 10 && !v63)
      {
        BOOL v34 = v62 == 0xA000000000000000 && v60 == (void *)7;
        if (v34 && v61 == 0)
        {
          os_log_type_t v35 = (void *)Logger.logObject.getter();
          os_log_type_t v36 = static os_log_type_t.default.getter();
          if (OUTLINED_FUNCTION_24_0(v36))
          {
            *(_WORD *)OUTLINED_FUNCTION_2_0() = 0;
            OUTLINED_FUNCTION_20_3(&dword_25D6CC000, v37, v38, "Background Connection - Provider: Closing provider connection without error because it was stale");
            OUTLINED_FUNCTION_1_2();
          }

          BackgroundConnection.cancel()();
LABEL_56:

          goto LABEL_57;
        }
      }
      outlined consume of NetworkConnectionError(v60, v61, *((uint64_t *)&v61 + 1), v62, v63);
    }
    if (AFDeviceSupportsSiriUOD())
    {
      id v43 = a4;
      if (OUTLINED_FUNCTION_111_0())
      {
        if (v62 >> 60 == 1)
        {
          id v44 = v60;
          id v45 = v60;
          id v46 = Logger.logObject.getter();
          os_log_type_t v47 = static os_log_type_t.default.getter();
          if (OUTLINED_FUNCTION_24_0(v47))
          {
            os_log_type_t type = v7;
            uint64_t v48 = (uint8_t *)OUTLINED_FUNCTION_12_0();
            uint64_t v58 = (void *)OUTLINED_FUNCTION_36_2();
            buf = v48;
            *(_DWORD *)uint64_t v48 = 138412290;
            lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
            uint64_t v49 = OUTLINED_FUNCTION_16_0();
            OUTLINED_FUNCTION_92_2(v49, v50);
            uint64_t v51 = _swift_stdlib_bridgeErrorToNSError();
            OUTLINED_FUNCTION_41_2();
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *uint64_t v58 = v51;
            outlined consume of NetworkConnectionError(v60, v61, *((uint64_t *)&v61 + 1), v62, v63);
            OUTLINED_FUNCTION_15_6();
            _os_log_impl(&dword_25D6CC000, v46, type, "Background Connection - Provider: Error (%@), but device support UOD.", buf, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            uint64_t v7 = v58;
            swift_arrayDestroy();
            OUTLINED_FUNCTION_1_2();
            OUTLINED_FUNCTION_1_2();
          }
          else
          {
            outlined consume of NetworkConnectionError(v60, v61, *((uint64_t *)&v61 + 1), v62, v63);
            OUTLINED_FUNCTION_15_6();
          }

          lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
          uint64_t v55 = OUTLINED_FUNCTION_16_0();
          OUTLINED_FUNCTION_92_2(v55, v56);
          BackgroundConnection.didEncounterError(_:)(v7);

          OUTLINED_FUNCTION_15_6();
          swift_unknownObjectRelease();

          *(unsigned char *)(v9 + 1187) = 0;
          goto LABEL_4;
        }
        OUTLINED_FUNCTION_15_6();
      }
    }
    uint64_t v52 = OUTLINED_FUNCTION_23_2();
    OUTLINED_FUNCTION_24_2();
    swift_weakLoadStrong();
    OUTLINED_FUNCTION_89();
    swift_weakInit();
    id v53 = a4;
    swift_release();
    id v54 = a4;
    swift_retain();
    specialized BackgroundConnection.fallbackToNextConnectionMethodWithError(_:with:)(a4, v9, v52, a4);
    swift_release();

    goto LABEL_56;
  }
  id v24 = a4;
  id v25 = a4;
  Swift::Bool v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.default.getter();
  if (!OUTLINED_FUNCTION_93_0(v27))
  {

LABEL_57:
    swift_release();
    goto LABEL_58;
  }
  id v28 = (uint8_t *)OUTLINED_FUNCTION_12_0();
  uint64_t v29 = (void *)OUTLINED_FUNCTION_36_2();
  *(_DWORD *)id v28 = 138412290;
  if (a4)
  {
    id v30 = a4;
    uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_41_2();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
  }
  else
  {
    OUTLINED_FUNCTION_110_1();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v31 = 0;
  }
  *uint64_t v29 = v31;

  _os_log_impl(&dword_25D6CC000, v26, v27, "Background Connection - Provider: Error (%@). Connection was Cancelled, none action is required", v28, 0xCu);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  swift_arrayDestroy();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_2();
  swift_release();
  swift_unknownObjectRelease();

LABEL_5:
  OUTLINED_FUNCTION_34_6();
}

uint64_t closure #1 in closure #1 in BackgroundConnection.connectionProvider(_:received:)(uint64_t a1, uint64_t a2, void *a3)
{
  long long v5 = *(void **)a1;
  unint64_t v4 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v6 = *(void *)(a1 + 24);
  uint64_t v8 = *(void **)(a1 + 32);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v10 = result;
    if (v4 >> 1 != 0xFFFFFFFF || v6 >= 2)
    {
      if (one-time initialization token for siriNetwork != -1) {
        swift_once();
      }
      uint64_t v12 = type metadata accessor for Logger();
      __swift_project_value_buffer(v12, (uint64_t)static Logger.siriNetwork);
      outlined copy of NetworkConnectionError?(v5, v4, v7, v6, v8);
      id v13 = a3;
      outlined copy of NetworkConnectionError?(v5, v4, v7, v6, v8);
      id v14 = a3;
      uint64_t v15 = Logger.logObject.getter();
      os_log_type_t v16 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = swift_slowAlloc();
        id v36 = a3;
        uint64_t v18 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v17 = 138412546;
        lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
        swift_allocError();
        os_log_type_t type = v16;
        void *v19 = v5;
        v19[1] = v4;
        v19[2] = v7;
        v19[3] = v6;
        v19[4] = v8;
        outlined copy of NetworkConnectionError(v5, v4, v7, v6, v8);
        uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v18 = v20;
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        *(_WORD *)(v17 + 12) = 2112;
        id v21 = v36;
        v40[0] = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        id v22 = v18;
        a3 = v36;
        v22[1] = v40[0];

        _os_log_impl(&dword_25D6CC000, v15, type, "Background Connection - Fallback: Callback to Completion with error %@ for provider error (%@)", (uint8_t *)v17, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x2611B3750](v22, -1, -1);
        MEMORY[0x2611B3750](v17, -1, -1);
      }
      else
      {
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
      }
      swift_beginAccess();
      outlined init with copy of NetworkConnectionProtocol?(v10 + 1096, (uint64_t)v40, &demangling cache variable for type metadata for CommunicationProtocol?);
      if (v40[3])
      {
        outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v40, (uint64_t)v37);
        outlined destroy of CommunicationProtocol?((uint64_t)v40, &demangling cache variable for type metadata for CommunicationProtocol?);
        uint64_t v23 = v38;
        uint64_t v24 = v39;
        __swift_project_boxed_opaque_existential_1(v37, v38);
        char v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 184))(v23, v24);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v37);
        if (v25)
        {
          id v26 = a3;
          id v27 = a3;
          id v28 = Logger.logObject.getter();
          os_log_type_t v29 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v28, v29))
          {
            id v30 = (uint8_t *)swift_slowAlloc();
            uint64_t v31 = swift_slowAlloc();
            v40[0] = v31;
            *(_DWORD *)id v30 = 136315138;
            v37[0] = a3;
            id v32 = a3;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
            uint64_t v33 = String.init<A>(describing:)();
            v37[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v34, v40);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_25D6CC000, v28, v29, "Background Connection - Provider: Error during request: %s", v30, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2611B3750](v31, -1, -1);
            MEMORY[0x2611B3750](v30, -1, -1);
          }
          else
          {
          }
          BackgroundConnection.didEncounterError(_:)(a3);
        }
      }
      else
      {
        outlined destroy of CommunicationProtocol?((uint64_t)v40, &demangling cache variable for type metadata for CommunicationProtocol?);
      }
      BackgroundConnection.cancel()();
    }
    return swift_release();
  }
  return result;
}

void closure #1 in BackgroundConnection.connectionProvider(_:receivedIntermediateError:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  OUTLINED_FUNCTION_24_2();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = Strong;
    uint64_t v9 = *(void *)(Strong + 1080);
    if (!v9 || v9 != a2) {
      goto LABEL_4;
    }
    swift_getObjectType();
    OUTLINED_FUNCTION_132();
    uint64_t v10 = OUTLINED_FUNCTION_94_2();
    if (v4(v10))
    {
      type metadata accessor for BackgroundConnection();
      uint64_t v11 = swift_dynamicCastClass();
      if (!v11) {
        swift_unknownObjectRelease();
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    OUTLINED_FUNCTION_24_2();
    uint64_t v12 = swift_weakLoadStrong();
    uint64_t v13 = v12;
    if (v11)
    {
      if (!v12)
      {
        swift_unknownObjectRelease();
        swift_release();
        goto LABEL_41;
      }
      swift_unknownObjectRelease();
      swift_release();
      if (v13 != v11)
      {
        swift_unknownObjectRelease();
LABEL_4:
        swift_release();
        return;
      }
    }
    else if (v12)
    {
      swift_unknownObjectRelease();
      swift_release();
      goto LABEL_4;
    }
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logger.siriNetwork);
    id v15 = a4;
    id v16 = a4;
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      os_log_type_t v19 = (uint8_t *)OUTLINED_FUNCTION_12_0();
      uint64_t v20 = (void *)OUTLINED_FUNCTION_36_2();
      *(_DWORD *)os_log_type_t v19 = 138412290;
      if (a4)
      {
        id v21 = a4;
        uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
        OUTLINED_FUNCTION_80_2();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
      }
      else
      {
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v22 = 0;
      }
      void *v20 = v22;

      _os_log_impl(&dword_25D6CC000, v17, v18, "Background Connection - Provider: Intermediate Error (%@)", v19, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      OUTLINED_FUNCTION_48_2();
      OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_1_2();
    }
    else
    {
    }
    if (*(unsigned char *)(v8 + 1186) == 1)
    {
      id v23 = a4;
      id v24 = a4;
      char v25 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.default.getter();
      if (OUTLINED_FUNCTION_93_0(v26))
      {
        id v27 = (uint8_t *)OUTLINED_FUNCTION_12_0();
        id v28 = (void *)OUTLINED_FUNCTION_36_2();
        *(_DWORD *)id v27 = 138412290;
        if (a4)
        {
          id v29 = a4;
          uint64_t v30 = _swift_stdlib_bridgeErrorToNSError();
          OUTLINED_FUNCTION_99_1();
        }
        else
        {
          OUTLINED_FUNCTION_99_1();
          uint64_t v30 = 0;
        }
        *id v28 = v30;

        _os_log_impl(&dword_25D6CC000, v25, v26, "Background Connection - Provider: Intermediate Error (%@). Connection was Cancelled, none action is required", v27, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1_2();
        goto LABEL_44;
      }

LABEL_35:
LABEL_40:
      swift_release();
      goto LABEL_41;
    }
    if (!a4)
    {
      char v25 = Logger.logObject.getter();
      os_log_type_t v40 = static os_log_type_t.default.getter();
      if (OUTLINED_FUNCTION_9(v40))
      {
        *(_WORD *)OUTLINED_FUNCTION_2_0() = 0;
        OUTLINED_FUNCTION_3_0(&dword_25D6CC000, v41, v42, "Background Connection - Provider: Intermediate Error nill");
LABEL_44:
        OUTLINED_FUNCTION_1_2();
        swift_release();
        swift_unknownObjectRelease();

        return;
      }
      goto LABEL_35;
    }
    id v31 = a4;
    id v32 = a4;
    id v33 = a4;
    unint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      id v36 = (uint8_t *)OUTLINED_FUNCTION_12_0();
      uint64_t v37 = (void *)OUTLINED_FUNCTION_36_2();
      *(_DWORD *)id v36 = 138412290;
      id v38 = a4;
      uint64_t v39 = _swift_stdlib_bridgeErrorToNSError();
      OUTLINED_FUNCTION_80_2();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v37 = v39;

      _os_log_impl(&dword_25D6CC000, v34, v35, "Background Connection - Provider: Intermediate Error (%@) forwarded.", v36, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_1_2();
    }
    else
    {
    }
    uint64_t v43 = MEMORY[0x2611B37F0](v8 + 16);
    if (!v43)
    {

      goto LABEL_40;
    }
    uint64_t v44 = v43;
    uint64_t v45 = swift_retain();
    specialized Connection.didEncounterIntermediateError(_:error:)(v45, a4, v44);

    swift_release_n();
    swift_unknownObjectRelease();
LABEL_41:
    swift_unknownObjectRelease();
  }
}

void BackgroundConnection.tryToWriteBufferedOutputData(with:)(void (*a1)(void), uint64_t a2)
{
  if (!*(void *)(v2 + 1080))
  {
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    uint64_t v20 = OUTLINED_FUNCTION_7(v19, (uint64_t)static Logger.siriNetwork);
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_9(v21))
    {
      uint64_t v22 = (_WORD *)OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_39_2(v22);
      _os_log_impl(&dword_25D6CC000, v20, OS_LOG_TYPE_DEFAULT, "Background Connection - Writter: No connection provider available.", v3, 2u);
      OUTLINED_FUNCTION_1_2();
    }

    if (a1)
    {
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      uint64_t v23 = OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_58_3(v24, 3);
      *(_OWORD *)(v25 + 24) = xmmword_25D790FF0;
      uint64_t v26 = OUTLINED_FUNCTION_16_0();
      v27[1] = 0;
      v27[2] = 0;
      *id v27 = v23;
      OUTLINED_FUNCTION_36_4((__n128)xmmword_25D791000, v26, (uint64_t)v27);
      a1();
      goto LABEL_15;
    }
LABEL_41:
    OUTLINED_FUNCTION_34_6();
    return;
  }
  os_log_type_t v6 = v2;
  uint64_t v7 = (uint8_t *)(v2 + 1080);
  if ((*(unsigned char *)(v2 + 1186) & 1) == 0)
  {
    if (*(unsigned char *)(v2 + 1185) == 1)
    {
      uint64_t v30 = *(void *)(v2 + 1088);
      OUTLINED_FUNCTION_22_0();
      outlined init with copy of NetworkConnectionProtocol?(v2 + 1096, (uint64_t)v66, &demangling cache variable for type metadata for CommunicationProtocol?);
      if (v67)
      {
        outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v66, (uint64_t)v63);
        swift_unknownObjectRetain();
        outlined destroy of CommunicationProtocol?((uint64_t)v66, &demangling cache variable for type metadata for CommunicationProtocol?);
        uint64_t v31 = v64;
        uint64_t v32 = v65;
        __swift_project_boxed_opaque_existential_1(v63, v64);
        uint64_t v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 120))(v31, v32);
        unint64_t v35 = v34;
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v63);
        if (v35 >> 60 != 15)
        {
          siri_kdebug_trace_0(360);
          uint64_t ObjectType = swift_getObjectType();
          id v36 = (void *)swift_allocObject();
          v36[2] = v33;
          v36[3] = v35;
          v36[4] = a1;
          v36[5] = a2;
          uint64_t v37 = *(void (**)(uint64_t, unint64_t, void (*)(void *, char), void *, uint64_t, uint64_t))(v30 + 504);
          outlined copy of Data?(v33, v35);
          outlined copy of Data?(v33, v35);
          outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?((uint64_t)a1);
          v37(v33, v35, partial apply for closure #1 in BackgroundConnection.tryToWriteBufferedOutputData(with:), v36, ObjectType, v30);
          outlined consume of Data?(v33, v35);
          swift_release();
          swift_unknownObjectRelease();
          outlined consume of Data?(v33, v35);
          goto LABEL_41;
        }
      }
      else
      {
        swift_unknownObjectRetain();
        outlined destroy of CommunicationProtocol?((uint64_t)v66, &demangling cache variable for type metadata for CommunicationProtocol?);
      }
      if (one-time initialization token for siriNetwork != -1) {
        swift_once();
      }
      uint64_t v52 = type metadata accessor for Logger();
      __swift_project_value_buffer(v52, (uint64_t)static Logger.siriNetwork);
      OUTLINED_FUNCTION_114_0();
      id v53 = Logger.logObject.getter();
      os_log_type_t v54 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v53, v54))
      {
        OUTLINED_FUNCTION_12_0();
        v63[0] = OUTLINED_FUNCTION_10_0();
        OUTLINED_FUNCTION_61_2(4.8149e-34);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ConnectionProviderProtocol?);
        uint64_t v55 = Optional.debugDescription.getter();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v55, v56, v63);
        OUTLINED_FUNCTION_88_2();
        OUTLINED_FUNCTION_25_4();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_139(&dword_25D6CC000, v53, v54, "Background Connection - Writter: %s is open, but there is not buffered output data to write.");
        OUTLINED_FUNCTION_57_2();
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_1_2();

        if (a1)
        {
LABEL_37:
          lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
          uint64_t v57 = OUTLINED_FUNCTION_16_0();
          OUTLINED_FUNCTION_58_3(v58, 6);
          *(_OWORD *)(v59 + 24) = xmmword_25D790FF0;
          uint64_t v60 = OUTLINED_FUNCTION_16_0();
          v61[1] = 0;
          v61[2] = 0;
          *long long v61 = v57;
          OUTLINED_FUNCTION_36_4((__n128)xmmword_25D791000, v60, (uint64_t)v61);
          a1();
          swift_unknownObjectRelease();
          uint64_t v51 = (void *)v60;
          goto LABEL_38;
        }
      }
      else
      {

        OUTLINED_FUNCTION_25_4();
        if (a1) {
          goto LABEL_37;
        }
      }
LABEL_40:
      swift_unknownObjectRelease();
      goto LABEL_41;
    }
    uint64_t v38 = one-time initialization token for siriNetwork;
    swift_unknownObjectRetain();
    if (v38 != -1) {
      swift_once();
    }
    uint64_t v39 = type metadata accessor for Logger();
    __swift_project_value_buffer(v39, (uint64_t)static Logger.siriNetwork);
    OUTLINED_FUNCTION_114_0();
    os_log_type_t v40 = Logger.logObject.getter();
    os_log_type_t v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v40, v41))
    {
      OUTLINED_FUNCTION_12_0();
      v63[0] = OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_61_2(4.8149e-34);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ConnectionProviderProtocol?);
      uint64_t v42 = Optional.debugDescription.getter();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v43, v63);
      OUTLINED_FUNCTION_88_2();
      OUTLINED_FUNCTION_25_4();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_139(&dword_25D6CC000, v40, v41, "Background Connection - Writter: %s is not opened");
      OUTLINED_FUNCTION_57_2();
      OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_1_2();

      if (!a1) {
        goto LABEL_40;
      }
    }
    else
    {

      OUTLINED_FUNCTION_25_4();
      if (!a1) {
        goto LABEL_40;
      }
    }
    lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
    OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_58_3(v45, 4);
    *(_OWORD *)(v46 + 24) = xmmword_25D790FF0;
    uint64_t v47 = OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_101_1(v47, v48);
    OUTLINED_FUNCTION_36_4((__n128)xmmword_25D791000, v49, v50);
    a1();
    swift_unknownObjectRelease();
    uint64_t v51 = (void *)v47;
LABEL_38:

    goto LABEL_41;
  }
  uint64_t v8 = one-time initialization token for siriNetwork;
  swift_unknownObjectRetain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = OUTLINED_FUNCTION_7(v9, (uint64_t)static Logger.siriNetwork);
  os_log_type_t v11 = static os_log_type_t.error.getter();
  if (OUTLINED_FUNCTION_24_0(v11))
  {
    uint64_t v12 = (_WORD *)OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_39_2(v12);
    _os_log_impl(&dword_25D6CC000, v10, v6, "Background Connection - Writter: Connection is cancelled", v7, 2u);
    OUTLINED_FUNCTION_1_2();
  }

  if (a1)
  {
    lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
    OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_58_3(v13, 1);
    *(_OWORD *)(v14 + 24) = xmmword_25D790FF0;
    uint64_t v15 = OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_101_1(v15, v16);
    OUTLINED_FUNCTION_36_4((__n128)xmmword_25D791000, v17, v18);
    a1();
    swift_unknownObjectRelease();
LABEL_15:
    OUTLINED_FUNCTION_34_6();

    return;
  }
  OUTLINED_FUNCTION_34_6();
  swift_unknownObjectRelease();
}

void closure #1 in BackgroundConnection.tryToWriteBufferedOutputData(with:)(void *a1, char a2, uint64_t a3, unint64_t a4, void (*a5)(void *))
{
  siri_kdebug_trace_0(361);
  if ((a2 & 1) == 0)
  {
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    __swift_project_value_buffer(v10, (uint64_t)static Logger.siriNetwork);
    outlined copy of Data._Representation(a3, a4);
    os_log_type_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 134217984;
      Data.count.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      outlined consume of Data._Representation(a3, a4);
      _os_log_impl(&dword_25D6CC000, v11, v12, "Background Connection - Writter: Wrote %ld bytes", v13, 0xCu);
      MEMORY[0x2611B3750](v13, -1, -1);
    }
    else
    {
      outlined consume of Data._Representation(a3, a4);
    }

    if (a5) {
      a5(0);
    }
    return;
  }
  id v14 = a1;
  id v15 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
  if (swift_dynamicCast())
  {
    if (v33 >> 60 == 10 && !v34)
    {
      BOOL v16 = v33 == 0xA000000000000000 && v30 == (void *)1;
      if (v16 && v32 == 0)
      {
        if (one-time initialization token for siriNetwork != -1) {
          swift_once();
        }
        uint64_t v17 = type metadata accessor for Logger();
        __swift_project_value_buffer(v17, (uint64_t)static Logger.siriNetwork);
        outlined copy of Data._Representation(a3, a4);
        uint64_t v18 = Logger.logObject.getter();
        os_log_type_t v19 = static os_log_type_t.error.getter();
        if (!os_log_type_enabled(v18, v19))
        {
          outlined consume of Data._Representation(a3, a4);
          goto LABEL_29;
        }
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 134217984;
        Data.count.getter();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        outlined consume of Data._Representation(a3, a4);
        _os_log_impl(&dword_25D6CC000, v18, v19, "Background Connection - Writter: Wrote %ld bytes failed because connection was cancelled", v20, 0xCu);
        os_log_type_t v21 = v20;
        goto LABEL_27;
      }
    }
    outlined consume of NetworkConnectionError(v30, v32, *((uint64_t *)&v32 + 1), v33, v34);
  }
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v22 = type metadata accessor for Logger();
  __swift_project_value_buffer(v22, (uint64_t)static Logger.siriNetwork);
  id v23 = a1;
  id v24 = a1;
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v18, v25))
  {
    outlined consume of Result<(), Error>(a1, 1);
    outlined consume of Result<(), Error>(a1, 1);
    goto LABEL_29;
  }
  uint64_t v26 = (uint8_t *)swift_slowAlloc();
  id v27 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v26 = 138412290;
  id v28 = a1;
  uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *id v27 = v31;
  outlined consume of Result<(), Error>(a1, 1);
  outlined consume of Result<(), Error>(a1, 1);
  _os_log_impl(&dword_25D6CC000, v18, v25, "Background Connection - Writter: Error writing data %@", v26, 0xCu);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  swift_arrayDestroy();
  MEMORY[0x2611B3750](v27, -1, -1);
  os_log_type_t v21 = v26;
LABEL_27:
  MEMORY[0x2611B3750](v21, -1, -1);
LABEL_29:

  if (a5)
  {
    id v29 = a1;
    a5(a1);
    outlined consume of Result<(), Error>(a1, 1);
  }
  outlined consume of Result<(), Error>(a1, 1);
}

uint64_t BackgroundConnection.bufferGeneralData(data:)()
{
  OUTLINED_FUNCTION_22_0();
  uint64_t v1 = outlined init with copy of NetworkConnectionProtocol?(v0 + 1096, (uint64_t)v6, &demangling cache variable for type metadata for CommunicationProtocol?);
  if (!v7) {
    return outlined destroy of CommunicationProtocol?((uint64_t)v6, &demangling cache variable for type metadata for CommunicationProtocol?);
  }
  OUTLINED_FUNCTION_82_1(v1);
  outlined destroy of CommunicationProtocol?((uint64_t)v6, &demangling cache variable for type metadata for CommunicationProtocol?);
  OUTLINED_FUNCTION_113_0(v5);
  uint64_t v2 = OUTLINED_FUNCTION_90_2();
  v3(v2);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
}

void BackgroundConnection.setupReadHandlerOnProvider()()
{
  OUTLINED_FUNCTION_14_7();
  uint64_t v1 = *(void *)(v0 + 1080);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 1088);
    swift_unknownObjectRetain();
    siri_kdebug_trace_0(358);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v4 = OUTLINED_FUNCTION_23_2();
    swift_weakInit();
    long long v5 = (void *)swift_allocObject();
    v5[2] = v4;
    void v5[3] = v1;
    v5[4] = v2;
    os_log_type_t v6 = *(void (**)(void *(*)(uint64_t, unint64_t, void *, char), void *, uint64_t, uint64_t))(v2 + 512);
    swift_unknownObjectRetain();
    swift_retain();
    v6(partial apply for closure #1 in BackgroundConnection.setupReadHandlerOnProvider(), v5, ObjectType, v2);
    swift_release();
    swift_release();
    OUTLINED_FUNCTION_42();
    swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_42();
  }
}

void *closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(uint64_t a1, unint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  siri_kdebug_trace_0(359);
  swift_beginAccess();
  uint64_t result = (void *)swift_weakLoadStrong();
  if (result)
  {
    uint64_t v12 = result[135];
    if (!v12 || v12 != a6) {
      return (void *)swift_release();
    }
    if (!a3
      || (v34[5] = a3,
          id v13 = a3,
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error),
          (swift_dynamicCast() & 1) == 0))
    {
      if (a2 >> 60 == 15)
      {
        if (one-time initialization token for siriNetwork != -1) {
          swift_once();
        }
        uint64_t v21 = type metadata accessor for Logger();
        __swift_project_value_buffer(v21, (uint64_t)static Logger.siriNetwork);
        uint64_t v22 = Logger.logObject.getter();
        os_log_type_t v23 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v22, v23))
        {
          id v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v24 = 0;
          _os_log_impl(&dword_25D6CC000, v22, v23, "Background Connection - Reader: Reader called but it did not returned data.", v24, 2u);
          MEMORY[0x2611B3750](v24, -1, -1);
        }

        swift_allocObject();
        swift_beginAccess();
        swift_weakLoadStrong();
        swift_weakInit();
        swift_release();
        id v25 = a3;
        swift_retain();
        id v26 = a3;
        swift_retain();
        specialized BackgroundConnection.fallbackToNextConnectionMethodWithError(_:with:)();
        swift_release();
        swift_release();
      }
      else
      {
        outlined copy of Data._Representation(a1, a2);
        if (one-time initialization token for siriNetwork != -1) {
          swift_once();
        }
        uint64_t v27 = type metadata accessor for Logger();
        __swift_project_value_buffer(v27, (uint64_t)static Logger.siriNetwork);
        outlined copy of Data._Representation(a1, a2);
        id v28 = Logger.logObject.getter();
        os_log_type_t v29 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v30 = 134217984;
          v35[0] = Data.count.getter();
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          outlined consume of Data?(a1, a2);
          _os_log_impl(&dword_25D6CC000, v28, v29, "Background Connection - Reader: Read %ld bytes", v30, 0xCu);
          MEMORY[0x2611B3750](v30, -1, -1);
        }
        else
        {
          outlined consume of Data?(a1, a2);
        }

        outlined copy of Data._Representation(a1, a2);
        BackgroundConnection.connectionHasBytesAvailable(_:)(a1, a2);
        uint64_t v31 = outlined consume of Data?(a1, a2);
        if (a4) {
          BackgroundConnection.setupReadHandlerOnProvider()(v31);
        }
        outlined consume of Data?(a1, a2);
      }
      return (void *)swift_release();
    }
    outlined init with take of NetworkConnectionError((uint64_t)v34, (uint64_t)v35);
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logger.siriNetwork);
    outlined retain of NetworkConnectionError(v35, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
    outlined retain of NetworkConnectionError(v35, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
    id v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 138412290;
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      swift_allocError();
      outlined init with take of NetworkConnectionError((uint64_t)v35, v19);
      outlined retain of NetworkConnectionError(v35, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
      v34[0] = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v18 = v20;
      outlined retain of NetworkConnectionError(v35, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
      outlined retain of NetworkConnectionError(v35, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
      _os_log_impl(&dword_25D6CC000, v15, v16, "Background Connection - Reader: Error. %@", v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x2611B3750](v18, -1, -1);
      MEMORY[0x2611B3750](v17, -1, -1);
    }
    else
    {
      outlined retain of NetworkConnectionError(v35, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
      outlined retain of NetworkConnectionError(v35, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
    }

    lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
    long long v32 = (void *)swift_allocError();
    outlined init with take of NetworkConnectionError((uint64_t)v35, v33);
    swift_allocObject();
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    outlined retain of NetworkConnectionError(v35, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
    swift_release();
    outlined retain of NetworkConnectionError(v35, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
    swift_retain();
    outlined retain of NetworkConnectionError(v35, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
    swift_retain();
    specialized BackgroundConnection.fallbackToNextConnectionMethodWithError(_:with:)();
    swift_release();
    swift_release();
    outlined retain of NetworkConnectionError(v35, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
    swift_release();

    return outlined retain of NetworkConnectionError(v35, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
  }
  return result;
}

void closure #1 in closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(uint64_t a1, uint64_t a2, void *a3)
{
  outlined init with take of NetworkConnectionError((uint64_t)a3, (uint64_t)&v55);
  long long v5 = v55;
  uint64_t v7 = *(void **)a1;
  unint64_t v6 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  unint64_t v8 = *(void *)(a1 + 24);
  uint64_t v10 = *(void **)(a1 + 32);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v12 = Strong;
    if (v6 >> 1 == 0xFFFFFFFF && v8 <= 1) {
      goto LABEL_25;
    }
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logger.siriNetwork);
    outlined copy of NetworkConnectionError?(v7, v6, v9, v8, v10);
    outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
    outlined copy of NetworkConnectionError?(v7, v6, v9, v8, v10);
    outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
    id v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    uint64_t v50 = v5;
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v49 = v12;
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 138412546;
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      uint64_t v48 = v15;
      swift_allocError();
      os_log_type_t type = v16;
      void *v19 = v7;
      v19[1] = v6;
      v19[2] = v9;
      v19[3] = v8;
      v19[4] = v10;
      outlined copy of NetworkConnectionError(v7, v6, v9, v8, v10);
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
      v56[0] = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v18 = v20;
      outlined consume of NetworkConnectionError?(v7, v6, v9, v8, v10);
      outlined consume of NetworkConnectionError?(v7, v6, v9, v8, v10);
      *(_WORD *)(v17 + 12) = 2112;
      swift_allocError();
      outlined init with take of NetworkConnectionError((uint64_t)a3, v21);
      outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
      uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
      v56[0] = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v18[1] = v22;
      id v15 = v48;
      outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
      outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
      _os_log_impl(&dword_25D6CC000, v48, type, "Background Connection - Fallback: Callback to Completion with error %@ for Read Handler error (%@)", (uint8_t *)v17, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x2611B3750](v18, -1, -1);
      uint64_t v23 = v17;
      uint64_t v12 = v49;
      MEMORY[0x2611B3750](v23, -1, -1);
    }
    else
    {
      outlined consume of NetworkConnectionError?(v7, v6, v9, v8, v10);
      outlined consume of NetworkConnectionError?(v7, v6, v9, v8, v10);
      outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
      outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
    }

    swift_beginAccess();
    outlined init with copy of NetworkConnectionProtocol?(v12 + 1096, (uint64_t)v56, &demangling cache variable for type metadata for CommunicationProtocol?);
    if (v57)
    {
      outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v56, (uint64_t)v51);
      outlined destroy of CommunicationProtocol?((uint64_t)v56, &demangling cache variable for type metadata for CommunicationProtocol?);
      uint64_t v24 = v52;
      uint64_t v25 = v53;
      __swift_project_boxed_opaque_existential_1(v51, v52);
      LOBYTE(v24) = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 184))(v24, v25);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v51);
      id v26 = v50;
      if (v24)
      {
        uint64_t v27 = Logger.logObject.getter();
        os_log_type_t v28 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v27, v28))
        {
          os_log_type_t v29 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v29 = 0;
          _os_log_impl(&dword_25D6CC000, v27, v28, "Background Connection - Fallback: Read Error - mid request", v29, 2u);
          MEMORY[0x2611B3750](v29, -1, -1);
        }

LABEL_28:
        lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
        uint64_t v45 = (void *)swift_allocError();
        outlined init with take of NetworkConnectionError((uint64_t)a3, v46);
        outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
        BackgroundConnection.didEncounterError(_:)(v45);
        swift_release();

        return;
      }
    }
    else
    {
      outlined destroy of CommunicationProtocol?((uint64_t)v56, &demangling cache variable for type metadata for CommunicationProtocol?);
      id v26 = v50;
    }
    outlined init with take of NetworkConnectionError((uint64_t)a3, (uint64_t)v56);
    if (v57 >> 60 == 7)
    {
      v57 &= 0xFFFFFFFFFFFFFFFuLL;
      _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v56, (uint64_t)v51, &demangling cache variable for type metadata for Error?);
      id v30 = v26;
      id v31 = v26;
      long long v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v32, v33))
      {
        unint64_t v34 = (uint8_t *)swift_slowAlloc();
        unint64_t v35 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v34 = 138412290;
        lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
        swift_allocError();
        outlined init with take of NetworkConnectionError((uint64_t)a3, v36);
        id v37 = v26;
        uint64_t v38 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v54 = v38;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *unint64_t v35 = v38;
        outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
        outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
        _os_log_impl(&dword_25D6CC000, v32, v33, "Background Connection - Fallback: Read Error - cancel (%@)", v34, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x2611B3750](v35, -1, -1);
        MEMORY[0x2611B3750](v34, -1, -1);
      }
      else
      {
        outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
        outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
      }

      BackgroundConnection.cancel()();
LABEL_25:
      swift_release();
      return;
    }
    outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
    outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
    uint64_t v39 = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v39, v40))
    {
      os_log_type_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v41 = 138412290;
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      swift_allocError();
      outlined init with take of NetworkConnectionError((uint64_t)a3, v43);
      outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined copy of NetworkConnectionError);
      uint64_t v44 = _swift_stdlib_bridgeErrorToNSError();
      v51[0] = v44;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v42 = v44;
      outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
      outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
      _os_log_impl(&dword_25D6CC000, v39, v40, "Background Connection - Fallback: Read Error - error (%@)", v41, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x2611B3750](v42, -1, -1);
      MEMORY[0x2611B3750](v41, -1, -1);
    }
    else
    {
      outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
      outlined retain of NetworkConnectionError(a3, (void (*)(void, void, void, void, void))outlined consume of NetworkConnectionError);
    }

    goto LABEL_28;
  }
}

void closure #2 in closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(uint64_t a1, uint64_t a2, void *a3)
{
  v36[8] = *MEMORY[0x263EF8340];
  long long v5 = *(void **)a1;
  unint64_t v4 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v6 = *(void *)(a1 + 24);
  unint64_t v8 = *(void **)(a1 + 32);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    return;
  }
  uint64_t v10 = Strong;
  if (v4 >> 1 == 0xFFFFFFFF && v6 <= 1)
  {
LABEL_24:
    swift_release();
    return;
  }
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)static Logger.siriNetwork);
  outlined copy of NetworkConnectionError?(v5, v4, v7, v6, v8);
  id v13 = a3;
  outlined copy of NetworkConnectionError?(v5, v4, v7, v6, v8);
  id v14 = a3;
  id v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    long long v32 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 138412546;
    lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
    swift_allocError();
    void *v18 = v5;
    v18[1] = v4;
    v18[2] = v7;
    v18[3] = v6;
    v18[4] = v8;
    outlined copy of NetworkConnectionError(v5, v4, v7, v6, v8);
    v36[0] = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *long long v32 = v36[0];
    outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
    outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
    *(_WORD *)(v17 + 12) = 2112;
    if (a3)
    {
      id v19 = a3;
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
      v36[0] = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
    }
    else
    {
      v36[0] = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v20 = 0;
    }
    v32[1] = v20;

    _os_log_impl(&dword_25D6CC000, v15, v16, "Background Connection - Fallback: Callback to Completion with error %@ for Read Handler error (%@)", (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x2611B3750](v32, -1, -1);
    MEMORY[0x2611B3750](v17, -1, -1);
  }
  else
  {
    outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
    outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
  }
  swift_beginAccess();
  outlined init with copy of NetworkConnectionProtocol?(v10 + 1096, (uint64_t)v36, &demangling cache variable for type metadata for CommunicationProtocol?);
  if (!v36[3])
  {
    outlined destroy of CommunicationProtocol?((uint64_t)v36, &demangling cache variable for type metadata for CommunicationProtocol?);
    goto LABEL_21;
  }
  outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v36, (uint64_t)v33);
  outlined destroy of CommunicationProtocol?((uint64_t)v36, &demangling cache variable for type metadata for CommunicationProtocol?);
  uint64_t v21 = v34;
  uint64_t v22 = v35;
  __swift_project_boxed_opaque_existential_1(v33, v34);
  char v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 184))(v21, v22);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v33);
  if ((v23 & 1) == 0)
  {
LABEL_21:
    os_log_type_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      id v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v31 = 0;
      _os_log_impl(&dword_25D6CC000, v29, v30, "Background Connection - Fallback: Read Error - cancel", v31, 2u);
      MEMORY[0x2611B3750](v31, -1, -1);
    }

    BackgroundConnection.cancel()();
    goto LABEL_24;
  }
  uint64_t v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v24, v25))
  {
    id v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v26 = 0;
    _os_log_impl(&dword_25D6CC000, v24, v25, "Background Connection - Fallback: Read Error - mid request)", v26, 2u);
    MEMORY[0x2611B3750](v26, -1, -1);
  }

  lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
  uint64_t v27 = (void *)swift_allocError();
  *(void *)(v28 + 8) = 0;
  *(void *)(v28 + 16) = 0;
  *(void *)uint64_t v28 = 0;
  *(_OWORD *)(v28 + 24) = xmmword_25D791790;
  BackgroundConnection.didEncounterError(_:)(v27);
  swift_release();
}

void BackgroundConnection.connectionHasBytesAvailable(_:)(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
LABEL_8:
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    oslog = OUTLINED_FUNCTION_7(v7, (uint64_t)static Logger.siriNetwork);
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v8))
    {
      *(_WORD *)OUTLINED_FUNCTION_2_0() = 0;
      OUTLINED_FUNCTION_108_1(&dword_25D6CC000, v9, v10, "Background Connection - Reader: Connection does not have bytes available", v11, v12, v13, v14, oslog);
      OUTLINED_FUNCTION_1_2();
    }
  }
  else
  {
    switch(a2 >> 62)
    {
      case 1uLL:
        uint64_t v5 = (int)a1;
        uint64_t v6 = a1 >> 32;
        goto LABEL_7;
      case 2uLL:
        uint64_t v5 = *(void *)(a1 + 16);
        uint64_t v6 = *(void *)(a1 + 24);
LABEL_7:
        if (v5 == v6) {
          goto LABEL_8;
        }
        outlined copy of Data._Representation(a1, a2);
        goto LABEL_16;
      case 3uLL:
        goto LABEL_4;
      default:
        if ((a2 & 0xFF000000000000) == 0)
        {
LABEL_4:
          outlined consume of Data?(a1, a2);
          goto LABEL_8;
        }
LABEL_16:
        OUTLINED_FUNCTION_22_0();
        uint64_t v15 = outlined init with copy of NetworkConnectionProtocol?(v2 + 1096, (uint64_t)v20, &demangling cache variable for type metadata for CommunicationProtocol?);
        if (v21)
        {
          OUTLINED_FUNCTION_82_1(v15);
          outlined destroy of CommunicationProtocol?((uint64_t)v20, &demangling cache variable for type metadata for CommunicationProtocol?);
          OUTLINED_FUNCTION_113_0(v19);
          uint64_t v16 = OUTLINED_FUNCTION_90_2();
          v17(v16);
          outlined consume of Data?(a1, a2);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
        }
        else
        {
          outlined consume of Data?(a1, a2);
          outlined destroy of CommunicationProtocol?((uint64_t)v20, &demangling cache variable for type metadata for CommunicationProtocol?);
        }
        break;
    }
  }
}

Swift::Bool __swiftcall BackgroundConnection.isUsingPeer()()
{
  return *(unsigned char *)(v0 + 1136) == 2;
}

Swift::Bool __swiftcall BackgroundConnection.isUsingPop()()
{
  return *(unsigned char *)(v0 + 1136) == 3;
}

Swift::Bool __swiftcall BackgroundConnection.isUsingFlorence()()
{
  if (*(unsigned char *)(v0 + 1136) != 1) {
    return 0;
  }
  uint64_t v1 = (const void *)(v0 + 40);
  memcpy(__dst, (const void *)(v0 + 40), 0x204uLL);
  if (__dst[51] == 1) {
    return 0;
  }
  int v2 = BYTE1(__dst[64]);
  memcpy(v4, v1, sizeof(v4));
  char v5 = BYTE1(__dst[64]);
  __int16 v6 = WORD1(__dst[64]);
  outlined retain of ConnectionConfiguration(__dst);
  outlined release of ConnectionConfiguration(v4);
  return v2 != 5 && v2 == 2;
}

Swift::Bool __swiftcall BackgroundConnection.isWifiOrCellularMaybeBetterThanCurrentStream()()
{
  char v0 = AFDeviceSupportsWiFiLPASMode();
  return BackgroundConnection.logTcpInfoIndicatesPoorLinkQuality()() & v0;
}

Swift::Bool __swiftcall BackgroundConnection.shouldFallbackQuickly()()
{
  if (!*(void *)(v0 + 1080)) {
    return 0;
  }
  uint64_t v1 = *(void *)(v0 + 1088);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 544))(ObjectType, v1) & 1;
}

uint64_t BackgroundConnection.providerHeaderData(forceReconnect:)(char a1)
{
  if (!*(void *)(v1 + 1080)) {
    return 0;
  }
  uint64_t v4 = OUTLINED_FUNCTION_116_0();
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(v2 + 552))(a1 & 1, v4, v2);
}

Swift::Bool __swiftcall BackgroundConnection.logTcpInfoIndicatesPoorLinkQuality()()
{
  ((void (*)())MEMORY[0x270FA5388])();
  if (*(void *)(v0 + 1080))
  {
    uint64_t v1 = *(void *)(v0 + 1088);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v1 + 520);
    swift_unknownObjectRetain();
    v3(ObjectType, v1);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v1 + 40))(&v130, ObjectType, v1);
    _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)&v142, (uint64_t)&v143, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
    uint64_t v4 = OUTLINED_FUNCTION_67_2();
    _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v4, (uint64_t)v144, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
    if (_s11SiriNetwork24ConnectionSnapshotReportVSgWOg((uint64_t)v144) == 1)
    {
      swift_unknownObjectRelease();
      uint64_t v5 = v130;
      char v6 = v131;
      long long v87 = v132;
      uint64_t v7 = v133;
      uint64_t v8 = v134;
      int v9 = v135;
      LODWORD(v85) = v136;
      long long v79 = v138;
      long long v82 = v137;
      OUTLINED_FUNCTION_97_2();
      uint64_t v76 = v10;
      _s11SiriNetwork17ConnectionMetricsVSgWObTm_0(v11, (uint64_t)v129, &demangling cache variable for type metadata for ConnectionPreparationReport?);
      __n128 v71 = OUTLINED_FUNCTION_128_0(v139);
      long long v73 = v12;
      __n128 v67 = OUTLINED_FUNCTION_126_0(v13);
      long long v69 = v14;
      __n128 v63 = OUTLINED_FUNCTION_125_0(v15);
      long long v65 = v16;
      uint64_t v17 = v140;
      uint64_t v18 = v141;
      OUTLINED_FUNCTION_2_27();
      uint64_t v110 = v5;
      char v111 = v6;
      long long v112 = v87;
      uint64_t v113 = v7;
      uint64_t v114 = v8;
      int v115 = v9;
      char v116 = v85;
      long long v117 = v82;
      long long v118 = v79;
      uint64_t v119 = v76;
      _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v129, (uint64_t)v120, &demangling cache variable for type metadata for ConnectionPreparationReport?);
      long long v121 = v73;
      __n128 v122 = v71;
      long long v123 = v69;
      __n128 v124 = v67;
      long long v125 = v65;
      __n128 v126 = v63;
      uint64_t v127 = v17;
      uint64_t v128 = v18;
      id v19 = OUTLINED_FUNCTION_67_2();
      uint64_t v22 = _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v19, v20, v21);
      OUTLINED_FUNCTION_1_34(v22, v23, v24, v25, v26, v27, v28, v29, v60, v62, v63.n128_i64[0], v63.n128_i64[1], v65, *((uint64_t *)&v65 + 1), v67.n128_i64[0], v67.n128_i64[1], v69, *((uint64_t *)&v69 + 1), v71.n128_i64[0],
        v71.n128_i64[1],
        v73,
        *((uint64_t *)&v73 + 1),
        v76,
        v78,
        v79,
        *((uint64_t *)&v79 + 1),
        v82,
        *((uint64_t *)&v82 + 1),
        v84,
        v85,
        v87,
        *((uint64_t *)&v87 + 1),
        v89,
        v90,
        *(int *)v91,
        v91[4],
        v92,
        *(int *)v93,
        v93[4],
        v94,
        v95,
        v96,
        v97,
        v98,
        *(int *)v99,
        v99[4],
        v100,
        *(int *)v101,
        v101[4],
        v102,
        *(int *)v103,
        v103[4],
        v104,
        v105,
        v30,
        v106);
      outlined release of ConnectionMetrics((uint64_t)&v110);
    }
    else
    {
      id v31 = OUTLINED_FUNCTION_67_2();
      _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v31, (uint64_t)__src, v32);
      uint64_t v33 = v130;
      char v34 = v131;
      long long v88 = v132;
      uint64_t v35 = v133;
      uint64_t v86 = v134;
      int v36 = v135;
      LODWORD(v81) = v136;
      long long v77 = v138;
      long long v80 = v137;
      OUTLINED_FUNCTION_97_2();
      uint64_t v74 = v37;
      _s11SiriNetwork17ConnectionMetricsVSgWObTm_0(v38, (uint64_t)v109, &demangling cache variable for type metadata for ConnectionPreparationReport?);
      __n128 v70 = OUTLINED_FUNCTION_128_0(v139);
      long long v72 = v39;
      __n128 v66 = OUTLINED_FUNCTION_126_0(v40);
      long long v68 = v41;
      __n128 v61 = OUTLINED_FUNCTION_125_0(v42);
      long long v64 = v43;
      uint64_t v44 = v140;
      uint64_t v45 = v141;
      OUTLINED_FUNCTION_2_27();
      uint64_t v110 = v33;
      char v111 = v34;
      long long v112 = v88;
      uint64_t v113 = v35;
      uint64_t v114 = v86;
      int v115 = v36;
      char v116 = v81;
      long long v117 = v80;
      long long v118 = v77;
      uint64_t v119 = v74;
      _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v109, (uint64_t)v120, &demangling cache variable for type metadata for ConnectionPreparationReport?);
      long long v121 = v72;
      __n128 v122 = v70;
      long long v123 = v68;
      __n128 v124 = v66;
      long long v125 = v64;
      __n128 v126 = v61;
      uint64_t v127 = v44;
      uint64_t v128 = v45;
      uint64_t v46 = OUTLINED_FUNCTION_67_2();
      uint64_t v48 = _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v46, v47, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
      OUTLINED_FUNCTION_1_34(v48, v49, v50, v51, v52, v53, v54, v55, v61.n128_i64[0], v61.n128_i64[1], v64, *((uint64_t *)&v64 + 1), v66.n128_i64[0], v66.n128_i64[1], v68, *((uint64_t *)&v68 + 1), v70.n128_i64[0], v70.n128_i64[1], v72,
        *((uint64_t *)&v72 + 1),
        v74,
        v75,
        v77,
        *((uint64_t *)&v77 + 1),
        v80,
        *((uint64_t *)&v80 + 1),
        v81,
        v83,
        v84,
        v86,
        v88,
        *((uint64_t *)&v88 + 1),
        v89,
        v90,
        *(int *)v91,
        v91[4],
        v92,
        *(int *)v93,
        v93[4],
        v94,
        v95,
        v96,
        v97,
        v98,
        *(int *)v99,
        v99[4],
        v100,
        *(int *)v101,
        v101[4],
        v102,
        *(int *)v103,
        v103[4],
        v104,
        v105,
        v56,
        v106);
      unint64_t v57 = OUTLINED_FUNCTION_67_2();
      _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v57, (uint64_t)v129, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
      outlined retain of ConnectionSnapshotReport((uint64_t)v129);
      outlined release of ConnectionMetrics((uint64_t)&v110);
      memcpy(__dst, __src, sizeof(__dst));
      ConnectionSnapshotReport.isPoorLinkQuality.getter();
      swift_unknownObjectRelease();
      uint64_t v58 = OUTLINED_FUNCTION_67_2();
      outlined release of ConnectionSnapshotReport?((uint64_t)v58);
    }
  }
  OUTLINED_FUNCTION_29();
  return result;
}

Swift::Void __swiftcall BackgroundConnection.updateFirstByteReadTime()()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AB0]), sel_init);
  objc_msgSend(v1, sel_systemUptime);
  uint64_t v3 = v2;

  *(void *)(v0 + 1216) = v3;
}

Swift::Void __swiftcall BackgroundConnection.willStartConnection(with:)(Swift::OpaquePointer with)
{
}

void BackgroundConnection.fallbackToNextConnectionMethod(error:)(void *a1)
{
  OUTLINED_FUNCTION_23_2();
  swift_weakInit();
  id v2 = a1;
  specialized BackgroundConnection.fallbackToNextConnectionMethodWithError(_:with:)();
}

void closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(error:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)a1;
  unint64_t v4 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v6 = *(void *)(a1 + 24);
  uint64_t v8 = *(void **)(a1 + 32);
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    if (v4 >> 1 != 0xFFFFFFFF || v6 > 1)
    {
      if (one-time initialization token for siriNetwork != -1) {
        swift_once();
      }
      uint64_t v10 = type metadata accessor for Logger();
      __swift_project_value_buffer(v10, (uint64_t)static Logger.siriNetwork);
      outlined copy of NetworkConnectionError?(v5, v4, v7, v6, v8);
      id v11 = a3;
      outlined copy of NetworkConnectionError?(v5, v4, v7, v6, v8);
      id v12 = a3;
      int v13 = Logger.logObject.getter();
      os_log_type_t v14 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v13, v14))
      {
        os_log_type_t v23 = v14;
        uint64_t v15 = swift_slowAlloc();
        uint64_t v22 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v15 = 138412546;
        lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
        swift_allocError();
        *long long v16 = v5;
        v16[1] = v4;
        v16[2] = v7;
        v16[3] = v6;
        v16[4] = v8;
        outlined copy of NetworkConnectionError(v5, v4, v7, v6, v8);
        uint64_t v24 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v22 = v24;
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        *(_WORD *)(v15 + 12) = 2112;
        if (a3)
        {
          id v17 = a3;
          uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
        }
        else
        {
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          uint64_t v18 = 0;
        }
        v22[1] = v18;

        _os_log_impl(&dword_25D6CC000, v13, v23, "Background Connection - Fallback: Callback to Completion with error %@ for error (%@)", (uint8_t *)v15, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x2611B3750](v22, -1, -1);
        MEMORY[0x2611B3750](v15, -1, -1);
      }
      else
      {
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
      }
      id v19 = a3;
      if (!a3)
      {
        lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
        id v19 = (void *)swift_allocError();
        *(void *)(v20 + 8) = 0;
        *(void *)(v20 + 16) = 0;
        *(void *)uint64_t v20 = 9;
        *(_OWORD *)(v20 + 24) = xmmword_25D790FF0;
      }
      id v21 = a3;
      BackgroundConnection.didEncounterError(_:)(v19);
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
}

uint64_t BackgroundConnection.connectionSendData(_:)(uint64_t a1, unint64_t a2)
{
  v3[3] = MEMORY[0x263F06F78];
  v3[0] = a1;
  v3[1] = a2;
  outlined copy of Data._Representation(a1, a2);
  BackgroundConnection.sendData(_:with:)((uint64_t)v3, (void (*)(void))destructiveProjectEnumData for ConnectionConfigurationError, 0);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

void BackgroundConnection.logSessionConnectionHttpHeaderCreated(httpHeader:)()
{
  id v1 = *(id *)(v0 + 1176);
  NetworkAnalytics.logSessionConnectionHttpHeaderCreated(_:)();
}

Swift::Void __swiftcall BackgroundConnection.didReceiveAceObject(aceObject:)(AceObject *aceObject)
{
}

uint64_t BackgroundConnection.willStartConnection(with:)(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t result = MEMORY[0x2611B37F0](v2 + 16);
  if (result)
  {
    a2(v2, a1, result);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t BackgroundConnection.didReceiveObject(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t result = MEMORY[0x2611B37F0](v2 + 16);
  if (result)
  {
    specialized Connection.didReceiveObject(_:object:)(v2, a1, a2, result);
    return swift_unknownObjectRelease();
  }
  return result;
}

Swift::Int BackgroundConnection.hashValue.getter()
{
  OUTLINED_FUNCTION_56_2();
  specialized BackgroundConnectionProtocol.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

unsigned char *storeEnumTagSinglePayload for ConnectionState(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x25D775568);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConnectionState()
{
  return &type metadata for ConnectionState;
}

unint64_t lazy protocol witness table accessor for type ConnectionState and conformance ConnectionState()
{
  unint64_t result = lazy protocol witness table cache variable for type ConnectionState and conformance ConnectionState;
  if (!lazy protocol witness table cache variable for type ConnectionState and conformance ConnectionState)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ConnectionState and conformance ConnectionState);
  }
  return result;
}

void *protocol witness for BackgroundConnectionProtocol.connectionConfiguration.getter in conformance BackgroundConnection@<X0>(void *a1@<X8>)
{
  OUTLINED_FUNCTION_54_3(v3);
  OUTLINED_FUNCTION_54_3(a1);
  return outlined retain of ConnectionConfiguration(v3);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance BackgroundConnection()
{
  return BackgroundConnection.hashValue.getter();
}

void *protocol witness for Hashable.hash(into:) in conformance BackgroundConnection(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return BackgroundConnectionProtocol.hash(into:)(a1, a2, WitnessTable);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance BackgroundConnection(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  uint64_t WitnessTable = swift_getWitnessTable();
  BackgroundConnectionProtocol.hash(into:)((uint64_t)v5, a2, WitnessTable);
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance BackgroundConnection(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  uint64_t WitnessTable = swift_getWitnessTable();

  return static BackgroundConnectionProtocol.== infix(_:_:)(v4, v5, a3, WitnessTable);
}

uint64_t base witness table accessor for Equatable in BackgroundConnection(uint64_t a1, uint64_t a2)
{
  return lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, a2, (void (*)(uint64_t))type metadata accessor for BackgroundConnection);
}

uint64_t instantiation function for generic protocol witness table for BackgroundConnection(uint64_t a1, uint64_t a2)
{
  uint64_t result = lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection(&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, a2, (void (*)(uint64_t))type metadata accessor for BackgroundConnection);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(uint64_t (*a1)(void))
{
  return a1();
}

{
  uint64_t result;

  uint64_t result = a1();
  if (result) {
    return _swift_stdlib_bridgeErrorToNSError();
  }
  return result;
}

uint64_t specialized UnsafeMutablePointer.assign(repeating:count:)(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t specialized Set._Variant.insert(_:)(unsigned char *a1, Swift::Int a2)
{
  uint64_t v5 = *v2;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a2);
  Swift::Int v6 = Hasher._finalize()();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    specialized _NativeSet.insertNew(_:at:isUnique:)(a2, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(unsigned __int8 *)(v9 + v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(unsigned __int8 *)(v9 + v8) != a2);
  }
  uint64_t result = 0;
  LOBYTE(a2) = *(unsigned char *)(*(void *)(*v2 + 48) + v8);
LABEL_8:
  *a1 = a2;
  return result;
}

void specialized Set._Variant.insert(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_72_1();
  OUTLINED_FUNCTION_81_1();
  if (v13)
  {
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    Swift::UInt64 v15 = NWConnection.identifier.getter();
    Hasher._combine(_:)(v15);
    Swift::Int v16 = Hasher._finalize()();
    uint64_t v17 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v18 = v16 & ~v17;
    OUTLINED_FUNCTION_115_0();
    if (v19)
    {
      swift_retain();
      uint64_t v20 = NWConnection.identifier.getter();
      uint64_t v21 = NWConnection.identifier.getter();
      swift_release();
      if (v20 == v21)
      {
LABEL_9:
        swift_release();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_122_0();
        goto LABEL_18;
      }
      uint64_t v22 = ~v17;
      while (1)
      {
        unint64_t v18 = (v18 + 1) & v22;
        OUTLINED_FUNCTION_115_0();
        if ((v23 & 1) == 0) {
          break;
        }
        swift_retain();
        uint64_t v24 = NWConnection.identifier.getter();
        uint64_t v25 = NWConnection.identifier.getter();
        swift_release();
        if (v24 == v25) {
          goto LABEL_9;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_123_0();
    uint64_t v29 = swift_retain();
    specialized _NativeSet.insertNew(_:at:isUnique:)(v29, v18, isUniquelyReferenced_nonNull_native);
    *id v11 = a9;
    goto LABEL_17;
  }
  OUTLINED_FUNCTION_121_0();
  swift_retain();
  uint64_t v14 = __CocoaSet.member(for:)();
  swift_release();
  if (v14)
  {
    swift_bridgeObjectRelease();
    swift_release();
    type metadata accessor for NWConnection();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    *uint64_t v9 = a9;
    swift_unknownObjectRelease();
LABEL_18:
    OUTLINED_FUNCTION_71_1();
    return;
  }
  if (!__OFADD__(__CocoaSet.count.getter(), 1))
  {
    specialized _NativeSet.init(_:capacity:)();
    uint64_t v30 = v26;
    if (*(void *)(v26 + 24) <= *(void *)(v26 + 16))
    {
      swift_retain();
      specialized _NativeSet.resize(capacity:)();
      uint64_t v27 = v30;
    }
    else
    {
      uint64_t v27 = v26;
      swift_retain();
    }
    specialized _NativeSet._unsafeInsertNew(_:)();
    *id v11 = v27;
LABEL_17:
    swift_bridgeObjectRelease();
    *uint64_t v9 = v10;
    goto LABEL_18;
  }
  __break(1u);
}

uint64_t specialized Set._Variant.insert(_:)(char *a1, const void *a2)
{
  memcpy(__dst, a2, 0x72uLL);
  uint64_t v6 = *v2;
  memcpy(__src, a2, 0x72uLL);
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  ConnectionPolicyRoute.hash(into:)();
  Hasher._finalize()();
  OUTLINED_FUNCTION_117_0();
  if ((*(void *)(v6 + 56 + ((v3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v3))
  {
    uint64_t v8 = ~v7;
    while (1)
    {
      OUTLINED_FUNCTION_62_2();
      __src[0] = *v9;
      __src[1] = v9[1];
      __src[2] = v9[2];
      __src[3] = v9[3];
      *(void *)&__src[4] = v10;
      BYTE8(__src[4]) = v11;
      __src[5] = v9[5];
      LOBYTE(__src[6]) = v12;
      *((void *)&__src[6] + 1) = v13;
      LOBYTE(__src[7]) = v14;
      BYTE1(__src[7]) = v15;
      if (static ConnectionPolicyRoute.== infix(_:_:)((uint64_t)__src, (uint64_t)__dst)) {
        break;
      }
      unint64_t v3 = (v3 + 1) & v8;
      if (((*(void *)(v6 + 56 + ((v3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v3) & 1) == 0) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
    outlined release of ConnectionPolicyRoute((uint64_t)a2);
    uint64_t v18 = *(void *)(*v2 + 48) + 120 * v3;
    uint64_t v19 = *(void *)(v18 + 40);
    uint64_t v20 = *(void *)(v18 + 64);
    char v21 = *(unsigned char *)(v18 + 72);
    uint64_t v23 = *(void *)(v18 + 80);
    uint64_t v22 = *(void *)(v18 + 88);
    char v24 = *(unsigned char *)(v18 + 96);
    uint64_t v25 = *(void *)(v18 + 104);
    char v26 = *(unsigned char *)(v18 + 112);
    char v27 = *(unsigned char *)(v18 + 113);
    *(void *)a1 = *(void *)v18;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(v18 + 8);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(v18 + 24);
    *((void *)a1 + 5) = v19;
    *((_OWORD *)a1 + 3) = *(_OWORD *)(v18 + 48);
    *((void *)a1 + 8) = v20;
    a1[72] = v21;
    *((void *)a1 + 10) = v23;
    *((void *)a1 + 11) = v22;
    a1[96] = v24;
    *((void *)a1 + 13) = v25;
    a1[112] = v26;
    a1[113] = v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    memcpy(__src, __dst, 0x72uLL);
    uint64_t v28 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    outlined retain of ConnectionPolicyRoute((uint64_t)__src);
    specialized _NativeSet.insertNew(_:at:isUnique:)(__src, v3, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v28;
    swift_bridgeObjectRelease();
    memcpy(a1, __src, 0x72uLL);
    return 1;
  }
}

void specialized Set._Variant.insert(_:)()
{
  OUTLINED_FUNCTION_81_1();
  if (v5)
  {
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    specialized BackgroundConnectionProtocol.hash(into:)((uint64_t)__dst);
    Hasher._finalize()();
    OUTLINED_FUNCTION_117_0();
    if ((*(void *)(v3 + 56 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
    {
      uint64_t v8 = ~v7;
      while (1)
      {
        memcpy(__dst, (const void *)(*(void *)(*(void *)(v3 + 48) + 8 * v4) + 40), 0x204uLL);
        OUTLINED_FUNCTION_54_3(&v28);
        if (static ConnectionConfiguration.== infix(_:_:)((uint64_t)__dst, (uint64_t)&v28)) {
          break;
        }
        unint64_t v4 = (v4 + 1) & v8;
        if (((*(void *)(v3 + 56 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
          goto LABEL_8;
        }
      }
      swift_release();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_122_0();
      goto LABEL_17;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    __dst[0] = *v2;
    *uint64_t v2 = 0x8000000000000000;
    uint64_t v10 = swift_retain();
    specialized _NativeSet.insertNew(_:at:isUnique:)(v10, v4, isUniquelyReferenced_nonNull_native, v11, v12, v13, v14, v15);
    *uint64_t v2 = __dst[0];
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_121_0();
  swift_retain();
  uint64_t v6 = __CocoaSet.member(for:)();
  swift_release();
  if (v6)
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v28 = v6;
    type metadata accessor for BackgroundConnection();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    *uint64_t v0 = __dst[0];
    swift_unknownObjectRelease();
LABEL_17:
    OUTLINED_FUNCTION_29();
    return;
  }
  uint64_t v16 = __CocoaSet.count.getter();
  if (!__OFADD__(v16, 1))
  {
    uint64_t v17 = specialized _NativeSet.init(_:capacity:)(v4, v16 + 1);
    __dst[0] = v17;
    unint64_t v18 = *(void *)(v17 + 16);
    if (*(void *)(v17 + 24) <= v18)
    {
      uint64_t v20 = v18 + 1;
      swift_retain();
      specialized _NativeSet.resize(capacity:)(v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38,
        v39,
        v40,
        v41,
        v42,
        v43,
        v44,
        v45,
        v46,
        v47,
        v48,
        v49);
      uint64_t v19 = __dst[0];
    }
    else
    {
      uint64_t v19 = v17;
      swift_retain();
    }
    specialized _NativeSet._unsafeInsertNew(_:)();
    *uint64_t v2 = v19;
LABEL_16:
    swift_bridgeObjectRelease();
    *uint64_t v0 = v1;
    goto LABEL_17;
  }
  __break(1u);
}

uint64_t specialized Set._Variant.insert(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  Swift::Int v7 = *(void *)(*v2 + 40);
  swift_bridgeObjectRetain();
  Swift::Int v8 = AnyHashable._rawHashValue(seed:)(v7);
  uint64_t v9 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    while (1)
    {
      outlined init with copy of AnyHashable(*(void *)(v6 + 48) + 40 * v10, (uint64_t)v17);
      char v12 = MEMORY[0x2611B2700](v17, a2);
      outlined destroy of AnyHashable((uint64_t)v17);
      if (v12) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
    outlined destroy of AnyHashable(a2);
    outlined init with copy of AnyHashable(*(void *)(*v3 + 48) + 40 * v10, a1);
    return 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    outlined init with copy of AnyHashable(a2, (uint64_t)v17);
    OUTLINED_FUNCTION_123_0();
    specialized _NativeSet.insertNew(_:at:isUnique:)((uint64_t)v17, v10, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v16;
    swift_bridgeObjectRelease();
    long long v14 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v14;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    return 1;
  }
}

void specialized _NativeSet.resize(capacity:)()
{
  OUTLINED_FUNCTION_72_1();
  OUTLINED_FUNCTION_78_2();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<NWConnection>);
  uint64_t v6 = OUTLINED_FUNCTION_84_2();
  if (*(void *)(v1 + 16))
  {
    OUTLINED_FUNCTION_12_10();
    uint64_t v0 = 0;
    if (!v3) {
      goto LABEL_4;
    }
LABEL_3:
    OUTLINED_FUNCTION_75_2();
    while (1)
    {
      OUTLINED_FUNCTION_146();
      Swift::UInt64 v9 = NWConnection.identifier.getter();
      Hasher._combine(_:)(v9);
      Hasher._finalize()();
      OUTLINED_FUNCTION_38_2();
      if (v10)
      {
        OUTLINED_FUNCTION_7_3();
        while (++v13 != v14 || (v12 & 1) == 0)
        {
          BOOL v15 = v13 == v14;
          if (v13 == v14) {
            uint64_t v13 = 0;
          }
          v12 |= v15;
          if (*(void *)(v5 + 8 * v13) != -1)
          {
            OUTLINED_FUNCTION_6_5();
            goto LABEL_25;
          }
        }
        __break(1u);
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_5();
LABEL_25:
      OUTLINED_FUNCTION_16_8(v11);
      if (v3) {
        goto LABEL_3;
      }
LABEL_4:
      uint64_t v7 = v0 + 1;
      if (__OFADD__(v0, 1)) {
        goto LABEL_33;
      }
      if (v7 >= v4) {
        goto LABEL_27;
      }
      ++v0;
      if (!v2[v7])
      {
        uint64_t v0 = v7 + 1;
        if (v7 + 1 >= v4) {
          goto LABEL_27;
        }
        if (!v2[v0])
        {
          uint64_t v8 = v7 + 2;
          if (v8 >= v4)
          {
LABEL_27:
            swift_release();
            OUTLINED_FUNCTION_70_1();
            if (v17 ^ v18 | v10) {
              *uint64_t v2 = -1 << v16;
            }
            else {
              OUTLINED_FUNCTION_106_1(v16);
            }
            *(void *)(v1 + 16) = 0;
            break;
          }
          if (!v2[v8])
          {
            while (1)
            {
              uint64_t v0 = v8 + 1;
              if (__OFADD__(v8, 1)) {
                goto LABEL_34;
              }
              if (v0 >= v4) {
                goto LABEL_27;
              }
              ++v8;
              if (v2[v0]) {
                goto LABEL_15;
              }
            }
          }
          uint64_t v0 = v8;
        }
      }
LABEL_15:
      OUTLINED_FUNCTION_104_1();
    }
  }
  swift_release();
  *(void *)uint64_t v0 = v6;
  OUTLINED_FUNCTION_71_1();
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<ConnectionMethod>);
  uint64_t result = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    if (!v9) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (unint64_t i = v12 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v5 << 6))
    {
      Swift::UInt v17 = *(unsigned __int8 *)(*(void *)(v2 + 48) + i);
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v17);
      uint64_t result = Hasher._finalize()();
      uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v19 = result & ~v18;
      unint64_t v20 = v19 >> 6;
      if (((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6))) == 0)
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v18) >> 6;
        while (++v20 != v23 || (v22 & 1) == 0)
        {
          BOOL v24 = v20 == v23;
          if (v20 == v23) {
            unint64_t v20 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v20);
          if (v25 != -1)
          {
            unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      *(unsigned char *)(*(void *)(v4 + 48) + v21) = v17;
      ++*(void *)(v4 + 16);
      if (v9) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v10) {
        goto LABEL_32;
      }
      unint64_t v15 = v6[v14];
      ++v5;
      if (!v15)
      {
        int64_t v5 = v14 + 1;
        if (v14 + 1 >= v10) {
          goto LABEL_32;
        }
        unint64_t v15 = v6[v5];
        if (!v15)
        {
          int64_t v5 = v14 + 2;
          if (v14 + 2 >= v10) {
            goto LABEL_32;
          }
          unint64_t v15 = v6[v5];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v10)
            {
LABEL_32:
              uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
              if (v26 > 63) {
                specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v26 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                void *v6 = -1 << v26;
              }
              uint64_t v1 = v0;
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v6[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v5 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v5 >= v10) {
                  goto LABEL_32;
                }
                unint64_t v15 = v6[v5];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v5 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v9 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  long long v29;
  long long v30;
  uint64_t v31;

  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<AnyHashable>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    uint64_t v8 = v7 & *(void *)(v2 + 56);
    unint64_t v9 = (unint64_t)(v5 + 63) >> 6;
    int64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    unint64_t v12 = 0;
    if (!v8) {
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      uint64_t v18 = *(void *)(v2 + 48) + 40 * i;
      char v29 = *(_OWORD *)v18;
      uint64_t v30 = *(_OWORD *)(v18 + 16);
      uint64_t v31 = *(void *)(v18 + 32);
      uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(v4 + 40));
      unint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) == 0)
      {
        unint64_t v23 = 0;
        BOOL v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          uint64_t v25 = v21 == v24;
          if (v21 == v24) {
            unint64_t v21 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v21);
          if (v26 != -1)
          {
            char v22 = __clz(__rbit64(~v26)) + (v21 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      char v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      uint64_t v27 = *(void *)(v4 + 48) + 40 * v22;
      *(_OWORD *)uint64_t v27 = v29;
      *(_OWORD *)(v27 + 16) = v30;
      *(void *)(v27 + 32) = v31;
      ++*(void *)(v4 + 16);
      if (v8) {
        goto LABEL_6;
      }
LABEL_7:
      unint64_t v15 = v12 + 1;
      if (__OFADD__(v12, 1)) {
        goto LABEL_38;
      }
      if (v15 >= v9) {
        goto LABEL_32;
      }
      int64_t v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        unint64_t v12 = v15 + 1;
        if (v15 + 1 >= v9) {
          goto LABEL_32;
        }
        int64_t v16 = v6[v12];
        if (!v16)
        {
          unint64_t v12 = v15 + 2;
          if (v15 + 2 >= v9) {
            goto LABEL_32;
          }
          int64_t v16 = v6[v12];
          if (!v16)
          {
            Swift::UInt v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
              if (v28 > 63) {
                specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v28 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                void *v6 = -1 << v28;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            int64_t v16 = v6[v17];
            if (!v16)
            {
              while (1)
              {
                unint64_t v12 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_39;
                }
                if (v12 >= v9) {
                  goto LABEL_32;
                }
                int64_t v16 = v6[v12];
                ++v17;
                if (v16) {
                  goto LABEL_20;
                }
              }
            }
            unint64_t v12 = v17;
          }
        }
      }
LABEL_20:
      uint64_t v8 = (v16 - 1) & v16;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<ConnectionPolicyRoute>);
  uint64_t v2 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v3 = v2;
  if (*(void *)(v1 + 16))
  {
    uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
    uint64_t v27 = (void *)(v1 + 56);
    if (v4 < 64) {
      uint64_t v5 = ~(-1 << v4);
    }
    else {
      uint64_t v5 = -1;
    }
    unint64_t v6 = v5 & *(void *)(v1 + 56);
    int64_t v28 = (unint64_t)(v4 + 63) >> 6;
    uint64_t v29 = v2 + 56;
    uint64_t v30 = v1;
    unint64_t result = swift_retain();
    int64_t v8 = 0;
    if (!v6) {
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v39 = (v6 - 1) & v6;
    int64_t v40 = v8;
    unint64_t v9 = __clz(__rbit64(v6)) | (v8 << 6);
    uint64_t v10 = v30;
    while (1)
    {
      uint64_t v15 = *(void *)(v10 + 48) + 120 * v9;
      uint64_t v17 = *(void *)v15;
      uint64_t v16 = *(void *)(v15 + 8);
      uint64_t v19 = *(void *)(v15 + 16);
      uint64_t v18 = *(void *)(v15 + 24);
      uint64_t v21 = *(void *)(v15 + 32);
      uint64_t v20 = *(void *)(v15 + 40);
      uint64_t v22 = *(void *)(v15 + 56);
      uint64_t v38 = *(void *)(v15 + 48);
      uint64_t v23 = *(void *)(v15 + 64);
      char v37 = *(unsigned char *)(v15 + 72);
      uint64_t v35 = *(void *)(v15 + 88);
      uint64_t v36 = *(void *)(v15 + 80);
      char v34 = *(unsigned char *)(v15 + 96);
      uint64_t v33 = *(void *)(v15 + 104);
      char v31 = *(unsigned char *)(v15 + 113);
      char v32 = *(unsigned char *)(v15 + 112);
      Hasher.init(_seed:)();
      ConnectionPolicyRoute.hash(into:)();
      Hasher._finalize()();
      unint64_t result = _HashTable.nextHole(atOrAfter:)();
      *(void *)(v29 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
      uint64_t v24 = *(void *)(v3 + 48) + 120 * result;
      *(void *)uint64_t v24 = v17;
      *(void *)(v24 + 8) = v16;
      *(void *)(v24 + 16) = v19;
      *(void *)(v24 + 24) = v18;
      *(void *)(v24 + 32) = v21;
      *(void *)(v24 + 40) = v20;
      *(void *)(v24 + 48) = v38;
      *(void *)(v24 + 56) = v22;
      *(void *)(v24 + 64) = v23;
      *(unsigned char *)(v24 + 72) = v37;
      *(void *)(v24 + 80) = v36;
      *(void *)(v24 + 88) = v35;
      *(unsigned char *)(v24 + 96) = v34;
      *(void *)(v24 + 104) = v33;
      *(unsigned char *)(v24 + 112) = v32;
      *(unsigned char *)(v24 + 113) = v31;
      ++*(void *)(v3 + 16);
      unint64_t v6 = v39;
      int64_t v8 = v40;
      if (v39) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v11 = v8 + 1;
      uint64_t v10 = v30;
      if (__OFADD__(v8, 1))
      {
        __break(1u);
LABEL_29:
        __break(1u);
        return result;
      }
      if (v11 >= v28) {
        goto LABEL_23;
      }
      unint64_t v12 = v27[v11];
      int64_t v13 = v8 + 1;
      if (!v12)
      {
        int64_t v13 = v8 + 2;
        if (v8 + 2 >= v28) {
          goto LABEL_23;
        }
        unint64_t v12 = v27[v13];
        if (!v12)
        {
          int64_t v13 = v8 + 3;
          if (v8 + 3 >= v28) {
            goto LABEL_23;
          }
          unint64_t v12 = v27[v13];
          if (!v12)
          {
            uint64_t v14 = v8 + 4;
            if (v8 + 4 >= v28)
            {
LABEL_23:
              swift_release();
              uint64_t v25 = 1 << *(unsigned char *)(v30 + 32);
              if (v25 > 63) {
                specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v25 + 63) >> 6, v27);
              }
              else {
                *uint64_t v27 = -1 << v25;
              }
              *(void *)(v30 + 16) = 0;
              break;
            }
            unint64_t v12 = v27[v14];
            if (!v12)
            {
              while (1)
              {
                int64_t v13 = v14 + 1;
                if (__OFADD__(v14, 1)) {
                  goto LABEL_29;
                }
                if (v13 >= v28) {
                  goto LABEL_23;
                }
                unint64_t v12 = v27[v13];
                ++v14;
                if (v12) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v13 = v8 + 4;
          }
        }
      }
LABEL_20:
      uint64_t v39 = (v12 - 1) & v12;
      int64_t v40 = v13;
      unint64_t v9 = __clz(__rbit64(v12)) + (v13 << 6);
    }
  }
  unint64_t result = swift_release();
  uint64_t *v26 = v3;
  return result;
}

void specialized _NativeSet.resize(capacity:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_72_1();
  a29 = v36;
  a30 = v37;
  OUTLINED_FUNCTION_78_2();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<BackgroundConnection>);
  uint64_t v38 = OUTLINED_FUNCTION_84_2();
  if (*(void *)(v31 + 16))
  {
    OUTLINED_FUNCTION_12_10();
    uint64_t v30 = 0;
    if (!v33) {
      goto LABEL_4;
    }
LABEL_3:
    OUTLINED_FUNCTION_75_2();
    while (1)
    {
      OUTLINED_FUNCTION_146();
      specialized BackgroundConnectionProtocol.hash(into:)((uint64_t)&a10);
      Hasher._finalize()();
      OUTLINED_FUNCTION_38_2();
      if (v42)
      {
        OUTLINED_FUNCTION_7_3();
        while (++v45 != v46 || (v44 & 1) == 0)
        {
          BOOL v47 = v45 == v46;
          if (v45 == v46) {
            uint64_t v45 = 0;
          }
          v44 |= v47;
          if (*(void *)(v35 + 8 * v45) != -1)
          {
            OUTLINED_FUNCTION_6_5();
            goto LABEL_27;
          }
        }
        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_9_5();
LABEL_27:
      OUTLINED_FUNCTION_16_8(v43);
      if (v33) {
        goto LABEL_3;
      }
LABEL_4:
      uint64_t v39 = v30 + 1;
      if (__OFADD__(v30, 1)) {
        goto LABEL_35;
      }
      if (v39 >= v34) {
        goto LABEL_29;
      }
      uint64_t v40 = v32[v39];
      ++v30;
      if (!v40)
      {
        uint64_t v30 = v39 + 1;
        if (v39 + 1 >= v34) {
          goto LABEL_29;
        }
        uint64_t v40 = v32[v30];
        if (!v40)
        {
          uint64_t v30 = v39 + 2;
          if (v39 + 2 >= v34) {
            goto LABEL_29;
          }
          uint64_t v40 = v32[v30];
          if (!v40)
          {
            uint64_t v41 = v39 + 3;
            if (v41 >= v34)
            {
LABEL_29:
              swift_release();
              OUTLINED_FUNCTION_70_1();
              if (v49 ^ v50 | v42) {
                *char v32 = -1 << v48;
              }
              else {
                OUTLINED_FUNCTION_106_1(v48);
              }
              *(void *)(v31 + 16) = 0;
              break;
            }
            uint64_t v40 = v32[v41];
            if (!v40)
            {
              while (1)
              {
                uint64_t v30 = v41 + 1;
                if (__OFADD__(v41, 1)) {
                  goto LABEL_36;
                }
                if (v30 >= v34) {
                  goto LABEL_29;
                }
                uint64_t v40 = v32[v30];
                ++v41;
                if (v40) {
                  goto LABEL_17;
                }
              }
            }
            uint64_t v30 = v41;
          }
        }
      }
LABEL_17:
      uint64_t v33 = (v40 - 1) & v40;
    }
  }
  swift_release();
  *(void *)uint64_t v30 = v38;
  OUTLINED_FUNCTION_71_1();
}

Swift::Int specialized _NativeSet.insertNew(_:at:isUnique:)(Swift::Int result, unint64_t a2, char a3)
{
  Swift::UInt v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v7 > v6)
    {
      unint64_t result = (Swift::Int)specialized _NativeSet.copy()();
      goto LABEL_14;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  uint64_t v8 = *v3;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v5);
  unint64_t result = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(unsigned __int8 *)(v10 + a2) == v5)
    {
LABEL_13:
      unint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(unsigned __int8 *)(v10 + a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v12 + 48) + a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v8 > v7)
    {
      specialized _NativeSet.copy()();
      goto LABEL_14;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  uint64_t v9 = *v3;
  Hasher.init(_seed:)();
  Swift::UInt64 v10 = NWConnection.identifier.getter();
  Hasher._combine(_:)(v10);
  Swift::Int v11 = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v9 + 32);
  a2 = v11 & ~v12;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    type metadata accessor for NWConnection();
    swift_retain();
    uint64_t v13 = NWConnection.identifier.getter();
    uint64_t v14 = NWConnection.identifier.getter();
    swift_release();
    if (v13 == v14)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v15 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v15;
        if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        swift_retain();
        uint64_t v16 = NWConnection.identifier.getter();
        uint64_t v17 = NWConnection.identifier.getter();
        swift_release();
        if (v16 == v17) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v18 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v18 + 48) + 8 * a2) = a1;
  uint64_t v19 = *(void *)(v18 + 16);
  BOOL v20 = __OFADD__(v19, 1);
  uint64_t v21 = v19 + 1;
  if (v20) {
    __break(1u);
  }
  else {
    *(void *)(v18 + 16) = v21;
  }
}

{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  long long v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  unsigned char v20[40];

  uint64_t v4 = v3;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v8 > v7)
    {
      specialized _NativeSet.copy()();
      goto LABEL_12;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  uint64_t v9 = *v3;
  Swift::UInt64 v10 = AnyHashable._rawHashValue(seed:)(*(void *)(*v3 + 40));
  Swift::Int v11 = -1 << *(unsigned char *)(v9 + 32);
  a2 = v10 & ~v11;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v12 = ~v11;
    do
    {
      outlined init with copy of AnyHashable(*(void *)(v9 + 48) + 40 * a2, (uint64_t)v20);
      uint64_t v13 = MEMORY[0x2611B2700](v20, a1);
      outlined destroy of AnyHashable((uint64_t)v20);
      if (v13) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v12;
    }
    while (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v14 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v15 = *(void *)(v14 + 48) + 40 * a2;
  uint64_t v16 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)a1;
  *(_OWORD *)(v15 + 16) = v16;
  *(void *)(v15 + 32) = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(v14 + 16);
  uint64_t v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (!v18)
  {
    *(void *)(v14 + 16) = v19;
    return;
  }
  __break(1u);
LABEL_15:
  ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
}

uint64_t specialized _NativeSet.insertNew(_:at:isUnique:)(void *__src, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  memcpy(__dst, __src, 0x72uLL);
  unint64_t v8 = *(void *)(*v4 + 16);
  unint64_t v9 = *(void *)(*v4 + 24);
  if (v9 > v8 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v9 > v8)
    {
      specialized _NativeSet.copy()();
      goto LABEL_12;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  uint64_t v10 = *v4;
  memcpy(v30, __src, sizeof(v30));
  Hasher.init(_seed:)();
  ConnectionPolicyRoute.hash(into:)();
  Swift::Int v11 = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  a2 = v11 & ~v12;
  uint64_t v13 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v14 = ~v12;
    uint64_t v15 = *(void *)(v10 + 48);
    do
    {
      uint64_t v16 = v15 + 120 * a2;
      uint64_t v17 = *(void *)(v16 + 64);
      char v18 = *(unsigned char *)(v16 + 72);
      char v19 = *(unsigned char *)(v16 + 96);
      uint64_t v20 = *(void *)(v16 + 104);
      char v21 = *(unsigned char *)(v16 + 112);
      char v22 = *(unsigned char *)(v16 + 113);
      long long v23 = *(_OWORD *)(v16 + 16);
      *(_OWORD *)uint64_t v30 = *(_OWORD *)v16;
      *(_OWORD *)&v30[16] = v23;
      long long v24 = *(_OWORD *)(v16 + 48);
      *(_OWORD *)&v30[32] = *(_OWORD *)(v16 + 32);
      *(_OWORD *)&v30[48] = v24;
      *(void *)&v30[64] = v17;
      v30[72] = v18;
      *(_OWORD *)&v30[80] = *(_OWORD *)(v16 + 80);
      v30[96] = v19;
      *(void *)&v30[104] = v20;
      v30[112] = v21;
      v30[113] = v22;
      if (static ConnectionPolicyRoute.== infix(_:_:)((uint64_t)v30, (uint64_t)__dst)) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v14;
    }
    while (((*(void *)(v13 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v25 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (uint64_t)memcpy((void *)(*(void *)(v25 + 48) + 120 * a2), __src, 0x72uLL);
  uint64_t v27 = *(void *)(v25 + 16);
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (!v28)
  {
    *(void *)(v25 + 16) = v29;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = a2;
  unint64_t v11 = *(void *)(*v8 + 16);
  unint64_t v12 = *(void *)(*v8 + 24);
  if (v12 > v11 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    specialized _NativeSet.resize(capacity:)(v11 + 1, a2, a3, a4, a5, a6, a7, a8, v21[0], v21[1], v21[2], v21[3], v21[4], v21[5], v21[6], v21[7], v21[8], v21[9], v21[10],
      v21[11],
      v21[12],
      v21[13],
      v21[14],
      v21[15],
      v21[16],
      v21[17],
      v21[18],
      v21[19],
      v21[20],
      v21[21]);
  }
  else
  {
    if (v12 > v11)
    {
      specialized _NativeSet.copy()();
      goto LABEL_12;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  uint64_t v13 = *v8;
  Hasher.init(_seed:)();
  specialized BackgroundConnectionProtocol.hash(into:)((uint64_t)__dst);
  Swift::Int v14 = Hasher._finalize()();
  uint64_t v15 = -1 << *(unsigned char *)(v13 + 32);
  unint64_t v9 = v14 & ~v15;
  if ((*(void *)(v13 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v16 = ~v15;
    do
    {
      memcpy(__dst, (const void *)(*(void *)(*(void *)(v13 + 48) + 8 * v9) + 40), 0x204uLL);
      memcpy(v21, (const void *)(a1 + 40), 0x204uLL);
      if (static ConnectionConfiguration.== infix(_:_:)((uint64_t)__dst, (uint64_t)v21)) {
        goto LABEL_15;
      }
      unint64_t v9 = (v9 + 1) & v16;
    }
    while (((*(void *)(v13 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
LABEL_12:
  uint64_t v17 = *v8;
  *(void *)(*v8 + 8 * (v9 >> 6) + 56) |= 1 << v9;
  *(void *)(*(void *)(v17 + 48) + 8 * v9) = a1;
  uint64_t v18 = *(void *)(v17 + 16);
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (!v19)
  {
    *(void *)(v17 + 16) = v20;
    return;
  }
  __break(1u);
LABEL_15:
  type metadata accessor for BackgroundConnection();
  ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
}

void specialized _NativeSet.copy()()
{
  OUTLINED_FUNCTION_119_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<NWConnection>);
  OUTLINED_FUNCTION_91_1();
  OUTLINED_FUNCTION_137();
  if (!v5)
  {
LABEL_24:
    swift_release();
    *uint64_t v0 = v0;
    OUTLINED_FUNCTION_85_2();
    return;
  }
  unint64_t v6 = (void *)OUTLINED_FUNCTION_4_21();
  if (v9) {
    BOOL v10 = (unint64_t)v6 >= v8;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10) {
    OUTLINED_FUNCTION_98_2(v6, v7);
  }
  OUTLINED_FUNCTION_3_27();
  if (!v4) {
    goto LABEL_10;
  }
LABEL_9:
  OUTLINED_FUNCTION_30_5();
  while (1)
  {
    OUTLINED_FUNCTION_145(v11);
    if (v4) {
      goto LABEL_9;
    }
LABEL_10:
    uint64_t v12 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v12 >= v2) {
      goto LABEL_24;
    }
    ++v3;
    if (!*(void *)(v1 + 8 * v12))
    {
      uint64_t v3 = v12 + 1;
      if (v12 + 1 >= v2) {
        goto LABEL_24;
      }
      if (!*(void *)(v1 + 8 * v3)) {
        break;
      }
    }
LABEL_21:
    OUTLINED_FUNCTION_104_1();
    uint64_t v11 = v14 + (v3 << 6);
  }
  uint64_t v13 = v12 + 2;
  if (v13 >= v2) {
    goto LABEL_24;
  }
  if (*(void *)(v1 + 8 * v13))
  {
    uint64_t v3 = v13;
    goto LABEL_21;
  }
  while (1)
  {
    uint64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v2) {
      goto LABEL_24;
    }
    ++v13;
    if (*(void *)(v1 + 8 * v3)) {
      goto LABEL_21;
    }
  }
LABEL_26:
  __break(1u);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t i;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  long long v34;
  long long v35;
  long long v36;
  uint64_t *v37;

  OUTLINED_FUNCTION_14_7();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<ConnectionPolicyRoute>);
  uint64_t v37 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = v2;
  static _SetStorage.copy(original:)();
  OUTLINED_FUNCTION_137();
  if (!v5)
  {
LABEL_28:
    swift_release();
    *uint64_t v37 = v4;
    OUTLINED_FUNCTION_42();
    return;
  }
  unint64_t v6 = (void *)OUTLINED_FUNCTION_4_21();
  if (v9) {
    BOOL v10 = (unint64_t)v6 >= v8;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10) {
    OUTLINED_FUNCTION_98_2(v6, v7);
  }
  uint64_t v11 = 0;
  *(void *)(v4 + 16) = *(void *)(v3 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v13 = *(void *)(v3 + 56);
  uint64_t v14 = -1;
  if (v12 < 64) {
    uint64_t v14 = ~(-1 << v12);
  }
  uint64_t v15 = v14 & v13;
  uint64_t v16 = (unint64_t)(v12 + 63) >> 6;
  if ((v14 & v13) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v17 = __clz(__rbit64(v15));
  v15 &= v15 - 1;
  for (unint64_t i = v17 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v11 << 6))
  {
    char v22 = 120 * i;
    long long v23 = *(void *)(v3 + 48) + v22;
    long long v24 = *(void *)(v23 + 40);
    uint64_t v25 = *(void *)(v23 + 64);
    uint64_t v26 = *(unsigned char *)(v23 + 72);
    BOOL v28 = *(void *)(v23 + 80);
    uint64_t v27 = *(void *)(v23 + 88);
    uint64_t v29 = *(unsigned char *)(v23 + 96);
    uint64_t v30 = *(void *)(v23 + 104);
    uint64_t v31 = *(unsigned char *)(v23 + 112);
    char v32 = *(unsigned char *)(v23 + 113);
    uint64_t v33 = *(void *)(v4 + 48) + v22;
    uint64_t v34 = *(_OWORD *)(v23 + 8);
    uint64_t v35 = *(_OWORD *)(v23 + 24);
    uint64_t v36 = *(_OWORD *)(v23 + 48);
    *(void *)uint64_t v33 = *(void *)v23;
    *(_OWORD *)(v33 + 8) = v34;
    *(_OWORD *)(v33 + 24) = v35;
    *(void *)(v33 + 40) = v24;
    *(_OWORD *)(v33 + 48) = v36;
    *(void *)(v33 + 64) = v25;
    *(unsigned char *)(v33 + 72) = v26;
    *(void *)(v33 + 80) = v28;
    *(void *)(v33 + 88) = v27;
    *(unsigned char *)(v33 + 96) = v29;
    *(void *)(v33 + 104) = v30;
    *(unsigned char *)(v33 + 112) = v31;
    *(unsigned char *)(v33 + 113) = v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v15) {
      goto LABEL_11;
    }
LABEL_12:
    BOOL v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v16) {
      goto LABEL_28;
    }
    uint64_t v20 = *(void *)(v1 + 8 * v19);
    ++v11;
    if (!v20)
    {
      uint64_t v11 = v19 + 1;
      if (v19 + 1 >= v16) {
        goto LABEL_28;
      }
      uint64_t v20 = *(void *)(v1 + 8 * v11);
      if (!v20)
      {
        uint64_t v11 = v19 + 2;
        if (v19 + 2 >= v16) {
          goto LABEL_28;
        }
        uint64_t v20 = *(void *)(v1 + 8 * v11);
        if (!v20) {
          break;
        }
      }
    }
LABEL_25:
    uint64_t v15 = (v20 - 1) & v20;
  }
  char v21 = v19 + 3;
  if (v21 >= v16) {
    goto LABEL_28;
  }
  uint64_t v20 = *(void *)(v1 + 8 * v21);
  if (v20)
  {
    uint64_t v11 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    uint64_t v11 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v11 >= v16) {
      goto LABEL_28;
    }
    uint64_t v20 = *(void *)(v1 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_119_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<BackgroundConnection>);
  OUTLINED_FUNCTION_91_1();
  OUTLINED_FUNCTION_137();
  if (!v5)
  {
LABEL_26:
    swift_release();
    *uint64_t v0 = v0;
    OUTLINED_FUNCTION_85_2();
    return;
  }
  unint64_t v6 = (void *)OUTLINED_FUNCTION_4_21();
  if (v9) {
    BOOL v10 = (unint64_t)v6 >= v8;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10) {
    OUTLINED_FUNCTION_98_2(v6, v7);
  }
  OUTLINED_FUNCTION_3_27();
  if (!v4) {
    goto LABEL_10;
  }
LABEL_9:
  OUTLINED_FUNCTION_30_5();
  while (1)
  {
    OUTLINED_FUNCTION_145(v11);
    if (v4) {
      goto LABEL_9;
    }
LABEL_10:
    uint64_t v12 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v12 >= v2) {
      goto LABEL_26;
    }
    ++v3;
    if (!*(void *)(v1 + 8 * v12))
    {
      uint64_t v3 = v12 + 1;
      if (v12 + 1 >= v2) {
        goto LABEL_26;
      }
      if (!*(void *)(v1 + 8 * v3))
      {
        uint64_t v3 = v12 + 2;
        if (v12 + 2 >= v2) {
          goto LABEL_26;
        }
        if (!*(void *)(v1 + 8 * v3)) {
          break;
        }
      }
    }
LABEL_23:
    OUTLINED_FUNCTION_69_2();
  }
  uint64_t v13 = v12 + 3;
  if (v13 >= v2) {
    goto LABEL_26;
  }
  if (*(void *)(v1 + 8 * v13))
  {
    uint64_t v3 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v2) {
      goto LABEL_26;
    }
    ++v13;
    if (*(void *)(v1 + 8 * v3)) {
      goto LABEL_23;
    }
  }
LABEL_28:
  __break(1u);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  long long v17;
  long long v18;
  _OWORD v19[2];
  uint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<AnyHashable>);
  OUTLINED_FUNCTION_91_1();
  OUTLINED_FUNCTION_137();
  if (!v6)
  {
LABEL_26:
    swift_release();
    *uint64_t v0 = v0;
    return;
  }
  uint64_t v7 = (void *)OUTLINED_FUNCTION_4_21();
  if (v10) {
    uint64_t v11 = (unint64_t)v7 >= v9;
  }
  else {
    uint64_t v11 = 1;
  }
  if (v11) {
    OUTLINED_FUNCTION_98_2(v7, v8);
  }
  OUTLINED_FUNCTION_3_27();
  if (!v5) {
    goto LABEL_10;
  }
LABEL_9:
  OUTLINED_FUNCTION_30_5();
  while (1)
  {
    uint64_t v15 = 5 * v12;
    outlined init with copy of AnyHashable(*(void *)(v1 + 48) + 40 * v12, (uint64_t)v19);
    uint64_t v16 = v0[6] + 8 * v15;
    uint64_t v17 = v19[0];
    uint64_t v18 = v19[1];
    *(void *)(v16 + 32) = v20;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    if (v5) {
      goto LABEL_9;
    }
LABEL_10:
    uint64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v13 >= v3) {
      goto LABEL_26;
    }
    ++v4;
    if (!*(void *)(v2 + 8 * v13))
    {
      uint64_t v4 = v13 + 1;
      if (v13 + 1 >= v3) {
        goto LABEL_26;
      }
      if (!*(void *)(v2 + 8 * v4))
      {
        uint64_t v4 = v13 + 2;
        if (v13 + 2 >= v3) {
          goto LABEL_26;
        }
        if (!*(void *)(v2 + 8 * v4)) {
          break;
        }
      }
    }
LABEL_23:
    OUTLINED_FUNCTION_69_2();
  }
  uint64_t v14 = v13 + 3;
  if (v14 >= v3) {
    goto LABEL_26;
  }
  if (*(void *)(v2 + 8 * v14))
  {
    uint64_t v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v3) {
      goto LABEL_26;
    }
    ++v14;
    if (*(void *)(v2 + 8 * v4)) {
      goto LABEL_23;
    }
  }
LABEL_28:
  __break(1u);
}

void *specialized _NativeSet.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<ConnectionMethod>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  if (!v12) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(unsigned char *)(*(void *)(v4 + 48) + i) = *(unsigned char *)(*(void *)(v2 + 48) + i);
    if (v12) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v12 = (v17 - 1) & v17;
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<NWConnection>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = v2 + 56;
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain_n();
    int64_t v12 = 0;
    if (!v8) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      Hasher.init(_seed:)();
      swift_retain();
      Swift::UInt64 v19 = NWConnection.identifier.getter();
      Hasher._combine(_:)(v19);
      uint64_t result = Hasher._finalize()();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v10 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_27;
          }
        }
        __break(1u);
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_27:
      *(void *)(v10 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      *(void *)(*(void *)(v4 + 48) + 8 * v23) = v18;
      ++*(void *)(v4 + 16);
      if (v8) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v15 = v12 + 1;
      if (__OFADD__(v12, 1)) {
        goto LABEL_33;
      }
      if (v15 >= v9) {
        goto LABEL_29;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v15);
      ++v12;
      if (!v16)
      {
        int64_t v12 = v15 + 1;
        if (v15 + 1 >= v9) {
          goto LABEL_29;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v12);
        if (!v16)
        {
          int64_t v17 = v15 + 2;
          if (v17 >= v9)
          {
LABEL_29:
            uint64_t result = swift_release_n();
            uint64_t v1 = v0;
            goto LABEL_31;
          }
          unint64_t v16 = *(void *)(v6 + 8 * v17);
          int64_t v12 = v17;
          if (!v16) {
            break;
          }
        }
      }
LABEL_17:
      unint64_t v8 = (v16 - 1) & v16;
    }
    while (1)
    {
      int64_t v12 = v17 + 1;
      if (__OFADD__(v17, 1)) {
        break;
      }
      if (v12 >= v9) {
        goto LABEL_29;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v12);
      ++v17;
      if (v16) {
        goto LABEL_17;
      }
    }
LABEL_34:
    __break(1u);
  }
  else
  {
    uint64_t result = swift_release();
LABEL_31:
    *uint64_t v1 = v4;
  }
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  Swift::UInt v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;

  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<ConnectionMethod>);
  uint64_t result = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    unint64_t v8 = ~(-1 << v7);
  }
  else {
    unint64_t v8 = -1;
  }
  int64_t v9 = v8 & *(void *)(v2 + 56);
  uint64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  if (!v9) {
    goto LABEL_7;
  }
LABEL_6:
  int64_t v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v12 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    int64_t v17 = *(unsigned __int8 *)(*(void *)(v2 + 48) + i);
    Hasher.init(_seed:)();
    Hasher._combine(_:)(v17);
    uint64_t result = Hasher._finalize()();
    uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
    Swift::UInt64 v19 = result & ~v18;
    uint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6))) == 0)
    {
      unint64_t v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        char v24 = v20 == v23;
        if (v20 == v23) {
          uint64_t v20 = 0;
        }
        v22 |= v24;
        unint64_t v25 = *(void *)(v11 + 8 * v20);
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(unsigned char *)(*(void *)(v4 + 48) + v21) = v17;
    ++*(void *)(v4 + 16);
    if (v9) {
      goto LABEL_6;
    }
LABEL_7:
    unint64_t v14 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v10) {
      goto LABEL_32;
    }
    int64_t v15 = *(void *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      uint64_t v5 = v14 + 1;
      if (v14 + 1 >= v10) {
        goto LABEL_32;
      }
      int64_t v15 = *(void *)(v6 + 8 * v5);
      if (!v15)
      {
        uint64_t v5 = v14 + 2;
        if (v14 + 2 >= v10) {
          goto LABEL_32;
        }
        int64_t v15 = *(void *)(v6 + 8 * v5);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    int64_t v9 = (v15 - 1) & v15;
  }
  unint64_t v16 = v14 + 3;
  if (v16 >= v10)
  {
LABEL_32:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  int64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    uint64_t v5 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    uint64_t v5 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_32;
    }
    int64_t v15 = *(void *)(v6 + 8 * v5);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  char v27[72];

  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<BackgroundConnection>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * i);
    Hasher.init(_seed:)();
    swift_retain();
    specialized BackgroundConnectionProtocol.hash(into:)((uint64_t)v27);
    uint64_t result = Hasher._finalize()();
    Swift::UInt64 v19 = -1 << *(unsigned char *)(v4 + 32);
    uint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) == 0)
    {
      unint64_t v23 = 0;
      char v24 = (unint64_t)(63 - v19) >> 6;
      while (++v21 != v24 || (v23 & 1) == 0)
      {
        unint64_t v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        BOOL v26 = *(void *)(v10 + 8 * v21);
        if (v26 != -1)
        {
          unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v4 + 48) + 8 * v22) = v18;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_36;
    }
    if (v15 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v12);
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v16 - 1) & v16;
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v9)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v12 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  long long v27;
  long long v28;
  _OWORD v29[2];
  uint64_t v30;

  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<AnyHashable>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    outlined init with copy of AnyHashable(*(void *)(v2 + 48) + 40 * i, (uint64_t)v29);
    uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(v4 + 40));
    uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
    Swift::UInt64 v19 = result & ~v18;
    uint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v10 + 8 * (v19 >> 6))) == 0)
    {
      unint64_t v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        char v24 = v20 == v23;
        if (v20 == v23) {
          uint64_t v20 = 0;
        }
        v22 |= v24;
        unint64_t v25 = *(void *)(v10 + 8 * v20);
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v10 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v10 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    BOOL v26 = *(void *)(v4 + 48) + 40 * v21;
    uint64_t v27 = v29[0];
    BOOL v28 = v29[1];
    *(void *)(v26 + 32) = v30;
    *(_OWORD *)BOOL v26 = v27;
    *(_OWORD *)(v26 + 16) = v28;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_36;
    }
    if (v15 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v12);
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v16 - 1) & v16;
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v9)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v12 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<ConnectionPolicyRoute>);
  uint64_t v2 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
LABEL_24:
    unint64_t result = swift_release();
    *unint64_t v25 = v3;
    return result;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v26 = v1 + 56;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 56);
  int64_t v27 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v28 = v2 + 56;
  uint64_t v29 = v1;
  unint64_t result = swift_retain();
  int64_t v8 = 0;
  if (!v6) {
    goto LABEL_7;
  }
LABEL_6:
  uint64_t v38 = (v6 - 1) & v6;
  int64_t v39 = v8;
  unint64_t v9 = __clz(__rbit64(v6)) | (v8 << 6);
  uint64_t v10 = v29;
  while (1)
  {
    uint64_t v15 = *(void *)(v10 + 48) + 120 * v9;
    uint64_t v16 = *(void *)v15;
    uint64_t v17 = *(void *)(v15 + 8);
    uint64_t v18 = *(void *)(v15 + 24);
    uint64_t v20 = *(void *)(v15 + 32);
    uint64_t v19 = *(void *)(v15 + 40);
    uint64_t v21 = *(void *)(v15 + 48);
    uint64_t v36 = *(void *)(v15 + 56);
    uint64_t v37 = *(void *)(v15 + 16);
    uint64_t v22 = *(void *)(v15 + 64);
    char v35 = *(unsigned char *)(v15 + 72);
    uint64_t v23 = *(void *)(v15 + 88);
    uint64_t v34 = *(void *)(v15 + 80);
    char v33 = *(unsigned char *)(v15 + 96);
    uint64_t v32 = *(void *)(v15 + 104);
    char v30 = *(unsigned char *)(v15 + 113);
    char v31 = *(unsigned char *)(v15 + 112);
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    ConnectionPolicyRoute.hash(into:)();
    Hasher._finalize()();
    unint64_t result = _HashTable.nextHole(atOrAfter:)();
    *(void *)(v28 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v24 = *(void *)(v3 + 48) + 120 * result;
    *(void *)uint64_t v24 = v16;
    *(void *)(v24 + 8) = v17;
    *(void *)(v24 + 16) = v37;
    *(void *)(v24 + 24) = v18;
    *(void *)(v24 + 32) = v20;
    *(void *)(v24 + 40) = v19;
    *(void *)(v24 + 48) = v21;
    *(void *)(v24 + 56) = v36;
    *(void *)(v24 + 64) = v22;
    *(unsigned char *)(v24 + 72) = v35;
    *(void *)(v24 + 80) = v34;
    *(void *)(v24 + 88) = v23;
    *(unsigned char *)(v24 + 96) = v33;
    *(void *)(v24 + 104) = v32;
    *(unsigned char *)(v24 + 112) = v31;
    *(unsigned char *)(v24 + 113) = v30;
    ++*(void *)(v3 + 16);
    unint64_t v6 = v38;
    int64_t v8 = v39;
    if (v38) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v11 = v8 + 1;
    uint64_t v10 = v29;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v11 >= v27) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v26 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_23;
      }
      unint64_t v12 = *(void *)(v26 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v26 + 8 * v13);
        if (!v12) {
          break;
        }
      }
    }
LABEL_20:
    uint64_t v38 = (v12 - 1) & v12;
    int64_t v39 = v13;
    unint64_t v9 = __clz(__rbit64(v12)) + (v13 << 6);
  }
  uint64_t v14 = v8 + 4;
  if (v8 + 4 >= v27)
  {
LABEL_23:
    swift_release();
    goto LABEL_24;
  }
  unint64_t v12 = *(void *)(v26 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 4;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v26 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t specialized BackgroundConnection.connectionProvider(_:receivedIntermediateError:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for DispatchQoS();
  uint64_t v13 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[1] = *(void *)(a3 + 32);
  uint64_t v16 = swift_allocObject();
  swift_weakInit();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v16;
  v17[3] = a1;
  v17[4] = a5;
  v17[5] = a2;
  aBlock[4] = partial apply for closure #1 in BackgroundConnection.connectionProvider(_:receivedIntermediateError:);
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_195;
  uint64_t v18 = _Block_copy(aBlock);
  swift_retain();
  swift_unknownObjectRetain();
  id v19 = a2;
  static DispatchQoS.unspecified.getter();
  uint64_t v23 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x2611B24E0](0, v15, v12, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v22);
  swift_release();
  return swift_release();
}

uint64_t specialized Connection.didEncounterError(_:error:analysisInfo:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v37 = a3;
  id v40 = a2;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v39 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v8 = (char *)&object - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  uint64_t v38 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&object - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ConnectionAnalysisInfo?);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&object - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, v16, (void (*)(uint64_t))type metadata accessor for BackgroundConnection);
  uint64_t result = MEMORY[0x2611B37F0](a1 + 16);
  if (result)
  {
    uint64_t v18 = result;
    uint64_t result = swift_unknownObjectRelease();
    if (v18 == a4)
    {
      type metadata accessor for BackgroundConnection();
      uint64_t result = swift_dynamicCastClass();
      if (result)
      {
        uint64_t v19 = result;
        swift_retain();
        uint64_t v34 = v19;
        Swift::String v20 = BackgroundConnection.getConnectionMethod()();
        object = v20._object;
        uint64_t countAndFlagsBits = v20._countAndFlagsBits;
        uint64_t v36 = *(void *)(a4 + OBJC_IVAR___SNConnectionInternal_connectionQueue);
        uint64_t v21 = swift_allocObject();
        uint64_t v35 = v9;
        uint64_t v22 = v21;
        swift_unknownObjectWeakInit();
        outlined init with copy of NetworkConnectionProtocol?(v37, (uint64_t)&object - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), &demangling cache variable for type metadata for ConnectionAnalysisInfo?);
        unint64_t v23 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
        unint64_t v24 = (v14 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v25 = swift_allocObject();
        id v26 = v40;
        *(void *)(v25 + 16) = v22;
        *(void *)(v25 + 24) = v26;
        _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)v15, v25 + v23, &demangling cache variable for type metadata for ConnectionAnalysisInfo?);
        uint64_t v27 = countAndFlagsBits;
        *(void *)(v25 + v24) = v34;
        uint64_t v28 = (uint64_t *)(v25 + ((v24 + 15) & 0xFFFFFFFFFFFFFFF8));
        uint64_t v29 = (uint64_t)object;
        *uint64_t v28 = v27;
        v28[1] = v29;
        aBlock[4] = partial apply for closure #1 in Connection.didEncounterError(_:error:analysisInfo:);
        aBlock[5] = v25;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
        aBlock[3] = &block_descriptor_209;
        char v30 = _Block_copy(aBlock);
        swift_retain();
        swift_retain();
        id v31 = v40;
        static DispatchQoS.unspecified.getter();
        uint64_t v41 = MEMORY[0x263F8EE78];
        lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
        dispatch thunk of SetAlgebra.init<A>(_:)();
        MEMORY[0x2611B24E0](0, v11, v8, v30);
        _Block_release(v30);
        swift_release();
        (*(void (**)(char *, uint64_t))(v39 + 8))(v8, v6);
        (*(void (**)(char *, uint64_t))(v38 + 8))(v11, v35);
        swift_release();
        return swift_release();
      }
    }
  }
  return result;
}

uint64_t specialized Connection.willStartConnection(_:type:)(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v21 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, v13, (void (*)(uint64_t))type metadata accessor for BackgroundConnection);
  uint64_t result = MEMORY[0x2611B37F0](a1 + 16);
  if (result)
  {
    uint64_t v16 = result;
    uint64_t result = swift_unknownObjectRelease();
    if (v16 == a3)
    {
      v20[1] = *(void *)(a3 + OBJC_IVAR___SNConnectionInternal_connectionQueue);
      uint64_t v17 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = v17;
      *(void *)(v18 + 24) = a1;
      *(void *)(v18 + 32) = v14;
      *(unsigned char *)(v18 + 40) = a2;
      aBlock[4] = partial apply for closure #1 in Connection.willStartConnection(_:type:);
      aBlock[5] = v18;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
      aBlock[3] = &block_descriptor_244;
      uint64_t v19 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      static DispatchQoS.unspecified.getter();
      uint64_t v22 = MEMORY[0x263F8EE78];
      lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      MEMORY[0x2611B24E0](0, v12, v8, v19);
      _Block_release(v19);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v6);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t specialized Connection.didClose(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, v12, (void (*)(uint64_t))type metadata accessor for BackgroundConnection);
  uint64_t result = MEMORY[0x2611B37F0](a1 + 16);
  if (result)
  {
    uint64_t v14 = result;
    uint64_t result = swift_unknownObjectRelease();
    if (v14 == a2)
    {
      type metadata accessor for BackgroundConnection();
      uint64_t result = swift_dynamicCastClass();
      if (result)
      {
        uint64_t v15 = result;
        v19[2] = *(void *)(a2 + OBJC_IVAR___SNConnectionInternal_connectionQueue);
        uint64_t v16 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v17 = swift_allocObject();
        *(void *)(v17 + 16) = v16;
        *(void *)(v17 + 24) = v15;
        v19[1] = v16;
        aBlock[4] = partial apply for closure #1 in Connection.didClose(_:);
        aBlock[5] = v17;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
        aBlock[3] = &block_descriptor_216;
        uint64_t v18 = _Block_copy(aBlock);
        swift_retain_n();
        swift_retain();
        static DispatchQoS.unspecified.getter();
        void v19[3] = MEMORY[0x263F8EE78];
        lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
        dispatch thunk of SetAlgebra.init<A>(_:)();
        MEMORY[0x2611B24E0](0, v11, v7, v18);
        _Block_release(v18);
        swift_release();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        swift_release();
        return swift_release();
      }
    }
  }
  return result;
}

uint64_t specialized Connection.didOpenConnectionType(_:type:routeId:delay:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v12 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v28 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for DispatchQoS();
  uint64_t v27 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, v18, (void (*)(uint64_t))type metadata accessor for BackgroundConnection);
  uint64_t result = MEMORY[0x2611B37F0](a1 + 16);
  if (result)
  {
    uint64_t v20 = result;
    uint64_t result = swift_unknownObjectRelease();
    if (v20 == a5)
    {
      type metadata accessor for BackgroundConnection();
      uint64_t result = swift_dynamicCastClass();
      if (result)
      {
        uint64_t v21 = result;
        uint64_t v26 = *(void *)(a5 + OBJC_IVAR___SNConnectionInternal_connectionQueue);
        uint64_t v25 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v22 = swift_allocObject();
        *(void *)(v22 + 16) = v25;
        *(void *)(v22 + 24) = v21;
        *(unsigned char *)(v22 + 32) = a2;
        *(void *)(v22 + 40) = a3;
        *(void *)(v22 + 48) = a4;
        *(double *)(v22 + 56) = a6;
        aBlock[4] = partial apply for closure #1 in Connection.didOpenConnectionType(_:type:routeId:delay:);
        aBlock[5] = v22;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
        aBlock[3] = &block_descriptor_229;
        unint64_t v23 = _Block_copy(aBlock);
        swift_bridgeObjectRetain();
        swift_retain_n();
        swift_retain();
        static DispatchQoS.unspecified.getter();
        uint64_t v29 = MEMORY[0x263F8EE78];
        lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
        dispatch thunk of SetAlgebra.init<A>(_:)();
        MEMORY[0x2611B24E0](0, v17, v14, v23);
        _Block_release(v23);
        swift_release();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v12);
        (*(void (**)(char *, uint64_t))(v27 + 8))(v17, v15);
        swift_release();
        return swift_release();
      }
    }
  }
  return result;
}

void specialized Connection.didEncounterIntermediateError(_:error:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v40 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  uint64_t v39 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, v12, (void (*)(uint64_t))type metadata accessor for BackgroundConnection);
  uint64_t v47 = (uint64_t)a2;
  id v14 = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
  if (swift_dynamicCast())
  {
    int v15 = v44 >> 60 == 2;
    outlined consume of NetworkConnectionError(aBlock, v42, (uint64_t)v43, v44, v45);
  }
  else
  {
    int v15 = 0;
  }
  uint64_t v16 = MEMORY[0x2611B37F0](a1 + 16);
  if (!v16) {
    goto LABEL_6;
  }
  uint64_t v17 = v16;
  swift_unknownObjectRelease();
  if (v17 != a3) {
    goto LABEL_6;
  }
  uint64_t v30 = *(void *)(a3 + OBJC_IVAR___SNConnectionInternal_activeBackgroundConnection);
  if (v30)
  {
    if (((v30 != a1) & ~v15) == 0) {
      goto LABEL_19;
    }
  }
  else if (v15)
  {
LABEL_19:
    uint64_t v34 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v35 = (void *)swift_allocObject();
    v35[2] = v34;
    v35[3] = a1;
    v35[4] = v13;
    void v35[5] = a2;
    uint64_t v45 = partial apply for closure #1 in Connection.didEncounterIntermediateError(_:error:);
    uint64_t v46 = v35;
    aBlock = (void *)MEMORY[0x263EF8330];
    unint64_t v42 = 1107296256;
    unint64_t v43 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    unint64_t v44 = (unint64_t)&block_descriptor_202;
    uint64_t v36 = _Block_copy(&aBlock);
    id v37 = a2;
    swift_retain();
    swift_retain();
    static DispatchQoS.unspecified.getter();
    uint64_t v47 = MEMORY[0x263F8EE78];
    lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x2611B24E0](0, v11, v8, v36);
    _Block_release(v36);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v9);
    swift_release();
    swift_release();
    return;
  }
LABEL_6:
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v18 = type metadata accessor for Logger();
  __swift_project_value_buffer(v18, (uint64_t)static Logger.siriNetwork);
  id v19 = a2;
  swift_retain();
  id v20 = a2;
  swift_retain();
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v24 = (void *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v47 = v25;
    *(_DWORD *)uint64_t v23 = 136315394;
    unint64_t v26 = *(void *)(a1 + 448);
    if (v26 >= 2)
    {
      aBlock = *(void **)(a1 + 440);
      unint64_t v42 = v26;
      swift_bridgeObjectRetain();
      uint64_t v27 = String.init<A>(describing:)();
      unint64_t v29 = v31;
    }
    else
    {
      uint64_t v27 = implicit closure #4 in implicit closure #3 in Connection.didEncounterIntermediateError(_:error:)();
      unint64_t v29 = v28;
      swift_bridgeObjectRelease();
    }
    aBlock = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v29, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 12) = 2112;
    id v32 = a2;
    char v33 = (void *)_swift_stdlib_bridgeErrorToNSError();
    aBlock = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v24 = v33;

    _os_log_impl(&dword_25D6CC000, v21, v22, "Connection - Intermediate Error: Background Connection. Got an intermediate error from inactive background connection route %s. Error: %@", (uint8_t *)v23, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x2611B3750](v24, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2611B3750](v25, -1, -1);
    MEMORY[0x2611B3750](v23, -1, -1);
  }
  else
  {
    swift_release_n();
  }
}

uint64_t specialized Connection.willStartConnection(_:with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v21 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, v13, (void (*)(uint64_t))type metadata accessor for BackgroundConnection);
  uint64_t result = MEMORY[0x2611B37F0](a1 + 16);
  if (result)
  {
    uint64_t v16 = result;
    uint64_t result = swift_unknownObjectRelease();
    if (v16 == a3)
    {
      v20[1] = *(void *)(a3 + OBJC_IVAR___SNConnectionInternal_connectionQueue);
      uint64_t v17 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v18 = (void *)swift_allocObject();
      v18[2] = v17;
      v18[3] = a1;
      v18[4] = v14;
      v18[5] = a2;
      aBlock[4] = partial apply for closure #1 in Connection.willStartConnection(_:with:);
      aBlock[5] = v18;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
      aBlock[3] = &block_descriptor_157_0;
      id v19 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      static DispatchQoS.unspecified.getter();
      uint64_t v22 = MEMORY[0x263F8EE78];
      lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      MEMORY[0x2611B24E0](0, v12, v8, v19);
      _Block_release(v19);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v6);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t specialized Connection.didReceiveAceObject(_:object:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v22 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, v13, (void (*)(uint64_t))type metadata accessor for BackgroundConnection);
  uint64_t result = MEMORY[0x2611B37F0](a1 + 16);
  if (result)
  {
    uint64_t v16 = result;
    uint64_t result = swift_unknownObjectRelease();
    if (v16 == a3)
    {
      v21[1] = *(void *)(a3 + OBJC_IVAR___SNConnectionInternal_connectionQueue);
      uint64_t v17 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v18 = (void *)swift_allocObject();
      v18[2] = v17;
      v18[3] = a1;
      v18[4] = v14;
      v18[5] = a2;
      aBlock[4] = partial apply for closure #1 in Connection.didReceiveAceObject(_:object:);
      aBlock[5] = v18;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
      aBlock[3] = &block_descriptor_137_0;
      id v19 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      id v20 = a2;
      static DispatchQoS.unspecified.getter();
      uint64_t v23 = MEMORY[0x263F8EE78];
      lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      MEMORY[0x2611B24E0](0, v12, v8, v19);
      _Block_release(v19);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v6);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t specialized Connection.didReceiveObject(_:object:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v23 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DispatchQoS();
  uint64_t v22 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, v14, (void (*)(uint64_t))type metadata accessor for BackgroundConnection);
  uint64_t result = MEMORY[0x2611B37F0](a1 + 16);
  if (result)
  {
    uint64_t v17 = result;
    uint64_t result = swift_unknownObjectRelease();
    if (v17 == a4)
    {
      uint64_t v21 = *(void *)(a4 + OBJC_IVAR___SNConnectionInternal_connectionQueue);
      uint64_t v18 = swift_allocObject();
      swift_unknownObjectWeakInit();
      id v19 = (void *)swift_allocObject();
      v19[2] = v18;
      void v19[3] = a1;
      void v19[4] = v15;
      v19[5] = a2;
      v19[6] = a3;
      aBlock[4] = partial apply for closure #1 in Connection.didReceiveObject(_:object:);
      aBlock[5] = v19;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
      aBlock[3] = &block_descriptor_16;
      id v20 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      outlined copy of Data?(a2, a3);
      static DispatchQoS.unspecified.getter();
      uint64_t v24 = MEMORY[0x263F8EE78];
      lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      MEMORY[0x2611B24E0](0, v13, v10, v20);
      _Block_release(v20);
      (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v8);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v11);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_25D77AC28()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25D77AC60()
{
  swift_release();
  swift_unknownObjectRelease();
  unint64_t v1 = *(void *)(v0 + 48);
  if (v1 >> 60 != 15) {
    outlined consume of Data._Representation(*(void *)(v0 + 40), v1);
  }

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void partial apply for closure #1 in Connection.didReceiveObject(_:object:)()
{
  closure #1 in Connection.didReceiveObject(_:object:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t block_copy_helper_16(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_16()
{
  return swift_release();
}

uint64_t lazy protocol witness table accessor for type BackgroundConnection and conformance BackgroundConnection(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25D77AD28()
{
  swift_release();
  swift_unknownObjectRelease();

  uint64_t v1 = OUTLINED_FUNCTION_45_3();

  return MEMORY[0x270FA0238](v1, v2, v3);
}

void partial apply for closure #1 in Connection.didReceiveAceObject(_:object:)()
{
  closure #1 in Connection.didReceiveAceObject(_:object:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_25D77AD74()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25D77ADAC()
{
  return OUTLINED_FUNCTION_13_10(MEMORY[0x263F8EEB0]);
}

void partial apply for closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(error:)(uint64_t a1)
{
  closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(error:)(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

id outlined copy of NetworkConnectionError?(id result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  if ((unint64_t)a2 >> 1 != 0xFFFFFFFF || a4 >= 2) {
    return outlined copy of NetworkConnectionError(result, a2, a3, a4, a5);
  }
  return result;
}

void outlined consume of NetworkConnectionError?(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  if ((unint64_t)a2 >> 1 != 0xFFFFFFFF || a4 >= 2) {
    outlined consume of NetworkConnectionError(a1, a2, a3, a4, a5);
  }
}

uint64_t sub_25D77AE04()
{
  return objectdestroy_153Tm(MEMORY[0x263F8EEA0]);
}

void partial apply for closure #1 in Connection.willStartConnection(_:with:)()
{
  closure #1 in Connection.willStartConnection(_:with:)(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t siri_kdebug_trace_0(uint64_t a1)
{
  return MEMORY[0x270ED9F50](a1, 0, 0, 0, 0);
}

uint64_t sub_25D77AE3C()
{
  return objectdestroy_142Tm(MEMORY[0x263F8EEE8], 40);
}

void *partial apply for closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(uint64_t a1, unint64_t a2, void *a3, char a4)
{
  return closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24));
}

uint64_t outlined init with take of NetworkConnectionError(uint64_t a1, uint64_t a2)
{
  return a2;
}

void *outlined retain of NetworkConnectionError(void *a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

void partial apply for closure #1 in closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(uint64_t a1)
{
  closure #1 in closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(a1, *(void *)(v1 + 16), (void *)(v1 + 24));
}

uint64_t sub_25D77AF10()
{
  return OUTLINED_FUNCTION_13_10(MEMORY[0x263F8EEB0]);
}

void partial apply for closure #2 in closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(uint64_t a1)
{
  closure #2 in closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_25D77AF34()
{
  outlined consume of Data._Representation(v0[2], v0[3]);
  if (v0[4]) {
    swift_release();
  }
  uint64_t v1 = OUTLINED_FUNCTION_45_3();

  return MEMORY[0x270FA0238](v1, v2, v3);
}

void partial apply for closure #1 in BackgroundConnection.tryToWriteBufferedOutputData(with:)(void *a1, char a2)
{
  closure #1 in BackgroundConnection.tryToWriteBufferedOutputData(with:)(a1, a2 & 1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void (**)(void *))(v2 + 32));
}

void outlined consume of Result<(), Error>(id a1, char a2)
{
  if (a2) {
}
  }

uint64_t sub_25D77AF90()
{
  return objectdestroy_153Tm(MEMORY[0x263F8EEB0]);
}

uint64_t sub_25D77AFA8()
{
  return objectdestroy_153Tm(MEMORY[0x263F8EEB0]);
}

uint64_t objectdestroy_153Tm(void (*a1)(void))
{
  swift_release();
  swift_unknownObjectRelease();
  a1(*(void *)(v1 + 40));
  uint64_t v3 = OUTLINED_FUNCTION_45_3();

  return MEMORY[0x270FA0238](v3, v4, v5);
}

void partial apply for closure #1 in Connection.didEncounterIntermediateError(_:error:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  closure #1 in Connection.didEncounterIntermediateError(_:error:)(v32[2], v32[3], v32[4], v32[5], a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t sub_25D77B01C()
{
  OUTLINED_FUNCTION_119_0();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ConnectionAnalysisInfo?);
  OUTLINED_FUNCTION_19_3(v1);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();

  uint64_t v4 = type metadata accessor for ConnectionAnalysisInfo();
  if (!__swift_getEnumTagSinglePayload(v0 + v3, 1, v4))
  {
    uint64_t v5 = type metadata accessor for URL();
    if (!__swift_getEnumTagSinglePayload(v0 + v3, 1, v5)) {
      (*(void (**)(unint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
    }
    swift_bridgeObjectRelease();
  }
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_85_2();
  return MEMORY[0x270FA0238](v6, v7, v8);
}

void partial apply for closure #1 in Connection.didEncounterError(_:error:analysisInfo:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ConnectionAnalysisInfo?);
  OUTLINED_FUNCTION_19_3(v0);

  closure #1 in Connection.didEncounterError(_:error:analysisInfo:)();
}

uint64_t sub_25D77B1DC()
{
  return OUTLINED_FUNCTION_13_10(MEMORY[0x263F8EED8]);
}

uint64_t partial apply for closure #1 in Connection.didClose(_:)()
{
  return closure #1 in Connection.didClose(_:)(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25D77B1FC()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in BackgroundConnection.sendCommands(_:with:)(uint64_t result)
{
  uint64_t v2 = *(uint64_t (**)(void, uint64_t))(v1 + 16);
  if (v2) {
    return v2(*(void *)(v1 + 32), result);
  }
  return result;
}

unint64_t type metadata accessor for OS_dispatch_data()
{
  unint64_t result = lazy cache variable for type metadata for OS_dispatch_data;
  if (!lazy cache variable for type metadata for OS_dispatch_data)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_data);
  }
  return result;
}

uint64_t sub_25D77B2B8()
{
  swift_unknownObjectRelease();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void partial apply for closure #1 in BackgroundConnection.sendCommand(_:moreComing:with:)(void *a1)
{
  closure #1 in BackgroundConnection.sendCommand(_:moreComing:with:)(a1, *(void *)(v1 + 16), *(void (**)(void *))(v1 + 24));
}

uint64_t sub_25D77B30C()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

void partial apply for closure #1 in Connection.didOpenConnectionType(_:type:routeId:delay:)()
{
  closure #1 in Connection.didOpenConnectionType(_:type:routeId:delay:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(double *)(v0 + 56));
}

void partial apply for closure #1 in BackgroundConnection.startSecondaryConnection()(uint64_t a1)
{
}

uint64_t sub_25D77B370()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t outlined assign with take of CommunicationProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CommunicationProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D77B474()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 440))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (*(void *)(v0 + 456) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return MEMORY[0x270FA0238](v0, 584, 7);
}

void partial apply for specialized closure #2 in BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(uint64_t a1)
{
  specialized closure #2 in BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(a1, v1[2], v1[3], v1[4], v1[5], (uint64_t)(v1 + 6), v1[71], v1[72]);
}

uint64_t sub_25D77B56C()
{
  return objectdestroy_142Tm(MEMORY[0x263F8EEE8], 41);
}

void partial apply for closure #1 in Connection.willStartConnection(_:type:)()
{
  closure #1 in Connection.willStartConnection(_:type:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
}

uint64_t objectdestroy_165Tm()
{
  swift_release();
  outlined consume of NetworkConnectionError(*(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void **)(v0 + 56));

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t partial apply for closure #1 in closure #2 in BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(uint64_t a1)
{
  return closure #1 in closure #2 in BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(a1, *(void *)(v1 + 16), (void *)(v1 + 24));
}

uint64_t sub_25D77B5F4()
{
  return OUTLINED_FUNCTION_13_10(MEMORY[0x263F8EEB0]);
}

uint64_t objectdestroy_142Tm(void (*a1)(void), uint64_t a2)
{
  swift_release();
  a1(*(void *)(v2 + 24));

  return MEMORY[0x270FA0238](v2, a2, 7);
}

uint64_t partial apply for closure #1 in closure #1 in BackgroundConnection.connectionProvider(_:received:)(uint64_t a1)
{
  return closure #1 in closure #1 in BackgroundConnection.connectionProvider(_:received:)(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t objectdestroy_146Tm()
{
  swift_release();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_45_3();

  return MEMORY[0x270FA0238](v0, v1, v2);
}

uint64_t partial apply for specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)()
{
  return specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(*(void *)(v0 + 16), (SiriNetwork::ConnectionMethod)*(unsigned char *)(v0 + 24), *(unsigned char *)(v0 + 25), *(void (**)(long long *))(v0 + 32));
}

uint64_t sub_25D77B6C0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed ConnectionMetrics?) -> ()(uint64_t a1)
{
  return thunk for @escaping @callee_guaranteed (@in_guaranteed ConnectionMetrics?) -> ()(a1);
}

uint64_t outlined destroy of CommunicationProtocol?(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_0_7();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

__n128 OUTLINED_FUNCTION_1_34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,unint64_t a34,int a35,char a36,unint64_t a37,int a38,char a39,unint64_t a40,char a41,int a42,unint64_t a43,unint64_t a44,int a45,char a46,unint64_t a47,int a48,char a49,unint64_t a50,int a51,char a52,unint64_t a53,unint64_t a54,__n128 a55,long long a56)
{
  *(_OWORD *)(v57 + 1280) = a56;
  __n128 result = a55;
  *(__n128 *)(v57 + 1296) = a55;
  STACK[0xD80] = a54;
  STACK[0xD88] = a53;
  *__n128 v56 = a52;
  STACK[0xD98] = a50;
  v56[16] = a49;
  STACK[0xDA8] = a47;
  v56[32] = a46;
  STACK[0xDB8] = a44;
  STACK[0xDC0] = a43;
  LODWORD(STACK[0xDC8]) = a42;
  v56[60] = a41;
  STACK[0xDD0] = a40;
  v56[72] = a39;
  STACK[0xDE0] = a37;
  v56[88] = a36;
  STACK[0xDF0] = a34;
  v56[104] = v58;
  return result;
}

__n128 OUTLINED_FUNCTION_2_27()
{
  return *(__n128 *)&STACK[0x15D8];
}

void OUTLINED_FUNCTION_3_27()
{
  *(void *)(v0 + 16) = *(void *)(v1 + 16);
}

uint64_t OUTLINED_FUNCTION_4_21()
{
  return v0 + 56;
}

uint64_t OUTLINED_FUNCTION_11_8()
{
  return 0x6B726F7774656ELL;
}

uint64_t OUTLINED_FUNCTION_12_10()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_13_10(void (*a1)(void))
{
  return objectdestroy_142Tm(a1, 32);
}

void OUTLINED_FUNCTION_15_6()
{
  outlined consume of NetworkConnectionError(v4, v3, v2, v0, v1);
}

void OUTLINED_FUNCTION_16_8(unint64_t a1@<X8>)
{
  *(void *)(v3 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << a1;
  *(void *)(*(void *)(v1 + 48) + 8 * a1) = v2;
  ++*(void *)(v1 + 16);
}

BOOL OUTLINED_FUNCTION_18_4(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_20_5()
{
  return 7368560;
}

uint64_t OUTLINED_FUNCTION_21_5()
{
  return 1919247728;
}

uint64_t OUTLINED_FUNCTION_22_3()
{
  return outlined consume of Data?(v1, v0);
}

uint64_t OUTLINED_FUNCTION_25_4()
{
  return swift_release_n();
}

void OUTLINED_FUNCTION_26_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_27_5()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_28_5()
{
  return swift_unknownObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_32_4(float a1)
{
  *uint64_t v1 = a1;
  LODWORD(STACK[0x278]) = v2 & 1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_33_6(unint64_t a1)
{
  STACK[0x278] = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_35_3()
{
  return 0;
}

void OUTLINED_FUNCTION_36_4(__n128 a1, uint64_t a2, uint64_t a3)
{
  *(__n128 *)(a3 + 24) = a1;
}

_WORD *OUTLINED_FUNCTION_39_2(_WORD *result)
{
  *__n128 result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_40_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_43_2()
{
  return v0;
}

void OUTLINED_FUNCTION_44_2(__n128 a1)
{
  *(__n128 *)&STACK[0x290] = a1;
}

uint64_t OUTLINED_FUNCTION_45_3()
{
  return v0;
}

double OUTLINED_FUNCTION_46_1()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_47_2(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_48_2()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_49_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_50_1()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_51_2()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void *OUTLINED_FUNCTION_54_3(void *a1)
{
  return memcpy(a1, v1, 0x204uLL);
}

uint64_t OUTLINED_FUNCTION_56_2()
{
  return Hasher.init(_seed:)();
}

uint64_t OUTLINED_FUNCTION_57_2()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_58_3(void *a1@<X1>, uint64_t a2@<X8>)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = a2;
}

uint64_t OUTLINED_FUNCTION_60_3(unint64_t a1)
{
  STACK[0x278] = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

__n128 OUTLINED_FUNCTION_61_2(float a1)
{
  *uint64_t v2 = a1;
  return *(__n128 *)v1;
}

uint64_t OUTLINED_FUNCTION_63_0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_64_1()
{
  return swift_release_n();
}

void *OUTLINED_FUNCTION_65_2@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 112) = a2;
  uint64_t v4 = (const void *)(a1 + 40);
  return memcpy(&STACK[0x278], v4, 0x204uLL);
}

unint64_t *OUTLINED_FUNCTION_67_2()
{
  return &STACK[0x1668];
}

uint64_t OUTLINED_FUNCTION_68_2()
{
  return swift_unknownObjectRetain();
}

void OUTLINED_FUNCTION_73_2(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_76_2(unint64_t a1)
{
  STACK[0x698] = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_77_2(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_unknownObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_82_1(uint64_t a1, ...)
{
  va_start(va1, a1);
  va_start(va, a1);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  return outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)va1, (uint64_t)va);
}

void OUTLINED_FUNCTION_83_2()
{
  BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(v0, (v1 & 1) == 0);
}

uint64_t OUTLINED_FUNCTION_84_2()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t OUTLINED_FUNCTION_87_2()
{
  return 0x6566617320746F4ELL;
}

uint64_t OUTLINED_FUNCTION_88_2()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_89_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_90_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_91_1()
{
  return static _SetStorage.copy(original:)();
}

id OUTLINED_FUNCTION_92_2(uint64_t a1, void *a2)
{
  *a2 = v6;
  a2[1] = v5;
  a2[2] = v4;
  a2[3] = v2;
  a2[4] = v3;
  return v6;
}

uint64_t OUTLINED_FUNCTION_94_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_95_2()
{
  return swift_arrayDestroy();
}

void *OUTLINED_FUNCTION_98_2@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return memmove(a1, v2, 8 * a2);
}

uint64_t OUTLINED_FUNCTION_99_1()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void OUTLINED_FUNCTION_101_1(uint64_t a1, void *a2)
{
  a2[1] = 0;
  a2[2] = 0;
  *a2 = v2;
}

uint64_t OUTLINED_FUNCTION_103_2()
{
  *(_WORD *)(v0 + 22) = 1024;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_105_1(uint64_t a1)
{
  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, v1, (uint64_t *)&STACK[0xA60]);
}

uint64_t OUTLINED_FUNCTION_106_1@<X0>(uint64_t a1@<X8>)
{
  return specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(a1 + 63) >> 6, v1);
}

void OUTLINED_FUNCTION_108_1(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, os_log_t log)
{
  _os_log_impl(a1, log, v9, a4, v10, 2u);
}

uint64_t OUTLINED_FUNCTION_111_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_112_0()
{
  outlined consume of Data?(v4, v3);
  outlined consume of Data?(v2, v1);
  return v0;
}

void *OUTLINED_FUNCTION_113_0(void *a1)
{
  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

uint64_t OUTLINED_FUNCTION_114_0()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_116_0()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_118_0(uint64_t a1)
{
  *(void *)(v1 - 88) = a1;
  return v1 - 88;
}

void OUTLINED_FUNCTION_120_0()
{
  STACK[0x288] = 0;
  STACK[0x278] = 9;
  STACK[0x280] = 0;
}

uint64_t OUTLINED_FUNCTION_121_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_122_0()
{
  *uint64_t v0 = *(void *)(*(void *)(*(void *)v1 + 48) + 8 * v2);
  return swift_retain();
}

void OUTLINED_FUNCTION_123_0()
{
  *uint64_t v0 = 0x8000000000000000;
}

__n128 OUTLINED_FUNCTION_125_0@<Q0>(__n128 *a1@<X8>)
{
  return a1[5];
}

__n128 OUTLINED_FUNCTION_126_0@<Q0>(__n128 *a1@<X8>)
{
  return a1[3];
}

__n128 OUTLINED_FUNCTION_128_0@<Q0>(__n128 *a1@<X8>)
{
  return a1[1];
}

uint64_t OUTLINED_FUNCTION_130_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return outlined init with copy of NetworkConnectionProtocol?(v3, (uint64_t)&STACK[0x278], a3);
}

double OUTLINED_FUNCTION_131_0()
{
  return v1 - *(double *)(v0 + 1192);
}

uint64_t OUTLINED_FUNCTION_132()
{
  return swift_unknownObjectRetain();
}

id OUTLINED_FUNCTION_133(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, float a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17)
{
  *uint64_t v17 = a9;
  return a17;
}

uint64_t OUTLINED_FUNCTION_135()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_136()
{
  return swift_release();
}

unint64_t *OUTLINED_FUNCTION_138()
{
  return &STACK[0x278];
}

void OUTLINED_FUNCTION_139(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_140(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_141(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_144()
{
  *(_WORD *)(v0 + 12) = 2112;
}

uint64_t OUTLINED_FUNCTION_145@<X0>(uint64_t a1@<X8>)
{
  *(void *)(*(void *)(v1 + 48) + 8 * a1) = *(void *)(*(void *)(v2 + 48) + 8 * a1);
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_146()
{
  return Hasher.init(_seed:)();
}

id RATInterface.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RATInterface();
  return objc_msgSendSuper2(&v2, sel_init);
}

id RATInterface.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RATInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id protocol witness for RATManagerProtocol.registerClient(_:queue:) in conformance WRM_iRATInterface(uint64_t a1, uint64_t a2)
{
  return @nonobjc WRM_iRATInterface.registerClient(_:queue:)(a1, a2);
}

id @nonobjc WRM_iRATInterface.registerClient(_:queue:)(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(v2, sel_registerClient_queue_, a1, a2);
}

id protocol witness for RATManagerProtocol.unregisterClient() in conformance WRM_iRATInterface()
{
  return @nonobjc WRM_iRATInterface.unregisterClient()();
}

id @nonobjc WRM_iRATInterface.unregisterClient()()
{
  return objc_msgSend(v0, sel_unregisterClient);
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed [WRM_iRATProximityRecommendation]?) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
  {
    type metadata accessor for CTServiceDescriptor(0, &lazy cache variable for type metadata for WRM_iRATProximityRecommendation);
    uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  v3(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

void protocol witness for RATManagerProtocol.subscribeStandaloneLinkRecommendation(_:) in conformance WRM_iRATInterface(uint64_t a1, uint64_t a2)
{
}

void @nonobjc WRM_iRATInterface.subscribeStandaloneLinkRecommendation(_:)(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    v4[4] = a1;
    v4[5] = a2;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 1107296256;
    v4[2] = thunk for @escaping @callee_guaranteed (@unowned WRMApplicationType, @unowned WRMLinkType, @guaranteed NSValue?) -> ();
    void v4[3] = &block_descriptor_91_0;
    uint64_t v3 = _Block_copy(v4);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v3 = 0;
  }
  objc_msgSend(v2, sel_subscribeStandaloneLinkRecommendation_, v3);
  _Block_release(v3);
}

void thunk for @escaping @callee_guaranteed (@unowned WRMApplicationType, @unowned WRMLinkType, @guaranteed NSValue?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  swift_retain();
  id v8 = a4;
  v7(a2, a3, a4);
  swift_release();
}

void protocol witness for RATManagerProtocol.getProximityLinkRecommendation(_:recommendation:) in conformance WRM_iRATInterface(char a1, uint64_t a2, uint64_t a3)
{
}

void @nonobjc WRM_iRATInterface.getProximityLinkRecommendation(_:recommendation:)(char a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    v6[4] = a2;
    void v6[5] = a3;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 1107296256;
    v6[2] = thunk for @escaping @callee_guaranteed (@guaranteed [WRM_iRATProximityRecommendation]?) -> ();
    v6[3] = &block_descriptor_88;
    os_log_type_t v5 = _Block_copy(v6);
    swift_retain();
    swift_release();
  }
  else
  {
    os_log_type_t v5 = 0;
  }
  objc_msgSend(v3, sel_getProximityLinkRecommendation_recommendation_, a1 & 1, v5);
  _Block_release(v5);
}

void protocol witness for RATManagerProtocol.getLinkRecommendationMetrics(_:) in conformance WRM_iRATInterface(uint64_t a1, uint64_t a2)
{
}

uint64_t dispatch thunk of RATManagerProtocol.registerClient(_:queue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of RATManagerProtocol.unregisterClient()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RATManagerProtocol.subscribeProximityLinkRecommendation(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of RATManagerProtocol.subscribeStandaloneLinkRecommendation(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of RATManagerProtocol.getProximityLinkRecommendation(_:recommendation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t dispatch thunk of RATManagerProtocol.getLinkRecommendationMetrics(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t type metadata accessor for RATInterface()
{
  return self;
}

void @nonobjc WRM_iRATInterface.getLinkRecommendationMetrics(_:)(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    v4[4] = a1;
    v4[5] = a2;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 1107296256;
    v4[2] = thunk for @escaping @callee_guaranteed (@guaranteed AceObject?) -> ();
    void v4[3] = &block_descriptor_85;
    uint64_t v3 = _Block_copy(v4);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v3 = 0;
  }
  objc_msgSend(v2, sel_getLinkRecommendationMetrics_, v3);
  _Block_release(v3);
}

void NetworkWirelessCoexManager.init(queue:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v7 = v2;
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_12_11();
  type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_27_1();
  type metadata accessor for DispatchQoS();
  MEMORY[0x270FA5388]();
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  *(void *)(v0 + 56) = 2;
  type metadata accessor for CTServiceDescriptor(0, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 128) = 0u;
  *(_OWORD *)(v0 + 144) = 0u;
  *(void *)(v0 + 160) = 0;
  static DispatchQoS.userInteractive.getter();
  _s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWlTm_2((unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v1, *MEMORY[0x263F8F130], v6);
  *(void *)(v0 + 176) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)(v0 + 184) = 0x4014000000000000;
  *(void *)(v0 + 168) = v7;
  id v5 = v7;
  NetworkWirelessCoexManager.resetLinkRecommendationInfo()();

  OUTLINED_FUNCTION_29();
}

uint64_t NetworkWirelessCoexManager.deinit()
{
  NetworkWirelessCoexManager.unregisterClient()();
  outlined destroy of RATManagerProtocol?(v0 + 16);

  return v0;
}

uint64_t NetworkWirelessCoexManager.__deallocating_deinit()
{
  NetworkWirelessCoexManager.deinit();

  return MEMORY[0x270FA0228](v0, 192, 7);
}

uint64_t type metadata accessor for NetworkWirelessCoexManager()
{
  return self;
}

Swift::Void __swiftcall NetworkWirelessCoexManager.registerClient()()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  OUTLINED_FUNCTION_0_0();
  uint64_t v12 = v4;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_12_11();
  uint64_t v11 = type metadata accessor for DispatchQoS();
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_27_1();
  uint64_t v7 = *(void **)(v0 + 168);
  uint64_t v8 = OUTLINED_FUNCTION_23_2();
  swift_weakInit();
  v13[4] = partial apply for closure #1 in NetworkWirelessCoexManager.registerClient();
  v13[5] = v8;
  v13[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_126(COERCE_DOUBLE(1107296256));
  v13[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v13[3] = &block_descriptor_82_0;
  os_log_type_t v9 = _Block_copy(v13);
  id v10 = v7;
  swift_retain();
  static DispatchQoS.unspecified.getter();
  _s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWlTm_2((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x2611B24E0](0, v2, v1, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v11);
  swift_release();
  swift_release();
  NetworkWirelessCoexManager.resetLinkRecommendationInfo()();
  NetworkWirelessCoexManager.subscribeLinkRecommendation()();
  OUTLINED_FUNCTION_29();
}

uint64_t closure #1 in NetworkWirelessCoexManager.registerClient()()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = result + 16;
    swift_beginAccess();
    outlined init with copy of RATManagerProtocol?(v2, (uint64_t)v14);
    uint64_t v3 = v15;
    outlined destroy of RATManagerProtocol?((uint64_t)v14);
    if (v3)
    {
      outlined init with copy of RATManagerProtocol?(v2, (uint64_t)v14);
    }
    else
    {
      uint64_t v4 = (objc_class *)type metadata accessor for RATInterface();
      id v5 = objc_msgSend(objc_allocWithZone(v4), sel_init);
      uint64_t v15 = v4;
      uint64_t v16 = &protocol witness table for WRM_iRATInterface;
      v14[0] = v5;
    }
    outlined init with take of RATManagerProtocol?((uint64_t)v14, (uint64_t)v11);
    swift_beginAccess();
    outlined assign with take of RATManagerProtocol?((uint64_t)v11, v2);
    swift_endAccess();
    outlined init with copy of RATManagerProtocol?(v2, (uint64_t)v14);
    if (v15)
    {
      outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v14, (uint64_t)v11);
      outlined destroy of RATManagerProtocol?((uint64_t)v14);
      uint64_t v6 = v12;
      uint64_t v7 = v13;
      __swift_project_boxed_opaque_existential_1(v11, v12);
      uint64_t v8 = *(void **)(v1 + 168);
      os_log_type_t v9 = *(void (**)(uint64_t, void *, uint64_t, uint64_t))(v7 + 8);
      id v10 = v8;
      v9(22, v8, v6, v7);

      swift_release();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
    }
    else
    {
      swift_release();
      return outlined destroy of RATManagerProtocol?((uint64_t)v14);
    }
  }
  return result;
}

Swift::Void __swiftcall NetworkWirelessCoexManager.unregisterClient()()
{
}

uint64_t closure #1 in NetworkWirelessCoexManager.unregisterClient()()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong + 16;
    swift_beginAccess();
    outlined init with copy of RATManagerProtocol?(v1, (uint64_t)&v9);
    swift_release();
    if (*((void *)&v10 + 1))
    {
      outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)&v9, (uint64_t)v6);
      outlined destroy of RATManagerProtocol?((uint64_t)&v9);
      uint64_t v2 = v7;
      uint64_t v3 = v8;
      __swift_project_boxed_opaque_existential_1(v6, v7);
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v2, v3);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
    }
    else
    {
      outlined destroy of RATManagerProtocol?((uint64_t)&v9);
    }
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v5 = result + 16;
    uint64_t v11 = 0;
    long long v9 = 0u;
    long long v10 = 0u;
    swift_beginAccess();
    outlined assign with take of RATManagerProtocol?((uint64_t)&v9, v5);
    swift_endAccess();
    return swift_release();
  }
  return result;
}

Swift::Void __swiftcall NetworkWirelessCoexManager.resetLinkRecommendationInfo()()
{
}

void NetworkWirelessCoexManager.unregisterClient()()
{
  OUTLINED_FUNCTION_22();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  type metadata accessor for DispatchWorkItemFlags();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  uint64_t v7 = *(void **)(v0 + 168);
  uint64_t v8 = OUTLINED_FUNCTION_23_2();
  swift_weakInit();
  v15[4] = v6;
  v15[5] = v8;
  v15[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_126(COERCE_DOUBLE(1107296256));
  void v15[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v15[3] = v4;
  long long v9 = _Block_copy(v15);
  id v10 = v7;
  swift_retain();
  static DispatchQoS.unspecified.getter();
  _s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWlTm_2((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x2611B24E0](0, v2, v1, v9);
  _Block_release(v9);

  uint64_t v11 = OUTLINED_FUNCTION_4_0();
  v12(v11);
  uint64_t v13 = OUTLINED_FUNCTION_10();
  v14(v13);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_29();
}

uint64_t closure #1 in NetworkWirelessCoexManager.resetLinkRecommendationInfo()()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    swift_beginAccess();
    *(void *)(v1 + 56) = 256;
    *(_OWORD *)(v1 + 64) = 0u;
    *(_OWORD *)(v1 + 80) = 0u;
    *(_OWORD *)(v1 + 96) = 0u;
    *(_OWORD *)(v1 + 112) = 0u;
    *(_OWORD *)(v1 + 128) = 0u;
    *(_OWORD *)(v1 + 144) = 0u;
    *(void *)(v1 + 160) = 0;
    return swift_release();
  }
  return result;
}

void NetworkWirelessCoexManager.subscribeLinkRecommendation()()
{
}

uint64_t closure #1 in NetworkWirelessCoexManager.subscribeLinkRecommendation()()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result + 16;
    swift_beginAccess();
    outlined init with copy of RATManagerProtocol?(v1, (uint64_t)v9);
    swift_release();
    if (v10)
    {
      outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v9, (uint64_t)v6);
      outlined destroy of RATManagerProtocol?((uint64_t)v9);
      uint64_t v2 = v7;
      uint64_t v3 = v8;
      __swift_project_boxed_opaque_existential_1(v6, v7);
      uint64_t v4 = swift_allocObject();
      swift_beginAccess();
      swift_weakLoadStrong();
      swift_weakInit();
      swift_release();
      uint64_t v5 = *(void (**)(uint64_t (*)(int, int, void *), uint64_t, uint64_t, uint64_t))(v3 + 32);
      swift_retain();
      v5(partial apply for closure #1 in closure #1 in NetworkWirelessCoexManager.subscribeLinkRecommendation(), v4, v2, v3);
      swift_release_n();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
    }
    else
    {
      return outlined destroy of RATManagerProtocol?((uint64_t)v9);
    }
  }
  return result;
}

uint64_t closure #1 in closure #1 in NetworkWirelessCoexManager.subscribeLinkRecommendation()(int a1, int a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Logger.siriNetwork);
  id v7 = a3;
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v30 = (void *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    v32[0] = v31;
    *(_DWORD *)uint64_t v10 = 136315650;
    LODWORD(v33) = a1;
    type metadata accessor for WRMApplicationType(0);
    uint64_t v11 = String.init<A>(describing:)();
    uint64_t v33 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    LODWORD(v33) = a2;
    type metadata accessor for WRMLinkType(0);
    uint64_t v13 = String.init<A>(describing:)();
    uint64_t v33 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 22) = 2112;
    if (a3)
    {
      uint64_t v33 = (uint64_t)v7;
      id v15 = v7;
    }
    else
    {
      uint64_t v33 = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v30 = a3;

    _os_log_impl(&dword_25D6CC000, v8, v9, "Received an asynchronous recommendation type %s, linkType %s, value %@", (uint8_t *)v10, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x2611B3750](v30, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2611B3750](v31, -1, -1);
    MEMORY[0x2611B3750](v10, -1, -1);
  }
  else
  {
  }
  swift_beginAccess();
  if (!swift_weakLoadStrong()) {
    goto LABEL_22;
  }
  if (a1 != 1)
  {
    swift_release();
LABEL_22:
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (!result) {
      return result;
    }
    NetworkWirelessCoexManager.resetLinkRecommendationInfo()();
    return swift_release();
  }
  uint64_t v17 = NetworkConnectionProvider.connectionMetrics.modify();
  if (*v16 != 2) {
    *uint64_t v16 = 0;
  }
  ((void (*)(uint64_t *, void))v17)(v32, 0);
  id v19 = NetworkConnectionProvider.connectionMetrics.modify();
  if (*v18 != 2) {
    v18[1] = 1;
  }
  ((void (*)(uint64_t *, void))v19)(v32, 0);
  if (!a2)
  {
    unint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v26, v27))
    {
      unint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v28 = 0;
      _os_log_impl(&dword_25D6CC000, v26, v27, "NetworkWirelessCoexManager: Standalone linkRecommendationInfo wifiPreference false", v28, 2u);
      MEMORY[0x2611B3750](v28, -1, -1);
    }

    uint64_t v24 = NetworkConnectionProvider.connectionMetrics.modify();
    if (*v29 != 2) {
      v29[1] = 0;
    }
    goto LABEL_28;
  }
  if (a2 == 1)
  {
    id v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_25D6CC000, v20, v21, "NetworkWirelessCoexManager: Standalone linkRecommendationInfo wifiPreference true", v22, 2u);
      MEMORY[0x2611B3750](v22, -1, -1);
    }

    uint64_t v24 = NetworkConnectionProvider.connectionMetrics.modify();
    if (*v23 != 2) {
      v23[1] = 1;
    }
LABEL_28:
    ((void (*)(uint64_t *, void))v24)(v32, 0);
  }
  return swift_release();
}

void NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  char v7 = v6;
  type metadata accessor for DispatchWorkItemFlags();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2();
  uint64_t v10 = *(void **)(v1 + 176);
  uint64_t v11 = OUTLINED_FUNCTION_23_2();
  swift_weakInit();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v5;
  *(void *)(v12 + 32) = v3;
  *(unsigned char *)(v12 + 40) = v7;
  void v19[4] = partial apply for closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:);
  v19[5] = v12;
  v19[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_126(COERCE_DOUBLE(1107296256));
  v19[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  void v19[3] = &block_descriptor_48;
  uint64_t v13 = _Block_copy(v19);
  id v14 = v10;
  swift_retain();
  outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?(v5);
  static DispatchQoS.unspecified.getter();
  _s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWlTm_2((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  OUTLINED_FUNCTION_10_13();
  OUTLINED_FUNCTION_5();
  _Block_release(v13);

  uint64_t v15 = OUTLINED_FUNCTION_4_0();
  v16(v15);
  uint64_t v17 = OUTLINED_FUNCTION_10();
  v18(v17);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_29();
}

uint64_t closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v67 = a4;
  uint64_t v68 = a2;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v69 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DispatchTime();
  uint64_t v66 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  long long v64 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  long long v65 = (char *)&v53 - v16;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    NetworkWirelessCoexManager.resetLinkRecommendationInfo()();
    swift_release();
  }
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v18 = Strong;
    uint64_t v62 = v13;
    uint64_t v19 = Strong + 16;
    swift_beginAccess();
    outlined init with copy of RATManagerProtocol?(v19, (uint64_t)&aBlock);
    if (v77)
    {
      uint64_t v63 = v18;
      uint64_t v54 = a3;
      uint64_t v55 = a1;
      __n128 v56 = v12;
      outlined init with take of RPCOspreyConnectionProtocol(&aBlock, (uint64_t)v72);
      uint64_t v20 = swift_allocObject();
      os_log_type_t v21 = dispatch_group_create();
      uint64_t v22 = v10;
      *(void *)(v20 + 16) = v21;
      uint64_t v60 = (id *)(v20 + 16);
      dispatch_group_enter(v21);
      uint64_t v23 = v74;
      uint64_t v59 = v73;
      uint64_t v58 = v6;
      __swift_project_boxed_opaque_existential_1(v72, v73);
      uint64_t v24 = swift_allocObject();
      uint64_t v57 = v9;
      swift_beginAccess();
      swift_weakLoadStrong();
      swift_weakInit();
      swift_release();
      uint64_t v25 = swift_allocObject();
      *(void *)(v25 + 16) = v24;
      *(void *)(v25 + 24) = v20;
      unint64_t v26 = v8;
      uint64_t v27 = v22;
      unint64_t v28 = *(void (**)(void, void (*)(unint64_t), uint64_t, uint64_t, uint64_t))(v23 + 40);
      swift_retain();
      uint64_t v61 = v20;
      swift_retain();
      v28(v67 & 1, partial apply for closure #2 in closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:), v25, v59, v23);
      swift_release();
      uint64_t v29 = v69;
      swift_release();
      uint64_t v30 = v60;
      swift_beginAccess();
      if (*v30)
      {
        id v31 = *v30;
        id v32 = v64;
        static DispatchTime.now()();
        uint64_t v33 = v65;
        MEMORY[0x2611B2190](v32, *(double *)(v63 + 184));
        uint64_t v34 = *(void (**)(char *, uint64_t))(v66 + 8);
        uint64_t v35 = v62;
        v34(v32, v62);
        MEMORY[0x2611B2480](v33);

        v34(v33, v35);
        if (static DispatchTimeoutResult.== infix(_:_:)())
        {
          if (one-time initialization token for siriNetwork != -1) {
            swift_once();
          }
          uint64_t v36 = type metadata accessor for Logger();
          __swift_project_value_buffer(v36, (uint64_t)static Logger.siriNetwork);
          id v37 = Logger.logObject.getter();
          os_log_type_t v38 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v37, v38))
          {
            uint64_t v39 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v39 = 0;
            _os_log_impl(&dword_25D6CC000, v37, v38, "NetworkWirelessCoexManager: getProximityLinkRecommendation timedout", v39, 2u);
            MEMORY[0x2611B3750](v39, -1, -1);
          }
        }
      }
      swift_beginAccess();
      uint64_t v40 = swift_weakLoadStrong();
      if (v40)
      {
        id v41 = *(id *)(v40 + 168);
        swift_release();
        unint64_t v42 = (void *)swift_allocObject();
        uint64_t v43 = v68;
        uint64_t v44 = v54;
        v42[2] = v68;
        v42[3] = v44;
        v42[4] = v55;
        uint64_t v78 = partial apply for closure #4 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:);
        long long v79 = v42;
        *(void *)&long long aBlock = MEMORY[0x263EF8330];
        *((void *)&aBlock + 1) = 1107296256;
        uint64_t v76 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
        long long v77 = &block_descriptor_65;
        uint64_t v45 = _Block_copy(&aBlock);
        outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?(v43);
        swift_retain();
        uint64_t v46 = v56;
        static DispatchQoS.unspecified.getter();
        uint64_t v70 = MEMORY[0x263F8EE78];
        _s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWlTm_2((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        uint64_t v47 = v58;
        dispatch thunk of SetAlgebra.init<A>(_:)();
        MEMORY[0x2611B24E0](0, v46, v26, v45);
        _Block_release(v45);
        swift_release();

        (*(void (**)(char *, uint64_t))(v29 + 8))(v26, v47);
        (*(void (**)(char *, uint64_t))(v27 + 8))(v46, v57);
      }
      swift_release();
      swift_release();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v72);
    }
    swift_release();
    outlined destroy of RATManagerProtocol?((uint64_t)&aBlock);
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    id v49 = *(id *)(result + 168);
    swift_release();
    char v50 = (void *)swift_allocObject();
    uint64_t v51 = v68;
    v50[2] = v68;
    v50[3] = a3;
    v50[4] = a1;
    uint64_t v78 = partial apply for closure #4 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:);
    long long v79 = v50;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v76 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    long long v77 = &block_descriptor_54_0;
    uint64_t v52 = _Block_copy(&aBlock);
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?(v51);
    swift_retain();
    static DispatchQoS.unspecified.getter();
    uint64_t v71 = MEMORY[0x263F8EE78];
    _s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWlTm_2((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x2611B24E0](0, v12, v8, v52);
    _Block_release(v52);

    (*(void (**)(char *, uint64_t))(v69 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return swift_release();
  }
  return result;
}

void closure #2 in closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (dispatch_group_t *)(a3 + 16);
  swift_beginAccess();
  if (!swift_weakLoadStrong())
  {
LABEL_34:
    swift_beginAccess();
    if (*v4) {
      dispatch_group_leave(*v4);
    }
    goto LABEL_40;
  }
  if (!a1)
  {
    swift_release();
    goto LABEL_34;
  }
  if (!(a1 >> 62))
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_37:
    swift_bridgeObjectRelease();
    swift_beginAccess();
    if (*v4)
    {
      uint64_t v27 = *v4;
      dispatch_group_leave(v27);
    }
    swift_release();
LABEL_40:
    swift_beginAccess();
    dispatch_group_t v28 = *v4;
    dispatch_group_t *v4 = 0;

    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
  if (!v5) {
    goto LABEL_37;
  }
LABEL_5:
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = &selRef_logNetworkConnectionStateReadySnapshotCaptured_;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x2611B2780](v6, a1);
      }
      else {
        id v8 = *(id *)(a1 + 8 * v6 + 32);
      }
      uint64_t v9 = v8;
      if (objc_msgSend(v8, sel_RecommendationType) == 2)
      {
        id v10 = [v9 v7[491]];
        if (v10)
        {
          uint64_t v11 = v10;
          id v12 = v10;
          NetworkWirelessCoexManager.updateMetricsFromProximityRecommendationLogging(_:)(v11);
        }
      }
      if (objc_msgSend(v9, sel_linkIsRecommended)
        && (objc_msgSend(v9, sel_linkRecommendationIsValid) & 1) != 0)
      {
        if (objc_msgSend(v9, sel_RecommendationType) == 1)
        {
          if (one-time initialization token for siriNetwork != -1) {
            swift_once();
          }
          uint64_t v13 = type metadata accessor for Logger();
          __swift_project_value_buffer(v13, (uint64_t)static Logger.siriNetwork);
          uint64_t v14 = Logger.logObject.getter();
          os_log_type_t v15 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v14, v15))
          {
            uint64_t v16 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v16 = 0;
            _os_log_impl(&dword_25D6CC000, v14, v15, "NetworkWirelessCoexManager: Get Proximity linkRecommendationInfo btPreference true", v16, 2u);
            uint64_t v17 = v16;
            uint64_t v7 = &selRef_logNetworkConnectionStateReadySnapshotCaptured_;
            MEMORY[0x2611B3750](v17, -1, -1);
          }

          uint64_t v19 = NetworkConnectionProvider.connectionMetrics.modify();
          if (*v18 != 2) {
            unsigned char *v18 = 1;
          }
          ((void (*)(unsigned char *, void))v19)(v29, 0);
        }
        if (objc_msgSend(v9, sel_RecommendationType) == 2)
        {
          if (one-time initialization token for siriNetwork != -1) {
            swift_once();
          }
          uint64_t v20 = type metadata accessor for Logger();
          __swift_project_value_buffer(v20, (uint64_t)static Logger.siriNetwork);
          os_log_type_t v21 = Logger.logObject.getter();
          os_log_type_t v22 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v21, v22))
          {
            uint64_t v23 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v23 = 0;
            _os_log_impl(&dword_25D6CC000, v21, v22, "NetworkWirelessCoexManager: Get Proximity linkRecommendationInfo wifiPreference true", v23, 2u);
            uint64_t v24 = v23;
            uint64_t v7 = &selRef_logNetworkConnectionStateReadySnapshotCaptured_;
            MEMORY[0x2611B3750](v24, -1, -1);
          }

          unint64_t v26 = NetworkConnectionProvider.connectionMetrics.modify();
          if (*v25 != 2) {
            v25[1] = 1;
          }
          ((void (*)(unsigned char *, void))v26)(v29, 0);
        }
      }
      ++v6;
    }
    while (v5 != v6);
    goto LABEL_37;
  }
  __break(1u);
}

void NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  type metadata accessor for DispatchWorkItemFlags();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2();
  id v8 = *(void **)(v1 + 176);
  uint64_t v9 = OUTLINED_FUNCTION_23_2();
  swift_weakInit();
  id v10 = (void *)swift_allocObject();
  _OWORD v10[2] = v9;
  v10[3] = v5;
  v10[4] = v3;
  v17[4] = partial apply for closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:);
  v17[5] = v10;
  v17[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_126(COERCE_DOUBLE(1107296256));
  v17[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v17[3] = &block_descriptor_17;
  uint64_t v11 = _Block_copy(v17);
  id v12 = v8;
  swift_retain();
  outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?(v5);
  static DispatchQoS.unspecified.getter();
  _s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWlTm_2((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  OUTLINED_FUNCTION_10_13();
  OUTLINED_FUNCTION_5();
  _Block_release(v11);

  uint64_t v13 = OUTLINED_FUNCTION_4_0();
  v14(v13);
  uint64_t v15 = OUTLINED_FUNCTION_10();
  v16(v15);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_29();
}

uint64_t closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v71 = a3;
  uint64_t v70 = a2;
  uint64_t v69 = (void *)type metadata accessor for DispatchTime();
  uint64_t v68 = *(v69 - 1);
  uint64_t v4 = MEMORY[0x270FA5388](v69);
  uint64_t v66 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  int v67 = (char *)&v60 - v6;
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v74 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchQoS();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1 + 2;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  uint64_t v16 = MEMORY[0x263F8EE78];
  uint64_t v72 = v10;
  uint64_t v73 = v11;
  if (Strong)
  {
    uint64_t v17 = v9;
    id v18 = *(id *)(Strong + 168);
    swift_release();
    uint64_t v83 = partial apply for closure #1 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:);
    uint64_t v84 = a1;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v81 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    long long v82 = &block_descriptor_22_0;
    uint64_t v19 = _Block_copy(&aBlock);
    swift_retain();
    static DispatchQoS.unspecified.getter();
    v77[0] = v16;
    _s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWlTm_2((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x2611B24E0](0, v13, v17, v19);
    uint64_t v20 = v19;
    uint64_t v21 = v73;
    _Block_release(v20);

    uint64_t v9 = v17;
    uint64_t v10 = v72;
    (*(void (**)(char *, uint64_t))(v74 + 8))(v9, v7);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v13, v10);
    swift_release();
  }
  swift_beginAccess();
  uint64_t v22 = swift_weakLoadStrong();
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = v22 + 16;
    swift_beginAccess();
    outlined init with copy of RATManagerProtocol?(v24, (uint64_t)&aBlock);
    if (v82)
    {
      uint64_t v65 = v23;
      uint64_t v60 = a1;
      uint64_t v61 = v13;
      outlined init with take of RPCOspreyConnectionProtocol(&aBlock, (uint64_t)v77);
      uint64_t v25 = v9;
      uint64_t v26 = swift_allocObject();
      uint64_t v27 = dispatch_group_create();
      *(void *)(v26 + 16) = v27;
      dispatch_group_enter(v27);
      uint64_t v28 = v79;
      uint64_t v62 = v78;
      __swift_project_boxed_opaque_existential_1(v77, v78);
      uint64_t v29 = swift_allocObject();
      swift_beginAccess();
      uint64_t v63 = v14;
      swift_weakLoadStrong();
      swift_weakInit();
      swift_release();
      uint64_t v30 = swift_allocObject();
      *(void *)(v30 + 16) = v29;
      *(void *)(v30 + 24) = v26;
      id v31 = *(void (**)(void (*)(void *), uint64_t, uint64_t, uint64_t))(v28 + 48);
      swift_retain();
      uint64_t v64 = v26;
      swift_retain();
      v31(partial apply for closure #3 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:), v30, v62, v28);
      uint64_t v32 = v7;
      uint64_t v33 = v74;
      swift_release();
      swift_release();
      swift_beginAccess();
      if (*(void *)(v26 + 16))
      {
        id v34 = *(id *)(v26 + 16);
        uint64_t v35 = v66;
        static DispatchTime.now()();
        uint64_t v36 = v67;
        MEMORY[0x2611B2190](v35, *(double *)(v65 + 184));
        id v37 = *(void (**)(char *, void *))(v68 + 8);
        os_log_type_t v38 = v69;
        v37(v35, v69);
        MEMORY[0x2611B2480](v36);

        v37(v36, v38);
        if (static DispatchTimeoutResult.== infix(_:_:)())
        {
          if (one-time initialization token for siriNetwork != -1) {
            swift_once();
          }
          uint64_t v39 = type metadata accessor for Logger();
          __swift_project_value_buffer(v39, (uint64_t)static Logger.siriNetwork);
          uint64_t v40 = Logger.logObject.getter();
          os_log_type_t v41 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v40, v41))
          {
            unint64_t v42 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)unint64_t v42 = 0;
            _os_log_impl(&dword_25D6CC000, v40, v41, "NetworkWirelessCoexManager: getLinkRecommendationMetrics timedout", v42, 2u);
            MEMORY[0x2611B3750](v42, -1, -1);
          }
        }
      }
      swift_beginAccess();
      uint64_t v43 = swift_weakLoadStrong();
      if (v43)
      {
        id v44 = *(id *)(v43 + 168);
        swift_release();
        uint64_t v45 = (void *)swift_allocObject();
        uint64_t v46 = v70;
        uint64_t v47 = v71;
        v45[2] = v70;
        v45[3] = v47;
        v45[4] = v60;
        uint64_t v83 = partial apply for closure #4 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:);
        uint64_t v84 = v45;
        *(void *)&long long aBlock = MEMORY[0x263EF8330];
        *((void *)&aBlock + 1) = 1107296256;
        uint64_t v81 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
        long long v82 = &block_descriptor_41;
        uint64_t v48 = _Block_copy(&aBlock);
        swift_retain();
        outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?(v46);
        id v49 = v61;
        static DispatchQoS.unspecified.getter();
        uint64_t v75 = MEMORY[0x263F8EE78];
        _s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWlTm_2((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        dispatch thunk of SetAlgebra.init<A>(_:)();
        MEMORY[0x2611B24E0](0, v49, v25, v48);
        _Block_release(v48);
        swift_release();

        (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v32);
        (*(void (**)(char *, uint64_t))(v73 + 8))(v49, v72);
      }
      swift_release();
      swift_release();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v77);
    }
    swift_release();
    outlined destroy of RATManagerProtocol?((uint64_t)&aBlock);
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v69 = *(id *)(result + 168);
    swift_release();
    uint64_t v51 = (void *)swift_allocObject();
    uint64_t v68 = v7;
    uint64_t v52 = v70;
    uint64_t v53 = v71;
    v51[2] = v70;
    void v51[3] = v53;
    v51[4] = a1;
    uint64_t v83 = partial apply for closure #2 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:);
    uint64_t v84 = v51;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v81 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    long long v82 = &block_descriptor_28_1;
    uint64_t v54 = _Block_copy(&aBlock);
    uint64_t v55 = v74;
    __n128 v56 = v54;
    swift_retain();
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?(v52);
    static DispatchQoS.unspecified.getter();
    uint64_t v76 = MEMORY[0x263F8EE78];
    _s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWlTm_2((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    uint64_t v57 = v73;
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    uint64_t v58 = v68;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    uint64_t v59 = v69;
    MEMORY[0x2611B24E0](0, v13, v9, v56);
    _Block_release(v56);

    (*(void (**)(char *, uint64_t))(v55 + 8))(v9, v58);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v13, v10);
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    NetworkWirelessCoexManager.updateMetricsFromProximityRecommendationLogging(_:)(0);
    return swift_release();
  }
  return result;
}

void closure #3 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (id *)(a3 + 16);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = Strong;
    if (a1)
    {
      id v7 = a1;
      NetworkWirelessCoexManager.updateMetricsFromProximityRecommendationLogging(_:)(a1);
      if (one-time initialization token for siriNetwork != -1) {
        swift_once();
      }
      uint64_t v8 = type metadata accessor for Logger();
      __swift_project_value_buffer(v8, (uint64_t)static Logger.siriNetwork);
      swift_retain_n();
      uint64_t v9 = Logger.logObject.getter();
      os_log_type_t v10 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v11 = (uint8_t *)swift_slowAlloc();
        uint64_t v12 = swift_slowAlloc();
        uint64_t v17 = v12;
        *(_DWORD *)uint64_t v11 = 136315138;
        swift_beginAccess();
        if (*(void *)(v6 + 56) == 2)
        {
          unint64_t v13 = 0xE100000000000000;
          uint64_t v14 = 45;
        }
        else
        {
          uint64_t v14 = String.init<A>(describing:)();
          unint64_t v13 = v15;
        }
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v13, &v17);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25D6CC000, v9, v10, "NetworkWirelessCoexManager: LinkRecommendationMetrics %s", v11, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2611B3750](v12, -1, -1);
        MEMORY[0x2611B3750](v11, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      swift_beginAccess();
      if (*v4)
      {
        uint64_t v16 = *v4;
        dispatch_group_leave(v16);
      }
      swift_release();
      goto LABEL_18;
    }
    swift_release();
  }
  swift_beginAccess();
  if (*v4) {
    dispatch_group_leave((dispatch_group_t)*v4);
  }
  swift_beginAccess();
  id v7 = *v4;
  id *v4 = 0;
LABEL_18:
}

uint64_t closure #1 in closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t (*)(_OWORD *))result;
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      uint64_t v3 = Strong;
      swift_beginAccess();
      long long v16 = *(_OWORD *)(v3 + 72);
      long long v17 = *(_OWORD *)(v3 + 56);
      long long v14 = *(_OWORD *)(v3 + 104);
      long long v15 = *(_OWORD *)(v3 + 88);
      long long v12 = *(_OWORD *)(v3 + 136);
      long long v13 = *(_OWORD *)(v3 + 120);
      long long v11 = *(_OWORD *)(v3 + 152);
      swift_release();
      long long v5 = v11;
      long long v4 = v12;
      long long v7 = v13;
      long long v6 = v14;
      long long v9 = v15;
      long long v8 = v16;
      long long v10 = v17;
    }
    else
    {
      long long v10 = xmmword_25D792120;
      long long v8 = 0uLL;
      long long v9 = 0uLL;
      long long v6 = 0uLL;
      long long v7 = 0uLL;
      long long v4 = 0uLL;
      long long v5 = 0uLL;
    }
    v18[0] = v10;
    v18[1] = v8;
    v18[2] = v9;
    v18[3] = v6;
    v18[4] = v7;
    v18[5] = v4;
    v18[6] = v5;
    return v1(v18);
  }
  return result;
}

uint64_t NetworkWirelessCoexManager.updateMetricsFromProximityRecommendationLogging(_:)(void *a1)
{
  OUTLINED_FUNCTION_4_22();
  OUTLINED_FUNCTION_3_28();
  if (v11)
  {
    long long v12 = OUTLINED_FUNCTION_2_28(v3, v4, v5, v6, v7, v8, v9, v10, v160[0]);
    v1(v12);
  }
  else
  {
    uint64_t v13 = v4;
    if (a1) {
      id v14 = objc_msgSend(a1, sel_btRSSI);
    }
    else {
      id v14 = 0;
    }
    *(void *)(v13 + 8) = v14;
    long long v15 = OUTLINED_FUNCTION_1_35((uint64_t)v14, v4, v5, v6, v7, v8, v9, v10, v160[0]);
    v1(v15);
  }
  OUTLINED_FUNCTION_4_22();
  OUTLINED_FUNCTION_3_28();
  if (v11)
  {
    uint64_t v24 = OUTLINED_FUNCTION_2_28(v16, v17, v18, v19, v20, v21, v22, v23, v160[0]);
    v1(v24);
  }
  else
  {
    uint64_t v25 = v17;
    if (a1) {
      id v26 = objc_msgSend(a1, sel_wifiRSSI);
    }
    else {
      id v26 = 0;
    }
    *(void *)(v25 + 16) = v26;
    uint64_t v27 = OUTLINED_FUNCTION_1_35((uint64_t)v26, v17, v18, v19, v20, v21, v22, v23, v160[0]);
    v1(v27);
  }
  OUTLINED_FUNCTION_4_22();
  OUTLINED_FUNCTION_3_28();
  if (v11)
  {
    uint64_t v36 = OUTLINED_FUNCTION_2_28(v28, v29, v30, v31, v32, v33, v34, v35, v160[0]);
    v1(v36);
  }
  else
  {
    uint64_t v37 = v29;
    if (a1) {
      id v38 = objc_msgSend(a1, sel_wifiSNR);
    }
    else {
      id v38 = 0;
    }
    *(void *)(v37 + 24) = v38;
    uint64_t v39 = OUTLINED_FUNCTION_1_35((uint64_t)v38, v29, v30, v31, v32, v33, v34, v35, v160[0]);
    v1(v39);
  }
  OUTLINED_FUNCTION_4_22();
  OUTLINED_FUNCTION_3_28();
  if (v11)
  {
    uint64_t v48 = OUTLINED_FUNCTION_2_28(v40, v41, v42, v43, v44, v45, v46, v47, v160[0]);
    v1(v48);
  }
  else
  {
    uint64_t v49 = v41;
    if (a1) {
      id v50 = objc_msgSend(a1, sel_beaconPER);
    }
    else {
      id v50 = 0;
    }
    *(_DWORD *)(v49 + 32) = v50;
    uint64_t v51 = OUTLINED_FUNCTION_1_35((uint64_t)v50, v41, v42, v43, v44, v45, v46, v47, v160[0]);
    v1(v51);
  }
  OUTLINED_FUNCTION_4_22();
  OUTLINED_FUNCTION_3_28();
  if (v11)
  {
    uint64_t v60 = OUTLINED_FUNCTION_2_28(v52, v53, v54, v55, v56, v57, v58, v59, v160[0]);
    v1(v60);
  }
  else
  {
    uint64_t v61 = v53;
    if (a1) {
      id v62 = objc_msgSend(a1, sel_nwType);
    }
    else {
      id v62 = 0;
    }
    *(unsigned char *)(v61 + 36) = (_BYTE)v62;
    uint64_t v63 = OUTLINED_FUNCTION_1_35((uint64_t)v62, v53, v54, v55, v56, v57, v58, v59, v160[0]);
    v1(v63);
  }
  OUTLINED_FUNCTION_4_22();
  OUTLINED_FUNCTION_3_28();
  if (v11)
  {
    uint64_t v72 = OUTLINED_FUNCTION_2_28(v64, v65, v66, v67, v68, v69, v70, v71, v160[0]);
    v1(v72);
  }
  else
  {
    uint64_t v73 = v65;
    if (a1) {
      id v74 = objc_msgSend(a1, sel_wifiCCA);
    }
    else {
      id v74 = 0;
    }
    *(void *)(v73 + 40) = v74;
    uint64_t v75 = OUTLINED_FUNCTION_1_35((uint64_t)v74, v65, v66, v67, v68, v69, v70, v71, v160[0]);
    v1(v75);
  }
  OUTLINED_FUNCTION_4_22();
  OUTLINED_FUNCTION_3_28();
  if (v11)
  {
    uint64_t v84 = OUTLINED_FUNCTION_2_28(v76, v77, v78, v79, v80, v81, v82, v83, v160[0]);
    v1(v84);
  }
  else
  {
    uint64_t v85 = v77;
    if (a1) {
      id v86 = objc_msgSend(a1, sel_lsmRecommendationBe);
    }
    else {
      id v86 = 0;
    }
    *(void *)(v85 + 48) = v86;
    long long v87 = OUTLINED_FUNCTION_1_35((uint64_t)v86, v77, v78, v79, v80, v81, v82, v83, v160[0]);
    v1(v87);
  }
  OUTLINED_FUNCTION_4_22();
  OUTLINED_FUNCTION_3_28();
  if (v11)
  {
    int v96 = OUTLINED_FUNCTION_2_28(v88, v89, v90, v91, v92, v93, v94, v95, v160[0]);
    v1(v96);
  }
  else
  {
    uint64_t v97 = v89;
    if (a1) {
      id v98 = objc_msgSend(a1, sel_expectedThroughputVIBE);
    }
    else {
      id v98 = 0;
    }
    *(void *)(v97 + 56) = v98;
    uint64_t v99 = OUTLINED_FUNCTION_1_35((uint64_t)v98, v89, v90, v91, v92, v93, v94, v95, v160[0]);
    v1(v99);
  }
  OUTLINED_FUNCTION_4_22();
  OUTLINED_FUNCTION_3_28();
  if (v11)
  {
    __n128 v108 = OUTLINED_FUNCTION_2_28(v100, v101, v102, v103, v104, v105, v106, v107, v160[0]);
    v1(v108);
  }
  else
  {
    uint64_t v109 = v101;
    if (a1) {
      id v110 = objc_msgSend(a1, sel_packetLifetimeVIBE);
    }
    else {
      id v110 = 0;
    }
    *(void *)(v109 + 64) = v110;
    char v111 = OUTLINED_FUNCTION_1_35((uint64_t)v110, v101, v102, v103, v104, v105, v106, v107, v160[0]);
    v1(v111);
  }
  OUTLINED_FUNCTION_4_22();
  OUTLINED_FUNCTION_3_28();
  if (v11)
  {
    long long v120 = OUTLINED_FUNCTION_2_28(v112, v113, v114, v115, v116, v117, v118, v119, v160[0]);
    v1(v120);
  }
  else
  {
    uint64_t v121 = v113;
    if (a1) {
      id v122 = objc_msgSend(a1, sel_packetLossRateVIBE);
    }
    else {
      id v122 = 0;
    }
    *(void *)(v121 + 72) = v122;
    long long v123 = OUTLINED_FUNCTION_1_35((uint64_t)v122, v113, v114, v115, v116, v117, v118, v119, v160[0]);
    v1(v123);
  }
  OUTLINED_FUNCTION_4_22();
  OUTLINED_FUNCTION_3_28();
  if (v11)
  {
    long long v132 = OUTLINED_FUNCTION_2_28(v124, v125, v126, v127, v128, v129, v130, v131, v160[0]);
    v1(v132);
  }
  else
  {
    uint64_t v133 = v125;
    if (a1) {
      id v134 = objc_msgSend(a1, sel_btRetransmissionRateTx);
    }
    else {
      id v134 = 0;
    }
    *(void *)(v133 + 80) = v134;
    int v135 = OUTLINED_FUNCTION_1_35((uint64_t)v134, v125, v126, v127, v128, v129, v130, v131, v160[0]);
    v1(v135);
  }
  OUTLINED_FUNCTION_4_22();
  OUTLINED_FUNCTION_3_28();
  if (v11)
  {
    uint64_t v144 = OUTLINED_FUNCTION_2_28(v136, v137, v138, v139, v140, v141, v142, v143, v160[0]);
    v1(v144);
  }
  else
  {
    uint64_t v145 = v137;
    if (a1) {
      id v146 = objc_msgSend(a1, sel_btRetransmissionRateRx);
    }
    else {
      id v146 = 0;
    }
    *(void *)(v145 + 88) = v146;
    char v147 = OUTLINED_FUNCTION_1_35((uint64_t)v146, v137, v138, v139, v140, v141, v142, v143, v160[0]);
    v1(v147);
  }
  long long v155 = NetworkConnectionProvider.connectionMetrics.modify();
  if (*v148 == 2) {
    return ((uint64_t (*)(uint64_t *, void))v155)(v160, 0);
  }
  uint64_t v157 = v148;
  if (a1) {
    id v158 = objc_msgSend(a1, sel_btTech);
  }
  else {
    id v158 = 0;
  }
  *((void *)v157 + 12) = v158;
  char v159 = OUTLINED_FUNCTION_1_35((uint64_t)v158, (uint64_t)v148, v149, v150, v151, v152, v153, v154, v160[0]);
  return ((uint64_t (*)(uint64_t *))v155)(v159);
}

uint64_t sub_25D780140()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25D780178()
{
  return objectdestroy_18Tm(40);
}

uint64_t partial apply for closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)()
{
  return closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t block_copy_helper_17(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_17()
{
  return swift_release();
}

uint64_t partial apply for closure #1 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)()
{
  return closure #1 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)();
}

uint64_t partial apply for closure #2 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)()
{
  return closure #1 in closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)(*(void *)(v0 + 16));
}

uint64_t outlined init with copy of RATManagerProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RATManagerProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of RATManagerProtocol?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RATManagerProtocol?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25D780298()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void partial apply for closure #3 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)(void *a1)
{
  closure #3 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25D7802E0()
{
  return objectdestroy_18Tm(41);
}

uint64_t objectdestroy_18Tm(uint64_t a1)
{
  swift_release();
  if (*(void *)(v1 + 24)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t partial apply for closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)()
{
  return closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned __int8 *)(v0 + 40));
}

void partial apply for closure #2 in closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)(unint64_t a1)
{
  closure #2 in closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t objectdestroy_24Tm()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in NetworkWirelessCoexManager.subscribeLinkRecommendation()()
{
  return closure #1 in NetworkWirelessCoexManager.subscribeLinkRecommendation()();
}

uint64_t partial apply for closure #1 in closure #1 in NetworkWirelessCoexManager.subscribeLinkRecommendation()(int a1, int a2, void *a3)
{
  return closure #1 in closure #1 in NetworkWirelessCoexManager.subscribeLinkRecommendation()(a1, a2, a3);
}

void closure #1 in OSLogArguments.append(_:)(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t partial apply for closure #1 in NetworkWirelessCoexManager.resetLinkRecommendationInfo()()
{
  return closure #1 in NetworkWirelessCoexManager.resetLinkRecommendationInfo()();
}

uint64_t partial apply for closure #1 in NetworkWirelessCoexManager.unregisterClient()()
{
  return closure #1 in NetworkWirelessCoexManager.unregisterClient()();
}

uint64_t outlined assign with take of RATManagerProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RATManagerProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in NetworkWirelessCoexManager.registerClient()()
{
  return closure #1 in NetworkWirelessCoexManager.registerClient()();
}

uint64_t outlined init with take of RATManagerProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RATManagerProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWlTm_2(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *OUTLINED_FUNCTION_1_35(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return &a9;
}

uint64_t *OUTLINED_FUNCTION_2_28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return &a9;
}

uint64_t (*OUTLINED_FUNCTION_4_22())()
{
  return NetworkConnectionProvider.connectionMetrics.modify();
}

uint64_t OUTLINED_FUNCTION_10_13()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t OUTLINED_FUNCTION_12_11()
{
  return 0;
}

void __swiftcall LinkRecommendationInfo.snLinkRecommendationInfo()(SNLinkRecommendationInfo *__return_ptr retstr)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = *((void *)v1 + 1);
  uint64_t v5 = *((void *)v1 + 2);
  uint64_t v6 = *((void *)v1 + 3);
  uint64_t v7 = *((int *)v1 + 8);
  uint64_t v8 = (char)v1[36];
  uint64_t v10 = *((void *)v1 + 5);
  uint64_t v9 = *((void *)v1 + 6);
  uint64_t v13 = *((void *)v1 + 7);
  uint64_t v14 = *((void *)v1 + 8);
  uint64_t v15 = *((void *)v1 + 9);
  uint64_t v16 = *((void *)v1 + 10);
  uint64_t v17 = *((void *)v1 + 11);
  uint64_t v18 = *((void *)v1 + 12);
  double v11 = *((double *)v1 + 13);
  id v12 = objc_msgSend(objc_allocWithZone((Class)SNLinkRecommendationInfo), sel_init);
  objc_msgSend(v12, sel_setBtPreference_, v2);
  objc_msgSend(v12, sel_setWifiPreference_, v3);
  objc_msgSend(v12, sel_setBtRSSI_, v4);
  objc_msgSend(v12, sel_setWifiRSSI_, v5);
  objc_msgSend(v12, sel_setWifiSNR_, v6);
  objc_msgSend(v12, sel_setBeaconPER_, v7);
  objc_msgSend(v12, sel_setNwType_, v8);
  objc_msgSend(v12, sel_setWifiCCA_, v10);
  objc_msgSend(v12, sel_setLsmRecommendationBe_, v9);
  objc_msgSend(v12, sel_setExpectedThroughputVIBE_, v13);
  objc_msgSend(v12, sel_setPacketLifetimeVIBE_, v14);
  objc_msgSend(v12, sel_setPacketLossRateVIBE_, v15);
  objc_msgSend(v12, sel_setBtRetransmissionRateTx_, v16);
  objc_msgSend(v12, sel_setBtRetransmissionRateRx_, v17);
  objc_msgSend(v12, sel_setBtTech_, v18);
  objc_msgSend(v12, sel_setTimeTaken_, v11);
}

double LinkRecommendationInfo.init(btPreference:wifiPreference:)@<D0>(char a1@<W0>, char a2@<W1>, uint64_t a3@<X8>)
{
  *(unsigned char *)a3 = a1;
  *(unsigned char *)(a3 + 1) = a2;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 29) = 0;
  double result = 0.0;
  *(_OWORD *)(a3 + 40) = 0u;
  *(_OWORD *)(a3 + 56) = 0u;
  *(_OWORD *)(a3 + 72) = 0u;
  *(_OWORD *)(a3 + 88) = 0u;
  *(void *)(a3 + 104) = 0;
  return result;
}

uint64_t LinkRecommendationInfo.btPreference.getter()
{
  return *v0;
}

uint64_t LinkRecommendationInfo.btPreference.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.btPreference.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.wifiPreference.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t LinkRecommendationInfo.wifiPreference.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.wifiPreference.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.btRSSI.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t LinkRecommendationInfo.btRSSI.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.btRSSI.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.wifiRSSI.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t LinkRecommendationInfo.wifiRSSI.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.wifiRSSI.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.wifiSNR.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t LinkRecommendationInfo.wifiSNR.setter(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.wifiSNR.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.beaconPER.getter()
{
  return *(unsigned int *)(v0 + 32);
}

uint64_t LinkRecommendationInfo.beaconPER.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.beaconPER.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.nwType.getter()
{
  return *(unsigned __int8 *)(v0 + 36);
}

uint64_t LinkRecommendationInfo.nwType.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 36) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.nwType.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.wifiCCA.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t LinkRecommendationInfo.wifiCCA.setter(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.wifiCCA.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.lsmRecommendationBe.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t LinkRecommendationInfo.lsmRecommendationBe.setter(uint64_t result)
{
  *(void *)(v1 + 48) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.lsmRecommendationBe.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.expectedThroughputVIBE.getter()
{
  return *(void *)(v0 + 56);
}

uint64_t LinkRecommendationInfo.expectedThroughputVIBE.setter(uint64_t result)
{
  *(void *)(v1 + 56) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.expectedThroughputVIBE.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.packetLifetimeVIBE.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t LinkRecommendationInfo.packetLifetimeVIBE.setter(uint64_t result)
{
  *(void *)(v1 + 64) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.packetLifetimeVIBE.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.packetLossRateVIBE.getter()
{
  return *(void *)(v0 + 72);
}

uint64_t LinkRecommendationInfo.packetLossRateVIBE.setter(uint64_t result)
{
  *(void *)(v1 + 72) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.packetLossRateVIBE.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.btRetransmissionRateTx.getter()
{
  return *(void *)(v0 + 80);
}

uint64_t LinkRecommendationInfo.btRetransmissionRateTx.setter(uint64_t result)
{
  *(void *)(v1 + 80) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.btRetransmissionRateTx.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.btRetransmissionRateRx.getter()
{
  return *(void *)(v0 + 88);
}

uint64_t LinkRecommendationInfo.btRetransmissionRateRx.setter(uint64_t result)
{
  *(void *)(v1 + 88) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.btRetransmissionRateRx.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.btTech.getter()
{
  return *(void *)(v0 + 96);
}

uint64_t LinkRecommendationInfo.btTech.setter(uint64_t result)
{
  *(void *)(v1 + 96) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.btTech.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

double LinkRecommendationInfo.timeTaken.getter()
{
  return *(double *)(v0 + 104);
}

void LinkRecommendationInfo.timeTaken.setter(double a1)
{
  *(double *)(v1 + 104) = a1;
}

uint64_t (*LinkRecommendationInfo.timeTaken.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.debugDescription.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 1);
  uint64_t v60 = *(void *)(v0 + 40);
  uint64_t v53 = *(void *)(v0 + 56);
  uint64_t v50 = *(void *)(v0 + 64);
  uint64_t v51 = *(void *)(v0 + 72);
  uint64_t v56 = *(void *)(v0 + 48);
  uint64_t v58 = *(void *)(v0 + 80);
  if (*(unsigned char *)v0) {
    uint64_t v2 = 1702195828;
  }
  else {
    uint64_t v2 = 0x65736C6166;
  }
  if (*(unsigned char *)v0) {
    unint64_t v3 = 0xE400000000000000;
  }
  else {
    unint64_t v3 = 0xE500000000000000;
  }
  uint64_t v62 = *(void *)(v0 + 88);
  uint64_t v67 = *(void *)(v0 + 96);
  unint64_t v4 = v3;
  String.append(_:)(*(Swift::String *)&v2);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_29();
  uint64_t v76 = v5;
  uint64_t v77 = v6;
  _StringGuts.grow(_:)(17);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_21();
  if (v1) {
    uint64_t v7 = 1702195828;
  }
  else {
    uint64_t v7 = 0x65736C6166;
  }
  if (v1) {
    unint64_t v8 = 0xE400000000000000;
  }
  else {
    unint64_t v8 = 0xE500000000000000;
  }
  unint64_t v9 = v8;
  String.append(_:)(*(Swift::String *)&v7);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_29();
  id v74 = v10;
  uint64_t v75 = v11;
  v12._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_29();
  uint64_t v72 = v13;
  uint64_t v73 = v14;
  OUTLINED_FUNCTION_5_21();
  v78._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  OUTLINED_FUNCTION_3_29(v78);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_29();
  uint64_t v70 = v15;
  uint64_t v71 = v16;
  OUTLINED_FUNCTION_5_21();
  v79._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  OUTLINED_FUNCTION_3_29(v79);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_29();
  uint64_t v68 = v17;
  uint64_t v69 = v18;
  v80._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  OUTLINED_FUNCTION_3_29(v80);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_29();
  uint64_t v65 = v19;
  uint64_t v66 = v20;
  v81._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  OUTLINED_FUNCTION_3_29(v81);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_29();
  uint64_t v63 = v21;
  uint64_t v64 = v22;
  OUTLINED_FUNCTION_5_21();
  v82._uint64_t countAndFlagsBits = OUTLINED_FUNCTION_0_35(v60);
  OUTLINED_FUNCTION_3_29(v82);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_29();
  uint64_t v59 = v23;
  uint64_t v61 = v24;
  _StringGuts.grow(_:)(22);
  swift_bridgeObjectRelease();
  v83._uint64_t countAndFlagsBits = OUTLINED_FUNCTION_0_35(v56);
  OUTLINED_FUNCTION_3_29(v83);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_29();
  uint64_t v55 = v25;
  uint64_t v57 = v26;
  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_23((uint64_t)"expectedThroughputVIBE ");
  v84._uint64_t countAndFlagsBits = OUTLINED_FUNCTION_0_35(v53);
  OUTLINED_FUNCTION_7_5(v84);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_29();
  uint64_t v52 = v27;
  uint64_t v54 = v28;
  _StringGuts.grow(_:)(21);
  swift_bridgeObjectRelease();
  v85._uint64_t countAndFlagsBits = OUTLINED_FUNCTION_0_35(v50);
  OUTLINED_FUNCTION_7_5(v85);
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(21);
  swift_bridgeObjectRelease();
  v86._uint64_t countAndFlagsBits = OUTLINED_FUNCTION_0_35(v51);
  OUTLINED_FUNCTION_7_5(v86);
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_23((uint64_t)"btRetransmissionRateTx ");
  v87._uint64_t countAndFlagsBits = OUTLINED_FUNCTION_0_35(v58);
  OUTLINED_FUNCTION_7_5(v87);
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_23((uint64_t)"btRetransmissionRateRx ");
  v29._uint64_t countAndFlagsBits = OUTLINED_FUNCTION_0_35(v62);
  String.append(_:)(v29);
  swift_bridgeObjectRelease();
  v30._uint64_t countAndFlagsBits = OUTLINED_FUNCTION_0_35(v67);
  String.append(_:)(v30);
  swift_bridgeObjectRelease();
  v31._object = (void *)0xEA0000000000206ELL;
  v31._uint64_t countAndFlagsBits = 0x656B6154656D6974;
  String.append(_:)(v31);
  Double.write<A>(to:)();
  _StringGuts.grow(_:)(86);
  v32._uint64_t countAndFlagsBits = 0xD000000000000018;
  v32._object = (void *)0x800000025D797510;
  String.append(_:)(v32);
  v33._uint64_t countAndFlagsBits = v77;
  v33._object = v76;
  String.append(_:)(v33);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  v34._uint64_t countAndFlagsBits = v75;
  v34._object = v74;
  String.append(_:)(v34);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  v35._uint64_t countAndFlagsBits = v73;
  v35._object = v72;
  String.append(_:)(v35);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  v36._uint64_t countAndFlagsBits = v71;
  v36._object = v70;
  String.append(_:)(v36);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  v37._uint64_t countAndFlagsBits = v69;
  v37._object = v68;
  String.append(_:)(v37);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  v38._uint64_t countAndFlagsBits = v66;
  v38._object = v65;
  String.append(_:)(v38);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  v39._uint64_t countAndFlagsBits = v64;
  v39._object = v63;
  String.append(_:)(v39);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  v40._uint64_t countAndFlagsBits = v61;
  v40._object = v59;
  String.append(_:)(v40);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  v41._uint64_t countAndFlagsBits = v57;
  v41._object = v55;
  String.append(_:)(v41);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  v42._uint64_t countAndFlagsBits = v54;
  v42._object = v52;
  String.append(_:)(v42);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  v43._uint64_t countAndFlagsBits = 0xD000000000000013;
  v43._object = (void *)0x800000025D797490;
  String.append(_:)(v43);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  v44._uint64_t countAndFlagsBits = 0xD000000000000013;
  v44._object = (void *)0x800000025D7974B0;
  String.append(_:)(v44);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  v45._uint64_t countAndFlagsBits = 0;
  v45._object = (void *)0xE000000000000000;
  String.append(_:)(v45);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  v46._uint64_t countAndFlagsBits = 0;
  v46._object = (void *)0xE000000000000000;
  String.append(_:)(v46);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  v47._uint64_t countAndFlagsBits = 0x20686365547462;
  v47._object = (void *)0xE700000000000000;
  String.append(_:)(v47);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  v48._uint64_t countAndFlagsBits = 0;
  v48._object = (void *)0xE000000000000000;
  String.append(_:)(v48);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t getEnumTagSinglePayload for LinkRecommendationInfo(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && a1[112])
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 2;
      int v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LinkRecommendationInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)double result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 112) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 112) = 0;
    }
    if (a2) {
      *(unsigned char *)double result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LinkRecommendationInfo()
{
  return &type metadata for LinkRecommendationInfo;
}

uint64_t OUTLINED_FUNCTION_0_35@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 128) = a1;
  return dispatch thunk of CustomStringConvertible.description.getter();
}

void OUTLINED_FUNCTION_3_29(Swift::String a1)
{
  String.append(_:)(a1);
}

void OUTLINED_FUNCTION_4_23(uint64_t a1@<X8>)
{
  *(void *)(v2 - 120) = v1;
  *(void *)(v2 - 112) = (a1 - 32) | 0x8000000000000000;
}

uint64_t specialized Dictionary.subscript.setter(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    outlined init with take of Any((_OWORD *)a1, v4);
    specialized Dictionary._Variant.setValue(_:forKey:)((uint64_t)v4, a2);
    return outlined destroy of AnyHashable(a2);
  }
  else
  {
    outlined destroy of Any?(a1);
    specialized Dictionary._Variant.removeValue(forKey:)(v4, a2);
    outlined destroy of AnyHashable(a2);
    return outlined destroy of Any?((uint64_t)v4);
  }
}

uint64_t specialized Dictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    outlined init with take of Any((_OWORD *)a1, v6);
    specialized Dictionary._Variant.setValue(_:forKey:)(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    outlined destroy of Any?(a1);
    specialized Dictionary._Variant.removeValue(forKey:)(v6, a2, a3);
    swift_bridgeObjectRelease();
    return outlined destroy of Any?((uint64_t)v6);
  }
}

uint64_t static NetworkConnectionError.errorDomain.getter()
{
  if (one-time initialization token for errorDomain != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = static NetworkConnectionError.errorDomain;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static NetworkConnectionError.errorDomain.setter(uint64_t a1, uint64_t a2)
{
  if (one-time initialization token for errorDomain != -1) {
    swift_once();
  }
  swift_beginAccess();
  static NetworkConnectionError.errorDomain = a1;
  qword_26A693108 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static NetworkConnectionError.errorDomain.modify())()
{
  if (one-time initialization token for errorDomain != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static ConnectionConfigurationError.errorDomain.modify;
}

uint64_t NetworkConnectionError.errorCode.getter()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[3];
  uint64_t result = 6;
  switch(v2 >> 60)
  {
    case 1uLL:
      return result;
    case 2uLL:
      uint64_t result = 7;
      break;
    case 3uLL:
      uint64_t result = 8;
      break;
    case 4uLL:
      uint64_t result = 17;
      break;
    case 5uLL:
      uint64_t result = 9;
      break;
    case 6uLL:
      uint64_t result = 10;
      break;
    case 7uLL:
      uint64_t result = 12;
      break;
    case 8uLL:
      uint64_t result = 13;
      break;
    case 9uLL:
      uint64_t result = 14;
      break;
    case 0xAuLL:
      uint64_t v4 = v0[4];
      if (v2 == 0xA000000000000000 && (v0[1] | v0[2] | v1 | v4) == 0)
      {
        uint64_t result = 0;
      }
      else if (!v4 {
             && (v2 == 0xA000000000000000 ? (BOOL v6 = v1 == 1) : (BOOL v6 = 0),
      }
                 v6 ? (BOOL v7 = *(_OWORD *)(v0 + 1) == 0) : (BOOL v7 = 0),
                 v7))
      {
        uint64_t result = 1;
      }
      else if (!v4 {
             && (v2 == 0xA000000000000000 ? (BOOL v8 = v1 == 2) : (BOOL v8 = 0),
      }
                 v8 ? (BOOL v9 = *(_OWORD *)(v0 + 1) == 0) : (BOOL v9 = 0),
                 v9))
      {
        uint64_t result = 2;
      }
      else if (!v4 && (v2 == 0xA000000000000000 ? (BOOL v10 = v1 == 3) : (BOOL v10 = 0), v10 && *(_OWORD *)(v0 + 1) == 0))
      {
        uint64_t result = 3;
      }
      else if (!v4 && (v2 == 0xA000000000000000 ? (BOOL v11 = v1 == 4) : (BOOL v11 = 0), v11 && *(_OWORD *)(v0 + 1) == 0))
      {
        uint64_t result = 4;
      }
      else if (!v4 && (v2 == 0xA000000000000000 ? (BOOL v12 = v1 == 5) : (BOOL v12 = 0), v12 && *(_OWORD *)(v0 + 1) == 0))
      {
        uint64_t result = 18;
      }
      else if (!v4 && (v2 == 0xA000000000000000 ? (BOOL v13 = v1 == 6) : (BOOL v13 = 0), v13 && *(_OWORD *)(v0 + 1) == 0))
      {
        uint64_t result = 19;
      }
      else if (!v4 && (v2 == 0xA000000000000000 ? (BOOL v14 = v1 == 7) : (BOOL v14 = 0), v14 && *(_OWORD *)(v0 + 1) == 0))
      {
        uint64_t result = 11;
      }
      else if (*(_OWORD *)(v0 + 1) == 0 && v1 == 8 && v2 == 0xA000000000000000 && v4 == 0)
      {
        uint64_t result = 15;
      }
      else
      {
        uint64_t result = 16;
      }
      break;
    default:
      uint64_t result = 5;
      break;
  }
  return result;
}

uint64_t NetworkConnectionError.errorUserInfo.getter()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v16 = Dictionary.init(dictionaryLiteral:)();
  unint64_t v4 = v2 >> 60;
  if ((v2 >> 60) <= 9)
  {
    if (v4 == 3) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v1;
    }
    if (v5)
    {
      OUTLINED_FUNCTION_1_36();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
      type metadata accessor for NSError();
      if (swift_dynamicCast())
      {
        uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        OUTLINED_FUNCTION_0_36(v6, v7, v6, v7, v8);
      }
    }
    else
    {
      OUTLINED_FUNCTION_1_36();
    }
    if (v4 == 3)
    {
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      OUTLINED_FUNCTION_0_36(v9, v10, v9, v10, v11);
      uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      OUTLINED_FUNCTION_0_36(v12, v13, v12, v13, v14);
    }
  }
  return v16;
}

uint64_t protocol witness for Error._domain.getter in conformance NetworkConnectionError(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t protocol witness for Error._code.getter in conformance NetworkConnectionError(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();

  return MEMORY[0x270EF2668](a1, v2);
}

void destroy for NetworkConnectionError(uint64_t a1)
{
}

void *initializeWithCopy for NetworkConnectionError(void *a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  unint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void **)(a2 + 32);
  outlined copy of NetworkConnectionError(*(id *)a2, v4, v5, v6, v7);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  return a1;
}

uint64_t assignWithCopy for NetworkConnectionError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  unint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void **)(a2 + 32);
  outlined copy of NetworkConnectionError(*(id *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void **)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  unint64_t v11 = *(void *)(a1 + 24);
  uint64_t v12 = *(void **)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  outlined consume of NetworkConnectionError(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t assignWithTake for NetworkConnectionError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  uint64_t v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  unint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void **)(a1 + 32);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(void *)(a1 + 32) = v3;
  outlined consume of NetworkConnectionError(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkConnectionError(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      int v3 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *(void *)(a1 + 8) >> 1;
      if (v2 > 0x80000000) {
        int v3 = ~v2;
      }
      else {
        int v3 = -1;
      }
    }
  }
  else
  {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for NetworkConnectionError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)uint64_t result = 0;
      *(void *)(result + 8) = 2 * -a2;
      *(void *)(result + 24) = 0;
      *(void *)(result + 32) = 0;
      *(void *)(result + 16) = 0;
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t getEnumTag for NetworkConnectionError(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24) >> 60;
  if (v1 <= 9) {
    return v1;
  }
  else {
    return (*(_DWORD *)a1 + 10);
  }
}

uint64_t destructiveProjectEnumData for NetworkConnectionError(uint64_t result)
{
  *(void *)(result + 24) &= 0xFFFFFFFFFFFFFFFuLL;
  return result;
}

void *destructiveInjectEnumTag for NetworkConnectionError(void *result, uint64_t a2)
{
  if (a2 < 0xA)
  {
    uint64_t v2 = result[3] & 1 | (a2 << 60);
    result[1] &= 1uLL;
    result[3] = v2;
  }
  else
  {
    result[1] = 0;
    result[2] = 0;
    *uint64_t result = (a2 - 10);
    *(_OWORD *)(result + 3) = xmmword_25D790FF0;
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkConnectionError()
{
  return &type metadata for NetworkConnectionError;
}

uint64_t OUTLINED_FUNCTION_0_36(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  return specialized Dictionary.subscript.setter((uint64_t)va, a3, a4);
}

id OUTLINED_FUNCTION_1_36()
{
  return outlined copy of NetworkConnectionError(v3, v4, v0, v2, v1);
}

uint64_t static NetworkAnalytics.netProvider(from:)()
{
  String.lowercased()();
  OUTLINED_FUNCTION_8_14();
  if (v0 == 0xD000000000000018 && (OUTLINED_FUNCTION_21_6(), v1) || (OUTLINED_FUNCTION_0_37() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (v0 == 0xD00000000000001ELL && (OUTLINED_FUNCTION_7_11((uint64_t)"siricorenetworksessionprovider"), v1) {
         || (OUTLINED_FUNCTION_0_37() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (v0 == 0xD000000000000014 && (OUTLINED_FUNCTION_21_6(), v1) || (OUTLINED_FUNCTION_0_37() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (v0 == 0xD000000000000017 && (OUTLINED_FUNCTION_21_6(), v1) || (OUTLINED_FUNCTION_0_37() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (v0 == 0xD00000000000001ELL && (OUTLINED_FUNCTION_7_11((uint64_t)"sirinetworkrpcospreyconnection"), v1))
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    OUTLINED_FUNCTION_0_37();
    OUTLINED_FUNCTION_6_18();
    if (v0) {
      return 5;
    }
    else {
      return 0;
    }
  }
}

uint64_t static NetworkAnalytics.netSnapshotState(from:)()
{
  Swift::String v2 = String.lowercased()();
  BOOL v3 = v2._countAndFlagsBits == 0x6574736575716572 && v2._object == (void *)0xEA0000000000646ELL;
  if (v3 || (OUTLINED_FUNCTION_8_14(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (v1 == 0x6674736575716572 && v0 == 0xED000064656C6961)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    OUTLINED_FUNCTION_0_37();
    OUTLINED_FUNCTION_6_18();
    if (v1) {
      return 2;
    }
    else {
      return 0;
    }
  }
}

uint64_t static NetworkAnalytics.netConnectionMethod(from:)()
{
  String.lowercased()();
  lazy protocol witness table accessor for type String and conformance String();
  if (OUTLINED_FUNCTION_1_37())
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (OUTLINED_FUNCTION_1_37())
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (OUTLINED_FUNCTION_1_37())
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (OUTLINED_FUNCTION_1_37())
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    OUTLINED_FUNCTION_27_6();
    if (OUTLINED_FUNCTION_1_37())
    {
      swift_bridgeObjectRelease();
      return 5;
    }
    else if (OUTLINED_FUNCTION_1_37())
    {
      swift_bridgeObjectRelease();
      return 6;
    }
    else
    {
      OUTLINED_FUNCTION_1_37();
      OUTLINED_FUNCTION_6_18();
      if (v0) {
        return 7;
      }
      else {
        return 0;
      }
    }
  }
}

uint64_t static NetworkAnalytics.netTLSVersion(from:)()
{
  Swift::String v2 = String.lowercased()();
  BOOL v3 = v2._countAndFlagsBits == 0x3031736C74 && v2._object == (void *)0xE500000000000000;
  if (v3 || (OUTLINED_FUNCTION_8_14(), OUTLINED_FUNCTION_17_5(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    OUTLINED_FUNCTION_30_6();
    BOOL v6 = v1 == (v5 & 0xFFFF0000FFFFFFFFLL | 0x3100000000) && v0 == 0xE500000000000000;
    if (v6 || (OUTLINED_FUNCTION_17_5(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      OUTLINED_FUNCTION_30_6();
      BOOL v8 = v1 == (v7 & 0xFFFF0000FFFFFFFFLL | 0x3200000000) && v0 == 0xE500000000000000;
      if (v8 || (OUTLINED_FUNCTION_17_5(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        OUTLINED_FUNCTION_30_6();
        BOOL v10 = v1 == (v9 & 0xFFFF0000FFFFFFFFLL | 0x3300000000) && v0 == 0xE500000000000000;
        if (v10 || (OUTLINED_FUNCTION_17_5(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          OUTLINED_FUNCTION_30_6();
          BOOL v12 = v1 == (v11 & 0xFFFF0000FFFFFFFFLL | 0x3400000000) && v0 == 0xE500000000000000;
          if (v12 || (OUTLINED_FUNCTION_17_5(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else if (v1 == 0x30336C7373 && v0 == 0xE500000000000000)
          {
            swift_bridgeObjectRelease();
            return 1;
          }
          else
          {
            OUTLINED_FUNCTION_0_37();
            OUTLINED_FUNCTION_6_18();
            return v1 & 1;
          }
        }
      }
    }
  }
}

uint64_t static NetworkAnalytics.netWiFiPhyMode(from:)()
{
  Swift::String v0 = String.lowercased()();
  BOOL v1 = v0._countAndFlagsBits == 0x6131312E323038 && v0._object == (void *)0xE700000000000000;
  if (v1 || (OUTLINED_FUNCTION_3_30(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    OUTLINED_FUNCTION_4_24();
    BOOL v4 = v0._countAndFlagsBits == (v3 & 0xFFFFFFFFFFFFLL | 0x62000000000000)
      && v0._object == (void *)0xE700000000000000;
    if (v4 || (OUTLINED_FUNCTION_3_30(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      OUTLINED_FUNCTION_4_24();
      BOOL v6 = v0._countAndFlagsBits == (v5 & 0xFFFFFFFFFFFFLL | 0x67000000000000)
        && v0._object == (void *)0xE700000000000000;
      if (v6 || (OUTLINED_FUNCTION_3_30(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        OUTLINED_FUNCTION_4_24();
        BOOL v8 = v0._countAndFlagsBits == (v7 & 0xFFFFFFFFFFFFLL | 0x6E000000000000)
          && v0._object == (void *)0xE700000000000000;
        if (v8 || (OUTLINED_FUNCTION_3_30(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          OUTLINED_FUNCTION_4_24();
          BOOL v10 = v0._countAndFlagsBits == (v9 & 0xFFFFFFFFFFFFLL | 0x6361000000000000)
             && v0._object == (void *)0xE800000000000000;
          if (v10 || (OUTLINED_FUNCTION_3_30(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            OUTLINED_FUNCTION_4_24();
            BOOL v12 = v0._countAndFlagsBits == (v11 & 0xFFFFFFFFFFFFLL | 0x7861000000000000)
               && v0._object == (void *)0xE800000000000000;
            if (v12 || (OUTLINED_FUNCTION_3_30(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              OUTLINED_FUNCTION_4_24();
              BOOL v14 = v0._countAndFlagsBits == (v13 & 0xFFFFFFFFFFFFLL | 0x6A61000000000000)
                 && v0._object == (void *)0xE800000000000000;
              if (v14 || (OUTLINED_FUNCTION_3_30(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else
              {
                OUTLINED_FUNCTION_4_24();
                BOOL v16 = v0._countAndFlagsBits == (v15 & 0xFFFFFFFFFFFFLL | 0x6861000000000000)
                   && v0._object == (void *)0xE800000000000000;
                if (v16 || (OUTLINED_FUNCTION_3_30(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else
                {
                  OUTLINED_FUNCTION_4_24();
                  if (v0._countAndFlagsBits == (v17 & 0xFFFFFFFFFFFFLL | 0x6461000000000000)
                    && v0._object == (void *)0xE800000000000000)
                  {
                    swift_bridgeObjectRelease();
                    return 9;
                  }
                  else
                  {
                    OUTLINED_FUNCTION_3_30();
                    OUTLINED_FUNCTION_0_37();
                    OUTLINED_FUNCTION_6_18();
                    if (v0._countAndFlagsBits) {
                      return 9;
                    }
                    else {
                      return 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t static NetworkAnalytics.netDebugSessionConnectionQuality(from:)(uint64_t a1)
{
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E480]), sel_init);
  uint64_t v2 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  uint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  int64_t v8 = 0;
  while (v5)
  {
    v5 &= v5 - 1;
LABEL_20:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    int v12 = static NetworkAnalytics.netQuality(fromString:)();
    swift_bridgeObjectRelease();
    Swift::String v13 = String.lowercased()();
    swift_bridgeObjectRelease();
    BOOL v14 = v13._countAndFlagsBits == 0x72616C756C6C6563 && v13._object == (void *)0xEF746E6174736E69;
    if (v14 || (OUTLINED_FUNCTION_26_4(), (OUTLINED_FUNCTION_10_14() & 1) != 0))
    {
      uint64_t result = swift_bridgeObjectRelease();
      HIDWORD(v20) = v12;
    }
    else if (v13._countAndFlagsBits == 0xD000000000000012 && v13._object == (void *)0x800000025D796140 {
           || (OUTLINED_FUNCTION_10_14() & 1) != 0)
    }
    {
      uint64_t result = swift_bridgeObjectRelease();
      LODWORD(v20) = v12;
    }
    else
    {
      BOOL v15 = v13._countAndFlagsBits == 0x74736E6969666977 && v13._object == (void *)0xEB00000000746E61;
      if (v15 || (OUTLINED_FUNCTION_10_14() & 1) != 0)
      {
        uint64_t result = swift_bridgeObjectRelease();
        HIDWORD(v19) = v12;
      }
      else
      {
        if (v13._countAndFlagsBits == 0x7473696869666977 && v13._object == (void *)0xEE006C616369726FLL)
        {
          uint64_t result = swift_bridgeObjectRelease();
          goto LABEL_43;
        }
        char v17 = OUTLINED_FUNCTION_10_14();
        uint64_t result = swift_bridgeObjectRelease();
        if (v17) {
LABEL_43:
        }
          LODWORD(v19) = v12;
      }
    }
  }
  int64_t v9 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_46;
  }
  if (v9 >= v6) {
    goto LABEL_44;
  }
  uint64_t v10 = *(void *)(v2 + 8 * v9);
  ++v8;
  if (v10) {
    goto LABEL_19;
  }
  int64_t v8 = v9 + 1;
  if (v9 + 1 >= v6) {
    goto LABEL_44;
  }
  uint64_t v10 = *(void *)(v2 + 8 * v8);
  if (v10) {
    goto LABEL_19;
  }
  int64_t v8 = v9 + 2;
  if (v9 + 2 >= v6) {
    goto LABEL_44;
  }
  uint64_t v10 = *(void *)(v2 + 8 * v8);
  if (v10)
  {
LABEL_19:
    uint64_t v5 = (v10 - 1) & v10;
    goto LABEL_20;
  }
  int64_t v11 = v9 + 3;
  if (v11 >= v6)
  {
LABEL_44:
    swift_release();
    objc_msgSend(v18, sel_setSymptomsCellularInstant_, HIDWORD(v20));
    objc_msgSend(v18, sel_setSymptomsCellularHistorical_, v20);
    objc_msgSend(v18, sel_setSymptomsWiFiInstant_, HIDWORD(v19));
    objc_msgSend(v18, sel_setSymptomsWiFiHistorical_, v19);
    return (uint64_t)v18;
  }
  uint64_t v10 = *(void *)(v2 + 8 * v11);
  if (v10)
  {
    int64_t v8 = v11;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v8 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v8 >= v6) {
      goto LABEL_44;
    }
    uint64_t v10 = *(void *)(v2 + 8 * v8);
    ++v11;
    if (v10) {
      goto LABEL_19;
    }
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t static NetworkAnalytics.netEndpointType(from:)(unsigned int a1)
{
  if (a1 < 5) {
    return a1 + 1;
  }
  else {
    return 0;
  }
}

uint64_t static NetworkAnalytics.netPathStatus(from:)()
{
  String.lowercased()();
  OUTLINED_FUNCTION_8_14();
  Swift::String v3 = String.lowercased()();
  if (v3._countAndFlagsBits == v1 && v3._object == v0)
  {
    uint64_t v5 = 2;
    OUTLINED_FUNCTION_9_13();
    return v5;
  }
  OUTLINED_FUNCTION_0_37();
  OUTLINED_FUNCTION_18_1();
  if (v2)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  Swift::String v6 = String.lowercased()();
  if (v6._countAndFlagsBits == v1 && v6._object == v0)
  {
    OUTLINED_FUNCTION_9_13();
    return 3;
  }
  OUTLINED_FUNCTION_0_37();
  OUTLINED_FUNCTION_18_1();
  if (v2)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  OUTLINED_FUNCTION_28_6();
  Swift::String v9 = String.lowercased()();
  if (v9._countAndFlagsBits == v1 && v9._object == v0)
  {
    OUTLINED_FUNCTION_9_13();
    return 4;
  }
  else
  {
    OUTLINED_FUNCTION_0_37();
    OUTLINED_FUNCTION_6_18();
    swift_bridgeObjectRelease();
    if (v1) {
      return 4;
    }
    else {
      return 0;
    }
  }
}

uint64_t static NetworkAnalytics.netSessionConnectionFailed(error:connectionMode:sessionType:sessionState:isDormant:snConnectionAnalysisInfo:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, void *a9)
{
  uint64_t v52 = a6;
  uint64_t v53 = a5;
  uint64_t v50 = a2;
  uint64_t v51 = a4;
  uint64_t v14 = (uint64_t)a9;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URL?);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  id v18 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v49 - v19;
  uint64_t v21 = (int *)type metadata accessor for ConnectionAnalysisInfo();
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = v9;
  int v56 = a8;
  uint64_t v54 = a7;
  uint64_t v55 = a1;
  if (a9)
  {
    id v24 = objc_msgSend(a9, sel_connectionType);
    id v25 = objc_msgSend(v24, sel_technology);
  }
  else
  {
    id v25 = 0;
  }
  ConnectionType.init(rawValue:)((Swift::Int)v25);
  int v26 = v58;
  if (!a9)
  {
    uint64_t v31 = type metadata accessor for URL();
    __swift_storeEnumTagSinglePayload((uint64_t)v20, 1, 1, v31);
    unsigned int v32 = 0;
LABEL_11:
    type metadata accessor for CTServiceDescriptor(0, &lazy cache variable for type metadata for NSNumber);
    Class isa = NSNumber.init(integerLiteral:)(0).super.super.isa;
    goto LABEL_12;
  }
  id v27 = objc_msgSend(a9, sel_connectionURL);
  if (v27)
  {
    uint64_t v28 = v27;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v29 = type metadata accessor for URL();
    uint64_t v30 = 0;
  }
  else
  {
    uint64_t v29 = type metadata accessor for URL();
    uint64_t v30 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v18, v30, 1, v29);
  outlined init with take of URL?((uint64_t)v18, (uint64_t)v20);
  unsigned int v33 = objc_msgSend(a9, sel_interfaceIndex);
  if ((v33 & 0x80000000) != 0)
  {
    OUTLINED_FUNCTION_1_0();
    uint64_t result = OUTLINED_FUNCTION_18_5();
    __break(1u);
    return result;
  }
  unsigned int v32 = v33;
  Class isa = (Class)objc_msgSend(a9, sel_sendBufferSize);
  if (!isa) {
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v35 = UInt64.init(truncating:)();

  if (a9)
  {
    unsigned __int8 v36 = objc_msgSend(a9, sel_wwanPreferred);
    uint64_t v14 = outlined bridged method (pb) of @objc SAConnectionPolicy.policyId.getter(a9);
    uint64_t v38 = v37;
  }
  else
  {
    uint64_t v38 = 0;
    unsigned __int8 v36 = 0;
  }
  if (v26 == 25) {
    LOBYTE(v26) = 0;
  }
  outlined init with take of URL?((uint64_t)v20, (uint64_t)v23);
  Swift::String v39 = &v23[v21[5]];
  *(_DWORD *)Swift::String v39 = v32;
  v39[4] = 0;
  *(void *)&v23[v21[6]] = v35;
  v23[v21[7]] = v36;
  v23[v21[8]] = v26;
  Swift::String v40 = (uint64_t *)&v23[v21[9]];
  *Swift::String v40 = v14;
  v40[1] = v38;
  if (a3) {
    uint64_t v41 = v50;
  }
  else {
    uint64_t v41 = 0;
  }
  if (a3) {
    uint64_t v42 = a3;
  }
  else {
    uint64_t v42 = 0xE000000000000000;
  }
  if (v53) {
    uint64_t v43 = v51;
  }
  else {
    uint64_t v43 = 0;
  }
  if (v53) {
    uint64_t v44 = v53;
  }
  else {
    uint64_t v44 = 0xE000000000000000;
  }
  if (v54) {
    uint64_t v45 = v52;
  }
  else {
    uint64_t v45 = 0;
  }
  if (v54) {
    uint64_t v46 = v54;
  }
  else {
    uint64_t v46 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v47 = static NetworkAnalytics.netSessionConnectionFailed(error:connectionMode:sessionType:sessionState:isDormant:connectionAnalysisInfo:)(v55, v41, v42, v43, v44, v45, v46, v56 & 1, (uint64_t)v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of ConnectionAnalysisInfo((uint64_t)v23);
  return (uint64_t)v47;
}

id static NetworkAnalytics.netSessionConnectionFailed(error:connectionMode:sessionType:sessionState:isDormant:connectionAnalysisInfo:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E4E0]), sel_init);
  if (!a1)
  {
    long long v54 = 0u;
    long long v55 = 0u;
    char v14 = a8;
LABEL_12:
    outlined destroy of Any?((uint64_t)&v54);
LABEL_13:
    if (!v10) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  id v11 = objc_allocWithZone(MEMORY[0x263F6E498]);
  id v12 = a1;
  id v13 = objc_msgSend(v11, sel_init);
  char v14 = a8;
  if (v13)
  {
    uint64_t v15 = v13;
    id v16 = objc_msgSend(v12, sel_domain);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    OUTLINED_FUNCTION_29_5();
    OUTLINED_FUNCTION_11_9(v17, v18, v19, (SEL *)&selRef_setDomain_);
    id v20 = objc_msgSend(v12, sel_description);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    OUTLINED_FUNCTION_29_5();
    OUTLINED_FUNCTION_11_9(v21, v22, v23, (SEL *)&selRef_setDescription_);
    objc_msgSend(v15, sel_setErrorCode_, objc_msgSend(v12, sel_code));
    if (v10)
    {
      id v24 = v10;
      id v25 = v15;
      objc_msgSend(v24, sel_setError_, v25);
    }
    char v14 = a8;
  }

  id v26 = objc_msgSend(v12, sel_userInfo);
  uint64_t v27 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  specialized Dictionary.subscript.getter(v28, v29, v27, &v54);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v55 + 1)) {
    goto LABEL_12;
  }
  type metadata accessor for CTServiceDescriptor(0, (unint64_t *)&lazy cache variable for type metadata for NSError);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_13;
  }
  id v30 = v53;
  id v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E498]), sel_init);
  if (v31)
  {
    unsigned int v32 = v31;
    id v33 = objc_msgSend(v53, sel_domain);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    OUTLINED_FUNCTION_29_5();
    OUTLINED_FUNCTION_11_9(v34, v35, v36, (SEL *)&selRef_setDomain_);
    id v37 = objc_msgSend(v53, sel_description);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    OUTLINED_FUNCTION_29_5();
    OUTLINED_FUNCTION_11_9(v38, v39, v40, (SEL *)&selRef_setDescription_);
    objc_msgSend(v32, sel_setErrorCode_, objc_msgSend(v53, sel_code));
    if (!v10)
    {

      goto LABEL_15;
    }
    id v41 = v10;
    id v42 = v32;
    objc_msgSend(v41, sel_setUnderlyingError_, v42);

LABEL_14:
    LOBYTE(v54) = *(unsigned char *)(a9 + *(int *)(type metadata accessor for ConnectionAnalysisInfo() + 32));
    objc_msgSend(v10, sel_setConnectionType_, ConnectionType.netConnectionType.getter());
    id v43 = v10;
    objc_msgSend(v43, sel_setConnectionMode_, static NetworkAnalytics.netConnectionMode(from:)());

    id v44 = v43;
    objc_msgSend(v44, sel_setSessionType_, static NetworkAnalytics.netSessionType(from:)());

    id v30 = v44;
    objc_msgSend(v30, sel_setNetworkSessionState_, static NetworkAnalytics.netSessionState(from:)());
LABEL_15:

    goto LABEL_16;
  }

  if (v10) {
    goto LABEL_14;
  }
LABEL_16:
  objc_msgSend(v10, sel_setIsDormant_, v14 & 1);
  if (v10)
  {
    uint64_t v45 = (int *)type metadata accessor for ConnectionAnalysisInfo();
    objc_msgSend(v10, sel_setIsWwanPreferred_, *(unsigned __int8 *)(a9 + v45[7]));
    objc_msgSend(v10, sel_setSendBufferSize_, *(void *)(a9 + v45[6]));
    uint64_t v46 = (uint64_t *)(a9 + v45[9]);
    id v47 = (void *)v46[1];
    if (v47)
    {
      uint64_t v48 = *v46;
      id v49 = v10;
      id v47 = (void *)MEMORY[0x2611B2220](v48, v47);
    }
    else
    {
      id v50 = v10;
    }
    objc_msgSend(v10, sel_setPolicyId_, v47);
  }
  return v10;
}

uint64_t static NetworkAnalytics.netConnectionMode(from:)()
{
  Swift::String v1 = String.lowercased()();
  BOOL v2 = v1._countAndFlagsBits == 0x6E61747369737361 && v1._object == (void *)0xE900000000000074;
  if (v2 || (OUTLINED_FUNCTION_8_14(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (v0 == 0xD000000000000015 && (OUTLINED_FUNCTION_7_11((uint64_t)"assistantanddictation"), v2))
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    OUTLINED_FUNCTION_28_6();
    OUTLINED_FUNCTION_0_37();
    OUTLINED_FUNCTION_6_18();
    if (v0) {
      return 2;
    }
    else {
      return 0;
    }
  }
}

uint64_t static NetworkAnalytics.netSessionType(from:)()
{
  Swift::String v2 = String.lowercased()();
  BOOL v3 = v2._countAndFlagsBits == 0x6C61636F6CLL && v2._object == (void *)0xE500000000000000;
  if (v3 || (OUTLINED_FUNCTION_8_14(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v5 = v1 == 0x65746F6D6572 && v0 == 0xE600000000000000;
    if (v5 || (OUTLINED_FUNCTION_14_8(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v6 = v1 == 0x696C65746F6D6572 && v0 == 0xED0000646574696DLL;
      if (v6 || (OUTLINED_FUNCTION_14_8(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (v1 == 0x756665746F6D6572 && v0 == 0xEA00000000006C6CLL)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        OUTLINED_FUNCTION_14_8();
        OUTLINED_FUNCTION_0_37();
        OUTLINED_FUNCTION_6_18();
        if (v1) {
          return 4;
        }
        else {
          return 0;
        }
      }
    }
  }
}

uint64_t static NetworkAnalytics.netSessionState(from:)()
{
  Swift::String v0 = String.lowercased()();
  BOOL v1 = v0._countAndFlagsBits == 0x6C616974696E69 && v0._object == (void *)0xE700000000000000;
  if (v1 || (OUTLINED_FUNCTION_0_37() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v3 = v0._countAndFlagsBits == 0x676E6974696177 && v0._object == (void *)0xE700000000000000;
    if (v3 || (OUTLINED_FUNCTION_0_37() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v4 = v0._countAndFlagsBits == 0x6961777972746572 && v0._object == (void *)0xEC000000676E6974;
      if (v4 || (OUTLINED_FUNCTION_0_37() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (v0._countAndFlagsBits == 0xD000000000000011 {
             && (OUTLINED_FUNCTION_7_11((uint64_t)"connectionstarted"), v1)
      }
             || (OUTLINED_FUNCTION_28_6(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else if (v0._countAndFlagsBits == 0xD000000000000010 {
             && (OUTLINED_FUNCTION_7_11((uint64_t)"connectionopened"), v1)
      }
             || (OUTLINED_FUNCTION_0_37() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 5;
      }
      else
      {
        BOOL v5 = v0._countAndFlagsBits == 0x6F6464656E65706FLL && v0._object == (void *)0xED0000746E616D72;
        if (v5 || (OUTLINED_FUNCTION_0_37() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 6;
        }
        else
        {
          BOOL v6 = v0._countAndFlagsBits == 0x69746E6568747561 && v0._object == (void *)0xEE00676E69746163;
          if (v6 || (OUTLINED_FUNCTION_0_37() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 7;
          }
          else
          {
            BOOL v7 = v0._countAndFlagsBits == 0x676E69646C6F68 && v0._object == (void *)0xE700000000000000;
            if (v7 || (OUTLINED_FUNCTION_0_37() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 8;
            }
            else
            {
              BOOL v8 = v0._countAndFlagsBits == 0x7361657461657263 && v0._object == (void *)0xEF746E6174736973;
              if (v8 || (OUTLINED_FUNCTION_0_37() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 9;
              }
              else
              {
                BOOL v9 = v0._countAndFlagsBits == 0x6973736164616F6CLL && v0._object == (void *)0xED0000746E617473;
                if (v9 || (OUTLINED_FUNCTION_0_37() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 10;
                }
                else if (v0._countAndFlagsBits == 0xD000000000000010 {
                       && (OUTLINED_FUNCTION_7_11((uint64_t)"destroyassistant"), v1)
                }
                       || (OUTLINED_FUNCTION_0_37() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 11;
                }
                else if (v0._countAndFlagsBits == 0x657669746361 && v0._object == (void *)0xE600000000000000)
                {
                  swift_bridgeObjectRelease();
                  return 12;
                }
                else
                {
                  OUTLINED_FUNCTION_0_37();
                  OUTLINED_FUNCTION_6_18();
                  if (v0._countAndFlagsBits) {
                    return 12;
                  }
                  else {
                    return 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t static NetworkAnalytics.netEndpointFromDictionary(_:)(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E490]), sel_init);
  unint64_t v3 = specialized Dictionary.subscript.getter(1701869940, 0xE400000000000000, a1);
  if ((v4 & 1) == 0)
  {
    if ((v3 & 0x8000000000000000) != 0) {
      goto LABEL_11;
    }
    if (HIDWORD(v3))
    {
LABEL_12:
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_19_5();
      goto LABEL_13;
    }
    objc_msgSend(v2, sel_setType_, static NetworkAnalytics.netEndpointType(from:)(v3));
  }
  unint64_t v5 = specialized Dictionary.subscript.getter(1953656688, 0xE400000000000000, a1);
  if ((v6 & 1) != 0 || !v2) {
    return (uint64_t)v2;
  }
  if ((v5 & 0x8000000000000000) == 0)
  {
    if (!HIDWORD(v5))
    {
      objc_msgSend(v2, sel_setPort_, v5);
      return (uint64_t)v2;
    }
    goto LABEL_12;
  }
LABEL_11:
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_20_6();
LABEL_13:
  uint64_t result = OUTLINED_FUNCTION_18_5();
  __break(1u);
  return result;
}

uint64_t static NetworkAnalytics.netEndpointsFromArray(_:)(uint64_t a1)
{
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = a1 + 32;
    swift_bridgeObjectRetain();
    do
    {
      outlined init with copy of Any(v4, (uint64_t)v8);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Int]);
      if (OUTLINED_FUNCTION_24_3())
      {
        unint64_t v5 = (void *)static NetworkAnalytics.netEndpointFromDictionary(_:)(v7);
        swift_bridgeObjectRelease();
        if (v5)
        {
          id v6 = v5;
          MEMORY[0x2611B2350]();
          if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
        }
      }
      v4 += 32;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v9;
  }
  return result;
}

uint64_t static NetworkAnalytics.netPathType(from:)(uint64_t result)
{
  if ((result - 1) >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t static NetworkAnalytics.netPathType(from:)()
{
  String.lowercased()();
  OUTLINED_FUNCTION_8_14();
  Swift::String v3 = String.lowercased()();
  if (v3._countAndFlagsBits == v1 && v3._object == v0)
  {
    OUTLINED_FUNCTION_9_13();
    return 0;
  }
  OUTLINED_FUNCTION_0_37();
  OUTLINED_FUNCTION_18_1();
  if (v2)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  Swift::String v7 = String.lowercased()();
  if (v7._countAndFlagsBits == v1 && v7._object == v0)
  {
    OUTLINED_FUNCTION_9_13();
    return 1;
  }
  OUTLINED_FUNCTION_0_37();
  OUTLINED_FUNCTION_18_1();
  if (v2)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  OUTLINED_FUNCTION_26_4();
  Swift::String v9 = String.lowercased()();
  if (v9._countAndFlagsBits == v1 && v9._object == v0)
  {
    uint64_t v5 = 2;
    OUTLINED_FUNCTION_9_13();
    return v5;
  }
  OUTLINED_FUNCTION_0_37();
  OUTLINED_FUNCTION_18_1();
  if (v2)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  Swift::String v11 = String.lowercased()();
  if (v11._countAndFlagsBits == v1 && v11._object == v0)
  {
    OUTLINED_FUNCTION_9_13();
    return 3;
  }
  OUTLINED_FUNCTION_0_37();
  OUTLINED_FUNCTION_18_1();
  if (v2)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  Swift::String v13 = String.lowercased()();
  if (v13._countAndFlagsBits == v1 && v13._object == v0)
  {
    OUTLINED_FUNCTION_9_13();
    return 4;
  }
  else
  {
    OUTLINED_FUNCTION_0_37();
    OUTLINED_FUNCTION_6_18();
    swift_bridgeObjectRelease();
    if (v1) {
      return 4;
    }
    else {
      return 0;
    }
  }
}

uint64_t static NetworkAnalytics.netPathInterfaces(from:)(uint64_t a1)
{
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v62 = MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return result;
  }
  uint64_t v4 = a1 + 32;
  uint64_t v57 = a1;
  swift_bridgeObjectRetain();
  while (1)
  {
    outlined init with copy of Any(v4, (uint64_t)&v60);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
    if (OUTLINED_FUNCTION_24_3()) {
      break;
    }
LABEL_29:
    v4 += 32;
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      return v62;
    }
  }
  unint64_t v5 = v58;
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E4C8]), sel_init);
  if (!v6)
  {
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  Swift::String v7 = v6;
  if (*(void *)(v58 + 16))
  {
    unint64_t v8 = specialized __RawDictionaryStorage.find<A>(_:)(1701869940, 0xE400000000000000);
    if (v9)
    {
      uint64_t v15 = OUTLINED_FUNCTION_23_6(v8, v9, v10, v11, v12, v13, v14);
      OUTLINED_FUNCTION_22_4(v15, v16, v17, v18, v19, v20, v21, v22, v54, v55, v56, v57, v58);
      if (swift_dynamicCast())
      {
        if ((v58 & 0x8000000000000000) != 0) {
          goto LABEL_32;
        }
        if (HIDWORD(v58)) {
          goto LABEL_33;
        }
        objc_msgSend(v7, sel_setType_, static NetworkAnalytics.netPathType(from:)(v58));
      }
    }
  }
  if (*(void *)(v5 + 16))
  {
    unint64_t v23 = specialized __RawDictionaryStorage.find<A>(_:)(1701667182, 0xE400000000000000);
    if (v24)
    {
      uint64_t v30 = OUTLINED_FUNCTION_23_6(v23, v24, v25, v26, v27, v28, v29);
      OUTLINED_FUNCTION_22_4(v30, v31, v32, v33, v34, v35, v36, v37, v54, v55, v56, v57, v58);
      if (swift_dynamicCast()) {
        outlined bridged method (mbnn) of @objc NETSchemaNETError.domain.setter(v58, v59, v7, (SEL *)&selRef_setName_);
      }
    }
  }
  if (*(void *)(v5 + 16)
    && (unint64_t v38 = specialized __RawDictionaryStorage.find<A>(_:)(0x7865646E69, 0xE500000000000000), (v39 & 1) != 0))
  {
    OUTLINED_FUNCTION_23_6(v38, v39, v40, v41, v42, v43, v44);
  }
  else
  {
    long long v60 = 0u;
    long long v61 = 0u;
  }
  uint64_t v45 = swift_bridgeObjectRelease();
  if (!*((void *)&v61 + 1))
  {
    outlined destroy of Any?((uint64_t)&v60);
    goto LABEL_26;
  }
  OUTLINED_FUNCTION_22_4(v45, v46, v47, v48, v49, v50, v51, v52, v54, v55, v56, v57, v58);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_26:
    id v53 = v7;
    MEMORY[0x2611B2350]();
    if (*(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();

    goto LABEL_29;
  }
  if ((v58 & 0x8000000000000000) != 0)
  {
LABEL_32:
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_20_6();
    goto LABEL_34;
  }
  if (!HIDWORD(v58))
  {
    objc_msgSend(v7, sel_setIndex_);
    goto LABEL_26;
  }
LABEL_33:
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_19_5();
LABEL_34:
  uint64_t result = OUTLINED_FUNCTION_18_5();
  __break(1u);
  return result;
}

uint64_t static NetworkAnalytics.netPathStatus(from:)(unsigned int a1)
{
  if (a1 < 4) {
    return a1 + 1;
  }
  else {
    return 0;
  }
}

uint64_t static NetworkAnalytics.netEstablishmentResolution(from:)(uint64_t a1)
{
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v90 = MEMORY[0x263F8EE78];
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return result;
  }
  unint64_t v5 = 0xD000000000000010;
  uint64_t v6 = a1 + 32;
  uint64_t v83 = a1;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_27_6();
  uint64_t v85 = v7;
  uint64_t v86 = v8;
  OUTLINED_FUNCTION_27_6();
  uint64_t v84 = v9;
  while (1)
  {
    outlined init with copy of Any(v6, (uint64_t)&v88);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
    if (OUTLINED_FUNCTION_24_3()) {
      break;
    }
LABEL_40:
    v6 += 32;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      return v90;
    }
  }
  unint64_t v10 = v87;
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E4A0]), sel_init);
  if (!v11)
  {
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  uint64_t v12 = v11;
  if (*(void *)(v87 + 16))
  {
    unint64_t v13 = specialized __RawDictionaryStorage.find<A>(_:)(0x6E6F697461727564, 0xE800000000000000);
    if (v14)
    {
      uint64_t v21 = OUTLINED_FUNCTION_5_22(v13, v14, v15, v16, v17, v18, v19, v20, v78);
      OUTLINED_FUNCTION_16_9(v21, v22, v23, v24, v25, v26, v27, v28, v79, v81, v82, v83, v84, v85, v86, v87);
      if (swift_dynamicCast())
      {
        if ((v87 & 0x8000000000000000) != 0) {
          goto LABEL_43;
        }
        objc_msgSend(v12, sel_setDuration_);
      }
    }
  }
  if (*(void *)(v10 + 16))
  {
    unint64_t v29 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000010, v84);
    if (v30)
    {
      uint64_t v37 = OUTLINED_FUNCTION_5_22(v29, v30, v31, v32, v33, v34, v35, v36, v78);
      OUTLINED_FUNCTION_16_9(v37, v38, v39, v40, v41, v42, v43, v44, v80, v81, v82, v83, v84, v85, v86, v87);
      if (swift_dynamicCast())
      {
        if ((v87 & 0x8000000000000000) != 0) {
          goto LABEL_43;
        }
        if (HIDWORD(v87)) {
          goto LABEL_44;
        }
        objc_msgSend(v12, sel_setResolutionSource_);
      }
    }
  }
  if (*(void *)(v10 + 16))
  {
    unint64_t v45 = specialized __RawDictionaryStorage.find<A>(_:)(v5 + 2, v85);
    if (v46)
    {
      OUTLINED_FUNCTION_5_22(v45, v46, v47, v48, v49, v50, v51, v52, v78);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Int]);
      if (OUTLINED_FUNCTION_13_11())
      {
        unint64_t v5 = v87;
        static NetworkAnalytics.netEndpointFromDictionary(_:)(v87);
        OUTLINED_FUNCTION_25_5();
        if (v1)
        {
          objc_msgSend(v12, sel_setSuccessfulEndpoint_, v1);
        }
      }
    }
  }
  if (*(void *)(v10 + 16))
  {
    unint64_t v53 = specialized __RawDictionaryStorage.find<A>(_:)(v5 + 1, v86);
    if (v54)
    {
      OUTLINED_FUNCTION_5_22(v53, v54, v55, v56, v57, v58, v59, v60, v78);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Int]);
      if (OUTLINED_FUNCTION_13_11())
      {
        unint64_t v5 = v87;
        static NetworkAnalytics.netEndpointFromDictionary(_:)(v87);
        OUTLINED_FUNCTION_25_5();
        if (v1)
        {
          objc_msgSend(v12, sel_setPreferredEndpoint_, v1);
        }
      }
    }
  }
  if (*(void *)(v10 + 16)
    && (unint64_t v61 = specialized __RawDictionaryStorage.find<A>(_:)(0x746E696F70646E65, 0xED0000746E756F43), (v62 & 1) != 0))
  {
    OUTLINED_FUNCTION_5_22(v61, v62, v63, v64, v65, v66, v67, v68, v78);
  }
  else
  {
    long long v88 = 0u;
    long long v89 = 0u;
  }
  uint64_t v69 = swift_bridgeObjectRelease();
  if (!*((void *)&v89 + 1))
  {
    outlined destroy of Any?((uint64_t)&v88);
    goto LABEL_37;
  }
  OUTLINED_FUNCTION_16_9(v69, v70, v71, v72, v73, v74, v75, v76, v78, v81, v82, v83, v84, v85, v86, v87);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_37:
    id v77 = v12;
    MEMORY[0x2611B2350]();
    uint64_t v1 = *(void **)((v90 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if ((unint64_t)v1 >= *(void *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();

    goto LABEL_40;
  }
  if ((v87 & 0x8000000000000000) != 0)
  {
LABEL_43:
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_20_6();
    goto LABEL_45;
  }
  if (!HIDWORD(v87))
  {
    objc_msgSend(v12, sel_setEndpointCount_);
    goto LABEL_37;
  }
LABEL_44:
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_19_5();
LABEL_45:
  uint64_t result = OUTLINED_FUNCTION_18_5();
  __break(1u);
  return result;
}

id static NetworkAnalytics.netProxyConfiguration(from:)(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E4D8]), sel_init);
  if (v2)
  {
    objc_msgSend(v2, sel_setIsProxyConfigured_, specialized Dictionary.subscript.getter(0x6E6F4379786F7270, 0xEF64657275676966, a1) & 1);
    id v3 = v2;
    OUTLINED_FUNCTION_28_6();
    objc_msgSend(v3, sel_setUsingConfiguredProxy_, specialized Dictionary.subscript.getter(0xD000000000000014, v4, a1) & 1);
  }
  return v2;
}

uint64_t static NetworkAnalytics.netProtocol(from:)()
{
  Swift::String v2 = String.lowercased()();
  BOOL v3 = v2._countAndFlagsBits == 7365492 && v2._object == (void *)0xE300000000000000;
  if (v3 || (OUTLINED_FUNCTION_8_14(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v5 = v1 == 7564404 && v0 == 0xE300000000000000;
    if (v5 || (OUTLINED_FUNCTION_0_37() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (v1 == 1886680168 && v0 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      OUTLINED_FUNCTION_0_37();
      OUTLINED_FUNCTION_6_18();
      if (v1) {
        return 3;
      }
      else {
        return 0;
      }
    }
  }
}

uint64_t static NetworkAnalytics.netHandshakeProtocol(from:)(uint64_t a1)
{
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v78 = MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = a1 + 32;
    uint64_t v73 = a1;
    swift_bridgeObjectRetain();
    uint64_t v5 = MEMORY[0x263F8EE58];
    unint64_t v6 = 0x263F6E000uLL;
    uint64_t v7 = &selRef_logNetworkConnectionStateReadySnapshotCaptured_;
    OUTLINED_FUNCTION_27_6();
    uint64_t v74 = v8;
    while (1)
    {
      outlined init with copy of Any(v4, (uint64_t)&v76);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
      if (OUTLINED_FUNCTION_24_3())
      {
        unint64_t v9 = v75;
        id v10 = [objc_allocWithZone(*(Class *)(v6 + 1192)) v7[223]];
        if (v10)
        {
          id v11 = v10;
          if (*(void *)(v75 + 16))
          {
            unint64_t v12 = specialized __RawDictionaryStorage.find<A>(_:)(0x6C6F636F746F7270, 0xE800000000000000);
            if (v13)
            {
              uint64_t v20 = OUTLINED_FUNCTION_5_22(v12, v13, v14, v15, v16, v17, v18, v19, v67);
              OUTLINED_FUNCTION_15_7(v20, v21, v22, v23, v24, v25, v26, v27, v68, v70, v71, v72, v73, v74, v75);
              if (swift_dynamicCast())
              {
                uint64_t v28 = v7;
                unint64_t v29 = v6;
                uint64_t v30 = v5;
                uint64_t v31 = static NetworkAnalytics.netProtocol(from:)();
                swift_bridgeObjectRelease();
                uint64_t v32 = v31;
                uint64_t v5 = v30;
                unint64_t v6 = v29;
                uint64_t v7 = v28;
                objc_msgSend(v11, sel_setProtocol_, v32);
              }
            }
          }
          if (*(void *)(v9 + 16))
          {
            unint64_t v33 = specialized __RawDictionaryStorage.find<A>(_:)(0x6B616853646E6168, 0xEC00000054545265);
            if (v34)
            {
              uint64_t v41 = OUTLINED_FUNCTION_5_22(v33, v34, v35, v36, v37, v38, v39, v40, v67);
              OUTLINED_FUNCTION_15_7(v41, v42, v43, v44, v45, v46, v47, v48, v69, v70, v71, v72, v73, v74, v75);
              if ((swift_dynamicCast() & 1) != 0 && (v75 & 0x8000000000000000) == 0)
              {
                if (v75 >= 0xFFFFFFFF) {
                  uint64_t v49 = 0xFFFFFFFFLL;
                }
                else {
                  uint64_t v49 = v75;
                }
                objc_msgSend(v11, sel_setHandShakeRTT_, v49);
              }
            }
          }
          if (*(void *)(v9 + 16)
            && (unint64_t v50 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000011, v74), (v51 & 1) != 0))
          {
            OUTLINED_FUNCTION_5_22(v50, v51, v52, v53, v54, v55, v56, v57, v67);
          }
          else
          {
            long long v76 = 0u;
            long long v77 = 0u;
          }
          uint64_t v58 = swift_bridgeObjectRelease();
          if (*((void *)&v77 + 1))
          {
            OUTLINED_FUNCTION_15_7(v58, v59, v60, v61, v62, v63, v64, v65, v67, v70, v71, v72, v73, v74, v75);
            if (swift_dynamicCast())
            {
              if ((v75 & 0x8000000000000000) != 0)
              {
                OUTLINED_FUNCTION_1_0();
                uint64_t result = OUTLINED_FUNCTION_18_5();
                __break(1u);
                return result;
              }
              objc_msgSend(v11, sel_setHandShakeDuration_);
            }
          }
          else
          {
            outlined destroy of Any?((uint64_t)&v76);
          }
          id v66 = v11;
          MEMORY[0x2611B2350]();
          if (*(void *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
        }
        else
        {
          swift_bridgeObjectRelease();
        }
      }
      v4 += 32;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return v78;
      }
    }
  }
  return result;
}

uint64_t static NetworkAnalytics.netQuality(fromString:)()
{
  Swift::String v2 = String.lowercased()();
  BOOL v3 = v2._countAndFlagsBits == 6578530 && v2._object == (void *)0xE300000000000000;
  if (v3 || (OUTLINED_FUNCTION_8_14(), (OUTLINED_FUNCTION_0_37() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    BOOL v5 = v1 == 1685024615 && v0 == 0xE400000000000000;
    if (v5 || (OUTLINED_FUNCTION_0_37() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (v1 == 0x616C696176616E75 && v0 == 0xEB00000000656C62)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      OUTLINED_FUNCTION_0_37();
      OUTLINED_FUNCTION_6_18();
      return v1 & 1;
    }
  }
}

uint64_t outlined init with take of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

{
  uint64_t v2;
  uint64_t vars8;

  uint64_t v2 = static Hasher._hash(seed:_:)();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(unsigned int a1)
{
  uint64_t v3 = MEMORY[0x2611B2910](*(void *)(v1 + 40), a1, 4);

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v3);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(unsigned __int8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  Swift::Int v2 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      outlined init with copy of AnyHashable(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x2611B2700](v9, a1);
      outlined destroy of AnyHashable((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  unint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  uint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    char v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (uint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            uint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

void outlined bridged method (mbnn) of @objc NETSchemaNETError.domain.setter(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6 = (id)MEMORY[0x2611B2220]();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

uint64_t OUTLINED_FUNCTION_0_37()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_1_37()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t OUTLINED_FUNCTION_3_30()
{
  return 0x31312E323038;
}

uint64_t OUTLINED_FUNCTION_5_22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  uint64_t v11 = *(void *)(v9 + 56) + 32 * a1;
  return outlined init with copy of Any(v11, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_6_18()
{
  return swift_bridgeObjectRelease();
}

unint64_t OUTLINED_FUNCTION_7_11@<X0>(uint64_t a1@<X8>)
{
  return (a1 - 32) | 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_9_13()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_10_14()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

void OUTLINED_FUNCTION_11_9(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  outlined bridged method (mbnn) of @objc NETSchemaNETError.domain.setter(v4, v5, v6, a4);
}

uint64_t OUTLINED_FUNCTION_13_11()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_14_8()
{
  return 0x65746F6D6572;
}

char *OUTLINED_FUNCTION_15_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  return &a15;
}

char *OUTLINED_FUNCTION_16_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  return &a16;
}

uint64_t OUTLINED_FUNCTION_17_5()
{
  return 829647988;
}

uint64_t OUTLINED_FUNCTION_18_5()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

char *OUTLINED_FUNCTION_22_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  return &a13;
}

uint64_t OUTLINED_FUNCTION_23_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  uint64_t v9 = *(void *)(v7 + 56) + 32 * a1;
  return outlined init with copy of Any(v9, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_24_3()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_25_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_26_4()
{
  return 0x72616C756C6C6563;
}

void OUTLINED_FUNCTION_29_5()
{
}

Swift::Void __swiftcall NetworkManager.forceFastDormancy()()
{
  uint64_t v0 = type metadata accessor for DispatchQoS.QoSClass();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, *MEMORY[0x263F8F080], v0);
  id v6 = (void *)static OS_dispatch_queue.global(qos:)();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v0);
  uint64_t v7 = _CTServerConnectionCreateOnTargetQueue();

  if (v7)
  {
    uint64_t v8 = _CTServerForceFastDormancy();
    if (v8)
    {
      if (one-time initialization token for siriNetwork != -1) {
        swift_once();
      }
      uint64_t v9 = type metadata accessor for Logger();
      uint64_t v10 = OUTLINED_FUNCTION_7(v9, (uint64_t)static Logger.siriNetwork);
      os_log_type_t v11 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v10, v11)) {
        goto LABEL_12;
      }
      uint64_t v12 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 67109376;
      v21[3] = v8;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v12 + 8) = 1024;
      void v21[2] = HIDWORD(v8);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v13 = "NetworkManager - ForceFastDormancy: Failed to forceFastDormancy (%d, %d).";
      BOOL v14 = v10;
      os_log_type_t v15 = v11;
      uint64_t v16 = (uint8_t *)v12;
      uint32_t v17 = 14;
    }
    else
    {
      if (one-time initialization token for siriNetwork != -1) {
        swift_once();
      }
      uint64_t v18 = type metadata accessor for Logger();
      uint64_t v10 = OUTLINED_FUNCTION_7(v18, (uint64_t)static Logger.siriNetwork);
      os_log_type_t v19 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v10, v19)) {
        goto LABEL_12;
      }
      uint64_t v20 = (uint8_t *)OUTLINED_FUNCTION_2_0();
      *(_WORD *)uint64_t v20 = 0;
      uint64_t v13 = "NetworkManager - ForceFastDormancy: forceFastDormancy.";
      BOOL v14 = v10;
      os_log_type_t v15 = v19;
      uint64_t v16 = v20;
      uint32_t v17 = 2;
    }
    _os_log_impl(&dword_25D6CC000, v14, v15, v13, v16, v17);
    OUTLINED_FUNCTION_1_2();
LABEL_12:
  }
}

void static NetworkManager.acquireDormancySuspendAssertion(_:)(void *a1)
{
  uint64_t v2 = type metadata accessor for DispatchQoS.QoSClass();
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    os_log_t v33 = (os_log_t)OUTLINED_FUNCTION_7(v12, (uint64_t)static Logger.siriNetwork);
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v33, v9)) {
      goto LABEL_12;
    }
    uint64_t v10 = (uint8_t *)OUTLINED_FUNCTION_2_0();
    *(_WORD *)uint64_t v10 = 0;
    os_log_type_t v11 = "NetworkManager - Assertion: Assertion ref should not be nil.";
    goto LABEL_11;
  }
  if (*a1)
  {
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    os_log_t v33 = (os_log_t)OUTLINED_FUNCTION_7(v8, (uint64_t)static Logger.siriNetwork);
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v33, v9)) {
      goto LABEL_12;
    }
    uint64_t v10 = (uint8_t *)OUTLINED_FUNCTION_2_0();
    *(_WORD *)uint64_t v10 = 0;
    os_log_type_t v11 = "NetworkManager - Assertion: Assertion already acquired.";
LABEL_11:
    _os_log_impl(&dword_25D6CC000, v33, v9, v11, v10, 2u);
    OUTLINED_FUNCTION_1_2();
LABEL_12:
    os_log_t v13 = v33;

    return;
  }
  type metadata accessor for OS_dispatch_queue();
  uint64_t v14 = *MEMORY[0x263F8F080];
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v32(v7, v14, v2);
  os_log_type_t v15 = (void *)static OS_dispatch_queue.global(qos:)();
  uint64_t v16 = *(void (**)(uint64_t))(v4 + 8);
  uint64_t v17 = OUTLINED_FUNCTION_4_25();
  v16(v17);
  uint64_t v18 = _CTServerConnectionCreateOnTargetQueue();

  os_log_t v33 = v18;
  if (v18)
  {
    os_log_type_t v19 = (void *)MEMORY[0x2611B2220](0xD00000000000001ELL, 0x800000025D797710);
    v32(v7, v14, v2);
    uint64_t v20 = (void *)static OS_dispatch_queue.global(qos:)();
    uint64_t v21 = OUTLINED_FUNCTION_4_25();
    v16(v21);
    aBlock[4] = closure #1 in static NetworkManager.acquireDormancySuspendAssertion(_:);
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    aBlock[3] = &block_descriptor_18;
    uint64_t v22 = _Block_copy(aBlock);
    uint64_t v23 = _CTServerConnectionDormancySuspendAssertionCreateWithExpirationCB();
    _Block_release(v22);

    if (v23)
    {
      if (one-time initialization token for siriNetwork != -1) {
        swift_once();
      }
      uint64_t v24 = type metadata accessor for Logger();
      uint64_t v25 = OUTLINED_FUNCTION_7(v24, (uint64_t)static Logger.siriNetwork);
      os_log_type_t v26 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = swift_slowAlloc();
        *(_DWORD *)uint64_t v27 = 67109376;
        LODWORD(aBlock[0]) = v23;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v27 + 8) = 1024;
        LODWORD(aBlock[0]) = HIDWORD(v23);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl(&dword_25D6CC000, v25, v26, "NetworkManager - Assertion: Failed to acquire the dormancy suspend assertion (%d, %d).", (uint8_t *)v27, 0xEu);
        OUTLINED_FUNCTION_1_2();
      }
    }
    else
    {
      if (one-time initialization token for siriNetwork != -1) {
        swift_once();
      }
      uint64_t v28 = type metadata accessor for Logger();
      unint64_t v29 = OUTLINED_FUNCTION_7(v28, (uint64_t)static Logger.siriNetwork);
      os_log_type_t v30 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = (uint8_t *)OUTLINED_FUNCTION_2_0();
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl(&dword_25D6CC000, v29, v30, "NetworkManager - Assertion: Acquired dormany suspension assertion.", v31, 2u);
        OUTLINED_FUNCTION_1_2();
      }
    }
  }
}

void closure #1 in static NetworkManager.acquireDormancySuspendAssertion(_:)()
{
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriNetwork);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_25D6CC000, oslog, v1, "NetworkManager - Assertion: Dormancy Suspend Assertion auto expired.", v2, 2u);
    MEMORY[0x2611B3750](v2, -1, -1);
  }
}

void static NetworkManager.releaseDormancySuspendAssertion(_:)(void *a1)
{
  if (a1)
  {
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    uint64_t v3 = OUTLINED_FUNCTION_7(v2, (uint64_t)static Logger.siriNetwork);
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_2_0();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_25D6CC000, v3, v4, "NetworkManager - Assertion: Released dormancy suspension assertion.", v5, 2u);
      OUTLINED_FUNCTION_1_2();
    }

    *a1 = 0;
  }
}

uint64_t block_copy_helper_18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_18()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_4_25()
{
  return v0;
}

uint64_t ConnectionEstablishmentReport.init(report:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = type metadata accessor for NWEndpoint();
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_109();
  uint64_t v117 = v7;
  uint64_t v121 = type metadata accessor for NWConnection.EstablishmentReport.Resolution.Source();
  OUTLINED_FUNCTION_0_0();
  uint64_t v127 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_109();
  uint64_t v120 = v10;
  uint64_t v11 = type metadata accessor for NWConnection.EstablishmentReport.Resolution();
  OUTLINED_FUNCTION_0_0();
  uint64_t v119 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_109();
  uint64_t v118 = v14;
  uint64_t v15 = type metadata accessor for NWConnection.EstablishmentReport.Handshake();
  OUTLINED_FUNCTION_0_0();
  uint64_t v129 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_0_1();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NWEndpoint?);
  MEMORY[0x270FA5388](v21 - 8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v24 = v23 - v22;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NWConnection.EstablishmentReport?);
  MEMORY[0x270FA5388](v25 - 8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v28 = v27 - v26;
  uint64_t v29 = type metadata accessor for NWConnection.EstablishmentReport();
  OUTLINED_FUNCTION_0_0();
  uint64_t v106 = v30;
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_109();
  uint64_t v109 = v32;
  if (one-time initialization token for sharedNetworkAnalytics != -1) {
    swift_once();
  }
  os_log_t v33 = static NetworkAnalytics.sharedNetworkAnalytics;
  outlined init with copy of NWConnection.EstablishmentReport?(a1, v28);
  if (__swift_getEnumTagSinglePayload(v28, 1, v29) == 1)
  {
    id v34 = v33;
    outlined destroy of NWConnection.EstablishmentReport?(a1, &demangling cache variable for type metadata for NWConnection.EstablishmentReport?);
    outlined destroy of NWConnection.EstablishmentReport?(v28, &demangling cache variable for type metadata for NWConnection.EstablishmentReport?);

    swift_bridgeObjectRelease_n();
    uint64_t result = swift_bridgeObjectRelease_n();
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    unint64_t v39 = 0;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    id v43 = 0;
    uint64_t v44 = 0;
    uint64_t v45 = 0;
LABEL_39:
    *a2 = 0;
    a2[1] = 0;
    a2[2] = v36;
    a2[3] = v44;
    a2[4] = 0;
    a2[5] = v45;
    a2[6] = 0;
    a2[7] = v37;
    a2[8] = v38;
    a2[9] = v39;
    a2[10] = v40;
    a2[11] = v41;
    a2[12] = v42;
    a2[13] = v43;
    return result;
  }
  uint64_t v132 = v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v106 + 32))(v109, v28, v29);
  id v46 = v33;
  unint64_t v47 = NWConnection.EstablishmentReport.previousAttemptCount.getter();
  if ((v47 & 0x8000000000000000) == 0)
  {
    unsigned int v104 = v47;
    if (!HIDWORD(v47))
    {
      NWConnection.EstablishmentReport.attemptStartedAfterInterval.getter();
      uint64_t v44 = v48;
      NWConnection.EstablishmentReport.Resolution.duration.getter();
      uint64_t v45 = v49;
      char v100 = NWConnection.EstablishmentReport.proxyConfigured.getter();
      char v99 = NWConnection.EstablishmentReport.usedProxy.getter();
      NWConnection.EstablishmentReport.proxyEndpoint.getter();
      uint64_t v115 = v3;
      uint64_t v125 = v5;
      if (__swift_getEnumTagSinglePayload(v24, 1, v3) == 1)
      {
        outlined destroy of NWConnection.EstablishmentReport?(v24, &demangling cache variable for type metadata for NWEndpoint?);
        uint64_t v103 = 0;
        uint64_t v50 = 0;
        uint64_t v101 = 0;
      }
      else
      {
        uint64_t v103 = NWEndpoint.endpointReport()();
        uint64_t v50 = v51;
        uint64_t v101 = v52;
        (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v24, v3);
      }
      id v105 = v46;
      uint64_t v102 = v50;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v53 = NWConnection.EstablishmentReport.handshakes.getter();
      uint64_t v54 = *(void *)(v53 + 16);
      uint64_t v116 = a1;
      if (v54)
      {
        uint64_t v123 = v11;
        uint64_t v55 = v129 + 16;
        uint64_t v130 = *(void (**)(uint64_t, unint64_t, uint64_t))(v129 + 16);
        unint64_t v56 = v53 + ((*(unsigned __int8 *)(v55 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 64));
        uint64_t v57 = *(void *)(v55 + 56);
        uint64_t v58 = (void (**)(uint64_t, uint64_t))(v55 - 8);
        uint64_t v59 = MEMORY[0x263F8EE78];
        do
        {
          v130(v20, v56, v15);
          NWConnection.EstablishmentReport.Handshake.definition.getter();
          uint64_t v60 = MEMORY[0x2611B1F90]();
          uint64_t v62 = v61;
          swift_release();
          NWConnection.EstablishmentReport.Handshake.handshakeDuration.getter();
          uint64_t v64 = v63;
          NWConnection.EstablishmentReport.Handshake.handshakeRTT.getter();
          uint64_t v66 = v65;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
            uint64_t v59 = v70;
          }
          unint64_t v67 = *(void *)(v59 + 16);
          uint64_t v68 = v59;
          if (v67 >= *(void *)(v59 + 24) >> 1)
          {
            specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
            uint64_t v68 = v71;
          }
          *(void *)(v68 + 16) = v67 + 1;
          uint64_t v59 = v68;
          uint64_t v69 = v68 + 48 * v67;
          *(void *)(v69 + 32) = v60;
          *(void *)(v69 + 40) = v62;
          *(void *)(v69 + 48) = v64;
          *(unsigned char *)(v69 + 56) = 0;
          *(void *)(v69 + 64) = v66;
          *(unsigned char *)(v69 + 72) = 0;
          uint64_t v15 = v132;
          (*v58)(v20, v132);
          v56 += v57;
          --v54;
        }
        while (v54);
        swift_bridgeObjectRelease();
        a1 = v116;
        uint64_t v11 = v123;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v59 = MEMORY[0x263F8EE78];
      }
      uint64_t v98 = v59;
      swift_bridgeObjectRetain();
      uint64_t v38 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRelease();
      uint64_t v72 = NWConnection.EstablishmentReport.resolutions.getter();
      uint64_t v73 = *(void *)(v72 + 16);
      uint64_t v74 = v118;
      if (!v73)
      {
LABEL_36:
        outlined destroy of NWConnection.EstablishmentReport?(a1, &demangling cache variable for type metadata for NWConnection.EstablishmentReport?);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_12_2();
        v96();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRelease();
        uint64_t v37 = v98;
        swift_bridgeObjectRetain();
        uint64_t v41 = v102;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        uint64_t result = swift_bridgeObjectRelease_n();
        uint64_t v36 = v104;
        uint64_t v97 = 256;
        if ((v99 & 1) == 0) {
          uint64_t v97 = 0;
        }
        unint64_t v39 = v97 & 0xFFFFFFFFFFFFFFFELL | v100 & 1;
        id v43 = v105;
        uint64_t v40 = v103;
        uint64_t v42 = v101;
        goto LABEL_39;
      }
      uint64_t v114 = *(void (**)(uint64_t, unint64_t, uint64_t))(v119 + 16);
      unint64_t v75 = v72 + ((*(unsigned __int8 *)(v119 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v119 + 80));
      uint64_t v113 = (uint64_t (**)(uint64_t, uint64_t))(v127 + 88);
      int v112 = *MEMORY[0x263F141F8];
      int v110 = *MEMORY[0x263F141F0];
      int v108 = *MEMORY[0x263F141E8];
      uint64_t v111 = *(void *)(v119 + 72);
      long long v76 = (void (**)(uint64_t, uint64_t))(v125 + 8);
      while (1)
      {
        uint64_t v133 = v73;
        v114(v74, v75, v11);
        NWConnection.EstablishmentReport.Resolution.source.getter();
        int v77 = (*v113)(v120, v121);
        if (v77 == v112) {
          goto LABEL_22;
        }
        if (v77 == v110)
        {
          int v78 = 1;
        }
        else
        {
          if (v77 != v108)
          {
            OUTLINED_FUNCTION_12_2();
            v93();
LABEL_22:
            int v78 = 0;
            goto LABEL_27;
          }
          int v78 = 2;
        }
LABEL_27:
        NWConnection.EstablishmentReport.Resolution.duration.getter();
        uint64_t v80 = v79;
        unint64_t v81 = NWConnection.EstablishmentReport.Resolution.endpointCount.getter();
        if ((v81 & 0x8000000000000000) != 0) {
          break;
        }
        int v131 = v81;
        if (HIDWORD(v81)) {
          break;
        }
        NWConnection.EstablishmentReport.Resolution.successfulEndpoint.getter();
        uint64_t v82 = NWEndpoint.endpointReport()();
        uint64_t v126 = v83;
        uint64_t v128 = v82;
        uint64_t v124 = v84;
        uint64_t v85 = *v76;
        (*v76)(v117, v115);
        NWConnection.EstablishmentReport.Resolution.preferredEndpoint.getter();
        uint64_t v86 = NWEndpoint.endpointReport()();
        uint64_t v122 = v87;
        uint64_t v89 = v88;
        v85(v117, v115);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
          uint64_t v38 = v94;
        }
        unint64_t v90 = *(void *)(v38 + 16);
        if (v90 >= *(void *)(v38 + 24) >> 1)
        {
          specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
          uint64_t v38 = v95;
        }
        *(void *)(v38 + 16) = v90 + 1;
        uint64_t v91 = v38 + 80 * v90;
        *(_DWORD *)(v91 + 32) = v78;
        *(unsigned char *)(v91 + 36) = 0;
        *(void *)(v91 + 40) = v80;
        *(unsigned char *)(v91 + 48) = 0;
        *(_DWORD *)(v91 + 52) = v131;
        *(unsigned char *)(v91 + 56) = 0;
        *(void *)(v91 + 64) = v128;
        *(void *)(v91 + 72) = v126;
        *(void *)(v91 + 80) = v124;
        *(void *)(v91 + 88) = v86;
        *(void *)(v91 + 96) = v122;
        *(void *)(v91 + 104) = v89;
        uint64_t v74 = v118;
        OUTLINED_FUNCTION_12_2();
        v92();
        v75 += v111;
        uint64_t v73 = v133 - 1;
        a1 = v116;
        if (v133 == 1) {
          goto LABEL_36;
        }
      }
    }
  }
  OUTLINED_FUNCTION_1_0();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t outlined destroy of NWConnection.EstablishmentReport?(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_12_2();
  v3();
  return a1;
}

uint64_t ConnectionHandshakeReport.handshakeDurationInMs.getter()
{
  outlined init with take of Double?(v0 + 16, (uint64_t)v3);
  uint64_t result = outlined init with take of Double?((uint64_t)v3, (uint64_t)&v4);
  if ((v5 & 1) != 0 || v4 <= 0.0) {
    return 0;
  }
  double v2 = v4 * 1000.0;
  if (v4 * 1000.0 <= 0.0) {
    return 0;
  }
  if (v2 >= 1.84467441e19) {
    return -1;
  }
  if ((~*(void *)&v2 & 0x7FF0000000000000) != 0)
  {
    if (v2 > -1.0) {
      return (unint64_t)v2;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t ConnectionHandshakeReport.handshakeRTTInMs.getter()
{
  outlined init with take of Double?(v0 + 32, (uint64_t)v5);
  unint64_t result = outlined init with take of Double?((uint64_t)v5, (uint64_t)&v6);
  if ((v7 & 1) != 0 || v6 <= 0.0)
  {
    uint64_t v4 = 0;
    unsigned __int8 v3 = 1;
    goto LABEL_10;
  }
  double v2 = v6 * 1000.0;
  if (v6 * 1000.0 <= 0.0)
  {
    uint64_t v4 = 0;
    unsigned __int8 v3 = 0;
    goto LABEL_10;
  }
  if (v2 >= 4294967300.0)
  {
    unsigned __int8 v3 = 0;
    uint64_t v4 = 0xFFFFFFFFLL;
    goto LABEL_10;
  }
  if ((~*(void *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v2 <= -1.0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v2 < 4294967300.0)
  {
    unsigned __int8 v3 = 0;
    uint64_t v4 = v2;
LABEL_10:
    LOBYTE(v6) = v3;
    return v4 | ((unint64_t)v3 << 32);
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t initializeWithCopy for ConnectionHandshakeReport(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ConnectionHandshakeReport(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ConnectionHandshakeReport(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for ConnectionHandshakeReport(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 41))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ConnectionHandshakeReport(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConnectionHandshakeReport()
{
  return &type metadata for ConnectionHandshakeReport;
}

unint64_t ConnectionHandshakeReport.debugDescription.getter()
{
  uint64_t v1 = 0x6E776F6E6B6E75;
  if (v0[1])
  {
    uint64_t v2 = *v0;
    unint64_t v3 = (void *)v0[1];
  }
  else
  {
    unint64_t v3 = (void *)0xE700000000000000;
    uint64_t v2 = 0x6E776F6E6B6E75;
  }
  swift_bridgeObjectRetain();
  v4._uint64_t countAndFlagsBits = v2;
  v4._object = v3;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(24);
  swift_bridgeObjectRelease();
  ConnectionHandshakeReport.handshakeDurationInMs.getter();
  if (v5)
  {
    unint64_t v8 = 0xE700000000000000;
    uint64_t v6 = 0x6E776F6E6B6E75;
  }
  else
  {
    uint64_t v6 = String.init<A>(describing:)();
    unint64_t v8 = v7;
  }
  unint64_t v9 = v8;
  String.append(_:)(*(Swift::String *)&v6);
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(19);
  swift_bridgeObjectRelease();
  if ((ConnectionHandshakeReport.handshakeRTTInMs.getter() & 0x100000000) != 0)
  {
    uint64_t v11 = (void *)0xE700000000000000;
  }
  else
  {
    uint64_t v1 = String.init<A>(describing:)();
    uint64_t v11 = v10;
  }
  v12._uint64_t countAndFlagsBits = v1;
  v12._object = v11;
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(45);
  swift_bridgeObjectRelease();
  v13._uint64_t countAndFlagsBits = 0x20656D616ELL;
  v13._object = (void *)0xE500000000000000;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._uint64_t countAndFlagsBits = 8236;
  v14._object = (void *)0xE200000000000000;
  String.append(_:)(v14);
  v15._uint64_t countAndFlagsBits = 0xD000000000000016;
  v15._object = (void *)0x800000025D797760;
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  v16._uint64_t countAndFlagsBits = 8236;
  v16._object = (void *)0xE200000000000000;
  String.append(_:)(v16);
  v17._uint64_t countAndFlagsBits = 0xD000000000000011;
  v17._object = (void *)0x800000025D797780;
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  v18._uint64_t countAndFlagsBits = 93;
  v18._object = (void *)0xE100000000000000;
  String.append(_:)(v18);
  return 0xD000000000000022;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ConnectionHandshakeReport()
{
  return ConnectionHandshakeReport.debugDescription.getter();
}

uint64_t NWEndpoint.init(configuration:)@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NWEndpoint.Port?);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for NWEndpoint.Port();
  OUTLINED_FUNCTION_0_0();
  uint64_t v40 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = type metadata accessor for NWEndpoint();
  OUTLINED_FUNCTION_0_0();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_0_1();
  uint64_t v20 = v19 - v18;
  memcpy(v42, a1, 0x204uLL);
  memcpy(v41, a1, 0x204uLL);
  ConnectionConfiguration.resolvedHost.getter();
  if (!v22)
  {
    outlined release of ConnectionConfiguration(v42);
    goto LABEL_7;
  }
  unint64_t v23 = v22;
  uint64_t v39 = v21;
  memcpy(v41, v42, 0x204uLL);
  ConnectionConfiguration.resolvedPort.getter();
  if ((v24 & 0x10000) != 0)
  {
    outlined release of ConnectionConfiguration(v42);
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  NWEndpoint.Port.init(rawValue:)();
  if (__swift_getEnumTagSinglePayload(v7, 1, v8) == 1)
  {
    swift_bridgeObjectRelease();
    outlined release of ConnectionConfiguration(v42);
    outlined destroy of RPCOspreyConnectionProtocol?(v7, &demangling cache variable for type metadata for NWEndpoint.Port?);
LABEL_7:
    if (one-time initialization token for siriNetwork != -1) {
      swift_once();
    }
    uint64_t v25 = type metadata accessor for Logger();
    __swift_project_value_buffer(v25, (uint64_t)static Logger.siriNetwork);
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_25D6CC000, v26, v27, "Provider - Network setup: No resolved host", v28, 2u);
      MEMORY[0x2611B3750](v28, -1, -1);
    }

    uint64_t v29 = 1;
    return __swift_storeEnumTagSinglePayload(a2, v29, 1, v14);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v13, v7, v8);
  uint64_t v31 = v20
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (host: NWEndpoint.Host, port: NWEndpoint.Port))
               + 48);
  swift_bridgeObjectRetain();
  NWEndpoint.Host.init(_:)();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v31, v13, v8);
  (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v20, *MEMORY[0x263F14118], v14);
  if (!v42[49])
  {
    outlined release of ConnectionConfiguration(v42);
    goto LABEL_18;
  }
  uint64_t v32 = v42[45];
  char v33 = v42[46];
  outlined release of ConnectionConfiguration(v42);
  if (v33)
  {
LABEL_18:
    uint64_t v32 = 5228;
    goto LABEL_19;
  }
  if ((unint64_t)(v32 - 1) <= 0xFFFD)
  {
LABEL_19:
    if (one-time initialization token for htons != -1) {
      swift_once();
    }
    static Endian.htons(v32);
    NWEndpoint.alternatePort.setter();
  }
  if (one-time initialization token for siriNetwork != -1) {
    swift_once();
  }
  uint64_t v34 = type metadata accessor for Logger();
  __swift_project_value_buffer(v34, (uint64_t)static Logger.siriNetwork);
  swift_bridgeObjectRetain();
  uint64_t v35 = Logger.logObject.getter();
  os_log_type_t v38 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v35, v38))
  {
    uint64_t v36 = swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    v41[0] = v37;
    *(_DWORD *)uint64_t v36 = 136315650;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v39, v23, v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v36 + 12) = 512;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v36 + 16) = 2048;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_25D6CC000, v35, v38, "Provider - Network setup: Endpoint created: %s:%hu/%ld", (uint8_t *)v36, 0x1Au);
    swift_arrayDestroy();
    MEMORY[0x2611B3750](v37, -1, -1);
    MEMORY[0x2611B3750](v36, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v13, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(a2, v20, v14);
  uint64_t v29 = 0;
  return __swift_storeEnumTagSinglePayload(a2, v29, 1, v14);
}

uint64_t NWEndpoint.endpointReport()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NWEndpoint.Port();
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = type metadata accessor for NWEndpoint.Host();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_0_1();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = type metadata accessor for NWEndpoint();
  OUTLINED_FUNCTION_0_0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_0_1();
  uint64_t v22 = v21 - v20;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v21 - v20, v1, v16);
  int v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 88))(v22, v16);
  if (v23 == *MEMORY[0x263F14118])
  {
    uint64_t v24 = OUTLINED_FUNCTION_1_38();
    v25(v24);
    uint64_t v26 = v22
        + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (host: NWEndpoint.Host, port: NWEndpoint.Port))
                 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v15, v22, v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v8, v26, v2);
    uint64_t v27 = NWEndpoint.Host.debugDescription.getter();
    NWEndpoint.Port.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v9);
  }
  else
  {
    if (v23 != *MEMORY[0x263F14110])
    {
      if (v23 == *MEMORY[0x263F14100])
      {
        uint64_t v31 = OUTLINED_FUNCTION_1_38();
        v32(v31);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (v23 == *MEMORY[0x263F140E8])
        {
          uint64_t v33 = OUTLINED_FUNCTION_3_31();
          v34(v33);
          return 0;
        }
        if (v23 == *MEMORY[0x263F14108])
        {
          uint64_t v35 = OUTLINED_FUNCTION_1_38();
          v36(v35);
          swift_unknownObjectRelease();
        }
        else
        {
          uint64_t v37 = OUTLINED_FUNCTION_3_31();
          v38(v37);
        }
      }
      return 0;
    }
    uint64_t v28 = OUTLINED_FUNCTION_1_38();
    v29(v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (name: String, type: String, domain: String, interface: NWInterface?));
    outlined destroy of RPCOspreyConnectionProtocol?(v22 + *(int *)(v30 + 80), (uint64_t *)&demangling cache variable for type metadata for NWInterface?);
    return 0;
  }
  return v27;
}

uint64_t OUTLINED_FUNCTION_1_38()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_31()
{
  return v0;
}

uint64_t dispatch thunk of DataCompressing.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DataCompressing.compressedDataForData(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of DataDecompressing.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DataDecompressing.decompressedDataForData(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

void ConnectionEstablishmentReport.netConnectionStateReadySnapshot.getter()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E4B8]), sel_init);
  if (v1)
  {
    outlined init with take of ConnectionSnapshotReport?(v0, (uint64_t)v13, &demangling cache variable for type metadata for String?);
    outlined init with take of ConnectionSnapshotReport?((uint64_t)v13, (uint64_t)&v14, &demangling cache variable for type metadata for String?);
    uint64_t v2 = v15;
    if (v15)
    {
      uint64_t v3 = v14;
      id v4 = v1;
      uint64_t v2 = (void *)MEMORY[0x2611B2220](v3, v2);
    }
    else
    {
      id v5 = v1;
    }
    objc_msgSend(v1, sel_setConnectionInfo_, v2);
  }
  outlined init with take of ConnectionSnapshotReport?(v0 + 24, (uint64_t)v12, &demangling cache variable for type metadata for Double?);
  outlined init with take of ConnectionSnapshotReport?((uint64_t)v12, (uint64_t)&v16, &demangling cache variable for type metadata for Double?);
  if ((v17 & 1) != 0 || v16 <= 0.0) {
    goto LABEL_18;
  }
  if (v16 * 1000.0 <= 0.0)
  {
    uint64_t v10 = 0;
  }
  else
  {
    if (v16 * 1000.0 < 4294967300.0)
    {
      OUTLINED_FUNCTION_0_38();
      if (v7)
      {
        __break(1u);
      }
      else if (v6 > -1.0)
      {
        OUTLINED_FUNCTION_1_39();
        if (!v9) {
          goto LABEL_23;
        }
        uint64_t v10 = v8;
        goto LABEL_17;
      }
      __break(1u);
LABEL_23:
      __break(1u);
      return;
    }
    uint64_t v10 = 0xFFFFFFFFLL;
  }
LABEL_17:
  objc_msgSend(v1, sel_setConnectionEstablishmentAttemptDelay_, v10);
LABEL_18:
  outlined init with take of ConnectionSnapshotReport?(v0 + 16, (uint64_t)&v11, &demangling cache variable for type metadata for UInt32?);
  outlined init with take of ConnectionSnapshotReport?((uint64_t)&v11, (uint64_t)&v18, &demangling cache variable for type metadata for UInt32?);
  if ((v19 & 1) == 0) {
    objc_msgSend(v1, sel_setConnectionEstablishmentPreviousAttemptCount_, v18);
  }
}

void ConnectionEstablishmentReport.netDebugConnectionStateReadySnapshot.getter()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E460]), sel_init);
  uint64_t v2 = ConnectionEstablishmentReport.durationInMs.getter();
  if ((v3 & 1) == 0) {
    objc_msgSend(v1, sel_setDurationInMs_, v2);
  }
  if (v1)
  {
    id v4 = objc_allocWithZone(MEMORY[0x263F6E4D8]);
    id v5 = v1;
    id v6 = objc_msgSend(v4, sel_init);
    objc_msgSend(v5, sel_setProxyConfiguration_, v6);

    id v7 = objc_msgSend(v5, sel_proxyConfiguration);
    if (v7)
    {
      double v8 = v7;
      objc_msgSend(v7, sel_setIsProxyConfigured_, *(unsigned __int8 *)(v0 + 72));
    }
    id v9 = objc_msgSend(v5, sel_proxyConfiguration);
    if (v9)
    {
      uint64_t v10 = v9;
      objc_msgSend(v9, sel_setUsingConfiguredProxy_, *(unsigned __int8 *)(v0 + 73));
    }
  }
  uint64_t v58 = *(void *)(v0 + 56);
  uint64_t v11 = *(void *)(v58 + 16);
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t v50 = v1;
  if (!v11)
  {
LABEL_47:
    uint64_t v57 = *(void *)(v0 + 64);
    uint64_t v31 = *(void *)(v57 + 16);
    if (!v31) {
      return;
    }
    uint64_t v56 = v12;
    for (unint64_t i = (unsigned int *)(swift_bridgeObjectRetain() + 52); ; i += 20)
    {
      char v33 = *((unsigned char *)i - 16);
      double v34 = *(double *)(i - 3);
      char v35 = *((unsigned char *)i - 4);
      uint64_t v36 = *i;
      char v37 = *((unsigned char *)i + 4);
      uint64_t v38 = *(void *)(i + 5);
      unsigned int v51 = i[7];
      unsigned int v52 = i[8];
      uint64_t v39 = *(void *)(i + 11);
      unsigned int v54 = i[14];
      unsigned int v55 = *(i - 5);
      unsigned int v53 = i[13];
      id v40 = objc_allocWithZone(MEMORY[0x263F6E4A0]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v41 = objc_msgSend(v40, sel_init);
      if ((v35 & 1) == 0 && v34 > 0.0)
      {
        if (v34 * 1000.0 <= 0.0)
        {
          unint64_t v43 = 0;
        }
        else
        {
          OUTLINED_FUNCTION_1_39();
          if (v21)
          {
            OUTLINED_FUNCTION_0_38();
            if (v23) {
              goto LABEL_88;
            }
            if (v42 <= -1.0) {
              goto LABEL_89;
            }
            unint64_t v43 = (unint64_t)v42;
          }
          else
          {
            unint64_t v43 = -1;
          }
        }
        objc_msgSend(v41, sel_setDuration_, v43);
      }
      if (v37)
      {
        if ((v33 & 1) == 0) {
          goto LABEL_64;
        }
      }
      else
      {
        objc_msgSend(v41, sel_setEndpointCount_, v36);
        if ((v33 & 1) == 0)
        {
LABEL_64:
          objc_msgSend(v41, sel_setResolutionSource_, v55);
          if (!v38) {
            goto LABEL_67;
          }
          goto LABEL_65;
        }
      }
      if (!v38) {
        goto LABEL_67;
      }
LABEL_65:
      id v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E490]), sel_init);
      if (v44)
      {
        uint64_t v45 = v44;
        objc_msgSend(v44, sel_setPort_, v51);
        type metadata accessor for NetworkAnalytics(0);
        objc_msgSend(v45, sel_setType_, static NetworkAnalytics.netEndpointType(from:)(v52));
        id v46 = v41;
        objc_msgSend(v46, sel_setSuccessfulEndpoint_, v45);
      }
LABEL_67:
      if (v39)
      {
        id v47 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E490]), sel_init);
        if (v47)
        {
          id v48 = v47;
          objc_msgSend(v47, sel_setPort_, v53);
          type metadata accessor for NetworkAnalytics(0);
          objc_msgSend(v48, sel_setType_, static NetworkAnalytics.netEndpointType(from:)(v54));
          if (v41)
          {
            id v49 = v41;
            objc_msgSend(v49, sel_setPreferredEndpoint_, v48);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

LABEL_72:
            id v48 = v41;
            MEMORY[0x2611B2350]();
            if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
            }
            specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized Array._endMutation()();
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }

          goto LABEL_76;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v41) {
        goto LABEL_72;
      }
LABEL_76:
      if (!--v31)
      {
        outlined release of [ConnectionHandshakeReport]((uint64_t)&v57);
        if (v50) {
          outlined bridged method (mbnn) of @objc NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured.pathGateways.setter(v56, v50, (unint64_t *)&lazy cache variable for type metadata for NETSchemaNETEstablishmentResolution, 0x263F6E4A0, (SEL *)&selRef_setResolutions_);
        }
        else {
          swift_bridgeObjectRelease();
        }
        return;
      }
    }
  }
  uint64_t v57 = MEMORY[0x263F8EE78];
  uint64_t v13 = (unsigned char *)(swift_bridgeObjectRetain() + 72);
  while (1)
  {
    uint64_t v14 = *((void *)v13 - 4);
    double v15 = *((double *)v13 - 3);
    char v16 = *(v13 - 16);
    double v17 = *((double *)v13 - 1);
    char v18 = *v13;
    id v19 = objc_allocWithZone(MEMORY[0x263F6E4A8]);
    swift_bridgeObjectRetain();
    id v20 = objc_msgSend(v19, sel_init);
    if ((v16 & 1) != 0 || v15 <= 0.0) {
      goto LABEL_20;
    }
    if (v15 * 1000.0 <= 0.0)
    {
      unint64_t v24 = 0;
      goto LABEL_19;
    }
    OUTLINED_FUNCTION_1_39();
    if (v21) {
      break;
    }
    unint64_t v24 = -1;
LABEL_19:
    objc_msgSend(v20, sel_setHandShakeDuration_, v24);
LABEL_20:
    if (v17 <= 0.0) {
      char v25 = 1;
    }
    else {
      char v25 = v18;
    }
    if ((v25 & 1) == 0)
    {
      if (v17 * 1000.0 <= 0.0)
      {
        uint64_t v28 = 0;
      }
      else if (v17 * 1000.0 >= 4294967300.0)
      {
        uint64_t v28 = 0xFFFFFFFFLL;
      }
      else
      {
        OUTLINED_FUNCTION_0_38();
        if (v23) {
          goto LABEL_85;
        }
        if (v26 <= -1.0) {
          goto LABEL_86;
        }
        OUTLINED_FUNCTION_1_39();
        if (!v21) {
          goto LABEL_87;
        }
        uint64_t v28 = v27;
      }
      objc_msgSend(v20, sel_setHandShakeRTT_, v28);
    }
    if (v14)
    {
      if (v20)
      {
        type metadata accessor for NetworkAnalytics(0);
        id v29 = v20;
        objc_msgSend(v29, sel_setProtocol_, static NetworkAnalytics.netProtocol(from:)());
        swift_bridgeObjectRelease();

LABEL_38:
        id v30 = v20;
        MEMORY[0x2611B2350]();
        if (*(void *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();

        goto LABEL_42;
      }
      swift_bridgeObjectRelease();
    }
    else if (v20)
    {
      goto LABEL_38;
    }
LABEL_42:
    v13 += 48;
    if (!--v11)
    {
      outlined release of [ConnectionHandshakeReport]((uint64_t)&v58);
      if (v1) {
        outlined bridged method (mbnn) of @objc NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured.pathGateways.setter(v57, v1, &lazy cache variable for type metadata for NETSchemaNETHandShakeProtocol, 0x263F6E4A8, (SEL *)&selRef_setConnectionEstablishmentProtocols_);
      }
      else {
        swift_bridgeObjectRelease();
      }
      uint64_t v12 = MEMORY[0x263F8EE78];
      goto LABEL_47;
    }
  }
  OUTLINED_FUNCTION_0_38();
  if (!v23)
  {
    if (v22 <= -1.0) {
      goto LABEL_84;
    }
    unint64_t v24 = (unint64_t)v22;
    goto LABEL_19;
  }
  __break(1u);
LABEL_84:
  __break(1u);
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
LABEL_87:
  __break(1u);
LABEL_88:
  __break(1u);
LABEL_89:
  __break(1u);
}

uint64_t outlined release of [ConnectionHandshakeReport](uint64_t a1)
{
  return a1;
}

void *ConnectionPreparationReport.init(path:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v114 = a2;
  uint64_t v126 = type metadata accessor for NWEndpoint.Port();
  OUTLINED_FUNCTION_0_0();
  uint64_t v119 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_109();
  uint64_t v125 = v5;
  uint64_t v124 = type metadata accessor for NWEndpoint.Host();
  OUTLINED_FUNCTION_0_0();
  uint64_t v118 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_109();
  uint64_t v123 = v8;
  uint64_t v9 = type metadata accessor for NWInterface();
  OUTLINED_FUNCTION_0_0();
  *(void *)&long long v139 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_109();
  uint64_t v141 = v12;
  uint64_t v13 = type metadata accessor for NWEndpoint();
  OUTLINED_FUNCTION_0_0();
  uint64_t v138 = v14;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v127 = &v101[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v16);
  uint64_t v137 = &v101[-v18];
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for NWInterface?);
  MEMORY[0x270FA5388](v19 - 8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v22 = v21 - v20;
  uint64_t v140 = type metadata accessor for NWPath.Status();
  OUTLINED_FUNCTION_0_0();
  uint64_t v24 = v23;
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_0_1();
  uint64_t v28 = v27 - v26;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NWPath?);
  MEMORY[0x270FA5388](v29 - 8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v32 = v31 - v30;
  uint64_t v33 = type metadata accessor for NWPath();
  OUTLINED_FUNCTION_0_0();
  uint64_t v113 = v34;
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_109();
  uint64_t v117 = v36;
  memset(v148, 0, 37);
  _s11SiriNetwork25ConnectionInterfaceReportVSgWOi0_(v149);
  uint64_t v115 = (uint64_t)&v148[2] + 8;
  outlined init with take of ConnectionSnapshotReport?((uint64_t)v149, (uint64_t)&v148[2] + 8, (uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
  *(void *)&v148[21] = MEMORY[0x263F8EE78];
  *((void *)&v148[21] + 1) = MEMORY[0x263F8EE78];
  if (one-time initialization token for sharedNetworkAnalytics != -1) {
    swift_once();
  }
  char v37 = static NetworkAnalytics.sharedNetworkAnalytics;
  *(void *)&v148[22] = static NetworkAnalytics.sharedNetworkAnalytics;
  outlined init with copy of NWPath?(a1, v32);
  if (__swift_getEnumTagSinglePayload(v32, 1, v33) == 1)
  {
    id v38 = v37;
    outlined destroy of NWConnection.EstablishmentReport?(a1, &demangling cache variable for type metadata for NWPath?);
    outlined destroy of NWConnection.EstablishmentReport?(v32, &demangling cache variable for type metadata for NWPath?);
    memcpy(v143, v148, sizeof(v143));
    outlined release of ConnectionPreparationReport(v143);
    _s11SiriNetwork27ConnectionPreparationReportVSgWOi0_(v144);
    return (void *)outlined init with take of ConnectionSnapshotReport?((uint64_t)v144, (uint64_t)v114, &demangling cache variable for type metadata for ConnectionPreparationReport?);
  }
  uint64_t v134 = v33;
  uint64_t v135 = a1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v113 + 32))(v117, v32, v33);
  *(void *)&v144[0] = 0;
  *((void *)&v144[0] + 1) = 0xE000000000000000;
  id v110 = v37;
  NWPath.status.getter();
  uint64_t v40 = v140;
  _print_unlocked<A, B>(_:_:)();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v28, v40);
  uint64_t v109 = *(void *)&v144[0];
  v148[1] = v144[0];
  uint64_t v111 = *((void *)&v144[0] + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  char v41 = NWPath.supportsDNS.getter();
  int v42 = v41 & 1;
  LOBYTE(v148[2]) = v41 & 1;
  char v43 = NWPath.isExpensive.getter();
  int v107 = v43 & 1;
  BYTE1(v148[2]) = v43 & 1;
  char v44 = NWPath.isConstrained.getter();
  int v106 = v44 & 1;
  BYTE2(v148[2]) = v44 & 1;
  char v45 = NWPath.supportsIPv4.getter();
  int v105 = v45 & 1;
  BYTE3(v148[2]) = v45 & 1;
  char v46 = NWPath.supportsIPv6.getter();
  int v104 = v46 & 1;
  BYTE4(v148[2]) = v46 & 1;
  NWPath.nw.getter();
  id v47 = nw_path_copy_interface();
  swift_unknownObjectRelease();
  int v108 = v42;
  if (v47)
  {
    LODWORD(v140) = nw_interface_get_index(v47);
    swift_unknownObjectRelease();
  }
  else
  {
    LODWORD(v140) = 0;
  }
  uint64_t v48 = v139;
  uint64_t v49 = NWPath.availableInterfaces.getter();
  uint64_t v50 = *(void *)(v49 + 16);
  uint64_t v132 = v49;
  if (v50)
  {
    unsigned int v52 = *(void (**)(uint64_t, unint64_t, uint64_t))(v48 + 16);
    uint64_t v51 = v48 + 16;
    unint64_t v53 = (*(unsigned __int8 *)(v51 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 64);
    uint64_t v54 = *(void *)(v51 + 56);
    uint64_t v55 = v49;
    *(void *)&long long v139 = v52;
    v52(v22, v49 + v53, v9);
    if (OUTLINED_FUNCTION_4_26() == 1)
    {
      uint64_t v128 = MEMORY[0x263F8EE78];
      goto LABEL_13;
    }
    uint64_t v136 = v51 + 16;
    uint64_t v133 = *(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16);
    unint64_t v94 = v55 + v54 + v53;
    uint64_t v128 = MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v95 = v141;
      v133(v141, v22, v9);
      ConnectionInterfaceReport.init(interface:)(v95, v143);
      memcpy(v144, v143, 0x121uLL);
      if (DWORD1(v144[2]) == v140)
      {
        memcpy(v142, v144, 0x121uLL);
        destructiveProjectEnumData for ConnectionConfigurationError(v142);
        uint64_t v96 = v115;
        outlined init with take of ConnectionSnapshotReport?(v115, (uint64_t)v143, (uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
        outlined retain of ConnectionInterfaceReport((uint64_t)v144);
        outlined retain of ConnectionInterfaceReport?((uint64_t)v143, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))outlined consume of ConnectionInterfaceReport?);
        outlined init with take of ConnectionSnapshotReport?((uint64_t)v142, v96, (uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
        uint64_t v128 = v99;
      }
      unint64_t v97 = *(void *)(v128 + 16);
      if (v97 >= *(void *)(v128 + 24) >> 1)
      {
        specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
        uint64_t v128 = v100;
      }
      uint64_t v98 = v128;
      *(void *)(v128 + 16) = v97 + 1;
      memcpy((void *)(v98 + 296 * v97 + 32), v144, 0x121uLL);
      if (!--v50) {
        break;
      }
      ((void (*)(uint64_t, unint64_t, uint64_t))v139)(v22, v94, v9);
      v94 += v54;
      if (OUTLINED_FUNCTION_4_26() == 1) {
        goto LABEL_13;
      }
    }
  }
  else
  {
    uint64_t v128 = MEMORY[0x263F8EE78];
  }
  __swift_storeEnumTagSinglePayload(v22, 1, 1, v9);
LABEL_13:
  swift_bridgeObjectRelease();
  uint64_t v56 = v128;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&v148[21] = v56;
  uint64_t v57 = NWPath.gateways.getter();
  uint64_t v58 = *(void *)(v57 + 16);
  uint64_t v103 = v57;
  if (v58)
  {
    uint64_t v59 = *(void (**)(uint64_t, uint64_t, uint64_t))(v138 + 16);
    uint64_t v60 = v57 + ((*(unsigned __int8 *)(v138 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v138 + 80));
    uint64_t v132 = *(void *)(v138 + 72);
    uint64_t v133 = v59;
    int v131 = (uint64_t (**)(unsigned char *, uint64_t))(v138 + 88);
    int v130 = *MEMORY[0x263F14118];
    int v122 = *MEMORY[0x263F14110];
    int v116 = *MEMORY[0x263F14100];
    int v112 = *MEMORY[0x263F140E8];
    int v102 = *MEMORY[0x263F14108];
    uint64_t v136 = v138 + 8;
    v138 += 16;
    uint64_t v129 = v138 + 80;
    uint64_t v120 = (void (**)(uint64_t, unsigned char *, uint64_t))(v119 + 32);
    uint64_t v121 = (void (**)(uint64_t, unsigned char *, uint64_t))(v118 + 32);
    v119 += 8;
    uint64_t v61 = MEMORY[0x263F8EE78];
    v118 += 8;
    uint64_t v62 = v127;
    uint64_t v63 = v137;
    while (1)
    {
      uint64_t v64 = v133;
      v133((uint64_t)v63, v60, v13);
      v64((uint64_t)v62, (uint64_t)v63, v13);
      int v65 = (*v131)(v62, v13);
      uint64_t v140 = v60;
      uint64_t v141 = v58;
      if (v65 == v130)
      {
        uint64_t v66 = OUTLINED_FUNCTION_1_40();
        v67(v66);
        uint64_t v68 = &v62[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (host: NWEndpoint.Host, port: NWEndpoint.Port))
                          + 48)];
        (*v121)(v123, v62, v124);
        (*v120)(v125, v68, v126);
        uint64_t v69 = NWEndpoint.Host.debugDescription.getter();
        unint64_t v71 = v70;
        LODWORD(v68) = (unsigned __int16)NWEndpoint.Port.rawValue.getter();
        OUTLINED_FUNCTION_12_2();
        v72();
        uint64_t v62 = v127;
        OUTLINED_FUNCTION_12_2();
        v73();
        *(void *)&long long v74 = v68 | 0x100000000;
      }
      else if (v65 == v122)
      {
        uint64_t v75 = OUTLINED_FUNCTION_1_40();
        v76(v75);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (name: String, type: String, domain: String, interface: NWInterface?));
        outlined destroy of NWConnection.EstablishmentReport?((uint64_t)&v62[*(int *)(v77 + 80)], (uint64_t *)&demangling cache variable for type metadata for NWInterface?);
        uint64_t v69 = 0;
        unint64_t v71 = 0xE000000000000000;
        *(void *)&long long v74 = 0x300000000;
      }
      else
      {
        if (v65 == v116)
        {
          uint64_t v78 = OUTLINED_FUNCTION_1_40();
          v79(v78);
          swift_bridgeObjectRelease();
        }
        else
        {
          if (v65 == v112)
          {
            OUTLINED_FUNCTION_12_2();
            v80();
            uint64_t v69 = 0;
            unint64_t v71 = 0xE000000000000000;
            *(void *)&long long v74 = 0x400000000;
            goto LABEL_24;
          }
          if (v65 == v102)
          {
            uint64_t v85 = OUTLINED_FUNCTION_1_40();
            v86(v85);
            swift_unknownObjectRelease();
          }
          else
          {
            OUTLINED_FUNCTION_12_2();
            v87();
          }
        }
        uint64_t v69 = 0;
        unint64_t v71 = 0xE000000000000000;
        *(void *)&long long v74 = 0x500000000;
      }
LABEL_24:
      long long v139 = v74;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
        uint64_t v61 = v88;
      }
      unint64_t v81 = *(void *)(v61 + 16);
      if (v81 >= *(void *)(v61 + 24) >> 1)
      {
        specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
        uint64_t v61 = v89;
      }
      *(void *)(v61 + 16) = v81 + 1;
      uint64_t v82 = (void *)(v61 + 24 * v81);
      v82[4] = v69;
      v82[5] = v71;
      v82[6] = v139;
      uint64_t v63 = v137;
      OUTLINED_FUNCTION_12_2();
      v83();
      uint64_t v60 = v140 + v132;
      uint64_t v58 = v141 - 1;
      uint64_t v84 = v135;
      if (v141 == 1) {
        goto LABEL_34;
      }
    }
  }
  uint64_t v61 = MEMORY[0x263F8EE78];
  uint64_t v84 = v135;
LABEL_34:
  outlined destroy of NWConnection.EstablishmentReport?(v84, &demangling cache variable for type metadata for NWPath?);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_12_2();
  v90();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  outlined init with take of ConnectionSnapshotReport?(v115, (uint64_t)v142, (uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
  v143[1] = 0;
  v143[0] = 0;
  v143[2] = v109;
  v143[3] = v111;
  LOBYTE(v143[4]) = v108;
  BYTE1(v143[4]) = v107;
  BYTE2(v143[4]) = v106;
  BYTE3(v143[4]) = v105;
  BYTE4(v143[4]) = v104;
  outlined init with take of ConnectionSnapshotReport?((uint64_t)v142, (uint64_t)&v143[5], (uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
  v143[42] = v128;
  v143[43] = v61;
  v143[44] = v110;
  outlined retain of ConnectionInterfaceReport?((uint64_t)v142, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))outlined copy of ConnectionInterfaceReport?);
  outlined retain of ConnectionPreparationReport(v143);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined retain of ConnectionInterfaceReport?((uint64_t)v142, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))outlined consume of ConnectionInterfaceReport?);
  swift_bridgeObjectRelease();
  uint64_t v91 = v114;
  memcpy(v114, v143, 0x168uLL);
  destructiveProjectEnumData for ConnectionConfigurationError(v91);
  uint64_t v92 = *(void *)&v148[21];
  uint64_t v93 = *(void *)&v148[22];
  v144[0] = v148[0];
  v144[1] = v148[1];
  LODWORD(v144[2]) = v148[2];
  BYTE4(v144[2]) = BYTE4(v148[2]);
  outlined init with take of ConnectionSnapshotReport?((uint64_t)v142, (uint64_t)&v144[2] + 8, (uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
  uint64_t v145 = v92;
  uint64_t v146 = v61;
  uint64_t v147 = v93;
  return outlined release of ConnectionPreparationReport(v144);
}

uint64_t outlined init with copy of NWPath?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NWPath?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined retain of ConnectionInterfaceReport?(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v7 = *(unsigned char *)(a1 + 288);
  long long v5 = *(_OWORD *)(a1 + 240);
  long long v6 = *(_OWORD *)(a1 + 256);
  long long v4 = *(_OWORD *)(a1 + 208);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    v4,
    *((void *)&v4 + 1),
    *(void *)(a1 + 224),
    *(void *)(a1 + 232),
    v5,
    *((void *)&v5 + 1),
    v6,
    *((void *)&v6 + 1),
    *(void *)(a1 + 272),
    *(void *)(a1 + 280),
    v7);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_40()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_26()
{
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

void ConnectionConfiguration.resolvedURL.getter()
{
  OUTLINED_FUNCTION_22();
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URLComponents?);
  uint64_t v6 = OUTLINED_FUNCTION_19_1(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_0_1();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = type metadata accessor for URLComponents();
  OUTLINED_FUNCTION_0_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_2();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URL?);
  uint64_t v15 = OUTLINED_FUNCTION_19_1(v14);
  MEMORY[0x270FA5388](v15);
  uint64_t v16 = OUTLINED_FUNCTION_12_12();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_27_1();
  if (v0[51] == 1) {
    goto LABEL_20;
  }
  uint64_t v33 = v4;
  uint64_t v18 = v0[58];
  if (v0[56])
  {
    swift_bridgeObjectRetain();
    v19._uint64_t countAndFlagsBits = OUTLINED_FUNCTION_1_12();
    if (String.hasSuffix(_:)(v19)) {
      goto LABEL_11;
    }
    v20._uint64_t countAndFlagsBits = 3028785;
    v20._object = (void *)0xE300000000000000;
    if (String.hasPrefix(_:)(v20)) {
      goto LABEL_11;
    }
    swift_bridgeObjectRelease();
  }
  if (!v18) {
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
  v21._uint64_t countAndFlagsBits = OUTLINED_FUNCTION_1_12();
  if (String.hasSuffix(_:)(v21))
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v22._uint64_t countAndFlagsBits = 3028785;
  v22._object = (void *)0xE300000000000000;
  Swift::Bool v32 = String.hasPrefix(_:)(v22);
  swift_bridgeObjectRelease();
  if (!v32)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
LABEL_11:
  URL.init(string:)();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_30(v2, 1, v16);
  if (v26)
  {
    uint64_t v23 = (uint64_t *)&demangling cache variable for type metadata for URL?;
    uint64_t v24 = v2;
LABEL_17:
    outlined destroy of RPCOspreyConnectionProtocol?(v24, v23);
LABEL_19:
    uint64_t v4 = v33;
LABEL_20:
    __swift_storeEnumTagSinglePayload(v4, 1, 1, v16);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_20_1();
  v25();
  URLComponents.init(url:resolvingAgainstBaseURL:)();
  OUTLINED_FUNCTION_2_30(v9, 1, v10);
  if (v26)
  {
    uint64_t v27 = OUTLINED_FUNCTION_16_10();
    v28(v27);
    uint64_t v23 = (uint64_t *)&demangling cache variable for type metadata for URLComponents?;
    uint64_t v24 = v9;
    goto LABEL_17;
  }
  OUTLINED_FUNCTION_20_1();
  v29();
  URLComponents.url.getter();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v10);
  uint64_t v30 = OUTLINED_FUNCTION_16_10();
  v31(v30);
LABEL_21:
  OUTLINED_FUNCTION_29();
}

void ConnectionConfiguration.usingTLS.getter()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URLComponents?);
  uint64_t v4 = OUTLINED_FUNCTION_19_1(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for URLComponents();
  OUTLINED_FUNCTION_0_0();
  v47[3] = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_18_0();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URL?);
  uint64_t v12 = OUTLINED_FUNCTION_19_1(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_10_15();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v47 - v14;
  uint64_t v16 = type metadata accessor for URL();
  OUTLINED_FUNCTION_0_0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_38();
  MEMORY[0x270FA5388](v20);
  if (*(void *)(v0 + 408) == 1) {
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_13_12();
  uint64_t v48 = v22;
  uint64_t v49 = v21;
  long long v23 = *(_OWORD *)(v0 + 432);
  long long v50 = *(_OWORD *)(v0 + 416);
  long long v51 = v23;
  long long v52 = *(_OWORD *)(v0 + 448);
  uint64_t v53 = v24;
  char v54 = v25 & 1;
  long long v55 = *(_OWORD *)(v0 + 480);
  char v56 = v26;
  uint64_t v57 = v27;
  char v58 = v28 & 1;
  char v59 = v29;
  ConnectionPolicyRoute.routeHost.getter();
  if (!v30) {
    goto LABEL_10;
  }
  URL.init(string:)();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_30(v2, 1, v16);
  if (v35)
  {
    uint64_t v31 = (uint64_t *)&demangling cache variable for type metadata for URL?;
    uint64_t v32 = v2;
LABEL_9:
    outlined destroy of RPCOspreyConnectionProtocol?(v32, v31);
LABEL_10:
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v16);
LABEL_11:
    outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v15, (uint64_t *)&demangling cache variable for type metadata for URL?);
    goto LABEL_12;
  }
  uint64_t v33 = v2;
  uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32);
  v34(v1, v33, v16);
  URLComponents.init(url:resolvingAgainstBaseURL:)();
  OUTLINED_FUNCTION_2_30(v7, 1, v8);
  if (v35)
  {
    OUTLINED_FUNCTION_5_23();
    v36();
    uint64_t v31 = (uint64_t *)&demangling cache variable for type metadata for URLComponents?;
    uint64_t v32 = v7;
    goto LABEL_9;
  }
  v47[1] = v34;
  v47[2] = v18 + 32;
  OUTLINED_FUNCTION_17_6();
  OUTLINED_FUNCTION_20_1();
  v37();
  URLComponents.url.getter();
  uint64_t v38 = OUTLINED_FUNCTION_21_7();
  v39(v38);
  uint64_t v40 = *(void (**)(void))(v18 + 8);
  OUTLINED_FUNCTION_5_23();
  v40();
  OUTLINED_FUNCTION_2_30((uint64_t)v15, 1, v16);
  if (v41) {
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_20_1();
  v42();
  uint64_t v43 = URL.scheme.getter();
  if (v44)
  {
    uint64_t v48 = v43;
    uint64_t v49 = v44;
    OUTLINED_FUNCTION_27_7();
    v47[4] = v45;
    v47[5] = v46;
    lazy protocol witness table accessor for type String and conformance String();
    StringProtocol.caseInsensitiveCompare<A>(_:)();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_5_23();
  v40();
LABEL_12:
  OUTLINED_FUNCTION_29();
}

uint64_t ConnectionConfiguration.connectionId.getter()
{
  if (v0[51] == 1 || v0[53] == 0)
  {
    uint64_t v2 = v0[6];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = v0[52];
    swift_bridgeObjectRetain();
  }
  return v2;
}

void ConnectionConfiguration.resolvedHost.getter()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URLComponents?);
  uint64_t v4 = OUTLINED_FUNCTION_19_1(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_2();
  uint64_t v5 = type metadata accessor for URLComponents();
  OUTLINED_FUNCTION_0_0();
  uint64_t v29 = v6;
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = OUTLINED_FUNCTION_12_12();
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_0_1();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URL?);
  uint64_t v13 = OUTLINED_FUNCTION_19_1(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_10_15();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v29 - v15;
  memcpy(v40, v0, 0x204uLL);
  if (*((void *)&v40[25] + 1) == 1)
  {
    outlined retain of ConnectionConfiguration(v40);
  }
  else
  {
    long long v30 = v40[25];
    long long v31 = v40[26];
    long long v32 = v40[27];
    long long v33 = v40[28];
    uint64_t v34 = *(void *)&v40[29];
    char v35 = BYTE8(v40[29]) & 1;
    long long v36 = v40[30];
    char v37 = v40[31];
    uint64_t v38 = *((void *)&v40[31] + 1);
    __int16 v39 = v40[32] & 0xFF01;
    outlined retain of ConnectionConfiguration(v40);
    ConnectionPolicyRoute.routeHost.getter();
    if (v17)
    {
      URL.init(string:)();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_2_30(v2, 1, v8);
      if (v21)
      {
        uint64_t v18 = (uint64_t *)&demangling cache variable for type metadata for URL?;
        uint64_t v19 = v2;
      }
      else
      {
        OUTLINED_FUNCTION_20_1();
        v20();
        URLComponents.init(url:resolvingAgainstBaseURL:)();
        OUTLINED_FUNCTION_2_30(v1, 1, v5);
        if (!v21)
        {
          OUTLINED_FUNCTION_17_6();
          OUTLINED_FUNCTION_20_1();
          v24();
          URLComponents.url.getter();
          uint64_t v25 = OUTLINED_FUNCTION_21_7();
          v26(v25);
          uint64_t v27 = OUTLINED_FUNCTION_9_14();
          v28(v27);
          goto LABEL_12;
        }
        uint64_t v22 = OUTLINED_FUNCTION_9_14();
        v23(v22);
        uint64_t v18 = (uint64_t *)&demangling cache variable for type metadata for URLComponents?;
        uint64_t v19 = v1;
      }
      outlined destroy of RPCOspreyConnectionProtocol?(v19, v18);
    }
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, v8);
LABEL_12:
  outlined release of ConnectionConfiguration(v40);
  OUTLINED_FUNCTION_2_30((uint64_t)v16, 1, v8);
  if (v21)
  {
    outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v16, (uint64_t *)&demangling cache variable for type metadata for URL?);
  }
  else
  {
    URL.host.getter();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v8);
  }
  OUTLINED_FUNCTION_29();
}

Swift::String __swiftcall ConnectionProtocolTechnology.provider()()
{
  uint64_t v1 = v0;
  unint64_t v2 = 0xD000000000000017;
  if (v1 == 1)
  {
    uint64_t v3 = "sirinetworknwconnection";
  }
  else
  {
    if (v1 != 2)
    {
      unint64_t v2 = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      goto LABEL_7;
    }
    unint64_t v2 = 0xD00000000000001ELL;
    uint64_t v3 = "sirinetworkrpcospreyconnection";
  }
  uint64_t v4 = (void *)((unint64_t)(v3 - 32) | 0x8000000000000000);
LABEL_7:
  result._object = v4;
  result._uint64_t countAndFlagsBits = v2;
  return result;
}

uint64_t ConnectionConfiguration.connectionId.setter()
{
  OUTLINED_FUNCTION_2_12();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = v2;
  *(void *)(v1 + 56) = v0;
  return result;
}

void ConnectionConfiguration.resolvedPort.getter()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URLComponents?);
  uint64_t v4 = OUTLINED_FUNCTION_19_1(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for URLComponents();
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_27_1();
  uint64_t v12 = type metadata accessor for URL();
  OUTLINED_FUNCTION_0_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_18_0();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URL?);
  uint64_t v17 = OUTLINED_FUNCTION_19_1(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_38();
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v44 - v19;
  if (*(void *)(v0 + 408) == 1) {
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_13_12();
  uint64_t v45 = v22;
  uint64_t v46 = v21;
  long long v23 = *(_OWORD *)(v0 + 432);
  long long v47 = *(_OWORD *)(v0 + 416);
  long long v48 = v23;
  long long v49 = *(_OWORD *)(v0 + 448);
  uint64_t v50 = v24;
  char v51 = v25 & 1;
  long long v52 = *(_OWORD *)(v0 + 480);
  char v53 = v26;
  uint64_t v54 = v27;
  char v55 = v28 & 1;
  char v56 = v29;
  ConnectionPolicyRoute.routeHost.getter();
  if (!v30) {
    goto LABEL_10;
  }
  URL.init(string:)();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_30(v2, 1, v12);
  if (v34)
  {
    long long v31 = (uint64_t *)&demangling cache variable for type metadata for URL?;
    uint64_t v32 = v2;
LABEL_9:
    outlined destroy of RPCOspreyConnectionProtocol?(v32, v31);
LABEL_10:
    __swift_storeEnumTagSinglePayload((uint64_t)v20, 1, 1, v12);
LABEL_11:
    outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v20, (uint64_t *)&demangling cache variable for type metadata for URL?);
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_17_6();
  OUTLINED_FUNCTION_20_1();
  v33();
  URLComponents.init(url:resolvingAgainstBaseURL:)();
  OUTLINED_FUNCTION_2_30(v7, 1, v8);
  if (v34)
  {
    OUTLINED_FUNCTION_14_9();
    v35();
    long long v31 = (uint64_t *)&demangling cache variable for type metadata for URLComponents?;
    uint64_t v32 = v7;
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_20_1();
  v36();
  URLComponents.url.getter();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v1, v8);
  char v37 = *(void (**)(void))(v14 + 8);
  OUTLINED_FUNCTION_14_9();
  v37();
  OUTLINED_FUNCTION_2_30((uint64_t)v20, 1, v12);
  if (v38) {
    goto LABEL_11;
  }
  uint64_t v39 = URL.scheme.getter();
  uint64_t v41 = v40;
  OUTLINED_FUNCTION_14_9();
  v37();
  if (v41)
  {
    uint64_t v45 = v39;
    uint64_t v46 = v41;
    OUTLINED_FUNCTION_27_7();
    v44[1] = v42;
    v44[2] = v43;
    lazy protocol witness table accessor for type String and conformance String();
    StringProtocol.caseInsensitiveCompare<A>(_:)();
    swift_bridgeObjectRelease();
  }
LABEL_12:
  OUTLINED_FUNCTION_29();
}

uint64_t ConnectionProtocolTechnology.init(rawValue:)(uint64_t a1)
{
  if (a1 == 2) {
    uint64_t v1 = 2;
  }
  else {
    uint64_t v1 = 0;
  }
  if (a1 == 1) {
    return 1;
  }
  else {
    return v1;
  }
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance ConnectionProtocolTechnology()
{
  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance ConnectionProtocolTechnology(int a1)
{
  specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance ConnectionProtocolTechnology(uint64_t a1)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance ConnectionProtocolTechnology@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = ConnectionProtocolTechnology.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

double static ConnectionConfiguration.default.getter@<D0>(uint64_t a1@<X8>)
{
  memset(v7, 0, sizeof(v7));
  v5[0] = xmmword_25D790AD0;
  memset(&v5[1], 0, 96);
  __int16 v6 = 0;
  int v2 = AFIsInternalInstall();
  char ShouldUseTFO = 0;
  if (v2) {
    char ShouldUseTFO = _AFPreferencesShouldUseTFO();
  }
  *(void *)&double result = ConnectionConfiguration.init(connectionProtocolTechnology:communicationProtocolTechnology:assistantIdentifier:peerAssistantIdentifier:internalConnectionId:remoteHost:languageCode:prefersWWAN:skipPeer:useWiFiHint:usesProxyConnection:skipPeerErrorReason:connectedByPOPMethod:forceReconnect:forceOnDeviceOnlyDictation:timeout:staleIntervalSeconds:productTypePrefix:peerType:peerVersion:useTFO:useTLSSessionTickets:keepAliveIdleTime:keepAliveIntervalTime:keepAliveUnackedCount:retransmissionBasedconnectionDropTime:openConnectionTimeoutTime:openSlowTimeoutTime:staleConnectionTime:imposePolicyBan:connectionPolicy:connectionPolicyRoute:deviceIsInWalkaboutExperimentGroup:usesPeerManagedSync:)(1, 1, 0, 0, 0, 0, 0, 0, a1, 90.0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
                         0,
                         0,
                         0,
                         1,
                         0,
                         (__n128)0,
                         0,
                         0,
                         ShouldUseTFO,
                         1,
                         0x4024000000000000,
                         0,
                         0x4000000000000000,
                         0,
                         3,
                         0,
                         0x4008000000000000,
                         0,
                         0x402E000000000000,
                         0,
                         0,
                         1,
                         0x4056800000000000,
                         0,
                         0,
                         v7,
                         v5,
                         0,
                         0).n128_u64[0];
  return result;
}

__n128 ConnectionConfiguration.init(connectionProtocolTechnology:communicationProtocolTechnology:assistantIdentifier:peerAssistantIdentifier:internalConnectionId:remoteHost:languageCode:prefersWWAN:skipPeer:useWiFiHint:usesProxyConnection:skipPeerErrorReason:connectedByPOPMethod:forceReconnect:forceOnDeviceOnlyDictation:timeout:staleIntervalSeconds:productTypePrefix:peerType:peerVersion:useTFO:useTLSSessionTickets:keepAliveIdleTime:keepAliveIntervalTime:keepAliveUnackedCount:retransmissionBasedconnectionDropTime:openConnectionTimeoutTime:openSlowTimeoutTime:staleConnectionTime:imposePolicyBan:connectionPolicy:connectionPolicyRoute:deviceIsInWalkaboutExperimentGroup:usesPeerManagedSync:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, long long a11, uint64_t a12, uint64_t a13, char a14, char a15, char a16, char a17, uint64_t a18, char a19, char a20,char a21,uint64_t a22,char a23,long long a24,__n128 a25,uint64_t a26,uint64_t a27,char a28,char a29,uint64_t a30,char a31,uint64_t a32,char a33,uint64_t a34,char a35,uint64_t a36,char a37,uint64_t a38,char a39,uint64_t a40,char a41,uint64_t a42,char a43,char a44,long long *a45,long long *a46,char a47,char a48)
{
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(void *)(a9 + 80) = a12;
  *(void *)(a9 + 88) = a13;
  *(unsigned char *)(a9 + 96) = a14;
  *(unsigned char *)(a9 + 97) = a15;
  *(unsigned char *)(a9 + 98) = a16;
  *(unsigned char *)(a9 + 99) = a17;
  *(void *)(a9 + 104) = a18;
  *(unsigned char *)(a9 + 112) = a19;
  *(unsigned char *)(a9 + 113) = a20;
  *(unsigned char *)(a9 + 114) = a21;
  *(void *)(a9 + 120) = a22;
  *(unsigned char *)(a9 + 128) = a23 & 1;
  *(void *)(a9 + 136) = 0x4056800000000000;
  *(void *)(a9 + 184) = a26;
  *(void *)(a9 + 192) = a27;
  *(unsigned char *)(a9 + 200) = a28;
  *(unsigned char *)(a9 + 201) = a29;
  *(void *)(a9 + 208) = a30;
  *(unsigned char *)(a9 + 216) = a31 & 1;
  *(void *)(a9 + 224) = a32;
  *(unsigned char *)(a9 + 232) = a33 & 1;
  *(void *)(a9 + 240) = a34;
  *(unsigned char *)(a9 + 248) = a35 & 1;
  *(void *)(a9 + 256) = a36;
  *(unsigned char *)(a9 + 264) = a37 & 1;
  *(void *)(a9 + 272) = a38;
  *(unsigned char *)(a9 + 280) = a39 & 1;
  *(void *)(a9 + 288) = a40;
  *(unsigned char *)(a9 + 296) = a41 & 1;
  *(void *)(a9 + 304) = a42;
  *(unsigned char *)(a9 + 312) = a43 & 1;
  *(unsigned char *)(a9 + 313) = a44;
  long long v48 = *a45;
  long long v49 = a45[1];
  long long v50 = a45[2];
  long long v51 = a45[3];
  long long v52 = a45[4];
  long long v53 = *a46;
  long long v54 = a46[1];
  long long v55 = a46[2];
  long long v56 = a46[3];
  long long v57 = a46[4];
  long long v58 = a46[5];
  long long v59 = a46[6];
  *(_WORD *)(a9 + 512) = *((_WORD *)a46 + 56);
  *(unsigned char *)(a9 + 514) = a47;
  *(unsigned char *)(a9 + 515) = a48;
  *(_OWORD *)(a9 + 64) = a11;
  *(double *)(a9 + 144) = a10;
  *(_OWORD *)(a9 + 152) = a24;
  __n128 result = a25;
  *(__n128 *)(a9 + 168) = a25;
  *(_OWORD *)(a9 + 320) = v48;
  *(_OWORD *)(a9 + 336) = v49;
  *(_OWORD *)(a9 + 352) = v50;
  *(_OWORD *)(a9 + 368) = v51;
  *(_OWORD *)(a9 + 384) = v52;
  *(_OWORD *)(a9 + 400) = v53;
  *(_OWORD *)(a9 + 416) = v54;
  *(_OWORD *)(a9 + 432) = v55;
  *(_OWORD *)(a9 + 448) = v56;
  *(_OWORD *)(a9 + 464) = v57;
  *(_OWORD *)(a9 + 480) = v58;
  *(_OWORD *)(a9 + 496) = v59;
  return result;
}

uint64_t ConnectionConfiguration.connectionProtocolTechnology.getter()
{
  return *(void *)v0;
}

uint64_t ConnectionConfiguration.connectionProtocolTechnology.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*ConnectionConfiguration.connectionProtocolTechnology.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.communicationProtocolTechnology.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t ConnectionConfiguration.communicationProtocolTechnology.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.communicationProtocolTechnology.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.assistantIdentifier.getter()
{
  return OUTLINED_FUNCTION_23_0();
}

uint64_t ConnectionConfiguration.assistantIdentifier.setter()
{
  OUTLINED_FUNCTION_2_12();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*ConnectionConfiguration.assistantIdentifier.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.peerAssistantIdentifier.getter()
{
  return OUTLINED_FUNCTION_23_0();
}

uint64_t ConnectionConfiguration.peerAssistantIdentifier.setter()
{
  OUTLINED_FUNCTION_2_12();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v0;
  return result;
}

uint64_t (*ConnectionConfiguration.peerAssistantIdentifier.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t key path setter for ConnectionConfiguration.connectionId : ConnectionConfiguration()
{
  return ConnectionConfiguration.connectionId.setter();
}

uint64_t (*ConnectionConfiguration.connectionId.modify(void *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  uint64_t v3 = v1[53];
  if (v1[51] == 1 || v3 == 0)
  {
    uint64_t v5 = v1 + 6;
    uint64_t v6 = v1[6];
    uint64_t v3 = v5[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = v1[52];
    swift_bridgeObjectRetain();
  }
  *a1 = v6;
  a1[1] = v3;
  return ConnectionConfiguration.connectionId.modify;
}

uint64_t ConnectionConfiguration.connectionId.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = *a1;
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v3 + 48) = v4;
    *(void *)(v3 + 56) = v2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v3 + 48) = v4;
    *(void *)(v3 + 56) = v2;
  }
  return result;
}

uint64_t ConnectionConfiguration.remoteHost.getter()
{
  return OUTLINED_FUNCTION_23_0();
}

uint64_t ConnectionConfiguration.remoteHost.setter()
{
  OUTLINED_FUNCTION_2_12();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 64) = v2;
  *(void *)(v1 + 72) = v0;
  return result;
}

uint64_t (*ConnectionConfiguration.remoteHost.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.languageCode.getter()
{
  return OUTLINED_FUNCTION_23_0();
}

uint64_t ConnectionConfiguration.languageCode.setter()
{
  OUTLINED_FUNCTION_2_12();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = v2;
  *(void *)(v1 + 88) = v0;
  return result;
}

uint64_t (*ConnectionConfiguration.languageCode.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.prefersWWAN.getter()
{
  return *(unsigned __int8 *)(v0 + 96);
}

uint64_t ConnectionConfiguration.prefersWWAN.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 96) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.prefersWWAN.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.skipPeer.getter()
{
  return *(unsigned __int8 *)(v0 + 97);
}

uint64_t ConnectionConfiguration.skipPeer.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 97) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.skipPeer.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.useWiFiHint.getter()
{
  return *(unsigned __int8 *)(v0 + 98);
}

uint64_t ConnectionConfiguration.useWiFiHint.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 98) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.useWiFiHint.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.usesProxyConnection.getter()
{
  return *(unsigned __int8 *)(v0 + 99);
}

uint64_t ConnectionConfiguration.usesProxyConnection.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 99) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.usesProxyConnection.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

void *ConnectionConfiguration.skipPeerErrorReason.getter()
{
  uint64_t v1 = *(void **)(v0 + 104);
  id v2 = v1;
  return v1;
}

void ConnectionConfiguration.skipPeerErrorReason.setter(uint64_t a1)
{
  *(void *)(v1 + 104) = a1;
}

uint64_t (*ConnectionConfiguration.skipPeerErrorReason.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.connectedByPOPMethod.getter()
{
  return *(unsigned __int8 *)(v0 + 112);
}

uint64_t ConnectionConfiguration.connectedByPOPMethod.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 112) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.connectedByPOPMethod.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.forceReconnect.getter()
{
  return *(unsigned __int8 *)(v0 + 113);
}

uint64_t ConnectionConfiguration.forceReconnect.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 113) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.forceReconnect.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.forceOnDeviceOnlyDictation.getter()
{
  return *(unsigned __int8 *)(v0 + 114);
}

uint64_t ConnectionConfiguration.forceOnDeviceOnlyDictation.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 114) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.forceOnDeviceOnlyDictation.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.timeout.getter()
{
  return *(void *)(v0 + 120);
}

uint64_t ConnectionConfiguration.timeout.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 120) = result;
  *(unsigned char *)(v2 + 128) = a2 & 1;
  return result;
}

uint64_t (*ConnectionConfiguration.timeout.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.productTypePrefix.getter()
{
  return OUTLINED_FUNCTION_23_0();
}

uint64_t ConnectionConfiguration.productTypePrefix.setter()
{
  OUTLINED_FUNCTION_2_12();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 152) = v2;
  *(void *)(v1 + 160) = v0;
  return result;
}

uint64_t (*ConnectionConfiguration.productTypePrefix.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.peerType.getter()
{
  return OUTLINED_FUNCTION_23_0();
}

uint64_t ConnectionConfiguration.peerType.setter()
{
  OUTLINED_FUNCTION_2_12();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 168) = v2;
  *(void *)(v1 + 176) = v0;
  return result;
}

uint64_t (*ConnectionConfiguration.peerType.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.peerVersion.getter()
{
  return OUTLINED_FUNCTION_23_0();
}

uint64_t ConnectionConfiguration.peerVersion.setter()
{
  OUTLINED_FUNCTION_2_12();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 184) = v2;
  *(void *)(v1 + 192) = v0;
  return result;
}

uint64_t (*ConnectionConfiguration.peerVersion.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.imposePolicyBan.getter()
{
  return *(unsigned __int8 *)(v0 + 313);
}

uint64_t ConnectionConfiguration.imposePolicyBan.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 313) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.imposePolicyBan.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.connectionPolicy.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_24_4();
  uint64_t v9 = OUTLINED_FUNCTION_15_8(v0, v1, v2, v3, v4, v5, v6, v7, v8);
  return outlined copy of ConnectionPolicy?(v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
}

__n128 ConnectionConfiguration.connectionPolicy.setter(long long *a1)
{
  long long v16 = *a1;
  long long v14 = a1[2];
  long long v15 = a1[1];
  __n128 v13 = (__n128)a1[3];
  uint64_t v2 = *((void *)a1 + 8);
  uint64_t v3 = *((void *)a1 + 9);
  uint64_t v4 = OUTLINED_FUNCTION_24_4();
  outlined consume of ConnectionPolicy?(v4, v5, v6, v7, v8, v9, v10, v11, *(void *)(v1 + 384), *(void *)(v1 + 392));
  *(_OWORD *)(v1 + 320) = v16;
  *(_OWORD *)(v1 + 336) = v15;
  __n128 result = v13;
  *(_OWORD *)(v1 + 352) = v14;
  *(__n128 *)(v1 + 368) = v13;
  *(void *)(v1 + 384) = v2;
  *(void *)(v1 + 392) = v3;
  return result;
}

uint64_t (*ConnectionConfiguration.connectionPolicy.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.connectionPolicyRoute.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_25_6();
  uint64_t v9 = OUTLINED_FUNCTION_15_8(v0, v1, v2, v3, v4, v5, v6, v7, v8);
  *(void *)(v10 + 80) = v11;
  *(void *)(v10 + 88) = v12;
  *(void *)(v10 + 96) = v13;
  *(void *)(v10 + 104) = v14;
  *(_WORD *)(v10 + 112) = v15;
  return outlined copy of ConnectionPolicyRoute?(v9, v16);
}

__n128 ConnectionConfiguration.connectionPolicyRoute.setter(long long *a1)
{
  long long v12 = a1[1];
  long long v13 = *a1;
  long long v11 = a1[2];
  long long v9 = a1[4];
  long long v10 = a1[3];
  __n128 v8 = (__n128)a1[5];
  uint64_t v2 = *((void *)a1 + 12);
  uint64_t v3 = *((void *)a1 + 13);
  __int16 v4 = *((_WORD *)a1 + 56);
  uint64_t v5 = OUTLINED_FUNCTION_25_6();
  outlined consume of ConnectionPolicyRoute?(v5, v6);
  *(_OWORD *)(v1 + 400) = v13;
  *(_OWORD *)(v1 + 416) = v12;
  *(_OWORD *)(v1 + 432) = v11;
  *(_OWORD *)(v1 + 448) = v10;
  __n128 result = v8;
  *(_OWORD *)(v1 + 464) = v9;
  *(__n128 *)(v1 + 480) = v8;
  *(void *)(v1 + 496) = v2;
  *(void *)(v1 + 504) = v3;
  *(_WORD *)(v1 + 512) = v4;
  return result;
}

uint64_t (*ConnectionConfiguration.connectionPolicyRoute.modify())(void)
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

unint64_t lazy protocol witness table accessor for type ConnectionProtocolTechnology and conformance ConnectionProtocolTechnology()
{
  unint64_t result = lazy protocol witness table cache variable for type ConnectionProtocolTechnology and conformance ConnectionProtocolTechnology;
  if (!lazy protocol witness table cache variable for type ConnectionProtocolTechnology and conformance ConnectionProtocolTechnology)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ConnectionProtocolTechnology and conformance ConnectionProtocolTechnology);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CommunicationProtocolTechnology and conformance CommunicationProtocolTechnology()
{
  unint64_t result = lazy protocol witness table cache variable for type CommunicationProtocolTechnology and conformance CommunicationProtocolTechnology;
  if (!lazy protocol witness table cache variable for type CommunicationProtocolTechnology and conformance CommunicationProtocolTechnology)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CommunicationProtocolTechnology and conformance CommunicationProtocolTechnology);
  }
  return result;
}

uint64_t sub_25D78AB14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ConnectionConfiguration.connectionId.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for ConnectionProtocolTechnology()
{
}

void type metadata accessor for CommunicationProtocolTechnology()
{
}

uint64_t destroy for ConnectionConfiguration(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 392))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t result = *(void *)(a1 + 408);
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for ConnectionConfiguration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  long long v9 = *(void **)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v10 = v9;
  *(void *)(a1 + 104) = v9;
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(_WORD *)(a1 + 113) = *(_WORD *)(a2 + 113);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  uint64_t v11 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v11;
  uint64_t v12 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v12;
  uint64_t v13 = *(void *)(a2 + 192);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = v13;
  *(_WORD *)(a1 + 200) = *(_WORD *)(a2 + 200);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 248) = *(unsigned char *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(unsigned char *)(a1 + 264) = *(unsigned char *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(unsigned char *)(a1 + 280) = *(unsigned char *)(a2 + 280);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(unsigned char *)(a1 + 296) = *(unsigned char *)(a2 + 296);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(_WORD *)(a1 + 312) = *(_WORD *)(a2 + 312);
  uint64_t v14 = *(void *)(a2 + 392);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v14)
  {
    uint64_t v15 = *(void *)(a2 + 328);
    *(void *)(a1 + 320) = *(void *)(a2 + 320);
    *(void *)(a1 + 328) = v15;
    *(_DWORD *)(a1 + 336) = *(_DWORD *)(a2 + 336);
    *(_WORD *)(a1 + 340) = *(_WORD *)(a2 + 340);
    *(void *)(a1 + 344) = *(void *)(a2 + 344);
    *(unsigned char *)(a1 + 352) = *(unsigned char *)(a2 + 352);
    *(void *)(a1 + 360) = *(void *)(a2 + 360);
    *(unsigned char *)(a1 + 368) = *(unsigned char *)(a2 + 368);
    uint64_t v16 = *(void *)(a2 + 376);
    *(unsigned char *)(a1 + 384) = *(unsigned char *)(a2 + 384);
    *(void *)(a1 + 376) = v16;
    *(void *)(a1 + 392) = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    memcpy((void *)(a1 + 320), (const void *)(a2 + 320), 0x50uLL);
  }
  uint64_t v17 = *(void *)(a2 + 408);
  if (v17 == 1)
  {
    memcpy((void *)(a1 + 400), (const void *)(a2 + 400), 0x72uLL);
  }
  else
  {
    *(void *)(a1 + 400) = *(void *)(a2 + 400);
    *(void *)(a1 + 408) = v17;
    uint64_t v18 = *(void *)(a2 + 424);
    *(void *)(a1 + 416) = *(void *)(a2 + 416);
    *(void *)(a1 + 424) = v18;
    *(_OWORD *)(a1 + 432) = *(_OWORD *)(a2 + 432);
    uint64_t v19 = *(void *)(a2 + 456);
    *(void *)(a1 + 448) = *(void *)(a2 + 448);
    *(void *)(a1 + 456) = v19;
    *(void *)(a1 + 464) = *(void *)(a2 + 464);
    *(unsigned char *)(a1 + 472) = *(unsigned char *)(a2 + 472);
    uint64_t v20 = *(void *)(a2 + 488);
    *(void *)(a1 + 480) = *(void *)(a2 + 480);
    *(void *)(a1 + 488) = v20;
    *(unsigned char *)(a1 + 496) = *(unsigned char *)(a2 + 496);
    *(void *)(a1 + 504) = *(void *)(a2 + 504);
    *(_WORD *)(a1 + 512) = *(_WORD *)(a2 + 512);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  *(_WORD *)(a1 + 514) = *(_WORD *)(a2 + 514);
  return a1;
}

uint64_t assignWithCopy for ConnectionConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (unsigned char *)(a2 + 313);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(unsigned char *)(a1 + 97) = *(unsigned char *)(a2 + 97);
  *(unsigned char *)(a1 + 98) = *(unsigned char *)(a2 + 98);
  *(unsigned char *)(a1 + 99) = *(unsigned char *)(a2 + 99);
  uint64_t v5 = *(void **)(a1 + 104);
  uint64_t v6 = *(void **)(a2 + 104);
  id v7 = v6;
  *(void *)(a1 + 104) = v6;

  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(unsigned char *)(a1 + 113) = *(unsigned char *)(a2 + 113);
  *(unsigned char *)(a1 + 114) = *(unsigned char *)(a2 + 114);
  uint64_t v8 = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 120) = v8;
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 200) = *(unsigned char *)(a2 + 200);
  *(unsigned char *)(a1 + 201) = *(unsigned char *)(a2 + 201);
  uint64_t v9 = *(void *)(a2 + 208);
  *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
  *(void *)(a1 + 208) = v9;
  uint64_t v10 = *(void *)(a2 + 224);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(void *)(a1 + 224) = v10;
  uint64_t v11 = *(void *)(a2 + 240);
  *(unsigned char *)(a1 + 248) = *(unsigned char *)(a2 + 248);
  *(void *)(a1 + 240) = v11;
  uint64_t v12 = *(void *)(a2 + 256);
  *(unsigned char *)(a1 + 264) = *(unsigned char *)(a2 + 264);
  *(void *)(a1 + 256) = v12;
  uint64_t v13 = *(void *)(a2 + 272);
  *(unsigned char *)(a1 + 280) = *(unsigned char *)(a2 + 280);
  *(void *)(a1 + 272) = v13;
  uint64_t v14 = *(void *)(a2 + 288);
  *(unsigned char *)(a1 + 296) = *(unsigned char *)(a2 + 296);
  *(void *)(a1 + 288) = v14;
  uint64_t v15 = *(void *)(a2 + 304);
  *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
  *(void *)(a1 + 304) = v15;
  *(unsigned char *)(a1 + 313) = *(unsigned char *)(a2 + 313);
  uint64_t v16 = *(void *)(a2 + 392);
  if (*(void *)(a1 + 392))
  {
    if (v16)
    {
      *(void *)(a1 + 320) = *(void *)(a2 + 320);
      *(void *)(a1 + 328) = *(void *)(a2 + 328);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 336) = v4[23];
      *(unsigned char *)(a1 + 337) = v4[24];
      *(unsigned char *)(a1 + 338) = v4[25];
      *(unsigned char *)(a1 + 339) = v4[26];
      *(unsigned char *)(a1 + 340) = v4[27];
      *(unsigned char *)(a1 + 341) = v4[28];
      uint64_t v17 = *(void *)(a2 + 344);
      *(unsigned char *)(a1 + 352) = *(unsigned char *)(a2 + 352);
      *(void *)(a1 + 344) = v17;
      uint64_t v18 = *(void *)(a2 + 360);
      *(unsigned char *)(a1 + 368) = *(unsigned char *)(a2 + 368);
      *(void *)(a1 + 360) = v18;
      uint64_t v19 = *(void *)(a2 + 376);
      *(unsigned char *)(a1 + 384) = *(unsigned char *)(a2 + 384);
      *(void *)(a1 + 376) = v19;
      *(void *)(a1 + 392) = *(void *)(a2 + 392);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    outlined destroy of ConnectionPolicy(a1 + 320);
  }
  else if (v16)
  {
    *(void *)(a1 + 320) = *(void *)(a2 + 320);
    *(void *)(a1 + 328) = *(void *)(a2 + 328);
    *(unsigned char *)(a1 + 336) = *(unsigned char *)(a2 + 336);
    *(unsigned char *)(a1 + 337) = *(unsigned char *)(a2 + 337);
    *(unsigned char *)(a1 + 338) = *(unsigned char *)(a2 + 338);
    *(unsigned char *)(a1 + 339) = *(unsigned char *)(a2 + 339);
    *(unsigned char *)(a1 + 340) = *(unsigned char *)(a2 + 340);
    *(unsigned char *)(a1 + 341) = *(unsigned char *)(a2 + 341);
    uint64_t v20 = *(void *)(a2 + 344);
    *(unsigned char *)(a1 + 352) = *(unsigned char *)(a2 + 352);
    *(void *)(a1 + 344) = v20;
    uint64_t v21 = *(void *)(a2 + 360);
    *(unsigned char *)(a1 + 368) = *(unsigned char *)(a2 + 368);
    *(void *)(a1 + 360) = v21;
    uint64_t v22 = *(void *)(a2 + 376);
    *(unsigned char *)(a1 + 384) = *(unsigned char *)(a2 + 384);
    *(void *)(a1 + 376) = v22;
    *(void *)(a1 + 392) = *(void *)(a2 + 392);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_8;
  }
  memcpy((void *)(a1 + 320), (const void *)(a2 + 320), 0x50uLL);
LABEL_8:
  uint64_t v23 = *(void *)(a2 + 408);
  if (*(void *)(a1 + 408) != 1)
  {
    if (v23 != 1)
    {
      *(void *)(a1 + 400) = *(void *)(a2 + 400);
      *(void *)(a1 + 408) = *(void *)(a2 + 408);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 416) = *(void *)(a2 + 416);
      *(void *)(a1 + 424) = *(void *)(a2 + 424);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 432) = *(void *)(a2 + 432);
      *(void *)(a1 + 440) = *(void *)(a2 + 440);
      *(void *)(a1 + 448) = *(void *)(a2 + 448);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 456) = *(void *)(a2 + 456);
      *(void *)(a1 + 464) = *(void *)(a2 + 464);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 472) = v4[159];
      *(void *)(a1 + 480) = *(void *)(a2 + 480);
      *(void *)(a1 + 488) = *(void *)(a2 + 488);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 496) = *(unsigned char *)(a2 + 496);
      uint64_t v25 = *(void *)(a2 + 504);
      *(unsigned char *)(a1 + 512) = *(unsigned char *)(a2 + 512);
      *(void *)(a1 + 504) = v25;
      *(unsigned char *)(a1 + 513) = *(unsigned char *)(a2 + 513);
      goto LABEL_15;
    }
    outlined destroy of ConnectionPolicyRoute(a1 + 400);
    goto LABEL_13;
  }
  if (v23 == 1)
  {
LABEL_13:
    memcpy((void *)(a1 + 400), (const void *)(a2 + 400), 0x72uLL);
    goto LABEL_15;
  }
  *(void *)(a1 + 400) = *(void *)(a2 + 400);
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  *(void *)(a1 + 416) = *(void *)(a2 + 416);
  *(void *)(a1 + 424) = *(void *)(a2 + 424);
  *(void *)(a1 + 432) = *(void *)(a2 + 432);
  *(void *)(a1 + 440) = *(void *)(a2 + 440);
  *(void *)(a1 + 448) = *(void *)(a2 + 448);
  *(void *)(a1 + 456) = *(void *)(a2 + 456);
  *(void *)(a1 + 464) = *(void *)(a2 + 464);
  *(unsigned char *)(a1 + 472) = *(unsigned char *)(a2 + 472);
  *(void *)(a1 + 480) = *(void *)(a2 + 480);
  *(void *)(a1 + 488) = *(void *)(a2 + 488);
  *(unsigned char *)(a1 + 496) = *(unsigned char *)(a2 + 496);
  uint64_t v24 = *(void *)(a2 + 504);
  *(unsigned char *)(a1 + 512) = *(unsigned char *)(a2 + 512);
  *(void *)(a1 + 504) = v24;
  *(unsigned char *)(a1 + 513) = *(unsigned char *)(a2 + 513);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
LABEL_15:
  *(unsigned char *)(a1 + 514) = v4[201];
  *(unsigned char *)(a1 + 515) = v4[202];
  return a1;
}

uint64_t outlined destroy of ConnectionPolicy(uint64_t a1)
{
  return a1;
}

uint64_t outlined destroy of ConnectionPolicyRoute(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy516_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x204uLL);
}

uint64_t assignWithTake for ConnectionConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (unsigned char *)(a2 + 313);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(unsigned char *)(a1 + 97) = *(unsigned char *)(a2 + 97);
  *(unsigned char *)(a1 + 98) = *(unsigned char *)(a2 + 98);
  *(unsigned char *)(a1 + 99) = *(unsigned char *)(a2 + 99);
  uint64_t v10 = *(void **)(a1 + 104);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);

  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(unsigned char *)(a1 + 113) = *(unsigned char *)(a2 + 113);
  *(unsigned char *)(a1 + 114) = *(unsigned char *)(a2 + 114);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  uint64_t v11 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 192);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = v13;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 200) = *(unsigned char *)(a2 + 200);
  *(unsigned char *)(a1 + 201) = *(unsigned char *)(a2 + 201);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(unsigned char *)(a1 + 248) = *(unsigned char *)(a2 + 248);
  *(unsigned char *)(a1 + 264) = *(unsigned char *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(unsigned char *)(a1 + 280) = *(unsigned char *)(a2 + 280);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(unsigned char *)(a1 + 296) = *(unsigned char *)(a2 + 296);
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(unsigned char *)(a1 + 312) = *(unsigned char *)(a2 + 312);
  *(unsigned char *)(a1 + 313) = *(unsigned char *)(a2 + 313);
  if (*(void *)(a1 + 392))
  {
    if (*(void *)(a2 + 392))
    {
      uint64_t v14 = *(void *)(a2 + 328);
      *(void *)(a1 + 320) = *(void *)(a2 + 320);
      *(void *)(a1 + 328) = v14;
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 336) = v4[23];
      *(unsigned char *)(a1 + 337) = v4[24];
      *(unsigned char *)(a1 + 338) = v4[25];
      *(unsigned char *)(a1 + 339) = v4[26];
      *(unsigned char *)(a1 + 340) = v4[27];
      *(unsigned char *)(a1 + 341) = v4[28];
      *(void *)(a1 + 344) = *(void *)(a2 + 344);
      *(unsigned char *)(a1 + 352) = *(unsigned char *)(a2 + 352);
      *(unsigned char *)(a1 + 368) = *(unsigned char *)(a2 + 368);
      *(void *)(a1 + 360) = *(void *)(a2 + 360);
      *(void *)(a1 + 376) = *(void *)(a2 + 376);
      *(unsigned char *)(a1 + 384) = *(unsigned char *)(a2 + 384);
      *(void *)(a1 + 392) = *(void *)(a2 + 392);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    outlined destroy of ConnectionPolicy(a1 + 320);
  }
  memcpy((void *)(a1 + 320), (const void *)(a2 + 320), 0x50uLL);
LABEL_6:
  if (*(void *)(a1 + 408) != 1)
  {
    uint64_t v15 = *(void *)(a2 + 408);
    if (v15 != 1)
    {
      *(void *)(a1 + 400) = *(void *)(a2 + 400);
      *(void *)(a1 + 408) = v15;
      swift_bridgeObjectRelease();
      uint64_t v16 = *(void *)(a2 + 424);
      *(void *)(a1 + 416) = *(void *)(a2 + 416);
      *(void *)(a1 + 424) = v16;
      swift_bridgeObjectRelease();
      *(_OWORD *)(a1 + 432) = *(_OWORD *)(a2 + 432);
      *(void *)(a1 + 448) = *(void *)(a2 + 448);
      swift_bridgeObjectRelease();
      uint64_t v17 = *(void *)(a2 + 464);
      *(void *)(a1 + 456) = *(void *)(a2 + 456);
      *(void *)(a1 + 464) = v17;
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 472) = v4[159];
      uint64_t v18 = *(void *)(a2 + 488);
      *(void *)(a1 + 480) = *(void *)(a2 + 480);
      *(void *)(a1 + 488) = v18;
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 496) = *(unsigned char *)(a2 + 496);
      *(void *)(a1 + 504) = *(void *)(a2 + 504);
      *(_WORD *)(a1 + 512) = *(_WORD *)(a2 + 512);
      goto LABEL_11;
    }
    outlined destroy of ConnectionPolicyRoute(a1 + 400);
  }
  memcpy((void *)(a1 + 400), (const void *)(a2 + 400), 0x72uLL);
LABEL_11:
  *(unsigned char *)(a1 + 514) = v4[201];
  *(unsigned char *)(a1 + 515) = v4[202];
  return a1;
}

uint64_t getEnumTagSinglePayload for ConnectionConfiguration(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 516))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 24);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ConnectionConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 504) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_DWORD *)(result + 512) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 516) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 516) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

void type metadata accessor for ConnectionConfiguration()
{
}

uint64_t OUTLINED_FUNCTION_2_30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_9_14()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_12()
{
  return type metadata accessor for URL();
}

uint64_t OUTLINED_FUNCTION_15_8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = v9;
  a9[9] = v10;
  return result;
}

uint64_t OUTLINED_FUNCTION_16_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_24_4()
{
  return *(void *)(v0 + 320);
}

uint64_t OUTLINED_FUNCTION_25_6()
{
  return *(void *)(v0 + 400);
}

BOOL specialized Collection.isEmpty.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v3 = (int)a1;
      uint64_t v2 = a1 >> 32;
      break;
    case 2uLL:
      uint64_t v3 = *(void *)(a1 + 16);
      uint64_t v2 = *(void *)(a1 + 24);
      break;
    case 3uLL:
      return v3 == v2;
    default:
      uint64_t v3 = 0;
      uint64_t v2 = BYTE6(a2);
      break;
  }
  return v3 == v2;
}

uint64_t CommunicationProtocolProtobuf.protobufDelegate.getter()
{
  uint64_t result = MEMORY[0x2611B37F0](v0 + 16);
  if (result)
  {
    uint64_t v2 = result;
    swift_getObjectType();
    uint64_t result = dynamic_cast_existential_1_conditional(v2);
    if (!result)
    {
      swift_unknownObjectRelease();
      return 0;
    }
  }
  return result;
}

uint64_t CommunicationProtocolProtobuf.__allocating_init(withDelegate:connectionQueue:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = swift_allocObject();
  CommunicationProtocolProtobuf.init(withDelegate:connectionQueue:)(a1, a2, a3);
  return v6;
}

uint64_t CommunicationProtocolProtobuf.init(withDelegate:connectionQueue:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v13 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v5 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = type metadata accessor for DispatchQoS();
  MEMORY[0x270FA5388](v10 - 8);
  OUTLINED_FUNCTION_0_1();
  *(void *)(v3 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_OWORD *)(v3 + 32) = xmmword_25D7906D0;
  *(_OWORD *)(v3 + 48) = xmmword_25D7906D0;
  type metadata accessor for OS_dispatch_queue();
  static DispatchQoS.unspecified.getter();
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v8, *MEMORY[0x263F8F130], v13);
  uint64_t v11 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();

  *(void *)(v4 + 64) = v11;
  *(_OWORD *)(v4 + 72) = xmmword_25D7906D0;
  *(void *)(v4 + 88) = 0;
  *(void *)(v4 + 24) = a2;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t CommunicationProtocolProtobuf.initialPayload(withBufferedInitialLength:forceReconnect:)()
{
  return 0;
}

uint64_t CommunicationProtocolProtobuf.updateBuffers(forInitialPayload:bufferedLength:forceReconnect:)()
{
  OUTLINED_FUNCTION_128();
  uint64_t v1 = v0[4];
  unint64_t v2 = v0[5];
  *((_OWORD *)v0 + 2) = xmmword_25D7906C0;
  outlined consume of Data?(v1, v2);
  OUTLINED_FUNCTION_128();
  uint64_t v3 = v0[6];
  unint64_t v4 = v0[7];
  *((_OWORD *)v0 + 3) = xmmword_25D7906C0;
  return outlined consume of Data?(v3, v4);
}

uint64_t CommunicationProtocolProtobuf.bufferGeneralData(data:)()
{
  OUTLINED_FUNCTION_2_31();
  if (*(void *)(v0 + 40) >> 60 != 15) {
    Data.append(_:)();
  }
  return swift_endAccess();
}

uint64_t CommunicationProtocolProtobuf.bufferUncompressedData(data:)()
{
  OUTLINED_FUNCTION_2_31();
  if (*(void *)(v0 + 56) >> 60 != 15) {
    Data.append(_:)();
  }
  return swift_endAccess();
}

uint64_t CommunicationProtocolProtobuf.getBufferedUncompressedDataToWrite()()
{
  OUTLINED_FUNCTION_128();
  unint64_t v1 = *(void *)(v0 + 56);
  if (v1 >> 60 == 15) {
    return 0;
  }
  uint64_t v2 = *(void *)(v0 + 48);
  switch(v1 >> 62)
  {
    case 1uLL:
      uint64_t v5 = (int)v2;
      uint64_t v6 = v2 >> 32;
      goto LABEL_7;
    case 2uLL:
      uint64_t v5 = *(void *)(v2 + 16);
      uint64_t v6 = *(void *)(v2 + 24);
LABEL_7:
      if (v5 == v6) {
        return 0;
      }
      outlined copy of Data._Representation(*(void *)(v0 + 48), *(void *)(v0 + 56));
      uint64_t v4 = *(void *)(v0 + 48);
      unint64_t v3 = *(void *)(v0 + 56);
      goto LABEL_10;
    case 3uLL:
      goto LABEL_4;
    default:
      unint64_t v3 = *(void *)(v0 + 56);
      uint64_t v4 = *(void *)(v0 + 48);
      if ((v1 & 0xFF000000000000) == 0)
      {
LABEL_4:
        outlined consume of Data?(*(void *)(v0 + 48), *(void *)(v0 + 56));
        return 0;
      }
LABEL_10:
      *(_OWORD *)(v0 + 48) = xmmword_25D7906C0;
      outlined consume of Data?(v4, v3);
      break;
  }
  return v2;
}

uint64_t CommunicationProtocolProtobuf.getBufferedOutputDataToWrite()()
{
  OUTLINED_FUNCTION_128();
  unint64_t v1 = *(void *)(v0 + 40);
  if (v1 >> 60 == 15) {
    return 0;
  }
  uint64_t v2 = *(void *)(v0 + 32);
  switch(v1 >> 62)
  {
    case 1uLL:
      uint64_t v5 = (int)v2;
      uint64_t v6 = v2 >> 32;
      goto LABEL_7;
    case 2uLL:
      uint64_t v5 = *(void *)(v2 + 16);
      uint64_t v6 = *(void *)(v2 + 24);
LABEL_7:
      if (v5 == v6) {
        return 0;
      }
      outlined copy of Data._Representation(*(void *)(v0 + 32), *(void *)(v0 + 40));
      uint64_t v4 = *(void *)(v0 + 32);
      unint64_t v3 = *(void *)(v0 + 40);
      goto LABEL_10;
    case 3uLL:
      goto LABEL_4;
    default:
      unint64_t v3 = *(void *)(v0 + 40);
      uint64_t v4 = *(void *)(v0 + 32);
      if ((v1 & 0xFF000000000000) == 0)
      {
LABEL_4:
        outlined consume of Data?(*(void *)(v0 + 32), *(void *)(v0 + 40));
        return 0;
      }
LABEL_10:
      *(_OWORD *)(v0 + 32) = xmmword_25D7906C0;
      outlined consume of Data?(v4, v3);
      break;
  }
  return v2;
}

Swift::Void __swiftcall CommunicationProtocolProtobuf.closeConnection(prepareForReconnect:)(Swift::Bool prepareForReconnect)
{
  if (!prepareForReconnect)
  {
    OUTLINED_FUNCTION_128();
    uint64_t v2 = *(void *)(v1 + 32);
    unint64_t v3 = *(void *)(v1 + 40);
    *(_OWORD *)(v1 + 32) = xmmword_25D7906D0;
    outlined consume of Data?(v2, v3);
  }
}

uint64_t CommunicationProtocolProtobuf.bytesAvailable(_:)(uint64_t a1, unint64_t a2)
{
  if (CommunicationProtocolProtobuf.protobufDelegate.getter())
  {
    BackgroundConnection.updateFirstByteReadTime()();
    swift_unknownObjectRelease();
  }
  uint64_t result = CommunicationProtocolProtobuf.protobufDelegate.getter();
  if (result)
  {
    BackgroundConnection.didReceiveObject(_:)(a1, a2);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t CommunicationProtocolProtobuf.compressData(_:)(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t CommunicationProtocolProtobuf.deinit()
{
  outlined destroy of weak ConnectionProviderDelegate?(v0 + 16);
  outlined consume of Data?(*(void *)(v0 + 32), *(void *)(v0 + 40));
  outlined consume of Data?(*(void *)(v0 + 48), *(void *)(v0 + 56));

  outlined consume of Data?(*(void *)(v0 + 72), *(void *)(v0 + 80));
  swift_release();
  return v0;
}

uint64_t CommunicationProtocolProtobuf.__deallocating_deinit()
{
  CommunicationProtocolProtobuf.deinit();

  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t type metadata accessor for CommunicationProtocolProtobuf()
{
  return self;
}

uint64_t protocol witness for CommunicationProtocol.init(withDelegate:connectionQueue:) in conformance CommunicationProtocolProtobuf@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = CommunicationProtocolProtobuf.__allocating_init(withDelegate:connectionQueue:)(a1, a2, a3);
  *a4 = result;
  return result;
}

uint64_t protocol witness for CommunicationProtocol.safetyNetBuffer.getter in conformance CommunicationProtocolProtobuf()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  outlined copy of Data?(v1, *(void *)(*(void *)v0 + 80));
  return v1;
}

uint64_t protocol witness for CommunicationProtocol.safetyNetBuffer.setter in conformance CommunicationProtocolProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 72);
  unint64_t v5 = *(void *)(*v2 + 80);
  *(void *)(v3 + 72) = a1;
  *(void *)(v3 + 80) = a2;
  return outlined consume of Data?(v4, v5);
}

uint64_t protocol witness for CommunicationProtocol.pingInfo.getter in conformance CommunicationProtocolProtobuf()
{
  return swift_retain();
}

uint64_t protocol witness for CommunicationProtocol.updateBuffers(forInitialPayload:bufferedLength:forceReconnect:) in conformance CommunicationProtocolProtobuf()
{
  return CommunicationProtocolProtobuf.updateBuffers(forInitialPayload:bufferedLength:forceReconnect:)();
}

uint64_t protocol witness for CommunicationProtocol.bufferGeneralData(data:) in conformance CommunicationProtocolProtobuf()
{
  return CommunicationProtocolProtobuf.bufferGeneralData(data:)();
}

uint64_t protocol witness for CommunicationProtocol.getBufferedOutputDataToWrite() in conformance CommunicationProtocolProtobuf()
{
  return CommunicationProtocolProtobuf.getBufferedOutputDataToWrite()();
}

uint64_t protocol witness for CommunicationProtocol.bufferUncompressedData(data:) in conformance CommunicationProtocolProtobuf()
{
  return CommunicationProtocolProtobuf.bufferUncompressedData(data:)();
}

uint64_t protocol witness for CommunicationProtocol.getBufferedUncompressedDataToWrite() in conformance CommunicationProtocolProtobuf()
{
  return CommunicationProtocolProtobuf.getBufferedUncompressedDataToWrite()();
}

void protocol witness for CommunicationProtocol.closeConnection(prepareForReconnect:) in conformance CommunicationProtocolProtobuf(Swift::Bool a1)
{
}

uint64_t protocol witness for CommunicationProtocol.bytesAvailable(_:) in conformance CommunicationProtocolProtobuf(uint64_t a1, unint64_t a2)
{
  return CommunicationProtocolProtobuf.bytesAvailable(_:)(a1, a2);
}

uint64_t protocol witness for CommunicationProtocol.compressData(_:) in conformance CommunicationProtocolProtobuf(uint64_t a1, unint64_t a2)
{
  return CommunicationProtocolProtobuf.compressData(_:)(a1, a2);
}

uint64_t OUTLINED_FUNCTION_2_31()
{
  return swift_beginAccess();
}

uint64_t DataProtocol.copyBytes(to:)()
{
  return MEMORY[0x270EEE298]();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return MEMORY[0x270EEE518]();
}

uint64_t URLComponents.url.getter()
{
  return MEMORY[0x270EEE520]();
}

uint64_t type metadata accessor for URLComponents()
{
  return MEMORY[0x270EEE610]();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x270EEE618]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x270EEE628]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x270EEE638]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x270EEE658]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x270EEE670]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x270EEE688]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x270EEFC10]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEFE20]();
}

Swift::String_optional __swiftcall URL.host(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = MEMORY[0x270EEFE50](percentEncoded);
  result.value._object = v2;
  result.value._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t URL.host.getter()
{
  return MEMORY[0x270EEFE60]();
}

uint64_t URL.port.getter()
{
  return MEMORY[0x270EEFE88]();
}

uint64_t URL.scheme.getter()
{
  return MEMORY[0x270EEFEE0]();
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t URL.appending<A>(path:directoryHint:)()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t Data.Deallocator._deallocator.getter()
{
  return MEMORY[0x270EEFFE0]();
}

uint64_t type metadata accessor for Data.Deallocator()
{
  return MEMORY[0x270EEFFE8]();
}

uint64_t Data.init(bytesNoCopy:count:deallocator:)()
{
  return MEMORY[0x270EF0018]();
}

uint64_t Data._Representation.init(_:count:)()
{
  return MEMORY[0x270EF00C0]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t Data.init(bytes:count:)()
{
  return MEMORY[0x270EF0198]();
}

uint64_t Data.init(count:)()
{
  return MEMORY[0x270EF01A8]();
}

uint64_t Data.count.getter()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t Data.append(_:count:)()
{
  return MEMORY[0x270EF01D8]();
}

uint64_t Data.append(_:)()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t Data.subdata(in:)()
{
  return MEMORY[0x270EF0218]();
}

uint64_t Data.advanced(by:)()
{
  return MEMORY[0x270EF0250]();
}

uint64_t Date.description(with:)()
{
  return MEMORY[0x270EF06E8]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x270EF0998]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t Date.init()()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t UUID.init(uuidString:)()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x270EF0C68]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x270EF0C88]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t static Locale.current.getter()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t _CFObject.hash(into:)()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t _CFObject.hashValue.getter()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t XPC_TYPE_DATA.getter()
{
  return MEMORY[0x270FA1988]();
}

uint64_t XPC_TYPE_DICTIONARY.getter()
{
  return MEMORY[0x270FA1A48]();
}

uint64_t POSIXErrorCode.rawValue.getter()
{
  return MEMORY[0x270FA2C20]();
}

uint64_t NWActivity.isActivated.getter()
{
  return MEMORY[0x270EF70A0]();
}

uint64_t NWActivity.parentActivity.setter()
{
  return MEMORY[0x270EF70B0]();
}

uint64_t type metadata accessor for NWActivity.CompletionReason()
{
  return MEMORY[0x270EF70B8]();
}

uint64_t NWActivity.label.getter()
{
  return MEMORY[0x270EF70C0]();
}

uint64_t NWActivity.token.getter()
{
  return MEMORY[0x270EF70C8]();
}

uint64_t NWActivity.init(domain:label:)()
{
  return MEMORY[0x270EF70D0]();
}

Swift::Void __swiftcall NWActivity.activate()()
{
}

uint64_t NWActivity.complete(reason:)()
{
  return MEMORY[0x270EF70E0]();
}

uint64_t type metadata accessor for NWActivity()
{
  return MEMORY[0x270EF70E8]();
}

uint64_t NWEndpoint.alternatePort.setter()
{
  return MEMORY[0x270EF7100]();
}

uint64_t NWEndpoint.Host.debugDescription.getter()
{
  return MEMORY[0x270EF7120]();
}

uint64_t type metadata accessor for NWEndpoint.Host()
{
  return MEMORY[0x270EF7128]();
}

uint64_t NWEndpoint.Host.init(_:)()
{
  return MEMORY[0x270EF7130]();
}

uint64_t NWEndpoint.Port.init(rawValue:)()
{
  return MEMORY[0x270EF7150]();
}

uint64_t NWEndpoint.Port.rawValue.getter()
{
  return MEMORY[0x270EF7158]();
}

uint64_t type metadata accessor for NWEndpoint.Port()
{
  return MEMORY[0x270EF7160]();
}

uint64_t type metadata accessor for NWEndpoint()
{
  return MEMORY[0x270EF7188]();
}

uint64_t type metadata accessor for NWInterface.InterfaceType()
{
  return MEMORY[0x270EF7260]();
}

uint64_t NWInterface.name.getter()
{
  return MEMORY[0x270EF7270]();
}

uint64_t NWInterface.type.getter()
{
  return MEMORY[0x270EF7278]();
}

uint64_t NWInterface.index.getter()
{
  return MEMORY[0x270EF7280]();
}

uint64_t type metadata accessor for NWInterface()
{
  return MEMORY[0x270EF7288]();
}

uint64_t NWConnection.identifier.getter()
{
  return MEMORY[0x270EF72F0]();
}

uint64_t NWConnection.currentPath.getter()
{
  return MEMORY[0x270EF72F8]();
}

uint64_t static NWConnection.ContentContext.defaultMessage.getter()
{
  return MEMORY[0x270EF7318]();
}

uint64_t type metadata accessor for NWConnection.ContentContext()
{
  return MEMORY[0x270EF7340]();
}

uint64_t type metadata accessor for NWConnection.SendCompletion()
{
  return MEMORY[0x270EF7348]();
}

uint64_t NWConnection.stateUpdateHandler.setter()
{
  return MEMORY[0x270EF7360]();
}

uint64_t NWConnection.EstablishmentReport.Resolution.endpointCount.getter()
{
  return MEMORY[0x270EF7368]();
}

uint64_t NWConnection.EstablishmentReport.Resolution.preferredEndpoint.getter()
{
  return MEMORY[0x270EF7370]();
}

uint64_t NWConnection.EstablishmentReport.Resolution.successfulEndpoint.getter()
{
  return MEMORY[0x270EF7378]();
}

uint64_t type metadata accessor for NWConnection.EstablishmentReport.Resolution.Source()
{
  return MEMORY[0x270EF7380]();
}

uint64_t NWConnection.EstablishmentReport.Resolution.source.getter()
{
  return MEMORY[0x270EF7388]();
}

uint64_t NWConnection.EstablishmentReport.Resolution.duration.getter()
{
  return MEMORY[0x270EF7390]();
}

uint64_t type metadata accessor for NWConnection.EstablishmentReport.Resolution()
{
  return MEMORY[0x270EF7398]();
}

uint64_t NWConnection.EstablishmentReport.handshakes.getter()
{
  return MEMORY[0x270EF73A0]();
}

uint64_t NWConnection.EstablishmentReport.resolutions.getter()
{
  return MEMORY[0x270EF73A8]();
}

uint64_t NWConnection.EstablishmentReport.proxyEndpoint.getter()
{
  return MEMORY[0x270EF73B0]();
}

uint64_t NWConnection.EstablishmentReport.proxyConfigured.getter()
{
  return MEMORY[0x270EF73B8]();
}

uint64_t NWConnection.EstablishmentReport.previousAttemptCount.getter()
{
  return MEMORY[0x270EF73C0]();
}

uint64_t NWConnection.EstablishmentReport.attemptStartedAfterInterval.getter()
{
  return MEMORY[0x270EF73C8]();
}

uint64_t NWConnection.EstablishmentReport.duration.getter()
{
  return MEMORY[0x270EF73D0]();
}

uint64_t NWConnection.EstablishmentReport.Handshake.definition.getter()
{
  return MEMORY[0x270EF73D8]();
}

uint64_t NWConnection.EstablishmentReport.Handshake.handshakeRTT.getter()
{
  return MEMORY[0x270EF73E0]();
}

uint64_t NWConnection.EstablishmentReport.Handshake.handshakeDuration.getter()
{
  return MEMORY[0x270EF73E8]();
}

uint64_t type metadata accessor for NWConnection.EstablishmentReport.Handshake()
{
  return MEMORY[0x270EF73F0]();
}

uint64_t NWConnection.EstablishmentReport.usedProxy.getter()
{
  return MEMORY[0x270EF73F8]();
}

uint64_t type metadata accessor for NWConnection.EstablishmentReport()
{
  return MEMORY[0x270EF7400]();
}

uint64_t NWConnection.viabilityUpdateHandler.setter()
{
  return MEMORY[0x270EF7408]();
}

uint64_t NWConnection.betterPathUpdateHandler.setter()
{
  return MEMORY[0x270EF7410]();
}

uint64_t NWConnection.requestEstablishmentReport(queue:completion:)()
{
  return MEMORY[0x270EF7418]();
}

uint64_t NWConnection.nw.getter()
{
  return MEMORY[0x270EF7420]();
}

uint64_t dispatch thunk of NWConnection.__allocating_init(to:using:)()
{
  return MEMORY[0x270EF7428]();
}

uint64_t NWConnection.send(content:contentContext:isComplete:completion:)()
{
  return MEMORY[0x270EF7438]();
}

uint64_t type metadata accessor for NWConnection.State()
{
  return MEMORY[0x270EF7448]();
}

uint64_t NWConnection.start(queue:)()
{
  return MEMORY[0x270EF7450]();
}

Swift::Void __swiftcall NWConnection.cancel()()
{
}

uint64_t NWConnection.receive(minimumIncompleteLength:maximumLength:completion:)()
{
  return MEMORY[0x270EF7468]();
}

uint64_t type metadata accessor for NWConnection()
{
  return MEMORY[0x270EF7488]();
}

uint64_t type metadata accessor for NWParameters.ServiceClass()
{
  return MEMORY[0x270EF74A8]();
}

uint64_t NWParameters.serviceClass.setter()
{
  return MEMORY[0x270EF74B0]();
}

uint64_t NWParameters.nw.getter()
{
  return MEMORY[0x270EF74E8]();
}

uint64_t NWParameters.__allocating_init(tls:tcp:)()
{
  return MEMORY[0x270EF74F8]();
}

uint64_t type metadata accessor for NWParameters()
{
  return MEMORY[0x270EF7510]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.keepaliveIdle.getter()
{
  return MEMORY[0x270EF75B0]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.keepaliveIdle.setter()
{
  return MEMORY[0x270EF75B8]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.enableFastOpen.setter()
{
  return MEMORY[0x270EF75C0]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.keepaliveCount.getter()
{
  return MEMORY[0x270EF75C8]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.keepaliveCount.setter()
{
  return MEMORY[0x270EF75D0]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.enableKeepalive.setter()
{
  return MEMORY[0x270EF75D8]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.keepaliveInterval.getter()
{
  return MEMORY[0x270EF75E0]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.keepaliveInterval.setter()
{
  return MEMORY[0x270EF75E8]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.connectionDropTime.setter()
{
  return MEMORY[0x270EF75F0]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.noDelay.setter()
{
  return MEMORY[0x270EF75F8]();
}

uint64_t NWProtocolTCP.Options.init()()
{
  return MEMORY[0x270EF7600]();
}

uint64_t type metadata accessor for NWProtocolTCP.Options()
{
  return MEMORY[0x270EF7608]();
}

uint64_t dispatch thunk of NWProtocolTLS.Options.securityProtocolOptions.getter()
{
  return MEMORY[0x270EF7610]();
}

uint64_t NWProtocolTLS.Options.init()()
{
  return MEMORY[0x270EF7618]();
}

uint64_t type metadata accessor for NWProtocolTLS.Options()
{
  return MEMORY[0x270EF7620]();
}

uint64_t NWProtocolDefinition.name.getter()
{
  return MEMORY[0x270EF7728]();
}

uint64_t NWPath.isExpensive.getter()
{
  return MEMORY[0x270EF7760]();
}

uint64_t NWPath.supportsDNS.getter()
{
  return MEMORY[0x270EF7768]();
}

uint64_t NWPath.supportsIPv4.getter()
{
  return MEMORY[0x270EF7770]();
}

uint64_t NWPath.supportsIPv6.getter()
{
  return MEMORY[0x270EF7778]();
}

uint64_t NWPath.isConstrained.getter()
{
  return MEMORY[0x270EF7780]();
}

uint64_t NWPath.availableInterfaces.getter()
{
  return MEMORY[0x270EF77A0]();
}

uint64_t NWPath.nw.getter()
{
  return MEMORY[0x270EF77A8]();
}

uint64_t type metadata accessor for NWPath.Status()
{
  return MEMORY[0x270EF77B8]();
}

uint64_t NWPath.status.getter()
{
  return MEMORY[0x270EF77C0]();
}

uint64_t NWPath.gateways.getter()
{
  return MEMORY[0x270EF77C8]();
}

uint64_t type metadata accessor for NWPath()
{
  return MEMORY[0x270EF77D0]();
}

uint64_t type metadata accessor for NWError()
{
  return MEMORY[0x270EF77E0]();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return MEMORY[0x270FA0970]();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return MEMORY[0x270FA0988]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t static DispatchQoS.userInteractive.getter()
{
  return MEMORY[0x270FA0A10]();
}

uint64_t static DispatchQoS.default.getter()
{
  return MEMORY[0x270FA0A18]();
}

uint64_t static DispatchQoS.utility.getter()
{
  return MEMORY[0x270FA0A28]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t DispatchData._bridgeToObjectiveC()()
{
  return MEMORY[0x270FA0A58]();
}

uint64_t static DispatchData._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270FA0A60]();
}

uint64_t DispatchData.init(bytes:)()
{
  return MEMORY[0x270FA0A68]();
}

uint64_t DispatchData.count.getter()
{
  return MEMORY[0x270FA0A70]();
}

uint64_t type metadata accessor for DispatchData()
{
  return MEMORY[0x270FA0A78]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t DispatchTime.advanced(by:)()
{
  return MEMORY[0x270FA0AD0]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t DispatchWorkItem.init(flags:block:)()
{
  return MEMORY[0x270FA0B60]();
}

uint64_t type metadata accessor for DispatchWorkItem()
{
  return MEMORY[0x270FA0B98]();
}

uint64_t + infix(_:_:)()
{
  return MEMORY[0x270FA0BC8]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1830]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x270F9D060]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F9D0A8]();
}

Swift::Void __swiftcall Dictionary._Variant.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x270F9D478]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t String.init(cString:encoding:)()
{
  return MEMORY[0x270EF1A58]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = MEMORY[0x270F9D5F8]();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x270F9D620]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t String.append<A>(contentsOf:)()
{
  return MEMORY[0x270F9D788]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x270F9D7C0]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return MEMORY[0x270F9D878](a1._countAndFlagsBits, a1._object);
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return MEMORY[0x270F9D880](a1._countAndFlagsBits, a1._object);
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x270F9D8E0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9DC50]();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1BD8]();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1C18]();
}

uint64_t static Double._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1C28]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t Int.init(truncating:)()
{
  return MEMORY[0x270EF1CD8]();
}

uint64_t static Int._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1CF8]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t OS_dispatch_group.wait(timeout:)()
{
  return MEMORY[0x270FA0C08]();
}

uint64_t OS_dispatch_group.notify(qos:flags:queue:execute:)()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t OS_dispatch_group.notify(queue:work:)()
{
  return MEMORY[0x270FA0C30]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t OS_dispatch_queue.label.getter()
{
  return MEMORY[0x270FA0DC8]();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t type metadata accessor for OS_dispatch_source.TimerFlags()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t static OS_dispatch_source.makeTimerSource(flags:queue:)()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return MEMORY[0x270FA0EA0]();
}

Swift::Void __swiftcall OS_dispatch_source.cancel()()
{
}

Swift::Void __swiftcall OS_dispatch_source.resume()()
{
}

uint64_t OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)()
{
  return MEMORY[0x270FA0F58]();
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)MEMORY[0x270EF2198](integerLiteral);
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t Optional.debugDescription.getter()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t StringProtocol.caseInsensitiveCompare<A>(_:)()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x270F9E800]();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return MEMORY[0x270F9E810]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x270F9E818]();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return MEMORY[0x270F9E830]();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return MEMORY[0x270F9E838]();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return MEMORY[0x270F9E840]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x270F9E848]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x270F9E858]();
}

uint64_t __CocoaSet.element(at:)()
{
  return MEMORY[0x270F9E860]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x270F9E870]();
}

uint64_t __CocoaSet.contains(_:)()
{
  return MEMORY[0x270F9E878]();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return MEMORY[0x270F9E880]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270F9E8C0](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x270F9E958]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9E960]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9E970]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x270F9EF08](isUnique, capacity);
}

uint64_t _NativeDictionary._delete(at:)()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x270F9F4C8](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t _getErrorEmbeddedNSError<A>(_:)()
{
  return MEMORY[0x270F9F730]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x270F9F778]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t static Hasher._hash(seed:bytes:count:)()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t UInt64.init(truncating:)()
{
  return MEMORY[0x270EF2790]();
}

NSNumber __swiftcall UInt64._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF27A0]();
}

uint64_t _Pointer.debugDescription.getter()
{
  return MEMORY[0x270FA0080]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AFBuildVersion()
{
  return MEMORY[0x270F0EC50]();
}

uint64_t AFDeviceName()
{
  return MEMORY[0x270F0EC88]();
}

uint64_t AFDeviceRegionCode()
{
  return MEMORY[0x270F0EC90]();
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return MEMORY[0x270F0ECE8]();
}

uint64_t AFDeviceSupportsWiFiLPASMode()
{
  return MEMORY[0x270F0ED00]();
}

uint64_t AFHasCellularData()
{
  return MEMORY[0x270F0ED60]();
}

uint64_t AFIsHorseman()
{
  return MEMORY[0x270F0EDC0]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x270F0EDD0]();
}

uint64_t AFProductName()
{
  return MEMORY[0x270F0EEE0]();
}

uint64_t AFProductType()
{
  return MEMORY[0x270F0EEE8]();
}

uint64_t AFProductVersion()
{
  return MEMORY[0x270F0EEF0]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

Boolean CFHTTPMessageAppendBytes(CFHTTPMessageRef message, const UInt8 *newBytes, CFIndex numBytes)
{
  return MEMORY[0x270EE2850](message, newBytes, numBytes);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return (CFDictionaryRef)MEMORY[0x270EE2858](message);
}

CFDataRef CFHTTPMessageCopyBody(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x270EE2860](message);
}

CFStringRef CFHTTPMessageCopyHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField)
{
  return (CFStringRef)MEMORY[0x270EE2868](message, headerField);
}

CFDataRef CFHTTPMessageCopySerializedMessage(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x270EE2880](message);
}

CFHTTPMessageRef CFHTTPMessageCreateEmpty(CFAllocatorRef alloc, Boolean isRequest)
{
  return (CFHTTPMessageRef)MEMORY[0x270EE2888](alloc, isRequest);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x270EE2890](alloc, requestMethod, url, httpVersion);
}

CFIndex CFHTTPMessageGetResponseStatusCode(CFHTTPMessageRef response)
{
  return MEMORY[0x270EE28A0](response);
}

Boolean CFHTTPMessageIsHeaderComplete(CFHTTPMessageRef message)
{
  return MEMORY[0x270EE28B0](message);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

uint64_t NetworkServiceProxyEnableInParameters()
{
  return MEMORY[0x270F4DCC8]();
}

uint64_t NetworkServiceProxySetServiceNameInParameters()
{
  return MEMORY[0x270F4DCE0]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x270F4B418]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x270F4B4C8]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x270F4B510]();
}

uint64_t WiFiNetworkIsCaptive()
{
  return MEMORY[0x270F4B7B0]();
}

uint64_t _AFPreferencesGetTuscanyStatus()
{
  return MEMORY[0x270F0F038]();
}

uint64_t _AFPreferencesShouldUseTFO()
{
  return MEMORY[0x270F0F058]();
}

uint64_t _AFPreferencesShowAllDialogVariantsEnabled()
{
  return MEMORY[0x270F0F060]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x270EE87C0]();
}

uint64_t _CTServerConnectionDormancySuspendAssertionCreateWithExpirationCB()
{
  return MEMORY[0x270EE87E0]();
}

uint64_t _CTServerForceFastDormancy()
{
  return MEMORY[0x270EE88D8]();
}

CFStringRef __CFStringMakeConstantString(const char *cStr)
{
  return (CFStringRef)MEMORY[0x270EE57F0](cStr);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C698](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C6A8](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B8](strm, *(void *)&level, version, *(void *)&stream_size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x270F9C748](strm, version, *(void *)&stream_size);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint64_t nw_array_get_count()
{
  return MEMORY[0x270EF7A88]();
}

uint64_t nw_array_get_object_at_index()
{
  return MEMORY[0x270EF7A90]();
}

uint64_t nw_connection_copy_attempted_endpoint_array()
{
  return MEMORY[0x270EF7B50]();
}

uint64_t nw_connection_copy_connected_remote_endpoint()
{
  return MEMORY[0x270EF7B68]();
}

nw_protocol_metadata_t nw_connection_copy_protocol_metadata(nw_connection_t connection, nw_protocol_definition_t definition)
{
  return (nw_protocol_metadata_t)MEMORY[0x270EF7B90](connection, definition);
}

uint64_t nw_connection_copy_tcp_info()
{
  return MEMORY[0x270EF7BA0]();
}

uint64_t nw_connection_fillout_tcp_statistics()
{
  return MEMORY[0x270EF7BE0]();
}

uint64_t nw_connection_multipath_copy_subflow_counts()
{
  return MEMORY[0x270EF7C48]();
}

uint64_t nw_connection_multipath_get_primary_subflow_interface_index()
{
  return MEMORY[0x270EF7C50]();
}

uint64_t nw_connection_multipath_get_subflow_count()
{
  return MEMORY[0x270EF7C58]();
}

uint64_t nw_connection_set_read_close_handler()
{
  return MEMORY[0x270EF7CE0]();
}

uint64_t nw_connection_set_write_close_handler()
{
  return MEMORY[0x270EF7D00]();
}

uint64_t nw_connection_uses_multipath()
{
  return MEMORY[0x270EF7D38]();
}

uint64_t nw_context_create()
{
  return MEMORY[0x270EF7DE0]();
}

uint64_t nw_context_set_isolate_protocol_cache()
{
  return MEMORY[0x270EF7DF8]();
}

uint64_t nw_context_set_isolate_protocol_stack()
{
  return MEMORY[0x270EF7E00]();
}

uint64_t nw_context_set_privacy_level()
{
  return MEMORY[0x270EF7E08]();
}

uint64_t nw_context_set_scheduling_mode()
{
  return MEMORY[0x270EF7E10]();
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x270EF7EB0](hostname, port);
}

uint64_t nw_endpoint_get_description()
{
  return MEMORY[0x270EF7F10]();
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return MEMORY[0x270EF8368](interface);
}

uint64_t nw_parameters_set_context()
{
  return MEMORY[0x270EF8610]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x270EF8620]();
}

void nw_parameters_set_expired_dns_behavior(nw_parameters_t parameters, nw_parameters_expired_dns_behavior_t expired_dns_behavior)
{
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x270EF8670]();
}

uint64_t nw_parameters_set_initial_data_payload()
{
  return MEMORY[0x270EF8678]();
}

void nw_parameters_set_multipath_service(nw_parameters_t parameters, nw_multipath_service_t multipath_service)
{
}

void nw_parameters_set_required_interface_type(nw_parameters_t parameters, nw_interface_type_t interface_type)
{
}

uint64_t nw_parameters_set_source_application()
{
  return MEMORY[0x270EF8748]();
}

uint64_t nw_parameters_set_tfo()
{
  return MEMORY[0x270EF8760]();
}

uint64_t nw_parameters_set_tls_session_id()
{
  return MEMORY[0x270EF8768]();
}

uint64_t nw_parameters_set_traffic_class()
{
  return MEMORY[0x270EF8770]();
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x270EF87B8]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x270EF87E8]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x270EF8808]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x270EF8840]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x270EF8A58](path, *(void *)&interface_type);
}

nw_protocol_definition_t nw_protocol_copy_tls_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x270EF8B78]();
}

sec_protocol_metadata_t nw_tls_copy_sec_protocol_metadata(nw_protocol_metadata_t metadata)
{
  return (sec_protocol_metadata_t)MEMORY[0x270EF95C8](metadata);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

tls_protocol_version_t sec_protocol_metadata_get_negotiated_tls_protocol_version(sec_protocol_metadata_t metadata)
{
  return (unsigned __int16)MEMORY[0x270EFDED8](metadata);
}

void sec_protocol_options_add_tls_application_protocol(sec_protocol_options_t options, const char *application_protocol)
{
}

void sec_protocol_options_set_max_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
}

void sec_protocol_options_set_tls_false_start_enabled(sec_protocol_options_t options, BOOL false_start_enabled)
{
}

void sec_protocol_options_set_tls_resumption_enabled(sec_protocol_options_t options, BOOL resumption_enabled)
{
}

void sec_protocol_options_set_tls_tickets_enabled(sec_protocol_options_t options, BOOL tickets_enabled)
{
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}